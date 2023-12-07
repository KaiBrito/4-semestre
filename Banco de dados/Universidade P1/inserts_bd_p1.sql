--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2023-10-05 10:29:51

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
-- TOC entry 3375 (class 1262 OID 41006)
-- Name: universidade_p1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE universidade_p1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Portuguese_Brazil.1252';


ALTER DATABASE universidade_p1 OWNER TO postgres;

\connect universidade_p1

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
-- TOC entry 209 (class 1259 OID 41010)
-- Name: aluno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aluno (
    rga integer NOT NULL,
    academico character varying(60) NOT NULL,
    dtnasc date,
    telefone character varying(15),
    ano_ingresso integer NOT NULL,
    semestre_curso integer DEFAULT 1 NOT NULL,
    curso_aluno integer
);


ALTER TABLE public.aluno OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 41014)
-- Name: curso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.curso (
    cod_curso integer NOT NULL,
    nome_curso character varying(40) NOT NULL,
    email_curso character varying(40),
    totalhoras integer NOT NULL,
    coordenador integer NOT NULL,
    campus integer NOT NULL
);


ALTER TABLE public.curso OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 41017)
-- Name: disciplina; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disciplina (
    cod_disc integer NOT NULL,
    nome_disciplina character varying(80) NOT NULL,
    ch integer NOT NULL,
    tipo character varying(3),
    curso integer
);


ALTER TABLE public.disciplina OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 41020)
-- Name: faculdade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.faculdade (
    cod_uni integer NOT NULL,
    nome character varying(60) NOT NULL,
    sigla character varying(5) NOT NULL,
    telefone character varying(15)
);


ALTER TABLE public.faculdade OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 41023)
-- Name: historico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historico (
    cod_aluno integer NOT NULL,
    cod_turma integer NOT NULL,
    media_aproveitamento numeric(10,1),
    total_faltas integer,
    resultado character varying(6)
);


ALTER TABLE public.historico OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 41026)
-- Name: prerequisito; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prerequisito (
    cod_disciplina integer NOT NULL,
    cod_prereq integer NOT NULL
);


ALTER TABLE public.prerequisito OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 41029)
-- Name: professor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.professor (
    cod_prof integer NOT NULL,
    nome_prof character varying(60) NOT NULL,
    email character varying(40),
    titulacao character varying(20),
    situacao character varying(10) DEFAULT 'ATIVO'::character varying NOT NULL,
    dedicacao character varying(3) NOT NULL,
    tipo character varying(15),
    alocacao integer NOT NULL,
    coordenador integer
);


ALTER TABLE public.professor OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 41033)
-- Name: turma; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.turma (
    cod_turma integer NOT NULL,
    id integer DEFAULT 1 NOT NULL,
    ano integer NOT NULL,
    semestre integer DEFAULT 1 NOT NULL,
    disc integer NOT NULL,
    prof integer
);


ALTER TABLE public.turma OWNER TO postgres;

