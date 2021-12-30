Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7020488E5D
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 02:53:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXH0s5HWbz2xDV
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 12:53:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R4zvyHhj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jiaqing.zhao@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=R4zvyHhj; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JPxBQ24xmz2yPp
 for <openbmc@lists.ozlabs.org>; Fri, 31 Dec 2021 05:09:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640887790; x=1672423790; h=from:to:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=yf2939CrfUtd2ui5Bb0qV4PV7XGWUEdQDkM0BVaLOKI=;
 b=R4zvyHhjJ6woB9bE6iKe5msEe6OjIyPEdJ7sP3CAeEE7sP8/HgbsEkkP
 dqAP26TYtIWKpHH/EbAUUE3PF4PJRmhiN4JS+ppl/nTJKGxA/kZmqiFfz
 P9M6sZk2L9p0FNwxgNK9xrfN/jBrlsunKwOVGh2TxvoTY5+r9v1kA0Y0+
 H9uZUNNwQ8bCsu0RkcocwTqI71EHz0a9GYzaC/UhVosX649xb/BSMuUdB
 nBFkBCrJYMVloEkZHpd72OiA+2hzUt9k5y4xBJBaauKYL7x9kGqJ5MUMq
 8Pz6VeY4YEjuuc1sNx3Zs7j0r/IS5UJqSz/eQb/HceZlYvFkHVKrgPABE g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10213"; a="241923776"
