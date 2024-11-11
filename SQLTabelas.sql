create table FrotaDeCarros (
    IDCarro int IDENTITY(1,1) not null 
        constraint PK_FrotaDeCarros_IDCarro PRIMARY KEY (IDCarro),
    Marca nvarchar(25) not null,
    Modelo nvarchar(35) not null,
    Seguro nvarchar(25) not null,
    Cor nvarchar(10) not null,
    EmAluguer int not null,
    constraint CK_EmAluguer check (EmAluguer IN (0, 1)),
    Ano datetime not null,
    Condição nvarchar(10) not null,
    CustoAluguer float not null,
    TipoCarro nvarchar(25) not null,
    NAlugueres int not null,
    Potencia int not null,
    Combustivel nvarchar(25) not null,
    SeguroExtra nvarchar(25) not null,
    QuilometragemTotal int not null,
    Observações nvarchar(200) null
);



create table Empregados (
    IDEmpregados int IDENTITY(1,1) not null 
        constraint PK_Empregados_IDEmpregados PRIMARY KEY (IDEmpregados),
    NomeProprio nvarchar(15) not null,
    SegundoNome nvarchar(100) null,
    Apelido nvarchar(25) not null,
    NomeCompleto AS CONCAT(NomeProprio, ' ', ISnull(SegundoNome, ''), ' ', Apelido) unique, 
    DocumentoIdentificação nvarchar(60) not null unique,
    DocumentoIdentificaçãoDigits nvarchar(60) not null unique,
    NIF DECIMAL(9) not null unique,
    Iban DECIMAL(34) not null unique,
    SWIFT nvarchar(10) not null,
    Nacionalidade nvarchar(50) not null,
    Naturalidade nvarchar(50) not null,
    Departamento nvarchar(50) not null,
    Função nvarchar(50) not null,
    Género int null,
    DatadeNascimento datetime not null,
    EntradaEmEmpresa datetime not null,
    EmEmpresa int not null 
        constraint CK_EmEmpresa check (EmEmpresa IN (0, 1)),
    SaídaEmEmpresa datetime null,
    ContatoTelefónico int null unique,
    ContatoMóvel int not null unique,
    Morada nvarchar(50) not null,
    Cidade nvarchar(20) not null,
    NúmeroPorta int not null,
    CódigoPostal nvarchar(8) not null,
    Email nvarchar(50) null unique,
    Salário float not null,
    Observações nvarchar(200) null
);

create table EmpregadosArquivos (
    IDEmpregadosArquivos int not null 
        constraint PK_EmpregadosArquivos_IDEmpregadosArquivos PRIMARY KEY (IDEmpregadosArquivos),
    IDEmpregados int not null 
        constraint FK_EmpregadosArquivos_IDEmpregados foreign key (IDEmpregados) references Empregados (IDEmpregados),
    NomeProprio nvarchar(15) not null,
    SegundoNome nvarchar(100) null,
    Apelido nvarchar(25) not null,
    NomeCompleto nvarchar(150) not null, 
    DocumentoIdentificação nvarchar(60) not null 
        constraint FK_EmpregadosArquivos_DocumentoIdentificação foreign key (DocumentoIdentificação) references Empregados (DocumentoIdentificação),
    DocumentoIdentificaçãoDigits nvarchar(60) not null 
        constraint FK_EmpregadosArquivos_DocumentoIdentificaçãoDigits foreign key (DocumentoIdentificaçãoDigits) references Empregados (DocumentoIdentificaçãoDigits),
    NIF DECIMAL(9) not null unique 
        constraint FK_EmpregadosArquivos_NIF foreign key (NIF) references Empregados (NIF),
    Iban DECIMAL(34) not null unique 
        constraint FK_EmpregadosArquivos_IBAN foreign key (Iban) references Empregados (Iban),
    SWIFT nvarchar(10) not null,
    Nacionalidade nvarchar(50) not null,
    Naturalidade nvarchar(50) not null,
    Departamento nvarchar(50) not null,
    Função nvarchar(50) not null,
    Género int null,
    DatadeNascimento datetime not null,
    EntradaemEmpresa datetime not null,
    ContatoTelefónico int null 
        constraint FK_EmpregadosArquivos_ContatoTelefónico foreign key (ContatoTelefónico) references Empregados (ContatoTelefónico),
    ContatoMóvel int not null 
        constraint FK_EmpregadosArquivos_ContatoMóvel foreign key (ContatoMóvel) references Empregados (ContatoMóvel),
    Morada nvarchar(50) not null,
    Cidade nvarchar(20) not null,
    NúmeroPorta int not null,
    CódigoPostal nvarchar(8) not null,
    Email nvarchar(50) null 
        constraint FK_EmpregadosArquivos_Email foreign key (Email) references Empregados (Email),
    Salário float not null,
    Observações nvarchar(200) null
);



