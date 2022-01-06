Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BB9486790
	for <lists+openbmc@lfdr.de>; Thu,  6 Jan 2022 17:23:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVBVQ0ZSBz30Lb
	for <lists+openbmc@lfdr.de>; Fri,  7 Jan 2022 03:23:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m2N023Sl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=jiaqing.zhao@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=m2N023Sl; dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVBTw3JNLz2x9V
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jan 2022 03:22:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641486180; x=1673022180;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zjSFG665ppmwjq8MIpSBLntNWyEB4EUhnjnBbb47XrE=;
 b=m2N023Sl1D0HZLgKIehkly9OGvevaRZ8MH7GeANweHTNx8kkgvnfsNYe
 hltM9vIACOFjONzXUM8N4KU/ksJtNT/wRoAxylb/95R+yrxoeDb1a1JYD
 9mP+6sgZlM3kb+4RJKPOFXMMbEMusYOfOC2p5F893Rnl+B0XXdhkbiQbm
 uurZUheI54lgjANQCoa0qtqeSGF/ttAYB86G9MUpngcTjjxSUS72VsPEe
 mI7QAe8b0+rAWBRVc/hCmzQsTERhjSjnKg8RhjgfTSUWfJxE7nr9afoya
 U40R7r6EwxirKtWFlOhBjd1syMcLIf94LHSPpW0tZ7/1U/kTf9mTxA33x A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="306037125"
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; d="scan'208";a="306037125"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 08:21:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; d="scan'208";a="527001171"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga007.fm.intel.com with ESMTP; 06 Jan 2022 08:21:50 -0800
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 6 Jan 2022 08:21:50 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 6 Jan 2022 08:21:50 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 6 Jan 2022 08:21:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RU55Tcxc0sDt8mMctPR09MOG0XY+NpLMy1GB4n1oekkjywT35Tr5aNAYlme+b12aJw4XexFOiZSdPCKMO/K/Dn5E/GCcWXvgtMSSSr/7f8QOKQ3gw/ZBIkHismo8z9k5WxOA7DCOSr89QQ5RnIshHetb4aoxWOam+m9qbHNxHg2ob7BHc7EguKmpdeotcgecIjYEGg3qbd53LI/iu+AQnwQtcAPJfwdTldIdnoE9RlqXSAnosKOa+MTrCkN6E6WXAtpQ1YnjKNZt1BnYZFfN0q1X0Lxmx36boA2faqlijp7tsfI99AZ53FRwexXzZS6ubeu8s87alnEoJJzJRoNDoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjSFG665ppmwjq8MIpSBLntNWyEB4EUhnjnBbb47XrE=;
 b=JZ5JlFig9D7JnDT6ryYTffc9E9DeFDkKz2EGbZAovq56DeAp/NNq2dUSvsOkptpO+29pv8tp4hf1BXJBXpMoZ7FX3XHmss3gohrpWvbOgpBnV7vEB1PGkunjJlETbnQ+rmOfAexa2XltKna/SKVWVWtWcrbPpVNq28+dZmcMVORkWOnbVHKygUH6skUxoB199QEA5AaPghlqH4yMskbjcVFRZm5kLVGFtY5FxOvHEi5FVDFGBxY6r2+8hgPhT9yEXqYsxZ5hehG0dPcsbkwhELzxIiFbd9gJu+iwdx4l9UAx31PEpUfrveBsIccG8bWvWXHLRHJnq/JnhaS8dp9M5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO1PR11MB4785.namprd11.prod.outlook.com (2603:10b6:303:6f::21)
 by MW4PR11MB5773.namprd11.prod.outlook.com (2603:10b6:303:180::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.10; Thu, 6 Jan
 2022 16:21:45 +0000
Received: from CO1PR11MB4785.namprd11.prod.outlook.com
 ([fe80::5835:30d7:a41d:c8b]) by CO1PR11MB4785.namprd11.prod.outlook.com
 ([fe80::5835:30d7:a41d:c8b%7]) with mapi id 15.20.4867.009; Thu, 6 Jan 2022
 16:21:45 +0000
From: "Zhao, Jiaqing" <jiaqing.zhao@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Configuring VLAN interface via redfish
Thread-Topic: Configuring VLAN interface via redfish
Thread-Index: Adf9o9dB2um6eb+4SWiXkEgQuFq+hwFdH8Zw
Date: Thu, 6 Jan 2022 16:21:44 +0000
Message-ID: <CO1PR11MB4785A886A5EDDA181994FC1C8E4C9@CO1PR11MB4785.namprd11.prod.outlook.com>
References: <CO1PR11MB478536190313942A25F149BB8E459@CO1PR11MB4785.namprd11.prod.outlook.com>
In-Reply-To: <CO1PR11MB478536190313942A25F149BB8E459@CO1PR11MB4785.namprd11.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: d6721587-5dcd-4ff3-41f8-08d9d130a1a4
x-ms-traffictypediagnostic: MW4PR11MB5773:EE_
x-microsoft-antispam-prvs: <MW4PR11MB57739E03677D50D27D1FAD0B8E4C9@MW4PR11MB5773.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jm6MET1O7EojNBK8eyD3JuNQEy/12vWlakPKD8SgTTJEPoW0dEP1J/SiwY+nFRDjcT7UMAmPaN26Rk0yN943CJ3aacudSQE3R5m914BlPViPJuABbcRZYTzGYj8uIw0xPave7qrfUAVCTnjLPSpHZk1q3wV7i8HenDuTll+UIL5OTvHbloOFrMNP3pAPhaSwh71f4PuVF0C/RgeLy+2y6lzaRQi7HPZO1WIGGgxWaQg5xoP9Fmh/gclIgjaEqXMfaLhSHv6CYCc9TPC0+sgNz15GD9hQETlwBfuSfuxNZ5V99SLqzcugX1BXQEsInwvPfx1AiQ/dcYucny3IRMawHenSatptYq9cpGdVbOFMBtyuP1auPWaGAUyAAsF5zyXlPdRpuswLh8ULAV+eFDSBR1OrFVEed2Ukmb5xRDwoWg3blk/4dHIp1cQqJHB2EK8MUR1hyNuY6MoZTJc1yT8717Li1emsk21pE+4qPIIpvRshfjJ6G+QieYvn+wqZKOQaJOAoqEjiahc9OHLzTTgo8ZlV5Yf23L2cOWyZWThhgP5iekzFuOFgNpTBop3qvzuYVEx4Sh8SeV7dGs6sza5UuQT37rTZNKcfaeRl2sCfbuWGn+4JTmyfBlkn9RIP4Sxgdy6WmCdlW8FOS496/mwPEQwUc4E2FBdXhFMCWZGKsbrJX9k8Dc7goQISU7bjAafY+wl3rketN4MfX51Nqu+vStTVCz+PTBimf47O68GSGNkEve4Ul1OD9z53zbddWe+nwNPCwPrwl73fDnOg+jME8Pyfe/bfGX/XLZ1zCl6Jxvs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4785.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(71200400001)(83380400001)(8936002)(6916009)(6506007)(508600001)(26005)(38100700002)(966005)(66946007)(9686003)(76116006)(2906002)(122000001)(7696005)(8676002)(55016003)(33656002)(66556008)(186003)(38070700005)(52536014)(5660300002)(64756008)(82960400001)(66476007)(86362001)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d0hVQ3F0c1p6emRrMUZQL1RmUlBCWkU3L2pSVWx5WUVteUp5TTV4bnQ3dTNa?=
 =?utf-8?B?bnlmeFBjTjQzYTRzdnpCN1dtRStJTkUrYTJ1dlBLNnRQejVnMFU3d08wZ01T?=
 =?utf-8?B?NTZCcU5Tb1F3UjluOGJTQkt3MCs2ck1NYW1jeG1rcTBRaTg1ZGZuU1p6bnBY?=
 =?utf-8?B?V3ZwMERLVEwrUEZxQkJHcUtzZm9kRjhhL0o3dWw0ZWVPeCtXWm5vRWY5dDNE?=
 =?utf-8?B?M3VWbEFzYjZqcVpYQy84WlJpUjBqYkE3UElocmNydzZUWmVtWXYzM2FCaGRE?=
 =?utf-8?B?SjhsTjNiVE9hNXFaM0VoWWw5cjVjNnNYNGRQbStGNU1menp2WmFvNCtPQ0pC?=
 =?utf-8?B?QS82MHZpVmZkSXNtQ2Rwb3h6dkVVSlRmU3hFT3hpdWU3SXphcDVIWGhqam5I?=
 =?utf-8?B?QjVLaG9QT3p1WmhrUmt0ZmsyNmRVbFRJOHFRNjc4ZGM5eUhSdTVQRjB1eHVU?=
 =?utf-8?B?NDJxUW5VZTdZcWR1eUNuVWN3Mm1SbjRNc0Z2R0toUUYzYjBCR1RSLzUvRGhJ?=
 =?utf-8?B?a0ROVXFyUjlFVTVQUGJLWmRlbnRTQjd3aWdaNnY0S3JoRC9iMFFwbGIyODdZ?=
 =?utf-8?B?ZEhRNm5mbFMvaTdVOWZBOGpVeU5iYVNPNCtyVjVQSzRKZjFNc1grV3JlL0I3?=
 =?utf-8?B?ZjdaZDlPaUtKOUdDa1BoZVVQVlBFRnhLdnlJVGRrNlZBOVBWckNxQ1FxYmlh?=
 =?utf-8?B?RDVocS9DbXhQck9LNm5PanVNd2Z3c3BsZy9pRU54Mm5teFFGMFdQQmhuNVo4?=
 =?utf-8?B?YXkzMC8rZGJCbm9SVXRPZ0NPdkJmY2luNmYyQWxmNnlHU3RRemlpVFBxY0V2?=
 =?utf-8?B?QXJUKzM4bVJlQjhaRHozbTlpTVZiSmhhLy9MVkxwWlJhTEwrWEFDSkhYejB3?=
 =?utf-8?B?VVRLTW92QU9aT1cwM1J5ZGh4dWF5czZ6by9MUkViSTk4YWh3OGVuWlROL0VY?=
 =?utf-8?B?ZTRJUXNmRHRodEVqUERqK1dLbURZVWhOTWRVSmlBajVQZ3Y3eFpTeCtQOVVQ?=
 =?utf-8?B?QXFaVm5LWEVwU1h0UGxUdDlOVFJ5L2lMZ2ZtV0dNMWg2cTRvQkJmS0p4WnlV?=
 =?utf-8?B?Vm1rTEs3UGtwb0VQMFB5aVpXRTMwTkh2TG9tY1Y4NUFpRldYM0w2a1hmYTFu?=
 =?utf-8?B?RG9OUkYvem42akFnRWRsc2pGTThwMEozTThQYWRUVEtLYXo3SHQxVWN1VUpX?=
 =?utf-8?B?SVRLMUVjbE9MT3hqR3lGNUJVYk4yMmYzcmN6b3EwekJicFE0OHFSc1pRT2FR?=
 =?utf-8?B?dGRmclJDK3hFeDFVek9nWGZZV1ZzcjdUVDlvQVdnWG50SkxCdWsveHY1cGIr?=
 =?utf-8?B?WWcweUptNGpVbHBWZXdqeHREMTRSV3hqTGFzTER3N3ptd05Bd2lTMnJxK0Rq?=
 =?utf-8?B?ZFZ0K0ViS1d3QzBFT0M3Tk42bzQ1MzNhRi9mRzFwZVRVdmxlSzYvMFNaTXRt?=
 =?utf-8?B?c2V4d3ZBNlNCZTVUbmd1OFYvQ2pHNjE2N0kydXppekY5ZGFEd3BXWDBzMzZG?=
 =?utf-8?B?Y0xlUGhzSzE4Z3RpSDZSVkdtM3VEcUxYMTdWaXhVU1JBNjAveWhEVk8wN05s?=
 =?utf-8?B?dkFOTFRwUzRKamJiRmlURkRrTE5jWmFZa0VNaXV1N05kS28ySkZHZnFzQXRn?=
 =?utf-8?B?WmJVMks1bmVJYXpVY1dUQVduMUljTDlrVCt2c2p0cEUvN2Z4YmxtWDg4cEpl?=
 =?utf-8?B?UG4wZDhENkM2OVBySnhJdWNodERhRG9UcERCaDl0MXl4Z2xnRUZXZlgzbGdJ?=
 =?utf-8?B?ZFhac0pUM05aNzVzZzU5WUM4Wit3SXJNeXFXbXRLc29PTS9RQVBmU0Z6SnVM?=
 =?utf-8?B?UXJkMElRelJDYzFwWDRwZXRZdzYvWlBrbjU4MGJnVXpERTEwekVUY1kyNlNm?=
 =?utf-8?B?QXhHL1B4NkFrc01QaXRISnFtNnNqVjhLdTBIWjUvb1dmSjBVa21EYjNxOHFG?=
 =?utf-8?B?cHBsaU9GSUhpbXZHRVUxMG1maGNGM1JyM0FVSjF6WWJlYlFNODl2b2Y5WFIv?=
 =?utf-8?B?VDRrQ3hpYXc1Q3hXWjZLZlVCQjIzRHRNcll2KzBQREFDZUJNMUFBejRJRE9n?=
 =?utf-8?B?U2JUdHRVRGdKNHpzdHZyWlE2a2QxNjYraVJIT3BWZ3F0T0VXcmF0VG1mcGsv?=
 =?utf-8?B?RElNa2p5dGNZMkgxS2g1S3dmbVdOZ3cydWtNRTY4YWUvV3NuckxWem0ycFdS?=
 =?utf-8?Q?BlEDK9EQ+BHjS+t7MhF1GgM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4785.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6721587-5dcd-4ff3-41f8-08d9d130a1a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2022 16:21:44.9542 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dQPek5WB22hF6Rh32gslXocifDXqsW8MLNAkCXdaNN0Eylk5Ob03NT9IL0hxwUxPiGr4dfGlemzePErBaRnmwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5773
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

SGksIGFsbA0KDQpUaGUgaW5pdGlhbCBtZXNzYWdlIEkgc2VudCBvbiBEZWMgMjAyMSBpcyBibG9j
a2VkIHNpbmNlIEkgd2FzIG5vdCBhIG1lbWJlciBvZiB0aGlzIG1haWxpbmcgbGlzdCBhdCB0aGF0
IHRpbWUsIHBsZWFzZSBpZ25vcmUgdGhhdCBvbmUuDQoNCldpdGggc3lzdGVtZC1uZXR3b3JrZCwg
ZWFjaCBWTEFOIGlzIGEgdmlydHVhbCBpbnRlcmZhY2UgYXNzb2NpYXRlZCB0byB0aGUgcGh5c2lj
YWwgaW50ZXJmYWNlLCBhbmQgaXQgaGFzIGl0cyBvd24gbmV0d29yayBjb25maWcgbGlrZSBJUCBh
ZGRyZXNzLiBDdXJyZW50bHkgb3VyIHBob3NwaG9yLW5ldHdvcmtkIGFsc28gc3VwcG9ydHMgaXQg
d2VsbC4gQnV0IGluIHRoZSBibWN3ZWIgc2lkZSwgd2UgbGFjayB0aGUgaW1wbGVtZW50YXRpb24u
IEFuZCB0aGVyZSBpcyBhbiBpc3N1ZSBsb25nIGFnbyBhYm91dCBpdCBhdCBodHRwczovL2dpdGh1
Yi5jb20vb3BlbmJtYy9ibWN3ZWIvaXNzdWVzLzc5Lg0KDQpJbiBjdXJyZW50IFJlZGZpc2ggaW1w
bGVtZW50YXRpb24sIFZMQU4gaXMgb25seSBzaG93biBhdCAv4oCLcmVkZmlzaC/igIt2MS/igItN
YW5hZ2Vycy/igItibWMv4oCLRXRoZXJuZXRJbnRlcmZhY2VzL+KAizxzdHI+L+KAi1ZMQU5zL+KA
izxzdHI+IHdpdGggdmVyeSBsaW1pdGVkIGluZm9ybWF0aW9uIChPbmx5IFZMQU4gSUQpLiBVc2Vy
IGNhbm5vdCBjb25maWd1cmUgdGhlIGludGVyZmFjZSBpdHNlbGYuIEFuZCB0aGUgVkxhbk5ldHdv
cmtJbnRlcmZhY2Ugc2NoZW1hIGlzIGRlcHJlY2F0ZWQgb24gMjAyMS4zLg0KDQpNeSBwcm9wb3Nh
bCBpcyBleHBvc2luZyB0aGUgVkxBTiB2aXJ0dWFsIGludGVyZmFjZSBpbiB0aGUgc2FtZSB3YXkg
YXMgcGh5c2ljYWwgaW50ZXJmYWNlLiBJbiB0aGlzIHdheSwgd2UgY2FsbCB1dGlsaXplIGV4aXN0
aW5nIGNvZGUgb2YgZ2V0dGluZy9zZXR0aW5nIGludGVyZmFjZSBwcm9wZXJ0aWVzLCBvbmx5IG5l
ZWQgdG8gZXh0ZW5kIHNvbWUgVkxBTi1zcGVjaWZpYyBwcm9wZXJ0aWVzLiBUaGlzIGlzIGFsc28g
dGhlIHdheSBzdWdnZXN0ZWQgYnkgUmVkZmlzaCBzY2hlbWEuDQoNCkRldGFpbHMgYXJlOg0KDQox
LiBJbiBFdGhlcm5ldEludGVyZmFjZSwgdXNlIEV0aGVybmV0SW50ZXJmYWNlVHlwZSB0byBpbmRp
Y2F0ZSB3aGV0aGVyIGl0IGlzIHBoeXNpY2FsIG9yIFZMQU4gKFBoeXNpY2FsL1ZpcnR1YWwpDQoy
LiBBZGQgVkxBTi1zcGVjaWZpYyBwcm9wZXJ0aWVzIGxpa2UgVkxBTklkIHRvIFZMQU4gaW50ZXJm
YWNlcy4NCjMuIEFkZCBhIG5ldyBBUEkgdG8gY3JlYXRlIFZMQU4uIChUaGlzIHJlcGxhY2VzIGN1
cnJlbnQgUE9TVCAvcmVkZmlzaC92MS9NYW5hZ2Vycy9ibWMvRXRoZXJuZXRJbnRlcmZhY2VzLzxz
dHI+L1ZMQU5zKQ0KNC4gQ3JlYXRlIGEgREVMRVRFIG1ldGhvZCBoYW5kbGVyIGluIC9yZWRmaXNo
L3YxL01hbmFnZXJzL2JtYy9FdGhlcm5ldEludGVyZmFjZXMvPHN0cj4gZm9yIGRlbGV0aW5nIFZM
QU4gaW50ZXJmYWNlLg0KDQpGb3IgIzMsIG15IGlkZWEgaXMgdG8gYWRkIGFuIE9FTSBhY3Rpb24g
Q3JlYXRlVkxBTiBpbiBlYWNoIHBoeXNpY2FsIGludGVyZmFjZSwgdGhlIHBheWxvYWQgd2lsbCBi
ZSBpbiB7IlZMQU5JZCI6IDF9IGZvcm1hdC4gSSBrbm93IHRoaXMgaXMgYSBub24tc3RhbmRhcmQg
d2F5LCBidXQgSSBjYW5ub3QgdGhpbmsgb2YgYSBiZXR0ZXIgaWRlYS4gUE9TVGluZyB0aGUgRXRo
ZXJuZXRJbnRlcmZhY2VDb2xsZWN0aW9uIHNlZW1zIGNhbm5vdCBoYW5kbGUgd2hpY2ggcGh5c2lj
YWwgaW50ZXJmYWNlIHRoZSBWTEFOIGludGVyZmFjZSBiZWxvbmdzIHRvLg0KDQpBbHNvLCBJIGZv
dW5kIHRoYXQgY2hhbmdpbmcgVkxBTiBJRCBpcyBub3Qgc3VwcG9ydGVkIGluIHBob3NwaG9yLW5l
dHdvcmtkLCB0aG91Z2ggYm1jd2ViIGN1cnJlbnQgaGFzIGEgUEFUQ0ggaGFuZGxlciBmb3IgaXQs
IGl0IHdpbGwgbm90IHRha2UgZWZmZWN0LiBJIGFtIGFsc28gZ29pbmcgdG8gcmVtb3ZlIGl0IGlu
IG15IHBhdGNoLg0KDQpBbnkgc3VnZ2VzdGlvbnMvYWx0ZXJuYXRpdmVzIHdpbGwgYmUgYXBwcmVj
aWF0ZWQuDQoNClRoYW5rcywNCkppYXFpbmcNCg0K
