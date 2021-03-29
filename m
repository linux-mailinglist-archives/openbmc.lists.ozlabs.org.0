Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7035E34D774
	for <lists+openbmc@lfdr.de>; Mon, 29 Mar 2021 20:38:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8Lv72yhwz3047
	for <lists+openbmc@lfdr.de>; Tue, 30 Mar 2021 05:38:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=FIIcorp.onmicrosoft.com header.i=@FIIcorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-FIIcorp-onmicrosoft-com header.b=RzHWg2M4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fii-na.com (client-ip=40.107.243.53;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=mohaimen.alsamarai@fii-na.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=FIIcorp.onmicrosoft.com
 header.i=@FIIcorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-FIIcorp-onmicrosoft-com header.b=RzHWg2M4; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2053.outbound.protection.outlook.com [40.107.243.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8Lts3Jsrz2yQl
 for <openbmc@lists.ozlabs.org>; Tue, 30 Mar 2021 05:38:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXQQylihk6FYOTK9ztAZpw4IBP1FxOdDVU1wbTTI3lWv6poidfSIZBgQkl54iARthjF+bbQPPIUzO+eEZlq/NLVAtsKAo8fQNj8OuziDjWAeY1lMfSuqx3R8afu+TEu5zDOFjdHnRH7ZnyiH3kKrNRxidczYSIRPU68X7fQzFkLXOTczfgLi7gRf/9Ng9AmH/KKs1Ipxf2ibdbt3rVnEwwzq+MHuZFdnSV4jHzxaVVyT+/W0gTdZVGxG8RVZAl7HO0pjZFCel796IilWtbSrUoyWS/smzHgX6ExhIm2dIJnzNF5GeOgKBGJJm0ott63kQ2Lelwq/GSrmZ2nTRzxEWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8824zOf05FLgGgfAW/5wx6fdnQmlZmnfkM80g630W8g=;
 b=g6vVnl1LqqvmXQjrnG5kYhP58+pSpKy3ZPNUk1YrMX5kHDqPofjao714RGcyJ0SkhdxLsIu7wYFHm9zXVj+d1KyUn2Yjv4fWW/S6CQrg9JegV0YZe8rjP0fLKRxamiBK23MGr0h9+MP1tQAD7+L/m3DpDI0f7O96odUsH0eLo7O22kBRj+j4jZFyrP8VQdRztCzzWJ4PGwxUMM6eZyyjAiR5Fqe1FMstlVzE0uhbepHs0no2hCvyBjDxS0I4gMuHQfv5o4rkIGLs4bBX3Z5t2EBchgDfgyUQBKq9D3+SxBgny7AaRNBi8e9+4BSCiEiHgClpmtAu81jxDM+XemjA/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fii-na.com; dmarc=pass action=none header.from=fii-na.com;
 dkim=pass header.d=fii-na.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=FIIcorp.onmicrosoft.com; s=selector1-FIIcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8824zOf05FLgGgfAW/5wx6fdnQmlZmnfkM80g630W8g=;
 b=RzHWg2M4kF1s3B4xkA6svpgpnMbpwgm6uqvtZf6uRU1HWK+qS/ddftYgqxIbrxeowZJORprv/gi7OfcdV5AgXANvEddjMhZqYOkm0dj3DK9vi3NK1TJy6UGRRc9vg5oRXXeSTpriEZo7jDJPNtw4/QYx0iPyu/5C9xU1w0ZyhNtFv+KtL4aPnxNAE8zmBzx6bwRURocGMy9pXbvGI8Cci2U51ApOBQLfXI5lX/WEF0R7PB8cQiVNgFQ4dMz2khi5/+KoTyyDnyn+Ro2WqK+hRxigKdkkddjiz0YlsIpnU0Azu6LCZ2O+MjQGeHNAPDNH65mX3B/9uDvL1ozIaLudKw==
Received: from DM6PR08MB5883.namprd08.prod.outlook.com (2603:10b6:5:152::18)
 by DM5PR0801MB3669.namprd08.prod.outlook.com (2603:10b6:4:7f::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.33; Mon, 29 Mar
 2021 18:38:21 +0000
Received: from DM6PR08MB5883.namprd08.prod.outlook.com
 ([fe80::f427:75bb:e9b3:7919]) by DM6PR08MB5883.namprd08.prod.outlook.com
 ([fe80::f427:75bb:e9b3:7919%6]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 18:38:21 +0000
From: Mohaimen Alsamarai <Mohaimen.Alsamarai@fii-na.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: RE: group for foxconn CI  / fii oem repo
Thread-Topic: group for foxconn CI  / fii oem repo
Thread-Index: AdcVIZiiqI1Mo4UGRXSPEPz8kXQKEACU66GAAJnvRAACu0WrkA==
Date: Mon, 29 Mar 2021 18:38:20 +0000
Message-ID: <DM6PR08MB5883E400A28403E42592BF07B27E9@DM6PR08MB5883.namprd08.prod.outlook.com>
References: <DM6PR08MB58838020F8543D03C6235064B2929@DM6PR08MB5883.namprd08.prod.outlook.com>
 <DM6PR08MB58834FC516032C1D11C9F9F9B26F9@DM6PR08MB5883.namprd08.prod.outlook.com>
 <20210315205148.z6mcrx32kxr56lm2@thinkpad.fuzziesquirrel.com>
In-Reply-To: <20210315205148.z6mcrx32kxr56lm2@thinkpad.fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fuzziesquirrel.com; dkim=none (message not signed)
 header.d=none;fuzziesquirrel.com; dmarc=none action=none
 header.from=fii-na.com;
x-originating-ip: [65.205.114.151]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be06728e-5670-4217-a818-08d8f2e1d40e
x-ms-traffictypediagnostic: DM5PR0801MB3669:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR0801MB36697310FC054B17383CE8C0B27E9@DM5PR0801MB3669.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8g5hbSXUx7ktMXeslWBz8pAGvnEUMWY7wvujcjDTImoTjRGo0s+N9Ca3h6kQyWhVPPAgNXNKyTw9x1ky81pzi+MtlcTcx7TsNTZ5Z5TiOI1jR9izmXTk2x/S4xbKKG8xD0vWSKtiyXbZCfiiYYcPayNSRKh/1eYkJcZwvkrb6dMMC8RivGOE8mI/rZjmYjUU9CvL1Hhx1gLq8iAoLF7KMJ5n2zcstZ7IN5ynIdtzhRObCKqZb38SrG9QyURRBl+YKnJq7qRv3+4KYBVkicaY8ATXU7sOAScNZaAN8Un0W5hyASjaQKwSpi+Yi1qvdmcFF2ptv8GqKm6xCLxo8jlm+t/wYhjL65Gp6Fd9ntE6VMDM1E1tI9Ht8hvPeoaI20dZUmTtfGN3QhAjkv3iPxIFVtaHnaYG3u2kzYETtWdDEFQR4zVOaI6VjVj4t2HnoFkc8NgyCYxHpZS/+tpbZ7loBMQFjSYUY7B6PP43bX0JhATRTLUz8eHH5xPZrXsMdYSzB46kSByk49NYXuZcrW/fWONY3cxgk8Wt2nU+bWNSJWTSY66FOmVOkvAxdA1bDL8VywRp/wZjDp/32AFWSgWwCLmRtr2wghfrXY3WAaG9hzmDy3kRykniNEY/1XjAMJehqQs9WidDQSHsVijNcY17xHcnAN/6RyzlZ/h/kdNco00=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR08MB5883.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39850400004)(376002)(366004)(396003)(346002)(38100700001)(76116006)(55016002)(4326008)(54906003)(478600001)(52536014)(186003)(71200400001)(5660300002)(2906002)(66476007)(6916009)(83380400001)(8936002)(8676002)(66556008)(66446008)(6506007)(33656002)(4744005)(9686003)(26005)(66946007)(7696005)(86362001)(53546011)(316002)(107886003)(64756008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Sd96Do7DS29ERRKY9Bgypf6T4Z05add7zLDUE7IT2vRUIMWVBFi6XksxsdE1?=
 =?us-ascii?Q?uDE6B3ILiuLZ0urTMquhBRqvwFh2gsPI6SDLlhWkK+F/HQzRFYotBcU0FAYL?=
 =?us-ascii?Q?/v6Zm42Nh2JcoAMLdWwJP6iqmJco0wWWurFzC0oNvttseIjvLOVi4wbzax39?=
 =?us-ascii?Q?FGczVWqEJr1mac1OxewN4jPeTGzJJ31Bnl2fxtNglWJGxKnQJXUxIyPKWH6M?=
 =?us-ascii?Q?hnxgtIjL201evK/vYQDgrm/jWNiiOMyTWZk0HaJn3XZOSDUzAIUX0OD29caT?=
 =?us-ascii?Q?C0/aZ6AFKVXBG8wqYkWw5fV8vNOuTnwvN+4K2KrW010MsgmgbxDATsEJJcXY?=
 =?us-ascii?Q?NSXHoiMh/Zq7ftvZa384aL9wgwj4jJnM1RYLGfIkU1Rj3h25uNBrQZjzvPYA?=
 =?us-ascii?Q?BMhB+f5IASVoiXp/zNSEO0MtGbw4gvc012v4X5TqwvM7y7vrQvhtLKuc9mOs?=
 =?us-ascii?Q?bDm+hdx1itX3nyBVZt3wy66Vi9F22XRm1ZeoHoKS8uhObgYwKuR5dWPE7sLX?=
 =?us-ascii?Q?Wn9AqTdRBuFscVgZbziGjwKfYHrTaszXDHFcGXFmNDfVGa0J8LL9/wXienbd?=
 =?us-ascii?Q?Qz10UD5M0AsAgHB5V9/7Y5u+KJ78420aeGV2++96Ptu0TYLksYdOHwExlFig?=
 =?us-ascii?Q?uN5hAR4M82fj4R5kdjFR3USnjXtKmKTyU5WN4cdkrzDXsGNr2vDrpmx4StGY?=
 =?us-ascii?Q?AhLQuGZZ7qazF5O/xcREcKuUH3qVFO/hFTtHlCCoX5TAS6Ju4j1T3T5SWrWo?=
 =?us-ascii?Q?NqZ1t3ZHCt86uviIm/i14UV2wK+QOMFTWZ/oNZH0IbXgVt8wRdAztGqdle9z?=
 =?us-ascii?Q?boosY6V/IF+FsutQoh95DAaIO/CMFD8VSxtEKqQW37wVUb0gyKlZq5S9bVYS?=
 =?us-ascii?Q?rD1E2nlVs/Gb1aY43AeYJpz/whZjIVrLwowFSw8M+ZZ+Cm/DukCnCSvhJBJr?=
 =?us-ascii?Q?KFQJS0Fm/yL76kP+SOx1ZwOnuO+5QKnshC5TLqRF2XLPLCNtgyKs1tV3LQIu?=
 =?us-ascii?Q?1NkggZc8rit/ETppQ1sTAatR7Lj9F3WoTWZLRG+CM38oE5ycvPyjySbEKyzr?=
 =?us-ascii?Q?CinxLG24i9WDvb78sEs+qpxdg9nA0OYg4vnwMjxdaVbbbb04uQpzZCaBqCZP?=
 =?us-ascii?Q?s2bCXOObAU5htNpa41+40UBVvNMTM8/0RBA+Wi59xdhUzC73CKm7M7TLQLXM?=
 =?us-ascii?Q?aEpvqaFcpNRdyg2IoDy4uX7w/SuOdx+Xz2CkQvl/OMYfuxg2N9NFP+t2hUlx?=
 =?us-ascii?Q?VdPduEzwf4RuRu9vgbM7qBy+yHBLfl5GVFMpwa7+My+uKoU7W9JnaApX24N0?=
 =?us-ascii?Q?EVt/eCapV3UKsFszki8mz5/c?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: FII-NA.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR08MB5883.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be06728e-5670-4217-a818-08d8f2e1d40e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2021 18:38:21.1229 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2f78a81d-6abb-4840-a061-3fe5396c72f2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zTWfSj4L5PuH5csyepi6C8e3PK0QWpEwKZ97CQfuJo873R8aUIG2xwgEqKHZ2dMet/rD6XbhB2d4oR4449jYubg7Fex7dYRZJmEykaZiI7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0801MB3669
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "vveerach@google.com" <vveerach@google.com>,
 Lancelot Kao <lancelot.cy.kao@fii-na.com>, XP Chen <Xiao-Peng.Chen@fii-na.com>,
 Mustatfa Shehabi <Mustafa.Shehabi@fii-na.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Brad,=09

You can add people below as maintainer for the Foxconn-ipmi-oem
mohaimen.alsamarai@fii-na.com
lancelot.cy.kao@fii-na.com
Xiao-Peng.Chen@fii-na.com
Mustafa.Shehabi@fii-na.com

Thanks,
Mohaimen

-----Original Message-----
From: Brad Bishop <bradleyb@fuzziesquirrel.com>=20
Sent: Monday, March 15, 2021 3:52 PM
To: Mohaimen Alsamarai <Mohaimen.Alsamarai@fii-na.com>
Cc: openbmc@lists.ozlabs.org; vveerach@google.com; Lancelot Kao <lancelot.c=
y.kao@fii-na.com>
Subject: Re: group for foxconn CI / fii oem repo

On Fri, Mar 12, 2021 at 07:25:42PM +0000, Mohaimen Alsamarai wrote:
>Hi Brad,
>                How can we create Ci group on gerrit and add people to=20
>it

Created fii/ci-authorized and fii/ci-authorized-owners.  Please add people =
to fii/ci-authorized to automatically approve patch authors for CI.

>And we need to create new repo for the Foxconn ipmi oem

Created openbmc/foxconn-ipmi-oem.  This repository needs a maintainer - can=
 I get a github account handle to invite to the OpenBMC organization and as=
sign the maintainer role?

thx -brad
