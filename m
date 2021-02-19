Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C32331F374
	for <lists+openbmc@lfdr.de>; Fri, 19 Feb 2021 01:54:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhY4807Ngz30Nj
	for <lists+openbmc@lfdr.de>; Fri, 19 Feb 2021 11:54:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nMjYs9FG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bruce.mitchell@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=nMjYs9FG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DhY3v13jLz30HL
 for <openbmc@lists.ozlabs.org>; Fri, 19 Feb 2021 11:53:46 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11J0WqCo099725
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 19:53:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version : subject :
 to : cc : from : date : content-type : message-id; s=pp1;
 bh=hGdesWTdj938igqEg+436guYHjCoypqqcp39QSnNsPc=;
 b=nMjYs9FGWOj7fp5c6jtuE2ZpjTsT8k3+wj4ADEoeTB5V8D6bdUm6pef+AMA9VMoG6Ddy
 fap2RcwykecgfwPNIyKMK0YdKGo1kfy9dkbse8GRsJcRn3QwpCJplbQ/q6uM7fEmQUvh
 3S3MZ/Upg6NiogZbE4neXBgrXr72rE5arOwmz6emr8+eWQbeuTftwGHU0Y/QFs+GDkDo
 rJN3rZ/M67PWG46pG0fwVkFtkCZ5x15TCs5XNJTw9myJ/UwBeYhjUSM/YXNTzouV9o8o
 pjtOpsg+zV1LDRPlKTrOjx/defUDw6C2X4E3UooOAvX5iIyAgzXNMINmmKg5DK483/2h dw== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.93])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36t2d51347-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 19:53:43 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Bruce.Mitchell@ibm.com>;
 Fri, 19 Feb 2021 00:53:43 -0000
Received: from us1a3-smtp06.a3.dal06.isc4sb.com (10.146.103.243)
 by smtp.notes.na.collabserv.com (10.106.227.39) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 19 Feb 2021 00:53:42 -0000
Received: from us1a3-mail31.a3.dal06.isc4sb.com ([10.146.6.26])
 by us1a3-smtp06.a3.dal06.isc4sb.com
 with ESMTP id 2021021900534208-847274 ;
 Fri, 19 Feb 2021 00:53:42 +0000 
MIME-Version: 1.0
Subject: My kexec test patches for OpenBMC
To: openbmc@lists.ozlabs.org, "Joel Stanley" <joel@jms.id.au>
From: "Bruce Mitchell" <Bruce.Mitchell@ibm.com>
Date: Thu, 18 Feb 2021 16:53:40 -0800
X-KeepSent: C6D46F57:69575CC5-00258681:0002C252;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 10.0.1FP5 April 28, 2020
X-LLNOutbound: False
X-Disclaimed: 49447
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=8FBB0C12DF9144C28f9e8a93df938690918c8FBB0C12DF9144C2"
Content-Disposition: inline
x-cbid: 21021900-8889-0000-0000-0000049AB5A2
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.415104; ST=0; TS=0; UL=0; ISC=; MB=0.005366
X-IBM-SpamModules-Versions: BY=3.00014756; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01509816; UDB=6.00815306; IPR=6.01292340; 
 MB=3.00036177; MTD=3.00000008; XFM=3.00000015; UTC=2021-02-19 00:53:43
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2021-02-18 20:06:28 - 6.00012312
x-cbparentid: 21021900-8890-0000-0000-0000AEFACA32
Message-Id: <OFC6D46F57.69575CC5-ON00258681.0002C252-88258681.0004EA2C@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-18_14:2021-02-18,
 2021-02-18 signatures=0
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
Cc: Andrew Jeffery <andrew@aj.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--0__=8FBB0C12DF9144C28f9e8a93df938690918c8FBB0C12DF9144C2
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII



Hello Joel,

Per your request yesterday, I am emailing the details of my kexec/kdump
development efforts.

I am running QEMU
   qemu-system-arm --version
   QEMU emulator version 5.2.0 (v5.1.0-3479-g27ca38d3db)
   Copyright (c) 2003-2020 Fabrice Bellard and the QEMU Project developers
   qemu-system-arm -d cpu=5Freset -M tacoma-bmc
   -kernel /tmp/tmp.y2fpdAXM1h.kernel -dtb /tmp/tmp.BWkadwNbTf.dtb
   -initrd /tmp/tmp.jRpFbzfpBs.initrd -drive
   file=3Dobmc-phosphor-image-witherspoon-tacoma.wic,if=3Dsd,format=3Draw,i=
