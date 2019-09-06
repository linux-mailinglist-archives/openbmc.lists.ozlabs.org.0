Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6D4ABB66
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2019 16:52:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Q0sN1G7SzDr7N
	for <lists+openbmc@lfdr.de>; Sat,  7 Sep 2019 00:52:40 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Q0rS6YH2zDr7F
 for <openbmc@lists.ozlabs.org>; Sat,  7 Sep 2019 00:51:48 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x86EitjJ086439
 for <openbmc@lists.ozlabs.org>; Fri, 6 Sep 2019 10:51:44 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.81])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uusdm8j61-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 06 Sep 2019 10:51:44 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Fri, 6 Sep 2019 14:51:43 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 6 Sep 2019 14:51:42 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2019090614514150-609738 ;
 Fri, 6 Sep 2019 14:51:41 +0000 
In-Reply-To: 
Subject: Updating BMC GUI Front End Framework
From: "Derick Montague" <Derick.Montague@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Fri, 6 Sep 2019 14:51:39 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1619 | IBM Domino Build
 SCN1812108_20180501T0841_FP57 August 05, 2019 at 12:42
X-LLNOutbound: False
X-Disclaimed: 16103
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 19090614-3067-0000-0000-0000009FAD69
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.423878; ST=0; TS=0; UL=0; ISC=; MB=0.006426
X-IBM-SpamModules-Versions: BY=3.00011727; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01257560; UDB=6.00664543; IPR=6.01039254; 
 MB=3.00028506; MTD=3.00000008; XFM=3.00000015; UTC=2019-09-06 14:51:43
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-09-06 08:43:11 - 6.00010375
x-cbparentid: 19090614-3068-0000-0000-000011AED050
Message-Id: <OF4FF7F8E2.9E3777F1-ON0025846D.004E7B10-0025846D.0051A226@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-06_06:, , signatures=0
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
<div dir=3D"ltr" >We would like to start the discussion of migrating the BM=
C GUI off of AngularJS. The AngularJS long term support period is 3 years a=
nd started on 7/1/2018 and will end on 7/30/2021. You can read more about t=
his on the angular blog -&nbsp;<a href=3D"https://blog.angular.io/stable-an=
gularjs-and-long-term-support-7e077635ee9c" >https://blog.angular.io/stable=
-angularjs-and-long-term-support-7e077635ee9c</a>.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >The most likely options for migration are Angular, React,=
 and Vue. LogRocket has a decent comparison of the 3 frameworks -&nbsp;<a h=
ref=3D"https://blog.logrocket.com/angular-vs-react-vs-vue-a-performance-com=
parison/" >https://blog.logrocket.com/angular-vs-react-vs-vue-a-performance=
-comparison/</a>.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >There is also a really interesting framework called&nbsp;=
Svelte for building reactive apps that might be worth considering as well -=
&nbsp;<a href=3D"https://github.com/sveltejs/svelte" >https://github.com/sv=
eltejs/svelte</a></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >My first thought based on the size of the application, th=
e need for a smaller footprint, and the benefit of&nbsp;a small learning cu=
rve would be&nbsp;Vue. However, I'm just throwing that out there to start t=
he conversation.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Does anyone else have a preference&nbsp;on the next front=
 end framework?</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
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
>&nbsp;</div></div></div>
<div style=3D"font-size: 8pt; font-family: sans-serif; margin-top: 10px;" >=
<div>&nbsp;</div></div></div></div></div></div></div></div></div></div></di=
v></div></div></div></div></div><BR>

