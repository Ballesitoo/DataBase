--
-- PostgreSQL database dump
--

CREATE USER u_fototeca;
-- ALTER USER u_fototeca WITH SUPERUSER;

CREATE USER sl_fototeca;

CREATE USER "juan.rodriguez";
-- Dumped from database version 11.22
-- Dumped by pg_dump version 15.2

-- Started on 2024-11-13 08:34:34

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
-- TOC entry 19 (class 2615 OID 156540103)
-- Name: cms; Type: SCHEMA; Schema: -; Owner: u_fototeca
--

CREATE SCHEMA IF NOT EXISTS cms;


ALTER SCHEMA cms OWNER TO u_fototeca;

--
-- TOC entry 17 (class 2615 OID 152307012)
-- Name: fototeca; Type: SCHEMA; Schema: -; Owner: u_fototeca
--

CREATE SCHEMA IF NOT EXISTS fototeca;


ALTER SCHEMA fototeca OWNER TO u_fototeca;

--
-- TOC entry 18 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: u_fototeca
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO u_fototeca;

--
-- TOC entry 20 (class 2615 OID 156540231)
-- Name: rss; Type: SCHEMA; Schema: -; Owner: u_fototeca
--

CREATE SCHEMA IF NOT EXISTS rss;


ALTER SCHEMA rss OWNER TO u_fototeca;

--
-- TOC entry 16 (class 2615 OID 152307013)
-- Name: tiger; Type: SCHEMA; Schema: -; Owner: u_fototeca
--

CREATE SCHEMA IF NOT EXISTS tiger;


ALTER SCHEMA tiger OWNER TO u_fototeca;

--
-- TOC entry 15 (class 2615 OID 152307014)
-- Name: tiger_data; Type: SCHEMA; Schema: -; Owner: u_fototeca
--

CREATE SCHEMA IF NOT EXISTS tiger_data;


ALTER SCHEMA tiger_data OWNER TO u_fototeca;

--
-- TOC entry 14 (class 2615 OID 152307015)
-- Name: topology; Type: SCHEMA; Schema: -; Owner: u_fototeca
--

CREATE SCHEMA IF NOT EXISTS topology;


ALTER SCHEMA topology OWNER TO u_fototeca;

--
-- TOC entry 6006 (class 0 OID 0)
-- Dependencies: 14
-- Name: SCHEMA topology; Type: COMMENT; Schema: -; Owner: u_fototeca
--

COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';


--
-- TOC entry 2 (class 3079 OID 152307016)
-- Name: address_standardizer; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS address_standardizer WITH SCHEMA public;


--
-- TOC entry 6008 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION address_standardizer; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION address_standardizer IS 'Used to parse an address into constituent elements. Generally used to support geocoding address normalization step.';


--
-- TOC entry 3 (class 3079 OID 152307023)
-- Name: address_standardizer_data_us; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS address_standardizer_data_us WITH SCHEMA public;


--
-- TOC entry 6009 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION address_standardizer_data_us; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION address_standardizer_data_us IS 'Address Standardizer US dataset example';


--
-- TOC entry 4 (class 3079 OID 152307066)
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- TOC entry 6010 (class 0 OID 0)
-- Dependencies: 4
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- TOC entry 5 (class 3079 OID 152307077)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 6011 (class 0 OID 0)
-- Dependencies: 5
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


--
-- TOC entry 6 (class 3079 OID 152308655)
-- Name: postgis_sfcgal; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_sfcgal WITH SCHEMA public;


--
-- TOC entry 6012 (class 0 OID 0)
-- Dependencies: 6
-- Name: EXTENSION postgis_sfcgal; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_sfcgal IS 'PostGIS SFCGAL functions';


--
-- TOC entry 7 (class 3079 OID 152308673)
-- Name: postgis_tiger_geocoder; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder WITH SCHEMA tiger;


--
-- TOC entry 6013 (class 0 OID 0)
-- Dependencies: 7
-- Name: EXTENSION postgis_tiger_geocoder; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_tiger_geocoder IS 'PostGIS tiger geocoder and reverse geocoder';


--
-- TOC entry 8 (class 3079 OID 152309099)
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- TOC entry 6014 (class 0 OID 0)
-- Dependencies: 8
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


SET default_tablespace = '';

--
-- TOC entry 321 (class 1259 OID 156540104)
-- Name: additionallayer; Type: TABLE; Schema: cms; Owner: u_fototeca
--

CREATE TABLE cms.additionallayer (
    id integer NOT NULL,
    name text NOT NULL,
    title text NOT NULL,
    url text NOT NULL,
    queryable boolean DEFAULT false NOT NULL,
    tiled boolean DEFAULT false NOT NULL,
    sort integer DEFAULT 1 NOT NULL,
    title_en text NOT NULL,
    version character varying(10) DEFAULT '1.1.1'::character varying NOT NULL
);


ALTER TABLE cms.additionallayer OWNER TO u_fototeca;

--
-- TOC entry 322 (class 1259 OID 156540114)
-- Name: additionallayer_id_seq; Type: SEQUENCE; Schema: cms; Owner: u_fototeca
--

CREATE SEQUENCE cms.additionallayer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cms.additionallayer_id_seq OWNER TO u_fototeca;

--
-- TOC entry 6015 (class 0 OID 0)
-- Dependencies: 322
-- Name: additionallayer_id_seq; Type: SEQUENCE OWNED BY; Schema: cms; Owner: u_fototeca
--

ALTER SEQUENCE cms.additionallayer_id_seq OWNED BY cms.additionallayer.id;


--
-- TOC entry 323 (class 1259 OID 156540116)
-- Name: backgroundlayer; Type: TABLE; Schema: cms; Owner: u_fototeca
--

CREATE TABLE cms.backgroundlayer (
    id integer NOT NULL,
    name character varying(300) NOT NULL,
    title character varying(300) NOT NULL,
    url character varying(300) NOT NULL,
    image text NOT NULL,
    type character varying(10) NOT NULL,
    format character varying(50),
    tilegrid_max_zoom integer,
    sort integer,
    title_en text DEFAULT ''::text NOT NULL
);


ALTER TABLE cms.backgroundlayer OWNER TO u_fototeca;

--
-- TOC entry 324 (class 1259 OID 156540123)
-- Name: backgroundlayers_id_seq; Type: SEQUENCE; Schema: cms; Owner: u_fototeca
--

CREATE SEQUENCE cms.backgroundlayers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cms.backgroundlayers_id_seq OWNER TO u_fototeca;

--
-- TOC entry 6016 (class 0 OID 0)
-- Dependencies: 324
-- Name: backgroundlayers_id_seq; Type: SEQUENCE OWNED BY; Schema: cms; Owner: u_fototeca
--

ALTER SEQUENCE cms.backgroundlayers_id_seq OWNED BY cms.backgroundlayer.id;


--
-- TOC entry 325 (class 1259 OID 156540125)
-- Name: configurations; Type: TABLE; Schema: cms; Owner: u_fototeca
--

CREATE TABLE cms.configurations (
    id integer NOT NULL,
    search_by_view boolean DEFAULT true NOT NULL,
    search_by_draw boolean DEFAULT true NOT NULL,
    search_by_mtn boolean DEFAULT true NOT NULL,
    search_by_file boolean DEFAULT true NOT NULL,
    photogram_view_hide boolean DEFAULT true NOT NULL,
    photogram_info boolean DEFAULT true NOT NULL,
    photogram_zoom boolean DEFAULT true NOT NULL,
    photogram_certify boolean DEFAULT true NOT NULL,
    mousesrs boolean DEFAULT true NOT NULL,
    scale boolean DEFAULT true NOT NULL,
    sharemap boolean DEFAULT true NOT NULL,
    calendar boolean DEFAULT true NOT NULL,
    help boolean DEFAULT true NOT NULL,
    infocoordinates boolean DEFAULT true NOT NULL,
    printermap boolean DEFAULT true NOT NULL,
    measurebar boolean DEFAULT true NOT NULL,
    zoompanel boolean DEFAULT true NOT NULL,
    ignsearch boolean DEFAULT true NOT NULL
);


ALTER TABLE cms.configurations OWNER TO u_fototeca;

--
-- TOC entry 326 (class 1259 OID 156540146)
-- Name: configurations_id_seq; Type: SEQUENCE; Schema: cms; Owner: u_fototeca
--

CREATE SEQUENCE cms.configurations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cms.configurations_id_seq OWNER TO u_fototeca;

--
-- TOC entry 6017 (class 0 OID 0)
-- Dependencies: 326
-- Name: configurations_id_seq; Type: SEQUENCE OWNED BY; Schema: cms; Owner: u_fototeca
--

ALTER SEQUENCE cms.configurations_id_seq OWNED BY cms.configurations.id;


--
-- TOC entry 327 (class 1259 OID 156540148)
-- Name: flight; Type: TABLE; Schema: cms; Owner: u_fototeca
--

CREATE TABLE cms.flight (
    id integer NOT NULL,
    title text NOT NULL,
    subtitle text NOT NULL,
    subtitle_en text NOT NULL,
    description text NOT NULL,
    description_en text NOT NULL,
    print_scales text NOT NULL,
    print_sizes text NOT NULL,
    certifiable boolean NOT NULL,
    printable boolean NOT NULL,
    layer text NOT NULL,
    files_name text NOT NULL,
    keys text NOT NULL,
    sort integer NOT NULL,
    category integer NOT NULL,
    hidden boolean DEFAULT false NOT NULL
);


ALTER TABLE cms.flight OWNER TO u_fototeca;

--
-- TOC entry 328 (class 1259 OID 156540155)
-- Name: flight_group; Type: TABLE; Schema: cms; Owner: u_fototeca
--

CREATE TABLE cms.flight_group (
    id integer NOT NULL,
    name text NOT NULL,
    name_en text NOT NULL,
    sort integer NOT NULL,
    hidden boolean DEFAULT false NOT NULL
);


ALTER TABLE cms.flight_group OWNER TO u_fototeca;

--
-- TOC entry 329 (class 1259 OID 156540162)
-- Name: flight_group_id_seq; Type: SEQUENCE; Schema: cms; Owner: u_fototeca
--

CREATE SEQUENCE cms.flight_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cms.flight_group_id_seq OWNER TO u_fototeca;

--
-- TOC entry 6018 (class 0 OID 0)
-- Dependencies: 329
-- Name: flight_group_id_seq; Type: SEQUENCE OWNED BY; Schema: cms; Owner: u_fototeca
--

ALTER SEQUENCE cms.flight_group_id_seq OWNED BY cms.flight_group.id;


--
-- TOC entry 330 (class 1259 OID 156540164)
-- Name: flight_id_seq; Type: SEQUENCE; Schema: cms; Owner: u_fototeca
--

CREATE SEQUENCE cms.flight_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cms.flight_id_seq OWNER TO u_fototeca;

--
-- TOC entry 6019 (class 0 OID 0)
-- Dependencies: 330
-- Name: flight_id_seq; Type: SEQUENCE OWNED BY; Schema: cms; Owner: u_fototeca
--

ALTER SEQUENCE cms.flight_id_seq OWNED BY cms.flight.id;


--
-- TOC entry 331 (class 1259 OID 156540166)
-- Name: help; Type: TABLE; Schema: cms; Owner: u_fototeca
--

CREATE TABLE cms.help (
    id integer NOT NULL,
    text text NOT NULL,
    text_en text NOT NULL
);


ALTER TABLE cms.help OWNER TO u_fototeca;

--
-- TOC entry 332 (class 1259 OID 156540172)
-- Name: fototeca_help_id_seq; Type: SEQUENCE; Schema: cms; Owner: u_fototeca
--

CREATE SEQUENCE cms.fototeca_help_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cms.fototeca_help_id_seq OWNER TO u_fototeca;

--
-- TOC entry 6020 (class 0 OID 0)
-- Dependencies: 332
-- Name: fototeca_help_id_seq; Type: SEQUENCE OWNED BY; Schema: cms; Owner: u_fototeca
--

ALTER SEQUENCE cms.fototeca_help_id_seq OWNED BY cms.help.id;


--
-- TOC entry 333 (class 1259 OID 156540174)
-- Name: orthophoto; Type: TABLE; Schema: cms; Owner: u_fototeca
--

CREATE TABLE cms.orthophoto (
    id integer NOT NULL,
    name text NOT NULL,
    title text NOT NULL,
    title_en text NOT NULL,
    url text NOT NULL,
    version character varying(20) DEFAULT '1.3.0'::character varying NOT NULL,
    description text NOT NULL,
    description_en text NOT NULL,
    sort integer NOT NULL,
    category integer NOT NULL,
    hidden boolean DEFAULT false NOT NULL
);


ALTER TABLE cms.orthophoto OWNER TO u_fototeca;

--
-- TOC entry 334 (class 1259 OID 156540182)
-- Name: orthophoto_group; Type: TABLE; Schema: cms; Owner: u_fototeca
--

CREATE TABLE cms.orthophoto_group (
    id integer NOT NULL,
    name text NOT NULL,
    name_en text NOT NULL,
    sort integer NOT NULL,
    hidden boolean DEFAULT false NOT NULL
);


ALTER TABLE cms.orthophoto_group OWNER TO u_fototeca;

