Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C782923AF3
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2024 11:59:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ltts.com header.i=@ltts.com header.a=rsa-sha256 header.s=selector2 header.b=d3SNpJg2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCz0D3qfnz3dKX
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2024 19:59:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=Ltts.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ltts.com header.i=@ltts.com header.a=rsa-sha256 header.s=selector2 header.b=d3SNpJg2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ltts.com (client-ip=2a01:111:f403:c408::3; helo=pnzpr01cu001.outbound.protection.outlook.com; envelope-from=thangaraj.s@ltts.com; receiver=lists.ozlabs.org)
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c408::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCyzg4LxRz30WP
	for <openbmc@lists.ozlabs.org>; Tue,  2 Jul 2024 19:58:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g3acHGLQQLCou9P0s5ssiB/uCIYxKbr/fhYtn5ziutTCguhqkDjmgHoAwaI4V6MLtTB9eB8WGs7ktFlRnnTwF0Zs+PQabVqy08QTGIcI8PyrSNol5d8L4HdlvaXG3jmpkL/zBySanPIl8jVU29E4SbBjC0RgNH0d5q2gppG0bHiN9V4e2V7mOysxScHgO2YWlO882dThn2km8Vy/jG/caiBrWjdEimd/d/tEHrpILzvkzajmGvTQ3yJ27jVOnOq2tGsNp7AbG54YUWT+r04IPJplCfeebrc/NUu58rD470p1JVtpunXB6ZK3jo4oDpv4R5s3CbZdnUhJh4MaYsjWbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0n3PLcLB/EYwYGQi9KDXsGwozepIvxz0sz+HLkhlZ88=;
 b=T6tnb9AXrj7gQnTtseBYYv4nLdOudNSgnYVug8URWBE+7ohGeBvNx0hK1kNqc8GtH+uF3KSeUTYJiKQFP5224Xzq20xuOXtPB91yJBp8rq9epyv5CJ76ouBgPY76rZJStawOp/cB/3ZgiUpyPQGSZl8HOiAFpY9vm706Jwg1QWe+J8t7PCgsDoeiLYTR7+wvvWTuTbMJidpTB/T3vE8fPhQizoRn7TPWoDywXbhYxQjz6Czwa6Nt2bvIaOoDxgtUEmI98u2amKPcqi1lkrH2l719lElk3i6yMgcfn0vQvgBOW7lYAsBuHbBGNm8ofwukQuH8Ov2koJluoROPA27DqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ltts.com; dmarc=pass action=none header.from=ltts.com;
 dkim=pass header.d=ltts.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ltts.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0n3PLcLB/EYwYGQi9KDXsGwozepIvxz0sz+HLkhlZ88=;
 b=d3SNpJg2rYol/D5ckOT/nN6CRJ4ncwBtnUVrREflS1LLlx61P10CVc2alLKCOPAbNCnmg5YzVpcw+CKKT87Kt7Fa7dykfq/mOkXDlmWdu53Feg913M2CecZmptT3sS4JawUlc0a78ll4lEOzGm6un0fWPhB+FTtsJET3+VZjfv2FDO7yU8MaaJ50xpeSBKKAgsoXPW0LSWSLgmv/VppPgjVZWopFT7ubnRg8xTRMV8szWHIiibQ44Gc6y6ecsjNoq2uvo+0Mq5/9goufjV5SM6eCDapIrLYd018YqPt8FpX0ZBrV/8f2/auzeV2ZcU91Ke4TspAZ7/ouWeiAefeSIA==
Received: from MA0PR01MB7836.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:27::11)
 by MAXPR01MB4309.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.23; Tue, 2 Jul
 2024 09:58:25 +0000
