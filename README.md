# Ubuntu-setup

**This can help to tune vps server and install most needed packages.**

# Usage

**Create new user**

```console
adduser USERNAME && usermod -aG sudo USERNAME && su - USERNAME
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
cd ubuntu-setup && sudo bash main.sh
```
