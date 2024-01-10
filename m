Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AD6829C6A
	for <lists+openbmc@lfdr.de>; Wed, 10 Jan 2024 15:21:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KyWp3c79;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T992V6jk8z3cQD
	for <lists+openbmc@lfdr.de>; Thu, 11 Jan 2024 01:21:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KyWp3c79;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Thu, 11 Jan 2024 01:20:36 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T991w4sRpz30gr
	for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2024 01:20:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704896437; x=1736432437;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=/v4Pe2wYyZ8N0uUbVO5jFeTCzK60fuWt0/MXhWCIN4M=;
  b=KyWp3c79TYhIACRX6ncjvNm1whKEchgfAVqK/w1b6jg+SfN26HZIXKvd
   EGm9fkMJGFgB+7QPri43fHZU6MCSut6MJq/rVtaenRQkF2TQXRmKo8NiL
   kQ8PyZgXxCqfLDQ/99NokdLd+VfBy41W4BDwUgJLzeUgnT6rq0hVd5qyw
   sVWSYHLu/Q3+jwsu/8xp3HYHYj0KLZKbjDIQyAoHae3BzXRnGO5jm/mFq
   WoAoQbglJX2JRfeLEr8jDhxHNFAV45bZF/deWIMKPsgu0vw9PGsTY7e5/
   4m4Qy8sqn8QJC44Z4FNcd0r75R6nRThrfoHHGpSleUR9t+7BRegM4+WRR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="17122342"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="17122342"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 06:19:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="782194725"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="782194725"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Jan 2024 06:19:27 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Jan 2024 06:19:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Jan 2024 06:19:27 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Jan 2024 06:19:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nXO198xarOt6AQWa22xlr5oDIMI4qHkbGb+TJ8+R1z1ezqPLEVQjtv0r/Wb7+C/OxbjwGdt/WqxoU2lTKcmrB9EbboieAZl0wr2QSFSLTdtuLTVBp1RDhZg4gPmuw99cUuVOn9Dq82Cugz9lOX81UoD6OECLw3s0UWlCkXYaA8bSH3NeKL6Ui+3op19bnYXSshrpKddXI6ncFWvBaXYkD4VQpBCdup9kY1qR/2spWjJqBTZMjYAvIDWOxvLNjsm1cbvTUYvpBwIg7qSh9e82c4xZZ5QTgHYS1XL1dPg6oOq1TXrgHVz44oJg20VCaiu0v7G+SIm9t/HQ86AYntozvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/v4Pe2wYyZ8N0uUbVO5jFeTCzK60fuWt0/MXhWCIN4M=;
 b=oOMoHF0AThHxkFeZ05x+zjTseGpiMNpEK5Tbtv4pnRnsPy0ok0jfLl4W++tnh5UfzVaQ+yzfKoPDYBdIM+S1WAymfYK/Pwss+3g3tUP40EnCJq8NR0f+l+iLVizsYssNyhkL0pfthUH8fHQJYb6xChgtoOEarSBIpAJczDiBfGXVjMGBVUqR7GPDsAl23qa+v/0xUPDQeyW6Lax9nbp4xKMfOnBWpd5MhJzLjAwhH7MKVF70xzDKExpOlyHxGRsMWoyUFGI8BUxAYrQzKWKwaoXldtVR1uv7bdWY3KUr5Z2TsJAg0SGfxJ1LyEHhMJ7OYZ4cG0IA/iOKJH7x7SPPcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5330.namprd11.prod.outlook.com (2603:10b6:610:bd::7)
 by BN9PR11MB5403.namprd11.prod.outlook.com (2603:10b6:408:11c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18; Wed, 10 Jan
 2024 14:19:24 +0000
Received: from CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::f01d:1c6a:3c11:80af]) by CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::f01d:1c6a:3c11:80af%7]) with mapi id 15.20.7181.015; Wed, 10 Jan 2024
 14:19:24 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "rdunlap@infradead.org" <rdunlap@infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] peci: linux/peci.h: fix Excess kernel-doc description
 warning
Thread-Topic: [PATCH] peci: linux/peci.h: fix Excess kernel-doc description
 warning
