INSERT INTO permissoes (descricao) values('ROLE_USER');
INSERT INTO permissoes (descricao) values('ROLE_ADMIN');

INSERT INTO usuario(nome, username, password) VALUES ('Administrador', 'admin@admin.com','$2a$10$.PVIfB07x.SfMYTcToxL0.yxcLWU0GbS2NUO1W1QAvqMm/TsFhVem');
INSERT INTO usuario(nome, username, password) VALUES ('Teste', 'teste@teste.com','$2a$10$.PVIfB07x.SfMYTcToxL0.yxcLWU0GbS2NUO1W1QAvqMm/TsFhVem');

INSERT INTO usuario_permissoes(id_permissao, id_usuario) VALUES (1, 1);
INSERT INTO usuario_permissoes(id_permissao, id_usuario) VALUES (1, 2);
INSERT INTO usuario_permissoes(id_permissao, id_usuario) VALUES (2, 2);

INSERT INTO usuario_permissoes_usuario(usuario_id, permissoes_usuario_id) VALUES (1, 1);
INSERT INTO usuario_permissoes_usuario(usuario_id, permissoes_usuario_id) VALUES (1, 2);
INSERT INTO usuario_permissoes_usuario(usuario_id, permissoes_usuario_id) VALUES (2, 2);

INSERT INTO CARGOS (id, descricao) VALUES (1, 'Estoquista')
INSERT INTO CARGOS (id, descricao) VALUES (2, 'Coletor')
INSERT INTO CARGOS (id, descricao) VALUES (3, 'Entregador')

INSERT INTO ESTADOS (id, estado, uf) VALUES (1, 'Paraná', 'PR')
INSERT INTO ESTADOS (id, estado, uf) VALUES (2, 'Santa Catarina', 'SC')
INSERT INTO ESTADOS (id, estado, uf) VALUES (3, 'Rio Grande do Sul', 'RS')
INSERT INTO ESTADOS (id, estado, uf) VALUES (4, 'São Paulo', 'SP')

INSERT INTO CIDADES (id, cidade, codibge, id_estado) VALUES (1, 'Pato Branco', 4118501, 1)
INSERT INTO CIDADES (id, cidade, codibge, id_estado) VALUES (2, 'Chapecó', 4118502, 2)
INSERT INTO CIDADES (id, cidade, codibge, id_estado) VALUES (3, 'Porto Alegre', 4118503, 3)
INSERT INTO CIDADES (id, cidade, codibge, id_estado) VALUES (4, 'Santo André', 4118504, 4)

INSERT INTO CENTROS_DISTRIBUICAO (id, descricao, id_cidade) VALUES (1, 'CDD Campinas', 1)
INSERT INTO CENTROS_DISTRIBUICAO (id, descricao, id_cidade) VALUES (2, 'CDD Chapecó', 1)
INSERT INTO CENTROS_DISTRIBUICAO (id, descricao, id_cidade) VALUES (3, 'CDD Pato Branco', 1)

INSERT INTO TIPOS_DESPESA (id, descricao) VALUES (1, 'Borracharia')
INSERT INTO TIPOS_DESPESA (id, descricao) VALUES (2, 'Mecânica')
INSERT INTO TIPOS_DESPESA (id, descricao) VALUES (3, 'Combustível')

INSERT INTO VEICULOS (id, descricao, fabricante, modelo, placa1, placa2, placa3, ano_Modelo, ano_Fabricacao, peso_Max) VALUES (1, 'Moto 150', 'Honda', 'CG 150', 'ABC-1234', 'ABC-1235', 'ABC-1236', '2015', '2014', 30.00)

INSERT INTO ENTIDADES (id, nome, cpf_Cnpj, data_Nasc, endereco, numero, bairro, cep, complemento, id_cidade) VALUES (1, 'Danrley', '03195289105', '19931228', 'Rua Teste', '158', 'Centro', '85508014', 'Complemento', 1)
INSERT INTO ENTIDADES (id, nome, cpf_Cnpj, data_Nasc, endereco, numero, bairro, cep, complemento, id_cidade) VALUES (2, 'João', '00000000191', '19901015', 'Rua Teste', '158', 'Centro', '85508014', 'Complemento', 2)

INSERT INTO ENCOMENDAS (id, descricao, chave_Rastreio, peso, valor, data_Coleta, prev_Entrega, fragil, altura, largura, profundidade, id_entidade_Origem, id_entidade_Destino) VALUES (1, 'Caixa pequena', '123456', 5.0, 30.0, '20181020', '20181025', true, 5, 10, 15, 1, 2)

INSERT INTO FUNCIONARIOS (id, nome, data_nasc, cpf, id_usuario, id_cargo, id_centros_distribuicao) VALUES (1, 'Danrley', '19931228', '00000000191', 1, 1, 1)