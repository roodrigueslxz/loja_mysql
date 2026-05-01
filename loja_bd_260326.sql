-- criando banco de dados
create database loja;

-- invocar o banco de dados
use loja;

-- criando a tabela clientes
create table clientes (
	id_cliente int auto_increment primary key,
    nome varchar(100) not null,
    email varchar(100) not null,
    telefone varchar(20) not null,
	endereco text,
    data_cadastro date
);
    
-- criando a tabela produtos
create table produtos (
	id_produto int auto_increment primary key,
    nome varchar(100) not null,
    descricao text,
    valor_unitario decimal(10,2) not null,
    quantidade_estoque int,
    categoria varchar(50),
    data_cadastro date
);

-- criando a tabela de vendas
create table vendas (
	id_venda int auto_increment primary key,
    id_cliente int,
    id_produto int,
    quantidade int,
    valor_unitario decimal(10,2),
    valor_total decimal(10,2),
    data_venda date,
    foreign key (id_cliente) references clientes(id_cliente),
    foreign key (id_produto) references produtos(id_produto)
);

-- inserindo informacoes dos clientes
insert into clientes (nome, email, telefone, endereco, data_cadastro) values
('beatrice laus', 'beabadoobee@email.com', '11987654321', '123 sampaguita st, iloilo city, philippines', '2026-03-01'),
('abel tesfaye', 'theweeknd@email.com', '11987654322', '456 finch ave w, toronto, on, canada', '2026-03-02'),
('laufey lín jónsdóttir', 'laufey@email.com', '11987654323', '78 laugavegur, reykjavík, iceland', '2026-03-03'),
('karly-marina loaiza', 'kaliuchis@email.com', '11987654324', '890 alexandria ave, alexandria, va, usa', '2026-03-04'),
('maría zardoya', 'themarias@email.com', '11987654325', '123 calle loíza, san juan, puerto rico', '2026-03-05');
    
-- inserindo produtos na tabela
insert into produtos (nome, descricao, valor_unitario, quantidade_estoque, categoria, data_cadastro) values
('camiseta oversized', 'camiseta larga em algodão premium, ideal para looks urbanos', 89.90, 50, 'camisetas', '2026-03-01'),
('calça jeans slim azul', 'calça jeans com corte slim e lavagem moderna', 149.90, 30, 'calças', '2026-03-02'),
('jaqueta corta vento', 'jaqueta leve resistente ao vento e respingos de água', 199.90, 20, 'jaquetas', '2026-03-03'),
('moletom canguru básico', 'moletom confortável com bolso frontal e capuz ajustável', 129.90, 40, 'moletons', '2026-03-04'),
('vestido midi floral', 'vestido leve com estampa floral e caimento solto', 159.90, 25, 'vestidos', '2026-03-05'),
('cropped ribana', 'cropped justo em tecido canelado, estilo casual', 59.90, 60, 'camisetas', '2026-03-06'),
('short jeans destroyed', 'short com detalhes rasgados e lavagem clara', 99.90, 35, 'shorts', '2026-03-07'),
('blazer alfaiataria', 'blazer elegante com corte moderno para ocasiões formais', 249.90, 15, 'blazers', '2026-03-08'),
('saia plissada', 'saia com pregas e tecido leve, ideal para looks sofisticados', 119.90, 22, 'saias', '2026-03-09'),
('regata básica algodão', 'regata simples e confortável para uso diário', 39.90, 70, 'regatas', '2026-03-10');
    
-- anotando vendas
insert into vendas (id_cliente, id_produto, quantidade, valor_unitario, valor_total, data_venda) values
(1, 1, 2, 89.90, 179.80, '2026-03-10'),
(2, 3, 1, 199.90, 199.90, '2026-03-11'),
(3, 5, 1, 159.90, 159.90, '2026-03-12'),
(4, 2, 3, 149.90, 449.70, '2026-03-13'),
(5, 4, 1, 129.90, 129.90, '2026-03-14'),
(1, 6, 2, 59.90, 119.80, '2026-03-15'),
(2, 7, 1, 99.90, 99.90, '2026-03-16');

-- selecionar todos os produtos disponiveis
select * from produtos;

-- selecionar o nome e o preco dos produtos
select nome, valor_unitario from produtos;

-- selecionar os clientes cadastrados
select * from clientes;

-- selecionar as vendas realizadas
select * from vendas;

-- selecionar o nome e o telefone dos clientes
select nome, telefone from clientes;

-- selecionar as vendas com nome do produto e nome do cliente
select vendas.id_venda, clientes.nome as cliente,
produtos.nome as produto, vendas.quantidade, vendas.valor_total
from vendas
join clientes on vendas.id_cliente = clientes.id_cliente
join produtos on vendas.id_produto = produtos.id_produto;

-- selecionar todas as vendas acima de 100 reais
select * from vendas where valor_total > 100.00;

-- selecionar o nome dos produtos da categoria "camisetas"
select * from produtos where categoria = 'camisetas';

-- selecionar vendas que foram feitas em 2026
select * from vendas where year(data_venda) = 2026;

-- selecionar a quantidade total de cada produto disponivel em estoque
select nome, quantidade_estoque from produtos;

-- adiciona uma nova coluna na tabela
alter table produtos add marca varchar(50);

-- adicionar uma coluna de cpf na tabela clientes
alter table clientes add cpf varchar(14);

-- modificar o tipo de dado da coluna telefone
alter table clientes modify telefone varchar(25);

-- renomear a coluna descricao de produtos
alter table produtos rename column descricao to descricao_produto;

-- remover uma coluna
alter table produtos drop column marca;

-- atualizar o preco de um produto
update produtos set valor_unitario = 79.90 where id_produto = 1;

-- atualizar estoque
set sql_safe_updates = 0;
update produtos set quantidade_estoque = 100 where nome = 'camiseta oversized';

-- atualizar email de um cliente
update clientes set email = 'beabadoobee@gmail.com' where id_cliente = 1;

-- atualizar endereco
update clientes set endereco = 'rua das flores, 123 - sao paulo' where nome = 'beatrice laus';

-- atualizar multiplos campos 
update produtos set valor_unitario = 59.90, quantidade_estoque = 150 where categoria = 'regatas';

-- excluir um produto especifico 
delete from produtos where id_produto = 10;