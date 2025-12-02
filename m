Return-Path: <openbmc+bounces-960-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A55D7C9A677
	for <lists+openbmc@lfdr.de>; Tue, 02 Dec 2025 08:16:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dLBs06TW8z3bmQ;
	Tue, 02 Dec 2025 18:16:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c40f::6" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764659780;
	cv=pass; b=GzjamZc6yanSnywiqQGn3spF+SPd5OLTjT7HO23+SsD37Ty/1JZPwnCYJsa5wE2FUX0joasIMdZp+J8gp9yys83W3rfpmpwV12Z20BUL7NmT6f7GlfPtIBODxKkvYZrnvYHidJXD3qnrr/TV7xOr9JXSlDF9gqyyc/S4x2+sLx9fnEYtJpWT3je5SUGd8jlJJRaURoJ+sZ3WA/WFgGDYIDvFF6Q1F/QW0klNz4ZAvATVMr8gobFeICACMPH17TklzVKogXf/ZWNZUkW5FhNPMzTQBBUZaxVSzQk6pHivTLXWiipr/29+VZKLhhbSQ1nz/lr7cVLr84Mvpl1LiAZ3WQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764659780; c=relaxed/relaxed;
	bh=ENTg/cSJr2sW4AGTAUSJR6Nvn2LMBdJeuB0zT+U9n4E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=P9MaDK0BZD47sNOqIb7HSeGJ9mCBovVer7Bw6R3Srl65PXr/MC1nZ1dkc5D7Tdja0doT9588zk5g6s8hGR6hC8oYWPOzI1kUmThh9dZy4eSUcGlL+oKPT2yUI9ZmWfHLGsd7wdYFvL0HQhj2pG4Wm0/cJmLOahttdxEZLhDvs+s/F7416DKLlKJMR4E/vRoiXyJWrLi90qPz9Yb9WFC5S5597jndt/TgNqq1/6TlFrUawJN/Z3tYKsLoxSntWWg22SSTWjAXiNaTRLQrx1IXwBxnPHTb9uEJsrFbLcodYirGLKJkf5RYvWPsj3wZ1xWuOTePa4L+UVwk7IM56TdU2g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=JdQh6SZW; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c40f::6; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=JdQh6SZW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c40f::6; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazlp170130006.outbound.protection.outlook.com [IPv6:2a01:111:f403:c40f::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dLBrz6z1bz3bfR;
	Tue, 02 Dec 2025 18:16:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B7V+6psTTV652RLQChQfJOH+UwYxbe6cEX+XiS+mVqxRKLo/EschymsqHVs1PXFm3QCc+pi/vdqMOtHQBNKcTsJ/5tTQ2xLd/D0e3TFM8w4VLiOYqaykrjG5DmyhizZAM0bZ2eajRR40wgRCWPAWdhu2L74UQih6IsMpPN/ozKbYzJSNnLc2OWwROSyFcmsujb6ui27OIPXRNauaMCy7FFL34eQDYsA6WiQQ0ZCWEps2M3Veyy8DbvKOw0DMmXwk8JfytjYQxUb0H3FhswFYoEie4wqb8nEx2cK86cOwkOmMe8Y1og9j7uFOfrO9TuDFlBswdzTw0EJRhaaQL3WpVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ENTg/cSJr2sW4AGTAUSJR6Nvn2LMBdJeuB0zT+U9n4E=;
 b=Yx5qPQ3Qtxao3UeKLTYVeCnDAMJLxGIDPEE4W7/Ut4eLoYpePlbLVLpTnLf3+x+dwIbLNNsC+wl8ljBh8IzM8NaRr17e0H1MIGJTyfa1B3qozMaNMArZTj5/Ko3i2TtFH8Sl6hx6H5INGEKc4BszwouPVQb6/EJV80DHHHdqxEUifDq9GAcbQkniFoSFpgY5E/7SIVT1DQSyECYSt8aXDn9zMEKmTgVnX+MiM9aJh19Ogw10mYgENx792OLISFs4rd0QkKixjFExa/mN/IMbb1vOxqtiAxLD5pLXyc6IYR/BnuFCRso8nWRZ8vL+k+9uWmYoIAuGJ55c3TSrVJ4crA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENTg/cSJr2sW4AGTAUSJR6Nvn2LMBdJeuB0zT+U9n4E=;
 b=JdQh6SZWPpdqWO63Zpd9PR5FYmS8DVyrAkAV2IBF0IxX2RwMgWp7cFXq3fmclB94l2or7kjjaAHi2a5BqzuP4+QwNshr0wfPBf71hjDy09TJHsKTZFfN7tjiqaZHR1Mp4cOiyEMyXa5TNGJ6Y+tHn47maqjSQ3KRZ3X90IrEHWltxy2LDxbhCFT4P9ol+ZFB4B1bG6fSJ42wrhYq/o//H77Jfk7cB0eYMWm6QGr4IH6kbmhg82TTIggdDvkDdIdyvSGKob/OrjJ/88P2HTpL0GIosrVFM3unQKpGF7SzCLzIG9LoyM8IDygSMnLk+l5jZ6kRNUtKDcFTgvvUOYiIFw==
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com (2603:1096:400:45f::6)
 by SEYPR06MB5962.apcprd06.prod.outlook.com (2603:1096:101:d7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 2 Dec
 2025 07:15:55 +0000
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::b803:eff4:ebd4:9393]) by TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::b803:eff4:ebd4:9393%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 07:15:55 +0000
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: =?utf-8?B?546L5pWP?= <wangmin@phytium.com.cn>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>
CC: Eddie James <eajames@linux.ibm.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Philipp Zabel <p.zabel@pengutronix.de>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?6IiS5aWV5qOL?=
	<shuyiqi@phytium.com.cn>
