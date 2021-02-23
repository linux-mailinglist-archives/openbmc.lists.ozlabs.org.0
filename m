Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67910322587
	for <lists+openbmc@lfdr.de>; Tue, 23 Feb 2021 06:49:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dl7RD3YGmz3cLf
	for <lists+openbmc@lfdr.de>; Tue, 23 Feb 2021 16:49:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UPaKuARi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UPaKuARi; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dl7Qz5N1nz30KP
 for <openbmc@lists.ozlabs.org>; Tue, 23 Feb 2021 16:49:15 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11N5Y0ki084278
 for <openbmc@lists.ozlabs.org>; Tue, 23 Feb 2021 00:49:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : mime-version : references : content-transfer-encoding :
 content-type : message-id : subject; s=pp1;
 bh=OgZNOfbPFtIJVDEWwsStzt4dMFLmoJtZzeIQnBM2ggA=;
 b=UPaKuARimOlLQN1wS4yCcOD69Kg8HJ1bcfvJXnX9vEFR6kFoP7kjTAqZ91b1HwTttjTZ
 PeDMlAeRnKOW9aqFQyVoWU5+pvbNXLzsnP4o6QdIVRp5PZVUGN8BQeFRDtSEluC/BCaN
 AvcbChm7dhsvUViTO6+rVtvpr8Ph8wehg0Wp3YRqbL3IGtvmumlHoe6/DfUjynxe2GmW
 RmtCwsFD74Mm9CQga2/fxi6plvtKPxmJCBJFPWgF22W6t0I/1xAwieC8ihtXJax8nTyT
 wL5jakNqqDQ+RRiFZIY6RluNpS0X80AOGod0bKe8O7pz2PCebDxrEUA70AnkAhzFGYEJ Gg== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.81])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36vkftvwwu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 23 Feb 2021 00:49:12 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 23 Feb 2021 05:49:11 -0000
Received: from us1a3-smtp06.a3.dal06.isc4sb.com (10.146.103.243)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 23 Feb 2021 05:49:08 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp06.a3.dal06.isc4sb.com
 with ESMTP id 2021022305490890-40403 ;
 Tue, 23 Feb 2021 05:49:08 +0000 
In-Reply-To: <CAGm54UHXEkGZc9nrr+ttMJJGbQObWYwO4rdpm4CYzBAEGT1YiQ@mail.gmail.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Lei Yu <yulei.sh@bytedance.com>
Date: Tue, 23 Feb 2021 05:49:08 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <CAGm54UHXEkGZc9nrr+ttMJJGbQObWYwO4rdpm4CYzBAEGT1YiQ@mail.gmail.com>,
 <BYAPR14MB23420BA1183F22A48EF8B97ACF839@BYAPR14MB2342.namprd14.prod.outlook.com>
 <3803c1a3-bee8-4e78-a23f-7e50858eda1a@beta.fastmail.com>
 <YDE90CWoSXCHjgYK@heinlein>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP130 January 13, 2021 at 14:04
X-LLNOutbound: False
X-Disclaimed: 20671
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 21022305-3067-0000-0000-0000052BE7FE
X-IBM-SpamModules-Scores: BY=0.031777; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.388783; ST=0; TS=0; UL=0; ISC=; MB=0.002328
X-IBM-SpamModules-Versions: BY=3.00014776; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01511830; UDB=6.00816505; IPR=6.01294355; 
 MB=3.00036224; MTD=3.00000008; XFM=3.00000015; UTC=2021-02-23 05:49:10
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2021-02-23 02:42:44 - 6.00012323
x-cbparentid: 21022305-3068-0000-0000-00000289EE79
Message-Id: <OF9998A4FA.EDA29860-ON00258685.001EE7D7-00258685.001FF6FB@notes.na.collabserv.com>
Subject: RE: overlayFS security concern
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-23_01:2021-02-22,
 2021-02-23 signatures=0
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
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Kun Zhao <zkxz@hotmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Feb 22, Lei Yu wrote:
>On Sun, Feb 21, 2021 at 12:56 AM Patrick Williams <patrick@stwcx.xyz>
>wrote:
>> On Sat, Feb 20, 2021 at 11:46:08AM +1030, Andrew Jeffery wrote:
>> > On Sat, 20 Feb 2021, at 11:01, Kun Zhao wrote:
>> > > 2. don=E2=80=99t use overlayFS (but it=E2=80=99s really useful for d=
ebugging
>during
>> > > develop, and configuration management)
>> >
>> > Possibly, but it's probably worth looking at IMA instead:
>>
>> IMA (or similar) is likely a good option.
>>
>> There is also work going on to remove 'root' from many users and
>> daemons so it should be harder to overwrite executables.  If you
>> have root I'm pretty sure you can always subvert even something
>like
>> IMA.
>>


