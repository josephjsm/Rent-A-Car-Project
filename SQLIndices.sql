create index EmpregadosSalários on Empregados(Salário, NomeCompleto, Departamento, Função)
go

create index CarrosPublico on FrotaDeCarros(Modelo, Marca, Cor, TipoCarro, Potencia, Combustivel, QuilometragemTotal)
go

create index EmpregadosIdentificação on Empregados(NomeCompleto, NIF, DocumentoIdentificação, DocumentoIdentificaçãoDigits)
go

create index ICarrosEmUso on Aluguer(IDCarro, IDCliente, IDAluguer, NomeCompleto, InicioAluguer, FimAluguer, EstadoCarroInicio, Seguro)
go

create procedure pr_CarrosEmUso as select * from FrotaDeCarros where EmAluguer = 1
go

create procedure pr_TabelaSalários as select NomeCompleto, Função, Departamento, EntradaEmEmpresa from Empregados
go