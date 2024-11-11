FROM postgres:16

# Add custom configuration files if needed
COPY ./custom-config/postgresql.conf /etc/postgresql/postgresql.conf
# COPY ./custom-config/pg_hba.conf /etc/postgresql/pg_hba.conf
# COPY init.sql /docker-entrypoint-initdb.d/

ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD password
ENV POSTGRES_DB testing

# Expose the PostgreSQL port
EXPOSE 5432

# Start PostgreSQL
CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]

# docker build -t pgsql-test:latest .
# docker tag pgsql-test:latest whoamiken/pgsql-test:latest 
# docker push whoamiken/pgsql-test:latest