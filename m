Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA76E91CA7E
	for <lists+openbmc@lfdr.de>; Sat, 29 Jun 2024 04:17:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=nY9PyB+N;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9wv82klKz3cYt
	for <lists+openbmc@lfdr.de>; Sat, 29 Jun 2024 12:17:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=nY9PyB+N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::714; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=tommy_huang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20714.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::714])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W9wtN6f3zz3cBK;
	Sat, 29 Jun 2024 12:17:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ThJUu+vHjvqMrXFQgYv7UEhvXmCMimW/hwX8IcVX9PuPs5wXBmWT3Sa+EMIksI3ZyKJIBcYJ/VDRw/d94k/98riWws9AvAo2OkJICSx9H3JFy8NERFoOJNw8zHO1PLP4eZY7RSxzuk0olZHWiL0MoB/3fV6FpUAoVrmRz1aUgmex1hEjGGcsjRGPNMRdERQMV91To5vt1iS3P2WIzuCvf9cjC8PtrYcLbQP+mDdXsHPZIS7Qo9z55y3qv2Lbt6ENnwpTUYoJb49E3Tgy6IoSi0fPKHMsdt1iy/6dTpPfvmKSXuNEyi0DMx0WC+wxdB5VeJRiA0RSJp0Mm9cMavSZOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/3mAOVIVpOenaQ2K3sUPNfODz7TyxyiMc6kYjfnKZY=;
 b=GL4HaL4bGOE8buL544pbdFNv0VaSFCaafeDxOX3SfEpMIRmP1bT7FwpNottRl94zkJzhoXGMM/xZmpu7YeYAk3MhzRVaJL5n97OShrmLFAFk+iPz1dfD3G/dwNHWrKZ6ZwR/fC6RqRWXly+pJ+TVKnIFGc1O2MdKPZ0QyYCjZQTf+etgyROIPK5VYdkJ0CMhpvFT9nFopPDcS4J2f4ul6Tq1WyJG36fG/znKeZiF+uY40M/nH1O66NDL88bqxbR+KUaS7aJ2dJNAXFOaPYv0FNokSTYql7pyXE5Yb1aJXRmV1TD74TA8aEK3VrxRk6nruMlh1Sce0LPHxliUzgXbLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/3mAOVIVpOenaQ2K3sUPNfODz7TyxyiMc6kYjfnKZY=;
 b=nY9PyB+NwsqoQuDV+JKpTNNeROXBgH+jPC2G//vjs+IAKXus3ufKXyv3c24zAj9o4lXd6V7XoCnCh/q+Q6OjtvTeuUxVAPOzNovckwH8ou/aTunwusnif5ornQII7GjSqeBgcCKEqyZa29iRGdP5YrhU7rOTdgPT5Y8Lw5DsFfJVp+KnVVzUJxOWuHqPQXB0jydRS1vqXrtew5X2f3Xd+ZEgdVwy69LZ2hY7DgjYo+WigFtcSrN7QT2THk7SARqR53Jx/EjsGtZrVtA5eMU1pBiT+ePnP8I6hpGWrhlUPsQk1kd7Wh4xW1V4UhAQEi0t50haHdYmwf4/Dae0kBqhYg==
