Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12227AF85D
	for <lists+openbmc@lfdr.de>; Wed, 11 Sep 2019 11:00:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SwpB3yKLzF1ys
	for <lists+openbmc@lfdr.de>; Wed, 11 Sep 2019 19:00:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.246.212; helo=mail1.bemta23.messagelabs.com;
 envelope-from=hsung1@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.212])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SwnY6h04zDqfN
 for <openbmc@lists.ozlabs.org>; Wed, 11 Sep 2019 18:59:28 +1000 (AEST)
Received: from [67.219.246.102] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-b.us-east-1.aws.symcld.net id C7/79-31668-D67B87D5;
 Wed, 11 Sep 2019 08:59:25 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFKsWRWlGSWpSXmKPExsWS8eIhj27u9op
 Yg+5mAYtTLS9YLA7397Nb7D2wkcWB2WPBplKP8zMWMgYwRbFm5iXlVySwZjQd2MBasFOi4var
 9SwNjBMkuhi5OIQE/jNKzL24hx3CecUosWP7JEYIZx+jxPsHu4EcTg42AVWJLc+esIDYIgJuE
 rePvQWLMwskSFx4u50NxBYWsJC4+e44G0SNrcTmpQ+ZIGw9iWMNTUAbODhYgOZcvRcGEuYVsJ
 S4vKcdrJxRQFbiyYJnTBAjxSXOXWxlB7ElBAQkluw5zwxhi0q8fPyPFcJWkGje85oFZCSzgKb
 E+l36EK2KElO6H7JDjBeUODnzCcsERuFZSKbOQuiYhaRjFpKOBYwsqxjNkooy0zNKchMzc3QN
 DQx0DQ2NdA10jQwt9BKrdJP0Sot1UxOLS3QN9RLLi/WKK3OTc1L08lJLNjECoyalgOHWDsb1s
 97oHWKU5GBSEuVtrq+IFeJLyk+pzEgszogvKs1JLT7EKMPBoSTBG70ZKCdYlJqeWpGWmQOMYJ
 i0BAePkghvwlagNG9xQWJucWY6ROoUoyXHhJdzFzFzHDw6D0gembt0EbMQS15+XqqUOG8SSIM
 ASENGaR7cOFiSucQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmHcFyBSezLwSuK3ApAH0iwiv
 b0UpyEEliQgpqQYm7gXTTjPlv7OMetUSOVN9V07BPnu7ZVmOH1Y9VmdaHeG4+O+P/090pvw9N
 k26rUZ14+N+770C8/N1J5zavjEkqG3TP2WjvKfSwts5J/F9Wn0lhIdh8sKr0bfzPpWmhGw+ke
 9xpqlY5tMbodcr0pqs7nd2v9/4n+/DvfUbkxyvqzzWVhJgmHzdVsd9ld6MG3UFd8PK90y1Cy5
 45b0ndGfJ1hjR0K/P/6tY+LOIquw/3zTrzIX15W+bmBT1Ha6ZGrEl8MrZ7WHPSL946exbqY9J
 lY08c2enh9yL3VqgeGuWht+hH/H1lV1WWm6ntxr/2cQpPC/afFbmjfTuPz4Ghyyn+bG+mfhgY
 WGO0urCBwG/lFiKMxINtZiLihMBmyqTE60DAAA=
X-Env-Sender: hsung1@lenovo.com
X-Msg-Ref: server-12.tower-386.messagelabs.com!1568192365!114948!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5872 invoked from network); 11 Sep 2019 08:59:25 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.12)
 by server-12.tower-386.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Sep 2019 08:59:25 -0000
Received: from pekwpmail05.lenovo.com (unknown [10.96.93.83])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 260A541A17B18411D23C;
 Wed, 11 Sep 2019 04:59:23 -0400 (EDT)
Received: from HKGWPEMAIL03.lenovo.com (10.128.3.71) by pekwpmail05.lenovo.com
 (10.96.93.83) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 11 Sep
 2019 16:59:19 +0800
Received: from HKGWPEMAIL03.lenovo.com ([fe80::6151:c7db:16ab:b903]) by
 HKGWPEMAIL03.lenovo.com ([fe80::6151:c7db:16ab:b903%6]) with mapi id
 15.01.1591.008; Wed, 11 Sep 2019 16:59:00 +0800
