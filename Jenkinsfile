#!groovy

node {

  def err = null
  def environment = "Development"
  currentBuild.result = "SUCCESS"
  //load "$JENKINS_HOME/.envvars/.env.groovy"

  try {
    stage ('Checkout') {
      checkout scm
    }
    
  /*  stage ('Decrypt the Secrets File') {
      sh """
       set +x
       cd terraform/aws/ && /usr/bin/ansible-vault decrypt --vault-password-file=${env.VAULT_LOCATION}/${environment}.txt ${environment}-secrets.tfvars
       /usr/bin/ansible-vault decrypt --vault-password-file=${env.VAULT_LOCATION}/${environment}.txt terraform.tfstate*
       """
    }

*/

    stage ('Terraform Init') {
      
      pwd
      print " where am i "
      print "Init Provider" 
     
      //sh "cd terraform/aws/ && /usr/local/bin/terraform init"
      
      sh "terraform init"
    }

/*
    stage ('Terraform Validate') {
      print "Validating The TF Files"
      sh "cd terraform/aws/ && /usr/local/bin/terraform validate -var-file=${environment}-secrets.tfvars"
    }
  */  
    stage ('Terraform Plan') {
      withCredentials([string(credentialsId: 'Access_key_ID', variable: 'AWS_ACCESS_KEY_ID'),
                       string(credentialsId: 'Secret_access_key', variable: 'AWS_SECRET_ACCESS_KEY')]) {
        sh """
         set +x
        terraform plan  
         """
                       }  
    }


    
     
   
    
    
    // wait for approval. If Plan checks out.
    input 'Deploy stack?'
    
    stage ('Terraform Apply') {
      withCredentials([string(credentialsId: 'Access_key_ID', variable: 'AWS_ACCESS_KEY_ID'), 
                       string(credentialsId: 'Secret_access_key', variable: 'AWS_SECRET_ACCESS_KEY')]) {
        sh """
         set +x
        terraform apply --auto-approve 
         """
       }  
    }

    /*
    // we should include testing stage(s) here. test-kitchen, infospec, etc... 
    stage ('Re-Encrypt the Secrets File') {
      sh """
       set +x
       cd terraform/aws/ && /usr/bin/ansible-vault encrypt --vault-password-file=${env.VAULT_LOCATION}/${environment}.txt ${environment}-secrets.tfvars
      /usr/bin/ansible-vault encrypt --vault-password-file=${env.VAULT_LOCATION}/${environment}.txt terraform.tfstate*
       """
    }

    stage ('Push and Merge Terraform State') {
        sh """
          set +x 
          /usr/bin/git add terraform/aws/terraform.tfstate* terraform/aws/*-secrets.tfvars
          /usr/bin/git commit -am 'Commit Terraform State - Jenkins Job ${env.JOB_NAME} - build  ${env.BUILD_NUMBER} for ${environment}'
          /usr/bin/git push origin HEAD:master
        """

    }

    stage ('Notify') {
      mail from: "email@email.com",
           to: "email@email.com",
           subject: "Terraform Build for ${environment} Complete.",
           body: "Jenkins Job ${env.JOB_NAME} - build  ${env.BUILD_NUMBER} for ${environment}. Please investigate."
    }
*/  
}

  catch (caughtError) {
    err = caughtError
    currentBuild.result = "FAILURE"
  }

  finally {
    // Must re-throw exception to propagate error 
    if (err) {
      throw err
    }
  }


}

