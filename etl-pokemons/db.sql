--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Debian 15.2-1.pgdg110+1)
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

-- Started on 2023-02-26 19:08:58 WET

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

--
-- TOC entry 852 (class 1247 OID 19737)
-- Name: Type; Type: TYPE; Schema: public; Owner: zitrojj
--

CREATE TYPE public."Type" AS ENUM (
    'Bug',
    'Dark',
    'Dragon',
    'Electric',
    'Fairy',
    'Fighting',
    'Fire',
    'Flying',
    'Ghost',
    'Grass',
    'Ground',
    'Ice',
    'Normal',
    'Poison',
    'Psychic',
    'Rock',
    'Steel',
    'Water'
);


ALTER TYPE public."Type" OWNER TO zitrojj;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 214 (class 1259 OID 19725)
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: zitrojj
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO zitrojj;

--
-- TOC entry 218 (class 1259 OID 19794)
-- Name: charge_moves; Type: TABLE; Schema: public; Owner: zitrojj
--

CREATE TABLE public.charge_moves (
    name text NOT NULL,
    type public."Type" NOT NULL,
    power integer NOT NULL,
    energy_delta integer NOT NULL,
    duration integer NOT NULL,
    stamina_loss_scaler double precision NOT NULL,
    critical_chance double precision NOT NULL
);


ALTER TABLE public.charge_moves OWNER TO zitrojj;

--
-- TOC entry 217 (class 1259 OID 19787)
-- Name: fast_moves; Type: TABLE; Schema: public; Owner: zitrojj
--

CREATE TABLE public.fast_moves (
    name text NOT NULL,
    type public."Type" NOT NULL,
    power integer NOT NULL,
    energy_delta integer NOT NULL,
    duration integer NOT NULL,
    stamina_loss_scaler double precision NOT NULL
);


ALTER TABLE public.fast_moves OWNER TO zitrojj;

--
-- TOC entry 222 (class 1259 OID 19820)
-- Name: pokemon_charge_moves; Type: TABLE; Schema: public; Owner: zitrojj
--

CREATE TABLE public.pokemon_charge_moves (
    pokemon_id integer NOT NULL,
    charge_move_id text NOT NULL,
    form text NOT NULL
);


ALTER TABLE public.pokemon_charge_moves OWNER TO zitrojj;

--
-- TOC entry 224 (class 1259 OID 19834)
-- Name: pokemon_elite_charge_moves; Type: TABLE; Schema: public; Owner: zitrojj
--

CREATE TABLE public.pokemon_elite_charge_moves (
    pokemon_id integer NOT NULL,
    charge_move_id text NOT NULL,
    form text NOT NULL
);


ALTER TABLE public.pokemon_elite_charge_moves OWNER TO zitrojj;

--
-- TOC entry 223 (class 1259 OID 19827)
-- Name: pokemon_elite_fast_moves; Type: TABLE; Schema: public; Owner: zitrojj
--

CREATE TABLE public.pokemon_elite_fast_moves (
    pokemon_id integer NOT NULL,
    fast_move_id text NOT NULL,
    form text NOT NULL
);


ALTER TABLE public.pokemon_elite_fast_moves OWNER TO zitrojj;

--
-- TOC entry 221 (class 1259 OID 19813)
-- Name: pokemon_fast_moves; Type: TABLE; Schema: public; Owner: zitrojj
--

CREATE TABLE public.pokemon_fast_moves (
    pokemon_id integer NOT NULL,
    fast_move_id text NOT NULL,
    form text NOT NULL
);


ALTER TABLE public.pokemon_fast_moves OWNER TO zitrojj;

--
-- TOC entry 216 (class 1259 OID 19780)
-- Name: pokemon_stats; Type: TABLE; Schema: public; Owner: zitrojj
--

CREATE TABLE public.pokemon_stats (
    pokemon_id integer NOT NULL,
    base_stamina integer NOT NULL,
    base_attack integer NOT NULL,
    base_defense integer NOT NULL,
    name text NOT NULL,
    form text NOT NULL
);


ALTER TABLE public.pokemon_stats OWNER TO zitrojj;

--
-- TOC entry 219 (class 1259 OID 19801)
-- Name: pokemon_types; Type: TABLE; Schema: public; Owner: zitrojj
--

CREATE TABLE public.pokemon_types (
    pokemon_id integer NOT NULL,
    form text NOT NULL,
    type jsonb NOT NULL,
    pokemon_name text NOT NULL
);


ALTER TABLE public.pokemon_types OWNER TO zitrojj;

--
-- TOC entry 215 (class 1259 OID 19773)
-- Name: pokemons; Type: TABLE; Schema: public; Owner: zitrojj
--

CREATE TABLE public.pokemons (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.pokemons OWNER TO zitrojj;

--
-- TOC entry 226 (class 1259 OID 19848)
-- Name: pvp_charge_moves; Type: TABLE; Schema: public; Owner: zitrojj
--

CREATE TABLE public.pvp_charge_moves (
    move_id integer NOT NULL,
    name text NOT NULL,
    type public."Type" NOT NULL,
    power integer NOT NULL,
    energy_delta integer NOT NULL,
    turn_duration integer NOT NULL,
    buffs jsonb
);


ALTER TABLE public.pvp_charge_moves OWNER TO zitrojj;

--
-- TOC entry 225 (class 1259 OID 19841)
-- Name: pvp_fast_moves; Type: TABLE; Schema: public; Owner: zitrojj
--

CREATE TABLE public.pvp_fast_moves (
    move_id integer NOT NULL,
    name text NOT NULL,
    type public."Type" NOT NULL,
    power integer NOT NULL,
    energy_delta integer NOT NULL,
    turn_duration integer NOT NULL
);


ALTER TABLE public.pvp_fast_moves OWNER TO zitrojj;

--
-- TOC entry 220 (class 1259 OID 19808)
-- Name: type_effectiveness; Type: TABLE; Schema: public; Owner: zitrojj
--

CREATE TABLE public.type_effectiveness (
    attacking_type public."Type" NOT NULL,
    vs_bug double precision NOT NULL,
    vs_dark double precision NOT NULL,
    vs_dragon double precision NOT NULL,
    vs_electric double precision NOT NULL,
    vs_fairy double precision NOT NULL,
    vs_fighting double precision NOT NULL,
    vs_fire double precision NOT NULL,
    vs_flying double precision NOT NULL,
    vs_ghost double precision NOT NULL,
    vs_grass double precision NOT NULL,
    vs_ground double precision NOT NULL,
    vs_ice double precision NOT NULL,
    vs_normal double precision NOT NULL,
    vs_poison double precision NOT NULL,
    vs_psychic double precision NOT NULL,
    vs_rock double precision NOT NULL,
    vs_steel double precision NOT NULL,
    vs_water double precision NOT NULL
);


ALTER TABLE public.type_effectiveness OWNER TO zitrojj;

--
-- TOC entry 3404 (class 0 OID 19725)
-- Dependencies: 214
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: zitrojj
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
441e0bed-5935-4c8f-b127-c2983a10ffa3	1954bf359d36795e52839bf0231103c2d14f20a58861dab9c2a34cbfa21db53d	2023-02-26 17:18:42.331172+00	20230226171841_init	\N	\N	2023-02-26 17:18:42.039303+00	1
b43bea96-42e7-4fec-ae91-418616a22e76	d56a802375678eb95440451b54a0e465bdf1e4873ed89d5923cb9d17631376a1	2023-02-26 18:21:42.34624+00	20230226182142_fix_constraint_current_moves	\N	\N	2023-02-26 18:21:42.235179+00	1
f356b86f-c9ff-4a02-a579-9554564e3002	68fe2e9bebb3867e1b1d63c9cef7a6e1e0b06defc2d3e2442ec5c094f86107a4	2023-02-26 18:28:09.810158+00	20230226182809_fix_add_columns_form_to_all_moves	\N	\N	2023-02-26 18:28:09.711102+00	1
33760a03-3db0-4c77-9a42-d34582cd22f7	dd4a8259e6cbab7ecf7b053900a9a376363a2d0726f816e86f99ce58287b2a30	2023-02-26 18:53:10.355549+00	20230226185310_fix_pvp_charged_move_buff_null	\N	\N	2023-02-26 18:53:10.247055+00	1
\.


--
-- TOC entry 3408 (class 0 OID 19794)
-- Dependencies: 218
-- Data for Name: charge_moves; Type: TABLE DATA; Schema: public; Owner: zitrojj
--

COPY public.charge_moves (name, type, power, energy_delta, duration, stamina_loss_scaler, critical_chance) FROM stdin;
\.


--
-- TOC entry 3407 (class 0 OID 19787)
-- Dependencies: 217
-- Data for Name: fast_moves; Type: TABLE DATA; Schema: public; Owner: zitrojj
--

COPY public.fast_moves (name, type, power, energy_delta, duration, stamina_loss_scaler) FROM stdin;
\.


--
-- TOC entry 3412 (class 0 OID 19820)
-- Dependencies: 222
-- Data for Name: pokemon_charge_moves; Type: TABLE DATA; Schema: public; Owner: zitrojj
--

COPY public.pokemon_charge_moves (pokemon_id, charge_move_id, form) FROM stdin;
1	Sludge Bomb	Fall_2019
1	Seed Bomb	Fall_2019
1	Power Whip	Fall_2019
1	Sludge Bomb	Normal
1	Seed Bomb	Normal
1	Power Whip	Normal
2	Sludge Bomb	Normal
2	Solar Beam	Normal
2	Power Whip	Normal
3	Sludge Bomb	Copy_2019
3	Petal Blizzard	Copy_2019
3	Solar Beam	Copy_2019
3	Sludge Bomb	Normal
3	Petal Blizzard	Normal
3	Solar Beam	Normal
4	Flame Charge	Fall_2019
4	Flame Burst	Fall_2019
4	Flamethrower	Fall_2019
4	Flame Charge	Normal
4	Flame Burst	Normal
4	Flamethrower	Normal
5	Fire Punch	Normal
5	Flame Burst	Normal
5	Flamethrower	Normal
6	Fire Blast	Copy_2019
6	Dragon Claw	Copy_2019
6	Overheat	Copy_2019
6	Fire Blast	Normal
6	Dragon Claw	Normal
6	Overheat	Normal
7	Aqua Jet	Fall_2019
7	Aqua Tail	Fall_2019
7	Water Pulse	Fall_2019
7	Aqua Jet	Normal
7	Aqua Tail	Normal
7	Water Pulse	Normal
8	Aqua Jet	Normal
8	Ice Beam	Normal
8	Hydro Pump	Normal
9	Flash Cannon	Copy_2019
9	Ice Beam	Copy_2019
9	Hydro Pump	Copy_2019
9	Skull Bash	Copy_2019
9	Flash Cannon	Normal
9	Ice Beam	Normal
9	Hydro Pump	Normal
9	Skull Bash	Normal
10	Struggle	Normal
11	Struggle	Normal
12	Bug Buzz	Normal
12	Psychic	Normal
12	Signal Beam	Normal
13	Struggle	Normal
14	Struggle	Normal
15	Sludge Bomb	Normal
15	Aerial Ace	Normal
15	X Scissor	Normal
15	Fell Stinger	Normal
16	Twister	Normal
16	Aerial Ace	Normal
16	Air Cutter	Normal
17	Twister	Normal
17	Aerial Ace	Normal
17	Air Cutter	Normal
18	Hurricane	Normal
18	Aerial Ace	Normal
18	Brave Bird	Normal
18	Feather Dance	Normal
19	Crunch	Alola
19	Hyper Fang	Alola
19	Shadow Ball	Alola
19	Dig	Normal
19	Hyper Fang	Normal
19	Body Slam	Normal
20	Crunch	Alola
20	Hyper Fang	Alola
20	Hyper Beam	Alola
20	Dig	Normal
20	Hyper Fang	Normal
20	Hyper Beam	Normal
21	Aerial Ace	Normal
21	Drill Peck	Normal
21	Sky Attack	Normal
22	Aerial Ace	Normal
22	Drill Run	Normal
22	Sky Attack	Normal
23	Wrap	Normal
23	Poison Fang	Normal
23	Sludge Bomb	Normal
24	Dark Pulse	Normal
24	Sludge Wave	Normal
24	Gunk Shot	Normal
24	Acid Spray	Normal
25	Discharge	Adventure_hat_2020
25	Thunderbolt	Adventure_hat_2020
25	Wild Charge	Adventure_hat_2020
25	Discharge	Copy_2019
25	Thunderbolt	Copy_2019
25	Wild Charge	Copy_2019
25	Discharge	Costume_2020
25	Thunderbolt	Costume_2020
25	Wild Charge	Costume_2020
25	Fly	Costume_2020
25	Discharge	Fall_2019
25	Thunderbolt	Fall_2019
25	Wild Charge	Fall_2019
25	Discharge	Flying_01
25	Thunderbolt	Flying_01
25	Wild Charge	Flying_01
25	Fly	Flying_01
25	Discharge	Flying_02
25	Thunderbolt	Flying_02
25	Wild Charge	Flying_02
25	Fly	Flying_02
25	Discharge	Flying_5th_anniv
25	Thunderbolt	Flying_5th_anniv
25	Wild Charge	Flying_5th_anniv
25	Fly	Flying_5th_anniv
25	Discharge	Flying_okinawa
25	Thunderbolt	Flying_okinawa
25	Wild Charge	Flying_okinawa
25	Fly	Flying_okinawa
25	Discharge	Gofest_2022
25	Thunderbolt	Gofest_2022
25	Wild Charge	Gofest_2022
25	Discharge	Kariyushi
25	Thunderbolt	Kariyushi
25	Wild Charge	Kariyushi
25	Discharge	Normal
25	Thunderbolt	Normal
25	Wild Charge	Normal
25	Draining Kiss	Pop_star
25	Thunder Punch	Pop_star
25	Play Rough	Pop_star
25	Meteor Mash	Rock_star
25	Thunder Punch	Rock_star
25	Play Rough	Rock_star
25	Discharge	Tshirt_01
25	Thunderbolt	Tshirt_01
25	Wild Charge	Tshirt_01
25	Discharge	Tshirt_02
25	Thunderbolt	Tshirt_02
25	Wild Charge	Tshirt_02
25	Flying Press	Vs_2019
25	Thunder Punch	Vs_2019
25	Play Rough	Vs_2019
25	Discharge	Wcs_2022
25	Thunderbolt	Wcs_2022
25	Wild Charge	Wcs_2022
25	Discharge	Winter_2020
25	Thunderbolt	Winter_2020
25	Wild Charge	Winter_2020
26	Psychic	Alola
26	Thunder Punch	Alola
26	Wild Charge	Alola
26	Grass Knot	Alola
26	Brick Break	Normal
26	Thunder Punch	Normal
26	Wild Charge	Normal
26	Skull Bash	Normal
27	Blizzard	Alola
27	Gyro Ball	Alola
27	Night Slash	Alola
27	Dig	Normal
27	Rock Slide	Normal
27	Sand Tomb	Normal
28	Blizzard	Alola
28	Gyro Ball	Alola
28	Bulldoze	Alola
28	Ice Punch	Alola
28	Earthquake	Normal
28	Rock Tomb	Normal
28	Bulldoze	Normal
29	Poison Fang	Normal
29	Body Slam	Normal
29	Sludge Bomb	Normal
30	Poison Fang	Normal
30	Dig	Normal
30	Sludge Bomb	Normal
30	Thunderbolt	Normal
31	Earthquake	Normal
31	Sludge Wave	Normal
31	Stone Edge	Normal
31	Earth Power	Normal
31	Poison Fang	Normal
32	Horn Attack	Normal
32	Body Slam	Normal
32	Sludge Bomb	Normal
33	Horn Attack	Normal
33	Dig	Normal
33	Sludge Bomb	Normal
33	Ice Beam	Normal
34	Earthquake	Normal
34	Sludge Wave	Normal
34	Megahorn	Normal
34	Earth Power	Normal
34	Sand Tomb	Normal
35	Disarming Voice	Normal
35	Body Slam	Normal
35	Moonblast	Normal
36	Dazzling Gleam	Normal
36	Psychic	Normal
36	Moonblast	Normal
36	Meteor Mash	Normal
37	Dark Pulse	Alola
37	Ice Beam	Alola
37	Blizzard	Alola
37	Weather Ball Ice	Alola
37	Body Slam	Normal
37	Flamethrower	Normal
37	Flame Charge	Normal
37	Weather Ball Fire	Normal
38	Dazzling Gleam	Alola
38	Ice Beam	Alola
38	Blizzard	Alola
38	Psyshock	Alola
38	Weather Ball Ice	Alola
38	Heat Wave	Normal
38	Overheat	Normal
38	Solar Beam	Normal
38	Psyshock	Normal
38	Weather Ball Fire	Normal
39	Disarming Voice	Normal
39	Gyro Ball	Normal
39	Dazzling Gleam	Normal
40	Dazzling Gleam	Normal
40	Hyper Beam	Normal
40	Play Rough	Normal
40	Ice Beam	Normal
41	Poison Fang	Normal
41	Air Cutter	Normal
41	Swift	Normal
42	Shadow Ball	Normal
42	Air Cutter	Normal
42	Poison Fang	Normal
43	Seed Bomb	Normal
43	Sludge Bomb	Normal
43	Moonblast	Normal
44	Petal Blizzard	Normal
44	Sludge Bomb	Normal
44	Moonblast	Normal
45	Petal Blizzard	Normal
45	Solar Beam	Normal
45	Moonblast	Normal
45	Sludge Bomb	Normal
46	Cross Poison	Normal
46	X Scissor	Normal
46	Seed Bomb	Normal
47	Cross Poison	Normal
47	X Scissor	Normal
47	Solar Beam	Normal
48	Poison Fang	Normal
48	Psybeam	Normal
48	Signal Beam	Normal
49	Silver Wind	Normal
49	Psychic	Normal
49	Bug Buzz	Normal
49	Poison Fang	Normal
50	Dig	Alola
50	Mud Bomb	Alola
50	Rock Tomb	Alola
50	Dig	Normal
50	Mud Bomb	Normal
50	Rock Tomb	Normal
51	Earthquake	Alola
51	Mud Bomb	Alola
51	Iron Head	Alola
51	Earthquake	Normal
51	Mud Bomb	Normal
51	Stone Edge	Normal
52	Night Slash	Alola
52	Dark Pulse	Alola
52	Foul Play	Alola
52	Night Slash	Galarian
52	Gyro Ball	Galarian
52	Dig	Galarian
52	Night Slash	Normal
52	Dark Pulse	Normal
52	Foul Play	Normal
53	Foul Play	Alola
53	Dark Pulse	Alola
53	Play Rough	Alola
53	Payback	Alola
53	Foul Play	Normal
53	Power Gem	Normal
53	Play Rough	Normal
53	Payback	Normal
54	Psybeam	Normal
54	Aqua Tail	Normal
54	Cross Chop	Normal
55	Psychic	Normal
55	Hydro Pump	Normal
55	Ice Beam	Normal
55	Bubble Beam	Normal
55	Synchronoise	Normal
55	Cross Chop	Normal
56	Cross Chop	Normal
56	Low Sweep	Normal
56	Brick Break	Normal
57	Close Combat	Normal
57	Low Sweep	Normal
57	Night Slash	Normal
57	Ice Punch	Normal
58	Rock Slide	Hisuian
58	Crunch	Hisuian
58	Flamethrower	Hisuian
58	Flame Wheel	Normal
58	Body Slam	Normal
58	Flamethrower	Normal
59	Rock Slide	Hisuian
59	Wild Charge	Hisuian
59	Crunch	Hisuian
59	Flamethrower	Hisuian
59	Fire Blast	Normal
59	Wild Charge	Normal
59	Crunch	Normal
59	Flamethrower	Normal
59	Psychic Fangs	Normal
60	Bubble Beam	Normal
60	Mud Bomb	Normal
60	Body Slam	Normal
61	Water Pulse	Normal
61	Mud Bomb	Normal
61	Bubble Beam	Normal
62	Hydro Pump	Normal
62	Dynamic Punch	Normal
62	Ice Punch	Normal
62	Power Up Punch	Normal
62	Scald	Normal
63	Psyshock	Normal
63	Signal Beam	Normal
63	Shadow Ball	Normal
64	Psybeam	Normal
64	Dazzling Gleam	Normal
64	Shadow Ball	Normal
65	Futuresight	Normal
65	Focus Blast	Normal
65	Shadow Ball	Normal
65	Fire Punch	Normal
66	Low Sweep	Normal
66	Brick Break	Normal
66	Cross Chop	Normal
67	Submission	Normal
67	Brick Break	Normal
67	Dynamic Punch	Normal
68	Heavy Slam	Normal
68	Dynamic Punch	Normal
68	Close Combat	Normal
68	Rock Slide	Normal
68	Cross Chop	Normal
69	Power Whip	Normal
69	Sludge Bomb	Normal
69	Wrap	Normal
70	Power Whip	Normal
70	Sludge Bomb	Normal
70	Seed Bomb	Normal
71	Leaf Blade	Normal
71	Sludge Bomb	Normal
71	Solar Beam	Normal
71	Leaf Tornado	Normal
71	Acid Spray	Normal
72	Bubble Beam	Normal
72	Water Pulse	Normal
72	Wrap	Normal
73	Hydro Pump	Normal
73	Sludge Wave	Normal
73	Blizzard	Normal
73	Acid Spray	Normal
73	Scald	Normal
74	Rock Slide	Alola
74	Rock Tomb	Alola
74	Thunderbolt	Alola
74	Rock Slide	Normal
74	Rock Tomb	Normal
74	Dig	Normal
75	Thunderbolt	Alola
75	Stone Edge	Alola
75	Rock Blast	Alola
75	Dig	Normal
75	Stone Edge	Normal
75	Rock Blast	Normal
76	Stone Edge	Alola
76	Rock Blast	Alola
76	Wild Charge	Alola
76	Stone Edge	Normal
76	Rock Blast	Normal
76	Earthquake	Normal
76	Ancient Power	Normal
77	Play Rough	Galarian
77	Psybeam	Galarian
77	Swift	Galarian
77	Flame Charge	Normal
77	Flame Wheel	Normal
77	Stomp	Normal
78	Play Rough	Galarian
78	Psychic	Galarian
78	Body Slam	Galarian
78	Megahorn	Galarian
78	High Horsepower	Galarian
78	Fire Blast	Normal
78	Drill Run	Normal
78	Heat Wave	Normal
78	Flame Charge	Normal
79	Water Pulse	2020
79	Psyshock	2020
79	Psychic	2020
79	Surf	Galarian
79	Psyshock	Galarian
79	Psychic	Galarian
79	Water Pulse	Normal
79	Psyshock	Normal
79	Psychic	Normal
80	Water Pulse	2021
80	Psychic	2021
80	Ice Beam	2021
80	Focus Blast	Galarian
80	Psychic	Galarian
80	Sludge Bomb	Galarian
80	Water Pulse	Normal
80	Psychic	Normal
80	Ice Beam	Normal
81	Discharge	Normal
81	Magnet Bomb	Normal
81	Thunderbolt	Normal
82	Zap Cannon	Normal
82	Magnet Bomb	Normal
82	Flash Cannon	Normal
82	Discharge	Normal
83	Brick Break	Galarian
83	Brave Bird	Galarian
83	Leaf Blade	Galarian
83	Aerial Ace	Normal
83	Air Cutter	Normal
83	Leaf Blade	Normal
84	Drill Peck	Normal
84	Aerial Ace	Normal
84	Brave Bird	Normal
85	Drill Peck	Normal
85	Aerial Ace	Normal
85	Brave Bird	Normal
86	Aurora Beam	Normal
86	Icy Wind	Normal
86	Aqua Tail	Normal
87	Aurora Beam	Normal
87	Water Pulse	Normal
87	Blizzard	Normal
88	Crunch	Alola
88	Gunk Shot	Alola
88	Sludge Bomb	Alola
88	Sludge	Normal
88	Mud Bomb	Normal
88	Sludge Bomb	Normal
89	Dark Pulse	Alola
89	Gunk Shot	Alola
89	Sludge Wave	Alola
89	Acid Spray	Alola
89	Dark Pulse	Normal
89	Gunk Shot	Normal
89	Sludge Wave	Normal
89	Thunder Punch	Normal
89	Acid Spray	Normal
90	Bubble Beam	Normal
90	Water Pulse	Normal
90	Icy Wind	Normal
91	Aurora Beam	Normal
91	Hydro Pump	Normal
91	Avalanche	Normal
91	Icy Wind	Normal
92	Night Shade	Normal
92	Dark Pulse	Normal
92	Sludge Bomb	Normal
93	Shadow Punch	Normal
93	Dark Pulse	Normal
93	Sludge Bomb	Normal
93	Shadow Ball	Normal
93	Ice Punch	Normal
94	Shadow Ball	Costume_2020
94	Focus Blast	Costume_2020
94	Sludge Bomb	Costume_2020
94	Shadow Ball	Normal
94	Focus Blast	Normal
94	Sludge Bomb	Normal
95	Sand Tomb	Normal
95	Stone Edge	Normal
95	Heavy Slam	Normal
96	Psybeam	Normal
96	Psyshock	Normal
96	Psychic	Normal
97	Futuresight	Normal
97	Psychic	Normal
97	Focus Blast	Normal
97	Fire Punch	Normal
97	Ice Punch	Normal
97	Thunder Punch	Normal
97	Shadow Ball	Normal
98	Vice Grip	Normal
98	Bubble Beam	Normal
98	Water Pulse	Normal
99	Vice Grip	Normal
99	X Scissor	Normal
99	Water Pulse	Normal
99	Crabhammer	Normal
100	Swift	Hisuian
100	Thunderbolt	Hisuian
100	Energy Ball	Hisuian
100	Discharge	Normal
100	Thunderbolt	Normal
100	Gyro Ball	Normal
101	Swift	Hisuian
101	Wild Charge	Hisuian
101	Energy Ball	Hisuian
101	Discharge	Normal
101	Thunderbolt	Normal
101	Hyper Beam	Normal
101	Foul Play	Normal
102	Seed Bomb	Normal
102	Psychic	Normal
102	Ancient Power	Normal
103	Seed Bomb	Alola
103	Dragon Pulse	Alola
103	Solar Beam	Alola
103	Seed Bomb	Normal
103	Psychic	Normal
103	Solar Beam	Normal
104	Bone Club	Normal
104	Dig	Normal
104	Bulldoze	Normal
105	Bone Club	Alola
105	Shadow Ball	Alola
105	Fire Blast	Alola
105	Flame Wheel	Alola
105	Bone Club	Normal
105	Dig	Normal
105	Earthquake	Normal
105	Rock Slide	Normal
106	Close Combat	Normal
106	Low Sweep	Normal
106	Stone Edge	Normal
107	Fire Punch	Normal
107	Ice Punch	Normal
107	Thunder Punch	Normal
107	Close Combat	Normal
107	Power Up Punch	Normal
108	Hyper Beam	Normal
108	Stomp	Normal
108	Power Whip	Normal
109	Sludge	Normal
109	Sludge Bomb	Normal
109	Dark Pulse	Normal
110	Sludge	Galarian
110	Hyper Beam	Galarian
110	Play Rough	Galarian
110	Overheat	Galarian
110	Brutal Swing	Galarian
110	Sludge Bomb	Normal
110	Shadow Ball	Normal
110	Dark Pulse	Normal
110	Thunderbolt	Normal
111	Bulldoze	Normal
111	Horn Attack	Normal
111	Stomp	Normal
112	Surf	Normal
112	Earthquake	Normal
112	Stone Edge	Normal
113	Psychic	Normal
113	Hyper Beam	Normal
113	Dazzling Gleam	Normal
114	Grass Knot	Normal
114	Sludge Bomb	Normal
114	Solar Beam	Normal
115	Crunch	Normal
115	Earthquake	Normal
115	Outrage	Normal
115	Power Up Punch	Normal
116	Bubble Beam	Normal
116	Dragon Pulse	Normal
116	Flash Cannon	Normal
117	Aurora Beam	Normal
117	Dragon Pulse	Normal
117	Hydro Pump	Normal
118	Water Pulse	Normal
118	Horn Attack	Normal
118	Aqua Tail	Normal
119	Ice Beam	Normal
119	Water Pulse	Normal
119	Megahorn	Normal
120	Swift	Normal
120	Bubble Beam	Normal
120	Power Gem	Normal
121	Hydro Pump	Normal
121	Power Gem	Normal
121	Psychic	Normal
121	Thunder	Normal
121	Ice Beam	Normal
122	Psybeam	Galarian
122	Psychic	Galarian
122	Ice Punch	Galarian
122	Psybeam	Normal
122	Psychic	Normal
122	Shadow Ball	Normal
123	Night Slash	Normal
123	X Scissor	Normal
123	Aerial Ace	Normal
124	Draining Kiss	Normal
124	Avalanche	Normal
124	Psyshock	Normal
124	Focus Blast	Normal
125	Thunder Punch	Normal
125	Thunderbolt	Normal
125	Thunder	Normal
126	Fire Blast	Normal
126	Fire Punch	Normal
126	Flamethrower	Normal
127	Vice Grip	Normal
127	X Scissor	Normal
127	Close Combat	Normal
127	Super Power	Normal
128	Horn Attack	Normal
128	Iron Head	Normal
128	Earthquake	Normal
129	Struggle	Normal
130	Hydro Pump	Normal
130	Crunch	Normal
130	Outrage	Normal
130	Twister	Normal
131	Hydro Pump	Costume_2020
131	Surf	Costume_2020
131	Blizzard	Costume_2020
131	Skull Bash	Costume_2020
131	Hydro Pump	Normal
131	Surf	Normal
131	Blizzard	Normal
131	Skull Bash	Normal
132	Struggle	Normal
133	Dig	Normal
133	Swift	Normal
134	Water Pulse	Normal
134	Hydro Pump	Normal
134	Aqua Tail	Normal
135	Discharge	Normal
135	Thunderbolt	Normal
135	Thunder	Normal
136	Fire Blast	Normal
136	Flamethrower	Normal
136	Overheat	Normal
137	Solar Beam	Normal
137	Hyper Beam	Normal
137	Zap Cannon	Normal
138	Ancient Power	Normal
138	Bubble Beam	Normal
138	Rock Blast	Normal
139	Ancient Power	Normal
139	Hydro Pump	Normal
139	Rock Blast	Normal
140	Ancient Power	Normal
140	Aqua Jet	Normal
140	Rock Tomb	Normal
141	Ancient Power	Normal
141	Water Pulse	Normal
141	Stone Edge	Normal
142	Ancient Power	Normal
142	Iron Head	Normal
142	Hyper Beam	Normal
142	Rock Slide	Normal
142	Earth Power	Normal
143	Heavy Slam	Normal
143	Hyper Beam	Normal
143	Earthquake	Normal
143	Outrage	Normal
143	Skull Bash	Normal
143	Body Slam	Normal
143	Super Power	Normal
144	Futuresight	Galarian
144	Ancient Power	Galarian
144	Brave Bird	Galarian
144	Ice Beam	Normal
144	Icy Wind	Normal
144	Blizzard	Normal
144	Ancient Power	Normal
145	Close Combat	Galarian
145	Ancient Power	Galarian
145	Brave Bird	Galarian
145	Zap Cannon	Normal
145	Thunderbolt	Normal
145	Thunder	Normal
145	Ancient Power	Normal
145	Drill Peck	Normal
146	Payback	Galarian
146	Ancient Power	Galarian
146	Brave Bird	Galarian
146	Fire Blast	Normal
146	Heat Wave	Normal
146	Overheat	Normal
146	Ancient Power	Normal
147	Wrap	Normal
147	Twister	Normal
147	Aqua Tail	Normal
148	Wrap	Normal
148	Aqua Tail	Normal
148	Dragon Pulse	Normal
148	Body Slam	Normal
149	Hurricane	Normal
149	Hyper Beam	Normal
149	Outrage	Normal
149	Dragon Claw	Normal
149	Super Power	Normal
150	Rock Slide	A
150	Dynamic Punch	A
150	Earthquake	A
150	Futuresight	A
150	Psychic	Normal
150	Thunderbolt	Normal
150	Ice Beam	Normal
150	Focus Blast	Normal
150	Flamethrower	Normal
151	Psychic	Normal
151	Ancient Power	Normal
151	Dragon Claw	Normal
151	Psyshock	Normal
151	Ice Beam	Normal
151	Blizzard	Normal
151	Hyper Beam	Normal
151	Solar Beam	Normal
151	Thunderbolt	Normal
151	Thunder	Normal
151	Flame Charge	Normal
151	Low Sweep	Normal
151	Overheat	Normal
151	Focus Blast	Normal
151	Energy Ball	Normal
151	Stone Edge	Normal
151	Gyro Ball	Normal
151	Bulldoze	Normal
151	Rock Slide	Normal
151	Grass Knot	Normal
151	Flash Cannon	Normal
151	Wild Charge	Normal
151	Dark Pulse	Normal
151	Dazzling Gleam	Normal
151	Surf	Normal
152	Energy Ball	Normal
152	Grass Knot	Normal
152	Body Slam	Normal
153	Energy Ball	Normal
153	Grass Knot	Normal
153	Ancient Power	Normal
154	Petal Blizzard	Normal
154	Solar Beam	Normal
154	Earthquake	Normal
155	Flame Charge	Normal
155	Swift	Normal
155	Flamethrower	Normal
156	Flame Charge	Normal
156	Dig	Normal
156	Flamethrower	Normal
157	Fire Blast	Normal
157	Overheat	Normal
157	Solar Beam	Normal
158	Crunch	Normal
158	Aqua Jet	Normal
158	Water Pulse	Normal
159	Crunch	Normal
159	Ice Punch	Normal
159	Water Pulse	Normal
160	Crunch	Normal
160	Hydro Pump	Normal
160	Ice Beam	Normal
161	Dig	Normal
161	Brick Break	Normal
161	Grass Knot	Normal
162	Dig	Normal
162	Brick Break	Normal
162	Hyper Beam	Normal
163	Aerial Ace	Normal
163	Sky Attack	Normal
163	Night Shade	Normal
164	Psychic	Normal
164	Sky Attack	Normal
164	Night Shade	Normal
164	Shadow Ball	Normal
165	Silver Wind	Normal
165	Swift	Normal
165	Aerial Ace	Normal
166	Bug Buzz	Normal
166	Silver Wind	Normal
166	Aerial Ace	Normal
166	Dynamic Punch	Normal
167	Night Slash	Normal
167	Signal Beam	Normal
167	Cross Poison	Normal
168	Shadow Sneak	Normal
168	Megahorn	Normal
168	Cross Poison	Normal
168	Lunge	Normal
169	Shadow Ball	Normal
169	Air Cutter	Normal
169	Sludge Bomb	Normal
169	Poison Fang	Normal
169	Cross Poison	Normal
170	Water Pulse	Normal
170	Thunderbolt	Normal
170	Bubble Beam	Normal
171	Hydro Pump	Normal
171	Thunderbolt	Normal
171	Thunder	Normal
171	Surf	Normal
172	Thunderbolt	Normal
172	Disarming Voice	Normal
172	Thunder Punch	Normal
173	Grass Knot	Normal
173	Psyshock	Normal
173	Signal Beam	Normal
174	Wild Charge	Normal
174	Shadow Ball	Normal
174	Psychic	Normal
175	Ancient Power	Normal
175	Psyshock	Normal
175	Dazzling Gleam	Normal
176	Ancient Power	Normal
176	Dazzling Gleam	Normal
176	Aerial Ace	Normal
177	Night Shade	Normal
177	Psyshock	Normal
177	Drill Peck	Normal
178	Ominous Wind	Normal
178	Futuresight	Normal
178	Aerial Ace	Normal
179	Body Slam	Normal
179	Thunderbolt	Normal
179	Discharge	Normal
180	Power Gem	Normal
180	Thunderbolt	Normal
180	Discharge	Normal
181	Zap Cannon	Normal
181	Focus Blast	Normal
181	Thunder	Normal
181	Power Gem	Normal
181	Thunder Punch	Normal
181	Brutal Swing	Normal
182	Leaf Blade	Normal
182	Petal Blizzard	Normal
182	Dazzling Gleam	Normal
183	Bubble Beam	Normal
183	Aqua Tail	Normal
183	Body Slam	Normal
184	Play Rough	Normal
184	Hydro Pump	Normal
184	Ice Beam	Normal
185	Stone Edge	Normal
185	Earthquake	Normal
185	Rock Slide	Normal
185	Rock Tomb	Normal
185	Meteor Beam	Normal
186	Hydro Pump	Normal
186	Blizzard	Normal
186	Surf	Normal
186	Weather Ball Water	Normal
187	Grass Knot	Normal
187	Dazzling Gleam	Normal
187	Seed Bomb	Normal
188	Grass Knot	Normal
188	Dazzling Gleam	Normal
188	Energy Ball	Normal
189	Energy Ball	Normal
189	Dazzling Gleam	Normal
189	Solar Beam	Normal
189	Aerial Ace	Normal
190	Low Sweep	Normal
190	Swift	Normal
190	Aerial Ace	Normal
191	Energy Ball	Normal
191	Grass Knot	Normal
191	Seed Bomb	Normal
192	Solar Beam	Normal
192	Petal Blizzard	Normal
192	Sludge Bomb	Normal
192	Leaf Storm	Normal
193	Ancient Power	Normal
193	Aerial Ace	Normal
193	Silver Wind	Normal
194	Mud Bomb	Normal
194	Dig	Normal
194	Body Slam	Normal
195	Sludge Bomb	Normal
195	Earthquake	Normal
195	Stone Edge	Normal
195	Acid Spray	Normal
196	Psybeam	Normal
196	Psychic	Normal
196	Futuresight	Normal
196	Psychic Fangs	Normal
197	Dark Pulse	Normal
197	Foul Play	Normal
198	Drill Peck	Normal
198	Foul Play	Normal
198	Dark Pulse	Normal
199	Blizzard	2022
199	Psychic	2022
199	Fire Blast	2022
199	Futuresight	Galarian
199	Shadow Ball	Galarian
199	Sludge Wave	Galarian
199	Blizzard	Normal
199	Psychic	Normal
199	Fire Blast	Normal
200	Shadow Sneak	Normal
200	Dark Pulse	Normal
200	Ominous Wind	Normal
201	Struggle	Normal
202	Mirror Coat	Normal
203	Psychic	Normal
203	Thunderbolt	Normal
203	Mirror Coat	Normal
203	Psychic Fangs	Normal
204	Gyro Ball	Normal
204	Rock Tomb	Normal
204	Sand Tomb	Normal
205	Heavy Slam	Normal
205	Earthquake	Normal
205	Rock Tomb	Normal
205	Sand Tomb	Normal
205	Mirror Shot	Normal
206	Dig	Normal
206	Rock Slide	Normal
206	Drill Run	Normal
207	Dig	Normal
207	Aerial Ace	Normal
207	Night Slash	Normal
208	Earthquake	Normal
208	Heavy Slam	Normal
208	Crunch	Normal
208	Psychic Fangs	Normal
209	Crunch	Normal
209	Dazzling Gleam	Normal
209	Brick Break	Normal
210	Crunch	Normal
210	Play Rough	Normal
210	Close Combat	Normal
211	Aqua Tail	Hisuian
211	Ice Beam	Hisuian
211	Sludge Bomb	Hisuian
211	Dark Pulse	Hisuian
211	Shadow Ball	Hisuian
211	Aqua Tail	Normal
211	Ice Beam	Normal
211	Sludge Wave	Normal
211	Acid Spray	Normal
211	Fell Stinger	Normal
212	X Scissor	Normal
212	Iron Head	Normal
212	Night Slash	Normal
213	Rock Blast	Normal
213	Stone Edge	Normal
213	Gyro Ball	Normal
214	Megahorn	Normal
214	Close Combat	Normal
214	Earthquake	Normal
214	Rock Blast	Normal
215	Aerial Ace	Hisuian
215	Close Combat	Hisuian
215	X Scissor	Hisuian
215	Avalanche	Normal
215	Ice Punch	Normal
215	Foul Play	Normal
216	Cross Chop	Normal
216	Crunch	Normal
216	Play Rough	Normal
217	Close Combat	Normal
217	Hyper Beam	Normal
217	Play Rough	Normal
218	Flame Burst	Normal
218	Flame Charge	Normal
218	Rock Slide	Normal
219	Heat Wave	Normal
219	Overheat	Normal
219	Stone Edge	Normal
219	Rock Tomb	Normal
220	Icy Wind	Normal
220	Body Slam	Normal
220	Rock Slide	Normal
221	Avalanche	Normal
221	Bulldoze	Normal
221	Stone Edge	Normal
221	High Horsepower	Normal
222	Rock Blast	Normal
222	Power Gem	Normal
222	Bubble Beam	Normal
223	Aurora Beam	Normal
223	Water Pulse	Normal
223	Rock Blast	Normal
224	Gunk Shot	Normal
224	Water Pulse	Normal
224	Aurora Beam	Normal
224	Acid Spray	Normal
224	Octazooka	Normal
225	Ice Punch	Normal
225	Icy Wind	Normal
225	Aerial Ace	Normal
225	Ice Punch	Winter_2020
225	Icy Wind	Winter_2020
225	Aerial Ace	Winter_2020
226	Water Pulse	Normal
226	Ice Beam	Normal
226	Aerial Ace	Normal
226	Bubble Beam	Normal
227	Brave Bird	Normal
227	Sky Attack	Normal
227	Flash Cannon	Normal
228	Crunch	Normal
228	Flamethrower	Normal
228	Dark Pulse	Normal
229	Crunch	Normal
229	Fire Blast	Normal
229	Foul Play	Normal
229	Flamethrower	Normal
230	Hydro Pump	Normal
230	Blizzard	Normal
230	Outrage	Normal
230	Octazooka	Normal
231	Bulldoze	Normal
231	Rock Slide	Normal
231	Body Slam	Normal
232	Earthquake	Normal
232	Heavy Slam	Normal
232	Play Rough	Normal
232	Body Slam	Normal
233	Solar Beam	Normal
233	Hyper Beam	Normal
233	Zap Cannon	Normal
233	Tri Attack	Normal
234	Stomp	Normal
234	Wild Charge	Normal
234	Megahorn	Normal
236	Brick Break	Normal
236	Rock Slide	Normal
236	Low Sweep	Normal
237	Close Combat	Normal
237	Gyro Ball	Normal
237	Stone Edge	Normal
238	Ice Beam	Normal
238	Ice Punch	Normal
238	Psyshock	Normal
239	Thunder Punch	Normal
239	Brick Break	Normal
239	Discharge	Normal
240	Brick Break	Normal
240	Fire Punch	Normal
240	Flame Burst	Normal
241	Stomp	Normal
241	Body Slam	Normal
241	Gyro Ball	Normal
241	Thunderbolt	Normal
241	Ice Beam	Normal
242	Psychic	Normal
242	Hyper Beam	Normal
242	Dazzling Gleam	Normal
243	Thunder	Normal
243	Thunderbolt	Normal
243	Wild Charge	Normal
243	Shadow Ball	Normal
243	Thunder	S
243	Thunderbolt	S
243	Wild Charge	S
243	Shadow Ball	S
244	Flamethrower	Normal
244	Fire Blast	Normal
244	Overheat	Normal
244	Iron Head	Normal
244	Flame Charge	Normal
244	Flamethrower	S
244	Fire Blast	S
244	Overheat	S
244	Iron Head	S
244	Flame Charge	S
245	Hydro Pump	Normal
245	Bubble Beam	Normal
245	Water Pulse	Normal
245	Ice Beam	Normal
245	Hydro Pump	S
245	Bubble Beam	S
245	Water Pulse	S
245	Ice Beam	S
246	Stomp	Normal
246	Crunch	Normal
246	Ancient Power	Normal
247	Dig	Normal
247	Crunch	Normal
247	Ancient Power	Normal
248	Fire Blast	Normal
248	Crunch	Normal
248	Stone Edge	Normal
249	Sky Attack	Normal
249	Hydro Pump	Normal
249	Futuresight	Normal
249	Sky Attack	S
249	Hydro Pump	S
249	Futuresight	S
250	Brave Bird	Normal
250	Fire Blast	Normal
250	Solar Beam	Normal
250	Brave Bird	S
250	Fire Blast	S
250	Solar Beam	S
251	Hyper Beam	Normal
251	Psychic	Normal
251	Dazzling Gleam	Normal
251	Seed Bomb	Normal
251	Leaf Storm	Normal
252	Energy Ball	Normal
252	Aerial Ace	Normal
252	Grass Knot	Normal
253	Leaf Blade	Normal
253	Aerial Ace	Normal
253	Grass Knot	Normal
254	Leaf Blade	Normal
254	Aerial Ace	Normal
254	Earthquake	Normal
254	Dragon Claw	Normal
255	Flame Charge	Normal
255	Flamethrower	Normal
255	Rock Tomb	Normal
256	Flame Charge	Normal
256	Flamethrower	Normal
256	Rock Slide	Normal
257	Focus Blast	Normal
257	Overheat	Normal
257	Brave Bird	Normal
257	Blaze Kick	Normal
258	Dig	Normal
258	Sludge	Normal
258	Stomp	Normal
259	Mud Bomb	Normal
259	Sludge	Normal
259	Surf	Normal
260	Earthquake	Normal
260	Sludge Wave	Normal
260	Surf	Normal
260	Muddy Water	Normal
261	Crunch	Normal
261	Dig	Normal
261	Poison Fang	Normal
262	Crunch	Normal
262	Play Rough	Normal
262	Poison Fang	Normal
263	Dig	Galarian
263	Body Slam	Galarian
263	Swift	Galarian
263	Dig	Normal
263	Grass Knot	Normal
263	Thunderbolt	Normal
264	Dig	Galarian
264	Body Slam	Galarian
264	Gunk Shot	Galarian
264	Dig	Normal
264	Grass Knot	Normal
264	Thunder	Normal
265	Struggle	Normal
266	Struggle	Normal
267	Silver Wind	Normal
267	Air Cutter	Normal
267	Bug Buzz	Normal
268	Struggle	Normal
269	Silver Wind	Normal
269	Sludge Bomb	Normal
269	Bug Buzz	Normal
270	Bubble Beam	Normal
270	Energy Ball	Normal
271	Bubble Beam	Normal
271	Ice Beam	Normal
271	Grass Knot	Normal
272	Hydro Pump	Normal
272	Blizzard	Normal
272	Solar Beam	Normal
272	Ice Beam	Normal
272	Energy Ball	Normal
272	Leaf Storm	Normal
273	Energy Ball	Normal
273	Grass Knot	Normal
273	Foul Play	Normal
274	Leaf Blade	Normal
274	Grass Knot	Normal
274	Foul Play	Normal
275	Leaf Blade	Normal
275	Hurricane	Normal
275	Foul Play	Normal
275	Leaf Tornado	Normal
276	Aerial Ace	Normal
277	Aerial Ace	Normal
277	Brave Bird	Normal
277	Sky Attack	Normal
278	Water Pulse	Normal
278	Air Cutter	Normal
278	Ice Beam	Normal
279	Hydro Pump	Normal
279	Hurricane	Normal
279	Blizzard	Normal
279	Weather Ball Water	Normal
280	Psyshock	Normal
280	Disarming Voice	Normal
280	Shadow Sneak	Normal
281	Psychic	Normal
281	Disarming Voice	Normal
281	Shadow Sneak	Normal
282	Psychic	Normal
282	Dazzling Gleam	Normal
282	Shadow Ball	Normal
283	Aqua Jet	Normal
283	Bubble Beam	Normal
283	Signal Beam	Normal
284	Air Cutter	Normal
284	Ominous Wind	Normal
284	Silver Wind	Normal
284	Bubble Beam	Normal
284	Lunge	Normal
285	Seed Bomb	Normal
285	Grass Knot	Normal
285	Energy Ball	Normal
286	Dynamic Punch	Normal
286	Seed Bomb	Normal
286	Sludge Bomb	Normal
287	Body Slam	Normal
287	Night Slash	Normal
287	Brick Break	Normal
288	Body Slam	Normal
288	Bulldoze	Normal
288	Brick Break	Normal
289	Hyper Beam	Normal
289	Play Rough	Normal
289	Earthquake	Normal
290	Night Slash	Normal
290	Bug Buzz	Normal
290	Aerial Ace	Normal
291	Shadow Ball	Normal
291	Bug Buzz	Normal
291	Aerial Ace	Normal
292	Shadow Sneak	Normal
292	Aerial Ace	Normal
292	Dig	Normal
293	Stomp	Normal
293	Disarming Voice	Normal
293	Flamethrower	Normal
294	Stomp	Normal
294	Disarming Voice	Normal
294	Flamethrower	Normal
295	Crunch	Normal
295	Disarming Voice	Normal
295	Fire Blast	Normal
296	Heavy Slam	Normal
296	Low Sweep	Normal
296	Cross Chop	Normal
297	Heavy Slam	Normal
297	Close Combat	Normal
297	Dynamic Punch	Normal
297	Super Power	Normal
298	Bubble Beam	Normal
298	Ice Beam	Normal
298	Body Slam	Normal
299	Rock Blast	Normal
299	Rock Slide	Normal
299	Thunderbolt	Normal
300	Dig	Normal
300	Disarming Voice	Normal
300	Wild Charge	Normal
301	Play Rough	Normal
301	Disarming Voice	Normal
301	Wild Charge	Normal
302	Power Gem	Costume_2020
302	Foul Play	Costume_2020
302	Shadow Sneak	Costume_2020
302	Power Gem	Normal
302	Foul Play	Normal
302	Shadow Sneak	Normal
303	Play Rough	Normal
303	Vice Grip	Normal
303	Iron Head	Normal
303	Power Up Punch	Normal
304	Iron Head	Normal
304	Rock Tomb	Normal
304	Body Slam	Normal
305	Body Slam	Normal
305	Rock Slide	Normal
305	Heavy Slam	Normal
305	Rock Tomb	Normal
306	Thunder	Normal
306	Stone Edge	Normal
306	Heavy Slam	Normal
306	Rock Tomb	Normal
306	Meteor Beam	Normal
307	Ice Punch	Normal
307	Psyshock	Normal
307	Low Sweep	Normal
308	Ice Punch	Normal
308	Psychic	Normal
308	Dynamic Punch	Normal
308	Power Up Punch	Normal
309	Thunderbolt	Normal
309	Discharge	Normal
309	Swift	Normal
310	Thunder	Normal
310	Wild Charge	Normal
310	Flame Burst	Normal
310	Overheat	Normal
310	Psychic Fangs	Normal
311	Thunderbolt	Normal
311	Discharge	Normal
311	Swift	Normal
311	Grass Knot	Normal
312	Thunderbolt	Normal
312	Discharge	Normal
312	Swift	Normal
312	Grass Knot	Normal
313	Signal Beam	Normal
313	Bug Buzz	Normal
313	Thunderbolt	Normal
314	Silver Wind	Normal
314	Bug Buzz	Normal
314	Dazzling Gleam	Normal
315	Petal Blizzard	Normal
315	Sludge Bomb	Normal
315	Dazzling Gleam	Normal
316	Sludge	Normal
316	Gunk Shot	Normal
316	Ice Beam	Normal
317	Gunk Shot	Normal
317	Sludge Bomb	Normal
317	Ice Beam	Normal
317	Acid Spray	Normal
318	Aqua Jet	Normal
318	Crunch	Normal
318	Poison Fang	Normal
319	Hydro Pump	Normal
319	Crunch	Normal
319	Poison Fang	Normal
320	Heavy Slam	Normal
320	Water Pulse	Normal
320	Body Slam	Normal
321	Surf	Normal
321	Blizzard	Normal
321	Hyper Beam	Normal
322	Bulldoze	Normal
322	Heat Wave	Normal
322	Stomp	Normal
323	Earthquake	Normal
323	Overheat	Normal
323	Solar Beam	Normal
323	Earth Power	Normal
324	Overheat	Normal
324	Solar Beam	Normal
324	Earthquake	Normal
325	Psybeam	Normal
325	Shadow Ball	Normal
325	Mirror Coat	Normal
326	Psychic	Normal
326	Shadow Ball	Normal
326	Mirror Coat	Normal
327	Dig	Normal
327	Rock Tomb	Normal
327	Icy Wind	Normal
328	Sand Tomb	Normal
328	Dig	Normal
328	Crunch	Normal
329	Sand Tomb	Normal
329	Bulldoze	Normal
329	Bug Buzz	Normal
330	Earthquake	Normal
330	Dragon Claw	Normal
330	Stone Edge	Normal
331	Grass Knot	Normal
331	Brick Break	Normal
331	Seed Bomb	Normal
331	Payback	Normal
332	Dark Pulse	Normal
332	Dynamic Punch	Normal
332	Grass Knot	Normal
332	Payback	Normal
333	Disarming Voice	Normal
333	Aerial Ace	Normal
333	Ice Beam	Normal
334	Sky Attack	Normal
334	Dazzling Gleam	Normal
334	Dragon Pulse	Normal
335	Close Combat	Normal
335	Night Slash	Normal
335	Dig	Normal
336	Poison Fang	Normal
336	Crunch	Normal
336	Wrap	Normal
337	Psychic	Normal
337	Rock Slide	Normal
337	Moonblast	Normal
338	Psychic	Normal
338	Rock Slide	Normal
338	Solar Beam	Normal
339	Aqua Tail	Normal
339	Ice Beam	Normal
339	Mud Bomb	Normal
340	Water Pulse	Normal
340	Blizzard	Normal
340	Mud Bomb	Normal
341	Vice Grip	Normal
341	Bubble Beam	Normal
341	Aqua Jet	Normal
342	Vice Grip	Normal
342	Bubble Beam	Normal
342	Night Slash	Normal
342	Crabhammer	Normal
343	Gyro Ball	Normal
343	Psybeam	Normal
343	Dig	Normal
344	Gyro Ball	Normal
344	Psychic	Normal
344	Earthquake	Normal
344	Earth Power	Normal
344	Ice Beam	Normal
344	Shadow Ball	Normal
344	Rock Tomb	Normal
345	Grass Knot	Normal
345	Mirror Coat	Normal
345	Ancient Power	Normal
346	Grass Knot	Normal
346	Bulldoze	Normal
346	Stone Edge	Normal
347	Cross Poison	Normal
347	Aqua Jet	Normal
347	Ancient Power	Normal
348	Cross Poison	Normal
348	Water Pulse	Normal
348	Rock Blast	Normal
349	Mirror Coat	Normal
350	Surf	Normal
350	Blizzard	Normal
350	Hyper Beam	Normal
351	Hurricane	Normal
351	Energy Ball	Normal
351	Weather Ball Rock	Normal
351	Weather Ball Normal	Normal
351	Hydro Pump	Rainy
351	Thunder	Rainy
351	Weather Ball Water	Rainy
351	Blizzard	Snowy
351	Ice Beam	Snowy
351	Weather Ball Ice	Snowy
351	Fire Blast	Sunny
351	Solar Beam	Sunny
351	Weather Ball Fire	Sunny
352	Foul Play	Normal
352	Flamethrower	Normal
352	Thunder	Normal
352	Ice Beam	Normal
352	Aerial Ace	Normal
352	Shadow Sneak	Normal
353	Ominous Wind	Normal
353	Night Shade	Normal
353	Shadow Sneak	Normal
354	Shadow Ball	Normal
354	Dazzling Gleam	Normal
354	Thunder	Normal
355	Ominous Wind	Normal
355	Night Shade	Normal
355	Shadow Sneak	Normal
356	Shadow Punch	Normal
356	Ice Punch	Normal
356	Fire Punch	Normal
356	Poltergeist	Normal
357	Stomp	Normal
357	Aerial Ace	Normal
357	Leaf Blade	Normal
358	Energy Ball	Normal
358	Shadow Ball	Normal
358	Psyshock	Normal
359	Dark Pulse	Normal
359	Thunder	Normal
359	Megahorn	Normal
359	Payback	Normal
360	Mirror Coat	Normal
361	Avalanche	Normal
361	Icy Wind	Normal
361	Shadow Ball	Normal
362	Avalanche	Normal
362	Gyro Ball	Normal
362	Shadow Ball	Normal
363	Aurora Beam	Normal
363	Body Slam	Normal
363	Water Pulse	Normal
364	Aurora Beam	Normal
364	Body Slam	Normal
364	Water Pulse	Normal
365	Blizzard	Normal
365	Earthquake	Normal
365	Water Pulse	Normal
366	Body Slam	Normal
366	Ice Beam	Normal
366	Water Pulse	Normal
367	Crunch	Normal
367	Ice Beam	Normal
367	Aqua Tail	Normal
368	Draining Kiss	Normal
368	Psychic	Normal
368	Water Pulse	Normal
369	Ancient Power	Normal
369	Aqua Tail	Normal
369	Hydro Pump	Normal
370	Draining Kiss	Normal
370	Water Pulse	Normal
370	Aqua Jet	Normal
371	Flamethrower	Normal
371	Twister	Normal
371	Crunch	Normal
372	Flamethrower	Normal
372	Dragon Pulse	Normal
372	Twister	Normal
373	Fire Blast	Normal
373	Hydro Pump	Normal
373	Draco Meteor	Normal
374	Struggle	Normal
375	Psychic	Normal
375	Gyro Ball	Normal
375	Psyshock	Normal
376	Psychic	Normal
376	Flash Cannon	Normal
376	Earthquake	Normal
377	Stone Edge	Normal
377	Zap Cannon	Normal
377	Focus Blast	Normal
378	Blizzard	Normal
378	Earthquake	Normal
378	Focus Blast	Normal
379	Flash Cannon	Normal
379	Hyper Beam	Normal
379	Focus Blast	Normal
380	Psychic	Normal
380	Outrage	Normal
380	Thunder	Normal
380	Psychic	S
380	Outrage	S
380	Thunder	S
381	Psychic	Normal
381	Dragon Claw	Normal
381	Solar Beam	Normal
381	Psychic	S
381	Dragon Claw	S
381	Solar Beam	S
382	Hydro Pump	Normal
382	Blizzard	Normal
382	Thunder	Normal
382	Surf	Normal
383	Earthquake	Normal
383	Fire Blast	Normal
383	Solar Beam	Normal
384	Outrage	Normal
384	Aerial Ace	Normal
384	Ancient Power	Normal
385	Dazzling Gleam	Normal
385	Psychic	Normal
385	Doom Desire	Normal
386	Psycho Boost	Attack
386	Zap Cannon	Attack
386	Dark Pulse	Attack
386	Psycho Boost	Defense
386	Thunderbolt	Defense
386	Rock Slide	Defense
386	Psycho Boost	Normal
386	Thunderbolt	Normal
386	Hyper Beam	Normal
386	Psycho Boost	Speed
386	Thunderbolt	Speed
386	Swift	Speed
387	Energy Ball	Normal
387	Seed Bomb	Normal
387	Body Slam	Normal
388	Energy Ball	Normal
388	Solar Beam	Normal
388	Body Slam	Normal
389	Stone Edge	Normal
389	Solar Beam	Normal
389	Earthquake	Normal
389	Sand Tomb	Normal
390	Flame Wheel	Normal
390	Flamethrower	Normal
390	Flame Charge	Normal
391	Flame Wheel	Normal
391	Flamethrower	Normal
391	Low Sweep	Normal
392	Solar Beam	Normal
392	Flamethrower	Normal
392	Close Combat	Normal
393	Bubble Beam	Normal
393	Drill Peck	Normal
393	Icy Wind	Normal
394	Bubble Beam	Normal
394	Hydro Pump	Normal
394	Icy Wind	Normal
395	Hydro Pump	Normal
395	Blizzard	Normal
395	Flash Cannon	Normal
395	Drill Peck	Normal
396	Aerial Ace	Normal
396	Brave Bird	Normal
397	Aerial Ace	Normal
397	Brave Bird	Normal
397	Heat Wave	Normal
398	Brave Bird	Normal
398	Heat Wave	Normal
398	Close Combat	Normal
399	Hyper Fang	Normal
399	Crunch	Normal
399	Grass Knot	Normal
400	Hyper Fang	Normal
400	Hyper Beam	Normal
400	Surf	Normal
401	Struggle	Normal
402	Bug Buzz	Normal
402	X Scissor	Normal
402	Aerial Ace	Normal
403	Discharge	Normal
403	Thunderbolt	Normal
403	Swift	Normal
404	Thunderbolt	Normal
404	Wild Charge	Normal
404	Crunch	Normal
405	Hyper Beam	Normal
405	Wild Charge	Normal
405	Crunch	Normal
406	Energy Ball	Normal
406	Grass Knot	Normal
407	Solar Beam	Normal
407	Sludge Bomb	Normal
407	Dazzling Gleam	Normal
407	Grass Knot	Normal
407	Leaf Storm	Normal
408	Rock Tomb	Normal
408	Ancient Power	Normal
408	Bulldoze	Normal
409	Rock Slide	Normal
409	Outrage	Normal
409	Flamethrower	Normal
410	Rock Tomb	Normal
410	Ancient Power	Normal
410	Heavy Slam	Normal
411	Stone Edge	Normal
411	Flamethrower	Normal
411	Flash Cannon	Normal
412	Struggle	Plant
412	Struggle	Sandy
412	Struggle	Trash
413	Psybeam	Plant
413	Energy Ball	Plant
413	Bug Buzz	Plant
413	Psybeam	Sandy
413	Bulldoze	Sandy
413	Bug Buzz	Sandy
413	Psybeam	Trash
413	Iron Head	Trash
413	Bug Buzz	Trash
414	Psybeam	Normal
414	Aerial Ace	Normal
414	Bug Buzz	Normal
415	Bug Buzz	Normal
416	Bug Buzz	Normal
416	Power Gem	Normal
416	X Scissor	Normal
416	Fell Stinger	Normal
416	Signal Beam	Normal
417	Thunder	Normal
417	Thunderbolt	Normal
417	Thunder Punch	Normal
418	Aqua Jet	Normal
418	Water Pulse	Normal
418	Swift	Normal
419	Aqua Jet	Normal
419	Hydro Pump	Normal
419	Swift	Normal
420	Dazzling Gleam	Normal
420	Petal Blizzard	Normal
420	Seed Bomb	Normal
421	Dazzling Gleam	Overcast
421	Hyper Beam	Overcast
421	Solar Beam	Overcast
421	Dazzling Gleam	Sunny
421	Hyper Beam	Sunny
421	Solar Beam	Sunny
421	Weather Ball Fire	Sunny
422	Water Pulse	East_sea
422	Mud Bomb	East_sea
422	Body Slam	East_sea
422	Water Pulse	West_sea
422	Mud Bomb	West_sea
422	Body Slam	West_sea
423	Water Pulse	East_sea
423	Earth Power	East_sea
423	Body Slam	East_sea
423	Water Pulse	West_sea
423	Earth Power	West_sea
423	Body Slam	West_sea
424	Low Sweep	Normal
424	Hyper Beam	Normal
424	Aerial Ace	Normal
425	Ominous Wind	Normal
425	Icy Wind	Normal
425	Shadow Ball	Normal
426	Ominous Wind	Normal
426	Icy Wind	Normal
426	Shadow Ball	Normal
427	Fire Punch	Normal
427	Swift	Normal
428	Fire Punch	Normal
428	Hyper Beam	Normal
428	Focus Blast	Normal
429	Shadow Ball	Normal
429	Dark Pulse	Normal
429	Dazzling Gleam	Normal
430	Brave Bird	Normal
430	Psychic	Normal
430	Dark Pulse	Normal
430	Sky Attack	Normal
431	Play Rough	Normal
431	Thunderbolt	Normal
431	Aerial Ace	Normal
432	Play Rough	Normal
432	Thunder	Normal
432	Aerial Ace	Normal
433	Wrap	Normal
433	Shadow Ball	Normal
433	Psyshock	Normal
434	Crunch	Normal
434	Flamethrower	Normal
434	Sludge Bomb	Normal
435	Crunch	Normal
435	Flamethrower	Normal
435	Sludge Bomb	Normal
436	Gyro Ball	Normal
436	Psyshock	Normal
436	Heavy Slam	Normal
436	Payback	Normal
437	Flash Cannon	Normal
437	Psychic	Normal
437	Heavy Slam	Normal
437	Bulldoze	Normal
437	Psyshock	Normal
437	Payback	Normal
438	Rock Tomb	Normal
438	Earthquake	Normal
438	Rock Slide	Normal
439	Psybeam	Normal
439	Psychic	Normal
439	Psyshock	Normal
440	Psychic	Normal
441	Night Shade	Normal
441	Sky Attack	Normal
441	Heat Wave	Normal
442	Shadow Sneak	Normal
442	Ominous Wind	Normal
442	Shadow Ball	Normal
443	Dig	Normal
443	Twister	Normal
443	Body Slam	Normal
444	Dig	Normal
444	Twister	Normal
444	Flamethrower	Normal
445	Outrage	Normal
445	Earthquake	Normal
445	Fire Blast	Normal
445	Sand Tomb	Normal
446	Gunk Shot	Normal
446	Body Slam	Normal
446	Bulldoze	Normal
447	Brick Break	Normal
447	Low Sweep	Normal
447	Cross Chop	Normal
448	Flash Cannon	Normal
448	Shadow Ball	Normal
448	Close Combat	Normal
448	Power Up Punch	Normal
448	Aura Sphere	Normal
449	Dig	Normal
449	Rock Tomb	Normal
449	Body Slam	Normal
450	Earthquake	Normal
450	Stone Edge	Normal
450	Body Slam	Normal
450	Earth Power	Normal
450	Weather Ball Rock	Normal
451	Cross Poison	Normal
451	Aqua Tail	Normal
451	Sludge Bomb	Normal
452	Crunch	Normal
452	Aqua Tail	Normal
452	Sludge Bomb	Normal
452	Fell Stinger	Normal
453	Brick Break	Normal
453	Low Sweep	Normal
453	Sludge Bomb	Normal
454	Dynamic Punch	Normal
454	Mud Bomb	Normal
454	Sludge Bomb	Normal
455	Power Whip	Normal
455	Energy Ball	Normal
455	Crunch	Normal
456	Water Pulse	Normal
456	Ice Beam	Normal
456	Silver Wind	Normal
457	Water Pulse	Normal
457	Blizzard	Normal
457	Silver Wind	Normal
458	Water Pulse	Normal
458	Ice Beam	Normal
458	Aerial Ace	Normal
459	Ice Beam	Normal
459	Energy Ball	Normal
459	Stomp	Normal
460	Blizzard	Normal
460	Energy Ball	Normal
460	Outrage	Normal
460	Weather Ball Ice	Normal
461	Avalanche	Normal
461	Focus Blast	Normal
461	Foul Play	Normal
462	Zap Cannon	Normal
462	Wild Charge	Normal
462	Flash Cannon	Normal
462	Mirror Shot	Normal
463	Hyper Beam	Normal
463	Earthquake	Normal
463	Solar Beam	Normal
463	Shadow Ball	Normal
464	Surf	Normal
464	Earthquake	Normal
464	Stone Edge	Normal
464	Skull Bash	Normal
464	Super Power	Normal
465	Ancient Power	Normal
465	Sludge Bomb	Normal
465	Solar Beam	Normal
465	Power Whip	Normal
465	Rock Slide	Normal
466	Thunder Punch	Normal
466	Wild Charge	Normal
466	Thunder	Normal
466	Ice Punch	Normal
467	Brick Break	Normal
467	Fire Punch	Normal
467	Fire Blast	Normal
467	Psychic	Normal
468	Ancient Power	Normal
468	Dazzling Gleam	Normal
468	Aerial Ace	Normal
468	Flamethrower	Normal
469	Ancient Power	Normal
469	Aerial Ace	Normal
469	Bug Buzz	Normal
470	Solar Beam	Normal
470	Leaf Blade	Normal
470	Energy Ball	Normal
471	Avalanche	Normal
471	Icy Wind	Normal
471	Ice Beam	Normal
472	Earthquake	Normal
472	Aerial Ace	Normal
472	Night Slash	Normal
472	Sand Tomb	Normal
473	Avalanche	Normal
473	Bulldoze	Normal
473	Stone Edge	Normal
473	High Horsepower	Normal
474	Solar Beam	Normal
474	Hyper Beam	Normal
474	Zap Cannon	Normal
474	Blizzard	Normal
475	Close Combat	Normal
475	Psychic	Normal
475	Leaf Blade	Normal
476	Magnet Bomb	Normal
476	Rock Slide	Normal
476	Thunderbolt	Normal
477	Ominous Wind	Normal
477	Psychic	Normal
477	Dark Pulse	Normal
477	Poltergeist	Normal
478	Avalanche	Normal
478	Crunch	Normal
478	Shadow Ball	Normal
479	Ominous Wind	Fan
479	Thunderbolt	Fan
479	Thunder	Fan
479	Blizzard	Frost
479	Thunderbolt	Frost
479	Thunder	Frost
479	Overheat	Heat
479	Thunderbolt	Heat
479	Thunder	Heat
479	Ominous Wind	Mow
479	Thunderbolt	Mow
479	Thunder	Mow
479	Ominous Wind	Normal
479	Thunderbolt	Normal
479	Thunder	Normal
479	Hydro Pump	Wash
479	Thunderbolt	Wash
479	Thunder	Wash
480	Futuresight	Normal
480	Swift	Normal
480	Thunder	Normal
481	Futuresight	Normal
481	Swift	Normal
481	Blizzard	Normal
482	Futuresight	Normal
482	Swift	Normal
482	Fire Blast	Normal
483	Draco Meteor	Normal
483	Iron Head	Normal
483	Thunder	Normal
484	Draco Meteor	Normal
484	Fire Blast	Normal
484	Hydro Pump	Normal
484	Aqua Tail	Normal
485	Fire Blast	Normal
485	Iron Head	Normal
485	Stone Edge	Normal
485	Flamethrower	Normal
486	Giga Impact	Normal
486	Focus Blast	Normal
486	Thunder	Normal
487	Dragon Claw	Altered
487	Ancient Power	Altered
487	Shadow Sneak	Altered
487	Dragon Pulse	Origin
487	Ominous Wind	Origin
487	Shadow Ball	Origin
488	Aurora Beam	Normal
488	Moonblast	Normal
488	Futuresight	Normal
489	Bubble Beam	Normal
489	Water Pulse	Normal
489	Surf	Normal
490	Bubble Beam	Normal
490	Psychic	Normal
490	Surf	Normal
491	Focus Blast	Normal
491	Shadow Ball	Normal
491	Dark Pulse	Normal
492	Energy Ball	Land
492	Grass Knot	Land
492	Solar Beam	Land
492	Seed Flare	Land
492	Energy Ball	Sky
492	Grass Knot	Sky
492	Solar Beam	Sky
492	Seed Flare	Sky
493	Futuresight	Bug
493	Hyper Beam	Bug
493	Outrage	Bug
493	Futuresight	Dark
493	Hyper Beam	Dark
493	Outrage	Dark
493	Futuresight	Dragon
493	Hyper Beam	Dragon
493	Outrage	Dragon
493	Futuresight	Electric
493	Hyper Beam	Electric
493	Outrage	Electric
493	Futuresight	Fairy
493	Hyper Beam	Fairy
493	Outrage	Fairy
493	Futuresight	Fighting
493	Hyper Beam	Fighting
493	Outrage	Fighting
493	Futuresight	Fire
493	Hyper Beam	Fire
493	Outrage	Fire
493	Futuresight	Flying
493	Hyper Beam	Flying
493	Outrage	Flying
493	Futuresight	Ghost
493	Hyper Beam	Ghost
493	Outrage	Ghost
493	Futuresight	Grass
493	Hyper Beam	Grass
493	Outrage	Grass
493	Futuresight	Ground
493	Hyper Beam	Ground
493	Outrage	Ground
493	Futuresight	Ice
493	Hyper Beam	Ice
493	Outrage	Ice
493	Futuresight	Normal
493	Hyper Beam	Normal
493	Outrage	Normal
493	Futuresight	Poison
493	Hyper Beam	Poison
493	Outrage	Poison
493	Futuresight	Psychic
493	Hyper Beam	Psychic
493	Outrage	Psychic
493	Futuresight	Rock
493	Hyper Beam	Rock
493	Outrage	Rock
493	Futuresight	Steel
493	Hyper Beam	Steel
493	Outrage	Steel
493	Futuresight	Water
493	Hyper Beam	Water
493	Outrage	Water
494	Overheat	Normal
494	Focus Blast	Normal
494	Psychic	Normal
494	V Create	Normal
495	Energy Ball	Normal
495	Seed Bomb	Normal
495	Wrap	Normal
496	Grass Knot	Normal
496	Leaf Tornado	Normal
496	Wrap	Normal
497	Grass Knot	Normal
497	Leaf Tornado	Normal
497	Aerial Ace	Normal
498	Flame Charge	Normal
498	Flamethrower	Normal
498	Body Slam	Normal
499	Flame Charge	Normal
499	Flamethrower	Normal
499	Rock Tomb	Normal
500	Heat Wave	Normal
500	Rock Slide	Normal
500	Focus Blast	Normal
500	Flame Charge	Normal
501	Aqua Tail	Normal
501	Water Pulse	Normal
501	Night Slash	Normal
502	Aqua Tail	Normal
502	Water Pulse	Normal
502	X Scissor	Normal
503	Hydro Pump	Normal
503	Blizzard	Normal
503	Megahorn	Normal
503	Razor Shell	Normal
504	Dig	Normal
504	Hyper Fang	Normal
504	Grass Knot	Normal
505	Crunch	Normal
505	Hyper Fang	Normal
505	Grass Knot	Normal
506	Thunderbolt	Normal
506	Rock Tomb	Normal
506	Dig	Normal
507	Thunderbolt	Normal
507	Play Rough	Normal
507	Dig	Normal
508	Wild Charge	Normal
508	Play Rough	Normal
508	Crunch	Normal
509	Night Slash	Normal
509	Play Rough	Normal
509	Dark Pulse	Normal
510	Gunk Shot	Normal
510	Play Rough	Normal
510	Dark Pulse	Normal
510	Payback	Normal
511	Energy Ball	Normal
511	Seed Bomb	Normal
511	Crunch	Normal
512	Solar Beam	Normal
512	Grass Knot	Normal
512	Crunch	Normal
513	Flame Burst	Normal
513	Flame Charge	Normal
513	Crunch	Normal
514	Flamethrower	Normal
514	Fire Blast	Normal
514	Crunch	Normal
515	Surf	Normal
515	Water Pulse	Normal
515	Crunch	Normal
516	Surf	Normal
516	Hydro Pump	Normal
516	Crunch	Normal
517	Psybeam	Normal
517	Dazzling Gleam	Normal
517	Psyshock	Normal
518	Futuresight	Normal
518	Dazzling Gleam	Normal
518	Psyshock	Normal
519	Heat Wave	Normal
519	Aerial Ace	Normal
519	Air Cutter	Normal
520	Heat Wave	Normal
520	Aerial Ace	Normal
520	Sky Attack	Normal
521	Heat Wave	Normal
521	Hyper Beam	Normal
521	Sky Attack	Normal
522	Flame Charge	Normal
522	Discharge	Normal
522	Thunderbolt	Normal
523	Flame Charge	Normal
523	Discharge	Normal
523	Wild Charge	Normal
524	Bulldoze	Normal
524	Rock Blast	Normal
524	Stone Edge	Normal
525	Rock Slide	Normal
525	Bulldoze	Normal
525	Stone Edge	Normal
526	Rock Slide	Normal
526	Solar Beam	Normal
526	Super Power	Normal
526	Heavy Slam	Normal
527	Air Cutter	Normal
527	Aerial Ace	Normal
527	Psyshock	Normal
528	Psychic	Normal
528	Aerial Ace	Normal
528	Futuresight	Normal
528	Psychic Fangs	Normal
529	Rock Tomb	Normal
529	Dig	Normal
529	Drill Run	Normal
530	Rock Slide	Normal
530	Earthquake	Normal
530	Drill Run	Normal
530	Iron Head	Normal
531	Disarming Voice	Normal
531	Dazzling Gleam	Normal
531	Hyper Beam	Normal
532	Low Sweep	Normal
532	Brick Break	Normal
532	Rock Tomb	Normal
533	Low Sweep	Normal
533	Brick Break	Normal
533	Stone Edge	Normal
534	Dynamic Punch	Normal
534	Focus Blast	Normal
534	Stone Edge	Normal
535	Water Pulse	Normal
535	Mud Bomb	Normal
535	Sludge Wave	Normal
536	Water Pulse	Normal
536	Earth Power	Normal
536	Sludge Wave	Normal
537	Muddy Water	Normal
537	Earth Power	Normal
537	Sludge Bomb	Normal
538	Focus Blast	Normal
538	Low Sweep	Normal
538	Body Slam	Normal
539	Focus Blast	Normal
539	Low Sweep	Normal
539	Body Slam	Normal
540	Energy Ball	Normal
540	Seed Bomb	Normal
540	Silver Wind	Normal
541	Energy Ball	Normal
541	Bug Buzz	Normal
541	Silver Wind	Normal
542	Leaf Blade	Normal
542	X Scissor	Normal
542	Silver Wind	Normal
542	Leaf Storm	Normal
543	Signal Beam	Normal
543	Sludge Bomb	Normal
543	Gyro Ball	Normal
544	Signal Beam	Normal
544	Sludge Bomb	Normal
544	Gyro Ball	Normal
545	Megahorn	Normal
545	Sludge Bomb	Normal
545	Gyro Ball	Normal
545	X Scissor	Normal
546	Energy Ball	Normal
546	Seed Bomb	Normal
546	Grass Knot	Normal
547	Grass Knot	Normal
547	Hurricane	Normal
547	Moonblast	Normal
548	Energy Ball	Normal
548	Seed Bomb	Normal
549	Petal Blizzard	Normal
549	Hyper Beam	Normal
549	Solar Beam	Normal
550	Aqua Jet	Blue_striped
550	Aqua Tail	Blue_striped
550	Muddy Water	Blue_striped
550	Aqua Jet	Red_striped
550	Aqua Tail	Red_striped
550	Muddy Water	Red_striped
551	Dig	Normal
551	Crunch	Normal
551	Bulldoze	Normal
552	Earthquake	Normal
552	Crunch	Normal
552	Bulldoze	Normal
553	Earthquake	Normal
553	Crunch	Normal
553	Outrage	Normal
554	Ice Punch	Galarian
554	Ice Beam	Galarian
554	Fire Punch	Normal
554	Flame Charge	Normal
555	Overheat	Galarian_standard
555	Avalanche	Galarian_standard
555	Super Power	Galarian_standard
555	Ice Punch	Galarian_standard
555	Overheat	Galarian_zen
555	Avalanche	Galarian_zen
555	Super Power	Galarian_zen
555	Ice Punch	Galarian_zen
555	Overheat	Standard
555	Focus Blast	Standard
555	Psychic	Standard
555	Rock Slide	Standard
555	Overheat	Zen
555	Focus Blast	Zen
555	Psychic	Zen
555	Rock Slide	Zen
556	Aerial Ace	Normal
556	Petal Blizzard	Normal
556	Solar Beam	Normal
557	Rock Blast	Normal
557	X Scissor	Normal
557	Rock Tomb	Normal
558	Rock Blast	Normal
558	X Scissor	Normal
558	Rock Slide	Normal
559	Acid Spray	Normal
559	Brick Break	Normal
559	Foul Play	Normal
560	Acid Spray	Normal
560	Power Up Punch	Normal
560	Foul Play	Normal
561	Air Cutter	Normal
561	Psybeam	Normal
561	Ancient Power	Normal
561	Signal Beam	Normal
562	Night Shade	Galarian
562	Rock Tomb	Galarian
562	Shadow Ball	Normal
562	Dark Pulse	Normal
562	Ominous Wind	Normal
563	Shadow Ball	Normal
563	Dark Pulse	Normal
563	Psychic	Normal
564	Surf	Normal
564	Ancient Power	Normal
564	Body Slam	Normal
565	Surf	Normal
565	Ancient Power	Normal
565	Body Slam	Normal
566	Dragon Claw	Normal
566	Ancient Power	Normal
566	Crunch	Normal
567	Dragon Claw	Normal
567	Ancient Power	Normal
567	Crunch	Normal
568	Gunk Shot	Normal
568	Seed Bomb	Normal
569	Acid Spray	Normal
569	Seed Bomb	Normal
569	Gunk Shot	Normal
569	Body Slam	Normal
570	Foul Play	Normal
570	Aerial Ace	Normal
570	Dark Pulse	Normal
571	Foul Play	Normal
571	Sludge Bomb	Normal
571	Flamethrower	Normal
572	Swift	Normal
572	Thunderbolt	Normal
572	Aqua Tail	Normal
573	Hyper Beam	Normal
573	Thunderbolt	Normal
573	Aqua Tail	Normal
574	Psybeam	Normal
574	Psyshock	Normal
574	Psychic	Normal
575	Psybeam	Normal
575	Futuresight	Normal
575	Psychic	Normal
576	Rock Slide	Normal
576	Futuresight	Normal
576	Psychic	Normal
577	Psyshock	Normal
577	Night Shade	Normal
577	Thunder	Normal
578	Psyshock	Normal
578	Night Shade	Normal
578	Thunder	Normal
579	Futuresight	Normal
579	Shadow Ball	Normal
579	Thunder	Normal
580	Aerial Ace	Normal
580	Bubble Beam	Normal
580	Brave Bird	Normal
581	Ice Beam	Normal
581	Bubble Beam	Normal
581	Hurricane	Normal
582	Icy Wind	Normal
582	Ice Beam	Normal
582	Signal Beam	Normal
583	Icy Wind	Normal
583	Ice Beam	Normal
583	Signal Beam	Normal
584	Blizzard	Normal
584	Flash Cannon	Normal
584	Signal Beam	Normal
585	Energy Ball	Autumn
585	Seed Bomb	Autumn
585	Wild Charge	Autumn
585	Energy Ball	Spring
585	Seed Bomb	Spring
585	Wild Charge	Spring
585	Energy Ball	Summer
585	Seed Bomb	Summer
585	Wild Charge	Summer
585	Energy Ball	Winter
585	Seed Bomb	Winter
585	Wild Charge	Winter
586	Megahorn	Autumn
586	Solar Beam	Autumn
586	Wild Charge	Autumn
586	Hyper Beam	Autumn
586	Megahorn	Spring
586	Solar Beam	Spring
586	Wild Charge	Spring
586	Hyper Beam	Spring
586	Megahorn	Summer
586	Solar Beam	Summer
586	Wild Charge	Summer
586	Hyper Beam	Summer
586	Megahorn	Winter
586	Solar Beam	Winter
586	Wild Charge	Winter
586	Hyper Beam	Winter
587	Discharge	Normal
587	Aerial Ace	Normal
587	Thunderbolt	Normal
588	Signal Beam	Normal
588	X Scissor	Normal
588	Drill Run	Normal
588	Aerial Ace	Normal
589	Megahorn	Normal
589	Acid Spray	Normal
589	Drill Run	Normal
589	Aerial Ace	Normal
590	Energy Ball	Normal
590	Body Slam	Normal
590	Grass Knot	Normal
591	Foul Play	Normal
591	Sludge Bomb	Normal
591	Grass Knot	Normal
592	Night Shade	Female
592	Ice Beam	Female
592	Ominous Wind	Female
592	Night Shade	Normal
592	Ice Beam	Normal
592	Ominous Wind	Normal
593	Shadow Ball	Female
593	Ice Beam	Female
593	Bubble Beam	Female
593	Shadow Ball	Normal
593	Ice Beam	Normal
593	Bubble Beam	Normal
594	Hydro Pump	Normal
594	Blizzard	Normal
594	Psychic	Normal
595	Cross Poison	Normal
595	Bug Buzz	Normal
595	Discharge	Normal
596	Cross Poison	Normal
596	Bug Buzz	Normal
596	Discharge	Normal
596	Energy Ball	Normal
596	Lunge	Normal
597	Gyro Ball	Normal
597	Flash Cannon	Normal
597	Iron Head	Normal
598	Power Whip	Normal
598	Flash Cannon	Normal
598	Acid Spray	Normal
598	Thunder	Normal
598	Mirror Shot	Normal
599	Vice Grip	Normal
599	Discharge	Normal
599	Zap Cannon	Normal
600	Vice Grip	Normal
600	Thunderbolt	Normal
600	Zap Cannon	Normal
601	Hyper Beam	Normal
601	Flash Cannon	Normal
601	Zap Cannon	Normal
601	Mirror Shot	Normal
602	Struggle	Normal
603	Crunch	Normal
603	Thunderbolt	Normal
603	Discharge	Normal
604	Crunch	Normal
604	Thunderbolt	Normal
604	Acid Spray	Normal
604	Dragon Claw	Normal
605	Psybeam	Normal
605	Dark Pulse	Normal
605	Psychic	Normal
606	Rock Slide	Normal
606	Dark Pulse	Normal
606	Psychic	Normal
607	Flame Charge	Normal
607	Flame Burst	Normal
607	Heat Wave	Normal
608	Energy Ball	Normal
608	Flame Burst	Normal
608	Heat Wave	Normal
609	Energy Ball	Normal
609	Shadow Ball	Normal
609	Overheat	Normal
609	Flame Charge	Normal
610	Dragon Claw	Normal
610	Aqua Tail	Normal
610	Dragon Pulse	Normal
611	Dragon Claw	Normal
611	Aqua Tail	Normal
611	Night Slash	Normal
612	Dragon Claw	Normal
612	Surf	Normal
612	Night Slash	Normal
612	Earthquake	Normal
613	Ice Punch	Normal
613	Icy Wind	Normal
613	Play Rough	Normal
613	Ice Punch	Winter_2020
613	Icy Wind	Winter_2020
613	Play Rough	Winter_2020
614	Ice Punch	Normal
614	Surf	Normal
614	Play Rough	Normal
614	Ice Punch	Winter_2020
614	Surf	Winter_2020
614	Play Rough	Winter_2020
615	Aurora Beam	Normal
615	Night Slash	Normal
615	Solar Beam	Normal
615	Water Pulse	Normal
616	Bug Buzz	Normal
616	Body Slam	Normal
616	Signal Beam	Normal
617	Bug Buzz	Normal
617	Acid Spray	Normal
617	Signal Beam	Normal
617	Focus Blast	Normal
618	Earthquake	Galarian
618	Flash Cannon	Galarian
618	Muddy Water	Galarian
618	Rock Slide	Galarian
618	Mud Bomb	Normal
618	Discharge	Normal
618	Muddy Water	Normal
619	Brick Break	Normal
619	Low Sweep	Normal
619	Focus Blast	Normal
620	Brick Break	Normal
620	Grass Knot	Normal
620	Stone Edge	Normal
621	Dragon Claw	Normal
621	Night Slash	Normal
621	Hyper Beam	Normal
622	Shadow Punch	Normal
622	Brick Break	Normal
622	Night Shade	Normal
623	Shadow Punch	Normal
623	Dynamic Punch	Normal
623	Earth Power	Normal
623	Poltergeist	Normal
624	Night Slash	Normal
624	Iron Head	Normal
624	X Scissor	Normal
625	Dark Pulse	Normal
625	Iron Head	Normal
625	X Scissor	Normal
625	Focus Blast	Normal
626	Megahorn	Normal
626	Stomp	Normal
626	Skull Bash	Normal
626	Earthquake	Normal
627	Aerial Ace	Normal
627	Brave Bird	Normal
627	Rock Tomb	Normal
628	Dazzling Gleam	Hisuian
628	Brave Bird	Hisuian
628	Psychic	Hisuian
628	Ominous Wind	Hisuian
628	Heat Wave	Normal
628	Brave Bird	Normal
628	Rock Slide	Normal
628	Close Combat	Normal
629	Dark Pulse	Normal
629	Brave Bird	Normal
629	Foul Play	Normal
630	Dark Pulse	Normal
630	Aerial Ace	Normal
630	Foul Play	Normal
630	Shadow Ball	Normal
631	Flamethrower	Normal
631	Thunder Punch	Normal
631	Power Up Punch	Normal
632	X Scissor	Normal
632	Iron Head	Normal
632	Stone Edge	Normal
633	Dragon Pulse	Normal
633	Crunch	Normal
633	Body Slam	Normal
634	Dragon Pulse	Normal
634	Dark Pulse	Normal
634	Body Slam	Normal
635	Dragon Pulse	Normal
635	Dark Pulse	Normal
635	Flash Cannon	Normal
636	Flame Charge	Normal
636	Bug Buzz	Normal
636	Flame Wheel	Normal
637	Overheat	Normal
637	Bug Buzz	Normal
637	Solar Beam	Normal
637	Hurricane	Normal
638	Close Combat	Normal
638	Iron Head	Normal
638	Stone Edge	Normal
639	Close Combat	Normal
639	Earthquake	Normal
639	Rock Slide	Normal
640	Close Combat	Normal
640	Leaf Blade	Normal
640	Stone Edge	Normal
641	Grass Knot	Incarnate
641	Dark Pulse	Incarnate
641	Hyper Beam	Incarnate
641	Hurricane	Incarnate
641	Heat Wave	Therian
641	Psychic	Therian
641	Focus Blast	Therian
641	Hurricane	Therian
642	Crunch	Incarnate
642	Thunder	Incarnate
642	Brick Break	Incarnate
642	Thunder Punch	Incarnate
642	Sludge Wave	Therian
642	Thunder	Therian
642	Focus Blast	Therian
642	Thunderbolt	Therian
643	Crunch	Normal
643	Overheat	Normal
643	Draco Meteor	Normal
643	Stone Edge	Normal
644	Outrage	Normal
644	Wild Charge	Normal
644	Flash Cannon	Normal
644	Crunch	Normal
645	Earth Power	Incarnate
645	Outrage	Incarnate
645	Rock Slide	Incarnate
645	Focus Blast	Incarnate
645	Earthquake	Therian
645	Bulldoze	Therian
645	Stone Edge	Therian
645	Super Power	Therian
646	Iron Head	Black
646	Blizzard	Black
646	Stone Edge	Black
646	Outrage	Black
646	Dragon Claw	Normal
646	Blizzard	Normal
646	Draco Meteor	Normal
646	Dragon Pulse	White
646	Blizzard	White
646	Ancient Power	White
646	Focus Blast	White
647	Aqua Jet	Ordinary
647	Close Combat	Ordinary
647	Hydro Pump	Ordinary
647	X Scissor	Ordinary
647	Sacred Sword	Ordinary
647	Aqua Jet	Resolute
647	Close Combat	Resolute
647	Hydro Pump	Resolute
647	X Scissor	Resolute
647	Sacred Sword	Resolute
648	Psyshock	Aria
648	Thunderbolt	Aria
648	Dazzling Gleam	Aria
648	Hyper Beam	Aria
648	Close Combat	Pirouette
648	Fire Punch	Pirouette
648	Ice Punch	Pirouette
648	Hyper Beam	Pirouette
649	X Scissor	Burn
649	Magnet Bomb	Burn
649	Flamethrower	Burn
649	X Scissor	Chill
649	Magnet Bomb	Chill
649	Ice Beam	Chill
649	X Scissor	Douse
649	Magnet Bomb	Douse
649	Gunk Shot	Douse
649	X Scissor	Normal
649	Magnet Bomb	Normal
649	Hyper Beam	Normal
649	X Scissor	Shock
649	Magnet Bomb	Shock
649	Zap Cannon	Shock
650	Gyro Ball	Normal
650	Seed Bomb	Normal
650	Body Slam	Normal
651	Gyro Ball	Normal
651	Energy Ball	Normal
651	Body Slam	Normal
652	Gyro Ball	Normal
652	Energy Ball	Normal
652	Super Power	Normal
652	Solar Beam	Normal
653	Psyshock	Normal
653	Flamethrower	Normal
653	Flame Charge	Normal
654	Psyshock	Normal
654	Flamethrower	Normal
654	Flame Charge	Normal
655	Psychic	Normal
655	Flamethrower	Normal
655	Flame Charge	Normal
655	Fire Blast	Normal
656	Water Pulse	Normal
656	Aerial Ace	Normal
656	Surf	Normal
657	Water Pulse	Normal
657	Aerial Ace	Normal
657	Surf	Normal
658	Night Slash	Normal
658	Aerial Ace	Normal
658	Surf	Normal
658	Hydro Pump	Normal
659	Dig	Normal
659	Bulldoze	Normal
659	Earthquake	Normal
660	Dig	Normal
660	Hyper Beam	Normal
660	Earthquake	Normal
660	Fire Punch	Normal
661	Aerial Ace	Normal
661	Heat Wave	Normal
661	Swift	Normal
662	Aerial Ace	Normal
662	Heat Wave	Normal
662	Flame Charge	Normal
663	Brave Bird	Normal
663	Fire Blast	Normal
663	Flame Charge	Normal
663	Hurricane	Normal
664	Struggle	Archipelago
664	Struggle	Continental
664	Struggle	Elegant
664	Struggle	Fancy
664	Struggle	Garden
664	Struggle	High_plains
664	Struggle	Icy_snow
664	Struggle	Jungle
664	Struggle	Marine
664	Struggle	Meadow
664	Struggle	Modern
664	Struggle	Monsoon
664	Struggle	Ocean
664	Struggle	Pokeball
664	Struggle	Polar
664	Struggle	River
664	Struggle	Sandstorm
664	Struggle	Savanna
664	Struggle	Sun
664	Struggle	Tundra
665	Struggle	Archipelago
665	Struggle	Continental
665	Struggle	Elegant
665	Struggle	Fancy
665	Struggle	Garden
665	Struggle	High_plains
665	Struggle	Icy_snow
665	Struggle	Jungle
665	Struggle	Marine
665	Struggle	Meadow
665	Struggle	Modern
665	Struggle	Monsoon
665	Struggle	Ocean
665	Struggle	Pokeball
665	Struggle	Polar
665	Struggle	River
665	Struggle	Sandstorm
665	Struggle	Savanna
665	Struggle	Sun
665	Struggle	Tundra
666	Bug Buzz	Archipelago
666	Aerial Ace	Archipelago
666	Energy Ball	Archipelago
666	Hurricane	Archipelago
666	Bug Buzz	Continental
666	Aerial Ace	Continental
666	Energy Ball	Continental
666	Hurricane	Continental
666	Bug Buzz	Elegant
666	Aerial Ace	Elegant
666	Energy Ball	Elegant
666	Hurricane	Elegant
666	Bug Buzz	Fancy
666	Aerial Ace	Fancy
666	Energy Ball	Fancy
666	Hurricane	Fancy
666	Bug Buzz	Garden
666	Aerial Ace	Garden
666	Energy Ball	Garden
666	Hurricane	Garden
666	Bug Buzz	High_plains
666	Aerial Ace	High_plains
666	Energy Ball	High_plains
666	Hurricane	High_plains
666	Bug Buzz	Icy_snow
666	Aerial Ace	Icy_snow
666	Energy Ball	Icy_snow
666	Hurricane	Icy_snow
666	Bug Buzz	Jungle
666	Aerial Ace	Jungle
666	Energy Ball	Jungle
666	Hurricane	Jungle
666	Bug Buzz	Marine
666	Aerial Ace	Marine
666	Energy Ball	Marine
666	Hurricane	Marine
666	Bug Buzz	Meadow
666	Aerial Ace	Meadow
666	Energy Ball	Meadow
666	Hurricane	Meadow
666	Bug Buzz	Modern
666	Aerial Ace	Modern
666	Energy Ball	Modern
666	Hurricane	Modern
666	Bug Buzz	Monsoon
666	Aerial Ace	Monsoon
666	Energy Ball	Monsoon
666	Hurricane	Monsoon
666	Bug Buzz	Ocean
666	Aerial Ace	Ocean
666	Energy Ball	Ocean
666	Hurricane	Ocean
666	Bug Buzz	Pokeball
666	Aerial Ace	Pokeball
666	Energy Ball	Pokeball
666	Hurricane	Pokeball
666	Bug Buzz	Polar
666	Aerial Ace	Polar
666	Energy Ball	Polar
666	Hurricane	Polar
666	Bug Buzz	River
666	Aerial Ace	River
666	Energy Ball	River
666	Hurricane	River
666	Bug Buzz	Sandstorm
666	Aerial Ace	Sandstorm
666	Energy Ball	Sandstorm
666	Hurricane	Sandstorm
666	Bug Buzz	Savanna
666	Aerial Ace	Savanna
666	Energy Ball	Savanna
666	Hurricane	Savanna
666	Bug Buzz	Sun
666	Aerial Ace	Sun
666	Energy Ball	Sun
666	Hurricane	Sun
666	Bug Buzz	Tundra
666	Aerial Ace	Tundra
666	Energy Ball	Tundra
666	Hurricane	Tundra
667	Flame Charge	Normal
667	Flamethrower	Normal
667	Crunch	Normal
668	Flame Charge	Female
668	Solar Beam	Female
668	Dark Pulse	Female
668	Overheat	Female
668	Flame Charge	Normal
668	Solar Beam	Normal
668	Dark Pulse	Normal
668	Overheat	Normal
669	Dazzling Gleam	Blue
669	Petal Blizzard	Blue
669	Psychic	Blue
669	Dazzling Gleam	Orange
669	Petal Blizzard	Orange
669	Psychic	Orange
669	Dazzling Gleam	Red
669	Petal Blizzard	Red
669	Psychic	Red
669	Dazzling Gleam	White
669	Petal Blizzard	White
669	Psychic	White
669	Dazzling Gleam	Yellow
669	Petal Blizzard	Yellow
669	Psychic	Yellow
670	Dazzling Gleam	Blue
670	Petal Blizzard	Blue
670	Psychic	Blue
670	Dazzling Gleam	Orange
670	Petal Blizzard	Orange
670	Psychic	Orange
670	Dazzling Gleam	Red
670	Petal Blizzard	Red
670	Psychic	Red
670	Dazzling Gleam	White
670	Petal Blizzard	White
670	Psychic	White
670	Dazzling Gleam	Yellow
670	Petal Blizzard	Yellow
670	Psychic	Yellow
671	Moonblast	Blue
671	Petal Blizzard	Blue
671	Psychic	Blue
671	Disarming Voice	Blue
671	Moonblast	Orange
671	Petal Blizzard	Orange
671	Psychic	Orange
671	Disarming Voice	Orange
671	Moonblast	Red
671	Petal Blizzard	Red
671	Psychic	Red
671	Disarming Voice	Red
671	Moonblast	White
671	Petal Blizzard	White
671	Psychic	White
671	Disarming Voice	White
671	Moonblast	Yellow
671	Petal Blizzard	Yellow
671	Psychic	Yellow
671	Disarming Voice	Yellow
672	Brick Break	Normal
672	Rock Slide	Normal
672	Seed Bomb	Normal
673	Brick Break	Normal
673	Rock Slide	Normal
673	Leaf Blade	Normal
673	Seed Bomb	Normal
674	Low Sweep	Normal
674	Crunch	Normal
674	Body Slam	Normal
675	Close Combat	Normal
675	Night Slash	Normal
675	Iron Head	Normal
675	Rock Slide	Normal
676	Surf	Dandy
676	Dark Pulse	Dandy
676	Grass Knot	Dandy
676	Surf	Debutante
676	Dark Pulse	Debutante
676	Grass Knot	Debutante
676	Surf	Diamond
676	Dark Pulse	Diamond
676	Grass Knot	Diamond
676	Surf	Heart
676	Dark Pulse	Heart
676	Grass Knot	Heart
676	Surf	Kabuki
676	Dark Pulse	Kabuki
676	Grass Knot	Kabuki
676	Surf	La_reine
676	Dark Pulse	La_reine
676	Grass Knot	La_reine
676	Surf	Matron
676	Dark Pulse	Matron
676	Grass Knot	Matron
676	Surf	Natural
676	Dark Pulse	Natural
676	Grass Knot	Natural
676	Surf	Pharaoh
676	Dark Pulse	Pharaoh
676	Grass Knot	Pharaoh
676	Surf	Star
676	Dark Pulse	Star
676	Grass Knot	Star
677	Psyshock	Normal
677	Energy Ball	Normal
677	Psychic	Normal
678	Psychic	Female
678	Energy Ball	Female
678	Shadow Ball	Female
678	Psychic	Normal
678	Energy Ball	Normal
678	Thunderbolt	Normal
679	Iron Head	Normal
679	Gyro Ball	Normal
680	Iron Head	Normal
680	Gyro Ball	Normal
681	Flash Cannon	Normal
681	Gyro Ball	Normal
681	Shadow Ball	Normal
682	Draining Kiss	Normal
682	Thunderbolt	Normal
683	Moonblast	Normal
683	Thunderbolt	Normal
683	Psychic	Normal
683	Draining Kiss	Normal
684	Draining Kiss	Normal
684	Energy Ball	Normal
685	Play Rough	Normal
685	Energy Ball	Normal
685	Flamethrower	Normal
685	Draining Kiss	Normal
686	Psybeam	Normal
686	Night Slash	Normal
687	Psybeam	Normal
687	Foul Play	Normal
687	Super Power	Normal
687	Hyper Beam	Normal
688	Ancient Power	Normal
688	Cross Chop	Normal
688	Dig	Normal
689	Skull Bash	Normal
689	Cross Chop	Normal
689	Stone Edge	Normal
689	Grass Knot	Normal
690	Aqua Tail	Normal
690	Water Pulse	Normal
690	Twister	Normal
690	Sludge Bomb	Normal
691	Hydro Pump	Normal
691	Aqua Tail	Normal
691	Outrage	Normal
691	Gunk Shot	Normal
692	Water Pulse	Normal
692	Crabhammer	Normal
692	Aqua Jet	Normal
693	Water Pulse	Normal
693	Dark Pulse	Normal
693	Ice Beam	Normal
693	Crabhammer	Normal
694	Parabolic Charge	Normal
694	Bulldoze	Normal
694	Thunderbolt	Normal
695	Parabolic Charge	Normal
695	Bulldoze	Normal
695	Thunderbolt	Normal
695	Grass Knot	Normal
696	Stomp	Normal
696	Ancient Power	Normal
696	Dragon Claw	Normal
697	Crunch	Normal
697	Stone Edge	Normal
697	Outrage	Normal
697	Earthquake	Normal
697	Meteor Beam	Normal
698	Weather Ball Ice	Normal
698	Ancient Power	Normal
698	Aurora Beam	Normal
698	Thunderbolt	Normal
699	Weather Ball Ice	Normal
699	Ancient Power	Normal
699	Blizzard	Normal
699	Thunderbolt	Normal
699	Hyper Beam	Normal
699	Meteor Beam	Normal
700	Moonblast	Normal
700	Dazzling Gleam	Normal
700	Draining Kiss	Normal
701	Flying Press	Normal
701	Sky Attack	Normal
701	X Scissor	Normal
701	Power Up Punch	Normal
702	Discharge	Normal
702	Play Rough	Normal
703	Rock Slide	Normal
703	Moonblast	Normal
703	Power Gem	Normal
704	Dragon Pulse	Normal
704	Sludge Wave	Normal
704	Muddy Water	Normal
705	Dragon Pulse	Normal
705	Sludge Wave	Normal
705	Muddy Water	Normal
705	Water Pulse	Normal
706	Draco Meteor	Normal
706	Sludge Wave	Normal
706	Muddy Water	Normal
706	Power Whip	Normal
707	Flash Cannon	Normal
707	Play Rough	Normal
707	Draining Kiss	Normal
707	Foul Play	Normal
708	Seed Bomb	Normal
708	Shadow Ball	Normal
708	Foul Play	Normal
709	Seed Bomb	Normal
709	Shadow Ball	Normal
709	Foul Play	Normal
710	Grass Knot	Average
710	Shadow Sneak	Average
710	Foul Play	Average
710	Grass Knot	Large
710	Shadow Sneak	Large
710	Foul Play	Large
710	Grass Knot	Small
710	Shadow Sneak	Small
710	Foul Play	Small
710	Grass Knot	Super
710	Shadow Sneak	Super
710	Foul Play	Super
711	Seed Bomb	Average
711	Shadow Ball	Average
711	Foul Play	Average
711	Fire Blast	Average
711	Poltergeist	Average
711	Seed Bomb	Large
711	Shadow Ball	Large
711	Foul Play	Large
711	Fire Blast	Large
711	Poltergeist	Large
711	Seed Bomb	Small
711	Shadow Ball	Small
711	Foul Play	Small
711	Fire Blast	Small
711	Poltergeist	Small
711	Seed Bomb	Super
711	Shadow Ball	Super
711	Foul Play	Super
711	Fire Blast	Super
711	Poltergeist	Super
712	Crunch	Normal
712	Icy Wind	Normal
712	Mirror Coat	Normal
713	Crunch	Hisuian
713	Rock Slide	Hisuian
713	Blizzard	Hisuian
713	Crunch	Normal
713	Avalanche	Normal
713	Earthquake	Normal
713	Body Slam	Normal
713	Mirror Coat	Normal
714	Dragon Pulse	Normal
714	Air Cutter	Normal
714	Heat Wave	Normal
715	Draco Meteor	Normal
715	Hurricane	Normal
715	Heat Wave	Normal
715	Psychic	Normal
716	Moonblast	Normal
716	Megahorn	Normal
716	Close Combat	Normal
716	Giga Impact	Normal
716	Thunder	Normal
717	Dark Pulse	Normal
717	Hurricane	Normal
717	Focus Blast	Normal
717	Hyper Beam	Normal
717	Psychic	Normal
718	Outrage	Normal
718	Earthquake	Normal
718	Crunch	Normal
718	Hyper Beam	Normal
718	Bulldoze	Normal
719	Rock Slide	Normal
719	Moonblast	Normal
719	Power Gem	Normal
720	Shadow Ball	Confined
720	Psybeam	Confined
720	Psychic	Confined
720	Shadow Ball	Unbound
720	Dark Pulse	Unbound
720	Psychic	Unbound
721	Hydro Pump	Normal
721	Overheat	Normal
721	Earth Power	Normal
721	Sludge Bomb	Normal
722	Seed Bomb	Normal
722	Energy Ball	Normal
723	Seed Bomb	Normal
723	Energy Ball	Normal
723	Brave Bird	Normal
724	Shadow Sneak	Normal
724	Energy Ball	Normal
724	Brave Bird	Normal
725	Flamethrower	Normal
725	Flame Charge	Normal
725	Crunch	Normal
726	Flamethrower	Normal
726	Flame Charge	Normal
726	Crunch	Normal
727	Fire Blast	Normal
727	Flame Charge	Normal
727	Dark Pulse	Normal
728	Aqua Jet	Normal
728	Water Pulse	Normal
728	Aqua Tail	Normal
729	Aqua Jet	Normal
729	Water Pulse	Normal
729	Disarming Voice	Normal
730	Psychic	Normal
730	Hydro Pump	Normal
730	Moonblast	Normal
731	Drill Peck	Normal
731	Aerial Ace	Normal
731	Sky Attack	Normal
732	Drill Peck	Normal
732	Rock Blast	Normal
732	Sky Attack	Normal
733	Drill Peck	Normal
733	Rock Blast	Normal
733	Flash Cannon	Normal
734	Hyper Fang	Normal
734	Crunch	Normal
734	Rock Tomb	Normal
735	Hyper Fang	Normal
735	Crunch	Normal
735	Rock Tomb	Normal
736	X Scissor	Normal
736	Vice Grip	Normal
736	Crunch	Normal
737	X Scissor	Normal
737	Discharge	Normal
737	Crunch	Normal
738	X Scissor	Normal
738	Discharge	Normal
738	Crunch	Normal
739	Power Up Punch	Normal
739	Crabhammer	Normal
739	Payback	Normal
740	Power Up Punch	Normal
740	Crabhammer	Normal
740	Payback	Normal
740	Ice Punch	Normal
741	Aerial Ace	Baile
741	Air Cutter	Baile
741	Hurricane	Baile
741	Aerial Ace	Pau
741	Air Cutter	Pau
741	Hurricane	Pau
741	Aerial Ace	Pompom
741	Air Cutter	Pompom
741	Hurricane	Pompom
741	Aerial Ace	Sensu
741	Air Cutter	Sensu
741	Hurricane	Sensu
742	Dazzling Gleam	Normal
742	Bug Buzz	Normal
743	Dazzling Gleam	Normal
743	Bug Buzz	Normal
744	Stone Edge	Normal
744	Rock Tomb	Normal
744	Crunch	Normal
745	Stone Edge	Dusk
745	Iron Head	Dusk
745	Crunch	Dusk
745	Stone Edge	Midday
745	Drill Run	Midday
745	Crunch	Midday
745	Stone Edge	Midnight
745	Psychic Fangs	Midnight
745	Crunch	Midnight
746	Brine	School
746	Surf	School
746	Aqua Tail	School
746	Brine	Solo
746	Surf	Solo
746	Aqua Tail	Solo
747	Brine	Normal
747	Gunk Shot	Normal
747	Sludge Wave	Normal
748	Brine	Normal
748	Gunk Shot	Normal
748	Sludge Wave	Normal
749	Bulldoze	Normal
749	Body Slam	Normal
749	Earthquake	Normal
750	Bulldoze	Normal
750	Body Slam	Normal
750	Earthquake	Normal
750	Heavy Slam	Normal
751	Water Pulse	Normal
751	Bubble Beam	Normal
751	Mirror Coat	Normal
752	Bug Buzz	Normal
752	Bubble Beam	Normal
752	Mirror Coat	Normal
753	Leaf Blade	Normal
753	Energy Ball	Normal
753	Grass Knot	Normal
754	Leaf Blade	Normal
754	Leaf Storm	Normal
754	Super Power	Normal
754	X Scissor	Normal
755	Dazzling Gleam	Normal
755	Seed Bomb	Normal
756	Moonblast	Normal
756	Seed Bomb	Normal
756	Sludge Bomb	Normal
757	Poison Fang	Normal
757	Flamethrower	Normal
757	Dragon Pulse	Normal
758	Poison Fang	Normal
758	Fire Blast	Normal
758	Dragon Pulse	Normal
758	Sludge Wave	Normal
759	Super Power	Normal
759	Brick Break	Normal
759	Stomp	Normal
760	Super Power	Normal
760	Payback	Normal
760	Stomp	Normal
761	Energy Ball	Normal
761	Draining Kiss	Normal
762	Energy Ball	Normal
762	Draining Kiss	Normal
762	Grass Knot	Normal
763	Energy Ball	Normal
763	Draining Kiss	Normal
763	Grass Knot	Normal
763	Stomp	Normal
764	Petal Blizzard	Normal
764	Grass Knot	Normal
764	Draining Kiss	Normal
765	Psychic	Normal
765	Foul Play	Normal
765	Futuresight	Normal
766	Brick Break	Normal
766	Close Combat	Normal
766	Super Power	Normal
767	Bug Buzz	Normal
768	X Scissor	Normal
768	Aqua Jet	Normal
768	Aerial Ace	Normal
769	Sand Tomb	Normal
769	Shadow Ball	Normal
769	Earth Power	Normal
770	Sand Tomb	Normal
770	Shadow Ball	Normal
770	Earth Power	Normal
771	Mirror Coat	Normal
772	Tri Attack	Normal
772	Iron Head	Normal
772	Aerial Ace	Normal
773	Tri Attack	Bug
773	Iron Head	Bug
773	Aerial Ace	Bug
773	X Scissor	Bug
773	Tri Attack	Dark
773	Iron Head	Dark
773	Aerial Ace	Dark
773	X Scissor	Dark
773	Tri Attack	Dragon
773	Iron Head	Dragon
773	Aerial Ace	Dragon
773	X Scissor	Dragon
773	Tri Attack	Electric
773	Iron Head	Electric
773	Aerial Ace	Electric
773	X Scissor	Electric
773	Tri Attack	Fairy
773	Iron Head	Fairy
773	Aerial Ace	Fairy
773	X Scissor	Fairy
773	Tri Attack	Fighting
773	Iron Head	Fighting
773	Aerial Ace	Fighting
773	X Scissor	Fighting
773	Tri Attack	Fire
773	Iron Head	Fire
773	Aerial Ace	Fire
773	X Scissor	Fire
773	Tri Attack	Flying
773	Iron Head	Flying
773	Aerial Ace	Flying
773	X Scissor	Flying
773	Tri Attack	Ghost
773	Iron Head	Ghost
773	Aerial Ace	Ghost
773	X Scissor	Ghost
773	Tri Attack	Grass
773	Iron Head	Grass
773	Aerial Ace	Grass
773	X Scissor	Grass
773	Tri Attack	Ground
773	Iron Head	Ground
773	Aerial Ace	Ground
773	X Scissor	Ground
773	Tri Attack	Ice
773	Iron Head	Ice
773	Aerial Ace	Ice
773	X Scissor	Ice
773	Tri Attack	Normal
773	Iron Head	Normal
773	Aerial Ace	Normal
773	X Scissor	Normal
773	Tri Attack	Poison
773	Iron Head	Poison
773	Aerial Ace	Poison
773	X Scissor	Poison
773	Tri Attack	Psychic
773	Iron Head	Psychic
773	Aerial Ace	Psychic
773	X Scissor	Psychic
773	Tri Attack	Rock
773	Iron Head	Rock
773	Aerial Ace	Rock
773	X Scissor	Rock
773	Tri Attack	Steel
773	Iron Head	Steel
773	Aerial Ace	Steel
773	X Scissor	Steel
773	Tri Attack	Water
773	Iron Head	Water
773	Aerial Ace	Water
773	X Scissor	Water
774	Power Gem	Blue
774	Ancient Power	Blue
774	Acrobatics	Blue
774	Power Gem	Green
774	Ancient Power	Green
774	Acrobatics	Green
774	Power Gem	Indigo
774	Ancient Power	Indigo
774	Acrobatics	Indigo
774	Power Gem	Orange
774	Ancient Power	Orange
774	Acrobatics	Orange
774	Power Gem	Red
774	Ancient Power	Red
774	Acrobatics	Red
774	Power Gem	Violet
774	Ancient Power	Violet
774	Acrobatics	Violet
774	Power Gem	Yellow
774	Ancient Power	Yellow
774	Acrobatics	Yellow
775	Play Rough	Normal
775	Bulldoze	Normal
775	Payback	Normal
776	Overheat	Normal
776	Flamethrower	Normal
776	Dragon Pulse	Normal
777	Fell Stinger	Normal
777	Wild Charge	Normal
777	Gyro Ball	Normal
778	Shadow Sneak	Busted
778	Play Rough	Busted
778	Shadow Ball	Busted
778	Shadow Sneak	Disguised
778	Play Rough	Disguised
778	Shadow Ball	Disguised
779	Psychic Fangs	Normal
779	Aqua Tail	Normal
779	Crunch	Normal
780	Outrage	Normal
780	Dragon Pulse	Normal
780	Fly	Normal
781	Power Whip	Normal
781	Shadow Ball	Normal
781	Heavy Slam	Normal
782	Dragon Claw	Normal
782	Brick Break	Normal
782	Dragon Pulse	Normal
783	Dragon Claw	Normal
783	Brick Break	Normal
783	Dragon Pulse	Normal
784	Dragon Claw	Normal
784	Close Combat	Normal
784	Flamethrower	Normal
785	Thunderbolt	Normal
785	Dazzling Gleam	Normal
785	Brave Bird	Normal
785	Thunder	Normal
786	Psyshock	Normal
786	Moonblast	Normal
786	Focus Blast	Normal
786	Futuresight	Normal
787	Grass Knot	Normal
787	Dazzling Gleam	Normal
787	Megahorn	Normal
787	Solar Beam	Normal
788	Surf	Normal
788	Moonblast	Normal
788	Ice Beam	Normal
788	Hydro Pump	Normal
789	Struggle	Normal
790	Struggle	Normal
791	Iron Head	Normal
791	Psychic Fangs	Normal
791	Solar Beam	Normal
791	Flamethrower	Normal
792	Shadow Ball	Normal
792	Psychic	Normal
792	Moonblast	Normal
792	Futuresight	Normal
793	Power Gem	Normal
793	Gunk Shot	Normal
793	Sludge Bomb	Normal
793	Rock Slide	Normal
794	Power Up Punch	Normal
794	Fell Stinger	Normal
794	Lunge	Normal
794	Super Power	Normal
795	Focus Blast	Normal
795	Bug Buzz	Normal
795	Lunge	Normal
795	Close Combat	Normal
796	Discharge	Normal
796	Thunder	Normal
796	Power Whip	Normal
796	Dazzling Gleam	Normal
797	Iron Head	Normal
797	Body Slam	Normal
797	Heavy Slam	Normal
797	Bulldoze	Normal
798	Leaf Blade	Normal
798	X Scissor	Normal
798	Night Slash	Normal
798	Aerial Ace	Normal
799	Brutal Swing	Normal
799	Dragon Claw	Normal
799	Crunch	Normal
799	Sludge Bomb	Normal
800	Struggle	Dawn_wings
800	Struggle	Dusk_mane
800	Struggle	Normal
800	Struggle	Ultra
801	Struggle	Normal
801	Struggle	Original_color
802	Struggle	Normal
803	Struggle	Normal
804	Struggle	Normal
805	Struggle	Normal
806	Struggle	Normal
807	Struggle	Normal
808	Flash Cannon	Normal
808	Thunderbolt	Normal
809	Flash Cannon	Normal
809	Thunderbolt	Normal
809	Hyper Beam	Normal
809	Rock Slide	Normal
809	Super Power	Normal
810	Energy Ball	Normal
810	Grass Knot	Normal
811	Energy Ball	Normal
811	Grass Knot	Normal
812	Energy Ball	Normal
812	Grass Knot	Normal
812	Earth Power	Normal
813	Flame Charge	Normal
813	Flamethrower	Normal
814	Flame Charge	Normal
814	Flamethrower	Normal
815	Flame Charge	Normal
815	Flamethrower	Normal
815	Focus Blast	Normal
816	Water Pulse	Normal
816	Surf	Normal
817	Water Pulse	Normal
817	Surf	Normal
818	Water Pulse	Normal
818	Surf	Normal
818	Shadow Ball	Normal
819	Body Slam	Normal
819	Crunch	Normal
820	Body Slam	Normal
820	Crunch	Normal
821	Drill Peck	Normal
821	Brave Bird	Normal
822	Drill Peck	Normal
822	Brave Bird	Normal
823	Drill Peck	Normal
823	Brave Bird	Normal
823	Iron Head	Normal
824	Struggle	Normal
825	Bug Buzz	Normal
825	Psychic	Normal
826	Bug Buzz	Normal
826	Psychic	Normal
827	Night Slash	Normal
827	Play Rough	Normal
828	Night Slash	Normal
828	Play Rough	Normal
829	Energy Ball	Normal
829	Grass Knot	Normal
830	Energy Ball	Normal
830	Grass Knot	Normal
831	Wild Charge	Normal
831	Payback	Normal
831	Stomp	Normal
832	Wild Charge	Normal
832	Payback	Normal
832	Body Slam	Normal
833	Body Slam	Normal
833	Surf	Normal
834	Body Slam	Normal
834	Surf	Normal
834	Rock Blast	Normal
835	Crunch	Normal
835	Thunder	Normal
836	Crunch	Normal
836	Thunder	Normal
837	Rock Blast	Normal
837	Rock Slide	Normal
838	Rock Blast	Normal
838	Rock Slide	Normal
838	Flame Charge	Normal
839	Rock Blast	Normal
839	Rock Slide	Normal
839	Flame Charge	Normal
840	Struggle	Normal
841	Dragon Pulse	Normal
841	Fly	Normal
841	Outrage	Normal
841	Seed Bomb	Normal
842	Dragon Pulse	Normal
842	Energy Ball	Normal
842	Outrage	Normal
842	Seed Bomb	Normal
843	Dig	Normal
843	Bulldoze	Normal
843	Earth Power	Normal
844	Dig	Normal
844	Bulldoze	Normal
844	Earth Power	Normal
845	Drill Peck	Normal
845	Fly	Normal
845	Hydro Pump	Normal
846	Crunch	Normal
846	Aqua Jet	Normal
846	Close Combat	Normal
847	Crunch	Normal
847	Aqua Jet	Normal
847	Close Combat	Normal
848	Power Up Punch	Normal
849	Acid Spray	Amped
849	Discharge	Amped
849	Wild Charge	Amped
849	Power Up Punch	Amped
849	Acid Spray	Low_key
849	Discharge	Low_key
849	Wild Charge	Low_key
849	Power Up Punch	Low_key
850	Heat Wave	Normal
850	Bug Buzz	Normal
850	Crunch	Normal
851	Heat Wave	Normal
851	Bug Buzz	Normal
851	Crunch	Normal
851	Lunge	Normal
852	Brick Break	Normal
852	Super Power	Normal
852	Ice Punch	Normal
853	Brick Break	Normal
853	Super Power	Normal
853	Ice Punch	Normal
853	Surf	Normal
854	Shadow Ball	Antique
854	Dark Pulse	Antique
854	Psychic	Antique
854	Shadow Ball	Phony
854	Dark Pulse	Phony
854	Psychic	Phony
855	Shadow Ball	Antique
855	Dark Pulse	Antique
855	Psychic	Antique
855	Shadow Ball	Phony
855	Dark Pulse	Phony
855	Psychic	Phony
856	Psybeam	Normal
856	Psychic	Normal
856	Dazzling Gleam	Normal
857	Psybeam	Normal
857	Psychic	Normal
857	Dazzling Gleam	Normal
858	Psybeam	Normal
858	Psychic	Normal
858	Dazzling Gleam	Normal
858	Power Whip	Normal
859	Foul Play	Normal
859	Dark Pulse	Normal
859	Play Rough	Normal
860	Foul Play	Normal
860	Dark Pulse	Normal
860	Play Rough	Normal
861	Foul Play	Normal
861	Dark Pulse	Normal
861	Play Rough	Normal
861	Power Up Punch	Normal
862	Cross Chop	Galarian
862	Night Slash	Galarian
862	Hyper Beam	Galarian
862	Gunk Shot	Galarian
863	Iron Head	Galarian
863	Close Combat	Galarian
863	Play Rough	Galarian
863	Foul Play	Galarian
864	Rock Blast	Normal
864	Brine	Normal
864	Night Shade	Normal
864	Shadow Ball	Normal
865	Close Combat	Galarian
865	Brave Bird	Galarian
865	Leaf Blade	Galarian
865	Night Slash	Galarian
866	Psybeam	Galarian
866	Psychic	Galarian
866	Ice Punch	Galarian
866	Icy Wind	Galarian
867	Shadow Ball	Galarian
867	Sand Tomb	Galarian
867	Rock Tomb	Galarian
868	Dazzling Gleam	Normal
869	Dazzling Gleam	Normal
869	Psyshock	Normal
869	Energy Ball	Normal
870	Super Power	Normal
870	Brick Break	Normal
870	Megahorn	Normal
871	Discharge	Normal
871	Thunderbolt	Normal
871	Bubble Beam	Normal
872	Icy Wind	Normal
872	Bug Buzz	Normal
873	Icy Wind	Normal
873	Bug Buzz	Normal
873	Ice Beam	Normal
873	Hurricane	Normal
874	Stone Edge	Normal
874	Rock Slide	Normal
874	Stomp	Normal
875	Icy Wind	Ice
875	Weather Ball Ice	Ice
875	Surf	Ice
875	Icy Wind	Noice
875	Weather Ball Ice	Noice
875	Surf	Noice
876	Psybeam	Female
876	Psychic	Female
876	Energy Ball	Female
876	Psybeam	Male
876	Psychic	Male
876	Shadow Ball	Male
877	Crunch	Full_belly
877	Payback	Full_belly
877	Thunderbolt	Full_belly
877	Wild Charge	Full_belly
877	Crunch	Hangry
877	Payback	Hangry
877	Thunderbolt	Hangry
877	Wild Charge	Hangry
878	Iron Head	Normal
878	Dig	Normal
878	Play Rough	Normal
879	Iron Head	Normal
879	Dig	Normal
879	Play Rough	Normal
879	Heavy Slam	Normal
880	Discharge	Normal
880	Dragon Pulse	Normal
880	Ancient Power	Normal
881	Discharge	Normal
881	Avalanche	Normal
881	Ancient Power	Normal
882	Brine	Normal
882	Dragon Pulse	Normal
882	Ancient Power	Normal
883	Brine	Normal
883	Avalanche	Normal
883	Ancient Power	Normal
884	Flash Cannon	Normal
884	Dragon Claw	Normal
884	Hyper Beam	Normal
885	Struggle	Normal
886	Dragon Pulse	Normal
886	Shadow Ball	Normal
886	Outrage	Normal
887	Dragon Pulse	Normal
887	Shadow Ball	Normal
887	Outrage	Normal
888	Play Rough	Crowned_sword
888	Iron Head	Crowned_sword
888	Wild Charge	Crowned_sword
888	Close Combat	Crowned_sword
888	Play Rough	Hero
888	Iron Head	Hero
888	Wild Charge	Hero
888	Close Combat	Hero
889	Moonblast	Crowned_shield
889	Iron Head	Crowned_shield
889	Crunch	Crowned_shield
889	Close Combat	Crowned_shield
889	Moonblast	Hero
889	Iron Head	Hero
889	Crunch	Hero
889	Close Combat	Hero
890	Cross Poison	Eternamax
890	Dragon Pulse	Eternamax
890	Flamethrower	Eternamax
890	Hyper Beam	Eternamax
890	Cross Poison	Normal
890	Dragon Pulse	Normal
890	Flamethrower	Normal
891	Brick Break	Normal
891	Dynamic Punch	Normal
891	Close Combat	Normal
892	Brick Break	Rapid_strike
892	Dynamic Punch	Rapid_strike
892	Close Combat	Rapid_strike
892	Aqua Jet	Rapid_strike
892	Brick Break	Single_strike
892	Dynamic Punch	Single_strike
892	Close Combat	Single_strike
892	Payback	Single_strike
893	Power Whip	Normal
893	Energy Ball	Normal
893	Dark Pulse	Normal
894	Hyper Beam	Normal
894	Thunder	Normal
894	Zap Cannon	Normal
895	Hyper Beam	Normal
895	Outrage	Normal
895	Dragon Pulse	Normal
896	Avalanche	Normal
896	Icy Wind	Normal
896	Bulldoze	Normal
897	Shadow Ball	Normal
897	Foul Play	Normal
897	Bulldoze	Normal
898	Psyshock	Ice_rider
898	Psychic	Ice_rider
898	Energy Ball	Ice_rider
898	Avalanche	Ice_rider
898	Psyshock	Normal
898	Psychic	Normal
898	Energy Ball	Normal
898	Psyshock	Shadow_rider
898	Psychic	Shadow_rider
898	Energy Ball	Shadow_rider
898	Shadow Ball	Shadow_rider
901	Fire Punch	Normal
901	Thunder Punch	Normal
901	Aerial Ace	Normal
903	Aerial Ace	Normal
903	Close Combat	Normal
903	X Scissor	Normal
904	Aqua Tail	Normal
904	Ice Beam	Normal
904	Sludge Bomb	Normal
904	Dark Pulse	Normal
904	Shadow Ball	Normal
\.


--
-- TOC entry 3414 (class 0 OID 19834)
-- Dependencies: 224
-- Data for Name: pokemon_elite_charge_moves; Type: TABLE DATA; Schema: public; Owner: zitrojj
--

COPY public.pokemon_elite_charge_moves (pokemon_id, charge_move_id, form) FROM stdin;
3	Frenzy Plant	Copy_2019
3	Frenzy Plant	Normal
6	Blast Burn	Copy_2019
6	Flamethrower	Copy_2019
6	Blast Burn	Normal
6	Flamethrower	Normal
9	Hydro Cannon	Copy_2019
9	Hydro Cannon	Normal
15	Drill Run	Normal
18	Air Cutter	Normal
21	Twister	Normal
22	Twister	Normal
23	Gunk Shot	Normal
25	Surf	Adventure_hat_2020
25	Thunder	Adventure_hat_2020
25	Surf	Copy_2019
25	Thunder	Copy_2019
25	Surf	Fall_2019
25	Thunder	Fall_2019
25	Surf	Gofest_2022
25	Thunder	Gofest_2022
25	Surf	Normal
25	Thunder	Normal
25	Surf	Wcs_2022
25	Thunder	Wcs_2022
25	Surf	Winter_2020
25	Thunder	Winter_2020
26	Thunder	Normal
27	Rock Tomb	Normal
28	Night Slash	Normal
38	Fire Blast	Normal
38	Flamethrower	Normal
39	Play Rough	Normal
39	Body Slam	Normal
41	Sludge Bomb	Normal
42	Ominous Wind	Normal
52	Body Slam	Normal
53	Night Slash	Normal
57	Cross Chop	Normal
59	Bulldoze	Normal
61	Scald	Normal
62	Submission	Normal
65	Dazzling Gleam	Normal
65	Psychic	Normal
67	Cross Chop	Normal
68	Stone Edge	Normal
68	Submission	Normal
68	Payback	Normal
75	Rock Slide	Normal
77	Fire Blast	Normal
84	Swift	Normal
85	Air Cutter	Normal
86	Aqua Jet	Normal
87	Aqua Jet	Normal
87	Icy Wind	Normal
91	Blizzard	Normal
92	Ominous Wind	Normal
94	Sludge Wave	Costume_2020
94	Dark Pulse	Costume_2020
94	Psychic	Costume_2020
94	Shadow Punch	Costume_2020
94	Sludge Wave	Normal
94	Dark Pulse	Normal
94	Psychic	Normal
94	Shadow Punch	Normal
95	Iron Head	Normal
95	Rock Slide	Normal
97	Psyshock	Normal
100	Signal Beam	Normal
103	Draco Meteor	Alola
105	Shadow Bone	Alola
106	Stomp	Normal
106	Brick Break	Normal
107	Brick Break	Normal
108	Body Slam	Normal
112	Megahorn	Normal
114	Power Whip	Normal
115	Brick Break	Normal
115	Stomp	Normal
117	Blizzard	Normal
119	Icy Wind	Normal
119	Drill Run	Normal
123	Bug Buzz	Normal
124	Ice Punch	Normal
127	Submission	Normal
130	Dragon Pulse	Normal
130	Aqua Tail	Normal
131	Dragon Pulse	Costume_2020
131	Ice Beam	Costume_2020
131	Dragon Pulse	Normal
131	Ice Beam	Normal
133	Last Resort	Normal
133	Body Slam	Normal
134	Last Resort	Normal
134	Scald	Normal
135	Last Resort	Normal
135	Zap Cannon	Normal
136	Last Resort	Normal
136	Heat Wave	Normal
136	Super Power	Normal
137	Signal Beam	Normal
137	Psybeam	Normal
137	Discharge	Normal
138	Rock Tomb	Normal
138	Brine	Normal
139	Rock Slide	Normal
144	Hurricane	Normal
146	Sky Attack	Normal
149	Draco Meteor	Normal
149	Dragon Pulse	Normal
150	Psystrike	A
150	Psystrike	Normal
150	Shadow Ball	Normal
150	Hyper Beam	Normal
154	Frenzy Plant	Normal
157	Blast Burn	Normal
160	Hydro Cannon	Normal
173	Psychic	Normal
173	Body Slam	Normal
174	Body Slam	Normal
181	Dragon Pulse	Normal
186	Earthquake	Normal
189	Acrobatics	Normal
196	Last Resort	Normal
196	Shadow Ball	Normal
197	Last Resort	Normal
197	Psychic	Normal
239	Thunderbolt	Normal
240	Flamethrower	Normal
249	Aeroblast	Normal
249	Aeroblast	S
250	Earthquake	Normal
250	Sacred Fire	Normal
250	Earthquake	S
250	Sacred Fire	S
254	Frenzy Plant	Normal
257	Blast Burn	Normal
257	Stone Edge	Normal
260	Hydro Cannon	Normal
282	Synchronoise	Normal
286	Grass Knot	Normal
289	Body Slam	Normal
330	Earth Power	Normal
334	Moonblast	Normal
365	Icicle Spear	Normal
373	Outrage	Normal
376	Meteor Mash	Normal
377	Earthquake	Normal
378	Thunder	Normal
379	Zap Cannon	Normal
380	Mist Ball	Normal
380	Mist Ball	S
381	Luster Purge	Normal
381	Luster Purge	S
383	Fire Punch	Normal
384	Hurricane	Normal
384	Breaking Swipe	Normal
389	Frenzy Plant	Normal
392	Blast Burn	Normal
395	Hydro Cannon	Normal
399	Shadow Ball	Normal
399	Thunderbolt	Normal
399	Ice Beam	Normal
399	Super Power	Normal
405	Psychic Fangs	Normal
407	Weather Ball Fire	Normal
445	Earth Power	Normal
463	Body Slam	Normal
464	Rock Wrecker	Normal
466	Flamethrower	Normal
467	Thunderbolt	Normal
470	Last Resort	Normal
471	Last Resort	Normal
471	Water Pulse	Normal
473	Ancient Power	Normal
474	Tri Attack	Normal
475	Synchronoise	Normal
477	Shadow Ball	Normal
487	Shadow Force	Altered
487	Shadow Force	Origin
488	Grass Knot	Normal
491	Sludge Bomb	Normal
497	Frenzy Plant	Normal
500	Blast Burn	Normal
503	Hydro Cannon	Normal
526	Meteor Beam	Normal
609	Poltergeist	Normal
635	Brutal Swing	Normal
638	Sacred Sword	Normal
639	Sacred Sword	Normal
640	Sacred Sword	Normal
643	Fusion Flare	Normal
644	Fusion Bolt	Normal
646	Glaciate	Normal
649	Techno Blast Burn	Burn
649	Techno Blast Chill	Chill
649	Techno Blast Water	Douse
649	Techno Blast Normal	Normal
649	Techno Blast Shock	Shock
652	Frenzy Plant	Normal
700	Last Resort	Normal
700	Psyshock	Normal
715	Boomburst	Normal
760	Drain Punch	Normal
862	Obstruct	Galarian
901	High Horsepower	Normal
\.


--
-- TOC entry 3413 (class 0 OID 19827)
-- Dependencies: 223
-- Data for Name: pokemon_elite_fast_moves; Type: TABLE DATA; Schema: public; Owner: zitrojj
--

COPY public.pokemon_elite_fast_moves (pokemon_id, fast_move_id, form) FROM stdin;
5	Scratch	Normal
6	Ember	Copy_2019
6	Wing Attack	Copy_2019
6	Dragon Breath	Copy_2019
6	Ember	Normal
6	Wing Attack	Normal
6	Dragon Breath	Normal
12	Bug Bite	Normal
15	Bug Bite	Normal
18	Wing Attack	Normal
18	Gust	Normal
25	Present	Adventure_hat_2020
25	Present	Copy_2019
25	Present	Fall_2019
25	Present	Flying_01
25	Present	Flying_02
25	Present	Flying_5th_anniv
25	Present	Gofest_2022
25	Present	Normal
25	Present	Wcs_2022
25	Present	Winter_2020
28	Shadow Claw	Alola
34	Fury Cutter	Normal
36	Pound	Normal
38	Ember	Normal
47	Bug Bite	Normal
49	Bug Bite	Normal
57	Karate Chop	Normal
59	Bite	Normal
65	Counter	Normal
66	Low Kick	Normal
68	Karate Chop	Normal
70	Razor Leaf	Normal
76	Rollout	Alola
78	Ember	Normal
83	Cut	Normal
86	Water Gun	Normal
87	Ice Shard	Normal
89	Lick	Normal
92	Sucker Punch	Normal
93	Lick	Normal
94	Lick	Costume_2020
94	Lick	Normal
99	Mud Shot	Normal
101	Tackle	Normal
103	Zen Headbutt	Normal
107	Rock Smash	Normal
119	Poison Jab	Normal
121	Tackle	Normal
123	Steel Wing	Normal
124	Pound	Normal
130	Dragon Tail	Normal
131	Ice Shard	Costume_2020
131	Ice Shard	Normal
137	Tackle	Normal
137	Zen Headbutt	Normal
139	Rock Throw	Normal
141	Fury Cutter	Normal
143	Yawn	Normal
145	Thunder Shock	Normal
160	Water Gun	Normal
175	Zen Headbutt	Normal
176	Steel Wing	Normal
176	Zen Headbutt	Normal
230	Water Gun	Normal
238	Frost Breath	Normal
245	Hidden Power	Normal
245	Hidden Power	S
248	Smack Down	Normal
251	Magical Leaf	Normal
275	Bullet Seed	Normal
292	Struggle Bug	Normal
365	Powder Snow	Normal
398	Gust	Normal
407	Bullet Seed	Normal
470	Bullet Seed	Normal
663	Incinerate	Normal
\.


--
-- TOC entry 3411 (class 0 OID 19813)
-- Dependencies: 221
-- Data for Name: pokemon_fast_moves; Type: TABLE DATA; Schema: public; Owner: zitrojj
--

COPY public.pokemon_fast_moves (pokemon_id, fast_move_id, form) FROM stdin;
1	Vine Whip	Fall_2019
1	Tackle	Fall_2019
1	Vine Whip	Normal
1	Tackle	Normal
2	Razor Leaf	Normal
2	Vine Whip	Normal
3	Razor Leaf	Copy_2019
3	Vine Whip	Copy_2019
3	Razor Leaf	Normal
3	Vine Whip	Normal
4	Ember	Fall_2019
4	Scratch	Fall_2019
4	Ember	Normal
4	Scratch	Normal
5	Ember	Normal
5	Fire Fang	Normal
6	Fire Spin	Copy_2019
6	Air Slash	Copy_2019
6	Fire Spin	Normal
6	Air Slash	Normal
7	Bubble	Fall_2019
7	Tackle	Fall_2019
7	Bubble	Normal
7	Tackle	Normal
8	Water Gun	Normal
8	Bite	Normal
9	Water Gun	Copy_2019
9	Bite	Copy_2019
9	Water Gun	Normal
9	Bite	Normal
10	Bug Bite	Normal
10	Tackle	Normal
11	Bug Bite	Normal
11	Tackle	Normal
12	Struggle Bug	Normal
12	Confusion	Normal
13	Bug Bite	Normal
13	Poison Sting	Normal
14	Bug Bite	Normal
14	Poison Sting	Normal
15	Infestation	Normal
15	Poison Jab	Normal
16	Quick Attack	Normal
16	Tackle	Normal
17	Wing Attack	Normal
17	Steel Wing	Normal
18	Air Slash	Normal
18	Steel Wing	Normal
19	Tackle	Alola
19	Quick Attack	Alola
19	Tackle	Normal
19	Quick Attack	Normal
20	Bite	Alola
20	Quick Attack	Alola
20	Bite	Normal
20	Quick Attack	Normal
21	Peck	Normal
21	Quick Attack	Normal
22	Peck	Normal
22	Steel Wing	Normal
23	Poison Sting	Normal
23	Acid	Normal
24	Bite	Normal
24	Acid	Normal
24	Dragon Tail	Normal
25	Thunder Shock	Adventure_hat_2020
25	Quick Attack	Adventure_hat_2020
25	Thunder Shock	Copy_2019
25	Quick Attack	Copy_2019
25	Thunder Shock	Costume_2020
25	Quick Attack	Costume_2020
25	Thunder Shock	Fall_2019
25	Quick Attack	Fall_2019
25	Thunder Shock	Flying_01
25	Quick Attack	Flying_01
25	Thunder Shock	Flying_02
25	Quick Attack	Flying_02
25	Thunder Shock	Flying_5th_anniv
25	Quick Attack	Flying_5th_anniv
25	Thunder Shock	Flying_okinawa
25	Quick Attack	Flying_okinawa
25	Thunder Shock	Gofest_2022
25	Quick Attack	Gofest_2022
25	Thunder Shock	Kariyushi
25	Quick Attack	Kariyushi
25	Thunder Shock	Normal
25	Quick Attack	Normal
25	Thunder Shock	Pop_star
25	Charm	Pop_star
25	Thunder Shock	Rock_star
25	Charm	Rock_star
25	Thunder Shock	Tshirt_01
25	Quick Attack	Tshirt_01
25	Thunder Shock	Tshirt_02
25	Quick Attack	Tshirt_02
25	Thunder Shock	Vs_2019
25	Charm	Vs_2019
25	Thunder Shock	Wcs_2022
25	Quick Attack	Wcs_2022
25	Thunder Shock	Winter_2020
25	Quick Attack	Winter_2020
26	Volt Switch	Alola
26	Spark	Alola
26	Thunder Shock	Alola
26	Volt Switch	Normal
26	Spark	Normal
26	Charm	Normal
26	Thunder Shock	Normal
27	Metal Claw	Alola
27	Powder Snow	Alola
27	Scratch	Normal
27	Mud Shot	Normal
28	Metal Claw	Alola
28	Powder Snow	Alola
28	Metal Claw	Normal
28	Mud Shot	Normal
29	Bite	Normal
29	Poison Sting	Normal
30	Bite	Normal
30	Poison Sting	Normal
31	Poison Jab	Normal
31	Bite	Normal
32	Peck	Normal
32	Poison Sting	Normal
33	Poison Jab	Normal
33	Poison Sting	Normal
34	Poison Jab	Normal
34	Iron Tail	Normal
34	Double Kick	Normal
35	Pound	Normal
35	Zen Headbutt	Normal
36	Charge Beam	Normal
36	Zen Headbutt	Normal
36	Charm	Normal
37	Zen Headbutt	Alola
37	Powder Snow	Alola
37	Quick Attack	Normal
37	Ember	Normal
38	Feint Attack	Alola
38	Powder Snow	Alola
38	Charm	Alola
38	Feint Attack	Normal
38	Fire Spin	Normal
39	Pound	Normal
39	Feint Attack	Normal
40	Pound	Normal
40	Feint Attack	Normal
40	Charm	Normal
41	Quick Attack	Normal
41	Bite	Normal
42	Wing Attack	Normal
42	Bite	Normal
43	Razor Leaf	Normal
43	Acid	Normal
44	Razor Leaf	Normal
44	Acid	Normal
45	Razor Leaf	Normal
45	Acid	Normal
46	Scratch	Normal
46	Bug Bite	Normal
47	Struggle Bug	Normal
47	Fury Cutter	Normal
48	Bug Bite	Normal
48	Confusion	Normal
49	Infestation	Normal
49	Confusion	Normal
50	Mud Slap	Alola
50	Metal Claw	Alola
50	Mud Slap	Normal
50	Scratch	Normal
51	Metal Claw	Alola
51	Mud Slap	Alola
51	Sucker Punch	Normal
51	Mud Slap	Normal
52	Scratch	Alola
52	Bite	Alola
52	Scratch	Galarian
52	Metal Claw	Galarian
52	Scratch	Normal
52	Bite	Normal
53	Scratch	Alola
53	Feint Attack	Alola
53	Scratch	Normal
53	Feint Attack	Normal
54	Water Gun	Normal
54	Zen Headbutt	Normal
55	Water Gun	Normal
55	Confusion	Normal
56	Karate Chop	Normal
56	Scratch	Normal
57	Low Kick	Normal
57	Counter	Normal
58	Ember	Hisuian
58	Bite	Hisuian
58	Ember	Normal
58	Bite	Normal
59	Fire Fang	Hisuian
59	Snarl	Hisuian
59	Rock Smash	Hisuian
59	Fire Fang	Normal
59	Snarl	Normal
59	Thunder Fang	Normal
60	Bubble	Normal
60	Mud Shot	Normal
61	Bubble	Normal
61	Mud Shot	Normal
62	Bubble	Normal
62	Rock Smash	Normal
62	Mud Shot	Normal
63	Zen Headbutt	Normal
63	Charge Beam	Normal
64	Psycho Cut	Normal
64	Confusion	Normal
65	Psycho Cut	Normal
65	Confusion	Normal
66	Rock Smash	Normal
66	Karate Chop	Normal
67	Low Kick	Normal
67	Karate Chop	Normal
68	Bullet Punch	Normal
68	Counter	Normal
69	Vine Whip	Normal
69	Acid	Normal
70	Bullet Seed	Normal
70	Acid	Normal
71	Razor Leaf	Normal
71	Acid	Normal
72	Bubble	Normal
72	Poison Sting	Normal
73	Acid	Normal
73	Poison Jab	Normal
74	Rock Throw	Alola
74	Volt Switch	Alola
74	Rock Throw	Normal
74	Tackle	Normal
75	Rock Throw	Alola
75	Volt Switch	Alola
75	Rock Throw	Normal
75	Mud Slap	Normal
76	Rock Throw	Alola
76	Volt Switch	Alola
76	Rock Throw	Normal
76	Mud Slap	Normal
77	Low Kick	Galarian
77	Psycho Cut	Galarian
77	Tackle	Normal
77	Ember	Normal
78	Low Kick	Galarian
78	Psycho Cut	Galarian
78	Fairy Wind	Galarian
78	Low Kick	Normal
78	Fire Spin	Normal
78	Incinerate	Normal
79	Water Gun	2020
79	Confusion	2020
79	Confusion	Galarian
79	Iron Tail	Galarian
79	Water Gun	Normal
79	Confusion	Normal
80	Water Gun	2021
80	Confusion	2021
80	Confusion	Galarian
80	Poison Jab	Galarian
80	Water Gun	Normal
80	Confusion	Normal
81	Spark	Normal
81	Thunder Shock	Normal
82	Spark	Normal
82	Charge Beam	Normal
82	Thunder Shock	Normal
83	Rock Smash	Galarian
83	Fury Cutter	Galarian
83	Air Slash	Normal
83	Fury Cutter	Normal
84	Peck	Normal
84	Quick Attack	Normal
85	Feint Attack	Normal
85	Steel Wing	Normal
86	Ice Shard	Normal
86	Lick	Normal
87	Frost Breath	Normal
87	Iron Tail	Normal
88	Poison Jab	Alola
88	Bite	Alola
88	Poison Jab	Normal
88	Mud Slap	Normal
89	Bite	Alola
89	Poison Jab	Alola
89	Snarl	Alola
89	Infestation	Normal
89	Poison Jab	Normal
90	Ice Shard	Normal
90	Tackle	Normal
91	Frost Breath	Normal
91	Ice Shard	Normal
92	Lick	Normal
92	Astonish	Normal
93	Shadow Claw	Normal
93	Astonish	Normal
94	Sucker Punch	Costume_2020
94	Hex	Costume_2020
94	Shadow Claw	Costume_2020
94	Sucker Punch	Normal
94	Hex	Normal
94	Shadow Claw	Normal
95	Rock Throw	Normal
95	Tackle	Normal
96	Pound	Normal
96	Confusion	Normal
97	Zen Headbutt	Normal
97	Confusion	Normal
98	Bubble	Normal
98	Mud Shot	Normal
99	Bubble	Normal
99	Metal Claw	Normal
100	Charge Beam	Hisuian
100	Tackle	Hisuian
100	Spark	Normal
100	Tackle	Normal
101	Thunder Shock	Hisuian
101	Tackle	Hisuian
101	Spark	Normal
101	Volt Switch	Normal
102	Confusion	Normal
102	Bullet Seed	Normal
103	Bullet Seed	Alola
103	Dragon Tail	Alola
103	Bullet Seed	Normal
103	Extrasensory	Normal
103	Confusion	Normal
104	Mud Slap	Normal
104	Rock Smash	Normal
105	Hex	Alola
105	Rock Smash	Alola
105	Fire Spin	Alola
105	Mud Slap	Normal
105	Rock Smash	Normal
106	Low Kick	Normal
106	Rock Smash	Normal
106	Double Kick	Normal
107	Bullet Punch	Normal
107	Counter	Normal
108	Lick	Normal
108	Zen Headbutt	Normal
109	Tackle	Normal
109	Infestation	Normal
110	Tackle	Galarian
110	Fairy Wind	Galarian
110	Tackle	Normal
110	Infestation	Normal
111	Mud Slap	Normal
111	Rock Smash	Normal
112	Mud Slap	Normal
112	Rock Smash	Normal
113	Pound	Normal
113	Zen Headbutt	Normal
114	Vine Whip	Normal
114	Infestation	Normal
115	Mud Slap	Normal
115	Low Kick	Normal
116	Water Gun	Normal
116	Bubble	Normal
117	Water Gun	Normal
117	Dragon Breath	Normal
118	Peck	Normal
118	Mud Shot	Normal
119	Peck	Normal
119	Waterfall	Normal
120	Tackle	Normal
120	Water Gun	Normal
121	Hidden Power	Normal
121	Water Gun	Normal
122	Confusion	Galarian
122	Zen Headbutt	Galarian
122	Confusion	Normal
122	Zen Headbutt	Normal
123	Fury Cutter	Normal
123	Air Slash	Normal
124	Frost Breath	Normal
124	Confusion	Normal
125	Thunder Shock	Normal
125	Low Kick	Normal
126	Ember	Normal
126	Karate Chop	Normal
127	Rock Smash	Normal
127	Bug Bite	Normal
127	Fury Cutter	Normal
128	Tackle	Normal
128	Zen Headbutt	Normal
129	Splash	Normal
130	Bite	Normal
130	Waterfall	Normal
130	Dragon Breath	Normal
131	Frost Breath	Costume_2020
131	Water Gun	Costume_2020
131	Frost Breath	Normal
131	Water Gun	Normal
132	Transform	Normal
133	Quick Attack	Normal
133	Tackle	Normal
134	Water Gun	Normal
135	Thunder Shock	Normal
135	Volt Switch	Normal
136	Ember	Normal
136	Fire Spin	Normal
137	Charge Beam	Normal
137	Hidden Power	Normal
138	Water Gun	Normal
138	Mud Shot	Normal
139	Mud Shot	Normal
139	Water Gun	Normal
140	Scratch	Normal
140	Mud Shot	Normal
141	Mud Shot	Normal
141	Rock Smash	Normal
141	Waterfall	Normal
142	Steel Wing	Normal
142	Bite	Normal
142	Rock Throw	Normal
143	Zen Headbutt	Normal
143	Lick	Normal
144	Confusion	Galarian
144	Psycho Cut	Galarian
144	Frost Breath	Normal
144	Ice Shard	Normal
145	Counter	Galarian
145	Charge Beam	Normal
146	Sucker Punch	Galarian
146	Wing Attack	Galarian
146	Fire Spin	Normal
146	Wing Attack	Normal
147	Dragon Breath	Normal
147	Iron Tail	Normal
148	Dragon Breath	Normal
148	Iron Tail	Normal
149	Dragon Tail	Normal
149	Steel Wing	Normal
149	Dragon Breath	Normal
150	Confusion	A
150	Iron Tail	A
150	Psycho Cut	Normal
150	Confusion	Normal
151	Pound	Normal
151	Steel Wing	Normal
151	Charge Beam	Normal
151	Shadow Claw	Normal
151	Volt Switch	Normal
151	Struggle Bug	Normal
151	Frost Breath	Normal
151	Dragon Tail	Normal
151	Infestation	Normal
151	Poison Jab	Normal
151	Rock Smash	Normal
151	Snarl	Normal
151	Cut	Normal
151	Waterfall	Normal
152	Vine Whip	Normal
152	Tackle	Normal
153	Razor Leaf	Normal
153	Tackle	Normal
154	Razor Leaf	Normal
154	Vine Whip	Normal
155	Ember	Normal
155	Tackle	Normal
156	Ember	Normal
156	Tackle	Normal
157	Ember	Normal
157	Shadow Claw	Normal
157	Incinerate	Normal
158	Water Gun	Normal
158	Scratch	Normal
159	Water Gun	Normal
159	Scratch	Normal
160	Waterfall	Normal
160	Bite	Normal
160	Ice Fang	Normal
161	Scratch	Normal
161	Quick Attack	Normal
162	Quick Attack	Normal
162	Sucker Punch	Normal
163	Feint Attack	Normal
163	Peck	Normal
164	Wing Attack	Normal
164	Extrasensory	Normal
165	Tackle	Normal
165	Bug Bite	Normal
166	Struggle Bug	Normal
166	Bug Bite	Normal
167	Poison Sting	Normal
167	Bug Bite	Normal
168	Poison Sting	Normal
168	Infestation	Normal
169	Air Slash	Normal
169	Bite	Normal
170	Bubble	Normal
170	Spark	Normal
171	Water Gun	Normal
171	Charge Beam	Normal
171	Spark	Normal
172	Thunder Shock	Normal
173	Pound	Normal
173	Zen Headbutt	Normal
174	Pound	Normal
174	Feint Attack	Normal
175	Hidden Power	Normal
175	Peck	Normal
176	Extrasensory	Normal
176	Hidden Power	Normal
177	Peck	Normal
177	Quick Attack	Normal
178	Air Slash	Normal
178	Feint Attack	Normal
179	Tackle	Normal
179	Thunder Shock	Normal
180	Tackle	Normal
180	Charge Beam	Normal
181	Charge Beam	Normal
181	Volt Switch	Normal
182	Razor Leaf	Normal
182	Acid	Normal
182	Bullet Seed	Normal
183	Tackle	Normal
183	Bubble	Normal
184	Rock Smash	Normal
184	Bubble	Normal
185	Rock Throw	Normal
185	Counter	Normal
186	Mud Shot	Normal
186	Bubble	Normal
187	Tackle	Normal
187	Bullet Seed	Normal
188	Tackle	Normal
188	Bullet Seed	Normal
189	Infestation	Normal
189	Bullet Seed	Normal
189	Fairy Wind	Normal
190	Scratch	Normal
190	Astonish	Normal
191	Razor Leaf	Normal
191	Cut	Normal
192	Razor Leaf	Normal
192	Bullet Seed	Normal
193	Quick Attack	Normal
193	Wing Attack	Normal
194	Water Gun	Normal
194	Mud Shot	Normal
195	Water Gun	Normal
195	Mud Shot	Normal
196	Confusion	Normal
196	Zen Headbutt	Normal
197	Feint Attack	Normal
197	Snarl	Normal
198	Peck	Normal
198	Feint Attack	Normal
199	Water Gun	2022
199	Confusion	2022
199	Hex	Galarian
199	Confusion	Galarian
199	Acid	Galarian
199	Water Gun	Normal
199	Confusion	Normal
200	Astonish	Normal
200	Hex	Normal
201	Hidden Power	Normal
202	Counter	Normal
202	Splash	Normal
202	Charm	Normal
203	Tackle	Normal
203	Confusion	Normal
203	Double Kick	Normal
204	Tackle	Normal
204	Bug Bite	Normal
205	Bug Bite	Normal
205	Struggle Bug	Normal
206	Bite	Normal
206	Astonish	Normal
206	Rollout	Normal
207	Fury Cutter	Normal
207	Wing Attack	Normal
208	Iron Tail	Normal
208	Dragon Tail	Normal
208	Thunder Fang	Normal
209	Tackle	Normal
209	Bite	Normal
210	Bite	Normal
210	Snarl	Normal
210	Charm	Normal
211	Poison Sting	Hisuian
211	Poison Jab	Hisuian
211	Poison Sting	Normal
211	Water Gun	Normal
212	Bullet Punch	Normal
212	Fury Cutter	Normal
213	Struggle Bug	Normal
213	Rock Throw	Normal
214	Counter	Normal
214	Struggle Bug	Normal
215	Rock Smash	Hisuian
215	Poison Jab	Hisuian
215	Ice Shard	Normal
215	Feint Attack	Normal
216	Scratch	Normal
216	Lick	Normal
217	Metal Claw	Normal
217	Counter	Normal
217	Shadow Claw	Normal
218	Ember	Normal
218	Rock Throw	Normal
219	Ember	Normal
219	Rock Throw	Normal
219	Incinerate	Normal
220	Tackle	Normal
220	Powder Snow	Normal
221	Ice Shard	Normal
221	Powder Snow	Normal
222	Tackle	Normal
222	Bubble	Normal
223	Water Gun	Normal
223	Mud Shot	Normal
224	Water Gun	Normal
224	Mud Shot	Normal
224	Lock On	Normal
225	Present	Normal
225	Present	Winter_2020
226	Bubble	Normal
226	Wing Attack	Normal
226	Bullet Seed	Normal
227	Steel Wing	Normal
227	Air Slash	Normal
228	Feint Attack	Normal
228	Ember	Normal
229	Snarl	Normal
229	Fire Fang	Normal
230	Waterfall	Normal
230	Dragon Breath	Normal
231	Tackle	Normal
231	Rock Smash	Normal
232	Tackle	Normal
232	Counter	Normal
232	Mud Slap	Normal
232	Charm	Normal
233	Hidden Power	Normal
233	Charge Beam	Normal
233	Lock On	Normal
234	Tackle	Normal
234	Zen Headbutt	Normal
236	Rock Smash	Normal
236	Tackle	Normal
237	Rock Smash	Normal
237	Counter	Normal
238	Powder Snow	Normal
238	Pound	Normal
239	Thunder Shock	Normal
239	Low Kick	Normal
240	Ember	Normal
240	Karate Chop	Normal
241	Tackle	Normal
241	Zen Headbutt	Normal
241	Rollout	Normal
242	Pound	Normal
242	Zen Headbutt	Normal
243	Thunder Shock	Normal
243	Volt Switch	Normal
243	Thunder Shock	S
243	Volt Switch	S
244	Fire Spin	Normal
244	Fire Fang	Normal
244	Fire Spin	S
244	Fire Fang	S
245	Extrasensory	Normal
245	Snarl	Normal
245	Ice Fang	Normal
245	Extrasensory	S
245	Snarl	S
245	Ice Fang	S
246	Bite	Normal
246	Rock Smash	Normal
247	Bite	Normal
247	Rock Smash	Normal
248	Bite	Normal
248	Iron Tail	Normal
249	Extrasensory	Normal
249	Dragon Tail	Normal
249	Extrasensory	S
249	Dragon Tail	S
250	Extrasensory	Normal
250	Steel Wing	Normal
250	Hidden Power	Normal
250	Incinerate	Normal
250	Extrasensory	S
250	Steel Wing	S
250	Hidden Power	S
250	Incinerate	S
251	Confusion	Normal
251	Charge Beam	Normal
252	Pound	Normal
252	Bullet Seed	Normal
253	Quick Attack	Normal
253	Bullet Seed	Normal
254	Fury Cutter	Normal
254	Bullet Seed	Normal
255	Scratch	Normal
255	Ember	Normal
256	Peck	Normal
256	Ember	Normal
257	Counter	Normal
257	Fire Spin	Normal
258	Tackle	Normal
258	Water Gun	Normal
259	Mud Shot	Normal
259	Water Gun	Normal
260	Mud Shot	Normal
260	Water Gun	Normal
261	Tackle	Normal
261	Snarl	Normal
262	Bite	Normal
262	Fire Fang	Normal
262	Thunder Fang	Normal
262	Ice Fang	Normal
263	Tackle	Galarian
263	Take Down	Galarian
263	Tackle	Normal
263	Rock Smash	Normal
264	Snarl	Galarian
264	Lick	Galarian
264	Shadow Claw	Normal
264	Tackle	Normal
265	Tackle	Normal
265	Bug Bite	Normal
266	Poison Sting	Normal
266	Bug Bite	Normal
267	Struggle Bug	Normal
267	Infestation	Normal
268	Poison Sting	Normal
268	Bug Bite	Normal
269	Struggle Bug	Normal
269	Confusion	Normal
270	Water Gun	Normal
270	Razor Leaf	Normal
271	Bubble	Normal
271	Razor Leaf	Normal
272	Bubble	Normal
272	Razor Leaf	Normal
273	Bullet Seed	Normal
273	Quick Attack	Normal
274	Razor Leaf	Normal
274	Feint Attack	Normal
275	Razor Leaf	Normal
275	Feint Attack	Normal
275	Snarl	Normal
276	Peck	Normal
276	Quick Attack	Normal
277	Wing Attack	Normal
277	Steel Wing	Normal
278	Water Gun	Normal
278	Quick Attack	Normal
279	Water Gun	Normal
279	Wing Attack	Normal
280	Confusion	Normal
280	Charge Beam	Normal
281	Confusion	Normal
281	Charge Beam	Normal
282	Confusion	Normal
282	Charge Beam	Normal
282	Charm	Normal
283	Bubble	Normal
283	Bug Bite	Normal
284	Infestation	Normal
284	Air Slash	Normal
285	Tackle	Normal
285	Bullet Seed	Normal
286	Counter	Normal
286	Bullet Seed	Normal
287	Yawn	Normal
288	Scratch	Normal
288	Counter	Normal
289	Yawn	Normal
290	Scratch	Normal
290	Bug Bite	Normal
291	Fury Cutter	Normal
291	Metal Claw	Normal
292	Bug Bite	Normal
292	Shadow Claw	Normal
293	Pound	Normal
293	Astonish	Normal
294	Bite	Normal
294	Rock Smash	Normal
295	Bite	Normal
295	Astonish	Normal
296	Rock Smash	Normal
296	Tackle	Normal
297	Counter	Normal
297	Bullet Punch	Normal
298	Splash	Normal
298	Bubble	Normal
299	Rock Throw	Normal
299	Spark	Normal
300	Feint Attack	Normal
300	Tackle	Normal
301	Feint Attack	Normal
301	Zen Headbutt	Normal
301	Charm	Normal
302	Shadow Claw	Costume_2020
302	Feint Attack	Costume_2020
302	Shadow Claw	Normal
302	Feint Attack	Normal
303	Bite	Normal
303	Astonish	Normal
303	Ice Fang	Normal
303	Fire Fang	Normal
303	Fairy Wind	Normal
304	Tackle	Normal
304	Metal Claw	Normal
305	Metal Claw	Normal
305	Iron Tail	Normal
306	Dragon Tail	Normal
306	Iron Tail	Normal
306	Smack Down	Normal
307	Confusion	Normal
307	Rock Smash	Normal
308	Psycho Cut	Normal
308	Counter	Normal
309	Quick Attack	Normal
309	Spark	Normal
310	Snarl	Normal
310	Charge Beam	Normal
310	Thunder Fang	Normal
311	Spark	Normal
311	Quick Attack	Normal
312	Spark	Normal
312	Quick Attack	Normal
313	Struggle Bug	Normal
313	Tackle	Normal
314	Struggle Bug	Normal
314	Tackle	Normal
315	Poison Jab	Normal
315	Razor Leaf	Normal
316	Pound	Normal
316	Rock Smash	Normal
317	Rock Smash	Normal
317	Infestation	Normal
318	Bite	Normal
318	Snarl	Normal
319	Bite	Normal
319	Waterfall	Normal
320	Splash	Normal
320	Water Gun	Normal
321	Zen Headbutt	Normal
321	Water Gun	Normal
322	Ember	Normal
322	Tackle	Normal
323	Ember	Normal
323	Rock Smash	Normal
323	Incinerate	Normal
324	Fire Spin	Normal
324	Ember	Normal
325	Splash	Normal
325	Zen Headbutt	Normal
326	Charge Beam	Normal
326	Extrasensory	Normal
327	Sucker Punch	Normal
327	Psycho Cut	Normal
328	Mud Shot	Normal
328	Struggle Bug	Normal
329	Mud Shot	Normal
329	Dragon Breath	Normal
330	Mud Shot	Normal
330	Dragon Tail	Normal
331	Poison Sting	Normal
331	Sucker Punch	Normal
332	Poison Jab	Normal
332	Sucker Punch	Normal
333	Peck	Normal
333	Astonish	Normal
334	Peck	Normal
334	Dragon Breath	Normal
335	Fury Cutter	Normal
335	Shadow Claw	Normal
336	Poison Jab	Normal
336	Iron Tail	Normal
337	Rock Throw	Normal
337	Confusion	Normal
338	Rock Throw	Normal
338	Confusion	Normal
339	Water Gun	Normal
339	Mud Shot	Normal
340	Water Gun	Normal
340	Mud Shot	Normal
341	Bubble	Normal
341	Rock Smash	Normal
342	Waterfall	Normal
342	Snarl	Normal
343	Confusion	Normal
343	Extrasensory	Normal
344	Extrasensory	Normal
344	Confusion	Normal
344	Mud Slap	Normal
345	Acid	Normal
345	Infestation	Normal
346	Acid	Normal
346	Infestation	Normal
346	Bullet Seed	Normal
347	Struggle Bug	Normal
347	Scratch	Normal
348	Fury Cutter	Normal
348	Struggle Bug	Normal
349	Splash	Normal
349	Tackle	Normal
350	Waterfall	Normal
350	Dragon Tail	Normal
351	Tackle	Normal
351	Hex	Normal
351	Water Gun	Rainy
351	Tackle	Rainy
351	Powder Snow	Snowy
351	Tackle	Snowy
351	Ember	Sunny
351	Tackle	Sunny
352	Lick	Normal
352	Sucker Punch	Normal
353	Feint Attack	Normal
353	Astonish	Normal
354	Hex	Normal
354	Shadow Claw	Normal
355	Hex	Normal
355	Astonish	Normal
356	Hex	Normal
356	Feint Attack	Normal
357	Air Slash	Normal
357	Razor Leaf	Normal
358	Extrasensory	Normal
358	Astonish	Normal
359	Psycho Cut	Normal
359	Snarl	Normal
360	Splash	Normal
360	Counter	Normal
361	Powder Snow	Normal
361	Hex	Normal
362	Ice Shard	Normal
362	Frost Breath	Normal
363	Water Gun	Normal
363	Rock Smash	Normal
364	Water Gun	Normal
364	Powder Snow	Normal
365	Waterfall	Normal
365	Frost Breath	Normal
366	Water Gun	Normal
367	Water Gun	Normal
367	Bite	Normal
368	Water Gun	Normal
368	Confusion	Normal
369	Water Gun	Normal
369	Zen Headbutt	Normal
370	Water Gun	Normal
370	Splash	Normal
371	Bite	Normal
371	Ember	Normal
372	Ember	Normal
372	Dragon Breath	Normal
373	Dragon Tail	Normal
373	Fire Fang	Normal
373	Bite	Normal
374	Take Down	Normal
375	Zen Headbutt	Normal
375	Metal Claw	Normal
376	Bullet Punch	Normal
376	Zen Headbutt	Normal
377	Rock Throw	Normal
377	Rock Smash	Normal
377	Lock On	Normal
378	Frost Breath	Normal
378	Rock Smash	Normal
378	Lock On	Normal
379	Metal Claw	Normal
379	Rock Smash	Normal
379	Lock On	Normal
380	Dragon Breath	Normal
380	Zen Headbutt	Normal
380	Charm	Normal
380	Dragon Breath	S
380	Zen Headbutt	S
380	Charm	S
381	Dragon Breath	Normal
381	Zen Headbutt	Normal
381	Dragon Breath	S
381	Zen Headbutt	S
382	Waterfall	Normal
383	Mud Shot	Normal
383	Dragon Tail	Normal
384	Air Slash	Normal
384	Dragon Tail	Normal
385	Confusion	Normal
385	Charge Beam	Normal
386	Zen Headbutt	Attack
386	Poison Jab	Attack
386	Zen Headbutt	Defense
386	Counter	Defense
386	Zen Headbutt	Normal
386	Charge Beam	Normal
386	Zen Headbutt	Speed
386	Charge Beam	Speed
387	Tackle	Normal
387	Razor Leaf	Normal
388	Bite	Normal
388	Razor Leaf	Normal
389	Bite	Normal
389	Razor Leaf	Normal
390	Ember	Normal
390	Scratch	Normal
391	Ember	Normal
391	Rock Smash	Normal
392	Fire Spin	Normal
392	Rock Smash	Normal
393	Bubble	Normal
393	Pound	Normal
394	Bubble	Normal
394	Metal Claw	Normal
395	Waterfall	Normal
395	Metal Claw	Normal
396	Tackle	Normal
396	Quick Attack	Normal
397	Wing Attack	Normal
397	Quick Attack	Normal
398	Wing Attack	Normal
398	Quick Attack	Normal
399	Tackle	Normal
399	Take Down	Normal
400	Water Gun	Normal
400	Take Down	Normal
401	Struggle Bug	Normal
401	Bug Bite	Normal
402	Struggle Bug	Normal
402	Fury Cutter	Normal
403	Tackle	Normal
403	Spark	Normal
404	Spark	Normal
404	Bite	Normal
405	Spark	Normal
405	Snarl	Normal
405	Hidden Power	Normal
406	Hidden Power	Normal
406	Razor Leaf	Normal
407	Poison Jab	Normal
407	Razor Leaf	Normal
408	Zen Headbutt	Normal
408	Take Down	Normal
409	Zen Headbutt	Normal
409	Smack Down	Normal
410	Tackle	Normal
410	Iron Tail	Normal
411	Smack Down	Normal
411	Iron Tail	Normal
412	Tackle	Plant
412	Bug Bite	Plant
412	Tackle	Sandy
412	Bug Bite	Sandy
412	Tackle	Trash
412	Bug Bite	Trash
413	Confusion	Plant
413	Bug Bite	Plant
413	Confusion	Sandy
413	Bug Bite	Sandy
413	Confusion	Trash
413	Bug Bite	Trash
414	Air Slash	Normal
414	Bug Bite	Normal
415	Bug Bite	Normal
416	Bug Bite	Normal
416	Poison Sting	Normal
416	Fury Cutter	Normal
416	Air Slash	Normal
417	Spark	Normal
417	Volt Switch	Normal
418	Water Gun	Normal
418	Quick Attack	Normal
419	Water Gun	Normal
419	Waterfall	Normal
420	Tackle	Normal
420	Bullet Seed	Normal
421	Razor Leaf	Overcast
421	Bullet Seed	Overcast
421	Razor Leaf	Sunny
421	Bullet Seed	Sunny
422	Mud Slap	East_sea
422	Hidden Power	East_sea
422	Mud Slap	West_sea
422	Hidden Power	West_sea
423	Mud Slap	East_sea
423	Hidden Power	East_sea
423	Mud Slap	West_sea
423	Hidden Power	West_sea
424	Scratch	Normal
424	Astonish	Normal
425	Hex	Normal
425	Astonish	Normal
426	Hex	Normal
426	Astonish	Normal
427	Pound	Normal
427	Quick Attack	Normal
428	Pound	Normal
428	Low Kick	Normal
428	Double Kick	Normal
429	Sucker Punch	Normal
429	Hex	Normal
430	Peck	Normal
430	Snarl	Normal
431	Scratch	Normal
431	Quick Attack	Normal
432	Scratch	Normal
432	Shadow Claw	Normal
433	Zen Headbutt	Normal
433	Astonish	Normal
434	Scratch	Normal
434	Bite	Normal
435	Poison Jab	Normal
435	Bite	Normal
436	Tackle	Normal
436	Confusion	Normal
437	Feint Attack	Normal
437	Confusion	Normal
438	Rock Throw	Normal
438	Counter	Normal
439	Confusion	Normal
439	Pound	Normal
440	Pound	Normal
440	Zen Headbutt	Normal
441	Peck	Normal
441	Steel Wing	Normal
442	Feint Attack	Normal
442	Sucker Punch	Normal
443	Take Down	Normal
443	Mud Shot	Normal
444	Take Down	Normal
444	Mud Shot	Normal
445	Dragon Tail	Normal
445	Mud Shot	Normal
446	Tackle	Normal
446	Lick	Normal
447	Counter	Normal
447	Quick Attack	Normal
448	Counter	Normal
448	Bullet Punch	Normal
449	Tackle	Normal
449	Bite	Normal
450	Fire Fang	Normal
450	Bite	Normal
450	Thunder Fang	Normal
450	Ice Fang	Normal
451	Poison Sting	Normal
451	Infestation	Normal
452	Poison Sting	Normal
452	Infestation	Normal
452	Bite	Normal
452	Ice Fang	Normal
453	Poison Sting	Normal
453	Poison Jab	Normal
454	Poison Jab	Normal
454	Counter	Normal
455	Bite	Normal
455	Vine Whip	Normal
456	Pound	Normal
456	Water Gun	Normal
457	Waterfall	Normal
457	Water Gun	Normal
458	Bubble	Normal
458	Tackle	Normal
459	Powder Snow	Normal
459	Ice Shard	Normal
460	Powder Snow	Normal
460	Razor Leaf	Normal
461	Ice Shard	Normal
461	Feint Attack	Normal
461	Snarl	Normal
462	Spark	Normal
462	Charge Beam	Normal
463	Lick	Normal
463	Zen Headbutt	Normal
464	Mud Slap	Normal
464	Smack Down	Normal
465	Vine Whip	Normal
465	Infestation	Normal
466	Thunder Shock	Normal
466	Low Kick	Normal
467	Fire Spin	Normal
467	Karate Chop	Normal
468	Air Slash	Normal
468	Hidden Power	Normal
468	Charm	Normal
469	Bug Bite	Normal
469	Wing Attack	Normal
470	Razor Leaf	Normal
470	Quick Attack	Normal
471	Ice Shard	Normal
471	Frost Breath	Normal
472	Fury Cutter	Normal
472	Wing Attack	Normal
473	Mud Slap	Normal
473	Powder Snow	Normal
474	Hidden Power	Normal
474	Charge Beam	Normal
474	Lock On	Normal
475	Confusion	Normal
475	Low Kick	Normal
475	Charm	Normal
476	Rock Throw	Normal
476	Spark	Normal
477	Hex	Normal
477	Astonish	Normal
478	Powder Snow	Normal
478	Hex	Normal
479	Astonish	Fan
479	Air Slash	Fan
479	Astonish	Frost
479	Thunder Shock	Frost
479	Astonish	Heat
479	Thunder Shock	Heat
479	Astonish	Mow
479	Thunder Shock	Mow
479	Astonish	Normal
479	Thunder Shock	Normal
479	Astonish	Wash
479	Thunder Shock	Wash
480	Confusion	Normal
480	Extrasensory	Normal
481	Confusion	Normal
481	Extrasensory	Normal
482	Confusion	Normal
482	Extrasensory	Normal
483	Dragon Breath	Normal
483	Metal Claw	Normal
484	Dragon Breath	Normal
484	Dragon Tail	Normal
485	Fire Spin	Normal
485	Bug Bite	Normal
486	Zen Headbutt	Normal
486	Hidden Power	Normal
487	Dragon Breath	Altered
487	Shadow Claw	Altered
487	Dragon Tail	Origin
487	Shadow Claw	Origin
488	Psycho Cut	Normal
488	Confusion	Normal
489	Waterfall	Normal
489	Bubble	Normal
490	Waterfall	Normal
490	Bubble	Normal
491	Snarl	Normal
491	Feint Attack	Normal
492	Hidden Power	Land
492	Zen Headbutt	Land
492	Hidden Power	Sky
492	Zen Headbutt	Sky
493	Iron Tail	Bug
493	Shadow Claw	Bug
493	Iron Tail	Dark
493	Shadow Claw	Dark
493	Iron Tail	Dragon
493	Shadow Claw	Dragon
493	Iron Tail	Electric
493	Shadow Claw	Electric
493	Iron Tail	Fairy
493	Shadow Claw	Fairy
493	Iron Tail	Fighting
493	Shadow Claw	Fighting
493	Iron Tail	Fire
493	Shadow Claw	Fire
493	Iron Tail	Flying
493	Shadow Claw	Flying
493	Iron Tail	Ghost
493	Shadow Claw	Ghost
493	Iron Tail	Grass
493	Shadow Claw	Grass
493	Iron Tail	Ground
493	Shadow Claw	Ground
493	Iron Tail	Ice
493	Shadow Claw	Ice
493	Iron Tail	Normal
493	Shadow Claw	Normal
493	Iron Tail	Poison
493	Shadow Claw	Poison
493	Iron Tail	Psychic
493	Shadow Claw	Psychic
493	Iron Tail	Rock
493	Shadow Claw	Rock
493	Iron Tail	Steel
493	Shadow Claw	Steel
493	Iron Tail	Water
493	Shadow Claw	Water
494	Confusion	Normal
494	Quick Attack	Normal
495	Tackle	Normal
495	Vine Whip	Normal
496	Iron Tail	Normal
496	Vine Whip	Normal
497	Iron Tail	Normal
497	Vine Whip	Normal
498	Tackle	Normal
498	Ember	Normal
499	Tackle	Normal
499	Ember	Normal
500	Low Kick	Normal
500	Ember	Normal
501	Tackle	Normal
501	Water Gun	Normal
502	Fury Cutter	Normal
502	Water Gun	Normal
503	Fury Cutter	Normal
503	Waterfall	Normal
504	Tackle	Normal
504	Bite	Normal
505	Low Kick	Normal
505	Bite	Normal
506	Tackle	Normal
506	Take Down	Normal
507	Lick	Normal
507	Take Down	Normal
508	Lick	Normal
508	Take Down	Normal
508	Ice Fang	Normal
509	Scratch	Normal
509	Sucker Punch	Normal
510	Charm	Normal
510	Snarl	Normal
511	Scratch	Normal
511	Vine Whip	Normal
512	Bite	Normal
512	Vine Whip	Normal
513	Scratch	Normal
513	Fire Spin	Normal
514	Bite	Normal
514	Fire Spin	Normal
515	Scratch	Normal
515	Water Gun	Normal
516	Bite	Normal
516	Water Gun	Normal
517	Zen Headbutt	Normal
517	Charge Beam	Normal
518	Zen Headbutt	Normal
518	Charge Beam	Normal
519	Quick Attack	Normal
519	Air Slash	Normal
520	Air Slash	Normal
520	Steel Wing	Normal
521	Air Slash	Normal
521	Steel Wing	Normal
522	Quick Attack	Normal
522	Spark	Normal
523	Low Kick	Normal
523	Spark	Normal
524	Tackle	Normal
524	Smack Down	Normal
525	Mud Slap	Normal
525	Smack Down	Normal
526	Mud Slap	Normal
526	Smack Down	Normal
527	Confusion	Normal
527	Air Slash	Normal
528	Confusion	Normal
528	Air Slash	Normal
529	Scratch	Normal
529	Mud Slap	Normal
530	Metal Claw	Normal
530	Mud Slap	Normal
530	Mud Shot	Normal
531	Pound	Normal
531	Zen Headbutt	Normal
532	Low Kick	Normal
532	Pound	Normal
533	Low Kick	Normal
533	Poison Jab	Normal
534	Counter	Normal
534	Poison Jab	Normal
535	Mud Shot	Normal
535	Bubble	Normal
536	Mud Shot	Normal
536	Bubble	Normal
537	Mud Shot	Normal
537	Bubble	Normal
538	Low Kick	Normal
538	Zen Headbutt	Normal
539	Low Kick	Normal
539	Poison Jab	Normal
540	Struggle Bug	Normal
540	Bug Bite	Normal
541	Struggle Bug	Normal
541	Bug Bite	Normal
542	Razor Leaf	Normal
542	Bug Bite	Normal
543	Bug Bite	Normal
543	Poison Sting	Normal
544	Bug Bite	Normal
544	Poison Sting	Normal
545	Bug Bite	Normal
545	Poison Jab	Normal
546	Charm	Normal
546	Razor Leaf	Normal
547	Charm	Normal
547	Razor Leaf	Normal
548	Charm	Normal
548	Hidden Power	Normal
549	Charm	Normal
549	Hidden Power	Normal
550	Tackle	Blue_striped
550	Water Gun	Blue_striped
550	Tackle	Red_striped
550	Water Gun	Red_striped
551	Bite	Normal
551	Mud Slap	Normal
552	Bite	Normal
552	Mud Slap	Normal
553	Snarl	Normal
553	Mud Slap	Normal
554	Tackle	Galarian
554	Ice Fang	Galarian
554	Tackle	Normal
554	Fire Fang	Normal
555	Tackle	Galarian_standard
555	Ice Fang	Galarian_standard
555	Tackle	Galarian_zen
555	Ice Fang	Galarian_zen
555	Tackle	Standard
555	Fire Fang	Standard
555	Incinerate	Standard
555	Tackle	Zen
555	Fire Fang	Zen
555	Incinerate	Zen
556	Bullet Seed	Normal
556	Poison Jab	Normal
557	Cut	Normal
557	Smack Down	Normal
558	Fury Cutter	Normal
558	Smack Down	Normal
559	Rock Smash	Normal
559	Feint Attack	Normal
560	Counter	Normal
560	Snarl	Normal
561	Air Slash	Normal
561	Zen Headbutt	Normal
562	Astonish	Galarian
562	Astonish	Normal
562	Zen Headbutt	Normal
563	Astonish	Normal
563	Zen Headbutt	Normal
563	Shadow Claw	Normal
564	Water Gun	Normal
564	Bite	Normal
565	Water Gun	Normal
565	Rock Throw	Normal
566	Quick Attack	Normal
566	Wing Attack	Normal
567	Steel Wing	Normal
567	Wing Attack	Normal
568	Pound	Normal
568	Take Down	Normal
569	Infestation	Normal
569	Take Down	Normal
570	Scratch	Normal
570	Feint Attack	Normal
571	Shadow Claw	Normal
571	Snarl	Normal
572	Pound	Normal
572	Charm	Normal
573	Pound	Normal
573	Charm	Normal
574	Pound	Normal
574	Confusion	Normal
575	Pound	Normal
575	Confusion	Normal
576	Charm	Normal
576	Confusion	Normal
577	Hidden Power	Normal
577	Zen Headbutt	Normal
578	Hidden Power	Normal
578	Zen Headbutt	Normal
579	Hidden Power	Normal
579	Zen Headbutt	Normal
580	Water Gun	Normal
580	Wing Attack	Normal
581	Water Gun	Normal
581	Air Slash	Normal
582	Powder Snow	Normal
582	Astonish	Normal
583	Frost Breath	Normal
583	Astonish	Normal
584	Frost Breath	Normal
584	Astonish	Normal
585	Tackle	Autumn
585	Take Down	Autumn
585	Tackle	Spring
585	Take Down	Spring
585	Tackle	Summer
585	Take Down	Summer
585	Tackle	Winter
585	Take Down	Winter
586	Feint Attack	Autumn
586	Take Down	Autumn
586	Feint Attack	Spring
586	Take Down	Spring
586	Feint Attack	Summer
586	Take Down	Summer
586	Feint Attack	Winter
586	Take Down	Winter
587	Thunder Shock	Normal
587	Quick Attack	Normal
588	Peck	Normal
588	Fury Cutter	Normal
589	Counter	Normal
589	Bug Bite	Normal
590	Astonish	Normal
590	Feint Attack	Normal
591	Astonish	Normal
591	Feint Attack	Normal
592	Bubble	Female
592	Hex	Female
592	Bubble	Normal
592	Hex	Normal
593	Bubble	Female
593	Hex	Female
593	Bubble	Normal
593	Hex	Normal
594	Waterfall	Normal
594	Hidden Power	Normal
595	Charge Beam	Normal
595	Sucker Punch	Normal
596	Volt Switch	Normal
596	Fury Cutter	Normal
597	Tackle	Normal
597	Metal Claw	Normal
598	Bullet Seed	Normal
598	Metal Claw	Normal
599	Volt Switch	Normal
599	Charge Beam	Normal
600	Thunder Shock	Normal
600	Charge Beam	Normal
601	Thunder Shock	Normal
601	Charge Beam	Normal
602	Tackle	Normal
602	Spark	Normal
603	Acid	Normal
603	Spark	Normal
604	Acid	Normal
604	Spark	Normal
605	Confusion	Normal
605	Astonish	Normal
606	Confusion	Normal
606	Astonish	Normal
607	Astonish	Normal
607	Ember	Normal
608	Astonish	Normal
608	Ember	Normal
609	Hex	Normal
609	Fire Spin	Normal
609	Incinerate	Normal
610	Scratch	Normal
610	Iron Tail	Normal
611	Dragon Tail	Normal
611	Iron Tail	Normal
612	Dragon Tail	Normal
612	Counter	Normal
613	Powder Snow	Normal
613	Charm	Normal
613	Powder Snow	Winter_2020
613	Charm	Winter_2020
614	Powder Snow	Normal
614	Charm	Normal
614	Powder Snow	Winter_2020
614	Charm	Winter_2020
615	Ice Shard	Normal
615	Frost Breath	Normal
616	Acid	Normal
616	Infestation	Normal
617	Acid	Normal
617	Infestation	Normal
618	Mud Shot	Galarian
618	Metal Claw	Galarian
618	Thunder Shock	Normal
618	Mud Shot	Normal
619	Low Kick	Normal
619	Pound	Normal
620	Low Kick	Normal
620	Poison Jab	Normal
621	Dragon Tail	Normal
621	Bite	Normal
622	Astonish	Normal
622	Mud Slap	Normal
623	Astonish	Normal
623	Mud Slap	Normal
624	Scratch	Normal
624	Fury Cutter	Normal
625	Snarl	Normal
625	Metal Claw	Normal
626	Zen Headbutt	Normal
626	Mud Shot	Normal
627	Peck	Normal
627	Wing Attack	Normal
628	Air Slash	Hisuian
628	Zen Headbutt	Hisuian
628	Steel Wing	Normal
628	Air Slash	Normal
629	Feint Attack	Normal
629	Air Slash	Normal
630	Snarl	Normal
630	Air Slash	Normal
631	Lick	Normal
631	Fire Spin	Normal
632	Bug Bite	Normal
632	Metal Claw	Normal
633	Tackle	Normal
633	Dragon Breath	Normal
634	Bite	Normal
634	Dragon Breath	Normal
635	Bite	Normal
635	Dragon Breath	Normal
636	Ember	Normal
636	Bug Bite	Normal
637	Fire Spin	Normal
637	Bug Bite	Normal
638	Metal Claw	Normal
638	Zen Headbutt	Normal
638	Double Kick	Normal
639	Smack Down	Normal
639	Zen Headbutt	Normal
639	Double Kick	Normal
640	Quick Attack	Normal
640	Zen Headbutt	Normal
640	Double Kick	Normal
641	Bite	Incarnate
641	Air Slash	Incarnate
641	Astonish	Therian
641	Gust	Therian
642	Astonish	Incarnate
642	Thunder Shock	Incarnate
642	Bite	Therian
642	Volt Switch	Therian
643	Dragon Breath	Normal
643	Fire Fang	Normal
644	Dragon Breath	Normal
644	Charge Beam	Normal
645	Mud Shot	Incarnate
645	Rock Throw	Incarnate
645	Mud Shot	Therian
645	Extrasensory	Therian
646	Dragon Tail	Black
646	Shadow Claw	Black
646	Dragon Breath	Normal
646	Steel Wing	Normal
646	Dragon Breath	White
646	Steel Wing	White
647	Poison Jab	Ordinary
647	Low Kick	Ordinary
647	Poison Jab	Resolute
647	Low Kick	Resolute
648	Quick Attack	Aria
648	Confusion	Aria
648	Quick Attack	Pirouette
648	Low Kick	Pirouette
649	Metal Claw	Burn
649	Fury Cutter	Burn
649	Metal Claw	Chill
649	Fury Cutter	Chill
649	Metal Claw	Douse
649	Fury Cutter	Douse
649	Metal Claw	Normal
649	Fury Cutter	Normal
649	Metal Claw	Shock
649	Fury Cutter	Shock
650	Take Down	Normal
650	Vine Whip	Normal
651	Low Kick	Normal
651	Vine Whip	Normal
652	Low Kick	Normal
652	Vine Whip	Normal
652	Smack Down	Normal
653	Scratch	Normal
653	Ember	Normal
654	Scratch	Normal
654	Ember	Normal
655	Scratch	Normal
655	Fire Spin	Normal
655	Zen Headbutt	Normal
656	Pound	Normal
656	Bubble	Normal
657	Pound	Normal
657	Bubble	Normal
658	Feint Attack	Normal
658	Bubble	Normal
659	Mud Slap	Normal
659	Quick Attack	Normal
660	Mud Shot	Normal
660	Quick Attack	Normal
661	Peck	Normal
661	Quick Attack	Normal
662	Peck	Normal
662	Ember	Normal
662	Steel Wing	Normal
663	Peck	Normal
663	Fire Spin	Normal
663	Steel Wing	Normal
664	Bug Bite	Archipelago
664	Tackle	Archipelago
664	Bug Bite	Continental
664	Tackle	Continental
664	Bug Bite	Elegant
664	Tackle	Elegant
664	Bug Bite	Fancy
664	Tackle	Fancy
664	Bug Bite	Garden
664	Tackle	Garden
664	Bug Bite	High_plains
664	Tackle	High_plains
664	Bug Bite	Icy_snow
664	Tackle	Icy_snow
664	Bug Bite	Jungle
664	Tackle	Jungle
664	Bug Bite	Marine
664	Tackle	Marine
664	Bug Bite	Meadow
664	Tackle	Meadow
664	Bug Bite	Modern
664	Tackle	Modern
664	Bug Bite	Monsoon
664	Tackle	Monsoon
664	Bug Bite	Ocean
664	Tackle	Ocean
664	Bug Bite	Pokeball
664	Tackle	Pokeball
664	Bug Bite	Polar
664	Tackle	Polar
664	Bug Bite	River
664	Tackle	River
664	Bug Bite	Sandstorm
664	Tackle	Sandstorm
664	Bug Bite	Savanna
664	Tackle	Savanna
664	Bug Bite	Sun
664	Tackle	Sun
664	Bug Bite	Tundra
664	Tackle	Tundra
665	Struggle Bug	Archipelago
665	Struggle Bug	Continental
665	Struggle Bug	Elegant
665	Struggle Bug	Fancy
665	Struggle Bug	Garden
665	Struggle Bug	High_plains
665	Struggle Bug	Icy_snow
665	Struggle Bug	Jungle
665	Struggle Bug	Marine
665	Struggle Bug	Meadow
665	Struggle Bug	Modern
665	Struggle Bug	Monsoon
665	Struggle Bug	Ocean
665	Struggle Bug	Pokeball
665	Struggle Bug	Polar
665	Struggle Bug	River
665	Struggle Bug	Sandstorm
665	Struggle Bug	Savanna
665	Struggle Bug	Sun
665	Struggle Bug	Tundra
666	Gust	Archipelago
666	Struggle Bug	Archipelago
666	Gust	Continental
666	Struggle Bug	Continental
666	Gust	Elegant
666	Struggle Bug	Elegant
666	Gust	Fancy
666	Struggle Bug	Fancy
666	Gust	Garden
666	Struggle Bug	Garden
666	Gust	High_plains
666	Struggle Bug	High_plains
666	Gust	Icy_snow
666	Struggle Bug	Icy_snow
666	Gust	Jungle
666	Struggle Bug	Jungle
666	Gust	Marine
666	Struggle Bug	Marine
666	Gust	Meadow
666	Struggle Bug	Meadow
666	Gust	Modern
666	Struggle Bug	Modern
666	Gust	Monsoon
666	Struggle Bug	Monsoon
666	Gust	Ocean
666	Struggle Bug	Ocean
666	Gust	Pokeball
666	Struggle Bug	Pokeball
666	Gust	Polar
666	Struggle Bug	Polar
666	Gust	River
666	Struggle Bug	River
666	Gust	Sandstorm
666	Struggle Bug	Sandstorm
666	Gust	Savanna
666	Struggle Bug	Savanna
666	Gust	Sun
666	Struggle Bug	Sun
666	Gust	Tundra
666	Struggle Bug	Tundra
667	Fire Fang	Normal
667	Tackle	Normal
667	Ember	Normal
667	Incinerate	Normal
668	Fire Fang	Female
668	Take Down	Female
668	Ember	Female
668	Incinerate	Female
668	Fire Fang	Normal
668	Take Down	Normal
668	Ember	Normal
668	Incinerate	Normal
669	Vine Whip	Blue
669	Tackle	Blue
669	Vine Whip	Orange
669	Tackle	Orange
669	Vine Whip	Red
669	Tackle	Red
669	Vine Whip	White
669	Tackle	White
669	Vine Whip	Yellow
669	Tackle	Yellow
670	Vine Whip	Blue
670	Tackle	Blue
670	Vine Whip	Orange
670	Tackle	Orange
670	Vine Whip	Red
670	Tackle	Red
670	Vine Whip	White
670	Tackle	White
670	Vine Whip	Yellow
670	Tackle	Yellow
671	Vine Whip	Blue
671	Tackle	Blue
671	Razor Leaf	Blue
671	Fairy Wind	Blue
671	Vine Whip	Orange
671	Tackle	Orange
671	Razor Leaf	Orange
671	Fairy Wind	Orange
671	Vine Whip	Red
671	Tackle	Red
671	Razor Leaf	Red
671	Fairy Wind	Red
671	Vine Whip	White
671	Tackle	White
671	Razor Leaf	White
671	Fairy Wind	White
671	Vine Whip	Yellow
671	Tackle	Yellow
671	Razor Leaf	Yellow
671	Fairy Wind	Yellow
672	Zen Headbutt	Normal
672	Rock Smash	Normal
673	Zen Headbutt	Normal
673	Rock Smash	Normal
673	Vine Whip	Normal
674	Low Kick	Normal
674	Tackle	Normal
675	Low Kick	Normal
675	Snarl	Normal
675	Bullet Punch	Normal
676	Take Down	Dandy
676	Bite	Dandy
676	Sucker Punch	Dandy
676	Take Down	Debutante
676	Bite	Debutante
676	Sucker Punch	Debutante
676	Take Down	Diamond
676	Bite	Diamond
676	Sucker Punch	Diamond
676	Take Down	Heart
676	Bite	Heart
676	Sucker Punch	Heart
676	Take Down	Kabuki
676	Bite	Kabuki
676	Sucker Punch	Kabuki
676	Take Down	La_reine
676	Bite	La_reine
676	Sucker Punch	La_reine
676	Take Down	Matron
676	Bite	Matron
676	Sucker Punch	Matron
676	Take Down	Natural
676	Bite	Natural
676	Sucker Punch	Natural
676	Take Down	Pharaoh
676	Bite	Pharaoh
676	Sucker Punch	Pharaoh
676	Take Down	Star
676	Bite	Star
676	Sucker Punch	Star
677	Confusion	Normal
677	Scratch	Normal
678	Confusion	Female
678	Charm	Female
678	Confusion	Normal
678	Sucker Punch	Normal
679	Tackle	Normal
679	Fury Cutter	Normal
680	Psycho Cut	Normal
680	Fury Cutter	Normal
681	Psycho Cut	Normal
681	Fury Cutter	Normal
682	Charm	Normal
682	Charge Beam	Normal
683	Charm	Normal
683	Charge Beam	Normal
684	Tackle	Normal
685	Tackle	Normal
685	Charm	Normal
685	Fairy Wind	Normal
686	Peck	Normal
686	Tackle	Normal
687	Peck	Normal
687	Psycho Cut	Normal
688	Scratch	Normal
688	Mud Slap	Normal
689	Water Gun	Normal
689	Mud Slap	Normal
689	Fury Cutter	Normal
690	Water Gun	Normal
690	Acid	Normal
691	Water Gun	Normal
691	Acid	Normal
691	Dragon Tail	Normal
692	Water Gun	Normal
692	Smack Down	Normal
693	Water Gun	Normal
693	Smack Down	Normal
694	Quick Attack	Normal
694	Thunder Shock	Normal
695	Quick Attack	Normal
695	Volt Switch	Normal
695	Mud Slap	Normal
696	Dragon Tail	Normal
696	Tackle	Normal
697	Dragon Tail	Normal
697	Charm	Normal
697	Rock Throw	Normal
698	Powder Snow	Normal
698	Frost Breath	Normal
699	Powder Snow	Normal
699	Frost Breath	Normal
699	Rock Throw	Normal
700	Charm	Normal
700	Quick Attack	Normal
701	Wing Attack	Normal
701	Low Kick	Normal
701	Poison Jab	Normal
702	Tackle	Normal
702	Thunder Shock	Normal
703	Tackle	Normal
703	Rock Throw	Normal
704	Water Gun	Normal
704	Tackle	Normal
705	Water Gun	Normal
705	Tackle	Normal
706	Water Gun	Normal
706	Dragon Breath	Normal
707	Astonish	Normal
707	Tackle	Normal
708	Astonish	Normal
708	Tackle	Normal
709	Shadow Claw	Normal
709	Sucker Punch	Normal
710	Astonish	Average
710	Razor Leaf	Average
710	Astonish	Large
710	Razor Leaf	Large
710	Astonish	Small
710	Razor Leaf	Small
710	Astonish	Super
710	Razor Leaf	Super
711	Hex	Average
711	Razor Leaf	Average
711	Hex	Large
711	Razor Leaf	Large
711	Hex	Small
711	Razor Leaf	Small
711	Hex	Super
711	Razor Leaf	Super
712	Bite	Normal
712	Tackle	Normal
713	Bite	Hisuian
713	Tackle	Hisuian
713	Powder Snow	Hisuian
713	Bite	Normal
713	Ice Fang	Normal
714	Wing Attack	Normal
714	Bite	Normal
715	Air Slash	Normal
715	Bite	Normal
716	Tackle	Normal
716	Zen Headbutt	Normal
717	Sucker Punch	Normal
717	Snarl	Normal
717	Gust	Normal
718	Dragon Tail	Normal
718	Bite	Normal
718	Zen Headbutt	Normal
719	Tackle	Normal
719	Rock Throw	Normal
720	Confusion	Confined
720	Astonish	Confined
720	Confusion	Unbound
720	Astonish	Unbound
721	Incinerate	Normal
721	Water Gun	Normal
721	Take Down	Normal
722	Tackle	Normal
722	Razor Leaf	Normal
723	Peck	Normal
723	Razor Leaf	Normal
724	Astonish	Normal
724	Razor Leaf	Normal
725	Scratch	Normal
725	Ember	Normal
726	Bite	Normal
726	Ember	Normal
727	Snarl	Normal
727	Fire Fang	Normal
727	Double Kick	Normal
728	Pound	Normal
728	Water Gun	Normal
729	Charm	Normal
729	Water Gun	Normal
730	Charm	Normal
730	Waterfall	Normal
731	Peck	Normal
731	Rock Smash	Normal
732	Peck	Normal
732	Rock Smash	Normal
733	Peck	Normal
733	Rock Smash	Normal
733	Bullet Seed	Normal
734	Tackle	Normal
734	Bite	Normal
735	Take Down	Normal
735	Bite	Normal
736	Bug Bite	Normal
736	Spark	Normal
737	Bug Bite	Normal
737	Spark	Normal
738	Bug Bite	Normal
738	Spark	Normal
738	Mud Slap	Normal
739	Rock Smash	Normal
739	Bubble	Normal
740	Rock Smash	Normal
740	Bubble	Normal
741	Pound	Baile
741	Air Slash	Baile
741	Pound	Pau
741	Air Slash	Pau
741	Pound	Pompom
741	Air Slash	Pompom
741	Pound	Sensu
741	Air Slash	Sensu
742	Fairy Wind	Normal
742	Struggle Bug	Normal
743	Fairy Wind	Normal
743	Struggle Bug	Normal
744	Tackle	Normal
744	Rock Throw	Normal
745	Sucker Punch	Dusk
745	Counter	Dusk
745	Rock Throw	Dusk
745	Sucker Punch	Midday
745	Rock Throw	Midday
745	Counter	Midnight
745	Rock Throw	Midnight
746	Water Gun	School
746	Waterfall	School
746	Iron Tail	School
746	Water Gun	Solo
746	Waterfall	Solo
746	Iron Tail	Solo
747	Poison Sting	Normal
747	Bite	Normal
748	Poison Jab	Normal
748	Bite	Normal
749	Mud Slap	Normal
749	Rock Smash	Normal
750	Mud Slap	Normal
750	Rock Smash	Normal
751	Infestation	Normal
751	Bug Bite	Normal
752	Infestation	Normal
752	Bug Bite	Normal
753	Razor Leaf	Normal
753	Fury Cutter	Normal
754	Razor Leaf	Normal
754	Fury Cutter	Normal
755	Astonish	Normal
756	Astonish	Normal
757	Ember	Normal
757	Poison Jab	Normal
758	Incinerate	Normal
758	Poison Jab	Normal
759	Tackle	Normal
759	Take Down	Normal
760	Tackle	Normal
760	Low Kick	Normal
760	Shadow Claw	Normal
761	Razor Leaf	Normal
761	Charm	Normal
762	Razor Leaf	Normal
762	Charm	Normal
763	Razor Leaf	Normal
763	Charm	Normal
763	Magical Leaf	Normal
764	Vine Whip	Normal
764	Hidden Power	Normal
765	Confusion	Normal
765	Zen Headbutt	Normal
765	Yawn	Normal
766	Counter	Normal
766	Rock Smash	Normal
766	Take Down	Normal
767	Struggle Bug	Normal
768	Fury Cutter	Normal
768	Metal Claw	Normal
768	Waterfall	Normal
768	Shadow Claw	Normal
769	Astonish	Normal
769	Mud Shot	Normal
770	Astonish	Normal
770	Mud Shot	Normal
771	Counter	Normal
772	Tackle	Normal
772	Take Down	Normal
773	Tackle	Bug
773	Take Down	Bug
773	Bite	Bug
773	Tackle	Dark
773	Take Down	Dark
773	Bite	Dark
773	Tackle	Dragon
773	Take Down	Dragon
773	Bite	Dragon
773	Tackle	Electric
773	Take Down	Electric
773	Bite	Electric
773	Tackle	Fairy
773	Take Down	Fairy
773	Bite	Fairy
773	Tackle	Fighting
773	Take Down	Fighting
773	Bite	Fighting
773	Tackle	Fire
773	Take Down	Fire
773	Bite	Fire
773	Tackle	Flying
773	Take Down	Flying
773	Bite	Flying
773	Tackle	Ghost
773	Take Down	Ghost
773	Bite	Ghost
773	Tackle	Grass
773	Take Down	Grass
773	Bite	Grass
773	Tackle	Ground
773	Take Down	Ground
773	Bite	Ground
773	Tackle	Ice
773	Take Down	Ice
773	Bite	Ice
773	Tackle	Normal
773	Take Down	Normal
773	Bite	Normal
773	Tackle	Poison
773	Take Down	Poison
773	Bite	Poison
773	Tackle	Psychic
773	Take Down	Psychic
773	Bite	Psychic
773	Tackle	Rock
773	Take Down	Rock
773	Bite	Rock
773	Tackle	Steel
773	Take Down	Steel
773	Bite	Steel
773	Tackle	Water
773	Take Down	Water
773	Bite	Water
774	Rollout	Blue
774	Take Down	Blue
774	Rollout	Green
774	Take Down	Green
774	Rollout	Indigo
774	Take Down	Indigo
774	Rollout	Orange
774	Take Down	Orange
774	Rollout	Red
774	Take Down	Red
774	Rollout	Violet
774	Take Down	Violet
774	Rollout	Yellow
774	Take Down	Yellow
775	Rollout	Normal
775	Yawn	Normal
776	Ember	Normal
776	Fire Spin	Normal
777	Thunder Shock	Normal
777	Spark	Normal
778	Shadow Claw	Busted
778	Charm	Busted
778	Shadow Claw	Disguised
778	Charm	Disguised
779	Water Gun	Normal
779	Confusion	Normal
779	Bite	Normal
780	Dragon Breath	Normal
780	Extrasensory	Normal
781	Astonish	Normal
781	Shadow Claw	Normal
782	Tackle	Normal
782	Dragon Tail	Normal
783	Tackle	Normal
783	Dragon Tail	Normal
784	Poison Jab	Normal
784	Dragon Tail	Normal
785	Volt Switch	Normal
785	Quick Attack	Normal
786	Confusion	Normal
786	Astonish	Normal
787	Bullet Seed	Normal
787	Rock Smash	Normal
788	Water Gun	Normal
788	Hidden Power	Normal
789	Splash	Normal
790	Splash	Normal
791	Zen Headbutt	Normal
791	Fire Spin	Normal
792	Confusion	Normal
792	Air Slash	Normal
793	Acid	Normal
793	Pound	Normal
793	Poison Jab	Normal
794	Counter	Normal
794	Poison Jab	Normal
795	Bug Bite	Normal
795	Low Kick	Normal
796	Thunder Shock	Normal
796	Spark	Normal
797	Air Slash	Normal
797	Smack Down	Normal
798	Air Slash	Normal
798	Razor Leaf	Normal
799	Snarl	Normal
799	Dragon Tail	Normal
800	Struggle	Dawn_wings
800	Struggle	Dusk_mane
800	Struggle	Normal
800	Struggle	Ultra
801	Struggle	Normal
801	Struggle	Original_color
802	Struggle	Normal
803	Struggle	Normal
804	Struggle	Normal
805	Struggle	Normal
806	Struggle	Normal
807	Struggle	Normal
808	Thunder Shock	Normal
809	Thunder Shock	Normal
810	Scratch	Normal
810	Razor Leaf	Normal
811	Scratch	Normal
811	Razor Leaf	Normal
812	Scratch	Normal
812	Razor Leaf	Normal
813	Tackle	Normal
813	Ember	Normal
814	Tackle	Normal
814	Ember	Normal
815	Tackle	Normal
815	Ember	Normal
816	Pound	Normal
816	Water Gun	Normal
817	Pound	Normal
817	Water Gun	Normal
818	Pound	Normal
818	Water Gun	Normal
819	Tackle	Normal
819	Bite	Normal
819	Bullet Seed	Normal
820	Tackle	Normal
820	Bite	Normal
820	Bullet Seed	Normal
821	Peck	Normal
821	Air Slash	Normal
822	Peck	Normal
822	Air Slash	Normal
823	Steel Wing	Normal
823	Air Slash	Normal
824	Struggle Bug	Normal
825	Struggle Bug	Normal
825	Confusion	Normal
826	Struggle Bug	Normal
826	Confusion	Normal
827	Quick Attack	Normal
827	Snarl	Normal
828	Quick Attack	Normal
828	Snarl	Normal
829	Razor Leaf	Normal
829	Bullet Seed	Normal
830	Razor Leaf	Normal
830	Bullet Seed	Normal
831	Tackle	Normal
831	Take Down	Normal
832	Tackle	Normal
832	Take Down	Normal
832	Double Kick	Normal
833	Water Gun	Normal
833	Bite	Normal
834	Waterfall	Normal
834	Bite	Normal
835	Spark	Normal
835	Bite	Normal
836	Spark	Normal
836	Bite	Normal
837	Smack Down	Normal
837	Tackle	Normal
838	Smack Down	Normal
838	Incinerate	Normal
839	Smack Down	Normal
839	Incinerate	Normal
840	Astonish	Normal
841	Bullet Seed	Normal
841	Dragon Breath	Normal
842	Bullet Seed	Normal
842	Astonish	Normal
843	Mud Slap	Normal
843	Mud Shot	Normal
844	Mud Slap	Normal
844	Mud Shot	Normal
845	Peck	Normal
845	Water Gun	Normal
846	Waterfall	Normal
846	Bite	Normal
846	Peck	Normal
847	Waterfall	Normal
847	Bite	Normal
847	Peck	Normal
848	Acid	Normal
849	Acid	Amped
849	Spark	Amped
849	Poison Jab	Amped
849	Acid	Low_key
849	Spark	Low_key
849	Poison Jab	Low_key
850	Bug Bite	Normal
850	Ember	Normal
851	Bug Bite	Normal
851	Ember	Normal
852	Rock Smash	Normal
853	Rock Smash	Normal
853	Waterfall	Normal
854	Astonish	Antique
854	Sucker Punch	Antique
854	Astonish	Phony
854	Sucker Punch	Phony
855	Astonish	Antique
855	Sucker Punch	Antique
855	Hex	Antique
855	Astonish	Phony
855	Sucker Punch	Phony
855	Hex	Phony
856	Confusion	Normal
856	Charm	Normal
857	Confusion	Normal
857	Charm	Normal
858	Confusion	Normal
858	Charm	Normal
858	Psycho Cut	Normal
859	Bite	Normal
859	Sucker Punch	Normal
860	Bite	Normal
860	Sucker Punch	Normal
861	Bite	Normal
861	Sucker Punch	Normal
861	Low Kick	Normal
862	Counter	Galarian
862	Lick	Galarian
863	Metal Claw	Galarian
863	Shadow Claw	Galarian
864	Astonish	Normal
864	Hex	Normal
865	Counter	Galarian
865	Fury Cutter	Galarian
866	Confusion	Galarian
866	Zen Headbutt	Galarian
866	Ice Shard	Galarian
867	Astonish	Galarian
867	Shadow Claw	Galarian
868	Tackle	Normal
868	Charm	Normal
869	Tackle	Normal
869	Charm	Normal
870	Rock Smash	Normal
870	Counter	Normal
871	Thunder Shock	Normal
871	Water Gun	Normal
871	Poison Jab	Normal
872	Powder Snow	Normal
872	Struggle Bug	Normal
873	Powder Snow	Normal
873	Bug Bite	Normal
874	Rock Throw	Normal
875	Powder Snow	Ice
875	Powder Snow	Noice
876	Extrasensory	Female
876	Extrasensory	Male
877	Thunder Shock	Full_belly
877	Bite	Full_belly
877	Thunder Shock	Hangry
877	Bite	Hangry
878	Tackle	Normal
878	Rock Smash	Normal
879	Tackle	Normal
879	Rock Smash	Normal
880	Dragon Tail	Normal
880	Thunder Shock	Normal
881	Powder Snow	Normal
881	Thunder Shock	Normal
882	Dragon Breath	Normal
882	Water Gun	Normal
883	Powder Snow	Normal
883	Water Gun	Normal
884	Dragon Tail	Normal
884	Metal Claw	Normal
885	Astonish	Normal
885	Quick Attack	Normal
886	Astonish	Normal
886	Dragon Tail	Normal
887	Hex	Normal
887	Dragon Tail	Normal
888	Metal Claw	Crowned_sword
888	Snarl	Crowned_sword
888	Quick Attack	Crowned_sword
888	Fire Fang	Crowned_sword
888	Metal Claw	Hero
888	Snarl	Hero
888	Quick Attack	Hero
888	Fire Fang	Hero
889	Metal Claw	Crowned_shield
889	Snarl	Crowned_shield
889	Quick Attack	Crowned_shield
889	Ice Fang	Crowned_shield
889	Metal Claw	Hero
889	Snarl	Hero
889	Quick Attack	Hero
889	Ice Fang	Hero
890	Dragon Tail	Eternamax
890	Poison Jab	Eternamax
890	Dragon Tail	Normal
890	Poison Jab	Normal
891	Rock Smash	Normal
891	Counter	Normal
892	Rock Smash	Rapid_strike
892	Counter	Rapid_strike
892	Waterfall	Rapid_strike
892	Rock Smash	Single_strike
892	Counter	Single_strike
892	Sucker Punch	Single_strike
893	Vine Whip	Normal
893	Bite	Normal
894	Thunder Shock	Normal
894	Lock On	Normal
895	Bite	Normal
896	Tackle	Normal
896	Take Down	Normal
897	Tackle	Normal
897	Take Down	Normal
898	Confusion	Ice_rider
898	Take Down	Ice_rider
898	Pound	Normal
898	Confusion	Normal
898	Confusion	Shadow_rider
898	Take Down	Shadow_rider
901	Tackle	Normal
901	Rock Smash	Normal
903	Rock Smash	Normal
903	Poison Jab	Normal
903	Shadow Claw	Normal
904	Poison Sting	Normal
904	Poison Jab	Normal
\.


--
-- TOC entry 3406 (class 0 OID 19780)
-- Dependencies: 216
-- Data for Name: pokemon_stats; Type: TABLE DATA; Schema: public; Owner: zitrojj
--

COPY public.pokemon_stats (pokemon_id, base_stamina, base_attack, base_defense, name, form) FROM stdin;
1	128	118	111	Bulbasaur	Fall_2019
1	128	118	111	Bulbasaur	Normal
2	155	151	143	Ivysaur	Normal
3	190	198	189	Venusaur	Copy_2019
3	190	198	189	Venusaur	Normal
4	118	116	93	Charmander	Fall_2019
4	118	116	93	Charmander	Normal
5	151	158	126	Charmeleon	Normal
6	186	223	173	Charizard	Copy_2019
6	186	223	173	Charizard	Normal
7	127	94	121	Squirtle	Fall_2019
7	127	94	121	Squirtle	Normal
8	153	126	155	Wartortle	Normal
9	188	171	207	Blastoise	Copy_2019
9	188	171	207	Blastoise	Normal
10	128	55	55	Caterpie	Normal
11	137	45	80	Metapod	Normal
12	155	167	137	Butterfree	Normal
13	120	63	50	Weedle	Normal
14	128	46	75	Kakuna	Normal
15	163	169	130	Beedrill	Normal
16	120	85	73	Pidgey	Normal
17	160	117	105	Pidgeotto	Normal
18	195	166	154	Pidgeot	Normal
19	102	103	70	Rattata	Alola
19	102	103	70	Rattata	Normal
20	181	135	154	Raticate	Alola
20	146	161	139	Raticate	Normal
21	120	112	60	Spearow	Normal
22	163	182	133	Fearow	Normal
23	111	110	97	Ekans	Normal
24	155	167	153	Arbok	Normal
25	111	112	96	Pikachu	Adventure_hat_2020
25	111	112	96	Pikachu	Copy_2019
25	111	112	96	Pikachu	Costume_2020
25	111	112	96	Pikachu	Fall_2019
25	111	112	96	Pikachu	Flying_01
25	111	112	96	Pikachu	Flying_02
25	111	112	96	Pikachu	Flying_5th_anniv
25	111	112	96	Pikachu	Flying_okinawa
25	111	112	96	Pikachu	Gofest_2022
25	111	112	96	Pikachu	Kariyushi
25	111	112	96	Pikachu	Normal
25	111	112	96	Pikachu	Pop_star
25	111	112	96	Pikachu	Rock_star
25	111	112	96	Pikachu	Tshirt_01
25	111	112	96	Pikachu	Tshirt_02
25	111	112	96	Pikachu	Vs_2019
25	111	112	96	Pikachu	Wcs_2022
25	111	112	96	Pikachu	Winter_2020
26	155	201	154	Raichu	Alola
26	155	193	151	Raichu	Normal
27	137	125	129	Sandshrew	Alola
27	137	126	120	Sandshrew	Normal
28	181	177	195	Sandslash	Alola
28	181	182	175	Sandslash	Normal
29	146	86	89	Nidoran♀	Normal
30	172	117	120	Nidorina	Normal
31	207	180	173	Nidoqueen	Normal
32	130	105	76	Nidoran♂	Normal
33	156	137	111	Nidorino	Normal
34	191	204	156	Nidoking	Normal
35	172	107	108	Clefairy	Normal
36	216	178	162	Clefable	Normal
37	116	96	109	Vulpix	Alola
37	116	96	109	Vulpix	Normal
38	177	170	193	Ninetales	Alola
38	177	169	190	Ninetales	Normal
39	251	80	41	Jigglypuff	Normal
40	295	156	90	Wigglytuff	Normal
41	120	83	73	Zubat	Normal
42	181	161	150	Golbat	Normal
43	128	131	112	Oddish	Normal
44	155	153	136	Gloom	Normal
45	181	202	167	Vileplume	Normal
46	111	121	99	Paras	Normal
47	155	165	146	Parasect	Normal
48	155	100	100	Venonat	Normal
49	172	179	143	Venomoth	Normal
50	67	108	81	Diglett	Alola
50	67	109	78	Diglett	Normal
51	111	201	142	Dugtrio	Alola
51	111	167	136	Dugtrio	Normal
52	120	99	78	Meowth	Alola
52	137	115	92	Meowth	Galarian
52	120	92	78	Meowth	Normal
53	163	158	136	Persian	Alola
53	163	150	136	Persian	Normal
54	137	122	95	Psyduck	Normal
55	190	191	162	Golduck	Normal
56	120	148	82	Mankey	Normal
57	163	207	138	Primeape	Normal
58	155	142	92	Growlithe	Hisuian
58	146	136	93	Growlithe	Normal
59	216	232	165	Arcanine	Hisuian
59	207	227	166	Arcanine	Normal
60	120	101	82	Poliwag	Normal
61	163	130	123	Poliwhirl	Normal
62	207	182	184	Poliwrath	Normal
63	93	195	82	Abra	Normal
64	120	232	117	Kadabra	Normal
65	146	271	167	Alakazam	Normal
66	172	137	82	Machop	Normal
67	190	177	125	Machoke	Normal
68	207	234	159	Machamp	Normal
69	137	139	61	Bellsprout	Normal
70	163	172	92	Weepinbell	Normal
71	190	207	135	Victreebel	Normal
72	120	97	149	Tentacool	Normal
73	190	166	209	Tentacruel	Normal
74	120	132	132	Geodude	Alola
74	120	132	132	Geodude	Normal
75	146	164	164	Graveler	Alola
75	146	164	164	Graveler	Normal
76	190	211	198	Golem	Alola
76	190	211	198	Golem	Normal
77	137	170	127	Ponyta	Galarian
77	137	170	127	Ponyta	Normal
78	163	207	162	Rapidash	Galarian
78	163	207	162	Rapidash	Normal
79	207	109	98	Slowpoke	2020
79	207	109	98	Slowpoke	Galarian
79	207	109	98	Slowpoke	Normal
80	216	177	180	Slowbro	2021
80	216	182	156	Slowbro	Galarian
80	216	177	180	Slowbro	Normal
81	93	165	121	Magnemite	Normal
82	137	223	169	Magneton	Normal
83	141	174	114	Farfetch’d	Galarian
83	141	124	115	Farfetch’d	Normal
84	111	158	83	Doduo	Normal
85	155	218	140	Dodrio	Normal
86	163	85	121	Seel	Normal
87	207	139	177	Dewgong	Normal
88	190	135	90	Grimer	Alola
88	190	135	90	Grimer	Normal
89	233	190	172	Muk	Alola
89	233	190	172	Muk	Normal
90	102	116	134	Shellder	Normal
91	137	186	256	Cloyster	Normal
92	102	186	67	Gastly	Normal
93	128	223	107	Haunter	Normal
94	155	261	149	Gengar	Costume_2020
94	155	261	149	Gengar	Normal
95	111	85	232	Onix	Normal
96	155	89	136	Drowzee	Normal
97	198	144	193	Hypno	Normal
98	102	181	124	Krabby	Normal
99	146	240	181	Kingler	Normal
100	120	109	111	Voltorb	Hisuian
100	120	109	111	Voltorb	Normal
101	155	176	176	Electrode	Hisuian
101	155	173	173	Electrode	Normal
102	155	107	125	Exeggcute	Normal
103	216	230	153	Exeggutor	Alola
103	216	233	149	Exeggutor	Normal
104	137	90	144	Cubone	Normal
105	155	144	186	Marowak	Alola
105	155	144	186	Marowak	Normal
106	137	224	181	Hitmonlee	Normal
107	137	193	197	Hitmonchan	Normal
108	207	108	137	Lickitung	Normal
109	120	119	141	Koffing	Normal
110	163	174	197	Weezing	Galarian
110	163	174	197	Weezing	Normal
111	190	140	127	Rhyhorn	Normal
112	233	222	171	Rhydon	Normal
113	487	60	128	Chansey	Normal
114	163	183	169	Tangela	Normal
115	233	181	165	Kangaskhan	Normal
116	102	129	103	Horsea	Normal
117	146	187	156	Seadra	Normal
118	128	123	110	Goldeen	Normal
119	190	175	147	Seaking	Normal
120	102	137	112	Staryu	Normal
121	155	210	184	Starmie	Normal
122	137	183	169	Mr. Mime	Galarian
122	120	192	205	Mr. Mime	Normal
123	172	218	170	Scyther	Normal
124	163	223	151	Jynx	Normal
125	163	198	158	Electabuzz	Normal
126	163	206	154	Magmar	Normal
127	163	238	182	Pinsir	Normal
128	181	198	183	Tauros	Normal
129	85	29	85	Magikarp	Normal
130	216	237	186	Gyarados	Normal
131	277	165	174	Lapras	Costume_2020
131	277	165	174	Lapras	Normal
132	134	91	91	Ditto	Normal
133	146	104	114	Eevee	Normal
134	277	205	161	Vaporeon	Normal
135	163	232	182	Jolteon	Normal
136	163	246	179	Flareon	Normal
137	163	153	136	Porygon	Normal
138	111	155	153	Omanyte	Normal
139	172	207	201	Omastar	Normal
140	102	148	140	Kabuto	Normal
141	155	220	186	Kabutops	Normal
142	190	221	159	Aerodactyl	Normal
143	330	190	169	Snorlax	Normal
144	207	250	197	Articuno	Galarian
144	207	192	236	Articuno	Normal
145	207	252	189	Zapdos	Galarian
145	207	253	185	Zapdos	Normal
146	207	202	231	Moltres	Galarian
146	207	251	181	Moltres	Normal
147	121	119	91	Dratini	Normal
148	156	163	135	Dragonair	Normal
149	209	263	198	Dragonite	Normal
150	214	182	278	Mewtwo	A
150	214	300	182	Mewtwo	Normal
151	225	210	210	Mew	Normal
152	128	92	122	Chikorita	Normal
153	155	122	155	Bayleef	Normal
154	190	168	202	Meganium	Normal
155	118	116	93	Cyndaquil	Normal
156	151	158	126	Quilava	Normal
157	186	223	173	Typhlosion	Normal
158	137	117	109	Totodile	Normal
159	163	150	142	Croconaw	Normal
160	198	205	188	Feraligatr	Normal
161	111	79	73	Sentret	Normal
162	198	148	125	Furret	Normal
163	155	67	88	Hoothoot	Normal
164	225	145	156	Noctowl	Normal
165	120	72	118	Ledyba	Normal
166	146	107	179	Ledian	Normal
167	120	105	73	Spinarak	Normal
168	172	161	124	Ariados	Normal
169	198	194	178	Crobat	Normal
170	181	106	97	Chinchou	Normal
171	268	146	137	Lanturn	Normal
172	85	77	53	Pichu	Normal
173	137	75	79	Cleffa	Normal
174	207	69	32	Igglybuff	Normal
175	111	67	116	Togepi	Normal
176	146	139	181	Togetic	Normal
177	120	134	89	Natu	Normal
178	163	192	146	Xatu	Normal
179	146	114	79	Mareep	Normal
180	172	145	109	Flaaffy	Normal
181	207	211	169	Ampharos	Normal
182	181	169	186	Bellossom	Normal
183	172	37	93	Marill	Normal
184	225	112	152	Azumarill	Normal
185	172	167	176	Sudowoodo	Normal
186	207	174	179	Politoed	Normal
187	111	67	94	Hoppip	Normal
188	146	91	120	Skiploom	Normal
189	181	118	183	Jumpluff	Normal
190	146	136	112	Aipom	Normal
191	102	55	55	Sunkern	Normal
192	181	185	135	Sunflora	Normal
193	163	154	94	Yanma	Normal
194	146	75	66	Wooper	Normal
195	216	152	143	Quagsire	Normal
196	163	261	175	Espeon	Normal
197	216	126	240	Umbreon	Normal
198	155	175	87	Murkrow	Normal
199	216	177	180	Slowking	2022
199	216	190	180	Slowking	Galarian
199	216	177	180	Slowking	Normal
200	155	167	154	Misdreavus	Normal
201	134	136	91	Unown	Normal
202	382	60	106	Wobbuffet	Normal
203	172	182	133	Girafarig	Normal
204	137	108	122	Pineco	Normal
205	181	161	205	Forretress	Normal
206	225	131	128	Dunsparce	Normal
207	163	143	184	Gligar	Normal
208	181	148	272	Steelix	Normal
209	155	137	85	Snubbull	Normal
210	207	212	131	Granbull	Normal
211	163	184	151	Qwilfish	Hisuian
211	163	184	138	Qwilfish	Normal
212	172	236	181	Scizor	Normal
213	85	17	396	Shuckle	Normal
214	190	234	179	Heracross	Normal
215	146	189	146	Sneasel	Hisuian
215	146	189	146	Sneasel	Normal
216	155	142	93	Teddiursa	Normal
217	207	236	144	Ursaring	Normal
218	120	118	71	Slugma	Normal
219	137	139	191	Magcargo	Normal
220	137	90	69	Swinub	Normal
221	225	181	138	Piloswine	Normal
222	146	118	156	Corsola	Normal
223	111	127	69	Remoraid	Normal
224	181	197	141	Octillery	Normal
225	128	128	90	Delibird	Normal
225	128	128	90	Delibird	Winter_2020
226	163	148	226	Mantine	Normal
227	163	148	226	Skarmory	Normal
228	128	152	83	Houndour	Normal
229	181	224	144	Houndoom	Normal
230	181	194	194	Kingdra	Normal
231	207	107	98	Phanpy	Normal
232	207	214	185	Donphan	Normal
233	198	198	180	Porygon2	Normal
234	177	192	131	Stantler	Normal
235	146	40	83	Smeargle	Normal
236	111	64	64	Tyrogue	Normal
237	137	173	207	Hitmontop	Normal
238	128	153	91	Smoochum	Normal
239	128	135	101	Elekid	Normal
240	128	151	99	Magby	Normal
241	216	157	193	Miltank	Normal
242	496	129	169	Blissey	Normal
243	207	241	195	Raikou	Normal
243	207	241	195	Raikou	S
244	251	235	171	Entei	Normal
244	251	235	171	Entei	S
245	225	180	235	Suicune	Normal
245	225	180	235	Suicune	S
246	137	115	93	Larvitar	Normal
247	172	155	133	Pupitar	Normal
248	225	251	207	Tyranitar	Normal
249	235	193	310	Lugia	Normal
249	235	193	310	Lugia	S
250	214	239	244	Ho-Oh	Normal
250	214	239	244	Ho-Oh	S
251	225	210	210	Celebi	Normal
252	120	124	94	Treecko	Normal
253	137	172	120	Grovyle	Normal
254	172	223	169	Sceptile	Normal
255	128	130	87	Torchic	Normal
256	155	163	115	Combusken	Normal
257	190	240	141	Blaziken	Normal
258	137	126	93	Mudkip	Normal
259	172	156	133	Marshtomp	Normal
260	225	208	175	Swampert	Normal
261	111	96	61	Poochyena	Normal
262	172	171	132	Mightyena	Normal
263	116	58	80	Zigzagoon	Galarian
263	116	58	80	Zigzagoon	Normal
264	186	142	128	Linoone	Galarian
264	186	142	128	Linoone	Normal
265	128	75	59	Wurmple	Normal
266	137	60	77	Silcoon	Normal
267	155	189	98	Beautifly	Normal
268	137	60	77	Cascoon	Normal
269	155	98	162	Dustox	Normal
270	120	71	77	Lotad	Normal
271	155	112	119	Lombre	Normal
272	190	173	176	Ludicolo	Normal
273	120	71	77	Seedot	Normal
274	172	134	78	Nuzleaf	Normal
275	207	200	121	Shiftry	Normal
276	120	106	61	Taillow	Normal
277	155	185	124	Swellow	Normal
278	120	106	61	Wingull	Normal
279	155	175	174	Pelipper	Normal
280	99	79	59	Ralts	Normal
281	116	117	90	Kirlia	Normal
282	169	237	195	Gardevoir	Normal
283	120	93	87	Surskit	Normal
284	172	192	150	Masquerain	Normal
285	155	74	110	Shroomish	Normal
286	155	241	144	Breloom	Normal
287	155	104	92	Slakoth	Normal
288	190	159	145	Vigoroth	Normal
289	284	290	166	Slaking	Normal
290	104	80	126	Nincada	Normal
291	156	199	112	Ninjask	Normal
292	1	153	73	Shedinja	Normal
293	162	92	42	Whismur	Normal
294	197	134	81	Loudred	Normal
295	232	179	137	Exploud	Normal
296	176	99	54	Makuhita	Normal
297	302	209	114	Hariyama	Normal
298	137	36	71	Azurill	Normal
299	102	82	215	Nosepass	Normal
300	137	84	79	Skitty	Normal
301	172	132	127	Delcatty	Normal
302	137	141	136	Sableye	Costume_2020
302	137	141	136	Sableye	Normal
303	137	155	141	Mawile	Normal
304	137	121	141	Aron	Normal
305	155	158	198	Lairon	Normal
306	172	198	257	Aggron	Normal
307	102	78	107	Meditite	Normal
308	155	121	152	Medicham	Normal
309	120	123	78	Electrike	Normal
310	172	215	127	Manectric	Normal
311	155	167	129	Plusle	Normal
312	155	147	150	Minun	Normal
313	163	143	166	Volbeat	Normal
314	163	143	166	Illumise	Normal
315	137	186	131	Roselia	Normal
316	172	80	99	Gulpin	Normal
317	225	140	159	Swalot	Normal
318	128	171	39	Carvanha	Normal
319	172	243	83	Sharpedo	Normal
320	277	136	68	Wailmer	Normal
321	347	175	87	Wailord	Normal
322	155	119	79	Numel	Normal
323	172	194	136	Camerupt	Normal
324	172	151	203	Torkoal	Normal
325	155	125	122	Spoink	Normal
326	190	171	188	Grumpig	Normal
327	155	116	116	Spinda	Normal
328	128	162	78	Trapinch	Normal
329	137	134	99	Vibrava	Normal
330	190	205	168	Flygon	Normal
331	137	156	74	Cacnea	Normal
332	172	221	115	Cacturne	Normal
333	128	76	132	Swablu	Normal
334	181	141	201	Altaria	Normal
335	177	222	124	Zangoose	Normal
336	177	196	118	Seviper	Normal
337	207	178	153	Lunatone	Normal
338	207	178	153	Solrock	Normal
339	137	93	82	Barboach	Normal
340	242	151	141	Whiscash	Normal
341	125	141	99	Corphish	Normal
342	160	224	142	Crawdaunt	Normal
343	120	77	124	Baltoy	Normal
344	155	140	229	Claydol	Normal
345	165	105	150	Lileep	Normal
346	200	152	194	Cradily	Normal
347	128	176	100	Anorith	Normal
348	181	222	174	Armaldo	Normal
349	85	29	85	Feebas	Normal
350	216	192	219	Milotic	Normal
351	172	139	139	Castform	Normal
351	172	139	139	Castform	Rainy
351	172	139	139	Castform	Snowy
351	172	139	139	Castform	Sunny
352	155	161	189	Kecleon	Normal
353	127	138	65	Shuppet	Normal
354	162	218	126	Banette	Normal
355	85	70	162	Duskull	Normal
356	120	124	234	Dusclops	Normal
357	223	136	163	Tropius	Normal
358	181	175	170	Chimecho	Normal
359	163	246	120	Absol	Normal
360	216	41	86	Wynaut	Normal
361	137	95	95	Snorunt	Normal
362	190	162	162	Glalie	Normal
363	172	95	90	Spheal	Normal
364	207	137	132	Sealeo	Normal
365	242	182	176	Walrein	Normal
366	111	133	135	Clamperl	Normal
367	146	197	179	Huntail	Normal
368	146	211	179	Gorebyss	Normal
369	225	162	203	Relicanth	Normal
370	125	81	128	Luvdisc	Normal
371	128	134	93	Bagon	Normal
372	163	172	155	Shelgon	Normal
373	216	277	168	Salamence	Normal
374	120	96	132	Beldum	Normal
375	155	138	176	Metang	Normal
376	190	257	228	Metagross	Normal
377	190	179	309	Regirock	Normal
378	190	179	309	Regice	Normal
379	190	143	285	Registeel	Normal
380	190	228	246	Latias	Normal
380	190	228	246	Latias	S
381	190	268	212	Latios	Normal
381	190	268	212	Latios	S
382	205	270	228	Kyogre	Normal
383	205	270	228	Groudon	Normal
384	213	284	170	Rayquaza	Normal
385	225	210	210	Jirachi	Normal
386	137	414	46	Deoxys	Attack
386	137	144	330	Deoxys	Defense
386	137	345	115	Deoxys	Normal
386	137	230	218	Deoxys	Speed
387	146	119	110	Turtwig	Normal
388	181	157	143	Grotle	Normal
389	216	202	188	Torterra	Normal
390	127	113	86	Chimchar	Normal
391	162	158	105	Monferno	Normal
392	183	222	151	Infernape	Normal
393	142	112	102	Piplup	Normal
394	162	150	139	Prinplup	Normal
395	197	210	186	Empoleon	Normal
396	120	101	58	Starly	Normal
397	146	142	94	Staravia	Normal
398	198	234	140	Staraptor	Normal
399	153	80	73	Bidoof	Normal
400	188	162	119	Bibarel	Normal
401	114	45	74	Kricketot	Normal
402	184	160	100	Kricketune	Normal
403	128	117	64	Shinx	Normal
404	155	159	95	Luxio	Normal
405	190	232	156	Luxray	Normal
406	120	91	109	Budew	Normal
407	155	243	185	Roserade	Normal
408	167	218	71	Cranidos	Normal
409	219	295	109	Rampardos	Normal
410	102	76	195	Shieldon	Normal
411	155	94	286	Bastiodon	Normal
412	120	53	83	Burmy	Plant
412	120	53	83	Burmy	Sandy
412	120	53	83	Burmy	Trash
413	155	141	180	Wormadam	Plant
413	155	141	180	Wormadam	Sandy
413	155	127	175	Wormadam	Trash
414	172	185	98	Mothim	Normal
415	102	59	83	Combee	Normal
416	172	149	190	Vespiquen	Normal
417	155	94	172	Pachirisu	Normal
418	146	132	67	Buizel	Normal
419	198	221	114	Floatzel	Normal
420	128	108	92	Cherubi	Normal
421	172	170	153	Cherrim	Overcast
421	172	170	153	Cherrim	Sunny
422	183	103	105	Shellos	East_sea
422	183	103	105	Shellos	West_sea
423	244	169	143	Gastrodon	East_sea
423	244	169	143	Gastrodon	West_sea
424	181	205	143	Ambipom	Normal
425	207	117	80	Drifloon	Normal
426	312	180	102	Drifblim	Normal
427	146	130	105	Buneary	Normal
428	163	156	194	Lopunny	Normal
429	155	211	187	Mismagius	Normal
430	225	243	103	Honchkrow	Normal
431	135	109	82	Glameow	Normal
432	174	172	133	Purugly	Normal
433	128	114	94	Chingling	Normal
434	160	121	90	Stunky	Normal
435	230	184	132	Skuntank	Normal
436	149	43	154	Bronzor	Normal
437	167	161	213	Bronzong	Normal
438	137	124	133	Bonsly	Normal
439	85	125	142	Mime Jr.	Normal
440	225	25	77	Happiny	Normal
441	183	183	91	Chatot	Normal
442	137	169	199	Spiritomb	Normal
443	151	124	84	Gible	Normal
444	169	172	125	Gabite	Normal
445	239	261	193	Garchomp	Normal
446	286	137	117	Munchlax	Normal
447	120	127	78	Riolu	Normal
448	172	236	144	Lucario	Normal
449	169	124	118	Hippopotas	Normal
450	239	201	191	Hippowdon	Normal
451	120	93	151	Skorupi	Normal
452	172	180	202	Drapion	Normal
453	134	116	76	Croagunk	Normal
454	195	211	133	Toxicroak	Normal
455	179	187	136	Carnivine	Normal
456	135	96	116	Finneon	Normal
457	170	142	170	Lumineon	Normal
458	128	105	179	Mantyke	Normal
459	155	115	105	Snover	Normal
460	207	178	158	Abomasnow	Normal
461	172	243	171	Weavile	Normal
462	172	238	205	Magnezone	Normal
463	242	161	181	Lickilicky	Normal
464	251	241	190	Rhyperior	Normal
465	225	207	184	Tangrowth	Normal
466	181	249	163	Electivire	Normal
467	181	247	172	Magmortar	Normal
468	198	225	217	Togekiss	Normal
469	200	231	156	Yanmega	Normal
470	163	216	219	Leafeon	Normal
471	163	238	205	Glaceon	Normal
472	181	185	222	Gliscor	Normal
473	242	247	146	Mamoswine	Normal
474	198	264	150	Porygon-Z	Normal
475	169	237	195	Gallade	Normal
476	155	135	275	Probopass	Normal
477	128	180	254	Dusknoir	Normal
478	172	171	150	Froslass	Normal
479	137	204	219	Rotom	Fan
479	137	204	219	Rotom	Frost
479	137	204	219	Rotom	Heat
479	137	204	219	Rotom	Mow
479	137	185	159	Rotom	Normal
479	137	204	219	Rotom	Wash
480	181	156	270	Uxie	Normal
481	190	212	212	Mesprit	Normal
482	181	270	151	Azelf	Normal
483	205	275	211	Dialga	Normal
484	189	280	215	Palkia	Normal
485	209	251	213	Heatran	Normal
486	221	287	210	Regigigas	Normal
487	284	187	225	Giratina	Altered
487	284	225	187	Giratina	Origin
488	260	152	258	Cresselia	Normal
489	190	162	162	Phione	Normal
490	225	210	210	Manaphy	Normal
491	172	285	198	Darkrai	Normal
492	225	210	210	Shaymin	Land
492	225	261	166	Shaymin	Sky
493	237	238	238	Arceus	Bug
493	237	238	238	Arceus	Dark
493	237	238	238	Arceus	Dragon
493	237	238	238	Arceus	Electric
493	237	238	238	Arceus	Fairy
493	237	238	238	Arceus	Fighting
493	237	238	238	Arceus	Fire
493	237	238	238	Arceus	Flying
493	237	238	238	Arceus	Ghost
493	237	238	238	Arceus	Grass
493	237	238	238	Arceus	Ground
493	237	238	238	Arceus	Ice
493	237	238	238	Arceus	Normal
493	237	238	238	Arceus	Poison
493	237	238	238	Arceus	Psychic
493	237	238	238	Arceus	Rock
493	237	238	238	Arceus	Steel
493	237	238	238	Arceus	Water
494	225	210	210	Victini	Normal
495	128	88	107	Snivy	Normal
496	155	122	152	Servine	Normal
497	181	161	204	Serperior	Normal
498	163	115	85	Tepig	Normal
499	207	173	106	Pignite	Normal
500	242	235	127	Emboar	Normal
501	146	117	85	Oshawott	Normal
502	181	159	116	Dewott	Normal
503	216	212	157	Samurott	Normal
504	128	98	73	Patrat	Normal
505	155	165	139	Watchog	Normal
506	128	107	86	Lillipup	Normal
507	163	145	126	Herdier	Normal
508	198	206	182	Stoutland	Normal
509	121	98	73	Purrloin	Normal
510	162	187	106	Liepard	Normal
511	137	104	94	Pansage	Normal
512	181	206	133	Simisage	Normal
513	137	104	94	Pansear	Normal
514	181	206	133	Simisear	Normal
515	137	104	94	Panpour	Normal
516	181	206	133	Simipour	Normal
517	183	111	92	Munna	Normal
518	253	183	166	Musharna	Normal
519	137	98	80	Pidove	Normal
520	158	144	107	Tranquill	Normal
521	190	226	146	Unfezant	Normal
522	128	118	64	Blitzle	Normal
523	181	211	136	Zebstrika	Normal
524	146	121	110	Roggenrola	Normal
525	172	174	143	Boldore	Normal
526	198	226	201	Gigalith	Normal
527	163	107	85	Woobat	Normal
528	167	161	119	Swoobat	Normal
529	155	154	85	Drilbur	Normal
530	242	255	129	Excadrill	Normal
531	230	114	163	Audino	Normal
532	181	134	87	Timburr	Normal
533	198	180	134	Gurdurr	Normal
534	233	243	158	Conkeldurr	Normal
535	137	98	78	Tympole	Normal
536	181	128	109	Palpitoad	Normal
537	233	188	150	Seismitoad	Normal
538	260	172	160	Throh	Normal
539	181	231	153	Sawk	Normal
540	128	96	124	Sewaddle	Normal
541	146	115	162	Swadloon	Normal
542	181	205	165	Leavanny	Normal
543	102	83	99	Venipede	Normal
544	120	100	173	Whirlipede	Normal
545	155	203	175	Scolipede	Normal
546	120	71	111	Cottonee	Normal
547	155	164	176	Whimsicott	Normal
548	128	119	91	Petilil	Normal
549	172	214	155	Lilligant	Normal
550	172	189	129	Basculin	Blue_striped
550	172	189	129	Basculin	Red_striped
551	137	132	69	Sandile	Normal
552	155	155	90	Krokorok	Normal
553	216	229	158	Krookodile	Normal
554	172	153	86	Darumaka	Galarian
554	172	153	86	Darumaka	Normal
555	233	263	114	Darmanitan	Galarian_standard
555	233	323	123	Darmanitan	Galarian_zen
555	233	263	114	Darmanitan	Standard
555	233	243	202	Darmanitan	Zen
556	181	201	130	Maractus	Normal
557	137	118	128	Dwebble	Normal
558	172	188	200	Crustle	Normal
559	137	132	132	Scraggy	Normal
560	163	163	222	Scrafty	Normal
561	176	204	167	Sigilyph	Normal
562	116	95	141	Yamask	Galarian
562	116	95	141	Yamask	Normal
563	151	163	237	Cofagrigus	Normal
564	144	134	146	Tirtouga	Normal
565	179	192	197	Carracosta	Normal
566	146	213	89	Archen	Normal
567	181	292	139	Archeops	Normal
568	137	96	122	Trubbish	Normal
569	190	181	164	Garbodor	Normal
570	120	153	78	Zorua	Normal
571	155	250	127	Zoroark	Normal
572	146	98	80	Minccino	Normal
573	181	198	130	Cinccino	Normal
574	128	98	112	Gothita	Normal
575	155	137	153	Gothorita	Normal
576	172	176	205	Gothitelle	Normal
577	128	170	83	Solosis	Normal
578	163	208	103	Duosion	Normal
579	242	214	148	Reuniclus	Normal
580	158	84	96	Ducklett	Normal
581	181	182	132	Swanna	Normal
582	113	118	106	Vanillite	Normal
583	139	151	138	Vanillish	Normal
584	174	218	184	Vanilluxe	Normal
585	155	115	100	Deerling	Autumn
585	155	115	100	Deerling	Spring
585	155	115	100	Deerling	Summer
585	155	115	100	Deerling	Winter
586	190	198	146	Sawsbuck	Autumn
586	190	198	146	Sawsbuck	Spring
586	190	198	146	Sawsbuck	Summer
586	190	198	146	Sawsbuck	Winter
587	146	158	127	Emolga	Normal
588	137	137	87	Karrablast	Normal
589	172	223	187	Escavalier	Normal
590	170	97	91	Foongus	Normal
591	249	155	139	Amoonguss	Normal
592	146	115	134	Frillish	Female
592	146	115	134	Frillish	Normal
593	225	159	178	Jellicent	Female
593	225	159	178	Jellicent	Normal
594	338	138	131	Alomomola	Normal
595	137	110	98	Joltik	Normal
596	172	201	128	Galvantula	Normal
597	127	82	155	Ferroseed	Normal
598	179	158	223	Ferrothorn	Normal
599	120	98	121	Klink	Normal
600	155	150	174	Klang	Normal
601	155	199	214	Klinklang	Normal
602	111	105	78	Tynamo	Normal
603	163	156	130	Eelektrik	Normal
604	198	217	152	Eelektross	Normal
605	146	148	100	Elgyem	Normal
606	181	221	163	Beheeyem	Normal
607	137	108	98	Litwick	Normal
608	155	169	115	Lampent	Normal
609	155	271	182	Chandelure	Normal
610	130	154	101	Axew	Normal
611	165	212	123	Fraxure	Normal
612	183	284	172	Haxorus	Normal
613	146	128	74	Cubchoo	Normal
613	146	128	74	Cubchoo	Winter_2020
614	216	233	152	Beartic	Normal
614	216	233	152	Beartic	Winter_2020
615	190	190	218	Cryogonal	Normal
616	137	72	140	Shelmet	Normal
617	190	220	120	Accelgor	Normal
618	240	144	171	Stunfisk	Galarian
618	240	144	171	Stunfisk	Normal
619	128	160	98	Mienfoo	Normal
620	163	258	127	Mienshao	Normal
621	184	213	170	Druddigon	Normal
622	153	127	92	Golett	Normal
623	205	222	154	Golurk	Normal
624	128	154	114	Pawniard	Normal
625	163	232	176	Bisharp	Normal
626	216	195	182	Bouffalant	Normal
627	172	150	97	Rufflet	Normal
628	242	213	137	Braviary	Hisuian
628	225	232	152	Braviary	Normal
629	172	105	139	Vullaby	Normal
630	242	129	205	Mandibuzz	Normal
631	198	204	129	Heatmor	Normal
632	151	217	188	Durant	Normal
633	141	116	93	Deino	Normal
634	176	159	135	Zweilous	Normal
635	211	256	188	Hydreigon	Normal
636	146	156	107	Larvesta	Normal
637	198	264	189	Volcarona	Normal
638	209	192	229	Cobalion	Normal
639	209	260	192	Terrakion	Normal
640	209	192	229	Virizion	Normal
641	188	266	164	Tornadus	Incarnate
641	188	238	189	Tornadus	Therian
642	188	266	164	Thundurus	Incarnate
642	188	295	161	Thundurus	Therian
643	205	275	211	Reshiram	Normal
644	205	275	211	Zekrom	Normal
645	205	261	182	Landorus	Incarnate
645	205	289	179	Landorus	Therian
646	245	310	183	Kyurem	Black
646	245	246	170	Kyurem	Normal
646	245	310	183	Kyurem	White
647	209	260	192	Keldeo	Ordinary
647	209	260	192	Keldeo	Resolute
648	225	250	225	Meloetta	Aria
648	225	269	188	Meloetta	Pirouette
649	174	252	199	Genesect	Burn
649	174	252	199	Genesect	Chill
649	174	252	199	Genesect	Douse
649	174	252	199	Genesect	Normal
649	174	252	199	Genesect	Shock
650	148	110	106	Chespin	Normal
651	156	146	156	Quilladin	Normal
652	204	201	204	Chesnaught	Normal
653	120	116	102	Fennekin	Normal
654	153	171	130	Braixen	Normal
655	181	230	189	Delphox	Normal
656	121	122	84	Froakie	Normal
657	144	168	114	Frogadier	Normal
658	176	223	152	Greninja	Normal
659	116	68	72	Bunnelby	Normal
660	198	112	155	Diggersby	Normal
661	128	95	80	Fletchling	Normal
662	158	145	110	Fletchinder	Normal
663	186	176	155	Talonflame	Normal
664	116	63	63	Scatterbug	Archipelago
664	116	63	63	Scatterbug	Continental
664	116	63	63	Scatterbug	Elegant
664	116	63	63	Scatterbug	Fancy
664	116	63	63	Scatterbug	Garden
664	116	63	63	Scatterbug	High_plains
664	116	63	63	Scatterbug	Icy_snow
664	116	63	63	Scatterbug	Jungle
664	116	63	63	Scatterbug	Marine
664	116	63	63	Scatterbug	Meadow
664	116	63	63	Scatterbug	Modern
664	116	63	63	Scatterbug	Monsoon
664	116	63	63	Scatterbug	Ocean
664	116	63	63	Scatterbug	Pokeball
664	116	63	63	Scatterbug	Polar
664	116	63	63	Scatterbug	River
664	116	63	63	Scatterbug	Sandstorm
664	116	63	63	Scatterbug	Savanna
664	116	63	63	Scatterbug	Sun
664	116	63	63	Scatterbug	Tundra
665	128	48	89	Spewpa	Archipelago
665	128	48	89	Spewpa	Continental
665	128	48	89	Spewpa	Elegant
665	128	48	89	Spewpa	Fancy
665	128	48	89	Spewpa	Garden
665	128	48	89	Spewpa	High_plains
665	128	48	89	Spewpa	Icy_snow
665	128	48	89	Spewpa	Jungle
665	128	48	89	Spewpa	Marine
665	128	48	89	Spewpa	Meadow
665	128	48	89	Spewpa	Modern
665	128	48	89	Spewpa	Monsoon
665	128	48	89	Spewpa	Ocean
665	128	48	89	Spewpa	Pokeball
665	128	48	89	Spewpa	Polar
665	128	48	89	Spewpa	River
665	128	48	89	Spewpa	Sandstorm
665	128	48	89	Spewpa	Savanna
665	128	48	89	Spewpa	Sun
665	128	48	89	Spewpa	Tundra
666	190	176	103	Vivillon	Archipelago
666	190	176	103	Vivillon	Continental
666	190	176	103	Vivillon	Elegant
666	190	176	103	Vivillon	Fancy
666	190	176	103	Vivillon	Garden
666	190	176	103	Vivillon	High_plains
666	190	176	103	Vivillon	Icy_snow
666	190	176	103	Vivillon	Jungle
666	190	176	103	Vivillon	Marine
666	190	176	103	Vivillon	Meadow
666	190	176	103	Vivillon	Modern
666	190	176	103	Vivillon	Monsoon
666	190	176	103	Vivillon	Ocean
666	190	176	103	Vivillon	Pokeball
666	190	176	103	Vivillon	Polar
666	190	176	103	Vivillon	River
666	190	176	103	Vivillon	Sandstorm
666	190	176	103	Vivillon	Savanna
666	190	176	103	Vivillon	Sun
666	190	176	103	Vivillon	Tundra
667	158	139	112	Litleo	Normal
668	200	221	149	Pyroar	Female
668	200	221	149	Pyroar	Normal
669	127	108	120	Flabebe	Blue
669	127	108	120	Flabebe	Orange
669	127	108	120	Flabebe	Red
669	127	108	120	Flabebe	White
669	127	108	120	Flabebe	Yellow
670	144	136	151	Floette	Blue
670	144	136	151	Floette	Orange
670	144	136	151	Floette	Red
670	144	136	151	Floette	White
670	144	136	151	Floette	Yellow
671	186	212	244	Florges	Blue
671	186	212	244	Florges	Orange
671	186	212	244	Florges	Red
671	186	212	244	Florges	White
671	186	212	244	Florges	Yellow
672	165	123	102	Skiddo	Normal
673	265	196	146	Gogoat	Normal
674	167	145	107	Pancham	Normal
675	216	226	146	Pangoro	Normal
676	181	164	167	Furfrou	Dandy
676	181	164	167	Furfrou	Debutante
676	181	164	167	Furfrou	Diamond
676	181	164	167	Furfrou	Heart
676	181	164	167	Furfrou	Kabuki
676	181	164	167	Furfrou	La_reine
676	181	164	167	Furfrou	Matron
676	181	164	167	Furfrou	Natural
676	181	164	167	Furfrou	Pharaoh
676	181	164	167	Furfrou	Star
677	158	120	114	Espurr	Normal
678	179	166	167	Meowstic	Female
678	179	166	167	Meowstic	Normal
679	0	0	0	Honedge	Normal
680	0	0	0	Doublade	Normal
681	0	0	0	Aegislash	Normal
682	186	110	113	Spritzee	Normal
683	226	173	150	Aromatisse	Normal
684	158	109	119	Swirlix	Normal
685	193	168	163	Slurpuff	Normal
686	142	98	95	Inkay	Normal
687	200	177	165	Malamar	Normal
688	123	96	120	Binacle	Normal
689	176	194	205	Barbaracle	Normal
690	137	109	109	Skrelp	Normal
691	163	177	207	Dragalge	Normal
692	137	108	117	Clauncher	Normal
693	174	221	171	Clawitzer	Normal
694	127	115	78	Helioptile	Normal
695	158	219	168	Heliolisk	Normal
696	151	158	123	Tyrunt	Normal
697	193	227	191	Tyrantrum	Normal
698	184	124	109	Amaura	Normal
699	265	186	163	Aurorus	Normal
700	216	203	205	Sylveon	Normal
701	186	195	153	Hawlucha	Normal
702	167	164	134	Dedenne	Normal
703	137	95	285	Carbink	Normal
704	128	101	112	Goomy	Normal
705	169	159	176	Sliggoo	Normal
706	207	220	242	Goodra	Normal
707	149	160	179	Klefki	Normal
708	125	125	103	Phantump	Normal
709	198	201	154	Trevenant	Normal
710	135	121	123	Pumpkaboo	Average
710	144	120	122	Pumpkaboo	Large
710	127	122	124	Pumpkaboo	Small
710	153	118	120	Pumpkaboo	Super
711	163	175	213	Gourgeist	Average
711	181	179	206	Gourgeist	Large
711	146	171	219	Gourgeist	Small
711	198	182	200	Gourgeist	Super
712	146	117	120	Bergmite	Normal
713	216	214	238	Avalugg	Hisuian
713	216	196	240	Avalugg	Normal
714	120	83	73	Noibat	Normal
715	198	205	175	Noivern	Normal
716	246	250	185	Xerneas	Normal
717	246	250	185	Yveltal	Normal
718	0	0	0	Zygarde	Normal
719	137	190	285	Diancie	Normal
720	173	261	187	Hoopa	Confined
720	173	311	191	Hoopa	Unbound
721	190	252	216	Volcanion	Normal
722	169	102	99	Rowlet	Normal
723	186	142	139	Dartrix	Normal
724	186	210	179	Decidueye	Normal
725	128	128	79	Litten	Normal
726	163	174	103	Torracat	Normal
727	216	214	175	Incineroar	Normal
728	137	120	103	Popplio	Normal
729	155	168	145	Brionne	Normal
730	190	232	195	Primarina	Normal
731	111	136	59	Pikipek	Normal
732	146	159	100	Trumbeak	Normal
733	190	222	146	Toucannon	Normal
734	134	122	56	Yungoos	Normal
735	204	194	113	Gumshoos	Normal
736	132	115	85	Grubbin	Normal
737	149	145	161	Charjabug	Normal
738	184	254	158	Vikavolt	Normal
739	132	150	104	Crabrawler	Normal
740	219	231	138	Crabominable	Normal
741	181	196	145	Oricorio	Baile
741	181	196	145	Oricorio	Pau
741	181	196	145	Oricorio	Pompom
741	181	196	145	Oricorio	Sensu
742	120	110	81	Cutiefly	Normal
743	155	198	146	Ribombee	Normal
744	128	117	78	Rockruff	Normal
745	181	234	139	Lycanroc	Dusk
745	181	231	140	Lycanroc	Midday
745	198	218	152	Lycanroc	Midnight
746	128	255	242	Wishiwashi	School
746	128	46	43	Wishiwashi	Solo
747	137	98	110	Mareanie	Normal
748	137	114	273	Toxapex	Normal
749	172	175	121	Mudbray	Normal
750	225	214	174	Mudsdale	Normal
751	116	72	117	Dewpider	Normal
752	169	126	219	Araquanid	Normal
753	120	100	64	Fomantis	Normal
754	172	192	169	Lurantis	Normal
755	120	108	119	Morelull	Normal
756	155	154	168	Shiinotic	Normal
757	134	136	80	Salandit	Normal
758	169	228	130	Salazzle	Normal
759	172	136	95	Stufful	Normal
760	260	226	141	Bewear	Normal
761	123	55	69	Bounsweet	Normal
762	141	78	94	Steenee	Normal
763	176	222	195	Tsareena	Normal
764	139	165	215	Comfey	Normal
765	207	168	192	Oranguru	Normal
766	225	222	160	Passimian	Normal
767	93	67	74	Wimpod	Normal
768	181	218	226	Golisopod	Normal
769	146	120	118	Sandygast	Normal
770	198	178	178	Palossand	Normal
771	146	97	224	Pyukumuku	Normal
772	216	184	184	Type: Null	Normal
773	216	198	198	Silvally	Bug
773	216	198	198	Silvally	Dark
773	216	198	198	Silvally	Dragon
773	216	198	198	Silvally	Electric
773	216	198	198	Silvally	Fairy
773	216	198	198	Silvally	Fighting
773	216	198	198	Silvally	Fire
773	216	198	198	Silvally	Flying
773	216	198	198	Silvally	Ghost
773	216	198	198	Silvally	Grass
773	216	198	198	Silvally	Ground
773	216	198	198	Silvally	Ice
773	216	198	198	Silvally	Normal
773	216	198	198	Silvally	Poison
773	216	198	198	Silvally	Psychic
773	216	198	198	Silvally	Rock
773	216	198	198	Silvally	Steel
773	216	198	198	Silvally	Water
774	155	218	131	Minior	Blue
774	155	218	131	Minior	Green
774	155	218	131	Minior	Indigo
774	155	218	131	Minior	Orange
774	155	218	131	Minior	Red
774	155	218	131	Minior	Violet
774	155	218	131	Minior	Yellow
775	163	216	165	Komala	Normal
776	155	165	215	Turtonator	Normal
777	163	190	145	Togedemaru	Normal
778	146	177	199	Mimikyu	Busted
778	146	177	199	Mimikyu	Disguised
779	169	208	145	Bruxish	Normal
780	186	231	164	Drampa	Normal
781	172	233	179	Dhelmise	Normal
782	128	102	108	Jangmo-o	Normal
783	146	145	162	Hakamo-o	Normal
784	181	222	240	Kommo-o	Normal
785	172	250	181	Tapu Koko	Normal
786	172	259	208	Tapu Lele	Normal
787	172	249	215	Tapu Bulu	Normal
788	172	189	254	Tapu Fini	Normal
789	125	54	57	Cosmog	Normal
790	125	54	242	Cosmoem	Normal
791	264	255	191	Solgaleo	Normal
792	264	255	191	Lunala	Normal
793	240	249	210	Nihilego	Normal
794	216	236	196	Buzzwole	Normal
795	174	316	85	Pheromosa	Normal
796	195	330	144	Xurkitree	Normal
797	219	207	199	Celesteela	Normal
798	139	323	182	Kartana	Normal
799	440	188	99	Guzzlord	Normal
800	200	277	220	Necrozma	Dawn_wings
800	200	277	220	Necrozma	Dusk_mane
800	219	251	195	Necrozma	Normal
800	200	337	196	Necrozma	Ultra
801	190	246	225	Magearna	Normal
801	190	246	225	Magearna	Original_color
802	207	265	190	Marshadow	Normal
803	167	145	133	Poipole	Normal
804	177	263	159	Naganadel	Normal
805	156	213	298	Stakataka	Normal
806	142	315	148	Blacephalon	Normal
807	204	252	177	Zeraora	Normal
808	130	118	99	Meltan	Normal
809	264	226	190	Melmetal	Normal
810	137	122	91	Grookey	Normal
811	172	165	134	Thwackey	Normal
812	225	239	168	Rillaboom	Normal
813	137	132	79	Scorbunny	Normal
814	163	170	125	Raboot	Normal
815	190	238	163	Cinderace	Normal
816	137	132	79	Sobble	Normal
817	163	186	113	Drizzile	Normal
818	172	262	142	Inteleon	Normal
819	172	95	86	Skwovet	Normal
820	260	160	156	Greedent	Normal
821	116	88	67	Rookidee	Normal
822	169	129	110	Corvisquire	Normal
823	221	163	192	Corviknight	Normal
824	93	46	67	Blipbug	Normal
825	137	87	157	Dottler	Normal
826	155	156	240	Orbeetle	Normal
827	120	85	82	Nickit	Normal
828	172	172	164	Thievul	Normal
829	120	70	104	Gossifleur	Normal
830	155	148	211	Eldegoss	Normal
831	123	76	97	Wooloo	Normal
832	176	159	198	Dubwool	Normal
833	137	114	85	Chewtle	Normal
834	207	213	164	Drednaw	Normal
835	153	80	90	Yamper	Normal
836	170	197	131	Boltund	Normal
837	102	73	91	Rolycoly	Normal
838	190	114	157	Carkol	Normal
839	242	146	198	Coalossal	Normal
840	120	71	116	Applin	Normal
841	172	214	144	Flapple	Normal
842	242	178	146	Appletun	Normal
843	141	103	123	Silicobra	Normal
844	176	202	207	Sandaconda	Normal
845	172	173	163	Cramorant	Normal
846	121	118	72	Arrokuda	Normal
847	156	258	127	Barraskewda	Normal
848	120	97	65	Toxel	Normal
849	181	224	140	Toxtricity	Amped
849	181	224	140	Toxtricity	Low_key
850	137	118	90	Sizzlipede	Normal
851	225	220	158	Centiskorch	Normal
852	137	121	103	Clobbopus	Normal
853	190	209	162	Grapploct	Normal
854	120	134	96	Sinistea	Antique
854	120	134	96	Sinistea	Phony
855	155	248	189	Polteageist	Antique
855	155	248	189	Polteageist	Phony
856	123	98	93	Hatenna	Normal
857	149	153	133	Hattrem	Normal
858	149	237	182	Hatterene	Normal
859	128	103	69	Impidimp	Normal
860	163	145	102	Morgrem	Normal
861	216	227	139	Grimmsnarl	Normal
862	212	180	194	Obstagoon	Galarian
863	172	195	162	Perrserker	Galarian
864	155	253	182	Cursola	Normal
865	158	248	176	Sirfetch’d	Galarian
866	190	212	179	Mr. Rime	Galarian
867	151	163	237	Runerigus	Galarian
868	128	90	97	Milcery	Normal
869	163	203	203	Alcremie	Normal
870	163	193	170	Falinks	Normal
871	134	176	161	Pincurchin	Normal
872	102	76	59	Snom	Normal
873	172	230	155	Frosmoth	Normal
874	225	222	182	Stonjourner	Normal
875	181	148	195	Eiscue	Ice
875	181	173	139	Eiscue	Noice
876	172	184	184	Indeedee	Female
876	155	208	166	Indeedee	Male
877	151	192	121	Morpeko	Full_belly
877	151	192	121	Morpeko	Hangry
878	176	140	91	Cufant	Normal
879	263	226	126	Copperajah	Normal
880	207	195	165	Dracozolt	Normal
881	207	190	166	Arctozolt	Normal
882	207	175	185	Dracovish	Normal
883	207	171	185	Arctovish	Normal
884	172	239	185	Duraludon	Normal
885	99	117	61	Dreepy	Normal
886	169	163	105	Drakloak	Normal
887	204	266	170	Dragapult	Normal
888	192	332	240	Zacian	Crowned_sword
888	192	254	236	Zacian	Hero
889	192	250	292	Zamazenta	Crowned_shield
889	192	254	236	Zamazenta	Hero
890	452	251	505	Eternatus	Eternamax
890	268	278	192	Eternatus	Normal
891	155	170	112	Kubfu	Normal
892	225	254	177	Urshifu	Rapid_strike
892	225	254	177	Urshifu	Single_strike
893	233	242	215	Zarude	Normal
894	190	250	125	Regieleki	Normal
895	400	202	101	Regidrago	Normal
896	225	246	223	Glastrier	Normal
897	205	273	146	Spectrier	Normal
898	205	268	246	Calyrex	Ice_rider
898	225	162	162	Calyrex	Normal
898	205	324	194	Calyrex	Shadow_rider
901	277	243	181	Ursaluna	Normal
903	190	259	158	Sneasler	Normal
904	198	222	171	Overqwil	Normal
\.


--
-- TOC entry 3409 (class 0 OID 19801)
-- Dependencies: 219
-- Data for Name: pokemon_types; Type: TABLE DATA; Schema: public; Owner: zitrojj
--

COPY public.pokemon_types (pokemon_id, form, type, pokemon_name) FROM stdin;
1	Fall_2019	"[\\"Grass\\",\\"Poison\\"]"	Bulbasaur
1	Normal	"[\\"Grass\\",\\"Poison\\"]"	Bulbasaur
2	Normal	"[\\"Grass\\",\\"Poison\\"]"	Ivysaur
3	Copy_2019	"[\\"Grass\\",\\"Poison\\"]"	Venusaur
3	Normal	"[\\"Grass\\",\\"Poison\\"]"	Venusaur
4	Fall_2019	"[\\"Fire\\"]"	Charmander
4	Normal	"[\\"Fire\\"]"	Charmander
5	Normal	"[\\"Fire\\"]"	Charmeleon
6	Copy_2019	"[\\"Fire\\",\\"Flying\\"]"	Charizard
6	Normal	"[\\"Fire\\",\\"Flying\\"]"	Charizard
7	Fall_2019	"[\\"Water\\"]"	Squirtle
7	Normal	"[\\"Water\\"]"	Squirtle
8	Normal	"[\\"Water\\"]"	Wartortle
9	Copy_2019	"[\\"Water\\"]"	Blastoise
9	Normal	"[\\"Water\\"]"	Blastoise
10	Normal	"[\\"Bug\\"]"	Caterpie
11	Normal	"[\\"Bug\\"]"	Metapod
12	Normal	"[\\"Bug\\",\\"Flying\\"]"	Butterfree
13	Normal	"[\\"Bug\\",\\"Poison\\"]"	Weedle
14	Normal	"[\\"Bug\\",\\"Poison\\"]"	Kakuna
15	Normal	"[\\"Bug\\",\\"Poison\\"]"	Beedrill
16	Normal	"[\\"Normal\\",\\"Flying\\"]"	Pidgey
17	Normal	"[\\"Normal\\",\\"Flying\\"]"	Pidgeotto
18	Normal	"[\\"Normal\\",\\"Flying\\"]"	Pidgeot
19	Alola	"[\\"Dark\\",\\"Normal\\"]"	Rattata
19	Normal	"[\\"Normal\\"]"	Rattata
20	Alola	"[\\"Dark\\",\\"Normal\\"]"	Raticate
20	Normal	"[\\"Normal\\"]"	Raticate
21	Normal	"[\\"Normal\\",\\"Flying\\"]"	Spearow
22	Normal	"[\\"Normal\\",\\"Flying\\"]"	Fearow
23	Normal	"[\\"Poison\\"]"	Ekans
24	Normal	"[\\"Poison\\"]"	Arbok
25	Adventure_hat_2020	"[\\"Electric\\"]"	Pikachu
25	Copy_2019	"[\\"Electric\\"]"	Pikachu
25	Costume_2020	"[\\"Electric\\"]"	Pikachu
25	Fall_2019	"[\\"Electric\\"]"	Pikachu
25	Flying_01	"[\\"Electric\\"]"	Pikachu
25	Flying_02	"[\\"Electric\\"]"	Pikachu
25	Flying_5th_anniv	"[\\"Electric\\"]"	Pikachu
25	Flying_okinawa	"[\\"Electric\\"]"	Pikachu
25	Gofest_2022	"[\\"Electric\\"]"	Pikachu
25	Kariyushi	"[\\"Electric\\"]"	Pikachu
25	Normal	"[\\"Electric\\"]"	Pikachu
25	Pop_star	"[\\"Electric\\"]"	Pikachu
25	Rock_star	"[\\"Electric\\"]"	Pikachu
25	Tshirt_01	"[\\"Electric\\"]"	Pikachu
25	Tshirt_02	"[\\"Electric\\"]"	Pikachu
25	Vs_2019	"[\\"Electric\\"]"	Pikachu
25	Wcs_2022	"[\\"Electric\\"]"	Pikachu
25	Winter_2020	"[\\"Electric\\"]"	Pikachu
26	Alola	"[\\"Electric\\",\\"Psychic\\"]"	Raichu
26	Normal	"[\\"Electric\\"]"	Raichu
27	Alola	"[\\"Ice\\",\\"Steel\\"]"	Sandshrew
27	Normal	"[\\"Ground\\"]"	Sandshrew
28	Alola	"[\\"Ice\\",\\"Steel\\"]"	Sandslash
28	Normal	"[\\"Ground\\"]"	Sandslash
29	Normal	"[\\"Poison\\"]"	Nidoran♀
30	Normal	"[\\"Poison\\"]"	Nidorina
31	Normal	"[\\"Poison\\",\\"Ground\\"]"	Nidoqueen
32	Normal	"[\\"Poison\\"]"	Nidoran♂
33	Normal	"[\\"Poison\\"]"	Nidorino
34	Normal	"[\\"Poison\\",\\"Ground\\"]"	Nidoking
35	Normal	"[\\"Fairy\\"]"	Clefairy
36	Normal	"[\\"Fairy\\"]"	Clefable
37	Alola	"[\\"Ice\\"]"	Vulpix
37	Normal	"[\\"Fire\\"]"	Vulpix
38	Alola	"[\\"Ice\\",\\"Fairy\\"]"	Ninetales
38	Normal	"[\\"Fire\\"]"	Ninetales
39	Normal	"[\\"Normal\\",\\"Fairy\\"]"	Jigglypuff
40	Normal	"[\\"Normal\\",\\"Fairy\\"]"	Wigglytuff
41	Normal	"[\\"Poison\\",\\"Flying\\"]"	Zubat
42	Normal	"[\\"Poison\\",\\"Flying\\"]"	Golbat
43	Normal	"[\\"Grass\\",\\"Poison\\"]"	Oddish
44	Normal	"[\\"Grass\\",\\"Poison\\"]"	Gloom
45	Normal	"[\\"Grass\\",\\"Poison\\"]"	Vileplume
46	Normal	"[\\"Bug\\",\\"Grass\\"]"	Paras
47	Normal	"[\\"Bug\\",\\"Grass\\"]"	Parasect
48	Normal	"[\\"Bug\\",\\"Poison\\"]"	Venonat
49	Normal	"[\\"Bug\\",\\"Poison\\"]"	Venomoth
50	Alola	"[\\"Ground\\",\\"Steel\\"]"	Diglett
50	Normal	"[\\"Ground\\"]"	Diglett
51	Alola	"[\\"Ground\\",\\"Steel\\"]"	Dugtrio
51	Normal	"[\\"Ground\\"]"	Dugtrio
52	Alola	"[\\"Dark\\"]"	Meowth
52	Galarian	"[\\"Steel\\"]"	Meowth
52	Normal	"[\\"Normal\\"]"	Meowth
53	Alola	"[\\"Dark\\"]"	Persian
53	Normal	"[\\"Normal\\"]"	Persian
54	Normal	"[\\"Water\\"]"	Psyduck
55	Normal	"[\\"Water\\"]"	Golduck
56	Normal	"[\\"Fighting\\"]"	Mankey
57	Normal	"[\\"Fighting\\"]"	Primeape
58	Hisuian	"[\\"Fire\\",\\"Rock\\"]"	Growlithe
58	Normal	"[\\"Fire\\"]"	Growlithe
59	Hisuian	"[\\"Fire\\",\\"Rock\\"]"	Arcanine
59	Normal	"[\\"Fire\\"]"	Arcanine
60	Normal	"[\\"Water\\"]"	Poliwag
61	Normal	"[\\"Water\\"]"	Poliwhirl
62	Normal	"[\\"Water\\",\\"Fighting\\"]"	Poliwrath
63	Normal	"[\\"Psychic\\"]"	Abra
64	Normal	"[\\"Psychic\\"]"	Kadabra
65	Normal	"[\\"Psychic\\"]"	Alakazam
66	Normal	"[\\"Fighting\\"]"	Machop
67	Normal	"[\\"Fighting\\"]"	Machoke
68	Normal	"[\\"Fighting\\"]"	Machamp
69	Normal	"[\\"Grass\\",\\"Poison\\"]"	Bellsprout
70	Normal	"[\\"Grass\\",\\"Poison\\"]"	Weepinbell
71	Normal	"[\\"Grass\\",\\"Poison\\"]"	Victreebel
72	Normal	"[\\"Water\\",\\"Poison\\"]"	Tentacool
73	Normal	"[\\"Water\\",\\"Poison\\"]"	Tentacruel
74	Alola	"[\\"Rock\\",\\"Electric\\"]"	Geodude
74	Normal	"[\\"Rock\\",\\"Ground\\"]"	Geodude
75	Alola	"[\\"Rock\\",\\"Electric\\"]"	Graveler
75	Normal	"[\\"Rock\\",\\"Ground\\"]"	Graveler
76	Alola	"[\\"Rock\\",\\"Electric\\"]"	Golem
76	Normal	"[\\"Rock\\",\\"Ground\\"]"	Golem
77	Galarian	"[\\"Psychic\\"]"	Ponyta
77	Normal	"[\\"Fire\\"]"	Ponyta
78	Galarian	"[\\"Psychic\\",\\"Fairy\\"]"	Rapidash
78	Normal	"[\\"Fire\\"]"	Rapidash
79	2020	"[\\"Water\\",\\"Psychic\\"]"	Slowpoke
79	Galarian	"[\\"Psychic\\"]"	Slowpoke
79	Normal	"[\\"Water\\",\\"Psychic\\"]"	Slowpoke
80	2021	"[\\"Water\\",\\"Psychic\\"]"	Slowbro
80	Galarian	"[\\"Poison\\",\\"Psychic\\"]"	Slowbro
80	Normal	"[\\"Water\\",\\"Psychic\\"]"	Slowbro
81	Normal	"[\\"Electric\\",\\"Steel\\"]"	Magnemite
82	Normal	"[\\"Electric\\",\\"Steel\\"]"	Magneton
83	Galarian	"[\\"Fighting\\"]"	Farfetch’d
83	Normal	"[\\"Normal\\",\\"Flying\\"]"	Farfetch’d
84	Normal	"[\\"Normal\\",\\"Flying\\"]"	Doduo
85	Normal	"[\\"Normal\\",\\"Flying\\"]"	Dodrio
86	Normal	"[\\"Water\\"]"	Seel
87	Normal	"[\\"Water\\",\\"Ice\\"]"	Dewgong
88	Alola	"[\\"Poison\\",\\"Dark\\"]"	Grimer
88	Normal	"[\\"Poison\\"]"	Grimer
89	Alola	"[\\"Poison\\",\\"Dark\\"]"	Muk
89	Normal	"[\\"Poison\\"]"	Muk
90	Normal	"[\\"Water\\"]"	Shellder
91	Normal	"[\\"Water\\",\\"Ice\\"]"	Cloyster
92	Normal	"[\\"Ghost\\",\\"Poison\\"]"	Gastly
93	Normal	"[\\"Ghost\\",\\"Poison\\"]"	Haunter
94	Costume_2020	"[\\"Ghost\\",\\"Poison\\"]"	Gengar
94	Normal	"[\\"Ghost\\",\\"Poison\\"]"	Gengar
95	Normal	"[\\"Rock\\",\\"Ground\\"]"	Onix
96	Normal	"[\\"Psychic\\"]"	Drowzee
97	Normal	"[\\"Psychic\\"]"	Hypno
98	Normal	"[\\"Water\\"]"	Krabby
99	Normal	"[\\"Water\\"]"	Kingler
100	Hisuian	"[\\"Electric\\",\\"Grass\\"]"	Voltorb
100	Normal	"[\\"Electric\\"]"	Voltorb
101	Hisuian	"[\\"Electric\\",\\"Grass\\"]"	Electrode
101	Normal	"[\\"Electric\\"]"	Electrode
102	Normal	"[\\"Grass\\",\\"Psychic\\"]"	Exeggcute
103	Alola	"[\\"Grass\\",\\"Dragon\\"]"	Exeggutor
103	Normal	"[\\"Grass\\",\\"Psychic\\"]"	Exeggutor
104	Normal	"[\\"Ground\\"]"	Cubone
105	Alola	"[\\"Fire\\",\\"Ghost\\"]"	Marowak
105	Normal	"[\\"Ground\\"]"	Marowak
106	Normal	"[\\"Fighting\\"]"	Hitmonlee
107	Normal	"[\\"Fighting\\"]"	Hitmonchan
108	Normal	"[\\"Normal\\"]"	Lickitung
109	Normal	"[\\"Poison\\"]"	Koffing
110	Galarian	"[\\"Poison\\",\\"Fairy\\"]"	Weezing
110	Normal	"[\\"Poison\\"]"	Weezing
111	Normal	"[\\"Ground\\",\\"Rock\\"]"	Rhyhorn
112	Normal	"[\\"Ground\\",\\"Rock\\"]"	Rhydon
113	Normal	"[\\"Normal\\"]"	Chansey
114	Normal	"[\\"Grass\\"]"	Tangela
115	Normal	"[\\"Normal\\"]"	Kangaskhan
116	Normal	"[\\"Water\\"]"	Horsea
117	Normal	"[\\"Water\\"]"	Seadra
118	Normal	"[\\"Water\\"]"	Goldeen
119	Normal	"[\\"Water\\"]"	Seaking
120	Normal	"[\\"Water\\"]"	Staryu
121	Normal	"[\\"Water\\",\\"Psychic\\"]"	Starmie
122	Galarian	"[\\"Ice\\",\\"Psychic\\"]"	Mr. Mime
122	Normal	"[\\"Psychic\\",\\"Fairy\\"]"	Mr. Mime
123	Normal	"[\\"Bug\\",\\"Flying\\"]"	Scyther
124	Normal	"[\\"Ice\\",\\"Psychic\\"]"	Jynx
125	Normal	"[\\"Electric\\"]"	Electabuzz
126	Normal	"[\\"Fire\\"]"	Magmar
127	Normal	"[\\"Bug\\"]"	Pinsir
128	Normal	"[\\"Normal\\"]"	Tauros
129	Normal	"[\\"Water\\"]"	Magikarp
130	Normal	"[\\"Water\\",\\"Flying\\"]"	Gyarados
131	Costume_2020	"[\\"Water\\",\\"Ice\\"]"	Lapras
131	Normal	"[\\"Water\\",\\"Ice\\"]"	Lapras
132	Normal	"[\\"Normal\\"]"	Ditto
133	Normal	"[\\"Normal\\"]"	Eevee
134	Normal	"[\\"Water\\"]"	Vaporeon
135	Normal	"[\\"Electric\\"]"	Jolteon
136	Normal	"[\\"Fire\\"]"	Flareon
137	Normal	"[\\"Normal\\"]"	Porygon
138	Normal	"[\\"Rock\\",\\"Water\\"]"	Omanyte
139	Normal	"[\\"Rock\\",\\"Water\\"]"	Omastar
140	Normal	"[\\"Rock\\",\\"Water\\"]"	Kabuto
141	Normal	"[\\"Rock\\",\\"Water\\"]"	Kabutops
142	Normal	"[\\"Rock\\",\\"Flying\\"]"	Aerodactyl
143	Normal	"[\\"Normal\\"]"	Snorlax
144	Galarian	"[\\"Psychic\\",\\"Flying\\"]"	Articuno
144	Normal	"[\\"Ice\\",\\"Flying\\"]"	Articuno
145	Galarian	"[\\"Fighting\\",\\"Flying\\"]"	Zapdos
145	Normal	"[\\"Electric\\",\\"Flying\\"]"	Zapdos
146	Galarian	"[\\"Dark\\",\\"Flying\\"]"	Moltres
146	Normal	"[\\"Fire\\",\\"Flying\\"]"	Moltres
147	Normal	"[\\"Dragon\\"]"	Dratini
148	Normal	"[\\"Dragon\\"]"	Dragonair
149	Normal	"[\\"Dragon\\",\\"Flying\\"]"	Dragonite
150	A	"[\\"Psychic\\"]"	Mewtwo
150	Normal	"[\\"Psychic\\"]"	Mewtwo
151	Normal	"[\\"Psychic\\"]"	Mew
152	Normal	"[\\"Grass\\"]"	Chikorita
153	Normal	"[\\"Grass\\"]"	Bayleef
154	Normal	"[\\"Grass\\"]"	Meganium
155	Normal	"[\\"Fire\\"]"	Cyndaquil
156	Normal	"[\\"Fire\\"]"	Quilava
157	Normal	"[\\"Fire\\"]"	Typhlosion
158	Normal	"[\\"Water\\"]"	Totodile
159	Normal	"[\\"Water\\"]"	Croconaw
160	Normal	"[\\"Water\\"]"	Feraligatr
161	Normal	"[\\"Normal\\"]"	Sentret
162	Normal	"[\\"Normal\\"]"	Furret
163	Normal	"[\\"Normal\\",\\"Flying\\"]"	Hoothoot
164	Normal	"[\\"Normal\\",\\"Flying\\"]"	Noctowl
165	Normal	"[\\"Bug\\",\\"Flying\\"]"	Ledyba
166	Normal	"[\\"Bug\\",\\"Flying\\"]"	Ledian
167	Normal	"[\\"Bug\\",\\"Poison\\"]"	Spinarak
168	Normal	"[\\"Bug\\",\\"Poison\\"]"	Ariados
169	Normal	"[\\"Poison\\",\\"Flying\\"]"	Crobat
170	Normal	"[\\"Water\\",\\"Electric\\"]"	Chinchou
171	Normal	"[\\"Water\\",\\"Electric\\"]"	Lanturn
172	Normal	"[\\"Electric\\"]"	Pichu
173	Normal	"[\\"Fairy\\"]"	Cleffa
174	Normal	"[\\"Normal\\",\\"Fairy\\"]"	Igglybuff
175	Normal	"[\\"Fairy\\"]"	Togepi
176	Normal	"[\\"Fairy\\",\\"Flying\\"]"	Togetic
177	Normal	"[\\"Psychic\\",\\"Flying\\"]"	Natu
178	Normal	"[\\"Psychic\\",\\"Flying\\"]"	Xatu
179	Normal	"[\\"Electric\\"]"	Mareep
180	Normal	"[\\"Electric\\"]"	Flaaffy
181	Normal	"[\\"Electric\\"]"	Ampharos
182	Normal	"[\\"Grass\\"]"	Bellossom
183	Normal	"[\\"Water\\",\\"Fairy\\"]"	Marill
184	Normal	"[\\"Water\\",\\"Fairy\\"]"	Azumarill
185	Normal	"[\\"Rock\\"]"	Sudowoodo
186	Normal	"[\\"Water\\"]"	Politoed
187	Normal	"[\\"Grass\\",\\"Flying\\"]"	Hoppip
188	Normal	"[\\"Grass\\",\\"Flying\\"]"	Skiploom
189	Normal	"[\\"Grass\\",\\"Flying\\"]"	Jumpluff
190	Normal	"[\\"Normal\\"]"	Aipom
191	Normal	"[\\"Grass\\"]"	Sunkern
192	Normal	"[\\"Grass\\"]"	Sunflora
193	Normal	"[\\"Bug\\",\\"Flying\\"]"	Yanma
194	Normal	"[\\"Water\\",\\"Ground\\"]"	Wooper
195	Normal	"[\\"Water\\",\\"Ground\\"]"	Quagsire
196	Normal	"[\\"Psychic\\"]"	Espeon
197	Normal	"[\\"Dark\\"]"	Umbreon
198	Normal	"[\\"Dark\\",\\"Flying\\"]"	Murkrow
199	2022	"[\\"Water\\",\\"Psychic\\"]"	Slowking
199	Galarian	"[\\"Poison\\",\\"Psychic\\"]"	Slowking
199	Normal	"[\\"Water\\",\\"Psychic\\"]"	Slowking
200	Normal	"[\\"Ghost\\"]"	Misdreavus
201	Normal	"[\\"Psychic\\"]"	Unown
202	Normal	"[\\"Psychic\\"]"	Wobbuffet
203	Normal	"[\\"Normal\\",\\"Psychic\\"]"	Girafarig
204	Normal	"[\\"Bug\\"]"	Pineco
205	Normal	"[\\"Bug\\",\\"Steel\\"]"	Forretress
206	Normal	"[\\"Normal\\"]"	Dunsparce
207	Normal	"[\\"Ground\\",\\"Flying\\"]"	Gligar
208	Normal	"[\\"Steel\\",\\"Ground\\"]"	Steelix
209	Normal	"[\\"Fairy\\"]"	Snubbull
210	Normal	"[\\"Fairy\\"]"	Granbull
211	Hisuian	"[\\"Dark\\",\\"Poison\\"]"	Qwilfish
211	Normal	"[\\"Water\\",\\"Poison\\"]"	Qwilfish
212	Normal	"[\\"Bug\\",\\"Steel\\"]"	Scizor
213	Normal	"[\\"Bug\\",\\"Rock\\"]"	Shuckle
214	Normal	"[\\"Bug\\",\\"Fighting\\"]"	Heracross
215	Hisuian	"[\\"Fighting\\",\\"Poison\\"]"	Sneasel
215	Normal	"[\\"Dark\\",\\"Ice\\"]"	Sneasel
216	Normal	"[\\"Normal\\"]"	Teddiursa
217	Normal	"[\\"Normal\\"]"	Ursaring
218	Normal	"[\\"Fire\\"]"	Slugma
219	Normal	"[\\"Fire\\",\\"Rock\\"]"	Magcargo
220	Normal	"[\\"Ice\\",\\"Ground\\"]"	Swinub
221	Normal	"[\\"Ice\\",\\"Ground\\"]"	Piloswine
222	Normal	"[\\"Water\\",\\"Rock\\"]"	Corsola
223	Normal	"[\\"Water\\"]"	Remoraid
224	Normal	"[\\"Water\\"]"	Octillery
225	Normal	"[\\"Ice\\",\\"Flying\\"]"	Delibird
225	Winter_2020	"[\\"Ice\\",\\"Flying\\"]"	Delibird
226	Normal	"[\\"Water\\",\\"Flying\\"]"	Mantine
227	Normal	"[\\"Steel\\",\\"Flying\\"]"	Skarmory
228	Normal	"[\\"Dark\\",\\"Fire\\"]"	Houndour
229	Normal	"[\\"Dark\\",\\"Fire\\"]"	Houndoom
230	Normal	"[\\"Water\\",\\"Dragon\\"]"	Kingdra
231	Normal	"[\\"Ground\\"]"	Phanpy
232	Normal	"[\\"Ground\\"]"	Donphan
233	Normal	"[\\"Normal\\"]"	Porygon2
234	Normal	"[\\"Normal\\"]"	Stantler
235	Normal	"[\\"Normal\\"]"	Smeargle
236	Normal	"[\\"Fighting\\"]"	Tyrogue
237	Normal	"[\\"Fighting\\"]"	Hitmontop
238	Normal	"[\\"Ice\\",\\"Psychic\\"]"	Smoochum
239	Normal	"[\\"Electric\\"]"	Elekid
240	Normal	"[\\"Fire\\"]"	Magby
241	Normal	"[\\"Normal\\"]"	Miltank
242	Normal	"[\\"Normal\\"]"	Blissey
243	Normal	"[\\"Electric\\"]"	Raikou
243	S	"[\\"Electric\\"]"	Raikou
244	Normal	"[\\"Fire\\"]"	Entei
244	S	"[\\"Fire\\"]"	Entei
245	Normal	"[\\"Water\\"]"	Suicune
245	S	"[\\"Water\\"]"	Suicune
246	Normal	"[\\"Rock\\",\\"Ground\\"]"	Larvitar
247	Normal	"[\\"Rock\\",\\"Ground\\"]"	Pupitar
248	Normal	"[\\"Rock\\",\\"Dark\\"]"	Tyranitar
249	Normal	"[\\"Psychic\\",\\"Flying\\"]"	Lugia
249	S	"[\\"Psychic\\",\\"Flying\\"]"	Lugia
250	Normal	"[\\"Fire\\",\\"Flying\\"]"	Ho-Oh
250	S	"[\\"Fire\\",\\"Flying\\"]"	Ho-Oh
251	Normal	"[\\"Psychic\\",\\"Grass\\"]"	Celebi
252	Normal	"[\\"Grass\\"]"	Treecko
253	Normal	"[\\"Grass\\"]"	Grovyle
254	Normal	"[\\"Grass\\"]"	Sceptile
255	Normal	"[\\"Fire\\"]"	Torchic
256	Normal	"[\\"Fire\\",\\"Fighting\\"]"	Combusken
257	Normal	"[\\"Fire\\",\\"Fighting\\"]"	Blaziken
258	Normal	"[\\"Water\\"]"	Mudkip
259	Normal	"[\\"Water\\",\\"Ground\\"]"	Marshtomp
260	Normal	"[\\"Water\\",\\"Ground\\"]"	Swampert
261	Normal	"[\\"Dark\\"]"	Poochyena
262	Normal	"[\\"Dark\\"]"	Mightyena
263	Galarian	"[\\"Dark\\",\\"Normal\\"]"	Zigzagoon
263	Normal	"[\\"Normal\\"]"	Zigzagoon
264	Galarian	"[\\"Dark\\",\\"Normal\\"]"	Linoone
264	Normal	"[\\"Normal\\"]"	Linoone
265	Normal	"[\\"Bug\\"]"	Wurmple
266	Normal	"[\\"Bug\\"]"	Silcoon
267	Normal	"[\\"Bug\\",\\"Flying\\"]"	Beautifly
268	Normal	"[\\"Bug\\"]"	Cascoon
269	Normal	"[\\"Bug\\",\\"Poison\\"]"	Dustox
270	Normal	"[\\"Water\\",\\"Grass\\"]"	Lotad
271	Normal	"[\\"Water\\",\\"Grass\\"]"	Lombre
272	Normal	"[\\"Water\\",\\"Grass\\"]"	Ludicolo
273	Normal	"[\\"Grass\\"]"	Seedot
274	Normal	"[\\"Grass\\",\\"Dark\\"]"	Nuzleaf
275	Normal	"[\\"Grass\\",\\"Dark\\"]"	Shiftry
276	Normal	"[\\"Normal\\",\\"Flying\\"]"	Taillow
277	Normal	"[\\"Normal\\",\\"Flying\\"]"	Swellow
278	Normal	"[\\"Water\\",\\"Flying\\"]"	Wingull
279	Normal	"[\\"Water\\",\\"Flying\\"]"	Pelipper
280	Normal	"[\\"Psychic\\",\\"Fairy\\"]"	Ralts
281	Normal	"[\\"Psychic\\",\\"Fairy\\"]"	Kirlia
282	Normal	"[\\"Psychic\\",\\"Fairy\\"]"	Gardevoir
283	Normal	"[\\"Bug\\",\\"Water\\"]"	Surskit
284	Normal	"[\\"Bug\\",\\"Flying\\"]"	Masquerain
285	Normal	"[\\"Grass\\"]"	Shroomish
286	Normal	"[\\"Grass\\",\\"Fighting\\"]"	Breloom
287	Normal	"[\\"Normal\\"]"	Slakoth
288	Normal	"[\\"Normal\\"]"	Vigoroth
289	Normal	"[\\"Normal\\"]"	Slaking
290	Normal	"[\\"Bug\\",\\"Ground\\"]"	Nincada
291	Normal	"[\\"Bug\\",\\"Flying\\"]"	Ninjask
292	Normal	"[\\"Bug\\",\\"Ghost\\"]"	Shedinja
293	Normal	"[\\"Normal\\"]"	Whismur
294	Normal	"[\\"Normal\\"]"	Loudred
295	Normal	"[\\"Normal\\"]"	Exploud
296	Normal	"[\\"Fighting\\"]"	Makuhita
297	Normal	"[\\"Fighting\\"]"	Hariyama
298	Normal	"[\\"Normal\\",\\"Fairy\\"]"	Azurill
299	Normal	"[\\"Rock\\"]"	Nosepass
300	Normal	"[\\"Normal\\"]"	Skitty
301	Normal	"[\\"Normal\\"]"	Delcatty
302	Costume_2020	"[\\"Dark\\",\\"Ghost\\"]"	Sableye
302	Normal	"[\\"Dark\\",\\"Ghost\\"]"	Sableye
303	Normal	"[\\"Steel\\",\\"Fairy\\"]"	Mawile
304	Normal	"[\\"Steel\\",\\"Rock\\"]"	Aron
305	Normal	"[\\"Steel\\",\\"Rock\\"]"	Lairon
306	Normal	"[\\"Steel\\",\\"Rock\\"]"	Aggron
307	Normal	"[\\"Fighting\\",\\"Psychic\\"]"	Meditite
308	Normal	"[\\"Fighting\\",\\"Psychic\\"]"	Medicham
309	Normal	"[\\"Electric\\"]"	Electrike
310	Normal	"[\\"Electric\\"]"	Manectric
311	Normal	"[\\"Electric\\"]"	Plusle
312	Normal	"[\\"Electric\\"]"	Minun
313	Normal	"[\\"Bug\\"]"	Volbeat
314	Normal	"[\\"Bug\\"]"	Illumise
315	Normal	"[\\"Grass\\",\\"Poison\\"]"	Roselia
316	Normal	"[\\"Poison\\"]"	Gulpin
317	Normal	"[\\"Poison\\"]"	Swalot
318	Normal	"[\\"Water\\",\\"Dark\\"]"	Carvanha
319	Normal	"[\\"Water\\",\\"Dark\\"]"	Sharpedo
320	Normal	"[\\"Water\\"]"	Wailmer
321	Normal	"[\\"Water\\"]"	Wailord
322	Normal	"[\\"Fire\\",\\"Ground\\"]"	Numel
323	Normal	"[\\"Fire\\",\\"Ground\\"]"	Camerupt
324	Normal	"[\\"Fire\\"]"	Torkoal
325	Normal	"[\\"Psychic\\"]"	Spoink
326	Normal	"[\\"Psychic\\"]"	Grumpig
327	Normal	"[\\"Normal\\"]"	Spinda
328	Normal	"[\\"Ground\\"]"	Trapinch
329	Normal	"[\\"Ground\\",\\"Dragon\\"]"	Vibrava
330	Normal	"[\\"Ground\\",\\"Dragon\\"]"	Flygon
331	Normal	"[\\"Grass\\"]"	Cacnea
332	Normal	"[\\"Grass\\",\\"Dark\\"]"	Cacturne
333	Normal	"[\\"Normal\\",\\"Flying\\"]"	Swablu
334	Normal	"[\\"Dragon\\",\\"Flying\\"]"	Altaria
335	Normal	"[\\"Normal\\"]"	Zangoose
336	Normal	"[\\"Poison\\"]"	Seviper
337	Normal	"[\\"Rock\\",\\"Psychic\\"]"	Lunatone
338	Normal	"[\\"Rock\\",\\"Psychic\\"]"	Solrock
339	Normal	"[\\"Water\\",\\"Ground\\"]"	Barboach
340	Normal	"[\\"Water\\",\\"Ground\\"]"	Whiscash
341	Normal	"[\\"Water\\"]"	Corphish
342	Normal	"[\\"Water\\",\\"Dark\\"]"	Crawdaunt
343	Normal	"[\\"Ground\\",\\"Psychic\\"]"	Baltoy
344	Normal	"[\\"Ground\\",\\"Psychic\\"]"	Claydol
345	Normal	"[\\"Rock\\",\\"Grass\\"]"	Lileep
346	Normal	"[\\"Rock\\",\\"Grass\\"]"	Cradily
347	Normal	"[\\"Rock\\",\\"Bug\\"]"	Anorith
348	Normal	"[\\"Rock\\",\\"Bug\\"]"	Armaldo
349	Normal	"[\\"Water\\"]"	Feebas
350	Normal	"[\\"Water\\"]"	Milotic
351	Normal	"[\\"Normal\\"]"	Castform
351	Rainy	"[\\"Water\\"]"	Castform
351	Snowy	"[\\"Ice\\"]"	Castform
351	Sunny	"[\\"Fire\\"]"	Castform
352	Normal	"[\\"Normal\\"]"	Kecleon
353	Normal	"[\\"Ghost\\"]"	Shuppet
354	Normal	"[\\"Ghost\\"]"	Banette
355	Normal	"[\\"Ghost\\"]"	Duskull
356	Normal	"[\\"Ghost\\"]"	Dusclops
357	Normal	"[\\"Grass\\",\\"Flying\\"]"	Tropius
358	Normal	"[\\"Psychic\\"]"	Chimecho
359	Normal	"[\\"Dark\\"]"	Absol
360	Normal	"[\\"Psychic\\"]"	Wynaut
361	Normal	"[\\"Ice\\"]"	Snorunt
362	Normal	"[\\"Ice\\"]"	Glalie
363	Normal	"[\\"Ice\\",\\"Water\\"]"	Spheal
364	Normal	"[\\"Ice\\",\\"Water\\"]"	Sealeo
365	Normal	"[\\"Ice\\",\\"Water\\"]"	Walrein
366	Normal	"[\\"Water\\"]"	Clamperl
367	Normal	"[\\"Water\\"]"	Huntail
368	Normal	"[\\"Water\\"]"	Gorebyss
369	Normal	"[\\"Water\\",\\"Rock\\"]"	Relicanth
370	Normal	"[\\"Water\\"]"	Luvdisc
371	Normal	"[\\"Dragon\\"]"	Bagon
372	Normal	"[\\"Dragon\\"]"	Shelgon
373	Normal	"[\\"Dragon\\",\\"Flying\\"]"	Salamence
374	Normal	"[\\"Steel\\",\\"Psychic\\"]"	Beldum
375	Normal	"[\\"Steel\\",\\"Psychic\\"]"	Metang
376	Normal	"[\\"Steel\\",\\"Psychic\\"]"	Metagross
377	Normal	"[\\"Rock\\"]"	Regirock
378	Normal	"[\\"Ice\\"]"	Regice
379	Normal	"[\\"Steel\\"]"	Registeel
380	Normal	"[\\"Dragon\\",\\"Psychic\\"]"	Latias
380	S	"[\\"Dragon\\",\\"Psychic\\"]"	Latias
381	Normal	"[\\"Dragon\\",\\"Psychic\\"]"	Latios
381	S	"[\\"Dragon\\",\\"Psychic\\"]"	Latios
382	Normal	"[\\"Water\\"]"	Kyogre
383	Normal	"[\\"Ground\\"]"	Groudon
384	Normal	"[\\"Dragon\\",\\"Flying\\"]"	Rayquaza
385	Normal	"[\\"Steel\\",\\"Psychic\\"]"	Jirachi
386	Attack	"[\\"Psychic\\"]"	Deoxys
386	Defense	"[\\"Psychic\\"]"	Deoxys
386	Normal	"[\\"Psychic\\"]"	Deoxys
386	Speed	"[\\"Psychic\\"]"	Deoxys
387	Normal	"[\\"Grass\\"]"	Turtwig
388	Normal	"[\\"Grass\\"]"	Grotle
389	Normal	"[\\"Grass\\",\\"Ground\\"]"	Torterra
390	Normal	"[\\"Fire\\"]"	Chimchar
391	Normal	"[\\"Fire\\",\\"Fighting\\"]"	Monferno
392	Normal	"[\\"Fire\\",\\"Fighting\\"]"	Infernape
393	Normal	"[\\"Water\\"]"	Piplup
394	Normal	"[\\"Water\\"]"	Prinplup
395	Normal	"[\\"Water\\",\\"Steel\\"]"	Empoleon
396	Normal	"[\\"Normal\\",\\"Flying\\"]"	Starly
397	Normal	"[\\"Normal\\",\\"Flying\\"]"	Staravia
398	Normal	"[\\"Normal\\",\\"Flying\\"]"	Staraptor
399	Normal	"[\\"Normal\\"]"	Bidoof
400	Normal	"[\\"Normal\\",\\"Water\\"]"	Bibarel
401	Normal	"[\\"Bug\\"]"	Kricketot
402	Normal	"[\\"Bug\\"]"	Kricketune
403	Normal	"[\\"Electric\\"]"	Shinx
404	Normal	"[\\"Electric\\"]"	Luxio
405	Normal	"[\\"Electric\\"]"	Luxray
406	Normal	"[\\"Grass\\",\\"Poison\\"]"	Budew
407	Normal	"[\\"Grass\\",\\"Poison\\"]"	Roserade
408	Normal	"[\\"Rock\\"]"	Cranidos
409	Normal	"[\\"Rock\\"]"	Rampardos
410	Normal	"[\\"Rock\\",\\"Steel\\"]"	Shieldon
411	Normal	"[\\"Rock\\",\\"Steel\\"]"	Bastiodon
412	Plant	"[\\"Bug\\"]"	Burmy
412	Sandy	"[\\"Bug\\"]"	Burmy
412	Trash	"[\\"Bug\\"]"	Burmy
413	Plant	"[\\"Bug\\",\\"Grass\\"]"	Wormadam
413	Sandy	"[\\"Bug\\",\\"Ground\\"]"	Wormadam
413	Trash	"[\\"Bug\\",\\"Steel\\"]"	Wormadam
414	Normal	"[\\"Bug\\",\\"Flying\\"]"	Mothim
415	Normal	"[\\"Bug\\",\\"Flying\\"]"	Combee
416	Normal	"[\\"Bug\\",\\"Flying\\"]"	Vespiquen
417	Normal	"[\\"Electric\\"]"	Pachirisu
418	Normal	"[\\"Water\\"]"	Buizel
419	Normal	"[\\"Water\\"]"	Floatzel
420	Normal	"[\\"Grass\\"]"	Cherubi
421	Overcast	"[\\"Grass\\"]"	Cherrim
421	Sunny	"[\\"Grass\\"]"	Cherrim
422	East_sea	"[\\"Water\\"]"	Shellos
422	West_sea	"[\\"Water\\"]"	Shellos
423	East_sea	"[\\"Water\\",\\"Ground\\"]"	Gastrodon
423	West_sea	"[\\"Water\\",\\"Ground\\"]"	Gastrodon
424	Normal	"[\\"Normal\\"]"	Ambipom
425	Normal	"[\\"Ghost\\",\\"Flying\\"]"	Drifloon
426	Normal	"[\\"Ghost\\",\\"Flying\\"]"	Drifblim
427	Normal	"[\\"Normal\\"]"	Buneary
428	Normal	"[\\"Normal\\"]"	Lopunny
429	Normal	"[\\"Ghost\\"]"	Mismagius
430	Normal	"[\\"Dark\\",\\"Flying\\"]"	Honchkrow
431	Normal	"[\\"Normal\\"]"	Glameow
432	Normal	"[\\"Normal\\"]"	Purugly
433	Normal	"[\\"Psychic\\"]"	Chingling
434	Normal	"[\\"Poison\\",\\"Dark\\"]"	Stunky
435	Normal	"[\\"Poison\\",\\"Dark\\"]"	Skuntank
436	Normal	"[\\"Steel\\",\\"Psychic\\"]"	Bronzor
437	Normal	"[\\"Steel\\",\\"Psychic\\"]"	Bronzong
438	Normal	"[\\"Rock\\"]"	Bonsly
439	Normal	"[\\"Psychic\\",\\"Fairy\\"]"	Mime Jr.
440	Normal	"[\\"Normal\\"]"	Happiny
441	Normal	"[\\"Normal\\",\\"Flying\\"]"	Chatot
442	Normal	"[\\"Ghost\\",\\"Dark\\"]"	Spiritomb
443	Normal	"[\\"Dragon\\",\\"Ground\\"]"	Gible
444	Normal	"[\\"Dragon\\",\\"Ground\\"]"	Gabite
445	Normal	"[\\"Dragon\\",\\"Ground\\"]"	Garchomp
446	Normal	"[\\"Normal\\"]"	Munchlax
447	Normal	"[\\"Fighting\\"]"	Riolu
448	Normal	"[\\"Fighting\\",\\"Steel\\"]"	Lucario
449	Normal	"[\\"Ground\\"]"	Hippopotas
450	Normal	"[\\"Ground\\"]"	Hippowdon
451	Normal	"[\\"Poison\\",\\"Bug\\"]"	Skorupi
452	Normal	"[\\"Poison\\",\\"Dark\\"]"	Drapion
453	Normal	"[\\"Poison\\",\\"Fighting\\"]"	Croagunk
454	Normal	"[\\"Poison\\",\\"Fighting\\"]"	Toxicroak
455	Normal	"[\\"Grass\\"]"	Carnivine
456	Normal	"[\\"Water\\"]"	Finneon
457	Normal	"[\\"Water\\"]"	Lumineon
458	Normal	"[\\"Water\\",\\"Flying\\"]"	Mantyke
459	Normal	"[\\"Grass\\",\\"Ice\\"]"	Snover
460	Normal	"[\\"Grass\\",\\"Ice\\"]"	Abomasnow
461	Normal	"[\\"Dark\\",\\"Ice\\"]"	Weavile
462	Normal	"[\\"Electric\\",\\"Steel\\"]"	Magnezone
463	Normal	"[\\"Normal\\"]"	Lickilicky
464	Normal	"[\\"Ground\\",\\"Rock\\"]"	Rhyperior
465	Normal	"[\\"Grass\\"]"	Tangrowth
466	Normal	"[\\"Electric\\"]"	Electivire
467	Normal	"[\\"Fire\\"]"	Magmortar
468	Normal	"[\\"Fairy\\",\\"Flying\\"]"	Togekiss
469	Normal	"[\\"Bug\\",\\"Flying\\"]"	Yanmega
470	Normal	"[\\"Grass\\"]"	Leafeon
471	Normal	"[\\"Ice\\"]"	Glaceon
472	Normal	"[\\"Ground\\",\\"Flying\\"]"	Gliscor
473	Normal	"[\\"Ice\\",\\"Ground\\"]"	Mamoswine
474	Normal	"[\\"Normal\\"]"	Porygon-Z
475	Normal	"[\\"Psychic\\",\\"Fighting\\"]"	Gallade
476	Normal	"[\\"Rock\\",\\"Steel\\"]"	Probopass
477	Normal	"[\\"Ghost\\"]"	Dusknoir
478	Normal	"[\\"Ice\\",\\"Ghost\\"]"	Froslass
479	Fan	"[\\"Electric\\",\\"Flying\\"]"	Rotom
479	Frost	"[\\"Electric\\",\\"Ice\\"]"	Rotom
479	Heat	"[\\"Electric\\",\\"Fire\\"]"	Rotom
479	Mow	"[\\"Electric\\",\\"Grass\\"]"	Rotom
479	Normal	"[\\"Electric\\",\\"Ghost\\"]"	Rotom
479	Wash	"[\\"Electric\\",\\"Water\\"]"	Rotom
480	Normal	"[\\"Psychic\\"]"	Uxie
481	Normal	"[\\"Psychic\\"]"	Mesprit
482	Normal	"[\\"Psychic\\"]"	Azelf
483	Normal	"[\\"Steel\\",\\"Dragon\\"]"	Dialga
484	Normal	"[\\"Water\\",\\"Dragon\\"]"	Palkia
485	Normal	"[\\"Fire\\",\\"Steel\\"]"	Heatran
486	Normal	"[\\"Normal\\"]"	Regigigas
487	Altered	"[\\"Ghost\\",\\"Dragon\\"]"	Giratina
487	Origin	"[\\"Ghost\\",\\"Dragon\\"]"	Giratina
488	Normal	"[\\"Psychic\\"]"	Cresselia
489	Normal	"[\\"Water\\"]"	Phione
490	Normal	"[\\"Water\\"]"	Manaphy
491	Normal	"[\\"Dark\\"]"	Darkrai
492	Land	"[\\"Grass\\"]"	Shaymin
492	Sky	"[\\"Grass\\",\\"Flying\\"]"	Shaymin
493	Bug	"[\\"Bug\\"]"	Arceus
493	Dark	"[\\"Dark\\"]"	Arceus
493	Dragon	"[\\"Dragon\\"]"	Arceus
493	Electric	"[\\"Electric\\"]"	Arceus
493	Fairy	"[\\"Fairy\\"]"	Arceus
493	Fighting	"[\\"Fighting\\"]"	Arceus
493	Fire	"[\\"Fire\\"]"	Arceus
493	Flying	"[\\"Flying\\"]"	Arceus
493	Ghost	"[\\"Ghost\\"]"	Arceus
493	Grass	"[\\"Grass\\"]"	Arceus
493	Ground	"[\\"Ground\\"]"	Arceus
493	Ice	"[\\"Ice\\"]"	Arceus
493	Normal	"[\\"Normal\\"]"	Arceus
493	Poison	"[\\"Poison\\"]"	Arceus
493	Psychic	"[\\"Psychic\\"]"	Arceus
493	Rock	"[\\"Rock\\"]"	Arceus
493	Steel	"[\\"Steel\\"]"	Arceus
493	Water	"[\\"Water\\"]"	Arceus
494	Normal	"[\\"Psychic\\",\\"Fire\\"]"	Victini
495	Normal	"[\\"Grass\\"]"	Snivy
496	Normal	"[\\"Grass\\"]"	Servine
497	Normal	"[\\"Grass\\"]"	Serperior
498	Normal	"[\\"Fire\\"]"	Tepig
499	Normal	"[\\"Fire\\",\\"Fighting\\"]"	Pignite
500	Normal	"[\\"Fire\\",\\"Fighting\\"]"	Emboar
501	Normal	"[\\"Water\\"]"	Oshawott
502	Normal	"[\\"Water\\"]"	Dewott
503	Normal	"[\\"Water\\"]"	Samurott
504	Normal	"[\\"Normal\\"]"	Patrat
505	Normal	"[\\"Normal\\"]"	Watchog
506	Normal	"[\\"Normal\\"]"	Lillipup
507	Normal	"[\\"Normal\\"]"	Herdier
508	Normal	"[\\"Normal\\"]"	Stoutland
509	Normal	"[\\"Dark\\"]"	Purrloin
510	Normal	"[\\"Dark\\"]"	Liepard
511	Normal	"[\\"Grass\\"]"	Pansage
512	Normal	"[\\"Grass\\"]"	Simisage
513	Normal	"[\\"Fire\\"]"	Pansear
514	Normal	"[\\"Fire\\"]"	Simisear
515	Normal	"[\\"Water\\"]"	Panpour
516	Normal	"[\\"Water\\"]"	Simipour
517	Normal	"[\\"Psychic\\"]"	Munna
518	Normal	"[\\"Psychic\\"]"	Musharna
519	Normal	"[\\"Normal\\",\\"Flying\\"]"	Pidove
520	Normal	"[\\"Normal\\",\\"Flying\\"]"	Tranquill
521	Normal	"[\\"Normal\\",\\"Flying\\"]"	Unfezant
522	Normal	"[\\"Electric\\"]"	Blitzle
523	Normal	"[\\"Electric\\"]"	Zebstrika
524	Normal	"[\\"Rock\\"]"	Roggenrola
525	Normal	"[\\"Rock\\"]"	Boldore
526	Normal	"[\\"Rock\\"]"	Gigalith
527	Normal	"[\\"Psychic\\",\\"Flying\\"]"	Woobat
528	Normal	"[\\"Psychic\\",\\"Flying\\"]"	Swoobat
529	Normal	"[\\"Ground\\"]"	Drilbur
530	Normal	"[\\"Ground\\",\\"Steel\\"]"	Excadrill
531	Normal	"[\\"Normal\\"]"	Audino
532	Normal	"[\\"Fighting\\"]"	Timburr
533	Normal	"[\\"Fighting\\"]"	Gurdurr
534	Normal	"[\\"Fighting\\"]"	Conkeldurr
535	Normal	"[\\"Water\\"]"	Tympole
536	Normal	"[\\"Water\\",\\"Ground\\"]"	Palpitoad
537	Normal	"[\\"Water\\",\\"Ground\\"]"	Seismitoad
538	Normal	"[\\"Fighting\\"]"	Throh
539	Normal	"[\\"Fighting\\"]"	Sawk
540	Normal	"[\\"Bug\\",\\"Grass\\"]"	Sewaddle
541	Normal	"[\\"Bug\\",\\"Grass\\"]"	Swadloon
542	Normal	"[\\"Bug\\",\\"Grass\\"]"	Leavanny
543	Normal	"[\\"Bug\\",\\"Poison\\"]"	Venipede
544	Normal	"[\\"Bug\\",\\"Poison\\"]"	Whirlipede
545	Normal	"[\\"Bug\\",\\"Poison\\"]"	Scolipede
546	Normal	"[\\"Grass\\",\\"Fairy\\"]"	Cottonee
547	Normal	"[\\"Grass\\",\\"Fairy\\"]"	Whimsicott
548	Normal	"[\\"Grass\\"]"	Petilil
549	Normal	"[\\"Grass\\"]"	Lilligant
550	Blue_striped	"[\\"Water\\"]"	Basculin
550	Red_striped	"[\\"Water\\"]"	Basculin
551	Normal	"[\\"Ground\\",\\"Dark\\"]"	Sandile
552	Normal	"[\\"Ground\\",\\"Dark\\"]"	Krokorok
553	Normal	"[\\"Ground\\",\\"Dark\\"]"	Krookodile
554	Galarian	"[\\"Ice\\"]"	Darumaka
554	Normal	"[\\"Fire\\"]"	Darumaka
555	Galarian_standard	"[\\"Ice\\"]"	Darmanitan
555	Galarian_zen	"[\\"Ice\\",\\"Fire\\"]"	Darmanitan
555	Standard	"[\\"Fire\\"]"	Darmanitan
555	Zen	"[\\"Fire\\",\\"Psychic\\"]"	Darmanitan
556	Normal	"[\\"Grass\\"]"	Maractus
557	Normal	"[\\"Bug\\",\\"Rock\\"]"	Dwebble
558	Normal	"[\\"Bug\\",\\"Rock\\"]"	Crustle
559	Normal	"[\\"Dark\\",\\"Fighting\\"]"	Scraggy
560	Normal	"[\\"Dark\\",\\"Fighting\\"]"	Scrafty
561	Normal	"[\\"Psychic\\",\\"Flying\\"]"	Sigilyph
562	Galarian	"[\\"Ground\\",\\"Ghost\\"]"	Yamask
562	Normal	"[\\"Ghost\\"]"	Yamask
563	Normal	"[\\"Ghost\\"]"	Cofagrigus
564	Normal	"[\\"Water\\",\\"Rock\\"]"	Tirtouga
565	Normal	"[\\"Water\\",\\"Rock\\"]"	Carracosta
566	Normal	"[\\"Rock\\",\\"Flying\\"]"	Archen
567	Normal	"[\\"Rock\\",\\"Flying\\"]"	Archeops
568	Normal	"[\\"Poison\\"]"	Trubbish
569	Normal	"[\\"Poison\\"]"	Garbodor
570	Normal	"[\\"Dark\\"]"	Zorua
571	Normal	"[\\"Dark\\"]"	Zoroark
572	Normal	"[\\"Normal\\"]"	Minccino
573	Normal	"[\\"Normal\\"]"	Cinccino
574	Normal	"[\\"Psychic\\"]"	Gothita
575	Normal	"[\\"Psychic\\"]"	Gothorita
576	Normal	"[\\"Psychic\\"]"	Gothitelle
577	Normal	"[\\"Psychic\\"]"	Solosis
578	Normal	"[\\"Psychic\\"]"	Duosion
579	Normal	"[\\"Psychic\\"]"	Reuniclus
580	Normal	"[\\"Water\\",\\"Flying\\"]"	Ducklett
581	Normal	"[\\"Water\\",\\"Flying\\"]"	Swanna
582	Normal	"[\\"Ice\\"]"	Vanillite
583	Normal	"[\\"Ice\\"]"	Vanillish
584	Normal	"[\\"Ice\\"]"	Vanilluxe
585	Autumn	"[\\"Normal\\",\\"Grass\\"]"	Deerling
585	Spring	"[\\"Normal\\",\\"Grass\\"]"	Deerling
585	Summer	"[\\"Normal\\",\\"Grass\\"]"	Deerling
585	Winter	"[\\"Normal\\",\\"Grass\\"]"	Deerling
586	Autumn	"[\\"Normal\\",\\"Grass\\"]"	Sawsbuck
586	Spring	"[\\"Normal\\",\\"Grass\\"]"	Sawsbuck
586	Summer	"[\\"Normal\\",\\"Grass\\"]"	Sawsbuck
586	Winter	"[\\"Normal\\",\\"Grass\\"]"	Sawsbuck
587	Normal	"[\\"Electric\\",\\"Flying\\"]"	Emolga
588	Normal	"[\\"Bug\\"]"	Karrablast
589	Normal	"[\\"Bug\\",\\"Steel\\"]"	Escavalier
590	Normal	"[\\"Grass\\",\\"Poison\\"]"	Foongus
591	Normal	"[\\"Grass\\",\\"Poison\\"]"	Amoonguss
592	Female	"[\\"Water\\",\\"Ghost\\"]"	Frillish
592	Normal	"[\\"Water\\",\\"Ghost\\"]"	Frillish
593	Female	"[\\"Water\\",\\"Ghost\\"]"	Jellicent
593	Normal	"[\\"Water\\",\\"Ghost\\"]"	Jellicent
594	Normal	"[\\"Water\\"]"	Alomomola
595	Normal	"[\\"Bug\\",\\"Electric\\"]"	Joltik
596	Normal	"[\\"Bug\\",\\"Electric\\"]"	Galvantula
597	Normal	"[\\"Grass\\",\\"Steel\\"]"	Ferroseed
598	Normal	"[\\"Grass\\",\\"Steel\\"]"	Ferrothorn
599	Normal	"[\\"Steel\\"]"	Klink
600	Normal	"[\\"Steel\\"]"	Klang
601	Normal	"[\\"Steel\\"]"	Klinklang
602	Normal	"[\\"Electric\\"]"	Tynamo
603	Normal	"[\\"Electric\\"]"	Eelektrik
604	Normal	"[\\"Electric\\"]"	Eelektross
605	Normal	"[\\"Psychic\\"]"	Elgyem
606	Normal	"[\\"Psychic\\"]"	Beheeyem
607	Normal	"[\\"Ghost\\",\\"Fire\\"]"	Litwick
608	Normal	"[\\"Ghost\\",\\"Fire\\"]"	Lampent
609	Normal	"[\\"Ghost\\",\\"Fire\\"]"	Chandelure
610	Normal	"[\\"Dragon\\"]"	Axew
611	Normal	"[\\"Dragon\\"]"	Fraxure
612	Normal	"[\\"Dragon\\"]"	Haxorus
613	Normal	"[\\"Ice\\"]"	Cubchoo
613	Winter_2020	"[\\"Ice\\"]"	Cubchoo
614	Normal	"[\\"Ice\\"]"	Beartic
614	Winter_2020	"[\\"Ice\\"]"	Beartic
615	Normal	"[\\"Ice\\"]"	Cryogonal
616	Normal	"[\\"Bug\\"]"	Shelmet
617	Normal	"[\\"Bug\\"]"	Accelgor
618	Galarian	"[\\"Ground\\",\\"Steel\\"]"	Stunfisk
618	Normal	"[\\"Ground\\",\\"Electric\\"]"	Stunfisk
619	Normal	"[\\"Fighting\\"]"	Mienfoo
620	Normal	"[\\"Fighting\\"]"	Mienshao
621	Normal	"[\\"Dragon\\"]"	Druddigon
622	Normal	"[\\"Ground\\",\\"Ghost\\"]"	Golett
623	Normal	"[\\"Ground\\",\\"Ghost\\"]"	Golurk
624	Normal	"[\\"Dark\\",\\"Steel\\"]"	Pawniard
625	Normal	"[\\"Dark\\",\\"Steel\\"]"	Bisharp
626	Normal	"[\\"Normal\\"]"	Bouffalant
627	Normal	"[\\"Normal\\",\\"Flying\\"]"	Rufflet
628	Hisuian	"[\\"Psychic\\",\\"Flying\\"]"	Braviary
628	Normal	"[\\"Normal\\",\\"Flying\\"]"	Braviary
629	Normal	"[\\"Dark\\",\\"Flying\\"]"	Vullaby
630	Normal	"[\\"Dark\\",\\"Flying\\"]"	Mandibuzz
631	Normal	"[\\"Fire\\"]"	Heatmor
632	Normal	"[\\"Bug\\",\\"Steel\\"]"	Durant
633	Normal	"[\\"Dark\\",\\"Dragon\\"]"	Deino
634	Normal	"[\\"Dark\\",\\"Dragon\\"]"	Zweilous
635	Normal	"[\\"Dark\\",\\"Dragon\\"]"	Hydreigon
636	Normal	"[\\"Bug\\",\\"Fire\\"]"	Larvesta
637	Normal	"[\\"Bug\\",\\"Fire\\"]"	Volcarona
638	Normal	"[\\"Steel\\",\\"Fighting\\"]"	Cobalion
639	Normal	"[\\"Rock\\",\\"Fighting\\"]"	Terrakion
640	Normal	"[\\"Grass\\",\\"Fighting\\"]"	Virizion
641	Incarnate	"[\\"Flying\\"]"	Tornadus
641	Therian	"[\\"Flying\\"]"	Tornadus
642	Incarnate	"[\\"Electric\\",\\"Flying\\"]"	Thundurus
642	Therian	"[\\"Electric\\",\\"Flying\\"]"	Thundurus
643	Normal	"[\\"Dragon\\",\\"Fire\\"]"	Reshiram
644	Normal	"[\\"Dragon\\",\\"Electric\\"]"	Zekrom
645	Incarnate	"[\\"Ground\\",\\"Flying\\"]"	Landorus
645	Therian	"[\\"Ground\\",\\"Flying\\"]"	Landorus
646	Black	"[\\"Dragon\\",\\"Ice\\"]"	Kyurem
646	Normal	"[\\"Dragon\\",\\"Ice\\"]"	Kyurem
646	White	"[\\"Dragon\\",\\"Ice\\"]"	Kyurem
647	Ordinary	"[\\"Water\\",\\"Fighting\\"]"	Keldeo
647	Resolute	"[\\"Water\\",\\"Fighting\\"]"	Keldeo
648	Aria	"[\\"Normal\\",\\"Psychic\\"]"	Meloetta
648	Pirouette	"[\\"Normal\\",\\"Fighting\\"]"	Meloetta
649	Burn	"[\\"Bug\\",\\"Steel\\"]"	Genesect
649	Chill	"[\\"Bug\\",\\"Steel\\"]"	Genesect
649	Douse	"[\\"Bug\\",\\"Steel\\"]"	Genesect
649	Normal	"[\\"Bug\\",\\"Steel\\"]"	Genesect
649	Shock	"[\\"Bug\\",\\"Steel\\"]"	Genesect
650	Normal	"[\\"Grass\\"]"	Chespin
651	Normal	"[\\"Grass\\"]"	Quilladin
652	Normal	"[\\"Grass\\",\\"Fighting\\"]"	Chesnaught
653	Normal	"[\\"Fire\\"]"	Fennekin
654	Normal	"[\\"Fire\\"]"	Braixen
655	Normal	"[\\"Fire\\",\\"Psychic\\"]"	Delphox
656	Normal	"[\\"Water\\"]"	Froakie
657	Normal	"[\\"Water\\"]"	Frogadier
658	Normal	"[\\"Water\\",\\"Dark\\"]"	Greninja
659	Normal	"[\\"Normal\\"]"	Bunnelby
660	Normal	"[\\"Normal\\",\\"Ground\\"]"	Diggersby
661	Normal	"[\\"Normal\\",\\"Flying\\"]"	Fletchling
662	Normal	"[\\"Fire\\",\\"Flying\\"]"	Fletchinder
663	Normal	"[\\"Fire\\",\\"Flying\\"]"	Talonflame
664	Archipelago	"[\\"Bug\\"]"	Scatterbug
664	Continental	"[\\"Bug\\"]"	Scatterbug
664	Elegant	"[\\"Bug\\"]"	Scatterbug
664	Fancy	"[\\"Bug\\"]"	Scatterbug
664	Garden	"[\\"Bug\\"]"	Scatterbug
664	High_plains	"[\\"Bug\\"]"	Scatterbug
664	Icy_snow	"[\\"Bug\\"]"	Scatterbug
664	Jungle	"[\\"Bug\\"]"	Scatterbug
664	Marine	"[\\"Bug\\"]"	Scatterbug
664	Meadow	"[\\"Bug\\"]"	Scatterbug
664	Modern	"[\\"Bug\\"]"	Scatterbug
664	Monsoon	"[\\"Bug\\"]"	Scatterbug
664	Ocean	"[\\"Bug\\"]"	Scatterbug
664	Pokeball	"[\\"Bug\\"]"	Scatterbug
664	Polar	"[\\"Bug\\"]"	Scatterbug
664	River	"[\\"Bug\\"]"	Scatterbug
664	Sandstorm	"[\\"Bug\\"]"	Scatterbug
664	Savanna	"[\\"Bug\\"]"	Scatterbug
664	Sun	"[\\"Bug\\"]"	Scatterbug
664	Tundra	"[\\"Bug\\"]"	Scatterbug
665	Archipelago	"[\\"Bug\\"]"	Spewpa
665	Continental	"[\\"Bug\\"]"	Spewpa
665	Elegant	"[\\"Bug\\"]"	Spewpa
665	Fancy	"[\\"Bug\\"]"	Spewpa
665	Garden	"[\\"Bug\\"]"	Spewpa
665	High_plains	"[\\"Bug\\"]"	Spewpa
665	Icy_snow	"[\\"Bug\\"]"	Spewpa
665	Jungle	"[\\"Bug\\"]"	Spewpa
665	Marine	"[\\"Bug\\"]"	Spewpa
665	Meadow	"[\\"Bug\\"]"	Spewpa
665	Modern	"[\\"Bug\\"]"	Spewpa
665	Monsoon	"[\\"Bug\\"]"	Spewpa
665	Ocean	"[\\"Bug\\"]"	Spewpa
665	Pokeball	"[\\"Bug\\"]"	Spewpa
665	Polar	"[\\"Bug\\"]"	Spewpa
665	River	"[\\"Bug\\"]"	Spewpa
665	Sandstorm	"[\\"Bug\\"]"	Spewpa
665	Savanna	"[\\"Bug\\"]"	Spewpa
665	Sun	"[\\"Bug\\"]"	Spewpa
665	Tundra	"[\\"Bug\\"]"	Spewpa
666	Archipelago	"[\\"Bug\\",\\"Flying\\"]"	Vivillon
666	Continental	"[\\"Bug\\",\\"Flying\\"]"	Vivillon
666	Elegant	"[\\"Bug\\",\\"Flying\\"]"	Vivillon
666	Fancy	"[\\"Bug\\",\\"Flying\\"]"	Vivillon
666	Garden	"[\\"Bug\\",\\"Flying\\"]"	Vivillon
666	High_plains	"[\\"Bug\\",\\"Flying\\"]"	Vivillon
666	Icy_snow	"[\\"Bug\\",\\"Flying\\"]"	Vivillon
666	Jungle	"[\\"Bug\\",\\"Flying\\"]"	Vivillon
666	Marine	"[\\"Bug\\",\\"Flying\\"]"	Vivillon
666	Meadow	"[\\"Bug\\",\\"Flying\\"]"	Vivillon
666	Modern	"[\\"Bug\\",\\"Flying\\"]"	Vivillon
666	Monsoon	"[\\"Bug\\",\\"Flying\\"]"	Vivillon
666	Ocean	"[\\"Bug\\",\\"Flying\\"]"	Vivillon
666	Pokeball	"[\\"Bug\\",\\"Flying\\"]"	Vivillon
666	Polar	"[\\"Bug\\",\\"Flying\\"]"	Vivillon
666	River	"[\\"Bug\\",\\"Flying\\"]"	Vivillon
666	Sandstorm	"[\\"Bug\\",\\"Flying\\"]"	Vivillon
666	Savanna	"[\\"Bug\\",\\"Flying\\"]"	Vivillon
666	Sun	"[\\"Bug\\",\\"Flying\\"]"	Vivillon
666	Tundra	"[\\"Bug\\",\\"Flying\\"]"	Vivillon
667	Normal	"[\\"Fire\\",\\"Normal\\"]"	Litleo
668	Female	"[\\"Fire\\",\\"Normal\\"]"	Pyroar
668	Normal	"[\\"Fire\\",\\"Normal\\"]"	Pyroar
669	Blue	"[\\"Fairy\\"]"	Flabebe
669	Orange	"[\\"Fairy\\"]"	Flabebe
669	Red	"[\\"Fairy\\"]"	Flabebe
669	White	"[\\"Fairy\\"]"	Flabebe
669	Yellow	"[\\"Fairy\\"]"	Flabebe
670	Blue	"[\\"Fairy\\"]"	Floette
670	Orange	"[\\"Fairy\\"]"	Floette
670	Red	"[\\"Fairy\\"]"	Floette
670	White	"[\\"Fairy\\"]"	Floette
670	Yellow	"[\\"Fairy\\"]"	Floette
671	Blue	"[\\"Fairy\\"]"	Florges
671	Orange	"[\\"Fairy\\"]"	Florges
671	Red	"[\\"Fairy\\"]"	Florges
671	White	"[\\"Fairy\\"]"	Florges
671	Yellow	"[\\"Fairy\\"]"	Florges
672	Normal	"[\\"Grass\\"]"	Skiddo
673	Normal	"[\\"Grass\\"]"	Gogoat
674	Normal	"[\\"Fighting\\"]"	Pancham
675	Normal	"[\\"Fighting\\",\\"Dark\\"]"	Pangoro
676	Dandy	"[\\"Normal\\"]"	Furfrou
676	Debutante	"[\\"Normal\\"]"	Furfrou
676	Diamond	"[\\"Normal\\"]"	Furfrou
676	Heart	"[\\"Normal\\"]"	Furfrou
676	Kabuki	"[\\"Normal\\"]"	Furfrou
676	La_reine	"[\\"Normal\\"]"	Furfrou
676	Matron	"[\\"Normal\\"]"	Furfrou
676	Natural	"[\\"Normal\\"]"	Furfrou
676	Pharaoh	"[\\"Normal\\"]"	Furfrou
676	Star	"[\\"Normal\\"]"	Furfrou
677	Normal	"[\\"Psychic\\"]"	Espurr
678	Female	"[\\"Psychic\\"]"	Meowstic
678	Normal	"[\\"Psychic\\"]"	Meowstic
679	Normal	"[\\"Steel\\",\\"Ghost\\"]"	Honedge
680	Normal	"[\\"Steel\\",\\"Ghost\\"]"	Doublade
681	Normal	"[\\"Steel\\",\\"Ghost\\"]"	Aegislash
682	Normal	"[\\"Fairy\\"]"	Spritzee
683	Normal	"[\\"Fairy\\"]"	Aromatisse
684	Normal	"[\\"Fairy\\"]"	Swirlix
685	Normal	"[\\"Fairy\\"]"	Slurpuff
686	Normal	"[\\"Dark\\",\\"Psychic\\"]"	Inkay
687	Normal	"[\\"Dark\\",\\"Psychic\\"]"	Malamar
688	Normal	"[\\"Rock\\",\\"Water\\"]"	Binacle
689	Normal	"[\\"Rock\\",\\"Water\\"]"	Barbaracle
690	Normal	"[\\"Poison\\",\\"Water\\"]"	Skrelp
691	Normal	"[\\"Poison\\",\\"Dragon\\"]"	Dragalge
692	Normal	"[\\"Water\\"]"	Clauncher
693	Normal	"[\\"Water\\"]"	Clawitzer
694	Normal	"[\\"Electric\\",\\"Normal\\"]"	Helioptile
695	Normal	"[\\"Electric\\",\\"Normal\\"]"	Heliolisk
696	Normal	"[\\"Rock\\",\\"Dragon\\"]"	Tyrunt
697	Normal	"[\\"Rock\\",\\"Dragon\\"]"	Tyrantrum
698	Normal	"[\\"Rock\\",\\"Ice\\"]"	Amaura
699	Normal	"[\\"Rock\\",\\"Ice\\"]"	Aurorus
700	Normal	"[\\"Fairy\\"]"	Sylveon
701	Normal	"[\\"Fighting\\",\\"Flying\\"]"	Hawlucha
702	Normal	"[\\"Electric\\",\\"Fairy\\"]"	Dedenne
703	Normal	"[\\"Rock\\",\\"Fairy\\"]"	Carbink
704	Normal	"[\\"Dragon\\"]"	Goomy
705	Normal	"[\\"Dragon\\"]"	Sliggoo
706	Normal	"[\\"Dragon\\"]"	Goodra
707	Normal	"[\\"Steel\\",\\"Fairy\\"]"	Klefki
708	Normal	"[\\"Ghost\\",\\"Grass\\"]"	Phantump
709	Normal	"[\\"Ghost\\",\\"Grass\\"]"	Trevenant
710	Average	"[\\"Ghost\\",\\"Grass\\"]"	Pumpkaboo
710	Large	"[\\"Ghost\\",\\"Grass\\"]"	Pumpkaboo
710	Small	"[\\"Ghost\\",\\"Grass\\"]"	Pumpkaboo
710	Super	"[\\"Ghost\\",\\"Grass\\"]"	Pumpkaboo
711	Average	"[\\"Ghost\\",\\"Grass\\"]"	Gourgeist
711	Large	"[\\"Ghost\\",\\"Grass\\"]"	Gourgeist
711	Small	"[\\"Ghost\\",\\"Grass\\"]"	Gourgeist
711	Super	"[\\"Ghost\\",\\"Grass\\"]"	Gourgeist
712	Normal	"[\\"Ice\\"]"	Bergmite
713	Hisuian	"[\\"Ice\\",\\"Rock\\"]"	Avalugg
713	Normal	"[\\"Ice\\"]"	Avalugg
714	Normal	"[\\"Flying\\",\\"Dragon\\"]"	Noibat
715	Normal	"[\\"Flying\\",\\"Dragon\\"]"	Noivern
716	Normal	"[\\"Fairy\\"]"	Xerneas
717	Normal	"[\\"Dark\\",\\"Flying\\"]"	Yveltal
718	Normal	"[\\"Dragon\\",\\"Ground\\"]"	Zygarde
719	Normal	"[\\"Rock\\",\\"Fairy\\"]"	Diancie
720	Confined	"[\\"Psychic\\",\\"Ghost\\"]"	Hoopa
720	Unbound	"[\\"Psychic\\",\\"Dark\\"]"	Hoopa
721	Normal	"[\\"Fire\\",\\"Water\\"]"	Volcanion
722	Normal	"[\\"Grass\\",\\"Flying\\"]"	Rowlet
723	Normal	"[\\"Grass\\",\\"Flying\\"]"	Dartrix
724	Normal	"[\\"Grass\\",\\"Ghost\\"]"	Decidueye
725	Normal	"[\\"Fire\\"]"	Litten
726	Normal	"[\\"Fire\\"]"	Torracat
727	Normal	"[\\"Fire\\",\\"Dark\\"]"	Incineroar
728	Normal	"[\\"Water\\"]"	Popplio
729	Normal	"[\\"Water\\"]"	Brionne
730	Normal	"[\\"Water\\",\\"Fairy\\"]"	Primarina
731	Normal	"[\\"Normal\\",\\"Flying\\"]"	Pikipek
732	Normal	"[\\"Normal\\",\\"Flying\\"]"	Trumbeak
733	Normal	"[\\"Normal\\",\\"Flying\\"]"	Toucannon
734	Normal	"[\\"Normal\\"]"	Yungoos
735	Normal	"[\\"Normal\\"]"	Gumshoos
736	Normal	"[\\"Bug\\"]"	Grubbin
737	Normal	"[\\"Bug\\",\\"Electric\\"]"	Charjabug
738	Normal	"[\\"Bug\\",\\"Electric\\"]"	Vikavolt
739	Normal	"[\\"Fighting\\"]"	Crabrawler
740	Normal	"[\\"Fighting\\",\\"Ice\\"]"	Crabominable
741	Baile	"[\\"Fire\\",\\"Flying\\"]"	Oricorio
741	Pau	"[\\"Psychic\\",\\"Flying\\"]"	Oricorio
741	Pompom	"[\\"Electric\\",\\"Flying\\"]"	Oricorio
741	Sensu	"[\\"Ghost\\",\\"Flying\\"]"	Oricorio
742	Normal	"[\\"Bug\\",\\"Fairy\\"]"	Cutiefly
743	Normal	"[\\"Bug\\",\\"Fairy\\"]"	Ribombee
744	Normal	"[\\"Rock\\"]"	Rockruff
745	Dusk	"[\\"Rock\\"]"	Lycanroc
745	Midday	"[\\"Rock\\"]"	Lycanroc
745	Midnight	"[\\"Rock\\"]"	Lycanroc
746	School	"[\\"Water\\"]"	Wishiwashi
746	Solo	"[\\"Water\\"]"	Wishiwashi
747	Normal	"[\\"Poison\\",\\"Water\\"]"	Mareanie
748	Normal	"[\\"Poison\\",\\"Water\\"]"	Toxapex
749	Normal	"[\\"Ground\\"]"	Mudbray
750	Normal	"[\\"Ground\\"]"	Mudsdale
751	Normal	"[\\"Water\\",\\"Bug\\"]"	Dewpider
752	Normal	"[\\"Water\\",\\"Bug\\"]"	Araquanid
753	Normal	"[\\"Grass\\"]"	Fomantis
754	Normal	"[\\"Grass\\"]"	Lurantis
755	Normal	"[\\"Grass\\",\\"Fairy\\"]"	Morelull
756	Normal	"[\\"Grass\\",\\"Fairy\\"]"	Shiinotic
757	Normal	"[\\"Poison\\",\\"Fire\\"]"	Salandit
758	Normal	"[\\"Poison\\",\\"Fire\\"]"	Salazzle
759	Normal	"[\\"Normal\\",\\"Fighting\\"]"	Stufful
760	Normal	"[\\"Normal\\",\\"Fighting\\"]"	Bewear
761	Normal	"[\\"Grass\\"]"	Bounsweet
762	Normal	"[\\"Grass\\"]"	Steenee
763	Normal	"[\\"Grass\\"]"	Tsareena
764	Normal	"[\\"Fairy\\"]"	Comfey
765	Normal	"[\\"Normal\\",\\"Psychic\\"]"	Oranguru
766	Normal	"[\\"Fighting\\"]"	Passimian
767	Normal	"[\\"Bug\\",\\"Water\\"]"	Wimpod
768	Normal	"[\\"Bug\\",\\"Water\\"]"	Golisopod
769	Normal	"[\\"Ghost\\",\\"Ground\\"]"	Sandygast
770	Normal	"[\\"Ghost\\",\\"Ground\\"]"	Palossand
771	Normal	"[\\"Water\\"]"	Pyukumuku
772	Normal	"[\\"Normal\\"]"	Type: Null
773	Bug	"[\\"Bug\\"]"	Silvally
773	Dark	"[\\"Dark\\"]"	Silvally
773	Dragon	"[\\"Dragon\\"]"	Silvally
773	Electric	"[\\"Electric\\"]"	Silvally
773	Fairy	"[\\"Fairy\\"]"	Silvally
773	Fighting	"[\\"Fighting\\"]"	Silvally
773	Fire	"[\\"Fire\\"]"	Silvally
773	Flying	"[\\"Flying\\"]"	Silvally
773	Ghost	"[\\"Ghost\\"]"	Silvally
773	Grass	"[\\"Grass\\"]"	Silvally
773	Ground	"[\\"Ground\\"]"	Silvally
773	Ice	"[\\"Ice\\"]"	Silvally
773	Normal	"[\\"Normal\\"]"	Silvally
773	Poison	"[\\"Poison\\"]"	Silvally
773	Psychic	"[\\"Psychic\\"]"	Silvally
773	Rock	"[\\"Rock\\"]"	Silvally
773	Steel	"[\\"Steel\\"]"	Silvally
773	Water	"[\\"Water\\"]"	Silvally
774	Blue	"[\\"Rock\\",\\"Flying\\"]"	Minior
774	Green	"[\\"Rock\\",\\"Flying\\"]"	Minior
774	Indigo	"[\\"Rock\\",\\"Flying\\"]"	Minior
774	Orange	"[\\"Rock\\",\\"Flying\\"]"	Minior
774	Red	"[\\"Rock\\",\\"Flying\\"]"	Minior
774	Violet	"[\\"Rock\\",\\"Flying\\"]"	Minior
774	Yellow	"[\\"Rock\\",\\"Flying\\"]"	Minior
775	Normal	"[\\"Normal\\"]"	Komala
776	Normal	"[\\"Fire\\",\\"Dragon\\"]"	Turtonator
777	Normal	"[\\"Electric\\",\\"Steel\\"]"	Togedemaru
778	Busted	"[\\"Ghost\\",\\"Fairy\\"]"	Mimikyu
778	Disguised	"[\\"Ghost\\",\\"Fairy\\"]"	Mimikyu
779	Normal	"[\\"Water\\",\\"Psychic\\"]"	Bruxish
780	Normal	"[\\"Normal\\",\\"Dragon\\"]"	Drampa
781	Normal	"[\\"Ghost\\",\\"Grass\\"]"	Dhelmise
782	Normal	"[\\"Dragon\\"]"	Jangmo-o
783	Normal	"[\\"Dragon\\",\\"Fighting\\"]"	Hakamo-o
784	Normal	"[\\"Dragon\\",\\"Fighting\\"]"	Kommo-o
785	Normal	"[\\"Electric\\",\\"Fairy\\"]"	Tapu Koko
786	Normal	"[\\"Psychic\\",\\"Fairy\\"]"	Tapu Lele
787	Normal	"[\\"Grass\\",\\"Fairy\\"]"	Tapu Bulu
788	Normal	"[\\"Water\\",\\"Fairy\\"]"	Tapu Fini
789	Normal	"[\\"Psychic\\"]"	Cosmog
790	Normal	"[\\"Psychic\\"]"	Cosmoem
791	Normal	"[\\"Psychic\\",\\"Steel\\"]"	Solgaleo
792	Normal	"[\\"Psychic\\",\\"Ghost\\"]"	Lunala
793	Normal	"[\\"Rock\\",\\"Poison\\"]"	Nihilego
794	Normal	"[\\"Bug\\",\\"Fighting\\"]"	Buzzwole
795	Normal	"[\\"Bug\\",\\"Fighting\\"]"	Pheromosa
796	Normal	"[\\"Electric\\"]"	Xurkitree
797	Normal	"[\\"Steel\\",\\"Flying\\"]"	Celesteela
798	Normal	"[\\"Grass\\",\\"Steel\\"]"	Kartana
799	Normal	"[\\"Dark\\",\\"Dragon\\"]"	Guzzlord
800	Dawn_wings	"[\\"Psychic\\",\\"Ghost\\"]"	Necrozma
800	Dusk_mane	"[\\"Psychic\\",\\"Steel\\"]"	Necrozma
800	Normal	"[\\"Psychic\\"]"	Necrozma
800	Ultra	"[\\"Psychic\\",\\"Dragon\\"]"	Necrozma
801	Normal	"[\\"Steel\\",\\"Fairy\\"]"	Magearna
801	Original_color	"[\\"Steel\\",\\"Fairy\\"]"	Magearna
802	Normal	"[\\"Fighting\\",\\"Ghost\\"]"	Marshadow
803	Normal	"[\\"Poison\\"]"	Poipole
804	Normal	"[\\"Poison\\",\\"Dragon\\"]"	Naganadel
805	Normal	"[\\"Rock\\",\\"Steel\\"]"	Stakataka
806	Normal	"[\\"Fire\\",\\"Ghost\\"]"	Blacephalon
807	Normal	"[\\"Electric\\"]"	Zeraora
808	Normal	"[\\"Steel\\"]"	Meltan
809	Normal	"[\\"Steel\\"]"	Melmetal
810	Normal	"[\\"Grass\\"]"	Grookey
811	Normal	"[\\"Grass\\"]"	Thwackey
812	Normal	"[\\"Grass\\"]"	Rillaboom
813	Normal	"[\\"Fire\\"]"	Scorbunny
814	Normal	"[\\"Fire\\"]"	Raboot
815	Normal	"[\\"Fire\\"]"	Cinderace
816	Normal	"[\\"Water\\"]"	Sobble
817	Normal	"[\\"Water\\"]"	Drizzile
818	Normal	"[\\"Water\\"]"	Inteleon
819	Normal	"[\\"Normal\\"]"	Skwovet
820	Normal	"[\\"Normal\\"]"	Greedent
821	Normal	"[\\"Flying\\"]"	Rookidee
822	Normal	"[\\"Flying\\"]"	Corvisquire
823	Normal	"[\\"Flying\\",\\"Steel\\"]"	Corviknight
824	Normal	"[\\"Bug\\"]"	Blipbug
825	Normal	"[\\"Bug\\",\\"Psychic\\"]"	Dottler
826	Normal	"[\\"Bug\\",\\"Psychic\\"]"	Orbeetle
827	Normal	"[\\"Dark\\"]"	Nickit
828	Normal	"[\\"Dark\\"]"	Thievul
829	Normal	"[\\"Grass\\"]"	Gossifleur
830	Normal	"[\\"Grass\\"]"	Eldegoss
831	Normal	"[\\"Normal\\"]"	Wooloo
832	Normal	"[\\"Normal\\"]"	Dubwool
833	Normal	"[\\"Water\\"]"	Chewtle
834	Normal	"[\\"Water\\",\\"Rock\\"]"	Drednaw
835	Normal	"[\\"Electric\\"]"	Yamper
836	Normal	"[\\"Electric\\"]"	Boltund
837	Normal	"[\\"Rock\\"]"	Rolycoly
838	Normal	"[\\"Rock\\",\\"Fire\\"]"	Carkol
839	Normal	"[\\"Rock\\",\\"Fire\\"]"	Coalossal
840	Normal	"[\\"Grass\\",\\"Dragon\\"]"	Applin
841	Normal	"[\\"Grass\\",\\"Dragon\\"]"	Flapple
842	Normal	"[\\"Grass\\",\\"Dragon\\"]"	Appletun
843	Normal	"[\\"Ground\\"]"	Silicobra
844	Normal	"[\\"Ground\\"]"	Sandaconda
845	Normal	"[\\"Flying\\",\\"Water\\"]"	Cramorant
846	Normal	"[\\"Water\\"]"	Arrokuda
847	Normal	"[\\"Water\\"]"	Barraskewda
848	Normal	"[\\"Electric\\",\\"Poison\\"]"	Toxel
849	Amped	"[\\"Electric\\",\\"Poison\\"]"	Toxtricity
849	Low_key	"[\\"Electric\\",\\"Poison\\"]"	Toxtricity
850	Normal	"[\\"Fire\\",\\"Bug\\"]"	Sizzlipede
851	Normal	"[\\"Fire\\",\\"Bug\\"]"	Centiskorch
852	Normal	"[\\"Fighting\\"]"	Clobbopus
853	Normal	"[\\"Fighting\\"]"	Grapploct
854	Antique	"[\\"Ghost\\"]"	Sinistea
854	Phony	"[\\"Ghost\\"]"	Sinistea
855	Antique	"[\\"Ghost\\"]"	Polteageist
855	Phony	"[\\"Ghost\\"]"	Polteageist
856	Normal	"[\\"Psychic\\"]"	Hatenna
857	Normal	"[\\"Psychic\\"]"	Hattrem
858	Normal	"[\\"Psychic\\",\\"Fairy\\"]"	Hatterene
859	Normal	"[\\"Dark\\",\\"Fairy\\"]"	Impidimp
860	Normal	"[\\"Dark\\",\\"Fairy\\"]"	Morgrem
861	Normal	"[\\"Dark\\",\\"Fairy\\"]"	Grimmsnarl
862	Galarian	"[\\"Dark\\",\\"Normal\\"]"	Obstagoon
863	Galarian	"[\\"Steel\\"]"	Perrserker
864	Normal	"[\\"Ghost\\"]"	Cursola
865	Galarian	"[\\"Fighting\\"]"	Sirfetch’d
866	Galarian	"[\\"Ice\\",\\"Psychic\\"]"	Mr. Rime
867	Galarian	"[\\"Ground\\",\\"Ghost\\"]"	Runerigus
868	Normal	"[\\"Fairy\\"]"	Milcery
869	Normal	"[\\"Fairy\\"]"	Alcremie
870	Normal	"[\\"Fighting\\"]"	Falinks
871	Normal	"[\\"Electric\\"]"	Pincurchin
872	Normal	"[\\"Ice\\",\\"Bug\\"]"	Snom
873	Normal	"[\\"Ice\\",\\"Bug\\"]"	Frosmoth
874	Normal	"[\\"Rock\\"]"	Stonjourner
875	Ice	"[\\"Ice\\"]"	Eiscue
875	Noice	"[\\"Ice\\"]"	Eiscue
876	Female	"[\\"Psychic\\",\\"Normal\\"]"	Indeedee
876	Male	"[\\"Psychic\\",\\"Normal\\"]"	Indeedee
877	Full_belly	"[\\"Electric\\",\\"Dark\\"]"	Morpeko
877	Hangry	"[\\"Electric\\",\\"Dark\\"]"	Morpeko
878	Normal	"[\\"Steel\\"]"	Cufant
879	Normal	"[\\"Steel\\"]"	Copperajah
880	Normal	"[\\"Electric\\",\\"Dragon\\"]"	Dracozolt
881	Normal	"[\\"Electric\\",\\"Ice\\"]"	Arctozolt
882	Normal	"[\\"Water\\",\\"Dragon\\"]"	Dracovish
883	Normal	"[\\"Water\\",\\"Ice\\"]"	Arctovish
884	Normal	"[\\"Steel\\",\\"Dragon\\"]"	Duraludon
885	Normal	"[\\"Dragon\\",\\"Ghost\\"]"	Dreepy
886	Normal	"[\\"Dragon\\",\\"Ghost\\"]"	Drakloak
887	Normal	"[\\"Dragon\\",\\"Ghost\\"]"	Dragapult
888	Crowned_sword	"[\\"Fairy\\",\\"Steel\\"]"	Zacian
888	Hero	"[\\"Fairy\\"]"	Zacian
889	Crowned_shield	"[\\"Fighting\\",\\"Steel\\"]"	Zamazenta
889	Hero	"[\\"Fighting\\"]"	Zamazenta
890	Eternamax	"[\\"Poison\\",\\"Dragon\\"]"	Eternatus
890	Normal	"[\\"Poison\\",\\"Dragon\\"]"	Eternatus
891	Normal	"[\\"Fighting\\"]"	Kubfu
892	Rapid_strike	"[\\"Fighting\\",\\"Water\\"]"	Urshifu
892	Single_strike	"[\\"Fighting\\",\\"Dark\\"]"	Urshifu
893	Normal	"[\\"Dark\\",\\"Grass\\"]"	Zarude
894	Normal	"[\\"Electric\\"]"	Regieleki
895	Normal	"[\\"Dragon\\"]"	Regidrago
896	Normal	"[\\"Ice\\"]"	Glastrier
897	Normal	"[\\"Ghost\\"]"	Spectrier
898	Ice_rider	"[\\"Psychic\\",\\"Ice\\"]"	Calyrex
898	Normal	"[\\"Psychic\\",\\"Grass\\"]"	Calyrex
898	Shadow_rider	"[\\"Psychic\\",\\"Ghost\\"]"	Calyrex
901	Normal	"[\\"Ground\\",\\"Normal\\"]"	Ursaluna
903	Normal	"[\\"Fighting\\",\\"Poison\\"]"	Sneasler
904	Normal	"[\\"Dark\\",\\"Poison\\"]"	Overqwil
\.


--
-- TOC entry 3405 (class 0 OID 19773)
-- Dependencies: 215
-- Data for Name: pokemons; Type: TABLE DATA; Schema: public; Owner: zitrojj
--

COPY public.pokemons (id, name) FROM stdin;
1	Bulbasaur
2	Ivysaur
3	Venusaur
4	Charmander
5	Charmeleon
6	Charizard
7	Squirtle
8	Wartortle
9	Blastoise
10	Caterpie
11	Metapod
12	Butterfree
13	Weedle
14	Kakuna
15	Beedrill
16	Pidgey
17	Pidgeotto
18	Pidgeot
19	Rattata
20	Raticate
21	Spearow
22	Fearow
23	Ekans
24	Arbok
25	Pikachu
26	Raichu
27	Sandshrew
28	Sandslash
29	Nidoran♀
30	Nidorina
31	Nidoqueen
32	Nidoran♂
33	Nidorino
34	Nidoking
35	Clefairy
36	Clefable
37	Vulpix
38	Ninetales
39	Jigglypuff
40	Wigglytuff
41	Zubat
42	Golbat
43	Oddish
44	Gloom
45	Vileplume
46	Paras
47	Parasect
48	Venonat
49	Venomoth
50	Diglett
51	Dugtrio
52	Meowth
53	Persian
54	Psyduck
55	Golduck
56	Mankey
57	Primeape
58	Growlithe
59	Arcanine
60	Poliwag
61	Poliwhirl
62	Poliwrath
63	Abra
64	Kadabra
65	Alakazam
66	Machop
67	Machoke
68	Machamp
69	Bellsprout
70	Weepinbell
71	Victreebel
72	Tentacool
73	Tentacruel
74	Geodude
75	Graveler
76	Golem
77	Ponyta
78	Rapidash
79	Slowpoke
80	Slowbro
81	Magnemite
82	Magneton
83	Farfetch’d
84	Doduo
85	Dodrio
86	Seel
87	Dewgong
88	Grimer
89	Muk
90	Shellder
91	Cloyster
92	Gastly
93	Haunter
94	Gengar
95	Onix
96	Drowzee
97	Hypno
98	Krabby
99	Kingler
100	Voltorb
101	Electrode
102	Exeggcute
103	Exeggutor
104	Cubone
105	Marowak
106	Hitmonlee
107	Hitmonchan
108	Lickitung
109	Koffing
110	Weezing
111	Rhyhorn
112	Rhydon
113	Chansey
114	Tangela
115	Kangaskhan
116	Horsea
117	Seadra
118	Goldeen
119	Seaking
120	Staryu
121	Starmie
122	Mr. Mime
123	Scyther
124	Jynx
125	Electabuzz
126	Magmar
127	Pinsir
128	Tauros
129	Magikarp
130	Gyarados
131	Lapras
132	Ditto
133	Eevee
134	Vaporeon
135	Jolteon
136	Flareon
137	Porygon
138	Omanyte
139	Omastar
140	Kabuto
141	Kabutops
142	Aerodactyl
143	Snorlax
144	Articuno
145	Zapdos
146	Moltres
147	Dratini
148	Dragonair
149	Dragonite
150	Mewtwo
151	Mew
152	Chikorita
153	Bayleef
154	Meganium
155	Cyndaquil
156	Quilava
157	Typhlosion
158	Totodile
159	Croconaw
160	Feraligatr
161	Sentret
162	Furret
163	Hoothoot
164	Noctowl
165	Ledyba
166	Ledian
167	Spinarak
168	Ariados
169	Crobat
170	Chinchou
171	Lanturn
172	Pichu
173	Cleffa
174	Igglybuff
175	Togepi
176	Togetic
177	Natu
178	Xatu
179	Mareep
180	Flaaffy
181	Ampharos
182	Bellossom
183	Marill
184	Azumarill
185	Sudowoodo
186	Politoed
187	Hoppip
188	Skiploom
189	Jumpluff
190	Aipom
191	Sunkern
192	Sunflora
193	Yanma
194	Wooper
195	Quagsire
196	Espeon
197	Umbreon
198	Murkrow
199	Slowking
200	Misdreavus
201	Unown
202	Wobbuffet
203	Girafarig
204	Pineco
205	Forretress
206	Dunsparce
207	Gligar
208	Steelix
209	Snubbull
210	Granbull
211	Qwilfish
212	Scizor
213	Shuckle
214	Heracross
215	Sneasel
216	Teddiursa
217	Ursaring
218	Slugma
219	Magcargo
220	Swinub
221	Piloswine
222	Corsola
223	Remoraid
224	Octillery
225	Delibird
226	Mantine
227	Skarmory
228	Houndour
229	Houndoom
230	Kingdra
231	Phanpy
232	Donphan
233	Porygon2
234	Stantler
235	Smeargle
236	Tyrogue
237	Hitmontop
238	Smoochum
239	Elekid
240	Magby
241	Miltank
242	Blissey
243	Raikou
244	Entei
245	Suicune
246	Larvitar
247	Pupitar
248	Tyranitar
249	Lugia
250	Ho-Oh
251	Celebi
252	Treecko
253	Grovyle
254	Sceptile
255	Torchic
256	Combusken
257	Blaziken
258	Mudkip
259	Marshtomp
260	Swampert
261	Poochyena
262	Mightyena
263	Zigzagoon
264	Linoone
265	Wurmple
266	Silcoon
267	Beautifly
268	Cascoon
269	Dustox
270	Lotad
271	Lombre
272	Ludicolo
273	Seedot
274	Nuzleaf
275	Shiftry
276	Taillow
277	Swellow
278	Wingull
279	Pelipper
280	Ralts
281	Kirlia
282	Gardevoir
283	Surskit
284	Masquerain
285	Shroomish
286	Breloom
287	Slakoth
288	Vigoroth
289	Slaking
290	Nincada
291	Ninjask
292	Shedinja
293	Whismur
294	Loudred
295	Exploud
296	Makuhita
297	Hariyama
298	Azurill
299	Nosepass
300	Skitty
301	Delcatty
302	Sableye
303	Mawile
304	Aron
305	Lairon
306	Aggron
307	Meditite
308	Medicham
309	Electrike
310	Manectric
311	Plusle
312	Minun
313	Volbeat
314	Illumise
315	Roselia
316	Gulpin
317	Swalot
318	Carvanha
319	Sharpedo
320	Wailmer
321	Wailord
322	Numel
323	Camerupt
324	Torkoal
325	Spoink
326	Grumpig
327	Spinda
328	Trapinch
329	Vibrava
330	Flygon
331	Cacnea
332	Cacturne
333	Swablu
334	Altaria
335	Zangoose
336	Seviper
337	Lunatone
338	Solrock
339	Barboach
340	Whiscash
341	Corphish
342	Crawdaunt
343	Baltoy
344	Claydol
345	Lileep
346	Cradily
347	Anorith
348	Armaldo
349	Feebas
350	Milotic
351	Castform
352	Kecleon
353	Shuppet
354	Banette
355	Duskull
356	Dusclops
357	Tropius
358	Chimecho
359	Absol
360	Wynaut
361	Snorunt
362	Glalie
363	Spheal
364	Sealeo
365	Walrein
366	Clamperl
367	Huntail
368	Gorebyss
369	Relicanth
370	Luvdisc
371	Bagon
372	Shelgon
373	Salamence
374	Beldum
375	Metang
376	Metagross
377	Regirock
378	Regice
379	Registeel
380	Latias
381	Latios
382	Kyogre
383	Groudon
384	Rayquaza
385	Jirachi
386	Deoxys
387	Turtwig
388	Grotle
389	Torterra
390	Chimchar
391	Monferno
392	Infernape
393	Piplup
394	Prinplup
395	Empoleon
396	Starly
397	Staravia
398	Staraptor
399	Bidoof
400	Bibarel
401	Kricketot
402	Kricketune
403	Shinx
404	Luxio
405	Luxray
406	Budew
407	Roserade
408	Cranidos
409	Rampardos
410	Shieldon
411	Bastiodon
412	Burmy
413	Wormadam
414	Mothim
415	Combee
416	Vespiquen
417	Pachirisu
418	Buizel
419	Floatzel
420	Cherubi
421	Cherrim
422	Shellos
423	Gastrodon
424	Ambipom
425	Drifloon
426	Drifblim
427	Buneary
428	Lopunny
429	Mismagius
430	Honchkrow
431	Glameow
432	Purugly
433	Chingling
434	Stunky
435	Skuntank
436	Bronzor
437	Bronzong
438	Bonsly
439	Mime Jr.
440	Happiny
441	Chatot
442	Spiritomb
443	Gible
444	Gabite
445	Garchomp
446	Munchlax
447	Riolu
448	Lucario
449	Hippopotas
450	Hippowdon
451	Skorupi
452	Drapion
453	Croagunk
454	Toxicroak
455	Carnivine
456	Finneon
457	Lumineon
458	Mantyke
459	Snover
460	Abomasnow
461	Weavile
462	Magnezone
463	Lickilicky
464	Rhyperior
465	Tangrowth
466	Electivire
467	Magmortar
468	Togekiss
469	Yanmega
470	Leafeon
471	Glaceon
472	Gliscor
473	Mamoswine
474	Porygon-Z
475	Gallade
476	Probopass
477	Dusknoir
478	Froslass
479	Rotom
480	Uxie
481	Mesprit
482	Azelf
483	Dialga
484	Palkia
485	Heatran
486	Regigigas
487	Giratina
488	Cresselia
489	Phione
490	Manaphy
491	Darkrai
492	Shaymin
493	Arceus
494	Victini
495	Snivy
496	Servine
497	Serperior
498	Tepig
499	Pignite
500	Emboar
501	Oshawott
502	Dewott
503	Samurott
504	Patrat
505	Watchog
506	Lillipup
507	Herdier
508	Stoutland
509	Purrloin
510	Liepard
511	Pansage
512	Simisage
513	Pansear
514	Simisear
515	Panpour
516	Simipour
517	Munna
518	Musharna
519	Pidove
520	Tranquill
521	Unfezant
522	Blitzle
523	Zebstrika
524	Roggenrola
525	Boldore
526	Gigalith
527	Woobat
528	Swoobat
529	Drilbur
530	Excadrill
531	Audino
532	Timburr
533	Gurdurr
534	Conkeldurr
535	Tympole
536	Palpitoad
537	Seismitoad
538	Throh
539	Sawk
540	Sewaddle
541	Swadloon
542	Leavanny
543	Venipede
544	Whirlipede
545	Scolipede
546	Cottonee
547	Whimsicott
548	Petilil
549	Lilligant
550	Basculin
551	Sandile
552	Krokorok
553	Krookodile
554	Darumaka
555	Darmanitan
556	Maractus
557	Dwebble
558	Crustle
559	Scraggy
560	Scrafty
561	Sigilyph
562	Yamask
563	Cofagrigus
564	Tirtouga
565	Carracosta
566	Archen
567	Archeops
568	Trubbish
569	Garbodor
570	Zorua
571	Zoroark
572	Minccino
573	Cinccino
574	Gothita
575	Gothorita
576	Gothitelle
577	Solosis
578	Duosion
579	Reuniclus
580	Ducklett
581	Swanna
582	Vanillite
583	Vanillish
584	Vanilluxe
585	Deerling
586	Sawsbuck
587	Emolga
588	Karrablast
589	Escavalier
590	Foongus
591	Amoonguss
592	Frillish
593	Jellicent
594	Alomomola
595	Joltik
596	Galvantula
597	Ferroseed
598	Ferrothorn
599	Klink
600	Klang
601	Klinklang
602	Tynamo
603	Eelektrik
604	Eelektross
605	Elgyem
606	Beheeyem
607	Litwick
608	Lampent
609	Chandelure
610	Axew
611	Fraxure
612	Haxorus
613	Cubchoo
614	Beartic
615	Cryogonal
616	Shelmet
617	Accelgor
618	Stunfisk
619	Mienfoo
620	Mienshao
621	Druddigon
622	Golett
623	Golurk
624	Pawniard
625	Bisharp
626	Bouffalant
627	Rufflet
628	Braviary
629	Vullaby
630	Mandibuzz
631	Heatmor
632	Durant
633	Deino
634	Zweilous
635	Hydreigon
636	Larvesta
637	Volcarona
638	Cobalion
639	Terrakion
640	Virizion
641	Tornadus
642	Thundurus
643	Reshiram
644	Zekrom
645	Landorus
646	Kyurem
647	Keldeo
648	Meloetta
649	Genesect
650	Chespin
651	Quilladin
652	Chesnaught
653	Fennekin
654	Braixen
655	Delphox
656	Froakie
657	Frogadier
658	Greninja
659	Bunnelby
660	Diggersby
661	Fletchling
662	Fletchinder
663	Talonflame
664	Scatterbug
665	Spewpa
666	Vivillon
667	Litleo
668	Pyroar
669	Flabebe
670	Floette
671	Florges
672	Skiddo
673	Gogoat
674	Pancham
675	Pangoro
676	Furfrou
677	Espurr
678	Meowstic
679	Honedge
680	Doublade
681	Aegislash
682	Spritzee
683	Aromatisse
684	Swirlix
685	Slurpuff
686	Inkay
687	Malamar
688	Binacle
689	Barbaracle
690	Skrelp
691	Dragalge
692	Clauncher
693	Clawitzer
694	Helioptile
695	Heliolisk
696	Tyrunt
697	Tyrantrum
698	Amaura
699	Aurorus
700	Sylveon
701	Hawlucha
702	Dedenne
703	Carbink
704	Goomy
705	Sliggoo
706	Goodra
707	Klefki
708	Phantump
709	Trevenant
710	Pumpkaboo
711	Gourgeist
712	Bergmite
713	Avalugg
714	Noibat
715	Noivern
716	Xerneas
717	Yveltal
718	Zygarde
719	Diancie
720	Hoopa
721	Volcanion
722	Rowlet
723	Dartrix
724	Decidueye
725	Litten
726	Torracat
727	Incineroar
728	Popplio
729	Brionne
730	Primarina
731	Pikipek
732	Trumbeak
733	Toucannon
734	Yungoos
735	Gumshoos
736	Grubbin
737	Charjabug
738	Vikavolt
739	Crabrawler
740	Crabominable
741	Oricorio
742	Cutiefly
743	Ribombee
744	Rockruff
745	Lycanroc
746	Wishiwashi
747	Mareanie
748	Toxapex
749	Mudbray
750	Mudsdale
751	Dewpider
752	Araquanid
753	Fomantis
754	Lurantis
755	Morelull
756	Shiinotic
757	Salandit
758	Salazzle
759	Stufful
760	Bewear
761	Bounsweet
762	Steenee
763	Tsareena
764	Comfey
765	Oranguru
766	Passimian
767	Wimpod
768	Golisopod
769	Sandygast
770	Palossand
771	Pyukumuku
772	Type: Null
773	Silvally
774	Minior
775	Komala
776	Turtonator
777	Togedemaru
778	Mimikyu
779	Bruxish
780	Drampa
781	Dhelmise
782	Jangmo-o
783	Hakamo-o
784	Kommo-o
785	Tapu Koko
786	Tapu Lele
787	Tapu Bulu
788	Tapu Fini
789	Cosmog
790	Cosmoem
791	Solgaleo
792	Lunala
793	Nihilego
794	Buzzwole
795	Pheromosa
796	Xurkitree
797	Celesteela
798	Kartana
799	Guzzlord
800	Necrozma
801	Magearna
802	Marshadow
803	Poipole
804	Naganadel
805	Stakataka
806	Blacephalon
807	Zeraora
808	Meltan
809	Melmetal
810	Grookey
811	Thwackey
812	Rillaboom
813	Scorbunny
814	Raboot
815	Cinderace
816	Sobble
817	Drizzile
818	Inteleon
819	Skwovet
820	Greedent
821	Rookidee
822	Corvisquire
823	Corviknight
824	Blipbug
825	Dottler
826	Orbeetle
827	Nickit
828	Thievul
829	Gossifleur
830	Eldegoss
831	Wooloo
832	Dubwool
833	Chewtle
834	Drednaw
835	Yamper
836	Boltund
837	Rolycoly
838	Carkol
839	Coalossal
840	Applin
841	Flapple
842	Appletun
843	Silicobra
844	Sandaconda
845	Cramorant
846	Arrokuda
847	Barraskewda
848	Toxel
849	Toxtricity
850	Sizzlipede
851	Centiskorch
852	Clobbopus
853	Grapploct
854	Sinistea
855	Polteageist
856	Hatenna
857	Hattrem
858	Hatterene
859	Impidimp
860	Morgrem
861	Grimmsnarl
862	Obstagoon
863	Perrserker
864	Cursola
865	Sirfetch’d
866	Mr. Rime
867	Runerigus
868	Milcery
869	Alcremie
870	Falinks
871	Pincurchin
872	Snom
873	Frosmoth
874	Stonjourner
875	Eiscue
876	Indeedee
877	Morpeko
878	Cufant
879	Copperajah
880	Dracozolt
881	Arctozolt
882	Dracovish
883	Arctovish
884	Duraludon
885	Dreepy
886	Drakloak
887	Dragapult
888	Zacian
889	Zamazenta
890	Eternatus
891	Kubfu
892	Urshifu
893	Zarude
894	Regieleki
895	Regidrago
896	Glastrier
897	Spectrier
898	Calyrex
899	Wyrdeer
900	Kleavor
901	Ursaluna
902	Basculegion
903	Sneasler
904	Overqwil
905	Enamorus
\.


--
-- TOC entry 3416 (class 0 OID 19848)
-- Dependencies: 226
-- Data for Name: pvp_charge_moves; Type: TABLE DATA; Schema: public; Owner: zitrojj
--

COPY public.pvp_charge_moves (move_id, name, type, power, energy_delta, turn_duration, buffs) FROM stdin;
13	Wrap	Normal	60	-45	1	\N
14	Hyper Beam	Normal	150	-80	1	\N
16	Dark Pulse	Dark	80	-50	1	\N
18	Sludge	Poison	50	-40	1	\N
20	Vice Grip	Normal	40	-40	1	\N
21	Flame Wheel	Fire	60	-55	1	\N
22	Megahorn	Bug	110	-55	1	\N
24	Flamethrower	Fire	90	-55	1	\N
26	Dig	Ground	100	-80	1	\N
28	Cross Chop	Fighting	50	-35	1	\N
30	Psybeam	Psychic	70	-60	1	\N
31	Earthquake	Ground	120	-65	1	\N
32	Stone Edge	Rock	100	-55	1	\N
33	Ice Punch	Ice	55	-40	1	\N
34	Heart Stamp	Psychic	40	-40	1	\N
35	Discharge	Electric	65	-45	1	\N
36	Flash Cannon	Steel	110	-70	1	\N
38	Drill Peck	Flying	65	-40	1	\N
39	Ice Beam	Ice	90	-55	1	\N
40	Blizzard	Ice	140	-75	1	\N
42	Heat Wave	Fire	95	-75	1	\N
45	Aerial Ace	Flying	55	-45	1	\N
46	Drill Run	Ground	80	-45	1	\N
47	Petal Blizzard	Grass	110	-65	1	\N
48	Mega Drain	Grass	25	-55	1	\N
49	Bug Buzz	Bug	100	-60	1	"{\\"activation_chance\\":0.3,\\"target_defense_stat_stage_change\\":-1}"
50	Poison Fang	Poison	40	-40	1	"{\\"activation_chance\\":1,\\"target_defense_stat_stage_change\\":-1}"
51	Night Slash	Dark	50	-35	1	"{\\"activation_chance\\":0.125,\\"attacker_attack_stat_stage_change\\":2}"
53	Bubble Beam	Water	25	-40	1	"{\\"activation_chance\\":1,\\"target_attack_stat_stage_change\\":-1}"
54	Submission	Fighting	60	-50	1	\N
56	Low Sweep	Fighting	40	-40	1	\N
57	Aqua Jet	Water	45	-45	1	\N
58	Aqua Tail	Water	50	-35	1	\N
59	Seed Bomb	Grass	55	-40	1	\N
60	Psyshock	Psychic	70	-45	1	\N
62	Ancient Power	Rock	60	-45	1	"{\\"activation_chance\\":0.1,\\"attacker_attack_stat_stage_change\\":1,\\"attacker_defense_stat_stage_change\\":1}"
63	Rock Tomb	Rock	70	-60	1	"{\\"activation_chance\\":1,\\"target_attack_stat_stage_change\\":-1}"
64	Rock Slide	Rock	75	-45	1	\N
65	Power Gem	Rock	80	-60	1	\N
66	Shadow Sneak	Ghost	50	-45	1	\N
67	Shadow Punch	Ghost	40	-35	1	\N
69	Ominous Wind	Ghost	45	-45	1	"{\\"activation_chance\\":0.1,\\"attacker_attack_stat_stage_change\\":1,\\"attacker_defense_stat_stage_change\\":1}"
70	Shadow Ball	Ghost	100	-55	1	\N
72	Magnet Bomb	Steel	70	-45	1	\N
74	Iron Head	Steel	70	-50	1	\N
75	Parabolic Charge	Electric	65	-55	1	\N
77	Thunder Punch	Electric	55	-40	1	\N
78	Thunder	Electric	100	-60	1	\N
79	Thunderbolt	Electric	90	-55	1	\N
80	Twister	Dragon	45	-45	1	\N
82	Dragon Pulse	Dragon	90	-60	1	\N
83	Dragon Claw	Dragon	50	-35	1	\N
84	Disarming Voice	Fairy	70	-45	1	\N
85	Draining Kiss	Fairy	60	-55	1	\N
86	Dazzling Gleam	Fairy	110	-70	1	\N
87	Moonblast	Fairy	110	-60	1	"{\\"activation_chance\\":0.1,\\"target_attack_stat_stage_change\\":-1}"
88	Play Rough	Fairy	90	-60	1	\N
89	Cross Poison	Poison	50	-35	1	"{\\"activation_chance\\":0.125,\\"attacker_attack_stat_stage_change\\":2}"
90	Sludge Bomb	Poison	80	-50	1	\N
91	Sludge Wave	Poison	110	-65	1	\N
92	Gunk Shot	Poison	130	-75	1	\N
94	Bone Club	Ground	40	-35	1	\N
95	Bulldoze	Ground	80	-60	1	\N
96	Mud Bomb	Ground	55	-40	1	\N
99	Signal Beam	Bug	75	-55	1	"{\\"activation_chance\\":0.2,\\"target_attack_stat_stage_change\\":-1,\\"target_defense_stat_stage_change\\":-1}"
100	X Scissor	Bug	45	-35	1	\N
101	Flame Charge	Fire	65	-50	1	"{\\"activation_chance\\":1,\\"attacker_attack_stat_stage_change\\":1}"
102	Flame Burst	Fire	70	-55	1	\N
103	Fire Blast	Fire	140	-80	1	\N
104	Brine	Water	60	-50	1	\N
105	Water Pulse	Water	70	-60	1	\N
106	Scald	Water	80	-50	1	"{\\"activation_chance\\":0.3,\\"target_attack_stat_stage_change\\":-1}"
107	Hydro Pump	Water	130	-75	1	\N
108	Psychic	Psychic	90	-55	1	"{\\"activation_chance\\":0.1,\\"target_defense_stat_stage_change\\":-1}"
109	Psystrike	Psychic	90	-45	1	\N
111	Icy Wind	Ice	60	-45	1	"{\\"activation_chance\\":1,\\"target_attack_stat_stage_change\\":-1}"
114	Giga Drain	Grass	50	-80	1	\N
115	Fire Punch	Fire	55	-40	1	\N
116	Solar Beam	Grass	150	-80	1	\N
117	Leaf Blade	Grass	70	-35	1	\N
118	Power Whip	Grass	90	-50	1	\N
121	Air Cutter	Flying	60	-55	1	\N
122	Hurricane	Flying	110	-65	1	\N
123	Brick Break	Fighting	40	-35	1	\N
125	Swift	Normal	60	-55	1	\N
126	Horn Attack	Normal	40	-35	1	\N
127	Stomp	Normal	55	-40	1	\N
129	Hyper Fang	Normal	80	-50	1	\N
131	Body Slam	Normal	60	-35	1	\N
132	Rest	Normal	50	-35	1	\N
133	Struggle	Normal	35	-100	1	\N
134	Scald Blastoise	Water	50	-80	1	\N
135	Hydro Pump Blastoise	Water	90	-80	1	\N
136	Wrap Green	Normal	25	-45	1	\N
137	Wrap Pink	Normal	25	-45	1	\N
232	Water Gun Blastoise	Water	6	4	2	\N
245	Close Combat	Fighting	100	-45	1	"{\\"activation_chance\\":1,\\"attacker_defense_stat_stage_change\\":-2}"
246	Dynamic Punch	Fighting	90	-50	1	\N
247	Focus Blast	Fighting	150	-75	1	\N
248	Aurora Beam	Ice	80	-60	1	\N
251	Wild Charge	Electric	100	-45	1	"{\\"activation_chance\\":1,\\"attacker_defense_stat_stage_change\\":-2}"
252	Zap Cannon	Electric	150	-80	1	"{\\"activation_chance\\":0.66,\\"target_attack_stat_stage_change\\":-1}"
254	Avalanche	Ice	90	-45	1	\N
256	Brave Bird	Flying	130	-55	1	"{\\"activation_chance\\":1,\\"attacker_defense_stat_stage_change\\":-3}"
257	Sky Attack	Flying	75	-45	1	\N
258	Sand Tomb	Ground	25	-40	1	"{\\"activation_chance\\":1,\\"target_defense_stat_stage_change\\":-1}"
259	Rock Blast	Rock	50	-40	1	\N
262	Silver Wind	Bug	60	-45	1	"{\\"activation_chance\\":0.1,\\"attacker_attack_stat_stage_change\\":1,\\"attacker_defense_stat_stage_change\\":1}"
265	Night Shade	Ghost	60	-55	1	\N
267	Gyro Ball	Steel	80	-60	1	\N
268	Heavy Slam	Steel	70	-50	1	\N
270	Overheat	Fire	130	-55	1	"{\\"activation_chance\\":1,\\"attacker_attack_stat_stage_change\\":-2}"
272	Grass Knot	Grass	90	-50	1	\N
273	Energy Ball	Grass	90	-55	1	"{\\"activation_chance\\":0.1,\\"target_defense_stat_stage_change\\":-1}"
275	Futuresight	Psychic	120	-65	1	\N
276	Mirror Coat	Psychic	60	-55	1	\N
277	Outrage	Dragon	110	-60	1	\N
279	Crunch	Dark	70	-45	1	"{\\"activation_chance\\":0.3,\\"target_defense_stat_stage_change\\":-1}"
280	Foul Play	Dark	70	-45	1	\N
284	Surf	Water	65	-40	1	\N
285	Draco Meteor	Dragon	150	-65	1	"{\\"activation_chance\\":1,\\"attacker_attack_stat_stage_change\\":-2}"
286	Doom Desire	Steel	75	-40	1	\N
288	Psycho Boost	Psychic	70	-35	1	"{\\"activation_chance\\":1,\\"attacker_attack_stat_stage_change\\":-2}"
289	Origin Pulse	Water	130	-60	1	\N
290	Precipice Blades	Ground	130	-60	1	\N
292	Weather Ball Fire	Fire	55	-35	1	\N
293	Weather Ball Ice	Ice	55	-35	1	\N
294	Weather Ball Rock	Rock	55	-35	1	\N
295	Weather Ball Water	Water	55	-35	1	\N
296	Frenzy Plant	Grass	100	-45	1	\N
298	Blast Burn	Fire	110	-50	1	\N
299	Hydro Cannon	Water	80	-40	1	\N
300	Last Resort	Normal	90	-55	1	\N
301	Meteor Mash	Steel	100	-50	1	\N
302	Skull Bash	Normal	130	-75	1	"{\\"activation_chance\\":1,\\"attacker_defense_stat_stage_change\\":1}"
303	Acid Spray	Poison	20	-45	1	"{\\"activation_chance\\":1,\\"target_defense_stat_stage_change\\":-2}"
304	Earth Power	Ground	90	-55	1	"{\\"activation_chance\\":0.1,\\"target_defense_stat_stage_change\\":-1}"
305	Crabhammer	Water	85	-50	1	"{\\"activation_chance\\":0.125,\\"attacker_attack_stat_stage_change\\":2}"
306	Lunge	Bug	60	-45	1	"{\\"activation_chance\\":1,\\"target_attack_stat_stage_change\\":-1}"
308	Octazooka	Water	50	-50	1	"{\\"activation_chance\\":0.5,\\"target_attack_stat_stage_change\\":-2}"
309	Mirror Shot	Steel	35	-35	1	"{\\"activation_chance\\":0.3,\\"target_attack_stat_stage_change\\":-1}"
310	Super Power	Fighting	85	-40	1	"{\\"activation_chance\\":1,\\"attacker_attack_stat_stage_change\\":-1,\\"attacker_defense_stat_stage_change\\":-1}"
311	Fell Stinger	Bug	20	-35	1	"{\\"activation_chance\\":1,\\"attacker_attack_stat_stage_change\\":1}"
312	Leaf Tornado	Grass	45	-40	1	"{\\"activation_chance\\":0.5,\\"target_attack_stat_stage_change\\":-2}"
314	Drain Punch	Fighting	20	-40	1	"{\\"activation_chance\\":1,\\"attacker_defense_stat_stage_change\\":1}"
315	Shadow Bone	Ghost	75	-45	1	"{\\"activation_chance\\":0.2,\\"target_defense_stat_stage_change\\":-1}"
316	Muddy Water	Water	35	-35	1	"{\\"activation_chance\\":0.3,\\"target_attack_stat_stage_change\\":-1}"
317	Blaze Kick	Fire	55	-40	1	\N
318	Razor Shell	Water	35	-35	1	"{\\"activation_chance\\":0.5,\\"target_defense_stat_stage_change\\":-1}"
319	Power Up Punch	Fighting	20	-35	1	"{\\"activation_chance\\":1,\\"attacker_attack_stat_stage_change\\":1}"
321	Giga Impact	Normal	150	-80	1	\N
322	Frustration	Normal	10	-70	1	\N
323	Return	Normal	130	-70	1	\N
324	Synchronoise	Psychic	80	-50	1	\N
330	Sacred Sword	Fighting	60	-35	1	\N
331	Flying Press	Fighting	90	-40	1	\N
332	Aura Sphere	Fighting	100	-55	1	\N
333	Payback	Dark	110	-60	1	\N
334	Rock Wrecker	Rock	110	-50	1	\N
335	Aeroblast	Flying	170	-75	1	"{\\"activation_chance\\":0.125,\\"attacker_attack_stat_stage_change\\":2}"
336	Techno Blast Normal	Normal	120	-55	1	\N
337	Techno Blast Burn	Fire	120	-55	1	\N
338	Techno Blast Chill	Ice	120	-55	1	\N
339	Techno Blast Water	Water	120	-55	1	\N
340	Techno Blast Shock	Electric	120	-55	1	\N
341	Fly	Flying	80	-45	1	\N
342	V Create	Fire	95	-40	1	"{\\"activation_chance\\":1,\\"attacker_defense_stat_stage_change\\":-3}"
343	Leaf Storm	Grass	130	-55	1	"{\\"activation_chance\\":1,\\"attacker_attack_stat_stage_change\\":-2}"
344	Tri Attack	Normal	65	-50	1	"{\\"activation_chance\\":0.5,\\"target_attack_stat_stage_change\\":-1,\\"target_defense_stat_stage_change\\":-1}"
348	Feather Dance	Flying	35	-50	1	"{\\"activation_chance\\":1,\\"target_attack_stat_stage_change\\":-2}"
352	Weather Ball Normal	Normal	55	-35	1	\N
353	Psychic Fangs	Psychic	40	-35	1	"{\\"activation_chance\\":1,\\"target_defense_stat_stage_change\\":-1}"
358	Sacred Fire	Fire	130	-65	1	"{\\"activation_chance\\":0.5,\\"target_attack_stat_stage_change\\":-1}"
359	Icicle Spear	Ice	60	-40	1	\N
360	Aeroblast Plus	Flying	170	-75	1	"{\\"activation_chance\\":0.125,\\"attacker_attack_stat_stage_change\\":2}"
361	Aeroblast Plus Plus	Flying	170	-75	1	"{\\"activation_chance\\":0.125,\\"attacker_attack_stat_stage_change\\":2}"
362	Sacred Fire Plus	Fire	130	-65	1	"{\\"activation_chance\\":0.5,\\"target_attack_stat_stage_change\\":-1}"
363	Sacred Fire Plus Plus	Fire	130	-65	1	"{\\"activation_chance\\":0.5,\\"target_attack_stat_stage_change\\":-1}"
364	Acrobatics	Flying	110	-60	1	\N
365	Luster Purge	Psychic	120	-60	1	"{\\"activation_chance\\":0.5,\\"target_defense_stat_stage_change\\":-1}"
366	Mist Ball	Psychic	120	-60	1	"{\\"activation_chance\\":0.5,\\"target_attack_stat_stage_change\\":-1}"
367	Brutal Swing	Dark	65	-40	1	\N
369	Seed Flare	Grass	130	-75	1	"{\\"activation_chance\\":0.4,\\"target_defense_stat_stage_change\\":-2}"
370	Obstruct	Dark	15	-40	1	"{\\"activation_chance\\":1,\\"attacker_defense_stat_stage_change\\":1,\\"target_defense_stat_stage_change\\":-1}"
371	Shadow Force	Ghost	120	-90	1	\N
372	Meteor Beam	Rock	120	-60	1	"{\\"activation_chance\\":1,\\"attacker_attack_stat_stage_change\\":1}"
374	Fusion Bolt	Electric	90	-45	1	\N
375	Fusion Flare	Fire	90	-45	1	\N
376	Poltergeist	Ghost	140	-75	1	\N
377	High Horsepower	Ground	100	-60	1	\N
378	Glaciate	Ice	60	-40	1	"{\\"activation_chance\\":1,\\"target_attack_stat_stage_change\\":-1}"
379	Breaking Swipe	Dragon	50	-35	1	"{\\"activation_chance\\":1,\\"target_attack_stat_stage_change\\":-1}"
380	Boomburst	Normal	150	-75	1	\N
381	Double Iron Bash	Steel	50	-35	1	\N
\.


--
-- TOC entry 3415 (class 0 OID 19841)
-- Dependencies: 225
-- Data for Name: pvp_fast_moves; Type: TABLE DATA; Schema: public; Owner: zitrojj
--

COPY public.pvp_fast_moves (move_id, name, type, power, energy_delta, turn_duration) FROM stdin;
200	Fury Cutter	Bug	2	4	1
201	Bug Bite	Bug	3	3	1
202	Bite	Dark	4	2	1
203	Sucker Punch	Dark	5	7	2
204	Dragon Breath	Dragon	4	3	1
205	Thunder Shock	Electric	3	9	2
206	Spark	Electric	4	8	2
207	Low Kick	Fighting	4	5	2
208	Karate Chop	Fighting	5	8	2
209	Ember	Fire	7	6	2
210	Wing Attack	Flying	5	8	2
211	Peck	Flying	6	5	2
212	Lick	Ghost	3	3	1
213	Shadow Claw	Ghost	6	8	2
214	Vine Whip	Grass	5	8	2
215	Razor Leaf	Grass	10	4	2
216	Mud Shot	Ground	3	9	2
217	Ice Shard	Ice	9	10	3
218	Frost Breath	Ice	7	5	2
219	Quick Attack	Normal	5	8	2
220	Scratch	Normal	4	2	1
221	Tackle	Normal	3	3	1
222	Pound	Normal	4	4	2
223	Cut	Normal	3	2	1
224	Poison Jab	Poison	7	7	2
225	Acid	Poison	6	5	2
226	Psycho Cut	Psychic	3	9	2
227	Rock Throw	Rock	8	5	2
228	Metal Claw	Steel	5	6	2
229	Bullet Punch	Steel	6	7	2
230	Water Gun	Water	3	3	1
231	Splash	Water	0	12	4
233	Mud Slap	Ground	11	8	3
234	Zen Headbutt	Psychic	8	6	3
235	Confusion	Psychic	16	12	4
236	Poison Sting	Poison	3	9	2
237	Bubble	Water	7	11	3
238	Feint Attack	Dark	6	6	2
239	Steel Wing	Steel	7	5	2
240	Fire Fang	Fire	8	5	2
241	Rock Smash	Fighting	9	7	3
242	Transform	Normal	0	0	3
243	Counter	Fighting	8	7	2
244	Powder Snow	Ice	5	8	2
249	Charge Beam	Electric	5	11	3
250	Volt Switch	Electric	12	16	4
253	Dragon Tail	Dragon	13	9	3
255	Air Slash	Flying	9	9	3
260	Infestation	Bug	6	12	3
261	Struggle Bug	Bug	9	8	3
263	Astonish	Ghost	5	9	3
264	Hex	Ghost	6	12	3
266	Iron Tail	Steel	9	6	3
269	Fire Spin	Fire	9	10	3
271	Bullet Seed	Grass	5	13	3
274	Extrasensory	Psychic	8	10	3
278	Snarl	Dark	5	13	3
281	Hidden Power	Normal	9	8	3
282	Take Down	Normal	5	8	3
283	Waterfall	Water	12	8	3
287	Yawn	Normal	0	12	4
291	Present	Normal	3	12	3
297	Smack Down	Rock	12	8	3
320	Charm	Fairy	15	6	3
325	Lock On	Normal	1	5	1
326	Thunder Fang	Electric	8	5	2
327	Ice Fang	Ice	8	5	2
345	Gust	Flying	16	12	4
346	Incinerate	Fire	15	20	5
350	Fairy Wind	Fairy	3	9	2
356	Double Kick	Fighting	8	12	3
357	Magical Leaf	Grass	10	10	3
368	Rollout	Rock	4	13	3
\.


--
-- TOC entry 3410 (class 0 OID 19808)
-- Dependencies: 220
-- Data for Name: type_effectiveness; Type: TABLE DATA; Schema: public; Owner: zitrojj
--

COPY public.type_effectiveness (attacking_type, vs_bug, vs_dark, vs_dragon, vs_electric, vs_fairy, vs_fighting, vs_fire, vs_flying, vs_ghost, vs_grass, vs_ground, vs_ice, vs_normal, vs_poison, vs_psychic, vs_rock, vs_steel, vs_water) FROM stdin;
Bug	1	1.6	1	1	0.625	0.625	0.625	0.625	0.625	1.6	1	1	1	0.625	1.6	1	0.625	1
Dark	1	0.625	1	1	0.625	0.625	1	1	1.6	1	1	1	1	1	1.6	1	1	1
Dragon	1	1	1.6	1	0.390625	1	1	1	1	1	1	1	1	1	1	1	0.625	1
Electric	1	1	0.625	0.625	1	1	1	1.6	1	0.625	0.390625	1	1	1	1	1	1	1.6
Fairy	1	1.6	1.6	1	1	1.6	0.625	1	1	1	1	1	1	0.625	1	1	0.625	1
Fighting	0.625	1.6	1	1	0.625	1	1	0.625	0.390625	1	1	1.6	1.6	0.625	0.625	1.6	1.6	1
Fire	1.6	1	0.625	1	1	1	0.625	1	1	1.6	1	1.6	1	1	1	0.625	1.6	0.625
Flying	1.6	1	1	0.625	1	1.6	1	1	1	1.6	1	1	1	1	1	0.625	0.625	1
Ghost	1	0.625	1	1	1	1	1	1	1.6	1	1	1	0.390625	1	1.6	1	1	1
Grass	0.625	1	0.625	1	1	1	0.625	0.625	1	0.625	1.6	1	1	0.625	1	1.6	0.625	1.6
Ground	0.625	1	1	1.6	1	1	1.6	0.390625	1	0.625	1	1	1	1.6	1	1.6	1.6	1
Ice	1	1	1.6	1	1	1	0.625	1.6	1	1.6	1.6	0.625	1	1	1	1	0.625	0.625
Normal	1	1	1	1	1	1	1	1	0.390625	1	1	1	1	1	1	0.625	0.625	1
Poison	1	1	1	1	1.6	1	1	1	0.625	1.6	0.625	1	1	0.625	1	0.625	0.390625	1
Psychic	1	0.390625	1	1	1	1.6	1	1	1	1	1	1	1	1.6	0.625	1	0.625	1
Rock	1.6	1	1	1	1	0.625	1.6	1.6	1	1	0.625	1.6	1	1	1	1	0.625	1
Steel	1	1	1	0.625	1.6	1	0.625	1	1	1	1	1.6	1	1	1	1.6	0.625	0.625
Water	1	1	0.625	1	1	1	1.6	1	1	0.625	1.6	1	1	1	1	1.6	1	0.625
\.


--
-- TOC entry 3229 (class 2606 OID 19733)
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: zitrojj
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3237 (class 2606 OID 19800)
-- Name: charge_moves charge_moves_pkey; Type: CONSTRAINT; Schema: public; Owner: zitrojj
--

ALTER TABLE ONLY public.charge_moves
    ADD CONSTRAINT charge_moves_pkey PRIMARY KEY (name);


--
-- TOC entry 3235 (class 2606 OID 19793)
-- Name: fast_moves fast_moves_pkey; Type: CONSTRAINT; Schema: public; Owner: zitrojj
--

ALTER TABLE ONLY public.fast_moves
    ADD CONSTRAINT fast_moves_pkey PRIMARY KEY (name);


--
-- TOC entry 3245 (class 2606 OID 21288)
-- Name: pokemon_charge_moves pokemon_charge_moves_pkey; Type: CONSTRAINT; Schema: public; Owner: zitrojj
--

ALTER TABLE ONLY public.pokemon_charge_moves
    ADD CONSTRAINT pokemon_charge_moves_pkey PRIMARY KEY (pokemon_id, charge_move_id, form);


--
-- TOC entry 3249 (class 2606 OID 21290)
-- Name: pokemon_elite_charge_moves pokemon_elite_charge_moves_pkey; Type: CONSTRAINT; Schema: public; Owner: zitrojj
--

ALTER TABLE ONLY public.pokemon_elite_charge_moves
    ADD CONSTRAINT pokemon_elite_charge_moves_pkey PRIMARY KEY (pokemon_id, charge_move_id, form);


--
-- TOC entry 3247 (class 2606 OID 21292)
-- Name: pokemon_elite_fast_moves pokemon_elite_fast_moves_pkey; Type: CONSTRAINT; Schema: public; Owner: zitrojj
--

ALTER TABLE ONLY public.pokemon_elite_fast_moves
    ADD CONSTRAINT pokemon_elite_fast_moves_pkey PRIMARY KEY (pokemon_id, fast_move_id, form);


--
-- TOC entry 3243 (class 2606 OID 21294)
-- Name: pokemon_fast_moves pokemon_fast_moves_pkey; Type: CONSTRAINT; Schema: public; Owner: zitrojj
--

ALTER TABLE ONLY public.pokemon_fast_moves
    ADD CONSTRAINT pokemon_fast_moves_pkey PRIMARY KEY (pokemon_id, fast_move_id, form);


--
-- TOC entry 3233 (class 2606 OID 19786)
-- Name: pokemon_stats pokemon_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: zitrojj
--

ALTER TABLE ONLY public.pokemon_stats
    ADD CONSTRAINT pokemon_stats_pkey PRIMARY KEY (pokemon_id, form);


--
-- TOC entry 3239 (class 2606 OID 19807)
-- Name: pokemon_types pokemon_types_pkey; Type: CONSTRAINT; Schema: public; Owner: zitrojj
--

ALTER TABLE ONLY public.pokemon_types
    ADD CONSTRAINT pokemon_types_pkey PRIMARY KEY (pokemon_id, form);


--
-- TOC entry 3231 (class 2606 OID 19779)
-- Name: pokemons pokemons_pkey; Type: CONSTRAINT; Schema: public; Owner: zitrojj
--

ALTER TABLE ONLY public.pokemons
    ADD CONSTRAINT pokemons_pkey PRIMARY KEY (id);


--
-- TOC entry 3255 (class 2606 OID 19854)
-- Name: pvp_charge_moves pvp_charge_moves_pkey; Type: CONSTRAINT; Schema: public; Owner: zitrojj
--

ALTER TABLE ONLY public.pvp_charge_moves
    ADD CONSTRAINT pvp_charge_moves_pkey PRIMARY KEY (move_id);


--
-- TOC entry 3252 (class 2606 OID 19847)
-- Name: pvp_fast_moves pvp_fast_moves_pkey; Type: CONSTRAINT; Schema: public; Owner: zitrojj
--

ALTER TABLE ONLY public.pvp_fast_moves
    ADD CONSTRAINT pvp_fast_moves_pkey PRIMARY KEY (move_id);


--
-- TOC entry 3241 (class 2606 OID 19812)
-- Name: type_effectiveness type_effectiveness_pkey; Type: CONSTRAINT; Schema: public; Owner: zitrojj
--

ALTER TABLE ONLY public.type_effectiveness
    ADD CONSTRAINT type_effectiveness_pkey PRIMARY KEY (attacking_type);


--
-- TOC entry 3253 (class 1259 OID 19856)
-- Name: pvp_charge_moves_name_key; Type: INDEX; Schema: public; Owner: zitrojj
--

CREATE UNIQUE INDEX pvp_charge_moves_name_key ON public.pvp_charge_moves USING btree (name);


--
-- TOC entry 3250 (class 1259 OID 19855)
-- Name: pvp_fast_moves_name_key; Type: INDEX; Schema: public; Owner: zitrojj
--

CREATE UNIQUE INDEX pvp_fast_moves_name_key ON public.pvp_fast_moves USING btree (name);


--
-- TOC entry 3259 (class 2606 OID 19877)
-- Name: pokemon_charge_moves pokemon_charge_moves_pokemon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zitrojj
--

ALTER TABLE ONLY public.pokemon_charge_moves
    ADD CONSTRAINT pokemon_charge_moves_pokemon_id_fkey FOREIGN KEY (pokemon_id) REFERENCES public.pokemons(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3261 (class 2606 OID 19897)
-- Name: pokemon_elite_charge_moves pokemon_elite_charge_moves_pokemon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zitrojj
--

ALTER TABLE ONLY public.pokemon_elite_charge_moves
    ADD CONSTRAINT pokemon_elite_charge_moves_pokemon_id_fkey FOREIGN KEY (pokemon_id) REFERENCES public.pokemons(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3260 (class 2606 OID 19887)
-- Name: pokemon_elite_fast_moves pokemon_elite_fast_moves_pokemon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zitrojj
--

ALTER TABLE ONLY public.pokemon_elite_fast_moves
    ADD CONSTRAINT pokemon_elite_fast_moves_pokemon_id_fkey FOREIGN KEY (pokemon_id) REFERENCES public.pokemons(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3258 (class 2606 OID 19867)
-- Name: pokemon_fast_moves pokemon_fast_moves_pokemon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zitrojj
--

ALTER TABLE ONLY public.pokemon_fast_moves
    ADD CONSTRAINT pokemon_fast_moves_pokemon_id_fkey FOREIGN KEY (pokemon_id) REFERENCES public.pokemons(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3256 (class 2606 OID 19857)
-- Name: pokemon_stats pokemon_stats_pokemon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zitrojj
--

ALTER TABLE ONLY public.pokemon_stats
    ADD CONSTRAINT pokemon_stats_pokemon_id_fkey FOREIGN KEY (pokemon_id) REFERENCES public.pokemons(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3257 (class 2606 OID 19862)
-- Name: pokemon_types pokemon_types_pokemon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zitrojj
--

ALTER TABLE ONLY public.pokemon_types
    ADD CONSTRAINT pokemon_types_pokemon_id_fkey FOREIGN KEY (pokemon_id) REFERENCES public.pokemons(id) ON UPDATE CASCADE ON DELETE RESTRICT;


-- Completed on 2023-02-26 19:08:59 WET

--
-- PostgreSQL database dump complete
--