--
-- TOC entry 335 (class 1259 OID 156540189)
-- Name: orthophoto_group_id_seq; Type: SEQUENCE; Schema: cms; Owner: u_fototeca
--

CREATE SEQUENCE cms.orthophoto_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cms.orthophoto_group_id_seq OWNER TO u_fototeca;

--
-- TOC entry 6021 (class 0 OID 0)
-- Dependencies: 335
-- Name: orthophoto_group_id_seq; Type: SEQUENCE OWNED BY; Schema: cms; Owner: u_fototeca
--

ALTER SEQUENCE cms.orthophoto_group_id_seq OWNED BY cms.orthophoto_group.id;


--
-- TOC entry 336 (class 1259 OID 156540191)
-- Name: orthophoto_id_seq; Type: SEQUENCE; Schema: cms; Owner: u_fototeca
--

CREATE SEQUENCE cms.orthophoto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cms.orthophoto_id_seq OWNER TO u_fototeca;

--
-- TOC entry 6022 (class 0 OID 0)
-- Dependencies: 336
-- Name: orthophoto_id_seq; Type: SEQUENCE OWNED BY; Schema: cms; Owner: u_fototeca
--

ALTER SEQUENCE cms.orthophoto_id_seq OWNED BY cms.orthophoto.id;


--
-- TOC entry 287 (class 1259 OID 152309242)
-- Name: almacenamiento; Type: TABLE; Schema: fototeca; Owner: u_fototeca
--

CREATE TABLE fototeca.almacenamiento (
    ref_contenedor character varying(10) NOT NULL,
    ubicacion character varying(50) NOT NULL,
    tipo_contenedor character varying(50) NOT NULL
);


ALTER TABLE fototeca.almacenamiento OWNER TO u_fototeca;

--
-- TOC entry 288 (class 1259 OID 152309251)
-- Name: camara; Type: TABLE; Schema: fototeca; Owner: u_fototeca
--

CREATE TABLE fototeca.camara (
    id_camara integer NOT NULL,
    tipo character varying(10) NOT NULL,
    modelo character varying(50) NOT NULL,
    num_serie character varying(50)
);


ALTER TABLE fototeca.camara OWNER TO u_fototeca;

--
-- TOC entry 289 (class 1259 OID 152309254)
-- Name: camara_id_camara_seq; Type: SEQUENCE; Schema: fototeca; Owner: u_fototeca
--

CREATE SEQUENCE fototeca.camara_id_camara_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fototeca.camara_id_camara_seq OWNER TO u_fototeca;

--
-- TOC entry 6025 (class 0 OID 0)
-- Dependencies: 289
-- Name: camara_id_camara_seq; Type: SEQUENCE OWNED BY; Schema: fototeca; Owner: u_fototeca
--

ALTER SEQUENCE fototeca.camara_id_camara_seq OWNED BY fototeca.camara.id_camara;


--
-- TOC entry 290 (class 1259 OID 152309256)
-- Name: ccaa; Type: TABLE; Schema: fototeca; Owner: u_fototeca
--

CREATE TABLE fototeca.ccaa (
    cod_ccaa character varying(3) NOT NULL,
    nom_ccaa character varying(255) NOT NULL,
    extension public.geometry(MultiPolygon) NOT NULL
);


ALTER TABLE fototeca.ccaa OWNER TO u_fototeca;

--
-- TOC entry 291 (class 1259 OID 152309262)
-- Name: copias_analogicas; Type: TABLE; Schema: fototeca; Owner: u_fototeca
--

CREATE TABLE fototeca.copias_analogicas (
    cod_fotograma_a character varying(30) NOT NULL,
    material character varying(20) NOT NULL,
    estado_conservacion character varying(500),
    ref_contenedor character varying(10),
    observaciones character varying(500)
);


ALTER TABLE fototeca.copias_analogicas OWNER TO u_fototeca;

--
-- TOC entry 292 (class 1259 OID 152309268)
-- Name: copias_digitales; Type: TABLE; Schema: fototeca; Owner: u_fototeca
--

CREATE TABLE fototeca.copias_digitales (
    id_copia_digital integer NOT NULL,
    cod_fotograma_a character varying(30),
    cod_fotograma_d character varying(50),
    nom_fichero character varying(100) NOT NULL,
    formato character varying(10) NOT NULL,
    ruta_servidor character varying(300),
    ruta_ftp character varying(300),
    ref_contenedor character varying(10),
    observaciones character varying(500),
    x_fotocentro_at double precision,
    y_fotocentro_at double precision,
    z_fotocentro_at double precision,
    giro_w_at double precision,
    giro_phi_at double precision,
    giro_k_at double precision
);


ALTER TABLE fototeca.copias_digitales OWNER TO u_fototeca;

--
-- TOC entry 293 (class 1259 OID 152309274)
-- Name: copias_digitales_id_copia_digital_seq; Type: SEQUENCE; Schema: fototeca; Owner: u_fototeca
--

CREATE SEQUENCE fototeca.copias_digitales_id_copia_digital_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fototeca.copias_digitales_id_copia_digital_seq OWNER TO u_fototeca;

--
-- TOC entry 6029 (class 0 OID 0)
-- Dependencies: 293
-- Name: copias_digitales_id_copia_digital_seq; Type: SEQUENCE OWNED BY; Schema: fototeca; Owner: u_fototeca
--

ALTER SEQUENCE fototeca.copias_digitales_id_copia_digital_seq OWNED BY fototeca.copias_digitales.id_copia_digital;


--
-- TOC entry 294 (class 1259 OID 152309284)
-- Name: fotogramas_analogicos; Type: TABLE; Schema: fototeca; Owner: u_fototeca
--

CREATE TABLE fototeca.fotogramas_analogicos (
    cod_fotograma_a character varying(30) NOT NULL,
    pasada character varying(10) NOT NULL,
    fecha_fotograma character varying(40) NOT NULL,
    cod_vuelo character varying(30) NOT NULL,
    formato character varying(20),
    empresa character varying(30),
    escaneado boolean,
    num_hoja50_grafico character varying(10) NOT NULL,
    id_camara integer,
    observaciones character varying(500)
);


ALTER TABLE fototeca.fotogramas_analogicos OWNER TO u_fototeca;

--
-- TOC entry 295 (class 1259 OID 152309290)
-- Name: fotogramas_digitales; Type: TABLE; Schema: fototeca; Owner: u_fototeca
--

CREATE TABLE fototeca.fotogramas_digitales (
    cod_fotograma_d character varying(50) NOT NULL,
    pasada character varying(40) NOT NULL,
    fecha_fotograma character varying(10) NOT NULL,
    cod_vuelo character varying(30) NOT NULL,
    x_fotocentro double precision NOT NULL,
    y_fotocentro double precision NOT NULL,
    num_filas integer,
    num_column integer,
    epsg character varying(10) NOT NULL,
    num_hoja50 character varying(10) NOT NULL,
    id_camara integer,
    observaciones character varying(254),
    huella public.geometry,
    fotocentro public.geometry
);


ALTER TABLE fototeca.fotogramas_digitales OWNER TO u_fototeca;

--
-- TOC entry 296 (class 1259 OID 152309296)
-- Name: fotogramas_escaneados; Type: TABLE; Schema: fototeca; Owner: u_fototeca
--

CREATE TABLE fototeca.fotogramas_escaneados (
    cod_fotograma_a character varying(30) NOT NULL,
    epsg character varying(10),
    georreferenciado boolean NOT NULL,
    "tamaño_pixel" integer,
    observaciones character varying(500),
    centro_imagen public.geometry,
    x_fotocentro double precision,
    y_fotocentro double precision,
    num_filas integer,
    num_columnas integer,
    empresa_esc character varying(30),
    modelo_esc character varying(30),
    fecha_esc date,
    rmse_oi double precision,
    x_tfw double precision,
    y_tfw double precision,
    huella public.geometry(Geometry,3857)
);


ALTER TABLE fototeca.fotogramas_escaneados OWNER TO u_fototeca;

--
-- TOC entry 297 (class 1259 OID 152309302)
-- Name: hoja_mtn25; Type: TABLE; Schema: fototeca; Owner: u_fototeca
--

CREATE TABLE fototeca.hoja_mtn25 (
    num_hoja25 character varying(20) NOT NULL,
    nom_hoja25 character varying(50),
    cuadricula public.geometry(MultiPolygon) NOT NULL
);


ALTER TABLE fototeca.hoja_mtn25 OWNER TO u_fototeca;

--
-- TOC entry 298 (class 1259 OID 152309308)
-- Name: hoja_mtn50; Type: TABLE; Schema: fototeca; Owner: u_fototeca
--

CREATE TABLE fototeca.hoja_mtn50 (
    num_hoja50 character varying(50) NOT NULL,
    nom_hoja50 character varying(50),
    cuadricula public.geometry(MultiPolygon) NOT NULL
);


ALTER TABLE fototeca.hoja_mtn50 OWNER TO u_fototeca;

--
-- TOC entry 299 (class 1259 OID 152309322)
-- Name: l_alm_fisico; Type: TABLE; Schema: fototeca; Owner: u_fototeca
--

CREATE TABLE fototeca.l_alm_fisico (
    alm_fisico character varying(50) NOT NULL
);


ALTER TABLE fototeca.l_alm_fisico OWNER TO u_fototeca;

--
-- TOC entry 300 (class 1259 OID 152309325)
-- Name: l_camara; Type: TABLE; Schema: fototeca; Owner: u_fototeca
--

CREATE TABLE fototeca.l_camara (
    camara character varying(50) NOT NULL
);


ALTER TABLE fototeca.l_camara OWNER TO u_fototeca;

--
-- TOC entry 301 (class 1259 OID 152309328)
-- Name: l_camara_ns; Type: TABLE; Schema: fototeca; Owner: u_fototeca
--

CREATE TABLE fototeca.l_camara_ns (
    camara_ns character varying(50) NOT NULL
);


ALTER TABLE fototeca.l_camara_ns OWNER TO u_fototeca;

--
-- TOC entry 318 (class 1259 OID 155917013)
-- Name: l_color; Type: TABLE; Schema: fototeca; Owner: u_fototeca
--

CREATE TABLE fototeca.l_color (
    color character varying(50) NOT NULL
);


ALTER TABLE fototeca.l_color OWNER TO u_fototeca;

--
-- TOC entry 302 (class 1259 OID 152309331)
-- Name: l_dimensiones; Type: TABLE; Schema: fototeca; Owner: u_fototeca
--

CREATE TABLE fototeca.l_dimensiones (
    dimensiones character varying(20) NOT NULL
);


ALTER TABLE fototeca.l_dimensiones OWNER TO u_fototeca;

--
-- TOC entry 303 (class 1259 OID 152309334)
-- Name: l_estado_pedido; Type: TABLE; Schema: fototeca; Owner: u_fototeca
--

CREATE TABLE fototeca.l_estado_pedido (
    estado_pedido character varying(20) NOT NULL
);


ALTER TABLE fototeca.l_estado_pedido OWNER TO u_fototeca;

--
-- TOC entry 304 (class 1259 OID 152309337)
-- Name: l_sistema_referencia; Type: TABLE; Schema: fototeca; Owner: u_fototeca
--

CREATE TABLE fototeca.l_sistema_referencia (
    sistema_referencia character varying(10) NOT NULL
);


ALTER TABLE fototeca.l_sistema_referencia OWNER TO u_fototeca;

--
-- TOC entry 305 (class 1259 OID 152309340)
-- Name: l_tipo_camara; Type: TABLE; Schema: fototeca; Owner: u_fototeca
--

CREATE TABLE fototeca.l_tipo_camara (
    tipo_camara character varying(10) NOT NULL
);


ALTER TABLE fototeca.l_tipo_camara OWNER TO u_fototeca;

--
-- TOC entry 306 (class 1259 OID 152309343)
-- Name: l_tipo_contenedor; Type: TABLE; Schema: fototeca; Owner: u_fototeca
--

CREATE TABLE fototeca.l_tipo_contenedor (
    tipo_contenedor character varying(50) NOT NULL
);


ALTER TABLE fototeca.l_tipo_contenedor OWNER TO u_fototeca;

--
-- TOC entry 307 (class 1259 OID 152309346)
-- Name: l_tipo_formato; Type: TABLE; Schema: fototeca; Owner: u_fototeca
--

CREATE TABLE fototeca.l_tipo_formato (
    tipo_formato character varying(10) NOT NULL
);


ALTER TABLE fototeca.l_tipo_formato OWNER TO u_fototeca;

--
-- TOC entry 308 (class 1259 OID 152309349)
-- Name: l_tipo_material; Type: TABLE; Schema: fototeca; Owner: u_fototeca
--

CREATE TABLE fototeca.l_tipo_material (
    tipo_material character varying(20) NOT NULL
);


ALTER TABLE fototeca.l_tipo_material OWNER TO u_fototeca;

--
-- TOC entry 309 (class 1259 OID 152309352)
-- Name: l_tipo_producto; Type: TABLE; Schema: fototeca; Owner: u_fototeca
--

CREATE TABLE fototeca.l_tipo_producto (
    tipo_producto character varying(30) NOT NULL
);


ALTER TABLE fototeca.l_tipo_producto OWNER TO u_fototeca;

--
-- TOC entry 310 (class 1259 OID 152309355)
-- Name: l_tipo_vuelo; Type: TABLE; Schema: fototeca; Owner: u_fototeca
--

