Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DE83B4700
	for <lists+openbmc@lfdr.de>; Fri, 25 Jun 2021 17:53:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBM4J3hFDz3bwv
	for <lists+openbmc@lfdr.de>; Sat, 26 Jun 2021 01:53:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kJ6nSXgb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=in.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=rameshi1@in.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kJ6nSXgb; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GBM3z3ntLz301X
 for <openbmc@lists.ozlabs.org>; Sat, 26 Jun 2021 01:53:34 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15PFXfeF188610
 for <openbmc@lists.ozlabs.org>; Fri, 25 Jun 2021 11:53:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : subject :
 from : to : date : references : mime-version : content-transfer-encoding :
 content-type : message-id; s=pp1;
 bh=XtZhVHAFUVhcUdpGhzZE3iyLRovgmnitVxH8uwZam+g=;
 b=kJ6nSXgb/ioog52u9Qs9hbiiq2zBm9AvwZiaSTjsCKpQiVQ13aTtb0NAY+cqD5whW0+f
 VlXgzSPZvjjE1eZVkc4yMuLejC0adtdhU5w8KBsD6dX2Tx7NVbqeBaVi9cgzl/IMk7pI
 CxG0lY14m4PDV6BVQ4WRHRSmSJTK0l64rl2sIiuVJZNGEXp2eQ0F//fW4LyiiV3XkP1T
 FF9E4RjaukZF8LUFJb/KBDzI20jVjEWU0owyoke/zSVhNsOljHpWs/vNbPf3X4mmNpc1
 uiTmiiV5+7wgwHAobC5eHGEFnupzUbgz6TglwClDXgH7Vry89kVEfnFbj/md5xMbux3R Tg== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.82])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39dg9r5a98-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 25 Jun 2021 11:53:31 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <rameshi1@in.ibm.com>;
 Fri, 25 Jun 2021 15:53:30 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 25 Jun 2021 15:53:29 -0000
Received: from us1a3-mail156.a3.dal06.isc4sb.com ([10.146.71.156])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2021062515532922-409441 ;
 Fri, 25 Jun 2021 15:53:29 +0000 
In-Reply-To: 
Subject: Request for a new repository to enable Hardware Isolation (Guard)
From: "Ramesh I I1" <rameshi1@in.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Fri, 25 Jun 2021 15:53:28 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1661 | IBM Domino Build
 SCN1812108_20180501T0841_FP130 January 13, 2021 at 14:04
X-LLNOutbound: False
X-Disclaimed: 7003
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 21062515-9463-0000-0000-000005E82CA4
X-IBM-SpamModules-Scores: BY=0.030338; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0; ST=0; TS=0; UL=0; ISC=; MB=0.205122
X-IBM-SpamModules-Versions: BY=3.00015396; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000296; SDB=6.01565696; UDB=6.00838381; IPR=6.01351275; 
 MB=3.00037327; MTD=3.00000008; XFM=3.00000015; UTC=2021-06-25 15:53:29
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2021-03-25 10:44:38 - 6.00012377
x-cbparentid: 21062515-9464-0000-0000-000061BE3A8D
Message-Id: <OF85E3AFDB.E325A182-ON002586FF.00573D13-002586FF.00574B3B@notes.na.collabserv.com>
X-Proofpoint-GUID: x71H9FqNvXNyaY4ofjZrrvdnieB-coTe
X-Proofpoint-ORIG-GUID: x71H9FqNvXNyaY4ofjZrrvdnieB-coTe
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-25_05:2021-06-25,
 2021-06-25 signatures=0
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

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Times Ne=
w Roman, Times, serif;font-size:10pt" ><div dir=3D"ltr" ><div dir=3D"ltr" s=
tyle=3D"outline: none; color: rgb(18, 18, 18); font-family: &quot;Times New=
 Roman&quot;, Times, serif; font-size: 13.3333px; font-style: normal; font-=
variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; let=
ter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-=
transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit=
-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decorat=
ion-thickness: initial; text-decoration-style: initial; text-decoration-col=
or: initial;" ><p style=3D"outline: none; color: rgb(14, 16, 26); backgroun=
d: transparent; margin-top: 0pt; margin-bottom: 0pt;" >Hi All,&nbsp;</p>
<div style=3D"outline: none; color: rgb(14, 16, 26); background: transparen=
t; margin-top: 0pt; margin-bottom: 0pt;" >&nbsp;</div>
<p style=3D"outline: none; color: rgb(14, 16, 26); background: transparent;=
 margin-top: 0pt; margin-bottom: 0pt;" ><span data-preserver-spaces=3D"true=
" style=3D"outline: none; color: rgb(14, 16, 26); background: transparent; =
margin-top: 0pt; margin-bottom: 0pt;" >Recently a design document [</span><=
a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/27804" rel=3D=
"noopener" style=3D"outline: none; position: relative; color: rgb(74, 110, =
224); background: transparent; margin-top: 0pt; margin-bottom: 0pt;" target=
=3D"=5Fblank" ><span data-preserver-spaces=3D"true" style=3D"outline: none;=
 background: transparent; margin-top: 0pt; margin-bottom: 0pt; color: rgb(7=
4, 110, 224);" >https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/27804</=
span></a><span data-preserver-spaces=3D"true" style=3D"outline: none; color=
: rgb(14, 16, 26); background: transparent; margin-top: 0pt; margin-bottom:=
 0pt;" >] merged to enable the hardware isolation (guard) and it requires a=
 new daemon inside BMC&nbsp;to implement below dbus interfaces.&nbsp;</span=
></p>
<p style=3D"outline: none; color: rgb(14, 16, 26); background: transparent;=
 margin-top: 0pt; margin-bottom: 0pt;" >&nbsp;</p>
<p style=3D"outline: none; color: rgb(14, 16, 26); background: transparent;=
 margin-top: 0pt; margin-bottom: 0pt;" ><span data-preserver-spaces=3D"true=
" style=3D"outline: none; color: rgb(14, 16, 26); background: transparent; =
margin-top: 0pt; margin-bottom: 0pt;" >DBus Interfaces:</span></p>
<p style=3D"outline: none; color: rgb(14, 16, 26); background: transparent;=
 margin-top: 0pt; margin-bottom: 0pt;" >-&nbsp;<a href=3D"https://gerrit.op=
enbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/43532" rel=3D"noopen=
er" style=3D"outline: none; position: relative; color: rgb(74, 110, 224); b=
ackground: transparent; margin-top: 0pt; margin-bottom: 0pt;" target=3D"=5F=
blank" ><span data-preserver-spaces=3D"true" style=3D"outline: none; backgr=
ound: transparent; margin-top: 0pt; margin-bottom: 0pt; color: rgb(74, 110,=
 224);" >https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfa=
ces/+/43532</span></a></p>
<p style=3D"outline: none; color: rgb(14, 16, 26); background: transparent;=
 margin-top: 0pt; margin-bottom: 0pt;" >-&nbsp;<a href=3D"https://gerrit.op=
enbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/43533" rel=3D"noopen=
er" style=3D"outline: none; position: relative; color: rgb(74, 110, 224); b=
ackground: transparent; margin-top: 0pt; margin-bottom: 0pt;" target=3D"=5F=
blank" ><span data-preserver-spaces=3D"true" style=3D"outline: none; backgr=
ound: transparent; margin-top: 0pt; margin-bottom: 0pt; color: rgb(74, 110,=
 224);" >https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfa=
ces/+/43533</span></a></p>
<div style=3D"outline: none; color: rgb(14, 16, 26); background: transparen=
t; margin-top: 0pt; margin-bottom: 0pt;" >-&nbsp;<a href=3D"https://gerrit.=
openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/44229" rel=3D"noop=
ener" style=3D"outline: none; position: relative; color: rgb(65, 120, 190);=
" target=3D"=5Fblank" >https://gerrit.openbmc-project.xyz/c/openbmc/phospho=
r-dbus-interfaces/+/44229</a></div>
<p style=3D"outline: none; color: rgb(14, 16, 26); background: transparent;=
 margin-top: 0pt; margin-bottom: 0pt;" ><span data-preserver-spaces=3D"true=
