Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E35759F040
	for <lists+openbmc@lfdr.de>; Wed, 24 Aug 2022 02:41:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MC6jD3Fqmz3bd5
	for <lists+openbmc@lfdr.de>; Wed, 24 Aug 2022 10:41:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=0WZpqwUh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=40.107.255.42; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=bonnie_lo@wiwynn.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=0WZpqwUh;
	dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2042.outbound.protection.outlook.com [40.107.255.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MC6hj5khPz3035;
	Wed, 24 Aug 2022 10:40:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F3HhlGOcX5qLBCciKnnlasPOiUr1jwCr18DFvcOrs5TzGCYQEN2Y4eBVrNksSSYRr9KeTUah8eI5IAD7Eloranr09ZXL0PS8x76Ys82VXxhpRjVBe+irbqvgzxsMQbgQliEQnuz1v6XRM9D6G+2ZPlIqRqcHIEBee1diVuL6+5Rz1gkQ5SgNMzdO8EwDZl6kXAbvr6IdfZLKkrt3mPWz1Jnrbisf/e2D6fWCA0HE7nlYqY2nuwAGRI2eUIQdDNHHY7F9ub2FsjpGVSyhELkSO4BcLIPxN0UBaxwh8po0QMNBZv3v60mJM/JiXGhtZDvQ2GWR/+Nb3pr4xAnS+ighIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FrPgOC5iILR8HfePoQYsiofgFo2vc7oXlvh1k69H3CA=;
 b=G9YSYy7+7saXRsUh140n89l9Fa49UszQdh7AOYRCMHtznJUoksSJ/CaFlwCpjEf/hrOMP5aGCjDu7VUgk31iiP9j0LqHTL6zCiYTwuarZ6bN1xGssqcOVtSBIeBAdbXoQYo4+ltbPkCcwBrdi1V1SezLIcHI61Mfmk9bP1oj023qwd4WVSAdP6nc1HEx+SAmRfL+wjPCiVlqCIL2G4+oQmAaK3+2+0GoubsS/zX5zeTk2LWXoWdVYgpqBzMAiYV6BIcgg7u9V2j5nIjtNi5rXqrA/1P0Oid8/TZ73QTeJUl3fhgNfw6Wz1xCc3zMd1X9MmJLA1X9asVCnTUSFwWJQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FrPgOC5iILR8HfePoQYsiofgFo2vc7oXlvh1k69H3CA=;
 b=0WZpqwUhHHyx1cwNi74PRfSpAoFpAHa5aiWPS6O9SbQ1fOb49kSbVoykw2aAcyq5MeA7vjXRl7FZEpsfAiC4kFDhJUZb+u1/wFLAKVL1Y9AIOZbDgsGcUFMwokqQXfZawmbmHDWhPRh1cI4E3Naa4PlbtuotJLgGIbZQAdD7+ovlFQ2BPsLxU+aAvEh7U/WFyh7Y4izVxuQpS7+KepgXdEu1yH5FObwIot+08ikqH6S8RR8C53MuOwvhJsj9L+ntK6OOBvQYbAXFVY1rtMjVJP5yNU1eavAGjYciBnikvpsBkp8nuy9iFRF2nM/9kjH0cgNs5WlXjX5k/9syzaO17g==
Received: from HK0PR04MB3105.apcprd04.prod.outlook.com (2603:1096:203:8e::20)
 by PUZPR04MB6464.apcprd04.prod.outlook.com (2603:1096:301:f8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 24 Aug
 2022 00:40:32 +0000
Received: from HK0PR04MB3105.apcprd04.prod.outlook.com
 ([fe80::d87:1955:b41f:4b13]) by HK0PR04MB3105.apcprd04.prod.outlook.com
 ([fe80::d87:1955:b41f:4b13%4]) with mapi id 15.20.5546.024; Wed, 24 Aug 2022
 00:40:32 +0000
From: Bonnie Lo/WYHQ/Wiwynn <Bonnie_Lo@wiwynn.com>
To: Guenter Roeck <linux@roeck-us.net>, Chin-Ting Kuo
	<chin-ting_kuo@aspeedtech.com>
Subject: RE: [PATCH] watchdog: aspeed_wdt: Reorder output signal register
 configuration
Thread-Topic: [PATCH] watchdog: aspeed_wdt: Reorder output signal register
 configuration
Thread-Index: AQHYs7D0uN4boim1rEaXFKnwiugQQq22GsqAgAcg3zA=
Date: Wed, 24 Aug 2022 00:40:32 +0000
Message-ID:  <HK0PR04MB310516FD4FE71B22690F4224F8739@HK0PR04MB3105.apcprd04.prod.outlook.com>
References: <20220819094905.1962513-1-chin-ting_kuo@aspeedtech.com>
 <20220819114449.GF3106213@roeck-us.net>
In-Reply-To: <20220819114449.GF3106213@roeck-us.net>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiwynn.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 24b995a1-80ea-4460-7ce5-08da85694094
x-ms-traffictypediagnostic: PUZPR04MB6464:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  TrX5uUOC5o7JmDN0/hhEj48zEQhOLP/vx6pdCi4G6esnQqZjYkqjGJ4prnoyqrDmPYiF267uQhYWuMaPCmDmwYwBPu06Rlssg6lB/XNM4MbgP2suKeS4RCqhu8BJmMu7UkF5OhAg4NKI1iHcTIuKHVKV6bb2NWrM5wF2MgOWBdrFD/g8B1MJ3lSLqyEXZD7oSsyP2rYoHo66Ust0M/RLi+HLTFyHzGZH/PWl7IdN8XK2EZrxE2yPlO8XQNloxvz3yJ/p9ht46d39OmUc54itLbkwrUkyTvXzbIWtmoXK8W9sqMGtz7HVcoGiCz6f5N5b2WfBwUN9NKJ6DYxN6GaPOzeJSUjGwtkJSvebcM0HRAouE15comdm8IOqHBT+wxuN3m0C4+J7HUqHFSjBQQY78ULtgq1LSfgjWPAZfH00O2X4SGgFCDqyqugVmFfURWaHCwdrmRh3T3Izn/5pYH7fsBAWIGBWq4/hfsUSlSbZZ2StQXw7jfQ19+UGiPMRRj/lJ/vRnTUd7673MAcnEI/uvNPEc1B1jnGPkxqQegwE4LuwkzJAV4+1RIrYj6lNyRGRge4rxaANBnJnxBGazltIadxY6ELAU9wTfMRF2rKFP+ffHnLUNKH9OXSpOHDaqexl0aYHcAuZgo9X7fsCoN0ptGH/XqSQ+yM0RpFIacW99+pEtSF3QIajfoQJaE6KUAuZRP2Y789sOOS2oIwT1swvKc0u1VH/XfSzjk17uKUWUZ13Ws6iBoyP76B/vqno6TS2jn/9oQe6utJ53mKqeQFZCw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR04MB3105.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(376002)(366004)(39860400002)(136003)(64756008)(66556008)(66476007)(66446008)(76116006)(66946007)(122000001)(110136005)(8676002)(4326008)(86362001)(38100700002)(33656002)(38070700005)(26005)(186003)(9686003)(83380400001)(53546011)(71200400001)(7696005)(6506007)(478600001)(41300700001)(5660300002)(316002)(54906003)(55016003)(7416002)(2906002)(52536014)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?Arv4Osxds0YZpYIdgFs4LHckhRheCd7qTSa1L5ws4MDxvpWnhWZy/TkYyj2A?=
 =?us-ascii?Q?e/QGkffT5M4sybINUWBRDgOXjKfAq2kFGvsW91RnVv9TwVvviYbS1jjDbdxn?=
 =?us-ascii?Q?YeKbGnvSitaHsF+tTeMYFsgU1IFB1tHOcOvuvaqiu4xU4LtTydKWonuc+qLK?=
 =?us-ascii?Q?ORmTf4xV4I7fQ4XLnckxTmboXkki4rdL91y/igXttA8XgG0IUJ9agd1wtSp9?=
 =?us-ascii?Q?3LzGK98Ga/yuTMlzdmtoHpYEEdF8SSN0Lzsv4LlMcKHUT69erGb+I7A+arwX?=
 =?us-ascii?Q?arbnspxoH5W8KZgWzMG2UB6kycUeY5Vzq0lzcXhSF+bYusEHTzZIys/rAKNG?=
 =?us-ascii?Q?5waxEn6vgFUKIdnfR9EGjK0S0tKWYfVt09BlIxvOrWVyc/dwjaWS5Txisnqt?=
 =?us-ascii?Q?cI+nzatD168J8mp4JLyRtqaTYi9WW6BPk8m2Jevu3/boTkvOIyijJQn+eKyy?=
 =?us-ascii?Q?Jq3O+MxpGfZzlCBeS722TjJXlMDisbEp17ysKNhIavb5uynUMDABEc/VLwzB?=
 =?us-ascii?Q?C9kcQcrik4Q4l8aJZbqn5t9Sv6bS65vYK5giCkAdq6egfucJatd3gWN5fHrN?=
 =?us-ascii?Q?9IbsiOIXu6kNohj9OXOvoViQTZTHKhh0zWvhhPWibYbcl4o9baPRafh5j4O7?=
 =?us-ascii?Q?zaBAF8z75R1U6erVudonnrKEKl/QSCiK1DTX8AikcN6stJrSXKZJzo38kMDT?=
 =?us-ascii?Q?Hpx+Xd+xA1Fj9+HSle0szU+VPz/InX7mFgEd4G5RS/pS6C+HJ5QgjEjtOcgy?=
 =?us-ascii?Q?WFrst7WdAhOOKAprgPFqZX1+9rd5LYPBJIpBp8CNNVs3vjhkP1xhnoA3ql8j?=
 =?us-ascii?Q?GJFNPrWvVlRdTZVe+1RhAbSSXl4aIj9tVvgM/YhpOoZp5ZdHZ+r3AyNH1zLu?=
 =?us-ascii?Q?21OBtcBiZUMNwzMhapk5nmBu3LrUrxTKGQI97KssQ0ySD+iVmApTIR5xSb93?=
 =?us-ascii?Q?6HtE2EFL1p6xpvgwH7OzGSzPhfz/3dZtvnS+2tUNacAAUPteUYN4zMJ7/9er?=
 =?us-ascii?Q?Vyco+xt8lUo9nfZt6m4GqEqgVxJ7SsXBDkA/3b0DWREXjpAMK2XzNSX52B4b?=
 =?us-ascii?Q?nv7v8gIAgHRZBX/Ubzu+lBpCybE9ZSN1ATH51CjPkxXuVvdXg7o6E/xi2jzB?=
 =?us-ascii?Q?QquM7OOifDeBpY7+AFuVtfYI8+HtoWY7SANvIWV2+jWYM20+ciyYq7nNtSCf?=
 =?us-ascii?Q?0jk7o/8Ls23XSxAB2448cqEKnahN2Lx8IFbcGoh6ms+0O3D19WDssRSQ1OvS?=
 =?us-ascii?Q?m+GSR5E1076lmlTgFvivqYoaN/Wd/AX2avYwPD652KvkAlY+eBicaR4C5qwN?=
 =?us-ascii?Q?/j1fExhO4BgAa+WnFgjPtIAwvdrMzsPSksJyK/pxYc1JNkzcH9V/MdZ/iSlE?=
 =?us-ascii?Q?TIsnCnvmBPHPZmGFIXhLq0QjRBVSn6Tx2xnyPUAR2/70M0qRX3dhfQDd/ys1?=
 =?us-ascii?Q?X2s1Cu4F3b0SoAQXQFzNihxkw0Rtoga/hZ0NSJNsAtUq119owQ3ysItxL4vN?=
 =?us-ascii?Q?Bwz7VN/y4HLN3u11EY6L8RsWtglOxFyzJU+7ZYnHlInOtgD4pv2HlYubR0gS?=
 =?us-ascii?Q?CwneqaezpFJid4zFoO5XvvQvLAN4KKHW0OZSGS6i?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3105.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24b995a1-80ea-4460-7ce5-08da85694094
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2022 00:40:32.7723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: toiqR3hFecHK0I020c9RC62Y8uee858TGxUTKkX3Wy7gBA7bVp8M8pLUpCSX17PCRXHFBBBHWk12PCId67E7rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6464
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
Cc: "BMC-SW@aspeedtech.com" <BMC-SW@aspeedtech.com>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "andrew@aj.id.au" <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "wim@linux-watchdog.org" <wim@linux-watchdog.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Friday, August 19, 2022 7:45 PM
> To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> Cc: wim@linux-watchdog.org; joel@jms.id.au; andrew@aj.id.au;
> BMC-SW@aspeedtech.com; linux-watchdog@vger.kernel.org;
> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org;
> openbmc@lists.ozlabs.org; Bonnie Lo/WYHQ/Wiwynn
> <Bonnie_Lo@wiwynn.com>
> Subject: Re: [PATCH] watchdog: aspeed_wdt: Reorder output signal register
> configuration
>
>   Security Reminder: Please be aware that this email was sent by an
> external sender.
>
> On Fri, Aug 19, 2022 at 05:49:05PM +0800, Chin-Ting Kuo wrote:
> > If the output driving type is push-pull mode, the output polarity
> > should be selected in advance. Otherwise, an unexpected value will be
> > output at the moment of changing to push-pull mode.
> > Thus, output polarity, WDT18[31], must be configured before changing
> > driving type, WDT18[30].
> >
> > Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>

Tested-by: Bonnie Lo <Bonnie_Lo@wiwynn.com>

> > ---
> >  drivers/watchdog/aspeed_wdt.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/watchdog/aspeed_wdt.c
> > b/drivers/watchdog/aspeed_wdt.c index 436571b6fc79..a03e4ff812a2
> > 100644
> > --- a/drivers/watchdog/aspeed_wdt.c
> > +++ b/drivers/watchdog/aspeed_wdt.c
> > @@ -325,18 +325,18 @@ static int aspeed_wdt_probe(struct
> platform_device *pdev)
> >               u32 reg =3D readl(wdt->base + WDT_RESET_WIDTH);
> >
> >               reg &=3D config->ext_pulse_width_mask;
> > -             if (of_property_read_bool(np, "aspeed,ext-push-pull"))
> > -                     reg |=3D WDT_PUSH_PULL_MAGIC;
> > +             if (of_property_read_bool(np, "aspeed,ext-active-high"))
> > +                     reg |=3D WDT_ACTIVE_HIGH_MAGIC;
> >               else
> > -                     reg |=3D WDT_OPEN_DRAIN_MAGIC;
> > +                     reg |=3D WDT_ACTIVE_LOW_MAGIC;
> >
> >               writel(reg, wdt->base + WDT_RESET_WIDTH);
> >
> >               reg &=3D config->ext_pulse_width_mask;
> > -             if (of_property_read_bool(np, "aspeed,ext-active-high"))
> > -                     reg |=3D WDT_ACTIVE_HIGH_MAGIC;
> > +             if (of_property_read_bool(np, "aspeed,ext-push-pull"))
> > +                     reg |=3D WDT_PUSH_PULL_MAGIC;
> >               else
> > -                     reg |=3D WDT_ACTIVE_LOW_MAGIC;
> > +                     reg |=3D WDT_OPEN_DRAIN_MAGIC;
> >
> >               writel(reg, wdt->base + WDT_RESET_WIDTH);
> >       }
> > --
> > 2.25.1
> >
WIWYNN PROPRIETARY This email (and any attachments) contains proprietary or=
 confidential information and is for the sole use of its intended recipient=
. Any unauthorized review, use, copying or distribution of this email or th=
e content of this email is strictly prohibited. If you are not the intended=
 recipient, please notify the sender and delete this email immediately.
