
DOTPATH=~/darkpower

for f in .??*
do
  ["$F" = ".git"]&& continue

  ln -snfv "$DOTPATH/$f" "$HOME"/"$f"
done