--
-- TOC entry 3362 (class 0 OID 41010)
-- Dependencies: 209
-- Data for Name: aluno; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.aluno (rga, academico, dtnasc, telefone, ano_ingresso, semestre_curso, curso_aluno) VALUES (7430001, 'Jose Aparecido', NULL, NULL, 2013, 8, 743);
INSERT INTO public.aluno (rga, academico, dtnasc, telefone, ano_ingresso, semestre_curso, curso_aluno) VALUES (7430002, 'Joao da Silva', NULL, NULL, 2014, 6, 743);
INSERT INTO public.aluno (rga, academico, dtnasc, telefone, ano_ingresso, semestre_curso, curso_aluno) VALUES (7430003, 'Ricardo Ferreira', NULL, NULL, 2014, 6, 743);
INSERT INTO public.aluno (rga, academico, dtnasc, telefone, ano_ingresso, semestre_curso, curso_aluno) VALUES (7430004, 'Antonio Pereira', NULL, NULL, 2014, 6, 743);
INSERT INTO public.aluno (rga, academico, dtnasc, telefone, ano_ingresso, semestre_curso, curso_aluno) VALUES (7430005, 'Marcos Souza', NULL, NULL, 2014, 6, 743);
INSERT INTO public.aluno (rga, academico, dtnasc, telefone, ano_ingresso, semestre_curso, curso_aluno) VALUES (7430006, 'Mariana Prevelato', NULL, NULL, 2014, 6, 743);
INSERT INTO public.aluno (rga, academico, dtnasc, telefone, ano_ingresso, semestre_curso, curso_aluno) VALUES (7430007, 'Silvio Cruz', NULL, NULL, 2014, 6, 743);
INSERT INTO public.aluno (rga, academico, dtnasc, telefone, ano_ingresso, semestre_curso, curso_aluno) VALUES (7430008, 'Isabel Silva Santos', NULL, NULL, 2014, 6, 743);
INSERT INTO public.aluno (rga, academico, dtnasc, telefone, ano_ingresso, semestre_curso, curso_aluno) VALUES (7430009, 'Eduardo Nogueira', NULL, NULL, 2015, 4, 743);
INSERT INTO public.aluno (rga, academico, dtnasc, telefone, ano_ingresso, semestre_curso, curso_aluno) VALUES (7430010, 'Matheus de Souza', NULL, NULL, 2015, 4, 743);
INSERT INTO public.aluno (rga, academico, dtnasc, telefone, ano_ingresso, semestre_curso, curso_aluno) VALUES (7430011, 'Alisson Rudgen', NULL, NULL, 2015, 4, 743);
INSERT INTO public.aluno (rga, academico, dtnasc, telefone, ano_ingresso, semestre_curso, curso_aluno) VALUES (7430012, 'Marcio Novais', NULL, NULL, 2015, 4, 743);
INSERT INTO public.aluno (rga, academico, dtnasc, telefone, ano_ingresso, semestre_curso, curso_aluno) VALUES (7430013, 'Maria Vaz', NULL, NULL, 2015, 4, 743);
INSERT INTO public.aluno (rga, academico, dtnasc, telefone, ano_ingresso, semestre_curso, curso_aluno) VALUES (7430014, 'Solange Mathias', NULL, NULL, 2015, 4, 743);
INSERT INTO public.aluno (rga, academico, dtnasc, telefone, ano_ingresso, semestre_curso, curso_aluno) VALUES (7430015, 'Guilherme Martins', NULL, NULL, 2015, 4, 743);
INSERT INTO public.aluno (rga, academico, dtnasc, telefone, ano_ingresso, semestre_curso, curso_aluno) VALUES (7430016, 'Guilherme Lima', NULL, NULL, 2016, 2, 743);
INSERT INTO public.aluno (rga, academico, dtnasc, telefone, ano_ingresso, semestre_curso, curso_aluno) VALUES (7430017, 'Fernanda de Souza', NULL, NULL, 2016, 2, 743);
INSERT INTO public.aluno (rga, academico, dtnasc, telefone, ano_ingresso, semestre_curso, curso_aluno) VALUES (7430018, 'Michael Hoppen', NULL, NULL, 2016, 2, 743);
INSERT INTO public.aluno (rga, academico, dtnasc, telefone, ano_ingresso, semestre_curso, curso_aluno) VALUES (7430019, 'Susane Fernandes', NULL, NULL, 2016, 2, 743);
INSERT INTO public.aluno (rga, academico, dtnasc, telefone, ano_ingresso, semestre_curso, curso_aluno) VALUES (7430020, 'Simone Ferreira', NULL, NULL, 2016, 2, 743);
INSERT INTO public.aluno (rga, academico, dtnasc, telefone, ano_ingresso, semestre_curso, curso_aluno) VALUES (7430021, 'Jessica Santos', NULL, NULL, 2016, 2, 743);
INSERT INTO public.aluno (rga, academico, dtnasc, telefone, ano_ingresso, semestre_curso, curso_aluno) VALUES (7430022, 'Fabricio Pereira', NULL, NULL, 2016, 2, 743);
INSERT INTO public.aluno (rga, academico, dtnasc, telefone, ano_ingresso, semestre_curso, curso_aluno) VALUES (7430023, 'Maicon dos Santos', NULL, NULL, 2016, 2, 743);
INSERT INTO public.aluno (rga, academico, dtnasc, telefone, ano_ingresso, semestre_curso, curso_aluno) VALUES (7430024, 'Roberto Cabral', NULL, NULL, 2016, 2, 743);
INSERT INTO public.aluno (rga, academico, dtnasc, telefone, ano_ingresso, semestre_curso, curso_aluno) VALUES (7430025, 'Lais de Carvalho', NULL, NULL, 2016, 2, 743);
INSERT INTO public.aluno (rga, academico, dtnasc, telefone, ano_ingresso, semestre_curso, curso_aluno) VALUES (7430026, 'Aparecido Molitor', NULL, NULL, 2016, 2, 743);
INSERT INTO public.aluno (rga, academico, dtnasc, telefone, ano_ingresso, semestre_curso, curso_aluno) VALUES (7430027, 'Gilmar Santos', NULL, NULL, 2016, 2, 743);
INSERT INTO public.aluno (rga, academico, dtnasc, telefone, ano_ingresso, semestre_curso, curso_aluno) VALUES (7430028, 'Alceu Ferraz', NULL, NULL, 2016, 2, 743);
INSERT INTO public.aluno (rga, academico, dtnasc, telefone, ano_ingresso, semestre_curso, curso_aluno) VALUES (7430029, 'Fabricio Hein', NULL, NULL, 2016, 2, 743);
INSERT INTO public.aluno (rga, academico, dtnasc, telefone, ano_ingresso, semestre_curso, curso_aluno) VALUES (7430030, 'Amanda Martin', NULL, NULL, 2013, 8, 743);
INSERT INTO public.aluno (rga, academico, dtnasc, telefone, ano_ingresso, semestre_curso, curso_aluno) VALUES (7430031, 'Fabio Nogueira', NULL, NULL, 2013, 8, 743);
INSERT INTO public.aluno (rga, academico, dtnasc, telefone, ano_ingresso, semestre_curso, curso_aluno) VALUES (7430032, 'Elisa Belisario', NULL, NULL, 2012, 10, 743);
INSERT INTO public.aluno (rga, academico, dtnasc, telefone, ano_ingresso, semestre_curso, curso_aluno) VALUES (7430033, 'Helena Albertino', NULL, NULL, 2012, 10, 743);
INSERT INTO public.aluno (rga, academico, dtnasc, telefone, ano_ingresso, semestre_curso, curso_aluno) VALUES (7430034, 'Tales Tenorio', NULL, NULL, 2012, 10, 743);


