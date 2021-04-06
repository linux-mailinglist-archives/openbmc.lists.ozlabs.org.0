Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8CB354C89
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 08:07:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDxrZ0qnPz309W
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 16:07:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.105;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320105.outbound.protection.outlook.com [40.107.132.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDxrK57Dzz2xZ9;
 Tue,  6 Apr 2021 16:07:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKb8RVXA6DLXqi1md4dymoF4U/otofLyv5+iLrQR54YNOEpvKfMIEvaS1Ef2tkSGZA/Iv9sG4HxHIrM0HUOfsjhcOmaYsrPpakGtdUbh6pB6N5XPQ8SAsjUZKVbOoCA2uSPIb8pD3ueGNytYl9CiJw/uybIuTy9KRx77N0t2L5eGs0va9l6+ADwBc/gnpddAh/ub86s1Ks3xt+1/BvutmJ5GgvtL/phwi50ifshHMIKRNxbAV6uEcbET+UW0Z8dWfSY7sfyKeRnEMk8qHJRFylANQNXTchiCYaYXJdj75Rjl2WXFWGJKD47dC18+xcLB5KNs0zZ7bxlKiv9X1S9T+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWjrxTc89Offw0ZXa+xEErXQu1aEaRleTwD0yfnmhFs=;
 b=YxRPL+LRl8vXKSV8iQ0HUUkJp7X7wpFZcwW74nTO+jw3faDXfontt+hIZ+3rsD6gVqkDtX1dcyRtbbMtcWMJcksbI3tVoXA0FKg7PEOJM5NsidaF1QLhbPwrkRbWiGxxwu36tcl0JetNaG50HMXCYba+1Pv5L8x0O+DdQo00lRTVdjXEZnkPSrFmZJiA3bjTlQ3MmlXoW2b/GBNUj8A8+owmEWj9/tpO4T3YKL9QGw1sxsjGI3NYKJJDJDv6/ZoHYrjWiemahPFl/jRS7UBJluHwGH2oZBR7zVpAKOveLF5BPqu+T/SQETs0470Ltqt4Np0F6Tu455iNCQTYwAMlbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK2PR0601MB1907.apcprd06.prod.outlook.com (2603:1096:202:a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Tue, 6 Apr
 2021 06:07:01 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::20c8:80da:5b1d:fc06]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::20c8:80da:5b1d:fc06%4]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 06:07:01 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "minyard@acm.org" <minyard@acm.org>
Subject: RE: [PATCH v2 06/21] ipmi: kcs_bmc_aspeed: Use of match data to
 extract KCS properties
Thread-Topic: [PATCH v2 06/21] ipmi: kcs_bmc_aspeed: Use of match data to
 extract KCS properties
