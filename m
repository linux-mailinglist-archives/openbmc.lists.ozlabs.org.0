Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 609EE523F83
	for <lists+openbmc@lfdr.de>; Wed, 11 May 2022 23:39:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kz7bY1LrWz3c8V
	for <lists+openbmc@lfdr.de>; Thu, 12 May 2022 07:39:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=Lg8vYYiu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=81303c0b54=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256
 header.s=pps202002 header.b=Lg8vYYiu; 
 dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kz7b20vb8z2y7V
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 07:39:04 +1000 (AEST)
Received: from pps.filterd (m0105197.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24BKoHrV008960;
 Wed, 11 May 2022 21:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=n67RKd6QiK/kOP0J7jcdUz+ZeCrxhNNjxXYC/hbzaG4=;
 b=Lg8vYYiuPl6hfAPmFAqoheM4FBKb6xqDYRYCrEE6gnisiM/HUA0+UjTvrLjzBrVljWcQ
 szBGN5/CnybsWqOHi/WhBpT2pTfIDcQ/Bt0Ku/aYWcqFjhhVqVBRxuns9P0SvUZHg9Wm
 VyKhVRIjx4BmikaV9Lomrf7Tg68FqDeZ8/5ETgPkp/liW4gzamUNCBSHZNAIDPtFVUPG
 CCka6LY2LxkqMsHcWmcfscwY+tQ5LE4DL7DquUfcs5yrToYu57KuRuyAWmAbjvh6FiED
 4gD+9+6hHrfmxQ3gdxhv5UweungFt5b5knLX6JJ/4XcFX1YcdxFE+jcuaTEjv01ZQaXj 0w== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
 by mx0a-00268f01.pphosted.com (PPS) with ESMTPS id 3g0j1sgr6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 21:38:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dD44lE2w/KAoJdxlHIRiiAcWnBBXH+ZSdM2w91ePzjcn9s+2JUFfLWV8BaNODXuVPF7zIJCfw7bB/ZH8cQRdLVi2nR63VPHQoXRiCGkFyX/I2iQs5aLCFmAbM/JumIrXSQLeprOmTi4o0ojaYVLgCzAWqpZG9kMl4bCN+kw6yCVhUGdB6v99PpZhgwIEl9bBJhfidj8en+BVMxwmHS1/xWEGIEvyJF+HaE6Q9cezmpO+Sorw0vjwPLT1u5PxyU8P4TGZCvzP1yfxKt/+nSM3I/F3TBtz7jv4/iACmQ6QloN2BXwe+KSZgUyUJSDgF9Gxyqde3BkUfJZVNRYI3kikdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n67RKd6QiK/kOP0J7jcdUz+ZeCrxhNNjxXYC/hbzaG4=;
 b=jJhNqpVmYJ7aPNjwi5B1r3folEV6pJU6tA9+kl/lnlJ1qcBuYdI4hD2/jgFmz9Z2tPT8qckwv63KA8UZgyegxukD+mf8lAApgWPGLahgBDK3b1t8/MKlUn2s90xg9sMNsoWS98wDTVqI4MqCbq1jU1KblNwSJsYCdvBBAMfhuGdomCWNrNbpc31avJaung83z8TJrdRo6+CH36ZHOSp3d5/hkj/c5qDy22cAGI7AnHr4GiSz2SBJinMJxNwIBAmb73en9LyPUrdDpmro8uRKGouVUX+bvR5BXgGNmM02wntkv/kfQRZ451eA++hQLCKZcfFhyTQpd2BuPo3CKb8eBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by MN2PR04MB5629.namprd04.prod.outlook.com (2603:10b6:208:a6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Wed, 11 May
 2022 21:38:49 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::1555:f4bf:69b7:787e]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::1555:f4bf:69b7:787e%3]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 21:38:48 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] ARM: dts: aspeed: add
 Delta AHE-50DC BMC
Thread-Topic: [PATCH u-boot v2019.04-aspeed-openbmc] ARM: dts: aspeed: add
 Delta AHE-50DC BMC
Thread-Index: AQHYZX9/WVVAIbUDaUW3XfdmmeEABw==
Date: Wed, 11 May 2022 21:38:48 +0000
Message-ID: <20220511213848.GF11809@packtop>
References: <20220414210045.26480-1-zev@bewilderbeest.net>
 <YnsviIh2dFoogpIE@hatter.bewilderbeest.net>
 <CACPK8Xdg9doTkKowWj7yS30Wqh=kstK5YbY1+QxRPw_6A0pR9A@mail.gmail.com>