ndex=3D2
   -net nic -net
   user,hostfwd=3D:127.0.0.1:2222-:22,hostfwd=3D:127.0.0.1:2443-:443,hostna=
me=3Dqemu
 -nographic -append "crashkernel=3D64M console=3DttyS4,115200n8 rootwait
   root=3DPARTLABEL=3Drofs-a"

From OpenBMC within QEMU I am using the following to test kexec
   kexec -d -l /home/kexec=5Ffiles/tmp.y2fpdAXM1h.kernel
   --initrd=3D/home/kexec=5Ffiles/tmp.jRpFbzfpBs.initrd
   --dtb=3D/home/kexec=5Ffiles/tmp.BWkadwNbTf.dtb --append=3D"earlycon
   console=3DttyS4,115200n8 rootwait root=3DPARTLABEL=3Drofs-a 1 maxcpus=3D1
   reset=5Fdevices"
   kexec -d -e

This is my source code starting point: (taken from openbmc/openbmc: OpenBMC
Distribution (github.com) )
   bam@latitude-e5430:~/my=5Fgit/openbmc/openbmc$ git log
   commit c0263ac8ac029de5e7651a22cc864c4b3aaea5c3 (HEAD)
   Author: Andrew Geissler <openbmcbump-github@yahoo.com>
   Date:   Wed Feb 17 00:51:19 2021 +0000

       phosphor-sel-logger: srcrev bump 7d8a3003fb..dbd77b9200

       Charles Hsu (1):
             Add watchdog event monitor

       Change-Id: I08d375e006e560c573896349562ca53e3162d628
       Signed-off-by: Andrew Geissler <openbmcbump-github@yahoo.com>

   commit 91dd8078a5855ee7369c0d60dc405511c4941def
   Author: Andrew Geissler <openbmcbump-github@yahoo.com>
   Date:   Tue Feb 16 19:51:09 2021 +0000

       phosphor-power: srcrev bump de0fd44f76..10d9405574

       Jay Meyer (1):
             Capture PSU STATUS=5FMFR=5FSPECIFIC during analysis

       Change-Id: Ifd8b0e4b7dd2cd43f3e861e27d52ba03034a4d22
       Signed-off-by: Andrew Geissler <openbmcbump-github@yahoo.com>

This shows the modified files:
   bam@latitude-e5430:~/my=5Fgit/openbmc/openbmc$ git status
   HEAD detached at c0263ac8a
   Changes not staged for commit:
     (use "git add <file>..." to update what will be committed)
     (use "git checkout -- <file>..." to discard changes in working
   directory)

           modified:
   meta-aspeed/recipes-kernel/linux/linux-aspeed/aspeed-g6/defconfig
           modified:
   meta-ibm/recipes-phosphor/packagegroups/packagegroup-obmc-apps.bbappend

This shows the git diff
meta-aspeed/recipes-kernel/linux/linux-aspeed/aspeed-g6/defconfig
   bam@latitude-e5430:~/my=5Fgit/openbmc/openbmc$ git diff
   meta-aspeed/recipes-kernel/linux/linux-aspeed/aspeed-g6/defconfig
   diff --git
   a/meta-aspeed/recipes-kernel/linux/linux-aspeed/aspeed-g6/defconfig
   b/meta-aspeed/recipes-kernel/linux/linux-aspeed/aspeed-g6/defconfig
   index b80042396..92de519a5 100644
   --- a/meta-aspeed/recipes-kernel/linux/linux-aspeed/aspeed-g6/defconfig
   +++ b/meta-aspeed/recipes-kernel/linux/linux-aspeed/aspeed-g6/defconfig
   @@ -18,6 +18,10 @@ CONFIG=5FBLK=5FDEV=5FINITRD=3Dy
    # CONFIG=5FRD=5FLZ4 is not set
    # CONFIG=5FUID16 is not set
    # CONFIG=5FSYSFS=5FSYSCALL is not set
   +CONFIG=5FSYSFS=3Dy
   +CONFIG=5FCRASH=5FDUMP=3Dy
   +CONFIG=5FPROC=5FVMCORE=3Dy
   +AUTO=5FZRELADDR=3Dy
    # CONFIG=5FAIO is not set
    CONFIG=5FBPF=5FSYSCALL=3Dy
    CONFIG=5FEMBEDDED=3Dy
   @@ -299,3 +303,5 @@ CONFIG=5FFUNCTION=5FTRACER=3Dy
    CONFIG=5FDEBUG=5FWX=3Dy
    CONFIG=5FDEBUG=5FUSER=3Dy
    # CONFIG=5FRUNTIME=5FTESTING=5FMENU is not set
   +
   +CONFIG=5FMAGIC=5FSYSRQ=3Dy

