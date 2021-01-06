Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 931F12EC343
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 19:35:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9yhy4GLkzDqhY
	for <lists+openbmc@lfdr.de>; Thu,  7 Jan 2021 05:35:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XxHVW3Ud; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9yh86S2vzDqZN
 for <openbmc@lists.ozlabs.org>; Thu,  7 Jan 2021 05:34:31 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 106IW0x3039911
 for <openbmc@lists.ozlabs.org>; Wed, 6 Jan 2021 13:34:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : references : content-type : message-id :
 content-transfer-encoding : mime-version : subject; s=pp1;
 bh=yL36kxGrZuutdy0C6i8M2iYX3tcYEXupUvZpo6l+RSA=;
 b=XxHVW3UdoWPU3PC33MtOxTnbFAehhb0DQFoTzi5S5rRda4pL72qjlmBaS7dOI19x3i0W
 5Ivteu9YCuoli3US5oXtRPPSyT3KT1VvJUf3aexxYG8yAU3ue1tv+taDZKqKPJXvzcSS
 A1iMlV+KFeaHnEZEMNkysvMz+jtZE3rV0m5UrKzuJ93o2u++EBiMOcuMUjF76qbWbTaP
 wx4X3xJw08yvqWB57jOepcxmc9m/YluXGsT0vefySZ4udTJj8lKGxuKlrlP+MolMn/Lw
 Mu2WJxxgXrwcaONwKVsspC/C1xocdmuEiTYU01K5lLX3uhXWmEyDlWSATAayE2lYIVRE WQ== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.114])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35whj1hrgd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 06 Jan 2021 13:34:28 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 6 Jan 2021 18:34:28 -0000
Received: from us1b3-smtp05.a3dr.sjc01.isc4sb.com (10.122.203.183)
 by smtp.notes.na.collabserv.com (10.122.47.58) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 6 Jan 2021 18:34:27 -0000
Received: from us1b3-mail228.a3dr.sjc03.isc4sb.com ([10.168.214.55])
 by us1b3-smtp05.a3dr.sjc01.isc4sb.com
 with ESMTP id 2021010618342780-524615 ;
 Wed, 6 Jan 2021 18:34:27 +0000 
In-Reply-To: <5c7037de7f05461d82e9d5f47bb52353@TWN-EXCHMB-13.phoenix.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Leo Cheng <Leo_Cheng@phoenix.com>
Date: Wed, 6 Jan 2021 18:34:27 +0000
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <5c7037de7f05461d82e9d5f47bb52353@TWN-EXCHMB-13.phoenix.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 34979
X-TNEFEvaluated: 1
Content-Type: text/plain; charset=UTF-8
x-cbid: 21010618-1639-0000-0000-0000033A3CDC
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.388783; ST=0; TS=0; UL=0; ISC=; MB=0.000040
X-IBM-SpamModules-Versions: BY=3.00014507; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01489114; UDB=6.00802934; IPR=6.01271685; 
 MB=3.00035753; MTD=3.00000008; XFM=3.00000015; UTC=2021-01-06 18:34:28
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2021-01-06 11:33:15 - 6.00012200
x-cbparentid: 21010618-1640-0000-0000-0000C85045B3
Message-Id: <OF85CF2884.6C4B5EFF-ON00258655.006549BE-00258655.00660814@notes.na.collabserv.com>
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
Subject: Re:  .overlay directory
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-06_10:2021-01-06,
 2021-01-06 signatures=0
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Jan 6, 2021, Leo Cheng wrote:
> Hi Teams,
>=20=20
> I=E2=80=99m engineer of developing openbmc.
> I have the issue of restore-defaults: targeted_clean and I find the
>targeted_clean function in the init script which is from
>meta-openbmc-mods\meta-common\recipes-phosphor\preinit-mounts\preinit
>-mounts

Hi.=20=20

I'm not familiar with this directory.  Since you are talking about=20
wolfpass I am guessing you are talking about intel modifications=20
but don't have a full reference.

>=20
>=20=20
>=20
> I can=E2=80=99t find /tmp/.rwfs/.overlay in BMC.
>=20
>=20=20
> Check Intel openbmc, /tmp/.rwfs/.overlay exists in BMC.
>=20
>=20=20
> How to add it? Do you have any idea?
>=20=20


I do not know what the changes in this mods repository=20
are about nor any background.  The original scripts=20
operate under /run.

(I wrote the original init and update scripts and have
been involved in reviewing changes.  They are here=20

https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-phosph=
or/initrdscripts/files/

From looking at the snippit graphics there was a function=20
targeted_clean that was trying to  preserve some files and=20
remove the remainder.=20=20=20

A similar function is availabe via the whitelist in the
original init scripts.=20


While the wlist is hardcoded in
the existing repository it would be easy to implement=20
dynamic build control of the content if we move it to=20
the phosphor-misc repository


If the issue is about making only etc and var updatable,
I am willing to assist or write an update with someone to=20
test.   The proposed filesystem stack would be similar to=20
the ubi and emmc options with a writable /var containing=20
the /etc overlay.

milton

> Thanks.
>=20=20
> Best Regards,
> Leo Cheng
>=20=20=20=20=20

