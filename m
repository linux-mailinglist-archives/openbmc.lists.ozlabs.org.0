Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CC12E334
	for <lists+openbmc@lfdr.de>; Wed, 29 May 2019 19:26:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Dd0q6684zDqMM
	for <lists+openbmc@lfdr.de>; Thu, 30 May 2019 03:26:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=miltonm@us.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Dd0N2MhLzDqH5
 for <openbmc@lists.ozlabs.org>; Thu, 30 May 2019 03:25:55 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4THPpWC032816
 for <openbmc@lists.ozlabs.org>; Wed, 29 May 2019 13:25:52 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.90])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sswvwhd03-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 29 May 2019 13:25:52 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 29 May 2019 17:25:20 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 29 May 2019 17:25:16 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2019052917251600-2090012 ;
 Wed, 29 May 2019 17:25:16 +0000 
In-Reply-To: <CAO9PYRLkgxrpes9QvzaN30TNu4-hcL5apFLhgdoBbzqiHynbRw@mail.gmail.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Deng Tyler <tyler.sabdon@gmail.com>
Date: Wed, 29 May 2019 17:25:16 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <CAO9PYRLkgxrpes9QvzaN30TNu4-hcL5apFLhgdoBbzqiHynbRw@mail.gmail.com>,
 <CAO9PYRLdxqjbMHgsMoEY7m0ygwchLQk=7GOQr_itjqor=AMqfA@mail.gmail.com>
X-Mailer: IBM iNotes ($HaikuForm 1048) | IBM Domino Build
 SCN1812108_20180501T0841_FP38 April 10, 2019 at 11:56
X-LLNOutbound: False
X-Disclaimed: 50131
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 19052917-9717-0000-0000-00000C5F1FF8
X-IBM-SpamModules-Scores: BY=0.036131; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.417846; ST=0; TS=0; UL=0; ISC=; MB=0.216243
X-IBM-SpamModules-Versions: BY=3.00011180; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01210358; UDB=6.00635899; IPR=6.00991390; 
 BA=6.00006323; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00027104; XFM=3.00000015;
 UTC=2019-05-29 17:25:18
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-05-29 17:05:19 - 6.00009984
x-cbparentid: 19052917-9718-0000-0000-00005B8D408E
Message-Id: <OFA324E8C4.68341BF2-ON00258409.005FB277-00258409.005FB27E@notes.na.collabserv.com>
Subject: Re:  Re: Flash bmc fail due to partition incorrect
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-29_09:, , signatures=0
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2">Around 05/29/2019 05:25AM&nbsp; in some timezone, Deng Tyler wrote:<=
br>&gt;Hi all:<br>&gt;&nbsp; &nbsp; I encounter bmc firmware update fail is=
sue and message is "Verify<br>&gt;error: update: --no-flash --ignore-mount =
--no-save-files<br>&gt;--no-restore-files --no-clean-saved-files\nERROR: Un=
able to find mtd<br>&gt;partition for image-bmc.\n".<br>&gt;<br>&gt;I check=
 my flash partition and found that I lost "bmc" partition as<br>&gt;below:<=
br>&gt;cat /proc/mtd<br>&gt;dev: &nbsp; &nbsp;size &nbsp; erasesize &nbsp;n=
ame<br>&gt;mtd0: 00060000 00001000 "u-boot"<br>&gt;mtd1: 00020000 00001000 =
"u-boot-env"<br>&gt;mtd2: 00440000 00001000 "kernel"<br>&gt;mtd3: 01740000 =
00001000 "rofs"<br>&gt;mtd4: 00400000 00001000 "rwfs"<br>&gt;ls -l /dev/mtd=
<br>&gt;lrwxrwxrwx &nbsp; &nbsp;1 root &nbsp; &nbsp; root &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; 7 May 23 11:56 kernel -&gt;<br>&gt;../mtd2<br>&gt;=
lrwxrwxrwx &nbsp; &nbsp;1 root &nbsp; &nbsp; root &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; 7 May 23 11:56 rofs -&gt;<br>&gt;../mtd3<br>&gt;lrwxrwxrwx=
 &nbsp; &nbsp;1 root &nbsp; &nbsp; root &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; 7 May 23 11:56 rwfs -&gt;<br>&gt;../mtd4<br>&gt;lrwxrwxrwx &nbsp; &n=
bsp;1 root &nbsp; &nbsp; root &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 7 M=
ay 23 11:56 u-boot -&gt;<br>&gt;../mtd0<br>&gt;lrwxrwxrwx &nbsp; &nbsp;1 ro=
ot &nbsp; &nbsp; root &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 7 May 23 11=
:56 u-boot-env<br>&gt;-&gt; ../mtd1&nbsp;<br><div><br></div><div>Since your=
 mtd numbers start at 0, the problem is the whole flash <br></div><div>part=
ition is missing.&nbsp; You are missing a kernel config option:</div><div><=
br></div><div>config MTD=5FPARTITIONED=5FMASTER<br>&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; bool "Retain master device when partitioned"<br>&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default n<br>&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; depends on MTD<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; help<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; For histor=
ical reasons, by default, either a master is present or<br>&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; several partitions are present, but =
not both. The concern was that<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; data listed in multiple partitions was dangerous; however, SC=
SI does<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this and =
it is frequently useful for applications. This config option<br>&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; leaves the master in even if th=
e device is partitioned. It also makes<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; the parent of the partition device be the master devi=
ce, rather than<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; w=
hat lies behind the master.<br><br><br></div><div>&gt;</div>&gt;I tried to =
add bmc partition in dts&nbsp;<br>&gt;&amp;bootspi {<br>&gt;&nbsp; &nbsp; &=
nbsp; &nbsp; status =3D "okay";<br>&gt;&nbsp; &nbsp; &nbsp; &nbsp; flash@0 =
{<br>&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; status =3D=
 "okay";<br>&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; m25=
p,fast-read;<br>&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 label =3D "bmc";<br>&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; spi-max-frequency =3D &lt;50000000&gt;;<br>&gt;#include "openbmc-flas=
h-layout.dtsi"<br>&gt;&nbsp; &nbsp; &nbsp; &nbsp; };<br>&gt;};<br>&gt;<br>&=
gt;but there still is no "bmc" partition. Could someone give any<br>&gt;sug=
gestion? thanks.<br>&gt;<br>&gt;Tyler  </font><BR>

