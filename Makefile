BOX_NAME=ispass-docker-tutorial

package:
	vagrant package --vagrantfile ${PWD}/Vagrantfile
	mv ${PWD}/package.box ${PWD}/${BOX_NAME}.box

up:
	vagrant up 

connect:
	vagrant up
	vagrant ssh

shutdown:
	vagrant halt

sublime3: 
	vagrant up
	vagrant ssh --command "/opt/sublime_text_3/sublime_text"
