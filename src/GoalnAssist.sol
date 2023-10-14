// SPDX-License-Identifier: MIT
pragma solidity >= 0.6.0 < 0.9.0;

// This is a smart contract that stores names of players,
// and the numer of goals and assists they have respectively.

contract GoalnAssist {
    struct Player {
        string name;
        string club;
        string position;
        uint256 goals;
        uint256 assists;
        uint256 matches;
    }

    // I am adding this to test the cast functionality in foundry
    string favPlayer;

    // array of players
    Player[] public listOfPlayers;

    // mapping of player to goals scored
    mapping(string => uint256) public nameToGoals;
    // mapping of player to assists made
    mapping(string => uint256) public nameToAssists;

    // function to add player to array
    function addPlayer(
        string memory _name,
        string memory _club,
        string memory _position,
        uint256 _goals,
        uint256 _assists,
        uint256 _matches
    ) public {
        // add each player to the array
        listOfPlayers.push(Player(_name, _club, _position, _goals, _assists, _matches));
        // mapping to return desired result
        nameToGoals[_name] = _goals;
        nameToAssists[_name] = _assists;
    }

    // function to know total number of players in the array
    function totalNumberOfPlayers() public view returns (uint256) {
        uint256 numberOfPlayers = listOfPlayers.length;
        return numberOfPlayers;
    }

    // function to remove player from array
    function removePlayer(string memory _name) public {
        // a check to ensure that the array is not empty
        require(listOfPlayers.length > 0, "There are no players in the list");
        uint256 playerIndex = 0;
        while (
            playerIndex < listOfPlayers.length
                && keccak256(abi.encodePacked(listOfPlayers[playerIndex].name)) != keccak256(abi.encodePacked(_name))
        ) {
            playerIndex++;
        }
        // check to ensure that the increment of 'playerIndex' doesn't the total number of players in 'listOfPlayers'
        // This ensures that the loop doesn't run for ever which could lead to gas issues
        require(playerIndex < listOfPlayers.length, "Player not found");
        // Swap the name of player to be deleted with the last name in the array
        listOfPlayers[playerIndex] = listOfPlayers[listOfPlayers.length - 1];
        // Remove the last name, thus removing the desired player
        listOfPlayers.pop();
        // Also delete from mappings
        delete nameToGoals[_name];
        delete nameToAssists[_name];
    }

    // function to get player with the highest number of goals
    function getTopScorer() public view returns (string memory topScorer, uint256 topScore) {
        for (uint256 i = 0; i < listOfPlayers.length; i++) {
            if (listOfPlayers[i].goals > topScore) {
                topScorer = listOfPlayers[i].name;
                topScore = listOfPlayers[i].goals;
            }
        }
        return (topScorer, topScore);
    }

    // function to get player with the highest number of assists
    function getTopAssister() public view returns (string memory topAssister, uint256 topAssist) {
        for (uint256 i = 0; i < listOfPlayers.length; i++) {
            if (listOfPlayers[i].assists > topAssist) {
                topAssister = listOfPlayers[i].name;
                topAssist = listOfPlayers[i].assists;
            }
        }
        return (topAssister, topAssist);
    }

    // function to set fav player.. added to test cast functionality in foundry
    function setFavPlayer(string memory _favPlayer) public {
        favPlayer = _favPlayer;
    }

    // function to get fav player.. added to test cast functionality in foundry
    function getFavPlayer() public view returns (string memory) {
        return favPlayer;
    }
}
