Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A27DF9F17E
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 19:24:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Hwjf0qNpzDqXZ
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2019 03:24:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=miltonm@us.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Hwhz6CDqzDqFh
 for <openbmc@lists.ozlabs.org>; Wed, 28 Aug 2019 03:24:19 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7RHHc60139471
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 13:24:15 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.90])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2un743dj5j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 13:24:15 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 27 Aug 2019 17:24:14 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 27 Aug 2019 17:24:10 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2019082717241006-753656 ;
 Tue, 27 Aug 2019 17:24:10 +0000 
In-Reply-To: <MN2PR04MB6669921B935ABDEC69C6DB6ECDA00@MN2PR04MB6669.namprd04.prod.outlook.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Zheng Bao <fishbaoz@hotmail.com>
Date: Tue, 27 Aug 2019 17:24:10 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <MN2PR04MB6669921B935ABDEC69C6DB6ECDA00@MN2PR04MB6669.namprd04.prod.outlook.com>
X-Mailer: IBM iNotes ($HaikuForm 1054) | IBM Domino Build
 SCN1812108_20180501T0841_FP57 August 05, 2019 at 12:42
X-LLNOutbound: False
X-Disclaimed: 64427
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 19082717-3649-0000-0000-0000006B0135
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.002737
X-IBM-SpamModules-Versions: BY=3.00011667; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01252916; UDB=6.00661697; IPR=6.01034514; 
 MB=3.00028360; MTD=3.00000008; XFM=3.00000015; UTC=2019-08-27 17:24:13
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-08-27 17:02:39 - 6.00010337
x-cbparentid: 19082717-3650-0000-0000-00000099254B
Message-Id: <OF57E3A1EC.B5D71CB2-ON00258463.005F98C0-00258463.005F98C9@notes.na.collabserv.com>
Subject: Re:  KCS ipmi interface doesnt work
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-27_03:, , signatures=0
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On August 27, 2019 around 5AM in some timezone, Zheng Bao wrote:

>     =20
> Hi, All,=20
> My server BIOS tries to send ipmi command "self test", but openbmc(
>I tried Zaius)  doesn't response.=20
>=20
> =20
> Is this right? Or how can I debug this? Thanks.=20
>=20

Zaius is an OpenPower machine.  OpenPower is using the bt (block
transfer) device on the lpc bus to comunicate with the host for
IPMI and does not use the KCS protocol or the keyboard device.

Someone else can suggest a better platform to copy the
IPMI configuration to use KCS.

milton

