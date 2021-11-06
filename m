Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 082BE446D54
	for <lists+openbmc@lfdr.de>; Sat,  6 Nov 2021 11:03:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HmXyX03t7z2xBg
	for <lists+openbmc@lfdr.de>; Sat,  6 Nov 2021 21:03:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=uEzTjaCp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.115;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=chin-ting_kuo@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=uEzTjaCp; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320115.outbound.protection.outlook.com [40.107.132.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HmXxr59Lbz2yyv;
 Sat,  6 Nov 2021 21:03:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FyW+3KMbW/JhYD73t8TFRnLU8qEGIaxII4oDp+Kz3kAv3nvH+b8Py+nzYBh+luKla1id4fymy1LVFYtpxEpITnFzpFjMcWTwrPXAJlhK6Msf4Hkr1/59Yu0exUBp0Vr/AuPDFcamMK2FwUksWbzqM9EAGzIbhiF5Cot/B66Uf4S9RMPn6AnEFsE/ktipMfdOAQb2o6+v4/SfZlhnd1aQSChp08dVhmMv4NE+fwTs6e3yY4a6e7+yGJJtNzzc7t87srlfIf7y1UOD01xB/1eG/o9wnPOdtR5cWvzCw/01SHjpkXSGL5HTeknAL4/IbuudexcdNyYw+2G5R0ply6cPQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezIIR7sFX9cSpDBuKJ9aFAgrsD8odJ2FxLk67O7NFxg=;
 b=NTGF7FFaPkcYb0AiAfMzeNzb6vM99RIRk/vIs1ltxdBPezAPEv6ieW5FrSE0Wv/w08fkFfyTm2EnLuuoukkgwcd0+NxBHY7LNdz8AjDVOM2Uw9Lz211Cyu6V69p1yBgKStmxK+VKoAsRrLmk+l0lS+7kdWEydlEE1Eh+fB5IY3j9OUWmIgaEfXLDlsCtCX11/g7YWmMEO1WJssOnijLliAlGLRlhF2GxsOA2vOVb6brmbtuF+HIoQJZ44OqhHTF03Ry9FNXAz+vZZGvzBWH70NLr4smWqJGmBkbi/V985vbo4pjXiwv58DCtDNesbcHU+pFBxprAjBO5kBI+9h/Mwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezIIR7sFX9cSpDBuKJ9aFAgrsD8odJ2FxLk67O7NFxg=;
 b=uEzTjaCpxxRHyOzsFmKUtr9bqXNBjsnmNJualOAHP5DHD51Ulb67iNL0SYCMzM1Ie43s/9arT4tNdSmF4yBixiVgyp3ZHzKib5CESxVJTK+RDK+nJ6so903TswPKu0YfHuBV1s7s1lVwo6NE2FpzI3DAy9LEEqfcPkTb/mplNSegi7nGdS5kINCxPsD6LoEGrGtxsYXsXkOuHJOSXmEyhL+WZeTo4dCIArdD2PDV76ApuKD0K1ARDcPrmnZ4aBeXMJxzNwAeYcyV6DL1kMoTh1WKwXHsx1FNymaXE8GxPuGdh5i8JGDvl7ysr/rKwXDZZIOLQZbQ7qPsX+WUAl2xIw==
Received: from HK0PR06MB2786.apcprd06.prod.outlook.com (2603:1096:203:5b::22)
 by HK0PR06MB2257.apcprd06.prod.outlook.com (2603:1096:203:43::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Sat, 6 Nov
 2021 10:02:55 +0000
Received: from HK0PR06MB2786.apcprd06.prod.outlook.com
 ([fe80::399b:41fb:d745:beb0]) by HK0PR06MB2786.apcprd06.prod.outlook.com
 ([fe80::399b:41fb:d745:beb0%5]) with mapi id 15.20.4669.013; Sat, 6 Nov 2021
 10:02:55 +0000
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
Subject: RE: [PATCH 04/10] mmc: Add invert flag for clock phase signedness
Thread-Topic: [PATCH 04/10] mmc: Add invert flag for clock phase signedness
Thread-Index: AQHXygPcp7kXjlAYDEiiVdm7fDJLlKv2SRoA
Date: Sat, 6 Nov 2021 10:02:55 +0000
Message-ID: <HK0PR06MB27861518CA84A9DC8D204AC1B28F9@HK0PR06MB2786.apcprd06.prod.outlook.com>
References: <20210922103116.30652-1-chin-ting_kuo@aspeedtech.com>
 <20210922103116.30652-5-chin-ting_kuo@aspeedtech.com>
 <5a235916-f250-48ac-b931-6ec2c5c2ea5d@www.fastmail.com>
In-Reply-To: <5a235916-f250-48ac-b931-6ec2c5c2ea5d@www.fastmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1dda7f47-9596-429c-5956-08d9a10c9abd
x-ms-traffictypediagnostic: HK0PR06MB2257:
x-microsoft-antispam-prvs: <HK0PR06MB22573D5E542DF1E2696BCD6DB28F9@HK0PR06MB2257.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q+k+rZmoiHRDFRFSA86EuNjlcBTDTbyDT9hxiituHxsP5Y4OYfUpfMGhPA0PMh/vdVJWt6FlzpSZVh0VKxuGCQyOBdqenMEkFX4aXOvX1vrS94wYcHXomStQ1qIXcEyYk1rzPlRjuQWk24LIUuw5jCvqIndc8eIt4Ik2gCSFOZ4fO5yTl9b+neH7fwZ2/+QLOFOJ9ivUbP1ZS/7LM5v0/BSHsrcXJi5IhOrywMuyue3RR7t1y11OmxpwjDDFAYF1eKYTSZ2ZtFlbVrZh+XHfiCQmowVpPBLXcGLt8Zr9hdcc/F3A5b+zGhPjbpk3OGDOhEhzEHmtYgK+wujfxZvEtgf4JYwadLzbh5ENOhs+9wiDQNKNt3FljOuq7PDx8Ts+jYFGUL1TC1LM+6EkT2aDXgXC5u5lQasaFZJ2rvgMWQQFCTPbCWhBs+jPCy8GMH43xRqOkUrNKse2Gp42bK31ChX+TPsdLWHlRb2sMExOv8hpWo/46qgs2vKUQuKKHsgBuXpja1erF4e2imWAlV2XMmlXBi4Vx4RYH4sPLXdlCLBKPWcq5QCUsHvrPTNoHM0oKbCvDYX8j9C9TV7thalBhwhPiOZBSNlbQPDOU4lbVnOmW5TKx5c1lp3n+juOi8fntrp7TMK/x96bS+zjeVH4CfyY/FOP1MeA0Cf+99+GHZcyGLnfRYhfjj9K+e/HxXAXG5i4HrD3FgzPWVDtlI6vGBrJ1gljiybZbh1m4V7pQCDlDBhvZk+QceBR2WYez4ofL8ksmufMcr7q2yKJ4/E/ageYxpdOrX6vfc1p+C6IDHrmFteK0jfUucsj3OepESV8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB2786.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(136003)(39830400003)(346002)(396003)(66556008)(26005)(52536014)(66476007)(316002)(66446008)(54906003)(64756008)(5660300002)(110136005)(86362001)(6506007)(4326008)(53546011)(921005)(2906002)(76116006)(71200400001)(38100700002)(38070700005)(122000001)(186003)(33656002)(966005)(83380400001)(7416002)(55016002)(8936002)(66946007)(107886003)(8676002)(7696005)(9686003)(508600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8UBplrb7eRooh5dGyuC3BYFSy5MX5CfPnMmFygX6VA0bRqEA3PCbgXEG/vGm?=
 =?us-ascii?Q?lryAhKA5ZQ6NHcYWx1UMfIU+iObwO/DsAlqUXD5oBI687QCAeDLQt+p+p315?=
 =?us-ascii?Q?UTLHv4hRFKP12ysYhfUJ6Vn3UMjmVDIMHT1ycNCcV0BsNirDZOUGvEeQebTL?=
 =?us-ascii?Q?lkDv6INkbQY3gX3ziSCx+uv73JHHJjSnBCmi1eq2BIl4IqOLrm2x0AccOpbd?=
 =?us-ascii?Q?AOoktFi1REXPwOE2slJ5aYQwg1PvyafsMZH6AWxSYs6rnCMttpbDqWJF/712?=
 =?us-ascii?Q?zS+Ochrun9Bq5ozKeiq8mgikisqjMt4bdwFBolBi34p+1zwYUkz6zeHzUNSD?=
 =?us-ascii?Q?J8P3Qb1nAQro2d/TSBg9ZY2p8KGDczlOlSOh0rObCFKJgTK5Khe05AR9bAhq?=
 =?us-ascii?Q?5ezYE6zHo9lGPgKcRcP7fSE9RQJpzGuaq/pY63+DRcipbA3SWQRexAoPCKrO?=
 =?us-ascii?Q?mo2VwIKrsss5D/5Pma6Il3nulkyMfwaGaf6YNMar5fqrPp7Y4zdSfb/MObI1?=
 =?us-ascii?Q?Z2DAR7ZCv148tpSZqpjI6vaT3vrcBDq1gjDajkjcs3TJ5uNeYSHWLv++CG9O?=
 =?us-ascii?Q?Jpg/MUNuHghsAcjhAqI1xQOr/NZR82I/ymLrFaJgOZXLVVa/2VYVAEzQav4m?=
 =?us-ascii?Q?cX5w/2ahnrU/htGRkA3aDUO3Nb4de8YcLVHy0WhRQvrQHNNvZ8MWbFVqvb8C?=
 =?us-ascii?Q?WszTiPDvT98P/55arHKmzxrFxpel0kwhzQdMEPhs7Jk2SceaArmgt1Ecp48Q?=
 =?us-ascii?Q?eBv4/+e3GNYerG0CIDLCyRFrQ4/3VMKWes4kOQXfdSY60MiMKzOs3TdwE2wR?=
 =?us-ascii?Q?DTONxKKY3GNK/t16OE2409RhIL1QgH82CrttgEhwRtYCdxGzYbu1LhcBwqtO?=
 =?us-ascii?Q?v/as4clPoCpl7zTv6sv5A1DmeM1zG5oAb9QewSTkaUCClkGGW83BMAaZ3cV+?=
 =?us-ascii?Q?VKIitz0BTZzltrPobHEeVJzd6IhO4B87fWbrtu3TA/tWlBbqyFBgkjr9lxHX?=
 =?us-ascii?Q?SNB8EJ9/JXXGw+fZA23JcWZpbJyhe65s9rhtSuTURy32q2kQNOMul3yx++8k?=
 =?us-ascii?Q?yT32s8RuJbFALxWh+PN+rl0/Q7ca97yEG9N3trnixNe+gbGmi0pwMUCe341l?=
 =?us-ascii?Q?LW/O5h3NlQ+GITGlyrzJfuM1THMLm2c2YFeqDVvYPOYbvqc5ObM119wkgKss?=
 =?us-ascii?Q?isHV+x2i3hsY0fwJ9ZAgzg/+HWWgB1G5xYg+IgIOnKbUpYKkH12HxpZPVJSo?=
 =?us-ascii?Q?JMI34qhJExJIxhO0MZ0hR070uGVGjacL/5jdSP3fU+8hQo1vDL0LOnajDt8Q?=
 =?us-ascii?Q?7xetTjQQhLwwPVKjh+sNVPX6ZEluhM7jmJadbT0OSIoChdPD70S170KdXata?=
 =?us-ascii?Q?JUIXStH+OrYP0nyX5ir2LBP19xf5I+q4bjLQ9SxBUxEqDdMc6t4Zmr1abZYJ?=
 =?us-ascii?Q?KB013K2w7WO821nxSi8w+vm8WAvi8Ilm8K26WwAF7XVRCAbA7IsXZewFjC1a?=
 =?us-ascii?Q?60aoIB0WIlBjmCvF81Ro/iY/PQukJtj6Xh51pP2hpiwcHS88xER3bY5mBXOC?=
 =?us-ascii?Q?H4q/rVXfuQOI/LGfGzgcZixW0BXcS/aftZwGQBnjNlI2jQusTeYx1ys4tMVM?=
 =?us-ascii?Q?1gAmJqOcsYKxD+JPMlmMrWk1zVhn6Y/NpsAJREaPzTnWSzZiaX1PZYldHrUG?=
 =?us-ascii?Q?BaKozQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB2786.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dda7f47-9596-429c-5956-08d9a10c9abd
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2021 10:02:55.5716 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fLs55WOJgUGCYVEexik9TP4b14iG89kuK1ITc6qcFg9bEWM40NdPHj6eK1HWs4zumkoLXwOqrTB7KK34dkGeIGiz+gsMfEUXE0RkN7FsEA8=
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
> Sent: Tuesday, October 26, 2021 8:53 AM
> Subject: Re: [PATCH 04/10] mmc: Add invert flag for clock phase signednes=
s
>=20
> On Wed, 22 Sep 2021, at 20:01, Chin-Ting Kuo wrote:
> > The clock phase degree may be between -360 to 360.
> > If the data signal is leading to the clock, the signedness of clock
> > phase is postive, otherwise, the signedness is negative.
> >
> > Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
>=20
> The implementation here can't be changed without a change to the binding
> documentation:
>=20

Okay, the binding document will be changed in the next patch version.

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocume
> ntation/devicetree/bindings/mmc/mmc-controller.yaml?h=3Dv5.15-rc7#n345
>=20
> > ---
> >  drivers/mmc/core/host.c  | 10 ++++++----  include/linux/mmc/host.h |
> > 2 ++
> >  2 files changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c index
> > d4683b1d263f..c2de7cbc7838 100644
> > --- a/drivers/mmc/core/host.c
> > +++ b/drivers/mmc/core/host.c
> > @@ -214,14 +214,16 @@ static void mmc_retune_timer(struct timer_list
> > *t)  static void mmc_of_parse_timing_phase(struct device *dev, const ch=
ar
> *prop,
> >  				      struct mmc_clk_phase *phase)  {
> > -	int degrees[2] =3D {0};
> > +	int degrees[4] =3D {0};
> >  	int rc;
> >
> > -	rc =3D device_property_read_u32_array(dev, prop, degrees, 2);
> > +	rc =3D device_property_read_u32_array(dev, prop, degrees, 4);
> >  	phase->valid =3D !rc;
> >  	if (phase->valid) {
> > -		phase->in_deg =3D degrees[0];
> > -		phase->out_deg =3D degrees[1];
> > +		phase->inv_in_deg =3D degrees[0] ? true : false;
> > +		phase->in_deg =3D degrees[1];
> > +		phase->inv_out_deg =3D degrees[2] ? true : false;
> > +		phase->out_deg =3D degrees[3];
>=20
> This fundamentally breaks any in-tree users. We can't do this.
>=20
> In terms of the binding, if negative phase values are something we must d=
o,
> we can just extend the value range to include [-359, -1] right?

Yes, agree it and I tried it before. But, it seems that the device tree doe=
sn't support
negative value with "-" prefixed and there is no device tree related API us=
ed to get
the negative value from .dts. Thus, I tried to add an additional flag to pr=
esent
negative value.

> That avoids changing the type of the value positions in the manner this p=
atch
> does.
>=20
> Andrew

Chin-Ting
