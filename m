Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48475759F26
	for <lists+openbmc@lfdr.de>; Wed, 19 Jul 2023 22:00:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bHU1CCHS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5msJ1M5sz3bVG
	for <lists+openbmc@lfdr.de>; Thu, 20 Jul 2023 06:00:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bHU1CCHS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5mrc2JGMz2ytQ
	for <openbmc@lists.ozlabs.org>; Thu, 20 Jul 2023 06:00:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689796816; x=1721332816;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=cQANzp122acJqyg+wDMl6VobRp4/7wc0uaq4on5b1XY=;
  b=bHU1CCHSd5Q1HUL5QxQ77fHFnhVLw7Ts+rXBsPrEjAz9cRnsH/iFbRcG
   tWkYclriTfFBrpGbVhEPF3fj7Wyv6MWh0nDnGwZ/7HDX2Cn/QMqs2iHqM
   U/iT3aP3f8aPCYI402l1/XawlCMmIn7JvYa8GuQsTrrDe4Ke0468p3h+p
   10w/mI/f9hb+5ErvFMGLkvwYcS2CK/fxKW7qzvvu0F8+0g9faQC8B/0g4
   KYy6805BoZq23Q7MDKQHr0x9q9jAgSSCnZqFmNgOP2uxwD08F7RdNCTEp
   YBtUFVHqi33CdbHRaQv+MYjoqev5v8bAFQBf/TWog3ncS110bbCmV6Wdu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="346149843"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="346149843"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 13:00:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="724114997"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="724114997"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga002.jf.intel.com with ESMTP; 19 Jul 2023 13:00:11 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 19 Jul 2023 13:00:11 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 19 Jul 2023 13:00:10 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 19 Jul 2023 13:00:10 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 19 Jul 2023 13:00:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZPa8GN8bA2qajkgT0Yh1Yx+L4E1TutxDibdq3O6QRZXnNwZjx3XNI3B0rgT25a/UDV8/TIN0VJggqJHyBpFoNRh2nEjN63O+LcYPwSa3xT5veR5V/RnlWSqHkQTLqOP4au2IYH/Z5gGK/0o0xLM5jBPeRKmFwHeDdL4HH79CFxptpKaSmKvsr4+y6rHPajrRxyvggG4YnSa+uGPc+fLN74jh0ERSChVreAZzhozDBtx5RIqXmuSJ0aUQKVDw9P4B3hjQwFr8q7HdXm8G7iXNS1Zask3remlCrxhJY53wHnfZ3hJ9kfQBnufDAI90JOihICMUm8N3E64kTXsRciP3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQANzp122acJqyg+wDMl6VobRp4/7wc0uaq4on5b1XY=;
 b=TT73G3dsQambwnxEWcV9ZOS8t7yXc8k9N1RrzIzEUEW1JtQkXeZHCJBuy4pnGGxTPRYmahl60Ev6rxkT+Y44gbDoNumkTrSEQ/0ejLgjxnlBbS50ehdKs9BUHN7bPBzSLewSkeruKO0ykspK0FffJ6qopdopSmuoOp/id4q9pr4hZN8a3OnS8d73mHYF21LeBrZqfhlNzyN0oeLdcdmr9uxtqcwNfpanBlaWjHldl1SSoYV4hTtd0sPlgmFoZLk7ZFUi3T0PB9AyXphGfGlFYJoTqdxjCi4pALfHCcclTuyzLMeMLkOHOZqx3Y6xdKZhDuRTJhGgd6XuB2TD9DcFRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by PH7PR11MB8550.namprd11.prod.outlook.com (2603:10b6:510:30c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Wed, 19 Jul
 2023 20:00:07 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::2f24:2dc9:60b:a244]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::2f24:2dc9:60b:a244%7]) with mapi id 15.20.6609.024; Wed, 19 Jul 2023
 20:00:07 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Solanki, Naresh"
	<naresh.solanki@9elements.com>, "jdelvare@suse.com" <jdelvare@suse.com>