--
-- TOC entry 3363 (class 0 OID 41014)
-- Dependencies: 210
-- Data for Name: curso; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.curso (cod_curso, nome_curso, email_curso, totalhoras, coordenador, campus) VALUES (743, 'Sistemas de Informação', NULL, 3230, 6, 1);


--
-- TOC entry 3364 (class 0 OID 41017)
-- Dependencies: 211
-- Data for Name: disciplina; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.disciplina (cod_disc, nome_disciplina, ch, tipo, curso) VALUES (3030, 'Complexidade Algorítmica', 102, NULL, 743);
INSERT INTO public.disciplina (cod_disc, nome_disciplina, ch, tipo, curso) VALUES (3290, 'Algoritmos e Programação I', 136, NULL, 743);
INSERT INTO public.disciplina (cod_disc, nome_disciplina, ch, tipo, curso) VALUES (1955, 'Fundamentos de Administração', 68, NULL, 743);
INSERT INTO public.disciplina (cod_disc, nome_disciplina, ch, tipo, curso) VALUES (3311, 'Teoria da Computação', 68, NULL, 743);
INSERT INTO public.disciplina (cod_disc, nome_disciplina, ch, tipo, curso) VALUES (3303, 'Introdução a Sistemas Digitais', 68, NULL, 743);
INSERT INTO public.disciplina (cod_disc, nome_disciplina, ch, tipo, curso) VALUES (3320, 'Algoritmos e Programação II', 102, NULL, 743);
INSERT INTO public.disciplina (cod_disc, nome_disciplina, ch, tipo, curso) VALUES (3346, 'Calculo I', 102, NULL, 743);
INSERT INTO public.disciplina (cod_disc, nome_disciplina, ch, tipo, curso) VALUES (3338, 'Arquitetura de Computadores I', 68, NULL, 743);
INSERT INTO public.disciplina (cod_disc, nome_disciplina, ch, tipo, curso) VALUES (3354, 'Tecnologia da Informação', 68, NULL, 743);
INSERT INTO public.disciplina (cod_disc, nome_disciplina, ch, tipo, curso) VALUES (2021, 'Probabilidade e Estatística I', 68, NULL, 743);
INSERT INTO public.disciplina (cod_disc, nome_disciplina, ch, tipo, curso) VALUES (3389, 'Banco de Dados I', 68, NULL, 743);
INSERT INTO public.disciplina (cod_disc, nome_disciplina, ch, tipo, curso) VALUES (3370, 'Sistemas Operacionais I', 68, NULL, 743);
INSERT INTO public.disciplina (cod_disc, nome_disciplina, ch, tipo, curso) VALUES (3362, 'Programação Orientada a Objetos', 136, NULL, 743);
INSERT INTO public.disciplina (cod_disc, nome_disciplina, ch, tipo, curso) VALUES (3419, 'Estruturas de Dados e Programação I', 68, NULL, 743);
INSERT INTO public.disciplina (cod_disc, nome_disciplina, ch, tipo, curso) VALUES (3397, 'Redes de Computadores I', 68, NULL, 743);
INSERT INTO public.disciplina (cod_disc, nome_disciplina, ch, tipo, curso) VALUES (3400, 'Engenharia de Software', 68, NULL, 743);
INSERT INTO public.disciplina (cod_disc, nome_disciplina, ch, tipo, curso) VALUES (3427, 'Sistemas Operacionais II', 68, NULL, 743);
INSERT INTO public.disciplina (cod_disc, nome_disciplina, ch, tipo, curso) VALUES (4156, 'Banco de Dados II', 68, NULL, 743);
INSERT INTO public.disciplina (cod_disc, nome_disciplina, ch, tipo, curso) VALUES (3443, 'Inteligência Artificial', 68, NULL, 743);
INSERT INTO public.disciplina (cod_disc, nome_disciplina, ch, tipo, curso) VALUES (3451, 'Análise e Projeto de Software Orientado a Objetos', 68, NULL, 743);
INSERT INTO public.disciplina (cod_disc, nome_disciplina, ch, tipo, curso) VALUES (3460, 'Redes de Computadores II', 68, NULL, 743);
INSERT INTO public.disciplina (cod_disc, nome_disciplina, ch, tipo, curso) VALUES (3435, 'Programação Web I', 68, NULL, 743);
INSERT INTO public.disciplina (cod_disc, nome_disciplina, ch, tipo, curso) VALUES (3486, 'Programação Web II', 68, NULL, 743);
INSERT INTO public.disciplina (cod_disc, nome_disciplina, ch, tipo, curso) VALUES (3494, 'Governança de Tecnologia da Informação I', 68, NULL, 743);
INSERT INTO public.disciplina (cod_disc, nome_disciplina, ch, tipo, curso) VALUES (3508, 'Qualidade de Software', 68, NULL, 743);
INSERT INTO public.disciplina (cod_disc, nome_disciplina, ch, tipo, curso) VALUES (3516, 'Interação Humano-Computador', 68, NULL, 743);
INSERT INTO public.disciplina (cod_disc, nome_disciplina, ch, tipo, curso) VALUES (3095, 'Gestão de Projetos', 68, NULL, 743);
INSERT INTO public.disciplina (cod_disc, nome_disciplina, ch, tipo, curso) VALUES (3540, 'Segurança e Auditoria de Sistemas', 68, NULL, 743);
INSERT INTO public.disciplina (cod_disc, nome_disciplina, ch, tipo, curso) VALUES (3532, 'Governança de Tecnologia da Informação II', 68, NULL, 743);
INSERT INTO public.disciplina (cod_disc, nome_disciplina, ch, tipo, curso) VALUES (1807, 'Estratégia Empresarial', 68, NULL, 743);
INSERT INTO public.disciplina (cod_disc, nome_disciplina, ch, tipo, curso) VALUES (3575, 'Empreendedorismo', 68, NULL, 743);
INSERT INTO public.disciplina (cod_disc, nome_disciplina, ch, tipo, curso) VALUES (9097, 'Sistema de Apoio à Decisão', 68, NULL, 743);
INSERT INTO public.disciplina (cod_disc, nome_disciplina, ch, tipo, curso) VALUES (3567, 'Computação e Sociedade', 68, NULL, 743);
INSERT INTO public.disciplina (cod_disc, nome_disciplina, ch, tipo, curso) VALUES (3915, 'Laboratório de Banco de Dados', 68, NULL, 743);


