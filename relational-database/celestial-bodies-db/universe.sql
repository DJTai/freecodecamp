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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    constellation character varying(30),
    galaxy_type character varying(16),
    size_in_kly integer,
    distance_in_kly integer
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
-- Name: inhabitants; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.inhabitants (
    inhabitants_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    moon_id integer
);


ALTER TABLE public.inhabitants OWNER TO freecodecamp;

--
-- Name: inhabitants_inhabitants_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.inhabitants_inhabitants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inhabitants_inhabitants_id_seq OWNER TO freecodecamp;

--
-- Name: inhabitants_inhabitants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.inhabitants_inhabitants_id_seq OWNED BY public.inhabitants.inhabitants_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    discovery_date date,
    planet_id integer,
    has_life boolean
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
    name character varying(30) NOT NULL,
    description text NOT NULL,
    has_life boolean,
    surface_gravity numeric(5,3),
    num_of_moons integer,
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
    name character varying(30) NOT NULL,
    description text NOT NULL,
    num_of_planets integer,
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: inhabitants inhabitants_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.inhabitants ALTER COLUMN inhabitants_id SET DEFAULT nextval('public.inhabitants_inhabitants_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy that includes our Solar System', 'Sagittarius', 'Sb,Sbc,SB(rs)bc', 185, 26);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'A barred spiral galaxy AKA Messier (M31)', 'Andromeda', 'SA(s)b', 220, 2450);
INSERT INTO public.galaxy VALUES (3, 'Hoags Object', 'A non-tyical galaxy named after Arthur Hoag', 'Serpents Caput', '(RP)E0,(RP)SA0/a', 121, 612800);
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 'A spiral galaxy AKA Messier Object 104 (M104)', 'Virgo', 'SA(s)a', 49, 31100);
INSERT INTO public.galaxy VALUES (5, 'Tadpole Galaxy', 'A disrupted barred spiral galaxy; looks like a tadpole', 'Draco', 'SB(s)c pec', 0, 400000);
INSERT INTO public.galaxy VALUES (6, 'Cigar Galaxy', 'A starburst galaxy; AKA Messier 82 (M82)', 'Ursa Major', 'I0', 37, 12000);


--
-- Data for Name: inhabitants; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.inhabitants VALUES (1, 'Humans', 4, NULL);
INSERT INTO public.inhabitants VALUES (2, 'Dinosaurs', 4, NULL);
INSERT INTO public.inhabitants VALUES (3, 'Martians', 5, 14);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (13, 'Moon01', '1900-01-01', 3, false);
INSERT INTO public.moon VALUES (14, 'Moon02', '1900-01-01', 2, false);
INSERT INTO public.moon VALUES (15, 'Moon03', '1900-01-01', 2, false);
INSERT INTO public.moon VALUES (16, 'Moon04', '1900-01-02', 6, false);
INSERT INTO public.moon VALUES (17, 'Moon05', '1900-01-02', 5, false);
INSERT INTO public.moon VALUES (18, 'Moon06', '1900-01-02', 4, false);
INSERT INTO public.moon VALUES (19, 'Moon07', '1900-02-02', 4, false);
INSERT INTO public.moon VALUES (20, 'Moon08', '1900-02-02', 2, false);
INSERT INTO public.moon VALUES (21, 'Moon09', '1900-02-02', 2, false);
INSERT INTO public.moon VALUES (22, 'Moon10', '1900-02-02', 2, false);
INSERT INTO public.moon VALUES (23, 'Moon11', '1920-02-02', 2, false);
INSERT INTO public.moon VALUES (24, 'Moon12', '1920-02-03', 3, false);
INSERT INTO public.moon VALUES (25, 'Moon13', '1900-01-01', 3, false);
INSERT INTO public.moon VALUES (26, 'Moon14', '1900-01-01', 2, false);
INSERT INTO public.moon VALUES (27, 'Moon15', '1900-01-01', 2, false);
INSERT INTO public.moon VALUES (28, 'Moon16', '1900-01-02', 6, false);
INSERT INTO public.moon VALUES (29, 'Moon17', '1900-01-02', 5, false);
INSERT INTO public.moon VALUES (30, 'Moon18', '1900-01-02', 4, false);
INSERT INTO public.moon VALUES (31, 'Moon19', '1900-02-02', 4, false);
INSERT INTO public.moon VALUES (32, 'Moon20', '1900-02-02', 2, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Mercury', 'Closest to the Sun', false, 3.700, 0, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'Brightest natural object in Earths sky', false, 8.870, 0, 1);
INSERT INTO public.planet VALUES (4, 'Earth', 'Our home', true, 9.806, 1, 1);
INSERT INTO public.planet VALUES (5, 'Mars', 'Named after the Roman god of war', false, 3.720, 2, 1);
INSERT INTO public.planet VALUES (6, 'Jupiter', 'A gas giant', false, 24.790, 80, 1);
INSERT INTO public.planet VALUES (7, 'Saturn', 'A gas giant with rings', false, 10.440, 83, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', 'Named after the Roman god of the sky', false, 8.690, 27, 1);
INSERT INTO public.planet VALUES (9, 'Neptune', 'Named after the  Roman god of the sea', false, 11.150, 14, 1);
INSERT INTO public.planet VALUES (10, 'Pluto', 'A dwarf planet in the Kuiper belt', false, 0.620, 5, 1);
INSERT INTO public.planet VALUES (11, 'Promixa b', 'Exoplanet in the habitable zone of Proxima Centauri', false, NULL, 0, 7);
INSERT INTO public.planet VALUES (12, 'Proxima c', 'Exoplanet in the habitable zone of Proxima Centauri', false, NULL, 0, 7);
INSERT INTO public.planet VALUES (13, 'Proxima d', 'Exoplanet in the habitable zone of Proxima Centauri', false, NULL, 0, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Our solar systems star', 9, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'AKA Alpha Canis Majoris', 0, 1);
INSERT INTO public.star VALUES (3, 'Alpheratz', 'AKA Slpha Andromedae', 0, 2);
INSERT INTO public.star VALUES (4, 'Unukalhai', 'AKA Alpha Serpentis', 0, 3);
INSERT INTO public.star VALUES (5, 'Eltanin', 'AKA Gamma Draconis', 0, 5);
INSERT INTO public.star VALUES (6, 'Alioth', 'AKA Epsilon Ursae Majoris', 0, 6);
INSERT INTO public.star VALUES (7, 'Proxima Centauri', 'Closest star to the Sun', 3, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: inhabitants_inhabitants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.inhabitants_inhabitants_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 32, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: inhabitants inhabitants_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.inhabitants
    ADD CONSTRAINT inhabitants_name_key UNIQUE (name);


--
-- Name: inhabitants inhabitants_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.inhabitants
    ADD CONSTRAINT inhabitants_pkey PRIMARY KEY (inhabitants_id);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: inhabitants fk_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.inhabitants
    ADD CONSTRAINT fk_moon FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: inhabitants fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.inhabitants
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

