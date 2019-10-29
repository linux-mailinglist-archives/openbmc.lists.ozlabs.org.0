Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 820B6E8077
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 07:41:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472MSF2xWTzF1Q2
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 17:41:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=198c5288d=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 472MR50HlyzF1K4
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 17:40:25 +1100 (AEDT)
IronPort-SDR: nYZxMssp7ekOnsTZjec7nY3DFLkCLR73+MnIgdI9mSks2HZNaohdZ4URT3vLxEeocm6dp2JLY9
 coyuKxHGRxHw==
Received: from unknown (HELO mailbx05.quanta.corp) ([10.243.91.100])
 by mx01.quantatw.com with ESMTP; 29 Oct 2019 14:40:20 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx05.quanta.corp
 (10.243.91.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 29 Oct
 2019 14:40:17 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%4]) with mapi id
 15.01.1713.009; Tue, 29 Oct 2019 14:40:17 +0800
From: =?big5?B?VG9ueSBMZWUgKKf1pOW0SSk=?= <Tony.Lee@quantatw.com>
To: James Feist <james.feist@linux.intel.com>, "jason.m.bills@linux.intel.com"
 <jason.m.bills@linux.intel.com>
Subject: RE: Showing signed sensor value when the command "ipmitool sel elist"
 is executed
Thread-Topic: Showing signed sensor value when the command "ipmitool sel
 elist" is executed
Thread-Index: AdWNWFHRoJAe9/HYQ5KNxGajnOPsiQAGBUcAACotBZA=
Date: Tue, 29 Oct 2019 06:40:17 +0000
Message-ID: <f21b9266035247e7b52c722c698871c1@quantatw.com>
References: <b3c1129773c64c97b9655701cb506578@quantatw.com>
 <efe40787-6aae-c64d-128e-42dd0ed912f2@linux.intel.com>