--
-- TOC entry 3365 (class 0 OID 41020)
-- Dependencies: 212
-- Data for Name: faculdade; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.faculdade (cod_uni, nome, sigla, telefone) VALUES (1, 'Campus Três Lagoas', 'CPTL', NULL);
INSERT INTO public.faculdade (cod_uni, nome, sigla, telefone) VALUES (2, 'Faculdade de Computação', 'FACOM', NULL);
INSERT INTO public.faculdade (cod_uni, nome, sigla, telefone) VALUES (3, 'Campus de Ponta Porã', 'CPPP', NULL);


--
-- TOC entry 3366 (class 0 OID 41023)
-- Dependencies: 213
-- Data for Name: historico; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430002, 113, NULL, NULL, NULL);
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430003, 113, NULL, NULL, NULL);
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430004, 113, NULL, NULL, NULL);
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430005, 113, NULL, NULL, NULL);
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430006, 113, NULL, NULL, NULL);
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430007, 113, NULL, NULL, NULL);
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430008, 113, NULL, NULL, NULL);
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430002, 343, 7.0, 10, 'MA');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430003, 343, NULL, NULL, 'MA');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430004, 343, NULL, NULL, 'MA');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430005, 343, NULL, NULL, 'MA');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430006, 343, NULL, NULL, 'MA');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430007, 343, NULL, NULL, 'MA');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430008, 343, NULL, NULL, 'MA');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430001, 343, 10.0, 8, 'AP');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430001, 114, 7.0, 4, 'AP');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430002, 114, 6.8, 0, 'AP');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430003, 114, 2.4, 8, 'RP');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430004, 114, 1.7, 12, 'RP');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430005, 114, 5.0, 4, 'RP');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430006, 114, 1.1, 24, 'RP');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430007, 114, 0.5, 32, 'RP');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430008, 114, 6.4, 0, 'AP');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430001, 115, 9.0, 0, 'AP');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430002, 115, 7.8, 0, 'AP');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430003, 115, 6.0, 4, 'AP');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430004, 115, 5.0, 4, 'RP');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430005, 115, 7.7, 4, 'AP');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430006, 115, 6.5, 8, 'AP');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430007, 115, 9.0, 0, 'AP');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430008, 115, 3.0, 8, 'RP');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430001, 116, 6.6, 0, 'AP');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430002, 116, 6.9, 0, 'AP');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430003, 116, 5.4, 0, 'RP');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430004, 116, 7.1, 0, 'AP');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430005, 116, 3.0, 4, 'RP');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430006, 116, 4.0, 4, 'RP');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430007, 116, 1.3, 24, 'RP');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430008, 116, 0.0, 36, 'RP');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430001, 117, 7.8, 0, 'AP');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430002, 117, 9.3, 0, 'AP');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430003, 117, 7.0, 4, 'AP');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430004, 117, 6.6, 0, 'AP');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430005, 117, 4.0, 4, 'RP');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430006, 117, 6.0, 0, 'AP');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430007, 117, 6.0, 0, 'AP');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430008, 117, 6.1, 8, 'AP');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430001, 110, 7.0, 10, 'AP');
INSERT INTO public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) VALUES (7430034, 344, NULL, NULL, 'MA');


