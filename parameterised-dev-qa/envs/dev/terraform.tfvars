env            = "dev"
ami            = "ami-0c55b159cbfafe1f0"
instance_type  = "t3.micro"
# subnet_id      = "subnet-0123456789abcdef"
user_data      = file("user_data.sh")

bucket_name    = "my-dev-bucket996699"
secret_name    = "dev-db-password"
secret_value   = "SuperSecret123!"
