FROM golang:alpine
MAINTAINER Jermine <Jermine.hu@qq.com>
RUN apk  update && apk add libssh2 git ;\
     go version ;\
     go env ;\
     go get github.com/fatedier/frp ;\
     cd /go/src/github.com/fatedier/frp ;\
	make ;\
	ls
FROM scratch
MAINTAINER Jermine <Jermine.hu@qq.com>
COPY --from=0 /root/go/src/github.com/fatedier/frp/bin/frps /app/frps
ENV PATH=$PATH:/app
EXPOSE 80 443 6000 7000 7500
ENTRYPOINT [ "frps" ]
