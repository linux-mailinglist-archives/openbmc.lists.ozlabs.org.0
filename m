Return-Path: <openbmc+bounces-263-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 689B8AE101B
	for <lists+openbmc@lfdr.de>; Fri, 20 Jun 2025 01:45:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNcg33nG0z30T8;
	Fri, 20 Jun 2025 09:45:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750316036;
	cv=pass; b=i7Ba4O+pJQ16SkMe0936ZMdWHhslhLCxowC/1LcKRChONLDugVtLXlJPjJJfehim3Ej7SN0D2AD4eSkZgz/6jBCBrD6y1qs+784WP4w8F3XJdKKfExFmfptcM6tOIA6tGZjkn+d96HJj8M6Zz0DanpsNY4TMUbhIzdnj//3R/7CTDNKEu/ESk9VLcHlijBXoGXybxEXVSCXwT9vfBh11MjjBnXIbyeGFiFHPXov8o7kYp9j/kFpzAkKEPl2LHcSsufBm0oWDEAVe24W3FhVddkNDUnHwif1/nrLBCohyzXZ9fGFQvqE/ZBn7pR1OxzCZwpxngk5EhgLiGOePXq0Bhw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750316036; c=relaxed/relaxed;
	bh=rE9XWEIhbIWtEp5eNt8/jZfH7v7JrL44KGaHAnXyTGc=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZXBsCw3qzxM8zL8NzjAJY0p8HDcdgfkd1+fbWmY0P0OhzIDxw36xhgen4xzKtO48SBaCsvaask68foXxMGTGFrshTpkekcR+5Igd0iZPzv087toLj8k2gmRBwAuCWL+7xIpCCbaI7kHJnb8yd/sMBDpYzj5UyEX0PIAOoSF+cgqBPHVoqBCjJDDYTgqeJMTKi7VC256feGRR4PHdscUSsE9+FkjOhXE1X2tE9e/pdfRShawOE2O+yiLwq+KtxUTpIwEFIOA8lDn506NRdS+jQCY3xGfdiBO+4lRHyPPlO98mQcAiSS9knD/J3NW7yV9SdNHn2TUCReG4ySmgJPC9nQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=rDLwxyxL; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=cool_lee@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=rDLwxyxL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=cool_lee@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNBCh4G36z2xS2;
	Thu, 19 Jun 2025 16:53:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9UCXlQmKevljnVFrhyz+GBLn8EQHMh42TyBndMP+T9uJHvtqFXA9bZsLpwvzEh/gm7ANEtH1+OpsFAI4GTe2etKiGA/e80kffYY8k+NeVltUrpFQMM4eMwOYa2iBMuUrzheSSlLaEcEFJmNPWDDs3JVd3JgN8/n4G7p+i8GBu0AFmhj17EsZMmWXeR9qge+q3YaUVGObYzJmYM/99/SuzQJH3Afm+UaIg83RxxsLi4+2DY/lpCX0csJZV6JmBthhtLVLox636fjn69lt5FX9dN6CYJazMRee3xY6qWmIqztEXlf20jVNuKaNhnKGKTmd9uV3g7YcNGrcuxnsRkQRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rE9XWEIhbIWtEp5eNt8/jZfH7v7JrL44KGaHAnXyTGc=;
 b=jzmFprzRBqFeEksqFFdNaDAIC154UMs2t7XOKlfYTbIw84z8WnDGGOwiNvg2jZzXW7tHZS6B3dNixlrcejLDogjhNtqpUM9aFBNGYozlvWZZ2vqRWpPS72bpGAIB75zRzE7XjwE2aTu+Tb9pe//YeJa3UJpb4AxnJBFx+vuH+xkkVolcb458DGMEWbPqycj60NUszY+D0QB3BW2jnsC9T0VM9o++LEbDf+rzwP3RjjPISL3rAhozPzolWRVh/f/AsjUu5aJ6QclIw1HMc+dfuIiiIIUuTOgoBDeC+qTGOlxGq9dLesX2PxwPUZuLfYnV5dzvCzRZVf0eveXRWBM3ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rE9XWEIhbIWtEp5eNt8/jZfH7v7JrL44KGaHAnXyTGc=;
 b=rDLwxyxLJHwUI+uLSpwOj18BHCrds5uXBujSsp2YM2rMbloPjOgRoXsEkbUOSsgjgKUqwCNc6KyM2UK+DQ48TP1BYQBBNOq4sgp2TQSalOVNDdWFAzBSLXQ/Pix4sWwEogeJT8DhXL+HNyspnz1iSY3zS3dJgLRk3WGjxUKVSJgVquRXSHAX+0k9yqcy20uT//bseAa8ujA8PlBMcNL+uH8VkU0y4i4Q7tGnrx6PtEfMFguemGi5Ags70m6OcDWwoO+ISq+Uos0TY/5n74rhxZALxlAKD9vy4wKVkn46yU7cl8pBCpAQtaudY8g+KzGR2NgeB5N1xtO1HJkfBGXsdA==
