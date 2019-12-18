Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B79571254EE
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 22:43:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dT5X03BDzDqRb
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2019 08:43:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=derick.montague@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dT4D4s2bzDql0
 for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2019 08:42:03 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBILboFe139674
 for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2019 16:42:01 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.90])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wyhcc7vxr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2019 16:42:01 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Wed, 18 Dec 2019 21:42:00 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 18 Dec 2019 21:41:58 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2019121821415760-1007510 ;
 Wed, 18 Dec 2019 21:41:57 +0000 
In-Reply-To: 
Subject: GUI Design Workgroup
From: "Derick Montague" <Derick.Montague@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Wed, 18 Dec 2019 21:41:57 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1661 | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-LLNOutbound: False
X-Disclaimed: 1355
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 19121821-3649-0000-0000-000001B03B85
X-IBM-SpamModules-Scores: BY=0.228082; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40304; ST=0; TS=0; UL=0; ISC=; MB=0.000002
X-IBM-SpamModules-Versions: BY=3.00012261; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01306295; UDB=6.00693991; IPR=6.01088597; 
 MB=3.00029988; MTD=3.00000008; XFM=3.00000015; UTC=2019-12-18 21:41:59
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-12-18 15:07:01 - 6.00010780
x-cbparentid: 19121821-3650-0000-0000-00002E2961D4
Message-Id: <OFC3D0BACB.FCBCC607-ON002584D4.00769651-002584D4.007732CA@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-18_07:2019-12-17,2019-12-18 signatures=0
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Lucida S=
ans Unicode, Lucida Grande, sans-serif;font-size:10pt" ><div dir=3D"ltr" >H=
ello,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Here is a link to today's GUI Design workgroup. We had so=
me new folks join today! Thanks to Bruce from Phoenix Technologies for join=
ing and participating in teh meeting today.&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Quick Overview</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >- Discussed briefly about the Vue prototype</div>
<div dir=3D"ltr" >- Discussed the patterns for showing and hiding the prima=
ry navigation for small screens (or possibly controlled by the user)</div>
<div dir=3D"ltr" >- Discussed agreements and steps forward for collaborativ=
e design of the OpenBMC UI upstream experience</div>
<div dir=3D"ltr" >- Discussed ability to theme the UI easily downstream</di=
v>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Meeting Notes:&nbsp;<a href=3D"https://github.com/openbmc=
/openbmc/wiki/GUI-Design-work-group#121819" >https://github.com/openbmc/ope=
nbmc/wiki/GUI-Design-work-group#121819</a></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Next Meeting: 01/08/20 - Happy New year!</div>
<div dir=3D"ltr" >Note, we will be on a new cadence since the next meeting =
fell on 1/1/20. Our next meeting we are planning to review the Vue prototyp=
e code and show a demo.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Thanks!</div></div><BR>

