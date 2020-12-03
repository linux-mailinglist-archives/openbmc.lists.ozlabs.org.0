Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DC92CE238
	for <lists+openbmc@lfdr.de>; Thu,  3 Dec 2020 23:56:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnB5x5TnVzDrM8
	for <lists+openbmc@lfdr.de>; Fri,  4 Dec 2020 09:56:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com;
 envelope-from=derick.montague@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=o6mxMAqp; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnB520lj0zDrHg
 for <openbmc@lists.ozlabs.org>; Fri,  4 Dec 2020 09:55:32 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B3MW9dC141563
 for <openbmc@lists.ozlabs.org>; Thu, 3 Dec 2020 17:55:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : subject :
 from : to : cc : date : references : content-type : message-id :
 content-transfer-encoding : mime-version; s=pp1;
 bh=HTk79Id4rmjTMHG/EorrMuhzSKlfXVxmeSiJGHTpfF8=;
 b=o6mxMAqpk5m84rvdGnLUcFsHTItavW/AwP65IWp52kIa8m3Iy77jAt3PF1V7S7jW8abA
 SFna+lHEehBd5j+Z3/m1nm47juNiG2vdloCTCqk+pxoVxPgw8nX+/FCf8y682ExHqArO
 ojn4kgrJ6dgDq6DqxzcS6qHFp6zyNAijaHZ1AzDGZsbIhuEJ4GhI0OQFu/U4U1/dg493
 JNW7rNI1X1A28fOrpPGNTN7PLUxiBMdt2ytyhOmcQ014SOhnMLSrQUmIHkCjDiuvt1es
 2CC0lOZtluPBvaPCq4y8TlC0zR7DVqwfmXNmiGzupiOUdkGNTRM1rJtm9AOUbaVk3sFD mA== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.112])
 by mx0a-001b2d01.pphosted.com with ESMTP id 357742k1uj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 03 Dec 2020 17:55:28 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Thu, 3 Dec 2020 22:55:27 -0000
Received: from us1b3-smtp03.a3dr.sjc01.isc4sb.com (10.122.7.173)
 by smtp.notes.na.collabserv.com (10.122.47.54) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 3 Dec 2020 22:55:26 -0000
Received: from us1b3-mail158.a3dr.sjc03.isc4sb.com ([10.160.174.218])
 by us1b3-smtp03.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020120322552542-863531 ;
 Thu, 3 Dec 2020 22:55:25 +0000 
In-Reply-To: <664a67f7de0f4402a9ec217d8c49c7e9@TWN-EXCHMB-13.phoenix.com>
Subject: Re: LDAP group privilege mapping does not exist
From: "Derick Montague" <Derick.Montague@ibm.com>
To: Venkata_Chandrappa@phoenix.com
Date: Thu, 3 Dec 2020 22:55:25 +0000
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <664a67f7de0f4402a9ec217d8c49c7e9@TWN-EXCHMB-13.phoenix.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 16891
X-TNEFEvaluated: 1
Content-Type: text/plain; charset=UTF-8
x-cbid: 20120322-4615-0000-0000-0000033070A6
X-IBM-SpamModules-Scores: BY=0.00133; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.388783; ST=0; TS=0; UL=0; ISC=; MB=0.000622
X-IBM-SpamModules-Versions: BY=3.00014305; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01472922; UDB=6.00793296; IPR=6.01255566; 
 MB=3.00035344; MTD=3.00000008; XFM=3.00000015; UTC=2020-12-03 22:55:27
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-12-03 17:13:46 - 6.00012110
x-cbparentid: 20120322-4616-0000-0000-000003FD7E68
Message-Id: <OFB52E8381.D86531F6-ON00258633.007D8D31-00258633.007DECA8@notes.na.collabserv.com>
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-03_12:2020-12-03,
 2020-12-03 signatures=0
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> Journal logs seem to indicate the mapping doesn=E2=80=99t exist, so I=E2=
=80=99m wondering if
> the role groups added in BMC web have been setup correctly.=20=20
=20=20=20
I can't speak to that, but we had tested role groups when the view was crea=
ted
and we were able to login and perform actions.=20=20
=20=20=20
> One more thing to note is when I added the role group, there was a 404 re=
sponse
> generated. However, on refreshing the page or navigating back to the page=
, the role
> group was added successfully.=20=20
=20=20=20
That was fixed in https://gerrit.openbmc-project.xyz/c/openbmc/webui-vue/+/=
38618. It was
a UI issue, but the API request was successful as you noticed by refreshing=
 the page.

