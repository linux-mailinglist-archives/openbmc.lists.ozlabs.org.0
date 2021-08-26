Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBEF3F8020
	for <lists+openbmc@lfdr.de>; Thu, 26 Aug 2021 03:56:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gw5YF5vxlz2yJN
	for <lists+openbmc@lfdr.de>; Thu, 26 Aug 2021 11:56:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=JOlhXhtp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.131.112;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=JOlhXhtp; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310112.outbound.protection.outlook.com [40.107.131.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gw5Xg1PsPz2xnf
 for <openbmc@lists.ozlabs.org>; Thu, 26 Aug 2021 11:55:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gRR4ihDpsB4vdH7lWJQ5zIKx8n/8O9pWgiu0dXcbSd2DRkGwwE6KdB9nYAepG0zRVEz54uEOh+fnMV6YwmMtTzLClgT9MNLYPt+xjLhwbGM6Q27zsPELIrX9Tj1O7GM43QFVZIGz0B4MxXsianqNLMvgR0KZPFrf6IM1cmzAyPIOYomzdWndzl4mCTbLjpJz8X9VmNXBInP2dD98+9kyml7Gvh9jtJTao31jImgQxXKt7WvmSMfpzzPkR1Qcrhe2OGYTLegdx2m7mTfq/RHmC6npoTeJ44vlLLPfynO/JLxUd+UcCrQ4EUoHB2Vyysktnp1fFa8SyuBk29UFVzlEPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3pM/hMaQMHM5YRWEwlB72mFX/rYcXH9bGg3TAnGgFk=;
 b=JrYENY4P8N6EzE+vrymCmOA2sap3cLu/odLDHKpbl14Y/YZ3w2FozLG0PAlL4pC6C9f7REb6EUJSjYGBL8ymYT4tFQmF62NYklkm1HX4Us3P3u2jiuoQcIt6ofKd2XHYwnihevcGcQvvNFkRHG6e/cGjT42JZ58uWDR7G3yZcOvbdcEWMaB3xiCNmznPONlYd65/AuiLou+GFBP8DrSKji3kbLd4OXlKIBZC0LeuRwu/WAih/6z4Q/JCWdZGDwc69a7xf8kWy2L/Y5/gIOm4/jMgYcIPnz/h3pXd0Lu2qYrlD7VHQCenz2W+L3jc6TGRY9pvX+659B04TwooPn+g+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3pM/hMaQMHM5YRWEwlB72mFX/rYcXH9bGg3TAnGgFk=;
 b=JOlhXhtpC872FAZcI/SDPaBS42nNBSqZR8SC7R/4UgkIhZ6A1UiZCu/Cy4hYEwu9sBedufk6XfG5I32Z2A4PoDb1nxC2iUOEHmv5wHsgsKJi2tS3w0SiTgUvIFviG41Cch9aF0O3Md7avGiTuLeNvK14p5I+WIUCncyxgX6bDkb6gkZhaO1Gf7qjfc84exhXendwWuAl3Cf+ghWwhQ4RpASO23dPr8nDL9DvBNUO9uCud6ao+9YCNuioJpcKH6yatfOaO59PQnew2ONjCPwBq2uzdI9QwrVUA3hT56kZeD2C0AVjh8IBqLaZqTWhghmWnrPvxR2THd6yjhjJPbhL3Q==
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com (2603:1096:203:82::18)
 by HK2PR06MB3570.apcprd06.prod.outlook.com (2603:1096:202:3f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.23; Thu, 26 Aug
 2021 01:55:22 +0000
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::81e4:c1:aa1a:aa75]) by HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::81e4:c1:aa1a:aa75%7]) with mapi id 15.20.4457.019; Thu, 26 Aug 2021
 01:55:22 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Tao Ren <rentao.bupt@gmail.com>
Subject: RE: ASPEED EHCI error: "controller refused to start: -110"
Thread-Topic: ASPEED EHCI error: "controller refused to start: -110"
Thread-Index: AQHXmXnLUE/Ov+V/OUqc28a0JBlMZauD18WQgAEvdICAAABNwA==
Date: Thu, 26 Aug 2021 01:55:22 +0000
Message-ID: <HK0PR06MB33803291028756571A337086F2C79@HK0PR06MB3380.apcprd06.prod.outlook.com>
References: <20210825062348.GA18567@taoren-ubuntu-R90MNF91>
 <HK0PR06MB33800E25D0C103664C9129F7F2C69@HK0PR06MB3380.apcprd06.prod.outlook.com>
 <20210826015254.GA24175@taoren-ubuntu-R90MNF91>
