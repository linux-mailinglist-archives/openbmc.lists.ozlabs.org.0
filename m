Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6922A50F35
	for <lists+openbmc@lfdr.de>; Wed,  5 Mar 2025 23:55:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z7SXD2R7Fz3cgQ
	for <lists+openbmc@lfdr.de>; Thu,  6 Mar 2025 09:53:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=67.231.148.174 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741174159;
	cv=pass; b=IqM4beydP7DMqGcmIqyb7Da0UG0e+4ELxrylLymeTXwj0xpdjS3VaFSVqk7VSoB9cex9g8A1HCtERz0Knsbhp2pUEZbvDzgUArdj/X+ZYWgbQBXcOQAQKuJkQE8IPSnt7eBSWNYP6Uz/3I9vxQELhFM7iujIGnOB6J66/FN8Ol/viRrOelPjAs2AC3blX9NKraKDfPDmQpDakNvFHdfuRkT1LEbYkYzhXo51mVwfr/UOzizkk+Q9K6i+x2arlShLVYTVkw5aNdj6XJsDSBfPkONMRWUj86JKdoRrpJaFvo/wO9oRXxQO35LJeP6qNJ0Pb363NW2wkTLtv5gDvW7mDg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741174159; c=relaxed/relaxed;
	bh=YPp1vel9dIMVNZ4XREO8vw+ggMz1euv8uUjQtzAr+Js=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=La4/y3pYy3gUc04mCC1nSMgJaGV5pe3JY5xZwU9dVf9dFRjTyXntM6VifsMS4H6UwV1I8WKh74oXhN5vAi6vTU5bIrP+sKmZ17yeBXSD3Id2tALY7yy0Sivq36NLKsaDwGdgDg1c++zp1FhN8nCojbe8dbRfXZGwDibOSO64RpCKQBc6R1Pih4xncbi8KVZe5kyDu15l2/QRqncT0snqp60/Poj5bGg2PphTgQqgRpOiq8/+6fsr1sRzyo3gyiLH2EDbNAWwOcnn3D/uBZ7Awy+LCctl7sNWGbaXVyO6ixF6Th/wrrbIo2Vo04wpFDjIRln1CJD4ojORl8/J5YZRdg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=marvell.com; dkim=pass (1024-bit key; unprotected) header.d=marvell.com header.i=@marvell.com header.a=rsa-sha256 header.s=selector1 header.b=nl0JJTP0; dkim-atps=neutral; spf=pass (client-ip=67.231.148.174; helo=mx0a-0016f401.pphosted.com; envelope-from=gcherian@marvell.com; receiver=lists.ozlabs.org) smtp.mailfrom=marvell.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=marvell.com header.i=@marvell.com header.a=rsa-sha256 header.s=selector1 header.b=nl0JJTP0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=marvell.com (client-ip=67.231.148.174; helo=mx0a-0016f401.pphosted.com; envelope-from=gcherian@marvell.com; receiver=lists.ozlabs.org)
