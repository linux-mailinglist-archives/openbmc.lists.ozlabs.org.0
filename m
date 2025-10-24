Return-Path: <openbmc+bounces-800-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E3DC064F6
	for <lists+openbmc@lfdr.de>; Fri, 24 Oct 2025 14:47:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctN3T6BVzz2yrm;
	Fri, 24 Oct 2025 23:47:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761310069;
	cv=pass; b=WtkeU2LKRi4aJLFFWAH0N22ctkOzw+x4rLOl8bLGrJzy0eFugwtvcPydeQpu6pA+xxYAZzn06J5KONIGlLRs/3DFG1pb4roZUAklYMJ940CHsGjRXS7b8IPRerd51CneeYMbOSnylYzFSNUlBuZQOHlCKuCSOxVhSfqK5NKVLtobw1oD30ooSKkqRZ/JjENeZR89q23IdG3lA+8VjdO5DlVwIDJFppWcQ1SHWkmzXQNvWJZmGMl65RI1dKe8yrG3axZcesVhddKKFCSmfX/PO+Yp7clkTJ7Vzq/J30s/DO6YrkBBHSYNK/JIOz0GkjK6aRKAJmsngclees6B6pyoqA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761310069; c=relaxed/relaxed;
	bh=k8fs8K18Ckut9+qdapZDWOtchjF1W6ghig1SjXdNzMY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OkPQ5Hm+utPThhu1+WVIbGFMNxv/jGkEMKYecGgEfJq3erMtFXSswNb++vMswMJNGl3TqCaiFnlX0aGyc7cr4b21im55pxbch3OxHYCq9H4FoOqTMyXCB/tmxc0dsF18rNoc7zUp829ax6JIfyxV71nCRzv0ti41aNu3SSqOzAauGAwm31qF9zwGyxwlshDSEcQbH+E8IcJhbNryiImCoyFL6wDqCC9br0nBRkEIi+H2pQhAvOgKxc36uecpVt+P1bjuDCpo0qT+b6uWxlzom7GTTwJEQx9PB5UKUjyXVIuWDeoa2Lxncnm02diBo/bR9soPgfZvoUJLXtnUR9PtoA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=QElQObTh; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=QElQObTh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctN3T0Fc3z2xsq;
	Fri, 24 Oct 2025 23:47:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JwTKaywM8CANiSNeUOO8MAlwqSKEcHmDV2xAa+Qk0OhMLiqhOW53ZtOl+WPvsAJaOO+7df0EyCG1tHdH13iw6sztuF9kI6Yqv8RsJ6LV1+FKW0bfwHlOl6xHTed4XaXAX1j9KloNddiDykBYEDXnuANH3hWwMAsP0QG07UkO9H+xHGsO9WawqY+qKcIKqcqvl1bnt7IqSbmF6LAosP6MAmOf0mVlTzDzrhZsf1BGsIUSUzdgRAHhq+IG00jZjJOy5Vx9+8aBcorcWJPmyut6JfCEaUIJwROVLEgUKFZrBMd1XyjNArHK08wv9ctMHEwwnfYMKjQ/geph4FxURLAEzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8fs8K18Ckut9+qdapZDWOtchjF1W6ghig1SjXdNzMY=;
 b=Vgc3mhx/ZekMJkhe3eiTBG+VlE3xhKTQmL0+hb4sJ0y9+z077lPicesM0G4CIR9ZJ/iuxoB1g7ZvrYjpCLXqbElpTxrrv3eYolBa1iJb5BdJBQYx9o8mZR6kJKlfdCvyDeu+Y+K8hmQfrLzfz6SXqiRsOZzhnuWsuH7hEY5UZreQSmRTEaLkAgl4y1VGnUtAAB5Zj237CPVOTws/Kreo092mzsUrhz+ZStpH6q9+yNH99YPHBXe/kbM1dL9O66ISKbLVyiJrvjjhUwmnXITElX4vAT1GNOdcBzh8f3USPD4VVVFEizDAs9i6hHoDaYlv6SBfQUZJr4J2xyPSw0wiwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8fs8K18Ckut9+qdapZDWOtchjF1W6ghig1SjXdNzMY=;
 b=QElQObThaTAI+lE45w0FFAiw0g9jSD4ndPifEryO3XkjbdBeW/5vNRtMkNdGw6gWAE2jOfc7ybH+EWZAdqzkM+NxjsdsKYw9OYbarXIFOGJmmXk8YHSWhjQaZOoPMSB4TZuQ9FzvXhCG+QyrqLiLQ3Y9jHA3r1rvask1K2ra6ovHKo1Mbr1EHB7ix7eU4CKiMqXji4DymKgXU4UH1e2AHhNav+r6C2s1cVwCJ6YBMPtUEAYQXcMoJ2JLQyeolUlKD5BvYgRq1munN5oZpj4RwrXUuG6YftTYqzvBU+3Zg6jpRymEhD32rYgHjyaIIQucaxuWVG4i5WnsjTsXMdhbhg==
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com (2603:1096:408::791)
 by SEYPR06MB6929.apcprd06.prod.outlook.com (2603:1096:101:1d9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 12:47:25 +0000
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80]) by TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80%7]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 12:47:24 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Jeremy Kerr
	<jk@codeconstruct.com.au>
