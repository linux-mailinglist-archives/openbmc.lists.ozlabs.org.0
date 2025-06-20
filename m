Return-Path: <openbmc+bounces-276-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E0FAE2706
	for <lists+openbmc@lfdr.de>; Sat, 21 Jun 2025 04:11:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bPHrd066Hz30QJ;
	Sat, 21 Jun 2025 12:11:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c40f::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750395873;
	cv=pass; b=I0Ev6kPa4+vo/GZhKBYvMbZW2T9xYu2HqoV6GaAVAPaUNYd6j97rmXfy/0EZ7z8tvzGy+ihyU0uuEd1+zpCsMYkz/TW732GUtZEdNJFaDq1etcWVoMnjVXbMi0+8wfSzJOO4nIo4Qxe2CN+W/TX8YtOWHjzusSlVoLpbB9TS+D+S3czPzNdIq/IbyZLgdK2ARVHXOuE1zPG57aFSGzXT1aANQjV36xJXpxzNiSgNsj1QL2s9uKg6NyKyyT+UxSAh3K2O1apQ/EtGr9T3FHB7iuni7NlyXhcNHCN0wdls3tehWj0pIBRgCJVRhn/KS9bqGzgnrqAZHPGqriI8a+afZA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750395873; c=relaxed/relaxed;
	bh=NihuYNfJDGD9+BZH8VGxwhWRFdH+Pyg50YDVRY7OsS4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mgUnEcVKX+hdmWVlvW3QXt+T6UHpXTMEF7VxthXoSWcwzY9itjUCvoyO2KbJcOeQRWHzlduvBJIvYA7IiE2yRhk85244KGqdmTFOqV8kKL2g4MClmScJDb2pdy7yrazn6V4rdSRxkaJKQe7PgNQbhsXQmO+EttVEt8rk7YqHEOiR1h/aQ/aK0PauU+r44zxl8A7jrSay9SUR63VyAKD+x9ZdugZvl33oUSVkIJ1poAMb0J7AxdgaBIcnbVfGeKRRbtbB50DsO48qWkyzPphrvwhhrrcGhKTzewPBnkBwp8D1t30FMLvp/V4hLAMOyNVoj9IH2t+7Agv8+16UxRXzNQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=2a01:111:f403:c40f::7; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c40f::7; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c40f::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNlkn2ZSmz2xCd
	for <openbmc@lists.ozlabs.org>; Fri, 20 Jun 2025 15:03:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N/QWjZOVvGHnMNseyv+WfHqil/Ok+N9mvawHNhiiP4v0XKZaUpyQUg8n2C0FhEz7dj9zWmKQ7S77WFnyTrk3sF0Nha6Q62mjR48Hnf8Jy4TlkMMSzlqJQ0H1NM8QAHiePdWllwVTdbG/uXAdTGhhq5qjk1/I751W9y8VZw8kS8K4N4c1QTeIWVWh1Eaz/hzZ6R/sgzZc2fP8YZ1/NmjWBcB/hzSLA0ne4Kmo+pGgPg505VBbEwdSBAx06pNIXvKLYIrsBIQULdVyb3AlxwP6/sUAwo0xIdxPlqPcfkQ0TKPZSne4jG8W+ka4A24RRPJh0eWNLyTwKP1NB88dymFU4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NihuYNfJDGD9+BZH8VGxwhWRFdH+Pyg50YDVRY7OsS4=;
 b=DEmAiSvrjXPemFThgO4VA5t62s9Dj48Be+TrnKKqVBZcwgB8mIzXqic9re2e8hVxf8LKbH2wivxVTXqZ1nxC/XjV1u3BmxHaDax13VImqWSqkhmFV2Y7TEKulmf32rki+r8+Jo6OdhzRXIv1hcFHlyHPmc5Ik/9fr41db42Y1cj9p901CSodxB+XmAMc52Ye+iVgFMDVWeH4gHwlN4nOzr+H9gX/FHhajmXWztBNoeQTU9eKZGZLEDubZziGqyb0rjomvwJEUZkPhCOm3zUKYNCVoZozxFN15LdyOwgSKcc/GsaiQMTgZIIoxvg9dd30z8eCLPXMvPxVa9z1NRjTVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NihuYNfJDGD9+BZH8VGxwhWRFdH+Pyg50YDVRY7OsS4=;
 b=Al5cTlL9k6KGgW+hTN69ucWsDnSDyohlzqbFoS5OUlIcW0P8QguE/tF49PB3lYK0IbyT39zxBen5XM86rtJoDOYdwpyu0fjwTdc+2edzCUhU6SYOUzkdASmVtIwF+4jaCN6VXb9edvFbwws3KX/Nim2TfvNxVoqm+6nMD+2E2FSb4J/qOw22y1eGu3ih0Xr4GBeb5Y3RqH4+iHM0RelLx+mt4QJStVo+h+epcygGWk4YQaUm55Ggmb7W7//jbPHQcGa+kaTk4gdV6PqsQ4FULkaYN1Jq1EJzpaW3Y6k6kvW7Ykl2YDvcMSxoZO4EYj8xfsLpghavXyNRcARJjTj3VQ==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by TYSPR06MB7299.apcprd06.prod.outlook.com (2603:1096:405:97::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Fri, 20 Jun
 2025 05:03:01 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%5]) with mapi id 15.20.8835.027; Fri, 20 Jun 2025
 05:03:01 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>, "mani@kernel.org"
	<mani@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "vkoul@kernel.org" <vkoul@kernel.org>,
	"kishon@kernel.org" <kishon@kernel.org>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
