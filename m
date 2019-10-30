Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18095E9625
	for <lists+openbmc@lfdr.de>; Wed, 30 Oct 2019 06:51:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472yJ60pblzF3GQ
	for <lists+openbmc@lfdr.de>; Wed, 30 Oct 2019 16:51:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=199bae2d6=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 472yHJ3dNNzF3f2
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 16:50:47 +1100 (AEDT)
IronPort-SDR: O+APhYom7pYrJnMt2gzeXZQRGr+XujWq0jGJjoSA0tbV2E/PhvccrEvY5vNl2Ncq8Po12Lx4/8
 yrkiM3KNuXkg==
Received: from unknown (HELO mailbx05.quanta.corp) ([10.243.91.100])
 by mx01.quantatw.com with ESMTP; 30 Oct 2019 13:50:44 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx05.quanta.corp
 (10.243.91.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 30 Oct
 2019 13:50:40 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%4]) with mapi id
 15.01.1713.009; Wed, 30 Oct 2019 13:50:40 +0800
From: =?big5?B?VG9ueSBMZWUgKKf1pOW0SSk=?= <Tony.Lee@quantatw.com>
To: James Feist <james.feist@linux.intel.com>, "jason.m.bills@linux.intel.com"
 <jason.m.bills@linux.intel.com>
Subject: RE: Showing signed sensor value when the command "ipmitool sel elist"
 is executed
Thread-Topic: Showing signed sensor value when the command "ipmitool sel
 elist" is executed
Thread-Index: AdWNWFHRoJAe9/HYQ5KNxGajnOPsiQAGBUcAACotBZAABhKNAAAB3zkAACscSVA=
Date: Wed, 30 Oct 2019 05:50:40 +0000
Message-ID: <168946e3f4b548419e03c051b9286e78@quantatw.com>
References: <b3c1129773c64c97b9655701cb506578@quantatw.com>
 <efe40787-6aae-c64d-128e-42dd0ed912f2@linux.intel.com>
 <f21b9266035247e7b52c722c698871c1@quantatw.com>
 <13f22bc9-c8db-afe1-64ab-ece4206c2f44@linux.intel.com>
 <8f235bd7-5157-9d13-6e3f-2c362ae76426@linux.intel.com>
In-Reply-To: <8f235bd7-5157-9d13-6e3f-2c362ae76426@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-14.0.0.1158-8.5.1020-25010.005
x-tm-as-result: No-10--14.226300-5.000000
x-tmase-matchedrid: mHCEnrG40p7UL3YCMmnG4hvgzEPRJaDEWw/S0HB7eoMTiSW9r3PknMru
 gDwhJXcQzaV38nFOpHqjwJuiAh1/Yxj2ph0D59Wv5b0nmEmBFCynCSKz4gA7FzhdESD0qLXTG9l
 dgdPsk0XtDQ8yh9J9+mN0jvDhpUVG9aR14Cy4CdmBgUO0zfAYGovkwJz527bY1y0aXF5eX+hpcr
 NTw4Vi6NpQzn8/P6DFLpdHZ4YRNlXQVcssd7FTbaJ7YUGrkIwGDyV2oSIWznLA5gKtRJGKWpbPB
 saBVoblGBjnw2jC68zcd5gX5HGUyrUd2R7XKvn3iV0ptmwZhq3NUTeBBPKQKrNTRH7kNsNsw/fb
 fywPSrpG1lvcm1nXtWMuidnbeZKRYeOFZSwS7nQ9oFMnLLzjBfVx+fmeRDezG64y8JtpBraSbV2
 DfIEqaAyV8jWfGZ8vQkNeZB7NAs7oV3o5SLrUYs36paW7ZnFoNV9S7O+u3KY+n5lKDOavuf57N+
 iDW4XT2TaDGX0BbTsn1fzxcyrKSKKiKdQFGQeaLbz14WSxp5EHAX3ZUg6F/GgEilvd87CemcUjS
 jJ1oDJ9LQinZ4QefNQdB5NUNSsiUZI9BiU+2rR8nn9tnqel2MprJP8FBOIa7euxdOndYh+t2v2i
 0hyolUnEN1Q/Vi8TkRho8EW5FUCT14bPtLT1NA==
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--14.226300-5.000000
x-tmase-version: SMEX-14.0.0.1158-8.5.1020-25010.005
x-tm-snts-smtp: 29B7632F39F99F762A5FA87D7021DEE704E94D0C55077DFA988CDB268F9306EF2000:B
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

