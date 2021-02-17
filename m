Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2539031D5CC
	for <lists+openbmc@lfdr.de>; Wed, 17 Feb 2021 08:40:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DgVBJ5CXTz3cVv
	for <lists+openbmc@lfdr.de>; Wed, 17 Feb 2021 18:40:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.125;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320125.outbound.protection.outlook.com [40.107.132.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DgVB463Cvz3cLy;
 Wed, 17 Feb 2021 18:40:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M3ukMJaK4cjbe4/JXw1JGdn9Qa123tnROdnGyKaAuMjpczPpFlhYoDwwlGMd8iUH/sgMQEVb4S/P51qWxIL9q1Q7sm2qqictNGkbKHKnZUKgEWfhtQH4ONDqIfjByPalL2CROzZaVg9tMf2U+HAcadG086dAQh18lHJuKZtKELQS+IsYfCLmpCit9IHOP8F14EOn49zDCJmPunRwF98zP/viLpllHQe7O5+ejq5EBI4QBBBU88R+s3xlwfVFVtymvQckHKOgxVVg00OaDVj1f08GRvxNhGXnFpacmc67eqneH+MabgXs+H6WxKvyM34ZbJx72ViitHq1EsFis+0h6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9B3hux1IxS7FYEurOjBLzeegi7kYuStTT0ETlYnE0E=;
 b=OQZsgNxX0mtVKtGJ1AqvdTyElvjRzKJAmvfuIg6dz5cjf3w8Qs+6N8ryeCp6CIbC87biusd3Y8b3lM38EOYWZ+tWhDxn3S6Mdb78gsYOXQAkrkkD52CJlLOIea8x17692TTJBqwFW9nGiJ87pMkFxngDW0UCI0EkXK6lPDQPgMAESjKBNJpbx4uPAVgbaQreibbvO62G+P8ig6zyw2ozRcXkObUvE9CdfV4Rf5kbprE2QJYlA1iXFSL/2gCO86ADmB7QXtSXy1N42DUH4hn6qJf2/gG1sIk3Hj2Pc26I7RfUExHNHE1O+5HJ8Gi8OoSvEbl/IhuRYTXWIJzPYswcxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (52.132.237.202) by
 HK0PR06MB2819.apcprd06.prod.outlook.com (20.177.24.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27; Wed, 17 Feb 2021 07:40:17 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::394c:29f2:cb4c:55ed]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::394c:29f2:cb4c:55ed%3]) with mapi id 15.20.3846.041; Wed, 17 Feb 2021
 07:40:16 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>, Lee Jones <lee.jones@linaro.org>
Subject: RE: [PATCH v5 1/5] dt-bindings: aspeed-lpc: Remove LPC partitioning
Thread-Topic: [PATCH v5 1/5] dt-bindings: aspeed-lpc: Remove LPC partitioning
Thread-Index: AQHW6ndtLpV90qI+i0aaOeinwbKhAKo6sL2AgCF0F+A=
Date: Wed, 17 Feb 2021 07:40:15 +0000
Message-ID: <HK0PR06MB3779B25984A461E4A1ADEF1191869@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210114131622.8951-1-chiawei_wang@aspeedtech.com>
 <20210114131622.8951-2-chiawei_wang@aspeedtech.com>
 <85f00459-4a39-441e-8119-8e12f8132cfe@www.fastmail.com>
