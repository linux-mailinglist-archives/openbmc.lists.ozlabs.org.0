Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D497785EE7A
	for <lists+openbmc@lfdr.de>; Thu, 22 Feb 2024 02:12:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=mpblMqMu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgFVL5Yv3z3bqQ
	for <lists+openbmc@lfdr.de>; Thu, 22 Feb 2024 12:12:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::726; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=tommy_huang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20726.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::726])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgFTT1dTTz30Pp;
	Thu, 22 Feb 2024 12:11:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWFP9k2eFNMEmFuUJugMNxSrFfrVZadNZ2TqNy+aA8A2x+fdh6+BtBQCMjJFKqSEYceaScrIv11bK0H5an6/LnkMjh8pmKZmLDu8s+4UWKQ23qXj66VeR2+v3ISIye2XNbNc4SwnjrdXSBs8ZnQNA8lb7AAXfuQVBcLcYw0w9ct/rJgXCcZRx4TfSnkthOln6zA+qV5QU1g+NrMNXrCPiGMGyE8qeEN9vEWVxcn1nBli5UrfrhSX8eiX6Ngd23kSRCPR+/SC0L/vyBi+tMbcVK9E8XkE7EqCZYbHCmYhVl1ww7/AvLXISzy2w8ofuzQv0z0aDHPlONEeO7SNeoJqiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TgSv/N9GYGctwQzkz4soPBAdJVH3d6F2hasa0gC1Q8s=;
 b=E8fzcfiKv29MNEvy75hVmsP44R8JSD+1+kZwxZTIhhmSwLTh1EST3o1VHxyrZUJe0dCSvbqg3uDZp5dUmk3WvCfOnpzAcdBRENtSn0mcv8duiNqNc5p60XKB8UMBx5+PpZYigHdhy4mucsrXIB9Y0ymBQTedM+1boC72oYtcpadgRa0qNX0iEQmBXUZRcDIG0w92/ScNP96sAx4wrdnQbbspSRY8N9qcz5FY1ziTLdIc60EBe2Zcm1r4Qotu3FxVVhJlT0XGYBnSAoX/sPApU8lFoQjca7K8Xjy2DXLWq9+UWKtSDk7VgaNopG0KJ2IlLYVAOfDuKKpW6B4IYPV/bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TgSv/N9GYGctwQzkz4soPBAdJVH3d6F2hasa0gC1Q8s=;
 b=mpblMqMu0emOtyrBuik9lXJgPXJgK9nIZEV+0bL+akJSMk8Rb2lYjo0KMoKzFNEPgnhPTwVfcsLuay0ghI+9fnZK4zFvOssAl5jfI9//9GPx8NKOcmWFdEszrhN81nsq5JM2CGS9YuY/N28YWmfuSbbKCFuxgetHmWw/+QOw2eqR1HOgzzjDHGbb81wd8dC+LNeOszJAHyDefaMK95QW14sEAXpzL9LeyDySf/DcsL+litE4PpXV6Py3iKciebmJBxujcm0yjmZqFwtm5nEo2CxzrqvvWgQhJDZoDKwsCgkSWmug2tu7xxBSss3EwTmSMaMZWSd0n8M/IPccHNu65w==
