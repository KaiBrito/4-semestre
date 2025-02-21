PGDMP              
        	    {            universidade_p1    14.5    14.5 (    ,           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            -           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            .           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            /           1262    41006    universidade_p1    DATABASE     o   CREATE DATABASE universidade_p1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE universidade_p1;
                postgres    false            �            1259    41010    aluno    TABLE       CREATE TABLE public.aluno (
    rga integer NOT NULL,
    academico character varying(60) NOT NULL,
    dtnasc date,
    telefone character varying(15),
    ano_ingresso integer NOT NULL,
    semestre_curso integer DEFAULT 1 NOT NULL,
    curso_aluno integer
);
    DROP TABLE public.aluno;
       public         heap    postgres    false            �            1259    41014    curso    TABLE     �   CREATE TABLE public.curso (
    cod_curso integer NOT NULL,
    nome_curso character varying(40) NOT NULL,
    email_curso character varying(40),
    totalhoras integer NOT NULL,
    coordenador integer NOT NULL,
    campus integer NOT NULL
);
    DROP TABLE public.curso;
       public         heap    postgres    false            �            1259    41017 
   disciplina    TABLE     �   CREATE TABLE public.disciplina (
    cod_disc integer NOT NULL,
    nome_disciplina character varying(80) NOT NULL,
    ch integer NOT NULL,
    tipo character varying(3),
    curso integer
);
    DROP TABLE public.disciplina;
       public         heap    postgres    false            �            1259    41020 	   faculdade    TABLE     �   CREATE TABLE public.faculdade (
    cod_uni integer NOT NULL,
    nome character varying(60) NOT NULL,
    sigla character varying(5) NOT NULL,
    telefone character varying(15)
);
    DROP TABLE public.faculdade;
       public         heap    postgres    false            �            1259    41023 	   historico    TABLE     �   CREATE TABLE public.historico (
    cod_aluno integer NOT NULL,
    cod_turma integer NOT NULL,
    media_aproveitamento numeric(10,1),
    total_faltas integer,
    resultado character varying(6)
);
    DROP TABLE public.historico;
       public         heap    postgres    false            �            1259    41026    prerequisito    TABLE     k   CREATE TABLE public.prerequisito (
    cod_disciplina integer NOT NULL,
    cod_prereq integer NOT NULL
);
     DROP TABLE public.prerequisito;
       public         heap    postgres    false            �            1259    41029 	   professor    TABLE     �  CREATE TABLE public.professor (
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
    DROP TABLE public.professor;
       public         heap    postgres    false            �            1259    41033    turma    TABLE     �   CREATE TABLE public.turma (
    cod_turma integer NOT NULL,
    id integer DEFAULT 1 NOT NULL,
    ano integer NOT NULL,
    semestre integer DEFAULT 1 NOT NULL,
    disc integer NOT NULL,
    prof integer
);
    DROP TABLE public.turma;
       public         heap    postgres    false            "          0    41010    aluno 
   TABLE DATA           l   COPY public.aluno (rga, academico, dtnasc, telefone, ano_ingresso, semestre_curso, curso_aluno) FROM stdin;
    public          postgres    false    209   �2       #          0    41014    curso 
   TABLE DATA           d   COPY public.curso (cod_curso, nome_curso, email_curso, totalhoras, coordenador, campus) FROM stdin;
    public          postgres    false    210   �4       $          0    41017 
   disciplina 
   TABLE DATA           P   COPY public.disciplina (cod_disc, nome_disciplina, ch, tipo, curso) FROM stdin;
    public          postgres    false    211   :5       %          0    41020 	   faculdade 
   TABLE DATA           C   COPY public.faculdade (cod_uni, nome, sigla, telefone) FROM stdin;
    public          postgres    false    212   �7       &          0    41023 	   historico 
   TABLE DATA           h   COPY public.historico (cod_aluno, cod_turma, media_aproveitamento, total_faltas, resultado) FROM stdin;
    public          postgres    false    213   8       '          0    41026    prerequisito 
   TABLE DATA           B   COPY public.prerequisito (cod_disciplina, cod_prereq) FROM stdin;
    public          postgres    false    214   L9       (          0    41029 	   professor 
   TABLE DATA           |   COPY public.professor (cod_prof, nome_prof, email, titulacao, situacao, dedicacao, tipo, alocacao, coordenador) FROM stdin;
    public          postgres    false    215   �9       )          0    41033    turma 
   TABLE DATA           I   COPY public.turma (cod_turma, id, ano, semestre, disc, prof) FROM stdin;
    public          postgres    false    216   �:       |           2606    41039    aluno aluno_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT aluno_pkey PRIMARY KEY (rga);
 :   ALTER TABLE ONLY public.aluno DROP CONSTRAINT aluno_pkey;
       public            postgres    false    209            ~           2606    41041    curso curso_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_pkey PRIMARY KEY (cod_curso);
 :   ALTER TABLE ONLY public.curso DROP CONSTRAINT curso_pkey;
       public            postgres    false    210            �           2606    41043    disciplina disciplina_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.disciplina
    ADD CONSTRAINT disciplina_pkey PRIMARY KEY (cod_disc);
 D   ALTER TABLE ONLY public.disciplina DROP CONSTRAINT disciplina_pkey;
       public            postgres    false    211            �           2606    41045    faculdade faculdade_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.faculdade
    ADD CONSTRAINT faculdade_pkey PRIMARY KEY (cod_uni);
 B   ALTER TABLE ONLY public.faculdade DROP CONSTRAINT faculdade_pkey;
       public            postgres    false    212            �           2606    41047    historico historico_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.historico
    ADD CONSTRAINT historico_pkey PRIMARY KEY (cod_aluno, cod_turma);
 B   ALTER TABLE ONLY public.historico DROP CONSTRAINT historico_pkey;
       public            postgres    false    213    213            �           2606    41049    prerequisito prerequisito_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.prerequisito
    ADD CONSTRAINT prerequisito_pkey PRIMARY KEY (cod_disciplina, cod_prereq);
 H   ALTER TABLE ONLY public.prerequisito DROP CONSTRAINT prerequisito_pkey;
       public            postgres    false    214    214            �           2606    41051    professor professor_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.professor
    ADD CONSTRAINT professor_pkey PRIMARY KEY (cod_prof);
 B   ALTER TABLE ONLY public.professor DROP CONSTRAINT professor_pkey;
       public            postgres    false    215            �           2606    41053    turma turma_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.turma
    ADD CONSTRAINT turma_pkey PRIMARY KEY (cod_turma);
 :   ALTER TABLE ONLY public.turma DROP CONSTRAINT turma_pkey;
       public            postgres    false    216            �           2606    41055    aluno aluno_curso_aluno_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT aluno_curso_aluno_fkey FOREIGN KEY (curso_aluno) REFERENCES public.curso(cod_curso);
 F   ALTER TABLE ONLY public.aluno DROP CONSTRAINT aluno_curso_aluno_fkey;
       public          postgres    false    210    3198    209            �           2606    41060    curso curso_campus_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_campus_fkey FOREIGN KEY (campus) REFERENCES public.faculdade(cod_uni);
 A   ALTER TABLE ONLY public.curso DROP CONSTRAINT curso_campus_fkey;
       public          postgres    false    212    210    3202            �           2606    41065    curso curso_coordenador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_coordenador_fkey FOREIGN KEY (coordenador) REFERENCES public.professor(cod_prof);
 F   ALTER TABLE ONLY public.curso DROP CONSTRAINT curso_coordenador_fkey;
       public          postgres    false    3208    215    210            �           2606    41070     disciplina disciplina_curso_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.disciplina
    ADD CONSTRAINT disciplina_curso_fkey FOREIGN KEY (curso) REFERENCES public.curso(cod_curso);
 J   ALTER TABLE ONLY public.disciplina DROP CONSTRAINT disciplina_curso_fkey;
       public          postgres    false    3198    210    211            �           2606    41075 "   historico historico_cod_aluno_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.historico
    ADD CONSTRAINT historico_cod_aluno_fkey FOREIGN KEY (cod_aluno) REFERENCES public.aluno(rga);
 L   ALTER TABLE ONLY public.historico DROP CONSTRAINT historico_cod_aluno_fkey;
       public          postgres    false    213    209    3196            �           2606    41080 "   historico historico_cod_turma_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.historico
    ADD CONSTRAINT historico_cod_turma_fkey FOREIGN KEY (cod_turma) REFERENCES public.turma(cod_turma);
 L   ALTER TABLE ONLY public.historico DROP CONSTRAINT historico_cod_turma_fkey;
       public          postgres    false    213    3210    216            �           2606    41085 -   prerequisito prerequisito_cod_disciplina_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.prerequisito
    ADD CONSTRAINT prerequisito_cod_disciplina_fkey FOREIGN KEY (cod_disciplina) REFERENCES public.disciplina(cod_disc);
 W   ALTER TABLE ONLY public.prerequisito DROP CONSTRAINT prerequisito_cod_disciplina_fkey;
       public          postgres    false    214    3200    211            �           2606    41090 )   prerequisito prerequisito_cod_prereq_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.prerequisito
    ADD CONSTRAINT prerequisito_cod_prereq_fkey FOREIGN KEY (cod_prereq) REFERENCES public.disciplina(cod_disc);
 S   ALTER TABLE ONLY public.prerequisito DROP CONSTRAINT prerequisito_cod_prereq_fkey;
       public          postgres    false    214    3200    211            �           2606    41095 !   professor professor_alocacao_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.professor
    ADD CONSTRAINT professor_alocacao_fkey FOREIGN KEY (alocacao) REFERENCES public.faculdade(cod_uni);
 K   ALTER TABLE ONLY public.professor DROP CONSTRAINT professor_alocacao_fkey;
       public          postgres    false    215    3202    212            �           2606    41100 $   professor professor_coordenador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.professor
    ADD CONSTRAINT professor_coordenador_fkey FOREIGN KEY (coordenador) REFERENCES public.professor(cod_prof);
 N   ALTER TABLE ONLY public.professor DROP CONSTRAINT professor_coordenador_fkey;
       public          postgres    false    215    3208    215            �           2606    41105    turma turma_disc_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.turma
    ADD CONSTRAINT turma_disc_fkey FOREIGN KEY (disc) REFERENCES public.disciplina(cod_disc);
 ?   ALTER TABLE ONLY public.turma DROP CONSTRAINT turma_disc_fkey;
       public          postgres    false    216    3200    211            �           2606    41110    turma turma_prof_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.turma
    ADD CONSTRAINT turma_prof_fkey FOREIGN KEY (prof) REFERENCES public.professor(cod_prof);
 ?   ALTER TABLE ONLY public.turma DROP CONSTRAINT turma_prof_fkey;
       public          postgres    false    216    3208    215            "   �  x^���n�0���S�	V!		�U[�*�"՞z�Xrld'����ذ�JD\>�g~�2ϒ$�Ëq$�Zjdk�c�i2�`	e���c.e�hQ�R�q�r(,��lжF<��$�$�C�{��o�#����8Q��s�\�)�ś�3)�Q�K�#��v��d	�I]�5r�n
^�c;\�ޚ�O��|�g�p���'Z�(&�P)��b7����1�^��i��2h1Ʋk>�/#�H�Q�$|�'k-�y��H�����D� }�]p}�A.%�/5�uL�.a#�#�լ��s+������2MFd�����7*� /9ǂ��s)<��J+wrǤ���%�^��b4��ٓ��[.�j"����ОQ�E����^l����SEKx��C���,mC�%�P����Ϛd`v�e	T�ň�c/S6��.�߮^�e)<�B��M��� �x1�ߺ,�5)⧤R>p����Q��ͿK~���f_,�W1      #   6   x^371��,.I�M,VHIU��K�/�M<����|�?Nc#cN3NC�=... j.�      $   c  x^�TM��0^���@Nb'ͲL�P	Q�Hlf�&��(��� ���4+����#�3�]��~��y��0re�C�U)K���2��s�*$�XLnސ�'�$�>*ט�}kMee#�����k%�i8ʅ /;]���i\6J����H:��N��| D�������#S,!k��)��JI���l�RU�I�NP�	#�@^�Sr%뢫-�dN�K���"E8Q,���C)���B��TG9k�7vt)��Y�p'w�>Zt�:���֡�g�󜼐�0~�R���to�Ƚ�XY(�ё��4�K��6VaD�J��}L+L2�QN�����!������.�y%��Y�1���Or�����7i!����%i�<��&q>Ԫ���7.�S{����B���֪���_ޖ�=����Z�����)�D���v���<}ld
�srm���R�����op
/؜���x�Q:7V����ͳ��؂�=�r��E�ѽI3�c�
j��oCW*w�?��X�T$��(݉�,.���wr�����&��L���P�j�����Hmx�F���K(T{���4^��3���P�k��#A^˝���Z�C�i˃�����%�       %   a   x^3�tN�-(-V):��X�'1=?���9 ć3Əˈ�-1�4'%1%U���JK/?�8��������fPE@~^I"�,:�hH@ H>F��� :&!�      &     x^m�K� D��a�hUu����3�I�XJ6/6y�j��G	!���{��`��Z0[�X�Zp�`��I���<��O��J'�-X,X-�[04<�v���N��L��LT��]���Jt�����D�:D/�HUr[�,e�,;�LU������2�f�a�R5�Q�h��j��h��ڏOS��>(�.�'�[�砌���̞��9�%�9DZ��Jzb��D���\b�(|P��hZ��hE�i6e�h��)�\MY9lMHQ�0R\���&��n��m����      '   �   x^5��1�G1@`�^����AH����
�������ڜ	'U��{���8�ڑ��"-'�C�L۫ơH�@�xcݼH���Q�&�5H��}���~�}������8��]�!����|?"��'*�      (   �   x^}�K
�0��3�[k�e�TT�ҕ�h�FBy�8�x/fTK�0���_�AI�l���ZB>�t^h/ �L`r2Z40~ڛ�L��L�h�z�2�)޴���"ĭܷB}��7��������0g��P��%�!̂pJ\k\�=�:l��>��pT	�����k�F�2*��Y��&���<��6]��">lTp�      )   j  x^m�Q�� D��0[
��K�	���FR�|��
����[�Z��a��p���`�S+7���U�pc�cc�G�+l�W���ρ�x����}/��K̳5�m�������n�s�K5_��;�Ns�������X���P�F!?��²��
-ˀ�+�e-��r�����p�]`#�'��^���E�t0�t0��>-=6rb�B��8D���>��9����-'v��,'�)��0��D��*�)�:]/��X��wHr�8O����`��G]���E��K8޹KN���{��%��%��%���1�7w�"��\k?�c���#[mm��gx�ʲ��O�a6֌��7��{��ր��Z�C*��     