FROM amd64/alpine:latest as builde
WORKDIR /root
RUN apk add --no-cache git make build-base && \
    git clone --branch master --single-branch https://github.com/Wind4/vlmcsd.git && \
    cd vlmcsd/ && \
    make
FROM amd64/alpine:latest
WORKDIR /root
COPY --from=builde /root/vlmcsd/bin/vlmcsd /usr/bin/vlmcsd
CMD [ "/usr/bin/vlmcsd", "-D", "-d" ]
EXPOSE 1688/tcp
