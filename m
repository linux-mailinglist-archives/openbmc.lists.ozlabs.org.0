Return-Path: <openbmc+bounces-1416-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id x3icMpeoo2nfJQUAu9opvQ
	(envelope-from <openbmc+bounces-1416-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Sun, 01 Mar 2026 03:46:47 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5DD1CDE8D
	for <lists+openbmc@lfdr.de>; Sun, 01 Mar 2026 03:46:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fNmfn0dv9z2yFK;
	Sun, 01 Mar 2026 13:46:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772333201;
	cv=pass; b=Yg+DoWQnz8zUm3ptXyh8ZuZcADJWuwflf0wUty+Bu9qRy73mv2pc6XuK8a3eGpVUWDx8ffK3mEU8r/8eyrSuwkzSWxpmEu9l5uE79/PmLWPEC01nzayaHt8tjpAUZwbMbIi53dhQLWIZGp3rCvm70AsfYT0plcvAh06V3UotMYrhiLHmXsc2giQII1pBiHgFsf8va0nXeP+r/zxdGCKuNhaR/TcaZoixlRkvAZmDmb77IkACsk7VHXyf+QMK19mrT+ksf0k4Fbxrrn2MOSSij3BeyCT4lm8vKp8ktJUFoLPHqizdIcz+RTPt3/RHaTvMMokljfZgWSXmdJIZUegV7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772333201; c=relaxed/relaxed;
	bh=wBtUvixh2HRHwco9TZe189OT+FPbGaLUO3GNkHECdOY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=APtWAodULH9UKzj3pFdZoxZdy+PxEP+eDwGQWdUxxw9TDqWR+WQ7gz3SAu4bbj4xLlXEuO2kljNzz4Xxt55/5mC6vqlLyF62DSqtczY46sgXW7QfC6VU9MrqvOD0LrO2VG7YHPCL9QEL25+W1JOolR7dkcQNl6wAzIUMcPW1FIqp1arMXmJCq8Z0mnNeOO3u5ZLGOvcQrQBEOQq0dVZeHJY1MKSu//MlvPDhmE7Swb8nYuXBvg+ZgkSSt6ZhuPfhgnqgBxDRfXfasTc0Qy1S6O9N/xDyBsOTWbdRC7SZxWTxzdGPdWzo06XpmiBzrK5VoiBhjoKTh0WQNYdlJ/uLvw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=dnafzH1x; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=dnafzH1x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fNmfj5TXCz2yF1;
	Sun, 01 Mar 2026 13:46:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KWjepBpTE6QrDaAU9TS28D6wvdqJZrMUsshqiEy/QiYx/Br/NZFX7+M1K36xq1Y/HTKZna7+Ro3qcpWQrRj2bNRtS5z23tc2k0L2SeArsYUNtIZwW3nmWpve8eh7ZANl4XqhyXlMKYo92D8itvo5mLk1te05DYQRbZMv59nHe0XxZI8B/m31fOY8myQ2HifkkuzHaFiFY7TzEMkifrBSgHkw9nAAZv7QnSXPXA8qNbU4l1tjO09+UZzGli0cA/1kwje1gT/sTEnFZSVzLOHJlb6KQCCs/58dxyJyxBgSqt35+hyzaHyKROfJI4GgIHaPQoZ2WuC0s48Tng0Wj/Jt1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wBtUvixh2HRHwco9TZe189OT+FPbGaLUO3GNkHECdOY=;
 b=gJ+JOekVyAdEVo6YJ92luC7KWjfrqZ4YtaXencBeM16m8zxM9gYqJCnEhbkolVct0iZsdU8wZ2eo3CxWrzufPULbwZOTq9CzpRAFU5cBoY/vx72lByI+LJfIth8wZoOT5lMX5aiaoepN2H7EFZjZZV6Q/dja7KAmbHaaYzULUtDU65aJBmPZrYrudgD82E2GYDCIETHfVyt94Tnc/VuFmSTZ2DgSxaHQRjxJ6v3L6rJNealijTgvImuaQp4qbb8+YBjaompzy5pgNBh5Kaod1DMVru51R0PDAp4pZVNS3qjIseUKrSxzPhrxdI+dW98a7WfCkZQWv2mLFQpfDAfUFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBtUvixh2HRHwco9TZe189OT+FPbGaLUO3GNkHECdOY=;
 b=dnafzH1xTS5NjsxrISuqLkNu1tm0EXB9+auS6KvC7D1c7Ji1Zbh7Azln0FvQIOVmBkKT+xYKI1bFZtfPSRm6ykffJr7Iv8zaIYU33XRLTjJ1UmWjiIXSBYwnXLsHzRSXo6yhVMjO79DXEU46/9KFfkH81QGINaU3yLKsn2uFWu/ZyVH+0Z7c0vZyxZMsFHy2ZCxTQ019J3b1A2+ZqUNfzOw5NHIZMA+PB0fO+QaLdhxjEAqMJY9pVkKir3HcqQm1Dk+xH1T2SJQJTwBJSg+ICxH3zBuiQsvNj53JyN6N3W14GY9rHaE7zp9ZGbilnINZg5qJIXTAPJAWemF3jcptBg==
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com (2603:1096:408::791)
 by TY2PPFEEE7EFD09.apcprd06.prod.outlook.com (2603:1096:408::7b1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Sun, 1 Mar
 2026 02:46:09 +0000
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::8c70:cb01:78fb:d9c0]) by TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::8c70:cb01:78fb:d9c0%5]) with mapi id 15.20.9632.010; Sun, 1 Mar 2026
 02:46:08 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "jk@codeconstruct.com.au" <jk@codeconstruct.com.au>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, Andi
 Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Rayn Chen
	<rayn_chen@aspeedtech.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>
