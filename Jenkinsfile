node {
    def userCredentials = 'home_aws'
    withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: "${userCredentials}",
                    usernameVariable: 'AWS_ACCESS_KEY', passwordVariable: 'AWS_SECRET_KEY']]) {
        // some block
        env.AWS_ACCESS_KEY_ID = "$AWS_ACCESS_KEY_ID"
        env.AWS_SECRET_ACCESS_KEY = "$AWS_SECRET_ACCESS_KEY"
        println "current workspace: $workspace"
        stage ('git checkout') {
            dir(workspace) {
                repoURL = scm.getUserRemoteConfigs()[0].getUrl()
                branch = scm.branches[0].name.replace("*/","").trim()
                println "branch: ${branch}"
                git url: repoURL, branch: branch
            }
        }
        stage ('plan simpsons') {
            parallel(
                canada: { 
                    dir ("$workspace/simpsons-ca") {
                        sh '~/bin/terraform init'
                        sh '~/bin/terraform plan'
                    }
                },
                us: {
                    dir ("$workspace/simpsons-us") {
                        sh '~/bin/terraform init'
                        sh '~/bin/terraform plan'
                    }
                }
            )
        }
    }
}