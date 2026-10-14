DROP DATABASE IF EXISTS salon;
CREATE DATABASE salon;

\connect salon

CREATE TABLE public.customers (
    customer_id SERIAL PRIMARY KEY,
    phone VARCHAR(20) UNIQUE NOT NULL,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE public.services (
    service_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE public.appointments (
    appointment_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES public.customers(customer_id),
    service_id INT NOT NULL REFERENCES public.services(service_id),
    "time" VARCHAR(20) NOT NULL
);

INSERT INTO public.services (name) VALUES ('cut');
INSERT INTO public.services (name) VALUES ('color');
INSERT INTO public.services (name) VALUES ('perm');
INSERT INTO public.services (name) VALUES ('style');
INSERT INTO public.services (name) VALUES ('trim');

INSERT INTO public.customers (phone, name) VALUES ('555-555-5555', 'Fabio');

INSERT INTO public.appointments (customer_id, service_id, "time") VALUES (1, 1, '10:30');
INSERT INTO public.appointments (customer_id, service_id, "time") VALUES (1, 2, '11am');
