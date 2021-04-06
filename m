Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92756354C97
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 08:09:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDxvB3yClz30Dl
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 16:09:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:febe::714;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-pu1apc01on0714.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febe::714])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDxty6556z2yxv;
 Tue,  6 Apr 2021 16:09:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bquQJVI/VdaU+tBsrbc1CHkB7Ia2boqq8mbi6pW6IWppoQclpQcJoa5uaXII3fSeu9OW3VwLee/tQteOrXsmlup2Ppvd7S4KOEznfN5OPPqcWSmu4PDNmqweq/oW/Fg/UXJBNzWSGRPncwiYIyUGwyoHCMGvNtR3o4ZU/veLfy5t4rWO8f8A8i1sIyZBDW+LgkoNY2hpqczpA2tzkntDRGsSRc0pVZKcsyYyva4qXkKC+vxijQA4Y5EVpPuKOc+SvfBE3DxAkfSVj4rLIqqZ21+uEAr4haaBpRsGLlvFEKiuod7PK8r90Ip7x8n+4WosxO+fg+qsmhGaOPfVr7rhEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RaYoeKY4LG7cfN1Y4s7AoP/rWst4MVjFqq55TFmQRI=;
 b=nqgaAO4fxVpiclU88fS2oHlTJQGQB31O7taYk8uAp4E2wNUEmTHX8qjNpNjmxFTCHuHjZ+2eQOm69/ZtWLb1c6J8t2moCscwvfhuvN4p+rdsY8y3iWMjyr511Nk88k5E2st6pXm2dFapDdF7VQRLIp3Hi0smOt+TGCQMthCcziIaUO1/jN/ogfP3+gTRiANjOhnfh3qhginOaWjgAqpsvCJRcUmJsbq/000WEt9DPBmmLW+Fs2HsHWVtW1kAp5hccNoZlVHk2rSjcep1igcDWeYIAUV/gMhL0u2tQa21xZPOb00JkRaPdYzndxaw/gaW5vqCHasLD/Ijzuzxbt58zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK0PR06MB3668.apcprd06.prod.outlook.com (2603:1096:203:b7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Tue, 6 Apr
 2021 06:09:12 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::20c8:80da:5b1d:fc06]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::20c8:80da:5b1d:fc06%4]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 06:09:12 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "minyard@acm.org" <minyard@acm.org>
Subject: RE: [PATCH v2 21/21] ipmi: kcs_bmc_aspeed: Optionally apply status
 address
Thread-Topic: [PATCH v2 21/21] ipmi: kcs_bmc_aspeed: Optionally apply status
 address
