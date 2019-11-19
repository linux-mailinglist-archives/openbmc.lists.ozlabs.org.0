Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD35102787
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2019 16:01:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HTY119CZzDqcQ
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 02:01:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=derick.montague@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HTX81cvNzDqbm
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 02:00:23 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAJEwLvN017500
 for <openbmc@lists.ozlabs.org>; Tue, 19 Nov 2019 10:00:19 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.91])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wcf46u2a5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 19 Nov 2019 10:00:18 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Tue, 19 Nov 2019 15:00:15 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 19 Nov 2019 15:00:11 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2019111915001104-576397 ;
 Tue, 19 Nov 2019 15:00:11 +0000 
In-Reply-To: <5791f21a-0189-3dd7-6c7c-a6815d811a69@intel.com>
From: "Derick Montague" <Derick.Montague@ibm.com>
To: johnathanx.mantey@intel.com
Date: Tue, 19 Nov 2019 15:00:10 +0000
Sensitivity: 
MIME-Version: 1.0
References: <5791f21a-0189-3dd7-6c7c-a6815d811a69@intel.com>,
 <FD0BD680739BFC41807C96BD23118BB130C7A4@ORSMSX113.amr.corp.intel.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1661 | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-LLNOutbound: False
X-Disclaimed: 3655
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 19111915-2475-0000-0000-0000016D9896
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.397008; ST=0; TS=0; UL=0; ISC=; MB=0.035199
X-IBM-SpamModules-Versions: BY=3.00012133; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01292389; UDB=6.00685667; IPR=6.01074615; 
 MB=3.00029610; MTD=3.00000008; XFM=3.00000015; UTC=2019-11-19 15:00:15
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-11-19 12:55:10 - 6.00010666
x-cbparentid: 19111915-2476-0000-0000-00002F89A58A
Message-Id: <OF6FABACDD.19BEF649-ON002584B7.00525944-002584B7.005269EB@notes.na.collabserv.com>
Subject: RE: OpenBMC logo vector version
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-19_04:2019-11-15,2019-11-19 signatures=0
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
Cc: openbmc@lists.ozlabs.org, kathryn.elainex.pine@intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Lucida S=
ans Unicode, Lucida Grande, sans-serif;font-size:10pt" ><div dir=3D"ltr" >&=
nbsp;</div>
<div dir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><di=
v dir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><div d=
ir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><div dir=
=3D"ltr" ><div><div dir=3D"ltr" ><div>&gt;&nbsp;Does anyone have a vector-b=
ased version of the OpenBMC logo? All the versions I can find are bitmaps a=
nd don=E2=80=99t have vector data.</div>
<div>&nbsp;</div>
<div><a href=3D"https://github.com/openbmc/docs/tree/master/logo" >https://=
github.com/openbmc/docs/tree/master/logo</a></div></div></div>
<div><div>&nbsp;</div></div></div></div></div></div></div></div></div></div=
></div></div></div></div></div></div><BR>

