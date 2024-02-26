Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5144D867733
	for <lists+openbmc@lfdr.de>; Mon, 26 Feb 2024 14:50:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mP20d7tE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tk26x16p9z3d2g
	for <lists+openbmc@lfdr.de>; Tue, 27 Feb 2024 00:50:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mP20d7tE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tk26P5xttz3cB0
	for <openbmc@lists.ozlabs.org>; Tue, 27 Feb 2024 00:49:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708955374; x=1740491374;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=EOTHic/29VmD7gqnzpyl+QKYl6uPUjlKv9NSP1wuxJo=;
  b=mP20d7tEKlcIfPxns6O0fSOgZ3nvxyhx8QARI4YTvGgbL2EjPfvwc6wV
   OXEw0oMxJ41gusP+TU/7uucvE9R4GgprACSN73WDgm2j9J6KOpapwBIwE
   G0iCa0p8G1v2JYiYqsS5WTfRGtcUdWRzjRmmQMhqqVRzBrT5BESZq+I4C
   5fV62+vJKIhgITK5lTWLpK4eDGBoY/kqanR56qGnLVFJoSTm/oc6fLDaP
   /zxoPNG9Jv6LKiBe5vpuZGGuJPzIcz5wol4WrmnfLIiRm8U9C7SAtn4p+
   L64GwXnRNrUCOJYs6lha+/43gjmw/o90s3F+oV3h7IxU/UaRPRfpjynDl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="14655057"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="14655057"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 05:49:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6705384"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Feb 2024 05:49:29 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 05:49:28 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 26 Feb 2024 05:49:28 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 26 Feb 2024 05:49:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yo0ZJeMdxMlz6qfotpMfm/XROJ4Wjf7+ICBKtWln0eVmm4N2P4beChIodDbwataCttxFI1BIyeyQmAtgrQ13Qh0pld4QVGXFHDu8qSqwlnAYhc2CMzCaquFq3QnyXFCWtF9A9sSHhtl8OmyKAYndmd95J9HmcpATQRxaYcSTPMtDxZnQOKViw5t/z2j3Vsc6LIPBn7VkFF9JbZ4idA1apdJ+REqYMV+Ep7+Da1R/o59HYot5XZNkv3qX84vCxIf/Z1iwCiTB7MsmfPdiSrAlG0H25Dgj7BvlrRduSUIIuiz9SddhPlNCOZWwWzOTySGos0gG+snrNf55mV0pA8FXtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOTHic/29VmD7gqnzpyl+QKYl6uPUjlKv9NSP1wuxJo=;
 b=T1dgKDRMyEeypyPuPX+vyuuBdZNhEMLkbGDAPjlN8/pel8oy3kfidBtmb36/NpCLnOR6EYoL8PY3vZagQ4DGQlQmqB8MPsWTTXVoku1Lc/yi/lNlRlEuNZKQzq0uEml8I0dWxh2J5o64TQuF6IjKbuc0w5uv+tnk5KFV3kXgsgwGkDH0o5obftPH7wC+esYfUlFzqRzf7rCDb38nUb9jnwIsn2f6vbM4W9fsFT06EbdMmq52OO1v3p0Cb3Xg7InBuBGzD5e38mVI+I3sloAZLMDTuEk6HnbWVJWixb92itTGMLkVLUgeLoN/lOZAJq2ZnKGvlQIsxrNNC/YpaZtLFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5330.namprd11.prod.outlook.com (2603:10b6:610:bd::7)
 by PH0PR11MB4789.namprd11.prod.outlook.com (2603:10b6:510:38::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.24; Mon, 26 Feb
 2024 13:49:22 +0000
Received: from CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::5627:e6de:5e36:aacf]) by CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::5627:e6de:5e36:aacf%6]) with mapi id 15.20.7339.024; Mon, 26 Feb 2024
 13:49:22 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "ricardo@marliere.net" <ricardo@marliere.net>
