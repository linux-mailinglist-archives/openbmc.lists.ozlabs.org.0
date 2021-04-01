Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFCD351BFD
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 20:18:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBBJr4NT1z3bwh
	for <lists+openbmc@lfdr.de>; Fri,  2 Apr 2021 05:18:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=F00hgXFU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=57252e1af0=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=equinixinc.onmicrosoft.com
 header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-equinixinc-onmicrosoft-com header.b=F00hgXFU; 
 dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBBJY0tn2z2xZT;
 Fri,  2 Apr 2021 05:18:36 +1100 (AEDT)
Received: from pps.filterd (m0105197.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 131IEVqW024091; Thu, 1 Apr 2021 18:18:12 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
 by mx0a-00268f01.pphosted.com with ESMTP id 37n3ceuhp5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Apr 2021 18:18:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GT4Vt3froka342vNCrd0QlOBVGbRUms38hxMeJlwtjZqO4iIINmwQyv1+hbt+DmNeZN/z9Pf3Ce/Q6Q0jxyE67RW9JIyu5Vu5yxj+MZZhD4YqHzUeAbzXiCSaBajz96Kj4jsCWW1YLARwbAcPBtLfIW4Npefy2dsau3bFgCMGzT3PNty1AeUzAAIjKMMjA2TEUjmz4xfo+QaoaG6PlwhNyuMGdXYYVEZI1UjRpzD1wmwlUtSrR+4KxwucByLGhaZsnKZVZbxHV/3Qdj7AFnfSj6TmNfW/jvWVWlIklGbN2H0LR6xGQlfWDDCV3k/G+U4864uYviL+yOvNadbvqdYrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6n771te6bi3qxA4ZtqeVJGmxpWBlw+7ByqZOVhCC0Q=;
 b=CoeQ2dnuGrGkvQMS3zMzzts9bgVmhVzIzmUtapp3cdqMEMCIPF5/yr1PBV34iQX1jH0/QwSWV1u9n81i1XGutIj/R6o6vzbEMaG6g8DL0M3TfDG8x0HFww0aqQsYfVhQrxuomCJtGvT8nPNjErsbKAkTy2CNmmI6Iqi7RbygXhdfg8r6jtKOPWfbQvzUdDFYBwcW4sT+sBD3xhVdx2HOZpoxp5QltkQ0AqD6dwAmYAf7aT7GfZAh5UfrME0MewH4hPGKKqLyCJB6W9qZxUFINtCXWEAadVGMyfmtvD6YxuYYhYNdmwMupS+Bhw2zQWVVqL2nn8pUH1J8nF0VCx8g4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6n771te6bi3qxA4ZtqeVJGmxpWBlw+7ByqZOVhCC0Q=;
 b=F00hgXFU07boSiVxHx3QRrCb0eD5KhF3tn3oyDZ/Dut3VCqT15hdsVhnpODd/vcARElK/V0UXhVYSnW8U/3PsKrHDB9XZptPsta6k+QuIWXluGVu7RZue5fo/1i0ohx1CQxtEwp1jf/uJMcbyIZZmmWVqAPOErkuJA4AuHP7tqU=
Received: from DM5PR04MB0762.namprd04.prod.outlook.com (2603:10b6:3:f3::13) by
 DM6PR04MB5531.namprd04.prod.outlook.com (2603:10b6:5:123::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.27; Thu, 1 Apr 2021 18:18:10 +0000
Received: from DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad]) by DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad%5]) with mapi id 15.20.3977.033; Thu, 1 Apr 2021
 18:18:09 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re [PATCH v2 21/21] ipmi: kcs_bmc_aspeed: Optionally apply status
 address
Thread-Topic: Re [PATCH v2 21/21] ipmi: kcs_bmc_aspeed: Optionally apply
 status address
