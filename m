Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9202A94FF5C
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2024 10:08:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=UeVRfNWk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjkXg3cQYz2yVV
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2024 18:08:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=UeVRfNWk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c400::2; helo=hk3pr03cu002.outbound.protection.outlook.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazlp170110002.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjkWt48T8z2xGQ;
	Tue, 13 Aug 2024 18:07:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aw/FscLLWdiE9SRvCPPsMBv+HLqPzfGtIFS0u9ClNfawemG4PT40d8Gctzr+AWGXgJM0OVJoWyih3bNPPt0ond0INIm7hzp/tmkbZAn16X1p68nCweZc6ih4LC+wLg0ajO3ROIMD2risNTl4EvT4NTMPn1j1WRidhErNDDOlbDZe6GxxzwBLT7C8Uf6J115h7qBD7RF1hPtKdfYJ6rDKpOEHzarFotKQpRlU0bgpRIsZstmPz/wKQV77lrvGXNgbzVcEypmsh3KFGsQ6D2HyFp9FisBvMRduWDJqEZFItQG0ztfJwB0FP+eSLUv5eyaftLf/KfYO114ZmMi3ynUznA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N8rPeJu8WJPEno4/HNE0RaJIs7mu7Hi01pfTeubf6vY=;
 b=tXv2zJVBe0p/tLP28bZTXUWlxMxPz7t1m4X38hd5cV87B+8YxDMKURb7iFC5zSd2H030rB03aj4yHi2p6drhQ8TiB8ON6ZHCgxynSIPqFYdBKN1q/yxBw41zPVl+CaOzRWJsXTL+hkqGTCJ8OLRvK4ofXiaJrxKjGZlDaZ8aw+CBRtNL4MDHhWhZfuG0tn2lKjEtbQarb9YJX0f7JZyjqy2KVFyYQcbx33WM2cbr6rqRyWp+xWEI/HEGoiV3ImCN4EooGNch171SfjVEim4QVuFp2zVw1Ein3nhQBxDQs86iWbVvB8sqcwrfoxp5Q9ioNiG5Gnct9krlGkVtdvQhyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8rPeJu8WJPEno4/HNE0RaJIs7mu7Hi01pfTeubf6vY=;
 b=UeVRfNWkCYxQX7MVb1qrDWQJqFbfQNkatMbkf0VOZ6E+rcCMxZeYym3S+ISjZ0+UblTBbkeYwI1yDHeEmd0tfMu3zf+5tbLavZ5m0eVvU9mZBGqmGvqlKOGJ3UDD6Fw0iWwVpHdb3eL1oCHrldLTI6Omqs1BGHGBgAoQa1pS7dn6YC6TwbgzqyovyXGveK9LwJEkYZzdT5YJxbc5XMnBrSiYt9PafmgkcAgrZEa8qkJ2GM/YBTwOcgkY0MHrBjwqhL2eRZdkf3u8fq8CNVwNB/QOc2c74NzhOnWR7cSsKY4XspBCHQ9McCI+fHLqT+Xsn9XQkVdpoNKSFwajS5P11Q==
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com (2603:1096:400:45f::6)
 by PUZPR06MB5500.apcprd06.prod.outlook.com (2603:1096:301:ff::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 08:07:09 +0000
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::72b8:dce5:355b:e84b]) by TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::72b8:dce5:355b:e84b%4]) with mapi id 15.20.7849.018; Tue, 13 Aug 2024
 08:07:09 +0000
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "eajames@linux.ibm.com"
	<eajames@linux.ibm.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
	"pmenzel@molgen.mpg.de" <pmenzel@molgen.mpg.de>
Subject: RE: [PATCH v3] media: aspeed: Allow to capture from SoC display (GFX)
Thread-Topic: [PATCH v3] media: aspeed: Allow to capture from SoC display
 (GFX)
Thread-Index: AQHa7LGrvDd3X7zpMEabjqB2PUaukLIk1e+w
Date: Tue, 13 Aug 2024 08:07:09 +0000
Message-ID:  <TYZPR06MB6568CEAB1891D1AB158B96F3F1862@TYZPR06MB6568.apcprd06.prod.outlook.com>
References: <20240812091656.2617664-1-jammy_huang@aspeedtech.com>
 <323f5038-f9d5-459a-a5e2-f1e4dbd4c386@kernel.org>
