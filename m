Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE077B9B12
	for <lists+openbmc@lfdr.de>; Thu,  5 Oct 2023 08:23:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=H/GK1Ukf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1M1s46nzz3cdM
	for <lists+openbmc@lfdr.de>; Thu,  5 Oct 2023 17:23:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::72f; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2072f.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::72f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1M0t0nh9z30hj;
	Thu,  5 Oct 2023 17:22:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BNiIoOwrc95P9xx0hZ8G9/zjgUEndWxINe+W4et6mlLjgdIrrcDQ3FA2ui/m877Bo1i3gVULqumGFnEI7srQUraEvi52c8CLANa6U8i/NEtJWJpqL4uvXRICQ3T9g4EKkmR7xUChO4OiFBT7YqGUGi+FoRLuIExl/q6+PBGJvH1UFiK2msosSGxOEoCpbMSJ4Dp9CwQ8yyiPEd0Js4zi4PZHA1obcUHxGXjweOjRahuzVXv+SLRFqiW1LIAfS3kie7eK+krhlu7pGr8QnjwoqG1f2csu76QitqQHQkecdOioXAbI12Oghiyfs5oylS6+yHvLUcGCdLjBvPZxbph7WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yt3R8zRD0OWp7AXcPbPk8I/pNg1AbUuSTigY4pepb9g=;
 b=c20PlIQF5+gQPqhBzBVKGXz3zr09d6dzQ1taVBLjWiETvTHSfvfxk2iNLhM0AuseNM+NGa3jKUcU9t8LFqQLp/YMyM2ZnP/OAtoNCs4GzITJp/wgrh4Q8cK3Lu8wQXV1S+J4sz0sGRNxZCPmoxWC/izrD27YPEDgjtIzEdVqqIuHhwSMENX63awp6u6vYRCErfL9J2DrqyrLrvPEwnxf9QXCSjGjWmjKAOEphplzDjtECOA4+LE79QZmA8jt2FKFnzG5spOAkV6fX43wFqd3/kKVuiEeAOYtFY4FdrdIaLHiBqhh2b0bpqzee8rSvWCljllL/zZRgDkKtGmmNY7xhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yt3R8zRD0OWp7AXcPbPk8I/pNg1AbUuSTigY4pepb9g=;
 b=H/GK1UkfOY4CrJ9hgqVv3SMTSTh52HfcwrVoPe6XnUiwow6lWICO7B4+Pkagp0YHJi4vaPE6xI6brGokw9BXOj0a1RaFP6gB4rvGkR+2HpPM8ljwGEOOLX2ndFt2UbySxGqEugB/1R5vGHFqCBYrr/yLjlgnCWZASvrMuQfTzwWN3Pq+oXQmtC+/US6cZhqBUj2409rdzQ6KrLlNAIlY+x1DgTx6ACX6UCijvR5H85w+ChywxA1KS7kHF9eBQX46nifjCzeeKkr6nMNPXxdLCrABLcNxgqMgDMDQ5IHO8whsiXEoJnQMQ2vEEd0WzWFPkiTuVPTmHHryoMiZ72qOtQ==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEZPR06MB6612.apcprd06.prod.outlook.com (2603:1096:101:187::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Thu, 5 Oct
 2023 06:21:36 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::bbd0:e194:c82c:c8c1]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::bbd0:e194:c82c:c8c1%6]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 06:21:36 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v12 2/2] i2c: aspeed: support ast2600 i2c new register
 mode driver
Thread-Topic: [PATCH v12 2/2] i2c: aspeed: support ast2600 i2c new register
 mode driver
Thread-Index: AQHZtics0zDPons9tEqiPxizT4zKAq+49YuAgFMh/9CAAFvWgIAuwPEA
Date: Thu, 5 Oct 2023 06:21:35 +0000
Message-ID:  <SEZPR06MB52699EC5463397F4BFF244DBF2CAA@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230714074522.23827-1-ryan_chen@aspeedtech.com>
 <20230714074522.23827-3-ryan_chen@aspeedtech.com>
 <ZLENe5B3gi/oNTQp@smile.fi.intel.com>
 <SEZPR06MB5269831E049E2267661F181FF2E8A@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <ZPcXJ4adUNMv4LDr@smile.fi.intel.com>
