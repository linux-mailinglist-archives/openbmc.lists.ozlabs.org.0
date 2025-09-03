Return-Path: <openbmc+bounces-573-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E851AB414C5
	for <lists+openbmc@lfdr.de>; Wed,  3 Sep 2025 08:13:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGsjg40tZz2yGM;
	Wed,  3 Sep 2025 16:13:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756879991;
	cv=pass; b=OSzPUE7kOBpZOrY7b5l45Oo/eA+0b5LDhuMuQhw17MdWyJ0Yi9ydN1vCOD8I6VWfAUBtTNyNPk2OD/J549TNgH4d1pVB39LA6PclwckKnk9E4tysfhcYfbM4DzQBdDWkYLIEfzAyL/5NUAK/oQ+X6paWnY0eSc8aVm+TrYcJuIi4aknhHdEVnKPiFKVlx63iV11p3/Fs7GDofFHihbLlm58/fTLN/gvpoAaspob6I/dccnaY8jeAyEaczcKmX261oURGrsZRoKwwlhbqqJcLBp0juKuFUbj0dskcTbeO40dEjw1/nAMkzc0uL8HlUYMhpeKQ+4dYmlqcK8xsUDU1hA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756879991; c=relaxed/relaxed;
	bh=pEow0o3ceypLjB8Iqku7pgwDNZutIIUzm7PuvAeqQBM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gcQzjKCxq25DB7jyre1ByfYhpunbUUAbh0/bIijIn+vshTooUZIuqkYfLih3sLhsdJsb1uj1IeLDCjqAQGfSgsZzBPOOGcWWgz3mZuXYPN2aCinFsm+8K4MrdOa9qn1XHq6sYNXNJ3Z1mOtaTnjlWsZXqQxHHJ/8xdwiuQm0e5TCBB3td0xee/KGIHB9fYCjTqKxQFiF/Zn6vynCDsLvzwMhCHn8qOnWdgQXUQNglgykz4Pu8zDOFAHBCte10GnChoH+sxL89my9c+51AF8GypQ6f969CAfOS+1FEQ/YRNPKBsL9RrVScN5TQNgAft6BKwvdidIBeBIQWYip1Sc8DA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=Hdu0nLy/; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=Hdu0nLy/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGsjd4SJlz2xnw;
	Wed,  3 Sep 2025 16:13:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JblDCFHFxjVfFBW9Nxm+R350MEwlZHCw0FRCATtE+LFT4H88QcZMdSNGdslQ/ZeGMTZVKplMF7QC9+8y+FjFG8rBUTm9iDZ5HIq/w9y/JY+XIHZS/wBLMLzKcW0cweO6SyhhCy9z6NLduCseydfM2znZ7SpFFIZc61wk1f9UgUKxkbjyzkuWpR+/3K0Ucy5U7DXZafWr4NUQ5p1CH3LJ8GTEdzYj2OcOyvvV4HAW/CDVZY8zHI4M6/FlE+BGQwcZsgWEvgdPS5YS1/Q9b1/P22pGQI466ofpvyeZUNnSt5yCWC/Bqw3fnvFlsVobSzvrLmEcGCRXHf6jSptw3v7FhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pEow0o3ceypLjB8Iqku7pgwDNZutIIUzm7PuvAeqQBM=;
 b=ukMjGD5wVCd4PMA4SkCs5vfVtJBtjVp8ynqVJ5DAz9yMulYHrS7gPSucGtWjjQFJz69E4FMx/MHI0K+bQAK0XDi4o+NpHEOOg90LSJiW4TdDgGTjQ9XuIR7n854YU1Kg1btkst271BCglNM+8T8RA1WQyBqNeZ9xmgVSVUrTBBfA+BmBLHVrshEo9q+5dfLsS/EkOqEtPXMPYEPxIpfLPNxAUVp1DeQpuvLazOqLc19qoYrTgeqshNo0ahclER14YXZ1VMI8o/KX1N9iYBQwGm+5gOUv9fUXLfiilNC4TJfRbDm034fSlP9NOXpTSPc2/9T9JRsgp5jia3VfCnHdUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pEow0o3ceypLjB8Iqku7pgwDNZutIIUzm7PuvAeqQBM=;
 b=Hdu0nLy/t4tkQiofPQ1R387OgNBcWfHoAqb3fCPCgSTxmoQbqya2U6+Zm5isD3bebAVjt0Ma7Y970fMuPDQV+ITb6P1ry+06IBr9F3LfK6OEYyUcxGslmRBbgdhYX4rabrcTgMAPRFZR42OfFpD4NnIl73UrBs5iz3Hh3qCtaipUNkThsvOV0mPbVlz21HT/6YNow1+6w8GHiVCZoFtPdCzzCRw94a8QTOmvArkiKtUyclGkbypA51JQOct94Kl3O0biXkfchZx93yuE+gIMFNeiVDZSWL3fTiW9HW6OcfdTbK/AdXlUtw9zclCSnMXTpEq8uNuPPlWBdAxG9uAbVA==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by KL1PR0601MB5550.apcprd06.prod.outlook.com (2603:1096:820:c1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Wed, 3 Sep
 2025 06:12:44 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%7]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 06:12:44 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Rob Herring <robh@kernel.org>
