--
-- PostgreSQL database dump
--

-- Dumped from database version 11.3 (Debian 11.3-1.pgdg90+1)
-- Dumped by pg_dump version 11.2

-- Started on 2019-06-19 13:58:47

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 205 (class 1259 OID 49224)
-- Name: _appointment; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public._appointment (
    id bigint NOT NULL,
    name text NOT NULL,
    "time" text NOT NULL,
    year integer NOT NULL,
    month integer NOT NULL,
    day integer NOT NULL,
    duration text NOT NULL,
    location text NOT NULL,
    note text NOT NULL
);


ALTER TABLE public._appointment OWNER TO docker;

--
-- TOC entry 204 (class 1259 OID 49222)
-- Name: _appointment_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public._appointment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._appointment_id_seq OWNER TO docker;

--
-- TOC entry 2949 (class 0 OID 0)
-- Dependencies: 204
-- Name: _appointment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public._appointment_id_seq OWNED BY public._appointment.id;


--
-- TOC entry 196 (class 1259 OID 49154)
-- Name: _aqueduct_version_pgsql; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public._aqueduct_version_pgsql (
    versionnumber integer NOT NULL,
    dateofupgrade timestamp without time zone NOT NULL
);


ALTER TABLE public._aqueduct_version_pgsql OWNER TO docker;

--
-- TOC entry 197 (class 1259 OID 49159)
-- Name: _authclient; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public._authclient (
    id text NOT NULL,
    hashedsecret text,
    salt text,
    redirecturi text,
    allowedscope text
);


ALTER TABLE public._authclient OWNER TO docker;

--
-- TOC entry 199 (class 1259 OID 49169)
-- Name: _authtoken; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public._authtoken (
    id bigint NOT NULL,
    code text,
    accesstoken text,
    refreshtoken text,
    scope text,
    issuedate timestamp without time zone NOT NULL,
    expirationdate timestamp without time zone NOT NULL,
    type text,
    resourceowner_id bigint NOT NULL,
    client_id text NOT NULL
);


ALTER TABLE public._authtoken OWNER TO docker;

--
-- TOC entry 198 (class 1259 OID 49167)
-- Name: _authtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public._authtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._authtoken_id_seq OWNER TO docker;

--
-- TOC entry 2950 (class 0 OID 0)
-- Dependencies: 198
-- Name: _authtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public._authtoken_id_seq OWNED BY public._authtoken.id;


--
-- TOC entry 201 (class 1259 OID 49191)
-- Name: _contact; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public._contact (
    note text,
    id bigint NOT NULL,
    contactcode text,
    surname text NOT NULL,
    name text NOT NULL,
    email text NOT NULL
);


ALTER TABLE public._contact OWNER TO docker;

--
-- TOC entry 200 (class 1259 OID 49189)
-- Name: _contact_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public._contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._contact_id_seq OWNER TO docker;

--
-- TOC entry 2951 (class 0 OID 0)
-- Dependencies: 200
-- Name: _contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public._contact_id_seq OWNED BY public._contact.id;


--
-- TOC entry 203 (class 1259 OID 49206)
-- Name: _user; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public._user (
    mobileno text,
    contactcode text,
    surname text NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    id bigint NOT NULL,
    username text NOT NULL,
    hashedpassword text NOT NULL,
    salt text NOT NULL
);


ALTER TABLE public._user OWNER TO docker;

--
-- TOC entry 202 (class 1259 OID 49204)
-- Name: _user_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public._user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._user_id_seq OWNER TO docker;

--
-- TOC entry 2952 (class 0 OID 0)
-- Dependencies: 202
-- Name: _user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public._user_id_seq OWNED BY public._user.id;


--
-- TOC entry 2774 (class 2604 OID 49227)
-- Name: _appointment id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public._appointment ALTER COLUMN id SET DEFAULT nextval('public._appointment_id_seq'::regclass);


--
-- TOC entry 2771 (class 2604 OID 49172)
-- Name: _authtoken id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public._authtoken ALTER COLUMN id SET DEFAULT nextval('public._authtoken_id_seq'::regclass);


--
-- TOC entry 2772 (class 2604 OID 49194)
-- Name: _contact id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public._contact ALTER COLUMN id SET DEFAULT nextval('public._contact_id_seq'::regclass);


--
-- TOC entry 2773 (class 2604 OID 49209)
-- Name: _user id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public._user ALTER COLUMN id SET DEFAULT nextval('public._user_id_seq'::regclass);


--
-- TOC entry 2943 (class 0 OID 49224)
-- Dependencies: 205
-- Data for Name: _appointment; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public._appointment (id, name, "time", year, month, day, duration, location, note) FROM stdin;
1	ddjjjj		2019	6	11		sss	note
2	nnn	mmm	2019	6	11		mmm	mmm
\.


--
-- TOC entry 2934 (class 0 OID 49154)
-- Dependencies: 196
-- Data for Name: _aqueduct_version_pgsql; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public._aqueduct_version_pgsql (versionnumber, dateofupgrade) FROM stdin;
1	2019-06-11 10:02:38.67915
\.


