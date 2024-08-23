def Build() {
    echo "Building the app"
}

def Test() {
    echo "Testing the app"
}

def Deploy() {
    echo "Deploying the app"
    echo "Deploying verion ${params.VERSION}"
}

return this
