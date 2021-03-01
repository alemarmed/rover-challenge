# Rovers on Mars

## Install

```
bin/setup
```

## Run tests

```
rake test
```

## Deploy mission
To start exploring Mars just run:
```
bin/mission
```

Then you an specify plateau right corner position, and the initial status
for each Rover followed by a sequence of commands to move the robot. Example:
```
5 5
1 2 N
L M L M L M L M M
3 3 E
M M R M M R M R R M
<Cntrl> + <D>
```
