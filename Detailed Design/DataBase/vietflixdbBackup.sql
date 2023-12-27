PGDMP  0                    {            vietflix    16.1    16.1 4    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16398    vietflix    DATABASE     �   CREATE DATABASE vietflix WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
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
       public          postgres    false    220            �           0    0    Language_language_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."Language_language_id_seq" OWNED BY public."Language".language_id;
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
       public          postgres    false    225            �           0    0    Member_member_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Member_member_id_seq" OWNED BY public."Member".member_id;
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
       public          postgres    false    218            �           0    0    genre_genre_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.genre_genre_id_seq OWNED BY public.genre.genre_id;
          public          postgres    false    217            �            1259    16815    history    TABLE     �   CREATE TABLE public.history (
    member_id integer NOT NULL,
    movie_id integer NOT NULL,
    pause_time time without time zone
);
    DROP TABLE public.history;
       public         heap    postgres    false            �            1259    16706 	   mov_genre    TABLE     `   CREATE TABLE public.mov_genre (
    movie_id integer NOT NULL,
    genre_id integer NOT NULL
);
    DROP TABLE public.mov_genre;
       public         heap    postgres    false            �            1259    16735    mov_language    TABLE     f   CREATE TABLE public.mov_language (
    movie_id integer NOT NULL,
    language_id integer NOT NULL
);
     DROP TABLE public.mov_language;
       public         heap    postgres    false            �            1259    16674    movie    TABLE     e  CREATE TABLE public.movie (
    movie_id integer NOT NULL,
    movie_name text NOT NULL,
    movie_length time without time zone,
    movie_source text NOT NULL,
    movie_des text,
    movie_thumb text NOT NULL,
    movie_actor text,
    movie_year text NOT NULL,
    movie_point text NOT NULL,
    trailer_source text,
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
       public          postgres    false    216            �           0    0    movie_movie_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.movie_movie_id_seq OWNED BY public.movie.movie_id;
          public          postgres    false    215            �            1259    16748    package    TABLE     �   CREATE TABLE public.package (
    package_id integer NOT NULL,
    package_name text NOT NULL,
    price integer NOT NULL,
    package_time integer NOT NULL
);
    DROP TABLE public.package;
       public         heap    postgres    false            ?           2604    16695    Language language_id    DEFAULT     �   ALTER TABLE ONLY public."Language" ALTER COLUMN language_id SET DEFAULT nextval('public."Language_language_id_seq"'::regclass);
 E   ALTER TABLE public."Language" ALTER COLUMN language_id DROP DEFAULT;
       public          postgres    false    220    219    220            @           2604    16760    Member member_id    DEFAULT     x   ALTER TABLE ONLY public."Member" ALTER COLUMN member_id SET DEFAULT nextval('public."Member_member_id_seq"'::regclass);
 A   ALTER TABLE public."Member" ALTER COLUMN member_id DROP DEFAULT;
       public          postgres    false    224    225    225            >           2604    16686    genre genre_id    DEFAULT     p   ALTER TABLE ONLY public.genre ALTER COLUMN genre_id SET DEFAULT nextval('public.genre_genre_id_seq'::regclass);
 =   ALTER TABLE public.genre ALTER COLUMN genre_id DROP DEFAULT;
       public          postgres    false    217    218    218            =           2604    16677    movie movie_id    DEFAULT     p   ALTER TABLE ONLY public.movie ALTER COLUMN movie_id SET DEFAULT nextval('public.movie_movie_id_seq'::regclass);
 =   ALTER TABLE public.movie ALTER COLUMN movie_id DROP DEFAULT;
       public          postgres    false    215    216    216            �          0    16692    Language 
   TABLE DATA           @   COPY public."Language" (language_id, language_name) FROM stdin;
    public          postgres    false    220   �:       �          0    16757    Member 
   TABLE DATA           _   COPY public."Member" (member_id, mail, pass, member_name, package_id, exp_package) FROM stdin;
    public          postgres    false    225   (;       �          0    16794 	   favourite 
   TABLE DATA           8   COPY public.favourite (movie_id, member_id) FROM stdin;
    public          postgres    false    226   �;       �          0    16683    genre 
   TABLE DATA           5   COPY public.genre (genre_id, genre_name) FROM stdin;
    public          postgres    false    218   �;       �          0    16815    history 
   TABLE DATA           B   COPY public.history (member_id, movie_id, pause_time) FROM stdin;
    public          postgres    false    227   �<       �          0    16706 	   mov_genre 
   TABLE DATA           7   COPY public.mov_genre (movie_id, genre_id) FROM stdin;
    public          postgres    false    221   �<       �          0    16735    mov_language 
   TABLE DATA           =   COPY public.mov_language (movie_id, language_id) FROM stdin;
    public          postgres    false    222   =       �          0    16674    movie 
   TABLE DATA           �   COPY public.movie (movie_id, movie_name, movie_length, movie_source, movie_des, movie_thumb, movie_actor, movie_year, movie_point, trailer_source, movie_director) FROM stdin;
    public          postgres    false    216   ==       �          0    16748    package 
   TABLE DATA           P   COPY public.package (package_id, package_name, price, package_time) FROM stdin;
    public          postgres    false    223   GC       �           0    0    Language_language_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Language_language_id_seq"', 1, false);
          public          postgres    false    219            �           0    0    Member_member_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Member_member_id_seq"', 4, true);
          public          postgres    false    224            �           0    0    genre_genre_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.genre_genre_id_seq', 1, true);
          public          postgres    false    217            �           0    0    movie_movie_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.movie_movie_id_seq', 5, true);
          public          postgres    false    215            F           2606    16699    Language Language_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public."Language"
    ADD CONSTRAINT "Language_pkey" PRIMARY KEY (language_id);
 D   ALTER TABLE ONLY public."Language" DROP CONSTRAINT "Language_pkey";
       public            postgres    false    220            J           2606    16772    Member Member_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."Member"
    ADD CONSTRAINT "Member_pkey" PRIMARY KEY (member_id);
 @   ALTER TABLE ONLY public."Member" DROP CONSTRAINT "Member_pkey";
       public            postgres    false    225            D           2606    16690    genre genre_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (genre_id);
 :   ALTER TABLE ONLY public.genre DROP CONSTRAINT genre_pkey;
       public            postgres    false    218            B           2606    16681    movie movie_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.movie
    ADD CONSTRAINT movie_pkey PRIMARY KEY (movie_id);
 :   ALTER TABLE ONLY public.movie DROP CONSTRAINT movie_pkey;
       public            postgres    false    216            H           2606    16754    package package_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.package
    ADD CONSTRAINT package_pkey PRIMARY KEY (package_id);
 >   ALTER TABLE ONLY public.package DROP CONSTRAINT package_pkey;
       public            postgres    false    223            P           2606    16797    favourite fk_fav_member    FK CONSTRAINT     �   ALTER TABLE ONLY public.favourite
    ADD CONSTRAINT fk_fav_member FOREIGN KEY (member_id) REFERENCES public."Member"(member_id);
 A   ALTER TABLE ONLY public.favourite DROP CONSTRAINT fk_fav_member;
       public          postgres    false    4682    226    225            Q           2606    16802    favourite fk_fav_movie    FK CONSTRAINT     |   ALTER TABLE ONLY public.favourite
    ADD CONSTRAINT fk_fav_movie FOREIGN KEY (movie_id) REFERENCES public.movie(movie_id);
 @   ALTER TABLE ONLY public.favourite DROP CONSTRAINT fk_fav_movie;
       public          postgres    false    216    4674    226            K           2606    16714    mov_genre fk_genre_movie    FK CONSTRAINT     ~   ALTER TABLE ONLY public.mov_genre
    ADD CONSTRAINT fk_genre_movie FOREIGN KEY (genre_id) REFERENCES public.genre(genre_id);
 B   ALTER TABLE ONLY public.mov_genre DROP CONSTRAINT fk_genre_movie;
       public          postgres    false    4676    221    218            R           2606    16818    history fk_his_member    FK CONSTRAINT     �   ALTER TABLE ONLY public.history
    ADD CONSTRAINT fk_his_member FOREIGN KEY (member_id) REFERENCES public."Member"(member_id);
 ?   ALTER TABLE ONLY public.history DROP CONSTRAINT fk_his_member;
       public          postgres    false    227    225    4682            S           2606    16823    history fk_his_movie    FK CONSTRAINT     z   ALTER TABLE ONLY public.history
    ADD CONSTRAINT fk_his_movie FOREIGN KEY (movie_id) REFERENCES public.movie(movie_id);
 >   ALTER TABLE ONLY public.history DROP CONSTRAINT fk_his_movie;
       public          postgres    false    4674    227    216            M           2606    16743    mov_language fk_lang_mov    FK CONSTRAINT     �   ALTER TABLE ONLY public.mov_language
    ADD CONSTRAINT fk_lang_mov FOREIGN KEY (language_id) REFERENCES public."Language"(language_id);
 B   ALTER TABLE ONLY public.mov_language DROP CONSTRAINT fk_lang_mov;
       public          postgres    false    4678    220    222            O           2606    16763    Member fk_member_pack    FK CONSTRAINT     �   ALTER TABLE ONLY public."Member"
    ADD CONSTRAINT fk_member_pack FOREIGN KEY (package_id) REFERENCES public.package(package_id);
 A   ALTER TABLE ONLY public."Member" DROP CONSTRAINT fk_member_pack;
       public          postgres    false    223    4680    225            N           2606    16738    mov_language fk_mov_lang    FK CONSTRAINT     ~   ALTER TABLE ONLY public.mov_language
    ADD CONSTRAINT fk_mov_lang FOREIGN KEY (movie_id) REFERENCES public.movie(movie_id);
 B   ALTER TABLE ONLY public.mov_language DROP CONSTRAINT fk_mov_lang;
       public          postgres    false    4674    216    222            L           2606    16709    mov_genre fk_movie_genre    FK CONSTRAINT     ~   ALTER TABLE ONLY public.mov_genre
    ADD CONSTRAINT fk_movie_genre FOREIGN KEY (movie_id) REFERENCES public.movie(movie_id);
 B   ALTER TABLE ONLY public.mov_genre DROP CONSTRAINT fk_movie_genre;
       public          postgres    false    216    221    4674            �   �   x����PD�ُ1.�T�1�X٬��n����{�;�33�����j����uc}��`>e��?.p뢊�Ǩ^Z��4X㤱Mn�� �%�9�Q>V3�]�z�n8�ټ2�;�:��<����3"�RH+�      �   t   x�u�;� E�zX+0����v6�IH��^&ک�{�JH�S�ڸ5>#H�M��h�tq�Bh�F�`.g