Received: from TYZPR06MB6191.apcprd06.prod.outlook.com (2603:1096:400:33d::12)
 by TY0PR06MB5471.apcprd06.prod.outlook.com (2603:1096:400:265::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Thu, 22 Feb
 2024 01:10:40 +0000
Received: from TYZPR06MB6191.apcprd06.prod.outlook.com
 ([fe80::e10a:d9a2:5070:6903]) by TYZPR06MB6191.apcprd06.prod.outlook.com
 ([fe80::e10a:d9a2:5070:6903%5]) with mapi id 15.20.7292.036; Thu, 22 Feb 2024
 01:10:39 +0000
From: Tommy Huang <tommy_huang@aspeedtech.com>
To: Andi Shyti <andi.shyti@kernel.org>
Subject: RE: [PATCH] i2c: aspeed: Fix the dummy irq expected print
Thread-Topic: [PATCH] i2c: aspeed: Fix the dummy irq expected print
Thread-Index: AQHaYNBg0EEa3X7oHECRXZPcHJI3VbEVVFwAgAA4R6A=
Date: Thu, 22 Feb 2024 01:10:39 +0000
Message-ID:  <TYZPR06MB61911F076C8719C6A7D57B97E1562@TYZPR06MB6191.apcprd06.prod.outlook.com>
References: <20240216120455.4138642-1-tommy_huang@aspeedtech.com>
 <nbkkaktcozbhly44hii3zwie7ivsra3qxzdibyzhyhooxrudvb@zik6skmkki2c>
In-Reply-To: <nbkkaktcozbhly44hii3zwie7ivsra3qxzdibyzhyhooxrudvb@zik6skmkki2c>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6191:EE_|TY0PR06MB5471:EE_
x-ms-office365-filtering-correlation-id: d8820bd0-5a2c-42f3-ce93-08dc3343159c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  waqxLIgI1RWo/Ls2AmYPiPkv8mR8IT+xAd3wXM3MpIfIZfUVonYtOhSF812eqyT30/F8dce6SHqUKK/7O6/WDPTdty2fFAeZAYT/ItgRkYONav7MJHUkkdJxHpipEn82O4u4nFsb45Wwx9LTz1zswKHlQxoBQt/AMbwWGtRW8/QOkmoukJHYuC97KaNLJVMTsK0sXgBz1dLyF/gVlQd3J1rfWLbHKrWvlHTmFMSdmwD5uLA8xrY4BVwWm+oOBpmNmLuQRIOh7jIGxwnGHnZ4R5gZs0iuYsoITgem5PM4aYnt1hneEtQKLOyUStvLMqjKbpNG4fHXjBZOLFlIMOwClFKlf24kCqxtV0Gi2DXxiCCaOcmL65Mtb21BbAUKll0ugS7e+6W59bQCAjdiw8iClsAQZKxiyoeUrz68RdDem4FD7KmUBLj+x4rjPz2CoRvpz2m4w/lWcwwJhDmUFHLx13X8hq7qAfSusY4JaAdRRxxXI0eL5iGcWZjM+cmFxWLsQ0QgIWWJdVDat6LNPh8sUdoHr99W9iacSabSm02Br5YHLIrErH5UdZFj4qFG/BL58tW3grBK4Nj7zlKzhmH4Ny4w3tpg5UKdOowvbZEXu4pgbj149oMvBmIi+sD04XLG
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6191.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?f9HL50F3UvtPozuC8hLj4ns8McsfcLm5ovag2Dbd3Yx2SNqmya5g2DFZtyLk?=
 =?us-ascii?Q?YZQzNhP284jTE1cY3Hn/8QvZ60GtorvPN2AWMid16fURcqYxbxJLuwjA9MM0?=
 =?us-ascii?Q?q5DZpk2eW8nrDm8LD7g/i2kU3n/CPVqj0ZCxr4rbHacwonaVL3dvqtXhScKu?=
 =?us-ascii?Q?uSVvxwkDleUCWpGtTPeM2Ih3LA3o23uGg5g4CDJ8mprAIAbf+6JJYYMqqkAP?=
 =?us-ascii?Q?Vpk3VBruzgDVmbb/xwlKBu8F3oUVhLCYSQ9svgOBxj9GRaYFeUwneRIRPJlC?=
 =?us-ascii?Q?pr7TYesmlkpCf5raHlj1jPqnDkzQWEOhJBuz/twzR405goYJWUOQck5+hLxn?=
 =?us-ascii?Q?dylHHHe7DIsRVYNEXmq011TAPx5xWvQ0SIqGe+7cQuALXyIbdYhP5YN0h40E?=
 =?us-ascii?Q?6mWPfkHPtW1U+Wgf7X7LElzSPBeAo0bkKMGObIvHDkjEMYB7cCwgU91cdOUI?=
 =?us-ascii?Q?e2vLptTJhy+XaO/+MNEhSPL4bvYLnmHpmEPbQb16c2COBLaySsd7KxZAK4LE?=
 =?us-ascii?Q?kg80TVd7aZ1dPTx3RqEbr6av+UD0L/i121fF8bB9a9rKNfPC4w4HGXmRDsNK?=
 =?us-ascii?Q?gqncGgoJS0V13gXCfzExyDn+YEX4YNNom0THhw9Kjohsqoh0z3W3roUO561c?=
 =?us-ascii?Q?hMgaKe2drH94MbAvulKBuHeYscT3/20A62F442q9ZqcdLsUVbwBsMzDqnMus?=
 =?us-ascii?Q?1R6oD8D7aH9qatXBoaSlypAEn8S0e+Y2OH9knW/Gf8J7OELFCWNBIJ3PMNw1?=
 =?us-ascii?Q?K7May5lz86jqeJpZoNLrFzgK8TOufIfEVa4YFOBFCuk11z2NCTNr9fQ94H6G?=
 =?us-ascii?Q?fYd3yGA3R0e6TaB7EOT1XeeJdrmT1qGhDt6BzNAH20K9TrEwu0AYHPiAwytg?=
 =?us-ascii?Q?GYiDYlYPrnL07oRnDRsbV/gdrBd+1e8W0+bAHFtJ2oPIlalj+LWFVZn/J26H?=
 =?us-ascii?Q?q5hyn8pPvDG+vLVXve8mTVEPAJoQxze2r46YB2RiVb54mdy42GdU//2+aIgY?=
 =?us-ascii?Q?kzy+aZQktr98PljOTLBmvgyfkqmvtUg3yYxnJvFWr8rfV02a4jsKtg5MEbUI?=
 =?us-ascii?Q?q6eRbGhRHMn3aMKc0cg0xm179x4+VOlQ3ZbkI9MFde44kPj5eEygVTHKFu8N?=
 =?us-ascii?Q?kc+s5e9mEDSJTlaBYlvpaw4Gr5oe5P7GJQo5eZxdfFMDG8y7UEur4H+vHirE?=
 =?us-ascii?Q?WHuJuNW2s2+TDm9yHJSqter3NXj2R1h5NS7L9eFHq1EmYBMokQuTsvqW68fu?=
 =?us-ascii?Q?mWE7yryxiU0n+NNn/A714idZ3rGxHztlHjak6y9bXTzVJHV0CdhqSD+GxPbw?=
 =?us-ascii?Q?6TlFOwCB1bteLLx8X9m3MfdECZr4AUxgSOl16uYJf3DesLCYlHmEle6OiKwi?=
 =?us-ascii?Q?Dja1U3CTJi+WU6UQWQuusI80n6/ZezSqunVIJlV8iDwlH4ZH0tWBG9P3slM/?=
 =?us-ascii?Q?SJlGMjMtctoZNBNE8vl0xcg5bmEzB7rwRiL42FSnmfT7EeWMBnUh7HjE/SRT?=
 =?us-ascii?Q?hL8eqLRtcmF4h6kOgmBiClA+GOdwSYuaEtRzE0vZkBKPjSFWrIX6plDvdqmM?=
 =?us-ascii?Q?t8349FEgP1eC3k+u4QMFReXh4nBQ4qgk+C/IiKBoOHH8CjGFTpPMBPHzs9NS?=
 =?us-ascii?Q?RQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6191.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8820bd0-5a2c-42f3-ce93-08dc3343159c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2024 01:10:39.8079
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fjlo6n68PIu8T6ZuEifCMasBn5ESt02J1FIhKXFzbRwF17Q4l2SUbyX/zgVjeonPzQqt3oW3XmkfsyFcdwPLmCAQKz0QzcxDaqwX8bG9uMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5471
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "andrew@aj.id.au" <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "brendan.higgins@linux.dev" <brendan.higgins@linux.dev>, "joel@jms.id.au" <joel@jms.id.au>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andy,

	Thanks for your comment.

> -----Original Message-----
> From: Andi Shyti <andi.shyti@kernel.org>
> Sent: Thursday, February 22, 2024 5:15 AM
> To: Tommy Huang <tommy_huang@aspeedtech.com>
> Cc: brendan.higgins@linux.dev; p.zabel@pengutronix.de;
> linux-i2c@vger.kernel.org; openbmc@lists.ozlabs.org;
> benh@kernel.crashing.org; joel@jms.id.au; andrew@aj.id.au;
> linux-arm-kernel@lists.infradead.org; linux-aspeed@lists.ozlabs.org;
> linux-kernel@vger.kernel.org; BMC-SW <BMC-SW@aspeedtech.com>
> Subject: Re: [PATCH] i2c: aspeed: Fix the dummy irq expected print
>=20
> Hi Tommy,
>=20
> On Fri, Feb 16, 2024 at 08:04:55PM +0800, Tommy Huang wrote:
> > When the i2c error condition occurred and master state was not idle,
> > the master irq function will goto complete state without any other
> > interrupt handling. It would cause dummy irq expected print. Under
> > this condition, assign the irq_status into irq_handle.
>=20
> I'm sorry, but I don't understand much from your log here.
>=20
> Do you mean that irq_handled in aspeed_i2c_master_irq() is left with some
> states that is not supposed to have and then you end up printing here:
>=20
> 	dev_err(bus->dev,
> 		"irq handled !=3D irq. expected 0x%08x, but was 0x%08x\n",
> 		irq_received, irq_handled);
>=20
> Can you please explain better?
>=20

Yes. If the platform met any irq error condition and the i2c wasn't stated =
under ASPEED_I2C_MASTER_INACTIVE.
Then the code flow would goto the end of aspeed_i2c_master_irq.

	ret =3D aspeed_i2c_is_irq_error(irq_status);
	if (ret) {
		...
		irq_handled |=3D (irq_status & ASPEED_I2CD_INTR_MASTER_ERRORS);
		if (bus->master_state !=3D ASPEED_I2C_MASTER_INACTIVE) {
			bus->cmd_err =3D ret;
			bus->master_state =3D ASPEED_I2C_MASTER_INACTIVE;
			goto out_complete;
		}
	}

Some master interrupt states were not handled under this situation.
The fake irq not equaled message would be filled into whole of demsg.
It's most like below example.

...
aspeed-i2c-bus 1e78a780. i2c-bus: irq handled !=3D irq. expected 0x00000030=
, but was 0x00000020
aspeed-i2c-bus 1e78a780. i2c-bus: irq handled !=3D irq. expected 0x00000030=
, but was 0x00000020
aspeed-i2c-bus 1e78a780. i2c-bus: irq handled !=3D irq. expected 0x00000030=
, but was 0x00000020
...

I thought the bus->cmd_err has been filled error reason and it would be ret=
urned to upper layer.
So, I didn't think the print should be existed.

> If that's the case, wouldn't it make more sense to check for
> bus->master_state !=3D ASPEED_I2C_MASTER_INACTIVE) earlier?
>=20

