Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2E727A8F3
	for <lists+openbmc@lfdr.de>; Mon, 28 Sep 2020 09:44:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0F074qX0zDqRd
	for <lists+openbmc@lfdr.de>; Mon, 28 Sep 2020 17:44:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=apc01-pu1-obe.outbound.protection.outlook.com
 (client-ip=40.107.132.113; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320113.outbound.protection.outlook.com [40.107.132.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0DzK5rnwzDqHX;
 Mon, 28 Sep 2020 17:43:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fqGYZN4ieVlUCwxLxGiEFVM7I3m+WXFwL7/K2kDFeUb0ymfalG9m7zullhSx0/y7COI9CMB+G+5TV9OjFQiPvBvDRw/ST7nXUuZyCZJn/Eh+uxg/G9AdW0Jo7t8aOxZleOemloNNHtMtze3X6YO1YOtpAhG8QhXcXNkY9CGnAnR62idA+HEO3X8bNNvcDiAA/Z/unxEjDk28pn9zteqzpr5pUX4s0rhTARx/0raK50GJyTsNLZffTt8aY5Tp5xOTMViMCQQ5h6Rn8UsgfFEbJWtHB3ORzEmBnsw5c0dg/wUkSdOeGIskCbd25kInPJ3dOJWcKoXLhKsbnpUfcTreAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/UeYEfPPrRPjrXSUKJh/fnAh2yKjR2jcBazb+N4KJs=;
 b=kk9i+MOY2woagNkq6auHfTqq+HaIHePkWfYDW1RVg0ekZOysgprFYbEfeoYKPw1FFxy+jf+3+V3Uabhb0Pr8OC5L5B8QxbJyVk6NAoRZ7dSBr6ZmMu3wjvGKl3b6kQLXl0rqqXTI+i4c3J8zWWZUqG4VpZVNFMcaagr7ncHpPI3mzjbrVxwLVDPKtH62pV2LOI4UWIWWQEr00V6vD+BwJ1pQ3aX4aS8X+aZA62fZhETMZ1sO/oeaksoFgb56tHFkktgkJq1WiRb0kP+PJwihD5T2u8l9fh5nPX7XsMEKQEAGI1/CDcvAlxlTlr2NN6VDo6cOemED+SKhQLlVmdO9GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com (2603:1096:203:82::18)
 by HK0PR06MB2180.apcprd06.prod.outlook.com (2603:1096:203:4e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.25; Mon, 28 Sep
 2020 07:43:25 +0000
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::6def:b61:3beb:f3d5]) by HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::6def:b61:3beb:f3d5%6]) with mapi id 15.20.3412.029; Mon, 28 Sep 2020
 07:43:25 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: ChiaWei Wang <chiawei_wang@aspeedtech.com>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Subject: RE: [PATCH 0/4] Remove LPC register partitioning
Thread-Topic: [PATCH 0/4] Remove LPC register partitioning
Thread-Index: AQHWh+4lSaHeVstvYU+XSydm48sqEKli0RGAgAAL8gCAADwrgIAaq96g
Date: Mon, 28 Sep 2020 07:43:25 +0000
Message-ID: <HK0PR06MB33800F282095AA96884B2FC0F2350@HK0PR06MB3380.apcprd06.prod.outlook.com>
References: <20200911034631.8473-1-chiawei_wang@aspeedtech.com>
 <CACPK8XcYvUj3W-CPzXKugp3wx7rcLEJ_8f2-Bi6V7QHZpopBbA@mail.gmail.com>
 <551926fc-7bd4-4a0e-8fcf-4675dcdba22b@www.fastmail.com>
 <HK0PR06MB37796D91EC7290A69F2655E491240@HK0PR06MB3779.apcprd06.prod.outlook.com>
In-Reply-To: <HK0PR06MB37796D91EC7290A69F2655E491240@HK0PR06MB3779.apcprd06.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aspeedtech.com; dkim=none (message not signed)
 header.d=none;aspeedtech.com; dmarc=none action=none
 header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2cb96266-5e6a-4252-29ca-08d863822ea6
