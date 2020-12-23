Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA992E1A50
	for <lists+openbmc@lfdr.de>; Wed, 23 Dec 2020 10:06:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D16lW1FkHzDqTq
	for <lists+openbmc@lfdr.de>; Wed, 23 Dec 2020 20:06:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.93.118;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=thu@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=BSZvjXA0; 
 dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2118.outbound.protection.outlook.com [40.107.93.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D16jf2VVjzDqL0
 for <openbmc@lists.ozlabs.org>; Wed, 23 Dec 2020 20:05:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S61+tsECeRqchlM+P/5Ut7fcjfaEABwXps6UgIJURVuKaJBlE2YdWznjRVcznJm+YQXZI+bZmmyliy+XtYwEpl696BpY4c3Qr8P76MAgPPDhPxqT34Qf4BSbhRF9QqMv9OByO/CVE2NZRpEltzJLSSE93ObzgopyS42/3HxJSvA1DD/569pd+gPy5w5K0n9GDVN9kiU3Qf0LcP+ub/6DiW+FNJjBFKbHQi6XRPKYJ7WhweVVix7cqT9oplHehiHfDlZLWuGKM7plUFIHtBRKGWWUaqQr3dNhh7rgqrK4A05OkE40uS10FZA5qjEA2UnCQ6ChZHcyp4NDDE88Tl/s4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFMz+SP3+5lWCxHkCw1cEPgrwtGyVH5R4h5/0Rbj07A=;
 b=HxDeEzoMg/QHeFVdj81UG2/Ri7EQWC5HkbtSa5Kld+/Wfvoa2v9Id2tH9+l6vtdbCV4yOClVYlfjwSPSmLaxWrp9UMT0IufYqCH89Abpm7RO+S3suhUhrUfNZOUf5KYrji8gb0eIqNso+rHc1sLtafkjkTNCcZm2lwBQ9n3KWqx7Bm1ACPzVZ0E7RsIyfWf+2amWI1tPCe4fJoAy5AbvfdPrvzpXn/vBTAuccpaYzK1AFTcDbAEtmbF6bGG+wY/RZ3gnyb1QZyuZ7rxF7uVfPXCI19gdr417sbTOa/vpChIWOfvKqyZAJq2y1SOfMG8XvT9lpxaYOV9W17s7SVw7tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFMz+SP3+5lWCxHkCw1cEPgrwtGyVH5R4h5/0Rbj07A=;
 b=BSZvjXA0iUItqcT03msZX6ebKmNjBrpLzIrMXk1HQBwvyLnMc2xYXJyLxL1lYNRUXhwYi+hKqKVU7SOf7Wlg33uERGv9vGxuVGTVEUeRUWJxDiq09uoV8Xzl8QWM1CJ4c0IOrjqSz3bAXLk7S/6N8YUVgqXo+A1yAAQ3KnbZqgQ=
Received: from DM6PR01MB5145.prod.exchangelabs.com (2603:10b6:5:56::16) by
 DM6PR01MB4748.prod.exchangelabs.com (2603:10b6:5:6f::11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.33; Wed, 23 Dec 2020 09:05:01 +0000
Received: from DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::c930:8fc9:847b:7f3e]) by DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::c930:8fc9:847b:7f3e%6]) with mapi id 15.20.3676.033; Wed, 23 Dec 2020
 09:05:00 +0000
From: Thu Nguyen OS <thu@os.amperecomputing.com>
To: Mohammed.Habeeb ISV <mohammed.habeeb@inventec.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: No event logs in webUI
Thread-Topic: No event logs in webUI
Thread-Index: AdbXMBX7HAfhxRP8Tcm3nL6Rx0B5gACFUeYA
Date: Wed, 23 Dec 2020 09:05:00 +0000
Message-ID: <45E5B9A7-D997-4318-99D2-5895DD7C74FA@amperemail.onmicrosoft.com>
References: <PS2PR02MB35413947737B5E6DB0501CD390C00@PS2PR02MB3541.apcprd02.prod.outlook.com>
In-Reply-To: <PS2PR02MB35413947737B5E6DB0501CD390C00@PS2PR02MB3541.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: inventec.com; dkim=none (message not signed)
 header.d=none;inventec.com; dmarc=none action=none
 header.from=os.amperecomputing.com;
