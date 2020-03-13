Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E958184BB7
	for <lists+openbmc@lfdr.de>; Fri, 13 Mar 2020 16:52:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48f9Dm0224zDqY4
	for <lists+openbmc@lfdr.de>; Sat, 14 Mar 2020 02:52:08 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48f9Cx02flzDqVB
 for <openbmc@lists.ozlabs.org>; Sat, 14 Mar 2020 02:51:23 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02DFp7cH132417
 for <openbmc@lists.ozlabs.org>; Fri, 13 Mar 2020 11:51:20 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.110])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yqx4e0p6j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 13 Mar 2020 11:51:20 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Fri, 13 Mar 2020 15:51:19 -0000
Received: from us1b3-smtp08.a3dr.sjc01.isc4sb.com (10.122.203.190)
 by smtp.notes.na.collabserv.com (10.122.47.50) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 13 Mar 2020 15:51:16 -0000
Received: from us1b3-mail158.a3dr.sjc03.isc4sb.com ([10.160.174.218])
 by us1b3-smtp08.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020031315511593-570241 ;
 Fri, 13 Mar 2020 15:51:15 +0000 
In-Reply-To: 
Subject: Web UI Vue - Design Review Process
From: "Derick Montague" <Derick.Montague@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Fri, 13 Mar 2020 15:51:15 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-LLNOutbound: False
X-Disclaimed: 62079
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20031315-1059-0000-0000-000001977186
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.431006; ST=0; TS=0; UL=0; ISC=; MB=0.015829
X-IBM-SpamModules-Versions: BY=3.00012740; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000293; SDB=6.01347121; UDB=6.00718353; IPR=6.01129534; 
 MB=3.00031209; MTD=3.00000008; XFM=3.00000015; UTC=2020-03-13 15:51:17
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-03-13 15:07:28 - 6.00011114
x-cbparentid: 20031315-1060-0000-0000-00004A5A7DF0
Message-Id: <OF3A733740.FFC17971-ON0025852A.0050FFBE-0025852A.0057174C@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-13_05:2020-03-12,
 2020-03-13 signatures=0
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

Hello everyone,

As we continue to rewrite the OpenBMC Web UI in the Vue framework, we will
be looking for feedback from the community. Outside of discussions in our
bi-weekly GUI Design workgroup, we are starting to document all these
changes in the "openbmc/webui-vue" repository. Ryan Arnell just sent an
email about the date and time settings updates we are proposing.

To improve transparency, we are taking advantage of Github's Projects
feature. You can read more about Projects at
https://github.com/features/project-management/. For the design process,
we have created a Design Review project. This project will make it simple
to see all the design updates that are in progress, coming soon, or
completed. Here is the link to the project,
https://github.com/openbmc/webui-vue/projects/1.

The goal is to capture community feedback for any design in the Github
story, which will also contain an iteration history of the design proposal.
We are looking forward to your feedback as we add new features and improve
the overall user experience of the OpenBMC Web UI.

=20
Derick Montague
Design Team Support and Enablement
Cognitive Systems User Experience
=20