Subject: RE: [PATCH v25 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
Thread-Topic: [PATCH v25 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
Thread-Index: AQHcpjfmkCdmHqcMIkmXHbntnlQiOLWWI8uAgALYJvA=
Date: Sun, 1 Mar 2026 02:46:08 +0000
Message-ID:
 <TY2PPF5CB9A1BE6AC2F7476B339CE973D41F271A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20260225-upstream_i2c-v25-0-9f4bdd954f3f@aspeedtech.com>
 <20260225-upstream_i2c-v25-1-9f4bdd954f3f@aspeedtech.com>
 <20260227-fragrant-industrious-aardwark-bdb63b@quoll>
In-Reply-To: <20260227-fragrant-industrious-aardwark-bdb63b@quoll>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PPF5CB9A1BE6:EE_|TY2PPFEEE7EFD09:EE_
x-ms-office365-filtering-correlation-id: d4d6a02a-a99a-4410-c1e4-08de773cb129
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info:
 wR3+F2eeVux+yS1rFzyeD7ER27cR1ge9W1TO/IN2RJheNCov/IMfhG9FEb7iZEDBeAcWfeCvJKf1TQggJt9HlPE5TmhtCgPDWACeABJ6I1QlCTSdo5Z4MqjGT7I6l6uH0pvZ+Utqn4bx9HiFAlfl7zJ0XDAs3/KOMnnj9lB0oaymaaUHUewGgAe825ZryG4SqRqhKGZN9St2PNd6b9OSJ6td68rtiJ3CQ7bL0PRGk4TwwjJyAisKpZXEqi8XPiChoh49Yxe88KDP7N9prIkq//nZat1vT6QBuynDR+Z3BHcy4p3sOwP2rKTOTEHkQvxrjD4EHYclNKD8KWHemp2QbwSxrFi5nphsCPZ0dLph5KydINeoQ4mqaLxT2X6gzQT4j8WkYw4gu6e56kK2uEsEdaYeRj4VJancy9bDiWstoOpc1oalCkiL7meUhjp6MjAXTlT5KNQsiTtn75pI8eIRkHPQHdWbqRHy+ETjXCsGbkMhUveZER39gNjJm0XEK/qh2pEfRGPXblIuQOM+Mfmlq0n88KE0S0N0W+Qsm+uTzojlPT8+jEEltA/yywyVlQLeFZEGEjUHfS6pvOS3RW7b75wFKfJFRnMlaZ0R8PVifO55jss6fNrZg791WZXk/I65vAnMOCFEXdCEezvA5ko4Qviwn6vBKkpAgGswSKYW0n3VPhFZR9JSbl2RTG3dmYKaeeLp5NCUbwlWKAn89sjPHjhtt9vvpbn7zxczgW0Ay4Y9ud8ig0s3mPB9Z11mkJmz
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M2NuZ3BFbzVhREFyQW5VVkM5OHhJNVVHbWpnSi9LR1BUeVNQWFNRaXZ0VTRu?=
 =?utf-8?B?MlVWa3M4aE1LRFlLTWVrY0JJV2JiNnlwK01qV2Nwb1k2N21yTGR4bElUeXpS?=
 =?utf-8?B?Uis5WmxFQzc0ME1yVnRaV05XR1NRSXFRMm1NbWFsQUI0aEZVR3IwcytONHg4?=
 =?utf-8?B?aUNKcXpxWnQ3WFhib2RKejA0a2NjKzRxUGdVeFUxY2F6V0QydlVOTDlYWjFP?=
 =?utf-8?B?dDVrT29aRFIzTUV0Y2RSVGxQNDlLblo5WWo5aEYyV1BiTU4wTm81VzE5VEZI?=
 =?utf-8?B?TkdKaExBSlF5bDVIVWpMV1VQVG9hRWN5bDNWL3JHK0NSa0d3S3VhYm1lN1p6?=
 =?utf-8?B?dVhHWVpZZkJ1U2d5T0kzZGVncTU4bGdJQUdWRjBFMU5SZWpaSi8vRDhDZFB6?=
 =?utf-8?B?LzY5QTJqYTFCVUNsSU9hRzNueWF0b3YwcnF4ekc4blBqVmdnWkNZRFFWWXhz?=
 =?utf-8?B?RTVoTmhvaE1KbXp3bHhFcWZMakJXZFoybkZHVWVhNkh3NmswWjBEYkltM1FD?=
 =?utf-8?B?K0pUcllJYVBxQUhlVzBsbjhETi9wOEtoWkFsVkFtcWVLYURnR3VkT3NJRTYz?=
 =?utf-8?B?NnFaZnoyc2V1UzJhbTdPSHQxV0k2bDVnYzQ2ZHR5MkFOUGlqeVV6OEpFYkZL?=
 =?utf-8?B?MWtidGRUZklBYzE1ckFPekpIZ0o3VGpzYkJOdXBvWWQ1eXJHK3RSTjJEZDVV?=
 =?utf-8?B?QU1pY25oQzlLV21BUW84NHl0OEwwVDZEQ0l6VU1iK1hGL1FSTTBnMlJaOEtq?=
 =?utf-8?B?bGI2S1hEenhxM3p2Kzc0a1pJT0FtWXJXUm1FSEdxdTRMaDdubjNUWGd6aFI1?=
 =?utf-8?B?TjE1V3N4Y3ExMVg3RWtUOTQ2bGhZK0dRQ0xuemE4WGpPMm1WelpoTy9mcmNp?=
 =?utf-8?B?SzlOall6Rk5UeXJ2QnpmdXdyUVVlSHJvMHhVRTBmTzVuVDJ0SEgxU3BlaWVW?=
 =?utf-8?B?a1hGQTRoNWQ3cEY5UHR6WVdUT0FkQ2RjbVpZK2Y5ZWNOTnFKc1ZCcGN6SS8r?=
 =?utf-8?B?dTNocEtzWU8rT01ncndBVzVRbjJqQ2dERVFVdHNHeVc5NFdidHYrelprZDFF?=
 =?utf-8?B?RnlYUjBscDJTRWI3cWhzdUN2MnJ6cmZUSlJQTjhkSjJPeWtRc2UwRS9vVmht?=
 =?utf-8?B?WFBGWXFybS9lWjNweFMza3laOWNUS3lESDExbGtGWTVURTdGY3QyUEJQTE9S?=
 =?utf-8?B?TXVQL1IvRFVmN0JCN0swZ0Vwdi9EOE40emRNK0x6K3pqTTRaM1RFT1orcjJl?=
 =?utf-8?B?eXkzU2llaGU0Z2YyL2llZEhzc2JNZ1h6UjlrQk9xR0VCMkZCM2ZBc3hJRlJB?=
 =?utf-8?B?bFRoY3FvTGhxWWwwT3FtNXArOXNVdUFsdG1RVzhOcllONTdCV1d1VkxyV3hF?=
 =?utf-8?B?cHVHWFVzOGdvZ00wcEhidDR6eEVBcnEwbzJVeE1URE8xM25LdHMrb0hCdU13?=
 =?utf-8?B?QW93bVZGajNWSWdiK01jYS90NXBLQW4zeUNPZHQ1eXVRM1daUTZGT1NIUnZ5?=
 =?utf-8?B?MmR4b1NoM0NIdHNSTnRZZDg5bW9tcGVmYWRCbkRyWks2bCtEdW9Cajk0MXFN?=
 =?utf-8?B?VWlUeHowNWlxMWp3V2ZjUWVpc1l3YjEwSThBY2ttRkJ5MUI2aS9ieUZTeG95?=
 =?utf-8?B?UzhGQmVoWXZOSEZ0WHUzL0JrN3hSVnZ3V0tIMnZqSFphbDBRcDBmOVVRTHND?=
 =?utf-8?B?bkRFVWRUdTFLSDFxcHZDZ0gzaW4ydk9ab21oZkIwM1hxVTRJMzlacC81L3Rt?=
 =?utf-8?B?QnhWUi9aYWd4MmxRM2JBSE1sbEVwT1h2TW5URUpNYTRWM0JTTVZNeWpQQjZ6?=
 =?utf-8?B?UmtaVm1DSXlNUXoxc0NPaDIvZUJFck9zTCtLNXR1VTlJM0N6NHhrdlVhWmVn?=
 =?utf-8?B?R0orV25sQWxCWE8zSXBzbE15THRrQi9ja043S1lwbzI0eVRKVlNMc05XM0Jx?=
 =?utf-8?B?cDRrcjlsTXAvNk85YjVHNmFkTVNON2hzdzQ5YkRuVkNkc1NQc0lRT3ZnNkZt?=
 =?utf-8?B?TmtKWFlsWC81dnlnRGR3c2pIVm9qS2NCc3Q4OWZub2RKeGNndWdsS2NGdVJl?=
 =?utf-8?B?Q3dXZTNDN1pMTkdZVTJTLy81UU1IUXlydUI2TEd6MXBSNEhhS2ZMSk9DODgr?=
 =?utf-8?B?cVJpb1hJZEExcGJlcnJFSGE4TjZONWlIR1JoWnZENnBPR0lHZS82Y0duNGlJ?=
 =?utf-8?B?eHcrcEdhVlNWcEtwelZPTjhrREwrSUZDbUxZbFBNb3NRUXQyUGVqeVpjVHZs?=
 =?utf-8?B?SE10TExhaStTSVhiRjNyTmZEcnlLRmdtbnRDUHdtYWNwdFlMVFdINms4dnNu?=
 =?utf-8?B?YzI2RXlyQ0V0R0FaWkNiRm1NUWRwdVNteE1pNVFTRmFpR1I1VkI3UT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d4d6a02a-a99a-4410-c1e4-08de773cb129
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2026 02:46:08.6829
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VPdlYFA9RPH8gc1wI61V4iXpFHvlknivz0XRrn4rlpdXuJP6Xvgnkdwf1FHicnt/D5TmiBxxrYaiGslNv8DqsMLS034D5LQAbglBwS9E6WQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPFEEE7EFD09
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.40 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[aspeedtech.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[aspeedtech.com:s=selector1];
	MAILLIST(-0.19)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1416-lists,openbmc=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.80:email];
	FROM_NEQ_ENVFROM(0.00)[ryan_chen@aspeedtech.com,openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[aspeedtech.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[openbmc,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com:mid]
X-Rspamd-Queue-Id: EC5DD1CDE8D
X-Rspamd-Action: no action

SGVsbG8gS3J6eXN6dG9mLA0KCVRoYW5rcyB0aGUgcmV2aWV3Lg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjI1IDEvNF0gZHQtYmluZGluZ3M6IGkyYzogU3BsaXQgQVNUMjYwMCBiaW5kaW5nIGlu
dG8gYSBuZXcNCj4gWUFNTA0KPiANCj4gT24gV2VkLCBGZWIgMjUsIDIwMjYgYXQgMDU6MTk6MzhQ
TSArMDgwMCwgUnlhbiBDaGVuIHdyb3RlOg0KPiA+IFRoZSBBU1QyNjAwIEkyQyBjb250cm9sbGVy
IGludHJvZHVjZXMgYSBjb21wbGV0ZWx5IG5ldyByZWdpc3RlciBsYXlvdXQNCj4gPiB3aXRoIHNl
cGFyYXRlIGNvbnRyb2xsZXIgYW5kIHRhcmdldCByZWdpc3RlciBibG9ja3MsIHVubGlrZSB0aGUg
bWl4ZWQNCj4gPiByZWdpc3RlciBsYXlvdXQgdXNlZCBieSBBU1QyNDAwL0FTVDI1MDAuDQo+ID4N
Cj4gPiBUbyBkZXNjcmliZSB0aGlzIHByb3Blcmx5LCBzcGxpdCBvdXQgdGhlIEFTVDI2MDAgSTJD
IGJpbmRpbmcgaW50byBpdHMNCj4gPiBvd24gWUFNTCBmaWxlLiBUaGUgY29tcGF0aWJsZSBzdHJp
bmcgcmVtYWlucyB1bmNoYW5nZWQuDQo+IA0KPiBCdXQgeW91IG1hZGUgb3RoZXIgY2hhbmdlcyBp
biB0aGUgYmluZGluZy4gWW91IG11c3QgbGlzdCB0aGVtLCBiZWNhdXNlDQo+IG90aGVyd2lzZSBp
dCBzb3VuZHMgbGlrZSB5b3Ugb25seSBTUExJVC4gSXQncyBub3QgdHJ1ZS4gWW91IGFjdHVhbGx5
IGNoYW5nZWQgdGhlDQo+IGJpbmRpbmcgaW4gYXQgbGVhc3QgdHdvIHBsYWNlcywgbWF5YmUgbW9y
ZS4NCg0KSSB3aWxsIHVwZGF0ZSB3aXRoIGZvbGxvd2luZy4NCg0KTW92ZSBBU1QyNjAwIEkyQyBi
aW5kaW5nIGZyb20gYXNwZWVkLGkyYy55YW1sIHRvIGEgZGVkaWNhdGVkDQphc3BlZWQsYXN0MjYw
MC1pMmMueWFtbCBzY2hlbWEuDQoNCkJlc2lkZXMgdGhlIHNwbGl0LCB0aGlzIGFsc28gYWRqdXN0
cyBBU1QyNjAwLXNwZWNpZmljIGNvbnN0cmFpbnRzOg0KLSByZXF1aXJlIHR3byByZWcgcmVnaW9u
cyAoY29udHJvbGxlciByZWdpc3RlciBibG9jayArIGJ1ZmZlciBibG9jaykNCi0gdXNlIGNsb2Nr
LWZyZXF1ZW5jeSBmb3IgYnVzIHNwZWVkIGRlc2NyaXB0aW9uDQotIHJlcXVpcmUgaW50ZXJydXB0
cyBmb3IgQVNUMjYwMCBpbnN0YW5jZXMNCg0KTm8gY29tcGF0aWJsZSBzdHJpbmdzIGFyZSBjaGFu
Z2VkLg0KDQo+IA0KPiA+DQo+ID4gVGhlIGV4YW1wbGUgc2VjdGlvbiBpcyB1cGRhdGVkIHRvIHJl
ZmxlY3QgdGhlIGFjdHVhbCBBU1QyNjAwIFNvQw0KPiA+IHJlZ2lzdGVyIGxheW91dCBhbmQgaW50
ZXJydXB0IGNvbmZpZ3VyYXRpb24gKGFzcGVlZC1nNi5kdHNpLCBsaW5lcw0KPiA+IDg4NS04OTcp
Og0KPiA+DQo+ID4gLSBJMkMgYnVzIGFuZCBidWZmZXIgcmVnaXN0ZXIgb2Zmc2V0cw0KPiA+ICAg
LSBBU1QyNjAwIEkyQyBjb250cm9sbGVyIHJlZ2lzdGVyIGJhc2Ugc3RhcnRzIGF0IDB4ODAsIGFu
ZCB0aGUNCj4gPiAgICAgYnVmZmVyIHJlZ2lvbiBpcyBsb2NhdGVkIGF0IDB4YzAwLCBwZXIgdGhl
IEFTVDI2MDAgU29DIHJlZ2lzdGVyIG1hcC4NCj4gPg0KPiA+IC0gSW50ZXJydXB0IGNvbmZpZ3Vy
YXRpb24NCj4gPiAgIC0gQVNUMjYwMCBJMkMgY29udHJvbGxlcnMgYXJlIGNvbm5lY3RlZCB0byB0
aGUgQVJNIEdJQywgbm90IHRoZSBsZWdhY3kNCj4gPiAgICAgaW50ZXJuYWwgaW50ZXJydXB0IGNv
bnRyb2xsZXIuDQo+IA0KPiBFeGFtcGxlIGlzIGlycmVsZXZhbnQsIGRvbid0IG1lbnRpb24gaXQu
IFdlIGRpc2N1c3MgaGVyZSBiaW5kaW5nLg0KDQpPS34gSSB3aWxsIHJlbW92ZSBleGFtcGxlIGlu
IGNvbW1pdCBtZXNzYWdlLw0KPiANCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFJ5YW4gQ2hlbiA8
cnlhbl9jaGVuQGFzcGVlZHRlY2guY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vYmluZGluZ3MvaTJj
L2FzcGVlZCxhc3QyNjAwLWkyYy55YW1sICAgICAgICAgICB8IDYyDQo+ICsrKysrKysrKysrKysr
KysrKysrKysNCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2FzcGVlZCxpMmMueWFt
bCAgICAgICAgfCAgMyArLQ0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDYzIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2FzcGVlZCxhc3QyNjAwLWkyYy55YW1sDQo+ID4gYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2FzcGVlZCxhc3QyNjAwLWkyYy55
YW1sDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjA3
N2JlODUxMzdjOQ0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvaTJjL2FzcGVlZCxhc3QyNjAwLWkyYy55YW1sDQo+ID4gQEAgLTAs
MCArMSw2MiBAQA0KPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5
IE9SIEJTRC0yLUNsYXVzZSkgJVlBTUwgMS4yDQo+ID4gKy0tLQ0KPiA+ICskaWQ6IGh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2kyYy9hc3BlZWQsYXN0MjYwMC1pMmMueWFtbCMNCj4gPiAr
JHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+
ID4gKw0KPiA+ICt0aXRsZTogQVNQRUVEIEkyQyBvbiB0aGUgQVNUMjZYWCBTb0NzDQo+IA0KPiBz
LzI2WFgvMjYwMC8gcHJvYmFibHkNCldpbGwgdXBkYXRlDQp0aXRsZTogQVNQRUVEIEkyQyBvbiB0
aGUgQVNUMjYwMCBTb0NzDQo+IA0KPiA+ICsNCj4gPiArbWFpbnRhaW5lcnM6DQo+ID4gKyAgLSBS
eWFuIENoZW4gPHJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT4NCj4gPiArDQo+ID4gK2FsbE9mOg0K
PiA+ICsgIC0gJHJlZjogL3NjaGVtYXMvaTJjL2kyYy1jb250cm9sbGVyLnlhbWwjDQo+ID4gKw0K
PiA+ICtwcm9wZXJ0aWVzOg0KPiA+ICsgIGNvbXBhdGlibGU6DQo+ID4gKyAgICBlbnVtOg0KPiA+
ICsgICAgICAtIGFzcGVlZCxhc3QyNjAwLWkyYy1idXMNCj4gPiArDQo+ID4gKyAgcmVnOg0KPiA+
ICsgICAgaXRlbXM6DQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IGNvbnRyb2xsZXIgcmVnaXN0
ZXJzDQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IGNvbnRyb2xsZXIgYnVmZmVyIHNwYWNlDQo+
ID4gKw0KPiA+ICsgIGludGVycnVwdHM6DQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ICsNCj4g
PiArICBjbG9ja3M6DQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ICsNCj4gPiArICBjbG9jay1m
cmVxdWVuY3k6DQo+ID4gKyAgICBkZXNjcmlwdGlvbjogRGVzaXJlZCBvcGVyYXRpbmcgZnJlcXVl
bmN5IG9mIHRoZSBJMkMgYnVzIGluIEh6Lg0KPiA+ICsgICAgbWluaW11bTogNTAwDQo+ID4gKyAg
ICBtYXhpbXVtOiA0MDAwMDAwDQo+ID4gKyAgICBkZWZhdWx0OiAxMDAwMDANCj4gPiArDQo+ID4g
KyAgcmVzZXRzOg0KPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiArDQo+ID4gK3JlcXVpcmVkOg0K
PiA+ICsgIC0gcmVnDQo+ID4gKyAgLSBjb21wYXRpYmxlDQo+ID4gKyAgLSBjbG9ja3MNCj4gPiAr
ICAtIHJlc2V0cw0KPiA+ICsgIC0gaW50ZXJydXB0cw0KPiA+ICsNCj4gPiArdW5ldmFsdWF0ZWRQ
cm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ICsNCj4gPiArZXhhbXBsZXM6DQo+ID4gKyAgLSB8DQo+ID4g
KyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svYXNwZWVkLWNsb2NrLmg+DQo+ID4gKyAg
ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPg0K
PiA+ICsgICAgaTJjQDgwIHsNCj4gPiArICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+ID4g
KyAgICAgICNzaXplLWNlbGxzID0gPDA+Ow0KPiANCj4gUGxlYXNlIGZvbGxvdyBEVFMgY29kaW5n
IHN0eWxlLg0KDQpJIHdpbGwgdXBkYXRlIHdpdGggZm9sbG93aW5nLg0KICAgIGkyY0A4MCB7DQog
ICAgICAgIGNvbXBhdGlibGUgPSAiYXNwZWVkLGFzdDI2MDAtaTJjLWJ1cyI7DQogICAgICAgIHJl
ZyA9IDwweDgwIDB4ODA+LCA8MHhjMDAgMHgyMD47DQogICAgICAgICNhZGRyZXNzLWNlbGxzID0g
PDE+Ow0KICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4g
S3J6eXN6dG9mDQoNCg==

