create table bank_info(
	name char(10), 
	number char(10), 
	address char(50), 
	primary key(name)
);


create table branch(
	bankName char(10), 
	branchId int unique, 
	branchName char(20), 
	address char(50), 	
	manager char(20), 
	employee_count int, 
	primary key(branchId),
	foreign key(bankName) references bank_info(name)
);


create table employee(
	Id char(10) unique, 
	name char(20),	
	`rank` char(10),
	workBranch int,
	manager char(20) default '팀장',
	primary key(Id),	
	foreign key(workBranch) references branch(branchId)	
);


create table client(
	clientId int auto_increment,
	name char(20), 
	phoneNumber char(20), 
	accountNo char(20), 
	accountPassword int default '1234', 
	residentNo char(20),
	primary key(clientId)	
);


create table transf(
	bankAccountNo int, 
	accountOwner int, 
	transfertype char(2), 
	transferBank char(10), 
	transferClientName char(20), 
	transferAccountNo int,
	primary key(bankAccountNo), 
	foreign key(accountOwner) references client(clientId)
);
