FROM google/dart:2.2 AS builder
ENV PATH="${PATH}:/root/.pub-cache/bin"
RUN pub global activate aqueduct
WORKDIR /app
COPY middleman/pubspec.yaml /app/
RUN pub get
COPY middleman/ /app/

RUN pub get
EXPOSE 8888
ENTRYPOINT ["pub", "run", "aqueduct:aqueduct", "serve", "--port", "8888"]