pipeline {
    agent {
        docker { 
	    image 'jekyll/builder:latest' 
            args '--rm --volume="$PWD:/srv/jekyll" --volume="$PWD/vendor/bundle:/usr/local/bundle" -u root:root'
            }
    }
    stages {
        stage('Test') {
            steps {
                sh 'export JEKYLL_VERSION=3.8'
                sh 'which jekyll && jekyll --version'
            }
        }
        stage('Build') {
            steps {
                sh 'jekyll build'
            }
        }
    }
}