" style=3D"outline: none; color: rgb(14, 16, 26); background: transparent; =
margin-top: 0pt; margin-bottom: 0pt;" >&nbsp;</span></p>
<p style=3D"outline: none; color: rgb(14, 16, 26); background: transparent;=
 margin-top: 0pt; margin-bottom: 0pt;" ><span data-preserver-spaces=3D"true=
" style=3D"outline: none; color: rgb(14, 16, 26); background: transparent; =
margin-top: 0pt; margin-bottom: 0pt;" >The above dbus interface implementat=
ion will be host architecture-specific because of the below reasons.&nbsp;<=
/span></p>
<p style=3D"outline: none; color: rgb(14, 16, 26); background: transparent;=
 margin-top: 0pt; margin-bottom: 0pt;" ><span data-preserver-spaces=3D"true=
" style=3D"outline: none; color: rgb(14, 16, 26); background: transparent; =
margin-top: 0pt; margin-bottom: 0pt;" >&nbsp;</span></p>
<p style=3D"outline: none; color: rgb(14, 16, 26); background: transparent;=
 margin-top: 0pt; margin-bottom: 0pt;" ><span data-preserver-spaces=3D"true=
" style=3D"outline: none; color: rgb(14, 16, 26); background: transparent; =
margin-top: 0pt; margin-bottom: 0pt;" >- The daemon will create a record (a=
 format used in the OpenPOWER project for isolating hardware) into a partit=
ion (which is accessible between BMC and host applications in OpenPOWER bas=
ed systems) and the daemon will create a dbus entry for the same record.</s=
pan></p>
<p style=3D"outline: none; color: rgb(14, 16, 26); background: transparent;=
 margin-top: 0pt; margin-bottom: 0pt;" >&nbsp;</p>
<p style=3D"outline: none; color: rgb(14, 16, 26); background: transparent;=
 margin-top: 0pt; margin-bottom: 0pt;" ><span data-preserver-spaces=3D"true=
" style=3D"outline: none; color: rgb(14, 16, 26); background: transparent; =
margin-top: 0pt; margin-bottom: 0pt;" >- Similarly, the OpenPOWER based hos=
t applications will create a record into a partition and the daemon will cr=
eate a dbus entry for the same record.</span></p>
<p style=3D"outline: none; color: rgb(14, 16, 26); background: transparent;=
 margin-top: 0pt; margin-bottom: 0pt;" ><span data-preserver-spaces=3D"true=
" style=3D"outline: none; color: rgb(14, 16, 26); background: transparent; =
margin-top: 0pt; margin-bottom: 0pt;" >&nbsp;</span></p>
<p style=3D"outline: none; color: rgb(14, 16, 26); background: transparent;=
 margin-top: 0pt; margin-bottom: 0pt;" ><span data-preserver-spaces=3D"true=
" style=3D"outline: none; color: rgb(14, 16, 26); background: transparent; =
margin-top: 0pt; margin-bottom: 0pt;" >The end goal is, exchanging the isol=
ated hardware details from internal interfaces (dbus entry) to external int=
erfaces (redfish log entry).</span></p>
<p style=3D"outline: none; color: rgb(14, 16, 26); background: transparent;=
 margin-top: 0pt; margin-bottom: 0pt;" ><span data-preserver-spaces=3D"true=
" style=3D"outline: none; color: rgb(14, 16, 26); background: transparent; =
margin-top: 0pt; margin-bottom: 0pt;" >&nbsp;</span></p>
<p style=3D"outline: none; color: rgb(14, 16, 26); background: transparent;=
 margin-top: 0pt; margin-bottom: 0pt;" ><span data-preserver-spaces=3D"true=