CREATE TABLE fototeca.l_tipo_vuelo (
    tipo_vuelo character varying(20) NOT NULL
);


ALTER TABLE fototeca.l_tipo_vuelo OWNER TO u_fototeca;

--
-- TOC entry 311 (class 1259 OID 152309358)
-- Name: municipios; Type: TABLE; Schema: fototeca; Owner: u_fototeca
--

CREATE TABLE fototeca.municipios (
    cod_muni character varying(30) NOT NULL,
    nom_muni character varying(255) NOT NULL,
    cod_prov character varying(5) NOT NULL,
    nom_muni_01 character varying(255) NOT NULL,
    extension public.geometry(MultiPolygon) NOT NULL
);


ALTER TABLE fototeca.municipios OWNER TO u_fototeca;

--
-- TOC entry 340 (class 1259 OID 220906742)
-- Name: pnoa_2024; Type: TABLE; Schema: fototeca; Owner: juan.rodriguez
--

CREATE TABLE fototeca.pnoa_2024 (
    cod_fotograma_d character varying(50),
    ruta_servidor character varying(300),
    ruta_ftp character varying(300),
    fecha_fotograma character varying(10),
    gsd integer,
    fotocentro public.geometry
);


ALTER TABLE fototeca.pnoa_2024 OWNER TO "juan.rodriguez";

--
-- TOC entry 312 (class 1259 OID 152309364)
-- Name: prestamos_archivo; Type: TABLE; Schema: fototeca; Owner: u_fototeca
--

CREATE TABLE fototeca.prestamos_archivo (
    id_prestamo integer NOT NULL,
    nombre_usuario character varying(100) NOT NULL,
    nombre_peticionario character varying(100) NOT NULL,
    departamento character varying(100) NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date,
    estado character varying(20) NOT NULL,
    ref_producto character varying(100),
    tipo character varying(30),
    descripcion_producto character varying(100) NOT NULL,
    almacenamiento character varying(500),
    observaciones character varying(500)
);


ALTER TABLE fototeca.prestamos_archivo OWNER TO u_fototeca;

--
-- TOC entry 313 (class 1259 OID 152309370)
-- Name: prestamos_archivo_id_prestamo_seq; Type: SEQUENCE; Schema: fototeca; Owner: u_fototeca
--

CREATE SEQUENCE fototeca.prestamos_archivo_id_prestamo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fototeca.prestamos_archivo_id_prestamo_seq OWNER TO u_fototeca;

--
-- TOC entry 6049 (class 0 OID 0)
-- Dependencies: 313
-- Name: prestamos_archivo_id_prestamo_seq; Type: SEQUENCE OWNED BY; Schema: fototeca; Owner: u_fototeca
--

ALTER SEQUENCE fototeca.prestamos_archivo_id_prestamo_seq OWNED BY fototeca.prestamos_archivo.id_prestamo;


--
-- TOC entry 314 (class 1259 OID 152309372)
-- Name: provincias; Type: TABLE; Schema: fototeca; Owner: u_fototeca
--

CREATE TABLE fototeca.provincias (
    cod_prov character varying(5) NOT NULL,
    nom_prov character varying(40) NOT NULL,
    cod_ccaa character varying(3) NOT NULL,
    extension public.geometry(MultiPolygon) NOT NULL
);


ALTER TABLE fototeca.provincias OWNER TO u_fototeca;

--
-- TOC entry 320 (class 1259 OID 155975949)
-- Name: prueba; Type: TABLE; Schema: fototeca; Owner: u_fototeca
--

CREATE TABLE fototeca.prueba (
    cod_vuelo character varying(30),
    nom_vuelo character varying(50),
    tipo character varying(20),
    "año" character varying(100),
    metadata_url character varying(250),
    extension public.geometry,
    num_fotogramas integer,
    escala character varying,
    grafico boolean,
    color character varying,
    gsd integer
);


ALTER TABLE fototeca.prueba OWNER TO u_fototeca;

--
-- TOC entry 315 (class 1259 OID 152309378)
-- Name: vuelos; Type: TABLE; Schema: fototeca; Owner: u_fototeca
--

CREATE TABLE fototeca.vuelos (
    cod_vuelo character varying(30) NOT NULL,
    nom_vuelo character varying(50),
    tipo character varying(20) NOT NULL,
    certificable boolean NOT NULL,
    descripcion character varying(2000),
    "año" character varying(100) NOT NULL,
    ruta_doc character varying(300),
    ruta_catalogo character varying(300),
    extension public.geometry,
    observaciones character varying(1000),
    geojson character varying(300),
    num_fotogramas integer,
    metadata_url character varying(250),
    color character varying(55),
    id_layer_wms character varying(250),
    url_infoaux_cdd character varying(250),
    url_cdd character varying(250)
);


ALTER TABLE fototeca.vuelos OWNER TO u_fototeca;

--
-- TOC entry 316 (class 1259 OID 152309384)
-- Name: vuelos_analogicos; Type: TABLE; Schema: fototeca; Owner: u_fototeca
--

CREATE TABLE fototeca.vuelos_analogicos (
    cod_vuelo character varying(30) NOT NULL,
    escala character varying(30) NOT NULL,
    recub_long double precision,
    recub_trans double precision,
    grafico boolean NOT NULL,
    grafico_esc boolean NOT NULL,
    escaneado boolean NOT NULL,
    observaciones character varying(2000)
);


ALTER TABLE fototeca.vuelos_analogicos OWNER TO u_fototeca;

--
-- TOC entry 317 (class 1259 OID 152309390)
-- Name: vuelos_digitales; Type: TABLE; Schema: fototeca; Owner: u_fototeca
--

CREATE TABLE fototeca.vuelos_digitales (
    cod_vuelo character varying(30) NOT NULL,
    gsd integer,
    foto_tiff_rgb boolean NOT NULL,
    foto_tiff_rgbi boolean NOT NULL,
    foto_tiff_ir boolean NOT NULL,
    foto_tiff_irg boolean NOT NULL,
    foto_tiff_pan boolean NOT NULL,
    foto_comp_rgb boolean NOT NULL,
    foto_comp_rgbi boolean NOT NULL,
    foto_comp_ir boolean NOT NULL,
    foto_comp_irg boolean NOT NULL,
    foto_comp_pan boolean NOT NULL,
    orto_tiff_rgb boolean NOT NULL,
    orto_tiff_rgbi boolean NOT NULL,
    orto_tiff_ir boolean NOT NULL,
    orto_tiff_irg boolean NOT NULL,
    orto_tiff_pan boolean NOT NULL,
    orto_comp_rgb boolean NOT NULL,
    orto_comp_rgbi boolean NOT NULL,
    orto_comp_ir boolean NOT NULL,
    orto_comp_irg boolean NOT NULL,
    orto_comp_pan boolean NOT NULL,
    observaciones character varying(2000),
    recub_long double precision,
    recub_trans double precision
);


ALTER TABLE fototeca.vuelos_digitales OWNER TO u_fototeca;

--
-- TOC entry 341 (class 1259 OID 220917318)
-- Name: vista1; Type: VIEW; Schema: fototeca; Owner: u_fototeca
--

CREATE VIEW fototeca.vista1 AS
 SELECT copias_digitales.id_copia_digital,
    copias_digitales.nom_fichero,
    copias_digitales.formato,
    copias_digitales.cod_fotograma_a AS cod_fotograma,
    fotogramas_analogicos.pasada,
    fotogramas_analogicos.fecha_fotograma,
    fotogramas_escaneados.x_fotocentro,
    fotogramas_escaneados.y_fotocentro,
    fotogramas_escaneados.epsg,
    fotogramas_escaneados."tamaño_pixel",
    vuelos.cod_vuelo,
    vuelos.nom_vuelo,
    vuelos.tipo,
    vuelos.descripcion,
    vuelos.observaciones,
    vuelos.url_infoaux_cdd,
    vuelos_analogicos.escala,
    vuelos_analogicos.recub_long,
    vuelos_analogicos.recub_trans,
    NULL::integer AS gsd,
    NULL::boolean AS foto_tiff_rgb,
    NULL::boolean AS foto_tiff_rgbi,
    NULL::boolean AS foto_tiff_ir,
    NULL::boolean AS foto_tiff_irg,
    NULL::boolean AS foto_tiff_pan,
    NULL::boolean AS foto_comp_rgb,
    NULL::boolean AS foto_comp_rgbi,
    NULL::boolean AS foto_comp_ir,
    NULL::boolean AS foto_comp_irg,
    NULL::boolean AS foto_comp_pan,
    NULL::boolean AS orto_tiff_rgb,
    NULL::boolean AS orto_tiff_rgbi,
    NULL::boolean AS orto_tiff_ir,
    NULL::boolean AS orto_tiff_irg,
    NULL::boolean AS orto_tiff_pan,
    NULL::boolean AS orto_comp_rgb,
    NULL::boolean AS orto_comp_rgbi,
    NULL::boolean AS orto_comp_ir,
    NULL::boolean AS orto_comp_irg,
    NULL::boolean AS orto_comp_pan,
    copias_digitales.x_fotocentro_at,
    copias_digitales.y_fotocentro_at,
    copias_digitales.z_fotocentro_at,
    copias_digitales.giro_w_at,
    copias_digitales.giro_phi_at,
    copias_digitales.giro_k_at
   FROM fototeca.copias_digitales,
    fototeca.fotogramas_analogicos,
    fototeca.fotogramas_escaneados,
    fototeca.vuelos,
    fototeca.vuelos_analogicos
  WHERE ((copias_digitales.cod_fotograma_a IS NOT NULL) AND ((copias_digitales.cod_fotograma_a)::text = (fotogramas_analogicos.cod_fotograma_a)::text) AND ((fotogramas_escaneados.cod_fotograma_a)::text = (fotogramas_analogicos.cod_fotograma_a)::text) AND ((vuelos_analogicos.cod_vuelo)::text = (fotogramas_analogicos.cod_vuelo)::text) AND ((vuelos_analogicos.cod_vuelo)::text = (vuelos.cod_vuelo)::text))
UNION ALL
 SELECT copias_digitales.id_copia_digital,
    copias_digitales.nom_fichero,
    copias_digitales.formato,
    copias_digitales.cod_fotograma_d AS cod_fotograma,
    fotogramas_digitales.pasada,
    fotogramas_digitales.fecha_fotograma,
    fotogramas_digitales.x_fotocentro,
    fotogramas_digitales.y_fotocentro,
    fotogramas_digitales.epsg,
    NULL::integer AS "tamaño_pixel",
    vuelos.cod_vuelo,
    vuelos.nom_vuelo,
    vuelos.tipo,
    vuelos.descripcion,
    vuelos.observaciones,
    vuelos.url_infoaux_cdd,
    NULL::character varying AS escala,
    NULL::double precision AS recub_long,
    NULL::double precision AS recub_trans,
    vuelos_digitales.gsd,
    vuelos_digitales.foto_tiff_rgb,
    vuelos_digitales.foto_tiff_rgbi,
    vuelos_digitales.foto_tiff_ir,
    vuelos_digitales.foto_tiff_irg,
    vuelos_digitales.foto_tiff_pan,
    vuelos_digitales.foto_comp_rgb,
    vuelos_digitales.foto_comp_rgbi,
    vuelos_digitales.foto_comp_ir,
    vuelos_digitales.foto_comp_irg,
    vuelos_digitales.foto_comp_pan,
    vuelos_digitales.orto_tiff_rgb,
    vuelos_digitales.orto_tiff_rgbi,
    vuelos_digitales.orto_tiff_ir,
    vuelos_digitales.orto_tiff_irg,
    vuelos_digitales.orto_tiff_pan,
    vuelos_digitales.orto_comp_rgb,
    vuelos_digitales.orto_comp_rgbi,
    vuelos_digitales.orto_comp_ir,
    vuelos_digitales.orto_comp_irg,
    vuelos_digitales.orto_comp_pan,
    copias_digitales.x_fotocentro_at,
    copias_digitales.y_fotocentro_at,
    copias_digitales.z_fotocentro_at,
    copias_digitales.giro_w_at,
    copias_digitales.giro_phi_at,
    copias_digitales.giro_k_at
   FROM fototeca.copias_digitales,
    fototeca.fotogramas_digitales,
    fototeca.vuelos,
    fototeca.vuelos_digitales
  WHERE ((copias_digitales.cod_fotograma_d IS NOT NULL) AND ((copias_digitales.cod_fotograma_d)::text = (fotogramas_digitales.cod_fotograma_d)::text) AND ((vuelos_digitales.cod_vuelo)::text = (fotogramas_digitales.cod_vuelo)::text) AND ((vuelos_digitales.cod_vuelo)::text = (vuelos.cod_vuelo)::text));


ALTER TABLE fototeca.vista1 OWNER TO u_fototeca;

--
-- TOC entry 342 (class 1259 OID 220917323)
-- Name: vista2; Type: VIEW; Schema: fototeca; Owner: u_fototeca
--

