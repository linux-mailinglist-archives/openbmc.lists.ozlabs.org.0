Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 795A82109B2
	for <lists+openbmc@lfdr.de>; Wed,  1 Jul 2020 12:51:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xdM74ZpyzDqvW
	for <lists+openbmc@lfdr.de>; Wed,  1 Jul 2020 20:51:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=piotr.matuszczak@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=gjENeTiz; dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xdLF05qfzDqjQ
 for <openbmc@lists.ozlabs.org>; Wed,  1 Jul 2020 20:50:44 +1000 (AEST)
IronPort-SDR: UetDZSnV48ORdJ/NRg7D5PNtaQUQb33D5IPjO8/sUO9/sQ2zKDIVHAqRN3oj99O89spTEq7XsP
 XFVnLavuLS9w==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="144709374"
X-IronPort-AV: E=Sophos;i="5.75,299,1589266800"; d="scan'208";a="144709374"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 03:50:41 -0700
IronPort-SDR: SH05TjzzVqNSMFbgNGDAdn9sgG6mZlA9xb/AhXO8wQjhMU1e7WpKR6WE0D4QMi6S5KGA6Rp1Jb
 CDaA6iJNNCRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,299,1589266800"; d="scan'208";a="386975514"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
 by fmsmga001.fm.intel.com with ESMTP; 01 Jul 2020 03:50:41 -0700
Received: from orsmsx158.amr.corp.intel.com (10.22.240.20) by
 ORSMSX103.amr.corp.intel.com (10.22.225.130) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 1 Jul 2020 03:50:40 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 ORSMSX158.amr.corp.intel.com (10.22.240.20) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 1 Jul 2020 03:50:40 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 1 Jul 2020 03:50:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZL/iQ6+o9EM4MiMQNGBg86Q5sbnmoxwERCCtnLHuwFEDFqNM5SR3ysjR7/wc5JRow1Y21ijK81UiYFCPyAWY/UKVXm141Wh4GKl4uXDx2ItvT6XsQeh4hveNgQ5TxhLu5I8yr8C2Q1GGy1e36no3KeOEA190btxa7DwJry6eHwiULwywliPRm06XlHt5W+QZ1ZJgx878FMCj9Bod7laqkjtZIV2YfjzBsOdzv9yWBm7QcZl30nPwLOc/XAWpxiAQa4IZbKU3fZeABxsPwfjc+doX4KCylyLD/1J4FqE8wnfj1iDuSqksrChr+dakwL+hjDquWEDKR6lMsB/NKaRQgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSBy9XS0yq99Lp/xLbIFMHGrHzB3deeiAAC91+N35Jo=;
 b=DtT2kxBHmIJx5BsL5/zw3ezx3V2pGcDam6KU1K907d4hWOEiJR0TtF/nFaVBp8+zp7YGo1MSX8bOrT/I7Ns7w5IdFWBY4A89zlkdScKYfVRfmAe+2IR+At9zuRJeCVVktcuWcNf//CAalOt2iCdPTFyRgyWKTuH5JNixmEPoIbb9oripqs5lTFPHOzOIfFozYOfSmrF5v1BFl6nNqks4ZFwcBRv3MiWuFUuFcEGm/PG1/wBGdQ89dy5f5eb+ALtH3EvUF+h+GyvZSsdRn3KHUjwzOdc7QskZw/E3FoDdVTvSNYPHTXfbUAY7oFKNTwylRnEBcZjnfyTT35aqoEMueQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSBy9XS0yq99Lp/xLbIFMHGrHzB3deeiAAC91+N35Jo=;
 b=gjENeTizohgOcYydhHBc3fS1wygZJ7b6nKGCM7EpwffKn70MyLxXvUFEMmnxP69tDV77DGZapJfmCw4ANCTe5rXzFEXGU4qIMBdN29A1+yribFyrixZHPFo9ncwQxceLnxE4QRqVFDtwTREeGwiReb+0oVSxGd37N2zJdril29E=