X-IronPort-AV: E=Sophos;i="5.88,248,1635231600"; d="scan'208";a="241923776"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2021 10:08:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,248,1635231600"; d="scan'208";a="510967748"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga007.jf.intel.com with ESMTP; 30 Dec 2021 10:08:41 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 30 Dec 2021 10:08:41 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 30 Dec 2021 10:08:41 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 30 Dec 2021 10:08:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j3vpLtlKJXA9XC6+pTOoJNsyZAk+j3IlTlxuUXBY5YKlx3i8wXGlLrr0sIhoVpYDNP04ZsYiE1ciyT206jklb5f3svbeCBq2r23RtJlCGkS66HB5PzZHNlQLNTcn9p5XYHwAPW70/i8GsEf8t0ZhWAMiqEgnYBl1McVdGXrkYy2jwohPH3ziiSOtts7Tngdc5tAyDDIIqtKexyyB4yD4w6KqPu27IvmtEl+UcN/x0u0188nOe83UIdumTZDSdUW4R0Lee5bH97dXDydEtbCmbNOaG6R31JG7nILqXZ3z+fo9aUXOHU77OolTxmcBl2AGcO5rkOiDtycT3HNaPrtWPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yf2939CrfUtd2ui5Bb0qV4PV7XGWUEdQDkM0BVaLOKI=;
 b=QyV8q7lllqPAd9zgLIXQf+DSDEJ0jKbtbVffem9lFE+e9J+Owpgg4X6P0oLroT1RZ3UdLhEkt4TmImoQkJQLXmCFlaDEayji2663iNLwdq14kyGaruHdWsWf2YTDouLk/CyFYaROkOCuGdMd5Ir/r90FVHQdsKVutNokbq7h3MrHdBH8EiBXV2tEla64mpPHfIHPf3rp2j51+U9U+JtLk5AdxSnAprboJZCrVqR5LqPzfyWW7xrrPouvofGTi/47oseokDXjPyFB22qr3uY+8UMfEueRnHfeT4LKKLCu5MObZc4/FGvncjmHPFI8gsOI9WXJDOQW8SE6dr3MkSTenA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO1PR11MB4785.namprd11.prod.outlook.com (2603:10b6:303:6f::21)
 by MWHPR11MB1742.namprd11.prod.outlook.com (2603:10b6:300:113::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Thu, 30 Dec
 2021 18:08:38 +0000
Received: from CO1PR11MB4785.namprd11.prod.outlook.com
 ([fe80::5835:30d7:a41d:c8b]) by CO1PR11MB4785.namprd11.prod.outlook.com
 ([fe80::5835:30d7:a41d:c8b%4]) with mapi id 15.20.4844.014; Thu, 30 Dec 2021
 18:08:38 +0000
From: "Zhao, Jiaqing" <jiaqing.zhao@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Configuring VLAN interface via redfish
Thread-Topic: Configuring VLAN interface via redfish
Thread-Index: Adf9o9dB2um6eb+4SWiXkEgQuFq+hw==
Date: Thu, 30 Dec 2021 18:08:38 +0000
Message-ID: <CO1PR11MB478536190313942A25F149BB8E459@CO1PR11MB4785.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c32be481-a812-4b3c-610b-08d9cbbf67a2
x-ms-traffictypediagnostic: MWHPR11MB1742:EE_
x-microsoft-antispam-prvs: <MWHPR11MB1742F8F9EC0575A7B822C0FD8E459@MWHPR11MB1742.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HKGm6YGPW0EkTDKDOP0dG5ObFxnzidziRpLyA5zlrpqgB4bxZ8qV+QceZgoJ3Nw3OA5e7Qfimm85n6R5T6IQPHTeZEyR4EqJ0rcvZ4OlsD/p0m3LPcAdWPctHYlSF+2FdHcYATQoEKmNavgLb2y6JiAdUXgNnE5Pl70YQPMeGSQLNSk/N2SiVrfJ4rWxMCMQ6MlDHG2/U+3bE6XdPNyozZcPwv8ZkmAc+U1ydrj+kPMbBVcN1anSheAuO1HrSLD9+2y7fHQwBJNsSuONkHezCGHsWtX2quasELZJnZT+KscHosYh1CHEc3zoWX7v7u0d1Rs7IO4wHVAlGGXMXisWwjORgmYhKFnmx/8OXssdniUeB+si3ynOl678SJm1xLCYP1ztWxpcxkquZ2eNkM0C5uoFu5T4YUP+3KA+T/KlIdQMR1ZO0x4CdGc8mIBM9vHKzyEzgIVWCYiJWlvmlp5z+WoSwgdXMnauqHeYvNjmgq45+kz885OQq0NSnFm6l28UbKM2Q4PnxNjPVn6+lGelafqBhwfZVk7wHDQ7h84WA1/+HQxLQvSS+Vr5oZAFLx2gvWiS5rr122rjxcIhatSVzLH/q2vmY1r7qICLBPHf7fsOia5uO4NuVGW5bMhCvytzYixCW/Npx8E3p2+X87ryAx3e6bn6Lrn3exn3DomsE4zDUpKNqx4xBeOhH7PZQMC7ZoA3TTVw0p9YK+WUshfHBRHgh6hBvwK2zM6RAlohTp7taOcuy4+zX+cpqPKSDKULm6g8DtEHsjAzYM42u83r6M+uEl1JhXeBL0jlqTVOGto=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4785.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38100700002)(316002)(38070700005)(82960400001)(508600001)(33656002)(966005)(71200400001)(83380400001)(122000001)(19627235002)(9686003)(66446008)(7696005)(6916009)(55016003)(2906002)(66476007)(64756008)(52536014)(186003)(8676002)(66556008)(26005)(6506007)(8936002)(5660300002)(86362001)(66946007)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UENObjFsY1lITEJTclZ0ZzdGTkpHOWVHaWRrUFprL1k5bzRZRE5NRmFFdWpP?=
 =?utf-8?B?R1p1bjduSUpqc1RyelZ4YVNQTDBkRU9hSUxOekZHcjRpMSt5VjVPbnZielUy?=
 =?utf-8?B?VThGeEk5STBpM1VXN3VDcHR2WUovNDBaR01QWmhVcmwyWnhCdFM2N2lsMjVm?=
 =?utf-8?B?eGhrZDRyTXNXZzBlZXRHWkE0a3AvUUhHWkZNdGlrN0dCd2Y4TGlGL1g2S0M2?=
 =?utf-8?B?RXhvNlR1OGd5OUZEL2piY2RzRjdSV01FeWpscURuRFVXMEV5ZUFUaFI0ejFW?=
 =?utf-8?B?ZXA1UnU0UWdyU1l2NzBBZVZvNWozQ2RHM09yTFI1S0xKSFVaOTdVeGV2WG1N?=
 =?utf-8?B?dXJ2dm5rZ3ZPVm45K2tLQUpML1RrYlNEcjkvcmxnSTJtaWJVSGhwTEVVTFRq?=
 =?utf-8?B?RFkzNFBjemp6Zm9YOVptdXZvbi9TZTJNN29kc2JnNnY0N2NOTHlmb3ZBeG1I?=
 =?utf-8?B?Skhyd2N0aVdmNjYwVHZyVTE5TVNPcHVMZzB0TzljOXFzNk9xenR1bDJjdGRm?=
 =?utf-8?B?cUxScWlYWlhUS0pIZkQ2U1UyZ0RjNi9HMncwWnlVVUl6NVE3TkxlM0ZwTUNL?=
 =?utf-8?B?b0luRjdobVI1b3habkZRcDFZVHBrME5lMW1aTHZDQkRIcTNlZWFFc1Y4M1pC?=
 =?utf-8?B?V2JvUUZqM3hyTTZxcVAzMXNXWDhQbUFMUlFvUVdBdUI2NUt0L0ZoUDhKdUo5?=
 =?utf-8?B?ZXRRL3hQbXh1bFVOR1VnNDRPNXNxTENtMmZSdVpNWEQrUlJheHVQUVRxSGMz?=
 =?utf-8?B?dGZqNWJFVmM4Y1QydG53YVpVMEd5OFFab2o2NEM5alk2UXczYmVqb085Vncz?=
 =?utf-8?B?WGtldy9sSzl1LzRrbWs3OXdzZTl0d1Fza0FuQ2tsMDZOWlVGcDlMOVpqZ0k1?=
 =?utf-8?B?ZVdkTFpXL2IzVGQwcklJQ29NV1J3L0U2NndWdE9aYnBmY0VBNEtjNnlHUXZF?=
 =?utf-8?B?YWNMTXJXU3BNVm1mUFpKN0lEZDFzbzgwY21oTVBCZ0dxMWU3MldEN09DUjM3?=
 =?utf-8?B?OTdZTnFqK09wZ3ZJWENWQVoyRHNMRldkczJmMU8yeWtNR2JYbVNjSnRBYk5S?=
 =?utf-8?B?blhqelNrSkpxYmlCaDRaZ3lXNTBYUWM0enNVNHZxcFUxUjIvdjZkZk1WNS9R?=
 =?utf-8?B?QjFiUGVhNVhnLzJoNWlJNjNVejBNTUh2MXdVd1lETmd5eDVsaGppOUlvRW9t?=
 =?utf-8?B?V0Uzcm1JcVJ5bU9FSk4xcThha1FwZjJRMDQrZHRUd1dKcjFVQkpGazZZNWxK?=
 =?utf-8?B?VnRBT0pjOEhVRDUwN0xDMkIyUkZ3c3l5T0FkMjNhUS9ReWk1R2t6ZVdWQjdv?=
 =?utf-8?B?Z0tKeTNlVGpWOUUrcllFZDdNcW1YM2ZpZ21RYVFqSTIxU3h0dmpSMmV0L3NG?=
 =?utf-8?B?cjhjdXJ6T2k0N3J3QmhNbjZ0cERLenZzbFozVC9CR0kxeUk2THpxemJxWFJG?=
 =?utf-8?B?a05DcUlMK2xRalEyK1hVb3d3ay9Lc29BTVlackFXS3FuaUlnVHlhRE0raGVN?=
 =?utf-8?B?RnJoaUxSUllORENzOC9WMy9CV1BKTGJuMnBqdnBWc01hTWxScXlVV1BlZHFQ?=
 =?utf-8?B?VTg5eFM4U25wSCtRQzE1cEQ0QTVVSy9xZlJYa3VxcXBDY05mb1R6TmJ3MG1W?=
 =?utf-8?B?RjI3cEJBNmp4WCtyU3hZMWN2b01mbGVVU1Y0WVIvTXFkNlVLZDNWdlYrcUJI?=
 =?utf-8?B?T2ZHdC90dmVIV3BoQUd0OHZCUVhkRnlSU1hwWVVDMGpJOGVVWWh5WHh2ellU?=
 =?utf-8?B?UGNTSEFDczhld0lFUGhSeTNTQnV1aGI0QzFlbW9rTDUwRnQxekVmZFVaTldu?=
 =?utf-8?B?RStuY004Y01mbU8xRy9lOFlGc0hSUlFKUU41d3JhSFUwZFlmVlYrVDF4cXNp?=
 =?utf-8?B?TVJ0eGxPQlZPWTVvYUNaU1BobVFCNXQrc2NFaVBFUnJJVGplOWdhQnZlVjRL?=
 =?utf-8?B?SGJEdm52U2NTTy9ZVUtYYUhSTjdmdXRMNU5KcXVLTUFFOHBhYlhIRHY0SzJD?=
 =?utf-8?B?MkRCTU5RZ2FHTmtyR2JrbGVKdmc1b0hjN1dOM3MzYXJCbnlPcFFMSFlrZGFM?=
 =?utf-8?B?Q3o5RkJKTUVnUko5RDR2KzZld05SNDlsWE11UWJDcDQyeFlwQ205RmZtQ1Mx?=
 =?utf-8?B?ejlBWHpnZ0FpZlY4Yi82QjlFUTZhOU1zOURaUUljN3NlNGdSK05QSm9NTFpO?=
 =?utf-8?B?SWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4785.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c32be481-a812-4b3c-610b-08d9cbbf67a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2021 18:08:38.6897 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RAys+w7Gi2RgPXx3+OGejCbLBTm1vsy9Ud44bVztBkEY93UQKGoOGqVVtavhoU4AvHjn7InOMjEWQ07MqSU4MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1742
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Mon, 10 Jan 2022 12:50:43 +1100
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

