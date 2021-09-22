Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3DF414165
	for <lists+openbmc@lfdr.de>; Wed, 22 Sep 2021 07:55:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDnbC43nNz2yd6
	for <lists+openbmc@lfdr.de>; Wed, 22 Sep 2021 15:55:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=S7SdJxaB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.131.107;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=S7SdJxaB; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310107.outbound.protection.outlook.com [40.107.131.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDnZb0wSsz2yV6;
 Wed, 22 Sep 2021 15:55:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3PR6SkJXT0xL5NVK2wJJvRLiqFw5wGzSuvRy0U7FVzqdt+hAoytMco8lekGwaR4Af8er+uj2mwXV+LI/Tk20jS7qXgX/kIIFhbPdOSpy1QKmWeyCQpz7RLu6PVkuo3PJY7Um/Ji56JkKcOlkygkaelcReUQOcQswHVfQHn4748hP+LxJFUQCcx5xQbpQaeON+VP/pou4KK6LTXkyoMcE10OAOULDbbK32hmhq0sCSNWiYFro3YojVaKwCUtgfcpiLBMLAxQlAtxAbAc5Dn5stSrxFCHKcXoNUe2RzP6xiVz551D9JwdLK39atXr95+5+vo9B9EUkVMkkZbiG7u/Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=hAvv2Dtnw5sDu/FndqgmZ0naOGISLJDOTWzJBZybkC4=;
 b=WKXsxL0tnatSy7Y4IFvjSwmdmcNFScIgh1D4YHen4pJ31fCbZhgrsMDHUuRS/IMfMZ1JrEZ++Ipj8QGfFLCYbMUoJ5X71UoOhXYYEQ6eoVksbN+qTGEHKXH91cnqMesFrUHe6b43XbI2OBA/Va3fSQQXsQt5X3gsS7koWGK5IxMg9orNGttgZddeeDogf6MYtus+Qcpk8+khuCBTESi3snshabcNvoo9ZM7krfr7JtWHgILeIP6EHC07Wd+AJCZVaNlmEURzOYNpKsjjOPtIfUq6DB3KRvqFxHgII9tHLxDuG2t4jKEMfM3HSt5O+IyJ/ztIwL7H0/Qp9/8ALbOc2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hAvv2Dtnw5sDu/FndqgmZ0naOGISLJDOTWzJBZybkC4=;
 b=S7SdJxaBU4BfWq0ctWQzp/M7+Ce4BWTJy+gB2WfNrhuBg3OHuzdFwZT7uH+nJF24jH+QoInKctXyFBVuxoFQkbiOJczevBMrsxsjp6JKTdT7D5JoVAD2dCJnT3dbxFrUUH2PwBNiPYt9NT54LnoTGRRcLoZ7ZCnA9MEnQ4C2dR2YUvjPO3cgsX3fOKEjiHLz4k0NPNl87dT/MLmYxJqxZqEVc7LbbsjmJuC99uEb8Uj/gJApf3DCT3ZScMyaPvmOlCgley7a+easLstk4Rf5bbkx2mWsUn1TFeTsb4igflFSe5/AAitJF6p+2m+qVWv9E4hf0De4v8Ji7CP1iwoOnw==
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK0PR06MB2209.apcprd06.prod.outlook.com (2603:1096:203:47::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 22 Sep
 2021 05:54:54 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::3517:6c51:50d:1a55]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::3517:6c51:50d:1a55%3]) with mapi id 15.20.4523.018; Wed, 22 Sep 2021
 05:54:53 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [PATCH v5 1/4] dt-bindings: mfd: aspeed-lpc: Convert to YAML
 schema
Thread-Topic: [PATCH v5 1/4] dt-bindings: mfd: aspeed-lpc: Convert to YAML
 schema