CREATE VIEW fototeca.vista2 AS
 SELECT vuelos.cod_vuelo,
    vuelos.nom_vuelo,
    vuelos.tipo,
    vuelos.descripcion,
    vuelos."año",
    vuelos.observaciones,
    vuelos.url_infoaux_cdd,
    vuelos.extension,
    vuelos.certificable,
    vuelos.color,
    vuelos_analogicos.escala,
    vuelos_analogicos.recub_long,
    vuelos_analogicos.recub_trans,
    NULL::integer AS gsd,
    NULL::boolean AS foto_tiff_rgb,
    NULL::boolean AS foto_tiff_rgbi,
    NULL::boolean AS foto_tiff_ir,
    NULL::boolean AS foto_tiff_irg,
    NULL::boolean AS foto_tiff_pan,
    NULL::boolean AS foto_comp_rgb,
    NULL::boolean AS foto_comp_rgbi,
    NULL::boolean AS foto_comp_ir,
    NULL::boolean AS foto_comp_irg,
    NULL::boolean AS foto_comp_pan,
    NULL::boolean AS orto_tiff_rgb,
    NULL::boolean AS orto_tiff_rgbi,
    NULL::boolean AS orto_tiff_ir,
    NULL::boolean AS orto_tiff_irg,
    NULL::boolean AS orto_tiff_pan,
    NULL::boolean AS orto_comp_rgb,
    NULL::boolean AS orto_comp_rgbi,
    NULL::boolean AS orto_comp_ir,
    NULL::boolean AS orto_comp_irg,
    NULL::boolean AS orto_comp_pan,
    vuelos.metadata_url
   FROM fototeca.vuelos,
    fototeca.vuelos_analogicos
  WHERE ((vuelos_analogicos.cod_vuelo)::text = (vuelos.cod_vuelo)::text)
UNION ALL
 SELECT vuelos.cod_vuelo,
    vuelos.nom_vuelo,
    vuelos.tipo,
    vuelos.descripcion,
    vuelos."año",
    vuelos.observaciones,
    vuelos.url_infoaux_cdd,
    vuelos.extension,
    vuelos.certificable,
    NULL::character varying AS color,
    NULL::character varying AS escala,
    NULL::double precision AS recub_long,
    NULL::double precision AS recub_trans,
    vuelos_digitales.gsd,
    vuelos_digitales.foto_tiff_rgb,
    vuelos_digitales.foto_tiff_rgbi,
    vuelos_digitales.foto_tiff_ir,
    vuelos_digitales.foto_tiff_irg,
    vuelos_digitales.foto_tiff_pan,
    vuelos_digitales.foto_comp_rgb,
    vuelos_digitales.foto_comp_rgbi,
    vuelos_digitales.foto_comp_ir,
    vuelos_digitales.foto_comp_irg,
    vuelos_digitales.foto_comp_pan,
    vuelos_digitales.orto_tiff_rgb,
    vuelos_digitales.orto_tiff_rgbi,
    vuelos_digitales.orto_tiff_ir,
    vuelos_digitales.orto_tiff_irg,
    vuelos_digitales.orto_tiff_pan,
    vuelos_digitales.orto_comp_rgb,
    vuelos_digitales.orto_comp_rgbi,
    vuelos_digitales.orto_comp_ir,
    vuelos_digitales.orto_comp_irg,
    vuelos_digitales.orto_comp_pan,
    vuelos.metadata_url
   FROM fototeca.vuelos,
    fototeca.vuelos_digitales
  WHERE ((vuelos_digitales.cod_vuelo)::text = (vuelos.cod_vuelo)::text);


ALTER TABLE fototeca.vista2 OWNER TO u_fototeca;

--
-- TOC entry 339 (class 1259 OID 205664195)
-- Name: vista_ckan; Type: VIEW; Schema: fototeca; Owner: u_fototeca
--

CREATE VIEW fototeca.vista_ckan AS
 SELECT vuelos.cod_vuelo,
    vuelos.nom_vuelo,
    vuelos.tipo,
    vuelos."año",
    vuelos.metadata_url,
    vuelos.extension,
    vuelos.id_layer_wms,
    vuelos.url_infoaux_cdd,
    vuelos.url_cdd,
    vuelos.num_fotogramas,
    vuelos_analogicos.escala,
    vuelos_analogicos.grafico,
    vuelos.color,
    NULL::integer AS gsd
   FROM fototeca.vuelos,
    fototeca.vuelos_analogicos
  WHERE ((vuelos_analogicos.cod_vuelo)::text = (vuelos.cod_vuelo)::text)
UNION ALL
 SELECT vuelos.cod_vuelo,
    vuelos.nom_vuelo,
    vuelos.tipo,
    vuelos."año",
    vuelos.metadata_url,
    vuelos.extension,
    vuelos.id_layer_wms,
    vuelos.url_infoaux_cdd,
    vuelos.url_cdd,
    vuelos.num_fotogramas,
    NULL::character varying AS escala,
    NULL::boolean AS grafico,
    NULL::character varying AS color,
    vuelos_digitales.gsd
   FROM fototeca.vuelos,
    fototeca.vuelos_digitales
  WHERE ((vuelos_digitales.cod_vuelo)::text = (vuelos.cod_vuelo)::text);


ALTER TABLE fototeca.vista_ckan OWNER TO u_fototeca;

--
-- TOC entry 343 (class 1259 OID 220917339)
-- Name: vista_ckan_distribuciones; Type: VIEW; Schema: fototeca; Owner: u_fototeca
--

CREATE VIEW fototeca.vista_ckan_distribuciones AS
 SELECT vuelos.cod_vuelo,
    ('https://wms-fototeca.idee.es/fototeca?request=GetCapabilities&service=WMS#'::text || lower((vuelos.id_layer_wms)::text)) AS url,
    ('Distribución WMS del vuelo '::text || (vuelos.cod_vuelo)::text) AS titulo,
    (('Esta es una distribución en formato WMS para el vuelo '::text || (vuelos.cod_vuelo)::text) || ', proporcionando acceso a los datos visuales a través de un servicio WMS.'::text) AS descripcion
   FROM ((fototeca.vuelos
     LEFT JOIN fototeca.vuelos_analogicos ON (((vuelos_analogicos.cod_vuelo)::text = (vuelos.cod_vuelo)::text)))
     LEFT JOIN fototeca.vuelos_digitales ON (((vuelos_digitales.cod_vuelo)::text = (vuelos.cod_vuelo)::text)))
  WHERE (NOT ((vuelos.id_layer_wms)::text = ''::text))
UNION ALL (
         SELECT vuelos.cod_vuelo,
            vuelos.metadata_url AS url,
            ('Metadatos INSPIRE ISO19139 del vuelo '::text || (vuelos.cod_vuelo)::text) AS titulo,
            (('Distribución de metadatos estructurados para el vuelo '::text || (vuelos.cod_vuelo)::text) || ', proporcionando acceso a los metadatos de datos y servicios INSPIRE basados en la ISO/TS 19139 (versión 2.0.1).'::text) AS descripcion
           FROM fototeca.vuelos
          WHERE (NOT ((vuelos.metadata_url)::text = ''::text))
        UNION ALL
         SELECT vuelos.cod_vuelo,
            vuelos.url_infoaux_cdd AS url,
            ('Información auxiliar del vuelo '::text || (vuelos.cod_vuelo)::text) AS titulo,
            (('BDD de vuelo, AT y certificado de cámara del vuelo  '::text || (vuelos.cod_vuelo)::text) || ', en formato zip'::text) AS descripcion
           FROM fototeca.vuelos
          WHERE (NOT ((vuelos.url_infoaux_cdd)::text = ''::text))
        UNION ALL (
                 SELECT vuelos.cod_vuelo,
                    vuelos.url_cdd AS url,
                    ('Acceso al Centro de Descargas del vuelo '::text || (vuelos.cod_vuelo)::text) AS titulo,
                    (('Distribución de fotogramas del vuelo  '::text || (vuelos.cod_vuelo)::text) || ', desde el Centro de Descargas'::text) AS descripcion
                   FROM fototeca.vuelos
                  WHERE (NOT ((vuelos.url_cdd)::text = ''::text))
                UNION ALL
                 SELECT vuelos.cod_vuelo,
                    (('https://fototeca-datos.cnig.es/datos_vuelos/coverages/'::text || lower((vuelos.geojson)::text)) || '.geojson'::text) AS url,
                    ('Cobertura del vuelo '::text || (vuelos.nom_vuelo)::text) AS titulo,
                    ('Esta es una distribución en formato JSON para el vuelo '::text || (vuelos.cod_vuelo)::text) AS descripcion
                   FROM fototeca.vuelos
                  WHERE (NOT ((vuelos.geojson)::text = ''::text))
        )
        UNION ALL (
                 SELECT vuelos.cod_vuelo,
                    (('https://fototeca-datos.cnig.es/datos_vuelos/centers/'::text || lower((vuelos.geojson)::text)) || '.geojson'::text) AS url,
                    ('Fotocentros de los fotogramas del vuelo '::text || (vuelos.nom_vuelo)::text) AS titulo,
                    ((('Esta es una distribución en formato JSON para el vuelo '::text || (vuelos.nom_vuelo)::text) || ' ,que tiene código '::text) || (vuelos.cod_vuelo)::text) AS descripcion
                   FROM fototeca.vuelos
                  WHERE (NOT ((vuelos.geojson)::text = ''::text))
                UNION ALL
                 SELECT vuelos.cod_vuelo,
                    (('https://fototeca-datos.cnig.es/datos_vuelos/marks/'::text || lower((vuelos.geojson)::text)) || '.geojson'::text) AS url,
                    ('Huellas de los fotogramas del vuelo '::text || (vuelos.nom_vuelo)::text) AS titulo,
                    ((('Esta es una distribución en formato JSON para el vuelo '::text || (vuelos.nom_vuelo)::text) || ' ,que tiene código '::text) || (vuelos.cod_vuelo)::text) AS descripcion
                   FROM fototeca.vuelos
                  WHERE (NOT ((vuelos.geojson)::text = ''::text))
        )
);


ALTER TABLE fototeca.vista_ckan_distribuciones OWNER TO u_fototeca;

--
-- TOC entry 319 (class 1259 OID 155972895)
-- Name: vista_oe; Type: VIEW; Schema: fototeca; Owner: u_fototeca
--

CREATE VIEW fototeca.vista_oe AS
 SELECT copias_digitales.id_copia_digital,
    copias_digitales.nom_fichero,
    fotogramas_analogicos.fecha_fotograma,
    copias_digitales.x_fotocentro_at,
    copias_digitales.y_fotocentro_at,
    copias_digitales.z_fotocentro_at,
    copias_digitales.giro_w_at,
    copias_digitales.giro_phi_at,
    copias_digitales.giro_k_at
   FROM fototeca.copias_digitales,
    fototeca.fotogramas_analogicos
  WHERE ((copias_digitales.cod_fotograma_a IS NOT NULL) AND (copias_digitales.giro_w_at IS NOT NULL) AND ((copias_digitales.cod_fotograma_a)::text = (fotogramas_analogicos.cod_fotograma_a)::text))
UNION ALL
 SELECT copias_digitales.id_copia_digital,
    copias_digitales.nom_fichero,
    fotogramas_digitales.fecha_fotograma,
    copias_digitales.x_fotocentro_at,
    copias_digitales.y_fotocentro_at,
    copias_digitales.z_fotocentro_at,
    copias_digitales.giro_w_at,
    copias_digitales.giro_phi_at,
    copias_digitales.giro_k_at
   FROM fototeca.copias_digitales,
    fototeca.fotogramas_digitales
  WHERE ((copias_digitales.cod_fotograma_d IS NOT NULL) AND (copias_digitales.giro_w_at IS NOT NULL) AND ((copias_digitales.cod_fotograma_d)::text = (fotogramas_digitales.cod_fotograma_d)::text));


ALTER TABLE fototeca.vista_oe OWNER TO u_fototeca;

--
-- TOC entry 337 (class 1259 OID 156540232)
-- Name: new; Type: TABLE; Schema: rss; Owner: u_fototeca
--

CREATE TABLE rss.new (
    id integer NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    pub_date bigint
);


ALTER TABLE rss.new OWNER TO u_fototeca;

--
-- TOC entry 338 (class 1259 OID 156540238)
-- Name: news_id_seq; Type: SEQUENCE; Schema: rss; Owner: u_fototeca
--

CREATE SEQUENCE rss.news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rss.news_id_seq OWNER TO u_fototeca;

--
-- TOC entry 6062 (class 0 OID 0)
-- Dependencies: 338
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: rss; Owner: u_fototeca
--

ALTER SEQUENCE rss.news_id_seq OWNED BY rss.new.id;


--
-- TOC entry 5679 (class 2604 OID 156540193)
-- Name: additionallayer id; Type: DEFAULT; Schema: cms; Owner: u_fototeca
--

ALTER TABLE ONLY cms.additionallayer ALTER COLUMN id SET DEFAULT nextval('cms.additionallayer_id_seq'::regclass);


--
-- TOC entry 5684 (class 2604 OID 156540194)
-- Name: backgroundlayer id; Type: DEFAULT; Schema: cms; Owner: u_fototeca
--

ALTER TABLE ONLY cms.backgroundlayer ALTER COLUMN id SET DEFAULT nextval('cms.backgroundlayers_id_seq'::regclass);


--
-- TOC entry 5686 (class 2604 OID 156540195)
-- Name: configurations id; Type: DEFAULT; Schema: cms; Owner: u_fototeca
--

