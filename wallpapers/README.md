# Wallpapers

Store your wallpaper images in this directory and use the `change_wallpaper.sh` script to change your macOS desktop background.

## Usage

```bash
./change_wallpaper.sh [wallpaper-name]
```

## Examples

```bash
# List available wallpapers
./change_wallpaper.sh

# Change to a specific wallpaper
./change_wallpaper.sh mountain
./change_wallpaper.sh sunset
./change_wallpaper.sh forest
```

## Supported Formats

- JPG/JPEG
- PNG
- GIF

## Adding Wallpapers

1. Add your wallpaper image files to this directory
2. Run the script with the filename (without extension):
   ```bash
   ./change_wallpaper.sh my-wallpaper
   ```

## Creating an Alias

Add this to your `~/.zshrc` for quick access:

```bash
alias wallpaper='~/dotfiles_new/wallpapers/change_wallpaper.sh'
```

Then you can use:
```bash
wallpaper mountain
wallpaper --help
```

## Tips

- Wallpaper names are case-insensitive
- The script searches for the first matching file
- Works with any image format supported by macOS
- Changes apply immediately to your desktop
