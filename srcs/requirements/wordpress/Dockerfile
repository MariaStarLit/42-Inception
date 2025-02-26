FROM debian:12

RUN apt-get -y update && apt-get upgrade -y
RUN apt-get install -y mariadb-client

COPY ./conf/wordpess-script.sh /wordpess-script.sh
RUN chmod +x /wordpess-script.sh

ENTRYPOINT ["./wordpess-script.sh"]

# ENTRYPOINT ["/bin/bash"]