# Ubuntu-setup

**This can help to tune ubuntu server and install most needed packages**

# Usage

**Create new user**

```console
username=enter_your_username
```

```console
adduser $username && usermod -aG sudo $username && su - $username
```

**Check git**

```console
git --version
```

**If git is not installed, install it**

```console
sudo apt update
```

```console
sudo apt install git
```

**Then**

```console
git clone https://github.com/andtxx/ubuntu-setup.git
```

```console
bash ubuntu-setup/main.sh
```

**Reopen terminal or run this to make node available**

```console
source .bashrc
```
