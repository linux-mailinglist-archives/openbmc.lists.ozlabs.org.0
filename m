Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BCD29A558
	for <lists+openbmc@lfdr.de>; Tue, 27 Oct 2020 08:16:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CL30B3PkjzDqSg
	for <lists+openbmc@lfdr.de>; Tue, 27 Oct 2020 18:16:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.130.109;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300109.outbound.protection.outlook.com [40.107.130.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CL2yy3DnhzDqG8;
 Tue, 27 Oct 2020 18:15:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O4zxP9WMs73sJ00O63ZoSbKg74AnN/isZX65Iv4ssZRQd/Q8e8+/yPV0oNE8iC3+N4yq7AzFi4vPJbb6b1wG+bSo8mymWl0q+OJfRnOmbdTQYx3GknvfJBzOEDUCCR1lS9sIQfV9c9YJPUQHZ1UTMQq5wOfIDiML1QhrDNag3czqXx8cVjGvWTy0awZUMlQkhQI6YsWT93+zgsBmY3ysFQXRPNAgBIbZJi0CC8HmjcCTuW2cF40EmZx7dhyg29ltZx8McoN/irdm/xOVJYjybSwBc247qrplRwTXy8YzhmL5SVpovVe1QHjbREFLWc8NW8gvJd88mPgPFxy1g5vcHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95NAs4HG+5XDgsuWMl5KdAUIJ9hrokM8jDZvoQJaF/Q=;
 b=EF5h9tLLamU1s/1/EsV4OVrFd7Zm0LzUq5JqeUDk2BwsqIvXTKQi+0+3Nr+UaKZgzcd7Ukh53kj+E6wDcoCLpOlucXCjGai770xZ5Cdiisu9QK7Lbgq1FMlIvwm8SgG9hgLICtapQkCIp7I5BHQv0U3zRAujIMQHZ6n75lF3YW1yzZoAZOjGArgSLQdlNNsXZ2XJsYu9dloJT/w9iLddZWRrQ02pQM3Z+0ouIc5C9AIYB4gT+1w2mdVo7NTeZtMmlzXev6/V7C+aCp2xNNXOXnmFUHzbvQqkdAbCuICHUERUPxo2teFEzXMM/0+D/56602P5xMbw0bPSM0Rg9qW9Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK2PR06MB3460.apcprd06.prod.outlook.com (2603:1096:202:37::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.24; Tue, 27 Oct
 2020 07:14:48 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::a1a1:8859:d07a:2473]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::a1a1:8859:d07a:2473%3]) with mapi id 15.20.3477.029; Tue, 27 Oct 2020
 07:14:48 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>
Subject: RE: [PATCH v2 5/5] dt-bindings: aspeed-lpc: Remove LPC partitioning
Thread-Topic: [PATCH v2 5/5] dt-bindings: aspeed-lpc: Remove LPC partitioning
Thread-Index: AQHWq0XpiGvCIQ3se0K0W53Se1w+kamrCV1w
Date: Tue, 27 Oct 2020 07:14:47 +0000
Message-ID: <HK0PR06MB3779F21A233D4B02824E5FB091160@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20201005082806.28899-1-chiawei_wang@aspeedtech.com>
 <20201005082806.28899-6-chiawei_wang@aspeedtech.com>
 <2e2d3a02-6677-4b0e-b538-d3130a3b20d1@www.fastmail.com>