PiBPbiAxMC8yOS8xOSA5OjE4IEFNLCBKYW1lcyBGZWlzdCB3cm90ZToNCj4gPiBPbiAxMC8yOC8x
OSAxMTo0MCBQTSwgVG9ueSBMZWUgKKf1pOW0SSkgd3JvdGU6DQo+ID4+PiBPbiAxMC8yNy8xOSAx
MTo0MSBQTSwgVG9ueSBMZWUgKKf1pOW0SSkgd3JvdGU6DQo+ID4+Pj4gSGkgSmFzb24sDQo+ID4+
Pj4NCj4gPj4+PiBXZSBrbm93IHRoYXQgd2hlbiB3ZSBleGVjdXRlIHRoZSBjb21tYW5kICJpcG1p
dG9vbCBzZWwgZWxpc3QiLCBpdA0KPiA+Pj4+IHdpbGwNCj4gPj4+IHJldHVybiBzb21ldGhpbmcg
bGlrZSB0aGUgZm9sbG93aW5nLA0KPiA+Pj4+ICIxOCB8IDEwLzE2LzE5IHwgMTg6Mjg6NDEgVVRD
IHwgVGVtcGVyYXR1cmUgbnZtZTAgfCBVcHBlcg0KPiA+Pj4+IE5vbi1jcml0aWNhbA0KPiA+Pj4g
Z29pbmcgaGlnaCB8IEFzc2VydGVkIHwgUmVhZGluZyA3MiA+IFRocmVzaG9sZCA3MCBkZWdyZWVz
IEMiLg0KPiA+Pj4+DQo+ID4+Pj4gSSBtZXQgYSBwcm9ibGVtIHRoYXQgd2hlbiB0aGUgc2Vuc29y
IHZhbHVlIGluIHRoZSBkLWJ1cyBpcw0KPiA+Pj4+IG5lZ2F0aXZlLCB0aGUNCj4gPj4+IGN1cnJl
bnQgcmVhZGluZyBpbiAiaXBtaXRvb2wgc2VsIGVsaXN0IiB3aWxsIGJlIDAuDQo+ID4+Pj4gSXQg
c2VlbXMgdGhhdCBiZWNhdXNlIHRoZSB0eXBlIG9mIHNjYWxlZFZhbHVlIGlzIGRlZmluZWQNCj4g
Pj4+PiAidWludDMyX3QiLCB0aGVyZSBpcw0KPiA+Pj4gYWx3YXlzIGEgbm9uZSBuZWdhdGl2ZSB2
YWx1ZSBldmVuIGN1cnJlbnQgdmFsdWUgaXMgYSBuZWdhdGl2ZSB2YWx1ZQ0KPiA+Pj4gb2J0YWlu
ZWQgZnJvbSB0aGUgZC1idXMuIEluDQo+ID4+Pj4NCj4gPj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9v
cGVuYm1jL3Bob3NwaG9yLXNlbC1sb2dnZXIvYmxvYi9tYXN0ZXIvaW5jbHVkZS9zDQo+ID4+PiBl
bnMNCj4gPj4+IG9ydXRpbHMuaHBwI0wxNTkNCj4gPj4+Pg0KPiA+Pj4+IElzIHRoaXMgaXMgYW4g
aXNzdWUgb3IgSSBuZWVkIHRvIHNldCBpdCB1cCBzb21ld2hlcmU/DQo+ID4+Pg0KPiA+Pj4gSWYg
bWluIGlzIDwgMCwgdGhlbiB0aGlzIHNob3VsZCB3b3JrOg0KPiA+Pj4NCj4gPj4+DQo+IGh0dHBz
Oi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bob3NwaG9yLXNlbC1sb2dnZXIvYmxvYi82YWZlOTU2MDg1
MmM2NDMxDQo+ID4+PiBjNA0KPiA+Pj4gM2M4ZTc5YTI4ZTJiN2NiNDk4ZTM1NS9pbmNsdWRlL3Nl
bnNvcnV0aWxzLmhwcCNMNjENCj4gPj4+DQo+ID4+Pg0KPiBodHRwczovL2dpdGh1Yi5jb20vb3Bl
bmJtYy9waG9zcGhvci1kYnVzLWludGVyZmFjZXMvYmxvYi8xMjE2MmJlMzYzZg0KPiA+Pj4gMTEN
Cj4gPj4+DQo+IGI5ZGFmYTkyYjUzNzlkYjY3MTcxMmIzNTIzYy94eXovb3BlbmJtY19wcm9qZWN0
L1NlbnNvci9WYWx1ZS5pbnRlcmZhDQo+ID4+PiBjDQo+ID4+PiBlLnlhbWwjTDI4DQo+ID4+Pg0K
PiA+Pj4gSXQgdXNlcyBNaW5WYWx1ZSA8IDAgdG8gZGV0ZXJtaW5lIGlmIHRoZSBzZW5zb3IgaXMg
c2lnbmVkIG9yIG5vdC4NCj4gPj4NCj4gPj4gSGkgSmFtZXMsDQo+ID4+DQo+ID4+IFllcywgTXkg
TWluVmFsdWUgYW5kIG1pbiBhcmUgPCAwLg0KPiA+PiBJIHVuZGVyc3RhbmQgdGhhdCBJZiBtaW4g
aXMgPCAwIHRoZW4gYlNpZ25lZCA9IHRydWUgZmluYWxseSBpdCB3aWxsDQo+ID4+IHJldHVybiBz
dGF0aWNfY2FzdDxpbnQ4X3Q+KHNjYWxlZFZhbHVlKSB0aGVuIHRoaXMgc2hvdWxkIHdvcmsuIEJ1
dCwNCj4gPj4gYWZ0ZXINCj4gPj4NCj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bo
b3Itc2VsLWxvZ2dlci9ibG9iLzZhZmU5NTYwODUyYzY0MzFjDQo+ID4+IDQzYzhlNzlhMjhlMmI3
Y2I0OThlMzU1L2luY2x1ZGUvc2Vuc29ydXRpbHMuaHBwI0wxNTkNCj4gPj4NCj4gPj4gSSBnb3Qg
c2NhbGVkVmFsdWUgPSAwIGFuZCByZXR1cm4gMCBpbiB0aGUgZW5kLg0KPiA+Pg0KPiA+PiBUaGVy
ZSBhcmUgYW5vdGhlciBxdWVzdGlvbiB0aGF0IHdoeSBpcyAic2NhbGVkVmFsdWUiIGRlZmluZWQg
YXMgdWludDMyX3Q/DQo+ID4+IFNob3VsZG4ndCBpdCByZXR1cm4gYSBieXRlKHVpbnQ4X3QpIGFm
dGVyIGNhbGN1bGF0aW9uPw0KPiA+DQo+ID4gVGhlIHJldHVybiB2YWx1ZSBpcyBhbiB1aW50OF90
IChhYm91dCA1IGxpbmVzIGJlbG93IHdoZXJlIHlvdSBsaW5rZWQpLg0KPiA+IFRoZSBwb2ludCBv
ZiBpdCBiZWluZyBhIHVpbnQzMl90IGlzIHNvIHlvdSBjYW4gY2hlY2sgZm9yIG92ZXJmbG93Lg0K
PiA+IFRoYXQgYmVpbmcgc2FpZCBsb29raW5nIGF0IHRoZSB1bml0IHRlc3RzIEkgZG9uJ3QgYmVs
aWV2ZSB3ZSBjaGVjayBmb3INCj4gPiBuZWdhdGl2ZSwgYW5kIHRoYXQgbWlnaHQgbmVlZCB0byBi
ZSBhIGludDMyX3QuDQpPSywgSSBnZXQgaXQuDQoNCj4gPiBUaGUgdGVzdHMgYXJlIGhlcmU6DQo+
ID4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvaW50ZWwtaXBtaS1vZW0vYmxvYi9tYXN0ZXIv
dGVzdHMvdGVzdF9zZW5zbw0KPiA+IHJjb21tYW5kcy5jcHANCj4gPg0KPiA+DQo+ID4gSSdsbCB0
cnkgdG8gdGFrZSBhIGxvb2sgaW4gdGhlIG5leHQgZGF5IG9yIHR3byBhbmQgd3JpdGUgYSBuZXcg
dGVzdCB0bw0KPiA+IHNlZSBpZiB0aGF0IGZpeGVzIGl0LCBidXQgZmVlbCBmcmVlIHRvIGFkZCBh
IHRlc3QgeW91cnNlbGYgaWYgeW91IGJlYXQNCj4gPiBtZSB0byBpdC4NCj4gDQo+IEdpdmUgdGhp
cyBhIHNob3Q6DQo+IGh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJvamVjdC54eXovYy9vcGVuYm1j
L2ludGVsLWlwbWktb2VtLysvMjY2NjQNCkxvb2tzIGdvb2QgdG8gbWUsIHRoYW5rcyBmb3IgdGhl
IGhlbHAuDQoNCj4gSXQnbGwgbmVlZCB0byBiZSBwb3J0ZWQgdG8gcGhvc3Bob3Itc2VsLWxvZ2dl
ciB3aGVuIHJldmlldyBwYXNzZXMuDQo+IA0KPiA+DQo+ID4gLUphbWVzDQo+ID4NCj4gPj4NCj4g
Pj4gSGVyZSBpcyBteSBzZXR0aW5ncyBhbmQgZGVidWcgbG9nczoNCj4gPj4gbWF4ID0gMTI3LjAw
MDAwMA0KPiA+PiBtaW4gPSAtMTI4LjAwMDAwMA0KPiA+PiB2YWx1ZSA9IC0xLjAwMDAwMA0KPiA+
PiBtVmFsdWUgPSAxDQo+ID4+IHJFeHAgPSAwDQo+ID4+IGJWYWx1ZSA9IDANCj4gPj4gYkV4cCA9
IDANCj4gPj4gYlNpZ25lZCA9IHRydWUNCj4gPj4gc2NhbGVkVmFsdWUgPSAwDQo+ID4+DQo+ID4+
IFRoYW5rcywNCj4gPj4gLVRvbnkNCj4gPj4NCj4gPj4+IFRoYW5rcywNCj4gPj4+DQo+ID4+PiAt
SmFtZXMNCj4gPj4+DQo+ID4+Pj4NCj4gPj4+PiBUaGFua3MNCj4gPj4+PiBCZXN0IFJlZ2FyZHMs
DQo+ID4+Pj4gVG9ueQ0KPiA+Pj4+DQo=