--
-- TOC entry 3367 (class 0 OID 41026)
-- Dependencies: 214
-- Data for Name: prerequisito; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.prerequisito (cod_disciplina, cod_prereq) VALUES (3320, 3290);
INSERT INTO public.prerequisito (cod_disciplina, cod_prereq) VALUES (3030, 3419);
INSERT INTO public.prerequisito (cod_disciplina, cod_prereq) VALUES (3915, 3389);
INSERT INTO public.prerequisito (cod_disciplina, cod_prereq) VALUES (9097, 3443);
INSERT INTO public.prerequisito (cod_disciplina, cod_prereq) VALUES (3532, 3494);
INSERT INTO public.prerequisito (cod_disciplina, cod_prereq) VALUES (3540, 3397);
INSERT INTO public.prerequisito (cod_disciplina, cod_prereq) VALUES (3540, 3419);
INSERT INTO public.prerequisito (cod_disciplina, cod_prereq) VALUES (3095, 3354);
INSERT INTO public.prerequisito (cod_disciplina, cod_prereq) VALUES (3516, 3362);
INSERT INTO public.prerequisito (cod_disciplina, cod_prereq) VALUES (3508, 3400);
INSERT INTO public.prerequisito (cod_disciplina, cod_prereq) VALUES (3494, 3354);
INSERT INTO public.prerequisito (cod_disciplina, cod_prereq) VALUES (3486, 3435);
INSERT INTO public.prerequisito (cod_disciplina, cod_prereq) VALUES (3435, 3419);
INSERT INTO public.prerequisito (cod_disciplina, cod_prereq) VALUES (3460, 3397);
INSERT INTO public.prerequisito (cod_disciplina, cod_prereq) VALUES (3451, 3400);
INSERT INTO public.prerequisito (cod_disciplina, cod_prereq) VALUES (3451, 3419);
INSERT INTO public.prerequisito (cod_disciplina, cod_prereq) VALUES (3451, 3362);
INSERT INTO public.prerequisito (cod_disciplina, cod_prereq) VALUES (3443, 3320);
INSERT INTO public.prerequisito (cod_disciplina, cod_prereq) VALUES (4156, 3389);
INSERT INTO public.prerequisito (cod_disciplina, cod_prereq) VALUES (3427, 3370);
INSERT INTO public.prerequisito (cod_disciplina, cod_prereq) VALUES (3419, 3320);
INSERT INTO public.prerequisito (cod_disciplina, cod_prereq) VALUES (3362, 3320);
INSERT INTO public.prerequisito (cod_disciplina, cod_prereq) VALUES (3370, 3338);
INSERT INTO public.prerequisito (cod_disciplina, cod_prereq) VALUES (3338, 3303);
INSERT INTO public.prerequisito (cod_disciplina, cod_prereq) VALUES (3389, 3311);


