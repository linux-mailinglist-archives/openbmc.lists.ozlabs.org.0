Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE87AFED3
	for <lists+openbmc@lfdr.de>; Wed, 11 Sep 2019 16:37:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T4HW3wKfzF0XQ
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 00:37:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=derick.montague@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T4CT1VFDzF399
 for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2019 00:33:56 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8BEWTLl104124
 for <openbmc@lists.ozlabs.org>; Wed, 11 Sep 2019 10:33:53 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.74])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uy2ass9g5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 11 Sep 2019 10:33:53 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Wed, 11 Sep 2019 14:33:52 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 11 Sep 2019 14:33:49 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2019091114334894-636197 ;
 Wed, 11 Sep 2019 14:33:48 +0000 
In-Reply-To: 
Subject: GUI Design Workshop - 9/11/19 - Cancelled
From: "Derick Montague" <Derick.Montague@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Wed, 11 Sep 2019 14:33:48 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1619 | IBM Domino Build
 SCN1812108_20180501T0841_FP57 August 05, 2019 at 12:42
X-LLNOutbound: False
X-Disclaimed: 51691
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 19091114-3165-0000-0000-000000F8AACD
X-IBM-SpamModules-Scores: BY=0.000336; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.423878; ST=0; TS=0; UL=0; ISC=; MB=0.002725
X-IBM-SpamModules-Versions: BY=3.00011754; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000288; SDB=6.01259879; UDB=6.00665978; IPR=6.01041648; 
 MB=3.00028582; MTD=3.00000008; XFM=3.00000015; UTC=2019-09-11 14:33:51
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-09-11 09:52:17 - 6.00010394
x-cbparentid: 19091114-3166-0000-0000-00001C25C048
Message-Id: <OFFC225FF3.3D10EB59-ON00258472.004FF157-00258472.004FFFFC@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-11_08:, , signatures=0
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
<div dir=3D"ltr" >Sorry for the late notice. Due to a lack of agenda items,=
 we are cancelling today's workgroup.&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >The next workgroup will be on 9/25/29.</div>
<div dir=3D"ltr" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"fo=
nt-family:Arial, Helvetica, sans-serif;font-size:10pt" ><div class=3D"socma=
ildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, Helvetica, sans-seri=
f;font-size:10pt" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"f=
ont-family:Arial, Helvetica, sans-serif;font-size:10.5pt" ><div class=3D"so=
cmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, Helvetica, sans-s=
erif;font-size:10.5pt" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=
=3D"font-family:Arial, Helvetica, sans-serif;font-size:10.5pt" ><div class=
=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, Helvetica, =
sans-serif;font-size:10.5pt" ><div class=3D"socmaildefaultfont" dir=3D"ltr"=
 style=3D"font-family:Arial, Helvetica, sans-serif;font-size:10.5pt" ><div =
class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, Helvet=
ica, sans-serif;font-size:10.5pt" ><div class=3D"socmaildefaultfont" dir=3D=
"ltr" style=3D"font-family:Arial, Helvetica, sans-serif;font-size:10.5pt" >=
<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div class=3D"socmaildefaultfont" d=
ir=3D"ltr" style=3D"font-family:Arial, Helvetica, sans-serif;font-size:10.5=
pt" ><div dir=3D"ltr" ><div style=3D"font-size: 8pt; font-family: sans-seri=
f; margin-top: 10px;" ><div>&nbsp;</div></div></div></div></div></div></div=
></div></div></div></div></div></div></div></div></div><BR>

