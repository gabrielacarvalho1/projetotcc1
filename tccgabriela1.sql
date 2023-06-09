toc.dat                                                                                             0000600 0004000 0002000 00000032706 14433765147 0014465 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP                           {            postgres    12.14    15.2 /    F           0    0    ENCODING    ENCODING     #   SET client_encoding = 'SQL_ASCII';
                      false         G           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         H           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         I           1262    13318    postgres    DATABASE        CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE postgres;
                postgres    false         J           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    2889                     2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false         K           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    7                     3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false         L           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    1         �            1255    16569 &   estoque_add(integer, integer, numeric)    FUNCTION       CREATE FUNCTION public.estoque_add(idproduto integer, idempresa integer, qtd numeric) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
        INSERT INTO ESTOQUE_SALDO (IDEMPRESA, IDPRODUTO, QTDPRODUTO) 
		VALUES(idempresa, idproduto, qtd);

        COMMIT;
		return true;
END;
$$;
 U   DROP FUNCTION public.estoque_add(idproduto integer, idempresa integer, qtd numeric);
       public          postgres    false    7         �            1259    16592    cliente    TABLE     �   CREATE TABLE public.cliente (
    idcliente integer NOT NULL,
    dtnascimento date,
    nome text,
    cpf text,
    celular text,
    email text,
    endereco text
);
    DROP TABLE public.cliente;
       public         heap    postgres    false    7         �            1259    16590    cliente_idcliente_seq    SEQUENCE     �   ALTER TABLE public.cliente ALTER COLUMN idcliente ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cliente_idcliente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    204    7         �            1259    16713 
   compraprod    TABLE     �   CREATE TABLE public.compraprod (
    idcompra integer NOT NULL,
    idempresa integer NOT NULL,
    idproduto integer NOT NULL,
    dtcompra date,
    valorprod numeric,
    qtdproduto numeric
);
    DROP TABLE public.compraprod;
       public         heap    postgres    false    7         �            1259    16711    compraprod_idcompra_seq    SEQUENCE     �   ALTER TABLE public.compraprod ALTER COLUMN idcompra ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.compraprod_idcompra_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999
    CACHE 1
);
            public          postgres    false    7    215         �            1259    16651    empresa    TABLE     �   CREATE TABLE public.empresa (
    idempresa integer NOT NULL,
    endereco text,
    razaosocial text,
    telefone text,
    email text,
    cnpj text,
    nome text
);
    DROP TABLE public.empresa;
       public         heap    postgres    false    7         �            1259    16649    empresa_idempresa_seq    SEQUENCE     �   ALTER TABLE public.empresa ALTER COLUMN idempresa ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.empresa_idempresa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999
    CACHE 1
);
            public          postgres    false    208    7         �            1259    16659    estoque_saldo    TABLE     ~   CREATE TABLE public.estoque_saldo (
    idempresa integer NOT NULL,
    idproduto integer NOT NULL,
    qtdproduto numeric
);
 !   DROP TABLE public.estoque_saldo;
       public         heap    postgres    false    7         �            1259    16602    produto    TABLE     �   CREATE TABLE public.produto (
    idproduto integer NOT NULL,
    dtvalidade date,
    descricao text,
    observacao text,
    tipoproduto "char"
);
    DROP TABLE public.produto;
       public         heap    postgres    false    7         �            1259    16600    produto_idproduto_seq    SEQUENCE     �   ALTER TABLE public.produto ALTER COLUMN idproduto ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.produto_idproduto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999
    CACHE 1
);
            public          postgres    false    206    7         �            1259    16701    usuarios    TABLE     u   CREATE TABLE public.usuarios (
    idusuario integer NOT NULL,
    dtcadastro date,
    nome text,
    senha text
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false    7         �            1259    16699    usuarios_idusuario_seq    SEQUENCE     �   ALTER TABLE public.usuarios ALTER COLUMN idusuario ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.usuarios_idusuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999
    CACHE 1
);
            public          postgres    false    7    213         �            1259    16677 	   vendaprod    TABLE     �   CREATE TABLE public.vendaprod (
    idvenda integer NOT NULL,
    idempresa integer NOT NULL,
    idproduto integer NOT NULL,
    idcliente integer NOT NULL,
    dtvenda date,
    valorprod numeric,
    qtdproduto numeric
);
    DROP TABLE public.vendaprod;
       public         heap    postgres    false    7         �            1259    16675    vendaprod_idvenda_seq    SEQUENCE     �   ALTER TABLE public.vendaprod ALTER COLUMN idvenda ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.vendaprod_idvenda_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999
    CACHE 1
);
            public          postgres    false    211    7         8          0    16592    cliente 
   TABLE DATA           _   COPY public.cliente (idcliente, dtnascimento, nome, cpf, celular, email, endereco) FROM stdin;
    public          postgres    false    204       2872.dat C          0    16713 
   compraprod 
   TABLE DATA           e   COPY public.compraprod (idcompra, idempresa, idproduto, dtcompra, valorprod, qtdproduto) FROM stdin;
    public          postgres    false    215       2883.dat <          0    16651    empresa 
   TABLE DATA           `   COPY public.empresa (idempresa, endereco, razaosocial, telefone, email, cnpj, nome) FROM stdin;
    public          postgres    false    208       2876.dat =          0    16659    estoque_saldo 
   TABLE DATA           I   COPY public.estoque_saldo (idempresa, idproduto, qtdproduto) FROM stdin;
    public          postgres    false    209       2877.dat :          0    16602    produto 
   TABLE DATA           \   COPY public.produto (idproduto, dtvalidade, descricao, observacao, tipoproduto) FROM stdin;
    public          postgres    false    206       2874.dat A          0    16701    usuarios 
   TABLE DATA           F   COPY public.usuarios (idusuario, dtcadastro, nome, senha) FROM stdin;
    public          postgres    false    213       2881.dat ?          0    16677 	   vendaprod 
   TABLE DATA           m   COPY public.vendaprod (idvenda, idempresa, idproduto, idcliente, dtvenda, valorprod, qtdproduto) FROM stdin;
    public          postgres    false    211       2879.dat M           0    0    cliente_idcliente_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.cliente_idcliente_seq', 2, true);
          public          postgres    false    203         N           0    0    compraprod_idcompra_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.compraprod_idcompra_seq', 3, true);
          public          postgres    false    214         O           0    0    empresa_idempresa_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.empresa_idempresa_seq', 2, true);
          public          postgres    false    207         P           0    0    produto_idproduto_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.produto_idproduto_seq', 2, true);
          public          postgres    false    205         Q           0    0    usuarios_idusuario_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.usuarios_idusuario_seq', 1, true);
          public          postgres    false    212         R           0    0    vendaprod_idvenda_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.vendaprod_idvenda_seq', 8, true);
          public          postgres    false    210         �
           2606    16599    cliente cliente_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (idcliente);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    204         �
           2606    16658    empresa empresa_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (idempresa);
 >   ALTER TABLE ONLY public.empresa DROP CONSTRAINT empresa_pkey;
       public            postgres    false    208         �
           2606    16609    produto produto_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (idproduto);
 >   ALTER TABLE ONLY public.produto DROP CONSTRAINT produto_pkey;
       public            postgres    false    206         �
           2606    16708    usuarios usuarios_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (idusuario);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public            postgres    false    213         �
           2606    16719    compraprod fk_compraempresa    FK CONSTRAINT     �   ALTER TABLE ONLY public.compraprod
    ADD CONSTRAINT fk_compraempresa FOREIGN KEY (idempresa) REFERENCES public.empresa(idempresa);
 E   ALTER TABLE ONLY public.compraprod DROP CONSTRAINT fk_compraempresa;
       public          postgres    false    215    2735    208         �
           2606    16724    compraprod fk_compraproduto    FK CONSTRAINT     �   ALTER TABLE ONLY public.compraprod
    ADD CONSTRAINT fk_compraproduto FOREIGN KEY (idproduto) REFERENCES public.produto(idproduto);
 E   ALTER TABLE ONLY public.compraprod DROP CONSTRAINT fk_compraproduto;
       public          postgres    false    2733    206    215         �
           2606    16665    estoque_saldo fk_saldoempresa    FK CONSTRAINT     �   ALTER TABLE ONLY public.estoque_saldo
    ADD CONSTRAINT fk_saldoempresa FOREIGN KEY (idempresa) REFERENCES public.empresa(idempresa);
 G   ALTER TABLE ONLY public.estoque_saldo DROP CONSTRAINT fk_saldoempresa;
       public          postgres    false    209    208    2735         �
           2606    16670    estoque_saldo fk_saldoproduto    FK CONSTRAINT     �   ALTER TABLE ONLY public.estoque_saldo
    ADD CONSTRAINT fk_saldoproduto FOREIGN KEY (idproduto) REFERENCES public.produto(idproduto);
 G   ALTER TABLE ONLY public.estoque_saldo DROP CONSTRAINT fk_saldoproduto;
       public          postgres    false    2733    206    209         �
           2606    16693    vendaprod fk_vendacliente    FK CONSTRAINT     �   ALTER TABLE ONLY public.vendaprod
    ADD CONSTRAINT fk_vendacliente FOREIGN KEY (idcliente) REFERENCES public.cliente(idcliente);
 C   ALTER TABLE ONLY public.vendaprod DROP CONSTRAINT fk_vendacliente;
       public          postgres    false    211    2731    204         �
           2606    16683    vendaprod fk_vendaempresa    FK CONSTRAINT     �   ALTER TABLE ONLY public.vendaprod
    ADD CONSTRAINT fk_vendaempresa FOREIGN KEY (idempresa) REFERENCES public.empresa(idempresa);
 C   ALTER TABLE ONLY public.vendaprod DROP CONSTRAINT fk_vendaempresa;
       public          postgres    false    211    2735    208         �
           2606    16688    vendaprod fk_vendaproduto    FK CONSTRAINT     �   ALTER TABLE ONLY public.vendaprod
    ADD CONSTRAINT fk_vendaproduto FOREIGN KEY (idproduto) REFERENCES public.produto(idproduto);
 C   ALTER TABLE ONLY public.vendaprod DROP CONSTRAINT fk_vendaproduto;
       public          postgres    false    2733    211    206                                                                  2872.dat                                                                                            0000600 0004000 0002000 00000000067 14433765147 0014275 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	\N	xzcxc	\N	zxxz	\N	\N
2	\N	sadsaad	\N	\N	\N	\N
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                         2883.dat                                                                                            0000600 0004000 0002000 00000000157 14433765147 0014277 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	1	2023-05-04	10.000000	5.000000
2	1	1	2023-05-04	1.000000	1.000000
3	1	1	2023-05-04	1.000000	5.000000
\.


                                                                                                                                                                                                                                                                                                                                                                                                                 2876.dat                                                                                            0000600 0004000 0002000 00000000133 14433765147 0014273 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	rua jose	Gabriela LTDA	46353632	@tesete	1452632	Gabriela
2	\N	\N	\N	\N	\N	testegabi
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                     2877.dat                                                                                            0000600 0004000 0002000 00000000014 14433765147 0014272 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	\N
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    2874.dat                                                                                            0000600 0004000 0002000 00000000143 14433765147 0014272 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	2023-06-01	Pao de forma	vencimento proximo	V
2	2023-06-01	pao de forma	Venciemnto proximo	V
\.


                                                                                                                                                                                                                                                                                                                                                                                                                             2881.dat                                                                                            0000600 0004000 0002000 00000000034 14433765147 0014267 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	\N	GabrielaTCC	teste
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    2879.dat                                                                                            0000600 0004000 0002000 00000000352 14433765147 0014301 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	1	1	\N	10.000000	5.000000
2	1	1	1	\N	2.000000	2.000000
3	1	1	1	\N	2.000000	2.000000
4	1	1	1	\N	1.000000	3.000000
5	1	1	1	\N	3.000000	\N
6	1	1	1	\N	1.000000	\N
7	1	1	1	\N	3.000000	5.000000
8	1	1	1	2023-05-04	1.000000	3.000000
\.


                                                                                                                                                                                                                                                                                      restore.sql                                                                                         0000600 0004000 0002000 00000026763 14433765147 0015420 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 12.14
-- Dumped by pg_dump version 15.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


--
-- Name: estoque_add(integer, integer, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.estoque_add(idproduto integer, idempresa integer, qtd numeric) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
        INSERT INTO ESTOQUE_SALDO (IDEMPRESA, IDPRODUTO, QTDPRODUTO) 
		VALUES(idempresa, idproduto, qtd);

        COMMIT;
		return true;
END;
$$;


ALTER FUNCTION public.estoque_add(idproduto integer, idempresa integer, qtd numeric) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    idcliente integer NOT NULL,
    dtnascimento date,
    nome text,
    cpf text,
    celular text,
    email text,
    endereco text
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- Name: cliente_idcliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cliente ALTER COLUMN idcliente ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cliente_idcliente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: compraprod; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compraprod (
    idcompra integer NOT NULL,
    idempresa integer NOT NULL,
    idproduto integer NOT NULL,
    dtcompra date,
    valorprod numeric,
    qtdproduto numeric
);


ALTER TABLE public.compraprod OWNER TO postgres;

--
-- Name: compraprod_idcompra_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.compraprod ALTER COLUMN idcompra ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.compraprod_idcompra_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999
    CACHE 1
);


--
-- Name: empresa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empresa (
    idempresa integer NOT NULL,
    endereco text,
    razaosocial text,
    telefone text,
    email text,
    cnpj text,
    nome text
);


ALTER TABLE public.empresa OWNER TO postgres;

--
-- Name: empresa_idempresa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.empresa ALTER COLUMN idempresa ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.empresa_idempresa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999
    CACHE 1
);


--
-- Name: estoque_saldo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estoque_saldo (
    idempresa integer NOT NULL,
    idproduto integer NOT NULL,
    qtdproduto numeric
);


ALTER TABLE public.estoque_saldo OWNER TO postgres;

--
-- Name: produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produto (
    idproduto integer NOT NULL,
    dtvalidade date,
    descricao text,
    observacao text,
    tipoproduto "char"
);


ALTER TABLE public.produto OWNER TO postgres;

--
-- Name: produto_idproduto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.produto ALTER COLUMN idproduto ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.produto_idproduto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999
    CACHE 1
);


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    idusuario integer NOT NULL,
    dtcadastro date,
    nome text,
    senha text
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- Name: usuarios_idusuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.usuarios ALTER COLUMN idusuario ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.usuarios_idusuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999
    CACHE 1
);


--
-- Name: vendaprod; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendaprod (
    idvenda integer NOT NULL,
    idempresa integer NOT NULL,
    idproduto integer NOT NULL,
    idcliente integer NOT NULL,
    dtvenda date,
    valorprod numeric,
    qtdproduto numeric
);


ALTER TABLE public.vendaprod OWNER TO postgres;

--
-- Name: vendaprod_idvenda_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.vendaprod ALTER COLUMN idvenda ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.vendaprod_idvenda_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999
    CACHE 1
);


--
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (idcliente, dtnascimento, nome, cpf, celular, email, endereco) FROM stdin;
\.
COPY public.cliente (idcliente, dtnascimento, nome, cpf, celular, email, endereco) FROM '$$PATH$$/2872.dat';

--
-- Data for Name: compraprod; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.compraprod (idcompra, idempresa, idproduto, dtcompra, valorprod, qtdproduto) FROM stdin;
\.
COPY public.compraprod (idcompra, idempresa, idproduto, dtcompra, valorprod, qtdproduto) FROM '$$PATH$$/2883.dat';

--
-- Data for Name: empresa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empresa (idempresa, endereco, razaosocial, telefone, email, cnpj, nome) FROM stdin;
\.
COPY public.empresa (idempresa, endereco, razaosocial, telefone, email, cnpj, nome) FROM '$$PATH$$/2876.dat';

--
-- Data for Name: estoque_saldo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estoque_saldo (idempresa, idproduto, qtdproduto) FROM stdin;
\.
COPY public.estoque_saldo (idempresa, idproduto, qtdproduto) FROM '$$PATH$$/2877.dat';

--
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produto (idproduto, dtvalidade, descricao, observacao, tipoproduto) FROM stdin;
\.
COPY public.produto (idproduto, dtvalidade, descricao, observacao, tipoproduto) FROM '$$PATH$$/2874.dat';

--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (idusuario, dtcadastro, nome, senha) FROM stdin;
\.
COPY public.usuarios (idusuario, dtcadastro, nome, senha) FROM '$$PATH$$/2881.dat';

--
-- Data for Name: vendaprod; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendaprod (idvenda, idempresa, idproduto, idcliente, dtvenda, valorprod, qtdproduto) FROM stdin;
\.
COPY public.vendaprod (idvenda, idempresa, idproduto, idcliente, dtvenda, valorprod, qtdproduto) FROM '$$PATH$$/2879.dat';

--
-- Name: cliente_idcliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_idcliente_seq', 2, true);


--
-- Name: compraprod_idcompra_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.compraprod_idcompra_seq', 3, true);


--
-- Name: empresa_idempresa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.empresa_idempresa_seq', 2, true);


--
-- Name: produto_idproduto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produto_idproduto_seq', 2, true);


--
-- Name: usuarios_idusuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_idusuario_seq', 1, true);


--
-- Name: vendaprod_idvenda_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendaprod_idvenda_seq', 8, true);


--
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (idcliente);


--
-- Name: empresa empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (idempresa);


--
-- Name: produto produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (idproduto);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (idusuario);


--
-- Name: compraprod fk_compraempresa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compraprod
    ADD CONSTRAINT fk_compraempresa FOREIGN KEY (idempresa) REFERENCES public.empresa(idempresa);


--
-- Name: compraprod fk_compraproduto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compraprod
    ADD CONSTRAINT fk_compraproduto FOREIGN KEY (idproduto) REFERENCES public.produto(idproduto);


--
-- Name: estoque_saldo fk_saldoempresa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estoque_saldo
    ADD CONSTRAINT fk_saldoempresa FOREIGN KEY (idempresa) REFERENCES public.empresa(idempresa);


--
-- Name: estoque_saldo fk_saldoproduto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estoque_saldo
    ADD CONSTRAINT fk_saldoproduto FOREIGN KEY (idproduto) REFERENCES public.produto(idproduto);


--
-- Name: vendaprod fk_vendacliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendaprod
    ADD CONSTRAINT fk_vendacliente FOREIGN KEY (idcliente) REFERENCES public.cliente(idcliente);


--
-- Name: vendaprod fk_vendaempresa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendaprod
    ADD CONSTRAINT fk_vendaempresa FOREIGN KEY (idempresa) REFERENCES public.empresa(idempresa);


--
-- Name: vendaprod fk_vendaproduto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendaprod
    ADD CONSTRAINT fk_vendaproduto FOREIGN KEY (idproduto) REFERENCES public.produto(idproduto);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             