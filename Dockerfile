FROM elixir:1.11

RUN apt-get update

# this env var is only picked-up automatically by Elixir >= 1.10
# for previous versions, set it in mix.exs file in `project/0`:
#   deps_path: System.get_env("MIX_DEPS_PATH") || "./deps"
ENV MIX_DEPS_PATH=/deps
ENV MIX_HOME=/.mix

# build inside the image and not on the mounted volume to prevent
# recompiles with different Elixir versions
ENV MIX_BUILD_PATH=/opt/mix/build


COPY . /tmp
WORKDIR /tmp
ENV APP_HOME='/var/www/contrxir-api'

RUN mkdir -p ${APP_HOME} && \
    mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get && \
    mix deps.compile && \
    cp -R config \
          lib \
          priv \
          .formatter.exs \
          init.sh \
          mix.exs \
          mix.lock \
          ${APP_HOME} && \
    chmod +x init.sh

WORKDIR ${APP_HOME}
EXPOSE 4000