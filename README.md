# AWS EC2 Pages

## Acknowledgements

This is a [LEAN**STACKS**](http://www.leanstacks.com) solution.

## Getting Started

This project contains simple HTML pages which radiate information about the Amazon Web Services (AWS) Elastic Compute Cloud (EC2) instance to which they are deployed. Useful for simple status checks, prototyping, or as an AWS learning tool.  

## Languages

This project is authored in HTML, CSS, and JavaScript. It utilizes the Bootstrap CSS framework and AngularJS JavaScript framework.

## Installation

### Fork the Repository

Fork the [AWS EC2 Pages](https://github.com/leanstacks/aws-ec2-pages) GitHub repository.  Clone the forked project to the host machine.

### Dependencies

The project requires the following dependencies be installed on the host machine:

* Node.js (node)
* Node Package Manager (npm)
* Gulp Command Line Interface (gulp)

After installing the dependencies, initialize the project.  Open a terminal window, navigate to the project base directory, and issue this command:

```
npm install
```

The node package manager, a.k.a. `npm` retrieves all project dependencies, installing them into the `/node_modules` sub-directory.

## Running

The project uses [Gulp](http://gulpjs.com) for build, package, and test workflow automation.  The following Gulp tasks are defined.

### Default

The default Gulp task performs the following workflow steps:

* cleans the distribution directory
* copies the HTML to the distribution directory

To execute the default Gulp task, type the following command at a terminal prompt in the project base directory.

```
gulp
```

### Run

The **run** Gulp task performs all of the same workflow steps as the default task and also:

* watches source directories for changes
* republishes source files to the distribution directory when changes occur
* starts a HTTP server on the local host
* reloads the index HTML page when changed source files are republished

The **run** Gulp task is designed to allow engineers the means to rapidly make application changes on their local machines.  This task is not intended for use in a server environment.

To execute the **run** Gulp task, type the following command at a terminal prompt in the project base directory.

```
gulp run
```

Open a browser and go to http://localhost:9000/index.html to use the application.

To stop the HTTP server press `ctrl-C` in the terminal window.

### Dist

The **dist** Gulp task performs all of the same workflow steps as the default task and also:

* creates a single, compressed distribution file suitable for server deployment

The **dist** Gulp task is designed to allow development operations, a.k.a. DevOps, staff the means to produce an application artifact prepared for server deployment.

To execute the **dist** Gulp task, type the following command at a terminal prompt in the project base directory.

```
gulp dist
```
