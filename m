Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1DC337645
	for <lists+openbmc@lfdr.de>; Thu, 11 Mar 2021 15:57:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxBrQ4Cksz3cc3
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 01:57:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pujN/LCU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bruce.mitchell@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pujN/LCU; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxBrB1TcDz30NJ
 for <openbmc@lists.ozlabs.org>; Fri, 12 Mar 2021 01:57:29 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12BEhIUv057970
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 09:57:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : mime-version : references : message-id : content-type :
 content-transfer-encoding : subject; s=pp1;
 bh=hm7dP2sV1S0VLquc1zZF/Q0uwLw0vXvxc+g637+AMoY=;
 b=pujN/LCU76sCzNFd5DD15SA7+7priiAYgR5K/+dUZfnface7BLWFYK4zMJSvE2S4Pc8b
 hCAuJqlDn7X+WXxBLyC34rsanG4pD0e6f5pv0N7JTPau65h/+ZKag48uju3g7ZwArWPq
 B16m0wQdaNTw7DYpz9AErkFBs5ENRmhM5cC6hxSZCplShk/4Vqkxg2AEyZA+qs4boRig
 BoyPanFHgVsn8ZCo3llC1ElxFvEvrfXzT8pQVWNnlXxOTZQoart3AD9K1HOMIiA7hTyx
 bWVmpqbzNvJKDlLIdcxK3UTr4E1mfbTeNdmXDMCF7jkVdo19/Pyew7NG/Gip/ZGtVkoO Lw== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.104])
 by mx0a-001b2d01.pphosted.com with ESMTP id 377mg4sd4w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 09:57:26 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Bruce.Mitchell@ibm.com>;
 Thu, 11 Mar 2021 14:57:26 -0000
Received: from us1b3-smtp01.a3dr.sjc01.isc4sb.com (10.122.7.174)
 by smtp.notes.na.collabserv.com (10.122.47.44) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 11 Mar 2021 14:57:23 -0000
Received: from us1b3-mail33.a3dr.sjc01.isc4sb.com ([10.122.7.203])
 by us1b3-smtp01.a3dr.sjc01.isc4sb.com
 with ESMTP id 2021031114572301-457124 ;
 Thu, 11 Mar 2021 14:57:23 +0000 
In-Reply-To: <HK0PR06MB2145076F4CB2696DA9E282C78A909@HK0PR06MB2145.apcprd06.prod.outlook.com>
From: "Bruce Mitchell" <Bruce.Mitchell@ibm.com>
To: Troy Lee <troy_lee@aspeedtech.com>, "Klaus Heinrich Kiwi"
 <klausk@br.ibm.com>, Patrick Voelker <Patrick_Voelker@phoenix.com>
Date: Thu, 11 Mar 2021 14:57:22 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <HK0PR06MB2145076F4CB2696DA9E282C78A909@HK0PR06MB2145.apcprd06.prod.outlook.com>,
 <1f6f6ee72b8746939289c1897de828b2@SCL-EXCHMB-13.phoenix.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP130 January 13, 2021 at 14:04
X-KeepSent: 1C6DA5F7:06DAD888-00258695:0051F279;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 37327
X-TNEFEvaluated: 1
x-cbid: 21031114-5525-0000-0000-000004072681
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0; SC=0;
 ST=0; TS=0; UL=0; ISC=; MB=0.000167
X-IBM-SpamModules-Versions: BY=3.00014874; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000296; SDB=6.01519595; UDB=6.00821142; IPR=6.01302105; 
 MB=3.00036388; MTD=3.00000008; XFM=3.00000015; UTC=2021-03-11 14:57:25
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2021-03-11 10:55:17 - 6.00012364
x-cbparentid: 21031114-5526-0000-0000-0000F1E52B84
Message-Id: <OF1C6DA5F7.06DAD888-ON00258695.0051F279-00258695.0052282E@notes.na.collabserv.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: RE: Adding keys to BMC production build
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-11_05:2021-03-10,
 2021-03-11 signatures=0
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
Cc: "OpenBMC \(openbmc@lists.ozlabs.org\)" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



-----"openbmc" <openbmc-bounces+bruce.mitchell=3Dibm.com@lists.ozlabs.org> =
wrote: -----

>To: Patrick Voelker <Patrick_Voelker@phoenix.com>, "OpenBMC
>(openbmc@lists.ozlabs.org)" <openbmc@lists.ozlabs.org>
>From: Troy Lee
>Sent by: "openbmc"
>Date: 03/10/2021 18:35
>Subject: [EXTERNAL] RE: Adding keys to BMC production build
>
> Hi Patrick, You could assign SIGNING_KEY
>to your private key for signing image. If it is not set,
>meta-phosphor/recipes-phosphor/flash/phosphor-insecure-signing-key
>-native.bb will be applied. Thanks, =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=
=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =
=E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D
>=E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=
=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=
=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =
=E2=80=8D =E2=80=8D
>
>
> Hi Patrick,
>=20=20
> You could assign SIGNING_KEY to your private key for signing
>image.
> If it is not set,
>meta-phosphor/recipes-phosphor/flash/phosphor-insecure-signing-key
>-native.bb will be applied.
>=20=20
> Thanks,
> Troy Lee
>=20=20
>
>
> From: openbmc
><openbmc-bounces+troy_lee=3Daspeedtech.com@lists.ozlabs.org> On
>Behalf Of Patrick Voelker
> Sent: Thursday, March 11, 2021 10:18 AM
> To: OpenBMC (openbmc@lists.ozlabs.org) <openbmc@lists.ozlabs.org>
> Subject: Adding keys to BMC production build
>=20=20
> Is there a page or document with instructions for adding a custom
>key for signing the production BMC build? I haven't had any luck
>finding it yet.
>

Hi Patrick,

Also check with Klaus as well.

--
Bruce


