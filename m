Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 623A611BF0F
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2019 22:22:33 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Y8yn5d7yzDqn4
	for <lists+openbmc@lfdr.de>; Thu, 12 Dec 2019 08:22:25 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Y8xM01njzDqlW
 for <openbmc@lists.ozlabs.org>; Thu, 12 Dec 2019 08:21:06 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBBLFpxo024153
 for <openbmc@lists.ozlabs.org>; Wed, 11 Dec 2019 16:20:56 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.81])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wtbt2kbha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 11 Dec 2019 16:20:56 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Wed, 11 Dec 2019 21:20:56 -0000
Received: from us1a3-smtp07.a3.dal06.isc4sb.com (10.146.103.14)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 11 Dec 2019 21:20:51 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp07.a3.dal06.isc4sb.com
 with ESMTP id 2019121121205155-892255 ;
 Wed, 11 Dec 2019 21:20:51 +0000 
In-Reply-To: <CAMTupoSUX641CPqrmekdEj4V1bE4GT-EGkxrf229jBi8O_QTbw@mail.gmail.com>
From: "Derick Montague" <Derick.Montague@ibm.com>
To: jandraara@gmail.com
Date: Wed, 11 Dec 2019 21:20:51 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <CAMTupoSUX641CPqrmekdEj4V1bE4GT-EGkxrf229jBi8O_QTbw@mail.gmail.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-LLNOutbound: False
X-Disclaimed: 15303
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 19121121-3067-0000-0000-000001C2875D
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.048060
X-IBM-SpamModules-Versions: BY=3.00012227; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01302958; UDB=6.00691996; IPR=6.01085243; 
 MB=3.00029928; MTD=3.00000008; XFM=3.00000015; UTC=2019-12-11 21:20:54
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-12-11 19:37:43 - 6.00010753
x-cbparentid: 19121121-3068-0000-0000-000052098A4B
Message-Id: <OF857BE13A.068596C0-ON002584CD.00748200-002584CD.0075442A@notes.na.collabserv.com>
Subject: Re:  GUI Mockups - IBM proposal
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-11_07:2019-12-11,2019-12-11 signatures=0
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

> We realize this is an IBM centric design, and are looking forward to seei=
ng what components of this we can agree on to be merged upstream, and which=
 will have to be left for downstream theming.=20
=20
I believe our goal is to find a base design that does not look like IBM or =
Intel. This will allow any company to use the design without change if desi=
red. Bootstrap out of the box will not be polished enough. The Vue rewrite =
will implement Bootsrap correctly in order to leverage custom theming. To u=
tilize custom theming in the existing GUI, we would need to overhaul most o=
f the application to implement Bootstrap correctly to meet this same need.

