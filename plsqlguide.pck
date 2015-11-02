create or replace package plsqlguide is

-- Author  : Jared Petersen
-- Created : 9/22/2015 12:26:22 AM
-- Purpose : Basic PLSQL template/guide
 
/* Procedures */
procedure p_main;

procedure p_new_item;

end plsqlguide;
/
create or replace package body plsqlguide is

/* Main entry point (homepage) */
procedure p_main
	is
begin

htp.prn('
	<!DOCTYPE html>
		<html lang="en">
		<head>
			<meta charset="utf-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
			<title>PL/SQL Sample Application</title>

			<!-- Bootstrap -->
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

			<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
			<!--[if lt IE 9]>
				<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
				<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
			<![endif]-->
		</head>
		<body>
			<!-- Static navbar -->
			<nav class="navbar navbar-default navbar-static-top">
				<div class="container">
					<div class="navbar-header">
						<a class="navbar-brand" href="#">PL/SQL Sample Application</a>
					</div>
				</div>
			</nav>

			<div class="container">
				<p>
					<a href="jpetersen11.plsqlguide.p_new_item">
						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> <strong>New Item</strong>
					</a>
				</p>
				<table class="table table-bordered">
					<tr>
						<th>#</th>
						<th>Name</th>
						<th>Description</th>
						<th>Quantity</th>
						<th>Price</th>
					</tr>
');

-- Fill out the parts table
for row in (select * from parts) loop
	htp.prn('
						<tr>
							<td>'||row.pid||'</td>
							<td>'||row.name||'</td>
							<td>'||row.description||'</td>
							<td>'||row.quantity||'</td>
							<td>'||row.price||'</td>
						</tr>
	');
end loop;
				
htp.prn('
    		</table>
			</div> <!-- /container -->

			<!-- jQuery (necessary for Bootstrap''s JavaScript plugins) -->
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
			<!-- Include all compiled plugins (below), or include individual files as needed -->
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		</body>
	</html>
');
	
end p_main;

/* Main entry point (homepage) */
procedure p_new_item
	is
begin
	
htp.prn('
	<!DOCTYPE html>
		<html lang="en">
		<head>
			<meta charset="utf-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
			<title>PL/SQL Sample Application</title>

			<!-- Bootstrap -->
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

			<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
			<!--[if lt IE 9]>
				<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
				<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
			<![endif]-->
		</head>
		<body>
		
			<!-- Static navbar -->
			<nav class="navbar navbar-default navbar-static-top">
				<div class="container">
					<div class="navbar-header">
						<a class="navbar-brand" href="#">PL/SQL Sample Application</a>
					</div>
				</div>
			</nav>

			<div class="container">
				<h4><strong>New Item</strong></h4>
				<form action="jpetersen11.insert_item" method="post">
					<input type="text" class="form-control" placeholder="Product Number"><br />
					<input type="text" class="form-control" placeholder="Name"><br />
					<input type="text" class="form-control" placeholder="Description"><br />
					<input type="text" class="form-control" placeholder="Quantity"><br />
					<div class="input-group">
						<span class="input-group-addon">$</span>
						<input type="text" class="form-control" placeholder="Price">
					</div><br />
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
			</div>
		
		</body>
	</html>
');
	
end p_new_item;

begin
  -- Initialization
  null;
end plsqlguide;
/
