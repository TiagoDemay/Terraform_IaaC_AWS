import subprocess
import re
import base64
import gnupg


if __name__ == "__main__":
    cp = subprocess.run(['terraform', 'output'], capture_output=True)

    out = cp.stdout.decode('ascii')
    exec(out)

    pass64enc = [base64.b64decode(p) for p in password]
    with open('b64py', 'wb') as f:
        f.write(pass64enc[0])
    
    gpg = gnupg.GPG(gnupghome='/root/.gnupg')
    usernames = [usr.split(':')[5].split('/')[2] for usr in arn_user]
    acc_number = [usr.split(':')[4] for usr in arn_user]
    password = [
        str(gpg.decrypt(pw, passphrase='terraform', always_trust=True))
        for pw in pass64enc
    ]

    instancias = zip(usernames, password, acc_number, instance_id)
    print('\n'.join((','.join(l) for l in instancias)))