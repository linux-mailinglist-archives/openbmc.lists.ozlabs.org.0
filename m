Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DCA2E1545
	for <lists+openbmc@lfdr.de>; Wed, 23 Dec 2020 03:55:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0yVY6VvQzDqLn
	for <lists+openbmc@lfdr.de>; Wed, 23 Dec 2020 13:55:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.139;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320139.outbound.protection.outlook.com [40.107.132.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0yTC1cplzDqNm;
 Wed, 23 Dec 2020 13:53:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHvLoe42KLDKORJLYEBN5h331MDauaDs0W8NNvodLnQNQTFKw+4/0Vlb6wtlCjxZxPhuKGpek2oROejhXjTp9LqGX9atPSUw2x2hsgLSGClkrgqJ/ZrnODrPDnltjr491Nf05lfd9sNNMI3b0AlUIhX1c4d61rT3EecyFJR9NFYbncRPvAv07cX/JEqPDMWmpcetMz+JxAyU3qhnnTA8f/V4joT62rQLVOOAyvN8fHcIpd6ylSgiN+Ql+H/I+f3JSqFosjJmI0s3k9HSjA3oPYpo6tzoc5+PEJbjxw+fAodJ20+YKJNEiOxVTSCiEXaljScstiwke4MzUuADSiRR3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3XUryfeBTbwswIYaPLLPAI61M7IESWWlMnzZa4JArUA=;
 b=HKBni15tlCM1kXVMPAud3GSv9242I985UuPI5cdJ+jbgJDg2VF9BtluzuPnCnMmyd/apFe4aSseT7GZfBNAwxNLGkRbDt6BwF3Y/Zg8gRwjZHKVUrDF+KGVvUZXW07ZGpj3clJkKo1d1MI04id6KGBnEmqV7R5eeOW7grN8YdR6tPhub2cW/KFtbExbnvmnwfK2bkZ8bNJJOFYRflN2ynGRc1w0kEE1hJqvx6sCUg3E8MbRAt3RiA1XWXy5iptmWXSPH6CXxd7LkZE4vMZCnjAf9jpD/upzvuo4Fe27v1j0nmQ5hdGUsQNdussxizvn0et1qoHH/LcVHIAvaGBaJhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com (2603:1096:203:82::18)
 by HK0PR06MB2916.apcprd06.prod.outlook.com (2603:1096:203:66::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Wed, 23 Dec
 2020 02:53:33 +0000
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::59b4:743d:1470:306f]) by HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::59b4:743d:1470:306f%7]) with mapi id 15.20.3676.033; Wed, 23 Dec 2020
 02:53:33 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>, Zev Weiss <zev@bewilderbeest.net>
Subject: RE: [PATCH 2/3] aspeed-video: clear spurious interrupt bits
 unconditionally
Thread-Topic: [PATCH 2/3] aspeed-video: clear spurious interrupt bits
 unconditionally
Thread-Index: AQHW0o5SCt/jQG9HJ0aOoNGkwIAV56oClgeAgADyOICAAGKHAIAAG/Ig
Date: Wed, 23 Dec 2020 02:53:33 +0000
Message-ID: <HK0PR06MB338018668005D679C51EF69AF2DE0@HK0PR06MB3380.apcprd06.prod.outlook.com>
References: <20201215024542.18888-1-zev@bewilderbeest.net>
 <20201215024542.18888-3-zev@bewilderbeest.net>
 <CACPK8XczCUgqOENABoDbc-qwbMxOh=1OUyBtuHSmDG_Zo571Wg@mail.gmail.com>
 <20201222191433.3dgnfwyrod4tnvaf@hatter.bewilderbeest.net>
 <CACPK8XeOZEkpAKcyhZLeMdGzbwtFmdGEnL6QXp0VK1HL_O2pSg@mail.gmail.com>
