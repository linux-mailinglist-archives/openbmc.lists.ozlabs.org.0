Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C4079FA8
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 05:55:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yN4D5WMlzDqNS
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 13:55:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.250.214; helo=mail1.bemta24.messagelabs.com;
 envelope-from=dlin23@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45w3Rg5P8WzDqQw
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jul 2019 19:18:54 +1000 (AEST)
Received: from [67.219.250.198] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-b.us-west-2.aws.symcld.net id 05/01-12929-A75CA3D5;
 Fri, 26 Jul 2019 09:18:50 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLKsWRWlGSWpSXmKPExsWSLveKXbfqqFW
 sQcdOeYsXUxYxWpxqecFisffARhYHZo8Fm0o95p0M9Dg/YyFjAHMUa2ZeUn5FAmvGjivv2AtO
 aVbcPi7VwNii2cXIxSEk0MAksXZuLzuE85pR4veraUwQzn5GidN/PzB2MXJwsAmoStyfxt3Fy
 MkhIhAiMW3vZmaQGmaBdUwSE/dcYgRJCAu4S7zdNosZpF5EwEPi8FdZiHojidUHNzCBhFmAxq
 y/5gAS5hWwlDiwYgozxKpnjBILp89lBUlwCjhLfOi8ywZiMwrISjxZ8IwJxGYWEJc4d7GVHcS
 WEBCQWLLnPDOELSrx8vE/VghbQaJ5z2sWkF3MApoS63fpQ7QqSkzpfsgOsVdQ4uTMJywTGEVn
 IZk6C6FjFpKOWUg6FjCyrGK0SCrKTM8oyU3MzNE1NDDQNTQ00jU0NtE1NDHSS6zSTdIrLdYtT
 y0u0QVyy4v1iitzk3NS9PJSSzYxAuMtpaCtbwfjxVlv9A4xSnIwKYnyyulbxQrxJeWnVGYkFm
 fEF5XmpBYfYpTh4FCS4N1zGCgnWJSanlqRlpkDjH2YtAQHj5IIrwBImre4IDG3ODMdInWK0Z5
 jwsu5i5g5Dh6dByTf/VwMJI/MXbqIWYglLz8vVUqcdx5ImwBIW0ZpHtxQWKq6xCgrJczLyMDA
 IMRTkFqUm1mCKv+KUZyDUUmY1wtkCk9mXgnc7ldAZzEBnRUmBXZWSSJCSqqBientOtnPRQz+h
 59VLGq56f3oDI+2uPinf4opYn/OL9hlvmxBUt+XtcHapqpM9/LeNXz31pucuDrOQiHvnWeUV9
 /r9zX/VSWONnhO2mvDu8BT7IrypBSrecwvNm/LjN3q6nOaXXLrrewNs898SK0xV+9k1T3dkhQ
 3N1pB489NLseSlKT5k9nClj0LZc/8zvHaLyhErCRc+MC86YsnTr7hWXTvwcV7jeePTtj27Khn
 merX/t6ph4xU5ObkL+UUmDV/F6v0AbvN4kXyPArma0PW+Z+Z2MO3kvVVz9plN35tMJ96vUm0m
 bP+pv2lvmDHtwKCp1PCW3fHODtrPnW9ZDEt3C3nEtv+VeGTRGN45KasVWIpzkg01GIuKk4EAE
 /IJT3QAwAA
X-Env-Sender: dlin23@lenovo.com
X-Msg-Ref: server-15.tower-346.messagelabs.com!1564132727!78249!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11957 invoked from network); 26 Jul 2019 09:18:49 -0000
Received: from unknown (HELO apsmtp.lenovo.com) (103.30.234.7)
 by server-15.tower-346.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Jul 2019 09:18:49 -0000
Received: from HKGWPEMAIL04.lenovo.com (unknown [10.128.3.72])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 1C517DF8F1DBABCAF133;
 Fri, 26 Jul 2019 17:18:47 +0800 (CST)
