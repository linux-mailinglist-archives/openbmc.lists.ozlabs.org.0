Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E6E584A0E
	for <lists+openbmc@lfdr.de>; Fri, 29 Jul 2022 05:04:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvC6h0dLqz2ywJ
	for <lists+openbmc@lfdr.de>; Fri, 29 Jul 2022 13:04:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=XDAnH24r;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=40.107.117.90; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=XDAnH24r;
	dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2090.outbound.protection.outlook.com [40.107.117.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvC62109Gz2xHZ;
	Fri, 29 Jul 2022 13:04:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJYGwzre8YlYpqKenHteO7U5RjiblK1Xl0Qaz2cR4jSCMz5VbbM/tCFAFbdo0XS3nisu7luuczW+gI1tNbN36MQ0k6MBdlUxZv18CxuWogzJMQusdAFkPxvBpORJQEdCwaAWviUxCNxudZuFSygNH1KthDUvr6/x0E8nHywfpg+5gYkbdy5j5Qr5vLDJuB5EBdJ0TehQan23MoA8Zc9Mo7cFb8uulzKGubDnLfamvTeXMbwBoJtPGY4O7X+e8SKUEpKIEsEw1uQ7nNNiDwCQFlzDS4+c9xyukglWbf3iCzZoQPlOg62h63npU6l+Tkt71aX2W/nV+zkYHb/BK9dCwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWVinNbGsG2PmYK+qla+q3YBju7NQAEKIUez/3gifqU=;
 b=FbRaXe/+V3K8Z6226zhRnn6iuP3xXp6kv+x7NSKeL5CaKIjx4QytAohUn8b/XCJorNFwxopRAjwl9ZSZHjfIoL/2sqqs1DwXLTEF5kD5JU49zNo+HQOwnEV6ZkTnWfW+j9IjqOjXkCzkSLpx2EIB/O05RUmoFYaMxiBOllWMs9+ot1e6eLT1oPDXya0TFNjIHgGqsHVcxRkxXOr8sTxshH3NGdLOOdyp+XyTy8SNSFEjLiJB6dF6K68eDNqriDYfh2QzG6xxOgS9sUK8MbKG0gG0x+tGpeQn6NuCyH2+R7BxjCa/2xHikuQSx0+yYo+W1vCirQb/9vjcsh6YK5dt9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWVinNbGsG2PmYK+qla+q3YBju7NQAEKIUez/3gifqU=;
 b=XDAnH24rWjEEnPpC7PZ/T6CKCowF0tApSuLhbp0eO1GY+sNtmMO3Ywo/Mcy75JtIrFxbzx4zMDxY7k0jFP6KEfLgC9ZHfawoCDxyMx2YGLm/BTzv5prsnbatWkGlyMJaFYhQchP3aCecadcwAywIg5ZpXkApPkPPoEAAvq26wlUh/2kWbvP5iH/f4XjYmm0r11mcd72XVSrgcppFxLxBs30GZxXQNK7w+4dEToSgoUxBJO2j0B9nwvbMwnBYNlBpT0tFoDnw+GMI3msLwxSH2528cCFlV9kH3STmQaa2C4EbCWiuwEDNZe+9pK2vfqqvsWnEP6FKudDnDdPmf01AzQ==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB4531.apcprd06.prod.outlook.com (2603:1096:820:77::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Fri, 29 Jul
 2022 03:03:43 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::80c3:a65e:1caf:2b32]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::80c3:a65e:1caf:2b32%8]) with mapi id 15.20.5458.024; Fri, 29 Jul 2022
 03:03:43 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Philipp
 Zabel <p.zabel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>
Subject: RE: [PATCH v3 2/3] dt-bindings: i2c-ast2600: Add bindings for AST2600
 i2C driver
Thread-Topic: [PATCH v3 2/3] dt-bindings: i2c-ast2600: Add bindings for
 AST2600 i2C driver
Thread-Index: AQHYaPENO2grG+HzSECGUwldbn2ojq2VE+oAgAAINMA=
Date: Fri, 29 Jul 2022 03:03:43 +0000
Message-ID:  <SEZPR06MB5269DFE2CF762B62846D315EF2999@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20220516064900.30517-1-ryan_chen@aspeedtech.com>
 <20220516064900.30517-3-ryan_chen@aspeedtech.com>
 <5d863bc1-4f27-48b6-89ab-c3f02bc09057@www.fastmail.com>
