Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA9895618
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 06:29:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CHqZ5krVzDr1F
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 14:28:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=miltonm@us.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CHps2858zDqg6
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 14:28:19 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7K4QvFu091244
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 00:28:16 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.111])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ug63v75fj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 00:28:16 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 20 Aug 2019 04:28:15 -0000
Received: from us1b3-smtp08.a3dr.sjc01.isc4sb.com (10.122.203.190)
 by smtp.notes.na.collabserv.com (10.122.47.52) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 20 Aug 2019 04:28:10 -0000
Received: from us1b3-mail228.a3dr.sjc03.isc4sb.com ([10.168.214.55])
 by us1b3-smtp08.a3dr.sjc01.isc4sb.com
 with ESMTP id 2019082004280966-570 ; Tue, 20 Aug 2019 04:28:09 +0000 
In-Reply-To: <3F27A9B8-86A5-48DB-AAAD-211F8364FEF7@fb.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Vijay Khemka <vijaykhemka@fb.com>
Date: Tue, 20 Aug 2019 04:28:09 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <3F27A9B8-86A5-48DB-AAAD-211F8364FEF7@fb.com>
X-Mailer: IBM iNotes ($HaikuForm 1054) | IBM Domino Build
 SCN1812108_20180501T0841_FP55 May 22, 2019 at 11:09
X-LLNOutbound: False
X-Disclaimed: 18247
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 19082004-3633-0000-0000-00000072312D
X-IBM-SpamModules-Scores: BY=0.02117; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.388783; ST=0; TS=0; UL=0; ISC=; MB=0.173593
X-IBM-SpamModules-Versions: BY=3.00011621; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01249357; UDB=6.00659531; IPR=6.01030902; 
 MB=3.00028243; MTD=3.00000008; XFM=3.00000015; UTC=2019-08-20 04:28:13
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-08-20 01:33:43 - 6.00010306
x-cbparentid: 19082004-3634-0000-0000-00000BE35B12
Message-Id: <OFF6F4F3D1.CC0C983B-ON0025845C.0016F062-0025845C.00188CCE@notes.na.collabserv.com>
Subject: Re:  persistent storage and bcc upgrade
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-20_01:, , signatures=0
X-Proofpoint-Spam-Reason: safe
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

On August 19, 2019 around 4:52PM in some timezone, Vijay Khemka wrote:
>      =20
> Team,
> I have a following question
>  what are directories mounted as rw and kept as persistent across
>reboot?

It depends on the flash layout you choose, but the default phosphor
initramfs will mount a readwrite overlay over the whole root.  From
that, /tmp and /run are excluded via a ramfs.

The UBI option will only allow writes to /var and /etc, and /home/root
(well, also /run and /tmp are tmpfs again).

That said you can do other customization.

>How are we updating BMC image and what happens to persistent storage
>after upgrade. I am using =E2=80=9Cflashcp=E2=80=9D which copies complete =
32 mb image
>which means  it wipes out everything stored currently.

Are you doing flashcp while the filesystem is mounted?  How are you
avoiding errors?

Are you booting in "code update mode" which will copy the squashfs
to RAM?   If so then read on.

The phosphor-initfs recipe has a whitelist file (was going to be
a directory but never made the patch) that will copy files from
the read-write backing filesystem to the overlay over the / to
the /run initramfs.  When booted in code-update mode, the files
and directories in the whitelist are copied to /run. =20

When systemd shutown target is activated, the initramfs shutdown
script will call the update script to save any initramfs images. =20
After writing images with flash=5Ferase and flash=5Fcp it will=20
mount the read-write partition and copy back the ram overlay to
the persistent read-write filesystem (only the files in the
whitelist).  The shutdown script will also copy the u-boot env
partition back to the mtd, so variables there will also be restored.

This is the default for aspeed AST2500 and ASt2400 and as far as=20
I know would also run for npcm (they just have an additional=20
partition).

This was somewhat described in the newly merged (today)

https://github.com/openbmc/docs/blob/master/code-update/flash-layout.md

Feels free to ask more questions though the list.

milton

