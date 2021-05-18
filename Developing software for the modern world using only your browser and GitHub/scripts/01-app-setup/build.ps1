dotnet restore /nologo

dotnet build --configuration release --no-restore /nologo

dotnet publish --configuration release --no-restore --no-build --output "../../artifacts/webapp" --verbosity normal /nologo /property:GenerateFullPaths=true

docker build -t webapp:dev -f build/dockerfile .
