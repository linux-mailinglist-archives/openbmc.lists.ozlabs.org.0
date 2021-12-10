Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 382A446F8CA
	for <lists+openbmc@lfdr.de>; Fri, 10 Dec 2021 02:50:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9DPg0lLPz3c63
	for <lists+openbmc@lfdr.de>; Fri, 10 Dec 2021 12:50:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=hQxLEc99;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.255.99;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=troy_lee@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=hQxLEc99; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2099.outbound.protection.outlook.com [40.107.255.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9DP72sv0z2yMs
 for <openbmc@lists.ozlabs.org>; Fri, 10 Dec 2021 12:50:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cn66a46CZ5oETUK0CMx3b453YiP0jJknezudCb8aOW7tXz36OkoBOpVcpNA8Jb56V8DWGihRJRgzuIdgTfzan0PZjx1981gopI3b14jDu0/6d34Cv8pyIhJUPHiPr+Sgc9acDWl8kt5WcTn/LdhnirsimM+45cAKr1Cumkn3HiQpwXO0vbwGsWdiI2jnPvL1796O7D17c5GBBI/D1PU1JWhwuNNjMRCT5825PJqSQb5rHykKXIyCKWNQu1ObR/eEtO0wQsenhoIURq8Gh1LdWYsVQy2Dx+x5HA7LxwmfbSXtw8+Q/XWQ0hCIxLBUGmHYFidzwd4nQxLAJW8Za6gyVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mcGyaoDw5g9v5Yby8Tbiv777ljIV+JW2/aTvhRK5vCM=;
 b=hpECc4q/EkdmiKFmcl8cShiRFX1U2dt6wRSlLn+tar9UX3ERptp+TKBL9dcm+dapJzx8Aj18UEohKlcE8YewFNqcyQiQhWpBzvqa9irjnAJKdtVV6FPy60mxUR9qtDGy5yXl8aGObUNGOs9DHrLlbJApZktQKbwBg296qM3tl3OGuNrP3yA1aAaZn0vb3rNYHHj5fmukIKc9E2FuT6+g/6vrlPSrSdLq0A3MRu8e9zAwuhEz+Mowgx+1aTgMzDAjNzvplSzZ4kIKGLIS2vaXLZ4/LpbledDhifFhUxMSYNiWvIsIRtrsoJQHwb6pZ7KFPre6/+a3VMsTI2TPodKn/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcGyaoDw5g9v5Yby8Tbiv777ljIV+JW2/aTvhRK5vCM=;
 b=hQxLEc99bCEpMTD6s2QsCggA3QB9SnGpqFfOBEJGxh3D9lNMk2GyT647ysD+mnKEEXpd+JG5prfZfJe7tlTaMJk11CM5CHoghdNeT8MyzNiddBGvgQZHILDUQbrdp3T7+wQgxCrDyV8EEi7XAe4mE6e/IMmsMT6KKCOFHOoYwUbE304eviDobf6rfdgqNiAOUGBDRBlXusOqAAT2TotFBSenPxmZTCsZvshJy9v26O524B13gqBZD6RTiZI7IrVwkWZFBWTRhRqfJhIrWXDzxjmY3W506nzYAFGuko/iZhVSTuj2E2uPXiJB6VkAdJ5bq4AtBnlXyeHdytM5jPLhIw==
Received: from HK0PR06MB2145.apcprd06.prod.outlook.com (2603:1096:203:4b::20)
 by HK2PR0601MB1956.apcprd06.prod.outlook.com (2603:1096:202:4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.19; Fri, 10 Dec
 2021 01:49:43 +0000
Received: from HK0PR06MB2145.apcprd06.prod.outlook.com
 ([fe80::3095:e729:9cf7:64c1]) by HK0PR06MB2145.apcprd06.prod.outlook.com
 ([fe80::3095:e729:9cf7:64c1%6]) with mapi id 15.20.4778.014; Fri, 10 Dec 2021
 01:49:43 +0000
From: Troy Lee <troy_lee@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>, Dhananjay Phadke
 <dphadke@linux.microsoft.com>, Joseph Reynolds <jrey@linux.ibm.com>
Subject: RE: Security Working Group meeting - Wednesday December 8 - results
Thread-Topic: Security Working Group meeting - Wednesday December 8 - results
Thread-Index: AQHX7GfTWuXBgzBpzUytead4eN9P8awp9CyAgABzGwCAAAUlgIAAZaiAgAAiVAA=
Date: Fri, 10 Dec 2021 01:49:42 +0000
Message-ID: <HK0PR06MB214509C7CB3F68DB550690068A719@HK0PR06MB2145.apcprd06.prod.outlook.com>
References: <7e7f0779-d6c7-99b3-d88a-5a239440984a@linux.ibm.com>
 <1639071097-7076-1-git-send-email-dphadke@linux.microsoft.com>
 <df30fbcd-870a-4d9e-9377-80c0b1a9c3ca@www.fastmail.com>
In-Reply-To: <df30fbcd-870a-4d9e-9377-80c0b1a9c3ca@www.fastmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: abc33884-907e-4fa4-e732-08d9bb7f563f
x-ms-traffictypediagnostic: HK2PR0601MB1956:EE_
x-microsoft-antispam-prvs: <HK2PR0601MB1956388409DA7F87DDDE27508A719@HK2PR0601MB1956.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +0wprf6FifQ5tFR++ZqzK6BZDSEQFr6yRik1gywOwJqLquqtm+JllRWQF7SStO3J04DX/zVK966uMTbuunolZZfLJ5pF5p8GPo/JAx5xss5UuW4h3S0vnfUtO35QjD8UQunCFJxnz81sZRKuYd1ICc4ZaIszUbz6AQckd8aa8xmZFFANCRJG/fDDyiX4dOi9lKFKdGj0+e5BrWLqSS3/MYl50SqYLhNsKBoh34azKPiImECQ0t8D3aTNUEYMPjn2C4K3rWYn2JGlh5HKqXEZIS74bBFtWw85aqeSH05jvX0URve6eiThqha8ElxKGSSYR9jifK88zNPS02nY2PlSSWhmdI0+1psrTd4VwXoxJtggbNhgcxwMhKaR5Z2nGd2SgV4gIVHTqjFqdURSHO71T/TFJUeRPij3rddFs5MfS0GAmzQVHiW4kngglCr2ATigxJMkhYcNP8acBg8oCFZNHi/FNgtu8fQbMvUIp0sqZDlm1eTcFLfQDN68asydnTqXoXkkwUthVHTP2y6S1OFA2BAdRjkhAWqKARpFttdtoibW7PQSLdADVYWbjSAt7oNfCa7D/kvPJ82v9hVnfAuZ8Qlo3C32PNzWwLjFb5ZAqgdMroXnzcJoH6s6+vYNTpWh5hxbYvdFSufYZ9IzRuTqIo46qLP0xGZ8kCmxMXI+pRqM+iI6NPRN5nUrbTw0m0FMnKGb4hy4QSLESbO/PNO3J/VsKnb/lDBj+p43I/6CJQScIIBJtIYC8kparRhn4hvRbcVe6+dMuGksJ0QPiAgQQvPPdwC4UpFkVxhhZ1vzJGW/dS1R25zQw+i73xVBvzezoCT1LLNT8mD3khuQmam+2Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB2145.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(376002)(39840400004)(136003)(366004)(7696005)(71200400001)(8936002)(38100700002)(122000001)(55016003)(66946007)(316002)(6506007)(8676002)(38070700005)(66476007)(52536014)(5660300002)(53546011)(26005)(4326008)(83380400001)(508600001)(9686003)(966005)(186003)(86362001)(15650500001)(33656002)(66556008)(64756008)(66446008)(110136005)(2906002)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZXdEdEtabmpTOExKSGRXWTcyVmQvOEVScGpBbHEvWWhraG80SlMxMU0xcGh3?=
 =?utf-8?B?YkdPaTZzdlYzRzJXS1hGWnB6eDVTTis4UjZmT0FtdFRkYlY4WEthZmpxVGJn?=
 =?utf-8?B?L0FqTkF3a1lGTlo5M3QzT1IwSVQ2T3RKMitLWnJPMnhEVEp3UzRubnBONU04?=
 =?utf-8?B?OVRmcGtlNWNrNlE5dTNxeWZpQWNFbXpmV2tOQkg3aDdHT1pBZ3JsaTRTRndV?=
 =?utf-8?B?cUdHRnVlbWxvdGlCY3kzRmJXVVRDSFFEKzJYcXE2dGZRT1ZhVzlzK3ZycHpR?=
 =?utf-8?B?S2FrdVZyYmdTa1pXa1p3eDM4dUU5L1dCbUdIckcrWHp2UzdzdWNGeGpnb2JN?=
 =?utf-8?B?TUJQTWpCQnJObTdiZDhUWVJuOEFDck01cFpKdUl5cFM4eXhzM3l5Sm00Y0JX?=
 =?utf-8?B?dzhZL1d6cE02ZEVRMGJVS1lLbnAyd2prTTl2cU8yelF1bDZ6MUNjY1VWd1cw?=
 =?utf-8?B?d01vc2UvTGg1L2N5RzEyWENKeE53ZnRocURLOEVMc1U5aWdvSjF4Z1htL2hX?=
 =?utf-8?B?K25QYnhmUERETHU4cDBzcnRYazk5aHpOOVpmVmpub1BrVGZuQnkxVHlpL3J3?=
 =?utf-8?B?WjZlVnd4K3k4N3hHZGZsRTZjcHYrL25UL3UwUHBldXVzOVFmaHZLS0pvN3p6?=
 =?utf-8?B?ams5ZlhQMHFobWVTMldLQUYxcHE3dHFSbzkvMHRoWngvMUNRaEtGK0hwS096?=
 =?utf-8?B?V1pzQlpLWG1yRlJYaFppa0JqS0pWRUQ0RUhxakNSTFVma3Rnb1VnYXdPT0xm?=
 =?utf-8?B?V0VKSm5NVFhPWVBuQnRSUkwzOFVvMnFJUmVFMkpPYm01UWRURitqTjZaeHF4?=
 =?utf-8?B?TGJKR2Q1Ujh0bU1RRy9aNERpWGlyZVhFYWdvU3BLQTdQcDRsQzF4V20wUHVv?=
 =?utf-8?B?aENyeWdoYzh0MWRHMkc5OUdvcmFvY1ZUR3lmRWFOM0xkSXYvaWZzTmFqbmpk?=
 =?utf-8?B?SlgrRXc3RHg1L0Z4enZLSnMzRVk2UFhLNFpLdDBMM3pCWlo5MWFjeS8rOUNx?=
 =?utf-8?B?aDg5UWRUb1VhaVRmSE02QVJDN1NhZDcvaFZSREtwS21LQjhmbE5Zd3UvNU5M?=
 =?utf-8?B?OEJOTzlQc2F6K2RPdjhoVTVZL01pWmliMlpQWTA2bGhRZlgrNXZlMndETFh3?=
 =?utf-8?B?WkpOdnB6bkg0NTh5Ulpid05qQnF2RzJ5T3JBN2lhdjh3OTk3Sk1rSmRYWnNI?=
 =?utf-8?B?NSsra2JPbUNDTDQ2SUJsekxkVDcwazZ0disrTERHelBNeGRwdms3WHBBTHpq?=
 =?utf-8?B?YjZPUVJKVjBYUTljbExEbmdDK2Q0NWpTSEsvajh3Tnl2M0VOU0NQakQ4dGdi?=
 =?utf-8?B?VittL1VkMVh5WmJPZGFGc0ttL1RzVWZLdWs5MGxOd0d5QzJBN2l5Yld6WGMr?=
 =?utf-8?B?MnFkK1VXbENDeU03L3hwRzNHKy84MWtjQ3h0OGJmM2V0dytIZlY2WVVxdWhw?=
 =?utf-8?B?VlBEUWdJS3hSRDdrcVRXcjhyY0FidkJYclgvUlErYktVMGgyNUh4TFA5cXFP?=
 =?utf-8?B?KzNBaVU5QWNpK2VDTzVSMG5PMlZnL3VicVZVY0pWckpHanlwSStGdG9aM0hm?=
 =?utf-8?B?QW10SjdsQ3ZKLzBMbkUvd3ZZY0dLR0VHMDBVT3hyVGRDdXFVcjdZcElpUUNl?=
 =?utf-8?B?WU1aeDUvRE5IQXhrQjlXR2xCZExTZHpzckVmWjNyNUZ4S1c0NlpSNGs0cFY5?=
 =?utf-8?B?YWQ3UExTc1FKV3Q3eGF4b0tCWGRFbFcwU1hGL2RkUnVMM3hnQUdQTTJEd01m?=
 =?utf-8?B?YjIwWk4rOTE2d2w5aUx0dGx0YkVCZGR2VWd4ZjR3YTZVdllONUpWNmhhOFJn?=
 =?utf-8?B?STNZY3hCMkFKSTcydVFhWStCbjlRaWM2UXF6S3lkcXZRUU9PUjBIRGpzQU14?=
 =?utf-8?B?QmRNa0hCTlpNVGhpSVh3b1BPZW5FWUhhbDN3b0wwOXdJRDBRRUpYeU9wc1dW?=
 =?utf-8?B?M0hhNittRXlqVHQwMlVaV1NFRldadjZuM0M4MlNrTXRLa0w3QWgwdnk4OXd1?=
 =?utf-8?B?VEZhUGtBaWEzbmVqR3pNV3lxUUdwU0FodXduK0kyV0ZHWHZkRFZSMTZpUmk4?=
 =?utf-8?B?R094OEhySUJRcnRRcmR6ajk1MWNHZzNyR2lCby9WTlh2YkZwaXZudUFnaEVh?=
 =?utf-8?B?SmpJbWp3cXhObnl4WWYwZmE5ZUtXZTY5NC9NcmpzYjUwOFBTNFpVbzRpbnkr?=
 =?utf-8?Q?J1BZcQc6rQJtKtAZknIt1ik=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB2145.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abc33884-907e-4fa4-e732-08d9bb7f563f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2021 01:49:42.9717 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0kkgSBLlRfs3+pXsvDhS00PvCMawpVD0cl7a3MSRYucRe5S9ZxfaU697T7nPfWb56XRpnpIIHHw7CHmBLGm10A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0601MB1956
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGksDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG9wZW5ibWMgPG9wZW5i
bWMtDQo+IGJvdW5jZXMrdHJveV9sZWU9YXNwZWVkdGVjaC5jb21AbGlzdHMub3psYWJzLm9yZz4g
T24gQmVoYWxmIE9mIEFuZHJldw0KPiBKZWZmZXJ5DQo+IFNlbnQ6IEZyaWRheSwgRGVjZW1iZXIg
MTAsIDIwMjEgNzozNSBBTQ0KPiBUbzogRGhhbmFuamF5IFBoYWRrZSA8ZHBoYWRrZUBsaW51eC5t
aWNyb3NvZnQuY29tPjsgSm9zZXBoIFJleW5vbGRzDQo+IDxqcmV5QGxpbnV4LmlibS5jb20+DQo+
IENjOiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNCj4gU3ViamVjdDogUmU6IFNlY3VyaXR5IFdv
cmtpbmcgR3JvdXAgbWVldGluZyAtIFdlZG5lc2RheSBEZWNlbWJlciA4IC0NCj4gcmVzdWx0cw0K
PiANCj4gDQo+IA0KPiBPbiBGcmksIDEwIERlYyAyMDIxLCBhdCAwNDowMSwgRGhhbmFuamF5IFBo
YWRrZSB3cm90ZToNCj4gPj4+IE9uIFRodSwgOSBEZWMgMjAyMSwgYXQgMDU6NDQsIEpvc2VwaCBS
ZXlub2xkcyB3cm90ZToNCj4gPj4+DQo+ID4+Pj4gNCBQcm9ncmVzcyBvbiBCTUMgc2VjdXJlIGJv
b3Q/DQo+ID4+Pj4NCj4gPj4+PiBBU1QyNjAwIGhhcmR3YXJlIHNlY3VyZSBVLWJvb3TCoCBib290
LCB0aGVuIHNlY3VyZSBib290aW5nIHRoZSBMaW51eA0KPiA+Pj4+IGtlcm5lbC4gTm8gYWRkaXRp
b25hbCBwaWVjZXMuDQo+ID4+Pj4NCj4gPj4+PiBTZWUgdGhlIEFTVCBzZWN1cml0eSBndWlkZS7C
oCBIb3cgaXMgc2lnbmluZy1rZXkgbWFuYWdlbWVudCBkb25lPw0KPiA+Pj4+DQo+ID4+Pj4gRGhh
bmFuamF5IHRvwqAgZm9sbG93IHVwLg0KPiA+Pj4gQXMgc29tZW9uZSB3aG8gd2FzIGludm9sdmVk
IGluIGludGVncmF0aW5nIHRoZSBBU1QyNjAwIHNlY3VyZS1ib290DQo+IHN1cHBvcnQgaW50byBP
cGVuQk1DLCB3aGF0J3MgZ29pbmcgb24gaGVyZT8NCj4gPj4NCj4gPj5Tb21lb25lIGFza2VkIHRo
ZSBxdWVzdGlvbiB5b3Ugc2VlIGFib3ZlLCBhbmQgRGhhbmFuamF5IHRyaWVkIHRvDQo+ID4+YW5z
d2VyLsKgIFRoZSBjb25zZW5zdXMgd2FzIHRoYXQgdGhlcmUgaXMgc3VwcG9ydCBmb3IgQVNUMjYw
MCBzZWN1cmUNCj4gPj5ib290aW5nIFUtQm9vdCwgc3VwcG9ydCBmb3IgVS1Cb290IHNlY3VyZWx5
IGxvYWRpbmcgdGhlIExpbnV4IGtlcm5lbCwNCj4gPj5hbmQgbm8gYWRkaXRpb25hbCBzdXBwb3J0
LsKgIFlvdXIgc3VtbWFyeSB3b3VsZCBiZSBhcHByZWNpYXRlZC4NCj4gPj4NCj4gPj5JcyB0aGVy
ZSBhIGRvY3VtZW50IHdoaWNoIHdoYXQgYSBzeXN0ZW0gaW50ZWdyYXRvciBuZWVkcyB0byB1c2Ug
dGhpcw0KPiA+PmZ1bmN0aW9uP8KgIElkZWFsbHkgaXQgd291bGQgYmUgbGlua2VkIGZyb20NCj4g
Pj5odHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9kb2NzL2Jsb2IvbWFzdGVyL2ZlYXR1cmVzLm1k
DQo+IA0KPiBUaGVyZSdzIG5vdCBtdWNoIGRvY3VtZW50YXRpb24gYXMgeWV0LiBwMTBibWMgY2Fu
IGJlIHVzZWQgYXMgYW4gZXhhbXBsZQ0KPiBvZiBhIHN5c3RlbSB0aGF0IGVuYWJsZXMgaXQuDQo+
IA0KPiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1jL2Jsb2IvYWRlM2UxNDVlYWQw
YmVlZGFkMTgxMzk0Zg0KPiBjYWE2Mzg1NjE3NmJkZWUvbWV0YS1pYm0vY29uZi9tYWNoaW5lL3Ax
MGJtYy5jb25mI0wzOS1MNTYNCj4gDQo+IEdpdmVuIHRoZSBsYWNrIG9mIGRvY3VtZW50YXRpb24g
aXQncyBwcm9iYWJseSBhbHNvIHJldmlld2luZyB0aGVzZSBwYXRjaGVzIGluDQo+IHRoZSBjb250
ZXh0IG9mIHRoZSBjb25maWd1cmF0aW9uIGFib3ZlOg0KPiANCj4gaHR0cHM6Ly9nZXJyaXQub3Bl
bmJtYy1wcm9qZWN0Lnh5ei9xL3RvcGljOiUyMnNlY3VyZS0NCj4gYm9vdCUyMisoc3RhdHVzOm9w
ZW4lMjBPUiUyMHN0YXR1czptZXJnZWQpDQo+IA0KPiA+DQo+ID4gUmlnaHQsIEkgbm90ZWQgcmVj
ZW50IHN1Ym1pc3Npb25zIHRvIFUtQm9vdCBhbmQgS2VybmVsLg0KPiA+ICgxKSBIQUNFL0FSQ1kg
c3VwcG9ydCBpbiBVLUJvb3QNCj4gPiAoMikgT1RQIHN5c2ZzIGFjY2VzcyBmb3IgbG9nZ2luZyBT
ZWN1cmUgQm9vdCBzdGF0dXMuDQo+ID4NCj4gPiBOZWVkIGNsYXJpdHkgcmVnYXJkaW5nIE9UUCBw
cm9ncmFtbWluZy4NCj4gPiAoMSkgVGhlcmUncyBMaW51eCB0b29sDQo+IA0KPiBJIGFzc3VtZSB0
aGlzIHJlZmVycyB0byBzb2NzZWM/IFRoZSBzb2NzZWMgcmVwbyBwcm92aWRlcyB0d28gdG9vbHM6
DQo+IGBzb2NzZWNgIGFuZCBgb3RwdG9vbGAuIGBvdHB0b29sYCBjYW4gYmUgdXNlZCB0byBnZW5l
cmF0ZSB0aGUgT1RQIGltYWdlIGFuZA0KPiBleGVyY2lzZSBzaWduYXR1cmUgdmFsaWRpdHkuDQo+
IA0KPiBodHRwczovL2dpdGh1Yi5jb20vQXNwZWVkVGVjaC1CTUMvc29jc2VjLw0KPiANCj4gPiBh
bmQgVS1Cb290IHBhdGNoZXMgZmxvYXRpbmcgc29tZXdoZXJlLg0KPiANCj4gSSdtIG5vdCBzdXJl
IHdoYXQgcGF0Y2hlcyB5b3UncmUgcmVmZXJyaW5nIHRvIGhlcmUsIGNhbiB5b3UgY2xhcmlmeT8N
Cj4gDQo+ID4gKDIpIEFueSBzcGVjaWZpYyBPVFAgc3RyYXBzIHByZWZlcnJlZCBieSBPcGVuQk1D
LCBlLmcuIGVuYWJsaW5nIGFsdA0KPiA+IGJvb3QgKEFCUikuDQo+IA0KPiBUaGVyZSdzIG5vIHJl
YWwgcHJlZmVyZW5jZS4gTXkgaW50ZW50IGlzIHRvIGFkZCBhIHJlY2lwZSB0aGF0IGNhbiBjb25z
dW1lIGENCj4gcGxhdGZvcm0tc3BlY2lmaWMgb3RwdG9vbCBqc29uIGNvbmZpZyBhbmQgc3BpdCBv
dXQgdGhlIE9UUCBiaW5hcnkgYXMgYSBidWlsZA0KPiBhcnRlZmFjdC4gQ3VycmVudGx5IEkganVz
dCBoYXZlIHRoZSBjb25maWcgY2FwdHVyZWQgaW4gYSBzZXBhcmF0ZSByZXBvDQo+IGludGVybmFs
bHkgYW5kIEkgZ2VuZXJhdGUgYmluYXJpZXMgZnJvbSB0aGF0IHVzaW5nIG1ha2UuDQo+IA0KPiA+
ICgzKSBBbnkgaW50ZXJlc3QgaW4gdXNpbmcgZW5jcnlwdGlvbiBiZXNpZGVzIFNIQS9SU0EgYXV0
aD8NCj4gDQo+IFNIQS9SU0EgaXMgd2hhdCBJQk0gd2lsbCBzaGlwIHdpdGggaW4gY3VycmVudCBw
bGF0Zm9ybXMsIHNvIG5vdCBmcm9tIHVzLg0KPiANCj4gQW5kcmV3DQoNClRoZXJlIGlzIGEgc2Vj
dXJlIGJvb3QgZG9jdW1lbnQgaW4gcmV2aWV3Lg0KaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9q
ZWN0Lnh5ei9jL29wZW5ibWMvZG9jcy8rLzI2MTY5DQoNClRoZSBzZWN1cmUgYm9vdCBoYXJkd2Fy
ZSB2ZXJpZmllcyByb290IG9mIHRydXN0IGltYWdlLCBpLmUuIHUtYm9vdC1zcGwuYmluLCBhbmQg
Y2hhaW4tb2YtdHJ1c3QgaW1hZ2UgKHUtYm9vdC5iaW4gYW5kIGtlcm5lbC9pbml0cmFtZnMpIGFy
ZSB2ZXJpZmllZCBieSB1LWJvb3QgdmVyaWZpZWQgYm9vdCBmZWF0dXJlLg0KDQpNeSBxdWVzdGlv
bnMgaXMgaG93IGRvZXMgcm9vdCBmcyBiZWluZyB2ZXJpZmllZD8gQXJlIHlvdSB1c2luZyBVQkkg
RlMgYXV0aGVudGljYXRpb24gc3VwcG9ydCBmb3IgdGhpcyBwdXJwb3NlPw0KDQpUaGFua3MsDQpU
cm95IExlZQ0K
