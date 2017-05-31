# Genetic Algorithms
TP3 for Artificial Intelligence Systems course from I.T.B.A.

## Documentation
Project related documents can be found at the `docs` folder.

## Pre-requisites
Add the `src` folder & subfolders to the Matlab path.

## Configuration
Change the `src/get_config.m` file with desired parameters. This file contains all the necessary comments so as to know what they mean and how they will affect the algorithm.

Please consider editing any necessary variable, specially the ones at the `folders` and `items_files` sections.

### Items location
You should put any desired item file inside a configurable folder (see the `src/get_config.m`). The current default where you can save your items files is the `items` folder.

## Usage
Once you have configure the desired paramters **and located the items files inside the corresponding folder**, you can use the program in different ways.

### Run new population
A new population is generated (using the current configuration variables) and a new plot arise (all previous plots are closed) showing statistical data of this run.
To make this, just run

    new

### Save and exit
With the plot on focus, press the `q` key of your keyboard to stop the run, save it and finish gracefully. **You can then update any desired configuration variable** and then use the `cont` script.

If you want to continue using the same plot, please bare in mind not closing the current one.

#### Important
Finish functions like `max_fitness_stucked` and `population_stucked` are only prepared to run from the generation 0 and its parameters should not be changed after stopping an execution. You should neither replace any finish function with the two mentioned before, for the same reason.

### Continue with the previous execution
After you have configured your new variables, you can go on with your previous execution by running

    cont

### Restore saved data
If the algorithm has finished or you have stopped it, all data is outputted to the specified output folder (configured in the `src/get_config.m` file). If you back up all these files, and you want to run them (from where you left it), just put those files again in the output folder and run

    restore

This loads all the saved data.
Then you can continue the run as it was specified above.
**Please take into consideration that a new plot will be used**, because the previous one cannot be used anymore - it's just there to display the previous run information.

## Authors
This project is written and maintained by

- [Matías Nicolás Comercio Vázquez](https://github.com/MatiasComercio)
- [Gonzalo Ibars Ingman](https://github.com/gibarsin)
- [Matías Mercado](https://github.com/MatiasMercado)
- [Juan Moreno](https://github.com/jpmrno)

## License
    MIT License

    Copyright (c) 2017
      - Matías Nicolás Comercio Vázquez <mcomerciovazquez@gmail.com>
      - Gonzalo Ibars Ingman <gibarsin@itba.edu.ar>
      - Matías Mercado <mmercado@itba.edu.ar>
      - Juan Moreno <jpmrno@itba.edu.ar>

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
