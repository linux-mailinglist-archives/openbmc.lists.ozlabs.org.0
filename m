Return-Path: <openbmc+bounces-208-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28356AD9914
	for <lists+openbmc@lfdr.de>; Sat, 14 Jun 2025 02:34:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJy293wPwz2xjN;
	Sat, 14 Jun 2025 10:34:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20b::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749814400;
	cv=pass; b=hlJETM+nYLIPm0dwEpX99zIu6XOU3z7F3GVmXXbWXsw8OMhCulPSuPqRo51zXxa0s06KIBQrmc8hUok+Mpbtd1IPS1J73/srL2WDMQKjVHNaYR0/8E0Y16p1b0F4ApuEcpR3DOSff52tgDKBBImyecf7hUOSigFSBNhuc3BcdSQeNI2vQINCjrKUfkHYygQd7NwrFRUjUn1M6ADknrOr+R/eZDrIBn7rhzyGrW9lZ8ZDrqQTKwZBbJcjnFx53NajrlliqFSheZOQgBZGDV1+qpk/hjUloSn3hdDa1OUQmK/f3cB5WeNaOLM9uA2HYKt/lBI3PbZvZT5xdEwRhWb4rg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749814400; c=relaxed/relaxed;
	bh=5Cyh4VpoXpDR7H7wMROPA5fQDZuu9l3MTgcyBHzsMac=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=P00V0FIS5cTnQNklKJRK/aI4QzItWOqs+G9hUwfo/AfyoCVkAOONNwe41Uzs/TrPgB07OEUlQ1d8Qq2Ghl9hPQR5RkFIt+f8aWcrMlpgwtem/542pdh415Q1BzNgy+33Vx5eRcRO/8g6WM6GdyWvxGBH93Im/vKUrU+AqrPsg8RrVQywnQn1mwD3YtbbjfWwrACV6le9Lx0AkgGQ5VjXls1YohKt1uYpL7IiFxVe5GEP98EbCcPwQi4ll4lx7W6xS30V4bK6euIVo5w+p54SObNghUZBDK4iBZ9vCio4hue32yryX0uIAH2hS73K1cZy82wqhNEe0q7mggDtAv0ukA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=siewert.io; spf=pass (client-ip=2a01:111:f403:c20b::1; helo=beup281cu002.outbound.protection.outlook.com; envelope-from=tan@siewert.io; receiver=lists.ozlabs.org) smtp.mailfrom=siewert.io
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=siewert.io
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=siewert.io (client-ip=2a01:111:f403:c20b::1; helo=beup281cu002.outbound.protection.outlook.com; envelope-from=tan@siewert.io; receiver=lists.ozlabs.org)
Received: from BEUP281CU002.outbound.protection.outlook.com (mail-germanynorthazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20b::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJchv0rXwz30HB;
	Fri, 13 Jun 2025 21:33:18 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sdoje+ykIXYUVFxwU6fcKDHqILno8aa1FVQykq8Ti9SuQvM/ISjbAwwh/t57lRoK6c57Zbgy9aXMpzPaDBMkAEISrKkkLLWZgbpk/bibNMAIbYNs4pjVHBRPM8JoDPXgiPSEH8N3IEjItPIM+FOr1fdfVQi1IEougKPUi6qTV0n3x97a+RBoY22zcC3H/Qj0CDmrUWtokIGjA4iY8dM+fXfBCeyoqMPts+IX/+9sk06NEYP7bIrBwXHbXGr354UfqiJyvA5aiR5XnbSa/AMycWeGkSUM9M7rvRqoaK7J83vGZuDG7dW1XLLKaFjQ6rCfPP6P2kC+0Tve1futPg3zrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Cyh4VpoXpDR7H7wMROPA5fQDZuu9l3MTgcyBHzsMac=;
 b=lrmCscIyeGcqEM2lwskUHMVZvlM+zOU+oRegxvfV/I8CraPpK1fCsP0CFFxxBo7b+2UA/qQvdylqeplypGmXGrpgVnNDaUVL6zGRPg34SpRST9J29bXFunvW9OR6kHBJ5NB+f4dKc/gR3YFJwtGUxnmZbaXJuhWG2k3owg62hsAdw7yEHdTgzB3UNR6C9+RBAqu7PApV9euHra54pdGsKjPQqIoV1+WRuohmmg2cAB503XDQEDRUSlcD0CkW7p+6JmJTf9EqBYjfMnOYTSDxVeLr3nq+3faDW+sRgZxEL1xWCL3drTQA3eD/0F4+CxFywklE76apgfR7vcjlYcUZ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siewert.io; dmarc=pass action=none header.from=siewert.io;
 dkim=pass header.d=siewert.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siewert.io;
Received: from FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d18:2::182)
 by FR4P281MB4229.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:126::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Fri, 13 Jun
 2025 11:32:52 +0000
