PGDMP  *    &        	         |            vietflix    16.1    16.1 ?    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                        0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16398    vietflix    DATABASE     �   CREATE DATABASE vietflix WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE vietflix;
                postgres    false            �            1259    16692    Language    TABLE     f   CREATE TABLE public."Language" (
    language_id integer NOT NULL,
    language_name text NOT NULL
);
    DROP TABLE public."Language";
       public         heap    postgres    false            �            1259    16691    Language_language_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Language_language_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."Language_language_id_seq";
       public          postgres    false    220                       0    0    Language_language_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."Language_language_id_seq" OWNED BY public."Language".language_id;
          public          postgres    false    219            �            1259    16757    Member    TABLE     �   CREATE TABLE public."Member" (
    member_id integer NOT NULL,
    mail text NOT NULL,
    pass text NOT NULL,
    member_name text NOT NULL,
    package_id integer,
    exp_package timestamp without time zone
);
    DROP TABLE public."Member";
       public         heap    postgres    false            �            1259    16756    Member_member_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Member_member_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Member_member_id_seq";
       public          postgres    false    225                       0    0    Member_member_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Member_member_id_seq" OWNED BY public."Member".member_id;
          public          postgres    false    224            �            1259    16794 	   favourite    TABLE     a   CREATE TABLE public.favourite (
    movie_id integer NOT NULL,
    member_id integer NOT NULL
);
    DROP TABLE public.favourite;
       public         heap    postgres    false            �            1259    16683    genre    TABLE     [   CREATE TABLE public.genre (
    genre_id integer NOT NULL,
    genre_name text NOT NULL
);
    DROP TABLE public.genre;
       public         heap    postgres    false            �            1259    16682    genre_genre_id_seq    SEQUENCE     �   CREATE SEQUENCE public.genre_genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.genre_genre_id_seq;
       public          postgres    false    218                       0    0    genre_genre_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.genre_genre_id_seq OWNED BY public.genre.genre_id;
          public          postgres    false    217            �            1259    16815    history    TABLE     �   CREATE TABLE public.history (
    member_id integer NOT NULL,
    movie_id integer NOT NULL,
    pause_time time without time zone
);
    DROP TABLE public.history;
       public         heap    postgres    false            �            1259    16829    member    TABLE     Q  CREATE TABLE public.member (
    id integer NOT NULL,
    mail character varying(255),
    name character varying(255),
    password character varying(255),
    member_id integer NOT NULL,
    exp_package character varying(255),
    member_name character varying(255),
    package_id integer NOT NULL,
    pass character varying(255)
);
    DROP TABLE public.member;
       public         heap    postgres    false            �            1259    16828    member_id_seq    SEQUENCE     �   CREATE SEQUENCE public.member_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.member_id_seq;
       public          postgres    false    229                       0    0    member_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.member_id_seq OWNED BY public.member.id;
          public          postgres    false    228            �            1259    16853    member_member_id_seq    SEQUENCE     �   CREATE SEQUENCE public.member_member_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.member_member_id_seq;
       public          postgres    false    229                       0    0    member_member_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.member_member_id_seq OWNED BY public.member.member_id;
          public          postgres    false    230            �            1259    16706 	   mov_genre    TABLE     `   CREATE TABLE public.mov_genre (
    movie_id integer NOT NULL,
    genre_id integer NOT NULL
);
    DROP TABLE public.mov_genre;
       public         heap    postgres    false            �            1259    16735    mov_language    TABLE     f   CREATE TABLE public.mov_language (
    movie_id integer NOT NULL,
    language_id integer NOT NULL
);
     DROP TABLE public.mov_language;
       public         heap    postgres    false            �            1259    16674    movie    TABLE     �  CREATE TABLE public.movie (
    movie_id integer NOT NULL,
    movie_name text NOT NULL,
    movie_length time without time zone NOT NULL,
    movie_source text NOT NULL,
    movie_des text NOT NULL,
    movie_thumb text NOT NULL,
    movie_actor text NOT NULL,
    movie_year text NOT NULL,
    movie_point double precision NOT NULL,
    trailer_source text NOT NULL,
    movie_director text NOT NULL
);
    DROP TABLE public.movie;
       public         heap    postgres    false            �            1259    16673    movie_movie_id_seq    SEQUENCE     �   CREATE SEQUENCE public.movie_movie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.movie_movie_id_seq;
       public          postgres    false    216                       0    0    movie_movie_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.movie_movie_id_seq OWNED BY public.movie.movie_id;
          public          postgres    false    215            �            1259    16748    package    TABLE     �   CREATE TABLE public.package (
    package_id integer NOT NULL,
    package_name text NOT NULL,
    price integer NOT NULL,
    package_time integer NOT NULL
);
    DROP TABLE public.package;
       public         heap    postgres    false            E           2604    16868    Language language_id    DEFAULT     �   ALTER TABLE ONLY public."Language" ALTER COLUMN language_id SET DEFAULT nextval('public."Language_language_id_seq"'::regclass);
 E   ALTER TABLE public."Language" ALTER COLUMN language_id DROP DEFAULT;
       public          postgres    false    220    219    220            F           2604    16869    Member member_id    DEFAULT     x   ALTER TABLE ONLY public."Member" ALTER COLUMN member_id SET DEFAULT nextval('public."Member_member_id_seq"'::regclass);
 A   ALTER TABLE public."Member" ALTER COLUMN member_id DROP DEFAULT;
       public          postgres    false    224    225    225            D           2604    16870    genre genre_id    DEFAULT     p   ALTER TABLE ONLY public.genre ALTER COLUMN genre_id SET DEFAULT nextval('public.genre_genre_id_seq'::regclass);
 =   ALTER TABLE public.genre ALTER COLUMN genre_id DROP DEFAULT;
       public          postgres    false    218    217    218            G           2604    16832 	   member id    DEFAULT     f   ALTER TABLE ONLY public.member ALTER COLUMN id SET DEFAULT nextval('public.member_id_seq'::regclass);
 8   ALTER TABLE public.member ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    228    229            H           2604    16854    member member_id    DEFAULT     t   ALTER TABLE ONLY public.member ALTER COLUMN member_id SET DEFAULT nextval('public.member_member_id_seq'::regclass);
 ?   ALTER TABLE public.member ALTER COLUMN member_id DROP DEFAULT;
       public          postgres    false    230    229            C           2604    16871    movie movie_id    DEFAULT     p   ALTER TABLE ONLY public.movie ALTER COLUMN movie_id SET DEFAULT nextval('public.movie_movie_id_seq'::regclass);
 =   ALTER TABLE public.movie ALTER COLUMN movie_id DROP DEFAULT;
       public          postgres    false    216    215    216            �          0    16692    Language 
   TABLE DATA           @   COPY public."Language" (language_id, language_name) FROM stdin;
    public          postgres    false    220   HG       �          0    16757    Member 
   TABLE DATA           _   COPY public."Member" (member_id, mail, pass, member_name, package_id, exp_package) FROM stdin;
    public          postgres    false    225   �G       �          0    16794 	   favourite 
   TABLE DATA           8   COPY public.favourite (movie_id, member_id) FROM stdin;
    public          postgres    false    226   �H       �          0    16683    genre 
   TABLE DATA           5   COPY public.genre (genre_id, genre_name) FROM stdin;
    public          postgres    false    218   �H       �          0    16815    history 
   TABLE DATA           B   COPY public.history (member_id, movie_id, pause_time) FROM stdin;
    public          postgres    false    227   ^I       �          0    16829    member 
   TABLE DATA           q   COPY public.member (id, mail, name, password, member_id, exp_package, member_name, package_id, pass) FROM stdin;
    public          postgres    false    229   �I       �          0    16706 	   mov_genre 
   TABLE DATA           7   COPY public.mov_genre (movie_id, genre_id) FROM stdin;
    public          postgres    false    221   �I       �          0    16735    mov_language 
   TABLE DATA           =   COPY public.mov_language (movie_id, language_id) FROM stdin;
    public          postgres    false    222   J       �          0    16674    movie 
   TABLE DATA           �   COPY public.movie (movie_id, movie_name, movie_length, movie_source, movie_des, movie_thumb, movie_actor, movie_year, movie_point, trailer_source, movie_director) FROM stdin;
    public          postgres    false    216   CJ       �          0    16748    package 
   TABLE DATA           P   COPY public.package (package_id, package_name, price, package_time) FROM stdin;
    public          postgres    false    223   WP       	           0    0    Language_language_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Language_language_id_seq"', 1, false);
          public          postgres    false    219            
           0    0    Member_member_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Member_member_id_seq"', 4, true);
          public          postgres    false    224                       0    0    genre_genre_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.genre_genre_id_seq', 1, true);
          public          postgres    false    217                       0    0    member_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.member_id_seq', 1, false);
          public          postgres    false    228                       0    0    member_member_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.member_member_id_seq', 1, false);
          public          postgres    false    230                       0    0    movie_movie_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.movie_movie_id_seq', 5, true);
          public          postgres    false    215            N           2606    16699    Language Language_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public."Language"
    ADD CONSTRAINT "Language_pkey" PRIMARY KEY (language_id);
 D   ALTER TABLE ONLY public."Language" DROP CONSTRAINT "Language_pkey";
       public            postgres    false    220            R           2606    16772    Member Member_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."Member"
    ADD CONSTRAINT "Member_pkey" PRIMARY KEY (member_id);
 @   ALTER TABLE ONLY public."Member" DROP CONSTRAINT "Member_pkey";
       public            postgres    false    225            L           2606    16690    genre genre_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (genre_id);
 :   ALTER TABLE ONLY public.genre DROP CONSTRAINT genre_pkey;
       public            postgres    false    218            T           2606    16836    member member_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.member
    ADD CONSTRAINT member_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.member DROP CONSTRAINT member_pkey;
       public            postgres    false    229            J           2606    16681    movie movie_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.movie
    ADD CONSTRAINT movie_pkey PRIMARY KEY (movie_id);
 :   ALTER TABLE ONLY public.movie DROP CONSTRAINT movie_pkey;
       public            postgres    false    216            P           2606    16754    package package_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.package
    ADD CONSTRAINT package_pkey PRIMARY KEY (package_id);
 >   ALTER TABLE ONLY public.package DROP CONSTRAINT package_pkey;
       public            postgres    false    223            Z           2606    16797    favourite fk_fav_member    FK CONSTRAINT     �   ALTER TABLE ONLY public.favourite
    ADD CONSTRAINT fk_fav_member FOREIGN KEY (member_id) REFERENCES public."Member"(member_id);
 A   ALTER TABLE ONLY public.favourite DROP CONSTRAINT fk_fav_member;
       public          postgres    false    225    4690    226            [           2606    16802    favourite fk_fav_movie    FK CONSTRAINT     |   ALTER TABLE ONLY public.favourite
    ADD CONSTRAINT fk_fav_movie FOREIGN KEY (movie_id) REFERENCES public.movie(movie_id);
 @   ALTER TABLE ONLY public.favourite DROP CONSTRAINT fk_fav_movie;
       public          postgres    false    4682    226    216            U           2606    16714    mov_genre fk_genre_movie    FK CONSTRAINT     ~   ALTER TABLE ONLY public.mov_genre
    ADD CONSTRAINT fk_genre_movie FOREIGN KEY (genre_id) REFERENCES public.genre(genre_id);
 B   ALTER TABLE ONLY public.mov_genre DROP CONSTRAINT fk_genre_movie;
       public          postgres    false    218    221    4684            \           2606    16818    history fk_his_member    FK CONSTRAINT     �   ALTER TABLE ONLY public.history
    ADD CONSTRAINT fk_his_member FOREIGN KEY (member_id) REFERENCES public."Member"(member_id);
 ?   ALTER TABLE ONLY public.history DROP CONSTRAINT fk_his_member;
       public          postgres    false    227    225    4690            ]           2606    16823    history fk_his_movie    FK CONSTRAINT     z   ALTER TABLE ONLY public.history
    ADD CONSTRAINT fk_his_movie FOREIGN KEY (movie_id) REFERENCES public.movie(movie_id);
 >   ALTER TABLE ONLY public.history DROP CONSTRAINT fk_his_movie;
       public          postgres    false    4682    227    216            W           2606    16743    mov_language fk_lang_mov    FK CONSTRAINT     �   ALTER TABLE ONLY public.mov_language
    ADD CONSTRAINT fk_lang_mov FOREIGN KEY (language_id) REFERENCES public."Language"(language_id);
 B   ALTER TABLE ONLY public.mov_language DROP CONSTRAINT fk_lang_mov;
       public          postgres    false    222    220    4686            Y           2606    16763    Member fk_member_pack    FK CONSTRAINT     �   ALTER TABLE ONLY public."Member"
    ADD CONSTRAINT fk_member_pack FOREIGN KEY (package_id) REFERENCES public.package(package_id);
 A   ALTER TABLE ONLY public."Member" DROP CONSTRAINT fk_member_pack;
       public          postgres    false    223    4688    225            X           2606    16738    mov_language fk_mov_lang    FK CONSTRAINT     ~   ALTER TABLE ONLY public.mov_language
    ADD CONSTRAINT fk_mov_lang FOREIGN KEY (movie_id) REFERENCES public.movie(movie_id);
 B   ALTER TABLE ONLY public.mov_language DROP CONSTRAINT fk_mov_lang;
       public          postgres    false    4682    222    216            V           2606    16709    mov_genre fk_movie_genre    FK CONSTRAINT     ~   ALTER TABLE ONLY public.mov_genre
    ADD CONSTRAINT fk_movie_genre FOREIGN KEY (movie_id) REFERENCES public.movie(movie_id);
 B   ALTER TABLE ONLY public.mov_genre DROP CONSTRAINT fk_movie_genre;
       public          postgres    false    221    4682    216            �   �   x����PD�ُ1.�T�1�X٬��n����{�;�33�����j����uc}��`>e��?.p뢊�Ǩ^Z��4X㤱Mn�� �%�9�Q>V3�]�z�n8�ټ2�;�:��<����3"�RH+�      �   �   x�u�=�0�g��@*�I)tb`�	��?
