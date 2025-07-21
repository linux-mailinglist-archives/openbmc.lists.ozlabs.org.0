Return-Path: <openbmc+bounces-387-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29789B0BBA2
	for <lists+openbmc@lfdr.de>; Mon, 21 Jul 2025 06:08:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bln1Z4bdSz2yRD;
	Mon, 21 Jul 2025 14:08:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c40f::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753069644;
	cv=pass; b=eSDd3cYu1w2CFtizPkVUS75V0ZXtz7A+JlnW5Woi5rh7cB9dA7ljs5E/+1MWVlUKVPvND06t7vbLvkqTHCbISH1/Tyf8FcwPBnjVEbkjhHVpTnyas9hQ5I5PrtWsJYac6YwppjLn7/e10qT+VLQrpTa8eV69v5LBlF0BmSbV+wHMTyWYG2J26QhrLKiKFqZ88PFz/44kp3fq0ekHoMxD6OXzz60m81FTTcEl7Luug3Gfv3zf8v590aFAPIZkuNRt7BovbflI/11gw/e+US+5r6ro5njJjVvzSdQ7HCNBjY4hJaBlibsr86G5XLR1HHm6KCzwlMGQ3cncw9GahDNRfA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753069644; c=relaxed/relaxed;
	bh=9E8HVgRlOISFqYdNDxk1rbIR7ZYaI9xHkOSfoTnJftU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aH3LBSrx9vm4uDeGAAQd+ytPInNWbtlzqBLz13eY5mBevYf+enSD7Z7Y8Oq+Yi+khQ6L9OdQ0A8zke8JjcPbZcbGOBIml8jc1t8cRe/43Tb4VJK5TtDRLQpMrS6fnqLADSwjP8o8MB+l4s80wCIP9wyJ3gx8Jh/Z3y758uD+tJ6kdoU4Ef54zlIpw1ZV5w2Z1inAS3H075shX7gmSG3Ji2GXiIQKtFt/E4czwLndAMG9GZfB5zlS5x+LlZ+iwrlOub703pgFv5sO70H5g2k8Awc5K6OdtUuR1ArtSS/ceaIw+c4cPRdQTBD3NGo/uR98q/On73Q0NqRFo916hB7hmQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=ZCc0ZXTG; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c40f::7; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=ZCc0ZXTG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c40f::7; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c40f::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4blmYm09GFz2yFQ;
	Mon, 21 Jul 2025 13:47:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ntMcHGnjohDMA5sHwoe04Fs3xgzAa0Zqpxk86mrRGYqzUhouPqGU3BskzLX8jn4RlmJfqlnK2ol1TgCeujIPmCzCnmeDcnm8XDLDZgc7RUYSdR905uIyouYf/n9r6vsrMwVg1Yai/l3XhnbN6Bs0+qiwx236GhOv2OvaBWS3cpj8myVHvMWy/AU6ImLeZg2eT8SzRhYR3rJtfScmjRgcCiUdPBy8OO1GjbL1MViNlo+vbDiUMJbnHlcK6V3M+xrZn1dkwP6j+D2ajx609Z0iTZgfStvrKjlw9ZI/WFIkXvTq9sTQQ1YIX+vpZxATKO51JaGnOqvim6na8o093HkSJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9E8HVgRlOISFqYdNDxk1rbIR7ZYaI9xHkOSfoTnJftU=;
 b=pUH/EMVAV4HNjy9P3cc4xe0RZPHdGiTi4FTOHlVHsiqh2PSUvTC6Ma474PSHC+W1Ux1899SjnDkyhiWMhjE44qmlmPeh6l/z5GSxt6GxTCxmKkdHkV0Jb6WZVOBCPsvPvFbPheMJNtfBqm3lQgb/b5MWAuDF3gDZnjKRzmfbh4cbrEVbC5D2hvJ3xbRj41mc9NlCEzXv7cGlVXk/IhYO+Jt0XoqwzuG85c19SkSF3wpKW8mAnj8TiKi2zSWjfMdjMn8hwS23/23jU2WPIgtZTegwr6AArJHogw6MjQWT8/kfmGihUtp8dx8VQGNe7fNnOQcp5UJheS23Tff+uJYpuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9E8HVgRlOISFqYdNDxk1rbIR7ZYaI9xHkOSfoTnJftU=;
 b=ZCc0ZXTGLJzTJweZbLN13q0GJpc7GGvToOvQSpL+azqoAvpj+H+6CppYy6VMcR/U4eybflhbidXd4rQ6xcDpS3sG0cxGW9D9Brsw5Vvv/9e4LqsUCTREHVBwromP2u65VB6qXiheF/N4D8+ps5LT7kwjq7YY6FW5Wfouq1kn4UdHSqQ37y7ELOezwg9x5GtbMsOzxzW1aveGcSBch6x9EvrTQP5Pe7m9XzZ9/wYR0FCq6g6cUdCNBGF06L+UcSdCTZKbKPFxC7ut56yfWVCyXdCRtyqK0mVjopaISAvjr/42+vVFU4gwV5zQGmTGIoPO107clox5IfIvRoIARiEdoA==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by SEZPR06MB5716.apcprd06.prod.outlook.com (2603:1096:101:ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Mon, 21 Jul
 2025 03:47:01 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%7]) with mapi id 15.20.8943.028; Mon, 21 Jul 2025
 03:47:01 +0000
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
 =?utf-8?B?5Zue6KaGOiBbUEFUQ0ggdjIgMDEvMTBdIGR0LWJpbmRpbmdzOiBzb2M6IGFz?=
 =?utf-8?Q?peed:_Add_ASPEED_PCIe_Config_support?=
