# Script Management

Using NixOS-Compose, there is multiple ways to create scripts that will be executed by one or several roles in the composition.
It is important to understand all the possibilities when it come to creating script because there are very different from each other in the way they are launched and the uses they have.

There are 4 main way to incorpore scripts into NixOS-Compose Composition :
- [[#Activation Script|Activation Script]]
- [[#Systemd Services|Systemd Services]]
- [[#Script Binary Packaging|Script Binary Packaging]]
- [[#Initrd|Initrd]]

---
## Activation Script

### Uses

Activation scripts are a very specific way to create scripts for NixOS-Compose compositions. It is mainly used as a way to initiate data that will be used in the future. For instance, it can be used to initialize needed services or databases. 

Activation scripts are executed in the second phase (starting the virtual machine) and are executed even **before systemd services**. 
Make sure, if you are using an activation script, that the modules you are initializing don't need systemd service in order to work.

### Pros

- We know "exactly" when the script will be launched
- Easy syntax
- Capable of using outside dependencies

### Cons

- Outside the systemd services scope
- Cannot chose the order for which multiple activation scripts execute

### Syntax

```python
system.activationScripts = {
	name = {
		text = "my script here";
		deps = [ my_depedencies_here ];
	};
};
```

### Example

An example of activation script can be found in the k3s repository : [here](https://github.com/oar-team/k3s-nixos-compose/blob/main/nxc/composition.nix)

---
## Systemd Services

### Uses

Systemd services are rather straightforward, and in my opinion, the most common and useful way to create basic scripts to be launched in NixOS-Compose compositions. The goal is to create a systemd script to be executed. It is possible with this approach to choose after which services the script must be executed (using the `requires`, `wantedBy`, and `after` parameters).

It is also possible to use a systemd script to specify the type of service we want to choose, thanks to the `serviceConfig.Type` parameter.

- oneshot: the script is executed once regardless of the result, success, or failure.
- `Restart = ""`: the script is restarted based on the `RestartSec=""` parameter.
- ...

### Pros

- Easily and strongly modulable
- Powerful and fast
- Capable of easily adding dependencies
- Capable of choosing the order of execution

### Cons

- Can't know for sure when it will be initialized
- Can cause systemd synchronization problems

### Syntax

```python
systemd.services.name = {
	wantedBy = [ services_that_uses_this_service ];
	requires = [ services_you_need ];
	after = [ services_that_need_to_be_executed_before ];
	serviceConfig.Type = "oneshot";
	script = ''
		my script here
	'';
};
```

or

```python
systemd.services.name = {
      wantedBy = [ services_that_uses_this_service ]; 
      after = [ services_that_need_to_be_executed_before ];
      description = "my service description here";
      serviceConfig = {
        Type = "forking";
        User = "username";
        ExecStart = ''my script here'';         
        ExecStop = '' my script here'';
      };
```

### Example

Many examples of systemd services can be found , here is some exemples:
- [beegfs](https://gitlab.inria.fr/nixos-compose/hpc-io/beegfs/-/blob/master/nxc/composition.nix)
- [ceph](https://gitlab.inria.fr/nixos-compose/hpc-io/ceph-fs/-/blob/main/nxc/common-config.nix)

---
## Script Binary Packaging

### Uses

Binary packing is a method of creating a script and packaging it as a binary for later use in the program. By creating a script in this way, it is possible to use them as systemPackages.

It is possible to create both bash or python packages. This approach is mainly used when it is necessary to create a variety of different bash or python functions that can be used by the user's configuration later.

### Pros

- Simple scripting
- Can be used by the user later
- Supports both Python and Bash
- Good for organizing files separately

### Cons

- Involves multiple steps to execute the script
- Complex structure

### Syntax

```python
my_var =
	pkgs.writeScriptBin "my _script_name" ''
		my script here
'';

######################################################

environment.systemPackages = [ my_var ]

```

### Example

A good exemple of the many uses of this technique can be found in the [orangefs](https://gitlab.inria.fr/nixos-compose/hpc-io/orangefs) repository

---
## Initrd

### Uses

Initrd Scripting is a unique and rather uncommon way of creating scripts for NixOS-Compose. It is the only way to create a script that will act in the first phase of the Virtual Machine (the initialization). It will launch a configuration even before systemd is started.

It is executed at the very start of the machine. The main use of this approach is to configure hardware of the machine, like the file systems or the network.

### Pros

- Good for very specialized scripting
- The only option for first-phase scripts

### Cons

- Impractical unless in specific cases
- Rather complicated to implement correctly

### Syntax

```python
boot.initrd.postDeviceCommands = ''
	my script here
'';
```

### Example

An exemple of initrd can be found in the [beegfs](https://gitlab.inria.fr/nixos-compose/hpc-io/beegfs/-/blob/master/nxc/composition.nix) repository.
