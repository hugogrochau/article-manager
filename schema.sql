--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

-- Started on 2016-06-15 22:13:57 BRT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE "ArticleManager";
--
-- TOC entry 2153 (class 1262 OID 16474)
-- Name: ArticleManager; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE "ArticleManager" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


\connect "ArticleManager"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- TOC entry 2154 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 1 (class 3079 OID 12360)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2155 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 16541)
-- Name: article; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE article (
    id integer NOT NULL,
    conference_id integer NOT NULL,
    title character varying(256) NOT NULL,
    abstract text,
    file_path character varying(256) NOT NULL,
    download_count integer DEFAULT 0
);


--
-- TOC entry 184 (class 1259 OID 16548)
-- Name: article_conference_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE article_conference_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2156 (class 0 OID 0)
-- Dependencies: 184
-- Name: article_conference_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE article_conference_id_seq OWNED BY article.conference_id;


--
-- TOC entry 185 (class 1259 OID 16550)
-- Name: article_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE article_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2157 (class 0 OID 0)
-- Dependencies: 185
-- Name: article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE article_id_seq OWNED BY article.id;


--
-- TOC entry 186 (class 1259 OID 16552)
-- Name: author_article; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE author_article (
    article_id integer NOT NULL,
    person_id integer NOT NULL
);


--
-- TOC entry 187 (class 1259 OID 16555)
-- Name: author_article_article_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE author_article_article_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2158 (class 0 OID 0)
-- Dependencies: 187
-- Name: author_article_article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE author_article_article_id_seq OWNED BY author_article.article_id;


--
-- TOC entry 181 (class 1259 OID 16534)
-- Name: conference; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE conference (
    id integer NOT NULL,
    issm integer,
    doi integer,
    place character varying(256),
    date date,
    name character varying(256)
);


--
-- TOC entry 182 (class 1259 OID 16539)
-- Name: conference_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE conference_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2159 (class 0 OID 0)
-- Dependencies: 182
-- Name: conference_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE conference_id_seq OWNED BY conference.id;


--
-- TOC entry 188 (class 1259 OID 16557)
-- Name: editor_conference; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE editor_conference (
    edition_id integer NOT NULL,
    person_id integer NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 16560)
-- Name: editor_edition_edition_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE editor_edition_edition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2160 (class 0 OID 0)
-- Dependencies: 189
-- Name: editor_edition_edition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE editor_edition_edition_id_seq OWNED BY editor_conference.edition_id;


--
-- TOC entry 190 (class 1259 OID 16562)
-- Name: person; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE person (
    email character varying(254) NOT NULL,
    name character varying(256) NOT NULL,
    id integer NOT NULL
);


--
-- TOC entry 191 (class 1259 OID 16623)
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2161 (class 0 OID 0)
-- Dependencies: 191
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE person_id_seq OWNED BY person.id;


--
-- TOC entry 2015 (class 2604 OID 16568)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY article ALTER COLUMN id SET DEFAULT nextval('article_id_seq'::regclass);


--
-- TOC entry 2016 (class 2604 OID 16569)
-- Name: conference_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY article ALTER COLUMN conference_id SET DEFAULT nextval('article_conference_id_seq'::regclass);


--
-- TOC entry 2017 (class 2604 OID 16570)
-- Name: article_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY author_article ALTER COLUMN article_id SET DEFAULT nextval('author_article_article_id_seq'::regclass);


--
-- TOC entry 2013 (class 2604 OID 16572)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY conference ALTER COLUMN id SET DEFAULT nextval('conference_id_seq'::regclass);


--
-- TOC entry 2018 (class 2604 OID 16574)
-- Name: edition_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY editor_conference ALTER COLUMN edition_id SET DEFAULT nextval('editor_edition_edition_id_seq'::regclass);


--
-- TOC entry 2019 (class 2604 OID 16625)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY person ALTER COLUMN id SET DEFAULT nextval('person_id_seq'::regclass);


--
-- TOC entry 2023 (class 2606 OID 16576)
-- Name: article_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY article
    ADD CONSTRAINT article_pk PRIMARY KEY (id);


--
-- TOC entry 2025 (class 2606 OID 16641)
-- Name: author_article_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY author_article
    ADD CONSTRAINT author_article_pk PRIMARY KEY (article_id, person_id);


--
-- TOC entry 2021 (class 2606 OID 16582)
-- Name: conference_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY conference
    ADD CONSTRAINT conference_pk PRIMARY KEY (id);


--
-- TOC entry 2027 (class 2606 OID 16648)
-- Name: editor_conference_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY editor_conference
    ADD CONSTRAINT editor_conference_pkey PRIMARY KEY (edition_id, person_id);


--
-- TOC entry 2029 (class 2606 OID 16634)
-- Name: person_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY person
    ADD CONSTRAINT person_pk PRIMARY KEY (id);


--
-- TOC entry 2030 (class 2606 OID 16588)
-- Name: article_conference_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY article
    ADD CONSTRAINT article_conference_fk FOREIGN KEY (conference_id) REFERENCES conference(id);


--
-- TOC entry 2031 (class 2606 OID 16593)
-- Name: author_article_article; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY author_article
    ADD CONSTRAINT author_article_article FOREIGN KEY (article_id) REFERENCES article(id);


--
-- TOC entry 2032 (class 2606 OID 16635)
-- Name: author_article_person; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY author_article
    ADD CONSTRAINT author_article_person FOREIGN KEY (person_id) REFERENCES person(id);


--
-- TOC entry 2033 (class 2606 OID 16608)
-- Name: editor_conference_conference_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY editor_conference
    ADD CONSTRAINT editor_conference_conference_fk FOREIGN KEY (edition_id) REFERENCES conference(id);


--
-- TOC entry 2034 (class 2606 OID 16642)
-- Name: editor_conference_person_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY editor_conference
    ADD CONSTRAINT editor_conference_person_fk FOREIGN KEY (person_id) REFERENCES person(id);


-- Completed on 2016-06-15 22:13:57 BRT

--
-- PostgreSQL database dump complete
--

