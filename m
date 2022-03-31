Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF83C4ED1CF
	for <lists+openbmc@lfdr.de>; Thu, 31 Mar 2022 04:39:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTSF14V7dz2yY1
	for <lists+openbmc@lfdr.de>; Thu, 31 Mar 2022 13:39:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=sZK+8zmI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::70e;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=luke_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=sZK+8zmI; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2070e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::70e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTSDR5P6Bz2xrS
 for <openbmc@lists.ozlabs.org>; Thu, 31 Mar 2022 13:39:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QO5vmUs4lOR8K3F+VL9CHWrGKk76Jd87oa5OZxZdy2FW2ji0wc0p8w68oyKgfRRAmNLeN4Dz/bD2qJdyje5MA7aNFdqGad3cCXkZXBW3bHUpMICNX9j+ZpR0FIIEqhwVHB4yUBlw9zAKJwTkx6LilB615UxQncVM8HfSXE/y5ufszsClqpvc4KQ64sL9ybHdyL5YFhmc41DDUpPCN1FrIp7xvIwudUCSQ9B2uXPwAqjAheEoh/1rSk7kRPy+6neJCGax9tacnjLJ2xg0zBPGdg35VlNNKpipP/tPNDxVpnNFfEFUmUdu6ci/4xXQtvCqkilufUs+yjHq/m3YEGEIyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A7LjOysTJU9e/Vv2PDzV5k7r8Ai+d1UBuv7qSEn2qUY=;
 b=fPM64bWyFYD+oUNWv7O3ObBSFfD0t52OrsKhoIvVb3Myc/2Uoqh+phzSW6/+KiqIehIzJslMvsKnLpc7cmiNVTyLMJroBX1icXsmHPpqLYcrdJZzpXbVVNjXV2gJy3fE82T89eAR33S4GrGKRAfbR7a/pnSA5p/D5aCF87+daMw/N2lSRRF2lhis26EdFxivFKAqOzh5bCHPZNSr03Lstzh4aE9TgSQAa2Dx26SCvTC5Po4DlBsAT73g0D8xpvwTEmy8ms8pCIfwEeeGORZ7Jo2Dx1PNJKqIsj/KI2wS8BYX4Wg986HhaM6oVJn1R+7LRTPm2eeKbnGimMsXfZZjFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A7LjOysTJU9e/Vv2PDzV5k7r8Ai+d1UBuv7qSEn2qUY=;
 b=sZK+8zmIeWRmUFUONz43yvZmiZ1Wq/0GbjOvJh56osvQ3criNn6nJbl8Lim6kTUd4/J99dXULY2LErQEdBfXB3pNfiN+gtSE2aKErON4KBK6EQ9AJJLqtJUKM0mDjrmTawxejcfzJPd+r9RjMCiTwmrZK46mb6OY4+ura06NA9iY0j8ig3XUfxPbfyqvI4ySd0DgvpqeJEO8IXh1mPTA0+pvg/xqLuS6tMJxN6hS85x+Xh2Leve0Zph2Sfgtbyd8cq3mmC1A5s0TNOddtjphjTeVmW8HA+XCNORAXOFoxVJTGiAMGiDB6BchLwIOuio7JtCJT41o7TgHf+zAlkw30g==