--
-- TOC entry 3368 (class 0 OID 41029)
-- Dependencies: 215
-- Data for Name: professor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.professor (cod_prof, nome_prof, email, titulacao, situacao, dedicacao, tipo, alocacao, coordenador) VALUES (6, 'Juliano', NULL, NULL, 'ATIVO', 'DE', 'Assistente', 1, NULL);
INSERT INTO public.professor (cod_prof, nome_prof, email, titulacao, situacao, dedicacao, tipo, alocacao, coordenador) VALUES (1, 'Ivone', NULL, NULL, 'ATIVO', 'DE', 'Adjunto', 1, 6);
INSERT INTO public.professor (cod_prof, nome_prof, email, titulacao, situacao, dedicacao, tipo, alocacao, coordenador) VALUES (2, 'Franciene', NULL, NULL, 'ATIVO', 'DE', 'Adjunto', 1, 6);
INSERT INTO public.professor (cod_prof, nome_prof, email, titulacao, situacao, dedicacao, tipo, alocacao, coordenador) VALUES (3, 'Ronaldo', NULL, NULL, 'ATIVO', 'DE', 'Adjunto', 1, 6);
INSERT INTO public.professor (cod_prof, nome_prof, email, titulacao, situacao, dedicacao, tipo, alocacao, coordenador) VALUES (4, 'Rodrigo', NULL, NULL, 'ATIVO', 'DE', 'Adjunto', 1, 6);
INSERT INTO public.professor (cod_prof, nome_prof, email, titulacao, situacao, dedicacao, tipo, alocacao, coordenador) VALUES (5, 'Vitor', NULL, NULL, 'AFASTADO', 'DE', 'Assistente', 1, 6);
INSERT INTO public.professor (cod_prof, nome_prof, email, titulacao, situacao, dedicacao, tipo, alocacao, coordenador) VALUES (7, 'Maxwell', NULL, NULL, 'ATIVO', 'DE', 'Assistente', 1, 6);
INSERT INTO public.professor (cod_prof, nome_prof, email, titulacao, situacao, dedicacao, tipo, alocacao, coordenador) VALUES (8, 'Kuesley', NULL, NULL, 'ATIVO', '40h', 'Substituto', 1, 7);
INSERT INTO public.professor (cod_prof, nome_prof, email, titulacao, situacao, dedicacao, tipo, alocacao, coordenador) VALUES (9, 'Alessandro', NULL, NULL, 'AFASTADO', '20h', 'Voluntário', 1, 6);
INSERT INTO public.professor (cod_prof, nome_prof, email, titulacao, situacao, dedicacao, tipo, alocacao, coordenador) VALUES (10, 'João', NULL, NULL, 'ATIVO', '40h', 'Substituto', 1, 6);


