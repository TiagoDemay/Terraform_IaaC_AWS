
resource "aws_iam_group" "group" {
    name       = "Alunos"
    path       = "/users/"  
}

resource "aws_iam_user" "user" {
    for_each = { for newuser in local.iams_keys : newuser.id_user => newuser}
    name       = each.value.name
    path       = "/system/"

    depends_on = [aws_iam_group.group]
}

resource "aws_iam_user_login_profile" "profile" {
    for_each = { for newuser in local.iams_keys : newuser.id_user => newuser} 
    user                     =  each.value.name               
    pgp_key                  =  var.pgp_key
    password_reset_required  =  true
    password_length          =  10
    depends_on   = [aws_iam_user.user]  
}


resource "aws_iam_user_group_membership" "add_user" {
    for_each = { for newuser in local.iams_keys : newuser.id_user => newuser}                
    user         =  each.value.name                            
    groups       = [aws_iam_group.group.name]
    depends_on   = [aws_iam_user.user]
}

resource "aws_iam_group_policy_attachment" "attach" {
    group       = aws_iam_group.group.name
    policy_arn  = data.aws_iam_policy.StartI.arn
}

resource "aws_iam_group_policy_attachment" "attach2" {
    group       = aws_iam_group.group.name
    policy_arn  = data.aws_iam_policy.ChangePass.arn
}




