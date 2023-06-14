1. In Windows Terminal, execute

```powershell
ssh-keygen -t ed25519 -C "email@gmail.com
```

2. Go to your Github account and in settings add the public key the above command generated (which is located in `%userprofile%.ssh`)

3. Make sure all is good by running the following (`ssh` will also remember this address if successful, which `git` can later interface with)

```powershell
ssh -i path/to/ssh/private/key -T git@github.com
```

4. If you added a password to your private key, you can configure Windows Terminal to always remember it by running

```powershell
ssh-add path/to/ssh/private/key
```

5. Now close and reopen Terminal, and see if 

```powershell
ssh -T git@github.com
```

works without supplying a password


[this](https://interworks.com/blog/2021/09/15/setting-up-ssh-agent-in-windows-for-passwordless-git-authentication/) was very helpful in the making of this