--
-- TOC entry 3369 (class 0 OID 41033)
-- Dependencies: 216
-- Data for Name: turma; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (110, 1, 2017, 1, 3290, 3);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (111, 1, 2017, 1, 3290, 3);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (112, 1, 2017, 1, 3320, 7);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (113, 1, 2016, 2, 3030, 3);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (114, 1, 2015, 1, 3290, 3);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (214, 1, 2015, 1, 3290, 7);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (314, 1, 2015, 1, 3290, 9);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (115, 1, 2015, 1, 1955, 10);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (116, 1, 2015, 1, 3311, 5);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (117, 1, 2015, 1, 3303, 7);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (118, 1, 2015, 1, 2021, 10);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (119, 1, 2015, 1, 3389, 5);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (120, 1, 2015, 1, 3370, 6);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (121, 1, 2015, 1, 3362, 6);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (122, 1, 2015, 2, 3320, 3);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (222, 1, 2015, 2, 3320, 9);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (322, 1, 2015, 2, 3320, 7);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (123, 1, 2015, 2, 3346, 10);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (124, 1, 2015, 2, 3338, 7);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (125, 1, 2015, 2, 3354, 10);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (126, 1, 2015, 2, 3419, 3);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (127, 1, 2015, 2, 3397, 5);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (128, 1, 2015, 2, 3400, 6);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (129, 1, 2015, 2, 3427, 6);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (156, 1, 2015, 2, 4156, 5);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (130, 1, 2016, 1, 3290, 3);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (230, 1, 2016, 1, 3290, 7);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (330, 1, 2016, 1, 3290, 9);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (131, 1, 2016, 1, 1955, 10);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (132, 1, 2016, 1, 3311, 5);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (133, 1, 2016, 1, 3303, 7);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (134, 1, 2016, 1, 2021, 10);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (135, 1, 2016, 1, 3389, 5);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (136, 1, 2016, 1, 3370, 6);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (137, 1, 2016, 1, 3362, 6);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (138, 1, 2016, 1, 3443, 9);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (139, 1, 2016, 1, 3451, 7);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (140, 1, 2016, 1, 3460, 5);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (141, 1, 2016, 1, 3435, 6);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (142, 1, 2016, 2, 3320, 3);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (242, 1, 2016, 2, 3320, 9);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (342, 1, 2016, 2, 3320, 3);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (143, 1, 2016, 2, 3346, 10);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (144, 1, 2016, 2, 3338, 7);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (145, 1, 2016, 2, 3354, 10);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (146, 1, 2016, 2, 3419, 3);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (147, 1, 2016, 2, 3397, 5);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (148, 1, 2016, 2, 3400, 6);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (149, 1, 2016, 2, 3427, 6);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (150, 1, 2016, 2, 4156, 5);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (151, 1, 2016, 2, 3486, 6);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (152, 1, 2016, 2, 3494, 10);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (153, 1, 2016, 2, 3508, 7);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (154, 1, 2016, 2, 3516, 7);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (155, 1, 2016, 2, 3915, 10);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (343, 1, 2022, 2, 4156, NULL);
INSERT INTO public.turma (cod_turma, id, ano, semestre, disc, prof) VALUES (344, 1, 2022, 2, 3419, NULL);


--
-- TOC entry 3196 (class 2606 OID 41039)
-- Name: aluno aluno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT aluno_pkey PRIMARY KEY (rga);


--
-- TOC entry 3198 (class 2606 OID 41041)
-- Name: curso curso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_pkey PRIMARY KEY (cod_curso);


--
-- TOC entry 3200 (class 2606 OID 41043)
-- Name: disciplina disciplina_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplina
    ADD CONSTRAINT disciplina_pkey PRIMARY KEY (cod_disc);