Received: from MA0PR01MB7836.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::7e42:a40e:46a1:9a0d]) by MA0PR01MB7836.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::7e42:a40e:46a1:9a0d%3]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 09:58:25 +0000
From: Thangaraj S <Thangaraj.S@Ltts.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Regarding: Ipmitool and ipmi setup/issue 
Thread-Topic: Regarding: Ipmitool and ipmi setup/issue 
Thread-Index: AQHazEgDSe5RdGB7AEC8QkLDD13O+g==
Date: Tue, 2 Jul 2024 09:58:24 +0000
Message-ID:  <MA0PR01MB783699F1EAAF49C8966FF4F39BDC2@MA0PR01MB7836.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=Ltts.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0PR01MB7836:EE_|MAXPR01MB4309:EE_
x-ms-office365-filtering-correlation-id: 462f0346-150b-448f-1089-08dc9a7d83a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|376014|1800799024|69100299015|366016|38070700018;
x-microsoft-antispam-message-info:  =?iso-8859-1?Q?TZyfeO87maD3xecjd+jfPK52ycPWraYIaZyS/iD5wq3AI0lEqPaYfc+vQU?=
 =?iso-8859-1?Q?sfDx4ATNLz96jGg1aKzx99DG2E5jwjum6l/BmjTbL5L8CDCf0PiK1yjbXi?=
 =?iso-8859-1?Q?KNCXMUmiOsF7SttM/ldx0u0paXM7NGwp4E73XppekB+Oo95ERPb96oy6P8?=
 =?iso-8859-1?Q?iw4IfJe266TTtD2xIw9SqNU/YyOV1JBHB0mnr7/XVgc+MJrv5CUxvqj5WR?=
 =?iso-8859-1?Q?SXyl9NVsvQWieMcdqkos7bsLsLXKt6aHZiCjR8MlUSDKfokzK6RE+jvhr6?=
 =?iso-8859-1?Q?CVlyoDZA2XszfBl/vPsZoQHlH1X/e+jvnFjMP2ALShEJhKWnl3T3yUCboC?=
 =?iso-8859-1?Q?445N9eJsZCS0CdmI5UzzUSZsgAAnH9prbc8WRmit4ywvE13DSQwXQSuDf7?=
 =?iso-8859-1?Q?/tr5T74fO0yVgxHF3W+M9ey1wTN4fGjFLIGDFKf6E0/1EoVBjrBQGsEPGO?=
 =?iso-8859-1?Q?W74uqvZ5WGJjD/aU3ZkXgjqhbE+AIgQiTezcqUGJPl2PTOtFMxYcfqj0IF?=
 =?iso-8859-1?Q?BqOrcDM7Njb0HtCd2jySx2/fRe4aHS6INtEf6BH1IkLxs18Gy3g5NIbEN+?=
 =?iso-8859-1?Q?FPCtaz8UvuWHfIocAJLgVZe3O1Fm3wqpF0sahqCigv2ff+vNKx8J0suoQa?=
 =?iso-8859-1?Q?KJF8W4zrwSoDNmDhhZ8EpBEMzGXfjTHhmu1pT0wpCsduDm8ErR9KGeW7Rp?=
 =?iso-8859-1?Q?lbUwlXjJxEIa6fSioNq5yt96/GReMzI8hhINaLnuPafe5OidbySnoLGu2U?=
 =?iso-8859-1?Q?8kubFN+wbqGxEaVgtvy2KeQARmIE6RbOPMpa+DulhXIlR5f/ufH45UaCXT?=
 =?iso-8859-1?Q?XRMguSNZYTZ4iIXTdcfMegYtIJhJJ0AEPUsBrFCpmB56IThs6v21x6CHaP?=
 =?iso-8859-1?Q?52MjriTA4ILa4/fUkeEVRQnIMAfebDAPjfyEMQ/5mqe8zg890wmNrP+D4J?=
 =?iso-8859-1?Q?V7n82QSi5KBNqf8P6k8OjX37qsZ04Qm/OZyr8zniuwoXH7Hz+fi7wdqG+P?=
 =?iso-8859-1?Q?1cnyr3Agg+ClPLET3Jn/K7gSUBNKuRT5FLUu0abeoMVgd+zoBtWRtlrQDv?=
 =?iso-8859-1?Q?/PlhtcUvErOHIIljExDthzYGf2tXx+mxelqjytuvG9qZ62lWj9LnxvIm08?=
 =?iso-8859-1?Q?S9IElgq7PeVRo4/VNTAUPGFN3r+qp+xo7smOXHuDKy/X3yBjm6wrWUv3Sm?=
 =?iso-8859-1?Q?GZMvpdhU5pD/jJ5aMrq9CbLNkNUJK0NoWXOJEL0EltNQ3A+80/C4F9rjtZ?=
 =?iso-8859-1?Q?UM6OqH+exROl7kerbJI1+cY/ZMxol8TgDLRBksyo+uwgOaVJWk+yVP9rOB?=
 =?iso-8859-1?Q?PBLK4YXFfh+mO1J8SaiVZMSM2LwgHieSPGLC5mhjfS+vRQ4tur9BpNyS9I?=
 =?iso-8859-1?Q?d96wXaFTSkNQTqQAADbgmjv7GU2vAdCz4jVKNYqqNCPL8QH64DPJOuhBi+?=
 =?iso-8859-1?Q?06Pj1zTeBrHk1QTaAMgRsOqvdPme9OtCNeoUWg=3D=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0PR01MB7836.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(69100299015)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?UzU7wUaQrSI07ejWZn2nWnpxGrxiCwyNXxEMR9SpDxlBHvl3cIfns1IM1r?=
 =?iso-8859-1?Q?PJTVP9RYYYH8o68Rr//vmmyANhrua1l+wkEZ1YNoDTETfGqCk7A4W1dJU1?=
 =?iso-8859-1?Q?2JXkMEscU6ZNmEDzIWOeIwA14QcnKXBGpZuYiY2ZODykaSKOvHed/6LvOx?=
 =?iso-8859-1?Q?c0o8x6IA3W6Pe32oY92eWeNaPSk7SQpDranL/8Zu8bqI0AiF9amc9/T+m9?=
 =?iso-8859-1?Q?jnbWnIlRO4prRlRFAD3ozb0S3TUCFSudyTTB6/ZAydLY0vhq6/zB6IoasT?=
 =?iso-8859-1?Q?ZwtYrnBHPvG1vsJVFt5FIa3kbG6RuaoAJsKysigv7RlfDpo4ZvVTGF0VIJ?=
 =?iso-8859-1?Q?zX8w/GrNhKgAbZrZJTbOppF/XQ7tvuRIXXVTSPEA6nL223Ofm1BB2h2CPW?=
 =?iso-8859-1?Q?yZEnmD8i84kbM1JdC3eTOQPpUlPha7WPuq1pKgQ8f+Uai8byhHblAorSrN?=
 =?iso-8859-1?Q?/GIA6mmtRZDJjpNrSYVBRzXy5RhgnYDqW97sU6L+0uIA4+qkSUIeJ5FZPx?=
 =?iso-8859-1?Q?j0oUccaVSGhazJ560rtznVqInYjmHWpp7WLltt98kHIqW5zdRQCIyszKtf?=
 =?iso-8859-1?Q?h+CdEHi18xWuCwm6sJFnGpg08cw11/ulw5TWkFsuALMKat5MxKRb+OPn80?=
 =?iso-8859-1?Q?ihZfsv9rraO59Z2LeqCOL86OVjmfuX0zFKuQlvd2ZxoepTXxmuQ13nP/pD?=
 =?iso-8859-1?Q?QwLCrUG8PT/UZw/kGjr0j0/29oy1umriBWFJNXh8JeF0PmGfIaeyDOaEup?=
 =?iso-8859-1?Q?zTaDaGIS2xyB5JTZ3h73ENGxKx5gReGmnOBNEm5oGKmmzfxVrX+sE9FT2d?=
 =?iso-8859-1?Q?YDGkVQdezhucWlQnqNapvONxrHU2h+5GVpxu7Cw+Lky7MQ4kqUH//MgnPh?=
 =?iso-8859-1?Q?z7V08WCO/zlGrHep9CUNdtziUz76Kc9rP5+ysd8ZeaYMOagVp6N+rpYcRN?=
 =?iso-8859-1?Q?DMaWSjPts3WqcgjRSA6CjMq7NR2ot5p6YM41+nd3vmH07k9A7srmM7lYQC?=
 =?iso-8859-1?Q?d6va7qbYNNwd52yejNI9Uaue42+Ht8UQM5MQF54b3vLkUV4EePDMGHW2KF?=
 =?iso-8859-1?Q?bpcAjdMC38Gi+wqnqJwD7Kw+Kiuuw15teIwiLRmLG4L0U47y3RJx0O1V0c?=
 =?iso-8859-1?Q?i7mwqigDEc5UXutuYY529RIS1CH8VhIamfit9X+j/R/OHpMNw7TgiB4vfj?=
 =?iso-8859-1?Q?pzwCsCxkuCV921Pa7hbNQOEuhy0eK7uN16HmQ/H3JULMyt3vU9oiNcIfDP?=
 =?iso-8859-1?Q?Ju8Zga2Sf9Ch+nuLRiLt0zsonihJ7/JcreqYqjUVFrMMRfmQ3qfAk7MYg/?=
 =?iso-8859-1?Q?5CoSfHa6jY8Hh6p++3cqDtl+f8FVHXE00WBHtB6gWv2/B7vY8rwVAhcGtM?=
 =?iso-8859-1?Q?wzVlY05ZFcXbtym9W+AKhQFf2xj8hReoN0lNU5G0ryg6iWPzFChuh/mu0R?=
 =?iso-8859-1?Q?iEp66xkoitnoDpFQNDEBWHDl+/mTZS5aRpxk3qY6jL+/NjaRPsU5Ge7h9y?=
 =?iso-8859-1?Q?qkPdtU38yh327F81Jt5pmABmIIr4eqctEK4J9/ZSHVd6FAiPbFH7MnKGSb?=
 =?iso-8859-1?Q?9dJdQcMim18EDtr88vwQ5bS1GME2OvwzN2YEfw5aEYVDZbZyx7iSillciT?=
 =?iso-8859-1?Q?GyWHuWjmw6238=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MA0PR01MB783699F1EAAF49C8966FF4F39BDC2MA0PR01MB7836INDP_"
