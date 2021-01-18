# nat gw
resource "aws_eip" "nateip" {
    vpc = true
}
resource "aws_nat_gateway" "nat-gw" {
    allocation_id = aws_eip.nateip.id
    subnet_id = aws_subnet.app-public-1.id
    depends_on = [aws_internet_gateway.main-gw]
}

#vpc setup for nat
resource "aws_route_table" "main-private" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat-gw.id
    }
    tags = {
        Name = "main-private-1"
    }
}

resource "aws_route_table_association" "main-private-1" {
    subnet_id = aws_subnet.app-private-1.id
    route_table_id = aws_route_table.main-private.id
}
resource "aws_route_table_association" "main-private-2" {
    subnet_id = aws_subnet.app-private-2.id
    route_table_id = aws_route_table.main-private.id
}
resource "aws_route_table_association" "main-private-3" {
    subnet_id = aws_subnet.app-private-3.id
    route_table_id = aws_route_table.main-private.id
}
