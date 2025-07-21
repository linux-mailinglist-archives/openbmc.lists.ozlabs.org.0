Return-Path: <openbmc+bounces-388-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B4BB0BBA8
	for <lists+openbmc@lfdr.de>; Mon, 21 Jul 2025 06:10:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bln4H736gz3bgV;
	Mon, 21 Jul 2025 14:10:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c40f::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753069507;
	cv=pass; b=AVtbCx8jmj+Y+plbn+81IaMVDhszIh1yXCCuW40nnJinX0zWSvZFURkBvhq/5jSKvpxgHpkY3M1TAYc5xAw+Aex+pfvbV0Urs0MzdDOd1XiL8FDgJECzXP9hHg3BKEGjniwiKYqoxWLgksbUjte6GmyScznnjDGzrzS8KTA/9J7PzNwWLvtp7WEdJ/SRmvJr44ntml0A4uqxygTpI+c2vh3wndhVsT+NWy81QNSKXOOOAPirA3Dnch92vo6/++O49RB01maWt18ETIuVYaXWWm8pfnE69l9DpR0KeGY5r6+Hax7gprdaI8tVUKnMD1BQFKq4lfJ5tj8FY8joMD/kgw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753069507; c=relaxed/relaxed;
	bh=LwQdTLJRjoQPdEv4emAWAajwr0ekPzcLYpjkYUSYZ8A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=M8mbXnWgqyw3crym6PJtIGqeVpJEffBGZLMFuIDwQCMhhTdv9sljZe4Wi5OjG2FTcpWC3jLqmyRPT6EyBuo+CDPw0x8b0/xPMYFRwVDk/9vsOyRi95aGP//oLPObyGCSGoYgYZAWXykq5gWGmEdW0mkz2mtlnfHFPMFvt+pBS56HrKIKvZ9ZEN7n+1R723p8g2R6ny9VW4Noba2ix4EIk5cACCueHKn9CXf7+QdEXk4U2N/NL/QMXgGQ7vbC9b9nC+niy9W3iQBbV6To7xaEt3HNnBmaMlckPxKxe6x8Co/gXNXoSLDouK6Yxz745BfpyQzDsU06w6Hv9+bfDCEbgg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=YrZ9y0uG; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c40f::7; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=YrZ9y0uG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c40f::7; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c40f::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4blmW63tVrz2yFQ;
	Mon, 21 Jul 2025 13:45:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rlwDne5CWUhL5bI6BapO2BDJE21fGqhv5x3PES0vIgEIC29NuukYLBPTCaHQyQhXH8+mKMil1BudJEiKr3/c2pk4jrA43UyS+N8e7COPyWdFZZdEmH98fy4xGjoPdJRljlBgINBkFA8vqOrzeYVyDrNvUshai3KjROUsaAxcTkAYq22r+TF//tmU0lbmRO1WwZVXAJqUH6QtiCsR1SE1xikU5HuAYeQGdtRsmpgNz1sOuVq/2ZlZE7GkstGyWKYmhyaHEbYe+SAeBRb4HLXm0HWzVgxR656Z+e1S+IeORtkh+7wk+aKO+CJKhpiPmmjHJvPDFo7n4wJ3Uaew8nJA2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LwQdTLJRjoQPdEv4emAWAajwr0ekPzcLYpjkYUSYZ8A=;
 b=W4LSxhmGYqu/n828NdnKxZ+drfs9YcaLE/iZQMeU8eLs5puR0vpUb4IjryMdYAIFxeVbxCWigZ5raYgCvaJvavQRJHOVaWjDtRG8ZI+6FvvM5yOwT/O9nah1Fu5BL4HXGT+P39izRpZyhWRdst+lCIBBgYIOk5nLBub1wmTD/qlK9i7Ec0HZXdjIEfJ7MsUKjmxPJQgTLxswFnFtdge5DCPpy/4FbKwDR2b/MMhhjy2v+hGUnCkdmBUn0/58LFp30RE8ibA2EmsMxo/Hjjimw9V5QJukXBjJIlvHnFylwUHdVBZJwTnCEfVU9JktQt6CBrYAHpcsFYUNW8p9G8YGlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LwQdTLJRjoQPdEv4emAWAajwr0ekPzcLYpjkYUSYZ8A=;
 b=YrZ9y0uGnUaJKg/NH7Yy5uGiO7Afv7oNIIHMeqbS8y614vFaGGRLSHv0yZHR4x6myH3v0G6RsNJz5E+jZYV7ellpc5pkdgwJ/eXvpSAdK6wmZgw/M8RbV9KYalx/U4qpghXfQLFRGn07R5w6YtFEIt/vcM05g8MKWepfy2ZIqdhDrmJOLVpoGLWBsXx9hEVKjQ98SYhbk5bi/rdcvhuJMwrNeBajP9CZPSbp9hCd1qXQzGe7PutFhBme5ElYK9LOebqit3FhitR8KMpn+y/9k2uYK2u14lfJvAb+plcZqOX6RPWci+tH8iWgCrVT6i1OvGm3g4P9VVKU9XYhjPitvg==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by SEZPR06MB5716.apcprd06.prod.outlook.com (2603:1096:101:ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Mon, 21 Jul
 2025 03:44:42 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%7]) with mapi id 15.20.8943.028; Mon, 21 Jul 2025
 03:44:42 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "bhelgaas@google.com" <bhelgaas@google.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, BMC-SW <BMC-SW@aspeedtech.com>
