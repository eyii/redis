FROM redis
COPY redis.conf /usr/local/etc/redis/redis.conf
RUN ln -s /usr/local/bin/redis-cli /usr/local/bin/rc
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone
RUN chmod 777 /usr/local/etc/redis/redis.conf
CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]
