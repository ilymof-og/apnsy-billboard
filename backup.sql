--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 17rc1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: ads; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ads (
    id integer NOT NULL,
    "adName" character varying(255) NOT NULL,
    price integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "categoryId" integer,
    description character varying(255) NOT NULL,
    "subcategoryId" integer,
    "regionId" integer
);


ALTER TABLE public.ads OWNER TO postgres;

--
-- Name: ads_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ads_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ads_id_seq OWNER TO postgres;

--
-- Name: ads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ads_id_seq OWNED BY public.ads.id;


--
-- Name: basket_Ads; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."basket_Ads" (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "adId" integer
);


ALTER TABLE public."basket_Ads" OWNER TO postgres;

--
-- Name: basket_Ads_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."basket_Ads_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."basket_Ads_id_seq" OWNER TO postgres;

--
-- Name: basket_Ads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."basket_Ads_id_seq" OWNED BY public."basket_Ads".id;


--
-- Name: basket_ads; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.basket_ads (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "basketId" integer,
    "adId" integer
);


ALTER TABLE public.basket_ads OWNER TO postgres;

--
-- Name: basket_ads_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.basket_ads_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.basket_ads_id_seq OWNER TO postgres;

--
-- Name: basket_ads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.basket_ads_id_seq OWNED BY public.basket_ads.id;


--
-- Name: baskets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.baskets (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer
);


ALTER TABLE public.baskets OWNER TO postgres;

--
-- Name: baskets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.baskets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.baskets_id_seq OWNER TO postgres;

--
-- Name: baskets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.baskets_id_seq OWNED BY public.baskets.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    "categoryName" character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.images (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "adId" integer,
    url character varying(255) NOT NULL
);


ALTER TABLE public.images OWNER TO postgres;

--
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.images_id_seq OWNER TO postgres;

--
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.images_id_seq OWNED BY public.images.id;


