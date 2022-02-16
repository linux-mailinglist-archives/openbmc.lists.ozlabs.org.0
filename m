Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2094B83B4
	for <lists+openbmc@lfdr.de>; Wed, 16 Feb 2022 10:10:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzBxT0tmgz3bZY
	for <lists+openbmc@lfdr.de>; Wed, 16 Feb 2022 20:10:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=O4AW15Ru;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:febc::72e;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=neal_liu@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=O4AW15Ru; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on072e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::72e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzBwy6GM2z2yYJ
 for <openbmc@lists.ozlabs.org>; Wed, 16 Feb 2022 20:09:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uy8qihgEovR/T8FUb12ugWNreYf7aJrNj8xnZ4e/A+4yH8Q1rXjiT4oXJ6O8fjskVx19mSZF0dYzjm6/p6nl6/UQrU+Ak9kg5XJH+VrAly8JV8+ICNk/PBjTiHVYWr+XHWr0eO1f1RlGOJMUCvBr+KAAfIv9W9PCz48AmKSkJDxhgnhAzH3q9DEdOZA89HTaXVEBNpcB05AUxh1X1BC+mx1rzbqvq1osKLy9OetRD37X1lEZLwNvWLm2UiBr53VTfcTfZJrSSUdSEmPzQegFn3NffJVvEr9RwKuwheyNJEEBE0PDU0BqFHMMte60eSYbKHJSDT1fHtykQfgqNM1FFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBKl8Hjtm8MuIJOXAQ/T6IYyzyvDqu434Q1jeWPRj7U=;
 b=F+ZCIhEJ4YYtueGg6j2WN5mDVCvo0cu3eeuavFASH9uQoHA6hLK5k7qSQVzd3XpgNCmlbhMGImyt61ZhFOE4Y0Fvhb3nEma8tKgAIPaQcJ/G8KTLJ/+DUmThhtUe2PVp4zEPDZvBN2HHNqyrhBk5u5wX71Riu9wgFs1d/4vWv2QoQBY/1bih9ME4tE1eh7B/1iBJlwwN/A5GRd+IYnrWmeqJPffIiIwUZayvfyiNaxtlghxMmMx33pBEVwQ+iyYPIZyDCwKIZH+bLXXAeKp+xrxiP8EvhriUAquIg67GO/hMTMuJwnS++qyDFLmhr+0g+5KPLgSHuGPrRCZNY/FIUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBKl8Hjtm8MuIJOXAQ/T6IYyzyvDqu434Q1jeWPRj7U=;
 b=O4AW15Ru1olU0J41HrD3h3MBoslr4yyMAxRdp3vyfak6rtuVSl802se1OkkPe9+IpCU/XhLbof3V6RBltLOIBwyK2QT/UmSYNH6UQaxdyaIaCt+qwenawCSYVrXgm+y/QjuAqkIcJaYo4x5n/MJ46aQ80YFlG+ihWOtO8Bl5sjOhIFMLZCKeK0NuMiBMJJtak0GzsC29clm2cP0Y8vAs9+/VcoSTg0+MSlvdDuyOAGfOyZW5w3RewdlNKfwCzyYRE8M6mXjwXFCF97unDIXkTQqQrE1wvtjoRJDtjdRJvuU91MC0L0bE9cD5XwzCbgEwfkuxH5dEDYbecBVSDUXGNg==
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com (2603:1096:203:87::17)
 by PSAPR06MB4166.apcprd06.prod.outlook.com (2603:1096:301:32::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 16 Feb
 2022 09:09:13 +0000
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::c5e1:3ddf:613:ee69]) by HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::c5e1:3ddf:613:ee69%6]) with mapi id 15.20.4975.017; Wed, 16 Feb 2022
 09:09:13 +0000
From: Neal Liu <neal_liu@aspeedtech.com>
To: "cryptodev-linux-devel@gna.org" <cryptodev-linux-devel@gna.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [Issue Report] Kernel panic while running "openssl engine" within
 cryptodev kernel module inserted
