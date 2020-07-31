Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0A9234B49
	for <lists+openbmc@lfdr.de>; Fri, 31 Jul 2020 20:45:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BJGSD2B9kzDqNn
	for <lists+openbmc@lfdr.de>; Sat,  1 Aug 2020 04:45:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::235;
 helo=mail-lj1-x235.google.com; envelope-from=drewmacrae@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=qjm1lQkt; dkim-atps=neutral
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BJGRK56GKzDqD2
 for <openbmc@lists.ozlabs.org>; Sat,  1 Aug 2020 04:44:38 +1000 (AEST)
Received: by mail-lj1-x235.google.com with SMTP id z4so2999926ljj.6
 for <openbmc@lists.ozlabs.org>; Fri, 31 Jul 2020 11:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3XcFqjmueReej89himfqazFJHNOjLnbpJlTlESskL/g=;
 b=qjm1lQktWFVOUSOAGE8YYF/uszeVI9JRovJFwTtWtkjo04O1B17431w/qMk7wQTa9V
 CryNjaU2fwQbZFUSU5NMgRnHY7qfPFGKrPJxQnE3BJughe/1ja6hNgVLOUX4ykv9uMmP
 tUvaw/IbCsnrXsy7bX/9mPSAj79wniB2NUJU5X1SUPSCeurCxkRQuXw8hn7kfLAZrq0e
 Iv9cc4tnBgpWgLAgcexedPr6HK80MumDIyp38VJwJnbRuGtp0JBo2Nh1wVoq8z1ggCeo
 HKvFoG3bSrPO54cpEOJjL/n3oi6FPXQrN13gdgAUfnTed2NpSB2boY9t0331eQiZvQjU
 Sbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3XcFqjmueReej89himfqazFJHNOjLnbpJlTlESskL/g=;
 b=DihYKk90bny0W8PJJ6Oz9Nq8NZ84r7HpAiV2EanM8oooyHxAUC5vZJPn3kAK0orv72
 fr8r68Z5Oqy/Yn/0DYQZCTXGBsM87V2e+I8wnYnEqdedu8sY3lHvPc5CXn3e2g/8yOrd
 pZ2xMb08ERKRgUTKpqwX6IJW0kedudRCiRxww8tMUw3dpEsdOI8JexOcmaM6RHqbiQTw
 xCuUMPeEMc9QvwpWPFGEzDhO8qrTyYis9YSfOo4ljXAtadmVwFcgDI3G5lerdv2QgWru
 Hzd6FdyeYnziZjBXJ6ZiC0ahm2jJa5eTBb5j27E/tW+u7k984eQIf0MHSPUAHMwQ/xyq
 zJjQ==
X-Gm-Message-State: AOAM533mvdNjAZ27SDFM2IRzs11KWlbXHMe+wuLXwgBULgGbRPgeAb77
 UOyE3jczfCb2QikGsOB9499ezfJlolchvkSEA/+03w==
X-Google-Smtp-Source: ABdhPJyzS5uwpzzNh1zisSzprskmLQOjeriydoyz60picJF8CBsadS7ErLQupeWRPDio1OweGGBPiwoaCjFn262KxQU=
X-Received: by 2002:a2e:7019:: with SMTP id l25mr2190489ljc.256.1596221073762; 
 Fri, 31 Jul 2020 11:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <SN6PR17MB25580E5C6278629955BE548B964E0@SN6PR17MB2558.namprd17.prod.outlook.com>
In-Reply-To: <SN6PR17MB25580E5C6278629955BE548B964E0@SN6PR17MB2558.namprd17.prod.outlook.com>
From: Drew Macrae <drewmacrae@google.com>
Date: Fri, 31 Jul 2020 14:44:21 -0400
Message-ID: <CAAD+EBpiQfqOnPrG1VaEg83EsMq0SwEJ0orGn-AqBAw+h+h5cA@mail.gmail.com>
Subject: Re: OpenBMC build fails in VM ubuntu 16.04 for yosemitev2
To: Mahesh Kurapati <mahesh.kurapati@keysight.com>
Content-Type: multipart/alternative; boundary="00000000000016236205abc12e99"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000016236205abc12e99
Content-Type: text/plain; charset="UTF-8"