In-Reply-To: <efe40787-6aae-c64d-128e-42dd0ed912f2@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-14.0.0.1158-8.5.1020-25008.004
x-tm-as-result: No-10--15.187700-5.000000
x-tmase-matchedrid: 2SDSohiwfqTUL3YCMmnG4hvgzEPRJaDEWw/S0HB7eoMTiSW9r3PknMru
 gDwhJXcQzaV38nFOpHqjwJuiAh1/Yxj2ph0D59Wv5b0nmEmBFCynCSKz4gA7FzhdESD0qLXTG9l
 dgdPsk0XtDQ8yh9J9+mN0jvDhpUVG9aR14Cy4CdmBgUO0zfAYGovkwJz527bY1y0aXF5eX+hpcr
 NTw4Vi6NpQzn8/P6DFLpdHZ4YRNlXQVcssd7FTbaJ7YUGrkIwGDyV2oSIWznLA5gKtRJGKWpbPB
 saBVoblQ4Ro4vN1ZpCG6/fUa24msGHjhWUsEu50j0FWpA5CVPnAmOfzKotTogQaiiWKsizDsskC
 J7yz5Pz442GRDd4UhZsoi2XrUn/Jsuf7RWbvUtze3/9uSSiAvgtuKBGekqUpOlxBO2IcOBYmdhG
 GqhuhUK4UF0V0c54hmQ1Y22bWY1ueOZPFZ4O/XEzKcAHOegIa
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--15.187700-5.000000
x-tmase-version: SMEX-14.0.0.1158-8.5.1020-25008.004
x-tm-snts-smtp: 32F156F403C1052EA4DD46DC5908AE0E312F37BF5985D0717D152685702AE1B92000:B
Content-Type: text/plain; charset="big5"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 =?big5?B?QnVkZHkgSHVhbmcgKLbApNHCRSk=?= <Buddy.Huang@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiBPbiAxMC8yNy8xOSAxMTo0MSBQTSwgVG9ueSBMZWUgKKf1pOW0SSkgd3JvdGU6DQo+ID4gSGkg
SmFzb24sDQo+ID4NCj4gPiBXZSBrbm93IHRoYXQgd2hlbiB3ZSBleGVjdXRlIHRoZSBjb21tYW5k
ICJpcG1pdG9vbCBzZWwgZWxpc3QiLCBpdCB3aWxsDQo+IHJldHVybiBzb21ldGhpbmcgbGlrZSB0
aGUgZm9sbG93aW5nLA0KPiA+ICIxOCB8IDEwLzE2LzE5IHwgMTg6Mjg6NDEgVVRDIHwgVGVtcGVy
YXR1cmUgbnZtZTAgfCBVcHBlciBOb24tY3JpdGljYWwNCj4gZ29pbmcgaGlnaCB8IEFzc2VydGVk
IHwgUmVhZGluZyA3MiA+IFRocmVzaG9sZCA3MCBkZWdyZWVzIEMiLg0KPiA+DQo+ID4gSSBtZXQg
YSBwcm9ibGVtIHRoYXQgd2hlbiB0aGUgc2Vuc29yIHZhbHVlIGluIHRoZSBkLWJ1cyBpcyBuZWdh
dGl2ZSwgdGhlDQo+IGN1cnJlbnQgcmVhZGluZyBpbiAiaXBtaXRvb2wgc2VsIGVsaXN0IiB3aWxs
IGJlIDAuDQo+ID4gSXQgc2VlbXMgdGhhdCBiZWNhdXNlIHRoZSB0eXBlIG9mIHNjYWxlZFZhbHVl
IGlzIGRlZmluZWQgInVpbnQzMl90IiwgdGhlcmUgaXMNCj4gYWx3YXlzIGEgbm9uZSBuZWdhdGl2
ZSB2YWx1ZSBldmVuIGN1cnJlbnQgdmFsdWUgaXMgYSBuZWdhdGl2ZSB2YWx1ZSBvYnRhaW5lZA0K
PiBmcm9tIHRoZSBkLWJ1cy4gSW4NCj4gPg0KPiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9w
aG9zcGhvci1zZWwtbG9nZ2VyL2Jsb2IvbWFzdGVyL2luY2x1ZGUvc2Vucw0KPiBvcnV0aWxzLmhw
cCNMMTU5DQo+ID4NCj4gPiBJcyB0aGlzIGlzIGFuIGlzc3VlIG9yIEkgbmVlZCB0byBzZXQgaXQg
dXAgc29tZXdoZXJlPw0KPiANCj4gSWYgbWluIGlzIDwgMCwgdGhlbiB0aGlzIHNob3VsZCB3b3Jr
Og0KPiANCj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3Itc2VsLWxvZ2dlci9i
bG9iLzZhZmU5NTYwODUyYzY0MzFjNA0KPiAzYzhlNzlhMjhlMmI3Y2I0OThlMzU1L2luY2x1ZGUv
c2Vuc29ydXRpbHMuaHBwI0w2MQ0KPiANCj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhv
c3Bob3ItZGJ1cy1pbnRlcmZhY2VzL2Jsb2IvMTIxNjJiZTM2M2YxMQ0KPiBiOWRhZmE5MmI1Mzc5
ZGI2NzE3MTJiMzUyM2MveHl6L29wZW5ibWNfcHJvamVjdC9TZW5zb3IvVmFsdWUuaW50ZXJmYWMN
Cj4gZS55YW1sI0wyOA0KPiANCj4gSXQgdXNlcyBNaW5WYWx1ZSA8IDAgdG8gZGV0ZXJtaW5lIGlm
IHRoZSBzZW5zb3IgaXMgc2lnbmVkIG9yIG5vdC4NCg0KSGkgSmFtZXMsDQoNClllcywgTXkgTWlu
VmFsdWUgYW5kIG1pbiBhcmUgPCAwLg0KSSB1bmRlcnN0YW5kIHRoYXQgSWYgbWluIGlzIDwgMCB0
aGVuIGJTaWduZWQgPSB0cnVlIGZpbmFsbHkgaXQgd2lsbCByZXR1cm4gc3RhdGljX2Nhc3Q8aW50
OF90PihzY2FsZWRWYWx1ZSkNCnRoZW4gdGhpcyBzaG91bGQgd29yay4gQnV0LCBhZnRlciANCmh0
dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bob3NwaG9yLXNlbC1sb2dnZXIvYmxvYi82YWZlOTU2
MDg1MmM2NDMxYzQzYzhlNzlhMjhlMmI3Y2I0OThlMzU1L2luY2x1ZGUvc2Vuc29ydXRpbHMuaHBw
I0wxNTkNCkkgZ290IHNjYWxlZFZhbHVlID0gMCBhbmQgcmV0dXJuIDAgaW4gdGhlIGVuZC4NCg0K
VGhlcmUgYXJlIGFub3RoZXIgcXVlc3Rpb24gdGhhdCB3aHkgaXMgInNjYWxlZFZhbHVlIiBkZWZp
bmVkIGFzIHVpbnQzMl90Pw0KU2hvdWxkbid0IGl0IHJldHVybiBhIGJ5dGUodWludDhfdCkgYWZ0
ZXIgY2FsY3VsYXRpb24/DQoNCkhlcmUgaXMgbXkgc2V0dGluZ3MgYW5kIGRlYnVnIGxvZ3M6DQpt
YXggPSAxMjcuMDAwMDAwDQptaW4gPSAtMTI4LjAwMDAwMA0KdmFsdWUgPSAtMS4wMDAwMDANCm1W
YWx1ZSA9IDENCnJFeHAgPSAwDQpiVmFsdWUgPSAwDQpiRXhwID0gMA0KYlNpZ25lZCA9IHRydWUN
CnNjYWxlZFZhbHVlID0gMA0KDQpUaGFua3MsDQotVG9ueQ0KDQo+IFRoYW5rcywNCj4gDQo+IC1K
YW1lcw0KPiANCj4gPg0KPiA+IFRoYW5rcw0KPiA+IEJlc3QgUmVnYXJkcywNCj4gPiBUb255DQo+
ID4NCg==
