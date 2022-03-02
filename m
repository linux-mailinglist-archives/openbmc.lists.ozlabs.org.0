Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC2E4C9EB1
	for <lists+openbmc@lfdr.de>; Wed,  2 Mar 2022 08:55:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7mcQ0KP1z3bP4
	for <lists+openbmc@lfdr.de>; Wed,  2 Mar 2022 18:55:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tcs.com header.i=@tcs.com header.a=rsa-sha256 header.s=default2048 header.b=K9iVJLau;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=tcs.com
 (client-ip=121.242.48.116; helo=inblrg02.tcs.com;
 envelope-from=prvs=05315de73=sandeep.pkumar@tcs.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=tcs.com header.i=@tcs.com header.a=rsa-sha256
 header.s=default2048 header.b=K9iVJLau; 
 dkim-atps=neutral
Received: from inblrg02.tcs.com (inblrg02.tcs.com [121.242.48.116])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7mbz1knDz2xDv
 for <openbmc@lists.ozlabs.org>; Wed,  2 Mar 2022 18:54:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tcs.com; i=@tcs.com; q=dns/txt; s=default2048;
 t=1646207681; x=1677743681;
 h=from:to:subject:date:message-id:mime-version;
 bh=ckwMFO5IsDZslmPvcFKzGecRZXDIAWfqOZv6Sn17J3k=;
 b=K9iVJLau186vzoW2LS1GFGdwtV5HnzZWv62CUHIuypGOXgBzaRAzDmnY
 Ox51mWrwzyQ/YeiLKbqQNPGyRuslSah3ZFtl+d/5PrhF54MZnbKBKUBw/
 Z+x81S4UiW7WVT3I8QuTBZREZp4/noeaQ1vNmkkd6voq1ewZPLgyCLJf9
 O/P7viHa4+anhWueZpSSdaa3C30KTZlTO7n/hUyIDgiStBLHQz3S6QPiE
 7nGMZCvdPPnFoH7SdWQIEMqZu3zNcG9qROJeQgGSkT2fijE1vv2bdAe7m
 WqLFtoYqp1ic6CQGdMby+v71Je2hFqRfrFAqZPX+ReuFEPhDG4wfeX6cn w==;
IronPort-SDR: lmbZvX+qYAlzf8J3C7Q6Zd40x6E7ktlfraltDumVAGNxhmW7GLsLIZhMfukqM3m1nvPXVpXVzZ
 HSWL4kEXyorw==
IronPort-Data: =?us-ascii?q?A9a23=3A3S7PVa0LMIm30HiPmfbD5eRzkn2cJEfYwER7X?=
 =?us-ascii?q?KvMYLTBsI5bp2YCzGQWCDzVPv3eMDTzKIx3YIzno0MOusDSyIVhHAdprXthQ?=
 =?us-ascii?q?3sXo5ufDIzBIxerNn7CIpGfHEs6v5pDY4ebdJE5HyTWzvuP3hgNjpXeOZllz?=
 =?us-ascii?q?NMQMcacUsxKbVIiGHdJZS5LwbZj2NYy24ThWmthhPupyyHhEA79s9JLGj9Mg?=
 =?us-ascii?q?06zgEsHUMXa4Fv0jHRnDRx4lAO2e00uMX4qDfrZw00U4GVjNrXSq+7rlNlV9?=
 =?us-ascii?q?45ClvsnIovNfr3TKiXmTlNOVDVihEa6W4D66vRDjgce+ZoXEMI5VW4J49mLt?=
 =?us-ascii?q?4kukpMU6trpEUFwZ/OkdOc1CnG0FwllNKtK9bLfZ2C8rMma1WXaeGCqyPJrZ?=
 =?us-ascii?q?K0zFdZFp7ssUDsXnRAfAHVXBvyZvMqx2L+9QOxnrsAiN9XweoQNvnhq1nfeF?=
 =?us-ascii?q?/lOfHxpa80m/vcBg212358IRK6YPpNHAQeDpS/oO3VnUmr7wrpv9AtwukTCT?=
 =?us-ascii?q?g=3D=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AntK5qKMsSCZ0jcBcT3v155DYdb4zR+YMi2?=
 =?us-ascii?q?TDiHoRdfUFSKKlfp6V88jzjSWE9Qr4WBkb6Le90dq7MA/hHP9OkMQs1NKZPD?=
 =?us-ascii?q?UO11HYV72KgbGSpgEIeBeOutK1t50QCZSWYeeYZTMR4KqKg3jbLz9K+qjgzE?=
 =?us-ascii?q?ncv5an854bd3ASV0gP1XYcNi+rVmlNACVWD5swE5SRouBdoSC7RHgRZsOnQl?=
 =?us-ascii?q?EYQunqvbTw5d3bSC9DIyRixBiFjDuu5rK/OQOfxA0iXzRGxqpn2XTZkjb++r?=
 =?us-ascii?q?6ov5iAu1HhPi7ontVrcenau5h+7f+3+4oow/LX+0OVjbFaKv2/VfYO0aWSAR?=
 =?us-ascii?q?gR4Z7xSlwbTrtOAjvqDx+ISF3Wqk/dOPJE0Q679bde6kGT+PARDQhKevZplM?=
 =?us-ascii?q?ZXdADU5FEnu8w52KVX33iBv54SFh/Ymj/hjuK4Hy2Cu3DE10bKq9RjxkC3kL?=
 =?us-ascii?q?FuHYN5vMga5gdYAZ0AFCX15MQuF/RvFtjV4LJTfUmBZ37Us2FzyJj0N05DVC?=
 =?us-ascii?q?uuUwwHoIiYwjJWlHd2ww8Rw9EehG4J8NY4R4Nf7+rJP6x0nPVFT9MQb6h6GO?=
 =?us-ascii?q?AdKPHHQVDlUFbJKiafMF7nHKYINzbErIP2+qw84KWwdJkB3PIJ6eP8uZNjxB?=
 =?us-ascii?q?oPkm7VeL6zNcdwg2DwqU2GLEbQ9v0=3D?=
X-IronPort-AV: E=Sophos;i="5.88,393,1635186600"; d="scan'208,217";a="35553921"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QDrVz9eh1n5q6u5pkOaxqNu3P2pkS3HNBzq0+8YyBqStev/jD7balPgYgIE6SW0SD/lHqB0f/PAILACSknJSMILdbOtR3U3lbssoDRjorMkePZCcP/V30gQYSaxvYulcIp3sc1VbJKHyeuKBFL01w+PuvSu2JoQJLxH3kTFlD3nJfaV69cMVwVJ3J/P6R1jUZzyC/68tWPfGYqlPpHmQJvywDxUkDShirMbQGcILYZIJpaC7sSbLBWc/EwYQOwpNql99Zx3usuw3DNAXiG5fHPLdr55/C4l+75PoT9FlbtGvsUvB0iqZl9tLCfX64Oxd3/Lay5OTJY5c4YZjAUuDeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=200I0G8RQO4b2UhRiLcjTjKu7uucPlrVvXj/kJ3yTAg=;
 b=hBfGFNXdeEtz8QpDzRsdxM04S1How1vl8ZVccyRf4d0a5ilnZM8P8ftzHH+TF2B9e5UHCDR0AOMdnopgY2JMo0MaJ2dAvuMoYbNZU0Lf9sp2fY+beecDmeLrP6IVc1wfuU+CWBPp5NAJgfrU9Tw4qmfW/6R+gC3O2rPLzitvRuRdlTAX6XZpl+/tqu3QgzmHbKXCfoktfwzx4G6B4Ko2a0kWBPhQmgMQD8mH1/qddvWrFyZ0TbWGAQBI7xdA2j0TUQOfCf15/k3IKg8aWCYMi26SS5qraIpKx0BCFw01lpK5qIoM8qJca66w4o/7NvgWbRz74nvWA9qFcy4NDMtXlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tcs.com; dmarc=pass action=none header.from=tcs.com; dkim=pass
 header.d=tcs.com; arc=none
From: Sandeep Kumar <sandeep.pkumar@tcs.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Issue#3500 : Redfish configuration backup and restore function
Thread-Topic: Issue#3500 : Redfish configuration backup and restore function
Thread-Index: AdguCfmGsHPCTHTLRNeYqkPLHXZNgg==
Date: Wed, 2 Mar 2022 07:54:30 +0000
Message-ID: <MA1PR01MB4129D8A087F671A505589AB487039@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=tcs.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e675d082-e239-4191-b848-08d9fc21e1e6
x-ms-traffictypediagnostic: PN3PR01MB7838:EE_
x-microsoft-antispam-prvs: <PN3PR01MB7838B4CB3EE7800A605CD93C87039@PN3PR01MB7838.INDPRD01.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R2tPWWGeEy4jZKaQDBB/Y1mXZLSiQUgwlLNxVG6DRiJRNU4ZbNQozhIQCgD+uCMW9V2r5Vaey5wHETvBTWyLaWPR9BWtySe2F9KAbLFnf/KSTcBtJFkp00oXvKKfcnuNt9iVLP848+NUd0xKhR7eVOo2HEJYFugoQcKB+LLxj5olPRI4aXSLZVVzNNDy0fPY3uWLxq6w6v/2C9HFyGGLec8VeKHqmIicYhqbcJTSrjzEh/m9QaRHcms8fCf43/f7bmfZw4NWoJmEUFKZv+XDN6Bl96E87RD2iWBzxvMrspj7y61IQ0Tkb/wt0a4SRyOAsX22avGupIX4f59NkcsE9k0aYp86+4iVHKpUJxkn/Ksu8FTikeaSgGYLIAD0+gTm4ei4Ig0OUgdqBCJv874nCneP2gyZorS7DGIwbhX4mD8k9W6abOP6bIr9E/yIiZZTEXYhLXqTWUsfjsv8GhqLg9vvx5Np29w7BUnZjLM2J/3hRo/8FajwrmX1bchCe7m1fKtagEliwf/GP9TicOj5L3aG4K+22toL1sKIbvu0H5+8L4ics7cvnw5ru9MBjKS9vv7CzAArFa06ZBb2Gs5SAJiCFRugsJsypjix2+zzGN/hv7KdnTvv6RE/s8PvRxG6ciTSZWjPklXNCBAr1CebmQTPECoXF/7Shzn2WmbUEchQv+q3X38C1noEWmt3VgP/j4AWM2HMerQ0oQSH827OFw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(76116006)(316002)(6916009)(71200400001)(38070700005)(66946007)(6506007)(7696005)(33656002)(9686003)(55236004)(66476007)(5660300002)(558084003)(52536014)(64756008)(8936002)(9326002)(2906002)(8676002)(66446008)(66556008)(86362001)(122000001)(26005)(186003)(38100700002)(82960400001)(55016003)(508600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zvmJDNstAF4ICqBB3fJZj96RzqBWkHmINJqwQKd8t6id0eiUKJowjbEgvXC0?=
 =?us-ascii?Q?uAoigl1ONBDnIUMVuUaiLsDWzKyVjYtc21KOUnNiiDc7rpK6VoYBloJJPUa6?=
 =?us-ascii?Q?n1SjhCNYa6wqAT0xi8FstSL8J4Oes9uwYyJ5niyCk+r8YnKfQ9Jq25FywEzn?=
 =?us-ascii?Q?qAcoBfI/0RCWYusf6jDjZ1CH9186NTe7cfdIHIky6N14z2jsYdJpxTkPnqsW?=
 =?us-ascii?Q?2Iz9qILz1OL2syJz2eCuryVD71hnF2ZW/E+CoTDpUa1G2MGSDwpUA7Scg0VN?=
 =?us-ascii?Q?VXGLS3hYcm0pgWXReWZKBer+bYtmwIdTRaBggWi5ID1fH9NbJQHImBfRQ4mI?=
 =?us-ascii?Q?jWxfTECm4s7BR+KQdhZO5EwzXHMdluLHHCM45zUwjBPZXl/ABCZ6IWAL8OBP?=
 =?us-ascii?Q?5ZnocYkXly3FFnahwY6QL3FL0xhyEKc9cqJg6EnBJnWb4zPQMOVVungdvwzw?=
 =?us-ascii?Q?3EgVABYvx9NXPpRdLS0dkhxj09mMebjfcf4y26+jS3dTEWQrNvr92jdD4gQU?=
 =?us-ascii?Q?T64pQPDjH6+oKC7IfFS7Phm6KtEQmmS30BfV3rcD/dJJcfryxDq6/xi0nlRE?=
 =?us-ascii?Q?NSSchqr9EkkVJGqnb6LKj2Aa97M/GUhwXcuDcVGj3BS/qTMaVIuMU3xPlhGs?=
 =?us-ascii?Q?HOYbACIHJTfJdEaXmaPpYXL2jDg9TeuK+QP5oI2L6ywznXg41OWMFsZ43VM7?=
 =?us-ascii?Q?AmxMueTjsGq6WWbHcUh+NCCiq1fT8DNATi9GFdrEJFFzh+ejA29qp0OCOsRw?=
 =?us-ascii?Q?iarIFnG1vko2CT2TyuCJH/mGvaB7RLDRJr6/+YT6QYDfbs9MDlOdq8Ph5NMA?=
 =?us-ascii?Q?Nk6o+15u3WZ3s4iw9DxAKKOSq4oBOvMG/pNoChRhteDlb795UIPSX863YeA7?=
 =?us-ascii?Q?w4XorV9moAeQsDDr/+fBcG48iLHqbbOVyPsQp8GtGjzkXWccXpURzWhAV6in?=
 =?us-ascii?Q?r/th5vqk9onZ+P/vpB3IOBw8lUXwLo4uQVb9m3IUxzQ1+I0sEoN0BsvqBEKC?=
 =?us-ascii?Q?q2dViJLqEfTVstM0huw5rTJwPaZnIVr1CHlnsPhtYg20iHa8yheUJ1VITGEi?=
 =?us-ascii?Q?Fb63zs9TU6Ifrw8O7xZr1IA39MfJO1Pf7Bcekr+4YHkk+Rt79iA+KXWEteAW?=
 =?us-ascii?Q?nFiCioJlKfXWSV6j2oCqW+O8E9dBQtVIoSDlkhdo5oxxULa8CDuKChDZT5AV?=
 =?us-ascii?Q?BQdFSuAGXgS4sUyZEjVCa9A57+IjsnzP0ySG7NB/lZJswXFeGia0GH35DEGf?=
 =?us-ascii?Q?F+G3FqmZnwQWNVHfMNxYaql40Jyy+qOTxp/7uvejS8MCGV2Taxn/RD9cSvlV?=
 =?us-ascii?Q?vATG+6VFv+Tcb/2/zT29Kohyi50xO1p1gAkoFLD8A1IAbfv9xSa7IOcMT2e/?=
 =?us-ascii?Q?YfHFsk8W+a3poTbwoRxnDr/jbnvdl4a2mqCSVUJuiBpiHzx7Ib8a0/BXoQYK?=
 =?us-ascii?Q?TaQx13LhKiY9Mg4BIUccHEnT2Vbv3Iu9IRpcaH21YnfihSOwH2XjpWoZSan4?=
 =?us-ascii?Q?75RYCVk4eAlp+/4eFnquZZHzFpKHzzjhypFxlg70kky3bxzo/NOIr6WSITfG?=
 =?us-ascii?Q?3595GZUB1BOYr4tfEt0=3D?=
Content-Type: multipart/alternative;
 boundary="_000_MA1PR01MB4129D8A087F671A505589AB487039MA1PR01MB4129INDP_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e675d082-e239-4191-b848-08d9fc21e1e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2022 07:54:30.2344 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 404b1967-6507-45ab-8a6d-7374a3f478be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8fb9gNVGyakAwyLBbhB6h38FNOqrdGm3UH/+qv8co/++gRmxq8uCM6/kF8+3AJBD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB7838
X-TM-AS-Product-Ver: SMEX-14.0.0.3031-8.6.1018-26746.002
X-TM-AS-Result: No-10--13.234200-8.000000
X-TMASE-MatchedRID: h1zqdztS80CpRvxwLdAyKZ+stJjZFtGkQR7lWMXPA1u3CLdtdG1oCJ/v
 Lk4ECKhoNtrqBJtuOX6I40w6RysGJoc7+Qb8+03pG66tuBin4dAIKj6WwO7KdVYiM8eC1pUc90i
 bxL4bz6Auy+d2rXUBkptVVeKU/pCr8IMW9dkWZjJh5IuIaxTO+VTizEWrqKARdigxMAcafVqFAf
 5iylR8WhiZsVhauLEn2QQJvp4Wi4Bq9oJbnOqI2ovptQwz5tsimzsJ8CsZYU6yy072phvASaPFj
 JEFr+olHwAqApZ40aG25maLCP+WcrI7zVffJqTzatztHExY3Y7/U4Op76z0lwp4XUH3SSib4zbY
 /GwH5vYdELmAsmwLS656v2dkwWLU3Zdslc+2VSisEJOnbfzKf+4zvGuLbHg8
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--13.234200-8.000000
X-TMASE-Version: SMEX-14.0.0.3031-8.6.1018-26746.002
X-TM-SNTS-SMTP: FDAACFE5CED741651C5347111BC35B329F4B0772D55FB8586856699C4035DA0B2000:8
X-OriginatorOrg: TCS.COM
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_MA1PR01MB4129D8A087F671A505589AB487039MA1PR01MB4129INDP_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

While looking at the issues list, came across this. We would like to take t=
his up and work on it. Any help to getting up to speed would help.

Thanks,
Sandeep.
=3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D
Notice: The information contained in this e-mail
message and/or attachments to it may contain =

confidential or privileged information. If you are =

not the intended recipient, any dissemination, use, =

review, distribution, printing or copying of the =

information contained in this e-mail message =

and/or attachments to it are strictly prohibited. If =

you have received this communication in error, =

please notify us by reply e-mail or telephone and =

immediately and permanently delete the message =

and any attachments. Thank you



--_000_MA1PR01MB4129D8A087F671A505589AB487039MA1PR01MB4129INDP_
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">While looking at the issues list, came across this. =
We would like to take this up and work on it. Any help to getting up to spe=
ed would help.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Sandeep.<o:p></o:p></p>
</div>
<p>=3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D<br>
Notice: The information contained in this e-mail<br>
message and/or attachments to it may contain <br>
confidential or privileged information. If you are <br>
not the intended recipient, any dissemination, use, <br>
review, distribution, printing or copying of the <br>
information contained in this e-mail message <br>
and/or attachments to it are strictly prohibited. If <br>
you have received this communication in error, <br>
please notify us by reply e-mail or telephone and <br>
immediately and permanently delete the message <br>
and any attachments. Thank you</p>

<p></p></body>
</html>

--_000_MA1PR01MB4129D8A087F671A505589AB487039MA1PR01MB4129INDP_--

