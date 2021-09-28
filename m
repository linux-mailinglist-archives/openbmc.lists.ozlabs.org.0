Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C67DF41A5BB
	for <lists+openbmc@lfdr.de>; Tue, 28 Sep 2021 04:52:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJPDj4rfyz2yPd
	for <lists+openbmc@lfdr.de>; Tue, 28 Sep 2021 12:52:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=hY5UmVvy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.131.135;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=chin-ting_kuo@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=hY5UmVvy; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310135.outbound.protection.outlook.com [40.107.131.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJPCT56yxz2xb2;
 Tue, 28 Sep 2021 12:51:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iuw0g3tnt6K4P9XraLjYq56+4JBW4o2UKcEsIYVxMwhnkXcqPv8v+SsLWFANI9I8UnFCS4QzWXHrKZ2cl2C5uhFXe9deveKkCFw5suZQO1s+W8RO8b2IFCDdqRT+CPItxAlpgUn/rrOTZFHD3jIvzohtcEO/jbLl+qOmXyQ6ZUoIlG5H5Dd+I31OqGQExEouM0k955IZj62ABNJQZV6XV8EJ4llrnexdcMw7EktxEjRyl/W8kt8B11O5jH56HREKXqRhD9NpcmSW5i8EPt0U4ARNZ2li6h3AU/nJuvZNOS09LeGBW5bdcLpV4SJXD8aqnw/0fQzc5XNMCqRMGwCKzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=aGY4IyE1yM6Cv4Yt2uOnLZX3xff1d0XwN8/gP/Qy/U4=;
 b=XY4er9a1P5bzXbcGF1p9FyKu/2AAp2as5YD7komP2Lk5P+llp1yVFyRM/FW9TS5X28gYcuFLw2TvSejaeHYgzFxiw3bqsVC4H2OOUEFvbV7pAjpItREbTSGiXy/MZEfePbbkC8v483d/IMzeMz6VhtvLsUAt8hSjxv1vHfDYhbEPcLqyvMOVWA9UZHGNZ1xDsGNIUepKyqcq93FMhV90M09I4mMKvy9nH6guBdQQ0xko95M0DQD0vzpSEixvne2IYe083Jby7pa/7YRmV8cAx+dQMF1ZsPmJ55H9GuVPjuGzPsebhiKrjiWz/QScnB0bnyV8+xZ+rFvBOqhBdjA/zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aGY4IyE1yM6Cv4Yt2uOnLZX3xff1d0XwN8/gP/Qy/U4=;
 b=hY5UmVvy+SIcx1nnn7CRAsj1Nu6PBFJESQYsMKN6bB22kuq7PKe5vp93QwjazHuTdmPj1P1hTMTI/XSXn37E9z3uAWrQk44qr/qUsrPwLu+60JKGG59GpJpYOG5KXBQS4OOZ3q5IzTZjAYWqzn4Gd5k6YenCXGk59cI/3zU3Jk0RnvuzNbuejXAWVewVKZwXViZ/29PJ5RtLt68p8Nrr1Hdu1OwXohnESzEe2EFVsUtddlrrg1gE3lJx73lSoqBiXIuJAP2l7sf4upq7UHqWPJ5RNA7cruUXSp+45cYtIVaKmcxLukZerFyRTJunk4IDuHp4nsRiWGme+V6v/5N/Ag==
Received: from HK0PR06MB2786.apcprd06.prod.outlook.com (2603:1096:203:5b::22)
 by HK0PR06MB2195.apcprd06.prod.outlook.com (2603:1096:203:4a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 28 Sep
 2021 02:50:59 +0000
Received: from HK0PR06MB2786.apcprd06.prod.outlook.com
 ([fe80::ddf1:e9d4:c209:8ab8]) by HK0PR06MB2786.apcprd06.prod.outlook.com
 ([fe80::ddf1:e9d4:c209:8ab8%7]) with mapi id 15.20.4544.022; Tue, 28 Sep 2021
 02:50:59 +0000
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [PATCH 10/10] dt-bindings: mmc: aspeed: Add a new compatible
 string
Thread-Topic: [PATCH 10/10] dt-bindings: mmc: aspeed: Add a new compatible
 string
Thread-Index: AQHXs9HHr7TBfuGZLUCpoIBAXdEJGKu4upXg
Date: Tue, 28 Sep 2021 02:50:59 +0000
Message-ID: <HK0PR06MB2786DAAA2D6E58EA2E2FCB6BB2A89@HK0PR06MB2786.apcprd06.prod.outlook.com>
References: <20210922103116.30652-1-chin-ting_kuo@aspeedtech.com>
 <20210922103116.30652-11-chin-ting_kuo@aspeedtech.com>
 <YVIUf7/4ukMcrOb9@robh.at.kernel.org>
In-Reply-To: <YVIUf7/4ukMcrOb9@robh.at.kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 465dfa1e-915a-4d46-58b5-08d9822acd5e
x-ms-traffictypediagnostic: HK0PR06MB2195:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR06MB21953082A2C48B972C09A794B2A89@HK0PR06MB2195.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: or7yZVuU9PszheV3YKEKVjGJ7y4vu0n93xliIJEIvaH8Bz7Iil9iQ9evk2nOm4KUNFwR5nb45KOmSmI32yAt/el6P9n04QKvkrxTQNT/oXY0aEbHNgBOIqX2Eyca9fLg6Gm6/0yWxK2NUE7P/8EzAsjnqY0tsWfw9z1LM4uK6u/0wgxk7K7+xcnc5Q9amlujOae36jdxO5V1VeCP6OplKblW04O2p2gBg1BOaGcdivNKel2c/us3yAFJn+kpiD7y2KiV6S3Vl2LhEMykbfaan97AdcOQNkHr8+xrPajXYIgWhs7dk/y21TxCkbyPJpc1RTQ66HtqfN3+/YMVKyXxl1CyYAtsxh44Lg7XztBZb73ssbjyo8AhR87aVG6u/QrwtzyCk98HUoo/ZebpTt1AZI04IWo6r/JgPt5d9ij45rNWjceO0MZCfwspAf6EVnb6GeNnDR8TjuC/1i8A3ksPttSKGJ4ZWW8BH+8E+vL7o9hvRTydzgNhy5+wYwULffW+wUl++gIRCQAZ//stu7O9GOjRG0mNzfuHgGFhZ+dgK1VlGF2IAkwerf8XW8bP/nt8FUj20v6D3y0McQM4wj4C1aj7KdsXP9EvGx/VVL9v/rotfb/E7X+ZXc8a0VnGknHJ9uqKSN7Y6J5LbiiihNG0FPK1SyK+Ge2zUlke9VvcmIWmtMu3UKRJKtXs0mLH/ggppAiNyd6ZXNYs1JcpbjhQpw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB2786.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(396003)(136003)(39850400004)(346002)(122000001)(66476007)(8936002)(107886003)(54906003)(508600001)(52536014)(316002)(38100700002)(4326008)(64756008)(66446008)(6916009)(66556008)(53546011)(7696005)(83380400001)(76116006)(33656002)(38070700005)(66946007)(6506007)(186003)(5660300002)(8676002)(55016002)(9686003)(71200400001)(86362001)(2906002)(26005)(7416002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NtvveMHJqgixU9c5bS6Ll4+L6Lg94fR5ajr8eOiEvnnzL7JNQY9nk+ogiVsR?=
 =?us-ascii?Q?Xw8QkiYp3guocaX8k9d/5fZDgs9lB2v4Yl1QfFRM4gG43XTKh9Jwav+sIZA7?=
 =?us-ascii?Q?WhsbITt514tf4RLoyI+yTx95SvvL1PiRzUQqIAQS5+98zdhvWkHYT3q/az3h?=
 =?us-ascii?Q?wZbExYTvYAZ/GScVlnJuE8pVqpfJC7knuvZ9hRfqNd/U0eQkQn91stzkVRHv?=
 =?us-ascii?Q?xM4VlEF5YJFbzuWdEotW8K2H5QpCltclVDIAla7eof7BHw3wvsUPtGx3wjxb?=
 =?us-ascii?Q?wBNLpwcmwCywJ3Fq+dciiQISnKCLirXKhrul5XMiZXAs2gm3lCZVSWN5PDPp?=
 =?us-ascii?Q?U1x6yDOaQ3zsn6i926TaOzf0bhWwpd+DN5+DSdMOsJEgHbqPtkxPsMCJOxsn?=
 =?us-ascii?Q?bYdjxOorsHi/YF8sZ/CDUickZw9lShRJ3SOm/k+eL6sYokpxEx4GD50RcISH?=
 =?us-ascii?Q?WFiSWRP8AUSvT9+8bvpawow06IlUVBUyFDGDpOweRfuIJ6G5wKR0+ogDIYYp?=
 =?us-ascii?Q?5dqgc0Vntt2ulB2gSP2I836htnWiBrWiUqQ2FxvL0NztMnrPIguNBNRK2jpR?=
 =?us-ascii?Q?VCKy/VhAQzHpuOnFViBP8ioIsf7g0RSjPrPnRD6mEaCUd3TMGSuHak7dXheB?=
 =?us-ascii?Q?kJ1K+sQvseZC/uZEYH3LGMX9Lp4REFk055XIY/YK093iSGklcViyGhQG+78T?=
 =?us-ascii?Q?EBZY3nOojMHsnLqwNH7M28+wsPUbSp6pzU3xKshuS7oh3hKgKG9gI/ez9gb4?=
 =?us-ascii?Q?/mi5zA8gCtzY+SuyDSjiG9mQnGRmNlD3n/W3b4kr5CQkLTjrhzceeEABa3Y/?=
 =?us-ascii?Q?SOULsyQzn1d9x1IglYlSyuuwOtkxfFSaOSKWgWGmFN8RUwioGLMb5HW3jbNb?=
 =?us-ascii?Q?Zc9sivjgnLb45AbnAMhpMiGZ4YMOE7cks0MI3trPfoSjx4N1Ex8SHZC/yHLI?=
 =?us-ascii?Q?8GX6UIkgWbi1Jjzqe4GoPiGjhAmC50UlD5L3BWwLeDTLNCL/6ePAwoAYz5IV?=
 =?us-ascii?Q?bYHD+MOvQ4XhPyo1ZSkzKi/nhKlbq98pJIKO2+1la5LuT7NDW3Sx7NgE6j8M?=
 =?us-ascii?Q?WW6PK8HQ9ZZTdVsimg3r80iPrvRgFWe2IhgPK0t6k+iR/LNMOTB9zphM5yQE?=
 =?us-ascii?Q?lwLoqeUshcokfXQDGVeBEQja48XaySYbB5hgXhw/Fymq8PsW2eT4rMIt4826?=
 =?us-ascii?Q?mN15lSF9VcJlS3GKNcZIFaspuXQWc2JTxb0imxBrvigUt1I78FpTEU2FqfpX?=
 =?us-ascii?Q?eZB8huPRfvvTHA0qiauWZWoVn8LK6g94UGadNld4zRgYijWNsOZa01xoLAP7?=
 =?us-ascii?Q?UiE9RGyQM9uK+5FWP+4Q+Yps?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB2786.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 465dfa1e-915a-4d46-58b5-08d9822acd5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2021 02:50:59.4206 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mijmxmajQdQ5xN4Z8AzcLyI4Z/K/lDUhrFO6JsdeRe4AS1nnVKj0TG/8WQcoJQfL5d8pm7DHwxbQKGc3UyNbF0Mxv+4Kisi6xXph0oevZrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2195
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
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 BMC-SW <BMC-SW@aspeedtech.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rob,

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Tuesday, September 28, 2021 2:59 AM
> To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> Subject: Re: [PATCH 10/10] dt-bindings: mmc: aspeed: Add a new compatible
> string
>=20
> On Wed, Sep 22, 2021 at 06:31:16PM +0800, Chin-Ting Kuo wrote:
> > Add "aspeed,ast2600-emmc" compatible string for the sake of
> > distinguishing between SD and eMMC device.
>=20
> Why?
>=20
> Is the h/w block different? We already have properties to handle some of =
the
> eMMC specifics. Also, you can have a child node for the eMMC device if yo=
u
> need that.

There are two SD/SDIO controllers in a AST2600 SoC.
One is for SD card and the other is for eMMC.
Although both of them are embedded in the same SoC, the design of delay cel=
l and
the manufacture process are different. The delay phase is definitely differ=
ent and, thus,
we need a flag, compatible, to distinguish the device, SD or eMMC.

Without "aspeed,ast2600-emmc" compatible, of course, eMMC device can work w=
ith original
sdhci driver and device tree setting. But, for ultra-speed or HS200 case, A=
ST2600 SoC needs some
phase delay which (maximum) value is different between SD and eMMC device.

>=20
> >
> > Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> > ---
> >  Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> > b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> > index 5bb66849df65..41105cd104c6 100644
> > --- a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> > @@ -52,6 +52,7 @@ patternProperties:
> >            - aspeed,ast2400-sdhci
> >            - aspeed,ast2500-sdhci
> >            - aspeed,ast2600-sdhci
> > +          - aspeed,ast2600-emmc
> >        reg:
> >          maxItems: 1
> >          description: The SDHCI registers
> > --
> > 2.17.1
> >
> >
