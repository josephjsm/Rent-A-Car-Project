create role CEO_RentaCar
go

grant update on object::Empregados to CEO_RentaCar;
go

grant select on object::Empregados to CEO_RentaCar;
go

grant update on object::EMpregadosArquivos to CEO_RentaCar;
go

grant select on object::EmpregadosArquivos to CEO_RentaCar;
go

grant control on object::Empregados to CEO_RentaCar;
go

grant control on object::FrotaDeCarros to CEO_RentaCar;
go

grant control on object::cliente to CEO_RentaCar;
go

create role Sales_Marketing
go

grant select on object::cliente to Sales_Marketing;
go

grant control on object::cliente to Sales_Marketing;
go

deny update on object::FrotaDeCarros to Sales_Marketing;
go

grant select on object::FrotaDeCarros to Sales_Marketing;
go

grant control on object::FrotaDeCarros to Sales_Marketing;
go

deny update on object::Aluguer to Sales_Marketing;
go

deny update on object::AluguerArquivo to SalesMareting;
go

grant select on object::Aluguer to Sales_Marketing;
go

grant select on object::AluguerArquivo to Sales_Marketing;
go

grant control on object::Aluguer to Sales_Marketing;
go

grant control on object::AluguerArquivo to Sales_Marketing;
go

deny update on object::Empregados to Sales_Marketing;
go

deny update on object::EmpregadosArquivos to Sales_Marketing;
go

grant select on object::Empregados to Sales_Marketing;
go

grant select on object::EmpregadosArquivos to Sales_Marketing;
go

grant control on object::Empregados to Sales_Marketing;
go

grant control on object::EmpregadosArquivos to Sales_Marketing;
go



create role Operations
go

grant select on object::cliente to Operations;
go

grant select on object::FrotaDeCarros to Operations;
go

grant update on object::Aluguer to Operations;
go

grant update on object::FrotaDeCarros to Operations;
go

grant update on object::cliente to Operations;
go

deny select on object::Empregados to Operations;
go

deny select on object::EmpregadosArquivos to Operations;
go

deny update on object::Empregados to Operations;
go

deny update on object::EmpregadosArquivos to Operations;
go







create role Commercial_Sales
go

deny update on object::Empregados to Commercial_Sales
go

grant select on object::Empregados to Commercial_Sales;
go

grant control on object::Empregados to Commercial_Sales;
go

deny update on object::FrotaDeCarros to Commercial_Sales;
go

grant select on object::FrotaDeCarros to Commercial_Sales;
go

grant control on object::FrotaDeCarros to Commercial_Sales;
go

deny update on object::Aluguer to Commercial_Sales;
go

grant select on object::Aluguer to Commercial_Sales;
go

grant control on object::Aluguer to Commercial_Sales;
go


deny update on object::Empregados to Commercial_Sales;
go

grant select on object::Empregados to Commercial_Sales;
go

grant control on object::Empregados to Commercial_Sales;
go






create role Accounting
go

deny update on object::cliente to Accounting;
go

grant select on object::cliente to Accounting;
go

grant control on object::cliente to Accounting;
go

deny update on object::FrotaDeCarros to Accounting;
go

grant select on object::FrotaDeCarros to Accounting;
go

grant control on object::FrotaDeCarros to Accounting;
go

deny update on object::Aluguer to Accounting;
go

grant select on object::Aluguer to Accounting;
go

grant control on object::Aluguer to Accounting;
go

deny update on object::Empregados to Accounting;
go

grant select on object::Empregados to Accounting;
go

grant control on object::Empregados to Accounting;
go
