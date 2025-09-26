Return-Path: <openbmc+bounces-693-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A830BA259A
	for <lists+openbmc@lfdr.de>; Fri, 26 Sep 2025 05:45:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cXxM36wGqz307q;
	Fri, 26 Sep 2025 13:45:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758858351;
	cv=pass; b=EIcBvh93++d2L/Ah3OTE7sFSw/SM7f/nMzw+fAPoqI3CJHOvvYNiAy9lxc1g6sk8pv8EDmkce9+Ewm6KvP/aFlJq3lCN3DLJSIVhhH5HXmau9IQfIHy5pNW00JhLBuHs0jajMesY8WuVBSbYba0l819ps2yZLX5XbegkCant6EvUNMsQgrtQFq166NpAxfgSaAosM1VgA0k/9QdBnXwiQ27qOe/v3a2p/m6iwQGxOvWsaa/5/0XOmjajmt0TRwRqHMN7s5R0HL9jS2zcv58rZkbwju0+xIZHqit2uVCo5jfZ5IlVVFlp/S8RIASb8DU2+cIxVCXZgsNFoWgtCmUM7A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758858351; c=relaxed/relaxed;
	bh=uJijRBiuWKYOInnH/x9GHJ3uiNN7VVY9ZGXgMRjWxCc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BRHFDWFA4enRQIRrU3EGdLBvADBBDabKBuXRgNMTFsvkhKVE1qLC0AqpEqf76iydYcgkAtNIELS3FI9l0AEh7tXweNVpFJidav+AYD4Nb0Xg9Sk3m+mKFsc5YK7zlGe/Swmr4cfiAJ5jsNNt2+E0sU5H23U/xlv5iXfkV2VFVyEuGsn0YqUPBDe97Nz/XJytVRkp1OKBYDjanuikClnjTALmiiBxqv8la2HaHGXTOoVtKIFtwviqPpUk+/XVwodvQdAfc6D3nV9bWa0KMgHse8+EH3YUqML7ZwicY9YIsMWAJWPt9VyxnnchjMfjZZcSQP3NrbwNImdzKNNaZ/MUtw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=UlJHf4gL; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::5; helo=typpr03cu001.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=UlJHf4gL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c405::5; helo=typpr03cu001.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cXxM23Cs8z2yrP;
	Fri, 26 Sep 2025 13:45:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cjKOgq9Frq81YZ69GNSDxD1Vz5rUHZV1s5yAcLpueLMeTajmaNq4Etoook3oIRzcZLB39/a2w4Ky4jx3Wj47zm1ZvubaTjizJJIGXi6xJFgQKOqi+7I45coB57N4Nbn/bw0IxLvb7G3n5XxEoEu46LKeeJ6PCp0aEhxP9wTLP3DsS8LmzXJj03wJc0WhhmiN5CkcyUCyA82yXhUP/5MHiwk0+C2+KFGU6e2snL62VPDu9YQVD+lrjLFHZaQD1kYY8Ngt738xPdSLWNs44UkNWJWA4+z4bc8AzMN9vz3UYIOYfloFFJXHcNniXr/e1z06qigl8khbgdOJqauPBzbn1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJijRBiuWKYOInnH/x9GHJ3uiNN7VVY9ZGXgMRjWxCc=;
 b=UWeWpnsNftUf9u0HPXJcwM//mlTqgdqkjGAAlvECLogOoCG3lZHQkXk/FBwW5vlb89ihaPgKnYwLDNxIvnqbHBYRdFEKqpgEdfycGSzq2qac0YV+nMzwYTXLtYDJW+Q/SHJhc0CenhT02qOXHa/HPX3T4gUds6Vl1tNMqOQyeNDSQ3+eihIXO/fJcMm/UiWvciAAE79sIE91yvaRqfz6DAzyKhnyQ+jtzQ2BVqWu+wy+lK+zpnc2DJozAEjb/shbi3TM3wSK3y5vRPpVqm3q+IXq4+eBtXuHfOeLAEvKzqwBpZHXs/SwaAGWOElvZ8KyHhH1wuPkkQDbhQVJuh58jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJijRBiuWKYOInnH/x9GHJ3uiNN7VVY9ZGXgMRjWxCc=;
 b=UlJHf4gLCskKLk1EdV+P439Azk8vFyzlkF842HPTm9s8h9lyWJb5LHqTc78yrlzOiToiE/y+CCcN0yVK6+kh6nFHdT7/UyXeFsyraADqaik08YwUcRIH4jt+gdRgpQ3UdyXka9X2PmsViXFviWmmzVRXH7Jg+2S+DJsAnsbXFQHdqsB06/yBpn2h+AdM9xfOJ4cQfSxzSy45TeQJtAIGQtmOjLl72FB4n09n5YrF+EmbBW6rnetEJIqk1YydH1Uqgb7GydnyRWSD1+d8OIl+6S9kvTkBQ7uHRkEVfIOkCagd6Gn699im3Cjb2Rh3HS6RvbPjVUMgGG+fMHaCChzxCA==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by TYSPR06MB6337.apcprd06.prod.outlook.com (2603:1096:400:42b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 03:45:24 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%6]) with mapi id 15.20.9137.018; Fri, 26 Sep 2025
 03:45:24 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>
