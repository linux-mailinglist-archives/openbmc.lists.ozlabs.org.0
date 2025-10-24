Return-Path: <openbmc+bounces-798-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E9AC06478
	for <lists+openbmc@lfdr.de>; Fri, 24 Oct 2025 14:37:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctMq61k35z30N8;
	Fri, 24 Oct 2025 23:37:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c406::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761309426;
	cv=pass; b=Tg5ckptjB/aWfbfKgueAVgiI6oq457ZnkGetXc3jZo3ksFNV7GNiK16uztFQ+dJsfYACel7UWoKIKm/hiyOz/AuBZRtUZHZ5beIjUTp5ZRmPIclVFea9a18d7ZiBTTtxirQQWV+0cqT7C/iPQ91HGNkNmujDqR1682eCTZq4XRqXhBeuKddQZO3i9ryyKEJCGkAfBG+oWtklcAWc0WmzZMvJM+KAQKTzB+M6PzmgqZfMSAb4wsnTvACNC2WizPQ65wqbfX1xYS7k+1+nDCgLKg5r3oETlTTdxEmzD3LFcW6kFVbLkJBPVwGQnxdIFwxDiLzsa5QnfEhXO+dpOfXCeg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761309426; c=relaxed/relaxed;
	bh=PaSLqt+MxaGwpIsH/9hLvIQ+WTnklL/A+skTMs3GMPg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HV+jjZv0MofdP7YzQqXL7yV/5UVtpxRWEEZyN//oRWnmFRWank/wssHd3J+mIf9Gu2/1S66nMI5I3v0lKZYj9hHRaqXA7PFN/yQ75a2y4Rymw97gchkhD9M0Sng3DfrTNb7jUSmNts2ax9jARWr1bxur2UlzDytDpK7ejnGlAbyNHb6c8YNYTh4iflUvGZu3YiiDB44rzGlPR5xtuXIBQnLHsx5rnQd3Qqr+DgMsqEaZo+lka4JSPOeBTYrP+igoYBimY0ER3+M/3OpJjhjghPm/4kM0/U2r6cryD+9HEhIWJRZHHmt7UY1KoNEny+RqfujkgNOk5pGJ31dU+HRXfA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=eeHnmYNO; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=eeHnmYNO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c406::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctMq36dXnz2xsq;
	Fri, 24 Oct 2025 23:37:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DLinQZWdmLOWbEY2e4aL1OKcX6WiklJRFw2UglbLCE620oZAEfhGY5ATgPjRYqy8IIndxUy5XmzKSeQA5Zd61yGHxl96RhxuAm76Ie/tuBnWUeyRhtGAmzWYA1Xdi5xSujtcJozWOEf5e16SpOo+cjTcCrjorSEYYmyTe8+ksVdPnoAUuQaxU0uG1teOhz19CDGfGnL0VCxl6EVGqwOkgU14r37bF8smqDW8V5QgbaPmhS9PfEQg86XZSzkRVFuw7dh4ec3LeYcZXwD2djPIW9z0LQH34ZaxcPOt2fgS0A5Sf1ddxlLFJntQRr+rgcHjTqqF4TWVb6hc3Sd8Xel8nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PaSLqt+MxaGwpIsH/9hLvIQ+WTnklL/A+skTMs3GMPg=;
 b=TpkRmAobsnRuLTCr8rUtxN8m0zuDpF2ykLTmtU2s3O2aGaOwIvZ20f3vALBP6esPEl3WkWuNxGkejmWDAswduYrAJ7aKqeR7rfoWUvrMb74POjLOh8Qzj3FqjfkxBMq9BoGDzfOygSog3b+rkXeqkW4J6JlW7wzB7LZ9nKvJrdX+MHZYhMfgO/+wFjEK126V7PXE6Fku+Kh4S6tDOmUHilEPz+XqJakrDRiTOjGVax8cuvIOqLELaSXO7CN+vrC1bK2+yUoVqxreYvw/7oR3B/GU35yI5yZbX7Bl5/w0KAZGMUu5DR77UOvnVY1BxbLqMWSe6IvJpwMtI51OAS0MPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PaSLqt+MxaGwpIsH/9hLvIQ+WTnklL/A+skTMs3GMPg=;
 b=eeHnmYNOPZAOT3aTg411jW//4STaR4FnuaZpaiRhM8/qYucr5o+xR1qw8GPhWHCaJ3PcYN3ud2cfgbueRnMUR/a0zUai2qlUKS5BtxlBA46jmdWm/fMcPcYr2u9+MgLe1uYySKNGv2owHvx+AiI69JFSR9gFeDXwtI0QSIThVi72G7SgJvoqxDBFtbkKRa+zSNTGaQAK3NErkLn5KaCtkzSOEKkQy4y5NB3wB9uknjlcn9eW1uLQLBxy6n7Vd41dW2UnPcb1wU2rzOXT3ix/y7i8nrZngYhHr4pTCqUZJAOj4k9Fe7NMtAgVHfM31sDNk7UlCy7USAaHxpO6q+l9fg==
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com (2603:1096:408::791)
 by KL1PR06MB6210.apcprd06.prod.outlook.com (2603:1096:820:d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 12:36:33 +0000
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80]) by TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80%7]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 12:36:33 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>, Krzysztof Kozlowski
	<krzk@kernel.org>
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
 AQHcQisKZrgNdIKVU0mDlJSyYndfALTQ3zKAgAABb4CAABJSgIAAAs0AgAAIQgCAAAG/gIAAQCJA
