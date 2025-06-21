Return-Path: <openbmc+bounces-279-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A79FAE28B5
	for <lists+openbmc@lfdr.de>; Sat, 21 Jun 2025 13:01:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bPWcC2pNZz2xs7;
	Sat, 21 Jun 2025 21:01:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c406::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750494604;
	cv=pass; b=gu7+sAFxzjP6Ifrsy/kktU1OIqmXCOPc0ft9xky7CpkSfRAh1TPPibixE97N0bDf9T42YooSqXfSHgVj254yDXjtBgrW9JzZviAjUZXi9kbMV2BLGMzvlcATcR0CRzdm4f7li6WLLxfcRF4aulRtVS36UdIGx0q8SXqhyvlIPH/H9GWqTvPCTPns2TBmsve4AWJfvx1U5v3gE+SlpXagk3ocBYYcRB4NkQKfvNnLh03QfsQCz5Am5zwXPYCAnjAlAv9n2HFfAQZKBhQaEenDv7GBK1XzOYJPLbMs816bkuQkqzAmTRZ3rhpWoyMLl2dAutED3+mlo2e6q3r9mmY3JA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750494604; c=relaxed/relaxed;
	bh=XoUF/tw2WzjpK2T15ybPyBfIE+f8EoUkHlDNrzXDKfc=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lZXWkU3SQ+NIYD+QgTUoS7n26xWAJeBBX9H1+ft9CH7+O+X3PF4fSvhSpAFGBqiiGN5eLsrCE0U9WAN2+N3mGMrnXPjarhJOhVEWcmyKP+QbxOF8EpFYO404tEIBEn8Ia1VFVikcuhNT3MmCIIxd7xFl9C1xYwdPNO/3HSDewzsy3A8K6cMZIhpeA39KeGSntdZ1siFoKzN72m6Djl320dcABIFH7CfkHRiC+FzDoRNjw3WWcc0a+vYQeGginei3tVORBs4oSX0zhtSaYTmLETGkiBODI3TqUjKwdvDQaptksKsGJuhMgZ+gIi7zgH6KqXnAojTJPae7UY9q/5Qr7A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=DuHx9Wex; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=cool_lee@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=DuHx9Wex;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=cool_lee@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c406::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bPSFj4lGJz2xs7;
	Sat, 21 Jun 2025 18:30:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D8BFJzwv0MkRy2X/l0XURN7xncJHDwjqfWEu7HB7Ne45c5XpQcEb1l96yyRz+H3v3Fu0/JLcuwmvmk8dKYRjFcbLvlsc0sxvNThC/ULO0xq5J8ellXL/Y/WYyt7J7clv3ZPwhhGAWjz/btvT8qGsX2Qadi4gg60EQbjW1AEM/J2QzxR7yreXnPzkltv/Nq9n9+0ruhr9YZECjAC+DvCKsoU9TNlHZEKkWA1x/dfA+OkKIVou+Zm0/ovFuGp71SibzYAzrFLwSRtRETx5NqoYZbebQ2OGFN4ICR1R54ezh12QTQLilYDRabME047Vq/Fo8MkInQgb/C91rPoFf/3bVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XoUF/tw2WzjpK2T15ybPyBfIE+f8EoUkHlDNrzXDKfc=;
 b=IkT8cbLV/VU0xV7Z+T01X4RLspWtkRJdEB4yIun72eMBeJbOaS3vZqtwZWAyKjcduI996Pe2Pl0zEvi8wMH2a5M/6tyDSi7OYewu/URdSX0E/uGhvs5KECkYQgg9/2f25a9JrsJD4pnGlAbmHEbnRqwI0QCBIQqCaaoC9JwPjHpfnlVCWrHxFTUjtqHzP6ctIfcPFbgt10SgW7lnTUCRLbEHhjXsodBjglO4e931unSS9oFYy5ppD4bMV8QBb2V0ITVgNoWSM0NDD3YSq8HdEUy/DS60t1BAexL/rLWQFmOrN/F5b1ehpDVMjAHNjIjguxinDfkOw+gSU+cza+tP9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XoUF/tw2WzjpK2T15ybPyBfIE+f8EoUkHlDNrzXDKfc=;
 b=DuHx9WexMTwEdZLVU0s0k5xvJdLgGOujCRwfmlrCosy0OrmyNRwX8OLAQbBBUt1ksKarP74qSS8e8gsga/Z1vJCmb9ItxtrdoDz8JuQXEinBczXIX+nYiX+H46Tw+RTJtDI7/k0wWUy6AbfttXNEFCFtPR9zctvzSPPOuRNwwex1O8U2XxVXhvdLhnHNhxn0F6X3+V3L6YRVHjYMSaseSTnEVeismubGxXT0TEXHHDdbyQcAKf7wdAYo47P6+2jqT176OKdFY11aAicK+dxSgu8KNAhJzjhHeX9BimNkZr7ruG9b3Fg/IuWvg2B+9sVxi8YcK9kcr5x64JQUcgV4tA==
