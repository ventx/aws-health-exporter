FROM golang:alpine

WORKDIR /go/src/app
RUN apk --update --no-cache add git
RUN go get -d -v github.com/Jimdo/aws-health-exporter
RUN go install -v github.com/Jimdo/aws-health-exporter
RUN rm -r /go/src

ENTRYPOINT [ "/go/bin/aws-health-exporter" ]
EXPOSE 9383