ٻ?�z��$n�k�ݲ+�o�|��
E�yF���|TL~jc�|9�      �      x�3�4�2bcN#. 6�4����� '�      �   �   x�%��
�0E�3_���K]�qS]t�fHG4��B��Pw�u���F'���(�Љ�)aw�,c�8������ӗC\���%ُ��v�f<A��3�aHq���bW��l��yھLúl�)a$ES��Kd�e��'45\(�K��$�8�      �   :   x����@�w2J�VH���� �?)�q�0T)��O�Y6�d����i�7����BP      �   3   x��� 0���T�&��̃c�� ���.��������h3���V�      �      x�3�4�2bc 6bSN�=... '�      �   �  x����n�:�+W��Ʋ�X,��&i�n7�9�"cil�H������^��ؾ�����,\��-q�C�<�q4ݲ^���k��P�Q�?�Ɠ8��'��J�b1#��b�8���v[��^7>'�.��v��)~�>������.��"��fr�%_z����C�UMW��p9���T;rJ�c*W���Nĝ^)��N|!V3~�	��V[X�P�PZ�F�Z�/��a8��3Y.	`v*
�����>���\,�NY�Ʋ����/��{�1'm�J�2n:�X����
��0�.��U���m[��l)SS�9�
>s.���|xVr�h��e{f��h4��Q�;>����9SVpG<�%['�L�y'>X�L��k
�;��v;qiLŶG��\oIc�s&-n�yJ�`���-յ	���=�������x`��<��)�C�eF6��ZQa^�rY�ƺ�#�H�B�,uB�>�e�U�#"��ϥ�V;Ӹf���%�����1�]������4�j��7،O
�����K�j/�%[����C{���ۨۛă� ��V8�pL�Z⛇<xHxȽ�<x��H~������}_�b����m��kO@��r$e�z�JZ�@
�	/SY����+.
ӾBj3���N^�{y%h���l13mǇ[�C]ஹE���ʚ����	&�����@�aE�ӑN��I<���{�^o8��Üʆq/�,1`z��Vh��y��æy	�QX�ܑ�D&?���D�������e�x����Gth[�����"����o��6��a�X���m-�k�Ӌ>�v6���r}qz�
^}�XN]i��^�nd��FZ�T��8�� u9p�*qt�A�0�׺JA�]k�zz���<�N��K�K�U��k,�� �@?��\���S?�����0y�O(F W�sH����i�5oJ
r�R��ץ4�I�n?��ߑ�ģa�čFgѴ��ln������)4��\�0^r���ű���\裤�lvޣj��M3*}���f'I��R�B5T�	g��o����߉o�s���?�1$Z��Kv-C�C�7
5�u)=�4&����5<���$�s�8 P�H8��3�@T�,g^� #��y����V��0���X���
�2U�	�&���8�+�q~��0�� H�^��#�R*v�������a�{yI��I5C�Œ��@:��-NK*���#>�M���+F��b��`�nfM������ �-�,�ܣ��d}5���}-�$�I����*�'�ZZ,�>��f��5�Jh�J��^<�V"�<?���h����������r�ғ��F��8�����
���Y�F�;JZ�4+�_s������T�H��[��P�����o�ҏ�c�����ñ©���߷�X���L����.��V�@VR��9h����~�6�]��H�h����a��Z�lw�RmT�+����q���``�j�#�����d�s�|:�g4������Ն��B����m��      �   Y   x�3400����+�PHL�NLO�41 NC.C#���Ģ�Ԣ�J���X�$o�i����i5��p*T�&ALe����� �<�     