�p#!:��$" =�����9�U��)>>��i�$@l]{����q�Q��eO[�~��[�4�Fv���E�l��)�e?���i�?�Ȋ����ck���}N�m������cQpUt��s�06J�7��B�      �   !   x�3�4�2bcN#. 6�4�2�"���� {�Y      �   �   x�%��
�0E�3_���K]�qS]t�fHG4��B��Pw�u���F'���(�Љ�)aw�,c�8������ӗC\���%ُ��v�f<A��3�aHq���bW��l��yھLúl�)a$ES��Kd�e��'45\(�K��$�8�      �   A   x����	�0Cѳ4L�e��f��s$�
=>�|!��(�NY}P��b\��|��ޓ�����S�      �      x������ � �      �   8   x��˱  B�:��d��ï#X ��Qr��'N<�ċ]o[����\��{H:�##      �      x�3�4�2bc 6bSN.C,b1z\\\ |]      �     x��V�n�6��<���Ж-�@�p>&�L<;���⠸��-�)P��}�I��zH;��E ö�{.�{�=d�v�7l��Jg�Tr�L{�4����r�VE�\���X.����� V��ߋ�މ�󢹧��x�{�^�߯y����<B�G�&(��%�/YVI4[;���,2�Q��)��T�f-^�Nŭ^+��^|!V3y�	�F�"X�Z(-l�t-���0�sQ�L�KBd��P\���Iu��`atʢ4�}2c3�<�a������!(u�h�t��������.��U���M3}J�o�5[��tUI����q��Ϸ�⹸��V���hq�3ewĽY�u�Ҵ��⃕��Թ8��P��_��Tl; ZT�jG{\0iq�h�-R�;46Q�&`�;����F{q�Z�<��)�}�eUl�w��¼Lp�e���$M
�Xe�J�,c^U�""�B�&2�V��m��4�Y�LM�mɥ��v?<������T�F3�r���K�[��ߓ~tA��bV�U)���+ia�L��z�i<������� ���Q���@�B^�ɟ�.�޾�z�y-�An���fSp���Y�pr���y���U.@^8��M%Z�nk.
Ӿ�8T~!o䭼�w�R@]ځ��-�����[�s�����X&'�֔~~y?E"��`![��1��u� T��*���w��'�`2uK���l����'��h��тʆq'�,1���{��h�������Ca�G��-��o�m�(n��/�ۿW� �h��Z\��7/��9�s��Җ��i����%L�j�_C�8HC��g?�/W秗`���P�r�JS|�b~-��.��J���ى4��P�&R�ad�s��T)��k�w:���J�M\�XL]c��kh�FS��==�	��]����P�J��a�~o��A�ySR����,��o�d�$���;�$�x��p�q7���ɽ�X����+o��ܬV{�8EK���#_w�N�M�l~֧j�Kڋf�^���I}�T�Q�{UK�i9~E�����w�i�$Ƽ;�p-ε��ᜡ�[������ik��H=���ǇM �-p'�[@$���F�)˙�@fq2!�f.��b/̪��8uũ�B�L�&	'3�Z�I��8��&d�$s:؇*�b_�>��l��`4�o��,�C�nt���/V� M�op�Q	����Qm�4W���ٛ7ͼ)?�?�Mt�@:lK��`�9F_Mcŧp+���h:��y�J��|����Ǐ���=a�R	m R<��Q�����?�!׮nVO���fh���=�M��1΁ܳC��fm]�N�3��[����:5hv�A���ֺ���oV��k�C��I|�`���.�7�í�U����|lU���([�*���d���o5� ��q��f<�����\��-�~P���x;<�9����}U�r����Go����d�s�|:�1���`�TbK�d)ONN~Џ�l      �   Y   x�3400����+�PHL�NLO�41 NC.C#���Ģ�Ԣ�J���X�$o�i����i5��p*T�&ALe����� �<�     