Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D84C0104604
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 22:47:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JGWp39bvzDqvV
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2019 08:47:50 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JGW26mLjzDqkc
 for <openbmc@lists.ozlabs.org>; Thu, 21 Nov 2019 08:47:09 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAKLh1VW070478
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 16:47:06 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.66])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wcf57ya7q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 16:47:06 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Wed, 20 Nov 2019 21:47:05 -0000
Received: from us1a3-smtp07.a3.dal06.isc4sb.com (10.146.103.14)
 by smtp.notes.na.collabserv.com (10.106.227.127) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 20 Nov 2019 21:47:02 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp07.a3.dal06.isc4sb.com
 with ESMTP id 2019112021470208-911975 ;
 Wed, 20 Nov 2019 21:47:02 +0000 
In-Reply-To: 
Subject: GUI Component Library
From: "Derick Montague" <Derick.Montague@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Wed, 20 Nov 2019 21:47:02 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1661 | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-LLNOutbound: False
X-Disclaimed: 9039
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 19112021-4409-0000-0000-00000135539D
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40304; ST=0; TS=0; UL=0; ISC=; MB=0.187966
X-IBM-SpamModules-Versions: BY=3.00012141; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01293002; UDB=6.00686032; IPR=6.01075225; 
 MB=3.00029634; MTD=3.00000008; XFM=3.00000015; UTC=2019-11-20 21:47:03
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-11-20 19:54:16 - 6.00010671
x-cbparentid: 19112021-4410-0000-0000-00003D187DA1
Message-Id: <OFB18B5F53.53F0FFF0-ON002584B8.0061F151-002584B8.0077A99B@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-20_07:2019-11-20,2019-11-20 signatures=0
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
ans Unicode, Lucida Grande, sans-serif;font-size:10pt" ><div class=3D"socma=
ildefaultfont" dir=3D"ltr" style=3D"font-family:Lucida Sans Unicode, Lucida=
 Grande, sans-serif;font-size:10pt" ><div dir=3D"ltr" style=3D"font-family:=
Lucida Sans Unicode, Lucida Grande, sans-serif;font-size:10pt" ><div dir=3D=
"ltr" style=3D"font-family:Lucida Sans Unicode, Lucida Grande, sans-serif;f=
ont-size:10pt" ><div dir=3D"ltr" style=3D"font-family:Lucida Sans Unicode, =
Lucida Grande, sans-serif;font-size:10pt" ><div dir=3D"ltr" style=3D"font-f=
amily:Lucida Sans Unicode, Lucida Grande, sans-serif;font-size:10pt" ><div =
dir=3D"ltr" style=3D"font-family:Lucida Sans Unicode, Lucida Grande, sans-s=
erif;font-size:10pt" ><div dir=3D"ltr" style=3D"font-family:Lucida Sans Uni=
code, Lucida Grande, sans-serif;font-size:10pt" ><div dir=3D"ltr" ><meta ch=
arset=3D"utf-8" ><p style=3D"color: rgb(28, 30, 41); background: transparen=
t; margin-top:0pt; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true=
" style=3D"color: rgb(28, 30, 41); background: transparent; margin-top:0pt;=
 margin-bottom:0pt;;" >We are working to compromise on a component library =
as we move towards a change to the GUI front-end framework. As discussed in=
 previous emails to the list, we are planning on updating the BMC UI to use=
 Vue. It is currently written using AngularJS, which will reach the end of =
its lifecycle on June 30, 2021.&nbsp;</span></p>
<p style=3D"color: rgb(28, 30, 41); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" >&nbsp;</p>
<p style=3D"color: rgb(28, 30, 41); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(28, 30, 41); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >With this update, we are looking to select a component library that a=
llows the GUI design/development team and any contributors to focus more on=
 feature work and less on base-level components. IBM has proposed using the=
 Carbon Design System. Carbon is an open-source library backed by IBM. We a=
