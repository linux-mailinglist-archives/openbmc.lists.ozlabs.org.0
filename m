Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4478A295E43
	for <lists+openbmc@lfdr.de>; Thu, 22 Oct 2020 14:22:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CH61k4hL6zDqr6
	for <lists+openbmc@lfdr.de>; Thu, 22 Oct 2020 23:22:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=adrian.ambrozewicz@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CH5xR2RNWzDqr5
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2020 23:18:30 +1100 (AEDT)
IronPort-SDR: zTlZ5Wufj1QO2yjLH3GP1w4hAlwx9LOJTRG8uGhi4qqMYUtRhODs35pUTCE78laKUp02rV3aiY
 w4NwmADcqPWQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9781"; a="154469534"
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; d="scan'208";a="154469534"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2020 05:18:26 -0700
IronPort-SDR: HVEtWmiJLB043OEpAmAlxlHC/Pl5j6MRbcwRS3Mo6LmM6ZSoJzjo6WQzx3PyUntY3nU1uclI5z
 LlGUQFD/V7Og==
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; d="scan'208";a="524259622"
Received: from aambroze-mobl.ger.corp.intel.com (HELO [10.213.14.170])
 ([10.213.14.170])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2020 05:18:25 -0700
Subject: Re: Firmware version under IPMB sensors
To: Jayashree D <jayashree-d@hcl.com>, Ed Tanous <ed@tanous.net>
References: <SG2PR04MB3093F4B562F454122B7F4596E10C0@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <CACWQX83t7k5iVRAsL+7EcGr2QL3LgbM2N09iOiro747cMqDe1w@mail.gmail.com>
 <SG2PR04MB3093F45D8E9B246CDD6D7143E10C0@SG2PR04MB3093.apcprd04.prod.outlook.com>
