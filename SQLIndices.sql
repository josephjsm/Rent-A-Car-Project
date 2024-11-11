create index EmpregadosSal�rios on Empregados(Sal�rio, NomeCompleto, Departamento, Fun��o)
go

create index CarrosPublico on FrotaDeCarros(Modelo, Marca, Cor, TipoCarro, Potencia, Combustivel, QuilometragemTotal)
go

create index EmpregadosIdentifica��o on Empregados(NomeCompleto, NIF, DocumentoIdentifica��o, DocumentoIdentifica��oDigits)
go

create index ICarrosEmUso on Aluguer(IDCarro, IDCliente, IDAluguer, NomeCompleto, InicioAluguer, FimAluguer, EstadoCarroInicio, Seguro)
go

create procedure pr_CarrosEmUso as select * from FrotaDeCarros where EmAluguer = 1
go

create procedure pr_TabelaSal�rios as select NomeCompleto, Fun��o, Departamento, EntradaEmEmpresa from Empregados
go