Thread-Topic: [Issue Report] Kernel panic while running "openssl engine"
 within cryptodev kernel module inserted
Thread-Index: AdgjE4L2KHpmIEnzQBWrhZISpPBRAg==
Date: Wed, 16 Feb 2022 09:09:13 +0000
Message-ID: <HK0PR06MB320233BBB8CCC79F1809253F80359@HK0PR06MB3202.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3a4dc22-644f-4aab-e642-08d9f12c0014
x-ms-traffictypediagnostic: PSAPR06MB4166:EE_
x-microsoft-antispam-prvs: <PSAPR06MB41662F32AE2F1858397E56AB80359@PSAPR06MB4166.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XzbbcFvhUOSwu8vHDoI5NoY+DU+TgkwuhPAimx2LgKmPM/xXCb8AVX9jU3ot0HWniRDZM+NnVpfEPPJwQ1OeTeRV6fBYe2/mxRN9CYVe44SX39qVfKW5UjDT2e1ODK7qsDtzQ5uO+ureONAo1eVvW6a8Co4uKibzTMxw2sCPnvMxt+ZlQeATw/LEfXTm3Eonv9ht3eMG+h97TVq4v0cjj2Hnj9Vzco4IB+1vm7UvGIiidcKs05d39IfT9C+SHR/2N4ZKP8wkFXCMn/OvY5Ez4dOWiSTfg8GX5po7Y7HG+JA0XfAN0lRBXixYwHBdEIYz2+m3008hzIgIKULRjGXbaUmCJNidDxsq6j1XrQxDGF2DdYLvsU/js15QtbXQVAXDmwFG4bFbWHTShPWZGdXnPx+Q+kAnDHkCQH4YjREfxpZuoNUKE8QKsH33IOs0+7bWwfQBt061rxYwxBgC2zMMrfQ7Sozz0QX87SysCfTFADeLtSoBNlPJwMXrTwulqlIDUwI1TVG4b13hDF2yHWLkjbzE9EqZ1a6YlfjXFtrG42qqYVp9bzpxiJlrvEvfKbRAbGN584o4umKPXhN64LMtRTjclerCoD5zRUPctFqEaCAmSa+L/zpeNhERk4ioYO+UaLP3Cw2h0yaT2jWIjRHJJeVCBKJZm07N8fQsFsPykqx8rposqww0VxR5uUROnZmNkmbVUDohDWErqKaP69xMLQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3202.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(136003)(346002)(396003)(39850400004)(366004)(376002)(55016003)(52536014)(33656002)(9686003)(5660300002)(186003)(26005)(2906002)(38100700002)(38070700005)(8676002)(8936002)(66476007)(76116006)(66446008)(66946007)(66556008)(316002)(122000001)(107886003)(64756008)(110136005)(4326008)(71200400001)(86362001)(508600001)(7696005)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?W9v8Ftck1dTdEddtAa8qYMbuIoomPlGnj4BVtqU18M3FjPF/TDgvhtT0OKsP?=
 =?us-ascii?Q?wtQhz59T5x5VB0EXfv8DQmZ1++EpQWXzPHYrOlG75H+tCdF5IIpHmVL0Sw+L?=
 =?us-ascii?Q?hb6+nQ5ViVPL6DEZnfWyyINW3LNfhUTvcRfx0eJsUSft8kY78GCEHCaOONy6?=
 =?us-ascii?Q?M8oM4tnnYJwvNsY8V0s/6XdDDlqsWwzRBIQWbr1IWI2iOtdbzG0APYM4jg/C?=
 =?us-ascii?Q?Rtm8ImYqTFzuBK5rpLEJiEesHmjalXT3JHyJ/e9XOMDr7hPm34FNiZ9PEkEZ?=
 =?us-ascii?Q?KG3SWPSMH/F6qgTGkhMBx7dJU8tAgrndBWPLTjOOPcq550huFeeFWND+RVMe?=
 =?us-ascii?Q?BMMZ6+9fVuSE/8j4bLk6XoxXvS5+vedr26/UkKssY+3Rj+9mK8nrDHCFYZ9h?=
 =?us-ascii?Q?NJ2iOaRKc29osaojPMJWpthkz8X3ub9O4TS73e3NxR3J0XQxGUi2VoRJqIL7?=
 =?us-ascii?Q?IDSnOwA+A0o8fc7gwDL/bKZTyiSlNVlMTd0fT5HEg0/AMX43BSGfLLdEkGnG?=
 =?us-ascii?Q?vgIZ9qr4gI0SUuhI4bBieCbentSgU0LKvIhxNdyLSDWQ6l7PQNcuQSponAhs?=
 =?us-ascii?Q?48K6gs9Fc9YDgBSkhtZSbNMHLu/LLlca5Nkl4HQ58/IRGrBe/YSiDAgayZFu?=
 =?us-ascii?Q?zn8pxm1F298w/p6u+a5sZPCapfZiH722XKgf9gJ6DspM+an3Ko5Qz5BJlhsX?=
 =?us-ascii?Q?jbdy4d0OWxQIUdTBrm59UOAYkkPo2tA7DrmlY38naNHWHJDfV4Dvkkhzx7Hf?=
 =?us-ascii?Q?o/MHkwGirepvwH/wy0F7XLPo0ovkRLh6KVwz2Z4e0MjxzXrytyl0VhZvyKb+?=
 =?us-ascii?Q?TTnQRdZFIOivbrzk1PaIda/y2RPm/WUM8kcqUncys7Sk9yrPSbHhEbD0QM8U?=
 =?us-ascii?Q?uEb0pKT1PqFhNO5MgS1CohIFyDdVpdwg/O+UWVOkzAHcAvGFqygUypBiN0ZI?=
 =?us-ascii?Q?4cmTUWaByM8kv62gF6weQSlI3LCC7NSnaikh0IKoQbFan7Kk27pjvn3OXbYl?=
 =?us-ascii?Q?GN/jJG62mYmiPea3CoZWrbs33gwoX/2fMb1yCqRwa/Z+7/YPaTzcRJB6enSp?=
 =?us-ascii?Q?bGQnLv5lDDJs7K79v04XdNAf1rv4PMSPOuufZZ212kr/ufQ4Vy6MCbVdHV/m?=
 =?us-ascii?Q?+GRukcoFWXgpD8wcIrVKCD64TF79pwVBv0BmQaQeuzC1FGlmEbbiPPsBudPr?=
 =?us-ascii?Q?RHByki8w7gH0PHDt3QrGyXW2NBx7CewG4lttQOZi4a9w2SIbt+capOQ7epKB?=
 =?us-ascii?Q?KqaYxAiI6h6xSa076UbiuxdMLqWUhbER46jPnt0+d4xRlL/8mkVuZII0FXwE?=
 =?us-ascii?Q?JcL3otTFtG+Gk5r3qD81MH0YKgSMSm+LFHhLE2PykTC6UEQjeIwF/XRdzFMg?=
 =?us-ascii?Q?mNiNtqyY9i5O47l8bTj8dEfzzp4s6ryxcOyzpdU/2zvl4aE9cICCTgZtixAF?=
 =?us-ascii?Q?f2UKucL6ROSDGkEF7APKK+0X/sgs2TY85xDUhVohVAihRt2eULP3O48OMvl4?=
 =?us-ascii?Q?WlBX/h2r3cQ57WBdg0ogyYdu8kxO5VlItmYbCyevcm1nx0AxfI40+EWJCW8W?=
 =?us-ascii?Q?sKLn65i/bj9MH8LNoLKsmPijv9VgqOIyRWVnjCfGK6bG3hJvZIUYNOPK3lPh?=
 =?us-ascii?Q?Cy3iBc+bHDEgA8+FdTECUD4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3202.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3a4dc22-644f-4aab-e642-08d9f12c0014
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2022 09:09:13.1079 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mQ3zRz8YZ6tP6AKsQBBmdPHB4DsjzUMqgmDD7GfbyMG+nscsz+2rezPqNyZ+23449NL9Jrrkw41ahCLl+reFLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4166
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi all,

