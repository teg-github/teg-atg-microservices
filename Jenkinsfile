node ('master') {
  def JAVA_HOME = tool 'jdk8'
  def MVN_HOME = tool 'maven3'
  def scannerHome = tool 'runner29'
  def jbossHome = '../../tools/jboss'
  def dynamoHome = '../../tools/ATG11.2/home'
  def sonarProperties = [
    projectKey: "WW-ATG-MicroService-Report",
    projectName: "WW-ATG-MicroService-Report",
    projectVersion: '1.0',
    sources: './BannerService/src'    
  ]	
  stage('Notify Stakeholders') {
    sh "echo Notifying stackholders is done"
  }
  stage('Preparation') {
    git url: 'https://github.com/teg-github/teg-atg-microservices'
  }
  stage('Verify Stage Preparation') {
    sh "./build-scripts/prepare-env.sh"
  }
  stage('Test Run') {
    sh "echo done"
  }
  stage('Unit Test and Code Quality') {
    timestamps {
      parallel (
        "Junit Test" : {
          sh "echo Unit Test is done"
        },
        "Static Code Analysis" : {
		  sh "${scannerHome}/bin/sonar-scanner \
                                    -Dsonar.projectKey=${sonarProperties.projectKey} \
                                    -Dsonar.projectName=${sonarProperties.projectName} \
                                    -Dsonar.projectVersion=${sonarProperties.projectVersion} \
                                    -Dsonar.sources=${sonarProperties.sources}"
        }
      )
    }
  }
  
  stage('Build Code') {
    sh 'echo done'
  }
  stage('Docker Containerization') {
    sh "echo Containerization is done"
  }
  stage('Upload Artifacts') {
    sh "echo Deployment is done"
  }
  stage('Deploy docker container') {
    sh "./build-scripts/copy-code.sh"
    sh "cat ActorChainRestRegistry.properties"
  }
  stage('Update Release Notification') {
  }
}
