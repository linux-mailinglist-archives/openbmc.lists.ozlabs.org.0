Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C0A2F264D
	for <lists+openbmc@lfdr.de>; Tue, 12 Jan 2021 03:33:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFF4S0w98zDqyJ
	for <lists+openbmc@lfdr.de>; Tue, 12 Jan 2021 13:33:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.130.129;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300129.outbound.protection.outlook.com [40.107.130.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFF3M2GMMzDqy6;
 Tue, 12 Jan 2021 13:32:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nEEwgv4Qw4FT45OUgnbkirsjcw/UYUsllDEwgxAckIrfReG16jaYOMYs2/Hf1Ihu7iNuzoZzxywFgCXuC46TidRgDnp1aVDfP7yyow+EmMisaQuix91t572EMqlmcqUB2F7tdghFb4TOzO/HApxWsiE+H2r6vcdCfnZkr6/iyxJ37gwx1h1df1LU/KJH+P2Qjo7C1+0LMNAyiR0YQNo0cXzSjS0pOCU0zaOkZOdxAVgpZhGdP6QuzC2xifysU1rsSCGmObzilpZKTOAax2YMFvq0n1ye/BtbtPxtFinW3pPLDytwPUvUtkj0PaA/sGn3VtYl6O5HHbzzakd187pjtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ly0vgqXQoxcgcmSG+8QBuugXbTb3wjJ1oPT5JtNMKjw=;
 b=FsLF2a+NqfLLmuqWHDpr9tPhaFBWA1n7YmZw2LrdDftCWH1Vss9vJ9YKGenW6kIHe/wM0FjwjVRawftg7XQU3v9QaTbH4qiM3OBeP7Gf04kAQWvEwqg6546e2sKyJvFZZh9qCIFlDT4pnEmI6S8ahuGk81jD3xheTwS/663It/1whGx+AKgx5+Hii1TvUuaXkT2sNytBPrGmGW+iLfwbz84Z+oCL8poiQxyWDJ9Kt67B4Nc9LIwUXvwlmUK5afIvSRAyRguSlM9LRmwaVUfMjnkWKAl/jU6AKtacXIW17N3DKe+ZObaOm9wB/gd7xvDO0zMrts2tDlhnin6Ft2z/zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK0PR06MB2370.apcprd06.prod.outlook.com (2603:1096:203:42::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 02:32:11 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::394c:29f2:cb4c:55ed]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::394c:29f2:cb4c:55ed%3]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 02:32:11 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [PATCH v4 1/5] dt-bindings: aspeed-lpc: Remove LPC partitioning
Thread-Topic: [PATCH v4 1/5] dt-bindings: aspeed-lpc: Remove LPC partitioning
Thread-Index: AQHW3axE0G2IuF3DG06FbgGmQw41XKoi+DAAgABh3IA=
Date: Tue, 12 Jan 2021 02:32:10 +0000
Message-ID: <HK0PR06MB377970995D22F06259721AE091AA0@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20201229063157.3587-1-chiawei_wang@aspeedtech.com>
 <20201229063157.3587-2-chiawei_wang@aspeedtech.com>
 <20210111203850.GA3022469@robh.at.kernel.org>
