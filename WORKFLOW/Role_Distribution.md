# Role Distribution

NixOS-Compose configuration is based on roles. A role is a description of a NixOS configuration. It is used to assign specific configurations to one or multiple nodes without having to recompile the entire program. The role distribution refers to the number of nodes allocated to each role. There are multiple ways to change the role distribution using NixOS-Compose, some of which are deprecated but enable tasks that would otherwise be impossible to achieve in the common way.

There are 3 major ways to change the role distributions:
- [[#Node.yaml|Node.yaml]]
- [[#RolesDistribution|RolesDistribution]]
- [[#Make Many|Make Many]]

---
## Node.yaml

### Uses

The node.yaml is the most common and recommended way to alter the role distribution. It allows you to change the number of nodes for each role without recompiling, as the file is used at the beginning of the composition with the command `nxc start node.yaml`. Note that the file can be named however you want.

In order for the file to work, you have to specify the name of the role, followed by a comma, and then the number of nodes you want to use for that role.

### Pros

- Easily changed
- Doesn't require recompilation
- Can be easily modified using a script

### Cons

- The roles are immutable
- Adds complexity to a program

### Exemple

```yaml
In the node.yaml :

server:2
client:4
```

---
## RolesDistribution

### Uses

RolesDistribution is a parameter that can be used to change the role distribution of the composition. It has to be used in the composition, so the program will have to be rebuilt if we want the values to be changed. It is a good way to set the value for roles that have a very specific number of nodes needed. It is also useful to use this approach for testing because of how easy it is to implement in the composition.

### Pros

- Easy to implement
- Good for simple testing

### Cons

- Not modifiable
- Requires rebuilding material

### Exemple

```python
rolesDistribution = { server = 2; client = 4; };
```

An exemple can be seen here : [ear](https://gricad-gitlab.univ-grenoble-alpes.fr/regale/tools/regale-nixos-compose/-/blob/main/ear/composition.nix)

---
## Make Many

### Uses

Make Many was the older way to create multiple nodes and change the role distribution. It can be implemented by importing the helpers parameter from NixOS-Compose. This approach of changing the role distribution is not optimal because it forces the user to change and thus recompile the program each time they want the value to change.

However, this method enables, through the way we give the parameters to the function, to make the roles slightly different from each other. It can be used, for instance, to generate roles that have different IDs from each other. This is something the other role distribution methods are unable to do.

### Pros

- Slightly modifiable
- Helper function available

### Cons

- Requires rebuilding material
- Harder to implement

### Exemple

```python
makeManyById = base_conf_by_id: name: count:
	let
        f = n: s:
        if n == 0 then
        s
        else
        f (n) (s // { "${name}${toString (n)}" = (base_conf_by_id (n)); });
    in
    f count { };


makeManyById my_role "name" number_of_node;
```

An exemple can be seen here : [ceph](https://gitlab.inria.fr/nixos-compose/hpc-io/ceph-fs/-/blob/main/nxc/composition.nix)
