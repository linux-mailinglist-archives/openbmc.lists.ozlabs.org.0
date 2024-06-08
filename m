Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDA1900F89
	for <lists+openbmc@lfdr.de>; Sat,  8 Jun 2024 06:39:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=MmRg2w3O;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vx52472tvz3cTL
	for <lists+openbmc@lfdr.de>; Sat,  8 Jun 2024 14:39:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::715; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=tommy_huang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20715.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::715])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vx51L4Yzwz30Tk;
	Sat,  8 Jun 2024 14:38:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BFF7rNozIU4Xu6kwvKo9FuHZP/f9IK6v6xVQCzCKQNvxZMdbov9RXmSAaR6qX52SbpLF8qAxjQ6Fm9IxF/TZLFbcHTI5uSPxmK1IoqpqCyQ30WjAgmvXQR8pA4QEQeSqUEc0TfN96NZPU0zWl/6EiMBZkeFWxbEvQkg2IpW30nBd8dUx5XPGmltY8jhmvlBpj0c6zDpZtqwXWZ9+0m90WwDxHPuHOaAEjduYFoqGyKweBk4J9VxwA0iyH16+2x8zSrfwdgj5VBRZSbHmUOGqIIT0RTRWHTyaMrpsk+dt/NyNMo0OGCbhSnXj+1ZOZ+g5/1EVCyl9g3GMLp7hcIq0Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1spzAAEsRV3nfZFsrPD1JzmZbqoEygjJ5vpynECPNw=;
 b=HKx7hiOfcU2s6ZtO3YVNbQzLtroZpMilCs8qY7VMJBXOBdT/AscaZd+L/AemLlhovjlzvWTj/ZwwRkOZjn5s5Nu/R0rwadBBddXMg1pkf/PCpVlPfgOHoqmD0YQII7Vd9VASK7Gd/uRFTu6Xkk+yaSHoJDB5SjulSpP9tB+1gtI37vJccqJ/SdF6dTMOCqInQG+7bqugBqjcir6vrpz4QowRMxelbPXTdLA1rA2QcbX1uezi5U1D7CsXyPAoNybR8JW0Dh9VzdQ6U9guKiyuDj9MyFofJHMTnzzvjRZ5aw0ObJYzEy70v36lzApxsT6iYCFJTLx+3u8q4++tljzuOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1spzAAEsRV3nfZFsrPD1JzmZbqoEygjJ5vpynECPNw=;
 b=MmRg2w3Oj1OdT0XLe3zOyn66Q9hh71waq2n/YMhB0E5YyqcMdxurys4m2lzeheBlCQFnY9kFufulbbS+VK3TTx1YzfsFsZNEYwZt/KrSBbKAEOTu7Mgkfcba7Hw4hDrgG7ECwCcIgjWoWrxWp50hima+MGzysfy576yMQMa2RPL3MU6bXeOQ8F/0tGWeEXXN2NZa8X0SH0hub+86jFnakVxZryEutt1KrEkrEfvqMUKScfEvwluLWazDYmNxGGVQeXwmCGuGEHKrIcDzOWPPLwNncOnBJzpJzcoowwpKdMqpe5AjNL5VkUKVmtoLX0vO75NJTHO80vkT/iRqAME00A==
