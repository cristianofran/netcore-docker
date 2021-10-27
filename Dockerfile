# Define  a imagem base
FROM mcr.microsoft.com/dotnet/aspnet:3.1

# Define o mantededor da imagem
LABEL maintainer="LeS.Dev"

# Informa ao Docker para copiar a pasta do computador
# para uma pasta no contêiner.
COPY bin/Release/netcoreapp3.1/publish/ App/

# Altera o diretório atual no contêiner
WORKDIR /App

# Quando o contêiner é iniciado, o comando é executado
ENTRYPOINT ["dotnet", "NetCore.Docker.dll"]