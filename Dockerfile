FROM codercom/code-server:latest

# Debian 10
# See: https://docs.microsoft.com/en-us/dotnet/core/install/linux-package-manager-debian10

# dependencies
RUN sudo apt-get update
RUN sudo apt-get install -y apt-utils
RUN sudo apt-get install -y gnupg
RUN sudo apt-get install -y wget

# Get repos and keys
RUN wget -O - https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
RUN sudo mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
RUN wget https://packages.microsoft.com/config/debian/10/prod.list
RUN sudo mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
RUN sudo chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg
RUN sudo chown root:root /etc/apt/sources.list.d/microsoft-prod.list

# Install .Net Core SDK 3.1
RUN sudo apt-get update
RUN sudo apt-get install -y apt-transport-https
RUN sudo apt-get update
RUN sudo apt-get install -y dotnet-sdk-3.1

# Install ASP.Net Core Runtime 3.1
RUN sudo apt-get update
RUN sudo apt-get install -y apt-transport-https
RUN sudo apt-get update
RUN sudo apt-get install -y aspnetcore-runtime-3.1

# Install .Net Core Runtime 3.1
RUN sudo apt-get update
RUN sudo apt-get install -y apt-transport-https
RUN sudo apt-get update
RUN sudo apt-get install -y dotnet-runtime-3.1
