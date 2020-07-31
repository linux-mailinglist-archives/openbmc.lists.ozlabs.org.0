Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25551234B2B
	for <lists+openbmc@lfdr.de>; Fri, 31 Jul 2020 20:37:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BJGH83MPbzDqfc
	for <lists+openbmc@lfdr.de>; Sat,  1 Aug 2020 04:37:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=keysight.com (client-ip=205.220.173.93;
 helo=mx0b-003cac01.pphosted.com; envelope-from=mahesh.kurapati@keysight.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=keysight.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=keysight.com header.i=@keysight.com header.a=rsa-sha256
 header.s=selector1 header.b=goCcny16; 
 dkim-atps=neutral
X-Greylist: delayed 1151 seconds by postgrey-1.36 at bilbo;
 Sat, 01 Aug 2020 04:36:34 AEST
Received: from mx0b-003cac01.pphosted.com (mx0b-003cac01.pphosted.com
 [205.220.173.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BJGFt2cm7zDqXT
 for <openbmc@lists.ozlabs.org>; Sat,  1 Aug 2020 04:36:31 +1000 (AEST)
Received: from pps.filterd (m0187217.ppops.net [127.0.0.1])
 by mx0b-003cac01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06VIAW8c028755
 for <openbmc@lists.ozlabs.org>; Fri, 31 Jul 2020 11:17:13 -0700
Authentication-Results: ppops.net;
 dkim=pass header.d=keysight.com header.s=selector1
Received: from nam04-bn3-obe.outbound.protection.outlook.com
 (mail-bn3nam04lp2054.outbound.protection.outlook.com [104.47.46.54])
 by mx0b-003cac01.pphosted.com with ESMTP id 32mr0yg18r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 31 Jul 2020 11:17:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mt1ztq+nI17iVjGmXxXPMn4OifGUk9Br8GqFWnnxIVqv4QjZlUY63D6yxFQu5nAntz77IjA3gaxHjcdCh9MRP9QhKlQV8lo/xjqiHV5lL/nGVGIPdaExzy3z30hvTvaJ/+fUyU+K1mZpZFXaDnFcYstPhJC1RhKAiQzXZeS4Fdyk7K/oVbbHQJvIyzQi1AhOwoS6QOx9RqKI81Hv49AJ4ZdPZ2QJLxGxKEagYUbRjrKceL8ItFbyMmIBKABdSRPTUH/CtBBnzMplKUMKz5/vZhsytb7i0WsWtNtXMzU7zPaG0Bo9znOLc4JnnBYyc/p7++CxFbdG0WPK4lGAxDPfuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJCTCNol7AU0l+YFdEEgvk/CAKC3O0NWP49eKnyk0uw=;
 b=GerU+96nZMbLthyrdj+14am0oyUgfzCBfDHMu0uQL0cCuAmFRV8T1xFm+tuDwtvg1KHPJzQGBmXb4Go5EPyXHuJfC3/4FZVwtL91kNSmJqUOFB9A76LyDF3kLRFA1YQKIssLkFGCui2G90IqRsZFsGOzWI5lNDQpXHcwWu0ZwHeVs7LYCA6zZl6Hc2kcDvSnTi//GVyHF+paZ8po6vDFr9VvzvDd0Iuej83sgiA7IkSfEfNaFDm/dT9V0Yln+U+XOyuigPoGRWKn4J6emjtNDpr4O9WqU+a30EeWDT0kpOACwqk8ra125+ESre6IcWZmibEr9rXpvehD68wZuSFbbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJCTCNol7AU0l+YFdEEgvk/CAKC3O0NWP49eKnyk0uw=;
 b=goCcny16xvdxTePEINaxpwg16fpoeb6txk36Gu9ZM43hclbm8v41CMrUOzdzk3dHiTU5SpFStnczpkGxHxSz8mzzmLliBz2adfjVjOl/f2BmxhdX5AKkvkPYy7CCwA6qo/sb8ZOUjfpPwDwkorR4FIsjpD+/HtyeZHjAsfudpVo=
Received: from SN6PR17MB2558.namprd17.prod.outlook.com (2603:10b6:805:db::20)
 by SN6PR17MB2271.namprd17.prod.outlook.com (2603:10b6:805:41::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.18; Fri, 31 Jul
 2020 18:17:09 +0000
Received: from SN6PR17MB2558.namprd17.prod.outlook.com
 ([fe80::b570:201a:5e7f:6e6f]) by SN6PR17MB2558.namprd17.prod.outlook.com
 ([fe80::b570:201a:5e7f:6e6f%4]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 18:17:08 +0000
From: Mahesh Kurapati <mahesh.kurapati@keysight.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: OpenBMC build fails in VM ubuntu 16.04 for yosemitev2
Thread-Topic: OpenBMC build fails in VM ubuntu 16.04 for yosemitev2
Thread-Index: AdZnZswzVEbnWhX8To2rMsCHYq5pAw==
Date: Fri, 31 Jul 2020 18:17:08 +0000
Message-ID: <SN6PR17MB25580E5C6278629955BE548B964E0@SN6PR17MB2558.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=keysight.com;
x-originating-ip: [64.157.241.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a86c1ed8-a5cc-49af-9c97-08d8357df027
x-ms-traffictypediagnostic: SN6PR17MB2271:
x-microsoft-antispam-prvs: <SN6PR17MB22714594E759E1703F6AFCA8964E0@SN6PR17MB2271.namprd17.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nVqxY5ZNRKysr94ecOfioY7TnEwv7DNoRUZCyzOcPO8VpagpA/AcQtQUEpFQvo+up7i4cyE39ielyKHjngoxuvnvtkAFYnuzX9L2Qr5pRe8FJNkX4OsZAf7MTe4LalZEg1m4H1l23ayuP8afOgb8M1SA3B2bfeYJHExjEm4w/2p0wKwoAS6euTKuHTCgI2HaybjTk1jDkV6dqI5h88FtPbv0CNehqUJgdHG2lrCjMNad1F3zPcrtGdCq85Y+LaD3mLU00hGkv3m6PUPyVDQPgjugB9RK7dwqwDZFwzvD6WdetExwPDSKUisRyaCTZOQt2QwUhaGs5z9zcljprua/GGPBi9F1aFcD1AWQR9BDPjf4InBaZ+D6J361E1SxqPaXUnF3I/Q+KTl5i4ucph7m2Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR17MB2558.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(396003)(346002)(376002)(366004)(39860400002)(55016002)(86362001)(8676002)(9686003)(316002)(44832011)(33656002)(71200400001)(52536014)(5660300002)(8936002)(966005)(66946007)(76116006)(83380400001)(6916009)(66446008)(64756008)(66556008)(66616009)(99936003)(26005)(6506007)(66476007)(2906002)(186003)(478600001)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Y9fTdktZAgJIRZFl8+GhgTI/iQgPE/m4CfDOi1/ANaB7K0r4uHtE/ImkOfIFZ5XLLHXn9x5Pym9tmVW8G/VPnvV2IkU9TTpsUQ26iFISZ+zmaG70Z9qfq5G241DVt8um85IEAUM04AXkMrFPTyBptkAF0xm7iZXnXi52fpkb0sAXL4Gg+9e8mMLcZudxRBKTq9BO7NVVbJjd4gNFNQMc0OohYXWMJfwZPnvFl/1pGEJnexFtmqHyprw7c2CYWD5LIgAJTeacRdUPiVnlttB+R0xijWzuze4kRdtFMahBqKp4fuepE+VkLSs1s3mBiG+xB0rKeLe6SHC8+HqxnRAB09QueV4Z9w7XTvKdammdBJbO59ftPxsWGEwBnGiLSokOKwMhNaUTT5t1YM7gAR+raX/amXQ1FXKOz7VYYdHg4FYBXvKeeTQP0mm2m0y34805Ch5QUKEEYq4sU2G0yDNUA7UqQRhAOCorL0i+MG/OlArKIZkPpkzwBp49wPywzUiyTtEqa7dT1YxWoJXxVWqQLgNPq277UxhkKMJ4Khk/Es33UAMtMjbg/9iuei2KoYrB/RsxIp7TFcOCpf9vELqX+6B2wNZ2bD4xllMRqTPRXxQyKeu7wd6Vhzeiw+nuT5m1PUp5nzv1GHoZr5q+hGnOAw==
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
 boundary="_004_SN6PR17MB25580E5C6278629955BE548B964E0SN6PR17MB2558namp_"
MIME-Version: 1.0
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR17MB2558.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a86c1ed8-a5cc-49af-9c97-08d8357df027
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2020 18:17:08.8407 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jxEVL2zBoj5lP/FDrG23BurW3qhS6XS/WlO3KdFYPKr2rNIHgKggXUrQciVeuOpaGlGB+85rzHtl0nv+pKQzhGUCpz2dvnTbne5WS7DiL3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR17MB2271
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_07:2020-07-31,
 2020-07-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 clxscore=1011 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007310136
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_004_SN6PR17MB25580E5C6278629955BE548B964E0SN6PR17MB2558namp_
Content-Type: multipart/alternative;
	boundary="_000_SN6PR17MB25580E5C6278629955BE548B964E0SN6PR17MB2558namp_"

--_000_SN6PR17MB25580E5C6278629955BE548B964E0SN6PR17MB2558namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

I am new to the OpenBMC. I am building the OpenBMC yosemitev2 target in a V=
M and it is failing.  Below is the error I see from the do_compile output. =
 Also attached the compile log file. What am I doing incorrectly?

Error:
Provides: linux-libc-headers-dev =3D 5.4-r0
Requires(rpmlib): rpmlib(CompressedFileNames) <=3D 3.0.4-1 rpmlib(FileDiges=
ts) <=3D 4.6.0-1 rpmlib(PayloadFilesHavePrefix) <=3D 4.0-1
Checking for unpackaged file(s): /home/ixia/yosemite/openbmc/build/yosemite=
v2/tmp/work/arm1176jzs-openbmc-linux-gnueabi/linux-libc-headers/5.4-r0/reci=
pe-sysroot-native/usr/bin/../../usr/lib/rpm/check-files /home/ixia/yosemite=
/openbmc/build/yosemitev2/tmp/work/arm1176jzs-openbmc-linux-gnueabi/linux-l=
ibc-headers/5.4-r0/package
Segmentation fault (core dumped)
WARNING: exit code 139 from a shell command.
ERROR: Error executing a python function in exec_python_func() autogenerate=
d:

The stack trace of python calls that resulted in this exception/failure was=
:
File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
     0001:
*** 0002:do_package_rpm(d)
     0003:
File: '/home/ixia/yosemite/openbmc/meta/classes/package_rpm.bbclass', linen=
o: 716, function: do_package_rpm
     0712:
     0713:    # Build the rpm package!
     0714:    d.setVar('BUILDSPEC', cmd + "\n" + cleanupcmd + "\n")
     0715:    d.setVarFlag('BUILDSPEC', 'func', '1')
*** 0716:    bb.build.exec_func('BUILDSPEC', d)
     0717:
     0718:    if d.getVar('RPM_SIGN_PACKAGES') =3D=3D '1':
     0719:        bb.build.exec_func("sign_rpm", d)
     0720:}
File: '/home/ixia/yosemite/openbmc/poky/bitbake/lib/bb/build.py', lineno: 2=
51, function: exec_func


VM Details:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$ cat /etc/os-release
NAME=3D"Ubuntu"
VERSION=3D"16.04.1 LTS (Xenial Xerus)"
ID=3Dubuntu
ID_LIKE=3Ddebian
PRETTY_NAME=3D"Ubuntu 16.04.1 LTS"
VERSION_ID=3D"16.04"
HOME_URL=3D"http://www.ubuntu.com/"
SUPPORT_URL=3D"http://help.ubuntu.com/"
BUG_REPORT_URL=3D"http://bugs.launchpad.net/ubuntu/"
UBUNTU_CODENAME=3Dxenial

ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$ uname -a
Linux ubuntu 4.4.0-31-generic #50-Ubuntu SMP Wed Jul 13 00:07:12 UTC 2016 x=
86_64 x86_64 x86_64 GNU/Linux

Below are the steps I did:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
ixia@ubuntu:~/yosemite$ git clone https://github.com/openbmc/openbmc.git
Cloning into 'openbmc'...
remote: Enumerating objects: 83, done.
remote: Counting objects: 100% (83/83), done.
remote: Compressing objects: 100% (56/56), done.
remote: Total 136476 (delta 39), reused 71 (delta 27), pack-reused 136393
Receiving objects: 100% (136476/136476), 66.46 MiB | 2.79 MiB/s, done.
Resolving deltas: 100% (72806/72806), done.
Checking connectivity... done.

ixia@ubuntu:~/yosemite/openbmc$ . setup yosemitev2
Machine yosemitev2 found in meta-facebook/meta-yosemitev2
You had no conf/local.conf file. This configuration file has therefore been
created for you with some default values. You may wish to edit it to, for
example, select a different MACHINE (target hardware). See conf/local.conf
for more information as common configuration options are commented.

You had no conf/bblayers.conf file. This configuration file has therefore b=
een
created for you with some default values. To add additional metadata layers
into your configuration please add entries to conf/bblayers.conf.

The Yocto Project has extensive documentation about OE including a referenc=
e
manual which can be found at:
    http://yoctoproject.org/documentation

For more information about OpenEmbedded see their website:
    http://www.openembedded.org/

Common targets are:
     obmc-phosphor-image
ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$

ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$ df -h
df: /mnt/hgfs: Protocol error
Filesystem      Size  Used Avail Use% Mounted on
udev            7.9G     0  7.9G   0% /dev
tmpfs           1.6G  9.4M  1.6G   1% /run
/dev/sda1        91G  5.4G   81G   7% /
tmpfs           7.9G  212K  7.9G   1% /dev/shm
tmpfs           5.0M  4.0K  5.0M   1% /run/lock
tmpfs           7.9G     0  7.9G   0% /sys/fs/cgroup
tmpfs           1.6G   52K  1.6G   1% /run/user/1000
/dev/sr0         46M   46M     0 100% /media/ixia/CDROM
ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$

ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$ bitbake obmc-phosphor-imag=
e
ERROR:  OE-core's config sanity checker detected a potential misconfigurati=
on.
    Either fix the cause of this error or at your own risk disable the chec=
ker (see sanity.conf).
    Following is the list of potential problems / advisories:

    Your version of gcc is older than 6.0 and will break builds. Please ins=
tall a newer version of gcc (you could use the project's buildtools-extende=
d-tarball or use scripts/install-buildtools).


Summary: There was 1 ERROR message shown, returning a non-zero exit code.
ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$

ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$ sudo ../../scripts/install=
-buildtools
INFO: Fetching buildtools installer
INFO: Fetching buildtools installer checksum
INFO: Checksum success
INFO: Making installer executable
Extended Build tools installer version 3.1+snapshot
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
You are about to install the SDK to "/home/ixia/yosemite/openbmc/poky/build=
tools". Proceed [Y/n]? Y
Extracting SDK..................done
Setting it up...done
SDK has been successfully set up and is ready to be used.
Each time you wish to use the SDK in a new shell session, you need to sourc=
e the environment setup script e.g.
$ . /home/ixia/yosemite/openbmc/poky/buildtools/environment-setup-x86_64-po=
kysdk-linux
INFO: Setting up the environment
INFO: Testing installation
INFO: Installation successful. Remember to source the environment setup scr=
ipt now and in any new session.
ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$ . /home/ixia/yosemite/open=
bmc/poky/buildtools/environment-setup-x86_64-pokysdk-linux
ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$ bitbake obmc-phosphor-imag=
e

Thank you,
Mahesh





--_000_SN6PR17MB25580E5C6278629955BE548B964E0SN6PR17MB2558namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
Hi all, <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
<o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
I am new to the OpenBMC. I am building the OpenBMC yosemitev2 target in a V=
M and it is failing.&nbsp; Below is the error I see from the do_compile out=
put.&nbsp; Also attached the compile log file. What am I
 doing incorrectly? <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
<o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><u><span style=3D"font-family:&quot;Courier New&quot=
;">Error: <o:p></o:p></span></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;">Provides: linux-libc-headers-dev =3D 5.4-r0<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;">Requires(rpmlib): rpmlib(CompressedFileNames) &lt;=3D 3.0.4=
-1 rpmlib(FileDigests) &lt;=3D 4.6.0-1 rpmlib(PayloadFilesHavePrefix) &lt;=
=3D 4.0-1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;">Checking for unpackaged file(s): /home/ixia/yosemite/openbm=
c/build/yosemitev2/tmp/work/arm1176jzs-openbmc-linux-gnueabi/linux-libc-hea=
ders/5.4-r0/recipe-sysroot-native/usr/bin/../../usr/lib/rpm/check-files
 /home/ixia/yosemite/openbmc/build/yosemitev2/tmp/work/arm1176jzs-openbmc-l=
inux-gnueabi/linux-libc-headers/5.4-r0/package<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;">Segmentation fault (core dumped)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;">WARNING: exit code 139 from a shell command.<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;;background:silver;mso-highlight:silver">ERROR: Error executi=
ng a python function in exec_python_func() autogenerated:</span><span style=
=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;"><o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;">The stack trace of python calls that resulted in this excep=
tion/failure was:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;">File: 'exec_python_func() autogenerated', lineno: 2, functi=
on: &lt;module&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp; 0001:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;">*** 0002:do_package_rpm(d)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp; 0003:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;">File: '/home/ixia/yosemite/openbmc/meta/classes/package_rpm=
.bbclass', lineno: 716, function: do_package_rpm<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp; 0712:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp; 0713:&nbsp;&nbsp;&nbsp; # Build th=
e rpm package!<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp; 0714:&nbsp;&nbsp;&nbsp; d.setVar('=
BUILDSPEC', cmd + &quot;\n&quot; + cleanupcmd + &quot;\n&quot;)<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp; 0715:&nbsp;&nbsp;&nbsp; d.setVarFl=
ag('BUILDSPEC', 'func', '1')<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;">*** 0716:&nbsp;&nbsp;&nbsp; bb.build.exec_func('BUILDSPEC',=
 d)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp; 0717:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp; 0718:&nbsp;&nbsp;&nbsp; if d.getVa=
r('RPM_SIGN_PACKAGES') =3D=3D '1':<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp; 0719:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; bb.build.exec_func(&quot;sign_rpm&quot;, d)<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp; 0720:}<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;">File: '/home/ixia/yosemite/openbmc/poky/bitbake/lib/bb/buil=
d.py', lineno: 251, function: exec_func<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
<o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
<o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
VM Details: <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$ cat /etc/os-release
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">NAME=3D&quot;Ubuntu&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">VERSION=3D&quot;16.04.1 LTS (Xenial Xerus)&quot;<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">ID=3Dubuntu<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">ID_LIKE=3Ddebian<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">PRETTY_NAME=3D&quot;Ubuntu 16.04.1 LTS&quot;<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">VERSION_ID=3D&quot;16.04&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">HOME_URL=3D&quot;http://www.ubuntu.com/&quot;<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">SUPPORT_URL=3D&quot;http://help.ubuntu.com/&quot;<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">BUG_REPORT_URL=3D&quot;http://bugs.launchpad.net/ubuntu/&qu=
ot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">UBUNTU_CODENAME=3Dxenial<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$ uname -a<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">Linux ubuntu 4.4.0-31-generic #50-Ubuntu SMP Wed Jul 13 00:=
07:12 UTC 2016 x86_64 x86_64 x86_64 GNU/Linux<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
<o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
Below are the steps I did:
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ixia@ubuntu:~/yosemite$ git clone https://github.com/openbmc/openbmc.git<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">Cloning into 'openbmc'...<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">remote: Enumerating objects: 83, done.<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">remote: Counting objects: 100% (83/83), done.<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">remote: Compressing objects: 100% (56/56), done.<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">remote: Total 136476 (delta 39), reused 71 (delta 27), pack=
-reused 136393<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">Receiving objects: 100% (136476/136476), 66.46 MiB | 2.79 M=
iB/s, done.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">Resolving deltas: 100% (72806/72806), done.<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">Checking connectivity... done.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
<o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ixia@ubuntu:~/yosemite/openbmc$ . setup yosemitev2<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">Machine yosemitev2 found in meta-facebook/meta-yosemitev2<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">You had no conf/local.conf file. This configuration file ha=
s therefore been<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">created for you with some default values. You may wish to e=
dit it to, for<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">example, select a different MACHINE (target hardware). See =
conf/local.conf<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">for more information as common configuration options are co=
mmented.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">You had no conf/bblayers.conf file. This configuration file=
 has therefore been<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">created for you with some default values. To add additional=
 metadata layers<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">into your configuration please add entries to conf/bblayers=
.conf.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">The Yocto Project has extensive documentation about OE incl=
uding a reference<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">manual which can be found at:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">&nbsp;&nbsp;&nbsp; http://yoctoproject.org/documentation<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">For more information about OpenEmbedded see their website:<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">&nbsp;&nbsp;&nbsp; http://www.openembedded.org/<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">Common targets are:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp; obmc-phosphor-image<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
<o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$ df -h<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">df: /mnt/hgfs: Protocol error<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">Filesystem&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Size&nbsp; Used Av=
ail Use% Mounted on<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">udev&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; 7.9G&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp; 7.9G&nbsp;&nbsp; 0% /dev<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">tmpfs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; 1.6G&nbsp; 9.4M&nbsp; 1.6G&nbsp;&nbsp; 1% /run<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">/dev/sda1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 91G&nbs=
p; 5.4G&nbsp;&nbsp; 81G&nbsp;&nbsp; 7% /<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">tmpfs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; 7.9G&nbsp; 212K&nbsp; 7.9G&nbsp;&nbsp; 1% /dev/shm<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">tmpfs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; 5.0M&nbsp; 4.0K&nbsp; 5.0M&nbsp;&nbsp; 1% /run/lock<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">tmpfs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; 7.9G&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp; 7.9G&nbsp;&nbsp; 0% /sys/fs/cgr=
oup<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">tmpfs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; 1.6G&nbsp;&nbsp; 52K&nbsp; 1.6G&nbsp;&nbsp; 1% /run/user/1000<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">/dev/sr0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 46=
M&nbsp;&nbsp; 46M&nbsp;&nbsp;&nbsp;&nbsp; 0 100% /media/ixia/CDROM<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
<o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$ bitbake obmc-phosphor-imag=
e<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">ERROR:&nbsp; OE-core's config sanity checker detected a pot=
ential misconfiguration.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">&nbsp;&nbsp;&nbsp; Either fix the cause of this error or at=
 your own risk disable the checker (see sanity.conf).<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">&nbsp;&nbsp;&nbsp; Following is the list of potential probl=
ems / advisories:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">&nbsp;&nbsp;&nbsp; Your version of gcc is older than 6.0 an=
d will break builds. Please install a newer version of gcc (you could use t=
he project's buildtools-extended-tarball or use scripts/install-buildtools)=
.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">Summary: There was 1 ERROR message shown, returning a non-z=
ero exit code.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
<o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$ sudo ../../scripts/install=
-buildtools<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">INFO: Fetching buildtools installer<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">INFO: Fetching buildtools installer checksum<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">INFO: Checksum success<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">INFO: Making installer executable<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">Extended Build tools installer version 3.1+snapshot<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">You are about to install the SDK to &quot;/home/ixia/yosemi=
te/openbmc/poky/buildtools&quot;. Proceed [Y/n]? Y<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">Extracting SDK..................done<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">Setting it up...done<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">SDK has been successfully set up and is ready to be used.<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">Each time you wish to use the SDK in a new shell session, y=
ou need to source the environment setup script e.g.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">$ . /home/ixia/yosemite/openbmc/poky/buildtools/environment=
-setup-x86_64-pokysdk-linux<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">INFO: Setting up the environment<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">INFO: Testing installation<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;">INFO: Installation successful. Remember to source the envir=
onment setup script now and in any new session.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$ . /home/ixia/yosemite/open=
bmc/poky/buildtools/environment-setup-x86_64-pokysdk-linux<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ixia@ubuntu:~/yosemite/openbmc/build/yosemitev2$ bitbake obmc-phosphor-imag=
e<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
<o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
Thank you, <br>
Mahesh<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
<o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
<o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
<o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
<o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_SN6PR17MB25580E5C6278629955BE548B964E0SN6PR17MB2558namp_--

--_004_SN6PR17MB25580E5C6278629955BE548B964E0SN6PR17MB2558namp_
Content-Type: application/octet-stream; name="compile.log"
Content-Description: compile.log
Content-Disposition: attachment; filename="compile.log"; size=8858;
	creation-date="Fri, 31 Jul 2020 18:16:00 GMT";
	modification-date="Fri, 31 Jul 2020 18:15:49 GMT"
Content-Transfer-Encoding: base64

REVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gc3N0YXRlX3Rhc2tfcHJlZnVuYw0KREVC
VUc6IFB5dGhvbiBmdW5jdGlvbiBzc3RhdGVfdGFza19wcmVmdW5jIGZpbmlzaGVkDQpERUJVRzog
RXhlY3V0aW5nIHB5dGhvbiBmdW5jdGlvbiBleHRlbmRfcmVjaXBlX3N5c3Jvb3QNCk5PVEU6IERp
cmVjdCBkZXBlbmRlbmNpZXMgYXJlIFsndmlydHVhbDpuYXRpdmU6L2hvbWUvaXhpYS95b3NlbWl0
ZS9vcGVuYm1jL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ycG0vcnBtXzQuMTUuMS5iYjpkb19wb3B1
bGF0ZV9zeXNyb290JywgJ3ZpcnR1YWw6bmF0aXZlOi9ob21lL2l4aWEveW9zZW1pdGUvb3BlbmJt
Yy9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcA0Kc2V1ZG8vcHNldWRvX2dpdC5iYjpkb19wb3B1bGF0
ZV9zeXNyb290J10NCk5PVEU6IEluc3RhbGxlZCBpbnRvIHN5c3Jvb3Q6IFtdDQpOT1RFOiBTa2lw
cGluZyBhcyBhbHJlYWR5IGV4aXN0cyBpbiBzeXNyb290OiBbJ3JwbS1uYXRpdmUnLCAncHNldWRv
LW5hdGl2ZScsICdweXRob24zLW5hdGl2ZScsICdsaWJ0b29sLW5hdGl2ZScsICd4ei1uYXRpdmUn
LCAnZGJ1cy1uYXRpdmUnLCAnZGItbmF0aXZlJywgJ2F1dG9tYWtlLW5hdGl2ZScsICdvcGVuc3Ns
LW5hdGl2ZScsICdwa2djb25maWctbmENCnRpdmUnLCAncXVpbHQtbmF0aXZlJywgJ2dudS1jb25m
aWctbmF0aXZlJywgJ3BvcHQtbmF0aXZlJywgJ2dldHRleHQtbWluaW1hbC1uYXRpdmUnLCAnZmls
ZS1uYXRpdmUnLCAnZWxmdXRpbHMtbmF0aXZlJywgJ2J6aXAyLW5hdGl2ZScsICdsaWJhcmNoaXZl
LW5hdGl2ZScsICdwZXJsLW5hdGl2ZScsICdhdXRvY29uZi1uYXRpdmUnLCAnc3FsaXRlMy1uYXRp
dg0KZScsICdnZGJtLW5hdGl2ZScsICdyZWFkbGluZS1uYXRpdmUnLCAnbGliZmZpLW5hdGl2ZScs
ICdsaWJuc2wyLW5hdGl2ZScsICd1dGlsLWxpbnV4LW5hdGl2ZScsICdsaWJ0aXJwYy1uYXRpdmUn
LCAnemxpYi1uYXRpdmUnLCAndGV4aW5mby1kdW1teS1uYXRpdmUnLCAnZXhwYXQtbmF0aXZlJywg
J2UyZnNwcm9ncy1uYXRpdmUnLCAnbHpvLW5hdGl2ZScsICdtDQo0LW5hdGl2ZScsICduY3Vyc2Vz
LW5hdGl2ZScsICdsaWJwY3JlMi1uYXRpdmUnLCAnbGliY2FwLW5nLW5hdGl2ZScsICdjbWFrZS1u
YXRpdmUnLCAnbmluamEtbmF0aXZlJywgJ2F0dHItbmF0aXZlJywgJ2N1cmwtbmF0aXZlJywgJ3Jl
MmMtbmF0aXZlJ10NCkRFQlVHOiBQeXRob24gZnVuY3Rpb24gZXh0ZW5kX3JlY2lwZV9zeXNyb290
IGZpbmlzaGVkDQpERUJVRzogRXhlY3V0aW5nIHB5dGhvbiBmdW5jdGlvbiBkb19wYWNrYWdlX3dy
aXRlX3JwbQ0KREVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gcmVhZF9zdWJwYWNrYWdl
X21ldGFkYXRhDQpERUJVRzogUHl0aG9uIGZ1bmN0aW9uIHJlYWRfc3VicGFja2FnZV9tZXRhZGF0
YSBmaW5pc2hlZA0KREVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gZG9fcGFja2FnZV9y
cG0NCkRFQlVHOiBFeGVjdXRpbmcgcHl0aG9uIGZ1bmN0aW9uIHdyaXRlX3NwZWNmaWxlDQpOT1RF
OiBOb3QgY3JlYXRpbmcgZW1wdHkgUlBNIHBhY2thZ2UgZm9yIGxpbnV4LWxpYmMtaGVhZGVycy1z
cmMNCk5PVEU6IENyZWF0aW5nIGVtcHR5IFJQTSBwYWNrYWdlIGZvciBsaW51eC1saWJjLWhlYWRl
cnMtZGJnDQpOT1RFOiBOb3QgY3JlYXRpbmcgZW1wdHkgUlBNIHBhY2thZ2UgZm9yIGxpbnV4LWxp
YmMtaGVhZGVycy1zdGF0aWNkZXYNCk5PVEU6IENyZWF0aW5nIFJQTSBwYWNrYWdlIGZvciBsaW51
eC1saWJjLWhlYWRlcnMtZGV2DQpOT1RFOiBOb3QgY3JlYXRpbmcgZW1wdHkgUlBNIHBhY2thZ2Ug
Zm9yIGxpbnV4LWxpYmMtaGVhZGVycy1kb2MNCk5PVEU6IE5vdCBjcmVhdGluZyBlbXB0eSBSUE0g
cGFja2FnZSBmb3IgbGludXgtbGliYy1oZWFkZXJzLWxvY2FsZQ0KTk9URTogTm90IGNyZWF0aW5n
IGVtcHR5IFJQTSBwYWNrYWdlIGZvciBsaW51eC1saWJjLWhlYWRlcnMNCkRFQlVHOiBQeXRob24g
ZnVuY3Rpb24gd3JpdGVfc3BlY2ZpbGUgZmluaXNoZWQNCkRFQlVHOiBQS0dXUklURURJUjogL2hv
bWUvaXhpYS95b3NlbWl0ZS9vcGVuYm1jL2J1aWxkL3lvc2VtaXRldjIvdG1wL3dvcmsvYXJtMTE3
Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvbGludXgtbGliYy1oZWFkZXJzLzUuNC1yMC9kZXBs
b3ktcnBtcy9hcm0xMTc2anpzDQpERUJVRzogRXhlY3V0aW5nIHNoZWxsIGZ1bmN0aW9uIEJVSUxE
U1BFQw0KQnVpbGRpbmcgdGFyZ2V0IHBsYXRmb3JtczogYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4
DQpCdWlsZGluZyBmb3IgdGFyZ2V0IGFybTExNzZqenMtb3BlbmJtYy1saW51eA0KUHJvY2Vzc2lu
ZyBmaWxlczogbGludXgtbGliYy1oZWFkZXJzLWRiZy01LjQtcjAuYXJtMTE3Nmp6cw0KUHJvY2Vz
c2luZyBmaWxlczogbGludXgtbGliYy1oZWFkZXJzLWRldi01LjQtcjAuYXJtMTE3Nmp6cw0Kd2Fy
bmluZzogRGVwcmVjYXRlZCBleHRlcm5hbCBkZXBlbmRlbmN5IGdlbmVyYXRvciBpcyB1c2VkIQ0K
RmluZGluZyAgUHJvdmlkZXM6IA0KRmluZGluZyAgUmVxdWlyZXMoaW50ZXJwKTogDQpGaW5kaW5n
ICBSZXF1aXJlcyhycG1saWIpOiANCkZpbmRpbmcgIFJlcXVpcmVzKHZlcmlmeSk6IA0KRmluZGlu
ZyAgUmVxdWlyZXMocHJlKTogDQpGaW5kaW5nICBSZXF1aXJlcyhwb3N0KTogDQpGaW5kaW5nICBS
ZXF1aXJlcyhwcmV1bik6IA0KRmluZGluZyAgUmVxdWlyZXMocG9zdHVuKTogDQpGaW5kaW5nICBS
ZXF1aXJlcyhwcmV0cmFucyk6IA0KRmluZGluZyAgUmVxdWlyZXMocG9zdHRyYW5zKTogDQpGaW5k
aW5nICBSZXF1aXJlczogDQpGaW5kaW5nICBDb25mbGljdHM6IA0KRmluZGluZyAgT2Jzb2xldGVz
OiANCkZpbmRpbmcgIFJlY29tbWVuZHM6IA0KRmluZGluZyAgU3VnZ2VzdHM6IA0KRmluZGluZyAg
U3VwcGxlbWVudHM6IA0KRmluZGluZyAgRW5oYW5jZXM6IA0KUHJvdmlkZXM6IGxpbnV4LWxpYmMt
aGVhZGVycy1kZXYgPSA1LjQtcjANClJlcXVpcmVzKHJwbWxpYik6IHJwbWxpYihDb21wcmVzc2Vk
RmlsZU5hbWVzKSA8PSAzLjAuNC0xIHJwbWxpYihGaWxlRGlnZXN0cykgPD0gNC42LjAtMSBycG1s
aWIoUGF5bG9hZEZpbGVzSGF2ZVByZWZpeCkgPD0gNC4wLTENCkNoZWNraW5nIGZvciB1bnBhY2th
Z2VkIGZpbGUocyk6IC9ob21lL2l4aWEveW9zZW1pdGUvb3BlbmJtYy9idWlsZC95b3NlbWl0ZXYy
L3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL2xpbnV4LWxpYmMtaGVh
ZGVycy81LjQtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vLi4vLi4vdXNyL2xpYi9y
cG0vY2hlY2stZmlsZQ0KcyAvaG9tZS9peGlhL3lvc2VtaXRlL29wZW5ibWMvYnVpbGQveW9zZW1p
dGV2Mi90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9saW51eC1saWJj
LWhlYWRlcnMvNS40LXIwL3BhY2thZ2UNClNlZ21lbnRhdGlvbiBmYXVsdCAoY29yZSBkdW1wZWQp
DQpXQVJOSU5HOiBleGl0IGNvZGUgMTM5IGZyb20gYSBzaGVsbCBjb21tYW5kLg0KRVJST1I6IEVy
cm9yIGV4ZWN1dGluZyBhIHB5dGhvbiBmdW5jdGlvbiBpbiBleGVjX3B5dGhvbl9mdW5jKCkgYXV0
b2dlbmVyYXRlZDoNCg0KVGhlIHN0YWNrIHRyYWNlIG9mIHB5dGhvbiBjYWxscyB0aGF0IHJlc3Vs
dGVkIGluIHRoaXMgZXhjZXB0aW9uL2ZhaWx1cmUgd2FzOg0KRmlsZTogJ2V4ZWNfcHl0aG9uX2Z1
bmMoKSBhdXRvZ2VuZXJhdGVkJywgbGluZW5vOiAyLCBmdW5jdGlvbjogPG1vZHVsZT4NCiAgICAg
MDAwMToNCiAqKiogMDAwMjpkb19wYWNrYWdlX3JwbShkKQ0KICAgICAwMDAzOg0KRmlsZTogJy9o
b21lL2l4aWEveW9zZW1pdGUvb3BlbmJtYy9tZXRhL2NsYXNzZXMvcGFja2FnZV9ycG0uYmJjbGFz
cycsIGxpbmVubzogNzE2LCBmdW5jdGlvbjogZG9fcGFja2FnZV9ycG0NCiAgICAgMDcxMjoNCiAg
ICAgMDcxMzogICAgIyBCdWlsZCB0aGUgcnBtIHBhY2thZ2UhDQogICAgIDA3MTQ6ICAgIGQuc2V0
VmFyKCdCVUlMRFNQRUMnLCBjbWQgKyAiXG4iICsgY2xlYW51cGNtZCArICJcbiIpDQogICAgIDA3
MTU6ICAgIGQuc2V0VmFyRmxhZygnQlVJTERTUEVDJywgJ2Z1bmMnLCAnMScpDQogKioqIDA3MTY6
ICAgIGJiLmJ1aWxkLmV4ZWNfZnVuYygnQlVJTERTUEVDJywgZCkNCiAgICAgMDcxNzoNCiAgICAg
MDcxODogICAgaWYgZC5nZXRWYXIoJ1JQTV9TSUdOX1BBQ0tBR0VTJykgPT0gJzEnOg0KICAgICAw
NzE5OiAgICAgICAgYmIuYnVpbGQuZXhlY19mdW5jKCJzaWduX3JwbSIsIGQpDQogICAgIDA3MjA6
fQ0KRmlsZTogJy9ob21lL2l4aWEveW9zZW1pdGUvb3BlbmJtYy9wb2t5L2JpdGJha2UvbGliL2Ji
L2J1aWxkLnB5JywgbGluZW5vOiAyNTEsIGZ1bmN0aW9uOiBleGVjX2Z1bmMNCiAgICAgMDI0Nzog
ICAgd2l0aCBiYi51dGlscy5maWxlc2xvY2tlZChsb2NrZmlsZXMpOg0KICAgICAwMjQ4OiAgICAg
ICAgaWYgaXNweXRob246DQogICAgIDAyNDk6ICAgICAgICAgICAgZXhlY19mdW5jX3B5dGhvbihm
dW5jLCBkLCBydW5maWxlLCBjd2Q9YWRpcikNCiAgICAgMDI1MDogICAgICAgIGVsc2U6DQogKioq
IDAyNTE6ICAgICAgICAgICAgZXhlY19mdW5jX3NoZWxsKGZ1bmMsIGQsIHJ1bmZpbGUsIGN3ZD1h
ZGlyKQ0KICAgICAwMjUyOg0KICAgICAwMjUzOiAgICB0cnk6DQogICAgIDAyNTQ6ICAgICAgICBj
dXJjd2QgPSBvcy5nZXRjd2QoKQ0KICAgICAwMjU1OiAgICBleGNlcHQ6DQpGaWxlOiAnL2hvbWUv
aXhpYS95b3NlbWl0ZS9vcGVuYm1jL3Bva3kvYml0YmFrZS9saWIvYmIvYnVpbGQucHknLCBsaW5l
bm86IDQ1MiwgZnVuY3Rpb246IGV4ZWNfZnVuY19zaGVsbA0KICAgICAwNDQ4OiAgICB3aXRoIG9w
ZW4oZmlmb3BhdGgsICdyK2InLCBidWZmZXJpbmc9MCkgYXMgZmlmbzoNCiAgICAgMDQ0OTogICAg
ICAgIHRyeToNCiAgICAgMDQ1MDogICAgICAgICAgICBiYi5kZWJ1ZygyLCAiRXhlY3V0aW5nIHNo
ZWxsIGZ1bmN0aW9uICVzIiAlIGZ1bmMpDQogICAgIDA0NTE6ICAgICAgICAgICAgd2l0aCBvcGVu
KG9zLmRldm51bGwsICdyKycpIGFzIHN0ZGluLCBsb2dmaWxlOg0KICoqKiAwNDUyOiAgICAgICAg
ICAgICAgICBiYi5wcm9jZXNzLnJ1bihjbWQsIHNoZWxsPUZhbHNlLCBzdGRpbj1zdGRpbiwgbG9n
PWxvZ2ZpbGUsIGV4dHJhZmlsZXM9WyhmaWZvLHJlYWRmaWZvKV0pDQogICAgIDA0NTM6ICAgICAg
ICBmaW5hbGx5Og0KICAgICAwNDU0OiAgICAgICAgICAgIG9zLnVubGluayhmaWZvcGF0aCkNCiAg
ICAgMDQ1NToNCiAgICAgMDQ1NjogICAgYmIuZGVidWcoMiwgIlNoZWxsIGZ1bmN0aW9uICVzIGZp
bmlzaGVkIiAlIGZ1bmMpDQpGaWxlOiAnL2hvbWUvaXhpYS95b3NlbWl0ZS9vcGVuYm1jL3Bva3kv
Yml0YmFrZS9saWIvYmIvcHJvY2Vzcy5weScsIGxpbmVubzogMTgyLCBmdW5jdGlvbjogcnVuDQog
ICAgIDAxNzg6ICAgICAgICBpZiBub3Qgc3RkZXJyIGlzIE5vbmU6DQogICAgIDAxNzk6ICAgICAg
ICAgICAgc3RkZXJyID0gc3RkZXJyLmRlY29kZSgidXRmLTgiKQ0KICAgICAwMTgwOg0KICAgICAw
MTgxOiAgICBpZiBwaXBlLnJldHVybmNvZGUgIT0gMDoNCiAqKiogMDE4MjogICAgICAgIHJhaXNl
IEV4ZWN1dGlvbkVycm9yKGNtZCwgcGlwZS5yZXR1cm5jb2RlLCBzdGRvdXQsIHN0ZGVycikNCiAg
ICAgMDE4MzogICAgcmV0dXJuIHN0ZG91dCwgc3RkZXJyDQpFeGNlcHRpb246IGJiLnByb2Nlc3Mu
RXhlY3V0aW9uRXJyb3I6IEV4ZWN1dGlvbiBvZiAnL2hvbWUvaXhpYS95b3NlbWl0ZS9vcGVuYm1j
L2J1aWxkL3lvc2VtaXRldjIvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVh
YmkvbGludXgtbGliYy1oZWFkZXJzLzUuNC1yMC90ZW1wL3J1bi5CVUlMRFNQRUMuMTExODYnIGZh
aWxlZCB3aXRoIGUNCnhpdCBjb2RlIDEzOToNCkJ1aWxkaW5nIHRhcmdldCBwbGF0Zm9ybXM6IGFy
bTExNzZqenMtb3BlbmJtYy1saW51eA0KQnVpbGRpbmcgZm9yIHRhcmdldCBhcm0xMTc2anpzLW9w
ZW5ibWMtbGludXgNClByb2Nlc3NpbmcgZmlsZXM6IGxpbnV4LWxpYmMtaGVhZGVycy1kYmctNS40
LXIwLmFybTExNzZqenMNClByb2Nlc3NpbmcgZmlsZXM6IGxpbnV4LWxpYmMtaGVhZGVycy1kZXYt
NS40LXIwLmFybTExNzZqenMNCndhcm5pbmc6IERlcHJlY2F0ZWQgZXh0ZXJuYWwgZGVwZW5kZW5j
eSBnZW5lcmF0b3IgaXMgdXNlZCENCkZpbmRpbmcgIFByb3ZpZGVzOg0KICAgICAwMjU0OiAgICAg
ICAgY3VyY3dkID0gb3MuZ2V0Y3dkKCkNCiAgICAgMDI1NTogICAgZXhjZXB0Og0KRmlsZTogJy9o
b21lL2l4aWEveW9zZW1pdGUvb3BlbmJtYy9wb2t5L2JpdGJha2UvbGliL2JiL2J1aWxkLnB5Jywg
bGluZW5vOiA0NTIsIGZ1bmN0aW9uOiBleGVjX2Z1bmNfc2hlbGwNCiAgICAgMDQ0ODogICAgd2l0
aCBvcGVuKGZpZm9wYXRoLCAncitiJywgYnVmZmVyaW5nPTApIGFzIGZpZm86DQogICAgIDA0NDk6
ICAgICAgICB0cnk6DQogICAgIDA0NTA6ICAgICAgICAgICAgYmIuZGVidWcoMiwgIkV4ZWN1dGlu
ZyBzaGVsbCBmdW5jdGlvbiAlcyIgJSBmdW5jKQ0KICAgICAwNDUxOiAgICAgICAgICAgIHdpdGgg
b3Blbihvcy5kZXZudWxsLCAncisnKSBhcyBzdGRpbiwgbG9nZmlsZToNCiAqKiogMDQ1MjogICAg
ICAgICAgICAgICAgYmIucHJvY2Vzcy5ydW4oY21kLCBzaGVsbD1GYWxzZSwgc3RkaW49c3RkaW4s
IGxvZz1sb2dmaWxlLCBleHRyYWZpbGVzPVsoZmlmbyxyZWFkZmlmbyldKQ0KICAgICAwNDUzOiAg
ICAgICAgZmluYWxseToNCiAgICAgMDQ1NDogICAgICAgICAgICBvcy51bmxpbmsoZmlmb3BhdGgp
DQogICAgIDA0NTU6DQogICAgIDA0NTY6ICAgIGJiLmRlYnVnKDIsICJTaGVsbCBmdW5jdGlvbiAl
cyBmaW5pc2hlZCIgJSBmdW5jKQ0KRmlsZTogJy9ob21lL2l4aWEveW9zZW1pdGUvb3BlbmJtYy9w
b2t5L2JpdGJha2UvbGliL2JiL3Byb2Nlc3MucHknLCBsaW5lbm86IDE4MiwgZnVuY3Rpb246IHJ1
bg0KICAgICAwMTc4OiAgICAgICAgaWYgbm90IHN0ZGVyciBpcyBOb25lOg0KICAgICAwMTc5OiAg
ICAgICAgICAgIHN0ZGVyciA9IHN0ZGVyci5kZWNvZGUoInV0Zi04IikNCiAgICAgMDE4MDoNCiAg
ICAgMDE4MTogICAgaWYgcGlwZS5yZXR1cm5jb2RlICE9IDA6DQogKioqIDAxODI6ICAgICAgICBy
YWlzZSBFeGVjdXRpb25FcnJvcihjbWQsIHBpcGUucmV0dXJuY29kZSwgc3Rkb3V0LCBzdGRlcnIp
DQogICAgIDAxODM6ICAgIHJldHVybiBzdGRvdXQsIHN0ZGVycg0KRXhjZXB0aW9uOiBiYi5wcm9j
ZXNzLkV4ZWN1dGlvbkVycm9yOiBFeGVjdXRpb24gb2YgJy9ob21lL2l4aWEveW9zZW1pdGUvb3Bl
bmJtYy9idWlsZC95b3NlbWl0ZXYyL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1n
bnVlYWJpL2xpbnV4LWxpYmMtaGVhZGVycy81LjQtcjAvdGVtcC9ydW4uQlVJTERTUEVDLjExMTg2
JyBmYWlsZWQgd2l0aCBlDQp4aXQgY29kZSAxMzk6DQpCdWlsZGluZyB0YXJnZXQgcGxhdGZvcm1z
OiBhcm0xMTc2anpzLW9wZW5ibWMtbGludXgNCkJ1aWxkaW5nIGZvciB0YXJnZXQgYXJtMTE3Nmp6
cy1vcGVuYm1jLWxpbnV4DQpQcm9jZXNzaW5nIGZpbGVzOiBsaW51eC1saWJjLWhlYWRlcnMtZGJn
LTUuNC1yMC5hcm0xMTc2anpzDQpQcm9jZXNzaW5nIGZpbGVzOiBsaW51eC1saWJjLWhlYWRlcnMt
ZGV2LTUuNC1yMC5hcm0xMTc2anpzDQp3YXJuaW5nOiBEZXByZWNhdGVkIGV4dGVybmFsIGRlcGVu
ZGVuY3kgZ2VuZXJhdG9yIGlzIHVzZWQhDQpGaW5kaW5nICBQcm92aWRlczogDQpGaW5kaW5nICBS
ZXF1aXJlcyhpbnRlcnApOiANCkZpbmRpbmcgIFJlcXVpcmVzKHJwbWxpYik6IA0KRmluZGluZyAg
UmVxdWlyZXModmVyaWZ5KTogDQpGaW5kaW5nICBSZXF1aXJlcyhwcmUpOiANCkZpbmRpbmcgIFJl
cXVpcmVzKHBvc3QpOiANCkZpbmRpbmcgIFJlcXVpcmVzKHByZXVuKTogDQpGaW5kaW5nICBSZXF1
aXJlcyhwb3N0dW4pOiANCkZpbmRpbmcgIFJlcXVpcmVzKHByZXRyYW5zKTogDQpGaW5kaW5nICBS
ZXF1aXJlcyhwb3N0dHJhbnMpOiANCkZpbmRpbmcgIFJlcXVpcmVzOiANCkZpbmRpbmcgIENvbmZs
aWN0czogDQpGaW5kaW5nICBPYnNvbGV0ZXM6IA0KRmluZGluZyAgUmVjb21tZW5kczogDQpGaW5k
aW5nICBTdWdnZXN0czogDQpGaW5kaW5nICBTdXBwbGVtZW50czogDQpGaW5kaW5nICBFbmhhbmNl
czogDQpQcm92aWRlczogbGludXgtbGliYy1oZWFkZXJzLWRldiA9IDUuNC1yMA0KUmVxdWlyZXMo
cnBtbGliKTogcnBtbGliKENvbXByZXNzZWRGaWxlTmFtZXMpIDw9IDMuMC40LTEgcnBtbGliKEZp
bGVEaWdlc3RzKSA8PSA0LjYuMC0xIHJwbWxpYihQYXlsb2FkRmlsZXNIYXZlUHJlZml4KSA8PSA0
LjAtMQ0KQ2hlY2tpbmcgZm9yIHVucGFja2FnZWQgZmlsZShzKTogL2hvbWUvaXhpYS95b3NlbWl0
ZS9vcGVuYm1jL2J1aWxkL3lvc2VtaXRldjIvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxp
bnV4LWdudWVhYmkvbGludXgtbGliYy1oZWFkZXJzLzUuNC1yMC9yZWNpcGUtc3lzcm9vdC1uYXRp
dmUvdXNyL2Jpbi8uLi8uLi91c3IvbGliL3JwbS9jaGVjay1maWxlDQpzIC9ob21lL2l4aWEveW9z
ZW1pdGUvb3BlbmJtYy9idWlsZC95b3NlbWl0ZXYyL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJt
Yy1saW51eC1nbnVlYWJpL2xpbnV4LWxpYmMtaGVhZGVycy81LjQtcjAvcGFja2FnZQ0KU2VnbWVu
dGF0aW9uIGZhdWx0IChjb3JlIGR1bXBlZCkNCldBUk5JTkc6IGV4aXQgY29kZSAxMzkgZnJvbSBh
IHNoZWxsIGNvbW1hbmQuDQoNCg0KREVCVUc6IFB5dGhvbiBmdW5jdGlvbiBkb19wYWNrYWdlX3Jw
bSBmaW5pc2hlZA0KREVCVUc6IFB5dGhvbiBmdW5jdGlvbiBkb19wYWNrYWdlX3dyaXRlX3JwbSBm
aW5pc2hlZA0KaXhpYUB1YnVudHU6fiQ=

--_004_SN6PR17MB25580E5C6278629955BE548B964E0SN6PR17MB2558namp_--