MIME-Version: 1.0
X-OriginatorOrg: ltts.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB7836.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 462f0346-150b-448f-1089-08dc9a7d83a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2024 09:58:24.9446
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 311b3378-8e8a-4b5e-a33f-e80a3d8ba60a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R5CPlInSZxcpuIeFc5Ri4BMfXvh7yWDY74SsGtM8GPX+YtQS6WvHR/ey1LyxeI4apaFpoWEJbmsEQuk7ZyiY0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB4309
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
Cc: Bala Subramaniyan <Bala.Subramaniyan@Ltts.com>, Lalit Kumar <Lalit.Kumar2@ltts.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_MA0PR01MB783699F1EAAF49C8966FF4F39BDC2MA0PR01MB7836INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I am new to the ipmitool, i am not aware of the ipmitool and ipmi setup, i =
read some online pages  i couldn't get full setup initialization detials an=
d where to i start. could you please help on ipmitool setup for ipmi over i=
2c communications.

 Regards,
S.Thangaraj


[Ltts.com]

L&T Technology Services Ltd

www.LTTS.com

L&T Technology Services Limited (LTTS) is committed to safeguard your priva=
cy. Read the appropriate privacy notice<https://www.ltts.com/privacy-polici=
es-notices> applicable to you to know more about how LTTS collects, uses an=
d stores your personal data. Please visit our privacy policy<https://www.lt=
ts.com/data-privacy-policy> available on our website www.Ltts.com for more =
information about our commitment towards data privacy under applicable data=
 protection laws. This email may contain confidential or privileged informa=