In-Reply-To: <CACPK8Xdg9doTkKowWj7yS30Wqh=kstK5YbY1+QxRPw_6A0pR9A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1c787ed-24d6-4efc-ec0b-08da3396a240
x-ms-traffictypediagnostic: MN2PR04MB5629:EE_
x-microsoft-antispam-prvs: <MN2PR04MB5629B6AC0380D9882EBE695BC3C89@MN2PR04MB5629.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zA2HYsJ/CzgQXO6Y1d4BvVhz5TJH59PnFnVbxgYZwgM66r2Y6fKoRJ2q/rdS/VdJPrD/yIs5+adbMwWWjRzVMtOAOHK1o9KtIMSJTgFTlXquGCuszDdIJXRWHiQl/SplKocJBCXsviRrYSYczZdWXinBMvcFfI6cCH6gtoeE/cHX9xAte/AUCaIYC7q7AAwju6JkLK2HNM54MwQ9VbaA05OT/j0T1QbkwTNn7QQzJUfMgzCGCqvA7JWb//3SFBC4on0dfEHqr71aX8e7QEu8stCgQZC0yMg0g9BMqUOdcfCS6AqhaLYFpdRIAuTAa4wxefs50yhgXhQ/AMJ3sIdWhAawxW6gLuMzAQCe2heJuN8DId+NbAO8HStmE0icFZDrbZO4+q3PuUE6mWkdE5LuVxjzQ2aNypJXOJJkY2oyc8VoxBU6eDMhAmRMLaM4R4L0zq1E4j8xBRHh8BLTblOZzo6hcsKsrXOj5pM7z51ve1UuW8M0mUhWoWhVm7baZ04TsLUkPdct8//5PDp1FVL9osczOnPhIEbCi7BWGrQuKoUbLYLSzhH9V9bRV9rJ8xwhefdsPvBKgYyjcsKAQS6XuzikZ6TDbIeo5cDeM+0I85VJL3uPTT00+eY6bz8e3+2z1Bl5bMX0RrKSPk6CvA/rvYoLhsN7PlR/3uU4leKeUcCFMcwYzzTlI9If6DoX0PJc2LhD9Rk7o75lNRXRSBG54g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(4636009)(366004)(508600001)(38100700002)(33716001)(122000001)(38070700005)(9686003)(6512007)(26005)(6916009)(66446008)(4326008)(64756008)(8676002)(316002)(1076003)(186003)(66556008)(76116006)(91956017)(66946007)(66476007)(54906003)(2906002)(71200400001)(86362001)(6506007)(5660300002)(8936002)(33656002)(6486002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UJEzdrSqhAPK5peFGNZxHnPXuSuTKPD6tJXBJdt+H668VqrYUS1KZAERl/4D?=
 =?us-ascii?Q?W5s2pkqkgJaNH8AgjFfarZ3o12HIk15DfJtm1shhSryJMhFd6AxY2f+TGRnm?=
 =?us-ascii?Q?jLU1YmWK6DqGniXwMV88nMQAImPh9c62t5qdG8g5kdoqctGnG3povUdNM70a?=
 =?us-ascii?Q?/CbSvdc0YwiMyEVA4pOGCPku4JnE6+F534aSsfiENOV4bH4gBUayxVeijl0+?=
 =?us-ascii?Q?gkSDoOcXuaF2p9zPviH/Jeg6obyFyDXEz68xUYZlkthlMMyYWUgSz3qJ62PE?=
 =?us-ascii?Q?fqLQh4De3kvo1wzOB9XoeOzwYJ0tqbLJAAeRF27CX+h8JUH786ys5Oe2GvVB?=
 =?us-ascii?Q?9J/ZgSOkZTFsEux96N1DsocyvMjClgMgQe7t5DPthBBkVim2hplcXfdfUDMv?=
 =?us-ascii?Q?ZYBtmkIfDRqNnrUPqSeIBHqZGBn9540AHbsG6ajC3dtiq8sON3L2xeiYvAuR?=
 =?us-ascii?Q?mU3j7ayVK1k6rHWNS/VPYhKJCfXQPZ0QhhDs+0Q8iIhqE6H6w4XDEyjVv0CW?=
 =?us-ascii?Q?ib4oA/MEOtWgppe1htgUWdQAmAMfXy5R1wvyR3MWKV2G1BRh85wQL1Q9NdeW?=
 =?us-ascii?Q?Q67N5En2RM6xvqE6cJ8f+OirDBMOt3B+49CuOyiQeVJXlSYQqLvNiYXdc7gQ?=
 =?us-ascii?Q?OqAUBeP10zvztSUstbgf+N1linOKtycAiQbbI4FiPsxJ+K0g6V5R8V7FUHlO?=
 =?us-ascii?Q?020PqxwTWCW322Y3sleu417CeAHpT2sFAfeNYl9rvaiZowFDkwL+dJh5leev?=
 =?us-ascii?Q?5yfsgult1N9m5bIt3BndIvHRgHY8Mp/GbdAFYs65csoa0mFOzAO0H4m6C/hd?=
 =?us-ascii?Q?fwIShp+XE6oGa8ThLiG7osWDQ2wkajGFBL8NenEv+59tfRE1OTnZOEiDL9+X?=
 =?us-ascii?Q?6LM+27NWYC+jtmFaAAQ/CzvJyW/a9DlAMgfgtyVd7SGuU1BvNWQo+NK9pauR?=
 =?us-ascii?Q?UbT0IJxqFCXrCqPF1IT7/uH+9SxDyeZOITGyWuQ7znL4syjw/TaVTrrgn1lj?=
 =?us-ascii?Q?fGiSXybl0cbzJ6gZqUJY2uwKMT3br9svFNwzSde3KfvKg3TGbhzxLN5t6+V4?=
 =?us-ascii?Q?9bky5Pbz6Z6TkI+X+xEAZkkc5S5gnUCZsSXS5+ShNBCwLIRB1gcu/YuA/5dI?=
 =?us-ascii?Q?BLCs7EhoEnXvgYHmA3NDhmJfg3g1Cpn8OLM4MeLX/3KqTTI/9u/cXj+KvoZP?=
 =?us-ascii?Q?PyUG/SiSMJzMN9plNAkZ88wy7oRWT5wdSUVPrp1lokSO60sUoEPzYNicijJN?=
 =?us-ascii?Q?FiuNR8mJsAY0ABOir5qgUqc5U5IdbB2yrJrML20SaM5lan3lX0ODZAPrL0s4?=
 =?us-ascii?Q?vKoAdwzxFuRZXvTY0jIWkTviniogi7o84C8jfPg/8Q2Ew2aQDQOuDiMD2OgK?=
 =?us-ascii?Q?exEiZLze5NEtFNgGt4rDNVu+ZelKP2iigq25jg+tlqTXJ3LM9CuKm863WScB?=
 =?us-ascii?Q?xf1HH5r80aEYU5cArfghqW9Ym6nvNRXpj5/EjU8ltzMslPrlcXM5bLYPcHsk?=
 =?us-ascii?Q?yrzZY5ICWpKmtA4kNxdNJ63213wRrMF+CoGhY8OMzfAf/HfC38uUCtOr27fM?=
 =?us-ascii?Q?vU6J1ilDLD4NFSlKwgRn1fVKBXQQwT4QXMzSDBIbsF2sRJhx7WuKOQj6YgE6?=
 =?us-ascii?Q?DtktkjRPBi07hjUOMBqpDPrP0lrWvx6rkr+HTXBtIQz5xPFcMDBQB1mYwgNy?=
 =?us-ascii?Q?unrlGj6XTPR4f4EubsS/x+fzTEQytJPrC6qtgSu1VV1HTO9rZQskUDMXxStd?=
 =?us-ascii?Q?50uAUoI+9w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6B5C48B7B117404F99C001459E7253BB@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1c787ed-24d6-4efc-ec0b-08da3396a240
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2022 21:38:48.6308 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kEjzy6YZMrUMOrwS7UmrPb9AiyrbwCltKyFe4CQ36dU9HLPncEmeGgBVMLxkTtDsKc5xGADOW7jhJ8lndp+7FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5629
X-Proofpoint-ORIG-GUID: ajzb1q1WTsDPkRcQgIUdAdhj9OkKI3NB
X-Proofpoint-GUID: ajzb1q1WTsDPkRcQgIUdAdhj9OkKI3NB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_07,2022-05-11_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205110095
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Zev Weiss <zev@bewilderbeest.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, May 10, 2022 at 11:04:01PM PDT, Joel Stanley wrote:
>On Wed, 11 May 2022 at 03:37, Zev Weiss <zev@bewilderbeest.net> wrote:
>>
>> On Thu, Apr 14, 2022 at 02:00:45PM PDT, Zev Weiss wrote:
>> > The Delta AHE-50DC Open19 power shelf uses a pair of AST1250 BMCs that
>> > are mostly compatible with the existing ast2400-evb device tree, with
>> > a couple small tweaks for the serial console UART and ethernet MACs.
>> >
>> > Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>> > ---
>> >  arch/arm/dts/Makefile             |  1 +
>> >  arch/arm/dts/ast2400-ahe-50dc.dts | 34 ++++++++++++++++++++++++++++++=
+
>> >  2 files changed, 35 insertions(+)
>> >  create mode 100644 arch/arm/dts/ast2400-ahe-50dc.dts
>> >
>>
>> Ping...does this look like a reasonable approach for a board that's
>> mostly-but-not-entirely EVB-compatible?
>
>That looks okay. Are you sure you have everything that the evb enables
>on your board? Dual flashes on both flash controllers, etc?
>

Ah, good point -- while it does have dual flashes on the fmc, I should
probably disable spi1.

>I wonder if it would be better to put more into ast2400-u-boot.dtsi
>and use that?
>
>But I don't have strong opinions either way. Your device tree looks
>fine, and I am happy to merge it.
>

Hmm, hadn't considered that possibility...I'm likewise not strongly
opinionated, but I guess the current approach of extending the evb dts
seems slightly simpler?

Thanks for the review -- I'll send a v2 with spi1 disabled soon.


Zev
