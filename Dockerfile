# Building Website 
FROM docker.io/ruby:3.4.7 AS builder

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

RUN JEKYLL_ENV=production bundle exec jekyll build

# Serving the Website
FROM docker.io/nginx:alpine

COPY --from=builder /app/_site /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
