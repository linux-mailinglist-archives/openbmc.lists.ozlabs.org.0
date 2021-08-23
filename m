Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9543F42F4
	for <lists+openbmc@lfdr.de>; Mon, 23 Aug 2021 03:22:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GtDxL0fYPz30BJ
	for <lists+openbmc@lfdr.de>; Mon, 23 Aug 2021 11:22:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=U1M5uZNv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.109;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=U1M5uZNv; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320109.outbound.protection.outlook.com [40.107.132.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GtDwj620yz2yY0;
 Mon, 23 Aug 2021 11:21:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MkJe/4A5Hi/7YqgDktxyzkaHmQXWvdzrjGIoEDQrXIAPS+TZ/HFR/hdcqoYuoAAycpaIEJYl3+BZYb8Y6R9sOeSy43aW6PW6aChN3xkyRCkO/StVoVDfxf48neBjk9aEyfvd99JqtYGTjDD7S1prGoeYQZETk1og8/LfU16d++RPAA+QcSjwKKfTvL0oFkXGe5/Uu3uI6xFIeMtV6WNIZiclywNE5f/c42MGQO7VXUDT/1E0I2Fk07Ih54H8qEP+JDlmDu4eHKTT7z5viVmF7nZUU1g6lkWuC0Rvph79gWn7vrIf1vA4ErPU1BY2WLM3KV50PdP9ynzrHdL0AK8P9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8Lvnl1OtROsJabQTEhHJ6LfYjsQ/6siEglWStGNPyc=;
 b=TeUtyGSdNBPhq+T2fDaUMnTi3X8QaYj0bhhYC0Gfga2/G5cCVj+1amGqXep5koajQoDgBoSSzNSQ/ZvOHEr8bcyoK4U43BsNbjild1bUx/BB5FFvTm48oSM25T3yq9Hr3zxBhhmfgiYR4cy0MOirnjv5zuFhE0/3yRKgHP7TappPBGQrmXiax1Q+TkmoKBIHBlU6hEqidLJYtrF9afpPaaYQCiCqoHMa1hnkBHJEmR0LfZgxI+tUZyaEjnwM4xq0+v0OOaLX+qKHu5hcnWgLmVcY3D2QEs8gPw/p8tdeQSwh2JVByBKDylkft3hN1HibCwYs7rSHz3Pf510ABzNf0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8Lvnl1OtROsJabQTEhHJ6LfYjsQ/6siEglWStGNPyc=;
 b=U1M5uZNvaRYdp7fXJfvZR3VyNcIMQfLLNZ6hZ3gaGlgZBNpjelNvT3VN/UCrVg3ZDxerzx6P+uMwX3cea4GKHFe0HcO+vxVE5TUzHCoUYxjxTn19vMoTf+QHseTq17iUztis8FvLG02sJ5/gD72mXd8Ypw0pJG/wmlJpBm6GUXeonVg1yi/DtHdjdDeHiXfCeoqzp0NmWcQFNZZstcEjYjuis8OBAbFq78cEOTho/M2fjCKFKAGhZmQ/Pted7TxR1zQIEUDb3Me6nZxUck85JfxmaPJbcmTyHv6WivknSiLRrfIDguT1MEW7aL+IIUOvREvKO3yiwktRTA/6H9X1Ug==
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK2PR0601MB1828.apcprd06.prod.outlook.com (2603:1096:202:e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 01:21:15 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::4c26:6668:f551:3a62]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::4c26:6668:f551:3a62%3]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 01:21:15 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [PATCH v2 1/5] dt-bindings: aspeed: Add eSPI controller
Thread-Topic: [PATCH v2 1/5] dt-bindings: aspeed: Add eSPI controller
Thread-Index: AQHXlNBwicwOSKJ0Y0KdC4J0I1p936t80tKAgAN7vTA=
Date: Mon, 23 Aug 2021 01:21:15 +0000
Message-ID: <HK0PR06MB3779C39208BDFEB6A80006AF91C49@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210819080040.31242-1-chiawei_wang@aspeedtech.com>
 <20210819080040.31242-2-chiawei_wang@aspeedtech.com>
 <YSAKM16WLx4UWIQu@robh.at.kernel.org>
