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
                sh '''#!/bin/bash
                      bundle exec jekyll build 
                   '''
            }
        }
    }
}