In-Reply-To: <20210826015254.GA24175@taoren-ubuntu-R90MNF91>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d6e05a1-44c7-453d-6f07-08d96834909b
x-ms-traffictypediagnostic: HK2PR06MB3570:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR06MB357006D0E399F63FD0676738F2C79@HK2PR06MB3570.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fFFOOO+Wyqehh1h2jY6UK6QsPf1aYScLRvOf9AN0f7JLa8//T/SzCW9n66i+D9knZ50MsFYIxKmGedxGvGs/OjnKvjDFfB/X8/J3P79n840ue2/T0ORV/WYClobQMYMWyTln4ZAZGZksEJ3+aJCPJPdhLBmeAss0kkX5LwOxGeRYLaPS0ietMl4YzRNjGkJxYUQGmxqp6C+9tSC2/5fU8J4EFXimaI2hvmjWhofbpmVZBBH2iDVPdQwLVu1uatKHJ5936ku/W2OeytzdiyXvOKzamsGPunXWp1Mlmh9pU8k+lMSmg2y0Y+M7esmyZzt+XxW1CxS6cAg/RayfGlefcKrAbfk4cIo6L9LxE/kbDAsNN3ZdvovqSmy3ZtLcTPmEFzjTE3+0JEbHlF7sHIm3MbAEugH9P5B5CQQyrvhllbauUN9WSceoAlpPfgl7gcQ5oFNg7rL8KDEYk9iO2E/MvLjsiVzF8sFXC7/w2C4xfxJx7F0hHQT7LBQ19Zh2hG+BvJW+iZCCOfXsdEQuN427bI6APa0BgWRKUeMpVwQfKG5CaCgXqOG0jx2PWA9Yl6vZ53JSVdRfRQK539TBEVmpn6tcXpccq0Ka6qirC+QFgQPt+2q4gDlafhJdTGCqZSqZZlP7EtmR4tVymQmK277XipEgFF2zHToj96xKmWaTBhrT0Qe2hPB9dC4+/ottl5c2hEXb++hrNDuGnLj+4p47nA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3380.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(396003)(136003)(376002)(39840400004)(6916009)(2906002)(86362001)(38100700002)(122000001)(33656002)(38070700005)(83380400001)(478600001)(8936002)(6506007)(4326008)(7696005)(8676002)(53546011)(186003)(26005)(5660300002)(316002)(55016002)(107886003)(52536014)(9686003)(66446008)(66556008)(71200400001)(64756008)(66946007)(54906003)(66476007)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fNAkYjbD/PB58c0tVDH+G6TqAnIDNtm18jB10zTh9THKgBRxpI6zLd80IZ/9?=
 =?us-ascii?Q?Axpnlnj2PErKhOSBK02B4WhySUDt/vT5QFM5WpHHLPTiBykjvh4/SpC74mr8?=
 =?us-ascii?Q?u10K0/3HpqmVzm7MZzSAGSQGsu5zzKdULp6LLBaOKDyXvJq/2yCeQlSxU5zl?=
 =?us-ascii?Q?y+ganZT0pABxGKjiI1bCkYlorHgu0tXejFtwxvZoLFlU1VDoKUTbpMP70daW?=
 =?us-ascii?Q?bfbHbhU5joi6vAFLDDsJHlbKGTfBN6r7HQNfudY+FNT7wBFoXgJRo+Vl+qoV?=
 =?us-ascii?Q?qB//moxrOTcdtedOBuF4OjN1FuVyJSgbd6bCXQwfHOKqlZAZsKSPaUSjVQd4?=
 =?us-ascii?Q?cTbB8mvn1mJWM2DiF/pPakV+t8Dyy8jfwZNE3LZYrcN/LtCR6PxUHtBLuWtl?=
 =?us-ascii?Q?WBDFSEqQ/x3T1hpUD2mpvjhTwj/2/zB9bz2/gBRgVdne5PZAUYY9B29rVllO?=
 =?us-ascii?Q?rjp2h1EYALOJX3MLD/UqaWI+9r0vrVhvS9cGU/pTgS44gqUnkHRnROuT4vNl?=
 =?us-ascii?Q?L6Cbaw2JW+ZLCVmigvstCJl1xjQpIzk1Y96MZ+oQyUPB5ymo7QEat424QryX?=
 =?us-ascii?Q?6ixwWtA1rAZMqvR8yVvjtu5ZK6U7H1AczKi7fRRcaEnJBLX8PoWxyGL3xO2D?=
 =?us-ascii?Q?JhppHUbMXs3Bd4ysPLi7P+pexM5NawoPoFQ3sjlktnY84SRtSGU+nitXxGbO?=
 =?us-ascii?Q?J4iCgeVyHYXWACyAQ7HDUHaOP0bR0CfbS8B9Pg4mQXJIg/Q497cVswBXFrI5?=
 =?us-ascii?Q?6+c5NguqoAaSI5NgGPEG8c8U0Qc+mgW3dr7rwI4EMuFO6BKrjl5vmeM8tx5h?=
 =?us-ascii?Q?nwWZmLuSiEYmEbUkBKCzbqFtYSXudlxeeCw/qbIgFxxOEPGEUlcT+T6Lft8T?=
 =?us-ascii?Q?GgYuZzPouv8cmhHt+fgH8M4F8j5WKnuI/eJlEFbDGK4BL2qTnAeBEllwhatJ?=
 =?us-ascii?Q?aeEnGF7lsLRgh9O61FBbC8bRNP3sABtnes6EH1UifrQ9+uvrb0JB8uHUDzKK?=
 =?us-ascii?Q?FDKSe00qadEXD9pZg/iweiFQ2zoFYO3bHeRXx1Ij1fV9Jn/lHOECSTCIuTzY?=
 =?us-ascii?Q?alI04qo3K+QgWvuKneG4V1snHg16OeZOzkEuAibfzkSGQpb7FiZDwgcekSyO?=
 =?us-ascii?Q?KPoehqAu9oOS8Qcm7GM8gxSWp4n1e27P+N/25qZ5HMGCNSiQH7+Vw1K8a3vl?=
 =?us-ascii?Q?VHvfyXM7IkifpIUWPACn4l17PSPv42fE1iNCdMlX5zCniaCndXgv4vxjh7Vd?=
 =?us-ascii?Q?/kgJKsoNP0v4tAk4wBHjCfe+4J8GmebcyLNz4cWXfdHshkTEe0JzalmGIwvC?=
 =?us-ascii?Q?J2b5R95fFpHZvhb/j9SodpgR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3380.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d6e05a1-44c7-453d-6f07-08d96834909b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2021 01:55:22.2749 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D5+ZrrXGwybhyv9vTb4glXDIHDfK+c2T2lCiARPLk28SKI5CsgvY3ZJKgUMaqZt6boQY/xLrsYwvElU8W706x5DB4iw3yCkJG6AKpaGxAHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR06MB3570
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
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Joppa Tsao <joppa_tsao@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> -----Original Message-----
> From: Tao Ren <rentao.bupt@gmail.com>
> Sent: Thursday, August 26, 2021 9:53 AM
> To: Ryan Chen <ryan_chen@aspeedtech.com>
> Cc: openbmc@lists.ozlabs.org; joel@jms.id.au; andrew@aj.id.au; Neal Liu
> <neal_liu@aspeedtech.com>; Joppa Tsao <joppa_tsao@aspeedtech.com>
> Subject: Re: ASPEED EHCI error: "controller refused to start: -110"
>=20
> Hi Ryan,
>=20
> On Wed, Aug 25, 2021 at 07:48:57AM +0000, Ryan Chen wrote:
> > Hello,
> > 	ASPEED EHCI design for HALT bit effect is depend on
> Asynchronous/Periodic Schedule enable or not.
> > 	If Asynchronous/Periodic Schedule not enable, but run bit is setting, =
Halt
> still =3D 1.
> >
> > Ryan Chen
>=20
> Thanks for the inputs.
>=20
> What is your recommendation? Enabling Async/Periodic schedule to make
> USBSTS.HCHalted handshake happy? Or ignoring HCHalted check for ASPEED
> platforms? Can you please send out a patch to fix the failure? The EHCI d=
river
> stops working on ASPEED platforms since v5.10.
>
I think it should ignoring the HCHalted check for ASPEED platform.
I need think about how to patch for fix this.=20
=20
>=20
> Cheers,
>=20
> Tao
> >
> > Tel : 886-3-5751185 ext:8857
> >
> > > -----Original Message-----
> > > From: Tao Ren <rentao.bupt@gmail.com>
> > > Sent: Wednesday, August 25, 2021 2:24 PM
> > > To: openbmc@lists.ozlabs.org
> > > Cc: joel@jms.id.au; andrew@aj.id.au; Ryan Chen
> > > <ryan_chen@aspeedtech.com>
> > > Subject: ASPEED EHCI error: "controller refused to start: -110"
> > >
> > > Hi,
> > >
> > > I started to see below EHCI probe failure on my AST2500 and AST2600
> > > BMC platforms since commit 280a9045bb18 ("ehci: fix EHCI host
> > > controller initialization sequence"):
> > >
> > > > ehci-platform 1e6a3000.usb: USB 2.0, controller refused to start:
> > > > -110
> > >
> > > The error happens because USBSTS.HCHalted stays at 1. But if I
> > > ignore the error at probe time, the downstream USB devices can still
> > > be enumerated without problems (even though USBSTS.HCHalted is still =
1).
> > >
> > > My questions are: why USBSTS.HCHalted stays at 1 on ASPEED
> > > platforms? Do we need extra configuration at EHCI probe time for ASPE=
ED
> SoC?
> > >
> > > CC Ryan @ASPEED for more comments.
> > >
> > >
> > > Cheers,
> > >
> > > Tao