--
-- TOC entry 2935 (class 0 OID 49159)
-- Dependencies: 197
-- Data for Name: _authclient; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public._authclient (id, hashedsecret, salt, redirecturi, allowedscope) FROM stdin;
com.calendar.app	\N	\N	\N	\N
\.


--
-- TOC entry 2937 (class 0 OID 49169)
-- Dependencies: 199
-- Data for Name: _authtoken; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public._authtoken (id, code, accesstoken, refreshtoken, scope, issuedate, expirationdate, type, resourceowner_id, client_id) FROM stdin;
1	\N	yrO8mQQAyD66rIKhjuGdP9UdOFcPDxpk	\N	\N	2019-06-11 10:08:37.086344	2019-06-12 10:08:37.086344	bearer	1	com.calendar.app
2	\N	rZhq1AeyCHabdsTjuMe0s41n04JMp69d	\N	\N	2019-06-11 10:08:52.277794	2019-06-12 10:08:52.277794	bearer	1	com.calendar.app
3	\N	2MlIW2ZiTQzQQrO3ObfwApxaR5BRaneg	\N	\N	2019-06-11 10:10:47.89723	2019-06-12 10:10:47.89723	bearer	1	com.calendar.app
4	\N	ww5iS7iT3lkJyNoB4dAQx2X2tDrqhH5Z	\N	\N	2019-06-11 10:11:04.181846	2019-06-12 10:11:04.181846	bearer	1	com.calendar.app
5	\N	k5OPYamwmFK6rvKanciu9ze5lIEn5izr	\N	\N	2019-06-11 10:12:57.272299	2019-06-12 10:12:57.272299	bearer	1	com.calendar.app
6	\N	d0CiRc2sg8zxEbjbVtGlGQWsY19lnZFr	\N	\N	2019-06-11 11:33:21.291298	2019-06-12 11:33:21.291298	bearer	1	com.calendar.app
7	\N	brBA3j70k5ya9kTgACfeYB19VGNUWMcC	\N	\N	2019-06-11 11:54:39.23811	2019-06-12 11:54:39.23811	bearer	1	com.calendar.app
8	\N	cQpQX7jFjkjcc5h3f8zDCGcngJc0NzZg	\N	\N	2019-06-18 10:10:33.370172	2019-06-19 10:10:33.370172	bearer	1	com.calendar.app
9	\N	8MMhTBWlf8WO3PnHw4rHEJyC0JCroHhG	\N	\N	2019-06-18 10:39:17.637679	2019-06-19 10:39:17.637679	bearer	6	com.calendar.app
10	\N	SBvSLfRiD8Rf6GTusdB3kHWHdofMjSUE	\N	\N	2019-06-19 11:26:48.125859	2019-06-20 11:26:48.125859	bearer	6	com.calendar.app
\.


--
-- TOC entry 2939 (class 0 OID 49191)
-- Dependencies: 201
-- Data for Name: _contact; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public._contact (note, id, contactcode, surname, name, email) FROM stdin;
\.


--
-- TOC entry 2941 (class 0 OID 49206)
-- Dependencies: 203
-- Data for Name: _user; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public._user (mobileno, contactcode, surname, name, email, id, username, hashedpassword, salt) FROM stdin;
\N	\N	surname	name	email@mail.de	1	username	aIRayCsVDbFMr8qWQmMVJULMaxsxiojViprczeMmWCI=	7cV6k3TZjqeBnYFoLgjpQaaRdwy5YpWqMPif+Hu4/n0=
\N	\N	surname	name	email2@mail.de	3	username2	l3fF53H4oOnxv5LsVbcTk9vu2bxukvBTHVixa4N7EHM=	rRjkhSV+a46YLDMGPI/ot1mVfjA/rny1suFUzIdkFSM=
\N	\N	felix	felix	felix@felix.felix	6	felix	dvBL5ZnwHTD1uWmj12VhLL/HXec0/ddVrlLrM6C4kww=	5Zn/AS5bc2g7dLXKp6MtXVLwBm6iEmAZF6THXCMsc9I=
\.


--
-- TOC entry 2953 (class 0 OID 0)
-- Dependencies: 204
-- Name: _appointment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public._appointment_id_seq', 2, true);


--
-- TOC entry 2954 (class 0 OID 0)
-- Dependencies: 198
-- Name: _authtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public._authtoken_id_seq', 10, true);


--
-- TOC entry 2955 (class 0 OID 0)
-- Dependencies: 200
-- Name: _contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public._contact_id_seq', 1, false);


--
-- TOC entry 2956 (class 0 OID 0)
-- Dependencies: 202
-- Name: _user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public._user_id_seq', 6, true);


--
-- TOC entry 2810 (class 2606 OID 49232)
-- Name: _appointment _appointment_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public._appointment
    ADD CONSTRAINT _appointment_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 49158)
-- Name: _aqueduct_version_pgsql _aqueduct_version_pgsql_versionnumber_key; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public._aqueduct_version_pgsql
    ADD CONSTRAINT _aqueduct_version_pgsql_versionnumber_key UNIQUE (versionnumber);