From: Harry Sung1 <hsung1@lenovo.com>
To: Patrick Venture <venture@google.com>, Oskar Senft <osk@google.com>
Subject: phosphor-ipmi-flash: Update over eSPI interface
Thread-Topic: phosphor-ipmi-flash: Update over eSPI interface
Thread-Index: AdVoeXtnGFbNqtfRQh+i+XRLnkTppg==
Date: Wed, 11 Sep 2019 08:59:00 +0000
Message-ID: <2634903dafda431988ffabd873710768@lenovo.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.128.115.1]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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
Cc: Andrew MS1 Peng <pengms1@lenovo.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQo+IE9uIE1vbiwgU2VwIDksIDIwMTkgYXQgNzowMSBBTSBPc2thciBTZW5mdCA8b3NrQGdvb2ds
ZS5jb20+IHdyb3RlOg0KPiA+DQo+ID4gSGkgSGFycnkNCj4gPg0KPiA+IFdoYXQncyB0aGUgYmVo
YXZpb3Igb24gZVNQST8gSSBhc3N1bWUgeW91IHN0aWxsIGhhdmUgdGhlIGFzcGVlZC1scGMtY3Ry
bA0KPiBlbmFibGVkLCByaWdodD8NCj4gPg0KPiA+IFRoYW5rcw0KPiA+IE9za2FyLg0KDQpIaSBP
c2thciwgDQpZZXMsIEkgc3RpbGwgZW5hYmxlZCB0aGUgYXNwZWVkLWxwYy1jdHJsIGluIG15IGJ1
aWxkLiBCZWNhdXNlIHBob3NwaG9yLWlwbWktZmxhc2ggaGFzIHNvbWUgbWFuZGF0b3J5IGFjdGlv
bnMgb24gL2Rldi9hc3BlZWQtbHBjLWN0cmwgYmVmb3JlIGZsYXNoIChzZXR0aW5ncyBmb3IgSElD
UjUsIEhJQ1I3IGFuZCBISUNSOCkgZXZlbiB0aG91Z2ggdGhlc2Ugc2V0dGluZ3MgYXJlIG1lYW5p
bmdsZXNzIGZvciBlU1BJLg0KDQpDdXJyZW50bHksIEkgc2V0IEVTUEkwODQgKHNvdXJjZSBhZGRy
ZXNzKSBhbmQgRVNQSTA4OCAodGFyZ2V0IGFkZHJlc3MpIHJlZ2lzdGVycyBtYW51YWxseSBiZWNh
dXNlIGxpbnV4IHNlZW1zIG5vdCBoYXZlIGEgZHJpdmVyIGNhbiBoZWxwIHVzIHRvIHNldCBFU1BJ
MDg0IGFuZCBFU1BJMDg4Lg0KDQpEdWUgdG8gdGhlIGxpbWl0YXRpb24gb2YgQVNUMjUwMCwgd2Ug
Y2FuIG9ubHkgd3JpdGUgMjU2IGJ5dGVzIGluIG9uZSB3cml0ZSBvcGVyYXRpb24gKHdyaXRlIHNo
YXJlZCBtZW1vcnkpLg0KQmFzZWQgb24gdGhlIHRlc3QgcmVzdWx0LCBpdCB0YWtlcyBhYm91dCAz
MCBtaW5zIHRvIHRyYW5zZmVyIGEgMzJNQiBpbWFnZSBvdmVyIGVTUEkuDQoNClRoYW5rcywNCkhh
cnJ5DQo+ID4NCj4gPiBPbiBNb24sIFNlcCA5LCAyMDE5IGF0IDQ6NDEgQU0gSGFycnkgU3VuZzEg
PGhzdW5nMUBsZW5vdm8uY29tPiB3cm90ZToNCj4gPj4NCj4gPj4gSGkgUGF0cmljaywNCj4gPj4N
Cj4gPj4NCj4gPj4NCj4gPj4gSSBmb3VuZCDigJxwaG9zcGhvci1pcG1pLWZsYXNo4oCdIGhhdmUg
bm90IHN1cHBvcnQgZmxhc2ggb3ZlciBlU1BJIHlldC4NCj4gPj4NCj4gPj4gTWF5IEkgYXNrIGlm
IHlvdSBoYXZlIGFueSBwbGFucyB0byBzdXBwb3J0IGZsYXNoIG92ZXIgZVNQST8NCj4gPj4NCj4g
Pj4NCj4gPj4NCj4gPj4gSSBoYXZlIGRvbmUgYSBzaW1wbGUgdGVzdCBhYm91dCBzaGFyZWQgbWVt
b3J5IGJldHdlZW4gaG9zdCBhbmQgQk1DIDoNCj4gPj4NCj4gPj4gVGhlIHNoYXJlZCBtZW1vcnkg
aXMgd29yayBhZnRlciBJIHNldCBFU1BJMDg0IChzb3VyY2UgYWRkcmVzcykgYW5kIEVTUEkwODgN
Cj4gKHRhcmdldCBhZGRyZXNzKSByZWdpc3RlcnMuDQo+ID4+DQo+ID4+IEJ1dCBpdCBoYXMgYW4g
bGltaXRhdGlvbiB0aGF0IG9ubHkgMjU2IGJ5dGVzIGFyZSBhdmFpbGFibGUgb24gZWFjaCBwYWdl
ICg0S0IpLg0KPiA+Pg0KPiA+Pg0KPiA+PiBGb3IgZXhhbXBsZSwgaWYgaG9zdCBhZGRyZXNzIHN0
YXJ0cyB0byB3cml0ZSBmcm9tIDB4RkUwQjAwMDAgKEJNQw0KPiA+PiByZXNlcnZlZCBlbm91Z2gg
bWVtb3J5IGFscmVhZHkpDQo+ID4+DQo+ID4+IFdyaXRhYmxlIGFyZWEgYXJlOg0KPiA+Pg0KPiA+
PiAweEZFMEIwMDAwIH4gMHhGRTBCMDBGRg0KPiA+Pg0KPiA+PiAweEZFMEIxMDAwIH4gMHhGRTBC
MTBGRg0KPiA+Pg0KPiA+PiAweEZFMEIyMDAwIH4gMHhGRTBCMjBGRg0KPiA+Pg0KPiA+PiAweEZF
MEIzMDAwIH4gMHhGRTBCMzBGRg0KPiA+Pg0KPiA+PiDigKYNCj4gPj4NCj4gPj4g4oCmDQo+ID4+
DQo+ID4+IOKApg0KPiA+Pg0KPiA+Pg0KPiA+Pg0KPiA+Pg0KPiA+Pg0KPiA+PiBUaGFua3MsDQo+
ID4+IEhhcnJ5DQo+IA0KPiBIYXJyeSwgY3VycmVudGx5IHRoZXJlJ3Mgbm8gcGxhbiB0byBpbXBs
ZW1lbnQgaXQgYXMgSSBoYXZlIG5vIG1ldGhvZCBvZiB0ZXN0aW5nDQo+IGl0LCAgSG93ZXZlciwg
aXQgc2hvdWxkIHByb3ZlIGZhaXJseSBzdHJhaWdodGZvcndhcmQgdG8gYWRkIGFub3RoZXIgb3B0
aW9uIHRvDQo+IHRoZSB0cmFuc3BvcnQgbWVjaGFuaXNtIGxpc3QuICBQbGVhc2UgbGV0IG1lIGtu
b3cgaWYgeW91IHJ1biBpbnRvIGFueQ0KPiBibG9ja2Vycy4NCg0KSGkgUGF0cmljaywNCkdvdCBp
dC4gVGhlIGJldHRlciB3YXkgdG8gc2V0IGVTUEkgcmVnaXN0ZXIgaXMgc2V0dGluZyB0aGVtIGJ5
IHRoZSBkcml2ZXIsIHJpZ2h0Pw0KRm9yIHF1aWNrIHZhbGlkYXRpb24sIEkgYW0gZ29pbmcgdG8g
dXNlIHRoZSAiIGlwbWlscGMiIGludGVyZmFjZSBhbmQgc2V0IG5lY2Vzc2FyeSBlU1BJIHJlZ2lz
dGVycyBtYW51YWxseS4gDQoNClRoYW5rcywNCkhhcnJ5DQo=
