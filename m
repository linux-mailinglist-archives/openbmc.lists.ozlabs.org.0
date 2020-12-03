Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F45D2CD9B0
	for <lists+openbmc@lfdr.de>; Thu,  3 Dec 2020 15:58:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmzVv0Zz5zDqV6
	for <lists+openbmc@lfdr.de>; Fri,  4 Dec 2020 01:58:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com;
 envelope-from=bruce.mitchell@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=EQoNocb+; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmzTf5gC5zDqHh
 for <openbmc@lists.ozlabs.org>; Fri,  4 Dec 2020 01:57:42 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B3EmqIq039113
 for <openbmc@lists.ozlabs.org>; Thu, 3 Dec 2020 09:57:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : date : mime-version : references : content-transfer-encoding :
 content-type : message-id : subject; s=pp1;
 bh=u3v7YWRcQhofUvNjp6Cp7vaj8fIos5k2hrnqco1/k2M=;
 b=EQoNocb+2cM05jkoHZ5Mo/77l8yYNN0mtboHjpHQ0yhQMQCYz8Pu01NmkC0owLyT4DwO
 XpwDqsokbWzLXvoDGXAKWjUinEByPF8WKpSRvy2BApfG3ytneMpunajXD6Hsa1oCrr6j
 KtsELLGtx1oaY6rXUpF3ihPRh2ftY6K6azkOvw5hYEbjPvr9zt1KiYFr/PBqUq+NzVTf
 Qsw5PudUoyXTlB05SgUXJoNtbaR9Li0rxNWCkMEEjVhf7cCS+OGeFjEQFNObeM0JliPZ
 ICWivdJfPJMzchAKR1WOVF5KJDUU6IW5IrdLinVwFHA1Yzy4e0x0BrlfmFKs2PHK9ogs /A== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.111])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3571ns99js-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 03 Dec 2020 09:57:39 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Bruce.Mitchell@ibm.com>;
 Thu, 3 Dec 2020 14:57:38 -0000
Received: from us1b3-smtp06.a3dr.sjc01.isc4sb.com (10.122.203.184)
 by smtp.notes.na.collabserv.com (10.122.47.52) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 3 Dec 2020 14:57:37 -0000
Received: from us1b3-mail31.a3dr.sjc01.isc4sb.com ([10.122.7.131])
 by us1b3-smtp06.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020120314573680-483934 ;
 Thu, 3 Dec 2020 14:57:36 +0000 
In-Reply-To: <OF8EC2E0B3.F804468E-ON00258632.0000C9CB-88258632.0000F872@LocalDomain>
From: "Bruce Mitchell" <Bruce.Mitchell@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Thu, 3 Dec 2020 14:57:36 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <OF8EC2E0B3.F804468E-ON00258632.0000C9CB-88258632.0000F872@LocalDomain>,
 <OFD6833344.166C4341-ON00258631.007EBD09-88258631.007F0D6B@notes.na.collabserv.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 30127
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 20120314-3633-0000-0000-0000035A2A77
X-IBM-SpamModules-Scores: BY=0.293977; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.410169; ST=0; TS=0; UL=0; ISC=; MB=0.148540
X-IBM-SpamModules-Versions: BY=3.00014303; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01472762; UDB=6.00793202; IPR=6.01255407; 
 MB=3.00035339; MTD=3.00000008; XFM=3.00000015; UTC=2020-12-03 14:57:38
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-12-03 08:31:04 - 6.00012109
x-cbparentid: 20120314-3634-0000-0000-00002BC62C6E
Message-Id: <OF59E1D9D7.DE547428-ON00258633.00522DD1-00258633.00522DD4@notes.na.collabserv.com>
Subject: Re:  Seeking advice on building and using kdump with OpenBMC.
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-03_07:2020-12-03,
 2020-12-03 signatures=0
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2"><div><font face=3D"Verdana, Arial, Helvetica, sans-serif"><br></font=
></div><font face=3D"Verdana, Arial, Helvetica, sans-serif">I am assuming t=
hat nobody in the general community has tried or has suggestions about kdum=
p on OpenBMC and/or Yocto.</font><br><br><font color=3D"#990099" style=3D"f=
ont-family: Verdana, Arial, Helvetica, sans-serif;">-----Bruce Mitchell/US/=
IBM wrote: -----</font><div class=3D"iNotesHistory" style=3D"font-family: V=
erdana, Arial, Helvetica, sans-serif; padding-left: 5px;"><div style=3D"pad=
ding-right:0px;padding-left:5px;border-left:solid black 2px;">To: <a href=
=3D"mailto:openbmc@lists.ozlabs.org" target=3D"=5Fblank">openbmc@lists.ozla=
bs.org</a><br>From: Bruce Mitchell/US/IBM<br>Date: 12/01/2020 04:10PM<br>Su=
bject: Re: [EXTERNAL] Seeking advice on building and using kdump with OpenB=
MC.<br><br><font size=3D"2">In addition both Yocto and OpenBMC have kexec /=
 kdump in the poky/meta/recipes-kernel/kexec/kexec-tools directories and po=
ky/meta/recipes-kernel/kexec/kexec-tools=5F2.0.20.bb . &nbsp;So I &nbsp;am =
looking for guidance on what the higher level perspective is beyond just pu=
lling in kdump and building a BMC. &nbsp;I assume there is configuration th=
at both Yocto and OpenBMC have kexec / kdump in the poky/meta/recipes-kerne=
l/kexec/kexec-tools directories and poky/meta/recipes-kernel/kexec/kexec-to=
ols=5F2.0.20.bb . &nbsp;So I &nbsp;am looking for guidance on what the high=
er level perspective is beyond just pulling in kdump and building a BMC. &n=
bsp;I assume there is configuration that are more useful for the OpenBMC co=
mmunity.</font><br><br><img width=3D"16" height=3D"16" src=3D"/icons/grayco=
l.gif" border=3D"0" alt=3D"Inactive hide details for &quot;Bruce Mitchell&q=
uot; ---12/01/2020 15:08:38---Seeking advice on building and using kdump wi=
th OpenBMC. Ar"><font size=3D"2" color=3D"#424282">"Bruce Mitchell" ---12/0=
1/2020 15:08:38---Seeking advice on building and using kdump with OpenBMC. =
Are there any Best Known Methods?</font><br><br><br><font size=3D"2">Seekin=
g advice on building and using kdump with OpenBMC.<br>Are there any Best Kn=
own Methods?<br>Any troubles and/or issues to lookout for?<br>What should I=
 avoid?</font><font size=3D"3"><br></font><font size=3D"2"><br>Are there an=
y security concerns?</font><font size=3D"3"><br></font><font size=3D"2"><br=
>Thank you!</font><font size=3D"3"><br></font><font size=3D"2"><br>-- <br>B=
ruce</font><br></div></div></font><BR>

