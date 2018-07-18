FROM gradle:latest

# Este dockerfile asume que es un proyecto de spring boot
# ejecutable con bootRun, y que utiliza el puerto 8080

RUN mkdir -p /home/gradle/project

COPY ./ /home/gradle/project

WORKDIR /home/gradle/project

EXPOSE 9090

CMD [ "gradle", "bootRun" ]
