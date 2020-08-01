Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2D6234F5C
	for <lists+openbmc@lfdr.de>; Sat,  1 Aug 2020 03:58:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BJS485sXTzDqYK
	for <lists+openbmc@lfdr.de>; Sat,  1 Aug 2020 11:58:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BJS3M3832zDqXB
 for <openbmc@lists.ozlabs.org>; Sat,  1 Aug 2020 11:58:06 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07113GWt023500
 for <openbmc@lists.ozlabs.org>; Fri, 31 Jul 2020 21:58:03 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.113])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32mu6kmf5t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 31 Jul 2020 21:58:02 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Sat, 1 Aug 2020 01:58:02 -0000
Received: from us1b3-smtp07.a3dr.sjc01.isc4sb.com (10.122.203.198)
 by smtp.notes.na.collabserv.com (10.122.47.56) with
 smtp.notes.na.collabserv.com ESMTP; Sat, 1 Aug 2020 01:57:58 -0000
Received: from us1b3-mail228.a3dr.sjc03.isc4sb.com ([10.168.214.55])
 by us1b3-smtp07.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020080101575843-804687 ;
 Sat, 1 Aug 2020 01:57:58 +0000 
In-Reply-To: <SN6PR17MB2558B3606E296F4EE155BDB9964F0@SN6PR17MB2558.namprd17.prod.outlook.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Mahesh Kurapati <mahesh.kurapati@keysight.com>
Date: Sat, 1 Aug 2020 01:57:57 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <SN6PR17MB2558B3606E296F4EE155BDB9964F0@SN6PR17MB2558.namprd17.prod.outlook.com>,
 <SN6PR17MB25580E5C6278629955BE548B964E0@SN6PR17MB2558.namprd17.prod.outlook.com>
 <CAAD+EBpiQfqOnPrG1VaEg83EsMq0SwEJ0orGn-AqBAw+h+h5cA@mail.gmail.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 49823
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20080101-7691-0000-0000-00000D6973AF
X-IBM-SpamModules-Scores: BY=0.099758; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.36301; ST=0; TS=0; UL=0; ISC=; MB=0.262537
X-IBM-SpamModules-Versions: BY=3.00013572; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01413987; UDB=6.00758012; IPR=6.01196266; 
 MB=3.00033291; MTD=3.00000008; XFM=3.00000015; UTC=2020-08-01 01:58:00
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-07-31 23:30:01 - 6.00011668
x-cbparentid: 20080101-7692-0000-0000-00002D8A81F9
Message-Id: <OF5BB1C1D9.12A4C663-ON002585B7.000ACCBC-002585B7.000ACCC1@notes.na.collabserv.com>
Subject: RE: OpenBMC build fails in VM ubuntu 16.04 for yosemitev2
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_09:2020-07-31,
 2020-07-31 signatures=0
