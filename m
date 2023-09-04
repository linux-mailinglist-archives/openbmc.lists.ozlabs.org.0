Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D64077914A0
	for <lists+openbmc@lfdr.de>; Mon,  4 Sep 2023 11:20:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=HQ/Gnc2Q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RfNQW53Svz3c89
	for <lists+openbmc@lfdr.de>; Mon,  4 Sep 2023 19:20:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=HQ/Gnc2Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::70e; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=tommy_huang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2070e.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::70e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rf8Kg0931z2yG9;
	Mon,  4 Sep 2023 10:14:58 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IfX0uJQrTvH10CVBebjwJyKPVSVKxneEQULd3l2NIRRLpdnD2QSe9AaVDLkdauJD/9yv5EUiIixR+lokpg8m+DpSpqL2/STyNUJC3I/PRTHb27qhlGz7khc5y6Us1fxsO1K7aKz+L/QsFj5HaB5XNssk6TQc+h9UKG31rwztrx2RFjt1axk457GbeANxLYGY9QLkGR1CoyVcxzopnkxD3TdHonvXeQAq5AEGYxFzWU8JyK2hKkpz3JkO+gfPcrxWjON7u8IFBEe5qeqrJAPgLeI6oEJYqIHEOq5+kh6zUhff11akg31WELBf6M/T/Lj6ngcF9hrrd/umqVSILqv1RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PO6lW+XtJuVzRU5T0o9DqdXZDtfJ661DFWc7vL9swN0=;
 b=VNx+ZRFTSX8J+dkj78HXu2gI3DQENEuvD1v+qVR74nMTzhPHslJiCpxPIRG3ZuRzJ75IT68+V3sD8Qaql4AJzgaBypgZqpLxUiwOQNVSibGs5sass03jTfr7qCghjjp8IvRAMEfriPHQHf+LmWgKdEPieRamnAAKRRrbdmYSJmz4o7UMbBsUHlGea41Za2OqzjENbEBnNvKdUY7ipkfssrG4tUD4hMR4PA4s6tlauagSuWqeMybOJqWhSDEelb/9RfKwFUBlUYM1rtH2qKm+LTEU+8K9FtO6AbHlB3DLdtoVwg/3lWIwVn0TMM0GRtElAzomv+Bl2be/toUa2hZpgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PO6lW+XtJuVzRU5T0o9DqdXZDtfJ661DFWc7vL9swN0=;
 b=HQ/Gnc2Qha8AVVfz0cmJTgEuppTVU+PDcksSw0bC8gSMyd0NBMYOhABHJulp/HPBu28KJd7JYwGkJ6qv2lVD08TgwNEvQKX5ZgdAYQGy+boEdaqsuppzoMQQP7y0Aoo+b60O+oIKZNjyPRyndAiYgabKwAqxJDDptfkebSfiS0ZnNdZRcjlhXoHIcEE4egMfh+Pfz8opJ61R38eGgtAKzS8aL32itFsWZG8+cx9rE/j0MCK8JWGOz0tB9rtZbMHuQ2AJMdLOH9/xe6Tt5spIDtmnaFA9Rb+oRbsRCx2ZooNIjK9DZGck+LL4L1GDdNn0gASpZzFFuH5OLLTtndQC+A==
