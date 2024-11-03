use clinicasCR;


-- -------------------------------------
-- Create primaries keys
-- -------------------------------------
alter table Afiliado add constraint pk_Afiliado primary key(numafil);
alter table Canton add constraint pk_Canton primary key(provincia, ID);
alter table catDrogas add constraint pk_catDrogas primary key(ID);
alter table Clinica add constraint pk_Clinica primary key(ID);
alter table DetaRece add constraint pk_DetaRece primary key(numreceta, farmaco);
alter table detaSolicitud add constraint pk_detaSolicitud primary key(numSolicitud, farmaco);
alter table Distribuida add constraint pk_Distribuida primary key(idProveedor, idFarmaco);
alter table Distrito add constraint pk_Distrito primary key(ID, canton,	provincia);
alter table Inventario add constraint pk_Inventario primary key(clinica, farrmaco);
alter table Medicamentos add constraint pk_Medicamentos primary key(ID);
alter table ordDetalle add constraint pk_ordDetalle primary key(numOrden, farmaco);
alter table ordenCompra add constraint pk_ordenCompra primary key(numOrden);
alter table Pais add constraint pk_Pais primary key(id);
alter table Proveedor add constraint pk_Proveedor primary key(id);
alter table Provincia add constraint pk_Provincia primary key(ID);
alter table Receta add constraint pk_Receta primary key(numreceta);
alter table soliFarmacos add constraint pk_soliFarmacos primary key(numSolicitud);
alter table soliOrden add constraint pk_soliOrden primary key(ordenCompra, ordenSolicitud);
alter table tipoSangre add constraint pk_tipoSangre primary key(id);


-- -------------------------------------
-- Create foreigns keys
-- -------------------------------------
alter table Afiliado add constraint fk_afilClinica foreign key(clinica) 
references Clinica (ID);

alter table Afiliado add constraint fk_afilDistrito foreign key(distrito, canton, provincia)
references Distrito (ID, canton, provincia);

alter table Afiliado add constraint fk_afilSangre foreign key(sangre)
references tipoSangre (id);

alter table Canton add constraint fk_canProvi foreign key(provincia)
references Provincia (ID);

-- falta
alter table Clinica add constraint fk_cliCanton foreign key(provincia, canton)
references Canton (provincia, ID);

alter table detaSolicitud add  constraint fk_detaSolicitud foreign key(numSolicitud)
references soliFarmacos (numSolicitud);

alter table detaSolicitud add constraint fk_soliFarmaco foreign key(farmaco)
references Medicamentos (ID);

alter table Distribuida add constraint fk_distFarmaco foreign key(idFarmaco)
references Medicamentos (ID);

alter table Distribuida add constraint fk_distProveedor foreign key(idProveedor)
references Proveedor (id);

-- falta
alter table Distrito add constraint fk_disCanton foreign key(provincia, canton)
references Canton (provincia, ID);

alter table Inventario add constraint fk_invClinica foreign key(clinica)
references Clinica (ID);

alter table Inventario add constraint fk_invFarmaco foreign key(farrmaco)
references Medicamentos (ID);

alter table Medicamentos add constraint fk_medDroga foreign key(categoria)
references catDrogas (ID);

alter table ordDetalle add constraint fk_ordCompra foreign key(numOrden)
references ordenCompra (numOrden);

alter table ordDetalle add constraint fk_ordFarmaco foreign key(farmaco)
references Medicamentos (ID);

alter table ordenCompra  add constraint fk_ordProveedor foreign key(proveedor)
references Proveedor (id);

alter table Proveedor add constraint fk_proPais foreign key(pais)
references Pais (id);

alter table Receta  add constraint fk_recAfiliado foreign key(paciente)
references Afiliado (numafil);

alter table soliOrden add constraint fk_ordSolicitud foreign key(ordenSolicitud)
references soliFarmacos (numSolicitud);

alter table soliOrden add constraint fk_soliOrden foreign key(ordenCompra)
references ordenCompra (numOrden);

