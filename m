Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F13665EB5B3
	for <lists+openbmc@lfdr.de>; Tue, 27 Sep 2022 01:24:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbzP16YXbz3bmL
	for <lists+openbmc@lfdr.de>; Tue, 27 Sep 2022 09:24:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=AutvG8i4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=outlook.com (client-ip=40.92.40.74; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=vebpe@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=AutvG8i4;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10olkn2074.outbound.protection.outlook.com [40.92.40.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbdMg18N5z2xFx;
	Mon, 26 Sep 2022 19:52:13 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k2oy/OKEBJi3/5+WfCDtVCHtFsJO2WYdl9aHn14c2MXTN9fdLlStd1VixwIVIDGYh93cUDVS0ZybUv4yk2yc3zqc0bU/7zPRwyIxnR/DbfcALUYiuy38fLTgGMVNLcjLSuDtIc0X6uTP87rdQYUHHqpiBp6ZmSGMoEgSXypR0P8JtOTH0rqfEPLGEb+HqQ1eCyH7fG5DaosACirTXKy2hNbqk9+s7Nf+FAd3nDIWZ3U3khRTL6x2mSwEUExZPyGfFOwBwxcMTJYk/5cD9BT1W69WqyteXoLoBsE4do6qZ2SOdMNw3KRH7lcUsrPkB77ZZwvyTV9MPK6csF4PYa6c9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQvYvgZXvBmlPMtuCcrF3ddsRMF0spXGc594bMjoLQA=;
 b=RikeJue8fqOkTUWOueIyhT85/IXncae0J3NvKJtDo40mLibzYlWUJtdCIv9SFJsw8wX/tqjdSPMnAx7DFIpS1ZMNLOn0Bcmtz5Ime/vA6dgjZm7LDsiWCeKkh6UKwp+J025rQUXGwwDkh0cZZ+XJMYQSthWjZd18FQb8dVrgvaUGAzOa547jff8T6cNHlKN4OKE90uWe0btyYvfoGDOnKVU7GBmmNUzLehwVhsTB4WvH5oW2+QAU/REdetYSm9Nm+ZFT664Oiz2nJIaM9ndQ7O1UeP4ik1URHiLcJyN6XOIqUIsVLfxWCLmKDWpNvR6HyibhnDtMWCFR3+M/iFkcTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQvYvgZXvBmlPMtuCcrF3ddsRMF0spXGc594bMjoLQA=;
 b=AutvG8i4VgPHZF39cxus7OtJpQw/LlJnpNvadt9lr0bF2Pqck7y35FY6nEOgiZOOVCgwb1Zax6TIsVkMWMuK2YcVBbYIGgkJ9kXJnrGZeDfdwJ/J+3vESZoiLycM6vyzhoiPpGwSQyINIO+WbJSeW8bPrsjJX0SZ4+MORKh+wreKgcngoDqzq9QDn6RRHfl9UqdNM5lG+I1AQMsXbnnOgrCLCCyCpVcHOTaN/aCVh+T1f3BWtxCNCqCMEQ5+H/AP66CkMxEAGOAue8QrGA4dlHOuTP6XIeP7SMYkktjGVAGo6YPw37mV6sQFMDrl6zauaMJN8iXVHe4xpS/ZCeal1g==
Received: from MN2PR17MB3375.namprd17.prod.outlook.com (2603:10b6:208:13c::25)
 by CO1PR17MB5226.namprd17.prod.outlook.com (2603:10b6:303:ff::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.24; Mon, 26 Sep
 2022 09:51:51 +0000
Received: from MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::9883:9090:f2c6:24e2]) by MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::9883:9090:f2c6:24e2%6]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 09:51:50 +0000
From: Vanessa Page <Vebpe@outlook.com>
To: "Sergiu.Moga@microchip.com" <Sergiu.Moga@microchip.com>,
	"fancer.lancer@gmail.com" <fancer.lancer@gmail.com>
Subject: Re: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles`
Thread-Topic: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles`
Thread-Index: AQHYxgcwXx6nXz60d0aHoDG+CM/mLq3wyR0AgAC5K4CAAAzLTg==
Date: Mon, 26 Sep 2022 09:51:50 +0000
Message-ID:  <MN2PR17MB337585F017ED5C5B033EDE54B8529@MN2PR17MB3375.namprd17.prod.outlook.com>
References: <20220911174551.653599-1-sergiu.moga@microchip.com>
 <20220925220304.buk3yuqoh6vszfci@mobilestation>
 <18e6e8a8-6412-7e31-21e0-6becd4400ac1@microchip.com>