In-Reply-To: <YSAKM16WLx4UWIQu@robh.at.kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 91f6c2dd-874b-41cb-9c65-08d965d44d6f
x-ms-traffictypediagnostic: HK2PR0601MB1828:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR0601MB182818A2B59D05FBABE26AD391C49@HK2PR0601MB1828.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t4K8UNen9bdDImFiPBh+OW2WzJ5zE2f/5CQTCuWN4WQU3JFlkfP+wF8vtNETQOuP03vQXCdVVqCdiRjjbJRR4a3j63wPrBDjJt8Joszo59UieUSUwlYjF6FH7J+cbxy9iatqgwkCi9gB2a6K+VbELH6t232Z7ozfCGKBmmuRXwx8coeqGSsjl17d6w299UjvNP3otgSHK89yZm2RjoiSMJn8VIh7Y6FzyfaBYBJRFa1ID3Spp3gwWK39JBBzjGO6Zg1UkQChrsP4ZkDcZvYnMQYUhtyrckxedhhfKWc6U849XayoViq8ps1xllaryX8pz8FRaEkofpebCb79ORqtl6cJ9EGi7DDr4KrT8HaGn/sG49huHdA9WWuVdCqvLMfh6lr8xLyKYCc3Mc7N/n4DPDnvDJgIahQY7lGEQM74DYmEdxEQeVe1nslPh5t9TsvMvGPJIc6Lj7If7y/eewZcHKHjCJ8e+YstomoddmnXKQaHoK9mJwBhmvOrq49A0HnuNgVm48T5DCbUiF/wAFdZ7OfecG1Vo3RBGIsh3tFB0xfKcpVOpMH6BaolJu+DYfDZz7A7yNn5BBrmaAIE5RFlS8pLHE3GZ/0+vbVMVIMqSQ/5+LQLei5Eyrt75zOvZ+8BlhslwEYMH+lJT3ixviOMhNyUJPdm4h+uzi6V0yUq2gucHJAgHVYKEWAMhDv6FJ5VOIGzC3O/s5BnvDxZtGIF+HyCNboooECv/j2hfLtjIVFeii5GOTY2q+R+k/2hHcmXlP+zhkHg18m2NTcitBPc1C4dR55XX1D+RFwKBtIvYq+EXv7ipYEj6uQyVWiaTZQsrqOtH1GTdMTuwwvQyLrVJNVLvnOM55N3QTEIUmHRNXc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(376002)(136003)(396003)(39830400003)(86362001)(38070700005)(4326008)(8936002)(186003)(38100700002)(107886003)(53546011)(6506007)(9686003)(83380400001)(26005)(2906002)(5660300002)(52536014)(55016002)(8676002)(6916009)(33656002)(7696005)(76116006)(478600001)(66556008)(66476007)(64756008)(66946007)(122000001)(54906003)(316002)(71200400001)(66446008)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0cmAKflwu6ybCDOuBLxvPGkLL22920wch9zCnhbJQ0tSr89/n4vuHzlOq8yJ?=
 =?us-ascii?Q?PB+WKlZMpD/vrfjkEaoH4P8cVH4YYoddNhDj4dvq+eeuULjecAagHW6bG9F3?=
 =?us-ascii?Q?qGF0z1XJY5uNmn8TMJRHlnGcHdVHJ5lMHKWGF070JPi3eaVRErNKuU2eiv1b?=
 =?us-ascii?Q?Im0V5Ftirxflzz7BpNwOhNSZ2NObUgRBxSMffJsQSdBIJIkWTDE02LCwk8TR?=
 =?us-ascii?Q?uhKrb9iO3FAHjJCqWkD3CSZQ8Pv+Nuc5g5s7ph5sLjPY+bIPrjb6+ZiKLrOg?=
 =?us-ascii?Q?07Wuf9ujHWRxcfAK6LRM1Jf3CMs2O7rQrPpbhjek8AW2CWZbmVtSUSF5SjCg?=
 =?us-ascii?Q?J21Te4x0gyRCFGS7dILtslrt7is0SeGoYFqubSPYIycdp/Sbrra8RW6RaCcT?=
 =?us-ascii?Q?8Qm7hKBwkavXjSgne7remUjLjeanpbyfMhmEDM6tTiGpocFFvBIDw0oIs6P9?=
 =?us-ascii?Q?u4OsUZJeym46BOQs0ursBGxtON9uK/dUh9ZvbYV+q9IZGyJK0eoFceIE7CBH?=
 =?us-ascii?Q?sMdRMZkLVc1S4rpYrMKlFdJKQbk2W99SvOscBK2cKxyMXhK5qTKJ42UqvAcH?=
 =?us-ascii?Q?btuYMSNb8wSEhXMqQzvynznycZFfH4x466Fb5nUB5IuaF3IZ27KfpTqIJTzV?=
 =?us-ascii?Q?hqmkOpvhlRPs03Nu5IhVGwjN5kqDPFIBEbwuZpvEyXph2jDdS3l9j9IiadW7?=
 =?us-ascii?Q?P71AlB73cffIDjyfcS+vLT8c6ZYHAZRZf1dOvkcjnlsdV/i1MvreDbMrYk8a?=
 =?us-ascii?Q?08fjgs6Pn8p3Zr3KuD/UKsn9gSlUQNvzUSzjXAmLATRIuJiy458aBRRs4WVz?=
 =?us-ascii?Q?GF99nPZlVfIjkiaZ2o1WwJfTWCA0lvcuvvb/oSz63gfqiRJnTOmYYUtF4uBp?=
 =?us-ascii?Q?tPOD3DPdFn708T1Q0DKyvf7kzJhjL+ysCkBBchFuCeVESKEF8MIMIXj1Kbz0?=
 =?us-ascii?Q?QgLIwXjQkjgFSZHUjvDydTB04DUPXUzWhw+vhmBqG1VxRlYmkQiJNWvvEcqP?=
 =?us-ascii?Q?AyLZfuYpxg2fZa7xuM7e9uQ052adrYrp/3LNuZTcusQdEKKhlL/S2BoB7geU?=
 =?us-ascii?Q?hfmXk9iq2C4p5ZM+u9zqN0GAMbS0pMabcmQ18qAjVnzED+iMtliSYtAZxnym?=
 =?us-ascii?Q?Sj97/TTb9NQErdXibFhTKI43XjnLf33Mi/6LHR2bnWOzuqiujdke8B3QVcVR?=
 =?us-ascii?Q?5YYNzIMeWFAbIjgQbXR5nKRid9Moj4cLT7Pg9Suc9C85TCQ1hANNEZ071Yt6?=
 =?us-ascii?Q?WAUFl7bG6z+kZuosAju13px2eAUOmOM32/EQmCp6+oP6d7Kc03ecBtpl0fqX?=
 =?us-ascii?Q?2XMzJfgvSyhTyLVI4WWaj1J9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91f6c2dd-874b-41cb-9c65-08d965d44d6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2021 01:21:15.5198 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5CFGj87laOhuNQGpikQ6EN46sR3uBY3AtCr5g5CVPhFv7ittqWn7/ZK3reQpC0YPqwyw62uhrmJ38beN+W0MlruLsL3Q3swS+yBLNQYIx9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0601MB1828
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
 Ryan Chen <ryan_chen@aspeedtech.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rob,

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Saturday, August 21, 2021 4:02 AM
> To: ChiaWei Wang <chiawei_wang@aspeedtech.com>
> Cc: joel@jms.id.au; andrew@aj.id.au; linux-aspeed@lists.ozlabs.org;
> openbmc@lists.ozlabs.org; devicetree@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Ryan =
Chen
> <ryan_chen@aspeedtech.com>
> Subject: Re: [PATCH v2 1/5] dt-bindings: aspeed: Add eSPI controller
>=20
> On Thu, Aug 19, 2021 at 04:00:36PM +0800, Chia-Wei Wang wrote:
> > Add dt-bindings for Aspeed eSPI controller
> >
> > Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> > ---
> >  .../devicetree/bindings/soc/aspeed/espi.yaml  | 158
> > ++++++++++++++++++
> >  1 file changed, 158 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/soc/aspeed/espi.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/soc/aspeed/espi.yaml
> > b/Documentation/devicetree/bindings/soc/aspeed/espi.yaml
> > new file mode 100644
> > index 000000000000..fec3d37f3ffd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/aspeed/espi.yaml
> > @@ -0,0 +1,158 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) # #
> > +Copyright (c) 2021 Aspeed Technology Inc.
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/soc/aspeed/espi.yaml#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: Aspeed eSPI Controller
> > +
> > +maintainers:
> > +  - Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> > +  - Ryan Chen <ryan_chen@aspeedtech.com>
> > +
> > +description:
> > +  Aspeed eSPI controller implements a slave side eSPI endpoint device
> > +  supporting the four eSPI channels, namely peripheral, virtual wire,
> > +  out-of-band, and flash.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - aspeed,ast2500-espi
> > +          - aspeed,ast2600-espi
> > +      - const: simple-mfd
> > +      - const: syscon
>=20
> Is this really 2 sub devices that could be used individually or in a diff=
erent
> combination? If not, then I'd make all this 1 node.

espi-mmbi has individual function and control registers.
However, espi-mmbi is also a feature extended based on the memory cycle of =
eSPI peripheral channel.
Thereby, it has dependency on the eSPI channel initialization conducted by =
espi-ctrl.
The scenario is similar to the lpc-ctrl and other lpc-xxx drivers of Aspeed=
 SoCs.

Chiawei
