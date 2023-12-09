# RollDice

## Overview
RollDice is a Haskell-based command-line application for simulating dice rolls.
It interprets dice notation commonly used in tabletop games and RPGs (like
"3d6+1") and generates random dice roll outcomes based on this notation.

## Features
- Parses and interprets standard dice notation (e.g., "3d6", "2d8-1").
- Generates random outcomes for each dice roll using Haskell's `System.Random`
  library.
- Command-line interface for easy and quick usage.

## Getting Started

### Prerequisites
- GHC (Glasgow Haskell Compiler)
- `parsec` library for Haskell
- `random` library for Haskell

### Installation
Clone the repository and navigate to the project directory:

```bash
git clone https://github.com/janjegit/rolldice.git
cd rolldice
```

### Building the Project
If you are using Cabal, navigate to the project directory and use the following
commands:

Using Cabal:
```bash
cabal update
cabal build
```

### Usage
Run the program via the command line by passing the dice notation as an argument:

```bash
./rolldice 4d6+1
```

Replace `4d6+1` with your desired dice notation. The program supports the
following format:
- *n* d *d [+/-] m*
  - *n* : Number of dice
  - *d* : Number of sides per die
  - *+/-* : (Optional) Sign for the modifier
  - *m* : (Optional) Modifier value

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE)
file for details.
