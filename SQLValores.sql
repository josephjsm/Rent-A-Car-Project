instert into Empregados (NomeProprio, SegundoNome, Apelido, DocumentoIdentifica��o, DocumentoIdentifica��oDigits, NIF, Iban, SWIFT, Nacionalidade, Naturalidade, Departamento, Fun��o, G�nero, DatadeNascimento, EntradaEmEmpresa, EmEmpresa, ContatoTelef�nico, ContatoM�vel, Morada, Cidade, N�meroPorta, C�digoPostal, Email, Sal�rio, Observa��es)
values 
('Jo�o', 'Carlos', 'Santos', 'Carta de Condu��o', '123456', 123456789, 1234567890123456789012345678901234, 'BCPPTPL', 'Portugu�s', 'Lisboa', 'Vendas', 'Gerente', 1, '1980-05-12', '2020-01-01', 1, 212345678, 919876543, 'Rua das Flores', 'Lisboa', 45, '1000-123', 'joao.santos@empresa.pt', 2500.00, 'Sem observa��es'),
('Ana', 'Maria', 'Silva', 'Passaporte ', '789456', 987654321, 2345678901234567890123456789012345, 'BCPPTPL', 'Portuguesa', 'Porto', 'RH', 'Assistente', 0, '1990-11-20', '2019-03-15', 1, 223456789, 929876543, 'Rua do Porto', 'Porto', 120, '4000-456', 'ana.silva@empresa.pt', 1500.00, NULL),
('Carlos', NULL, 'Ferreira', 'Bilhete de Identidade', '654321', 123123123, 3456789012345678901234567890123456, 'BCPPTPL', 'Portugu�s', 'Coimbra', 'Financeiro', 'Analista', 1, '1985-07-08', '2018-09-01', 1, NULL, 938765432, 'Rua Coimbra', 'Coimbra', 65, '3000-789', 'carlos.ferreira@empresa.pt', 1800.00, 'Colaborador do m�s em Junho de 2021');

instert into Cliente (NomeProprio, SegundoNome, Apelido, DocumentoIdentifica��o, DocumentoIdentifica��oDigits, NIF, IBAN, D�bito_Direto, ClienteAtualOu, NAlugueres, Morada, Cidade, N�merodaPorta, ContatoTelef�nico, ContatoM�vel, DatadeNascimento, Email, Quilometragem_Total)
values 
('Lu�s', 'Miguel', 'Almeida', 'Passaporte', '123456', 111222333, 4567890123456789012345678901234567, 1, 1, 10, 'Avenida da Liberdade', 'Lisboa', 101, 213456789, 912345678, '1985-02-10', 'luis.almeida@cliente.pt', 12000.0),
('Maria', 'Jos�', 'Fernandes', 'Carta de Condu��o', '654789', 222333444, NULL, 0, 1, 5, 'Rua de Santo Ant�nio', 'Set�bal', 12, 265432198, 922345678, '1975-10-05', 'maria.fernandes@cliente.pt', 8000.0),
('Pedro', NULL, 'Gomes', 'Bilhete de Identidade', '987321', 333444555, 5678901234567890123456789012345678, 1, 0, 0, 'Pra�a do Com�rcio', 'Lisboa', 50, 218765432, 932345678, '1992-12-20', 'pedro.gomes@cliente.pt', 15000.0);

instert into Aluguer (IDCliente, IDCarro, NomeProprio, SegundoNome, Apelido, M�todoPagamento, InicioAluguer, FimAluguer, EstadoCarroInicio, EstadoCarroFim, QuilometragemCarro, QuilometragemCarroFim, EmAluguer, Seguro)
values 
(1, 2, 'Lu�s', 'Miguel', 'Almeida', 'Cart�o de Cr�dito', '2023-05-10', '2023-05-15', 'Excelente', 'Bom', 20000.0, 20500.0, 0, 'Simples'),
(2, 3, 'Maria', 'Jos�', 'Fernandes', 'Transfer�ncia Banc�ria', '2023-04-01', '2023-04-10', 'Boa', 'Razo�vel', 15000.0, 15500.0, 0, 'Completo'),
(3, 1, 'Pedro', NULL, 'Gomes', 'Dinheiro', '2023-06-15', NULL, 'Excelente', NULL, 12000.0, NULL, 1, 'Parcial');