Thread-Index: AQHaNV3Lws/7mluG4kOf3i4WHyUkf7DTNUaA
Date: Wed, 10 Jan 2024 14:19:24 +0000
Message-ID: <a3ea93b54911f553a6ca37d33181be0cf9f89b07.camel@intel.com>
References: <20231223050605.13961-1-rdunlap@infradead.org>
In-Reply-To: <20231223050605.13961-1-rdunlap@infradead.org>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.2 (3.50.2-1.fc39) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5330:EE_|BN9PR11MB5403:EE_
x-ms-office365-filtering-correlation-id: a74a5ffd-ec97-4175-5a6c-08dc11e72557
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gssgwVgGD/2eIB1eFPf29ZQveQOIXe7BgyXPdqQVfIh562YODlVzDlWOy2akbm6cjMij4wNIarl1oOKfMarUdU5C/VtUA8q1Ce2kVvgOipCwF2y+r8rUi32zpHwq8d4I6ElDFgt/y8q3hJUTjC7egklLUSofLrG/aNchOKM76fSThD04RXnVRFm6sA8pXv5+UVFQH6Jv5dKaEr6iZtlmyiibWAvnjh8wVJMhznkENy4rLZwK1r0Bj2Kh3N5IJwGktDHz/2+I+St7hLQ05hPfJf4gy1sWwaqQQGDn6fScflZ2voSz9Cf/UWG3C/p3i4QArg7yTI87e+63jLsqnQLUMKNqgavwjLhJZid6jXmqxq+6PB146JFCoIL+cKk7NhKOLcxSHgsIcDouZ0nXKqYGKnSfutD0L6Z806PqjyHAb7129ZEdVlSGZw6rf02EXpWWHUs7oxgwsq9MhcaVouKLsgodJE9dgYeVHHhAkNS7yKoSlZojjj6NkH/lm8lh37vKQnUVibZKaPEyzWBmZlG15KUy0ONOQxzSffXOj0idQStjqSRbXpt3oIv/qhMUcRa47wRZArnRm+r36GVYUVknTSqzbk+iM/3pLYtb7XI2BoXw7wW6uBMdrp2bhWqMcjbQcSnNuzyDYHUQ17DI2ufWqZfreR5fY+pw64NavSCBNFc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5330.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(136003)(39860400002)(366004)(230922051799003)(230173577357003)(230273577357003)(64100799003)(451199024)(186009)(1800799012)(83380400001)(71200400001)(26005)(2616005)(122000001)(38100700002)(8676002)(4326008)(8936002)(5660300002)(2906002)(41300700001)(4744005)(4001150100001)(6486002)(6512007)(6506007)(66446008)(64756008)(66476007)(66556008)(316002)(478600001)(66946007)(76116006)(91956017)(110136005)(86362001)(82960400001)(36756003)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bjJpVkRmeEtlYlpLeWpkSS9hOUtoeTljRkExSVVtdW5uR240NFBoTkJ2V1Z3?=
 =?utf-8?B?UUhTOTlLd1A2aUFUejJoTklRaTM2Tjc2dmtVZE1hd1JYWVRyT1dEUWtrbzJ1?=
 =?utf-8?B?VXlXY0NTM0JHTmxlTnBrMjhIVElsR2dCNnBJKy9IdFNwYzBNR3lxL0NGY2p1?=
 =?utf-8?B?V00zN1BPUHB1WENWK3hUK2RXM0pNa0F5bjZKU001UlU3Z3lNQ09wMi9jQk5w?=
 =?utf-8?B?SGFnVS9xTUJIS2VWditXTjNJTWRKVHhoY0dxSTFvdWdoenkreTQyTll2enl2?=
 =?utf-8?B?VHBsR0ZyaVZRZDJhNldTQi9rZFg0REgwNWpwbGdkN3NGaHdFRlUrRnJwbnZj?=
 =?utf-8?B?UzhOcGdrK2JBY1FCdUQzaEMvNWRmSFVsWGJzaHVIKzVubDZXcGV4YVczckg2?=
 =?utf-8?B?WExiMHd6dkxNWmNSTnk5Qzh4a01WNW0vMVFQOWwybTgrTnByclBrR2VDanAr?=
 =?utf-8?B?K3dMMlNPdGxvWlNPLzFBc3YvUXIvT1NmN1VVRXc4Y09GZUIvK0tXaS9Fc1F2?=
 =?utf-8?B?UmN0NzZpcTg2RUpBcnZTRG5xOUcvT2lTUS94OWtTbW9MWnVnRU8wYis3VkJ5?=
 =?utf-8?B?eUdnYmdWRVIvYWI0d3drUDkvQ1plUUFGc1NOYlhub3g2R0IvbkE3WkVxL2ts?=
 =?utf-8?B?cG83bThrcUR1T1VUK05vMldUVkEzbHlUc0xyeTJudTJkclI1NFJoSWsrRHBY?=
 =?utf-8?B?TFJ5OHk1MytpWVlxMzdhSU51b0pCODBEUldGNk5xRkhTQUVsVjVUMno2eXo5?=
 =?utf-8?B?OU5qcnVURnBReldxdHp5QUtLcnZGdkhTd1M4N09scGVpMmRLeG5icUdxbWVw?=
 =?utf-8?B?M1JnUUQwVWVETHNqNHpLQWJzb3BaYVMxaWd4T1hRY1F3M3NrczR6L1BjVytU?=
 =?utf-8?B?UEtCL1ZPMWxIYnYzWUxHaUxTMW5zd1kramlTc0xFSW5aUnZabVBCR3BYN1Zh?=
 =?utf-8?B?UjhXeHJQZXV1SW5OZnNuNElqQjZ5TWpoSlBnVW1odnIyT2dVcGxXZmE1N3Ry?=
 =?utf-8?B?VUZvbGdHaHdkYTQvN1gxcWsrQkFqS1B4d0xtcUkyR2Q3Tk5UaXc2K0RsN2pT?=
 =?utf-8?B?anhWalJTQWVGVGM5L09udlBoekdJeW9rNGMrRHRHQy9oTlVveGUvemVKYmhB?=
 =?utf-8?B?WW1pdXc2U3lHYjlPNE5ITVl2UWllMWU1SStHZGNpM1YrV1pMcWdQWU5HQTdJ?=
 =?utf-8?B?c1lFVHVwVmRtRUpIb0NkcVdxTllPMWRTeWoyMUZGSklSRm9DV2VtRXkxQ09s?=
 =?utf-8?B?VlJTaGlwY1NuUFJzTFl4NFBLR20wdThUTFU5RWhiL2RJd3hwc2NSZm5mZEpR?=
 =?utf-8?B?VXdCUnR4bFVNTW5sL1dXcnN0SmhBYzZPcGUxNVdRSmtiVytKNXhpcmR4NGdi?=
 =?utf-8?B?ZjNrdUVnc2JpT3dHM3dwQjB5RTV0Y1hTb3h3R3dlQUhEMXl1cmxOdkEwSFI4?=
 =?utf-8?B?Qmt6emtvS2lwV0tBNHl4WWdGRDRXYmtnaUhQQjY5MzkrWS9jczQyaEFxLytM?=
 =?utf-8?B?OWErS09DS0FoZG1uR3MwemVlSUY4RkExMWQ4RE9JSXpHNWJ5R3BydDRsdUxm?=
 =?utf-8?B?NHd3Y0RzbHN5Vk5jdzVzd1dUTG5xVWtrQ3RNVm9VZk9TMC84TENnVy9HMHlN?=
 =?utf-8?B?NW9xa2FnN01aUGxNd3JpVWtmVVdiWUtsaWVrSlB6dEkvc2I5Q2tXRlgzWm1L?=
 =?utf-8?B?bHp4L1MxRVV5TW5ZUG1tRVp2Szc0TFVQTXdHQlJ6bXRGS2ZseENDWG5xZVdm?=
 =?utf-8?B?c2o0bUhHU2wwZEdOOEVMdTVnMGluQzFTdGxKYWE4QUxUWEhvMVZ3MmRLK25n?=
 =?utf-8?B?WE5HeTN3VGxrZFI2MEZ3WjY1OXVsWm1aK0lOS0FHdVVSM2hpQW9ZV1ZxR05h?=
 =?utf-8?B?VkEycDB4RndubUhFMm1FSDZsZ3ptS01tMDN5MkEyRWR1U0EyVExPcS9ScGRp?=
 =?utf-8?B?T0Exek5jbEhsVldOVDhhd29CK3NzQXJ0MlhIdjZUZDgrZklOazF5clZtZyth?=
 =?utf-8?B?R3VRT1VPd2Z6R244cWozWUF2STErY0ZrdW1SbXRMOHZsWE95cVNzbFN1WTkr?=
 =?utf-8?B?WjJwTFRHcnNKYXBwVnpkOU4ycW9ZYXhQZHpPQUlYdms1anEzZkUwMGpKaGdK?=
 =?utf-8?B?ZldyTnl1SEJmZzhlNFoybE1LUURjK2EweVNrbUkyd0s4MjBNSndjbmttalFu?=
 =?utf-8?B?U1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4717A7178DAEB648AF0ED5FE9E1648E9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5330.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a74a5ffd-ec97-4175-5a6c-08dc11e72557
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2024 14:19:24.0776
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peNOkYgIyuI6C0eVnCOjuAWSGL41TKaHKJyo5Wmzb0Ft0UWryre2GJxhHJT/yLU4PwV5vIAK0M1BikxBh0yw73+0vpMD8r6jD4BDMMDwMDI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5403
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gRnJpLCAyMDIzLTEyLTIyIGF0IDIxOjA2IC0wODAwLCBSYW5keSBEdW5sYXAgd3JvdGU6DQo+
IFJlbW92ZSB0aGUgQGNvbnRyb2xsZXI6IGxpbmUgdG8gcHJldmVudCB0aGUga2VybmVsLWRvYyB3
YXJuaW5nOg0KPiANCj4gaW5jbHVkZS9saW51eC9wZWNpLmg6ODQ6IHdhcm5pbmc6IEV4Y2VzcyBz
dHJ1Y3QgbWVtYmVyICdjb250cm9sbGVyJw0KPiBkZXNjcmlwdGlvbiBpbiAncGVjaV9kZXZpY2Un
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9y
Zz4NCj4gQ2M6IEl3b25hIFdpbmlhcnNrYSA8aXdvbmEud2luaWFyc2thQGludGVsLmNvbT4NCj4g
Q2M6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KDQpSZXZpZXdlZC1ieTogSXdvbmEgV2luaWFy
c2thIDxpd29uYS53aW5pYXJza2FAaW50ZWwuY29tPg0KDQpUaGFua3MNCi1Jd29uYQ0KDQo+IC0t
LQ0KPiDCoGluY2x1ZGUvbGludXgvcGVjaS5oIHzCoMKgwqAgMSAtDQo+IMKgMSBmaWxlIGNoYW5n
ZWQsIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS0gYS9pbmNsdWRlL2xpbnV4L3BlY2kuaCBi
L2luY2x1ZGUvbGludXgvcGVjaS5oDQo+IC0tLSBhL2luY2x1ZGUvbGludXgvcGVjaS5oDQo+ICsr
KyBiL2luY2x1ZGUvbGludXgvcGVjaS5oDQo+IEBAIC01OCw3ICs1OCw2IEBAIHN0YXRpYyBpbmxp
bmUgc3RydWN0IHBlY2lfY29udHJvbGxlciAqdG8NCj4gwqAvKioNCj4gwqAgKiBzdHJ1Y3QgcGVj
aV9kZXZpY2UgLSBQRUNJIGRldmljZQ0KPiDCoCAqIEBkZXY6IGRldmljZSBvYmplY3QgdG8gcmVn
aXN0ZXIgUEVDSSBkZXZpY2UgdG8gdGhlIGRldmljZSBtb2RlbA0KPiAtICogQGNvbnRyb2xsZXI6
IG1hbmFnZXMgdGhlIGJ1cyBzZWdtZW50IGhvc3RpbmcgdGhpcyBQRUNJIGRldmljZQ0KPiDCoCAq
IEBpbmZvOiBQRUNJIGRldmljZSBjaGFyYWN0ZXJpc3RpY3MNCj4gwqAgKiBAaW5mby5mYW1pbHk6
IGRldmljZSBmYW1pbHkNCj4gwqAgKiBAaW5mby5tb2RlbDogZGV2aWNlIG1vZGVsDQoNCg==
