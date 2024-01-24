PGDMP                       |            vietflix    16.1    16.1 7    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
    public          postgres    false    219   >>       �          0    17000    genre 
   TABLE DATA           5   COPY public.genre (genre_id, genre_name) FROM stdin;
    public          postgres    false    220   n>       �          0    17006    history 
   TABLE DATA           B   COPY public.history (member_id, movie_id, pause_time) FROM stdin;
    public          postgres    false    222   ?       �          0    17009 	   mov_genre 
   TABLE DATA           7   COPY public.mov_genre (movie_id, genre_id) FROM stdin;
    public          postgres    false    223   i?       �          0    17012    mov_language 
   TABLE DATA           =   COPY public.mov_language (movie_id, language_id) FROM stdin;
    public          postgres    false    224   �?       �          0    17015    movie 
   TABLE DATA           �   COPY public.movie (movie_id, movie_name, movie_length, movie_source, movie_des, movie_thumb, movie_actor, movie_year, movie_point, trailer_source, movie_director) FROM stdin;
    public          postgres    false    225   �?       �          0    17021    package 
   TABLE DATA           P   COPY public.package (package_id, package_name, price, package_time) FROM stdin;
    public          postgres    false    227   `G       �           0    0    Language_language_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Language_language_id_seq"', 1, false);
          public          postgres    false    216            �           0    0    Member_member_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Member_member_id_seq"', 4, true);
          public          postgres    false    218            �           0    0    genre_genre_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.genre_genre_id_seq', 1, true);
          public          postgres    false    221            �           0    0    movie_movie_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.movie_movie_id_seq', 16, true);
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
       public          postgres    false    4680    223    225            �   �   x����PD�ُ1.�T�1�X٬��n����{�;�33�����j����uc}��`>e��?.p뢊�Ǩ^Z��4X㤱Mn�� �%�9�Q>V3�]�z�n8�ټ2�;�:��<����3"�RH+�      �   �   x�u�M
�0FדS�)3��bV"�{7�5`(f���Њ��{|o��c��4���ý�Rbml���R�B���F�Vt�����Fh�Cl����W�Ay�(xWX��RX���eS���mX�9�f�k�Rfs)���*k����#�P�A�q�N��Z	!��G      �       x�3�4�2bcN#. 6�4�b���� 4�x      �   �   x�%��
�0E�3_���K]�qS]t�fHG4��B��Pw�u���F'���(�Љ�)aw�,c�8������ӗC\���%ُ��v�f<A��3�aHq���bW��l��yھLúl�)a$ES��Kd�e��'45\(�K��$�8�      �   A   x�̱�0�Y:��etD/��w4�ȅB"�9VQ"��z�.�=,�Ÿ��9��^�������x      �   =   x��� 0Bѳ�-N���(z����F�i�]v��{w
r�I�����aǦ'�; >8
&      �   $   x�3�4�2bc 6bSN.CS ��H��qqq N Z      �   f  x��W�n�8��<��.`K�'���"m�4�If�Y,`�ҵŚ"5$E}����1/���N��N��m����=�{�''d6��)/dM�h��<O��E����)e�>X'7�n��h���)&�Mx>�����bK!�n4e�js���1}Z7���:��"Q��ɠ�F<^ص����Ҭ�Q�����_qck�V�P^(#\��O�G�8]�nؒ�Z� �K����'�BzO�J��� Q[Gl̺�ݳؽ;㾒��?	Ye��s+�%o��o�Jc�<ǭ4CYI;������;�]fǹQ�.'�Q_���Mrn�8�H���֮�qn;C��r�@\Y_�Sg�2��^�Yې`�C$^=H�;ޑ4����B:M!`7.Ὅ{�k�����^ܒ1l�l��m�r n����z-�}:�վ�.Tq.�T8�)'1$o�#��4""�5Of��s ��K{ۆvE�/�E�����7���.���"91���p��L����L6X����*$@!�m�IwV��\2/��bz��)�JS�x�H�;�zq@@��k70�z��I��B��P�ӡ����FD� ��m#:��k��vO��a�Kߤ���:=�� �e��mK�����Ha��9�1���5����br�G�,�0z�ː}�).I�����bM��3Sg����?/���u�<9[��z6?��h��z6ZF��ɺ%-�Sqg#��$��r���5I�����\
��0����$:�ӗ���Ǜ���M�I��B
�����i��B���2����D���|�s�U �� �
F���(��:��@T0��FACgY�xنх�U��`smY�����'���֑,*a���l`M��5=_:�9�Sm*h+e8����ZF�-d��'W�"��-*�����E�dz4�����eJg��I1�l2M��t|���u��#�_�/?�>��D�#�bjn����3cn˶8��U���1�hE�$��P�����|,�ٲ%'��96ҕ��{Y�5`�Uu�T���ȇW��͞):Բ����1�[@����lu!)
F{�@"��!��چ�I���<A��F*G%+t�t�FX��j\W�®<�)��Jj��* ����x��6Ak؄�����SbW!u�|[�~OC�����G����ѐ�2
�^I���:&k���֊�j��bY� �ɋ�O7�M[�}*7�E:��(սu�`��h['�Ŏ'_-&������ ���ܕ�����qvm[�#J�iZ ��.�T����`�>B�;�4�de��h{�+�<���X����j��`�h�@���}V�>h��FD
܄7�D1�A�����q>�}:���������[�Q��*�j��|����F�7��-�p*HF�(������Ǧr����Fn-.q��l�:ȧ�{h?���ڀ��5��B |1�.F�������#�<c��u�[��5�F�	Yr��K���@,	V�W��Y���8�bS	b-�������}�-[STč�}�������>��D�v�g���PEZ>��+�F[Y�`��H��d<jx�=��8;�e|��2�x�%b�d[K��l,W����`���4� ���5k|O�~P{����pS0'���̸��}���ɤ/�Z�9�횑+i�_�!W���h�(q�W������t@�f�u �U�F.Ba�j�u����	�ψ�� n����#bDEe����_�6�a����Z	���]�w|��pRb��u��ʃR����;�2V펒�)�$ff�����{�h}�D����Q�5
�f���|�"�o��Y�g����b�31��x�<{2���%b�B�2�������ťM�/�9�Wzpp�_�,;�      �   N   x�3400�4T�LM,�41 Nc3S.CC��o~^ID��� $j�i��-�44�[�ō9�`�FqC�=... $?�     