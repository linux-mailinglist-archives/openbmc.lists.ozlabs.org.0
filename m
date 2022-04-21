Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 750AE5096F1
	for <lists+openbmc@lfdr.de>; Thu, 21 Apr 2022 07:43:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KkRKm3BVZz3bWG
	for <lists+openbmc@lfdr.de>; Thu, 21 Apr 2022 15:43:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=JlKTUfaU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=7110779bee=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256
 header.s=pps202002 header.b=JlKTUfaU; 
 dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkRJb13sZz2ypZ
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2022 15:42:38 +1000 (AEST)
Received: from pps.filterd (m0105197.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 23L1hBUf014288;
 Thu, 21 Apr 2022 05:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=eQIleAekFOnzsHdFPcfTn513mJPUWQDnddkFy7wVXcg=;
 b=JlKTUfaUIHdRlxs9l0HqFwUt9fkZ4In3RpAIiOXTSoavIoLW9meJ8uYpkH1ui9R973WU
 rTlQHbZy9QjdcoBPW2Ha4hj/7RB8djh4Z1cZafSJBVOpfYJgux4u92uX+h9qFnBbRtrT
 ZlNO6IFydXIIrkueyaIrhzcbEyD36ajwTZRRoF7SZV1l4Jz6hT8/7QLER0U1ti+CHzgA
 AqNHHVsBe7sSG1cxoPSyakuZE1EMjvRZnLPjheekF8VtYVuAcJfEDGjQVW02TqTwHlN7
 SpnvrzMPK7t/uMtd/+viEj7IYtbakyNpKMX1Ss0V3Qlok/E6clHjqPn4yUv2kpJOxR2M 1g== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
 by mx0a-00268f01.pphosted.com (PPS) with ESMTPS id 3fjwut0he3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Apr 2022 05:42:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mSj72TwaI+U4BG49gR7qYDUoza/YFnFZxOnnqQ3YUkwwPXyNDDBLkToPOOWU39NqsHTHjEO+R6/nqRwsIXd8JIKb1R+GCFMZQMi40xJ6+SapEvDc4z8ht8uH3fJt3XaURGLoQ7mvxhSW6avBB9/G89nGJV2rGLOYGe7l9vjrgkAqIcDhkJNi8Pj50xCyNEi347yeIH5PVuf8JsHjXK/rkIxxvPa+s4/LE1zrWIVQuJ8zybczpWHR2AU3Df3+xPQYnAjiH/TKt7CE2SO9OlLBBmj7ffwriq0Rp0euPmR+jbjJaWnjwf80x23WHYCJRn3qmjhaVZ3JyUCo34b1HY7TdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQIleAekFOnzsHdFPcfTn513mJPUWQDnddkFy7wVXcg=;
 b=l4VmBHJFP7p87KIPTQL4hVXu93ZuM3vjGK5UDOkT7cvCq9tdsp7xvEVurpMvZGTrE74d8ud+iiyZQhmpHwjq5gka/hUczZZ530bfGOvt+BRmdMjodgKLX0fGy5wV4js0n5XCwvBL8SSEsroHzBsSOwuGf5Ufpm8fvdDIGjFWXmbgjqSbbppQ9UZGPxezoFOnTT3DnRxh1xj0tiuxnz9htNw/vbOcqYQzuKbBjzDaCGKoIJkXTcm2pcGC+qvWyMkHK6+Y3XHRkLWBJw7RDPYrYCd58XkIYYkL100GVWViaF2d7L20ubn6FuqbxnwqhhVgmaMKeekG7WpPcMCsLBoglA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from CH0PR04MB8002.namprd04.prod.outlook.com (2603:10b6:610:f8::16)
 by SN6PR04MB3853.namprd04.prod.outlook.com (2603:10b6:805:44::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 05:42:32 +0000
Received: from CH0PR04MB8002.namprd04.prod.outlook.com
 ([fe80::9df7:c5d7:9aad:24f6]) by CH0PR04MB8002.namprd04.prod.outlook.com
 ([fe80::9df7:c5d7:9aad:24f6%7]) with mapi id 15.20.5186.014; Thu, 21 Apr 2022
 05:42:32 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Patrick Rudolph <patrick.rudolph@9elements.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 3/4] arm/mach-aspeed: Allow
 to disable WDT2
Thread-Topic: [PATCH u-boot v2019.04-aspeed-openbmc 3/4] arm/mach-aspeed:
 Allow to disable WDT2
Thread-Index: AQHYVUKYUdmkZXPUekqYFaAgKITfrQ==
Date: Thu, 21 Apr 2022 05:42:32 +0000
Message-ID: <20220421054232.GC11809@packtop>
References: <20220420102502.1791566-1-patrick.rudolph@9elements.com>
 <20220420102502.1791566-3-patrick.rudolph@9elements.com>
In-Reply-To: <20220420102502.1791566-3-patrick.rudolph@9elements.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e4f264c-63db-4b2c-ccd8-08da2359bb43
x-ms-traffictypediagnostic: SN6PR04MB3853:EE_
x-microsoft-antispam-prvs: <SN6PR04MB3853261120659B2CB812EA9AC3F49@SN6PR04MB3853.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gDVRmlPr6qdds4gn4YaRzodi+6FsRaXsaD+fnCQL3qO6ai/itnOJsFcjYg5Xds9mqvD04y5puxBl+G1riLfItYUg+D5c493OnbWt1XeN6DFVnfNpvwbzw+R6Fx+gQYmglmmzh3JnJoVBXH8Y/3JmlSbIFmKd/CpH3snWtcG9TB2FvtW5I+5Tobkedbo3bOwT3EsNIN/9Uoh0zjIkOGqcHrIxpYfs6K6e7zrHiTK0sF1soY8H0EkFEoe2OPbCp84/CDjGFbpDmYKT/kxtE+vdOJqNLNeMtUq65pbHIJT56MQeE6vvHH4UQuzwfQIcJj78hj+ukt3t6qlLdBec+4SVXvUcC8YWVjoLw8qlJjeob87U0C2wmSWE95djO3+FNDt5MIaBJVHNPhKIh18wJoG4DSBo0Y8rMYhvdTvaAO8EUooAIv4tWH0sa0l8tZOUUjAas5N1I1hQyfXhzJbbKl/+EOJIrLMtHEZ+epf3R8CSFjB23gawSqBV58yHfrnhZA9r/pknKMr3p8i7Yk/B3E8XMn0cy+nPxwE/4oMSgGFPNYYMfKVcrxUIBUPd7V2TkP/w0u9nBerBTpw39CZD5TLmXGwDHyCfp4lCRBfo2AJ1AGN+ijsYIkaCETzIWctn70jK7nqnXW2VP9wN1jCEXKBJoAK1289z29+FFlmyZAdkvU4fob/9p3M7PKOGumnqou29iiIrAU+VZg85oUFanxi1Dw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR04MB8002.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(4636009)(366004)(8936002)(83380400001)(66446008)(64756008)(508600001)(66556008)(4326008)(26005)(33716001)(2906002)(66476007)(91956017)(8676002)(33656002)(316002)(38100700002)(122000001)(76116006)(5660300002)(6486002)(6506007)(6916009)(6512007)(9686003)(186003)(1076003)(71200400001)(66946007)(54906003)(86362001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DwdJLL8a/qzGBqKJB7trgp6XLfLLXO2baAqCXJ+efpoK2BNRXNluHh7stXdA?=
 =?us-ascii?Q?x0m71GAE9P5WJToyfegcLitkrB07XJB3zZNimzJFYSqk/mmUC92BpxDqnWBS?=
 =?us-ascii?Q?HLH3G5HBvWxEPBTYuNPQCKciR3SibOe+8KQyN+cUFv/YOONtl6E0mYz4JAxo?=
 =?us-ascii?Q?U1Imv6SheIzZdzWSBspBHHa6kJsDkqPOLhNASzdM2WfzqAsAuZ8jXRFniRVH?=
 =?us-ascii?Q?qEfchx8bP94hQRD8d0cu2PoJhGybrSnmAp3VLYKcFwPHMzX5DuU4EtAPJWhI?=
 =?us-ascii?Q?zCAa4Wlh/kKs6ibKfWhgZoRiDQnXca4BTX7D/D8scEiOxpVNGJp0NkD7JHRT?=
 =?us-ascii?Q?CTavCs4KHL7iiqdvNU/Hbl+DSHT9EtRkeXzFTiBodW4kFUIom78PaLDyHbZd?=
 =?us-ascii?Q?3uq9Pekp46lL/A2Ob6B+QXc56gkANQ7SR1HRNljdVMU+c0rOBZZnqe3e83b7?=
 =?us-ascii?Q?plrnmOwbVOPGxbCbYJmrF8ZGhZLoozwd40p1mHikcX3MW4FE31fjc+fNl9J7?=
 =?us-ascii?Q?Yn/Z9GIwInuiSUOtJvsbYlm+Qml2JStxGEIUTMl2Tb95C3spc34bUMGfErMS?=
 =?us-ascii?Q?araSj4wH6VCts2yl8SOv7cjljoFh5EHYYmQ76mtqWgKDa8DYtu0z3WluGKY2?=
 =?us-ascii?Q?XMg04kVNfQXCXTbqoQT6gf2gV4icoAtSFnIco9OhiwW9wtHMQ9x6IyF6Y22k?=
 =?us-ascii?Q?KgyR+8ZpycHM3t5YgBGpHozwY9z+lnxR8NTntgoGnU0KdctVb1SFdNkquyxt?=
 =?us-ascii?Q?1C0m7SDdhXRegeVeY/15Y4ARP86NkBTbYCu4kmJOIhpHjyFbW6ddeg0RTw2b?=
 =?us-ascii?Q?wb5sHBvcjXH4LSOWqWEiqP5PVgFcD71imUPL6OfTkR4qaPW3Lqiio2Cave+7?=
 =?us-ascii?Q?rmDXk3wD8tGUqANvpXB69H6TjFmyBapuNJP91k5vejjRdAJZQT7eUJ+MvFmQ?=
 =?us-ascii?Q?HkFdhZ8E6N8iqwTAXhUoeQ6j7ni44PjLqvzoHclnGJx9haG81W3cJ+ySAmGZ?=
 =?us-ascii?Q?IspS46gnOTAv7r6Iq48IWugHAkrtBRMyVNuCTYyZGiCL3RqRAeRWazyH+MBk?=
 =?us-ascii?Q?QRbjUB2gfkP4fELjT6gHZqTYrbOTPsQjUAD9AzMeM+3Ohninqc+gwu6raJv/?=
 =?us-ascii?Q?QhQWc6De8tv/nD2AQH1L4J5w5FxHCw1gYumCF2Z+URUQOi5eaMSBm+429qPu?=
 =?us-ascii?Q?ZLTFdozXYN4jtEHrTYCEYlnHVHP6AZhZ4ydv2LVypc5ZWzgiha7zUZwvPLo5?=
 =?us-ascii?Q?zdVerJkEPASlonKjH9WNEP4G6Fj9S7ev36z72la8Q48pIK1GFYi6WGEGmLJB?=
 =?us-ascii?Q?1FZ1A61Qw0u/7Jo8iqLIFMxSzbpiVxpYCZoZVppNtkqxYzUVZshe4ZRYEnIv?=
 =?us-ascii?Q?O6VDg+kgWFGgks+5DuBGBhdhF93WIsUE5WZ71NbvrpyPjvAH45pR6YCbrG6R?=
 =?us-ascii?Q?jXZAlX0zolDRMBTRhW/BYCAuswHcJ2A9ZHK5fp1jbr5RyGPP/VDwLkTXHC/e?=
 =?us-ascii?Q?kSp7/dcFpoPXj24lSPKXZQLRzxI43Ijt7C36sdVG7jYTOVHAmT3aHt82M0Jb?=
 =?us-ascii?Q?ftZZ3cSvVwE2PyE9G4ryIWcks8djmuSk9WKEmEUphfEr+00u/10ndwZQ1sKx?=
 =?us-ascii?Q?eu8jaFe6kdl+pZi+BB/S8NNkCK09phoDrFBLavIfh3IO1V1gQuPPhTZ87oub?=
 =?us-ascii?Q?n3bfyoxJL/SmPSaiRMv8KqF4MU27ulKBlw2CASN37bafxAddOZJmzrgvDt6B?=
 =?us-ascii?Q?RdQZkh2MdLevF84Vdgj1b4vJiiTHHH0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9FA221015C7A3F45A0EC74BA716C8CB1@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR04MB8002.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e4f264c-63db-4b2c-ccd8-08da2359bb43
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 05:42:32.7034 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5hriyYhSngqvRsSVw/dloY1MYzz0iZ4Tb4ZtakTBQnBhL8AyfN4PLA8tRXKpVHPfArOmWBNRNhRPt+T07HAs8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB3853
X-Proofpoint-ORIG-GUID: bkTaQc5CzC8VOzYx-sJmdzXBz7YZIdKU
X-Proofpoint-GUID: bkTaQc5CzC8VOzYx-sJmdzXBz7YZIdKU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-20_06,2022-04-20_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 mlxlogscore=892 priorityscore=1501 clxscore=1011 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204210030
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
Cc: "christian.walter@9elements.com" <christian.walter@9elements.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Lei Yu <yulei.sh@bytedance.com>, "takken@us.ibm.com" <takken@us.ibm.com>,
 "joel@jms.id.au" <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Apr 20, 2022 at 03:25:01AM PDT, Patrick Rudolph wrote:
>There's no working code to poke the WDT2 and it takes too long for the
>kernel to load to poke the watchdog. Selecting this Kconfig disables
>the WDT2 and prevents 2nd firmware from being launched during normal boot.
>

I seem to recall Lei Yu (CCed) hitting problems with watchdog timeouts a
little while back, which I think ended up being due to caches being
disabled for some reason...have you done any measurements to try to
determine what's causing it to take so long?

>Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
>---
> arch/arm/mach-aspeed/ast2500/Kconfig    | 6 ++++++
> arch/arm/mach-aspeed/ast2500/platform.S | 6 ++----
> 2 files changed, 8 insertions(+), 4 deletions(-)
>
>diff --git a/arch/arm/mach-aspeed/ast2500/Kconfig b/arch/arm/mach-aspeed/a=
st2500/Kconfig
>index 232117b43c..a9d880e557 100644
>--- a/arch/arm/mach-aspeed/ast2500/Kconfig
>+++ b/arch/arm/mach-aspeed/ast2500/Kconfig
>@@ -33,6 +33,12 @@ config DRAM_UART_TO_UART1
> 	help
> 	  Route debug UART to TXD1/RXD1 pins.
>
>+config FIRMWARE_DISABLE_2ND_BOOT
>+	bool
>+	prompt "Do not disable WDT2 for 2nd boot function"
>+	help
>+	  Do not disable WDT2 for 2nd boot function.

This seems a bit confusing -- for one thing, the config symbol name and
the prompt/help text sound like opposites (one says "disable", the
others say "do not disable").  A slightly more detailed explanation
might be good.

>+
> source "board/aspeed/evb_ast2500/Kconfig"
> source "board/ibm/genesis3/Kconfig"
>
>diff --git a/arch/arm/mach-aspeed/ast2500/platform.S b/arch/arm/mach-aspee=
d/ast2500/platform.S
>index aef55c4a0a..3eb9ee9419 100644
>--- a/arch/arm/mach-aspeed/ast2500/platform.S
>+++ b/arch/arm/mach-aspeed/ast2500/platform.S
>@@ -95,7 +95,7 @@
>  *    CONFIG_DDR3_8GSTACK         // DDR3 8Gbit Stack die
>  *    CONFIG_DDR4_4GX8            // DDR4 4Gbit X8 dual part
>  * 5. Firmware 2nd boot flash
>- *    CONFIG_FIRMWARE_2ND_BOOT (Removed)
>+ *    CONFIG_FIRMWARE_DISABLE_2ND_BOOT
>  * 6. Enable DRAM extended temperature range mode
>  *    CONFIG_DRAM_EXT_TEMP
>  * 7. Select WDT_Full mode for power up initial reset
>@@ -642,13 +642,11 @@ bypass_USB_init:
> /************************************************************************=
******
>  Disable WDT2 for 2nd boot function
>  ************************************************************************=
******/
>-/*
>-#ifndef CONFIG_FIRMWARE_2ND_BOOT
>+#if CONFIG_FIRMWARE_DISABLE_2ND_BOOT
>     ldr   r0, =3D0x1e78502c
>     mov   r1, #0
>     str   r1, [r0]
> #endif
>-*/
> /************************************************************************=
******
>  Disable WDT3 for SPI Address mode (3 or 4 bytes) detection function
>  ************************************************************************=
******/
>--=20
>2.35.1
>=
