--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: dwarf; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.dwarf (
    dwarf_id integer NOT NULL,
    name character varying(50) NOT NULL,
    size_in_light_years integer
);


ALTER TABLE public.dwarf OWNER TO freecodecamp;

--
-- Name: dwarf_dwarf_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.dwarf_dwarf_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dwarf_dwarf_id_seq OWNER TO freecodecamp;

--
-- Name: dwarf_dwarf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.dwarf_dwarf_id_seq OWNED BY public.dwarf.dwarf_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    has_life boolean,
    size_in_light_years numeric(12,2)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    has_life boolean,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    orbits_star integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: dwarf dwarf_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf ALTER COLUMN dwarf_id SET DEFAULT nextval('public.dwarf_dwarf_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: dwarf; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.dwarf VALUES (1, 'Pluto', NULL);
INSERT INTO public.dwarf VALUES (2, 'Lucy', NULL);
INSERT INTO public.dwarf VALUES (3, 'Arrokoth', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our belowed galaxy!', 14, 52000, true, 52850.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Our closest neighboor.', 15, 85000, false, 65000.25);
INSERT INTO public.galaxy VALUES (3, 'M33', NULL, 21, NULL, NULL, 46000.00);
INSERT INTO public.galaxy VALUES (5, 'M34', NULL, 34, NULL, NULL, 48000.00);
INSERT INTO public.galaxy VALUES (6, 'M35', NULL, 46, NULL, NULL, 96000.00);
INSERT INTO public.galaxy VALUES (7, 'M39', NULL, 39, NULL, NULL, 51000.00);
INSERT INTO public.galaxy VALUES (8, 'M41', NULL, 94, NULL, NULL, 123000.45);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Our moon!', 200, 100, 1);
INSERT INTO public.moon VALUES (2, 'Calisto', NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (3, 'Io', NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (4, 'Europa', NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (5, 'Dione', NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (6, 'Rhea', NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (7, 'Mimas', NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (8, 'Titan', NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (9, 'Hyperion', NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (10, 'Phoebe', NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (11, 'Enceladus', NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (12, 'Triton', NULL, NULL, NULL, 9);
INSERT INTO public.moon VALUES (13, 'Piton', NULL, NULL, NULL, 9);
INSERT INTO public.moon VALUES (14, 'Foo', NULL, NULL, NULL, 9);
INSERT INTO public.moon VALUES (15, 'Bo', NULL, NULL, NULL, 9);
INSERT INTO public.moon VALUES (16, 'Bar', NULL, NULL, NULL, 9);
INSERT INTO public.moon VALUES (17, 'Proteus', NULL, NULL, NULL, 9);
INSERT INTO public.moon VALUES (18, 'Phobos', NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (19, 'Deimos', NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (20, 'Mars Express', NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (21, 'Maven', NULL, NULL, NULL, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Our planet!', true, 400, 0, NULL, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', NULL, false, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (3, 'Venus', NULL, false, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (4, 'Mars', NULL, false, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', NULL, false, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (7, 'Saturn', NULL, false, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', NULL, false, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (9, 'Neptune', NULL, false, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (12, 'G22', NULL, false, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (13, 'G35', NULL, false, NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES (14, 'G13', NULL, false, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (15, 'G57', NULL, false, NULL, NULL, NULL, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Out own star!', 5000, 92, 1);
INSERT INTO public.star VALUES (2, 'Scorpii', NULL, NULL, NULL, 2);
INSERT INTO public.star VALUES (3, 'Cassiopi', NULL, NULL, NULL, 3);
INSERT INTO public.star VALUES (4, 'Cephei', NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (5, 'Cersei', NULL, NULL, NULL, 2);
INSERT INTO public.star VALUES (6, 'Lano', NULL, NULL, NULL, 3);


--
-- Name: dwarf_dwarf_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.dwarf_dwarf_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: dwarf dwarf_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf
    ADD CONSTRAINT dwarf_name_key UNIQUE (name);


--
-- Name: dwarf dwarf_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf
    ADD CONSTRAINT dwarf_pkey PRIMARY KEY (dwarf_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