x-ms-traffictypediagnostic: HK0PR06MB2180:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR06MB21806E66C3F965DCCA88E9C5F2350@HK0PR06MB2180.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I60dYe13OE1gNt0saLDUt3fNL4ehBu0x/3HSHMGH6Qp91dCnpCjomzA1AAmzMfa0Qf9FsHQMOt9ryK+hGxx/UVP4tka3q6q6Iwohx0HVsuH1uhOOXypynWldw/KOSzuCm7WVVC3/CLdoCKxIVMrRqrtEM+9dZeptC8Yus3ZuQH1siU8YqfTzdTbF/rXgmM+mmlVsN2EDcVpAFAYToO99vJLF0V8HL2hH0fjHXgVe/+ibbaX+5dsaMfumH51Gn5ka/Th/93B1Gt9Tafbl9UAOMpCH41w5sjeYnAfwm2xJySg3+p0qjUNDV34jxr4EhnvWiS/UB2Dzf6hbr6KFFu0WHOoXVqM5dzKtyhd7rIcUe+n/LVF4OTK8PfdgOfK0K63DrHM195ZN89yXM8PBcVowhkQeB25hs7teHznxWcJF5rxaRC5yhqnEr8NxqDk7vSs72z3Bv5oK3YNDo9ghBgqMWg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3380.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(376002)(39840400004)(396003)(366004)(66556008)(316002)(66446008)(55236004)(7416002)(55016002)(71200400001)(76116006)(54906003)(4326008)(83380400001)(2906002)(9686003)(66946007)(7696005)(110136005)(8936002)(86362001)(966005)(52536014)(478600001)(66476007)(64756008)(8676002)(26005)(186003)(5660300002)(6506007)(33656002)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: ZhBiR4MABgOziXMbltQCWz4s7KwokOEuA6PM2gFs4rOizQq75a1NpMzOf9pqMuCt469KOmkF4vZ7aIQJRrVdWWemf6dLJa5d7k8FK+jtQBthatvL8ukkUh1GKVY08MYxZx2P7ioh/kZ6OwiC7l3xWhS4bgxLZckPMMER4cs6wnt2w4ZkrDOc2rVanzANOTkzsdneSGsFQd2yJkCvCafQPUw7vrF+ItEIzFP/62vKzVdHgwuH0RoXAShufgfAEAxXH+SeMI2hWUwK+doofiDBB5EDdLhibc+40zDbfSdCOEHzIe7g1E8fCOBHNgvYerjEqGwnvswY2z2YDri/oJyD+OYbqsGMslbFChP65UCW16B5gvVkvXnAtNoafcQom8z5ySj5WYMErka7KgA8bS4PnZaeqFSwxVdCeh1cwZBvm3SppWnFIFLbiWOvJngkap1OSTmGaVh1nhkAsBQb//iuCnsCDYeOysOCH8pwJ21wIyKf7CO0HbUpSnQ7V85yHI4cq8LzKgb7rQOpUVu/v8ebBHiBh0S3qaEmPkQWOdcDQAXIw4JOIGq0Pil9wndaGWCldnIpRl3IUtw8RnNe7Q2tYh/RLUh08B8yl36FgGTO64fT022SshtmtveCAkGdak9uPt60k9aQpH+HtCp+ph8zPA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3380.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cb96266-5e6a-4252-29ca-08d863822ea6
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2020 07:43:25.1035 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zNXIL8j9uQ41f/8fiuQ8kNTHjxpdFBz36ggFpaFceIbgOWal+RGxJasAgzraxsWpKwTdrNLAGMQTEe4SpC9YSv1tO9y4ZP2jYDXa5RSOHNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2180
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Corey Minyard <minyard@acm.org>, Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Cyril Bur <cyrilbur@gmail.com>, Haiyue Wang <haiyue.wang@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Joel & Andrew,
	Those patches are more organize for ASPEED SOC LPC register layout.=20
	Does those patches have any feedback?
=09
Ryan