I would like to report an issue about OpenBMC + OpenSSL + Cryptodev-linux c=
ombination running on Aspeed ast2600 platform.
Kernel panic occurs while running "openssl engine" command. Will put more d=
etail logs below.

After digging in more, I figure out an workaround to avoid this issue.
I'm wondering whether this bug is related to gcc compiler or not?
Did anybody met this issue before?
Any suggestion is appreciated.

Workaround:
- Force enable CONFIG_GCC_PLUGINS config in Linux-5.15

Here are the detail steps to reproduce the issue:
1. Get latest OpenBMC source
* $ git clone git@github.com:openbmc/openbmc.git

2. Setup ast2600 target
* $ . setup evb-ast2600

3. Apply below patches to support openssl and cryptodev-linux kernel module=
s
* Linux defconfig
diff --git a/meta-aspeed/recipes-kernel/linux/linux-aspeed/aspeed-g6/defcon=
fig b/meta-aspeed/recipes-kernel/linux/linux-aspeed/aspeed-g6/defconfig
index 451afd81a..d4b0ba4d8 100644
--- a/meta-aspeed/recipes-kernel/linux/linux-aspeed/aspeed-g6/defconfig
+++ b/meta-aspeed/recipes-kernel/linux/linux-aspeed/aspeed-g6/defconfig
@@ -289,3 +289,4 @@ CONFIG_DEBUG_LIST=3Dy
 CONFIG_FUNCTION_TRACER=3Dy
 CONFIG_DEBUG_USER=3Dy
 # CONFIG_RUNTIME_TESTING_MENU is not set
