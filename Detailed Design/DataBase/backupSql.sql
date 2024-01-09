PGDMP               	         |            vietflix    16.1    16.1 7    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16398    vietflix    DATABASE     �   CREATE DATABASE vietflix WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE vietflix;
                postgres    false                        2615    16984    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            �           0    0    SCHEMA public    COMMENT         COMMENT ON SCHEMA public IS '';
                   postgres    false    5            �           0    0    SCHEMA public    ACL     +   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
                   postgres    false    5            �            1259    16985    Language    TABLE     f   CREATE TABLE public."Language" (
    language_id integer NOT NULL,
    language_name text NOT NULL
);
    DROP TABLE public."Language";
       public         heap    postgres    false    5            �            1259    16990    Language_language_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Language_language_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."Language_language_id_seq";
       public          postgres    false    5    215            �           0    0    Language_language_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."Language_language_id_seq" OWNED BY public."Language".language_id;
          public          postgres    false    216            �            1259    16991    Member    TABLE     �   CREATE TABLE public."Member" (
    member_id integer NOT NULL,
    mail text NOT NULL,
    pass text NOT NULL,
    member_name text NOT NULL,
    package_id integer,
    exp_package timestamp without time zone
);
    DROP TABLE public."Member";
       public         heap    postgres    false    5            �            1259    16996    Member_member_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Member_member_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Member_member_id_seq";
       public          postgres    false    5    217            �           0    0    Member_member_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Member_member_id_seq" OWNED BY public."Member".member_id;
          public          postgres    false    218            �            1259    16997 	   favourite    TABLE     a   CREATE TABLE public.favourite (
    movie_id integer NOT NULL,
    member_id integer NOT NULL
);
    DROP TABLE public.favourite;
       public         heap    postgres    false    5            �            1259    17000    genre    TABLE     [   CREATE TABLE public.genre (
    genre_id integer NOT NULL,
    genre_name text NOT NULL
);
    DROP TABLE public.genre;
       public         heap    postgres    false    5            �            1259    17005    genre_genre_id_seq    SEQUENCE     �   CREATE SEQUENCE public.genre_genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.genre_genre_id_seq;
       public          postgres    false    220    5            �           0    0    genre_genre_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.genre_genre_id_seq OWNED BY public.genre.genre_id;
          public          postgres    false    221            �            1259    17006    history    TABLE     �   CREATE TABLE public.history (
    member_id integer NOT NULL,
    movie_id integer NOT NULL,
    pause_time time without time zone
);
    DROP TABLE public.history;
       public         heap    postgres    false    5            �            1259    17009 	   mov_genre    TABLE     `   CREATE TABLE public.mov_genre (
    movie_id integer NOT NULL,
    genre_id integer NOT NULL
);
    DROP TABLE public.mov_genre;
       public         heap    postgres    false    5            �            1259    17012    mov_language    TABLE     f   CREATE TABLE public.mov_language (
    movie_id integer NOT NULL,
    language_id integer NOT NULL
);
     DROP TABLE public.mov_language;
       public         heap    postgres    false    5            �            1259    17015    movie    TABLE     q  CREATE TABLE public.movie (
    movie_id integer NOT NULL,
    movie_name text NOT NULL,
    movie_length time without time zone,
    movie_source text NOT NULL,
    movie_des text,
    movie_thumb text NOT NULL,
    movie_actor text,
    movie_year text NOT NULL,
    movie_point double precision NOT NULL,
    trailer_source text,
    movie_director text NOT NULL
);
    DROP TABLE public.movie;
       public         heap    postgres    false    5            �            1259    17020    movie_movie_id_seq    SEQUENCE     �   CREATE SEQUENCE public.movie_movie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.movie_movie_id_seq;
       public          postgres    false    225    5            �           0    0    movie_movie_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.movie_movie_id_seq OWNED BY public.movie.movie_id;
          public          postgres    false    226            �            1259    17021    package    TABLE     �   CREATE TABLE public.package (
    package_id integer NOT NULL,
    package_name text NOT NULL,
    price integer NOT NULL,
    package_time integer NOT NULL
);
    DROP TABLE public.package;
       public         heap    postgres    false    5            =           2604    17026    Language language_id    DEFAULT     �   ALTER TABLE ONLY public."Language" ALTER COLUMN language_id SET DEFAULT nextval('public."Language_language_id_seq"'::regclass);
 E   ALTER TABLE public."Language" ALTER COLUMN language_id DROP DEFAULT;
       public          postgres    false    216    215            >           2604    17027    Member member_id    DEFAULT     x   ALTER TABLE ONLY public."Member" ALTER COLUMN member_id SET DEFAULT nextval('public."Member_member_id_seq"'::regclass);
 A   ALTER TABLE public."Member" ALTER COLUMN member_id DROP DEFAULT;
       public          postgres    false    218    217            ?           2604    17028    genre genre_id    DEFAULT     p   ALTER TABLE ONLY public.genre ALTER COLUMN genre_id SET DEFAULT nextval('public.genre_genre_id_seq'::regclass);
 =   ALTER TABLE public.genre ALTER COLUMN genre_id DROP DEFAULT;
       public          postgres    false    221    220            @           2604    17029    movie movie_id    DEFAULT     p   ALTER TABLE ONLY public.movie ALTER COLUMN movie_id SET DEFAULT nextval('public.movie_movie_id_seq'::regclass);
 =   ALTER TABLE public.movie ALTER COLUMN movie_id DROP DEFAULT;
       public          postgres    false    226    225            �          0    16985    Language 
   TABLE DATA           @   COPY public."Language" (language_id, language_name) FROM stdin;
    public          postgres    false    215   �<       �          0    16991    Member 
   TABLE DATA           _   COPY public."Member" (member_id, mail, pass, member_name, package_id, exp_package) FROM stdin;
    public          postgres    false    217   �=       �          0    16997 	   favourite 
   TABLE DATA           8   COPY public.favourite (movie_id, member_id) FROM stdin;
    public          postgres    false    219   >       �          0    17000    genre 
   TABLE DATA           5   COPY public.genre (genre_id, genre_name) FROM stdin;
    public          postgres    false    220   >>       �          0    17006    history 
   TABLE DATA           B   COPY public.history (member_id, movie_id, pause_time) FROM stdin;
    public          postgres    false    222   �>       �          0    17009 	   mov_genre 
   TABLE DATA           7   COPY public.mov_genre (movie_id, genre_id) FROM stdin;
    public          postgres    false    223   2?       �          0    17012    mov_language 
   TABLE DATA           =   COPY public.mov_language (movie_id, language_id) FROM stdin;
    public          postgres    false    224   u?       �          0    17015    movie 
   TABLE DATA           �   COPY public.movie (movie_id, movie_name, movie_length, movie_source, movie_des, movie_thumb, movie_actor, movie_year, movie_point, trailer_source, movie_director) FROM stdin;
    public          postgres    false    225   �?       �          0    17021    package 
   TABLE DATA           P   COPY public.package (package_id, package_name, price, package_time) FROM stdin;
    public          postgres    false    227   �E       �           0    0    Language_language_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Language_language_id_seq"', 1, false);
          public          postgres    false    216            �           0    0    Member_member_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Member_member_id_seq"', 4, true);
          public          postgres    false    218            �           0    0    genre_genre_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.genre_genre_id_seq', 1, true);
          public          postgres    false    221            �           0    0    movie_movie_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.movie_movie_id_seq', 5, true);
          public          postgres    false    226            B           2606    17031    Language Language_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public."Language"
    ADD CONSTRAINT "Language_pkey" PRIMARY KEY (language_id);
 D   ALTER TABLE ONLY public."Language" DROP CONSTRAINT "Language_pkey";
       public            postgres    false    215            D           2606    17033    Member Member_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."Member"
    ADD CONSTRAINT "Member_pkey" PRIMARY KEY (member_id);
 @   ALTER TABLE ONLY public."Member" DROP CONSTRAINT "Member_pkey";
       public            postgres    false    217            F           2606    17035    genre genre_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (genre_id);
 :   ALTER TABLE ONLY public.genre DROP CONSTRAINT genre_pkey;
       public            postgres    false    220            H           2606    17037    movie movie_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.movie
    ADD CONSTRAINT movie_pkey PRIMARY KEY (movie_id);
 :   ALTER TABLE ONLY public.movie DROP CONSTRAINT movie_pkey;
       public            postgres    false    225            J           2606    17039    package package_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.package
    ADD CONSTRAINT package_pkey PRIMARY KEY (package_id);
 >   ALTER TABLE ONLY public.package DROP CONSTRAINT package_pkey;
       public            postgres    false    227            L           2606    17040    favourite fk_fav_member    FK CONSTRAINT     �   ALTER TABLE ONLY public.favourite
    ADD CONSTRAINT fk_fav_member FOREIGN KEY (member_id) REFERENCES public."Member"(member_id);
 A   ALTER TABLE ONLY public.favourite DROP CONSTRAINT fk_fav_member;
       public          postgres    false    219    217    4676            M           2606    17045    favourite fk_fav_movie    FK CONSTRAINT     |   ALTER TABLE ONLY public.favourite
    ADD CONSTRAINT fk_fav_movie FOREIGN KEY (movie_id) REFERENCES public.movie(movie_id);
 @   ALTER TABLE ONLY public.favourite DROP CONSTRAINT fk_fav_movie;
       public          postgres    false    4680    219    225            P           2606    17050    mov_genre fk_genre_movie    FK CONSTRAINT     ~   ALTER TABLE ONLY public.mov_genre
    ADD CONSTRAINT fk_genre_movie FOREIGN KEY (genre_id) REFERENCES public.genre(genre_id);
 B   ALTER TABLE ONLY public.mov_genre DROP CONSTRAINT fk_genre_movie;
       public          postgres    false    4678    220    223            N           2606    17055    history fk_his_member    FK CONSTRAINT     �   ALTER TABLE ONLY public.history
    ADD CONSTRAINT fk_his_member FOREIGN KEY (member_id) REFERENCES public."Member"(member_id);
 ?   ALTER TABLE ONLY public.history DROP CONSTRAINT fk_his_member;
       public          postgres    false    217    222    4676            O           2606    17060    history fk_his_movie    FK CONSTRAINT     z   ALTER TABLE ONLY public.history
    ADD CONSTRAINT fk_his_movie FOREIGN KEY (movie_id) REFERENCES public.movie(movie_id);
 >   ALTER TABLE ONLY public.history DROP CONSTRAINT fk_his_movie;
       public          postgres    false    222    4680    225            R           2606    17065    mov_language fk_lang_mov    FK CONSTRAINT     �   ALTER TABLE ONLY public.mov_language
    ADD CONSTRAINT fk_lang_mov FOREIGN KEY (language_id) REFERENCES public."Language"(language_id);
 B   ALTER TABLE ONLY public.mov_language DROP CONSTRAINT fk_lang_mov;
       public          postgres    false    215    224    4674            K           2606    17070    Member fk_member_pack    FK CONSTRAINT     �   ALTER TABLE ONLY public."Member"
    ADD CONSTRAINT fk_member_pack FOREIGN KEY (package_id) REFERENCES public.package(package_id);
 A   ALTER TABLE ONLY public."Member" DROP CONSTRAINT fk_member_pack;
       public          postgres    false    217    227    4682            S           2606    17075    mov_language fk_mov_lang    FK CONSTRAINT     ~   ALTER TABLE ONLY public.mov_language
    ADD CONSTRAINT fk_mov_lang FOREIGN KEY (movie_id) REFERENCES public.movie(movie_id);
 B   ALTER TABLE ONLY public.mov_language DROP CONSTRAINT fk_mov_lang;
       public          postgres    false    225    4680    224            Q           2606    17080    mov_genre fk_movie_genre    FK CONSTRAINT     ~   ALTER TABLE ONLY public.mov_genre
    ADD CONSTRAINT fk_movie_genre FOREIGN KEY (movie_id) REFERENCES public.movie(movie_id);
 B   ALTER TABLE ONLY public.mov_genre DROP CONSTRAINT fk_movie_genre;
       public          postgres    false    4680    223    225            �   �   x����PD�ُ1.�T�1�X٬��n����{�;�33�����j����uc}��`>e��?.p뢊�Ǩ^Z��4X㤱Mn�� �%�9�Q>V3�]�z�n8�ټ2�;�:��<����3"�RH+�      �   t   x�u�;� E�zX+0����v6�IH��^&ک�{�JH�S�ڸ5>#H�M��h�tq�Bh�F�`.g
