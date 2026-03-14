#!/bin/bash
set -euo pipefail

# take in one argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <module_name>"
    exit 1
fi

module_name=$1
module_path="modules/$module_name"
modules_default="modules/default.nix"
user_file="users/mtlks.nix"

export MODULE_NAME="$module_name"

# check if the module already exists
if [ -d "$module_path" ]; then
    echo "Module '$module_name' already exists."
    exit 1
fi

# create the module directory
mkdir -p "$module_path"

# copy the module file
cp "modules/template.nix" "$module_path/default.nix"

# replace the placeholder MODULE_NAME in the template with the module name
sed -i "s/MODULE_NAME/$module_name/g" "$module_path/default.nix"

# add the module to modules/default.nix and users/mtlks.nix in alphabetical order
# Pure shell implementation using sed, sort, and awk

# Update modules/default.nix
if [ -f "$modules_default" ]; then
  start=$(grep -n "imports[[:space:]]*=\s*\[" "$modules_default" | cut -d: -f1 || true)
  if [ -n "$start" ]; then
    end=$(awk "NR>$start && /\];/ {print NR; exit}" "$modules_default")
    tmpfile=$(mktemp)
    head -n "$start" "$modules_default" > "$tmpfile"

    # extract current entries, trim and remove empty lines
    sed -n "$((start+1)),$((end-1))p" "$modules_default" | sed -e 's/^[ \t]*//' -e 's/[ \t]*$//' -e '/^$/d' > "$tmpfile.items"

    entry="./$module_name"
    if ! grep -Fxq "$entry" "$tmpfile.items"; then
      printf "%s\n" "$entry" >> "$tmpfile.items"
    fi

    sort -f "$tmpfile.items" > "$tmpfile.items.sorted"
    while IFS= read -r line; do printf "    %s\n" "$line" >> "$tmpfile"; done < "$tmpfile.items.sorted"

    # append closing and rest of file
    sed -n "${end}p" "$modules_default" >> "$tmpfile"
    sed -n "$((end+1)),\$p" "$modules_default" >> "$tmpfile"

    mv "$tmpfile" "$modules_default"
    rm -f "$tmpfile.items" "$tmpfile.items.sorted" || true
  fi
fi

# Update users/mtlks.nix
if [ -f "$user_file" ]; then
  start=$(grep -n "config\.modules[[:space:]]*=\s*{" "$user_file" | cut -d: -f1 || true)
  if [ -n "$start" ]; then
    end=$(awk "NR>$start && /\};/ {print NR; exit}" "$user_file")
    tmpfile=$(mktemp)
    head -n "$start" "$user_file" > "$tmpfile"

    sed -n "$((start+1)),$((end-1))p" "$user_file" | sed -e 's/^[ \t]*//' -e 's/[ \t]*$//' -e '/^$/d' > "$tmpfile.mods"

    entry="$module_name.enable = true;"
    if ! grep -E "^$module_name\.enable" -q "$user_file" 2>/dev/null; then
      printf "%s\n" "$entry" >> "$tmpfile.mods"
    fi

    sort -f "$tmpfile.mods" > "$tmpfile.mods.sorted"
    while IFS= read -r line; do printf "    %s\n" "$line" >> "$tmpfile"; done < "$tmpfile.mods.sorted"

    sed -n "${end}p" "$user_file" >> "$tmpfile"
    sed -n "$((end+1)),\$p" "$user_file" >> "$tmpfile"

    mv "$tmpfile" "$user_file"
    rm -f "$tmpfile.mods" "$tmpfile.mods.sorted" || true
  fi
fi

echo "Module '$module_name' added and registered in $modules_default and $user_file."