>> A protection we could do which would make attacks slightly harder
>> than they are today would be to change how we mount OverlayFS.
>Right
>> now we mount it on top of root, but we could be more explicit about
>> mounting it only on top of places we expect to be read-write.
>`/etc`
>> and `/var` are the two that come to mind but I'm sure there are
>others.
>> This shouldn't be very difficult to implement for someone wanting
>to
>> take the initiative.
>

I've offered before and the offer still stands.

As the author of the original system layout including the init=20
and update scripts in the base layout and havng provided design=20
input to all 3 of the base, ubi, and mmc layouts I'm happy to=20
work on migrating the base layout to also transition from full=20
filesystem overlay to the direct mount of var with etc overlay=20
that exists on the other two layouts.

However, I don't have the access needed to test and regress the=20
transition from the current layout.  I need the assistance of=20
someone that is using the current layout and willing to test and=20
provide feedback on the transition.

[ Openbmc developent is not my primary work and I don't have=20
access to a system using the static layout that I can get=20
reflashed for recovery ]


Once this is done we can work as a community to seperate out the=20
overload of defaults and configuration that is in etc, probably=20
by a combination of moving openbmc content to /var/lib, and=20
perhaps by making /etc distributed empty via the system empty=20
init support (where /etc would be a plain writable filesystem=20
of pure configuration vs distribution defaults).

Only after that can overlayfs be removed from the kernel.

>Yup, as far as I remember, the "ubi layout" distro feature only mount
>specific directories instead of root.
>Checking the code, it enables the `read-only-rootfs`
>IMAGE=5FFEATURES[1], and use a different init script to mount only /etc
>by `preinit-mounts.bb`[2]
>The same for `phosphor-mmc` as well.
>
>@anoo should know this well :)
>

And I also know it, having been involved in all three layouts.

>[1]:
>https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A=5F=5Fgithub.com=5Fop=
enb
>mc=5Fopenbmc=5Fblob=5Fmaster=5Fmeta-2Dphosphor=5Frecipes-2Dphosphor=5Fimag=
es=5Fobmc
>-2Dphosphor-2Dimage.bb-23L35&d=3DDwIFaQ&c=3Djf=5FiaSHvJObTbx-siA1ZOg&r=3Db=
vv7
>AJEECoRKBU02rcu4F5DWd-EwX8As2xrXeO9ZSo4&m=3DLykl2abBxWlXUeD9IOsaSRujrlt
>BLI3LARBleKpfHMA&s=3DR=5FDHDXjMbd3D6V1ycREvdpSYQpPPGmYQdRctW3JRnHU&e=3D=20
>[2]:
>https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A=5F=5Fgithub.com=5Fop=
enb
>mc=5Fopenbmc=5Fblob=5Fmaster=5Fmeta-2Dphosphor=5Frecipes-2Dphosphor=5Fprei=
nit-2Dm
>ounts=5Fpreinit-2Dmounts=5Finit&d=3DDwIFaQ&c=3Djf=5FiaSHvJObTbx-siA1ZOg&r=
=3Dbvv7A
>JEECoRKBU02rcu4F5DWd-EwX8As2xrXeO9ZSo4&m=3DLykl2abBxWlXUeD9IOsaSRujrltB
>LI3LARBleKpfHMA&s=3DDSsCadWHqoLFHZ2JIx0c6psN1joBzjxI-je9q6is13I&e=3D=20
>
>--=20
>BRs,
>Lei YU


milton

