FROM node:17

WORKDIR /usr/src/app

ENV DEBIAN_FRONTEND noninteractive

# Update the package list
RUN apt-get update

# Install necessary packages
RUN apt-get -y install gcc mono-mcs
RUN apt-get -y install python3

# Clean up package lists
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

ENV java=/usr/lib/jvm/java-8-openjdk-amd64/

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8080
CMD ["npm", "run", "start"]
