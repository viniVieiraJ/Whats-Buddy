echo "> transpiling..."
npm run build

echo
echo "> Successfully build "

echo
echo "> Starting application..."
echo

ts-node --files --transpile-only ./src/main.js