Return-Path: <openbmc+bounces-928-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 586DCC775BD
	for <lists+openbmc@lfdr.de>; Fri, 21 Nov 2025 06:24:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCNtb5fVMz2yD5;
	Fri, 21 Nov 2025 16:24:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c406::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763702647;
	cv=pass; b=Fjm6DCUpJXe2mt8ntz8gOEUI7dNmXZvZ9QTZjVGNHCOclUqVKi0ixi27dG+mI/U2nHl2+ButCse//yStw/3JO/BteTK/9N3MOeu2My0xKgaiZNQbXzqmReZ6UBOEtGbCn0hwpXz7z07eabNBR/ekxjWM18MLsXyNeU06bwN/827ms5CdAXLXGL4fSdIKH/OYA+3z96kUPxXKxdI5vwJUwUzgJ5M85sgxkNgSE3ku6mZLU7AkqQEptUE0ZDs0L2/C51sMthPvMVej4JOCWvtdv45ETEXZNNicZ35wf06IIy6XWnXCQCtRx5oSUZpdetGsE/GTiNBO3GDu40qIpjCFkg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763702647; c=relaxed/relaxed;
	bh=LAGWNtssXSYgqavQ9wZwSzmir4SXlClHonvJW5F/Jdg=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kxNixe7Z2vvuQqQbNui9wx8gR80CBFTLf8L9t06800pdQRGljxkcpNa9BpbqU7hPhMyf6H6eVqcTlymSqhjPbH9UHTYYO8KGNAtVLafjdBxtf6cIxL9cKd8qpizSiAxgLiwuYHmWYYd68USG9RzEs1Q3fuL/k70VecqrIMjuPF4eD77RSS6TDvfnV37zIZ13VlN+jcBE9gm3g4IvWk8Sz3GlttOqUu9cb5L2f8Uwa+NhYhcPexI5VzqqIMtvrtzG95WUY4e2kj22BYZQTNJ4DPMjQ6ARSNQ1F0q3RM7ZgzE3bvxVpqkZsfvtP4P+7CSBbke8fpVVHRhu1vHO4s7GRg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=KRtCN9cK; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=KRtCN9cK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c406::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCNtX5Rqcz2y5T;
	Fri, 21 Nov 2025 16:24:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=orjRWsqvF9U8vX7ludkzriVBdXKj6/qRFvOX3JGzngToRlNJJEswbHjFhImnyBRuSZ2WKT8ilHOVLS5EtRaUr3okhKVRd7cSCD00Y1CRXL6Iorcrd1fMdcX1xxsgwLMXUWLtVm/PgkQj3d8Utb3K1FiDc0rPTzuSpYHki9mNp17X13u3eGyQva3lMKPWJkhgGs+6fZjTJqe4Mv2yCQI+EYuTwUZZH3GKtQR9b4m6BRhtr5VzIqmMBW+Hx7TVjTVrALVLvJKgwtnjNOn3pk19DPbOpz0pXwvCBDiiYz19WIv+8H4pP7SKm2EonghIzdbE250hLEoMsGadZsIWFCs/+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LAGWNtssXSYgqavQ9wZwSzmir4SXlClHonvJW5F/Jdg=;
 b=r1napmLPdeSk6vEFwDLN/dpP8VnQn6M8JxZ/jHHq97lkYygsmkpny9mz09jGxFYGzhchKMi48VIxgec2LusOCTvqmncgYMDL/S7OUYsMxn1t+n9MqHScUNYFx2uJh6jvJk9CNHZjHR+rJS4qcRRQXvxiAp90TuOGWSZadltuLDM/TaxVKU2mat7QKIjZjTm3UmjVJTm2zyvEbfsizTtpXdX6QRdhzFUFLh+ybhUdwupXnsMtp/989bVEPIhV2TlxgunW9tAqn02/xEXn6eyNMFeKnUGkIAik0lXvUrZ/iRPIxLc+VHhnpO7uzoynrmoXyNEBfbJ14DdBtfrhBYj4Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAGWNtssXSYgqavQ9wZwSzmir4SXlClHonvJW5F/Jdg=;
 b=KRtCN9cKdN/Aa+712bGbjVLlml8cszM4t8RhDUfAIr074OpF1IF/ZP0aF01Z/9N/6iR8yl0LcH3Yq7Yno+KtlM2xGUFOBJkJbWjzHyVAVOL+FSnXnf1BU3KHjs3hF2HoiWxcBn/AuYrdSmJ/g+aTDbSKRFDRG3uCbKlu32BTj2wtphwkLKBzTbVeCQHMy8Bf4Fi36B3i8Pna9dd8SYbd/vKFwwGLD+/J1OLDX4KjslLHOjF1TjXtuO+Rw1n7BbzF+8fk+E8kyVtRgLqlTXjQDE5CshMedP+RmP/khUwoXlanCdgMdd9gsvYa+3vH2K6yneJ9yVYibaqFNQZDPBUubA==
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com (2603:1096:408::791)
 by SEYPR06MB6521.apcprd06.prod.outlook.com (2603:1096:101:16c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 05:23:38 +0000
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80]) by TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80%7]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 05:23:38 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>, "jk@codeconstruct.com.au" <jk@codeconstruct.com.au>,
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
 AQHcQisKZrgNdIKVU0mDlJSyYndfALTQ+A6AgAfdvQCAACofAIAT7eJAgAOJTnCAABhjAIABSC2ggArwQDA=
