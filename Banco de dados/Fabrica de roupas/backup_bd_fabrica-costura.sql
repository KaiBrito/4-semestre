PGDMP                          {            fabrica_costura    14.5    14.5 2    @           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            A           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            B           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            C           1262    58092    fabrica_costura    DATABASE     o   CREATE DATABASE fabrica_costura WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE fabrica_costura;
                postgres    false            �            1259    58113 
   costureira    TABLE     �   CREATE TABLE public.costureira (
    matricula integer NOT NULL,
    aliquota_fixa numeric(10,2),
    salario numeric(10,2),
    valor_minimo numeric(10,2),
    costureira_supervisora integer
);
    DROP TABLE public.costureira;
       public         heap    postgres    false            �            1259    58135    fornecedores_maquina    TABLE     }   CREATE TABLE public.fornecedores_maquina (
    id_maquina integer NOT NULL,
    fornecedor character varying(60) NOT NULL
);
 (   DROP TABLE public.fornecedores_maquina;
       public         heap    postgres    false            �            1259    58093    funcionario    TABLE     �   CREATE TABLE public.funcionario (
    matricula integer NOT NULL,
    nome character varying(255) NOT NULL,
    endereco character varying(255) DEFAULT 'não informado'::character varying NOT NULL
);
    DROP TABLE public.funcionario;
       public         heap    postgres    false            �            1259    58162    habilitacao    TABLE     j   CREATE TABLE public.habilitacao (
    matricula integer NOT NULL,
    id_tipo_costura integer NOT NULL
);
    DROP TABLE public.habilitacao;
       public         heap    postgres    false            �            1259    58145 
   manutencao    TABLE     �   CREATE TABLE public.manutencao (
    id_manutencao integer NOT NULL,
    dt_inicio date,
    dt_fim date,
    id_maquina integer,
    id_monitora integer
);
    DROP TABLE public.manutencao;
       public         heap    postgres    false            �            1259    58128    maquina    TABLE     �   CREATE TABLE public.maquina (
    id_maquina integer NOT NULL,
    fabricante character varying(255),
    situacao character varying(255)
);
    DROP TABLE public.maquina;
       public         heap    postgres    false            �            1259    58167    maquina_tipo_costura    TABLE     t   CREATE TABLE public.maquina_tipo_costura (
    id_maquina integer NOT NULL,
    id_tipo_costura integer NOT NULL
);
 (   DROP TABLE public.maquina_tipo_costura;
       public         heap    postgres    false            �            1259    58101    meio    TABLE     �  CREATE TABLE public.meio (
    matricula integer NOT NULL,
    setor character varying(255),
    salario_fixo numeric(10,2),
    gratificacao numeric(10,2),
    CONSTRAINT meio_gratificacao_check CHECK (((gratificacao >= (0)::numeric) AND (gratificacao <= (5000)::numeric))),
    CONSTRAINT meio_setor_check CHECK (((setor)::text = ANY ((ARRAY['ADM'::character varying, 'TI'::character varying, 'FINANCEIRO'::character varying, 'RH'::character varying, 'INFRA'::character varying])::text[])))
);
    DROP TABLE public.meio;
       public         heap    postgres    false            �            1259    58150    peca    TABLE     �   CREATE TABLE public.peca (
    id_peca integer NOT NULL,
    modelo character varying(255),
    preco_venda numeric(10,2),
    descricao_modelo character varying(255)
);
    DROP TABLE public.peca;
       public         heap    postgres    false            �            1259    58218    producao    TABLE     �   CREATE TABLE public.producao (
    id_producao integer NOT NULL,
    matricula integer,
    id_maquina integer,
    id_peca integer,
    dt_ini date,
    dt_fim date,
    hr_ini time without time zone,
    hr_fim time without time zone
);
    DROP TABLE public.producao;
       public         heap    postgres    false            �            1259    58217    producao_id_producao_seq    SEQUENCE     �   CREATE SEQUENCE public.producao_id_producao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.producao_id_producao_seq;
       public          postgres    false    220            D           0    0    producao_id_producao_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.producao_id_producao_seq OWNED BY public.producao.id_producao;
          public          postgres    false    219            �            1259    58123    tipo_costura    TABLE     q   CREATE TABLE public.tipo_costura (
    id_tipo_costura integer NOT NULL,
    descricao character varying(255)
);
     DROP TABLE public.tipo_costura;
       public         heap    postgres    false            �           2604    58221    producao id_producao    DEFAULT     |   ALTER TABLE ONLY public.producao ALTER COLUMN id_producao SET DEFAULT nextval('public.producao_id_producao_seq'::regclass);
 C   ALTER TABLE public.producao ALTER COLUMN id_producao DROP DEFAULT;
       public          postgres    false    220    219    220            4          0    58113 
   costureira 
   TABLE DATA                 public          postgres    false    211   �9       7          0    58135    fornecedores_maquina 
   TABLE DATA                 public          postgres    false    214   r:       2          0    58093    funcionario 
   TABLE DATA                 public          postgres    false    209   ;       :          0    58162    habilitacao 
   TABLE DATA                 public          postgres    false    217   G<       8          0    58145 
   manutencao 
   TABLE DATA                 public          postgres    false    215   �<       6          0    58128    maquina 
   TABLE DATA                 public          postgres    false    213   �<       ;          0    58167    maquina_tipo_costura 
   TABLE DATA                 public          postgres    false    218   ^=       3          0    58101    meio 
   TABLE DATA                 public          postgres    false    210   �=       9          0    58150    peca 
   TABLE DATA                 public          postgres    false    216   �>       =          0    58218    producao 
   TABLE DATA                 public          postgres    false    220   �?       5          0    58123    tipo_costura 
   TABLE DATA                 public          postgres    false    212   �B       E           0    0    producao_id_producao_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.producao_id_producao_seq', 100, true);
          public          postgres    false    219            �           2606    58117    costureira costureira_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.costureira
    ADD CONSTRAINT costureira_pkey PRIMARY KEY (matricula);
 D   ALTER TABLE ONLY public.costureira DROP CONSTRAINT costureira_pkey;
       public            postgres    false    211            �           2606    58139 .   fornecedores_maquina fornecedores_maquina_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.fornecedores_maquina
    ADD CONSTRAINT fornecedores_maquina_pkey PRIMARY KEY (id_maquina, fornecedor);
 X   ALTER TABLE ONLY public.fornecedores_maquina DROP CONSTRAINT fornecedores_maquina_pkey;
       public            postgres    false    214    214            �           2606    58100    funcionario funcionario_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (matricula);
 F   ALTER TABLE ONLY public.funcionario DROP CONSTRAINT funcionario_pkey;
       public            postgres    false    209            �           2606    58166    habilitacao habilitacao_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.habilitacao
    ADD CONSTRAINT habilitacao_pkey PRIMARY KEY (matricula, id_tipo_costura);
 F   ALTER TABLE ONLY public.habilitacao DROP CONSTRAINT habilitacao_pkey;
       public            postgres    false    217    217            �           2606    58149    manutencao manutencao_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.manutencao
    ADD CONSTRAINT manutencao_pkey PRIMARY KEY (id_manutencao);
 D   ALTER TABLE ONLY public.manutencao DROP CONSTRAINT manutencao_pkey;
       public            postgres    false    215            �           2606    58134    maquina maquina_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.maquina
    ADD CONSTRAINT maquina_pkey PRIMARY KEY (id_maquina);
 >   ALTER TABLE ONLY public.maquina DROP CONSTRAINT maquina_pkey;
       public            postgres    false    213            �           2606    58171 .   maquina_tipo_costura maquina_tipo_costura_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.maquina_tipo_costura
    ADD CONSTRAINT maquina_tipo_costura_pkey PRIMARY KEY (id_maquina, id_tipo_costura);
 X   ALTER TABLE ONLY public.maquina_tipo_costura DROP CONSTRAINT maquina_tipo_costura_pkey;
       public            postgres    false    218    218            �           2606    58107    meio meio_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.meio
    ADD CONSTRAINT meio_pkey PRIMARY KEY (matricula);
 8   ALTER TABLE ONLY public.meio DROP CONSTRAINT meio_pkey;
       public            postgres    false    210            �           2606    58156    peca peca_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.peca
    ADD CONSTRAINT peca_pkey PRIMARY KEY (id_peca);
 8   ALTER TABLE ONLY public.peca DROP CONSTRAINT peca_pkey;
       public            postgres    false    216            �           2606    58223    producao producao_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.producao
    ADD CONSTRAINT producao_pkey PRIMARY KEY (id_producao);
 @   ALTER TABLE ONLY public.producao DROP CONSTRAINT producao_pkey;
       public            postgres    false    220            �           2606    58127    tipo_costura tipo_costura_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.tipo_costura
    ADD CONSTRAINT tipo_costura_pkey PRIMARY KEY (id_tipo_costura);
 H   ALTER TABLE ONLY public.tipo_costura DROP CONSTRAINT tipo_costura_pkey;
       public            postgres    false    212            �           2606    58118 $   costureira costureira_matricula_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.costureira
    ADD CONSTRAINT costureira_matricula_fkey FOREIGN KEY (matricula) REFERENCES public.funcionario(matricula);
 N   ALTER TABLE ONLY public.costureira DROP CONSTRAINT costureira_matricula_fkey;
       public          postgres    false    209    3209    211            �           2606    58197    habilitacao fk_hab1    FK CONSTRAINT     �   ALTER TABLE ONLY public.habilitacao
    ADD CONSTRAINT fk_hab1 FOREIGN KEY (matricula) REFERENCES public.costureira(matricula);
 =   ALTER TABLE ONLY public.habilitacao DROP CONSTRAINT fk_hab1;
       public          postgres    false    3213    217    211            �           2606    58202    habilitacao fk_hab2    FK CONSTRAINT     �   ALTER TABLE ONLY public.habilitacao
    ADD CONSTRAINT fk_hab2 FOREIGN KEY (id_tipo_costura) REFERENCES public.tipo_costura(id_tipo_costura);
 =   ALTER TABLE ONLY public.habilitacao DROP CONSTRAINT fk_hab2;
       public          postgres    false    3215    212    217            �           2606    58177     manutencao fk_manutencao_maquina    FK CONSTRAINT     �   ALTER TABLE ONLY public.manutencao
    ADD CONSTRAINT fk_manutencao_maquina FOREIGN KEY (id_maquina) REFERENCES public.maquina(id_maquina);
 J   ALTER TABLE ONLY public.manutencao DROP CONSTRAINT fk_manutencao_maquina;
       public          postgres    false    3217    213    215            �           2606    58172 $   manutencao fk_manutencao_supervisora    FK CONSTRAINT     �   ALTER TABLE ONLY public.manutencao
    ADD CONSTRAINT fk_manutencao_supervisora FOREIGN KEY (id_monitora) REFERENCES public.costureira(matricula);
 N   ALTER TABLE ONLY public.manutencao DROP CONSTRAINT fk_manutencao_supervisora;
       public          postgres    false    3213    211    215            �           2606    58207 !   maquina_tipo_costura fk_maq_cost1    FK CONSTRAINT     �   ALTER TABLE ONLY public.maquina_tipo_costura
    ADD CONSTRAINT fk_maq_cost1 FOREIGN KEY (id_maquina) REFERENCES public.maquina(id_maquina);
 K   ALTER TABLE ONLY public.maquina_tipo_costura DROP CONSTRAINT fk_maq_cost1;
       public          postgres    false    213    3217    218            �           2606    58212 !   maquina_tipo_costura fk_maq_cost2    FK CONSTRAINT     �   ALTER TABLE ONLY public.maquina_tipo_costura
    ADD CONSTRAINT fk_maq_cost2 FOREIGN KEY (id_tipo_costura) REFERENCES public.tipo_costura(id_tipo_costura);
 K   ALTER TABLE ONLY public.maquina_tipo_costura DROP CONSTRAINT fk_maq_cost2;
       public          postgres    false    3215    218    212            �           2606    58140 9   fornecedores_maquina fornecedores_maquina_id_maquina_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.fornecedores_maquina
    ADD CONSTRAINT fornecedores_maquina_id_maquina_fkey FOREIGN KEY (id_maquina) REFERENCES public.maquina(id_maquina);
 c   ALTER TABLE ONLY public.fornecedores_maquina DROP CONSTRAINT fornecedores_maquina_id_maquina_fkey;
       public          postgres    false    214    213    3217            �           2606    58108    meio meio_matricula_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.meio
    ADD CONSTRAINT meio_matricula_fkey FOREIGN KEY (matricula) REFERENCES public.funcionario(matricula);
 B   ALTER TABLE ONLY public.meio DROP CONSTRAINT meio_matricula_fkey;
       public          postgres    false    3209    210    209            4   {   x^��v
Q���W((M��L�K�/.)-J�,JTs�	uV�0�Q0�34�Q����Q0250�30�Q0״��$�s�	�p�&�m��#�	F$�`	6�n�1�&�4�n�	�\\ $�YR      7   �   x^��v
Q���W((M��L�K�/�KMNM�/J-��M,,��KTs�	uV�0�QP�u44P״��$Q�%��)�lB�fS�� WO�`�Í���~�����hP��0��F(��*8����g�9�8��x� �&rq �Ҕ(      2   (  x^���N�@��}��U��P�T05
�V�#ݒ1�Y�|F_�/�@bL���������|�* ��5O�ֽ�1kb��㻇iga ��� �[��j2�Ϫ�!���W^�?�@�ܽ2�hj��&^;/����V�=1c�H
1S�eHx_���G̹�W\Z�4괷�R��!S�K<n{RI�;Ԏڑ ��IҜ)�4rQ�)m���**�q�3�8�9����>� �Y�9Fk�*Y�Ye^T ��Ё���*7l�7��wGˆ�|�L��\����C      :   U   x^��v
Q���W((M��L��HL���,ILN�Ws�	uV�0�Q0Դ��$N�����-t��Wm��`B�jCS�r.. c(E.      8   
   x^��          6   �   x^��v
Q���W((M��L��M,,��KTs�	uV�0�QP��swR�K2��5��<	�4�w�q��#U�1P������+�:M�:���C<Hw�)��4C�gJj18�R�%sT'�&敖��^~xq>(��� �{�      ;   |   x^��9
�0E�>���B�+��(8��Κ��]�o��WUm�t�����N���U��lz|̱��~?��4�e_����|7�'$ %� �$E �1�`K�!K�!K�!KR����ic��	��T�      3   �   x^��M
�0��}N1�*�!�O��*h��B�z �EAэ�w6w� ���QR�����s}�7|��\�iJl��x8W5h)%JY�m���	�cۑ����1�T3�(ǼOTzN�%al�nM�p����:�Q+�-S�]������Z�B|u%M�      9   0  x^��=N1���b��E!?4T�RDBA"�~�Y�읕(��'@��9�ބ�0ބ��t���}o�,������=4�rVRO�w���]���F�а�� ���ht��A�M��l#p������b�����7�|]�Eذ1�wy�u��A���B����MƘm��r�{LVq	�Pch�\攭S�	�u�c�k�ġ��EOH;��7|��>�$��W;-����%���J�������tJ����(��lU<��ٱi%�YչΎ�\\��3�ۏ��^����K      =   �  x^��=k1E���ن�}K�J�ba�@l���&`�	������罁H���m�#݇�������t�my}{|��t�������ϗ�������r��K�/��s�W��z������p<�������`��^�=�f���[G
���ap��$�[c���e��0�Pp�-�+W��0�Qp�-����n�H�i�L�sB����T>��������>'��i�L�sB�����?'��i�LtB�����@'�i�LtB�����A'�i�쩃^8��8�S�<��)S<��,{jj?{8HȲO�v����,������ !˽1��p����[A`	Y�us+	Y�Hs+	Y�S+� !��s0�A|�j<�3h���,zp���J�
Sh����0�8H�
sh����0�l9BV�D���0�8H�
�h���d�Y4R5f�HԘE#uPc��A�Y4R5f�HԘE#uPc��A�Y4R5f�DԘE�Y&�Lf=��z0��`2��dփɬ�Yf��f=��z0��`6��lփ٬�Yf��f=X�z��A�6��;�	Y�N��ABV��)���p'S� !+��8xNָ�)p���d
$d�;�,!+��T8H�
w2���j�`5s��9X��fV3������f�`3s��9��lf63������f�`3sЭS�v�L��      5   v   x^��v
Q���W((M��L�+�,ȏO�/.)-JTs�	uV�0�QP/��+�W(J-�W״��$R�PgUf�nUbzi*)����R�r�I�gwjrbqjb)zMzS����� d�\{     