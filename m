Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC96B32F5DF
	for <lists+openbmc@lfdr.de>; Fri,  5 Mar 2021 23:27:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dsj605x2Qz3dDP
	for <lists+openbmc@lfdr.de>; Sat,  6 Mar 2021 09:27:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OU9XaFYO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com;
 envelope-from=bruce.mitchell@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OU9XaFYO; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dsj5l74K3z30KJ
 for <openbmc@lists.ozlabs.org>; Sat,  6 Mar 2021 09:27:06 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 125M2tZo090613
 for <openbmc@lists.ozlabs.org>; Fri, 5 Mar 2021 17:27:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : mime-version : references : content-transfer-encoding :
 content-type : message-id : subject; s=pp1;
 bh=jYLtRTf1Ka9hF85Hnhd4iCaKZSwo26kw9Mja7y/n6Zo=;
 b=OU9XaFYOCbLJl4JAorcJGgeZM0PjiqJeLzjm2M/q4kLUZfRRKI9/B7xsOHDSBmF8eQfL
 LiOlN9IENmhEoYNwCTBJEAMa0y34n6EKaDq9/D93bKckTLhKbElL3HfOURqF85jO26Y2
 R6rd1HVmE1TAHn1qhoEk7QumcHjFsfLgwmDWLI3jel1fhms0kt7nYrSn4KnfNBxuJ1RB
 YHvqi4/lUJY2rGJoxepYTB6ZCM6agvIgnHHZWQn+PZzYLMRw5LKTJKHZeVkZhuhnLn9w
 rP7TtF/jNA6yo6rndHi2BOeij7l3COzRhzvCfycCzW2zaGL/Hotf716ky/gVcVuTM3BO +A== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.74])
 by mx0a-001b2d01.pphosted.com with ESMTP id 373u6ebafn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 05 Mar 2021 17:27:04 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Bruce.Mitchell@ibm.com>;
 Fri, 5 Mar 2021 22:27:03 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 5 Mar 2021 22:27:03 -0000
Received: from us1a3-mail33.a3.dal06.isc4sb.com ([10.146.6.20])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2021030522270241-848610 ;
 Fri, 5 Mar 2021 22:27:02 +0000 
In-Reply-To: <CACPK8XdmbXK4CVfydO5yq4Qka--wT1fR-vuqFKD_rg29fAquMA@mail.gmail.com>
From: "Bruce Mitchell" <Bruce.Mitchell@ibm.com>
To: Joel Stanley <joel@jms.id.au>
Date: Fri, 5 Mar 2021 22:27:02 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <CACPK8XdmbXK4CVfydO5yq4Qka--wT1fR-vuqFKD_rg29fAquMA@mail.gmail.com>,
 <OFC6D46F57.69575CC5-ON00258681.0002C252-88258681.0004EA2C@notes.na.collabserv.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP130 January 13, 2021 at 14:04
X-KeepSent: 9A0016A1:FD9B7171-0025868F:007B5317;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 30347
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 21030522-3165-0000-0000-000005949C61
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0; SC=0;
 ST=0; TS=0; UL=0; ISC=; MB=0.010583
X-IBM-SpamModules-Versions: BY=3.00014826; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000296; SDB=6.01515836; UDB=6.00818898; IPR=6.01298352; 
 MB=3.00036306; MTD=3.00000008; XFM=3.00000015; UTC=2021-03-05 22:27:03
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2021-03-03 13:27:16 - 6.00012344
x-cbparentid: 21030522-3166-0000-0000-0000CD8FA097
Message-Id: <OF9A0016A1.FD9B7171-ON0025868F.007B5317-0025868F.007B531B@notes.na.collabserv.com>
Subject: RE: My kexec test patches for OpenBMC
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-05_14:2021-03-03,
 2021-03-05 signatures=0
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



-----"openbmc" <openbmc-bounces+bruce.mitchell=3Dibm.com@lists.ozlabs.org> =
wrote: -----

>To: Bruce Mitchell <Bruce.Mitchell@ibm.com>
>From: Joel Stanley
>Sent by: "openbmc"
>Date: 02/24/2021 00:04
>Cc: Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist
><openbmc@lists.ozlabs.org>
>Subject: [EXTERNAL] Re: My kexec test patches for OpenBMC
>
>On Fri, 19 Feb 2021 at 00:53, Bruce Mitchell
><Bruce.Mitchell@ibm.com> wrote:
>>
>> Hello Joel,
>>
>> Per your request yesterday, I am emailing the details of my
>kexec/kdump development efforts.
>
>Thanks. Here's what I tested:
>
>https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A=5F=5Fgithub.com=5Fsh
>enki=5Flinux=5Fcommits=5Fast2600-2Dkexec&d=3DDwIFaQ&c=3Djf=5FiaSHvJObTbx-s=
iA1Z
>Og&r=3DXYNAOU-BEndJr70kO1xkYnetCkaomJrlYQm5DudYzNc&m=3DoX=5FdPGCu4X3pBZl
>Dw0XYgu4z-3G1JebwP-IvlNbEMDE&s=3DgT3O534rB4ZDIPbf6Z78bKCR=5Fop-JR1uYcv
>bd3z18RA&e=3D
>