In-Reply-To: <18e6e8a8-6412-7e31-21e0-6becd4400ac1@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [KIbfh7jnArshH6bqWcttcvXhXRfpLpgQLFE6LfaJ7HA=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR17MB3375:EE_|CO1PR17MB5226:EE_
x-ms-office365-filtering-correlation-id: 2f2e81a9-55d5-43c9-1d7c-08da9fa4bc40
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  vseKydpeiwaE72LOfM9eaFump7l8KKCGNmPGEOJKpQgjtoLSkl801gS1bkIfUvn1p/E/sNcy89MH74vMEuI8pSDalHyA9yzYBjG5UxdFvENnM/NFNXym/Wncrfx8HKPRGSxSnM9JpUTTaCb9VscDnr17QnqhfFJaZpl3/jEZ3QEf6BPQSqmpjc+5kIRjspxIOM507RfXgIMfqNimItEEMtrMzOLT9l3NxCw6JvfXQGJ5skUXDzNg5ghtL0iOxlXsgoWE/pNpZJO4OaaPl8cgBfiZerrj/P09R0wjEGCX85BzHEUd0k0jT1hnckdfQ5oMI+e2UM/cGF3WCp0vZItsmoOxYBD9EwUsF5fog4V6dSgaIUXdcsLFUnIg5Gi3XhsWIgL0+WuSRF8XNyiimleCw/3swVeqUKf9ZYRlVTRRoGHCMx1SZ9r+5XXn470DStrdeyC7mSbDZuG+tbwq9S4nM8EoIkNGCm3QTLizK1qAA8/fA2MBGwqPqHWnhGEXmqBPKuSu4voenrZOhrM/ojAIqhiX1lHYkB3Bs5ZMPEFnw4jDt3iPbxGP4O1G0W7CKIcjSXwp+Y8qiLznLJm+H5/uH7QxwfLcjdLCO6/LVCqCIoBaEQe76wR6gA1joBohrkpm7npNcsGIiAxqKCQGD0v0b83CUHjCpJNWGTSV1jS5nZVkL4lhSvSrs4UgKnX94qVL
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?3pC6xAn+H9xXh/PXzyo3nqLpwhzR6eqJIsLa3v6HGEPiCwRuvgwSdTnEDY2b?=
 =?us-ascii?Q?5N+EnhcaxE7ApJ8ZHBIf8BE3BcQLqeOXPCUvSktkVoknlwKLGE4cKq631T4u?=
 =?us-ascii?Q?46ksxxKyALD2ZUvmBqv7GtjpgPqdepmwBpZgkrpa7S4Igr3rPTdTy9wjjzlP?=
 =?us-ascii?Q?Jp7VUAul5dNQ+TcM//GdhASXJ2axYBlIKbHIPsgIChYlAPsNC8Anb8SwmvUn?=
 =?us-ascii?Q?lv6himjlTTUxvYaHOAaRUUPHseOHkdQ+N3dWEfja46AYrQhxASCwpRlqCSkt?=
 =?us-ascii?Q?oPTf/aBrt4310HX0EOJwFtnTWhsnboayrjjd21NL31YizObl/MyqVExjTxG0?=
 =?us-ascii?Q?HBMcbRR/GT+rDhjeROeu4RxbCWFzmv0umMub8/p6SOnvQUSbW+YChAnSeru9?=
 =?us-ascii?Q?tm6H04DYER5l9TqCNQB9KALk8K8VtqjHPNlwQrxyttEwTba2FwlZJMzLc4+T?=
 =?us-ascii?Q?JsLKxezTc+9HKrWGscSKT80XpVedhsV6ZXDMw63ewAgcGy+F5TtfmgF91o2j?=
 =?us-ascii?Q?ERkcRJFrl5m57vlmUIdNcCae8X4Pqr2XcYX+dBCtetwXjPhgl6o10uB3w1hK?=
 =?us-ascii?Q?8hB5GKJuwJelvlRkXkYLwtX5JcJPlxq/I3V4biFf2jmbBgxFgld0AQcixJ3C?=
 =?us-ascii?Q?yzPWReNpD9tstNwlF3ietOQuOtEIhlm/EBM890GWfXnqA18ZFImdsDHw2Xzc?=
 =?us-ascii?Q?oNajfjIaDOrzIW3RVfw7tzoj7C08qdStTZxZmleAvHSkSxkpg6yRz6k7bt0P?=
 =?us-ascii?Q?NbY+J+gTEYg3ljZmC/iCoBBPMucUJ+0khd+s0EX7iZ45D+4p/ntdzaem9EHj?=
 =?us-ascii?Q?ra1nYWcrIV8rhmuOs3mVV2mrmpxEu1dwUvxGE2eJODLqRSDF4JCBv1quvDFU?=
 =?us-ascii?Q?7CA6+HIXpXg+isaI3Lqi5IReqap2jtLZ+QN9azugxYeOnu99btkiPRRv3kE9?=
 =?us-ascii?Q?nDESE0O9Zwt00f2TJ1IiIU19Lol+/Un3Hx93c/gjos/WJAcNUcJ9XgnXp8En?=
 =?us-ascii?Q?Ak0m2jQ8MhasVDuizTyElOiLgd0bws7Al59jDcjva/LduyHJUTkSTalXSnTT?=
 =?us-ascii?Q?T3XXlcLv7wcVYd7dyZwfFoelpA1i51EuNH8XYlBOzzOismx84MEh45hjI929?=
 =?us-ascii?Q?n56qE9rHPEACI+vYIjSKRkGcGKLxAlgxLWoJt8PgOcTX/xPD0Y7Htoyhyfgs?=
 =?us-ascii?Q?7unLOifIDE/0UocLqDO9CWP56jf6pHZwtR3AsvK2D24B+7hEKW7qrrXHLU6w?=
 =?us-ascii?Q?ETqdIh3lklLKY/ssxAMi?=
Content-Type: multipart/alternative;
	boundary="_000_MN2PR17MB337585F017ED5C5B033EDE54B8529MN2PR17MB3375namp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR17MB3375.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f2e81a9-55d5-43c9-1d7c-08da9fa4bc40
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2022 09:51:50.7492
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR17MB5226
X-Mailman-Approved-At: Tue, 27 Sep 2022 09:22:21 +1000
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
Cc: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "vigneshr@ti.com" <vigneshr@ti.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>, "tali.perry1@gmail.com" <tali.perry1@gmail.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "tmaimon77@gmail.com" <tmaimon77@gmail.com>, "benjaminfair@google.com" <benjaminfair@google.com>, "kdasu.kdev@gmail.com" <kdasu.kdev@gmail.com>, "richard@nod.at" <richard@nod.at>, "chin-ting_kuo@aspeedtech.com" <chin-ting_kuo@aspeedtech.com>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "haibo.chen@nxp.com" <haibo.chen@nxp.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-fee
 dback-list@broadcom.com>, "joel@jms.id.au" <joel@jms.id.au>, "yogeshgaur.83@gmail.com" <yogeshgaur.83@gmail.com>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>, "john.garry@huawei.com" <john.garry@huawei.com>, "broonie@kernel.org" <broonie@kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "clg@kaod.org" <clg@kaod.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "han.xu@nxp.com" <han.xu@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "andrew@aj.id.au" <andrew@aj.id.au>, "venture@google.com" <venture@google.com>, "heiko@sntech.de" <heiko@sntech.de>, "Nicolas.Ferre@microchip.com" <Nicolas.Ferre@microchip.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "avifishman70@gmail.com" <avifishman70@gmail.com>, "michael@walle.cc" <michael@walle.cc>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.co
 m>, "Claudiu.Beznea@microchip.com" <Claudiu.Beznea@microchip.com>, "pratyush@kernel.org" <pratyush@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_MN2PR17MB337585F017ED5C5B033EDE54B8529MN2PR17MB3375namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

You dumb fuck stay in your nasty as disease infested poverty filled country
________________________________
From: linux-mtd <linux-mtd-bounces@lists.infradead.org> on behalf of Sergiu=
.Moga@microchip.com <Sergiu.Moga@microchip.com>
Sent: Monday, September 26, 2022 5:05 AM
To: fancer.lancer@gmail.com <fancer.lancer@gmail.com>
Cc: Tudor.Ambarus@microchip.com <Tudor.Ambarus@microchip.com>; pratyush@ker=
nel.org <pratyush@kernel.org>; michael@walle.cc <michael@walle.cc>; miquel.=
raynal@bootlin.com <miquel.raynal@bootlin.com>; richard@nod.at <richard@nod=
.at>; vigneshr@ti.com <vigneshr@ti.com>; broonie@kernel.org <broonie@kernel=
.org>; Nicolas.Ferre@microchip.com <Nicolas.Ferre@microchip.com>; alexandre=
.belloni@bootlin.com <alexandre.belloni@bootlin.com>; Claudiu.Beznea@microc=
hip.com <Claudiu.Beznea@microchip.com>; chin-ting_kuo@aspeedtech.com <chin-=
ting_kuo@aspeedtech.com>; clg@kaod.org <clg@kaod.org>; joel@jms.id.au <joel=
@jms.id.au>; andrew@aj.id.au <andrew@aj.id.au>; kdasu.kdev@gmail.com <kdasu=
.kdev@gmail.com>; han.xu@nxp.com <han.xu@nxp.com>; john.garry@huawei.com <j=
ohn.garry@huawei.com>; matthias.bgg@gmail.com <matthias.bgg@gmail.com>; avi=
fishman70@gmail.com <avifishman70@gmail.com>; tmaimon77@gmail.com <tmaimon7=
7@gmail.com>; tali.perry1@gmail.com <tali.perry1@gmail.com>; venture@google=
.com <venture@google.com>; yuenn@google.com <yuenn@google.com>; benjaminfai=
r@google.com <benjaminfair@google.com>; haibo.chen@nxp.com <haibo.chen@nxp.=
com>; yogeshgaur.83@gmail.com <yogeshgaur.83@gmail.com>; heiko@sntech.de <h=
eiko@sntech.de>; mcoquelin.stm32@gmail.com <mcoquelin.stm32@gmail.com>; ale=
xandre.torgue@foss.st.com <alexandre.torgue@foss.st.com>; michal.simek@xili=
nx.com <michal.simek@xilinx.com>; bcm-kernel-feedback-list@broadcom.com <bc=
m-kernel-feedback-list@broadcom.com>; linux-mtd@lists.infradead.org <linux-=
mtd@lists.infradead.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.k=
ernel.org>; linux-spi@vger.kernel.org <linux-spi@vger.kernel.org>; linux-ar=
m-kernel@lists.infradead.org <linux-arm-kernel@lists.infradead.org>; linux-=
aspeed@lists.ozlabs.org <linux-aspeed@lists.ozlabs.org>; openbmc@lists.ozla=
bs.org <openbmc@lists.ozlabs.org>; linux-mediatek@lists.infradead.org <linu=
x-mediatek@lists.infradead.org>; linux-rockchip@lists.infradead.org <linux-=
rockchip@lists.infradead.org>; linux-stm32@st-md-mailman.stormreply.com <li=
nux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles`

On 26.09.2022 01:03, Serge Semin wrote:
> Hello Sergiu
>


Hello Serge,


> On Sun, Sep 11, 2022 at 08:45:53PM +0300, Sergiu Moga wrote:
>> In order to properly represent the hardware functionality
>> in the core, avoid reconverting the number of dummy cycles
>> to the number of bytes and only work with the former.
>> Instead, let the drivers that do need this conversion do
>> it themselves.
>>
>> Signed-off-by: Sergiu Moga <sergiu.moga@microchip.com>
>> ---
>>   drivers/mtd/spi-nor/core.c        | 22 ++++----------
>
> [...]
>
>>   drivers/spi/spi-dw-core.c         | 10 +++++--
>
> [...]
>
>>   drivers/spi/spi-mem.c             | 27 +++++++++++------
>
> [...]
>
>>   drivers/spi/spi-mtk-nor.c         | 48 +++++++++++++++++--------------
>
> [...]
>
>>   drivers/spi/spi-zynq-qspi.c       | 15 ++++++----
>>   drivers/spi/spi-zynqmp-gqspi.c    |  8 ++++--
>>   include/linux/spi/spi-mem.h       | 10 +++----
>>   25 files changed, 234 insertions(+), 147 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index f2c64006f8d7..cc8ca824f912 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -88,7 +88,7 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor=
,
>>        if (op->addr.nbytes)
>>                op->addr.buswidth =3D spi_nor_get_protocol_addr_nbits(pro=
to);
>>
>
>
>
>> -     if (op->dummy.nbytes)
>> +     if (op->dummy.ncycles)
>>                op->dummy.buswidth =3D spi_nor_get_protocol_addr_nbits(pr=
oto);
>>
>>        if (op->data.nbytes)
>> @@ -106,9 +106,6 @@ void spi_nor_spimem_setup_op(const struct spi_nor *n=
or,
>>                op->dummy.dtr =3D true;
>>                op->data.dtr =3D true;
>>
>> -             /* 2 bytes per clock cycle in DTR mode. */
>> -             op->dummy.nbytes *=3D 2;
>> -
>>                ext =3D spi_nor_get_cmd_ext(nor, op);
>>                op->cmd.opcode =3D (op->cmd.opcode << 8) | ext;
>>                op->cmd.nbytes =3D 2;
>> @@ -207,10 +204,7 @@ static ssize_t spi_nor_spimem_read_data(struct spi_=
nor *nor, loff_t from,
>>
>>        spi_nor_spimem_setup_op(nor, &op, nor->read_proto);
>>
>> -     /* convert the dummy cycles to the number of bytes */
>> -     op.dummy.nbytes =3D (nor->read_dummy * op.dummy.buswidth) / 8;
>> -     if (spi_nor_protocol_is_dtr(nor->read_proto))
>> -             op.dummy.nbytes *=3D 2;
>> +     op.dummy.ncycles =3D nor->read_dummy;
>
> So according to this modification and what is done in the rest of the
> patch, the dummy part of the SPI-mem operations now contains the number
> of cycles only. Am I right to think that it means a number of dummy
> clock oscillations? (Judging from what I've seen in the HW-manuals of
> the SPI NOR memory devices most likely I am...)



Yes, you are correct.


> If so the "ncycles" field
> is now free from the "data" semantic. Then what is the meaning of the
> "buswidth and "dtr" fields in the spi_mem_op.dummy field?
>


It is still meaningful as it is used for the conversion by some drivers
to nbytes and I do not see how it goes out of the specification in any
way. So, at least for now, I do not see any reason to remove these fields.


>>
>>        usebouncebuf =3D spi_nor_spimem_bounce(nor, &op);
>>
>> @@ -455,7 +449,7 @@ int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
>>
>>                if (nor->reg_proto =3D=3D SNOR_PROTO_8_8_8_DTR) {
>>                        op.addr.nbytes =3D nor->params->rdsr_addr_nbytes;
>> -                     op.dummy.nbytes =3D nor->params->rdsr_dummy;
>> +                     op.dummy.ncycles =3D nor->params->rdsr_dummy;
>>                        /*
>>                         * We don't want to read only one byte in DTR mod=
e. So,
>>                         * read 2 and then discard the second byte.
>> @@ -1913,10 +1907,7 @@ static int spi_nor_spimem_check_readop(struct spi=
_nor *nor,
>>
>>        spi_nor_spimem_setup_op(nor, &op, read->proto);
>>
>> -     /* convert the dummy cycles to the number of bytes */
>> -     op.dummy.nbytes =3D (nor->read_dummy * op.dummy.buswidth) / 8;
>> -     if (spi_nor_protocol_is_dtr(nor->read_proto))
>> -             op.dummy.nbytes *=3D 2;
>> +     op.dummy.ncycles =3D nor->read_dummy;
>>
>>        return spi_nor_spimem_check_op(nor, &op);
>>   }
>> @@ -3034,10 +3025,7 @@ static int spi_nor_create_read_dirmap(struct spi_=
nor *nor)
>>
>>        spi_nor_spimem_setup_op(nor, op, nor->read_proto);
>>
>> -     /* convert the dummy cycles to the number of bytes */
>> -     op->dummy.nbytes =3D (nor->read_dummy * op->dummy.buswidth) / 8;
>> -     if (spi_nor_protocol_is_dtr(nor->read_proto))
>> -             op->dummy.nbytes *=3D 2;
>> +     op->dummy.ncycles =3D nor->read_dummy;
>>
>>        /*
>>         * Since spi_nor_spimem_setup_op() only sets buswidth when the nu=
mber
>
> [...]
>
>> diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
>> index f87d97ccd2d6..0ba5c7d0e66e 100644
>> --- a/drivers/spi/spi-dw-core.c
>> +++ b/drivers/spi/spi-dw-core.c
>> @@ -498,13 +498,17 @@ static bool dw_spi_supports_mem_op(struct spi_mem =
*mem,
>>   static int dw_spi_init_mem_buf(struct dw_spi *dws, const struct spi_me=
m_op *op)
>>   {
>>        unsigned int i, j, len;
>> -     u8 *out;
>> +     u8 *out, dummy_nbytes;
>>
>>        /*
>>         * Calculate the total length of the EEPROM command transfer and
>>         * either use the pre-allocated buffer or create a temporary one.
>>         */
>> -     len =3D op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
>
>> +     dummy_nbytes =3D (op->dummy.ncycles * op->dummy.buswidth) / 8;
>
> 1. What about using the BITS_PER_BYTE macro (linux/bits.h) here? Since
> you are adding a similar modification to so many drivers what about using
> that macro there too?
>


AFAICT BIT_PER_BYTE is meant to transparently indicate how many bits per
byte an arch has. Although, there is no place in the kernel from what I
can see that has BITS_PER_BYTE with a value other than 8, you cannot
deny that there exist architectures whose number of bits per byte may be
different from 8.

Meanwhile, the JESD216E specification tells us in the Terms and
definitions chapter that
"DWORD: Four consecutive 8-bit bytes used as the basic 32-bit building
block for headers and parameter tables." So it explicitly says that a
byte has 8 bits regardless of the arch.

Therefore, I do not agree with replacing 8 with the BITS_PER_BYTE macro
as, IMO, it does not represent the same thing as the number of bits per
byte that the terms and definitions of the JESD216E specification refer to.


> 2. buswidth is supposed to be always 1 in this driver (see the
> dw_spi_supports_mem_op() method). So it can be dropped from the
> statement above.
>
> 3. Since the ncycles now contains a number of clock cycles there is no
> point in taking the SPI bus-width into account at all. What is
> meaningful is how many oscillations are supposed to be placed on the
> CLK line before the data is available. So the op->dummy.ncycles /
> BITS_PER_BYTE statement would be more appropriate here in any case.
>


I can agee with this in the case of this driver, sure.


>> +     if (op->dummy.dtr)
>> +             dummy_nbytes *=3D 2;
>
> DTR is unsupported by the controller. See, no spi_controller_mem_caps
> initialized. So this part is redundant. The same is most likely
> applicable for some of the DTR-related updates in this patch too
> since the spi_controller_mem_caps structure is initialized in a few
> drivers only.
>


Agreed. Initially, wherever I was not sure, I just placed this if
condition to avoid breaking anything in case the driver does support
DTR. The same goes for your other related observations to other driver
modifications, with which I agree :).


>> +
>> +     len =3D op->cmd.nbytes + op->addr.nbytes + dummy_nbytes;
>>        if (op->data.dir =3D=3D SPI_MEM_DATA_OUT)
>>                len +=3D op->data.nbytes;
>>
>> @@ -525,7 +529,7 @@ static int dw_spi_init_mem_buf(struct dw_spi *dws, c=
onst struct spi_mem_op *op)
>>                out[i] =3D DW_SPI_GET_BYTE(op->cmd.opcode, op->cmd.nbytes=
 - i - 1);
>>        for (j =3D 0; j < op->addr.nbytes; ++i, ++j)
>>                out[i] =3D DW_SPI_GET_BYTE(op->addr.val, op->addr.nbytes =
- j - 1);
>> -     for (j =3D 0; j < op->dummy.nbytes; ++i, ++j)
>> +     for (j =3D 0; j < dummy_nbytes; ++i, ++j)
>>                out[i] =3D 0x0;
>>
>>        if (op->data.dir =3D=3D SPI_MEM_DATA_OUT)
>
> [...]
>
>> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
>> index 0c79193d9697..7b204963bb62 100644
>> --- a/drivers/spi/spi-mem.c
>> +++ b/drivers/spi/spi-mem.c
>> @@ -149,7 +149,7 @@ static bool spi_mem_check_buswidth(struct spi_mem *m=
em,
>>            spi_check_buswidth_req(mem, op->addr.buswidth, true))
>>                return false;
>>
>> -     if (op->dummy.nbytes &&
>> +     if (op->dummy.ncycles &&
>>            spi_check_buswidth_req(mem, op->dummy.buswidth, true))
>>                return false;
>>
>> @@ -202,7 +202,7 @@ static int spi_mem_check_op(const struct spi_mem_op =
*op)
>>                return -EINVAL;
>>
>>        if ((op->addr.nbytes && !op->addr.buswidth) ||
>> -         (op->dummy.nbytes && !op->dummy.buswidth) ||
>> +         (op->dummy.ncycles && !op->dummy.buswidth) ||
>>            (op->data.nbytes && !op->data.buswidth))
>>                return -EINVAL;
>>
>> @@ -315,7 +315,7 @@ int spi_mem_exec_op(struct spi_mem *mem, const struc=
t spi_mem_op *op)
>
>>        struct spi_controller *ctlr =3D mem->spi->controller;
>>        struct spi_transfer xfers[4] =3D { };
>>        struct spi_message msg;
>> -     u8 *tmpbuf;
>> +     u8 *tmpbuf, dummy_nbytes;
>>        int ret;
>
> Reverse xmas tree order?
>
>>
>>        ret =3D spi_mem_check_op(op);
>> @@ -343,7 +343,11 @@ int spi_mem_exec_op(struct spi_mem *mem, const stru=
ct spi_mem_op *op)
>>                        return ret;
>>        }
>>
>
>> -     tmpbufsize =3D op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes=
;
>> +     dummy_nbytes =3D (op->dummy.ncycles * op->dummy.buswidth) / 8;
>
> So ncycles now indeed is a number of CLK line oscillations. This most
> likely will break the SPI Nand driver then, which still passes the
> number of bytes to the SPI_MEM_OP_DUMMY() macro.
>
>> +     if (op->dummy.dtr)
>> +             dummy_nbytes *=3D 2;
>
> Generic SPI-mem ops don't take the DTR mode into account. So I don't
> see this necessary.
>


You may be right, but this part of the code does take into consideration
the number of dummy.nbytes to calculate the xfer length. Therefore,
shouldn't this code block also know if the number of dummy nbytes is
actually double the amount that it calculated through the conversion
formula?


>> +
>> +     tmpbufsize =3D op->cmd.nbytes + op->addr.nbytes + dummy_nbytes;
>>
>>        /*
>>         * Allocate a buffer to transmit the CMD, ADDR cycles with kmallo=
c() so
>> @@ -379,15 +383,15 @@ int spi_mem_exec_op(struct spi_mem *mem, const str=
uct spi_mem_op *op)
>>                totalxferlen +=3D op->addr.nbytes;
>>        }
>>
>> -     if (op->dummy.nbytes) {
>> -             memset(tmpbuf + op->addr.nbytes + 1, 0xff, op->dummy.nbyte=
s);
>> +     if (dummy_nbytes) {
>> +             memset(tmpbuf + op->addr.nbytes + 1, 0xff, dummy_nbytes);
>>                xfers[xferpos].tx_buf =3D tmpbuf + op->addr.nbytes + 1;
>> -             xfers[xferpos].len =3D op->dummy.nbytes;
>> +             xfers[xferpos].len =3D dummy_nbytes;
>>                xfers[xferpos].tx_nbits =3D op->dummy.buswidth;
>>                xfers[xferpos].dummy_data =3D 1;
>>                spi_message_add_tail(&xfers[xferpos], &msg);
>>                xferpos++;
>> -             totalxferlen +=3D op->dummy.nbytes;
>> +             totalxferlen +=3D dummy_nbytes;
>>        }
>>
>>        if (op->data.nbytes) {
>> @@ -456,12 +460,17 @@ int spi_mem_adjust_op_size(struct spi_mem *mem, st=
ruct spi_mem_op *op)
>>   {
>
>>        struct spi_controller *ctlr =3D mem->spi->controller;
>>        size_t len;
>> +     u8 dummy_nbytes;
>
> reverse xmas tree?
>
>>
>>        if (ctlr->mem_ops && ctlr->mem_ops->adjust_op_size)
>>                return ctlr->mem_ops->adjust_op_size(mem, op);
>>
>> +     dummy_nbytes =3D (op->dummy.ncycles * op->dummy.buswidth) / 8;
>> +     if (op->dummy.dtr)
>> +             dummy_nbytes *=3D 2;
>> +
>>        if (!ctlr->mem_ops || !ctlr->mem_ops->exec_op) {
>> -             len =3D op->cmd.nbytes + op->addr.nbytes + op->dummy.nbyte=
s;
>> +             len =3D op->cmd.nbytes + op->addr.nbytes + dummy_nbytes;
>>
>>                if (len > spi_max_transfer_size(mem->spi))
>>                        return -EINVAL;
>
> [...]
>
>> diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
>> index d167699a1a96..f6870c6e911a 100644
>> --- a/drivers/spi/spi-mtk-nor.c
>> +++ b/drivers/spi/spi-mtk-nor.c
>> @@ -171,23 +171,18 @@ static bool need_bounce(struct mtk_nor *sp, const =
struct spi_mem_op *op)
>>
>>   static bool mtk_nor_match_read(const struct spi_mem_op *op)
>>   {
>> -     int dummy =3D 0;
>> -
>> -     if (op->dummy.nbytes)
>> -             dummy =3D op->dummy.nbytes * BITS_PER_BYTE / op->dummy.bus=
width;
>> -
>>        if ((op->data.buswidth =3D=3D 2) || (op->data.buswidth =3D=3D 4))=
 {
>>                if (op->addr.buswidth =3D=3D 1)
>> -                     return dummy =3D=3D 8;
>> +                     return op->dummy.ncycles =3D=3D 8;
>>                else if (op->addr.buswidth =3D=3D 2)
>> -                     return dummy =3D=3D 4;
>> +                     return op->dummy.ncycles =3D=3D 4;
>>                else if (op->addr.buswidth =3D=3D 4)
>> -                     return dummy =3D=3D 6;
>> +                     return op->dummy.ncycles =3D=3D 6;
>>        } else if ((op->addr.buswidth =3D=3D 1) && (op->data.buswidth =3D=
=3D 1)) {
>>                if (op->cmd.opcode =3D=3D 0x03)
>> -                     return dummy =3D=3D 0;
>> +                     return op->dummy.ncycles =3D=3D 0;
>>                else if (op->cmd.opcode =3D=3D 0x0b)
>> -                     return dummy =3D=3D 8;
>> +                     return op->dummy.ncycles =3D=3D 8;
>>        }
>>        return false;
>>   }
>> @@ -195,6 +190,10 @@ static bool mtk_nor_match_read(const struct spi_mem=
_op *op)
>>   static bool mtk_nor_match_prg(const struct spi_mem_op *op)
>>   {
>>        int tx_len, rx_len, prg_len, prg_left;
>
>> +     u8 dummy_nbytes =3D (op->dummy.ncycles * op->dummy.buswidth) / 8;
>> +
>
> IMO it's better to move the initialization statement to a separate
> line here.
>
>> +     if (op->dummy.dtr)
>> +             dummy_nbytes *=3D 2;
>
> Does the MTK SPI driver support DTR? AFAICS it doesn't.
>
>>
>>        // prg mode is spi-only.
>>        if ((op->cmd.buswidth > 1) || (op->addr.buswidth > 1) ||
>> @@ -205,7 +204,7 @@ static bool mtk_nor_match_prg(const struct spi_mem_o=
p *op)
>>
>>        if (op->data.dir =3D=3D SPI_MEM_DATA_OUT) {
>>                // count dummy bytes only if we need to write data after =
it
>> -             tx_len +=3D op->dummy.nbytes;
>> +             tx_len +=3D dummy_nbytes;
>>
>>                // leave at least one byte for data
>>                if (tx_len > MTK_NOR_REG_PRGDATA_MAX)
>> @@ -221,7 +220,7 @@ static bool mtk_nor_match_prg(const struct spi_mem_o=
p *op)
>>                        return false;
>>
>>                rx_len =3D op->data.nbytes;
>> -             prg_left =3D MTK_NOR_PRG_CNT_MAX / 8 - tx_len - op->dummy.=
nbytes;
>> +             prg_left =3D MTK_NOR_PRG_CNT_MAX / 8 - tx_len - dummy_nbyt=
es;
>>                if (prg_left > MTK_NOR_REG_SHIFT_MAX + 1)
>>                        prg_left =3D MTK_NOR_REG_SHIFT_MAX + 1;
>>                if (rx_len > prg_left) {
>> @@ -230,11 +229,11 @@ static bool mtk_nor_match_prg(const struct spi_mem=
_op *op)
>>                        rx_len =3D prg_left;
>>                }
>>
>> -             prg_len =3D tx_len + op->dummy.nbytes + rx_len;
>> +             prg_len =3D tx_len + dummy_nbytes + rx_len;
>>                if (prg_len > MTK_NOR_PRG_CNT_MAX / 8)
>>                        return false;
>>        } else {
>> -             prg_len =3D tx_len + op->dummy.nbytes;
>> +             prg_len =3D tx_len + dummy_nbytes;
>>                if (prg_len > MTK_NOR_PRG_CNT_MAX / 8)
>>                        return false;
>>        }
>> @@ -244,15 +243,19 @@ static bool mtk_nor_match_prg(const struct spi_mem=
_op *op)
>>   static void mtk_nor_adj_prg_size(struct spi_mem_op *op)
>>   {
>>        int tx_len, tx_left, prg_left;
>
>> +     u8 dummy_nbytes =3D (op->dummy.ncycles * op->dummy.buswidth) / 8;
>> +
>> +     if (op->dummy.dtr)
>> +             dummy_nbytes *=3D 2;
>
> ditto
>
>>
>>        tx_len =3D op->cmd.nbytes + op->addr.nbytes;
>>        if (op->data.dir =3D=3D SPI_MEM_DATA_OUT) {
>> -             tx_len +=3D op->dummy.nbytes;
>> +             tx_len +=3D dummy_nbytes;
>>                tx_left =3D MTK_NOR_REG_PRGDATA_MAX + 1 - tx_len;
>>                if (op->data.nbytes > tx_left)
>>                        op->data.nbytes =3D tx_left;
>>        } else if (op->data.dir =3D=3D SPI_MEM_DATA_IN) {
>> -             prg_left =3D MTK_NOR_PRG_CNT_MAX / 8 - tx_len - op->dummy.=
nbytes;
>> +             prg_left =3D MTK_NOR_PRG_CNT_MAX / 8 - tx_len - dummy_nbyt=
es;
>>                if (prg_left > MTK_NOR_REG_SHIFT_MAX + 1)
>>                        prg_left =3D MTK_NOR_REG_SHIFT_MAX + 1;
>>                if (op->data.nbytes > prg_left)
>> @@ -312,7 +315,7 @@ static bool mtk_nor_supports_op(struct spi_mem *mem,
>>                        break;
>>                case SPI_MEM_DATA_OUT:
>>                        if ((op->addr.buswidth =3D=3D 1) &&
>> -                         (op->dummy.nbytes =3D=3D 0) &&
>> +                         (op->dummy.ncycles =3D=3D 0) &&
>>                            (op->data.buswidth =3D=3D 1))
>>                                return true;
>>                        break;
>> @@ -515,17 +518,20 @@ static int mtk_nor_spi_mem_prg(struct mtk_nor *sp,=
 const struct spi_mem_op *op)
>>        int tx_len, prg_len;
>>        int i, ret;
>>        void __iomem *reg;
>
>> -     u8 bufbyte;
>> +     u8 bufbyte, dummy_nbytes =3D (op->dummy.ncycles * op->dummy.buswid=
th) / 8;
>> +
>> +     if (op->dummy.dtr)
>> +             dummy_nbytes *=3D 2;
>
> ditto
>
>>
>>        tx_len =3D op->cmd.nbytes + op->addr.nbytes;
>>
>>        // count dummy bytes only if we need to write data after it
>>        if (op->data.dir =3D=3D SPI_MEM_DATA_OUT)
>> -             tx_len +=3D op->dummy.nbytes + op->data.nbytes;
>> +             tx_len +=3D dummy_nbytes + op->data.nbytes;
>>        else if (op->data.dir =3D=3D SPI_MEM_DATA_IN)
>>                rx_len =3D op->data.nbytes;
>>
>> -     prg_len =3D op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes +
>> +     prg_len =3D op->cmd.nbytes + op->addr.nbytes + dummy_nbytes +
>>                  op->data.nbytes;
>>
>>        // an invalid op may reach here if the caller calls exec_op witho=
ut
>> @@ -550,7 +556,7 @@ static int mtk_nor_spi_mem_prg(struct mtk_nor *sp, c=
onst struct spi_mem_op *op)
>>        }
>>
>>        if (op->data.dir =3D=3D SPI_MEM_DATA_OUT) {
>> -             for (i =3D 0; i < op->dummy.nbytes; i++, reg_offset--) {
>> +             for (i =3D 0; i < dummy_nbytes; i++, reg_offset--) {
>>                        reg =3D sp->base + MTK_NOR_REG_PRGDATA(reg_offset=
);
>>                        writeb(0, reg);
>>                }
>
> [...]
>
>> diff --git a/drivers/spi/spi-zynq-qspi.c b/drivers/spi/spi-zynq-qspi.c
>> index 78f31b61a2aa..84b7db85548c 100644
>> --- a/drivers/spi/spi-zynq-qspi.c
>> +++ b/drivers/spi/spi-zynq-qspi.c
>> @@ -527,7 +527,10 @@ static int zynq_qspi_exec_mem_op(struct spi_mem *me=
m,
>>   {
>>        struct zynq_qspi *xqspi =3D spi_controller_get_devdata(mem->spi->=
master);
>>        int err =3D 0, i;
>> -     u8 *tmpbuf;
>> +     u8 *tmpbuf, dummy_nbytes =3D (op->dummy.ncycles * op->dummy.buswid=
th) / 8;
>
> Separate line?
>
>> +
>> +     if (op->dummy.dtr)
>> +             dummy_nbytes *=3D 2;
>
> Is DTR supported by the driver?
>


Not from what I can see, but I was not 100% sure so I placed this if
statement here just in case.



>>
>>        dev_dbg(xqspi->dev, "cmd:%#x mode:%d.%d.%d.%d\n",
>>                op->cmd.opcode, op->cmd.buswidth, op->addr.buswidth,
>> @@ -568,17 +571,17 @@ static int zynq_qspi_exec_mem_op(struct spi_mem *m=
em,
>>                        err =3D -ETIMEDOUT;
>>        }
>>
>> -     if (op->dummy.nbytes) {
>> -             tmpbuf =3D kzalloc(op->dummy.nbytes, GFP_KERNEL);
>> +     if (dummy_nbytes) {
>> +             tmpbuf =3D kzalloc(dummy_nbytes, GFP_KERNEL);
>>                if (!tmpbuf)
>>                        return -ENOMEM;
>>
>> -             memset(tmpbuf, 0xff, op->dummy.nbytes);
>> +             memset(tmpbuf, 0xff, dummy_nbytes);
>>                reinit_completion(&xqspi->data_completion);
>>                xqspi->txbuf =3D tmpbuf;
>>                xqspi->rxbuf =3D NULL;
>> -             xqspi->tx_bytes =3D op->dummy.nbytes;
>> -             xqspi->rx_bytes =3D op->dummy.nbytes;
>> +             xqspi->tx_bytes =3D dummy_nbytes;
>> +             xqspi->rx_bytes =3D dummy_nbytes;
>>                zynq_qspi_write_op(xqspi, ZYNQ_QSPI_FIFO_DEPTH, true);
>>                zynq_qspi_write(xqspi, ZYNQ_QSPI_IEN_OFFSET,
>>                                ZYNQ_QSPI_IXR_RXTX_MASK);
>> diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqs=
pi.c
>> index c760aac070e5..b41abadef9a6 100644
>> --- a/drivers/spi/spi-zynqmp-gqspi.c
>> +++ b/drivers/spi/spi-zynqmp-gqspi.c
>> @@ -948,6 +948,10 @@ static int zynqmp_qspi_exec_op(struct spi_mem *mem,
>>        u32 genfifoentry =3D 0;
>>        u16 opcode =3D op->cmd.opcode;
>>        u64 opaddr;
>
>> +     u8 dummy_nbytes =3D (op->dummy.ncycles * op->dummy.buswidth) / 8;
>> +
>> +     if (op->dummy.dtr)
>> +             dummy_nbytes *=3D 2;
>
> ditto
>
>>
>>        dev_dbg(xqspi->dev, "cmd:%#x mode:%d.%d.%d.%d\n",
>>                op->cmd.opcode, op->cmd.buswidth, op->addr.buswidth,
>> @@ -1006,14 +1010,14 @@ static int zynqmp_qspi_exec_op(struct spi_mem *m=
em,
>>                }
>>        }
>>
>> -     if (op->dummy.nbytes) {
>> +     if (dummy_nbytes) {
>>                xqspi->txbuf =3D NULL;
>>                xqspi->rxbuf =3D NULL;
>>                /*
>>                 * xqspi->bytes_to_transfer here represents the dummy cir=
cles
>>                 * which need to be sent.
>>                 */
>> -             xqspi->bytes_to_transfer =3D op->dummy.nbytes * 8 / op->du=
mmy.buswidth;
>> +             xqspi->bytes_to_transfer =3D dummy_nbytes;
>>                xqspi->bytes_to_receive =3D 0;
>>                /*
>>                 * Using op->data.buswidth instead of op->dummy.buswidth =
here because
>> diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
>> index 2ba044d0d5e5..5fd45800af03 100644
>> --- a/include/linux/spi/spi-mem.h
>> +++ b/include/linux/spi/spi-mem.h
>> @@ -29,9 +29,9 @@
>>
>>   #define SPI_MEM_OP_NO_ADDR   { }
>>
>
>> -#define SPI_MEM_OP_DUMMY(__nbytes, __buswidth)                       \
>> +#define SPI_MEM_OP_DUMMY(__ncycles, __buswidth)              \
>>        {                                                       \
>
>> -             .nbytes =3D __nbytes,                             \
>> +             .ncycles =3D __ncycles,                           \
>>                .buswidth =3D __buswidth,                         \
>
> Please make sure this update and the drivers/spi/spi-mem.c driver
> alterations are coherent with the SPI Nand driver. See the macro usages:
> include/linux/mtd/spinand.h: SPINAND_PAGE_READ_FROM_*().
>
> -Sergey
>


Yes, indeed, I should have paid more attention here. As I have
previously said,  I simply replaced dummy.nbytes with the code sequences
you now see. I should have checked for SPI_MEM_OP_DUMMY usages as well
since I changed its definition. Thank you! :)


>>        }
>>
>> @@ -83,8 +83,8 @@ enum spi_mem_data_dir {
>>    *         Note that only @addr.nbytes are taken into account in this
>>    *         address value, so users should make sure the value fits in =
the
>>    *         assigned number of bytes.
>> - * @dummy.nbytes: number of dummy bytes to send after an opcode or addr=
ess. Can
>> - *             be zero if the operation does not require dummy bytes
>> + * @dummy.ncycles: number of dummy cycles after an opcode or address. C=
an
>> + *              be zero if the operation does not require dummy cycles
>>    * @dummy.buswidth: number of IO lanes used to transmit the dummy byte=
s
>>    * @dummy.dtr: whether the dummy bytes should be sent in DTR mode or n=
ot
>>    * @data.buswidth: number of IO lanes used to send/receive the data
>> @@ -112,7 +112,7 @@ struct spi_mem_op {
>>        } addr;
>>
>>        struct {
>> -             u8 nbytes;
>> +             u8 ncycles;
>>                u8 buswidth;
>>                u8 dtr : 1;
>>        } dummy;
>> --
>> 2.34.1
>>


Regards,
        Sergiu
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--_000_MN2PR17MB337585F017ED5C5B033EDE54B8529MN2PR17MB3375namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div style=3D"font-family: inherit; font-size: inherit; color: rgb(0, 0, 0)=
;"></div>
<div style=3D"font-family: inherit; font-size: inherit; color: rgb(0, 0, 0)=
;">You dumb fuck stay in your nasty as disease infested poverty filled coun=
try&nbsp;</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> linux-mtd &lt;linux-m=
td-bounces@lists.infradead.org&gt; on behalf of Sergiu.Moga@microchip.com &=
lt;Sergiu.Moga@microchip.com&gt;<br>
<b>Sent:</b> Monday, September 26, 2022 5:05 AM<br>
<b>To:</b> fancer.lancer@gmail.com &lt;fancer.lancer@gmail.com&gt;<br>
<b>Cc:</b> Tudor.Ambarus@microchip.com &lt;Tudor.Ambarus@microchip.com&gt;;=
 pratyush@kernel.org &lt;pratyush@kernel.org&gt;; michael@walle.cc &lt;mich=
ael@walle.cc&gt;; miquel.raynal@bootlin.com &lt;miquel.raynal@bootlin.com&g=
t;; richard@nod.at &lt;richard@nod.at&gt;; vigneshr@ti.com &lt;vigneshr@ti.=
com&gt;;
 broonie@kernel.org &lt;broonie@kernel.org&gt;; Nicolas.Ferre@microchip.com=
 &lt;Nicolas.Ferre@microchip.com&gt;; alexandre.belloni@bootlin.com &lt;ale=
xandre.belloni@bootlin.com&gt;; Claudiu.Beznea@microchip.com &lt;Claudiu.Be=
znea@microchip.com&gt;; chin-ting_kuo@aspeedtech.com &lt;chin-ting_kuo@aspe=
edtech.com&gt;;
 clg@kaod.org &lt;clg@kaod.org&gt;; joel@jms.id.au &lt;joel@jms.id.au&gt;; =
andrew@aj.id.au &lt;andrew@aj.id.au&gt;; kdasu.kdev@gmail.com &lt;kdasu.kde=
v@gmail.com&gt;; han.xu@nxp.com &lt;han.xu@nxp.com&gt;; john.garry@huawei.c=
om &lt;john.garry@huawei.com&gt;; matthias.bgg@gmail.com &lt;matthias.bgg@g=
mail.com&gt;;
 avifishman70@gmail.com &lt;avifishman70@gmail.com&gt;; tmaimon77@gmail.com=
 &lt;tmaimon77@gmail.com&gt;; tali.perry1@gmail.com &lt;tali.perry1@gmail.c=
om&gt;; venture@google.com &lt;venture@google.com&gt;; yuenn@google.com &lt=
;yuenn@google.com&gt;; benjaminfair@google.com &lt;benjaminfair@google.com&=
gt;;
 haibo.chen@nxp.com &lt;haibo.chen@nxp.com&gt;; yogeshgaur.83@gmail.com &lt=
;yogeshgaur.83@gmail.com&gt;; heiko@sntech.de &lt;heiko@sntech.de&gt;; mcoq=
uelin.stm32@gmail.com &lt;mcoquelin.stm32@gmail.com&gt;; alexandre.torgue@f=
oss.st.com &lt;alexandre.torgue@foss.st.com&gt;; michal.simek@xilinx.com
 &lt;michal.simek@xilinx.com&gt;; bcm-kernel-feedback-list@broadcom.com &lt=
;bcm-kernel-feedback-list@broadcom.com&gt;; linux-mtd@lists.infradead.org &=
lt;linux-mtd@lists.infradead.org&gt;; linux-kernel@vger.kernel.org &lt;linu=
x-kernel@vger.kernel.org&gt;; linux-spi@vger.kernel.org
 &lt;linux-spi@vger.kernel.org&gt;; linux-arm-kernel@lists.infradead.org &l=
t;linux-arm-kernel@lists.infradead.org&gt;; linux-aspeed@lists.ozlabs.org &=
lt;linux-aspeed@lists.ozlabs.org&gt;; openbmc@lists.ozlabs.org &lt;openbmc@=
lists.ozlabs.org&gt;; linux-mediatek@lists.infradead.org
 &lt;linux-mediatek@lists.infradead.org&gt;; linux-rockchip@lists.infradead=
.org &lt;linux-rockchip@lists.infradead.org&gt;; linux-stm32@st-md-mailman.=
stormreply.com &lt;linux-stm32@st-md-mailman.stormreply.com&gt;<br>
<b>Subject:</b> Re: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles=
`</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 26.09.2022 01:03, Serge Semin wrote:<br>
&gt; Hello Sergiu<br>
&gt; <br>
<br>
<br>
Hello Serge,<br>
<br>
<br>
&gt; On Sun, Sep 11, 2022 at 08:45:53PM +0300, Sergiu Moga wrote:<br>
&gt;&gt; In order to properly represent the hardware functionality<br>
&gt;&gt; in the core, avoid reconverting the number of dummy cycles<br>
&gt;&gt; to the number of bytes and only work with the former.<br>
&gt;&gt; Instead, let the drivers that do need this conversion do<br>
&gt;&gt; it themselves.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Sergiu Moga &lt;sergiu.moga@microchip.com&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;&nbsp;&nbsp; drivers/mtd/spi-nor/core.c&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | 22 ++++----------<br>
&gt; <br>
&gt; [...]<br>
&gt; <br>
&gt;&gt;&nbsp;&nbsp; drivers/spi/spi-dw-core.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; | 10 +++++--<br>
&gt; <br>
&gt; [...]<br>
&gt; <br>
&gt;&gt;&nbsp;&nbsp; drivers/spi/spi-mem.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 27 +++++++++++------<br>
&gt; <br>
&gt; [...]<br>
&gt; <br>
&gt;&gt;&nbsp;&nbsp; drivers/spi/spi-mtk-nor.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; | 48 +++++++++++++++++--------------<br>
&gt; <br>
&gt; [...]<br>
&gt; <br>
&gt;&gt;&nbsp;&nbsp; drivers/spi/spi-zynq-qspi.c&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; | 15 ++++++----<br>
&gt;&gt;&nbsp;&nbsp; drivers/spi/spi-zynqmp-gqspi.c&nbsp;&nbsp;&nbsp; |&nbs=
p; 8 ++++--<br>
&gt;&gt;&nbsp;&nbsp; include/linux/spi/spi-mem.h&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; | 10 +++----<br>
&gt;&gt;&nbsp;&nbsp; 25 files changed, 234 insertions(+), 147 deletions(-)<=
br>
&gt;&gt;<br>
&gt;&gt; diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core=
.c<br>
&gt;&gt; index f2c64006f8d7..cc8ca824f912 100644<br>
&gt;&gt; --- a/drivers/mtd/spi-nor/core.c<br>
&gt;&gt; +++ b/drivers/mtd/spi-nor/core.c<br>
&gt;&gt; @@ -88,7 +88,7 @@ void spi_nor_spimem_setup_op(const struct spi_no=
r *nor,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;addr.nbytes)<=
br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; op-&gt;addr.buswidth =3D spi_nor_get_protocol_addr_=
nbits(proto);<br>
&gt;&gt;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;dummy.nbytes)<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;dummy.ncycles)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; op-&gt;dummy.buswidth =3D spi_nor_get_protocol_addr=
_nbits(proto);<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;data.nbytes)<=
br>
&gt;&gt; @@ -106,9 +106,6 @@ void spi_nor_spimem_setup_op(const struct spi_=
nor *nor,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; op-&gt;dummy.dtr =3D true;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; op-&gt;data.dtr =3D true;<br>
&gt;&gt;<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; /* 2 bytes per clock cycle in DTR mode. */<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; op-&gt;dummy.nbytes *=3D 2;<br>
&gt;&gt; -<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; ext =3D spi_nor_get_cmd_ext(nor, op);<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; op-&gt;cmd.opcode =3D (op-&gt;cmd.opcode &lt;&lt; 8=
) | ext;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; op-&gt;cmd.nbytes =3D 2;<br>
&gt;&gt; @@ -207,10 +204,7 @@ static ssize_t spi_nor_spimem_read_data(struc=
t spi_nor *nor, loff_t from,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spi_nor_spimem_setup_op(=
nor, &amp;op, nor-&gt;read_proto);<br>
&gt;&gt;<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; /* convert the dummy cycles to the numbe=
r of bytes */<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; op.dummy.nbytes =3D (nor-&gt;read_dummy =
* op.dummy.buswidth) / 8;<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (spi_nor_protocol_is_dtr(nor-&gt;read=
_proto))<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; op.dummy.nbytes *=3D 2;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; op.dummy.ncycles =3D nor-&gt;read_dummy;=
<br>
&gt; <br>
&gt; So according to this modification and what is done in the rest of the<=
br>
&gt; patch, the dummy part of the SPI-mem operations now contains the numbe=
r<br>
&gt; of cycles only. Am I right to think that it means a number of dummy<br=
>
&gt; clock oscillations? (Judging from what I've seen in the HW-manuals of<=
br>
&gt; the SPI NOR memory devices most likely I am...)<br>
<br>
<br>
<br>
Yes, you are correct.<br>
<br>
<br>
&gt; If so the &quot;ncycles&quot; field<br>
&gt; is now free from the &quot;data&quot; semantic. Then what is the meani=
ng of the<br>
&gt; &quot;buswidth and &quot;dtr&quot; fields in the spi_mem_op.dummy fiel=
d?<br>
&gt; <br>
<br>
<br>
It is still meaningful as it is used for the conversion by some drivers <br=
>
to nbytes and I do not see how it goes out of the specification in any <br>
way. So, at least for now, I do not see any reason to remove these fields.<=
br>
<br>
<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; usebouncebuf =3D spi_nor=
_spimem_bounce(nor, &amp;op);<br>
&gt;&gt;<br>
&gt;&gt; @@ -455,7 +449,7 @@ int spi_nor_read_sr(struct spi_nor *nor, u8 *s=
r)<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; if (nor-&gt;reg_proto =3D=3D SNOR_PROTO_8_8_8_DTR) =
{<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; op.=
addr.nbytes =3D nor-&gt;params-&gt;rdsr_addr_nbytes;<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; op.dummy.nbytes =3D=
 nor-&gt;params-&gt;rdsr_dummy;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; op.dummy.ncycles =
=3D nor-&gt;params-&gt;rdsr_dummy;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<=
br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; * We don't want to read only one byte in DTR mode. So,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; * read 2 and then discard the second byte.<br>
&gt;&gt; @@ -1913,10 +1907,7 @@ static int spi_nor_spimem_check_readop(stru=
ct spi_nor *nor,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spi_nor_spimem_setup_op(=
nor, &amp;op, read-&gt;proto);<br>
&gt;&gt;<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; /* convert the dummy cycles to the numbe=
r of bytes */<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; op.dummy.nbytes =3D (nor-&gt;read_dummy =
* op.dummy.buswidth) / 8;<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (spi_nor_protocol_is_dtr(nor-&gt;read=
_proto))<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; op.dummy.nbytes *=3D 2;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; op.dummy.ncycles =3D nor-&gt;read_dummy;=
<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return spi_nor_spimem_ch=
eck_op(nor, &amp;op);<br>
&gt;&gt;&nbsp;&nbsp; }<br>
&gt;&gt; @@ -3034,10 +3025,7 @@ static int spi_nor_create_read_dirmap(struc=
t spi_nor *nor)<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spi_nor_spimem_setup_op(=
nor, op, nor-&gt;read_proto);<br>
&gt;&gt;<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; /* convert the dummy cycles to the numbe=
r of bytes */<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; op-&gt;dummy.nbytes =3D (nor-&gt;read_du=
mmy * op-&gt;dummy.buswidth) / 8;<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (spi_nor_protocol_is_dtr(nor-&gt;read=
_proto))<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; op-&gt;dummy.nbytes *=3D 2;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; op-&gt;dummy.ncycles =3D nor-&gt;read_du=
mmy;<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Since spi_nor_sp=
imem_setup_op() only sets buswidth when the number<br>
&gt; <br>
&gt; [...]<br>
&gt; <br>
&gt;&gt; diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c=
<br>
&gt;&gt; index f87d97ccd2d6..0ba5c7d0e66e 100644<br>
&gt;&gt; --- a/drivers/spi/spi-dw-core.c<br>
&gt;&gt; +++ b/drivers/spi/spi-dw-core.c<br>
&gt;&gt; @@ -498,13 +498,17 @@ static bool dw_spi_supports_mem_op(struct sp=
i_mem *mem,<br>
&gt;&gt;&nbsp;&nbsp; static int dw_spi_init_mem_buf(struct dw_spi *dws, con=
st struct spi_mem_op *op)<br>
&gt;&gt;&nbsp;&nbsp; {<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int i, j, len;<=
br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; u8 *out;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; u8 *out, dummy_nbytes;<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Calculate the to=
tal length of the EEPROM command transfer and<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * either use the p=
re-allocated buffer or create a temporary one.<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; len =3D op-&gt;cmd.nbytes + op-&gt;addr.=
nbytes + op-&gt;dummy.nbytes;<br>
&gt; <br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; dummy_nbytes =3D (op-&gt;dummy.ncycles *=
 op-&gt;dummy.buswidth) / 8;<br>
&gt; <br>
&gt; 1. What about using the BITS_PER_BYTE macro (linux/bits.h) here? Since=
<br>
&gt; you are adding a similar modification to so many drivers what about us=
ing<br>
&gt; that macro there too?<br>
&gt; <br>
<br>
<br>
AFAICT BIT_PER_BYTE is meant to transparently indicate how many bits per <b=
r>
byte an arch has. Although, there is no place in the kernel from what I <br=
>
can see that has BITS_PER_BYTE with a value other than 8, you cannot <br>
deny that there exist architectures whose number of bits per byte may be <b=
r>
different from 8.<br>
<br>
Meanwhile, the JESD216E specification tells us in the Terms and <br>
definitions chapter that<br>
&quot;DWORD: Four consecutive 8-bit bytes used as the basic 32-bit building=
 <br>
block for headers and parameter tables.&quot; So it explicitly says that a =
<br>
byte has 8 bits regardless of the arch.<br>
<br>
Therefore, I do not agree with replacing 8 with the BITS_PER_BYTE macro <br=
>
as, IMO, it does not represent the same thing as the number of bits per <br=
>
byte that the terms and definitions of the JESD216E specification refer to.=
<br>
<br>
<br>
&gt; 2. buswidth is supposed to be always 1 in this driver (see the<br>
&gt; dw_spi_supports_mem_op() method). So it can be dropped from the<br>
&gt; statement above.<br>
&gt; <br>
&gt; 3. Since the ncycles now contains a number of clock cycles there is no=
<br>
&gt; point in taking the SPI bus-width into account at all. What is<br>
&gt; meaningful is how many oscillations are supposed to be placed on the<b=
r>
&gt; CLK line before the data is available. So the op-&gt;dummy.ncycles /<b=
r>
&gt; BITS_PER_BYTE statement would be more appropriate here in any case.<br=
>
&gt; <br>
<br>
<br>
I can agee with this in the case of this driver, sure.<br>
<br>
<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;dummy.dtr)<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; dummy_nbytes *=3D 2;<br>
&gt; <br>
&gt; DTR is unsupported by the controller. See, no spi_controller_mem_caps<=
br>
&gt; initialized. So this part is redundant. The same is most likely<br>
&gt; applicable for some of the DTR-related updates in this patch too<br>
&gt; since the spi_controller_mem_caps structure is initialized in a few<br=
>
&gt; drivers only.<br>
&gt; <br>
<br>
<br>
Agreed. Initially, wherever I was not sure, I just placed this if <br>
condition to avoid breaking anything in case the driver does support <br>
DTR. The same goes for your other related observations to other driver <br>
modifications, with which I agree :).<br>
<br>
<br>
&gt;&gt; +<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; len =3D op-&gt;cmd.nbytes + op-&gt;addr.=
nbytes + dummy_nbytes;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;data.dir =3D=
=3D SPI_MEM_DATA_OUT)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; len +=3D op-&gt;data.nbytes;<br>
&gt;&gt;<br>
&gt;&gt; @@ -525,7 +529,7 @@ static int dw_spi_init_mem_buf(struct dw_spi *=
dws, const struct spi_mem_op *op)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; out[i] =3D DW_SPI_GET_BYTE(op-&gt;cmd.opcode, op-&g=
t;cmd.nbytes - i - 1);<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (j =3D 0; j &lt; op-=
&gt;addr.nbytes; ++i, ++j)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; out[i] =3D DW_SPI_GET_BYTE(op-&gt;addr.val, op-&gt;=
addr.nbytes - j - 1);<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; for (j =3D 0; j &lt; op-&gt;dummy.nbytes=
; ++i, ++j)<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (j =3D 0; j &lt; dummy_nbytes; ++i, =
++j)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; out[i] =3D 0x0;<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;data.dir =3D=
=3D SPI_MEM_DATA_OUT)<br>
&gt; <br>
&gt; [...]<br>
&gt; <br>
&gt;&gt; diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c<br>
&gt;&gt; index 0c79193d9697..7b204963bb62 100644<br>
&gt;&gt; --- a/drivers/spi/spi-mem.c<br>
&gt;&gt; +++ b/drivers/spi/spi-mem.c<br>
&gt;&gt; @@ -149,7 +149,7 @@ static bool spi_mem_check_buswidth(struct spi_=
mem *mem,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
spi_check_buswidth_req(mem, op-&gt;addr.buswidth, true))<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; return false;<br>
&gt;&gt;<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;dummy.nbytes &amp;&amp;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;dummy.ncycles &amp;&amp;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
spi_check_buswidth_req(mem, op-&gt;dummy.buswidth, true))<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; return false;<br>
&gt;&gt;<br>
&gt;&gt; @@ -202,7 +202,7 @@ static int spi_mem_check_op(const struct spi_m=
em_op *op)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((op-&gt;addr.nbytes =
&amp;&amp; !op-&gt;addr.buswidth) ||<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (op-&gt;dummy.nb=
ytes &amp;&amp; !op-&gt;dummy.buswidth) ||<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (op-&gt;dummy.nc=
ycles &amp;&amp; !op-&gt;dummy.buswidth) ||<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
(op-&gt;data.nbytes &amp;&amp; !op-&gt;data.buswidth))<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&gt;&gt;<br>
&gt;&gt; @@ -315,7 +315,7 @@ int spi_mem_exec_op(struct spi_mem *mem, const=
 struct spi_mem_op *op)<br>
