Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE02F1149B3
	for <lists+openbmc@lfdr.de>; Fri,  6 Dec 2019 00:14:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47TWkQ689qzDqbq
	for <lists+openbmc@lfdr.de>; Fri,  6 Dec 2019 10:14:06 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47TWjc0LntzDqbC
 for <openbmc@lists.ozlabs.org>; Fri,  6 Dec 2019 10:13:23 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB5N7BAJ020162
 for <openbmc@lists.ozlabs.org>; Thu, 5 Dec 2019 18:13:20 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.114])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wq9gmbn85-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Dec 2019 18:13:20 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Thu, 5 Dec 2019 23:13:20 -0000
Received: from us1b3-smtp07.a3dr.sjc01.isc4sb.com (10.122.203.198)
 by smtp.notes.na.collabserv.com (10.122.47.58) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 5 Dec 2019 23:13:18 -0000
Received: from us1b3-mail158.a3dr.sjc03.isc4sb.com ([10.160.174.218])
 by us1b3-smtp07.a3dr.sjc01.isc4sb.com
 with ESMTP id 2019120523131724-855259 ;
 Thu, 5 Dec 2019 23:13:17 +0000 
In-Reply-To: 
Subject: GUI Design Workgroup Notes and Next meeting
From: "Derick Montague" <Derick.Montague@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Thu, 5 Dec 2019 23:13:18 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-LLNOutbound: False
X-Disclaimed: 33575
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 19120523-1639-0000-0000-0000010910DB
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.394815; ST=0; TS=0; UL=0; ISC=; MB=0.016557
X-IBM-SpamModules-Versions: BY=3.00012201; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01300144; UDB=6.00690309; IPR=6.01082414; 
 MB=3.00029862; MTD=3.00000008; XFM=3.00000015; UTC=2019-12-05 23:13:19
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-12-05 16:41:10 - 6.00010732
x-cbparentid: 19120523-1640-0000-0000-0000566C3D6C
Message-Id: <OFD864BB65.24B0BA6C-ON002584C7.007F35B7-002584C7.007F8F78@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-05_10:2019-12-04,2019-12-05 signatures=0
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

Thank you to everyone that attended the workgroup. It was one of our most p=
roductive meetings to date. I am excited about the path forward. Below you =
will find all the notes, as well as a link to the wiki.=20

One of the action items was to try and meet again before our next scheduled=
 meeting on 12/18/19. There may be a few community group members that will =
be out for the upcoming holiday season.=20

Kathy - Are there any days and times next week that will work for you? I wi=
ll find time on our calendars so that we can compare the Server LED mockups.


Link to wiki: https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group

Attendees
- Kathy Pine (Intel)
- Yoshie Muranaka (IBM)
- Jandra Aranguren (IBM)
- Ryan Arnell (IBM)
- Mira Murali (IBM)
- Dixsie Wolmers (IBM)
- Jen Spatz (IBM)
- Derick Montague (IBM)
- Nicole Conser (IBM)
- Rahul Maheshwari (IBM)
- Gunnar Mills (IBM)

Notes

Transition to VueJS
- AngularJS sunsets on 6/21 and IBM has proposed to the community mailing l=
ist on multiple occasions that we want to migrate the front-end framework f=
rom AngularJs to Vue.

- Kathy believes that Intel is onboard with the framework migration and is =
going to check with Intel team and finalize by the next workgroup meeting o=
n 12/18

- IBM is working on a Vue prototype

- Gunnar is planning to send an email to the community to discuss the need =
for a new branch since the migration will be a complete rewrite

Goals and Improvements

- The change to Vue will allow for the workgroup to find a base design cons=
ensus that works for the community

- The Vue rewrite will be structured to minimize the effort needed to custo=
mize the product downstream. If for some reason the Vue rewrite was not the=
 right path forward, the phosphor-webui codebase will need to be rewritten =
to remove the Foundation component library and rewrite the majority of the =
structural layer to take advantage of the Bootstrap component library. Curr=
ently, both Bootstrap and Foundation are included in the library.

- Jandra and Kathy are creating mockups of the Server LED page that will be=
 used to find consensus on the differences in design of the global header a=
nd primary navigation components.

- Derick will try to set up a meeting prior to 12/18 due to holiday vacatio=
n schedules. If we can't meet prior to 12/18, the design consensus may have=
 to wait for the next meeting which would be 1/15/20 due to first scheduled=
 meeting falling on New Years day.

- Discussed the value in a style guide for future design and development. M=
ore discussion is needed, but there is consensus that this guide will benef=
it any future GUI designers and developers to be able to ramp up quickly on=
 the GUI architecture and best practices. This is a secondary effort that I=
BM is happy to take ownership of.

- We will need to determine where this documentation lives. It is possible =
to use VuePress and serve a living style guide using Github pages from the =
existing documentation repo. More conversation with the community is requir=
ed prior to moving forward with this initiative.