From: "Ambrozewicz, Adrian" <adrian.ambrozewicz@linux.intel.com>
Message-ID: <44a958ea-98d3-43cf-a23d-d7ebbbb0d013@linux.intel.com>
Date: Thu, 22 Oct 2020 14:18:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <SG2PR04MB3093F45D8E9B246CDD6D7143E10C0@SG2PR04MB3093.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: base64
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SXQncyBub3QgY2xlYXIgZm9yIG1lIGhvdyBkbyB5b3UgcGxhbiB0byBleHBvc2UgdGhpcyBp
bmZvcm1hdGlvbi4NCk1lbnRpb25lZCBkYnVzLXNlbnNvcnMgc2VydmljZSBpcyBtYWlubHkg
Zm9jdXNlZCBvbiBleHBvc2luZyBTZW5zb3IgZGF0YSANCmNvbXBsaWFudCB3aXRoIGZvbGxv
d2luZyBpbnRlcmZhY2U6IA0KaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3It
ZGJ1cy1pbnRlcmZhY2VzL2Jsb2IvbWFzdGVyL3h5ei9vcGVuYm1jX3Byb2plY3QvU2Vuc29y
L1ZhbHVlLmludGVyZmFjZS55YW1sDQoNCkhhdmluZyBGVyByZXZpc2lvbiBleHBvc2VkIHRo
cm91Z2ggc3RhY2sgJ2RidXMtc2Vuc29ycy1saWtlJyBpcyBPSywgYXMgDQp5b3UgY291bGQg
dXRpbGl6ZSBmb2xsb3dpbmcgc3RhY2sgOg0KLSBFbnRpdHlNYW5hZ2VyIGZvciBjb25maWd1
cmF0aW9uIG9mIG1vbml0b3JlZCBjb21wb25lbnRzIChidXMsIGFkZHJlc3MgZXRjKQ0KLSBo
aWdoZXIgbGV2ZWwgc2VydmljZSBkeW5hbWljYWxseSBzcGF3bmluZyBEQnVzIG9iamVjdHMg
d2l0aCB2ZXJzaW9uIA0KaW5mb3JtYXRpb24NCi0gZXhwb3NlIGluZm9ybWF0aW9uIGluIHN0
YW5kYXJkaXplZCB3YXkgKHByb2JhYmx5IA0KaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMv
cGhvc3Bob3ItZGJ1cy1pbnRlcmZhY2VzL2Jsb2IvbWFzdGVyL3h5ei9vcGVuYm1jX3Byb2pl
Y3QvU29mdHdhcmUvVmVyc2lvbi5pbnRlcmZhY2UueWFtbCkNCg0KUmVnYXJkcywNCkFkcmlh
bg0KDQpXIGRuaXUgMTAvNS8yMDIwIG/CoDE5OjUzLCBKYXlhc2hyZWUgRCBwaXN6ZToNCj4g
Q2xhc3NpZmljYXRpb246IEhDTCBJbnRlcm5hbA0KPiANCj4gSGkgRWQgVGFub3VzLA0KPiAN
Cj4gV2UgYXJlIHVzaW5nIFR3aW5sYWtlIGZvciBJUE1CIGFuZCBwbGFuIHRvIHJlYWQgYWxs
IHRoZSBmaXJtd2FyZSB2ZXJzaW9ucyAoIENQTEQsIE1FLCBCcmlkZ2UgSUMsIFZSKSB1c2lu
ZyBPRU0gY29tbWFuZHMuIEFsc28gZGlzcGxheSB0aGUgZmlybXdhcmUgdmVyc2lvbnMgdXNp
bmcgZGJ1cyBvYmplY3RzLg0KPiANCj4gUmVnYXJkcywNCj4gSmF5YXNocmVlDQo+IA0KPiAN
Cj4gDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEVkIFRhbm91cyA8
ZWRAdGFub3VzLm5ldD4NCj4gU2VudDogTW9uZGF5LCBPY3RvYmVyIDUsIDIwMjAgNzo1NSBQ
TQ0KPiBUbzogSmF5YXNocmVlIEQgPGpheWFzaHJlZS1kQGhjbC5jb20+DQo+IENjOiBvcGVu
Ym1jQGxpc3RzLm96bGFicy5vcmc7IFZlbHVtYW5pIFQtRVJTLEhDTFRlY2ggPHZlbHVtYW5p
dEBoY2wuY29tPg0KPiBTdWJqZWN0OiBSZTogRmlybXdhcmUgdmVyc2lvbiB1bmRlciBJUE1C
IHNlbnNvcnMNCj4gDQo+IFtDQVVUSU9OOiBUaGlzIEVtYWlsIGlzIGZyb20gb3V0c2lkZSB0
aGUgT3JnYW5pemF0aW9uLiBVbmxlc3MgeW91IHRydXN0IHRoZSBzZW5kZXIsIERvbuKAmXQg
Y2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyBhcyBpdCBtYXkgYmUgYSBQaGlzaGlu
ZyBlbWFpbCwgd2hpY2ggY2FuIHN0ZWFsIHlvdXIgSW5mb3JtYXRpb24gYW5kIGNvbXByb21p
c2UgeW91ciBDb21wdXRlci5dDQo+IA0KPiBPbiBTdW4sIE9jdCA0LCAyMDIwIGF0IDExOjQz
IFBNIEpheWFzaHJlZSBEIDxqYXlhc2hyZWUtZEBoY2wuY29tPiB3cm90ZToNCj4+DQo+PiBD
bGFzc2lmaWNhdGlvbjogSENMIEludGVybmFsDQo+Pg0KPj4gSGkgVGVhbSwNCj4+DQo+Pg0K
Pj4NCj4+IEluIG15IHN5c3RlbSwgaG9zdCBpcyBjb25uZWN0ZWQgdG8gSVBNQiBhbmQgaG9z
dCByZWxhdGVkIGluZm9ybWF0aW9uIGlzIHJldHJpZXZlZCB1c2luZyBJUE1CIGJ1cy4NCj4+
IEkgcGxhbiB0byBhZGQgZmlybXdhcmUgdmVyc2lvbnMgaW4gdGhlIGRidXMtc2Vuc29ycy4g
QWRkaW5nIHRoaXMgYXMgYW5vdGhlciBlbnRpdHkgYXMgbGlrZSBpcG1ic2Vuc29yLg0KPj4g
VGhpcyB3aWxsIGhlbHAgaW4gaGF2aW5nIGFsbCB0cmFuc2FjdGlvbiBpbiBJUE1CIHNlbnNv
ci4NCj4gDQo+IFNvdW5kcyByZWFzb25hYmxlLiAgRG8geW91IGludGVuZCBvbiB1c2luZyB0
aGUgZ2V0IGRldmljZSBpZCBjb21tYW5kIHRvIGRldGVybWluZSB0aGUgdmVyc2lvbiBudW1i
ZXI/ICBXaGF0IHBpZWNlIG9mIGhhcmR3YXJlIGFyZSB5b3UgY29ubmVjdGluZyB0bz8NCj4g
OjpESVNDTEFJTUVSOjoNCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4g
VGhlIGNvbnRlbnRzIG9mIHRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudChzKSBhcmUg
Y29uZmlkZW50aWFsIGFuZCBpbnRlbmRlZCBmb3IgdGhlIG5hbWVkIHJlY2lwaWVudChzKSBv
bmx5LiBFLW1haWwgdHJhbnNtaXNzaW9uIGlzIG5vdCBndWFyYW50ZWVkIHRvIGJlIHNlY3Vy
ZSBvciBlcnJvci1mcmVlIGFzIGluZm9ybWF0aW9uIGNvdWxkIGJlIGludGVyY2VwdGVkLCBj
b3JydXB0ZWQsIGxvc3QsIGRlc3Ryb3llZCwgYXJyaXZlIGxhdGUgb3IgaW5jb21wbGV0ZSwg
b3IgbWF5IGNvbnRhaW4gdmlydXNlcyBpbiB0cmFuc21pc3Npb24uIFRoZSBlIG1haWwgYW5k
IGl0cyBjb250ZW50cyAod2l0aCBvciB3aXRob3V0IHJlZmVycmVkIGVycm9ycykgc2hhbGwg
dGhlcmVmb3JlIG5vdCBhdHRhY2ggYW55IGxpYWJpbGl0eSBvbiB0aGUgb3JpZ2luYXRvciBv
ciBIQ0wgb3IgaXRzIGFmZmlsaWF0ZXMuIFZpZXdzIG9yIG9waW5pb25zLCBpZiBhbnksIHBy
ZXNlbnRlZCBpbiB0aGlzIGVtYWlsIGFyZSBzb2xlbHkgdGhvc2Ugb2YgdGhlIGF1dGhvciBh
bmQgbWF5IG5vdCBuZWNlc3NhcmlseSByZWZsZWN0IHRoZSB2aWV3cyBvciBvcGluaW9ucyBv
ZiBIQ0wgb3IgaXRzIGFmZmlsaWF0ZXMuIEFueSBmb3JtIG9mIHJlcHJvZHVjdGlvbiwgZGlz
c2VtaW5hdGlvbiwgY29weWluZywgZGlzY2xvc3VyZSwgbW9kaWZpY2F0aW9uLCBkaXN0cmli
dXRpb24gYW5kIC8gb3IgcHVibGljYXRpb24gb2YgdGhpcyBtZXNzYWdlIHdpdGhvdXQgdGhl
IHByaW9yIHdyaXR0ZW4gY29uc2VudCBvZiBhdXRob3JpemVkIHJlcHJlc2VudGF0aXZlIG9m
IEhDTCBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlz
IGVtYWlsIGluIGVycm9yIHBsZWFzZSBkZWxldGUgaXQgYW5kIG5vdGlmeSB0aGUgc2VuZGVy
IGltbWVkaWF0ZWx5LiBCZWZvcmUgb3BlbmluZyBhbnkgZW1haWwgYW5kL29yIGF0dGFjaG1l
bnRzLCBwbGVhc2UgY2hlY2sgdGhlbSBmb3IgdmlydXNlcyBhbmQgb3RoZXIgZGVmZWN0cy4N
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gDQoNCg==
