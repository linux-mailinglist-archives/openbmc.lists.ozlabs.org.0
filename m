Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B86B41094E9
	for <lists+openbmc@lfdr.de>; Mon, 25 Nov 2019 22:04:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MKK30P5FzDqcY
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 08:04:07 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MKJD2rQvzDqV8
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 08:03:23 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAPKvJ34014970
 for <openbmc@lists.ozlabs.org>; Mon, 25 Nov 2019 16:03:19 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.66])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wfk6yu9f5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 25 Nov 2019 16:03:19 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Mon, 25 Nov 2019 21:03:18 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.127) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 25 Nov 2019 21:03:14 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2019112521031404-942894 ;
 Mon, 25 Nov 2019 21:03:14 +0000 
In-Reply-To: <FD0BD680739BFC41807C96BD23118BB131937A@ORSMSX113.amr.corp.intel.com>
Subject: RE: GUI Component Library
From: "Derick Montague" <Derick.Montague@ibm.com>
To: kathryn.elainex.pine@intel.com
Date: Mon, 25 Nov 2019 21:03:14 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <FD0BD680739BFC41807C96BD23118BB131937A@ORSMSX113.amr.corp.intel.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-LLNOutbound: False
X-Disclaimed: 26583
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 19112521-4409-0000-0000-000001406546
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.369042; ST=0; TS=0; UL=0; ISC=; MB=0.234392
X-IBM-SpamModules-Versions: BY=3.00012166; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01295362; UDB=6.00687447; IPR=6.01077603; 
 MB=3.00029704; MTD=3.00000008; XFM=3.00000015; UTC=2019-11-25 21:03:17
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-11-25 15:51:28 - 6.00010692
x-cbparentid: 19112521-4410-0000-0000-00003D289509
Message-Id: <OFBA22BA42.AE014E7E-ON002584BD.0071CE96-002584BD.0073A72B@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-25_05:2019-11-21,2019-11-25 signatures=0
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

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2"><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D""><div dir=3D=
"ltr" style=3D""><div style=3D"font-family: &quot;Lucida Sans Unicode&quot;=
, &quot;Lucida Grande&quot;, sans-serif; font-size: 10pt;">&gt; In terms of=
 a design library that matches the style of the web UI we=E2=80=99ve been w=
orking on, Bootstrap would be a great choice: <a href=3D"https://bootstrap-=
vue.js.org">https://bootstrap-vue.js.org</a> &nbsp;<br></div><div style=3D"=
font-family: &quot;Lucida Sans Unicode&quot;, &quot;Lucida Grande&quot;, sa=
ns-serif; font-size: 10pt;"><br></div><div style=3D""><font face=3D"Lucida =
Sans Unicode, Lucida Grande, sans-serif"><span style=3D"font-size: 13.3333p=
x;">We agree to use Bootstrap-Vue for the Vue framework rewrite. Bootstrap-=
Vue does not have an icon library and refers to third-party sources. Since =
we are already using the Carbon Design System icons, can we agree to contin=
ue to use them?</span></font><br></div><div style=3D""><font face=3D"Lucida=
 Sans Unicode, Lucida Grande, sans-serif"><span style=3D"font-size: 13.3333=
px;"><br></span></font></div><div style=3D"font-family: &quot;Lucida Sans U=
nicode&quot;, &quot;Lucida Grande&quot;, sans-serif; font-size: 10pt;">&gt;=
 However, I wonder if we could find a happy medium between the two styles? =
I=E2=80=99ve been looking for websites that have elements of both style pre=
ferences -- that include the more modern look (larger elements, rounded cor=
ners, light colors), with the more stable look (dark colors, square element=
s) =E2=80=93 and found these great examples:<br>&gt;<br>&gt;- Invision App=
=E2=80=99s website <a href=3D"https://www.invisionapp.com/">https://www.inv=
isionapp.com/</a><br>&gt;- Visual Studio Code website <a href=3D"https://co=
de.visualstudio.com/">https://code.visualstudio.com/</a><br>&gt;- GitHub we=
bsite <a href=3D"https://github.com/">https://github.com/</a>&nbsp;</div>
<div style=3D"font-family: &quot;Lucida Sans Unicode&quot;, &quot;Lucida Gr=
ande&quot;, sans-serif; font-size: 10pt;"><br>Thank you for sending the sit=
e examples. They are great examples of well-designed user interfaces. Altho=
ugh the proposed Intel UI updates provide some pattern improvements, the ov=
erall layout and design changes don't feel as polished as the examples you =
shared. We believe more collaboration is needed to improve the design and i=
mplementation of the proposed changes to meet both Intel's and IBM's needs.=
</div><div style=3D"font-family: &quot;Lucida Sans Unicode&quot;, &quot;Luc=
ida Grande&quot;, sans-serif; font-size: 10pt;"><span style=3D"font-size: 1=
0pt;"><br></span></div><div style=3D"font-family: &quot;Lucida Sans Unicode=
&quot;, &quot;Lucida Grande&quot;, sans-serif; font-size: 10pt;"><span styl=
e=3D"font-size: 10pt;">A little over a year ago, we developed an OpenBMC st=
yle guide to make it easier for designers and developers to contribute to t=
he project. We built a living style guide prototype, but Ed's concern about=
 who would develop and maintain the guide kept it from moving forward. The =