Received: from mx0a-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z79LQ46Slz3bsR;
	Wed,  5 Mar 2025 22:29:17 +1100 (AEDT)
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5253ve4M028541;
	Wed, 5 Mar 2025 03:28:44 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 456f5tgrna-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 03:28:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HvjwjM7meeeejMhm0NY2TqnCNCKKb5WlJ/thAU8qOp4fjT3DaW47xXP3UMlgNMu/Y+ql3Yi2wby2Z10MjR+te+3Svz3l8iWtl6TSEdpfEKljJZSl/9givK0QVjy4JLZscT5tpIKD8V3f5d/ljZenbk3FKKnm0bPHzWJ7CsL1v9TLIWlxDLgMP/cWEdxlqPKHgiP0pk1K9uQrUNdUA7NZwygZAKlPmgjBnnKNFN9C5p4bWJH7zQTZk9RDV3HDHsYMzQV0Q6rsJ3yDyORUH86cQpKZqCMMOg3m2XybRkvWR0FC7I8SO+f7VxSRJtVS7uYFfMXZND+Qxm/9HuLNWbEHyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YPp1vel9dIMVNZ4XREO8vw+ggMz1euv8uUjQtzAr+Js=;
 b=cs2fP/eWEQmw8YlkUcQsOnYi1cgTnRnCmjSmHTiX04AUyiC5d7NyOirFRzUCgXkpS2Kfuf/QAb5Crd8uNdzs+w+2QelPLEQVz7GLWkx2OS4uKYHlyDEU7D+MlUcdD2WikGCZNXnfbc2SiwXnkCi1vcIeSGYo3nSJkMHHnSjY3Vn5U82c/M7xM74Y5jR1m7Xb36Omjdj/78xiMB6HCFOBqwLTdk3TOZmlktPb6Dx0T+u/pSV22KNHlXenAseeFlkGG8QH4S4HU00Hh/gNO9HM9E7tRgSUvrYhEoCrN8nouYCdSveFawSpZ2GlNFhwlHiRv6tVw8zPSYTT+0hMrSapEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YPp1vel9dIMVNZ4XREO8vw+ggMz1euv8uUjQtzAr+Js=;
 b=nl0JJTP0/FSqA7UbX3qUG+7ZcKNtz3v5lYGY/lMMLm1m1sHjGYlun9O4qkRIr5rVKQ8qAWnDX3DcNffL1j6L4ll2sxnGT1ml2gaGBy7cUKhKNBR0pvuYf2lWQoRI9wn2jE0TKQVAiR4vmrZt1nPoCSrC4mL6rkqumYtbOQMFp0Y=
