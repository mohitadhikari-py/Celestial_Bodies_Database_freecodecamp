--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: celestial_body; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_body (
    celestial_body_id integer NOT NULL,
    name character varying(100) NOT NULL,
    body_type character varying(50) NOT NULL,
    discovery_year integer,
    is_spherical boolean NOT NULL
);


ALTER TABLE public.celestial_body OWNER TO freecodecamp;

--
-- Name: celestial_body_celestial_body_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_body_celestial_body_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_body_celestial_body_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_body_celestial_body_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_body_celestial_body_id_seq OWNED BY public.celestial_body.celestial_body_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40),
    description text,
    has_life boolean,
    galaxy_type character varying(50) NOT NULL,
    distance_from_earth numeric
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
    name character varying(40),
    age_in_million_of_years integer,
    description text,
    has_life boolean,
    planet_id integer,
    radius_km numeric NOT NULL,
    is_spherical boolean
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
    name character varying(40),
    age_in_million_of_years integer,
    description text,
    has_life boolean,
    star_id integer,
    planet_type character varying(50) NOT NULL,
    distance_from_star numeric
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
    name character varying(40),
    age_in_million_of_years integer,
    description text,
    has_life boolean,
    galaxy_id integer,
    is_spherical boolean NOT NULL,
    temperature_in_kelvin numeric
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
-- Name: celestial_body celestial_body_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_body ALTER COLUMN celestial_body_id SET DEFAULT nextval('public.celestial_body_celestial_body_id_seq'::regclass);


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
-- Data for Name: celestial_body; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_body VALUES (1, 'Halley', 'Comet', 1705, true);
INSERT INTO public.celestial_body VALUES (2, 'Ceres', 'Dwarf Planet', 1801, true);
INSERT INTO public.celestial_body VALUES (3, 'Pluto', 'Dwarf Planet', 1930, true);
INSERT INTO public.celestial_body VALUES (4, 'Eris', 'Dwarf Planet', 2005, true);
INSERT INTO public.celestial_body VALUES (5, 'Haumea', 'Dwarf Planet', 2004, true);
INSERT INTO public.celestial_body VALUES (6, 'Makemake', 'Dwarf Planet', 2005, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', NULL, true, 'Spiral', 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', NULL, false, 'Spiral', 2537000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', NULL, false, 'Spiral', 3000000);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', NULL, false, 'Spiral', 29350000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', NULL, false, 'Spiral', 23000000);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', NULL, false, 'Elliptical', 53500000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, NULL, NULL, 3, 1737.4, true);
INSERT INTO public.moon VALUES (2, 'Phobos', NULL, NULL, NULL, 4, 11.3, false);
INSERT INTO public.moon VALUES (3, 'Deimos', NULL, NULL, NULL, 4, 6.2, false);
INSERT INTO public.moon VALUES (4, 'Io', NULL, NULL, NULL, 5, 1821.6, true);
INSERT INTO public.moon VALUES (5, 'Europa', NULL, NULL, NULL, 5, 1560.8, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', NULL, NULL, NULL, 5, 2634.1, true);
INSERT INTO public.moon VALUES (7, 'Callisto', NULL, NULL, NULL, 5, 2410.3, true);
INSERT INTO public.moon VALUES (8, 'Titan', NULL, NULL, NULL, 6, 2574.7, true);
INSERT INTO public.moon VALUES (9, 'Enceladus', NULL, NULL, NULL, 6, 252.1, true);
INSERT INTO public.moon VALUES (10, 'Titania', NULL, NULL, NULL, 7, 788.9, true);
INSERT INTO public.moon VALUES (11, 'Triton', NULL, NULL, NULL, 8, 1353.4, true);
INSERT INTO public.moon VALUES (12, 'Charon', NULL, NULL, NULL, 8, 606, true);
INSERT INTO public.moon VALUES (13, 'Mimas', NULL, NULL, NULL, 6, 198.2, true);
INSERT INTO public.moon VALUES (14, 'Dione', NULL, NULL, NULL, 6, 561.4, true);
INSERT INTO public.moon VALUES (15, 'Rhea', NULL, NULL, NULL, 6, 763.8, true);
INSERT INTO public.moon VALUES (16, 'Iapetus', NULL, NULL, NULL, 6, 734.5, true);
INSERT INTO public.moon VALUES (17, 'Oberon', NULL, NULL, NULL, 7, 761.4, true);
INSERT INTO public.moon VALUES (18, 'Ariel', NULL, NULL, NULL, 7, 578.9, true);
INSERT INTO public.moon VALUES (19, 'Umbriel', NULL, NULL, NULL, 7, 584.7, true);
INSERT INTO public.moon VALUES (20, 'Nereid', NULL, NULL, NULL, 8, 170, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', NULL, NULL, false, 1, 'Terrestrial', 57.9);
INSERT INTO public.planet VALUES (2, 'Venus', NULL, NULL, false, 1, 'Terrestrial', 108.2);
INSERT INTO public.planet VALUES (3, 'Earth', NULL, NULL, true, 1, 'Terrestrial', 149.6);
INSERT INTO public.planet VALUES (4, 'Mars', NULL, NULL, false, 1, 'Terrestrial', 227.9);
INSERT INTO public.planet VALUES (5, 'Jupiter', NULL, NULL, false, 1, 'Gas Giant', 778.5);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, NULL, false, 1, 'Gas Giant', 1434);
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, NULL, false, 1, 'Ice Giant', 2871);
INSERT INTO public.planet VALUES (8, 'Neptune', NULL, NULL, false, 1, 'Ice Giant', 4495);
INSERT INTO public.planet VALUES (9, 'Proxima b', NULL, NULL, false, 3, 'Terrestrial', 7.5);
INSERT INTO public.planet VALUES (10, 'Vega b', NULL, NULL, false, 6, 'Gas Giant', 80);
INSERT INTO public.planet VALUES (11, 'Kepler-22b', NULL, NULL, false, 3, 'Exoplanet', 600);
INSERT INTO public.planet VALUES (12, 'Gliese-581g', NULL, NULL, false, 2, 'Exoplanet', 20);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, NULL, NULL, 1, true, 5778);
INSERT INTO public.star VALUES (2, 'Sirius', NULL, NULL, NULL, 1, true, 9940);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', NULL, NULL, NULL, 1, true, 3042);
INSERT INTO public.star VALUES (4, 'Betelgeuse', NULL, NULL, NULL, 1, true, 3500);
INSERT INTO public.star VALUES (5, 'Rigel', NULL, NULL, NULL, 1, true, 11000);
INSERT INTO public.star VALUES (6, 'Vega', NULL, NULL, NULL, 1, true, 9602);


--
-- Name: celestial_body_celestial_body_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_body_celestial_body_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: celestial_body celestial_body_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_body
    ADD CONSTRAINT celestial_body_name_key UNIQUE (name);


--
-- Name: celestial_body celestial_body_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_body
    ADD CONSTRAINT celestial_body_name_unique UNIQUE (name);


--
-- Name: celestial_body celestial_body_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_body
    ADD CONSTRAINT celestial_body_pkey PRIMARY KEY (celestial_body_id);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


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

