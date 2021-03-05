Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 623FE32F692
	for <lists+openbmc@lfdr.de>; Sat,  6 Mar 2021 00:25:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DskNm31THz3cKp
	for <lists+openbmc@lfdr.de>; Sat,  6 Mar 2021 10:25:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=myGqMZBv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=derick.montague@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=myGqMZBv; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DskNT2V7Sz30NW
 for <openbmc@lists.ozlabs.org>; Sat,  6 Mar 2021 10:24:56 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 125NDlXq037416
 for <openbmc@lists.ozlabs.org>; Fri, 5 Mar 2021 18:24:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : mime-version : references : content-transfer-encoding :
 content-type : message-id : subject; s=pp1;
 bh=hfB+bB1mMXG4Xei+63OdXweLPDaytuUOgZgGedqJrAI=;
 b=myGqMZBvt/lZlD1LyTraLYiLAV1/C+3I4TybvL4nlsnbIbHP4U9hXTRYmbxhHpliuG39
 k2/lPM1kvxKHa04UIwN6v6o7JuWhsksFIxUaVJtbYywaVLn9vKi0XhaasP2Z0VX2ia2c
 g7/nkeUMu99IeauoeZ8H+/mpcrW/FO7wMEDYjw4XnbSf6Dwt0Wq9djd7d2Z7EU3N3k9J
 MwjcQQEAyG7o6ESlK1qmgn+SMgud8oLnJaHkTKaxrvMdn2xgA7bWFSuCoW9zydKAZZ1J
 0BRB819neX63K01m94eQP9ukEevVR0CFce99wFSRoPoBe7UWnLM4YBTSoOn/p3/jcN/h Zg== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.113])
 by mx0a-001b2d01.pphosted.com with ESMTP id 373x4hr681-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 05 Mar 2021 18:24:53 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Fri, 5 Mar 2021 23:24:53 -0000
Received: from us1b3-smtp01.a3dr.sjc01.isc4sb.com (10.122.7.174)
 by smtp.notes.na.collabserv.com (10.122.47.56) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 5 Mar 2021 23:24:51 -0000
Received: from us1b3-mail158.a3dr.sjc03.isc4sb.com ([10.160.174.218])
 by us1b3-smtp01.a3dr.sjc01.isc4sb.com
 with ESMTP id 2021030523245082-862514 ;
 Fri, 5 Mar 2021 23:24:50 +0000 
In-Reply-To: <CACWQX80qvHZ2HSvmgeLcJ_X5ZYwRDb-6cw6nOKb6qd_9V971FQ@mail.gmail.com>
From: "Derick Montague" <Derick.Montague@ibm.com>
To: ed@tanous.net
Date: Fri, 5 Mar 2021 23:24:51 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <CACWQX80qvHZ2HSvmgeLcJ_X5ZYwRDb-6cw6nOKb6qd_9V971FQ@mail.gmail.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP130 January 13, 2021 at 14:04
X-LLNOutbound: False
X-Disclaimed: 4711
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 21030523-7691-0000-0000-00000E7E633C
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0; SC=0;
 ST=0; TS=0; UL=0; ISC=; MB=0.000643
X-IBM-SpamModules-Versions: BY=3.00014826; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000296; SDB=6.01515835; UDB=6.00818898; IPR=6.01298352; 
 MB=3.00036306; MTD=3.00000008; XFM=3.00000015; UTC=2021-03-05 23:24:52
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2021-03-03 13:15:12 - 6.00012344
x-cbparentid: 21030523-7692-0000-0000-00002F8167DE
Message-Id: <OFE48BADA9.7DEA6041-ON0025868F.008040B6-0025868F.00809E34@notes.na.collabserv.com>
Subject: RE: No option to delete SSL certificates
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-05_16:2021-03-03,
 2021-03-05 signatures=0
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
Cc: openbmc@lists.ozlabs.org, Jayanth Othayoth <ojayanth@in.ibm.com>,
 Devender Rao <devenrao@in.ibm.com>, mohammed.habeeb@inventec.com,
 gmills@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

=20
> I can't explain why the TrustStore certificate isn't deletable, that seem=
s like a bug in webui-vue. =20
  =20
That is the only certificate type that can be deleted.

https://github.com/openbmc/webui-vue/blob/d6752694d31362bd42c3cbb51a35d36fa=
2bc25e1/src/views/AccessControl/SslCertificates/SslCertificates.vue#L179-L1=
84

