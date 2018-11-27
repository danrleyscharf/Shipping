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

