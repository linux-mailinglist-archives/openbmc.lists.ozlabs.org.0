Return-Path: <openbmc+bounces-285-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7468CAE7280
	for <lists+openbmc@lfdr.de>; Wed, 25 Jun 2025 00:52:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRgFs5366z2xHv;
	Wed, 25 Jun 2025 08:52:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c406::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750763509;
	cv=pass; b=Lv5yiUyAju+bZzsIqOUf1z2TrqkPXDPAmrjrPHFsKGotFJ7WEi5omBEi9wqdgLFJiFR+X7LBU4gWIB8WH6Xjn4HpMJwIiOhNcvYPSnQMdIC+MdzrFlmPOpMQgubIchKE5+99QPSOV7vgBDBuwU3I3xZYRX2sAitiLELKSMb0RwfmckXmhl8IUvYCCvh9NyQYbIFYga6BPV38l5Sy+wSK/kpE5egY9JC/HMpukZrGnRfVNNYlcp77t4taq84/b9HWNrQstEcH0/U4m9D1E5S8Vpa7CO0bdbVikTBYbDSVNvGV1oUC5X6F18X7h9niANhMBfxLy2vMH/XxNCyWxb7SlA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750763509; c=relaxed/relaxed;
	bh=HNXJaCIVZiVtk80fPFW9ea2GJTxJmHYuTJo/2i4RB0M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IMAAxTIiJp7pSlNAi6tAsjX2D6oqJYr6MKzDsprO9tRCsKD4bzXchAWMVPMQwu3QPloUtOc9F5IPBMufKRwrK15ivZMv0o5nayNuuH8Z8y77k6D+F7VNg1fl+UiW98E73lypw43nKVWnSoWt41uVudcmdcFjmDqFLJWG862oOlh2+T9qL1nDPhb1X/inWayTVCR3C5XAcdsCKdJXdXd9/JMoxgOo5jAtuv4wA18vKHr4STXfaSA2DiM7SfI8ME2Ms/tnRVNa7G/lieturhfm3cfMy9514fztSecl0LbikIl3hYYu1fFCUzGEhcv/AX4YDH0v76xKWAFAXxH1RxrYjA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=BP/1+Q4i; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=BP/1+Q4i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c406::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRMj058kDz30NP;
	Tue, 24 Jun 2025 21:11:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RMXiWxXefGbBC56bRzNdbPtB/ARWo606C5B+uLeraveHIE1pSZIfwy4T0y58561H3QzCoJLMQOPtkWk5O2x0Zos2kkqDW6ceizKT9wZvPFovPJ2c1Yaa2AI9OgdMSJvXhVQvy0yZiqa0a3t9SYGKzTQNgwhILAHoI6e5ApBDD4a/0+AN2taOQmnPpVISlzmcgocGnxIc4VRj5NvpmWuIW/AgH1fQmu/oSa/lTloJjVODd6HAeBdDZubZtRbvMjfMB/d0JQAYwKrp/2AkG0qIibVHfeokuWGgLT/grSH2D4MVJxcBmq8ZC9xea/odQ1bEEZtxQkd66Y4QCHXzCWszWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNXJaCIVZiVtk80fPFW9ea2GJTxJmHYuTJo/2i4RB0M=;
 b=ZpTdxCUQw3LmXa9u32rgApfTxeiEZPuve91h6sLMpNrGVALvSjneotHEdu0NjrdvwJhlOMGL6yELj39gtF5B2Mw/pwdRpEYvQKN09XywS3kI7O2IAMaZYtE70pad2sa4qGqI/6xA0Zbz5EnYT8n6ddrVu3ieruOQzlaVX8GXFWSmuksYq5giw+K2VE3bAyi7sGssWeNTq+ICnGEtg4rrIQFP7qbYqTckWK1VTKKHJVcn3O7HosH4MINqITlaRr6PPzIdqhcV/5ImWnogZXdqlV0fN4ush/hfKvCycCr5SrB8CZhBkQ3jeuLAxWt0aMu4QTUMF/dZ9hImWksrkZvtvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNXJaCIVZiVtk80fPFW9ea2GJTxJmHYuTJo/2i4RB0M=;
 b=BP/1+Q4iYfPMT0JuGOeERZAFyOiSkRQi+UaHo0/jHQXX3rdcUEF7vds21Ej0lzRoyONoq0xDnAy6bXTqE+23U/jKRNmm7cuY3+HMSOuhETAsYyHSIJod79Vknx3xRBfi9ho5vABJdo4bJwJmrS7C6erHwZndz+7xl5L9GoM80NdaEy3V50LJxU/5Cby3yvyw6tfvbPZ4GcEx5cox5lw2oYhfQGc6qmgqEdLeMAL96qtqnnWan+YUnxBNpO3nY0Cv+MQ6KcjVzmmFXVSeegQw77mFUhgFqEMDvm1qZYAGiwNe+TS5b0/uOGSKODgNUdYyIt2yCZy8tE2bwQEu4wxamQ==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by SEZPR06MB7080.apcprd06.prod.outlook.com (2603:1096:101:1f3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Tue, 24 Jun
 2025 11:11:23 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%5]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 11:11:23 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: =?utf-8?B?SWxwbyBKw6RydmluZW4=?= <ilpo.jarvinen@linux.intel.com>
