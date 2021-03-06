PGDMP          0                z            controle_tarefas    12.5    12.5 $    7           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            8           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            9           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            :           1262    16467    controle_tarefas    DATABASE     ?   CREATE DATABASE controle_tarefas WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';
     DROP DATABASE controle_tarefas;
                postgres    false            ?           1247    16501    enum_projects_status    TYPE     R   CREATE TYPE public.enum_projects_status AS ENUM (
    'active',
    'archived'
);
 '   DROP TYPE public.enum_projects_status;
       public          postgres    false            ?           1247    16522    enum_tasks_status    TYPE     y   CREATE TYPE public.enum_tasks_status AS ENUM (
    'backlog',
    'doing',
    'done',
    'approved',
    'rejected'
);
 $   DROP TYPE public.enum_tasks_status;
       public          postgres    false            !           1247    16474    enum_users_role    TYPE     \   CREATE TYPE public.enum_users_role AS ENUM (
    'admin',
    'manager',
    'developer'
);
 "   DROP TYPE public.enum_users_role;
       public          postgres    false            y           1247    16482    enum_users_status    TYPE     O   CREATE TYPE public.enum_users_status AS ENUM (
    'active',
    'archived'
);
 $   DROP TYPE public.enum_users_status;
       public          postgres    false            ?            1259    16468    SequelizeMeta    TABLE     R   CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);
 #   DROP TABLE public."SequelizeMeta";
       public         heap    postgres    false            ?            1259    16507    projects    TABLE     -  CREATE TABLE public.projects (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    status public.enum_projects_status NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
    DROP TABLE public.projects;
       public         heap    postgres    false    641            ?            1259    16505    projects_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.projects_id_seq;
       public          postgres    false    206            ;           0    0    projects_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;
          public          postgres    false    205            ?            1259    16535    tasks    TABLE     G  CREATE TABLE public.tasks (
    id integer NOT NULL,
    due_date timestamp with time zone,
    effort integer,
    title character varying(255),
    description text,
    "order" integer DEFAULT 0,
    status public.enum_tasks_status DEFAULT 'backlog'::public.enum_tasks_status,
    user_id integer,
    project_id integer,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    path character varying(255),
    folder character varying(255),
    type character varying(255),
    filename character varying(255),
    size integer
);
    DROP TABLE public.tasks;
       public         heap    postgres    false    649    649            ?            1259    16533    tasks_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.tasks_id_seq;
       public          postgres    false    208            <           0    0    tasks_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;
          public          postgres    false    207            ?            1259    16489    users    TABLE     i  CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255) NOT NULL,
    password_hash character varying(255),
    role public.enum_users_role NOT NULL,
    status public.enum_users_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false    545    633            ?            1259    16487    users_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    204            =           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    203            ?
           2604    16510    projects id    DEFAULT     j   ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);
 :   ALTER TABLE public.projects ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    206    206            ?
           2604    16538    tasks id    DEFAULT     d   ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);
 7   ALTER TABLE public.tasks ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    207    208            ?
           2604    16492    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    203    204            .          0    16468    SequelizeMeta 
   TABLE DATA           /   COPY public."SequelizeMeta" (name) FROM stdin;
    public          postgres    false    202   A*       2          0    16507    projects 
   TABLE DATA           b   COPY public.projects (id, name, description, status, user_id, created_at, updated_at) FROM stdin;
    public          postgres    false    206   ?*       4          0    16535    tasks 
   TABLE DATA           ?   COPY public.tasks (id, due_date, effort, title, description, "order", status, user_id, project_id, created_at, updated_at, path, folder, type, filename, size) FROM stdin;
    public          postgres    false    208   ?,       0          0    16489    users 
   TABLE DATA           e   COPY public.users (id, name, email, password_hash, role, status, created_at, updated_at) FROM stdin;
    public          postgres    false    204   ?.       >           0    0    projects_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.projects_id_seq', 5, true);
          public          postgres    false    205            ?           0    0    tasks_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.tasks_id_seq', 6, true);
          public          postgres    false    207            @           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 10, true);
          public          postgres    false    203            ?
           2606    16472     SequelizeMeta SequelizeMeta_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);
 N   ALTER TABLE ONLY public."SequelizeMeta" DROP CONSTRAINT "SequelizeMeta_pkey";
       public            postgres    false    202            ?
           2606    16515    projects projects_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.projects DROP CONSTRAINT projects_pkey;
       public            postgres    false    206            ?
           2606    16545    tasks tasks_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.tasks DROP CONSTRAINT tasks_pkey;
       public            postgres    false    208            ?
           2606    16499    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    204            ?
           2606    16497    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    204            ?
           2606    16516    projects projects_user_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE;
 H   ALTER TABLE ONLY public.projects DROP CONSTRAINT projects_user_id_fkey;
       public          postgres    false    204    2728    206            ?
           2606    16551    tasks tasks_project_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON UPDATE CASCADE ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.tasks DROP CONSTRAINT tasks_project_id_fkey;
       public          postgres    false    208    206    2730            ?
           2606    16546    tasks tasks_user_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;
 B   ALTER TABLE ONLY public.tasks DROP CONSTRAINT tasks_user_id_fkey;
       public          postgres    false    2728    204    208            .   ]   x?U?;?  ў?,??E?.6h????Z??d?7???f2? ??G??S??????Gk+9??V?ؘ????O?[?1¬G?Fy?M
!N?%?      2   ?  x?}SKn?0]K??Ԃ?q?]?.??m7jL@?2Iy?U?.?.??'?Mr?e?v# ???7??"??>P??(k????>??5?????I????uܡTuփ??Ȟ?l??a?ـz?Ց?=?~O???????bԯ/??????@r?:??4???2??Dr?c`?Ϣ??#???'??weى
8DOV??	N`b?k6,??NbR;??Ofk???S?}tY?*???")??\???\B??U??MV,?y?	??ɝ}d#nr={/N??G=?<??Hʌ?q????T?!pl?`?㴓f????࢒??-??|??????KPZ%????C޹5
u???!?͈z3?;?]?8k(?6oںʚ?x#?J?s?:?~?Nڟ?svF?%??Wm^????9?6?͠Y??X?????9?Bپ'?(???JT??/??|#???Lqn????m?p[K?U???[(???i?3>.?      4   M  x??????0???)??gؠ?J?V?*????֋7x#?S?}?U=?)?bHH???X!??f???b(0DŅ(???I????3%/-7?G_?\?n??;_??f?{????x???ț??e???{?????P)?<??&Is??Q?[?K=?kf~v??5[?jҶ}4?6fm??֮?	?j?\?yI?)???/??? ???V?kl?͸{ ???j??Ў	G2d???3.??Di%
θHJ?B?(????$j??"??g???<f??8???`?ݺj???????hp?{??f????|kk3P???f?gg?|>th?ʔfl? ?]???;ܴ?w;[2?pY??ȇ??2?;?*!?
?q?2?D?6?݃??'g?(2P?"Cr:y?>8??kCE/?<?ω??nG????A#m2?[1??Gd? ?	?$a?ztH?Մw?؎0????1H@dA:???ٿЈO????Λ|??????y?tq??<?$$	?)??}E?<?J????????4?A6%?p???????[:N6??m6֯??y???H??f??( ??<?<HI4??,??]5?)%&|?? ???}      0     x???˒?0?ux
n?$ (+?;?xC??D?"7?~???????Ʃ?Bթ?r???<q? ?????J6wA?,d~???~c=;%}????f?7??\??j,?jܬV:?M?-W?Y?QY?~??;b
0?8?,D"???????,T^D?L??5.<?R??????F?!??ӀD???ת??y߹???۽'???D<q?\Q???ikݘ?`?[?O,?V{}ό?M77??-s??"aly4XP?j?k?/???:,?JJ????Тģ????*?][!̓???H??	ug<?K#?XƪY???*%?	j?5Y?j|???P?!ҡ*?#>E??4?'.?Xv\ʖ??|?
K=???U?Y???O?O????uY??????*?܀ӿ???|??%x2ۖy!???Yϼֶ?,?mL?7{????????1?Ě[??J?E?!?V????? h??^?ԳI ?i?l????\U	???l??ҨjKG???9-s???D???ժ???w;????	?:?Rɏ??H?#	??1=~?     