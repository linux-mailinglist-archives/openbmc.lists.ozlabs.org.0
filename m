Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B951103BD7
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 14:38:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47J3g61X30zDqsH
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2019 00:38:26 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47J3db3YHYzDqkp
 for <openbmc@lists.ozlabs.org>; Thu, 21 Nov 2019 00:37:06 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAKDZc0r117889
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 08:37:02 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.67])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wd5s0sfp5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 08:37:02 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Wed, 20 Nov 2019 13:37:02 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 20 Nov 2019 13:36:58 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2019112013365753-499638 ;
 Wed, 20 Nov 2019 13:36:57 +0000 
In-Reply-To: 
Subject: GUI Design Workgroup - Today - Wednesday 11/20
From: "Derick Montague" <Derick.Montague@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Wed, 20 Nov 2019 13:36:57 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1661 | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-LLNOutbound: False
X-Disclaimed: 31215
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 19112013-7279-0000-0000-000001365DBB
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.423878; ST=0; TS=0; UL=0; ISC=; MB=0.000017
X-IBM-SpamModules-Versions: BY=3.00012138; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01292838; UDB=6.00685934; IPR=6.01075061; 
 MB=3.00029626; MTD=3.00000008; XFM=3.00000015; UTC=2019-11-20 13:37:00
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-11-20 07:45:24 - 6.00010669
x-cbparentid: 19112013-7280-0000-0000-000011E664A8
Message-Id: <OFACB662CD.2442A2C1-ON002584B8.004AA114-002584B8.004ACB90@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-20_04:2019-11-15,2019-11-20 signatures=0
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
<div dir=3D"ltr" >We have a GUI Design Workgroup today at 10:00 AM Central.=
 The agenda includes:</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><div>- Discuss use of Carbon Design System for icons and =
components</div>
<div>- Discuss framework update from AngularJS to Vue</div>
<div>- Discuss primary navigation changes and collaborative&nbsp;work betwe=
en Intel and IBM</div></div></div><BR>

