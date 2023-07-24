Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 233D475FCDB
	for <lists+openbmc@lfdr.de>; Mon, 24 Jul 2023 19:03:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GRDZchc0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8mhH01fxz30fb
	for <lists+openbmc@lfdr.de>; Tue, 25 Jul 2023 03:03:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GRDZchc0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8mgc5VR8z2yVP
	for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2023 03:02:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690218173; x=1721754173;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=du8XWjXo076jlZ5ISL0tq5vIDPA+s1Yk9HVrGjxwbhg=;
  b=GRDZchc0NftaWf6IHPKvaUPEA40gU8QHq93s0EzjYqP5aJSMj+2Hf5Q/
   s0uO+6+1Zz2F0mt91MBAmL+MeWwPGjrfTmOURU89jaZL7vs2mCIhKiT9S
   HZvhH/f4DzhmwV62srMcRTm6Z+grafKoZv6ICGE3LsR85JDBsNd6lrc5w
   QT90o9+JeJP5EN/zQLnaai7AhFuN+vw0OrKafNQPxYpIUGi0TFKS3cIe/
   00/+6FCq68j0TvkFxc7d3A8NvE4werPDvRqT0Pi40hM/hQ2iDUgssvwZ/
   7O61jhAS4uMaTU6X8t6O75TIVCbIi9aAJKLc7hMBq3Zl626q4FpqvkeUI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="398406284"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="398406284"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 10:02:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="849706506"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="849706506"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga004.jf.intel.com with ESMTP; 24 Jul 2023 10:02:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 10:02:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 10:02:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 10:02:18 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 10:02:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahfymnZC8WebKI/tmCYCAm/573YxNMmNQYP+cu4KwRHllxMN2flPkT+uHrQBfIy0RHg4VfLukGS4g4tf3+eXN/g7M7ynLt8RwBFKYkknEHtVwoidkpZ1t+OqioIK7NL3PBBbnJs8cCqGy/Lbi2g6G8no5jOoNljlj1MSGF6DlfFPIMjHdVaGTjRDzwyoLDvCUGEimgVB89fyiBnsQPGSkvogx17f3hv8UInr+p27eTio59Zyw+bHxZh1fAD89D9rnBJumwKBkmy604ageL5VxIYrTjtrqSOeDTwgbzkMNtuAMLrRNikt1tNZ4r8y9pmnnAdcu9ClYTOXpXAmbgHo7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=du8XWjXo076jlZ5ISL0tq5vIDPA+s1Yk9HVrGjxwbhg=;
 b=ZCZ0b/XdhT2uOi0RT97KAugfjzIO18Qsk+m3/Km+QbNqR18iiGVvhsTXg9QmSc6PKsxd8tC+oxvUYR5EcGbWeMu6nz9GMPh8REJb80s5mQ9JXmQhRFH6WITwYQsC6GL/z2na3yHWrkLT9ICppaugEAM0uFenQE/jI6iKlw3e8sCZvT7gAV+Z0Lh3TdGUPiwmp4RQUtVmztGO7J6S8drf+qq8RPqK1wDxPm4EnXDi4AanZE5Jli97lx57GMdd/gWnuLIAIfIY17RCYSHJi2JZ34fd7qqo7F91a+0xbB9+gmIZPjOYBAMIhHTngcFKrlImTwW5IInQISpeVfCmX9eTfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by IA1PR11MB7246.namprd11.prod.outlook.com (2603:10b6:208:42e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 17:02:15 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::95fe:e2ee:d733:6399]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::95fe:e2ee:d733:6399%5]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 17:02:15 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "robh@kernel.org" <robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: Add bindings for peci-npcm
Thread-Topic: [PATCH 1/4] dt-bindings: Add bindings for peci-npcm
Thread-Index: AQHZuo3AbGEw2WnzRUim2nq9di7rt6/CLwOAgAAdNACABrewAIAAKCsA
Date: Mon, 24 Jul 2023 17:02:15 +0000
Message-ID: <7858c5484547b1915a688ec2faaa57b4ec1c5586.camel@intel.com>
References: <20230719220853.1029316-1-iwona.winiarska@intel.com>
	 <20230719220853.1029316-2-iwona.winiarska@intel.com>
	 <69fa21b4-3197-d5f1-f300-d070cf5e7fda@linaro.org>
	 <6ce71c01371aefa818375d6e07b3efb8e747c86a.camel@intel.com>
	 <20230724143826.GA3433528-robh@kernel.org>