ٻ?�z��$n�k�ݲ+�o�|��
E�yF���|TL~jc�|9�      �      x�3�4�2bcN#. 6�4����� '�      �   �   x�%��
�0E�3_���K]�qS]t�fHG4��B��Pw�u���F'���(�Љ�)aw�,c�8������ӗC\���%ُ��v�f<A��3�aHq���bW��l��yھLúl�)a$ES��Kd�e��'45\(�K��$�8�      �   :   x����@�w2J�VH���� �?)�q�0T)��O�Y6�d����i�7����BP      �   3   x��� 0���T�&��̃c�� ���.��������h3���V�      �      x�3�4�2bc 6bSN�=... '�      �   �  x����n�6�+O�m ��d�E�ܓ�����v-�-�)P��}�$}���6�ma p,k��9�2�R+2#v��kQP��:�(���|��y1�O��P>��c+�B,�1ꄧ���,��b�̞�ΰS�����|�7��S���>���KԏO^3xQ��xi�0�Ki#*+�T+F�VL/��#v��RI�e����|b���dŤb����쳴��Q^��`t�璪]��}���b��*!VhCn0mR�<�����P�����J���R����_�\�d��]2k�j�n7M�e�.x����6���q؋��vA�I��)���ƃNg�.�b��4����.t�h��o�;]e���\����-;׺$�B�A].7Ba�3�]�
q�D���E6�TU��Jb����;BŶlJJ�qD��i��-F���\�\�NpCE�hc��JH�b�-_���9���E0��7e�����i�M��7?=&�����'&�X�L+,��Rݖi��(
�Ei�,dd" A}帚�<�d�N4
{�^�������{�f�}G�e�}�#?��|����ˎ���,����ʚz�ʩr� C#�Q��BTϡ��`Q1T9����(*V��q���<��+Ҿ�3~�o�%��L��T9�[Lu�r�-��HW�`C²�х�XoG�u����xx�+��N8�qw�����hE�a�o3QԔ�{��D��)�K��{��a�iZ�I$�=�B9���� m�Y~{��>Oo���n�A�A6���� ڃ���a��|�!b>㛊���Fz4��d�;�|yvru.z<�c[�j���5/֛�I�L�ϋeI�P�=�T�5���^�\��pO�h�{.l�T�K1�8�Br��!0���W���F�$c�����$�
8^���������vr�A��Bx�ND�w�Kݻ�Jz�n<��Q��~���`��&wܭ����90&ҙ:;Ӌ��ya��%h�~��׉r���i$��I'��p���I���A$r�ZOe�-g����o^{��������ιC��;���[�m��+�����z�6��m�`��V�X��7C��� o��O�HKht�]
i(u�H�)TD��o�^T�K�*)�"g��@I�s���h�i������ig�Y�ȷ��C�{c����~����i�����|!����N1Q@d�֚}��:ɤ��.T�T���'u�pu&V�ux�(��Q}���ڰ��������{��Z��(1�?}��z���)���S�;%���O7Q��\ڪ^<?]ݏ���/�<��mj��؝��G��襮�.�
�L�й�����#�U����F�Zo��U#����аd\�3<Uč��������1�MF�f�[��J�UId�"��  n{���a�;�;]�(�`��;ßnk\��5�Pȵl9�=Tn�
o]U�������}�-���O~&b�����hΏ���%<��      �   Y   x�3400����+�PHL�NLO�41 NC.C#���Ģ�Ԣ�J���X�$o�i����i5��p*T�&ALe����� �<�     