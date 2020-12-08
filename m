Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A962D3575
	for <lists+openbmc@lfdr.de>; Tue,  8 Dec 2020 22:40:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrD9V4kktzDqjY
	for <lists+openbmc@lfdr.de>; Wed,  9 Dec 2020 08:39:58 +1100 (AEDT)
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
 header.s=pp1 header.b=gzBysYHm; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrD8c3JHXzDqgp
 for <openbmc@lists.ozlabs.org>; Wed,  9 Dec 2020 08:39:11 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B8La5H2079755
 for <openbmc@lists.ozlabs.org>; Tue, 8 Dec 2020 16:39:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : subject :
 from : to : date : references : content-type : message-id :
 content-transfer-encoding : mime-version; s=pp1;
 bh=hrvUqZR/owWdrzlezfzXl48qvlsJ2k9hk3X7jXqdS7I=;
 b=gzBysYHm9AxSPdXGJfQEJKYoB5SIR44yhMY8xdP75fB1/ZeV6jkqj+WlxugrOZjRM/WX
 ylG1boUChl3cH1mVIptD5PbiSAZqZl6mVA8sWqHW2Wi1zYHrA46CIE+y11pz6t8m+qgP
 gqwlJNC+fqoGtNZQ90rEA/l7yi3Zt6Jf+HBG5ZWx3X0x3AAmYhyQzA7UiSjelyE5ZqV5
 ge+HMDnyQgTmWjeFCvRmGtwlBCUH04me1FC1G+zG/7HTt4f3GNg4qHW+rBf9nzr2+xe+
 AYYMdVMk8VPmeJLvSXXgj8AWGIfsnDPUVL8bS933GoSOtSI9K3yXJFilO8CHUBOuoO9S Pw== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.81])
 by mx0a-001b2d01.pphosted.com with ESMTP id 359d5q8fah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 08 Dec 2020 16:39:09 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Tue, 8 Dec 2020 21:39:08 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 8 Dec 2020 21:39:07 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2020120821390631-786085 ;
 Tue, 8 Dec 2020 21:39:06 +0000 
In-Reply-To: 
Subject: GUI Design Work Group - Wednesday, 12/09/20 at 10:00 AM CT
From: "Derick Montague" <Derick.Montague@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Tue, 8 Dec 2020 21:39:06 +0000
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 7675
X-TNEFEvaluated: 1
Content-Type: text/plain; charset=UTF-8
x-cbid: 20120821-3067-0000-0000-000004BD9C84
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.394815; ST=0; TS=0; UL=0; ISC=; MB=0.000229
X-IBM-SpamModules-Versions: BY=3.00014337; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01475278; UDB=6.00794696; IPR=6.01257908; 
 MB=3.00035414; MTD=3.00000008; XFM=3.00000015; UTC=2020-12-08 21:39:08
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-12-08 17:41:08 - 6.00012123
x-cbparentid: 20120821-3068-0000-0000-0000D9A032C9
Message-Id: <OF8DE8698B.4C820510-ON00258638.0076EFA4-00258638.0076EFBF@notes.na.collabserv.com>
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-08_15:2020-12-08,
 2020-12-08 signatures=0
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

Please join us for the GUI Design Work Group if you are interested in the f=
ollowing items:

Information Architecture
- Discuss potential changes to accommodate scalability
- Determine what changes could be shared and what changes may need to be cu=
stomize

FW Update=20
- Is it possible to have a backend notification of the requirement to shut =
down host
- IBM will be using eMMC flash and which will require both the host  and BM=
C FW images to
  be uploaded. Expectation is that backend is in place  for other organizat=
ions
=20
Meeting info: https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group=
#meeting-info

Thank you!
=20
Derick Montague
IBM Cognitive Systems User Experience

