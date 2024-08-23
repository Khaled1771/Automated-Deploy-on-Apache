def gv

pipeline{

    agent any

    environment{ //enviornment variables
        NEW_VERSION = '1.3.0'
        SERVER_CREDENTIALS = credentials('github')
    }

    tools{ //to integration jenkins with build tools like : mave,gradle and jdk
        maven 'Maven-3.9.9'
    }

    parameters{ //external configurations
        choice(name: 'VERSION', choices: ['1.1.0', '1.2.0', '1.3.0'], description: '')
        booleanParam(name: 'executeTests', defaultValue: true, description: '')
    }

    stages{
        stage("init"){
            steps{
                script{
                    gv = load "script.groovy"
                }
            }
        }
        stage("Build"){
            steps{
                scrpit{
                    gv.Build()
                }
                // echo "Building the app"
                // echo "Building version ${NEW_VERSION}"
                // sh "mvn install"
            }
        }

        stage("Test"){
            when{
                expression{
                    params.executeTests
                }
            }
            steps{
                script{
                    gv.Test()
                }
                //echo "Testing the app"
            }
        }

        stage("Deploy"){
            steps{
                script{
                    gv.Deploy()
                }
                // echo "Deploying the app"
                // echo "Deploying verion ${params.VERSION}"
                // echo "Deploying with ${SERVER_CREDENTIALS}"
                // sh "${SERVER_CREDENTIALS}"
            }
        }
    }
}
