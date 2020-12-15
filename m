Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA192DA57C
	for <lists+openbmc@lfdr.de>; Tue, 15 Dec 2020 02:18:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cw0lD6h82zDqHK
	for <lists+openbmc@lfdr.de>; Tue, 15 Dec 2020 12:18:48 +1100 (AEDT)
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
 header.s=pp1 header.b=X916HTKZ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cw0kQ4Df8zDq9p
 for <openbmc@lists.ozlabs.org>; Tue, 15 Dec 2020 12:18:04 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BF12Vpk165759
 for <openbmc@lists.ozlabs.org>; Mon, 14 Dec 2020 20:18:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : subject :
 from : to : cc : date : references : content-type : message-id :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Gw6Aj7Hy334brYqgoylsTjDleFS/vVCmXbuPJHH0WWg=;
 b=X916HTKZOZsv+YLVynVYGgN70JsKO/D2O24qyZyNqJxBlnN7cTcnvMmw2wxOyA/CbI2G
 cPE4VwOk6Sdg5rqTLaVibQCo3em3ZZa6NedRSxVQnTkwy1KPwopSgdQQG8M9/K4HBLAV
 9B590tDbKkw5mKuFCetiVx8HxouxZnL8UpnCeCYbF7Zwa2EV9PNJK8jKIAFROLZiDqTP
 VP+zxxy7LUhZh3bb7enH8APzv3G/yYIcUIiz0Zzb+6lunZfxkD/tY3Ei96rYnao7CyRe
 1UAGKtiL4QKQbiDRtnCAV6Gad6wbAAclvdBHUQfOKji9oKEvUR60E57GnkzL2v4KZBZM Bw== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.112])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35ejdfs5be-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 14 Dec 2020 20:18:01 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Tue, 15 Dec 2020 01:18:01 -0000
Received: from us1b3-smtp06.a3dr.sjc01.isc4sb.com (10.122.203.184)
 by smtp.notes.na.collabserv.com (10.122.47.54) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 15 Dec 2020 01:17:59 -0000
Received: from us1b3-mail158.a3dr.sjc03.isc4sb.com ([10.160.174.218])
 by us1b3-smtp06.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020121501175875-821027 ;
 Tue, 15 Dec 2020 01:17:58 +0000 
In-Reply-To: <0ad15fe63a1346c4a2c1f16b7f791b8a@SCL-EXCHMB-13.phoenix.com>
Subject: Re: External interface for SNMP configuration
From: "Derick Montague" <Derick.Montague@ibm.com>
To: Patrick_Voelker@phoenix.com
Date: Tue, 15 Dec 2020 01:17:58 +0000
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <0ad15fe63a1346c4a2c1f16b7f791b8a@SCL-EXCHMB-13.phoenix.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 17787
X-TNEFEvaluated: 1
Content-Type: text/plain; charset=UTF-8
x-cbid: 20121501-4615-0000-0000-0000033C741A
X-IBM-SpamModules-Scores: BY=0.001431; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.388783; ST=0; TS=0; UL=0; ISC=; MB=0.088000
X-IBM-SpamModules-Versions: BY=3.00014375; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01478223; UDB=6.00796440; IPR=6.01260830; 
 MB=3.00035501; MTD=3.00000008; XFM=3.00000015; UTC=2020-12-15 01:17:59
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-12-14 15:10:02 - 6.00012140
x-cbparentid: 20121501-4616-0000-0000-000004167742
Message-Id: <OF24498231.13A255A1-ON0025863F.0006D855-0025863F.000723B1@notes.na.collabserv.com>
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-14_13:2020-12-11,
 2020-12-14 signatures=0
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

> I tried the old REST interface and am just getting "Not Found" in return.
>
> Is there any external interface that I can use in the meantime while wait=
ing for the new support?

I can't answer the question about the REST API response, but we are hoping =
for this to be done soon.
The Gerrit review is https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/=
38599
=20
=20