In-Reply-To: <CACPK8XeOZEkpAKcyhZLeMdGzbwtFmdGEnL6QXp0VK1HL_O2pSg@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b11aa684-af89-41f1-1433-08d8a6edefcb
x-ms-traffictypediagnostic: HK0PR06MB2916:
x-microsoft-antispam-prvs: <HK0PR06MB291604D4A530E99D7972C2BAF2DE0@HK0PR06MB2916.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +rLPD5J85P913GMCRKN2gQ7F15gmPWwlk4FdEwhBzTCxkZ29lDZi7344vztIw4WSJyvhfaExM0IFlP6JgSuU1KDdqksta3Y3LNeatjmwg42fUPwermRrNndgBFhv+gDUvqFiGlSTy5wlO9Bman1RyH32mOEm5gBjpZ5O+NnX5Zh72UpqLb43Hm5Ooehgd3VvxZzCCKnbXHIDM6/z3iywwkVhsdLyjDZwbL7YGP5KKdNOzZAWqbwp9hXBJKEzkvkPEhRsVBb3b0/a3YF9IX3t/Pj1Y83W88EBGHi70mW/TEKKMSvENb/iEr28DxIi4zeVGDl8rH+tJ5lXTKHBm099phCzoq4Q8RXYBaanI2SUWEnIwcH5DeUNApd3CcqHD7K8HZHLSE8ZfTMYWGklnWLMxA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3380.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(346002)(366004)(39840400004)(396003)(6506007)(54906003)(76116006)(53546011)(110136005)(9686003)(2906002)(86362001)(316002)(83380400001)(66446008)(66476007)(8936002)(55016002)(66556008)(66946007)(64756008)(7696005)(52536014)(8676002)(33656002)(5660300002)(7416002)(4326008)(55236004)(71200400001)(26005)(186003)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Vmc0WUE3ZFhoZjFaT1IvRm53czJnY0gxM1pDS1BCMVQ1S1U0VXBweGJwRW5i?=
 =?utf-8?B?YXJlWkVpbUJ2OXFxRlBLMVRZVnF3Qm44WlVqWm84czJmSm15T2F6Ty82clVT?=
 =?utf-8?B?QkkvNzlqdDd0UVE0ZVNTdUxoSlVqazhjeitYUkVMZ1plTDBaN2JIc0dnaHcx?=
 =?utf-8?B?ZnFpRDVBSGRUc1hlZ3NQdmExL3RvMytvWFZTd2VEWXNWTmZhTzB6VURMZHk2?=
 =?utf-8?B?STJLM3BXV3V1MVEvYTkzTmJPOFBGbm5SYnBnL3RBU3hSbzc4RDVuSUp3eDhC?=
 =?utf-8?B?OTRJbmZ0RTRaL3NnQ0FlSW1jMG52MlA3eVVmdlk3RDN0NWtoZVE2eXdTRm5T?=
 =?utf-8?B?M0NCamJoWlErVXN3NVdlUlhhYXl3MEpJcWlMQ1REODc2aUNwU29wdjBROHJ4?=
 =?utf-8?B?U3lJaGVvbUdhZEhzamd2MkF0L0JGZzVibGIzcDlRbnU0cUh1aDRsQ2t4cUg0?=
 =?utf-8?B?aUN1SUp3Qno1VER2SXUwbFRpQ1VDc3JCemFEek1ZYXpUWWkxQ3JyTGxydlBq?=
 =?utf-8?B?RzFLV2xmSmFOcnV6anROekIwdzdubkw0VVFObVJMYkNJNENxWm5UOVV0Ykhj?=
 =?utf-8?B?V0hZU09nTUVMY1VKaTZ5YjhvTGFTaVlXbDNacGZNZDBGRS9WV3hhWWkrR2xF?=
 =?utf-8?B?YmR0UW5JSzBDSVhIRFhaSDRCZi9DY282aEJLVkRXQmQ2dld0MlJRbVozNUFI?=
 =?utf-8?B?UWdIUXdCL3haUmhHUldXdDdmQzg2dEMxTlBNc0Q5TENqVVFDKzQ5WU96cllk?=
 =?utf-8?B?THlkRVNpMHFJSXZldU5vSzZyQmxsdVlDRU1WdDllT0FPd0lXS3hkc0RBMU0r?=
 =?utf-8?B?SDd0aDY2UG8vZ3k4UkhkbFRGaHJnSDlnSGVJTW1mb3hLSnZrMlJDcWRuNlhE?=
 =?utf-8?B?TStWcmdDNjlzYWlKVlQyQzJONUJ6bW12cG4vWGhNK1Z6L3NVVGJHVGhyMzdD?=
 =?utf-8?B?OU1aQ2QxdHNBZzBUektDdmM3Z25VNXRjK1RrM0dINWtXRGhRNm1iS0xCZmpo?=
 =?utf-8?B?S0tuT211OEwvcDlKbXU5a0EzcGkyK1RRUnNkV0ZaWkZZeG1IdHJFZWRSVkJW?=
 =?utf-8?B?TkNvUDkxRmUxSTduSnNidWNzU1NUOHBadEcwY0kycnpZeldvcjRhYkV1Y2Ft?=
 =?utf-8?B?aDRpTEhUUVpVdVlSNEJNTUVzdlZYWDczUVdxQTUwVHJEZ1FkWFhlQTEvb2Nz?=
 =?utf-8?B?MkhVdkZjYndaR1F1NitZZ0ZjcXR1cU5pOGFBeVpsMHhUWWFqdU8zUTRVM0lO?=
 =?utf-8?B?MWwyQlF6VEtrcWorcnAwWjdMUEJGUzBTZFVWUWFva2hyMFRyMDlDV0hncXRM?=
 =?utf-8?Q?iKUK0lKQUHXPk=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3380.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b11aa684-af89-41f1-1433-08d8a6edefcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2020 02:53:33.2009 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0CV9o6qBITE7nZKk1QMG9BLi26KiWKtHieNxFTOTnNqAg39ArYacmrgMGCBTdbKZsDb+07CPQ8cMcaOTHK+DZrylCHlG1rApvVF0TKDahQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2916
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKb2VsIFN0YW5sZXkgPGpvZWxA
am1zLmlkLmF1Pg0KPiBTZW50OiBXZWRuZXNkYXksIERlY2VtYmVyIDIzLCAyMDIwIDk6MDcgQU0N
Cj4gVG86IFpldiBXZWlzcyA8emV2QGJld2lsZGVyYmVlc3QubmV0PjsgUnlhbiBDaGVuDQo+IDxy
eWFuX2NoZW5AYXNwZWVkdGVjaC5jb20+DQo+IENjOiBFZGRpZSBKYW1lcyA8ZWFqYW1lc0BsaW51
eC5pYm0uY29tPjsgTWF1cm8gQ2FydmFsaG8gQ2hlaGFiDQo+IDxtY2hlaGFiQGtlcm5lbC5vcmc+
OyBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3QGFqLmlkLmF1PjsNCj4gbGludXgtbWVkaWFAdmdlci5r
ZXJuZWwub3JnOyBPcGVuQk1DIE1haWxsaXN0IDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+Ow0K
PiBMaW51eCBBUk0gPGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz47IGxpbnV4
LWFzcGVlZA0KPiA8bGludXgtYXNwZWVkQGxpc3RzLm96bGFicy5vcmc+OyBMaW51eCBLZXJuZWwg
TWFpbGluZyBMaXN0DQo+IDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPjsgSmFlIEh5dW4g
WW9vIDxqYWUuaHl1bi55b29AbGludXguaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IDIvM10gYXNwZWVkLXZpZGVvOiBjbGVhciBzcHVyaW91cyBpbnRlcnJ1cHQgYml0cw0KPiB1bmNv
bmRpdGlvbmFsbHkNCj4gDQo+IE9uIFR1ZSwgMjIgRGVjIDIwMjAgYXQgMTk6MTQsIFpldiBXZWlz
cyA8emV2QGJld2lsZGVyYmVlc3QubmV0PiB3cm90ZToNCj4gPg0KPiA+IE9uIE1vbiwgRGVjIDIx
LCAyMDIwIGF0IDEwOjQ3OjM3UE0gQ1NULCBKb2VsIFN0YW5sZXkgd3JvdGU6DQo+ID4gPk9uIFR1
ZSwgMTUgRGVjIDIwMjAgYXQgMDI6NDYsIFpldiBXZWlzcyA8emV2QGJld2lsZGVyYmVlc3QubmV0
PiB3cm90ZToNCj4gPiA+Pg0KPiA+ID4+IEluc3RlYWQgb2YgdGVzdGluZyBhbmQgY29uZGl0aW9u
YWxseSBjbGVhcmluZyB0aGVtIG9uZSBieSBvbmUsIHdlDQo+ID4gPj4gY2FuIGluc3RlYWQganVz
dCB1bmNvbmRpdGlvbmFsbHkgY2xlYXIgdGhlbSBhbGwgYXQgb25jZS4NCj4gPiA+Pg0KPiA+ID4+
IFNpZ25lZC1vZmYtYnk6IFpldiBXZWlzcyA8emV2QGJld2lsZGVyYmVlc3QubmV0Pg0KPiA+ID4N
Cj4gPiA+SSBoYWQgYSBwb2tlIGF0IHRoZSBhc3NlbWJseSBhbmQgaXQgbG9va3MgbGlrZSBHQ0Mg
aXMgY2xlYXJpbmcgdGhlDQo+ID4gPmJpdHMgdW5jb25kaXRpb25hbGx5IGFueXdheSwgc28gcmVt
b3ZpbmcgdGhlIHRlc3RzIHByb3ZpZGVzIG5vIGNoYW5nZS4NCj4gPiA+DQo+ID4gPkNvbWJpbmlu
ZyB0aGVtIGlzIGEgZ29vZCBmdXJ0aGVyIG9wdGltaXphdGlvbi4NCj4gPiA+DQo+ID4gPlJldmll
d2VkLWJ5OiBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1Pg0KPiA+ID4NCj4gPiA+QSBxdWVz
dGlvbiB1bnJlbGF0ZWQgdG8gdGhpcyBwYXRjaDogRG8geW91IGtub3cgd2h5IHRoZSBkcml2ZXIN
Cj4gPiA+ZG9lc24ndCBjbGVhciB0aGUgc3RhdHVzIGJpdHMgaW4gdGhlIGludGVycnVwdCBoYW5k
bGVyPyBJIHdvdWxkDQo+ID4gPmV4cGVjdCBpdCB0byB3cml0ZSB0aGUgdmFsdWUgb2Ygc3RzIGJh
Y2sgdG8gdGhlIHJlZ2lzdGVyIHRvIGFjayB0aGUNCj4gPiA+cGVuZGluZyBpbnRlcnJ1cHQuDQo+
ID4gPg0KPiA+DQo+ID4gTm8sIEkgZG9uJ3QsIGFuZCBJIHdhcyBzb3J0IG9mIHdvbmRlcmluZyB0
aGUgc2FtZSB0aGluZyBhY3R1YWxseSAtLQ0KPiA+IEknbSBub3QgZGVlcGx5IGZhbWlsaWFyIHdp
dGggdGhpcyBoYXJkd2FyZSBvciBkcml2ZXIgdGhvdWdoLCBzbyBJIHdhcw0KPiA+IGEgYml0IGhl
c2l0YW50IHRvIHN0YXJ0IG1lc3Npbmcgd2l0aCB0aGluZ3MuICAoVGhvdWdoIG1heWJlIGRvaW5n
IHNvDQo+ID4gd291bGQgYWRkcmVzcyB0aGUgInN0aWNraW5lc3MiIGFzcGVjdCB3aGVuIGl0IGRv
ZXMgbWFuaWZlc3QuKSAgUGVyaGFwcw0KPiA+IEVkZGllIG9yIEphZSBjYW4gc2hlZCBzb21lIGxp
Z2h0IGhlcmU/DQo+IA0KPiBJIHRoaW5rIHlvdSdyZSBvbnRvIHNvbWV0aGluZyBoZXJlIC0gdGhp
cyB3b3VsZCBiZSB3aHkgdGhlIHN0YXR1cyBiaXRzIHNlZW0gdG8NCj4gc3RpY2sgdW50aWwgdGhl
IGRldmljZSBpcyByZXNldC4NCj4gDQo+IFVudGlsIEFzcGVlZCBjYW4gY2xhcmlmeSBpZiB0aGlz
IGlzIGEgaGFyZHdhcmUgb3Igc29mdHdhcmUgaXNzdWUsIEkgc3VnZ2VzdCB3ZSBhY2sNCj4gdGhl
IGJpdHMgYW5kIGxvZyBhIG1lc3NhZ2Ugd2hlbiB3ZSBzZWUgdGhlbSwgaW5zdGVhZCBvZiBhbHdh
eXMgaWdub3JpbmcgdGhlbQ0KPiB3aXRob3V0IHRha2luZyBhbnkgYWN0aW9uLg0KPiANCj4gQ2Fu
IHlvdSB3cml0ZSBhIHBhdGNoIHRoYXQgY2hhbmdlcyB0aGUgaW50ZXJydXB0IGhhbmRsZXIgdG8g
YWNrIHN0YXR1cyBiaXRzIGFzIGl0DQo+IGhhbmRsZXMgZWFjaCBvZiB0aGVtPw0KPiANCkhlbGxv
IFpldiwgYmVmb3JlIHRoZSBwYXRjaCwgZG8geW91IG1ldCBpc3N1ZSB3aXRoIGlycSBoYW5kbGVy
PyBbY29udGludW91cyBpbmNvbWluZz9dDQoNCkluIGFzcGVlZF92aWRlb19pcnEgaGFuZGxlciBz
aG91bGQgb25seSBoYW5kbGUgZW5hYmxlIGludGVycnVwdCBleHBlY3RlZC4NCiAgIHUzMiBzdHMg
PSBhc3BlZWRfdmlkZW9fcmVhZCh2aWRlbywgVkVfSU5URVJSVVBUX1NUQVRVUyk7DQogKyBzdHMg
Jj0gYXNwZWVkX3ZpZGVvX3JlYWQodmlkZW8sIFZFX0lOVEVSUlVQVF9DVFJMKTsNCg0KUnlhbg0K
DQo+ID4NCj4gPg0KPiA+IFpldg0KPiA+DQo=