Date: Fri, 24 Oct 2025 12:36:33 +0000
Message-ID:
 <TY2PPF5CB9A1BE63500EA8CE65A0DE7A781F2F1A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20251021013548.2375190-1-ryan_chen@aspeedtech.com>
	 <20251021013548.2375190-2-ryan_chen@aspeedtech.com>
	 <20251024-dark-ringtail-of-defiance-1daabd@kuoka>
	 <2939cae6-2e8a-4528-8e27-8c932e2f82de@kernel.org>
	 <bf3d6690b9124ecf74df6c0f9f1c0f72ae1db9f7.camel@codeconstruct.com.au>
	 <8341a903-639b-471a-8425-a98c473f5ab0@kernel.org>
	 <c20e0b8a-ec59-4359-ba5e-1a616fde9894@kernel.org>
 <76a0b578efb62a6e6bd7dafd477fa15b1062a09c.camel@codeconstruct.com.au>
In-Reply-To:
 <76a0b578efb62a6e6bd7dafd477fa15b1062a09c.camel@codeconstruct.com.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PPF5CB9A1BE6:EE_|KL1PR06MB6210:EE_
x-ms-office365-filtering-correlation-id: dd83fc0e-3d99-41d1-cc60-08de12f9f702
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?MkRvdkxoV1ZnOTk0dGlxY2JubmJLRmd2NGV5eW9HY1NJR0ZtdkdNS0JoRlZ1?=
 =?utf-8?B?Y0FwQ2l2UTl3QTdBZXNLQzIvUnA2RE9Qa05kUDMydnlZTUVpOXd4YUpGUWNX?=
 =?utf-8?B?YW1UR2xsZUZxYlJMS2NpazJ5QVRWUStZcHdIYWFVeFhIaFlJNGZmVFdmeTll?=
 =?utf-8?B?L2QvOUtUL1hrZExHamdTK2R4c3ZubW5vVldnOTVHdUswTFRDam5qZUc0OXBu?=
 =?utf-8?B?SkhadVBMcjJRM0VJaHVyK1F3WGYvZ2FJQm0vNWh5LzJ3MnMwclZpb0t2YVJa?=
 =?utf-8?B?dzdiR0tCSThCZHdtWGQyVTNIOE43TmtwR1NzOXM4NUNLd0NOQnNuN2RyRzh4?=
 =?utf-8?B?eFdnSHNLRzhqM3JPTUxJaE5HUUwzemRMQUdnc3Z2MDhQaVRRYWhZWGo3ZXV6?=
 =?utf-8?B?NERmRHpHZzlHclVsdFhveW1RUytydUJpRmd6TkpicXZyZ3ZwYVFNOXJxb1BR?=
 =?utf-8?B?M1ZQZ0JnUzZDMmU3SHp0U1QxWjVkYnlaZXEvc1FVcHc4cThxdVFQTDFld3c0?=
 =?utf-8?B?cldyQVBmaWhMTXBjRnlHYjU3eUdueEpibmxIUjZNdjZSZnFSb1RDM010ZFZV?=
 =?utf-8?B?SE5TbVg5ak1iTmFpcTZDcTYzY0dVc1hrNjR4M3BiWDlkWUU0WDhZWWx1ZTZO?=
 =?utf-8?B?WGdzaTY3WTRydENkUVZPTGF6MDN0Ujkrd2Jzb0x0aENHN0RwK3c0akxjK3lB?=
 =?utf-8?B?ekNqR0ZwWlNLV05TWUc0K1NGdDQ4MWFaa2ZBU3lWS3ZzNFRBSytlYSsweTVU?=
 =?utf-8?B?U2tvS3lzaEhIVFZYRWRqVGNBWTBXK1ZUejFobXljWnlZK01KU1Y4OG9VSmZJ?=
 =?utf-8?B?SVMvdldySkZaSUlpa1UwczFpZy9vLytsSGhJaEYyZU1lV1Zya3JVUUVBbXZJ?=
 =?utf-8?B?QTdBMVZOWVFlcjJGNENkNXJ2SUFDUHBYV0VSMnJ5U0k4aHZRV1J6ZzNQWUs4?=
 =?utf-8?B?SmFyMDdVaWRBd1ljcXZMVWRhYTU5WDF0dFNpOWNVdytQdE92bjhyamVPL0Fl?=
 =?utf-8?B?QTVLcnJSMlRIWUkyUktMQnlGVGxZN01rb3lGOE9DbWpHRjVkL2pReXlYY1Jw?=
 =?utf-8?B?U3NFc1FGMWxLTkhRNGZSbUZSTTk4bGp4U0tPVFhnbDU2eFVoNnk2ekErRWdE?=
 =?utf-8?B?TlBCRlk0UkFZWjRndmZKWGNDUXV0bGRkQUlCT3FGUjlmRE1rUkNkcjJ4b25j?=
 =?utf-8?B?WmZxQVVnTjFwaWZWK29LQXRCYU9tWmg2bnRDR1BiTVJMNWM3ejZKUjhQRzU3?=
 =?utf-8?B?ZisxQ0NIS2VET2R6a3dzbm5mRFlFZHhaY04yMDRsYlJQRGdwbEZvbWRCbzJS?=
 =?utf-8?B?dlVSMS9JQnIyOXQyNVFXbklPUlBMajJPb3loQnZDRlBhSmlpbUJ2cUVOY05j?=
 =?utf-8?B?V0tycWhCWjIrZUVhN0lyQnI5bTdqdTJGOWtHS0lQU0lHZjA1MG1LSXVGNFBi?=
 =?utf-8?B?cXorNU1kenRuVjcxYllRN2hQY0dQQmZqV3JBZ2VpT1B4aFJzTEFTTnRJaGZw?=
 =?utf-8?B?SE9xL1R6bHBRWE9UWWxyNE9BYTB0UUJVWGUvdk1mR2J5ZG1zSDBxY0h5UGVJ?=
 =?utf-8?B?ZGkwOGlXdEgwUG8vRk9xbzI5SndtWGhYMnFudXk4My9JeDBhbVRFSzJXRytJ?=
 =?utf-8?B?QmRkQ0syQis1YVFVQ0hjL3h6SWJYM2pPenkvcHlCK2NWU1I0RXcrTXB2Ukx2?=
 =?utf-8?B?RGJOSGsrZWVnT2M1M3hyby9OQ3kwR0NDOHhLZEpZN0xqd25DS05EMEhwMmU3?=
 =?utf-8?B?aGs2ZmRpQ1hUekJvd3A4ODArYkRWQTZWTmdxNFFCc3V3ajdVN0phQWc1WjJL?=
 =?utf-8?B?MUhWbGdoVHNVVElmeGdXSGhucVpFYy90d2dhTmhkejVKaHpWeVVDZjcxVUFl?=
 =?utf-8?B?RnNvMUs5eXYxdk9RVWtBbERKNXFtUDNPU2tKSjE4STA5UDY0SUVRSWVxMFpN?=
 =?utf-8?B?YU0wYVE2Ny8rdDRSNGphbGZKMGpxcndFckhNZy81d1l2dElFRHZPWk9IeE5W?=
 =?utf-8?B?cFdJZ1daMG1OTlg5NVJocHhRUnV2bDhVSkMxVTBRWUlMWDI2UldmQ2JGQVcv?=
 =?utf-8?Q?1HK6xO?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Vi9BZXpJSlNaNm5sRmxYaWZRaCs5SUNudFRUcEV4clg0Nk1ISGVzSUlsV3lE?=
 =?utf-8?B?OFJkRVJCelpuZUNibVdMeTZFK2JJdjNndVFsV2NqU0FMcVZZQzRLS254Z2JO?=
 =?utf-8?B?M2FQY0ZnNmdGUG5tQlk1Rm82STZCUUVSZFpkNHI3TGt5SkRWYTQwanpwcWxO?=
 =?utf-8?B?Tk5HRVNhVk9nRTZkeVlLckVSallSK0hHVFppSFFpRlBFTGNoYTVLNHdvaXBm?=
 =?utf-8?B?NDVKQ3E1T3ZIVldaenVtcGh5bjYxMC9ZTUxJbHNOTkl4ei9oUDBJTnY4YzVi?=
 =?utf-8?B?M2dCYnBlVjBrbTRGZngxN2hrL1dibUE3OXpjS3B0Um5OMG8wNE4rTHRsY013?=
 =?utf-8?B?SkRBRDliNEZSdkFaUXVDNERMTStZejZEVVp5bm45SmZYdk5XSTJ3cWljSTZX?=
 =?utf-8?B?S2FGWXJzRGN3NkYyY3BON3pHWFk0VVAxSnkrek02NmRmYlFHMlA0VTJQdEJN?=
 =?utf-8?B?VVpmVXJYQVJud200MzlzZzFJY2JBM09qVDZuQWZ0RVhWOEZzQjRKRmp2emZ1?=
 =?utf-8?B?SFpHVU5HSlpTMXI3MEgxNGJ1Y1FPOFhVK3lqZTVJZjRDQXphcjB1Vi82dGpw?=
 =?utf-8?B?eFN4eEt1NnVEb2xNNG5mUkt0aldTbWdxaXJWMlJEQkR6d20reGVNNFZDUXZS?=
 =?utf-8?B?bjkzV2RsZklReDBmTWNPVFVGTVNCN0hLWEJ0NTB0QlcvdnU2bWZtTWxJaC83?=
 =?utf-8?B?a0xaVUREMGtudVZ1ekJ0VGZnMDFTcFJxWFkxc24wdVI0T1lOQ1d6c3ZOWTZs?=
 =?utf-8?B?VjVEMEM2WHM3c3laQi94NFJkdk9pMm54K2JsbGI5RHBVWEpER3docXhnRWNE?=
 =?utf-8?B?Q1B0emVnWVZSVXdmM2lPL0NGQXZsZTlOU3hCNWFIZFU2eVJkSlltU3VORU5l?=
 =?utf-8?B?V0dCa0RWYTZTMFpWZnBIVVc5QmpmRFRVSlY5K0NKS2xWQll2UW5VVjIxZC9x?=
 =?utf-8?B?bTFIL3dkczhTU3BzZnpGUnRDL2JteVlxYmtwOWdhTzZaYS8yZ1I3TjFZajN0?=
 =?utf-8?B?WEJMeDZsU2Z6WmNGaEQ3STdtSXRSalF1VDNRalVKSFR0TEc1aXVtb05MSGhJ?=
 =?utf-8?B?ckhjays0YkJoTnBlaE1pNWFmTlBkYkZtdFh4NmVMK3JaaW53K3Z3Rm9WTkp5?=
 =?utf-8?B?OHFlQ3h0RDA5Wng3RDRnZDU2K3hrcEhDZGFOMGs3N3NiaEQ2SFdGRlUvanFW?=
 =?utf-8?B?TVFzMmRBZ1pKdW5qKzIwTUdqMTBGSUJncEt4eUVLQlJqYkw5bUF1aFk5anRG?=
 =?utf-8?B?UGg4Ni9NM3BjSlRKOEV2eDQ3UXZMMnhlNE9HamhPQ21ScmphY2J4eUo4ZmRM?=
 =?utf-8?B?R2VHaU9Yb3RnQSsrUHRRbW1uZjV4YnV2MHYxN3NMbk5qbEI0NUxTb3k2L0dW?=
 =?utf-8?B?d2NCSitjU0FYVVpZVTJkYTg2UDZlMVJ6ZXUrQy92VUxyS1VueVppS0x3VEVC?=
 =?utf-8?B?L3NtN1prY3hvalkrWWNDM3ZIa1d5NVhpM1R5QU50WnBZR2tQK01hOCtrSXJ5?=
 =?utf-8?B?dHFYU3RQUmN5WVY5elViblVZQkVBYTdBL2lnRjNMcUI1RzJyVHNDOWs2RkhL?=
 =?utf-8?B?WlEveVJ0SnJGYjRDQmZzVmhtQWJWd1dzcmk0TnJCMERQcDZtb2ZzZEFDelY1?=
 =?utf-8?B?NFNvaG04dDFmVTRhM0dSTmI3UC9KQlJLK1ZHVjdMNnpWT1FmcEIvRzY0YldO?=
 =?utf-8?B?NzloU043eS9nZjdJN0pFV0hPTWRwek54c05UUlJzMytDTUwraWpUN1JJYjZ6?=
 =?utf-8?B?MFZFNmM5eGNXekU4S281TFFZRko4dVFXL0VSN1dWYmM1c2V1N2JqTDIwTER3?=
 =?utf-8?B?d1NOUmR0aFNqSGVzSElQVG81TzNoemZkYkJjZHZJZVpJV3pMUzlyMEZMc0Yz?=
 =?utf-8?B?OEFEcE1XUWtJc3hETlFCRTJ0Y3pyY1ZKSzVzSTJTTHI2bTdxMEp3WERNR1ox?=
 =?utf-8?B?NDBrVDNBZ01ZcTJRVENYOFp3YnNzdFQvNUY4NlVlQmpQaWFuR0V5R3dkTndH?=
 =?utf-8?B?WG0xaGlGemwzVXU1S1BpQWtMY1FLVTAyd0hPaHJQbUphb25kblFHYW1td0J3?=
 =?utf-8?B?OWhxTHpuVm5UcFRFa2VQeGt5aE8yOHZSc0dVbHl1SVRzNTBOZCtCUCthV1BQ?=
 =?utf-8?Q?iiVkn8PnkuA0Ym4S2OJd50q89?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dd83fc0e-3d99-41d1-cc60-08de12f9f702
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2025 12:36:33.3119
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tnEFWaupWH5U7qiFLce3Y0i8IzmflH8ft0GolQCa4lrHpygDJZZrozF3MGvvdPDhl7Sij3WAzZSg95OF43dQSR0Kc7qPfSgA9shNsf7+bTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6210
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyMCAxLzRdIGR0LWJpbmRpbmdzOiBpMmM6IFNwbGl0IEFT
VDI2MDAgYmluZGluZyBpbnRvIGEgbmV3DQo+IFlBTUwNCj4gDQo+IEhpIEt5enlzenRvZiwNCj4g
DQo+ID4gPiBOb3QgbXVjaCBkaWZmZXJlbnQgdGhhbiBldmVyeSBvdGhlciBzb2MuIEFsbCBvZiB0
aGVtIGFyZSBzZXBhcmF0ZQ0KPiA+ID4gSVBzLg0KPiA+ID4gTG9vayBhdCBhbnkgU2Ftc3VuZywg
TlhQIG9yIFF1YWxjb21tIGJpbmRpbmcuIFNlcGFyYXRlIElQcy4NCj4gPg0KPiA+DQo+ID4gU28g
bGV0IHRoZSBtb3ZlIGhhcHBlbiwgYnV0IHBsZWFzZSBleHBsYWluIGluIHRoZSBjb21taXQgbXNn
IHRoYXQNCj4gPiBkZXZpY2VzIGFyZSBjb21wbGV0ZWx5IGRpZmZlcmVudCAtIG5vdGhpbmcgaW4g
Y29tbW9uIC0gYW5kIHRodXMgdGhlDQo+ID4gYmluZGluZyB3aWxsIGJlIGRpZmZlcmVudC4gV2Ug
aW5kZWVkIGRvIG5vdCBrZWVwIGNvbXBsZXRlbHkgZGlmZmVyZW50DQo+ID4gZGV2aWNlcyBpbiBv
bmUgYmluZGluZywgYnV0IGJhc2VkIG9uIGNvbW1pdCBtc2cgSSBoYWQgaW1wcmVzc2lvbiB0aGlz
DQo+ID4gd2FzIGp1c3QgbWFqb3IgYmxvY2sgdXBncmFkZS4NCj4gDQo+IE9LLCBtYWtlcyBzZW5z
ZS4NCj4gDQo+IFJ5YW4sIGxldCBtZSBrbm93IGlmIHlvdSBuZWVkIGEgaGFuZCB3aXRoIHRoZSBj
b21taXQgbWVzc2FnZSBjaGFuZ2VzLg0KPg0KVGhhbmtzIEplcmVteSBhbmQgS3J6eXN6dG9mLA0K
DQpJZiBJIG1vZGlmeSB0aGUgY29tbWl0IG1lc3NhZ2UgYXMgZm9sbG93cywgd291bGQgdGhhdCBt
YWtlIGl0IGNsZWFyZXI/DQoNClRoZSBBU1QyNjAwIEkyQyBjb250cm9sbGVyIGludHJvZHVjZXMg
YSBjb21wbGV0ZWx5IG5ldyByZWdpc3RlciBtYXAgYW5kDQpTZXBhcmF0ZSBjb250cm9sL3Rhcmdl
dCByZWdpc3RlciBzZXRzLCB1bmxpa2UgdGhlIG1peGVkIGxheW91dCB1c2VkIGluDQpBU1QyNDAw
L0FTVDI1MDAuIEluIGFkZGl0aW9uLCBhdCBuZXcgQVNUMjYwMCBjb25maWd1cmF0aW9uIHJlZ2lz
dGVycw0KYW5kIHRyYW5zZmVyIG1vZGVzIHJlcXVpcmUgbmV3IERUIHByb3BlcnRpZXMsIHdoaWNo
IGFyZSBpbmNvbXBhdGlibGUNCndpdGggZXhpc3RpbmcgYmluZGluZ3MuIFRoZXJlZm9yZSwgdGhp
cyBwYXRjaCBjcmVhdGVzIGEgZGVkaWNhdGVkIGJpbmRpbmcNCmZpbGUgZm9yIEFTVDI2MDAgdG8g
cHJvcGVybHkgZGVzY3JpYmUgdGhlc2UgbmV3IGhhcmR3YXJlIGNhcGFiaWxpdGllcy4NCg0KDQo+
IENoZWVycywNCj4gDQo+IA0KPiBKZXJlbXkNCg==

