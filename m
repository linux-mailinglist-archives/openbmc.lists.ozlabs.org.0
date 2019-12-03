Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B533F110603
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2019 21:35:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47SDHy4fLCzDqSm
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2019 07:35:10 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47SDHC1qgjzDqR2
 for <openbmc@lists.ozlabs.org>; Wed,  4 Dec 2019 07:34:30 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB3KRPnb085651
 for <openbmc@lists.ozlabs.org>; Tue, 3 Dec 2019 15:34:27 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.111])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wn3pe871q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 03 Dec 2019 15:34:27 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Tue, 3 Dec 2019 20:34:25 -0000
Received: from us1b3-smtp07.a3dr.sjc01.isc4sb.com (10.122.203.198)
 by smtp.notes.na.collabserv.com (10.122.47.52) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 3 Dec 2019 20:34:23 -0000
Received: from us1b3-mail158.a3dr.sjc03.isc4sb.com ([10.160.174.218])
 by us1b3-smtp07.a3dr.sjc01.isc4sb.com
 with ESMTP id 2019120320342332-943900 ;
 Tue, 3 Dec 2019 20:34:23 +0000 
In-Reply-To: <FD0BD680739BFC41807C96BD23118BB131A69B@ORSMSX113.amr.corp.intel.com>
Subject: GUI Component Library
From: "Derick Montague" <Derick.Montague@ibm.com>
To: kathryn.elainex.pine@intel.com
Date: Tue, 3 Dec 2019 20:34:23 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <FD0BD680739BFC41807C96BD23118BB131A69B@ORSMSX113.amr.corp.intel.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-LLNOutbound: False
X-Disclaimed: 39431
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 19120320-3633-0000-0000-00000142091C
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.415652; ST=0; TS=0; UL=0; ISC=; MB=0.260597
X-IBM-SpamModules-Versions: BY=3.00012199; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01299138; UDB=6.00689707; IPR=6.01081404; 
 MB=3.00029835; MTD=3.00000008; XFM=3.00000015; UTC=2019-12-03 20:34:25
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-12-03 17:35:36 - 6.00010724
x-cbparentid: 19120320-3634-0000-0000-0000AC723E5E
Message-Id: <OF39184269.99B81F04-ON002584C5.0011B6CF-002584C5.0071031B@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-03_06:2019-12-02,2019-12-03 signatures=0
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> My proposal is that we work towards a vision with concepts for the overal=
l site prior to getting into the details, as a method for consensus buildin=
g.=20

Designing a site without understanding the base-level building blocks will =
not work. We need to agree on the foundation before we start trying to buil=
d concepts. Building concepts without an agreement on the foundation will n=
ot be efficient.


> I think we have the opportunity =E2=80=93 leaning on the collaborative st=
rengths that we can all bring =E2=80=93 to combine what we have each been w=
orking on to make something even better. But it will mean being willing to =
compromise some of our style preferences to agree on a shared vision. Is th=
ere interest on working towards this vision together?

That is the objective of this thread. Since you are opposed to using Carbon=
, we agreed to use Bootstrap. We are working towards this vision together.
=20

> If we can agree on the big picture, creating a style guide or choosing a =
design library will be much easier as we=E2=80=99ll have consensus reflecti=
ng that shared vision.

I thought we already decided to use Bootstrap-Vue as the component library.=
 Did something change?=20


> How about we discuss in this week's GUI Design workgroup meeting?

The topics you suggested work. We will need to discuss the framework migrat=
ion with a focus on how to align on theme customization.

