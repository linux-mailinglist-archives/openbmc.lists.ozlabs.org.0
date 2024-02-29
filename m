Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A74986D685
	for <lists+openbmc@lfdr.de>; Thu, 29 Feb 2024 23:04:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=asus.com header.i=@asus.com header.a=rsa-sha256 header.s=asuscom header.b=fuAGs2zY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tm4y40d8Qz3vbH
	for <lists+openbmc@lfdr.de>; Fri,  1 Mar 2024 09:04:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=asus.com header.i=@asus.com header.a=rsa-sha256 header.s=asuscom header.b=fuAGs2zY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=asus.com (client-ip=103.10.4.13; helo=ms.asus.com; envelope-from=prvs=782c5d7c4=kelly_hung@asus.com; receiver=lists.ozlabs.org)
Received: from ms.asus.com (ms.asus.com [103.10.4.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tljvm3b6qz3bnV;
	Thu, 29 Feb 2024 18:46:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=asus.com; i=@asus.com; q=dns/txt; s=asuscom;
  t=1709192772; x=1740728772;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VQJhLQ8P2rEkVHrqYtHEmXSAQARjNKULqEKtKRwdHiY=;
  b=fuAGs2zY5i0UXDjmCNkkO7JQessdy53Cr/b4tP3mwxbhzDz6lAE2ubWI
   PL0sjIl6KA36oXCNi692QyoLxF8YnhoMIFy3EqpYfGAchGRxRtgl+Ukdj
   kBzDyHDvHA9x1pzheiosvyLh5D3xoKyzwj4FCJBfgnwm22LEY/mUPREFj
   A=;
X-IPAS-Result: =?us-ascii?q?A2EsAAC5NeBl/xUvFqxaHQEBAQEJARIBBQUBQAmBMggBC?=
 =?us-ascii?q?wGCOHqBYYRTiB2JSgOKIYE/kFEqgSwUgV8LDwEBAQEBAQEBAQcBAS4WBAEBh?=
 =?us-ascii?q?QYCFodcJzQJDgECBAEBAQEDAgMBAQEBAQEIAQEBBQEBAQEBAQYEAQEBAoEZh?=
 =?us-ascii?q?S9KglwBg3YBAQEBAwEiEUUMBAIBBgINBAQBAQECAiYCAgIeBwoVCAgCBAENB?=
 =?us-ascii?q?QiFJAMxkzybOnqBMhpnghYEsB8NgSyBKQkBgRAuAYFohh8eAYFWgWyCM4NBe?=
 =?us-ascii?q?4JPJm9CgWaBAj6CH4FvARIBCRoFEBUMAoMhOYIvBIEUI1yDEimDMIEojE2BE?=
 =?us-ascii?q?iyCbjsmhWQJS4ECHAOBBQRaDQUWEB43ERATDQMIbh0CMToDBQMEMgoSDAsfB?=
 =?us-ascii?q?VQDQAZJCwMCGgUDAwSBMAUNGgIQGgYMJgMDEkkCEBQDOAMDBgMKMTBVQQxQA?=
 =?us-ascii?q?2QfFhwJPA8MGgIbFA0kIwIsPgMJChACFgMdFgQwEQkLJgMqBjYCEgwGBgZdI?=
 =?us-ascii?q?BYJBCUDCAQDVAMgdBEDBBoHCwd4ggmBPQQTRgENA4E0BooeDIMQAgUlBCxdA?=
 =?us-ascii?q?0QdQAMLbT01Bg4bBQQfAR18BaFaE2hBEBADES5wKxVQERoUkEWCQIM/SZlrl?=
 =?us-ascii?q?A9wDYMMgQOZMYF7hisXhAWMeoZcA5JJmFogkVCWYAIEAgQFAg4IgUEjgSZwM?=
 =?us-ascii?q?z2DN1IZoiJ4OwIHAQoBAQMJhkiCJgUvZ18BAQ?=
IronPort-PHdr: A9a23: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
 5KzioUTR1WzKQMukUjN2A==
IronPort-Data: A9a23:v2U4b69/s7+/pjEOkA/sDrUDzn6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 GIWUG2FM/qKZmv8L9hxYYu1p0kH6JfdytVrQApsqy4xFiIbosfsO4+Ufxz6V8+wBpSYFRo4t
 a3ySTViwOQcFCK0SsKFb+CJQUFUjP3OHPynYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArlV
 ena+qUzBXf8s9JKGjNMg068gE431BjCkGtwlkAzY/lNoGjfmxE9ZH7IDfrpR5dQatA88t+SH
 44v/pnglo/q105F5ueer1rOWhZirog+neS5oiE+t6CK2nCur8Gpu0oxHKJ0hUx/011lkz3to
 TnkWFPZpQoBZ8XxdOohvxZwHCp1A/xA3bP7GHmQruq30GDnaCbXzKA7ZK02FdVwFudfPVkL2
 MxBdnUzN0nFjOWs2LS2Vq9lndk4RCXpFNpA4Dc6l3eFUrB8GPgvQI2TjTNc9BQ9gsRfKtbDY
 cUxYCFyd1LLZBgn1lI/UstvwLz32SGjG9FegHyLuIQW5zDN9U983eGuCvP5eIaORPwAyy50o
 UqDpQwVGCoyN8aN2CGX7nWiwOzIjyf8R5kRFZW89/hjmlrVwXYcYDUOTVq0of6kkUOWVNdWK
 khS8S0rxYAo80arDdXhdx61uniJulgbQdU4O+4g+hCW2LbT7UCaAXoASSFaa91luNMeQT0s3
 0WO2dTzClRHu7qTTmje+qu8rj6oPyURa2gYakcsTwwI5/HhpZp1jx6JR8sLOKezgsf4Bhn7x
 DyHpy84nKkJkMUXka68+BbOnlqEqpXXTwU4+h/aU0q74Q5jIo2ofYql7R7c9/koBIKYSESR+
 XEeno2d4foIAJWlkC2WXP5LHben/f+JPTTQx1l1EPEJ8zWr5m7mdJtI7TxyDENoKdofPzj7Z
 EbZokVW/pA7FH+ra7JnJoG8EcInyYD+Gtn/EPPZdNxDZt52bgDv1CZ2aEia2mvFlEk3jbp5P
 oWfeMy3S3EABsxaICGeHrhHl+VxgHxhgzmKLXzm8ymaPXOlTCb9Yd843JGmPr9RAH+syOkNz
 +tiCg==
IronPort-HdrOrdr: A9a23:GxjOlKlN9tQv2jZj3KSsEL/Q/FnpDfNgiWdD5ihNYBxZY6Wkfp
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
X-Talos-CUID: 9a23:AKUDEWEGscc4lPzIqmJo/0UqS8YAfkHkzVjPBWunJEdyFYaaHAo=
X-Talos-MUID: 9a23:hWiUnATHFoTZQRX7RXTCmixMFcMw/Z3tBU1U0q8vl8veMS1JbmI=
X-IronPort-Anti-Spam-Filtered: true
Received: from unknown (HELO TP-EX16-V11.corpnet.asus) ([172.22.47.21])
  by ms.asus.com with ESMTP; 29 Feb 2024 15:45:52 +0800
Received: from APZA002EXB.corpnet.asus (172.22.6.14) by
 TP-EX16-V11.corpnet.asus (172.22.47.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 15:45:51 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (104.47.26.112)
 by APZA002EXB.corpnet.asus (172.22.6.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28 via Frontend Transport; Thu, 29 Feb 2024 15:45:51 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gypVWg6yITX7cWR0fTg2DEotHpY38crxMoChSIqsAqYewPLzSjuPFgJQ/iZKFCd4m0L9E80q7N3Ygny8sgOcoYIDxIyeeKyAGW+3PnLalBQUjAw6Glqg2xd9tGVIvlHV/ls7tp2iklustEzmecWsUoxms03klvCE9uHomiMqPAMBQnLK3ACr84QRNdeACFBHwmcJTvm6nw4E730g13Vur5isuoVVXyuvHrM+sbAXlScz1mT4v9JMWSUbIwBiSDOVWvNLx/ewZJA25pPlGAdTLcDIkOiZy3U/yu2RNjmssXDF1nIgqTVgpkyaC4xXg9ujyn052OCv0btws1SrKQuCqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZIHAX8ZPzU9AN4RFXu1ltFOpllFKllb1zi6KjnvZ0Y=;
 b=JLY6FTCteQxgXZ46pg1RJQe0L1DrkIBTfksx+YUrf94XK3wtuxP4wPKR1JtKfS9ihlSSRvlQa3u2NNgTKbKoKiIL4Bl/HVXIrmJaCbgzPa6HA72KuJfYCcLwe5/bU8cm692cuhkdqCA7uSpo8A3pbrjXXRxxSU37a2ZueTquqv1zVbp7ePkN1w60zTGqQRVBZAk/BDX8wCtSNc/jRXOpEfuVD17tbaO1GflRYYzC4T+/5BmIAVMu+BFkyZFwK5bvuA/CA9MgAPdE5dz9P25LsOVe5sav34v1TFBlnNirseD6uc/biKhtreNYuWAkShXueXPBsYm/UL7/ylf+p0m9Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asus.com; dmarc=pass action=none header.from=asus.com;
 dkim=pass header.d=asus.com; arc=none
Received: from TYZPR04MB6596.apcprd04.prod.outlook.com (2603:1096:400:28d::13)
 by SI6PR04MB8051.apcprd04.prod.outlook.com (2603:1096:4:249::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Thu, 29 Feb
 2024 07:45:49 +0000
Received: from TYZPR04MB6596.apcprd04.prod.outlook.com
 ([fe80::ceae:2258:3883:29e6]) by TYZPR04MB6596.apcprd04.prod.outlook.com
 ([fe80::ceae:2258:3883:29e6%3]) with mapi id 15.20.7316.034; Thu, 29 Feb 2024
 07:45:49 +0000
From: =?utf-8?B?S2VsbHkgSHVuZyjmtKrlmInojokp?= <Kelly_Hung@asus.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Kelly Hung
	<ppighouse@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: RE: [PATCH v3 1/2] dt-bindings: arm: aspeed: add ASUS X4TF board
Thread-Topic: [PATCH v3 1/2] dt-bindings: arm: aspeed: add ASUS X4TF board
Thread-Index: AQHaaV972feDuqyHeEa+vdxFV1FqSLEd9SWAgAL7MvA=
Date: Thu, 29 Feb 2024 07:45:49 +0000
Message-ID: <TYZPR04MB65964904A9624AF3BE05198D9D5F2@TYZPR04MB6596.apcprd04.prod.outlook.com>
References: <20240227092922.1734998-1-Kelly_Hung@asus.com>
 <60d048df-9a54-4239-8a8b-a8eb9a59dde9@linaro.org>
In-Reply-To: <60d048df-9a54-4239-8a8b-a8eb9a59dde9@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asus.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR04MB6596:EE_|SI6PR04MB8051:EE_
x-ms-office365-filtering-correlation-id: 161b4748-9ef1-41fc-d46e-08dc38fa72ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OWNVX/LzHhj/z7gAdclGEJxOoJIN6MCYSO4U1xBv9z/KJ0J/DloUH0lbTh30lbwIaBIqw7cE6dN9VpTfIF4RnCIUPzqmUrMTAy+Ig1wKRO2e4WLHkKTCTIWXCswP8uGX9J6yXxzGW9LvrDQXRRkl8QBn9EJSMsnaVe/xcCIRnEav2rtRQorxro27zgj65q43odXQvLwCe8imVaSal0I1j2K4KmUA00KxEraNJwzZBxCjYnM3g5Jk27uY21BKYlnx4N91KMTCOHsLeqjRffHQQ9Mkt+JcV3rmm+Zdltju5qzbKeOb3o0qeoezOqvUXtf1CM5DvpYmL/qkS/btfILhcWNQEcmFAZBwaCdWGYRg4ssIkeBI/Wo1Vv+qxjwgnzOtoz+csppMY0cSIDY93mXzyI6zBa55gWDhYXn4E4puk+4jdC5cYAxr3LdYLxatGBrHvL4YX/PSo2xzSpTYc1aLD6KtTpX2T7N7v0+MOfQESyaRHCj8e+hscAGN3phW/xIrQgMWkvu0RND2kOK2B92zXXbo56Lx7ERSurQwI/93QcgUpa1bOedL8NhmgUdW+hKcaPjWrQHHf4z9euxY+sYFulEb7oBBEUe1KI4miWotoMcwlFDmb54gZ0RGfGP+x/HdZkz69UxI7H0uYKFzs/12sMd35oz/4v3VjtTCkZ/2rZFSKipa40OHbI8di8bcNpmMkH/dvwUeRhedEAtwCeKvtQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR04MB6596.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGp4enQ2Y0lFMUlXNG1oQ2IwZU5YcDVvakwrd3RnRlFYV2FFbzVkRjJDQXZh?=
 =?utf-8?B?RmlFRFI3cHdWaDgrQXJESU0yTmNIV0dhNXNUWjJiS01qTS9yRWxxYk9nckR6?=
 =?utf-8?B?bkhEbHBEalhmQkRWTmRrZ3A4QS9xQ2k1dHFOV0ZvVVo3eEJ0NUlFSEdQUi8y?=
 =?utf-8?B?eG5od1ErcFZqVmR0TWUzcjNyQzg5YWJqeUFiSUdiWUdHeDEvWFRCUExiRGdM?=
 =?utf-8?B?aFVxUERhUWJwVHJrMG5RQUlNYWpIVGJtakdja2xMSjV4aFZNZXNOOGtEUktw?=
 =?utf-8?B?U1k1bmZxMFkvbkY3UXV4cTMzMnhKaDZrRmN1eitzZzNMSENJOGR2MFlKd2kr?=
 =?utf-8?B?SDhXRkpjRGVGMXEwYzExUkIyYUZjbGRzeEJVV3pWekZkbEpTZFJ2a2JwNjRp?=
 =?utf-8?B?L1hFZkFucFlrL2kycWxNTFA0aXBCaytVYzR0QVZqdCtVYVkvaXkyYkZxNEJq?=
 =?utf-8?B?QTZwZTBzUWZPakF5cDNyMENEY2VSUEFML3g1Q1F3Q0tYRWc2YzBmWEdnUUd6?=
 =?utf-8?B?bzFtdk1iL3FVb3JXUEhhamZuQ2NkRmJwL0thMmw1Sm1RcHNRTU56WFFCdHk2?=
 =?utf-8?B?ek1CQVBzMEo3d2duYXRHSnZJTFpkdldGdGFPY25TWFRKMEhjRDdmaWkrbU01?=
 =?utf-8?B?cWhLRS9FQVpPZ21yWjkwdmRnc3Q1RmIyOTY3NE9HSUxGK04yclBYRlZiSEx6?=
 =?utf-8?B?NEd3YUgwNnlEZ3AzY3h5RldkVHh3YjM0L3BCT1FBVGNHTXBjUHBSTE94cTcz?=
 =?utf-8?B?Zi9sOVZ2VkNzNEJlQ3AyZXRxcUd0K3NDbHZqNFNLS3BQMm5OWlhaUFpaYmNn?=
 =?utf-8?B?cEF6QzJnT09OU0FhSHEwQ29MMWNMaW8wam5MVmRkbkpST09reXl0UVdzWXRo?=
 =?utf-8?B?VnA0b3FPM21GYmFLTGs4RzlzZmZPMkZza2FVSjZycU5ScGFWMnJ3U2luS1gr?=
 =?utf-8?B?bUF5N1lFd3dmOUF4TWxRQUFlS1dKaUpUb3NjTUFwVlRjaUtzMUYxV3JzWGFM?=
 =?utf-8?B?dVRNSFd3ZEVyZmkrTC95MjJZVlFVMVIwU1paMFh2M1B6ZmFqa3loTnRqTkxr?=
 =?utf-8?B?YVh4dzl2dmpCWktibU1JR1BuV2EzVDNnN1VNOTdrRnJDUzZVOTQxYmlkRVl1?=
 =?utf-8?B?U0orZWRiK2w4QTlSUTVUcytxS25iQnIwZ1NTTVhtajVSWTNrS1R0aHZYaS9E?=
 =?utf-8?B?Zld2S3AzeExQSWtrUUNTN3JlWDJtWWNldnhhbWt2V1VuWHF6czljek11bVNy?=
 =?utf-8?B?QmdGVm1kM1h5OVZxTnlnZ2lYQmVmczZ3SHNGT0lzQ1JLaHNPSlhmNjhRL3dD?=
 =?utf-8?B?UEd3aU54WWVnN1VsMDgxOTNibjRiV2R2YUF2aStsSXRTSWw5ZFEwMXN1R2ZO?=
 =?utf-8?B?T01yYXhpc3JETU5tUVBCYlJhaUQ1RitPRGdMTUlNaUE1bkM3UG5vbitXUjJO?=
 =?utf-8?B?NklndVFUcE95ZUQ4YU1NSWtYVmw0SGdUSTlLakx4SDZwRlN1SDVGTUlXMzNW?=
 =?utf-8?B?NzllcVNlNGlQUWJuT2VPTytoRGFyV0htWlJrRmVyL1l3aGsxMHEvekJOMTgr?=
 =?utf-8?B?WTE3alEyWmpWbm11Um1SWUJRbzdkbFQybW1nWEswVmFFK1czRGR4c3pWTGY2?=
 =?utf-8?B?cFEremsyOFlsWDMvREZqVjg5eExnY2Ewa1puREg3UWJtaXplQ2dCN0c3MFcv?=
 =?utf-8?B?SXlnUWhqcTV3WkEyLzBLZkl0MnBETmtNdnVmNmtJZDAvZkVBazY5UVNCYjVY?=
 =?utf-8?B?aUU2VG96ZElXd1FyMWdFWnlBUUluY3RDTTRLeFFVR2U5ZlhkdW1iNXhKdjBz?=
 =?utf-8?B?c20wbjV2ZWJOV0hRU1d6NkdRQWc3U2hpOXliWm4wcWM3MXp1Ly9zbWMzYXo5?=
 =?utf-8?B?MTdrR0RWNVdMc0o3UVJLZk8rSUdzWDgzcnZFTTROV29JNDRsNVRSYTBDWXVQ?=
 =?utf-8?B?aHV4UENLUXJ1eW1RRmVNYVh6NFd2T3JVS0JPajM3SGtWVVBVajZqMmJVQ2VE?=
 =?utf-8?B?dXNoZVJiblp2VGxtUjRPZTd0SXlWOUZHaXpYaGJ0T1ZKSnFXMUdyZmtjYzR6?=
 =?utf-8?B?eWFTclNTUGpqR2ZXQkM1VXlINnNMM0JNRXV3QkR0UHRPRkVyemVaakptRXg1?=
 =?utf-8?Q?i16oykKnfgkibPUQ0A1s0oeLp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR04MB6596.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 161b4748-9ef1-41fc-d46e-08dc38fa72ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Feb 2024 07:45:49.7088
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 301f59c4-c269-4a66-8a8c-f5daab211fa3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: whL+rO0VFxsMqiDymVY0VOPccAbkKWc1c+6RKOKmxix2cL8Uf2Uciid/R90Tf2JrPuP6YnTpB0MEjg9cFL/K5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR04MB8051
X-OriginatorOrg: ASUS.com
X-TM-AS-Product-Ver: SMEX-14.0.0.3197-9.1.2019-28220.004
X-TM-AS-Result: No-10--16.985300-8.000000
X-TMASE-MatchedRID: scwq2vQP8OH5ETspAEX/nnOjEKYddvv6Xdw5PWqPhD9jIOKZDN+g+4yi
	F5onUG2P01nQU8mVCBUPtvKHk5LZ1ZISLa/7Hy7VESXOZXq6MIQWHD9oTapTmuU0ANNKseCVf9R
	EPtrqOGFcBLQa+1h4t2BN/PrhIa5ffjeDWHP5lq/BOM8VvnzB4gp9RhY5FneF1McWg5VNQo/Ybt
	L4351/xnrXd53wcg59jX3M0aFmhUO4YW3IPBlDmpr4DbFfhFdeo2sqUJr6IXBxg7svMtapLg7Ht
	RZkYKSFwMoPtKDwPsVrt++zA/Mnv0mTFBEtNzxxZcCOwTVX/+hwv7Hjk7SQ4A==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--16.985300-8.000000
X-TMASE-Version: SMEX-14.0.0.3197-9.1.2019-28220.004
X-TM-SNTS-SMTP: 	034154DDF20AF0D9505A859DBD7764E65D097044B00F3622175B14A94ABE238E2000:9
X-Mailman-Approved-At: Fri, 01 Mar 2024 09:01:43 +1100
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, =?utf-8?B?QWxsZW5ZWSBIc3Uo6Kix5bm85bKzKQ==?= <AllenYY_Hsu@asus.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGksIEtyenlzenRvZiwNCg0KSSBjb3JyZWN0IG15IGNoYW5nZSBsb2cNCj4gRG9jdW1lbnQgdGhl
IG5ldyBjb21wYXRpYmxlcyB1c2VkIG9uIEFTVVMgWDRURi4NCj4NCj4gQ2hhbmdlbG9nDQo+IENo
YW5nZXMgaW4gdjMNCj4gLS0tIFRoZSBuZXcgY29tcGF0aWJsZSBpcyBhIEJNQyBmb3IgYSBBU1VT
IFg0VEYgc2VydmVyIHdoaWNoIHVzZSBhIGFzdDI2MDAtYTMgY2hpcCwgc28gY29ycmVjdCBzdHJp
bmcgdG8gYXN1cyx4NHRmLWJtYw0KDQpEbyBJIG5lZWQgdG8gcmVzZW5kIHYzIHBhdGNoIGFnYWlu
IHdpdGggdGhlIGNvcnJlY3QgY2hhbmdlIGxvZz8NCg0KVGhhbmtzIGZvciByZXZpZXcuDQoNCkJl
c3QgUmVnYXJkcw0KS2VsbHkNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBLcnp5
c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQpTZW50OiBU
dWVzZGF5LCBGZWJydWFyeSAyNywgMjAyNCA2OjAyIFBNDQpUbzogS2VsbHkgSHVuZyA8cHBpZ2hv
dXNlQGdtYWlsLmNvbT47IHJvYmgrZHRAa2VybmVsLm9yZw0KQ2M6IGtyenlzenRvZi5rb3psb3dz
a2krZHRAbGluYXJvLm9yZzsgY29ub3IrZHRAa2VybmVsLm9yZzsgam9lbEBqbXMuaWQuYXU7IGFu
ZHJld0Bjb2RlY29uc3RydWN0LmNvbS5hdTsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxp
bnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtYXNwZWVkQGxpc3RzLm96
bGFicy5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IG9wZW5ibWNAbGlzdHMub3ps
YWJzLm9yZzsgS2VsbHkgSHVuZyjmtKrlmInojokpIDxLZWxseV9IdW5nQGFzdXMuY29tPjsgQWxs
ZW5ZWSBIc3Uo6Kix5bm85bKzKSA8QWxsZW5ZWV9Ic3VAYXN1cy5jb20+DQpTdWJqZWN0OiBSZTog
W1BBVENIIHYzIDEvMl0gZHQtYmluZGluZ3M6IGFybTogYXNwZWVkOiBhZGQgQVNVUyBYNFRGIGJv
YXJkDQoNCkV4dGVybmFsIGVtYWlsIDogRW5zdXJlIHlvdXIgZW1haWwgaXMgc2VjdXJlIGJlZm9y
ZSBvcGVuaW5nIGxpbmtzIGFuZCBhdHRhY2htZW50cy4NCg0KT24gMjcvMDIvMjAyNCAxMDoyOSwg
S2VsbHkgSHVuZyB3cm90ZToNCj4gRG9jdW1lbnQgdGhlIG5ldyBjb21wYXRpYmxlcyB1c2VkIG9u
IEFTVVMgWDRURi4NCj4NCj4gQ2hhbmdlbG9nDQo+IENoYW5nZXMgaW4gdjMNCj4gLSBjb3JyZWN0
IHN0cmluZyB0byBhc3VzLHg0dGYtYm1jDQoNCkNoYW5nZWxvZyBnb2VzIGFmdGVyIC0tLS4NCg0K
QWdhaW46IHdoYXQgaGFwcGVuZWQgd2l0aCB0aGUgdGFncz8gV2h5IGFyZW4ndCB5b3UgcmVzcG9u
ZGluZyB0byBjb21tZW50cyB5b3UgcmVjZWl2ZT8NCg0KDQpCZXN0IHJlZ2FyZHMsDQpLcnp5c3p0
b2YNCg0KDQo8cD48L3A+DQo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KVGhpcyBlbWFpbCBhbmQgYW55IGF0
dGFjaG1lbnRzIHRvIGl0IGNvbnRhaW4gY29uZmlkZW50aWFsIGluZm9ybWF0aW9uIGFuZCBhcmUg
aW50ZW5kZWQgc29sZWx5IGZvciB0aGUgdXNlIG9mIHRoZSBpbmRpdmlkdWFsIHRvIHdob20gaXQg
aXMgYWRkcmVzc2VkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50IG9yIHJl
Y2VpdmUgaXQgYWNjaWRlbnRhbGx5LCBwbGVhc2UgaW1tZWRpYXRlbHkgbm90aWZ5IHRoZSBzZW5k
ZXIgYnkgZS1tYWlsIGFuZCBkZWxldGUgdGhlIG1lc3NhZ2UgYW5kIGFueSBhdHRhY2htZW50cyBm
cm9tIHlvdXIgY29tcHV0ZXIgc3lzdGVtLCBhbmQgZGVzdHJveSBhbGwgaGFyZCBjb3BpZXMuIFBs
ZWFzZSBiZSBhZHZpc2VkIHRoYXQgYW55IHVuYXV0aG9yaXplZCBkaXNjbG9zdXJlLCBjb3B5aW5n
LCBkaXN0cmlidXRpb24gb3IgYW55IGFjdGlvbiB0YWtlbiBvciBvbWl0dGVkIGluIHJlbGlhbmNl
IG9uIHRoaXMsIGlzIGlsbGVnYWwgYW5kIHByb2hpYml0ZWQuIEFueSB2aWV3cyBvciBvcGluaW9u
cyBleHByZXNzZWQgYXJlIHNvbGVseSB0aG9zZSBvZiB0aGUgYXV0aG9yIGFuZCBkbyBub3QgcmVw
cmVzZW50IHRob3NlIG9mIEFTVVNUZUsuDQoNCkZvciBwcmljaW5nIGluZm9ybWF0aW9uLCBBU1VT
IGlzIG9ubHkgZW50aXRsZWQgdG8gc2V0IGEgcmVjb21tZW5kYXRpb24gcmVzYWxlIHByaWNlLiBB
bGwgY3VzdG9tZXJzIGFyZSBmcmVlIHRvIHNldCB0aGVpciBvd24gcHJpY2UgYXMgdGhleSB3aXNo
Lg0KPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0NCg==