Received: from FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM
 ([fe80::6ec7:ece3:1787:5e48]) by FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM
 ([fe80::6ec7:ece3:1787:5e48%6]) with mapi id 15.20.8835.019; Fri, 13 Jun 2025
 11:32:52 +0000
Message-ID: <5e748017-460c-4ff6-a86f-81cf4580684d@siewert.io>
Date: Fri, 13 Jun 2025 13:32:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: aspeed: Log error if SCU protection is active
Content-Language: en-GB
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250612151900.32874-1-tan@siewert.io>
 <2cfe3813b7e330ba43f20a882c0c5035751fc7f0.camel@codeconstruct.com.au>
From: Tan Siewert <tan@siewert.io>
In-Reply-To: <2cfe3813b7e330ba43f20a882c0c5035751fc7f0.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::9) To FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d18:2::182)
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
X-MS-TrafficTypeDiagnostic: FR3PPFB3D0CF1D2:EE_|FR4P281MB4229:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b04015b-ce5a-47cf-1d88-08ddaa6e0850
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWxyL0k4K0ZQeWtsSEl0ai83QnJqd0tkV3VRS0U5dTdiaTBXUXNWMEFQSjU0?=
 =?utf-8?B?Rkk0MlFtZGF1WHZpd3pJQkZ6ZmwxTDlvOHZwQlVSMjZoK2xFOFRzL1E0VUVx?=
 =?utf-8?B?bndSeHoyV1YzZ1lHMG5yUjhwczR4V2ExYXkvOENYUFgwQmY4Vi82ZUhXMjBt?=
 =?utf-8?B?SGozQVJtZGFBU3BldkV4RXd5NzJqVzRDZnVPN1F0ZTdXWkhTNDAxaVAydVZ2?=
 =?utf-8?B?RGt5V3IvanVSS3UxN2dvWGxNQndSb0pnQjBCYTNEWWhpRnA1RjB0ZmtxVURz?=
 =?utf-8?B?UTNRak9pVmxQZEYrT2E2WjlEc2NvdnNPTHRoNWZRcG9XYURpTDRyZjBlVnBG?=
 =?utf-8?B?TlJ4WWpHU25RYzJ2RkV0VjJoMGY0U2p6a2ZZZW1ZV0NxNUt2bk5FcEUrUy9J?=
 =?utf-8?B?SFNONEYxaUQ3RHhKNTFZRVVQUHJjSW9JVmF6SnErRHFwWDlnR3pzSWhpdzZ4?=
 =?utf-8?B?SWlVVm95aFF6N2dRWVVoRis4ZlZjdElDbkVGS1dUcEwzckphY2o4c0Q5VzVi?=
 =?utf-8?B?YlFhV3kvTVQ2cUp1d2Z2T05wT2lLVTAyYjhqSTNqR0UxOGo0WjhJZkdSZWlZ?=
 =?utf-8?B?aUt5TXRpSGlnWjgzb1FtNHFmcjFGRjFpeHVkWVplZU10bDVobDJPYXdMcXMx?=
 =?utf-8?B?WnZybXkvME15Yno1RWViQW51SEpUMXFid2VhWWFCcTdlUUpvU3dhVmNrUURx?=
 =?utf-8?B?Y0ZkLzRtZ2Y3SnhoYVdSaEZzUEtsVHZRWjV3ZHJZQTQySkZ3MmVOeHJGVU91?=
 =?utf-8?B?TkVZVHM4OHRZZUNMWGhYSjlTRmpYRnpyMFRVUHVjZ1p6VjhMeG5LRXlKcWtC?=
 =?utf-8?B?bGFUVEpGRmpUd011cXRSQlJNYnd1RjlQbk9haG0vUExVeGtIcHAyRFBTbU9m?=
 =?utf-8?B?bUU2TVpFbTU2ZUVlVDQ5WUpRRk9JYXFjd0hoVC96V1BzT2txeCtsNUVJYVQv?=
 =?utf-8?B?a3RIWGM3TXVRNk9GcVJHY0Q1ZWlMNjVKS2hNMkZOUllwVVlUaVFZOStSMHNJ?=
 =?utf-8?B?YWhHMEMvbUxaR1g4aEJPKzVNeXJJbVB1SFU1UUlYMWJKYVV2cVoyWGI3M0E2?=
 =?utf-8?B?RHVuNFJXQlUvVjZOUytKenA5N0Q2VXVjem1lMlI2YVVSeFo4SXNUZzgxRmpJ?=
 =?utf-8?B?VFpVZXRoNzMvVFlGZHBDY1RBOThUNjUzT2xveE0rKzZsaG1OOFZTWGUweHdu?=
 =?utf-8?B?c1Q4OVlKREdjYnFXbkxpcDlVSkh3Wm9nS3hYd01sTzBNN0g4dDBQenJVTC95?=
 =?utf-8?B?NWJHb056UWR2THNWNk9mL0txT1RGNlpNTERZK1hRNUpFNjhJd3ZmMEwvNE5F?=
 =?utf-8?B?aXVpT2dtR1hXc2JpTHBGYVVudjcrQkdtbXBlQXJPNXhWaEZ2WVFDSDg3dDht?=
 =?utf-8?B?ME4xVCtGRkRTQWxSbVEwa0I3ckdXTjJvdmlSdTFLNXdIZXVmSUpLQ1JMNElL?=
 =?utf-8?B?Mm5oS3pwL1Q4UlhDMTJpcTJMdkF1aVdHbXd4SUNHQ0FkbE90U0NnYkpIQUlz?=
 =?utf-8?B?M0xFVS9NZEtLSWpxeEhzWjZUK3FLOHRVVmdoSW1vR21QMzZwS3RGNUNrQWNy?=
 =?utf-8?B?eWN1SW54bkdvWFBGYkVoV2RVZjI1VCtXS3RrQ0FuRzZEb092UzlUSTJLZnZP?=
 =?utf-8?B?VXhYRU1Id04xTXh6LzVGWjhOQTRzT3ROcFc0K1BpUzl2SFlrY0Z6NUFzNTRR?=
 =?utf-8?B?SHc2TFgxVzNsQXlsVVozRmZ3KzZJRXZ1S0U4WlIyWXZhZERtVEY1K096NTFk?=
 =?utf-8?B?VVNaQUY0OEpQR2pOdDZQamRnNER3UnZBZmIrTUI3Nmh6cVJKcW4vc092NjVC?=
 =?utf-8?B?dFRaRDhhaWU4Y29HYnZ0bzVzWTFxWHd5dVdaaTIxb28zN2lXT24xWkRFTDNo?=
 =?utf-8?B?eTlBNkFGWUZtTjhlRHYxQmFQa3A4WEtBN3h4VEVZT2ljaHQ0K0J3RTgwSXNE?=
 =?utf-8?Q?oJU9f5RdW08=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWhNWmQxMERsWHdCcWE5NWxNWE9Fb25naWVsVXVOS21sTzlZNEsyRnc1UThy?=
 =?utf-8?B?SzIrQjBlRDR4UzdmVGJxRmROL0ptTy9DaG9xY29UY3o5R3kvM2RXZmpXZkhr?=
 =?utf-8?B?RS9LY3RQMXUyQlJ0NGpXcmsxMmZqR2taWDVCcGZaZzRTVDMzVUlRNjBoWUVi?=
 =?utf-8?B?TFgwSk5pR2xQMWFacDBGdS8zMTA5UmxSK1k4ZzFoVk5JREpsZE92aVZpVGFY?=
 =?utf-8?B?UEVobzNreDNvRjlOMWdEcFBxeEpncCtoTGpzTng3RXdpT3Flck01SWJHTHph?=
 =?utf-8?B?Y3JmZjhraW9lMGg3OVp2VTRCb083V0RJWktuQ1Iwb3lYRm1FeHZWYnFLTUta?=
 =?utf-8?B?NTFndjdSeG5FdTBrOEpsUFV1bVJucXV3WTB4UmVuT3QrVFRmajNZZFRweG5J?=
 =?utf-8?B?U3AwYnVzQkJYeHhjWUNMc2g3S0E1alc2MlBQSU5CUThWVjNzMmt5ME5jUTFl?=
 =?utf-8?B?NVgwaCtpaG1NcUhra25PRmQzK1V5MXhkMThQaVBxR2pKcGtxSWhLaWtIa0ww?=
 =?utf-8?B?c3JSQ25tN1hxSlJRd0xVbXpqK1BIWXB4MnIzSEFPRmt3eUE4WFAzVEtKTHBh?=
 =?utf-8?B?YmYzYmlOSVgzSUw1Y1FkRXdYYXY4RUZESkJJNTR5YzZOZ1lZV2JaNndhQXFM?=
 =?utf-8?B?Sll3WnFvMWJMTDZlcUZ0bFpYakxlUXRTTlRCYnBIa0F0eU81VW0xRmxXbis5?=
 =?utf-8?B?VllkYS95UmN3U1F3c3l4bXFlY3VQaVZ4OXd6L21rd3RjdWhZdjdPOU05TFkv?=
 =?utf-8?B?bFRVSWZCYytJcU8valc3emJ6Qk54U2I1TTNVUm4rcHM5TzVLM0FPaHoxYk9X?=
 =?utf-8?B?VTlQTFpNWklmczNUZnBPRU5JekhtVUlLNXQvaTRPZ09BbkJNYU1TMzZYVDg5?=
 =?utf-8?B?TGFBRXNjeC84cnlCVk5SZWNqNDJYa2hRcEVQdUpIT1BEV3Bha1hNQjg2cGEv?=
 =?utf-8?B?Vnc3dXpXOE1OU2pXck40cER0SFdFSGtSNGJQMFZQOUFFc0tjUEk3QnpMbUZ2?=
 =?utf-8?B?bGgvZER6U2V2b2VJSWRkQWdNNCtNVUZTdm5OMkJnWXo0K0ptVDY1TFl0Z2RM?=
 =?utf-8?B?Q29meTFBTVRQZ25NU2NHR1BTTWhSeVVYVklTMHVVM0ROakE5blhjbGtoZzZJ?=
 =?utf-8?B?RDJGMkwrbndhYi9OR2dJSXkxMlhQYXhHK01QSW01Uy9DcHNoWC9jUEd3RkdR?=
 =?utf-8?B?Tjl3V2hnYUlaN2hMZFNLdFljZmpFa0xEZWF5NnFycHNuMVU4dGUvUU1BVUt4?=
 =?utf-8?B?c005Wi82SXpJZ055dVE1TkNyWmhUR2kwQTAzVTJhT1R1S1hxcmtXQlhaazhY?=
 =?utf-8?B?MXErayt5WFFBWldZMkRia003ZVRSOFVZRGVpSmYraWpSUUJ3Qy9SRlpPSGdU?=
 =?utf-8?B?SXNCbUZBMHgzT0o4em9mSXV2V0xOZ2hWcEowcXYrQzNDODdONURtcmVyVzdF?=
 =?utf-8?B?TzF5VFloYkhpUWU5Y0Qweng0Tjd5b2R3QmJTVk9waVJnbjZnWExsUTE4UnhQ?=
 =?utf-8?B?Q3lyTG1UTnRNM2s5elpUVy81QU5HaUpXMmhGTzNXdjVMcUc1UGdZM295cktv?=
 =?utf-8?B?ME1hOTNoU1RxR3RlMmhuWlh0ZTF6eUMweDM3MjlobDVPWHl4NjN2czU0dENX?=
 =?utf-8?B?bkxldDJWMDJoMDF5VlROYi8zYTliWGQxT2NxcG14eUd3SE1vcjZjb21TSGhM?=
 =?utf-8?B?b242N1RQMXJQOWE3cUJpRDluSmxxKzVMaFNSNkFTNElaeVMzeFBWU20xbXFI?=
 =?utf-8?B?aUlOOTJOYVpmQ3JxRnpkdjd2d1pWQjhRZFdyUWtvVDI1cmNqSE5aRDJCVE1F?=
 =?utf-8?B?ZTlkRzBYYUR0YzFYN291MklDOUphTGlZblNsV3psaHBWYldKUXlGOXNYaVZT?=
 =?utf-8?B?UW1kOUVvOTlsUk14b0xEQlV1Z1MrUG55NUtUb2xpNHFHbHNMaWJxaHpVY0FU?=
 =?utf-8?B?aVc5VVNvWk5tdkVKVUZxZzFkcml6cnF1aGRnVElaUUlCeWdWWStCb0pPcDAv?=
 =?utf-8?B?cWE4SzNlcWZhc3dqYkFIQlJLSVovWlQzaW11WURVcEdsYTZQMGF0alFrMUdM?=
 =?utf-8?B?cTBaQTlVU2x3SUEzbVR4b2hEd20rdGJtTmxUNFF6cm5ISjNuaUtUb3Azd2w3?=
 =?utf-8?Q?Bko8=3D?=