Thread-Index: AQHXHIklK1hXYE3/6UilkWA9iCynRKqnHCCw
Date: Tue, 6 Apr 2021 06:07:00 +0000
Message-ID: <HK0PR06MB377918E87DEFAC54F8C00D8C91769@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-6-andrew@aj.id.au>
In-Reply-To: <20210319062752.145730-6-andrew@aj.id.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39db4913-7007-42e8-719c-08d8f8c23192
x-ms-traffictypediagnostic: HK2PR0601MB1907:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR0601MB19079902AE772104EEAA392A91769@HK2PR0601MB1907.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kcSIcpv326F/OweXceZHQGBJ+MvNQY4wo1ozIvJevebmQEXQS4RdBTwueUlxLioNNmOSygCHD3CuR/RJGY3YzcW6mgABws0YTqxU1AtdAAhWx9L3U387rTZsa4S77mL2OTcMfPob22iSfhX13B3s/RxXTyAURXQJOMw0W4BeNab3r8iw3wActpQ9ShJaj81qk6OiARi/Zeeq7fQDoyR1z8PRj+msKD5d59LrBb9THJ4p67XTFM0dFh30tS+z+uuVAruIkBuPW9giFRoeP/ErQ9WsIZcy91x0cBqmuuREBhNtgP+ZEuV8+n9Aet48xxbzqAjsAPCUeqbl/UJ/sgHnPhsqCRjWr331iObbDZQDmBycEMGzOC9BXq3yZCGBEEDEpiJb6n3WFQpD1xR/DQgoQqUYIUBZp8DnNiSCIzS1Si7LwnN6fd4SBNGbiYh6PYmCuXNCJG8Cv17JdJzQ/vbC4StlYW1iMdFlas4wGF/ilK3e61zljdBASBB6j77Ajgy4+ou/swCF+6msDQH8YyK7MOobCGup6SZc6o4JT0KUC8Xekdm6yzxjU+PTUo5vqJpgA29AoiCgqTp7BoAMU3mleV2DSynooOrIg3VIZ+tvAF/hJ3unGqu+TNXdJugFeUYBPyCV2zba7HCb0RqiwFln1kHQ1dW6/9jf8MHgZcCCxlw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(366004)(396003)(39840400004)(136003)(6506007)(66946007)(66446008)(38100700001)(52536014)(55016002)(55236004)(76116006)(9686003)(4326008)(8676002)(7416002)(8936002)(33656002)(86362001)(316002)(5660300002)(71200400001)(7696005)(478600001)(110136005)(186003)(54906003)(83380400001)(66476007)(26005)(66556008)(2906002)(64756008)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?nLXZ4Bq0fRNDp4Zmz71lKW8wp5Ujlmvem0gdTFHnnUzEtSFwLRRJy5fLhTFd?=
 =?us-ascii?Q?ThZNg7HUOq5yV4q4HYum00IEZM4OLeD43GXooZjLGaPvy28cRsaRS9eXW9dm?=
 =?us-ascii?Q?UTzfQRd88V+08097vnX2UvZ+6WlGOKMlP2wuP0UMP1woJXl853luo00LXAvu?=
 =?us-ascii?Q?q2AMy3G93izBoxflVNLQ5tp7hwqXvOytXRGFlUkfGOoiTzv9EvgFmGbpAdTn?=
 =?us-ascii?Q?3OaC+hQk11SBgOOddxpzx65C4kVd3IfjjCaifLT1JWuOnILdqj3MjHP5jQI0?=
 =?us-ascii?Q?W8xGWPmJlA6WbNR+jxJNJMBmAVGTvutCEmyEtF1y7riWY59syZAbitqTuoBy?=
 =?us-ascii?Q?EYZAcd4rl74bG7bh8CcnEs9IgVFAeXhtv0VA3oqK+ovQVPFqCPoPyDPN1a1g?=
 =?us-ascii?Q?5Zo1ZwaumhPzODxo32A+HdBm6qJvHBT4w+az4JRFdHSOSvHjoPQDHp0C0wBw?=
 =?us-ascii?Q?jJVzDQDy9ma2C74OlumMTPyuRF4kBYOPTStVEFjLyVd7kdndhEKTP4g+l4AG?=
 =?us-ascii?Q?tTHCdHHi/XHuKjS4h+ab5e7cG381jCTrcIXQ89g8Duxy/khlGLpFBhFAI6ph?=
 =?us-ascii?Q?9akeZxrIQzvn+tGXZzgNWRmd6tttdgppygTiYVarKs6q5RK53lWtGWBXypwn?=
 =?us-ascii?Q?oyhSvzzJT3R0Q6ZEK+7C3h2Fa6Lh3fxVJeaILGT+Nk0GX2l6LMOl9N1qlMUx?=
 =?us-ascii?Q?XoxqK/A58lZ+YHrYy2fdINy16U7lpvaqqztX2AzpB/WKQaFMNb/p3pcIBd8m?=
 =?us-ascii?Q?PPT8tZEsftk/2ZXEz9mioQbyn2KwMkmVSbq9Eu/MfY4srEzAphZ3rsOR3Sxa?=
 =?us-ascii?Q?c4aZgI29QaobhOWUQ5gow92DcWlwq6YOjYO+B8e9iCMGZNIOENse/p8vbhez?=
 =?us-ascii?Q?XCZ66z1BQkP0REXY2RW4OeZ+TpfnsHoDr387YCNll+qsyY8SPUnY1TTTqmMx?=
 =?us-ascii?Q?Q641QYm9pgSgubhi7zdX8Xn0Y291QlFk0MlgTva0oNeCfymMvFIdxukzvj86?=
 =?us-ascii?Q?pS2dSujY0tFywoMHYXKo2N+qV5M8iLbQj/LttWiZb4KPZm9d7RzYg2xBtmLX?=
 =?us-ascii?Q?PkN2QKVbqTjeVud0TprJMlkgq0tyt3VdHGJDTQoWHqTMBs7sp8Vtfwp9UKD0?=
 =?us-ascii?Q?0JVg15lWTYKp+W0hTfbZ/myWrod/uLnym4fXahuA0fntopAE5prAj9ll0g2f?=
 =?us-ascii?Q?1ZSfyiizI3Dkg8k3BmpmI9nSog4oruvBzBkuSAwIQPp97Z6DZcM7fUrdMC1O?=
 =?us-ascii?Q?RmKEmTrPYXgrXLFBvDHGWTAXCG5zdJQ0ugW1aGWstJS4VbKcbmRCwIC7S53n?=
 =?us-ascii?Q?Wr7r7xVjIDM/uSuNtGPgbKTD?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39db4913-7007-42e8-719c-08d8f8c23192
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2021 06:07:01.0410 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Q9XqE/i7cF4LS5PVSI4FmkbGuxSqt0JBI2Ve7XZxYJIn0NKChfJJJh8/GKIrNXQJyJAeSszSdLBjz2OegGqLVK1ePQ9UwG2vs7p3LZ+Uw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0601MB1907
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