CC: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "vkoul@kernel.org" <vkoul@kernel.org>,
	"kishon@kernel.org" <kishon@kernel.org>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
Subject: [PATCH v3 03/10] dt-bindings: PCI: Add ASPEED PCIe RC support
Thread-Topic: [PATCH v3 03/10] dt-bindings: PCI: Add ASPEED PCIe RC support
Thread-Index: AQHcGwWW5d3OP3gN0EOH5yEQdLB1CbSAZn+AgACUtzA=
Date: Wed, 3 Sep 2025 06:12:43 +0000
Message-ID:
 <SEYPR06MB5134D2683D1FBD637955D2099D01A@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20250901055922.1553550-1-jacky_chou@aspeedtech.com>
 <20250901055922.1553550-4-jacky_chou@aspeedtech.com>
 <20250902211221.GA1179675-robh@kernel.org>
In-Reply-To: <20250902211221.GA1179675-robh@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|KL1PR0601MB5550:EE_
x-ms-office365-filtering-correlation-id: 0787d4b7-acae-4054-9c35-08ddeab0e54d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?F9izYmWxS3wRVKe4EMtgezauE5KZ7h8HbrVKO7rYr3gXphjjI9yYRWckKvoy?=
 =?us-ascii?Q?xt69v0XWNLPgHk05RbUeVC10Gzy+43YP7BqTCwLT+sken2u8/5ua7nlkf+xO?=
 =?us-ascii?Q?s3X7cA5tHucRMb6o5mWNiGPZIxmostswIlV0Xm5MLpUelmca6les+LTZI9vf?=
 =?us-ascii?Q?IRm9794VGFBhaXSjhUyIP0AhbVQufiKe4v1hDKEtMLGm0nPq98WH7rfrqCCg?=
 =?us-ascii?Q?o3g2vIb5aSNlYSsCsVSW4B9xxu++TGtDlh9z1nJAQEPrfmTfN8aOnypiSgVm?=
 =?us-ascii?Q?BFT/bOa1iM8pFn60wCNzNJNBsc/hFqBg7MbQy74Wph8adjxOIN+H8/5bmixD?=
 =?us-ascii?Q?txGHPraVDmFPOPSoku9hoXXlvya09Hf560qhgIDLcdcTH7xjbu0Dwqv3Q8pP?=
 =?us-ascii?Q?PeBwe5JsUaiWrGl/3cM5cadvBUXqdDU+iVEUQX4DMHrX4TU4t/OW4FoFeSM6?=
 =?us-ascii?Q?MV8GntAYFUtcoUZXR+Z+RF2hZ2YwpFtFd9rtCQ3Co0wS80McjrXHKgVAkNwM?=
 =?us-ascii?Q?gMgvDRq9u9dUI0Fuaib4DJwyM+SuFrGkrzXbuVjpGG7carfGcKvgt7MqzZov?=
 =?us-ascii?Q?I4yRowinSULfvKsJN67ZKfvP7kMOGFF0+yX74vGBRqnum2jZFJLet+5w/uoG?=
 =?us-ascii?Q?8UJPkd83Mv2Dh5wLaAC+PNkaKmjHs69gDKIGWBiTefz0hLmDRU223KLAJDcb?=
 =?us-ascii?Q?VGj0YlWl9aiKLcD0MD2fWdsXfuC8vxqrGwaM1A9JNQc6RR0s0skxgCKhQhAm?=
 =?us-ascii?Q?dUw3b703vX84SZN08N1IkNiJ+EPAkaAixcNTUqyFyx+L/vCr0HXp4N+pZDNb?=
 =?us-ascii?Q?Fz8s2RVkhaO2n3XFEeOdjJDEvMCl9o8vRJWUlR3lqu+fiCfWYzfIX1pVslNw?=
 =?us-ascii?Q?Oprlv/xZOYB58Yr2wp2Xbdv09lmfwisdJlCwBb395La7T7wzJuFxEaBgD949?=
 =?us-ascii?Q?uU/8msls2KO3zbdI84YQIOpLmKf32sxgbCwl99fkyFyTG8sJpjjKZyn6FU+k?=
 =?us-ascii?Q?iVFkobBPyi/waG9hLIE6CSef6gaO47IdMgQJUIKJ7xB9PlujEKcCsG7uyv+G?=
 =?us-ascii?Q?IHarX/ocJR0v+3/tsPIPJ0B4cxJJ6uS8OvURm0fMcDpKMbmsc1bCVP1mVb1g?=
 =?us-ascii?Q?C2OHmLK7t849Hy8jI0VEj0BdrV46j5cP7y1lDtKgfFLAncCNH5Oy5t4LJC+7?=
 =?us-ascii?Q?Haa8+4UyacDdj5NNLNw4++Xp1L2NvVfADwr/LBL1k8XGEuzO2atzk+dSZhtI?=
 =?us-ascii?Q?phPTDFf20jlrr28UGQZyYn234xgYRqbjoBRUCjI6t6T5M545tFjLD14oTj13?=
 =?us-ascii?Q?aKnVPQetSsi5LMU7/Y7u+f/1DLVkWL8j3+JM45ndhn3SA/REG3xLYDfLLsTK?=
 =?us-ascii?Q?N0h41rZlQ1IvNbD9mukj7T66xC6SyoJLerFCgFI39Ti7NB6dLlFGcEzKJ85u?=
 =?us-ascii?Q?8vYjTu4rdpQNdV7mCDiIEqArsgyeLyX2ez7tFGtDbmV+OKOelcofTw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Z9oPKLkbMIGoYupseEy5yYVmmYnWDFDQiqDDwh9zcJ1T7V+r9YC8lbItMFws?=
 =?us-ascii?Q?Q55zqJzN/x9chj++0hddgqcLZqkspjA17qmbgHN3YqQTS1CHCbQ+9HmGyhH8?=
 =?us-ascii?Q?65I7Fd7uILCX8cbfNMM7kPHIzkI2qa9PdTOVtu1g7yrmKZSQFObouTFfxkAX?=
 =?us-ascii?Q?KJeY+RjhVwccMVNLVLDSYc+F7jreqIA8jE196D1V9bmmLfcDZ9mkS6EbR1BR?=
 =?us-ascii?Q?Xs4FUBCcyV8qoLuS8WYPXdmWf7UuW3dbkL1HuflbQMbfuNOSTuxWa+bZADMk?=
 =?us-ascii?Q?EU3qdUfD++SCJ5dFEbNZZYwVPnwTQXvYYbnQ8VNSzmvQyuhM2HPE66kk8Cbj?=
 =?us-ascii?Q?XAEBW6719strtk+PaIy9ybmGK+pw3HOXOdm4ziW5H+Xl1UA6wt3S+Wt+ODBO?=
 =?us-ascii?Q?sTI/jJB9gEu5AAugxNPHvgeqXMX1+sxVvsB74Rs6GmmQcnKu37JJLJ2PqPTH?=
 =?us-ascii?Q?b0iYr4S6EQHffN8caTBqiYkbEl1PDhT3rr3BZOtuFZbVoNDCkz5T+H2lqQoW?=
 =?us-ascii?Q?ARk45bjYlKDHbtJNm0f5ZzV6BOf3A9iGbpKTgDEBWcnrEtmPHhpHvOEd8eCw?=
 =?us-ascii?Q?tCBvY9CNNULHe1wFbzmkZQwtkEhm0Xf3Oq2xQ1/wQOruRMxalcxTSs1WERtY?=
 =?us-ascii?Q?YU4wbkmktWP8ZmAJyWF1RcZQwck+lFtJ/iqZ4N0199dW7xk60FUJgJUqqlW2?=
 =?us-ascii?Q?jfzkzO4eWHFPwZLHCJ3NPYwqVNXCFCY1/7mdtEguW9HLQws5GLGkKmu2uH3p?=
 =?us-ascii?Q?7UEAcIdc1sDu3hJVWAd0bGzpUSWxNgKpKJGdpJl2raklUXmWizMmK0KepmoC?=
 =?us-ascii?Q?c+jfIakVuJRzMUhvPJqRncaHDDTJCij2UtF6diQF2vmXNgxch+ktMA8p+OTS?=
 =?us-ascii?Q?Esa4W5mFIw+JSz54Q9+fEoMPvorA4xdEnQbz1cfkFeoPhOMetOgtseD8jM9y?=
 =?us-ascii?Q?L4XO8v86X2PuetIUvAyBtJUm47HriRX/MfxK4OBCZphSlAJ/MKYiYEEas0Bk?=
 =?us-ascii?Q?+/xFzkZVEp8px/kQK+rT4a/ivTD57HAhXih/yjozeTUO8VmjVpA5AXXy15Yc?=
 =?us-ascii?Q?Xqc78FzicsyXr55KDpYeIxOdsQFAktrimiqXolcBnC6/sGdbcXHLesPRXapE?=
 =?us-ascii?Q?R7e2uAS2Bg5HRE7kC6zCebzpQbDNDSCNPYlOUjp8WILQel04aQ3TH6c2ow8Z?=
 =?us-ascii?Q?DoJc+bptogxNrzLtjWJcEtupETeeOO6XvI6Bw6/bjkNczxyw4TG0zrQaaIPW?=
 =?us-ascii?Q?X/s5Djd0gdapqkBqGCavWlakmnoEi/+FHmNijk8ua1H2LekxyJXpgwtzyJo/?=
 =?us-ascii?Q?qYJu1JCJRuMdy/cg7NdSDu4sq/g6olbJCPCAI3HEpPJGOBXzqztUo+UVOF5v?=
 =?us-ascii?Q?scrWh5KBx43TfMwdBAjEjisGemtTK8efUCb/Visv1Lt5CyNfJPm5Ri4VRfAt?=
 =?us-ascii?Q?JPe9KsQfOnHCmo+fbEGDfjO29Pq3iQQTznRCWx5WtzPGdbnQQvgiLRSN/uAg?=
 =?us-ascii?Q?VxYQbsUoFq7aoEuvgpuS3njiJGPYkCyGy9tj+P8E/iC4AWuYjICeTMXwOVdM?=
 =?us-ascii?Q?2wJPVxthrQHtFjxy3rBkfTODAm17BNAU94zHUA0z?=
