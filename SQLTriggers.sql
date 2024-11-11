--Primeiro Trigger Empregados. Copia registo adicionado a tabela de Empregados para a tabela EmpregadosArquivo se o seu valor em "SaidaEmEmpresa" é igual a 0,

create trigger TR_EmpregadosArquivo_insert
on Empregados
after insert
AS 
begin
    insert into EmpregadosArquivos (
        [IDEmpregados], [NomeProprio], [Segundonome], [Apelido], [NomeCompleto], [NIF], 
        [Iban], [SWIFT], [Nacionalidade], [Naturalidade], [Departamento], [Função], [Género], 
        [DatadeNascimento], [EntradaemEmpresa], [ContatoTelefónico], [ContatoMóvel], [Morada], 
        [NúmeroPorta], [CódigoPostal], [Email], [Salário], [Observações]
    )
    select  
        [IDEmpregados], [NomeProprio], [Segundonome], [Apelido], [NomeCompleto], [NIF], 
        [Iban], [SWIFT], [Nacionalidade], [Naturalidade], [Departamento], [Função], [Género], 
        [DatadeNascimento], [EntradaemEmpresa], [ContatoTelefónico], [ContatoMóvel], [Morada], 
        [NúmeroPorta], [CódigoPostal], [Email], [Salário], [Observações]
    from 
        Empregados AS E
    join 
        EmpregadosArquivos AS EA on E.IDEmpregados = EA.IDEmpregados
    where 
        E.SaídaEmEmpresa = 0 AND EA.SaidaEmEmpresa <> 0; 
end
go


--Segundo Trigger. Quando um registo em a tabela de Empregados é atualizado, de 1 para 0, em a coluna "SaidaEmEmpresa" o registo é copiado para a tablea EmpregadoArquivo
create trigger TR_EmpregadosArquivos_Arquivo
on Empregados
after UPDATE
AS 
begin
    insert into EmpregadosArquivos (
        [IDEmpregados], [NomeProprio], [Segundonome], [Apelido], [NomeCompleto], [NIF], 
        [Iban], [SWIFT], [Nacionalidade], [Naturalidade], [Departamento], [Função], [Género], 
        [DatadeNascimento], [EntradaemEmpresa], [ContatoTelefónico], [ContatoMóvel], [Morada], 
        [NúmeroPorta], [CódigoPostal], [Email], [Salário], [Observações]
    )
    select  
        [IDEmpregados], [NomeProprio], [Segundonome], [Apelido], [NomeCompleto], [NIF], 
        [Iban], [SWIFT], [Nacionalidade], [Naturalidade], [Departamento], [Função], [Género], 
        [DatadeNascimento], [EntradaemEmpresa], [ContatoTelefónico], [ContatoMóvel], [Morada], 
        [NúmeroPorta], [CódigoPostal], [Email], [Salário], [Observações]
    from 
        Empregados AS E
    join 
        EmpregadosArquivos AS EA on E.IDEmpregados = EA.IDEmpregados
    where 
        E.SaídaEmEmpresa = 0 AND EA.SaidaEmEmpresa <> 0;
end
go


create trigger TR_EmpregadosSaida_Apagar
on Empregados
after UPDATE
AS 
begin
    DELETE from Empregados
    where SaídaEmEmpresa = 0;
end
go


EXEC sp_settriggerorder
    @triggername = 'TR_EmpregadosArquivos_Arquivo', 
    @order = 'FIRST', 
    @stmttype = 'UPDATE';

EXEC sp_settriggerorder
    @triggername = 'TR_EmpregadosSaida_Apagar', 
    @order = 'LAST', 
    @stmttype = 'update';



--Trigger para carros. Quando um registo cujo valor em a coluna "EmAluguer" é igual a 0, este registo é copiado para a tabela AluguerArquivo


create trigger TR_AlugerCopiaArquivo
on Aluguer
after insert
AS 
begin
    insert into AluguerArquivo (
        [IDAluguer], [IDCliente], [IDCarro], [NomeCompleto], 
        [MétodoPagamento], [InicioAluguer], [FimAluguer], [EstadoCarroInicio], 
        [EstadoCarroFim], [QuilometragemCarro], [QuilometragemCarroFim], [Seguro]
    )
    select  
        A.[IDAluguer], A.[IDCliente], A.[IDCarro], 
        A.[NomeCompleto], A.[MétodoPagamento], A.[InicioAluguer], A.[FimAluguer], 
        A.[EstadoCarroInicio], A.[EstadoCarroFim], A.[QuilometragemCarro], 
        A.[QuilometragemCarroFim], A.[Seguro]
    from 
        Aluguer AS A
    join 
        AluguerArquivo AS AA 
        on A.IDAluguer = AA.IDAluguer 
    where 
        A.EmAluguer = 0 AND AA.EmAluguer <> 0;
end
go

--Primeiro Trigger que criar uma cópia de um registo cujo valor em a coluna "Em Aluguer" é igual a 0.
--Quando um registo tem como seu valor em a coluna "EmAluguer" 0, significa que esta não está em aluguer

create trigger TR_AlugerCopiaArquivo
on Aluguer
after UPDATE
AS 
begin
    insert into AluguerArquivo (
        [IDAluguer], [IDCliente], [IDCarro], [NomeCompleto], 
        [MétodoPagamento], [InicioAluguer], [FimAluguer], [EstadoCarroInicio], 
        [EstadoCarroFim], [QuilometragemCarro], [QuilometragemCarroFim], [Seguro]
    )
    select  
        A.[IDAluguer], A.[IDCliente], A.[IDCarro], 
        A.[NomeCompleto], A.[MétodoPagamento], A.[InicioAluguer], A.[FimAluguer], 
        A.[EstadoCarroInicio], A.[EstadoCarroFim], A.[QuilometragemCarro], 
        A.[QuilometragemCarroFim], A.[Seguro]
    from 
        Aluguer AS A
    join 
        AluguerArquivo AS AA 
        on A.IDAluguer = AA.IDAluguer  -- join condition based on Aluguer ID
    where 
        A.EmAluguer = 0 AND AA.EmAluguer <> 0;  -- Make sure this column exists in Aluguer
end
go



--Segundo trigger


create trigger TR_AluguerFimApagar
on Aluguer
after UPDATE
AS 
begin
    DELETE from Aluguer
    where EmAluguer = 0;
end
go

--Procedures que dictam a ordem dos triggers

EXEC sp_settriggerorder
    @triggername = 'TR_AlugerCopiaArquivo', 
    @order = 'FIRST', 
    @stmttype = 'UPDATE';

EXEC sp_settriggerorder
    @triggername = 'TR_AluguerFimApagar', 
    @order = 'LAST', 
    @stmttype = 'update';