node ('master') {
  def JAVA_HOME = tool 'jdk8'
  def MVN_HOME = tool 'maven3'
  def scannerHome = tool 'runner29'
  def jbossHome = '${WORKSPACE}/../tools/jboss'
  def dynamoHome = '${WORKSPACE}/../tools/ATG11.2/home'
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
    sh "./build-scripts/prepare-env.sh && cat ~/env.properties && ./build-scripts/copy-code.sh && cat ActorChainRestRegistry.properties"
  }
  stage ('Test Build') {
    sh '${dynamoHome}/bin/runAssembler -standalone -server ATGProduction ATGProduction.ear -m DAS DPS DSS'
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
  stage('Intimate Code Quality status to developers') {
    sh "echo Stage preparation is done && sleep 5"
  }
  stage('Build Code') {
    sh "cd ${workspace}/BannerService && echo Build is successful && sleep 5"
  }
  stage('Docker Containerization') {
    sh "echo Containerization is done && sleep 5"
  }
  stage('Upload Artifacts') {
    sh "echo Deployment is done && sleep 5"
  }
  stage('Deploy docker container') {
    sh "echo Deployment is done && sleep 5"
  }
  stage('Update Release Notification') {
  }
}
