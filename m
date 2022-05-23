Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FC4531F18
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 01:07:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6Xzc0m8dz3bl1
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 09:07:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=SYzKGQnL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=8142ba0894=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256
 header.s=pps202002 header.b=SYzKGQnL; 
 dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6Xz44CPPz2ypP
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 09:07:06 +1000 (AEST)
Received: from pps.filterd (m0105197.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24NMNxwo005505;
 Mon, 23 May 2022 23:07:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=EmmW6DzvxLrhZ3rM6B3gHWUlLWOsN4H6nGgsEU+WmmQ=;
 b=SYzKGQnLYqeEVf692SY2LABCAonkvrc8NFiy6WfVTZALBkNcOZtLzA9SVGVrtmrtB2rm
 3KH6/7llcb4zWDlKlpOZUmrDsl0Nz4OS3kjg+nLjcwqaXsYP2DcVZHKLlCcd8dD4Litu
 P2k5gTFvqPe5MeNsK6u/WBtvNgopoWekQ4agSHLB2mIIAqSPmXZQt2OOpRW3NcewLcrk
 hIj+/RTZ2BuluKatQtawv4eHoGozYLLqwdQyJ5Sre1CPo5qxpbrmQliBJKRYRtnQF4+B
 s5hLyn4dPLVvyHNUkMRmcmCM37awSpHdz86DbCi5/Hmt5oenpzx/qIlcTMujvQjsvQSk Tg== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 by mx0a-00268f01.pphosted.com (PPS) with ESMTPS id 3g8cub95pu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 May 2022 23:06:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKySMTL63UxcjCXuxo+LgtDmaAdTi4qxqpw8FQBoqTgtoDNEOjD4en1b7QW/tPdhy1qdH/1r7FGb9wLB4+AOd9z9AI2MXBB2ANYwGPbRastVfRlSxawTf0vJGl5jNxev6q+6HAHh0NJdHRaZRlS1k8QsusfSnPAdv0oHY6aN3lzq3a2ua/7p4RcvpraRWeTP58jdOE4o3MV3UrMokdkLGKoOtDAr4KfSOinyecQkzibFaTIK7h+ZcMx8jJZ1sXqbaINPFCH+kTcO64fsAD56ZvVTjdGafEY+VK2jXf/sxO1cFqjIwMgnoFrFx/1HIogD5FpQpal0uPxB2MbQZ66e5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EmmW6DzvxLrhZ3rM6B3gHWUlLWOsN4H6nGgsEU+WmmQ=;
 b=I9oWUya2bHTJsk4vMqnc07FlS+7R0CpyGjX/BUNmcKxFEze2qL8MH3uR4SXrzHTryGL3E+oUEeZFozWmh62dzkUWAnMaE087XP69dzLcQ3vwkggUjpNcOJkXg+5M2GOKPwmhdyYa4522iwVbj9swN5GzBjrSfZtC9Ar1pT3GIn78PD7NLyzimJeZFcUlh2iRwWy/DSAT36syFBUzkfVgul38xCFszDJqP2wYe7jjThfLO1qkcv9iceVLvt0zaFHjNJXnezvOzvz6pS2zajuFssNu42UUQyRCpMaC3flgJB3nAPVCqPGSO+NI4AU82/qq1iWEVx7zNBWKX1q580nLmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by DM8PR04MB8135.namprd04.prod.outlook.com (2603:10b6:8:2::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14; Mon, 23 May 2022 23:06:56 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::80d1:a256:cb82:f808]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::80d1:a256:cb82:f808%5]) with mapi id 15.20.5273.022; Mon, 23 May 2022
 23:06:56 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Patrick Rudolph <patrick.rudolph@9elements.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v4 2/2] arm/mach-aspeed:
 Add support for CONFIG_ASPEED_DEBUG_UART_TO_UART1
Thread-Topic: [PATCH u-boot v2019.04-aspeed-openbmc v4 2/2] arm/mach-aspeed:
 Add support for CONFIG_ASPEED_DEBUG_UART_TO_UART1
