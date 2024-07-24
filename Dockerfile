FROM ruby:3.3.3
RUN apt-get update -qq && \
    apt-get install -y g++ make libpq-dev

# Install application gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy application code
WORKDIR /app
COPY . .

# Start the server by default, this can be overwritten at runtime
EXPOSE 3000
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]