In-Reply-To: <2e2d3a02-6677-4b0e-b538-d3130a3b20d1@www.fastmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3db91d96-549c-4be9-93e2-08d87a47fd1b
x-ms-traffictypediagnostic: HK2PR06MB3460:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR06MB34604503F506DE7F37214E1291160@HK2PR06MB3460.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AaBI1Z+XzRSCvK4BbI8X10pzmkInhjw7reyLQW7QFXj4vQT3sYQV+tMgMiz5zYekWx2RH2iRv4c7UZ3pcGv2HOhnG/Wd4rsQHVa8dvGc/Ut2eu4zUVF0njzgkga9eTN4GPaekyVItnGQUGNPV2zJy/liJ9EqRhxXVsnRBLJtRoLYH2Sv5cJG6BdFLbbPGfgaomqZ13d7bvevevoA9rg7Jw10PQ2cWTfjis8AzK6MJvhOnGRGbC84fSatwk6/8idQ3U5NaR7v1uG6ndAfRikxp090hD0OCr95qHkkZ3T4vAiBTlPRjL0zMajTseDG9WM6xyydYhnPubcLpeehiXY+rOm78wA5lSeosUvqIWwqb+4n+Rnl+bZxim8DZ3toBGodVwZMKNIkkj7GtFsWI3f5tA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(396003)(376002)(346002)(136003)(366004)(8936002)(478600001)(186003)(8676002)(2906002)(33656002)(66556008)(64756008)(83380400001)(7696005)(53546011)(86362001)(26005)(6506007)(71200400001)(55236004)(110136005)(52536014)(66446008)(76116006)(316002)(54906003)(966005)(7416002)(5660300002)(66476007)(66946007)(55016002)(9686003)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Ej0D9qoz8Jq9upQsVa5U0Z1vrmeMKtYD3Fm5XbiKqiVOmc/99o8S90Afyj8ZgZlxNf8Z1t8mtF/FSFgmZNJjDRaECkc46l64zd3/FSWOOaWlIkQSH3q8OXOUv02fJYuC3Y6PXjAQs4iudTVzklvfOdB1EabfkieR1Fhv1ppFOwobq2CyNLngramlgLt89szTP9w6Rl/rBIfhffW4Mncsa2NrbNTzi20bXRjria+mcNK2mwxv3dbTNmSNGKoDHqsGShj2DAp2luzhkMARi9FCXgpfWa5aKmQ+71YgnOu1n/w16fDU9pEzZ0x8Em61qxusrlwNBYzwmUiN0BW7SejJ1EvQEwA53sGTDBCfAkA0lJhe5H3tDacEHCaSBNYseCs0oUkjWvUAl3Of0sb7u0OlXySBm0sFPO37VJ+UrNhuCZCFf1mneFbGmktqd5BWhTWBi0vVAJZB9iB/hIY6FzQxAU0cNnCIR7HYd6stOvfnys1lE30RVqBfA/Hfa3R5XRIkW0EmID/nx2aIHXyIxAFEen8l+1I+c6KbeVTq5a6H0JQQ/UM/cUe8vyijjSdcqRSBlYDwlpzBOJQLPuTvuyxDtEyuJD611hyyIH+uIJavZipaxKHV3yFvgLT3EMBGmOLwiRhA9jdfD7uyoCwu7pWZMg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db91d96-549c-4be9-93e2-08d87a47fd1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2020 07:14:47.6037 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p595TC1aMsPHMgFf4/ivBUyAoFek4Whqk20+eIm65jy53+jBppRAuKw2jwV5d6Kk16Ptz6DptMWfkyotquZJ8zpTw5WDnzHhoUaq/fEUDiE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR06MB3460
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Corey Minyard <minyard@acm.org>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Lee Jones <lee.jones@linaro.org>, Cyril Bur <cyrilbur@gmail.com>,
 Haiyue Wang <haiyue.wang@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,

> -----Original Message-----
> From: Andrew Jeffery <andrew@aj.id.au>
> Sent: Monday, October 26, 2020 11:12 AM
> To: ChiaWei Wang <chiawei_wang@aspeedtech.com>; Rob Herring
> <robh+dt@kernel.org>; Joel Stanley <joel@jms.id.au>
> Subject: Re: [PATCH v2 5/5] dt-bindings: aspeed-lpc: Remove LPC partition=
ing
>=20
> Hi Wang Chia-Wei,
>=20
> On Mon, 5 Oct 2020, at 18:58, Chia-Wei, Wang wrote:
> > The LPC controller has no concept of the BMC and the Host partitions.
> > This patch fixes the documentation by removing the description on LPC
> > partitions. The register offsets illustrated in the DTS node examples
> > are also fixed to adapt to the LPC DTS change.
> >
> > Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
>=20
> The documentation at [1] suggests this should probably be patch 1/5 rathe=
r
> than 5/5, so if you send the series again I'd probably rearrange it. Foll=
owing the
> steps outlined in [1] helps catch Rob's attention in the right way :)
>=20
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocume
> ntation/devicetree/bindings/submitting-patches.rst?h=3Dv5.9

Thanks for pointing out the guideline.
I will rearrange the commits if v3 change is requested.

