--
-- PostgreSQL database dump
--

\restrict fWDSraEFkx4EZGedcISvLcHsZFTKbx0tCzvsKwsRkgOuwjZPf8LBOuEuSiO6pIa

-- Dumped from database version 17.11
-- Dumped by pg_dump version 17.11

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
-- Name: carga_quimica; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carga_quimica (
    id bigint NOT NULL,
    codigo_carga bigint NOT NULL,
    produto_quimico_id bigint NOT NULL,
    responsavel_tecnico_id bigint NOT NULL,
    pais_origem_id bigint NOT NULL,
    pais_destino_id bigint NOT NULL,
    quantidade numeric(12,2) NOT NULL,
    unidade_medida character varying(20) NOT NULL,
    status_documentacao_id bigint NOT NULL,
    status_carga_id bigint NOT NULL,
    data_entrada timestamp without time zone NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT carga_quimica_quantidade_check CHECK ((quantidade > (0)::numeric))
);


ALTER TABLE public.carga_quimica OWNER TO postgres;

--
-- Name: carga_quimica_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carga_quimica_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.carga_quimica_id_seq OWNER TO postgres;

--
-- Name: carga_quimica_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carga_quimica_id_seq OWNED BY public.carga_quimica.id;


--
-- Name: classe_risco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classe_risco (
    id bigint NOT NULL,
    descricao character varying(100) NOT NULL
);


ALTER TABLE public.classe_risco OWNER TO postgres;

--
-- Name: classe_risco_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.classe_risco_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.classe_risco_id_seq OWNER TO postgres;

--
-- Name: classe_risco_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.classe_risco_id_seq OWNED BY public.classe_risco.id;


--
-- Name: grupo_compatibilidade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grupo_compatibilidade (
    id bigint NOT NULL,
    descricao character varying(10) NOT NULL
);


ALTER TABLE public.grupo_compatibilidade OWNER TO postgres;

--
-- Name: grupo_compatibilidade_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grupo_compatibilidade_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.grupo_compatibilidade_id_seq OWNER TO postgres;

--
-- Name: grupo_compatibilidade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grupo_compatibilidade_id_seq OWNED BY public.grupo_compatibilidade.id;


--
-- Name: historico_carga; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historico_carga (
    id bigint NOT NULL,
    carga_quimica_id bigint NOT NULL,
    status_carga_id bigint NOT NULL,
    data_hora_status timestamp without time zone NOT NULL
);


ALTER TABLE public.historico_carga OWNER TO postgres;

--
-- Name: historico_carga_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.historico_carga_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.historico_carga_id_seq OWNER TO postgres;

--
-- Name: historico_carga_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.historico_carga_id_seq OWNED BY public.historico_carga.id;


--
-- Name: pais; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pais (
    id bigint NOT NULL,
    nome character varying(100) NOT NULL,
    sigla character(2) NOT NULL
);


ALTER TABLE public.pais OWNER TO postgres;

--
-- Name: pais_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pais_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pais_id_seq OWNER TO postgres;

--
-- Name: pais_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pais_id_seq OWNED BY public.pais.id;