" style=3D"outline: none; color: rgb(14, 16, 26); background: transparent; =
margin-top: 0pt; margin-bottom: 0pt;" >I had two thoughts about the dbus im=
plementation.</span></p>
<p style=3D"outline: none; color: rgb(14, 16, 26); background: transparent;=
 margin-top: 0pt; margin-bottom: 0pt;" ><span data-preserver-spaces=3D"true=
" style=3D"outline: none; color: rgb(14, 16, 26); background: transparent; =
margin-top: 0pt; margin-bottom: 0pt;" >&nbsp;</span></p>
<p style=3D"outline: none; color: rgb(14, 16, 26); background: transparent;=
 margin-top: 0pt; margin-bottom: 0pt;" ><span data-preserver-spaces=3D"true=
" style=3D"outline: none; color: rgb(14, 16, 26); background: transparent; =
margin-top: 0pt; margin-bottom: 0pt;" >Option1:</span></p>
<p style=3D"outline: none; color: rgb(14, 16, 26); background: transparent;=
 margin-top: 0pt; margin-bottom: 0pt;" ><span data-preserver-spaces=3D"true=
" style=3D"outline: none; color: rgb(14, 16, 26); background: transparent; =
margin-top: 0pt; margin-bottom: 0pt;" >&nbsp;</span></p>
<p style=3D"outline: none; color: rgb(14, 16, 26); background: transparent;=
 margin-top: 0pt; margin-bottom: 0pt;" ><span data-preserver-spaces=3D"true=
" style=3D"outline: none; color: rgb(14, 16, 26); background: transparent; =
margin-top: 0pt; margin-bottom: 0pt;" >"New generic daemon" with an extensi=
on like how phosphor-logging or phosphor-debug-collector or pldm providing =
a way to add OEM code.</span></p>
<p style=3D"outline: none; color: rgb(14, 16, 26); background: transparent;=
 margin-top: 0pt; margin-bottom: 0pt;" ><span data-preserver-spaces=3D"true=
" style=3D"outline: none; color: rgb(14, 16, 26); background: transparent; =
margin-top: 0pt; margin-bottom: 0pt;" >&nbsp;- Default case nothing will be=
 there, because we (IBM) are not providing any support through standard hos=
t interfaces to isolate hardware.&nbsp;</span></p>
<p style=3D"outline: none; color: rgb(14, 16, 26); background: transparent;=
 margin-top: 0pt; margin-bottom: 0pt;" ><span data-preserver-spaces=3D"true=
" style=3D"outline: none; color: rgb(14, 16, 26); background: transparent; =
margin-top: 0pt; margin-bottom: 0pt;" >&nbsp;- The extension will have OEM-=
specific implementation.</span></p>
<p style=3D"outline: none; color: rgb(14, 16, 26); background: transparent;=
 margin-top: 0pt; margin-bottom: 0pt;" ><span data-preserver-spaces=3D"true=
" style=3D"outline: none; color: rgb(14, 16, 26); background: transparent; =
margin-top: 0pt; margin-bottom: 0pt;" >&nbsp;</span></p>
<p style=3D"outline: none; color: rgb(14, 16, 26); background: transparent;=
 margin-top: 0pt; margin-bottom: 0pt;" ><span data-preserver-spaces=3D"true=
" style=3D"outline: none; color: rgb(14, 16, 26); background: transparent; =
margin-top: 0pt; margin-bottom: 0pt;" >Option2:</span></p>
<p style=3D"outline: none; color: rgb(14, 16, 26); background: transparent;=
 margin-top: 0pt; margin-bottom: 0pt;" ><span data-preserver-spaces=3D"true=
" style=3D"outline: none; color: rgb(14, 16, 26); background: transparent; =
margin-top: 0pt; margin-bottom: 0pt;" >"New OEM daemon" so, implementation =
will be OEM specific and platform can get from them respective bitbake meta=
-layer.</span></p>
<p style=3D"outline: none; color: rgb(14, 16, 26); background: transparent;=
 margin-top: 0pt; margin-bottom: 0pt;" ><span data-preserver-spaces=3D"true=
