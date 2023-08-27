FROM elixir:1.8

ARG HTTPS_PROXY=https://127.0.0.1:3128                                                                                                  1m 16s 19:37:50
ARG HTTP_PROXY=http://127.0.0.1:3128

RUN apt-get update

COPY . /tmp
WORKDIR /tmp
ENV APP_HOME='/var/www/contrxir-api' \
    USERNAME='root' \
    UID='1000'

RUN mkdir -p ${APP_HOME} && \
    mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get && \
    cp -R config \
          lib \
          priv \
          .formatter.exs \
          mix.exs \
          mix.lock \
          init.sh \
          ${APP_HOME} && \
    chown -R root ${APP_HOME}

EXPOSE 4000