Thread-Index: AQHYbvnMVuFWZodYN0a8bgInhL8K6A==
Date: Mon, 23 May 2022 23:06:56 +0000
Message-ID: <20220523230656.GL11809@packtop>
References: <20220523134004.469176-1-patrick.rudolph@9elements.com>
 <20220523134004.469176-3-patrick.rudolph@9elements.com>
In-Reply-To: <20220523134004.469176-3-patrick.rudolph@9elements.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef9cc3ef-698e-431e-3a4f-08da3d10ef1a
x-ms-traffictypediagnostic: DM8PR04MB8135:EE_
x-microsoft-antispam-prvs: <DM8PR04MB8135794A2ECCC2D725B03C98C3D49@DM8PR04MB8135.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Wa4mbiWzkupdk/X5Po7+OmVUkQKLXAU8Y28IpE4U26y+SjhdbC1jIevdYgTqo82uGTlH87gvUmEujIeeMfadTHC9bKDbaQWqmOz+pDJ8/gC3dKCicpOs3ckadkAUr33fl+ULMP+006/S2SACIV8h66fSoiUNZAZ9rBx7HC8XMkJje+uCG8EzVHOuilsKNSXgUBifHxRysghm5cdYplEHjaha+uZcMEumklQqijx85YjwHHSWvmbQRf6bm+AYS0zyvem6tPfAqoflvtOBEJORXZgE1M8fuzt4XLUL1AqF8b54l20ommuIRnqubX6Jg6D7S1d+U2fiNnFsITTgh7odJ+sDRMLgHGHNsldgr/Ej87nT5ulV9VJlfMowX/Qm1b2JYKHSu0pIGJHGzm+6WwYb8MYHJgy7F+h6YasmIzUnECfyHDVVPNUOmGp090kqwu6prc/5NqqYEBi7uH4A8rVuYDnVBB1gjU1tu4hAia+I5SpKmcyvKylCsEEoU6X3jQnoUHwr0L0dCnHVzLD7gkiKGksls8Tg7v6WD99f7Q1j/Jh9VbV1fjlPF6M/kJmLJyeDyxh6AbB+io0w2AlpZo4waEOV1zwMuWBinlQVZWfvSBedZ1BuGtocN2LJRDfiM2zAsRB3BG3bb7KVqTz/xvClHo7Sz3G2d3vibcQw1nCjafSWuyuTqySbb/wKM2oisaOrgDgBYW7Q7VbazTUw3kiwzw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(7916004)(366004)(38100700002)(33656002)(2906002)(1076003)(122000001)(66556008)(38070700005)(508600001)(4326008)(66946007)(71200400001)(33716001)(5660300002)(86362001)(6486002)(83380400001)(8676002)(186003)(66446008)(66476007)(76116006)(91956017)(64756008)(6506007)(9686003)(26005)(316002)(6916009)(6512007)(8936002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PRc9gDAUHkrOqh/BBeoSpyaFCfAHzh3APj5BmNMj8eVMKFE9pBGUUpnhqdkW?=
 =?us-ascii?Q?EhxQxlT3Ld0mgIRblt6x1xKm0XZHQCZGi8hx7XElGNa+wtLae5hKptL2hT2k?=
 =?us-ascii?Q?1vkugG1pW3pdCD/bN4vxiZ7O0BfvFTMh3CeeUsqjZ59X0aTa1JA6hI+zZiDd?=
 =?us-ascii?Q?Xvw4DmowfDUtbizVpq8qz6AMXOggZV8VX2OrXDppCw/fy54MOGCzzH9dnq6Q?=
 =?us-ascii?Q?Jy/lWQ0mN+AJ0n6fUAQCO+84/h3DSRtF43lXzxZxffVLrm+nGnlKTFv7RP/B?=
 =?us-ascii?Q?zM1FHDI0hUCdI+HJ4Y5suMML6axFeBUFFSufUlot8NEEhFpThjY/GUjgeMLA?=
 =?us-ascii?Q?u9QjcoToVrzF2/c1/W736+2xhWkF+Q0vin2wj3xmgxJho9W+7tIe9z0DfQzJ?=
 =?us-ascii?Q?7q20PE8JakhGjWmRlZbsGKoq9hdHHfeaUdGhw3LJTM51XfJ9DNLzCy8S1Nez?=
 =?us-ascii?Q?RNE+/A3KFZ1Y+y47HBzk7OSKh0lEeqv+R1yj6XuwurLRw47/oreLCPYf7Y9T?=
 =?us-ascii?Q?iSTz6k2JkcFIsR3wH75ZAXew1RJ9ZUCwGUoGBPjfAsMt4tF9WlmIv7W03O2o?=
 =?us-ascii?Q?Jz0t221ebK0+bl1YehUsgYuOll+8uAgQqGTwG8hsf0MpZx6OzJskHB3K7TDh?=
 =?us-ascii?Q?GeLjZkr3zJqiNQXUXA47CSJw5P2fBYe1Ubl6kvcIg+5TR4UeOF91PQa9syZ5?=
 =?us-ascii?Q?Qgji0aKFw0/aj/DwknnHB5lmHSWGU9Sdya1MalNpqQ6Zd28Ap0d17XIpn5fI?=
 =?us-ascii?Q?TWYeeM2uYQ52onOt9vqbObExnOvKuF/4CFrdJWnp+pmKEBGWOLNigyKzYCy7?=
 =?us-ascii?Q?fnY0FPUN4e7q5g3GrtoDasB1iG+OKVGknQdq5SCrEz2h+92maYJGY7Jk0Yzc?=
 =?us-ascii?Q?FB1vBlMQ1nugsR7frqQIKTmTCp2lWDqjtVXagsEXmn8t3AqANgOSGCBnAd/A?=
 =?us-ascii?Q?l7J4OCtZUn7+qlAkXV4tFJ3WEDoi0/RVD1vD1dmkx/26pGHkL2rrgusFEt18?=
 =?us-ascii?Q?tkWZrQRZf8PtcOaz6wyRbtVaVMSt7WPEDe0vAXDMDGyZMt2A6xm+3zgvEspH?=
 =?us-ascii?Q?p3rIAYB9gminymBPO0Gzby15yc8QvuxNo7B+UGJOOP9xwQwCUEm7xiE1XuWQ?=
 =?us-ascii?Q?Ze2c2K2buxo/A6F7nwuTOjN9RFrzXVRvINpdmUfq0FgLpTVtB0a21vFiP7bD?=
 =?us-ascii?Q?BbR9l53oYwfPSi6qCEynCNrnstAAVEEGtdxZqwoCDf6PYItKCOByngwXPvPK?=
 =?us-ascii?Q?3N5FOj9udtNRuslFx+N/QdVauy/BLqeUpQc9mPW7KP1NCle1bZtKDmlSQbyu?=
 =?us-ascii?Q?6ffAeGcbivj20RwUuCoj/FB/ETm2RMzO8kpQqyXgJ22fW7Lb9+RbbWfA6L3P?=
 =?us-ascii?Q?GASW5XelC7WZhka4YaARyexBJCJCZTIeRGHxrx9pfnRQAghkZJOH4Zv2XHQT?=
 =?us-ascii?Q?UuxBUYeOnK0/DHifZCA3DuQPQsFdwDVNntRUuTK5tC9GGFh0Xce1LGETnHhL?=
 =?us-ascii?Q?uoSn1EO5Wm7GGHGjPz0I0USwO9taC6K6EfO5SsNfk1kgxPK6rBgxtYS7UJeS?=
 =?us-ascii?Q?r1X/RF7W5+Tu4i3+W3QFk0+xgqvMueznM2L/vy3stVPWNhFGxbPVsFYx0yhG?=
 =?us-ascii?Q?RX3bi9zO6+PAJJJNQuH7POIEkGr/pr5405ZT//uA0C6i5yycWKZfmNUOQEMm?=
 =?us-ascii?Q?tFNvmtvxP4dQyvH9hs+ZCmOuHOR420lyJJGkpC6wSVWKNTdXXUihx3KbhX5p?=
 =?us-ascii?Q?8M+BvF0wQn8/qDP/q8o7qJsl7NxredA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C5B9D754AD3A194AB8F1458BAFC76687@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef9cc3ef-698e-431e-3a4f-08da3d10ef1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2022 23:06:56.6122 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PaQZ5V9C3D1djsWtuutPNDZqbWh2ls2AyVwb6f9O2Pdf3LiRP3G2UeMDYHTjhSFArEZWb3gSIN1BCK5xnQoWfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB8135
X-Proofpoint-GUID: 9qZwc52mq6tBQNnPO9yijTO00aL78w_a
X-Proofpoint-ORIG-GUID: 9qZwc52mq6tBQNnPO9yijTO00aL78w_a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-23_10,2022-05-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205230118
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
Cc: "takken@us.ibm.com" <takken@us.ibm.com>,
 "zev@bewilderbeest.net" <zev@bewilderbeest.net>,
 Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "christian.walter@9elements.com" <christian.walter@9elements.com>,
 "joel@jms.id.au" <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, May 23, 2022 at 06:40:04AM PDT, Patrick Rudolph wrote:
>Introduce CONFIG_ASPEED_DEBUG_UART_TO_UART1 and reuse existing
>platform code to route the debug uart to RDX1/TDX1.
>This is required on IBM/Genesis3 as it uses RDX1/TDX1 as debug uart.
>
>Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
>Reviewed-by: Joel Stanley <joel@jms.id.au>
>---
> arch/arm/mach-aspeed/Kconfig            | 5 +++++
> arch/arm/mach-aspeed/ast2500/platform.S | 2 +-
> 2 files changed, 6 insertions(+), 1 deletion(-)
>
>diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
>index edb5520aec..a38f070381 100644
>--- a/arch/arm/mach-aspeed/Kconfig
>+++ b/arch/arm/mach-aspeed/Kconfig
>@@ -82,6 +82,11 @@ config ASPEED_ENABLE_DEBUG_UART
> 	  systems, but may be useful to enable for debugging during
> 	  development.
>
>+config ASPEED_DEBUG_UART_TO_UART1
>+	bool "Route debug UART to UART1"
>+	depends on ASPEED_AST2500
>+	help
>+	  Route debug UART to TXD1/RXD1 pins.

Any reason not to put this in 'if ASPEED_ENABLE_DEBUG_UART' as suggested
in the previous review?  And since that one already has the
ASPEED_AST2500 dependency, I think it'd obviate the need to have that
specified on ASPEED_DEBUG_UART_TO_UART1.

While we're at it, slightly more detail in the help text would good I
think, perhaps just "... instead of the default TXD5/RXD5."

Though actually, looking at the datasheet I'm now not certain if this
does exactly what I had been thinking previously -- if I'm understanding
it right, it's not so much switching the debug-UART functionality from
UART5 to UART1, it's re-routing UART5 itself to the I/Os typically used
for UART1?  Which seems somewhat different, and I guess would ultimately
be independent of the debug-UART itself being enabled or disabled, in
which case maybe what I said earlier wasn't entirely appropriate...maybe
someone with more expertise on the ast2500 UARTs (e.g. Andrew?) can
weigh in?

> endif
>
> config ASPEED_PALLADIUM
>diff --git a/arch/arm/mach-aspeed/ast2500/platform.S b/arch/arm/mach-aspee=
d/ast2500/platform.S
>index aef55c4a0a..a97ebebcca 100644
>--- a/arch/arm/mach-aspeed/ast2500/platform.S
>+++ b/arch/arm/mach-aspeed/ast2500/platform.S
>@@ -795,7 +795,7 @@ wait_ddr_reset:
>     /* end delay 10ms */
>
> /* Debug - UART console message */
>-#ifdef CONFIG_DRAM_UART_TO_UART1
>+#ifdef CONFIG_ASPEED_DEBUG_UART_TO_UART1
>     ldr   r0, =3D0x1e78909c                        @ route UART5 to UART =
Port1, 2016.08.29
>     ldr   r1, =3D0x10000004
>     str   r1, [r0]
>--=20
>2.35.3
>=
