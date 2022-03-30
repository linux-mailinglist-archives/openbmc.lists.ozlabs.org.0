Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B44D04EBEF2
	for <lists+openbmc@lfdr.de>; Wed, 30 Mar 2022 12:39:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KT2ww4jD1z2yYJ
	for <lists+openbmc@lfdr.de>; Wed, 30 Mar 2022 21:39:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M4m4rDQn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=M4m4rDQn; dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KT2wM5MNPz2xY1
 for <openbmc@lists.ozlabs.org>; Wed, 30 Mar 2022 21:38:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648636723; x=1680172723;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=bo0uOhsXxxA1Ss150QgoZN87rCuL6+YvR1Q6yEIbm/A=;
 b=M4m4rDQnsLTYQ9HDvRHzmB7szuNdZtOt4VIH8fjc+kTGv1DVkKlMGbO5
 x4oQIdqLKT5UGU1IgDofyw+xBODvC9EdoESjkT/+T3PRK8nSgHIKR6oKx
 jcUqLs7b+awJ5FTZHGhkukxLNcxCZhVjQpwkivF0aCjmDv2FEDNMIlqXW
 +9fyxjPTGIifqLvZM2bLI5VRnip+nCzpVrKaXebW9KPMYVqpm/nWOj8BD
 PMExgn5zpX8rxCQ09bIaOeTPz4ozdhPcFrOoSiqKZUMjL6ZtB7/HPBKGN
 bFtZJqcF7yMlF+BmPy93rr2HGRwSpKgMh/nEUZmzLGHwXwRSdZfN1pw5n A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="259483449"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="259483449"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 03:37:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="503269457"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 30 Mar 2022 03:37:34 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 30 Mar 2022 03:37:34 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 30 Mar 2022 03:37:33 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 30 Mar 2022 03:37:33 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 30 Mar 2022 03:37:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/VdHQC6TwVDYrQA9t1PItlCD/auRpMhkVeAKHeA8dJuMOd8OaSKttY8Rb7AIgWjyBHr3hNpcy0YptQZ8SvW5B/uppR7XQvPM1RR+lCWDsjL+ziTR9TKgZ3I+6GjjQim3qfMAgT92OW4RBL0xBsYlYyLMnt9HL1UKvc/+oB1SNQuHkke/5ZUdzVsWnnppdNQF9FrDKDcXykdEAPN90QU0IBxtc1O22W9ArcwDFU+WT1iE1k8YCYOjkyUgGklFTXUZ6CBGC2dxxha9F5BnfgmxIWycDuNWIMtRWl/fUMX06V0gHry3d8rq/a10cEwgCeouBFpfBoNUOn2uVRUm2KE0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bo0uOhsXxxA1Ss150QgoZN87rCuL6+YvR1Q6yEIbm/A=;
 b=DvStI6oJeQsmy/RVinOGR29n3amYZY0Rszk8WNn57Nw4i5X1rukcfud2YvTED0xoYnlwyhQMWN7RvU3zvpPjumEG2zYmALnneKP5rvt1GB3OXIwso9JVTh1ha3BstZtZ/05niOTfWON0ClDVezkhAgtYyKBwNkc/Cf03TEo+IzRZWPKSH8smk6FGDNd48MLFFS4+dLqL2kFu+mRFMIUNJioB5vrKmYS4Im+DY+8lUcaO7Pz0/u3i6g4EbME10GLb2c0RC+uOWqFCgFtmkNPB8y/0fiJ5Wu16uzU2EKwPyobPjyqFdVvE3PlmLzq7fAKlCsUl1B7Hg42d+obf1cx30A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by DM6PR11MB3001.namprd11.prod.outlook.com (2603:10b6:5:6e::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Wed, 30 Mar
 2022 10:37:26 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::9966:4a21:3413:b0aa]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::9966:4a21:3413:b0aa%6]) with mapi id 15.20.5102.022; Wed, 30 Mar 2022
 10:37:26 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>, "patrick@stwcx.xyz"
 <patrick@stwcx.xyz>