Subject: Re: [PATCH] peci: constify the struct device_type usage
Thread-Topic: [PATCH] peci: constify the struct device_type usage
Thread-Index: AQHaYzAyburtmiWPLE274LHcULqZcbEcrtKA
Date: Mon, 26 Feb 2024 13:49:22 +0000
Message-ID: <ad75133abd5a56f7fd46899df38aaa086eab7edb.camel@intel.com>
References: <20240219-device_cleanup-peci-v1-1-0727662616f7@marliere.net>
In-Reply-To: <20240219-device_cleanup-peci-v1-1-0727662616f7@marliere.net>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.2 (3.50.2-1.fc39) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5330:EE_|PH0PR11MB4789:EE_
x-ms-office365-filtering-correlation-id: ec436c98-3b2d-4561-3ca4-08dc36d1bd0a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +pE/K8PzCHLkP6c9kZyX+IXOUsirtmNGxY16VdW5vpvI9GNpvWjGQZeYHIK8znHzSYUBFB9avTOUFgwAOpr45aJFbV7RM4i1HvYHz1225iv5FK0CEYmWXWV14TjheceenqcTIECIoL3K0yummxXHQPQA6xiPEmGsGqYrMH0Dc6bHqgdcWXtcJWrW9lvqXjyRHUZsb9MkdQMAUBvmstyKzfHpAMagv6JixkylEJCN61aHvMEHQep/4SJW6jeJaKfNgzJ9Ssl7IzO9JnCTF/APEINYQqAeTUZ1ravbaXVaeCR5/b7aJBUGxpE2BxP/0zzct3FQzaBu1BpRDc+yAVDX81+uadS9j5PaGnJDIKXe1haXFY5JPQgMY12mqkbApfpDSGm/ewGf04/INfYf6nc3DUkCnfNhth02hE7jMDWvQVb/DCe78Okz409h8QeeJxhCgBUTPF1/g6SOzuqqIgi5tFVZwfbmhNFwwQKhh1vgbE0D+d5Ij7XH1SU43mLt8AnCifOHpr0MR3yzCkL7A3IfkW4gLcZj4QK3sXF8vdHo+45DHtIqNNEKGrLtDzO9gubhBUuLwGK1bqFCas8hFOPHdrxHp0UOOyqsON1fp/8RpAuURoxmEtLw/mQrqTvlhMh4z+YSzV8s2f7KUQEgWyCojf0nmpwGVysM2bsRaO1B4/ZGympEQ9R+cj3sasJmEmO/RwcQoWwKGrBRvRWv/8YN7Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5330.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?anMrU3RwVGd1OUcveVU0L1FBa2lSWE55V3pjUFF1YlBoMm9uYTdjZmpySW0x?=
 =?utf-8?B?dEpYVkhKRHV6UTBBaW5JTjdCSmE1QnpSR05NaTNnZ2pYTVk3eXVQOW9tQ1Rz?=
 =?utf-8?B?cmUwWXZ5eHY1ZHVFQlpNd3BGQmRRd240Unl5d0hQdGx0Mk1jcXZCc0prN3dZ?=
 =?utf-8?B?K1plT0ZHY1luYkVjVS9YWTE3ckR6QmdUOTR0VmhrYXRqYUswNU5MY2czTDk2?=
 =?utf-8?B?MjIvTjhEaG4xK3NhbGxvMXRaa3pHbDZBU0tvYnZxL3M3STNYbHJ4Tk5VOExF?=
 =?utf-8?B?bVZVZm1kTi96RDAxK0tzYjRyWDU2WmFZUEhPRm9rMHpiNFVvOTNmcHBCVHhR?=
 =?utf-8?B?SHd4aDRzaGNCd2JCSVJPeFd2MXFvU2ptbXlBMG9uQi9IWmVJd0d5SzFhMDAy?=
 =?utf-8?B?NHdsNVdHQUZYYitYLzZBazN1VXNHOCs0Z3M3S1E2OGwxYnhHMEVJczhNVGE3?=
 =?utf-8?B?d2VWUzZPSk5GdEZVWGZVZTZEazh3VEthRHlYckxncXNLWlR0bnBBUGhXOUxJ?=
 =?utf-8?B?MG1UZFlpVEx5UThYMWJOM3IycW9XcE9PWEZpY1FLYmx5eG9tMzJXd0Fvbysz?=
 =?utf-8?B?N056RVNpaFo3bEJLUzZEM0tjejh1YjRkQnlNbnovV1hQQm1YMS9oWkVTV2to?=
 =?utf-8?B?c1Y5ODdQaFpTbzBwMW9ja2dCd1hzYmtuUjBzZ3lXSEFyRGRUM1MxLzI5WTd0?=
 =?utf-8?B?YWV0c2trRHYwejNqQXRNalRsLzJ0a3dyR2N1ejdyNGFDZTk1SlFqeXNwQ3Jl?=
 =?utf-8?B?dGZ6cG5QUGhONWdIMy9IOXNQQlFOV3RZVUt3RWo1NDhIU1FSem81MmlNNzFs?=
 =?utf-8?B?ZGxGaWdJNWh1T1JkZEFNNlRKV1dMMm54S0JnMHpXQjgydTFNWUNOWHN6c0xp?=
 =?utf-8?B?UHJIV3QzSE5oQXhkUnRyUGpESnFpTmZpVUZVREwrQ3F4ODhhbjdIenZwdE1J?=
 =?utf-8?B?cG1Qb3ZQVE9tRFhhbXVrSGluamdjVUNUTVFkSnVUbzI0S2d2VVRVTDhrcVlD?=
 =?utf-8?B?SEEvRlpCc2M5Q2dzcTh3WDBVbWF3bEg5RHJhREIvMlh6bzhGQXN0bjRncDJ3?=
 =?utf-8?B?SU1Sb3FaZVh0MGFMM2VVVFl6TEduNTlXVE91YSt3eVpPTkxBU09rN00rbWRy?=
 =?utf-8?B?ckJBNEpkWUN0SGJQT3NZbjFhajVYcm50M2d6YkpBNExZN3hkNWUvWnhBSlZL?=
 =?utf-8?B?Rkp5QVQvcFdnTGUvTzVpSFREQUtSKy9hRlJTZ0lVN1Z1WUhQSnRkWm1YTTVC?=
 =?utf-8?B?Yzh0YW5jZWh3b3cvQm1zWXdFSitka2VkOGdYVlRGcjdSeElUNUVBeTVmVndp?=
 =?utf-8?B?ZldmWWtTdXVPanByWkNLRjJjY2RnMmtLU2RjeWJKVWxub08rYS9mQ2U5MUpS?=
 =?utf-8?B?MnZVMUZuOEJCbWV2Qkx6bGgrRHBucU9kY0ZtV1dlMXJQaGVhUFB4SmR1TGxa?=
 =?utf-8?B?MS85UjFzam1Za3JUdmhWRzd1eEI0U2FGU0IwQW8wamNJcFhnMWZmZ0Z2OEt1?=
 =?utf-8?B?Z2wrMy9POGx2Ni9xdG1ydjNKVWRCa2YvQk9UaVE4Q3hxd1QySEt4MmE1UUtR?=
 =?utf-8?B?N2xla1FMVTB4OFp2VktsRE52cG4yQU1odXN6a05mWkgwUjltY0wvK0swWHJO?=
 =?utf-8?B?SUEvc04rMUVjb1lWSndnc2Z4bkorbXAzR1QyazJZNzZJTmVxZTJQUHViU29j?=
 =?utf-8?B?aFpCVzR4ZHRxQXR2WWR1bWR4VFdFbzIzL2VGWUkwVVhDYVlEcmhJTkJuUnMv?=
 =?utf-8?B?NXNEbk83MWl3dG92c1d1N2d3ZnhNaWdqU2VtT24wd3dwak03RENGVUg1VXJH?=
 =?utf-8?B?WGRhS3VwQTlvcVhMT3ppcWRLRFphMHNxNDBxQkU2dXNsMFYwUlJMaDhLVHUw?=
 =?utf-8?B?V2cxY3pmckNtR0RIaHhDcGZSWi9qZmZTWk13UVdzQWxHZExCUnl6TytUdHBZ?=
 =?utf-8?B?bWlHQVlyemtnTEtpdmNEblFNWVFxUXU2L2dORUhUcWdZdTZzakFiUzBlb0JI?=
 =?utf-8?B?SFBWeEo3WXdjRTJRYURoSC90WkErM3p4K3ZMVy9JZ1FJWGxoeVQ0bi83Q3B2?=
 =?utf-8?B?dkFiRWY4K2pJNzNJdzJ0dmk4eHphd0RzWGpUT3VoU0gzTTlGWnNtNXZEbnI4?=
 =?utf-8?B?TnUxSU5pY1FGVTUvQVRJMUtWc1phRUgranhTYXp3QVFZd3VOWjJUc1dLTFRQ?=
 =?utf-8?B?Mnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5C95E345603BE3439474F2789AB0F284@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5330.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec436c98-3b2d-4561-3ca4-08dc36d1bd0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2024 13:49:22.7097
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oY5Ih25Vm59hdl1NdNjEbu8hkKCjeWTENxpOt6rRoWMizw48iKpDH7nkuBz4+MMzQT9nW3ovTG8CjxEChZnM+AqzNhqBhvxlvVbvDrUUxvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4789
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gTW9uLCAyMDI0LTAyLTE5IGF0IDA5OjM2IC0wMzAwLCBSaWNhcmRvIEIuIE1hcmxpZXJlIHdy
b3RlOg0KPiBTaW5jZSBjb21taXQgYWVkNjVhZjFjYzJmICgiZHJpdmVyczogbWFrZSBkZXZpY2Vf
dHlwZSBjb25zdCIpLCB0aGUgZHJpdmVyDQo+IGNvcmUgY2FuIHByb3Blcmx5IGhhbmRsZSBjb25z
dGFudCBzdHJ1Y3QgZGV2aWNlX3R5cGUuIE1vdmUgdGhlDQo+IHBlY2lfY29udHJvbGxlcl90eXBl
IGFuZCBwZWNpX2RldmljZV90eXBlIHZhcmlhYmxlcyB0byBiZSBjb25zdGFudA0KPiBzdHJ1Y3R1
cmVzIGFzIHdlbGwsIHBsYWNpbmcgaXQgaW50byByZWFkLW9ubHkgbWVtb3J5IHdoaWNoIGNhbiBu
b3QgYmUNCj4gbW9kaWZpZWQgYXQgcnVudGltZS4NCj4gDQo+IENjOiBHcmVnIEtyb2FoLUhhcnRt
YW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPg0KPiBTaWduZWQtb2ZmLWJ5OiBSaWNhcmRv
IEIuIE1hcmxpZXJlIDxyaWNhcmRvQG1hcmxpZXJlLm5ldD4NCg0KUmV2aWV3ZWQtYnk6IEl3b25h
IFdpbmlhcnNrYSA8aXdvbmEud2luaWFyc2thQGludGVsLmNvbT4NCg0KVGhhbmtzDQotSXdvbmEN
Cg0KPiAtLS0NCj4gwqBkcml2ZXJzL3BlY2kvY29yZS5jwqDCoMKgwqAgfCAyICstDQo+IMKgZHJp
dmVycy9wZWNpL2RldmljZS5jwqDCoCB8IDIgKy0NCj4gwqBkcml2ZXJzL3BlY2kvaW50ZXJuYWwu
aCB8IDQgKystLQ0KPiDCoDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGVjaS9jb3JlLmMgYi9kcml2ZXJz
L3BlY2kvY29yZS5jDQo+IGluZGV4IDBmODNhOWM2MDkzYi4uYWIyMmQ3ZDE5NDhmIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL3BlY2kvY29yZS5jDQo+ICsrKyBiL2RyaXZlcnMvcGVjaS9jb3JlLmMN
Cj4gQEAgLTI1LDcgKzI1LDcgQEAgc3RhdGljIHZvaWQgcGVjaV9jb250cm9sbGVyX2Rldl9yZWxl
YXNlKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gwqAJa2ZyZWUoY29udHJvbGxlcik7DQo+IMKgfQ0K
PiDCoA0KPiAtc3RydWN0IGRldmljZV90eXBlIHBlY2lfY29udHJvbGxlcl90eXBlID0gew0KPiAr
Y29uc3Qgc3RydWN0IGRldmljZV90eXBlIHBlY2lfY29udHJvbGxlcl90eXBlID0gew0KPiDCoAku
cmVsZWFzZQk9IHBlY2lfY29udHJvbGxlcl9kZXZfcmVsZWFzZSwNCj4gwqB9Ow0KPiDCoA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9wZWNpL2RldmljZS5jIGIvZHJpdmVycy9wZWNpL2RldmljZS5j
DQo+IGluZGV4IGU2YjBiZmZiMTRmNC4uZWUwMWYwM2MyOWI3IDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL3BlY2kvZGV2aWNlLmMNCj4gKysrIGIvZHJpdmVycy9wZWNpL2RldmljZS5jDQo+IEBAIC0y
NDYsNyArMjQ2LDcgQEAgc3RhdGljIHZvaWQgcGVjaV9kZXZpY2VfcmVsZWFzZShzdHJ1Y3QgZGV2
aWNlICpkZXYpDQo+IMKgCWtmcmVlKGRldmljZSk7DQo+IMKgfQ0KPiDCoA0KPiAtc3RydWN0IGRl
dmljZV90eXBlIHBlY2lfZGV2aWNlX3R5cGUgPSB7DQo+ICtjb25zdCBzdHJ1Y3QgZGV2aWNlX3R5
cGUgcGVjaV9kZXZpY2VfdHlwZSA9IHsNCj4gwqAJLmdyb3VwcwkJPSBwZWNpX2RldmljZV9ncm91
cHMsDQo+IMKgCS5yZWxlYXNlCT0gcGVjaV9kZXZpY2VfcmVsZWFzZSwNCj4gwqB9Ow0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9wZWNpL2ludGVybmFsLmggYi9kcml2ZXJzL3BlY2kvaW50ZXJuYWwu
aA0KPiBpbmRleCA5ZDc1ZWE1NDUwNGMuLmZkZGFlODZiZjEzYyAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9wZWNpL2ludGVybmFsLmgNCj4gKysrIGIvZHJpdmVycy9wZWNpL2ludGVybmFsLmgNCj4g
QEAgLTc1LDcgKzc1LDcgQEAgc3RydWN0IHBlY2lfZGV2aWNlX2lkIHsNCj4gwqAJdTggbW9kZWw7
DQo+IMKgfTsNCj4gwqANCj4gLWV4dGVybiBzdHJ1Y3QgZGV2aWNlX3R5cGUgcGVjaV9kZXZpY2Vf
dHlwZTsNCj4gK2V4dGVybiBjb25zdCBzdHJ1Y3QgZGV2aWNlX3R5cGUgcGVjaV9kZXZpY2VfdHlw
ZTsNCj4gwqBleHRlcm4gY29uc3Qgc3RydWN0IGF0dHJpYnV0ZV9ncm91cCAqcGVjaV9kZXZpY2Vf
Z3JvdXBzW107DQo+IMKgDQo+IMKgaW50IHBlY2lfZGV2aWNlX2NyZWF0ZShzdHJ1Y3QgcGVjaV9j
b250cm9sbGVyICpjb250cm9sbGVyLCB1OCBhZGRyKTsNCj4gQEAgLTEyOSw3ICsxMjksNyBAQCB2
b2lkIHBlY2lfZHJpdmVyX3VucmVnaXN0ZXIoc3RydWN0IHBlY2lfZHJpdmVyICpkcml2ZXIpOw0K
PiDCoCNkZWZpbmUgbW9kdWxlX3BlY2lfZHJpdmVyKF9fcGVjaV9kcml2ZXIpIFwNCj4gwqAJbW9k
dWxlX2RyaXZlcihfX3BlY2lfZHJpdmVyLCBwZWNpX2RyaXZlcl9yZWdpc3RlciwNCj4gcGVjaV9k
cml2ZXJfdW5yZWdpc3RlcikNCj4gwqANCj4gLWV4dGVybiBzdHJ1Y3QgZGV2aWNlX3R5cGUgcGVj
aV9jb250cm9sbGVyX3R5cGU7DQo+ICtleHRlcm4gY29uc3Qgc3RydWN0IGRldmljZV90eXBlIHBl
Y2lfY29udHJvbGxlcl90eXBlOw0KPiDCoA0KPiDCoGludCBwZWNpX2NvbnRyb2xsZXJfc2Nhbl9k
ZXZpY2VzKHN0cnVjdCBwZWNpX2NvbnRyb2xsZXIgKmNvbnRyb2xsZXIpOw0KPiDCoA0KPiANCj4g
LS0tDQo+IGJhc2UtY29tbWl0OiBiNDAxYjYyMTc1OGU0NjgxMmRhNjFmYTU4YTY3YzNmZDhkOTFk
ZTBkDQo+IGNoYW5nZS1pZDogMjAyNDAyMTktZGV2aWNlX2NsZWFudXAtcGVjaS1hNGY4N2M3Nzcw
M2ENCj4gDQo+IEJlc3QgcmVnYXJkcywNCg0K