X-OriginatorOrg: siewert.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b04015b-ce5a-47cf-1d88-08ddaa6e0850
X-MS-Exchange-CrossTenant-AuthSource: FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 11:32:52.1585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e8b4abbe-444b-4835-b8fd-87ac97451a7e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JqvLD5TJTUofic2UhLvWsJbcAho/NFbVYjfwJGK0EnG7aYQ4vE00+f158JOTtRcA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR4P281MB4229
X-Spam-Status: No, score=0.0 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 13.06.25 08:01, Andrew Jeffery wrote:
> On Thu, 2025-06-12 at 17:18 +0200, Tan Siewert wrote:
>> ASPEED pinctrl and other drivers accessing SCU registers rely on the
>> bootloader to unlock the SCU before handing over to the kernel.
>>
>> However, some userspace scripts may re-enable SCU protection via
>> /dev/mem,
>>
> 
> Hmm, if this was caused by poking /dev/mem, then I'm not sure I'm in
> favour of it. The source of your problem wasn't apparent to me in our
> off-list discussion.

This was only an example of what I've already seen on GA firmware, but 
it could also be done by some custom out-of-tree driver.

> "Don't do that" :/

I agree on that ^^

>> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
>> index 774f8d05142f..81680c032b3c 100644
>> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
>> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
>> @@ -28,6 +28,8 @@
>>   #define SIG_EXPR_LIST_DECL_SINGLE SIG_EXPR_LIST_DECL_SESG
>>   #define SIG_EXPR_LIST_DECL_DUAL SIG_EXPR_LIST_DECL_DESG
>>   
>> +#define SCU_UNLOCKED_VALUE 0x00000001
> 
> Bit of a nit-pick but I'm not sure this is worthwhile, or that the
> leading zeros are necessary. I'd be tempted just to use the constant
> '1' directly inline ...

