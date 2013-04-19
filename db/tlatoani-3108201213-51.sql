--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: comment_id; Type: SEQUENCE; Schema: public; Owner: erick
--

CREATE SEQUENCE comment_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_id OWNER TO erick;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: login; Type: TABLE; Schema: public; Owner: erick; Tablespace: 
--

CREATE TABLE login (
    usuario character varying(50),
    "contraseña" character varying(50)
);


ALTER TABLE public.login OWNER TO erick;

--
-- Name: topic_comments; Type: TABLE; Schema: public; Owner: erick; Tablespace: 
--

CREATE TABLE topic_comments (
    comment_id integer NOT NULL,
    post_id integer,
    "time" timestamp without time zone DEFAULT '2007-06-28 13:48:52.63938'::timestamp without time zone NOT NULL,
    name character varying(255) NOT NULL,
    comment_author character varying(255) NOT NULL,
    comment text NOT NULL
);


ALTER TABLE public.topic_comments OWNER TO erick;

--
-- Name: topic_id; Type: SEQUENCE; Schema: public; Owner: erick
--

CREATE SEQUENCE topic_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.topic_id OWNER TO erick;

--
-- Name: topic_posts; Type: TABLE; Schema: public; Owner: erick; Tablespace: 
--

CREATE TABLE topic_posts (
    tpost_id integer NOT NULL,
    topic_id integer NOT NULL,
    creation_time timestamp without time zone DEFAULT '2007-06-28 13:48:52.522589'::timestamp without time zone NOT NULL,
    update_time timestamp without time zone DEFAULT '2007-06-28 13:48:52.522589'::timestamp without time zone NOT NULL,
    post_name character varying(255) NOT NULL,
    post_author character varying(255) NOT NULL,
    post_abstract character varying(2000) NOT NULL,
    post_views integer DEFAULT 0 NOT NULL,
    post text NOT NULL
);


ALTER TABLE public.topic_posts OWNER TO erick;

--
-- Name: topics; Type: TABLE; Schema: public; Owner: erick; Tablespace: 
--

CREATE TABLE topics (
    topic_id integer NOT NULL,
    creation_time timestamp without time zone NOT NULL,
    topic_name character varying(255) NOT NULL,
    topic_description character varying(1000) NOT NULL,
    topic_image_path character varying(600),
    topic_update timestamp without time zone
);


ALTER TABLE public.topics OWNER TO erick;

--
-- Name: tpost_id; Type: SEQUENCE; Schema: public; Owner: erick
--

CREATE SEQUENCE tpost_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tpost_id OWNER TO erick;

--
-- Name: topic_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: erick; Tablespace: 
--

ALTER TABLE ONLY topic_comments
    ADD CONSTRAINT topic_comments_pkey PRIMARY KEY (comment_id);


--
-- Name: topic_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: erick; Tablespace: 
--

ALTER TABLE ONLY topic_posts
    ADD CONSTRAINT topic_posts_pkey PRIMARY KEY (tpost_id);


--
-- Name: topics_creation_time_key; Type: CONSTRAINT; Schema: public; Owner: erick; Tablespace: 
--

ALTER TABLE ONLY topics
    ADD CONSTRAINT topics_creation_time_key UNIQUE (creation_time);


--
-- Name: topics_pkey; Type: CONSTRAINT; Schema: public; Owner: erick; Tablespace: 
--

ALTER TABLE ONLY topics
    ADD CONSTRAINT topics_pkey PRIMARY KEY (topic_id);


--
-- Name: topic_comments_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: erick
--

ALTER TABLE ONLY topic_comments
    ADD CONSTRAINT topic_comments_post_id_fkey FOREIGN KEY (post_id) REFERENCES topic_posts(tpost_id) ON DELETE CASCADE;


--
-- Name: topic_posts_topic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: erick
--

ALTER TABLE ONLY topic_posts
    ADD CONSTRAINT topic_posts_topic_id_fkey FOREIGN KEY (topic_id) REFERENCES topics(topic_id) ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

