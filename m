Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F201425AE67
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 17:08:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhS4c5fWWzDqwb
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 01:08:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=derick.montague@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kpDmAIV+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhRz26Z0ZzDr0v
 for <openbmc@lists.ozlabs.org>; Thu,  3 Sep 2020 01:03:42 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 082F216c178641
 for <openbmc@lists.ozlabs.org>; Wed, 2 Sep 2020 11:03:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : references : content-type : message-id :
 content-transfer-encoding : mime-version : subject; s=pp1;
 bh=sSA1bIOzOo+cNgHe0pG9Ub7ebJxXfalbQf82KdpKo0E=;
 b=kpDmAIV+JjGZETH4maSeaaWP/PzbYhZSPs9pqtDbGjuWFzN721luB2m1hj4jtNRmbQbB
 XCnHEwQ1chBsLg0J9stPvu/dCd3pqDDrM3DVeGAbqnqAFhVdAD2XaWMXChbyqLSKLfAW
 MuHTg6qMuCntTY+f8B7BUzm9p09rCMmE5WMLzTYsZXQhc2nzaKtW4hjbjVgneAge8GXB
 PTuXieiPqlLFD/M64sl+9HlIoaNUiLCIZZk8hQ7ZmI6LJcHdEj5nkVyULXCa3Xgy3XMs
 t5S6W72jlcdXniXZN+4SvJEcX+RGyv0tvif86n4z0IrTLStkUaGp56uB3dMQcixiOyUc Ag== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.81])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33acgwthpq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 02 Sep 2020 11:03:37 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Wed, 2 Sep 2020 15:03:37 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 2 Sep 2020 15:03:35 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2020090215033479-499437 ;
 Wed, 2 Sep 2020 15:03:34 +0000 
In-Reply-To: <OF22C46790.79BD0D33-ON002585D6.00740622-002585D6.007436F7@notes.na.collabserv.com>
From: "Derick Montague" <Derick.Montague@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Wed, 2 Sep 2020 15:03:34 +0000
Sensitivity: 
References: <OF22C46790.79BD0D33-ON002585D6.00740622-002585D6.007436F7@notes.na.collabserv.com>,
 <OF638D78EB.A08769F2-ON002585C9.004C1612-002585C9.004C7B07@LocalDomain>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1661 | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 16455
X-TNEFEvaluated: 1
Content-Type: text/html; charset=UTF-8
x-cbid: 20090215-3067-0000-0000-000003F219B6
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.417846; ST=0; TS=0; UL=0; ISC=; MB=0.000021
X-IBM-SpamModules-Versions: BY=3.00013762; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01429017; UDB=6.00767221; IPR=6.01211744; 
 MB=3.00033843; MTD=3.00000008; XFM=3.00000015; UTC=2020-09-02 15:03:36
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-09-02 12:43:30 - 6.00011794
x-cbparentid: 20090215-3068-0000-0000-0000C54419B2
Message-Id: <OF70081F82.999E4BB7-ON002585D7.00528712-002585D7.0052B9B8@notes.na.collabserv.com>
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 16 URL's were un-rewritten
MIME-Version: 1.0
Subject: Re:  OpenBMC GUI Design Workgroup - Tomorrow - Wednesday,
 9/2/20 at 10:00 AM Central Time
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-02_09:2020-09-02,
 2020-09-02 signatures=0
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
Cc: jason.m.bills@linux.intel.com, bruce_mitchell@phoenix.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Tahoma, =
Geneva, sans-serif;font-size:10pt" ><div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"fo=
nt-family:Arial, Helvetica, sans-serif;font-size:10pt" ><div class=3D"socma=
ildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, Helvetica, sans-seri=
f;font-size:10pt" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"f=
ont-family:Arial, Helvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" >=
<div dir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><di=
v dir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><div d=
ir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><div dir=
=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><div><div dir=3D"ltr" >There =
was an issue with the recurring Webex meeting. Can you please attend using =
this info? I also updated in the Wiki</div>
<div dir=3D"ltr" ><a href=3D"https://ibm.webex.com/meet/derick.montague">ht=
tps://ibm.webex.com/meet/derick.montague</a></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Meeting Number: 928 923 589</div></div></div></div></div>=
</div></div></div></div></div></div></div></div></div></div></div></div></d=
iv></div></div></div></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: "Derick Montague" =
&lt;Derick.Montague@ibm.com&gt;<br>Sent by: "openbmc" &lt;openbmc-bounces+d=
erick.montague=3Dibm.com@lists.ozlabs.org&gt;<br>To: openbmc@lists.ozlabs.o=
rg<br>Cc:<br>Subject: [EXTERNAL] OpenBMC GUI Design Workgroup - Tomorrow - =
Wednesday, 9/2/20 at 10:00 AM Central Time<br>Date: Tue, Sep 1, 2020 4:09 P=
M<br>&nbsp;
<div><font size=3D"2" face=3D"Default Monospace,Courier New,Courier,monospa=
ce" >Hello,<br><br>Here is the agenda for today's GUI Design Work Group. &n=
bsp;<br>&nbsp;&nbsp;<br><br>- FormFile component redesign - <a href=3D"http=
s://github.com/openbmc/webui-vue/issues/31" target=3D"_blank">https://githu=
b.com/openbmc/webui-vue/issues/31</a>&nbsp;<br>- How to use utility classes=
 discussion<br>- Discuss Server LED layout - <a href=3D"https://github.com/=
openbmc/webui-vue/issues/18" target=3D"_blank">https://github.com/openbmc/w=
ebui-vue/issues/18</a>&nbsp;<br>- Discuss button styles on Local user manag=
ement page -https://github.com/openbmc/webui-vue/issues/12<br>- Help wanted=
 items - <a href=3D"https://github.com/openbmc/webui-vue/projects/2" target=
=3D"_blank">https://github.com/openbmc/webui-vue/projects/2</a>&nbsp;<br>- =
Design Review items - <a href=3D"https://github.com/openbmc/webui-vue/proje=
cts/1" target=3D"_blank">https://github.com/openbmc/webui-vue/projects/1</a=
>&nbsp;<br>- Demo of working Web UI progress<br><br>&nbsp;&nbsp;<br>&nbsp;&=
nbsp;<br>Please visit the wiki for connection info and notes from past grou=
ps. &nbsp;<br><a href=3D"https://github.com/openbmc/openbmc/wiki/GUI-Design=
-work-group" target=3D"_blank">https://github.com/openbmc/openbmc/wiki/GUI-=
Design-work-group</a>&nbsp;&nbsp; &nbsp;<br>&nbsp;&nbsp;<br>&nbsp;<br>Thank=
 you! &nbsp;<br>&nbsp;&nbsp;<br>Derick Montague<br>OpenBMC Design Team Lead=
<br>IBM Cognitive Systems User Experience &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</font><br>&nbsp;</div></=
blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>

