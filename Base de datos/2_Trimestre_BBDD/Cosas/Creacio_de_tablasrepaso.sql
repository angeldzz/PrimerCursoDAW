Creacio de tablas 
create table localidad(
cod_localidad number primary key not null,
nombre varchar2(25) not null
);

create table PUB(
cod_pub number primary key not null,
nombre varchar2(35) not null,
licencia_fiscal varchar2(255) not null,
domicilio varchar2(255),
fecha_apertura date not null,
horario varchar2(5) CHECK (horario IN ('HOR1', 'HOR2', 'HOR3')) not null,
cod_localidad number not null,
foreign key (cod_localidad) references localidad(cod_localidad) 
);

create table titular(
dni_titular varchar2(9) primary key not null,
nombre varchar2(255) not null,
domicilio varchar2(255),
cod_pub number not null,
foreign key (cod_pub) references PUB(Cod_pub)
);

create table empleado(
dni_empleado varchar2(9) primary key not null,
nombre varchar2(255) not null,
domicilio varchar2(255) 
);

create table existencias(
cod_articulo number primary key not null,
nombre varchar2(255) not null,
cantidad number not null,
precio number check ( precio > 0) not null,
cod_pub number not null,
foreign key (cod_pub) references PUB(cod_pub)
);

create table PUB_EMPLEADO(
cod_pub number not null,
dni_empleado varchar2(9) not null,
funcion varchar2(255) check (funcion IN ('CAMARERO','SEGURIDAD','LIMPIEZA')) not null,
primary key(cod_pub, dni_empleado),
foreign key (cod_pub) references PUB(cod_pub),
foreign key (dni_empleado) references empleado(dni_empleado)
);


create table medico(
codigo_medico int primary key,
nombre varchar2(25),
apellidos varchar2(25)
);

create table paciente(
codigo_paciente int primary key,
nombre varchar2(25),
apellidos varchar2(25)
);

create table ingreso(
codigo_ingreso int primary key,
codigo_medico int,
codigo_paciente int,
habitacion int,
fecha date,
foreign key (codigo_medico) references medico(codigo_medico),
foreign key (codigo_paciente) references paciente(codigo_paciente)
);