CC: "bhelgaas@google.com" <bhelgaas@google.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"vkoul@kernel.org" <vkoul@kernel.org>, "kishon@kernel.org"
	<kishon@kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"elbadrym@google.com" <elbadrym@google.com>, "romlem@google.com"
	<romlem@google.com>, "anhphan@google.com" <anhphan@google.com>,
	"wak@google.com" <wak@google.com>, "yuxiaozhang@google.com"
	<yuxiaozhang@google.com>, BMC-SW <BMC-SW@aspeedtech.com>
Subject:
 =?utf-8?B?5Zue6KaGOiBbUEFUQ0ggNy83XSBwY2k6IGFzcGVlZDogQWRkIEFTUEVFRCBQ?=
 =?utf-8?Q?CIe_host_controller_driver?=
Thread-Topic: [PATCH 7/7] pci: aspeed: Add ASPEED PCIe host controller driver
Thread-Index: AQHb3BN5QYkLFJ4SFk66wBBeIABUJbQA/lGAgA8cdnCAAhiQAIAAAwxg
Date: Tue, 24 Jun 2025 11:11:22 +0000
Message-ID:
 <SEYPR06MB5134378DDE51A94D9F83E7439D78A@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20250613033001.3153637-1-jacky_chou@aspeedtech.com>
 <20250613033001.3153637-8-jacky_chou@aspeedtech.com>
 <40d1c5bd-0457-55ea-2514-ba27e6a4c720@linux.intel.com>
 <SEYPR06MB5134973F678EB5B163DD50809D79A@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <a618588d-54fe-69a9-27f7-7b19ba905a52@linux.intel.com>
