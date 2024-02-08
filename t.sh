for file in ./sources/{.,}*; do
	if [ -f "$file" ]; then
		filename=$(basename "$file")
		cp -r $file ~/test/
		echo $file
	fi
done

