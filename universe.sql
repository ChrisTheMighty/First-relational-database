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
    type character varying(20) NOT NULL,
    diameter_in_light_years integer,
    distance_from_sun_in_kiloparsecs integer
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
    planet_id integer NOT NULL,
    name character varying(20),
    is_inhabited boolean,
    peoples text
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
    star_id integer NOT NULL,
    name character varying(20),
    number_of_moons integer,
    planet_type_id integer,
    is_inhabited boolean,
    peoples text
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_types_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(30),
    number_of_planets integer,
    distance_from_sun_in_light_years numeric(7,3)
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_types_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (3, 'Andromeda', 'Barred spiral', 220000, 752);
INSERT INTO public.galaxy VALUES (4, 'NGC 3923', 'Elliptical shell', 155000, 21600);
INSERT INTO public.galaxy VALUES (5, 'Hoags Object', 'Ring', 100000, 187900);
INSERT INTO public.galaxy VALUES (6, 'The Large Magellanic Cloud', 'Magellanic Spiral', 14000, 50);
INSERT INTO public.galaxy VALUES (1, 'Far, far away', 'Spiral', 110000, NULL);
INSERT INTO public.galaxy VALUES (2, 'The Milky Way', 'Barred spiral', 185000, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Ghomrassen', false, 'None');
INSERT INTO public.moon VALUES (3, 1, 'Chenini', false, 'None');
INSERT INTO public.moon VALUES (4, 2, 'Sanctuary Moon', true, 'Eewoks, Duloks, Yuzzum, Wisties, Humans');
INSERT INTO public.moon VALUES (5, 2, 'Alprezar', false, 'None');
INSERT INTO public.moon VALUES (6, 2, 'Fentakka', false, 'None');
INSERT INTO public.moon VALUES (7, 2, 'Gouuls', false, 'None');
INSERT INTO public.moon VALUES (8, 2, 'Hual Maka', false, 'None');
INSERT INTO public.moon VALUES (9, 2, 'Kef Bir', true, 'Humans');
INSERT INTO public.moon VALUES (10, 2, 'Korkar', false, 'None');
INSERT INTO public.moon VALUES (11, 2, 'Sharls', false, 'None');
INSERT INTO public.moon VALUES (12, 2, 'Vix', false, 'None');
INSERT INTO public.moon VALUES (13, 4, 'The Moon', false, 'None');
INSERT INTO public.moon VALUES (14, 6, 'Krelln', false, 'None');
INSERT INTO public.moon VALUES (15, 6, 'Arvon', false, 'None');
INSERT INTO public.moon VALUES (16, 7, 'Luna', true, 'Humans');
INSERT INTO public.moon VALUES (17, 5, 'Io', false, 'None');
INSERT INTO public.moon VALUES (18, 5, 'Europa', false, 'None');
INSERT INTO public.moon VALUES (19, 5, 'Ganymede', false, 'None');
INSERT INTO public.moon VALUES (20, 5, 'Callisto', false, 'None');
INSERT INTO public.moon VALUES (2, 1, 'Guermessa', false, 'None');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Tatooine', 3, 1, true, 'Jawa, Tusken Raiders, many immigrant species');
INSERT INTO public.planet VALUES (2, 2, 'Endor', 9, 8, false, 'None');
INSERT INTO public.planet VALUES (3, 3, 'Dagobah', 1, 2, true, 'Master Yoda');
INSERT INTO public.planet VALUES (4, 4, 'Earth', 1, 3, true, 'Humans, Dolphins, Octopuses, Great Apes');
INSERT INTO public.planet VALUES (5, 4, 'Jupiter', 79, 8, false, 'None');
INSERT INTO public.planet VALUES (6, 6, 'Arrakis', 2, 1, true, 'Fremen, Shhai-Hulud, House Atreides');
INSERT INTO public.planet VALUES (7, 7, 'Holy Terra', 1, 7, true, 'Humans');
INSERT INTO public.planet VALUES (8, 8, 'Lusitania', NULL, 3, true, 'Pequeninos, Humans');
INSERT INTO public.planet VALUES (9, 9, 'Magrathea', NULL, 5, true, 'Slartibartfast');
INSERT INTO public.planet VALUES (10, 11, 'Salusa Secundus', NULL, 6, true, 'House Corrino, prisoners, Sardaukar');
INSERT INTO public.planet VALUES (11, 12, 'Omicron Persei 7', NULL, 3, true, 'Women');
INSERT INTO public.planet VALUES (12, 12, 'Omicron Persei 8', NULL, 3, true, 'Men');
INSERT INTO public.planet VALUES (13, 5, 'Cadia', 1, 4, true, 'Chaos daemons');


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Desert', 'A terrestrial planet whose dominant landscape type is comparable to hot deserts on Earth');
INSERT INTO public.planet_type VALUES (2, 'Swamp', 'A terrestrial planet whose surface is dominated by swamps, bayous, and jungles');
INSERT INTO public.planet_type VALUES (3, 'Mixed', 'A terrestrial planet whose surface is comprised of an Earth-like mix of biomes');
INSERT INTO public.planet_type VALUES (4, 'Daemon world', 'A terrestrial planet which has been corrupted by the power of Chaos and The Warp');
INSERT INTO public.planet_type VALUES (5, 'Dead world', 'A planet whose former inhabitants and civilisations have gone extinct, leaving it lifeless');
INSERT INTO public.planet_type VALUES (6, 'Prison planet', 'A terrestrial planet dedicated entirely to the incarceration of criminals of the Imperium');
INSERT INTO public.planet_type VALUES (7, 'Hive world', 'A terrestrial planet whose vast populations live in huge structures called hive cities - self-contained industrial cities each housing billions');
INSERT INTO public.planet_type VALUES (8, 'Gas giant', 'A giant planet composed mainly of hydrogen and helium');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (4, 2, 'The Sun', 8, 0.000);
INSERT INTO public.star VALUES (6, 2, 'Canopus', 6, 309.800);
INSERT INTO public.star VALUES (7, 2, 'Sol', 8, 0.000);
INSERT INTO public.star VALUES (8, 2, 'Lusitania', 1, 112.500);
INSERT INTO public.star VALUES (9, 2, 'Soulianis + Rahm', 1, 1500.000);
INSERT INTO public.star VALUES (10, 2, 'Earendil', 0, 0.001);
INSERT INTO public.star VALUES (11, 2, 'Gamma Waiping', 7, 130.900);
INSERT INTO public.star VALUES (12, 2, 'Omicron Persei', 9, 1121.000);
INSERT INTO public.star VALUES (1, 1, 'Tatoo I + II', 3, NULL);
INSERT INTO public.star VALUES (2, 1, 'Endor I + II', 4, NULL);
INSERT INTO public.star VALUES (3, 1, 'Darlo', 5, NULL);
INSERT INTO public.star VALUES (5, 2, 'Cadia', 10, NULL);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 26, true);


--
-- Name: planet_types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_type_id_seq', 8, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: planet_type planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_type_id);


--
-- Name: planet_type planet_types_type_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_types_type_id_key UNIQUE (planet_type_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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
-- Name: planet planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