Received: from PH8PR18MB5381.namprd18.prod.outlook.com (2603:10b6:510:254::16)
 by SJ0PR18MB5185.namprd18.prod.outlook.com (2603:10b6:a03:438::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 11:28:41 +0000
Received: from PH8PR18MB5381.namprd18.prod.outlook.com
 ([fe80::79aa:7ee4:516e:200a]) by PH8PR18MB5381.namprd18.prod.outlook.com
 ([fe80::79aa:7ee4:516e:200a%6]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 11:28:40 +0000
From: George Cherian <gcherian@marvell.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>,
        "linux@roeck-us.net"
	<linux@roeck-us.net>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "jwerner@chromium.org" <jwerner@chromium.org>,
        "evanbenn@chromium.org"
	<evanbenn@chromium.org>,
        "kabel@kernel.org" <kabel@kernel.org>,
        "krzk@kernel.org" <krzk@kernel.org>,
        "mazziesaccount@gmail.com"
	<mazziesaccount@gmail.com>,
        "thomas.richard@bootlin.com"
	<thomas.richard@bootlin.com>,
        "lma@chromium.org" <lma@chromium.org>,
        "bleung@chromium.org" <bleung@chromium.org>,
        "support.opensource@diasemi.com"
	<support.opensource@diasemi.com>,
        "shawnguo@kernel.org"
	<shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com"
	<festevam@gmail.com>,
        "andy@kernel.org" <andy@kernel.org>,
        "paul@crapouillou.net" <paul@crapouillou.net>,
        "alexander.usyskin@intel.com"
	<alexander.usyskin@intel.com>,
        "andreas.werner@men.de"
	<andreas.werner@men.de>,
        "daniel@thingy.jp" <daniel@thingy.jp>,
        "romain.perier@gmail.com" <romain.perier@gmail.com>,
        "avifishman70@gmail.com"
	<avifishman70@gmail.com>,
        "tmaimon77@gmail.com" <tmaimon77@gmail.com>,
        "tali.perry1@gmail.com" <tali.perry1@gmail.com>,
        "venture@google.com"
	<venture@google.com>,
        "yuenn@google.com" <yuenn@google.com>,
        "benjaminfair@google.com" <benjaminfair@google.com>,
        "maddy@linux.ibm.com"
	<maddy@linux.ibm.com>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
        "npiggin@gmail.com" <npiggin@gmail.com>,
        "christophe.leroy@csgroup.eu"
	<christophe.leroy@csgroup.eu>,
        "naveen@kernel.org" <naveen@kernel.org>,
        "mwalle@kernel.org" <mwalle@kernel.org>,
        "xingyu.wu@starfivetech.com"
	<xingyu.wu@starfivetech.com>,
        "ziv.xu@starfivetech.com"
	<ziv.xu@starfivetech.com>,
        "hayashi.kunihiko@socionext.com"
	<hayashi.kunihiko@socionext.com>,
        "mhiramat@kernel.org" <mhiramat@kernel.org>
Subject: RE: [EXTERNAL] Re: [PATCH v4 0/2] Add stop_on_panic support for
 watchdog
Thread-Topic: [EXTERNAL] Re: [PATCH v4 0/2] Add stop_on_panic support for
 watchdog
Thread-Index: AQHbjbbhYskiwjLbuEyH2TqW0Jv7Q7NkWviAgAAHyoA=
Date: Wed, 5 Mar 2025 11:28:40 +0000
Message-ID:  <PH8PR18MB53817EC09B918852B78DF3AAC5CB2@PH8PR18MB5381.namprd18.prod.outlook.com>
References: <20250305101025.2279951-1-george.cherian@marvell.com>
 <43fb0965-04b7-41dc-ae3f-54676eefdbb5@pengutronix.de>
In-Reply-To: <43fb0965-04b7-41dc-ae3f-54676eefdbb5@pengutronix.de>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR18MB5381:EE_|SJ0PR18MB5185:EE_
x-ms-office365-filtering-correlation-id: 2568772b-fec1-4e16-a498-08dd5bd8e159
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018|921020;
x-microsoft-antispam-message-info:  =?utf-8?B?eWYwbUw3bHpPcFVnM0NldTl4UmEwVHdRWVN4bGxwMzVtamVpOHNURlY2VDJZ?=
 =?utf-8?B?anlhVG5aMVNYRmQ2V21IcXJmK3NZZUozcm91K3ZlaThwV3Jydi9HeFZRdzk5?=
 =?utf-8?B?NGU3ZEhHY3c2ZmZ1SllmRFVYaU1vM05NVVptbEd3Ni9rbnA2ZXRZOUZsZkFM?=
 =?utf-8?B?dGVkODZQVDF3Y1FFY3Q0czVTTk94MDVBeWN3Y2JLZlBmMHNkaEVoMldjV0p0?=
 =?utf-8?B?VmVXbUdtakpWbWNXVjhBTFhaZ2JHalF2WnR0TTlnSjhCd25yVXc2aUxsUlJZ?=
 =?utf-8?B?aWdTTEtsakpDMERPYnFQZ0tOdGRERlZHQlNidmZqcEI4TXhBaVJhcXFrMFJn?=
 =?utf-8?B?bDlST0pHWktoZXUxRUUwV0ZRSm9BbDVIR2pkTkNTc3ZaR0VRbmwzdk1pSVBH?=
 =?utf-8?B?R3lNSno3R2VvS3AwenF3MlZUQzdIcVVtcUdBVHkraFU5TDg3a0lWaTdEUEJL?=
 =?utf-8?B?WTNUOGtZejVJMHdiNTdKMVlGRmorMG02K1JkNko2MzRudGxWaWlrMHpqekNl?=
 =?utf-8?B?UjJsT1VTdktDa056elgrc29RZVZUdlRnL3hwK3JBdFFxMVZFaXU4RDNBN0pT?=
 =?utf-8?B?b200c3pwdHgxZEpvc2sxWS9kenFldnhYY0tESFJCSUpySlJwZXVpYkhIZnZo?=
 =?utf-8?B?Q0dIM05pYTFDMW1qdmZRVkc1aTM3NVF0dXRmTmlDQW1IQ0xWUG51d0ZUaVNh?=
 =?utf-8?B?TW1LbW5MbXg0ZU53cWpUU0xoNG9NelJLOS9Na1JRWFRVelo2YjRTKzIzNUF0?=
 =?utf-8?B?WExDbGJMQXFMUGwwOERsa2EwSFNRaUdDUk9KNkpsY2lIdVdiMWtJRHBZVHFW?=
 =?utf-8?B?b3NLYjVlOHIxcnlKUWRuTXdkTmtvaHl6Z1dBeHJmQmFSckduSnZjL3pWaW5K?=
 =?utf-8?B?Z25vMXJGdFJJNTFvUmIwYjlnVkxsOUFRRjhEOTZpVlNTdWYveEkveE9KVnlC?=
 =?utf-8?B?d25nUkplcjdWREdRNm5Id09zaWorKzE0TUpmeS83UW9WNXJtWTdhRmxibXVh?=
 =?utf-8?B?YUg1Q1QwQXVMRVpHT2F6NTJPdVhVSVQyWkJ5MlI4eWthcTVpRzJSdFduVDdH?=
 =?utf-8?B?Tzk3dGs0UXpzTUhPRjVPcC9nbmVScWxFckVSK0htUzM2R2J0QjBTcC9KeG0y?=
 =?utf-8?B?YzJOdHUzRFMzMHRuRWVGdmtYOEZ4ajV0a0J1NWZqeW1Qd1ZhOEFib2dDZ1A5?=
 =?utf-8?B?TnJlYnRhQ01MUjB5cEIyRm9QOTlwUUV1THNUSHUrajREei9CYW92TW1mdFFI?=
 =?utf-8?B?WTVaSEpXa1FyRTRlend6RHVTZmoybjArNEdlb2VGWUVneW03QVNWUWpXWEdu?=
 =?utf-8?B?eExWVXIvVFNUUE1ySkhrN2ZDWi9IVjhCcDlBcnVsU0M2VG5sU3FUZ1hJM1Z4?=
 =?utf-8?B?WUxNUVh1ZGc3K3lCWUZ5K1Vjb21qblVPaGp6bnVLeGRBYnM3Z1UvU0t5KzF1?=
 =?utf-8?B?U01VTC9hMW5ualp0OWJTVUxGNzNIWHErK1BIYlA2M2Jza1F0NHZWUFQ0emNT?=
 =?utf-8?B?R2N4MGtSVlBRdlhRYjlHSDduTm1sekhIUHpNRUplTFo2dmxRQmFrU21HdEJr?=
 =?utf-8?B?Uko2Zk5GeGJBQWJ5OTNmRmlpTC9XMXRBRmdCUWRBZ3U3ZkJWdkllQ2hMK3ly?=
 =?utf-8?B?UXAraGliNDFnV1hMU1JzZks0dHo5dHVmVitDRUhWeGdSR2JyRG4rY1ZtS1l6?=
 =?utf-8?B?NUtoV2hjVDhybG9sdndmNEsvQys4QWVXM1QxMjNYai9JK21teGZTaUJuQktC?=
 =?utf-8?B?SkVlWUJ2ZGJIVGV2Zlk5VFhRWFdpRHl4THlYc3ZnTjNZTXAvT2E1WUtmbjk3?=
 =?utf-8?B?YkdSZ0RIbnpnbVl2V0JrMEJwRk1DaGl6bno0TzdGN2dPZnBDRlhKakZnYU81?=
 =?utf-8?B?YVQ1N3pHS0gzVWl4ZWZockpTd2ZBNmVvZzFzNUNwZFFCMDRxSEJmS3R4OFFp?=
 =?utf-8?B?bWNyYTA3Nk1sRmcxdnFEUDNrNEFkNXRqZ2ZHWGJuU2QwUzUxdXMxOTJ2RThm?=
 =?utf-8?B?S2dETHlmVzF3PT0=?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR18MB5381.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SFF2TXFlVXdJSEZVallsa1hMK3R1N1pMMHphZ3VGSXBIOWd3MzQ5bkNrcnpi?=
 =?utf-8?B?NnZHYjhsYnVxbXVUZ1QyMFdKbGZsSTZqcUlMb3Jhb3hjaExqUzB4VmErVHdX?=
 =?utf-8?B?VW9rbVFSNk9JOU5lRDFlSzh1ZW5UeWVDbGpqNTEvSi8wN0FJWk9NblpZRVVV?=
 =?utf-8?B?TDZhTW1nTkNrcWd1YXkvTDBmaUFQNFpzdDI2RUhmS3R3aGFZSjE5ZWZyUGVm?=
 =?utf-8?B?Tjd1Um5GYXRLVjR6c2FSVERJc1d1b3hNYWc2allUWmRFS3pqZGNBOVVmdTU3?=
 =?utf-8?B?WktQcFYrZnJMS1pPN0FQMDl2UlI3UzRVd2pvVTFZcVVaZlN2Vmp0b0g0ekRW?=
 =?utf-8?B?bXdLVzlSS0ZKcFBPdm9wckIreFpYemNMZmNQb0thMHFibkJMTFM5RDZXaXo4?=
 =?utf-8?B?WjFlZHBtVGx6dDFRMWxwUU1QNVMwWTFHNWhoeWxJL3hnYVdtanpTRUdISC9r?=
 =?utf-8?B?blp5RGZ4NXVpOGtaVkhqNXVrYXluY2ZkODkwT0hUVVlZZVc1MHVoSWZKaCtX?=
 =?utf-8?B?akk1dW5mQ1RhUGw0WjRqV0o3QXNxc1FvNlJQY0JRZDNxc0UyaWlteFNJeFVF?=
 =?utf-8?B?cnlya0RrSjlhbzNlbFJHM2pGR2xVM0FGZ1lWNmVBRXZoaVVGQkhESkszWFJX?=
 =?utf-8?B?Ykwvc1cxdUVUdjQvOHQwa2gyRzFrQW1meTZIR2NlRittNFJpbzRiMFBKS3Ax?=
 =?utf-8?B?QmU5bXNQMzQ3YW1YVVRaODJLcnVXU0ZjK0szRzYrSFpaWGE2ak1ldVpMM0t3?=
 =?utf-8?B?M1FROTRLOS9SS1F3dUtobkJmNUhLRk1ybU1FNHhaL1hSNGZBeThTVlFkeFYx?=
 =?utf-8?B?Q3ZPd1N4aWVIQUZObER0Wmo1aC9KMlNSZ1IyRlpWQ1JSMWg2Y2VlMXpKeFVE?=
 =?utf-8?B?SkpkUEtXQktISkEveGVXRFhGRE1tUWtyMklNY2dHQ0h5SkFPOGI5N21TS0Yw?=
 =?utf-8?B?SlkwaDViUkN4QW5CODZCQnVwaWVvNmlvOHc2bThTSjdGUFVXS1QwenZnWlI4?=
 =?utf-8?B?T1VTT1c3cllXR1BwSW9IWXJWcnRxTzlWTEVkZkgxRmVacnNkZkQ3b2F1WjYz?=
 =?utf-8?B?TU1MTy80WlUvZWNYQlZqV0huUWoxK2Q5QkcxaTVqUCtSODd1elQrcnNnUFZi?=
 =?utf-8?B?UUFUTWFINTVkc2J4WXI1b3lvUHZaalVtQzNuR2RESm1WekZNanlOWVRkZnFa?=
 =?utf-8?B?RzRDWlU4YmtuM0RhTFgvblZZZEVrNUlNemgrRHdScVdaNmk5aWd2NG9vSGVO?=
 =?utf-8?B?TlNqZ3JNa2pyc2MxbjA1VlZSdng4MGhTSitabUZRYUEyS0l4SkxNQ0VtWlpF?=
 =?utf-8?B?YlU1bVN3M1NiSnVsZW1Ya1VOUUlabmZBQm1SUE9VVy9IYnNqdVlSQjNEYkp0?=
 =?utf-8?B?MEpRT0Nxdk1VR015WSt5M25jb1hHbStveEFTT3pqdGxOWWRTWU4xK1NmTjRF?=
 =?utf-8?B?YjNrUGRJMUUzSHk0TlpQVEMwZEpVNjd1QnV1dzBQNWF5WUpXRDBDcU83UzFO?=
 =?utf-8?B?aTlQTmh2Mmxqck5kQUFsQmJFa1VrL2pReGcraXB2WnBUbXRWeVV1NjFXUjBX?=
 =?utf-8?B?Mlh5d1RoWU5CYXk5SzM4TENibTdkdklPYmY5TC94RHUxUEJuTWlzVVptcTQ3?=
 =?utf-8?B?OFVDUnpwdFFoWXh1RHh5ZzBNTFhyMnR4djc3K2NTb2s1SXNxMEkyWVdFN1FR?=
 =?utf-8?B?UXVjeVBSaGIzU1RDRDdSaTVDMlB0ZDRyQWZhMUpWS0ZneHd2aWlBSlM1Q282?=
 =?utf-8?B?WGJmWGdMUWdMWlRzZ2xDUUNMaytSa1UzVGM4dHNCR2R4azU1M2xTdUlZS1Vu?=
 =?utf-8?B?VzVURjVBTXZmTmFWeGJGUWN3Nit6N2ZTZTV6anpVdUZYd0VVb0xUNzNzOCtX?=
 =?utf-8?B?U0xwMWFNM3MreUNzdnltaWpvdzFmUnhYdDZFTmpZb296QXdmMHdDOHM4UUE0?=
 =?utf-8?B?M3NEcGM5N3NZQi8yYnZ1M3g3RW5pcE02YkZPejA2RTg0d3RtdEQyYmdLYmZk?=
 =?utf-8?B?YUFRM2tIZllDRHltMG11QlZvRVZPOW4vU3FXK0ZYYmo2VEowRGRnZzNwZm1C?=
 =?utf-8?B?NWRCRVRjQUVDNXU2NFVHNzNFNVozTUcvQUZnTml4S1Qvc1hiUWVPWHE2RE5N?=
 =?utf-8?Q?Jwja+g6LBGPDz6SJ+x9eq6eYs?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR18MB5381.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2568772b-fec1-4e16-a498-08dd5bd8e159
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 11:28:40.7652
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ufy7/Zq7oiJtcuN5pluWq8+F+Gve91Lmp+qo/rqXeY4KA8sZ93FWqjTO4VjJXKi7eMqshnV+5LRZVcBez1IRFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR18MB5185
X-Proofpoint-GUID: UaoU_NmBeNyw4DV5z8_j6mNx_BWFuKA9
X-Authority-Analysis: v=2.4 cv=JtULrN4C c=1 sm=1 tr=0 ts=67c8356c cx=c_pps a=5b96o3JgDboJA9an2DnXiA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=-AAbraWEqlQA:10 a=zEsxOR96UoKnfDorJPwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: UaoU_NmBeNyw4DV5z8_j6mNx_BWFuKA9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_04,2025-03-05_01,2024-11-22_01
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 06 Mar 2025 09:52:58 +1100
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
Cc: "chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQWhtYWQsDQo+SGkgR2VvcmdlLA0KPiBPbiAwNS4wMy4yNSAxMToxMCwgR2VvcmdlIENoZXJp
YW4gd3JvdGU6DQo+PiBUaGlzIHNlcmllcyBhZGRzIGEgbmV3IGtlcm5lbCBjb21tYW5kIGxpbmUg
b3B0aW9uIHRvIHdhdGNoZG9nIGNvcmUgdG8NCj4+IHN0b3AgdGhlIHdhdGNoZG9nIG9uIHBhbmlj
LiBUaGlzIGlzIHVzZXVsIGluIGNlcnRhaW4gc3lzdGVtcyB3aGljaCBwcmV2ZW50cw0KPj4gc3Vj
Y2Vzc2Z1bCBsb2FkaW5nIG9mIGtkdW1wIGtlcm5lbCBkdWUgdG8gd2F0Y2hkb2cgcmVzZXQuDQo+
PiANCj4+IFNvbWUgb2YgdGhlIHdhdGNoZG9nIGRyaXZlcnMgc3RvcCBmdW5jdGlvbiBjb3VsZCBz
bGVlcC4gRm9yIHN1Y2gNCj4+IGRyaXZlcnMgdGhlIHN0b3Bfb25fcGFuaWMgaXMgbm90IHZhbGlk
IGFzIHRoZSBub3RpZmllciBjYWxsYmFjayBoYXBwZW5zDQo+PiBpbiBhdG9taWMgY29udGV4dC4g
SW50cm9kdWNlIFdESU9GX1NUT1BfTUFZU0xFRVAgZmxhZyB0byB3YXRjaGRvZ19pbmZvDQo+PiBv
cHRpb25zIHRvIGluZGljYXRlIHdoZXRoZXIgdGhlIHN0b3AgZnVuY3Rpb24gd291bGQgc2xlZXAu
DQo+DQo+RGlkIHlvdSBjb25zaWRlciBoYXZpbmcgYSByZXNldF9vbl9wYW5pYyBpbnN0ZWFkLCB3
aGljaCBzZXRzIGEgdXNlci1zcGVjaWZpZWQNCj50aW1lb3V0IG9uIHBhbmljPyBUaGlzIHdvdWxk
IG1ha2UgdGhlIG1lY2hhbmlzbSB1c2VmdWwgYWxzbyBmb3Igd2F0Y2hkb2dzDQoNCi9wcm9jL3N5
cy9rZXJuZWwvcGFuaWMgYWxyZWFkeSBwcm92aWRlcyB0aGF0IHN1cHBvcnQuIFlvdSBtYXkgZWNo
byBhIG5vbi16ZXJvIHZhbHVlIA0KYW5kIHRoZSBzeXN0ZW0gdHJpZXMgZm9yIGEgc29mdCByZWJv
b3QgYWZ0ZXIgdGhvc2UgbWFueSBzZWNvbmRzLiBCdXQgdGhpcyBkb2Vzbid0IGhhcHBlbiANCmlu
IGNhc2Ugb2YgYSBrZHVtcCBrZXJuZWwgbG9hZCBhZnRlciBwYW5pYy4NCj50aGF0IGNhbid0IGJl
IGRpc2FibGVkIGFuZCB3b3VsZCBwcm90ZWN0IGFnYWluc3Qgc3lzdGVtIGxvY2sgdXA6IA0KPkNv
bnNpZGVyIGEgbWVtb3J5LWNvcnJ1cHRpb24gYnVnIChwZXJoYXBzIGV4dGVybmFsbHkgdmlhIERN
QSksIHdoaWNoIHBhcnRpYWxseQ0KPm92ZXJ3cml0ZXMgYm90aCBtYWluIGFuZCBrZHVtcCBrZXJu
ZWwuIFdpdGggYSBkaXNhYmxlZCB3YXRjaGRvZywgdGhlIHN5c3RlbQ0KPm1heSBub3QgYmUgYWJs
ZSB0byByZWNvdmVyIG9uIGl0cyBvd24uDQoNClllcywgdGhhdCBpcyB0aGUgcmVhc29uIHdoeSB0
aGUga2VybmVsIGNvbW1hbmQtbGluZSBpcyBvcHRpb25hbCBhbmQgYnkgZGVmYXVsdCBpdCBpcyBz
ZXQgdG8gemVyby4NClNvIHRoYXQgaW4gY2FzZXMgaWYgeW91IGhhdmUgYSBjb3JydXB0ZWQga2R1
bXAga2VybmVsIHRoZW4gd2F0Y2hkb2cga2lja3MgaW4uDQo+DQo+SWYgeW91IGRpZCBjb25zaWRl
ciBpdCwgd2hhdCBtYWRlIHlvdSBkZWNpZGUgYWdhaW5zdCBpdD8NCndhdGNoZG9nLnN0b3Bfb25f
cGFuaWM9MSBpcyBzcGVjaWZpY2FsbHkgZm9yIHN5c3RlbXMgd2hpY2ggY2FuJ3QgYm9vdCBhIGtk
dW1wIGtlcm5lbCBkdWUgdG8gdGhlIGZhY3QgDQp0aGF0IHRoZSBrZHVtcCBrZXJuZWwgZ2V0cyBh
IHdhdGNoZG9nIHJlc2V0IHdoaWxlIGJvb3RpbmcsIG1heSBiZSBkdWUgdG8gYSBzaG9ydGVyIHdh
dGNoZG9nIHRpbWUuDQpGb3IgZWc6IGEgMzItYml0IHdhdGNoZG9nIGRvd24gY291bnRlciBydW5u
aW5nIGF0IDFHSHouDQpyZXNldF9vbl9wYW5pYyBjYW4gZ3VhcmFudGVlIG9ubHkgdGhlIGxhcmdl
c3Qgd2F0Y2hkb2cgdGltZW91dCBzdXBwb3J0ZWQgYnkgSFcsIA0Kc2luY2UgdGhlcmUgaXMgbm8g
b25lIHRvIHBpbmcgdGhlIHdhdGNoZG9nLiANCj4NCj5UaGFua3MsDQo+QWhtYWQNCj4NCj4+IA0K
Pj4gDQo+IENoYW5nZWxvZzoNCj4gdjEgLT4gdjINCj4gLSBSZW1vdmUgdGhlIHBlciBkcml2ZXIg
ZmxhZyBzZXR0aW5nIG9wdGlvbg0KPiAtIFRha2UgdGhlIHBhcmFtZXRlciB2aWEga2VybmVsIGNv
bW1hbmQtbGluZSBwYXJhbWV0ZXIgdG8gd2F0Y2hkb2dfY29yZS4NCj4gDQo+IHYyIC0+IHYzDQo+
IC0gUmVtb3ZlIHRoZSBoZWxwZXIgZnVuY3Rpb24gd2F0Y2hkb2dfc3RvcF9vbl9wYW5pYygpIGZy
b20gd2F0Y2hkb2cuaC4NCj4gLSBUaGVyZSBhcmUgbm8gdXNlcnMgZm9yIHRoaXMuIA0KPiANCj4g
djMgLT4gdjQNCj4gLSBTaW5jZSB0aGUgcGFuaWMgbm90aWZpZXIgaXMgaW4gYXRvbWljIGNvbnRl
eHQsIHdhdGNoZG9nIGZ1bmN0aW9ucw0KPiAgIHdoaWNoIHNsZWVwIGNhbid0IGJlIGNhbGxlZC4g
DQo+IC0gQWRkIGFuIG9wdGlvbnMgZmxhZyBXRElPRl9TVE9QX01BWVNMRUVQIHRvIGluZGljYXRl
IHdoZXRoZXIgc3RvcA0KPiAgIGZ1bmN0aW9uIHNsZWVwcy4NCj4gLSBTaW1wbGlmeSB0aGUgc3Rv
cF9vbl9wYW5pYyBrZXJuZWwgY29tbWFuZCBsaW5lIHBhcnNpbmcuDQo+IC0gRW5hYmxlIHRoZSBw
YW5pYyBub3RpZmZpZXIgb25seSBpZiB0aGUgd2F0Y2hkb2cgc3RvcCBmdW5jdGlvbiBkb2Vzbid0
DQo+ICAgc2xlZXANCj4gDQo+IEdlb3JnZSBDaGVyaWFuICgyKToNCj4gICB3YXRjaGRvZzogQWRk
IGEgbmV3IGZsYWcgV0RJT0ZfU1RPUF9NQVlTTEVFUA0KPiAgIGRyaXZlcnM6IHdhdGNoZG9nOiBB
ZGQgc3VwcG9ydCBmb3IgcGFuaWMgbm90aWZpZXIgY2FsbGJhY2sNCg0KLSBHZW9yZ2UNCg==
