TODO:
* Write the training algorithm (you'll then have a working perceptron!)
* Implement some persistence methods like saving and loading state from files
* Implement MLPs and different activation functions
* Expand project to cover genetic algorithms and ACO/PSO

To create a perceptron, wait until the next update! :)

Instantiate the class network.rb and specify
your perceptron diameters, the first argument as the number of inputs,
the second argument as the number of outputs, like this:

    network = Network.new(4, 2) # a 4-in 2-out perceptron

You then need to import a training set of data. The training set is a CSV
file (the format CSV is chosen so you can export from a spreadsheet).
In the case of a 4-in 2-out Single Layer Perceptron, you need to format the
CSV like this:

    input1,input2,input3,input4,output1,output2
		
An example:
    0.02,1,0.3,0.99,0,1

Where each delimited value is a floating-point number (or integer)
that corresponds to the respective input and output units.

To import the data, call

    network.import_data(path)

Where path is your data file, the path being relative to the network.rb file.

Train the network with:

    network.train!

Please bear with me while this is implemented.