--
-- TOC entry 3202 (class 2606 OID 41045)
-- Name: faculdade faculdade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faculdade
    ADD CONSTRAINT faculdade_pkey PRIMARY KEY (cod_uni);


--
-- TOC entry 3204 (class 2606 OID 41047)
-- Name: historico historico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historico
    ADD CONSTRAINT historico_pkey PRIMARY KEY (cod_aluno, cod_turma);


--
-- TOC entry 3206 (class 2606 OID 41049)
-- Name: prerequisito prerequisito_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prerequisito
    ADD CONSTRAINT prerequisito_pkey PRIMARY KEY (cod_disciplina, cod_prereq);


--
-- TOC entry 3208 (class 2606 OID 41051)
-- Name: professor professor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professor
    ADD CONSTRAINT professor_pkey PRIMARY KEY (cod_prof);


--
-- TOC entry 3210 (class 2606 OID 41053)
-- Name: turma turma_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turma
    ADD CONSTRAINT turma_pkey PRIMARY KEY (cod_turma);


--
-- TOC entry 3211 (class 2606 OID 41055)
-- Name: aluno aluno_curso_aluno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT aluno_curso_aluno_fkey FOREIGN KEY (curso_aluno) REFERENCES public.curso(cod_curso);


--
-- TOC entry 3212 (class 2606 OID 41060)
-- Name: curso curso_campus_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_campus_fkey FOREIGN KEY (campus) REFERENCES public.faculdade(cod_uni);


--
-- TOC entry 3213 (class 2606 OID 41065)
-- Name: curso curso_coordenador_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_coordenador_fkey FOREIGN KEY (coordenador) REFERENCES public.professor(cod_prof);


--
-- TOC entry 3214 (class 2606 OID 41070)
-- Name: disciplina disciplina_curso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplina
    ADD CONSTRAINT disciplina_curso_fkey FOREIGN KEY (curso) REFERENCES public.curso(cod_curso);


--
-- TOC entry 3215 (class 2606 OID 41075)
-- Name: historico historico_cod_aluno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historico
    ADD CONSTRAINT historico_cod_aluno_fkey FOREIGN KEY (cod_aluno) REFERENCES public.aluno(rga);


--
-- TOC entry 3216 (class 2606 OID 41080)
-- Name: historico historico_cod_turma_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historico
    ADD CONSTRAINT historico_cod_turma_fkey FOREIGN KEY (cod_turma) REFERENCES public.turma(cod_turma);


--
-- TOC entry 3217 (class 2606 OID 41085)
-- Name: prerequisito prerequisito_cod_disciplina_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prerequisito
    ADD CONSTRAINT prerequisito_cod_disciplina_fkey FOREIGN KEY (cod_disciplina) REFERENCES public.disciplina(cod_disc);


--
-- TOC entry 3218 (class 2606 OID 41090)
-- Name: prerequisito prerequisito_cod_prereq_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prerequisito
    ADD CONSTRAINT prerequisito_cod_prereq_fkey FOREIGN KEY (cod_prereq) REFERENCES public.disciplina(cod_disc);


--
-- TOC entry 3219 (class 2606 OID 41095)
-- Name: professor professor_alocacao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professor
    ADD CONSTRAINT professor_alocacao_fkey FOREIGN KEY (alocacao) REFERENCES public.faculdade(cod_uni);


--
-- TOC entry 3220 (class 2606 OID 41100)
-- Name: professor professor_coordenador_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professor
    ADD CONSTRAINT professor_coordenador_fkey FOREIGN KEY (coordenador) REFERENCES public.professor(cod_prof);


--
-- TOC entry 3221 (class 2606 OID 41105)
-- Name: turma turma_disc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turma
    ADD CONSTRAINT turma_disc_fkey FOREIGN KEY (disc) REFERENCES public.disciplina(cod_disc);


--
-- TOC entry 3222 (class 2606 OID 41110)
-- Name: turma turma_prof_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turma
    ADD CONSTRAINT turma_prof_fkey FOREIGN KEY (prof) REFERENCES public.professor(cod_prof);


-- Completed on 2023-10-05 10:29:51

--
-- PostgreSQL database dump complete
--