Thread-Index: AQHXHIla9MoZtxcSoU+tfUZbCeW/RaqnHWVA
Date: Tue, 6 Apr 2021 06:09:12 +0000
Message-ID: <HK0PR06MB3779BE4C5C6E2758DC60FDCA91769@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-21-andrew@aj.id.au>
In-Reply-To: <20210319062752.145730-21-andrew@aj.id.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 128f78fe-39c3-4749-9615-08d8f8c27fef
x-ms-traffictypediagnostic: HK0PR06MB3668:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR06MB366809CEB906989F6582ABC091769@HK0PR06MB3668.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gaeEJXIs4gLScJaF2uQCCwh3DTzjWOckUa2zW/LkDVQvZ8e9Tf+V/+MHyl/BSnObsPz89tEzfHeK+TnXIHai6Z5XFNz8p9HMPdC+Nqfyu/4kzKnZN87sUdoufjbdrOK0lwZp4aq5Iukd6nBsSy24dC+GRc8YunMIL0dSGmkv/eqIgkUf0jAcP8HZNe9zq7OvFayCjGOGGyA/6YbfH3fRYxFJlqQKqyHoJ7YmWGs8OqsOQADCyCmqKIxKl6pX42+LaKpMVOk4j7TeiCxA/odbl8RYsM9C7LVjjV5n6y2TAl34+KCV0bHdYMBT34KahiM/CIj/+CxQcLanjHs2S9nZ+6c7ObSk15x68coqpH7c64Igf1K2778YNGb9L6t+YmZAhsmOSyDOw+hND0/ooFTUFP6p3XcFpGucXdn0vysKwgbdiGqKnuPZQj0ny/+4n0gTBNs9CVNIDRMBGtZFUH/8lrCi7kIggYUQeE6LRqncVTfEZwduJ3nTGfNGNbK55URTrBXUJ24pyA3nMs0XCcKZ6bhSTx12DhfFMvgQrWE+shwowL5cVyWLDiBYs3bZFXaMPqH4j7En0kBhDwFfA+rsZlrKO/BV56oj77deOIuGxm4y03/MvJxJiRRYH7y+upAErtih4TD2CI4iV9mAAgS9RfNtoozRvbzfO4WGrBwxuRI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(376002)(346002)(366004)(136003)(396003)(76116006)(52536014)(64756008)(53546011)(38100700001)(66446008)(2906002)(66556008)(66476007)(55236004)(83380400001)(66946007)(7696005)(26005)(8676002)(7416002)(54906003)(86362001)(186003)(4326008)(33656002)(55016002)(316002)(110136005)(6506007)(71200400001)(5660300002)(9686003)(8936002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?XzwimQh/hnyMcABh7YONLUoco53Gavsm5VDbw1aNq7oyO/ZivQBTb3BxDGw0?=
 =?us-ascii?Q?D/p3cK7b/37BdbQ1kD8xqDY7UsxC5PQD8Sy2eeb9bo7y0dcg86809z1M7hPf?=
 =?us-ascii?Q?2aBG0jSSlr1SH2y6I0ZMD1+wbT3KhdDv7/JIfrZUsv5S/ruk2cTQuhK60Z6x?=
 =?us-ascii?Q?JEe642u7f+/F2INotw3xfDQj082Y3W6Yor/p2ZkxWJtmgm18oEIqDC3yZv21?=
 =?us-ascii?Q?dmGbNomP9tbi/jmMD1L3ICAcyv6ccb+VaEt7BEQQOTCTm/ZGX4q3wZuLPGmz?=
 =?us-ascii?Q?KFYrD+io5Ql6v+uQk72P4R+BAd1Df+W3ck0XavOBNO1fQ7AJgq+iKR8HYMpX?=
 =?us-ascii?Q?KDZHFbL81pjCrEDqQzTXGr7EBxLzWZbTRZ8yf4mDsIr0spz9X0g4/YD32Sry?=
 =?us-ascii?Q?FTB0PmPEh5/hQLrZb1A4Pckixo7caorCAxtwGboNX/y/vkfikKKGHzj3JslA?=
 =?us-ascii?Q?Rmw5wgEirbtBzpF/woBpQffAXcv28RR7o5s2pNmHJOU0a6PvGqFVmy8zAzUa?=
 =?us-ascii?Q?qdy0793eGJtfCD5y8kiNsbGki/eoPokeoh8PuO7vdin+YnHp37HIfvRXx88Q?=
 =?us-ascii?Q?HgzrcfRNczraeDH4N3oeA8Yh1HFMHKiC7CKlb4w6p3WN9yG9duhy6fReoX8p?=
 =?us-ascii?Q?OvZHAYG8W+CUGbj6qXqbeW8y3Hp0b9UMR+Ht2RZfkLVAL+dn0QPDep2rAVno?=
 =?us-ascii?Q?vsYi3tywMlRFJkvsA/ShUYkniGXGX29DndxONV63LHqiXMnk7NAs3C78SrzW?=
 =?us-ascii?Q?lY6kG3VpjWeGADv/Dpi4uW8qhOy7WhHbyB7luO3XTczSU1usW8YOVpqCXfQr?=
 =?us-ascii?Q?q/qKIDDPZD/Kxmt70JYiONpF9yxQQ8e2KjLnbH/6fHk3/vKCGLwwPS5GmtbX?=
 =?us-ascii?Q?pf/nFJzhEk6bvMKiGpz7albWUuexncjV1hC2tvD9tDVKhTKUGhXwGaKaWiLY?=
 =?us-ascii?Q?mzG87MCTpCS2We7kyRXKVKN2XZrdGni1dojNXGhZyY7pN+uXxtjJaMCiHZOo?=
 =?us-ascii?Q?uG7ok7lZP51wr+BzG4bGU3BhgXw79nafYtLIlEXdj4DjKxgLTjKKQ0tENjiJ?=
 =?us-ascii?Q?0ppHyeolpF4+5bNyJxOmAfiXWK+TSgcK1xkuseU6K6EzGYauhCTVVYWhfJCC?=
 =?us-ascii?Q?d1ePag+QTUypZRET3xyDpK9TAMRkzO3h+sVwkXhm/MlOB+yTCAzuB/6I3ysl?=
 =?us-ascii?Q?P3xWD2ov3ACNS73Zh+7hU813Iu9F9byn/Bn15gDG1ADuHJXQwz0ToscgpP05?=
 =?us-ascii?Q?g9cWH1VT9Qx0ziJjvLF4JhNOXzBnxKUsO8VGq8gfqNC8lNMjbsIF/s8I2PhZ?=
 =?us-ascii?Q?a7Uce2uf2se4PwBwepD+EFer?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 128f78fe-39c3-4749-9615-08d8f8c27fef
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2021 06:09:12.5427 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AYey/+Gh5z2DY5L8NKMPLcQIjBY3/drh4GXTtiZWtfHRZqTGofSA9M4nOvLWOiCs4BDTY78H7Pc1F/bfEoh6TDacJoydY0N/l7tpQSavz/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB3668
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
 Ryan Chen <ryan_chen@aspeedtech.com>,
 "tmaimon77@gmail.com" <tmaimon77@gmail.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "avifishman70@gmail.com" <avifishman70@gmail.com>,
 "venture@google.com" <venture@google.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tali.perry1@gmail.com" <tali.perry1@gmail.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "benjaminfair@google.com" <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Reviewed-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>

> -----Original Message-----
> From: Andrew Jeffery <andrew@aj.id.au>
> Sent: Friday, March 19, 2021 2:28 PM
> To: openipmi-developer@lists.sourceforge.net; openbmc@lists.ozlabs.org;
> minyard@acm.org
> Subject: [PATCH v2 21/21] ipmi: kcs_bmc_aspeed: Optionally apply status
> address
>=20
> Some Aspeed KCS devices can derive the status register address from the
> address of the data register. As such, the address of the status register=
 can be
> implicit in the configuration if desired. On the other hand, sometimes ad=
dress
> schemes might be requested that are incompatible with the default address=
ing
> scheme. Allow these requests where possible if the devicetree specifies t=
he
> status register address.
>=20
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/char/ipmi/kcs_bmc_aspeed.c | 113 +++++++++++++++++++++--------
>  1 file changed, 81 insertions(+), 32 deletions(-)
>=20
> diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c
> b/drivers/char/ipmi/kcs_bmc_aspeed.c
> index 7334b1f51dcc..98789b837690 100644
> --- a/drivers/char/ipmi/kcs_bmc_aspeed.c
> +++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
> @@ -83,6 +83,8 @@
>  #define LPC_STR2             0x040
>  #define LPC_STR3             0x044
>  #define LPC_HICRB            0x100
> +#define     LPC_HICRB_EN16LADR2      BIT(5)
> +#define     LPC_HICRB_EN16LADR1      BIT(4)
>  #define     LPC_HICRB_IBFIE4         BIT(1)
>  #define     LPC_HICRB_LPC4E          BIT(0)
>  #define LPC_HICRC            0x104
> @@ -96,6 +98,11 @@
>  #define LPC_IDR4             0x114
>  #define LPC_ODR4             0x118
>  #define LPC_STR4             0x11C
> +#define LPC_LSADR12	     0x120
> +#define     LPC_LSADR12_LSADR2_MASK  GENMASK(31, 16)
> +#define     LPC_LSADR12_LSADR2_SHIFT 16
> +#define     LPC_LSADR12_LSADR1_MASK  GENMASK(15, 0)
> +#define     LPC_LSADR12_LSADR1_SHIFT 0
>=20
>  #define OBE_POLL_PERIOD	     (HZ / 2)
>=20
> @@ -123,7 +130,7 @@ struct aspeed_kcs_bmc {
>=20
>  struct aspeed_kcs_of_ops {
>  	int (*get_channel)(struct platform_device *pdev);
> -	int (*get_io_address)(struct platform_device *pdev);
> +	int (*get_io_address)(struct platform_device *pdev, u32 addrs[2]);
>  };
>=20
>  static inline struct aspeed_kcs_bmc *to_aspeed_kcs_bmc(struct
> kcs_bmc_device *kcs_bmc) @@ -217,38 +224,64 @@ static void
> aspeed_kcs_updateb(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 mask,
>   *     C. KCS4
>   *        D / C : CA4h / CA5h
>   */
> -static void aspeed_kcs_set_address(struct kcs_bmc_device *kcs_bmc, u16
> addr)
> +static int aspeed_kcs_set_address(struct kcs_bmc_device *kcs_bmc, u32
> +addrs[2], int nr_addrs)
>  {
>  	struct aspeed_kcs_bmc *priv =3D to_aspeed_kcs_bmc(kcs_bmc);
>=20
> -	switch (kcs_bmc->channel) {
> +	if (WARN_ON(nr_addrs < 1 || nr_addrs > 2))
> +		return -EINVAL;
> +
> +	switch (priv->kcs_bmc.channel) {
>  	case 1:
> -		regmap_update_bits(priv->map, LPC_HICR4,
> -				LPC_HICR4_LADR12AS, 0);
> -		regmap_write(priv->map, LPC_LADR12H, addr >> 8);
> -		regmap_write(priv->map, LPC_LADR12L, addr & 0xFF);
> +		regmap_update_bits(priv->map, LPC_HICR4, LPC_HICR4_LADR12AS,
> 0);
> +		regmap_write(priv->map, LPC_LADR12H, addrs[0] >> 8);
> +		regmap_write(priv->map, LPC_LADR12L, addrs[0] & 0xFF);
> +		if (nr_addrs =3D=3D 2) {
> +			regmap_update_bits(priv->map, LPC_LSADR12,
> LPC_LSADR12_LSADR1_MASK,
> +					   addrs[1] << LPC_LSADR12_LSADR1_SHIFT);
> +
> +			regmap_update_bits(priv->map, LPC_HICRB,
> LPC_HICRB_EN16LADR1,
> +					   LPC_HICRB_EN16LADR1);
> +		}
>  		break;
>=20
>  	case 2:
> -		regmap_update_bits(priv->map, LPC_HICR4,
> -				LPC_HICR4_LADR12AS, LPC_HICR4_LADR12AS);
> -		regmap_write(priv->map, LPC_LADR12H, addr >> 8);
> -		regmap_write(priv->map, LPC_LADR12L, addr & 0xFF);
> +		regmap_update_bits(priv->map, LPC_HICR4, LPC_HICR4_LADR12AS,
> LPC_HICR4_LADR12AS);
> +		regmap_write(priv->map, LPC_LADR12H, addrs[0] >> 8);
> +		regmap_write(priv->map, LPC_LADR12L, addrs[0] & 0xFF);
> +		if (nr_addrs =3D=3D 2) {
> +			regmap_update_bits(priv->map, LPC_LSADR12,
> LPC_LSADR12_LSADR2_MASK,
> +					   addrs[1] << LPC_LSADR12_LSADR2_SHIFT);
> +
> +			regmap_update_bits(priv->map, LPC_HICRB,
> LPC_HICRB_EN16LADR2,
> +					   LPC_HICRB_EN16LADR2);
> +		}
>  		break;
>=20
>  	case 3:
> -		regmap_write(priv->map, LPC_LADR3H, addr >> 8);
> -		regmap_write(priv->map, LPC_LADR3L, addr & 0xFF);
> +		if (nr_addrs =3D=3D 2) {
> +			dev_err(priv->kcs_bmc.dev,
> +				"Channel 3 only supports inferred status IO address\n");
> +			return -EINVAL;
> +		}
> +
> +		regmap_write(priv->map, LPC_LADR3H, addrs[0] >> 8);
> +		regmap_write(priv->map, LPC_LADR3L, addrs[0] & 0xFF);
>  		break;
>=20
>  	case 4:
> -		regmap_write(priv->map, LPC_LADR4, ((addr + 1) << 16) |
> -			addr);
> +		if (nr_addrs =3D=3D 1)
> +			regmap_write(priv->map, LPC_LADR4, ((addrs[0] + 1) << 16) |
> addrs[0]);
> +		else
> +			regmap_write(priv->map, LPC_LADR4, (addrs[1] << 16) |
> addrs[0]);
> +
>  		break;
>=20
>  	default:
> -		break;
> +		return -EINVAL;
>  	}
> +
> +	return 0;
>  }
>=20
>  static inline int aspeed_kcs_map_serirq_type(u32 dt_type) @@ -462,18
> +495,18 @@ static int aspeed_kcs_of_v1_get_channel(struct platform_device
> *pdev)
>  	return channel;
>  }
>=20
> -static int aspeed_kcs_of_v1_get_io_address(struct platform_device *pdev)
> +static int
> +aspeed_kcs_of_v1_get_io_address(struct platform_device *pdev, u32
> +addrs[2])
>  {
> -	u32 slave;
>  	int rc;
>=20
> -	rc =3D of_property_read_u32(pdev->dev.of_node, "kcs_addr", &slave);
> -	if (rc || slave > 0xffff) {
> +	rc =3D of_property_read_u32(pdev->dev.of_node, "kcs_addr", addrs);
> +	if (rc || addrs[0] > 0xffff) {
>  		dev_err(&pdev->dev, "no valid 'kcs_addr' configured\n");
>  		return -EINVAL;
>  	}
>=20
> -	return slave;
> +	return 1;
>  }
>=20
>  static int aspeed_kcs_of_v2_get_channel(struct platform_device *pdev) @@
> -509,16 +542,27 @@ static int aspeed_kcs_of_v2_get_channel(struct
> platform_device *pdev)
>  	return -EINVAL;
>  }
>=20
> -static int aspeed_kcs_of_v2_get_io_address(struct platform_device *pdev)
> +static int
> +aspeed_kcs_of_v2_get_io_address(struct platform_device *pdev, u32
> +addrs[2])
>  {
> -	uint32_t slave;
>  	int rc;
>=20
> -	rc =3D of_property_read_u32(pdev->dev.of_node, "aspeed,lpc-io-reg",
> &slave);
> -	if (rc || slave > 0xffff)
> +	rc =3D of_property_read_variable_u32_array(pdev->dev.of_node,
> +						 "aspeed,lpc-io-reg",
> +						 addrs, 1, 2);
> +	if (rc < 0)
> +		return rc;
> +
> +	if (WARN_ON(rc =3D=3D 0))
> +		return -EINVAL;
> +
> +	if (addrs[0] > 0xffff)
> +		return -EINVAL;
> +
> +	if (rc =3D=3D 2 && addrs[1] > 0xffff)
>  		return -EINVAL;
>=20
> -	return slave;
> +	return rc;
>  }
>=20
>  static int aspeed_kcs_probe(struct platform_device *pdev) @@ -527,9
> +571,11 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
>  	struct kcs_bmc_device *kcs_bmc;
>  	struct aspeed_kcs_bmc *priv;
>  	struct device_node *np;
> -	int rc, channel, addr;
>  	bool have_upstream_irq;
>  	u32 upstream_irq[2];
> +	int rc, channel;
> +	int nr_addrs;
> +	u32 addrs[2];
>=20
>  	np =3D pdev->dev.of_node->parent;
>  	if (!of_device_is_compatible(np, "aspeed,ast2400-lpc-v2") && @@ -547,9
> +593,9 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
>  	if (channel < 0)
>  		return channel;
>=20
> -	addr =3D ops->get_io_address(pdev);
> -	if (addr < 0)
> -		return addr;
> +	nr_addrs =3D ops->get_io_address(pdev, addrs);
> +	if (nr_addrs < 0)
> +		return nr_addrs;
>=20
>  	np =3D pdev->dev.of_node;
>  	rc =3D of_property_read_u32_array(np, "aspeed,lpc-interrupts",
> upstream_irq, 2); @@ -578,7 +624,9 @@ static int aspeed_kcs_probe(struct
> platform_device *pdev)
>  	priv->obe.remove =3D false;
>  	timer_setup(&priv->obe.timer, aspeed_kcs_check_obe, 0);
>=20
> -	aspeed_kcs_set_address(kcs_bmc, addr);
> +	rc =3D aspeed_kcs_set_address(kcs_bmc, addrs, nr_addrs);
> +	if (rc)
> +		return rc;
>=20
>  	/* Host to BMC IRQ */
>  	rc =3D aspeed_kcs_config_downstream_irq(kcs_bmc, pdev); @@ -600,7
> +648,8 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
>  	if (rc < 0)
>  		return rc;
>=20
> -	dev_info(&pdev->dev, "Initialised channel %d at 0x%x\n",
> kcs_bmc->channel, addr);
> +	dev_info(&pdev->dev, "Initialised channel %d at 0x%x\n",
> +			kcs_bmc->channel, addrs[0]);
>=20
>  	return 0;
>  }
> --
> 2.27.0

