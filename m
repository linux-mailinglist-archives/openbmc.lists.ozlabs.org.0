Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EB0F0205
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2019 16:59:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476vVv5Xf0zF3pX
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 02:59:35 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 476vV80HVTzF3Hc
 for <openbmc@lists.ozlabs.org>; Wed,  6 Nov 2019 02:58:55 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA5FsYM3114682
 for <openbmc@lists.ozlabs.org>; Tue, 5 Nov 2019 10:58:52 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.119])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w39vcfk6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 05 Nov 2019 10:58:52 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Tue, 5 Nov 2019 15:58:51 -0000
Received: from us1b3-smtp02.a3dr.sjc01.isc4sb.com (10.122.7.175)
 by smtp.notes.na.collabserv.com (10.122.182.123) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 5 Nov 2019 15:58:48 -0000
Received: from us1b3-mail158.a3dr.sjc03.isc4sb.com ([10.160.174.218])
 by us1b3-smtp02.a3dr.sjc01.isc4sb.com
 with ESMTP id 2019110515584803-641650 ;
 Tue, 5 Nov 2019 15:58:48 +0000 
In-Reply-To: 
Subject: GUI Design Working Group
From: "Derick Montague" <Derick.Montague@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Tue, 5 Nov 2019 15:58:47 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1660 | IBM Domino Build
 SCN1812108_20180501T0841_FP61 October 18, 2019 at 15:11
X-KeepSent: A932D091:0C04712F-002584A9:004F48DF;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 52395
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 19110515-3975-0000-0000-000000C28B4D
X-IBM-SpamModules-Scores: BY=0.000692; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.428813; ST=0; TS=0; UL=0; ISC=; MB=0.000274
X-IBM-SpamModules-Versions: BY=3.00012057; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01285799; UDB=6.00681702; IPR=6.01067965; 
 MB=3.00029388; MTD=3.00000008; XFM=3.00000015; UTC=2019-11-05 15:58:49
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-11-05 11:48:55 - 6.00010613
x-cbparentid: 19110515-3976-0000-0000-00001D4A9B4F
Message-Id: <OFA932D091.0C04712F-ON002584A9.004F48DF-002584A9.0057C7C2@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-05_05:, , signatures=0
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
ans Unicode, Lucida Grande, sans-serif;font-size:10pt" ><div dir=3D"ltr" st=
yle=3D"font-family:Lucida Sans Unicode, Lucida Grande, sans-serif;font-size=
:10pt" ><div dir=3D"ltr" >Hello,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >The next GUI Design workgroup is tomorrow, Wednesday, Nov=
ember 5th at 10:00 AM CST. Tomorrow's&nbsp;&nbsp;agenda,&nbsp;previous meet=
ing notes, and information on how to attend can be found on the OpenBMC Wik=
i -&nbsp;<a href=3D"https://github.com/openbmc/openbmc/wiki/GUI-Design-work=
-group" target=3D"=5Fblank" >https://github.com/openbmc/openbmc/wiki/GUI-De=
sign-work-group</a>.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >The agenda for tomorrow includes:</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >1. Discuss Intel goals for OpenBMC GUI</div>
<div dir=3D"ltr" >2. Review Intel's proposed&nbsp;OpenBMC GUI design change=
s -&nbsp;<a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-w=
ebui/+/26539" rel=3D"nofollow" target=3D"=5Fblank" >https://gerrit.openbmc-=
project.xyz/c/openbmc/phosphor-webui/+/26539</a></div>
<div dir=3D"ltr" >3. Discuss best ways to collaborate on GUI design and imp=
lementation</div>
<div dir=3D"ltr" >&nbsp;</div></div></div><BR>