--
-- Name: produto_quimico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produto_quimico (
    id bigint NOT NULL,
    nome character varying(200) NOT NULL,
    descricao text,
    numero_onu character varying(20) NOT NULL,
    classe_risco_id bigint NOT NULL,
    grupo_compatibilidade_id bigint NOT NULL,
    status_produto_id bigint NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.produto_quimico OWNER TO postgres;

--
-- Name: produto_quimico_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produto_quimico_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.produto_quimico_id_seq OWNER TO postgres;

--
-- Name: produto_quimico_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produto_quimico_id_seq OWNED BY public.produto_quimico.id;


--
-- Name: responsavel_tecnico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.responsavel_tecnico (
    id bigint NOT NULL,
    nome character varying(200) NOT NULL,
    registro_profissional character varying(100) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.responsavel_tecnico OWNER TO postgres;

--
-- Name: responsavel_tecnico_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.responsavel_tecnico_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.responsavel_tecnico_id_seq OWNER TO postgres;

--
-- Name: responsavel_tecnico_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.responsavel_tecnico_id_seq OWNED BY public.responsavel_tecnico.id;


--
-- Name: status_carga; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status_carga (
    id bigint NOT NULL,
    descricao character varying(30) NOT NULL
);


ALTER TABLE public.status_carga OWNER TO postgres;

--
-- Name: status_carga_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.status_carga_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.status_carga_id_seq OWNER TO postgres;

--
-- Name: status_carga_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.status_carga_id_seq OWNED BY public.status_carga.id;


--
-- Name: status_documentacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status_documentacao (
    id bigint NOT NULL,
    descricao character varying(10) NOT NULL
);


ALTER TABLE public.status_documentacao OWNER TO postgres;

--
-- Name: status_documentacao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.status_documentacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.status_documentacao_id_seq OWNER TO postgres;

--
-- Name: status_documentacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.status_documentacao_id_seq OWNED BY public.status_documentacao.id;


--
-- Name: status_produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status_produto (
    id bigint NOT NULL,
    descricao character varying(20) NOT NULL
);


ALTER TABLE public.status_produto OWNER TO postgres;

--
-- Name: status_produto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.status_produto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.status_produto_id_seq OWNER TO postgres;

--
-- Name: status_produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.status_produto_id_seq OWNED BY public.status_produto.id;


--
-- Name: carga_quimica id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carga_quimica ALTER COLUMN id SET DEFAULT nextval('public.carga_quimica_id_seq'::regclass);


--
-- Name: classe_risco id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classe_risco ALTER COLUMN id SET DEFAULT nextval('public.classe_risco_id_seq'::regclass);


--
-- Name: grupo_compatibilidade id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupo_compatibilidade ALTER COLUMN id SET DEFAULT nextval('public.grupo_compatibilidade_id_seq'::regclass);


--
-- Name: historico_carga id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historico_carga ALTER COLUMN id SET DEFAULT nextval('public.historico_carga_id_seq'::regclass);


--
-- Name: pais id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pais ALTER COLUMN id SET DEFAULT nextval('public.pais_id_seq'::regclass);


--
-- Name: produto_quimico id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto_quimico ALTER COLUMN id SET DEFAULT nextval('public.produto_quimico_id_seq'::regclass);


--
-- Name: responsavel_tecnico id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.responsavel_tecnico ALTER COLUMN id SET DEFAULT nextval('public.responsavel_tecnico_id_seq'::regclass);


--
-- Name: status_carga id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status_carga ALTER COLUMN id SET DEFAULT nextval('public.status_carga_id_seq'::regclass);


--
-- Name: status_documentacao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status_documentacao ALTER COLUMN id SET DEFAULT nextval('public.status_documentacao_id_seq'::regclass);


--
-- Name: status_produto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status_produto ALTER COLUMN id SET DEFAULT nextval('public.status_produto_id_seq'::regclass);


--
-- Data for Name: carga_quimica; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carga_quimica (id, codigo_carga, produto_quimico_id, responsavel_tecnico_id, pais_origem_id, pais_destino_id, quantidade, unidade_medida, status_documentacao_id, status_carga_id, data_entrada, created_at, updated_at) FROM stdin;
1	1001	1	1	30	55	100.00	KG	1	1	2026-10-20 16:43:33.712066	2026-10-20 16:43:33.712066	2026-10-20 16:43:33.712066
2	1002	2	2	30	40	250.00	KG	1	2	2026-10-20 16:43:33.712066	2026-10-20 16:43:33.712066	2026-10-20 16:43:33.712066
3	1003	3	3	30	32	500.00	L	1	3	2026-10-20 16:43:33.712066	2026-10-20 16:43:33.712066	2026-10-20 16:43:33.712066
4	1004	4	4	55	30	150.00	KG	1	4	2026-10-20 16:43:33.712066	2026-10-20 16:43:33.712066	2026-10-20 16:43:33.712066
6	1006	6	6	32	55	450.00	L	2	5	2026-10-20 16:43:33.712066	2026-10-20 16:43:33.712066	2026-10-20 16:43:33.712066
7	1007	7	7	30	20	800.00	KG	1	6	2026-10-20 16:43:33.712066	2026-10-20 16:43:33.712066	2026-10-20 16:43:33.712066
8	1008	8	8	20	30	120.00	L	1	7	2026-10-20 16:43:33.712066	2026-10-20 16:43:33.712066	2026-10-20 16:43:33.712066
9	1009	9	9	55	40	600.00	KG	2	8	2026-10-20 16:43:33.712066	2026-10-20 16:43:33.712066	2026-10-20 16:43:33.712066
10	1010	10	10	40	55	200.00	L	1	1	2026-10-20 16:43:33.712066	2026-10-20 16:43:33.712066	2026-10-20 16:43:33.712066
11	2001	2	1	30	55	500.00	KG	1	1	2026-10-20 00:00:00	2026-10-20 21:18:58.955479	2026-10-20 21:18:58.955479
12	2002	2	2	30	40	300.00	KG	1	3	2026-10-20 00:00:00	2026-10-20 21:24:39.072324	2026-10-20 21:43:25.628538
5	1005	5	5	40	30	300.00	KG	2	3	2026-10-20 16:43:33.712066	2026-10-20 16:43:33.712066	2026-10-20 22:08:39.154421
\.


--
-- Data for Name: classe_risco; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classe_risco (id, descricao) FROM stdin;
1	Explosivos
2	Gases
3	Líquidos Inflamáveis
4	Sólidos Inflamáveis
5	Oxidantes
6	Tóxicos
7	Radioativos
8	Corrosivos
9	Perigos Diversos
\.


--
-- Data for Name: grupo_compatibilidade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grupo_compatibilidade (id, descricao) FROM stdin;
1	A
2	B
3	C
4	D
5	E
6	F
7	G
8	H
9	J
10	K
11	L
12	N
13	S
\.


--
-- Data for Name: historico_carga; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.historico_carga (id, carga_quimica_id, status_carga_id, data_hora_status) FROM stdin;
11	1	1	2026-10-16 16:47:49.816746
12	1	2	2026-10-17 16:47:49.816746
13	1	3	2026-10-18 16:47:49.816746
14	1	4	2026-10-19 16:47:49.816746
15	2	1	2026-10-17 16:47:49.816746
16	2	2	2026-10-18 16:47:49.816746
17	3	1	2026-10-16 16:47:49.816746
18	3	2	2026-10-17 16:47:49.816746
19	3	3	2026-10-18 16:47:49.816746
20	4	1	2026-10-15 16:47:49.816746
21	4	2	2026-10-16 16:47:49.816746
22	4	3	2026-10-17 16:47:49.816746
23	4	4	2026-10-18 16:47:49.816746
24	4	6	2026-10-19 16:47:49.816746
25	12	1	2026-10-20 21:24:39.082691
26	12	2	2026-10-20 21:34:13.132424
27	12	3	2026-10-20 21:43:25.636476
28	5	2	2026-10-20 22:07:38.090889
29	5	3	2026-10-20 22:08:39.164903
\.


--
-- Data for Name: pais; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pais (id, nome, sigla) FROM stdin;
1	Afeganistão	AF
2	África do Sul	ZA
3	Albânia	AL
4	Alemanha	DE
5	Andorra	AD
6	Angola	AO
7	Antígua e Barbuda	AG
8	Arábia Saudita	SA
9	Argélia	DZ
10	Argentina	AR
11	Armênia	AM
12	Austrália	AU
13	Áustria	AT
14	Azerbaijão	AZ
15	Bahamas	BS
16	Bahrein	BH
17	Bangladesh	BD
18	Barbados	BB
19	Belarus	BY
20	Bélgica	BE
21	Belize	BZ
22	Benin	BJ
23	Butão	BT
24	Bolívia	BO
25	Bósnia e Herzegovina	BA
26	Botsuana	BW
27	Brasil	BR
28	Brunei	BN
29	Bulgária	BG
30	Burkina Faso	BF
31	Burundi	BI
32	Cabo Verde	CV
33	Camarões	CM
34	Camboja	KH
35	Canadá	CA
36	Catar	QA
37	Cazaquistão	KZ
38	Chade	TD
39	Chile	CL
40	China	CN
41	Chipre	CY
42	Colômbia	CO
43	Comores	KM
44	Congo	CG
45	Coreia do Norte	KP
46	Coreia do Sul	KR
47	Costa do Marfim	CI
48	Costa Rica	CR
49	Croácia	HR
50	Cuba	CU
51	Dinamarca	DK
52	Djibuti	DJ
53	Dominica	DM
54	Egito	EG
55	El Salvador	SV
56	Emirados Árabes Unidos	AE
57	Equador	EC
58	Eritreia	ER
59	Eslováquia	SK
60	Eslovênia	SI
61	Espanha	ES
62	Estados Unidos	US
63	Estônia	EE
64	Essuatíni	SZ
65	Etiópia	ET
66	Fiji	FJ
67	Filipinas	PH
68	Finlândia	FI
69	França	FR
70	Gabão	GA
71	Gâmbia	GM
72	Gana	GH
73	Geórgia	GE
74	Granada	GD
75	Grécia	GR
76	Guatemala	GT
77	Guiana	GY
78	Guiné	GN
79	Guiné-Bissau	GW
80	Guiné Equatorial	GQ
81	Haiti	HT
82	Honduras	HN
83	Hungria	HU
84	Iêmen	YE
85	Ilhas Marshall	MH
86	Índia	IN
87	Indonésia	ID
88	Irã	IR
89	Iraque	IQ
90	Irlanda	IE
91	Islândia	IS
92	Israel	IL
93	Itália	IT
94	Jamaica	JM
95	Japão	JP
96	Jordânia	JO
97	Kiribati	KI
98	Kosovo	XK
99	Kuwait	KW
100	Laos	LA
101	Lesoto	LS
102	Letônia	LV
103	Líbano	LB
104	Libéria	LR
105	Líbia	LY
106	Liechtenstein	LI
107	Lituânia	LT
108	Luxemburgo	LU
109	Macedônia do Norte	MK
110	Madagascar	MG
111	Malásia	MY
112	Malawi	MW
113	Maldivas	MV
114	Mali	ML
115	Malta	MT
116	Marrocos	MA
117	Maurício	MU
118	Mauritânia	MR
119	México	MX
120	Micronésia	FM
121	Moçambique	MZ
122	Moldávia	MD
123	Mônaco	MC
124	Mongólia	MN
125	Montenegro	ME
126	Myanmar	MM
127	Namíbia	NA
128	Nauru	NR
129	Nepal	NP
130	Nicarágua	NI
131	Níger	NE
132	Nigéria	NG
133	Noruega	NO
134	Nova Zelândia	NZ
135	Omã	OM
136	Países Baixos	NL
137	Palau	PW
138	Palestina	PS
139	Panamá	PA
140	Papua-Nova Guiné	PG
141	Paquistão	PK
142	Paraguai	PY
143	Peru	PE
144	Polônia	PL
145	Portugal	PT
146	Quênia	KE
147	Quirguistão	KG
148	Reino Unido	GB
149	República Centro-Africana	CF
150	República Dominicana	DO
151	República Tcheca	CZ
152	Romênia	RO
153	Ruanda	RW
154	Rússia	RU
155	Samoa	WS
156	San Marino	SM
157	Santa Lúcia	LC
158	São Cristóvão e Névis	KN
159	São Tomé e Príncipe	ST
160	São Vicente e Granadinas	VC
161	Seicheles	SC
162	Senegal	SN
163	Serra Leoa	SL
164	Sérvia	RS
165	Singapura	SG
166	Síria	SY
167	Somália	SO
168	Sri Lanka	LK
169	Sudão	SD
170	Sudão do Sul	SS
171	Suécia	SE
172	Suíça	CH
173	Suriname	SR
174	Tailândia	TH
175	Taiwan	TW
176	Tajiquistão	TJ
177	Tanzânia	TZ
178	Timor-Leste	TL
179	Togo	TG
180	Tonga	TO
181	Trinidad e Tobago	TT
182	Tunísia	TN
183	Turcomenistão	TM
184	Turquia	TR
185	Tuvalu	TV
186	Ucrânia	UA
187	Uganda	UG
188	Uruguai	UY
189	Uzbequistão	UZ
190	Vanuatu	VU
191	Vaticano	VA
192	Venezuela	VE
193	Vietnã	VN
194	Zâmbia	ZM
195	Zimbábue	ZW
\.


--
-- Data for Name: produto_quimico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produto_quimico (id, nome, descricao, numero_onu, classe_risco_id, grupo_compatibilidade_id, status_produto_id, created_at, updated_at) FROM stdin;
2	Ácido Sulfúrico	Produto corrosivo utilizado em processos industriais	1830	9	1	1	2026-10-20 16:37:06.795649	2026-10-20 16:37:06.795649
3	Álcool Etílico	Líquido inflamável utilizado como solvente e combustível	1170	3	1	1	2026-10-20 16:37:06.795649	2026-10-20 16:37:06.795649
4	Cloro Líquido	Gás utilizado em processos de desinfecção	1017	2	1	1	2026-10-20 16:37:06.795649	2026-10-20 16:37:06.795649
5	Amônia Anidra	Gás utilizado na produção de fertilizantes	1005	2	1	1	2026-10-20 16:37:06.795649	2026-10-20 16:37:06.795649
6	Peróxido de Hidrogênio	Agente oxidante utilizado em processos químicos	2014	5	1	1	2026-10-20 16:37:06.795649	2026-10-20 16:37:06.795649
7	Nitrato de Amônio	Composto utilizado na fabricação de fertilizantes	1942	5	1	1	2026-10-20 16:37:06.795649	2026-10-20 16:37:06.795649
8	Benzeno	Hidrocarboneto aromático inflamável	1114	3	1	1	2026-10-20 16:37:06.795649	2026-10-20 16:37:06.795649
9	Metanol	Álcool inflamável utilizado como solvente	1230	3	1	1	2026-10-20 16:37:06.795649	2026-10-20 16:37:06.795649
10	Tolueno	Solvente orgânico utilizado na indústria química	1294	3	1	1	2026-10-20 16:37:06.795649	2026-10-20 16:37:06.795649
11	Ácido Nítrico	Produto corrosivo	2031	9	1	1	2026-10-20 20:13:41.57506	2026-10-20 20:13:41.57506
1	Acetona Atualizada	Descrição alterada	1090	3	1	2	2026-10-20 16:37:06.795649	2026-10-20 20:34:05.800403
\.


--
-- Data for Name: responsavel_tecnico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.responsavel_tecnico (id, nome, registro_profissional, created_at) FROM stdin;
1	João Silva	CREA-SP-10001	2026-10-20 16:35:44.842959
2	Maria Souza	CREA-SP-10002	2026-10-20 16:35:44.842959
3	Carlos Santos	CREA-SP-10003	2026-10-20 16:35:44.842959
4	Fernanda Lima	CREA-SP-10004	2026-10-20 16:35:44.842959
5	Ricardo Oliveira	CREA-SP-10005	2026-10-20 16:35:44.842959
6	Patricia Costa	CREA-SP-10006	2026-10-20 16:35:44.842959
7	Roberto Alves	CREA-SP-10007	2026-10-20 16:35:44.842959
8	Juliana Ramos	CREA-SP-10008	2026-10-20 16:35:44.842959
9	Marcos Pereira	CREA-SP-10009	2026-10-20 16:35:44.842959
10	Ana Ferreira	CREA-SP-10010	2026-10-20 16:35:44.842959
\.


--
-- Data for Name: status_carga; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.status_carga (id, descricao) FROM stdin;
1	REGISTRADA
2	EM_ANALISE
3	EM_INSPECAO
4	LIBERADA
5	BLOQUEADA
6	EM_MOVIMENTACAO
7	FINALIZADA
8	CANCELADA
\.


--
-- Data for Name: status_documentacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.status_documentacao (id, descricao) FROM stdin;
1	OK
2	NOK
\.


--
-- Data for Name: status_produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.status_produto (id, descricao) FROM stdin;
1	ATIVO
2	INATIVO
\.


--
-- Name: carga_quimica_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carga_quimica_id_seq', 12, true);


--
-- Name: classe_risco_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.classe_risco_id_seq', 11, true);


--
-- Name: grupo_compatibilidade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grupo_compatibilidade_id_seq', 13, true);


--
-- Name: historico_carga_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.historico_carga_id_seq', 29, true);


--
-- Name: pais_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pais_id_seq', 195, true);


--
-- Name: produto_quimico_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produto_quimico_id_seq', 11, true);


--
-- Name: responsavel_tecnico_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.responsavel_tecnico_id_seq', 10, true);


--
-- Name: status_carga_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.status_carga_id_seq', 8, true);


--
-- Name: status_documentacao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.status_documentacao_id_seq', 2, true);


--
-- Name: status_produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.status_produto_id_seq', 2, true);


--
-- Name: carga_quimica carga_quimica_codigo_carga_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carga_quimica
    ADD CONSTRAINT carga_quimica_codigo_carga_key UNIQUE (codigo_carga);


--
-- Name: carga_quimica carga_quimica_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carga_quimica
    ADD CONSTRAINT carga_quimica_pkey PRIMARY KEY (id);


--
-- Name: classe_risco classe_risco_descricao_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classe_risco
    ADD CONSTRAINT classe_risco_descricao_key UNIQUE (descricao);


--
-- Name: classe_risco classe_risco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classe_risco
    ADD CONSTRAINT classe_risco_pkey PRIMARY KEY (id);


--
-- Name: grupo_compatibilidade grupo_compatibilidade_descricao_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupo_compatibilidade
    ADD CONSTRAINT grupo_compatibilidade_descricao_key UNIQUE (descricao);


--
-- Name: grupo_compatibilidade grupo_compatibilidade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupo_compatibilidade
    ADD CONSTRAINT grupo_compatibilidade_pkey PRIMARY KEY (id);


--
-- Name: historico_carga historico_carga_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historico_carga
    ADD CONSTRAINT historico_carga_pkey PRIMARY KEY (id);


--
-- Name: pais pais_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pais
    ADD CONSTRAINT pais_pkey PRIMARY KEY (id);


--
-- Name: pais pais_sigla_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pais
    ADD CONSTRAINT pais_sigla_key UNIQUE (sigla);


--
-- Name: produto_quimico produto_quimico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto_quimico
    ADD CONSTRAINT produto_quimico_pkey PRIMARY KEY (id);


--
-- Name: responsavel_tecnico responsavel_tecnico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.responsavel_tecnico
    ADD CONSTRAINT responsavel_tecnico_pkey PRIMARY KEY (id);


--
-- Name: status_carga status_carga_descricao_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status_carga
    ADD CONSTRAINT status_carga_descricao_key UNIQUE (descricao);


--
-- Name: status_carga status_carga_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status_carga
    ADD CONSTRAINT status_carga_pkey PRIMARY KEY (id);


--
-- Name: status_documentacao status_documentacao_descricao_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status_documentacao
    ADD CONSTRAINT status_documentacao_descricao_key UNIQUE (descricao);


--
-- Name: status_documentacao status_documentacao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status_documentacao
    ADD CONSTRAINT status_documentacao_pkey PRIMARY KEY (id);


--
-- Name: status_produto status_produto_descricao_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status_produto
    ADD CONSTRAINT status_produto_descricao_key UNIQUE (descricao);


--
-- Name: status_produto status_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status_produto
    ADD CONSTRAINT status_produto_pkey PRIMARY KEY (id);


--
-- Name: carga_quimica fk_carga_destino; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carga_quimica
    ADD CONSTRAINT fk_carga_destino FOREIGN KEY (pais_destino_id) REFERENCES public.pais(id);


--
-- Name: carga_quimica fk_carga_documentacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carga_quimica
    ADD CONSTRAINT fk_carga_documentacao FOREIGN KEY (status_documentacao_id) REFERENCES public.status_documentacao(id);


--
-- Name: carga_quimica fk_carga_origem; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carga_quimica
    ADD CONSTRAINT fk_carga_origem FOREIGN KEY (pais_origem_id) REFERENCES public.pais(id);


--
-- Name: carga_quimica fk_carga_produto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carga_quimica
    ADD CONSTRAINT fk_carga_produto FOREIGN KEY (produto_quimico_id) REFERENCES public.produto_quimico(id);


--
-- Name: carga_quimica fk_carga_responsavel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carga_quimica
    ADD CONSTRAINT fk_carga_responsavel FOREIGN KEY (responsavel_tecnico_id) REFERENCES public.responsavel_tecnico(id);


--
-- Name: carga_quimica fk_carga_status; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carga_quimica
    ADD CONSTRAINT fk_carga_status FOREIGN KEY (status_carga_id) REFERENCES public.status_carga(id);


--
-- Name: historico_carga fk_historico_carga; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historico_carga
    ADD CONSTRAINT fk_historico_carga FOREIGN KEY (carga_quimica_id) REFERENCES public.carga_quimica(id);


--
-- Name: historico_carga fk_historico_status; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historico_carga
    ADD CONSTRAINT fk_historico_status FOREIGN KEY (status_carga_id) REFERENCES public.status_carga(id);


--
-- Name: produto_quimico fk_produto_classe_risco; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto_quimico
    ADD CONSTRAINT fk_produto_classe_risco FOREIGN KEY (classe_risco_id) REFERENCES public.classe_risco(id);


--
-- Name: produto_quimico fk_produto_grupo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto_quimico
    ADD CONSTRAINT fk_produto_grupo FOREIGN KEY (grupo_compatibilidade_id) REFERENCES public.grupo_compatibilidade(id);


--
-- Name: produto_quimico fk_produto_status; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto_quimico
    ADD CONSTRAINT fk_produto_status FOREIGN KEY (status_produto_id) REFERENCES public.status_produto(id);


--
-- PostgreSQL database dump complete
--

\unrestrict fWDSraEFkx4EZGedcISvLcHsZFTKbx0tCzvsKwsRkgOuwjZPf8LBOuEuSiO6pIa

