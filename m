Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 083B4324334
	for <lists+openbmc@lfdr.de>; Wed, 24 Feb 2021 18:33:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dm31H6xkjz3cZ4
	for <lists+openbmc@lfdr.de>; Thu, 25 Feb 2021 04:33:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VF9hw2rM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bruce.mitchell@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VF9hw2rM; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dm313738Vz30Mr
 for <openbmc@lists.ozlabs.org>; Thu, 25 Feb 2021 04:33:26 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11OHX4IZ079495
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2021 12:33:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : mime-version : references : content-transfer-encoding :
 content-type : message-id : subject; s=pp1;
 bh=P5Ag526k5AT3WN9qDJdyqoTn04M6iQVUHzd1Q+DoFHM=;
 b=VF9hw2rMCJOujGmVzPZUQygXIQ+PYg2o2qYCk7VpIvsyIanJtF57SOuCSPbeJCjmsVNy
 /kzPZMgcMb53r+8hWmWt1+0r6SxkTYN24yjlZMPbZpnxQEo4d4fJWEoINrKcVlsi8yDx
 CmfM/SoQDWcdquFPSlS/lt+kYV716Hj7E5OVFKCNAod9yWZDRZzlLswZGxGBJPzbk7zp
 /jpyBDvHCUjglUrMnNbayj5SMTyFgYMogfF9JOWAaY0qc/7hMZRGTN+kG5ZYCZga8mkz
 Z2KdVWZzldsdBFTXW0TZh2SK1JmDIb3MDLODPgW18bvBGW/4N2qOwVgjzVKXazCnx47f 4A== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36wk3tt2xy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2021 12:33:25 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Bruce.Mitchell@ibm.com>;
 Wed, 24 Feb 2021 17:33:24 -0000
Received: from us1b3-smtp05.a3dr.sjc01.isc4sb.com (10.122.203.183)
 by smtp.notes.na.collabserv.com (10.122.47.46) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 24 Feb 2021 17:33:22 -0000
Received: from us1b3-mail31.a3dr.sjc01.isc4sb.com ([10.122.7.131])
 by us1b3-smtp05.a3dr.sjc01.isc4sb.com
 with ESMTP id 2021022417332243-592186 ;
 Wed, 24 Feb 2021 17:33:22 +0000 
In-Reply-To: <CACPK8XdmbXK4CVfydO5yq4Qka--wT1fR-vuqFKD_rg29fAquMA@mail.gmail.com>
From: "Bruce Mitchell" <Bruce.Mitchell@ibm.com>
To: Joel Stanley <joel@jms.id.au>
Date: Wed, 24 Feb 2021 17:33:22 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <CACPK8XdmbXK4CVfydO5yq4Qka--wT1fR-vuqFKD_rg29fAquMA@mail.gmail.com>,
 <OFC6D46F57.69575CC5-ON00258681.0002C252-88258681.0004EA2C@notes.na.collabserv.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP130 January 13, 2021 at 14:04
X-KeepSent: 09FD4ECC:9DFDE50C-00258686:005FF8FB;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 10107
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 21022417-3017-0000-0000-0000043547CB
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.430458; ST=0; TS=0; UL=0; ISC=; MB=0.000106
X-IBM-SpamModules-Versions: BY=3.00014785; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01512544; UDB=6.00816935; IPR=6.01295070; 
 MB=3.00036238; MTD=3.00000008; XFM=3.00000015; UTC=2021-02-24 17:33:23
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2021-02-24 13:17:25 - 6.00012327
x-cbparentid: 21022417-3018-0000-0000-00006FAC4946
Message-Id: <OF09FD4ECC.9DFDE50C-ON00258686.005FF8FB-00258686.00607087@notes.na.collabserv.com>
Subject: RE: My kexec test patches for OpenBMC
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-24_08:2021-02-24,
 2021-02-24 signatures=0
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
>>
>> I am running QEMU
>>
>> qemu-system-arm --version
>> QEMU emulator version 5.2.0 (v5.1.0-3479-g27ca38d3db)
>
>That looks fine. I'm using cedric's tree, but anything that will
>boot
>your kernel is fine.

I believe I am using C=C3=A9dric's tree as well.
https://github.com/legoater/qemu.git
commit 27ca38d3db4a35da977cc89d52541ea12e1ba9c4 (HEAD -> aspeed-5.2, origin=
/aspeed-5.2, origin/HEAD)

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
>[ 0.042030] smp: Bringing up secondary CPUs ...
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

I had only found examples that had changed the kernel config
so I changed defconfig to match. I'll try without changing it.


Thank Joel for all your suggestions.

--
Bruce

