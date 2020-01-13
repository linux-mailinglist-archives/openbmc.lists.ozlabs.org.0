Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B68C2139CF7
	for <lists+openbmc@lfdr.de>; Mon, 13 Jan 2020 23:53:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xTQc2WvGzDq7F
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 09:53:28 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xTPZ4sFtzDqHK
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jan 2020 09:52:30 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00DMlgCt134028
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jan 2020 17:52:28 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.119])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xfvrjcvcj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jan 2020 17:52:28 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <nicoleconser@ibm.com>;
 Mon, 13 Jan 2020 22:52:27 -0000
Received: from us1b3-smtp03.a3dr.sjc01.isc4sb.com (10.122.7.173)
 by smtp.notes.na.collabserv.com (10.122.182.123) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 13 Jan 2020 22:52:23 -0000
Received: from us1b3-mail229.a3dr.sjc03.isc4sb.com ([10.168.214.166])
 by us1b3-smtp03.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020011322522298-852994 ;
 Mon, 13 Jan 2020 22:52:22 +0000 
In-Reply-To: <OF54B7FA9A.2E44CC83-ON002584EE.0059BF0A-002584EE.005BC27D@notes.na.collabserv.com>
From: "Nicole Conser1" <nicoleconser@ibm.com>
To: "Derick Montague" <Derick.Montague@ibm.com>
Date: Mon, 13 Jan 2020 22:52:22 +0000
Sensitivity: 
MIME-Version: 1.0
References: <OF54B7FA9A.2E44CC83-ON002584EE.0059BF0A-002584EE.005BC27D@notes.na.collabserv.com>,
 <FD0BD680739BFC41807C96BD23118BB1327E11@ORSMSX113.amr.corp.intel.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1661 | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-KeepSent: E45681CD:FD509B52-002584EE:007D0D63;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 65467
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 20011322-3975-0000-0000-00000186F221
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.407427; ST=0; TS=0; UL=0; ISC=; MB=0.231607
X-IBM-SpamModules-Versions: BY=3.00012380; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01318713; UDB=6.00701414; IPR=6.01101042; 
 MB=3.00030302; MTD=3.00000008; XFM=3.00000015; UTC=2020-01-13 22:52:26
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-01-13 19:52:55 - 6.00010882
x-cbparentid: 20011322-3976-0000-0000-000034FA14A3
Message-Id: <OFE45681CD.FD509B52-ON002584EE.007D0D63-002584EE.007DA532@notes.na.collabserv.com>
Subject: Re:  GUI design for profile page
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-13_07:2020-01-13,
 2020-01-13 signatures=0
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
Cc: openbmc@lists.ozlabs.org, ryanarnellibm@gmail.com,
 kathryn.elainex.pine@intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:9pt" ><div dir=3D"ltr" >+1 =E2=80=94&nbsp;th=
anks for your feedback, Kathy!</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >As Derick mentioned, we are beginning user testing on thi=
s this week.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >We'll be sure to&nbsp;design the test questions to addres=
s each of these concerns, and I'll respond to this thread with our findings=
.&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Best,&nbsp;</div>
<div dir=3D"ltr" >Nicole&nbsp;</div>
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
op: 10px;" ><div><span style=3D"font-size:0.857em;" ><span style=3D"outline=
: none;" ><b>Nicole Conser</b>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</s=
pan><br style=3D"outline: none;" ><span style=3D"outline: none;" >UXD&nbsp;=
Researcher, Cognitive Systems</span></span></div>
<div><span style=3D"font-size:0.857em;" ><span style=3D"outline: none;" >IB=
M&nbsp;<strong style=3D"font-weight: normal; outline: none;" >Design</stron=
g>&nbsp;Studios&nbsp;|&nbsp;Austin</span></span></div>
<div>&nbsp;</div>
<div><div><span style=3D"font-size:0.857em;" ><span style=3D"outline: none;=
" ><strong>E</strong>: nicoleconser@ibm.com</span></span></div>
<div><span style=3D"font-size:0.857em;" ><span style=3D"outline: none;" ><s=
trong>C</strong>: 512.988.8632</span></span></div></div></div></div></div><=
/div></div></div></div></div></div></div></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: "Derick Montague" =
&lt;Derick.Montague@ibm.com&gt;<br>Sent by: "openbmc" &lt;openbmc-bounces+n=
icoleconser=3Dibm.com@lists.ozlabs.org&gt;<br>To: kathryn.elainex.pine@inte=
l.com<br>Cc: openbmc@lists.ozlabs.org, ryanarnellibm@gmail.com<br>Subject: =
[EXTERNAL] GUI design for profile page<br>Date: Mon, Jan 13, 2020 10:43 AM<=
br>&nbsp;
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >&nbsp;<br>Thank you for your feedback, Kathy!<br><br>&gt; 1. What was =
the reasoning for making this a separate page instead of putting this on th=
e existing local users page?<br><br>A profile page is a common pattern that=
 users are accustomed to. The local user management is a page that admin us=
ers of the BMC are accustomed to and the admin user is the only user type w=
ith access to this page. Having different information on the local user man=
agement page based on user type seems less intuitive than providing a profi=
le page. We will be user testing this.<br><br><br>&gt; 2. If it is a separa=
te page, I like that the page would be linked from a header icon, but it se=
ems like there should be access from the menu somehow as well. I wonder if =
it could be a link on the local users page for each user.<br><br>What probl=
em are we solving with this proposal? I don't feel that admin should have a=
ccess to a user's profile page. Any information they want to update for the=
 user, e.g. username, password, etc should be handled on the local user man=
agement page.<br><br>&gt; I can imagine that if control exists to change la=
nguage for a user, there could be a scenario where an admin user might want=
 to change the language for users when they set the user up, not requiring =
that user to log in in English (for example) and then find this page and ch=
ange the language themselves.<br><br><br>The login page will be displayed u=
sing the language set in the users operating system unless that language is=
 not supported, then it would display in English. Ed's use case that that t=
he use would want to update their language from the what they have set in t=
heir OS to English. We are contemplating having a language option on the lo=
gin page to allow the user to select at login.<br><br>Even if an admin set =
the users language, the login page won't know who that user is until they l=
ogin, so we did not consider that as a use case. We are going to be testing=
 different options with users.<br><br><br>&gt; If it is accessed from the l=
ocal users page, could it just be a modal on the page rather than a separat=
e page?<br><br>If we wanted the admin to be able to set the users language =
we would just add this to the available settings they could change for that=
 user. I personally don't think it adds too much value, but it would also b=
e simple to add to form to update the user info.<br>&nbsp;<br><br>&nbsp;<br=
><br>&nbsp;<br><br>&nbsp;<br><br>&nbsp;</font><br>&nbsp;</div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>