CC: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"vkoul@kernel.org" <vkoul@kernel.org>, "kishon@kernel.org"
	<kishon@kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
Subject: [PATCH v3 03/10] dt-bindings: PCI: Add ASPEED PCIe RC support
Thread-Topic: [PATCH v3 03/10] dt-bindings: PCI: Add ASPEED PCIe RC support
Thread-Index: AQHcGwWW5d3OP3gN0EOH5yEQdLB1CbSAZn+AgAOtPwCAIORWoA==
Date: Fri, 26 Sep 2025 03:45:24 +0000
Message-ID:
 <SEYPR06MB51346F1C14DF4F44BD6AD4A69D1EA@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20250901055922.1553550-1-jacky_chou@aspeedtech.com>
 <20250901055922.1553550-4-jacky_chou@aspeedtech.com>
 <20250902211221.GA1179675-robh@kernel.org>
 <xg5avkbsoux7rw7dg67bhf7rupgr66nzak27y2jmcerrqhlb4u@l63vz3jaie2g>
In-Reply-To: <xg5avkbsoux7rw7dg67bhf7rupgr66nzak27y2jmcerrqhlb4u@l63vz3jaie2g>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|TYSPR06MB6337:EE_
x-ms-office365-filtering-correlation-id: 3ccf1300-7bc6-4d8d-c0a1-08ddfcaf200b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?SkVudGRIQUtuM3lHUUp2SUpIdVZ2bStwODIwNEFERU5BTTA3TVBWQndWdnlH?=
 =?utf-8?B?V1lFUHBYRlJ3eFhrYW5sRDlJZVh1UGpxc1pMclp4VmVWTzRkR3lqZE1zVXF3?=
 =?utf-8?B?VDVobUo1RXVJUjJ1dlFyQzNpbUJzdGxwUGZ0YkZ6SmNCVWN0Q0wwa0xiNHpW?=
 =?utf-8?B?SlMzWFRLZWhzLzZFbTlhYzRRU0ljbGJwT3J3V2IvRGpkL2hUcHZxVGpBb0ZD?=
 =?utf-8?B?WUdhb092MC9LN0M3RkNINjFRT0I5TmJSdnRWNGJVakJJTXVRT3lJcHFkK3c3?=
 =?utf-8?B?UXN0QzNIcHA3N2p4MkRRaTRQdkk1SkFOa1p0NjN6cjgvYytHRFhUV1JVWlRP?=
 =?utf-8?B?d3FzNHlUZEZFeDJ6S1dhK1d1eTJkNGhaR1MwL0krOWJxY1o5cEtsOU5ST3A1?=
 =?utf-8?B?b3lqQjJpbnlrQ0xLdGlVMlZhZmNtbUlmallzNDNDT2s1bTllYmZ0K3oyMmk5?=
 =?utf-8?B?WnRZUmU0QzVuZms5V1Z5NWdnZytHTlZRdkI3V1V2VkJUeGpwZ0tmWmhTajRx?=
 =?utf-8?B?aWZBZ3VCamh4dUhadk03VFZqRDJUQUE5VEI2aVhNb2ZWb0l1Wnl5NUpWQjdO?=
 =?utf-8?B?YUFqMW1QMU9MSEc0OFdhK3JObExFbnNqQnh5czlZM3dvNlJIbmZUTDExcUJm?=
 =?utf-8?B?OWo0dVc4R0FSbWRqcHlXWnRsdWFlMzBsTWJBUUdOTjRJZmRCb01nVDhidG4y?=
 =?utf-8?B?WDJuSGp1RjRkKzBtRmlaR2JzV1d2OUJOUFVjbXBqbUVMZFgva0h6VHRGVTVO?=
 =?utf-8?B?SnM5RHRQbHZlL1BTOWExTFgrZVV2a1NCTFdtcUZnKzdyejJCcUVySXVJbWVr?=
 =?utf-8?B?T0l3dC9mWU1EWkc3UjJ2N1JnRTcrYTlmUkRrMll5blJtNzRhdXB3RGZUVGNF?=
 =?utf-8?B?RXBZMDd3ZTlMMkh6Q3NJOUUrKys4QWdTWnpSaEpscGVXMVBiYTRmSTIrNVc1?=
 =?utf-8?B?enR1aWE1MnVDemROVVh6Y0RLbjdpTEJwNno5bDJOOHhYc3UxSS94N0lDVG5Q?=
 =?utf-8?B?NG52L0dkOFVaZGtmdHBjUEJROEpxdUlGMVZzdWczM3VRY2FFR1Vpbk5lS0JG?=
 =?utf-8?B?cTYwUFZTMVAvUlNYZmFJeDFwZlBZWXpYUWxCbUFpQ0RvblZ5bHM1V3dyRVg1?=
 =?utf-8?B?a0RISWo3eWg1bTJ5RW1LSUtlUVp6eCs0OXMvbHN0OTJ1amJRZ0xyaWF2VWo3?=
 =?utf-8?B?Sk9mc2RNS2d2TGVDUGQzTHNlZnFmUUU0VUZQOGFpRnpBRnZDdGdoL1FrNmRs?=
 =?utf-8?B?eGROYVI0L3FSSm5zWGsrbXY4bWJrWGJsdUZFZXB2cDJ4RVdkSG9pM0hYKzVq?=
 =?utf-8?B?VVRDWi9zbXFCeHBISlJLTUMzOUdVWTFJQURJTUtOZDZTYkN2dkNqcGlVTUVL?=
 =?utf-8?B?MlNra2NWK0hKUzNEV0R4WXFUZEVKYmJBbE1zdUZCWTFhWWtkQlFEaXBmK2pI?=
 =?utf-8?B?NjNEQ2R6M3pCcWFWY2RHSHZyNXJITEwxaGZEejlQNnNqby9wVnU3Nzg3K0F2?=
 =?utf-8?B?cjh2S3JZTXlvY21jL1ZOZ2dlZmM5dzhOTUkyZEUwZU9yRkd4MHNhanJUZE1F?=
 =?utf-8?B?MjFHNXZkU0h1ZHdENXFnajhHeE4zNFA4UWxjYUY4RDRwMGlkYlZrbmJzdkJa?=
 =?utf-8?B?SU40Y05XZFloMFE3cklISG9Lc2xLNWxvckpMck8wSmE3UnhNZnc5SkVoMmRU?=
 =?utf-8?B?bU1COGF5VElJK2RxcE85QlJsWHVwaTRTODBPeTZ5bFZLeDhNcHdnY1h6N3pQ?=
 =?utf-8?B?dVhLRjNsTGZpc21zckFmVlJhVWYyamdHeEpGT3hkNlBDclpLNzhuUzUvUTVq?=
 =?utf-8?B?Q1EvN2IrdEpnWEpYRFVUbk9kQXQ3MmE5bDc0K3JOVElEeStPTXp1bko4K2JC?=
 =?utf-8?B?Z2NVZmNvV09BTlRnMENuSWozTHNWVEwyNmFaYmZ6SVVHZnJib2MwMXdFL2pI?=
 =?utf-8?B?TUdNWEhwNHlKUVFyRWpKdFZpNUJxSmMxaDF5eUM4enI3YjZ2WHpTZGMrYW10?=
 =?utf-8?B?Rm5Lc3FsbDdwM00wRExyS25nbFNrUEE0amZzVjdaUU5ibjlwMEFlYVUwd25K?=
 =?utf-8?Q?ppzARc?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RlhSWlBQdU1Dc1EwNHlHMER2T1ltK0phNERydWwxNUJKS01LMVFRVGkxdjFj?=
 =?utf-8?B?SThDalNTMFBLaWpCZ2hsa0RCa1E2N2dzRG5zMG9XdDliVXMvaXNSZ3IxZE1v?=
 =?utf-8?B?TmxIdGJKRFlKL1JldGUxdThONWNNNTh1QUp3aEI2ZTNaby9rRGY5RVZBK2Yw?=
 =?utf-8?B?bnNabEtKTXg1Rnp1QW5vZmIwL3FRS2ttcDI3MXhTMDhVUkdMS3dQVzRmWUFx?=
 =?utf-8?B?YVBCNFMwRUpFQ1hMaEdhK0dkQUJFWnljNFhWb3BsYXRwd0YyNzUvRWQwSWlv?=
 =?utf-8?B?UEZ0MDN3T1Uvc2xyYVlhRXBNdlBKMC96b3dWelFVSVNOVTZUSGpzZndhRVR2?=
 =?utf-8?B?SG1oVjRlT3RRVWR3b2g3ZjExSEtRanRoVk1MRWdlQzlzTzk5U1RGR0JRWE9R?=
 =?utf-8?B?dDh6bWhnSStIZjJpYTNoVm5wZmhZYVl2U3ROVzJUNDkreXU0VGdtWndGL25M?=
 =?utf-8?B?ajd5alZQc0I2cXludERVd0JKU2V5dHVXKzdtZlNqaEcvSmRoamlUUWVmTkNO?=
 =?utf-8?B?LzBrVE5EdHdMUVNCTmMwR0NjK1ZRRlhKcXcyU2JuTEtxNWprWjhXRExnbnd6?=
 =?utf-8?B?V08rSVhLLzRGT1daMytkWXJVTytUeXJyUG56Sy9CRE9Uc1dwcW1LWEh0NzVU?=
 =?utf-8?B?Y3B0Q0RQcWdBL0FjOGhPRm15THlOVllQSnZyUE52dGhKSDVhdlkyK2xUc0l6?=
 =?utf-8?B?OGdVM0dGdHVYZlpZbVVXVjYrRWs1SnRPQzA4WktFRStIYWxVcXRSOTBmSzUv?=
 =?utf-8?B?bEZGeTJyaVVHNGdIVklUZFNLUEFsd2FuUlROR0dWcDR1K01mbk9GTlpkSTBG?=
 =?utf-8?B?eDJXSzZoaithVEZ3NEIyY1BIeVVtMGVYWERwY3c3MVBSZVgySzVtYW4waFZS?=
 =?utf-8?B?UW9HMklERVNNdzVBa1ZIZ080S0xpYVhzd3dVRmxOY3FmVFhYOEQ0MDRvMEdI?=
 =?utf-8?B?dnJ1eUpibkc5VWJrYmZoeUNGa0ZpM01WUmxEQXR0VzlLRHFycVFRZm1UOHN3?=
 =?utf-8?B?UFErbGJrUC9sMDA5MjB3Qko3MDlXcFBJWHdwT1VUcU1QbENnank0ZGhESE5Z?=
 =?utf-8?B?YVFrSS9JYnV4RlJqeU5RUk5KZHJiUExhVGxYL0lielAwRkd5ODZadDYza2Fn?=
 =?utf-8?B?aVRTU3RSS0Rmd1FaUDFYbEo2bGlPNC8ybSt3WFhGcmRscldDWU0xNlE3Qzc3?=
 =?utf-8?B?b2s0TE4zd01qcXBsSnpCcmVyNEhLdWVuQ1ZIaFNvQnV6Z2JkTFZTU0xGYXFi?=
 =?utf-8?B?NkQ5RUhtNkk2bUZ2dWhramJTY1VpamRLY1AzeUM1UVFuOWxOdWF5K1NaNklI?=
 =?utf-8?B?QTFLMjFtYzVCclh2RGk2OXhKUE1hRXUrYVdXczAzdjJrQ3JGUFBJVm5wRzRU?=
 =?utf-8?B?UVRETi9KQ0VhZVRmWTNJN3FMcWVMaXFUdi8vWGlWZWY0UUxJc0FOb2FxRGJT?=
 =?utf-8?B?VXpadUlZZVhUT3V6TS82VHkzSmlHUTNkbDlPOWFoK3RrSEpKdWtYa3E2TVVk?=
 =?utf-8?B?dU1oOHZ2TjlnN3BrZFl6bXh1L1dmWUJJdUxyUUZnZ1o5TzdqVXIyQnUrQVdT?=
 =?utf-8?B?dzRsZ3ZDUUIwNlI5TVJITHYwQ1hSOU4rR2dnU045L3hHZXZxbkRrcU1uelBS?=
 =?utf-8?B?dnFZNG1GL2tJVCs4VUVwVEJUb2N1a1B1SUFSUFJmL0N0MDZDQ0Vxd3FCeVcz?=
 =?utf-8?B?REF3R2t1b2F0NnYzVC9WbUVDWCtwRE0vdGdyaXJ2YVZvZGo4ZjBpL0VWWmxZ?=
 =?utf-8?B?dXp3MUVVM1FmRFUycFBUaDZzYkRNK2FjU29BeGljSHhhTEtndkFSaTBaVXY4?=
 =?utf-8?B?bU5NM3ovOUdtZVo0VSt6aDV6S3dOKytGLzhFVTFCOVlEcHZTck1CeGtrZ1ZI?=
 =?utf-8?B?YUtBcXBnM1E4WGFqS0lpdUpQSFFBYm02VlF0QWtmSmtyKzBZNEtTcnE3TDN0?=
 =?utf-8?B?UXFQaW5GTWo0M2tmV0RhS1NoTzhUOUE2ZVVNNUdzUzV3UFFrcm1QbmJKTUtp?=
 =?utf-8?B?L2xqS3JBemp3NEZ5TEZUSlNabHZoZkhEdXU3elRRbExvM25LbFRMRG1lKy96?=
 =?utf-8?B?VENyYlpHNDFtNGJaRnNuWlpreTMyQU9pZE9LUU5YNHc3OEhxRS9YUUhYemVG?=
 =?utf-8?Q?5njIJIpq/qMotCu77IB6Y18ft?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ccf1300-7bc6-4d8d-c0a1-08ddfcaf200b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2025 03:45:24.3067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s/nSNUeRCNCVa6uDaIg4+2M01g1KpnX1HpQLQV7bB6g1Dt0csw6SvpZcd1+ETS17t0MSQxFr/HklSd1DYCJDdNbqg259UUZJzeS3wcIF1JE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6337
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

