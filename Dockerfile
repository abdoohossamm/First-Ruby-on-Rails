FROM ruby:3.0.6-buster
WORKDIR /app
COPY . /app
RUN apt install curl
RUN curl -fsSL https://deb.nodesource.com/setup_14.x
RUN apt-get update
RUN apt-get install -y nodejs
RUN apt-get install -y npm
RUN gem install 'rails:7.0.3.1' 'bundle'
RUN npm install --global yarn
ENTRYPOINT ["sh", "/app/entrypoint.sh"]
