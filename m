Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFB416388E
	for <lists+openbmc@lfdr.de>; Wed, 19 Feb 2020 01:32:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Mdvg2nsGzDqdM
	for <lists+openbmc@lfdr.de>; Wed, 19 Feb 2020 11:31:59 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Mdtz1m9hzDqWt
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 11:31:21 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01J0RsNe127511
 for <openbmc@lists.ozlabs.org>; Tue, 18 Feb 2020 19:31:19 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y6dnu73au-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 18 Feb 2020 19:31:19 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Wed, 19 Feb 2020 00:31:18 -0000
Received: from us1b3-smtp08.a3dr.sjc01.isc4sb.com (10.122.203.190)
 by smtp.notes.na.collabserv.com (10.122.47.39) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 19 Feb 2020 00:31:16 -0000
Received: from us1b3-mail158.a3dr.sjc03.isc4sb.com ([10.160.174.218])
 by us1b3-smtp08.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020021900311650-957132 ;
 Wed, 19 Feb 2020 00:31:16 +0000 
In-Reply-To: 
Subject: OpenBMC GUI Design Workgroup - Wednesday 2/19/20 - 10:00 AM CST
From: "Derick Montague" <Derick.Montague@ibm.com>
To: "OpenBMC Maillist" <openbmc@lists.ozlabs.org>
Date: Wed, 19 Feb 2020 00:31:16 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-LLNOutbound: False
X-Disclaimed: 64887
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20021900-6283-0000-0000-000000F112A1
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.394815; ST=0; TS=0; UL=0; ISC=; MB=0.000149
X-IBM-SpamModules-Versions: BY=3.00012599; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01335927; UDB=6.00711681; IPR=6.01118287; 
 MB=3.00030863; MTD=3.00000008; XFM=3.00000015; UTC=2020-02-19 00:31:18
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-02-18 21:49:09 - 6.00011021
x-cbparentid: 20021900-6284-0000-0000-000000B53A58
Message-Id: <OF82387C19.F982E0BB-ON00258513.0002DCFF-00258513.0002DD02@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-18_08:2020-02-18,
 2020-02-18 signatures=0
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



Hello,

There is a workgroup tomorrow morning. We will be covering the following it=
ems:=20

1. Small screen navigation demo
2. Documentation progress and opportunities for reviews
3. Q & A

Please see the wiki for meeting information. https://github.com/openbmc/ope=
nbmc/wiki/GUI-Design-work-group

Thank you!
Derick Montague