--
-- Name: regions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regions (
    id integer NOT NULL,
    "regionName" character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.regions OWNER TO postgres;

--
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.regions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.regions_id_seq OWNER TO postgres;

--
-- Name: regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.regions_id_seq OWNED BY public.regions.id;


--
-- Name: subcategories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subcategories (
    id integer NOT NULL,
    "categoryId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "subcategoryName" character varying(255) NOT NULL
);


ALTER TABLE public.subcategories OWNER TO postgres;

--
-- Name: subcategories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subcategories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.subcategories_id_seq OWNER TO postgres;

--
-- Name: subcategories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subcategories_id_seq OWNED BY public.subcategories.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    "firstName" character varying(255) NOT NULL,
    "lastName" character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    "phoneNumber" character varying(255) NOT NULL,
    role character varying(255) DEFAULT 'USER'::character varying,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: ads id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ads ALTER COLUMN id SET DEFAULT nextval('public.ads_id_seq'::regclass);


--
-- Name: basket_Ads id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."basket_Ads" ALTER COLUMN id SET DEFAULT nextval('public."basket_Ads_id_seq"'::regclass);


--
-- Name: basket_ads id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_ads ALTER COLUMN id SET DEFAULT nextval('public.basket_ads_id_seq'::regclass);


--
-- Name: baskets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baskets ALTER COLUMN id SET DEFAULT nextval('public.baskets_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images ALTER COLUMN id SET DEFAULT nextval('public.images_id_seq'::regclass);


--
-- Name: regions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions ALTER COLUMN id SET DEFAULT nextval('public.regions_id_seq'::regclass);


--
-- Name: subcategories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subcategories ALTER COLUMN id SET DEFAULT nextval('public.subcategories_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ads (id, "adName", price, "createdAt", "updatedAt", "categoryId", description, "subcategoryId", "regionId") FROM stdin;
1	╨Я╤А╨╛╨┤╨░╤О ╨║╨╛╨╝╨┐╨╗╨╡╨║╤В╤Г╤О╤Й╨╕╨╡ ╨┤╨╗╤П ╨Я╨Ъ RTX4090 ╨╕ I9 14900kf	250000	2024-09-19 20:20:58.062+03	2024-09-19 20:20:58.062+03	1	╨Я╤А╨╛╨┤╨░╤О ╨║╨╛╨╝╨┐╨╗╨╡╨║╤В╤Г╤О╤Й╨╕╨╡ ╤В╤О╨║ ╨╜╤Г╨╢╨╜╤Л ╨┤╨╡╨╜╤М╨│╨╕	2	1
\.


--
-- Data for Name: basket_Ads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."basket_Ads" (id, "createdAt", "updatedAt", "adId") FROM stdin;
\.


--
-- Data for Name: basket_ads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.basket_ads (id, "createdAt", "updatedAt", "basketId", "adId") FROM stdin;
\.


--
-- Data for Name: baskets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.baskets (id, "createdAt", "updatedAt", "userId") FROM stdin;
1	2024-09-06 13:58:33.535+03	2024-09-06 13:58:33.535+03	\N
2	2024-09-19 20:16:02.802+03	2024-09-19 20:16:02.802+03	2
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, "categoryName", "createdAt", "updatedAt") FROM stdin;
1	╨н╨╗╨╡╨║╤В╤А╨╛╨╜╨╕╨║╨░	2024-09-18 20:28:27.871+03	2024-09-18 20:28:27.871+03
2	╨Ю╨┤╨╡╨╢╨┤╨░ ╨╕ ╨╛╨▒╤Г╨▓╤М	2024-09-18 20:30:12.768+03	2024-09-18 20:30:12.768+03
3	╨Ф╨╛╨╝ ╨╕ ╤Б╨░╨┤	2024-09-19 12:02:45.548+03	2024-09-19 12:02:45.548+03
4	╨Р╨▓╤В╨╛╨╝╨╛╨▒╨╕╨╗╨╕ ╨╕ ╨╝╨╛╤В╨╛╤Ж╨╕╨║╨╗╤Л	2024-09-19 12:04:54.171+03	2024-09-19 12:04:54.171+03
5	╨б╨┐╨╛╤А╤В ╨╕ ╨╛╤В╨┤╤Л╤Е	2024-09-19 12:05:40.843+03	2024-09-19 12:05:40.843+03
6	╨Ш╨│╤А╤Г╤И╨║╨╕ ╨╕ ╨╕╨│╤А╤Л	2024-09-19 12:06:45.223+03	2024-09-19 12:06:45.223+03
7	╨Ъ╨╜╨╕╨│╨╕	2024-09-19 12:10:01.546+03	2024-09-19 12:10:01.546+03
8	╨Ъ╨╛╤Б╨╝╨╡╤В╨╕╨║╨░ ╨╕ ╨┐╨░╤А╤Д╤О╨╝╨╡╤А╨╕╤П	2024-09-19 12:12:20.013+03	2024-09-19 12:12:20.013+03
9	╨е╨╛╨▒╨▒╨╕ ╨╕ ╤В╨▓╨╛╤А╤З╨╡╤Б╤В╨▓╨╛	2024-09-19 12:12:57.989+03	2024-09-19 12:12:57.989+03
10	╨Ф╨╛╨╝╨░╤И╨╜╨╕╨╡ ╨╢╨╕╨▓╨╛╤В╨╜╤Л╨╡	2024-09-19 12:14:55.95+03	2024-09-19 12:14:55.95+03
11	╨Ц╨╕╨╗╤М╤С	2024-09-19 12:30:50.046+03	2024-09-19 12:30:50.046+03
12	╨а╨░╨▒╨╛╤В╨░	2024-09-19 12:44:38.761+03	2024-09-19 12:44:38.761+03
13	╨Э╨╡╨┤╨▓╨╕╨╢╨╕╨╝╨╛╤Б╤В╤М	2024-09-19 12:46:05.398+03	2024-09-19 12:46:05.398+03
\.


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.images (id, "createdAt", "updatedAt", "adId", url) FROM stdin;
1	2024-09-19 20:20:58.081+03	2024-09-19 20:20:58.081+03	1	a10b9a95-2b6d-4d9d-8633-edc8b51618be.png
2	2024-09-19 20:20:58.084+03	2024-09-19 20:20:58.084+03	1	eb3295b0-3dee-43dc-b544-1bb4b0306f7e.jpg
\.


--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.regions (id, "regionName", "createdAt", "updatedAt") FROM stdin;
1	╨б╤Г╤Е╤Г╨╝	2024-09-19 12:18:51.387+03	2024-09-19 12:18:51.387+03
2	╨У╨░╨│╤А╨░	2024-09-19 12:18:58.712+03	2024-09-19 12:18:58.712+03
3	╨Я╨╕╤Ж╤Г╨╜╨┤╨░	2024-09-19 12:19:07.985+03	2024-09-19 12:19:07.985+03
4	╨Э╨╛╨▓╤Л╨╣ ╨Р╤Д╨╛╨╜	2024-09-19 12:19:16.992+03	2024-09-19 12:19:16.992+03
5	╨Ю╤З╨░╨╝╤З╨╕╤А╨░	2024-09-19 12:21:49.64+03	2024-09-19 12:21:49.64+03
6	╨в╨║╨▓╨░╤А╤З╨░╨╗	2024-09-19 12:21:59.156+03	2024-09-19 12:21:59.156+03
7	╨У╨░╨╗	2024-09-19 13:21:16.359+03	2024-09-19 13:21:16.359+03
\.


--
-- Data for Name: subcategories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subcategories (id, "categoryId", "createdAt", "updatedAt", "subcategoryName") FROM stdin;
1	1	2024-09-18 20:28:39.153+03	2024-09-18 20:28:39.153+03	╨б╨╝╨░╤А╤В╤Д╨╛╨╜╤Л ╨╕ ╨┐╨╗╨░╨╜╤И╨╡╤В╤Л
2	1	2024-09-18 20:28:39.178+03	2024-09-18 20:28:39.178+03	╨Э╨╛╤Г╤В╨▒╤Г╨║╨╕ ╨╕ ╨║╨╛╨╝╨┐╤М╤О╤В╨╡╤А╤Л 
3	1	2024-09-18 20:28:39.182+03	2024-09-18 20:28:39.182+03	 ╨в╨╡╨╗╨╡╨▓╨╕╨╖╨╛╤А╤Л ╨╕ ╨░╤Г╨┤╨╕╨╛╤В╨╡╤Е╨╜╨╕╨║╨░
4	1	2024-09-18 20:28:39.187+03	2024-09-18 20:28:39.187+03	╨д╨╛╤В╨╛╨░╨┐╨┐╨░╤А╨░╤В╤Л ╨╕ ╨║╨░╨╝╨╡╤А╤Л 
5	2	2024-09-18 20:30:12.772+03	2024-09-18 20:30:12.772+03	╨Ь╤Г╨╢╤Б╨║╨░╤П ╨╛╨┤╨╡╨╢╨┤╨░
6	2	2024-09-18 20:30:12.778+03	2024-09-18 20:30:12.778+03	╨Ц╨╡╨╜╤Б╨║╨░╤П ╨╛╨┤╨╡╨╢╨┤╨░ 
7	2	2024-09-18 20:30:12.784+03	2024-09-18 20:30:12.784+03	 ╨Ю╨▒╤Г╨▓╤М
8	2	2024-09-18 20:30:12.789+03	2024-09-18 20:30:12.789+03	╨Р╨║╤Б╨╡╤Б╤Б╤Г╨░╤А╤Л 
9	3	2024-09-19 12:02:45.608+03	2024-09-19 12:02:45.608+03	╨Ь╨╡╨▒╨╡╨╗╤М
10	3	2024-09-19 12:02:45.627+03	2024-09-19 12:02:45.627+03	╨Ф╨╡╨║╨╛╤А 
11	3	2024-09-19 12:02:45.631+03	2024-09-19 12:02:45.631+03	 ╨б╨░╨┤╨╛╨▓╨░╤П ╤В╨╡╤Е╨╜╨╕╨║╨░ ╨╕ ╨╕╨╜╤Б╤В╤А╤Г╨╝╨╡╨╜╤В╤Л
12	3	2024-09-19 12:02:45.635+03	2024-09-19 12:02:45.635+03	╨г╨▒╨╛╤А╨║╨░ ╨╕ ╨╛╤А╨│╨░╨╜╨╕╨╖╨░╤Ж╨╕╤П 
13	4	2024-09-19 12:04:54.174+03	2024-09-19 12:04:54.174+03	╨Р╨▓╤В╨╛╨╝╨╛╨▒╨╕╨╗╨╕
14	4	2024-09-19 12:04:54.179+03	2024-09-19 12:04:54.179+03	╨Ь╨╛╤В╨╛╤Ж╨╕╨║╨╗╤Л ╨╕ ╤Б╨║╤Г╤В╨╡╤А╤Л 
15	4	2024-09-19 12:04:54.183+03	2024-09-19 12:04:54.183+03	╨Ч╨░╨┐╤З╨░╤Б╤В╨╕ ╨╕ ╨░╨║╤Б╨╡╤Б╤Б╤Г╨░╤А╤Л
16	5	2024-09-19 12:05:40.846+03	2024-09-19 12:05:40.846+03	╨б╨┐╨╛╤А╤В╨╕╨▓╨╜╨╛╨╡ ╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡
17	5	2024-09-19 12:05:40.851+03	2024-09-19 12:05:40.851+03	╨в╤Г╤А╨╕╨╖╨╝ ╨╕ ╨║╨╡╨╝╨┐╨╕╨╜╨│
18	5	2024-09-19 12:05:40.855+03	2024-09-19 12:05:40.855+03	╨Т╨╡╨╗╨╛╤Б╨╕╨┐╨╡╨┤╤Л ╨╕ ╨░╨║╤Б╨╡╤Б╤Б╤Г╨░╤А╤Л
19	6	2024-09-19 12:06:45.227+03	2024-09-19 12:06:45.227+03	╨Ф╨╡╤В╤Б╨║╨╕╨╡ ╨╕╨│╤А╤Г╤И╨║╨╕
20	6	2024-09-19 12:06:45.23+03	2024-09-19 12:06:45.23+03	╨Э╨░╤Б╤В╨╛╨╗╤М╨╜╤Л╨╡ ╨╕╨│╤А╤Л
21	6	2024-09-19 12:06:45.235+03	2024-09-19 12:06:45.235+03	╨Ъ╨╛╨╜╤Б╤В╤А╤Г╨║╤В╨╛╤А╤Л
22	8	2024-09-19 12:12:20.016+03	2024-09-19 12:12:20.016+03	╨Ъ╨╛╤Б╨╝╨╡╤В╨╕╨║╨░
23	8	2024-09-19 12:12:20.019+03	2024-09-19 12:12:20.019+03	╨Я╨░╤А╤Д╤О╨╝╨╡╤А╨╕╤П
24	8	2024-09-19 12:12:20.025+03	2024-09-19 12:12:20.025+03	╨г╤Е╨╛╨┤ ╨╖╨░ ╨║╨╛╨╢╨╡╨╣
25	9	2024-09-19 12:12:57.996+03	2024-09-19 12:12:57.996+03	╨е╤Г╨┤╨╛╨╢╨╡╤Б╤В╨▓╨╡╨╜╨╜╤Л╨╡ ╨╝╨░╤В╨╡╤А╨╕╨░╨╗╤Л
26	9	2024-09-19 12:12:58.001+03	2024-09-19 12:12:58.001+03	╨а╨╡╨╝╨╡╤Б╨╗╨╡╨╜╨╜╤Л╨╡ ╨┐╤А╨╕╨╜╨░╨┤╨╗╨╡╨╢╨╜╨╛╤Б╤В╨╕
27	9	2024-09-19 12:12:58.004+03	2024-09-19 12:12:58.004+03	╨Ь╨╛╨┤╨╡╨╗╨╕╤А╨╛╨▓╨░╨╜╨╕╨╡ ╨╕ ╤Б╨▒╨╛╤А╨║╨░
28	10	2024-09-19 12:14:55.953+03	2024-09-19 12:14:55.953+03	╨Ъ╨╛╤А╨╝╨░ ╨╕ ╨░╨║╤Б╨╡╤Б╤Б╤Г╨░╤А╤Л
29	10	2024-09-19 12:14:55.957+03	2024-09-19 12:14:55.957+03	╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡ ╨┤╨╗╤П ╤Г╤Е╨╛╨┤╨░
30	10	2024-09-19 12:14:55.962+03	2024-09-19 12:14:55.962+03	╨Ц╨╕╨▓╨╛╤В╨╜╤Л╨╡ ╨╜╨░ ╨┐╤А╨╛╨┤╨░╨╢╤Г
31	11	2024-09-19 12:30:50.053+03	2024-09-19 12:30:50.053+03	╨Ъ╨▓╨░╤А╤В╨╕╤А╨░
32	11	2024-09-19 12:30:50.062+03	2024-09-19 12:30:50.062+03	╨Ф╨╛╨╝
33	11	2024-09-19 12:30:50.07+03	2024-09-19 12:30:50.07+03	╨г╤З╨░╤Б╤В╨╛╨║
34	11	2024-09-19 12:30:50.079+03	2024-09-19 12:30:50.079+03	╨б╤К╤С╨╝╨╜╨░╤П ╨Ъ╨▓╨░╤А╤В╨╕╤А╨░
35	11	2024-09-19 12:30:50.084+03	2024-09-19 12:30:50.084+03	╨б╤К╤С╨╝╨╜╤Л╨╣ ╨Ф╨╛╨╝
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, "firstName", "lastName", email, password, "phoneNumber", role, "createdAt", "updatedAt") FROM stdin;
1	John	Marshan	john.marshan@mail.ru	$2b$05$XvL/TEKjHPOLPO22gNup6etIcKbUMOc/0XuA7zRmKnPxTyLZbDpYC	+79407716272	Admin	2024-09-06 13:58:33.497+03	2024-09-06 13:58:33.497+03
2	John	Marshan	jeffrey.ilymof@mail.ru	$2b$05$GW9QgChFdNBTZJcmfWOFPOhzYQyoNdmZcP1rpsFrle01nJ4//Uo7O	+79407701227	USER	2024-09-19 20:16:02.75+03	2024-09-19 20:16:02.75+03
\.


--
-- Name: ads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ads_id_seq', 1, true);


--
-- Name: basket_Ads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."basket_Ads_id_seq"', 1, false);


--
-- Name: basket_ads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.basket_ads_id_seq', 1, false);


--
-- Name: baskets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.baskets_id_seq', 2, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 13, true);


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.images_id_seq', 2, true);


--
-- Name: regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.regions_id_seq', 7, true);


--
-- Name: subcategories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subcategories_id_seq', 35, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: ads ads_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ads
    ADD CONSTRAINT ads_pkey PRIMARY KEY (id);


--
-- Name: basket_Ads basket_Ads_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."basket_Ads"
    ADD CONSTRAINT "basket_Ads_pkey" PRIMARY KEY (id);


--
-- Name: basket_ads basket_ads_basketId_adId_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_ads
    ADD CONSTRAINT "basket_ads_basketId_adId_key" UNIQUE ("basketId", "adId");


--
-- Name: basket_ads basket_ads_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_ads
    ADD CONSTRAINT basket_ads_pkey PRIMARY KEY (id);


--
-- Name: baskets baskets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baskets
    ADD CONSTRAINT baskets_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: images images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);