Received: from CY4PR1101MB2311.namprd11.prod.outlook.com
 (2603:10b6:910:23::12) by CY4PR11MB1704.namprd11.prod.outlook.com
 (2603:10b6:903:29::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21; Wed, 1 Jul
 2020 10:50:39 +0000
Received: from CY4PR1101MB2311.namprd11.prod.outlook.com
 ([fe80::3447:6d09:f8e2:62cf]) by CY4PR1101MB2311.namprd11.prod.outlook.com
 ([fe80::3447:6d09:f8e2:62cf%2]) with mapi id 15.20.3131.021; Wed, 1 Jul 2020
 10:50:39 +0000
From: "Matuszczak, Piotr" <piotr.matuszczak@intel.com>
To: =?utf-8?B?QWRyaWFuIEFtYnJvxbxld2ljeg==?=
 <adrian.ambrozewicz@linux.intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "Wludzik, Jozef" <jozef.wludzik@intel.com>,
 "Grobelny, Krzysztof" <krzysztof.grobelny@intel.com>
Subject: RE: TelemetryService - all pieces delivered, help needed
Thread-Topic: TelemetryService - all pieces delivered, help needed
Thread-Index: AQHWT5ROnvC2Au4pGEW632MfLbYwJajyirlA
Date: Wed, 1 Jul 2020 10:50:39 +0000
Message-ID: <CY4PR1101MB2311CBB0DA416A50994B0480866C0@CY4PR1101MB2311.namprd11.prod.outlook.com>
References: <bde6b048-9588-075b-ef86-04972288c1c4@linux.intel.com>
In-Reply-To: <bde6b048-9588-075b-ef86-04972288c1c4@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [134.191.221.104]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7903de97-dc2f-47be-bf3f-08d81dac97e8
x-ms-traffictypediagnostic: CY4PR11MB1704:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR11MB17047F309663B42C73E6B45C866C0@CY4PR11MB1704.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dGLlX2Pj48M3EnaDbe/qQZTZpdX7pXsXrRKY7wU5KZfFVbup364LJiGhj+44ofZmJE0RYy1XQy7EwErAcG9FYRTmkkBjnhnjUhmwXv6LdGBJ3kKVZ5V44wrCyuZYugq8cAZaVLb1EJwubYi21ZtGNk+vB7qr6ioVehalGDmQB4G65ydq2Hu4dOoys++mgvZGHBgrZe3HwhK0G+xAQh15zgYGfWDSMG4wEx+cGa/PT6gW1BTIkxWdGiNbc119nB3FrYF43sOswh04NOftnPe+K6wzFGZ6BCXS9M2qcJfZsTiNCqPlG6TAnHGmjrn9huT7Fg3QpKWapQ5i9IDOraznqgVjJoQhMeWj5IwcxyrqLum4AI4nbEBo2T4QotguWgTAr7EiM6bPHUoh4eHhu4yGvg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1101MB2311.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(136003)(366004)(376002)(39860400002)(346002)(186003)(26005)(9686003)(7696005)(2906002)(76116006)(66476007)(66446008)(5660300002)(64756008)(66556008)(52536014)(6636002)(71200400001)(66946007)(66574015)(55016002)(8676002)(86362001)(8936002)(83380400001)(6506007)(53546011)(966005)(316002)(110136005)(33656002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: U0B7OCw/CZd0gzFIEzlZ0z04ayRE5nYZSzOf3v9sUetetF9Z4Xt2Bp1uBjILwu7vqsNOAleOORCG3hIkuQMRflmVWgT+c+GxgkSZ2+j1KNJFQYAcIEmMPfOpH4kg2v4gH38pDgUM/P+m+B+VoLcZ5MbE2CG/9sM7FC+ilrwFLMli0mnfIeWSSijtH3NVSNg8/AouAUgvqK4m//bM2y1U4tmJ4v84v94hpIHRINuw4G4+vKMLjMwn8b44+sG+NtASGQoqOcZSLrUuEpjl9kMbyTWOucp5klxkK61gk+k2ciaPhimJ6CyCNaM8IdKPSYJ85j7XbXiHTsGDCtdo7aGvFOCRUb0jPdoY+riOfDyder7DcQfw4t9JUVBBRLVQMpbwmP/EGEZWiHA/21xkUJDSR5sJ0t6quG4RyjCoITDi4A/E86j8BsBYNkM1z8kNuj8PaKiRjd5dy+kMuCdcrLheM4iqwChtqUj/jVRLfuYk6SyBPozXyO+7NvlLesbl2NVH
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1101MB2311.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7903de97-dc2f-47be-bf3f-08d81dac97e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 10:50:39.2168 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LcWxeq3MsqzGDKXox6Ys8GexTERDPtzw9DdmH4UhHqPAHc+/wFYHX4ls+lvvsBYIXIfBOzMAjnwJQDC+zV5LoMREEc/OVuBawYS9ovZaJcA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1704
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SW4gb3JkZXIgb2YgdGhlIHNvbHV0aW9uIHRvIGJlIGNvbXBsZXRlLCB0aGVyZSBpcyBhbHNvIHNv
bWUgY2hhbmdlcyB0byB0aGUgdGVsZW1ldHJ5Lm1kIGRvY3VtZW50IHVuZGVyIHRoZSByZXZpZXc6
DQpodHRwczovL2dlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6L2Mvb3BlbmJtYy9kb2NzLysvMzE2
OTANClRob3NlIGRvY3VtZW50IGNoYW5nZXMgYXJlIHJlc3VsdCBvZiBkZWNpc2lvbnMgbWFkZSBk
dXJpbmcgdGhlIGltcGxlbWVudGF0aW9uIGluIG9yZGVyIHRvIGVhc2UgaW50ZWdyYXRpb24gd2l0
aCB0aGUgRXZlbnQgU2VydmljZS4gDQoNClBpb3RyIE1hdHVzemN6YWsNCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
SW50ZWwgVGVjaG5vbG9neSBQb2xhbmQgc3AuIHogby5vLiANCnVsLiBTbG93YWNraWVnbyAxNzMs
IDgwLTI5OCBHZGFuc2sNCktSUyAxMDE4ODINCk5JUCA5NTctMDctNTItMzE2DQoNCi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBBZHJpYW4gQW1icm/FvGV3aWN6IDxhZHJpYW4uYW1i
cm96ZXdpY3pAbGludXguaW50ZWwuY29tPiANClNlbnQ6IFdlZG5lc2RheSwgSnVseSAxLCAyMDIw
IDEyOjQxIFBNDQpUbzogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOyBXbHVkemlrLCBKb3plZiA8
am96ZWYud2x1ZHppa0BpbnRlbC5jb20+OyBHcm9iZWxueSwgS3J6eXN6dG9mIDxrcnp5c3p0b2Yu
Z3JvYmVsbnlAaW50ZWwuY29tPjsgTWF0dXN6Y3phaywgUGlvdHIgPHBpb3RyLm1hdHVzemN6YWtA
aW50ZWwuY29tPg0KU3ViamVjdDogVGVsZW1ldHJ5U2VydmljZSAtIGFsbCBwaWVjZXMgZGVsaXZl
cmVkLCBoZWxwIG5lZWRlZA0KDQpIZWxsbyBldmVyeW9uZSwNCg0KVGhhbmtzIHRvIGNvbW1pdG1l
bnQgb2YgUGlvdHIgTWF0dXN6Y3phaywgSm96ZWYgV2x1ZHppayBhbmQgS3J6eXN6dG9mIEdyb2Jl
bG55IHdlIGFyZSBmaW5hbGx5IGFibGUgdG8gcHVibGlzaCBhbGwgcGllY2VzIG9mIE9wZW5CTUMg
VGVsZW1ldHJ5IHNvbHV0aW9uIGRlc2lnbmVkIGhlcmU6IA0KaHR0cHM6Ly9naXRodWIuY29tL29w
ZW5ibWMvZG9jcy9ibG9iL21hc3Rlci9kZXNpZ25zL3RlbGVtZXRyeS5tZA0KDQpBcHBsaWNhdGlv
biBzb3VyY2VzOg0KaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei9jL29wZW5ibWMv
dGVsZW1ldHJ5LysvMzQyNzMNCg0KREJ1cyBpbnRlcmZhY2Ugc3BlY2lmaWNhdGlvbjoNCmh0dHBz
Oi8vZ2Vycml0Lm9wZW5ibWMtcHJvamVjdC54eXovYy9vcGVuYm1jL3Bob3NwaG9yLWRidXMtaW50
ZXJmYWNlcy8rLzM0MDk1DQoNClJlZGZpc2ggZnJvbnRlbmQ6DQpodHRwczovL2dlcnJpdC5vcGVu
Ym1jLXByb2plY3QueHl6L2Mvb3BlbmJtYy9ibWN3ZWIvKy8zMTY5MiBhbmQgc2V2ZXJhbCBvbiB0
b3Agb2YgdGhhdC4NCg0KSSB3b3VsZCBsaWtlIHRvIGludml0ZSBhbGwgaW50ZXJlc3RlZCBwYXJ0
aWVzIHRvIHBhcnRpY2lwYXRlIGluIHJldmlld2luZyB0aGUgY29kZSBhbmQgbWFraW5nIGl0IHBh
cnQgb2YgT3BlbkJNQyBzb2x1dGlvbi4NCg0KV2UgaGF2ZSBtb3JlIGNoYWxsZW5nZXMgYWhlYWQg
b2YgdXMsIHdoaWNoIHdlIHdpbGwgdHJ5IHRvIGFkZHJlc3MgYXMgbmV4dCBzdGVwczoNCi0gZW5h
YmxpbmcgSmVua2lucyBidWlsZCAod2lsbCBhcHByZWNpYXRlIGhpbnRzIGhlcmUgb24gZ2V0dGlu
ZyBzdGFydGVkKSwNCi0gZW5hYmxpbmcgYXV0b21hdGVkIFVUIGV4ZWN1dGlvbiwgZm9ybWF0dGlu
ZyBldGMsDQotIHdvcmtpbmcgb24gbmV3IGZlYXR1cmVzLCBhcyB3aG9sZSBkZXNpZ24gd2FzIG5v
dCB5ZXQgYWRkcmVzc2VkLg0KDQpSZWdhcmRzLA0KQWRyaWFuDQo=