In-Reply-To: <323f5038-f9d5-459a-a5e2-f1e4dbd4c386@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6568:EE_|PUZPR06MB5500:EE_
x-ms-office365-filtering-correlation-id: 01cd3001-31f8-425e-5f46-08dcbb6eee33
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:  =?utf-8?B?UXlMZkFyU3ZoVWNZQTNIK1hPTVZpNWZ0RHhvSHZNTFdCbklPcHFOMi9SblBD?=
 =?utf-8?B?NG9ZNnVVRWxtR1VndmQwZUt4UGNmK1FZangxdHJJN0N6QXVKdkFPKzdkMEhx?=
 =?utf-8?B?a0FDZitkdDRPcnlnMmQ5RXFUdUxsVHplOHJVZVY1dmZ1alJ5NmhEYVU5ald3?=
 =?utf-8?B?dzZYMmV6c2d1MTFIN0F3Z1FPNzQxT3BkZldESU9HZ3BtY1ltZVo2RkhjNHFU?=
 =?utf-8?B?Mng0aG5qKzVBcXpjR2Y5eXpoRnBvRlVpc0d5cFB0QzlJVnFXLzdxMEVRUmky?=
 =?utf-8?B?MHJXNnA4eDZVekVWUElhd0dBVHdXQzhuMVpaVlVDV3RYVVM1aXN2ZXZQUUVl?=
 =?utf-8?B?K0I4R20xdXY1bU4wYzZ6Q2QvL2MwMU1EWm9hL0loUkJqWU45cGZMWFhRRDB5?=
 =?utf-8?B?QUFwVjZlKzRnRU5wMXYyL3VWNlludWt1Z1lMT3RFTlJLb1JIMnZXR212dktC?=
 =?utf-8?B?STNIUUEwSncwZnJ6WW1YVmRwYldlYnhGVWE1WDVjVjcxRnFFRVBaMTBkdjNB?=
 =?utf-8?B?UWZEaWcrZWNYd051TG5acHhkYVA1S0NxcnlRSlIvQTViMzdVSUd2MUlRdTVn?=
 =?utf-8?B?Sm1Fei9sMWRJckszTlYrdmkreHR3c2crMDFsWkFXM0EvZitDcFpzdWxsSEh0?=
 =?utf-8?B?YkZ1SDVCcmYzbkl3LzhJZzVVbVp0S0xNUHEvRHoxUlM4UGpOaS9YM05MaS9D?=
 =?utf-8?B?a1p6bDcwdW1CbUJubXQ5KzU5c3RTQk5KV3cyUENwa05oQ3RRSjM1MXcxNVVF?=
 =?utf-8?B?ZXljMUl5OFRHSmduL015dUVGWmw1QnFydDZNb0FsZmhEWG1UU2d0WkZENTNU?=
 =?utf-8?B?UTVsd05Ka1A5blJ1ZU5henRVanl1RXQyUzlCeHBHdXZaTHVzLzJCUk11SmY2?=
 =?utf-8?B?MW0wMUtZSkZWK1F5NGVPb3hOTWdVclB5VEtjdjRCUWYvKzZsdkc4Rmc5b3hU?=
 =?utf-8?B?K2xsK2RxVmhwRU45TTBpb01ycGJoeUJocWpkdVU3bzdNZ2hxdDRvZE1uaWFB?=
 =?utf-8?B?OTFBaVdHT201NCtpbjJObS9rMTV6YmpaVitzMDhSL3pyYXpuTnltRjBiYkZm?=
 =?utf-8?B?TjNvK0c5YzU1S3c2WCtLRHIraHFQU1ZpUUY0SDdPY3I1bXBncFFaMlFjVDdD?=
 =?utf-8?B?aE4zYmdmT05DeURnMnRvd3BaSjBvc0M5SWZaS3JkR0ZMdXVqd2UrMlUrbTc5?=
 =?utf-8?B?clk3NlNCYU5Zc0RUNmpxcFdLRjZ3bHYyUFNJMmlYWWJ0MDhwaWRlejN5NTBt?=
 =?utf-8?B?cmozZHI5MVdCeXNLT3JzdWdmcnJHNTFIYWdYMnRqWUJDaTdmSUZ0SnZteDRV?=
 =?utf-8?B?L3VyUHFDTzVNT1ZiWGNtWmtaNUFoRHhGQ3BCUFVpWnM3OTRBVklMb3ByVnIz?=
 =?utf-8?B?dXRPNnV1dWJxcDgvMGRkdW9RSDF2WlpCQzBYcnBCUUl1TlJkcTUrUWhEUzgx?=
 =?utf-8?B?b0VQckhpT0RxMHdkRzB4b3QzWmNTRkUrOEdSNEZEWnBrS1d1MnI4eVZlUnFq?=
 =?utf-8?B?NjdUWUp3TlpsRG56UEVMakhFTkdVSWpSRzlVcHpTMU1Od0VxL0RoSWVYb3Jh?=
 =?utf-8?B?dXByYkczdE5KK2QzUHk2NjFoMEx1QjJWak5LZFJETnBCTlBYV0JRNXl4THZZ?=
 =?utf-8?B?eURhaCtBeW9tVTI5ek1GaFNXeUpHVGZOUG8yQVk3UjZ5R1NEaGJOMCt4ZHNS?=
 =?utf-8?B?KzV6d2p3bWt4Slg5YWQxbTRnNXlkcGZNS2k2dUVyYmNqMFVkc055SWVmQkZv?=
 =?utf-8?B?SHdFaStZc3hCNStGdTExWmdHTmxCUGp1bU4wc1JXZUxDNitGcXdyZ1BtazJ6?=
 =?utf-8?Q?Ov++aJiiHODw29yRT4lzBbbp5ecIJk1wfedMY=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6568.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ZmVPT2RneG02ZmdyeWZPbm4rWFZtNTFNYldYd1VlMlhmSDBHV0gzVXJXWm54?=
 =?utf-8?B?NUVFRTZEdUZaUUlzeUpXejNqWnN3Q1FjSm84Wml1UnVNNDRxeVVUaVdJZHFi?=
 =?utf-8?B?dzdlbk9UNWg2OW91dVdPaENoVW9MRE92eTJzbW5iczcyQ0UvQkVtektGaGdl?=
 =?utf-8?B?dFFpR2d6TnRZUHovcE1laDRtcGlQakU3MGZkUXBmSURwZitTdUNESDgwcTkw?=
 =?utf-8?B?NnlZVjU1MjZsa01oeGJOL2FBWjF1bUN3L0cyb3JCY2c3SzhLZ1NmVG1DakFS?=
 =?utf-8?B?cWl4a01qa2JmZWE0UFNBQSttNFhwR3pZU25QakphQm4yblZSbEtsZ2JWMUth?=
 =?utf-8?B?bHYvdHJ0YzdIampyci9OK1Y0YWZaV0ZMWFMyenEvbmtQRXI3ZXN4V0xudHpF?=
 =?utf-8?B?Q3JaUGFxK0VWTjZHKzd6bUtHNElFSVl0ODZsbWRudzNvSXlWa0h3Qk5DTjhm?=
 =?utf-8?B?UWFrS2NBREtwN0R1RTk5OVJ1VFlOSEVIbjk5ZisrSWVTZ2psdFF5VTJrSlNn?=
 =?utf-8?B?cU1DWENwNkZjd0ZGWXJmSkhvZzg4U3VXaDFHUkdpODRGQ3pBYldnSVZhZVdu?=
 =?utf-8?B?OFNYNnp0Y2xWZlloSlRzeHYxTVFCZDU1cXFnUlhHWmpvSk91Si9zUFVDeUky?=
 =?utf-8?B?b1ROTU9XL2dHM1VJSWdhalRwYkR3dWJOd1lKdVZLYVFuRjVQTUxqKzNNTlNh?=
 =?utf-8?B?bi91ZE9uMzh3bjJ6TGk2aGxETGZjVG4xQ0M1SVUrL3dRZWlFQWFVVVNxZ2hS?=
 =?utf-8?B?N3VoS3hCY2EzcHlpVEhKb3dtUDFkTDltOFdvQjh2SHlUYVd3cWg1Z2tRb0pN?=
 =?utf-8?B?emdjSU5JS2ZWeEtlNTVqdy9wRzBCcU5lcnpxdlNXUCs1blNINTR5SjFNVGJq?=
 =?utf-8?B?NVQ1WFBxYVdCa0RuNk5JNUc4TDA5VWRlc0R3KytqNWpPS1p0eUhYcmhacHFq?=
 =?utf-8?B?ZEJGNXI5bmJLL1E1Z2YxRGhYSWJrU05oamVYOWxlRmRHVDJUY3FBSTJ4Rnk3?=
 =?utf-8?B?VWNTNG9XL1dFTzNuWnE3TzVLeHZtSHVoeGlyaS9FOWRPTnc0L0o0eFJoWUFG?=
 =?utf-8?B?OFdPTGc4MFRaZUdoSHR6K3hyVmJaMUN5cDdNYWQwOG1ESUNqSjdCd3MrM2dx?=
 =?utf-8?B?Q25hc1lrTGszTnpRdVliWWJhbUhSNllnU1lGU3J2Z0lnc1Eza3lhdWpjYnNB?=
 =?utf-8?B?akhtbE16SmtzNDJZMU00Tm5FUklON2lORkNBeHBTZUg1MGhmWGpXMXdKOGhn?=
 =?utf-8?B?N3ZrZzhscFM2cmlJUElJQ1JJNTBnNVpvTFNJSkt1L1REbnBXUnVqWXZBR3RS?=
 =?utf-8?B?emVYVklxMHZTakdObGhxbUp2ZFhEUXovb3E1VSt5bE1iaDU5YnJwRktiMXNF?=
 =?utf-8?B?TDBLeTJaenVvSlJRQXRUUnBTWVRYZFFsTEF4UnpOdnVsbG9mQVFzNy9yc3BL?=
 =?utf-8?B?VTN6OVh3NCtDbkxjZUxJdURsVXAvdlJCSE5IR2NIOFJ3c2hLQlU3SFNvb3Vv?=
 =?utf-8?B?andsR1VMMC9obDk0elRrUDRkcFN5YU4vak1JY3YydDcwL0k5Z3dINlRFWE41?=
 =?utf-8?B?UDZ5cHcvOUh5T2Q3bndlVmZPaS81T2ZGclhRV241bGJZS0N2S3FTekwwTDJE?=
 =?utf-8?B?TmZCSjg3RS9TeXRFZ2hYMmNwVTZ1RmVCMW1aTUxRUzNMYmxTbmtKS21Gd200?=
 =?utf-8?B?WXIrSktyUXg4NXJCZE5JTjNDbHdwQ012MUNKcitJZ1R5OG5SR3psNFVtd1Ax?=
 =?utf-8?B?TldSSS8vekxhVnNCV2lYQWd2VnQxYldLRWZqa01kUUlxb1pVOFl2Q00xVnlw?=
 =?utf-8?B?VmROMHNtdFJieHRMOEJ3U0JRVFQvMDhpZEEyalB0U0NSenRGNDYzMGx3bm80?=
 =?utf-8?B?Zi9lSTVSSFNjU1Nsd3U5eGpTaHBITVp2QmJjallEUDl6R3NVbWhFZXF0WlFQ?=
 =?utf-8?B?S1FxL3dXOThlV2tEaVBqOUhWenZocWtxUVhwUGhvbmpwZUNIVU9HcjE3Sjd2?=
 =?utf-8?B?RzJEelEyOGZZdzZaZ014Q3FWaitlWm5ram1hMTJ4V0hiRlNyd2xnblNiMXY2?=
 =?utf-8?B?YlRJeUVSZWFEVjJTSS9VZ09LVUZMU1VGekRYSVBWdEE4eUxJa2VyY1dFYkRp?=
 =?utf-8?B?Y0ZTT1dWRk54SDdCU2dnR2FrWjBwZ3E4OFhNSm1SODBHYzFDTFNuWjFXRlJR?=
 =?utf-8?B?VWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6568.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01cd3001-31f8-425e-5f46-08dcbb6eee33
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2024 08:07:09.6861
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ngUbdzG0K8VdGXYpxNk0Tl+4Mzy3pLQHGbEl+v4n4+VVhbT2DmEEMELRLPEZe0YfKKOmwrfxN7AfXT9tM1+1Y0qBPNlBzHHZkqocCWiNh/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5500
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgS3J6eXN6dG9mLA0KDQpHb3QgaXQuIFRoYW5rcyBmb3IgeW91ciBoZWxwLg0KSSB3aWxsIGhh
dmUgYW5vdGhlciB1cGRhdGVkIHBhdGNoLg0KDQpSZWdhcmRzLA0KSmFtbXkgSHVhbmcNCg0KPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxr
cnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgQXVndXN0IDEyLCAyMDI0IDg6MTggUE0N
Cj4gVG86IEphbW15IEh1YW5nIDxqYW1teV9odWFuZ0Bhc3BlZWR0ZWNoLmNvbT47DQo+IGVhamFt
ZXNAbGludXguaWJtLmNvbTsgbWNoZWhhYkBrZXJuZWwub3JnOyBqb2VsQGptcy5pZC5hdTsNCj4g
YW5kcmV3QGFqLmlkLmF1OyBwbWVuemVsQG1vbGdlbi5tcGcuZGUNCj4gQ2M6IGxpbnV4LW1lZGlh
QHZnZXIua2VybmVsLm9yZzsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOw0KPiBsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWFzcGVlZEBsaXN0cy5vemxhYnMub3Jn
Ow0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djNdIG1lZGlhOiBhc3BlZWQ6IEFsbG93IHRvIGNhcHR1cmUgZnJvbSBTb0MgZGlzcGxheSAoR0ZY
KQ0KPg0KPiBPbiAxMi8wOC8yMDI0IDExOjE2LCBKYW1teSBIdWFuZyB3cm90ZToNCj4gPiBBU1BF
RUQgQk1DIElDIGhhcyAyIGRpZmZlcmVudCBkaXNwbGF5IGVuZ2luZXMuIFBsZWFzZSBmaW5kIEFT
VDI2MDAncw0KPiA+IGRhdGFzaGVldCB0byBnZXQgZGV0YWlsZWQgaW5mb3JtYXRpb24uDQo+ID4N
Cj4gPiAxLiBWR0Egb24gUENJZQ0KPiA+IDIuIFNvQyBEaXNwbGF5IChHRlgpDQo+DQo+IC4uLg0K
Pg0KPiA+DQo+ID4gKy8qDQo+ID4gKyAqIEdldCByZWdtYXAgd2l0aG91dCBjaGVja2luZyByZXMs
IHN1Y2ggYXMgY2xrL3Jlc2V0LCB0aGF0IGNvdWxkDQo+ID4gK2xlYWQgdG8NCj4gPiArICogY29u
ZmxpY3QuDQo+ID4gKyAqLw0KPiA+ICtzdGF0aWMgc3RydWN0IHJlZ21hcCAqYXNwZWVkX3JlZ21h
cF9sb29rdXAoc3RydWN0IGRldmljZV9ub2RlICpucCwNCj4gPiArY29uc3QgY2hhciAqcHJvcGVy
dHkpIHsNCj4gPiArICAgc3RydWN0IGRldmljZV9ub2RlICpzeXNjb25fbnA7DQo+ID4gKyAgIHN0
cnVjdCByZWdtYXAgKnJlZ21hcDsNCj4NCj4gRHJvcC4uLg0KPg0KPiA+ICsNCj4gPiArICAgc3lz
Y29uX25wID0gb2ZfcGFyc2VfcGhhbmRsZShucCwgcHJvcGVydHksIDApOw0KPg0KPiBUaGlzIGpv
aW5zIGZpcnN0IGxpbmUgYW5kIHRoZW4gdXNlIHNjb3BlZC9jbGVhbnVwIHRvIG1ha2UgZXZlcnl0
aGluZyBzaW1wbGVyLg0KPg0KPiA+ICsgICBpZiAoIXN5c2Nvbl9ucCkNCj4gPiArICAgICAgICAg
ICByZXR1cm4gRVJSX1BUUigtRU5PREVWKTsNCj4gPiArDQo+ID4gKyAgIHJlZ21hcCA9IGRldmlj
ZV9ub2RlX3RvX3JlZ21hcChzeXNjb25fbnApOw0KPiA+ICsgICBvZl9ub2RlX3B1dChzeXNjb25f
bnApOw0KPiA+ICsNCj4gPiArICAgcmV0dXJuIHJlZ21hcDsNCj4gPiArfQ0KPiA+ICsNCj4gPiAg
c3RhdGljIGludCBhc3BlZWRfdmlkZW9faW5pdChzdHJ1Y3QgYXNwZWVkX3ZpZGVvICp2aWRlbykg
IHsNCj4gPiAgICAgaW50IGlycTsNCj4gPiAgICAgaW50IHJjOw0KPiA+ICAgICBzdHJ1Y3QgZGV2
aWNlICpkZXYgPSB2aWRlby0+ZGV2Ow0KPiA+DQo+ID4gKyAgIHZpZGVvLT5zY3UgPSBhc3BlZWRf
cmVnbWFwX2xvb2t1cChkZXYtPm9mX25vZGUsICJhc3BlZWQsc2N1Iik7DQo+ID4gKyAgIHZpZGVv
LT5nZnggPSBhc3BlZWRfcmVnbWFwX2xvb2t1cChkZXYtPm9mX25vZGUsICJhc3BlZWQsZ2Z4Iik7
DQo+DQo+IFRoaXMgbG9va3MgdW5kb2N1bWVudGVkLg0KPg0KPiBZb3Ugd2lsbCBuZWVkIHRvIGNv
bnZlcnQgdGhlIGJpbmRpbmdzIHRvIERUIFNjaGVtYSBmaXJzdC4NCj4NCj4gQW55d2F5LCB5b3Ug
bWlzcyBoZXJlIGVycm9yIGNoZWNraW5nLg0KPg0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRv
Zg0KDQoqKioqKioqKioqKioqIEVtYWlsIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioq
KioqKioqKioqKioNCuWFjeiyrOiBsuaYjjoNCuacrOS/oeS7tijmiJblhbbpmYTku7Yp5Y+v6IO9
5YyF5ZCr5qmf5a+G6LOH6KiK77yM5Lim5Y+X5rOV5b6L5L+d6K2344CC5aaCIOWPsOerr+mdnuaM
h+WumuS5i+aUtuS7tuiAhe+8jOiri+S7pembu+WtkOmDteS7tumAmuefpeacrOmbu+WtkOmDteS7
tuS5i+eZvOmAgeiAhSwg5Lim6KuL56uL5Y2z5Yiq6Zmk5pys6Zu75a2Q6YO15Lu25Y+K5YW26ZmE
5Lu25ZKM6Yq35q+A5omA5pyJ6KSH5Y2w5Lu244CC6Kyd6Kyd5oKo55qE5ZCI5L2cIQ0KDQpESVND
TEFJTUVSOg0KVGhpcyBtZXNzYWdlIChhbmQgYW55IGF0dGFjaG1lbnRzKSBtYXkgY29udGFpbiBs
ZWdhbGx5IHByaXZpbGVnZWQgYW5kL29yIG90aGVyIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbi4g
SWYgeW91IGhhdmUgcmVjZWl2ZWQgaXQgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRl
ciBieSByZXBseSBlLW1haWwgYW5kIGltbWVkaWF0ZWx5IGRlbGV0ZSB0aGUgZS1tYWlsIGFuZCBh
bnkgYXR0YWNobWVudHMgd2l0aG91dCBjb3B5aW5nIG9yIGRpc2Nsb3NpbmcgdGhlIGNvbnRlbnRz
LiBUaGFuayB5b3UuDQo=