Thread-Topic: [PATCH v2 01/10] dt-bindings: soc: aspeed: Add ASPEED PCIe
 Config support
Thread-Index: AQHb9TqixRLpAA/bIkORFe+toHBr5LQ0a6GAgAeNllA=
Date: Mon, 21 Jul 2025 03:47:01 +0000
Message-ID:
 <SEYPR06MB5134F8A2030833C17176A8E69D5DA@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20250715034320.2553837-1-jacky_chou@aspeedtech.com>
 <20250715034320.2553837-2-jacky_chou@aspeedtech.com>
 <20250716-wine-partridge-of-wonder-af10a6@krzk-bin>
In-Reply-To: <20250716-wine-partridge-of-wonder-af10a6@krzk-bin>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|SEZPR06MB5716:EE_
x-ms-office365-filtering-correlation-id: 12d26d75-c1c5-4376-5340-08ddc8094034
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VFJVNnpoMTJOK3NWMmtHQ0tVNGpmRlRMb0MxMjBWeGdlUHB0dDBNZ0JOWElw?=
 =?utf-8?B?Y0FlZlJKOEhEaUZ6NXRZYTRSWXlrN1R1a2hvOCsraDE2RmF4dnpFbnZlYkRD?=
 =?utf-8?B?Qy9KVFdaVmNBMUVINmk4eWFiS0xSVTV3a3oxemczRmxCK0ttL2gySnRpWTlK?=
 =?utf-8?B?TTA5WmFaNWZIWEdzZmg5RTk1RWYydlJxRGc2ZWthTmZ2TEhiTDkwWTZYQkky?=
 =?utf-8?B?Qmo2alg2NXV2d0piUDVEQVdERDZ3NktpYjVGR1N6dXhuZjhkbnNSSm85MmMr?=
 =?utf-8?B?eUN2VTB5RFdZdHVMYmNYc1pVbmcyZEJ1aWoxblVib0habTR5d3pSWnFQYWJL?=
 =?utf-8?B?YWtJU2FxdjZUWlJJcUp5Rzd3U0txZkFqYXoxK1dML1dvc3dnRURjVzMzeW9W?=
 =?utf-8?B?a1ZhOU11UVpLVldvcGVSM1VxQ09vV2JzaUJUb25JTHJRWFVaNm8yRDVtaElP?=
 =?utf-8?B?cG5wYVR1dkNxbEtZQTl5eWFJWStjOUt5M2xpRWhDeEhrS2NnYXcrN1FzZ1dR?=
 =?utf-8?B?T3Z2b1V3cFJCTWo5RmVhaUZ5M1gwamlXZWQ3V3M2QmhrV0p6VkwrQ2JYdlli?=
 =?utf-8?B?N2cyU2o3QTR1SGZvVEZNMnk5VmpJRmhILytDQWIxeUduWitHTHFRMzNqaUJ2?=
 =?utf-8?B?YkVyT1UxR3ZrWm4rRG1VcldQRGM5MEN6ejVnZi80anFJVm5DcVMyb2ZnRGph?=
 =?utf-8?B?V0ZmUTM4dGhtd3c5WDl0TTVCNUJCdXREdHptQ3BWZjdZajRQWHZFMTRXZldL?=
 =?utf-8?B?d204Z29IYU9NRFJmdXQ2NW8xcDAxWVBZNERFMmtUNUdpN2FlbjlYNUFsVDhJ?=
 =?utf-8?B?aVkzMEd5VnNPUURNRHF6OXdFazVUWVRhWG4yOWh6RlpjTHdPbUE5eHVzN2dP?=
 =?utf-8?B?S0syTDQ4c3NlMElzYWtsMDFGdmpxUlNvUjBsSW9oZ2ViV3pKaHd2SjhYNGUy?=
 =?utf-8?B?OWdmK2dMTEVsaHhZQzFaR3FUV21RQlpUZFhEczJrd253b0dSUmFxNDFpcnhx?=
 =?utf-8?B?RE1OdVBqMzU2ekJ5WnU2MU9YaUFLeHpYNlNuc3BhSTlyemxuYlV1YlVieUdV?=
 =?utf-8?B?Zmw0ZHJnbnJMUm9OcXRVOXVBbmJPZ1BTdTRzd0liN3Noa3lGUWE0WGl1djhG?=
 =?utf-8?B?bmNGOGNpNzdTRm9sUUY3clZwTU9uby9uZzYra0tXUC9DWU1mdjNXUUhnb3RN?=
 =?utf-8?B?VVBmQnhQT2ovek12cjUvNGgweHUwMGgwZ2R6c291NHI3eFErRlVvSk5oR0pK?=
 =?utf-8?B?ZVpUQVI3MGgxbDlaWUFxaEVvS1dOaEV2cXNCTEJycTR3SmV1aHp0M1l5YzNY?=
 =?utf-8?B?b0VQWTlOaFNLVldUWDhMbTBZclFRWDhtTzh5d0QvZHFLRmR0T2RoSVNYb1Nl?=
 =?utf-8?B?NDlaVE5BZUs2OTdEb251blFBV3dSMy9rbGhQRjhmY1hYaVlvU1NHS2xDUkNI?=
 =?utf-8?B?SFFlaGREYnlsMS9oRlBvSHhYclZUQU9HQll0bDVFbUp0b3hEQk9QaDJRbDJp?=
 =?utf-8?B?ZTNRdG5sQnY0NUcyOURvVG93TmdOcVM2N2FZQncxbFZsWWdmZW5ieHRYd240?=
 =?utf-8?B?VnFwZjdvcFY3bXd1S3BpbWp2QVpjd1kzWWdMYThhWnpKMWpLelhjUy8rQkpI?=
 =?utf-8?B?eFkyMjhBSFl5SEJOVjF6QXVRNXhCQWJzUXMvRWl2VXRGTVdsT2E1cmVZN0h5?=
 =?utf-8?B?UnVPRDNIMDlROVROU2plTENsT3NSUzc3dEVUWk4zRTJFOWkrdW1ZZ3pUTDV0?=
 =?utf-8?B?bU1TSU5yV2ozdklpR2NaOXhlVng2b1l5bjJSdFJSOGFIS01SS1RkVURnVTZq?=
 =?utf-8?B?bzVyb01HYyttZmswcnRzMy9RcDZaVmh6YmJ6VnlYNU90SHFkWkZ0UmsxUjNW?=
 =?utf-8?B?VDQyR2Uxckh3cG1tRkQ3MEpEUmErLzdHbU5HazUxVWkwUkxvMzBvU0tRNGhZ?=
 =?utf-8?B?T0llME1nOFpJWE43b0JqakhBQ1FNU2xkSlc3dEM1NGVVaDlZbWh1alFBclB4?=
 =?utf-8?B?QkNPUEdJNDZnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MHBwcVpGV25abmJ3VDF2UzYxZkZOcWkvV1lkZU9jZUpXUFh2MUNwQmtzVzF4?=
 =?utf-8?B?emdMbVV4RjFxdDJFTU1VS20ySzlncU82RXVnVDNWUXFNeGVPRFdxSE5kMVhF?=
 =?utf-8?B?NnRrbEYvcnVkOC9WUFFsRURKTUJzdXhVRWh4aDhyTWUxaStmcW93dmVOZy9a?=
 =?utf-8?B?cUpwU29peG85eCtBaUFpZ0crMG02NVUrQTdiNm5HdncwaTdpN2M3cGpTdzlN?=
 =?utf-8?B?Y0UrVDlubEE2Rzc5LzdZOEl2UGg3ZDZPdDJzUHhkVU5QZng5b3ByVkNqQ1ZC?=
 =?utf-8?B?OWdUbDJweEpjczNZMURjcXlweUxaeTZOTmhZMW45QWVWS1pqSFdQaDVHR2pH?=
 =?utf-8?B?cys1eVJ2M1dQVHByaE5uZlBmRlE0emNUeXNtLysyWkxjYU1jMVFzWmlOWFlr?=
 =?utf-8?B?NGUyMHZnRVk2NThaNkh3Z1VCbnIyU21BUzRmbGExMkxnUkx4c3RQZFhOclZz?=
 =?utf-8?B?MGlab1hJS09KNXg5WmtHRzJWaytjL0IxSWsrd3FWclpmVzNMS05LRHNiY3lo?=
 =?utf-8?B?RStDcEFmZ3p1N3BxZ0h0cVU2Q3R6b3k2Y0VwbVkzSkdDWkY4NC9MUUFweGk2?=
 =?utf-8?B?YlFkMStlM3hlZmZ0NHZRbllqcElpS0ltbnRNZFh4dkZRVm01NnpHVWZtaFJp?=
 =?utf-8?B?M0ZJdk1OU20zSkhBN0h0TTZWZ2J3K3ZSNkJ2SGVsbmQ5YVdNUzIybC8zaFJu?=
 =?utf-8?B?dWZkWkNqMS9TNk5mbnRiV2R5M0I4dE12Sm12QlVLYkw0VG9uRk5uUWRtTEc4?=
 =?utf-8?B?VXozMGRZMWlxTnFuZ0NkM1pjanMremhMTDNvSEpOTmJYY05COThUbnRKdXZo?=
 =?utf-8?B?VlYwUUM1TDVJazZXNGVqSXhyakhwMmdGMlFYWlVLb1BLSStlTDE1bkhmaFdF?=
 =?utf-8?B?OVR3dXc3elNUOWVOUklscmovZTJDRWs0MXpva0wrbVcrSmNKUDZ4dzYvUzJI?=
 =?utf-8?B?U2pCcnNieUhRVFlwTlIzOWJiVHBDNjY4aDg1bnBycDF3UFNWOWZ1THdsQnQr?=
 =?utf-8?B?aXpLbzRGOWFEUFg1ZkU2bi81aGRMZ2NjbEdVZzFnRDVBcGovK1ZuT1JTN3Q2?=
 =?utf-8?B?a25PYnRINUVsVVcyM0hxRHpBYUVOc1pvN0VabEVmZlRzbjBNS081NGtwcTM5?=
 =?utf-8?B?WloyakU4OVZ3aDFZWjZOWEkxRTZ6OElvZ0RER016cE9hdHlJUEw5YmZoVmty?=
 =?utf-8?B?SitFOFpZUTh0WVV6M0hDcXgzZUhVQXEzcU51Y3Q5SWtZQWo1dzg2SjBPQUxm?=
 =?utf-8?B?OWY5QjFFQWxVdEdFSDMxT2dpdi9Xd3N3MWNpb0szeHllbzFoSkNXdE8xdE1O?=
 =?utf-8?B?cnBhUVZwYkJKSFUzQmNpcHNxNlVnRmxTQ2dtcmhMNStZZ09nQ1U5V2h1UHo0?=
 =?utf-8?B?eVNnUWVvemozK054bVRZckk5b0RESllUM3JaTDRuakVhTEVwSDkyVGRVekZN?=
 =?utf-8?B?ejh2SnppcjNJajJFYnFGOGVYRzZuRWVJSGVFSEpqTy83bjl1NHZYZ1lJencv?=
 =?utf-8?B?TFdsZVVjcS9oZDl2RHRTTFU1VElyT0hEQzhuTnF5MUxzUTR1N2YvcjZDaXRj?=
 =?utf-8?B?V2VydUx1RUF4aW1xYytJNnQwUnJsSXE4MGJ0RjBQazI4WTBObCtjNnZ2a1Ry?=
 =?utf-8?B?ZHQ3ZThCRkNhcHFaZmlLbCthZGJmQmlON1diT3p4RGtyUnBvUDAwaFgxQktl?=
 =?utf-8?B?UENPbldNSlJicFBrRTRoOURLRzFMR1RyTkh1MUJEajlsN1hMQ1c0bngzZ3NX?=
 =?utf-8?B?VVdhWkhjZFN0MmQrcTg3bE4rVHJlVWRTdU5EcFBpM25TT1duc1VldmIxTlZN?=
 =?utf-8?B?UzlRNzUwNFl1bUFqdGlOSG5HbTRyT2YzS2pzV3NlaVRRSTB1SktIUUxFbGZR?=
 =?utf-8?B?eEpJTnhSRitBekNtNklORkNCMmJkNFowdEhBYTBLZUlqSFdXV1B0Ym00N3pW?=
 =?utf-8?B?RVp5eml1TmVoSDVZWGsrVUkvQnUralNMUEJrNGQ3Z0svZHlsdFVJMU51MEY2?=
 =?utf-8?B?ci9BbURtbVUwdm92ZUxDdjM3dlBmUUg4TmVvVDVtOHRUTjN0Qll4TUdVdklP?=
 =?utf-8?B?Y0kxaW13dG1PVGdZRUdQd1YyTU5IMTFZazh4cHcyK2YrQS8rNS9IeEU4b2NM?=
 =?utf-8?Q?X0k/q10GdxBsTmJsMVjJD3PJz?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 12d26d75-c1c5-4376-5340-08ddc8094034
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2025 03:47:01.2307
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2FMyEhmQg2bgqJDXIHZ//mG5XE6lz3Id+H5QrmyKeMf1Trxp3YAdGVcW7tk3lGaC2MYTUT5SrmuirQzdnif3nNEzOq5Tk1ht6z4KP4TczA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5716
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

