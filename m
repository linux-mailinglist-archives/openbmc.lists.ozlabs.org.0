Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 984F83EE0B7
	for <lists+openbmc@lfdr.de>; Tue, 17 Aug 2021 02:14:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpWjf3WSQz306l
	for <lists+openbmc@lfdr.de>; Tue, 17 Aug 2021 10:14:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=AxRm6woJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=zhikui.ren@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=AxRm6woJ; dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpWj64Ry8z2yNN
 for <openbmc@lists.ozlabs.org>; Tue, 17 Aug 2021 10:13:44 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10078"; a="238041153"
X-IronPort-AV: E=Sophos;i="5.84,327,1620716400"; d="scan'208";a="238041153"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 17:12:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,327,1620716400"; d="scan'208";a="679698382"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 16 Aug 2021 17:12:42 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 16 Aug 2021 17:12:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Mon, 16 Aug 2021 17:12:41 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Mon, 16 Aug 2021 17:12:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XO8L+RRu86Iax0MbisZJt7jUW6FiX61mC5jQ+vWW+7Pw714/qBz2MmBYciyBki1b0Zp1ydqIKf2yT1Xw4JO8hYj49zu0yYcW0hDqwxtyMJ4Nib2IkfNHFqIvno2gGRKY+JCbdOxbe1fV1KSue1Z7EckjtP1onNRkFwxxdIrwAmtWICv6GlEUNn/GY7t98c9dn5YotlSIIdNMLE1coBWn9pOFJVVQ6qBaCWtH2MyC1EjeeKrqKvfkqBPGNZBmkJ/JTjwYhqdkiQpcCcBIDpXXB4FydxmcOgg8P0aXL6poBMw2KzbEM+iTMTeEOHn87HrRu3ttpwW/CLekdthXYX8hvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dudBtUg5KcB3nyF60RTcqceQ8VEnGkd5lpX+7OghHbc=;
 b=L8hQEjLBYMCFwW81ZSlLnHxMM0feT+o7r6+WOdBXTp3YkrSzaZU/U1ablIF/xQMx0FvWGCbL2RcRSBHEleM5OnFWBfcxxv4ozGP0oL5U1cRWdcN+z/UtsqWGCsrNpOS9SvaLbN6PgUPbuDGLqhdAbir/Jtg6Tbgziwxu1w7Of7SWHxyLMZydl5d65DefZUdSwStOI9axhjF4FEFkq0VXVu8whv422xsqiJ+evejfDmAVZ6XC+0mkj7AyIpgzGRfNxpBwW26NDB+DAAOOoNgxbsBtKwXFsPkqorgFDimCa0bKsdxgDXW4zajQCj6YeWFWJ3OlXwB7BfTrftgxNM5xpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dudBtUg5KcB3nyF60RTcqceQ8VEnGkd5lpX+7OghHbc=;
 b=AxRm6woJ7jHoXCkA2URb06GGf7wujA7EM7JsgxgZVGzD+NHhmjOPq9zNuXA9XWWIixnVTPJ3jA1HXjuIymMjX3bkmvdnSI8rGTJYcM+LC8+sZw/iJcDGnoHSTrmPyniS5WrcxMfZJTLmn3c4cN99iaGJ+q6bSQ/4NVJso4e4Ca8=
Received: from DM6PR11MB4410.namprd11.prod.outlook.com (2603:10b6:5:1d9::11)
 by DM6PR11MB3098.namprd11.prod.outlook.com (2603:10b6:5:70::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Tue, 17 Aug
 2021 00:12:41 +0000
Received: from DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::b0bd:9d01:a28c:6367]) by DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::b0bd:9d01:a28c:6367%7]) with mapi id 15.20.4415.023; Tue, 17 Aug 2021
 00:12:40 +0000
From: "Ren, Zhikui" <zhikui.ren@intel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, "Bills, Jason M"
 <jason.m.bills@linux.intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: Requesting maintainer privilege on smbios-mdr repo
Thread-Topic: Requesting maintainer privilege on smbios-mdr repo
Thread-Index: AQHXiWkPZL3+puWnNkanGmwsTdFmw6tk43AAgAA5kICACWI7wIAHze0AgAB8NuA=
Date: Tue, 17 Aug 2021 00:12:40 +0000
Message-ID: <DM6PR11MB44102D2E0210C61DE6808DED94FE9@DM6PR11MB4410.namprd11.prod.outlook.com>
References: <59d36746-4a19-025b-1a43-9ec2bde0307c@linux.intel.com>
 <056b270e73e030377e175b1a79f1aefb841d6780.camel@fuzziesquirrel.com>
 <d57f2680-e196-eb4b-bb80-5ba5f8a9d81c@linux.intel.com>
 <DM6PR11MB44103299FE530EF7125E728194F89@DM6PR11MB4410.namprd11.prod.outlook.com>
 <3345a4efa688ea1bd92b17e76d89547791a9b742.camel@fuzziesquirrel.com>
