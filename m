Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 049172EC818
	for <lists+openbmc@lfdr.de>; Thu,  7 Jan 2021 03:32:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DB9HX2fSzzDqnR
	for <lists+openbmc@lfdr.de>; Thu,  7 Jan 2021 13:32:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.115;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320115.outbound.protection.outlook.com [40.107.132.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DB9GX1ZVrzDqlQ;
 Thu,  7 Jan 2021 13:31:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PzZwCWBVkaFhO9nRxzE954jCPU/3xDnUhAGD8+GpeSd7h9ZoDM1vEAgm96pSPnoQgdxdFOOQFH+1YRo9bLsWrrfjD6BA9f169a+eKNL4ow339Ce+1+GKUby16sSRVm5CwVsKca0t1koxG6D1jBSbbNPoyaXnH6u7scvJjz7UjYU26EJX8U2lL2bssS/Rn5SRhtwV+2Q5AU6I/v23zpFk+x5eBw6fFU3XVXuSMOQvjLkDxpuCbR4HV6ZlVVkvhCsJyqA1cdxb22qYKvC8kp9z1gHX6zJS9ysnnM2Bj/cQH0wxgPWYBV49+TzIMQVlVEy0EkEv0FIzT25DjSznIceozQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=popcx/L3N3Lqy94ry5M5eaMEyt07bWPZPcGMvs2IcGk=;
 b=nS21AYzBEqrA3HV38evgl6syt0H4DcIKRuona3NZt+EmQfhFNNV1Dn4rUonHzUhyg7oIpeDeR4wKILFgHo+LRIIIkiBzA6NkpBHTlVEWrVAC6oMXYvVbCyGhiy268oPNTcg6yN2YwPqYZB2VGjSIvYSmYgRjazWZcMq/6PRiwchGReCAslw7dCRMNzVtMqb16ExBa5CFBEhfchKolOxqzqUG8eboV3DymK2J9gP6h2EVLPrdQP0mVvCamV9FG1cVK1xYgVE8ZU0gCngwh8QJddFDMJZ9HJtBcrD4DuXDo+ivldiPDcbHHTzxFmhY/Zb5hZ0f01tqxjox9PnpYy5I6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK2PR0601MB2002.apcprd06.prod.outlook.com (2603:1096:202:3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 02:31:16 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::7061:73d9:50ae:b35e]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::7061:73d9:50ae:b35e%7]) with mapi id 15.20.3721.024; Thu, 7 Jan 2021
 02:31:16 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [PATCH 1/6] dt-bindings: aspeed: Add eSPI controller
Thread-Topic: [PATCH 1/6] dt-bindings: aspeed: Add eSPI controller
Thread-Index: AQHW4/EDqNrLvWbVbUeeQVqbvsj31aoas4mAgAC+QuA=
Date: Thu, 7 Jan 2021 02:31:16 +0000
Message-ID: <HK0PR06MB37793C49F562E169393AB0A491AF0@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210106055939.19386-1-chiawei_wang@aspeedtech.com>
 <20210106055939.19386-2-chiawei_wang@aspeedtech.com>
 <1609945675.315536.2229518.nullmailer@robh.at.kernel.org>