--
-- TOC entry 2778 (class 2606 OID 49166)
-- Name: _authclient _authclient_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public._authclient
    ADD CONSTRAINT _authclient_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 49181)
-- Name: _authtoken _authtoken_accesstoken_key; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public._authtoken
    ADD CONSTRAINT _authtoken_accesstoken_key UNIQUE (accesstoken);


--
-- TOC entry 2785 (class 2606 OID 49179)
-- Name: _authtoken _authtoken_code_key; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public._authtoken
    ADD CONSTRAINT _authtoken_code_key UNIQUE (code);


--
-- TOC entry 2788 (class 2606 OID 49177)
-- Name: _authtoken _authtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public._authtoken
    ADD CONSTRAINT _authtoken_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 49183)
-- Name: _authtoken _authtoken_refreshtoken_key; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public._authtoken
    ADD CONSTRAINT _authtoken_refreshtoken_key UNIQUE (refreshtoken);


--
-- TOC entry 2795 (class 2606 OID 49201)
-- Name: _contact _contact_contactcode_key; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public._contact
    ADD CONSTRAINT _contact_contactcode_key UNIQUE (contactcode);


--
-- TOC entry 2797 (class 2606 OID 49203)
-- Name: _contact _contact_email_key; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public._contact
    ADD CONSTRAINT _contact_email_key UNIQUE (email);


--
-- TOC entry 2799 (class 2606 OID 49199)
-- Name: _contact _contact_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public._contact
    ADD CONSTRAINT _contact_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 49216)
-- Name: _user _user_contactcode_key; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public._user
    ADD CONSTRAINT _user_contactcode_key UNIQUE (contactcode);


--
-- TOC entry 2803 (class 2606 OID 49218)
-- Name: _user _user_email_key; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public._user
    ADD CONSTRAINT _user_email_key UNIQUE (email);


--
-- TOC entry 2805 (class 2606 OID 49214)
-- Name: _user _user_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public._user
    ADD CONSTRAINT _user_pkey PRIMARY KEY (id);


--
-- TOC entry 2808 (class 2606 OID 49220)
-- Name: _user _user_username_key; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public._user
    ADD CONSTRAINT _user_username_key UNIQUE (username);


--
-- TOC entry 2779 (class 1259 OID 49185)
-- Name: _authtoken_accesstoken_idx; Type: INDEX; Schema: public; Owner: docker
--

CREATE INDEX _authtoken_accesstoken_idx ON public._authtoken USING btree (accesstoken);


--
-- TOC entry 2782 (class 1259 OID 49239)
-- Name: _authtoken_client_id_idx; Type: INDEX; Schema: public; Owner: docker
--

CREATE INDEX _authtoken_client_id_idx ON public._authtoken USING btree (client_id);


--
-- TOC entry 2783 (class 1259 OID 49184)
-- Name: _authtoken_code_idx; Type: INDEX; Schema: public; Owner: docker
--

CREATE INDEX _authtoken_code_idx ON public._authtoken USING btree (code);


--
-- TOC entry 2786 (class 1259 OID 49187)
-- Name: _authtoken_expirationdate_idx; Type: INDEX; Schema: public; Owner: docker
--

CREATE INDEX _authtoken_expirationdate_idx ON public._authtoken USING btree (expirationdate);


--
-- TOC entry 2789 (class 1259 OID 49186)
-- Name: _authtoken_refreshtoken_idx; Type: INDEX; Schema: public; Owner: docker
--

CREATE INDEX _authtoken_refreshtoken_idx ON public._authtoken USING btree (refreshtoken);


--
-- TOC entry 2792 (class 1259 OID 49233)
-- Name: _authtoken_resourceowner_id_idx; Type: INDEX; Schema: public; Owner: docker
--

CREATE INDEX _authtoken_resourceowner_id_idx ON public._authtoken USING btree (resourceowner_id);


--
-- TOC entry 2793 (class 1259 OID 49188)
-- Name: _authtoken_type_idx; Type: INDEX; Schema: public; Owner: docker
--

CREATE INDEX _authtoken_type_idx ON public._authtoken USING btree (type);


--
-- TOC entry 2806 (class 1259 OID 49221)
-- Name: _user_username_idx; Type: INDEX; Schema: public; Owner: docker
--

CREATE INDEX _user_username_idx ON public._user USING btree (username);


--
-- TOC entry 2812 (class 2606 OID 49240)
-- Name: _authtoken _authtoken_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public._authtoken
    ADD CONSTRAINT _authtoken_client_id_fkey FOREIGN KEY (client_id) REFERENCES public._authclient(id) ON DELETE CASCADE;


--
-- TOC entry 2811 (class 2606 OID 49234)
-- Name: _authtoken _authtoken_resourceowner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public._authtoken
    ADD CONSTRAINT _authtoken_resourceowner_id_fkey FOREIGN KEY (resourceowner_id) REFERENCES public._user(id) ON DELETE CASCADE;


-- Completed on 2019-06-19 13:58:47

--
-- PostgreSQL database dump complete
--