In-Reply-To: <85f00459-4a39-441e-8119-8e12f8132cfe@www.fastmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6cee2f67-245f-4575-509b-08d8d3174492
x-ms-traffictypediagnostic: HK0PR06MB2819:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR06MB28194DA48E205F9EFCC719E191869@HK0PR06MB2819.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: upFmur1U1rXrvRla/oUuG+AF6Vmd40/2tnBmg/pC++1ClR8gcuBOkP9vPY5c4k3x8nWhEt7pydbTA7AZKO7gZtZTOwa5aIMg/geMsh4IRmICzxw7pxFuakON5lUAbKk2Sl3Wz0sFPifDqg4Ld50RGI6W3ydn6SPeeKIhEDZgV0ucvWfDoRuGTUkZsT3pxQKE9FKO1IjaYhWzSAVGP7Vj9nC+keER0Pkud2Lft5CQaKC0zkLoAjueNxF2sKuvqZGHQ9HV/HuWOiBiEkCb3aWK9TmKsF+SGr+u48U7He1KEydWnZTlYzEkpgVOkXWetCCiTTGESNtg2b6Px7zQ3wR7hQ61dS/4sKepSJv3iW69RNHFnZvDkgHA2beKldSte5OGCblbvVgP9ZY+cKTp+y/9cBtsLCP7wGW3AYYEdgBrjEvCoslUTmeKVLu+XD3PdxkJ+lZTL5r+K3XwpRxD5T2fup/9la6ybkrePxQPxcpjsvLuMj6ur0LbY34OqyfYxnffHcGwD1NdEmocrS/QR7LNng==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(366004)(39850400004)(376002)(346002)(55016002)(54906003)(7416002)(110136005)(33656002)(478600001)(9686003)(316002)(86362001)(6506007)(53546011)(83380400001)(4326008)(26005)(7696005)(186003)(55236004)(71200400001)(4744005)(64756008)(66476007)(66946007)(66446008)(76116006)(8936002)(2906002)(66556008)(52536014)(5660300002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?SiyHhbJzaOA4MJCpflgj0CEifAstmD34AQJjY6OpLpwbys2kYo3xEXtrQAlA?=
 =?us-ascii?Q?eSMK40nMqrNT+UhhBNCb5tuyvSdzC8K8LfPixzb/m2YOacvPxV/9aSo4mgcq?=
 =?us-ascii?Q?p+gVzvzVtiL5z/LpIhZmdhljNogsgMwvZgp31QEMq4Nto1D1NfK+JOJ1epmM?=
 =?us-ascii?Q?la9kj13TZBeRr3hy/dA/KqRWxPkduN3/58qGec08gYbN5lvfzLGP2fzD9FZl?=
 =?us-ascii?Q?5Nyr743GsRNwtOOGWVuKipp7/8VLB4NdBgqf72Jhc7DRu0xMPHOnS3iJ2pz5?=
 =?us-ascii?Q?4KQrGZiGMKGle/lmPwdJR75+5uOYYULxuyJQIcHt9a/AOxzyiA58GmP85G5x?=
 =?us-ascii?Q?YYxGHccpMSF3VmnyuDjtNTXUwjd7TjpdmTXEYS8B+R/Q4tzXybnWgSNE1aeV?=
 =?us-ascii?Q?TzAvAcEQDgYzh5dCu99qlvsIY5fyw5iZ7Evlwm+uLb8Syhud4EEY6qO6rh13?=
 =?us-ascii?Q?znrLHc0JqnXPD2gNqqfLYZQrt19JzPEWoliPfDbjPX1TFVVZC0Vj/P6W1NWh?=
 =?us-ascii?Q?lUk5HFfHu/4jV+CseQ6nAlU4xxmUcl2HVoGX7CV3H1aw+UcvpEtcOv1Om9fd?=
 =?us-ascii?Q?Za3GkI1e/9tUrf8DBj1wMg+T25t0X3GgzBeWykY8/y43VwXf1OAqUTwBbYfh?=
 =?us-ascii?Q?0MbeEgW7zeb8eYqGmHmkjSrqxHKEXKbLn2j0yiIEG6ITtvis/6UBl4YdHvT3?=
 =?us-ascii?Q?zFs32ouL2aVoIfYTRcNiYZiAATOUMhTp55+45cTH34hrgVwKlfMuFNknNysZ?=
 =?us-ascii?Q?apYwBjutUBLyMtj+GmjjWk/C/8SUrbeVTZx1wPywHHv2pJm/+1kX8pZe8O9e?=
 =?us-ascii?Q?bS0BL6iUDyvluViGt4Nn+/H4dKkc0SIhwUuwVjsO/o6mJWU0JcbkUK1DolgU?=
 =?us-ascii?Q?uwF2o1mdj59NhScgCPR/OTfEsh7HS+ok2Vs9qP4pXu+fDMn99nWgdNU07Nr6?=
 =?us-ascii?Q?wPm+aXZuloTl7OXGtQOh2u+CDRomyzzLdK9VUji/YIfU33wGKdFw+Ni3gULk?=
 =?us-ascii?Q?KTh/0OjfmRSm6GQp0L8Z9Ek17Tpx2hjWa+fSt4c7RkA5kzKSgQtNQljrhMGs?=
 =?us-ascii?Q?U4lohfyfW3tKxi+Cdbd71op7b6eBSgnwSm43eCR9rOSxe344zoPnP5vFK+es?=
 =?us-ascii?Q?E8jvJdGikRFIMi7QrnmLo6ioAtNEDI1PwwITmzk7F/vMZblefxFY3u5eR72R?=
 =?us-ascii?Q?WiIZapHraokFDpZjBoEbIyoMH7RuJPn6aCh0441+loOU8etFk/GLJgHrtUJo?=
 =?us-ascii?Q?W0jrxfz0LPejpbz1eiet662wV1CKFN9ShyooEzx6fFyPPSJrzT4IVstty5DL?=
 =?us-ascii?Q?HNY3A5XMXqcxc94zCNh5FTqv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cee2f67-245f-4575-509b-08d8d3174492
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2021 07:40:15.6725 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VMNjQXz+qtD5Y3OaH6KcXs63vgs0S0ZTrIJcCOEC7LFDr6AE1ggXyrdffkVwUomao82P9Lk2m7+V4JmF0j6TskRIg2v+iaMCSQg2pOqQOOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2819
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, BMC-SW <BMC-SW@aspeedtech.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Corey Minyard <minyard@acm.org>, Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Haiyue Wang <haiyue.wang@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi All,

Do you have update on this patch series?
Aspeed has subsequent LPC module upstream plan.
We hope that the following patches can be on the basis of the fixed LPC lay=
out.
Thanks.

Chiawei

> -----Original Message-----
> From: Andrew Jeffery <andrew@aj.id.au>
> Sent: Wednesday, January 27, 2021 8:25 AM
> To: Lee Jones <lee.jones@linaro.org>
> Subject: Re: [PATCH v5 1/5] dt-bindings: aspeed-lpc: Remove LPC partition=
ing
>=20
>=20
>=20
> On Thu, 14 Jan 2021, at 23:46, Chia-Wei, Wang wrote:
> > The LPC controller has no concept of the BMC and the Host partitions.
> > This patch fixes the documentation by removing the description on LPC
> > partitions. The register offsets illustrated in the DTS node examples
> > are also fixed to adapt to the LPC DTS change.
> >
> > Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
>=20
> Any thoughts Lee? If you ack it would you be happy for the patch to go th=
rough
> the Aspeed tree?
>=20
> Andrew
