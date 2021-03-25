Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB0F348BE8
	for <lists+openbmc@lfdr.de>; Thu, 25 Mar 2021 09:51:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5f3G460jz30LP
	for <lists+openbmc@lfdr.de>; Thu, 25 Mar 2021 19:51:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=USChPKTH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=711dfbf52=spencer.ku@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=USChPKTH; 
 dkim-atps=neutral
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 4F5f2z52rGz300b
 for <openbmc@lists.ozlabs.org>; Thu, 25 Mar 2021 19:51:06 +1100 (AEDT)
IronPort-SDR: YK06elx2G6G9elerhvEcP3sN5EqNDyWe0yWppQqIX2u1ivK9ItHUbvRJnaxm9dIVVmpbZPG9yD
 sorThY91wKOw==
Received: from unknown (HELO mailbx10.quanta.corp) ([10.243.91.107])
 by mx02.quantatw.com with ESMTP; 25 Mar 2021 16:51:04 +0800
Received: from mailbx09.quanta.corp (10.243.91.106) by mailbx10.quanta.corp
 (10.243.91.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 25 Mar
 2021 16:51:00 +0800
Received: from APC01-HK2-obe.outbound.protection.outlook.com (10.243.91.252)
 by mailbx09.quanta.corp (10.243.91.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Thu, 25 Mar 2021 16:51:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dYz9s3dlT5TO4tz783KV49QBgWt8HDjrrqJY0O1ghFdsqxblYjNccffaxiyN2lmUmBW9JkT9eMgBeGEpdaR8kqQotKAQTEfRqULd+0KwaaZwrBh6LdGCsgcFPgRw03h1K5rW7zfm4uuK1AqT5lQpROj6lsDXxJjN5IKOhcwbV/JTQ5l7R5YgsBnT5Oulowmf/PnZnN4Tm+HyzcMwTMIeDOWfv6QtRarQA2iwuo8DEgtBpbXxkdn9RgA1T4zHP8inbk1hhmmKqRWGO3ktCvPYG3SCwm19yskxNJHtgb+61omPOv8KNAvR3R+gr1+/J4F1FBkwtKg5Uk+0ZC0sIQbK0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCFYnDBaCP7DamK8c/D8KeY7wYJwiNCoyyrRJsBsX1Y=;
 b=KRVkpKRefiSyjREOssiUcx0pBGWuj+HyI69GZI4rzwYmj+CiuTmnXrdk2CaFxj0MDa5NdBZCbURWuoteTsldjeFIHWxBlhyt1bJKWexdD1Q6bfhRlJHfiUsy1QnTBNdYZ8aG2RA/u2ZKu2vuk0egUKyEQNPLQggm8ozT0OmCMnF1bmEu125DeH6OwAtjx9eEGuvKpphC5raQl6maBpqJCyWNqxvBT0v9cfs+70FuOouYl2zlYxwcLCk6pnGDD5LY6PLR6/OFOCAFJrj8B4n4WGJXsKSTIF1Kdwq1Fjf8YQD1PfwA+9fxhx+1V3xifgZPuC9gxuIg7+vcdsV4Np1Wlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCFYnDBaCP7DamK8c/D8KeY7wYJwiNCoyyrRJsBsX1Y=;
 b=USChPKTHNf01j16mzDO9O4ahGvJMNWf/2Qn7hgbGtqDLl8pRGHeRCfFU7i9zb4Ge9ip0N2spj56z0CtDmEO/ey2AzgJHe/FuloMVzPxsGuhhfCSEsLZqiUGGTEc/5rwwce+1bDKbjkOxVm8+bGtJBnYsNqGIf92S+MO3fqV8sVs=
Received: from HK0PR04MB3299.apcprd04.prod.outlook.com (2603:1096:203:8f::22)
 by HK0PR04MB2290.apcprd04.prod.outlook.com (2603:1096:203:4d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Thu, 25 Mar
 2021 08:50:02 +0000
Received: from HK0PR04MB3299.apcprd04.prod.outlook.com
 ([fe80::11f0:d474:d84a:d174]) by HK0PR04MB3299.apcprd04.prod.outlook.com
 ([fe80::11f0:d474:d84a:d174%5]) with mapi id 15.20.3955.027; Thu, 25 Mar 2021
 08:50:02 +0000
From: =?big5?B?U3BlbmNlciBLdSAopWqlQLfsKQ==?= <Spencer.Ku@quantatw.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Question of Redfish PCIe
Thread-Topic: Question of Redfish PCIe
Thread-Index: Adcgidz68K1sr7N0QOC6rlZrAvcSAAAU5HaAAB1k6WA=
Date: Thu, 25 Mar 2021 08:50:01 +0000
Message-ID: <HK0PR04MB3299C0DC54F50342AAB7FA19E4629@HK0PR04MB3299.apcprd04.prod.outlook.com>
References: <HK0PR04MB3299350D35DE18CA5AA040CDE4639@HK0PR04MB3299.apcprd04.prod.outlook.com>
 <694424cf-d7e9-f18f-9ba8-9595fbd702d1@linux.intel.com>
In-Reply-To: <694424cf-d7e9-f18f-9ba8-9595fbd702d1@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=quantatw.com;
x-originating-ip: [220.135.135.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 354ed0e3-285a-45d7-b21a-08d8ef6afa85
x-ms-traffictypediagnostic: HK0PR04MB2290:
x-microsoft-antispam-prvs: <HK0PR04MB22901F35E2E64655B67A97EBE4629@HK0PR04MB2290.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0zt3Ym6cPdAQVqZgjhf1npCwyJU9MMUCcY/za/XEYjeI5N2kJHmGyVq11GaY0guqdlhDTOwHaxtL563C14AmKCzoVmM++YMK2PYtQzhB4tXzIwWQ9iFTv3f5MSltKZF3uIPzGM6lYaS6uIDRreNTTohhxqjdUnVZkDOkm8oMpxAIUzHkp0rGVGwUe7BlAQlEECg97qDgk9pFxLNVqmzle4BFt8m4pcoy8hK8WK1lYas1ddR0kmwJ0oi1BZzpQtmwlcCZnYU9CgXZxOvnTgz+CQ2NCtXLvDl/R4vYIs1ku3C7Hh7paRHxcQ6kCkHEd8nnbyEQpHqQ9wc9W1UcT+nAS7kMW9DbLniCct0NYlBgCKc50v6SEWBRBdz+U/mErJRmRdWdxwczRjamBsZBsRj1XpvTFO2B4FUGwrCJwlu+pZd/25nPH9SARbtC0onoSUw5n8QB5WFZ/KezqzeiUv/4UodZU549NEXthn7x80SVBy0MJvWzW9A5xaOkqsUhVCIpEDgCMIpYM489ZmmYKbaja8Zry38PcGKVLSy2qpebYPS+jzueQtUuo4NHAyRAZv7EWMXqUThRM5Tcx4pYT8kGNs7XVu1gmtgambu8TsBGPekvqB0owrqicodV3kTCvT0lMWSp3u9CFaTg4MB5v48ntg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3299.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(8676002)(38100700001)(86362001)(316002)(66946007)(76116006)(71200400001)(52536014)(85182001)(9686003)(478600001)(66446008)(64756008)(6506007)(7696005)(2906002)(33656002)(55016002)(83380400001)(53546011)(186003)(5660300002)(8936002)(3480700007)(66476007)(110136005)(26005)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?K2JJNGEvczF0TWN3cFhxVDNJdkJBYkdCUjRQcmtmaTFGcWRXUFNpaWpKbk9yNUVi?=
 =?big5?B?UDJ1V2ZFMGtuekdYeWJ1U0IwN3FKdXRSSzc4LzFWYkdrUWpONUVWbXltTnBhVy9T?=
 =?big5?B?REw1QWFGbXQ1dUZpbWVKYVpTUVZuaUdRL1Z4M2g1UkUwMGZLUFVzQ3U0TTQ2dlNu?=
 =?big5?B?U2JFUUV4dXVhOVVzOFBUVXcwdm1uK1BzcUI3NFNTbUdlanBHbHAzQXUzeWpmclhP?=
 =?big5?B?Q0E3UmJWOE1yanBKazE1ejl6R0IxQ1Yzc3MwakxibkVlcEI4REFadWRlUExieWtT?=
 =?big5?B?MjBPaDVFUDF6R3oveGVoTDM1SXV4bDRiUlg2QVREYUZ3NmlEWXFhN1I1dytNdkhE?=
 =?big5?B?N0FJSU9vTEhPQ2htK0FZM2RaQ1UyYnpCeVdMcEZvcUxiTEt3NzN1Q215c2NjMCtO?=
 =?big5?B?NWNwRU9NMkorWXNIRzBYTTVHcnZQQTlRKzdLQUZTQUNQUHlXazc4ZjNJOGo3TVhV?=
 =?big5?B?TWJmVHJqMkh1dU1weXpuSVBURlYwdWczcm4ybFlzeDQ1QnRWSzVsaUppQTBuNU0z?=
 =?big5?B?dlZncFFIbVFuMmMyejhCK2toNVZDVlBxNHN0Y3duUG5ObkUxaWQ3eWRsVFNVaVNV?=
 =?big5?B?dCtjNVdyRW1xNDJMM0lZbmhYVm42K1Z3dXBBM1lYc3hOOVQya2lsNVYzWVB1RCtt?=
 =?big5?B?N1lweFBNQ1FZRlFJV0NheC81cnE2V2NRYjlSaDdLS2pWMmU2dC9XMmNaMU9Fczdm?=
 =?big5?B?RVg1S1AydytHc2NDblhIT3ROUkhSWGZTOTdXd2M4SURCYkRnWkhFY0dCcUU2MmFI?=
 =?big5?B?VmNFaGRVTFQwdDJvdjNhVHBMSUNQakZ4ekY3RFM0NVhWblVFMUxrUjZhRWNBYm1a?=
 =?big5?B?VzJKQ2hXS1R4K1kwNExLZFRxRTQ5YkkrM2NxbHlkMlRKaTRDOXZqVFlUWEEwNk82?=
 =?big5?B?TGVzOGlaUFFycERrSXRLT1pJRUliNm84SmtwdTNMMTBkV2N3NEE2V01pQlRKZmd0?=
 =?big5?B?Rm10VUVRdHoyK1A4R3hkZGQzSW4zU016cU9FekNDUmdJYzY5czJpMWQ3Nlp5T2FG?=
 =?big5?B?MUJaYnNCVUZxUFJCaXByWG0yckcrT3htc1l5MFMyalJIRXo2WjQzNlVqWU14MUYz?=
 =?big5?B?MXpmMXpQSEpvUmV2clIvZGNnTVBaa3hOSXZXTS9ZbStEVHlFUWpKay82Mm9XdHBp?=
 =?big5?B?eGJrbk1LMVhuVXZCNlV5N0EwQWVaa08rQjBwUkJjWDNNRE9rakE2ZWdGWG1Wd3Mr?=
 =?big5?B?NUREZGxBQVZhUUpxZHR4TXBQelJDbkdFaU1tTmZrVGU2d2JSZlVYUTl1QUdCTy85?=
 =?big5?B?OVVEYTZTZ1VETXAyOXBabXBJNGNvdElVUGJxZmJCNWZFS3JLcnFaUTdBSmxtRjJF?=
 =?big5?B?bUhwOEFDK0xvZElONHo0K3FqQkJOdzVhYzJzTVRvY0VudE9XUlVGREhLSE8vSDdz?=
 =?big5?B?dXFyUVlHNk1KU2YvdTJPdXB1WDZEbFBtNHJ0RjdZbGI3d1hpUnJWZ2JyYSs0NWZ2?=
 =?big5?B?S2l1MFcxanBZSk1tV2xrSU04SENZbVRGdXV0Rm9YOWF5Mm1XWnJwSW5sbEozTElx?=
 =?big5?B?Wm1NR1cxeVpiWnlHaVg1RmNlOWxBOTZtK3VYRVNaUmtTT3QzTnRGTjZ2MTZzcjNN?=
 =?big5?B?R3BpWGh5OUk3QkhIZmljUzJjNTlqdXhUblhVWlZMeVJyajN4aURJenJ4V0pwcitS?=
 =?big5?Q?tXhAr6YjmDg5wjS+RvklrKN6IpB+gC4pAYBAmeXaxxfZO666?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3299.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 354ed0e3-285a-45d7-b21a-08d8ef6afa85
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2021 08:50:01.9983 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D60C20n6P8cLNz4fnDC5qIdp+onSrQe9nNGyGx9VpKMd4BSNEMiKWfEaC7Oh286laxpY5fDehRfOam+z67Er4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB2290
X-OriginatorOrg: quantatw.com
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

SGkgQmlsbCwNCk9rYXksIEkgc2VlLiBJIHdpbGwgd2FpdCB0aGUgdXBkYXRlIG9mIHRoZSBQQ0ll
IGludGVyZmFjZSBhbmQgcGVjaS1wY2llLg0KVGhhbmtzIGZvciB5b3VyIHJlcGx5IQ0KDQpTaW5j
ZXJlbHksDQpTcGVuY2VyIEt1DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogb3BlbmJtYw0KPiA8b3BlbmJtYy1ib3VuY2VzK3NwZW5jZXIua3U9cXVhbnRhdHcuY29tQGxp
c3RzLm96bGFicy5vcmc+IE9uIEJlaGFsZiBPZg0KPiBCaWxscywgSmFzb24gTQ0KPiBTZW50OiBU
aHVyc2RheSwgTWFyY2ggMjUsIDIwMjEgMjo0MiBBTQ0KPiBUbzogb3BlbmJtY0BsaXN0cy5vemxh
YnMub3JnDQo+IFN1YmplY3Q6IFJlOiBRdWVzdGlvbiBvZiBSZWRmaXNoIFBDSWUNCj4gDQo+IA0K
PiANCj4gT24gMy8yNC8yMDIxIDE6NDUgQU0sIFNwZW5jZXIgS3UgKKVqpUC37Ckgd3JvdGU6DQo+
ID4gSGkgQWxsLA0KPiA+DQo+ID4gV2UgYXJlIGludGVyZXN0ZWQgaW4gaG93IHRvIGdldCBQQ0ll
IHJlbGF0aXZlIGluZm8gdmlhIHJlZGZpc2gsIGxpa2UNCj4gPiBQQ0llRGV2aWNlLCBQQ0llU2xv
dCBhbmQgc28gb24uDQo+ID4NCj4gPiBJbiBteSBvcGluaW9uLCBwYWNrYWdlIKGncGVjaS1wY2ll
oaggaXMgdXNlZCB0byBjb2xsZWN0IHRoZSBQQ0llIGluZm8NCj4gPiBhbmQgZmlsbGVkIHRoZW0g
aW50byB0aGUgUENJZSBELWJ1cywgYWZ0ZXIgdGhhdCB0aGUgYm1jd2ViIGNhbiBnZXQNCj4gPiBy
ZWxhdGl2ZSBpbmZvIHRocm91Z2ggdGhlIEQtYnVzLg0KPiA+DQo+ID4gVGhlbiBJIGxvb2sgaW50
byB0aGUgZ2Vycml0oaZzIGFjdGl2ZSBwYXRjaGVzIGFuZCBmaW5kIHRoYXQgdGhlIEQtYnVzDQo+
ID4gaW50ZXJmYWNlIGlzIGNoYW5nZWQsIGFuZCBoZXJlIGFyZSBzb21lIGV4YW1wbGU6DQo+ID4N
Cj4gPiBPcmlnaW5hbCBpbnRlcmZhY2UgaW1wbGVtZW50IGJ5IHBlY2ktcGNpZToNCj4gPg0KPiA+
IHh5ei5vcGVuYm1jX3Byb2plY3QuUENJZS5EZXZpY2UNCj4gPg0KPiA+IEN1cnJlbnQgaW50ZXJm
YWNlIHVzZWQgaW4gdGhlIHBhdGNoZXM6DQo+ID4NCj4gPiB4eXoub3BlbmJtY19wcm9qZWN0Lklu
dmVudG9yeS5JdGVtLlBDSWVEZXZpY2UNCj4gPg0KPiA+IHh5ei5vcGVuYm1jX3Byb2plY3QuSW52
ZW50b3J5Lkl0ZW0uUENJZVNsb3QNCj4gPg0KPiA+IERvZXMgaXQgbWVhbnMgdGhhdCBwZWNpLXBj
aWUgd2lsbCBiZSB1cGRhdGVkIHRvIGNvdmVyIHRoZSBELWJ1cw0KPiA+IGNoYW5nZXMgb3IgSSBu
ZWVkIHRvIGFkZCB0aGUgRC1idXMgYnkgbXlzZWxmIHVuZGVyIHRoZQ0KPiA+IHh5ei5vcGVuYm1j
X3Byb2plY3QuSW52ZW50b3J5Lkl0ZW0/DQo+IFllcywgaWYgdGhlcmUgaXMgbm93IGFuIG9mZmlj
aWFsIHBob3NwaG9yLWRidXMtaW50ZXJmYWNlIGZvciBQQ0llIERldmljZXMgdGhhdA0KPiBibWN3
ZWIgd2lsbCBzdGFydCB1c2luZywgdGhlbiBwZWNpLXBjaWUgd2lsbCBuZWVkIHRvIGJlIHVwZGF0
ZWQgdG8gdXNlIHRoYXQNCj4gaW50ZXJmYWNlLg0KPiANCj4gV2hlbiB0aGF0IGNoYW5nZSBtZXJn
ZXMgaW50byBibWN3ZWIsIEknbGwgcGxhbiB0byBwdXNoIGFuIHVwZGF0ZSB0byBwZWNpLXBjaWUN
Cj4gPg0KPiA+IEp1c3Qgd2FudCB0byBrbm93IHRoZSBjdXJyZW50IHN0YXR1cyBvZiByZWRmaXNo
IFBDSWUsIHRoYW5rcyENCj4gPg0KPiA+IFNpbmNlcmVseSwNCj4gPg0KPiA+IFNwZW5jZXIgS3UN
Cj4gPg0K
