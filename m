Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE6029D6FC
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 23:20:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CM30Y6Lb7zDqXJ
	for <lists+openbmc@lfdr.de>; Thu, 29 Oct 2020 09:19:57 +1100 (AEDT)
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
 header.s=pp1 header.b=akl6k/m3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CM2yf0DnFzDqXB
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2020 09:18:16 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09SM24Y0107602
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2020 18:18:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : subject :
 from : to : date : mime-version : references : content-transfer-encoding :
 content-type : message-id; s=pp1;
 bh=uIaplkeVfMNtqmLwRYKCAI/m22RlUuN8Be1wwKnHVlA=;
 b=akl6k/m3/sjnth/06mQ/X1Ga23TUtPRYkAcsrGPaXYCzaXV/+ahuPv5kjbOGYxF3AVj2
 4ixNewtPkpFBOeRaJ7cqXaw+OeKZlLXkVnTMgYNRhsez50HmvaCbzn5pFwC6HRwzhloH
 /bXheusptJMCbJhCD+b6ABeXQF6PsVEhJMbRKLXhNqDg54AfpQOfnQDH1VHR256x0f/u
 ydP9HfZ4ZnswACNC+KAQpbZzpSi0U4vu6fjctVgaTyHEpX0Kx/E4PiKjaPZVpDgLXy54
 RRR9XMHvY7iFW0vflBZlx/lxMENSEVlBzPnaPx5o0MvM/kesUzNV9QWs6wZ+KW5sv5c3 TA== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.73])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34fd2dqrdu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2020 18:18:12 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Wed, 28 Oct 2020 22:18:11 -0000
Received: from us1a3-smtp07.a3.dal06.isc4sb.com (10.146.103.14)
 by smtp.notes.na.collabserv.com (10.106.227.90) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 28 Oct 2020 22:18:10 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp07.a3.dal06.isc4sb.com
 with ESMTP id 2020102822180954-801932 ;
 Wed, 28 Oct 2020 22:18:09 +0000 
In-Reply-To: 
Subject: Firmware Update - Single File Upload
From: "Derick Montague" <Derick.Montague@ibm.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Date: Wed, 28 Oct 2020 22:18:09 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 48415
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20102822-8877-0000-0000-000004CECD21
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.415652; ST=0; TS=0; UL=0; ISC=; MB=0.101628
X-IBM-SpamModules-Versions: BY=3.00014095; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01455874; UDB=6.00783164; IPR=6.01238556; 
 MB=3.00034747; MTD=3.00000008; XFM=3.00000015; UTC=2020-10-28 22:18:11
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-10-28 21:23:41 - 6.00012009
x-cbparentid: 20102822-8878-0000-0000-0000F402D5A7
Message-Id: <OFAF28317F.F38BF613-ON0025860F.00792E84-0025860F.007A831D@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-28_09:2020-10-28,
 2020-10-28 signatures=0
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

At today's GUI Design Work Group, a use case was presented about single fil=
e upload.
The use case was that the only update required was a BMC update. In this ca=
se, would
the host need be powered down to apply the update?

Thanks!
Derick Montague
IBM Cognitive Systems User Experience

