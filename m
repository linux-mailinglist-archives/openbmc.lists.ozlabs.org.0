Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5185C2D91D1
	for <lists+openbmc@lfdr.de>; Mon, 14 Dec 2020 03:46:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CvQkQ25vgzDqL9
	for <lists+openbmc@lfdr.de>; Mon, 14 Dec 2020 13:46:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.108;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320108.outbound.protection.outlook.com [40.107.132.108])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CvQj03wPPzDqRX;
 Mon, 14 Dec 2020 13:44:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G3T26FPDH0d5ud4aCcBgJuG4BiZy8yAqm/MZRB84Qd5mB5eQxn2NhnnhhsTF3/DB96y5nouTZeXObHguKGIeH46TzesmZTzjCyZxquP2A19Vt6jDAc886YOe0zc7WA+AMsqH6svqHpDmh5TbTwa8lPHUkGi94xf3Q0ZlCS0+OYo/WXHJqxEzwAqFwGVcaFMllW7VElgTNUMtBk7/BHMzeS0DZNOLvw+0syr4x86/KsqopHJl4xtAbRNC/F35LhEy5XVp7v9eSeK1TNxoQo2M2+L4jBlrD3xkNRysnCLH8cxO3/siYi2FBSRPgfpFrrkf0g+pcOvIij4ceW+H5zGazA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CMcTpZgmsnllOCRht/wkHVq8cHzvKRDv1CIdoXXoZ/I=;
 b=XJb48UtuMGnxuyAvomFiOBa38CrCERCIEzFCL2CNFJc/aeh0sD+fJdHBLrgtJRUC/LJ18PlOwKzGzCf5URPnCIX6L6PKUC+i3pAMXGwPjhxzHIeGTkaz1+M1tl7kFk/GoSRli8tgwCE/6FnZjlFyHjuzLsVpxKSD6dNVT8oXTFCXLsR72A9wJRLp+V2Azz3jUHZAVyKgDkPUkhRekmf89sMzBus8QIjegWWgHeMdsdsxZy4hxlaixldggoSDrNBMepNtb+qRiDecoaV+bzm1+wMk6EJ2e61x3CJwtgwZNOxWVDZwRAd568/D5jC7wav1sKqRynvYwtXA0vbh4UM8pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK0PR06MB2274.apcprd06.prod.outlook.com (2603:1096:203:4d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Mon, 14 Dec
 2020 02:44:23 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::7061:73d9:50ae:b35e]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::7061:73d9:50ae:b35e%7]) with mapi id 15.20.3654.025; Mon, 14 Dec 2020
 02:44:23 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>