Subject: RE: RE: [PATCH] media: aspeed: Fix dram hang at res-change
Thread-Topic: RE: [PATCH] media: aspeed: Fix dram hang at res-change
Thread-Index: AQHcXO81fEguB+57mk6MGZIYtmjz2rUH7xgAgAQa0iCAAekGgIAACSYA
Date: Tue, 2 Dec 2025 07:15:55 +0000
Message-ID:
 <TYZPR06MB65685571EFD73A850A452A71F1D8A@TYZPR06MB6568.apcprd06.prod.outlook.com>
References: <20251124-video_dram_reset-v1-1-9d37229e4ec5@aspeedtech.com>
 <120162b9.3256.19aca13d4e0.Coremail.wangmin@phytium.com.cn>
 <TYZPR06MB656876892F6046F22AD87073F1DBA@TYZPR06MB6568.apcprd06.prod.outlook.com>
 <720c855b.36b0.19addc99578.Coremail.wangmin@phytium.com.cn>
In-Reply-To: <720c855b.36b0.19addc99578.Coremail.wangmin@phytium.com.cn>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6568:EE_|SEYPR06MB5962:EE_
x-ms-office365-filtering-correlation-id: 24ebaf37-1991-44dc-aea8-08de3172a245
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?WUk5a0lSQStFSlhKU291YXcybThBQUhXazN1a0ltSnVsakllbnZDNEV1U3Bw?=
 =?utf-8?B?dE9KcVExajBIeCtWUUw0TmgwRm1PWlBEb05UTkhhU1RwTW1wWnJIMTNoYUFr?=
 =?utf-8?B?YzI5ZE5tK2Z5S2pSMEMxWWl1ZHVxVGVNM3RQKyt1eGFqd1d1TS91UHlCYk5J?=
 =?utf-8?B?Q21oS1dDVXRqeTJFUDlNa2ZHT0RpbjIrZ0pQeGtYeXJ6TWJrSi9SSG1SK3Ji?=
 =?utf-8?B?TXFpQ0MrMHVjTnR2dTZMTXBIQTFvR1lRUy9rMU9iMGhuM3hYWkVTU1J6eW14?=
 =?utf-8?B?OHVRaFdQNXF6MnhqczI5U1Q3N2Jqb0p3NGZuaDhSM1YwYS9va3JsSWJKNmhC?=
 =?utf-8?B?RUNoUlZRK1RmUFhaZURTTGlSSDZYTzloQ3JRVGFUZmthM3NhMkE3WUtOcHZV?=
 =?utf-8?B?STRjR0k5TUxlaWp1Z3ZleTZPVXJoL0NzbUtxTVA4QzRMQk83dGV2TGdOOGZ6?=
 =?utf-8?B?eFJ5RE43bTBNaEhkWHU0dlFNaEQ0dGFBcHNZNFkxeldCaVNJNkFRVWhjelF6?=
 =?utf-8?B?SWZRRWNIdExBYW8xRG1MVEsyRitPTFBXYXNKS2NoSHM1UkxmUVRRRzEyU0R4?=
 =?utf-8?B?TmZXcnNTRThRdmFVTjZDTHpFNW0xZWpGaXFZMkFSZldYZEpsMUREaUs4ZDhx?=
 =?utf-8?B?bEFBMWN3bzRaN1R1bVlYTmtTOXN5QUlnd0pKSVUzei9VKzVjczRHeWc0OXFL?=
 =?utf-8?B?cmdKL0lKWWMrME04OWJnSEpJYi96VFcyQW16QThJNzh5S2JVQzRsdTlrS0hL?=
 =?utf-8?B?VGhyRHZDY0NjQW5oS2dzQmJpVGhFNGgwcjlXdHUxZFdheVZaOVVRMEZpay9G?=
 =?utf-8?B?N3VranVUNU4xd2FqK3lqdmJzcG1lb09Uelo4NE9NaHdvL09qMmVSRWE0UjNJ?=
 =?utf-8?B?TlJDdEFSdnE5UXIxQjZwZWdFeGpuQmV4U2ZaUlNoTFd1MDRqRnNXVmpmQXFV?=
 =?utf-8?B?ck9CTnJwN2hxZ2lPWnd3d2VrZlFPQ21nL1dZSnFSZjhCNUYycGVpR2oxNnNx?=
 =?utf-8?B?ejR0OGFrNUs5TjNPVFp6UklULzNjdTBCUzBibU1idTZQVmVGaGtDSXRuUTc5?=
 =?utf-8?B?eGYvWHZScmVWTVdDbWNPcVFiM1dBWDRFaGdrS0VGVTMzTkVGa2cyOVBaWFAv?=
 =?utf-8?B?RHV0NmQ2YURoTHRXQUQ1UTk2N3ZSNmRRN2k0cWhPZUxGUlczWVBmQTA4empp?=
 =?utf-8?B?Z2NjeTM3ZmFwdzM4ZGdLRnNqbFpSVGRqMzNiWXdXR2xTSmlIdTIzYVlhdWtZ?=
 =?utf-8?B?c3ZKbVZVY1NVZ1prcUJ3eTZjMmFJaUFWcW12N2NVb05TOGVHUTBqSkErZUFC?=
 =?utf-8?B?Q3UxcWFNTXVkd3FSK0UxYWEzczVwSHhXMlYrSlBoK1BOemVoMTJxQWFJeUFa?=
 =?utf-8?B?QUxCVVlJRnR0WnpBWGhuTDQ0YTdtUXI3UEZkL0ZqelVpckNYejhmc2tpbkc4?=
 =?utf-8?B?TmN1c1NJRHd4dHhMRGgreHRkTUJLYzNKQzdSQWQ2TWRKUkJuRjg3b2lpL3NJ?=
 =?utf-8?B?SzIvbzBtSzdKa2lvcFQwa2RZdlV1YmYrdG9xWEhrODV2SHJVYlNkdjh3WVQz?=
 =?utf-8?B?dCtaL0NVYWZRczhjVWJIc3NuckNTSjdnenpOa0JBUUg1UHdod0Y4a1NwRzZC?=
 =?utf-8?B?SDhXWnlVMVphTm90TkRCcVgzUHNzbWhZdDg4eDdjNHVDZHNuTUZKdElWSWJu?=
 =?utf-8?B?TndMM2lrUE1sK3l5NFNJMytmRzYxTElTUDFJeWtnaXRKYkZ5VXNZVVgxVUF0?=
 =?utf-8?B?Rk1uajZKQUxYOG4rQW1LdHVIaVVoWmZTN0JWZ3ZoU3FTYmhwT0pjRGlWVTlq?=
 =?utf-8?B?VkFiWVI0Z053YTZOU0wyaWpuZDgrc1NLSXBBSC90ZEJoVnYzYUZLNGphVzhV?=
 =?utf-8?B?KzNBMFFtbjhBRnNWaHUxQloyWTBGMHRqcHY1cWQ5U21BajZuOFJDWW85bDk3?=
 =?utf-8?B?RWV4bkVMQVZacHRERSt6OHN0SDlLSDB5ZFVDTnhNeVczbG10WXJSSFJhWXhY?=
 =?utf-8?B?TzBHUmR5TjBaVGF1YlJ4TGxNTWJsYjZ6RmlYR0p3SW05RjlLM0tiMTNuRWc1?=
 =?utf-8?Q?IqKh2l?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6568.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d25qTm5ZU0twbHlxK0pFTkJLNDJaYkNYa0pOSGxBa3VuRUxSV1JFZDZsK1NW?=
 =?utf-8?B?a2JJdkUxbzBQZnNKVkM2bzVaKzVEZkM4TjZyNkRtOXBjV2FIazRZTUpoVER6?=
 =?utf-8?B?eWpwWWhTUFhzcGc5VDExOCtXdFNZY0ZkLzMvZ05ORi83cE5jZnBlei9kaGNL?=
 =?utf-8?B?cVVGWWJyc3gxMWRqNy94dWxKQUdJS3BYN1c5eGo2OXlIQnhSVWZndit2eGdZ?=
 =?utf-8?B?L2V1NjFHQXRuT1N4NFRMWkR1Qk5lQ2EzK0xFcEdiT2xnZmZ6OWkzdHpFTDJS?=
 =?utf-8?B?Vmdpb01VU3VUS2R5dTZZZmtMZ0luQlN4ZXptclc2WlVRdDRJM1lycVRYWDRk?=
 =?utf-8?B?L3h6eE1scndTM0ZFQy9OeWtjcFBja2hqV0poSUZGemd4L3lHaVF3OXlyTm13?=
 =?utf-8?B?cjR2RVFSZEJlWWhacFBSNmVhRVRJSk1vNlRxRUw5VnU0VVZzNENlOGpGZThE?=
 =?utf-8?B?czZoOGFXYnN1UVZUUzVVUXFKaFhaK3EzaFlRZ3ZsWHpralNFV1dlUVBoYUZp?=
 =?utf-8?B?V3dLUzdFOE5RWWx6V09lNlZWWitkZnA3R2RFNWtHRVczYk42MFVnbU5RZis3?=
 =?utf-8?B?R013UHFDUHhtY2t5cG5SQkMzZ0tEcHh5UUlGelNId09hV3NmWU9pWExRR054?=
 =?utf-8?B?bEdyNm55S3FLTGx3ZGhMZUhwblB6aTJGcysyMEJxaHV1MjJJbmw0NDVTZ1c5?=
 =?utf-8?B?b3NSUk1PQWE2RTdIV2o1YkZRMy9nVEtra20rM1BVRTkrR05CYkw0VHZLcE9P?=
 =?utf-8?B?QXdQMUNjR1RVOEd2YmZYL29XVndjSTNSTDhmV0ZPTFFJYkdGQ2RvdFM5eThW?=
 =?utf-8?B?MmtsakkwU2VkY01wd0U5NkRnRDRLQk5QQUcxQXpUMEI2M3pPSUpRZG51aDhw?=
 =?utf-8?B?SFdiU3ExOVJ5RFdvanJqaDVXWUthem0rSUlmYmREb2pRNmg1eG84cCsyVFFE?=
 =?utf-8?B?b3VSek1iNWh2cUJuNUJGK2FtbUQ3c0F1bGw3NFVGdUFlZThpMlgwb2VVQnYx?=
 =?utf-8?B?Umx2K1VLdE1EVXJtOWw3ODJKWVh4dHBxa0dKNjZ2Q1k4aWs4N0FHa1ZMTW50?=
 =?utf-8?B?cVFpYTB5bGhrZUNpR0h4Qm9BTnp2anIvbW5YYVlqV0Ixb0VzQ3BYNXpheGpS?=
 =?utf-8?B?b3JRM2ZwNFpLb3RBazdYMHFWQUFzVXZ4SU5IRTZxVDJBMjZHeHhWVU5MZlds?=
 =?utf-8?B?bXVpTGxobERIWlNtTWlPUWNQdVZYLzVCcTFsTktqQ3JqNnpqVEpJYmxaUGZZ?=
 =?utf-8?B?YVh3VDYwRml0dHZLVnRlbnNPWWhkOUpBdWt4M1R6dTJNcnNRbGdQaDdoNTJR?=
 =?utf-8?B?dVk2MTFtcmF5cVBJUmQxTEg1SmxIK2ZnY2lodkR3SjgxWnpGY0YyRDFUWVJs?=
 =?utf-8?B?L3ZRN240VG9SYXAxK2ZYYVdHNTBZM2xLOHRLeDYvWnJhaTR1OHcyczF2bU9O?=
 =?utf-8?B?T1QyQVJlR0NWL0hvVFRGOGNkMlhaeUd2Vjh3SS9RQW12LzRxc0o2emZwdS8w?=
 =?utf-8?B?U2x3ZExETThRTGhabkROZ1R2V0ViMDBua21MSGtGdm1lS21rSEtWMzR3Qnph?=
 =?utf-8?B?MHpVcWNKTnl0YStRalF3U29zNTM2cWE5dzVxNlAwNGVvQUI1WjJmK0NqUTh0?=
 =?utf-8?B?UW9CdmtHd1MreHpNYUFyRnZ4TE1DWlg3ME1xM1l2VTBldlZVdXJRVER6S291?=
 =?utf-8?B?S3pIQktuTGpPV1lvb3RFS3VQYjZFclRhUVhTT2VLdERSTk9ETzl3dThXQkFq?=
 =?utf-8?B?ZXJlbk1oc1UzVnczVStvUy9kaXAwaE53cHdyVVliZ3BUcE9sTTNMYndncHJ6?=
 =?utf-8?B?eXBrZzlKckFRRTBWQmZiTnR2cHVZdzJEbkxFbVo3MUh0ZnZEN2VOS01XMFpR?=
 =?utf-8?B?eHZHMUpxUjh2eFAzYUp1d3lIOVlSVXZkYVllTlNVdjFNZVJGdkwzOXBpeFp1?=
 =?utf-8?B?V3pVVWZ2N2JJM0lJUlJONTRCaVZldmpjbVlFb0Q0QjFTejlSbGlPTEpubU93?=
 =?utf-8?B?WWRZdm5mYlpYNVVqTVhpc0wvbDF0bU91WW5FV05WOG5rVzV5bGdIOG9rOTdw?=
 =?utf-8?B?KzBvVFJsQ0JTZE15eis2YlNNZGlkaWxEUEoyS1Y1NnZ2ejFQY3FKMUVNWDhJ?=
 =?utf-8?B?TlM0UFZPaGVBNENKZm1nbTRHeVlpR01oZGE3dXBoWWtsTDJlY3BOcmVzZU45?=
 =?utf-8?B?cHc9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6568.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ebaf37-1991-44dc-aea8-08de3172a245
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 07:15:55.1102
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zYwDeRJtPgc+JDnI/ygDiY7RN9Rka7jBmoy6KRtzJB2rRu+zvkm6WqLV4FZsxZ+nVPkbktPG5hQrPtkDkNcViq/Ew3QlGbqDnjWBkoWTm7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5962
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

