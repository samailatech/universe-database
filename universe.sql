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
    name character varying(255) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    is_spherical boolean NOT NULL
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
    name character varying(255) NOT NULL,
    planet_id integer,
    has_ice boolean NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_planet numeric
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
    name character varying(255) NOT NULL,
    star_id integer,
    has_moons boolean NOT NULL,
    planet_type character varying(255),
    age_in_millions_of_years integer
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
    name character varying(255) NOT NULL,
    galaxy_id integer,
    distance_from_earth numeric,
    has_life boolean NOT NULL,
    star_type character varying(255) NOT NULL,
    star_system_id integer
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
-- Name: star_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_system (
    star_system_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer,
    number_of_stars integer,
    notable_features text
);


ALTER TABLE public.star_system OWNER TO freecodecamp;

--
-- Name: star_system_star_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_system_star_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_system_star_system_id_seq OWNER TO freecodecamp;

--
-- Name: star_system_star_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_system_star_system_id_seq OWNED BY public.star_system.star_system_id;


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
-- Name: star_system star_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_system ALTER COLUMN star_system_id SET DEFAULT nextval('public.star_system_star_system_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 13000, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest galaxy', 10000, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third largest galaxy', 3000, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral galaxy', 3000, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Distinctive galaxy', 10000, true);
INSERT INTO public.galaxy VALUES (6, 'Messier 81', 'Large spiral galaxy', 12000, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, false, true, 384400);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, true, true, 9377);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, true, true, 23460);
INSERT INTO public.moon VALUES (4, 'Io', 3, false, true, 421800);
INSERT INTO public.moon VALUES (5, 'Europa', 3, true, true, 670900);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, true, true, 1070400);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, true, true, 1882700);
INSERT INTO public.moon VALUES (8, 'Titan', 4, true, true, 1221700);
INSERT INTO public.moon VALUES (9, 'Rhea', 4, true, true, 527040);
INSERT INTO public.moon VALUES (10, 'Iapetus', 4, false, true, 3561300);
INSERT INTO public.moon VALUES (11, 'Dione', 4, true, true, 377400);
INSERT INTO public.moon VALUES (12, 'Enceladus', 4, true, true, 238020);
INSERT INTO public.moon VALUES (13, 'Mimas', 4, true, true, 185520);
INSERT INTO public.moon VALUES (14, 'Ariel', 5, true, true, 191020);
INSERT INTO public.moon VALUES (15, 'Umbriel', 5, true, true, 266300);
INSERT INTO public.moon VALUES (16, 'Titania', 5, true, true, 436300);
INSERT INTO public.moon VALUES (17, 'Oberon', 5, true, true, 583520);
INSERT INTO public.moon VALUES (18, 'Triton', 6, true, true, 354760);
INSERT INTO public.moon VALUES (19, 'Nereid', 6, true, true, 1150000);
INSERT INTO public.moon VALUES (20, 'Proteus', 6, true, true, 117600);
INSERT INTO public.moon VALUES (21, 'Charon', 7, true, true, 19500);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 'Terrestrial', 4500);
INSERT INTO public.planet VALUES (2, 'Mars', 1, true, 'Terrestrial', 4500);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, true, 'Gas Giant', 4600);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, true, 'Gas Giant', 4600);
INSERT INTO public.planet VALUES (5, 'Uranus', 1, true, 'Ice Giant', 4600);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, true, 'Ice Giant', 4600);
INSERT INTO public.planet VALUES (7, 'Mercury', 1, false, 'Terrestrial', 4600);
INSERT INTO public.planet VALUES (8, 'Venus', 1, false, 'Terrestrial', 4600);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, true, 'Dwarf', 4500);
INSERT INTO public.planet VALUES (10, 'Eris', 1, true, 'Dwarf', 1000);
INSERT INTO public.planet VALUES (11, 'Haumea', 1, true, 'Dwarf', 1000);
INSERT INTO public.planet VALUES (12, 'Makemake', 1, true, 'Dwarf', 1000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 0, false, 'G-type', 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 1, 4.37, false, 'G-type', 2);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 8.6, false, 'A-type', 3);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 640, false, 'M-type', 4);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 1, 4.24, false, 'M-type', 5);
INSERT INTO public.star VALUES (6, 'Vega', 1, 25, false, 'A-type', 6);


--
-- Data for Name: star_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_system VALUES (1, 'Solar System', 1, 1, 'Contains Earth');
INSERT INTO public.star_system VALUES (2, 'Alpha Centauri System', 1, 3, 'Closest star system to the Solar System');
INSERT INTO public.star_system VALUES (3, 'Sirius System', 1, 2, 'Brightest star system in the night sky');
INSERT INTO public.star_system VALUES (4, 'Beta Centauri System', 1, 2, 'Part of the Centaurus constellation');
INSERT INTO public.star_system VALUES (5, 'Proxima Centauri System', 1, 1, 'Closest known star to the Sun');
INSERT INTO public.star_system VALUES (6, 'Gliese 581 System', 1, 2, 'Contains potentially habitable exoplanets');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: star_system_star_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_system_star_system_id_seq', 6, true);


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
-- Name: star_system star_system_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_system
    ADD CONSTRAINT star_system_name_key UNIQUE (name);


--
-- Name: star_system star_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_system
    ADD CONSTRAINT star_system_pkey PRIMARY KEY (star_system_id);


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
-- Name: star star_star_system_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_system_id_fkey FOREIGN KEY (star_system_id) REFERENCES public.star_system(star_system_id);


--
-- Name: star_system star_system_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_system
    ADD CONSTRAINT star_system_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

