--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE countries (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    foundation_year integer NOT NULL,
    disintegration_year integer,
    government_id integer NOT NULL,
    population integer NOT NULL,
    CONSTRAINT check_disintegration_year CHECK ((disintegration_year < 2018)),
    CONSTRAINT check_foundation_year CHECK ((foundation_year < 2018)),
    CONSTRAINT check_population CHECK ((population > '-1'::integer))
);


ALTER TABLE countries OWNER TO postgres;

--
-- Name: countries_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE countries_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE countries_sequence OWNER TO postgres;

--
-- Name: engines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE engines (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    power real NOT NULL,
    CONSTRAINT check_engines_power CHECK ((power > (0)::double precision))
);


ALTER TABLE engines OWNER TO postgres;

--
-- Name: engines_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE engines_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE engines_sequence OWNER TO postgres;

--
-- Name: fuel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE fuel (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE fuel OWNER TO postgres;

--
-- Name: fuel_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE fuel_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fuel_sequence OWNER TO postgres;

--
-- Name: fuel_to_engine; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE fuel_to_engine (
    connection_id integer NOT NULL,
    fuel_id integer NOT NULL,
    engine_id integer NOT NULL
);


ALTER TABLE fuel_to_engine OWNER TO postgres;

--
-- Name: fuel_to_engine_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE fuel_to_engine_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fuel_to_engine_sequence OWNER TO postgres;

--
-- Name: governments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE governments (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE governments OWNER TO postgres;

--
-- Name: governments_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE governments_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE governments_sequence OWNER TO postgres;

--
-- Name: tank_classes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tank_classes (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE tank_classes OWNER TO postgres;

--
-- Name: tank_classes_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tank_classes_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tank_classes_sequence OWNER TO postgres;

--
-- Name: tanks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tanks (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    class_id integer NOT NULL,
    main_gun_caliber real NOT NULL,
    crew_number integer NOT NULL,
    engine_id integer NOT NULL,
    country_id integer NOT NULL,
    CONSTRAINT check_tanks_crew_number CHECK ((crew_number > 0)),
    CONSTRAINT check_tanks_main_gun_caliber CHECK ((main_gun_caliber > (0)::double precision))
);


ALTER TABLE tanks OWNER TO postgres;

--
-- Name: tanks_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tanks_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tanks_sequence OWNER TO postgres;

--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY countries (id, name, foundation_year, disintegration_year, government_id, population) FROM stdin;
1	Czechoslovakia	1918	1993	9	0
2	USSR	1922	1991	3	0
3	China	1949	\N	3	1380083000
4	DPRK	1948	\N	6	24720407
5	West Germany	1949	\N	3	82175684
6	Third Reich	1933	1945	7	0
7	Italy	1861	\N	3	60795612
8	Ukraine	1918	\N	8	42353130
9	USA	1776	\N	2	325850000
10	RF	1991	\N	8	146804372
11	France	1958	\N	4	66991000
12	Japan	-660	\N	2	325850000
13	Israel	1948	\N	3	8680000
14	Sweden	1397	\N	5	10042928
15	Great Britain	1922	\N	1	63395574
\.


--
-- Name: countries_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('countries_sequence', 15, true);


--
-- Data for Name: engines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY engines (id, name, power) FROM stdin;
1	M-50T	1050
2	V-2CH	850
3	AV-1790-5B	810
4	V-shaped 12-cylinder diesel	520
5	V-shaped Daimler	210
6	V-shaped 10-cylinder diesel MB838	830
7	V-shaped 12-cylinder diesel MB517	1250
8	Maybach HL210P30	650
9	Scania-Vabis 607	340
10	V-5	600
11	V-12-6	750
12	M-40	1200
\.


--
-- Name: engines_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('engines_sequence', 12, true);


--
-- Data for Name: fuel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY fuel (id, name) FROM stdin;
1	Diesel
2	74-octane gasoline
3	80-octane gasoline
\.


--
-- Name: fuel_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('fuel_sequence', 3, true);


--
-- Data for Name: fuel_to_engine; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY fuel_to_engine (connection_id, fuel_id, engine_id) FROM stdin;
1	1	1
2	1	2
3	1	4
4	1	6
5	1	7
6	1	10
7	1	11
8	1	12
9	2	5
10	2	8
11	2	9
12	3	3
\.


--
-- Name: fuel_to_engine_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('fuel_to_engine_sequence', 12, true);


--
-- Data for Name: governments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY governments (id, name) FROM stdin;
1	Parliamentary monarchy
2	Presidential republic
3	Parliamentary republic
4	Mixed Republic
5	A constitutional monarchy
6	The Socialist Republic
7	Autocracy
8	Parliamentary-presidential republic
9	Federal Republic
\.


--
-- Name: governments_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('governments_sequence', 9, true);


--
-- Data for Name: tank_classes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tank_classes (id, name) FROM stdin;
1	Small tanks
2	Light tanks
3	Medium tanks
4	Heavy tanks
5	Superheavy tanks
\.


--
-- Name: tank_classes_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tank_classes_sequence', 5, true);


--
-- Data for Name: tanks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tanks (id, name, class_id, main_gun_caliber, crew_number, engine_id, country_id) FROM stdin;
1	IS-7	4	130	5	1	2
2	KV-3	4	107	6	2	2
3	M47	3	90	5	3	9
4	Type 59	3	100	4	4	3
5	Type 62	2	85	4	4	3
6	Flying Elephant	5	57	10	5	15
7	Leopard 1	3	105	4	6	5
8	Maus	5	128	6	7	6
9	Tiger	4	88	5	8	6
10	Type 61	3	90	4	4	12
11	Strv 74	3	75	4	9	14
12	Ti-67	3	100	4	4	13
13	A-44	3	107	5	10	2
14	T-10	4	122	4	11	2
15	KV-4	5	107	9	12	2
\.


--
-- Name: tanks_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tanks_sequence', 15, true);


--
-- Name: countries countries_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_name_key UNIQUE (name);


--
-- Name: engines engines_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY engines
    ADD CONSTRAINT engines_name_key UNIQUE (name);


--
-- Name: fuel fuel_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fuel
    ADD CONSTRAINT fuel_name_key UNIQUE (name);


--
-- Name: governments governments_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY governments
    ADD CONSTRAINT governments_name_key UNIQUE (name);


--
-- Name: countries pk_countries_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT pk_countries_id PRIMARY KEY (id);


--
-- Name: engines pk_engines_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY engines
    ADD CONSTRAINT pk_engines_id PRIMARY KEY (id);


--
-- Name: fuel pk_fuel_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fuel
    ADD CONSTRAINT pk_fuel_id PRIMARY KEY (id);


--
-- Name: fuel_to_engine pk_fuel_to_engine_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fuel_to_engine
    ADD CONSTRAINT pk_fuel_to_engine_id PRIMARY KEY (connection_id);


--
-- Name: governments pk_governments_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY governments
    ADD CONSTRAINT pk_governments_id PRIMARY KEY (id);


--
-- Name: tank_classes pk_tank_classes_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tank_classes
    ADD CONSTRAINT pk_tank_classes_id PRIMARY KEY (id);


--
-- Name: tanks pk_tanks_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tanks
    ADD CONSTRAINT pk_tanks_id PRIMARY KEY (id);


--
-- Name: tank_classes tank_classes_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tank_classes
    ADD CONSTRAINT tank_classes_name_key UNIQUE (name);


--
-- Name: tanks tanks_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tanks
    ADD CONSTRAINT tanks_name_key UNIQUE (name);


--
-- Name: countries_disintegration_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX countries_disintegration_idx ON countries USING btree (disintegration_year);


--
-- Name: countries_foundation_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX countries_foundation_idx ON countries USING btree (foundation_year);


--
-- Name: countries_government_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX countries_government_idx ON countries USING btree (government_id);


--
-- Name: countries_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX countries_id_idx ON countries USING btree (id);


--
-- Name: countries_population_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX countries_population_idx ON countries USING btree (population);


--
-- Name: engines_power_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX engines_power_idx ON engines USING btree (power);


--
-- Name: government_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX government_name ON governments USING btree (name);


--
-- Name: tanks_class_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tanks_class_idx ON tanks USING btree (class_id);


--
-- Name: tanks_country_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tanks_country_idx ON tanks USING btree (country_id);


--
-- Name: tanks_crew_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tanks_crew_idx ON tanks USING btree (crew_number);


--
-- Name: tanks_engine_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tanks_engine_idx ON tanks USING btree (engine_id);


--
-- Name: countries fk_countries_government_id_governments_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT fk_countries_government_id_governments_id FOREIGN KEY (government_id) REFERENCES governments(id);


--
-- Name: fuel_to_engine fk_fuel_to_engine_engines_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fuel_to_engine
    ADD CONSTRAINT fk_fuel_to_engine_engines_id FOREIGN KEY (engine_id) REFERENCES engines(id);


--
-- Name: fuel_to_engine fk_fuel_to_engine_fuel_id_fuel_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fuel_to_engine
    ADD CONSTRAINT fk_fuel_to_engine_fuel_id_fuel_id FOREIGN KEY (fuel_id) REFERENCES fuel(id);


--
-- Name: tanks fk_tanks_class_id_tank_classes_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tanks
    ADD CONSTRAINT fk_tanks_class_id_tank_classes_id FOREIGN KEY (class_id) REFERENCES tank_classes(id);


--
-- Name: tanks fk_tanks_country_id_countries_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tanks
    ADD CONSTRAINT fk_tanks_country_id_countries_id FOREIGN KEY (country_id) REFERENCES countries(id);


--
-- Name: tanks fk_tanks_engine_id_engines_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tanks
    ADD CONSTRAINT fk_tanks_engine_id_engines_id FOREIGN KEY (engine_id) REFERENCES engines(id);


--
-- PostgreSQL database dump complete
--