Subject:
 =?utf-8?B?5Zue6KaGOiBbUEFUQ0ggdjIgMDMvMTBdIGR0LWJpbmRpbmdzOiBQQ0k6IEFk?=
 =?utf-8?Q?d_ASPEED_PCIe_RC_support?=
Thread-Topic: [PATCH v2 03/10] dt-bindings: PCI: Add ASPEED PCIe RC support
Thread-Index: AQHb9Tqluvu+j8IqukaI5O+ZADic27Q0bGoAgAeKr/A=
Date: Mon, 21 Jul 2025 03:44:42 +0000
Message-ID:
 <SEYPR06MB5134F8732785F280CB4339309D5DA@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20250715034320.2553837-1-jacky_chou@aspeedtech.com>
 <20250715034320.2553837-4-jacky_chou@aspeedtech.com>
 <20250716-watchful-enigmatic-condor-0fc6b3@krzk-bin>
In-Reply-To: <20250716-watchful-enigmatic-condor-0fc6b3@krzk-bin>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|SEZPR06MB5716:EE_
x-ms-office365-filtering-correlation-id: bbdb84c7-f2c3-45c0-38f4-08ddc808ed72
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QnZlb3BvbU91VkZNNm5kNUZYQXlaQzVCWW93Ty9qRldwSDFtcDRlNFRSTC8w?=
 =?utf-8?B?MmFzMTJKS1krYnRjaHlkcmhsSjBVVnF4MU9ZUXdqSWp5UVc3V29JNi8vNCt3?=
 =?utf-8?B?OTBwbWNlaDBvOGh3cENMeVNrd0IyYlFUYktybFRVZ05uT1lyRDVTK1Q4N21l?=
 =?utf-8?B?TXhVeWs5ekhrZGlCcmxxZE52WlhYWU5XMklDcDlwcHU5ZlVzSDNmRk95U1pQ?=
 =?utf-8?B?N05mL0doNnFlRmNyTlpvelFSd0hyMDVKTzFEa05FWjU3V0pOSWVhWTdNalg3?=
 =?utf-8?B?cUhDc3d6NngzTnV0YXc0QVpBbGp3WUFPbUFoS0dOS3dZUFAxOHJRZ2pIMmZ6?=
 =?utf-8?B?Z2FCaGs4WjhkalZXSmgvM2ZEUFEwN3BQTGMySTR6YnQybUxrV1BPUzNML2NC?=
 =?utf-8?B?K212bGdVVVppcnRIejM3Mm9za2doVkxCb1RpaUd1ZVREckVrTGV4U0x5ajZZ?=
 =?utf-8?B?ZExCMDJnR0JoaVM2c3Mrczd0dWw3aWw0blRrU0M0Q2xoYUxFVndnUFBMYUlG?=
 =?utf-8?B?M1loaTdrZW02cWVlRDUvZlhXYmZUMFBnTndhYU1TdnFuaEN0Z2NabU42WnQ1?=
 =?utf-8?B?cDJLWFBFT2pYNy9xNzZNWG5EWVdaYVJqZnVZc0RGUjBGbzlxMS9rU1VpN1o1?=
 =?utf-8?B?OTZPRWxkUlpYbmJsU3B3MnU5RmxhOEtIL0FPQWF2M2JsWFNxM0J1VUxIT3VL?=
 =?utf-8?B?Y0g0c3BaT3VRanJDYzVNN2tmcTdGS1IzYzFHT01JaU9rTHlqd0VhTDd1dmo3?=
 =?utf-8?B?QnJxdFZFZXRMWWRwMitwWE5mUFNFUE5sWlhuRERVQkF2K2VlVmp6Tjl6MkVI?=
 =?utf-8?B?WUI3UlR0VDJrOFBhZVhXLzhLcGM4RmVBTENJYnVnWm1zOFVDL25Zdk1KOXFl?=
 =?utf-8?B?MEE0djkvU09nZE84eElvOFBHMTRzVnNTdE5iUHo5SklmVFNPUXI0WnhVZWZh?=
 =?utf-8?B?d0JjOC9xaVdoaHFFL3VWYjU4UWRPZThHQXgwaE5Wd1QybFJ1OWFXaVpkS0pm?=
 =?utf-8?B?RkNRZGtnY29wM0g2d2s1TmdBdC9XZ2ZXN2VLZ05KZm5GWlZpTzIwVlRVYnlX?=
 =?utf-8?B?aW9Ub0YrWldJRklkT3ZLK3VBaEdqc0dXZkY1THU5T2ZXazN1bldvaFZOLys5?=
 =?utf-8?B?Z3lQUEswNDVzcElIS3Y5a2JOeTVBZzJvQVJsUDkyYXh2am1UZlRiVHYwVUZv?=
 =?utf-8?B?MjJYWVM1bmZHRXpibUs0MjJScGZ6Z205V0g1WlBRSnVqaWdjQkNrdHFDMGZs?=
 =?utf-8?B?SWdsdXlXeDRRazc3TFdRZTMxV1FNZnl3aEQyR3B5dVpXQXFQYkZ6RGppNmd6?=
 =?utf-8?B?ZWxMSStaS0JreUxNYnN3RlU1bmQ5eTBHMlB4RmEvS2Ztald1UDhOWWp3STZm?=
 =?utf-8?B?ZVBCenZmYnRaYk0rRit5a0dWVXJOcUFhR3lhKzBmcDVNbDRoQ2dKY0hvWnM2?=
 =?utf-8?B?NUMxYTlJUVZUU1NKS2xrSWxvM2VkTE5vblNsZUYyT0xySGYwQmVRZkhUUEJ3?=
 =?utf-8?B?MkRaSUdCemxBTWtuY2ovWlQ0VHpTOWk5TnNUNXpiTklpY0hvK0tRb2VmeFRY?=
 =?utf-8?B?MkQrVnl5T1hEMmxRSEZrRWZrWVhWTDdXM29iT3VIb3crU25CRWxFcWthT3Zr?=
 =?utf-8?B?bzVhS09GMkJ5YlJ4dGNtdmlDZmZ0SUllbktQSjVLS2FQZW5icThReStmMTRZ?=
 =?utf-8?B?NlBUa1lGaHUxZUlCOUtXb2RVTGtRQzZqZS9hb2M2UVlkSUtiYTZRV09uWUtx?=
 =?utf-8?B?ejJ1aGp3UkJvYzMrWVJoOHJrZTcyRFpCWStSV3R4cW1uYVAxU0hDRkllS1d4?=
 =?utf-8?B?QWJNYmkvVWVQRnJnQjBMa1lONHplbW5HWjQzdTI0bkpGbjNlcStUdldJK3pl?=
 =?utf-8?B?TUsrTG4zeFpoN3llYlNlcWU1Q1RPc2t4S3NjeU4vUUsvd2tUYm5BVkU3V2ZU?=
 =?utf-8?B?ZEIwblVYRVgzQVA1eVA2M0s5OVZqWHJkbWkwZE9zNGVaR3RMTTNRTWtpWTdS?=
 =?utf-8?B?YXVxSXNPUDJBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YVFQUzhtNkV3eXBsY1ZDSTFDZERwWktPeHNvbjBIQjdrWmZKcDJSMzJXYW01?=
 =?utf-8?B?YTNwWTE4REFiMnNUalQzZGRTSEJTb3VIRUcvN243Vk94UGF6MkNTdmNpcHdt?=
 =?utf-8?B?cWp6LzJBWUJ4b3ZvNmdVZnFraWZ3dDBKRWNQZzVCYnhTL2tac2FkeldtbTBr?=
 =?utf-8?B?aG4ybTRaZWFOaWVUUFM3Vi9Jb2c3d1BZSFFmdWdCVHJFaVZYa2pwSXB1MzV0?=
 =?utf-8?B?bHhPU1piQ2Z4Mk5rbXpzR09oQnFLdjJ2RFYxcHpKK3F6QU4rNjFiRTRNQ1FE?=
 =?utf-8?B?T2N0QVdyZGR2eEgzaGxaQUpKUmZiQWRoMGp5YWFhL0JBbTh0dWV2Y2tGeDhz?=
 =?utf-8?B?eEdCZCtHWG9oVDZZd0ViQW1jVDJ4anRBV0ZlM1pMWTBka01jc2xrOHdLQVpo?=
 =?utf-8?B?b3E2eGRYYVpVR3lEZTBBT1hwL2RaaERadlovY25mRmM5c3JKdmVmVUdLWEg1?=
 =?utf-8?B?azBmOU9lSlJyRkQzcGdhalYrWWszakZqY2RUdVAxdlVveG1hTDJIdHY5azMy?=
 =?utf-8?B?Q0p6bEdodUpJZzlQbnJHanJKT2duU1JMMW5nTlBmdUVjK2w1OUt4dFNseVBo?=
 =?utf-8?B?RG5SUlRvMjlOYnR6eUVpczBUOGdRdUlObWMvM0tTaUJBRW1BdUFVUzRCVEFP?=
 =?utf-8?B?OW1SZ0lveEQ5WW5TMEV6bFcvOU1rcmFsdENIbzhHZlBuVXNMOTBOLytMc0J1?=
 =?utf-8?B?UU94T3k4R09SVnFqb3BRekc2MGd4d2wxK1doWEtVNXVncEg0WHFVSC9WSTU2?=
 =?utf-8?B?ZzdVYU5qbEhvNDBXU3VuZVVaR01WOEdnZ0s2cHRHTUswNWo5enZ6MmlwNHUw?=
 =?utf-8?B?M21OclZYcy9pRE5OQllmY2NRMkl6Y21jd1FnR0hlOWZiaGZuSGtGZ3V4aHpW?=
 =?utf-8?B?cFYxa3JxczNjZUh2MG5aOHltRzIzQnQ0TFBRWlQ4elR1QzltamdJRlhjT1Qx?=
 =?utf-8?B?R05BYkUzR2NqaVg1bmh1dlgxenBLek5hT3lCbGZMZ2pRWGczYnRpd2Z6Ty9s?=
 =?utf-8?B?QnI2bVdtN3VMWFNzcEp0cjh3cEdCVnpDNWlFazZINTNrMEh4T082NnFLdVJj?=
 =?utf-8?B?dzlaQlp2RDFkMDNQUjlIVnhPUE5sUmNUQnYwVmp6OHBCR2hvRVM1UVpsY3lx?=
 =?utf-8?B?WXRvbG5oOTYxK2VJM0l3TXBFQ0xRSFQrZGo0em4wOVhJQU5nRHRPcDNSZXg0?=
 =?utf-8?B?SjJOL0lMUjVld0NFaXZkbTB0dnN3SFVJQnErc2gvTUNwYkFhNjhldEh0VytX?=
 =?utf-8?B?Z2JHSk1DQVBQdDhvS0kyVU1PS1NuQjFld0Y4VzJ5bWVqcUxGVDh4QTBxSDFN?=
 =?utf-8?B?bk9OME9KeExjTWRac1gyRTV2YXdpWUJtQ1FoRW54TzhaVXBIRVBRUDlGSVUr?=
 =?utf-8?B?UHpEWUlYQXB0NkZWWENIaG1hbHVPM29DbnF6eGVwM2JmY2dsNk5rYlhad1Jp?=
 =?utf-8?B?VlV1bzJ1bG4wVlB5SndXR3FHMFFQQjNZNFZnMUF1dUZWOVR3azNYdDV5Y1p1?=
 =?utf-8?B?UXkrNEhJclUvdDR4bG8vRGgvbFR1OFZkVWNYVHhFV0NYREJNWThjVk9RQWVt?=
 =?utf-8?B?V3k0Q01HQUo4NFBzN09ETkE5c1YxVkI1bEkvRXluWFFISXN3aWZCRDF2aTdR?=
 =?utf-8?B?TzkyMmthT01NU0FYVldya3JaMXU3TUVtODJJdVR3d2NYbWRCMTNxWWhkK3c5?=
 =?utf-8?B?KzVKTmUyQStROFZLcmNpcUx5a2t0MVZYdDRoUUVDck5HK3hqZ1ZIbzNJSkR2?=
 =?utf-8?B?NmU2TzZ2Q2V2TEpvTEFSZlB4c0Z1Z2RycFFiRS8vNFZ6eEdSeXBGWFc1QWdD?=
 =?utf-8?B?VXd6VWdIRXl1QU01bEovYzdPaVJwMlVWclhMMmVwcEhlQzJwTUU5MWRocFEy?=
 =?utf-8?B?VjZscVRPQVdvQ1dQRVkwS0daSTA0TXRtemg0aHBiTm1BOTk3YnhwdkZkL0RY?=
 =?utf-8?B?SENqL3hvZHF2aWV2bGlPbXd6RjhZeWE4U2t0YkRWQXNpU0FzcTZ3eUZjR1Ft?=
 =?utf-8?B?cUIxRDI3a2JaL2YvdGpjd0FuaFJ6cTZVeW4xQTBGSCtBMjBJOUduN3h3ZlNL?=
 =?utf-8?B?cEtTbkJFS24rMlJ2WjRpM2NDdTB1YXBtSUFlMkt6N3ZId3JXdmF5NFJxVVBx?=
 =?utf-8?Q?+Zh2t0Ax2ziJwoh7FoRuNOQFn?=
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
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5134.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbdb84c7-f2c3-45c0-38f4-08ddc808ed72
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2025 03:44:42.4984
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oLTac9HB6olsWjcWdnzHMPyzdpmuC3JQlctV85b7aIArwTA+pQInggG+qUBDrwXQdZhX5ONoDuFwAeMouMDuvko6Cw/KgEfjQRh9iq09Ogo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5716
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

