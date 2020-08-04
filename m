Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8032423C208
	for <lists+openbmc@lfdr.de>; Wed,  5 Aug 2020 01:05:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLr2X3hyZzDqRJ
	for <lists+openbmc@lfdr.de>; Wed,  5 Aug 2020 09:05:40 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLr1h6pwNzDqLR
 for <openbmc@lists.ozlabs.org>; Wed,  5 Aug 2020 09:04:55 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 074N30Rn096945
 for <openbmc@lists.ozlabs.org>; Tue, 4 Aug 2020 19:04:52 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.90])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32qcxhwv37-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 04 Aug 2020 19:04:52 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Tue, 4 Aug 2020 23:04:51 -0000
Received: from us1a3-smtp06.a3.dal06.isc4sb.com (10.146.103.243)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 4 Aug 2020 23:04:49 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp06.a3.dal06.isc4sb.com
 with ESMTP id 2020080423044849-859879 ;
 Tue, 4 Aug 2020 23:04:48 +0000 
In-Reply-To: <OF267B7054.D7CD8C1D-ON002585AC.007E7778-002585AC.007EE2EA@notes.na.collabserv.com>
Subject: GUI Design Work Group - Wednesday 08/05/20 at 10:00 AM CDT
From: "Derick Montague" <Derick.Montague@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Tue, 4 Aug 2020 23:04:48 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <OF267B7054.D7CD8C1D-ON002585AC.007E7778-002585AC.007EE2EA@notes.na.collabserv.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 32855
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20080423-3649-0000-0000-00000392B4FB
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.415652; ST=0; TS=0; UL=0; ISC=; MB=0.017831
X-IBM-SpamModules-Versions: BY=3.00013595; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01415709; UDB=6.00759116; IPR=6.01198122; 
 MB=3.00033358; MTD=3.00000008; XFM=3.00000015; UTC=2020-08-04 23:04:50
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-08-04 19:04:43 - 6.00011683
x-cbparentid: 20080423-3650-0000-0000-00006E11B90F
Message-Id: <OF1CFEA419.18EC8F04-ON002585BA.007E4F43-002585BA.007EC857@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-04_04:2020-08-03,
 2020-08-04 signatures=0
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

At tomorrow's work group, we are planning to discuss: =20

- Adding "System Name" back to the GUI header - System name vs Host name
- Process for sharing progress on GUI designs with community members
- Server LED layout - https://github.com/openbmc/webui-vue/issues/18 (
- Button styles on Local user management page -https://github.com/openbmc/w=
ebui-vue/issues/12
- Help wanted items
- Design Review items
- Demo of working Web UI

=20
Go to the GUI Design Work Group Wiki page for information on how
to join the meeting.=20

https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group

Derick Montague
FED Lead | OpenBMC Design Team Lead
Cognitive Systems User Experience
    =20
  =20

