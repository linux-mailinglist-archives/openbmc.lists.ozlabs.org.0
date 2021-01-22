Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E42592FFF96
	for <lists+openbmc@lfdr.de>; Fri, 22 Jan 2021 10:57:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DMZRh18K4zDrMm
	for <lists+openbmc@lfdr.de>; Fri, 22 Jan 2021 20:57:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.130.122;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300122.outbound.protection.outlook.com [40.107.130.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DMZQf68lYzDrdL;
 Fri, 22 Jan 2021 20:56:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9kaLh4B+sh63sNs9FAMu3CG9j5LBxjIxGNYspvJGZ8gNgD/3WVotG2cF3FhU4OVzUQ3JAsLyCJNobeBr7bkQUiYa9qqICsnnQzYaZn9+fw8SJfOOvb3haR8P2U0utMt/zo892kfsW9Jb03CvYEn0HNuynE5voE+uW39NTNvAq49t/bVJu2evgKRUzgXGa7PxS7oG1t5Vh2SxBM0DiDY4rr0wt3EPBN+PBiXA3TLPXMqvYh1p9qK1hazkrZqyYvck9YB90zgk3FwwRKm2Dd+qwHH+H1+vO/wBQM50mUAvVO13PKK3H2PP320XFwV7w/FJmPkZgVc0Jkkonrd7/VD5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hwLtaw9iQlc4tE2ieiUjoVKkienBlysf8Y0mMvys1ms=;
 b=HRe07ySW6cuW93l+NEe2dGLUvTzxLq5+CwahxYJxP8VpxZQhXiTQHJ8Wv8OaYudbmeqLD4jADtZht1sKoPQOEL4YCtvypY5ekhA6wqLSDgySHNhAy6+GNp6uA6VA2nuyGE7n9ijlX5K/qbf0jyShkvi69NOuZPlrIajTX7pe5b1Oh1i8Nxx5iO1NHoYyk1Mj3MsBVBiAfo7QeIgViWeV4bcQIEYc6ZxEhWaNvsmVwRm72WO3d1nGaPLZiCa7OVd2ckavRJOL8yerbMt/Y4ZcdsXTDnA9rAaGTcPL1fNNffkQLTNgkJSjMf5ml+PKz0/aIszRvuV8dQ5A4CZDxwQaeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK2PR06MB3459.apcprd06.prod.outlook.com (2603:1096:202:39::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Fri, 22 Jan
 2021 09:55:57 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::394c:29f2:cb4c:55ed]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::394c:29f2:cb4c:55ed%3]) with mapi id 15.20.3763.014; Fri, 22 Jan 2021
 09:55:57 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>, Lee
 Jones <lee.jones@linaro.org>, Joel Stanley <joel@jms.id.au>, Linus Walleij
 <linus.walleij@linaro.org>, Corey Minyard <minyard@acm.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: [PATCH v5 3/5] ipmi: kcs: aspeed: Adapt to new LPC DTS layout
Thread-Topic: [PATCH v5 3/5] ipmi: kcs: aspeed: Adapt to new LPC DTS layout
Thread-Index: AQHW6ndv3XSOmnDNxEWbiHxcjxf3tKov/heAgAN0hCA=
Date: Fri, 22 Jan 2021 09:55:56 +0000
Message-ID: <HK0PR06MB3779C3106D2FC593B5E5243F91A00@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210114131622.8951-1-chiawei_wang@aspeedtech.com>
 <20210114131622.8951-4-chiawei_wang@aspeedtech.com>
 <c8421730-f8a6-46a7-9e2c-9107eb979276@www.fastmail.com>
