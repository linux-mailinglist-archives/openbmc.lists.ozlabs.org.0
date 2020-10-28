Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C054F29D264
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 22:18:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CM1dn6byNzDqg4
	for <lists+openbmc@lfdr.de>; Thu, 29 Oct 2020 08:18:37 +1100 (AEDT)
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
 header.s=pp1 header.b=UPnZnZW/; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CM13g3mphzDqWZ
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2020 07:52:30 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09SKW1Fw019436
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2020 16:52:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : subject :
 from : to : cc : date : references : content-type : message-id :
 content-transfer-encoding : mime-version; s=pp1;
 bh=02E373HAKryE1+iVIuiF1VGZnieQhEajDNcfDFi18YY=;
 b=UPnZnZW/l1qfCZES7LJvo7qdsaOESA2UUY27YfkHzdWnr2jdHqTH2VnGTc4Ql++a2T1v
 dRJrDiWRMFIu+lxGsCgquZp6zcrDZUUznOIW+O6hlAw0W76zJChXFe/wLW17Qqr9Qk5N
 DW7q/zEL5NPHCyAFiTM0xwVZHnHZCa4h10Qb/FhNOc2AGEzv6XH8jSLSMjCCG2W66vYC
 qCki6tz2lRTm8LupnOpIv5eMyOVgTnUqlX4CTchu3pDa3YLg06hmiJlnSrhEV6OFunUr
 y7qXljtQIrVUAqgt+lMnCf4m1vO5lcBDg8pXbfYGvdlT6IQR88jKO2Uc8oaUQnyi9JP6 Fg== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.75])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34d97j1avc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2020 16:52:27 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Wed, 28 Oct 2020 20:52:26 -0000
Received: from us1a3-smtp08.a3.dal06.isc4sb.com (10.146.103.57)
 by smtp.notes.na.collabserv.com (10.106.227.123) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 28 Oct 2020 20:52:24 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp08.a3.dal06.isc4sb.com
 with ESMTP id 2020102820522409-736189 ;
 Wed, 28 Oct 2020 20:52:24 +0000 
In-Reply-To: <40cd49cc097b4befb30465c782be3a26@SCL-EXCHMB-13.phoenix.com>
Subject: Re: With webui-vue Firmware version on Overview vs Hardware status BMC
 manager not always matching.
From: "Derick Montague" <Derick.Montague@ibm.com>
To: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
Date: Wed, 28 Oct 2020 20:52:23 +0000
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <40cd49cc097b4befb30465c782be3a26@SCL-EXCHMB-13.phoenix.com>,
 <2332af3cb404478cbd7bc0902167c7ea@SCL-EXCHMB-13.phoenix.com>
 <OF96903A57.FBB55CE2-ON0025860F.0060C60B-0025860F.00629E7F@notes.na.collabserv.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 9375
X-TNEFEvaluated: 1
Content-Type: text/plain; charset=UTF-8
x-cbid: 20102820-6875-0000-0000-000003D2B4E9
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.421684; ST=0; TS=0; UL=0; ISC=; MB=0.000948
X-IBM-SpamModules-Versions: BY=3.00014095; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01455845; UDB=6.00783148; IPR=6.01238527; 
 MB=3.00034746; MTD=3.00000008; XFM=3.00000015; UTC=2020-10-28 20:52:25
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-10-28 16:11:37 - 6.00012008
x-cbparentid: 20102820-6876-0000-0000-0000256ABC63
Message-Id: <OFDAC419AA.680D743E-ON0025860F.0072895A-0025860F.0072A8FD@notes.na.collabserv.com>
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 2 URL's were un-rewritten
MIME-Version: 1.0
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> Derick, I am not seeing a real difference between Romulus and Phoenix her=
e.
>=20
> Screen shots again.

> Romulus Redfish FirmwareInventory
> https://bmc-bruce.github.io/Romulus_Redfish_FirmwareInventory.png=20

> Phoenix Redfish FirmwareInventory
> https://bmc-bruce.github.io/Phoenix_Redfish_FirmwareInventory.png=20

Can you look at each of those item's inventory? We are making at request an=
d getting
the version from there. Here is the code in GitHub. We are grabbing the pat=
h in the @odata.id
and making a request to get the FW data.

https://github.com/openbmc/webui-vue/blob/a04d46f7cad356da22d794e994195e801=
f5998b7/src/store/modules/Configuration/FirmwareStore.js#L42