--
-- Name: subcategories subcategories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subcategories
    ADD CONSTRAINT subcategories_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_email_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key1 UNIQUE (email);


--
-- Name: users users_email_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key10 UNIQUE (email);


--
-- Name: users users_email_key100; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key100 UNIQUE (email);


--
-- Name: users users_email_key101; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key101 UNIQUE (email);


--
-- Name: users users_email_key102; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key102 UNIQUE (email);


--
-- Name: users users_email_key103; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key103 UNIQUE (email);


--
-- Name: users users_email_key104; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key104 UNIQUE (email);


--
-- Name: users users_email_key105; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key105 UNIQUE (email);


--
-- Name: users users_email_key106; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key106 UNIQUE (email);


--
-- Name: users users_email_key107; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key107 UNIQUE (email);


--
-- Name: users users_email_key108; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key108 UNIQUE (email);


--
-- Name: users users_email_key109; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key109 UNIQUE (email);


--
-- Name: users users_email_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key11 UNIQUE (email);


--
-- Name: users users_email_key110; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key110 UNIQUE (email);


--
-- Name: users users_email_key111; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key111 UNIQUE (email);


--
-- Name: users users_email_key112; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key112 UNIQUE (email);


--
-- Name: users users_email_key113; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key113 UNIQUE (email);