In-Reply-To: <5d863bc1-4f27-48b6-89ab-c3f02bc09057@www.fastmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 98295163-42b2-4891-ce6d-08da710ef276
x-ms-traffictypediagnostic: KL1PR0601MB4531:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  eKuMsmIW9KQ4yZ73tMUinIKORFO57OjFuBkkuXCKplr8Tp4Oe6iT6w7h/keD/JMFYoyQhs9qStC5OzTXv47U0z2O77U9bKnvaLRwYKu9VSLNmimGuifqFWknUklp3mOXBlmH7og32SMlFbNccW8AcxHTmZslklsh545Bo+zWAIg6DC3ML+xDbIoc2KCbaJ1crfXzuowt15ACMD6QAETsQ3G3SBRam3NQxfj9FJpQ7JRl14ODHb0g98kFp/kQXn/Q+WKF1H9pZ142mNFfmPyb5ogk75op/8i79RzWASvmM89EPkHLN8IGMmNI+4wc/XuTZlXCk8XwzXs37MhLDvEb2iwU0HXFCBl/6d23wYOxvJeG1F2qwdiut0+dwI3cp/onfbdmxCOXIHKy/EGXvK1L5qQp3qjyQ/Rw+nrEbGBQIH/1kuuxcgwoEXhA5xn7JZ9pn/V3vsFKqjdHLHDj5fqH2iUUEnJqJ/b5twQuqVXKizWrtz+BzPRiOj1LcH/Wg/C2drT+SrOMsw2S6w8f1BAh/6jN1722LlxTYfUEH4dosjmxnLlGsJEnn620v20RMhNcSoUa0cXbpM420LEQZlDwKMK93PDhLod4V8gnY8tS5+XnW1EIP9FVrdwkqjJXLPXT5Q6ynE8qOcSYncy95ZmMW3eUz2KCD0bxtKPUdXquBFDxmy9nuejzF+o6kX69pNp1q2HyGouC3A0ayj4nl9r0gmzoTT+PXL5Z8VofXh6SBAZ+b3JHOPEGX+sHy94DR9+s/5LVSY7nXBWOX1CbF/DqLtG+fTvXU/v6hUto8woSXarQRmI3Ot2lnaOjpLsueOGEaZmpIfZ2RPzOALL2L9ccc1HiMam9BSXj3gKt06er+/4XG4bMNTuwxDmtX6GjwvLN
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39850400004)(376002)(366004)(346002)(396003)(136003)(186003)(38070700005)(5660300002)(26005)(9686003)(8936002)(38100700002)(316002)(110136005)(122000001)(107886003)(71200400001)(53546011)(4326008)(86362001)(66556008)(76116006)(66446008)(64756008)(66476007)(66946007)(8676002)(478600001)(33656002)(966005)(55016003)(52536014)(83380400001)(2906002)(41300700001)(6506007)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?eU4zD2mCpKz7DF7M2ZdLbJLAHNBxPQVa7vYESJkqoAmjOs2ZUUc4I0TSSWfm?=
 =?us-ascii?Q?4351kWN3I/3DFrPaUpL88vNhq1x6lWxtw+WySJugnDCCPUsK1qhtav2U+SAi?=
 =?us-ascii?Q?A0R5pG7CH7oHkC8c1GM6slx0qjBDIcAN8Z4xSXJ1lLuw5rbZQATg4OdCXhn5?=
 =?us-ascii?Q?SyAl4Q75FA7BU9BUu818F1L4FZkMBeubyXS7G6/rZgq44S805Ok+GhkfQGUu?=
 =?us-ascii?Q?uf0XvB9Am0t7Nil16Td8m1qAqOFR8Apz7BzbDHw0SUY5aLDngmQ0/StCRtRn?=
 =?us-ascii?Q?I1CZyrOn5XEKPd+o+HbzDfgTcNwnLAp/50wHR83GcupUT5k44Av6EcSY3Vjc?=
 =?us-ascii?Q?PclGFA6zc5iS7F3Dwo5y+dXDGGCo0fp+1pS8+XEVW7RjpLp61Hfa9QQe3hqP?=
 =?us-ascii?Q?BQmw03vxa8xviJaT/Rfb+KJV1jMcejtcFjUowsnibv0aafkQJb0kgNU8WZBo?=
 =?us-ascii?Q?qMyIRK0oKfDATAaArBuu9jIQbFuoexXXoXl8nSh02WchczeA+B9ZJkv7p7D1?=
 =?us-ascii?Q?GE8lfZk8owRi+5LLlD/bI9SSnaGBiwBJc2LIxGkFQaS4VfH7ZY/UAlNCzIpp?=
 =?us-ascii?Q?GCAIzTlo3WfOa8nJBj4ONcTjPdSbQEDFTJQjS0UGqHuRFFUMAdpGoZri7TUM?=
 =?us-ascii?Q?PvltA4taMDoMM5OT+3e76gZJOmY4K7CBwKveP98MZ6+MdcuS62+kyRfw11GE?=
 =?us-ascii?Q?ENXzPdRjUwQkofoiNqxRSPpVEICdiFUb6eS/XtZQBf3puHh1eepBRtDM0M80?=
 =?us-ascii?Q?C4rQW5AKma7zR0ElkG348U34L7vYbeoeXS7xtoaww0XERZWoqv+gl0b6RPYt?=
 =?us-ascii?Q?yQApasmd1oy/VRgTnJyvTfYPr5XVykUSMjsromxxTVRFK8rh79Qs6a1oaQ4Q?=
 =?us-ascii?Q?c/g/4Q4cHIb5GvMpUVillCliOvl7bijRgbE946dvIGcPMvlYYG8kFCgbxAt3?=
 =?us-ascii?Q?gnQnw9zrv/gbPAakLwS8jHBOqg8sDopIOmcrgyKLv8FdcCxNRnB95f+vvh1I?=
 =?us-ascii?Q?4VB7Ob3ymuXDYNR7l0dncj24tqOoWORju/wBqBXgGNLaxjR+ObhQqEpPnMU6?=
 =?us-ascii?Q?XLLEtyM3MWIL6kx/MhYaofPUFZlcAFjuns7zidVks3XFW1k7ZeqppmPdGTpB?=
 =?us-ascii?Q?bKKGoZWRGpGmVw3JUJYfl1TqQXKT0dnGM9/vPPZZtAsiYgOqC42AxxxNPgvt?=
 =?us-ascii?Q?IZjfM8VgTKoofiuC0ZkMssC7Cyir6WJq6WvzWavxN998eAf+m1WmcRPDjXp4?=
 =?us-ascii?Q?2QIyBaxJgbssft5APWISLTrzBQNbDbAt/6n4V1gTiMUHgy6LOTNJ3sUlm5kE?=
 =?us-ascii?Q?4R5cTJOyNn/ur56pH2lxROXYQg2zHidxYYiEf9kwmu4UrKhAdpLbdzDvY/sW?=
 =?us-ascii?Q?aX0wqS942LHskSJpUG9ZQNQJW9A6Y5Ncw7NXDwPyg0AzuEas3j9rqjUEF1V8?=
 =?us-ascii?Q?2EHW633GrAGukuia6p5CqK721MtkDsHqWJKMbE6w1ulUleP+vUnQjtK/pf/L?=
 =?us-ascii?Q?2yZM5mVAmLfp/lQuNEr6Weh6fyPG05bR4lr/c8AH5GBNozIn+qMX0aCZzGqI?=
 =?us-ascii?Q?rqIR1lNqhEq9iOkRegXUjDFjUjxgrUUPxHS4903x?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98295163-42b2-4891-ce6d-08da710ef276
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2022 03:03:43.7543
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W9dgaqIT832R/cmJ8lTMdNl4+vLlEfAodo8oqFFDHvN3sUT+OMM0JaqAvWfv9EKWB2/cfGLuDtQHxdANM6gBWWqv3iu1A0VSqx00+0sOJzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4531
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Andrew,