ALTER TABLE ONLY cms.configurations ALTER COLUMN id SET DEFAULT nextval('cms.configurations_id_seq'::regclass);


--
-- TOC entry 5705 (class 2604 OID 156540196)
-- Name: flight id; Type: DEFAULT; Schema: cms; Owner: u_fototeca
--

ALTER TABLE ONLY cms.flight ALTER COLUMN id SET DEFAULT nextval('cms.flight_id_seq'::regclass);


--
-- TOC entry 5707 (class 2604 OID 156540197)
-- Name: flight_group id; Type: DEFAULT; Schema: cms; Owner: u_fototeca
--

ALTER TABLE ONLY cms.flight_group ALTER COLUMN id SET DEFAULT nextval('cms.flight_group_id_seq'::regclass);


--
-- TOC entry 5709 (class 2604 OID 156540198)
-- Name: help id; Type: DEFAULT; Schema: cms; Owner: u_fototeca
--

ALTER TABLE ONLY cms.help ALTER COLUMN id SET DEFAULT nextval('cms.fototeca_help_id_seq'::regclass);


--
-- TOC entry 5710 (class 2604 OID 156540199)
-- Name: orthophoto id; Type: DEFAULT; Schema: cms; Owner: u_fototeca
--

ALTER TABLE ONLY cms.orthophoto ALTER COLUMN id SET DEFAULT nextval('cms.orthophoto_id_seq'::regclass);


--
-- TOC entry 5713 (class 2604 OID 156540200)
-- Name: orthophoto_group id; Type: DEFAULT; Schema: cms; Owner: u_fototeca
--

ALTER TABLE ONLY cms.orthophoto_group ALTER COLUMN id SET DEFAULT nextval('cms.orthophoto_group_id_seq'::regclass);


--
-- TOC entry 5676 (class 2604 OID 152309412)
-- Name: camara id_camara; Type: DEFAULT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.camara ALTER COLUMN id_camara SET DEFAULT nextval('fototeca.camara_id_camara_seq'::regclass);


--
-- TOC entry 5677 (class 2604 OID 152309413)
-- Name: copias_digitales id_copia_digital; Type: DEFAULT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.copias_digitales ALTER COLUMN id_copia_digital SET DEFAULT nextval('fototeca.copias_digitales_id_copia_digital_seq'::regclass);


--
-- TOC entry 5678 (class 2604 OID 152309416)
-- Name: prestamos_archivo id_prestamo; Type: DEFAULT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.prestamos_archivo ALTER COLUMN id_prestamo SET DEFAULT nextval('fototeca.prestamos_archivo_id_prestamo_seq'::regclass);


--
-- TOC entry 5715 (class 2604 OID 156540240)
-- Name: new id; Type: DEFAULT; Schema: rss; Owner: u_fototeca
--

ALTER TABLE ONLY rss.new ALTER COLUMN id SET DEFAULT nextval('rss.news_id_seq'::regclass);


--
-- TOC entry 5818 (class 2606 OID 156540206)
-- Name: additionallayer additionallayer_pkey; Type: CONSTRAINT; Schema: cms; Owner: u_fototeca
--

ALTER TABLE ONLY cms.additionallayer
    ADD CONSTRAINT additionallayer_pkey PRIMARY KEY (id);


--
-- TOC entry 5820 (class 2606 OID 156540208)
-- Name: backgroundlayer backgroundlayers_pkey; Type: CONSTRAINT; Schema: cms; Owner: u_fototeca
--

ALTER TABLE ONLY cms.backgroundlayer
    ADD CONSTRAINT backgroundlayers_pkey PRIMARY KEY (id);


--
-- TOC entry 5822 (class 2606 OID 156540210)
-- Name: configurations configurations_pkey; Type: CONSTRAINT; Schema: cms; Owner: u_fototeca
--

ALTER TABLE ONLY cms.configurations
    ADD CONSTRAINT configurations_pkey PRIMARY KEY (id);


--
-- TOC entry 5826 (class 2606 OID 156540212)
-- Name: flight_group flight_group_pkey; Type: CONSTRAINT; Schema: cms; Owner: u_fototeca
--

ALTER TABLE ONLY cms.flight_group
    ADD CONSTRAINT flight_group_pkey PRIMARY KEY (id);


--
-- TOC entry 5824 (class 2606 OID 156540214)
-- Name: flight flight_pkey; Type: CONSTRAINT; Schema: cms; Owner: u_fototeca
--

ALTER TABLE ONLY cms.flight
    ADD CONSTRAINT flight_pkey PRIMARY KEY (id);


--
-- TOC entry 5828 (class 2606 OID 156540216)
-- Name: help fototeca_help_pkey; Type: CONSTRAINT; Schema: cms; Owner: u_fototeca
--

ALTER TABLE ONLY cms.help
    ADD CONSTRAINT fototeca_help_pkey PRIMARY KEY (id);


--
-- TOC entry 5832 (class 2606 OID 156540218)
-- Name: orthophoto_group orthophoto_group_pkey; Type: CONSTRAINT; Schema: cms; Owner: u_fototeca
--

ALTER TABLE ONLY cms.orthophoto_group
    ADD CONSTRAINT orthophoto_group_pkey PRIMARY KEY (id);


--
-- TOC entry 5830 (class 2606 OID 156540220)
-- Name: orthophoto orthophoto_pkey; Type: CONSTRAINT; Schema: cms; Owner: u_fototeca
--

ALTER TABLE ONLY cms.orthophoto
    ADD CONSTRAINT orthophoto_pkey PRIMARY KEY (id);


--
-- TOC entry 5742 (class 2606 OID 152321975)
-- Name: almacenamiento almacenamiento_pkey; Type: CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.almacenamiento
    ADD CONSTRAINT almacenamiento_pkey PRIMARY KEY (ref_contenedor);


--
-- TOC entry 5744 (class 2606 OID 152321977)
-- Name: camara camara_pkey; Type: CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.camara
    ADD CONSTRAINT camara_pkey PRIMARY KEY (id_camara);


--
-- TOC entry 5749 (class 2606 OID 152321979)
-- Name: copias_analogicas copias_analogicas_pkey; Type: CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.copias_analogicas
    ADD CONSTRAINT copias_analogicas_pkey PRIMARY KEY (cod_fotograma_a, material);


--
-- TOC entry 5751 (class 2606 OID 152321981)
-- Name: copias_digitales copias_digitales_pkey; Type: CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.copias_digitales
    ADD CONSTRAINT copias_digitales_pkey PRIMARY KEY (id_copia_digital);


--
-- TOC entry 5758 (class 2606 OID 152321986)
-- Name: fotogramas_digitales fd_pk; Type: CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.fotogramas_digitales
    ADD CONSTRAINT fd_pk PRIMARY KEY (cod_fotograma_d);


--
-- TOC entry 5755 (class 2606 OID 152321993)
-- Name: fotogramas_analogicos fotogramas_analogicos_pkey; Type: CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.fotogramas_analogicos
    ADD CONSTRAINT fotogramas_analogicos_pkey PRIMARY KEY (cod_fotograma_a);


--
-- TOC entry 5761 (class 2606 OID 152321999)
-- Name: fotogramas_escaneados fotogramas_escaneados_pkey; Type: CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.fotogramas_escaneados
    ADD CONSTRAINT fotogramas_escaneados_pkey PRIMARY KEY (cod_fotograma_a);


--
-- TOC entry 5765 (class 2606 OID 152322001)
-- Name: hoja_mtn25 hoja_mtn25_pkey; Type: CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.hoja_mtn25
    ADD CONSTRAINT hoja_mtn25_pkey PRIMARY KEY (num_hoja25);


--
-- TOC entry 5768 (class 2606 OID 152322003)
-- Name: hoja_mtn50 hoja_mtn50_pkey; Type: CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.hoja_mtn50
    ADD CONSTRAINT hoja_mtn50_pkey PRIMARY KEY (num_hoja50);


--
-- TOC entry 5747 (class 2606 OID 152322007)
-- Name: ccaa id_ccaa_pk; Type: CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.ccaa
    ADD CONSTRAINT id_ccaa_pk PRIMARY KEY (cod_ccaa);


--
-- TOC entry 5796 (class 2606 OID 152322009)
-- Name: municipios id_muni_pk; Type: CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.municipios
    ADD CONSTRAINT id_muni_pk PRIMARY KEY (cod_muni);


--
-- TOC entry 5801 (class 2606 OID 152322011)
-- Name: provincias id_prov_pk; Type: CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.provincias
    ADD CONSTRAINT id_prov_pk PRIMARY KEY (cod_prov);


--
-- TOC entry 5771 (class 2606 OID 152322013)
-- Name: l_alm_fisico l_alm_fisico_pkey; Type: CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.l_alm_fisico
    ADD CONSTRAINT l_alm_fisico_pkey PRIMARY KEY (alm_fisico);


--
-- TOC entry 5775 (class 2606 OID 152322015)
-- Name: l_camara_ns l_camara_ns_pkey; Type: CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.l_camara_ns
    ADD CONSTRAINT l_camara_ns_pkey PRIMARY KEY (camara_ns);


--
-- TOC entry 5773 (class 2606 OID 152322017)
-- Name: l_camara l_camara_pkey; Type: CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.l_camara
    ADD CONSTRAINT l_camara_pkey PRIMARY KEY (camara);


--
-- TOC entry 5816 (class 2606 OID 172259844)
-- Name: l_color l_color_pkey; Type: CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.l_color
    ADD CONSTRAINT l_color_pkey PRIMARY KEY (color);


--
-- TOC entry 5777 (class 2606 OID 152322019)
-- Name: l_dimensiones l_dimensiones_pkey; Type: CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.l_dimensiones
    ADD CONSTRAINT l_dimensiones_pkey PRIMARY KEY (dimensiones);


--
-- TOC entry 5779 (class 2606 OID 152322021)
-- Name: l_estado_pedido l_estado_pedido_pkey; Type: CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.l_estado_pedido
    ADD CONSTRAINT l_estado_pedido_pkey PRIMARY KEY (estado_pedido);


--
-- TOC entry 5781 (class 2606 OID 152322023)
-- Name: l_sistema_referencia l_sistema_referencia_pkey; Type: CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.l_sistema_referencia
    ADD CONSTRAINT l_sistema_referencia_pkey PRIMARY KEY (sistema_referencia);


--
-- TOC entry 5783 (class 2606 OID 152322025)
-- Name: l_tipo_camara l_tipo_camara_pkey; Type: CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.l_tipo_camara
    ADD CONSTRAINT l_tipo_camara_pkey PRIMARY KEY (tipo_camara);


--
-- TOC entry 5787 (class 2606 OID 152322027)
-- Name: l_tipo_formato l_tipo_formato_pkey; Type: CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.l_tipo_formato
    ADD CONSTRAINT l_tipo_formato_pkey PRIMARY KEY (tipo_formato);


--
-- TOC entry 5789 (class 2606 OID 152322029)
-- Name: l_tipo_material l_tipo_material_pkey; Type: CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.l_tipo_material
    ADD CONSTRAINT l_tipo_material_pkey PRIMARY KEY (tipo_material);


--
-- TOC entry 5791 (class 2606 OID 152322031)
-- Name: l_tipo_producto l_tipo_producto_pkey; Type: CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.l_tipo_producto
    ADD CONSTRAINT l_tipo_producto_pkey PRIMARY KEY (tipo_producto);


--
-- TOC entry 5793 (class 2606 OID 152322033)
-- Name: l_tipo_vuelo l_tipo_vuelo_pkey; Type: CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.l_tipo_vuelo
    ADD CONSTRAINT l_tipo_vuelo_pkey PRIMARY KEY (tipo_vuelo);


--
-- TOC entry 5798 (class 2606 OID 152322035)
-- Name: prestamos_archivo prestamos_archivo_pkey; Type: CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.prestamos_archivo
    ADD CONSTRAINT prestamos_archivo_pkey PRIMARY KEY (id_prestamo);


--
-- TOC entry 5785 (class 2606 OID 152322037)
-- Name: l_tipo_contenedor tipo_contenedor_pkey; Type: CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.l_tipo_contenedor
    ADD CONSTRAINT tipo_contenedor_pkey PRIMARY KEY (tipo_contenedor);


--
-- TOC entry 5811 (class 2606 OID 152322039)
-- Name: vuelos_analogicos vuelos_analogicos_pkey; Type: CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.vuelos_analogicos
    ADD CONSTRAINT vuelos_analogicos_pkey PRIMARY KEY (cod_vuelo);


--
-- TOC entry 5814 (class 2606 OID 152322041)
-- Name: vuelos_digitales vuelos_digitales_pkey; Type: CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.vuelos_digitales
    ADD CONSTRAINT vuelos_digitales_pkey PRIMARY KEY (cod_vuelo);


--
-- TOC entry 5808 (class 2606 OID 152322043)
-- Name: vuelos vuelos_pkey; Type: CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.vuelos
    ADD CONSTRAINT vuelos_pkey PRIMARY KEY (cod_vuelo);


--
-- TOC entry 5834 (class 2606 OID 156540242)
-- Name: new news_pkey; Type: CONSTRAINT; Schema: rss; Owner: u_fototeca
--