Received: from TYSPR06MB7068.apcprd06.prod.outlook.com (2603:1096:400:466::8)
 by SEZPR06MB6206.apcprd06.prod.outlook.com (2603:1096:101:e8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.35; Thu, 19 Jun
 2025 06:53:24 +0000
Received: from TYSPR06MB7068.apcprd06.prod.outlook.com
 ([fe80::e1c7:8707:7d43:bbed]) by TYSPR06MB7068.apcprd06.prod.outlook.com
 ([fe80::e1c7:8707:7d43:bbed%4]) with mapi id 15.20.8835.026; Thu, 19 Jun 2025
 06:53:24 +0000
From: Cool Lee <cool_lee@aspeedtech.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, "adrian.hunter@intel.com"
	<adrian.hunter@intel.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Subject: RE: [PATCH 1/8] mmc: sdhci-of-aspeed: Fix sdhci software reset can't
 be cleared issue.
Thread-Topic: [PATCH 1/8] mmc: sdhci-of-aspeed: Fix sdhci software reset can't
 be cleared issue.
Thread-Index: AQHb3/anykUBDV8RQEG+uyGdBhEOerQIRHyg
Date: Thu, 19 Jun 2025 06:53:24 +0000
Message-ID:
 <TYSPR06MB7068A5F04CE0A5BDB03073C0957DA@TYSPR06MB7068.apcprd06.prod.outlook.com>
References: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
	 <20250615035803.3752235-2-cool_lee@aspeedtech.com>
 <80f56269175d8658ba1ab4a1fe9a43d18294ca60.camel@codeconstruct.com.au>
In-Reply-To:
 <80f56269175d8658ba1ab4a1fe9a43d18294ca60.camel@codeconstruct.com.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYSPR06MB7068:EE_|SEZPR06MB6206:EE_
x-ms-office365-filtering-correlation-id: 9d96ee8a-8394-4b5d-f549-08ddaefdfc6c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020|38070700018|13003099007;
x-microsoft-antispam-message-info:
 =?utf-8?B?OVd5VUJXT1NORHN2SzVQVG5YWGJ1UU0zZnE2WTgvaGJpZFllKzIwU3pmTm45?=
 =?utf-8?B?RmdSMU8rOWJydTZHK0tPUnJ3WVo3UmNhYWhBSjJLQkt6c1UwNnEybVVPQTBP?=
 =?utf-8?B?UVorbnBtM3Rlam1NVzBad08yTmNTNnNHUWRRazl4OVV2bTFlVnJYS0dYU1hF?=
 =?utf-8?B?YThjS044MjNldHZjZFZObFBncnExelhtclNJdDdwSzBoK2h2NEJJK2VHeU9K?=
 =?utf-8?B?VHFHTGc2WDIwMzNNVXNFQ2ZvSnB2VFovbEphdUN1d1RkQjZ5bXlSdEJ0OUNw?=
 =?utf-8?B?OFQvU3QyTjg2QXR4WHVoZ2JxdFF1RkVVYVNIOGI1KzNCSERDTkh3YTlqeDFS?=
 =?utf-8?B?M1JsM0hTSmNBaHRtUzYxUTlack8rTnVGTE1GaDJtWUFVa3BZU1FuTXI0QmhO?=
 =?utf-8?B?bHVxemQrRzQwdVM0VjczMUVubXdPT09pWStWTlFoRDhoNVFWUm93RFdMa2ZC?=
 =?utf-8?B?Z2JQMmJYOUJzVVNscUd0Y3dWbmhZMEFhVlNjQU5GeUZjblUyaHBxUm9TS2lp?=
 =?utf-8?B?MnRST0hhNC84azVxeFBQMEUrcjc4amxjRWtISC9KSnI5QkFKK2hBWGhVS3Bz?=
 =?utf-8?B?a3AvWG1DeDd6VG1DYzA2SFk3YTU2N3RWT0dZZUl2a2F0aDBkK3JJWFEraW9I?=
 =?utf-8?B?YmE5VUhIRU1ibHJyTHoxclY2S2ZEVjkyOVMzU1hWbnhGM3R4U0xuTUEwZHJJ?=
 =?utf-8?B?M1dENldtUnRvOUNsUUNxWlRkNE9vcHhzZDdNVXJacHJRZnlZeUYxYnFJQzFi?=
 =?utf-8?B?b1A3VE9yRWUwQ1kvejk5aEJqQWZMNzdkSWVId1ArTkhjNWQ4T09jdEdST0F1?=
 =?utf-8?B?cHFTbzhrWFd4N3JwYkR4aFdhR2g2R3RseURIdXRHSTNWWXFVTmJxM3RnbFEr?=
 =?utf-8?B?WkRZTFoxMjhMTnIwNEYvdkRwTVBaTmNCalV0WjZTbDUxOGR2WE5MNm9JbGc3?=
 =?utf-8?B?ZmRnODE2djg1OE9KbGRDeEV3a0xRMzZuRE43QXRUS0NTNFBlaXBTWUZkcHRW?=
 =?utf-8?B?Zm5qOFExanZoRmhwZ0NtVWxlQU8rRFNrZVhOQk10SzZpSG5vSEtzbHIxaWl4?=
 =?utf-8?B?NjBDWEVJZ3VzRzJqVUpiRFFEeWlpbGY1NkNsVllNZHNxRUdweGcvQVRMVDlC?=
 =?utf-8?B?UEx2Vkl5OGd0bTVzc2sxMWQ5TnN4WmpEWXlzNFpYMERSQUM2RUtZZUNNTUF4?=
 =?utf-8?B?azhzYTYrN285aFFtdnlROHJUejE3YjlSNThFbkI2UDA3WFIyUDliQk9NZ09l?=
 =?utf-8?B?K1hyd1ZZY2w0UHE5M3NPWFVQZmI2NGVxYU95ejV2OXJPZzQ0M3Y4S08yenBv?=
 =?utf-8?B?dG1wa3dnRCt2YWliKzJZSzlCZFY0T3BnYVo4ekVVaHYvYm90UlV6TTZaZW5X?=
 =?utf-8?B?ejBXbzhNMDJFNEFEZVF0WklMQm1hcllWK25TZW1oRytMLzBXeVNHVUZ2K3B0?=
 =?utf-8?B?ZEllK1VyTTVzQ0J6Z2tSaUlDNnlGUVlybnNzNWRhUVJKTGwxWHN1dVcvYmw1?=
 =?utf-8?B?TmYweXA2b0Z1TWJUbER5akVVMmZxOUV5VW9keVM5QS95VkR5dGVETTlrWUg1?=
 =?utf-8?B?Z3o2ZXhIUkQvMGRwNHprRnlDZXZQS2dINldMWWVhdzlwSHJ3bktnZlpSQktI?=
 =?utf-8?B?SG1maVpxaFV3L0ZTbE5vanc1alpOYmw2bEF5Q1JwNEFBVFl6T3lHMlZXb09m?=
 =?utf-8?B?aDN1TkI3Yi9iejEwYlRZNUE0NlQvNm5kVTRqeXhkY2VTelVJMXdPcXFWRWhD?=
 =?utf-8?B?NXRiMFJQUUZnZGdBSmZqM3I0dTJnQk9EaFlkb0Y1STVFVHpVam9oNU1HT29z?=
 =?utf-8?B?bitKbklieU00eEZ1WDBWRjl6UVpzeUxsVVhDWWRxc3lvM1dFV3ExWkR3LzVt?=
 =?utf-8?B?TjVNNW4vMkF0QytBYmNKRDhDeDRjZGhOVmRXNXB4WGZvWVdCYWRkTWhidUNk?=
 =?utf-8?B?WmVsTkxmcUZ4djliOHR1RTZvTk5JZE1OVG5QVzVzSkg2Z2Y1L0R4QmdRVkU5?=
 =?utf-8?B?ekpPY090M0QwV0JIbytwWHFiVWpURXB6dXRhemhJMFZQRGNhaThjcTVzMGNi?=
 =?utf-8?Q?7LXD2I?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR06MB7068.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020)(38070700018)(13003099007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MWFNQ1gveDRLcEZRNmV3eCs5Tnprck45TVFsQkRIWDcwN2Z6L3djYVhDODJr?=
 =?utf-8?B?YVNhVGZNd1NGLzNXYU1IM2VqS3NzNmZETUw5Y1pvNitoNnJNYWgwNGd5RG9M?=
 =?utf-8?B?Q3l2RUo3T3NiRXFjZjlkaEIrUEZDQ2s0UzduZXZlUVVBdEdJRm9WZjlHK05w?=
 =?utf-8?B?cEViZjAzTC9oKzlabFNIZkJSUHY2U2JrRUpRaENxWERDK0ZIUWRwY0RuZitV?=
 =?utf-8?B?OGVSdCthb3ZmN2d1QlRWZDFveVNDNHo3eXUwdy9nQzRocWh1L3FtUEVzelVM?=
 =?utf-8?B?U3JadUt6SHNXcHZaSUZpQnMrSzE3ekhSakF2cDNmUjdnTTExRDBvMUdUeXR2?=
 =?utf-8?B?cnQ4V2dTOW1nS0JpL0MzM1Z2ZndIaGlrOVEyeWVrRnRsM2huT3h6TkEvWnRL?=
 =?utf-8?B?SnNhOE93enF2QlM2T2czMFlkQy9SMkNPY3Q0L2Noelg1eERDMVNlV2hkNUQ5?=
 =?utf-8?B?eWl4VkR2Nmpqb3A4eWl1K3NNaU9mdUJ1NXRqMko2cmFsa3FSNkhvV1B4ZkRt?=
 =?utf-8?B?NitCRGJUSnR5Yi9sd3JJcVhhWHMvWWNGMHRQVk1jbFpwbWE1cXNpb3NmMzJr?=
 =?utf-8?B?bzlQekFmOStreGlwWEtqbnRxNSt0ZjI4TTdvQTUxTEoxTkVEWlAwamdkRmJU?=
 =?utf-8?B?VXJudkhHSWJWek1tdzFxTVgwQ0VsWisyYVozUEF1S0lCb3hFZkNKN2RhR1Bq?=
 =?utf-8?B?Tkk4Ry91ZnB6NnV1cVkwRG1KbEFFYzdZaWx2cWNIRVdPUnZWaTZSSC96M2Yw?=
 =?utf-8?B?OEZOb0Q0bzRiNUtKNUpoK3d3bkVra0g5TVhIL0wydlNDVUJYWUR3cExNakpm?=
 =?utf-8?B?d2IxdysvcnBBY1Rodk5obllRbTdVazNLM3NFMldVenczL2FMcEUxTHJnWlJt?=
 =?utf-8?B?TXkyeFRzbXpDd3I5K1B5emhoT2NhaSttQW5zUGF4c2dhMEtQQzM3cFlqU2tk?=
 =?utf-8?B?QVVMWnZvM0d1ZWV5N096Rld4cGFYTW43RkhSbkxJQW4vd2FUOXc0UDFTQlRm?=
 =?utf-8?B?ZkJRKzd0bnlDQWNuSzAxUEZ4QW9PZVFGMGgrcmNJekZlWUkxU20rWjZwUjNl?=
 =?utf-8?B?NVZMb0ZaT3VIYnZJcDQxdkp4S3d4U1QwOW5CbGpMWE5hZG9oUS9HTDFuVHJM?=
 =?utf-8?B?aVBSa1RPbE9mTFZnakhSYUZaNDJvT3RqUXE1OTlHNXBwUWlHOENGTGFUUmJ2?=
 =?utf-8?B?NzRHNVh1SFJsNEdnRjZ6d0ppaldzazV2bXIrYXp6aU5QdjJuMUtlSHVzVE84?=
 =?utf-8?B?czBNblQ2bDdWUE9XOW5EeC9YamhFL0Zlei96bUdlQ1Y2QkwwUnNZNVA1b0Ix?=
 =?utf-8?B?Unc1N1VveUw3S1puUWdlSkNXTDJXN0ZBNEd3MjJRVG5KekVDVTk5WitFNVll?=
 =?utf-8?B?ZHpjcVhuUU9JOVBTMitBYWFxZWlvRXRxZHFMZklBUlZpUTlHTXJEcCtWY1Jm?=
 =?utf-8?B?b2FDdmY4UUJTM2pFUUUyQk1PSDZXd0gzaWF2Tk5hcWxUWjNNaldwdjN1OHdv?=
 =?utf-8?B?cUZYamJYMVN2WlR5dW9qNHNqN1F5SlJEb3ZkZ0pYQk5JWEQ0OEt4NGt4Nm1G?=
 =?utf-8?B?cndKZmdLMFNSNy9FczZXNzViQklYNkUwZld4NGxwS1pHRG5oMWR6WGFJd3Zn?=
 =?utf-8?B?SitHWWpTampVK2gxK1Z2bzdKZmVJalFld0x2b0p5SkU2Yng1bUF0a2ZiUnJP?=
 =?utf-8?B?UHlPUE9sWWhmemhya3FuRTIvNU4wTmhCV0Z0U3d6U25rTVlIcDZiY09BaUNO?=
 =?utf-8?B?dkkzNTF3TkFkMTFzRVVWOE02STBZTEtQdXJKTXFBaDhFbU9PRVFnUkxqUlZh?=
 =?utf-8?B?dWFTN1ZKSHVBazFGUW9Wbmg1WkpHTmloRXRab0V2cW5SdjloallQSTVNS1lZ?=
 =?utf-8?B?bUhySXN2ZjhMVVE4QXkwUk1pTnh4UzJpeFIxQkVFNm5KaVBKNXIvZk5TSGJl?=
 =?utf-8?B?NDNJZnpsSEZWamtQd1gyemhwUGVuWEtqcGgwT2pKUmlvbWM0dlpyMU9pYU9Q?=
 =?utf-8?B?ZHpzNG5Xc1R2a3MwaDJOQXVRTWpuVUlneDVLN2xUVk5oWm1BNjg2YjJyelpz?=
 =?utf-8?B?ZUIyTFl6MDMzNFAxajJPNE5hTENqYmhTdFQxai81aWloM3VnaGtrdEl0eDMv?=
 =?utf-8?Q?b2/tlMjKkVuyxxX1SSHmdlUQD?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYSPR06MB7068.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d96ee8a-8394-4b5d-f549-08ddaefdfc6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 06:53:24.0870
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rTnbwdc4Du9v1egvYmNGQxpylpgisZLoZ9QxRLDF/BY2qDsj36hXruUn242IotpZhq9jLKg6qhrFJ4SbLW/Y3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6206
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

DQo+ID4gUmVwbGFjZSBzZGhjaSBzb2Z0d2FyZSByZXNldCBieSBzY3UgcmVzZXQgZnJvbSB0b3Au
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDb29sIExlZSA8Y29vbF9sZWVAYXNwZWVkdGVjaC5j
b20+DQo+IA0KPiBDYW4geW91IHBsZWFzZSBhZGQgYSBGaXhlczogdGFnPw0KVGhpcyBwYXRjaCB3
YXNuJ3QgdXNlZCB0byBmaXggYSBjb21taXQuIFRoaXMgaXMgYSB3b3JrYXJvdW5kIGZvciBhIGhh
cmR3YXJlIGJ1Zy4NCkZvciB0aGlzIGNvbmRpdGlvbiwgZG8gSSBuZWVkIGEgRml4ZXM/DQoNCj4g
DQo+ID4gLS0tDQo+ID4gwqBkcml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLWFzcGVlZC5jIHwgNTUN
Cj4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4gPiDCoDEgZmlsZSBjaGFuZ2Vk
LCA1NCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1vZi1hc3BlZWQuYw0KPiA+IGIvZHJpdmVycy9tbWMvaG9z
dC9zZGhjaS1vZi1hc3BlZWQuYw0KPiA+IGluZGV4IGQ2ZGUwMTA1NTFiOS4uMDFiYzU3NDI3MmVi
IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktb2YtYXNwZWVkLmMNCj4g
PiArKysgYi9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLWFzcGVlZC5jDQo+ID4gQEAgLTEzLDYg
KzEzLDcgQEANCj4gPiDCoCNpbmNsdWRlIDxsaW51eC9vZi5oPg0KPiA+IMKgI2luY2x1ZGUgPGxp
bnV4L29mX3BsYXRmb3JtLmg+DQo+ID4gwqAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNl
Lmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9yZXNldC5oPg0KPiA+IMKgI2luY2x1ZGUgPGxpbnV4
L3NwaW5sb2NrLmg+DQo+ID4NCj4gPiDCoCNpbmNsdWRlICJzZGhjaS1wbHRmbS5oIg0KPiA+IEBA
IC0zOSw2ICs0MCw3IEBADQo+ID4gwqBzdHJ1Y3QgYXNwZWVkX3NkYyB7DQo+ID4gwqDCoMKgwqDC
oMKgwqDCoHN0cnVjdCBjbGsgKmNsazsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHJlc291
cmNlICpyZXM7DQo+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IHJlc2V0X2NvbnRyb2wgKnJzdDsN
Cj4gPg0KPiA+IMKgwqDCoMKgwqDCoMKgwqBzcGlubG9ja190IGxvY2s7DQo+ID4gwqDCoMKgwqDC
oMKgwqDCoHZvaWQgX19pb21lbSAqcmVnczsNCj4gPiBAQCAtMzI4LDEzICszMzAsNTggQEAgc3Rh
dGljIHUzMiBhc3BlZWRfc2RoY2lfcmVhZGwoc3RydWN0IHNkaGNpX2hvc3QNCj4gPiAqaG9zdCwg
aW50IHJlZykNCj4gPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHZhbDsNCj4gPiDCoH0NCj4gPg0K
PiA+ICtzdGF0aWMgdm9pZCBhc3BlZWRfc2RoY2lfcmVzZXQoc3RydWN0IHNkaGNpX2hvc3QgKmhv
c3QsIHU4IG1hc2spIHsNCj4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qgc2RoY2lfcGx0Zm1faG9z
dCAqcGx0Zm1fcHJpdjsNCj4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgYXNwZWVkX3NkaGNpICph
c3BlZWRfc2RoY2k7DQo+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGFzcGVlZF9zZGMgKmFzcGVl
ZF9zZGM7DQo+ID4gK8KgwqDCoMKgwqDCoMKgdTMyIHNhdmVfYXJyYXlbN107DQo+ID4gK8KgwqDC
oMKgwqDCoMKgdTMyIHJlZ19hcnJheVtdID0ge1NESENJX0RNQV9BRERSRVNTLA0KPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgU0RIQ0lfQkxPQ0tfU0la
RSwNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFNE
SENJX0FSR1VNRU5ULA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgU0RIQ0lfSE9TVF9DT05UUk9MLA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgU0RIQ0lfQ0xPQ0tfQ09OVFJPTCwNCj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFNESENJX0lOVF9FTkFCTEUs
DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBTREhD
SV9TSUdOQUxfRU5BQkxFfTsNCj4gPiArwqDCoMKgwqDCoMKgwqBpbnQgaTsNCj4gPiArwqDCoMKg
wqDCoMKgwqB1MTYgdHJhbl9tb2RlOw0KPiA+ICvCoMKgwqDCoMKgwqDCoHUzMiBtbWM4X21vZGU7
DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqDCoHBsdGZtX3ByaXYgPSBzZGhjaV9wcml2KGhvc3Qp
Ow0KPiA+ICvCoMKgwqDCoMKgwqDCoGFzcGVlZF9zZGhjaSA9IHNkaGNpX3BsdGZtX3ByaXYocGx0
Zm1fcHJpdik7DQo+ID4gK8KgwqDCoMKgwqDCoMKgYXNwZWVkX3NkYyA9IGFzcGVlZF9zZGhjaS0+
cGFyZW50Ow0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgwqBpZiAoIUlTX0VSUihhc3BlZWRfc2Rj
LT5yc3QpKSB7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZvciAoaSA9IDA7
IGkgPCBBUlJBWV9TSVpFKHJlZ19hcnJheSk7IGkrKykNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNhdmVfYXJyYXlbaV0gPSBzZGhjaV9yZWFkbCho
b3N0LA0KPiA+ICtyZWdfYXJyYXlbaV0pOw0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgdHJhbl9tb2RlID0gc2RoY2lfcmVhZHcoaG9zdCwNCj4gU0RIQ0lfVFJBTlNG
RVJfTU9ERSk7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG1tYzhfbW9kZSA9
IHJlYWRsKGFzcGVlZF9zZGMtPnJlZ3MpOw0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgcmVzZXRfY29udHJvbF9hc3NlcnQoYXNwZWVkX3NkYy0+cnN0KTsNCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbWRlbGF5KDEpOw0KPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqByZXNldF9jb250cm9sX2RlYXNzZXJ0KGFzcGVlZF9zZGMtPnJz
dCk7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG1kZWxheSgxKTsNCj4gDQo+
IFNlZSBjb21tZW50IGJlbG93IHJlZ2FyZGluZyBjbG9jay9yZXNldCBiZWhhdmlvdXIgYW5kIGlt
cGxlbWVudGF0aW9uLg0KPiANCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHJlZ19hcnJheSk7IGkrKykNCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNkaGNpX3dyaXRlbCho
b3N0LCBzYXZlX2FycmF5W2ldLA0KPiA+ICtyZWdfYXJyYXlbaV0pOw0KPiA+ICsNCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc2RoY2lfd3JpdGV3KGhvc3QsIHRyYW5fbW9kZSwN
Cj4gU0RIQ0lfVFJBTlNGRVJfTU9ERSk7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHdyaXRlbChtbWM4X21vZGUsIGFzcGVlZF9zZGMtPnJlZ3MpOw0KPiA+ICsNCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYXNwZWVkX3NkaGNpX3NldF9jbG9jayhob3N0LCBo
b3N0LT5jbG9jayk7DQo+ID4gK8KgwqDCoMKgwqDCoMKgfQ0KPiA+ICsNCj4gPiArwqDCoMKgwqDC
oMKgwqBzZGhjaV9yZXNldChob3N0LCBtYXNrKTsNCj4gDQo+IEdpdmVuIHRoYXQgd2UgZG8gdGhp
cyBhZnRlciB0aGUgU0NVIHJlc2V0IGFib3ZlLCB3aGF0IGV4YWN0bHkgaXMgdGhlIFNDVSByZXNl
dA0KPiBmaXhpbmc/IENhbiB5b3UgcHJvdmlkZSBtb3JlIGRldGFpbHM/DQpUaGUgaXNzdWUgaXMg
c2RoY2kgU29mdHdhcmUgUmVzZXQgQUxMICgweDEyQ1syNF0pIGNhbm5vdCBjb21wbGV0ZSB3aGlj
aCBtZWFucyBpdCdzIGFsd2F5cyBiZWluZyAxIGFuZCBub3QgYmFjayB0byAwLg0KVGhlIHJvb3Qg
Y2F1c2UgaXMgd2hlbiBzZGhjaSBkbWEgb3BlcmF0ZXMsIGl0IG1pZ2h0IGhvbGQgc29tZSBzdGF0
ZSBzaWduYWxzIHdoaWNoIGlzIG5vdCB3ZWxsIGNsZWFyZWQgYnkgU29mdHdhcmUgUmVzZXQuIFRo
ZXNlIHNpZ25hbHMgcHJldmVudCBTb2Z0d2FyZSBSZXNldCB0byBiZSBjbGVhcmVkLg0KVGhpcyBp
cyBhIGhhcmR3YXJlIGlzc3VlIHNvIHRoYXQgdGhlIHdvcmthcm91bmQgaXMgcmVzZXR0aW5nIHdo
b2xlIFNESENJIGNvbnRyb2xsZXIgZnJvbSBTQ1UgcmVzZXQuDQoNCj4gDQo+ID4gK30NCj4gPiAr
DQo+ID4gwqBzdGF0aWMgY29uc3Qgc3RydWN0IHNkaGNpX29wcyBhc3BlZWRfc2RoY2lfb3BzID0g
ew0KPiA+IMKgwqDCoMKgwqDCoMKgwqAucmVhZF9sID0gYXNwZWVkX3NkaGNpX3JlYWRsLA0KPiA+
IMKgwqDCoMKgwqDCoMKgwqAuc2V0X2Nsb2NrID0gYXNwZWVkX3NkaGNpX3NldF9jbG9jaywNCj4g
PiDCoMKgwqDCoMKgwqDCoMKgLmdldF9tYXhfY2xvY2sgPSBhc3BlZWRfc2RoY2lfZ2V0X21heF9j
bG9jaywNCj4gPiDCoMKgwqDCoMKgwqDCoMKgLnNldF9idXNfd2lkdGggPSBhc3BlZWRfc2RoY2lf
c2V0X2J1c193aWR0aCwNCj4gPiDCoMKgwqDCoMKgwqDCoMKgLmdldF90aW1lb3V0X2Nsb2NrID0g
c2RoY2lfcGx0Zm1fY2xrX2dldF9tYXhfY2xvY2ssDQo+ID4gLcKgwqDCoMKgwqDCoMKgLnJlc2V0
ID0gc2RoY2lfcmVzZXQsDQo+ID4gK8KgwqDCoMKgwqDCoMKgLnJlc2V0ID0gYXNwZWVkX3NkaGNp
X3Jlc2V0LA0KPiA+IMKgwqDCoMKgwqDCoMKgwqAuc2V0X3Voc19zaWduYWxpbmcgPSBzZGhjaV9z
ZXRfdWhzX3NpZ25hbGluZywNCj4gPiDCoH07DQo+ID4NCj4gPiBAQCAtNTM1LDYgKzU4MiwxMiBA
QCBzdGF0aWMgaW50IGFzcGVlZF9zZGNfcHJvYmUoc3RydWN0DQo+ID4gcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQ0KPiA+DQo+ID4gwqDCoMKgwqDCoMKgwqDCoHNwaW5fbG9ja19pbml0KCZzZGMtPmxv
Y2spOw0KPiA+DQo+ID4gK8KgwqDCoMKgwqDCoMKgc2RjLT5yc3QgPSBkZXZtX3Jlc2V0X2NvbnRy
b2xfZ2V0KCZwZGV2LT5kZXYsIE5VTEwpOw0KPiA+ICvCoMKgwqDCoMKgwqDCoGlmICghSVNfRVJS
KHNkYy0+cnN0KSkgew0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXNldF9j
b250cm9sX2Fzc2VydChzZGMtPnJzdCk7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQoc2RjLT5yc3QpOw0KPiA+ICvCoMKgwqDCoMKgwqDC
oH0NCj4gPiArDQo+IA0KPiBUaGUgY2xvY2sgZHJpdmVyIGZvciB0aGUgQVNUMjQwMCwgQVNUMjUw
MCBhbmQgQVNUMjYwMCBtYW5hZ2VzIHRoZSByZXNldCBhcw0KPiBwYXJ0IG9mIG1hbmFnaW5nIHRo
ZSBjbG9ja1sxXVsyXS4NCj4gDQo+IFsxXToNCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycw0KPiAv
Y2xrL2Nsay1hc3BlZWQuYz9oPXY2LjE2LXJjMiNuNzENCj4gWzJdOg0KPiBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJl
ZS9kcml2ZXJzDQo+IC9jbGsvY2xrLWFzcGVlZC5jP2g9djYuMTYtcmMyI24yMDkNCj4gDQo+IFdo
YXQgeW91IGhhdmUgaGVyZSBhc2tzIGZvciBhIHJlc2V0cyBwcm9wZXJ0eSwgYnV0IHRoYXQncyBu
b3QgY3VycmVudGx5DQo+IHNwZWNpZmllZCBpbiB0aGUgZGV2aWNldHJlZSBiaW5kaW5nLg0KPiAN
Cj4gU286IGlzIHRoZSBjbG9jayBkcml2ZXIgbm90IGRvaW5nIHRoZSByaWdodCB0aGluZyBnaXZl
biB3ZSBlbmFibGUgdGhlIGNsb2NrDQo+IGRpcmVjdGx5IGJlbG93IHRoaXMgaHVuaz8gSWYgbm90
LCBzaG91bGQgd2UgZml4IHRoYXQgaW5zdGVhZD8NCj4gDQo+IFdlIGNhbiBhZGQgdGhlIHJlc2V0
cyBwcm9wZXJ0eSB0byB0aGUgYmluZGluZywgYnV0IEknZCBhbHNvIGxpa2UgYSBiZXR0ZXINCj4g
ZXhwbGFuYXRpb24gb2YgdGhlIHByb2JsZW0uDQpGb3IgbGVnYWN5IHByb2plY3RzLCB0aGUgY2xv
Y2sgcHJvcGVydHkgaGFuZGxlcyByZXNldCBzaW11bHRhbmVvdXNseSBpbiB0aGUgY2xvY2sgZHJp
dmVyLg0KRm9yIG5ldyBwcm9qZWN0IEFTVDI3MDAsIGNsb2NrIGFuZCByZXNldCBhcmUgc2VwYXJh
dGVkLCBhbmQgd2UgYWRkIGEgcmVzZXQgcHJvcGVydHkgdG8gdGhlIGJpbmRpbmcuDQpIZW5jZSwg
dGhlIHBhdGNoIHdvbid0IGFmZmVjdCB1bnRpbCB0aGUgcmVzZXQgcHJvcGVydHkgdG8gdGhlIGJp
bmRpbmcuDQpTaG91bGQgSSBhZGQgdGhlIHJlc2V0IHByb3BlcnR5IGluIHRoaXMgcGF0Y2ggc2Vy
aW91cz8NCg0KPiANCj4gQW5kcmV3DQo=

