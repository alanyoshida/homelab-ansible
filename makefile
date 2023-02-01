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

.PHONY: install-goat
install-goat:
	ansible-playbook --user p0ir0t --private-key ~/.ssh/id_rsa \
	./playbooks/apt.yml \
	./playbooks/debug-tools.yml \
	./playbooks/docker.yml \
	./playbooks/kind.yml \
	./playbooks/k8s-goat.yml \
	-i ./inventory/hosts

.PHONY: apply-goat
apply-goat:
	ansible-playbook --user p0ir0t --private-key ~/.ssh/id_rsa \
	./playbooks/k8s-goat.yml \
	-i ./inventory/hosts

.PHONY: install-k8s-master
install-k8s-master:
	ansible-playbook --user p0ir0t --private-key ~/.ssh/id_rsa --ask-become-pass \
	./playbooks/k8s-master.yml \
	-i ./inventory/hosts -l k8s-master

.PHONY: install-k8s-node
install-k8s-node:
	ansible-playbook --user p0ir0t --private-key ~/.ssh/id_rsa --ask-become-pass \
	./playbooks/k8s-node.yml \
	-i ./inventory/hosts -l k8s-node

.PHONY: install-k8s-master-cilium
install-k8s-master-cilium:
	ansible-playbook --user p0ir0t --private-key ~/.ssh/id_rsa --ask-become-pass \
	./playbooks/k8s-master-cilium.yml \
	-i ./inventory/hosts -l k8s-master-cilium

.PHONY: install-k8s-node-cilium
install-k8s-node-cilium:
	ansible-playbook --user p0ir0t --private-key ~/.ssh/id_rsa --ask-become-pass \
	./playbooks/k8s-node-cilium.yml \
	-i ./inventory/hosts -l k8s-node-cilium