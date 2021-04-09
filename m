Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBA935940F
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 06:38:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGlkZ0G0rz3c2j
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 14:38:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=MZMBO9+g;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.148.236;
 helo=mx0a-00268f01.pphosted.com;
 envelope-from=prvs=5733813a0f=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=equinixinc.onmicrosoft.com
 header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-equinixinc-onmicrosoft-com header.b=MZMBO9+g; 
 dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGljx5GD2z3bwg;
 Fri,  9 Apr 2021 14:37:56 +1000 (AEST)
Received: from pps.filterd (m0165118.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1394TmuC000555; Fri, 9 Apr 2021 04:37:20 GMT
Received: from nam04-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam04lp2054.outbound.protection.outlook.com [104.47.44.54])
 by mx0a-00268f01.pphosted.com with ESMTP id 37t1u22wvr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 04:37:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aTRlOMExV4Lk/cosIzTXIoEG+C1TTFXGV30llukd7LVdBqzYTukiN/O6a9GoYlU7XXyc3H1C5a5A/y0QY+1gWRB2rqPrsPMhLbaR47bIVYhBBJuoAkxEqBS4HoLVBBpRKhz8Z1ch9GKfiLoieQGz6RdlLycXfVhJA2aMiS9PP67tgQgra2fqjZ7Vi2umzbTXEm8k7Ne87nnS3efXDPhd00tAZ3afNbvsx0+0gLxFmuyh452php9OH5xV2/CZYFxhuVQHk3Y3MVsNljskCcDJ67tmT58xJW8hqo4aA5pbeguj0siEes9W+UqagntvhasPc+BhjKUiF++Y0QoHGa3uOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0XqLQ5x6fLV/7awTCA33b+0ukyXDRSLUB8A1UWKTRA=;
 b=JmYne0bl+MUnM9+R6iNBG4Gf4V4XayqJDZey76ZoNPNziJDRxjziT5pUg87vFT+qB8w1LNnYpv8FFD0BUfGJGWZXgjZ+Lu+iRPAZ3WRWb3RjPLue99/JW2i8UL4ajBEpjh/cvQYHTxnpVhVRIFiAz/55/zgovPheO8EGbPE3LXWyHZlSL1sUBvQgpfZL+wMVAzPo673NGlW+8RBHpVfCGover/ttNyE5y8BuocPCi8bKnUCh+0GQ33JToQ99oNQylwnFOhCNJ/94Q3RwbvrE7DCGY6WSR6bUP5/ty9tDyVNGdKhepei9boMV0YEjq8odoLD3UjASxAaIAzBe6QlxYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0XqLQ5x6fLV/7awTCA33b+0ukyXDRSLUB8A1UWKTRA=;
 b=MZMBO9+gTW+/y/efI2pwG8Wl8KNj7FiNVkhcPlfAaS9VMyakqAx7W1+5zWZst97ouqlL1Vpm7AnegSwkuzJRIb1BZFzH8Z9DQ9u9aJMfTdBjmV3jn2c4yCHODMKe0Q9Pne50x3HvZv5WSBBYG2lauR6oGpgjzjrVR5ynCjvNR48=
Received: from DM5PR04MB0762.namprd04.prod.outlook.com (2603:10b6:3:f3::13) by
 DM6PR04MB6938.namprd04.prod.outlook.com (2603:10b6:5:248::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17; Fri, 9 Apr 2021 04:37:18 +0000
Received: from DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad]) by DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad%5]) with mapi id 15.20.4020.017; Fri, 9 Apr 2021
 04:37:18 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 14/21] ipmi: kcs_bmc: Allow clients to control KCS IRQ
 state
Thread-Topic: [PATCH v2 14/21] ipmi: kcs_bmc: Allow clients to control KCS IRQ
 state
