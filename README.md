# Homelab Playbooks

## ping
`ansible -i ./inventory/hosts ubuntu -m ping --user p0ir0t --ask-pass`

`ansible-playbook ./playbooks/apt.yml --user p0ir0t --ask-pass --ask-become-pass -i ./inventory/hosts`
