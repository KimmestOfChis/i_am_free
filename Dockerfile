# Define the base image
FROM elixir:1.15.4-alpine

# Install hex and rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# Set the working directory inside the Docker image
WORKDIR /app

# Copy the mix.exs and mix.lock files into the image 
# These files handle dependencies for Elixir projects
COPY mix.exs mix.lock ./

# Install dependencies
RUN mix deps.get

# Compile dependencies
RUN mix deps.compile

# Copy the rest of the application code into the app directory
COPY . .

# Compile the project
RUN mix compile

# Expose port 4000 for the application
EXPOSE 4000

# Define the command to start the app
CMD ["mix", "phx.server"]