X-Proofpoint-Spam-Reason: orgsafe
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
Cc: Drew Macrae <drewmacrae@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On July 31, 2020 around   08:37PM in some timezone, Mahesh Kurapati  wrote:=
> Hello Drew,=20
> =20
> Thank you.  That fixed the issue. Now, I see the below error:=20
> =20
> DEBUG: Fetching
>http://downloads.yoctoproject.org/mirror/sources/git2=5Fgithub.com.open
>bmc.ipmbbridge.git.tar.gz using command '/usr/bin/env wget -t 2 -T 30
>--passive-ftp --no-check-certificate  -P
>/home/ixia/yosemite/openbmc/build/yosemitev2/downloads
>'http://downloads.yoctoproject.org/mirror/sources/git2=5Fgithub.com.ope
>nbmc.ipmbbridge.git.tar.gz''
> DEBUG: Fetcher accessed the network with the command /usr/bin/env
>wget -t 2 -T 30 --passive-ftp --no-check-certificate -P
>/home/ixia/yosemite/openbmc/build/yosemitev2/downloads
>'http://downloads.yoctoproject.org/mirror/sources/git2=5Fgithub.com.ope
>nbmc.ipmbbridge.git.tar.gz'
> DEBUG: Running export PSEUDO=5FDISABLED=3D1; unset
>=5FPYTHON=5FSYSCONFIGDATA=5FNAME; export
>DBUS=5FSESSION=5FBUS=5FADDRESS=3D"unix:abstract=3D/tmp/dbus-S3y80KQJZ9"; e=
xport
>SSH=5FAUTH=5FSOCK=3D"/run/user/1000/keyring/ssh";  export
>GIT=5FSSL=5FCAINFO=3D"/home/ixia/yosemite/openbmc/poky/buildtools/sysroots/
>x86=5F64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export
>PATH=3D"/home/ixia/yosemite/openbmc/scripts:/home/ixia/yosemite/openbmc
>/build/yosemitev2/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-
>ipmi-ipmb/0.1+gitAUTOINC+a86059348f-r0/recipe-sysroot-native/usr/bin/
>arm-openbmc-linux-gnueabi:/home/ixia/yosemite/openbmc/build/yosemitev
>2/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-ipmi-ipmb/0.1+gi
>tAUTOINC+a86059348f-r0/recipe-sysroot/usr/bin/crossscripts:/home/ixia
>/yosemite/openbmc/build/yosemitev2/tmp/work/arm1176jzs-openbmc-linux-
>gnueabi/phosphor-ipmi-ipmb/0.1+gitAUTOINC+a86059348f-r0/recipe-sysroo
>t-native/usr/sbin:/home/ixia/yosemite/openbmc/build/yosemitev2/tmp/wo
>rk/arm1176jzs-openbmc-linux-gnueabi/phosphor-ipmi-ipmb/0.1+gitAUTOINC
>+a86059348f-r0/recipe-sysroot-native/usr/bin:/home/ixia/yosemite/open
>bmc/build/yosemitev2/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosph
>or-ipmi-ipmb/0.1+gitAUTOINC+a86059348f-r0/recipe-sysroot-native/sbin:
>/home/ixia/yosemite/openbmc/build/yosemitev2/tmp/work/arm1176jzs-open
>bmc-linux-gnueabi/phosphor-ipmi-ipmb/0.1+gitAUTOINC+a86059348f-r0/rec
>ipe-sysroot-native/bin:/home/ixia/yosemite/openbmc/poky/bitbake/bin:/
>home/ixia/yosemite/openbmc/build/yosemitev2/tmp/hosttools";  export
>HOME=3D"/home/ixia"; /usr/bin/env wget -t 2 -T 30 --passive-ftp
>--no-check-certificate -P
>/home/ixia/yosemite/openbmc/build/yosemitev2/downloads
>'http://downloads.yoctoproject.org/mirror/sources/git2=5Fgithub.com.ope
>nbmc.ipmbbridge.git.tar.gz' --progress=3Ddot  -v
> --2020-08-01 00:03:19--
>http://downloads.yoctoproject.org/mirror/sources/git2=5Fgithub.com.open
>bmc.ipmbbridge.git.tar.gz
> Resolving downloads.yoctoproject.org... 198.145.29.63
> Connecting to downloads.yoctoproject.org|198.145.29.63|:80...
>connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2020-08-01 00:03:19 ERROR
>  > DEBUG: Mirror fetch failure for url
>http://downloads.yoctoproject.org/mirror/sources/git2=5Fgithub.com.open
>bmc.ipmbbridge.git.tar.gz (original url:
>git://github.com/openbmc/ipmbbridge.git)
 404: Not Found.


Whlie OpenBMC uses Yocto as our upstream, we are not mirrored=20
at yocto.org.

You need to look prior why you are attempting to fetch from the=20
mirror instead of the github hosted git repositories mentioned=20
in the original URL.  If needed you can rewrite them to fetch=20
with http but that is not as efficient.

Perhaps you have some transports blocked?

milton

...

>  > Thank you,=20
> Mahesh
> =20
> From: Drew Macrae <drewmacrae@google.com>=20
> Sent: Friday, July 31, 2020 1:44 PM
> To: Mahesh Kurapati <mahesh.kurapati@keysight.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: OpenBMC build fails in VM ubuntu 16.04 for yosemitev2
> =20
>=20
>=20
>=20
> Open Embedded has been updated recently to check for gcc-6 or later
>while ubuntu 16.04 is packaged with gcc 5.4.
> =20
> You'll have to install a newer version of gcc to build it or disable
>the sanity check. To install and use a newer version of gcc you can
>run:
> =20
> =20
> =20
> ```
> =20
>=20
> # Get and use gcc-9
> =20
> sudo apt-get install software-properties-common --assume-yes
>--fix-missing
> =20
> sudo add-apt-repository ppa:ubuntu-toolchain-r/test
> =20
> sudo apt update
> =20
> sudo apt-get install gcc-9  g++-9 --assume-yes --fix-missing
> =20
> sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9
>90
> =20
> sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9
>90
> =20
> gcc -v 2>&1
> =20
> ```
>  =20
> =20
> =20
> Hope that helps,
> =20
> Drew Macrae
>   =20
>=20
>=20
> On Fri, Jul 31, 2020 at 2:37 PM Mahesh Kurapati
><mahesh.kurapati@keysight.com> wrote:
>  =20
>=20
> Hi all,=20
> =20
> I am new to the OpenBMC. I am building the OpenBMC yosemitev2 target
>in a VM and it is failing.  Below is the error I see from the
>do=5Fcompile  output.  Also attached the compile log file. What am I
>doing incorrectly? =20
> =20
> Error:=20
> Provides: linux-libc-headers-dev =3D 5.4-r0
> Requires(rpmlib): rpmlib(CompressedFileNames) <=3D 3.0.4-1
>rpmlib(FileDigests) <=3D 4.6.0-1 rpmlib(PayloadFilesHavePrefix) <=3D
>4.0-1
> Checking for unpackaged file(s):
>/home/ixia/yosemite/openbmc/build/yosemitev2/tmp/work/arm1176jzs-open
>bmc-linux-gnueabi/linux-libc-headers/5.4-r0/recipe-sysroot-native/usr
>/bin/../../usr/lib/rpm/check-files
>/home/ixia/yosemite/openbmc/build/yosemitev2/tmp/work/arm1176jzs-open
>bmc-linux-gnueabi/linux-libc-headers/5.4-r0/package
> Segmentation fault (core dumped)
> WARNING: exit code 139 from a shell command.
> ERROR: Error executing a python function in exec=5Fpython=5Ffunc()
>autogenerated:
> =20
> The stack trace of python calls that resulted in this
>exception/failure was:
> File: 'exec=5Fpython=5Ffunc() autogenerated', lineno: 2, function:
><module>
>      0001:
> *** 0002:do=5Fpackage=5Frpm(d)
>      0003:
> File:
>'/home/ixia/yosemite/openbmc/meta/classes/package=5Frpm.bbclass',
>lineno: 716, function: do=5Fpackage=5Frpm
>      0712:
>      0713:    # Build the rpm package!
>      0714:    d.setVar('BUILDSPEC', cmd + "\n" + cleanupcmd + "\n")
>      0715:    d.setVarFlag('BUILDSPEC', 'func', '1')
> *** 0716:    bb.build.exec=5Ffunc('BUILDSPEC', d)
>      0717:
>      0718:    if d.getVar('RPM=5FSIGN=5FPACKAGES') =3D=3D '1':
>      0719:        bb.build.exec=5Ffunc("sign=5Frpm", d)
>      0720:}
> File: '/home/ixia/yosemite/openbmc/poky/bitbake/lib/bb/build.py',
>lineno: 251, function: exec=5Ffunc
> =20
> =20
> VM Details:=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$ cat /etc/os-release
>
> NAME=3D"Ubuntu"
> VERSION=3D"16.04.1 LTS (Xenial Xerus)"
> ID=3Dubuntu
> ID=5FLIKE=3Ddebian
> PRETTY=5FNAME=3D"Ubuntu 16.04.1 LTS"
> VERSION=5FID=3D"16.04"
> HOME=5FURL=3D"http://www.ubuntu.com/"
> SUPPORT=5FURL=3D"http://help.ubuntu.com/"
> BUG=5FREPORT=5FURL=3D"http://bugs.launchpad.net/ubuntu/"
> UBUNTU=5FCODENAME=3Dxenial
> =20
> ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$ uname -a
> Linux ubuntu 4.4.0-31-generic #50-Ubuntu SMP Wed Jul 13 00:07:12 UTC
>2016 x86=5F64 x86=5F64 x86=5F64 GNU/Linux
> =20
> Below are the steps I did:=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> ixia@ubuntu:~/yosemite$ git clone
>https://github.com/openbmc/openbmc.git
> Cloning into 'openbmc'...
> remote: Enumerating objects: 83, done.
> remote: Counting objects: 100% (83/83), done.
> remote: Compressing objects: 100% (56/56), done.
> remote: Total 136476 (delta 39), reused 71 (delta 27), pack-reused
>136393
> Receiving objects: 100% (136476/136476), 66.46 MiB | 2.79 MiB/s,
>done.
> Resolving deltas: 100% (72806/72806), done.
> Checking connectivity... done.
> =20
> ixia@ubuntu:~/yosemite/openbmc$ . setup yosemitev2
> Machine yosemitev2 found in meta-facebook/meta-yosemitev2
> You had no conf/local.conf file. This configuration file has
>therefore been
> created for you with some default values. You may wish to edit it
>to, for
> example, select a different MACHINE (target hardware). See
>conf/local.conf
> for more information as common configuration options are commented.
> =20
> You had no conf/bblayers.conf file. This configuration file has
>therefore been
> created for you with some default values. To add additional metadata
>layers
> into your configuration please add entries to conf/bblayers.conf.
> =20
> The Yocto Project has extensive documentation about OE including a
>reference
> manual which can be found at:
>      http://yoctoproject.org/documentation
> =20
> For more information about OpenEmbedded see their website:
>      http://www.openembedded.org/
> =20
> Common targets are:
>      obmc-phosphor-image
> ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$
> =20
> ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$ df -h
> df: /mnt/hgfs: Protocol error
> Filesystem      Size  Used Avail Use% Mounted on
> udev            7.9G     0  7.9G   0% /dev
> tmpfs           1.6G  9.4M  1.6G   1% /run
> /dev/sda1        91G  5.4G   81G   7% /
> tmpfs           7.9G  212K  7.9G   1% /dev/shm
> tmpfs           5.0M  4.0K  5.0M   1% /run/lock
> tmpfs           7.9G     0  7.9G   0% /sys/fs/cgroup
> tmpfs           1.6G   52K  1.6G   1% /run/user/1000
> /dev/sr0         46M   46M     0 100% /media/ixia/CDROM
> ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$
> =20
> ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$ bitbake
>obmc-phosphor-image
> ERROR:  OE-core's config sanity checker detected a potential
>misconfiguration.
>     Either fix the cause of this error or at your own risk disable
>the checker (see sanity.conf).
>     Following is the list of potential problems / advisories:
> =20
>     Your version of gcc is older than 6.0 and will break builds.
>Please install a newer version of gcc (you could use the  project's
>buildtools-extended-tarball or use scripts/install-buildtools).
> =20
> =20
> Summary: There was 1 ERROR message shown, returning a non-zero exit
>code.
> ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$
> =20
> ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$ sudo
>../../scripts/install-buildtools
> INFO: Fetching buildtools installer
> INFO: Fetching buildtools installer checksum
> INFO: Checksum success
> INFO: Making installer executable
> Extended Build tools installer version 3.1+snapshot
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> You are about to install the SDK to
>"/home/ixia/yosemite/openbmc/poky/buildtools". Proceed [Y/n]? Y
> Extracting SDK..................done
> Setting it up...done
> SDK has been successfully set up and is ready to be used.
> Each time you wish to use the SDK in a new shell session, you need
>to source the environment setup script e.g.
> $ .
>/home/ixia/yosemite/openbmc/poky/buildtools/environment-setup-x86=5F64-
>pokysdk-linux
> INFO: Setting up the environment
> INFO: Testing installation
> INFO: Installation successful. Remember to source the environment
>setup script now and in any new session.
> ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$ .
>/home/ixia/yosemite/openbmc/poky/buildtools/environment-setup-x86=5F64-
>pokysdk-linux
> ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$ bitbake
>obmc-phosphor-image
> =20
> Thank you,=20
> Mahesh
> =20
> =20
> =20
> =20
>        =20