" style=3D"outline: none; color: rgb(14, 16, 26); background: transparent; =
margin-top: 0pt; margin-bottom: 0pt;" >&nbsp;</span></p>
<p style=3D"outline: none; color: rgb(14, 16, 26); background: transparent;=
 margin-top: 0pt; margin-bottom: 0pt;" ><span data-preserver-spaces=3D"true=
" style=3D"outline: none; color: rgb(14, 16, 26); background: transparent; =
margin-top: 0pt; margin-bottom: 0pt;" >For Option1, I am wondering about th=
e following scenario.</span></p>
<p style=3D"outline: none; color: rgb(14, 16, 26); background: transparent;=
 margin-top: 0pt; margin-bottom: 0pt;" ><span data-preserver-spaces=3D"true=
" style=3D"outline: none; color: rgb(14, 16, 26); background: transparent; =
margin-top: 0pt; margin-bottom: 0pt;" >- If the BMC application (bmcweb) us=
ing a generic internal interface (dbus) but, the implementation is OEM spec=
ific then, the different system platforms will get a response like "Interfa=
ce/ObjectPath Not Found" so, the respective redfish URI (which will be used=
 to do create|list) will fail, right?</span></p>
<p style=3D"outline: none; color: rgb(14, 16, 26); background: transparent;=
 margin-top: 0pt; margin-bottom: 0pt;" ><span data-preserver-spaces=3D"true=
" style=3D"outline: none; color: rgb(14, 16, 26); background: transparent; =
margin-top: 0pt; margin-bottom: 0pt;" >- I also heard like the openBMC comm=
unity nowadays not encouraging the extension approach into a generic reposi=
tory for some reason unless there is a valid reason.</span></p>
<p style=3D"outline: none; color: rgb(14, 16, 26); background: transparent;=
 margin-top: 0pt; margin-bottom: 0pt;" ><span data-preserver-spaces=3D"true=
" style=3D"outline: none; color: rgb(14, 16, 26); background: transparent; =
margin-top: 0pt; margin-bottom: 0pt;" >&nbsp;</span></p>
<p style=3D"outline: none; color: rgb(14, 16, 26); background: transparent;=
 margin-top: 0pt; margin-bottom: 0pt;" ><span data-preserver-spaces=3D"true=
" style=3D"outline: none; color: rgb(14, 16, 26); background: transparent; =
margin-top: 0pt; margin-bottom: 0pt;" >For Option2,&nbsp;</span></p>
<p style=3D"outline: none; color: rgb(14, 16, 26); background: transparent;=
 margin-top: 0pt; margin-bottom: 0pt;" ><span data-preserver-spaces=3D"true=
" style=3D"outline: none; color: rgb(14, 16, 26); background: transparent; =
margin-top: 0pt; margin-bottom: 0pt;" >- I think bmcweb providing a configu=
ration option (ibm-management-console) to use IBM implementation so the new=
 OEM daemon interfaces can be used as OEM code inside the bmcweb so, that w=
e can avoid the above problem from an external interface user perspective f=
or different system platforms.</span></p>
<p style=3D"outline: none; color: rgb(14, 16, 26); background: transparent;=
 margin-top: 0pt; margin-bottom: 0pt;" ><span data-preserver-spaces=3D"true=
" style=3D"outline: none; color: rgb(14, 16, 26); background: transparent; =
margin-top: 0pt; margin-bottom: 0pt;" >&nbsp;</span></p>
<p style=3D"outline: none; color: rgb(14, 16, 26); background: transparent;=
 margin-top: 0pt; margin-bottom: 0pt;" ><span data-preserver-spaces=3D"true=
" style=3D"outline: none; color: rgb(14, 16, 26); background: transparent; =
margin-top: 0pt; margin-bottom: 0pt;" >The question is, Where I can impleme=
nt the new daemon? New repository or any other existing repository?</span><=
/p>
<div style=3D"outline: none; color: rgb(14, 16, 26); background: transparen=
t; margin-top: 0pt; margin-bottom: 0pt;" >&nbsp;</div>
<p style=3D"outline: none; color: rgb(14, 16, 26); background: transparent;=
 margin-top: 0pt; margin-bottom: 0pt;" ><span data-preserver-spaces=3D"true=
