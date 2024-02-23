Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A31860995
	for <lists+openbmc@lfdr.de>; Fri, 23 Feb 2024 04:50:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=q69aQJku;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tgwyh2xf1z3dX6
	for <lists+openbmc@lfdr.de>; Fri, 23 Feb 2024 14:50:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=q69aQJku;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::703; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=tommy_huang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20703.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::703])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tgwy23lqrz3cM4;
	Fri, 23 Feb 2024 14:49:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yg950ouvx1WjNpCP1clyKtNInAyLcDkgW+Nteoi9HHrbIhePcDI7Ioc5aJrL9s5zmhIB8bh8pmp3/nj3lTiEyQeteZzFWrXKK71zxS4sekdNVSurRKK8P9469OBkxGAFQVcfX/0GYlL+8TCSYjAO5XdNZSESscksbvYgu7k7d3ib9htimI7awGG7HQW5ZyNaCo+JYKwDtEZ2S7QuWQcnAtawxCidAjN2WOAnGTPP4j7P+57PqhewOypkq99kZXcdR7x7Miy+E+B/5yNkWMwTSTcHmhsclf8OqDbAb5Be3qYa9GhXSRu4c461Z6sQNsY2SuVFmaUdbiPDmyRbHgj6Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UhT5Jglo9eajC1MtBF2LOaR4J/dQPutJITGmsH95r18=;
 b=euONYUYATW14N5VC8ymbp10E5JR2cR7jXp56Qyd+502ps3s1rGjQumkmMZIoig8/lejipHgYVJMIElkteicCGB2FRIxE4MGMiiOrIQJOJwbSj6WqoTvDLAxUPAZFFHvNvG5NVhu+acgjBrjlP1L2ma5HAzvycUdVP0MSzvvwL0nGUOafL8Tr50miXk6mzSq46ZU8HFsBXSMMTNKZkxq1qJX9pg4LEmssfLP2GgFtsIMWTGPjtE1w5nuVXUxePQvEZA/dDPZYikex2zSAxe8apfjndGAbCV8FK3hPyeXhBw6RuJDAThyWWjSodm3FokTeiJtQEdq9aNX8W9MjQtDNAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhT5Jglo9eajC1MtBF2LOaR4J/dQPutJITGmsH95r18=;
 b=q69aQJkuvPhpllidfujK4e5Gm4OQym0rSZGFa/E7/R/np+CgIGxECqOyTVw9gc2E6kJBqsA+uKaagTnOf5ifbLvxU/LDOtY01JYtyzktZYWDgWX4VpkpB2Wyp039Oao3efV8fhOBNsAPIASj0VLKdvk4BMAGRzh/WGT3m+wxeDV3GjCocoSMwoxSYSRQUtcNcFOlBkNCQLGOm4YOuK5bXv6aXGFj4nyMsf53O3fF+FO8qt48u9+c+Aiepk3+2H8PdhGMM/gtL/qaj8RMZ2PCp/p0nnwoU/OchdTyET/aX3Vwuyh7D2ddfhd6MYwFFAHmHWOmWB4SvrE0TaHA0WYHJg==
