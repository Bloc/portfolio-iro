pipeline {
    agent {
        docker { 
	    image 'jekyll/builder:latest' 
            args '--rm   --volume="$PWD:/srv/jekyll"   --publish [::1]:4000:4000'
            }
    }
    stages {
        stage('Test') {
            steps {
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