Received: from HKGWPEMAIL02.lenovo.com (10.128.3.70) by
 HKGWPEMAIL04.lenovo.com (10.128.3.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1591.10; Fri, 26 Jul 2019 17:18:44 +0800
Received: from HKGWPEMAIL02.lenovo.com ([fe80::7020:5ebb:e3eb:29ba]) by
 HKGWPEMAIL02.lenovo.com ([fe80::7020:5ebb:e3eb:29ba%12]) with mapi id
 15.01.1591.008; Fri, 26 Jul 2019 17:18:44 +0800
From: Derek Lin23 <dlin23@lenovo.com>
To: James Feist <james.feist@linux.intel.com>, Patrick Venture
 <venture@google.com>
Subject: RE: [External] Re: Questions regarding of phosphor-pid-control
Thread-Topic: [External] Re: Questions regarding of phosphor-pid-control
Thread-Index: AQHVPZI+JnqyvPK7+k6HAbH773iFNabcoghQ
Date: Fri, 26 Jul 2019 09:18:43 +0000
Message-ID: <baa7b1f21ad34c35841004c5224309ff@lenovo.com>
References: <5a7988638ddf428cb8267d7e339cdbcf@lenovo.com>
 <CAO=notyiSd+kcHD_ed7CtLY8G-+fvWt9fgXbQARS9nq7PGXXnQ@mail.gmail.com>
 <a190291d8f454efbbb17b95e28085466@lenovo.com>
 <2b4006da-752e-fa9b-8500-431c5b42d00f@linux.intel.com>
In-Reply-To: <2b4006da-752e-fa9b-8500-431c5b42d00f@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.128.115.1]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 30 Jul 2019 13:53:42 +1000
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
Cc: Duke KH Du <dukh@lenovo.com>, Andrew MS1 Peng <pengms1@lenovo.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Harry Sung1 <hsung1@lenovo.com>,
 Xiaohan XH6 Xu <xuxh6@lenovo.com>, Haitao HT11 Wang <wanght11@lenovo.com>,
 Yonghui YH21 Liu <liuyh21@lenovo.com>, Lisa YJ19 Liu <liuyj19@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgUGF0cmljayAmIEphbWVzOg0KDQoJV291bGQgeW91IHBsZWFzZSBpZGVudGlmeSB3aGVuJ2xs