Received: from TYZPR06MB6191.apcprd06.prod.outlook.com (2603:1096:400:33d::12)
 by TYZPR06MB6934.apcprd06.prod.outlook.com (2603:1096:405:41::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Sat, 8 Jun
 2024 04:38:19 +0000
Received: from TYZPR06MB6191.apcprd06.prod.outlook.com
 ([fe80::cc07:35e3:9143:c8e2]) by TYZPR06MB6191.apcprd06.prod.outlook.com
 ([fe80::cc07:35e3:9143:c8e2%5]) with mapi id 15.20.7633.036; Sat, 8 Jun 2024
 04:38:19 +0000
From: Tommy Huang <tommy_huang@aspeedtech.com>
To: Andi Shyti <andi.shyti@kernel.org>
Subject: RE: [PATCH] i2c: aspeed: Update the stop sw state when the bus
 recovry occurs
Thread-Topic: [PATCH] i2c: aspeed: Update the stop sw state when the bus
 recovry occurs
Thread-Index: AQHasl/7kNWQnBw5T0ayJZ/33ciwnbG5/HuAgANZ04A=
Date: Sat, 8 Jun 2024 04:38:19 +0000
Message-ID:  <TYZPR06MB6191C0769400FF03412E56F2E1C42@TYZPR06MB6191.apcprd06.prod.outlook.com>
References: <20240530070656.3841066-1-tommy_huang@aspeedtech.com>
 <kts7ib2rxq4g26ayumcyaohs37zl43qo66gok3vae3reyabobe@nbbborkf2eow>
In-Reply-To: <kts7ib2rxq4g26ayumcyaohs37zl43qo66gok3vae3reyabobe@nbbborkf2eow>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6191:EE_|TYZPR06MB6934:EE_
x-ms-office365-filtering-correlation-id: 4d95ac98-6c82-41af-4c75-08dc8774d23a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230031|366007|7416005|376005|1800799015|38070700009;
x-microsoft-antispam-message-info:  =?us-ascii?Q?bzLhvkIfJ5RE4Xg5EVCP4W9l2lRgRf1yECgKbZyvCcOhIc76xWRPvUAWG7OE?=
 =?us-ascii?Q?rpAZqzrGHF+fSfm+ZQXd1Vb0caxZae+J5PGfZe96SLyerIzMgFGG3+mGADgP?=
 =?us-ascii?Q?tlzZOoQM3w2oY+bVnSsOa/YaJfxWnA4vV1VQj3eIdt6ztvYPFxRhiZyltVMj?=
 =?us-ascii?Q?5UaWwyJTWF0aAF0zpe9UTxROp6paaV2S1+4xbdpQ1mfeC+E1FDYAn4IOBj34?=
 =?us-ascii?Q?XiqHACv7N9qhJt69iL1yfPIkw0iYhUDOIFBGr2E0YEsoh65ffgE3m67aM+Wu?=
 =?us-ascii?Q?julN4IgzDRTxOSc5hyZLJHZRdNQvhiQWbpjXry6xQLH90gkVPD+VyfKEEl45?=
 =?us-ascii?Q?oWhvASt0rY67y2aLc7hdsCZDXxRL6+MP8iPJTPFaw0SUm28kW1Gu7MZFuLzT?=
 =?us-ascii?Q?zvyFQtwf/ehxOnz2Za8XADWv+0Q3VOI3aK4XdhNxYv4H0f6t+dP74YKi+tTp?=
 =?us-ascii?Q?7U0ZdQQOatf+blNniDBEKZ4Lfme/TqEWVXiIx24q/HmoMALT7dE+VB2EE58w?=
 =?us-ascii?Q?ctoKkUZcz4oX3+Uhkh4n6Uq/z0+YYizkjOqQoTQSDe7Io3Vq3hvl5a9UHrgO?=
 =?us-ascii?Q?v86Pm6meDfx5LmGGW5A4NebeDFHJmIZ7ySv1/Xk8EgwEE8rStJMgw1Ycr0Fu?=
 =?us-ascii?Q?ECSjrSgQq7XhJcJoT1QgkV6zs9Hfvy7oGdNaaM1gqRDxBlmPyZMZL58ztWav?=
 =?us-ascii?Q?3k2VI6Y608jiCPhiFxplzlfPWXh8D/Cj8n/wdZGsKMPNM8Edv24ofKZaS4ao?=
 =?us-ascii?Q?3VcD7agsyhoU+Lgdkf0lcG7FMdrxJ58RsM432jQKjYYiVFj9CDf1cVkQOjk5?=
 =?us-ascii?Q?XDkGcCgBDTAyli3R8JHALxxhLGwJPKevvH9da07/+B+laV4KXezDZBkYGQ0v?=
 =?us-ascii?Q?yZoTlsm1GJb+kpaVpgezrvisnD8UyDIswlpc5lu6KpVUUrgw0v7RaJSrbNdI?=
 =?us-ascii?Q?gAXbMHiWFR5LmsV3H7J1mEMWwwARAjh9hkz8IQ4+WaUc1nGyJw8coPfqe4RH?=
 =?us-ascii?Q?7zpR5InXf6ArYR0cAI2SFmBxz1PndlMqy4V3fZkjPcncmGD7qmhYSgabQoAS?=
 =?us-ascii?Q?CErfVa7s7liBxO1o34O9DEuBECpBquEctI1WTqcUYCv79bJvvkS5bzIe9n1e?=
 =?us-ascii?Q?iy3foEl6MrwGooYoX+RaIRdKD+y3NVwmOiQ82aRDV6Y5h6wOAvn2H07RM+jY?=
 =?us-ascii?Q?ebztr+07eje17KtDEVWdpHoTtupT5TTjco9W733KfAnjdcSIiyX89nqM0OjV?=
 =?us-ascii?Q?c3MXrTGXQbgTOdxEqMvU8BLUZm0FofCk8CRJFbK1NPb1t69B5ZmofRs85/R6?=
 =?us-ascii?Q?XbZvRO4j4gY2IHmS+PEXdUlUzFgwyGmKyoFR1Cgj7Sya5Pik0HfP9O9qMoIy?=
 =?us-ascii?Q?RRF1/yQ=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6191.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?/tVS47iWDPxOg77osJS7HBL49oFgoxKCIFOKgVDCw0HEBuu2DsBP34Zu8RPN?=
 =?us-ascii?Q?ZgNy5S4NWhELpqcQh6hPdKqI34ncAg3zzhmzcVxM/lwHcxQMmAUSe4tJpZbz?=
 =?us-ascii?Q?wudwh/q6c06F+FfE552s5K44EKQilUdaaZorOVrRWw1sNCLCqO1wNUPbYoEK?=
 =?us-ascii?Q?ZkXaj/m/jWpUnS7qzlC8PHivzxXFSQ6fkiIdTSijHm06JpMiNejcTmIz9cMw?=
 =?us-ascii?Q?dSHljF4m4I7Xa6GB9TQt3gZsiroDGlZMRJYilh7t7uS4YueY6ZhwWY48NFa5?=
 =?us-ascii?Q?Tl/8SDemEt0iSHkkZ+39xIqBu/qmlGOwh+E7+1D2T5xK7Es/wH2o1c8u7vn/?=
 =?us-ascii?Q?ZrLSxYbbUDfHE0Rtj5YtLY1hJV5vgRkNPbsAB2m0yZCRNy/INaCurAPtLf/l?=
 =?us-ascii?Q?/Mx8OMduDNjwrg3ptYXDqPjVMsuoLcIV3kXi372XC+36U9iRkWC3BCSEf4Xz?=
 =?us-ascii?Q?GRcpiTxZs6qborvyn7HSXEMoutrDQEpfU5XYhs9vraKKTwCqz7ZzZ1tk/9yF?=
 =?us-ascii?Q?M829rarzVzBKEgC4T6xY4twYRCERRey7ajhoHs6mhfzMycltsIZ+la4DEG4D?=
 =?us-ascii?Q?z3IiTv6G2OP48misNLbCJnWsGrRqZcsdtFK0eITMAZhY++jlHXXzZbcIB2Jz?=
 =?us-ascii?Q?mN138qRv7KL7WwgRQyIbxtDwvrVI1gMwtDlqJOL96QEev9UZqSf7UlQLGsmY?=
 =?us-ascii?Q?qgVR1rQz9ItoA+t3Zr7ofiuuiV8piLIpafwXwKYtu92gfwvssIp01poCwwYv?=
 =?us-ascii?Q?Th9HHN3RVHBtguRdsVrMwCgdqpeDUu92BMbOkVktw+3Z4xAwfu/neoQZW8Ay?=
 =?us-ascii?Q?ftBE+iFQMa/kgxS4HvD8zkWSXw1FDvW9YbbkzY1LVcFyD0fRwsBUA4clwRyp?=
 =?us-ascii?Q?WBR0DJldbs7WoqgRTv0lWkN73QIRIGm0zvvkGaC7g61TpWSKe3tmIQkH+7Z8?=
 =?us-ascii?Q?9+zjcWZcy2b5+yJZVQo7N5E8R5YXi2E+jZqvR8T0vSEn2k8MLWaad+/XTq05?=
 =?us-ascii?Q?wN5x9/oqyajLMdpFHfFwfxh18lTrkYwnvyLa3vHeGsdnuz2Ix0WjRXIcHCTY?=
 =?us-ascii?Q?ZKCNZpIdXKTmkiUqvjkG9oYDtr7B5DpsxfLhyJCZ4YsH1T1FrGY5f8VaOLzp?=
 =?us-ascii?Q?xH1S1mWRQgSxTeerc9lE6J2d73uS/jL6Yc0cISn6vi5Ukcy/8Cgzc844seQc?=
 =?us-ascii?Q?IP+I7suQXBh9col5N65EebLQ9GDemyWGm21HekAUA06ZB7Q1loTsZkJ7KXfi?=
 =?us-ascii?Q?rz9DAUwfx8V0HWGFV6VNgU+NqlUM43wASDQb/OdFxb0xVu8PSRi0N+ihDGYg?=
 =?us-ascii?Q?nG2LAMr88DH4R7aSkOv5TH4KhVzBFo1gIDRpvjpZmZ4vJGMkOjhZ5Sh/qPIb?=
 =?us-ascii?Q?ffEid4WWJyLgzTo3XnKnpfHV412/uCNz8435YfQMxGyVf7pSlFhtwgyVLFY9?=
 =?us-ascii?Q?LAoIIH0xQ78tUQLNFW68Doa9RAIBk1eWdYNAx5svj8F7rA3QaB8ySH9daftE?=
 =?us-ascii?Q?8lK9LirmFPhYblaB25Rphgc8gFpt+TdUVDAPnkjdW504X8lZbIh+y24IhdyT?=
 =?us-ascii?Q?4BCCc6rOT3wSKvbU88jxnCyNdGaYX8qoxhC81rwia/b9GnpBfR1imA9zx0jk?=
 =?us-ascii?Q?Gg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6191.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d95ac98-6c82-41af-4c75-08dc8774d23a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2024 04:38:19.2720
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AMLelnFT+purG6DZkxjRKt0zNDtU1EWy9hX87ka1O2MGYBGlP86VKB1uDc7VvlJETpXL/yottnNiVyc+g9zMqkevgi0pTn1rHUyVSl7uRDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6934
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "wsa@kernel.org" <wsa@kernel.org>, "brendan.higgins@linux.dev" <brendan.higgins@linux.dev>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "joel@jms.id.au" <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andi,

> -----Original Message-----
> From: Andi Shyti <andi.shyti@kernel.org>
> Sent: Thursday, June 6, 2024 9:27 AM
> To: Tommy Huang <tommy_huang@aspeedtech.com>
> Cc: brendan.higgins@linux.dev; benh@kernel.crashing.org; joel@jms.id.au;
> andrew@codeconstruct.com.au; wsa@kernel.org; linux-i2c@vger.kernel.org;
> openbmc@lists.ozlabs.org; linux-arm-kernel@lists.infradead.org;
> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org; BMC-SW
> <BMC-SW@aspeedtech.com>
> Subject: Re: [PATCH] i2c: aspeed: Update the stop sw state when the bus
> recovry occurs
>=20
> Hi Tommy,
>=20
> On Thu, May 30, 2024 at 03:06:56PM +0800, Tommy Huang wrote:
> > When the i2c bus recovey occurs, driver will send i2c stop command in
> > the scl low condition. In this case the sw state will still keep
> > original situation. Under multi-master usage, i2c bus recovery will be
> > called when i2c transfer timeout occurs. Update the stop command
> > calling with aspeed_i2c_do_stop function to update master_state.
> >
> > Fixes: f327c686d3ba ("i2c: aspeed: added driver for Aspeed I2C")
> >
> > Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>
>=20
> Can you please add:
>=20
> Cc: <stable@vger.kernel.org> # v4.13+

Got it. I will add it.

>=20
> > ---
> >  drivers/i2c/busses/i2c-aspeed.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-aspeed.c
> > b/drivers/i2c/busses/i2c-aspeed.c index ce8c4846b7fa..32f8b0c1c174
> > 100644
> > --- a/drivers/i2c/busses/i2c-aspeed.c
> > +++ b/drivers/i2c/busses/i2c-aspeed.c
> > @@ -169,6 +169,7 @@ struct aspeed_i2c_bus {  };
> >
> >  static int aspeed_i2c_reset(struct aspeed_i2c_bus *bus);
> > +static void aspeed_i2c_do_stop(struct aspeed_i2c_bus *bus);
>=20
> Can you please move aspeed_i2c_do_stop() on top? Doesn't make much sense
> to add the prototype here as there is no dependencies.

Sure. I will update it.

>=20
> It's different the case of aspeed_i2c_reset() because it needs aspeed_i2c=
_init().
>=20
> >  static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)  { @@
> > -187,7 +188,7 @@ static int aspeed_i2c_recover_bus(struct aspeed_i2c_bu=
s
> *bus)
> >  			command);
> >
> >  		reinit_completion(&bus->cmd_complete);
> > -		writel(ASPEED_I2CD_M_STOP_CMD, bus->base +
> ASPEED_I2C_CMD_REG);
> > +		aspeed_i2c_do_stop(bus);
>=20
> The patch is good, though!
>=20

Thanks for your commects.

> Thanks,
> Andi
