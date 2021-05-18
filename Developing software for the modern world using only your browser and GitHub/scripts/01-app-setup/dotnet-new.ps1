dotnet new gitignore --force

mkdir src
cd src
mkdir webapp
cd webapp

dotnet new mvc --language "C#" --auth Individual --framework "net5.0" --use-local-db

dotnet watch run