Thread-Index: AQHXJyNeAUueKu6Dl0GGRLjVvWP0kA==
Date: Thu, 1 Apr 2021 18:18:09 +0000
Message-ID: <YGYOX4HcdKcWOUx1@packtop>
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-21-andrew@aj.id.au>
In-Reply-To: <20210319062752.145730-21-andrew@aj.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=equinix.com;
x-originating-ip: [24.181.166.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7608cad5-7260-44a4-1166-08d8f53a815a
x-ms-traffictypediagnostic: DM6PR04MB5531:
x-microsoft-antispam-prvs: <DM6PR04MB5531088A3E332A47D2E654B2C37B9@DM6PR04MB5531.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U4QCcC1p9L1v3ToW9Xwq4TBV3xfFQWy/3v21xxhgk1GHwK0K7ctaaivvIkVwOg/yKvb52ZzQYXfwsmCGolbkDrcYDDNXGH94r2jFIFMUY4wRbwCyx1oI2cuT/8BkRZgyoHRwPK8y43t9lcCMlsR/mY+IU3M/ofJK6WrLUQOAyhmdBwehSdmjZw6qXPwBU5LvBaXQd54p0LKs04LM334uhw3xgf0GL3SwcP6zc5TAau8cxhGqshtIPI4c9ll8We83PfixpgwkJJZWid97yFM/56BpcNvY0JknSwxvq/oFYGC5JufE3qCT24fBLwtuijQdR/brDV/lLFpM8ZZUTHJCMcMUw4tsUhPEg34iMFa2JdBzEA2Va4oSqGv4aK4SelKVOtImtc3mWXdU29jOTWEjHwZNo3x660jQZKuK+18cMC2cTydvKMyTCV8gZP/Oq9Q0FYa/RfDzSN+2Z4UHQURWE+dFY6uGvLD+zTXKUK4bLliBRs/w5Vvac1VMNB+m9Il7vDTrEmdL0svuzDZdWZ3FsQQox25fWSlFJ7jeSc2NsHmSTjBF6TEvRbnhgJ6isClfsUiUu91vBXyM9Z+ubG9e/WVpe9YNZHtiTWd/hWscKiwj9z4b0vi3eqr3VKyMgtGOmKSIUFnNlErzK1Va/c6ntg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0762.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(366004)(396003)(136003)(376002)(39860400002)(346002)(8936002)(64756008)(478600001)(5660300002)(4326008)(66556008)(66446008)(6916009)(6512007)(26005)(66476007)(83380400001)(6486002)(7416002)(9686003)(6506007)(86362001)(316002)(71200400001)(66946007)(38100700001)(33716001)(8676002)(76116006)(2906002)(186003)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?3m+AaOfKI0JyT373TXLmB6CMAOu+OcOC6NaRec+hfmTxjnpkL3MrhT3IsCyb?=
 =?us-ascii?Q?Vm0Ju9dwW0euAyiVW5XftBhFA9v1iY+b2Il6J0xe1bfJ7hANuCo7/zXBrQGd?=
 =?us-ascii?Q?E3rOZQTsb7cyq8P7ReQbE4sVFDOzI36wHD2RAYpti7N8bIqn35c4Ig+JrFVz?=
 =?us-ascii?Q?0NnKS5AjQDFJbnqZsCME12eTLqTJ2sMjMhQvX/qJ5LtQTL/x4NNShamp2ewa?=
 =?us-ascii?Q?ouEAnpq9Jgyay1rYxW2z1UlsXkE+iMNum0rq1QxH5UcImEj401sDCVMtxJzN?=
 =?us-ascii?Q?Qv39gWo6tajXNkhCKmvNVHwPcjeRNyTwqnwglnPBWA4pgVvrVJe21l+v4Jxl?=
 =?us-ascii?Q?58ouRHVLvaNVjjIp5/RgSeCnh8FIEtV/lbhr/oHaHINhNZCJJzmSdwjWf1ut?=
 =?us-ascii?Q?/1ICMQgd+ocZ3hHcNQqiPeaX0Ii2CdOQn41VXOZet4V8Tp9JnhnOLjXze/vZ?=
 =?us-ascii?Q?RoFt2ku8FrDMvc2ncZn8i46Mfq/Kzz7lkMt+96Jx9lUUivqXrZm74F/1z5oB?=
 =?us-ascii?Q?bQcZ8cZQxFoSUhv4GbaxBSlVzGzjLDDh8FXu/VmElxVjryfld/bXEbgBDlBE?=
 =?us-ascii?Q?KRyAXOHQK8dVqIqTKGFGs+TSYh/0XqKr4/2JwP/J7LotIAVLo3uObo5Ku6kV?=
 =?us-ascii?Q?5R2mq/gG5nVWUePdtSgH/6UOPPY0YpnaMIz1KdwXPGbU5yJS0scLRUf7ORZ8?=
 =?us-ascii?Q?YWZTQStr74p4JswpNPRP//w7/vUTv08JbgrwAA81qqRsagEYsVKYStX/JdJ8?=
 =?us-ascii?Q?vcqrFn8Had9I2+/dAlK3XB5ctTPT0H5chT8QZwGVzqpPEHe2aHE9Ys1djMmo?=
 =?us-ascii?Q?CXhSaGNhOCdkFy4gT0We8R1pApeB1N7dbrWc5Chd2K/DPxyAygXLaqWqGs9N?=
 =?us-ascii?Q?9VNhUIULqbl+GdZ/AOySgGtwkLHXdPcH55xIrvN8tVop+fAKjnI1MooWI29e?=
 =?us-ascii?Q?uXFq5IFRRahsrBO+TRZcto3ejAXwMzzaLT71acjBK47VnVM1I4J3un2EGd4q?=
 =?us-ascii?Q?fptqpEMxMW12bo27LrQFfjLc+Qn8dYzhetg1XKyQn0LbZEny4PzW+K8Qsah+?=
 =?us-ascii?Q?pnE+WVCpDT7Q48nm8XhvDenrWC94lxevCbVf8u8hXG13SBKqdrODYs6JbXIw?=
 =?us-ascii?Q?oZIh3oRDK/CSvEhdUgvPOihc/zWcFG2TDncXixjOCFUJLZ5S1A5Te1jmnZNg?=
 =?us-ascii?Q?2qgcXK66/JDDlazVegCFtIAFYlUV4pgCJdG3PRClcr4P+9CcTee8vVkdMAAp?=
 =?us-ascii?Q?WoWTR5Vob8L757vK0TnR5U0RTU/z7cwfoVUCjDTAegMTwrGhccAoDPnjLKDh?=
 =?us-ascii?Q?DNzkWQk40Og1XJO3FP5dYHaL?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AC3397F50CBE58469B51BB8E9DC2F662@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0762.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7608cad5-7260-44a4-1166-08d8f53a815a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2021 18:18:09.8867 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UGeVNydP2XiYIOmax/4ChE+ZeAJjVqku8jbSKXdvZCmnwLJQOZAo5sc4u1Ns6iAWArjOIJuSnUkBxYZpKpfaJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5531
X-Proofpoint-ORIG-GUID: 9xFTfW-aWC2nPu82TyuKK2VFTkpxKw2F
X-Proofpoint-GUID: 9xFTfW-aWC2nPu82TyuKK2VFTkpxKw2F
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-01_09:2021-04-01,
 2021-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 mlxscore=0 adultscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103310000 definitions=main-2104010119
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

On Fri, Mar 19, 2021 at 01:27:52AM CDT, Andrew Jeffery wrote:
>Some Aspeed KCS devices can derive the status register address from the
>address of the data register. As such, the address of the status
>register can be implicit in the configuration if desired. On the other
>hand, sometimes address schemes might be requested that are incompatible
>with the default addressing scheme. Allow these requests where possible
>if the devicetree specifies the status register address.
>
>Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>---
> drivers/char/ipmi/kcs_bmc_aspeed.c | 113 +++++++++++++++++++++--------
> 1 file changed, 81 insertions(+), 32 deletions(-)
>
>diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bm=
c_aspeed.c
>index 7334b1f51dcc..98789b837690 100644
>--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
>+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
>@@ -83,6 +83,8 @@
> #define LPC_STR2             0x040
> #define LPC_STR3             0x044
> #define LPC_HICRB            0x100
>+#define     LPC_HICRB_EN16LADR2      BIT(5)
>+#define     LPC_HICRB_EN16LADR1      BIT(4)
> #define     LPC_HICRB_IBFIE4         BIT(1)
> #define     LPC_HICRB_LPC4E          BIT(0)
> #define LPC_HICRC            0x104
>@@ -96,6 +98,11 @@
> #define LPC_IDR4             0x114
> #define LPC_ODR4             0x118
> #define LPC_STR4             0x11C
>+#define LPC_LSADR12	     0x120
>+#define     LPC_LSADR12_LSADR2_MASK  GENMASK(31, 16)
>+#define     LPC_LSADR12_LSADR2_SHIFT 16
>+#define     LPC_LSADR12_LSADR1_MASK  GENMASK(15, 0)
>+#define     LPC_LSADR12_LSADR1_SHIFT 0
>
> #define OBE_POLL_PERIOD	     (HZ / 2)
>
>@@ -123,7 +130,7 @@ struct aspeed_kcs_bmc {
>
> struct aspeed_kcs_of_ops {
> 	int (*get_channel)(struct platform_device *pdev);
>-	int (*get_io_address)(struct platform_device *pdev);
>+	int (*get_io_address)(struct platform_device *pdev, u32 addrs[2]);
> };
>
> static inline struct aspeed_kcs_bmc *to_aspeed_kcs_bmc(struct kcs_bmc_dev=
ice *kcs_bmc)
>@@ -217,38 +224,64 @@ static void aspeed_kcs_updateb(struct kcs_bmc_device=
 *kcs_bmc, u32 reg, u8 mask,
>  *     C. KCS4
>  *        D / C : CA4h / CA5h
>  */
>-static void aspeed_kcs_set_address(struct kcs_bmc_device *kcs_bmc, u16 ad=
dr)
>+static int aspeed_kcs_set_address(struct kcs_bmc_device *kcs_bmc, u32 add=
rs[2], int nr_addrs)
> {
> 	struct aspeed_kcs_bmc *priv =3D to_aspeed_kcs_bmc(kcs_bmc);
>
>-	switch (kcs_bmc->channel) {
>+	if (WARN_ON(nr_addrs < 1 || nr_addrs > 2))
>+		return -EINVAL;
>+
>+	switch (priv->kcs_bmc.channel) {
> 	case 1:
>-		regmap_update_bits(priv->map, LPC_HICR4,
>-				LPC_HICR4_LADR12AS, 0);
>-		regmap_write(priv->map, LPC_LADR12H, addr >> 8);
>-		regmap_write(priv->map, LPC_LADR12L, addr & 0xFF);
>+		regmap_update_bits(priv->map, LPC_HICR4, LPC_HICR4_LADR12AS, 0);
>+		regmap_write(priv->map, LPC_LADR12H, addrs[0] >> 8);
>+		regmap_write(priv->map, LPC_LADR12L, addrs[0] & 0xFF);
>+		if (nr_addrs =3D=3D 2) {
>+			regmap_update_bits(priv->map, LPC_LSADR12, LPC_LSADR12_LSADR1_MASK,
>+					   addrs[1] << LPC_LSADR12_LSADR1_SHIFT);
>+
>+			regmap_update_bits(priv->map, LPC_HICRB, LPC_HICRB_EN16LADR1,
>+					   LPC_HICRB_EN16LADR1);
>+		}
> 		break;
>
> 	case 2:
>-		regmap_update_bits(priv->map, LPC_HICR4,
>-				LPC_HICR4_LADR12AS, LPC_HICR4_LADR12AS);
>-		regmap_write(priv->map, LPC_LADR12H, addr >> 8);
>-		regmap_write(priv->map, LPC_LADR12L, addr & 0xFF);
>+		regmap_update_bits(priv->map, LPC_HICR4, LPC_HICR4_LADR12AS, LPC_HICR4_=
LADR12AS);
>+		regmap_write(priv->map, LPC_LADR12H, addrs[0] >> 8);
>+		regmap_write(priv->map, LPC_LADR12L, addrs[0] & 0xFF);
>+		if (nr_addrs =3D=3D 2) {
>+			regmap_update_bits(priv->map, LPC_LSADR12, LPC_LSADR12_LSADR2_MASK,
>+					   addrs[1] << LPC_LSADR12_LSADR2_SHIFT);
>+
>+			regmap_update_bits(priv->map, LPC_HICRB, LPC_HICRB_EN16LADR2,
>+					   LPC_HICRB_EN16LADR2);
>+		}
> 		break;
>
> 	case 3:
>-		regmap_write(priv->map, LPC_LADR3H, addr >> 8);
>-		regmap_write(priv->map, LPC_LADR3L, addr & 0xFF);
>+		if (nr_addrs =3D=3D 2) {
>+			dev_err(priv->kcs_bmc.dev,
>+				"Channel 3 only supports inferred status IO address\n");
>+			return -EINVAL;
>+		}
>+
>+		regmap_write(priv->map, LPC_LADR3H, addrs[0] >> 8);
>+		regmap_write(priv->map, LPC_LADR3L, addrs[0] & 0xFF);
> 		break;
>
> 	case 4:
>-		regmap_write(priv->map, LPC_LADR4, ((addr + 1) << 16) |
>-			addr);
>+		if (nr_addrs =3D=3D 1)
>+			regmap_write(priv->map, LPC_LADR4, ((addrs[0] + 1) << 16) | addrs[0]);
>+		else
>+			regmap_write(priv->map, LPC_LADR4, (addrs[1] << 16) | addrs[0]);
>+
> 		break;
>
> 	default:
>-		break;
>+		return -EINVAL;
> 	}
>+
>+	return 0;
> }
>
> static inline int aspeed_kcs_map_serirq_type(u32 dt_type)
>@@ -462,18 +495,18 @@ static int aspeed_kcs_of_v1_get_channel(struct platf=
orm_device *pdev)
> 	return channel;
> }
>
>-static int aspeed_kcs_of_v1_get_io_address(struct platform_device *pdev)
>+static int
>+aspeed_kcs_of_v1_get_io_address(struct platform_device *pdev, u32 addrs[2=
])
> {
>-	u32 slave;
> 	int rc;
>
>-	rc =3D of_property_read_u32(pdev->dev.of_node, "kcs_addr", &slave);
>-	if (rc || slave > 0xffff) {
>+	rc =3D of_property_read_u32(pdev->dev.of_node, "kcs_addr", addrs);
>+	if (rc || addrs[0] > 0xffff) {
> 		dev_err(&pdev->dev, "no valid 'kcs_addr' configured\n");
> 		return -EINVAL;
> 	}
>
>-	return slave;
>+	return 1;
> }
>
> static int aspeed_kcs_of_v2_get_channel(struct platform_device *pdev)
>@@ -509,16 +542,27 @@ static int aspeed_kcs_of_v2_get_channel(struct platf=
orm_device *pdev)
> 	return -EINVAL;
> }
>
>-static int aspeed_kcs_of_v2_get_io_address(struct platform_device *pdev)
>+static int
>+aspeed_kcs_of_v2_get_io_address(struct platform_device *pdev, u32 addrs[2=
])
> {
>-	uint32_t slave;
> 	int rc;
>
>-	rc =3D of_property_read_u32(pdev->dev.of_node, "aspeed,lpc-io-reg", &sla=
ve);
>-	if (rc || slave > 0xffff)
>+	rc =3D of_property_read_variable_u32_array(pdev->dev.of_node,
>+						 "aspeed,lpc-io-reg",
>+						 addrs, 1, 2);
>+	if (rc < 0)
>+		return rc;
>+
>+	if (WARN_ON(rc =3D=3D 0))
>+		return -EINVAL;

Is this check necessary?  It looks like
of_property_read_variable_u32_array() should fail in that case given
sz_min=3D=3D1, so this seems like it should be impossible to trigger.

>+
>+	if (addrs[0] > 0xffff)
>+		return -EINVAL;
>+
>+	if (rc =3D=3D 2 && addrs[1] > 0xffff)
> 		return -EINVAL;
>
>-	return slave;
>+	return rc;
> }
>
> static int aspeed_kcs_probe(struct platform_device *pdev)
>@@ -527,9 +571,11 @@ static int aspeed_kcs_probe(struct platform_device *p=
dev)
> 	struct kcs_bmc_device *kcs_bmc;
> 	struct aspeed_kcs_bmc *priv;
> 	struct device_node *np;
>-	int rc, channel, addr;
> 	bool have_upstream_irq;
> 	u32 upstream_irq[2];
>+	int rc, channel;
>+	int nr_addrs;
>+	u32 addrs[2];
>
> 	np =3D pdev->dev.of_node->parent;
> 	if (!of_device_is_compatible(np, "aspeed,ast2400-lpc-v2") &&
>@@ -547,9 +593,9 @@ static int aspeed_kcs_probe(struct platform_device *pd=
ev)
> 	if (channel < 0)
> 		return channel;
>
>-	addr =3D ops->get_io_address(pdev);
>-	if (addr < 0)
>-		return addr;
>+	nr_addrs =3D ops->get_io_address(pdev, addrs);
>+	if (nr_addrs < 0)
>+		return nr_addrs;
>
> 	np =3D pdev->dev.of_node;
> 	rc =3D of_property_read_u32_array(np, "aspeed,lpc-interrupts", upstream_=
irq, 2);
>@@ -578,7 +624,9 @@ static int aspeed_kcs_probe(struct platform_device *pd=
ev)
> 	priv->obe.remove =3D false;
> 	timer_setup(&priv->obe.timer, aspeed_kcs_check_obe, 0);
>
>-	aspeed_kcs_set_address(kcs_bmc, addr);
>+	rc =3D aspeed_kcs_set_address(kcs_bmc, addrs, nr_addrs);
>+	if (rc)
>+		return rc;
>
> 	/* Host to BMC IRQ */
> 	rc =3D aspeed_kcs_config_downstream_irq(kcs_bmc, pdev);
>@@ -600,7 +648,8 @@ static int aspeed_kcs_probe(struct platform_device *pd=
ev)
> 	if (rc < 0)
> 		return rc;
>
>-	dev_info(&pdev->dev, "Initialised channel %d at 0x%x\n", kcs_bmc->channe=
l, addr);
>+	dev_info(&pdev->dev, "Initialised channel %d at 0x%x\n",
>+			kcs_bmc->channel, addrs[0]);
>
> 	return 0;
> }
>--=20
>2.27.0
>=