In-Reply-To: <a618588d-54fe-69a9-27f7-7b19ba905a52@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|SEZPR06MB7080:EE_
x-ms-office365-filtering-correlation-id: a04761f8-fcdc-4628-ebdc-08ddb30fdaa0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NnM1TmYzR1pZSmRvRUF4WFZyZHdna2tUWGE5NTBMSnlOb0VTSGM5SkRLOGRn?=
 =?utf-8?B?a0Z2WHM4OGRXZnZOa0pvUXkxZ25MZC9UUlhCYUM5SWNXeDQ2TzY5K0dvWnFO?=
 =?utf-8?B?TWRvayt0SFhhSG1jMkRmNjBhMXo0L00xVlB4M0lod0lFaWR5QjMzUmVZbkxD?=
 =?utf-8?B?SjlHc1NrM0VpRENNWHVlL0hOOW0zUWY0QUJJNXlmUndDWXpXQzN1VGY1Q05Y?=
 =?utf-8?B?K1FRR2dDaXVwR296ZFVyV2k3clQ1N1RpNFNuY1RBQi9tclp1QjZGdmNybDhw?=
 =?utf-8?B?ZmdObm8vcDQvejZMWWpVdW8wYW10amo2MDRQRnZFcDNyNmNNWjNPbG1NS2Vs?=
 =?utf-8?B?bmNZbURXdzQyMFJSNDlKWk5sWkVILzc5ME56VHVBbnJNVHNpNVJYUXNlRkdS?=
 =?utf-8?B?VUZOcnJKMjRwaC93Z2oySEZCR0hHSFkrRk5LSjFvblpNbHpsRnpzZzNXU2dK?=
 =?utf-8?B?Rzl6bXVMUzZTQkp0V1JSa0craXgrU2JRbU03VVo0aUJJSTdvaUdGMWl0YnFS?=
 =?utf-8?B?bzhQK01JbmpRK0ZZWUppd3NZeVd2R2paazM4M3B2ZFdPRDR6L3cxZ3plK29H?=
 =?utf-8?B?VnJNek1ucFdaeU1vcUdTcDRSdVhxZ20zbFJKcSs5TzF6K21GcWFMbEFJcFMw?=
 =?utf-8?B?OTZzZHZjaWtSSEY3UXhyOHkyMnV5dXBQdDloYzZHN0IxLzBGUkxmWWxLSU45?=
 =?utf-8?B?SFVoTnlkYzdLbFRidys2bmNQcEUzWnNEWERuN3dzTFY1dEVDRkZlczM2aWdQ?=
 =?utf-8?B?RGNoL3lhNVZNVkdrSnJnNzlxeG5MWmlrS2NuN3lDeGgxNWJHTzl5WGJQWlNn?=
 =?utf-8?B?ZExrMm51N3VuWVMzL1VlY0NsMFp4K2tZckpRL1JTV0g5QU9nTXhOZW5TeG15?=
 =?utf-8?B?ZkFOcE9ycWNiQWZNd3VraklkeVpSbzc4TXNRSmhiZUpnN2lITU9xU2FFczJ5?=
 =?utf-8?B?QzUveVp3em5MRFNWUkhKYlFRZUh1bHpQSU5mcUN3eUI5Q2VsOS9BYWlwdGQ3?=
 =?utf-8?B?aEpvbDhzVStmdmNIMTZYcVEray9EaEhSclFqTDhiNjErcHp6ZmpSeWdyQ1Zj?=
 =?utf-8?B?NlZXRWwrTC9CMHFxYTJkTXNDV1A4by9IcVpQOEJmMnZZVWI1VUNnWUFsWDVm?=
 =?utf-8?B?Tk5vQTlDaU9QNTlSTE96bnUxRE5BOVBWZWNUamFOUmJpUG1CMGkwSHV6MFNV?=
 =?utf-8?B?Uk5xT1dFRmZBaUZ1SXNXeGJ0K2l4dDh4SzVONmpvcVdROFdFcVRCN1dzcFM4?=
 =?utf-8?B?TXpweVNxV2pKR3hrUzdsNzJEU3JsT284Sk1QSzJYL0xRS01SVzVTcStZazd0?=
 =?utf-8?B?UkFNcDVtKzlIK3ZlOTVQdG9CTnVodFJQUHpPSGkxRU5YWWJQejFFVm1DOFFW?=
 =?utf-8?B?VkZUenJhd201NkVKYWRSWkIyN3dDbk5WODVzbkloam5FdlFyUmNWVEJLYzBu?=
 =?utf-8?B?QmNOZDY5S3VUR1FqY0Z1ai85WWx4TThZUDZ4dXpMeXA2VE40VDc3Y0VhZ25U?=
 =?utf-8?B?Z00zWllLdWV5SmRVM2RkWStUZlpFYjhVcmdUdTJnYjZqbVJJYnpkT3hGUHpk?=
 =?utf-8?B?MXpSdElUYUdzZjI2NlVXYXY5YXpGOHpkejZDaUYyeGRLTkYweExONitOMjVC?=
 =?utf-8?B?MEI2K20zeWxyRXc2T1NQbE1acklGalZOMEJhcHdvLzdBZjEvTjFqRE9GVlpa?=
 =?utf-8?B?eU41eERqejd6THlIQWlKRkdPZkZGMmdjTG9JdTFmdzhJRHUwdkR6eXB3ZmJm?=
 =?utf-8?B?Qm8wSGpmZzcvTTFncGpGVUt6UlJ6THlMWVMreCtUeEduRmtkQitlbVFScmFB?=
 =?utf-8?B?NEpGc3FtaU1RVyszMVJxcnFXcERmVlU3RGpRamtLalA4SWF5U1c3Q3AxVXp1?=
 =?utf-8?B?VUliMnVxTjFZU3ZESjB3ekNYOWVkSW9rclFYdUg2WGl5VUFFT1ZUT0lMTHZO?=
 =?utf-8?B?dzV3bzVFck5mUm1aeisrcVBhbFFBWm4ycWpJaTIzd2hYN21Eaks5bVBjaExL?=
 =?utf-8?B?RnBOU1FFL2N3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a1lKMVdaU2tndTdkdHpKV1BtZDExQ1VoRGd6SXQxU0lqSTFpOVpacnR6Umlx?=
 =?utf-8?B?WlFLSlVha1YwSmRnT1lBY2tKMW5NbW5ac29EWWswQjZYdndoaXlQZGw0OWw5?=
 =?utf-8?B?RkNtei9UaHJoQkhGSSt0MDVQZHNuWHNhWVNQTlBFenR2bHJaUGQ1d3hib1FL?=
 =?utf-8?B?R3ZvYkEwbVVOd0VkTUQ5STRxcFhPRExIMmFPR2JjQ3NmdkZNTU92em84ZmVw?=
 =?utf-8?B?NUlKNXdLOHdlWjducVF5QXdadkt3RjZQNUFJVnVMdDF4OUMvNVBHeHg4NjBl?=
 =?utf-8?B?dkZGczljS2owc3pWSVFnWmhQTmZQV3lsVyt2Vjl1ZGdFc1lzbUdxQUpHOHpo?=
 =?utf-8?B?cnRndiszNTlrU1ZUSEVUU0dXZXMvbkljYnl3MUllaHNmOVFyeWhvNWpsYXhW?=
 =?utf-8?B?M09VcTRrZ29tMDhVSksybXU0UFN2MWs3dGtUbitPTURaekdORzIyRGtvRWhy?=
 =?utf-8?B?M3FUa0x6YUZSVWYyTC8vc09ES29XR3oweFM4anp1VDhnWml4RXNOK09GNzhr?=
 =?utf-8?B?dGFFbDJCcXJkOWRzZVJWZllMdnd6WHJqeG9uNHJjZVliUm1HMUhRR05jV1FB?=
 =?utf-8?B?ay9FSE5ybVZnaC84N2M1TU1xQW05L3VQeS95bUxkU3JYbkU4M2tVK3VxeU5Z?=
 =?utf-8?B?T25RWSs0S3lTZDVvMUVpUVJJeEJoQnYzanB2WFQ4dDJjYTYwWjl6N01ZbnVR?=
 =?utf-8?B?NFltQ09Pemszell2WnhOcE5wbVd1Rkg3MG9OWEY2MG9kS1ZGY3UzeWZHdkYv?=
 =?utf-8?B?OXFWa21EdmZwTXVCTlVIbUtiK0JWNGlHTlRWZ0J3OGdQejhXV3RYZFkvTlFR?=
 =?utf-8?B?cVBVb2xlaEhFcjFVRStNU2NMTU5wYi9ZdXF4MDNlOUFacC9jdE9TWUZYKzhX?=
 =?utf-8?B?anFWVUkrVHBJYzMwRmNqS3BObERKODhXVGxOeXdCMzNhZFNISXhNdVlTQWhE?=
 =?utf-8?B?QmFnbzhNcDNDNDBUSmhoblN5OWo1VkJuS0VjTlk4eHpUOXFjbk1NUzFEVExC?=
 =?utf-8?B?T044b0I4WkQxVTQydU5ZbGRFRHMwaXQ4WmszNHlkK1U4N2x5bVp4bndsMjdD?=
 =?utf-8?B?emFoZnZBT0JXbTN4SFhHYWxvaTM3Rjl4Q0lmank0K1ZxRlpRaVBValdDbEFC?=
 =?utf-8?B?SjhpTDBPdS80MCtUOTMyWGNTZWNxZ3JRMllqbFlXbEFUU29PREN4d2p5MmRK?=
 =?utf-8?B?S09pQm1INis4UkRnZHpYRXJOSFBSZFNoU1BhcEk5SXMva2lORXIxTXhDOHVB?=
 =?utf-8?B?WURtQ3dLN3ZTbXh4RlhuYU5wa3RkaUJjU1c4YWRnbEZraXlWUjUyc0JWQXlx?=
 =?utf-8?B?WDFuVi9OMUJCRUJpVlVPa29hcUVndThDdi8vQlFTNjQ0OVNXdE05NWh1NVFH?=
 =?utf-8?B?ZDNmcjYzdkM5cW9oemhYNm5hYkg5U3dDc09ZTHR3UFJYMy9aNS9tNk43MFhU?=
 =?utf-8?B?VXdVTXFiUVVuNGR1MWtSK1V3WGNYczlQSEJnTXZIbHVYQ2ZKeGZsYm1OOGZn?=
 =?utf-8?B?OHVUSG5PTkV0M3FDaWhEeVA5dmFOeksyQVdyZ2ZNVmNManIvVTFYSlJWZ1o3?=
 =?utf-8?B?ZHFUaUtxL0xvWWxUSXpPNld6eUpvaUY1YWEwRXBub2IyNlVaeXlIMmw4Q3ZM?=
 =?utf-8?B?SHhwcWxEY0QvbnN0NFZjUWVWNWduNE1Na2JVK2pEVy9NZG1YaXlBMHkxRnNw?=
 =?utf-8?B?Z3VJVEt6VDU2KzBwRWxzQlZ1SnIzaUNUVW1mcDBwdURZU1ZxYXgybFh0K3dl?=
 =?utf-8?B?eG05aHpXMUVmZHcxdXk5ZFMxKzlOL05EM0RKRzJGdjU4bzkzNnhuNHNhNjlo?=
 =?utf-8?B?OVhrZHFPa25KTU90MzQ3L0RaMTZYUUNEM2hRTGpxNnl6L2JrNlhPVjdQL2xt?=
 =?utf-8?B?RnROYlRxd3Q2bVhyMkVtcEliTHNZOE5UdXZtSnlkZDBVMm82ODNvcU1XQU5q?=
 =?utf-8?B?b1Q0ZHJYWm9ZWUJ6VFg4UVpPbXZjWVFFVis2MVh5eURscjIyQXI1RWVWWGcy?=
 =?utf-8?B?ME9iNjhLdXI1Yzhwc1Q3WGxOdFdlaHlySWdHWVhLM2hicUErUVdUa0h2NzNu?=
 =?utf-8?B?MURCVTRBRUZCeXpOS08yVVp3YjdqQjlEYjZCR1F2UWtPZklQVC9hUW1nUVZL?=
 =?utf-8?Q?6+KabtPCuUWIiP3JpWMwuEIvR?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a04761f8-fcdc-4628-ebdc-08ddb30fdaa0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 11:11:22.9788
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1HLSO9xOXLbd6+G9HzaD4sBRDFHSSMeaT4zRQqf+0FjVYmOw+PK+/F828Ux2PsLQBabM9fv39c5B6by7Gq5WC+9QEGpEHyHZWjcY18UCb44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7080
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiA+ID4gPiArCXUzMiByZWc7DQo+ID4gPiA+ICsJYm9vbCBsaW5rOw0KPiA+ID4gPiArDQo+ID4g
PiA+ICsJcmVnbWFwX3JlYWQocGNpZS0+cGNpZXBoeSwgUEVIUl9NSVNDXzMwMCwgJnJlZyk7DQo+
ID4gPiA+ICsJaWYgKHJlZyAmIENBUEFCSUxJVFlfR0VOMikgew0KPiA+ID4gPiArCQlyZWdtYXBf
cmVhZChwY2llLT5wY2llcGh5LCBQRUhSX01JU0NfMzQ0LCAmcmVnKTsNCj4gPiA+ID4gKwkJbGlu
ayA9ICEhKHJlZyAmIExJTktfU1RBVFVTX0dFTjIpOw0KPiA+ID4gPiArCX0gZWxzZSB7DQo+ID4g
PiA+ICsJCXJlZ21hcF9yZWFkKHBjaWUtPnBjaWVwaHksIFBFSFJfTUlTQ18zNTgsICZyZWcpOw0K
PiA+ID4gPiArCQlsaW5rID0gISEocmVnICYgTElOS19TVEFUVVNfR0VONCk7DQo+ID4gPg0KPiA+
ID4gV2hpbGUgSSBkb24ndCBlbnRpcmVseSBrbm93IHRoZSBtZWFuaW5nIG9mIHRoZXNlIGJpdHMs
IHdoYXQgaWYgdGhlDQo+ID4gPiBsaW5rIGlzIG5vdCB1c2luZyBtYXhpbXVtIHNwZWVkIGl0IGlz
IGNhcGFibGUgb2YsIGRvZXMgdGhpcyBjaGVjaw0KPiBtaXNiZWhhdmU/DQo+ID4gPg0KPiA+DQo+
ID4gSW4gb3VyIEFTVDI3MDAsIHRoZXJlIGFyZSBnZW40IFJDIGFuZCBnZW4yIFJDLg0KPiA+IFRo
ZXJlZm9yZSwgaGVyZSB3aWxsIGdldCBjYXBhYmlsaXR5IHRvIGNvbmZpcm0gaXQgaXMgZ2VuMiBv
ciBnZW40Lg0KPiA+IEFuZCB0aGUgbGluayBzdGF0dXMgaXMgaW4gZGlmZmVyZW50IHJlZ2lzdGVy
Lg0KPiANCj4gT2theSwgYnV0IHRoZW4gSSdtIGEgYml0IHdvcnJpZWQgdGhlIG5hbWluZyBvZiB0
aGUgZGVmaW5lcyBhcyAiTGluayBTdGF0dXMiIGhhcw0KPiBhIHdlbGwta25vd24gbWVhbmluZyBp
biBQQ0llIFNwZWMgc28gaXQgaXMgY29uZnVzaW5nIHRvIGNhbGwgc29tZXRoaW5nIGVsc2UNCj4g
TElOS19TVEFUVVNfKi4gRG9lcyB0aGF0IG5hbWUgY29tZSBmcm9tIHNvbWUgQVNUIHNwZWM/IElu
IG5vdCwgY2hhbmdlIHRoZQ0KPiBkZWZpbmUgbmFtaW5nLiBJZiB5ZXMsIHlvdSBzaG91bGQgcHJl
Zml4IGl0IHdpdGggc28gaXQgaXMgY2xlYXIgdGhpcyBpcyBub3QgcmVmZXJyaW5nDQo+IHRvIGEg
Z2VuZXJpYyBQQ0llIHRoaW5nIGFuZCBJIHN1Z2dlc3QgYWxzbyBhZGRpbmcgYSBjb21tZW50IGFi
b3ZlIHRob3NlDQo+IGRlZmluZXMgdG9vIHNvIGFueW9uZSBsb29raW5nIHRoZW0gbGF0ZXIgd29u
J3Qgd29uZGVyIGlmIHlvdSdyZSBqdXN0DQo+IGR1cGxpY2F0aW5nIHNvbWV0aGluZyBmcm9tIHRo
ZSBQQ0llIHNwZWMuDQoNClRoYW5rcyBmb3IgeW91ciByZW1pbmRlci4NClRoaXMgY29kZSBpcyB1
c2VkIHRvIGdldCBpbmZvcm1hdGlvbiB3aGV0aGVyIFBDSWUgaGF2ZSBjb21wbGV0ZWQgcGh5c2lj
YWwgdHJhaW5pbmcuDQpJIHNob3VsZCBjaGFuZ2UgdGhlbSB0byBjYWxsIExJTktfVVBfR0VOMiBh
bmQgTElOS19VUF9HRU40Lg0KSSB3aWxsIG1vZGlmeSB0aGlzIHBhcnQgdG8gYXZvaWQgY29uZnVz
aW9uIGFuZCBhZGQgbW9yZSBjb21tZW50LCBhcyB5b3Ugc2FpZC4NCg0KVGhhbmtzLA0KSmFja3kN
Cg0K