x-originating-ip: [118.69.219.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9e4781db-0000-4b31-cd4e-08d8a721d43c
x-ms-traffictypediagnostic: DM6PR01MB4748:
x-microsoft-antispam-prvs: <DM6PR01MB4748506C6FF233276EDFFBDD90DE0@DM6PR01MB4748.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7RtUmEaPHpfd7SlBeH5s8R2LJKKXVJRzDxITbjbSFBZ4PEt3LwcM/JZysLxunDAaZr5X19pYheJ48aHR2iAbfQGFrTOCxz+5xIMbS+xojLHnC2ZhFY+ODbwuJGDzBjSspy03raA8MO5Hj90ln1Y4lvpKeYEZb2H5NfEYqxYNn70mv5H+Eac4jYOCSZWI2kro1rG6xUJaj25uKf+W8eCafUWRJjf/YXNVwK5mLsJAmmEXQAy/m+49wIX0/8GnMaXOu6SRfdeATz47qi3rPAddFfajYUKV0x03HFt/vPf8S4YXGqsn26yoEaYo0pax2UW0w0aUSYSEkot9VqBZqwicx2rQoUFmFfWScCD7s86BFFCwedz1XUwWBOr9Kl7fniSjqNEgWRMAqgelcSxQv26lmg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR01MB5145.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(346002)(396003)(376002)(366004)(86362001)(76116006)(110136005)(91956017)(66446008)(6486002)(66556008)(66476007)(478600001)(8676002)(5660300002)(64756008)(6512007)(6506007)(316002)(53546011)(9686003)(71200400001)(2906002)(66946007)(186003)(33656002)(8936002)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?WWhEdllPTHd0TUVhTXhyZk9EYUFkZmQ3WlJmSEZwb3Ywc2l4b2ZzL3NSdTFq?=
 =?utf-8?B?akF5V092MlpDamlvaHBhVjk2NHNLNDJWa0RNMjlCUjI3bjRYbFJkeVVLRVJ1?=
 =?utf-8?B?WXQ0NXNuVjlYbDNqaWgvNVFTdFRuMyswZGNvaGxlbzNqcTBMeXhNekdTTUU3?=
 =?utf-8?B?S2dJZzFnV0FUckZJYnlmK0l2M3NhRFFDc1lJM1JZNVUrNDlNbkhrWlZnM2Yy?=
 =?utf-8?B?bXFVUVV4Yk8xT1VnbzlOaEIxSVl4S3g2UUo0cGRaU2tHQVY1cTJzbnRSZERE?=
 =?utf-8?B?MGRSY3IrMFRVV3UrSTV3UHlaQUVrSk91cmhGVHU3bnk0M1J3OW4yQ20wN0ZL?=
 =?utf-8?B?Rmw3ckxzanVHRWhpQUxNQ0M2OSs3YlU2UDVCVW05dG5xVzcxZzZaS04yQzNv?=
 =?utf-8?B?ZnFEblBxRlBoY3YxcUg1dmNuU0RLY3g2bWdxUXdUZCtCa1A1bnRSQ25yb3pV?=
 =?utf-8?B?Mi9lY1czcjNVdXZQRVpzYzByRmtrMGdpUmhETFh6ZGdWakh4T29XYldHbUdH?=
 =?utf-8?B?WEJMTTJkc0hzanAxb3AySERnZHhnWjJNU2tLdldPQU9qVUxpM2JqY3RMOTFw?=
 =?utf-8?B?VVFGNHJKTjUwWXMvOTFoNjJZS2I0US9HT1lraXFyYVluaVNqQkUzSy8xNlhH?=
 =?utf-8?B?R0pESllNOEl4UnEwS1BxSTBiakFEVDlZVE1yRkowVXlvT3NSazRPaHZmMGF6?=
 =?utf-8?B?MGptalJDMFFpaXFDcVJ6OUwwS0pQT0JHNVk0SU1VWnBZQkFUMkE3clMzdEZh?=
 =?utf-8?B?M0QrQlozczI5R281THhVckpVazBJWTVnVkZrV29nd0VzbzBtdDlQZ2N6N2o0?=
 =?utf-8?B?dUx4ci9xMzFhTnlkajRScTRTc1FkczlPakdLVWFpTGY2eUJONUVKVEdzWDFC?=
 =?utf-8?B?TXZLOHN3dFQvTFByN3k2RUl1ZEVicjBNZ3JhS1drdUc3SWwveGxCRnRVUTBo?=
 =?utf-8?B?aDVYV3I0ald5OUtwWGZFNUx1Yis4NmtUeEVidzFGSE80NWs2eEhkWnpobUhr?=
 =?utf-8?B?VzNnckRSalFybVdJUmdpc0xRckpsL2Y4RGJaS21tUS84V2RvMXRFNXpRVXNX?=
 =?utf-8?B?SC9ocWhYV3BHRExKSjB3VmhJVUlpK2ExMmtISDEzZjBENFlHNkhtNTJ2MW04?=
 =?utf-8?B?WW1QUFVqWk1rY2t6RGR5cURZV1hNWVI0YSs4aGxHT2pTYlFTbU0yL0ExcXVy?=
 =?utf-8?B?YmJUbllWcTJqM2NkeVdpR2Rnb05wdnFQZ3Z0cUZrVi9kTVNNTXVHZk5iWms1?=
 =?utf-8?B?ekhVZUhEZ2dQamZkRVdKQjRndnJKRlZHcjhUT256eEhOV2kwLzZBd3JEeHgy?=
 =?utf-8?Q?O3vFxP4o7SALDat23auYErXO9X3R06AeBG?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_45E5B9A7D997431899D25895DD7C74FAamperemailonmicrosoftco_"
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5145.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e4781db-0000-4b31-cd4e-08d8a721d43c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2020 09:05:00.8239 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SqXgovGAkLIBGe68TvBUWnlM/Z/lPfmVt97Id4ALcqcA1BZkqHw8fzkkMHNUVdlBr4EnvXh3sgF/2G1RNHwystgGOzkavHtIvrEfBAUCEug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4748
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

--_000_45E5B9A7D997431899D25895DD7C74FAamperemailonmicrosoftco_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhvc2Ugc2Vuc29ycyBldmVudCBsb2cgc2hvdWxkIGJlIGxvZ2dlZCBpbg0KSGVhbHRoIC0+IEV2
ZW50IGxvZyAtPiBTZWxlY3Qgc3lzdGVtIGxvZyB0eXBlID0gRXZlbnQuDQoNClJlZ2FyZHMuDQpU
aHUgTmd1eWVuLg0KRnJvbTogb3BlbmJtYyA8b3BlbmJtYy1ib3VuY2VzK3RodT1vcy5hbXBlcmVj
b21wdXRpbmcuY29tQGxpc3RzLm96bGFicy5vcmc+IG9uIGJlaGFsZiBvZiAiTW9oYW1tZWQuSGFi
ZWViIElTViIgPG1vaGFtbWVkLmhhYmVlYkBpbnZlbnRlYy5jb20+DQpEYXRlOiBUdWVzZGF5LCBE
ZWNlbWJlciAyMiwgMjAyMCBhdCAwODo0Nw0KVG86ICJvcGVuYm1jQGxpc3RzLm96bGFicy5vcmci
IDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQpTdWJqZWN0OiBObyBldmVudCBsb2dzIGluIHdl
YlVJDQoNCkhpIEFsbCwNCg0KSSBhbSBuZXcgdG8gb3BlbkJtYyAuIEN1cnJlbnRseSwgSSBkb27i
gJl0IHNlZSBhbnkgZXZlbnRzIGxvZ2dlZCBpbiB3ZWJVSQ0KU2VydmVyIGhlYWx0aCA+IEV2ZW50
IGxvZyBwYWdlLiAgSSBzZWUg4oCcTm8gZXZlbnRzIGhhdmUgYmVlbiBsb2dnZWQgeWV0LuKAnQ0K
V2hlbiBJIHNlZSB0aGUgc2VsIGVsaXN0IHVzaW5nIGlwbWl0b29sIHRoZXJlIGFyZSBsb3Qgb2Yg
bG9ncyBzaG93bi4gSSBhbSBub3Qgc3VyZSBpZiBpdCBpcyBhIGJ1ZyBpbiB3ZWJVSSBvciB0aGVy
ZSBhcmUgbm8gZXZlbnRzIHRvIGJlIHNob3duLg0KV2hhdCBraW5kIG9mIGV2ZW50cyBhcmUgc2hv
d24gaW4gU2VydmVyIGhlYWx0aCA+IEV2ZW50IGxvZyBwYWdlLiAgQW55IGV4YW1wbGUgd291bGQg
YmUgaGVscGZ1bC4gQ3VycmVudGx5IHVzaW5nIG9wZW5ibWMgMi43IHZlcnNpb24uDQoNCmlwbWl0
b29sIC1JIGxhbnBsdXMgLVUgcm9vdCAtUCAwcGVuQm1jIC1IIDEwLjYuMTQxLjE5NyBzZWwgZWxp
c3QNCg0KMTZiZCB8IDEyLzE4LzIwIHwgMTI6MDQ6NDEgVVRDIHwgVGVtcGVyYXR1cmUgU0NNX1RF
TVAgfCBMb3dlciBOb24tY3JpdGljYWwgZ29pbmcgbG93ICB8IERlYXNzZXJ0ZWQgfCBSZWFkaW5n
IDM0IDwgVGhyZXNob2xkIDUgZGVncmVlcyBDDQoxNmJlIHwgMTIvMTgvMjAgfCAxMjowNDo0MSBV
VEMgfCBUZW1wZXJhdHVyZSBTQ01fVEVNUCB8IExvd2VyIENyaXRpY2FsIGdvaW5nIGxvdyAgfCBE
ZWFzc2VydGVkIHwgUmVhZGluZyAzNCA8IFRocmVzaG9sZCAwIGRlZ3JlZXMgQw0KMTZiZiB8IDEy
LzE4LzIwIHwgMTI6MDQ6NTcgVVRDIHwgVGVtcGVyYXR1cmUgU0NNX1RFTVAgfCBMb3dlciBOb24t
Y3JpdGljYWwgZ29pbmcgbG93ICB8IEFzc2VydGVkIHwgUmVhZGluZyAyNTIgPCBUaHJlc2hvbGQg
NSBkZWdyZWVzIEMNCjE2YzAgfCAxMi8xOC8yMCB8IDEyOjA0OjU3IFVUQyB8IFRlbXBlcmF0dXJl
IFNDTV9URU1QIHwgTG93ZXIgQ3JpdGljYWwgZ29pbmcgbG93ICB8IEFzc2VydGVkIHwgUmVhZGlu
ZyAyNTIgPCBUaHJlc2hvbGQgMCBkZWdyZWVzIEMNCg0KVGhhbmtzICYgcmVnYXJkcw0KSGFiZWVi
DQo=

--_000_45E5B9A7D997431899D25895DD7C74FAamperemailonmicrosoftco_
Content-Type: text/html; charset="utf-8"
Content-ID: <48ABACDA2CD0264FAA8DCF7F2AC748FC@prod.exchangelabs.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToy
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3Jt
YWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGNtOw0KCWZvbnQtc2l6
ZToxMS4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0Kc3Bhbi5FbWFp
bFN0eWxlMTkNCgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWwtcmVwbHk7DQoJZm9udC1mYW1pbHk6
IkNhbGlicmkiLHNhbnMtc2VyaWY7DQoJY29sb3I6d2luZG93dGV4dDt9DQouTXNvQ2hwRGVmYXVs
dA0KCXttc28tc3R5bGUtdHlwZTpleHBvcnQtb25seTsNCglmb250LXNpemU6MTAuMHB0O30NCkBw
YWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjYxMi4wcHQgNzkyLjBwdDsNCgltYXJnaW46NzIuMHB0
IDcyLjBwdCA3Mi4wcHQgNzIuMHB0O30NCmRpdi5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2Vj
dGlvbjE7fQ0KLS0+PC9zdHlsZT4NCjwvaGVhZD4NCjxib2R5IGxhbmc9ImVuLVZOIiBsaW5rPSIj
MDU2M0MxIiB2bGluaz0iIzk1NEY3MiIgc3R5bGU9IndvcmQtd3JhcDpicmVhay13b3JkIj4NCjxk
aXYgY2xhc3M9IldvcmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5n
PSJFTi1VUyI+VGhvc2Ugc2Vuc29ycyBldmVudCBsb2cgc2hvdWxkIGJlIGxvZ2dlZCBpbjxvOnA+
PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9IkVOLVVT
Ij5IZWFsdGggLSZndDsgRXZlbnQgbG9nIC0mZ3Q7IFNlbGVjdCBzeXN0ZW0gbG9nIHR5cGUgPSBF
dmVudC48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBs
YW5nPSJFTi1VUyI+PGJyPg0KUmVnYXJkcy48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJFTi1VUyI+VGh1IE5ndXllbi48bzpwPjwvbzpwPjwv
c3Bhbj48L3A+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItdG9wOnNvbGlkICNCNUM0
REYgMS4wcHQ7cGFkZGluZzozLjBwdCAwY20gMGNtIDBjbSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij48Yj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+RnJvbTogPC9z
cGFuPjwvYj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+b3BlbmJt
YyAmbHQ7b3BlbmJtYy1ib3VuY2VzK3RodT1vcy5hbXBlcmVjb21wdXRpbmcuY29tQGxpc3RzLm96
bGFicy5vcmcmZ3Q7IG9uIGJlaGFsZiBvZiAmcXVvdDtNb2hhbW1lZC5IYWJlZWIgSVNWJnF1b3Q7
ICZsdDttb2hhbW1lZC5oYWJlZWJAaW52ZW50ZWMuY29tJmd0Ozxicj4NCjxiPkRhdGU6IDwvYj5U
dWVzZGF5LCBEZWNlbWJlciAyMiwgMjAyMCBhdCAwODo0Nzxicj4NCjxiPlRvOiA8L2I+JnF1b3Q7
b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnJnF1b3Q7ICZsdDtvcGVuYm1jQGxpc3RzLm96bGFicy5v
cmcmZ3Q7PGJyPg0KPGI+U3ViamVjdDogPC9iPk5vIGV2ZW50IGxvZ3MgaW4gd2ViVUk8bzpwPjwv
bzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpw
PiZuYnNwOzwvbzpwPjwvcD4NCjwvZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+SGkgQWxsLCA8
bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZuYnNwOzxvOnA+PC9vOnA+PC9w
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+SSBhbSBuZXcgdG8gb3BlbkJtYyAuIEN1cnJlbnRseSwg
SSBkb27igJl0IHNlZSBhbnkgZXZlbnRzIGxvZ2dlZCBpbiB3ZWJVSSAmbmJzcDs8bzpwPjwvbzpw
PjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlNlcnZlciBoZWFsdGggJmd0OyBFdmVudCBsb2cg
cGFnZS4gJm5ic3A7SSBzZWUg4oCcTm8gZXZlbnRzIGhhdmUgYmVlbiBsb2dnZWQgeWV0LuKAnQ0K
PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5XaGVuIEkgc2VlIHRoZSBzZWwg
ZWxpc3QgdXNpbmcgaXBtaXRvb2wgdGhlcmUgYXJlIGxvdCBvZiBsb2dzIHNob3duLiBJIGFtIG5v
dCBzdXJlIGlmIGl0IGlzIGEgYnVnIGluIHdlYlVJIG9yIHRoZXJlIGFyZSBubyBldmVudHMgdG8g
YmUgc2hvd24uPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5XaGF0IGtpbmQg
b2YgZXZlbnRzIGFyZSBzaG93biBpbiBTZXJ2ZXIgaGVhbHRoICZndDsgRXZlbnQgbG9nIHBhZ2Uu
ICZuYnNwO0FueSBleGFtcGxlIHdvdWxkIGJlIGhlbHBmdWwuIEN1cnJlbnRseSB1c2luZyBvcGVu
Ym1jIDIuNyB2ZXJzaW9uLjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5i
c3A7PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5pcG1pdG9vbCAtSSBsYW5w
bHVzIC1VIHJvb3QgLVAgMHBlbkJtYyAtSCAxMC42LjE0MS4xOTcgc2VsIGVsaXN0PG86cD48L286
cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDs8bzpwPjwvbzpwPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjE2YmQgfCAxMi8xOC8yMCB8IDEyOjA0OjQxIFVUQyB8IFRlbXBlcmF0
dXJlIFNDTV9URU1QIHwgTG93ZXIgTm9uLWNyaXRpY2FsIGdvaW5nIGxvdyZuYnNwOyB8IERlYXNz
ZXJ0ZWQgfCBSZWFkaW5nIDM0ICZsdDsgVGhyZXNob2xkIDUgZGVncmVlcyBDPG86cD48L286cD48
L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4xNmJlIHwgMTIvMTgvMjAgfCAxMjowNDo0MSBVVEMg
fCBUZW1wZXJhdHVyZSBTQ01fVEVNUCB8IExvd2VyIENyaXRpY2FsIGdvaW5nIGxvdyZuYnNwOyB8
IERlYXNzZXJ0ZWQgfCBSZWFkaW5nIDM0ICZsdDsgVGhyZXNob2xkIDAgZGVncmVlcyBDPG86cD48
L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4xNmJmIHwgMTIvMTgvMjAgfCAxMjowNDo1
NyBVVEMgfCBUZW1wZXJhdHVyZSBTQ01fVEVNUCB8IExvd2VyIE5vbi1jcml0aWNhbCBnb2luZyBs
b3cmbmJzcDsgfCBBc3NlcnRlZCB8IFJlYWRpbmcgMjUyICZsdDsgVGhyZXNob2xkIDUgZGVncmVl
cyBDPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4xNmMwIHwgMTIvMTgvMjAg
fCAxMjowNDo1NyBVVEMgfCBUZW1wZXJhdHVyZSBTQ01fVEVNUCB8IExvd2VyIENyaXRpY2FsIGdv
aW5nIGxvdyZuYnNwOyB8IEFzc2VydGVkIHwgUmVhZGluZyAyNTIgJmx0OyBUaHJlc2hvbGQgMCBk
ZWdyZWVzIEM8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZuYnNwOzxvOnA+
PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+VGhhbmtzICZhbXA7IHJlZ2FyZHM8bzpw
PjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkhhYmVlYjxvOnA+PC9vOnA+PC9wPg0K
PC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_45E5B9A7D997431899D25895DD7C74FAamperemailonmicrosoftco_--
