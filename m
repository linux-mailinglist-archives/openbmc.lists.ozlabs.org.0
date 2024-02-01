Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2474B846292
	for <lists+openbmc@lfdr.de>; Thu,  1 Feb 2024 22:24:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=asus.com header.i=@asus.com header.a=rsa-sha256 header.s=asuscom header.b=jRdN8txF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQsPM0SGfz3cNP
	for <lists+openbmc@lfdr.de>; Fri,  2 Feb 2024 08:24:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=asus.com header.i=@asus.com header.a=rsa-sha256 header.s=asuscom header.b=jRdN8txF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=asus.com (client-ip=103.10.4.13; helo=ms.asus.com; envelope-from=prvs=7549cd68c=kelly_hung@asus.com; receiver=lists.ozlabs.org)
Received: from ms.asus.com (ms.asus.com [103.10.4.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQZ9d3lFtz3bnk
	for <openbmc@lists.ozlabs.org>; Thu,  1 Feb 2024 20:58:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=asus.com; i=@asus.com; q=dns/txt; s=asuscom;
  t=1706781526; x=1738317526;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0S6DxxJmELg2+tJyzP2CV6LRS/S/WEVN9GUdkCjnIW0=;
  b=jRdN8txFbKVLIXI0eCWhAGSSf3dkKSIOiBf4igZKc04n/U+o7DMOzsOB
   q8k/qIekHNxElyPicvmtbL1kEpjIF5g/Pji11ZLkL3QGdI674HSK4qKh6
   rLVfhf1ERarm+MRa0JgKx6LhgnSLvaBIif0UQ9TbkJLbXVhCgVwxn+51H
   w=;
X-IPAS-Result: =?us-ascii?q?A2FEAAARa7tl/xYvFqxaHQEBAQEJARIBBQUBSYEzBwELA?=
 =?us-ascii?q?YI4eoFhhFORZwOLXpBRKoEsFIFfCw8BAQEBAQEBAQEHAQEuFgQBAYUBAwICF?=
 =?us-ascii?q?odAJzUIDgECBAEBAQEDAgMBAQEBAQEIAQEBBQEBAQEBAQYEAQEBAoEZhS9Kg?=
 =?us-ascii?q?lwBg20BAQEBAgEBCyhFBQcEAgEGAg0BAwQBAQUoAgIeBwodCAIEAQ0FCIUkA?=
 =?us-ascii?q?w4jmVqbOm0PgTAaZ4IWBLAdDYJVCQGBBzcBgWiGHx4Bg0GCLYNAe4JPJm9Ce?=
 =?us-ascii?q?W2BAj6CH4FnCAESASMFECECgxhCgi8EgTlcgz+DMoEoinBohDxUfx0DXigEX?=
 =?us-ascii?q?A0FFhAeNxEQEw0DCG4dAhEiOgMFAwQyChIMCyEFVQNABkkLAwIaBQMDBIEwB?=
 =?us-ascii?q?Q0aAhAaBgwmAwMSSQIQFAM4AwMGAwoxMFVBDFADZx8WHAk8CwQMGgIbGw0nI?=
 =?us-ascii?q?wIsQAMREAIWAyIWBDYRCQsmAyoGNgISDAYGBl0jFgkEJQMIBANUAyF0EQMEC?=
 =?us-ascii?q?gMUBwsHeoIJgT4EE0cQgTSEbwNEHUADC209NRQbBQQfAYEZBZsnE4EpEBAuA?=
 =?us-ascii?q?RNwKxVQERofRZIznWyUDXANgwuBA5ksgXuGKxeEBYx3hlsDkkWYVSCRS5ZcA?=
 =?us-ascii?q?gQCBAUCDgiBQCUCgSJwMz2DN1IZoiJ2OwIHAQoBAQMJgjuEDYImBS9nXwEB?=
IronPort-PHdr: A9a23:v32ApBXBSSuQ9M+ba8/5xPNcDPPV8KyNUzF92vMcY1JmTK2v8tzYM
 VDF4r011RmVB9WdsKsdwLKJ+4nbGkU+or+580o+OKRWUBEEjchE1ycBO+WiTXPBEfjxciYhF
 95DXlI2t1uyMExSBdqsLwaK+i764jEdAAjwOhRoLerpBIHSk9631+ev8JHPfglEnjWwba1xI
 Rmsowjdq9QajYR+Jqsz1xDEvmZGd+NKyGxnIl6egwzy6sCs8pB97i9eoegh98lOUaX7e6Q3U
 7lVByk4Pm42+cPmqwDNQROA6XUAXGoWlAFIAxXe4xHhQpjxqCr6ufFj1yScIMb7UKo7WTWm7
 6dsVR/olCIKPCM3/W3LlsB9ir9QrQm/rBJj3YHbfICVNOJ/fqzDe9MaWXFBVdtVWyBYH4+wc
 5cDA+8HMO1FrYfyukEOoAO+CweyGu7h1yNIiHH106000esuDQ7I0wM7EtISq3vYsMn5OLsOX
 eC2yqTD0DXNb+lR2Tf48IXGdw4uofWIXbNwbMHfy1QvFwXKjlmUr47nOTWX2uEQuGWc6uRvS
 +avi2onqg5poDav28EsiobSi40P0VDE6D55zJwpKt2/TU52eNipG4ZfuC+GLYV5WN8iQ312t
 yYgzL0LoZC1cDQWxJk72hLSZPOJfpaI7B/hV+udPzl2iXZ5db6imRq+7Uutx/DiW8e73ltEo
 CpLn9vQu30DyxDd6saKR/R780y82jiPzxje5vxGLEwqj6bXNYAtzqQ/m5cRq0jPADH6lF3og
 KKXakkp9O2l5/n7brjip5KRMpJ4hh3jPqkrhsOyD+E1Pw0TU2SH/+m3yaPu/UnkQLVRkv05j
 LPZvo3bJcUauKG0GxNZ34A+4BilFTimys4XnXwfIVJAfxKIkpbmNknVIPD9Efe/m1OskCp3x
 /zePr3uHJHNLn/bnbn/Z7hx8kFSxwsuwd1e/p5bBawNLOzpVkDts9zYFAc5MwqqzOb7Etlyz
 JgeWX+UAqOBMaPSt0GH5v43LuWRZoIZpizxJ+Y76/L0gnI0m0URcbe30ZcPbXC3BPVmI0GXY
 Xr2hdcBFH8HsA8gQ+zujF2DUSZcaXSvX6I66TE2E5ipDZzeRoC2mrCOwCC7HphOamBAEV+DC
 W3oeJmcW/cQdCKSJddsnzMcWbi7V4AhzQ2utBP9y7d/MurU4CwYtZTi1NVu5O3Tkhcy9SdpD
 8SZ0GGNSHt4kX8PRz8zxKx/u1Byyk+f0ahkhPxVDcRT5+tIUgc1NZ7cyPF6C8vsVQ/acdeJT
 UypQtSiAT0rUt0xxNoOb15nG9q+lhDDwzaqA7gNmryWHZA76aXc33/tJ8tmz3bG1bIhj0U9Q
 sdVKGKpmKh/9gfJC4HUjUqVj7yqergE3C7R6GeDynKDvEZAUAFuV6XKRnUfaVfNoNT950PCV
 KOuCa89PgtGyM+CLrFFZcbyjVlcQ/fjItveMCqNnDKMAhPA/LKKbcK+Z38c2iT1C08CiB0X/
 nHAPg87UGPpgG/aCC0mNU/pbAu46fF/p3O8U1Q55w6PZkxlkbGy/0hGq+abTqYw07YAqW8Bt
 jN7XK5FJ5OeX/mNow5wS4VBZ9wV6UxaziTSsAkrbc/oFLxrmlNLK1c/hEjpzRgiT9wYyaDC5
 Fsmzwt3fKSf1l4JNzaVxov5NbCfLG7utAuuZKjb1hC7sp6W964D5e5+pwDluwekRUYn+m9sh
 t9S1XbU757WDQ0UBJT2VEt/9xVzq7zAJCcn4IaB3GZxKu+/tTqRs+8=
IronPort-Data: A9a23:oFUQqaIeIN14HAYIFE+RiZQlxSXFcZb7ZxGr2PjKsXjdYENS3jEOy
 2IdCD2HOvbYazD0ft0jOorj8hwF7J/VytZiTANorCE8RH9jl5HIVI+TRqvSF3rJd5WcFiqLz
 Cm8hv3odp1coqr0+0/F3oDJ9CU6j+fTLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtHR7zml4
 LsenuWGULOb828sWo4rw//bwP9flKyakC8VuFU4ecdKsDf2/5XCJMlHTU0ZByKQrrh8RoZWd
 c6apF2K1jqxEyMWNz+Quu2Tnnvm4lLlFVPmZnJ+A8BOi/XZz8A4+v5T2PE0MS+7h9gV9jzYJ
 RokWZGYEG8U0qPwdOs1bht4DjtmJqN96eHmO3GOjceMlkaYWi65qxluJBle0Ywwxt4yLFEXq
 7kmcWpLZReZn+S73PSyUfR37ighBJC0ZsVF4Dc8kneDV57KQriaK0nOzfxV2DMhseBTG/n2b
 tEEcnxkaxGojxhnYA5OUM1jxbvx7pX5WzAHgnaIrKgN33eQlgcv7rSxC/+WYuXfEK25mW7d/
 Aoq5V/RHgsbMt23yj2D6W+oheiJliT+MKoKDLy39vl3m1C7yWkaCRlQXly+ydGkz0S5XM53L
 00P5jFooaU05AqnQ7HVWAW1pnSBtTYYWsFMCKs9+gWEwLGS5ByWblXoVRYYN4Zg7pVwGWNsj
 AXhc87VOAGDeYa9ERq1nop4ZxvoaUD58Udqifc4cDY4
IronPort-HdrOrdr: A9a23:l6ilAam2p0nNRiAaBz+kzrq5U0jpDfNgiWdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcIi7SdO9qXO1z+8W3WBjB8beYOCAghrjEGgC1/qo/9SOIVyZygcw78
 ddmu1FeabN5DtB/IvHCWuDYq8dKbC8mcjC74m+854ud3ATV0gJ1XY/Nu/xKDwSeOAyP+tfKH
 Pq3Lsim9PPQwV1Uu2LQl0+G8TTrdzCk5zrJTQcAQQ81QWIhTS0rJbnDhmxxH4lIn9y6IZn1V
 KAvx3y562lvf3+4ATbzXXv45Nfn8ak4sdfBfaLltMeJlzX+0mVjcVaKvO/VQIO0aGSAWUR4Z
 rxStAbToZOAkbqDyCISN3WqkzdOXgVmjvfIBSj8AfeSITCNU0H4ox69MRkmtGw0Tt4gDm+uJ
 g7h15wzfBsfEn9dH+W3amUa/kv/XDE/0bLVIYo/idiuU93Us4MkWTZlHklT6voVRiKlrwPAa
 1gCtrR6+1Rdk7fZ3fFvnN3yNjpRXgrGAyaK3JyzPB9/gIm6EyR9XFos/A3jzMF7tYwWpNE7+
 PLPuBhk6xPVNYfaeZ4CP0aScW6B2TRSVaUWVjiaWjPBeUCITbAupT36LI66KWjf4EJ1oI7nN
 DEXElDvWA/dkryAYmF3YFN8BrKXGKhNA6dg/129tx8oPnxVbDrOSqMRBQnlNahuewWBonBV/
 O6KPttcorexKvVaPR0NiHFKupvwCMlIbwoU/4AKiKznv4=
X-Talos-CUID: 9a23:XYo5fm53iyf3MbSwu9ssyUw0B9o9aXPm3SnxOUaJNW12EbbLYArF
X-Talos-MUID: 9a23:YwpUSAXz1RTEjFbq/DKzrhV/PcVS37vtUktTr5lagOzHLRUlbg==
X-IronPort-Anti-Spam-Filtered: true
Received: from unknown (HELO TP-EX16-V12.corpnet.asus) ([172.22.47.22])
  by ms.asus.com with ESMTP; 01 Feb 2024 17:58:17 +0800
Received: from APZA002EXB.corpnet.asus (172.22.6.14) by
 TP-EX16-V12.corpnet.asus (172.22.47.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 17:58:16 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (104.47.26.41) by
 APZA002EXB.corpnet.asus (172.22.6.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28 via Frontend Transport; Thu, 1 Feb 2024 17:58:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PjiRGqIcyj3IS8yO/VG8ykemcQ6dRySSnXZwZ6cFGy+vxiXsQTzEK3BnNbzPzlMQ/n4dayhjwZVk8RVoZsAa1YKeWGeQhLs2GM3Bw9za7vqyS8jfOuGtY3m70T4wNKiaONyh3NG8ATnRxokKZM15BgnrEVJna/CPgKkFsgDPXajd5rh8TzOI9o8WQa8kzffGupa5psYsWBAa5+ycBIaZmNjh+1XbioYU79FOEu+jHIf+kcdxdRvVBOQNeackFLwWu8bgudWTt7vQw8LrVhOctaUfB/6QBPbSiidY0UU/fAxTWU8D690Bl7Uzdvf+BkWSV4v9Nbw7tI5alS4wUqIpCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Douo7EZii+3NiO3DRwS8TH1mgdF1S26Ljw9y2WqazqM=;
 b=DUct7lzrRpj2/U51TqkFWueNYBirDisMSNOSp/D0k8uM/1gDy1jNuQKwv1ufaaMI2o+IgKI91cCb6sv1JNm3/3HxIu8A1aVhaG1+0/sXXh8jfqI8lsZqUuznFGbcdnsU/d8Y3w5rg90Fmm1bb8lMIqnTlshUkQEQ4BIkNxoIcJfh0wfVgwid7bMCSjArih9TCPoVapvtdc5PNE0cHOqDvneEQNmGLD+wuM43/OMe2zmVfPWHGS81hku6Hg0FusrK9/THkc1Z6w4QEmJWlQv0o2P+f8hhDQL0cJZZWftN2bS+LfUr82T44Wh4IJmgTttb6GqQVEA2xD9U04Neth/i2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asus.com; dmarc=pass action=none header.from=asus.com;
 dkim=pass header.d=asus.com; arc=none
Received: from SEYPR04MB6602.apcprd04.prod.outlook.com (2603:1096:101:c3::10)
 by SEZPR04MB6525.apcprd04.prod.outlook.com (2603:1096:101:9c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Thu, 1 Feb
 2024 09:58:15 +0000
Received: from SEYPR04MB6602.apcprd04.prod.outlook.com
 ([fe80::62f:224d:5cc:cbdc]) by SEYPR04MB6602.apcprd04.prod.outlook.com
 ([fe80::62f:224d:5cc:cbdc%6]) with mapi id 15.20.7249.025; Thu, 1 Feb 2024
 09:58:15 +0000
From: =?big5?B?S2VsbHkgSHVuZyiseLnFsvop?= <Kelly_Hung@asus.com>
To: Tom Rini <trini@konsulko.com>, Kelly Hung <ppighouse@gmail.com>
Subject: RE: [PATCH] dts: ast2600: add x4tf dts for asus product
Thread-Topic: [PATCH] dts: ast2600: add x4tf dts for asus product
Thread-Index: AQHaU46GuOp8vpYcm0+oYSbqn5BP37D1OChwgAAKe+A=
Date: Thu, 1 Feb 2024 09:58:15 +0000
Message-ID: <SEYPR04MB66025F0A9565C6F827C41E5E9D432@SEYPR04MB6602.apcprd04.prod.outlook.com>
References: <20240130104045.199879-1-Kelly_Hung@asus.com>
 <20240130150906.GR1152441@bill-the-cat>
 <SEYPR04MB660286EF00E67DF8DDB63F599D432@SEYPR04MB6602.apcprd04.prod.outlook.com>
In-Reply-To: <SEYPR04MB660286EF00E67DF8DDB63F599D432@SEYPR04MB6602.apcprd04.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asus.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR04MB6602:EE_|SEZPR04MB6525:EE_
x-ms-office365-filtering-correlation-id: 713acffd-c5e0-483c-a153-08dc230c4ef2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AGPVrSEbwmMyoY5Ppn4p2GmExMEfDdbAyfWs7o6tZUWJrTLmBcTeFZpYmNqQ51gHdXl5cwEJ09nvXWOCofI2exq1WvPTzYF3nVKiQS+jGLfPfqEraSUhadqPoNJAkK6oYC8rTzPvw7UX3ozAd3IfwB8zgznWU8kIP5Pq2hM1SNLtnllb/FbKiYrmf+p38otlynXZBSpELhaPjeX/KbXvjdhizbUJSZtxOJbRJA60k07P2aNQNcphvvXGOuaGa65YefHS5isj/rXSAtmk7OQPxI4oa+a5YT8mVK4JKEJmQ/QVLSaQm9X8rYYZ7hW6duTMpPE+xumSiQf4IYd2O+TCN6RyOlEU0D9JubdSZoty8w6DirbHnND6ISy0oY4HkKIahSXDnaIfWdJ8ory66U43xyXgp+PUbYB7vVh3kZH2e2HygNgEETGn5xshc2sLpddAsmjThz3+qwmnw4+wMQ8egKrXPjvbPG7aEKGCqQ0csBb2yYK5AefQL4dS3YeMSrq1Z7a+qqpLPLPsNQGM/g85eyNOFqwA2NGFXhW84mDdJIAdi+WPAGJwqslr93mWFjG8s2a+fzqkbcDzSW5r0SUu0UNvGqx1x7dq5BVCeShbdkGfpN3sVJOx7vBDFquQEjRcdfdtu3lQVp8W9uj0SyaUa+XduhRkJ9XfhGYkv35WM6o=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR04MB6602.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(376002)(39860400002)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(8936002)(316002)(38070700009)(66476007)(54906003)(64756008)(66946007)(66556008)(8676002)(76116006)(4326008)(110136005)(85182001)(478600001)(66446008)(41300700001)(86362001)(33656002)(5660300002)(2906002)(52536014)(83380400001)(55016003)(2940100002)(26005)(38100700002)(122000001)(71200400001)(6506007)(55236004)(53546011)(9686003)(7696005)(42413004)(32563001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?YlYveEV3SUdnYlBGeWlieUtFMVR2Q3lJTXBOTXJCdWRKNytSTTZVK0tBRWxDempF?=
 =?big5?B?bU9tWkJDVzE3b05WZno4b2hIazZzeHpuYlA5RW5XQ3I5TWdlM1ppMGtqOGNDWTQ3?=
 =?big5?B?WlUxT1JIaFZuSHVWb2JmWjJSczJYYnNqMHd0YlBYSXZ4RnpXVHVQQ01LN1dyWW5m?=
 =?big5?B?blZkdTIveXNML3VmTDZwK2s4OXpzYnF0NnJlYUhtNWRFU3V2T25UQVAzSDY1enpu?=
 =?big5?B?azFwWTcrVU9aOHFhd3JUaURhenB3bkg2b3AzVzQycHJSQ3FRY0FCSzR4VEdJbXhY?=
 =?big5?B?SHJYeXpacEh1dTEvZko4TTZVSWxLQ3hiSVc5dnlTVEZRcnk1VG9xbzhyeGtocFZE?=
 =?big5?B?d2dEeWJyWVJydk1jK2F4R1ZaSmVIZWJDVjJoVy9oNU5GK2dxNU42SDJLRkxkTGw5?=
 =?big5?B?UHcvMTJXTFltUEJsemZ4VEFHQjVEL0VibzRjaU1TKzlVSjRrdm9BdENoL0tGZitG?=
 =?big5?B?TXVUUlpqMWdzR0hkWHBsdk1Ddmg1V09YRVBBRUxkaGxtMEUyQkVjcjNHeGNqSkJJ?=
 =?big5?B?YlMzK29nM0hkK05JMjd1WGRxL2RzbmJTa2IvZE9NTks1TEt5OWYxMU9Jb0JjMjAv?=
 =?big5?B?NVlpbnMwT0RrME13R2NxQ3JVYnJUU2ZScm94Q0k5bEdaM3BFVWs5SVV2bXYzNFJ4?=
 =?big5?B?TWlEQTM0MitER2FPa1NxWExWeUNZNzNIREhpNjVjN0swcEprTUZ5NUZrUDY3YzhP?=
 =?big5?B?eHhPU3hwOWxKdno3ckVRSUZhc3RMZE96Z2Nud2g3M0Q0MTA4ZzQ1K21zcFpGQkJm?=
 =?big5?B?L0U2eUVoUDF4TmRXR092VDREL1V3L05YdWUxVHJMV2c1bEFiQ0JpRXlnS1Mwbm1h?=
 =?big5?B?aEpPa1BKeFkybkt4a0NRM2FXdlRIKy9PYmJiZVBndlc5c2FQQ0FqNVRRYkVDUDlz?=
 =?big5?B?WERJSERRb1l3ZHNIdDArdGN1c0tyVU5Id1VWWksrNm80VTRzWmZZQ3pmUlFWU0dw?=
 =?big5?B?WTJSeGZvRjY1WmlrQnYvYVhReFl3U0t4bHBXOHQxcHBuU2lkaDVhUlNxV3dPTmZF?=
 =?big5?B?enF1emF2RHUwZEZSMEp4ZzdyeWExVDdjZzRZSFhSN2k2ZjBFVVlPMjh5b1h2OTRs?=
 =?big5?B?VkNqczhPWG5aTnFQUlp4Mjl2RHovZndpQVV2bGdZdWcwbGVQWUlaMW5ScjQrVWJu?=
 =?big5?B?ZVJRendVM08zbElOMDYzdEpZRDhWeGY3c1VnOHpXREgydEVtUFlzYVZHNDZ3SGt3?=
 =?big5?B?eXd0L3gvRmdrdmtTQTZRS0Mxdkt3SkZMd1lDeDdaQ296RXFmNUpnT3B3SFZ3eHBK?=
 =?big5?B?Ly9Jd2NtdEFndnVwNkVoRkVKNUhOSEV5Wi92a09NYS9PcFBQRjJUUWxhZUdnVUJX?=
 =?big5?B?dE5NVy8wUU1aRktDUnJTSUxXSGNYQllZcnlYVjJhdjdVYkJ0V1o3cldDZWdxc2gr?=
 =?big5?B?b0pMZnJEaXEzNGRqdmJUYnBqdjlxQ2NiUHAzSkxpRWVTdmZpMnVaclhqUUhRaS9S?=
 =?big5?B?MTEwNW81QVk4Z0VMcFZMWVF0Q1hYMDkvMVUwMmxmdWEyQlU5b3JlMEw5SHJjWEl5?=
 =?big5?B?V2ZPM2k2ZlJQeTBySmVHRDgxbGpQSFpkNHBtZTZFclM3c3NRRHNEbmlOemozdTR3?=
 =?big5?B?S0F0OURjRjJySXFDMGFEeTR4VVdnSFovb1hkS2xjekhzdHdhYnlFL3FVUkc0dFlV?=
 =?big5?B?M0ZJd3JuOTBCQnQwVjg5eTBBdmlrdnNvQi8wejZML0NaMXFlaXpPalFySk1jYWhk?=
 =?big5?B?bk1SaWpZTnBrWDYzNXpBL1BxNmhPM2hqMGpoWHY4M1NNcmZFaDhMQUZTTnMvU3pF?=
 =?big5?B?UUNLdllUYm9yRFhLYU1pUDh1eGw0OE9kcXh0RldRWFJjTy9kU2xWZnU0WGhBeEFq?=
 =?big5?B?YjZ5aGxqWm5IcWRwaEM3ZkcvOHhZKzBzd0lNMlM4cmF3eWhWTzZTTHZwTmwvTFFY?=
 =?big5?B?M0FQVWovcjA0ZUhobmlTdG9tczVxTktId2hneUZEcFdpK0UzUnFxejBva0J0M1c1?=
 =?big5?B?MWErRXRIQVBWVlpBT2ZZVHdwRlRSdEFRVHNpNWZuMmJReTZYc3hRYjhKbDM5Nmgw?=
 =?big5?Q?3JcjIi/nURf0Kip5?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR04MB6602.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 713acffd-c5e0-483c-a153-08dc230c4ef2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2024 09:58:15.0474
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 301f59c4-c269-4a66-8a8c-f5daab211fa3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qQe8/kT1XabAYJaKFHzmx1o/BOFeD8sy8dDKlPZnxkdZtzIa3T+i8adziEuGA/SQEL9LFUcgLw2us5XrKeq+9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6525
X-OriginatorOrg: ASUS.com
X-TM-AS-Product-Ver: SMEX-14.0.0.3197-9.1.2019-28156.001
X-TM-AS-Result: No-10--26.592700-8.000000
X-TMASE-MatchedRID: gJaqKlYO+CuvAcrly0si/w9MFGsNTBFU3DpUPat2XBvsXxvZTa7VATvQ
	G0xdFpDCgz5VmKZ8x84nuQloIbSMz8WH6wwdsMksWelk5oubh9KZttcrMQhABW2pp88CUG45h1i
	w+X8nViWArOK1HojS9EeW8dNUbG/Pt0l6Beef2vKwfs52bWHeGIyT2UGABjrTas6B1L4Ii29sBB
	K+dj8Axat04Lvp8dbXPEs9e1JXzZ8bUyMHypcMbQqsw/TCQdT5AW1a55mUwfQoYuzwCCwx/YYtg
	u3ZTSlqqd3rLH8qrxeZ82QLu17vbfKx/Ln2xTEuYoGI/iPEgCYo9FEPVb4DMtvIAMT/07OitT4p
	iLWpY7p+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--26.592700-8.000000
X-TMASE-Version: SMEX-14.0.0.3197-9.1.2019-28156.001
X-TM-SNTS-SMTP: 	97172AF386A5D70616931F543980A88DC4A9B1782F4CD804542592AADEFA7DEC2000:9
X-Mailman-Approved-At: Fri, 02 Feb 2024 08:23:35 +1100
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
Cc: "u-boot@lists.denx.de" <u-boot@lists.denx.de>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGksIFRvbSwNCg0KUToNCj4gKyAgICAgbW9kZWwgPSAiQVNUMjYwMCBBU1VTIjsNCj4gKyAgICAg
Y29tcGF0aWJsZSA9ICJhc3BlZWQsYXN0MjYwMC1hc3VzIiwgImFzcGVlZCxhc3QyNjAwIjsNCg0K
QTogSSBkbyBhIG1vZGlmaWNhdGlvbiwgcmVwbGFjZSAiYXN0MjYwMC1ldmIiIHdpdGggImFzdDI2
MDAtYXN1cyIuDQoNCg0KUTogQWxsIG9mIHRoZXNlIGFyZSBib290cGgqIG5vdy4NCg0KQW5kIGlz
IHRoZXJlIGVmZm9ydCBiZWluZyBtYWRlIHRvIHVwc3RyZWFtIHRoZSBkdHMgZmlsZXMgZm9yIHRo
ZXNlIHBsYXRmb3JtcyB0byBMaW51eD8NCg0KQTogWWVzLCBJIGFsc28gZ2l0IHNlbmQtZW1haWwg
dG8ga2VybmVsIHJlbGF0ZWQgcGVyc29ucyB0byBhZGQgYSBhc3VzIGR0cyBpbiBrZXJuZWwgZGV2
aWNlIHRyZWUuDQoNCk15IHR5cG8sIEkgd291bGQgbGlrZSB0byBjb3JyZWN0IGl0Lg0KPiBAQCAt
MCwwICsxLDIzOSBAQA0KPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjArDQo+
ICsvLyBDb3B5cmlnaHQgMjAyMyBBU1VTIENvcnAuDQoNClRoYW5zIGZvciByZXZpZXcuDQoNCkJl
c3QgUmVnYXJkcw0KS2VsbHkNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFRv
bSBSaW5pIDx0cmluaUBrb25zdWxrby5jb20+DQpTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDMwLCAy
MDI0IDExOjA5IFBNDQpUbzogS2VsbHkgSHVuZyA8cHBpZ2hvdXNlQGdtYWlsLmNvbT4NCkNjOiB1
LWJvb3RAbGlzdHMuZGVueC5kZTsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOyBLZWxseSBIdW5n
KKx4ucWy+ikgPEtlbGx5X0h1bmdAYXN1cy5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIXSBkdHM6
IGFzdDI2MDA6IGFkZCB4NHRmIGR0cyBmb3IgYXN1cyBwcm9kdWN0DQoNCk9uIFR1ZSwgSmFuIDMw
LCAyMDI0IGF0IDA2OjQwOjQ1UE0gKzA4MDAsIEtlbGx5IEh1bmcgd3JvdGU6DQoNCj4gVGhpcyBp
bml0aWFsIGRldmljZS10cmVlIHByb3ZpZGVzIHRoZSBuZWNlc3NhcnkgY29uZmlndXJhdGlvbiBm
b3INCj4gYmFzaWMgQk1DIGZ1bmN0aW9uYWxpdHkgYW5kIHdvcmsgb24gQVNVUyBYNFRGIHByb2R1
Y3Rpb24uDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEtlbGx5IEh1bmcgPEtlbGx5X0h1bmdAYXN1cy5j
b20+DQo+IC0tLQ0KPiAgYXJjaC9hcm0vZHRzL01ha2VmaWxlICAgICAgICAgfCAgIDMgKy0NCj4g
IGFyY2gvYXJtL2R0cy9hc3QyNjAwLXg0dGYuZHRzIHwgMjM5DQo+ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysNCltzbmlwXQ0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vZHRzL2Fz
dDI2MDAteDR0Zi5kdHMNCj4gYi9hcmNoL2FybS9kdHMvYXN0MjYwMC14NHRmLmR0cyBuZXcgZmls
ZSBtb2RlIDEwMDY0NCBpbmRleA0KPiAwMDAwMDAwMC4uM2M0NzgwNTgNCj4gLS0tIC9kZXYvbnVs
bA0KPiArKysgYi9hcmNoL2FybS9kdHMvYXN0MjYwMC14NHRmLmR0cw0KPiBAQCAtMCwwICsxLDIz
OSBAQA0KPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjArDQo+ICsvLyBDb3B5
cmlnaHQgMjAyMCBJQk0gQ29ycC4NCj4gKy9kdHMtdjEvOw0KPiArDQo+ICsjaW5jbHVkZSAiYXN0
MjYwMC11LWJvb3QuZHRzaSINCj4gKw0KPiArLyB7DQo+ICsgICAgIG1vZGVsID0gIkFTVDI2MDAg
QVNVUyI7DQo+ICsgICAgIGNvbXBhdGlibGUgPSAiYXNwZWVkLGFzdDI2MDAtZXZiIiwgImFzcGVl
ZCxhc3QyNjAwIjsNCg0KQ29tcGF0aWJsZSBzaG91bGQgYmUgYm9hcmQgdW5pcXVlLg0KDQo+ICsm
dWFydDUgew0KPiArICAgICB1LWJvb3QsZG0tcHJlLXJlbG9jOw0KDQpBbGwgb2YgdGhlc2UgYXJl
IGJvb3RwaCogbm93Lg0KDQpBbmQgaXMgdGhlcmUgZWZmb3J0IGJlaW5nIG1hZGUgdG8gdXBzdHJl
YW0gdGhlIGR0cyBmaWxlcyBmb3IgdGhlc2UgcGxhdGZvcm1zIHRvIExpbnV4Pw0KDQotLQ0KVG9t
DQo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PQ0KVGhpcyBlbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIHRvIGl0
IGNvbnRhaW4gY29uZmlkZW50aWFsIGluZm9ybWF0aW9uIGFuZCBhcmUgaW50ZW5kZWQgc29sZWx5
IGZvciB0aGUgdXNlIG9mIHRoZSBpbmRpdmlkdWFsIHRvIHdob20gaXQgaXMgYWRkcmVzc2VkLiBJ
ZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50IG9yIHJlY2VpdmUgaXQgYWNjaWRl
bnRhbGx5LCBwbGVhc2UgaW1tZWRpYXRlbHkgbm90aWZ5IHRoZSBzZW5kZXIgYnkgZS1tYWlsIGFu
ZCBkZWxldGUgdGhlIG1lc3NhZ2UgYW5kIGFueSBhdHRhY2htZW50cyBmcm9tIHlvdXIgY29tcHV0
ZXIgc3lzdGVtLCBhbmQgZGVzdHJveSBhbGwgaGFyZCBjb3BpZXMuIFBsZWFzZSBiZSBhZHZpc2Vk
IHRoYXQgYW55IHVuYXV0aG9yaXplZCBkaXNjbG9zdXJlLCBjb3B5aW5nLCBkaXN0cmlidXRpb24g
b3IgYW55IGFjdGlvbiB0YWtlbiBvciBvbWl0dGVkIGluIHJlbGlhbmNlIG9uIHRoaXMsIGlzIGls
bGVnYWwgYW5kIHByb2hpYml0ZWQuIEFueSB2aWV3cyBvciBvcGluaW9ucyBleHByZXNzZWQgYXJl
IHNvbGVseSB0aG9zZSBvZiB0aGUgYXV0aG9yIGFuZCBkbyBub3QgcmVwcmVzZW50IHRob3NlIG9m
IEFTVVNUZUsuDQoNCkZvciBwcmljaW5nIGluZm9ybWF0aW9uLCBBU1VTIGlzIG9ubHkgZW50aXRs
ZWQgdG8gc2V0IGEgcmVjb21tZW5kYXRpb24gcmVzYWxlIHByaWNlLiBBbGwgY3VzdG9tZXJzIGFy
ZSBmcmVlIHRvIHNldCB0aGVpciBvd24gcHJpY2UgYXMgdGhleSB3aXNoLg0KPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT0NCg==
