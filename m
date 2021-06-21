Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D443AE3AA
	for <lists+openbmc@lfdr.de>; Mon, 21 Jun 2021 09:05:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7gXr4Kkqz2yXt
	for <lists+openbmc@lfdr.de>; Mon, 21 Jun 2021 17:05:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ICG9U/d9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=in.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=rameshi1@in.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ICG9U/d9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7gXW3tx7z2y6B
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jun 2021 17:05:30 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15L74jcw176411
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jun 2021 03:05:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : subject :
 from : to : cc : date : references : mime-version :
 content-transfer-encoding : content-type : message-id; s=pp1;
 bh=eRGneDYkheeVGRHah1uSmZZbB3sQcsJ387T2JAit69E=;
 b=ICG9U/d9siEZJhVkTEocIlEBJq/+9vnD4nEhL0orKNmSuMuSiOs4vtrSFh+JcZmqa8gj
 sZT34uUwjYgktz8+7uHR9W/B5wTE/ffEM9pVURMD/nZDWmS9+Lwf+wT4xdTUe04cg+Zl
 oNsQWBu+5p3P4v/Hx+iop4FQuKxMynxPDjgZEwf6RuoCGyr0BQbjZyLYe0y3VIkMOUH0
 cxHQfKX24HR0vgInsornrdbcQfA/4ctZJzEPLKW5JErNNc2W9HAB2Ka8atJDOdsgVwAs
 ZhRlOep86PmwsPKAQLv66ttDkCNmrPk0EdUC0xmN6Tbf6A6yDaaZ5SzkHRSDsZa0rsj8 pg== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.74])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39an309p2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jun 2021 03:05:27 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <rameshi1@in.ibm.com>;
 Mon, 21 Jun 2021 07:03:26 -0000
Received: from us1a3-smtp06.a3.dal06.isc4sb.com (10.146.103.243)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 21 Jun 2021 07:03:25 -0000
Received: from us1a3-mail156.a3.dal06.isc4sb.com ([10.146.71.156])
 by us1a3-smtp06.a3.dal06.isc4sb.com
 with ESMTP id 2021062107032415-73236 ;
 Mon, 21 Jun 2021 07:03:24 +0000 
In-Reply-To: 
Subject: Request for a new repository to enable Hardware Isolation (Guard)
From: "Ramesh I I1" <rameshi1@in.ibm.com>
To: bradleyb@fuzziesquirrel.com, openbmc@lists.ozlabs.org
Date: Mon, 21 Jun 2021 07:03:23 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1661 | IBM Domino Build
 SCN1812108_20180501T0841_FP130 January 13, 2021 at 14:04
X-LLNOutbound: False
X-Disclaimed: 11575
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 21062107-3165-0000-0000-0000063A3CD1
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0; SC=0;
 ST=0; TS=0; UL=0; ISC=; MB=0.205122
X-IBM-SpamModules-Versions: BY=3.00015385; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000296; SDB=6.01561896; UDB=6.00849896; IPR=6.01347487; 
 MB=3.00037311; MTD=3.00000008; XFM=3.00000015; UTC=2021-06-21 07:03:25
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2021-03-25 10:36:54 - 6.00012377
x-cbparentid: 21062107-3166-0000-0000-0000CEA76D29
Message-Id: <OF0B7576D3.50AAC9BF-ON002586FB.002424E5-002586FB.0026C362@notes.na.collabserv.com>
X-Proofpoint-ORIG-GUID: uhA5HguutiSeSNBy9VOwqDf8Z5cxkGPs
X-Proofpoint-GUID: uhA5HguutiSeSNBy9VOwqDf8Z5cxkGPs
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-21_02:2021-06-20,
 2021-06-21 signatures=0
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
Cc: edtanous@google.com, Dhruvaraj Subhashchandran <dhruvaraj@in.ibm.com>,
 Jayanth Othayoth <ojayanth@in.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Times Ne=