ALTER TABLE ONLY rss.new
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- TOC entry 5802 (class 1259 OID 152322046)
-- Name: i_ano_cv; Type: INDEX; Schema: fototeca; Owner: u_fototeca
--

CREATE INDEX i_ano_cv ON fototeca.vuelos USING btree ("año");


--
-- TOC entry 5762 (class 1259 OID 152322047)
-- Name: i_centro_imagen_a_geom; Type: INDEX; Schema: fototeca; Owner: u_fototeca
--

CREATE INDEX i_centro_imagen_a_geom ON fototeca.fotogramas_escaneados USING gist (centro_imagen);


--
-- TOC entry 5803 (class 1259 OID 152322051)
-- Name: i_certificable_fk; Type: INDEX; Schema: fototeca; Owner: u_fototeca
--

CREATE INDEX i_certificable_fk ON fototeca.vuelos USING btree (certificable);


--
-- TOC entry 5752 (class 1259 OID 152322052)
-- Name: i_cod_fotograma_a_fk; Type: INDEX; Schema: fototeca; Owner: u_fototeca
--

CREATE INDEX i_cod_fotograma_a_fk ON fototeca.copias_digitales USING btree (cod_fotograma_a);


--
-- TOC entry 6098 (class 0 OID 0)
-- Dependencies: 5752
-- Name: INDEX i_cod_fotograma_a_fk; Type: COMMENT; Schema: fototeca; Owner: u_fototeca
--

COMMENT ON INDEX fototeca.i_cod_fotograma_a_fk IS 'indice para codigo fotograma de vuelos analogicos';


--
-- TOC entry 5759 (class 1259 OID 152322059)
-- Name: i_cod_fotograma_d; Type: INDEX; Schema: fototeca; Owner: u_fototeca
--

CREATE INDEX i_cod_fotograma_d ON fototeca.fotogramas_digitales USING btree (cod_fotograma_d);


--
-- TOC entry 5753 (class 1259 OID 152322060)
-- Name: i_cod_fotograma_d_fk; Type: INDEX; Schema: fototeca; Owner: u_fototeca
--

CREATE INDEX i_cod_fotograma_d_fk ON fototeca.copias_digitales USING btree (cod_fotograma_d);


--
-- TOC entry 5756 (class 1259 OID 152322067)
-- Name: i_cod_vuelo_a_fk; Type: INDEX; Schema: fototeca; Owner: u_fototeca
--

CREATE INDEX i_cod_vuelo_a_fk ON fototeca.fotogramas_analogicos USING btree (cod_vuelo);


--
-- TOC entry 5766 (class 1259 OID 152322068)
-- Name: i_cuadricula_mtn25_geom; Type: INDEX; Schema: fototeca; Owner: u_fototeca
--

CREATE INDEX i_cuadricula_mtn25_geom ON fototeca.hoja_mtn25 USING gist (cuadricula);


--
-- TOC entry 5769 (class 1259 OID 152322069)
-- Name: i_cuadricula_mtn50_geom; Type: INDEX; Schema: fototeca; Owner: u_fototeca
--

CREATE INDEX i_cuadricula_mtn50_geom ON fototeca.hoja_mtn50 USING gist (cuadricula);


--
-- TOC entry 5804 (class 1259 OID 152322070)
-- Name: i_descripcion_cv; Type: INDEX; Schema: fototeca; Owner: u_fototeca
--

CREATE INDEX i_descripcion_cv ON fototeca.vuelos USING btree (descripcion);


--
-- TOC entry 5809 (class 1259 OID 152322071)
-- Name: i_escala_cv; Type: INDEX; Schema: fototeca; Owner: u_fototeca
--

CREATE INDEX i_escala_cv ON fototeca.vuelos_analogicos USING btree (escala);


--
-- TOC entry 5745 (class 1259 OID 152322072)
-- Name: i_extension_ccaa_geom; Type: INDEX; Schema: fototeca; Owner: u_fototeca
--

CREATE INDEX i_extension_ccaa_geom ON fototeca.ccaa USING gist (extension);


--
-- TOC entry 5805 (class 1259 OID 152322073)
-- Name: i_extension_g; Type: INDEX; Schema: fototeca; Owner: u_fototeca
--

CREATE INDEX i_extension_g ON fototeca.vuelos USING gist (extension);


--
-- TOC entry 5794 (class 1259 OID 152322074)
-- Name: i_extension_muni_geom; Type: INDEX; Schema: fototeca; Owner: u_fototeca
--

CREATE INDEX i_extension_muni_geom ON fototeca.municipios USING gist (extension);


--
-- TOC entry 5799 (class 1259 OID 152322075)
-- Name: i_extension_prov_geom; Type: INDEX; Schema: fototeca; Owner: u_fototeca
--

CREATE INDEX i_extension_prov_geom ON fototeca.provincias USING gist (extension);


--
-- TOC entry 5812 (class 1259 OID 152322076)
-- Name: i_gsd_cv; Type: INDEX; Schema: fototeca; Owner: u_fototeca
--

CREATE INDEX i_gsd_cv ON fototeca.vuelos_digitales USING btree (gsd);


--
-- TOC entry 5763 (class 1259 OID 155917024)
-- Name: i_huella_a_geom; Type: INDEX; Schema: fototeca; Owner: u_fototeca
--

CREATE INDEX i_huella_a_geom ON fototeca.fotogramas_escaneados USING gist (huella);


--
-- TOC entry 5806 (class 1259 OID 152322078)
-- Name: i_tipo_cv; Type: INDEX; Schema: fototeca; Owner: u_fototeca
--

CREATE INDEX i_tipo_cv ON fototeca.vuelos USING btree (tipo);


--
-- TOC entry 5862 (class 2606 OID 156540221)
-- Name: flight flight_flight_group; Type: FK CONSTRAINT; Schema: cms; Owner: u_fototeca
--

ALTER TABLE ONLY cms.flight
    ADD CONSTRAINT flight_flight_group FOREIGN KEY (category) REFERENCES cms.flight_group(id);


--
-- TOC entry 5863 (class 2606 OID 156540226)
-- Name: orthophoto orthophoto_category_fkey; Type: FK CONSTRAINT; Schema: cms; Owner: u_fototeca
--

ALTER TABLE ONLY cms.orthophoto
    ADD CONSTRAINT orthophoto_category_fkey FOREIGN KEY (category) REFERENCES cms.orthophoto_group(id);


--
-- TOC entry 5835 (class 2606 OID 152322079)
-- Name: almacenamiento alm_fisico; Type: FK CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.almacenamiento
    ADD CONSTRAINT alm_fisico FOREIGN KEY (ubicacion) REFERENCES fototeca.l_alm_fisico(alm_fisico);


--
-- TOC entry 5853 (class 2606 OID 152322084)
-- Name: fotogramas_escaneados cod_fotograma; Type: FK CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.fotogramas_escaneados
    ADD CONSTRAINT cod_fotograma FOREIGN KEY (cod_fotograma_a) REFERENCES fototeca.fotogramas_analogicos(cod_fotograma_a);


--
-- TOC entry 5840 (class 2606 OID 152322089)
-- Name: copias_analogicas cod_fotograma; Type: FK CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.copias_analogicas
    ADD CONSTRAINT cod_fotograma FOREIGN KEY (cod_fotograma_a) REFERENCES fototeca.fotogramas_analogicos(cod_fotograma_a);


--
-- TOC entry 5843 (class 2606 OID 152322094)
-- Name: copias_digitales cod_fotograma_a; Type: FK CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.copias_digitales
    ADD CONSTRAINT cod_fotograma_a FOREIGN KEY (cod_fotograma_a) REFERENCES fototeca.fotogramas_escaneados(cod_fotograma_a);


--
-- TOC entry 5844 (class 2606 OID 152322099)
-- Name: copias_digitales cod_fotograma_d; Type: FK CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.copias_digitales
    ADD CONSTRAINT cod_fotograma_d FOREIGN KEY (cod_fotograma_d) REFERENCES fototeca.fotogramas_digitales(cod_fotograma_d);


--
-- TOC entry 5860 (class 2606 OID 152322104)
-- Name: vuelos_analogicos cod_vuelo; Type: FK CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.vuelos_analogicos
    ADD CONSTRAINT cod_vuelo FOREIGN KEY (cod_vuelo) REFERENCES fototeca.vuelos(cod_vuelo);


--
-- TOC entry 5847 (class 2606 OID 152322109)
-- Name: fotogramas_analogicos cod_vuelo; Type: FK CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.fotogramas_analogicos
    ADD CONSTRAINT cod_vuelo FOREIGN KEY (cod_vuelo) REFERENCES fototeca.vuelos_analogicos(cod_vuelo);


--
-- TOC entry 5861 (class 2606 OID 152322114)
-- Name: vuelos_digitales cod_vuelo; Type: FK CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.vuelos_digitales
    ADD CONSTRAINT cod_vuelo FOREIGN KEY (cod_vuelo) REFERENCES fototeca.vuelos(cod_vuelo);


--
-- TOC entry 5850 (class 2606 OID 152322119)
-- Name: fotogramas_digitales cod_vuelo; Type: FK CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.fotogramas_digitales
    ADD CONSTRAINT cod_vuelo FOREIGN KEY (cod_vuelo) REFERENCES fototeca.vuelos_digitales(cod_vuelo);


--
-- TOC entry 5854 (class 2606 OID 152322124)
-- Name: fotogramas_escaneados epsg; Type: FK CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.fotogramas_escaneados
    ADD CONSTRAINT epsg FOREIGN KEY (epsg) REFERENCES fototeca.l_sistema_referencia(sistema_referencia);


--
-- TOC entry 5851 (class 2606 OID 152322129)
-- Name: fotogramas_digitales epsg; Type: FK CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.fotogramas_digitales
    ADD CONSTRAINT epsg FOREIGN KEY (epsg) REFERENCES fototeca.l_sistema_referencia(sistema_referencia);


--
-- TOC entry 5856 (class 2606 OID 152322134)
-- Name: prestamos_archivo estado; Type: FK CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.prestamos_archivo
    ADD CONSTRAINT estado FOREIGN KEY (estado) REFERENCES fototeca.l_estado_pedido(estado_pedido);


--
-- TOC entry 5845 (class 2606 OID 152322139)
-- Name: copias_digitales formato; Type: FK CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.copias_digitales
    ADD CONSTRAINT formato FOREIGN KEY (formato) REFERENCES fototeca.l_tipo_formato(tipo_formato);


--
-- TOC entry 5848 (class 2606 OID 152322144)
-- Name: fotogramas_analogicos formato; Type: FK CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.fotogramas_analogicos
    ADD CONSTRAINT formato FOREIGN KEY (formato) REFERENCES fototeca.l_dimensiones(dimensiones);


--
-- TOC entry 5849 (class 2606 OID 152322149)
-- Name: fotogramas_analogicos id_camara; Type: FK CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.fotogramas_analogicos
    ADD CONSTRAINT id_camara FOREIGN KEY (id_camara) REFERENCES fototeca.camara(id_camara);


--
-- TOC entry 5852 (class 2606 OID 152322154)
-- Name: fotogramas_digitales id_camara; Type: FK CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.fotogramas_digitales
    ADD CONSTRAINT id_camara FOREIGN KEY (id_camara) REFERENCES fototeca.camara(id_camara);


--
-- TOC entry 5841 (class 2606 OID 152322159)
-- Name: copias_analogicas material; Type: FK CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.copias_analogicas
    ADD CONSTRAINT material FOREIGN KEY (material) REFERENCES fototeca.l_tipo_material(tipo_material);


--
-- TOC entry 5837 (class 2606 OID 152322164)
-- Name: camara modelo; Type: FK CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.camara
    ADD CONSTRAINT modelo FOREIGN KEY (modelo) REFERENCES fototeca.l_camara(camara);


--
-- TOC entry 5855 (class 2606 OID 152322169)
-- Name: municipios muni_prov_fk; Type: FK CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.municipios
    ADD CONSTRAINT muni_prov_fk FOREIGN KEY (cod_prov) REFERENCES fototeca.provincias(cod_prov);


--
-- TOC entry 5838 (class 2606 OID 152322174)
-- Name: camara num_serie; Type: FK CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.camara
    ADD CONSTRAINT num_serie FOREIGN KEY (num_serie) REFERENCES fototeca.l_camara_ns(camara_ns);


--
-- TOC entry 5858 (class 2606 OID 152322179)
-- Name: provincias prov_ccaa_fk; Type: FK CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.provincias
    ADD CONSTRAINT prov_ccaa_fk FOREIGN KEY (cod_ccaa) REFERENCES fototeca.ccaa(cod_ccaa);


--
-- TOC entry 5846 (class 2606 OID 152322184)
-- Name: copias_digitales ref_contenedor; Type: FK CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.copias_digitales
    ADD CONSTRAINT ref_contenedor FOREIGN KEY (ref_contenedor) REFERENCES fototeca.almacenamiento(ref_contenedor);


--
-- TOC entry 5842 (class 2606 OID 152322189)
-- Name: copias_analogicas ref_contenedor; Type: FK CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.copias_analogicas
    ADD CONSTRAINT ref_contenedor FOREIGN KEY (ref_contenedor) REFERENCES fototeca.almacenamiento(ref_contenedor);