CC: "elbadrym@google.com" <elbadrym@google.com>, "romlem@google.com"
	<romlem@google.com>, "anhphan@google.com" <anhphan@google.com>,
	"wak@google.com" <wak@google.com>, "yuxiaozhang@google.com"
	<yuxiaozhang@google.com>, BMC-SW <BMC-SW@aspeedtech.com>
Subject:
 =?utf-8?B?5Zue6KaGOiBbUEFUQ0ggMS83XSBkdC1iaW5kaW5nczogcGh5OiBBZGQgZG9j?=
 =?utf-8?Q?ument_for_ASPEED_PCIe_PHY?=
Thread-Topic: [PATCH 1/7] dt-bindings: phy: Add document for ASPEED PCIe PHY
Thread-Index: AQHb3BN3poZHqaPRJEuwtTAqS+UGirQAzvcAgAq5i9A=
Date: Fri, 20 Jun 2025 05:03:00 +0000
Message-ID:
 <SEYPR06MB513488A235CAF69592364E469D7CA@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20250613033001.3153637-1-jacky_chou@aspeedtech.com>
 <20250613033001.3153637-2-jacky_chou@aspeedtech.com>
 <5d624bce-a46f-4b75-b785-56def0c7f108@linaro.org>
In-Reply-To: <5d624bce-a46f-4b75-b785-56def0c7f108@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|TYSPR06MB7299:EE_
x-ms-office365-filtering-correlation-id: 0c0b945d-139f-44af-861e-08ddafb7bb32
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?ckV4RWpZZG5NR1QxTGpOREtRUCt5WEl4cmtmUFB2allGYnJqMXhQcVpzSnVN?=
 =?utf-8?B?WGhKbEJubE5OQWIxQzZOUnBrcFZMelZjb2oveVYrMFlQVkRKa0llSHphN0JB?=
 =?utf-8?B?Q2J5SWFEQXZ6ZCt0dGZjaytnelYxWUk5V0cxZGR1YUw5MTRXMWJJRDdjR282?=
 =?utf-8?B?RU5OU3pXQlRJMVU1enViK2I4a0x4blVHa3owYW9nbE05Tlo3NjBVVXFvZmM2?=
 =?utf-8?B?Zk1NV1dadU5Rb01CeVhseVZKd2lWc2xSVWtMTXA4S21jWWZzMlJaTC83UjBB?=
 =?utf-8?B?azE1QmRRK0dZcWtLVklmb1lFR2piblR3RjlFWmIvckl6OGVyWEtyS0pBSUYr?=
 =?utf-8?B?Qm1iZ3RGRmxhRkliRkVTbjhkY3J2dllRRFVUZUJFYTVNbEIybEloM0xrMDZM?=
 =?utf-8?B?dUk0SEJtRDg5Y2V4RGQ2N0gwTUViVk43TUMwK1hkekI1N1oxYjNZelhQZERG?=
 =?utf-8?B?TDcraUIycTRybHkzTnNxY0p3TGJvS3dMWmNGd2VyNXVUM3hHai9WclY5d21L?=
 =?utf-8?B?RGNoQXRUdERmWjBCei9JcklTT2U1VjZRa2RnYW1POGI5dmtDTG9zbHFkNnJX?=
 =?utf-8?B?QWtYaWtmbExuNCtEamdQVDJMUDhkeWNvcHppckZpRmwvQWhTbDJjZGxHZlFy?=
 =?utf-8?B?SmdBdlY1cnVtS2t1MEpKUGVtckdQVVIzZDhvaklCcTA3czY3YjVxd1hia1NE?=
 =?utf-8?B?OEgzYzNnb2h4SmlpQVc5K3lmSGpxRXBsSUNDSXJXb2NzWXQ1K29QbFRBSUNO?=
 =?utf-8?B?QTdQbUk2SytaSnhLZ1JFdjliUU1KUm5rdHd4aDZ2MExEekNGV0dIaGx6aWV0?=
 =?utf-8?B?R3ZNSHVMQVZNbk45K3IzTG13MzM1ajlTbmorS0ZMVGpSTG1qNDNjNEJ1Q3ZQ?=
 =?utf-8?B?YXV6NE5MOFdYQ3BRWDFGQzlvTWdYRDRlLzlvVi9XdVBISWxaTU0zWEs0bVNx?=
 =?utf-8?B?dXdDQm13Tis5clBaSHdoNlZzWDZJSXpjQkJoUFlCN2VhWmJoOXZBdHRCaGtt?=
 =?utf-8?B?WXdPakk5Ulo5QVVtOEpmZlJqK3FtSE5PSmF4b2FwRlE2NHNDOHArTm90UlNi?=
 =?utf-8?B?WHA5VlpqWFRpeDZXRjcrc25tVkFyM21LK2NnTWs4R21RWnNEeFdDNVFEdG1D?=
 =?utf-8?B?RU5LSklCTEswVzRkNFJKRVVzSnJLQis2anFrdHMzNFpiN1Vkb3NTTGNJVWM1?=
 =?utf-8?B?REhTUERjOW5lQ3RRVCtLQkZDcUhGOGx6SnlNWFIvK3dobzVwSityUlJjVmRk?=
 =?utf-8?B?WGVKVks0MGRtVWU1UGhnb3dCTG4wbW0rczNHNFZYNHlMRTJPVldpcnVtWXRl?=
 =?utf-8?B?VWFQQi9TNjlkbUVZTjB2YmJTL2NPY09tZy96REo1dGVPd0hxcCsxaHlDODZN?=
 =?utf-8?B?dDdKZ1dXUHNMcE9sWlgwcVg4S04ydGZka1hxa1RQRnpvQ2tzaThrTGUzNGdT?=
 =?utf-8?B?aHR4NkRKUmg2SDM2djBqWHlvSnhrRHcxSXNUQVV4UTROOUwweHB6bWVmR3lL?=
 =?utf-8?B?dWlrVTIxZldmK3FvWDM3R1M2bFdveldGRi9WN1owY0FLLzZVYXpVTUdjeTRq?=
 =?utf-8?B?bE15aDR0c0o0Z24yaFZyQ1ZjRm5weENVcjh6dUE4azB5VFhiS2lyVDRvSk5I?=
 =?utf-8?B?cHNId255MFlvd3owMDR4NHMvdmhhKzZVRi9OZ29DelNIa1lCZlBKbmEwVHRq?=
 =?utf-8?B?bTFzQWJpOVZNZzBUR09BUitNU1JJK3hlYWNSdGhwUWpHRC9GV1pQNWJTYjhz?=
 =?utf-8?B?M2pvYWZuQnFGeHlQS2gwMEFnb1FhazRqYUQ5UEV1TzNOckxuclc4emxIMXJn?=
 =?utf-8?B?amFTRCszVm9rZk1qSk4zWlJ6YXVWeE11eGtlL1FOZjljTzNCTWhqOHB5NHFj?=
 =?utf-8?B?TUpUaWMwaFhyVERyeHRlRUlNSEJ1TDdvZDNITEV0b3hrMG90ZUFUdXEzYit1?=
 =?utf-8?B?S1l4ZWdsOGEwZHhvK3ZJN2lIMSt4aHBUVmVQV1J4WEFqVEdxWXBJOVF6dS9s?=
 =?utf-8?Q?yiBiJdtwbdVJoLRHErzO+R4BftAiSo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WXFtbzZrSnlTQ0VBK1IrM2htSWc2N3plWEZDT0x1Z0dZYkFVSEtLYW1pT1JL?=
 =?utf-8?B?Z1BDV0lpM3dMcW1xK3cyNDYyZmY0SUFTUmp6T0kyZmx1WTk1QkM0WUpKLzll?=
 =?utf-8?B?WmhWckpya0JJNGNEL2JnbDc0WjJtdjl1aTRZUTN4NVNrUUg3akh3UFZyWFQ4?=
 =?utf-8?B?RWZYQ2ZKQXZjMGxKTHNBMVhwbCtneXlSWFdZM0Uzc2IxellGQ3QwbVRLWUxk?=
 =?utf-8?B?VCtuZEFhOVh0dWVCNVkyaGo1eWdjc3c2MmpLWVRlajEydHcwNzNQcmlkeVBj?=
 =?utf-8?B?ck5IMERoZ0Y3c0I0TEpuS0EwWDNKZmpZWCtML0FMajZRelRackthUWFwWVZp?=
 =?utf-8?B?RDNxbzR0c25OMVY2TURMd3BVb2MxclVHeWl5djhqR1hscDZBeDZ0SmJVWVdK?=
 =?utf-8?B?K1F1TXdWcDFhZGZ5YjJuVHlJZVJBbFMxYXNKVDVtSGllWk1SRjdPanhMY0Rw?=
 =?utf-8?B?Q1ZhWjFUTjlMUVFYT3RzS1Y2RUlqRjJDeC84R2FQNURJRWx2cFQzRlIzK3FQ?=
 =?utf-8?B?Q0I2aGo0b2svdE5Hdk83UjBtNk9FUEdoRmJhaG1uTllQazhzcXpMSGZwczJk?=
 =?utf-8?B?Q2xVQ2ZhK1c4cWZwSHRaT3E1MndweXJTVkZaNHE4czJXTGhabUNJTHR0ZCtI?=
 =?utf-8?B?RVNkd1JiRysycmpmanlRV0hEcUNFbmVIcXRTc2lRcG91eCtzNUxLNUUraDdC?=
 =?utf-8?B?M2ZNaHlmNVR0eDlhdDl3YmJOWmhFTzlJMFlTWThuRm1uNW5XUFJqVDUvL1hC?=
 =?utf-8?B?SkVSdVBiWXlIa0xldURsdis5U011NVBkMmpBNmtUWHJOcFc0N1FtMlNRNit0?=
 =?utf-8?B?bHRrL24yUUlEN2w0RmJMNnA4T242eW1ha3pyblU3bEVtbTUyNjlMa1V1WjI5?=
 =?utf-8?B?YnI5Mm82K1dXb0k3VUN1YUxlU0hXa0F5SUZ1RWZTZjJwUUU0azJhUWtHcVJr?=
 =?utf-8?B?ZEN6bWVkR3g0M2RtUWp4bmxPeEFNM2E0RkVZa3p5dmI2VFM0MUREQXFyT0Jk?=
 =?utf-8?B?SVlBSFNwcklkbHlobjEwK1djclY1VmZZVTBCNTJwTURzL0xRRzh4OW9QcWdF?=
 =?utf-8?B?bUYwWGRhbjZHcFJhZlAreDlIamlIM3VuMnVZTEY5bkU4NldWN2lNdW1KZ3dy?=
 =?utf-8?B?TU1TbmpDcGFtS3hlWmVlNDM3eWFUaDF2aDArUFBaSkFrSjN3clZ5RFlnS09I?=
 =?utf-8?B?eFdldGdmeXV4U2h2aTFkU2lINUNSNGxhZjgyMEh0SHoxcW8wbkZ0a2xnNnZx?=
 =?utf-8?B?QVY0QkpBQ2tyZUZleHdhWVA2aGZhbTNYdEVxQkJCeUE0OXJQeVhTSW5BWVBT?=
 =?utf-8?B?Zy9NWW9pWEt3ZDlSTEZKTUhwRzVRSnpkSzdMV0I4ZU5oMlIzV2lZQlJ4Tktj?=
 =?utf-8?B?Wk56S2VuaU03Y1B1N3pwSkF3OUpMQ2cvcHA5a2xMd2JjQy8wd1dPT1BkbStr?=
 =?utf-8?B?MHFvK3FSbDJOK3BuVkpNS3FuWXNWZVZkTkNWVlZub2RsN25xK2c1aVRvdmk4?=
 =?utf-8?B?KzFwQVhmeXFKa2xoUERzQjdjakVKVzZBcVN0b2crT1BkODZqVXQ4ZjJqTC9C?=
 =?utf-8?B?dGRYYXM0dS80QnI2VTg1UDN1UUxnSUlBU3FqaXVHWFg2T0hxRzhWQkhZYURp?=
 =?utf-8?B?cjVLODZmMGVQd1RuMGZSWlNpTG4vODBTZkE4cjhibTJHdFVQK1Q4dVprbUlv?=
 =?utf-8?B?UjdsZkxwVk5IaVh3akhnbTFZZmNvbnRRVVl1VmNoZE1YZ3IvaVFsam9uY05q?=
 =?utf-8?B?OTFHTFZGNDdjMTNSajdEUHYrN0V4ZjJORkRQT1l5cHQ5MTZpVzNiRzhJYlpR?=
 =?utf-8?B?S2xKVlRuam1XRytRWkZNVThZUmRBMjRnbCtJVFZEL2JmeW0rQ3ZDUjJvMUh2?=
 =?utf-8?B?Q0M5czFtbVRHMGJMVzJyWVRFMVdGazN6bkJwVjJOVDg4UmRYbE5aUnJWVE53?=
 =?utf-8?B?eE1SUXljU00rK210K0oyOXBEYnpoajQzZHErdUhMM01ISE1jYVkvU0VJNzh5?=
 =?utf-8?B?K2RVTWtaQWUvVHViNzNOUzJHUUgyTkNQOS93OFVTUVdLUDBPMzRZUG9sVWFk?=
 =?utf-8?B?d1hqMURBWTVhZUhhSGMyT0FoZzJVLzdZR3dWZ3IrSm5HVzc4NTBTRUNIM3Jr?=
 =?utf-8?Q?lAGzR1LoM69NcPO0oCnTsY2TK?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c0b945d-139f-44af-861e-08ddafb7bb32
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2025 05:03:01.0546
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: arYB8o2ZG0Ls5J8yeNMX9u0dIxEnaSkvoV00e2UZWSf7AlHV/QJo9ZbQYAIQa9Y/hoQ+nQG7lmkhuUik7PzvfHo5VCJz4aulqmAokp0ZKJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7299
X-Spam-Status: No, score=0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

SGkgTmVpbCwNCg0KVGhhbmtzIGZvciB5b3VyIHJlcGx5Lg0KDQo+IA0KPiBQbGVhc2UgbW92ZSB0
aGUgTUFJTlRBSU5FUlMgY2hhbmdlIGluIGEgc2VwYXJhdGUgcGF0Y2guDQoNCkFncmVlZC4NCklz
IGl0IGF0dGFjaGVkIHRoZSBlbmQgb2Ygc2VyaWVzPyBPciB0aGUgZmlyc3Q/DQoNClRoYW5rcywN
CkphY2t5DQo=

