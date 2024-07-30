--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer DEFAULT 999
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (73, 'user_1722362583642', 2, 583);
INSERT INTO public.users VALUES (85, 'user_1722363095227', 2, 9);
INSERT INTO public.users VALUES (72, 'user_1722362583643', 5, 412);
INSERT INTO public.users VALUES (64, 'user_1722362371194', 5, 86);
INSERT INTO public.users VALUES (65, 'user_1722362371193', 3, 10);
INSERT INTO public.users VALUES (84, 'user_1722363095228', 5, 704);
INSERT INTO public.users VALUES (63, 'Joe', 2, 12);
INSERT INTO public.users VALUES (67, 'user_1722362468225', 2, 194);
INSERT INTO public.users VALUES (75, 'user_1722362635474', 2, 460);
INSERT INTO public.users VALUES (66, 'user_1722362468226', 5, 452);
INSERT INTO public.users VALUES (74, 'user_1722362635475', 5, 250);
INSERT INTO public.users VALUES (69, 'user_1722362532813', 2, 213);
INSERT INTO public.users VALUES (87, 'user_1722363152491', 2, 264);
INSERT INTO public.users VALUES (77, 'user_1722362778053', 2, 149);
INSERT INTO public.users VALUES (68, 'user_1722362532814', 5, 476);
INSERT INTO public.users VALUES (76, 'user_1722362778054', 5, 147);
INSERT INTO public.users VALUES (86, 'user_1722363152492', 5, 75);
INSERT INTO public.users VALUES (71, 'user_1722362545980', 2, 33);
INSERT INTO public.users VALUES (70, 'user_1722362545981', 5, 179);
INSERT INTO public.users VALUES (79, 'user_1722362844185', 2, 341);
INSERT INTO public.users VALUES (78, 'user_1722362844186', 5, 423);
INSERT INTO public.users VALUES (89, 'user_1722363225373', 2, 29);
INSERT INTO public.users VALUES (81, 'user_1722362951118', 2, 308);
INSERT INTO public.users VALUES (88, 'user_1722363225374', 5, 19);
INSERT INTO public.users VALUES (80, 'user_1722362951119', 5, 84);
INSERT INTO public.users VALUES (83, 'user_1722363009808', 2, 298);
INSERT INTO public.users VALUES (91, 'user_1722363253068', 2, 125);
INSERT INTO public.users VALUES (82, 'user_1722363009809', 5, 57);
INSERT INTO public.users VALUES (90, 'user_1722363253069', 5, 230);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 91, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

