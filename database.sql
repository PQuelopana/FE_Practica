/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  chorrillos
 * Created: 01/12/2019
 */

Create DataBase If Not Exists FE;

Use FE;

Create Table User(
    id              Int(255) Auto_Increment Not Null,
    name            VarChar(100) Not Null,
    surname         VarChar(100) Not Null,
    email           VarChar(100) Not Null,
    password        VarChar(255) Not Null,
    Constraint PKUser Primary Key(id)
)Engine=InnoDB;

Create Table Action(
    id              Int(255) Auto_Increment Not Null,
    type            Char(1) Not Null Comment 'I: Insert, U: Update, D: Delete, A: Approved, R: Restored',
    idUser          Int(255) Not Null,
    dateTime        DateTime Not Null,
    ip              VarChar(30) Not Null,
    Constraint PKAction Primary Key(id),
    Constraint FKActionUser Foreign Key(idUser) References User(id)
)Engine=InnoDB;

Create Table Country(
    id              Int(255) Auto_Increment Not Null,
    idOfficial      VarChar(10) Not Null,
    name            VarChar(100) Not Null,
    indActivated    TinyInt Not Null,
    Constraint PKCountry Primary Key(id),
    Constraint UQCountry Unique(idOfficial)
)Engine=InnoDB;

Create Table Department(
    id              Int(255) Auto_Increment Not Null,
    idCountry       Int(255) Not Null,
    idOfficial      VarChar(10) Not Null,
    name            VarChar(100) Not Null,
    indActivated    TinyInt Not Null,
    Constraint PKDepartment Primary Key(id),
    Constraint FKDepartmentCountry Foreign Key(idCountry) References Country(id),
    Constraint UQDepartment Unique(idCountry, idOfficial)
)Engine=InnoDB;

Create Table Province(
    id              Int(255) Auto_Increment Not Null,
    idDepartment    Int(255) Not Null,
    idOfficial      VarChar(10) Not Null,
    name            VarChar(100) Not Null,
    indActivated    TinyInt Not Null,
    Constraint PKProvince Primary Key(id),
    Constraint FKProvinceDepartment Foreign Key(idDepartment) References Department(id),
    Constraint UQProvince Unique(idDepartment, idOfficial)
)Engine=InnoDB;

Create Table District(
    id              Int(255) Auto_Increment Not Null,
    idProvince      Int(255) Not Null,
    idOfficial      VarChar(10) Not Null,
    name            VarChar(100) Not Null,
    indActivated    TinyInt Not Null,
    Constraint PKDistrict Primary Key(id),
    Constraint FKDistrictProvince Foreign Key(idProvince) References Province(id),
    Constraint UQDistrict Unique(idProvince, idOfficial)
)Engine=InnoDB;

Create Table TypeDocumentIdentity(
    id              Int(255) Auto_Increment Not Null,
    idOfficial      VarChar(10) Not Null,
    name            VarChar(100) Not Null,
    length          TinyInt Not Null,
    Constraint PKTypeDocumentIdentity Primary Key(id),
    Constraint UQTypeDocumentIdentity Unique(idOfficial)
) Engine=InnoDB;

Create Table VoucherType(
    id                      Int(255) Auto_Increment Not Null,
    idOfficial              VarChar(10) Not Null,
    name                    VarChar(30) Not Null,
    abbreviation            VarChar(3) Not Null,
    description             VarChar(250) Not Null,
    indSaleActivated        TinyInt Not Null,
    indPurchaseActivated    TinyInt Not Null,
    Constraint PKVoucherType Primary Key(id),
    Constraint UQTypeDocumentIdentityIdOfficial Unique(idOfficial),
    Constraint UQTypeDocumentIdentityAbbreviation Unique(abbreviation)
) Engine=InnoDB;

Create Table OperationType(
    id                  Int(255) Auto_Increment Not Null,
    idOfficial          VarChar(10) Not Null,
    name                VarChar(150) Not Null,
    Constraint PKOperationType Primary Key(id),
    Constraint UQOperationType Unique(idOfficial)
) Engine=InnoDB;

Create Table PriceList(
    id                  Int(255) Auto_Increment Not Null,
    name                VarChar(150) Not Null,
    indActivated        TinyInt Not Null,
    Constraint PKPriceList Primary Key(id)
) Engine=InnoDB;

Create Table Currency(
    id                  Int(255) Auto_Increment Not Null,
    idOfficial          VarChar(10) Not Null,
    name                VarChar(100) Not Null,
    symbol              VarChar(5) Not Null,
    indActivated        TinyInt Not Null,
    Constraint PKCurrency Primary Key(id),
    Constraint UQCurrency Unique(idOfficial)
) Engine=InnoDB;

Create Table UnitMeasure(
    id                  Int(255) Auto_Increment Not Null,
    idOfficial          VarChar(10) Not Null,
    name                VarChar(100) Not Null,
    abbreviation        VarChar(3) Not Null,
    indActivated        TinyInt Not Null,
    Constraint PKUnitMeasure Primary Key(id),
    Constraint UQUnitMeasure Unique(idOfficial)
) Engine=InnoDB;

Create Table TypeAffectation(
    id                  Int(255) Auto_Increment Not Null,
    idOfficial          VarChar(10) Not Null,
    name                VarChar(100) Not Null,
    indExportation      TinyInt Not Null,
    indFree             TinyInt Not Null,
    Constraint PKTypeAffectation Primary Key(id),
    Constraint UQTypeAffectation Unique(idOfficial)
) Engine=InnoDB;