Thread-Index: AQHXqtzZE7T97eklTUuiWXzOczRViKumuWsAgAjcJfA=
Date: Wed, 22 Sep 2021 05:54:53 +0000
Message-ID: <HK0PR06MB3779F1ECFA191A583732E95E91A29@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210916092515.10553-1-chiawei_wang@aspeedtech.com>
 <20210916092515.10553-2-chiawei_wang@aspeedtech.com>
 <YUNVUAF4Keij2OUA@robh.at.kernel.org>
In-Reply-To: <YUNVUAF4Keij2OUA@robh.at.kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 018c0db9-b349-4bae-efe8-08d97d8d7fe7
x-ms-traffictypediagnostic: HK0PR06MB2209:
x-microsoft-antispam-prvs: <HK0PR06MB22098CC3664A05EBACA2EC7D91A29@HK0PR06MB2209.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HjLABgARzJJ5AErgT+iY130L/VyIUeY9O3gXJAf9fKojtWGCfvGLXbVmu6w9H0rDwPg0ZfYzHONykumYXR0Y/FE3DDhptzizt2sxCjlv4O7furbP+PFcHKRxtXqJ3L0pHCY6dcE1y6tO/FBvOPW3OBqF3ZXvozy8Mm0QFI+ksQc2BRZoE8YX1JCZlkEiaWG9oFtfnocSb5S8WjRQ0B/RYU1PyK/Gf4aBEHJwUvXU/Rx/6x3rbLiQqz4ibG9fR/D+Airs6W4+LP+LDCushdISt86nBAF3HCDjJTPo1T0OYa7tieaOBohgmjE1BTW3C3rjnSum5wgpD/HNWgRiAWKWmJQ42DkUHviOO0INdty3Y6mRJoDop/rTEP2EChWCJnkCq/+7lq+2HEiwWMLsUqOp82mFvy9sYow5iH1V2cwRVP+JaCMz8+BFKMtxZPKBdzoFVtJEF8UxGTisS+LEuy67TZV3a5iObPGk9UtrvSkYt7a0ZmBQJmpBoSDxW9Lj9rwV64326w0SLPmadFJEJ7D1N1XS9RPzAQW34advCtiQReq5GnQtX77U2ysi5hfaaBpLnHxCBPZKuq9cyaCyvO5WhD38MBB4lZvmA/LSHqBfjqxCro1DkwbliHaPifIPLplxbfK5XBiYnlGglaKRy+3jp8rG4UO9wmoDMwq3Li/0IYNTqvKVekb8FI2x1xCLGnhsMrkDFPraQdm0o6FAcYGrdZkYEXaLiCOAyTC7dgSHJ+M50hUuOq0b+bkt1hw283Jo46z9YvDBl++T3n6P0n4S5OIHmghpHTw1AF97fCaQAK0PdfsvJXKt4znJwrFOCzvJEB1jxvzknh6bMYDf5V+Vh6iCvB4yhcQ5yAEAYHeebL8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(86362001)(38070700005)(52536014)(33656002)(6916009)(7696005)(76116006)(8936002)(7416002)(83380400001)(54906003)(8676002)(508600001)(66946007)(66476007)(66446008)(4326008)(71200400001)(5660300002)(30864003)(26005)(6506007)(2906002)(9686003)(38100700002)(186003)(122000001)(66556008)(64756008)(966005)(55016002)(562404015);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XSLA/cMjQ0s9QRp+Fp/gMGCLoOuSOVn+wwNi/ZF51TJ8wpfe2F9uUveK5Mlo?=
 =?us-ascii?Q?KsVgaPtvRWzU8GUrStTRgor++nKh3ba/+Gxo1o9uxFye/HGJNY3nKuAVmB0W?=
 =?us-ascii?Q?ZVGxcPr3k7ZuT/GLVdSt2ZArWkJs1RB2jAOP5TlpowJ2l+2/9BAwqXXVpXDX?=
 =?us-ascii?Q?EI4fgQP4MrBHk1r/RXQQaBtsa+JbH2MPpXCS7MOczy7aormgMN9E2bxbdUwP?=
 =?us-ascii?Q?lqd9jmapxNhSJHGrxbMqL2GUE24RDaXFgB933cUd2bPF/2rRG6Gqh1DuYNSD?=
 =?us-ascii?Q?o+9tM1MR3glHvDJnyA0iiDnO3MRIk9Gl4rXMZlJt7MFypaUS+H7OcQ8i5jPU?=
 =?us-ascii?Q?l8GwxNrZaYw5Q5sYewI78iZqh3MyEb38kJMcAT9jLBC52AD+hxpFJnzMqJ22?=
 =?us-ascii?Q?wBtzgB/H6okApaaC1ngZEhmrWvP7HGIk233SSZnG2IV+DUdQZ2hYBGKvq2VM?=
 =?us-ascii?Q?0sdhSVlLiyI3ezahhLpEcy2RR7pXWyBW9ubd8vpCfbTg/mxRZx7SGCAa/xS2?=
 =?us-ascii?Q?z2IIUiRiuhKV13Pam+kyzQJD5JoChGLKWnasQ8X6fscRooVBEc/EJPAs9niE?=
 =?us-ascii?Q?+rbG+P/4DoG6TY3EZS85LBc+Y3lDDVtB2K2N4lc5Ch6Luou6iEv5dRTCbjSx?=
 =?us-ascii?Q?f187DT4gLMHsKwK+0CDV6Vr7o1xpLExJU0v2Ci3VeBJC585mOU6Aw9LNmL5V?=
 =?us-ascii?Q?ynSyka/WDoic5+JQK82ox08U9TJOk30cuxMcZQjgDs7UR5Fvbdr7Kqg3v+I9?=
 =?us-ascii?Q?NgMHl7qcKbdw/OaLXB9r0IdEolp6Fw8ky8jDCU/ijh0WMsQblpik7mgYg1A3?=
 =?us-ascii?Q?BHN/Mzd6ip6pGDI6qwmamTPU3X3AZI1Xkyx9syq4jFBlZxmoDUCuh8w4sm8k?=
 =?us-ascii?Q?4/VOb6M5HH9dt9AXqepzmy5u/TsGm3mfX0xP2LpynBdJVGACqTvo88WrcarV?=
 =?us-ascii?Q?eP8/6Kc+Fro1MAaynxO/8OeiI3eNsMKkT1UTNq2RXCkiP1V04xE7WXiTBPFf?=
 =?us-ascii?Q?Tym4eDqO2RxrdtBo0h85/OgJEKJCqAZCIViazSSzmGRRMCqFg3THD7PTygHd?=
 =?us-ascii?Q?Jd7VvUQqEScm31ULpuwcIYMPco7hj0/0tvIvx29Pr8h70zj4+++v+YTy5oZb?=
 =?us-ascii?Q?6y8lNB220g5On6/db1MbJ2SaQtRShXflRcrpLapteEalAePO62gsEzmivo4y?=
 =?us-ascii?Q?PuF2wPvYUXoYwv0Klrwx6XYW3Db3K1oYX0S+a9HktOev6jAOzBFmop1oWZ2B?=
 =?us-ascii?Q?CRUFHQfbld5Q7a9Y5ob02fJGc5g+ruZHPPF/1FZkn/Dhl7NOTiFK/ZzHAAAw?=
 =?us-ascii?Q?8BwuQueFDfpJyUTHEnhtLxQd?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 018c0db9-b349-4bae-efe8-08d97d8d7fe7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2021 05:54:53.8213 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U6fpyL+zuYkI0kYN9M+Snp+h6FVHgdf7vuFgUg+G9Gh3XAvgI6Hkr3eNA5t2qAhSL7jOQCQWjfDVk4BxmKWqZJiChCIat7Ap73rvhVNO6Jo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2209
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
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "yulei.sh@bytedance.com" <yulei.sh@bytedance.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "osk@google.com" <osk@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rob,