+CONFIG_MODULES=3Dy

* Use hw engine
diff --git a/meta-phosphor/recipes-connectivity/openssl/openssl_%.bbappend =
b/meta-phosphor/recipes-connectivity/openssl/openssl_%.bbappend
index 0581dcd63..c51b8ecde 100644
--- a/meta-phosphor/recipes-connectivity/openssl/openssl_%.bbappend
+++ b/meta-phosphor/recipes-connectivity/openssl/openssl_%.bbappend
@@ -1,5 +1,6 @@
 # General config settings.
-EXTRA_OECONF:append:class-target =3D " shared no-hw no-err no-psk no-srp "
+EXTRA_OECONF:append:class-target =3D " shared no-err no-psk no-srp no-dyna=
mic-engine "

 # Disable SSL (keep TLS only).
 EXTRA_OECONF:append:class-target =3D " no-ssl2 no-ssl3 "

* Install libcrypto & libssl & openssl stuffs
diff --git a/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb b=
/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb
index 494b06c7c..4fa2efcad 100644
--- a/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb
+++ b/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb
@@ -52,3 +52,12 @@ ROOTFS_POSTPROCESS_COMMAND +=3D "remove_etc_version ; "
 # The shadow recipe provides the binaries(like useradd, usermod) needed by=
 the
 # phosphor-user-manager.
 ROOTFS_RO_UNNEEDED:remove =3D "shadow"
+
+IMAGE_INSTALL:append =3D " \
+    libcrypto \
+    libssl \
+    openssl \
+    openssl-bin \
+    openssl-conf \
+    openssl-engines \
+    "

* Enable cryptodev-linux
diff --git a/poky/meta/recipes-connectivity/openssl/openssl_3.0.1.bb b/poky=
/meta/recipes-connectivity/openssl/openssl_3.0.1.bb
index 7727ec43e..15fd68e8a 100644
--- a/poky/meta/recipes-connectivity/openssl/openssl_3.0.1.bb
+++ b/poky/meta/recipes-connectivity/openssl/openssl_3.0.1.bb
@@ -27,6 +27,7 @@ MULTILIB_SCRIPTS =3D "${PN}-bin:${bindir}/c_rehash"
 PACKAGECONFIG ?=3D ""
 PACKAGECONFIG:class-native =3D ""
 PACKAGECONFIG:class-nativesdk =3D ""