Create Table Establishment(
    id                  Int(255) Auto_Increment Not Null,
    idOfficial          VarChar(10) Not Null,
    name                VarChar(150) Not Null,
    idDistrict          Int(255) Not Null,
    adress              VarChar(250) Not Null,
    email               VarChar(50) Not Null,
    telephone           VarChar(50) Not Null,
    Constraint PKEstablishment Primary Key(id),
    Constraint UQEstablishment Unique(idOfficial),
    Constraint FKEstablishmentDistrict Foreign Key(idDistrict) References District(id)
) Engine=InnoDB;

Create Table Warehouse(
    id                  Int(255) Auto_Increment Not Null,
    idEstablishment     Int(255) Not Null,
    name                VarChar(150) Not Null,
    Constraint PKWarehouse Primary Key(id),
    Constraint FKWarehouseEstablishment Foreign Key(idEstablishment) References Establishment(id)
) Engine=InnoDB;

Create Table Client(
    id                      Int(255) Auto_Increment Not Null,
    idTypeDocumentIdentity  Int(255) Not Null,
    numberDocumentIdentity  VarChar(25) Not Null,
    name                    VarChar(200) Not Null,
    tradeName               VarChar(200) Not Null,
    idDistrict              Int(255) Not Null,
    adress                  VarChar(250) Not Null,
    telephone               VarChar(50) Not Null,
    email                   VarChar(50) Not Null,
    idAction                Int(255) Not Null,
    Constraint PKClient Primary Key(id),
    Constraint FKClientTypeDocumentIdentity Foreign Key(idTypeDocumentIdentity) References TypeDocumentIdentity(id),
    Constraint FKClientDistrict Foreign Key(idDistrict) References District(id)
) Engine=InnoDB;

Create Table Product(
    id                          Int(255) Auto_Increment Not Null,
    idOfficial                  VarChar(20) Not Null,
    idInternal                  VarChar(20) Not Null,
    idGSL                       VarChar(20) Not Null,
    name                        VarChar(250) Not Null,
    idUnitMeasureSale           Int(255) Not Null,
    idUnitMeasurePurchase       Int(255) Not Null,
    idCurrency                  Int(255) Not Null,
    stockMinimun                Decimal(15, 5) Not Null,
    unitPrice                   Decimal(15, 5) Not Null,
    idTypeAffectationSale       Int(255) Not Null,
    indIgvIncluded              TinyInt Not Null,
    unitCost                    Decimal(15, 5) Not Null,
    idTypeAffectationPurchase   Int(255) Not Null,
    indICBPER                   TinyInt Not Null,
    idAction                    Int(255) Not Null,
    Constraint PKProduct Primary Key(id),
    Constraint FKProductUnitMeasureIdUnitMeasureSale Foreign Key(idUnitMeasureSale) References UnitMeasure(id),
    Constraint FKProductUnitMeasureIdUnitMeasurePurchase Foreign Key(idUnitMeasurePurchase) References UnitMeasure(id),
    Constraint FKProductCurrency Foreign Key(idCurrency) References Currency(id),
    Constraint FKProductTypeAffectationIdTypeAffectationSale Foreign Key(idTypeAffectationSale) References TypeAffectation(id),
    Constraint FKProductTypeAffectationIdTypeAffectationPurchase Foreign Key(idTypeAffectationPurchase) References TypeAffectation(id)
) Engine=InnoDB;

Create Table Sale(
    id                          Int(255) Auto_Increment Not Null,
    idVoucherType               Int(255) Not Null,
    series                      VarChar(5) Not Null,
    number                      VarChar(8) Not Null,
    idEstablishment             Int(255) Not Null,
    idOperationType             Int(255) Not Null,
    idCurrency                  Int(255) Not Null,
    exchangeRate                Decimal(5, 3) Not Null,
    idClient                    Int(255) Not Null,
    purchaseOrder               VarChar(20) Not Null,
    issueDate                   Date Not Null,
    dueDate                     Date Not Null,
    idWarehouse                 Int(255) Not Null,
    paymentStatus               Char(1) Not Null Comment 'P: Pendiente, C: Cancelado',
    additionalInformation       VarChar(250) Not Null,
    idPriceList                 Int(255) Not Null,
    totalTaxBase                Decimal(15, 2) Not Null,
    totalAffection              Decimal(15, 2) Not Null,
    total                       Decimal(15, 2) Not Null,
    idAction                    Int(255) Not Null,
    Constraint PKSale Primary Key(id),
    Constraint FKSaleVoucherType Foreign Key(idVoucherType) References VoucherType(id),    
    Constraint FKSaleEstablishment Foreign Key(idEstablishment) References Establishment(id),
    Constraint FKSaleOperationType Foreign Key(idOperationType) References OperationType(id),
    Constraint FKSaleCurrency Foreign Key(idCurrency) References Currency(id),
    Constraint FKSaleClient Foreign Key(idClient) References Client(id),
    Constraint FKSaleWarehouse Foreign Key(idWarehouse) References Warehouse(id),
    Constraint FKSalePriceList Foreign Key(idPriceList) References PriceList(id),
    Constraint FKSaleAction Foreign Key(idAction) References Action(id)
) Engine=InnoDB;

Create Table SaleDetail(
    id                          Int(255) Auto_Increment Not Null,
    idSale                      Int(255) Not Null,
    idProduct                   Int(255) Not Null,
    idTypeAffectation           Int(255) Not Null,
    indICBPER                   TinyInt Not Null,
    quantity                    Decimal(15, 2) Not Null,
    unitPrice                   Decimal(15, 5) Not Null,
    totalPrice                  Decimal(15, 5) Not Null,
    Constraint PKSaleDetail Primary Key(id),
    Constraint FKSaleDetailSale Foreign Key(idSale) References Sale(id),
    Constraint FKSaleDetailProduct Foreign Key(idProduct) References Product(id),
    Constraint FKSaleDetailTypeAffectation Foreign Key(idTypeAffectation) References TypeAffectation(id)
) Engine=InnoDB;