Subject: RE: [PATCH v2 5/5] dt-bindings: aspeed-lpc: Remove LPC partitioning
Thread-Topic: [PATCH v2 5/5] dt-bindings: aspeed-lpc: Remove LPC partitioning
Thread-Index: AQHWq0XpiGvCIQ3se0K0W53Se1w+kan2LtDg
Date: Mon, 14 Dec 2020 02:44:22 +0000
Message-ID: <HK0PR06MB3779F5B4B9629909DDF441F091C70@HK0PR06MB3779.apcprd06.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 73e832f6-415f-4504-55f8-08d89fda2a25
x-ms-traffictypediagnostic: HK0PR06MB2274:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR06MB22749012E518D78F834A8AF791C70@HK0PR06MB2274.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SZs/mpw98cMoxQwsR9N9XJgchCe8fQ7UQjNH1hcxVmHWt/XspjY5FufHSITlpDXv1/mYwHkPpj9VUDynuzVqXzGhmwRdNK2yNDNP4eIYGXq4EE0GEgcmYKBYBAFwpLiRPgUT1Hn215qzmIapqHlD95NVg+lXJCH75+74kI65pFiKh2CaT+5dAi4ndufdfAm7vEt6LYibT385VNZRKS2CGrJOL+YqQakO0vT2nJbXfBL9+X/AaKdd2BX9Iq1wCWAfmCVobQPDVAoWSKrNYOlDOYub73VVKueRiQTVFrtkfJAL+Nff97h0jBGc7iJkxqLQjTvwhO2KYz6C78n60eLipkHTEI5IoO0Sb9MJ4OsmX38irzZUggIYAfnxFTaHVG2IzvjH9DYdOdRD5mLHPg7lhw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39830400003)(346002)(136003)(366004)(396003)(64756008)(66556008)(26005)(8936002)(66476007)(55236004)(9686003)(66946007)(4326008)(66446008)(966005)(71200400001)(86362001)(6506007)(110136005)(478600001)(53546011)(54906003)(5660300002)(55016002)(316002)(76116006)(83380400001)(2906002)(52536014)(7696005)(8676002)(186003)(7416002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?mh9K1MRp/RHJ1IAzE3y7t1KXZohtaxGXMpemezDFIENwccDfRr2ZETjDJWu6?=
 =?us-ascii?Q?JrocWgtTMV9rq6+483pBf1aPOmTszvzmfT/LJHsFQVvp1pAtejhfMtzKpr/y?=
 =?us-ascii?Q?VwES7Y+1ab6XOqQMFI4dCKL/OMCHiMEFwezScevz2iFSy9uVB3nPQOeJTRn+?=
 =?us-ascii?Q?Kdx3qCAHyzISqBkifmy27YEBjJvgM6BpQs8quSPfLJEyW4rQ6P2L+yccl5uY?=
 =?us-ascii?Q?4LH6lrCO5yB71QMgf8rs1blZFSePreALam7zKfytTHtUpuOkjmNk3fElhtII?=
 =?us-ascii?Q?8/puTCF8hMZ2XkYfydDIhLv9arQc2ngtC6pGNSMl9yfdHSxS1FQFMZHh+FAK?=
 =?us-ascii?Q?X90XegCptbkWqJkqhalxa4mUKvGwm/RVavMWsGUeG4CTpASuF8odMn0pPxxx?=
 =?us-ascii?Q?uyYzpCsLimxnyuEDF5MqITNaCQmPlPl93fsc1O+tEm/72cSFgwz5Z28cpKra?=
 =?us-ascii?Q?5PoRLiF4/2LB6AR+9Do1JMESK8pCls00XT2fqLTj59JQ0EIBVHBOuMogGiUK?=
 =?us-ascii?Q?JJ/GbKUJ5a2/Zw2MtwA5hv4vFuTXwHIC8mg/plARnH1n6z56y0jQhBwpkKAn?=
 =?us-ascii?Q?qeX+E8WC+7F4XNdUkMmwwgu7npwCse9Oq/sf9Lf1M3SVXpdUhVveLTEYVLAe?=
 =?us-ascii?Q?Z/fnkPZcWdZ2bOXGBrDyWYqe6sXBm/MNFxYsygF3/CjwwjG+V+LObvYjQHs5?=
 =?us-ascii?Q?MCPb+7BM2FxTqRZQIl6hsI84ny2rrgfQVRFTov1lB/9ZibWkuP3TLnvuXjmo?=
 =?us-ascii?Q?EVhMeR/kYLH9YO1Btecl+2AUi+Xq/NwK5rHELgDfqNS5PNlwwZyNxNHaLBM+?=
 =?us-ascii?Q?DXGbqaFxwSbLTSKm+xC/nLQs5pkn+TgmlMnyGGGsF5yh4SlCgilpmNJSBppq?=
 =?us-ascii?Q?Hh6bMbE/EbPuh7O7ypW0e9Tt5TBGxixwkUOdaJQ3HfWte9Z+NKjQ0lZb6pNg?=
 =?us-ascii?Q?vnmh+8Im4Tu8Nko9TLYBgpPlPKdKDu9NlL4/Sh7ScZg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73e832f6-415f-4504-55f8-08d89fda2a25
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2020 02:44:23.0012 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ave/rWn2JZdRB2RPoW0EH7YaowV+SE0r+bq+j13QO4sGFEXboLxHvf4joZO4+sbUdmkzqNMajw1zqwrh6nSH1s5/VBTeOR6yVLGxSO4KQRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2274
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

Hi Andrew & Rob,

Do you have any suggestion on this patch?
Or should I send a v3 patch with the commits reordering for the review?
Thanks.

Chiawei

> -----Original Message-----
> From: Andrew Jeffery <andrew@aj.id.au>
> Sent: Monday, October 26, 2020 11:12 AM
> To: ChiaWei Wang <chiawei_wang@aspeedtech.com>; Rob Herring
> <robh+dt@kernel.org>; Joel Stanley <joel@jms.id.au>
> Cc: Ryan Chen <ryan_chen@aspeedtech.com>; Lee Jones
> <lee.jones@linaro.org>; Corey Minyard <minyard@acm.org>; Arnd Bergmann
> <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Linus
> Walleij <linus.walleij@linaro.org>; Haiyue Wang
> <haiyue.wang@linux.intel.com>; Cyril Bur <cyrilbur@gmail.com>; Robert
> Lippert <rlippert@google.com>; linux-arm-kernel@lists.infradead.org;
> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org;
> openbmc@lists.ozlabs.org; linux-gpio@vger.kernel.org
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
