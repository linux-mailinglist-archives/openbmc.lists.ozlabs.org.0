Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2912F145E94
	for <lists+openbmc@lfdr.de>; Wed, 22 Jan 2020 23:28:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4830RP6Lr6zDqTW
	for <lists+openbmc@lfdr.de>; Thu, 23 Jan 2020 09:28:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nicoleconser@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4830QZ0w3yzDqR0
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jan 2020 09:27:32 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00MMRPn7116322
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jan 2020 17:27:30 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.113])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xp945j14h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jan 2020 17:27:29 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <nicoleconser@ibm.com>;
 Wed, 22 Jan 2020 22:27:29 -0000
Received: from us1b3-smtp05.a3dr.sjc01.isc4sb.com (10.122.203.183)
 by smtp.notes.na.collabserv.com (10.122.47.56) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 22 Jan 2020 22:27:27 -0000
Received: from us1b3-mail229.a3dr.sjc03.isc4sb.com ([10.168.214.166])
 by us1b3-smtp05.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020012222272759-879354 ;
 Wed, 22 Jan 2020 22:27:27 +0000 
In-Reply-To: 
Subject: Today's UI Design Workgroup - meeting highlights
From: "Nicole Conser1" <nicoleconser@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Wed, 22 Jan 2020 22:27:27 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1661 | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-KeepSent: D778474B:33EE9B97-002584F7:007A4DE8;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 60627
X-TNEFEvaluated: 1
Content-Type: multipart/related; boundary="=_related 007B5D18002584F7_="
x-cbid: 20012222-7691-0000-0000-0000014EDC74
X-IBM-SpamModules-Scores: BY=0.208735; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.390428; ST=0; TS=0; UL=0; ISC=; MB=0.167347
X-IBM-SpamModules-Versions: BY=3.00012434; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01323003; UDB=6.00703971; IPR=6.01105335; 
 MB=3.00030441; MTD=3.00000008; XFM=3.00000015; UTC=2020-01-22 22:27:28
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-01-22 21:27:48 - 6.00010917
x-cbparentid: 20012222-7692-0000-0000-0000182311A3
Message-Id: <OFD778474B.33EE9B97-ON002584F7.007A4DE8-002584F7.007B5D1B@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-22_08:2020-01-22,
 2020-01-22 signatures=0
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


--=_related 007B5D18002584F7_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:9pt" ><div class=3D"socmaildefaultfont" dir=
=3D"ltr" style=3D"font-family:Arial, Helvetica, sans-serif;font-size:9pt" >=
<div dir=3D"ltr" >Thanks to all who attended and participated!&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Full notes at&nbsp;<a href=3D"https://github.com/openbmc/=
openbmc/wiki/GUI-Design-work-group" >https://github.com/openbmc/openbmc/wik=
i/GUI-Design-work-group</a>.&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >(1) User Profile Settings (shared by IBM)<br>- Reviewed p=
rototype: <a href=3D"https://ibm.invisionapp.com/share/Q6NZ13M3A5B#/screens=
/319377577" >https://ibm.invisionapp.com/share/Q6NZ13M3A5B#/screens/3193775=
77</a>&nbsp;</div>
<div dir=3D"ltr" >- This is the last change being made within the Angular U=
I</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >(2) Style Guide (shared by IBM)<br>-&nbsp;<a href=3D"http=
s://ibm.invisionapp.com/share/QANZHJKP74E" >https://ibm.invisionapp.com/sha=
re/QANZHJKP74E</a><br>- Discussed elements of style guide that will be over=
rideable (via Bootstrap theming) in order to accommodate customer preferenc=
es: colors, typography, rounded buttons, rounded modals...<br>- Goal is to =
build with minimal customization first&nbsp;to make theming easier later<br=
>-&nbsp;Updated header buttons with Intel proposed icon changes for health =
and power states<br>- Discussed header length, how to accommodate various&n=
bsp;logo dimensions, length of&nbsp;collapsible navigation menu, yellow war=
ning icon in status icons</div>
<div dir=3D"ltr" ><br>(3) Vue repo<br>- IBM is currently migrating changes =
from the Vue prototype to the new repo:&nbsp;<a href=3D"https://github.com/=
openbmc/webui-vue" >https://github.com/openbmc/webui-vue</a><br>- Will be b=
uilding out documentation with the new repo<br>- Intel likely to&nbsp;move =
to Vue&nbsp;<br>- Discussed Angular-to-Vue timeline (shooting for June 2020=
, including adding language translation &amp; Redfish adoption)<br><br>(4) =
Action items<br>- Add timeline/roadmap to Wiki + next workgroup meeting age=
nda<br>- Work&nbsp;on a recipe for the new Vue application<br>- Create logo=
 dimension guidelines + add to project documentation<br>- Consider how to h=
andle logos that do not meet these guidelines<br>- Consider adding =E2=80=
=9Cusername=E2=80=9D somewhere in UI&nbsp;</div>
<div dir=3D"ltr" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"fo=
nt-family:Arial, Helvetica, sans-serif;font-size:10.5pt" ><div class=3D"soc=
maildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, Helvetica, sans-se=
rif;font-size:10.5pt" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=
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
pt" ><div dir=3D"ltr" style=3D"font-size: 12pt; font-weight: bold; font-fam=
ily: sans-serif; color: #7C7C5F;" >&nbsp;</div>
<div dir=3D"ltr" style=3D"font-size: 8pt; font-family: sans-serif; margin-t=
op: 10px;" ><div><div><span style=3D"font-size:0.857em;" ><span style=3D"ou=
tline: none;" ><b>Nicole Conser</b>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbs=
p;</span><br style=3D"outline: none;" ><span style=3D"outline: none;" >UXD&=
nbsp;Researcher, Cognitive Systems</span></span></div>
<div><span style=3D"font-size:0.857em;" ><span style=3D"outline: none;" >IB=
M&nbsp;<strong style=3D"font-weight: normal; outline: none;" >Design</stron=
g>&nbsp;Studios&nbsp;|&nbsp;Austin</span></span></div>
<div>&nbsp;</div>
<div><div><span style=3D"font-size:0.857em;" ><span style=3D"outline: none;=
" ><strong>E</strong>: nicoleconser@ibm.com</span></span></div>
<div><span style=3D"font-size:0.857em;" ><span style=3D"outline: none;" ><s=
trong>C</strong>: 512.988.8632</span></span></div>
<div>&nbsp;</div>
<div><img src=3D"cid:15797024303722" ></div></div></div></div></div></div><=
/div></div></div></div></div></div></div></div></div></div>
<BR>

--=_related 007B5D18002584F7_=
Content-Type: image/png; name="Image.15797024303722.png"
Content-Disposition: inline; filename="Image.15797024303722.png"
Content-ID: <15797024303722>
Content-Transfer-Encoding: base64

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


--=_related 007B5D18002584F7_=--

