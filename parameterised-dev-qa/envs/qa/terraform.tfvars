env            = "qa"
ami            = "ami-0c55b159cbfafe1f0"
instance_type  = "t3.micro"
# subnet_id      = "subnet-0123456789abcdef"
user_data      = file("user_data.sh")

bucket_name    = "my-qa-bucket996699"
secret_name    = "qa-db-password"
secret_value   = "SuperSecret123!"
