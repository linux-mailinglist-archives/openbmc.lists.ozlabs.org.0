Return-Path: <openbmc+bounces-1058-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C6ACD4B3D
	for <lists+openbmc@lfdr.de>; Mon, 22 Dec 2025 05:56:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dZQpZ1d55z2xnl;
	Mon, 22 Dec 2025 15:56:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.103.43.77 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766310757;
	cv=pass; b=kpdGssbhPyzSGVYGrgwqiytRoPQUlev79VAXqn+ZAg/6ey+UNKMmR3NVXP29kWdutKh2NnVEjBAACV4iPIGtsuYmEMl7M8TECR8RO1VJHXm3wpMj4IqzKosBVWpX4rikIrqJKZ8y6NjfGW8JnNp5KuF7VXZgpTJNpN6QSC5ETidUEGSFQRKJDZG3ascXodp+GWjnfWdJYfPOkYKpI6I9NCQaiNj/0eZ8Cl/N10w1pz+uZjwV7gWt/1/6Oys+KuA1w1Mu3srwItbVf9FlY+k8JrOH8c1NavrxSOofHVzyuZLzW73mCwlJ3JqEgUfdL+hZOEq+aRlMKamzgwR6nd8fVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766310757; c=relaxed/relaxed;
	bh=+CfI2GjSmKSNifHw5S7n8N+MO/d20OO4KtQFBTAIspU=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=aIfAb7qvPmaFBDuRXcDfbolU7A2mIsVw7MoHCcD7sBK/vCb/eWGnLIc+aN1tiCk8+9eti2T67RUCU/yIQ3w4W0vAQuafE8MmYBtgD2JkaZ6HrsQSWrVQyERbMCvGXeMct8S5PdMMUFO51hzpw4oi0lcbaMfoMknEltcPvvroaVU4v7wsYuEe1xDfm4ok3J5NhOYCCUPKO845iS4RjbPygE5DJKeR8O+ucCWu8Y7XLuxpls49Jr8lUUvZcAcFhK16nSJQ6vOoO6q0yrMHafZw5m5XR1D5T8wLXTqxQjvrseFs2BQci+zuYp+XOLaQrf6oP/IandjJjLoTHvcsAXxE3g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=outlook.com; dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=j0ijjkD1; dkim-atps=neutral; spf=pass (client-ip=52.103.43.77; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=qdwby2008@outlook.com; receiver=lists.ozlabs.org) smtp.mailfrom=outlook.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=j0ijjkD1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=outlook.com (client-ip=52.103.43.77; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=qdwby2008@outlook.com; receiver=lists.ozlabs.org)
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazolkn19013077.outbound.protection.outlook.com [52.103.43.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dYxQX0FCXz2xQB
	for <openbmc@lists.ozlabs.org>; Sun, 21 Dec 2025 20:52:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GcKdKMprbfU1g7M5YWppuK7fkzYFExCmDS+CnVZGP3F5t5D94pjO7B5wem0kWgS/+5SzhVjWB9BwhBz1F+WwRTN+p6nV5tcuAnpoRfn7hpchVqF0I9wWuBjk3Sm/COJKxF+Br074S1izJvbhwjMvVklFxBO5BAULh05g7bH8Zfntltf6hJilRAYOJ+IMaR/jPNlAxOzsGZujrA2DfTAWqjbgInH08iGyl4Y4s1Ll+pkfMMWuLt2EgEiSjvI82lLyeftOS8qAdHayRixlD5+G+vlxktvS20/VwC7DfNB+SVn/ljCCgEwSG9PLJjnv9Z948883OKK7JVrCrG3kqXM5KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+CfI2GjSmKSNifHw5S7n8N+MO/d20OO4KtQFBTAIspU=;
 b=veeup1uKFHZ7aetyPw6vMLrmcb+7gAqdpsTdPU4GKRqUkSaUzGj7uQjt2I7wIJCEISu8LmTHiAIQdYfdlWN+ferPjdrHan3/g1c3DNPeDH6W/gU/D2ByFKXo1nJqIczayXd2oSrfis6RSKGWvtnoxTE0R2hrmWj/DYJJldPuWDKftvoq/H+kgU/SGY7r6Q/AgrlODPlGF1uZt5bcKurwRN8M9A5WuvIWEwMB18GrbQH77kd87th8tCgA9Ldw/6nGLWE2StEWKKBAK1xsdb5Ybgn0ntwTWZL7Yx6A2TOoWfUfLajU/vwx1/22s9PWO1kAY2IhEDmmLI0M1YBFg7KtdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+CfI2GjSmKSNifHw5S7n8N+MO/d20OO4KtQFBTAIspU=;
 b=j0ijjkD1wHihlumx1DvwuQyO7n1ivOFSHeoVi0VSt20u6arhA6SjTMr3VNkHKB5kvPG6BJpvYWzzXhW/NJhj3+njYR7Dza1iY1CU64NQIFe+WVJNjzafJYy24SRG7UDYybudHrbTf0CKNZz3cO+1Q1wrmJWD6+44u/NWJsg2BtKF17mj7ciwNR/G/SCg6YGfzQ1TlCXk6p6MX6jK7va/GVoga8a3nUc/hhE3QNdvs2YHd2ihG3M+tc767SmpR8RRtYZzbJKusQwTnm4F1uHEeCqIh9gpyAUoIha7fjEwUTUZnDsAfV56cqbP8cRjaM/ir+Hwtb3KhEQOpuucfBaCcw==
Received: from TYZPR04MB7269.apcprd04.prod.outlook.com (2603:1096:400:45a::8)
 by SEZPR04MB6274.apcprd04.prod.outlook.com (2603:1096:101:a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.10; Sun, 21 Dec
 2025 09:51:53 +0000
Received: from TYZPR04MB7269.apcprd04.prod.outlook.com
 ([fe80::317c:5eb1:cf4e:bc19]) by TYZPR04MB7269.apcprd04.prod.outlook.com
 ([fe80::317c:5eb1:cf4e:bc19%5]) with mapi id 15.20.9434.009; Sun, 21 Dec 2025
 09:51:53 +0000
From: qiu ding <qdwby2008@outlook.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: ipmi issues(ubuntu 22.04 and openbmc v2.12.0)
Thread-Topic: ipmi issues(ubuntu 22.04 and openbmc v2.12.0)
Thread-Index: AQHccl5wyQH8/M9nl0OIpm5p1LscLA==
Date: Sun, 21 Dec 2025 09:51:53 +0000
Message-ID:
 <TYZPR04MB7269F16D7A68070C1470D3BDAFB7A@TYZPR04MB7269.apcprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR04MB7269:EE_|SEZPR04MB6274:EE_
x-ms-office365-filtering-correlation-id: 7c50074a-90d8-405f-bb73-08de4076923e
x-microsoft-antispam:
 BCL:0;ARA:14566002|20031999003|31061999003|15080799012|15030799006|39105399006|8060799015|8062599012|55001999003|19110799012|461199028|3430499032|3420499032|40105399003|440099028|3412199025|102099032|26104999006;
x-microsoft-antispam-message-info:
 =?gb2312?B?WmdTOGR0UGdVS1c1dVE4dGpyRk9Zb3FJSHNQZnVYRklrcnNKdjlQdTdaTytk?=
 =?gb2312?B?bklWQ1RVaUtFYkMrQTVSbkNCdHdiYjQ1cHkyZm9HbDRXaUl6aE1pSFRPTkNv?=
 =?gb2312?B?SEVoay9BTEI1RkwxUHlhTmdPak9DRFRJZVYySWd4ZVdlVWU1UThGN1owUDVj?=
 =?gb2312?B?T2dYajZtZ3V3WGlpV0JsR0MxZlB4YWx6dlBMalJPbk9ndVhTQkUycXEycXk1?=
 =?gb2312?B?djBLam1nOUNwcFpBUW5UV3FBcVQ3T0RxL2pTbGlEMXZQMlI2Umw2cTlWeEZW?=
 =?gb2312?B?U01CdGFTc2Z2Wko2bmlnTXJzQzRlaHAzV2JTQXNSZG8vZXRDUFN3b1NEdWMx?=
 =?gb2312?B?N1Uzb1ZyamhNbXU4aEl3L2FNTG5hSjVJVjdqR3gxV2Z4UDlGQWtjcWRPMmVZ?=
 =?gb2312?B?SVZ2TGdWVTdIN3hXWFZENXUzVmFRSGRTNDBEUm1ZNUtSc3ZaVTk5VTQyMWxF?=
 =?gb2312?B?dmVNUkxtdnpJVjJiZ0QzTXhsYXBUSUZITmtOWEZCUHFYM3VNaENBcWtUYXZk?=
 =?gb2312?B?VFdCdXBKNHNaNjFPLzQxTlJ0MFdhQURIV1pEVEcwZ1BBTit5WnBndmx4ZCt0?=
 =?gb2312?B?Smd6S3h4WXVYUklRdUFRL2dDMGFESmtKTDB2SFJwdGllWjRHV2JiZW5vR2lX?=
 =?gb2312?B?K09NV1ZVd2xQL1dYWS9TWFNrWjlUOVhsTUFrTHFDeHgzd1cwYVJkNnRtZmFY?=
 =?gb2312?B?V3VUOHdSbzVQR2M5TUF3RWM1TmtET0cyQUY1cHpsOFRQOU9rbkxtMFl1ZUFZ?=
 =?gb2312?B?SWFuY3NCSGJ3RDJLMlVtYTUxTXRpU2RtbTlnVHY2OXVtanVQSVppbUdHcWlQ?=
 =?gb2312?B?VEFLVDZ6UEd5UGlXeE4yZ3hYNytjWDQ0YksxOXY5emRvV2V0MDJ1VWhkYXpE?=
 =?gb2312?B?SmpBOCtDM3pDSkk5bkNuRm9hTXgvd29OeENzNTJmSUd2ZkVYVEhYcjRVVm5C?=
 =?gb2312?B?TWVndXpPNlorUmFkVXgzQThCaGxZSVpjc0w5cWx0WnJ0NGV5STB2cHpCRlZ4?=
 =?gb2312?B?NHVRUjNzL0dGa0g5WUQ2bEpWZ0syS0RObjJQL1lJdFJYSHR3T2NaY0R5NHZF?=
 =?gb2312?B?a2s1Qm5jbjFrb1YxZHNNZnRJOGk5R3kvQ1dQWTNPc3k3bUFPeklCN2ZCTHNs?=
 =?gb2312?B?clV4RExrYnRHVTlPZjRDa004RTlLaHgxVXlRT2xNNFVPRTRxMm9VOG1wenNV?=
 =?gb2312?B?TmQ0QVJKS0YvNGc5K1lEditkcGYvMkJ2OHB2MXpMUjJ3YVhSaFoxdGpiL2Nh?=
 =?gb2312?B?WGNpZmJ1YVJOdWU5aVd6U0J6aW5SUXJKL0VpTWM2UlowZzhGRlpCcGMwUlZO?=
 =?gb2312?B?NTFUZ3JHRVJhZmV5eG52bmlHQUw4WmxDZGlDK1grSVBvMk5zRGZzbHZMRDhz?=
 =?gb2312?B?TDd0QU15RHBqYnlIYlJuS0dnNUVVdDE5aC81TTA5SzdxZzhQRHRHL1BpWTNP?=
 =?gb2312?B?S215cTArTGoyVDU4YXB5L3ZmUmY0YlhaNzFiMUVHK1VaZktjQld1U3RjWTBG?=
 =?gb2312?B?bnFHU1h2dnppRW1tVmJmeTI3NWx0eW85cUU5cERLeHcyWVJNOXlmL1J6QXFL?=
 =?gb2312?B?Um41VDV4WUlZTWpNZ2VXRy9LK1RtZXBUUWZEb3l4SkhBSXdJMnRRQVB4VHJz?=
 =?gb2312?B?YVUxSlNWSXBVSWN4aUYzdFV1QlgwSENNazkzMjBlNG9jVm1xQzBXVHY5TWI3?=
 =?gb2312?B?cXhWSHRjNmcvSndqWjFta2NCVm1pdjh2SHRQb1g0VDcxR2Z1RmZKUmo3V3hr?=
 =?gb2312?Q?baaZ04E6ZL8ebE92qHBw5Jfr12BksczyGTYzgKI?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?RHcvTnM4d2NybDJGRXBIU2NmNmIvcDhVWjgxYzA2c0tjVHlLOFJZWUpPcnFn?=
 =?gb2312?B?MFlnalZ3ZS9QLzh1cUozMmdwdzNDQTdNOHVMeVd4aWF1SnhHelVEeTlYcEN5?=
 =?gb2312?B?Y1JrTzlLTGhad2NBVDg1N1p4U0dOb2ppL2RTU04raDFiRjJOSFl5dVo2ZWQv?=
 =?gb2312?B?OGkxaUY4a0xNNkpkV0l4ZXhuTkRuNGVQM2dpWWY1REhjRHF6ZXZ0c0FnQlg3?=
 =?gb2312?B?QStVUjh3VWFMalJ1Y1M0dFpHTWVjSW5scDNBaUp0d0Q1ZVZsNVByU3h5SXZC?=
 =?gb2312?B?aGZUTFFFRktPL0p0YjMrd0s5WjRlQ29BamYrRzZLZWpIaUpqdTdMbTJiYlEv?=
 =?gb2312?B?K3psZHNDNFlTZWVxQUs5eEJZV2hRR0ZhODFWWnhheXo3OHVKZUFybml0RkY4?=
 =?gb2312?B?YkF6WDNHd3RUSXc2QzVjK3FWZ1hYRWIyMXRaa1JQeVNQZGsxQnFlMXZUMU9T?=
 =?gb2312?B?MlgrSldqRExyRU9zaUxVcnZidHJOZlhxcHliZEkwTmRYajk5SnZwL0RUYWVH?=
 =?gb2312?B?S2ZWUjgzMjd3V3diWGkzNDJPV1ZQS1loWVRIUHZzOThvU3A1aitnOFdDY2RI?=
 =?gb2312?B?TGRCaTErNU43cTl0dk5QUUdNbzlPbVc5RmQxbDZxZmR4S1NpZnRvdzNGd05G?=
 =?gb2312?B?TW9XSGphTm02OUdRbWNHbGdBbUNJSzN5MVdjWWxRazhMVDBvUU1sbndybTdo?=
 =?gb2312?B?bkNhR0NrYmZFWjN6NjZrL21kODJaYzB2dVBGVVJMc2daTFM5QVo0U2x6cVM2?=
 =?gb2312?B?VlE1NHpnaWVrTDlnbTUyU1prTGJVNGVzSDUvV2d5eGd5cXlRakc5VGhkVndN?=
 =?gb2312?B?NUc2bUV6NTh6VFhwYU5sMGFYMjhOWUo4UklhcU5qR2o0ZFByV2xFWVlQQk4z?=
 =?gb2312?B?Rmg2OUZPOEJIMTZCRUF1Q0g5REg0Y2xrdXRHVW1zeDhzdmY4cDQ4SVNIL1RE?=
 =?gb2312?B?SC9mSnIyckpEYjJRWXY2OE1oNDJMN3F4RXFObTk2cFdpSlJUKzdCcEI4enhY?=
 =?gb2312?B?RlJyUFdpWUFBN3UzNkF5UVc3MGY1T2NpV3BMVG1jSkYyOUk4ZmNMUWsrSUdq?=
 =?gb2312?B?RHhISHhJOU5NZ2ZvcHZ6VUtWSFFlSXE1b1c1YnNZcUY5aGtJV3h3anRMZE50?=
 =?gb2312?B?MmQ3UGwvdjdobnUwb01KOENyallzanBENU5IUThyalJ1NmgyN2ovVnVlY3lt?=
 =?gb2312?B?dWRCVGFvVjJTSzY5VnZGOHlqN0Jjekl5QTVlQTBFY01OOHZ0NjFXUjMwVEtH?=
 =?gb2312?B?OFpsWWloNW9zMktaQXRwR00zZDdxRVp2V1pCQmN5UTU4UkJ2VHhteWlMUVhv?=
 =?gb2312?B?NC9vVlhXZC96ek9pbENiek9aV0I0SnQzS0k4WDBURk1zSlB2Mm9IMjQ0c29W?=
 =?gb2312?B?S3paRTM4TjZuWmlQay9PbGJoMmxpNnpZRjkzVDVOQVZpRGhaTTQ3dXZXNzhH?=
 =?gb2312?B?aldZcmV1akdpdUgvNHhYQVVoRWJSNlFVMG9tZlJpZTdtRHBjcGhpd3pWS0c5?=
 =?gb2312?B?a213NElFTXBXejFCNmhwMWNYb0FKQ3IzSERYUFNIeGV5WjJzMERuUm5pVWln?=
 =?gb2312?B?K2xwUEUxN1BMcVhHSnJXWFJ2NklncjQ0U3kyV0dLTkhaRHBvK0hEeWNzL2Vu?=
 =?gb2312?B?enZGY2RSNHk3R1RRMzVtQ2c4VzhjckpYZTJTZm5CMk82TVhTa056cmU0Y3RZ?=
 =?gb2312?B?SDFUc1JyY0U5Z3FPaDlnODViV003YlM5Z1g3RFQ2eVliTkkzaFV5YkxOcVlS?=
 =?gb2312?B?dGg5RjVPM1Z6a0VZWXFBQ0k0eG9WdkRFQ3pGcnlRbE55VDQ5UXpuR2x1QVRq?=
 =?gb2312?B?blN1UlJGMjltMWhmekdRbzRqbTV0TEdwS0hCUkQwOWZnNHRtV1BiRnpPd2tY?=
 =?gb2312?B?RkxydjhXNy9pYWplU0xWU241WVJEUnNnZVczaWRnNDdhbGIvMVJ0QTNKakp4?=
 =?gb2312?Q?/3bXarEf8Ak=3D?=
Content-Type: multipart/alternative;
	boundary="_000_TYZPR04MB7269F16D7A68070C1470D3BDAFB7ATYZPR04MB7269apcp_"
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
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR04MB7269.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c50074a-90d8-405f-bb73-08de4076923e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2025 09:51:53.6929
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6274
X-Spam-Status: No, score=0.1 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--_000_TYZPR04MB7269F16D7A68070C1470D3BDAFB7ATYZPR04MB7269apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGVsbG8sIEknbSB0ZXN0aW5nIHRoZSBJUE1JIGludGVyZmFjZSBvbiB0aGUgZXZiLWFzdDI2MDAg
c2ltdWxhdG9yIHdpdGggVWJ1bnR1IDIyLjA0IGFuZCBPcGVuQk1DIHYyLjEyLjAuIEknbSBlbmNv
dW50ZXJpbmcgYW4gSVBNSSBhdXRoZW50aWNhdGlvbiBpc3N1ZSAodGhlIHBvcnQgaXMgNjIzMCAt
PiA2MjMsIGFuZCBwb3J0IDYyMyBpcyBsaXN0ZW5pbmcgb24gVURQIGJ5IGRlZmF1bHQpLiBIb3cg
Y2FuIEkgcmVzb2x2ZSB0aGlzPyBEb2VzIHBob3NwaG9yLWlwbWktaG9zdCB1c2UgQ01ha2Ugb3Ig
QXV0b3Rvb2xzIGZvciBjb21waWxhdGlvbiBieSBkZWZhdWx0Pw0KDQpBZGRpdGlvbjogV2hlbiBj
b21waWxpbmcgcGhvc3Bob3ItaXBtaS1ob3N0LCB0aGUgZGVmYXVsdCByZWNpcGUgcGFyYW1ldGVy
cyBmcm9tIHRoZSBPcGVuQk1DIHYyLjEyLjAgYnJhbmNoIGFyZSB1c2VkLg0KDQpTaW11bGF0b3Ig
RW52aXJvbm1lbnQ6DQpyb290QGV2Yi1hc3QyNjAwOn4jIHN5c3RlbWN0bCBzdGF0dXMgcGhvc3Bo
b3ItaXBtaS1ob3N0DQoqIHBob3NwaG9yLWlwbWktaG9zdC5zZXJ2aWNlIC0gUGhvc3Bob3IgSW5i
YW5kIElQTUkNCiAgICAgTG9hZGVkOiBsb2FkZWQgKC9saWIvc3lzdGVtZC9zeXN0ZW0vcGhvc3Bo
b3ItaXBtaS1ob3N0LnNlcnZpY2U7IGVuYWJsZWQ7IHZlbmRvciBwcmVzZXQ6IGVuYWJsZWQpDQog
ICAgRHJvcC1JbjogL2xpYi9zeXN0ZW1kL3N5c3RlbS9waG9zcGhvci1pcG1pLWhvc3Quc2Vydmlj
ZS5kDQogICAgICAgICAgICAgYC0xMC1vdmVycmlkZS5jb25mDQogICAgIEFjdGl2ZTogYWN0aXZl
IChydW5uaW5nKSBzaW5jZSBUaHUgMTk3MC0wMS0wMSAwMToyMzo0NiBVVEM7IDVzIGFnbw0KICAg
TWFpbiBQSUQ6IDMwNSAoaXBtaWQpDQogICAgIENHcm91cDogL3N5c3RlbS5zbGljZS9waG9zcGhv
ci1pcG1pLWhvc3Quc2VydmljZQ0KICAgICAgICAgICAgIGAtIDMwNSBpcG1pZA0KDQpKYW4gMDEg
MDE6MjM6MzcgZXZiLWFzdDI2MDAgc3lzdGVtZFsxXTogU3RhcnRpbmcgUGhvc3Bob3IgSW5iYW5k
IElQTUkuLi4NCkphbiAwMSAwMToyMzo0MyBldmItYXN0MjYwMCBpcG1pZFszMDVdOiBKU09OIGZp
bGUgbm90IGZvdW5kDQpKYW4gMDEgMDE6MjM6NDYgZXZiLWFzdDI2MDAgc3lzdGVtZFsxXTogU3Rh
cnRlZCBQaG9zcGhvciBJbmJhbmQgSVBNSS4NCkphbiAwMSAwMToyMzo0NyBldmItYXN0MjYwMCBp
cG1pZFszMDVdOiBMb2FkaW5nIHdoaXRlbGlzdCBmaWx0ZXINCkphbiAwMSAwMToyMzo0NyBldmIt
YXN0MjYwMCBpcG1pZFszMDVdOiBTZXQgcmVzdHJpY3RlZE1vZGUgPSBmYWxzZQ0KSmFuIDAxIDAx
OjIzOjQ3IGV2Yi1hc3QyNjAwIGlwbWlkWzMwNV06IE5ldyBpbnRlcmZhY2UgbWFwcGluZw0Kcm9v
dEBldmItYXN0MjYwMDp+Iw0KDQpyb290QGV2Yi1hc3QyNjAwOn4jIG5ldHN0YXQgLWFuIHxncmVw
IDo2MjMNCnVkcCAgICAgICAgMCAgICAgIDAgOjo6NjIzICAgICAgICAgICAgICAgICAgOjo6Kg0K
cm9vdEBldmItYXN0MjYwMDp+Iw0KDQpJc3N1ZXM6DQokIGlwbWl0b29sIC1JIGxhbnBsdXMgLUgg
MTI3LjAuMC4xIC1wIDYyMzAgLVUgcm9vdCAtUCBvcGVuQm1jIC1BIG1kNSBtYyBpbmZvDQpFcnJv
ciBpbiBvcGVuIHNlc3Npb24gcmVzcG9uc2UgbWVzc2FnZSA6IGludmFsaWQgYXV0aGVudGljYXRp
b24gYWxnb3JpdGhtDQoNCkVycm9yOiBVbmFibGUgdG8gZXN0YWJsaXNoIElQTUkgdjIgLyBSTUNQ
KyBzZXNzaW9uDQoNCiQgaXBtaXRvb2wgLUkgbGFucGx1cyAtSCAxMjcuMC4wLjEgLXAgNjIzMCAt
VSByb290IC1QIG9wZW5CbWMgLUEgbm9uZSBtYyBpbmZvDQpFcnJvciBpbiBvcGVuIHNlc3Npb24g
cmVzcG9uc2UgbWVzc2FnZSA6IGludmFsaWQgYXV0aGVudGljYXRpb24gYWxnb3JpdGhtDQoNCkVy
cm9yOiBVbmFibGUgdG8gZXN0YWJsaXNoIElQTUkgdjIgLyBSTUNQKyBzZXNzaW9uDQokIGlwbWl0
b29sIC1IIDEyNy4wLjAuMSAtcCA2MjMwIC1VIHJvb3QgLVAgb3BlbkJtYyAtQSBub25lIG1jIGlu
Zm8NCkF1dGhlbnRpY2F0aW9uIHR5cGUgTk9ORSBub3Qgc3VwcG9ydGVkDQpFcnJvcjogVW5hYmxl
IHRvIGVzdGFibGlzaCBMQU4gc2Vzc2lvbg0KRXJyb3I6IFVuYWJsZSB0byBlc3RhYmxpc2ggSVBN
SSB2MS41IC8gUk1DUCBzZXNzaW9uDQo=

--_000_TYZPR04MB7269F16D7A68070C1470D3BDAFB7ATYZPR04MB7269apcp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);">
Hello, I'm testing the IPMI interface on the evb-ast2600 simulator with Ubu=
ntu 22.04 and OpenBMC v2.12.0. I'm encountering an IPMI authentication issu=
e (the port is 6230 -&gt; 623, and port 623 is listening on UDP by default)=
. How can I resolve this? Does phosphor-ipmi-host
 use CMake or Autotools for compilation by default?</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);">
