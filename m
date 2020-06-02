Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BFE1EC1DF
	for <lists+openbmc@lfdr.de>; Tue,  2 Jun 2020 20:34:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49c11B184vzDqXY
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 04:34:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=sharad.khetan@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=Sug8gLZC; dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49c1020Fd5zDqWy
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jun 2020 04:33:44 +1000 (AEST)
IronPort-SDR: 8zMMiFC49xta/of3fpeYD/wGdEQtpitYBc5gVctAkaHV9JfBaiJcps6/UCRDyWDUIsVM3U3uoC
 Wiw7oB5zzMpA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2020 11:33:39 -0700
IronPort-SDR: Us5K/rT6p6R/lfzRU1y7VSik3xhmPhO109L/GTxmPcQObAv0NqUZ/KXthtUeo8Dflh3evZYx9g
 PPtTl9YKa78w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,465,1583222400"; d="scan'208";a="416275758"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga004.jf.intel.com with ESMTP; 02 Jun 2020 11:33:39 -0700
Received: from fmsmsx112.amr.corp.intel.com (10.18.116.6) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 2 Jun 2020 11:33:38 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 FMSMSX112.amr.corp.intel.com (10.18.116.6) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 2 Jun 2020 11:32:36 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (104.47.46.59) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 2 Jun 2020 11:32:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l29uJZy3C/tEAJAXWuAjbRzsJfGy9WA431xCrcd+Ww3NY93fZbAc8gGAoQZbif+lCR27J7J7VUtlOhYa5KwIkiTkhZaC4GI8vVqsjq9F0oga/37NeKT7bgxJGHmRD0pgXk1UHe+PZPT4swwz/SDfnc3ywqwVvE0Xjl0k6h2Y2XyHeeUZipwdVNs/zabsfRWFYfBWE7cQiQtvVQU2t2tG8IE3kjPNkVYz4l8yatkyWWj+ET0+se80e+IaHQw6Q6Q3E4xkgTex4e8ZZ8cxiWoO1VYfCkB+ZC45jSycSJAOHKgfLtLdhZ8a34Ni6Hk4jiug9UGDxlSsB3ZCFlvhpxifFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXvXLkw6mBDm4b9bvvYnhkUqU3Qm8w8HyiwcSQHpW4A=;
 b=J6hfx0lIgrd5CpotRZAy96QbcKjQnO9gGo0vmwzxOTVCaOAkBK2ITA3TpWUEZjWabUWvha3tZhbxCdteUoCrcYzscx88SbLdcjX7U1+D4xHZFoTuNfFyCV5Rwg8qsVpVfwOpNP+s/8zbfED2/AhEgte9U0np1QWqolpw5RNDfWD4MWGMNVvJFbozwYHkiIiS1TxEQLVMtkTptmSs72PjNQN2UOiDOEjKHBk7nd4vkXmgkWygdh0aszxFWqTaEgAJFwuKBvNViVX3HXk3+6hIlkYegHQ24bTc0qwRphhqyj54wzI+uaBXLYWSr59Uc9MMCuRTzpDS1zxJrD9ccPgS7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXvXLkw6mBDm4b9bvvYnhkUqU3Qm8w8HyiwcSQHpW4A=;
 b=Sug8gLZC1tpKXYhsxHiju+hi+TdAQayjPJ4J5/+/Q7HYaDHJsNx+IendrpP8XYhN6b1Gcs3sg4pae2N3AodcEQmRX/Z4jh/Z0CxmX+v5fIfoHaAocKUns+oDLnpYbYoHgenXTmPu64ATv+u/y7wNsMSI4b14tXhAvFeLRDAfO3c=