SGkgS3J6eXN6dG9mLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuDQoNCj4gTm8sIGRlc2Ny
aWJlIHRoZSBoYXJkd2FyZSwgbm90ICJ0aGlzIGJpbmRpbmciLg0KPiANCj4gPiBjb25maWd1cmlu
ZyB0aGUgUENJZSBSQyBub2RlLCBpbmNsdWRpbmcgc3VwcG9ydCBmb3Igc3lzY29uIHBoYW5kbGVz
LA0KPiA+IE1TSSwgY2xvY2tzLCByZXNldHMsIGFuZCBpbnRlcnJ1cHQgbWFwcGluZy4gVGhlIHNj
aGVtYSBlbmZvcmNlcyBzdHJpY3QNCj4gPiBwcm9wZXJ0eSB2YWxpZGF0aW9uIGFuZCBwcm92aWRl
cyBhIGNvbXByZWhlbnNpdmUgZXhhbXBsZSBmb3IgcmVmZXJlbmNlLg0KPiANCj4gRG9uJ3Qgc2F5
IHdoYXQgc2NoZW1hIGRvZXMgb3IgZG9lcyBub3QuIEl0J3MgY29tcGxldGVseSByZWR1bmRhbnQu
DQo+IERlc2NyaWJlIHRoZSBoYXJkd2FyZS4NCj4gDQo+IFlvdXIgZW50aXJlIGNvbW1pdCBpcyBy
ZWR1bmRhbnRuIGFuZCBub3QgaGVscGZ1bCBhdCBhbGwuDQo+IA0KDQpJIHdpbGwgcmV2aXNlIHRo
ZSBjb21taXQgbWVzc2FnZSBpbiB0aGUgbmV4dCB2ZXJzaW9uLg0KVGhhbmtzIGZvciB5b3VyIGd1
aWRhbmNlLg0KDQo+ID4NCj4gDQo+IC4uLg0KPg0KPiA+ICsNCj4gPiArICBhc3BlZWQsYWhiYzoN
Cj4gPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUN
Cj4gPiArICAgIGRlc2NyaXB0aW9uOg0KPiA+ICsgICAgICBQaGFuZGxlIHRvIHRoZSBBU1BFRUQg
QUhCIENvbnRyb2xsZXIgKEFIQkMpIHN5c2NvbiBub2RlLg0KPiA+ICsgICAgICBUaGlzIHJlZmVy
ZW5jZSBpcyB1c2VkIGJ5IHRoZSBQQ0llIGNvbnRyb2xsZXIgdG8gYWNjZXNzDQo+ID4gKyAgICAg
IHN5c3RlbS1sZXZlbCBjb25maWd1cmF0aW9uIHJlZ2lzdGVycyByZWxhdGVkIHRvIHRoZSBBSEIg
YnVzLg0KPiA+ICsgICAgICBUbyBlbmFibGUgQUhCIGFjY2VzcyBmb3IgdGhlIFBDSWUgY29udHJv
bGxlci4NCj4gPiArDQo+ID4gKyAgYXNwZWVkLHBjaWVjZmc6DQo+ID4gKyAgICAkcmVmOiAvc2No
ZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlDQo+ID4gKyAgICBkZXNjcmlwdGlv
bjoNCj4gPiArICAgICAgUGhhbmRsZSB0byB0aGUgQVNQRUVEIFBDSWUgY29uZmlndXJhdGlvbiBz
eXNjb24gbm9kZS4NCj4gPiArICAgICAgVGhpcyByZWZlcmVuY2UgYWxsb3dzIHRoZSBQQ0llIGNv
bnRyb2xsZXIgdG8gYWNjZXNzDQo+ID4gKyAgICAgIFNvQy1zcGVjaWZpYyBQQ0llIGNvbmZpZ3Vy
YXRpb24gcmVnaXN0ZXJzLiBUaGVyZSBhcmUgdGhlIG90aGVycw0KPiA+ICsgICAgICBmdW5jdGlv
bnMgc3VjaCBQQ0llIFJDIGFuZCBQQ0llIEVQIHdpbGwgdXNlIHRoaXMgY29tbW9uIHJlZ2lzdGVy
DQo+ID4gKyAgICAgIHRvIGNvbmZpZ3VyZSB0aGUgU29DIGludGVyZmFjZXMuDQo+ID4gKw0KPiA+
ICsgIGFzcGVlZCxwY2llcGh5Og0KPiANCj4gTm8sIHBoeXMgYXJlIG5vdCBzeXNjb25zLiBJIGFs
cmVhZHkgdG9sZCB5b3UgdGhhdCBpbiB2MS4NCj4gDQoNCkkgd2lsbCByZW1vdmUgdGhlIGFzcGVl
ZCxwY2llcGh5IHN5c2NvbiByZWZlcmVuY2UgYW5kIHJld29yayB0aGlzIHBhcnQgdG8gdXNlIHRo
ZSBzdGFuZGFyZCBwaHlzIGJpbmRpbmcgcHJvcGVybHkuDQpTb3JyeSBmb3Igb3Zlcmxvb2tpbmcg
eW91ciBwcmV2aW91cyBmZWVkYmFjayBpbiB2MS4NClRoYW5rcyBhZ2FpbiBmb3IgeW91ciBwYXRp
ZW5jZS4NCg0KPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMv
cGhhbmRsZQ0KPiA+ICsgICAgZGVzY3JpcHRpb246DQo+ID4gKyAgICAgIFBoYW5kbGUgdG8gdGhl
IEFTUEVFRCBQQ0llIFBIWSBzeXNjb24gbm9kZS4NCj4gPiArICAgICAgVGhpcyBwcm9wZXJ0eSBw
cm92aWRlcyBhY2Nlc3MgdG8gdGhlIFBDSWUgUEhZIGNvbnRyb2wNCj4gPiArICAgICAgcmVnaXN0
ZXJzIHJlcXVpcmVkIGZvciBsaW5rIGluaXRpYWxpemF0aW9uIGFuZCBtYW5hZ2VtZW50Lg0KPiA+
ICsgICAgICBUaGUgb3RoZXIgZnVuY3Rpb25zIHN1Y2ggUENJZSBSQyBhbmQgUENJZSBFUCB3aWxs
IHVzZSB0aGlzDQo+ID4gKyAgICAgIGNvbW1vbiByZWdpc3RlciB0byBjb25maWd1cmUgdGhlIFBI
WSBpbnRlcmZhY2VzIGFuZCBnZXQgc29tZQ0KPiA+ICsgICAgICBpbmZvcm1hdGlvbiBmcm9tIHRo
ZSBQSFkuDQo+ID4gKw0KPiA+ICsgIGludGVycnVwdC1jb250cm9sbGVyOg0KPiA+ICsgICAgZGVz
Y3JpcHRpb246IEludGVycnVwdCBjb250cm9sbGVyIG5vZGUgZm9yIGhhbmRsaW5nIGxlZ2FjeSBQ
Q0kNCj4gaW50ZXJydXB0cy4NCj4gPiArICAgIHR5cGU6IG9iamVjdA0KPiA+ICsgICAgcHJvcGVy
dGllczoNCj4gPiArICAgICAgJyNhZGRyZXNzLWNlbGxzJzoNCj4gPiArICAgICAgICBjb25zdDog
MA0KPiA+ICsgICAgICAnI2ludGVycnVwdC1jZWxscyc6DQo+ID4gKyAgICAgICAgY29uc3Q6IDEN
Cj4gPiArICAgICAgaW50ZXJydXB0LWNvbnRyb2xsZXI6IHRydWUNCj4gPiArDQo+ID4gKyAgICBy
ZXF1aXJlZDoNCj4gPiArICAgICAgLSAnI2FkZHJlc3MtY2VsbHMnDQo+ID4gKyAgICAgIC0gJyNp
bnRlcnJ1cHQtY2VsbHMnDQo+ID4gKyAgICAgIC0gaW50ZXJydXB0LWNvbnRyb2xsZXINCj4gPiAr
DQo+ID4gKyAgICBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gPiArDQo+ID4gK2FsbE9m
Og0KPiA+ICsgIC0gJHJlZjogL3NjaGVtYXMvcGNpL3BjaS1idXMtY29tbW9uLnlhbWwjDQo+IA0K
PiBObyBvdGhlciBiaW5kaW5nIHJlZmVyZW5jZXMgdGhpcy4gRG9uJ3Qgd3JpdGUgY29tcGxldGVs
eSBkaWZmZXJlbnQgY29kZSB0aGFuIGFsbA0KPiBvdGhlciBTb0NzLiBUaGlzIGVudGlyZSBiaW5k
aW5nIGlzIHdyaXR0ZW4gc3VjaCB3YXkuDQo+IA0KDQpBZ3JlZWQuIEkgd2lsbCByZW1vdmUgaXQg
aW4gbmV4dCB2ZXJzaW9uLg0KDQo+ID4gKyAgLSAkcmVmOiAvc2NoZW1hcy9wY2kvcGNpLWhvc3Qt
YnJpZGdlLnlhbWwjDQo+ID4gKyAgLSAkcmVmOiAvc2NoZW1hcy9pbnRlcnJ1cHQtY29udHJvbGxl
ci9tc2ktY29udHJvbGxlci55YW1sIw0KPiA+ICsgIC0gaWY6DQo+ID4gKyAgICAgIHByb3BlcnRp
ZXM6DQo+ID4gKyAgICAgICAgY29tcGF0aWJsZToNCj4gPiArICAgICAgICAgIGNvbnRhaW5zOg0K
PiA+ICsgICAgICAgICAgICBjb25zdDogYXNwZWVkLGFzdDI2MDAtcGNpZQ0KPiA+ICsgICAgdGhl
bjoNCj4gPiArICAgICAgcmVxdWlyZWQ6DQo+ID4gKyAgICAgICAgLSBhc3BlZWQsYWhiYw0KPiA+
ICsgICAgZWxzZToNCj4gPiArICAgICAgcHJvcGVydGllczoNCj4gPiArICAgICAgICBhc3BlZWQs
YWhiYzogZmFsc2UNCj4gPiArDQo+ID4gK3JlcXVpcmVkOg0KPiA+ICsgIC0gcmVnDQo+ID4gKyAg
LSBpbnRlcnJ1cHRzDQo+ID4gKyAgLSBidXMtcmFuZ2UNCj4gPiArICAtIHJhbmdlcw0KPiA+ICsg
IC0gcmVzZXRzDQo+ID4gKyAgLSByZXNldC1uYW1lcw0KPiA+ICsgIC0gbXNpLXBhcmVudA0KPiA+
ICsgIC0gbXNpLWNvbnRyb2xsZXINCj4gPiArICAtIGFzcGVlZCxwY2llY2ZnDQo+ID4gKyAgLSBp
bnRlcnJ1cHQtbWFwLW1hc2sNCj4gPiArICAtIGludGVycnVwdC1tYXANCj4gPiArICAtIGludGVy
cnVwdC1jb250cm9sbGVyDQo+ID4gKw0KPiA+ICt1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNl
DQo+ID4gKw0KPiA+ICtwYXR0ZXJuUHJvcGVydGllczoNCj4gPiArICAiXnBjaWVAWzAtOWEtZixd
KyQiOg0KPiANCj4gV2h5IGRvIHlvdSBuZWVkIGl0PyBBbHNvLCBvcmRlciB0aGluZ3MgYWNjb3Jk
aW5nIHRvIGV4YW1wbGUgc2NoZW1hLg0KPiANCg0KVGhhbmtzIGZvciB5b3VyIHF1ZXN0aW9uLg0K
DQpJbiB0aGUgdjEgZGlzY3Vzc2lvbiwgYW5vdGhlciByZXZpZXdlciBzdWdnZXN0ZWQgdGhhdCB3
ZSBzaG91bGQgc3VwcG9ydCBhDQptdWx0aS1wb3J0IHN0cnVjdHVyZSBmb3IgdGhlIFBDSWUgcm9v
dCBjb21wbGV4LCANCndoZXJlIGVhY2ggcG9ydCBpcyByZXByZXNlbnRlZCBhcyBhIGNoaWxkIG5v
ZGUgKGUuZy4sIHBjaWVALi4uKS4NClRoYXQncyB3aHkgcGF0dGVyblByb3BlcnRpZXMgd2FzIGFk
ZGVkIGhlcmUg4oCUIHRvIGV4cGxpY2l0bHkgYWxsb3cgc3VjaA0Kc3Vibm9kZXMgYW5kIHZhbGlk
YXRlIHRoZW0gcHJvcGVybHkuDQoNClRoYW5rcywNCkphY2t5DQoNCg==