Open Embedded has been updated recently to check for gcc-6 or later while
ubuntu 16.04 is packaged with gcc 5.4.
You'll have to install a newer version of gcc to build it or disable the
sanity check. To install and use a newer version of gcc you can run:

```
# Get and use gcc-9
sudo apt-get install software-properties-common --assume-yes --fix-missing
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt update
sudo apt-get install gcc-9 g++-9 --assume-yes --fix-missing
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 90
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 90
gcc -v 2>&1
```

Hope that helps,
Drew Macrae

On Fri, Jul 31, 2020 at 2:37 PM Mahesh Kurapati <
mahesh.kurapati@keysight.com> wrote:

> Hi all,
>
>
>
> I am new to the OpenBMC. I am building the OpenBMC yosemitev2 target in a
> VM and it is failing.  Below is the error I see from the do_compile
> output.  Also attached the compile log file. What am I doing incorrectly?
>
>
>
> *Error: *
>
> Provides: linux-libc-headers-dev = 5.4-r0
>
> Requires(rpmlib): rpmlib(CompressedFileNames) <= 3.0.4-1
> rpmlib(FileDigests) <= 4.6.0-1 rpmlib(PayloadFilesHavePrefix) <= 4.0-1
>
> Checking for unpackaged file(s):
> /home/ixia/yosemite/openbmc/build/yosemitev2/tmp/work/arm1176jzs-openbmc-linux-gnueabi/linux-libc-headers/5.4-r0/recipe-sysroot-native/usr/bin/../../usr/lib/rpm/check-files
> /home/ixia/yosemite/openbmc/build/yosemitev2/tmp/work/arm1176jzs-openbmc-linux-gnueabi/linux-libc-headers/5.4-r0/package
>
> Segmentation fault (core dumped)
>
> WARNING: exit code 139 from a shell command.
>
> ERROR: Error executing a python function in exec_python_func()
> autogenerated:
>
>
>
> The stack trace of python calls that resulted in this exception/failure
> was:
>
> File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
>
>      0001:
>
> *** 0002:do_package_rpm(d)
>
>      0003:
>
> File: '/home/ixia/yosemite/openbmc/meta/classes/package_rpm.bbclass',
> lineno: 716, function: do_package_rpm
>
>      0712:
>
>      0713:    # Build the rpm package!
>
>      0714:    d.setVar('BUILDSPEC', cmd + "\n" + cleanupcmd + "\n")
>
>      0715:    d.setVarFlag('BUILDSPEC', 'func', '1')
>
> *** 0716:    bb.build.exec_func('BUILDSPEC', d)
>
>      0717:
>
>      0718:    if d.getVar('RPM_SIGN_PACKAGES') == '1':
>
>      0719:        bb.build.exec_func("sign_rpm", d)
>
>      0720:}
>
> File: '/home/ixia/yosemite/openbmc/poky/bitbake/lib/bb/build.py', lineno:
> 251, function: exec_func
>
>
>
>
>
> VM Details:
>
> ===========
>
> ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$ cat /etc/os-release
>
> NAME="Ubuntu"
>
> VERSION="16.04.1 LTS (Xenial Xerus)"
>
> ID=ubuntu
>
> ID_LIKE=debian
>
> PRETTY_NAME="Ubuntu 16.04.1 LTS"
>
> VERSION_ID="16.04"
>
> HOME_URL="http://www.ubuntu.com/"
>
> SUPPORT_URL="http://help.ubuntu.com/"
>
> BUG_REPORT_URL="http://bugs.launchpad.net/ubuntu/"
>
> UBUNTU_CODENAME=xenial
>
>
>
> ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$ uname -a
>
> Linux ubuntu 4.4.0-31-generic #50-Ubuntu SMP Wed Jul 13 00:07:12 UTC 2016
> x86_64 x86_64 x86_64 GNU/Linux
>
>
>
> Below are the steps I did:
>
> ==========================
>
> ixia@ubuntu:~/yosemite$ git clone https://github.com/openbmc/openbmc.git
>
> Cloning into 'openbmc'...
>
> remote: Enumerating objects: 83, done.
>
> remote: Counting objects: 100% (83/83), done.
>
> remote: Compressing objects: 100% (56/56), done.
>
> remote: Total 136476 (delta 39), reused 71 (delta 27), pack-reused 136393
>
> Receiving objects: 100% (136476/136476), 66.46 MiB | 2.79 MiB/s, done.
>
> Resolving deltas: 100% (72806/72806), done.
>
> Checking connectivity... done.
>
>
>
> ixia@ubuntu:~/yosemite/openbmc$ . setup yosemitev2
>
> Machine yosemitev2 found in meta-facebook/meta-yosemitev2
>
> You had no conf/local.conf file. This configuration file has therefore been
>
> created for you with some default values. You may wish to edit it to, for
>
> example, select a different MACHINE (target hardware). See conf/local.conf
>
> for more information as common configuration options are commented.
>
>
>
> You had no conf/bblayers.conf file. This configuration file has therefore
> been
>
> created for you with some default values. To add additional metadata layers
>
> into your configuration please add entries to conf/bblayers.conf.
>
>
>
> The Yocto Project has extensive documentation about OE including a
> reference
>
> manual which can be found at:
>
>     http://yoctoproject.org/documentation
>
>
>
> For more information about OpenEmbedded see their website:
>
>     http://www.openembedded.org/
>
>
>
> Common targets are:
>
>      obmc-phosphor-image
>
> ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$
>
>
>
> ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$ df -h
>
> df: /mnt/hgfs: Protocol error
>
> Filesystem      Size  Used Avail Use% Mounted on
>
> udev            7.9G     0  7.9G   0% /dev
>
> tmpfs           1.6G  9.4M  1.6G   1% /run
>
> /dev/sda1        91G  5.4G   81G   7% /
>
> tmpfs           7.9G  212K  7.9G   1% /dev/shm
>
> tmpfs           5.0M  4.0K  5.0M   1% /run/lock
>
> tmpfs           7.9G     0  7.9G   0% /sys/fs/cgroup
>
> tmpfs           1.6G   52K  1.6G   1% /run/user/1000
>
> /dev/sr0         46M   46M     0 100% /media/ixia/CDROM
>
> ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$
>
>
>
> ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$ bitbake
> obmc-phosphor-image
>
> ERROR:  OE-core's config sanity checker detected a potential
> misconfiguration.
>
>     Either fix the cause of this error or at your own risk disable the
> checker (see sanity.conf).
>
>     Following is the list of potential problems / advisories:
>
>
>
>     Your version of gcc is older than 6.0 and will break builds. Please
> install a newer version of gcc (you could use the project's
> buildtools-extended-tarball or use scripts/install-buildtools).
>
>
>
>
>
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>
> ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$
>
>
>
> ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$ sudo
> ../../scripts/install-buildtools
>
> INFO: Fetching buildtools installer
>
> INFO: Fetching buildtools installer checksum
>
> INFO: Checksum success
>
> INFO: Making installer executable
>
> Extended Build tools installer version 3.1+snapshot
>
> ===================================================
>
> You are about to install the SDK to
> "/home/ixia/yosemite/openbmc/poky/buildtools". Proceed [Y/n]? Y
>
> Extracting SDK..................done
>
> Setting it up...done
>
> SDK has been successfully set up and is ready to be used.
>
> Each time you wish to use the SDK in a new shell session, you need to
> source the environment setup script e.g.
>
> $ .
> /home/ixia/yosemite/openbmc/poky/buildtools/environment-setup-x86_64-pokysdk-linux
>
> INFO: Setting up the environment
>
> INFO: Testing installation
>
> INFO: Installation successful. Remember to source the environment setup
> script now and in any new session.
>
> ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$ .
> /home/ixia/yosemite/openbmc/poky/buildtools/environment-setup-x86_64-pokysdk-linux
>
> ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$ bitbake
> obmc-phosphor-image
>
>
>
> Thank you,
> Mahesh
>
>
>
>
>
>
>
>
>