+PACKAGECONFIG:class-target =3D "cryptodev-linux"

 PACKAGECONFIG[cryptodev-linux] =3D "enable-devcryptoeng,disable-devcryptoe=
ng,cryptodev-linux,,cryptodev-module"
 PACKAGECONFIG[no-tls1] =3D "no-tls1"

4. Build obmc-phosphor-image & running on ast2600

5. Insert cryptodev kernel module
* $ modprobe cryptodev
i. [  136.485187] cryptodev: loading out-of-tree module taints kernel.
ii. [  136.494384] cryptodev: driver 1.12 loaded.

6. Running openssl engine to check hw engine is supported
* $ openssl engine

7. Kernel panic
root@ast2600-default:~# openssl engine
[  165.288203] Kernel panic - not syncing: stack-protector: Kernel stack is=
 corrupted in: cryptodev_ioctl+0xc60/0xd30 [cryptodev]
[  165.300953] CPU: 0 PID: 501 Comm: openssl Tainted: G           O      5.=
15.0-dirty-0e311ef17334 #1
[  165.310961] Hardware name: Generic DT based system
[  165.316307] Backtrace:
[  165.319038] [<80bc7708>] (dump_backtrace) from [<80bc7950>] (show_stack+=
0x20/0x24)
[  165.327507]  r7:80d665f8 r6:8100e768 r5:60000093 r4:80d7a02c
[  165.333819] [<80bc7930>] (show_stack) from [<80bcc48c>] (dump_stack_lvl+=
0x48/0x54)
[  165.342279] [<80bcc444>] (dump_stack_lvl) from [<80bcc4b0>] (dump_stack+=
0x18/0x1c)
[  165.350738]  r5:00000000 r4:811003a8
[  165.354722] [<80bcc498>] (dump_stack) from [<80bc7d48>] (panic+0x108/0x3=
30)
[  165.362504] [<80bc7c40>] (panic) from [<80bd516c>] (rcu_dynticks_inc+0x0=
/0x44)
[  165.370579]  r3:81538d80 r2:861e7200 r1:7f0024c0 r0:80d665f8
[  165.376893]  r7:8486c000
[  165.379714] [<80bd5150>] (__stack_chk_fail) from [<7f0024c0>] (cryptodev=
_ioctl+0xc60/0xd30 [cryptodev])
[  165.390223] [<7f001860>] (cryptodev_ioctl [cryptodev]) from [<80309f44>]=
 (sys_ioctl+0x570/0xc44)
[  165.400055]  r10:00000036 r9:00000003 r8:84b19f00 r7:76f15c60 r6:7ed8f72=
8 r5:84b19f00
[  165.408792]  r4:8004636a
[  165.411613] [<803099d4>] (sys_ioctl) from [<80100060>] (ret_fast_syscall=
+0x0/0x48)
[  165.420071] Exception stack(0x8486dfa8 to 0x8486dff0)
[  165.425712] dfa0:                   76f15b60 76f14824 00000003 8004636a =
76f15c60 00a82808
[  165.434842] dfc0: 76f15b60 76f14824 7ed8f728 00000036 00000003 76d30e5c =
7ed8fde0 00000000
[  165.443969] dfe0: 76f14944 7ed8f684 76e2d758 76cae67c
[  165.449609]  r10:00000036 r9:8486c000 r8:80100244 r7:00000036 r6:7ed8f72=
8 r5:76f14824
[  165.458337]  r4:76f15b60
[  165.461168] CPU1: stopping
[  165.464202] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G           O      5.=
15.0-dirty-0e311ef17334 #1
[  165.474205] Hardware name: Generic DT based system
[  165.479551] Backtrace:
[  165.482283] [<80bc7708>] (dump_backtrace) from [<80bc7950>] (show_stack+=
0x20/0x24)
[  165.490749]  r7:81418e40 r6:00000001 r5:600f0193 r4:80d7a02c
[  165.497061] [<80bc7930>] (show_stack) from [<80bcc48c>] (dump_stack_lvl+=
0x48/0x54)
[  165.505519] [<80bcc444>] (dump_stack_lvl) from [<80bcc4b0>] (dump_stack+=
0x18/0x1c)
[  165.513979]  r5:81006654 r4:811002c8
[  165.517963] [<80bcc498>] (dump_stack) from [<8010ff64>] (do_handle_IPI+0=
x2c8/0x2fc)
[  165.526511] [<8010fc9c>] (do_handle_IPI) from [<8010ffc0>] (ipi_handler+=
0x28/0x30)
[  165.534971]  r9:81552000 r8:bc80200c r7:81418e40 r6:00000014 r5:81006654=
 r4:814da200