This was more of a convenience to make it obvious that the "unlocked" 
value is meant here (as per the datasheet). The leading zeros are 
unnecessary, yes.

>> +
>>   /*
>>    * The "Multi-function Pins Mapping and Control" table in the SoC datasheet
>>    * references registers by the device/offset mnemonic. The register macros
>> @@ -36,6 +38,7 @@
>>    * reference registers beyond those dedicated to pinmux, such as the system
>>    * reset control and MAC clock configuration registers.
>>    */
>> +#define SCU00           0x00 /* Protection Key Register */
>>   #define SCU2C           0x2C /* Misc. Control Register */
>>   #define SCU3C           0x3C /* System Reset Control/Status Register */
>>   #define SCU48           0x48 /* MAC Interface Clock Delay Setting */
>> @@ -2582,6 +2585,24 @@ static int aspeed_g4_sig_expr_set(struct aspeed_pinmux_data *ctx,
>>                  if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP2)
>>                          continue;
>>   
>> +               /*
>> +                * The SCU should be unlocked, with SCU00 returning 0x01.
>> +                * However, it may have been locked, e.g. by a
>> +                * userspace script using /dev/mem.
>> +                */
>> +               u32 value;
>> +
>> +               ret = regmap_read(ctx->maps[desc->ip], SCU00, &value);
>> +
>> +               if (ret < 0)
>> +                       return ret;
>> +
>> +               if (value != SCU_UNLOCKED_VALUE) {
> 
> ... i.e. `if (value != 1)` here
> 
>> +                       dev_err(ctx->dev,
>> +                               "SCU protection is active, cannot continue\n");
>> +                       return -EPERM;
>> +               }
>> +
> 
> Doing this test for each value in the signal expression seems a bit
> excessive.

Ack

> I was suggesting we only print the warning if we detect the writes
> failed to stick (this is checked towards the end of e.g.
> aspeed_g4_sig_expr_set())

Ayy, thanks for pointing this out! I overlooked the 
`aspeed_sig_expr_eval` check at the end which definitely suits this case.

Cheers,
Tan