--
-- Name: users users_email_key114; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key114 UNIQUE (email);


--
-- Name: users users_email_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key12 UNIQUE (email);


--
-- Name: users users_email_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key13 UNIQUE (email);


--
-- Name: users users_email_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key14 UNIQUE (email);


--
-- Name: users users_email_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key15 UNIQUE (email);


--
-- Name: users users_email_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key16 UNIQUE (email);


--
-- Name: users users_email_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key17 UNIQUE (email);


--
-- Name: users users_email_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key18 UNIQUE (email);


--
-- Name: users users_email_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key19 UNIQUE (email);


--
-- Name: users users_email_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key2 UNIQUE (email);


--
-- Name: users users_email_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key20 UNIQUE (email);


--
-- Name: users users_email_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key21 UNIQUE (email);


--
-- Name: users users_email_key22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key22 UNIQUE (email);


--
-- Name: users users_email_key23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key23 UNIQUE (email);


--
-- Name: users users_email_key24; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key24 UNIQUE (email);


--
-- Name: users users_email_key25; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key25 UNIQUE (email);


--
-- Name: users users_email_key26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key26 UNIQUE (email);


--
-- Name: users users_email_key27; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key27 UNIQUE (email);


--
-- Name: users users_email_key28; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key28 UNIQUE (email);


