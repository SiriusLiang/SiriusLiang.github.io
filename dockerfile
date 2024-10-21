FROM docsify
EXPOSE 3000/tcp
ENTRYPOINT docsify serve .