--
-- TOC entry 5857 (class 2606 OID 152322194)
-- Name: prestamos_archivo tipo; Type: FK CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.prestamos_archivo
    ADD CONSTRAINT tipo FOREIGN KEY (tipo) REFERENCES fototeca.l_tipo_producto(tipo_producto);


--
-- TOC entry 5839 (class 2606 OID 152322199)
-- Name: camara tipo; Type: FK CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.camara
    ADD CONSTRAINT tipo FOREIGN KEY (tipo) REFERENCES fototeca.l_tipo_camara(tipo_camara);


--
-- TOC entry 5836 (class 2606 OID 152322204)
-- Name: almacenamiento tipo_contenedor; Type: FK CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.almacenamiento
    ADD CONSTRAINT tipo_contenedor FOREIGN KEY (tipo_contenedor) REFERENCES fototeca.l_tipo_contenedor(tipo_contenedor);


--
-- TOC entry 5859 (class 2606 OID 152322209)
-- Name: vuelos tipo_vuelo; Type: FK CONSTRAINT; Schema: fototeca; Owner: u_fototeca
--

ALTER TABLE ONLY fototeca.vuelos
    ADD CONSTRAINT tipo_vuelo FOREIGN KEY (tipo) REFERENCES fototeca.l_tipo_vuelo(tipo_vuelo);


--
-- TOC entry 6002 (class 0 OID 0)
-- Dependencies: 17
-- Name: SCHEMA fototeca; Type: ACL; Schema: -; Owner: u_fototeca
--

GRANT USAGE ON SCHEMA fototeca TO sl_fototeca;


--
-- TOC entry 6003 (class 0 OID 0)
-- Dependencies: 18
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: u_fototeca
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
GRANT USAGE ON SCHEMA public TO sl_fototeca;


--
-- TOC entry 6004 (class 0 OID 0)
-- Dependencies: 16
-- Name: SCHEMA tiger; Type: ACL; Schema: -; Owner: u_fototeca
--

GRANT USAGE ON SCHEMA tiger TO sl_fototeca;


--
-- TOC entry 6005 (class 0 OID 0)
-- Dependencies: 15
-- Name: SCHEMA tiger_data; Type: ACL; Schema: -; Owner: u_fototeca
--

GRANT USAGE ON SCHEMA tiger_data TO sl_fototeca;


--
-- TOC entry 6007 (class 0 OID 0)
-- Dependencies: 14
-- Name: SCHEMA topology; Type: ACL; Schema: -; Owner: u_fototeca
--

GRANT USAGE ON SCHEMA topology TO sl_fototeca;


--
-- TOC entry 6023 (class 0 OID 0)
-- Dependencies: 287
-- Name: TABLE almacenamiento; Type: ACL; Schema: fototeca; Owner: u_fototeca
--

GRANT SELECT ON TABLE fototeca.almacenamiento TO sl_fototeca;


--
-- TOC entry 6024 (class 0 OID 0)
-- Dependencies: 288
-- Name: TABLE camara; Type: ACL; Schema: fototeca; Owner: u_fototeca
--

GRANT SELECT ON TABLE fototeca.camara TO sl_fototeca;


--
-- TOC entry 6026 (class 0 OID 0)
-- Dependencies: 290
-- Name: TABLE ccaa; Type: ACL; Schema: fototeca; Owner: u_fototeca
--

GRANT SELECT ON TABLE fototeca.ccaa TO sl_fototeca;


--
-- TOC entry 6027 (class 0 OID 0)
-- Dependencies: 291
-- Name: TABLE copias_analogicas; Type: ACL; Schema: fototeca; Owner: u_fototeca
--

GRANT SELECT ON TABLE fototeca.copias_analogicas TO sl_fototeca;


--
-- TOC entry 6028 (class 0 OID 0)
-- Dependencies: 292
-- Name: TABLE copias_digitales; Type: ACL; Schema: fototeca; Owner: u_fototeca
--

GRANT SELECT ON TABLE fototeca.copias_digitales TO sl_fototeca;


--
-- TOC entry 6030 (class 0 OID 0)
-- Dependencies: 294
-- Name: TABLE fotogramas_analogicos; Type: ACL; Schema: fototeca; Owner: u_fototeca
--

GRANT SELECT ON TABLE fototeca.fotogramas_analogicos TO sl_fototeca;


--
-- TOC entry 6031 (class 0 OID 0)
-- Dependencies: 295
-- Name: TABLE fotogramas_digitales; Type: ACL; Schema: fototeca; Owner: u_fototeca
--

GRANT SELECT ON TABLE fototeca.fotogramas_digitales TO sl_fototeca;


--
-- TOC entry 6032 (class 0 OID 0)
-- Dependencies: 296
-- Name: TABLE fotogramas_escaneados; Type: ACL; Schema: fototeca; Owner: u_fototeca
--

GRANT SELECT ON TABLE fototeca.fotogramas_escaneados TO sl_fototeca;


--
-- TOC entry 6033 (class 0 OID 0)
-- Dependencies: 297
-- Name: TABLE hoja_mtn25; Type: ACL; Schema: fototeca; Owner: u_fototeca
--

GRANT SELECT ON TABLE fototeca.hoja_mtn25 TO sl_fototeca;


--
-- TOC entry 6034 (class 0 OID 0)
-- Dependencies: 298
-- Name: TABLE hoja_mtn50; Type: ACL; Schema: fototeca; Owner: u_fototeca
--

GRANT SELECT ON TABLE fototeca.hoja_mtn50 TO sl_fototeca;


--
-- TOC entry 6035 (class 0 OID 0)
-- Dependencies: 299
-- Name: TABLE l_alm_fisico; Type: ACL; Schema: fototeca; Owner: u_fototeca
--

GRANT SELECT ON TABLE fototeca.l_alm_fisico TO sl_fototeca;


--
-- TOC entry 6036 (class 0 OID 0)
-- Dependencies: 300
-- Name: TABLE l_camara; Type: ACL; Schema: fototeca; Owner: u_fototeca
--

GRANT SELECT ON TABLE fototeca.l_camara TO sl_fototeca;


--
-- TOC entry 6037 (class 0 OID 0)
-- Dependencies: 301
-- Name: TABLE l_camara_ns; Type: ACL; Schema: fototeca; Owner: u_fototeca
--

GRANT SELECT ON TABLE fototeca.l_camara_ns TO sl_fototeca;


--
-- TOC entry 6038 (class 0 OID 0)
-- Dependencies: 302
-- Name: TABLE l_dimensiones; Type: ACL; Schema: fototeca; Owner: u_fototeca
--

GRANT SELECT ON TABLE fototeca.l_dimensiones TO sl_fototeca;


--
-- TOC entry 6039 (class 0 OID 0)
-- Dependencies: 303
-- Name: TABLE l_estado_pedido; Type: ACL; Schema: fototeca; Owner: u_fototeca
--

GRANT SELECT ON TABLE fototeca.l_estado_pedido TO sl_fototeca;


--
-- TOC entry 6040 (class 0 OID 0)
-- Dependencies: 304
-- Name: TABLE l_sistema_referencia; Type: ACL; Schema: fototeca; Owner: u_fototeca
--

GRANT SELECT ON TABLE fototeca.l_sistema_referencia TO sl_fototeca;


--
-- TOC entry 6041 (class 0 OID 0)
-- Dependencies: 305
-- Name: TABLE l_tipo_camara; Type: ACL; Schema: fototeca; Owner: u_fototeca
--

GRANT SELECT ON TABLE fototeca.l_tipo_camara TO sl_fototeca;


--
-- TOC entry 6042 (class 0 OID 0)
-- Dependencies: 306
-- Name: TABLE l_tipo_contenedor; Type: ACL; Schema: fototeca; Owner: u_fototeca
--

GRANT SELECT ON TABLE fototeca.l_tipo_contenedor TO sl_fototeca;


--
-- TOC entry 6043 (class 0 OID 0)
-- Dependencies: 307
-- Name: TABLE l_tipo_formato; Type: ACL; Schema: fototeca; Owner: u_fototeca
--

GRANT SELECT ON TABLE fototeca.l_tipo_formato TO sl_fototeca;


--
-- TOC entry 6044 (class 0 OID 0)
-- Dependencies: 308
-- Name: TABLE l_tipo_material; Type: ACL; Schema: fototeca; Owner: u_fototeca
--

GRANT SELECT ON TABLE fototeca.l_tipo_material TO sl_fototeca;


--
-- TOC entry 6045 (class 0 OID 0)
-- Dependencies: 309
-- Name: TABLE l_tipo_producto; Type: ACL; Schema: fototeca; Owner: u_fototeca
--

GRANT SELECT ON TABLE fototeca.l_tipo_producto TO sl_fototeca;


--
-- TOC entry 6046 (class 0 OID 0)
-- Dependencies: 310
-- Name: TABLE l_tipo_vuelo; Type: ACL; Schema: fototeca; Owner: u_fototeca
--

GRANT SELECT ON TABLE fototeca.l_tipo_vuelo TO sl_fototeca;


--
-- TOC entry 6047 (class 0 OID 0)
-- Dependencies: 311
-- Name: TABLE municipios; Type: ACL; Schema: fototeca; Owner: u_fototeca
--

GRANT SELECT ON TABLE fototeca.municipios TO sl_fototeca;


--
-- TOC entry 6048 (class 0 OID 0)
-- Dependencies: 312
-- Name: TABLE prestamos_archivo; Type: ACL; Schema: fototeca; Owner: u_fototeca
--

GRANT SELECT ON TABLE fototeca.prestamos_archivo TO sl_fototeca;


--
-- TOC entry 6050 (class 0 OID 0)
-- Dependencies: 314
-- Name: TABLE provincias; Type: ACL; Schema: fototeca; Owner: u_fototeca
--

GRANT SELECT ON TABLE fototeca.provincias TO sl_fototeca;


--
-- TOC entry 6051 (class 0 OID 0)
-- Dependencies: 315
-- Name: TABLE vuelos; Type: ACL; Schema: fototeca; Owner: u_fototeca
--

GRANT SELECT ON TABLE fototeca.vuelos TO sl_fototeca;


--
-- TOC entry 6052 (class 0 OID 0)
-- Dependencies: 316
-- Name: TABLE vuelos_analogicos; Type: ACL; Schema: fototeca; Owner: u_fototeca
--

GRANT SELECT ON TABLE fototeca.vuelos_analogicos TO sl_fototeca;


--
-- TOC entry 6053 (class 0 OID 0)
-- Dependencies: 317
-- Name: TABLE vuelos_digitales; Type: ACL; Schema: fototeca; Owner: u_fototeca
--

GRANT SELECT ON TABLE fototeca.vuelos_digitales TO sl_fototeca;


--
-- TOC entry 6054 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE geography_columns; Type: ACL; Schema: public; Owner: u_fototeca
--

REVOKE ALL ON TABLE public.geography_columns FROM postgres;
REVOKE SELECT ON TABLE public.geography_columns FROM PUBLIC;
GRANT ALL ON TABLE public.geography_columns TO u_fototeca;
GRANT SELECT ON TABLE public.geography_columns TO PUBLIC;
GRANT SELECT ON TABLE public.geography_columns TO sl_fototeca;


--
-- TOC entry 6055 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE geometry_columns; Type: ACL; Schema: public; Owner: u_fototeca
--

REVOKE ALL ON TABLE public.geometry_columns FROM postgres;
REVOKE SELECT ON TABLE public.geometry_columns FROM PUBLIC;
GRANT ALL ON TABLE public.geometry_columns TO u_fototeca;
GRANT SELECT ON TABLE public.geometry_columns TO PUBLIC;
GRANT SELECT ON TABLE public.geometry_columns TO sl_fototeca;


--
-- TOC entry 6056 (class 0 OID 0)
-- Dependencies: 229
-- Name: TABLE raster_columns; Type: ACL; Schema: public; Owner: u_fototeca
--

-- REVOKE ALL ON TABLE public.raster_columns FROM postgres;
-- REVOKE SELECT ON TABLE public.raster_columns FROM PUBLIC;
-- GRANT ALL ON TABLE public.raster_columns TO u_fototeca;
-- GRANT SELECT ON TABLE public.raster_columns TO PUBLIC;
-- GRANT SELECT ON TABLE public.raster_columns TO sl_fototeca;


--
-- TOC entry 6057 (class 0 OID 0)
-- Dependencies: 230
-- Name: TABLE raster_overviews; Type: ACL; Schema: public; Owner: u_fototeca
--

-- REVOKE ALL ON TABLE public.raster_overviews FROM postgres;
-- REVOKE SELECT ON TABLE public.raster_overviews FROM PUBLIC;
-- GRANT ALL ON TABLE public.raster_overviews TO u_fototeca;
-- GRANT SELECT ON TABLE public.raster_overviews TO PUBLIC;
-- GRANT SELECT ON TABLE public.raster_overviews TO sl_fototeca;


--
-- TOC entry 6058 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE spatial_ref_sys; Type: ACL; Schema: public; Owner: u_fototeca
--

REVOKE ALL ON TABLE public.spatial_ref_sys FROM postgres;
REVOKE SELECT ON TABLE public.spatial_ref_sys FROM PUBLIC;
GRANT ALL ON TABLE public.spatial_ref_sys TO u_fototeca;
GRANT SELECT ON TABLE public.spatial_ref_sys TO PUBLIC;
GRANT SELECT ON TABLE public.spatial_ref_sys TO sl_fototeca;