create table cliente(
	IDCliente	int identity(1,1) not null constraint PK_cliente_IDCliente primary key(IDCliente),
	NomeProprio	nvarchar(15) not null,
	SegundoNome nvarchar(100) null,
	Apelido	nvarchar(25) not null,
	NomeCompleto as concat(NomeProprio, ' ', SegundoNome, ' ', Apelido),
	DocumentoIdentificação nvarchar(60) not null unique,
	DocumentoIdentificaçãoDigits nvarchar(60) not null unique,
	NIF	decimal(9) not null unique,
	IBAN decimal(34) null unique,
	Débito_Direto int not null,
	ClienteAtualOu int not null constraint CK_ClienteAtualOu check (ClienteAtualOu IN (0, 1)),
	NAlugueres int not null,
	Morada	nvarchar(50) not null,
	Cidade nvarchar(20) not null,
	NúmerodaPorta int not null,
	ContatoTelefónico	int null unique,
	ContatoMóvel int not null unique,
	DatadeNascimento	datetime not null,
	Email nvarchar(50) null unique,
	Quilometragem_Total float  not null
	)



create table Aluguer (
    IDAluguer int not null IDENTITY(1,1) constraint PK_Aluguer_IDAluguer PRIMARY KEY,
    IDCliente int not null constraint FK_Aluguer_IDCliente foreign key (IDCliente) references Cliente(IDCliente),
    IDCarro int not null constraint FK_Aluguer_IDCarro foreign key (IDCarro) references FrotaDeCarros(IDCarro),
	NomeProprio	nvarchar(15) not null,
	SegundoNome nvarchar(100) null,
	Apelido	nvarchar(25) not null,
	NomeCompleto as concat(NomeProprio, ' ', SegundoNome, ' ', Apelido),
    MétodoPagamento nvarchar(15) not null,
    InicioAluguer datetime not null,
    FimAluguer datetime null,
	EstadoCarroInicio nvarchar(25) null,
	EstadoCarroFim nvarchar(25) null,
    QuilometragemCarro float not null,
    QuilometragemCarroFim float null,
	EmAluguer int null constraint CK_EmAluguerfr check (EmAluguer IN (0, 1)),
	Seguro nvarchar(50) not null
)



create table AluguerArquivo(
	IDAluguerArquivo int not null identity(1,1) constraint PK_AluguerArquivo_IDAluguerArquivo primary key,
	IDAluguer int not null constraint FK_AluguerArquivo_IDAluguer foreign key (IDAluguer) references Aluguer(IDAluguer),
    IDCliente int not null constraint FK_AluguerArquivo_IDCliente foreign key (IDCliente) references Cliente(IDCliente),
    IDCarro int not null constraint FK_AluguerArquivo_IDCarro foreign key (IDCarro) references FrotaDeCarros(IDCarro),
	NomeCompleto nvarchar(150) not null,
    MétodoPagamento nvarchar(15) not null,
    InicioAluguer datetime not null,
    FimAluguer datetime null,
	EstadoCarroInicio nvarchar(25) null,
	EmAluguer int null constraint CK_EmAluguerArquivo check (EmAluguer IN (0, 1)),
	EstadoCarroFim nvarchar(25) null,
    QuilometragemCarro float not null,
    QuilometragemCarroFim float null,
	Seguro nvarchar(50) not null
)