> From: Rob Herring <robh@kernel.org>
> Sent: Thursday, September 16, 2021 10:32 PM
>=20
> On Thu, Sep 16, 2021 at 05:25:12PM +0800, Chia-Wei Wang wrote:
> > Convert the bindings of Aspeed LPC from text file into YAML schema.
> >
> > Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> > ---
> >  .../devicetree/bindings/mfd/aspeed-lpc.txt    | 157 ---------------
> >  .../devicetree/bindings/mfd/aspeed-lpc.yaml   | 187
> ++++++++++++++++++
> >  2 files changed, 187 insertions(+), 157 deletions(-)  delete mode
> > 100644 Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> >  create mode 100644
> > Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> > b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> > deleted file mode 100644
> > index 936aa108eab4..000000000000
> > --- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> > +++ /dev/null
> > @@ -1,157 +0,0 @@
> >
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D
> > =3D -Device tree bindings for the Aspeed Low Pin Count (LPC) Bus
> > Controller
> >
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D
> > =3D
> > -
> > -The LPC bus is a means to bridge a host CPU to a number of
> > low-bandwidth -peripheral devices, replacing the use of the ISA bus in
> > the age of PCI[0]. The -primary use case of the Aspeed LPC controller
> > is as a slave on the bus -(typically in a Baseboard Management
> > Controller SoC), but under certain -conditions it can also take the rol=
e of bus
> master.
> > -
> > -The LPC controller is represented as a multi-function device to
> > account for the -mix of functionality, which includes, but is not limit=
ed to:
> > -
> > -* An IPMI Block Transfer[2] Controller
> > -
> > -* An LPC Host Controller: Manages LPC functions such as host vs slave
> > mode, the
> > -  physical properties of some LPC pins, configuration of serial IRQs,
> > and
> > -  APB-to-LPC bridging amonst other functions.
> > -
> > -* An LPC Host Interface Controller: Manages functions exposed to the
> > host such
> > -  as LPC firmware hub cycles, configuration of the LPC-to-AHB
> > mapping, UART
> > -  management and bus snoop configuration.
> > -
> > -* A set of SuperIO[3] scratch registers: Enables implementation of
> > e.g. custom
> > -  hardware management protocols for handover between the host and
> > baseboard
> > -  management controller.
> > -
> > -Additionally the state of the LPC controller influences the pinmux
> > -configuration, therefore the host portion of the controller is
> > exposed as a -syscon as a means to arbitrate access.
> > -
> > -[0] http://www.intel.com/design/chipsets/industry/25128901.pdf
> > -[1]
> >
> https://www.renesas.com/en-sg/doc/products/mpumcu/001/rej09b0078_h8s2
> 1
> > 68.pdf?key=3D7c88837454702128622bee53acbda8f4
> > -[2]
> >
> https://www.intel.com/content/dam/www/public/us/en/documents/product-b
> > riefs/ipmi-second-gen-interface-spec-v2-rev1-1.pdf
> > -[3] https://en.wikipedia.org/wiki/Super_I/O
> > -
> > -Required properties
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -
> > -- compatible:	One of:
> > -		"aspeed,ast2400-lpc-v2", "simple-mfd", "syscon"
> > -		"aspeed,ast2500-lpc-v2", "simple-mfd", "syscon"
> > -		"aspeed,ast2600-lpc-v2", "simple-mfd", "syscon"
> > -
> > -- reg:		contains the physical address and length values of the Aspeed
> > -                LPC memory region.
> > -
> > -- #address-cells: <1>
> > -- #size-cells:	<1>
> > -- ranges:	Maps 0 to the physical address and length of the LPC memory
> > -                region
> > -
> > -Example:
> > -
> > -lpc: lpc@1e789000 {
> > -	compatible =3D "aspeed,ast2500-lpc-v2", "simple-mfd", "syscon";
> > -	reg =3D <0x1e789000 0x1000>;
> > -
> > -	#address-cells =3D <1>;
> > -	#size-cells =3D <1>;
> > -	ranges =3D <0x0 0x1e789000 0x1000>;
> > -
> > -	lpc_snoop: lpc-snoop@0 {
> > -		compatible =3D "aspeed,ast2600-lpc-snoop";
> > -		reg =3D <0x0 0x80>;
> > -		interrupts =3D <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
> > -		snoop-ports =3D <0x80>;
> > -	};
> > -};
> > -
> > -
> > -LPC Host Interface Controller
> > --------------------
> > -
> > -The LPC Host Interface Controller manages functions exposed to the
> > host such as -LPC firmware hub cycles, configuration of the LPC-to-AHB
> > mapping, UART -management and bus snoop configuration.
> > -
> > -Required properties:
> > -
> > -- compatible:	One of:
> > -		"aspeed,ast2400-lpc-ctrl";
> > -		"aspeed,ast2500-lpc-ctrl";
> > -		"aspeed,ast2600-lpc-ctrl";
> > -
> > -- reg:		contains offset/length values of the host interface controller
> > -		memory regions
> > -
> > -- clocks:	contains a phandle to the syscon node describing the clocks.
> > -		There should then be one cell representing the clock to use
> > -
> > -Optional properties:
> > -
> > -- memory-region: A phandle to a reserved_memory region to be used for
> the LPC
> > -		to AHB mapping
> > -
> > -- flash:	A phandle to the SPI flash controller containing the flash to
> > -		be exposed over the LPC to AHB mapping
> > -
> > -Example:
> > -
> > -lpc_ctrl: lpc-ctrl@80 {
> > -	compatible =3D "aspeed,ast2500-lpc-ctrl";
> > -	reg =3D <0x80 0x80>;
> > -	clocks =3D <&syscon ASPEED_CLK_GATE_LCLK>;
> > -	memory-region =3D <&flash_memory>;
> > -	flash =3D <&spi>;
> > -};
> > -
> > -LPC Host Controller
> > --------------------
> > -
> > -The Aspeed LPC Host Controller configures the Low Pin Count (LPC) bus
> > behaviour -between the host and the baseboard management controller.
> > The registers exist -in the "host" portion of the Aspeed LPC
> > controller, which must be the parent of -the LPC host controller node.
> > -
> > -Required properties:
> > -
> > -- compatible:	One of:
> > -		"aspeed,ast2400-lhc";
> > -		"aspeed,ast2500-lhc";
> > -		"aspeed,ast2600-lhc";
> > -
> > -- reg:		contains offset/length values of the LHC memory regions. In th=
e
> > -		AST2400 and AST2500 there are two regions.
> > -
> > -Example:
> > -
> > -lhc: lhc@a0 {
> > -	compatible =3D "aspeed,ast2500-lhc";
> > -	reg =3D <0xa0 0x24 0xc8 0x8>;
> > -};
> > -
> > -LPC reset control
> > ------------------
> > -
> > -The UARTs present in the ASPEED SoC can have their resets tied to the
> > reset -state of the LPC bus. Some systems may chose to modify this
> configuration.
> > -
> > -Required properties:
> > -
> > - - compatible:		One of:
> > -			"aspeed,ast2600-lpc-reset";
> > -			"aspeed,ast2500-lpc-reset";
> > -			"aspeed,ast2400-lpc-reset";
> > -
> > - - reg:			offset and length of the IP in the LHC memory region
> > - - #reset-controller	indicates the number of reset cells expected
> > -
> > -Example:
> > -
> > -lpc_reset: reset-controller@98 {
> > -        compatible =3D "aspeed,ast2500-lpc-reset";
> > -        reg =3D <0x98 0x4>;
> > -        #reset-cells =3D <1>;
> > -};
> > diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
> > b/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
> > new file mode 100644
> > index 000000000000..54f080df5e2f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
> > @@ -0,0 +1,187 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) # #
> > +Copyright (c) 2021 Aspeed Tehchnology Inc.
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Aspeed Low Pin Count (LPC) Bus Controller
> > +
> > +maintainers:
> > +  - Andrew Jeffery <andrew@aj.id.au>
> > +  - Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> > +
> > +description:
> > +  The LPC bus is a means to bridge a host CPU to a number of
> > +low-bandwidth
> > +  peripheral devices, replacing the use of the ISA bus in the age of
> > +PCI[0]. The
> > +  primary use case of the Aspeed LPC controller is as a slave on the
> > +bus
> > +  (typically in a Baseboard Management Controller SoC), but under
> > +certain
> > +  conditions it can also take the role of bus master.
> > +
> > +  The LPC controller is represented as a multi-function device to
> > + account for the  mix of functionality, which includes, but is not
> > + limited to
> > +
> > +  * An IPMI Block Transfer[2] Controller
> > +
> > +  * An LPC Host Interface Controller manages functions exposed to the =
host
> such
> > +    as LPC firmware hub cycles, configuration of the LPC-to-AHB mappin=
g,
> UART
> > +    management and bus snoop configuration.
> > +
> > +  * A set of SuperIO[3] scratch registers enableing implementation of =
e.g.
> custom
> > +    hardware management protocols for handover between the host and
> baseboard
> > +    management controller.
> > +
> > +  Additionally the state of the LPC controller influences the pinmux
> > + configuration, therefore the host portion of the controller is
> > + exposed as a  syscon as a means to arbitrate access.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - aspeed,ast2400-lpc-v2
> > +          - aspeed,ast2500-lpc-v2
> > +          - aspeed,ast2600-lpc-v2
> > +      - const: simple-mfd
> > +      - const: syscon
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 1
> > +
> > +  ranges: true
> > +
> > +patternProperties:
> > +  "^lpc-ctrl@[0-9a-f]+$":
> > +    type: object
> > +
> > +    description:
> > +      The LPC Host Interface Controller manages functions exposed to t=
he
> host such as
> > +      LPC firmware hub cycles, configuration of the LPC-to-AHB mapping=
,
> UART management
> > +      and bus snoop configuration.
> > +
> > +    properties:
> > +      compatible:
> > +        items:
> > +          - enum:
> > +              - aspeed,ast2400-lpc-ctrl
> > +              - aspeed,ast2500-lpc-ctrl
> > +              - aspeed,ast2600-lpc-ctrl
> > +
> > +      reg:
> > +        maxItems: 1
> > +
> > +      clocks:
> > +        maxItems: 1
> > +
> > +      memory-region:
> > +        $ref: /schemas/types.yaml#/definitions/phandle
> > +        description: A reserved_memory region to be used for the LPC
> > + to AHB mapping
> > +
> > +      flash:
> > +        $ref: /schemas/types.yaml#/definitions/phandle
> > +        description: The SPI flash controller containing the flash to
> > + be exposed over the LPC to AHB mapping
> > +
> > +    required:
> > +      - compatible
> > +      - clocks
> > +
> > +  "^reset-controller@[0-9a-f]+$":
> > +    type: object
> > +
> > +    description:
> > +      The UARTs present in the ASPEED SoC can have their resets tied t=
o
> the reset
> > +      state of the LPC bus. Some systems may chose to modify this
> > + configuration
> > +
> > +    properties:
> > +      compatible:
> > +        items:
> > +          - enum:
> > +              - aspeed,ast2400-lpc-reset
> > +              - aspeed,ast2500-lpc-reset
> > +              - aspeed,ast2600-lpc-reset
> > +
> > +      reg:
> > +        maxItems: 1
> > +
> > +    required:
> > +      - compatible
> > +
> > +  "^lpc-snoop@[0-9a-f]+$":
> > +    type: object
> > +
> > +    description:
> > +      The LPC snoop interface allows the BMC to listen on and record t=
he
> data
> > +      bytes written by the Host to the targeted LPC I/O pots.
> > +
> > +    properties:
> > +      comptabile:
>=20
> I guess I have to point out *every* instance of your typo?
>=20
> Run 'make dt_binding_check' and find these problems before you send this
> out.

Sorry for making this error again.
I missed the "DT_CHECKER_FLAGS=3D-m" command line argument and thus the war=
ning did not show up.
Will keep in mind next time. Thanks for your help.

Chiawei

