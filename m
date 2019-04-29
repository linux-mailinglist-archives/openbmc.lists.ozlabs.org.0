Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B836CE131
	for <lists+openbmc@lfdr.de>; Mon, 29 Apr 2019 13:21:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t2KH1zFpzDqLv
	for <lists+openbmc@lfdr.de>; Mon, 29 Apr 2019 21:21:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.246.212; helo=mail1.bemta23.messagelabs.com;
 envelope-from=pengms1@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.212])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t2JD2b54zDqH1
 for <openbmc@lists.ozlabs.org>; Mon, 29 Apr 2019 21:20:10 +1000 (AEST)
Received: from [67.219.246.102] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-b.us-east-1.aws.symcld.net id 31/9A-19541-7EDD6CC5;
 Mon, 29 Apr 2019 11:20:07 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLKsWRWlGSWpSXmKPExsWS8eIhr+7zu8d
 iDJb3aVjM2PuA2eL3+b/MFqdaXrBY7D2wkcWBxWPBplKPix+PMXucn7GQMYA5ijUzLym/IoE1
 o3OlS8Fag4q19yIaGO/odzFycQgJtDJJzD2+hB3Cmcso0bvoInMXIycHm4CWxML/e5i6GDk4R
 AQUJRp+CIHUMAv0Mkk8nbiQFcQRFtjIKPFo3xJWkAYRgUyJjVM/sEDYVhKN876xgzSzCKhKPP
 8eCBLmFfCROHO5iQ1iWSejxPrDJ9hAEpwCgRKbZveB9TIKiEl8P7WGCcRmFhCXmDttFth8CQE
 BiSV7zjND2KISLx//YwWZLyEgL7FlliCIySygKbF+lz5Ep6LElO6H7BBrBSVOznzCMoFRZBaS
 obMQOmYh6ZiFpGMBI8sqRrOkosz0jJLcxMwcXUMDA11DQyNdA10jQyO9xCrdJL3SYt3UxOISX
 UO9xPJiveLK3OScFL281JJNjMDoSilguLKDcd3S9EOMkhxMSqK8S7cdjRHiS8pPqcxILM6ILy
 rNSS0+xCjDwaEkwXv79rEYIcGi1PTUirTMHGCcw6QlOHiURHhngaR5iwsSc4sz0yFSpxgtOTp
 ePZzLzLHn12Mg+fbg87nMQix5+XmpUuK8v0AaBEAaMkrz4MbBUtElRlkpYV5GBgYGIZ6C1KLc
 zBJU+VeM4hyMSsK8p0Cm8GTmlcBtfQV0EBPQQfHzwA4qSURISTUwHtmhM4klYiFn5Ete8YeK+
 Q6Gx88Exwjr7vO42mK2+NPUtwZ8rhz29fULlJ4dbVYXf2ErlzEnxrg8hatskvde4zWX99sfcj
 6vzDP9S5THXe3Fa/UWc5bPuNs6X2rZrnM1rxx8DS3ieSP0OEOKefmtq2t1+r+Wx038LHL7Aq9
 a+M+fIo/X9WoosRRnJBpqMRcVJwIAiJVGm0ADAAA=
X-Env-Sender: pengms1@lenovo.com
X-Msg-Ref: server-21.tower-386.messagelabs.com!1556536807!7059256!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1071 invoked from network); 29 Apr 2019 11:20:07 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.13)
 by server-21.tower-386.messagelabs.com with DHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Apr 2019 11:20:07 -0000
Received: from CNMAILEX02.lenovo.com (unknown [10.96.80.2])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 880F1D8581F641AB87AF;
 Mon, 29 Apr 2019 07:07:20 -0400 (EDT)
Received: from CNMAILEX01.lenovo.com ([169.254.9.103]) by
 CNMAILEX02.lenovo.com ([10.96.80.2]) with mapi id 14.03.0415.000; Mon, 29 Apr
 2019 19:20:03 +0800
From: Andrew MS1 Peng <pengms1@lenovo.com>
To: Joel Stanley <joel@jms.id.au>
Subject: =?utf-8?B?562U5aSNOiBbRXh0ZXJuYWxdICBSZTogW1BBVENIIGxpbnV4IGRldi01LjBd?=
 =?utf-8?B?IFtQQVRDSCB2NV0gQVJNOiBkdHM6IGFzcGVlZDogQWRkaW5nIExlbm92byBI?=
 =?utf-8?Q?r630_BMC?=
Thread-Topic: [External]  Re: [PATCH linux dev-5.0] [PATCH v5] ARM: dts:
 aspeed: Adding Lenovo Hr630 BMC
