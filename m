Return-Path: <openbmc+bounces-1098-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D892CFBB9B
	for <lists+openbmc@lfdr.de>; Wed, 07 Jan 2026 03:29:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmBng4RsPz2xrC;
	Wed, 07 Jan 2026 13:29:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.127.106 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767752983;
	cv=pass; b=lxz45sNcN66ljCTOqOte30CsK0SKSGdwN0XMdLDsCxWTG2dzUWAlHSPiwr3ZNWKYXfXPHrq78TqmHeJBsiRYV7+tV6a3AVZE3PMUlv0gLKcs/psbI5zW3RSsgameG3gNUbTLldScxmisvd57DuPX4eqjNJ/pAjes3EICEDtgWFBvAjsvUMhts7DpFMakOCb3hD++TEscsqn0NhpcXd/buIJxSYEkxhqRh+G6gsWxVRQpQS6F6VPDtXr+4fpyWrq4KtxyXToAMDhlxuqlT7dwvY5Wb0jZIfkDOuWoGco3BwjZjBCMjIfnZpwGTzvHGuSoHFJWcuCd6B/eGTnjh2hhFg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767752983; c=relaxed/relaxed;
	bh=El2sGo8IidLtLTWiHJNZ2Uher238QCN9I0XczR1zMX0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Gwi9YesbBtGlwneY4nZBtSXK50Z5+XvLRzu2OaZbzs71AdId3wdxK+69Gd8wGDBg5245Qrb+v2qjlJ+9JXPH71xZws8MU6EVZWwBykajnQD/doNR1uqW6nTqzxMS4IMKeinhUlSe8mclwAuS6BZZsnTNZ/9Eru/idZhCPHr4oRfQIUa1eEic1Ayfsfk04JI/lyhVjke+QBkVNwGGPCTmVoql3dzEKtXhvGy0h+wR/rpSzHPNMldPi/oEMfZZxmFxoA3G1mghAoZPcg/KvTr5+cBtcZD4IpexeCogGgEIOAtXUHoVPFtiRd6uyNmCUHtLlLC4WgPv9PHn+3HIYN3EDA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=cDqO51WY; dkim-atps=neutral; spf=pass (client-ip=52.101.127.106; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=cDqO51WY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=52.101.127.106; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023106.outbound.protection.outlook.com [52.101.127.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmBnf1XKpz2xpg;
	Wed, 07 Jan 2026 13:29:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sAjk0zC1NZG9ewwG7j1sO6j9Vi5ytjlw2kRyQpzmlJHBuz+ahLPSbfe5n4obZhRC0/b614ZS+ZGc9qaVj2nm8LuD0T0SRO4pFAXDW9I7sbtuEBcliJt8FD+XASRaQ1lsniu2Sjgew7rZW1vL/2JafVW2/25ejCeFbmuUEl6fYQP7uThqjMCYbUYPrHqHi87Ksf3MzEsVwuaMXXrYM8RlNU+/9YJU+nNVwCtCvL3qEwfpXLbhUJNqfp16dCm0Qx8Ntpsij/H2fDYOQbuJ6g1CBBVF4pqVhVdbVhzdNo8L3qCzKePiWAn9BPCwPiK0HgMRgoz9ENYQSZ22EJs8FcJG3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=El2sGo8IidLtLTWiHJNZ2Uher238QCN9I0XczR1zMX0=;
 b=oAN3ki6O0NE0F1mhPP7Ok+tm2HU0lg8d/Li8RduFUWTGmHA13zgRkKJo3frpl7x3qTmJogx21/ZYcD3Fj1r3ww1RnLSAR5iuMtSQFBCHNflur+NB1BXEwaOBYH6I0/ARuag9kaieeYd7A8dkPG1LzE0GZVGtsvZmBaHkM4XlSgj/wzG4F4YEJp/5q3Jl1dIee9ZufCXDE2kgBw077l16LkBSs/rRebayp8xoxVpsPn+hqLHJfhjMlYuPg57SiFYgtSppi64cWnuVItXTCfMKQdNpnR32wbdWAJ10hrxo9aiedc6mNeWFd3YDqVLpDuz3tHypuHWlsfdJu9MoH3tSyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=El2sGo8IidLtLTWiHJNZ2Uher238QCN9I0XczR1zMX0=;
 b=cDqO51WYSgAbkET29cncQ4IkbtxunSzrIJL14krZL+wYkm1Aj9bH0ctEPp7vdh54XbZRmGM4DXMM7UNJHN5V6s4ml6UyWK2E/NyaKzjLL1ilUEBSgtg5NJhNpn42DTa76R3etJx9qWdiz6lszD2QBmu0mihZcRuyUcruwzVqcugPtZ8/YR0w96V5vB9GorpJUh7Zj90Dqur3axlw2+VBg4cmBmxbMsv+qC4zj0iFjWyDB+7Pez7JLuO3I6obqBKU+7k282Qfuj09Y3iB7EWljTToN3ZeYpQczJDPsPoKnfAPKlyhoR/UcqvxOyjeMmwt7TVz6qYF7xVjUKSbopa5Tg==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by TYZPR06MB7336.apcprd06.prod.outlook.com (2603:1096:405:a0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 02:28:58 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%6]) with mapi id 15.20.9478.005; Wed, 7 Jan 2026
 02:28:57 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Mikhail Rudenko <mike.rudenko@gmail.com>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@codeconstruct.com.au>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?iso-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kwilczynski@kernel.org>, Manivannan
 Sadhasivam <mani@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Neil Armstrong
	<neil.armstrong@linaro.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: [PATCH v7 0/7] Add ASPEED PCIe Root Complex support
Thread-Topic: [PATCH v7 0/7] Add ASPEED PCIe Root Complex support
Thread-Index: AQHcbi5NGns8riYnf0mmItB8KdiQ8LVFCbQAgAETH2A=
Date: Wed, 7 Jan 2026 02:28:57 +0000
Message-ID:
 <SEYPR06MB513404EB419B7850159F3CC29D84A@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20251216-upstream_pcie_rc-v7-0-4aeb0f53c4ce@aspeedtech.com>
 <875x9fuj7i.fsf@gmail.com>
In-Reply-To: <875x9fuj7i.fsf@gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|TYZPR06MB7336:EE_
x-ms-office365-filtering-correlation-id: af24aa42-829c-4473-d8f3-08de4d9482de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-2?Q?/REi5ripc8ywtgDQMecOY3DtJEqP35yaIHWundEW5Pi6m1yRYmp8Z05Lp9?=
 =?iso-8859-2?Q?MWbXXkcW6e2OKB8dGJU1sUUEZr8m02bKNYMfVfu+6iaU9yXAo16YLM+4tH?=
 =?iso-8859-2?Q?8mwhqZlB6ls9LKVP6rTyUvFDtwigVk5NwbNmOCjcGvaKAdBj2Ee76VTKp5?=
 =?iso-8859-2?Q?l5W+3BxOl8KC3VIQgLx/7IXtitZy5iZSs24MO2nq7FqXQNYN/fWED945bM?=
 =?iso-8859-2?Q?YcQoHxlm03XarfDjrgqXvLR0QeyN3hBYWw4M8RubKLw3pl28Q3OTO1R4EX?=
 =?iso-8859-2?Q?XQCiF0rF7dyGuRqfDqO/kg6cVE7qdhBNkuHG++C0+37cgSo0VdKg7azPEY?=
 =?iso-8859-2?Q?qvOXOTG0EB6YOAFWqy+oLoEkxGfQWZw50xul1Pr4O1UPaMQ5wFgmCJDnjL?=
 =?iso-8859-2?Q?5CQvu2q6jkTiG4o3de0IJoujmIcdHp+iFVn3BtCqBpa/I8d/4mIhhlbV+P?=
 =?iso-8859-2?Q?cAhuq8CCr4SIifbqM6rU1xZ5KqMq3Ixnr42oafw1K6vq+3EC6BvZsw3qqi?=
 =?iso-8859-2?Q?Vd+yUBjNfen+DANQgQ2RTr+IFZEIfW1msoV+bojYZms62gbHyqNjv2ne5T?=
 =?iso-8859-2?Q?1GqLsOrsnqbEnKdxTOcBXtPxPf+O1iZ2XG0Z7EGPr/0afG1o7m1tejIMxJ?=
 =?iso-8859-2?Q?6xPiU6H2SWRAjEfmwwYUd93RcRI/xnWcZS/eHKTShfv/wc6gb6/MrvYAKe?=
 =?iso-8859-2?Q?timUSbmWjMmY+xmrMwva2yOnUUGRDFtuewWekmSmHqNWl0eAC8ZQWmDu1E?=
 =?iso-8859-2?Q?ciaD//PAUfCOcb851Nr1x91ds0SOMFNp9Xus4y5RTWqt9DS85z5V3LsiFq?=
 =?iso-8859-2?Q?VP1Uaufx45AK8zoJVCRxpVGtKCUzTb8IemTiGl3SsXXzsf5QCC48HFDUMk?=
 =?iso-8859-2?Q?fxSgQbqQtEHbkE6Q8O7OTfGEnqaWcer4jv/mv/nUI5k94qus9ZGR87TGCX?=
 =?iso-8859-2?Q?fMeCpunCaZKOnuZApK8N/gjuiiJEqtsTLZfeh6siRM2nZAkyQ7F9NG0B41?=
 =?iso-8859-2?Q?7OLrZi3PRP+SdHz6VPe1chu2FmrMnBjbF2nMrkEGvkEwcEGePcCLGs893r?=
 =?iso-8859-2?Q?N/CQFHIn7PLHgrjICZcVDx6R0Vdvp7EZtjblFucY7+DF27AseAw3/96L48?=
 =?iso-8859-2?Q?1qJXwtg5giabprlRmkjrRYhXJKWxyrIU80Bt4gpSrzSPFjuOV02m0nSnHG?=
 =?iso-8859-2?Q?ojoaFUyM77IBRJI10WzXNBCMkwPXg+Gz+UvmI10Y7wz04S+yNrKmlQGLIF?=
 =?iso-8859-2?Q?S1KRC6CIb4GTX8RZJxjY8CY30Eq+TaQWZ/RmeO3gWfqKFfHFvuDxGekTf3?=
 =?iso-8859-2?Q?dRUBRgQ1JrIHROEEKXopVBQsaJLNyYolmPSgYlIy7rWMTDxelWhNxnN7pG?=
 =?iso-8859-2?Q?hc21oiRKiYQdjzzF3LnCTCsZ87H07eh9TFBdBWcK2t8o/Xo5CYhTo8neLT?=
 =?iso-8859-2?Q?DXxbeiBNDu7mZ6YW57qWEWee8Rt5Zd+AzyA0vx1u+l3Piy3GuqPKiok7g3?=
 =?iso-8859-2?Q?QUJX858MSmNhyQgGqGRgNIkSPS5D0UxT+nrLkq4otrr8BXXtI2dJydBa4y?=
 =?iso-8859-2?Q?44gYLeJjK1Nfuubm1nc3eOqqx1tM?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-2?Q?zzmalUfB0OSjzcKmOR+cVVJKgvwumP9fqF2EiWKPKaka2eIiPjAIlz87PX?=
 =?iso-8859-2?Q?3ef53ZCaYD+iNbLSK3k7cQfmwOqZY2zGYdnMrApeOS/79ClbMPINoqYP39?=
 =?iso-8859-2?Q?mzejn+TSyFWxPYPLQoOpXShGgh2/xQkJcsfSpu/gCdwlhbMYnoPfnP0n7r?=
 =?iso-8859-2?Q?0mZtw8wO5CMbn+feP91zOHwb31SNdCT3ROiyfCRCCOQBcY5SgGhmqwgW+0?=
 =?iso-8859-2?Q?ZSBEQ4I6blGGEms9VHx2g++lhfm4Sm3UxF7asTx8wvRyrH84iT8JDX1Hxw?=
 =?iso-8859-2?Q?xmMDaQnWOS3GugtZ1XNnCM4qWJQRBRGrQbXEwZb3AGyqgR4iE7qFVkHKHh?=
 =?iso-8859-2?Q?y9RWa30GNj4yOMhKYLqne7SujfDpOYVUwp/bPNrWpyPn6Yr10wWsrB2kMk?=
 =?iso-8859-2?Q?Cv1EPAm0sfuemjz4vx5vOyGTV7rMrejKvOUSYM2hb5q6g+eCnLrNFNtu+K?=
 =?iso-8859-2?Q?Qir6VPWVDe8awN30COTmuQmn9lZcWYS47dTMUVibw1te3qpBNE6zbJkAHR?=
 =?iso-8859-2?Q?E405PRIGCchayVUQyCt9XXZSb1IHeHSbp0eXv0jNYzvI0kDRynmlh2pSWG?=
 =?iso-8859-2?Q?GK6EzVeDwXbQFPjkbNTiTk5W3uSYeZbULHATlmAVqhjNMEfXHqTe1BGCe4?=
 =?iso-8859-2?Q?BWakVCxCxfrBd4jM78dixwnyR83ilZq/8qfV7n2YVY4pq+/vT30NJFGmXk?=
 =?iso-8859-2?Q?s67znzpqvytapZhx1uCxh2bGDKy+W9QkjNo/bx6d4lPl1Eal2Uy3vUp74k?=
 =?iso-8859-2?Q?qFafUXvLC74y+NWCzzwMyA6onlQ+moH82EbivS2GK77W70GKKxmbaNMCX6?=
 =?iso-8859-2?Q?Oq+WKx/TIMqNQvq2PsceJuxgDwENa6x1LvXv3BshgIT0OaFByUzzkjBfGG?=
 =?iso-8859-2?Q?gUAigc8rHK92icw/kkDEf9A/KN69FqziLctOTOMbioJotLmj/eUNAVEs+e?=
 =?iso-8859-2?Q?CfZMQTitbftGK5ensitPH5CbGE40fFI8XiPXZu07SskEFcrJ0RDzIhP4Gk?=
 =?iso-8859-2?Q?PXGgwXjIDd1gExNh60AcBgGyZzj+7bdcEQWzjLwlx3O4q4AjkKmJFC9dkG?=
 =?iso-8859-2?Q?Jr3PtGWxve5YgNLyd4NrYSO7+jE1P7JJ56/MxjixPDL1+4pIPkyI0tBgk9?=
 =?iso-8859-2?Q?6GjYdE9U29rb7TxNXB/Pm2qpkyGjlHDA/TKUagxlbjkO6EaZQSsG/Tz1Or?=
 =?iso-8859-2?Q?uvKhTSqa0YjIHHP2hkGeSRzZ+3ehgy9EUbMoc7Cf9pRGd/8TaCwODUvIwQ?=
 =?iso-8859-2?Q?ekATBNju3MRgcK8hWPrSXxRgXxfTLN+h2NDWHQQCH8jcageQeu3FlqsNKJ?=
 =?iso-8859-2?Q?WTgS03fOZKNk9uYaO8q89QHNaWcUOQ/Vuz82bEV/V7aDuKS9+SDod+a/VN?=
 =?iso-8859-2?Q?VImfos8nZ2XpVOFLlBRpOIebsnZp1ocuvKAdQvjoO9EVOgrdJ0GRERS/um?=
 =?iso-8859-2?Q?0AS5h5bm5anKLsv+3iDpRQW2bhSJlO9rLnNqChH60uNBRl7LVoE9flNlz6?=
 =?iso-8859-2?Q?T813sUUa11Bw9ZM5upgrPxeWoqThGv0bduWGUx0criRso9Ijhalkcbo1JW?=
 =?iso-8859-2?Q?18HHsyQ9jjlHL6z7kqrdDYQCbCkZXeLEinJl3jaAfXdflTpVgE/krr6cZV?=
 =?iso-8859-2?Q?RbaR0PASDGLjUzhOha95gE6P67bqZ2dlWIfGgOxqFhSA83r0tEJ9E8VlPn?=
 =?iso-8859-2?Q?BbrqPsZ53XfqdD52+g/NhGh7hHIe4RLUMKpLaxUgPUR00GSSdzOKahcmP6?=
 =?iso-8859-2?Q?xi8SldXN4P9RzUyR4F5VxRKbNsQ6wykzYqAHPbKchyAB/4x+FDhcDFrPWF?=
 =?iso-8859-2?Q?NanlnhcvPQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
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
X-MS-Exchange-CrossTenant-Network-Message-Id: af24aa42-829c-4473-d8f3-08de4d9482de
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2026 02:28:57.9049
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LNfO1ty1TVpGoi43TLt+Z1IO1hUWB4vUwGNy+xJu0Lh7vchipProy9AuqbF/UxBZh1KEBOBQO3L+6O2G9TAb3dU/620lPzAWkA2iv62H5iY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7336
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Mikhail Rudenko,

> First of all, thank you for your efforts in getting this driver upstreame=
d! I am
> trying to understand whether this driver supports PCIe devices that have =
an I/O
> port BAR, where CPU access to I/O ports is required for proper device
> operation.
>=20
> If I understand correctly, this line in the Aspeed 2600 dtsi file declare=
s the I/O
> port range:
>=20
>     ranges =3D <0x01000000 0x0 0x00018000 0x00018000 0x0 0x00008000
>=20
> During system initialization, the pci_remap_iospace() function in
> arch/arm/mm/ioremap.c maps the physical address range
> 0x00018000-0x00020000 to the virtual address PCI_IO_VIRT_BASE
> (0xfee00000). After this mapping, inb() and outb() calls work by converti=
ng I/O
> port addresses to virtual addresses starting at PCI_IO_VIRT_BASE, then
> performing reads and writes to those virtual addresses.
>=20
> What I don't understand is this: according to the Aspeed 2600 datasheet, =
the
> address range 0x00000000-0x0fffffff (which contains
> 0x00018000-0x00020000) is mapped to Firmware SPI Memory. This would
> mean that outb() operations get routed to memory-mapped SPI flash instead=
 of
> PCIe.
>=20
> It seems like there's a missing piece to this puzzle. Could you help clar=
ify how
> this is supposed to work?
>

Thank you for pointing this out, and sorry for the confusion.

You are correct that, as things stand, this does not make sense from a real=
 hardware perspective.

In fact, the I/O addressing support you noticed was something we experiment=
ed with internally
only. There is no actual hardware design on AST2600 that supports PCIe I/O =
port addressing in=20
this way. To enable those experiments, we modified our internal kernel acco=
rdingly, but this was=20
never intended to represent real, supported hardware behavior.

This is our mistake for leaving this description in the DTS, as it can inde=
ed be misleading. We=20
will remove this part to avoid further confusion.

Thank you again for your careful review and for bringing this to our attent=
ion.

Thanks,
Jacky

