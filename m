Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 441CCD149D
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2019 18:52:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pKyT363ZzDqGW
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2019 03:52:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=derick.montague@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pKxn0DPZzDqX6
 for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2019 03:51:56 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x99GjchP100575
 for <openbmc@lists.ozlabs.org>; Wed, 9 Oct 2019 12:51:52 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.93])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vhjdkjccm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 09 Oct 2019 12:51:52 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Wed, 9 Oct 2019 16:51:51 -0000
Received: from us1a3-smtp07.a3.dal06.isc4sb.com (10.146.103.14)
 by smtp.notes.na.collabserv.com (10.106.227.39) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 9 Oct 2019 16:51:50 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp07.a3.dal06.isc4sb.com
 with ESMTP id 2019100916514943-769339 ;
 Wed, 9 Oct 2019 16:51:49 +0000 
In-Reply-To: <OFCE5B32BC.685900B4-ON0025848D.004D8D53-0025848D.004F08E6@notes.na.collabserv.com>
From: "Derick Montague" <Derick.Montague@ibm.com>
To: "Derick Montague" <Derick.Montague@ibm.com>
Date: Wed, 9 Oct 2019 16:51:49 +0000
Sensitivity: 
References: <OFCE5B32BC.685900B4-ON0025848D.004D8D53-0025848D.004F08E6@notes.na.collabserv.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1619 | IBM Domino Build
 SCN1812108_20180501T0841_FP57 August 05, 2019 at 12:42
X-LLNOutbound: False
X-Disclaimed: 54599
X-TNEFEvaluated: 1
Content-Type: text/html; charset=UTF-8
x-cbid: 19100916-8889-0000-0000-000000B3FB43
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.417846; ST=0; TS=0; UL=0; ISC=; MB=0.000077
X-IBM-SpamModules-Versions: BY=3.00011921; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01273007; UDB=6.00674033; IPR=6.01055108; 
 MB=3.00029015; MTD=3.00000008; XFM=3.00000015; UTC=2019-10-09 16:51:50
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-10-09 12:12:38 - 6.00010505
x-cbparentid: 19100916-8890-0000-0000-000001051C9D
Message-Id: <OFF42FD982.B69353DB-ON0025848E.005C95B2-0025848E.005CA28B@notes.na.collabserv.com>
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 1 URL was un-rewritten
MIME-Version: 1.0
Subject: Re:  GUI Design Community Workgroup
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-09_08:, , signatures=0
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
gt; The meeting information can be found on the GUIDesign&nbsp;Workgroup wi=
ki&nbsp;page -&nbsp;<a href=3D"https://github.com/openbmc/openbmc/wiki/GUI-=
Design-work-group" target=3D"_blank">https://github.com/openbmc/openbmc/wik=
i/GUI-Design-work-group</a></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Here is a link to the meeting notes:&nbsp;<a href=3D"http=
s://github.com/openbmc/openbmc/wiki/GUI-Design-work-group#100919">https://g=
ithub.com/openbmc/openbmc/wiki/GUI-Design-work-group#100919</a></div>
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
pt" ><div dir=3D"ltr" ><div style=3D"font-size: 12pt; font-weight: bold; fo=
nt-family: sans-serif; color: #7C7C5F;" ><div dir=3D"ltr" ><div style=3D"ou=
tline: none; font-size: 12pt; font-weight: bold; font-family: sans-serif;" =
><div dir=3D"ltr" style=3D"font-family:Lucida Sans Unicode, Lucida Grande, =
sans-serif;font-size:10pt" ><div dir=3D"ltr" >&nbsp;</div></div></div></div=
></div></div></div></div></div></div></div></div></div></div></div></div></=
div></div>
<div dir=3D"ltr" >&nbsp;</div></div><BR>