In-Reply-To: <1609945675.315536.2229518.nullmailer@robh.at.kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44bf247c-424e-4ee4-2a0c-08d8b2b44ef3
x-ms-traffictypediagnostic: HK2PR0601MB2002:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR0601MB20028069FF87BE3A3303ABA591AF0@HK2PR0601MB2002.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U3zaLJ8cEEAjkACYsqnnzvmg2kk1b2djVjiaB5vlbM6hMDGTE/qRfNxkSKySE1bzC5tNkAcngyC8glLUczuZL78RCTrhRxssuf1vvxdWoGpBCT+DGg/F4bJtKErm0PAvap24QqIA5il4GJ9lJ3/+SjcSxmeZI5Hx4EODwoMrpZJQjIUKKaV+gC7qxqW+1w8fJV9YQXSAzYDmGMp/hUH3+FH+X924cGQz2B+Ld6fos4AG4gWEMoRc8XYdtGJ07f69noLsNlZ4BXxAux4Tt/X/Ic7InebmIEXjZ/PnmqUiAkd4ZIMmawJAsY8PQsymv0wbMCy6A/dQUj5xOBoChROUnhAZYgo0gu6MRFoSp9CvuDEgU94/wXRO0CildtcLp2mQItgqkRqKy7eXi0S/pzNVncC7bVNL2PH5SXLWsbke6VQAJ4Zv09wNE0OthYeehT51PI/sctabb8kW20N2OEJhkQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(396003)(346002)(366004)(376002)(136003)(8936002)(54906003)(8676002)(6916009)(7696005)(316002)(66556008)(66946007)(64756008)(66446008)(52536014)(66476007)(76116006)(71200400001)(478600001)(966005)(5660300002)(33656002)(2906002)(83380400001)(55016002)(186003)(4326008)(107886003)(7416002)(9686003)(26005)(86362001)(53546011)(55236004)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?BZoeBJTMIw4PEPK06qNAURl1nHjRmMSdFi81V8Y7w3qoH1FLCgjqcFltLYAt?=
 =?us-ascii?Q?kHzEkaHBHQgyFPEB3cWlHUK5J8/yPoLr3my8Hj95fNlXvDs237NLC0wCyIRl?=
 =?us-ascii?Q?9zHf+WS2hqG0M0f5Wx9WuAUlW+clvJ7jgD2fp0mEqS2REkpZPRhZXAZHt0B5?=
 =?us-ascii?Q?M2BZbpmL9Cw/3GQ2GiKsbeD3si6bhTe3QfWVBQXZN6DpGeSm4bGS1pSObou3?=
 =?us-ascii?Q?iOR9Q5zpCyYozaVAnZu8SK8ABYtZiNGQrwlMRi03TcjD40yQ/xrbPMtPTAX1?=
 =?us-ascii?Q?61Jd/zXG4Qmsf93knezTIfpvKzamHY1av1CaYDqtBBDho9W/meTePjn2u64+?=
 =?us-ascii?Q?N8zXp2sfYgPlu+5gAd/BDPBYebVTQE8AET9A5ffbULV5iVpS3+kfghaxhY4a?=
 =?us-ascii?Q?JM/ibUzfVDlYv2F1mXkboWJhpruDKqETqvAlc2qfjrUF4HBaz2wX6s7vmWZw?=
 =?us-ascii?Q?wnP7YO+lhcdxIdzV2k2jmfdJXYLIioFyD3rX8DK208Ccsa783ZLCyLmX2K3v?=
 =?us-ascii?Q?GvvHbNQxfTLE+BuvUMk7ZCLfpbYCoSekZHEMSRlxed5a5lVMEd92/TTxUYwa?=
 =?us-ascii?Q?mkeP8d9DdLAnb6d06FAWtxRI6l2W0kHeSqk0hNOZRsBQ9zWqwLkPFvTP+ags?=
 =?us-ascii?Q?Uh+MD5kcT25L8RjTZQfUQ9InvSOHvT+SZH8aqKb+kuMsT+Lh7CmmpSfb6hW7?=
 =?us-ascii?Q?pQ9xalYZkDd0pewTxu+91PgEf2TY7iGH82i41N6nB1AC9GyZn5RXkIJKYipF?=
 =?us-ascii?Q?EG/Uyh7f4zhBsck7M4Bun41re1/85eEzY3pSDl/PGjeDRaP8fAzk4Q+IuOWO?=
 =?us-ascii?Q?EIewQf4bcykHL90EB5TOqMwFA3SRyE0CSy8X9eNnjA1T/jbGWECCICkIslkG?=
 =?us-ascii?Q?vwy28lpVCPeQvILbEICYCxAzdJ6DGMRfLkLvMo+vChfkpPrFqpaqQ9z1gWVP?=
 =?us-ascii?Q?rNRK4rpfeS8/OspQxyGMQyiYGwAApsJXmYFnMbzIR84=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44bf247c-424e-4ee4-2a0c-08d8b2b44ef3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2021 02:31:16.0232 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +63IKmGXEyjG9BMW0aHhuIaGmgu4dSp9s86cdRtyT5Ij/gRznkn2eSkBjIBOzhpHQqZl43VemKI5wc7BUgSqWnN2eRJezVJQIKunqlCw/tc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0601MB2002
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
 BMC-SW <BMC-SW@aspeedtech.com>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "maz@kernel.org" <maz@kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rob,

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Wednesday, January 6, 2021 11:08 PM
> To: ChiaWei Wang <chiawei_wang@aspeedtech.com>
> Subject: Re: [PATCH 1/6] dt-bindings: aspeed: Add eSPI controller
>=20
> On Wed, 06 Jan 2021 13:59:34 +0800, Chia-Wei, Wang wrote:
> > Add dt-bindings and the inclusion header for Aspeed eSPI controller.
> >
> > Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
> > ---
> >  .../devicetree/bindings/soc/aspeed/espi.yaml  | 252
> ++++++++++++++++++
> >  .../interrupt-controller/aspeed-espi-ic.h     |  15 ++
> >  2 files changed, 267 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/soc/aspeed/espi.yaml
> >  create mode 100644
> > include/dt-bindings/interrupt-controller/aspeed-espi-ic.h
> >
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> Error:
> Documentation/devicetree/bindings/soc/aspeed/espi.example.dts:45.35-36
> syntax error FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:344:
> Documentation/devicetree/bindings/soc/aspeed/espi.example.dt.yaml] Error =
1
> make: *** [Makefile:1370: dt_binding_check] Error 2
>=20
> See https://patchwork.ozlabs.org/patch/1422809
>=20
> This check can fail if there are any dependencies. The base for a patch s=
eries is
> generally the most recent rc1.
>=20
> If you already ran 'make dt_binding_check' and didn't see the above error=
(s),
> then make sure 'yamllint' is installed and dt-schema is up to
> date:
>=20
> pip3 install dtschema --upgrade
>=20
> Please check and re-submit.

My 'make dt_binding_check' did not show the error.
I will update the tool as suggested to fix the error. Thanks.

