.PHONY: update-all
update-all:
	ansible-playbook ./playbooks/apt.yml --user p0ir0t --ask-pass --ask-become-pass -i ./inventory/hosts

.PHONY: setup-timezone
setup-timezone:
	ansible-playbook ./playbooks/timezone.yml --user p0ir0t --ask-pass --ask-become-pass -i ./inventory/hosts

.PHONY: install-docker
install-docker:
	ansible-playbook ./playbooks/docker.yml --user p0ir0t --ask-pass --ask-become-pass -i ./inventory/hosts

.PHONY: install-debug-tools
install-debug-tools:
	ansible-playbook ./playbooks/debug-tools.yml --user p0ir0t --ask-pass --ask-become-pass -i ./inventory/hosts

.PHONY: install-kind
install-kind:
	ansible-playbook ./playbooks/kind.yml --user p0ir0t --ask-pass --ask-become-pass -i ./inventory/hosts