&gt; <br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct spi_controller *c=
tlr =3D mem-&gt;spi-&gt;controller;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct spi_transfer xfer=
s[4] =3D { };<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct spi_message msg;<=
br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; u8 *tmpbuf;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; u8 *tmpbuf, dummy_nbytes;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt; <br>
&gt; Reverse xmas tree order?<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D spi_mem_check_op=
(op);<br>
&gt;&gt; @@ -343,7 +343,11 @@ int spi_mem_exec_op(struct spi_mem *mem, cons=
t struct spi_mem_op *op)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret=
urn ret;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt;<br>
&gt; <br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; tmpbufsize =3D op-&gt;cmd.nbytes + op-&g=
t;addr.nbytes + op-&gt;dummy.nbytes;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; dummy_nbytes =3D (op-&gt;dummy.ncycles *=
 op-&gt;dummy.buswidth) / 8;<br>
&gt; <br>
&gt; So ncycles now indeed is a number of CLK line oscillations. This most<=
br>
&gt; likely will break the SPI Nand driver then, which still passes the<br>
&gt; number of bytes to the SPI_MEM_OP_DUMMY() macro.<br>
&gt; <br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;dummy.dtr)<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; dummy_nbytes *=3D 2;<br>
&gt; <br>
&gt; Generic SPI-mem ops don't take the DTR mode into account. So I don't<b=
r>
&gt; see this necessary.<br>
&gt; <br>
<br>
<br>
You may be right, but this part of the code does take into consideration <b=
r>
the number of dummy.nbytes to calculate the xfer length. Therefore, <br>
shouldn't this code block also know if the number of dummy nbytes is <br>
actually double the amount that it calculated through the conversion <br>
formula?<br>
<br>
<br>
&gt;&gt; +<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; tmpbufsize =3D op-&gt;cmd.nbytes + op-&g=
t;addr.nbytes + dummy_nbytes;<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Allocate a buffe=
r to transmit the CMD, ADDR cycles with kmalloc() so<br>
&gt;&gt; @@ -379,15 +383,15 @@ int spi_mem_exec_op(struct spi_mem *mem, con=
st struct spi_mem_op *op)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; totalxferlen +=3D op-&gt;addr.nbytes;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt;<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;dummy.nbytes) {<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; memset(tmpbuf + op-&gt;addr.nbytes + 1, 0xff, op-&gt;dummy.nbytes);=
<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (dummy_nbytes) {<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; memset(tmpbuf + op-&gt;addr.nbytes + 1, 0xff, dummy_nbytes);<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; xfers[xferpos].tx_buf =3D tmpbuf + op-&gt;addr.nbyt=
es + 1;<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; xfers[xferpos].len =3D op-&gt;dummy.nbytes;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; xfers[xferpos].len =3D dummy_nbytes;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; xfers[xferpos].tx_nbits =3D op-&gt;dummy.buswidth;<=
br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; xfers[xferpos].dummy_data =3D 1;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; spi_message_add_tail(&amp;xfers[xferpos], &amp;msg)=
;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; xferpos++;<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; totalxferlen +=3D op-&gt;dummy.nbytes;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; totalxferlen +=3D dummy_nbytes;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;data.nbytes) =
{<br>
&gt;&gt; @@ -456,12 +460,17 @@ int spi_mem_adjust_op_size(struct spi_mem *m=
em, struct spi_mem_op *op)<br>
&gt;&gt;&nbsp;&nbsp; {<br>
&gt; <br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct spi_controller *c=
tlr =3D mem-&gt;spi-&gt;controller;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t len;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; u8 dummy_nbytes;<br>
&gt; <br>
&gt; reverse xmas tree?<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ctlr-&gt;mem_ops &am=
p;&amp; ctlr-&gt;mem_ops-&gt;adjust_op_size)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; return ctlr-&gt;mem_ops-&gt;adjust_op_size(mem, op)=
;<br>
&gt;&gt;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; dummy_nbytes =3D (op-&gt;dummy.ncycles *=
 op-&gt;dummy.buswidth) / 8;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;dummy.dtr)<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; dummy_nbytes *=3D 2;<br>
&gt;&gt; +<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ctlr-&gt;mem_ops ||=
 !ctlr-&gt;mem_ops-&gt;exec_op) {<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; len =3D op-&gt;cmd.nbytes + op-&gt;addr.nbytes + op-&gt;dummy.nbyte=
s;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; len =3D op-&gt;cmd.nbytes + op-&gt;addr.nbytes + dummy_nbytes;<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; if (len &gt; spi_max_transfer_size(mem-&gt;spi))<br=
>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret=
urn -EINVAL;<br>
&gt; <br>
&gt; [...]<br>
&gt; <br>
&gt;&gt; diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c=
<br>
&gt;&gt; index d167699a1a96..f6870c6e911a 100644<br>
&gt;&gt; --- a/drivers/spi/spi-mtk-nor.c<br>
&gt;&gt; +++ b/drivers/spi/spi-mtk-nor.c<br>
&gt;&gt; @@ -171,23 +171,18 @@ static bool need_bounce(struct mtk_nor *sp, =
const struct spi_mem_op *op)<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp; static bool mtk_nor_match_read(const struct spi_mem_op=
 *op)<br>
&gt;&gt;&nbsp;&nbsp; {<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; int dummy =3D 0;<br>
&gt;&gt; -<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;dummy.nbytes)<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; dummy =3D op-&gt;dummy.nbytes * BITS_PER_BYTE / op-&gt;dummy.buswid=
th;<br>
&gt;&gt; -<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((op-&gt;data.buswidt=
h =3D=3D 2) || (op-&gt;data.buswidth =3D=3D 4)) {<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;addr.buswidth =3D=3D 1)<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return dummy =3D=3D=
 8;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return op-&gt;dummy=
.ncycles =3D=3D 8;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; else if (op-&gt;addr.buswidth =3D=3D 2)<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return dummy =3D=3D=
 4;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return op-&gt;dummy=
.ncycles =3D=3D 4;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; else if (op-&gt;addr.buswidth =3D=3D 4)<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return dummy =3D=3D=
 6;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return op-&gt;dummy=
.ncycles =3D=3D 6;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if ((op-&gt;addr.=
buswidth =3D=3D 1) &amp;&amp; (op-&gt;data.buswidth =3D=3D 1)) {<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;cmd.opcode =3D=3D 0x03)<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return dummy =3D=3D=
 0;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return op-&gt;dummy=
.ncycles =3D=3D 0;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; else if (op-&gt;cmd.opcode =3D=3D 0x0b)<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return dummy =3D=3D=
 8;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return op-&gt;dummy=
.ncycles =3D=3D 8;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return false;<br>
&gt;&gt;&nbsp;&nbsp; }<br>
&gt;&gt; @@ -195,6 +190,10 @@ static bool mtk_nor_match_read(const struct s=
pi_mem_op *op)<br>
&gt;&gt;&nbsp;&nbsp; static bool mtk_nor_match_prg(const struct spi_mem_op =
*op)<br>
&gt;&gt;&nbsp;&nbsp; {<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int tx_len, rx_len, prg_=
len, prg_left;<br>
&gt; <br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; u8 dummy_nbytes =3D (op-&gt;dummy.ncycle=
s * op-&gt;dummy.buswidth) / 8;<br>
&gt;&gt; +<br>
&gt; <br>
&gt; IMO it's better to move the initialization statement to a separate<br>
&gt; line here.<br>
&gt; <br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;dummy.dtr)<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; dummy_nbytes *=3D 2;<br>
&gt; <br>
&gt; Does the MTK SPI driver support DTR? AFAICS it doesn't.<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // prg mode is spi-only.=
<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((op-&gt;cmd.buswidth=
 &gt; 1) || (op-&gt;addr.buswidth &gt; 1) ||<br>
&gt;&gt; @@ -205,7 +204,7 @@ static bool mtk_nor_match_prg(const struct spi=
_mem_op *op)<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;data.dir =3D=
=3D SPI_MEM_DATA_OUT) {<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; // count dummy bytes only if we need to write data =
after it<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; tx_len +=3D op-&gt;dummy.nbytes;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; tx_len +=3D dummy_nbytes;<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; // leave at least one byte for data<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; if (tx_len &gt; MTK_NOR_REG_PRGDATA_MAX)<br>
&gt;&gt; @@ -221,7 +220,7 @@ static bool mtk_nor_match_prg(const struct spi=
_mem_op *op)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret=
urn false;<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; rx_len =3D op-&gt;data.nbytes;<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; prg_left =3D MTK_NOR_PRG_CNT_MAX / 8 - tx_len - op-&gt;dummy.nbytes=
;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; prg_left =3D MTK_NOR_PRG_CNT_MAX / 8 - tx_len - dummy_nbytes;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; if (prg_left &gt; MTK_NOR_REG_SHIFT_MAX + 1)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; prg=
_left =3D MTK_NOR_REG_SHIFT_MAX + 1;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; if (rx_len &gt; prg_left) {<br>
&gt;&gt; @@ -230,11 +229,11 @@ static bool mtk_nor_match_prg(const struct s=
pi_mem_op *op)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rx_=
len =3D prg_left;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt;<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; prg_len =3D tx_len + op-&gt;dummy.nbytes + rx_len;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; prg_len =3D tx_len + dummy_nbytes + rx_len;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; if (prg_len &gt; MTK_NOR_PRG_CNT_MAX / 8)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret=
urn false;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; prg_len =3D tx_len + op-&gt;dummy.nbytes;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; prg_len =3D tx_len + dummy_nbytes;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; if (prg_len &gt; MTK_NOR_PRG_CNT_MAX / 8)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret=
urn false;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt; @@ -244,15 +243,19 @@ static bool mtk_nor_match_prg(const struct s=
pi_mem_op *op)<br>
&gt;&gt;&nbsp;&nbsp; static void mtk_nor_adj_prg_size(struct spi_mem_op *op=
)<br>
&gt;&gt;&nbsp;&nbsp; {<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int tx_len, tx_left, prg=
_left;<br>
&gt; <br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; u8 dummy_nbytes =3D (op-&gt;dummy.ncycle=
s * op-&gt;dummy.buswidth) / 8;<br>
&gt;&gt; +<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;dummy.dtr)<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; dummy_nbytes *=3D 2;<br>
&gt; <br>
&gt; ditto<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tx_len =3D op-&gt;cmd.nb=
ytes + op-&gt;addr.nbytes;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;data.dir =3D=
=3D SPI_MEM_DATA_OUT) {<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; tx_len +=3D op-&gt;dummy.nbytes;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; tx_len +=3D dummy_nbytes;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; tx_left =3D MTK_NOR_REG_PRGDATA_MAX + 1 - tx_len;<b=
r>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;data.nbytes &gt; tx_left)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; op-=
&gt;data.nbytes =3D tx_left;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (op-&gt;data.d=
ir =3D=3D SPI_MEM_DATA_IN) {<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; prg_left =3D MTK_NOR_PRG_CNT_MAX / 8 - tx_len - op-&gt;dummy.nbytes=
;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; prg_left =3D MTK_NOR_PRG_CNT_MAX / 8 - tx_len - dummy_nbytes;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; if (prg_left &gt; MTK_NOR_REG_SHIFT_MAX + 1)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; prg=
_left =3D MTK_NOR_REG_SHIFT_MAX + 1;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;data.nbytes &gt; prg_left)<br>
&gt;&gt; @@ -312,7 +315,7 @@ static bool mtk_nor_supports_op(struct spi_mem=
 *mem,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bre=
ak;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; case SPI_MEM_DATA_OUT:<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if =
((op-&gt;addr.buswidth =3D=3D 1) &amp;&amp;<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; (op-&gt;dummy.nbytes =3D=3D 0) &amp;&amp;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; (op-&gt;dummy.ncycles =3D=3D 0) &amp;&amp;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; (op-&gt;data.buswidth =3D=3D 1))<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return true;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bre=
ak;<br>
&gt;&gt; @@ -515,17 +518,20 @@ static int mtk_nor_spi_mem_prg(struct mtk_no=
r *sp, const struct spi_mem_op *op)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int tx_len, prg_len;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i, ret;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void __iomem *reg;<br>
&gt; <br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; u8 bufbyte;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; u8 bufbyte, dummy_nbytes =3D (op-&gt;dum=
my.ncycles * op-&gt;dummy.buswidth) / 8;<br>
&gt;&gt; +<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;dummy.dtr)<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; dummy_nbytes *=3D 2;<br>
&gt; <br>
&gt; ditto<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tx_len =3D op-&gt;cmd.nb=
ytes + op-&gt;addr.nbytes;<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // count dummy bytes onl=
y if we need to write data after it<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;data.dir =3D=
=3D SPI_MEM_DATA_OUT)<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; tx_len +=3D op-&gt;dummy.nbytes + op-&gt;data.nbytes;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; tx_len +=3D dummy_nbytes + op-&gt;data.nbytes;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (op-&gt;data.dir=
 =3D=3D SPI_MEM_DATA_IN)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; rx_len =3D op-&gt;data.nbytes;<br>
