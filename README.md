# Not-Axiom
Not-Axiom is a systems administration tool for individuals to self-manage \*nix systems over SSH. 

Not-Axiom uses tailscale so that hosts can be behind a NAT.

Users must modify the `not-axiom.sh` script to gain full functionality, users must also provision their own hosts with the code that they want to run.

# Provision.sh
Users can provision using Tailscale pre-authentication keys, these keys can be placed into the provision

# Usage
Setup tailscale on both the host, generate a pre-auth key, then run the `provision.sh` script on each box you want to be a node, ensure the hostnames are sequential (prefix01, prefix02 etc). 

Once provisioned, and SSH access is configured, you can start using not-axiom!

```
./not-axiom.sh '<command to execute>'
```

# Moving files back and forth
You must implement that yourself, using rsync or scp. Not-axiom is only for executing commands in parallel using interlace. 
