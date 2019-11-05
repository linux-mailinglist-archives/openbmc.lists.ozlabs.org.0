Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5745AF04DD
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2019 19:16:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476yYL28s7zF4qf
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 05:16:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=derick.montague@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476yVk6HxCzF4Vr
 for <openbmc@lists.ozlabs.org>; Wed,  6 Nov 2019 05:14:38 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA5IDwh1085730
 for <openbmc@lists.ozlabs.org>; Tue, 5 Nov 2019 13:14:34 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.74])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w3b2epcu0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 05 Nov 2019 13:14:33 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Tue, 5 Nov 2019 18:14:26 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 5 Nov 2019 18:13:48 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2019110518134727-833843 ;
 Tue, 5 Nov 2019 18:13:47 +0000 
In-Reply-To: <OFA932D091.0C04712F-ON002584A9.004F48DF-002584A9.0057C7C2@notes.na.collabserv.com>
From: "Derick Montague" <Derick.Montague@ibm.com>
To: "Derick Montague" <Derick.Montague@ibm.com>
Date: Tue, 5 Nov 2019 18:13:47 +0000
Sensitivity: 
MIME-Version: 1.0
References: <OFA932D091.0C04712F-ON002584A9.004F48DF-002584A9.0057C7C2@notes.na.collabserv.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1660 | IBM Domino Build
 SCN1812108_20180501T0841_FP61 October 18, 2019 at 15:11
X-LLNOutbound: False
X-Disclaimed: 5127
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 19110518-3165-0000-0000-0000019B28D1
X-IBM-SpamModules-Scores: BY=0.000023; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.417846; ST=0; TS=0; UL=0; ISC=; MB=0.042366
X-IBM-SpamModules-Versions: BY=3.00012057; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01285844; UDB=6.00681730; IPR=6.01068011; 
 MB=3.00029390; MTD=3.00000008; XFM=3.00000015; UTC=2019-11-05 18:14:26
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-11-05 11:30:35 - 6.00010613
x-cbparentid: 19110518-3166-0000-0000-00005AEE53C3
Message-Id: <OFF0C4A532.87EE8B30-ON002584A9.0064065B-002584A9.006423B9@notes.na.collabserv.com>
Subject: Re:  GUI Design Working Group
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-05_07:, , signatures=0
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Lucida S=
ans Unicode, Lucida Grande, sans-serif;font-size:10pt" ><div dir=3D"ltr" >&=
nbsp;</div>
<div dir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><di=
v dir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><div d=
ir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><div dir=
=3D"ltr" ><div dir=3D"ltr" ><div>&gt; The next GUI Design workgroup is tomo=
rrow, Wednesday, November 5th at 10:00 AM CST.</div>
<div>&nbsp;</div>
<div>Small typo, tomorrow, Wednesday, November 6th...</div></div></div></di=
v></div></div></div></div></div></div></div></div></div></div></div></div><=
BR>

