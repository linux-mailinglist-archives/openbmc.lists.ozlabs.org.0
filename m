Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9390D446D4D
	for <lists+openbmc@lfdr.de>; Sat,  6 Nov 2021 11:02:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HmXwr3LK4z2yxm
	for <lists+openbmc@lfdr.de>; Sat,  6 Nov 2021 21:02:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=pafACHs3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.129;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=chin-ting_kuo@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=pafACHs3; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320129.outbound.protection.outlook.com [40.107.132.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HmXwF75Szz2xtQ;
 Sat,  6 Nov 2021 21:01:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdoknI4c0byry3G3oiRx8Hj/PhatwD2e5YUy4ICRLiOdzbd04Hf0QtXjilPHzlbrmsToSBL2M7jkRwAp29832el5lFv2fMKydDtJjFTgLTHPFWQLyhoR7Le5e/3F7vDFZxodIxZxSludI2byjxV9uLkpwCQMhGdmME2JGTmSgecayFmg4mYui5nZwTH0GYJbBy7Lo9hilUg4u3wSh0KUQUWaotLkBiA6X0TrVYVcYC4wn53lR8dBpwtMrNiVkiDFXct7gY+LWGjcGlhflgUlED7kmQcT51Y0ryw3Mx5J/pI/u3HedahDZ687waWZguyFrf1hNMHR8bWYMvaeh7g66w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NNPXi/kelSEt6iiMVQhAO+u0I/JiQFC7CbPCLYaCr3Q=;
 b=nT5pnDAdTPyi8tjVPcLmJ9qXUmL+o1n4hwUr7oZ2i+xkY/IBim3QeOiNkY/1WZkkAOAyIB7TNqyv6Ud9l3AUh6wrZdzXGDyY7Kwhln3PGB3f9UpCIOLusFUHovyFsSBIUxfQkKfcvC8abqI0UIamkW+9/GBz9Qwnmrmx1dEtz3fusQphn+iI0Krrqfs+KU31froqAFzibJ4hc+hxG/pEtE25JRpFC2YYheOh7YGprDBadciUd2OvG+uOiuqJrizRE+QxOCrbfX57mxWjUEn0b7/Ns2WWxCXMhei0Z9o9MCL9cTUn7G7jG2SK2JFdBvJlCBSTmvSBf7goM7IMXrHCRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNPXi/kelSEt6iiMVQhAO+u0I/JiQFC7CbPCLYaCr3Q=;
 b=pafACHs3jLfpSr+QqncxlXXpi8gmrc3Ro9q7Q1jqlb3MIcDlMQgyYqkg6UP67Ftm9MQtIVtB0HfxGNtgM3oxP1ssuAsS8ir9BhSVD006lse7kDPn2uTU68cuxQFaX8Y1pz27Tcm45omZSg04NaHout6bvMTJvLKgzP0jbciKdH1wplpdVrFoeiLupF0/ODyNZ9sh3zuImLCoAWnP5ICewvXxIwQghZxTGtVcdKIuZ9Orb7U6hPooEI2s+CaevCttS+tnEAq3GRjld3NcEkzvtLHYAHlmYxDUz39shdYsOKk27CJcYqCX5eZeEkmf4SAse8G9wS6VRUZ6QofCVvM4fA==
Received: from HK0PR06MB2786.apcprd06.prod.outlook.com (2603:1096:203:5b::22)
 by HK0PR06MB2257.apcprd06.prod.outlook.com (2603:1096:203:43::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Sat, 6 Nov
 2021 10:01:23 +0000
Received: from HK0PR06MB2786.apcprd06.prod.outlook.com
 ([fe80::399b:41fb:d745:beb0]) by HK0PR06MB2786.apcprd06.prod.outlook.com
 ([fe80::399b:41fb:d745:beb0%5]) with mapi id 15.20.4669.013; Sat, 6 Nov 2021
 10:01:23 +0000
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, linux-mmc
 <linux-mmc@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>
Subject: RE: [PATCH 02/10] sdhci: aspeed: Add SDR50 support
Thread-Topic: [PATCH 02/10] sdhci: aspeed: Add SDR50 support
Thread-Index: AQHXygDgYvIRiYrxv0eZsBMlnzAipqv2RD3A
Date: Sat, 6 Nov 2021 10:01:23 +0000
Message-ID: <HK0PR06MB27868D14ED8DF7550246674CB28F9@HK0PR06MB2786.apcprd06.prod.outlook.com>
References: <20210922103116.30652-1-chin-ting_kuo@aspeedtech.com>
 <20210922103116.30652-3-chin-ting_kuo@aspeedtech.com>
 <125453f3-55d5-4b2a-afe8-6e76b268ce01@www.fastmail.com>
In-Reply-To: <125453f3-55d5-4b2a-afe8-6e76b268ce01@www.fastmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d1cbf56-cf48-4668-f380-08d9a10c63eb
x-ms-traffictypediagnostic: HK0PR06MB2257:
x-microsoft-antispam-prvs: <HK0PR06MB225750B4BCC263D8A8574799B28F9@HK0PR06MB2257.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /q3MqqTpxX2vujLsuSg3YPMzL9dsZPXWYAQWIRBXMB6ZozDH+fewCSUZ2fvi4mTSpZl9p3QSqcIJzoj2O7uVHcSj+WYb+A+xXbNkqeqtzFoP9NDEAhaeSCkBcF3eQPQWL46duq8x6zTfgwXr5NxOXhBWuqS90tSFh7TlOQeH/792+VlxclvZPO8ZKl+uJ2tfZ14x4QJDNcNHzZkei6wL33F/gEOl6RfkkhCU0yeBNL6xc5aGhvD9Ctxs/foZndy48sHnFS90uXubS0F6wE2GyQwveyFqwZKpkh+xcVceVGkvWpxJ/yngkBloZBeX1dAZSHAYXJi+7eK7LnBL8ZTW9VfzJSNaEbQeJukYUQ0LBE0zImuBUFpJv7t5g72LlznxBzqvB8Ekx1oozGJWoadOaFnoJLj0hetd5FhuPXfEKt6adwC/k/gzDstjijE6VrpKW7WHI4xGksaznV4q+/a78A1Iyjk64rtZx72SDp+dEG6n67vC4JOTL/N1Y8L4pLmfOE0HtXwHvvhf864pK7x/aEhIyhiF0aMH1bnCuXl/QjQEtarpML1PhLcd8ch9uDG63jnA8LKfvV8nzvO26LIN6y5tttZ3KQixvYx4mRbKfZgIbUfovWZv5QLopIs/sCHy9fvMrWnfn0sP6DfqbYmYvVJbmL5RycHAEZACOQxYKUDjByHucfMhy32xI+eaYbrIJ9ilt6mtJFzPqvrRVK7X5m30mCmR//KWnHqcZVVBp1M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB2786.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(136003)(39830400003)(346002)(396003)(66556008)(26005)(52536014)(66476007)(316002)(66446008)(54906003)(64756008)(5660300002)(110136005)(86362001)(6506007)(4326008)(53546011)(921005)(2906002)(76116006)(71200400001)(38100700002)(38070700005)(122000001)(186003)(33656002)(83380400001)(7416002)(55016002)(8936002)(66946007)(107886003)(8676002)(7696005)(9686003)(508600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aT2DSeTaCUB8t2RUCcufWLeUXm5jX3qFgJC0LyehmaujEXHvo9oCnl89QltV?=
 =?us-ascii?Q?5Bk6dC43kLPwptIwY6NB1yyFUFi0Wua5mED17PwUvKMjh+4M1oz4ZRlqh1Aa?=
 =?us-ascii?Q?54lFV5XH/zuf4CrJHrvCoB3xo21kp17MzvsebDYKrUibTpi7m322OgFAC4yg?=
 =?us-ascii?Q?E9MN71brLmdC0KM0GQI/KYsqgti1R4zvhaAFiaANKtfa4K1Z8wNfnxcmB7/7?=
 =?us-ascii?Q?wOppgukP59+wQuw+qd0djd6gufuThMw8FY2U2Wbpq6e4O/tlYcoOGpiNa2z3?=
 =?us-ascii?Q?p3vgbVlZdh5cgArxCd3ab1bFU+OqF3MMH+rCYLePiie1o5U2hMJZVpL8aTis?=
 =?us-ascii?Q?dunRilJN3GAzRUEcwlkdKDTGWW++KjJIWB9naDB/o0JC3uPfciT7J7l3UN1V?=
 =?us-ascii?Q?sa1Mo+GKp+1Io4Lj0lQqJxuSufKkVlKcQgYdvA4YjCwm3GbXiQE9JPSF1RV4?=
 =?us-ascii?Q?lyjCF2lk6COBTFJuZ50zWsGiGVTBq7H+0y5T4p5ViTHKpFvSD71f3H/XxmoX?=
 =?us-ascii?Q?ut0FX0X7Qf6PtkK9KpxET9zCLV23Z5iyr+huEdBEp2ap7aqAkXy/wom+tgci?=
 =?us-ascii?Q?k+Q6U6TEsnW5sd0oscuEvK44nLI7z8kMIoq+RDQVe1Ljj7hUVEpW2JITzxIg?=
 =?us-ascii?Q?X41TAvadPPnfiSxvOO/uGXVAsa5LM0yoypcyFq7rHCF5ZcB2sXTU275x+iHX?=
 =?us-ascii?Q?rv3+/ybzRihF8svkA/FL6xDbbxRJQBPR6aW+t8CVXcjYeSWSf+Jrpo5jS7tI?=
 =?us-ascii?Q?n1kjhZH+eCkR4VY/vChz8akEzHhXqMXKkI8k+ZJ5CQeHbkVGWAbP7HpUAhz0?=
 =?us-ascii?Q?FHTjqYd5m7VasAeF+HqlYwQB/5tVt/YMtcCAkLehhmieXI344AIbbbbI7RCV?=
 =?us-ascii?Q?uXck1n+yM8gWybrb5e8xDxO1JmB894xhgYKsZbbZqqchamKJ2rnTkxWxs4QZ?=
 =?us-ascii?Q?8Dm6+oz+r+D6vSkq9Vfha5KAOFnjLBjAAC/rzJxs3rg37wphK6N6oo2eAi5+?=
 =?us-ascii?Q?BIvpLZt5su4HSGIhEATr2minKGJzQm/xgks36nHFIkZ0jofyYK0gWacMXXID?=
 =?us-ascii?Q?Bhx5nlbsgh2p3vcyuM5we6987c7fSd/fQwMoE3KmePPrcWePqKJwVyjGFNZg?=
 =?us-ascii?Q?/QHGw0yCL8t+Tp9NM0BXfiyZ80vcHj63yVwiIpCpjUUzfFQ2gCOXkKC0YwlC?=
 =?us-ascii?Q?3wIWOUI0awskkVMxoCTyieY6yroDQKYySJnWtldMrXzm//6ptZa1ef5a3QtJ?=
 =?us-ascii?Q?dwtJk/1R1f5YDK8kl9eFT8payasGHzI9rHRM8dJoH9w7z3VCcgavqrQk8jqZ?=
 =?us-ascii?Q?nHsi7z+pxfW8mcziYiyfYBwbolGtQQGcNwi5kUWvpxvWjW0zzW22ygazSFGe?=
 =?us-ascii?Q?0O+2L1bo2AZH142Ltk/DJKdSkseSnVR80nKLaF/2Dy5FNWS3HMNMH/Xz7gVP?=
 =?us-ascii?Q?CSRhuNm9Omk7GNvHwIpZIWzGWYEDU3botNJ9K9LNzIQXz8Xa+8hNGFi+qTwE?=
 =?us-ascii?Q?Ha+q5UyAV8NEBnz0/LvGj4Wa6efWUjh9ZjvzxTT18yQj13i/WvrA11LZ+z/L?=
 =?us-ascii?Q?0PZwVCGpb2+j6XA4vAbUJ5wiqrvJenOtr5lIjs30gyDd80WPTEuIvHpZ67Ed?=
 =?us-ascii?Q?yeLL1MtP2jQmeIDmT7AUZ2WWp+ZLCytjHJC29D5R8dsKISp2nYwv5VVarFti?=
 =?us-ascii?Q?8tPViw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB2786.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d1cbf56-cf48-4668-f380-08d9a10c63eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2021 10:01:23.4364 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v60szUVETU1ZPbdbllHajRGh66P7qQ9fegJRw8jRGFZPdcYLe4t8orPiHpXuPjqb2PR8f5jaE265ga5nufxFma7U9OZfAIwMYV0f3IaKViY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2257
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>, Steven Lee <steven_lee@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,

Thanks for the review.

> -----Original Message-----
> From: Andrew Jeffery <andrew@aj.id.au>
> Sent: Tuesday, October 26, 2021 8:31 AM
> Subject: Re: [PATCH 02/10] sdhci: aspeed: Add SDR50 support
>=20
> Hi Chin-Ting,
>=20
> Sorry for the delay in looking at your series.
>=20
> On Wed, 22 Sep 2021, at 20:01, Chin-Ting Kuo wrote:
> > From the analog waveform analysis result, SD/SDIO controller of
> > AST2600 cannot always work well with 200MHz. The upper bound stable
> > frequency for SD/SDIO controller is 100MHz. Thus, SDR50 supported bit,
> > instead of SDR104, in capability 2 register should be set in advance.
> >
> > Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> > ---
> >  drivers/mmc/host/sdhci-of-aspeed.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/mmc/host/sdhci-of-aspeed.c
> > b/drivers/mmc/host/sdhci-of-aspeed.c
> > index 6e4e132903a6..c6eaeb02e3f9 100644
> > --- a/drivers/mmc/host/sdhci-of-aspeed.c
> > +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> > @@ -35,6 +35,8 @@
> >  #define ASPEED_SDC_CAP1_1_8V           (0 * 32 + 26)
> >  /* SDIO{14,24} */
> >  #define ASPEED_SDC_CAP2_SDR104         (1 * 32 + 1)
> > +/* SDIO{14,24} */
>=20
> I don't think we need to duplicate this comment.

Okay, it will be modified in the next patch version.

>=20
> > +#define ASPEED_SDC_CAP2_SDR50          (1 * 32 + 0)
>=20
> Can we keep the defines in increasing bit order (i.e. put
> ASPEED_SDC_CAP2_SDR50 above ASPEED_SDC_CAP2_SDR104)?
>=20

Okay.

> >
> >  struct aspeed_sdc {
> >  	struct clk *clk;
> > @@ -410,11 +412,17 @@ static int aspeed_sdhci_probe(struct
> > platform_device *pdev)
> >  	sdhci_get_of_property(pdev);
> >
> >  	if (of_property_read_bool(np, "mmc-hs200-1_8v") ||
> > +		of_property_read_bool(np, "sd-uhs-sdr50") ||
>=20
> Minor formatting issue, but can you make sure all the conditions are alig=
ned
> vertically from the left?
>=20

It will also be updated in the next patch version.

> >  	    of_property_read_bool(np, "sd-uhs-sdr104")) {
> >  		aspeed_sdc_set_slot_capability(host, dev->parent,
> ASPEED_SDC_CAP1_1_8V,
> >  					       true, slot);
> >  	}
> >
> > +	if (of_property_read_bool(np, "sd-uhs-sdr50")) {
> > +		aspeed_sdc_set_slot_capability(host, dev->parent,
> ASPEED_SDC_CAP2_SDR50,
> > +					       true, slot);
> > +	}
> > +
> >  	if (of_property_read_bool(np, "sd-uhs-sdr104")) {
> >  		aspeed_sdc_set_slot_capability(host, dev->parent,
> ASPEED_SDC_CAP2_SDR104,
> >  					       true, slot);
> > --
> > 2.17.1

Chin-Ting
