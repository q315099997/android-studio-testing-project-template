<?xml version="1.0"?>
<recipe>


    <#if appCompat?has_content><dependency mavenUrl="com.android.support:appcompat-v7:19.+"/></#if>

<#if !createActivity>
    <mkdir at="${escapeXmlAttribute(srcOut)}" />
</#if>

    <mkdir at="${escapeXmlAttribute(projectOut)}/libs" />

    <mkdir at="${escapeXmlAttribute(projectOut)}/src/androidTestRobotium/java/${packageName}" />
    <mkdir at="${escapeXmlAttribute(projectOut)}/src/androidTestEspresso/java/${packageName}" />


    <merge from="settings.gradle.ftl"
             to="${escapeXmlAttribute(topOut)}/settings.gradle" />
    <instantiate from="build.gradle.ftl"
                   to="${escapeXmlAttribute(projectOut)}/build.gradle" />
    <instantiate from="AndroidManifest.xml.ftl"
                   to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />

<#if copyIcons>
    <copy from="res/drawable-hdpi"
            to="${escapeXmlAttribute(resOut)}/drawable-hdpi" />
    <copy from="res/drawable-mdpi"
            to="${escapeXmlAttribute(resOut)}/drawable-mdpi" />
    <copy from="res/drawable-xhdpi"
            to="${escapeXmlAttribute(resOut)}/drawable-xhdpi" />
    <copy from="res/drawable-xxhdpi"
            to="${escapeXmlAttribute(resOut)}/drawable-xxhdpi" />
</#if>
<#if makeIgnore>
    <copy from="module_ignore"
            to="${escapeXmlAttribute(projectOut)}/.gitignore" />
</#if>
<#if enableProGuard>
    <instantiate from="proguard-rules.txt.ftl"
                   to="${escapeXmlAttribute(projectOut)}/proguard-rules.pro" />
</#if>
<#if !(isLibraryProject??) || !isLibraryProject>
    <instantiate from="res/values/styles.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/styles.xml" />
<#if buildApi gte 21>
    <copy from="res/values-v21/styles.xml"
          to="${escapeXmlAttribute(resOut)}/values-v21/styles.xml" />
</#if>
</#if>

   <instantiate from="res/values/strings.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/values/strings.xml" />

    <instantiate from="test/app_package/ApplicationTest.java.ftl"
                   to="${testOut}/ApplicationTest.java" />

    <instantiate from="test/app_package/RobotiumBasicActivityTest.java.ftl"
                   to="${escapeXmlAttribute(projectOut)}/src/androidTestRobotium/java/${packageName}/${activityClass}RobotiumTest.java" />

    <instantiate from="test/app_package/EspressoBasicActivityTest.java.ftl"
                   to="${escapeXmlAttribute(projectOut)}/src/androidTestEspresso/java/${packageName}/${activityClass}EspressoTest.java" />               
    <instantiate from="test/app_package/RobolectricBasicActivityTest.java.ftl"
                   to="${escapeXmlAttribute(projectOut)}/src/robolectricTest/java/${packageName}/${activityClass}RobolectricTest.java"  />
    <instantiate from="app/Application.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/MyApplication.java"  />
    
</recipe>
