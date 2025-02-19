
DOTPATH="$HOME/darkpower"

for f in .??*
do
  [ "$f" = ".git" ] && continue
  [ "$f" = ".gitignore" ] && continue
  [ "$f" = ".config" ] && ln -snfv "$DOTPATH/$f/nvim" "$HOME/$f/nvim" && echo "installed nvim config" && continue
  echo "====="
  ln -snfv "$DOTPATH/$f" "$HOME"/"$f"
  echo "Installed $f"
done