Subject: Re: [PATCH] peci: PECI should depend on ARCH_ASPEED
Thread-Topic: [PATCH] peci: PECI should depend on ARCH_ASPEED
Thread-Index: AQHYQ051fxkka8z/g0SLx/SfXWRHzKzWKi0AgABuaACAASUYgA==
Date: Wed, 30 Mar 2022 10:37:26 +0000
Message-ID: <342ae21e4bba6b0eccb39113fafa411aa8e93f96.camel@intel.com>
References: <f7ea35c723da72a89028da5b976ad417fbd7bf52.1648545587.git.geert@linux-m68k.org>
 <YkLgapMN2JqM+Lte@kroah.com> <YkM9CPbeARpWHMPw@heinlein>
In-Reply-To: <YkM9CPbeARpWHMPw@heinlein>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-3.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: da451bad-7f20-4888-2c2a-08da1239489d
x-ms-traffictypediagnostic: DM6PR11MB3001:EE_
x-microsoft-antispam-prvs: <DM6PR11MB3001586B90101FF01F89C07BEC1F9@DM6PR11MB3001.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lhl+FfYecRaNatnky3FRf+twspWtMCKKJ7wqj5Uez7+wU8wXLtIMGQwLEyZr6Rx0qQlt/MEB2vA+UoZI7EpDLN3RD7RVcB0iaiFUWTi7FkpXVn59BSeINzV+H3sGYZ8JYoQ++Wqr194wbbJRDq4Wo2My7coJQgBliW2vE2Kfl76U0SmwyZOInokqBeRG2/L+D0HH+StaE397RuBc2pAVcwmKhaiKBHShHUlW6UfbroZCQA8Ufbw1LCtkEPpqHgMdper7R0Vbk/i3luGB2pbnG6km1goDLT1Y/KbcGkwIi94Wd9dRaCRbBQAXjNoAXanNIDvha78Bk3phSckBKRnlJImJGrLQSRnwocimt/kLwO4DusU2LKSALss0sCXeMEPU+Evxgb+mcF5Vyv/2rNhsWCfz2pNu04yvUOXEx5ny0NqObdoXR96o9Qd6wlUYNEgHdnRdkEQLvk6D4tc5LnmgcC+IaKz5aIQyd+o89hQ0MKr0I+4/gcQxYDX71qj9SugPSLOq9wrv4/+4gkxUJfDhjoVxVo7x24hUNrEhrkQV+Qu1QR4SvPaURSe9CBu90Ed8F5GJhqVzbwSGVWCb5hjsbXdRZljiidCHWO8nm78QIJXWTlaiPfbTbZJHYzbmuByWx1jZ4JSZMsHapkVFo4smVmGTJqNh2FoR50IPmRKo89K48z9Gziy3LeecAhkDFGh6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5823.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(186003)(26005)(36756003)(38070700005)(82960400001)(76116006)(66476007)(38100700002)(64756008)(4326008)(2616005)(71200400001)(91956017)(122000001)(66556008)(8676002)(316002)(8936002)(83380400001)(6506007)(508600001)(6486002)(2906002)(66946007)(54906003)(110136005)(66446008)(5660300002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OUNsUlNHU010S05ZL092b1VON0xJM2dES3Y0M3Q4Qlo1RVoydWhXRDJ6dFlF?=
 =?utf-8?B?d3RZSDd3dmpHSStLODl4VFVHSDJPaS81UlN4WDJkNHd0UG0xZE5ZUTA2SFV6?=
 =?utf-8?B?QmZQVUxkcmhFQXp2TFV0UUhjOUVnbkYyN3lDdlhtUkNIL0hjcStFYUFEUUFl?=
 =?utf-8?B?SktaSDEyT25KTVpOcTNFdzNicmk2ejRnelpSdlZMTGVHbDZlTTE4L2JzSHln?=
 =?utf-8?B?TWxrQXYvSGN3SFkzbUIwOVlrMmV3VERSQ2ZuL21DRUNTUnFDZnlnQ1EySTVk?=
 =?utf-8?B?MHNadTNHalZiYmtXQzZ4WU1YS0I2Rmt5dWFNLzd4TUxrbDl3bGtTb0pBc2No?=
 =?utf-8?B?bFI0dWg1NUxXNHd1Ymp4eUY4RlExekl2UThKWEMyNkpraGtIeWkyaGJKaWFQ?=
 =?utf-8?B?RkRxQ2JQUEhsTUg1VkZzVW1IQmlvUFdUSjl3aHpQNjFGVzI4MEpYR0NISzk2?=
 =?utf-8?B?aktaeWNZcytxZ2dKNzhmbFNRZVgyM2phTkJiZlQzdGlOTkczRkozTUNmWkli?=
 =?utf-8?B?OUlwdXM3MTJlYlhqa3NCbGk1N3dNUlpGSFN6UGhsNGVhY2RRWGxPTko1Wjdj?=
 =?utf-8?B?Tk5nSTh6cDdkOVZRbU8xS0l5OXRTOS9pMGZiQUNFeDArUHBvUVlDeEwwY05E?=
 =?utf-8?B?dHIxdXdNN0NIbElvNTZ4TjZaRk5RUXR6T3MwUFNKM3VlRDFmNFpncGwvTGgv?=
 =?utf-8?B?V2V1UnFBZ0VsS1pjTDhoZ1h5S1FkTWdHU0Zqdit2ZWM1ZUs0WUNkL2lnTXBK?=
 =?utf-8?B?bkJodnlXWUVkcXBtQnN3MjRUK3EyZ090WVdnQXhRTEIvRHloRm5mcjg2THB4?=
 =?utf-8?B?bkIwMWFvOXB0b29UUFlaMytUNGgxbWNtYmU5OGVzamhvVVRyRU9iSll4enF1?=
 =?utf-8?B?K0k2Sk1VRGlaVTh3RHg5b282VWxIMG5wMitSSWdGR3A3QTIzWUFFdE1paHc0?=
 =?utf-8?B?aVdvUUw2SEhKYnQ2ZHRySitpSzZNMTk5QXJoTnRsSEdHYW9zWGdCYzBGejZU?=
 =?utf-8?B?V0pVdlBSbFFMbUtjd1ArM29uVjY1d3lUMkh1NjVNNXFFNnJ1ZFhpa3pic3l2?=
 =?utf-8?B?dURReW1EaTVTWmVzRzlGK2tVd1NQemJzcmh5ZUJ3bGl3WStSWkpSdC9RcG1I?=
 =?utf-8?B?dUtZSHJHWHZ6UUcraXBPNExWZHNJeEkzYmcrWjVRb01BMlVYbzdwVlZQc2o1?=
 =?utf-8?B?TEZtV1JyNGh3Znd2WFZSSDg3YlJHVzhWUGtLYm5pR0swUnl0dVdzWll3SDRw?=
 =?utf-8?B?K3F6WVdCVjgxWEtndlhtZHR6OG01Sm1IWDRLbzVESXdXUWVUZXNGUUdWQ0Rl?=
 =?utf-8?B?bFV3UUt3YUc5QnhBcGUvdFhJcFNuN0haSjJ1aGc4ZUlrRmpWeC9rUlBmQXR4?=
 =?utf-8?B?SWd1Zk85dGJVTlVXdVFqY0J6L0V3UzE5bUo0akJVaytmUE93bjdsWERIL1dS?=
 =?utf-8?B?RHNDdVVIa09TV0Y4WWM1cUlmejVMRW5pSjRCUkhiUFRISnZUMm5xeWllU0Iz?=
 =?utf-8?B?L3doT3lxa2JvM2dWVHZudDI3WlhLZGhvT05FL05LNWFTdkozSHAzS1pvYmhn?=
 =?utf-8?B?Y0x2NWxWU1M1N1J5eUtXYnBIVFRpaGxEekgxZVZ0R1VDSm1IZS9JbDFsbWRN?=
 =?utf-8?B?Vk9sMlVHeVpvUXQvaFcxdDhIa2hZYnoxME5BYlhMRWVjVXQwVVlrQ0lEZ2ky?=
 =?utf-8?B?cUkwWDVCOEZQTzJTMjg4TSt4YXhRREdwSDJDdWZBdGpFRjF2azYyaExad2ZQ?=
 =?utf-8?B?SWY3Tjk5MU5PYTFaeGlZSTVVYWtHNTF2QktaWWV3OVEvQzlOSXZtZUxEVkJm?=
 =?utf-8?B?MkgxazRVQ2sybWY3SzZkWXpFUG4zSXB4Z2VTY0tmbmgxd1ZJWmd2SWhNZUkx?=
 =?utf-8?B?cGpoQTlKdGowZnk5R0lhUG1zRDZYUlNxNVVmeURIZnFqREc4QXFTWjFmL0xS?=
 =?utf-8?B?Vk5aUTFDRGx1VlBHVmFHRUdENW90R2ZhR1E2WDBsYjBnZStJNldVanBJZzFQ?=
 =?utf-8?B?d1B6RGtDeThHdDhVMlFJRWRYQWNBVjFXdGFmdng0bGpBdDRyZytzbkp2WG1Y?=
 =?utf-8?B?Uy9aVDJTb0JpUjdXRVJNcXowN1FwaUZlelpzeU43SjVaemVidkF4cWdobVJW?=
 =?utf-8?B?dTB4SlNQc3N2TDZ5Wkc2THZxYmtWWlU4QjREU2dsbHltU215N0F4Z1hDL0dp?=
 =?utf-8?B?enR5ZW9Tc2MvaGloaUpmL0d3b2VhUWh3ME1weGFhOTVDUm1oTE4vRWIzNG1H?=
 =?utf-8?B?OVdIMHlTMFhJUW1DcitqVkdjRFZPTUhXMDB4U0FFelVGek1WSUs3RU9CUXhh?=
 =?utf-8?B?ckVmNlk3cXZBK0grcnZyTlNkc08wS3d0aE1Da3ZNQWxSZU50ejBTaWNhbnpw?=
 =?utf-8?Q?ym5ULusa64kVL4GI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A24BBFA6E65B094892EB633772F734E3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da451bad-7f20-4888-2c2a-08da1239489d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2022 10:37:26.6105 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0xLZv8hAHtFa8n8QRY6VIeORoGeHQl4D3zSCssuuMZIVQHzKgZlsK7fcc3WLYkY0zZ1/1SZom/KdHGDvGbqtt0sD3Dy5mPUDmddHzJ8F/dY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3001
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
Cc: "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "joel@jms.id.au" <joel@jms.id.au>,
 "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gVHVlLCAyMDIyLTAzLTI5IGF0IDEyOjA4IC0wNTAwLCBQYXRyaWNrIFdpbGxpYW1zIHdyb3Rl
Og0KPiBPbiBUdWUsIE1hciAyOSwgMjAyMiBhdCAxMjozMzoxNFBNICswMjAwLCBHcmVnIEtyb2Fo
LUhhcnRtYW4gd3JvdGU6DQo+ID4gT24gVHVlLCBNYXIgMjksIDIwMjIgYXQgMTE6MjE6MzdBTSAr
MDIwMCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiA+ID4gVGhlIFBsYXRmb3JtIEVudmly
b25tZW50IENvbnRyb2wgSW50ZXJmYWNlIChQRUNJKSBpcyBvbmx5IGF2YWlsYWJsZSBvbg0KPiA+
ID4gQmFzZWJvYXJkIE1hbmFnZW1lbnQgQ29udHJvbGxlcnMgKEJNQykgZm9yIEludGVsIHByb2Nl
c3NvcnMuwqAgQ3VycmVudGx5DQo+ID4gPiB0aGUgb25seSBzdXBwb3J0ZWQgQk1DcyBhcmUgQVNw
ZWVkIEJNQyBTb0NzLsKgIEhlbmNlIGFkZCBhIGRlcGVuZGVuY3kgb24NCj4gPiA+IEFSQ0hfQVNQ
RUVELCB0byBwcmV2ZW50IGFza2luZyB0aGUgdXNlciBhYm91dCB0aGUgUEVDSSBzdWJzeXN0ZW0g
d2hlbg0KPiA+ID4gY29uZmlndXJpbmcgYSBrZXJuZWwgd2l0aG91dCBBU3BlZWQgU29DIHN1cHBv
cnQuDQo+ID4gPiANCj4gPiA+IEZpeGVzOiA2NTIzZDNiMmZmYTIzOGFjICgicGVjaTogQWRkIGNv
cmUgaW5mcmFzdHJ1Y3R1cmUiKQ0KPiA+ID4gU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gPiA+IC0tLQ0KPiA+ID4gwqBkcml2ZXJzL3Bl
Y2kvS2NvbmZpZyB8IDEgKw0KPiA+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykN
Cj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGVjaS9LY29uZmlnIGIvZHJpdmVy
cy9wZWNpL0tjb25maWcNCj4gPiA+IGluZGV4IDg5ODcyYWQ4MzMyMDE1MTAuLjBkM2VmOGJhMDk5
OGQ2NDkgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL3BlY2kvS2NvbmZpZw0KPiA+ID4gKysr
IGIvZHJpdmVycy9wZWNpL0tjb25maWcNCj4gPiA+IEBAIC0yLDYgKzIsNyBAQA0KPiA+ID4gwqAN
Cj4gPiA+IMKgbWVudWNvbmZpZyBQRUNJDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgdHJpc3RhdGUg
IlBFQ0kgc3VwcG9ydCINCj4gPiA+ICvCoMKgwqDCoMKgwqDCoGRlcGVuZHMgb24gQVJDSF9BU1BF
RUQgfHwgQ09NUElMRV9URVNUDQo+ID4gDQo+ID4gSSBoYXRlIEFSQ0hfIGRlcGVuZGVuY2llcyBh
cyB0aGVyZSBpcyBub3RoaW5nIHNwZWNpZmljIHdpdGggdGhhdCBvbmUNCj4gPiBwbGF0Zm9ybSB0
aGF0IG1lYW5zIHRoYXQgdGhpcyBkcml2ZXIgc3Vic3lzdGVtIHdpbGwgb25seSB3b3JrIG9uIHRo
YXQNCj4gPiBvbmUuDQo+IA0KPiBUaGUgbW90aXZhdGlvbiBpbiB0aGUgY29tbWl0IG1lc3NhZ2Ug
aXNuJ3QgZXZlbiBhY2N1cmF0ZSBiZWNhdXNlIHRoZSBjaGlwcw0KPiB1bmRlciBBUkNIX05QQ00g
YXJlIHVzdWFsbHkgdXNlZCBhcyBhIEJNQyBhcyB3ZWxsIGFuZCBQRUNJIGlzIGp1c3QgYXMgaW1w
b3J0YW50DQo+IGZvciB0aGVtLsKgIEhQRSBhbHNvIGhhcyBhIGN1c3RvbSBjaGlwIHRoZXkgdXNl
IGFzIEJNQyBhbmQgdGhleSd2ZSBzdGFydGVkIHRoZQ0KPiBwcm9jZXNzIGZvciB1cHN0cmVhbWlu
ZyB0aGF0IHN1cHBvcnQuDQoNCiJDdXJyZW50bHkgdGhlIG9ubHkgc3VwcG9ydGVkIEJNQ3MgYXJl
IEFTcGVlZCBCTUMgU29Dcy4iDQpGcm9tIFBFQ0kgc3Vic3lzdGVtIHBlcnNwZWN0aXZlIChub3Qg
Qk1DIHN1cHBvcnQgaW4gZ2VuZXJhbCksIGl0IGlzIHRlY2huaWNhbGx5DQp0cnVlIGZvciBub3cg
LSBidXQgSSBhZ3JlZSB3aXRoIEdyZWcgYW5kIFBhdHJpY2ssIHRoaXMgaXMganVzdCBhcnRpZmlj
aWFsbHkNCmludHJvZHVjaW5nIGJ1aWxkLXRpbWUgZGVwZW5kZW5jaWVzIHdoZXJlIGluIGZhY3Qg
dGhlcmUgYXJlIG5vbmUuIEFuZCB5ZXMgLSB3ZQ0Kd291bGQgdGhlbiBoYXZlIHRvIGFkZCB0aGUg
ImRlcGVuZHMgb24gQVJDSF9ZRVRfQU5PVEhFUl9BUkNIIiB0byBnZW5lcmljDQpzdWJzeXN0ZW0g
YW55dGltZSB3ZSBhZGQgYSBuZXcgUEVDSSBjb250cm9sbGVyLiBUaGlzIGJlbG9uZ3MgaW4gdGhl
IGNvbnRyb2xsZXINCihhbmQgdGhlIEFTUEVFRCBvbmUgZGVwZW5kcyBvbiBBUkNIX0FTUEVFRCku
DQoNCj4gDQo+ID4gSSdtIGFsbCBmb3IgZml4aW5nIGJ1aWxkIGRlcGVuZGFuY2llcywgYnV0IGl0
IHNob3VsZCBiZSBmaW5lIHRvIGJ1aWxkDQo+ID4gYWxsIGRyaXZlcnMgZm9yIGFsbCBhcmNoZXMu
DQo+IA0KPiBUaGVyZSBhcmUgYSBmZXcgZHJpdmVycywgbGlrZSBQRUNJIGFuZCBGU0ksIHRoYXQg
YXJlIGxpa2VseSBvbmx5IHVzZWZ1bA0KPiB3aGVuIGJlaW5nIHVzZWQgaW4gdGhlIEJNQyBzcGFj
ZS7CoCBJcyBpdCB3b3J0aCBoYXZpbmcgYSAiY29uZmlnIEJNQyIgZm9yDQo+IGRyaXZlcnMgd2hp
Y2ggYXJlIGxpa2VseSBvbmx5IHVzZWZ1bCBpbiBhIEJNQyBlbnZpcm9ubWVudCBhbmQgdGhhdCB3
ZSBjYW4NCj4gImlmIEJNQyIgYXJvdW5kIHRoZXNlIGRyaXZlcnMgc28gdGhleSBnZXQgaGlkZGVu
IGZyb20gdGhlIG1lbnVjb25maWcgZm9yDQo+IHR5cGljYWwgdXNlIGNhc2VzPw0KDQpXZSBkb24n
dCBoYXZlICJjb25maWcgU0VSVkVSL2NvbmZpZyBERVNLVE9QL2NvbmZpZyBJT1QiLg0KSSBkb24n
dCB0aGluayB0aGVyZSdzIGFueXRoaW5nIHNwZWNpYWwgYWJvdXQgQk1DcyB0byBiZW5lZml0IGZy
b20gaW50cm9kdWNpbmcNCnRoYXQgKHVsdGltYXRlbHksIHRoaXMgd291bGQgYmUgeWV0IGFub3Ro
ZXIgImFydGlmaWNpYWwgYnVpbGQtdGltZSBkZXBlbmRlbmN5IikuDQoNClRoYW5rcw0KLUl3b25h
DQoNCj4gDQoNCg==
