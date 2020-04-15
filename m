Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8101AA8CB
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 15:40:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492NlP0lFbzDr4M
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 23:40:17 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 492NkJ1tYtzDqwW
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 23:39:19 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03FDXkAo077319
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 09:39:16 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.93])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30dnnfnyx3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 09:39:16 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Wed, 15 Apr 2020 13:39:14 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.39) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 15 Apr 2020 13:39:12 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2020041513391192-499179 ;
 Wed, 15 Apr 2020 13:39:11 +0000 
In-Reply-To: 
Subject: Web UI (GUI) Design Workgroup today - 10:00 AM Central
From: "Derick Montague" <Derick.Montague@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Wed, 15 Apr 2020 13:39:11 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP64 March 05, 2020 at 12:58
X-LLNOutbound: False
X-Disclaimed: 5755
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20041513-8889-0000-0000-0000026E2A38
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.415652; ST=0; TS=0; UL=0; ISC=; MB=0.001776
X-IBM-SpamModules-Versions: BY=3.00012915; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000293; SDB=6.01362803; UDB=6.00727635; IPR=6.01145170; 
 MB=3.00031712; MTD=3.00000008; XFM=3.00000015; UTC=2020-04-15 13:39:13
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-04-15 07:14:16 - 6.00011244
x-cbparentid: 20041513-8890-0000-0000-0000638F5D93
Message-Id: <OF9721AD5A.332CA97D-ON0025854B.004AFFE5-0025854B.004AFFEB@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-15_04:2020-04-14,
 2020-04-15 signatures=0
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

We have a Web UI Design workgroup today. Our main discussion topic
will be the feature toggle proposal that allows organizations to=20
determine what UI features are available for their GUI.

=20
Derick Montague
FED Lead | OpenBMC Design Team Lead
Cognitive Systems User Experience

