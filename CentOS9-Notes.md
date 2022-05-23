# Randome CentOS 9 Things I Found Useful

(Useful, not pretty.)

**What is the list of all groups that can be installed using the _yum_ module in Ansible?**

```bash
yum --hidden grouplist | grep -v ':' | sed 's/   //g' | xargs -d \\n yum --verbose groupinfo | grep Group-Id | sed 's/ Group-Id: //'
```