In-Reply-To: <20210111203850.GA3022469@robh.at.kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4e389c3-b0b5-4043-7dae-08d8b6a243cb
x-ms-traffictypediagnostic: HK0PR06MB2370:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR06MB2370C3692B8BB8A9A1347F0091AA0@HK0PR06MB2370.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CzoBIXKeaH5qN9xbQSFw749B0QKCtV/Dp4L7E4yt6tbXKQB6pSAkj5E6qrNuU/ZhO69wFP1n2tkUaIchoSFuqF3SNrF4h5Bk8dBeDFAIi9s4yYqr3onhPvHBsa8Ted1UHW429qdlf2TKPjDMZOZ9YV53657I1MxiuNVcl8n7WLNUsdW2/WFYT33HIWBSUTog1eOOxA5o+b9EpV6wMl0P+0lQ6FDJFGYoV9BwT/5lyvfGh5liZFhu/VV0tRNGTELxVQ0wklb1Mtr75BIy+OVBcdHAI2VhUZK7KNpnR4pX44wWFLzXAQoQ6fM3UW2btIt/BkcE5Hwot4FzdFlYJrctG3OqzJR7Px1k9+dOi8FO9Tm6ZU4uFdg5zIYwVTWEw8DY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(39840400004)(346002)(376002)(396003)(55016002)(5660300002)(7696005)(54906003)(66946007)(55236004)(71200400001)(8936002)(478600001)(9686003)(7416002)(4326008)(6916009)(6506007)(2906002)(83380400001)(76116006)(66446008)(26005)(64756008)(8676002)(66556008)(316002)(86362001)(186003)(66476007)(33656002)(52536014)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?tqTg0Jxxpg9KRorvPQ+/A/W2x5iSGYf5ch/D6nfE7r8TZBW34j3Al58In1TI?=
 =?us-ascii?Q?Q/RFfwWJBLMRYssOg/gkS12UiO+T5f2B/iyZzRZ3w+oUWaVDUfUgHlmN3fSr?=
 =?us-ascii?Q?l1g7ARCeTDNpVMBoX6cgftb520w2b8WXhKEBobLko6HJwlMWGLTUJBgmM9cy?=
 =?us-ascii?Q?xvlvFvHMjRsmsxh31YblAiXHZpb9XEmJEGH3qG9Hy29BUt7ne301YBs+KFV9?=
 =?us-ascii?Q?N7+WNpFTiRCnHi6anOJcSgZRDBFylw2cr+Tu0tfZpq7nRA+IFQRcQsPhhTqH?=
 =?us-ascii?Q?372NvL37+fcuUGcxpqyf3AnwELWFvEO7N8Hf9Ydt44lcOZRMq/RAIN9pqaEd?=
 =?us-ascii?Q?PGQIb1IcbiJ+P2PFUgHz7hOE4pmI0ZWZ/Ere1TS5ZlGUhLX3YEWCjKVQrzhf?=
 =?us-ascii?Q?3ity9VtxaxHyxSO6k2FZKFl5PwTOnyZblcWfzN8cKr21/b/a06dv/8waL5wV?=
 =?us-ascii?Q?lC5m3qTtI5G4909w3x0Ch5H/XoiLi5ZELIF1trXRPaRJcGqQGj+l/KLP38oK?=
 =?us-ascii?Q?gZm19W+xwJgxwvoHrh/fdhJ+bOZfwoeRUX1SHOJF3v+52GnZOQewbTX9h8gy?=
 =?us-ascii?Q?uVQ6caCGsm3HtdMIFVCZNdka8fxSzve6BsNLNy78KIRqHFRwsJH4jviGeuNU?=
 =?us-ascii?Q?Pajt6EmPz+0Mj/Vy+J7shz7J8N6kAxfjvkXhdnr2M4qZUocrFkaTov7eem1a?=
 =?us-ascii?Q?yDT/oc5CGmuGpLLpdG+x1qYP7ZlYThWnhJ9bUAEOMmXPNfBZ+EBcJV2Nmymy?=
 =?us-ascii?Q?7CGPKKZIi0DgwfVPRar5k6ochLAe5OjckuQ0vFB6hePp+w24syzBQDrwq3C1?=
 =?us-ascii?Q?3tV/zfeKTOk4rajmgwx9ROVky3LYtIg7XDI5cZpQw4TyOgaSBnKVvIK/Dn1Q?=
 =?us-ascii?Q?62wxAafaMoYiAqkJKuLqmHou6L0FceceTiC8dlCdZYwFi2533ZmIigoBPemi?=
 =?us-ascii?Q?EDOGUp236r7vVDi/DxvVHnwZ8xu4KmOWKseiVeeAnFI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4e389c3-b0b5-4043-7dae-08d8b6a243cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2021 02:32:10.8553 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8ExuxESVPKnZFlxT9BXKUnxbpyFwdTXYtNOqcf4DR9G/50uDyyhXMEZXzOV3PR16GKSUvcq/wmIdIv4nsylt2yxY2XaZ58tOMqwM9zkhjn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2370
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
 "haiyue.wang@linux.intel.com" <haiyue.wang@linux.intel.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "minyard@acm.org" <minyard@acm.org>, BMC-SW <BMC-SW@aspeedtech.com>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cyrilbur@gmail.com" <cyrilbur@gmail.com>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rob,

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Tuesday, January 12, 2021 4:39 AM
> To: ChiaWei Wang <chiawei_wang@aspeedtech.com>
> cyrilbur@gmail.com; rlippert@google.com
> Subject: Re: [PATCH v4 1/5] dt-bindings: aspeed-lpc: Remove LPC partition=
ing
>=20
> On Tue, Dec 29, 2020 at 02:31:53PM +0800, Chia-Wei, Wang wrote:
> > The LPC controller has no concept of the BMC and the Host partitions.
> > This patch fixes the documentation by removing the description on LPC
> > partitions. The register offsets illustrated in the DTS node examples
> > are also fixed to adapt to the LPC DTS change.
> >
> > Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
> > ---
> >  .../devicetree/bindings/mfd/aspeed-lpc.txt    | 99 ++++---------------
> >  1 file changed, 21 insertions(+), 78 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> > b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> > index d0a38ba8b9ce..90eb0ecc95d1 100644
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
> > @@ -44,80 +38,29 @@ Required properties  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> >  - compatible:	One of:
> > -		"aspeed,ast2400-lpc", "simple-mfd"
> > -		"aspeed,ast2500-lpc", "simple-mfd"
> > -		"aspeed,ast2600-lpc", "simple-mfd"
> > +		"aspeed,ast2400-lpc-v2", "simple-mfd", "syscon"
> > +		"aspeed,ast2500-lpc-v2", "simple-mfd", "syscon"
> > +		"aspeed,ast2600-lpc-v2", "simple-mfd", "syscon"
> >
> >  - reg:		contains the physical address and length values of the Aspeed
> >                  LPC memory region.
> >
> >  - #address-cells: <1>
> >  - #size-cells:	<1>
> > -- ranges: 	Maps 0 to the physical address and length of the LPC memory
> > -                region
> > -
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
> > -		"aspeed,ast2600-lpc-bmc"
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
> > -		"aspeed,ast2600-lpc-host", "simple-mfd", "syscon"
> > -
> > -- reg:		contains the address and length values of the host-related
> > -                register space for the Aspeed LPC controller
> > -
> > -- #address-cells: <1>
> > -- #size-cells:	<1>
> > -- ranges: 	Maps 0 to the address and length of the host-related LPC
> memory
> > +- ranges:	Maps 0 to the physical address and length of the LPC memory
> >                  region
> >
> >  Example:
> >
> >  lpc: lpc@1e789000 {
> > -	compatible =3D "aspeed,ast2500-lpc", "simple-mfd";
> > +	compatible =3D "aspeed,ast2500-lpc-v2", "simple-mfd", "syscon";
> >  	reg =3D <0x1e789000 0x1000>;
> >
> >  	#address-cells =3D <1>;
> >  	#size-cells =3D <1>;
> >  	ranges =3D <0x0 0x1e789000 0x1000>;
>=20
> No child nodes? Then you don't need 'ranges', '#size-cells', nor '#addres=
s-cells'.
>=20
There are child nodes in LPC, should I list all of them or just few for the=
 example?

Chiawei

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
> > @@ -149,14 +92,12 @@ Optional properties:
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
> > @@ -179,9 +120,9 @@ Required properties:
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
> > @@ -192,16 +133,18 @@ state of the LPC bus. Some systems may chose to
> modify this configuration.
> >
> >  Required properties:
> >
> > - - compatible:		"aspeed,ast2600-lpc-reset" or
> > -			"aspeed,ast2500-lpc-reset"
> > -			"aspeed,ast2400-lpc-reset"
> > + - compatible:		One of:
> > +			"aspeed,ast2600-lpc-reset";
> > +			"aspeed,ast2500-lpc-reset";
> > +			"aspeed,ast2400-lpc-reset";
> > +
> >   - reg:			offset and length of the IP in the LHC memory region
> >   - #reset-controller	indicates the number of reset cells expected
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
