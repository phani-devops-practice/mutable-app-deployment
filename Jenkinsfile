pipeline {
  agent any

  parameters {
    choice(name: 'ENV', choices: ['', 'dev', 'prod'], description: '')
    choice(name: 'COMPONENT', choices: ['shipping'], description: '')
  }

  stages {
    stage('Terraform') {
      steps {
        sh '''
          terraform init
          terraform apply -auto-approve -var COMPONENT=${COMPONENT} -var ENV=${ENV}
        '''
      }
    }
  }
  post {
    always {
      cleanWs()
    }
  }
}