>=20
> Rob:
>=20
> The changes here go some way towards cleaning up mistakes I made in the
> Aspeed LPC controller binding. The proposed change is very much not
> backwards compatible, but Joel and I don't want to live with the resultin=
g mess
> in the drivers of catering to both layouts. Another way we could avoid th=
e
> driver mess is to rev all the bindings and immediately drop support for t=
he old
> compatibles in the drivers. This creates a bit more churn in the bindings=
. What
> are you willing to accommodate?
>=20
> All consumers I'm aware of ship the Aspeed BMC dtb in FIT images alongsid=
e
> the kernel, so while backwards-incompatible changes are rightly frowned u=
pon
> I feel we probably wouldn't cause too much damage if we went that path.
>=20
> Andrew
>=20
> > ---
> >  .../devicetree/bindings/mfd/aspeed-lpc.txt    | 85 +++----------------
> >  1 file changed, 14 insertions(+), 71 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> > b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> > index a92acf1dd491..866f54a09e09 100644
> > --- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> > +++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> > @@ -9,13 +9,7 @@ primary use case of the Aspeed LPC controller is as a
> > slave on the bus  conditions it can also take the role of bus master.
> >
> >  The LPC controller is represented as a multi-function device to
> > account for the -mix of functionality it provides. The principle split
> > is between the register -layout at the start of the I/O space which
> > is, to quote the Aspeed datasheet, -"basically compatible with the
> > [LPC registers from the] popular BMC controller -H8S/2168[1]", and
> > everything else, where everything else is an eclectic -collection of
> > functions with a esoteric register layout. "Everything else", -here
> > labeled the "host" portion of the controller, includes, but is not
> > limited
> > -to:
> > +mix of functionality, which includes, but is not limited to:
> >
> >  * An IPMI Block Transfer[2] Controller
> >
> > @@ -44,8 +38,8 @@ Required properties
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> >  - compatible:	One of:
> > -		"aspeed,ast2400-lpc", "simple-mfd"
> > -		"aspeed,ast2500-lpc", "simple-mfd"
> > +		"aspeed,ast2400-lpc", "simple-mfd", "syscon"
> > +		"aspeed,ast2500-lpc", "simple-mfd", "syscon"
> >
> >  - reg:		contains the physical address and length values of the Aspeed
> >                  LPC memory region.
> > @@ -55,66 +49,17 @@ Required properties
> >  - ranges: 	Maps 0 to the physical address and length of the LPC memory
> >                  region
> >
> > -Required LPC Child nodes
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > -
> > -BMC Node
> > ---------
> > -
> > -- compatible:	One of:
> > -		"aspeed,ast2400-lpc-bmc"
> > -		"aspeed,ast2500-lpc-bmc"
> > -
> > -- reg:		contains the physical address and length values of the
> > -                H8S/2168-compatible LPC controller memory region
> > -
> > -Host Node
> > ----------
> > -
> > -- compatible:   One of:
> > -		"aspeed,ast2400-lpc-host", "simple-mfd", "syscon"
> > -		"aspeed,ast2500-lpc-host", "simple-mfd", "syscon"
> > -
> > -- reg:		contains the address and length values of the host-related
> > -                register space for the Aspeed LPC controller
> > -
> > -- #address-cells: <1>
> > -- #size-cells:	<1>
> > -- ranges: 	Maps 0 to the address and length of the host-related LPC
> memory
> > -                region
> > -
> >  Example:
> >
> >  lpc: lpc@1e789000 {
> > -	compatible =3D "aspeed,ast2500-lpc", "simple-mfd";
> > +	compatible =3D "aspeed,ast2500-lpc", "simple-mfd", "syscon";
> >  	reg =3D <0x1e789000 0x1000>;
> >
> >  	#address-cells =3D <1>;
> >  	#size-cells =3D <1>;
> >  	ranges =3D <0x0 0x1e789000 0x1000>;
> > -
> > -	lpc_bmc: lpc-bmc@0 {
> > -		compatible =3D "aspeed,ast2500-lpc-bmc";
> > -		reg =3D <0x0 0x80>;
> > -	};
> > -
> > -	lpc_host: lpc-host@80 {
> > -		compatible =3D "aspeed,ast2500-lpc-host", "simple-mfd", "syscon";
> > -		reg =3D <0x80 0x1e0>;
> > -		reg-io-width =3D <4>;
> > -
> > -		#address-cells =3D <1>;
> > -		#size-cells =3D <1>;
> > -		ranges =3D <0x0 0x80 0x1e0>;
> > -	};
> >  };
> >
> > -BMC Node Children
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -
> > -
> > -Host Node Children
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> >  LPC Host Interface Controller
> >  -------------------
> > @@ -145,14 +90,12 @@ Optional properties:
> >
> >  Example:
> >
> > -lpc-host@80 {
> > -	lpc_ctrl: lpc-ctrl@0 {
> > -		compatible =3D "aspeed,ast2500-lpc-ctrl";
> > -		reg =3D <0x0 0x80>;
> > -		clocks =3D <&syscon ASPEED_CLK_GATE_LCLK>;
> > -		memory-region =3D <&flash_memory>;
> > -		flash =3D <&spi>;
> > -	};
> > +lpc_ctrl: lpc-ctrl@80 {
> > +	compatible =3D "aspeed,ast2500-lpc-ctrl";
> > +	reg =3D <0x80 0x80>;
> > +	clocks =3D <&syscon ASPEED_CLK_GATE_LCLK>;
> > +	memory-region =3D <&flash_memory>;
> > +	flash =3D <&spi>;
> >  };
> >
> >  LPC Host Controller
> > @@ -174,9 +117,9 @@ Required properties:
> >
> >  Example:
> >
> > -lhc: lhc@20 {
> > +lhc: lhc@a0 {
> >  	compatible =3D "aspeed,ast2500-lhc";
> > -	reg =3D <0x20 0x24 0x48 0x8>;
> > +	reg =3D <0xa0 0x24 0xc8 0x8>;
> >  };
> >
> >  LPC reset control
> > @@ -194,8 +137,8 @@ Required properties:
> >
> >  Example:
> >
> > -lpc_reset: reset-controller@18 {
> > +lpc_reset: reset-controller@98 {
> >          compatible =3D "aspeed,ast2500-lpc-reset";
> > -        reg =3D <0x18 0x4>;
> > +        reg =3D <0x98 0x4>;
> >          #reset-cells =3D <1>;
> >  };
> > --
> > 2.17.1
> >
> >