SGkgV2FuZywNCg0KVGhpcyBtYWlsIHRocmVhZCBpcyBub3QgZm9yIHByb2R1Y3Qgc3VwcG9ydCBi
dXQgZm9yIGxpbnV4IGtlcm5lbCB1cHN0cmVhbS4NCg0KSWYgeW91IGVuY291bnRlciBzb21lIGlz
c3VlIHVzaW5nIEFTUEVFRCBwcm9kdWN0LCBwbGVhc2UgY29udGFjdCBvdXIgc2FsZXMgd2hvDQp3
aWxsIHByb3ZpZGUgcHJvcGVyIHJlc3BvbnNlIGZvciB5b3VyIGlzc3VlLg0KDQoNCj4gPg0KPiA+
IEhpIFdhbmcsDQo+ID4NCj4gPiBUaGFua3MgZm9yIHlvdXIgZmVlZGJhY2suDQo+ID4NCj4gPiBS
ZWdhcmRzLA0KPiA+IEphbW15IEh1YW5nDQo+ID4NCj4gPiA+ID4NCj4gPiA+ID4gRHJhbSBoYW5n
IGNvdWxkIGhhcHBlbiBpbiB0aGUgc3RlcHMgYmVsb3c6DQo+ID4gPiA+IDEuIHN0YXJ0IGNhcHR1
cmUvY29tcHJlc3Npb24NCj4gPiA+ID4gMi4gb3V0LW9mLWxvY2sgd2F0Y2hkb2cgcmFpc2UgaXJx
IGJlY2F1c2Ugb2YgcmVzLWNoYW5nZS4NCj4gPiA+ID4gMy4gYXNwZWVkX3ZpZGVvX2lycV9yZXNf
Y2hhbmdlIGRvIGNsay1vZmYNCj4gPiA+ID4NCj4gPiA+ID4gQXQgc3RlcDMsIGNhcHR1cmUvY29t
cHJlc3Npb24gY291bGQgYmUgbm90IGFjY29tcGxpc2hlZCB5ZXQuIElmDQo+ID4gPiA+IGNsay1v
ZmYgaW4gdGhlIG1pZGRsZSBvZiB2aWRlbyBvcGVyYXRpb24sIGRyYW0gY29udHJvbGxlciBjb3Vs
ZA0KPiA+ID4gPiBoYW5nIGF0DQo+ID4gPiBhc3QyNTAwLg0KPiA+ID4gPg0KPiA+ID4gPiBVc2Ug
cmVzZXQgcmF0aGVyIHRoYW4gY2xrLW9mZi9vbiB0byBhdm9pZCB0aGlzIHByb2JsZW0uDQo+ID4g
PiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEphbW15IEh1YW5nIDxqYW1teV9odWFuZ0Bhc3Bl
ZWR0ZWNoLmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+IE9uIEFzcGVlZCBLVk0gdGVzdGluZywg
d2UgZm91bmQgaXQgY291bGQgbGVhZCB0byBkcmFtLWhhbmcgaWYNCj4gPiA+ID4gcmVzLWNoYW5n
ZS4gQWx0aG91Z2ggdGhlIGlzc3VlIHJhcmVseSBoYXBwZW5zLCB0aGUgaW1wYWN0IGlzIHNlcmlv
dXMuDQo+ID4gPg0KPiA+ID4gQ2FwdHVyaW5nIGFuZCBjb21wcmVzc2luZyB0aGUgdmlkZW8gc3Ry
ZWFtIHRha2VzIGxvbmdlciB0aGFuIHRoZQ0KPiA+ID4gdmlkZW8gZW5naW5l4oCZcyBpZGxlIHBl
cmlvZC4NCj4gPiBTb3JyeSwgYnV0IHRoaXMgaXMgbm90IHdoYXQgSSBtZWFuLiBUaGUgaXNzdWUg
aGFwcGVucyBiZWNhdXNlIHZpZGVvDQo+ID4gZW5naW5lJ3MgY2xrIGlzIHR1cm5lZCBvZmYgZHVy
aW5nIGNhcHR1cmUvY29tcHJlc3Npb24uDQo+ID4NCj4gPiA+IElmIHRoaXMgaXMgbm90IHRoZSBp
bnRlbmRlZCBiZWhhdmlvciwgcGxlYXNlIGluY3JlYXNlIHRoZSBmcmFtZQ0KPiA+ID4gcmF0ZS4g
VGhpcyBtYWtlcyByZXNvbHV0aW9uIHN3aXRjaGVzIG1vcmUgcHJvbmUgdG8gaGFwcGVuIHdoZW4g
dGhlIHZpZGVvDQo+IGVuZ2luZSBpcyB3b3JraW5nLg0KPiA+ID4gSG93ZXZlciwgYWNjb3JkaW5n
IHRvIHlvdXIgZW1haWwsIHRoaXMgaXNzdWUgcmFyZWx5IG9jY3Vycy4gSXMgdGhlcmUNCj4gPiA+
IGEgc2ltaWxhciBpc3N1ZSBvbiB0aGUgQVNUMjYwMCBTb0M/DQo+ID4gSW5jcmVhc2UgZnJhbWUg
cmF0ZSB3b3VsZCBub3QgaGVscGZ1bC4gVGhpcyBpcyBhIHZpZGVvIGNvbXByZXNzaW9uDQo+ID4g
ZW5naW5lLiBUaGUgdGltZSB0YWtlbiBmb3IgZWFjaCBmcmFtZSdzIGNhcHR1cmUvY29tcHJlc3Np
b24gaXMgdGhlDQo+ID4gc2FtZS4gVGhlIHdheSB0byByZXByb2R1Y2UgdGhpcyBpc3N1ZSB3ZSBk
aWQgaXMgY29udGludW91c2x5DQo+IHJlc29sdXRpb24tc3dpdGNoLg0KPiA+DQo+IFRoYW5rIHlv
dSBmb3IgdGhlIGNsYXJpZmljYXRpb24uDQo+IA0KPiBJIGFtIGVuY291bnRlcmluZyBhbm90aGVy
IGlzc3VlIHJlbGF0ZWQgdG8gcmVzb2x1dGlvbiBzd2l0Y2hpbmcgb24gdGhlDQo+IEFTVDI1MDAg
U29DLg0KPiBXaGVuIHJlcGVhdGVkbHkgc3dpdGNoaW5nIGZyb20gb3RoZXIgcmVzb2x1dGlvbnMg
dG8gMTY4MHgxMDUwLCBvciBmcm9tDQo+IDE2ODB4MTA1MCB0byBvdGhlciByZXNvbHV0aW9ucywg
dGhlcmUgaXMgYSBoaWdoIGxpa2VsaWhvb2QgdGhhdCBlaXRoZXIgdGhlIEJNQw0KPiBPUyB3aWxs
IGhhbmcgb3IgdGhlIEtWTSBzY3JlZW4gd2lsbCBleHBlcmllbmNlIHRlYXJpbmcuIENvdWxkIHlv
dSBwbGVhc2UNCj4gYXR0ZW1wdCB0byByZXByb2R1Y2UgdGhpcyBpc3N1ZSBhbmQgcHJvdmlkZSBh
IHJlc29sdXRpb24/DQo+IA0KPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gVG8gYXZvaWQgdGhpcyBp
c3N1ZSwgd2UgdXNlIHJlc2V0IG9ubHkgcmF0aGFyIHRoYW4gY2xrLW9mZi9vbiBpbg0KPiA+ID4g
PiByZXMtY2hhbmdlIHRvIGF2b2lkIHRoaXMgaXNzdWUuDQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAg
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hc3BlZWQvYXNwZWVkLXZpZGVvLmMgfCAyMg0KPiA+ID4g
PiArKysrKysrKysrKysrKysrKysrLS0tDQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gPiA+ID4NCj4gPiA+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYXNwZWVkL2FzcGVlZC12aWRlby5jDQo+ID4gPiA+IGIv
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hc3BlZWQvYXNwZWVkLXZpZGVvLmMNCj4gPiA+ID4gaW5k
ZXggYjgzZTQzMjQ1Mi4uNDFjYjk2ZjYwMSAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9hc3BlZWQvYXNwZWVkLXZpZGVvLmMNCj4gPiA+ID4gKysrIGIvZHJpdmVy
cy9tZWRpYS9wbGF0Zm9ybS9hc3BlZWQvYXNwZWVkLXZpZGVvLmMNCj4gPiA+ID4gQEAgLTI2LDYg
KzI2LDcgQEANCj4gPiA+ID4gICNpbmNsdWRlIDxsaW51eC93b3JrcXVldWUuaD4NCj4gPiA+ID4g
ICNpbmNsdWRlIDxsaW51eC9kZWJ1Z2ZzLmg+DQo+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgva3Rp
bWUuaD4NCj4gPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9yZXNldC5oPg0KPiA+ID4gPiAgI2luY2x1
ZGUgPGxpbnV4L3JlZ21hcC5oPg0KPiA+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L21mZC9zeXNjb24u
aD4NCj4gPiA+ID4gICNpbmNsdWRlIDxtZWRpYS92NGwyLWN0cmxzLmg+DQo+ID4gPiA+IEBAIC0z
MTAsNiArMzExLDcgQEAgc3RydWN0IGFzcGVlZF92aWRlbyB7DQo+ID4gPiA+ICAJdm9pZCBfX2lv
bWVtICpiYXNlOw0KPiA+ID4gPiAgCXN0cnVjdCBjbGsgKmVjbGs7DQo+ID4gPiA+ICAJc3RydWN0
IGNsayAqdmNsazsNCj4gPiA+ID4gKwlzdHJ1Y3QgcmVzZXRfY29udHJvbCAqcmVzZXQ7DQo+ID4g
PiA+DQo+ID4gPiA+ICAJc3RydWN0IGRldmljZSAqZGV2Ow0KPiA+ID4gPiAgCXN0cnVjdCB2NGwy
X2N0cmxfaGFuZGxlciBjdHJsX2hhbmRsZXI7IEBAIC03MjAsNiArNzIyLDEzIEBADQo+ID4gPiA+
IHN0YXRpYyB2b2lkIGFzcGVlZF92aWRlb19vbihzdHJ1Y3QgYXNwZWVkX3ZpZGVvICp2aWRlbykN
Cj4gPiA+ID4gIAlzZXRfYml0KFZJREVPX0NMT0NLU19PTiwgJnZpZGVvLT5mbGFncyk7ICB9DQo+
ID4gPiA+DQo+ID4gPiA+ICtzdGF0aWMgdm9pZCBhc3BlZWRfdmlkZW9fcmVzZXQoc3RydWN0IGFz
cGVlZF92aWRlbyAqdikgew0KPiA+ID4gPiArCXJlc2V0X2NvbnRyb2xfYXNzZXJ0KHYtPnJlc2V0
KTsNCj4gPiA+ID4gKwl1c2xlZXBfcmFuZ2UoMTAwLCAxNTApOw0KPiA+ID4gPiArCXJlc2V0X2Nv
bnRyb2xfZGVhc3NlcnQodi0+cmVzZXQpOyB9DQo+ID4gPiA+ICsNCj4gPiA+ID4gIHN0YXRpYyB2
b2lkIGFzcGVlZF92aWRlb19idWZzX2RvbmUoc3RydWN0IGFzcGVlZF92aWRlbyAqdmlkZW8sDQo+
ID4gPiA+ICAJCQkJICAgZW51bSB2YjJfYnVmZmVyX3N0YXRlIHN0YXRlKSAgeyBAQCAtNzQyLDcN
Cj4gKzc1MSw5IEBAIHN0YXRpYw0KPiA+ID4gPiB2b2lkIGFzcGVlZF92aWRlb19pcnFfcmVzX2No
YW5nZShzdHJ1Y3QNCj4gPiA+ID4gYXNwZWVkX3ZpZGVvICp2aWRlbywgdWxvbmcgZGVsYXkpDQo+
ID4gPiA+DQo+ID4gPiA+ICAJdmlkZW8tPnY0bDJfaW5wdXRfc3RhdHVzID0gVjRMMl9JTl9TVF9O
T19TSUdOQUw7DQo+ID4gPiA+DQo+ID4gPiA+IC0JYXNwZWVkX3ZpZGVvX29mZih2aWRlbyk7DQo+
ID4gPiA+ICsJYXNwZWVkX3ZpZGVvX3dyaXRlKHZpZGVvLCBWRV9JTlRFUlJVUFRfQ1RSTCwgMCk7
DQo+ID4gPiA+ICsJYXNwZWVkX3ZpZGVvX3dyaXRlKHZpZGVvLCBWRV9JTlRFUlJVUFRfU1RBVFVT
LCAweGZmZmZmZmZmKTsNCj4gPiA+ID4gKwlhc3BlZWRfdmlkZW9fcmVzZXQodmlkZW8pOw0KPiA+
ID4gPiAgCWFzcGVlZF92aWRlb19idWZzX2RvbmUodmlkZW8sIFZCMl9CVUZfU1RBVEVfRVJST1Ip
Ow0KPiA+ID4gPg0KPiA+ID4gPiAgCXNjaGVkdWxlX2RlbGF5ZWRfd29yaygmdmlkZW8tPnJlc193
b3JrLCBkZWxheSk7IEBAIC0xOTg0LDgNCj4gPiA+ID4gKzE5OTUsNyBAQCBzdGF0aWMgdm9pZCBh
c3BlZWRfdmlkZW9fc3RvcF9zdHJlYW1pbmcoc3RydWN0IHZiMl9xdWV1ZQ0KPiAqcSkNCj4gPiA+
ID4gIAkJICogTmVlZCB0byBmb3JjZSBzdG9wIGFueSBETUEgYW5kIHRyeSBhbmQgZ2V0IEhXIGlu
dG8gYSBnb29kDQo+ID4gPiA+ICAJCSAqIHN0YXRlIGZvciBmdXR1cmUgY2FsbHMgdG8gc3RhcnQg
c3RyZWFtaW5nIGFnYWluLg0KPiA+ID4gPiAgCQkgKi8NCj4gPiA+ID4gLQkJYXNwZWVkX3ZpZGVv
X29mZih2aWRlbyk7DQo+ID4gPiA+IC0JCWFzcGVlZF92aWRlb19vbih2aWRlbyk7DQo+ID4gPiA+
ICsJCWFzcGVlZF92aWRlb19yZXNldCh2aWRlbyk7DQo+ID4gPiA+DQo+ID4gPiA+ICAJCWFzcGVl
ZF92aWRlb19pbml0X3JlZ3ModmlkZW8pOw0KPiA+ID4gPg0KPiA+ID4gPiBAQCAtMjIzMCw2ICsy
MjQwLDEyIEBAIHN0YXRpYyBpbnQgYXNwZWVkX3ZpZGVvX2luaXQoc3RydWN0DQo+ID4gPiA+IGFz
cGVlZF92aWRlbw0KPiA+ID4gKnZpZGVvKQ0KPiA+ID4gPiAgCX0NCj4gPiA+ID4gIAlkZXZfaW5m
byh2aWRlby0+ZGV2LCAiaXJxICVkXG4iLCBpcnEpOw0KPiA+ID4gPg0KPiA+ID4gPiArCXZpZGVv
LT5yZXNldCA9IGRldm1fcmVzZXRfY29udHJvbF9nZXQoZGV2LCBOVUxMKTsNCj4gPiA+ID4gKwlp
ZiAoSVNfRVJSKHZpZGVvLT5yZXNldCkpIHsNCj4gPiA+ID4gKwkJZGV2X2VycihkZXYsICJVbmFi
bGUgdG8gZ2V0IHJlc2V0XG4iKTsNCj4gPiA+ID4gKwkJcmV0dXJuIFBUUl9FUlIodmlkZW8tPnJl
c2V0KTsNCj4gPiA+ID4gKwl9DQo+ID4gPiA+ICsNCj4gPiA+ID4gIAl2aWRlby0+ZWNsayA9IGRl
dm1fY2xrX2dldChkZXYsICJlY2xrIik7DQo+ID4gPiA+ICAJaWYgKElTX0VSUih2aWRlby0+ZWNs
aykpIHsNCj4gPiA+ID4gIAkJZGV2X2VycihkZXYsICJVbmFibGUgdG8gZ2V0IEVDTEtcbiIpOw0K
PiA+ID4gPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gYmFzZS1jb21taXQ6IGFjM2ZkMDFlNGMxZWZj
ZThmMmMwNTRjZGViMmRkZDJmYzBmYjE1MGQNCj4gPiA+ID4gY2hhbmdlLWlkOiAyMDI1MTEyNC12
aWRlb19kcmFtX3Jlc2V0LWM1MzFmNmJhNTczZg0KPiA+ID4gPg0KPiA+ID4gPiBCZXN0IHJlZ2Fy
ZHMsDQo+ID4gPiA+IC0tDQo+ID4gPiA+IEphbW15IEh1YW5nIDxqYW1teV9odWFuZ0Bhc3BlZWR0
ZWNoLmNvbT4NCj4gPiA+ID4NCj4gPiA+DQo+IA0KPiANCj4g5L+h5oGv5a6J5YWo5aOw5piO77ya
5pys6YKu5Lu25YyF5ZCr5L+h5oGv5b2S5Y+R5Lu25Lq65omA5Zyo57uE57uH5omA5pyJLOWPkeS7
tuS6uuaJgOWcqOe7hOe7h+WvuQ0KPiDor6Xpgq7ku7bmi6XmnInmiYDmnInmnYPliKnjgILor7fm
jqXmlLbogIXms6jmhI/kv53lr4Ys5pyq57uP5Y+R5Lu25Lq65Lmm6Z2i6K645Y+vLOS4jeW+l+WQ
keS7u+S9lQ0KPiDnrKzkuInmlrnnu4Tnu4flkozkuKrkurrpgI/pnLLmnKzpgq7ku7bmiYDlkKvk
v6Hmga/jgIINCj4gSW5mb3JtYXRpb24gU2VjdXJpdHkgTm90aWNlOiBUaGUgaW5mb3JtYXRpb24g
Y29udGFpbmVkIGluIHRoaXMgbWFpbCBpcyBzb2xlbHkNCj4gcHJvcGVydHkgb2YgdGhlIHNlbmRl
cidzIG9yZ2FuaXphdGlvbi5UaGlzIG1haWwgY29tbXVuaWNhdGlvbiBpcw0KPiBjb25maWRlbnRp
YWwuUmVjaXBpZW50cyBuYW1lZCBhYm92ZSBhcmUgb2JsaWdhdGVkIHRvIG1haW50YWluIHNlY3Jl
Y3kgYW5kIGFyZQ0KPiBub3QgcGVybWl0dGVkIHRvIGRpc2Nsb3NlIHRoZSBjb250ZW50cyBvZiB0
aGlzIGNvbW11bmljYXRpb24gdG8gb3RoZXJzLg0K

