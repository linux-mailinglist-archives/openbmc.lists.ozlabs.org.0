Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D4B29CCEB
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 02:33:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLWLj5RBSzDqWF
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 12:33:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.137;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=billy_tsai@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320137.outbound.protection.outlook.com [40.107.132.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKJ6K0DM8zDqLw;
 Mon, 26 Oct 2020 13:03:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ORdGdXMi/flh3tax8GXWXAI/j/swTOGcZEO0wgxaw9viMfxlK4Qb257qTz7+YyzmxGd/wIEyjelQnCPkk/W4PHReapAIvngUuKzb2XvEYOe/guYG6X/qqABCsuqF6OFXPgaFIuiI6FNyC0/VKMgnhShcM+rh6I4V74uO7k8XDDQJ+O2rpRT7bxUCNXVwymgjINbZjFrfFnT2ePmnvXpaSRC9bBOR2W2k3H2XhjBrxIMBqoEKi6w5KmpgU97eLYI7TyKr3pV/rPVBBY2uUG/SMog1z2JTy9xpoHFtFeM4kZvbMwmjbkbLI7JX/D/JcaIW1ZFO5lMd8fe6pRBNUdOazw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egeN6bcqwFGRQA8Tmu5BjN2edHV8B1hJYbhug/8wGTo=;
 b=CmkEh5u7K8rDAvurFwrWAClXmibhMOC6ZzsTemWn+JNBI9AcGc+oKwimHaW9ANQ+3sG8MY60ZJnYX1lSBqkh0cuZBMYkOfkYF6O8yty4ocjwj9RvANRbBgpfp5RkZbbJJBS+v57ngKhkGdPm8B9g4uXOsi9/20svp+COis4IQwy3Pml4VeArCsNZyyQZ5My8PbTcLPffqAoqGzBwLrm+AYJ4+GfH4/QXO5NlgYNTXeDzkldIFVu1JEDOvPOsJ3kvBk+vW9AgU+T3apVs9Jn7jB8Up8Yuz9mWEWyBf92uZlR5M4dlzbIH2ig1YXmLa9jwpZdwzuzpO7tVmfmPN3awjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from PU1PR06MB2167.apcprd06.prod.outlook.com (2603:1096:803:39::19)
 by PSAPR06MB4056.apcprd06.prod.outlook.com (2603:1096:301:3f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Mon, 26 Oct
 2020 02:03:37 +0000
Received: from PU1PR06MB2167.apcprd06.prod.outlook.com
 ([fe80::8956:6160:b5b8:a5dc]) by PU1PR06MB2167.apcprd06.prod.outlook.com
 ([fe80::8956:6160:b5b8:a5dc%3]) with mapi id 15.20.3477.028; Mon, 26 Oct 2020
 02:03:37 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, "linux-gpio@vger.kernel.org"
 <linux-gpio@vger.kernel.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH 3/3] pinctrl: aspeed-g6: Add sgpiom2 pinctrl setting
Thread-Topic: [PATCH 3/3] pinctrl: aspeed-g6: Add sgpiom2 pinctrl setting
Thread-Index: AQHWoEhCUTHp0rj6MUiaDCllZEIrrqmpLaKAgACQWIA=
Date: Mon, 26 Oct 2020 02:03:37 +0000
Message-ID: <82A00921-93ED-42A8-9B93-8F1E8025BA89@aspeedtech.com>
References: <20201012033150.21056-1-billy_tsai@aspeedtech.com>
 <20201012033150.21056-4-billy_tsai@aspeedtech.com>
 <ce3dce98-1daa-47bb-a688-0d5a743e45b2@www.fastmail.com>
In-Reply-To: <ce3dce98-1daa-47bb-a688-0d5a743e45b2@www.fastmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 305f455c-27e8-4f0f-04d6-08d879535a4d
x-ms-traffictypediagnostic: PSAPR06MB4056:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PSAPR06MB40562223F4F1E0F7A94F75B58B190@PSAPR06MB4056.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N6nrQeTa+Nz+VcroSFv1X5VjO2jiUYPV4tGebMhRXSgBbz2d0WPDtb3p39aMp/NJUB5XyIbvbxzZLbsCBiRGhdlc/hYFo7pGzlCdj7QfU1NTbNk8fSWl07oipvbGFcGpEr/Jd56GP6ok75CwfqpO+r8aNnpE/J/cQVA30twfdoi39693+o69syx2Kigq7Yf8IPudYMsqnUoACI6md4whK+m91MmpGv9iAfckC8CQdDbKQAV4Jt0qpCTOi0BfN5PuEnuF05zDpkT8Q8s9cYQA9OYmB7zDX9hSgZ+qwyk9OfR85b5SiHfjw3umOYnQs1oelUSARpmQh9jJLdno4fc++OBFvcGJW4eVtAhNvMG3bUuz0ICBRyBhoSj/Tv3FP3eD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PU1PR06MB2167.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(136003)(39830400003)(396003)(346002)(8936002)(8676002)(2906002)(6486002)(64756008)(83380400001)(33656002)(86362001)(110136005)(478600001)(55236004)(71200400001)(4326008)(186003)(316002)(26005)(36756003)(6512007)(66556008)(66446008)(66946007)(76116006)(66476007)(91956017)(6506007)(5660300002)(107886003)(7416002)(2616005)(921003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: muV2BZljPxs9EcWwD2glU3ecIoDcwfhXqqpT/oiUUORUXThKrWoGe8ri1buf/JixCeP1l1xvueqgSVQJDOuYbdCE1f933/Cdon9MmkOa2mPC+p/ywanI2iz4mMjztyWBT6ROOOCGWOKdAiaqNKBhEPs4LC6D2e00PLKqpqDpA1Jv+LnZKCdX+bKyVjScWfC9ogGhjxFQXztsrvDbcr8gWTlgq7poJJglw4t/1zb3KJG6p24T65QPzI2Xy76mVxBYvDUW1W6ef0AWFfE+JS6GUAIwauZDQ53dQytcoKdbFmfJ6C3Vrk8skkTYPYLrPYv/Tzb0OMerp7h5zobgiqAejnsofTNezdmcz/kjLUKYWkrq86FD6zwzU2MDNlyS479QBawRb2dWV7hS869i9TwFTfy3jWKykHbt9lxHiTw5l+m3LeZ5VrCEQR/bfYnOsYEOvfGRSbpph+XpikKhREit12iD0M9U2PiayPyIJqxDqZttBxoPt10RYjOa0+ZDTw0Slne7kOY4O0P0eJbEimVjtZ3OryJqRKyFaiZdhZ7Y26DiGbBAVCD5f/xQV71zF4Io6IQa9W4CGCiRF6SKI3e5iaN/rpiUS9J6+1Q5obCIArQ/h1rxMoOPmwt1c0uR0HH/0zlpA7UU9rYQNOwH1okotA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <12F1A94DBA760D448D310BB6E29BC633@apcprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PU1PR06MB2167.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 305f455c-27e8-4f0f-04d6-08d879535a4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2020 02:03:37.5579 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 18APAXTyfWB24ScJVKzJyY5UQhzqkl9SEseFveX53byuNnIHsY2U/TUvMwVernAqET8+evx9dR3FcsFtFIgrIMqXkV4yWsvm7MGu9NXNpig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4056
X-Mailman-Approved-At: Wed, 28 Oct 2020 12:30:19 +1100
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQrvu79PbiAyMDIwLzEwLzI2LCA5OjI3IEFNLCBBbmRyZXcgSmVmZmVyeSB3cm90ZToNCiAgICAN
CiAgICBPbiBNb24sIDEyIE9jdCAyMDIwLCBhdCAxNDowMSwgQmlsbHkgVHNhaSB3cm90ZToNCiAg
ICA+ID4gQXQgYXN0MjYwMGExIHdlIGNoYW5nZSBmZWF0dXJlIG9mIG1hc3RlciBzZ3BpbyB0byAy
IHNldHMuDQogICAgPiA+IFNvIHRoaXMgcGF0Y2ggaXMgdXNlZCB0byBhZGQgdGhlIHBpbmN0cmwg
c2V0dGluZyBvZiB0aGUgbmV3IHNncGlvLg0KICAgID4gPiANCiAgICA+ID4gU2lnbmVkLW9mZi1i
eTogQmlsbHkgVHNhaSA8YmlsbHlfdHNhaUBhc3BlZWR0ZWNoLmNvbT4NCiAgICA+ID4gLS0tDQog
ICAgPiA+ICBhcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzYtcGluY3RybC5kdHNpICAgfCAgNSAr
KysrDQogICAgPiA+ICBkcml2ZXJzL3BpbmN0cmwvYXNwZWVkL3BpbmN0cmwtYXNwZWVkLWc2LmMg
fCAzMCArKysrKysrKysrKysrKysrKysrLS0tDQogICAgPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDMx
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQogICAgPiA+IA0KICAgID4gPiBkaWZmIC0t
Z2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc2LXBpbmN0cmwuZHRzaSANCiAgICA+ID4g
Yi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzYtcGluY3RybC5kdHNpDQogICAgPiA+IGluZGV4
IDcwMjhlMjFiZGQ5OC4uYTE2ZWNmMDhlMzA3IDEwMDY0NA0KICAgID4gPiAtLS0gYS9hcmNoL2Fy
bS9ib290L2R0cy9hc3BlZWQtZzYtcGluY3RybC5kdHNpDQogICAgPiA+ICsrKyBiL2FyY2gvYXJt
L2Jvb3QvZHRzL2FzcGVlZC1nNi1waW5jdHJsLmR0c2kNCiAgICA+ID4gQEAgLTg2Miw2ICs4NjIs
MTEgQEANCiAgICA+ID4gIAkJZ3JvdXBzID0gIlNHUE0xIjsNCiAgICA+ID4gIAl9Ow0KICAgID4g
PiAgDQogICAgPiA+ICsJcGluY3RybF9zZ3BtMl9kZWZhdWx0OiBzZ3BtMl9kZWZhdWx0IHsNCiAg
ICA+ID4gKwkJZnVuY3Rpb24gPSAiU0dQTTIiOw0KICAgID4gPiArCQlncm91cHMgPSAiU0dQTTIi
Ow0KICAgID4gPiArCX07DQogICAgPiA+ICsNCiAgICA+ID4gIAlwaW5jdHJsX3NncHMxX2RlZmF1
bHQ6IHNncHMxX2RlZmF1bHQgew0KICAgID4gPiAgCQlmdW5jdGlvbiA9ICJTR1BTMSI7DQogICAg
PiA+ICAJCWdyb3VwcyA9ICJTR1BTMSI7DQogICAgPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Bp
bmN0cmwvYXNwZWVkL3BpbmN0cmwtYXNwZWVkLWc2LmMgDQogICAgPiA+IGIvZHJpdmVycy9waW5j
dHJsL2FzcGVlZC9waW5jdHJsLWFzcGVlZC1nNi5jDQogICAgPiA+IGluZGV4IDM0ODAzYTZjNzY2
NC4uYjY3M2E0NGZmYTNiIDEwMDY0NA0KICAgID4gPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvYXNw
ZWVkL3BpbmN0cmwtYXNwZWVkLWc2LmMNCiAgICA+ID4gKysrIGIvZHJpdmVycy9waW5jdHJsL2Fz
cGVlZC9waW5jdHJsLWFzcGVlZC1nNi5jDQogICAgPiA+IEBAIC00Niw4ICs0NiwxMCBAQA0KICAg
ID4gPiAgI2RlZmluZSBTQ1U2MjAJCTB4NjIwIC8qIERpc2FibGUgR1BJTyBJbnRlcm5hbCBQdWxs
LURvd24gIzQgKi8NCiAgICA+ID4gICNkZWZpbmUgU0NVNjM0CQkweDYzNCAvKiBEaXNhYmxlIEdQ
SU8gSW50ZXJuYWwgUHVsbC1Eb3duICM1ICovDQogICAgPiA+ICAjZGVmaW5lIFNDVTYzOAkJMHg2
MzggLyogRGlzYWJsZSBHUElPIEludGVybmFsIFB1bGwtRG93biAjNiAqLw0KICAgID4gPiArI2Rl
ZmluZSBTQ1U2OTAJCTB4NjkwIC8qIE11bHRpLWZ1bmN0aW9uIFBpbiBDb250cm9sICMyNCAqLw0K
ICAgID4gPiAgI2RlZmluZSBTQ1U2OTQJCTB4Njk0IC8qIE11bHRpLWZ1bmN0aW9uIFBpbiBDb250
cm9sICMyNSAqLw0KICAgID4gPiAgI2RlZmluZSBTQ1U2OUMJCTB4NjlDIC8qIE11bHRpLWZ1bmN0
aW9uIFBpbiBDb250cm9sICMyNyAqLw0KICAgID4gPiArI2RlZmluZSBTQ1U2RDAJCTB4NkQwIC8q
IE11bHRpLWZ1bmN0aW9uIFBpbiBDb250cm9sICMyOCAqLw0KICAgID4gPiAgI2RlZmluZSBTQ1VD
MjAJCTB4QzIwIC8qIFBDSUUgY29uZmlndXJhdGlvbiBTZXR0aW5nIENvbnRyb2wgKi8NCiAgICA+
ID4gIA0KICAgID4gPiAgI2RlZmluZSBBU1BFRURfRzZfTlJfUElOUyAyNTYNCiAgICA+ID4gQEAg
LTgxLDEzICs4MywyMSBAQCBGVU5DX0dST1VQX0RFQ0woSTJDMTIsIEwyNiwgSzI0KTsNCiAgICA+
ID4gICNkZWZpbmUgSzI2IDQNCiAgICA+ID4gIFNJR19FWFBSX0xJU1RfREVDTF9TRVNHKEsyNiwg
TUFDTElOSzEsIE1BQ0xJTksxLCBTSUdfREVTQ19TRVQoU0NVNDEwLCA0KSk7DQogICAgPiA+ICBT
SUdfRVhQUl9MSVNUX0RFQ0xfU0VTRyhLMjYsIFNDTDEzLCBJMkMxMywgU0lHX0RFU0NfU0VUKFND
VTRCMCwgNCkpOw0KICAgID4gPiAtUElOX0RFQ0xfMihLMjYsIEdQSU9BNCwgTUFDTElOSzEsIFND
TDEzKTsNCiAgICA+ID4gKy8qU0dQTTIgaXMgQTEgT25seSAqLw0KICAgID4gPiArU0lHX0VYUFJf
TElTVF9ERUNMX1NFU0coSzI2LCBTR1BNMkNMSywgU0dQTTIsIFNJR19ERVNDX1NFVChTQ1U2RDAs
IDQpLA0KICAgID4gPiArCQkJICBTSUdfREVTQ19DTEVBUihTQ1U0MTAsIDQpLCBTSUdfREVTQ19D
TEVBUihTQ1U0QjAsIDQpLA0KICAgID4gPiArCQkJICBTSUdfREVTQ19DTEVBUihTQ1U2OTAsIDQp
KTsNCiAgICA+ID4gK1BJTl9ERUNMXzMoSzI2LCBHUElPQTQsIFNHUE0yQ0xLLCBNQUNMSU5LMSwg
U0NMMTMpOw0KICAgID4gPiAgRlVOQ19HUk9VUF9ERUNMKE1BQ0xJTksxLCBLMjYpOw0KICAgID4g
PiAgDQogICAgPiA+ICAjZGVmaW5lIEwyNCA1DQogICAgPiA+ICBTSUdfRVhQUl9MSVNUX0RFQ0xf
U0VTRyhMMjQsIE1BQ0xJTksyLCBNQUNMSU5LMiwgU0lHX0RFU0NfU0VUKFNDVTQxMCwgNSkpOw0K
ICAgID4gPiAgU0lHX0VYUFJfTElTVF9ERUNMX1NFU0coTDI0LCBTREExMywgSTJDMTMsIFNJR19E
RVNDX1NFVChTQ1U0QjAsIDUpKTsNCiAgICA+ID4gLVBJTl9ERUNMXzIoTDI0LCBHUElPQTUsIE1B
Q0xJTksyLCBTREExMyk7DQogICAgPiA+ICsvKlNHUE0yIGlzIEExIE9ubHkgKi8NCiAgICA+ID4g
K1NJR19FWFBSX0xJU1RfREVDTF9TRVNHKEwyNCwgU0dQTTJMRCwgU0dQTTIsIFNJR19ERVNDX1NF
VChTQ1U2RDAsIDUpLA0KICAgID4gPiArCQkJICBTSUdfREVTQ19DTEVBUihTQ1U0MTAsIDUpLCBT
SUdfREVTQ19DTEVBUihTQ1U0QjAsIDUpLA0KICAgID4gPiArCQkJICBTSUdfREVTQ19DTEVBUihT
Q1U2OTAsIDUpKTsNCiAgICA+IA0KICAgID4gQSBmZXcgdGhpbmdzOg0KICAgID4gDQogICAgPiAx
LiBJdCBsb29rcyBsaWtlIHRoZSBNdWx0aS1mdW5jdGlvbiBQaW5zIE1hcHBpbmcgYW5kIENvbnRy
b2wgdGFibGUgaW4gc2VjdGlvbiA1LjEgb2YgdGhlIGRhdGFzaGVldCBvbmx5IHRlbGxzIHBhcnQg
b2YgdGhlIHN0b3J5LiBJdCBsaXN0cyBTR1BTMiBvbiB0aGUgcGlucyB5b3UndmUgbW9kaWZpZWQg
aW4gdGhpcyBwYXRjaCBidXQgbm90IFNHUE0yLiBIb3dldmVyLCB0aGUgdGFibGUgaW4gc2VjdGlv
biAyLjEgKFBpbiBEZXNjcmlwdGlvbikgZG9lcyBvdXRsaW5lIFNHUE0yIGFuZCBTR1BTMiBhcmUg
cm91dGVkIHZpYSB0aGUgc2FtZSBwaW5zLCB0aG91Z2ggdGhpcyBkb2VzIG5vdCBsaXN0ZWQgdGhl
IGFzc29jaWF0ZWQgcmVnaXN0ZXJzIGFuZCBiaXQgZmllbGRzLiBDYW4gd2UgZml4IHRoZSB0YWJs
ZSBpbiA1LjEgc28gaXQncyBlYXNpZXIgdG8gcmV2aWV3IHRoaXMgcGF0Y2g/DQpZb3UgY2FuIHNl
ZSBzZWN0aW9uIDUuMiB0byBmaW5kIFNHUElPIG1hc3RlciBpbnRlcmZhY2UgdGFibGUuIEl0IGxp
c3RzIGJhbGxzIGFuZCByZWdpc3RlciBzZXR0aW5nIGluZm9ybWF0aW9uIG9mIHRoZSBTR1BJT00x
IGFuZCBTR1BJT00yLg0KICAgID4gDQogICAgPiAyLiBXZSBkb24ndCBuZWVkIHRvIHNwZWNpZnkg
dGhlIF9DTEVBUigpIGJlaGF2aW91ciBoZXJlIGFzIHRoaXMgaXMgaW1wbGllZCBieSB0aGUgcHJv
Y2VzcyB0byBkaXNhYmxlIHRoZSBoaWdoZXIgcHJpb3JpdHkgbXV4IGNvbmZpZ3VyYXRpb25zLiBJ
dCBzaG91bGQgYmUgZW5vdWdoIHRvIGRvOg0KICAgID4gDQogICAgPiBTSUdfRVhQUl9MSVNUX0RF
Q0xfU0VTRyhMMjQsIFNHUE0yTEQsIFNHUE0yLCBTSUdfREVTQ19TRVQoU0NVNkQwLCA1KSk7DQog
ICAgPiANCiAgICA+IEhvd2V2ZXIsIHRoaXMgcmVxdWlyZXMgdGhhdCB3ZSBhbHNvIGRlZmluZSB0
aGUgcHJpb3JpdGllcyBjb3JyZWN0bHksIHNvOg0KICAgID4gDQogICAgPiAzLiBDYW4gd2UgYWRk
IGJvdGggdGhlIFNHUFMyIGFuZCBTR1BNMiBjb25maWd1cmF0aW9ucyBzbyB3ZSBoYXZlIGEgY29t
cGxldGUgZGVmaW5pdGlvbiBmb3IgdGhlIHBpbnM/DQogICAgPiANClRoYW5rIHlvdSBmb3IgeW91
ciBhZHZpY2UuIEkgd2lsbCBjb21wbGV0ZSB0aGUgZnVsbCBjb25maWd1cmF0aW9ucyBhbmQgc2Vu
ZCB0aGUgVjIgcGF0Y2guDQogICAgPiBDaGVlcnMsDQogICAgPiANCiAgICA+IEFuZHJldw0KDQpC
ZXN0IFJlZ2FyZHMsDQpCaWxseSBUc2FpDQoNCg==