Received: from MWHPR11MB1389.namprd11.prod.outlook.com (2603:10b6:300:26::12)
 by MWHPR11MB1869.namprd11.prod.outlook.com (2603:10b6:300:108::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Tue, 2 Jun
 2020 18:32:34 +0000
Received: from MWHPR11MB1389.namprd11.prod.outlook.com
 ([fe80::1d03:5032:a4e2:7d66]) by MWHPR11MB1389.namprd11.prod.outlook.com
 ([fe80::1d03:5032:a4e2:7d66%12]) with mapi id 15.20.3045.024; Tue, 2 Jun 2020
 18:32:34 +0000
From: "Khetan, Sharad" <sharad.khetan@intel.com>
To: =?utf-8?B?QWRyaWFuIEFtYnJvxbxld2ljeg==?=
 <adrian.ambrozewicz@linux.intel.com>, Patrick Williams <patrick@stwcx.xyz>
Subject: RE: Upstream Yocto Bringing in GCC 10
Thread-Topic: Upstream Yocto Bringing in GCC 10
Thread-Index: AQHWLG+aVwvp5e+7a0+SbDe8FoyhOKis9/aAgAZRMwCABX/tAIAByuIAgAp/+oCAAKorgA==
Date: Tue, 2 Jun 2020 18:32:34 +0000
Message-ID: <MWHPR11MB1389439BC7F058A120F60D60F18B0@MWHPR11MB1389.namprd11.prod.outlook.com>
References: <9871E71B-5B1F-4172-9F41-454F8C1F644D@gmail.com>
 <20200518000811.GI1166713@heinlein>
 <2E02F120-7D24-48BE-AFD8-9A7ADD0F08E5@gmail.com>
 <7f027233-e0c5-552d-82da-cd3a30d74009@linux.intel.com>
 <20200526155756.GC3445@heinlein>
 <78ffc9e9-816a-c420-2d51-8a635342e3c4@linux.intel.com>
In-Reply-To: <78ffc9e9-816a-c420-2d51-8a635342e3c4@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.2.0.6
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [104.153.203.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dbf41021-df02-4d2e-43c4-08d80723515e
x-ms-traffictypediagnostic: MWHPR11MB1869:
x-microsoft-antispam-prvs: <MWHPR11MB186991999F3EA2A0ECEB576DF18B0@MWHPR11MB1869.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0422860ED4
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bOtAVQF818rWTiQSvlXfrVOAC3ru5rOsJTtQ2jS5r6Fu/ESk7kE7THTiMv5HBEZYuJB5NHbtMtsBTvCvnu45YFGS3fekNDz6kxtVX4FVKKtHeFWPxWZrOedRIaq3hPABsYFX/+pFJcAfVuAzn0+Jsmm4dTB1+WBfYMSQ+IqIC2gu//UDLKKKA6OpGjDuKgefpO7/ba0FajTbG1wplThEJbAJt5DmSz/85bfyYUuvj+4lZ51KbS25n8x7/ItWYQCCdu19YNiVnbCy/fLGkgithwaUD9Hr91/Uum+CK23zYx792ExvLeoj1mI8lU2kAKmRIlVTGZ4luPkJPSMHenb7cA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1389.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(346002)(396003)(39860400002)(376002)(136003)(2906002)(7696005)(8936002)(86362001)(9686003)(5660300002)(316002)(55016002)(83380400001)(8676002)(53546011)(6506007)(33656002)(478600001)(26005)(186003)(76116006)(110136005)(66446008)(66476007)(66556008)(66946007)(66574014)(64756008)(71200400001)(4326008)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 8Sx6MN5MOiwuZbmqMeNjg3pGUba5xFuS1Uuih993xoaDpsZcWCDmKrlsb/KFxG76IsPbV+u+GsO3YO2NFeLLIdXpZM56v8l4RoAiwDwTGIVSf8Bv30IDfaHDxA1Jbqg2U+XvjVNoMZA4nkIwR4W86JnYKGaPW5m1fzOhloXPm/sY9hlyB7sASFdNQXH2/InJ3CXy0dSiVP03e5MMx4W7qUFbx2D1VSDwF0Zuyk7gvL57EA6t5YseHlZCIkXaB9g8b0vxEUgOYh8+7xUjcNLummSbYizfvYl3EVaMYOylsfOEu5Ef+eb5W/NYDuxrJ4ucmCbo8Cl4C3xEKzPeNUT5mpcU2qt5rbn6KzlaQyJiC2+5nx8lYY+49tfmN/zd6SfN16Syfpao+QOX6eg77ZP12LEwqC5JdJoPKLil/+GYgaWBgi2fhejrIrnfo8tvdrI2RyO0va3+pQmhGtjy/A3IBEnz+gBZgLSb7Z0T4CpGZOZN46X5HS+l7/Ola5T8V/dC
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: dbf41021-df02-4d2e-43c4-08d80723515e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2020 18:32:34.2057 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ExcjatlNTHBULBPv8OHJxoJRy7NqFnREtiSeRa7k1UqNl/KKEPEUPM6wq/fRC6ZeDawWuWEQ2ybzIAFZBYfHiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1869
X-OriginatorOrg: intel.com
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBvcGVuYm1jIDxvcGVuYm1jLWJv
dW5jZXMrc2hhcmFkLmtoZXRhbj1pbnRlbC5jb21AbGlzdHMub3psYWJzLm9yZz4gT24gQmVoYWxm
IE9mIEFkcmlhbiBBbWJyb3pld2ljeg0KU2VudDogVHVlc2RheSwgSnVuZSAwMiwgMjAyMCAxOjE5
IEFNDQpUbzogUGF0cmljayBXaWxsaWFtcyA8cGF0cmlja0BzdHdjeC54eXo+DQpDYzogT3BlbkJN
QyBNYWlsbGlzdCA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0KU3ViamVjdDogUmU6IFVwc3Ry
ZWFtIFlvY3RvIEJyaW5naW5nIGluIEdDQyAxMA0KDQoNCg0KVyBkbml1IDUvMjYvMjAyMCBvwqAx
Nzo1NywgUGF0cmljayBXaWxsaWFtcyBwaXN6ZToNCj4gT24gTW9uLCBNYXkgMjUsIDIwMjAgYXQg
MDI6MzU6MzJQTSArMDIwMCwgQWRyaWFuIEFtYnJvxbxld2ljeiB3cm90ZToNCj4+PiBPbiBNYXkg
MTcsIDIwMjAsIGF0IDc6MDggUE0sIFBhdHJpY2sgV2lsbGlhbXMgPHBhdHJpY2tAc3R3Y3gueHl6
PiB3cm90ZToNCj4+PiBBbHJpZ2h0ISAgVGhlIGdyZWF0IHRoaW5nIGFib3V0IEdDQyAxMC54IGlz
IHRoYXQgaXQgYnJpbmdzIGluIA0KPj4+IHN1cHBvcnQgZm9yIG1vc3Qgb2YgQysrMjAsIGluY2x1
ZGluZyBjby1yb3V0aW5lcy4gIExvb2tpbmcgZm9yd2FyZCANCj4+PiB0byBwbGF5aW5nIGFyb3Vu
ZCB3aXRoIGl0Lg0KPj4gSXMgaXQgYWxsb3dlZCBpbiBPcGVuQk1DIHRvIGJhc2UgdGhlIGZ1bmN0
aW9uYWxpdHkgb24gZXhwZXJpbWVudGFsIA0KPj4gaW1wbGVtZW50YXRpb25zPw0KPiANCj4gTm8g
ZGlzYWdyZWVtZW50IHdpdGggaG93IEJyYWQgcmVzcG9uZGVkIHRvIHRoaXMuICBJbiB0aGUgcGFz
dCB3ZSd2ZSANCj4gYmVlbiBwcmV0dHkgcHJvbXB0IGF0IG1vdmluZyB1cCB0byB0aGUgbmV3IEMr
KyBzdGFuZGFyZHMuDQo+IA0KPiBJIGFtIGN1cmlvdXMgd2hhdCB5b3UgbWVhbnQgYnkgImV4cGVy
aW1lbnRhbCBpbXBsZW1lbnRhdGlvbnMiIGhlcmUgDQo+IHRob3VnaC4gIFVzdWFsbHkgdGhlIEMr
KyBzdGFuZGFyZHMgY29tbWl0dGVlIGhhcyBwdXQgdGhpbmdzIGluIHRoZSANCj4gJ3N0ZDo6ZXhw
ZXJpbWVudGFsJyBuYW1lc3BhY2Ugd2hlbiB0aGV5IGFyZSBzbyBhbmQgdGhlIG5vcm1hbCAnc3Rk
JyBpcyANCj4gbm9uLWV4cGVyaW1lbnRhbC4gIFRoaXMgbWVhbnMgY29kZSB1c2luZyAnc3RkJyBB
UElzIHNob3VsZCBjb250aW51ZSB0byANCj4gd29yayBnb2luZyBmb3J3YXJkLCBidXQgY29kZSB1
c2luZyAnc3RkOjpleHBlcmltZW50YWwnIG1pZ2h0IG5vdC4NCj4gDQo+IFRoZSBzcGVjaWZpYyBl
eGFtcGxlIEkgbWVudGlvbmVkIGhlcmUgb2YgY29yb3V0aW5lcyBpcyBvdXQgb2YgDQo+IHN0ZDo6
ZXhwZXJpbWVudGFsIGFzIG9mIEMrKzIwLiAgVGhlIGNvbXBpbGVyIHdyaXRlcnMgaGF2ZSBiZWVu
IHNsb3cgdG8gDQo+IGdldCBpdCBpbXBsZW1lbnRlZCBiZWNhdXNlIGl0IGlzIGEgY29tcGxpY2F0
ZWQgZmVhdHVyZS4gIFNvLCBJIGd1ZXNzIA0KPiB5b3UgY291bGQgY29uc2lkZXIgdGhlIGZyZXNo
IGltcGxlbWVudGF0aW9uIGF0IHRoZSBjb21waWxlciBsZXZlbCBhcyANCj4gImV4cGVyaW1lbnRh
bCIgYnV0IHRoZSBsYW5ndWFnZSAvIGxpYnJhcnkgZmVhdHVyZXMgdGhlbXNlbHZlcyBhcmUgbm90
Pw0KPiANCj5TdXJlLCB3ZSBjYW4gZGlzdGluZ3Vpc2ggJ2V4cGVyaW1lbnRhbCcgcGFydCBpbiB0
d28gcGFydHM6DQotIEFQSXMgKG5vdCB5ZXQgc3RhbmRhcml6ZWQpLA0KLSBpbXBsZW1lbnRhdGlv
bnMgKG1hcmtlZCBieSBjb21waWxlciBkZXZlbG9wbWVudCB0ZWFtIGFzIGV4cGVyaW1lbnRhbCku
DQoNCj5JJ3ZlIG1lYW50IHRoZSBsYXR0ZXIuIEluIG90aGVyIHdvcmRzIC0gaXMgaXQgZ29vZCB0
byBiZSBlYXJseSBhZG9wdGVyIG9mIHNvbWUgY29vbCBuZXcgZmVhdHVyZXMsIG5vdCB5ZXQgd2lk
ZWx5IHRlc3RlZCBpbiB0aGUgZmllbGQuIExpa2UgeW91J3ZlIHNhaWQgLSBjb3JvdXRpbmVzIGFy
ZSBxdWl0ZSBjb21wbGljYXRlZCBmZWF0dXJlIGFuZCB0cnVzdGluZyBlYXJseSBpbXBsZW1lbnRh
dGlvbnMgbWlnaHQgY29tZSB3aXRoIGEgcmlzay4NCg0KPkkgY2FuIGltYWdpbmUgc29tZSBjb21w
YW5pZXMgb3IgY29tbXVuaXRpZXMgbWlnaHQgY2hvb3NlIHRvIGJlIGNhcmVmdWwgaW4gdGhhdCBt
YXR0ZXIuIEkgd2FzIGp1c3Qgd29uZGVyaW5nIGlmIHRoZXJlIGlzIHNvbWUgJ0JLTScgd2hpY2gg
c3RhdGVzICdleHBlcmltZW50YWwgKHVuc3RhYmxlPykgaW1wbGVtZW50YXRpb25zIGFyZSBwcm9o
aWJpdGVkIGZyb20gdXNlIHVudGlsIG1hcmtlZCBieSBzb2Z0d2FyZSB2ZW5kb3IgYXMgc3RhYmxl
Jy4gTWF5YmUgdGhhdCdzIG15IHByb2JsZW0gLSBJIGNvdWxkIGJlIGNvbmZ1c2luZyAnZXhwZXJp
bWVudGFsJyB3aXRoICd1bnN0YWJsZScgYWZ0ZXIgYWxsOikNCg0KSWYgZXhwZXJpbWVudGFsIG1l
YW5zIHBvdGVudGlhbGx5IHVuc3RhYmxlLCBJIHdvdWxkIHNheSB3ZSBhdm9pZCBzdWNoIGltcGxl
bWVudGF0aW9uIGluIHRoZSBPcGVuQk1DLiBXZSBuZWVkIHRvIGtlZXAgT3BlbkJNQyBzdGFibGUg
YW5kIHN1Y2ggbmV3IGxhbmd1YWdlIC8gY29tcGlsZXIgZmVhdHVyZXMgbWF5IGJlIHByZXR0eSBn
bmFybHkgdG8gZGVidWcgYnkgdGhlIHVzZXJzLg0KIA0KVGhhbmtzLA0KLVNoYXJhZA0K
