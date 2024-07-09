FROM ghost:5-alpine
RUN gosu node mkdir -p /tmp/ghost-storage-adapter-s3 && \
    gosu node yarn add --cwd /tmp/ghost-storage-adapter-s3 ghost-storage-adapter-s3 && \
    gosu node cp -r /tmp/ghost-storage-adapter-s3/node_modules/ghost-storage-adapter-s3 $GHOST_INSTALL/current/core/server/adapters/storage/s3 && \
    gosu node rm -r /tmp/ghost-storage-adapter-s3 && \
    gosu node yarn add aws-sdk ghost-storage-base