FROM gradle:latest

# Este dockerfile asume que es un proyecto de spring boot
# ejecutable con bootRun, y que utiliza el puerto 8080

RUN mkdir -p /home/gradle/project

COPY --chown=gradle:gradle ./ /home/gradle/project

WORKDIR /home/gradle/project

EXPOSE 9092

CMD [ "gradle", "bootRun" ]