--00000000000016236205abc12e99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Open Embedded has been updated recen=
tly to check for gcc-6 or later while ubuntu 16.04 is packaged with gcc 5.4=
.<br></div><div>You&#39;ll have to install a newer version of gcc to build =
it or disable the sanity check. To install and use a newer version of gcc y=
ou can run:</div><div><br></div><div><font face=3D"monospace">```</font></d=
iv><div><div style=3D"margin:0px;padding:0px;box-sizing:border-box;border-c=
olor:rgba(0,0,0,0.12);color:rgb(0,0,0);white-space:pre"><font face=3D"monos=
pace"><span class=3D"gmail-cm-comment" style=3D"margin:0px;padding:0px;box-=
sizing:border-box;border-color:rgba(0,0,0,0.12);color:rgb(136,0,0)"># Get a=
nd use gcc-9</span>
</font></div><div style=3D"margin:0px;padding:0px;box-sizing:border-box;bor=
der-color:rgba(0,0,0,0.12);color:rgb(0,0,0);white-space:pre"><font face=3D"=
monospace">sudo apt-get install software-properties-common --assume-yes --f=
ix-missing
</font></div><div style=3D"margin:0px;padding:0px;box-sizing:border-box;bor=
der-color:rgba(0,0,0,0.12);color:rgb(0,0,0);white-space:pre"><font face=3D"=
monospace">sudo add-apt-repository ppa:ubuntu-toolchain-r/test
</font></div><div style=3D"margin:0px;padding:0px;box-sizing:border-box;bor=
der-color:rgba(0,0,0,0.12);color:rgb(0,0,0);white-space:pre"><font face=3D"=
monospace">sudo apt update
</font></div><div style=3D"margin:0px;padding:0px;box-sizing:border-box;bor=
der-color:rgba(0,0,0,0.12);color:rgb(0,0,0);white-space:pre"><font face=3D"=
monospace">sudo apt-get install gcc-<span class=3D"gmail-cm-number" style=
=3D"margin:0px;padding:0px;box-sizing:border-box;border-color:rgba(0,0,0,0.=
12);color:rgb(17,102,68)">9</span> g++-<span class=3D"gmail-cm-number" styl=
e=3D"margin:0px;padding:0px;box-sizing:border-box;border-color:rgba(0,0,0,0=
.12);color:rgb(17,102,68)">9</span> --assume-yes --fix-missing
</font></div><div style=3D"margin:0px;padding:0px;box-sizing:border-box;bor=
der-color:rgba(0,0,0,0.12);color:rgb(0,0,0);white-space:pre"><font face=3D"=
monospace">sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc=
-<span class=3D"gmail-cm-number" style=3D"margin:0px;padding:0px;box-sizing=
:border-box;border-color:rgba(0,0,0,0.12);color:rgb(17,102,68)">9</span> <s=
pan class=3D"gmail-cm-number" style=3D"margin:0px;padding:0px;box-sizing:bo=
rder-box;border-color:rgba(0,0,0,0.12);color:rgb(17,102,68)">90</span>
</font></div><div style=3D"margin:0px;padding:0px;box-sizing:border-box;bor=
der-color:rgba(0,0,0,0.12);color:rgb(0,0,0);white-space:pre"><font face=3D"=
monospace">sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++=
-<span class=3D"gmail-cm-number" style=3D"margin:0px;padding:0px;box-sizing=
:border-box;border-color:rgba(0,0,0,0.12);color:rgb(17,102,68)">9</span> <s=
pan class=3D"gmail-cm-number" style=3D"margin:0px;padding:0px;box-sizing:bo=
rder-box;border-color:rgba(0,0,0,0.12);color:rgb(17,102,68)">90</span>
</font></div><div style=3D"margin:0px;padding:0px;box-sizing:border-box;bor=
der-color:rgba(0,0,0,0.12);color:rgb(0,0,0);white-space:pre"><font face=3D"=
monospace"><span class=3D"gmail-cm-number" style=3D"margin:0px;padding:0px;=
box-sizing:border-box;border-color:rgba(0,0,0,0.12);color:rgb(17,102,68)">g=
cc -v 2&gt;&amp;1</span></font></div><div style=3D"margin:0px;padding:0px;b=
ox-sizing:border-box;border-color:rgba(0,0,0,0.12);color:rgb(0,0,0);white-s=
pace:pre"><span style=3D"color:rgb(136,0,0)"><font face=3D"monospace" style=
=3D"">```</font></span><font face=3D"monospace" style=3D"font-size:medium">=
<br></font></div></div><div style=3D"margin:0px;padding:0px;box-sizing:bord=
er-box;border-color:rgba(0,0,0,0.12);color:rgb(0,0,0);white-space:pre"><spa=
n style=3D"color:rgb(136,0,0)"><font face=3D"monospace" style=3D""><br></fo=
nt></span></div><div style=3D"margin:0px;padding:0px;box-sizing:border-box;=
border-color:rgba(0,0,0,0.12);white-space:pre"><font color=3D"#000000" face=
=3D"arial, sans-serif">Hope that helps,</font></div><div style=3D"margin:0p=
x;padding:0px;box-sizing:border-box;border-color:rgba(0,0,0,0.12);white-spa=
ce:pre"><font color=3D"#000000" face=3D"arial, sans-serif">Drew Macrae</fon=
t></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Fri, Jul 31, 2020 at 2:37 PM Mahesh Kurapati &lt;<a href=3D"mail=
to:mahesh.kurapati@keysight.com">mahesh.kurapati@keysight.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_4593859730810451705WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
Hi all, <u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
I am new to the OpenBMC. I am building the OpenBMC yosemitev2 target in a V=
M and it is failing.=C2=A0 Below is the error I see from the do_compile out=
put.=C2=A0 Also attached the compile log file. What am I
 doing incorrectly? <u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><u><span style=3D"font-family:&quot;Courier New&quot=