Addition: When compiling phosphor-ipmi-host, the default recipe parameters =
from the OpenBMC v2.12.0 branch are used.</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(200, 38, 19);" class=3D"elementToProof">
<b>Simulator Environment:</b></div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);">
root@evb-ast2600:~# <b>systemctl status phosphor-ipmi-host</b></div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
* phosphor-ipmi-host.service - Phosphor Inband IPMI</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp;Loaded: loaded (/lib/systemd/system/phosphor-ipmi-host.=
service; enabled; vendor preset: enabled)</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; Drop-In: /lib/systemd/system/phosphor-ipmi-host.service.d</di=
v>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;`-10-override.conf</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp;Active: active (running) since Thu 1970-01-01 01:23:46 =
UTC; 5s ago</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp;Main PID: 305 (ipmid)</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp;CGroup: /system.slice/phosphor-ipmi-host.service</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;`- 305 ipmid</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
Jan 01 01:23:37 evb-ast2600 systemd[1]: Starting Phosphor Inband IPMI...</d=
iv>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
Jan 01 01:23:43 evb-ast2600 ipmid[305]: JSON file not found</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
Jan 01 01:23:46 evb-ast2600 systemd[1]: Started Phosphor Inband IPMI.</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
Jan 01 01:23:47 evb-ast2600 ipmid[305]: Loading whitelist filter</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
Jan 01 01:23:47 evb-ast2600 ipmid[305]: Set restrictedMode =3D false</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
Jan 01 01:23:47 evb-ast2600 ipmid[305]: New interface mapping</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
root@evb-ast2600:~#&nbsp;</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
root@evb-ast2600:~# <b>netstat -an |grep :623</b></div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
udp &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp;0 :::623 &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;:::* &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
root@evb-ast2600:~#&nbsp;</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"color: rgb(200, 38, 19);"><b>Issues:</b></span></div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);">
$ <b>ipmitool -I lanplus -H 127.0.0.1 -p 6230 -U root -P openBmc -A md5 mc =
info</b></div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"background-color: rgb(255, 255, 0);">Error in open session r=
esponse message : invalid authentication algorithm</span></div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"background-color: rgb(255, 255, 0);">Error: Unable to establ=
ish IPMI v2 / RMCP+ session</span></div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"background-color: rgb(255, 255, 0);"><br>
</span></div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
$ <b>ipmitool -I lanplus -H 127.0.0.1 -p 6230 -U root -P openBmc -A none mc=
 info</b></div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"background-color: rgb(255, 255, 0);">Error in open session r=
esponse message : invalid authentication algorithm</span></div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
Error: Unable to establish IPMI v2 / RMCP+ session</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
$<b>&nbsp;ipmitool -H 127.0.0.1 -p 6230 -U root -P openBmc -A none mc info<=
/b></div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"background-color: rgb(255, 255, 0);">Authentication type NON=
E not supported</span></div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
Error: Unable to establish LAN session</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);">
Error: Unable to establish IPMI v1.5 / RMCP session</div>
</body>
</html>

--_000_TYZPR04MB7269F16D7A68070C1470D3BDAFB7ATYZPR04MB7269apcp_--