Thread-Index: AQHU+zLqAljKBsCKC0qsdz3Eo3MgAaZSRn4AgACiw9A=
Date: Mon, 29 Apr 2019 11:20:02 +0000
Message-ID: <264283F7338E734E863366C752FEABBC41815126@CNMAILEX01.lenovo.com>
References: <1556174916-137177-1-git-send-email-pengms1@lenovo.com>
 <CACPK8XfZy3znvy1pk0KL1ggrgamaSMHUBj7Na7bN_sq5Th64EA@mail.gmail.com>
In-Reply-To: <CACPK8XfZy3znvy1pk0KL1ggrgamaSMHUBj7Na7bN_sq5Th64EA@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.96.19.89]
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
Cc: Benjamin Fair <benjaminfair@google.com>, Duke KH Du <dukh@lenovo.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Harry Sung1 <hsung1@lenovo.com>,
 Yonghui YH21 Liu <liuyh21@lenovo.com>, Lisa YJ19 Liu <liuyj19@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgSm9lbCwNCg0KU29ydCBhbHBoYWJldGljYWxseS4NCglJIHdpbGwgcmV2aXNlIE1ha2VmaWxl
IGluIG5ldyBwYXRjaC4NCg0KRG8geW91IHVzZSB0aGlzIGZlYXR1cmUgb2YgdGhlIGRyaXZlcj8g
SWYgaXQgd2FzIHRoZXJlIGFzIGEgd29ya2Fyb3VuZCwgbm90ZSB0aGF0IHRoZSBkcml2ZXIgbm8g
bG9uZ2VyIHJlcXVpcmVzIGEgbWVtb3J5IHJlZ2lvbiBpZiB5b3UncmUganVzdCB1c2luZyBpdCB0
byB0dXJuIHRoZSBjbG9ja3Mgb24sIG9yIHBvaW50IHRvIHRoZSBmbGFzaCBkZXZpY2UuDQoJSW50
ZXJuYWwgZGlzY3VzcyBhYm91dCByZXNlcnZhdGlvbiBtZW1vcnkuDQoJDQpUaGlzIG1lc3NhZ2Ug
aXMgY3V0IGFuZCBwYXN0ZWQgZnJvbSB0aGUgYXNwZWVkLWFzdDI1MDAtZXZiLmR0cy4gRG9lcyBp
dCBhbHNvIGFwcGx5IHRvIHlvdXIgc3lzdGVtPw0KCUkgd2lsbCByZW1vdmUgdGhlIFVTQjIuMCBW
aXJ0dWFsIEh1YiBDb250cm9sbGVyIGZyb20gaHI2MzAgRFQuIAkNCg0KUmVnYXJkcywNCkFuZHJl
dw0KDQotLS0tLemCruS7tuWOn+S7ti0tLS0tDQrlj5Hku7bkuro6IEpvZWwgU3RhbmxleSA8am9l
bEBqbXMuaWQuYXU+IA0K5Y+R6YCB5pe26Ze0OiAyMDE55bm0NOaciDI55pelIDE2OjAwDQrmlLbk
u7bkuro6IEFuZHJldyBNUzEgUGVuZyA8cGVuZ21zMUBsZW5vdm8uY29tPg0K5oqE6YCBOiBPcGVu
Qk1DIE1haWxsaXN0IDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+OyBCZW5qYW1pbiBGYWlyIDxi
ZW5qYW1pbmZhaXJAZ29vZ2xlLmNvbT47IFBhdHJpY2sgVmVudHVyZSA8dmVudHVyZUBnb29nbGUu
Y29tPjsgTGlzYSBZSjE5IExpdSA8bGl1eWoxOUBsZW5vdm8uY29tPjsgRHVrZSBLSCBEdSA8ZHVr
aEBsZW5vdm8uY29tPjsgWW9uZ2h1aSBZSDIxIExpdSA8bGl1eWgyMUBsZW5vdm8uY29tPjsgSGFy
cnkgU3VuZzEgPGhzdW5nMUBsZW5vdm8uY29tPg0K5Li76aKYOiBbRXh0ZXJuYWxdIFJlOiBbUEFU
Q0ggbGludXggZGV2LTUuMF0gW1BBVENIIHY1XSBBUk06IGR0czogYXNwZWVkOiBBZGRpbmcgTGVu
b3ZvIEhyNjMwIEJNQw0KDQpPbiBUaHUsIDI1IEFwciAyMDE5IGF0IDA2OjQ4LCBBbmRyZXcgUGVu
ZyA8cGVuZ21zMUBsZW5vdm8uY29tPiB3cm90ZToNCj4NCj4gSW5pdGlhbCBpbnRyb2R1Y3Rpb24g
b2YgTGVub3ZvIEhyNjMwIGZhbWlseSBlcXVpcHBlZCB3aXRoIEFzcGVlZCAyNTAwIA0KPiBCTUMg
U29DLiBIcjYzMCBpcyBhIHg4NiBzZXJ2ZXIgZGV2ZWxvcG1lbnQga2l0IHdpdGggYSBBU1BFRUQg
YXN0MjUwMCANCj4gQk1DIG1hbnVmYWN0dXJlZCBieSBMZW5vdm8uDQo+IFNwZWNpZmljYWxseSwg
VGhpcyBhZGRzIHRoZSBIcjYzMCBwbGF0Zm9ybSBkZXZpY2UgdHJlZSBmaWxlIHVzZWQgYnkgDQo+
IHRoZSBIcjYzMCBCTUMgbWFjaGluZXMuDQoNClRoYW5rcyBmb3IgeW91ciBwYXRjaC4gSSdsbCB3
YWl0IGZvciBhY2tzIGZyb20gQmVuamFtaW4gYW5kIFBhdHJpY2sgYmVmb3JlIGFwcGx5aW5nLiBJ
J3ZlIGdvdCBhIGEgZmV3IHF1ZXN0aW9ucyBvZiBteSBvd24gYmVsb3cuDQoNCg0KPg0KPiBUaGlz
IGFsc28gYWRkcyBhbiBlbnRyeSBvZiBIcjYzMCBkZXZpY2UgdHJlZSBmaWxlIGluIE1ha2VmaWxl
DQo+DQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBQZW5nIDxwZW5nbXMxQGxlbm92by5jb20+DQo+
IFNpZ25lZC1vZmYtYnk6IFlvbmdodWkgTGl1IDxsaXV5aDIxQGxlbm92by5jb20+DQo+IFNpZ25l
ZC1vZmYtYnk6IExpc2EgTGl1IDxsaXV5ajE5QGxlbm92by5jb20+DQo+IC0tLQ0KPiBDaGFuZ2Vz
IGluIHY1Og0KPiAgLSByZXZpc2UgcGNhOTU0NSBhbmQgcGNhOTU0NiBzd2l0Y2ggYWxpYXNlcyBu
YW1lLg0KPiBDaGFuZ2VzIGluIHY0Og0KPiAgLSBhZGQgcGNhOTU0NiBzd2l0Y2ggYWxpYXNlcyBu
YW1lLg0KPiBDaGFuZ2VzIGluIHYzOg0KPiAgLSByZXZpc2UgaTJjIHN3aXRjaCBhbGlhc2VzIG5h
bWUuDQo+IENoYW5nZXMgaW4gdjI6DQo+ICAtIGFkZCBpMmMgc3dpdGNoIGFsaWFzZXMgbmFtZS4N
Cj4gIC0gcmVtb3ZlIHRoZSB1bnVzZWQgZWVwcm9tIGRldmljZSBmcm9tIERUIGZpbGUuDQo+ICAt
IHJlbW92ZSAiTGljZW5zZWQgdW5kZXIuLi4iIHNlbnRlbmNlLg0KPg0KPiAgYXJjaC9hcm0vYm9v
dC9kdHMvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgIHwgICAzICstDQo+ICBhcmNoL2FybS9i
b290L2R0cy9hc3BlZWQtYm1jLWxlbm92by1ocjYzMC5kdHMgfCA4OTAgDQo+ICsrKysrKysrKysr
KysrKysrKysrKysrKysrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDg5MiBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pICBjcmVhdGUgbW9kZSAxMDA2NDQgDQo+IGFyY2gvYXJtL2Jvb3QvZHRzL2Fz
cGVlZC1ibWMtbGVub3ZvLWhyNjMwLmR0cw0KPg0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9v
dC9kdHMvTWFrZWZpbGUgYi9hcmNoL2FybS9ib290L2R0cy9NYWtlZmlsZSANCj4gaW5kZXggYmQ0
MDE0OC4uYjVkMzJhMCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvTWFrZWZpbGUN
Cj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvTWFrZWZpbGUNCj4gQEAgLTEyNDcsNCArMTI0Nyw1
IEBAIGR0Yi0kKENPTkZJR19BUkNIX0FTUEVFRCkgKz0gXA0KPiAgICAgICAgIGFzcGVlZC1ibWMt
b3BwLXdpdGhlcnNwb29uLmR0YiBcDQo+ICAgICAgICAgYXNwZWVkLWJtYy1vcHAtemFpdXMuZHRi
IFwNCj4gICAgICAgICBhc3BlZWQtYm1jLXBvcnR3ZWxsLW5lcHR1bmUuZHRiIFwNCj4gLSAgICAg
ICBhc3BlZWQtYm1jLXF1YW50YS1xNzFsLmR0Yg0KPiArICAgICAgIGFzcGVlZC1ibWMtcXVhbnRh
LXE3MWwuZHRiIFwNCj4gKyAgICAgICBhc3BlZWQtYm1jLWxlbm92by1ocjYzMC5kdGINCg0KU29y
dCBhbHBoYWJldGljYWxseS4NCg0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvYXNw
ZWVkLWJtYy1sZW5vdm8taHI2MzAuZHRzIA0KPiBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1i
bWMtbGVub3ZvLWhyNjMwLmR0cw0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAw
MDAwLi40ZjE4ZjRkDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMv
YXNwZWVkLWJtYy1sZW5vdm8taHI2MzAuZHRzDQo+IEBAIC0wLDAgKzEsODkwIEBADQo+ICsvLyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCsNCj4gKy8qDQo+ICsgKiBEZXZpY2UgVHJl
ZSBmaWxlIGZvciBMZW5vdm8gSHI2MzAgcGxhdGZvcm0NCj4gKyAqDQo+ICsgKiBDb3B5cmlnaHQg
KEMpIDIwMTktcHJlc2VudCBMZW5vdm8NCj4gKyAqLw0KPiArDQo+ICsvZHRzLXYxLzsNCj4gKw0K
PiArI2luY2x1ZGUgImFzcGVlZC1nNS5kdHNpIg0KPiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dw
aW8vYXNwZWVkLWdwaW8uaD4NCj4gKw0KPiArLyB7DQo+ICsgICAgICAgbW9kZWwgPSAiSFI2MzAg
Qk1DIjsNCj4gKyAgICAgICBjb21wYXRpYmxlID0gImxlbm92byxocjYzMC1ibWMiLCAiYXNwZWVk
LGFzdDI1MDAiOw0KPiArDQo+ICsgICAgICAgYWxpYXNlcyB7DQo+ICsgICAgICAgICAgICAgICBp
MmMxNCA9ICZpMmNfcmJwOw0KPiArICAgICAgICAgICAgICAgaTJjMTUgPSAmaTJjX2ZicDE7DQo+
ICsgICAgICAgICAgICAgICBpMmMxNiA9ICZpMmNfZmJwMjsNCj4gKyAgICAgICAgICAgICAgIGky
YzE3ID0gJmkyY19mYnAzOw0KPiArICAgICAgICAgICAgICAgaTJjMTggPSAmaTJjX3Jpc2VyMjsN
Cj4gKyAgICAgICAgICAgICAgIGkyYzE5ID0gJmkyY19wY2llNDsNCj4gKyAgICAgICAgICAgICAg
IGkyYzIwID0gJmkyY19yaXNlcjE7DQo+ICsgICAgICAgICAgICAgICBpMmMyMSA9ICZpMmNfb2Nw
Ow0KPiArICAgICAgIH07DQoNCj4gKyAgICAgICAgICAgICAgIGZsYXNoX21lbW9yeTogcmVnaW9u
QDk4MDAwMDAwIHsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgbm8tbWFwOw0KPiArICAgICAg
ICAgICAgICAgICAgICAgICByZWcgPSA8MHg5ODAwMDAwMCAweDAwMTAwMDAwPjsgLyogMU0gKi8N
Cg0KRG8geW91IHVzZSB0aGlzIGZlYXR1cmUgb2YgdGhlIGRyaXZlcj8gSWYgaXQgd2FzIHRoZXJl
IGFzIGEgd29ya2Fyb3VuZCwgbm90ZSB0aGF0IHRoZSBkcml2ZXIgbm8gbG9uZ2VyIHJlcXVpcmVz
IGEgbWVtb3J5IHJlZ2lvbiBpZiB5b3UncmUganVzdCB1c2luZyBpdCB0byB0dXJuIHRoZSBjbG9j
a3Mgb24sIG9yIHBvaW50IHRvIHRoZSBmbGFzaCBkZXZpY2UuDQoNCj4gKyAgICAgICAgICAgICAg
IH07DQo+ICsNCg0KPiArLyoNCj4gKyAqIEVuYWJsZSBwb3J0IEEgYXMgZGV2aWNlICh2aWEgdGhl
IHZpcnR1YWwgaHViKSBhbmQgcG9ydCBCIGFzDQo+ICsgKiBob3N0IGJ5IGRlZmF1bHQgb24gdGhl
IGV2YWwgYm9hcmQuIFRoaXMgY2FuIGJlIGVhc2lseSBjaGFuZ2VkDQo+ICsgKiBieSByZXBsYWNp
bmcgdGhlIG92ZXJyaWRlIGJlbG93IHdpdGggJmVoY2kwIHsgLi4uIH0gdG8gZW5hYmxlDQo+ICsg
KiBob3N0IG9uIGJvdGggcG9ydHMuDQo+ICsgKi8NCg0KVGhpcyBtZXNzYWdlIGlzIGN1dCBhbmQg
cGFzdGVkIGZyb20gdGhlIGFzcGVlZC1hc3QyNTAwLWV2Yi5kdHMuIERvZXMgaXQgYWxzbyBhcHBs
eSB0byB5b3VyIHN5c3RlbT8NCg==
