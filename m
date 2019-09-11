Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 903D5B01AD
	for <lists+openbmc@lfdr.de>; Wed, 11 Sep 2019 18:31:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T6q96crTzF3mF
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 02:31:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jen.spatz@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T5XG0Tm0zF3Pb
 for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2019 01:33:27 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8BFIXHK060945
 for <openbmc@lists.ozlabs.org>; Wed, 11 Sep 2019 11:33:24 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.74])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uy2vka276-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 11 Sep 2019 11:33:24 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Jen.Spatz@ibm.com>;
 Wed, 11 Sep 2019 15:33:23 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 11 Sep 2019 15:33:19 -0000
Received: from us1a3-mail223.a3.dal06.isc4sb.com ([10.146.103.137])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2019091115331945-693948 ;
 Wed, 11 Sep 2019 15:33:19 +0000 
In-Reply-To: 
Subject: 32 character minimum password requirement
From: "Jen Spatz" <Jen.Spatz@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Wed, 11 Sep 2019 15:33:19 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1619 | IBM Domino Build
 SCN1812108_20180501T0841_FP57 August 05, 2019 at 12:42
X-LLNOutbound: False
X-Disclaimed: 24787
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 19091115-3165-0000-0000-000000F8D80A
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.400847; ST=0; TS=0; UL=0; ISC=; MB=0.235563
X-IBM-SpamModules-Versions: BY=3.00011756; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000288; SDB=6.01259898; UDB=6.00665989; IPR=6.01041668; 
 MB=3.00028583; MTD=3.00000008; XFM=3.00000015; UTC=2019-09-11 15:33:21
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-09-11 09:52:17 - 6.00010394
x-cbparentid: 19091115-3166-0000-0000-00001C25F4CF
Message-Id: <OF4575BC9E.E8698D23-ON00258472.0051B8F2-00258472.005572A2@notes.na.collabserv.com>
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

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" ><p style=3D"margin:=
 0px; font-stretch: normal; font-size: 12px; line-height: normal; font-fami=
ly: &quot;Helvetica Neue&quot;;" >Hello all,</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height=
: normal; font-family: &quot;Helvetica Neue&quot;; min-height: 14px;" >&nbs=
p;</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height=
: normal; font-family: &quot;Helvetica Neue&quot;;" >We've created design m=
ockups for the 32&nbsp;character minimum password requirement in the Add/Mo=
dify&nbsp;modal.&nbsp;We=E2=80=99d appreciate&nbsp;your feedback.</p>
<div style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-heig=
ht: normal; font-family: &quot;Helvetica Neue&quot;;" >&nbsp;</div>
<div style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-heig=
ht: normal; font-family: &quot;Helvetica Neue&quot;;" >Context:&nbsp;<br>IP=
MI requires a password of 20 characters or less. But, some customers&nbsp;h=
ave a 32&nbsp;character minimum password required for ROOT accounts.</div>
<div style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-heig=
ht: normal; font-family: &quot;Helvetica Neue&quot;;" >&nbsp;</div>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height=
: normal; font-family: &quot;Helvetica Neue&quot;;" >Designs:</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height=
: normal; font-family: &quot;Helvetica Neue&quot;;" ><b>In "Add User" modal=
:</b><br>If user password exceeds 20 characters, validation text notifies t=
he admin/user that:</p>
<div style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-heig=
ht: normal; font-family: &quot;Helvetica Neue&quot;;" >&nbsp; &nbsp; &nbsp;=
1. their initial password is too long</div>
<div style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-heig=
ht: normal; font-family: &quot;Helvetica Neue&quot;;" >&nbsp; &nbsp; &nbsp;=
2. they will later have the opportunity to change their&nbsp;password to a =
longer length</div>
<div style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-heig=
ht: normal; font-family: &quot;Helvetica Neue&quot;;" >Prototype:&nbsp;<a h=
ref=3D"https://ibm.invisionapp.com/share/V2NZ99JW6DN" >Add&nbsp;User&nbsp;M=
odal</a></div>
<div style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-heig=
ht: normal; font-family: &quot;Helvetica Neue&quot;;" >&nbsp;</div>
<div style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-heig=
ht: normal; font-family: &quot;Helvetica Neue&quot;;" ><b>In "Modify User" =
modal</b><br>If user password is changed to a length of over 20 characters,=
 a warning notifies the admin/user that a password of 21 characters or more=
 will result in the user losing IPMI access</div>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height=
: normal; font-family: &quot;Helvetica Neue&quot;; color: rgb(220, 161, 13)=
;" ><span style=3D"color:#000000;" >Prototype:</span>&nbsp;<a href=3D"https=
://ibm.invisionapp.com/share/GANZ99GXPB7" >Modify&nbsp;User&nbsp;Modal</a><=
/p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height=
: normal; font-family: &quot;Helvetica Neue&quot;; min-height: 14px;" >&nbs=
p;</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height=
: normal; font-family: &quot;Helvetica Neue&quot;;" ><em>These particular p=
rototypes are not interactive.&nbsp;</em></p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height=
: normal; font-family: &quot;Helvetica Neue&quot;;" ><em>To comment, please=
 click on the bottom right of the screen where it says =E2=80=9CComments=E2=
=80=9D</em></p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height=
: normal; font-family: &quot;Helvetica Neue&quot;; min-height: 14px;" >&nbs=
p;</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height=
: normal; font-family: &quot;Helvetica Neue&quot;;" >Github Issue:</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height=
: normal; font-family: &quot;Helvetica Neue&quot;; color: rgb(220, 161, 13)=
;" ><a href=3D"https://github.com/openbmc/phosphor-webui/issues/93" >https:=
//github.com/openbmc/phosphor-webui/issues/93</a><br><br><span style=3D"col=
or:#000000;" >Thanks very much,</span></p>
<div style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-heig=
ht: normal; font-family: &quot;Helvetica Neue&quot;; color: rgb(220, 161, 1=
3);" ><span style=3D"color:#000000;" >Jen + GUI Design Team</span></div></d=
iv>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"fo=
nt-family:Arial, Helvetica, sans-serif;font-size:10pt" ><div class=3D"socma=
ildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, Helvetica, sans-seri=
f;font-size:10pt" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"f=
ont-family:Arial, Helvetica, sans-serif;font-size:10pt" ><div class=3D"socm=
aildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, Helvetica, sans-ser=
if;font-size:10pt" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"=
font-family:Arial, Helvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" =
style=3D"font-size: 12pt; font-weight: bold; font-family: sans-serif; color=
: #7C7C5F;" ><span style=3D"font-family:Arial,Helvetica,sans-serif;" ><span=
 style=3D"color:#000000;" ><span style=3D"font-size:10pt;" >Jen Spatz</span=
></span></span></div>
<div dir=3D"ltr" style=3D"font-size: 12pt; font-weight: bold; font-family: =
sans-serif; color: #7C7C5F;" ><span style=3D"font-family:Arial,Helvetica,sa=
ns-serif;" ><span style=3D"color:#000000;" ><span style=3D"font-size:8pt;" =
><strong>Design Research + UX Design</strong><br>Cognitive Systems</span></=
span><br><span style=3D"font-size:8pt;" ><a href=3D"mailto:jen.spatz@ibm.co=
m" style=3D"color: #555" ><span style=3D"color:#0000ff;" >jen.spatz@ibm.com=
</span></a></span></span></div></div></div></div></div></div></div></div><B=
R>