Your kernel changes are similar to what I had done. Since you know
the community better than I do, I propose submitting your changes.
I can do the labor, but want you to get the credit. How would you
like me to proceed?

>>
>> I am running QEMU
>>
>> qemu-system-arm --version
>> QEMU emulator version 5.2.0 (v5.1.0-3479-g27ca38d3db)
>
>That looks fine. I'm using cedric's tree, but anything that will
>boot
>your kernel is fine.
>
>> qemu-system-arm -d cpu=5Freset -M tacoma-bmc -kernel
>/tmp/tmp.y2fpdAXM1h.kernel -dtb /tmp/tmp.BWkadwNbTf.dtb -initrd
>/tmp/tmp.jRpFbzfpBs.initrd -drive
>file=3Dobmc-phosphor-image-witherspoon-tacoma.wic,if=3Dsd,format=3Draw,i
>ndex=3D2 -net nic -net
>user,hostfwd=3D:127.0.0.1:2222-:22,hostfwd=3D:127.0.0.1:2443-:443,host
>name=3Dqemu -nographic -append "crashkernel=3D64M
>console=3DttyS4,115200n8 rootwait root=3DPARTLABEL=3Drofs-a"
>
>You could simplify your qemu setup if you want. Here's how I
>tested:
>
> $ qemu-system-arm -M tacoma-bmc -nographic -net nic -nic
>user,hostfwd=3D::2222-:22,tftp=3D/srv/tftp/ -kernel
>aspeed-g5-dev/arch/arm/boot/zImage -dtb
>aspeed-g5-dev/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dtb -initrd
>~/dev/kernels/misc/rootfs.cpio.xz
>
>This uses a small initramfs with the kexec utility, and has a copy
>of
>the kernel, initrd and dtb inside to make testing easy.
>
>Or, if you want, you can copy files into the system over the ssh
>port:
>
>I have this in my ~/.ssh/config:
>
>Host qemu
> Hostname localhost
> Port 2222
> User root
> UserKnownHostsFile /dev/null
> StrictHostKeyChecking no
>
>And then you can use scp like this:
>
>scp aspeed-g5-dev/arch/arm/boot/zImage
>aspeed-g5-dev/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dtb
>/home/joel/dev/kernels/misc/rootfs.cpio.xz qemu:
>
>> From OpenBMC within QEMU I am using the following to test kexec
>>
>> kexec -d -l /home/kexec=5Ffiles/tmp.y2fpdAXM1h.kernel
>--initrd=3D/home/kexec=5Ffiles/tmp.jRpFbzfpBs.initrd
>--dtb=3D/home/kexec=5Ffiles/tmp.BWkadwNbTf.dtb --append=3D"earlycon
>console=3DttyS4,115200n8 rootwait root=3DPARTLABEL=3Drofs-a 1 maxcpus=3D1
>reset=5Fdevices"
>> kexec -d -e
>
>Here's how I was running it:
>
># kexec -l zImage --dtb aspeed-bmc-opp-tacoma.dtb --initrd
>rootfs.cpio.xz
># kexec -e
>
>I haven't set a new command line, so it uses the command line from
>the
>device tree (console=3DttyS4,115200n8).
>
>With my patch we will not get the secondary CPU:
>
>[ 0.039517] ASPEED AST2600 rev A1 (05010303)
>[ 0.042030] smp: Bringing up secondary CPUs .
>[ 1.163950] CPU1: failed to come online
>[ 1.167999] smp: Brought up 1 node, 1 CPU
>[ 1.168164] SMP: Total of 1 processors activated (2250.00
>BogoMIPS).
>
>That should be the next step in working on the kexec patches. We
>want
>the secondary CPU to be in a state such that the new kernel can
>take
>control as it would in a firmware boot.
>
>Note that this didn't require any changes to the system beyond the
>kernel patch. I'm using the same defconfig as we have in the tree.
>
>Cheers,
>
>Joel
>
>

Hello Joel,

Thanks again for your advice and sharing your wisdom.
I am being urged by our manager to get this up-streamed
sooner rather than later. How can I best work with the
system to make this happen?

Thank you!

--
Bruce