In-Reply-To: <20230724143826.GA3433528-robh@kernel.org>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5823:EE_|IA1PR11MB7246:EE_
x-ms-office365-filtering-correlation-id: bda5737b-fb74-4a8f-f69d-08db8c67bb2a
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VfRtF5VuIMO+dTkjDSBemFhSnxU3eMqTpJ8mVw/uPhdHLjtt+BT2aLopZC57da878lc/cs6AXgdeKZXGGTO56UgmuY9MIkbdRDA2zzm2NPRqyXk0Iw13vbHk/MrZYBOq42wjf3WX00Gt5oFJtpbUkyUN/fiJklgNZlphP2L2F2kUZuZFAbcnQ8xFP+BixpNyeNsh3KrNP1DcayJ9br9jOrK2IrQfcW1/3/J9YRBOz02Qo+E64bXh3RFt0YO1dL8jVsJQCM0Tya11aEKFBiIV17SwYg0m73YW4w+kal8Bdu+fIO7M6nbscOYFcXcbD6Hpb5DLuFkkA9nw9BvxgZaDWiiBKeTYiddSFyVSXdNzf95jwaj34dOGLXSyem36GIFJLYD+mWAC94Y1behz29AQFnEGAJGKqduCMVWV8AQnl0dFtVHPKHdnKApPvP6xmyZ93vLxv2HTLXQcxU8ovN1cdxsFmDPtNDPRxAiWiG7ihFOH7VouDTDd5URrNFk9DrTa4M+KCQJNb/S2+EXUctyO6rX9oeZ94iUT3Ho+pHHIN8VHU6GTNM4JWOxXRFF7QozksF4JHnNikMJ1MEpVfycIF2KBq1Prx+60/FNYfs3U4fKX8Ayc3XvAS/Gc+fNDrqOK0wu+uId1SzJkFgAtR+a/YA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5823.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(39860400002)(376002)(136003)(366004)(451199021)(38100700002)(122000001)(4326008)(36756003)(53546011)(2616005)(83380400001)(7416002)(8936002)(8676002)(5660300002)(66556008)(66446008)(478600001)(54906003)(64756008)(6916009)(66476007)(66946007)(91956017)(76116006)(316002)(41300700001)(71200400001)(26005)(186003)(6506007)(966005)(6486002)(6512007)(2906002)(38070700005)(86362001)(82960400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QzdadzFJYUVWaE1tQWIrNzBvckFvSUNSblNWLzBxYTkrU1ozMXhZV2drZXdV?=
 =?utf-8?B?OHpKd3o4U2ZUQ2grdUJHV2xCdWJ5TTRoemZIcWl6Q25SKy9ON2lEYjFYR0x5?=
 =?utf-8?B?anExMzVnVDlBRnpjZnVBdFZtOFVmTlRKWTlTTkE5Y0g0c2owSnF4TXVIaWxV?=
 =?utf-8?B?Q0QzSjFmcUlyRmZNM0ZDTVJZRU0wY1ltcG94NE1Ha1Ara3UvY2dRTGd3SUZZ?=
 =?utf-8?B?K2hKYU9nVXVsR3BiazV0NFhmcUZRSkhpZ0c2cnFpaWpORmVrbnN6RTlxUjZ2?=
 =?utf-8?B?VEdsRkF4dmd5MGhnVHFwQUF6dW4zenFXclVCQlQ3eGxxeUF5WlYwVEExVC82?=
 =?utf-8?B?TDRJcEJsRlI0YzlHb0R4UStCRkp2TUg5d0toTW56cGdlQWIwWXliZVhkbXdI?=
 =?utf-8?B?MXl4a3JwQzRHSGNaTFJOeGdLMVIrWTNvdnZYZDFoU2dPeGhvVDlDMS9GOEpw?=
 =?utf-8?B?S2RlbGIzaXpIZGZaekhIbUE3NWtZY3Q1LzAzY003U05LVndHUG5wOHVLNUNo?=
 =?utf-8?B?eGxXYk82eDg5eXp3RDFUUkhCRkNLOURMdG1GQmcrblRqUVZOOTRTRGgzdi9q?=
 =?utf-8?B?ODlHbUxjcHdJckpUenBJeTdsMU1nUWpZZWI3aVV3Z001ajV0QUFlZUxYdGRh?=
 =?utf-8?B?ZzhaTE5kMXBwKzFWbStJelFPUUZnekFTV3pUZGgxSGpKZEpJemhneVJ1ZFcy?=
 =?utf-8?B?NHdCd3luYlhuK3k5UG1pVXZEUmNDUnhJZ1JHMUsxSFpNK1YzOW9JNDAzUjJI?=
 =?utf-8?B?eU11VlRWOFRYRUsvdWFES1BYTXRNVUF6d3FuRXVSazNwYS9yZGJMQkdZbndo?=
 =?utf-8?B?UFhXUGNJbElLR3lTVXpvSHc5VDVoMW5LODJ3VzdYOGdzS01GTGxiYzRPK2V3?=
 =?utf-8?B?SFZQU1VneGY2V3JYNGsxZVNpaDhNUGJLV2htVnozY2FsMW96Qys1TmRIdHY5?=
 =?utf-8?B?bjlXeWFlL0ZZOXFPSEQxM2hBVzEwRy90MTZSclBPWlVpb253Nk5YclJVcEJX?=
 =?utf-8?B?clJWQ2Q2NTFsRllCMkFXYlBrU1k4bmx1L1pCSjVyZkNld2JLQ1pWMFlZU21J?=
 =?utf-8?B?cmtWbFhHVnBWejFmZGNkVmFkMFB1QmxqZ2tacmhLZE5xZVBpMWVEUEF5ZDRa?=
 =?utf-8?B?M0FrQ1h1bmtVd0g3WHNXTjd1QXNYZkZ0R0JTZ25mRW16L09DekRLVFVXWmVv?=
 =?utf-8?B?dlg1Q3BadmZOamVvdkI4N293NUtLOVlJVFZRWm9PdGxxUk4yQnlXbmxnbndp?=
 =?utf-8?B?eWlxeU1kVHpCdVM3VitNUGpKaUw1VVBIWnlPV01yY0w3aEJ1ODFINHk3M0Q2?=
 =?utf-8?B?THlXbWlSMEJ5YmFoaDBqVm1VV09kOGFaeTJMLzN3a2RqYmdvL0JpQ3R6OTJh?=
 =?utf-8?B?OHVaU2toeWpsQXlKdi9ZL0tMYThyMS93REJJb05palY2ZjZXeHZIbXFZN2Rn?=
 =?utf-8?B?b1l5eEJSQkNsaG1iQnNrY2Vkbzh6N2pYUWptRWUvSko3Qm5Cb254SDB4OWhy?=
 =?utf-8?B?dyt0SWUyTVdYUnlPdmhKSnp5WVF0aExlVEwxWmJOYWxRSUxaMnIyMlpkSG9H?=
 =?utf-8?B?azg0bnNRaWhJUmM4cnVvUkpWUE5DSEJyY1BsR2V4M25IVFdYcTVVNVhPOUdH?=
 =?utf-8?B?SGlWY3RmR0tpS2pyYjVCai81UnF2cmFLa0Q0MXdhem1uMmNEYkJFa3hqajhM?=
 =?utf-8?B?VEM4OUZDekNSaDFuVmRDUnhBeERhWXhTaWw1WkluNXZOMnB5UmJUcXFxa3Uz?=
 =?utf-8?B?akdNdmk1NElNOERnNlVIOU1UZ0FrS05OQzZxOGYzanhicHQ0TUZWcWsrU0ND?=
 =?utf-8?B?YjRYMDdoVDhUdWpoZlZVT2hnQXAxV0dHTzBmQlFpZEE0WEZUay9LS0NLS1JX?=
 =?utf-8?B?UEVEbzNkNEF6YWsvcnFQa3p2TWJMQUNUd05jbEFLRy9YWlRPcWNwejBMQWJN?=
 =?utf-8?B?T0hVd2N0THE1cXVIQXdYMXhXS1lSQkJDYWRqeUZLN1lLU0pVSEhaWlBWQk1k?=
 =?utf-8?B?MjJSZ0hLcS9UbjNvUE94K09VMWtOZzBTQ21KRGtwL01Zb29Mby9iRXV3Y3RW?=
 =?utf-8?B?L1VFbEdiU1VDSWNLbGtYQndoN1BFbWZpdDdVWU9UdGl3elpXWjFzSXMweXBy?=
 =?utf-8?B?a0VMVHFjbnV0WFRIWHN0dDVKeFhNUTBhUG9HQ1hFS2IzRHE4UUNKMS9wNzFF?=
 =?utf-8?B?Wnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C9AEA2CCA6B5D143875770921E855DDC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bda5737b-fb74-4a8f-f69d-08db8c67bb2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 17:02:15.2650
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vL+aguXyqMFfLlnQO9UIw7MVkzanyAWHRHbGzCPAUIp/h6SwYgxyRZxnVDms9siws5tN3e7wD/BSXDhxcKnonnHmTudLg4PxStBcWcBUlF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7246
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "tmaimon77@gmail.com" <tmaimon77@gmail.com>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "avifishman70@gmail.com" <avifishman70@gmail.com>, "venture@google.com" <venture@google.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>, "warp5tw@gmail.com" <warp5tw@gmail.com>, "Fair, Benjamin" <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gTW9uLCAyMDIzLTA3LTI0IGF0IDA4OjM4IC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
T24gVGh1LCBKdWwgMjAsIDIwMjMgYXQgMDg6MDM6MjhBTSArMDAwMCwgV2luaWFyc2thLCBJd29u
YSB3cm90ZToNCj4gPiBPbiBUaHUsIDIwMjMtMDctMjAgYXQgMDg6MTggKzAyMDAsIEtyenlzenRv
ZiBLb3psb3dza2kgd3JvdGU6DQo+ID4gPiBPbiAyMC8wNy8yMDIzIDAwOjA4LCBJd29uYSBXaW5p
YXJza2Egd3JvdGU6DQo+ID4gPiA+IEZyb206IFRvbWVyIE1haW1vbiA8dG1haW1vbjc3QGdtYWls
LmNvbT4NCj4gPiA+ID4gDQo+ID4gPiA+IEFkZCBkZXZpY2UgdHJlZSBiaW5kaW5ncyBmb3IgdGhl
IHBlY2ktbnBjbSBjb250cm9sbGVyIGRyaXZlci4NCj4gPiA+ID4gDQo+ID4gPiA+IFNpZ25lZC1v
ZmYtYnk6IFRvbWVyIE1haW1vbiA8dG1haW1vbjc3QGdtYWlsLmNvbT4NCj4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogVHlyb25lIFRpbmcgPHdhcnA1dHdAZ21haWwuY29tPg0KPiA+ID4gPiBDby1kZXZl
bG9wZWQtYnk6IEl3b25hIFdpbmlhcnNrYSA8aXdvbmEud2luaWFyc2thQGludGVsLmNvbT4NCj4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogSXdvbmEgV2luaWFyc2thIDxpd29uYS53aW5pYXJza2FAaW50
ZWwuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+IA0KPiA+ID4gTm8gY2hhbmdlcyBmcm9tIHByZXZp
b3VzIHZlcnNpb25zPyBOb3RoaW5nIGltcHJvdmVkPw0KPiA+IA0KPiA+IFRoaXMgaXMgdGhlIGZp
cnN0IHN1Ym1pc3Npb24uDQo+IA0KPiAxM3RoIGJ5IG15IGNvdW50Lg0KPiANCj4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwNjE2MTkzNDUwLjQxMzM2Ni0yLWl3b25hLndpbmlhcnNr
YUBpbnRlbC5jb20vDQoNClRoaXMgd2FzIGp1c3QgYSByZXF1ZXN0IGZvciB0ZXN0aW5nIHNlbnQg
ZXhjbHVzaXZlbHkgdG8gb3BlbmJtYyBtYWlsaW5nbGlzdCAoYW5kDQpidHcgLSB0aGVyZSB3ZXJl
IG5vIGNoYW5nZXMgaW4gYmV0d2VlbikuDQoNCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
LzIwMTkxMjExMTk0NjI0LjI4NzItOC1qYWUuaHl1bi55b29AbGludXguaW50ZWwuY29tLw0KDQpU
aGlzIGlzIHBhcnQgb2YgYSBzZXJpZXMgdGhhdCBjb250YWlucyB3aG9sZSwgY3VycmVudGx5IG9i
c29sZXRlZCwgUEVDSQ0Kc3Vic3lzdGVtLCBpbiBhIGZvcm0gdGhhdCBuZXZlciBnb3QgbWVyZ2Vk
IGludG8gbWFpbmxpbmUgTGludXguDQoNClRoZSBQRUNJIHN1YnN5c3RlbSB0aGF0IGlzIGN1cnJl
bnRseSBwcmVzZW50IGluIG1haW5saW5lIExpbnV4IGRpZG4ndCBpbmNsdWRlDQpOdXZvdG9uIGRy
aXZlcjoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIyMDIwODE1MzYzOS4yNTUyNzgt
MS1pd29uYS53aW5pYXJza2FAaW50ZWwuY29tLw0KDQpUaGVyZSBpcyBhIHN1YnNldCBvZiBwYXRj
aGVzIHRoYXQgaXMgY29tbW9uIGJldHdlZW4gdGhpcyBzdWJtaXNzaW9uIGFuZCB0aGUNCm9ic29s
ZXRlZCBQRUNJIHN1YnN5c3RlbSBzZXJpZXMgKHRoZSBsaW5rZWQgdjExKSwgYnV0IEkgZG9uJ3Qg
c2VlIGhvdyBjb250aW51aW5nDQp0aGF0IG51bWJlcmluZyB3b3VsZCBwcm92aWRlIGFueSB1c2Vm
dWwgaW5mb3JtYXRpb24gdG8gcmV2aWV3ZXJzLg0KDQpUaGFua3MNCi1Jd29uYQ0K