Content-Type: text/plain; charset="us-ascii"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0787d4b7-acae-4054-9c35-08ddeab0e54d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 06:12:43.8267
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vORN54ZhoKI3N7g5uRvg10aH/CLIjF+iW2S4U7jeG9P3tsc+Nn4nMbcs2mJFQ9bCSUJAXkX/E1rvwtDqKNhM8IhJ2WQDQYSlbbAHSietzUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5550
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Rob,

Thank you for your reply.

> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/ast2600-clock.h>
> > +
> > +    apb {
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <1>;
>=20
> No need to show this node.
>=20

Agreed.
I will remove the apb node in next version.

> > +
> > +      pcie0: pcie@1e770000 {
> > +        compatible =3D "aspeed,ast2600-pcie";
> > +        device_type =3D "pci";
> > +        reg =3D <0x1e770000 0x100>;
> > +        linux,pci-domain =3D <0>;
> > +        #address-cells =3D <3>;
> > +        #size-cells =3D <2>;
> > +        interrupts =3D <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
> > +        bus-range =3D <0x80 0xff>;
> > +
> > +        ranges =3D <0x01000000 0x0 0x00018000 0x00018000 0x0
> 0x00008000
> > +            0x02000000 0x0 0x70000000 0x70000000 0x0 0x10000000>;
> > +
> > +        status =3D "disabled";
>=20
> Examples should be enabled. Drop.
>=20

Agreed.
I will remove it in next version.

> > +
> > +        resets =3D <&syscon ASPEED_RESET_H2X>;
> > +        reset-names =3D "h2x";
> > +
> > +        #interrupt-cells =3D <1>;
> > +        msi-parent =3D <&pcie0>;
>=20
> There shouldn't be any need to point to yourself.
>=20

Agreed.
Since this RC implements its own MSI controller, the self-referential msi-p=
arent isn't needed.
I will remove it in next version.

Thanks,
Jacky

