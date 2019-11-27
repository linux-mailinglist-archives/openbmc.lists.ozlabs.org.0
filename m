Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A8010B398
	for <lists+openbmc@lfdr.de>; Wed, 27 Nov 2019 17:40:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NRMy4zFXzDqxG
	for <lists+openbmc@lfdr.de>; Thu, 28 Nov 2019 03:40:30 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NRM1113LzDqwr
 for <openbmc@lists.ozlabs.org>; Thu, 28 Nov 2019 03:39:40 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xARGXUOe141749
 for <openbmc@lists.ozlabs.org>; Wed, 27 Nov 2019 11:39:35 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2whcxphqh7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 27 Nov 2019 11:39:34 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Wed, 27 Nov 2019 16:39:33 -0000
Received: from us1b3-smtp01.a3dr.sjc01.isc4sb.com (10.122.7.174)
 by smtp.notes.na.collabserv.com (10.122.47.46) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 27 Nov 2019 16:39:31 -0000
Received: from us1b3-mail158.a3dr.sjc03.isc4sb.com ([10.160.174.218])
 by us1b3-smtp01.a3dr.sjc01.isc4sb.com
 with ESMTP id 2019112716393076-648597 ;
 Wed, 27 Nov 2019 16:39:30 +0000 
In-Reply-To: <FD0BD680739BFC41807C96BD23118BB131A1BE@ORSMSX113.amr.corp.intel.com>
Subject: GUI Component Library
From: "Derick Montague" <Derick.Montague@ibm.com>
To: kathryn.elainex.pine@intel.com
Date: Wed, 27 Nov 2019 16:39:30 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-LLNOutbound: False
X-Disclaimed: 14911
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 19112716-3017-0000-0000-0000016C87D9
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.415652; ST=0; TS=0; UL=0; ISC=; MB=0.057664
X-IBM-SpamModules-Versions: BY=3.00012174; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01296225; UDB=6.00687964; IPR=6.01078475; 
 MB=3.00029740; MTD=3.00000008; XFM=3.00000015; UTC=2019-11-27 16:39:32
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-11-27 15:22:44 - 6.00010700
x-cbparentid: 19112716-3018-0000-0000-0000D0DC9900
Message-Id: <OF518FB33F.0A608011-ON002584BF.0046C766-002584BF.005B81EB@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-27_04:2019-11-27,2019-11-27 signatures=0
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

> Yes, agreed that with additional collaboration we can continue to polish =
the design =E2=80=93 in all cases, both the existing UI and my proposed des=
igns can continue to look cleaner with more time and collaboration.
=20
Using a static style guide will help as we transition to Bootstrap-Vue and =
rewrite the framework. Our current plan is to replicate the existing UI. If=
 we can find a consensus on foundational items like typography, vertical rh=
ythm, color palette, and button styles, we would document them in the style=
 guide. This conversation is more efficient using an existing standard and =
discussing the need for change before making changes and then discussing th=
em.=20
=20
> I wanted to share our work once we=E2=80=99d gotten initial working desig=
ns, and did not feel it was important to invest further time in them before=
 beginning the stylistic conversation we=E2=80=99ve been having, since as w=
e collaborate, it=E2=80=99s efficient to address details in the process and=
 after some of the bigger issues are agreed upon.
=20
Designing with code and then reviewing is not how we design. However, we un=
derstand there are different philosophies around the design process. We use=
 static mockups to review and iterate quickly. Even with some of the change=
s currently being proposed, there aren't any clear expectations. The use of=
 a style guide would resolve that.
=20
> I also believe that with some CSS consolidation =E2=80=93 which is someth=
ing I=E2=80=99ve been working on downstream - many elements would be easily=
 standardized and consistent.
=20
It would be great to be able to review those changes upstream and move forw=
ard with those types of improvements. I feel that the cleanup effort should=
 precede any design changes to make the implementation easier. I expect tha=
t the cleanup effort also includes the proposed design changes, which is a =
concern.
=20
> I do have concerns about the dynamic nature of the site=E2=80=99s develop=
ment and the potential static nature of a design guide. I wonder if it migh=
t be best to continue working towards consensus with our concept process, a=
nd then revisit the style guide once we get a little further towards that c=
onsensus.
=20
The goal of the style guide is to document our consensus. It would be helpf=
ul to agree on some of the foundational aspects of the application to make =
the concept process easier.
=20
> We could revisit the design library, which I do think is a good potential=
 option if we can agree on one, or we could make a concerted effort to clea=
n up CSS, to make it more of a sitewide style guideline in and of itself, d=
uring this collaboration as well.
=20
The style guide is the agreement. Its documentation can be used to validate=
 any changes to the code. We could continue to clean up the CSS now, but wo=
uld not be a great use of our time since we will be doing that as part of t=
he framework update. We are currently working on the prototype after our ag=
reement in the last GUI Design Workgroup to move forward with a Vue rewrite.

Unfortunately, we can't take the existing code base and migrate to Vue and =
the Bootstrap-Vue component library. The current codebase uses both the Boo=
tstrap and Foundation libraries but does not leverage the benefits of eithe=
r. We need to create custom theming and take advantage of the library to mi=
nimize the need for theme overrides. We will address this with the framewor=
k update, along with leveraging Bootstrap 4's use of SCSS theming.

We need to establish foundational agreement and document those decisions in=
 a style guide as we move forward. Otherwise, we will be wasting time devel=
oping code that we would have to rewrite.

Regarding using the site as a style guide, the lack of documentation is the=
 reason the codebase lacks consistency in both design and implementation. R=
elying on the site to inform future collaborators on how to create new layo=
uts will eventually result in the issue you are currently trying to solve.
=20