CC: "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "joel@jms.id.au"
	<joel@jms.id.au>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"naresh.solanki@9elements.com" <naresh.solanki@9elements.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v20 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
Thread-Topic: [PATCH v20 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
Thread-Index:
 AQHcQisKZrgNdIKVU0mDlJSyYndfALTQ3zKAgAABb4CAABJSgIAAAs0AgAAJqYCAAEBPgIAABHKw
Date: Fri, 24 Oct 2025 12:47:24 +0000
Message-ID:
 <TY2PPF5CB9A1BE6E6E8FA67CDC03A55A439F2F1A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20251021013548.2375190-1-ryan_chen@aspeedtech.com>
 <20251021013548.2375190-2-ryan_chen@aspeedtech.com>
 <20251024-dark-ringtail-of-defiance-1daabd@kuoka>
 <2939cae6-2e8a-4528-8e27-8c932e2f82de@kernel.org>
 <bf3d6690b9124ecf74df6c0f9f1c0f72ae1db9f7.camel@codeconstruct.com.au>
 <8341a903-639b-471a-8425-a98c473f5ab0@kernel.org>
 <7a650d60cabcbd33b65c954b0c9c5918dfcabb09.camel@codeconstruct.com.au>
 <563d6efb-966e-41e7-aade-ddec2abc7568@kernel.org>
In-Reply-To: <563d6efb-966e-41e7-aade-ddec2abc7568@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PPF5CB9A1BE6:EE_|SEYPR06MB6929:EE_
x-ms-office365-filtering-correlation-id: 53559583-7315-471b-2a40-08de12fb7b47
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?UU5NOHIxczRGUWxSYXlVZ281bXozd1NZVHdhMWhYdjdob2NacDRkSThPRytW?=
 =?utf-8?B?RHhBV0R0bDRMU0NKK0RFVHA2ZWJodEdmaDFmZXQwM25ldjc3dGc3eW9iT1Fk?=
 =?utf-8?B?bldQQWNZbkV6YVhSQ3pIc1c2QjM0blAveFNBRFRGc0R4VEpjWDMyNE1ZWmVH?=
 =?utf-8?B?UG1SQkd5UTdPVzF3bG5mWnQzLzZVdWdlUllUd3JWeVhOTzFqdGdXYjhKS2lO?=
 =?utf-8?B?N09MZHU3UVFrRzBLendRUGNIcVpwKzlnaGo4WEZyWHpFQ2RFVlpnOGluVURa?=
 =?utf-8?B?OXVmY2ozR3hQK1JuU2h2TjhCekZZVUhLVGFCYkhjQy81QitqYXZSVHZlY0Z1?=
 =?utf-8?B?VU9ZeHdTZVB1RCtVVk9wOVNkcWpTeWtObUZCYksxZ0lrRWc2U2xFK3MveVEz?=
 =?utf-8?B?cGtBTDJSVjUzcFJTME1FdnF5cWJ0VVlHZjVZREtDTitRM2YzV2kxQUpOaFVm?=
 =?utf-8?B?VHJOdXR4OXpqTThrUjlTczNEaWQzNEpEdjB2UnJwbG9ReXp3dTNUS29TYTc1?=
 =?utf-8?B?dkpjQmJyN01Nbjl5ekpOZ2kwejd0dXhiOEY0QzMwZDFkSCtIOWtpNTVqb0dH?=
 =?utf-8?B?ZUF1YmRMVmd5cFNQTTFlc3FRYnhmakozeXQ3bjZUaitNTUhFQXp3amNFUnR2?=
 =?utf-8?B?cWE0Y09oQ2RISENPamREMHF5ZitDdit6Q3hCeFBjUGY2SDlHVlRJK1l2OUF3?=
 =?utf-8?B?UTZiUFVPcXlXRUNpdFdGeTRwUzZ0NGxKSEJUeThoRm9LNDVBNUZ3ZmE5VDhL?=
 =?utf-8?B?alM1SjM2OWc2M0pIbC9vaktNT1Z4Lzh1VWhqN3NQN2VQUUphTkMvSHpvaG5G?=
 =?utf-8?B?L0c1Qm1acGN6ck5qNG1hRkpwRTdlYmwyODd2aHE5d2ZkZ1BoSWlGUHpjeHlK?=
 =?utf-8?B?Q0dQdHowOWNnaDlPWjFDWEtLbFhQYWx0U2hlRWN3akV2VG5SRFh3QWhlN2Jx?=
 =?utf-8?B?TWo5bDkyRHNadlJnV1dpa1hGWkhIYWdvdHhWUFRhNGlJL0lRYS9SeDRWSDhT?=
 =?utf-8?B?MUFwWHhQSHI5U3haYWQ5bjJEM0xjSU9UVGxrdnB0dXFJUXdSK1k4aU9POS84?=
 =?utf-8?B?dkNkU0k3YVdSZ0ZEdzIxMWNGUHBhR2JSd2pUcXBBaHY1NjkrWUQxMVMzeEk1?=
 =?utf-8?B?bGdKOS9JUWk5NnkwZ3RyNS80V1FvdkVubHpPOG1pNko2NTZEQnBJZHo4Qnhk?=
 =?utf-8?B?aEEyNEFsczFJcno2RDZ3YTZTbDdQRVZJbFBBbENGYnJQUTlGaVdkS3l0cEx0?=
 =?utf-8?B?UmRIcG44WFVZMXJXTjViS1VJY2pxSmdEWUJESS91ZU9ERVJMQlRhdnFDU1BV?=
 =?utf-8?B?dVFkN3Z5WVlUYm1mY1BZUGRDcWNxU0NacktYc21WdkpSaDhiajdxM1hoamNx?=
 =?utf-8?B?OEs5U1NMVFNXbGFEcHhKUDVIM1FtRmMyVzQzbWpYc2RBNHNVeGVwM3FWU2gz?=
 =?utf-8?B?Qldhdm84SmtjZ05wNURSa3RwSE5vQmZzTFBLWTY0cnV2L2lITzQ4ODMrOUJo?=
 =?utf-8?B?TVRRVG5ib0YwWUxUTC93d1VzYjZObHI0a0llS1RteUh2TVFjS2ZqcjFxKy9J?=
 =?utf-8?B?NXNpZUhsWGZXa01MVkxmeWhsaXBXSVo4K0JqZjhmYlFVZnlZbW4rOUtTZzE2?=
 =?utf-8?B?R0FHRTV2SkJiNm5BK0x0WmxPamFMSS9hRGxobk8zd09xdWFYZnhlQXdSTXlZ?=
 =?utf-8?B?TlJ5Wjh2M0VzcWljWGRqd1dYbkprdnJCSC9uNURtSzVaSmc4TkxQZGM4NFRN?=
 =?utf-8?B?QWw1QXV2eGF4Yk1UaXQxa3Q5Ly9iSFhGQ1QxVklZNnowZUYvcHN5a2psczBT?=
 =?utf-8?B?ejNpSk0zV29KMEFGVEF4Zjd2cVUvd1JFNDh1RDRTV3FySEhkVnBYbHRRTjUr?=
 =?utf-8?B?QVZ0WTY4dUpPN3VhY3lRUEVLakM3SURmcG5DeGxYTkxkN0lMQldxd01OdFA0?=
 =?utf-8?B?RWVaeW1MRjVtRXpuWERsS2ZDa2hOYnRDOTBMUlJGMGE1QWRvQ0I4TlkwUDVP?=
 =?utf-8?B?d2dNS1RBNC9HTGlYQnJTbkE4T0RUK3VvdVpzU3hDM2dQdUJqN1FpbjduZm1L?=
 =?utf-8?Q?tC9gdR?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b0JmazNPd3RtbWZNQ01remlyZVczZFA1MkxqWE8raUVIL0JuczJaOG01WkFU?=
 =?utf-8?B?MURZVjFHL2ZlekpCNDc4Sk9qbkZPQmlCaVJ3b0d1VHdoMHVFTDVzcnBJVHdo?=
 =?utf-8?B?TzdUbzZENmtabXN3elljNU9TVFI5QTU1Q3pXb0d1aGJMekVrZ0NJS2dtT1F4?=
 =?utf-8?B?S216YUx1K2V3eFdrQXUxb1lXZU15VGN6VUVCL0puYVhnc1pvamdRUStVSi95?=
 =?utf-8?B?TkRrZm9mVGZTc3E2dmtTcmdLTm9QSDhYZFUvWjdkSVdkYUxENVZEZ3VsV0Zp?=
 =?utf-8?B?Yjh1OE1sQzMwcHpEbit0M2dLMk5mdmhJOURSd2Yxak41enFQU3R5MEorT0kw?=
 =?utf-8?B?VDdhdzkxb3dLZktTbG53ZDJ5QnVDWlQxRFo5eE4rSEJKSktGUXlabjZLVGFU?=
 =?utf-8?B?QzNFSEdSRUR5QlZOMnhCK2VkMURxUXpGN2lLbFZkQkVOb3l2eTM1eUVtTWsr?=
 =?utf-8?B?dVdWQURDNTVaeU1OcDEwam5LaFlvZjBGbnMvcUw1ZEF4VXJoQVpaSmE0UGo0?=
 =?utf-8?B?WGtOU2I5SGkzUHhIZHdFMW02R0ZjVHlQQzFWZGgwQlk1TUYwQlozVTR0QkMr?=
 =?utf-8?B?T3F1Z0lDZnQxUE9nOWVrV1VqRUN6SlVDSityUzVNOFdSSms4aUV3eHU5ME5L?=
 =?utf-8?B?RldBUHR3WXR4aDN1N0QrREl1eWthODJpbkF3azRGM1VScXhFdGNEa2dZQm9m?=
 =?utf-8?B?NUc1Z0N0QkpMejdxZFpqUGltVkFMcHNWSkZ1amxGQ1VwQzdHY2N2VHF0eGxH?=
 =?utf-8?B?NForUDF0ejVuMFlQeXBoaythM1FUWTNRZm91ZjA4TVhiSFNHakZNdVBkSVRp?=
 =?utf-8?B?S1MxZnRSN3dWVXBPdHh3UmhOcVhkemhBUlpIaDk3aXRXc1dWOTVyMm9yYjhv?=
 =?utf-8?B?cGVPckY5M25Wd1h1QWNxdS92azNTZkNiam9wb0V6WDgyL1VvZUJ6dkFHU2gv?=
 =?utf-8?B?SEorKy9TMVJqYVM5bUt6Ni8rZkhJN2s5ZmtyNFZRZ1VyWmZHN2RoY3BoOXlt?=
 =?utf-8?B?dzBCRC9oMnJ3eSs1T0xHcFpCYzVBSWNRclR5L0ZEWTNHZjMvYVdDcElNT0hE?=
 =?utf-8?B?TVJRam8wdUt4dTVaOXVFaTlMYXd0cDMzQjZMMGExV1ZsQmMwditGVDc4V2tH?=
 =?utf-8?B?RW1Pa2poamJpdlUrSmJxUkMxaFZ6V2dxNUhDazFoUSt1MGZhZXUxazVRU2pK?=
 =?utf-8?B?ZnIrSDVKbDdoWEt5UEFWVmVqalZmOG1YTTJVK2ExamJKOUdSSlFvSExKK0JT?=
 =?utf-8?B?YmlaODE3Q2xyM3h3VTBuQWFVM3JuWHEyditneFdwTHZBclE0dGxlVjNRVnl6?=
 =?utf-8?B?R2xwS0hmMWk1bnJlSThQL2NxNUY1bk9Xb3pBaXRCVmI2MlFUMHBTMXlyanJj?=
 =?utf-8?B?UWdwdFFDVE10ZGd5d3BqY21DQ0pDOVlMYzlWOTlybHViNzFnTld0NHNTclJL?=
 =?utf-8?B?V2FSbVhnWlR5dCtjWEVLd3VuWG93MkpZdTVBT2pEZW8xaFRrd0pNUSsvWWpz?=
 =?utf-8?B?SUNHVUV5M0pvNHlDRll0c21rMlZMM2FmS0lyYmdOYVFxUWNDTDJYT1JTcWVo?=
 =?utf-8?B?SWMrVG9vVDlieTlzZkZhTGUrUGpMM3I1Wnd6dXM1emY5dXV4NGx1UHJUeSt2?=
 =?utf-8?B?RmFtWTV0MThZcFZTK3Jvays5UDBURFYrRktoN0tnUitwQ0xzOHdYK1hjaFBs?=
 =?utf-8?B?aW9PdXNmWnl5dUxyNGVHdGt6bjFVVllEMEpqZldYN3JRL3RndlcvOXVWQlFh?=
 =?utf-8?B?NnFPaXBML00vcG45dU9ManhHTkNMUDgxRmxNUVVGdng5ZTRNOStGZGZZREFE?=
 =?utf-8?B?ZVhwVkxjc1QzMXFWS1NoTlZuU0l2OG9MeUNKSkZob0ZtMyt4bjU1NzBZRmVi?=
 =?utf-8?B?Wk1RS3VvQ0t3L1hoRE0vYkJxQklNUUVTeUUwMk9WN1NPcy83TElTQnV1MUFq?=
 =?utf-8?B?cEZhMHBhY1d2UnlYNlFJVTNUbnIzT0xMcGc3YkF2L1NLVzlBc1hJZExyN1dW?=
 =?utf-8?B?WlBtbEhNOHlBTm5pemJhQTI2Y1lSY3RFVE14bzdSSW9TY3UxOVpwblk4YXhp?=
 =?utf-8?B?UjZPTlV1WUUxcGpYM0NjbjhFQVY5U092RFRyOEJGdXBYNmtLY0M3YmhhN29t?=
 =?utf-8?Q?NpULX1Bc+c9nMTHHusWc/4kww?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53559583-7315-471b-2a40-08de12fb7b47
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2025 12:47:24.7149
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MwDgGeLtD0TauORohsXUKf3+PjdV2ZgYJjA1sm4nYKzB7EIlJRkfN3obhjozbCy8iKjgVhb8ZNXEsfi8JlxqSX/2aWJ8WgY1yUeC+ELhcOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6929
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyMCAxLzRdIGR0LWJpbmRpbmdzOiBpMmM6IFNwbGl0IEFT
VDI2MDAgYmluZGluZyBpbnRvIGEgbmV3DQo+IFlBTUwNCj4gDQo+IE9uIDI0LzEwLzIwMjUgMTA6
NDAsIEplcmVteSBLZXJyIHdyb3RlOg0KPiA+IEhpIEtyenlzenRvZiwNCj4gPg0KPiA+PiBPbiAy
NC8xMC8yMDI1IDA5OjU2LCBKZXJlbXkgS2VyciB3cm90ZToNCj4gPj4+IEhpIEtyenlzenRvZiwN
Cj4gPj4+DQo+ID4+Pj4gQWx0aG91Z2ggbm93IEkgc2F3IG5leHQgcGF0Y2gsIHNvIGNsZWFybHkg
dGhpcyBjb21taXQgaXMNCj4gPj4+PiBpbmNvbXBsZXRlLg0KPiA+Pj4NCj4gPj4+IFRoZSBzcGxp
dCB0aGF0IFJ5YW4gaGFzIGRvbmUgaGVyZSAtIGJ5IHNoaWZ0aW5nIHRvIGFuIGlkZW50aWNhbA0K
PiA+Pj4gc2VwYXJhdGUgYmluZGluZywgdGhlbiBtYWtpbmcgdGhlIGNoYW5nZXMgZXhwbGljaXQg
LSBhbGxvd3MgdXMgdG8NCj4gPj4+IHJldmlldyB0aGUgYWN0dWFsIGNoYW5nZXMgd2l0aG91dCBs
b3NpbmcgdGhlbSBpbiB0aGUgbW92ZS4gU291bmRzDQo+ID4+PiBsaWtlIGEgYmVuZWZpdCB0byBt
ZT8NCj4gPj4NCj4gPj4gTm90IHJlbGF0ZWQuIEkgY29tbWVudGVkIHRoYXQgcmF0aW9uYWxlIGlz
IGluY29tcGxldGUuIFdlIGRvIG5vdCBtb3ZlDQo+ID4+IHBhcnRzIG9mIGJpbmRpbmdzIGJlY2F1
c2UgbmV3IGRldmljZSBpcyBzb21ld2F5IGRpZmZlcmVudC4gVGhlcmUgYXJlDQo+ID4+IGh1bmRy
ZWRzIG9mIGJpbmRpbmdzIHdoaWNoIGNvdmVyIGRpZmZlcmVudCBkZXZpY2VzLiBXZSBtb3ZlIHRo
ZW0NCj4gPj4gYmVjYXVzZSB0aGUgYmluZGluZyBpcyBkaWZmZXJlbnQuDQo+ID4NCj4gPiBPSywg
YnV0IGluIHRoYXQgY2FzZSBJIHRoaW5rIHdlJ3JlIGFmdGVyIGd1aWRhbmNlIG9uIHRoZSB0aHJl
c2hvbGQgZm9yDQo+ID4gImRpZmZlcmVuY2UiIGhlcmUuDQo+ID4NCj4gPj4gTm90IG11Y2ggZGlm
ZmVyZW50IHRoYW4gZXZlcnkgb3RoZXIgc29jLiBBbGwgb2YgdGhlbSBhcmUgc2VwYXJhdGUgSVBz
Lg0KPiA+PiBMb29rIGF0IGFueSBTYW1zdW5nLCBOWFAgb3IgUXVhbGNvbW0gYmluZGluZy4gU2Vw
YXJhdGUgSVBzLg0KPiA+DQo+ID4gU28sIHNvbWV0aGluZyBsaWtlIHRoaXM/DQo+ID4NCj4gPiAg
ICAgYWxsT2Y6DQo+ID4gICAgICAgLSAkcmVmOiAvc2NoZW1hcy9pMmMvaTJjLWNvbnRyb2xsZXIu
eWFtbCMNCj4gPiAgICAgICAtIGlmOg0KPiA+ICAgICAgICAgICBwcm9wZXJ0aWVzOg0KPiA+ICAg
ICAgICAgICAgIGNvbXBhdGlibGU6DQo+ID4gICAgICAgICAgICAgICBjb250YWluczoNCj4gPiAg
ICAgICAgICAgICAgICAgZW51bToNCj4gPiAgICAgICAgICAgICAgICAgICAtIGFzcGVlZCxhc3Qy
NjAwLWkyYy1idXMNCj4gPiAgICAgICAgIHRoZW46DQo+ID4gICAgICAgICAgIHJlcXVpcmVkOg0K
PiA+ICAgICAgICAgICAgIC0gYXNwZWVkLGdsb2JhbC1yZWdzDQo+IA0KPiANCj4gZWxzZToNCj4g
ICBwcm9wZXJ0aWVzOg0KPiAgICAuLi4gOiBmYWxzZQ0KPiANCj4gPg0KPiA+DQoNCkkgd2lsbCBt
b2RpZnkgd2l0aCBmb2xsb3dpbmcuDQppZjoNCiAgcHJvcGVydGllczoNCiAgICBjb21wYXRpYmxl
Og0KICAgICAgY29udGFpbnM6DQogICAgICAgIGVudW06DQogICAgICAgICAgLSBhc3BlZWQsYXN0
MjYwMC1pMmMtYnVzDQp0aGVuOg0KICByZXF1aXJlZDoNCiAgICAtIGFzcGVlZCxnbG9iYWwtcmVn
cw0KZWxzZToNCiAgcHJvcGVydGllczoNCiAgICBhc3BlZWQsdHJhbnNmZXItbW9kZTogZmFsc2UN
CiAgICBhc3BlZWQsZ2xvYmFsLXJlZ3M6IGZhbHNlDQoNCj4gPiBJIGNhbid0IHNlZSBob3cgd2Ug
Y291bGQgcmVwcmVzZW50IGFzcGVlZCx0cmFuc2Zlci1tb2RlIHRob3VnaCwgYXMNCj4gPiBpdCdz
IG9wdGlvbmFsIG9uIGFzcGVlZCxhc3QyNjAwLWkyYy1idXMsIGJ1dCBwcm9oaWJpdGVkIG9uIG90
aGVycy4gQW55DQo+ID4gaGludHMgb24gdGhhdD8NCj4gDQo+IA0KPiBJdCdzIHNob3duIGluIHRo
ZSBleGFtcGxlLXNjaGVtYSwgaWYgd2UgZ28gdGhhdCB3YXkuDQo+IA0KPiBCZXN0IHJlZ2FyZHMs
DQo+IEtyenlzenRvZg0K

