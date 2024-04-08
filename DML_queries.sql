USE loja;

INSERT INTO cliente (nome, cpf, email, telefone, data_cadastro, ultimo_login, id_endereco)
VALUES 
('Raquel Jesus','352.408.796-56', 'araujomariana@example.net','11 1666 6664', '2023-01-02', '2024-03-31', 1), 
('Evelyn Caldeira','541.730.986-93','isabel15@example.com','0500-557-3583','2023-01-03', '2024-03-31',2), 
('Alessandra Novaes','968.415.302-33','lauramonteiro@example.net','31 6306-4522','2023-01-04', '2024-03-31',3), 
('Samuel da Paz','908.324.576-47','crocha@example.com','(031) 3757-7794','2023-01-05','2024-03-31',4);

INSERT INTO endereco (cep, rua, bairro, cidade, uf)
VALUES ('22714910','Estrada Rezende, 87','Dom Silverio', 'Rocha','GO'),
('59523432','Rua Moraes, 2','Vila Da Paz', 'Ribeiro','AC'),
('81325-979','Colônia de Moreira, 76','Varzea Da Palma','Luz','MG'),
('58907-735','Trecho Araújo, 3','Nossa Senhora Aparecida','Monteiro','PA');

ALTER TABLE cliente
ADD COLUMN id_endereco INT;

ALTER TABLE cliente
MODIFY COLUMN cpf VARCHAR(15);

INSERT INTO administrador (nome, email, senha,cargo, data_cadastro, ultimo_acesso)
VALUES ('RegiMaria', 'regimaria015@gmail.com', '12345', 'gerente', '2023-01-01', '2024-04-01');

INSERT INTO autenticacao (email,senha, id_administrador)
VALUES ('regimaria015@gmail.com', '12345', 1);

INSERT INTO categoria (nome, descricao)
VALUES 
('Blusas', 'Blusas femininas'),
('Pijamas', 'Roupas de dormir');

INSERT INTO subcategoria (nome, descricao)
VALUES 
('Camiseta básica', 'Camisetas de algodão, perfeitas para dias quentes ou looks casuais.'),
('Blusa regata', 'Blusas sem mangas, ideais para looks de verão ou atividades esportivas.'),
('Blusa de alça fina', 'Blusas confortáveis, casuais,perfeitas para dias quentes.'),
('Blusa manga curta', 'Blusas confortáveis, perfeitas para looks casuais.'),
('Blusa manga longa', 'Blusas femininas com mangas longas, ideais para dias mais frescos ou ocasiões formais.'),
('Blusa ombro a ombro', 'Blusas ideiais para looks de verão.'),
('Blusa ciganinha', 'Perfeita para os dias mais quentes, proporcionando frescor e elegância.'),
('Blusa cropped','A blusa cropped é um modelo mais curto que uma camiseta ou regata tradicionais, ou seja, “cortadas".'),
('Blusa peplum','Blusa elegante com modelagem acinturada e anatômica.'),
('Blusa de gola alta','Um toque de sofisticação. Pode ser usada com jeans e couro, para looks casuais e modernos.'),
('Blusa de gola V','O charme da Blusa é o decote V, que faz dela uma peça super coringa e que possibilita criar vários looks versáteis e cheios de estilo.'),
('Blusa de gola rolê','Confortável e maleável, esta é uma peça coringa da estação.'),
('Blusa de renda','Uma peça de manga curta repleta de leveza.'),
('Blusa de seda','Uma blusa leve e fresquinha, com toque de casualidade e delicadeza. '),
('Blusa de tricô','Uma proposta elegante e atemporal sem perder o conforto. Ideal para os dias mais frios.'),
('Blusa gola polo','Um clássico! Uma mistura da camiseta com a camisa social, mangas curtas e um design mais casual.');

INSERT INTO cor (nome, descricao)
VALUES 
('azul', 'Uma cor que evoca tranquilidade e serenidade.'),
('verde', 'Uma cor associada à natureza e à renovação.'),
('amarelo', 'Uma cor vibrante que simboliza energia e otimismo.'),
('vermelho', 'Uma cor apaixonada que transmite calor e vitalidade.'),
('preto', 'Uma cor clássica que representa elegância e sofisticação.'),
('rosa', 'Uma cor suave que sugere feminilidade e delicadeza.'),
('branco', 'Uma cor pura que simboliza paz e pureza.'),
('cinza', 'Uma cor neutra e versátil que transmite equilíbrio.'),
('bege', 'Uma cor suave e discreta que complementa outras cores.'),
('off-white', 'Uma variação suave e cremosa do branco clássico.'),
('laranja', 'Uma cor vibrante que evoca entusiasmo e criatividade.');


INSERT INTO marca (nome, descricao) VALUES
('Berry Chic', 'Roupas elegantes e modernas inspiradas em frutas vermelhas'),
('Apple Blossom', 'Roupas delicadas e femininas com motivos florais'),
('Peach Couture', 'Moda couture com um toque de elegância pêssego'),
('Lemon Zest', 'Linha de roupas frescas e vibrantes com acentos cítricos'),
('Plum & Petal', 'Moda sofisticada e refinada com tons de ameixa'),
('Cherry Charm', 'Roupas encantadoras e lúdicas inspiradas em cerejas'),
('Mango Muse', 'Estilos de moda inspirados em mangas tropicais'),
('Kiwi Couture', 'Designs de alta costura com motivos inspirados em kiwi'),
('Grapevine Glam', 'Roupas glamorosas com um toque de sedução de videira'),
('Pineapple Passion', 'Designs apaixonados e ousados com o charme do abacaxi'),
('Strawberry Style', 'Roupas elegantes e chiques com acentos de morango'),
('Blueberry Belle', 'Moda bonita e elegante inspirada em mirtilos'),
('Watermelon Wardrobe', 'Um guarda-roupa cheio de roupas divertidas e vibrantes com tema de melancia'),
('Papaya Parade', 'Desfile de roupas modernas e coloridas com motivos de mamão'),
('Fig & Fashion', 'Estilos fashion e sofisticados com elementos inspirados em figo'),
('Raspberry Ruche', 'Linha de roupas franzidas e estilosas inspiradas em framboesas'),
('Guava Glamour', 'Designs glamorosos e chiques infundidos com detalhes inspirados em goiaba'),
('Lime Luxe', 'Moda luxuosa e refinada com acentos de verde limão'),
('Cranberry Chic', 'Roupas chiques e estilosas com tons inspirados em cranberry'),
('Orange Orchard', 'Designs fashion com tema vibrante de pomar de laranjas');

INSERT INTO tamanho (nome, descricao)
VALUES 
('P',	'Medidas: Comprimento: 56 cm, Largura: 38 cm.'),
('M', 'Medidas: Comprimento: 57 cm,Largura: 39 cm.'),
('G',	'Medidas: Comprimento: 59 cm,Largura: 41 cm'),
('GG', 'Medidas Equivalente ao tamanho 44.'),
('EG', 'Extra grande. Medidas equivante ao tamanho 46');