Received: from TYAPR06MB2256.apcprd06.prod.outlook.com (2603:1096:404:17::13)
 by TY2PR06MB3008.apcprd06.prod.outlook.com (2603:1096:404:9c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Thu, 31 Mar
 2022 02:38:33 +0000
Received: from TYAPR06MB2256.apcprd06.prod.outlook.com
 ([fe80::648d:4aa6:73bc:2864]) by TYAPR06MB2256.apcprd06.prod.outlook.com
 ([fe80::648d:4aa6:73bc:2864%7]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 02:38:33 +0000
From: Luke Chen <luke_chen@aspeedtech.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: RE: Signed CLA from ASPEED 2022/3/25
Thread-Topic: Signed CLA from ASPEED 2022/3/25
Thread-Index: Adg/4lQZgQVvVM/dTVW1P1RntNsUBQEZFTUAABhu3ZA=
Date: Thu, 31 Mar 2022 02:38:33 +0000
Message-ID: <TYAPR06MB2256D8C0C961B8A90557D791E1E19@TYAPR06MB2256.apcprd06.prod.outlook.com>
References: <TYAPR06MB2256B0D5198B54642EFF1158E11A9@TYAPR06MB2256.apcprd06.prod.outlook.com>
 <20220330145848.o5if3p6hwdzkjgwg@cheese>
In-Reply-To: <20220330145848.o5if3p6hwdzkjgwg@cheese>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 954b368d-3498-4f47-3f0d-08da12bf8c8b
x-ms-traffictypediagnostic: TY2PR06MB3008:EE_
x-microsoft-antispam-prvs: <TY2PR06MB3008B39930464FEB239AD080E1E19@TY2PR06MB3008.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HNXX78EOWHvoVjulRbmsKh1+hR8SaxG6u/r3T6oo0nbmgQwUE5lRDTJwRV7549ImlN8TuUnfW5K7prcgDGdNgNK+2MvxJv9xRzxpQgTeChMWniZcMNd/aYxgUfSWTX86sPHYyc1+q1zMcSrjYxAPs6IE3nci0a/DtCjwl2IXqw+LjAfjaVDOJVZk0/OcO7rl0l9XfFanlr2nH8FwG5pEzl4MPDNk1aUpV+KmIxwh9P8AKnIxBMQzKfMcNFcuvd3T5io89+urrMXWyyqO0zs3nr8UasRU4OvkSbOzI4z74aGzloC92aUo2ARJmOpkiTXrcPSvodGDiz5URR4Mq3N0pl64Rt75juCwejDe0I/rwd7a0S7S9FD2samF98HH+8UulefrAioQVM++ZBsocSsQr+PmaO/9BysbBRkg9o9Acpsd8dAfk1q/fRWxaK09LCV81Ei+VZxBSJ2rtYHtMcouDs6z+L0xShGtDy2fItfs6wPx6h3FnEAOJRf6Jl0IRYzTtTxRQya6lBYzV0aBtpP4x+H0rLBimaMDpC4xojrScx6OZYvaAdMDfN5q97uFQltuoxSvkuVk723teWmTSAis0mK6COlvrSkp2Do95NG2i1/wkKRvrRDGYD5KODpbbpVlNtXdor+VVCkXb6C2JdhiAGPaNXkLAoheip9+F9WIgQT3axd0iQ6kqkX9s+MLqw0TyROhWAoOXZu6iSJy3ww3QQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYAPR06MB2256.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(396003)(366004)(346002)(136003)(376002)(39850400004)(86362001)(71200400001)(53546011)(54906003)(9686003)(7696005)(6506007)(2906002)(38100700002)(55016003)(66446008)(4326008)(316002)(8676002)(64756008)(6916009)(66556008)(66476007)(76116006)(66946007)(38070700005)(122000001)(52536014)(107886003)(26005)(4744005)(508600001)(33656002)(186003)(83380400001)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7TRJ2cMH97dH/ZQu4PhyfzyQG8jlhNoudvaG4rliInYbiss8xFZrh+2Mmcuf?=
 =?us-ascii?Q?LnWur3q1Lgw16vlAzgLByeimmWHNLhpK+KRqV6yN0n+BQ2uLKXqxHYiofupL?=
 =?us-ascii?Q?cevpxgOlSV4RtgesmYNOSRRlP5ApNWuXB+f8uiI837c0e9XSGDXR5C2Fedv9?=
 =?us-ascii?Q?G/xQQrgb00AglnMgO/eMBZ9tnwiaywmXnaHPWvOIh/JslcXjsEmsLvrU5cy9?=
 =?us-ascii?Q?gE5jq1RNqgrMm9BAsfkzMYPtSIgc0WdQVS8f8q5AoIDj2mo9yTGFc/Eddwfa?=
 =?us-ascii?Q?l4HRJqCpgOLTRy69ft6B0/ufTquoDdlF18ma1fOtumAjowldkvFBxbQ1F+7K?=
 =?us-ascii?Q?zue+F9ssGLSv1nZ2UenYJlyfIIsX9h+ZZyNaoWXMGo3c6dwmmwUhyJIRqY95?=
 =?us-ascii?Q?Gpf+IklFvhdLzupfRVC8u1j6Bsk5ONVdkGCYlt6mLKia0MAbHroPtKWgzVPy?=
 =?us-ascii?Q?CaIyuAfgLrv/t4zEQ2HSRehSvGq+yFeQjPKp39dX6jZkKizmvr4WBSnIZJCf?=
 =?us-ascii?Q?U5lM0YpSppVkhPW26SIs1dNQgPDVmelIw60CTEFMlDG01Jk9z9vn3fPCAqVJ?=
 =?us-ascii?Q?gOhnGjUieN/b+Fq1tfWAuEvrfqKEQlIo7JzZLq+n3SUgsg0oDMbIXhhn0CNm?=
 =?us-ascii?Q?UeEo0uj7L0PGFvXolGh3+S3NaHA+6A22hEUAAa1bopDzRxWMWK+ZoTcHSq2N?=
 =?us-ascii?Q?dq2XfIorwjEvD+1lkNyCBd+geH/VamNigFWaz98+apFvhRPPyL+qfNTTCJyv?=
 =?us-ascii?Q?ssVqiEO5cLWZ0G+KxW5m8hk9+RvI0UTjsg7HHZFVldNJAAXZdRMiyve5fTqC?=
 =?us-ascii?Q?W5hoC3lstTZCVQxvs6Sp9wOrEp19Dwous2RBAxxPrxSdTpJlnEgF0e+Nb3lJ?=
 =?us-ascii?Q?rBWbiVeT5KwAKmpoPc8e4eBHYrRX4YLKBNr4DwbfsfaKN0tcULouzXA6ud1t?=
 =?us-ascii?Q?fk70czlsykQC5UXKRt/doe9mS3oGlb3B+9jMq5eC2+l+6gdkfg6dLPOtcv9/?=
 =?us-ascii?Q?fZhf5hUwm8zz91IQiDLkJG1jKY7+G1w3ORstA4s0YPJkssqDT0DA2L2SpuK6?=
 =?us-ascii?Q?rwwzFnWlZ1Bv8XXzNkwT4NyEsdq1W0MIxU1+1A/whEeksHbrETuazf3cy5Gn?=
 =?us-ascii?Q?49nYzxVapO2b2p1H1ZJHYmrzLQWPlLDwehLjpb401hO36aPQDyMhfq3gGCJj?=
 =?us-ascii?Q?8Vf9wIjxIvLrMBBOqBfAj7NY7ervxMLMsRkdaG0gOYWVUThHNK/Ek4dsef2I?=
 =?us-ascii?Q?QMfEXWVQxdbwC7ry2jGaM/cRLZTgSlYnHknVFh4OQtFBBogpSyB9tGtFLHlw?=
 =?us-ascii?Q?GQ8YPYlMvVL5h2cjWQWAknBLJWLOyNmPDYb9a4sqp4qkEOqUgUQkRmWfY8oQ?=
 =?us-ascii?Q?ns7ylTWfZQr052/YTXn0kdSNpUHjZiFQsTJNNb0tUZwZhtMXpmdIwq6FZ6wb?=
 =?us-ascii?Q?vBjaLH26zM7XevVqRhLL7r7GUv0qsf3FrDu/de+Rs4e4oX9FsRYhW0/qffbk?=
 =?us-ascii?Q?9zE0TL4oSyhfsTmAfebj6jy4wBXGzO+w97nEu6snr/duSaqkAsA1+//YUGmk?=
 =?us-ascii?Q?J+CDx2lTm/bH7Vay1cnjrmAROUH3r4EqBPgy7/I7IBxctJ/oiYkVxVARmNem?=
 =?us-ascii?Q?+wcpyIEEGLgLIt/liDrF38qdfXIuraaALDoUt/i+POG4qaPXMf3oQD4b+dZa?=
 =?us-ascii?Q?mFN/8Z3mW31NvA+i5/wUpK4OHphhFlWrxHQBce9BicUn4gosTwNaMGmOHpiI?=
 =?us-ascii?Q?EJp8Zblx3d3Bgdpuqn67CMc4vKvOg1k=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYAPR06MB2256.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 954b368d-3498-4f47-3f0d-08da12bf8c8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2022 02:38:33.1554 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K2g/i20GUX9Nj2WC4/SroJUeO5BPpbF5JlhFP77R50qYaf0V3WqAr55kVbNQmXI+HARylBMG2NpbfzLc9or7iHaDNNz+V/0d6cLYIYfje2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR06MB3008
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
Cc: "manager@lfprojects.org" <manager@lfprojects.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Troy Lee <troy_lee@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Brad

Thank you very much.


Best wishes

Luke Chen
(O) : +886-3-5751185
(M) : +886-935-592-892
4F, No.1,Sec. 3,Gongdao 5th Road, East Dist.,
Hsinchu City, 30069,Taiwan,R.O.C.


-----Original Message-----
From: Brad Bishop <bradleyb@fuzziesquirrel.com>=20
Sent: Wednesday, March 30, 2022 10:59 PM
To: Luke Chen <luke_chen@aspeedtech.com>
Cc: manager@lfprojects.org; openbmc@lists.ozlabs.org; Troy Lee <troy_lee@as=
peedtech.com>
Subject: Re: Signed CLA from ASPEED 2022/3/25

On Fri, Mar 25, 2022 at 12:50:32AM +0000, Luke Chen wrote:
>Hi Manager, Brad
>I would like to update CCLA, I added 5 more team members into the CCLA.

Hi Luke, CCLA update approved, thanks!

-brad
