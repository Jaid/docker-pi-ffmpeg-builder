# syntax=docker/dockerfile:1

FROM alpine:3.16

RUN apk update
RUN apk add

ARG userName=app
ARG groupName=$userName
ARG userId=1000
ARG groupId=1000

# https://github.com/nodejs/docker-node/blob/main/docs/BestPractices.md#non-root-user
RUN addgroup -S --gid $groupId $groupName
RUN adduser --disabled-password --gecos '' --uid $userId --ingroup $groupName --home /home/$userName --shell /bin/sh $userName

COPY --chown=$userId:$groupId ./retry.ash /home/$userName/bin/retry.ash
COPY --chown=$userId:$groupId ./run.ash /home/$userName/bin/run.ash