Received: from KL1PR0601MB5614.apcprd06.prod.outlook.com (2603:1096:820:9b::8)
 by SEYPR06MB6203.apcprd06.prod.outlook.com (2603:1096:101:c4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 00:14:32 +0000
Received: from KL1PR0601MB5614.apcprd06.prod.outlook.com
 ([fe80::8d9e:8356:2b79:5276]) by KL1PR0601MB5614.apcprd06.prod.outlook.com
 ([fe80::8d9e:8356:2b79:5276%5]) with mapi id 15.20.6745.023; Mon, 4 Sep 2023
 00:14:31 +0000
From: Tommy Huang <tommy_huang@aspeedtech.com>
To: Andi Shyti <andi.shyti@kernel.org>
Subject: RE: [PATCH] drivers:i2c:add controller reset when the timeout
 occurred
Thread-Topic: [PATCH] drivers:i2c:add controller reset when the timeout
 occurred
Thread-Index: AQHZzqCpMZ9pcTUF9k2wXdoSoXmt/bAJROGAgACm+eA=
Date: Mon, 4 Sep 2023 00:14:31 +0000
Message-ID:  <KL1PR0601MB5614646277B7E656535799B2E1E9A@KL1PR0601MB5614.apcprd06.prod.outlook.com>
References: <20230814111534.2771900-1-tommy_huang@aspeedtech.com>
 <20230903141519.ha6aakgkrq6ohy5s@zenone.zhora.eu>
In-Reply-To: <20230903141519.ha6aakgkrq6ohy5s@zenone.zhora.eu>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0601MB5614:EE_|SEYPR06MB6203:EE_
x-ms-office365-filtering-correlation-id: 8adcd1b5-da7f-421d-cf0d-08dbacdbe94c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  HeFMgd90CFmmQ4FLLS0N/WiSNMS5Q41wmhhhoL5kwpOj5SOydFXJYNqSKTHEihSuebjyOqXeAcTDapOVmRuBH8YWoZ1dsWcgw8cR3ZhFZa7/pBtSAHBobZjqKM/Eerfkrok80LYAcAndPEcY272MORI2Q70Ex1omds98hdNvtiv+cvbH4Ijm4UVk3AXyC2Ksi6TMmT8/2Q3NSrWBd06GIT8FtHoSLSX9Y2d21ZbiI2kDjWvYw3hMLCNPkURDO/4Ycfk6efF4lHox3vSuKQi5XfY8+kIN+jDlTTLNme1ZQ65yx0jNAZkUyR9AhfKpnxI9USzo1p3654j3IrWzRnp0xNWVB7bjFaH9ey/hqt776HusHRABXE4ZN8yf/ZD1zIGAM+xmma9WR28ZMYkaTNwXUGIuwHTolaEzRL5NCaS2O8wJWQyDw7tbFw+lhrY71r7Y+jDgbDlxfOBKhzgt4+wgGMQArp76HWLwYcOJv9K7whh54EYML3GIG1JBjWfzjVnfBNGXXk5HeE7kWF8sXetIq6hJmL6fogBnx1xNTs+cAHFFp8it0p+9YQ3jGaf9rJhEmtamRCua3ZLPAOb8E7r8s2b4zbNfHr61p6lRw9Ut46iBAKXM2EG6ByAwqgbS0xb4
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB5614.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39830400003)(136003)(366004)(396003)(346002)(376002)(1800799009)(451199024)(186009)(8936002)(8676002)(5660300002)(316002)(6916009)(64756008)(66476007)(66446008)(66946007)(54906003)(2906002)(66556008)(76116006)(4326008)(52536014)(7416002)(41300700001)(6506007)(7696005)(53546011)(26005)(9686003)(55016003)(38100700002)(38070700005)(122000001)(71200400001)(478600001)(83380400001)(33656002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?yx/1Tuce5lor2sUNTN2kk6QIS89WiCp6123R4SpSHjzfCjgRCSU9CE/OB42T?=
 =?us-ascii?Q?+kHduAufiUgTpEN6tnRMHI3K1lDFF6RafOsvM5SMgr4+kA8+x3kmPleuhMCr?=
 =?us-ascii?Q?k+kYXEql00YicTIC+fjb+2x3Vs797kYcDLUk6VPmgOGtfLLekQuCfePodeac?=
 =?us-ascii?Q?OsRmgDTkA04jB+OzvjeeB7eArhjYSuexEpgvmN8OwPMi6u01pyiNSo85mFiR?=
 =?us-ascii?Q?3ZOB6RCOigKyPPit5lgrIALGn1UvgfFkyKv34kt+rYumawMstCHDUsT4V/Ex?=
 =?us-ascii?Q?uq9h8BM3QTjT49RqSUIuEf+p1htS3ErhKKQSsM/0cc8uSE9d2ctZZuzxuXhF?=
 =?us-ascii?Q?6JZqzndTY2Djc6uIuWM399vit9rISLquYo4iMGbciJYLl0VSwKPYyqKxsmC9?=
 =?us-ascii?Q?KGS8HgbaXstmZ3ojt5mnld+GNJU7c6/3UsCTSG11pT+8jAXBTXq0BMpQTbHx?=
 =?us-ascii?Q?sWDn4U+hiKTCSDjvUFaMRLDYDaVbb74V1QTzStdYbyVj7Qk/eBazUeusM0Ro?=
 =?us-ascii?Q?2YYQ+KsumnJ+uWn7f25XNlrSB+WNPMjT5HDqnHlxoR4CS/7G+9aSVimGzzRQ?=
 =?us-ascii?Q?WrI+u/T35wMVsazby8CNxGx4KjDb4rRB1ydjYr+GZSIz72J+14kYT4XX5FFL?=
 =?us-ascii?Q?dCB/KIpEaeP2J8NHGOL8kGwLIWthE00Un23ky1qzQrtaBSiQPeKZ8IZlkTSz?=
 =?us-ascii?Q?uqX+z9h7YERKjUPpRw0jr8sarwX39cEovRsyhF9JTxqtC0gelk6EwvTqmrr6?=
 =?us-ascii?Q?CTpvG8vuuvYZc1AOlpqqRzUYj+FFMpY7jC4sjPqcqUV4yhNTFqNZnEEn5L5T?=
 =?us-ascii?Q?zMDX+vqQuiAePMb++f/pmiBbKPGwpqgp4I1boJjSOEy99WUjokhBFi1NOxEp?=
 =?us-ascii?Q?838cNCKefumVwYNEcd40L33B8Lf4GinDzPRV3fW4a3r5Yp1oC2UkN8GTmlwv?=
 =?us-ascii?Q?gdv2sOvlWnubZ+hkZP3Yhvv620f9Mz3A1FmNioC05DUwN31EwIACZX0qnuj1?=
 =?us-ascii?Q?e4/IX0nVpa1kdD7s4SSI9FFDHqGyJfzPN2t2PiLwgebnVbv3d7tt/v+5yzO4?=
 =?us-ascii?Q?yKTGHbY2EEDqrSseMgbFluq7wisOb/zfNae55SCyQUzyRAH8NvCjyPyJbGWu?=
 =?us-ascii?Q?70SeTLZzH/flxZRDND7fQRm/Ce1gAGUtqi5VABfGjETcnJgwWEXIFd33Ilz5?=
 =?us-ascii?Q?UMJ/dF40fHKCAYlOGyd9dNQlIF8L0YCcY3+ndoBT9osPIEhlTgatUgSzknUt?=
 =?us-ascii?Q?sdWqbxby8DXAxDur3vRjUN7s8x+Fuwj5GglJYgtxtgbttOSR0xxZjk9DhLcr?=
 =?us-ascii?Q?NiiP4Q0jACTTb6fR/wvy1WG+XTB11rRKea1SlQOy6IRIG0+8mx5VCdatdV8J?=
 =?us-ascii?Q?z1su3HHZNhy1DYtK1UR8Ax+MQ0SfuMRIsDx62AJoAxxpKGan1BNeMdiaWY1G?=
 =?us-ascii?Q?xz3PmGEqYFHPtxIdvU1F3GYgBa5ceTpzDHBAYUCKlbhYqwkhSbJ3YSPvQnwp?=
 =?us-ascii?Q?/Szp+Tx2iXCjvPRnm/vW0zn6yt9l0CwMEWE/GTGSYsT90NSKBP71dxcpIxrn?=
 =?us-ascii?Q?isZ/TH0OKd9QMeBCRyX5wdfMcDtPcJxj1fLKQHVV1wNbSxQzA6s9h+7bP1Vf?=
 =?us-ascii?Q?Xg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB5614.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8adcd1b5-da7f-421d-cf0d-08dbacdbe94c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2023 00:14:31.4947
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C9uZ9kx8swpYINP4qRVmkYPsmZEH9ARNiZhbAtjZhxxSnnmibpO97W9JrDy9Hh1o2N7oWYVWA1C/GFQjuSxakPTlXghg6e4DKYbCB8WTJCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6203
X-Mailman-Approved-At: Mon, 04 Sep 2023 19:16:54 +1000
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "andrew@aj.id.au" <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "brendan.higgins@linux.dev" <brendan.higgins@linux.dev>, "joel@jms.id.au" <joel@jms.id.au>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andi,

	Thanks for your review.
	I will fix the patch with your comment and resend it.

	BR,

	by Tommy

> -----Original Message-----
> From: Andi Shyti <andi.shyti@kernel.org>
> Sent: Sunday, September 3, 2023 10:15 PM
> To: Tommy Huang <tommy_huang@aspeedtech.com>
> Cc: brendan.higgins@linux.dev; p.zabel@pengutronix.de;
> linux-i2c@vger.kernel.org; openbmc@lists.ozlabs.org;
> benh@kernel.crashing.org; joel@jms.id.au; andrew@aj.id.au;
> linux-arm-kernel@lists.infradead.org; linux-aspeed@lists.ozlabs.org;
> linux-kernel@vger.kernel.org; BMC-SW <BMC-SW@aspeedtech.com>; Jae
> Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Subject: Re: [PATCH] drivers:i2c:add controller reset when the timeout
> occurred
>=20
> Hi Tommy,
>=20
> Please fix the title of the patch from:
>=20
>    drivers:i2c:add controller reset when the timeout occurred
>=20
> to something like:
>=20
>    i2c: aspeed: Reset the controller when timeout occurs
>=20
> Note:
>=20
>  - leave a space after the ':'
>  - start with a capital letter after the last ':'
>=20
> On Mon, Aug 14, 2023 at 07:15:34PM +0800, Tommy Huang wrote:
> > 1.Call i2c controller reset when the i2c transfer timeout occurred.
> > The rest of interrupts and device should be reset avoid unperdicted
> > controller behavior occurred.
>=20
> Please remove the '1.' and please rewrite this sentence in order to be
> grammatically correct, something like:
>=20
> "Call the i2c controller reset when an i2c transfer timeout occurs. The
> remaining interrupts and the device should be reset to avoid unpredictabl=
e
> controller behavior."
>=20
> > Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>
>=20
> Is this a fix? If so please add:
>=20
> Fixes: 2e57b7cebb98 ("i2c: aspeed: Add multi-master use case support")
> Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v5.1+
>=20
> Jae Hyun is the author of the line you are changing therefore he needs to=
 be
> Cc'ed
>=20
> [...]
>=20
> >  		/*
> >  		 * If timed out and bus is still busy in a multi master
> > -		 * environment, attempt recovery at here.
> > +		 * environment, attempt recovery at here. Even the bus is
> > +		 * idle, we still need reset i2c controller avoid rest of
> > +		 * interrupts.
>=20
> Please fix the grammar here, as well
>=20
>    In a multi-master setup, if a timeout occurs, attempt
>    recovery.  But if the bus is idle, we still need to reset the
>    i2c controller to clear the remaining interrupts.
>=20
> We take this chance to improve the previous comment, as well.
>=20
> >  		 */
> >  		if (bus->multi_master &&
> >  		    (readl(bus->base + ASPEED_I2C_CMD_REG) &
> >  		     ASPEED_I2CD_BUS_BUSY_STS))
> >  			aspeed_i2c_recover_bus(bus);
> > +		else
> > +			aspeed_i2c_reset(bus);
>=20
> I'd like also someone from Jae Hyun, Brendan, Benjamin or Joel to take a =
look
> here, as well. Thanks!
>=20
> Andi