SGkgTWFuaQ0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuDQoNCj4gPiA+ICsNCj4gPiA+ICsg
IGFzcGVlZCxwY2llY2ZnOg0KPiA+ID4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9k
ZWZpbml0aW9ucy9waGFuZGxlDQo+ID4gPiArICAgIGRlc2NyaXB0aW9uOg0KPiA+ID4gKyAgICAg
IFBoYW5kbGUgdG8gdGhlIEFTUEVFRCBQQ0llIGNvbmZpZ3VyYXRpb24gc3lzY29uIG5vZGUuDQo+
ID4gPiArICAgICAgVGhpcyByZWZlcmVuY2UgYWxsb3dzIHRoZSBQQ0llIGNvbnRyb2xsZXIgdG8g
YWNjZXNzDQo+ID4gPiArICAgICAgU29DLXNwZWNpZmljIFBDSWUgY29uZmlndXJhdGlvbiByZWdp
c3RlcnMuIFRoZXJlIGFyZSB0aGUgb3RoZXJzDQo+ID4gPiArICAgICAgZnVuY3Rpb25zIHN1Y2gg
UENJZSBSQyBhbmQgUENJZSBFUCB3aWxsIHVzZSB0aGlzIGNvbW1vbiByZWdpc3Rlcg0KPiA+ID4g
KyAgICAgIHRvIGNvbmZpZ3VyZSB0aGUgU29DIGludGVyZmFjZXMuDQo+ID4gPiArDQo+IA0KPiBT
byB0aGVzZSBjb25maWcgcmVnaXN0ZXJzIGFyZSBwYXJ0IG9mIHRoZSBQQ0llIGRvbWFpbj8gSXMg
c28sIGFjY2Vzc2luZyB0aGVtIGFzDQo+IHN5c2NvbiBpcyB3cm9uZy4gWW91IHNob3VsZCBjb25m
aWd1cmUgdGhlIHJlZ2lzdGVycyBkaXJlY3RseSBmcm9tIHRoZSBSQyBhbmQgRVANCj4gY29udHJv
bGxlciBkcml2ZXJzLg0KPiANCg0KWWVzLCBpdCBpcyBwYXJ0IG9mIHRoZSBQQ0llIGRvbWFpbiwg
YnV0IHNvbWUgZHJpdmVycyB3aWxsIHVzZSB0aGUgY29tbW9uIHJlZ2lzdGVycywgaWYNCkkgZG8g
bm90IHVzZSBzeXNjb24sIGhvdyBkbyBJIGFkZCB0aGUgcmVnaXN0ZXIgcmFuZ2UgdG8gbm9kZT8N
ClVzZSB0aGUgInJlZyIgcHJvcGVydHkgaW4gYWxsIHBjaWUgbm9kZT8NCg0KPiA+ID4gKyAgaW50
ZXJydXB0LWNvbnRyb2xsZXI6DQo+ID4gPiArICAgIGRlc2NyaXB0aW9uOiBJbnRlcnJ1cHQgY29u
dHJvbGxlciBub2RlIGZvciBoYW5kbGluZyBsZWdhY3kgUENJDQo+IGludGVycnVwdHMuDQo+IA0K
PiBzL2xlZ2FjeSBQQ0kgaW50ZXJydXB0cy9JTlR4DQo+IA0KDQpBZ3JlZWQNCg0KPiA+ID4gKyAg
ICB0eXBlOiBvYmplY3QNCj4gPiA+ICsgICAgcHJvcGVydGllczoNCj4gPiA+ICsgICAgICAnI2Fk
ZHJlc3MtY2VsbHMnOg0KPiA+ID4gKyAgICAgICAgY29uc3Q6IDANCj4gPiA+ICsgICAgICAnI2lu
dGVycnVwdC1jZWxscyc6DQo+ID4gPiArICAgICAgICBjb25zdDogMQ0KPiA+ID4gKyAgICAgIGlu
dGVycnVwdC1jb250cm9sbGVyOiB0cnVlDQo+ID4gPiArDQo+ID4gPiArICAgIHJlcXVpcmVkOg0K
PiA+ID4gKyAgICAgIC0gJyNhZGRyZXNzLWNlbGxzJw0KPiA+ID4gKyAgICAgIC0gJyNpbnRlcnJ1
cHQtY2VsbHMnDQo+ID4gPiArICAgICAgLSBpbnRlcnJ1cHQtY29udHJvbGxlcg0KPiA+ID4gKw0K
PiA+ID4gKyAgICBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gPiA+ICsNCj4gPiA+ICth
bGxPZjoNCj4gPiA+ICsgIC0gJHJlZjogL3NjaGVtYXMvcGNpL3BjaS1ob3N0LWJyaWRnZS55YW1s
Iw0KPiA+ID4gKyAgLSAkcmVmOiAvc2NoZW1hcy9pbnRlcnJ1cHQtY29udHJvbGxlci9tc2ktY29u
dHJvbGxlci55YW1sIw0KPiA+ID4gKyAgLSBpZjoNCj4gPiA+ICsgICAgICBwcm9wZXJ0aWVzOg0K
PiA+ID4gKyAgICAgICAgY29tcGF0aWJsZToNCj4gPiA+ICsgICAgICAgICAgY29udGFpbnM6DQo+
ID4gPiArICAgICAgICAgICAgY29uc3Q6IGFzcGVlZCxhc3QyNjAwLXBjaWUNCj4gPiA+ICsgICAg
dGhlbjoNCj4gPiA+ICsgICAgICByZXF1aXJlZDoNCj4gPiA+ICsgICAgICAgIC0gYXNwZWVkLGFo
YmMNCj4gPiA+ICsgICAgZWxzZToNCj4gPiA+ICsgICAgICBwcm9wZXJ0aWVzOg0KPiA+ID4gKyAg
ICAgICAgYXNwZWVkLGFoYmM6IGZhbHNlDQo+ID4gPiArICAtIGlmOg0KPiA+ID4gKyAgICAgIHBy
b3BlcnRpZXM6DQo+ID4gPiArICAgICAgICBjb21wYXRpYmxlOg0KPiA+ID4gKyAgICAgICAgICBj
b250YWluczoNCj4gPiA+ICsgICAgICAgICAgICBjb25zdDogYXNwZWVkLGFzdDI3MDAtcGNpZQ0K
PiA+ID4gKyAgICB0aGVuOg0KPiA+ID4gKyAgICAgIHJlcXVpcmVkOg0KPiA+ID4gKyAgICAgICAg
LSBhc3BlZWQscGNpZWNmZw0KPiA+ID4gKyAgICBlbHNlOg0KPiA+ID4gKyAgICAgIHByb3BlcnRp
ZXM6DQo+ID4gPiArICAgICAgICBhc3BlZWQscGNpZWNmZzogZmFsc2UNCj4gPiA+ICsNCj4gPiA+
ICtyZXF1aXJlZDoNCj4gPiA+ICsgIC0gcmVnDQo+ID4gPiArICAtIGludGVycnVwdHMNCj4gPiA+
ICsgIC0gYnVzLXJhbmdlDQo+ID4gPiArICAtIHJhbmdlcw0KPiA+ID4gKyAgLSByZXNldHMNCj4g
PiA+ICsgIC0gcmVzZXQtbmFtZXMNCj4gPiA+ICsgIC0gbXNpLXBhcmVudA0KPiA+ID4gKyAgLSBt
c2ktY29udHJvbGxlcg0KPiA+ID4gKyAgLSBpbnRlcnJ1cHQtbWFwLW1hc2sNCj4gPiA+ICsgIC0g
aW50ZXJydXB0LW1hcA0KPiA+ID4gKyAgLSBpbnRlcnJ1cHQtY29udHJvbGxlcg0KPiA+ID4gKw0K
PiA+ID4gK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UNCj4gPiA+ICsNCj4gPiA+ICtleGFt
cGxlczoNCj4gPiA+ICsgIC0gfA0KPiA+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50
ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPg0KPiA+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmlu
ZGluZ3MvY2xvY2svYXN0MjYwMC1jbG9jay5oPg0KPiA+ID4gKw0KPiA+ID4gKyAgICBhcGIgew0K
PiA+ID4gKyAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiA+ID4gKyAgICAgICNzaXplLWNl
bGxzID0gPDE+Ow0KPiA+DQo+ID4gTm8gbmVlZCB0byBzaG93IHRoaXMgbm9kZS4NCj4gPg0KDQpB
Z3JlZWQuDQoNCj4gPiA+ICsNCj4gPiA+ICsgICAgICBwY2llMDogcGNpZUAxZTc3MDAwMCB7DQo+
ID4gPiArICAgICAgICBjb21wYXRpYmxlID0gImFzcGVlZCxhc3QyNjAwLXBjaWUiOw0KPiA+ID4g
KyAgICAgICAgZGV2aWNlX3R5cGUgPSAicGNpIjsNCj4gPiA+ICsgICAgICAgIHJlZyA9IDwweDFl
NzcwMDAwIDB4MTAwPjsNCj4gPiA+ICsgICAgICAgIGxpbnV4LHBjaS1kb21haW4gPSA8MD47DQo+
ID4gPiArICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwzPjsNCj4gPiA+ICsgICAgICAgICNzaXpl
LWNlbGxzID0gPDI+Ow0KPiA+ID4gKyAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDE2OCBJ
UlFfVFlQRV9MRVZFTF9ISUdIPjsNCj4gPiA+ICsgICAgICAgIGJ1cy1yYW5nZSA9IDwweDgwIDB4
ZmY+Ow0KPiANCj4gV2h5IGJ1cyBudW1iZXIgc3RhcnRzIGZyb20gMTI4Pw0KPiANCg0KT24gQVNU
MjYwMCwgdGhlIHJvb3QgYnVzIG11c3Qgc3RhcnQgZnJvbSAxMjguIEl0IGlzIGZpeGVkIG9uIGRl
c2lnbi4NCg0KPiA+ID4gKw0KPiA+ID4gKyAgICAgICAgcmFuZ2VzID0gPDB4MDEwMDAwMDAgMHgw
IDB4MDAwMTgwMDAgMHgwMDAxODAwMCAweDANCj4gMHgwMDAwODAwMA0KPiA+ID4gKyAgICAgICAg
ICAgIDB4MDIwMDAwMDAgMHgwIDB4NzAwMDAwMDAgMHg3MDAwMDAwMCAweDANCj4gMHgxMDAwMDAw
MD47DQo+ID4gPiArDQo+ID4gPiArICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPiA+DQo+
ID4gRXhhbXBsZXMgc2hvdWxkIGJlIGVuYWJsZWQuIERyb3AuDQo+ID4NCj4gPiA+ICsNCj4gPiA+
ICsgICAgICAgIHJlc2V0cyA9IDwmc3lzY29uIEFTUEVFRF9SRVNFVF9IMlg+Ow0KPiA+ID4gKyAg
ICAgICAgcmVzZXQtbmFtZXMgPSAiaDJ4IjsNCj4gPiA+ICsNCj4gPiA+ICsgICAgICAgICNpbnRl
cnJ1cHQtY2VsbHMgPSA8MT47DQo+ID4gPiArICAgICAgICBtc2ktcGFyZW50ID0gPCZwY2llMD47
DQo+ID4NCj4gPiBUaGVyZSBzaG91bGRuJ3QgYmUgYW55IG5lZWQgdG8gcG9pbnQgdG8geW91cnNl
bGYuDQo+ID4NCg0KQWdyZWVkLg0KDQo+ID4gPiArICAgICAgICBtc2ktY29udHJvbGxlcjsNCj4g
PiA+ICsNCj4gPiA+ICsgICAgICAgIGFzcGVlZCxhaGJjID0gPCZhaGJjPjsNCj4gPiA+ICsNCj4g
PiA+ICsgICAgICAgIGludGVycnVwdC1tYXAtbWFzayA9IDwwIDAgMCA3PjsNCj4gPiA+ICsgICAg
ICAgIGludGVycnVwdC1tYXAgPSA8MCAwIDAgMSAmcGNpZV9pbnRjMCAwPiwNCj4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICA8MCAwIDAgMiAmcGNpZV9pbnRjMCAxPiwNCj4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICA8MCAwIDAgMyAmcGNpZV9pbnRjMCAyPiwNCj4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICA8MCAwIDAgNCAmcGNpZV9pbnRjMCAzPjsNCj4gPiA+ICsgICAg
ICAgIHBjaWVfaW50YzA6IGludGVycnVwdC1jb250cm9sbGVyIHsNCj4gPiA+ICsgICAgICAgICAg
aW50ZXJydXB0LWNvbnRyb2xsZXI7DQo+ID4gPiArICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0g
PDA+Ow0KPiA+ID4gKyAgICAgICAgICAjaW50ZXJydXB0LWNlbGxzID0gPDE+Ow0KPiA+ID4gKyAg
ICAgICAgfTsNCj4gPiA+ICsNCj4gPiA+ICsgICAgICAgIHBjaWVAOCwwIHsNCj4gPiA+ICsgICAg
ICAgICAgcmVnID0gPDB4ODA0MDAwIDAgMCAwIDA+Ow0KPiANCj4gV2h5IHRoZSBkZXZpY2UgbnVt
YmVyIHN0YXJ0cyBmcm9tIDg/DQo+IA0KPiBJZiB0aGVyZSBhcmUgcGxhdGZvcm0gc3BlY2lmaWMg
cmVhc29ucyBiZWhpbmQgdGhpcyBudW1iZXJpbmcgc2NoZW1lLCBpdCBzaG91bGQNCj4gYmUgbWVu
dGlvbmVkIGluIHRoZSBkZXNjcmlwdGlvbi4NCj4gDQoNClNhbWUgYXMgYWJvdmUuIE9uIEFTVDI2
MDAsIHRoZSBkZXZpY2UgbnVtYmVyIG9mIHJvb3QgcG9ydCBtdXN0IGJlIDguDQpXaWxsIGFkZCB0
aGlzIGluZm9ybWF0aW9uIGluIHRoZSBkZXNjcmlwdGlvbiBpbiBuZXh0IHZlcnNpb24uDQoNClRo
YW5rcywNCg0KSmFja3kNCg0K