In-Reply-To: <ZPcXJ4adUNMv4LDr@smile.fi.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|SEZPR06MB6612:EE_
x-ms-office365-filtering-correlation-id: 75d425f3-737e-4636-a7b7-08dbc56b53d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  U27Y18K+h4qYZvKJwJpv+Vah/9bVoNh7nrYl3NUDIBDAMlp14sGvVD3sfJlSOe1fq73vxs0/kISir20VFrxIgjfeQBPT6viEH+T8SLHa6ZRsCSn67GS4w6P0Mbq4tSElflb4bpxTHukiohOI/Fr31rpwJ/lsT+InbM1hMlcmC6pTpYdTBf4/RI60aCig4DvlObSdPBtK0THIjPnjZbxyz0KGbl3PE51IuLPeLCGrTwsJ99L9tBj3X7aqL3WZxvaI0p6zkeV5fuAdCFHrkUbXdw56IHe0vkCX+fptQXlVYKE3+ZgnJkxAlUMH43SIN3huG1i/6M2ii9nlO28wyE2/aOEiMwtuJrydsg+FvcDoCphTob8lEuX/er7Tqa4FxuqzPlDTI29yCkoyyzYqu6DHLrW792cdDrJCwiOYXf8rwBuTC4weGv9WNfs5USBstiReIIOOz05oedh93Xgq3+hTIMxwRdhPeR69722nd2F6kOD+vHW8PivyfG/IXI/H05XtmkKhwpIvG/LjuMXIDH8uLOTvQNcZfeh+KBGB6POWOVRfvOEzqKHjSuB6xdWckQvkl/u2I6Rqz9L8aZiPl9ewBveSf7RUx7z5HBF7cUcEY20vQ0zwCx+B4NzMXkQ1uR1v
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(39850400004)(136003)(376002)(346002)(84040400005)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(26005)(4326008)(52536014)(5660300002)(8936002)(8676002)(122000001)(9686003)(83380400001)(53546011)(6506007)(7696005)(76116006)(66946007)(66476007)(66446008)(66556008)(38070700005)(478600001)(38100700002)(55016003)(54906003)(64756008)(316002)(71200400001)(41300700001)(6916009)(2906002)(7416002)(86362001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?3F8u/rkHWe4yFhbYrUurt/BP+2cpvOXU4g7cqEV1W0Evyy7hfiVl4R6hRlfD?=
 =?us-ascii?Q?4Qe7vqwC33/VyC0nxJoNc7lOZ+5lXKTpJb/yNa9DLOpqFMPTL5KNOHmk7vLh?=
 =?us-ascii?Q?wbMM9D53Y/4I97k1JXCXVea63oeRXQBgzDBuPEbOhqeR/3P+BI6IMm6KD1uR?=
 =?us-ascii?Q?a7sUBT9rsG/9M1Jt7dvCrerJkWR+WgRszBcbBFmEvzAvznnGN6OygzKx/bMN?=
 =?us-ascii?Q?N10Wt29/cflyvzR0maTd3hQWPzU44NHYXoVKbGkgAREBbGy90Jyos/uFUq3Q?=
 =?us-ascii?Q?tCRsz1oVaBYolWOVam1krdKOD7CqeeLNcSf76/Ebjg2sbOWmndRRkDgstQBq?=
 =?us-ascii?Q?mBInT6OntkPYatWcwAUr0Qh8mudE5iugznuJ6o2O1Q3/uBFCBt1vWojWxw2l?=
 =?us-ascii?Q?KhiiCgS7S0jhXJdzDWZu3px92yxRBr9vL/zhVdNYD+hIhuzR3iQ15uMw+rJ0?=
 =?us-ascii?Q?Gc0mhg5nluAZi1QI09kiPTi+B7hNfSoeDeIDKZtN8xf0NKSy82yZevlzxmAn?=
 =?us-ascii?Q?jlKNiWcpVZCFptHJ6nl0QF8idOr0qiwwos6hdrenLX4+lr6ayu1RDxcxe8Ug?=
 =?us-ascii?Q?0uLNavC9osdcj3qnCqxeY4RALRCr7oYyLQdF8ZpofPkf2+f6FtshO/rZmgiD?=
 =?us-ascii?Q?MmpZhM0t1/abLCEFMfOl+4SQOIs9CpICn5N0rSRGJG6JLzZ3948zooeGjFGu?=
 =?us-ascii?Q?3KyiPU1HX7Gb43CppY2upPUdaokkhtQKjpGVLL8DMe4mwd3l3n61zAZToDMK?=
 =?us-ascii?Q?d5A1Y0YmEpHg8gamsE8y968mqyDeeRcNHPRSMb70CJLRW+bQynTA6UNACSTE?=
 =?us-ascii?Q?4XaDgGZS72Mpk6JITkys+QzZIENsifHhPc/KmgQL2Z85TfcvM5QDetszXNqy?=
 =?us-ascii?Q?BaR2Z/zGEDoiIghXhlKYGwK9Gd2tRTQdIgcgYMFPeQ2YsDh8yui9jBG7KVCF?=
 =?us-ascii?Q?ctyvVTq40VefJvOWCIvHrkFZ6GQOqBmdXWgDQ5qOKHzHPQwBpq/jMZFq54Er?=
 =?us-ascii?Q?8A0+Nj2k6DDB9G3pDQtZMYyZ4meGu3sw2Hz2l9X8hdaHNtFvRDzLFxALME1r?=
 =?us-ascii?Q?e5FcrTHuFJgKB45VZe0bEj5P6/eM51+aWiQCoBDc/bfBohWyZyj2/8ml3mQv?=
 =?us-ascii?Q?8eI8VZ+n1rvNJo5LW6Tq/ZpEUlBhOSjyuD0n117OHsm1rYr3oxUM0QmfK3DI?=
 =?us-ascii?Q?qcVLb2PMNWQXa/Mi+vt5TO4u6Gc++B2iO317ICOWJMFi3BbeU707sva1jCaX?=
 =?us-ascii?Q?1i+QDG4opZpR5uM6bZ2a4fpF/gI7xfU0zxoox3wPBBvAeg9fxag99vNZF2sS?=
 =?us-ascii?Q?ml9OJOyi2xfoDafgJz51Qpi3Lq9EPWHy0MM3Wjk92ABUt9DbxqjrauFe/qX6?=
 =?us-ascii?Q?FcwI9vXv3L7Dz0LJuAWMF5xcSv9q0d+WcYZnEGWvROQqXyOljPS5gu5sUEmN?=
 =?us-ascii?Q?FDXuTW6CubaLPpoFGWxVluiHVQD5Z4j6eRb+P8DIIAuZNlUAuqHQ4EwnoOnz?=
 =?us-ascii?Q?7SaXWkhDP1hlDyT+s0uqhAnz8XMr0lbkHIL0rdBR6f8jDUkukDITGJP5ioV0?=
 =?us-ascii?Q?VuymuA7M/z2QCb2cTUd6TcSkWtaWPGv/8rGHM3wU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75d425f3-737e-4636-a7b7-08dbc56b53d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2023 06:21:36.1003
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZoW9/cIt3AiXOb2kjWNK8h+SDvGMqE304UsXy2xlEY6qvhAK1pxPdcVYOZoOXouIWhxyl1Z43kZaxwP+w9zOk5GLluR1aXnFa8zHWEVm+Fs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6612
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Brendan Higgins <brendan.higgins@linux.dev>, Conor Dooley <conor.dooley@microchip.com>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "jk@codeconstruct.com.au" <jk@codeconstruct.com.au>, Jean Delvare <jdelvare@suse.de>, Andi Shyti <andi.shyti@kernel.org>, Phil Edworthy <phil.edworthy@renesas.com>, Florian Fainelli <f.fainelli@gmail.com>, "=linux-kernel@vger.kernel.org" <=linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, William Zhang <william.zhang@broadcom.com>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>, Andrew Jeffery <andrew@aj.id.au>, Wolfram Sang <wsa@kernel.org>, Tyrone Ting <kfting@nuvoton.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Andy,
	appreciate your review and comments.

> -----Original Message-----
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Sent: Tuesday, September 5, 2023 7:55 PM
> To: Ryan Chen <ryan_chen@aspeedtech.com>
> Cc: jk@codeconstruct.com.au; Brendan Higgins <brendan.higgins@linux.dev>;
> Benjamin Herrenschmidt <benh@kernel.crashing.org>; Joel Stanley
> <joel@jms.id.au>; Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; Andrew Jeffery <andrew@aj.id.au>;
> Philipp Zabel <p.zabel@pengutronix.de>; Wolfram Sang <wsa@kernel.org>;
> linux-i2c@vger.kernel.org; Florian Fainelli <f.fainelli@gmail.com>; Jean
> Delvare <jdelvare@suse.de>; William Zhang <william.zhang@broadcom.com>;
> Tyrone Ting <kfting@nuvoton.com>; Tharun Kumar P
> <tharunkumar.pasumarthi@microchip.com>; Conor Dooley
> <conor.dooley@microchip.com>; Phil Edworthy <phil.edworthy@renesas.com>;
> openbmc@lists.ozlabs.org; devicetree@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org; linux-aspeed@lists.ozlabs.org;
> =3Dlinux-kernel@vger.kernel.org; Andi Shyti <andi.shyti@kernel.org>
> Subject: Re: [PATCH v12 2/2] i2c: aspeed: support ast2600 i2c new registe=
r
> mode driver
>=20
> On Tue, Sep 05, 2023 at 06:52:37AM +0000, Ryan Chen wrote:
> > > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Sent: Friday, July 14, 2023 4:55 PM
> > > On Fri, Jul 14, 2023 at 03:45:22PM +0800, Ryan Chen wrote:
>=20
> ...
>=20
> > > > +#define AST2600_I2CC_GET_RX_BUFF(x)			(((x) >> 8) &
> > > GENMASK(7, 0))
> > >
> > > > +#define AST2600_I2CC_GET_RX_BUF_LEN(x)		(((x) >> 24) &
> > > GENMASK(5, 0))
> > >
> > > > +#define AST2600_I2CC_GET_TX_BUF_LEN(x)		((((x) >> 8) &
> > > GENMASK(4, 0)) + 1)
> > >
> > > With right shifts it's better to have GENMASK to be applied first,
> > > it will show exact MSB of the bitfield.
> > >
> > > (Ditto for other cases similar to these)
>=20
> > It will update next version.
> > #define AST2600_I2CC_GET_RX_BUF_LEN(x)      (((x) & GENMASK(29, 24))
> >> 24)
> > #define AST2600_I2CC_GET_TX_BUF_LEN(x)      ((((x) & GENMASK(12, 8))
> >> 8) + 1)
>=20
> Note, these were just an example, check _all_ of the similar cases.
>=20
> In general any reviewer's comment should be considered for the entire cod=
e
> where it makes sense.
>=20