This shows the git diff
meta-ibm/recipes-phosphor/packagegroups/packagegroup-obmc-apps.bbappend
   bam@latitude-e5430:~/my=5Fgit/openbmc/openbmc$ git diff
   meta-ibm/recipes-phosphor/packagegroups/packagegroup-obmc-apps.bbappend
   diff --git
   a/meta-ibm/recipes-phosphor/packagegroups/packagegroup-obmc-apps.bbappend
 b/meta-ibm/recipes-phosphor/packagegroups/packagegroup-obmc-apps.bbappend
   index 29a567e27..5a19f561b 100644
   ---
   a/meta-ibm/recipes-phosphor/packagegroups/packagegroup-obmc-apps.bbappend
   +++
   b/meta-ibm/recipes-phosphor/packagegroups/packagegroup-obmc-apps.bbappend
   @@ -28,9 +28,9 @@ RDEPENDS=5F${PN}-inventory=5Fappend=5Fmihawk =3D "
   openpower-fru-vpd openpower-occ-contr
    RDEPENDS=5F${PN}-fan-control=5Fappend=5Fibm-ac-server =3D " fan-watchdo=
g"
    RDEPENDS=5F${PN}-fan-control=5Fappend=5Frainier =3D " fan-watchdog"
    RDEPENDS=5F${PN}-extras=5Fappend=5Fibm-ac-server =3D " $
   {POWER=5FSERVICE=5FPACKAGES=5FAC=5FSERVER} witherspoon-power-supply-sync
   phosphor-webui"
   -RDEPENDS=5F${PN}-extras=5Fappend=5Frainier =3D " $
   {POWER=5FSERVICE=5FPACKAGES=5FRAINIER} webui-vue dbus-sensors
   phosphor-virtual-sensor"
   +RDEPENDS=5F${PN}-extras=5Fappend=5Frainier =3D " $
   {POWER=5FSERVICE=5FPACKAGES=5FRAINIER} webui-vue dbus-sensors
   phosphor-virtual-sensor kexec-tools file"
    RDEPENDS=5F${PN}-extras=5Fappend=5Fmihawk =3D " phosphor-webui
   phosphor-image-signing wistron-ipmi-oem $
   {POWER=5FSERVICE=5FPACKAGES=5FAC=5FSERVER}"
   -RDEPENDS=5F${PN}-extras=5Fappend=5Fwitherspoon-tacoma =3D " pldm srvcfg=
-manager
   webui-vue biosconfig-manager"
   +RDEPENDS=5F${PN}-extras=5Fappend=5Fwitherspoon-tacoma =3D " pldm srvcfg=
-manager
   webui-vue biosconfig-manager kexec-tools file"

    RDEPENDS=5F${PN}-extras=5Fremove=5Frainier =3D "obmc-ikvm liberation-fo=
nts
   uart-render-controller"
    RDEPENDS=5F${PN}-extras=5Fremove=5Fswift =3D "obmc-ikvm"
   bam@latitude-e5430:~/my=5Fgit/openbmc/openbmc$


Here is where I am staring from for linux-aspeed:
   bam@latitude-e5430:~/my=5Fgit/openbmc/openbmc/build/witherspoon-tacoma/w=
orkspace/sources/linux-aspeed
$ git log
   commit 56621ca6dcf8c20fc7bc72771df00cd3d59c153b
   Author: Joel Stanley <joel@jms.id.au>
   Date:   Tue Feb 9 13:47:10 2021 +1030

       ARM: configs: aspeed: Update defconfigs

       OpenBMC-Staging-Count: 1
       Signed-off-by: Joel Stanley <joel@jms.id.au>

   commit 88c06f67f99fead1fba4ab508786f5ef824a7404
   Author: Tomer Maimon <tmaimon77@gmail.com>
   Date:   Mon Jan 14 15:07:09 2019 +0200

       ARM: configs: add defconfig for Nuvoton NPCM7xx BMC

       OpenBMC-Staging-Count: 9
       Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
       Signed-off-by: Joel Stanley <joel@jms.id.au>

This shows the modified file:
   bam@latitude-e5430:~/my=5Fgit/openbmc/openbmc/build/witherspoon-tacoma/w=