;">Error: <u></u><u></u></span></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:&quot;Couri=
er New&quot;">Provides: linux-libc-headers-dev =3D 5.4-r0<u></u><u></u></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:&quot;Couri=
er New&quot;">Requires(rpmlib): rpmlib(CompressedFileNames) &lt;=3D 3.0.4-1=
 rpmlib(FileDigests) &lt;=3D 4.6.0-1 rpmlib(PayloadFilesHavePrefix) &lt;=3D=
 4.0-1<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:&quot;Couri=
er New&quot;">Checking for unpackaged file(s): /home/ixia/yosemite/openbmc/=
build/yosemitev2/tmp/work/arm1176jzs-openbmc-linux-gnueabi/linux-libc-heade=
rs/5.4-r0/recipe-sysroot-native/usr/bin/../../usr/lib/rpm/check-files
 /home/ixia/yosemite/openbmc/build/yosemitev2/tmp/work/arm1176jzs-openbmc-l=
inux-gnueabi/linux-libc-headers/5.4-r0/package<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:&quot;Couri=
er New&quot;">Segmentation fault (core dumped)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:&quot;Couri=
er New&quot;">WARNING: exit code 139 from a shell command.<u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:&quot;Couri=
er New&quot;;background:silver">ERROR: Error executing a python function in=
 exec_python_func() autogenerated:</span><span style=3D"font-size:9pt;font-=