--
-- TOC entry 6059 (class 0 OID 0)
-- Dependencies: 213
-- Name: TABLE us_gaz; Type: ACL; Schema: public; Owner: u_fototeca
--

GRANT SELECT ON TABLE public.us_gaz TO sl_fototeca;


--
-- TOC entry 6060 (class 0 OID 0)
-- Dependencies: 211
-- Name: TABLE us_lex; Type: ACL; Schema: public; Owner: u_fototeca
--

GRANT SELECT ON TABLE public.us_lex TO sl_fototeca;


--
-- TOC entry 6061 (class 0 OID 0)
-- Dependencies: 215
-- Name: TABLE us_rules; Type: ACL; Schema: public; Owner: u_fototeca
--

GRANT SELECT ON TABLE public.us_rules TO sl_fototeca;


--
-- TOC entry 6063 (class 0 OID 0)
-- Dependencies: 263
-- Name: TABLE addr; Type: ACL; Schema: tiger; Owner: u_fototeca
--

GRANT SELECT ON TABLE tiger.addr TO sl_fototeca;


--
-- TOC entry 6064 (class 0 OID 0)
-- Dependencies: 257
-- Name: TABLE addrfeat; Type: ACL; Schema: tiger; Owner: u_fototeca
--

GRANT SELECT ON TABLE tiger.addrfeat TO sl_fototeca;


--
-- TOC entry 6065 (class 0 OID 0)
-- Dependencies: 274
-- Name: TABLE bg; Type: ACL; Schema: tiger; Owner: u_fototeca
--

GRANT SELECT ON TABLE tiger.bg TO sl_fototeca;


--
-- TOC entry 6066 (class 0 OID 0)
-- Dependencies: 245
-- Name: TABLE county; Type: ACL; Schema: tiger; Owner: u_fototeca
--

GRANT SELECT ON TABLE tiger.county TO sl_fototeca;


--
-- TOC entry 6067 (class 0 OID 0)
-- Dependencies: 239
-- Name: TABLE county_lookup; Type: ACL; Schema: tiger; Owner: u_fototeca
--

GRANT SELECT ON TABLE tiger.county_lookup TO sl_fototeca;


--
-- TOC entry 6068 (class 0 OID 0)
-- Dependencies: 240
-- Name: TABLE countysub_lookup; Type: ACL; Schema: tiger; Owner: u_fototeca
--

GRANT SELECT ON TABLE tiger.countysub_lookup TO sl_fototeca;


--
-- TOC entry 6069 (class 0 OID 0)
-- Dependencies: 253
-- Name: TABLE cousub; Type: ACL; Schema: tiger; Owner: u_fototeca
--

GRANT SELECT ON TABLE tiger.cousub TO sl_fototeca;


--
-- TOC entry 6070 (class 0 OID 0)
-- Dependencies: 234
-- Name: TABLE direction_lookup; Type: ACL; Schema: tiger; Owner: u_fototeca
--

GRANT SELECT ON TABLE tiger.direction_lookup TO sl_fototeca;


--
-- TOC entry 6071 (class 0 OID 0)
-- Dependencies: 255
-- Name: TABLE edges; Type: ACL; Schema: tiger; Owner: u_fototeca
--

GRANT SELECT ON TABLE tiger.edges TO sl_fototeca;


--
-- TOC entry 6072 (class 0 OID 0)
-- Dependencies: 259
-- Name: TABLE faces; Type: ACL; Schema: tiger; Owner: u_fototeca
--

GRANT SELECT ON TABLE tiger.faces TO sl_fototeca;


--
-- TOC entry 6073 (class 0 OID 0)
-- Dependencies: 261
-- Name: TABLE featnames; Type: ACL; Schema: tiger; Owner: u_fototeca
--

GRANT SELECT ON TABLE tiger.featnames TO sl_fototeca;


--
-- TOC entry 6074 (class 0 OID 0)
-- Dependencies: 232
-- Name: TABLE geocode_settings; Type: ACL; Schema: tiger; Owner: u_fototeca
--

REVOKE ALL ON TABLE tiger.geocode_settings FROM postgres;
REVOKE SELECT ON TABLE tiger.geocode_settings FROM PUBLIC;
GRANT ALL ON TABLE tiger.geocode_settings TO u_fototeca;
GRANT SELECT ON TABLE tiger.geocode_settings TO PUBLIC;
GRANT SELECT ON TABLE tiger.geocode_settings TO sl_fototeca;


--
-- TOC entry 6075 (class 0 OID 0)
-- Dependencies: 233
-- Name: TABLE geocode_settings_default; Type: ACL; Schema: tiger; Owner: u_fototeca
--

REVOKE ALL ON TABLE tiger.geocode_settings_default FROM postgres;
REVOKE SELECT ON TABLE tiger.geocode_settings_default FROM PUBLIC;
GRANT ALL ON TABLE tiger.geocode_settings_default TO u_fototeca;
GRANT SELECT ON TABLE tiger.geocode_settings_default TO PUBLIC;
GRANT SELECT ON TABLE tiger.geocode_settings_default TO sl_fototeca;


--
-- TOC entry 6076 (class 0 OID 0)
-- Dependencies: 268
-- Name: TABLE loader_lookuptables; Type: ACL; Schema: tiger; Owner: u_fototeca
--

REVOKE ALL ON TABLE tiger.loader_lookuptables FROM postgres;
REVOKE SELECT ON TABLE tiger.loader_lookuptables FROM PUBLIC;
GRANT ALL ON TABLE tiger.loader_lookuptables TO u_fototeca;
GRANT SELECT ON TABLE tiger.loader_lookuptables TO PUBLIC;
GRANT SELECT ON TABLE tiger.loader_lookuptables TO sl_fototeca;


--
-- TOC entry 6077 (class 0 OID 0)
-- Dependencies: 266
-- Name: TABLE loader_platform; Type: ACL; Schema: tiger; Owner: u_fototeca
--

REVOKE ALL ON TABLE tiger.loader_platform FROM postgres;
REVOKE SELECT ON TABLE tiger.loader_platform FROM PUBLIC;
GRANT ALL ON TABLE tiger.loader_platform TO u_fototeca;
GRANT SELECT ON TABLE tiger.loader_platform TO PUBLIC;
GRANT SELECT ON TABLE tiger.loader_platform TO sl_fototeca;


--
-- TOC entry 6078 (class 0 OID 0)
-- Dependencies: 267
-- Name: TABLE loader_variables; Type: ACL; Schema: tiger; Owner: u_fototeca
--

REVOKE ALL ON TABLE tiger.loader_variables FROM postgres;
REVOKE SELECT ON TABLE tiger.loader_variables FROM PUBLIC;
GRANT ALL ON TABLE tiger.loader_variables TO u_fototeca;
GRANT SELECT ON TABLE tiger.loader_variables TO PUBLIC;
GRANT SELECT ON TABLE tiger.loader_variables TO sl_fototeca;


--
-- TOC entry 6079 (class 0 OID 0)
-- Dependencies: 276
-- Name: TABLE pagc_gaz; Type: ACL; Schema: tiger; Owner: u_fototeca
--

REVOKE ALL ON TABLE tiger.pagc_gaz FROM postgres;
REVOKE SELECT ON TABLE tiger.pagc_gaz FROM PUBLIC;
GRANT ALL ON TABLE tiger.pagc_gaz TO u_fototeca;
GRANT SELECT ON TABLE tiger.pagc_gaz TO PUBLIC;
GRANT SELECT ON TABLE tiger.pagc_gaz TO sl_fototeca;


--
-- TOC entry 6080 (class 0 OID 0)
-- Dependencies: 278
-- Name: TABLE pagc_lex; Type: ACL; Schema: tiger; Owner: u_fototeca
--

REVOKE ALL ON TABLE tiger.pagc_lex FROM postgres;
REVOKE SELECT ON TABLE tiger.pagc_lex FROM PUBLIC;
GRANT ALL ON TABLE tiger.pagc_lex TO u_fototeca;
GRANT SELECT ON TABLE tiger.pagc_lex TO PUBLIC;
GRANT SELECT ON TABLE tiger.pagc_lex TO sl_fototeca;


--
-- TOC entry 6081 (class 0 OID 0)
-- Dependencies: 280
-- Name: TABLE pagc_rules; Type: ACL; Schema: tiger; Owner: u_fototeca
--

REVOKE ALL ON TABLE tiger.pagc_rules FROM postgres;
REVOKE SELECT ON TABLE tiger.pagc_rules FROM PUBLIC;
GRANT ALL ON TABLE tiger.pagc_rules TO u_fototeca;
GRANT SELECT ON TABLE tiger.pagc_rules TO PUBLIC;
GRANT SELECT ON TABLE tiger.pagc_rules TO sl_fototeca;


--
-- TOC entry 6082 (class 0 OID 0)
-- Dependencies: 249
-- Name: TABLE place; Type: ACL; Schema: tiger; Owner: u_fototeca
--

GRANT SELECT ON TABLE tiger.place TO sl_fototeca;


--
-- TOC entry 6083 (class 0 OID 0)
-- Dependencies: 238
-- Name: TABLE place_lookup; Type: ACL; Schema: tiger; Owner: u_fototeca
--

GRANT SELECT ON TABLE tiger.place_lookup TO sl_fototeca;


--
-- TOC entry 6084 (class 0 OID 0)
-- Dependencies: 235
-- Name: TABLE secondary_unit_lookup; Type: ACL; Schema: tiger; Owner: u_fototeca
--

GRANT SELECT ON TABLE tiger.secondary_unit_lookup TO sl_fototeca;


--
-- TOC entry 6085 (class 0 OID 0)
-- Dependencies: 247
-- Name: TABLE state; Type: ACL; Schema: tiger; Owner: u_fototeca
--

GRANT SELECT ON TABLE tiger.state TO sl_fototeca;


--
-- TOC entry 6086 (class 0 OID 0)
-- Dependencies: 236
-- Name: TABLE state_lookup; Type: ACL; Schema: tiger; Owner: u_fototeca
--

GRANT SELECT ON TABLE tiger.state_lookup TO sl_fototeca;


--
-- TOC entry 6087 (class 0 OID 0)
-- Dependencies: 237
-- Name: TABLE street_type_lookup; Type: ACL; Schema: tiger; Owner: u_fototeca
--

GRANT SELECT ON TABLE tiger.street_type_lookup TO sl_fototeca;


--
-- TOC entry 6088 (class 0 OID 0)
-- Dependencies: 272
-- Name: TABLE tabblock; Type: ACL; Schema: tiger; Owner: u_fototeca
--

GRANT SELECT ON TABLE tiger.tabblock TO sl_fototeca;


--
-- TOC entry 6089 (class 0 OID 0)
-- Dependencies: 270
-- Name: TABLE tract; Type: ACL; Schema: tiger; Owner: u_fototeca
--

GRANT SELECT ON TABLE tiger.tract TO sl_fototeca;


--
-- TOC entry 6090 (class 0 OID 0)
-- Dependencies: 265
-- Name: TABLE zcta5; Type: ACL; Schema: tiger; Owner: u_fototeca
--

GRANT SELECT ON TABLE tiger.zcta5 TO sl_fototeca;


--
-- TOC entry 6091 (class 0 OID 0)
-- Dependencies: 243
-- Name: TABLE zip_lookup; Type: ACL; Schema: tiger; Owner: u_fototeca
--

GRANT SELECT ON TABLE tiger.zip_lookup TO sl_fototeca;


--
-- TOC entry 6092 (class 0 OID 0)
-- Dependencies: 241
-- Name: TABLE zip_lookup_all; Type: ACL; Schema: tiger; Owner: u_fototeca
--

GRANT SELECT ON TABLE tiger.zip_lookup_all TO sl_fototeca;


--
-- TOC entry 6093 (class 0 OID 0)
-- Dependencies: 242
-- Name: TABLE zip_lookup_base; Type: ACL; Schema: tiger; Owner: u_fototeca
--

GRANT SELECT ON TABLE tiger.zip_lookup_base TO sl_fototeca;


--
-- TOC entry 6094 (class 0 OID 0)
-- Dependencies: 250
-- Name: TABLE zip_state; Type: ACL; Schema: tiger; Owner: u_fototeca
--

GRANT SELECT ON TABLE tiger.zip_state TO sl_fototeca;


--
-- TOC entry 6095 (class 0 OID 0)
-- Dependencies: 251
-- Name: TABLE zip_state_loc; Type: ACL; Schema: tiger; Owner: u_fototeca
--

GRANT SELECT ON TABLE tiger.zip_state_loc TO sl_fototeca;


--
-- TOC entry 6096 (class 0 OID 0)
-- Dependencies: 283
-- Name: TABLE layer; Type: ACL; Schema: topology; Owner: u_fototeca
--

GRANT SELECT ON TABLE topology.layer TO sl_fototeca;


--
-- TOC entry 6097 (class 0 OID 0)
-- Dependencies: 282
-- Name: TABLE topology; Type: ACL; Schema: topology; Owner: u_fototeca
--

GRANT SELECT ON TABLE topology.topology TO sl_fototeca;


-- Completed on 2024-11-13 08:34:34

--
-- PostgreSQL database dump complete
--

