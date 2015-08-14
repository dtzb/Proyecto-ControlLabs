<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gestionlaboratorios.aspx.cs"
	Inherits="MonitorEquipos.modulos.gestionlaboratorios" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Gesti&oacute;n de Profesores</title>

	<link type="text/css" rel="stylesheet" href="../css/materialize.min.css" media="screen,projection" />
	<link rel="stylesheet" href="../css/font-awesome.min.css">
	<script src="../js/jquery-2.1.4.min.js"></script>
	<script src="../js/materialize.min.js"></script>
	<script>
	$(document).ready(function(){

		$('#btn-agregar, .btn-editar, .btn-borrar').on('click',function(){
			var modal_element = $(this).attr("href") || '#' + $(this).data('target');
			var accion = $(this).attr('data-accion');
			var id = $(this).attr('data-lab-id');

			$('#form_accion').val( accion );
			if(accion == "editar"){
				$.getJSON('./data.laboratorios.aspx?get='+id,function(data){
					$.each(data,function(key,value){
						var field = $('#form_'+key);
						if(field.get(0)) field.val(value);
					});
			        $(modal_element).openModal(options);
				}
			}else if(accion == "nuevo"){
				$(modal_element).openModal(options);
			}else if(accion == "borrar"){
				alert("borrar");
			}
			e.preventDefault();
		});
	});

	</script>
</head>
<body>

	<main>
		<div class="container">
			<!-- .row>h1.col.s12{Gesti&oacute;n de Profesores} -->
			<div class="row">
				<div class="col s1 offset-s11">
					<a id="btn-agregar"	data-target="popup-formulario" class="btn-floating btn-large waves-effect waves-light red" data-accion="agregar">
						<i class="fa fa-plus"></i>
					</a>
				</div>
			</div>
			<div class="row">
				<!-- <h3 class="col s12">Gesti&oacute;n de Profesores</h3> -->
				<form id="form1" runat="server">
				<asp:GridView ID="GridView1" 
					class="centered hoverable" 
					runat="server" AllowPaging="True"
					AutoGenerateColumns="False" 
					DataKeyNames="id" 
					DataSourceID="SqlDataSource1"
					OnRowDataBound="GridView1_RowDataBound"
				>
					<Columns>
						<asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="id" />
						<asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
						<asp:TemplateField HeaderText="Estado">
							<ItemTemplate>
								<div class="switch">
									<label>
										Off
										<asp:CheckBox runat="server" ID="Estatus" OnDataBinding="EstatusColumn_DataBinding" />
										<span class="lever"></span>
										On
									</label>
								</div>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Editar">
							<ItemTemplate>
								<a class="waves-effect waves-green accent-3 btn-flat btn-editar" data-target="popup-formulario" data-lab-id='<%# Eval("Id")%>' data-accion="editar">
									<i class="fa fa-pencil"></i>
								</a>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Editar">
							<ItemTemplate>
								<a class="waves-effect waves-green accent-3 btn-flat btn-borrar" data-lab-id='<%# Eval("Id")%>'>
									<i class="fa fa-pencil"></i>
								</a>
							</ItemTemplate>
						</asp:TemplateField>

					</Columns>
				</asp:GridView>
				<asp:SqlDataSource 
					ID="SqlDataSource1" 
					runat="server" 
					ConnectionString="<%$ ConnectionStrings:ProyectoDTConnectionString %>"
					DeleteCommand="DELETE FROM [Laboratorios] WHERE [id] = @id" InsertCommand="INSERT INTO [Laboratorios] ([id], [Nombre], [Estado]) VALUES (@id, @Nombre, @Estado)"
					SelectCommand="SELECT * FROM [Laboratorios]" UpdateCommand="UPDATE [Laboratorios] SET [Nombre] = @Nombre, [Estado] = @Estado WHERE [id] = @id"
				>
					<DeleteParameters>
						<asp:Parameter Name="id" Type="String" />
					</DeleteParameters>
					<InsertParameters>
						<asp:Parameter Name="id" Type="String" />
						<asp:Parameter Name="Nombre" Type="Int32" />
						<asp:Parameter Name="Estado" Type="Int32" />
					</InsertParameters>
					<UpdateParameters>
						<asp:Parameter Name="Nombre" Type="Int32" />
						<asp:Parameter Name="Estado" Type="Int32" />
						<asp:Parameter Name="id" Type="String" />
					</UpdateParameters>
				</asp:SqlDataSource>
				</form>
			</div>
			
		</div>
	</main>
	<div id="popup-formulario" class="modal modal-fixed-foote">
		<div class="modal-content">
			<h4 id="popup-formulario-titulo"></h4>
			<!-- .row>form[action=""].col.s12>(div.input-field.col.s6>input#id[name="id"][placeholder="pch"][type=text].validate+label[for="id"]{"pch"}) -->
			<div class="row">
				<form action="./data.laboratorios.aspx" class="col s12" method="POST" id="crud-form">
					<input type="hidden" 	id="form_accion" 	name="accion" 			value="">
					<input type="hidden" 	id="form_id" 		name="id" 				value="">
					<div class="input-field col s6">
						<input type="text" id="form_Nombre" name="field_Nombre" value="" placeholder="Nombre" class="validate">
						<label for="fomr_Nombre">"Nombre"</label>
					</div>
				</form>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#!" class="modal-action modal-close waves-effect waves-red btn-flat">Cancelar</a>
			<a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Guardar</a>
		</div>
	</div>
	
</body>
</html>
