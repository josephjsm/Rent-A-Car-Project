create view [Alugueres - Total] as select A.[IDAluguer], A.[IDCliente], A.[IDCarro], A.[NomeProprio], A.[SegundoNome], A.[Apelido], A.[NomeCompleto], A.[M�todoPagamento], A.[InicioAluguer], A.[FimAluguer], A.[EstadoCarroInicio], A.[EstadoCarroFim], A.[QuilometragemCarro], A.[QuilometragemCarroFim], A.[EmAluguer], A.[Seguro] from Aluguer as A left join AluguerArquivo as AA on A.IDAluguer=AA.IDAluguer

create view [Tabela de Sal�rios] as select * from Empregados as E where E.EmEmpresa = 1