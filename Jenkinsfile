pipeline {
    agent any

    stages {
        stage('Testing') {
            steps {
                sh 'pwd' 
            }
        }
    stage('Building') {
            steps {
		      sh '#!/bin/bash'
                      sh 'set -e'
                      sh 'which ruby'
                      sh 'which which gem'
                      sh 'gem install jekyll bundler' 
                      sh 'bundle exec jekyll build' 
            }
        }
    }
}
