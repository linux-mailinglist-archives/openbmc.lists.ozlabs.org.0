Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DCC21743F
	for <lists+openbmc@lfdr.de>; Tue,  7 Jul 2020 18:42:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1Ss21XhXzDqyw
	for <lists+openbmc@lfdr.de>; Wed,  8 Jul 2020 02:42:14 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1Sr002QxzDqsw
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jul 2020 02:41:17 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 067GWBNW117130
 for <openbmc@lists.ozlabs.org>; Tue, 7 Jul 2020 12:41:14 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.111])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3248ns38f5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 07 Jul 2020 12:41:13 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Tue, 7 Jul 2020 16:41:12 -0000
Received: from us1b3-smtp07.a3dr.sjc01.isc4sb.com (10.122.203.198)
 by smtp.notes.na.collabserv.com (10.122.47.52) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 7 Jul 2020 16:41:11 -0000
Received: from us1b3-mail158.a3dr.sjc03.isc4sb.com ([10.160.174.218])
 by us1b3-smtp07.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020070716411120-584517 ;
 Tue, 7 Jul 2020 16:41:11 +0000 
In-Reply-To: 
Subject: OpenBMC Design Workgroup - Wednesday 7/8 at 10:00 AM Central
From: "Derick Montague" <Derick.Montague@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Tue, 7 Jul 2020 16:41:10 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 27239
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20070716-3633-0000-0000-0000028D4DAC
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.415652; ST=0; TS=0; UL=0; ISC=; MB=0.004007
X-IBM-SpamModules-Versions: BY=3.00013424; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01402410; UDB=6.00751122; IPR=6.01184693; 
 MB=3.00032892; MTD=3.00000008; XFM=3.00000015; UTC=2020-07-07 16:41:12
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-07-07 14:32:09 - 6.00011572
x-cbparentid: 20070716-3634-0000-0000-0000F8834FF5
Message-Id: <OFDF9396A9.986814BA-ON0025859E.005B9753-0025859E.005BA903@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-07_08:2020-07-07,
 2020-07-07 signatures=0
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
Cc: jyundt@digitalocean.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

At tomorrow's workgroup, we would like to discuss a couple
of items to determine a way to upstream as much theming and
customization work as possible. This is around branding colors,
as well as the use of corporate logos. If your organization is
interested in this topic, please join us!

How to join and agenda can be found on the wiki page:

- https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group#070820

Conversations in Gerrit:

- https://gerrit.openbmc-project.xyz/c/openbmc/webui-vue/+/34157
- https://gerrit.openbmc-project.xyz/c/openbmc/webui-vue/+/34094

Thank you!

Derick Montague
FED Lead | OpenBMC Design Team Lead
Cognitive Systems User Experience