I have tried this patch on Intel EGS CRB with AST2600 A1 as the BMC.
Chiawei

Tested-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>

> -----Original Message-----
> From: Andrew Jeffery <andrew@aj.id.au>
> Sent: Friday, March 19, 2021 2:28 PM
> To: openipmi-developer@lists.sourceforge.net; openbmc@lists.ozlabs.org;
> minyard@acm.org
>=20
> Unpack and remove the aspeed_kcs_probe_of_v[12]() functions to aid
> rearranging how the private device-driver memory is allocated.
>=20
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/char/ipmi/kcs_bmc_aspeed.c | 146 ++++++++++++++---------------
>  1 file changed, 68 insertions(+), 78 deletions(-)
>=20
> diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c
> b/drivers/char/ipmi/kcs_bmc_aspeed.c
> index eefe362f65f0..061f53676206 100644
> --- a/drivers/char/ipmi/kcs_bmc_aspeed.c
> +++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
> @@ -13,6 +13,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> +#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/poll.h>
>  #include <linux/regmap.h>
> @@ -63,6 +64,10 @@ struct aspeed_kcs_bmc {
>  	struct regmap *map;
>  };
>=20
> +struct aspeed_kcs_of_ops {
> +	int (*get_channel)(struct platform_device *pdev);
> +	int (*get_io_address)(struct platform_device *pdev); };
>=20
>  static u8 aspeed_kcs_inb(struct kcs_bmc *kcs_bmc, u32 reg)  { @@ -231,13
> +236,10 @@ static const struct kcs_ioreg
> ast_kcs_bmc_ioregs[KCS_CHANNEL_MAX] =3D {
>  	{ .idr =3D LPC_IDR4, .odr =3D LPC_ODR4, .str =3D LPC_STR4 },  };
>=20
> -static struct kcs_bmc *aspeed_kcs_probe_of_v1(struct platform_device
> *pdev)
> +static int aspeed_kcs_of_v1_get_channel(struct platform_device *pdev)
>  {
> -	struct aspeed_kcs_bmc *priv;
>  	struct device_node *np;
> -	struct kcs_bmc *kcs;
>  	u32 channel;
> -	u32 slave;
>  	int rc;
>=20
>  	np =3D pdev->dev.of_node;
> @@ -245,105 +247,78 @@ static struct kcs_bmc
> *aspeed_kcs_probe_of_v1(struct platform_device *pdev)
>  	rc =3D of_property_read_u32(np, "kcs_chan", &channel);
>  	if ((rc !=3D 0) || (channel =3D=3D 0 || channel > KCS_CHANNEL_MAX)) {
>  		dev_err(&pdev->dev, "no valid 'kcs_chan' configured\n");
> -		return ERR_PTR(-EINVAL);
> +		return -EINVAL;
>  	}
>=20
> -	kcs =3D kcs_bmc_alloc(&pdev->dev, sizeof(struct aspeed_kcs_bmc),
> channel);
> -	if (!kcs)
> -		return ERR_PTR(-ENOMEM);
> +	return channel;
> +}
>=20
> -	priv =3D kcs_bmc_priv(kcs);
> -	priv->map =3D syscon_node_to_regmap(pdev->dev.parent->of_node);
> -	if (IS_ERR(priv->map)) {
> -		dev_err(&pdev->dev, "Couldn't get regmap\n");
> -		return ERR_PTR(-ENODEV);
> -	}
> +static int aspeed_kcs_of_v1_get_io_address(struct platform_device
> +*pdev) {
> +	u32 slave;
> +	int rc;
>=20
> -	rc =3D of_property_read_u32(np, "kcs_addr", &slave);
> -	if (rc) {
> +	rc =3D of_property_read_u32(pdev->dev.of_node, "kcs_addr", &slave);
> +	if (rc || slave > 0xffff) {
>  		dev_err(&pdev->dev, "no valid 'kcs_addr' configured\n");
> -		return ERR_PTR(-EINVAL);
> +		return -EINVAL;
>  	}
>=20
> -	kcs->ioreg =3D ast_kcs_bmc_ioregs[channel - 1];
> -	aspeed_kcs_set_address(kcs, slave);
> -
> -	return kcs;
> -}
> -
> -static int aspeed_kcs_calculate_channel(const struct kcs_ioreg *regs) -{
> -	int i;
> -
> -	for (i =3D 0; i < ARRAY_SIZE(ast_kcs_bmc_ioregs); i++) {
> -		if (!memcmp(&ast_kcs_bmc_ioregs[i], regs, sizeof(*regs)))
> -			return i + 1;
> -	}
> -
> -	return -EINVAL;
> +	return slave;
>  }
>=20
> -static struct kcs_bmc *aspeed_kcs_probe_of_v2(struct platform_device
> *pdev)
> +static int aspeed_kcs_of_v2_get_channel(struct platform_device *pdev)
>  {
> -	struct aspeed_kcs_bmc *priv;
>  	struct device_node *np;
>  	struct kcs_ioreg ioreg;
> -	struct kcs_bmc *kcs;
>  	const __be32 *reg;
> -	int channel;
> -	u32 slave;
> -	int rc;
> +	int i;
>=20
>  	np =3D pdev->dev.of_node;
>=20
>  	/* Don't translate addresses, we want offsets for the regmaps */
>  	reg =3D of_get_address(np, 0, NULL, NULL);
>  	if (!reg)
> -		return ERR_PTR(-EINVAL);
> +		return -EINVAL;
>  	ioreg.idr =3D be32_to_cpup(reg);
>=20
>  	reg =3D of_get_address(np, 1, NULL, NULL);
>  	if (!reg)
> -		return ERR_PTR(-EINVAL);
> +		return -EINVAL;
>  	ioreg.odr =3D be32_to_cpup(reg);
>=20
>  	reg =3D of_get_address(np, 2, NULL, NULL);
>  	if (!reg)
> -		return ERR_PTR(-EINVAL);
> +		return -EINVAL;
>  	ioreg.str =3D be32_to_cpup(reg);
>=20
> -	channel =3D aspeed_kcs_calculate_channel(&ioreg);
> -	if (channel < 0)
> -		return ERR_PTR(channel);
> -
> -	kcs =3D kcs_bmc_alloc(&pdev->dev, sizeof(struct aspeed_kcs_bmc),
> channel);
> -	if (!kcs)
> -		return ERR_PTR(-ENOMEM);
> -
> -	kcs->ioreg =3D ioreg;
> -
> -	priv =3D kcs_bmc_priv(kcs);
> -	priv->map =3D syscon_node_to_regmap(pdev->dev.parent->of_node);
> -	if (IS_ERR(priv->map)) {
> -		dev_err(&pdev->dev, "Couldn't get regmap\n");
> -		return ERR_PTR(-ENODEV);
> +	for (i =3D 0; i < ARRAY_SIZE(ast_kcs_bmc_ioregs); i++) {
> +		if (!memcmp(&ast_kcs_bmc_ioregs[i], &ioreg, sizeof(ioreg)))
> +			return i + 1;
>  	}
>=20
> -	rc =3D of_property_read_u32(np, "aspeed,lpc-io-reg", &slave);
> -	if (rc)
> -		return ERR_PTR(rc);
> +	return -EINVAL;
> +}
>=20
> -	aspeed_kcs_set_address(kcs, slave);
> +static int aspeed_kcs_of_v2_get_io_address(struct platform_device
> +*pdev) {
> +	uint32_t slave;
> +	int rc;
>=20
> -	return kcs;
> +	rc =3D of_property_read_u32(pdev->dev.of_node, "aspeed,lpc-io-reg",
> &slave);
> +	if (rc || slave > 0xffff)
> +		return -EINVAL;
> +
> +	return slave;
>  }
>=20
>  static int aspeed_kcs_probe(struct platform_device *pdev)  {
> +	const struct aspeed_kcs_of_ops *ops;
>  	struct device *dev =3D &pdev->dev;
>  	struct kcs_bmc *kcs_bmc;
>  	struct device_node *np;
> -	int rc;
> +	int rc, channel, addr;
>=20
>  	np =3D dev->of_node->parent;
>  	if (!of_device_is_compatible(np, "aspeed,ast2400-lpc-v2") && @@
> -352,23 +327,28 @@ static int aspeed_kcs_probe(struct platform_device
> *pdev)
>  		dev_err(dev, "unsupported LPC device binding\n");
>  		return -ENODEV;
>  	}
> -
> -	np =3D dev->of_node;
> -	if (of_device_is_compatible(np, "aspeed,ast2400-kcs-bmc") ||
> -	    of_device_is_compatible(np, "aspeed,ast2500-kcs-bmc"))
> -		kcs_bmc =3D aspeed_kcs_probe_of_v1(pdev);
> -	else if (of_device_is_compatible(np, "aspeed,ast2400-kcs-bmc-v2") ||
> -		 of_device_is_compatible(np, "aspeed,ast2500-kcs-bmc-v2"))
> -		kcs_bmc =3D aspeed_kcs_probe_of_v2(pdev);
> -	else
> +	ops =3D of_device_get_match_data(&pdev->dev);
> +	if (!ops)
>  		return -EINVAL;
>=20
> -	if (IS_ERR(kcs_bmc))
> -		return PTR_ERR(kcs_bmc);
> +	channel =3D ops->get_channel(pdev);
> +	if (channel < 0)
> +		return channel;
>=20
> +	kcs_bmc =3D kcs_bmc_alloc(&pdev->dev, sizeof(struct aspeed_kcs_bmc),
> channel);
> +	if (!kcs_bmc)
> +		return -ENOMEM;
> +
> +	kcs_bmc->ioreg =3D ast_kcs_bmc_ioregs[channel - 1];
>  	kcs_bmc->io_inputb =3D aspeed_kcs_inb;
>  	kcs_bmc->io_outputb =3D aspeed_kcs_outb;
>=20
> +	addr =3D ops->get_io_address(pdev);
> +	if (addr < 0)
> +		return addr;
> +
> +	aspeed_kcs_set_address(kcs_bmc, addr);
> +
>  	rc =3D aspeed_kcs_config_irq(kcs_bmc, pdev);
>  	if (rc)
>  		return rc;
> @@ -400,11 +380,21 @@ static int aspeed_kcs_remove(struct
> platform_device *pdev)
>  	return 0;
>  }
>=20
> +static const struct aspeed_kcs_of_ops of_v1_ops =3D {
> +	.get_channel =3D aspeed_kcs_of_v1_get_channel,
> +	.get_io_address =3D aspeed_kcs_of_v1_get_io_address, };
> +
> +static const struct aspeed_kcs_of_ops of_v2_ops =3D {
> +	.get_channel =3D aspeed_kcs_of_v2_get_channel,
> +	.get_io_address =3D aspeed_kcs_of_v2_get_io_address, };
> +
>  static const struct of_device_id ast_kcs_bmc_match[] =3D {
> -	{ .compatible =3D "aspeed,ast2400-kcs-bmc" },
> -	{ .compatible =3D "aspeed,ast2500-kcs-bmc" },
> -	{ .compatible =3D "aspeed,ast2400-kcs-bmc-v2" },
> -	{ .compatible =3D "aspeed,ast2500-kcs-bmc-v2" },
> +	{ .compatible =3D "aspeed,ast2400-kcs-bmc", .data =3D &of_v1_ops },
> +	{ .compatible =3D "aspeed,ast2500-kcs-bmc", .data =3D &of_v1_ops },
> +	{ .compatible =3D "aspeed,ast2400-kcs-bmc-v2", .data =3D &of_v2_ops },
> +	{ .compatible =3D "aspeed,ast2500-kcs-bmc-v2", .data =3D &of_v2_ops },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, ast_kcs_bmc_match);
> --
> 2.27.0