re advocating for this library for the following reasons.</span></p>
<p style=3D"color: rgb(28, 30, 41); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" >&nbsp;</p>
<p style=3D"color: rgb(28, 30, 41); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(28, 30, 41); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >1. Has an open-source community of Designers and Developers supportin=
g the library</span></p>
<p style=3D"color: rgb(28, 30, 41); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" >&nbsp;</p>
<p style=3D"color: rgb(28, 30, 41); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(28, 30, 41); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >2. It is built with a user-centered approach that utilizes Design Thi=
nking processes that include user testing and heuristic evaluation</span></=
p>
<p style=3D"color: rgb(28, 30, 41); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" >&nbsp;</p>
<p style=3D"color: rgb(28, 30, 41); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(28, 30, 41); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >3. It is compliant with the World Wide Web Consortium's (W3C) Web Con=
tent Accessibility Guidelines (WCAG).</span></p>
<p style=3D"color: rgb(28, 30, 41); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" >&nbsp;</p>
<p style=3D"color: rgb(28, 30, 41); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(28, 30, 41); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >4. The framework can be themed to meet the branding needs of other co=
mmunity members.</span></p>
<p style=3D"color: rgb(28, 30, 41); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" >&nbsp;</p>
<p style=3D"color: rgb(28, 30, 41); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(28, 30, 41); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >5. We agreed to and are using Carbon Design System icons</span></p>
<p style=3D"color: rgb(28, 30, 41); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" >&nbsp;</p>
<p style=3D"color: rgb(28, 30, 41); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(28, 30, 41); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >6. We are creating custom components using Carbon Design System patte=
rns, e.g. LocaL User Management table. Using the Carbon Design System would=
 allow us to bring in elements without the need to re-design or develop a n=
ew custom component in Vue.</span></p>
<p style=3D"color: rgb(28, 30, 41); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" >&nbsp;</p>
<p style=3D"color: rgb(28, 30, 41); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(28, 30, 41); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >We are looking to discuss the use of other libraries and should choos=
e one library. Using more than one library will add complexity with keeping=
 all the utilized libraries up to date, create additional work to customize=
 the library components to have the same look and feel, and could create co=
nfusion determining with components are being used</span></p>
<p style=3D"color: rgb(28, 30, 41); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(28, 30, 41); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >from which library resulting in a lack of consistency within the appl=
ication. None of the 3rd party libraries will likely meet all of our needs =
so when we are evaluating component libraries some of the criteria that nee=
d to be met includes:</span></p>
<p style=3D"color: rgb(28, 30, 41); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" >&nbsp;</p>
<p style=3D"color: rgb(28, 30, 41); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(28, 30, 41); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >1. Ability to create and use different themes</span></p>
<p style=3D"color: rgb(28, 30, 41); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" >&nbsp;</p>
<p style=3D"color: rgb(28, 30, 41); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(28, 30, 41); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >2. Components have been tested and meet the W3C Web Content Accessibi=
lity Guidelines principles</span></p>
<p style=3D"color: rgb(28, 30, 41); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(28, 30, 41); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >of Perceivable, Operable, Understandable, and Robust</span></p>
<p style=3D"color: rgb(28, 30, 41); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><a class=3D"=5Fe75a791d-denali-editor-page-rtfLink" =
href=3D"https://www.w3.org/WAI/fundamentals/accessibility-principles/" styl=
e=3D"color: rgb(28, 30, 41); background: transparent; margin-top:0pt; margi=
n-bottom:0pt;; color: #4a6ee0;" target=3D"=5Fblank" ><span data-preserver-s=
paces=3D"true" style=3D"color: rgb(28, 30, 41); background: transparent; ma=
rgin-top:0pt; margin-bottom:0pt;; color: #4a6ee0;" >https://www.w3.org/WAI/=
fundamentals/accessibility-principles/</span></a></p>
<p style=3D"color: rgb(28, 30, 41); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" >&nbsp;</p>
<p style=3D"color: rgb(28, 30, 41); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(28, 30, 41); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >3. Open-source with an active community</span></p>
<p style=3D"color: rgb(28, 30, 41); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" >&nbsp;</p></div></div></div></div></div></div></div>=
</div></div><BR>