Subject: Re: [PATCH v3 1/3] peci: cpu: Add Intel Sapphire Rapids support
Thread-Topic: [PATCH v3 1/3] peci: cpu: Add Intel Sapphire Rapids support
Thread-Index: AQHZunC9ye1DzCkCt02/MtUrPVQgS6/BglgA
Date: Wed, 19 Jul 2023 20:00:07 +0000
Message-ID: <7df0f2d4afd1dcdb1478b6ee06937ef0827502ad.camel@intel.com>
References: <20230719184155.59375-1-Naresh.Solanki@9elements.com>
In-Reply-To: <20230719184155.59375-1-Naresh.Solanki@9elements.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5823:EE_|PH7PR11MB8550:EE_
x-ms-office365-filtering-correlation-id: f8295924-b16d-49cc-6b80-08db8892c071
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YlaTQm2xbTvwVQ7nACfwFRW7swL7/RmSQnEEIsCUudCzRkzruRNhv7u7U7Rrhx38VRfe2cgu2bjP/lPycbZ+y0sEpTjEX9x1Orv2JmFhEXzQ2NruVTzVqn+/6xuQr5wDjnh32xMqHZHNESC+SXsvRROqRVFL+ucxqe/j3pWGlnmaqcJBgG3pBvRIyCy9ntIrChHAN353N3Ga6B7zRRAi2yZLuhngTXLCGadyTG0nb11tzagPVDl5OY41Q5eBojreDBZ/m0WyoW/KcI0bswy9QOuYOU5tFx8Eg3UOege7KyfwM1/StDsIeSWZO1tOxkHNVk3XgmEK8QduaOGNyst4+4MblV0vODXSqZXzy6mY4IZ/xe4uo7vZzTnBcuot7EKOVWc3cTvDPkAdoFvH2blFpFSBvPh6Imejgc/NbKn2g2ja24i3lptPZbNJF+tZfBVEuKwYySyBhGO51AKItB/lDYIChZO1EyUshhqfogNA1Fnx1P4jgvDrXJNsHxb0TgYL/80cWf+VadJp2iN1UINMO+sTGuIO90tZegFuQoiFc/J334IX4Tq2igqKVIjkcfeg7kzXvOHyUBJT8fx4ptVzAbxv9mTGgu1edG8Lc3gK7EYNC7FmIjpXf0QP7RHAoSiz
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5823.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(366004)(396003)(376002)(136003)(451199021)(2616005)(316002)(41300700001)(83380400001)(186003)(6512007)(6506007)(26005)(6486002)(478600001)(82960400001)(54906003)(110136005)(91956017)(122000001)(71200400001)(66446008)(4326008)(76116006)(66476007)(66946007)(66556008)(64756008)(38100700002)(86362001)(38070700005)(8676002)(2906002)(5660300002)(8936002)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UitJdnJWMEFiN2ZBRHFFVHVWcnpBWlkxNmFOaXhLcVJkVVIzZDNORXcydzNV?=
 =?utf-8?B?ajhDUnlya0R5MGtZTTEvWmRTSi9LNGk4SXAxUmtGcEQ5eHp4N085K0FjSkVy?=
 =?utf-8?B?Q3E4UzZEWEJvL1V4NXRja2M2cy85Q3dwQjE0T2JBdjg2S2w2VldEODczY2Yr?=
 =?utf-8?B?OXp2Vm1Xa0dCdVVXeThUejRDT2c3MGZZVGY2TnZzWHhUV0RlUWtJSkxWWllC?=
 =?utf-8?B?NEVoUjFnVnppRHNEU0ZnK3ZWMDAvVG1xako4UHYvQmNmOTIvRHZ0Uks4YjhY?=
 =?utf-8?B?NTVFRWZ3R0RGbUdKRDZ4c2ZtNUcrTjJuMm05M0ZLbTNUQUdoY3hBZGR6cVM4?=
 =?utf-8?B?aElQOTUwMXdWUGNqMXRJYVlFcHNCWWFHLytSMzRYS1NQWkdlTzJ6T2lHYmpP?=
 =?utf-8?B?d2hRWER5dE5DOEVDK2MyN0EzNmkwbjEzSytMRTY5TlFtSG9pWkRQcVZObkUw?=
 =?utf-8?B?dUI3Y1pzVllOYVdMRHpQYWZKZWE4QWQ5UlMyMnpIVUpqaVpXb2QxUkRUb2cw?=
 =?utf-8?B?clFMRDcvanh4QjBNSUlpVnpBRkRSMmdJMU9RY3V3QVBiSnZYUThKVkZOaGtN?=
 =?utf-8?B?UzliT3R6YW1ud1NNTHBXZjZSbVRTRGthZHZ1WW9sZ2oySEJibGlBZGxxaktJ?=
 =?utf-8?B?czkrbUd5K3RLdjNXY01jOEF1VmFvMmNYUmVrdTB4N3BycmRzYkhBL1hRVG4x?=
 =?utf-8?B?T0w3ZDI0TnZhT2M0NDViUGU2K3QyRnBRcllDaXUxS3c4a1NRVVcwaFBlYnFp?=
 =?utf-8?B?dDhjUVpZMmh0VkZvVzFzRkFIN0Q0T3p5SGJDRnU3MUMvbzZMMUZiS3dFYStF?=
 =?utf-8?B?R0VIcmpubVVrQ2R1bzdCZGhFREZMUnVrZUVabDZNVDNRY09iM09hWE1FNUFI?=
 =?utf-8?B?RTlKTnF6eUFxd0dyU0pzKzdXTHY1cVp0ZkZPTjhVazBpbDQwVFFaWC81bU9S?=
 =?utf-8?B?bzlkbkVmbElwRytqaXY5QlJDVlVLQnBIWVgvaGpENDVuV01tN1ExQlphZzVP?=
 =?utf-8?B?NXZQdXVBbmUvNFlVRWh3Y0N4aWhTUVZqeUlRbVk5QWNnZHk0eW0wdEQwc3pu?=
 =?utf-8?B?bEViN0xtd3R0elRtRHl4b1d1TnlWQ2EvcVVHWFVoQ3htak8zbmVpR1B3bTlt?=
 =?utf-8?B?dkIvMlIzdlFHWU9aMkZhb1cxS2JlbmsyTWFwRU9KOUxWZ0VESGVvSHRTZUZ0?=
 =?utf-8?B?VUEyRjBVelREcml3SGExQncvdnUyS3JuTlBGNVBRMGsvemtZQm9aTk5lSk82?=
 =?utf-8?B?clV4dUl3dlBoNm5kTEg1QTgxNjY0cWNrQzhyVlMyejVjdUJobVNvOSt6RXZx?=
 =?utf-8?B?UGJraE5xZUdHY1lLbHdVRFQrTHlHb21kbWxYanRVSVhjbnFDZzJIRjV6cTg0?=
 =?utf-8?B?S0FVQmhQVlQ1N1pNc2dMZ2JaYUVZT0R2ZGtmWVFYVVJpZ3RxT09pbDJja2R5?=
 =?utf-8?B?aHcxZE9YRXZJVkJNdWtHSFdYOFY4bnUvRFUvUy9vWVp0SEFtcitNV2FhN1k1?=
 =?utf-8?B?RTZ5MW41ZEcrSmEwNDlOelVDRVo2clN0UXo5aHNNUVYxZFpWNUtTU2xOTUpZ?=
 =?utf-8?B?SmVCcVpCeThHL3ZHWUdPQWhDeGthMUc5elVpY0VVL2RDY3luNGQydTZuMmtj?=
 =?utf-8?B?dHJMUlJBWHk2ZFRCTUNDNlN2NFp2QkIxdWhOdjhHaEwxL3N3T3FFWkFXL1Yw?=
 =?utf-8?B?U0dlRDBkdGw3U3c1U0J1aWhoWXdIVzB6NTRuQU1pQzJGbXdrK05CWUI4Ri9t?=
 =?utf-8?B?MFBpR3FkaDk5SXFtRnViWUhJVDZRa25RMkZHUEVvai96akkxck1Jc2txR3Rn?=
 =?utf-8?B?Rkcwa2ZlaW1TQUtETmNqRW96K2I0SWljRnMrKzVpejdldXRaa2d0NE9jWi9M?=
 =?utf-8?B?ejMwM0E0VDY0ZHpsaWlJZEQwZm9obWdtM3pnbS91ZUtPWVl3ZlBuTjhCVG1h?=
 =?utf-8?B?emFVMHhjczNJNW0vaU1QZTFJNTkzUTY3Vjg4OHkxTWEyL0ZpUVpCYXBPSFZa?=
 =?utf-8?B?SkphUTFKTUNScmJ4cUJLU2dyR3BCZVIxbnRXVHhDaTBWckxwUzFLbVdVcjdB?=
 =?utf-8?B?Skx0aTI2endZTlRKZ1U4bzM5bTFFVzJXaXZrYmJxRmFMa2N3ZXRnVnc0czNs?=
 =?utf-8?B?a1ZQYWk3Sk9tdzIwaHBNWlBSanE2Zzh5QjQ2TmxOYWh6RzVreHdpNUdrOHcw?=
 =?utf-8?B?MXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9012F4AD3337DC4297409E2DC8258ED6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8295924-b16d-49cc-6b80-08db8892c071
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2023 20:00:07.7957
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SmQ3+jr38IBkQAVKpYDXMQNp4RS8Gan5p6zD46TutKu2K+VldDV2NYXAa1iDrEnXNcNVFl2kC+0NDLrfhPVRNlVsgBAyypocUR6w3JeWOBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8550
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Rudolph, Patrick" <patrick.rudolph@9elements.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gV2VkLCAyMDIzLTA3LTE5IGF0IDIwOjQxICswMjAwLCBOYXJlc2ggU29sYW5raSB3cm90ZToN
Cj4gQWRkIHN1cHBvcnQgZm9yIGRldGVjdGlvbiBvZiBJbnRlbCBTYXBwaGlyZSBSYXBpZHMgcHJv
Y2Vzc29yIGJhc2VkIG9uDQo+IENQVSBmYW1pbHkgJiBtb2RlbC4NCj4gDQo+IFNhcHBoaXJlIFJh
cGlkcyBYZW9uIHByb2Nlc3NvcnMgd2l0aCB0aGUgZmFtaWx5IHNldCB0byA2IGFuZCB0aGUNCj4g
bW9kZWwgc2V0IHRvIElOVEVMX0ZBTTZfU0FQUEhJUkVSQVBJRFNfWC4gVGhlIGRhdGEgZmllbGQg
Zm9yIHRoaXMgZW50cnkNCj4gaXMgInNwciIuDQo+IA0KPiBUZXN0ZWQgdGhlIHBhdGNoIHNlcmll
cyB3aXRoIEFTVDI2MDAgQk1DIHdpdGggNFMgSW50ZWwgU2FwcGhpcmUgUmFwaWRzDQo+IHByb2Nl
c3NvcnMgJiB2ZXJpZmllZCBieSByZWFkaW5nIGNwdSAmIGRpbW0gdGVtcGVyYXR1cmUuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNrIFJ1ZG9scGggPHBhdHJpY2sucnVkb2xwaEA5ZWxlbWVu
dHMuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBOYXJlc2ggU29sYW5raSA8TmFyZXNoLlNvbGFua2lA
OWVsZW1lbnRzLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEl3b25hIFdpbmlhcnNrYSA8aXdvbmEud2lu
aWFyc2thQGludGVsLmNvbT4NCg0KVGhhbmtzDQotSXdvbmENCg0KPiAtLS0NCj4gQ2hhbmdlcyBp
biBWMzoNCj4gLSBNb3ZlIHNwciBlbnRyeSBhdCBlbmQgb2Ygc3RydWN0IHBlY2lfY3B1X2Rldmlj
ZV9pZHMNCj4gLSBNZW50aW9uIHRlc3Qgd2l0aCB0aGUgcGF0Y2guDQo+IENoYW5nZXMgaW4gVjI6
DQo+IC0gUmVmYWN0b3JlZCBmcm9tIHByZXZpb3VzIHBhdGNoc2V0IGFzIHNlcGVyYXRlIHBhdGNo
IGJhc2VkIG9uIHN1YnN5c3RlbS4NCj4gLS0tDQo+IMKgZHJpdmVycy9wZWNpL2NwdS5jIHwgNSAr
KysrKw0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3BlY2kvY3B1LmMgYi9kcml2ZXJzL3BlY2kvY3B1LmMNCj4gaW5kZXggZGU0
YTdiM2U1OTY2Li5iZDk5MGFjZDkyYjggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvcGVjaS9jcHUu
Yw0KPiArKysgYi9kcml2ZXJzL3BlY2kvY3B1LmMNCj4gQEAgLTMyMyw2ICszMjMsMTEgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBwZWNpX2RldmljZV9pZCBwZWNpX2NwdV9kZXZpY2VfaWRzW10NCj4g
PSB7DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLm1vZGVswqDCoD0gSU5URUxf
RkFNNl9JQ0VMQUtFX0QsDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLmRhdGHC
oMKgwqA9ICJpY3hkIiwNCj4gwqDCoMKgwqDCoMKgwqDCoH0sDQo+ICvCoMKgwqDCoMKgwqDCoHsg
LyogU2FwcGhpcmUgUmFwaWRzIFhlb24gKi8NCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoC5mYW1pbHnCoD0gNiwNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC5tb2Rl
bMKgwqA9IElOVEVMX0ZBTTZfU0FQUEhJUkVSQVBJRFNfWCwNCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoC5kYXRhwqDCoMKgPSAic3ByIiwNCj4gK8KgwqDCoMKgwqDCoMKgfSwNCj4g
wqDCoMKgwqDCoMKgwqDCoHsgfQ0KPiDCoH07DQo+IMKgTU9EVUxFX0RFVklDRV9UQUJMRShwZWNp
LCBwZWNpX2NwdV9kZXZpY2VfaWRzKTsNCj4gDQo+IGJhc2UtY29tbWl0OiA0ZGJiYWY4ZmJkYmQx
M2FkYzgwNzMxYjI0NTIyNTc4NTdlNGMyZDhiDQoNCg==
