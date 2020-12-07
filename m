Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 415CA2D149C
	for <lists+openbmc@lfdr.de>; Mon,  7 Dec 2020 16:26:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqRwq3J4XzDqTK
	for <lists+openbmc@lfdr.de>; Tue,  8 Dec 2020 02:26:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=anwQ7vV3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqRvl0NfWzDqTK
 for <openbmc@lists.ozlabs.org>; Tue,  8 Dec 2020 02:25:21 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B7FFm9o184644
 for <openbmc@lists.ozlabs.org>; Mon, 7 Dec 2020 10:25:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : mime-version : references : content-transfer-encoding :
 content-type : message-id : subject; s=pp1;
 bh=oM3ZNMJKcTo1Z9fT0YN8/027L07eD7i1IGXQngPnVHk=;
 b=anwQ7vV3Hq25a56PpSBZWJ7PqhVYxgBcJb5OsYci98tluvLsKtku+4CbZf63v5bB+8v3
 YSDjkhuInU06By6xOvFMINTZysv8Kf1hbPcU+92JxrHJ66dvWpZDqs5Nfz3AmKCpZtXX
 eeXhOEmSij4MmSeAR7bYCDYNxEvVu63fn9Z2CN5tHEG4m96mFZvfzb7AXURLyCkEPUHr
 G2OlD1O9f7/etBxvphB6baKRTB2PHUWQnDD2MjjJOY+lMySHOGbBX7rNkdYx7czMTsFm
 2+N3qR8J2yDje4oZOTxzjg6keFzPymwinREOoZr+LcxTymrVkMLA5vdMmVLzVKE7j6mE Pw== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.90])
 by mx0a-001b2d01.pphosted.com with ESMTP id 359pvrrchw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 07 Dec 2020 10:25:19 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Mon, 7 Dec 2020 15:25:19 -0000
Received: from us1a3-smtp08.a3.dal06.isc4sb.com (10.146.103.57)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 7 Dec 2020 15:25:17 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp08.a3.dal06.isc4sb.com
 with ESMTP id 2020120715251674-514911 ;
 Mon, 7 Dec 2020 15:25:16 +0000 
In-Reply-To: <TY2PR04MB33113F1C94A2530E8033BEBFCACE0@TY2PR04MB3311.apcprd04.prod.outlook.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: "P. Priyatharshan" <PriyatharshanP@hcl.com>
Date: Mon, 7 Dec 2020 15:25:16 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <TY2PR04MB33113F1C94A2530E8033BEBFCACE0@TY2PR04MB3311.apcprd04.prod.outlook.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 36283
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20120715-3649-0000-0000-0000049750D3
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.101241
X-IBM-SpamModules-Versions: BY=3.00014328; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01474673; UDB=6.00794335; IPR=6.01257309; 
 MB=3.00035391; MTD=3.00000008; XFM=3.00000015; UTC=2020-12-07 15:25:17
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-12-07 07:01:44 - 6.00012119
x-cbparentid: 20120715-3650-0000-0000-0000C1B552BB
Message-Id: <OF8530AE61.94B90081-ON00258637.0054B61F-00258637.0054B627@notes.na.collabserv.com>
Subject: Re:  NC-SI Asynchronous Event Notification (AEN) Implementation
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-07_11:2020-12-04,
 2020-12-07 signatures=0
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Velumani
 T-ERS, HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Dec 7, 2020 around 9:05AM, "Velumani T-ERS,HCLTech" <velumanit@hcl.com> =
wrote:

> Is NC-SI Asynchronous Event Notification (AEN) handler is already
>implemented in OpenBMC?.If yes kindly let me know which daemon is
>handling that.

The NC-SI Asynchronous Event Notification is processed.

The whole NCSI stack is inside the linux kernel. =20
The code is in the net/ncsi directory.

What action are you expecting on an AEN notification?

There current NC-SI stack tries to handle switching the network=20
to the host that is up, and there are netlink messages to control=20
which packages and ports are considered for traffic.

Unfornately the current model does not allow link state to be=20
reflected to userspace.

I have been studing the stack recently and am looking at making=20
changes,but have other work that leaves me little time to work on=20
this.

milton

