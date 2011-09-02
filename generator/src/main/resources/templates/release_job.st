<?xml version='1.0' encoding='UTF-8'?>
<maven2-moduleset>
  <actions/>
  <description></description>
  <logRotator>
    <daysToKeep>-1</daysToKeep>
    <numToKeep>100</numToKeep>
    <artifactDaysToKeep>-1</artifactDaysToKeep>
    <artifactNumToKeep>-1</artifactNumToKeep>
  </logRotator>
  <keepDependencies>false</keepDependencies>
  <properties/>
  <scm class="hudson.plugins.git.GitSCM">
    <configVersion>1</configVersion>
    <remoteRepositories>
      <org.spearce.jgit.transport.RemoteConfig>
        <string>origin</string>
        <int>5</int>
        <string>fetch</string>
        <string>+refs/heads/*:refs/remotes/origin/*</string>
        <string>receivepack</string>
        <string>git-upload-pack</string>
        <string>uploadpack</string>
        <string>git-upload-pack</string>
        <string>url</string>
        <string>git@github.com:clojure/$name$.git</string>
        <string>tagopt</string>
        <string></string>
      </org.spearce.jgit.transport.RemoteConfig>
    </remoteRepositories>
    <branches>
      <hudson.plugins.git.BranchSpec>
        <name>master</name>
      </hudson.plugins.git.BranchSpec>
    </branches>
    <localBranch>master</localBranch>
    <mergeOptions>
      <mergeRemote reference="../../remoteRepositories/org.spearce.jgit.transport.RemoteConfig"/>
      <mergeTarget>master</mergeTarget>
    </mergeOptions>
    <recursiveSubmodules>false</recursiveSubmodules>
    <doGenerateSubmoduleConfigurations>false</doGenerateSubmoduleConfigurations>
    <authorOrCommitter>false</authorOrCommitter>
    <clean>false</clean>
    <wipeOutWorkspace>true</wipeOutWorkspace>
    <pruneBranches>false</pruneBranches>
    <buildChooser class="hudson.plugins.git.util.DefaultBuildChooser"/>
    <gitTool>Default</gitTool>
    <submoduleCfg class="list"/>
    <relativeTargetDir></relativeTargetDir>
    <excludedRegions></excludedRegions>
    <excludedUsers></excludedUsers>
  </scm>
  <canRoam>true</canRoam>
  <disabled>false</disabled>
  <blockBuildWhenUpstreamBuilding>false</blockBuildWhenUpstreamBuilding>
  <jdk>$jdk$</jdk>
  <triggers class="vector">
    <hudson.triggers.SCMTrigger>
      <spec>@hourly</spec>
    </hudson.triggers.SCMTrigger>
  </triggers>
  <concurrentBuild>false</concurrentBuild>
  <rootModule>
    <groupId>org.clojure</groupId>
    <artifactId>$name$</artifactId>
  </rootModule>
  <goals>--fail-at-end clean deploy</goals>
  <aggregatorStyleBuild>true</aggregatorStyleBuild>
  <incrementalBuild>false</incrementalBuild>
  <usePrivateRepository>false</usePrivateRepository>
  <ignoreUpstremChanges>false</ignoreUpstremChanges>
  <archivingDisabled>false</archivingDisabled>
  <reporters/>
  <publishers/>
  <buildWrappers>
    <hudson.plugins.m2extrasteps.M2ExtraStepsWrapper>
      <preBuildSteps/>
      <postBuildSteps>
        <hudson.tasks.Shell>
          <command>git push origin master `git tag | grep -v ^hudson`</command>
        </hudson.tasks.Shell>
      </postBuildSteps>
      <runIfResult>success</runIfResult>
    </hudson.plugins.m2extrasteps.M2ExtraStepsWrapper>
    <org.jvnet.hudson.plugins.m2release.M2ReleaseBuildWrapper>
      <releaseGoals>-Dresume=false -DtargetRepositoryId=releases -Dnexus.promote.autoSelectOverride=true release:prepare release:perform nexus:staging-close nexus:staging-release</releaseGoals>
      <defaultVersioningMode>specify_version</defaultVersioningMode>
      <selectCustomScmCommentPrefix>false</selectCustomScmCommentPrefix>
      <selectAppendHudsonUsername>false</selectAppendHudsonUsername>
    </org.jvnet.hudson.plugins.m2release.M2ReleaseBuildWrapper>
  </buildWrappers>
</maven2-moduleset>