[  165.543610] [<8010ff98>] (ipi_handler) from [<80187a6c>] (handle_percpu_=
devid_irq+0x8c/0x1e0)
[  165.553135] [<801879e0>] (handle_percpu_devid_irq) from [<80180e80>] (ha=
ndle_domain_irq+0x6c/0x88)
[  165.563150]  r7:00000004 r6:00000000 r5:00000000 r4:80f85030
[  165.569461] [<80180e14>] (handle_domain_irq) from [<80101230>] (gic_hand=
le_irq+0x78/0x8c)
[  165.578600]  r7:80f8503c r6:bc802000 r5:81553f38 r4:81006654
[  165.584911] [<801011b8>] (gic_handle_irq) from [<80100afc>] (__irq_svc+0=
x5c/0x78)
[  165.593269] Exception stack(0x81553f38 to 0x81553f80)
[  165.598904] 3f20:                                                       =
000a49a8 00000000
[  165.608035] 3f40: 00000001 8011c4e0 81552000 00000001 81005f50 81005f90 =
810ced6f 80d69660
[  165.617165] 3f60: 00000000 81553f94 81553f98 81553f88 80108df0 80108df4 =
600f0013 ffffffff
[  165.626294]  r9:81552000 r8:810ced6f r7:81553f6c r6:ffffffff r5:600f0013=
 r4:80108df4
[  165.634932] [<80108dac>] (arch_cpu_idle) from [<80bdd378>] (default_idle=
_call+0x38/0xc8)
[  165.643972] [<80bdd340>] (default_idle_call) from [<8015df78>] (do_idle+=
0xd8/0x144)
[  165.652526] [<8015dea0>] (do_idle) from [<8015e314>] (cpu_startup_entry+=
0x28/0x2c)
[  165.660988]  r9:410fc075 r8:8000406a r7:81553ff8 r6:10c0387d r5:00000001=
 r4:00000096
[  165.669627] [<8015e2ec>] (cpu_startup_entry) from [<80110530>] (secondar=
y_start_kernel+0x160/0x184)
[  165.679732] [<801103d0>] (secondary_start_kernel) from [<801016f0>] (__e=
nable_mmu+0x0/0x30)
[  165.689062]  r5:00000051 r4:8156806a

Other information:
root@ast2600-default:~# openssl version
OpenSSL 1.1.1g  21 Apr 2020

root@ast2600-default:~# modinfo cryptodev
filename:      /lib/modules/5.15.0-dirty-0e311ef17334/extra/cryptodev.ko
license:        GPL
description:    CryptoDev driver
author:        Nikos Mavrogiannopoulos <nmav@gnutls.org>
depends:
name:         cryptodev
vermagic:      5.15.0-dirty-0e311ef17334 SMP mod_unload ARMv7 p2v8
parm:         cryptodev_verbosity:0: normal, 1: verbose, 2: debug (int)

Thanks

Best Regards,
-Neal

