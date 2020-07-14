Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A9521E701
	for <lists+openbmc@lfdr.de>; Tue, 14 Jul 2020 06:31:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5SJH4B8ZzDqVT
	for <lists+openbmc@lfdr.de>; Tue, 14 Jul 2020 14:31:11 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5SHD2BshzDqQW
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jul 2020 14:30:15 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06E42Tk7139581
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jul 2020 00:30:11 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.110])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32792uqrr7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jul 2020 00:30:11 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 14 Jul 2020 04:30:10 -0000
Received: from us1b3-smtp04.a3dr.sjc01.isc4sb.com (10.122.203.161)
 by smtp.notes.na.collabserv.com (10.122.47.50) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 14 Jul 2020 04:30:07 -0000
Received: from us1b3-mail228.a3dr.sjc03.isc4sb.com ([10.168.214.55])
 by us1b3-smtp04.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020071404300696-29771 ;
 Tue, 14 Jul 2020 04:30:06 +0000 
In-Reply-To: <CAGm54UH407RGGHmrbqUvWDy3ozXx08NQCNiW2E4qs576kwB67g@mail.gmail.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: "=?ISO-2022-JP?B?GyRCMGpNaxsoQg==?=" <yulei.sh@bytedance.com>
Date: Tue, 14 Jul 2020 04:30:07 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <CAGm54UH407RGGHmrbqUvWDy3ozXx08NQCNiW2E4qs576kwB67g@mail.gmail.com>,
 <HK2PR04MB3826F0E0E2F9CA1A041DFC5DFE610@HK2PR04MB3826.apcprd04.prod.outlook.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 54911
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20071404-1059-0000-0000-00000252A9DD
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.388783; ST=0; TS=0; UL=0; ISC=; MB=0.001001
X-IBM-SpamModules-Versions: BY=3.00013465; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01405476; UDB=6.00752933; IPR=6.01187722; 
 MB=3.00032995; MTD=3.00000008; XFM=3.00000015; UTC=2020-07-14 04:30:10
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-07-14 04:09:17 - 6.00011598
x-cbparentid: 20071404-1060-0000-0000-000054C0B0FB
Message-Id: <OF1D7ABF81.CDBAD648-ON002585A5.0017F478-002585A5.0018BAEF@notes.na.collabserv.com>
Subject: RE: How to let openbmc's kernel load jffs2 file system
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-13_17:2020-07-13,
 2020-07-13 signatures=0
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
Cc: "uperic@163.com" <uperic@163.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 =?GB2312?B?1twg1LbH5Q==?= <zhouyuanqing8@outlook.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



"=E9=83=81=E9=9B=B7"  wrote:
>Sent by: "openbmc"=20
>On Tue, Jul 14, 2020 at 9:34 AM =E5=91=A8 =E8=BF=9C=E6=B8=85 <zhouyuanqing=
8@outlook.com>
>wrote:
>>
>> Hello everyone,
>>
>> The rofs squashfs currently loaded by the kernel of openbmc is very
>inconvenient to debug because squashfs is a read-only file system. I
>made a jffs2 file system, after modifying the bootarg parameters of
>uboot, the kernel still loads squashfs.
>
>By default the root (/) is mounted by an overlayfs, so the whole
>rootfs is writable, see below:
>
>    cow on / type overlay
>(rw,relatime,lowerdir=3Drun/initramfs/ro,upperdir=3Drun/initramfs/rw/cow,
>workdir=3Drun/initramfs/rw/work)
>
>Be noted that the rwfs mounted at /run/initramfs/rw has a limited
>size, so you could only put files with limited size.
>For testing purposes, you could manually create overlayfs mount in
>tmpfs, that way you could use the ramfs instead of rwfs, and it will
>be cleaned after BMC reboot.
>

The openbmc init script support mounting hte overlayfs from ram
for code update or just using more memory than you have left for rwfs.

Add the folowing option to either your kernel command line or set=20
in the u-boot environment variable openbmcinit

overlay-filesystem-in-ram

to use a tmpfs for the overlay.  To restore files from the rwfs partiton
that are whitelisted add

copy-files-to-ram


example

https://github.com/openbmc/openbmc/tree/master/meta-phosphor/recipes-phosph=
or/initrdscripts/files


From os prompt
fwsetenv openbmcinit overlay-filesystem-in-ram copy-files-to-ram

or from  u-boot
setenv openbmcinit overlay-filesystem-in-ram copy-files-to-ram
saveenv

To save files in the whitelist (/run/initrd/whitelist) to the rwfs,

touch /run/initrdramfs/image-rwfs
reboot

Milton
(author of the phosphor init scripts)

>--=20
>BRs,
>Lei YU
>
>