tion for the intended recipient(s). If you are not the intended recipient, =
please do not use or disseminate the information, notify the sender and del=
ete it from your system.

--_000_MA0PR01MB783699F1EAAF49C8966FF4F39BDC2MA0PR01MB7836INDP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I am new to the ipmitool, i am not aware of the ipmitool and ipmi setup, i =
read some online pages&nbsp; i couldn't get full setup initialization detia=
ls and where to i start. could you&nbsp;please help on ipmitool setup for i=
pmi over i2c communications.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp;Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
S.Thangaraj</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<br>
<img alt=3D"Ltts.com" src=3D"https://lttswallpaper.blob.core.windows.net/lt=
tswp/GPTW-email-sign-2.jpg"><br>
<p><strong>L&amp;T Technology Services Ltd</strong></p>
<p><a href=3D"" http:=3D"" www.LTTS.com=3D"" ??=3D"" target=3D"" _blank??=
=3D"">www.LTTS.com</a></p>
<p>L&amp;T Technology Services Limited (LTTS) is committed to safeguard you=
r privacy. Read the appropriate
<a href=3D"https://www.ltts.com/privacy-policies-notices" target=3D"_blank"=
>privacy notice</a> applicable to you to know more about how LTTS collects,=
 uses and stores your personal data. Please visit our
<a href=3D"https://www.ltts.com/data-privacy-policy" target=3D"_blank">priv=
acy policy</a> available on our website www.Ltts.com for more information a=
bout our commitment towards data privacy under applicable data protection l=
aws. This email may contain confidential
 or privileged information for the intended recipient(s). If you are not th=
e intended recipient, please do not use or disseminate the information, not=
ify the sender and delete it from your system.</p>
</body>
</html>

--_000_MA0PR01MB783699F1EAAF49C8966FF4F39BDC2MA0PR01MB7836INDP_--
