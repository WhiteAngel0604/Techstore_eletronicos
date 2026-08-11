# Techstore_eletronicos
um trabaio ai

Coloquem o texto que precisarmos lê ai

AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA

Problemas: 
ocasionando problemas como:
•	Produtos com estoque incorreto; 
•	Dificuldade para localizar clientes; 
•	Falta de histórico de vendas; 
•	Erros no cálculo dos valores vendidos; 
•	Demora no atendimento. 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Objetivo Geral: Solucionar os problemas gerados pelo controle manual de registros, automatizando funções e otimizando o sistema de venda da empresa.

Objetivo Geral (Corrigido): Automatizar os controles de registros, otimizando o fluxo de vendas da empresa e facilitando a dinâmica de trabalho.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Objetivos especificos: Facilitar a dinamica de venda de produtos: registrando o historico de forma automatica, dando precisão nos custos de cada produto e os alocando corretamente, inovando o metodo de divulgação dos produtos. 

Objetivos especificos (corrigido): Ter um controle de estoque automatizado, evitando problemas na quantidade de produtos. Registrar dados de clientes em um único sistema, facilitando a busca por informações no momento da venda. Gerar histórico de vendas automático, armazenando cada venda com detalhes necessários. Automatizar o cálculo de vendas, evitando erros no preço final de itens. Agilizar o atendimento ao cliente, reduzindo o tempo entre o início e a finalização da venda. 

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Justificativa: O sistema precisa ser atualizado para melhor desempenho da loja.

Justificativa (Corrigido): O atual sistema da loja se tornou ineficaz em relação às necessidades do estabelecimento e dos clientes. O controle manual não acompanha o ritmo de vendas, atrapalhando toda a dinamica de trabalho

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Problema: O sistema usado atualmente pela empresa causa conflitos na estrutura interna do estabelecimento, dificultando o acessos a informações essenciais para a rede, desencorajando a compra dos clientes.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Solução Proposta: A integração de um software de desktop em java, utilizando a arquitetura Model-View-Controller, conectada a um banco de dados SQL.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Escopo: O software irá gerenciar os registros feitos no sistema, como preços, histórico de vendas, cadastros e controle de clientes. Porém a aplicação não vai interferir na interface visual acessada pelo usuário.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Regras de Negócio:
1. Um produto só pode ser adicionado ao carrinho se a quantidade em estoque for maior que zero;
2. A compra não pode ser executada se o pedido exigir uma quantidade maior que o que está disponível;
3. Clientes menores de 18 anos não podem se cadastrar como "Pessoa Jurídica" (CNPJ);
4. Cada movimentação de venda realizada deve atualizar imediatamente (dar baixa) na quantidade do estoque 
correspondente no banco de dados;
5. O pedido só pode ser finalizado se o endereço e os dados do cliente estiverem corretos;
6. O pedido só pode ser realizado para clientes cadastrados no sistema.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Requisitos Funcionais:
1. O sistema deve realizar cadastros de produtos e usuários (PF e PJ);
2. O sistema deve ter uma ferramenta de busca para consultar produtos (cadastrados) por nome ou código, 
usuários (cadastrados) por nome, CPF/CNPJ ou email;
3. O cliente pode consultar seus pedidos anteriores;
4. O cliente pode selecionar mais de um produtos para o pedido;
5. O sistema deve calcular o valor total do pedido e exibir ao usuário antes de efetuar a compra;
6. O sistema deve gerar o histórico de vendas da loja;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Requisitos Não-Funcionais:
1. O software será desenvolvido na versão mais recente da linguagem java;
2. O sistema deve salvar os dados registrados automaticamente no banco de dados;
3. A interface gráfica deve ser intuitiva para o usuário;
4. O resultado da busca não deve demorar mais que 2 segundos;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



