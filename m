Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B0549ADC7
	for <lists+openbmc@lfdr.de>; Tue, 25 Jan 2022 09:01:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjfRz5QVFz3bZb
	for <lists+openbmc@lfdr.de>; Tue, 25 Jan 2022 19:01:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=guy5CrIN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=40.107.130.131;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=spencer.ku@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=guy5CrIN; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300131.outbound.protection.outlook.com [40.107.130.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjfRW1Sgwz30L4
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jan 2022 19:00:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eilmr4UYq2EKwvI+QdS2fhwGNmuE+FL35L8FgG+O6aeO+neA8ZOM9GvhUfLrcV1wX6zrIdi3YKi+dT4Kz8IeAewuESB6qg2M/x0v2rpufa6h17rMWnCD4mO7h9EfGSGouRYc1bV5u+zo6vKhBD1Hjxj+u33/Ip9O8tp/4JV92TjR158McU9awJpMKc8ztfqLwl+OE5s7L0xsdzz1vNRmS5A79B5jTG16ySwYJmpVhaDM1o+zCXTwlno3bby0t5s9bAP69pR6boK1FIO6QBHlXEPayp0K7RpS5tIbjAqVAA3gP+yYyuhBhtkEqpw6jtlw52v1199cuigYFUZQCY4wlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ephjPLD2Yb1HCQa9ZxZsVkH+qHqnaBCWQ8UMNsU4Hyg=;
 b=RnrNou/T5jCdM3fWLxVudbbt054CDQ8ykmbpMsz7rQ6U8sMMD6L6mAoXUbWEpxzh7PPqvHRPgqHO1+04JgwSklRnXulRsVJsEKs2MulGjQZ3Z70D35JZrxOOQ7VzKHNV5xyaTgyQ8QMX8SL55NQmKBzbsbYrgO5JHcX6Pltfga5/5Qqaam+C9dphBwE8rZOddyFzaSaw/m4eYvWVn7eyP55mD80tlWyR+K427c2rl/PNzfZZhiON2UrniXQWxSN+pUxoS+Hcd2HPcRIdcSoWjgsarJ6E3t9ynzbEXu2PTlQgMrgYr6hn0MjBu9Hy0pU4tpUtkSXYTAOIBXcRBTHxFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ephjPLD2Yb1HCQa9ZxZsVkH+qHqnaBCWQ8UMNsU4Hyg=;
 b=guy5CrINa4EGAy2BOR6h8EW6yBl/HnGko9iZnwLQwfha7mxtUQ3kWNUierLU35pKg18FS5c9+7kY8T6xibnNQ/P4YzNLyyNhW2hs/2R37gqCvfV69IFI2tzNurgSdBKqeSpc1yKDcfpbYAIcU/uGgJc2u3VUv9fmcpe7zCK/9r8=
Received: from HK0PR04MB3299.apcprd04.prod.outlook.com (2603:1096:203:8f::22)
 by KL1PR0401MB4386.apcprd04.prod.outlook.com (2603:1096:820:31::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Tue, 25 Jan
 2022 08:00:17 +0000
Received: from HK0PR04MB3299.apcprd04.prod.outlook.com
 ([fe80::5994:f7bb:bf49:351c]) by HK0PR04MB3299.apcprd04.prod.outlook.com
 ([fe80::5994:f7bb:bf49:351c%5]) with mapi id 15.20.4909.017; Tue, 25 Jan 2022
 08:00:16 +0000
From: =?big5?B?U3BlbmNlciBLdSAopWqlQLfsKQ==?= <Spencer.Ku@quantatw.com>
To: Ed Tanous <ed@tanous.net>
Subject: RE: Implement Ethernet Interface Properties
Thread-Topic: Implement Ethernet Interface Properties
Thread-Index: AdfmmeLt8bsv+QLKRK2scPouEluJvQARsvaAABzs1sAJbZHE8AEV5VIAABQUkLA=
Date: Tue, 25 Jan 2022 08:00:16 +0000
Message-ID: <HK0PR04MB3299DA15E9F30D4810D808A9E45F9@HK0PR04MB3299.apcprd04.prod.outlook.com>
References: <HK0PR04MB329947E4E37431B956A8D17AE4689@HK0PR04MB3299.apcprd04.prod.outlook.com>
 <CAH2-KxDx2BwNMWaGvzUeQZVt4me5WSBvkni3A0ig-ohtxiWEUQ@mail.gmail.com>
 <HK0PR04MB3299920FAFF33D27C503A218E4699@HK0PR04MB3299.apcprd04.prod.outlook.com>
 <HK0PR04MB3299DA39BBF0596CA83BC41EE45A9@HK0PR04MB3299.apcprd04.prod.outlook.com>
 <CACWQX81Er6MEfb+AOGS1XGOw4dULZvSxRAJOGQu+YhBW-jTwfA@mail.gmail.com>
In-Reply-To: <CACWQX81Er6MEfb+AOGS1XGOw4dULZvSxRAJOGQu+YhBW-jTwfA@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd069c08-aa5d-4ae3-11c8-08d9dfd8b98c
x-ms-traffictypediagnostic: KL1PR0401MB4386:EE_
x-microsoft-antispam-prvs: <KL1PR0401MB4386AB9606684405FE9C80D8E45F9@KL1PR0401MB4386.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +5JpfcZlT9/sHIJBFCt0z+GoM6IrJfWEmLv11sng+AMKDXKjD/pBvHwJ4yIctxx6UHi8qGpyZH+b//4aJWU/zCopDtCNiwbBy+f0w20MK15fFbcqbLyeIm0tSEQYIQC2nmTDTy9IpQAX4/PZzDvzqdgzf1QNWS9qSApgjzIYe8g0l12cLfzxF10sJUpYYm92/k3Qt7u3aJgqE6SOpjQS0DrMeeoQwoGItxmJC+dsGdGOh5c+uJ6lUcAiY4GiCmKmqRU05x8ND+xrj0skfwZc15duM5K2sENb+4qgtckJqCfCrOxdg6gye+VKG2X1Mgpaugk2mM0b8/ummnnHxpp+/TjQcShNuvL+9nBZvjS3+sj81+w0nweiTSkJdtWxQ2S45UjJ8YBbaYAud82Sc77Ds+TBEU16mkwDcA4AKWTJgpSJugJTchrnRU/NkLBkHC6sKzMPm42u2CjO2d1sodNBwu2V6B6L6J+010P1FhI2kj0RmxxXwXgnJ+ZXazQFm895OPfTrP/cfPHPfrDlZ144lQ2cQapkpiCdz1fWctbR4gvWu/8Fh2dZwnczJR9g2fWlZhfEoKBaYeElfB6sYjqoMbBhCU0rkXQ8qY6pZLUSam9maJOd9gFqVoVQ0rk7WDAgpw3qDDa6/LDMGZWPTPDvHDCpklZcVj1XyJLz9cyysSAEeooeOGqEuWfCNeWfDkUKxh77VA9T+t4IACKJySKKfBUv0ORSXMFy0i5DY0YynYjFzDSgpNi2uzJiZOXCgr/FbI0LgdWysShON4bSxVcz0A5xd+6/WVUzTdbWUIxRfjE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3299.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(6506007)(45080400002)(508600001)(966005)(6916009)(26005)(66556008)(66476007)(66946007)(64756008)(186003)(66446008)(55016003)(33656002)(122000001)(53546011)(52536014)(3480700007)(8936002)(54906003)(8676002)(4326008)(316002)(85182001)(5660300002)(38070700005)(38100700002)(2906002)(76116006)(7696005)(9686003)(86362001)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?RWtBWG9uNStiZnNIbjlVVWFleW9hdS9ZM2VtaFRTZ01mbTloMEtXVmNwMVlLcUpy?=
 =?big5?B?L2dTWlBwcHQySGd3OSs3Qk1KTTdvUnNMYTM2bGUrcDF1bXg1RmFWcUtLT1lVY1JP?=
 =?big5?B?K2hSNENWb1lrK3dUa211M1c1T2hGSklTR1ludkMxZ1NLbW80RzNzTzltYUVkMzUy?=
 =?big5?B?MG5veVcrcCtoMnM1bHdrK1NsYTFmUFJ5UGtkL1RLUGtlU0w5RlI1TXFSWHQwYlpC?=
 =?big5?B?YlI3eGVjZFIxSmo3SUxuV2pGV29EcVNHaDJwZ1hZZ0lsY3Iwa29ST21ubnN4YWxq?=
 =?big5?B?clhpdjFxTytSTEU1RVh4RFRsbDR1VjhBaTdUTXJrYzgwK2ZjWlJhVTdNSGsrNk14?=
 =?big5?B?K3MxQllyVGRDZWhNOXc5WERBaWppVHU1T05YMndxT3V6YkNxQzlYV01STHh2Yi95?=
 =?big5?B?TjlERWNTYTEzYkhXMlQyWGljWW52WXprWnBhRXRhcE5GSHFxSVpNaTIyRVJFR3hj?=
 =?big5?B?dkdnQnZlYnN6ZS9QVWlmajJlWWNYRXE0WEZRUS9oRTRLUTlRVWhjVWdCNWpDaERs?=
 =?big5?B?bi9YU1F0Qi9VaXpxVlVsb2hQek5uamJEbHRvQXlFUkpYUHBnM0RZZThHZURyRkw2?=
 =?big5?B?dEVrMklCVkFkcTZpd0hZZVFMZ3JQWFViYVFDVGcvUVg1bzVRMWZBN0oyQmUzdE1u?=
 =?big5?B?VGJDVWZqb0FkTW54UitQMzlTRmNyV2dJTWRRd1JmazBXbGZJTTF0a2ZKY0RDYzZx?=
 =?big5?B?d0ZSWDdBSzRKd2U3M09OamZqbVBuNUgvSVN4WThlT3lDdU5QbHBDc3NucUViZnR6?=
 =?big5?B?R3lGdVF3ZWhvQm9GSy9CcVVMQm82TXlvTU5lNTY5bUFYcG1rZlZMaC9YVmlxZ1dh?=
 =?big5?B?bkkydnRQQmZBajJwZjBTbHE4V3UxcG5pVmJxa0JCSFZtSWh0RUY3WitFR2ExRm5I?=
 =?big5?B?RVdodWIydGtwNTdLMU02VkpjU013czBMajdTRmVvYVlYbUZIQmJ4YTJMc216MFA3?=
 =?big5?B?VnVOWUpWZ3lyWnNNVy8wWEpKSy83ZjdxYjd2ZWZBeFBhbyswais5bm5TbDdIY0V1?=
 =?big5?B?SDMxdUk3WGxQdE9Vb3QzVTRDblU4TEpZczdIL1U3UzBmc3Azek5WOGZrMjJVV0hw?=
 =?big5?B?SjFzVWlFcCs2NS93dGJ6UWUzKzRaWTZnNkRTK2x4VEUvMHhzdFBzQk16NDYySFli?=
 =?big5?B?OU9WTTFla2FvWmI3L1dyeEx1ZjN5TVRNYVZLbVdhYjJ6RkY0RjlGdWIxWSt1blFk?=
 =?big5?B?ZVcvNGsvOWxURzhpYUxiVFVYQmkycUlnTWVEWGQwSnpFSWNnMjhlQ0dLamlnYTVo?=
 =?big5?B?MGNFZzVVT0g2RHp1OEYzQWlRaERaQzg4cDkrWFhLRWFGTlpTYjYxWllRUVRSZ2lO?=
 =?big5?B?SHJqR3RKTnYvYzBER1ZpTXdFNmkxZDM5dE5PZWU2OFY0dmpDUVpjT3ltTzRnTFZ0?=
 =?big5?B?NTV3ZjVqcG1yclpHUnhGMFIvNDVPSzQ4Z05uTklETjNzLzN4b3FUemU2d2crSno4?=
 =?big5?B?WFRkU3RHMWpDbnRXY0lTdjVzc3NZQVFUUDJ0REUyYXNnZXlZR1FTUWIralZyZGlq?=
 =?big5?B?RXNSWlZ6ajVvVzF3ZVluc1dSK1hXSzltZnlwMEFyVHIzNnZkd3l1MDVVVmRxRmxV?=
 =?big5?B?RFpCdHRLQUc5dUlTT2JZbnJFM3hLM1FnTGd3T3FIOHZGMjBSZU5TbWVqUGZNdUE1?=
 =?big5?B?U3lONE0vR1F3SU5xZ21WLzBFNXd6YUZhNlhQeG14NmZXNjQ2MzdXYVNPOGFqZ3BM?=
 =?big5?B?QkVjZVpCZ1NWazR6Z2FpVkdSM2QvelA1LzJOaW83VXVSeWdXeWNaQnYxUDdBS3lI?=
 =?big5?B?bEN1aXpYWVdBRFpNTlRtRXh3RmVjOTdrdzlhTFljTTdHT0l3U1hDak0vblk3eU01?=
 =?big5?B?ODlCNm82ZTlrUmt6VnZJcnBHeCt6djZnU1dXM2ZXU2Y5QlB2OVZCbGVBOTJEYUhC?=
 =?big5?B?cEE1RHNVNTcrNU42TWpYemM1R3RpaHpyYVJmWnVEd3FSdFBvNXc1YlRVRmhnakha?=
 =?big5?B?azlXcVF4d0M5QnlxOVQxbkk0RmxNQWxXaHBKNjNocVY0TlhVQ2J1U1AxMGtOYU5p?=
 =?big5?B?MUZMK3ZvT0tGTWhnSHZ2bXFoNURhbXhSamRhQXNqSXhLMjZQWFE2Ym41VjNCM3lh?=
 =?big5?Q?oP/wFGgU7jw=3D?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3299.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd069c08-aa5d-4ae3-11c8-08d9dfd8b98c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2022 08:00:16.6811 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q5uY4r1AjfeLtNQEV3HauR6pSSFmEhqoDy6uiQxywrGdbmE4Qgly0X6oJoajlJRVZPRBv7EGcCFbKLjQa1GwyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB4386
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
Cc: =?big5?B?TGl0enVuZyBDaGVuICizr6dR2nop?= <Litzung.Chen@quantatw.com>,
 =?big5?B?RnJhbiBIc3UgKK59u3jBvik=?= <Fran.Hsu@quantatw.com>,
 Ed Tanous <edtanous@google.com>, Nan Zhou <nanzhou@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgRWQsIHRoYW5rIHlvdSBmb3IgdGhlIGZlZWRiYWNrIQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+IEZyb206IG9wZW5ibWMNCj4gPG9wZW5ibWMtYm91bmNlcytzcGVuY2VyLmt1
PXF1YW50YXR3LmNvbUBsaXN0cy5vemxhYnMub3JnPiBPbiBCZWhhbGYgT2YNCj4gRWQgVGFub3Vz
DQo+IFNlbnQ6IFR1ZXNkYXksIEphbnVhcnkgMjUsIDIwMjIgNDozOCBBTQ0KPiBUbzogU3BlbmNl
ciBLdSAopWqlQLfsKSA8U3BlbmNlci5LdUBxdWFudGF0dy5jb20+DQo+IENjOiBMaXR6dW5nIENo
ZW4gKLOvp1HaeikgPExpdHp1bmcuQ2hlbkBxdWFudGF0dy5jb20+OyBFZCBUYW5vdXMNCj4gPGVk
dGFub3VzQGdvb2dsZS5jb20+OyBGcmFuIEhzdSAorn27eMG+KSA8RnJhbi5Ic3VAcXVhbnRhdHcu
Y29tPjsNCj4gb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOyBOYW4gWmhvdSA8bmFuemhvdUBnb29n
bGUuY29tPg0KPiBTdWJqZWN0OiBSZTogSW1wbGVtZW50IEV0aGVybmV0IEludGVyZmFjZSBQcm9w
ZXJ0aWVzDQo+IA0KPiBPbiBUaHUsIEphbiAyMCwgMjAyMiBhdCAxMjo0NCBBTSBTcGVuY2VyIEt1
ICilaqVAt+wpDQo+IDxTcGVuY2VyLkt1QHF1YW50YXR3LmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBI
aSBBbGwsDQo+ID4NCj4gPiBXZSBmaW5hbGx5IGRlY2lkZSB0byBpbXBsZW1lbnQgc2l4IHByb3Bl
cnRpZXMgdG8gRXRoZXJuZXQgaW50ZXJmYWNlOg0KPiA+IFJ4UGFja2V0cywgVHhQYWNrZXRzLCBS
eEJ5dGVzLCBUeEJ5dGVzLCBSeERyb3BwZWQsIGFuZCBUeERyb3BwZWQuDQo+ID4NCj4gPiBUaG9z
ZSBpbmZvcm1hdGlvbiBjb21lIGZyb20gRXRoZXJuZXQgc3RhdGlzdGljcyBhbmQgd2UgY2FuIHJl
YWQgdGhlDQo+ID4gZmlsZSB0byBnZXQgdGhlIHByb3BlcnR5IHZhbHVlIGRpcmVjdGx5LiAodW5k
ZXINCj4gPiAvc3lzL2NsYXNzL25ldC88RXRoZXJuZXQgbmFtZT4vc3RhdGlzdGljcykNCj4gPg0K
PiA+IEZvciB0aGUgc3VpdGFibGUgcHJvcGVydHkgaW4gRXRoZXJuZXRJbnRlcmZhY2UgbW9kZWws
IHdlIGdvdCB0aGUNCj4gPiBmZWVkYmFjayBmb3JtIFJlZGZpc2ggZm9ydW0gYW5kIHRoZXkgc2Fp
ZCBPRU0gcHJvcGVydGllcyB3b3VsZCBiZSB0aGUNCj4gPiBvbmx5IG90aGVyIG9wdGlvbiBhdCB0
aGlzIHRpbWUuIEZvciBtb3JlIGRpc2N1c3Npb24gZGV0YWlsOg0KPiANCj4gRnJvbSB0aGVpciBy
ZXBseQ0KPiAiV2UgbWF5IG5lZWQgdG8gb3BlbiBkaXNjdXNzaW9ucyBmdXJ0aGVyIGZvciBob3cg
dG8gbW9kZWwgdGhlc2Ugc29ydHMgb2YNCj4gbWV0cmljcyBwdXJlbHkgdW5kZXIgRXRoZXJuZXRJ
bnRlcmZhY2UiDQo+IA0KPiBJIHRoaW5rIHlvdSd2ZSBtaXNpbnRlcnByZXRlZCB0aGUgcmVzcG9u
c2UuICBUaGV5IGFza2VkIGZvciBmdXJ0aGVyIGRpc2N1c3Npb24NCj4gb24gaG93IHRvIG1vZGVs
IGl0LCBhbmQgdGhhdCBPRU0gd291bGQgYmUgdGhlIGFsdGVybmF0aXZlIGlmIHlvdSB3ZXJlbid0
IGFibGUNCj4gdG8gZGlzY3Vzcy4gIEdpdmVuIG91ciBydWxlcyBhcm91bmQgT0VNIHNjaGVtYXMs
IHBsZWFzZSBjb250aW51ZSB0aGUNCj4gZGlzY3Vzc2lvbiB3aXRoIHRoZSBSZWRmaXNoIGZvcnVt
IGFyb3VuZCB0aGlzIHRvcGljIHRvIGRldGVybWluZSB0aGUgcmlnaHQgd2F5DQo+IHRvIG1vZGVs
IHRoaXMgaW4gdGhlIHN0YW5kYXJkIHdpdGhvdXQgT0VNLiAgVGhlcmUgaXMgbm90aGluZyB1bmlx
dWUgYWJvdXQNCj4gT3BlbkJNQyB3aXRoIHJlZ2FyZHMgdG8gdGhlc2UgdGVsZW1ldHJpZXMsIHNv
IGl0IHNob3VsZCBiZSBnZW5lcmljLiAgVGhpcw0KPiBtaWdodCBiZSBhIGdvb2QgY2FuZGlkYXRl
IGZvciB0aGUgbmV3bHkgZm9ybWVkICJEaWFnbm9zdGljRGF0YSIgcmVzb3VyY2UNCj4gbW9kZWws
IHdoaWNoIGlzIGluaXRpYWxseSBleHBvc2luZyBiYXNpY2FsbHkgdGhpcyBzYW1lIHRlbGVtZXRy
eSwgYnV0IGZvciBpMmMNCj4gbGFuZXMgaW5zdGVhZCBvZiBuZXR3b3JrIGxhbmVzLg0KPiANCg0K
VW5kZXJzdGFuZCwgYWZ0ZXIgbG9va2luZyBmb3IgdGhlIERpYWdub3N0aWNEYXRhIHJlc291cmNl
IG1vZGVsLCBJIHRoaW5rIHRoZSBtb2RlbCBpcyBhY3R1YWxseSBtb3JlIHN1aXRhYmxlIGZpZWxk
IGZvciB0aGUgRXRoZXJuZXQgc3RhdGlzdGljLg0KSSB3aWxsIGNvbnRpbnVlIGRpc2N1c3Mgd2l0
aCB0aGVtIGFuZCBzZWUgaWYgdGhlIEV0aGVybmV0IHN0YXRpc3RpYyBjYW4gYmUgdGhlIHN0YW5k
YXJkIHVuZGVyIHRoZSBEaWFnbm9zdGljRGF0YSBvciBFdGhlcm5ldEludGVyZmFjZSBtb2RlbCB3
aXRob3V0IE9FTS4NCg0KPiA+IGh0dHBzOi8vYXBjMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0
bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRnJlZGYNCj4gPiBpc2hmb3J1bS5jb20lMkZ0aHJl
YWQlMkY1NzklMkZhZGRpdGlvbmFsLWluZm9ybWF0aW9uLWV0aGVybmV0LWludGVyZmFjDQo+ID4N
Cj4gZSZhbXA7ZGF0YT0wNCU3QzAxJTdDU3BlbmNlci5LdSU0MHF1YW50YXR3LmNvbSU3Q2UxYWY5
ZDliNTUyMDQ3NQ0KPiBmMDAxODANCj4gPg0KPiA4ZDlkZjc5N2MxZiU3QzE3OWIwMzI3MDdmYzQ5
NzNhYzczOGRlNzMxMzU2MWIyJTdDMSU3QzAlN0M2Mzc3ODYNCj4gNTM1MTYwNw0KPiA+DQo+IDM4
ODI4JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lW
Mmx1DQo+IE16SWlMQ0pCDQo+ID4NCj4gVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MzMDAw
JmFtcDtzZGF0YT1IUDFsaEclMkZ0bnVLdmdza09lcw0KPiBkd0RycEoNCj4gPiA3UzU2WG1YQVhK
ckZVd1YlMkY2JTJCWSUzRCZhbXA7cmVzZXJ2ZWQ9MA0KPiA+DQo+ID4gVGhlIGZvbGxvd2luZyBv
dXRwdXQgaXMgdGhlIHJlc3VsdCBvZiBteSBjdXJyZW50bHkgT0VNIGltcGxlbWVudDoNCj4gPiBo
dHRwczovLyR7Ym1jfS9yZWRmaXNoL3YxL01hbmFnZXJzL2JtYy9FaGVybmV0SW50ZXJmYWNlcy9l
dGgwDQo+ID4gew0KPiA+ICAgIkBvZGF0YS5pZCI6ICIvcmVkZmlzaC92MS9NYW5hZ2Vycy9ibWMv
RXRoZXJuZXRJbnRlcmZhY2VzL2V0aDAiLA0KPiA+ICAgLi4uDQo+ID4gICAiT2VtIjogew0KPiA+
ICAgICAiU3RhdGlzdGljcyI6IFsNCj4gPiAgICAgICB7DQo+ID4gICAgICAgICAiUnhCeXRlcyI6
IDQ4MjQ0MDI2LA0KPiA+ICAgICAgICAgIlJ4RHJvcHBlZCI6IDIyMjg1NiwNCj4gPiAgICAgICAg
ICJSeFBhY2tldHMiOiA0ODQzMTUsDQo+ID4gICAgICAgICAiVHhCeXRlcyI6IDgyNTg0NSwNCj4g
PiAgICAgICAgICJUeERyb3BwZWQiOiAwLA0KPiA+ICAgICAgICAgIlR4UGFja2V0cyI6IDU0NzIN
Cj4gPiAgICAgICB9DQo+ID4gICAgIF0NCj4gPiAgIH0sDQo+ID4gICAiU3BlZWRNYnBzIjogMTAw
LA0KPiA+ICAgLi4uDQo+ID4gfQ0KPiA+DQo+ID4gQnV0IGl0IGNhbm5vdCBwYXNzIHRoZSBSZWRm
aXNoIHZhbGlkYXRvciwgYW5kIGhlcmUgaXMgdGhlIGVycm9yIG1lc3NhZ2VzOg0KPiA+IEVSUk9S
IC0gVGhpcyBjb21wbGV4IG9iamVjdCBSeEJ5dGVzIHNob3VsZCBiZSBhIGRpY3Rpb25hcnkgb3Ig
Tm9uZSwgYnV0IGl0J3MNCj4gb2YgdHlwZSAuLi4NCj4gPiBFUlJPUiAtIFJ4Qnl0ZXM6IENvdWxk
IG5vdCBmaW5pc2ggY2hlY2sgb24gdGhpcyBwcm9wZXJ0eSAoJ2ludCcgb2JqZWN0DQo+ID4gaXMg
bm90IGl0ZXJhYmxlKQ0KPiA+DQo+ID4gSXMgdGhlcmUgYW55dGhpbmcgSSBkaWRuJ3Qgbm90aWNl
PyBPciBoYXMgdGhlcmUgYW55IHNwZWMgb3IgZXhhbXBsZSB0aGF0IEkgY2FuDQo+IGZvbGxvdyB0
byBpbXBsZW1lbnQ/DQo+ID4NCj4gPiBJIGhhZCBhbHJlYWR5IHB1c2ggdGhlIGltcGxlbWVudGF0
aW9uIHRvIGdlcnJpdCBhbmQgbWFyayBhcyBXSVAuIEhlcmUgaXMgdGhlDQo+IGxpbms6DQo+ID4g
aHR0cHM6Ly9hcGMwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBz
JTNBJTJGJTJGZ2Vycg0KPiA+DQo+IGl0Lm9wZW5ibWMtcHJvamVjdC54eXolMkZjJTJGb3BlbmJt
YyUyRmJtY3dlYiUyRiUyQiUyRjUwNTIyJmFtcDsNCj4gZGF0YT0wDQo+ID4NCj4gNCU3QzAxJTdD
U3BlbmNlci5LdSU0MHF1YW50YXR3LmNvbSU3Q2UxYWY5ZDliNTUyMDQ3NWYwMDE4MDhkOWRmNzkN
Cj4gN2MxZiUNCj4gPg0KPiA3QzE3OWIwMzI3MDdmYzQ5NzNhYzczOGRlNzMxMzU2MWIyJTdDMSU3
QzAlN0M2Mzc3ODY1MzUxNjA3Mzg4MjgNCj4gJTdDVW5rbg0KPiA+DQo+IG93biU3Q1RXRnBiR1pz
YjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaA0KPiBh
V3dpDQo+ID4NCj4gTENKWFZDSTZNbjAlM0QlN0MzMDAwJmFtcDtzZGF0YT1LbE1mdkU1MEZPWDNE
UHFEb0hmUTk1MlhTTkVNcw0KPiBFRFVwTzJ0ZEYNCj4gPiBqOCUyQlpRJTNEJmFtcDtyZXNlcnZl
ZD0wDQo+IA0KPiANCj4gWW91IGhhdmVuJ3QgbW9kZWxlZCB5b3VyIHNjaGVtYSBwcm9wZXJseSBp
biB0aGUgYWJvdmUuICBUaGlzIGlzIG9uZSBvZiB0aGUNCj4gcmVhc29ucyB3ZSB0cnkgdG8gYXZv
aWQgT0VNIHNjaGVtYXMsIGFzIHRoZXkncmUgZGlmZmljdWx0IHRvIGdldCByaWdodCB3aXRob3V0
DQo+IGhlbHAgZnJvbSB0aGUgc3RhbmRhcmRzIGJvZHkuICBQbGVhc2UgY29udGludWUgdG8gZW5n
YWdlIHdpdGggdGhlbSB0byBnZXQNCj4gdGhpcyBpbiBhIHN0YW5kYXJkIGludGVyZmFjZS4NCj4g
DQoNCkkgc2VlLCBoZXJlIEkgbWlzc2VkIHRoZSBvZGF0YSBJRCBhbmQgb2RhdGEgdHlwZSBwcm9w
ZXJ0aWVzIHdoaWNoIE9FTSBwcm9wZXJ0aWVzIG11c3QgaGF2ZS4NCklmIHdlIGNhbiBsZXQgdGhl
IHByb3BlcnRpZXMgYmVjb21lIHN0YW5kYXJkLCB0aGlzIHByb2JsZW0gY2FuIGJlIGFib3ZlLiAN
Cg0KPiA+DQo+ID4gV2UgYXJlIHdpbGxpbmcgdG8gc2VlIGFueSBzdWdnZXN0aW9ucyBhbmQgYWx0
ZXJuYXRpdmVzIGFzIHdlbGwuIFRoYW5rcyENCj4gPg0KPiA+IFNpbmNlcmVseSwNCj4gPiBTcGVu
Y2VyIEt1DQoNClNpbmNlcmVseSwNClNwZW5jZXIgS3UNCg==