--
-- Name: users users_email_key29; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key29 UNIQUE (email);


--
-- Name: users users_email_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key3 UNIQUE (email);


--
-- Name: users users_email_key30; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key30 UNIQUE (email);


--
-- Name: users users_email_key31; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key31 UNIQUE (email);


--
-- Name: users users_email_key32; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key32 UNIQUE (email);


--
-- Name: users users_email_key33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key33 UNIQUE (email);


--
-- Name: users users_email_key34; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key34 UNIQUE (email);


--
-- Name: users users_email_key35; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key35 UNIQUE (email);


--
-- Name: users users_email_key36; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key36 UNIQUE (email);


--
-- Name: users users_email_key37; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key37 UNIQUE (email);


--
-- Name: users users_email_key38; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key38 UNIQUE (email);


--
-- Name: users users_email_key39; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key39 UNIQUE (email);


--
-- Name: users users_email_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key4 UNIQUE (email);


--
-- Name: users users_email_key40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key40 UNIQUE (email);


--
-- Name: users users_email_key41; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key41 UNIQUE (email);


--
-- Name: users users_email_key42; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key42 UNIQUE (email);


--
-- Name: users users_email_key43; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key43 UNIQUE (email);


--
-- Name: users users_email_key44; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key44 UNIQUE (email);