Received: from TYZPR06MB6191.apcprd06.prod.outlook.com (2603:1096:400:33d::12)
 by TY0PR06MB5707.apcprd06.prod.outlook.com (2603:1096:400:271::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Sat, 29 Jun
 2024 02:01:33 +0000
Received: from TYZPR06MB6191.apcprd06.prod.outlook.com
 ([fe80::cc07:35e3:9143:c8e2]) by TYZPR06MB6191.apcprd06.prod.outlook.com
 ([fe80::cc07:35e3:9143:c8e2%5]) with mapi id 15.20.7719.022; Sat, 29 Jun 2024
 02:01:33 +0000
From: Tommy Huang <tommy_huang@aspeedtech.com>
To: Andi Shyti <andi.shyti@kernel.org>
Subject: RE: [PATCH v2] i2c: aspeed: Update the stop sw state when the bus
 recovery occurs
Thread-Topic: [PATCH v2] i2c: aspeed: Update the stop sw state when the bus
 recovery occurs
Thread-Index: AQHauV2Dp84bGIE9yEKITA1l5lLjSbHb2cWAgAJDIJA=
Date: Sat, 29 Jun 2024 02:01:33 +0000
Message-ID:  <TYZPR06MB619173FE3D74760214A03636E1D12@TYZPR06MB6191.apcprd06.prod.outlook.com>
References: <20240608043653.4086647-1-tommy_huang@aspeedtech.com>
 <pbsrfzbd237k5inof3wy6qabdmolmweozkn5kq7jlvstj2nkvo@nzp2sbrxpn44>
In-Reply-To: <pbsrfzbd237k5inof3wy6qabdmolmweozkn5kq7jlvstj2nkvo@nzp2sbrxpn44>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6191:EE_|TY0PR06MB5707:EE_
x-ms-office365-filtering-correlation-id: bb19b080-df33-41d8-ffea-08dc97df6666
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:  =?us-ascii?Q?G35dNyWKjUxukSCZITXwLsA2G5rrfdHBCZv08ySfFg8QeuT74lZAZvOi+Qtf?=
 =?us-ascii?Q?bfYVPdxvwOy1UUCVtgLs/6VSo/20J2067Susdn53B0vTi5Y+NPlWRwFkvenI?=
 =?us-ascii?Q?b5b8u+U85OMpaFwuHheQ74EJ3SNi7lDXUdHgsgRGYU1OMOOHDhknj242TwVZ?=
 =?us-ascii?Q?T24ogcbkMQX3myfWYBrTWysAu45w0SyUvsEa0L9NqP1OamLaTc2J8htgqQsG?=
 =?us-ascii?Q?Tvom3BX/U9u+OXBt23Xcun44QB3rOjq0flY6LW4OGYenT6QjjyJPgOQiGEXh?=
 =?us-ascii?Q?LI056c6zwZoGPLsowE7KuWgDV4VITI3p+rZDhAQeBL8eHnVnAlgmnbKJdjkg?=
 =?us-ascii?Q?qZ5dNdYBUn72xjUYRmxXJbFz/uBfmsIyCptJdDS6Ns9rTzRv8wiur6Cjw8j9?=
 =?us-ascii?Q?gL/UBM2Kx0wrbpGsxznbxGiqerS9fKV7czyXkNd6C4kThaaVoadupPuVoeV+?=
 =?us-ascii?Q?eKakHq/BdYHZzKQE1IFKEoa/cKHC7VMoWXIfL4dA2UWfBRvP5s6jqca0Mq6S?=
 =?us-ascii?Q?A/isgqvhPoK4QQzS7ojU8t2QPEKqG2LCalmzbL1DGUvEjtCD+KfJUv7nftBS?=
 =?us-ascii?Q?5tOT/ffpHwas8QNCJJUk1BjovgMO+ymu4QoeBpQYAEpUHVP317wNR+nVLBYz?=
 =?us-ascii?Q?bPfP2dz1yB0cyhAJKWtKCWHG73uYFjW2sk0dS6chKGV/YZGuclDuAN8ju7ep?=
 =?us-ascii?Q?vjL5n3YZl89nF7baYmfbkLgMroxD3w/nFYdyIlFZ5Hu4R7MXjR5XCOJzbP9c?=
 =?us-ascii?Q?YHjfU8IqrxSggqE4Smc89wQwIbYYWqwCLoEGg3J/KM6LcxmmIUxHjAGckJHZ?=
 =?us-ascii?Q?jVlFHOaRvBkVjrZEsJzS1veCXMVkCk8RJSUIGIBobzedd3fy+SINAE95Qqwb?=
 =?us-ascii?Q?5NK6CR+0jkOGQNMx6ntFfzXZQ0KgiMKgl5ZOHokA+ffXGNUj2M3NsZ/iYyGC?=
 =?us-ascii?Q?ENnwCMujNdCWoUUtenmFR8TfI+80p44WMbMu8gN3FLxurbc/6YkzGBNFsU1q?=
 =?us-ascii?Q?OZpLOaMYSQLNuDHk3kdWpw+WtgjkmFpv46nOdcHT2UHctYldclSMhgwQuJwd?=
 =?us-ascii?Q?mmKGwvTUzzM6RUEXnhzIlMAQMIYPDinsh0j88cgzhC2yg/UsXr0KeJM7w8Me?=
 =?us-ascii?Q?K7OF9LVlPYOaQ4zrdQdS3fewkGDIC0GDTCbQXjv4gqlS5SGKu2v02KkxcKBA?=
 =?us-ascii?Q?hfp9EojyY+2ug+p/NIoA3ii3mNn3cvQYb2+Z/4PDVvJpEyEHsqcgHWwyGS7r?=
 =?us-ascii?Q?9W0iHCjHYBfn32VfHcK5YDOw+O9/4GcCFTcxIicrUflH/5DqZbvpM74DvhUv?=
 =?us-ascii?Q?0euAA8fk3E/BAg/v4zOQovWlRzb42FtxVUx+FKHJBZNG/ID9dN21AvqDhtgf?=
 =?us-ascii?Q?a+Z11uU=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6191.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?ZqtbmtRo2HPsQYmw/ibxZb+QYVxsmBI9oFrqStnDBUMFcQbPdLVU+PKqTEEI?=
 =?us-ascii?Q?FV4Fwa7QgbD4jBwiYMBe8vIlOZpLK43bggTe3kglIpqjoHTtb+tTbOSaPNA3?=
 =?us-ascii?Q?xfNPFVpzTwWqkAOTZhI2gRh7aaEkyMNZDriVmsn5KOmBUc2l0/yE3Fx1hloc?=
 =?us-ascii?Q?QZ9L0mXUrUClVNU17iX5+Lvyobyb1AhgZveShx+ge+cT6p4sBKReRnvYQp5A?=
 =?us-ascii?Q?Yiiz66RfUTi/FQW3bsD4E7YFD/UMVXxufekxZwFN4IGOMuQLuMANlzIoFpUq?=
 =?us-ascii?Q?4VUvPZgy/B+vnCF0YNR8jPheXy9RXma23ehV93eRHTStYH0t/CUbsBqKWKbG?=
 =?us-ascii?Q?nyc6tbyF8MMuzANSTFuMTydsYry2CU623TJUfUoF5bMkMEiKIktM1iSibAM0?=
 =?us-ascii?Q?ZWDEh2jF1TwP21DzyldkuE37lX1Uv13zT+nhes5Dcqfif/oxpiWcwsmhcf3J?=
 =?us-ascii?Q?/Lc5kkL1QsdAupeaPWEvGsn9qS+ChfizxT1bmZ4JELciI9fYqmGG4FtRF3WR?=
 =?us-ascii?Q?mxdGPoRRxG4ab0dPfcpNnHGtPtng2sJhvarMfBV4Hg0YSlBk0Ju8ko7Fe8mV?=
 =?us-ascii?Q?xRRFDpscZJ03/5BaMLE6u+BDXAeuy0g/i6RtybhpWsDG1YKkbE0VuP/vCmSg?=
 =?us-ascii?Q?gEgusnUADeWUT4M6OvrsGKojIIB4Jon863bliP6qU6a4TrEUwMjrdd2kh6N/?=
 =?us-ascii?Q?NONDRT/GKpJJuxGW4HtnwiUxfErhxCfOUdiCTgVWIfMN8HfOcPReL//Ewm4M?=
 =?us-ascii?Q?Cj7sMi9iK1+HoQDM29tA1NyArJXKO0plDjtw8l0g/4HNrlsUgI4pnBA/G4Mn?=
 =?us-ascii?Q?gw8z/PoimoGGLsOlyBrnqhmGT8xmWSYtSNZdRqWnPZFAMkYVEc+9kwl0Xtgr?=
 =?us-ascii?Q?7bPl1OjgLJeiSwo9xXpLaQ2X+Fghu59weQWwMdjWwH0pm5FnLS6dGGXOHs6w?=
 =?us-ascii?Q?6iBorP6lvNSyrHrhWFnNplgqLVy6N/OdEaKXnXWRZZbV1DPJzTHTNr53EUv8?=
 =?us-ascii?Q?RDU1GGCH+815OQ0I7PZEjHxf3NbwVgvhxYQCHfPlmF05vzbAyf5MYhZWOgQr?=
 =?us-ascii?Q?ytw2GXWI4/xlNZssKg5mGxwc7g2minskd8rsx11Ex+KrD4BbnaCR8vstFaOZ?=
 =?us-ascii?Q?9iPnCjdUifnDRKnDuRFgPeaXF2jkxGoYP/HBPgO8MF/DemdUdzTO3hD4uMvJ?=
 =?us-ascii?Q?2Kw5+ZoLvSiFd0Yke4IRgIIkMFbsPZtfdPNYN/iS+pxsUibKHSGcVH4REYte?=
 =?us-ascii?Q?RSsxL8Ob5t0vBd7Jx/zJJDOYds7n65LCWah2srzyom2QKe8EjgBiHjCIFUVN?=
 =?us-ascii?Q?B6kAnnuOklgDTXKeVaUgF0o58lYBdoIcASqmeA+D+zd7CQAzymT+zT61PMhz?=
 =?us-ascii?Q?75P2iDbGGo+D+Aq1lEbGueqSBbiBJkAX6CHZk4LXepfOFlw3XpPX4kCCQfW1?=
 =?us-ascii?Q?RXsv8EtpizMITmGOIEgWf7ejGsYp3NO+Ys3aZjPOTAnR7qm74wTL5Yi+n0xk?=
 =?us-ascii?Q?4+Cju8x03njznCgmQecgiM1fPIXS2i4UWOq5s27HgS207YQbS7PKi3Fa5PAJ?=
 =?us-ascii?Q?ZPJs5FlPeHfGnUEg/gMhQTJqpADcpfXQG8xDtvSj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6191.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb19b080-df33-41d8-ffea-08dc97df6666
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2024 02:01:33.1122
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h/CQLKGMyUwtOV1KZtM9ThmsGwXZXbIrpwzRJAkA+TLiwY9AI3cmKehnSEQOl8AKMG4TBGhbao0tZJiPJ8iPjnDbV90ezupX/fpMEl8wcy0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5707
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, "wsa@kernel.org" <wsa@kernel.org>, "brendan.higgins@linux.dev" <brendan.higgins@linux.dev>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "joel@jms.id.au" <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andi,

	I have sent back the mail on 6/11.
	But I don't receive your feedback, I post it again in this mail.

"	There is a problem to move aspeed_i2c_do_stop() on top.
	This function is like with aspeed_i2c_reset function needs the aspeed_i2c_=
bus structure definition."

	BR,

	By Tommy

> -----Original Message-----
> From: Andi Shyti <andi.shyti@kernel.org>
> Sent: Thursday, June 27, 2024 11:26 PM
> To: Tommy Huang <tommy_huang@aspeedtech.com>
> Cc: brendan.higgins@linux.dev; benh@kernel.crashing.org; joel@jms.id.au;
> andrew@codeconstruct.com.au; wsa@kernel.org; linux-i2c@vger.kernel.org;
> openbmc@lists.ozlabs.org; linux-arm-kernel@lists.infradead.org;
> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org;
> stable@vger.kernel.org; BMC-SW <BMC-SW@aspeedtech.com>
> Subject: Re: [PATCH v2] i2c: aspeed: Update the stop sw state when the bu=
s
> recovery occurs
>=20
> Hi Tommy,
>=20
> any update on this patch?
>=20
> Andi
>=20
> On Sat, Jun 08, 2024 at 12:36:53PM GMT, Tommy Huang wrote:
> > When the i2c bus recovery occurs, driver will send i2c stop command in
> > the scl low condition. In this case the sw state will still keep
> > original situation. Under multi-master usage, i2c bus recovery will be
> > called when i2c transfer timeout occurs. Update the stop command
> > calling with aspeed_i2c_do_stop function to update master_state.
> >
> > Fixes: f327c686d3ba ("i2c: aspeed: added driver for Aspeed I2C")
> >
> > Cc: <stable@vger.kernel.org> # v4.13+
> > Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>
> > ---
> >  drivers/i2c/busses/i2c-aspeed.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-aspeed.c
> > b/drivers/i2c/busses/i2c-aspeed.c index ce8c4846b7fa..be64e419adf0
> > 100644
> > --- a/drivers/i2c/busses/i2c-aspeed.c
> > +++ b/drivers/i2c/busses/i2c-aspeed.c
> > @@ -25,6 +25,8 @@
> >  #include <linux/reset.h>
> >  #include <linux/slab.h>
> >
> > +static void aspeed_i2c_do_stop(struct aspeed_i2c_bus *bus);
> > +
> >  /* I2C Register */
> >  #define ASPEED_I2C_FUN_CTRL_REG				0x00
> >  #define ASPEED_I2C_AC_TIMING_REG1			0x04
> > @@ -187,7 +189,7 @@ static int aspeed_i2c_recover_bus(struct
> aspeed_i2c_bus *bus)
> >  			command);
> >
> >  		reinit_completion(&bus->cmd_complete);
> > -		writel(ASPEED_I2CD_M_STOP_CMD, bus->base +
> ASPEED_I2C_CMD_REG);
> > +		aspeed_i2c_do_stop(bus);
> >  		spin_unlock_irqrestore(&bus->lock, flags);
> >
> >  		time_left =3D wait_for_completion_timeout(
> > --
> > 2.25.1
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
