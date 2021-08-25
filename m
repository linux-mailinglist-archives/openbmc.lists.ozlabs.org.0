Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F853F70DE
	for <lists+openbmc@lfdr.de>; Wed, 25 Aug 2021 10:05:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gvdnt5vsFz2yPX
	for <lists+openbmc@lfdr.de>; Wed, 25 Aug 2021 18:05:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=q1qnx1Mq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.132;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=q1qnx1Mq; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320132.outbound.protection.outlook.com [40.107.132.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GvdnD2yGqz2xlC
 for <openbmc@lists.ozlabs.org>; Wed, 25 Aug 2021 18:05:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cPeRwr4/J+gfvN2UkK17NwRAgwsb3pX0NQLBZ7byqdYsXEHVFe5ZOnlekSQpss55zIRZXKJ22SbWpzVLW/TGiR1vt2KyCgK1FbwdqF45NhFcrIEvg0ctAYpSSb5WWIrbnkMlBIVJ6K3z0X+YWt2Nbps1hTfr9r3GtQ1lkdJEBs7b+YWy5cX9DYE2vjldpEVgpMbETVty3wPDGJoDW+kAzm7dmtpWEAPmZYqb0QorSKKIGL6idKT4lSNTTrmPFUUX6OmfwdVu34J5rbsV1lM+hWHmKe3f3qY67pzDWt6T9EYS75Cp3Ch964wK0qFp2CMdZah0P/w9GpnVPjo4sySwXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsRFfbs0Bht5EkMp2AdAEOfTrhCZ0X6ZA2+UECIynrA=;
 b=X+tNewlMuiOL/nFodCm4J2ZIZFF0Q37yN+np24GvVApypB/f6MKY5iJ6ju4DTXLtq8KOuANAKf5lvQXxxHK42GhD+V1jPS8xT2eWTm5VP2lzpSClwsmP83wEwVlmj7S/0JxdVGesCXwoCTSHsTUVMepgZLVOF3E+xYKiDKv/56Hxcy2qVBfjvhm9Mw8y8H+KlM6MmLAngWJrclJ8wkkkwD5k629lRkKtquPQuK57gslhmLruReHKwkbLR+svfSP/SIpzf/8dQnp11RvXqqBL9vzTpnq7yfFafqmmkW5KawDwYJuL+WlKR2lhnnJFR9yGOjDiK8kd2DzK1Ov2YJ9QRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsRFfbs0Bht5EkMp2AdAEOfTrhCZ0X6ZA2+UECIynrA=;
 b=q1qnx1Mq2IIezdTtZZ67OWAcqiAvZupbEjxlrt7eWH8kt//zdO7YWp4H7m2QmlP3BQzoncDAHwVgxqdPplvmX14QAPoxaupQf4+UIorf4t5LoIsZJWVA7aSaoToDVsggAaJmLvNwsnyHPKivIDgb7gj11miz49gcfF7qEAfKG4h3aGJ85T2eN//evbOW49CkJ37ZZJkwSnkUhoTXCDsPPLFA19YADhb6oB0U4iTzvw5UnL5BTA9cnCkxKaRIYx6CBJIwb1swXxR0vdaAeA2qoiD/K6qyB2roAZ234ndGfzsO6crQoQO7l3KJkeHY/vEzw5EOZy9eYcMSZmMgNLVgVA==
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com (2603:1096:203:82::18)
 by HK0PR06MB2244.apcprd06.prod.outlook.com (2603:1096:203:4f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Wed, 25 Aug
 2021 07:48:57 +0000
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::81e4:c1:aa1a:aa75]) by HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::81e4:c1:aa1a:aa75%7]) with mapi id 15.20.4436.025; Wed, 25 Aug 2021
 07:48:57 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Tao Ren <rentao.bupt@gmail.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: ASPEED EHCI error: "controller refused to start: -110"
