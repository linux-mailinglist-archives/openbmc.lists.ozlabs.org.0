Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43908393EE4
	for <lists+openbmc@lfdr.de>; Fri, 28 May 2021 10:38:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fryks2bTFz301x
	for <lists+openbmc@lfdr.de>; Fri, 28 May 2021 18:38:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=vaiyou8w;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=40.107.132.123;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=spencer.ku@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=vaiyou8w; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320123.outbound.protection.outlook.com [40.107.132.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrykW0by5z2xZR
 for <openbmc@lists.ozlabs.org>; Fri, 28 May 2021 18:38:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMof21o1UCaq0pvYKR5SI2rv1ce7G1lIlVNAbMK92eCI4iGUC5AXtZVgcInBK1Twb1TT8iYBKv7+mua2TF/RC7CDOzLlKjaQUAKjvpqhSJWmTnSkMARWkMWLpIRLH0JfuVcJ4ZX048rCbbpmsii5fGvTW+cNoM7XsGqO9ULZnWeyodCUHtr2tSshvxTjU8j6lAXoM1xIgIkOREm7zGwR0L8iEEoXjxuoqHcbVzCHTfvPDJ+Ads/9x5uRq01ExuEp6OlrqO2yGJX5p7uz/K/apBvjazQA3/TZVPPxETwWKyBykFIvQCDrtvX1k9A8eB42gKZ0lM7qbydS/oc2gliXOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6owr8bV8TdMgga9cjV+r5x4W20YMK7j2ms+zby/4+Y=;
 b=NLUYdZFa3u83r4YstCF56xbzkCBp9HcUjKbFDYbLsMUeKcwnHbXfCt1HmRk5ZvKFiy4zMlrOVMsNNHvOkA1i2SBNz9NxLdnWQAxl+WxXU5x4+5t8reyo4kZJSQKgzTQhj11QC0FFqyK7urmCS8XoAQFYFJLik0a2KOt9jE59sVtcYxuanCXeLrQCSOtPzNeNEYenn/QZdu7aAu/K5OdFurvl0QagCSHeN0b2V0QHHbs/uTlYKe1yjit6NMGOCEQwSPe4xAtkHw8lep0ZRSHfIZHPvzixke73y9i2mmcHNK/gtGfDWhEmzYlJdAY4Fb17eOXMIgrmiwo1JKPwoC1HTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6owr8bV8TdMgga9cjV+r5x4W20YMK7j2ms+zby/4+Y=;
 b=vaiyou8wf4HPaU4T/gQNx5YAxHr77yFoqN/8we7pQk1lsmS4GqvESI/gIjhOgOSjrEk22ZbuSp6HiugJuV5/WGMdMBFPcHnipzCTacjjQ+ERJbIunjKmZym/ANacgUwfqD6TjTi2m97DScBDSuBpUX8W8fiYpyLNsDsj5DWsvAQ=
Received: from HK0PR04MB3299.apcprd04.prod.outlook.com (2603:1096:203:8f::22)
 by HK0PR04MB3377.apcprd04.prod.outlook.com (2603:1096:203:86::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Fri, 28 May
 2021 08:38:01 +0000
Received: from HK0PR04MB3299.apcprd04.prod.outlook.com
 ([fe80::58c5:e1bc:4f7:5fc0]) by HK0PR04MB3299.apcprd04.prod.outlook.com
 ([fe80::58c5:e1bc:4f7:5fc0%7]) with mapi id 15.20.4150.027; Fri, 28 May 2021
 08:38:01 +0000
From: =?big5?B?U3BlbmNlciBLdSAopWqlQLfsKQ==?= <Spencer.Ku@quantatw.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Implement PCIeType Property
Thread-Topic: Implement PCIeType Property
Thread-Index: AddSxrrWMZyaJu7rSDuh0zFsBYRnoAARg7kAACHGHrA=
Date: Fri, 28 May 2021 08:38:00 +0000
Message-ID: <HK0PR04MB3299AA6B3FA2E231728394A7E4229@HK0PR04MB3299.apcprd04.prod.outlook.com>
References: <HK0PR04MB329955B4A773802B019E1477E4239@HK0PR04MB3299.apcprd04.prod.outlook.com>
 <7703a5cf-a967-a256-71e4-be3f2d7fa411@linux.intel.com>
In-Reply-To: <7703a5cf-a967-a256-71e4-be3f2d7fa411@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=quantatw.com;
x-originating-ip: [114.43.150.14]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6868e19-97b4-4e3b-5bd6-08d921b3e76f
x-ms-traffictypediagnostic: HK0PR04MB3377:
x-microsoft-antispam-prvs: <HK0PR04MB337717169B8F1BE366748F97E4229@HK0PR04MB3377.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RlrX7i6Et/2LCLrwfXq5o3W1sZ9UHoKtjcRC/h600DyBN8D6nscuU4cMisSCWLjaVfOnDtI3/3nH1OWwyRXowwlAf1E9TMH9AZ6btYOxw8uZv5YWzlcdvyS6IbAQM5JJ7djTaS2Dbq0X6wpIaOF/Hy1fUPT/7MtrhkyYv8uMV0SaDm7UcKMK6QvzRuR0gY5NMfHYa/zYeRAvLxVrNLqH9xBjHI+kBH87yep9w43ZZ0LBeCumBuF8az/5FvEyRZrFUjvoEHVPny3ONy/y6UYpjILAQNlBOrRPqiHLXPFnSWcU8z5CPtZdDSniq4vJDG4C08kDme8MLr9+tBPaNhFMu3oeDCziIe+txlWqeQszyRKKnCO1b6rEV/MMRp2iJK5BEcCFfp5sNtMAdNkFrRnGFzRi2I7fDBJJJMjx7XBxmq8Z6r1pUo9zR6xE4NTHHmgsUjSH6SfoA2bA2tHtouFJIbg0A4M3+AKt8JwTddE246SpImdK4BkeNrujba399pDRlz0p0e9JWFrrw2YnVtkBjOT9TylN5qcdF67E5geisGzf6ar9sttD0gMQf8q7ZBIlCV/YAE+DNrbN5Hr0+HiOU+kwGCNHDpVTd+WfzvEJqUo82PsDZt0wBEy20CoSTjOeUkDY/1MDmU5aRht0uCLub0rUVOKbH1lygbcMWRdjoPU1HA0WxvHwUqszGs18Gs0QPDF7LCELsxHeLIoBFnpYkYxsLcBMeMEUqbHuwom/rtoDNJ558QsZWdxO50psTHzBSBdA6YLHBIfMXtSzkKyUVw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3299.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(136003)(396003)(346002)(376002)(366004)(39860400002)(2906002)(86362001)(66446008)(66946007)(53546011)(6506007)(64756008)(76116006)(85182001)(71200400001)(478600001)(3480700007)(45080400002)(83380400001)(52536014)(66476007)(8936002)(66556008)(8676002)(186003)(5660300002)(9686003)(38100700002)(966005)(122000001)(316002)(110136005)(55016002)(33656002)(26005)(7116003)(7696005)(11716005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?bk9yUlE5TTZaTkNWNzFEYmYyZjY0Q0V1LzNSZmthMTBvNm53Tk1SR2VNSWd0TUE1?=
 =?big5?B?b1NWbU9WcnQ4dVpMNGFHY1BZVW9kTzE0U0IyYzBBNGd0bEJ4aHdpNktLN0k5YkFi?=
 =?big5?B?SU05c0J3a0dDNVUzRyt6UURXUlUvc0tjVk5yMitSZ2tWOG1jL3BPajczQklnbnFy?=
 =?big5?B?ZEJzQVVseE93Y0YvSWpteGx6ZVpBSGdrd2ZsSzNrdG0vZDZsZFdVUlpmeTV6czBJ?=
 =?big5?B?SmdmM3NBcTQzalRpOGl5QThabHNCNDhtcFJZanVHQjhxdlY2anhxdjA0d1IvVGF1?=
 =?big5?B?a1d0TWNQdW5qSndLZVI3NzZCVGY3OURjUTBqZFdBWllsUU5TVXlvT3hwM1pIY3lw?=
 =?big5?B?YWJuUGhYL0xucGdIYmphUUxDNEY5cHg3b0pQMU1lcXp5WjZ5aU1wejl5UmxmTyt6?=
 =?big5?B?RnJrN05zVmZUQXdIWW10Vk55c3l3ajVteEUwN1BMcmVwUko0S2tDL0ZhL0wyNWNJ?=
 =?big5?B?anNSWHdCbmZGVFFTZ2ptUGlxYmh6UTVUbGJPU1JxejFTVFBPTC91VStnZGFudUFR?=
 =?big5?B?T3FPZE94dFdGT09ZcGVaTVpsVzhDMEFHMDc3ZHJrbmFHWjI5eERHVCs3Z2RXUVFs?=
 =?big5?B?UzJ2RHVvU0pZZllvanE4MXhTRU5rSDBQYTRxaDI2Sk5FT3ZnT1ZQQ0E2UzJoN0Vv?=
 =?big5?B?V2lNSEZlRzFTbTBSa08xT1NrM1Z6YXUzUnJaWndPRThCMStwNXdLTCtZQTJXTmYr?=
 =?big5?B?WEpPNHF4VE9rZnRFbFI1N2x6TEdGZTJVL0RVaXVoaFQrVTdwMmx0ZE9sSzB0bm50?=
 =?big5?B?OEhYYjU5T29NK2ZyaHI5UGp6SllmUnNmME1Pc1BuMHZsSVRBaGR4NU9ZSHVrMWVB?=
 =?big5?B?eU9SMWdVVEsvWFBadW52TTVJK2RMbHVySERTZTN4NEc1TDEwMEJVNzl3cERzd245?=
 =?big5?B?VFI5bUxCQXV2cVFiRW8wUFRVY3B3SmtSWnZBeGFYMTI1SmRNdGltMC95TzRKenhB?=
 =?big5?B?bklvcWg1RDJlQ3hNQ2ZZTFhmZmhmYkRaa2dtWExKSldLdUVocDJYaGF4c2hIeGZl?=
 =?big5?B?alFKTmJIOVVTOW9UZEhGbHNKa0x4Y0ZvMnBjVHJrVzZSWjF2WWcwNGNmNVlpMkg5?=
 =?big5?B?OVhvbFpqb1MzZWdNckFTOSt1ZXMzY01YQ1NwS0czN0kxcWxEemt4bzlTL0VCTlo0?=
 =?big5?B?VjhSTlZ6R21GN1NiY3NQMVpEbi9GUUUrLzgzQzFCK1NoaWpwSVhpN0N4YnBDVTJw?=
 =?big5?B?aEgzdHRRU2U3WlNQbWhTS1psd3hCbFNDMFFtVFdsNzFKenNGNDB1b1dOVlkxQmdC?=
 =?big5?B?UXRNMk1WQmpDODk0MVZ3cGlJVzE1ZU9uNHprSnJHV2ljelRrUGhkZTRPUzVPTStS?=
 =?big5?B?bEo5RVdYWTNYMFpNeDNsL1JDME45NEhIUkRkVnV3ZE5aMUR5WGlpTzVLMnNkM1g5?=
 =?big5?B?ZzBZeXhHclRJUHRsZnNJZUZGVGNGYnBudGI0d0ZHU1hiVGswa2V0cUFpWlJYWHFX?=
 =?big5?B?SUttMmFrNmsvZnVYUUljcFpOZHF6czVVSVQyWVBTTjI5UWJ2TVdMSGJ4Y3NXUUEr?=
 =?big5?B?M3RWcmF3d2JmeW5FeE1HL1F6eXA0cGVNVnJveUNockZNTmJPa1dJaXRPZTk4SmR4?=
 =?big5?B?Ukc0SDJ1UXRnZzdLN2VidkpGWGtBTXZsUlM4d1IwWjFyZ2x2MFlJdXJ2SVZQS0JB?=
 =?big5?Q?r/soU0YmJpYR1keWjICSX3gc+iY=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3299.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6868e19-97b4-4e3b-5bd6-08d921b3e76f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2021 08:38:01.4144 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fs53jJNJXTHzsPc3XdlPakiggDYoOtC1f4tKT9wiLewmJN45IfSPBFHoVgE9J+o0qEEOfNvUS4qKfTTB9uEKvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB3377
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

SGkgQmlsbHMsDQpUaGFua3MgZm9yIHlvdXIgc3VnZ2VzdGlvbnMhDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmJtYw0KPiA8b3BlbmJtYy1ib3VuY2VzK3NwZW5j
ZXIua3U9cXVhbnRhdHcuY29tQGxpc3RzLm96bGFicy5vcmc+IE9uIEJlaGFsZiBPZg0KPiBCaWxs
cywgSmFzb24gTQ0KPiBTZW50OiBUaHVyc2RheSwgTWF5IDI3LCAyMDIxIDExOjI3IFBNDQo+IFRv
OiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNCj4gU3ViamVjdDogUmU6IEltcGxlbWVudCBQQ0ll
VHlwZSBQcm9wZXJ0eQ0KPiANCj4gDQo+IA0KPiBPbiA1LzI3LzIwMjEgMTI6MDkgQU0sIFNwZW5j
ZXIgS3UgKKVqpUC37Ckgd3JvdGU6DQo+ID4gSGkgQWxsLA0KPiA+ICAgIFdlIHdvdWxkIGxpa2Ug
dG8gaW1wbGVtZW50IFBDSWVJbnRlcmZhY2UgIlBDSWVUeXBlIiBwcm9wZXJ0eSBvbg0KPiA+IGJv
dGggcGVjaS1wY2llIGFuZCBibWN3ZWIsIHRoZW4gSSBmaW5kIHRoZSBQUiB3aGljaCBpbXBsZW1l
bnQNCj4gPiBpbnZlbnRvcnkgcHJvcGVydGllcyBsaWtlIFNwYXJlUGFydE51bWJlciwgTW9kZWws
IFBhcnROdW1iZXIsDQo+ID4gU2VyaWFsTnVtYmVyIGZvciBQQ0llIGRldmljZXMgaW4gYm1jd2Vi
Og0KPiA+IGh0dHBzOi8vYXBjMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3Vy
bD1odHRwcyUzQSUyRiUyRmdlcnINCj4gPg0KPiBpdC5vcGVuYm1jLXByb2plY3QueHl6JTJGYyUy
Rm9wZW5ibWMlMkZibWN3ZWIlMkYlMkIlMkY0MDA1MSZhbXA7DQo+IGRhdGE9MA0KPiA+DQo+IDQl
N0MwMSU3Q1NwZW5jZXIuS3UlNDBxdWFudGF0dy5jb20lN0NjYmM3MTljNTA1NzA0MGYwNTQwMzA4
ZDkyMTINCj4gNDI3MDIlDQo+ID4NCj4gN0MxNzliMDMyNzA3ZmM0OTczYWM3MzhkZTczMTM1NjFi
MiU3QzElN0MwJTdDNjM3NTc3MjYxNDQ2MjQ3OTQ5DQo+ICU3Q1Vua24NCj4gPg0KPiBvd24lN0NU
V0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklr
MWgNCj4gYVd3aQ0KPiA+DQo+IExDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9Y3AxdEdh
JTJGUjdmcDJ5S09EYUI4SFg4JTJCWFBTDQo+IG1WR2pIajRSDQo+ID4gRTZYQU5zdGljJTNEJmFt
cDtyZXNlcnZlZD0wDQo+ID4NCj4gPiBJIHRoaW5rIHdlIG1vZGlmeSBzaW1pbGFyIHBhcnQgb2Yg
Ym1jd2ViLCBidXQgSSBhbSBub3Qgc3VyZSBkb2VzIGl0IHdpbGwNCj4gaW1wbGVtZW50ICJQQ0ll
VHlwZSIgcHJvcGVydHkgaW4gdGhlIGZ1dHVyZS4gU28gY291bGQgd2UgaW1wbGVtZW50DQo+ICJQ
Q0llVHlwZSIgcHJvcGVydHkgZmlyc3Qgc2luY2UgdGhlIFBSIHN0YXR1cyBpcyBXSVA/DQo+ID4N
Cj4gPiBBYm91dCB0aGUgaW1wbGVtZW50IG1ldGhvZCwgZm9yIHBlY2ktcGNpZSBwYXJ0LCBmaXJz
dCB3ZSB1c2UgcGVjaQ0KPiA+IGNvbW1hbmQgdG8gZ2V0IHRoZSBwb2ludGVyIG9mIGNhcGFiaWxp
dHkgaW4gUENJIGNvbmZpZ3VyZSBzcGFjZS4gVGhlbiBnbw0KPiB0aHJvdWdoIGNhcGFiaWxpdHkg
c3RydWN0dXJlIHRvIGZpbmQgY2FwYWJpbGl0eSBJRCBpbiAzcmQgY2FwYWJpbGl0eSBzdHJ1Y3R1
cmUuIElmDQo+IHRoZSBJRCBpcyBQQ0kgRXhwcmVzcywgdGhlbiBnZXQgdGhlIGxpbmsgc3BlZWQg
aW4gbGluayBzdGF0dXMgcmVnaXN0ZXIuIEZpbmFsbHksIHNldA0KPiB0aGUgUENJZVR5cGUgcHJv
cGVydHkgdG8gRC1CdXMgYWZ0ZXIgdHJhbnNsYXRpbmcgKHVuZGVyDQo+IC94eXovb3BlbmJtY19w
cm9qZWN0L1BDSWUvPHN0cj4pIC4gPiBBbmQgZm9yIGJtY3dlYiBwYXJ0LCB3ZSB3aWxsIGNyZWF0
ZQ0KPiBQQ0llSW50ZXJmYWNlIHsiUENJZVR5cGUifSBsZXZlbCAodW5kZXINCj4gL3JlZGZpc2gv
djEvU3lzdGVtcy9zeXN0ZW0vUENJZURldmljZXMvPHN0cj4vICkgYW5kIGZpbGwgdGhlIGluZm8g
ZnJvbSBELWJ1cy4NCj4gPg0KPiA+IE9uIHRoZSBvdGhlciBoYW5kLCB3ZSBhbHNvIGludGVyZXN0
ZWQgYWJvdXQgaG93IHRvIGdldCBQYXJ0TnVtYmVyIGFuZA0KPiBTZXJpYWxOdW1iZXIgaW5mb3Jt
YXRpb24/IEkgYWxyZWFkeSB0cnkgdG8gZ2V0IGZyb20gRlJVIG92ZXIgSTJDIGJ1dCBJIGNhbm5v
dA0KPiBtYXBwaW5nIHRoZSBpbmZvIGJldHdlZW4gRlJVIGFuZCBwZWNpLXBjaWUsIG9yIGlzIGl0
IGNhbiBlYXNpbHkgZ2V0IGJ5DQo+IHBlY2ktcGNpZT8gQW55IGNvbW1lbnRzIGFuZCBzdWdnZXN0
aW9ucyBhcmUgd2VsY29tZSENCj4gcGVjaS1wY2llIGN1cnJlbnRseSBjYW4gb25seSBnZXQgaW5m
b3JtYXRpb24gdGhhdCBpcyBhdmFpbGFibGUgb3ZlciBQQ0kuDQo+ICAgSWYgdGhlc2UgbmV3IGZp
ZWxkcyBjb21lIGZyb20gc29tZXdoZXJlIG90aGVyIHRoYW4gUENJLCBpdCBjb3VsZCBiZQ0KPiBk
aWZmaWN1bHQgdG8gYWRkIHRoZW0uDQpZZXMsIGl0IGlzIGFjdHVhbGx5IHRoZSBxdWVzdGlvbiB3
aGF0IEkgbWVldC4gU2luY2UgaXQgaXMgaGFyZCB0byBhZGQgdGhlbSB0b2dldGhlciwgSSBhbSB0
cnkgdG8gZmluZCBpcyB0aGVyZSBhIHdheSB0byBnZXQgdGhvc2UgZGF0YSBvdmVyIFBDSS4gDQo+
DQo+IElmIHRoZXNlIG5ldyBmaWVsZHMgYWxsIGNvbWUgZnJvbSB0aGUgRlJVLCB0aGVuIHdlIHNo
b3VsZCBhbHJlYWR5IGhhdmUgdGhhdA0KPiBkYXRhIGluIG90aGVyIGFwcGxpY2F0aW9ucywgc28g
d2Ugc2hvdWxkbid0IG5lZWQgdG8gZ2V0IGl0IGluIGEgUENJIGFwcGxpY2F0aW9uLg0KSSB0aGlu
ayB0aGlzIGlzIGJlY2F1c2UgcmVkZmlzaCBzY2hlbWEgZGVmaW5lZCB0aGUgcHJvcGVydHkgYW5k
IGl0IGlzIGNvbnZlbmllbmNlIGlmIHdlIGNhbiBnZXQgUENJIGluZm9ybWF0aW9uIHRocm91Z2gg
b25lIHJlZGZpc2ggVVJJLg0KQnV0IG9mIGNvdXJzZSBpdCBzaG91bGQgYmUgYSBmZWFzaWJsZSBt
ZXRob2QuDQo+IA0KPiBJdCBtYXkgYmUgZ29vZCB0byBkaXNjdXNzIHRoZSBkZXNpZ24gYSBiaXQg
Zm9yDQo+IGh0dHBzOi8vYXBjMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3Vy
bD1odHRwcyUzQSUyRiUyRmdlcnJpdC5vcA0KPiBlbmJtYy1wcm9qZWN0Lnh5eiUyRmMlMkZvcGVu
Ym1jJTJGYm1jd2ViJTJGJTJCJTJGNDAwNTEmYW1wO2RhdGENCj4gPTA0JTdDMDElN0NTcGVuY2Vy
Lkt1JTQwcXVhbnRhdHcuY29tJTdDY2JjNzE5YzUwNTcwNDBmMDU0MDMwOGQ5Mg0KPiAxMjQyNzAy
JTdDMTc5YjAzMjcwN2ZjNDk3M2FjNzM4ZGU3MzEzNTYxYjIlN0MxJTdDMCU3QzYzNzU3NzI2MQ0K
PiA0NDYyNDc5NDklN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlM
Q0pRSWpvaVYNCj4gMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzEwMDAm
YW1wO3NkYXRhPWNwMXRHYSUyRlINCj4gN2ZwMnlLT0RhQjhIWDglMkJYUFNtVkdqSGo0UkU2WEFO
c3RpYyUzRCZhbXA7cmVzZXJ2ZWQ9MC4gIEZvcg0KPiBleGFtcGxlLCBJIHRoaW5rIEZydURldmlj
ZSBhbHJlYWR5IGhhcyB0aGUgRlJVIGluZm9ybWF0aW9uIGZvciB0aGUgUENJZQ0KPiBkZXZpY2Vz
LiAgRG9lcyB0aGUgUENJIGFwcGxpY2F0aW9uIG5lZWQgdG8gY29tbXVuaWNhdGUgd2l0aCBGcnVE
ZXZpY2UgYW5kDQo+IGV4cG9zZSB0aGUgc2FtZSBpbmZvcm1hdGlvbiBhZ2FpbiBpbiB0aGUgUENJ
ZSBpbnZlbnRvcnkgb24gRC1CdXM/DQo+IE9yLCBzaG91bGQgYm1jd2ViIGRpcmVjdGx5IGxvb2sg
Zm9yIHRoZSBGcnVEZXZpY2UgdG8gcG9wdWxhdGUgdGhlc2UgbmV3DQo+IGZpZWxkcz8NClllcywg
SSB0aGluayB0aGF0J3MgdGhlIGdvb2QgcG9pbnQgdG8gZGlzY3VzcyBhYm91dCB0aGUgZGVzaWdu
LiBJIHdpbGwgcHV0IG15IGNvbW1lbnQgdG8gdGhlIFBSLg0KPiA+DQo+ID4gUGxlYXNlIGxldCB1
cyBrbm93IGlmIHRoZXJlJ3MgYW55IGlzc3VlLCB0aGFuayB5b3UhDQo+ID4NCj4gPiBTaW5jZXJl
bHksDQo+ID4gU3BlbmNlciBLdQ0KPiA+DQo=
