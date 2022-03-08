Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F594D0D5F
	for <lists+openbmc@lfdr.de>; Tue,  8 Mar 2022 02:15:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCHSn5gQBz30Ks
	for <lists+openbmc@lfdr.de>; Tue,  8 Mar 2022 12:15:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=RoCRFx5R;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:feab::706;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=RoCRFx5R; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20706.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::706])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCHSC3X3dz2xB1;
 Tue,  8 Mar 2022 12:15:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QDnG3Jqe4hdHPorv5BU7W/WcBwmvOEQw5eiW7pA5yqODoch3/yZ2/vdvoD9S0IYP4g+M6M3rs6aPRwBpWOjnFdHjYaWcflIO1vXSp/lJeqySGAgnhwD15xEmZHROTNwz4yoWTBi+TLIETr62Aeds/3Lwf0NbssxgEd2K1rU05CJGdKkZQ1N5q3+Psoop1yFT0GCHgwiRpwaDWH78WmoIw2O1uR5w/5x+DDp9VwLuhea/6oqUU2TKO9YA+ZUjTv2A0caiaoWmVHVmqYiZBsS8aQqH3e/d9l8rLwlzPUoLm94+SktymfdCjKEnxe6pbA1UutdAUe/SdXs3s6EhTx2+Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMOYavROVOrjhToj5BU5GTlVBc/epX9fyeg5xPRJRFY=;
 b=UKWw2n9utCyqUDbECth9uJuqwE8wpC1Xa86Gvu318z+KBf6axylHQsGxS02RjY5vWCji6vgwaTFi+jjLH+3cAJCv1G00SxGL4rGLBN15i/L69l5E8GnGdZuyeACpxQIp9cBIKkn3kCYquvZ3hqSz1m7YJdnohDUfQL4sxKpH6Gtt+Vd0YQA31VCRhMgOXwr/3LpiN5T+VAz3AJ9PuTWSLzt1UD+l9wB7Cn0anb+PnTSQ+qTI12D5quFBR/9VRP6APi1ltEEeArkFoRss2CzqsD26o4ptTBGzstnUxVlItXIdQvqRuB/jAmkBNUv4TlCEU5nLVOuy4thAcekLZzRmLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMOYavROVOrjhToj5BU5GTlVBc/epX9fyeg5xPRJRFY=;
 b=RoCRFx5R3mcFmV+2yNPGrnBHk3MlxEPjN/4F16bEVnjOOKru9wqzXVCt/3wcx9jkiojf4V7E/XxOBSZtymkFlGy9RstJB5BrTv1X84E7EoagDUk2GZSS7ak0jF0+1Zmna4CLHAVpvHlw4C9IBXRAit+TlgPS+YnNZRCtvjR9mhI=
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by TY2PR04MB2944.apcprd04.prod.outlook.com (2603:1096:404:3f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 01:14:45 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::78b6:1b99:df59:4982]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::78b6:1b99:df59:4982%5]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 01:14:45 +0000
From: =?utf-8?B?UG90aW4gTGFpICjos7Tmn4/lu7cp?= <Potin.Lai@quantatw.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, Joel Stanley
 <joel@jms.id.au>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, Patrick Williams <patrick@stwcx.xyz>
Subject: Re: [SPAM] [PATCH 1/1] mtd: spi-nor: aspeed: set the decoding size to
 at least 2MB for AST2600
Thread-Topic: [SPAM] [PATCH 1/1] mtd: spi-nor: aspeed: set the decoding size
 to at least 2MB for AST2600
Thread-Index: AQHYL+px7Ie8fZ+Wb0mfH3BsbhWaOayvexIAgAAIi4CAA+DAAIAALeuAgACwQgCAAHFsgA==
Date: Tue, 8 Mar 2022 01:14:45 +0000
Message-ID: <597dcccf-f01a-92b5-9b62-72580660a1c5@quantatw.com>
References: <20220304170757.16924-1-potin.lai@quantatw.com>
 <67004879-96ab-33b5-f389-bbe0005d78ef@kaod.org>
 <6ed257f7-ae87-e2fe-26ed-9db300f5ebcc@kaod.org>
 <efeac1dc-0762-b6d3-e03b-dffc2c76d756@quantatw.com>
 <4d072c43-a766-9ce4-a629-a3ed095663a4@kaod.org>
 <e10877f9-57f7-7019-b9ca-0812a60cdea9@kaod.org>