> -----Original Message-----
> From: Andrew Jeffery <andrew@aj.id.au>
> Sent: Friday, July 29, 2022 10:29 AM
> To: Ryan Chen <ryan_chen@aspeedtech.com>; Joel Stanley <joel@jms.id.au>;
> Philipp Zabel <p.zabel@pengutronix.de>; linux-arm-kernel@lists.infradead.=
org;
> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org;
> openbmc@lists.ozlabs.org
> Cc: BMC-SW <BMC-SW@aspeedtech.com>
> Subject: Re: [PATCH v3 2/3] dt-bindings: i2c-ast2600: Add bindings for AS=
T2600
> i2C driver
>=20
> Hi Ryan,
>=20
> On Mon, 16 May 2022, at 16:18, ryan_chen wrote:
> > AST2600 support new register set for I2C controller, add bindings
> > document to support driver of i2c new register mode controller
> >
> > Signed-off-by: ryan_chen <ryan_chen@aspeedtech.com>
> > ---
> >  .../bindings/i2c/aspeed,i2c-ast2600.ymal      | 78
> +++++++++++++++++++
> >  1 file changed, 78 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/i2c/aspeed,i2c-ast2600.ymal
> >
> > diff --git
> > a/Documentation/devicetree/bindings/i2c/aspeed,i2c-ast2600.ymal
> > b/Documentation/devicetree/bindings/i2c/aspeed,i2c-ast2600.ymal
> > new file mode 100644
> > index 000000000000..7c75f5bac24f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c-ast2600.ymal
> > @@ -0,0 +1,78 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/i2c/aspeed,i2c-ast2600.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: AST2600 I2C Controller on the AST26XX SoCs Device Tree
> > +Bindings
> > +
> > +maintainers:
> > +  - Ryan Chen <ryan_chen@aspeedtech.com>
> > +
> > +allOf:
> > +  - $ref: /schemas/i2c/i2c-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - aspeed,ast2600-i2c
>=20
> The original driver uses e.g. aspeed,ast2500-i2c-bus for the subordinate
> controllers. While the register layout changes, I'd prefer we try to use =
the
> existing compatibles rather than introducing a new set and causing some
> confusion.
>=20
> Further, what you're proposing here is effectively being used to select t=
he
> driver implementation, which isn't the purpose of the devicetree.
>=20
> My preference would be to reuse the existing compatibles and instead sele=
ct
> the driver implementation via Kconfig. Or, if we can figure out some way =
to do
> so, support both register interfaces in the one driver implementation and=
 fall
