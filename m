Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC5E232349
	for <lists+openbmc@lfdr.de>; Wed, 29 Jul 2020 19:19:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BH0dX3SDPzDqnn
	for <lists+openbmc@lfdr.de>; Thu, 30 Jul 2020 03:19:12 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BH0cT1t8rzDqkh
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jul 2020 03:18:13 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06TH4J66067543
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2020 13:18:10 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.74])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32jp1n1pu2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2020 13:18:10 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <nicoleconser@ibm.com>;
 Wed, 29 Jul 2020 17:18:10 -0000
Received: from us1a3-smtp07.a3.dal06.isc4sb.com (10.146.103.14)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 29 Jul 2020 17:18:08 -0000
Received: from us1a3-mail229.a3.dal06.isc4sb.com ([10.146.103.87])
 by us1a3-smtp07.a3.dal06.isc4sb.com
 with ESMTP id 2020072917180862-659069 ;
 Wed, 29 Jul 2020 17:18:08 +0000 
In-Reply-To: 
Subject: Sharing GUI designs for new functionality (hardware deconfiguration) 
From: "Nicole Conser1" <nicoleconser@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Wed, 29 Jul 2020 17:18:08 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1661 | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 43875
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 20072917-3165-0000-0000-0000040D78DB
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.423878; ST=0; TS=0; UL=0; ISC=; MB=0.225505
X-IBM-SpamModules-Versions: BY=3.00013558; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01412861; UDB=6.00757339; IPR=6.01195136; 
 MB=3.00033253; MTD=3.00000008; XFM=3.00000015; UTC=2020-07-29 17:18:09
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-07-29 10:27:58 - 6.00011658
x-cbparentid: 20072917-3166-0000-0000-00001ACD806C
Message-Id: <OF20E499BB.D082431D-ON002585B4.0052F32E-002585B4.005F0B44@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-29_10:2020-07-29,
 2020-07-29 signatures=0
X-Proofpoint-Spam-Reason: orgsafe
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
elvetica, sans-serif;font-size:9pt" ><div dir=3D"ltr" ><div>Hello all,&nbsp=
;</div>
<div><br>Sharing our progress on some new functionality coming to OpenBMC, =
related to hardware deconfiguration.&nbsp;</div>
<div>&nbsp;</div>
<div>We expect these GUI screens to primarily be used by Support, not custo=
mers.&nbsp;</div>
<div>&nbsp;</div>
<div>We are unaware of any other companies in the OpenBMC&nbsp;community&nb=
sp;who will use these GUI screens =E2=80=94&nbsp;but sharing in case there =
are, and you want to provide feedback.&nbsp;</div>
<div>&nbsp;</div>
<div>Please note that these are **early** iterations;&nbsp;these designs wi=
ll evolve as we continue to get end user feedback. They are also mostly sta=
tic (not coded/functional).&nbsp;</div>
<div>&nbsp;</div>
<div>(1) <strong>View&nbsp;Deconfiguration Records + associated error logs&=
nbsp;</strong><br>Invision prototype: <a href=3D"https://ibm.invisionapp.co=
m/share/YCO0A3H4ZK9#/screens/319620811" >https://ibm.invisionapp.com/share/=
YCO0A3H4ZK9#/screens/319620811</a></div>
<div>&nbsp;</div>
<div>(2) <strong>View&nbsp;configuration status of all deconfigurable&nbsp;=
hardware components</strong><br>Invision prototype: <a href=3D"https://ibm.=
invisionapp.com/share/GSO09BRX53E#/screens/319624831" >https://ibm.invision=
app.com/share/GSO09BRX53E#/screens/319624831</a></div>
<div>&nbsp;</div>
<div>(3) <strong>View&nbsp;configuration status of all deconfigurable&nbsp;=
hardware components &gt; Drilling deeper into Processor cores&nbsp;</strong=
><br>Invision prototype: <a href=3D"https://ibm.invisionapp.com/share/KCO09=
BS4Q87#/screens/319625473" >https://ibm.invisionapp.com/share/KCO09BS4Q87#/=
screens/319625473</a></div>
<div>&nbsp;</div>
<div>To navigate through the prototypes, click the left / right arrows.&nbs=
p;</div>
<div>&nbsp;</div>
<div>To leave feedback directly on the prototypes, click&nbsp;"Comments" on=
 the&nbsp;bottom-right of the screen or&nbsp;press&nbsp;C. Then, click on a=
 specific area.&nbsp;</div>
<div>&nbsp;</div>
<div>Gerrit doc for further reference:&nbsp;<a href=3D"https://gerrit.openb=
mc-project.xyz/c/openbmc/docs/+/27804/8/designs/guard=5Fon=5Fbmc.md#41" >ht=
tps://gerrit.openbmc-project.xyz/c/openbmc/docs/+/27804/8/designs/guard=5Fo=
n=5Fbmc.md#41</a>&nbsp;(guarded =3D deconfigured)&nbsp;</div>
<div><br>Thanks!&nbsp;<br>Nicole&nbsp;</div></div>
<div dir=3D"ltr" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"fo=
nt-family:Arial, Helvetica, sans-serif;font-size:10pt" ><div class=3D"socma=
ildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, Helvetica, sans-seri=
f;font-size:10pt" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"f=
ont-family:Arial, Helvetica, sans-serif;font-size:10pt" ><div class=3D"socm=
aildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, Helvetica, sans-ser=
if;font-size:10pt" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"=
font-family:Arial, Helvetica, sans-serif;font-size:10.5pt" ><div class=3D"s=
ocmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, Helvetica, sans-=
serif;font-size:10.5pt" ><div class=3D"socmaildefaultfont" dir=3D"ltr" styl=
e=3D"font-family:Arial, Helvetica, sans-serif;font-size:10.5pt" ><div class=
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
pan><br style=3D"outline: none;" ><span style=3D"outline: none;" >Design Re=
searcher, Cognitive Systems</span></span></div>
<div><span style=3D"font-size:0.857em;" ><span style=3D"outline: none;" >IB=
M | Austin</span></span></div>
<div>&nbsp;</div></div></div></div></div></div></div></div></div></div></di=
v></div></div></div></div></div></div><BR>