" style=3D"outline: none; color: rgb(14, 16, 26); background: transparent; =
margin-top: 0pt; margin-bottom: 0pt;" >If New repository means phosphor-hw-=
isolation (with extension) or openpower-hw-isolation?</span></p>
<p style=3D"outline: none; color: rgb(14, 16, 26); background: transparent;=
 margin-top: 0pt; margin-bottom: 0pt;" >&nbsp;</p>
<p style=3D"outline: none; color: rgb(14, 16, 26); background: transparent;=
 margin-top: 0pt; margin-bottom: 0pt;" ><span data-preserver-spaces=3D"true=
" style=3D"outline: none; color: rgb(14, 16, 26); background: transparent; =
margin-top: 0pt; margin-bottom: 0pt;" >Any different thoughts or suggestion=
s on the above proposal?</span></p></div>
<div dir=3D"ltr" style=3D"outline: none; color: rgb(18, 18, 18); font-famil=
y: &quot;Times New Roman&quot;, Times, serif; font-size: 13.3333px; font-st=
yle: normal; font-variant-ligatures: normal; font-variant-caps: normal; fon=
t-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-=
indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spa=
cing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, =
255); text-decoration-thickness: initial; text-decoration-style: initial; t=
ext-decoration-color: initial;" >&nbsp;</div>
<div dir=3D"ltr" style=3D"outline: none; color: rgb(18, 18, 18); font-famil=
y: &quot;Times New Roman&quot;, Times, serif; font-size: 13.3333px; font-st=
yle: normal; font-variant-ligatures: normal; font-variant-caps: normal; fon=
t-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-=
indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spa=
cing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, =
255); text-decoration-thickness: initial; text-decoration-style: initial; t=
ext-decoration-color: initial;" ><div dir=3D"ltr" style=3D"outline: none; f=
ont-family: Arial, Helvetica, sans-serif; font-size: 10pt;" ><div dir=3D"lt=
r" style=3D"outline: none;" ><div style=3D"outline: none; font-size: 12pt; =
font-weight: bold; font-family: sans-serif; color: rgb(124, 124, 95);" ><sp=
an style=3D"outline: none; font-size: 10pt;" >Regards,&nbsp;</span></div>
<div style=3D"outline: none; font-size: 12pt; font-weight: bold; font-famil=
y: sans-serif; color: rgb(124, 124, 95);" ><span style=3D"outline: none; fo=
nt-size: 10pt;" >Ramesh I</span></div>
<div style=3D"outline: none; font-size: 10pt; font-weight: bold; font-famil=
y: sans-serif;" ><span style=3D"outline: none; font-size: 10pt;" >OpenBMC D=
eveloper</span></div>
<div style=3D"outline: none; font-size: 8pt; font-family: sans-serif; margi=
n-top: 10px;" ><div style=3D"outline: none;" ><span style=3D"outline: none;=
 font-weight: bold; color: rgb(51, 102, 153);" >Slack:</span><span>&nbsp;</=
span>@rameshi1</div>
<div style=3D"outline: none;" ><span style=3D"outline: none; font-weight: b=
old; color: rgb(51, 102, 153);" >Discord:</span><span>&nbsp;</span>&nbsp;@R=
amesh I</div>
<div style=3D"outline: none;" ><span style=3D"outline: none; font-weight: b=
old; color: rgb(51, 102, 153);" >E-mail:<span>&nbsp;</span></span><a href=
=3D"mailto:rameshi1@in.ibm.com" rel=3D"noopener" style=3D"outline: none; po=
sition: relative; color: rgb(85, 85, 85);" target=3D"=5Fblank" >rameshi1@in=
.ibm.com</a></div></div></div></div></div></div>
<div dir=3D"ltr" >&nbsp;</div></div><BR>