orkspace/sources/linux-aspeed
$ git status
   On branch devtool
   Changes not staged for commit:
     (use "git add <file>..." to update what will be committed)
     (use "git checkout -- <file>..." to discard changes in working
   directory)

           modified:   arch/arm/mach-aspeed/platsmp.c

This shows the git diff arch/arm/mach-aspeed/platsmp.c
   bam@latitude-e5430:~/my=5Fgit/openbmc/openbmc/build/witherspoon-tacoma/w=
orkspace/sources/linux-aspeed
$ git diff
   diff --git a/arch/arm/mach-aspeed/platsmp.c
   b/arch/arm/mach-aspeed/platsmp.c
   index 2324becf7991..d004fef81e6f 100644
   --- a/arch/arm/mach-aspeed/platsmp.c
   +++ b/arch/arm/mach-aspeed/platsmp.c
   @@ -7,11 +7,32 @@
    #include <linux/of.h>
    #include <linux/smp.h>

   +#include <linux/errno.h>
   +#include <linux/jiffies.h>
   +#include <asm/cacheflush.h>
   +#include <asm/cp15.h>
   +#include <asm/proc-fns.h>
   +
    #define BOOT=5FADDR      0x00
    #define BOOT=5FSIG       0x04

    static struct device=5Fnode *secboot=5Fnode;

   +static void aspeed=5Fg6=5Fcpu=5Fdie(unsigned int cpu)
   +{
   +       v7=5Fexit=5Fcoherency=5Fflush(louis);
   +
   +       while (1) {
   +               cpu=5Fdo=5Fidle();
   +       }
   +}
   +
   +static int aspeed=5Fg6=5Fcpu=5Fkill(unsigned int cpu)
   +{
   +
   +       return 1;
   +}
   +
    static int aspeed=5Fg6=5Fboot=5Fsecondary(unsigned int cpu, struct
   task=5Fstruct *idle)
    {
           void =5F=5Fiomem *base;
   @@ -56,6 +77,10 @@ static void =5F=5Finit aspeed=5Fg6=5Fsmp=5Fprepare=5F=
cpus
   (unsigned int max=5Fcpus)
    static const struct smp=5Foperations aspeed=5Fsmp=5Fops =5F=5Finitconst=
 =3D {
           .smp=5Fprepare=5Fcpus       =3D aspeed=5Fg6=5Fsmp=5Fprepare=5Fcp=
us,
           .smp=5Fboot=5Fsecondary     =3D aspeed=5Fg6=5Fboot=5Fsecondary,
   +#ifdef CONFIG=5FHOTPLUG=5FCPU
   +       .cpu=5Fdie                =3D aspeed=5Fg6=5Fcpu=5Fdie,
   +       .cpu=5Fkill               =3D aspeed=5Fg6=5Fcpu=5Fkill,
   +#endif
    };

    CPU=5FMETHOD=5FOF=5FDECLARE(aspeed=5Fsmp, "aspeed,ast2600-smp",
   &aspeed=5Fsmp=5Fops);
   bam@latitude-e5430:~/my=5Fgit/openbmc/openbmc/build/witherspoon-tacoma/w=
orkspace/sources/linux-aspeed
$

Thank you.

--
Bruce

--0__=8FBB0C12DF9144C28f9e8a93df938690918c8FBB0C12DF9144C2
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><font size=3D"2">Hello Joel,</font><br><br><font size=3D"2">=
Per your request yesterday, I am emailing the details of my kexec/kdump dev=
elopment efforts.</font><br><br><font size=3D"2">I am running QEMU</font><u=
l><font size=3D"2">qemu-system-arm --version</font><br><font size=3D"2">QEM=
U emulator version 5.2.0 (v5.1.0-3479-g27ca38d3db)</font><br><font size=3D"=
2">Copyright (c) 2003-2020 Fabrice Bellard and the QEMU Project developers<=
/font><br><font size=3D"2">qemu-system-arm -d cpu=5Freset -M tacoma-bmc -ke=
rnel /tmp/tmp.y2fpdAXM1h.kernel -dtb /tmp/tmp.BWkadwNbTf.dtb -initrd /tmp/t=
mp.jRpFbzfpBs.initrd -drive file=3Dobmc-phosphor-image-witherspoon-tacoma.w=
ic,if=3Dsd,format=3Draw,index=3D2 -net nic -net user,hostfwd=3D:127.0.0.1:2=
222-:22,hostfwd=3D:127.0.0.1:2443-:443,hostname=3Dqemu -nographic -append &=
quot;crashkernel=3D64M console=3DttyS4,115200n8 rootwait root=3DPARTLABEL=
=3Drofs-a&quot;</font></ul><br><font size=3D"2">From OpenBMC within QEMU I =
am using the following to test kexec</font><ul><font size=3D"2">kexec -d -l=
 /home/kexec=5Ffiles/tmp.y2fpdAXM1h.kernel --initrd=3D/home/kexec=5Ffiles/t=
mp.jRpFbzfpBs.initrd --dtb=3D/home/kexec=5Ffiles/tmp.BWkadwNbTf.dtb --appen=
d=3D&quot;earlycon console=3DttyS4,115200n8 rootwait root=3DPARTLABEL=3Drof=
s-a 1 maxcpus=3D1 reset=5Fdevices&quot;</font><br><font size=3D"2">kexec -d=
 -e</font></ul><br><font size=3D"2">This is my source code starting point: =
(taken from </font><a href=3D"https://github.com/openbmc/openbmc"><u><font =
color=3D"#0000FF">openbmc/openbmc: OpenBMC Distribution (github.com)</font>=
</u></a> <font size=3D"2">)</font><ul><font size=3D"2">bam@latitude-e5430:~=
/my=5Fgit/openbmc/openbmc$ git log</font><br><font size=3D"2">commit c0263a=
c8ac029de5e7651a22cc864c4b3aaea5c3 (HEAD)</font><br><font size=3D"2">Author=
: Andrew Geissler &lt;openbmcbump-github@yahoo.com&gt;</font><br><font size=
=3D"2">Date:   Wed Feb 17 00:51:19 2021 +0000</font><br><br><font size=3D"2=
">    phosphor-sel-logger: srcrev bump 7d8a3003fb..dbd77b9200</font><br><br=
><font size=3D"2">    Charles Hsu (1):</font><br><font size=3D"2">         =
 Add watchdog event monitor</font><br><br><font size=3D"2">    Change-Id: I=
08d375e006e560c573896349562ca53e3162d628</font><br><font size=3D"2">    Sig=
ned-off-by: Andrew Geissler &lt;openbmcbump-github@yahoo.com&gt;</font><br>=
<br><font size=3D"2">commit 91dd8078a5855ee7369c0d60dc405511c4941def</font>=
<br><font size=3D"2">Author: Andrew Geissler &lt;openbmcbump-github@yahoo.c=
om&gt;</font><br><font size=3D"2">Date:   Tue Feb 16 19:51:09 2021 +0000</f=
ont><br><br><font size=3D"2">    phosphor-power: srcrev bump de0fd44f76..10=
d9405574</font><br><br><font size=3D"2">    Jay Meyer (1):</font><br><font =
size=3D"2">          Capture PSU STATUS=5FMFR=5FSPECIFIC during analysis</f=
ont><br><br><font size=3D"2">    Change-Id: Ifd8b0e4b7dd2cd43f3e861e27d52ba=
03034a4d22</font><br><font size=3D"2">    Signed-off-by: Andrew Geissler &l=
t;openbmcbump-github@yahoo.com&gt;</font><br></ul><font size=3D"2">This sho=
ws the modified files:</font><ul><font size=3D"2">bam@latitude-e5430:~/my=
=5Fgit/openbmc/openbmc$ git status</font><br><font size=3D"2">HEAD detached=
 at c0263ac8a</font><br><font size=3D"2">Changes not staged for commit:</fo=
nt><br><font size=3D"2">  (use &quot;git add &lt;file&gt;...&quot; to updat=
e what will be committed)</font><br><font size=3D"2">  (use &quot;git check=
out -- &lt;file&gt;...&quot; to discard changes in working directory)</font=
><br><br><font size=3D"2">        modified:   meta-aspeed/recipes-kernel/li=
nux/linux-aspeed/aspeed-g6/defconfig</font><br><font size=3D"2">        mod=
ified:   meta-ibm/recipes-phosphor/packagegroups/packagegroup-obmc-apps.bba=
ppend</font><br></ul><font size=3D"2">This shows the git diff meta-aspeed/r=
ecipes-kernel/linux/linux-aspeed/aspeed-g6/defconfig</font><ul><font size=
=3D"2">bam@latitude-e5430:~/my=5Fgit/openbmc/openbmc$ git diff meta-aspeed/=
recipes-kernel/linux/linux-aspeed/aspeed-g6/defconfig</font><br><font size=
=3D"2">diff --git a/meta-aspeed/recipes-kernel/linux/linux-aspeed/aspeed-g6=
/defconfig b/meta-aspeed/recipes-kernel/linux/linux-aspeed/aspeed-g6/defcon=
fig</font><br><font size=3D"2">index b80042396..92de519a5 100644</font><br>=
<font size=3D"2">--- a/meta-aspeed/recipes-kernel/linux/linux-aspeed/aspeed=
-g6/defconfig</font><br><font size=3D"2">+++ b/meta-aspeed/recipes-kernel/l=
inux/linux-aspeed/aspeed-g6/defconfig</font><br><font size=3D"2">@@ -18,6 +=
18,10 @@ CONFIG=5FBLK=5FDEV=5FINITRD=3Dy</font><br><font size=3D"2"> # CONF=
IG=5FRD=5FLZ4 is not set</font><br><font size=3D"2"> # CONFIG=5FUID16 is no=
t set</font><br><font size=3D"2"> # CONFIG=5FSYSFS=5FSYSCALL is not set</fo=
nt><br><font size=3D"2">+CONFIG=5FSYSFS=3Dy</font><br><font size=3D"2">+CON=
FIG=5FCRASH=5FDUMP=3Dy</font><br><font size=3D"2">+CONFIG=5FPROC=5FVMCORE=
=3Dy</font><br><font size=3D"2">+AUTO=5FZRELADDR=3Dy</font><br><font size=
=3D"2"> # CONFIG=5FAIO is not set</font><br><font size=3D"2"> CONFIG=5FBPF=
=5FSYSCALL=3Dy</font><br><font size=3D"2"> CONFIG=5FEMBEDDED=3Dy</font><br>=
<font size=3D"2">@@ -299,3 +303,5 @@ CONFIG=5FFUNCTION=5FTRACER=3Dy</font><=
br><font size=3D"2"> CONFIG=5FDEBUG=5FWX=3Dy</font><br><font size=3D"2"> CO=
NFIG=5FDEBUG=5FUSER=3Dy</font><br><font size=3D"2"> # CONFIG=5FRUNTIME=5FTE=
STING=5FMENU is not set</font><br><font size=3D"2">+</font><br><font size=
=3D"2">+CONFIG=5FMAGIC=5FSYSRQ=3Dy</font></ul><br><font size=3D"2">This sho=
ws the git diff meta-ibm/recipes-phosphor/packagegroups/packagegroup-obmc-a=
pps.bbappend</font><ul><font size=3D"2">bam@latitude-e5430:~/my=5Fgit/openb=
mc/openbmc$ git diff meta-ibm/recipes-phosphor/packagegroups/packagegroup-o=
bmc-apps.bbappend</font><br><font size=3D"2">diff --git a/meta-ibm/recipes-=
phosphor/packagegroups/packagegroup-obmc-apps.bbappend b/meta-ibm/recipes-p=
hosphor/packagegroups/packagegroup-obmc-apps.bbappend</font><br><font size=
=3D"2">index 29a567e27..5a19f561b 100644</font><br><font size=3D"2">--- a/m=
eta-ibm/recipes-phosphor/packagegroups/packagegroup-obmc-apps.bbappend</fon=
t><br><font size=3D"2">+++ b/meta-ibm/recipes-phosphor/packagegroups/packag=
egroup-obmc-apps.bbappend</font><br><font size=3D"2">@@ -28,9 +28,9 @@ RDEP=
ENDS=5F${PN}-inventory=5Fappend=5Fmihawk =3D &quot; openpower-fru-vpd openp=
ower-occ-contr</font><br><font size=3D"2"> RDEPENDS=5F${PN}-fan-control=5Fa=
ppend=5Fibm-ac-server =3D &quot; fan-watchdog&quot;</font><br><font size=3D=
"2"> RDEPENDS=5F${PN}-fan-control=5Fappend=5Frainier =3D &quot; fan-watchdo=
g&quot;</font><br><font size=3D"2"> RDEPENDS=5F${PN}-extras=5Fappend=5Fibm-=
ac-server =3D &quot; ${POWER=5FSERVICE=5FPACKAGES=5FAC=5FSERVER} witherspoo=
n-power-supply-sync phosphor-webui&quot;</font><br><font size=3D"2">-RDEPEN=
DS=5F${PN}-extras=5Fappend=5Frainier =3D &quot; ${POWER=5FSERVICE=5FPACKAGE=
S=5FRAINIER} webui-vue dbus-sensors phosphor-virtual-sensor&quot;</font><br=
><font size=3D"2">+RDEPENDS=5F${PN}-extras=5Fappend=5Frainier =3D &quot; ${=
POWER=5FSERVICE=5FPACKAGES=5FRAINIER} webui-vue dbus-sensors phosphor-virtu=
al-sensor kexec-tools file&quot;</font><br><font size=3D"2"> RDEPENDS=5F${P=
N}-extras=5Fappend=5Fmihawk =3D &quot; phosphor-webui phosphor-image-signin=
g wistron-ipmi-oem ${POWER=5FSERVICE=5FPACKAGES=5FAC=5FSERVER}&quot;</font>=
<br><font size=3D"2">-RDEPENDS=5F${PN}-extras=5Fappend=5Fwitherspoon-tacoma=
 =3D &quot; pldm srvcfg-manager webui-vue biosconfig-manager&quot;</font><b=
r><font size=3D"2">+RDEPENDS=5F${PN}-extras=5Fappend=5Fwitherspoon-tacoma =
=3D &quot; pldm srvcfg-manager webui-vue biosconfig-manager kexec-tools fil=
e&quot;</font><br><br><font size=3D"2"> RDEPENDS=5F${PN}-extras=5Fremove=5F=
rainier =3D &quot;obmc-ikvm liberation-fonts uart-render-controller&quot;</=
font><br><font size=3D"2"> RDEPENDS=5F${PN}-extras=5Fremove=5Fswift =3D &qu=
ot;obmc-ikvm&quot;</font><br><font size=3D"2">bam@latitude-e5430:~/my=5Fgit=
/openbmc/openbmc$</font><br></ul><br><font size=3D"2">Here is where I am st=
aring from for linux-aspeed:</font><ul><font size=3D"2">bam@latitude-e5430:=
~/my=5Fgit/openbmc/openbmc/build/witherspoon-tacoma/workspace/sources/linux=
-aspeed$ git log</font><br><font size=3D"2">commit 56621ca6dcf8c20fc7bc7277=
1df00cd3d59c153b</font><br><font size=3D"2">Author: Joel Stanley &lt;joel@j=
ms.id.au&gt;</font><br><font size=3D"2">Date:   Tue Feb 9 13:47:10 2021 +10=
30</font><br><br><font size=3D"2">    ARM: configs: aspeed: Update defconfi=
gs</font><br><br><font size=3D"2">    OpenBMC-Staging-Count: 1</font><br><f=
ont size=3D"2">    Signed-off-by: Joel Stanley &lt;joel@jms.id.au&gt;</font=
><br><br><font size=3D"2">commit 88c06f67f99fead1fba4ab508786f5ef824a7404</=
font><br><font size=3D"2">Author: Tomer Maimon &lt;tmaimon77@gmail.com&gt;<=
/font><br><font size=3D"2">Date:   Mon Jan 14 15:07:09 2019 +0200</font><br=
><br><font size=3D"2">    ARM: configs: add defconfig for Nuvoton NPCM7xx B=
MC</font><br><br><font size=3D"2">    OpenBMC-Staging-Count: 9</font><br><f=
ont size=3D"2">    Signed-off-by: Tomer Maimon &lt;tmaimon77@gmail.com&gt;<=
/font><br><font size=3D"2">    Signed-off-by: Joel Stanley &lt;joel@jms.id.=
au&gt;</font></ul><br><font size=3D"2">This shows the modified file:</font>=
<ul><font size=3D"2">bam@latitude-e5430:~/my=5Fgit/openbmc/openbmc/build/wi=
therspoon-tacoma/workspace/sources/linux-aspeed$ git status</font><br><font=
 size=3D"2">On branch devtool</font><br><font size=3D"2">Changes not staged=
 for commit:</font><br><font size=3D"2">  (use &quot;git add &lt;file&gt;..=
.&quot; to update what will be committed)</font><br><font size=3D"2">  (use=
 &quot;git checkout -- &lt;file&gt;...&quot; to discard changes in working =
directory)</font><br><br><font size=3D"2">        modified:   arch/arm/mach=
-aspeed/platsmp.c</font><br></ul><font size=3D"2">This shows the git diff a=
rch/arm/mach-aspeed/platsmp.c</font><ul><font size=3D"2">bam@latitude-e5430=
:~/my=5Fgit/openbmc/openbmc/build/witherspoon-tacoma/workspace/sources/linu=
x-aspeed$ git diff</font><br><font size=3D"2">diff --git a/arch/arm/mach-as=
peed/platsmp.c b/arch/arm/mach-aspeed/platsmp.c</font><br><font size=3D"2">=
index 2324becf7991..d004fef81e6f 100644</font><br><font size=3D"2">--- a/ar=
ch/arm/mach-aspeed/platsmp.c</font><br><font size=3D"2">+++ b/arch/arm/mach=
-aspeed/platsmp.c</font><br><font size=3D"2">@@ -7,11 +7,32 @@</font><br><f=
ont size=3D"2"> #include &lt;linux/of.h&gt;</font><br><font size=3D"2"> #in=
clude &lt;linux/smp.h&gt;</font><br><br><font size=3D"2">+#include &lt;linu=
x/errno.h&gt;</font><br><font size=3D"2">+#include &lt;linux/jiffies.h&gt;<=
/font><br><font size=3D"2">+#include &lt;asm/cacheflush.h&gt;</font><br><fo=
nt size=3D"2">+#include &lt;asm/cp15.h&gt;</font><br><font size=3D"2">+#inc=
lude &lt;asm/proc-fns.h&gt;</font><br><font size=3D"2">+</font><br><font si=
ze=3D"2"> #define BOOT=5FADDR      0x00</font><br><font size=3D"2"> #define=
 BOOT=5FSIG       0x04</font><br><br><font size=3D"2"> static struct device=
=5Fnode *secboot=5Fnode;</font><br><br><font size=3D"2">+static void aspeed=
=5Fg6=5Fcpu=5Fdie(unsigned int cpu)</font><br><font size=3D"2">+{</font><br=
><font size=3D"2">+       v7=5Fexit=5Fcoherency=5Fflush(louis);</font><br><=
font size=3D"2">+</font><br><font size=3D"2">+       while (1) {</font><br>=
<font size=3D"2">+               cpu=5Fdo=5Fidle();</font><br><font size=3D=
"2">+       }</font><br><font size=3D"2">+}</font><br><font size=3D"2">+</f=
ont><br><font size=3D"2">+static int aspeed=5Fg6=5Fcpu=5Fkill(unsigned int =
cpu)</font><br><font size=3D"2">+{</font><br><font size=3D"2">+</font><br><=
font size=3D"2">+       return 1;</font><br><font size=3D"2">+}</font><br><=
font size=3D"2">+</font><br><font size=3D"2"> static int aspeed=5Fg6=5Fboot=
=5Fsecondary(unsigned int cpu, struct task=5Fstruct *idle)</font><br><font =
size=3D"2"> {</font><br><font size=3D"2">        void =5F=5Fiomem *base;</f=
ont><br><font size=3D"2">@@ -56,6 +77,10 @@ static void =5F=5Finit aspeed=
=5Fg6=5Fsmp=5Fprepare=5Fcpus(unsigned int max=5Fcpus)</font><br><font size=
=3D"2"> static const struct smp=5Foperations aspeed=5Fsmp=5Fops =5F=5Finitc=
onst =3D {</font><br><font size=3D"2">        .smp=5Fprepare=5Fcpus       =
=3D aspeed=5Fg6=5Fsmp=5Fprepare=5Fcpus,</font><br><font size=3D"2">        =
.smp=5Fboot=5Fsecondary     =3D aspeed=5Fg6=5Fboot=5Fsecondary,</font><br><=
font size=3D"2">+#ifdef CONFIG=5FHOTPLUG=5FCPU</font><br><font size=3D"2">+=
       .cpu=5Fdie                =3D aspeed=5Fg6=5Fcpu=5Fdie,</font><br><fo=
nt size=3D"2">+       .cpu=5Fkill               =3D aspeed=5Fg6=5Fcpu=5Fkil=
l,</font><br><font size=3D"2">+#endif</font><br><font size=3D"2"> };</font>=
<br><br><font size=3D"2"> CPU=5FMETHOD=5FOF=5FDECLARE(aspeed=5Fsmp, &quot;a=
speed,ast2600-smp&quot;, &amp;aspeed=5Fsmp=5Fops);</font><br><font size=3D"=
2">bam@latitude-e5430:~/my=5Fgit/openbmc/openbmc/build/witherspoon-tacoma/w=
orkspace/sources/linux-aspeed$</font></ul><br><font size=3D"2">Thank you.</=
font><br><br><font size=3D"2">-- </font><br><font size=3D"2">Bruce</font><b=
r><BR>
</body></html>

--0__=8FBB0C12DF9144C28f9e8a93df938690918c8FBB0C12DF9144C2--

