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
    sh "echo Notifying stackholders is done && sleep 1"
  }
  stage('Preparation') {
    git url: 'https://github.com/teg-github/teg-atg-microservices'
  }
  stage('Verify Stage Preparation') {
    sh "./build-scripts/prepare-env.sh && cat ~/env.properties"
  }
  stage('Test Run') {
    sh "export JAVA_HOME=/var/jenkins_home/tools/java && export PATH=/var/jenkins_home/tools/java/bin:$PATH && sh /var/jenkins_home/tools/ATG11.2/home/servers/ATGProduction/startServerOnJBoss.sh & > /var/jenkins_home/atg.log"
  }
  stage('Unit Test and Code Quality') {
    timestamps {
      parallel (
        "Junit Test" : {
          sh "sleep 5 && cd ${workspace}/BannerService && echo Unit Test is done && sleep 5"
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
    sh '../../tools/ATG11.2/home/bin/runAssembler -standalone -server ATGProduction ATGProduction.ear -m DAS DPS DSS'
  }
  stage('Docker Containerization') {
    sh "echo Containerization is done && sleep 5"
  }
  stage('Upload Artifacts') {
    sh "echo Deployment is done && sleep 5"
  }
  stage('Deploy docker container') {
    sh "./build-scripts/copy-code.sh && cat ActorChainRestRegistry.properties"
  }
  stage('Update Release Notification') {
  }
}