> back to the old register interface where the new one isn't available (I d=
on't
> think this is feasible though).
>=20
Yes, that the reason go for another driver ast2600 to implement.
Like others SOC driver implement different generation have diff driver in K=
config=20
and Makefile.
Example :
https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/Makefile#L=
82-L84


> > +
> > +  reg:
> > +    minItems: 1
> > +    items:
> > +      - description: address offset and range of bus
> > +      - description: address offset and range of bus buffer
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +    description:
> > +      root clock of bus, should reference the APB
> > +      clock in the second cell
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  bus-frequency:
> > +    minimum: 500
> > +    maximum: 2000000
> > +    default: 100000
> > +    description: frequency of the bus clock in Hz defaults to 100 kHz
> > when not
> > +      specified
> > +
> > +  multi-master:
> > +    type: boolean
> > +    description:
> > +      states that there is another master active on this bus
> > +
> > +required:
> > +  - reg
> > +  - compatible
> > +  - clocks
> > +  - resets
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/ast2600-clock.h>
> > +
> > +    i2c_gr: i2c-global-regs@0 {
> > +      compatible =3D "aspeed,ast2600-i2c-global", "syscon";
> > +      reg =3D <0x0 0x20>;
> > +      resets =3D <&syscon ASPEED_RESET_I2C>;
> > +    };
> > +
> > +    i2c0: i2c-bus@80 {
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <0>;
> > +      #interrupt-cells =3D <1>;
> > +      compatible =3D "aspeed,ast2600-i2c-bus";
>=20
> This isn't quite right with respect to your binding description above :)
Yes, the compatible need to be " aspeed,ast2600-i2c" is that your point ?
If yes, I will start for v4.
> Andrew
