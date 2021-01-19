resource "aws_db_subnet_group" "mariadb-subnet" {
    name = "mariadb-subnet"
    description = "Terraform Generated subnet group"
    subnet_ids = [aws_subnet.app-private-1.id,aws_subnet.app-private-2.id]
}
resource "aws_db_parameter_group" "mariadb-parameters" {
    name = "mariadb-parameters"
    family = "mariadb10.4"
    description = "mariadb parameter group"
    parameter {
        name = "max_allowed_packet"
        value = "16777216"
    }
}

resource "aws_db_instance" "mariadb" {
    allocate_storage = 100
    engine = "mariadb"
    engine_version = "10.4.8"
    instance_class = "db.t2.micro"
    identifier = "mariadb"
    name = "mariadb"
    username = "root"
    password = var.RDS_PASSWORD
    db_subnet_group = aws_db_subnet_group.mariadb-subnet.name
    parameter_group_name = aws_db_parameter_group.mariadb-parameters.name
    vpc_security_ids = [aws_security_group.allow-mariadb.id]
    storage_type = gp2
    backup_retention_period = 7
    skip_final_snapshot = true
    tags = {
        Name = "gopal-mariadb-instance"
    }
}