--
-- Name: users users_email_key45; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key45 UNIQUE (email);


--
-- Name: users users_email_key46; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key46 UNIQUE (email);


--
-- Name: users users_email_key47; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key47 UNIQUE (email);


--
-- Name: users users_email_key48; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key48 UNIQUE (email);


--
-- Name: users users_email_key49; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key49 UNIQUE (email);


--
-- Name: users users_email_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key5 UNIQUE (email);


--
-- Name: users users_email_key50; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key50 UNIQUE (email);


--
-- Name: users users_email_key51; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key51 UNIQUE (email);


--
-- Name: users users_email_key52; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key52 UNIQUE (email);


--
-- Name: users users_email_key53; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key53 UNIQUE (email);


--
-- Name: users users_email_key54; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key54 UNIQUE (email);


--
-- Name: users users_email_key55; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key55 UNIQUE (email);


--
-- Name: users users_email_key56; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key56 UNIQUE (email);


--
-- Name: users users_email_key57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key57 UNIQUE (email);


--
-- Name: users users_email_key58; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key58 UNIQUE (email);


--
-- Name: users users_email_key59; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key59 UNIQUE (email);


--
-- Name: users users_email_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key6 UNIQUE (email);


--
-- Name: users users_email_key60; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key60 UNIQUE (email);


--
-- Name: users users_email_key61; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key61 UNIQUE (email);


--
-- Name: users users_email_key62; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key62 UNIQUE (email);