Thread-Index: AQHXLPoFr3oBt6vrQ0S/zAqvLfUSlw==
Date: Fri, 9 Apr 2021 04:37:18 +0000
Message-ID: <YG/Z/eZCES65fXQi@packtop>
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-14-andrew@aj.id.au>
In-Reply-To: <20210319062752.145730-14-andrew@aj.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=equinix.com;
x-originating-ip: [24.181.166.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b757aee-50ec-4e64-bea2-08d8fb112886
x-ms-traffictypediagnostic: DM6PR04MB6938:
x-microsoft-antispam-prvs: <DM6PR04MB6938E48009E8DC5795C94EF9C3739@DM6PR04MB6938.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:288;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eCP/oNtQ4uUx0x5mZPSGE4dAMIOrVUdiJoB7xJl6C93e0Ii/n2bvAw16fvSgiJIvlWC1+hlEuP4S6o0s3CClYkm5XX+jlMGlmJGMzIoLTthq9VA9IA+Jx10HUR7gwM7Fb+qX6RIgc95G+fojUAXewS7Olp4NhZsi/sgkyCUaUKVSMQenMro+tHtvDDvWIoWVvLfVf35CwBGZ25a/5dJRT8vXwMx9KSq5AMoYia9yFooNSsuIctrk2PboC7+u9hihjm/JSpHZT3jyYXRHkP3KPh5ND9v4Ia8tn5ZlNIOkYEIlnusyvXI53glbXZz7YgBAYnxoq2icD+2FBMEO/Ba5dBeTEIyNyDF2cxKDY3kzWJl37M9SX4DxiInkQPaUnORxJrhsRadnaLINKEPRKn2gcijGJZ/WoI1UQgRMYEfLRf6sLKuWXI3SQwNhYxHP+D4eVaWpRRt5VnYb6s8DQOXkP81LRcdgZ15amkVvfOHFS7r7vhjQFTZeuR8zBgy/Osbxhyil3hewYDUbOmqd9NuIbgdG8eUfvL1TR8jIdiMTnEvqg9XKLiXNn9ZA4npbkTaQpd/s0nKDERKQNAXCqIBBTl/xAk+2o/SzubYcMC2ZyuVoWl/qSQvje6vc1ae64jIwF+BcnrkJClrTlXthwg7C0X6IrRsNanYpwvLO0YI/d+A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0762.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(376002)(396003)(39860400002)(136003)(346002)(366004)(478600001)(8936002)(5660300002)(71200400001)(6506007)(8676002)(6916009)(6486002)(9686003)(54906003)(316002)(38100700001)(83380400001)(4326008)(33716001)(7416002)(76116006)(30864003)(91956017)(26005)(2906002)(86362001)(186003)(66556008)(64756008)(66476007)(66946007)(6512007)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?xUf0I2cvP4r7we6UVAOYDH4m15eOQiiIxo5moj1sxPUpGCKDbpqfxFwy3beC?=
 =?us-ascii?Q?HwQB9J5KZItvJ2ad8kZdxP//OYj8kILrcFMLPIge1394+jkA1FcUU2dO9Rcp?=
 =?us-ascii?Q?hm962kB0QiFWve1V5t9W2GbrIJTkzIElgOSseOx9slQYFWauFOIE7ykffhNg?=
 =?us-ascii?Q?FznATbft1gxQv62NO6A4VohM2+Lql5R6kVmiKfG7xd4WTgZt94yyf8r+kgEO?=
 =?us-ascii?Q?k3gCi9zduok1SDT0OpD43sza2Rfw18QMpz058/nYLz70mHigyHOeq0DG1nZq?=
 =?us-ascii?Q?4Rqhj4MabRE0AqBC29wmPg3/8DpckT18UnX6u1+D7R429MCd8kWFYlLlmmjG?=
 =?us-ascii?Q?BPD+v4qkR+qqH2CLIsc0PXsGI7gEkTymwoqfy2kQSkbBxWvOga3YU6mFe/pC?=
 =?us-ascii?Q?CbAKIGZZbdFYAuK6gJvfrJCrcjEK7Jr3ok29o3hZB1OxKjZ3fIv/dtw3b7XJ?=
 =?us-ascii?Q?Zwus8r771y/oJ7HIV/tfUCK+QCtTdmcdpZ14jTsQB0sUxX7yW2vjLL+r3t7y?=
 =?us-ascii?Q?YRRIpRSya6+RXgg3F7SRjY1NGV5FJ7hm5GLoJXtFONCq7b5k7RpuvNpTXzwc?=
 =?us-ascii?Q?ZUEY1JyD3rvA5iATPXdDpdcF8TAYgo0cf5w32o41J/pHSc7NSXQf6771UIdr?=
 =?us-ascii?Q?PPjqM9MNjCQltURgqBL4yJpL0w3N2mbKQD+zbUM7VG/czRv7WjqxtLb8GIgr?=
 =?us-ascii?Q?vS+eE0Q644WdhYRZikAidEaxJgZb+IZ6exXJinAxhx6oVP4vwkxGhKoVbe70?=
 =?us-ascii?Q?wJ/nLV5iK0yZyNONMvlJWKCb8RjVSw/TdspkW+a4rqHo/hey7VlRIaDqJzdl?=
 =?us-ascii?Q?RVdHXqcTPPzYaa+u/i5ry1BGPl1sZOS6KAnNUlRJKcorMfKEEtCXeEuKS91m?=
 =?us-ascii?Q?RgAG77ys/3/QL0Jkrggz0QtojMXA9ofI+h7pXa37Yb17P+LNpv4OGQI4uvX6?=
 =?us-ascii?Q?RGItzYs3NHCE+plxFJRaakUL/S3M+O1tbW5d01w/8MzOac7gNjQUpvc0OFaG?=
 =?us-ascii?Q?eOFPuu8HPvqEqjrRxePTBuSVAduyrrNkekQeUZb7aoj++op+gkIEvYLa94e0?=
 =?us-ascii?Q?TfhkHng1t41xy+YHRBVZzSPlsZLUDMs2t4Ald4ffrpgwhhOCYZ3AiIstA4/m?=
 =?us-ascii?Q?Chi7FP0ALsqp7Q9W1qJ44GakKcriER9rtQP7zzBpFmWKC6KGY+/rt32mqUY1?=
 =?us-ascii?Q?OOTS4qsMw7gw8SKS3UFNe6QV/ziJZAJ42jvR84ucu6yLvmAFItqC0pVz3XDq?=
 =?us-ascii?Q?H25/6dyMFfwEYjkUQ3pPqsy24ws7b89rv6xiwFQ4UXJeULgP3ulaP5K0ZmN7?=
 =?us-ascii?Q?6sV7Q1vdU0qPbYILwlto1ZmDda1zy47n53tf3fRak1J1zQ=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DC27F13AC486834F8378FC6733084C93@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0762.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b757aee-50ec-4e64-bea2-08d8fb112886
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 04:37:18.4630 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3dDFZAcFtkIc94Su95iLr0RD9kXNiG/U40iB39EOH5yeq+KtejsKen/spdq0Q+1WgqbWyuXU0F12M5BqcGHWgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6938
X-Proofpoint-ORIG-GUID: jPSPUD7vsLKeezrINWIFMTyYfmyFcMnu
X-Proofpoint-GUID: jPSPUD7vsLKeezrINWIFMTyYfmyFcMnu
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_03:2021-04-08,
 2021-04-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104090031
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "chiawei_wang@aspeedtech.com" <chiawei_wang@aspeedtech.com>,
 "ryan_chen@aspeedtech.com" <ryan_chen@aspeedtech.com>,
 "tmaimon77@gmail.com" <tmaimon77@gmail.com>,
 "minyard@acm.org" <minyard@acm.org>,
 "avifishman70@gmail.com" <avifishman70@gmail.com>,
 "venture@google.com" <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tali.perry1@gmail.com" <tali.perry1@gmail.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "benjaminfair@google.com" <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Mar 19, 2021 at 01:27:45AM CDT, Andrew Jeffery wrote:
>Add a mechanism for controlling whether the client associated with a
>KCS device will receive Input Buffer Full (IBF) and Output Buffer Empty
>(OBE) events. This enables an abstract implementation of poll() for KCS
>devices.
>
>A wart in the implementation is that the ASPEED KCS devices don't
>support an OBE interrupt for the BMC. Instead we pretend it has one by
>polling the status register waiting for the Output Buffer Full (OBF) bit
>to clear, and generating an event when OBE is observed.
>
>Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>---
> drivers/char/ipmi/kcs_bmc.c         |   6 ++
> drivers/char/ipmi/kcs_bmc.h         |   3 +
> drivers/char/ipmi/kcs_bmc_aspeed.c  | 150 ++++++++++++++++++----------
> drivers/char/ipmi/kcs_bmc_client.h  |   2 +
> drivers/char/ipmi/kcs_bmc_device.h  |   1 +
> drivers/char/ipmi/kcs_bmc_npcm7xx.c |  25 ++++-
> 6 files changed, 130 insertions(+), 57 deletions(-)
>
>diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
>index 694db6ee2a92..05bbb72418b2 100644
>--- a/drivers/char/ipmi/kcs_bmc.c
>+++ b/drivers/char/ipmi/kcs_bmc.c
>@@ -184,6 +184,12 @@ int kcs_bmc_unregister_cdev(struct kcs_bmc_cdev *cdev=
)
> }
> EXPORT_SYMBOL(kcs_bmc_unregister_cdev);
>
>+void kcs_bmc_update_event_mask(struct kcs_bmc_device *kcs_bmc, u8 mask, u=
8 events)
>+{
>+	kcs_bmc->ops->irq_mask_update(kcs_bmc, mask, events);
>+}
>+EXPORT_SYMBOL(kcs_bmc_update_event_mask);
>+
> MODULE_LICENSE("GPL v2");
> MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
> MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>");
>diff --git a/drivers/char/ipmi/kcs_bmc.h b/drivers/char/ipmi/kcs_bmc.h
>index 5deb9a0b8e60..11fff935218c 100644
>--- a/drivers/char/ipmi/kcs_bmc.h
>+++ b/drivers/char/ipmi/kcs_bmc.h
>@@ -11,6 +11,9 @@
> #define KCS_BMC_EVENT_NONE	0
> #define KCS_BMC_EVENT_HANDLED	1
>
>+#define KCS_BMC_EVENT_TYPE_OBE	BIT(0)
>+#define KCS_BMC_EVENT_TYPE_IBF	BIT(1)
>+
> #define KCS_BMC_STR_OBF		BIT(0)
> #define KCS_BMC_STR_IBF		BIT(1)
> #define KCS_BMC_STR_CMD_DAT	BIT(3)
>diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bm=
c_aspeed.c
>index 6f26e7366c0b..5f26471c038c 100644
>--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
>+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
>@@ -60,10 +60,18 @@
> #define LPC_ODR4             0x118
> #define LPC_STR4             0x11C
>
>+#define OBE_POLL_PERIOD	     (HZ / 2)
>+
> struct aspeed_kcs_bmc {
> 	struct kcs_bmc_device kcs_bmc;
>
> 	struct regmap *map;
>+
>+	struct {
>+		spinlock_t lock;
>+		bool remove;
>+		struct timer_list timer;
>+	} obe;
> };
>
> struct aspeed_kcs_of_ops {
>@@ -159,68 +167,89 @@ static void aspeed_kcs_enable_channel(struct kcs_bmc=
_device *kcs_bmc, bool enabl
>
> 	switch (kcs_bmc->channel) {
> 	case 1:
>-		if (enable) {
>-			regmap_update_bits(priv->map, LPC_HICR2,
>-					LPC_HICR2_IBFIF1, LPC_HICR2_IBFIF1);
>-			regmap_update_bits(priv->map, LPC_HICR0,
>-					LPC_HICR0_LPC1E, LPC_HICR0_LPC1E);
>-		} else {
>-			regmap_update_bits(priv->map, LPC_HICR0,
>-					LPC_HICR0_LPC1E, 0);
>-			regmap_update_bits(priv->map, LPC_HICR2,
>-					LPC_HICR2_IBFIF1, 0);
>-		}
>-		break;
>-
>+		regmap_update_bits(priv->map, LPC_HICR0, LPC_HICR0_LPC1E, enable * LPC_=
HICR0_LPC1E);
>+		return;
> 	case 2:
>-		if (enable) {
>-			regmap_update_bits(priv->map, LPC_HICR2,
>-					LPC_HICR2_IBFIF2, LPC_HICR2_IBFIF2);
>-			regmap_update_bits(priv->map, LPC_HICR0,
>-					LPC_HICR0_LPC2E, LPC_HICR0_LPC2E);
>-		} else {
>-			regmap_update_bits(priv->map, LPC_HICR0,
>-					LPC_HICR0_LPC2E, 0);
>-			regmap_update_bits(priv->map, LPC_HICR2,
>-					LPC_HICR2_IBFIF2, 0);
>-		}
>-		break;
>-
>+		regmap_update_bits(priv->map, LPC_HICR0, LPC_HICR0_LPC2E, enable * LPC_=
HICR0_LPC2E);
>+		return;
> 	case 3:
>-		if (enable) {
>-			regmap_update_bits(priv->map, LPC_HICR2,
>-					LPC_HICR2_IBFIF3, LPC_HICR2_IBFIF3);
>-			regmap_update_bits(priv->map, LPC_HICR0,
>-					LPC_HICR0_LPC3E, LPC_HICR0_LPC3E);
>-			regmap_update_bits(priv->map, LPC_HICR4,
>-					LPC_HICR4_KCSENBL, LPC_HICR4_KCSENBL);
>-		} else {
>-			regmap_update_bits(priv->map, LPC_HICR0,
>-					LPC_HICR0_LPC3E, 0);
>-			regmap_update_bits(priv->map, LPC_HICR4,
>-					LPC_HICR4_KCSENBL, 0);
>-			regmap_update_bits(priv->map, LPC_HICR2,
>-					LPC_HICR2_IBFIF3, 0);
>-		}
>-		break;
>-
>+		regmap_update_bits(priv->map, LPC_HICR0, LPC_HICR0_LPC3E, enable * LPC_=
HICR0_LPC3E);
>+		regmap_update_bits(priv->map, LPC_HICR4,
>+				   LPC_HICR4_KCSENBL, enable * LPC_HICR4_KCSENBL);
>+		return;
> 	case 4:
>-		if (enable)
>-			regmap_update_bits(priv->map, LPC_HICRB,
>-					LPC_HICRB_IBFIF4 | LPC_HICRB_LPC4E,
>-					LPC_HICRB_IBFIF4 | LPC_HICRB_LPC4E);
>+		regmap_update_bits(priv->map, LPC_HICRB, LPC_HICRB_LPC4E, enable * LPC_=
HICRB_LPC4E);
>+		return;
>+	default:
>+		pr_warn("%s: Unsupported channel: %d", __func__, kcs_bmc->channel);
>+		return;
>+	}
>+}
>+
>+static void aspeed_kcs_check_obe(struct timer_list *timer)
>+{
>+	struct aspeed_kcs_bmc *priv =3D container_of(timer, struct aspeed_kcs_bm=
c, obe.timer);
>+	unsigned long flags;
>+	u8 str;
>+
>+	spin_lock_irqsave(&priv->obe.lock, flags);
>+	if (priv->obe.remove) {
>+		spin_unlock_irqrestore(&priv->obe.lock, flags);
>+		return;
>+	}
>+
>+	str =3D aspeed_kcs_inb(&priv->kcs_bmc, priv->kcs_bmc.ioreg.str);
>+	if (str & KCS_BMC_STR_OBF) {
>+		mod_timer(timer, jiffies + OBE_POLL_PERIOD);
>+		spin_unlock_irqrestore(&priv->obe.lock, flags);
>+		return;
>+	}
>+	spin_unlock_irqrestore(&priv->obe.lock, flags);
>+
>+	kcs_bmc_handle_event(&priv->kcs_bmc);
>+}
>+
>+static void aspeed_kcs_irq_mask_update(struct kcs_bmc_device *kcs_bmc, u8=
 mask, u8 state)
>+{
>+	struct aspeed_kcs_bmc *priv =3D to_aspeed_kcs_bmc(kcs_bmc);
>+
>+	/* We don't have an OBE IRQ, emulate it */
>+	if (KCS_BMC_EVENT_TYPE_OBE & mask) {
>+		if (KCS_BMC_EVENT_TYPE_OBE & state)
>+			mod_timer(&priv->obe.timer, jiffies + OBE_POLL_PERIOD);
> 		else
>-			regmap_update_bits(priv->map, LPC_HICRB,
>-					LPC_HICRB_IBFIF4 | LPC_HICRB_LPC4E,
>-					0);
>-		break;
>+			del_timer(&priv->obe.timer);
>+	}
>
>-	default:
>-		break;
>+	if (KCS_BMC_EVENT_TYPE_IBF & mask) {
>+		const bool enable =3D !!(KCS_BMC_EVENT_TYPE_IBF & state);

Totally superficial nitpick: the operand ordering for the bitmask tests
in this function seem a bit inconsistent with what I think is the usual
style of 'variable & BITMASK_MACRO' (reminiscent of "yoda
conditionals").

>+
>+		switch (kcs_bmc->channel) {
>+		case 1:
>+			regmap_update_bits(priv->map, LPC_HICR2, LPC_HICR2_IBFIF1,
>+					   enable * LPC_HICR2_IBFIF1);
>+			return;
>+		case 2:
>+			regmap_update_bits(priv->map, LPC_HICR2, LPC_HICR2_IBFIF2,
>+					   enable * LPC_HICR2_IBFIF2);
>+			return;
>+		case 3:
>+			regmap_update_bits(priv->map, LPC_HICR2, LPC_HICR2_IBFIF3,
>+					   enable * LPC_HICR2_IBFIF3);
>+			return;
>+		case 4:
>+			regmap_update_bits(priv->map, LPC_HICRB, LPC_HICRB_IBFIF4,
>+					   enable * LPC_HICRB_IBFIF4);
>+			return;
>+		default:
>+			pr_warn("%s: Unsupported channel: %d", __func__, kcs_bmc->channel);
>+			return;
>+		}
> 	}
> }
>
> static const struct kcs_bmc_device_ops aspeed_kcs_ops =3D {
>+	.irq_mask_update =3D aspeed_kcs_irq_mask_update,
> 	.io_inputb =3D aspeed_kcs_inb,
> 	.io_outputb =3D aspeed_kcs_outb,
> 	.io_updateb =3D aspeed_kcs_updateb,
>@@ -378,6 +407,10 @@ static int aspeed_kcs_probe(struct platform_device *p=
dev)
> 		return -ENODEV;
> 	}
>
>+	spin_lock_init(&priv->obe.lock);
>+	priv->obe.remove =3D false;
>+	timer_setup(&priv->obe.timer, aspeed_kcs_check_obe, 0);
>+
> 	aspeed_kcs_set_address(kcs_bmc, addr);
>
> 	rc =3D aspeed_kcs_config_irq(kcs_bmc, pdev);
>@@ -386,6 +419,8 @@ static int aspeed_kcs_probe(struct platform_device *pd=
ev)
>
> 	platform_set_drvdata(pdev, priv);
>
>+	aspeed_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EV=
ENT_TYPE_OBE),
>+				   KCS_BMC_EVENT_TYPE_IBF);
> 	aspeed_kcs_enable_channel(kcs_bmc, true);
>
> 	rc =3D kcs_bmc_add_device(&priv->kcs_bmc);
>@@ -404,6 +439,15 @@ static int aspeed_kcs_remove(struct platform_device *=
pdev)
>
> 	kcs_bmc_remove_device(kcs_bmc);
>
>+	aspeed_kcs_enable_channel(kcs_bmc, false);
>+	aspeed_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EV=
ENT_TYPE_OBE), 0);
>+
>+	/* Make sure it's proper dead */
>+	spin_lock_irq(&priv->obe.lock);
>+	priv->obe.remove =3D true;
>+	spin_unlock_irq(&priv->obe.lock);
>+	del_timer_sync(&priv->obe.timer);
>+
> 	return 0;
> }
>
>diff --git a/drivers/char/ipmi/kcs_bmc_client.h b/drivers/char/ipmi/kcs_bm=
c_client.h
>index d0a7404ff584..456796da33de 100644
>--- a/drivers/char/ipmi/kcs_bmc_client.h
>+++ b/drivers/char/ipmi/kcs_bmc_client.h
>@@ -37,6 +37,8 @@ int kcs_bmc_unregister_cdev(struct kcs_bmc_cdev *cdev);
> int kcs_bmc_enable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bmc_=
client *client);
> void kcs_bmc_disable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bm=
c_client *client);
>
>+void kcs_bmc_update_event_mask(struct kcs_bmc_device *kcs_bmc, u8 mask, u=
8 events);
>+
> u8 kcs_bmc_read_data(struct kcs_bmc_device *kcs_bmc);
> void kcs_bmc_write_data(struct kcs_bmc_device *kcs_bmc, u8 data);
> u8 kcs_bmc_read_status(struct kcs_bmc_device *kcs_bmc);
>diff --git a/drivers/char/ipmi/kcs_bmc_device.h b/drivers/char/ipmi/kcs_bm=
c_device.h
>index 57b7174b2bac..f1ca8912496a 100644
>--- a/drivers/char/ipmi/kcs_bmc_device.h
>+++ b/drivers/char/ipmi/kcs_bmc_device.h
>@@ -7,6 +7,7 @@
> #include "kcs_bmc.h"
>
> struct kcs_bmc_device_ops {
>+	void (*irq_mask_update)(struct kcs_bmc_device *kcs_bmc, u8 mask, u8 enab=
le);
> 	u8 (*io_inputb)(struct kcs_bmc_device *kcs_bmc, u32 reg);
> 	void (*io_outputb)(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 b);
> 	void (*io_updateb)(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 mask, u8 =
b);
>diff --git a/drivers/char/ipmi/kcs_bmc_npcm7xx.c b/drivers/char/ipmi/kcs_b=
mc_npcm7xx.c
>index dce93ec895fc..c2032728a03d 100644
>--- a/drivers/char/ipmi/kcs_bmc_npcm7xx.c
>+++ b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
>@@ -38,6 +38,7 @@
> #define KCS2CTL		0x2A
> #define KCS3CTL		0x3C
> #define    KCS_CTL_IBFIE	BIT(0)
>+#define    KCS_CTL_OBEIE	BIT(0)
>
> #define KCS1IE		0x1C
> #define KCS2IE		0x2E
>@@ -117,13 +118,23 @@ static void npcm7xx_kcs_enable_channel(struct kcs_bm=
c_device *kcs_bmc, bool enab
> {
> 	struct npcm7xx_kcs_bmc *priv =3D to_npcm7xx_kcs_bmc(kcs_bmc);
>
>-	regmap_update_bits(priv->map, priv->reg->ctl, KCS_CTL_IBFIE,
>-			   enable ? KCS_CTL_IBFIE : 0);
>-
> 	regmap_update_bits(priv->map, priv->reg->ie, KCS_IE_IRQE | KCS_IE_HIRQE,
> 			   enable ? KCS_IE_IRQE | KCS_IE_HIRQE : 0);
> }
>
>+static void npcm7xx_kcs_irq_mask_update(struct kcs_bmc_device *kcs_bmc, u=
8 mask, u8 state)
>+{
>+	struct npcm7xx_kcs_bmc *priv =3D to_npcm7xx_kcs_bmc(kcs_bmc);
>+
>+	if (KCS_BMC_EVENT_TYPE_OBE & mask)
>+		regmap_update_bits(priv->map, priv->reg->ctl, KCS_CTL_OBEIE,
>+				   !!(KCS_BMC_EVENT_TYPE_OBE & state) * KCS_CTL_OBEIE);
>+
>+	if (KCS_BMC_EVENT_TYPE_IBF & mask)
>+		regmap_update_bits(priv->map, priv->reg->ctl, KCS_CTL_IBFIE,
>+				   !!(KCS_BMC_EVENT_TYPE_IBF & state) * KCS_CTL_IBFIE);

Same operand ordering thing here...

>+}
>+
> static irqreturn_t npcm7xx_kcs_irq(int irq, void *arg)
> {
> 	struct kcs_bmc_device *kcs_bmc =3D arg;
>@@ -151,6 +162,7 @@ static int npcm7xx_kcs_config_irq(struct kcs_bmc_devic=
e *kcs_bmc,
> }
>
> static const struct kcs_bmc_device_ops npcm7xx_kcs_ops =3D {
>+	.irq_mask_update =3D npcm7xx_kcs_irq_mask_update,
> 	.io_inputb =3D npcm7xx_kcs_inb,
> 	.io_outputb =3D npcm7xx_kcs_outb,
> 	.io_updateb =3D npcm7xx_kcs_updateb,
>@@ -191,11 +203,13 @@ static int npcm7xx_kcs_probe(struct platform_device =
*pdev)
>
> 	platform_set_drvdata(pdev, priv);
>
>-	npcm7xx_kcs_enable_channel(kcs_bmc, true);
> 	rc =3D npcm7xx_kcs_config_irq(kcs_bmc, pdev);
> 	if (rc)
> 		return rc;
>
>+	npcm7xx_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_E=
VENT_TYPE_OBE),
>+				    KCS_BMC_EVENT_TYPE_IBF);
>+	npcm7xx_kcs_enable_channel(kcs_bmc, true);
>
> 	pr_info("channel=3D%u idr=3D0x%x odr=3D0x%x str=3D0x%x\n",
> 		chan,
>@@ -211,6 +225,9 @@ static int npcm7xx_kcs_remove(struct platform_device *=
pdev)
>
> 	kcs_bmc_remove_device(kcs_bmc);
>
>+	npcm7xx_kcs_enable_channel(kcs_bmc, false);
>+	npcm7xx_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_E=
VENT_TYPE_OBE), 0);
>+
> 	return 0;
> }
>
>--=20
>2.27.0
>=
