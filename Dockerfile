FROM alpine as build
MAINTAINER Max Schoening <max@max.wtf>

ENV HUGO_VERSION 0.45.1
ENV HUGO_BINARY hugo_${HUGO_VERSION}_linux-64bit

RUN mkdir -p /tmp/hugo/
ADD https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}.tar.gz /tmp/hugo/
RUN tar xzf /tmp/hugo/${HUGO_BINARY}.tar.gz -C /tmp/hugo/

FROM scratch

COPY --from=build /tmp/hugo/hugo /
VOLUME /workspace

WORKDIR /workspace
EXPOSE 1313
ENTRYPOINT ["/hugo"]