Did you suggest to add "bus->master_state !=3D ASPEED_I2C_MASTER_INACTIVE" =
judgement before print the irq not equal print?

> And, still, If that's the case, I believe you might need the Fixes tag. I=
t's true that
> you are not really failing, but you are not reporting a failure by mistak=
e.
>=20
> Thanks,
> Andi
>=20
> > Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>
> > ---
> >  drivers/i2c/busses/i2c-aspeed.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/i2c/busses/i2c-aspeed.c
> > b/drivers/i2c/busses/i2c-aspeed.c index 5511fd46a65e..ce8c4846b7fa
> > 100644
> > --- a/drivers/i2c/busses/i2c-aspeed.c
> > +++ b/drivers/i2c/busses/i2c-aspeed.c
> > @@ -445,6 +445,7 @@ static u32 aspeed_i2c_master_irq(struct
> aspeed_i2c_bus *bus, u32 irq_status)
> >  			irq_status);
> >  		irq_handled |=3D (irq_status & ASPEED_I2CD_INTR_MASTER_ERRORS);
> >  		if (bus->master_state !=3D ASPEED_I2C_MASTER_INACTIVE) {
> > +			irq_handled =3D irq_status;
> >  			bus->cmd_err =3D ret;
> >  			bus->master_state =3D ASPEED_I2C_MASTER_INACTIVE;
> >  			goto out_complete;
> > --
> > 2.25.1
> >
