## Foundry

**GoalsnAssists_Table is a smart contract that enables users to store names of footballers, the number of goals they have scored, the number of assists they have made, etc.**

GoalsnAssists_Table contains:

-   **Player**: Struct that contains elements for details input.
-   **listOfPlayers**: Public array that will contain list of players and their details.
-   **nameToGoals**: Public mapping of name of player to goals scored.
-   **nameToAssists**: Public mapping of name of player to assists made

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