w Roman, Times, serif;font-size:10pt" ><div dir=3D"ltr" ><meta charset=3D"u=
tf-8" ><p style=3D"color: rgb(14, 16, 26); background: transparent; margin-=
top:0pt; margin-bottom:0pt;" >Hi All,&nbsp;</p>
<div style=3D"color: rgb(14, 16, 26); background: transparent; margin-top: =
0pt; margin-bottom: 0pt;" >&nbsp;</div>
<p style=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(14, 16, 26); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >Recently a design document [</span><a class=3D"editor-rtfLink" href=
=3D"https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/27804" style=3D"col=
or: rgb(14, 16, 26); background: transparent; margin-top:0pt; margin-bottom=
:0pt;; color: #4a6ee0;" target=3D"=5Fblank" ><span data-preserver-spaces=3D=
"true" style=3D"color: rgb(14, 16, 26); background: transparent; margin-top=
:0pt; margin-bottom:0pt;; color: #4a6ee0;" >https://gerrit.openbmc-project.=
xyz/c/openbmc/docs/+/27804</span></a><span data-preserver-spaces=3D"true" s=
tyle=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt; ma=
rgin-bottom:0pt;;" >] merged to enable the hardware isolation (guard) and i=
t requires a new daemon inside BMC&nbsp;to implement below dbus interfaces.=
&nbsp;</span></p>
<p style=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" >&nbsp;</p>
<p style=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(14, 16, 26); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >DBus Interfaces:</span></p>
<p style=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" >-&nbsp;<a class=3D"editor-rtfLink" href=3D"https://g=
errit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/43532" style=
=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt; margin=
-bottom:0pt;; color: #4a6ee0;" target=3D"=5Fblank" ><span data-preserver-sp=
aces=3D"true" style=3D"color: rgb(14, 16, 26); background: transparent; mar=
gin-top:0pt; margin-bottom:0pt;; color: #4a6ee0;" >https://gerrit.openbmc-p=
roject.xyz/c/openbmc/phosphor-dbus-interfaces/+/43532</span></a></p>
<p style=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" >-&nbsp;<a class=3D"editor-rtfLink" href=3D"https://g=
errit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/43533" style=
=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt; margin=
-bottom:0pt;; color: #4a6ee0;" target=3D"=5Fblank" ><span data-preserver-sp=
aces=3D"true" style=3D"color: rgb(14, 16, 26); background: transparent; mar=
gin-top:0pt; margin-bottom:0pt;; color: #4a6ee0;" >https://gerrit.openbmc-p=
roject.xyz/c/openbmc/phosphor-dbus-interfaces/+/43533</span></a></p>
<div style=3D"color: rgb(14, 16, 26); background: transparent; margin-top: =
0pt; margin-bottom: 0pt;" >-&nbsp;<a href=3D"https://gerrit.openbmc-project=
.xyz/c/openbmc/phosphor-dbus-interfaces/+/44229" >https://gerrit.openbmc-pr=
oject.xyz/c/openbmc/phosphor-dbus-interfaces/+/44229</a></div>
<p style=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(14, 16, 26); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >&nbsp;</span></p>
<p style=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(14, 16, 26); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >The above dbus interface implementation will be host architecture-spe=
cific because of the below reasons.&nbsp;</span></p>
<p style=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(14, 16, 26); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >&nbsp;</span></p>
<p style=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(14, 16, 26); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >- The daemon will create a record (a format used in the OpenPOWER pro=
ject for isolating hardware) into a partition (which is accessible between =
BMC and host applications in OpenPOWER based systems) and the daemon will c=
reate a dbus entry for the same record.</span></p>
<p style=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" >&nbsp;</p>
<p style=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(14, 16, 26); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >- Similarly, the OpenPOWER based host applications will create a reco=
rd into a partition and the daemon will create a dbus entry for the same re=
cord.</span></p>
<p style=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(14, 16, 26); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >&nbsp;</span></p>
<p style=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(14, 16, 26); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >The end goal is, exchanging the isolated hardware details from intern=
al interfaces (dbus entry) to external interfaces (redfish log entry).</spa=
n></p>
<p style=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(14, 16, 26); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >&nbsp;</span></p>
<p style=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(14, 16, 26); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >I had two thoughts about the dbus implementation.</span></p>
<p style=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(14, 16, 26); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >&nbsp;</span></p>
<p style=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(14, 16, 26); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >Option1:</span></p>
<p style=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(14, 16, 26); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >&nbsp;</span></p>
<p style=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(14, 16, 26); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >"New generic daemon" with an extension like how phosphor-logging or p=
hosphor-debug-collector or pldm providing a way to add OEM code.</span></p>
<p style=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(14, 16, 26); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >&nbsp;- Default case nothing will be there, because we (IBM) are not =
providing any support through standard host interfaces to isolate hardware.=
&nbsp;</span></p>
<p style=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(14, 16, 26); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >&nbsp;- The extension will have OEM-specific implementation.</span></=
p>
<p style=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(14, 16, 26); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >&nbsp;</span></p>
<p style=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(14, 16, 26); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >Option2:</span></p>
<p style=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(14, 16, 26); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >"New OEM daemon" so, implementation will be OEM specific and platform=
 can get from them respective bitbake meta-layer.</span></p>
<p style=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(14, 16, 26); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >&nbsp;</span></p>
<p style=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(14, 16, 26); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >For Option1, I am wondering about the following scenario.</span></p>
<p style=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(14, 16, 26); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >- If the BMC application (bmcweb) using a generic internal interface =
(dbus) but, the implementation is OEM specific then, the different system p=
latforms will get a response like "Interface/ObjectPath Not Found" so, the =
respective redfish URI (which will be used to do create|list) will fail, ri=
ght?</span></p>
<p style=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(14, 16, 26); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >- I also heard like the openBMC community nowadays not encouraging th=
e extension approach into a generic repository for some reason unless there=
 is a valid reason.</span></p>
<p style=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(14, 16, 26); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >&nbsp;</span></p>
<p style=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(14, 16, 26); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >For Option2,&nbsp;</span></p>
<p style=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(14, 16, 26); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >- I think bmcweb providing a configuration option (ibm-management-con=
sole) to use IBM implementation so the new OEM daemon interfaces can be use=
d as OEM code inside the bmcweb so, that we can avoid the above problem fro=
m an external interface user perspective for different system platforms.</s=
pan></p>
<p style=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(14, 16, 26); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >&nbsp;</span></p>
<p style=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(14, 16, 26); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >The question is, Where I can implement the new daemon? New repository=
 or any other existing repository?</span></p>
<div style=3D"color: rgb(14, 16, 26); background: transparent; margin-top: =
0pt; margin-bottom: 0pt;" >&nbsp;</div>
<p style=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(14, 16, 26); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >If New repository means phosphor-hw-isolation (with extension) or ope=
npower-hw-isolation?</span></p>
<p style=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" >&nbsp;</p>
<p style=3D"color: rgb(14, 16, 26); background: transparent; margin-top:0pt=
; margin-bottom:0pt;" ><span data-preserver-spaces=3D"true" style=3D"color:=
 rgb(14, 16, 26); background: transparent; margin-top:0pt; margin-bottom:0p=
t;;" >Any different thoughts or suggestions on the above proposal?</span></=
p></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"fo=
nt-family:Arial, Helvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" ><=
div style=3D"font-size: 12pt; font-weight: bold; font-family: sans-serif; c=
olor: #7C7C5F;" ><span style=3D"font-size:10pt;" >Regards,&nbsp;</span></di=
v>
<div style=3D"font-size: 12pt; font-weight: bold; font-family: sans-serif; =
color: #7C7C5F;" ><span style=3D"font-size:10pt;" >Ramesh I</span></div>
<div style=3D"font-size: 10pt; font-weight: bold; font-family: sans-serif;"=
 ><span style=3D"font-size:10pt;" >OpenBMC Developer</span></div>
<div style=3D"font-size: 8pt; font-family: sans-serif; margin-top: 10px;" >=
<div><span style=3D"font-weight: bold; color: #336699;" >Slack:</span> @ram=
eshi1</div>
<div><span style=3D"font-weight: bold; color: #336699;" >Discord:</span> &n=
bsp;@Ramesh I</div>
<div><span style=3D"font-weight: bold; color: #336699;" >E-mail: </span><a =
href=3D"mailto:rameshi1@in.ibm.com" style=3D"color: #555" >rameshi1@in.ibm.=
com</a></div></div></div></div></div></div><BR>