> -----Original Message-----
> From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
> Sent: Friday, September 11, 2020 4:21 PM
> To: Andrew Jeffery <andrew@aj.id.au>; Joel Stanley <joel@jms.id.au>
> Cc: Rob Herring <robh+dt@kernel.org>; Corey Minyard <minyard@acm.org>;
> Linus Walleij <linus.walleij@linaro.org>; Haiyue Wang
> <haiyue.wang@linux.intel.com>; Cyril Bur <cyrilbur@gmail.com>; Robert
> Lippert <rlippert@google.com>; Linux ARM
> <linux-arm-kernel@lists.infradead.org>; linux-aspeed
> <linux-aspeed@lists.ozlabs.org>; Linux Kernel Mailing List
> <linux-kernel@vger.kernel.org>; OpenBMC Maillist
> <openbmc@lists.ozlabs.org>; Ryan Chen <ryan_chen@aspeedtech.com>
> Subject: RE: [PATCH 0/4] Remove LPC register partitioning
>=20
> Hello,
>=20
> Thanks for your prompt feedback.
>=20
> > -----Original Message-----
> > From: Andrew Jeffery <andrew@aj.id.au>
> > Sent: Friday, September 11, 2020 12:46 PM
> > To: Joel Stanley <joel@jms.id.au>; ChiaWei Wang
> > <chiawei_wang@aspeedtech.com>
> > Subject: Re: [PATCH 0/4] Remove LPC register partitioning
> >
> >
> > On Fri, 11 Sep 2020, at 13:33, Joel Stanley wrote:
> > > Hello,
> > >
> > > On Fri, 11 Sep 2020 at 03:46, Chia-Wei, Wang
> > > <chiawei_wang@aspeedtech.com> wrote:
> > > >
> > > > The LPC controller has no concept of the BMC and the Host partition=
s.
> > > > The incorrect partitioning can impose unnecessary range
> > > > restrictions on register access through the syscon regmap interface=
.
> > > >
> > > > For instance, HICRB contains the I/O port address configuration of
> > > > KCS channel 1/2. However, the KCS#1/#2 drivers cannot access HICRB
> > > > as it is located at the other LPC partition.
> >
> > Thanks for addressing this, I've regretted that choice for a while now.
> >
> > The split was rooted in trying to support pinmux while not being
> > across every detail of the LPC controller, and so I made some poor deci=
sions.
> >
> > > >
> > > > In addition, to be backward compatible, the newly added HW control
> > > > bits could be added at any reserved bits over the LPC addressing sp=
ace.
> > > >
> > > > Thereby, this patch series aims to remove the LPC partitioning for
> > > > better driver development and maintenance.
> > >
> > > I support this cleanup. The only consideration is to be careful with
> > > breaking the driver/device-tree relationship. We either need to
> > > ensure the drivers remain compatible with  both device trees.
> > >
> > > Another solution is to get agreement from all parties that for the
> > > LPC device the device tree is always the one shipped with the
> > > kernel, so it is okay to make incompatible changes.
> If it is possible, I would prefer this solution to avoid adding additiona=
l if-logic
> for the compatibility support in the driver implementation.
> As the patch can be less change made to register offset definitions and l=
eave
> the core logic untouched.
> > >
> > > While we are doing a cleanup, Andrew suggested we remove the
> > > detailed description of LPC out of the device tree. We would have
> > > the one LPC node, and create a LPC driver that creates all of the
> > > sub devices (snoop, FW cycles, kcs, bt, vuart). Andrew, can  you
> > > elaborate on this plan?
> >
> > I dug up the conversation I had with Rob over a year ago about being
> > unhappy with what I'd cooked up.
> >
> > https://lore.kernel.org/linux-arm-kernel/CAL_JsqJ+sFDG8eKbV3gvmqVHx+ot
> > W
> > bki4dY213apzXgfhbXXEw@mail.gmail.com/
> >
> > But I think you covered most of the idea there: We have the LPC driver
> > create the subdevices and that moves the details out of the devicetree.
> > However, I haven't thought about it more than that, and I think there
> > are still problems with that idea. For instance, how we manage
> > configuration of those devices, and how to enable only the devices a
> > given platform actually cares about (i.e. the problems that devicetree =
solves
> for us).
> Another concern to make centralized LPC driver implementation more
> complicated is the relationship with eSPI driver.
> AST2500 binds the reset control of LPC and eSPI together. If eSPI is used=
 for the
> Host communication, the behavior in current "lpc-ctrl" should be skipped =
but
> not for KCS, BT, Snoop, etc.
> And this will be much easier to achieve by devicetree if LPC sub devices =
are
> individually described.
> >
> > It may be that the only way to do that is with platform code, and
> > that's not really a direction we should be going either.
> >
