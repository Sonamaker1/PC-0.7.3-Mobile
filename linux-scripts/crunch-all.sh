shopt -s nullglob
for i in *.png; do
    crunch $i
done