In-Reply-To: <c8421730-f8a6-46a7-9e2c-9107eb979276@www.fastmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: faa2e7c5-7079-4c48-cae9-08d8bebbea65
x-ms-traffictypediagnostic: HK2PR06MB3459:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR06MB3459D6C7AE3D00D31717FFC991A00@HK2PR06MB3459.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /VERJCm6Z3PHr3R0hDIMkREPvDSsKqrnEZE+FMRMrVYKOdDq9QcwANZ4M61miSKKytjvSFMU9qmgiNGmC4LLReLkZOzrXLDiHux2azuD2cvI1L2RaJMJw4Pj1OYeaw3AScW7wOnPRMOsJykj9ckJbvctdMUg0kv1yw5+EhPAlte1bTsAu6M8jcBqnPv15CcHmGKBj9L2/W7DAJI8pNzrDKwzcdDOucmLhWeIH1o4INAGShuHyQkkTPL8ggcex4E9lkHQHNzH4LaPGZt8ZyyUP0GWboi9yAZ0WOiFqc7z9A3LQ8oMCcIQDsJYw6TkkRCU96AWvQEILhBd97Px+lJZOJngdwvjQuLsZvmAfnxsLUiq09jPik9TaEkXgiiwlkAL8kkvP6RPp6D73uL+vdKsPdZielzAnnfo9EYT+yEX1y0O64w4/e3AZ5qiu/MWVZ4u
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(366004)(346002)(396003)(39850400004)(8676002)(83380400001)(66476007)(2906002)(7696005)(5660300002)(86362001)(55016002)(52536014)(9686003)(921005)(186003)(316002)(64756008)(7416002)(54906003)(55236004)(4744005)(110136005)(6506007)(66556008)(66946007)(66446008)(71200400001)(4326008)(53546011)(33656002)(26005)(76116006)(8936002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?mJPbbDQ7iFYiYCjYc1nZM1/XaqTo7lZmBN2hRva0uQyudG+xLGN63ELsfq81?=
 =?us-ascii?Q?XZhQtO9Pl/FTPuLqZ6Vu0LCseBjR/AE+MtHM9p8BvsoJojwr3qnOu8wzE6EA?=
 =?us-ascii?Q?5B62HoXroDbgPZEzFJg6xn8KL7slfeQWYwfLtLoFEn0EAwl9F36qFD3L64B3?=
 =?us-ascii?Q?gTorcKPaNr/Yztet251neSD7n28RhPQdcsVxH7MMZhrOx7oGgXM7Qwn2/2uu?=
 =?us-ascii?Q?cxIGxc2PFoHvxVMHyCHXphCdDafo0vjWxFrTP735Nh9GT4QS4VRJeDJoAFj2?=
 =?us-ascii?Q?NvBKRvccGUqqI1vFG2o3aqK6m2IsqB0eWzdFyLMf6rEOZ6kFrr/pMeNS5Xxx?=
 =?us-ascii?Q?8RC7ZD9W3U1Q0rYt1pufq8hea/ikHTvZrm3wxig3r39mjanB+xMnACUMIe+R?=
 =?us-ascii?Q?OrNZpmFPbAh54Kik5/qmHJDd+kO7E4MqChS5LXavXVXVNPE1zLvSJV/xG2cl?=
 =?us-ascii?Q?mD3m01xn/YR7PFyAQi/NRbrvBKFXF0cpeBOuSjGmTiEk4M3OjwO5Z7BTi6UT?=
 =?us-ascii?Q?LA2k8GwCmTrQ+jeXsD2TUJYSeGoY/QSQVqKGcDB43whhG6ftPZ+z8fevwQ4d?=
 =?us-ascii?Q?CxVsPfz+pcDgtLyirMqn2HBb211J7rgw330iaJBKRjY15fc8Sts8+FpjzCJG?=
 =?us-ascii?Q?j1lYwxLxiqnEHZpSer069iazXfhCvV9mMRIcq5eWsAYKab/GpxAxMeiu8wIT?=
 =?us-ascii?Q?dNdPRf8LX1XLRXyEwEHgjah3cAINlbMDerbJnZoVlMN4nQDjTtyVoUo2LOow?=
 =?us-ascii?Q?AFTrpIUm5uSBwIu0RDVehRtI9LR5fS1/JeJ/kTH0GLjUjpyRKtdDNiATpTZz?=
 =?us-ascii?Q?MubcoiU+LYBtjbwnAaClRlUXEisEe1RSK8kJI8A5sHh+6choRfSL+3LgQ/JC?=
 =?us-ascii?Q?xds5ojXcb/L7U0byNQAzeozum/CslKawOS2vehP+YF+ce//1NpT5+g4sr9uV?=
 =?us-ascii?Q?rvpB/cJsBXYT0giYRT6hXchFRGoKwReizuN2fnnUyJg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faa2e7c5-7079-4c48-cae9-08d8bebbea65
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2021 09:55:57.2517 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yFpaTYPXYTUFMKnjyzuJUQv6yB+Z+sASNpf36zbph8APx1WYjg/essqhFAuDwle1to+mtYpbLmRmmK3hrIalJE//gwQm4MjUAa6GpiZ8cuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR06MB3459
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>, Cyril Bur <cyrilbur@gmail.com>,
 Haiyue Wang <haiyue.wang@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Corey,

Could you help to review this patch to kcs_bmc_aspeed.c?
It mainly fixes the register layout/offsets of Aspeed LPC controller.

Thanks,
Chiawei

> -----Original Message-----
> From: Andrew Jeffery <andrew@aj.id.au>
> Sent: Wednesday, January 20, 2021 1:03 PM
> Subject: Re: [PATCH v5 3/5] ipmi: kcs: aspeed: Adapt to new LPC DTS layou=
t
>=20
>=20
>=20
> On Thu, 14 Jan 2021, at 23:46, Chia-Wei, Wang wrote:
> > Add check against LPC device v2 compatible string to ensure that the
> > fixed device tree layout is adopted.
> > The LPC register offsets are also fixed accordingly.
> >
> > Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
> > Acked-by: Haiyue Wang <haiyue.wang@linux.intel.com>
>=20
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Thanks for the review.