Thread-Topic: ASPEED EHCI error: "controller refused to start: -110"
Thread-Index: AQHXmXnLUE/Ov+V/OUqc28a0JBlMZauD18WQ
Date: Wed, 25 Aug 2021 07:48:57 +0000
Message-ID: <HK0PR06MB33800E25D0C103664C9129F7F2C69@HK0PR06MB3380.apcprd06.prod.outlook.com>
References: <20210825062348.GA18567@taoren-ubuntu-R90MNF91>
In-Reply-To: <20210825062348.GA18567@taoren-ubuntu-R90MNF91>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a64fde7-92d6-4a7b-d33d-08d9679ccb29
x-ms-traffictypediagnostic: HK0PR06MB2244:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR06MB2244C4585FC096FFCB8D8E13F2C69@HK0PR06MB2244.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AxxPQWhZn6SSoFlU4pUUfZt3HGtfcXwFV7a3rR2tP2pVB/grueI/mGmmoldunTgi097nIX+Dmy33hmFYq/7Vi2CoDaGl0QiM4qIEiOQFR9rth3p7kws5+8RRmxJG3axpZuVaVwNntOePKgGY4N5ahjyNHSc+BJ8zpkAcT+Vrvuj54HETK9AucNZRAZKfuvCfjgPEPkg36dAe4zzYU3Orxqkp+meFSyAllwIuy0dnapFYNxABG7D5936dCxcpCLfeIxOHIZdS/bi9jhMbF6RvxXawTIAZGvIJ33J+69zFjogKL+8rpDu07hc+FjvCvkpPPtQ5ZB447ySa0VnL/HO7Jlf76lQSMH4pPxeV8+p+S5hgHJvTsopbo/jrHQZusVGBTOKwX5Jc0+tJmyghEzS4QlP3Sg+uQhuYoz4YHrnk3Fvh8IL9NjdS0n+LYdAbSv7AxUc1/Idx6OpUZ8JANGLIJDlG2GekSqNKeNH2E5wGIvOmwEOCCv6qpZdVHTNXHPMJYKFU8rjtW77vS4pp55Z4mdVpUUYwIrY2eCiJoxA7YKLS7UeRjEtA+zfTxdSO1DButZ4btiZRtirus9OkITUp1ITGQ6tf9QOho709NmcHBJEx4exGKcMiBeVzsQtBHp+hYhtGNNNW/IA2sMZcXRlvn0tOEEW4l3IpsWBOSsEtfzATweG+9qkXtXsMs1P6AB4LY8lmIqgZKmmI5GKHLPEuHg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3380.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(39840400004)(376002)(346002)(366004)(110136005)(316002)(26005)(508600001)(8936002)(83380400001)(52536014)(186003)(33656002)(53546011)(4326008)(5660300002)(66446008)(76116006)(54906003)(55016002)(86362001)(71200400001)(38100700002)(66946007)(38070700005)(9686003)(66476007)(2906002)(64756008)(66556008)(8676002)(6506007)(122000001)(107886003)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tx4PIeswi2qVSZbfMKRexDpGcACoLK2IvMZybFsBU2BuY350KZF2tv2c/x1N?=
 =?us-ascii?Q?f3g5AMnxVRUh24t38Oz34/fYIWpp7eIT6/b5OSJ7IMlkBpHP0W9DgoSXwVy0?=
 =?us-ascii?Q?SHLvf0oonCZXeT/CgjykA2UIMAQWlh1CTDK0Y25WNduNCI/C0/11Q+AsuS8X?=
 =?us-ascii?Q?HC4Gf/kADKUIZUjDApGtU47vqzuqSHPpFoZhsT/M21S8R7xnYMF2SI12W0H8?=
 =?us-ascii?Q?aqMoZjap8iF9D22HjZinBeJRpDuP/6kr5RpmS4VqFpWkrj4QPrwAkM9VJw8h?=
 =?us-ascii?Q?xZtFokX3BORKErUws5ZXSSBKNZtkq7ULSQE/Pbn1Q9JkvFBwmwZsRjdNTGTw?=
 =?us-ascii?Q?insbuBIMtval3OkG+KprscKSbKyRGHbqjWL7f/DTYXq1XvzwPzLTZ0Votsjb?=
 =?us-ascii?Q?a4V8I/eCwrU8zBIk7wHLiB15RfDZ3iJX9FRqAgtUNOFk8i8bPI+Fz9NfKI8w?=
 =?us-ascii?Q?1q4L/dMn7EzFecyWKOcUJ5isOqg+76odjhLB7oWlvJ1wR2cfOLc031HI9M4v?=
 =?us-ascii?Q?XCvlgHk445ECmdBeqIj7zJnYEo3kmFdRE0XeBFBvUfRJ1wYdnS6JAQuAcKlY?=
 =?us-ascii?Q?WdbCeETzvUqtnGU/r2a/UTIYO1fgKUPk5DfTeChY1jTV3BkQ4SF5s8XEmw1y?=
 =?us-ascii?Q?b9kZzGWJosh/JV+Durf3m4mBf4Zd5Ju49b4JDePlktiirZjhIQ8RC7jKHIsN?=
 =?us-ascii?Q?5J298X/29i8muKRrUVHUWsB1GWyzko0ZXqFhIac7S7ZquzMsv2wLs3mdJdln?=
 =?us-ascii?Q?zJ+EoBXyX8bqHqtS9/eHjpZcYgsrY4zv9gVU7saB878O/HCa+7fGbrCPkYv6?=
 =?us-ascii?Q?vDvvg/Q723g5sXPpMZBbok7WRSYFoUCZH5z7KEcDpZcdr2o9FUNYYvqW6w+V?=
 =?us-ascii?Q?yxe07ROkiXvbGMMvNmcQWQUlJje+GgYQQPPNRSCCX6aHMvbi3R9ydXA3589n?=
 =?us-ascii?Q?8ReURKXoIKxLCvF3hy8kf8J6h62DbvOFywrTsNDEdDAxbL3UZkt6ORbV3/Tq?=
 =?us-ascii?Q?RMva9V086Yx7aRe1XQxLcGgCzxH2rj38IPwUWrx32H1ve5Ld8ccQuOcN/DBW?=
 =?us-ascii?Q?Lw55w/OMm/KUibagAJQiI6rgOl1DNBAe9AnWhvuPVTb09KiBEh6WRsBnEkA8?=
 =?us-ascii?Q?IddRrFU9IBzKxdveR/mmVtr7HpOxwvrw3LWyEqbDKJOJLFzZ4vDqv7w2bDZG?=
 =?us-ascii?Q?t4g6agYk0xC9bt2LOYjQwU/LmaBi7AKRjSoIncYzRXb6wQA/AW4CL+h2LJU4?=
 =?us-ascii?Q?Vsjym4BATm8misBPvih/g3BuIU0Pd/tH/PoTw4vKmnKlmhPiNE04pfThgh9u?=
 =?us-ascii?Q?fBfOxcQhkIo+3weP+9dpIFJu?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3380.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a64fde7-92d6-4a7b-d33d-08d9679ccb29
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2021 07:48:57.0201 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kdcJ1Z2P6K/jpzsjAdw/mYgSbUNojwyld0+q8osRB7mUThjp+o4sbuRBsHOQMbqmiYnHbLfVCNU4HlyLUCbl8eulrOUKVmm1wzwzoVqZow8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2244
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
Cc: "andrew@aj.id.au" <andrew@aj.id.au>, Neal Liu <neal_liu@aspeedtech.com>,
 Joppa Tsao <joppa_tsao@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,
	ASPEED EHCI design for HALT bit effect is depend on Asynchronous/Periodic =