Received: from TYZPR06MB6191.apcprd06.prod.outlook.com (2603:1096:400:33d::12)
 by PUZPR06MB5585.apcprd06.prod.outlook.com (2603:1096:301:e9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Fri, 23 Feb
 2024 03:49:17 +0000
Received: from TYZPR06MB6191.apcprd06.prod.outlook.com
 ([fe80::e10a:d9a2:5070:6903]) by TYZPR06MB6191.apcprd06.prod.outlook.com
 ([fe80::e10a:d9a2:5070:6903%5]) with mapi id 15.20.7292.036; Fri, 23 Feb 2024
 03:49:17 +0000
From: Tommy Huang <tommy_huang@aspeedtech.com>
To: Andi Shyti <andi.shyti@kernel.org>
Subject: RE: [PATCH] i2c: aspeed: Fix the dummy irq expected print
Thread-Topic: [PATCH] i2c: aspeed: Fix the dummy irq expected print
Thread-Index: AQHaYNBg0EEa3X7oHECRXZPcHJI3VbEVVFwAgAA4R6CAAIwtAIABM1cg
Date: Fri, 23 Feb 2024 03:49:17 +0000
Message-ID:  <TYZPR06MB61912715EE2869DDB7C3763DE1552@TYZPR06MB6191.apcprd06.prod.outlook.com>
References: <20240216120455.4138642-1-tommy_huang@aspeedtech.com>
 <nbkkaktcozbhly44hii3zwie7ivsra3qxzdibyzhyhooxrudvb@zik6skmkki2c>
 <TYZPR06MB61911F076C8719C6A7D57B97E1562@TYZPR06MB6191.apcprd06.prod.outlook.com>
 <v4nawwb4rwjiy2g7xv2sfyhc545mhk4izb3g22f7jupcevjuzb@nxmqgf2zjyqs>
In-Reply-To: <v4nawwb4rwjiy2g7xv2sfyhc545mhk4izb3g22f7jupcevjuzb@nxmqgf2zjyqs>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6191:EE_|PUZPR06MB5585:EE_
x-ms-office365-filtering-correlation-id: 24e1dc8c-477e-4a4c-8f3f-08dc342268f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  2cEFO/Ns/jyTKVK6b3AShK7EQ4FudoSO+1qoQfMr8atutRZqvSBohSHG2geisIdhGDgcF4eYdYBBuINDrlyYvBIE4eIoYro6Ii/FCN9cL+TMXvHOlcm41ULEVtGBCVU6upuxUqPgusO5uYSRWoPElClPSfh4TJJb8qZ+C0TgFVph4YGh87zjqVpNYke9iqw9v9NsOCUmbhcvKZPwyhp70x2/bGm6k/57dDLLIIzA/01A5Vq/swqK7sH2RNbbWSFQTAKLnIFglLzYlnYymqkXOxSYZy2VM43Wydo5yalnufup245SLzCKdwA8h2gQwTGVD0gBUEchHUTFSZO1x7neI2sGrKeBKtevJpuCLKzQXNXITcZf+lQeHSI44EBFDDJyjWgU1985xmtWFYonUKaszmPQuUIFie+bYFRhdN/0zn56GszY5cHx46HTqM39nN7zjvUfsh5Mp4ZV3Wotwl/Jukv4b306fJBTnIiYxr47iqcTLqhMJ435f7nEl13JK4sw5aDnRVcFoI48zlvQLumQ23wMOzf1FsTOYPLRRfAXELppxy33MK/Sm8O71Cd5TCbMrRHbcxtMFQDT/MUtWoV/WK9d1fcE6Sh/Oww/fzF8nl9Jkry1M4UTVr0KM97tdEHk
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6191.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?RQ/iP1ovrQvLx9MtJZ+PU0pTCBfdhYSuh+l/cKaNGRZWpS+i25YaSPq61bwb?=
 =?us-ascii?Q?/XDhmfkWMQx3OhBU2OnrXlgOQWWIW+ytcPGw9H6RLjzqVTrV2lJCj79MYJE1?=
 =?us-ascii?Q?l+dnJh7evAO0D+2jPjmNeTWduVTLf2T8/NcgHuRUFtr42v6ghOMit45/ZvZ6?=
 =?us-ascii?Q?LuGiGYBBjrdWl/iKG3SsyCdLLagS9NiYCtKe1t0Sesb/USNGrb/Uo2HpwpXE?=
 =?us-ascii?Q?dg6+K9cXnh1irpt5gba97gHAAHiQKWaZYaYII3+pubBRgnzli4Z5grnh2USW?=
 =?us-ascii?Q?hNe7cXDg8++z6FjJouO5HvUlsCUAZ1qMxFFNVvoWe7o1agnq2/jqLM3uEBK5?=
 =?us-ascii?Q?qMi4YlNERCtzTunVoywBRE8ssPahrTs4ezo2WNOJ7vCPEhs5OYdTNEQsdtaW?=
 =?us-ascii?Q?Xjr2JXYUXBc79nIJZOOgUx5UqMh1kMiuSs/rFXjje7T2hSzZpNMiv6b7SiIG?=
 =?us-ascii?Q?4NSuXrLUnCuYsidmbsVfBZhOLqQEmfTzTf+HwOeve182ZE1w/1OLIVZDPvzm?=
 =?us-ascii?Q?LMi1C4KsqwpoJi8QXj050eI2ywHH3UxjKK+gNQcO8ei5kJIgg0BY1ibU98LR?=
 =?us-ascii?Q?X2rxVdZSG99k4mdfqWxY4wNvRTO2ZsarV/ktZMgLoG8zDwP0vI7jxeTD5pG5?=
 =?us-ascii?Q?LvyprxIfi3dYelo0cqmP9F/nUJyx98pxL3WZYwqo3vv8RpKaXw34MnG/OI7h?=
 =?us-ascii?Q?Zn6Yf/OJJOqhxsGrIXMw+AozL+51Bw3fNj8DUASbYfYyBsH9lFiUU8EOzVSU?=
 =?us-ascii?Q?HWRZZh2nbJ+fduiFAtf9zS3B8MMNjzFBj45svnXoy31ykq4N3GNYgOYYPHc+?=
 =?us-ascii?Q?kzGCtiI9U13LxK30VUXiuEe8ZevvvOl0C1w89mz9EZhxK0S8XcEl1e+ctl7K?=
 =?us-ascii?Q?FEkI8JPa5Yf8Smsvf2ZpvOTRvcMNXekoV+w6KxV0WIOIRkUJdTXHX1kZ4OFw?=
 =?us-ascii?Q?Ipdzb8y+dWoiUsJmuRHtt3eLL3fCM18Ct5Wl968Hi+R5p3HAGQEBH3UJe4WJ?=
 =?us-ascii?Q?foR6UsZx9YRlFLiqWzVibPCBe9QQbL4oUkTdui4zfHbRLl1l2mqtOFdWNSvr?=
 =?us-ascii?Q?JG8tGtXUTiWot29SQ93X7Xz6S0NNDICwf+2jB9BQgsM0qknp6oOjwDdmdUYr?=
 =?us-ascii?Q?D6713RI9XF6CH/m5ke241LsYtX7fZ7U6nBpeHbWjdX1hsakd9G9CNHJ3Rnlw?=
 =?us-ascii?Q?G58JB3lD77A1BY8Fjpy4omUn2q0SGHziF0XTWkauTCrDcvbhe+8PjGJc+U2I?=
 =?us-ascii?Q?MzquyFrNcjgqQmy9MQuE1c6wrm714fl5RHysmfRpZcoNsX8jyZ8ZaAT23KC0?=
 =?us-ascii?Q?mqaJhKVeo+XmNkS8eEjsNFJCcHcTr+lL3BsCC66kfjAz8gOTAb4uHD3nZWip?=
 =?us-ascii?Q?4E/KQIIpUaVS5/kPu1mn4OMtNYN/Dv6B64ui0eQVYjl9sRgx3SpgJKP9wePV?=
 =?us-ascii?Q?+9yA5s3qtUjG3LziCEHGjRkMDTwGiCUerz9aYCmj/aoylpsRWtenRY0Xcw60?=
 =?us-ascii?Q?08eRkgOPD/plcjmx3W6xEfhQk7FJKlPWkAPKsFmB6O0tUJeD6cu4Sk3XxbFz?=
 =?us-ascii?Q?mFFInGt3ikOcKY7zFCAoAvbE+fPRTaUTPGV8mf4pmicTCWgvYaeDV8hUWEtI?=
 =?us-ascii?Q?Kg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6191.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24e1dc8c-477e-4a4c-8f3f-08dc342268f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2024 03:49:17.3927
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GYHVUIN+3itbPP/SihXlxAi3PvAGjKEJWzxXGcGY/DMRBn9s4MYJM8KXgPY1gdajXvH6+BtjM7L6s9Gy0p4mi0Tnnt27Pn5zL6RK/+gWKWg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5585
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

Hi Andi,

	Sure~
	Below is my re-word commit and fixes tag.

	When the i2c error condition occurred and master state was not
	idle, the master irq function will goto complete state without any
    other interrupt handling. It would cause dummy irq expected print.
    Under this condition, assign the irq_status into irq_handle.

	For example, when the abnormal start / stop occurred (bit 5) with normal s=
top
	status (bit 4) at same time. Then the normal stop status would not be hand=
led=20
	and it would cause irq expected print in the aspeed_i2c_bus_irq.

	...
	aspeed-i2c-bus xxxxxxxx. i2c-bus: irq handled !=3D irq. Expected 0x0000003=
0, but was 0x00000020
	...
=20
	Fixes: 3e9efc3299dd ("i2c: aspeed: Handle master/slave combined irq events=
 properly")
	Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

	Tommy

> -----Original Message-----
> From: Andi Shyti <andi.shyti@kernel.org>
> Sent: Thursday, February 22, 2024 4:58 PM
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
> On Thu, Feb 22, 2024 at 01:10:39AM +0000, Tommy Huang wrote:
> > > On Fri, Feb 16, 2024 at 08:04:55PM +0800, Tommy Huang wrote:
> > > > When the i2c error condition occurred and master state was not
> > > > idle, the master irq function will goto complete state without any
> > > > other interrupt handling. It would cause dummy irq expected print.
> > > > Under this condition, assign the irq_status into irq_handle.
> > >
> > > I'm sorry, but I don't understand much from your log here.
> > >
> > > Do you mean that irq_handled in aspeed_i2c_master_irq() is left with
> > > some states that is not supposed to have and then you end up printing
> here:
> > >
> > > 	dev_err(bus->dev,
> > > 		"irq handled !=3D irq. expected 0x%08x, but was 0x%08x\n",
> > > 		irq_received, irq_handled);
> > >
> > > Can you please explain better?
> > >
> >
> > Yes. If the platform met any irq error condition and the i2c wasn't sta=
ted
> under ASPEED_I2C_MASTER_INACTIVE.
> > Then the code flow would goto the end of aspeed_i2c_master_irq.
> >
> > 	ret =3D aspeed_i2c_is_irq_error(irq_status);
> > 	if (ret) {
> > 		...
> > 		irq_handled |=3D (irq_status & ASPEED_I2CD_INTR_MASTER_ERRORS);
> > 		if (bus->master_state !=3D ASPEED_I2C_MASTER_INACTIVE) {
> > 			bus->cmd_err =3D ret;
> > 			bus->master_state =3D ASPEED_I2C_MASTER_INACTIVE;
> > 			goto out_complete;
> > 		}
> > 	}
> >
> > Some master interrupt states were not handled under this situation.
> > The fake irq not equaled message would be filled into whole of demsg.
> > It's most like below example.
> >
> > ...
> > aspeed-i2c-bus 1e78a780. i2c-bus: irq handled !=3D irq. expected
> > 0x00000030, but was 0x00000020 aspeed-i2c-bus 1e78a780. i2c-bus: irq
> > handled !=3D irq. expected 0x00000030, but was 0x00000020 aspeed-i2c-bu=
s
> > 1e78a780. i2c-bus: irq handled !=3D irq. expected 0x00000030, but was
> 0x00000020 ...
> >
> > I thought the bus->cmd_err has been filled error reason and it would be
> returned to upper layer.
> > So, I didn't think the print should be existed.
>=20
> thanks! Can you please write a commit that explains better the fix you ar=
e
> doing?
>=20
> > > If that's the case, wouldn't it make more sense to check for
> > > bus->master_state !=3D ASPEED_I2C_MASTER_INACTIVE) earlier?
> >
> > Did you suggest to add "bus->master_state !=3D
> ASPEED_I2C_MASTER_INACTIVE" judgement before print the irq not equal
> print?
>=20
> no, not really, but nevermind, on a second look, what I'm suggesting does=
n't
> make much sense.
>=20
> If you want, please reword the commit message as reply to this e-mail and=
 I
> will take care of it.
>=20
> > > And, still, If that's the case, I believe you might need the Fixes
> > > tag. It's true that you are not really failing, but you are not repor=
ting a
> failure by mistake.
>=20
> Please, also consider adding the Fixes tag if you see it necessary; I thi=
nk you
> should, but it's borderline.
>=20
> Andi
