resource "aws_iam_user" "my-user" {
    for_each = toset(["Tmahesh","Tvohra","Tthomas","YHonda"])
    name = each.key

}