Schedule enable or not.
	If Asynchronous/Periodic Schedule not enable, but run bit is setting, Halt=
 still =3D 1.

Ryan Chen

Tel : 886-3-5751185 ext:8857

> -----Original Message-----
> From: Tao Ren <rentao.bupt@gmail.com>
> Sent: Wednesday, August 25, 2021 2:24 PM
> To: openbmc@lists.ozlabs.org
> Cc: joel@jms.id.au; andrew@aj.id.au; Ryan Chen
> <ryan_chen@aspeedtech.com>
> Subject: ASPEED EHCI error: "controller refused to start: -110"
>=20
> Hi,
>=20
> I started to see below EHCI probe failure on my AST2500 and AST2600 BMC
> platforms since commit 280a9045bb18 ("ehci: fix EHCI host controller
> initialization sequence"):
>=20
> > ehci-platform 1e6a3000.usb: USB 2.0, controller refused to start: -110
>=20
> The error happens because USBSTS.HCHalted stays at 1. But if I ignore the
> error at probe time, the downstream USB devices can still be enumerated
> without problems (even though USBSTS.HCHalted is still 1).
>=20
> My questions are: why USBSTS.HCHalted stays at 1 on ASPEED platforms? Do
> we need extra configuration at EHCI probe time for ASPEED SoC?
>=20
> CC Ryan @ASPEED for more comments.
>=20
>=20
> Cheers,
>=20
> Tao
