FROM eu.gcr.io/tradeshift-base/gundeck@sha256:f6ab725da3d302285ac162c540414926aa527a4545702b5b5a5b12b1c40f7ee6 as base

FROM alpine
COPY --from=base /gundeck /gundeck
ADD entrypoint.sh /entrypoint.sh
RUN apk add bash
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
