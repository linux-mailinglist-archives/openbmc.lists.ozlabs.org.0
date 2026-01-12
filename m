Return-Path: <openbmc+bounces-1156-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A80AED109E6
	for <lists+openbmc@lfdr.de>; Mon, 12 Jan 2026 06:23:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqLPM5rsCz2yrt;
	Mon, 12 Jan 2026 16:23:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.201.87 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768190809;
	cv=pass; b=BiIYKIA7Epv/dIF8I0gQJzZLjEYeZESHsTwykJgufpgCed6+ncrMCTcXA/kMLvrte28/XM8kc6CvFqGeWQGFPEN4NyzNb8LmS0ICvmpdeyZpsVKOcZS2kiI4wFSj4skATv+BOa7sUukF5gG1uJTCP4RpqHYnqwMnwEGkz86LL1LN8Rnx3xjYHlmLIzvcvQUT+OvWuKB8luRoP3ikUPRw7FwN6nlYpfZl/QARnPTDKCSNf3y7/pt5wtgMVdRsJWilEKtT6d83nZZ4u5Uspu3NPZEtNtAA3CEY3C8M3HVKGssN+gjNvVa1OkoaV96ltx4jeLUFX6Idr7y1s+gpgUZ4Zg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768190809; c=relaxed/relaxed;
	bh=MymatGWbs/DYLMTWNAiQqXQORnJbhbejH4N5XRc7M70=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hSxfOfpZtNRwgja7UOub6xRzyZsKcgzU5kO7sTDvXcR2cOhU0CkJEfbmjzu6zsCgKh+YL5Kaa9Y99V1Cy5RB2qeMl9PyL7HHPEdGV2j/jkfVCjQMxACERoTJ8zNZQc7xge11VhyCt0fTFPoyzF9GSqg4wXWDcxp+Bn7eWdpKe44w4X3fDMSUfsd96cjPY9p8oV0NiIolFPH1HvFm7IsWaUBIYYemJWf8zPlQvYG/RNqwnkb4Ux/wCMl6k4m4CNrPAcl7LjD1/IQVzDu+7KrksmJ2I4SEQ/o9fqMcX8/XeBlKBjfUPyRT09cGXz2raOm+dB+5f9gc8p/l8wcHNS/Erg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=PWO6IaZA; dkim-atps=neutral; spf=pass (client-ip=52.101.201.87; helo=ph7pr06cu001.outbound.protection.outlook.com; envelope-from=kchiu@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=PWO6IaZA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=52.101.201.87; helo=ph7pr06cu001.outbound.protection.outlook.com; envelope-from=kchiu@axiado.com; receiver=lists.ozlabs.org)
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11020087.outbound.protection.outlook.com [52.101.201.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqJjM5tTXz2yhX
	for <openbmc@lists.ozlabs.org>; Mon, 12 Jan 2026 15:06:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QXIn2hqXORyh/f9jnrEn+KcC2E+wA3geAJwNH9rsKNwU2OKKKD3h7zHiAu7sFgzqj81LZPi0gPeXTStOST1FGXhj+6xdtqyg4RAtNDAwfH2ttR+pkI76L2keL09FK9iEUL/qiCxD6smRQK9MpAhyw/rT1WipI+NEG5GqacvYPHxpr2kkmSY9OVa6+toRqG2dx0nJvJVLBeIAFHoa11Em6M8ZquyhJg5KdmbOuvEOigjz4ylAcD0wRrEdHPp12w60G4+z+kB+irRfKirRH43hwx5a+nZP5yavOmi8f8kqZcWuXdb1YUbfrr4dsogL+mDmtmkp/ps6lJ3ZWJDVhLHWuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MymatGWbs/DYLMTWNAiQqXQORnJbhbejH4N5XRc7M70=;
 b=ZIit9DMHXRkkJSGprmcp1dG5/6LPpx/fW9EWRgFoqWMfIgAn0f54fbelaqYUHDVqRR2ZNFfB+C20I8VBRa6Gg+1WTgzJXwH+zT3pV3dm+hIbwAuCxmxhEZfOQzJVjrVSOnqkHpX9Gp7Q38Bqh/xr4hilnbTCT1qiTH4RBnQdCkK5BsDAbkNYqDx5O+u2yefm6+gFlaGo3YeFq0Co9Pu+dzMa7qDEIuC/pgU47FOzMClgaOkKuwRBRbuQg7qL9p4y2QBlzordISChVXE//ShKXnwmDsNM8ZELz47qVh6GATaZ+wvwBR9btItV33YgCsWVv1k6JT/D5RclbzTRuX2VRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MymatGWbs/DYLMTWNAiQqXQORnJbhbejH4N5XRc7M70=;
 b=PWO6IaZA/rW6pB7TMlfN7XdwIFDyVdFy5Z/5RYInBN23rGdO2sACEMozPzqh/xLQKzfjlkwvRvocCdIkcXJ1ks2eF05/vOEL7NHkWwgkmylhULtfJsMCC4IsQjqRR7H4uT63FDekyhSIyzk4ECEmJvUwnO3BhMfE66nH6QratilAJLkpvKEJ0HkXg0oae28dMwbTOkqS2fCmP55NEF/FVaNZuKLezR4ondCxPaw1AKehNBMgenMioJ4vl8fxuJxT16vzj+jbcbk6rKxOkOS2M0WzcZR6ZUJyT4wX8+jiZ5lAzikO3fG195QQ/36+ygk1x2GeuF359yOfa2c9x5h1qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from SJ0PR18MB4479.namprd18.prod.outlook.com (2603:10b6:a03:37f::19)
 by CO6PR18MB3971.namprd18.prod.outlook.com (2603:10b6:5:34a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 04:06:06 +0000
Received: from SJ0PR18MB4479.namprd18.prod.outlook.com
 ([fe80::2bc8:6a5c:b10f:9e21]) by SJ0PR18MB4479.namprd18.prod.outlook.com
 ([fe80::2bc8:6a5c:b10f:9e21%6]) with mapi id 15.20.9499.002; Mon, 12 Jan 2026
 04:06:06 +0000
Message-ID: <20c8a4e6-ef9c-452a-ab21-446e7de66d56@axiado.com>
Date: Mon, 12 Jan 2026 12:06:02 +0800
User-Agent: Mozilla Thunderbird
Subject: [PATCH linux dev-6.12 v2 0/6] Add device tree for Axiado AX3000 EVK
To: Andrew Jeffery <andrew@codeconstruct.com.au>, openbmc@lists.ozlabs.org,
 joel@jms.id.au
References: <20260109060254.1575868-1-kchiu@axiado.com>
 <150ed77b60b22670766fcc1607fe696c0708acce.camel@codeconstruct.com.au>
Content-Language: en-US
From: Kuan-Jui Chiu <kchiu@axiado.com>
In-Reply-To: <150ed77b60b22670766fcc1607fe696c0708acce.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TPYP295CA0034.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::14) To SJ0PR18MB4479.namprd18.prod.outlook.com
 (2603:10b6:a03:37f::19)
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR18MB4479:EE_|CO6PR18MB3971:EE_
X-MS-Office365-Filtering-Correlation-Id: 1281e83f-c589-4820-4f66-08de518fe89e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bkFLZGhZWWlkOXFDYnN3T1AxOU14dG0rbVZzbHk1NEFoekFYZ0lCbVJhYXI2?=
 =?utf-8?B?QnFDSmRzNkU4WVNYM0xaT1BtK0kyTm9sUS90V21meTAyUGRVeVI3SWZnUWoy?=
 =?utf-8?B?NFJoMGQ1L1Iza3NFdCtSYTBUQ0RkaDFtRDhhS2h5ckNJcjIvazhzd3h2QW9r?=
 =?utf-8?B?SzJ4ZU5abU5pakZGN2xLSzk2OE9iM0gzWTB1S2lmdkNNUDlEV2gvWi9VamJs?=
 =?utf-8?B?UUlXcnU0ZlBiL1FUWWVpWkEzL1BmWitTdHBWYzloVVp2YlFreEFneGw5OVNG?=
 =?utf-8?B?ZXBaU0lJdjN0NzJ4MFRJZG5JeElzS1ljdkRrSlRxeE1KZXNEZyt4dmkwekF6?=
 =?utf-8?B?SGdHak9SSjNGN2FxeWE4R2FUVk53WXYzVXZ1MlVoMGFzKzVzZ0N3QWRpd0FH?=
 =?utf-8?B?aFh2Qk0wZ1NFeFQyR3E1U1lFY1I3TnpWQkxKMk5CeXBvSlBXS3pDQUtyb0gz?=
 =?utf-8?B?Q0tiYk11S09BZjUzYmRTODZEbjdKU1lJbDh4STNVbkRzVGpzc0FsYjFoNVFM?=
 =?utf-8?B?REVIRXY3UWpyMWpmN045TndWNUs0R0ppckJJNG9VM01FTmoyV1Q5aTcwM3do?=
 =?utf-8?B?a1FhblA4N2ljKzQvOEVQaGk3UlBLMHpvUmsyNEhiWDJ6dWYzWi80c0dEdmhn?=
 =?utf-8?B?RFExT1hXWUhsWDNRM3BnMnVtYlRKNkw2NVNhYzN4YTBTTEdGQ0JNSXdRK2JI?=
 =?utf-8?B?amxVTm5mbkpVUllISE5FU09OcUZUQ2hIZTE2a1MxZVdubXdEcXZFb3ZSUFZh?=
 =?utf-8?B?VVBiaHR2b2NUWnluOVpnSVF2dWlhL2tYZUc0NFk3VzZhTDhoR1NydzVZZlBl?=
 =?utf-8?B?RjcyODBUeVhyRVZRM21tOHQrMUk3clkzdWxOS3hYRGRucGRqbUpvbFZPK0FE?=
 =?utf-8?B?YUZaa0NkS2taWmw0SVpXTnFYZ0dNZGk4R1BqT3FDRTYyTG5Yd0phTEVWZ3R2?=
 =?utf-8?B?QjVkSERBL0JUbmdkeVdYM3dMOHlKMmxOQ1ZvNjJ1ZE93V1RIY0lXcWsxZXNR?=
 =?utf-8?B?N29sR3daSk92U293L1hEVzJFQ3p5MU5VYmpsdFJ0L0lPa1V6SkhkL0xFTjg3?=
 =?utf-8?B?cEpGaFAvZjhlRzIvZkZKakNwaVNKdWVwZDlRUi9vZ2Z3eGl4MGN3ZlZUamMx?=
 =?utf-8?B?dGFuMVNxM0FJRFFwTFR3eUVad0UrdlpSZHd2ZWlaWE5TNFJxMFIxOHk4Y1Bp?=
 =?utf-8?B?R21rTEEwTW1pdlRQOXB5c1A2WCtoL2p3bC9aVVBGNk42Y3ZzelpWMkxhTm03?=
 =?utf-8?B?UlNXQjlnL1ZqVmhnTkh4OWVPLy8rYjVpZDJDZ1ZqUVlmV1FYZ2F3ZVpySi9V?=
 =?utf-8?B?d21hRHNWakpkUnVBajBjWkRjNXZYUUdzRTQwb01ZMHJLVy9Tb1NROEJIeFUw?=
 =?utf-8?B?dXkrSCtqMDRyVE82cUg3TmZuYlpKR0JlaGZ3THFURjJCbEcwclUvT2xTYUlD?=
 =?utf-8?B?WlJ3Z1lZR3ZTU3JDNGsxbVBLVnlITmNaUGtlUWpraXBlc3QzL1o4d2h1WXJw?=
 =?utf-8?B?eWVRNUVoNzEyc3ZCME5JRVp5QjZzblN6NndNSlpDcWdWNjNxb2d3UTJIbTdB?=
 =?utf-8?B?TEh4Q2JKRTlGZ1hJczREVnlJRExmR1dIMXpBUjR1bFIrWVJ6cFR4K0kwVEFo?=
 =?utf-8?B?cHhwU2FndDVZRk11MitadTI1cWpNcU1EKzFvem00Vy9idG1LaVBFR25oUnJS?=
 =?utf-8?B?c3F4cWlxaWpJNDBKZU1sNDJ5V0Y1NHJPOEMzTm1oWllpY3hXQThFM0dITGdl?=
 =?utf-8?B?Z20yV2ZwZGFFM1pEZU85WlVScW5va1ZYV2U5K29FSXNMcE1IYld5Q3NHWnQ2?=
 =?utf-8?B?TVIrRjgxbGdkcFdRWTM2N2RwTks5ZWVmOVJtQTBQckd5cUc1NHI3RUkyTnlY?=
 =?utf-8?B?dVpqdVlwQ0E2OUhld1g5b2g4WjJpZUh6UEoxR00wQ2U5MW1pU0dibng5OE1X?=
 =?utf-8?Q?OIuHQXZAevkAzcl6ePuLSSQoJ2t38da/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR18MB4479.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjZCMTVqallabnhBQ0dVWXpkSUNZMnpVSU1PampBSnRJTWptcndNb3M1MFN5?=
 =?utf-8?B?eFdmOHRndDhPS1h2WGxuQlgwc0ExMW9TRVlxMW5tUlI1MTVPaGxqY2dQZlRB?=
 =?utf-8?B?UzJzRldiZklDZU85ajd0TmpmMDNybHkvVzhKSmwwUEpmZHNHb0MvUFVSNVQv?=
 =?utf-8?B?bHZSZ2hkYnRqNkhRTThmdjZmcnFJT3dTZkpHRndMaUM2TjhXV2RQVVlnTjJS?=
 =?utf-8?B?MFN0UERUbDFCZVB5aHNzYmpFaE5xaldpTnlPcXdQRWZ3TU11Vmg4TWtTNzA4?=
 =?utf-8?B?N3Nqc1FuOU9EYTl5UmxGbktZalBhU0FmeVQ3aEJZbllITE9LMitkc2FLVGYv?=
 =?utf-8?B?MkFmOGU2ZVFobC9JMDZvTkFuOUV4UDVjcW9QRjBXWXBoMk1MU0tYUjdmUHpz?=
 =?utf-8?B?a2VkMU52VHg0R3ZRVHV5RSt0MHk4WkNjL293dUFydEJlT3o0Mm1vSnErMWhC?=
 =?utf-8?B?NXZ2MGJZMlVLUmJwVmkreWtWNi94dFpkdzZaZU1sei9GOXVvQzlGM2ZvaFRG?=
 =?utf-8?B?V3hhdGllMWNRbGh6WHZxNzFQRENUYy84aktCd1dIcEVKUkNUM1Y0clgrUUN1?=
 =?utf-8?B?cGZmcnljbXhCRVN0ZThEQlQwUWVvVHhnZ3JVZi9pRlhDN00waE9rWkdTRzhr?=
 =?utf-8?B?UFE2eEpEcjl6dk1EMWtiVkVjSmQ1NnErMXNwTkdRVUhIWEg2UVZUd1pvVmNT?=
 =?utf-8?B?NVFBT015R3dCbzE4d2I5OTUyc1BDdmFNOHJsZEJBOUE2di96TnBibUc1WlBT?=
 =?utf-8?B?QkRuenVoT2FEaVUraWdXSXhaaDdVZWczTHZhYkwyNTd3b3FlVDQ5Zkl6blRJ?=
 =?utf-8?B?R0FMZ3liL3ZienZUV1BTRGtMdkdRNmV2dWk5QkZONlk0VDZ1eGRmbml6RHRq?=
 =?utf-8?B?akdlak5ZRW9hZDRJbEZ3Ukpqai9iQTR0ZmdqTW9IcHNKYWovQ3d1K3EwYXor?=
 =?utf-8?B?TE11ekkyZ0xmMXJuN2ppR0E1MVh6UGxPNUF6MGE2dXZybXRVSmlCTko3Vmhl?=
 =?utf-8?B?M2dhbDZYaml3SWowazVKbzJaUVpneSsrSmRkVm5UZ3pUemJpYno5N3VwY0VW?=
 =?utf-8?B?K2UxMHNpS0JTVnprMjMydG1YYlBKU00zOER6R0pyaUhMUTFVU3BJQ1NXVFVE?=
 =?utf-8?B?b25vNTk1ZUpzSXVpdGcyWTlkdUZTeTVYWWQ5V3haUE8rZnZvWWdQNUJPSGh1?=
 =?utf-8?B?VTF3RDI5U2dSUk5ZdWh5R21OTXVybGhOTk1RVUNIalJRUE12K2RjSnZyQmx5?=
 =?utf-8?B?blZmNE5XTURRSE9XOE1SdVRFTWRBWVkweCtwQ1lBUVZDemc3YWw4SzR1cUk1?=
 =?utf-8?B?bzJ4cjVOdm44YkFxNlUyU2U1WVhEcldTVllsbk1VQzNJbHlPU0lFa2QydEpM?=
 =?utf-8?B?elpoSEVDK3pxSlAra2F5enVyellab2ZRamRneFNpTkxEWVM3YTIyNE51aTcy?=
 =?utf-8?B?eHp3VUtkbDZtUTFGRlZhajZ2V09iM2xBSUNHQlZsNGdOaThhNWd5OWpJWWlo?=
 =?utf-8?B?UTBIZFh5TjVnT3VIcTB5dzJJWWwwT2thNUp0eU1zeEZ6ZXAwT3J4OFVPVzRK?=
 =?utf-8?B?SlNXcFF2aVFqeFg2eE8zdGpTRWQzVTJPaUVPcy9pOUtrS0pSU1JGMEc3MGhv?=
 =?utf-8?B?T2ZjTzNZZEkzRTd5bCtvSFZ4UUZnQ09BUEVIL2tNSVJNTk1ja1RrSHRYdEha?=
 =?utf-8?B?WWo2c0JYWWpVdTYxUmhETGlRekk5TzJzdDBmeGJKcTVqbUJHVjIxaWlubFY5?=
 =?utf-8?B?TmxmcmtzN2lPNmdQRzlSbXRLZUNNeXRDbFR5TVZHNFNTN2RhYjc2ekF0MmVW?=
 =?utf-8?B?S05PYkpNaEc0Tjk5clgrQkNleE1NV083Z21TYTVmM0xlMS85T2FPOXBNd1BD?=
 =?utf-8?B?b3A3TEF3OEI2WGw0SFlkMjJGY0h4NUw2SWtqeHhBNkRZNTJsVUlETUdPT29s?=
 =?utf-8?B?dHVZRmp6MUF3bWRzbzlTZDVwdXdaTWpvRjBnL0FEVmpZNnlEUHBMb3VzeCt2?=
 =?utf-8?B?TDJoOUU4eEZBNHNLeS9HVGFXdDJrMVFBWE91amZHRk93NHM3c043MWRmdHRQ?=
 =?utf-8?B?NHZsa0ZRY1pjMkEwRTlhU0pLRVE1clhwWmtQUzdQb24wNUFCQkp4cUtXRkRi?=
 =?utf-8?B?Z0ZoT1VJYWJIbjEzQU5LL0ZxaktUMDlaMVFFdVN2R1JTa0VBUjU2S0d2THRq?=
 =?utf-8?B?cFo3aCtleFpaQlVkbEFMTCtZV0xxbGFudE5tU05yRGkvOUd3UkJNMjVxU0Yy?=
 =?utf-8?B?TzFtbWFvUXN2a1BxOGc0bnkxcXJFMmRINFZLT2Rvd1pUUVlZRXI2QlNUUzVC?=
 =?utf-8?B?a2tLaVFiNnpDYTk4ZmdTdlVsSGJONzhKdkhLQ1dNQ0pjNnpOT0FOUT09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1281e83f-c589-4820-4f66-08de518fe89e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR18MB4479.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 04:06:06.0636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GT7cxWFXeH2TXbvzeYQij//zCOJQkGXPfLn0X5s/REErEhexvqxjxnaMqLAkLI69Etu91UGA0orp0dOzRCBz4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR18MB3971
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Andrew

I checked the 6.18 kernel and I found it had included all of the changes 
in this patch series already.
So I believe we don't need this patch series anymore, thanks.

Andrew Jeffery 於 2026/1/12 上午 09:52 寫道:
> On Thu, 2026-01-08 at 22:02 -0800, Kuan-Jui Chiu wrote:
>> This pacth series adds device tree for Axiado AX3000 Evaluation Kit
>> This device tree includes necessary device nodes for CPU, Clock,
>> Interrupt, GPIO, I3C, UART and Timer
>> The patch adds AX3000 into Cadence variant for device tree binding
>>
>> Changes since v1:
>>   - Add cover letter for patch series
>>   - Add upstream commit info in patches
> Did you check whether the need for these patches is satisfied by
> OpenBMC's (recent) move to the 6.18 kernel?
>
> I don't tend to maintain inactive branches (in the sense that the
> openbmc/openbmc linux recipes no-longer point to them). If maintaining
> them is something you're interested in then we can discuss how you can
> contribute to that.
>
> Andrew

