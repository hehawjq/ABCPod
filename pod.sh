#当前目录
RootPath=`pwd`

#PodSpec文件的名字
PodSpecName="ABCPod.podspec"

#PodSpec文件路径
PodSpecPath=$RootPath/$PodSpecName

#repo的私有库的名字
Repo_Name=ABCPod

#获取所有tag
echo "\n当前SDK所有的tag是："
git fetch --tags
git tag

echo "\n请输入sdk tag版本号（3个位置版本号，例如：0.0.1 / 1.0.0 / 99.99.99 / .....）"
read Tag_Version

echo $Tag_Version
#判断输入的Tag_Version 不为空
if [ -z $Tag_Version ];then
    #输入的是空
    echo "\n输入格式错误，请重新运行脚本，输入正确格式的sdk tag版本号\n"
else
    #不是空
    #release的正则
    reg='^[0-9]{1,4}\.[0-9]{1,4}\.[0-9]{1,4}$'

    echo "Tag_Version》》》》》》 "$Tag_Version

    if [[ "$Tag_Version" =~ $reg ]];then
        echo "恭喜你，输入的版本号，格式验证通过"
    else
        echo "\n输入格式错误，请重新运行脚本，输入正确格式的sdk tag版本号\n"
        exit 1
    fi
fi

# 最新工程代码的tag列表缓存文件
TempTagListFile=$RootPath/taglist.txt
#
echo "TempTagListFile:" $TempTagListFile
git fetch --tags
git tag -l |sort -r > $TempTagListFile

Have_Tag="0"
while read line
    do
        tagNumber=$line
        echo "tagNumber:" $tagNumber

        if [ $tagNumber == $Tag_Version ];then
            Have_Tag="1"
            break
        fi
    done < $TempTagListFile

    if [[ $Have_Tag == "1" ]];then
        echo "\ntag号 $Tag_Version 已经存在,请重新输入!"
    else
        echo "\ntag号 $Tag_Version 符合一切要求......继续后续工作"
        #调用changeSpecVersion方法
        changeSpecVersion
    fi

changeSpecVersion(){
    while read line
    do
        zhengze="^s.version"
        if [[ "$line" =~ $zhengze ]];then
            echo "File:${line}"
            sed -i "" "s/${line}/s.version      =\"$Tag_Version\"/g" $PodSpecPath
        fi
    done < $PodSpecPath
    cat  $PodSpecPath

    #修改XESTestSDKFramework/XESTestSDK.framework/Info.plist的
    plistPath=$RootPath/Frameworks/ArcSoftFaceSDK.framework/Info.plist
        BUILD_CODE=`date +%m%d%H%M`
        /usr/libexec/PlistBuddy -c "Set CFBundleShortVersionString $Tag_Version" $plistPath
        /usr/libexec/PlistBuddy -c "Set CFBundleVersion $BUILD_CODE" $plistPath
}

pushGit(){
    #git 暂存
    git add .

    #git 下拉代码
    git pull

    Date=`date +%Y年%m月%d日%H时%M分%秒`


    git add .
    git commit -m "archive framework in $Date"
    git push
    git tag $Tag_Version
    git push --tags
}

#调用pushGit 方法
pushGit


pushPodRepo(){
    #pod 提交
    # 修改spec文件并push上去
    pod repo push $Repo_Name $PodSpecName --verbose --use-libraries --allow-warnings
    echo "\n\n新的版本号为 $Tag_Version "
}

#调用pushPodRepo方法
pushPodRepo