family:&quot;Courier New&quot;"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:&quot;Couri=
er New&quot;"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:&quot;Couri=
er New&quot;">The stack trace of python calls that resulted in this excepti=
on/failure was:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:&quot;Couri=
er New&quot;">File: &#39;exec_python_func() autogenerated&#39;, lineno: 2, =
function: &lt;module&gt;<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:&quot;Couri=
er New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0 0001:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:&quot;Couri=
er New&quot;">*** 0002:do_package_rpm(d)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:&quot;Couri=
er New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0 0003:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:&quot;Couri=
er New&quot;">File: &#39;/home/ixia/yosemite/openbmc/meta/classes/package_r=
pm.bbclass&#39;, lineno: 716, function: do_package_rpm<u></u><u></u></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:&quot;Couri=
er New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0 0712:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:&quot;Couri=
er New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0 0713:=C2=A0=C2=A0=C2=A0 # Build the =
rpm package!<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:&quot;Couri=
er New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0 0714:=C2=A0=C2=A0=C2=A0 d.setVar(&#3=
9;BUILDSPEC&#39;, cmd + &quot;\n&quot; + cleanupcmd + &quot;\n&quot;)<u></u=
><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:&quot;Couri=
er New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0 0715:=C2=A0=C2=A0=C2=A0 d.setVarFlag=
(&#39;BUILDSPEC&#39;, &#39;func&#39;, &#39;1&#39;)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:&quot;Couri=
er New&quot;">*** 0716:=C2=A0=C2=A0=C2=A0 bb.build.exec_func(&#39;BUILDSPEC=
&#39;, d)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:&quot;Couri=
er New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0 0717:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:&quot;Couri=
er New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0 0718:=C2=A0=C2=A0=C2=A0 if d.getVar(=
&#39;RPM_SIGN_PACKAGES&#39;) =3D=3D &#39;1&#39;:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:&quot;Couri=
er New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0 0719:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 bb.build.exec_func(&quot;sign_rpm&quot;, d)<u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:&quot;Couri=
er New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0 0720:}<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:&quot;Couri=
er New&quot;">File: &#39;/home/ixia/yosemite/openbmc/poky/bitbake/lib/bb/bu=
ild.py&#39;, lineno: 251, function: exec_func<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
VM Details: <u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$ cat /etc/os-release
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">NAME=3D&quot;Ubuntu&quot;<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">VERSION=3D&quot;16.04.1 LTS (Xenial Xerus)&quot;<u></u><u></u=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">ID=3Dubuntu<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">ID_LIKE=3Ddebian<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">PRETTY_NAME=3D&quot;Ubuntu 16.04.1 LTS&quot;<u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">VERSION_ID=3D&quot;16.04&quot;<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">HOME_URL=3D&quot;<a href=3D"http://www.ubuntu.com/" target=3D=
"_blank">http://www.ubuntu.com/</a>&quot;<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">SUPPORT_URL=3D&quot;<a href=3D"http://help.ubuntu.com/" targe=
t=3D"_blank">http://help.ubuntu.com/</a>&quot;<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">BUG_REPORT_URL=3D&quot;<a href=3D"http://bugs.launchpad.net/u=
buntu/" target=3D"_blank">http://bugs.launchpad.net/ubuntu/</a>&quot;<u></u=
><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">UBUNTU_CODENAME=3Dxenial<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$ uname -a<u><=
/u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">Linux ubuntu 4.4.0-31-generic #50-Ubuntu SMP Wed Jul 13 00:07=
:12 UTC 2016 x86_64 x86_64 x86_64 GNU/Linux<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
Below are the steps I did:
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ixia@ubuntu:~/yosemite$ git clone <a href=3D"https://github.com/openbmc/ope=
nbmc.git" target=3D"_blank">https://github.com/openbmc/openbmc.git</a><u></=
u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">Cloning into &#39;openbmc&#39;...<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">remote: Enumerating objects: 83, done.<u></u><u></u></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">remote: Counting objects: 100% (83/83), done.<u></u><u></u></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">remote: Compressing objects: 100% (56/56), done.<u></u><u></u=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">remote: Total 136476 (delta 39), reused 71 (delta 27), pack-r=
eused 136393<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">Receiving objects: 100% (136476/136476), 66.46 MiB | 2.79 MiB=
/s, done.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">Resolving deltas: 100% (72806/72806), done.<u></u><u></u></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">Checking connectivity... done.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ixia@ubuntu:~/yosemite/openbmc$ . setup yosemitev2<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">Machine yosemitev2 found in meta-facebook/meta-yosemitev2<u><=
/u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">You had no conf/local.conf file. This configuration file has =
therefore been<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">created for you with some default values. You may wish to edi=
t it to, for<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">example, select a different MACHINE (target hardware). See co=
nf/local.conf<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">for more information as common configuration options are comm=
ented.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">You had no conf/bblayers.conf file. This configuration file h=
as therefore been<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">created for you with some default values. To add additional m=
etadata layers<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">into your configuration please add entries to conf/bblayers.c=
onf.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">The Yocto Project has extensive documentation about OE includ=
ing a reference<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">manual which can be found at:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">=C2=A0=C2=A0=C2=A0 <a href=3D"http://yoctoproject.org/documen=
tation" target=3D"_blank">http://yoctoproject.org/documentation</a><u></u><=
u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">For more information about OpenEmbedded see their website:<u>=
</u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">=C2=A0=C2=A0=C2=A0 <a href=3D"http://www.openembedded.org/" t=
arget=3D"_blank">http://www.openembedded.org/</a><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">Common targets are:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0 obmc-phosphor-image<u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$ df -h<u></u><u></u></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">df: /mnt/hgfs: Protocol error<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">Filesystem=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Size=C2=A0 Used Avai=
l Use% Mounted on<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">udev=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 7.9G=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0 7.9G=C2=A0=C2=A0 0% /dev<u><=
/u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">tmpfs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 1.6G=C2=A0 9.4M=C2=A0 1.6G=C2=A0=C2=A0 1% /run<u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">/dev/sda1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 91G=C2=A0=
 5.4G=C2=A0=C2=A0 81G=C2=A0=C2=A0 7% /<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">tmpfs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 7.9G=C2=A0 212K=C2=A0 7.9G=C2=A0=C2=A0 1% /dev/shm<u></u><u></u></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">tmpfs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 5.0M=C2=A0 4.0K=C2=A0 5.0M=C2=A0=C2=A0 1% /run/lock<u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">tmpfs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 7.9G=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0 7.9G=C2=A0=C2=A0 0% /sys/fs/cgr=
oup<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">tmpfs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 1.6G=C2=A0=C2=A0 52K=C2=A0 1.6G=C2=A0=C2=A0 1% /run/user/1000<u></u>=
<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">/dev/sr0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 46M=
=C2=A0=C2=A0 46M=C2=A0=C2=A0=C2=A0=C2=A0 0 100% /media/ixia/CDROM<u></u><u>=
</u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$ bitbake obmc-phosphor-imag=
e<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">ERROR:=C2=A0 OE-core&#39;s config sanity checker detected a p=
otential misconfiguration.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">=C2=A0=C2=A0=C2=A0 Either fix the cause of this error or at y=
our own risk disable the checker (see sanity.conf).<u></u><u></u></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">=C2=A0=C2=A0=C2=A0 Following is the list of potential problem=
s / advisories:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">=C2=A0=C2=A0=C2=A0 Your version of gcc is older than 6.0 and =
will break builds. Please install a newer version of gcc (you could use the=
 project&#39;s buildtools-extended-tarball or use scripts/install-buildtool=
s).<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">Summary: There was 1 ERROR message shown, returning a non-zer=
o exit code.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$ sudo ../../scripts/install=
-buildtools<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">INFO: Fetching buildtools installer<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">INFO: Fetching buildtools installer checksum<u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">INFO: Checksum success<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">INFO: Making installer executable<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">Extended Build tools installer version 3.1+snapshot<u></u><u>=
</u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">You are about to install the SDK to &quot;/home/ixia/yosemite=
/openbmc/poky/buildtools&quot;. Proceed [Y/n]? Y<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">Extracting SDK..................done<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">Setting it up...done<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">SDK has been successfully set up and is ready to be used.<u><=
/u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">Each time you wish to use the SDK in a new shell session, you=
 need to source the environment setup script e.g.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">$ . /home/ixia/yosemite/openbmc/poky/buildtools/environment-s=
etup-x86_64-pokysdk-linux<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">INFO: Setting up the environment<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">INFO: Testing installation<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Couri=
er New&quot;">INFO: Installation successful. Remember to source the environ=
ment setup script now and in any new session.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$ . /home/ixia/yosemite/open=
bmc/poky/buildtools/environment-setup-x86_64-pokysdk-linux<u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$ bitbake obmc-phosphor-imag=
e<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
Thank you, <br>
Mahesh<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
<u></u>=C2=A0<u></u></span></p>
</div>
</div>

</blockquote></div></div>

--00000000000016236205abc12e99--