Received: from TYSPR06MB7068.apcprd06.prod.outlook.com (2603:1096:400:466::8)
 by JH0PR06MB6437.apcprd06.prod.outlook.com (2603:1096:990:2d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Sat, 21 Jun
 2025 08:29:32 +0000
Received: from TYSPR06MB7068.apcprd06.prod.outlook.com
 ([fe80::e1c7:8707:7d43:bbed]) by TYSPR06MB7068.apcprd06.prod.outlook.com
 ([fe80::e1c7:8707:7d43:bbed%4]) with mapi id 15.20.8857.025; Sat, 21 Jun 2025
 08:29:32 +0000
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
Thread-Index: AQHb3/anykUBDV8RQEG+uyGdBhEOerQIRHyggANpggCAABWdQA==
Date: Sat, 21 Jun 2025 08:29:31 +0000
Message-ID:
 <TYSPR06MB706845CACFD7095F53BBCDCD957FA@TYSPR06MB7068.apcprd06.prod.outlook.com>
References: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
	 <20250615035803.3752235-2-cool_lee@aspeedtech.com>
	 <80f56269175d8658ba1ab4a1fe9a43d18294ca60.camel@codeconstruct.com.au>
	 <TYSPR06MB7068A5F04CE0A5BDB03073C0957DA@TYSPR06MB7068.apcprd06.prod.outlook.com>
 <2d17ec4f5f9e2cfd75902217a8dd621538a73bc2.camel@codeconstruct.com.au>
In-Reply-To:
 <2d17ec4f5f9e2cfd75902217a8dd621538a73bc2.camel@codeconstruct.com.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYSPR06MB7068:EE_|JH0PR06MB6437:EE_
x-ms-office365-filtering-correlation-id: 36349963-7c8c-463d-1c3c-08ddb09dbf1a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|921020|13003099007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?T1JzVGdiMXVHb3lobXlBRVQ5VE9UUXlmRHJiN1V4eTE4ZlVJb2lZK2E3azNK?=
 =?utf-8?B?V1RocHAvYmp5WXNCS3JhV01vWkhQQ2lqU3FRR1ROaWlIUWNkRGwxWXUxTDZv?=
 =?utf-8?B?Q3RkaDNSRDZEbVpWd1k4NnBPWFBQaEErSVhzc1E2ZGZNNW0rWk51bzVFT05Z?=
 =?utf-8?B?Q3NUR1pqY3VoeDFmSVZaR2I4MUxhZVcyQWhTUVZ0WjNyMnRnOS9vSFIwL1l6?=
 =?utf-8?B?ajlwYTlLanUvYWtxQmJRdnpod0J6bE93VjQ3bnpjV2MzUjRVOWd5QXRmTVY3?=
 =?utf-8?B?NHpOZXZDM25nVHpNSDNHMVgwVTZ6eU5wbEtzQ1ZlV1RHdC9GZG84QjJWeFFI?=
 =?utf-8?B?YXVFR2NlRzVkNFEzNEQweDhqUzByR1BwZFBzd20xUGpqNEtNNGtwZHB3elpV?=
 =?utf-8?B?RUo4dkFlQ1UzUWxoWmFSVGFJcXZvWUF6YnJXc0U5VDZGRnNPaWc0WjhVdFRQ?=
 =?utf-8?B?VktsZy84RTJOaHB1Q0QraTJIM3FlWFRXbWpsWWExT0hEcmlaeHE2bVE3a3RZ?=
 =?utf-8?B?RzFaSDNiRlMrcEo2WEFFSlBpRnZFK2VuYXkweXV6TlkwSnh1eGhVemR0TTZY?=
 =?utf-8?B?RDBGbDlta2lPQSt6RndJYzF2VVVGNlMxWlBFcVVFK2tmS2RJMVIwNDU3bE1m?=
 =?utf-8?B?ekQzMlhVdTgrSGk2eWM4cnpiaEtJaTU5SDRjdDNMYVdrSEVVeEYxS1dZYTlt?=
 =?utf-8?B?aHBhZENVUzd5SHNLU0ZYcHhXYkdFTm5ESE0wOFJERFpYdGg4bitMYzZzaW95?=
 =?utf-8?B?cTZUMVB5WXllaHlzeHE1ZnZUcjBVNDRISDZuQkNSNEEwbS9vaVZPZjlsWTNW?=
 =?utf-8?B?clVqdi9nckJwYnR6WXVMeHNIVnFpcnNGZWI1ekNZNHVaeFY0VzZkcnllYXJW?=
 =?utf-8?B?Z002WERORklSVWpsR2lTeUlUcHVXQzNiWHNUR0UyU3ZzK2VUdXNZRmZ4QWc4?=
 =?utf-8?B?L2hwYitXWUU5S3FVcWxhN0MyUFBiNitINEhmT1dJMnpoa1A2Qno2MW1Ec2tO?=
 =?utf-8?B?M1ZsUWJrSis4c0puUVV0RUtyTjhpRTVrODBIckcxaVR2VSsyNVBkWjF1TGZQ?=
 =?utf-8?B?dGJJYTVsa2dFdS80SFR3aStZOGpJNi9tRllmMFNUSWVNbStlb1o3c1UrN2dM?=
 =?utf-8?B?bHpaUlB2ajVIUzFvb1hGLzNUQlpkL25ZMmJRMS80UGFscGJjNWNMZWVWNStn?=
 =?utf-8?B?cHhOcUx0YnhOSSt2WWtiYkY0TFBKalROZElwZW9rRktFQWNsejM3OXNFT2ox?=
 =?utf-8?B?SVVoSnQ0MzlHY1NwRWFyemF3YTJWYWFFYStEdkVSUnJHbkliUVU1RUhoR0ha?=
 =?utf-8?B?OXc5cjlGSC9sZDk5V1BjQjdVTFVtR2ZtSmVDOHk3TUZyK3NiSlN5eXB1Qmpz?=
 =?utf-8?B?VmpaMERTOG1jYnY2YlFtak54STU5ak1rVEpaZGcweDdpZzZpK0dsV0dtdjJs?=
 =?utf-8?B?eUU2N1dUdGwwdW0vaDFDTTc4ZCtSVnlIN1dHdkxRc0h4cjlGa1dqanMwK3ha?=
 =?utf-8?B?cFordzBBbWl4bmdWVzd1TXFKU084ZjlrbGt0VjE4eXlHaU1hWjlyZmhVMXpk?=
 =?utf-8?B?ejJJbGZmcnpLNWVRd2dLOVFyd1dXNmt5ZElvVngwd1NIYzRKNlhadVZHZzZy?=
 =?utf-8?B?N0t0NHBPYWUwUXd1R0xPNThadjMxR25vempNSWRaejdPT21OdWtHTEViUTV4?=
 =?utf-8?B?Q2pKWWlSdjZZdzVGZkN3ZHlSRXRnbTNUcUNJZDJxUXhuR1F3Ukt6NjRRSUN1?=
 =?utf-8?B?Tlp3NkpEQlp1aitLbTdxRnIyaWFXdXV2dE5pUDVpS25wZ0I3WVdVOGtVRy9q?=
 =?utf-8?B?dE5Fc1lhVU9UbGZXZ1RIN1FPLzR4MmRxSTE1WkVpNE1sR2dMTGhPd3pveW9D?=
 =?utf-8?B?NFVIOFJOVU45dW0vNGdraklZVlllVlY3V0F3cEhHOTBHb1NhU3BDcGNsVzZW?=
 =?utf-8?B?eDJySlJLYW50aXlTR3pwLzlLcTFxWVVHbnJNUmJLZUQwcDBINHhObUhZaDJZ?=
 =?utf-8?B?VFU1dktRTWd6RkcybnZhOFdodDNxU016MmdpVUhXNE9RT1NZOTdkb2VQUGRW?=
 =?utf-8?Q?pWMETX?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR06MB7068.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(921020)(13003099007)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eDFIQXJEaU9rN3QrT1BEZU1aSXZlY2RCMGNkeTVJNmRBaXk5Ky92Y3FTUHVl?=
 =?utf-8?B?RGt4dFlTU291QklMeDc3VlZvYVV6ZHFRajRDdDkyMUlPOCtCT3VDKy9tenpj?=
 =?utf-8?B?MUw3aHhCd0gvVFpFMzJVV0VkVkk1Y0tsRVZUMklleDBjSk0zWll2bXhlVHdD?=
 =?utf-8?B?SXVyaEJyR2RTY2d0UkIzaE1RUVg0V0Fkb3pLMEJtRUdsUk9QL2VOMkxpOTFG?=
 =?utf-8?B?a2U2ODNyMFh2T1pVQWg1bzQ0Y3ZVcmRYNUprZTNFbVB0Z0tJSVgxbjBadmFz?=
 =?utf-8?B?UkZPd0F5Z2ZvQS9nbVBBVTcxSlAwYk9UUnRiQVlmaVpZbWxOUHQ3ZzIzWmFL?=
 =?utf-8?B?Y3NtSXl5ZUJKRXlERnVrUlpiVXl6dXYxOXlubjI3T2hBeTd5TWMxTEFZb0NP?=
 =?utf-8?B?Zi9kVlNWSjdWaDljZXQzSWJOdEtxOURWaWQ1eXFVOEEvdkFsZ1ZFU0Q2Qmg0?=
 =?utf-8?B?UTlyVzZ2M2NmeDJUZDR4MHJMRmd5Z1owRmNtK3hyQmpZb2NDVmVKMHJHOEFR?=
 =?utf-8?B?MnZzbi9JZVRuSUpNYjYxUkhqVnMvdjB0MzBhU04wY0F4dXVEUHNxa29NcG42?=
 =?utf-8?B?YnUwcENPYm1rTE1JNDRMeWEySWdaUHRLMmZBQnJqNmZxTjQwbVVkYWxGekJM?=
 =?utf-8?B?SG05U2VQcWIzMXB0eFJBdkpQTDBVdHRGTytpYXBJOUQvMkdFaEpERXJpMExK?=
 =?utf-8?B?YzA2Q3RmR01UcUlEK3pBRTI1YzVEb0NpWTBGMUh6eWZza1h4N3hCM09Ba29t?=
 =?utf-8?B?bE9STnZxNmZ4WFpXZUp3ZWd2VVQ4VlMxQnltNC9wV0RHWng0WGlDcjZjb2Jp?=
 =?utf-8?B?azZrcTd5M2c2Z2p1TTNqRVVkZzdoOEh6QXBzWGg4dEpRMnhGaVhOdjVJL25T?=
 =?utf-8?B?ZGMrSmduK3hjUDdLanJGWnEwcDBURUdyelN6MllEbnpyZlVQYUJlc0FOY3ZV?=
 =?utf-8?B?MVdSUlNsNTJzd2hXNmViVjIwNXRFZlJ6RjZ4bFdrRVFsMTJKTFNCQzF4VVc2?=
 =?utf-8?B?VHpmOHppK1JsWXR3a2ZHckFHSkZjZk9GQkFFL3BoWllQSHM4YWtLTzM2K0xT?=
 =?utf-8?B?RE80ajR0cXoxOWFqTWdaT2ZubFdBdDc0bVNKeE5YL29IRkxWU1lpQVRxQ1pM?=
 =?utf-8?B?VUZKSng4MU9adVlCYnVuOTNqUHZCVmRUcEhodzVzeWJIbG9ISlV4TGtZenFT?=
 =?utf-8?B?c2hhaTF0OU5aeUdkR1Q0SkpEeFJ5OEdUNEdtRWlZQ1ZIWkJsVFhnSTFMbk55?=
 =?utf-8?B?aHdnSlRmWldIWVNVL21uZnM2TzNDMUNUYUtkb3JIYkxTWDFmMS9FbExCZE41?=
 =?utf-8?B?R2l1MXJHc25Zdy9vR0h3MUc2QU5lQjZOZ3B1Q1lpRzMyY0NaY2xJR3MvUnE3?=
 =?utf-8?B?TW5IOU1NWkxQa1pDbEZjd3FxRkZNL2xJSTdKYXB2V205V24wbng0V25XMW1k?=
 =?utf-8?B?elVVSloxQ1hBYU11SVBvaENSWm85L21VVWNqUGhwbEJ5dW9HbVU5M3EwREk5?=
 =?utf-8?B?OUdEVXpDN3dDejNmUzIvMEMyUkdhdi9iNng0RjI2UnR3b0o4SXorVjZsSjF2?=
 =?utf-8?B?L1ovT3dvWFdUWCs2RlVuOUNoK0hZVVBmRWNjS3EvejZJdHJxdm45Mk8vSFNn?=
 =?utf-8?B?SnFmdGJ0YmwwOFYvaXBnc2UveWV0R3NuNXlTOFFJOTBFTWlZaE9SWUhYcWFR?=
 =?utf-8?B?SWJpcDg4YnBjWkRsNVV6UUJsRnlESldYd1MybGhLdVNZRjhNY0lvWjUreTZw?=
 =?utf-8?B?L0VWWlhYZFBMcEovYVYyR2ZDL0VHM3JtekhNdk9IOTB6a2plTDlERzNBSU0x?=
 =?utf-8?B?UHcvVGl3UEdJam9HbDc2ZnE3bnEveEhrQ1Z5WVlyK05wSVhzSFlRRTdUR2pG?=
 =?utf-8?B?YXlxSUNTcjFLbDN0RURtZlpNbjNLNFlZQW1DclRvUU1tY3NoVDBFTndWYUlN?=
 =?utf-8?B?RHVtUFRzZXlVWlVrZ3NZd1BIQlN1NkJxUDlZOEZMcnU1cTlacjBwRitVK1ZY?=
 =?utf-8?B?cHRTcFZEWEV4N0g3VmtlUVhVV0NUdDZCRFhlNi9NZTlxV3pEdGh5RXVEdUVt?=
 =?utf-8?B?Y3ZWMk1hNHNaOE9jbUNlMTliWU82TGxkTmEzZ1lpYnQvTk1IV1VzTHNCQ2pN?=
 =?utf-8?Q?jCFQzQ5Ei46NmtYQ1qsoUuDRa?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 36349963-7c8c-463d-1c3c-08ddb09dbf1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2025 08:29:31.8391
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JZkE/4P2m5eS2z9TeAmTIbvzlVtYwRjyRYbtmT9wKEUQMThogh/ZM70EtTUXzt0wkwAOE5E5qgMR/kznd3hJHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6437
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

DQo+ID4NCj4gPiA+ID4gUmVwbGFjZSBzZGhjaSBzb2Z0d2FyZSByZXNldCBieSBzY3UgcmVzZXQg
ZnJvbSB0b3AuDQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IENvb2wgTGVlIDxjb29s
X2xlZUBhc3BlZWR0ZWNoLmNvbT4NCj4gPiA+DQo+ID4gPiBDYW4geW91IHBsZWFzZSBhZGQgYSBG
aXhlczogdGFnPw0KPiA+IFRoaXMgcGF0Y2ggd2Fzbid0IHVzZWQgdG8gZml4IGEgY29tbWl0LiBU
aGlzIGlzIGEgd29ya2Fyb3VuZCBmb3IgYSBoYXJkd2FyZQ0KPiBidWcuDQo+IA0KPiBBIGhhcmR3
YXJlIGJ1ZyBpbiB3aGljaCBTb0NzPyBBU1QyNDAwLUFTVDI3MDA/IE9yIGp1c3QgdGhlIEFTVDI3
MDA/DQpUaGlzIGlzIGEgYnVnIG9uIGFsbCBwbGF0Zm9ybXMsIGV4Y2VwdCBBU1QyNzAwLg0KDQo+
IA0KPiA+IEZvciB0aGlzIGNvbmRpdGlvbiwgZG8gSSBuZWVkIGEgRml4ZXM/DQo+IA0KPiBJZiB0
aGUgYnVnIGV4aXN0cyBmb3IgYWxsIFNvQ3MgaXQncyBhIGRlZmljaWVuY3kgaW4gdGhlIG9yaWdp
bmFsIGRyaXZlciBhbmQgc28gc2hvdWxkDQo+IGhhdmUgYSBGaXhlczogdGFnLg0KT2ssIEknbGwg
ZG8gdGhpcy4NCg0KPiANCj4gPiA+DQo+IA0KPiA+ID4gPiArDQo+ID4gPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShyZWdfYXJyYXkp
OyBpKyspDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgc2RoY2lfd3JpdGVsKGhvc3QsIHNhdmVfYXJyYXlbaV0sDQo+ID4gPiA+ICtyZWdfYXJy
YXlbaV0pOw0KPiA+ID4gPiArDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBzZGhjaV93cml0ZXcoaG9zdCwgdHJhbl9tb2RlLA0KPiA+ID4gU0RIQ0lfVFJBTlNGRVJfTU9E
RSk7DQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB3cml0ZWwobW1jOF9t
b2RlLCBhc3BlZWRfc2RjLT5yZWdzKTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgYXNwZWVkX3NkaGNpX3NldF9jbG9jayhob3N0LCBob3N0LT5jbG9j
ayk7DQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoH0NCj4gPiA+ID4gKw0KPiA+ID4gPiArwqDCoMKg
wqDCoMKgwqBzZGhjaV9yZXNldChob3N0LCBtYXNrKTsNCj4gPiA+DQo+ID4gPiBHaXZlbiB0aGF0
IHdlIGRvIHRoaXMgYWZ0ZXIgdGhlIFNDVSByZXNldCBhYm92ZSwgd2hhdCBleGFjdGx5IGlzIHRo
ZQ0KPiA+ID4gU0NVIHJlc2V0IGZpeGluZz8gQ2FuIHlvdSBwcm92aWRlIG1vcmUgZGV0YWlscz8N
Cj4gPiBUaGUgaXNzdWUgaXMgc2RoY2kgU29mdHdhcmUgUmVzZXQgQUxMICgweDEyQ1syNF0pIGNh
bm5vdCBjb21wbGV0ZSB3aGljaA0KPiBtZWFucyBpdCdzIGFsd2F5cyBiZWluZyAxIGFuZCBub3Qg
YmFjayB0byAwLg0KPiA+IFRoZSByb290IGNhdXNlIGlzIHdoZW4gc2RoY2kgZG1hIG9wZXJhdGVz
LCBpdCBtaWdodCBob2xkIHNvbWUgc3RhdGUgc2lnbmFscw0KPiB3aGljaCBpcyBub3Qgd2VsbCBj
bGVhcmVkIGJ5IFNvZnR3YXJlIFJlc2V0LiBUaGVzZSBzaWduYWxzIHByZXZlbnQgU29mdHdhcmUN
Cj4gUmVzZXQgdG8gYmUgY2xlYXJlZC4NCj4gPiBUaGlzIGlzIGEgaGFyZHdhcmUgaXNzdWUgc28g
dGhhdCB0aGUgd29ya2Fyb3VuZCBpcyByZXNldHRpbmcgd2hvbGUgU0RIQ0kNCj4gY29udHJvbGxl
ciBmcm9tIFNDVSByZXNldC4NCj4gDQo+IENhbiB5b3UgcGxlYXNlIHB1dCB0aGVzZSBkZXRhaWxz
IGluIHRoZSBjb21taXQgbWVzc2FnZT8NCk9rLCBJJ2xsIGRvIHRoaXMuDQoNCj4gDQo+ID4NCj4g
PiA+DQo+ID4gPiA+ICt9DQo+ID4gPiA+ICsNCj4gPiA+ID4gwqBzdGF0aWMgY29uc3Qgc3RydWN0
IHNkaGNpX29wcyBhc3BlZWRfc2RoY2lfb3BzID0gew0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
LnJlYWRfbCA9IGFzcGVlZF9zZGhjaV9yZWFkbCwNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoC5z
ZXRfY2xvY2sgPSBhc3BlZWRfc2RoY2lfc2V0X2Nsb2NrLA0KPiA+ID4gPiDCoMKgwqDCoMKgwqDC
oMKgLmdldF9tYXhfY2xvY2sgPSBhc3BlZWRfc2RoY2lfZ2V0X21heF9jbG9jaywNCj4gPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoC5zZXRfYnVzX3dpZHRoID0gYXNwZWVkX3NkaGNpX3NldF9idXNfd2lk
dGgsDQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqAuZ2V0X3RpbWVvdXRfY2xvY2sgPSBzZGhjaV9w
bHRmbV9jbGtfZ2V0X21heF9jbG9jaywNCj4gPiA+ID4gLcKgwqDCoMKgwqDCoMKgLnJlc2V0ID0g
c2RoY2lfcmVzZXQsDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoC5yZXNldCA9IGFzcGVlZF9zZGhj
aV9yZXNldCwNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoC5zZXRfdWhzX3NpZ25hbGluZyA9IHNk
aGNpX3NldF91aHNfc2lnbmFsaW5nLA0KPiA+ID4gPiDCoH07DQo+ID4gPiA+DQo+ID4gPiA+IEBA
IC01MzUsNiArNTgyLDEyIEBAIHN0YXRpYyBpbnQgYXNwZWVkX3NkY19wcm9iZShzdHJ1Y3QNCj4g
PiA+ID4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ID4gPg0KPiA+ID4gPiDCoMKgwqDCoMKg
wqDCoMKgc3Bpbl9sb2NrX2luaXQoJnNkYy0+bG9jayk7DQo+ID4gPiA+DQo+ID4gPiA+ICvCoMKg
wqDCoMKgwqDCoHNkYy0+cnN0ID0gZGV2bV9yZXNldF9jb250cm9sX2dldCgmcGRldi0+ZGV2LCBO
VUxMKTsNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKCFJU19FUlIoc2RjLT5yc3QpKSB7DQo+
ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXNldF9jb250cm9sX2Fzc2Vy
dChzZGMtPnJzdCk7DQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXNl
dF9jb250cm9sX2RlYXNzZXJ0KHNkYy0+cnN0KTsNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgfQ0K
PiA+ID4gPiArDQo+ID4gPg0KPiA+ID4gVGhlIGNsb2NrIGRyaXZlciBmb3IgdGhlIEFTVDI0MDAs
IEFTVDI1MDAgYW5kIEFTVDI2MDAgbWFuYWdlcyB0aGUNCj4gPiA+IHJlc2V0IGFzIHBhcnQgb2Yg
bWFuYWdpbmcgdGhlIGNsb2NrWzFdWzJdLg0KPiA+ID4NCj4gPiA+IFsxXToNCj4gPiA+IGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4
LmdpdC90DQo+ID4gPiByZWUvZHJpdmVycw0KPiA+ID4gL2Nsay9jbGstYXNwZWVkLmM/aD12Ni4x
Ni1yYzIjbjcxDQo+ID4gPiBbMl06DQo+ID4gPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdA0KPiA+ID4gcmVlL2RyaXZl
cnMNCj4gPiA+IC9jbGsvY2xrLWFzcGVlZC5jP2g9djYuMTYtcmMyI24yMDkNCj4gPiA+DQo+ID4g
PiBXaGF0IHlvdSBoYXZlIGhlcmUgYXNrcyBmb3IgYSByZXNldHMgcHJvcGVydHksIGJ1dCB0aGF0
J3Mgbm90DQo+ID4gPiBjdXJyZW50bHkgc3BlY2lmaWVkIGluIHRoZSBkZXZpY2V0cmVlIGJpbmRp
bmcuDQo+ID4gPg0KPiA+ID4gU286IGlzIHRoZSBjbG9jayBkcml2ZXIgbm90IGRvaW5nIHRoZSBy
aWdodCB0aGluZyBnaXZlbiB3ZSBlbmFibGUNCj4gPiA+IHRoZSBjbG9jayBkaXJlY3RseSBiZWxv
dyB0aGlzIGh1bms/IElmIG5vdCwgc2hvdWxkIHdlIGZpeCB0aGF0IGluc3RlYWQ/DQo+ID4gPg0K
PiA+ID4gV2UgY2FuIGFkZCB0aGUgcmVzZXRzIHByb3BlcnR5IHRvIHRoZSBiaW5kaW5nLCBidXQg
SSdkIGFsc28gbGlrZSBhDQo+ID4gPiBiZXR0ZXIgZXhwbGFuYXRpb24gb2YgdGhlIHByb2JsZW0u
DQo+ID4gRm9yIGxlZ2FjeSBwcm9qZWN0cywgdGhlIGNsb2NrIHByb3BlcnR5IGhhbmRsZXMgcmVz
ZXQgc2ltdWx0YW5lb3VzbHkgaW4gdGhlDQo+IGNsb2NrIGRyaXZlci4NCj4gPiBGb3IgbmV3IHBy
b2plY3QgQVNUMjcwMCwgY2xvY2sgYW5kIHJlc2V0IGFyZSBzZXBhcmF0ZWQsIGFuZCB3ZSBhZGQg
YSByZXNldA0KPiBwcm9wZXJ0eSB0byB0aGUgYmluZGluZy4NCj4gPiBIZW5jZSwgdGhlIHBhdGNo
IHdvbid0IGFmZmVjdCB1bnRpbCB0aGUgcmVzZXQgcHJvcGVydHkgdG8gdGhlIGJpbmRpbmcuDQo+
ID4gU2hvdWxkIEkgYWRkIHRoZSByZXNldCBwcm9wZXJ0eSBpbiB0aGlzIHBhdGNoIHNlcmlvdXM/
DQo+IA0KPiBZZXMsIHBsZWFzZS4NCk9rLCBJJ2xsIGRvIHRoaXMuDQoNCj4gDQo+IEFuZHJldw0K