In-Reply-To: <3345a4efa688ea1bd92b17e76d89547791a9b742.camel@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: fuzziesquirrel.com; dkim=none (message not signed)
 header.d=none;fuzziesquirrel.com; dmarc=none action=none
 header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c180f24-a48f-4a43-3a98-08d96113ba72
x-ms-traffictypediagnostic: DM6PR11MB3098:
x-microsoft-antispam-prvs: <DM6PR11MB30981B7AC43ECAD3D653E7FC94FE9@DM6PR11MB3098.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yVRn0kqG0biPBIc7qwva08sOlk+f1XA8OuW0aTgUna5Zc/z7Ffbse4D6QEpoPG14JGXfRe0AQ3x7aLB3E7OHQnjFkLbvAIVv2NRSjGJl3Gys3gMBji3i7h0eleFwFDKHxnAFjc7NREYoBoVMC2yU01g3uyecBkVWTrgrThipz+E8LDl2tZSDOPt66NxDFmOOl13L5n+D5oYKDjmThs7uWKJjJn7sigr/mFQvYeP+xmzLjFTZ8IFz88+aw70CmRXhzA98r/DVeS1j+9narpY5jRNqnq+7yD+9foeUDtibI21LAREyz7sumZTwh4sMGV/zBCu6QNQCcFmRXdMeXN+JGenldS0gFMJLYYJMT0TDBPzvtdYfBXvEgjwrvtLtuo4hgM5VomPXviEDMwDXeuZTOBYKTzKgVrMZ0Gqey6iQ6ljpsSEcaFUnGoPlQ9ALglu8Uw8b95huIRj23A6JEriQPJL055qEaNhSfrOVzUraGJP4zDKwRpZEDx9IPUbdRbshn+4BGT7n2OfLoL7RgCBmT8fs3zaNIMyinAIt+uFTKX9Y4t7QcXFHtmjmxN/pVaiYtDt2SsBELESiX0c1gAvKRY6EKlGlQUpQbKBDIVPIS3+rdYQ4ZGByUew3Zf3qkbfHVnVgzQZ6UUw2DvBvaguAIjhf3/RTebV27J5F9iizh2EbvakEHOnOWHWN0IddSEc0TkjwfSP2YRRrVncZEHtuRQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(376002)(136003)(39860400002)(86362001)(26005)(52536014)(4744005)(6506007)(2906002)(71200400001)(5660300002)(83380400001)(122000001)(316002)(55016002)(186003)(64756008)(66446008)(66556008)(38070700005)(38100700002)(33656002)(478600001)(66946007)(8936002)(110136005)(7696005)(76116006)(9686003)(8676002)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WDhDd0szN0c2azNVVW9kUmdra0VCanlXZXdESG1pV3JJVENCRW5zcWdHekN5?=
 =?utf-8?B?LzFhUmQ2TEJQUmtPWVhjRXViY0RZSlgxajFNQUU0OTRkd05vWTNWdlVxSEJr?=
 =?utf-8?B?RFhNOHdsV0gvZjlFdnJ0Q29BYTlsTUMxekdKcVl5VFJ6SjZZamlFOFh1YWlR?=
 =?utf-8?B?cUtIR3hEeTczNVA0SXRXMGNoSEdHNG0zelRGajljNDRLV2ZIWS9WMUZyeldk?=
 =?utf-8?B?YnoweEg1bENpR3Jxek1RdXNtMDQ5bTRncGQvaXhiNkVNNytLV0FpbUJuQUNV?=
 =?utf-8?B?eTdTSFRQem9ySHF4RUJWK25XK05OSHpvZ0tqK29LNkphdnlWekhieUh0T2lX?=
 =?utf-8?B?YlZJSlJvQXZoTW5IdmlZN1lueTJ6RjhCN29CNFJxWU9YdXhFRUFoMW56Mlho?=
 =?utf-8?B?Y2t4VlBFcEdlSE1jS2xEWTJhai9iWGJzYUNIN2lRdmZxbDlhd1RncEpGWlgz?=
 =?utf-8?B?OXdGeUcrRzZ4elJNNnBvV1k4YTREMTJsK2FFWmV5R2czTmRqWWlaRjJzT2xj?=
 =?utf-8?B?NGpKbHR4a0F1NTRuUmNyQXFhemRVS3VTVDBuMUxxVHlwSWpUaDRwODdReTFB?=
 =?utf-8?B?UTlDUS90TkdvcE5sRy8zZ25nMUVXRWJZY2I2clBHeTczNVd4SVJadmVLTCtV?=
 =?utf-8?B?TkJ3QnkweFA5blBiemt0MTJpUzJ5c3hkSHd2M3RvZ0RNOEZubi9LZmZYMklo?=
 =?utf-8?B?M29wNmxieG5jcFp3TjlMZEVTWUQxbTR3NkxVUnRaelBaTEJsb2c2ZjJTSXRH?=
 =?utf-8?B?VTNyRjZQUGNXVTJpSjNoOVdvSFdvSmdxelVaRWFEU0V4NXFEbytlYkJZNGRv?=
 =?utf-8?B?ZHZRM3kxTUNCalNwWmJnWkVka0F2UU52WTVkS0o3R2U5RWwxMjBXUEtEQkt5?=
 =?utf-8?B?OGswSzNhSnZZOFZTNURlN0xIWXU2YmFZN0hUTktQcXZWUHdyeTFZeE1IUVpV?=
 =?utf-8?B?YXIrYjBqc1d3R29nTkpRUE4ySWJqTUo2TnE0d3ljRTNyWGpIVXBibEZUWENh?=
 =?utf-8?B?cXVHRmtRb2s2MU1YOHY0U3ZHS1VXcTI2UEhENVRMNmJkeFlneGloWUF0bWhQ?=
 =?utf-8?B?MnBTbnl6V2VScmcyTzhMUjdiVDRwMmFVZms4aDgzLzRzNkwwQWVSMkRiVTdN?=
 =?utf-8?B?RlZHbk82Wm5FRGtOQ0NvTTdyV05aVlhHNmJlMGRvUi9xWTJhN1IvMGN3TDRJ?=
 =?utf-8?B?RnhsOXNpWkIwdnNZT1pDcGRpUVdSbnM0VEdKMnJXSG1JZ20zbm5tem9hYU5k?=
 =?utf-8?B?UTIvWWczWHl2Q2J2R3Nna1NlMXJwenFEMlhSM0thY1NPR3ZwampCaE1VYVVD?=
 =?utf-8?B?STM5bmZRU2gvY1h3M0k2N1VRUUFjVUhrcTNWNCtmbGtuSk03dXgzQ29Jbit0?=
 =?utf-8?B?dEs0TWJPVVJSM0VPVEUyWEpNRW5UclI4RWRzSjg3dVBhc1JXWXhzU0QrejNI?=
 =?utf-8?B?Si84ZnFYMlpUZ2Mva09jaHdyVnZ0dXg4M2lKZnVwRmRuVVJKNVFTbDJBeDh4?=
 =?utf-8?B?NXkxL2MzMlFyeDZRRStLNE04MVBteDZXVW14UVZlVHVkQXdOelMvZ1BxUnJG?=
 =?utf-8?B?ZTVrNTRCKzhlcW14SDRjeDdFTTNEa2U4YjZBaWM2V1BDOWtlQ0hnbVZBOFJk?=
 =?utf-8?B?UFVqZERrWFFHdGN0U1hoaXNzR3VRdVl1OVFiOHQ3QUM0T3hwV1pEbThqWVU4?=
 =?utf-8?B?Q29PZVZmQklFT2JRNkJWVmJlZmJHVDJqaUo0UmpNVHVmRnJZZ1Z5SlVZWFNq?=
 =?utf-8?Q?A+rog2QwN6PqhmJMX8=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c180f24-a48f-4a43-3a98-08d96113ba72
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2021 00:12:40.8777 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +NrwwyPiBUsi5VTTcdUnMCZt+lBAKOSdbvxlUGM+5HClpoq7vB71fom9x9xV/HPjUumtp1g7OF1LS3nzm8rouA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3098
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

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEJyYWQgQmlzaG9wIDxicmFk
bGV5YkBmdXp6aWVzcXVpcnJlbC5jb20+DQo+U2VudDogTW9uZGF5LCBBdWd1c3QgMTYsIDIwMjEg
ODowNCBBTQ0KPlRvOiBSZW4sIFpoaWt1aSA8emhpa3VpLnJlbkBpbnRlbC5jb20+OyBCaWxscywg
SmFzb24gTQ0KPjxqYXNvbi5tLmJpbGxzQGxpbnV4LmludGVsLmNvbT47IG9wZW5ibWNAbGlzdHMu
b3psYWJzLm9yZw0KPlN1YmplY3Q6IFJlOiBSZXF1ZXN0aW5nIG1haW50YWluZXIgcHJpdmlsZWdl
IG9uIHNtYmlvcy1tZHIgcmVwbw0KPg0KPk9uIFdlZCwgMjAyMS0wOC0xMSBhdCAxNTo1NyArMDAw
MCwgUmVuLCBaaGlrdWkgd3JvdGU6DQo+PiBCcmFkLCBjYW4geW91IHBsZWFzZSBhZGQgbWUgdG8g
dGhlIE9wZW5CTUMgb3JnYW5pemF0aW9uIGZpcnN0IHNvIHRoYXQNCj4+IEkgY2FuIGJlIGFkZGVk
IGFzIHNtYmlvcy1tZHIgbWFpbnRhaW5lcj8NCj4+IFRoYW5rcyENCj4NCj5kb25lIQ0KW1Jlbiwg
Wmhpa3VpXSBQZXJmZWN0LCB0aGFua3MhDQo=