IHRoaXMgZmVhdHVyZSBiZWluZyBjb21wbGV0ZWQ/DQoJT3IgZG8geW91IGhhdmUgYSBwbGFuIGZv
ciB0aGlzIGZlYXR1cmU/DQoNCglodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9zcGhvci1w
aWQtY29udHJvbC9pc3N1ZXMvMg0KDQpUaGFua3MsDQoNCkRlcmVrDQoNCi0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQpGcm9tOiBKYW1lcyBGZWlzdCA8amFtZXMuZmVpc3RAbGludXguaW50ZWwu
Y29tPiANClNlbnQ6IEZyaWRheSwgSnVseSAxOSwgMjAxOSAxOjU3IEFNDQpUbzogRGVyZWsgTGlu
MjMgPGRsaW4yM0BsZW5vdm8uY29tPjsgUGF0cmljayBWZW50dXJlIDx2ZW50dXJlQGdvb2dsZS5j
b20+DQpDYzogWW9uZ2h1aSBZSDIxIExpdSA8bGl1eWgyMUBsZW5vdm8uY29tPjsgSGFycnkgU3Vu
ZzEgPGhzdW5nMUBsZW5vdm8uY29tPjsgT3BlbkJNQyBNYWlsbGlzdCA8b3BlbmJtY0BsaXN0cy5v
emxhYnMub3JnPjsgQW5kcmV3IE1TMSBQZW5nIDxwZW5nbXMxQGxlbm92by5jb20+OyBMaXNhIFlK
MTkgTGl1IDxsaXV5ajE5QGxlbm92by5jb20+OyBIYWl0YW8gSFQxMSBXYW5nIDx3YW5naHQxMUBs
ZW5vdm8uY29tPjsgWGlhb2hhbiBYSDYgWHUgPHh1eGg2QGxlbm92by5jb20+DQpTdWJqZWN0OiBS
ZTogW0V4dGVybmFsXSBSZTogUXVlc3Rpb25zIHJlZ2FyZGluZyBvZiBwaG9zcGhvci1waWQtY29u
dHJvbA0KDQpPbiA3LzE3LzE5IDc6NDAgUE0sIERlcmVrIExpbjIzIHdyb3RlOg0KPiBIaSBQYXRy
aWNrOg0KPiANCj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBUaGUgb3Blbi1sb29wIGluIHRoaXMgY29u
dGV4dCBpcyBtb3JlIGxpa2VseSB0byBzZXQgZHV0eSBvZiANCj4gUFdNIG1hbnVhbGx5Lg0KPiAN
Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBGb3IgZXhhbXBsZSwgd2hlbiByZWFkaW5nIGEgc2Vuc29y
IGFib3ZlIG9yIGJlbG93IGEgY2VydGFpbiANCj4gcHJlLWRlZmluZWQgdGVtcGVyYXR1cmUsIHRo
ZW4gdGhlIGR1dHkgb2YgYSBQV00gaXMgcmV2dmVkIHVwIG9yIGxvd2VyIA0KPiB0byB0aGUgZGVz
aXJlZCBmYW4tc3BlZWQuDQoNCllvdSBjb3VsZCB1c2Ugc3RlcHdpc2UgY29uZmlndXJhdGlvbnMg
dG8gZ2V0IHRoaXMgcmVzcG9uc2UuIEhlcmUncyBhbiBleGFtcGxlIG9mIGEgbG93ZXIgY2xpcHBp
bmcgY3VydmUgdGhhdCB3aGVuIHRoZSByZWFkaW5nIG9mIHRoZSBzZW5zb3IgaXMgMjAsIG91dHB1
dHMgNTAlLCBhbmQgd2hlbiBpdCByZWFkcyAzMCBvdXRwdXRzIDYwJS4NCg0KaHR0cHM6Ly9naXRo
dWIuY29tL29wZW5ibWMvZW50aXR5LW1hbmFnZXIvYmxvYi85ODEzMjc5YjU3MzU5YmQxNjAyZGEy
MzZmZjdkMzhiY2M5YTJmYmE0L2NvbmZpZ3VyYXRpb25zL1IyMDAwJTIwQ2hhc3Npcy5qc29uI0w0
MjgNCg0KVGhpcyBpcyBhbHNvIGNvbmZpZ3VyYWJsZSBmcm9tIHRoZSBqc29uIEkgYmVsaWV2ZS4N
Cg0KDQo+IA0KPiAgwqDCoMKgwqDCoMKgwqDCoMKgIE1vcmUgbGlrZWx5LCBQV00gaXMgc2V0IHNp
bXBseSBieSB0aGUgcmVhZGluZyBvZiBhIA0KPiB0ZW1wZXJhdHVyZSBzZW5zb3IuIEEgbWFwIG9m
IHRlbXBlcmF0dXJlIHJlYWRpbmdzIGFuZCBQV00gdmFsdWVzIGNhbiANCj4gYmUgcmVwcmVzZW50
ZWQgYXMgYW4gZXhhbXBsZS4NCj4gDQo+IFRoYW5rIHlvdSwNCj4gDQo+IERlcmVrDQo+IA0KPiAq
RnJvbToqUGF0cmljayBWZW50dXJlIDx2ZW50dXJlQGdvb2dsZS5jb20+DQo+ICpTZW50OiogVHVl
c2RheSwgSnVseSAxNiwgMjAxOSAxOjAyIEFNDQo+ICpUbzoqIERlcmVrIExpbjIzIDxkbGluMjNA
bGVub3ZvLmNvbT47IEphbWVzIEZlaXN0IA0KPiA8amFtZXMuZmVpc3RAbGludXguaW50ZWwuY29t
Pg0KPiAqQ2M6KiBZb25naHVpIFlIMjEgTGl1IDxsaXV5aDIxQGxlbm92by5jb20+OyBIYXJyeSBT
dW5nMSANCj4gPGhzdW5nMUBsZW5vdm8uY29tPjsgT3BlbkJNQyBNYWlsbGlzdCA8b3BlbmJtY0Bs
aXN0cy5vemxhYnMub3JnPg0KPiAqU3ViamVjdDoqIFtFeHRlcm5hbF0gUmU6IFF1ZXN0aW9ucyBy
ZWdhcmRpbmcgb2YgcGhvc3Bob3ItcGlkLWNvbnRyb2wNCj4gDQo+IE9uIFR1ZSwgSnVsIDksIDIw
MTkgYXQgMjowMyBBTSBEZXJlayBMaW4yMyA8ZGxpbjIzQGxlbm92by5jb20gDQo+IDxtYWlsdG86
ZGxpbjIzQGxlbm92by5jb20+PiB3cm90ZToNCj4gDQo+ICAgICBIaSBQYXRyaWNrOg0KPiANCj4g
QWRkaW5nIHRoZSBvcGVuYm1jIG1haWxpbmfCoGxpc3QuwqAgUGxlYXNlIGFsd2F5cyBpbmNsdWRl
IHRoaXMgbWFpbGluZyANCj4gbGlzdCBpbiB5b3VyIGVtYWlscyBmb3IgYXJjaGl2aW5nIGFuZCBs
YXRlciByZWZlcmVuY2UgYXMgd2VsbCBhcyANCj4gb3BlbmluZyB1cCB0aGUgcXVlc3Rpb24gdG8g
b3RoZXJzLg0KPiANCj4gQWxzbyBhZGRpbmcgSmFtZXMgRmVpc3QgYXMgaGUgY28tbWFpbnRhaW5z
IHRoaXMgY29kZWJhc2UuDQo+IA0KPiAgICAgIMKgwqDCoMKgwqDCoMKgwqDCoCBUaGlzIGlzIERl
cmVrIGZyb20gTGVub3ZvIEJNQyB0ZWFtLg0KPiANCj4gICAgICDCoMKgwqDCoMKgwqDCoMKgwqAg
V2UgaGF2ZSBzb21lIHF1ZXN0aW9ucyByZWdhcmRpbmcgb2ZwaG9zcGhvcy1waWQtY29udHJvbA0K
PiAgICAgPGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bob3NwaG9yLXBpZC1jb250cm9sPiwg
YW5kIHdlIGhvcGUgeW91DQo+ICAgICBjYW4gcHJvdmlkZSBzb21lIGFkdmljZSBvZiB0aGUgY29t
cG9uZW50Lg0KPiANCj4gICAgICDCoMKgwqDCoMKgwqDCoMKgwqAgQ3VycmVudGx5LCB3ZSB3b3Vs
ZCBsaWtlIHRvIGltcG9ydCBwaG9zcGhvci1waWQtY29udHJvbA0KPiAgICAgYXMgb3VyIHRoZXJt
YWwgZmFuIGNvbnRyb2wgbW9kdWxlLiBBZnRlciBhIGJyaWVmIHN0dWR5LCB3ZSB3b3VsZA0KPiAg
ICAgbGlrZSB0byBrbm93IGlmIHBob3NwaG9yLXBpZC1jb250cm9sIGNhbiBzdXBwb3J0IG9wZW4t
bG9vcCBhbmQNCj4gICAgIGV2ZW50LXRyaWdnZXJlZCBldmVudHM/DQo+IA0KPiBJIGRvbid0IHJl
YWxseSBrbm93IHdoYXQgb3Blbi1sb29wIG1lYW5zIGluIHRoaXMgY29udGV4dC7CoCBSZWdpc3Rl
cmluZyANCj4gZm9yIGV2ZW50cywgbGlrZT8NCj4gDQo+ICAgICBUaGFuayB5b3UgZm9yIHlvdXIg
ZmVlZGJhY2tzLA0KPiANCj4gICAgIERlcmVrDQo+IA0KPiAgICAgDQo+IC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Cj4gLS0NCj4gDQo+ICAgICAqRGVyZWsgTGluKg0KPiAgICAgU3IuIEJNQyBFbmdpbmVlcg0KPiAg
ICAgOEYsNjYsIFNhbiBDaG9uZyBSZC4sIE5hbmthbmcgU29mdHdhcmUgUGFyaywgVGFpcGVpLg0K
PiAgICAgTGVub3ZvIFRhaXdhbg0KPiANCj4gICAgIAkNCj4gDQo+ICAgICBQaG9uZSs4ODYyODE3
MDc0MTENCj4gICAgIEVtYWlsZGxpbjIzQGxlbm92by5jb20gPG1haWx0bzpkbGluMjNAbGVub3Zv
LmNvbT4NCj4gDQo+ICAgICAJDQo+IA0KPiAgICAgTGVub3ZvLmNvbSA8aHR0cDovL3d3dy5sZW5v
dm8uY29tLz4NCj4gICAgIFR3aXR0ZXIgPGh0dHA6Ly90d2l0dGVyLmNvbS9sZW5vdm8+wqB8IElu
c3RhZ3JhbQ0KPiAgICAgPGh0dHBzOi8vaW5zdGFncmFtLmNvbS9sZW5vdm8+wqB8IEZhY2Vib29r
DQo+ICAgICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20vbGVub3ZvPsKgfCBMaW5rZWRpbg0KPiAg
ICAgPGh0dHA6Ly93d3cubGlua2VkaW4uY29tL2NvbXBhbnkvbGVub3ZvPsKgfCBZb3VUdWJlDQo+
ICAgICA8aHR0cDovL3d3dy55b3V0dWJlLmNvbS9sZW5vdm92aXNpb24+wqB8IFByaXZhY3kNCj4g
ICAgIDxodHRwczovL3d3dy5sZW5vdm8uY29tL2diL2VuL3ByaXZhY3ktc2VsZWN0b3IvPg0KPiAN
Cj4gICAgIAkNCj4gDQo+ICAgICBJbWFnZUxvZ28tRENHLUhvbmV5Y29tYg0KPiANCj4gICAgIAkN
Cj4gDQo=