inconsistency and lack of code reuse throughout the application is the resu=
lt of not having this documentation.</span><br></div><div style=3D"font-fam=
ily: &quot;Lucida Sans Unicode&quot;, &quot;Lucida Grande&quot;, sans-serif=
; font-size: 10pt;"><br></div>
<div style=3D"font-family: &quot;Lucida Sans Unicode&quot;, &quot;Lucida Gr=
ande&quot;, sans-serif; font-size: 10pt;">OpenBMC Style Guide:&nbsp;<br><a =
href=3D"https://ibm.invisionapp.com/d/main#/console/15339466/318986393/prev=
iew">https://ibm.invisionapp.com/d/main#/console/15339466/318986393/preview=
</a></div><div style=3D"font-family: &quot;Lucida Sans Unicode&quot;, &quot=
;Lucida Grande&quot;, sans-serif; font-size: 10pt;"><br>OpenBMC Style Guide=
 Prototype:&nbsp;<br><a href=3D"https://derick-montague.github.io/openbmc-s=
tyleguide-proposal/">https://derick-montague.github.io/openbmc-styleguide-p=
roposal/</a>&nbsp;</div><div style=3D"font-family: &quot;Lucida Sans Unicod=
e&quot;, &quot;Lucida Grande&quot;, sans-serif; font-size: 10pt;"><br></div>
<div style=3D"font-family: &quot;Lucida Sans Unicode&quot;, &quot;Lucida Gr=
ande&quot;, sans-serif; font-size: 10pt;">As we rewrite the application in =
Vue, we have an opportunity to create this documentation and assure that th=
e OpenBMC UI is clean, maintainable, and adheres to an agreed-upon set of v=
alues. Since joining the project, you have been working alone on both desig=
n and development. We hope that we can work as a team to collaborate and le=
an on each other's strengths.&nbsp;</div><div style=3D"font-family: &quot;L=
ucida Sans Unicode&quot;, &quot;Lucida Grande&quot;, sans-serif; font-size:=
 10pt;"><br></div>
<div style=3D"font-family: &quot;Lucida Sans Unicode&quot;, &quot;Lucida Gr=
ande&quot;, sans-serif; font-size: 10pt;">I feel the next step is to schedu=
le a meeting to review the existing style guide. We can then determine what=
 needs to be updated to meet both Intel's and IBM's needs. We can use the u=
pdated style guide to create the theme changes required for the Bootstrap-V=
ue out of box experience to adhere to the updated style guide.</div><div st=
yle=3D"font-family: &quot;Lucida Sans Unicode&quot;, &quot;Lucida Grande&qu=
ot;, sans-serif; font-size: 10pt;"><br></div>
<div style=3D"font-family: &quot;Lucida Sans Unicode&quot;, &quot;Lucida Gr=
ande&quot;, sans-serif; font-size: 10pt;">This effort will require a strong=
er focus on the framework update and style guide development. When we start=
 working on the framework update, the only updates to the AngularJS UI will=
 be critical bug fixes. Our goal is to have the framework update complete n=
o later than the end of Q2 2020.</div><div style=3D"font-family: &quot;Luci=
da Sans Unicode&quot;, &quot;Lucida Grande&quot;, sans-serif; font-size: 10=
pt;"><br></div>
<div style=3D"font-family: &quot;Lucida Sans Unicode&quot;, &quot;Lucida Gr=
ande&quot;, sans-serif; font-size: 10pt;">What are your thoughts on this pl=
an?</div>
<div style=3D"font-family: &quot;Lucida Sans Unicode&quot;, &quot;Lucida Gr=
ande&quot;, sans-serif; font-size: 10pt;"><br>&nbsp;</div></div></div></fon=
t><BR>