SGksIGFsbA0KDQpXaXRoIHN5c3RlbWQtbmV0d29ya2QsIGVhY2ggVkxBTiBpcyBhIHZpcnR1YWwg
aW50ZXJmYWNlIGFzc29jaWF0ZWQgdG8gdGhlIHBoeXNpY2FsIGludGVyZmFjZSwgYW5kIGl0IGhh
cyBpdHMgb3duIG5ldHdvcmsgY29uZmlnIGxpa2UgSVAgYWRkcmVzcy4gQ3VycmVudGx5IG91ciBw
aG9zcGhvci1uZXR3b3JrZCBhbHNvIHN1cHBvcnRzIGl0IHdlbGwuIEJ1dCBpbiB0aGUgYm1jd2Vi
IHNpZGUsIHdlIGxhY2sgdGhlIGltcGxlbWVudGF0aW9uLiBBbmQgdGhlcmUgaXMgYW4gaXNzdWUg
bG9uZyBhZ28gYWJvdXQgaXQgaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvYm1jd2ViL2lzc3Vl
cy83OS4NCg0KSW4gY3VycmVudCBSZWRmaXNoIGltcGxlbWVudGF0aW9uLCBWTEFOIGlzIG9ubHkg
c2hvd24gYXQgL+KAi3JlZGZpc2gv4oCLdjEv4oCLTWFuYWdlcnMv4oCLYm1jL+KAi0V0aGVybmV0
SW50ZXJmYWNlcy/igIs8c3RyPi/igItWTEFOcy/igIs8c3RyPiB3aXRoIHZlcnkgbGltaXRlZCBp
bmZvcm1hdGlvbiAoT25seSBWTEFOIElEKS4gVXNlciBjYW5ub3QgY29uZmlndXJlIHRoZSBpbnRl
cmZhY2UgaXRzZWxmLiBBbmQgdGhlIFZMYW5OZXR3b3JrSW50ZXJmYWNlIHNjaGVtYSBpcyBkZXBy
ZWNhdGVkIG9uIDIwMjEuMy4NCg0KTXkgcHJvcG9zYWwgaXMgZXhwb3NpbmcgdGhlIFZMQU4gdmly
dHVhbCBpbnRlcmZhY2UgaW4gdGhlIHNhbWUgd2F5IGFzIHBoeXNpY2FsIGludGVyZmFjZS4gSW4g
dGhpcyB3YXksIHdlIGNhbGwgdXRpbGl6ZSBleGlzdGluZyBjb2RlIG9mIGdldHRpbmcvc2V0dGlu
ZyBpbnRlcmZhY2UgcHJvcGVydGllcywgb25seSBuZWVkIHRvIGV4dGVuZCBzb21lIFZMQU4tc3Bl
Y2lmaWMgcHJvcGVydGllcy4gVGhpcyBpcyBhbHNvIHRoZSB3YXkgc3VnZ2VzdGVkIGJ5IFJlZGZp
c2ggc2NoZW1hLg0KDQpEZXRhaWxzIGFyZToNCg0KMS4gSW4gRXRoZXJuZXRJbnRlcmZhY2UsIHVz
ZSBFdGhlcm5ldEludGVyZmFjZVR5cGUgdG8gaW5kaWNhdGUgd2hldGhlciBpdCBpcyBwaHlzaWNh
bCBvciBWTEFOIChQaHlzaWNhbC9WaXJ0dWFsKQ0KMi4gQWRkIFZMQU4tc3BlY2lmaWMgcHJvcGVy
dGllcyBsaWtlIFZMQU5JZCB0byBWTEFOIGludGVyZmFjZXMuDQozLiBBZGQgYSBuZXcgQVBJIHRv
IGNyZWF0ZSBWTEFOLiAoVGhpcyByZXBsYWNlcyBjdXJyZW50IFBPU1QgL3JlZGZpc2gvdjEvTWFu
YWdlcnMvYm1jL0V0aGVybmV0SW50ZXJmYWNlcy88c3RyPiAvVkxBTnMpDQo0LiBDcmVhdGUgYSBE
RUxFVEUgbWV0aG9kIGhhbmRsZXIgaW4gL3JlZGZpc2gvdjEvTWFuYWdlcnMvYm1jL0V0aGVybmV0
SW50ZXJmYWNlcy88c3RyPiBmb3IgZGVsZXRpbmcgVkxBTiBpbnRlcmZhY2UuDQoNCkZvciAjMywg
SSBnb3QgdHdvIGlkZWFzLCBJJ20gbm90IHN1cmUgd2hpY2ggb25lIGlzIHByZWZlcnJlZA0KDQoz
LjEgQWN0aW9uIENyZWF0ZVZMQU4gaW4gZWFjaCBwaHlzaWNhbCBpbnRlcmZhY2UuIFBheWxvYWQg
d2lsbCBiZSB7IlZMQU5JZCI6IDF9IGZvcm1hdA0KMy4yIFBPU1QgbWV0aG9kIG9mIC9yZWRmaXNo
L3YxL01hbmFnZXJzL2JtYy9FdGhlcm5ldEludGVyZmFjZXMgeyJJZCI6ICI8SW50ZXJmYWNlPl88
VkxBTklkPiJ9LCBlLmcuIHsiSWQiOiAiZXRoMF8xIn0NCg0KQW55IHN1Z2dlc3Rpb25zL2FsdGVy
bmF0aXZlcyB3aWxsIGJlIGFwcHJlY2lhdGVkLg0KDQpUaGFua3MgYW5kIGhhcHB5IG5ldyB5ZWFy
LA0KSmlhcWluZw0KDQo=
