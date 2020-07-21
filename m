Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E46228C75
	for <lists+openbmc@lfdr.de>; Wed, 22 Jul 2020 01:06:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBDkD2ZXWzDqf3
	for <lists+openbmc@lfdr.de>; Wed, 22 Jul 2020 09:06:44 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBDjR6k2RzDqcy
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jul 2020 09:06:03 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06LN3pnl153992
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jul 2020 19:06:00 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.93])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32e1vv5ue8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jul 2020 19:05:59 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Tue, 21 Jul 2020 23:05:59 -0000
Received: from us1a3-smtp06.a3.dal06.isc4sb.com (10.146.103.243)
 by smtp.notes.na.collabserv.com (10.106.227.39) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 21 Jul 2020 23:05:57 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp06.a3.dal06.isc4sb.com
 with ESMTP id 2020072123055653-862124 ;
 Tue, 21 Jul 2020 23:05:56 +0000 
In-Reply-To: 
Subject: GUI Design Workgroup - Wednesday 7/22/20 at 10:00 AM CDT
From: "Derick Montague" <Derick.Montague@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Tue, 21 Jul 2020 23:05:56 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 43035
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20072123-8889-0000-0000-0000032AC066
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.415652; ST=0; TS=0; UL=0; ISC=; MB=0.003508
X-IBM-SpamModules-Versions: BY=3.00013510; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01409186; UDB=6.00755131; IPR=6.01191427; 
 MB=3.00033121; MTD=3.00000008; XFM=3.00000015; UTC=2020-07-21 23:05:58
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-07-21 20:08:45 - 6.00011628
x-cbparentid: 20072123-8890-0000-0000-0000ACB1C984
Message-Id: <OF267B7054.D7CD8C1D-ON002585AC.007E7778-002585AC.007EE2EA@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-21_15:2020-07-21,
 2020-07-21 signatures=0
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

At tomorrow's workgroup, we are planning to review:


1. KVM - https://github.com/openbmc/webui-vue/issues/6#issuecomment-6621294=
47
2. Custom theming upstream - https://gerrit.openbmc-project.xyz/c/openbmc/w=
ebui-vue/+/34507
3. Adding logos upstream - https://gerrit.openbmc-project.xyz/c/openbmc/web=
ui-vue/+/34094 (merged)

If your organization is interested in this topic, please join us!


How to join and agenda can be found on the wiki page:
- https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group


Special thanks to Intel for all the contributions to the Vue Rewrite!


Derick Montague
FED Lead | OpenBMC Design Team Lead
Cognitive Systems User Experience

