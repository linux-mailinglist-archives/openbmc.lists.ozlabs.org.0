Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C996204093
	for <lists+openbmc@lfdr.de>; Mon, 22 Jun 2020 21:37:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rKRj0JNYzDqXZ
	for <lists+openbmc@lfdr.de>; Tue, 23 Jun 2020 05:37:05 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rKQg38l5zDqTk
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jun 2020 05:36:10 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05MJWYJl070482
 for <openbmc@lists.ozlabs.org>; Mon, 22 Jun 2020 15:36:08 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.110])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31tytsdrgb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 22 Jun 2020 15:36:08 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Mon, 22 Jun 2020 19:36:07 -0000
Received: from us1b3-smtp06.a3dr.sjc01.isc4sb.com (10.122.203.184)
 by smtp.notes.na.collabserv.com (10.122.47.50) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 22 Jun 2020 19:36:05 -0000
Received: from us1b3-mail158.a3dr.sjc03.isc4sb.com ([10.160.174.218])
 by us1b3-smtp06.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020062219360480-768221 ;
 Mon, 22 Jun 2020 19:36:04 +0000 
In-Reply-To: 
Subject: Default branch naming in GitHub repositories
From: "Derick Montague" <Derick.Montague@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Mon, 22 Jun 2020 19:36:04 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 4739
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20062219-1059-0000-0000-0000023B79F6
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.431006; ST=0; TS=0; UL=0; ISC=; MB=0.026373
X-IBM-SpamModules-Versions: BY=3.00013331; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01395344; UDB=6.00746919; IPR=6.01177630; 
 MB=3.00032669; MTD=3.00000008; XFM=3.00000015; UTC=2020-06-22 19:36:07
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-06-22 17:07:42 - 6.00011514
x-cbparentid: 20062219-1060-0000-0000-0000548B8095
Message-Id: <OFBE678676.EE578E7F-ON0025858F.006AB938-0025858F.006BAC65@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-22_11:2020-06-22,
 2020-06-22 signatures=0
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

Hello,

In recent weeks, we have seen an initiative to update any
racially-charged naming conventions within our industry. Some examples
include Blacklist, Whitelist, and Master / Slave.=20

There is also an initiative to change the default branch naming in
Github. Github is in the process of making changes for new repositories,
and I would like to suggest that we start discussions about our default
branch naming. One suggestion that has some traction is replacing master
with main.=20

I'd like to discuss an overall strategy and the impact it would have on
our build scripts before I ask to make this change in the webui-vue reposit=
ory.

- https://www.bbc.com/news/technology-53050955
- https://www.zdnet.com/article/github-to-replace-master-with-alternative-t=
erm-to-avoid-slavery-references/


Thank you!
=20
Derick Montague
FED Lead | OpenBMC Design Team Lead
Cognitive Systems User Experience

