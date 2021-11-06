Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66751446D5A
	for <lists+openbmc@lfdr.de>; Sat,  6 Nov 2021 11:05:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HmY0q1YLyz2ymx
	for <lists+openbmc@lfdr.de>; Sat,  6 Nov 2021 21:05:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=LUAlwZKm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.127;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=chin-ting_kuo@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=LUAlwZKm; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320127.outbound.protection.outlook.com [40.107.132.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HmY0N0sTlz2x9p;
 Sat,  6 Nov 2021 21:05:23 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KpmVlfMTo2CJdHLPJhJ+4LR7L0/IIF97mYB3CDIXBUrNv/GtWlZVk2PnL+iB++0QIhMkDRBuZR6hwv0rLonYXwDR2h/GKwTyOmn63RguxbdAhL3sDGiAI6FRC2UXSzLDuQsFVq006OyaVhGSJ3hz3q08hGUNPXp4OzB7tpAwbWoCN7kmC6bhpI9cilLlEI6JXZHYOQ/cwmJvBNxY7nwQEkQvAqmezBWVCei8AAwCkWqfo6E8SY6WOKH7jE+k5FoVWFXkETZmVRyNFM89UjefUwfyuNrfVURJN3IrnrPwZgqHmxR9heZ7Eb85/hlEhf7qH5cRB0Im/rZRhgQAI42kJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VK+sFU1KcoMANYVmc0vn5zuu/aWUNVjipTlPtjw685E=;
 b=U2x2NlaGUbmb9e4bVGvfNaOqP445gcSAg9+xXh8ECFPSBZKCZC6ff4RweUb7OOEjfiY83vNltAc/QnxaRVMeiSMTIol4qBXUIORrrK+DpE8ClNdUDiBwB01sESj2QW4WnsU8JqUduiayhlDkTOniNTJxMDjKb0k6xkbX8d+maIYPVap1KO/Xoh/I8CNaKwthP+ofVzrftPDy1ZVYb6Q78ATgDZCftMqpt0G5lnn3/0B3fqwHHYviTnMrYifjNOu1ywnl1nljSFq8dqaNs8/m3WmsgO5GrBvkFYv8Yzuk2lycz7JdHap5MO6pqodOmDM28NKkh605UdQT9UCRwJwrFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VK+sFU1KcoMANYVmc0vn5zuu/aWUNVjipTlPtjw685E=;
 b=LUAlwZKmhspFJUiD3tuYgi4uYZgSs/FLvMRAzERDES35ubZvWy1wUoQ9mFOAHvEq0R1XgkJTPJHrGYcYgZikCO8nGR0wVtO/YLK0MjpnLqglo0OotkiajvjsGl3jGCg+cuit0dBP62bbH34vnT0kxrm1ow18fPAYgqlhRvm96VV73bW+cESZEhSjYBTS5gbL6NsLb+Y3kSUU4gp/JE3QbgwZcnqqTp1FaaR/sHabKWuSWyRQ3ICjzxlKnNvOUYzdR3wCaHQxcrGNnqBX+bdnxVu9W2rrQ3/nnnP8q5BwdFkCPeg/5Rtp0eAQveqcWOwtMbi65Bmpifh2D5T9YIH/6w==
Received: from HK0PR06MB2786.apcprd06.prod.outlook.com (2603:1096:203:5b::22)
 by HK0PR06MB2257.apcprd06.prod.outlook.com (2603:1096:203:43::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Sat, 6 Nov
 2021 10:05:07 +0000
Received: from HK0PR06MB2786.apcprd06.prod.outlook.com
 ([fe80::399b:41fb:d745:beb0]) by HK0PR06MB2786.apcprd06.prod.outlook.com
 ([fe80::399b:41fb:d745:beb0%5]) with mapi id 15.20.4669.013; Sat, 6 Nov 2021
 10:05:07 +0000
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
Subject: RE: [PATCH 05/10] mmc: aspeed: Adjust delay taps calculation method
Thread-Topic: [PATCH 05/10] mmc: aspeed: Adjust delay taps calculation method
Thread-Index: AQHXyhcIKjKguyZCBkGIWs1rRbKouqv2TjoA
Date: Sat, 6 Nov 2021 10:05:07 +0000
Message-ID: <HK0PR06MB2786C1ED2463764EAAEA7166B28F9@HK0PR06MB2786.apcprd06.prod.outlook.com>
References: <20210922103116.30652-1-chin-ting_kuo@aspeedtech.com>
 <20210922103116.30652-6-chin-ting_kuo@aspeedtech.com>
 <95669b37-d512-4439-86cb-418ab085118f@www.fastmail.com>
In-Reply-To: <95669b37-d512-4439-86cb-418ab085118f@www.fastmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 478574f7-2dd3-4ff7-fbcc-08d9a10ce951
x-ms-traffictypediagnostic: HK0PR06MB2257:
x-microsoft-antispam-prvs: <HK0PR06MB225744516C6F45ABE098A257B28F9@HK0PR06MB2257.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3XhhORQoRSQaGdQU6zUSNZJNzClnJSzQ8GQQd7OQLrfouf7zHOFJ4m8slrjmuxh3JBvFSux4dtmZYChwAZmS5uHrj4jMDOuaPBkSIFvbJ0swHaPgp5V6+l0xCjNKTBVhLuDQ2CKAp/ynbqahuCd2vSOYlTJMiij7E6kCD9qGbeV10F5/5V34/i3UL0O0Ek9vSW81BUaK8u8SmJ58ajd6l5i77zq/wdxFX3m1AUIG/60LuVO/rS0kZ0UA75uIn5qP9sPrF+k1pQX/kMfumO9lVZ6i52+q382ts6wYZR/Rnf5+K0HXIuBsJe9Ks1UIbR3PhWCI65wD7W6cI8lvIJ8n+D5I/5EJzuVpeLFuBnX7vpsmBd+1YmNepiPxtr0mzbn4RjWKUTVlxRx7hyDUXkwi45DSjWpJ65KTimtJjYhBE6LwZn5dvnV7M1PiTbSwo35uG5DsMBfu0ZlZ74rTSy1JR020+k/oqOB08W/B+XYQO+xLukQGeZYEUPvWSbhLAAT1GN48gKJ2vMxpeywBupkr1/E2lNgJQY+BNwpcnAHdsHHD369ha0V5lM5nfsqmi3Jnsop3vK49yTfrtdOEhcJd/CmFg2CjjQHopVEP9YF9dfL/RnSBwMUQZVFaxh+Zc8E2WQep/hzILYyN7gQ4E0kJRR0rAoQ87Cyjwu4YpDwcuRIATItE1SM24VntNjsGYNuEvcXMQ+KER7pv5UBoMyEb+oPa4t95tbP7meQn8Un4po0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB2786.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(136003)(39830400003)(346002)(396003)(66556008)(26005)(52536014)(66476007)(316002)(66446008)(54906003)(64756008)(5660300002)(110136005)(86362001)(6506007)(4326008)(53546011)(921005)(2906002)(76116006)(71200400001)(38100700002)(38070700005)(122000001)(186003)(33656002)(83380400001)(7416002)(55016002)(8936002)(30864003)(66946007)(107886003)(8676002)(7696005)(9686003)(508600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Y5luMpAGLLub5gAMHa9FjbYBQeRhDgb7djgCc5/FIrXe7QcR36slxAJwdT29?=
 =?us-ascii?Q?F5gA5KO3az9ay4PgbdTyRD8SPaTvU/Db5RM+/w3MbKZ+Uryj/AVUv+TA38xE?=
 =?us-ascii?Q?HIlEPcvyvsshYvTPP7PuXMUMkRsIoqPglZFS8hryc15sCZ/u6g7xhw5G0j4x?=
 =?us-ascii?Q?SRzV2x0I7JFX1n0XvKlI8A2SuYwdGB18xXxXN/Vb/SX3aKACaLyzrgjoFiR6?=
 =?us-ascii?Q?NpUObtiIqwhE28wyUl6vJq8xKIwD3jurL1Lo76BmH+QkWKBd1hKLqMa3ySB4?=
 =?us-ascii?Q?rKGJFa1tIDOIbYIV/p3B33/24N2KfFbxJTGxNJQ71KHVuKn38zNaobemNrcR?=
 =?us-ascii?Q?4NtEziG6dfrZWWuu5xluzkgGlzzzvpubiY1KInARna0OOGEd2Z2JUbXvJxhZ?=
 =?us-ascii?Q?nP9fxy8OogTAyUnfcYgB9uApS76zyHWnj9gpMSj0Hiu8oO2XeaMkhTpHqMi8?=
 =?us-ascii?Q?OcX/+Tk+JQzirmB8JAX1Aba6b/MLjzZ760TK9ef+bD2bfaxdssWUIBpLg8B7?=
 =?us-ascii?Q?uN+ftDlDwmt6nsuuCZ9YL5MDizEYKP5fq1JoDQ9xOOGgVSeWgovZJAflzVWs?=
 =?us-ascii?Q?XHF1ZcPZRncHqC0dg/sCCTxa5wvYT6KwaiIwFX8cjsxAzXYk6oEoMV+5gNMV?=
 =?us-ascii?Q?hem1y8q8CWrMIT3VNJFdtAFN7lPbU2pb9eq2kGFo0E5OJD9ORalgMPbgw3/k?=
 =?us-ascii?Q?N1lKySK5XxVjJa+XXAqPmZ0NGv0PDQSuvS3nrN3yI1iqSyjIKU9OeRMStU1i?=
 =?us-ascii?Q?Dmtb//+bZ8eTQ+aQnF6lA6cK90T5RT+9qJ0qzwwp/OV+/k0lFGqTdFZknKTh?=
 =?us-ascii?Q?f9OAviHYJVMg2SAWpLAAfQ5PN0VY0rd39jhTV4GZyY2k0m8zQBc9eWMAJpvp?=
 =?us-ascii?Q?asislh+P4SkmySLIFOVRITsMqxLnmRd0MLfUfdbwhH7pyMb8TR2d/ELZlA15?=
 =?us-ascii?Q?K7oDHD1Yy98RITGeWLdqaNkW2pyFy/YC4VU/kWQf+bg6YF8LNN8Swd3bWIKE?=
 =?us-ascii?Q?qHXkWRQyceqhd32rs5i5dXIfemuNuqA3YTMZcGsE0OaFbC6jtT4JoO5oQxWC?=
 =?us-ascii?Q?ynJkLpa/iVyVT1IZdiCEECUQExpG2AVed5x6M0F+r62gKQe+Y4n9l8IwC1Dd?=
 =?us-ascii?Q?JJyPabVEgk9zkLelcaeI4mlP8WR2H9PXJilgX7wjeK6n3ktHxyzCqTb3Y5yD?=
 =?us-ascii?Q?NjjXh59Q42YX2KM3hUbml66VkUf7DVphskOy2FgwI8sMZK9OUGjIHPwcAJcn?=
 =?us-ascii?Q?KMBN4/3xWHNmrmlJIy84L+uxAzfMXWVYy/jPU2OQjbhCj3ebcm+F1fFvqG9k?=
 =?us-ascii?Q?c0jGPfNLO2y910/cYb5vwqPl4dlWC1DnpTPFrNX859gOcn4g2wwsCNlQ7iWS?=
 =?us-ascii?Q?wHlCXUyaXnAKHB/zPvNIDC3E9M3Jam6o5GRPcTq9gANouJxgTPCfrSV5NxVs?=
 =?us-ascii?Q?fAB1xx9ckJtoQdl5tf9xlwNlV32ED39de/iw1fyrfgDvC4UvT+CZZSKfJTVa?=
 =?us-ascii?Q?m1yCA7EUsTdcMjoivUy/BMO6VkaBBWx2d32rOQbPpi5+Z6a5gXXEqVJdRN/n?=
 =?us-ascii?Q?cxFPJYAcdg0JCQPWxW3gBgwyjNLYdmzcLJw7MTTj3zqDZi7vlYVOpMiqV2aG?=
 =?us-ascii?Q?eJV6haOjhG6O8GXBechPrtQY+06gAorjFzLDWgnlTvcYxQjeIt+s1Qon/f1f?=
 =?us-ascii?Q?pMPj/Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB2786.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 478574f7-2dd3-4ff7-fbcc-08d9a10ce951
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2021 10:05:07.4140 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oINu/Kpj7CJDVY/gsUT+WbUZlOZaGcmoV/ttvN49xfcySgqcb+2PZVLcRQCMNlrjdLenN3UxmoqB8F4KptiMfCZoN7+SI6ivAAoijSxK0EA=
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

> -----Original Message-----
> From: Andrew Jeffery <andrew@aj.id.au>
> Sent: Tuesday, October 26, 2021 11:10 AM
> Subject: Re: [PATCH 05/10] mmc: aspeed: Adjust delay taps calculation met=
hod
>=20
> Hi Chin-Ting,
>=20
> I think we can split this up a bit:
>=20
> On Wed, 22 Sep 2021, at 20:01, Chin-Ting Kuo wrote:
> > - The maximum tap delay may be slightly different on
> >   different platforms. It may also be different due to
> >   different SoC processes or different manufacturers.
> >   Thus, the maximum tap delay should be gotten from the
> >   device tree through max-tap-delay property.
>=20
> I think this could be a patch on its own

Okay.

>=20
> > - The delay time for each tap is an absolute value which
> >   is independent of clock frequency. But, in order to combine
> >   this principle with "phase" concept, clock frequency is took
> >   into consideration during calculating delay taps.
> > - The delay cell of eMMC device is non-uniform.
> >   The time period of the first tap is two times of others.
>=20
> Again, this could be a patch of its own

Okay.

>=20
> > - The clock phase degree range is from -360 to 360.
> >   But, if the clock phase signedness is negative, clock signal
> >   is output from the falling edge first by default and thus, clock
> >   signal is leading to data signal by 90 degrees at least.
>=20
> This line of development is impacted by my comment on an earlier patch in
> the series, so should be its own patch.
>=20

Okay.

> >
> > Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> > ---
> >  drivers/mmc/host/sdhci-of-aspeed.c | 115
> > ++++++++++++++++++++++-------
> >  1 file changed, 89 insertions(+), 26 deletions(-)
> >
> > diff --git a/drivers/mmc/host/sdhci-of-aspeed.c
> > b/drivers/mmc/host/sdhci-of-aspeed.c
> > index c6eaeb02e3f9..739c9503a5ed 100644
> > --- a/drivers/mmc/host/sdhci-of-aspeed.c
> > +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> > @@ -44,6 +44,7 @@ struct aspeed_sdc {
> >
> >  	spinlock_t lock;
> >  	void __iomem *regs;
> > +	u32 max_tap_delay_ps;
> >  };
> >
> >  struct aspeed_sdhci_tap_param {
> > @@ -63,6 +64,7 @@ struct aspeed_sdhci_tap_desc {  struct
> > aspeed_sdhci_phase_desc {
> >  	struct aspeed_sdhci_tap_desc in;
> >  	struct aspeed_sdhci_tap_desc out;
> > +	u32 nr_taps;
> >  };
> >
> >  struct aspeed_sdhci_pdata {
> > @@ -158,43 +160,60 @@ aspeed_sdc_set_phase_taps(struct aspeed_sdc
> > *sdc,  }
> >
> >  #define PICOSECONDS_PER_SECOND		1000000000000ULL
> > -#define ASPEED_SDHCI_NR_TAPS		15
> > -/* Measured value with *handwave* environmentals and static loading */
> > -#define ASPEED_SDHCI_MAX_TAP_DELAY_PS	1253
> > +#define ASPEED_SDHCI_MAX_TAPS		15
>=20
> Why are we renaming this? It looks to cause a bit of noise in the diff.
>=20

Okay, it can be changed back to the original one in the next patch version.

> > +
> >  static int aspeed_sdhci_phase_to_tap(struct device *dev, unsigned long
> rate_hz,
> > -				     int phase_deg)
> > +				     bool invert, int phase_deg, u32 nr_taps)
>=20
> Hmm.
>=20

It will also be modified.

> >  {
> >  	u64 phase_period_ps;
> >  	u64 prop_delay_ps;
> >  	u64 clk_period_ps;
> > -	unsigned int tap;
> > -	u8 inverted;
> > +	u32 tap =3D 0;
> > +	struct aspeed_sdc *sdc =3D dev_get_drvdata(dev->parent);
> >
> > -	phase_deg %=3D 360;
> > +	if (sdc->max_tap_delay_ps =3D=3D 0)
> > +		return 0;
>=20
> I don't think just silently returning 0 here is the right thing to do.
>=20
> What about -EINVAL, or printing a warning and using the old hard-coded
> value?
>=20

Agree, both -EINVAL and printing a warning are better.

> >
> > -	if (phase_deg >=3D 180) {
> > -		inverted =3D ASPEED_SDHCI_TAP_PARAM_INVERT_CLK;
> > -		phase_deg -=3D 180;
> > -		dev_dbg(dev,
> > -			"Inverting clock to reduce phase correction from %d to %d
> degrees\n",
> > -			phase_deg + 180, phase_deg);
> > -	} else {
> > -		inverted =3D 0;
> > +	prop_delay_ps =3D sdc->max_tap_delay_ps / nr_taps;
> > +	clk_period_ps =3D div_u64(PICOSECONDS_PER_SECOND, (u64)rate_hz);
> > +
> > +	/*
> > +	 * For ast2600, if clock phase degree is negative, clock signal is
> > +	 * output from falling edge first by default. Namely, clock signal
> > +	 * is leading to data signal by 90 degrees at least.
> > +	 */
>=20
> Have I missed something about a asymmetric clock timings? Otherwise the
> falling edge is 180 degrees away from the rising edge? I'm still not clea=
r on
> why 90 degrees is used here.
>=20

Oh, you are right. It should be 180 degrees.

> > +	if (invert) {
> > +		if (phase_deg >=3D 90)
> > +			phase_deg -=3D 90;
> > +		else
> > +			phase_deg =3D 0;
>=20
> Why are we throwing away information?
>=20

With the above correction, it should be modified as below.
If the "invert" is needed, we expect that its value should be greater than =
180
degrees. We clear "phase_deg" if its value is unexpected. Maybe, a warning
should be shown and -EINVAL can be returned.

if (invert) {
	if (phase_deg >=3D 180)
		phase_deg -=3D 180;
	else
		phase_deg =3D 0;
}

> >  	}
> >
> > -	prop_delay_ps =3D ASPEED_SDHCI_MAX_TAP_DELAY_PS /
> ASPEED_SDHCI_NR_TAPS;
> > -	clk_period_ps =3D div_u64(PICOSECONDS_PER_SECOND, (u64)rate_hz);
> >  	phase_period_ps =3D div_u64((u64)phase_deg * clk_period_ps, 360ULL);
> >
> > -	tap =3D div_u64(phase_period_ps, prop_delay_ps);
> > -	if (tap > ASPEED_SDHCI_NR_TAPS) {
> > +	/*
> > +	 * The delay cell is non-uniform for eMMC controller.
> > +	 * The time period of the first tap is two times of others.
> > +	 */
> > +	if (nr_taps =3D=3D 16 && phase_period_ps > prop_delay_ps * 2) {
> > +		phase_period_ps -=3D prop_delay_ps * 2;
> > +		tap++;
> > +	}
> > +
> > +	tap +=3D div_u64(phase_period_ps, prop_delay_ps);
> > +	if (tap > ASPEED_SDHCI_MAX_TAPS) {
> >  		dev_dbg(dev,
> >  			 "Requested out of range phase tap %d for %d degrees of phase
> > compensation at %luHz, clamping to tap %d\n",
> > -			 tap, phase_deg, rate_hz, ASPEED_SDHCI_NR_TAPS);
> > -		tap =3D ASPEED_SDHCI_NR_TAPS;
> > +			 tap, phase_deg, rate_hz, ASPEED_SDHCI_MAX_TAPS);
> > +		tap =3D ASPEED_SDHCI_MAX_TAPS;
> >  	}
> >
> > -	return inverted | tap;
> > +	if (invert) {
> > +		dev_info(dev, "invert the clock\n");
>=20
> I prefer we drop this message
>=20

Okay.

> > +		tap |=3D ASPEED_SDHCI_TAP_PARAM_INVERT_CLK;
> > +	}
> > +
> > +	return tap;
> >  }
> >
> >  static void
> > @@ -202,13 +221,19 @@ aspeed_sdhci_phases_to_taps(struct device *dev,
> > unsigned long rate,
> >  			    const struct mmc_clk_phase *phases,
> >  			    struct aspeed_sdhci_tap_param *taps)  {
> > +	struct sdhci_host *host =3D dev->driver_data;
> > +	struct aspeed_sdhci *sdhci;
> > +
> > +	sdhci =3D sdhci_pltfm_priv(sdhci_priv(host));
> >  	taps->valid =3D phases->valid;
> >
> >  	if (!phases->valid)
> >  		return;
> >
> > -	taps->in =3D aspeed_sdhci_phase_to_tap(dev, rate, phases->in_deg);
> > -	taps->out =3D aspeed_sdhci_phase_to_tap(dev, rate, phases->out_deg);
> > +	taps->in =3D aspeed_sdhci_phase_to_tap(dev, rate, phases->inv_in_deg,
> > +				phases->in_deg, sdhci->phase_desc->nr_taps);
> > +	taps->out =3D aspeed_sdhci_phase_to_tap(dev, rate, phases->inv_out_de=
g,
> > +				phases->out_deg, sdhci->phase_desc->nr_taps);
> >  }
> >
> >  static void
> > @@ -230,8 +255,8 @@ aspeed_sdhci_configure_phase(struct sdhci_host
> > *host, unsigned long rate)
> >  	aspeed_sdc_set_phase_taps(sdhci->parent, sdhci->phase_desc, taps);
> >  	dev_dbg(dev,
> >  		"Using taps [%d, %d] for [%d, %d] degrees of phase correction at
> > %luHz (%d)\n",
> > -		taps->in & ASPEED_SDHCI_NR_TAPS,
> > -		taps->out & ASPEED_SDHCI_NR_TAPS,
> > +		taps->in & ASPEED_SDHCI_MAX_TAPS,
> > +		taps->out & ASPEED_SDHCI_MAX_TAPS,
> >  		params->in_deg, params->out_deg, rate, host->timing);  }
> >
> > @@ -493,6 +518,7 @@ static const struct aspeed_sdhci_phase_desc
> > ast2600_sdhci_phase[] =3D {
> >  			.enable_mask =3D ASPEED_SDC_S0_PHASE_OUT_EN,
> >  			.enable_value =3D 3,
> >  		},
> > +		.nr_taps =3D 15,
> >  	},
> >  	/* SDHCI/Slot 1 */
> >  	[1] =3D {
> > @@ -506,6 +532,31 @@ static const struct aspeed_sdhci_phase_desc
> > ast2600_sdhci_phase[] =3D {
> >  			.enable_mask =3D ASPEED_SDC_S1_PHASE_OUT_EN,
> >  			.enable_value =3D 3,
> >  		},
> > +		.nr_taps =3D 15,
> > +	},
> > +};
> > +
> > +static const struct aspeed_sdhci_phase_desc ast2600_emmc_phase[] =3D {
> > +	/* eMMC slot 0 */
> > +	[0] =3D {
> > +		.in =3D {
> > +			.tap_mask =3D ASPEED_SDC_S0_PHASE_IN,
> > +			.enable_mask =3D ASPEED_SDC_S0_PHASE_IN_EN,
> > +			.enable_value =3D 1,
> > +		},
> > +		.out =3D {
> > +			.tap_mask =3D ASPEED_SDC_S0_PHASE_OUT,
> > +			.enable_mask =3D ASPEED_SDC_S0_PHASE_OUT_EN,
> > +			.enable_value =3D 3,
> > +		},
> > +
> > +		/*
> > +		 * There are 15 taps recorded in AST2600 datasheet.
> > +		 * But, actually, the time period of the first tap
> > +		 * is two times of others. Thus, 16 tap is used to
> > +		 * emulate this situation.
> > +		 */
> > +		.nr_taps =3D 16,
>=20
> I think this is a very indirect way to communicate the problem. The only =
time
> we look at nr_taps is in a test that explicitly compensates for the non-u=
niform
> delay. I think we should just have a boolean struct member called
> 'non_uniform_delay' rather than 'nr_taps', as the number of taps isn't wh=
at's
> changing. But also see the discussion below about a potential
> aspeed,tap-delays property.
>=20

A new property may be the better choice.

> >  	},
> >  };
> >
> > @@ -515,10 +566,17 @@ static const struct aspeed_sdhci_pdata
> > ast2600_sdhci_pdata =3D {
> >  	.nr_phase_descs =3D ARRAY_SIZE(ast2600_sdhci_phase),  };
> >
> > +static const struct aspeed_sdhci_pdata ast2600_emmc_pdata =3D {
> > +	.clk_div_start =3D 1,
> > +	.phase_desc =3D ast2600_emmc_phase,
> > +	.nr_phase_descs =3D ARRAY_SIZE(ast2600_emmc_phase), };
> > +
> >  static const struct of_device_id aspeed_sdhci_of_match[] =3D {
> >  	{ .compatible =3D "aspeed,ast2400-sdhci", .data =3D &ast2400_sdhci_pd=
ata, },
> >  	{ .compatible =3D "aspeed,ast2500-sdhci", .data =3D &ast2400_sdhci_pd=
ata, },
> >  	{ .compatible =3D "aspeed,ast2600-sdhci", .data =3D
> > &ast2600_sdhci_pdata, },
> > +	{ .compatible =3D "aspeed,ast2600-emmc", .data =3D &ast2600_emmc_pdat=
a,
> > +},
>=20
> This needs to be documented (and binding documentation patches need to be
> the first patches in the series).=20

Okay.

> Something further to consider is whether we
> separate the compatibles or add e.g. an aspeed,tap-delays property that
> specifies the specific delay of each logic element. This might take the p=
lace of
> e.g. the max-tap-delay property?
>=20

Yes, an additional property may be better.

> Andrew
>=20
> >  	{ }
> >  };
> >
> > @@ -562,6 +620,11 @@ static int aspeed_sdc_probe(struct platform_device
> *pdev)
> >  		goto err_clk;
> >  	}
> >
> > +	ret =3D of_property_read_u32(pdev->dev.of_node, "max-tap-delay",
> > +			&sdc->max_tap_delay_ps);
> > +	if (ret)
> > +		sdc->max_tap_delay_ps =3D 0;
> > +
> >  	dev_set_drvdata(&pdev->dev, sdc);
> >
> >  	parent =3D pdev->dev.of_node;
> > --
> > 2.17.1

Chin-Ting
