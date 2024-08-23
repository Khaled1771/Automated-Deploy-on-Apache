def build() {
    echo "Building the app"
}

def test() {
    echo "Testing the app"
}

def deploy() {
    echo "Deploying the app"
    echo "Deploying verion ${params.VERSION}"
}

return this