SGkgS3J6eXN6dG9mLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuDQoNCj4gPiArbWFpbnRh
aW5lcnM6DQo+ID4gKyAgLSBKYWNreSBDaG91IDxqYWNreV9jaG91QGFzcGVlZHRlY2guY29tPg0K
PiA+ICsNCj4gPiArZGVzY3JpcHRpb246IHwNCj4gDQo+IERyb3AgfA0KPiANCg0KQWdyZWVkLg0K
DQo+ID4gKyAgVGhlIEFTUEVFRCBQQ0llIGNvbmZpZ3VyYXRpb24gc3lzY29uIGJsb2NrIHByb3Zp
ZGVzIGEgc2V0IG9mDQo+ID4gKyByZWdpc3RlcnMgc2hhcmVkICBieSBtdWx0aXBsZSBQQ0llLXJl
bGF0ZWQgZGV2aWNlcyB3aXRoaW4gdGhlIFNvQy4NCj4gPiArIFRoaXMgbm9kZSByZXByZXNlbnRz
IHRoZSAgY29tbW9uIGNvbmZpZ3VyYXRpb24gc3BhY2UgdGhhdCBhbGxvd3MNCj4gPiArIHRoZXNl
IGRldmljZXMgdG8gY29vcmRpbmF0ZSBhbmQgbWFuYWdlICBzaGFyZWQgUENJZSBzZXR0aW5ncywN
Cj4gPiArIGluY2x1ZGluZyBhZGRyZXNzIG1hcHBpbmcsIGNvbnRyb2wsIGFuZCBzdGF0dXMgIHJl
Z2lzdGVycy4gVGhlDQo+ID4gKyBzeXNjb24gaW50ZXJmYWNlIGVuYWJsZXMgZm9yIHZhcmlvdXMg
UENJZSBkZXZpY2VzIHRvIGFjY2VzcyAgYW5kIG1vZGlmeQ0KPiB0aGVzZSBzaGFyZWQgcmVnaXN0
ZXJzIGluIGEgY29uc2lzdGVudCBhbmQgY2VudHJhbGl6ZWQgbWFubmVyLg0KPiA+ICsNCj4gPiAr
cHJvcGVydGllczoNCj4gPiArICBjb21wYXRpYmxlOg0KPiA+ICsgICAgaXRlbXM6DQo+ID4gKyAg
ICAgIC0gZW51bToNCj4gPiArICAgICAgICAgIC0gYXNwZWVkLHBjaWUtY2ZnDQo+IA0KPiBOQUss
IHNlZSB3cml0aW5nIGJpbmRpbmdzLiBZb3UgYWxyZWFkeSByZWNlaXZlZCBjb21tZW50cyBhYm91
dCBnZW5lcmljDQo+IGNvbXBhdGlibGUgaW4gdGhlIHBhc3QuDQo+IA0KDQpJIHVuZGVyc3RhbmQg
dGhlIGdlbmVyaWMgYXNwZWVkLHBjaWUtY2ZnIGlzIG5vdCBhY2NlcHRhYmxlIHBlciB0aGUgYmlu
ZGluZyBndWlkZWxpbmVzLg0KSSB3aWxsIHVwZGF0ZSBpdCBpbiB0aGUgbmV4dCB2ZXJzaW9uIHRv
IHVzZSBhIG1vcmUgc3BlY2lmaWMgbmFtZSBsaWtlIGFzcGVlZCxhc3QyNjAwLXBjaWVjZmcuDQpU
aGFua3MgYWdhaW4gZm9yIHlvdXIgZ3VpZGFuY2UuDQoNClRoYW5rcywNCkphY2t5DQoNCg==