&gt;&gt;<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; prg_len =3D op-&gt;cmd.nbytes + op-&gt;a=
ddr.nbytes + op-&gt;dummy.nbytes +<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; prg_len =3D op-&gt;cmd.nbytes + op-&gt;a=
ddr.nbytes + dummy_nbytes +<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; op-&gt;data.nbytes;<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // an invalid op may rea=
ch here if the caller calls exec_op without<br>
&gt;&gt; @@ -550,7 +556,7 @@ static int mtk_nor_spi_mem_prg(struct mtk_nor =
*sp, const struct spi_mem_op *op)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;data.dir =3D=
=3D SPI_MEM_DATA_OUT) {<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; for (i =3D 0; i &lt; op-&gt;dummy.nbytes; i++, reg_offset--) {<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; for (i =3D 0; i &lt; dummy_nbytes; i++, reg_offset--) {<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg=
 =3D sp-&gt;base + MTK_NOR_REG_PRGDATA(reg_offset);<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wri=
teb(0, reg);<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; <br>
&gt; [...]<br>
&gt; <br>
&gt;&gt; diff --git a/drivers/spi/spi-zynq-qspi.c b/drivers/spi/spi-zynq-qs=
pi.c<br>
&gt;&gt; index 78f31b61a2aa..84b7db85548c 100644<br>
&gt;&gt; --- a/drivers/spi/spi-zynq-qspi.c<br>
&gt;&gt; +++ b/drivers/spi/spi-zynq-qspi.c<br>
&gt;&gt; @@ -527,7 +527,10 @@ static int zynq_qspi_exec_mem_op(struct spi_m=
em *mem,<br>
&gt;&gt;&nbsp;&nbsp; {<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct zynq_qspi *xqspi =
=3D spi_controller_get_devdata(mem-&gt;spi-&gt;master);<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int err =3D 0, i;<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; u8 *tmpbuf;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; u8 *tmpbuf, dummy_nbytes =3D (op-&gt;dum=
my.ncycles * op-&gt;dummy.buswidth) / 8;<br>
&gt; <br>
&gt; Separate line?<br>
&gt; <br>
&gt;&gt; +<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;dummy.dtr)<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; dummy_nbytes *=3D 2;<br>
&gt; <br>
&gt; Is DTR supported by the driver?<br>
&gt; <br>
<br>
<br>
Not from what I can see, but I was not 100% sure so I placed this if <br>
statement here just in case.<br>
<br>
<br>
<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_dbg(xqspi-&gt;dev, &=
quot;cmd:%#x mode:%d.%d.%d.%d\n&quot;,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; op-&gt;cmd.opcode, op-&gt;cmd.buswidth, op-&gt;addr=
.buswidth,<br>
&gt;&gt; @@ -568,17 +571,17 @@ static int zynq_qspi_exec_mem_op(struct spi_=
mem *mem,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err=
 =3D -ETIMEDOUT;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt;<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;dummy.nbytes) {<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; tmpbuf =3D kzalloc(op-&gt;dummy.nbytes, GFP_KERNEL);<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (dummy_nbytes) {<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; tmpbuf =3D kzalloc(dummy_nbytes, GFP_KERNEL);<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; if (!tmpbuf)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret=
urn -ENOMEM;<br>
&gt;&gt;<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; memset(tmpbuf, 0xff, op-&gt;dummy.nbytes);<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; memset(tmpbuf, 0xff, dummy_nbytes);<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; reinit_completion(&amp;xqspi-&gt;data_completion);<=
br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; xqspi-&gt;txbuf =3D tmpbuf;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; xqspi-&gt;rxbuf =3D NULL;<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; xqspi-&gt;tx_bytes =3D op-&gt;dummy.nbytes;<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; xqspi-&gt;rx_bytes =3D op-&gt;dummy.nbytes;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; xqspi-&gt;tx_bytes =3D dummy_nbytes;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; xqspi-&gt;rx_bytes =3D dummy_nbytes;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; zynq_qspi_write_op(xqspi, ZYNQ_QSPI_FIFO_DEPTH, tru=
e);<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; zynq_qspi_write(xqspi, ZYNQ_QSPI_IEN_OFFSET,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ZYNQ_QSPI_IXR_RXTX_MASK);<br>
&gt;&gt; diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynq=
mp-gqspi.c<br>
&gt;&gt; index c760aac070e5..b41abadef9a6 100644<br>
&gt;&gt; --- a/drivers/spi/spi-zynqmp-gqspi.c<br>
&gt;&gt; +++ b/drivers/spi/spi-zynqmp-gqspi.c<br>
&gt;&gt; @@ -948,6 +948,10 @@ static int zynqmp_qspi_exec_op(struct spi_mem=
 *mem,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 genfifoentry =3D 0;<=
br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u16 opcode =3D op-&gt;cm=
d.opcode;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u64 opaddr;<br>
&gt; <br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; u8 dummy_nbytes =3D (op-&gt;dummy.ncycle=
s * op-&gt;dummy.buswidth) / 8;<br>
&gt;&gt; +<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;dummy.dtr)<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; dummy_nbytes *=3D 2;<br>
&gt; <br>
&gt; ditto<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_dbg(xqspi-&gt;dev, &=
quot;cmd:%#x mode:%d.%d.%d.%d\n&quot;,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; op-&gt;cmd.opcode, op-&gt;cmd.buswidth, op-&gt;addr=
.buswidth,<br>
&gt;&gt; @@ -1006,14 +1010,14 @@ static int zynqmp_qspi_exec_op(struct spi_=
mem *mem,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt;<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;dummy.nbytes) {<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (dummy_nbytes) {<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; xqspi-&gt;txbuf =3D NULL;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; xqspi-&gt;rxbuf =3D NULL;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * xqspi-&gt;bytes_to_transfer here represents=
 the dummy circles<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * which need to be sent.<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; xqspi-&gt;bytes_to_transfer =3D op-&gt;dummy.nbytes * 8 / op-&gt;du=
mmy.buswidth;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; xqspi-&gt;bytes_to_transfer =3D dummy_nbytes;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; xqspi-&gt;bytes_to_receive =3D 0;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Using op-&gt;data.buswidth instead of op-&g=
t;dummy.buswidth here because<br>
&gt;&gt; diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-m=
em.h<br>
&gt;&gt; index 2ba044d0d5e5..5fd45800af03 100644<br>
&gt;&gt; --- a/include/linux/spi/spi-mem.h<br>
&gt;&gt; +++ b/include/linux/spi/spi-mem.h<br>
&gt;&gt; @@ -29,9 +29,9 @@<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp; #define SPI_MEM_OP_NO_ADDR&nbsp;&nbsp; { }<br>
&gt;&gt;<br>
&gt; <br>
&gt;&gt; -#define SPI_MEM_OP_DUMMY(__nbytes, __buswidth)&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt;&gt; +#define SPI_MEM_OP_DUMMY(__ncycles, __buswidth)&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; \<br>
&gt; <br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; .nbytes =3D __nbytes,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; .ncycles =3D __ncycles,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; .buswidth =3D __buswidth,&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; <br>
&gt; Please make sure this update and the drivers/spi/spi-mem.c driver<br>
&gt; alterations are coherent with the SPI Nand driver. See the macro usage=
s:<br>
&gt; include/linux/mtd/spinand.h: SPINAND_PAGE_READ_FROM_*().<br>
&gt; <br>
&gt; -Sergey<br>
&gt;<br>
<br>
<br>
Yes, indeed, I should have paid more attention here. As I have <br>
previously said,&nbsp; I simply replaced dummy.nbytes with the code sequenc=
es <br>
you now see. I should have checked for SPI_MEM_OP_DUMMY usages as well <br>
since I changed its definition. Thank you! :)<br>
<br>
<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt;<br>
&gt;&gt; @@ -83,8 +83,8 @@ enum spi_mem_data_dir {<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; Note that only @addr.nbytes are taken into account in this<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; address value, so users should make sure the value fits in the<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; assigned number of bytes.<br>
&gt;&gt; - * @dummy.nbytes: number of dummy bytes to send after an opcode o=
r address. Can<br>
&gt;&gt; - *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; be zero if the operation does not require dummy bytes<br>
&gt;&gt; + * @dummy.ncycles: number of dummy cycles after an opcode or addr=
ess. Can<br>
&gt;&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; be zero if the operation does not require dummy cycles<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; * @dummy.buswidth: number of IO lanes used to tr=
ansmit the dummy bytes<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; * @dummy.dtr: whether the dummy bytes should be =
sent in DTR mode or not<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; * @data.buswidth: number of IO lanes used to sen=
d/receive the data<br>
&gt;&gt; @@ -112,7 +112,7 @@ struct spi_mem_op {<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } addr;<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct {<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; u8 nbytes;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; u8 ncycles;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; u8 buswidth;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; u8 dtr : 1;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } dummy;<br>
&gt;&gt; --<br>
&gt;&gt; 2.34.1<br>
&gt;&gt;<br>
<br>
<br>
Regards,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sergiu<br>
______________________________________________________<br>
Linux MTD discussion mailing list<br>
<a href=3D"http://lists.infradead.org/mailman/listinfo/linux-mtd/">http://l=
ists.infradead.org/mailman/listinfo/linux-mtd/</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_MN2PR17MB337585F017ED5C5B033EDE54B8529MN2PR17MB3375namp_--
