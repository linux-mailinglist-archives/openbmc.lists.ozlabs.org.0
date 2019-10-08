Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A05E1CFC51
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 16:24:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nfjk6Fw9zDqQW
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2019 01:24:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=derick.montague@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nfhw6JPPzDqPS
 for <openbmc@lists.ozlabs.org>; Wed,  9 Oct 2019 01:23:27 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x98E7PtE083317
 for <openbmc@lists.ozlabs.org>; Tue, 8 Oct 2019 10:23:19 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.81])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vgu29axde-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 08 Oct 2019 10:23:19 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Tue, 8 Oct 2019 14:23:19 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 8 Oct 2019 14:23:17 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2019100814231633-574138 ;
 Tue, 8 Oct 2019 14:23:16 +0000 
In-Reply-To: 
Subject: GUI Design Community Workgroup
From: "Derick Montague" <Derick.Montague@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Tue, 8 Oct 2019 14:23:16 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1619 | IBM Domino Build
 SCN1812108_20180501T0841_FP57 August 05, 2019 at 12:42
X-LLNOutbound: False
X-Disclaimed: 20467
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 19100814-3067-0000-0000-000000F69D20
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40304; ST=0; TS=0; UL=0; ISC=; MB=0.015018
X-IBM-SpamModules-Versions: BY=3.00011914; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01272487; UDB=6.00673717; IPR=6.01054579; 
 MB=3.00029000; MTD=3.00000008; XFM=3.00000015; UTC=2019-10-08 14:23:18
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-10-08 11:37:49 - 6.00010501
x-cbparentid: 19100814-3068-0000-0000-0000124EB5E3
Message-Id: <OFCE5B32BC.685900B4-ON0025848D.004D8D53-0025848D.004F08E6@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-08_05:, , signatures=0
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
ans Unicode, Lucida Grande, sans-serif;font-size:10pt" ><div dir=3D"ltr" >H=
ello,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >The GUI community workgroup will be meeting tomorrow at 1=
0 AM Central to discuss the following items:</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><div>- Firmware upload error messaging</div>
<div>- BMC Reboot messaging</div>
<div>- Date and Time require reboot messaging</div>
<div>- Min/Max Power Settings Design review</div>
<div>- GUI Save pattern consistency review</div>
<div>&nbsp;</div>
<div>The meeting information can be found on the GUIDesign&nbsp;Workgroup w=
iki&nbsp;page -&nbsp;<a href=3D"https://github.com/openbmc/openbmc/wiki/GUI=
-Design-work-group" >https://github.com/openbmc/openbmc/wiki/GUI-Design-wor=
k-group</a></div></div>
<div dir=3D"ltr" >&nbsp;</div></div><BR>

