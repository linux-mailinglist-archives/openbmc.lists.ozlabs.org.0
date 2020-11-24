Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1552C3088
	for <lists+openbmc@lfdr.de>; Tue, 24 Nov 2020 20:12:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgYZ04WjyzDqYP
	for <lists+openbmc@lfdr.de>; Wed, 25 Nov 2020 06:12:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=derick.montague@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CMsPg69W; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgYY62WRmzDqVH
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2020 06:11:53 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AOJ2SYt145448
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2020 14:11:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : subject :
 from : to : date : mime-version : references : content-transfer-encoding :
 content-type : message-id; s=pp1;
 bh=f8DHOZ5Jz4+Q28FxcjmoATP2zMFIVTQjqwOniEv0l90=;
 b=CMsPg69WP/GdvAR78e8L2p1XVZvSokrKQTg4rai7RisD1XWv9PbHPVff1HY4ff5Lzrz0
 oKmGJq3KthjmBGw/GeToof1NOY0sqSIF59+nuc9T/Fc22TOad0AEghUTtKNot4GfUQwo
 CcR4ZJBzQrkAJInRmI4CbiKbSsuJ2CfCeYUGA5Mtj3kfjI07z83+1x+HRL93v68BDcVM
 w/oF/nfiga/AGcmndRpSCOPSXg7wjuUxtCPxD6iaqQNTXAnWSurz/CadypWu7wh5yB3M
 oKKJo9c12wiT0boCrG16PO3sdQOfG9ejKFNi0WPr/ShW18EmBIVRVXYvFI5MEp/DN6ns sQ== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.75])
 by mx0a-001b2d01.pphosted.com with ESMTP id 350rkpq8kb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2020 14:11:48 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Tue, 24 Nov 2020 19:11:48 -0000
Received: from us1a3-smtp06.a3.dal06.isc4sb.com (10.146.103.243)
 by smtp.notes.na.collabserv.com (10.106.227.123) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 24 Nov 2020 19:11:45 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp06.a3.dal06.isc4sb.com
 with ESMTP id 2020112419114454-683573 ;
 Tue, 24 Nov 2020 19:11:44 +0000 
In-Reply-To: <OF8B9C9502.B727E6AE-ON00258625.005EADD1-00258625.005EADD6@notes.na.collabserv.com>
Subject: Re: GUI Design Work Group - Wednesday11/25
From: "Derick Montague" <Derick.Montague@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Tue, 24 Nov 2020 19:11:45 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <OF8B9C9502.B727E6AE-ON00258625.005EADD1-00258625.005EADD6@notes.na.collabserv.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 60415
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20112419-6875-0000-0000-000003FE8660
X-IBM-SpamModules-Scores: BY=0.000014; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.082140
X-IBM-SpamModules-Versions: BY=3.00014248; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01468541; UDB=6.00790690; IPR=6.01251190; 
 MB=3.00035199; MTD=3.00000008; XFM=3.00000015; UTC=2020-11-24 19:11:46
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-11-24 10:14:06 - 6.00012084
x-cbparentid: 20112419-6876-0000-0000-000025B58C37
Message-Id: <OF25F63733.E25F0CF9-ON0025862A.006947E8-0025862A.0069722C@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-24_05:2020-11-24,
 2020-11-24 signatures=0
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

> Next weeks work group falls the day before a U.S. holiday and there will =
be
> many people off this week from the IBM team, including myself. Is anyone
> opposed to cancelling this work group?

The GUI Design Work Group is cancelled this week. See in in two weeks. =20
  =20
Thank you! =20
  =20

