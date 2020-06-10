Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 446DD1F55BD
	for <lists+openbmc@lfdr.de>; Wed, 10 Jun 2020 15:26:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hnn973cfzDqgr
	for <lists+openbmc@lfdr.de>; Wed, 10 Jun 2020 23:26:05 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hnls2fXZzDqgr
 for <openbmc@lists.ozlabs.org>; Wed, 10 Jun 2020 23:24:56 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05AD49vd044709
 for <openbmc@lists.ozlabs.org>; Wed, 10 Jun 2020 09:24:54 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31k02srntr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 10 Jun 2020 09:24:54 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Wed, 10 Jun 2020 13:24:53 -0000
Received: from us1b3-smtp05.a3dr.sjc01.isc4sb.com (10.122.203.183)
 by smtp.notes.na.collabserv.com (10.122.47.39) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 10 Jun 2020 13:24:51 -0000
Received: from us1b3-mail158.a3dr.sjc03.isc4sb.com ([10.160.174.218])
 by us1b3-smtp05.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020061013244994-440296 ;
 Wed, 10 Jun 2020 13:24:49 +0000 
In-Reply-To: <OF123D71B8.0538A973-ON00258575.004E3D2F-00258575.004E3D34@LocalDomain>
Subject: GUI Design Workgroup - Today at 10:00 AM Central
From: "Derick Montague" <Derick.Montague@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Wed, 10 Jun 2020 13:24:50 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <OF123D71B8.0538A973-ON00258575.004E3D2F-00258575.004E3D34@LocalDomain>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 7511
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20061013-6283-0000-0000-000001A321E4
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.394815; ST=0; TS=0; UL=0; ISC=; MB=0.000035
X-IBM-SpamModules-Versions: BY=3.00013262; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01389497; UDB=6.00743439; IPR=6.01171774; 
 MB=3.00032537; MTD=3.00000008; XFM=3.00000015; UTC=2020-06-10 13:24:52
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-06-10 12:43:09 - 6.00011467
x-cbparentid: 20061013-6284-0000-0000-000001D92459
Message-Id: <OFE9E6A700.9D717113-ON00258583.004978D5-00258583.0049AF93@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-10_07:2020-06-10,
 2020-06-10 signatures=0
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


We have a workgroup this morning. The meeting agenda today includes:


1. Demo of working Web UI progress and WIP
    - Review GUI Automation Test Hooks
    - Review Contributions documentation progress
2. Help wanted items
3. Design Review items


Visit the wiki page for details for joining the meeting.
OpenBMC GUI Design Workgroup Wiki: https://github.com/openbmc/openbmc/wiki/=
GUI-Design-work-group


Derick Montague
FED Lead | OpenBMC Design Team Lead
Cognitive Systems User Experience

