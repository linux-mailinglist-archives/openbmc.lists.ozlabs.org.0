Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABB6446D53
	for <lists+openbmc@lfdr.de>; Sat,  6 Nov 2021 11:03:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HmXxk2MDfz2xBl
	for <lists+openbmc@lfdr.de>; Sat,  6 Nov 2021 21:03:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=PQ4EtXH6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.129;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=chin-ting_kuo@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=PQ4EtXH6; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320129.outbound.protection.outlook.com [40.107.132.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HmXwL0DYkz2xtQ;
 Sat,  6 Nov 2021 21:01:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=br9pLoJ41q7J1iElZ9y1FldfVVdWMczQCGLHj2y4/I/4TCmHhfqtxijI4wRbM1eJmbqHUdL+kKXe3UtIQZ9WyFDrnWq7/ENX2DH1T93mpSNMvPoyywhSKbTiWS8eOvQBVmVbwcBs/8g7p9y0JqTmU2g6R4Ce1570wSk8tktgPzXH4s6uqSxCJ0vRuj4MHSP4FBtf9k43dIZXcjhBf+k8i5lEiyEViRdpDwT/slUMrQ5rrB2qjkzcWHoT20rZpwRYwgzARmgfuy2M5vRJFkhC24MA0/RVPr6pW8gsbqZAO9IkEZWbzRt/oVmAuTmqaAB+gsgvID0RDoSuBSOMQLtXfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZCwfjnqjdJzkHLVIknun529ymNAvf3/0sgsQWWyyxcQ=;
 b=Knp0J/lGkqkOZIeY5/MPsLyLcAu2TXfwdsOh5zm9mdslgJLR3lKERmKrqgcTXFi9GeR21/8qLHnr4LO2RArHxm76DzZaeKcZ1/8/AjyFdZljOdJuECHGgQShOBH+Onfap187+aAVYxOQP8ZYuPNYwtJY/Ip0shFFq9pnTak3wWQeMNNbqy7lM3VZgdvx9901nezSCZd670h/a3P5Yc4zLz6/gXt1V+rw0XJ033iE196ewExe66o7TwrAIABMt4dy5erBILtXCJ2a1Ttlie12PNYvu6+1VNwgAVYXw+E9eBJxkm/A0By1HJVl6R3+UZkMa/Ux0mly/l6jC6UKJwZ3Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCwfjnqjdJzkHLVIknun529ymNAvf3/0sgsQWWyyxcQ=;
 b=PQ4EtXH6Hv0RgoUONwsa93gII7mdgBNmo8FYvKYL03dx/IIV8G3aTF2/C9nvvcI3lxnotmSpm+A71yQCY6V1xoIS/DJA2/yNLGvr7MBQsBW1QPbo1UMoUYRHPTaVR7jorsCBwMSG0mIoEcOGTMBgMPdB/iU/DC/aJtJsAnL8YdKvWZx2qSXcaKAKRF15y7wEoNfrVBx0hhWiA4QLSXuAPn4yYHnTJMDZz5z9KE6SZqgiBAZI9xZ7SdaA+gXeAivamWJaWo5OY/aD0yAqXVRz8DfJKu7HuCxPw2YOTee47ZWZqvUhkKDQtY/Z8Bz6an5M1PaVj4oeksEJVcl8fBKUJA==
Received: from HK0PR06MB2786.apcprd06.prod.outlook.com (2603:1096:203:5b::22)
 by HK0PR06MB2257.apcprd06.prod.outlook.com (2603:1096:203:43::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Sat, 6 Nov
 2021 10:01:35 +0000
Received: from HK0PR06MB2786.apcprd06.prod.outlook.com
 ([fe80::399b:41fb:d745:beb0]) by HK0PR06MB2786.apcprd06.prod.outlook.com
 ([fe80::399b:41fb:d745:beb0%5]) with mapi id 15.20.4669.013; Sat, 6 Nov 2021
 10:01:35 +0000
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
Subject: RE: [PATCH 03/10] dts: aspeed: ast2600: Support SDR50 for SD device
Thread-Topic: [PATCH 03/10] dts: aspeed: ast2600: Support SDR50 for SD device
Thread-Index: AQHXygJu7aSIKaH77U+Hz3adbFpzOav2SKZQ
Date: Sat, 6 Nov 2021 10:01:35 +0000
Message-ID: <HK0PR06MB27862907BFE7C299AD78B926B28F9@HK0PR06MB2786.apcprd06.prod.outlook.com>
References: <20210922103116.30652-1-chin-ting_kuo@aspeedtech.com>
 <20210922103116.30652-4-chin-ting_kuo@aspeedtech.com>
 <88c261c2-797a-4803-ac30-24f95a397496@www.fastmail.com>
In-Reply-To: <88c261c2-797a-4803-ac30-24f95a397496@www.fastmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8405acb8-0e60-4602-5064-08d9a10c6b0c
x-ms-traffictypediagnostic: HK0PR06MB2257:
x-microsoft-antispam-prvs: <HK0PR06MB225771185C1EE5086C115A5AB28F9@HK0PR06MB2257.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jtf7Mmo7Wk6tgEQtFtNIe/h569BTU3tCkIpdf/L53ZiGI8XQOP+ONbK31ttEl8Gr83YyjQC89Nhx1AXqrUK6TEJQIKYc0BX3dEypDW9ZGuDsKa/MCwYr63rzUJVb9qVLcTVYhWpThq6BSyCUtmXeTcUmtlTy7BUaNRD1zkt9znXWPF3uXliuMv4FAd3XgZpMWR01T5BGtn3RWI6K/7jtR/Irh69z0xzu7lcqTrkm9qzojtxA0LskN7p8/nUXQCgL7DhHtAzBW7WpLaApup1+WV8AeKPAEPVRh1ItqKzP/O+x178tvmszDCgLePEVUaYf3JJzoBe4IB7wrTmLjr1aNUINO4mejIJNN4OVv5R2z1GmFId5ypqdhwQLcd5oO//iRKUJDo9LCaxGcQ34sIgQmtAaPXz9fqdypBcPvTHN7lTTmjUP8qyJk7TgNdibixAhb3mMowYDTlanJ66fQU2B8TWgsvGEU2xsskobVq0xKR9ySjwO4p9BzG03+APg7gzcvjXXMLj7tpnih7T0ezppYgxUC0sG2mKrpbsFvZ/Cn0MrrYYfye+Ogoxlg49qe+tSXAUzy+kbRDdIHcXOtudX4GpEL4ZQgf7iKxtMzA6Y0oeHAK7Xe2FJqGLPkyX8ysCNCf+A7LV8AOzKiQiFBFy36T+ZGIWgQStNCnuuBOIgEBbJPVGjWGG0QnQ6qVxXRqmsyrCHeCr75NjYCJYJ3m/BcjxcOD9W2pGYCs58W5YYXQg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB2786.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(136003)(39830400003)(346002)(396003)(66556008)(26005)(52536014)(66476007)(316002)(66446008)(54906003)(64756008)(5660300002)(110136005)(86362001)(6506007)(4326008)(53546011)(921005)(2906002)(76116006)(71200400001)(38100700002)(38070700005)(122000001)(186003)(33656002)(83380400001)(7416002)(55016002)(8936002)(66946007)(107886003)(8676002)(7696005)(9686003)(508600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WeDbEVSDQ9Dz95LxbgfeJV0boy8wy7wW48gXAidveOd5VI3kdplZCglbuKQF?=
 =?us-ascii?Q?4LiluiivS32qPBXTixRpCbahQDTdOwBWkeIK1r1wOFmn1DuDVd5CzodmvYil?=
 =?us-ascii?Q?u7Tm49g7dM7BhNKbmo0uUtNX7NqWwt5SUPVskLfKsGpJAMHC7kf6MCxFFG5n?=
 =?us-ascii?Q?WGyaYz4hrfMak4yjUgz0ahZmVbP1jfC2uTFtQL8qv5+s/PLhxmlogK8MqRpL?=
 =?us-ascii?Q?+15AlIKaTzdoETq584VFJUXITV1I2D013eRz4ZFmv7ULTObU7JHR051BuvMC?=
 =?us-ascii?Q?GHWfpnZRbSoU2Hd04KkYyqhXwyNalqMk5QRUJOujWVbOznksUzsvKodgJDVL?=
 =?us-ascii?Q?Ebw3cd3Mook+2jQJ3J3mGVICt4HYemVOO1D3kDxnAd1l7cXe+a15pasyYmch?=
 =?us-ascii?Q?ANuGfWOoGB0qTgSE7I4bs8x6evYU+xnr3VAusKGVQk1ZOoghb5KDcqLuwrCg?=
 =?us-ascii?Q?ctIl12QuL9IzKGvPvnKiqy0lC5yXnegf6DDuOs1F7p+O/JothWBTBX5lznxd?=
 =?us-ascii?Q?VCHoEudXRq7qpMlNWqiUniP06m79fLNsKNqq4c3672iJWtUPCaFjuA7fCnY5?=
 =?us-ascii?Q?wwNt303yb+b3BaHxImgcy6mkZXr4s9XyuFPdI1FfhsCpkdFh9fFS9A1bbmVG?=
 =?us-ascii?Q?7xxuAfZb3HV8dppJJrKneBrbfYOsH07ar4frUwXJ7yO5+yyb2EDA+ynG/BIt?=
 =?us-ascii?Q?vjWpxUGf7R86emcrNjuXnFAc1wvQ8j2YFZi02i7GXgTf8soRaU2etrR6sPrP?=
 =?us-ascii?Q?7S8PTc8TPvgWPsM+rTfdSg3BUzgwZsWebvYRjoDnQrrJkNeatetAJFjRCerO?=
 =?us-ascii?Q?/ALH0kNAnrqsgifwUZMo4enah1p3vbaIuP69AXaO3sCqnmCvpGmQlTo1A0HO?=
 =?us-ascii?Q?p4tm3DLK66X5hP6hyQR/gi6Iq0mp+MCZDJrrsbNSCyIzZ0d4bwbGWHxhRn4O?=
 =?us-ascii?Q?4q7iGu6r0u6O+kmKOAs3S/yD0DL/V1cu2ZOn1aLjvlbaCuc1aUOGia3KFTev?=
 =?us-ascii?Q?R/K4qyYO34spz2ncdaH70I2fmo1PpfrNLm/YyljN8eijTWWGtdZgmoHnS//5?=
 =?us-ascii?Q?HoxEH/MSSWwSv+QKq4EWwG1IGFIbbgdCBR1epmg35Fun94ffO/hUr2G37Zqb?=
 =?us-ascii?Q?A186KwchqWeEovVcNcNdq4rREwiIRImYxxvHLMgUlTHQxo8gT2lM0lZaaO+M?=
 =?us-ascii?Q?p/YKcUH1pW+mCCMCe4VPq3v48RzBIlm2LBIf5/QcE5Qm8ksHzRoHTk/7+dia?=
 =?us-ascii?Q?aFMIlVHsfV0UNdM3Dsu3Fet8o3aotPjiVRzTA2hwIoZA55xWdIe6psQ2NR93?=
 =?us-ascii?Q?TBfO+4eb1lhUbI+0p1wq8Ao60+2dads9bC+4pJ/0DOhq6cctQ3aogH/E06u2?=
 =?us-ascii?Q?NOKewZNRNjbuLMj+nlSpv6A7IF2d1ScOyzsggPobRhKzOMFzT1a6QLmae7zA?=
 =?us-ascii?Q?L0TNCZXq62dKcSlqOtQWvFA9NOI1NyV+xk+M0WCLM9bBptnhM+gFTipbhNnY?=
 =?us-ascii?Q?pFzGF4ZFHAazQbuTX80K821YUaCVXoqKT83m+GYb4QisWwVPtaFZisj8PZ/i?=
 =?us-ascii?Q?aGiBJGY/TN9260Ztjb7xx5cv2dedZAN+dB8MiCz92S+LxMFp4yAW5m09T74W?=
 =?us-ascii?Q?8l6ZIBWXktPIpp/kjAxbjw0ZGd8KDn8+E4ydpJj1Zm8ZVoI69y4x9n5qGnyx?=
 =?us-ascii?Q?EpQ8KA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB2786.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8405acb8-0e60-4602-5064-08d9a10c6b0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2021 10:01:35.4785 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: trabZnICq+/D/2D/8i9+0elu+MPSvMXUY/QPD5VfrcGJSOn3pEVWraqUXDzmJ4nYgQVNzQ9Bo9JVAkVtbJ8NaASSKK+wkuyxVxFJ/ohaRSM=
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

> -----Original Message-----
> From: Andrew Jeffery <andrew@aj.id.au>
> Sent: Tuesday, October 26, 2021 8:43 AM
> Subject: Re: [PATCH 03/10] dts: aspeed: ast2600: Support SDR50 for SD dev=
ice
>=20
>=20
>=20
> On Wed, 22 Sep 2021, at 20:01, Chin-Ting Kuo wrote:
> > The maximum frequency for SD controller on AST2600 EVB is 100MHz. In
> > order to achieve 100MHz, sd-uhs-sdr50 property should be added and the
> > driver will set the SDR50 supported bit in capability 2 register
> > during probing stage.
> >
> > Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
>=20
> As this is a limitation of the SoC it should be done in aspeed-g6.dtsi.
> Unless I've misunderstood?
>=20

Okay, it will be updated in the next patch version.

> Andrew
>=20
> > ---
> >  arch/arm/boot/dts/aspeed-ast2600-evb.dts | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> > b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> > index b7eb552640cb..4551dba499c2 100644
> > --- a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> > +++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> > @@ -280,6 +280,7 @@
> >  &sdhci0 {
> >  	status =3D "okay";
> >  	bus-width =3D <4>;
> > +	sd-uhs-sdr50;
> >  	max-frequency =3D <100000000>;
> >  	sdhci-drive-type =3D /bits/ 8 <3>;
> >  	sdhci-caps-mask =3D <0x7 0x0>;
> > @@ -292,6 +293,7 @@
> >  &sdhci1 {
> >  	status =3D "okay";
> >  	bus-width =3D <4>;
> > +	sd-uhs-sdr50;
> >  	max-frequency =3D <100000000>;
> >  	sdhci-drive-type =3D /bits/ 8 <3>;
> >  	sdhci-caps-mask =3D <0x7 0x0>;
> > --
> > 2.17.1

Chin-Ting
