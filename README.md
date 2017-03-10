# apk-csigner
Along signing apks, apk CSigner is capable of compiling & decompiling apks serving the pupose of pure sources/resources replacement.

Introduction:
I’ve recently joined Android Developers and I have published CoolesTech RSS Feed Reader. All went fine until I had to self-sign my app (personal private key), and that’s what was like a nightmare (although it’s relatively easy); test keys worked like a charm when self-certificates failed… But Google does not allow test certificates as you may have noticed.

I have tried signar 1.3 and signer 0.3 but after my app seemed successfully signed I still got “application not installed.

So I have created my own tool, called “CSigner” that only runs in windows and comes with 2 versions (32-bit & 64-bit)

The only requirements are Java and windows…
2 (Small)

I’m posting it here just in case someone goes through what I have been striving to achieve…

Goal:
Whether you are new to signing apps, or getting “application was not installed”, then you’ve finally reached the correct place! Along signing apks, apk CSigner is capable of compiling & decompiling apks serving the pupose of pure sources/resources replacement.

Note: This program is designed for situations where apk multitool fail to compile/decompile certain apps. It’s not intended to replace other programs.Untitled (Small)

Requirements:

You must have Java (jdk) installed and you must add its path to Environment variable see this video for more help.

I heartily thank android-dls.com for their help! Because of them I figured out that some files were missing from OpenSSL (which generates the certificate).

If you face file not found error, you may need to install Java JRE (in addition to JDK).

Download: (v0.8.2)

apk_CSigner_x64                   apk_CSigner_x86 

Note: after unzipping the file, do not rename the folder (eg. apk_CSigner_x64).

If you like my work please click on “thanks” button on xda-developers:

http://forum.xda-developers.com/showthread.php?t=2062386