In-Reply-To: <e10877f9-57f7-7019-b9ca-0812a60cdea9@kaod.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82cc22e0-d4cc-4311-7dbc-08da00a10879
x-ms-traffictypediagnostic: TY2PR04MB2944:EE_
x-microsoft-antispam-prvs: <TY2PR04MB2944A4AD36351456348D57508E099@TY2PR04MB2944.apcprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DtuJUVqeS9sD29N4qZ/NrAArE5jb4klhdIzrofyjzepblVBP/UWpyD3netFI1ZE1Vv3ZfRRkSuNxipfAjeb0XEl+kXDL6D+1yJzrIXR3SMNEuY9+eClUQwAFTbw9kRB3hSPsdFcR6fervCelIe+sD46LhuXg3u7ecPuJDe05lEZR8HL0x+GikfXWXVstrPrtvAaJz0NOXr0kQHhizCX0muQhuUuzppmfAAxmOOMepg9mOQ6lH8tXJ+SyiSwzAkNqv+yJ3OQh+lmyOngGDfk0Wf1dIE6g6RYZH9mr1xwd8RFccdDt8tlOX0Hkkz5MNIEkkEdA44qwaAjDluaeSgibVv8jsCuVzfdyV9XGjeD1KCQwXX0vF64yFWXI8IBMdGjzyM4ydL/6ixRMVpjYJal0rAGeYLMfw8YC9KabgiePCHM52dLCMcMtuBCBLANX7uMJWlY6rO5htkeCYWG9Q4KI6ZTYITx+PPWDWsvlvWoAHhFjb5VlTnWgFp7+CHhZOKyF0TofLQJcrQy4IcCt5vpCOEavyXxIi4XCBkaW3H9h241FMjbqP7ODtx3DWY/m2b/rsQrRAidnRGGX2mxR5vPE6NS00lljJlIY9cY00l2mswBpFJELgjOwlTNACtbYsd/OhhSp3pFnRfN7HoOF7U3dAOozASt18GbXsseaKCSmfsmQz7lLOjCAa3yN5gP/hOxk0T2Pxv3CLwEtufH/6Jn+8OSfmYHxvOnbGAc50AhzmXUwxcJfzKNfB+/2B6nx3CtQ0NX3q2DW/f8OthJkFngLLxy7PGkyjkd+6cwhPJ/IINWrRMcl6UjD7A1VRKXeJoHfSTeT3e82Dfn8Jn09rrOBm6p62KBb1iMhrnnUx7nS70JTBiUJRQcpxN0No7LVgpWj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66556008)(86362001)(508600001)(91956017)(66946007)(71200400001)(8676002)(38070700005)(45080400002)(66446008)(64756008)(5660300002)(110136005)(31696002)(966005)(6486002)(316002)(66476007)(76116006)(83380400001)(38100700002)(6512007)(53546011)(66574015)(6506007)(186003)(26005)(2616005)(122000001)(85182001)(8936002)(36756003)(31686004)(2906002)(43740500002)(45980500001)(217643003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aytORnQ5K0ZYOUswc3BtVkdIa21UV2NudVBtenpvSm5WdVJTYjdMQkJzOTVS?=
 =?utf-8?B?b0gweWlNWnFaemtQOHpVY25vQzhiVW9yS1lmaHBxd0RwdnRVTzBCRWpmTkRE?=
 =?utf-8?B?MG1uRDRJYmdIRnFPNjRNQUFnWVN1b05UWGMzVFZLTjkyNVorelhzU0ZjWmZl?=
 =?utf-8?B?cS9rZTZCc0ZXaTM3bEVjTjJnbDdPdHdYbGM0dlpWNEs2a0tBVUY4eUJUTTFu?=
 =?utf-8?B?SU1PL3ZLUjZ2RkJTM0pTVHhVa1Yyd29WWGl0dllDdm85QTBCeUZUZkNCTDFD?=
 =?utf-8?B?Z1lONkorOGtqZjZGQUpPOWhFQkx2Y0VKZkNxZFkvYW1JM1pBaFVmbXhrbmlz?=
 =?utf-8?B?N2hrNVJZZUxseHlLc25DRUxCSVpnZzU4NllDNXZSbEc4enM2QjRadWs0d2hs?=
 =?utf-8?B?d0ZFUnNBVzRkR29hK3UvNlBneURqRVN1dUd5d2J6bjRxSldYOTBkVTF4NW1Z?=
 =?utf-8?B?cUdHSCt5WXc0ZTAxZnVjNHJMbncwcngwdVBSeWNjKzl4eWFrTFU3TFJBKzNz?=
 =?utf-8?B?Mzg5NHNjZmlxeFgwREpoeUQyZDhzYUw4V01lQ2ZybWJERUYrRUx1bTN1T2NG?=
 =?utf-8?B?V01zaTFCejlBRTg4MVdxM2JOb09Tazh5V2NoMXFQcTU1M290V081NVFLTmtq?=
 =?utf-8?B?VUVOVkJRRUlaYzRxaWhiblpUYWxBL1RYWkhENFljak4rN3VWRlMvaU56TGho?=
 =?utf-8?B?NGdSdmoyWWVwTktvTFE0RWtJL1lFaFhUaU1YdXM1TFhIVis0aWdYQTMrb3NQ?=
 =?utf-8?B?a3V0WGtWbkRRNEJkUlVzbVFWVzVzekhSWldkOGQ2elRYNm9zVmdUUi8zSWY1?=
 =?utf-8?B?T1dqeUpZQTZQWUR6dW85cVdGQkRzYVlXV1R3SjlpSzN5ek82TWk3UU9XSlMz?=
 =?utf-8?B?a0hUbXVhSnVzNGIrUS9sbTN4SWJockFiRzdqMVRhQ1dlTjlLK0xCNVlaQ0Zp?=
 =?utf-8?B?a0F4Z3EvTGY1NWY2TE9JdUFSVlVISlRHVkg5b0c0UXluWE1EeU5CUlhnWDQy?=
 =?utf-8?B?eU9hR1FjQ1cwMVI0WDd4SGs2Q3NjbEdzOFV0U2NTdTMvRHNXTGNLVFA4WG1W?=
 =?utf-8?B?QVZjWEdzUWh1SkJRU3d1RnJYS0xWM3ljVVlZQXNQb0lwa1NPWFVDTHpnKzZs?=
 =?utf-8?B?KzBOdDBLVUdaaHJVc0tleWg0YmdpNGpKSzJ4TjBGdElCVmRFKzM4dVp0WG5S?=
 =?utf-8?B?aytiOUcvZC9SdXdhRWg4bHRXTTFUeEhDaVZCbVE5cWFVSW95ZUY4b3BPa2s3?=
 =?utf-8?B?MllUVGEzM2U2MW02NVI5KzNyYWNqYXlHNXpiNFIxcFFtMWRsWWFTTy9oa3hF?=
 =?utf-8?B?RUJDd1F5Rko5RVJPNk56Y2xCL2VMNzVvNGZINmtqSEZIaTlLY1loTmJwcSsw?=
 =?utf-8?B?MkZJSE03RTdoOEhweVhYckkzNDNkZzhMQVBXYlBBQnZZQ1R2cjMxWE4yTElG?=
 =?utf-8?B?NFljUzB1OFQ3K1NmczBBUFN5THlkZG5zQ0w2S1RWRTRXU3pmTWxwWXVFa21v?=
 =?utf-8?B?dkVlWk9DSE1RTERUMjFoQ29NdFo5dHNMWGsvdFVKZzRNdmQ3b1BheWt3QklP?=
 =?utf-8?B?bDNETC85U0h3YWp6K09NeUxtWUk3b2hJRUVMZWI5WWE1U01YUWpzZ1VIOVA2?=
 =?utf-8?B?RzJiS0JyZFg1K2Vhb01wUWVIcU5XTDAzbW9wZFJGeW12enhLbXo4eDNYUUUz?=
 =?utf-8?B?d05RMmlGYTZ4cmZmSm5IbFJhbHhRMDJ2Rm9xa292ZjdGU1B1RWpKSXAvOE5D?=
 =?utf-8?B?YnNocERoOXluWWI2K1RaUldUamtsZkFQY2dUY2VvbUR0VDVsWnJzSWtyVjdK?=
 =?utf-8?B?TTZVZ0hrRE5WWSs0MUpGajdhUlpRUW80RTdwbzRMQnBFSnordDZtZVRhTWZ1?=
 =?utf-8?B?MzU4N2Jkd1NnenowdFZlZk9HOHhYaVFGaUVJRkY0Ylk3cGlFTWNZemFWdDgv?=
 =?utf-8?B?NTVHOHZROGlqdlZ0Q1dXc3YreUZHcVJOQmVvMXNhZHhUcjhXM3d3QTZuMXg4?=
 =?utf-8?B?WUl1TExJUmVuUzhxNGtyR1NUQk5XU1NDMklnUjZDOCtiRnNZdUowL1o5VGl4?=
 =?utf-8?B?OHNPTjZYVGg3U3dXS3ovRTBENGRFeGhxMHE5NGhFdHhoSUhFZzA1RWVqM1Bm?=
 =?utf-8?B?UXRKWjRodkV0RzRGelpBeGNPWExlbURsUXdPd000ZjNJQWdtbXVTTzVkbWhi?=
 =?utf-8?B?MHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0B77ADB9E963C4FB2B1E0E2CC60AD25@apcprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82cc22e0-d4cc-4311-7dbc-08da00a10879
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 01:14:45.7167 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jFVxXV6oF5+eivBo20owXRy0pcz6gNFuGDMs0nNsAVK03RkkT+pCy/a13V/5a9THTHKr6g8Gn1T09ajNnRPC0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB2944
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Q8OpZHJpYyBMZSBHb2F0ZXIg5pa8IDIwMjIvMy84IOS4iuWNiCAwMjoyOCDlr6vpgZM6DQo+IE9u
IDMvNy8yMiAwODo1NywgQ8OpZHJpYyBMZSBHb2F0ZXIgd3JvdGU6DQo+Pg0KPj4+IEkgdGVzdGVk
IHdpdGggc3BpLW1lbSB2MyBwYXRjaCwgaXQgbG9va3Mgc2FtZSBpc3N1ZSBhcHBlYXJlZC4gKHNw
aS1tb2RlbD1teDI1bDgwMCkNCj4+Pg0KPj4+DQo+Pj4gW8KgwqDCoCAwLjU0MTA1MF0gc3BpLW5v
ciBzcGkxLjA6IG14MjVsODAwNSAoMTAyNCBLYnl0ZXMpDQo+Pj4gYXNwZWVkX3NtY19mbGFzaF9z
ZXRfc2VnbWVudCBDUzAgc2VncmVnPTB4MCBbIDB4MzAwMDAwMDAgLSAweDMwMDAwMDAwIF0NCj4+
PiBhc3BlZWRfc21jX2ZsYXNoX3NldF9zZWdtZW50IENTMSBzZWdyZWc9MHg3ZjAwMDEwIFsgMHgz
MDEwMDAwMCAtIDB4MzgwMDAwMDAgXQ0KPj4+IFvCoMKgwqAgMC41NDE5NzZdIHNwaS1hc3BlZWQt
c21jIDFlNjMwMDAwLnNwaTogQ2FsaWJyYXRpb24gYXJlYSB0b28gdW5pZm9ybSwgdXNpbmcgbG93
IHNwZWVkDQo+Pj4gW8KgwqDCoCAwLjU0MjI2N10gc3BpLWFzcGVlZC1zbWMgMWU2MzAwMDAuc3Bp
OiBDRTAgcmVhZCBidXN3aWR0aDoxIFsweDAwMGIwMDQxXQ0KPj4+DQo+Pj4gSSB0aGluayB0aGUg
bW9kZWwgbXgyNWwxNjA2ZSB5b3UgdGVzdGVkIGlzIDJNQiBmbGFzaC4NCj4+DQo+PiBJbmRlZWQu
IFRoYW5rcyBmb3IgdGhlIHRlc3Qgb2YgdjMuIFdlIHNob3VsZCBzZW5kIGEgZm9sbG93dXAgcGF0
Y2gNCj4+IGZvciB0aGlzIDJNQiByZXN0cmljdGlvbiBvbiB0aGUgbWluaW11bSBzaXplIG9mIHRo
ZSBmbGFzaCB3aGVuIHRoZQ0KPj4gcGF0Y2hzZXQgaXMgbWVyZ2VkIG9yIEkgd2lsbCBpZiBhIHY0
IGlzIGFza2VkIGZvci4NCj4NCj4gSGVyZSBpcyBhbiB1cGRhdGVkIHZlcnNpb24gZm9yIHRoZSBz
cGktbWVtIGRyaXZlciA6DQo+DQo+IMKgIGh0dHBzOi8vYXBjMDEuc2FmZWxpbmtzLnByb3RlY3Rp
b24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmdpdGh1Yi5jb20lMkZsZWdvYXRlciUy
RmxpbnV4JTJGY29tbWl0JTJGNDE4MTI2NzI1ZDExODYzYjdiNTFiNzBmZjUwN2QxZGE2ZGIxOTJj
MyZhbXA7ZGF0YT0wNCU3QzAxJTdDUG90aW4uTGFpJTQwcXVhbnRhdHcuY29tJTdDZGU0NmQyNjQy
MmFlNGYyZGJkMTcwOGRhMDA2ODU3NWYlN0MxNzliMDMyNzA3ZmM0OTczYWM3MzhkZTczMTM1NjFi
MiU3QzElN0MwJTdDNjM3ODIyNzQ1NDE3MjYzOTI5JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5
SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJ
Nk1uMCUzRCU3QzMwMDAmYW1wO3NkYXRhPUQ1OTRpVTElMkJEYkRjdkMlMkJQUDF5VVdTTGhHeGxD
R2ZHQzRxV1hoMFFKb0g0JTNEJmFtcDtyZXNlcnZlZD0wDQo+IFRoYW5rcywNCj4NCj4gQy4NCg0K
DQpUaGFua3MgZm9yIHRha2luZyB0aGlzIHBhdGNoIGludG8gc3BpLW1lbSBkcml2ZXIsIHRoZSB0
ZXN0ZWQgbG9nIGFzIGJlbG93Lg0KDQpbwqDCoMKgIDEuOTQ1NzA1XSBzcGktbm9yIHNwaTEuMDog
bXgyNWw4MDA1ICgxMDI0IEtieXRlcykNClvCoMKgwqAgMS45NDU5MjZdIHNwaS1hc3BlZWQtc21j
IDFlNjMwMDAwLnNwaTogQ0UwIHdpbmRvdyByZXNpemVkIHRvIDJNQiAoQVNUMjYwMCBEZWNvZGlu
ZykNCmFzcGVlZF9zbWNfZmxhc2hfc2V0X3NlZ21lbnQgQ1MwIHNlZ3JlZz0weDEwMDAwMCBbIDB4
MzAwMDAwMDAgLSAweDMwMjAwMDAwIF0NCmFzcGVlZF9zbWNfZmxhc2hfc2V0X3NlZ21lbnQgQ1Mx
IHNlZ3JlZz0weDdmMDAwMjAgWyAweDMwMjAwMDAwIC0gMHgzODAwMDAwMCBdDQpbwqDCoMKgIDEu
OTUzMDgzXSBzcGktYXNwZWVkLXNtYyAxZTYzMDAwMC5zcGk6IENhbGlicmF0aW9uIGFyZWEgdG9v
IHVuaWZvcm0sIHVzaW5nIGxvdyBzcGVlZA0KW8KgwqDCoCAxLjk1MzQwOV0gc3BpLWFzcGVlZC1z
bWMgMWU2MzAwMDAuc3BpOiBDRTAgcmVhZCBidXN3aWR0aDoxIFsweDAwMGIwMDQxXQ0KDQoNCkJ5
IHRoZSB3YXksIHRoZXJlIGlzIGEgc21hbGwgZXJyb3Igd2hlbiBjb21waWxpbmcga2VybmVsLCBp
dCBuZWVkcyBmb3J3YXJkIGRlY2xhcmUgZm9yIGJvdGggYXN0MjYwMF9zcGlfZGF0YSAmIGFzdDI2
MDBfZm1jX2RhdGEuDQoNCkFsc28sIEkgc2F3IHlvdSBhZGQgYXN0MjYwMF9mbWNfZGF0YSBmb3Ig
cmVzaXplIGNoZWNraW5nIGFzIHdlbGwsIHNob3VsZCBJIGFkZCBpdCBpbiBhc3BlZWQtc21jLmMg
YW5kIHJlc2VuZCB0aGUgcGF0Y2g/DQoNClRoYW5rcywNClBvdGluDQoNCg0K