Date: Fri, 21 Nov 2025 05:23:38 +0000
Message-ID:
 <TY2PPF5CB9A1BE605A022105E6F1B6AA8F5F2D5A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20251021013548.2375190-1-ryan_chen@aspeedtech.com>
 <20251021013548.2375190-2-ryan_chen@aspeedtech.com>
 <0b76f196-f642-4991-ad5c-717c23938421@kernel.org>
 <TY2PPF5CB9A1BE6597ECD46BD4CB7C5F09FF2FAA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <3c3287f6-1c5c-4c4d-9349-32665a5e1585@kernel.org>
 <TY2PPF5CB9A1BE6FE06477B9CC51B8133DAF2CFA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <TY2PPF5CB9A1BE67DBBC08424DD062549BDF2CDA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <28fa635b-f9a6-41c3-8199-9630ed3e7649@kernel.org>
 <TY2PPF5CB9A1BE6C0ACB11FE9BB209B9273F2CAA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
In-Reply-To:
 <TY2PPF5CB9A1BE6C0ACB11FE9BB209B9273F2CAA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PPF5CB9A1BE6:EE_|SEYPR06MB6521:EE_
x-ms-office365-filtering-correlation-id: 0fc3fb10-b6d3-428b-8692-08de28be204b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?cG9ndWZvZ3pWS2xiMkZZTWJ4MjFWZktzK2FrZzRyR05kTS9FbVRRWEduQ0c0?=
 =?utf-8?B?cjVvQy9mWGtEcWt5eU9TUjB4bStkbnhlQWk1clkwZXFSWm1ZUUtvdjBwNGVM?=
 =?utf-8?B?bmJwTHBaejlzcTI4dTVldUlyREFGLzlqeUgvb2dIcHFpNy9tSlJtM0p6TFNl?=
 =?utf-8?B?aTcwWE53YW41VGFHVElYSEIzQTFUT3laRi84RWN6TXRTYmQvNzdlOXo3Yk1F?=
 =?utf-8?B?WHBEZloxaGNyMUI1Nm5FQkphNWF0QS9HNmZEcWFDN2hWRkRSNjRMcW5BRG1W?=
 =?utf-8?B?UUg2VGdzeGdsVzRBc1gvT1hoUGFVWS85THlUTXBNb29na3I5L2F3bytjQmEw?=
 =?utf-8?B?WHBaWW5qd2Q4RHdmYk9WMjlFZDJ6dHNZREh4MUZHWldTV1J3cFN3YkJjQmhq?=
 =?utf-8?B?VGtFVUJQY0l1dXdIUytEOXljTVI1enBoRGRxdE5UTnpSM0w5ajUrbmJzcmdi?=
 =?utf-8?B?UW1YRi9wdGJmb0RsbS85a21vdkhMS2U0T0dWNlVod1RsM0hwNnFtY3NTUUpC?=
 =?utf-8?B?SnN5MnpvbzlITWdybW1iZFVOTWloc3V5WFdIR0ZRUVJNMGNrTFJ4djlQSHdX?=
 =?utf-8?B?bVZSQnoxclVxalRUVlRVUG9icDdXbVkxYzNkTm1KcmRqV2ZGL0YxbENwMWpq?=
 =?utf-8?B?b0JScmQ0QnNFMVE1S1V4d3ZCdTdZUjNCVCtZRDRFcFBteksxRTJTaG5WQUtm?=
 =?utf-8?B?Wk1sZjZwWXVDTlN1QTU3dUdtd3ZaZWdTMHFqN1dXTzdJSzNINVo1cHdNRWVo?=
 =?utf-8?B?UTJRdzNHNlZGV2p1WEs2clZ6a09paTNrbDhXWTB4SWJTWXlEMks2aGk0YjZK?=
 =?utf-8?B?eEIzcUxZdFhaRkFldXJnNXNsbjVkVjYvY2RScFM4YTRJLzZZTlhObjNjcEZD?=
 =?utf-8?B?RU5Bai9lUEJ5MUljTS9sM2wyMC9JaEYvaTVFLzNmMzBTaGwxRTdOOWR2QSth?=
 =?utf-8?B?L1VZQkxxMTZnTFc2QXpWRCt1azhXN2hWUHROVm9NUU51RjB3OEVHQlBhWjh0?=
 =?utf-8?B?dElVWWkyL2VLUUFJY2VIcVFEc2E1RmxtN1YwZE5FREpMTktSMUg4SFdwNmF6?=
 =?utf-8?B?b0ZxMnJqSzRDTTlQUS9OMEZnckVCS0JPQlp5Y0c1V3dzdGVFU0dSV0NSWkF4?=
 =?utf-8?B?c1gwbmhVdFk1V1lKUlRVRStnRWhnMUxGZnVIRDJ5U3lXRnhDTUlBNW43Wnl2?=
 =?utf-8?B?UFJnTktHVDJpdy9vQzBPaHM2QmFERW03dkJZa241RjgwUmw5ZWVvVXJ2b1g2?=
 =?utf-8?B?NkRBOEQ4RzFmTlNEUjNseVVsUHEzck5Xbkg2bFQ4Yyt4SURQMXJxQ3pYdGt6?=
 =?utf-8?B?S1pqdEZlbUkyUE1TYWF3K3lYdHNONUlUeGpTWG9jdDZJUFFzMXpwUzZiemk2?=
 =?utf-8?B?TkZ4MHNNOWpocHBpcWFkTFhUelZmU3BCbWVBeE5JZGQycDY4aW5Jdy80UDZp?=
 =?utf-8?B?djdqbmxyQmlTRWNveTMrWmI3eWxzaVBQVDZBTUFZZ1NyVVFOem80bnh4S2gy?=
 =?utf-8?B?OHZtSnQ5a09RTXdmSWJwWEpBQkl5MEQ4aHZnZms2eStrUWdyMVM0MWVoRGhM?=
 =?utf-8?B?RE1HUGVjQkZvcFpLcFNUY2JQdlh0MG51QkpVM05Cc0M2SmlJZGp0Y0xoMG1l?=
 =?utf-8?B?c3JySTBNTDBxZ1VyQVNDbC9POStHMlRDaS82Qm1IUGVlc25lU0xQeVVLODVD?=
 =?utf-8?B?TXFHaUM3Mm1ZYUZieTJwdmdhOE9EZlhSc1FFdlF3aU5uNmxaL3ZHd3BOQ2lx?=
 =?utf-8?B?OXhnQ3RBVERDaTdSdGJtU2wrbWJydldPVVZnMWZHSWJIMXZaTFNEdjkyMnRP?=
 =?utf-8?B?TU5VWnozcHlVVFNZUGkyYkpBLytnWFZaalNPTWs1eGEzRENqaTF3Z2NxL294?=
 =?utf-8?B?ZHVaQXNjNFFHT0w1WlFrcEFOMFVseG40WWloWFFpaUg1Ty90ZWNxNFpWUXFO?=
 =?utf-8?B?UmFtcGVmME1iREVFQ3JsazJ3Qi9wZ1RkTnFucll2WlQrTDlTb2VRK1ZaSHB6?=
 =?utf-8?B?Rm9JUzJxYnF4eEQ2SHJTd0tSS0FaaWZqTVptVmhPL1BFWFBpblVWRG5HcCt6?=
 =?utf-8?B?NVVLTFdKeWVLdis5cFJQY0dEdG53d1NhVm5hdz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bGwxQitqYWxmZ3pxd3BJWkFBUzV3ZTVOWmNDdHRXWTJiTVZGOExCZUkzUzM1?=
 =?utf-8?B?Njg4YmE0NWdOUDF4Ykl5R3IwekUxOStkdUgvVTlhU2pGZ3Rtc0RBc2tWQ05m?=
 =?utf-8?B?QWROSW1pQU8vQlBPTWMwUjBSWkZUZWZjRTR3bS96WmZNWFF4Ky9VN1Q0L3o4?=
 =?utf-8?B?VEFjR2xoU3ZIcGRBK1hteVB1VkI0RVgvOHZrdlhpOXpRc3lTMWx5Z3ByTnd5?=
 =?utf-8?B?V05TdTlyZHl3b0krSm4rRXVaeGNycVVmVTMrMS9qNmxIbjdnR3QzWHF3Kzlo?=
 =?utf-8?B?UmExREpMdUJJZlJXQkhWaU45b29nZ1RkcGEwSk1PNVNuMjJ4NlM1SFpuY1Uv?=
 =?utf-8?B?ZU5kN3NFckFyb3J1ZXhtNktKYW42YVN5TFJNVmhDbjMzQjd3Z2Fhdm1hRlVo?=
 =?utf-8?B?Y01HNkFiNmczbDFkdlQwN3dEbC9yNnlzd3ZBanpyL0F3QWpqOC9qWFg1TG15?=
 =?utf-8?B?OFc0ZU4wQjNvZDl0STN3M1M0Q0hRaGxkZXRPNVhYVVBWK2pCaWxGVWl1SXpB?=
 =?utf-8?B?b0ZHRm8zd0paRHpJUVhTa2EyYjE2NXAyUmFFeHdFUk1LNllHeUI3SWlPdFo1?=
 =?utf-8?B?cTBVWkN1TjlqSHNvbG5rZWw0dmJSaW9FRjFyeEZiT1BGMW9PR05PWWJ3dVQw?=
 =?utf-8?B?eXEyb0ovRlF5RUFSTVl3cjMzU0pqbnl3bmt3K1N2STlISThVSnc5c3lPY0g5?=
 =?utf-8?B?LzE0K0RkQTY1NDdDdTNSWWMvcVlLbVgrNWRWeWhHK0hEY1JOeVd5UEJ6Tml5?=
 =?utf-8?B?WGp5KzBGek5EOWNxWGJGUkVYTklLMHNkZDJjVU1rek1YNU91U2lJb29vQldw?=
 =?utf-8?B?NkhiQU9LaFZXWmZIK1h0OTRTZjdpWjlFZ25Cc0hDckI1WDN4TVJzSmRWcFAx?=
 =?utf-8?B?RFJUdytzenFtL2NEZXNkSmhTOUZ0TEFwSWcwenhjRGZ0VmlmWUVpdkU0RkxY?=
 =?utf-8?B?V0IwWStuL2tiRWJienJiMTBtV1VzWS96M3g3QjFNY2hvQUpnN0plTGYrajVQ?=
 =?utf-8?B?OExYV1hySnRZakVpQWRFeGh1YWpxV05zZTZSdmZNQ25ZUldRTzd1bGR0dDRz?=
 =?utf-8?B?VUpyOFNOMHdiYmJWUUJxYlZYajBUNnFwMHJwdHlLTmRCSmZsVStMRzEzSTlV?=
 =?utf-8?B?RE9zNjJEcTgwM2p2ZE1UNjA1NkQyTjlOOXN4Sjd5d1hHTG5sdWorNGJ5aC9w?=
 =?utf-8?B?bUxxQkNST1N3R2w2MkYwVGJvT3BPR09vNThDRjgrZWRVOUlZK2szbmVDVzEv?=
 =?utf-8?B?bmMraUdKL3BOZC9RRXpBUnNoNGVUM2NoTVhYdUs5L1EzY2pEWXJQN2Qza0Rj?=
 =?utf-8?B?OUFXRFZrVjJxMVdyWExpOTlRbEs5blR5ek9IMm9NYjZQclhhSHg5aDMrL2NT?=
 =?utf-8?B?ODh2K3ZEU0w1QXFBMExicWtxRSsrcUFnV21EL2g4U01tbjZSZUVBbW8rd2Ur?=
 =?utf-8?B?MWpIekpkdER3d3cwL0VaSGk3dDk2ajI1aER2UlpqYXh1WmxGdU9WeGxuc1I0?=
 =?utf-8?B?K3J4eVd6MTBPSDRETXN5Q2RhamI2dWdWc2VwQmJJeWtMUG96aEF2eGhNdGh5?=
 =?utf-8?B?KzRaU0RJSk9YK1h4Ris0R3lWbE1LUWZTcjIzM1J4eGJLK21VTUtDMllKaDlJ?=
 =?utf-8?B?NFZNOUFpWFlKcUp2VXdpOGNzUlpYYVJ2bDlTYzJGTVZjbCtRQzh0OFpSaGpI?=
 =?utf-8?B?ODZCZm5TUTRrV2Rsbk1YbEMvMmhMd3NXaDRRaGoreE5iVjA4QnMyYmJpc3c3?=
 =?utf-8?B?WXBxQ0pPK01TU3dpd3prUmIvWGswOFpFSnZqZkEyajdVVnFZNXlOdmRXV0FR?=
 =?utf-8?B?YUo4OXJWSlBwbFZRQzg5d0llV2F3SzFYSEpROTI0RkN5OUcySjVteWNjRStV?=
 =?utf-8?B?UldXVjdUTjRuazI5bVhOdi9yTlNla3p0eU9uR0ZqYStRT1JVVVpSTVFMN0F6?=
 =?utf-8?B?RXpMRmRuaEloVm5YaHhjTXpPVmJ1UjBzOHVMZzl6VGhXRnBWbUhaOWhqdGdl?=
 =?utf-8?B?enhkakZ5am5TeXl3UU0yc0N4U25LVkVSZCtva3V4M3MvemNSWG15SHAwek1Q?=
 =?utf-8?B?RU9qM1IrVXZkWE4zTU5BUytaYzRHRHZ5VDVoYzdxdWFxUEszQjNhSytsSnRa?=
 =?utf-8?Q?EUAhuPderUTu9htJEAXuVLMf5?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fc3fb10-b6d3-428b-8692-08de28be204b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 05:23:38.3325
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8V9FMSj0v7LzvW3ILJ53RdGfhT7uGMUgoT3aJa+4hOPgl/yze168hCKEx1Bs1n+mA95gfdw1iDAZ6dIJBy03kG9j2fzmN852xr6CV1jUHNM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6521
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiBTdWJqZWN0OiBSRTogW1BBVENIIHYyMCAxLzRdIGR0LWJpbmRpbmdzOiBpMmM6IFNwbGl0IEFT
VDI2MDAgYmluZGluZyBpbnRvIGEgbmV3DQo+IFlBTUwNCj4gDQo+ID4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MjAgMS80XSBkdC1iaW5kaW5nczogaTJjOiBTcGxpdCBBU1QyNjAwIGJpbmRpbmcNCj4g
PiBpbnRvIGEgbmV3IFlBTUwNCj4gPg0KPiA+IE9uIDEzLzExLzIwMjUgMTA6MzQsIFJ5YW4gQ2hl
biB3cm90ZToNCj4gPiA+Pj4+Pj4gKyAgcmVnOg0KPiA+ID4+Pj4+PiArICAgIG1pbkl0ZW1zOiAx
DQo+ID4gPj4+Pj4NCj4gPiA+Pj4+PiBXaHk/DQo+ID4gPj4+Pg0KPiA+ID4+Pj4gV2lsbCB1cGRh
dGUgYXMgZm9sbG93aW5nLg0KPiA+ID4+Pj4NCj4gPiA+Pj4+IHJlZzoNCj4gPiA+Pj4+ICAgbWlu
SXRlbXM6IDENCj4gPiA+Pj4+ICAgbWF4SXRlbXM6IDINCj4gPiA+Pj4NCj4gPiA+Pj4NCj4gPiA+
Pj4gTm8uIFlvdSBjaGFuZ2VkIG5vdGhpbmcuIEluc3RlYWQgZXhwbGFpbiB3aHkgdGhpcyBpcyBm
bGV4aWJsZS4NCj4gPiA+Pj4NCj4gPiA+Pj4gU2VlIHdyaXRpbmcgYmluZGluZ3MuDQo+ID4gPj4N
Cj4gPiA+PiBTb3JyeSwgSSBzdGlsbCBub3QgdW5kZXJzdGFuZCB5b3VyIHBvaW50LiBEbyB5b3Ug
bWVhbiBuZWVkIHRvDQo+ID4gPj4gZXhwbGFpbiB3aHkgcmVnIGlzIGZsZXhpYmxlIDEgLT4gMj8N
Cj4gPiA+PiBJZiB5ZXMsIEkgd2lsbCB1cGRhdGUgdG8gZm9sbG93aW5nLg0KPiA+ID4+DQo+ID4g
Pj4gcmVnOg0KPiA+ID4+ICAgbWluSXRlbXM6IDENCj4gPiA+PiAgIG1heEl0ZW1zOiAyDQo+ID4g
Pj4gICBkZXNjcmlwdGlvbjoNCj4gPiA+PiAgICAgVGhlIGZpcnN0IHJlZ2lvbiBjb3ZlcnMgdGhl
IGNvbnRyb2xsZXIgcmVnaXN0ZXJzLg0KPiA+ID4+ICAgICBUaGUgb3B0aW9uYWwgc2Vjb25kIHJl
Z2lvbiBjb3ZlcnMgdGhlIGNvbnRyb2xsZXIncyBidWZmZXIgc3BhY2UuDQo+ID4gPg0KPiA+ID4g
QWZ0ZXIgY2hlY2sgdGhlDQo+ID4gPiBodHRwczovL2RvY3Mua2VybmVsLm9yZy9kZXZpY2V0cmVl
L2JpbmRpbmdzL3dyaXRpbmctc2NoZW1hLmh0bWwjYW5ubw0KPiA+ID4gdGEgdGVkLWV4YW1wbGUt
c2NoZW1hIEkgdGhpbmsgSSBzaG91bGQgdXBkYXRlIHdpdGggZm9sbG93aW5nLCBhbSBJDQo+ID4g
PiBjb3JyZWN0ID8NCj4gPiA+DQo+ID4gPiAgcmVnOg0KPiA+ID4gICAgaXRlbXM6DQo+ID4gPiAg
ICAgIC0gZGVzY3JpcHRpb246IFRoZSBmaXJzdCByZWdpb24gY292ZXJzIHRoZSBjb250cm9sbGVy
IHJlZ2lzdGVycy4NCj4gPiA+IAkgLSBkZXNjcmlwdGlvbjogVGhlIG9wdGlvbmFsIHNlY29uZCBy
ZWdpb24gY292ZXJzIHRoZSBjb250cm9sbGVyJ3MNCj4gPiA+IGJ1ZmZlcg0KPiA+IHNwYWNlLg0K
PiA+DQo+ID4gUGxlYXNlIGRyb3AgIlRoZSBmaXJzdCByZWdpb24gY292ZXJzIiBhbmQgc2FtZSBm
b3IgdGhlIHNlY29uZC4gSnVzdA0KPiA+IHNheSB3aGF0IGlzIHRoaXMgLSBjb250cm9sbGVyIHJl
Z2lzdGVyIGFuZCBjb250cm9sbGVycyBidWZmZXIgc3BhY2UgLQ0KPiA+IGFuZCBzZWNvbmQgb25l
IGlzIG5vdCBvcHRpb25hbCBub3cuDQo+IA0KPiBUaGFua3MsIHdpbGwgdXBkYXRlDQo+IA0KPiBp
dGVtczoNCj4gICAtIGRlc2NyaXB0aW9uOiBDb250cm9sbGVyIHJlZ2lzdGVycw0KPiAgIC0gZGVz
Y3JpcHRpb246IENvbnRyb2xsZXIgYnVmZmVyIHNwYWNlDQo+ID4NCj4gPiA+DQo+ID4gPiBXaGF0
IHlvdSBxdWVzdGlvbiBhYm91dA0KPiA+ID4gIiBQbGVhc2UgZXhwbGFpbiBtZSBob3cgb25lLCBz
YW1lIFNvQyBoYXMgb3B0aW9uYWwgSU8gYWRkcmVzcyBzcGFjZT8NCj4gPiA+IEkNCj4gPiBhc2tl
ZCB0byBleHBsYWluIFdIWSB0aGlzIGlzIGZsZXhpYmxlIg0KPiA+ID4gVGhlIEFTVDI2MDAgaTJj
IGNvbnRyb2xsZXIgaGF2ZSB0aHJlZSBpbyxidWZmZXIsZG1hIG1vZGUuDQo+ID4gPiBUaGUgQVNU
MjYwMCBoYXZlIGJ1ZmZlciByZWdpc3RlciBmb3IgYnVmZmVyIHRyYW5zZmVyLiBUaGF0IGlzIDJu
ZCByZWcgb2Zmc2V0Lg0KPiA+DQo+ID4gU28gdGhlIFNvQyAqSEFTKiBpdC4gSXQgaXMgYWx3YXlz
IHRoZXJlLiBJdCBjYW5ub3QgYmUgbWlzc2luZyBpbiB0aGUgaGFyZHdhcmUuDQo+ID4NCj4gPiA+
IElmIGR0c2kgbm90IGRlc2NyaXB0IGl0LCB0aGUgZHJpdmVyIHdpbGwgZ28gYmFjayB0byBpbyBt
b2RlDQo+ID4gPiB0cmFuc2Zlci4gRmxleGlibGUNCj4gPiBpbXBsZW1lbnQgaXMgaW4gZHJpdmVy
Lg0KPiA+DQo+ID4gRGVzY3JpYmUgdGhlIGhhcmR3YXJlLg0KPiANCj4gVW5kZXJzdG9vZCwgdGhh
bmtzIHlvdXIgZ3VpZGFuY2UuDQoNCkhlbGxvIEtyenlzenRvZi4NCglBcHByZWNpYXRlIHlvdXIg
cmV2aWV3Lg0KCUnigJl2ZSB1cGRhdGVkIHRoZSByZWcgYW5kIGNsb2NrIHNlY3Rpb24gYWNjb3Jk
aW5nIHRvIHlvdXIgY29tbWVudHMuDQoJRG8geW91IGhhdmUgYW55IGZ1cnRoZXIgc3VnZ2VzdGlv
bnMgb24gdGhvc2UgdXBkYXRlcz8JaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUxMTE4
MDE0MDM0LjgyMDk4OC0yLXJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbS8NCg0KQmVzdCByZWdhcmRz
LA0KUnlhbiBDaGVuDQo=