--
-- Name: users users_email_key63; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key63 UNIQUE (email);


--
-- Name: users users_email_key64; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key64 UNIQUE (email);


--
-- Name: users users_email_key65; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key65 UNIQUE (email);


--
-- Name: users users_email_key66; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key66 UNIQUE (email);


--
-- Name: users users_email_key67; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key67 UNIQUE (email);


--
-- Name: users users_email_key68; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key68 UNIQUE (email);


--
-- Name: users users_email_key69; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key69 UNIQUE (email);


--
-- Name: users users_email_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key7 UNIQUE (email);


--
-- Name: users users_email_key70; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key70 UNIQUE (email);


--
-- Name: users users_email_key71; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key71 UNIQUE (email);


--
-- Name: users users_email_key72; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key72 UNIQUE (email);


--
-- Name: users users_email_key73; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key73 UNIQUE (email);


--
-- Name: users users_email_key74; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key74 UNIQUE (email);


--
-- Name: users users_email_key75; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key75 UNIQUE (email);


--
-- Name: users users_email_key76; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key76 UNIQUE (email);


--
-- Name: users users_email_key77; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key77 UNIQUE (email);


--
-- Name: users users_email_key78; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key78 UNIQUE (email);


--
-- Name: users users_email_key79; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key79 UNIQUE (email);


--
-- Name: users users_email_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key8 UNIQUE (email);


--
-- Name: users users_email_key80; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key80 UNIQUE (email);


--
-- Name: users users_email_key81; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key81 UNIQUE (email);


--
-- Name: users users_email_key82; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key82 UNIQUE (email);


--
-- Name: users users_email_key83; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key83 UNIQUE (email);


--
-- Name: users users_email_key84; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key84 UNIQUE (email);


--
-- Name: users users_email_key85; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key85 UNIQUE (email);


--
-- Name: users users_email_key86; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key86 UNIQUE (email);


--
-- Name: users users_email_key87; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key87 UNIQUE (email);


--
-- Name: users users_email_key88; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key88 UNIQUE (email);


--
-- Name: users users_email_key89; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key89 UNIQUE (email);


--
-- Name: users users_email_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key9 UNIQUE (email);


--
-- Name: users users_email_key90; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key90 UNIQUE (email);


--
-- Name: users users_email_key91; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key91 UNIQUE (email);


--
-- Name: users users_email_key92; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key92 UNIQUE (email);


--
-- Name: users users_email_key93; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key93 UNIQUE (email);


--
-- Name: users users_email_key94; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key94 UNIQUE (email);


--
-- Name: users users_email_key95; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key95 UNIQUE (email);


--
-- Name: users users_email_key96; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key96 UNIQUE (email);


--
-- Name: users users_email_key97; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key97 UNIQUE (email);


--
-- Name: users users_email_key98; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key98 UNIQUE (email);


--
-- Name: users users_email_key99; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key99 UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: ads ads_categoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ads
    ADD CONSTRAINT "ads_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: ads ads_regionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ads
    ADD CONSTRAINT "ads_regionId_fkey" FOREIGN KEY ("regionId") REFERENCES public.regions(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: ads ads_subcategoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ads
    ADD CONSTRAINT "ads_subcategoryId_fkey" FOREIGN KEY ("subcategoryId") REFERENCES public.subcategories(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: basket_Ads basket_Ads_adId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."basket_Ads"
    ADD CONSTRAINT "basket_Ads_adId_fkey" FOREIGN KEY ("adId") REFERENCES public.ads(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: basket_ads basket_ads_adId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_ads
    ADD CONSTRAINT "basket_ads_adId_fkey" FOREIGN KEY ("adId") REFERENCES public.ads(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: basket_ads basket_ads_basketId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_ads
    ADD CONSTRAINT "basket_ads_basketId_fkey" FOREIGN KEY ("basketId") REFERENCES public.baskets(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: baskets baskets_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baskets
    ADD CONSTRAINT "baskets_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: images images_adId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT "images_adId_fkey" FOREIGN KEY ("adId") REFERENCES public.ads(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: subcategories subcategories_categoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subcategories
    ADD CONSTRAINT "subcategories_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