Sure, will check entire code.

> ...
>=20
> > 			divisor =3D DIV_ROUND_UP(base_clk[3],
> i2c_bus->timing_info.bus_freq_hz);
> > 			for_each_set_bit(divisor, &divisor, 32) {
>=20
> This is wrong.
>=20
> > 				if ((divisor + 1) <=3D 32)
> > 					break;
>=20
> > 				divisor >>=3D 1;
>=20
> And this.
>=20
> > 				baseclk_idx++;
>=20
> > 			}
>=20
> for_each_set_bit() should use two different variables.

Will update by following.

for_each_set_bit(bit, &divisor, 32) {
    divisor >>=3D 1;
    baseclk_idx++;
}

>=20
> > 		} else {
> > 			baseclk_idx =3D i + 1;
> > 			divisor =3D DIV_ROUND_UP(base_clk[i],
> i2c_bus->timing_info.bus_freq_hz);
> > 		}
> > 	}
>=20
> ...
>=20
> > 	divisor =3D min_t(unsigned long, divisor, 32);
>=20
> Can't you use min()? min_t is a beast with some subtle corner cases.
>=20
Will update to=20
divisor =3D min(divisor, (unsigned long)32);

> ...
>=20
> > Sorry I don't catch this split slave out to separate change?
> > Do you mean go for another file name example ast2600_i2c_slave.c ?
>=20
> No, I mean
>=20
>  patch 1: Introduce the driver with only master support  patch 2: Add sla=
ve
> capability (all what is under ifdeffery for I2C_SLAVE)
>=20
Got your point, will be separate patch. master -> slave added.
> ...
>=20
> > static int ast2600_i2c_do_start(struct ast2600_i2c_bus *i2c_bus) {
> > 	struct i2c_msg *msg =3D &i2c_bus->msgs[i2c_bus->msgs_index];
>=20
> > 	int ret;
>=20
> This is not needed, you may return directly.
>=20
> > 	/* send start */
> > 	dev_dbg(i2c_bus->dev, "[%d] %sing %d byte%s %s 0x%02x\n",
> > 		i2c_bus->msgs_index, str_read_write(msg->flags & I2C_M_RD),
> > 		msg->len, msg->len > 1 ? "s" : "",
> > 		msg->flags & I2C_M_RD ? "from" : "to", msg->addr);
> >
> > 	i2c_bus->master_xfer_cnt =3D 0;
> > 	i2c_bus->buf_index =3D 0;
>=20
> > 	if (msg->flags & I2C_M_RD) {
> > 		if (i2c_bus->mode =3D=3D DMA_MODE)
> > 			ret =3D ast2600_i2c_setup_dma_rx(i2c_bus);
>=20
> 			return ...;
> 		if ...
>=20
>=20
> > 		else if (i2c_bus->mode =3D=3D BUFF_MODE)
> > 			ret =3D ast2600_i2c_setup_buff_rx(i2c_bus);
> > 		else
> > 			ret =3D ast2600_i2c_setup_byte_rx(i2c_bus);
>=20
> > 	} else {
> > 		if (i2c_bus->mode =3D=3D DMA_MODE)
> > 			ret =3D ast2600_i2c_setup_dma_tx(AST2600_I2CM_START_CMD,
> i2c_bus);
> > 		else if (i2c_bus->mode =3D=3D BUFF_MODE)
> > 			ret =3D ast2600_i2c_setup_buff_tx(AST2600_I2CM_START_CMD,
> i2c_bus);
> > 		else
> > 			ret =3D ast2600_i2c_setup_byte_tx(AST2600_I2CM_START_CMD,
> i2c_bus);
>=20
> Same way.
>=20
Yes, will update it.

> > 	}
> >
> > 	return ret;
> > }
>=20
> ...
>=20
> > > Wrong memory accessors. You should use something from
> > > asm/byteorder.h which includes linux/byteorder/generic.h.
> >
> > Sorry, about these parts. I quit no idea.
> > This is chip register limited, it only support dword write, not support=
 byte
> write.
> > So the only way I have is use get_unaligned_le32 function get the byte =
buffer
> to align dword write.
> > Or I may need your help point me a good way.
>=20
> >  	for (i =3D 0; i < xfer_len; i++) {
> >  		wbuf[i % 4] =3D msg->buf[i2c_bus->master_xfer_cnt + i];
> >  		if (i % 4 =3D=3D 3) {
> >  			wbuf_dword =3D get_unaligned_le32(wbuf);
> >  			writel(wbuf_dword, i2c_bus->buf_base + i - 3);
> >  		}
> >  	}
> >
> >  	if (--i % 4 !=3D 3) {
> >  		wbuf_dword =3D get_unaligned_le32(wbuf);
> >  		writel(wbuf_dword, i2c_bus->buf_base + i - (i % 4));
> >  	}
>=20
> Something like that. The most problematic part in your original code is
> dereferencing byte memory as 32-bit memory with all possible problems
> behind.
> With this code it's gone. The code itself might be improved even more, yo=
u can
> think about it, you still have time (we are now in v6.7 cycle).
>=20
Got it, let me find a better way, and also readable.=20

> --
> With Best Regards,
> Andy Shevchenko
>=20

