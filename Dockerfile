FROM elixir:1.15.4-alpine

RUN mix local.hex --force && \
    mix local.rebar --force

WORKDIR /app

COPY mix.exs mix.lock ./

RUN mix deps.get

RUN mix deps.compile

COPY . .

RUN mix compile

EXPOSE 4000

CMD ["mix", "phx.server"]