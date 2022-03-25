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
                      sh 'which rvm'
                      sh 'rvm use --default 3.0.0'
                      sh 'which ruby'
                      sh 'which gem'
                      sh 'gem install jekyll bundler' 
                      sh 'bundle exec jekyll build' 
            }
        }
    }
}
