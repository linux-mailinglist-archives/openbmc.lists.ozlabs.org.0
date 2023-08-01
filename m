Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0375176C036
	for <lists+openbmc@lfdr.de>; Wed,  2 Aug 2023 00:11:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j44xhuDz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFq896gGPz2ytc
	for <lists+openbmc@lfdr.de>; Wed,  2 Aug 2023 08:11:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j44xhuDz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mgamail.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFq7X0p91z2yDD
	for <openbmc@lists.ozlabs.org>; Wed,  2 Aug 2023 08:11:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690927864; x=1722463864;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=R73vyG9VDW2faClltI3DadGVNgBR+gy26XbR2lbBPBU=;
  b=j44xhuDzroiyG4e0Lgi9eD8WOvz/CMN/oU87B+TNNJmDmqK7QgOdisIE
   4v6j42lv0z4c3FESGw+f33dEKscyas+1FgOzKMQVbc4R8eD+N7xrQdmWJ
   c2SYITscDt0TWe9LB3IY2ussu/zGgLN8F/v/3lwFfm6o3PzQSQor+yqGL
   puXIn/qVfZOuxZwp6l5i7bnbmm5zTqhXTBbdwZCCrnjSe3S8ScTRbtQTd
   ACZRkBmGFvAfKYehZfkGuf1vDNdkUbABwmQjzYBcMlcJUducfVlRRtU+4
   xbsRYsUBZToS8+MBA9kobqc2ypBplTCl1SglMKc789kicCOUph07Grj9F
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="400370034"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="400370034"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 15:10:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="763979275"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="763979275"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga001.jf.intel.com with ESMTP; 01 Aug 2023 15:10:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 15:10:56 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 1 Aug 2023 15:10:56 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 1 Aug 2023 15:10:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CSPxeoRGuXA7pLny2BF8rpoX4dx2HNj9eGgcFiusfx+0BWYDo6hUBMPN9sW7AlPo1jnkpt7mD5Tg1gzegelorFd+E/O4owV/5UWCa/w/ROhcYZTjPBqFXJwg9go1Dz/OJJ0GXAfzhisb9hOO6TzkO4N+1AdPsFvdCa74pusGVmtCwN65+xzvBcXu+bcuXoio5G/Jqdr/EgmHYVRUonO3URCGvXqaAmCveVt8ztC6I+CnOK+BhD129SXkyg10rolZoWRd8LqWvcIa0P9jVTvzdL7paRvIaMQqxgqWd3LKAgfD8gJRagMPeIwLtK+iJXgYae3Y1ufAsb2Bif+WqTGPEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R73vyG9VDW2faClltI3DadGVNgBR+gy26XbR2lbBPBU=;
 b=XAhcKopu2+pWYPkpufdGi3KfBsn0UDqWV1mmQGzImU8vb4BSSKEP85sqOPaN26AhlKMzk/XV0+awum865P1cJl3riPkcCmDpjvKY7Hz+5BQKqxvUN6VazbWozKM7P31ZiQeCCvHgzW7JPm3XCAFrRZtGrYAIOiWM/5y7XAGabhm3Tr/L9wvAKnKW2SUASsgd7kWrQgIAC6NkKhZaEKKvCpnLi7L8OJaEkoO4exNk1fYxlfZTKEvdJXKTr/YDR97mfbbBm50Js+YogxUTHoXP0xfIhE2iGwYZ659tfgtBmS/uZg8KB69W4chzQ7GgEgY2Dtf/dZvpiY/yWh3IjNVLKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by PH0PR11MB5878.namprd11.prod.outlook.com (2603:10b6:510:14c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 22:10:53 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::95fe:e2ee:d733:6399]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::95fe:e2ee:d733:6399%5]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 22:10:53 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "tmaimon77@gmail.com" <tmaimon77@gmail.com>
Subject: Re: [PATCH v3 3/4] ARM: dts: nuvoton: Add PECI controller node
Thread-Topic: [PATCH v3 3/4] ARM: dts: nuvoton: Add PECI controller node
Thread-Index: AQHZwMg4Ez9CrQrxEEipyWa5hD63Wa/VJjMAgADiSoA=
Date: Tue, 1 Aug 2023 22:10:53 +0000
Message-ID: <40d81e28804d82d19d688f76dc50f1e51503eba3.camel@intel.com>
References: <20230727202126.1477515-1-iwona.winiarska@intel.com>
	 <20230727202126.1477515-4-iwona.winiarska@intel.com>
	 <CAP6Zq1hh_wr81L4vtYDct69rrqdSrxjap9-uZfvmt0xMvrfRJQ@mail.gmail.com>
In-Reply-To: <CAP6Zq1hh_wr81L4vtYDct69rrqdSrxjap9-uZfvmt0xMvrfRJQ@mail.gmail.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5823:EE_|PH0PR11MB5878:EE_
x-ms-office365-filtering-correlation-id: 6105eb2c-d003-40cc-ef14-08db92dc2c01
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z6R6J49iApp1VLVMq1wwl51iTvWlA+nvAvqsjsy34wg56lAU+C9GHgmD4Sw1kWBWe+oQ1YJKxnxLnHsf6Ga2lGRM3ZvEUZ3IKDkYZ+FOSckaVHc+F24fYHm6KG/GFs/cTELGzGAxm3eRpiWOGNNGCaBw7pRBhjNt+mENt2mxXt2z9G6X6Mi0hjCKf4OJMd9A9S6V9C+7MwR3gmX3XMyscbFHf+tdmESBKGy8n+chQOuyhoG0HLVS+WL64EtsnUa7KAqVbwv+M93ZCo4J4RV3JQV0qVLf2Bzsz8yzB2sDQDdQMvhKOI//eB6MCaheoUePjNXcuPaTGntAc1kWLweb1QPuzIH61/cVZeoCOF5ywNeFeM7GiyeQoeM8crYtDQrWotr+8DzsHkNCQv54NDI14mUzNe05YWIV97OXqPayhgnGXsjFYT1r4nL1SpTtHlNcKZy7a0vek0gCwFmKjDqJsvBSdlmsKXCqYyJ/CRrTWtHeGsbYLzKmM63GYEgHz6WSdonN5D+0vjRU7uroNT6cY8KENdSTVXMwcNQRQxXJCoX58GOw79e2UCqeoEjRsBlz4xV2v04OQc7dsUDdW4N3KB1IclEYPaoMa7u9iLLdN+1HF/LuSenIE8Nf50ghKhvQ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5823.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(39860400002)(136003)(346002)(376002)(451199021)(2906002)(41300700001)(38070700005)(2616005)(478600001)(6486002)(38100700002)(83380400001)(86362001)(36756003)(8936002)(8676002)(7416002)(186003)(316002)(6916009)(26005)(122000001)(54906003)(71200400001)(6512007)(82960400001)(5660300002)(4326008)(66446008)(64756008)(66476007)(66556008)(66946007)(76116006)(91956017)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QWgzVVU4TzJ1NzlBb0p3eDg4L1Z5R2F3WUtFYndtdFFWbzdPUGVpVTB2MzJy?=
 =?utf-8?B?SERicTNseWVxZnB6LzhSb3o5ZlN5QXpBcVZJYjJBczc2ejVydHBwTTdvbjZQ?=
 =?utf-8?B?QzZzdGMwaHN4SEQyT2ZDV0ZmNW9aeUViVzZ0R3BKM09zVi9sV2E0RytzdTRw?=
 =?utf-8?B?b1BkWDJxRUxhTmRvdnNEdGtBM1Y5eXlmQklmMmZUTFR3R1pYZnh5UVY0ejRR?=
 =?utf-8?B?VmJGVTIwK25oT0lPK1NiS0RleWpmMzhTaUlwVFhnVWxJSG5pMVZFc29RNXdS?=
 =?utf-8?B?TE02TnEzbW0vUGIrTGxrQXQ0M3BOQkdvc0wzZit6MFdMUzZtQ1JaWVpUWkJQ?=
 =?utf-8?B?QnVvdkNTUDdKS2grckhKOUVEKzJMU05ZS2g3cEQ3Y3lSYTNzc3IyQXlEb0ky?=
 =?utf-8?B?U21vK0E4OEhSQkFlV3BYSW1Ub1o5bVVJT2Ryek9FMm1TRnlST3ZrZFdaUnFE?=
 =?utf-8?B?b0F4N3JpaTIxRkZKQ1RzSXRTMmYrMVl0ZFBBSlEyZXlMZ2JlZVM3L2tHYld0?=
 =?utf-8?B?bjhCYTFhYjl3bHNoVXZEMnYxTlA3L21tK3dJdVlhT2dVVEhXWlJyOTVkeis2?=
 =?utf-8?B?MVk2b0htNFpSbWdRek5za2NCR3NUSTNkbXJjTmVwZ2xwOHdjSzkzakQzM2J1?=
 =?utf-8?B?cEZ4SDlJQU50dWM5N2NCcTdnejRrbUdLS1Q4ZlRNeXg3cHd4akptYnU5Nnd1?=
 =?utf-8?B?UzJieTZwNXJxSW81Wjh4MG1LME80ZXhEY1YzOVhTb0ZRM0tyN0ErdjdzejhJ?=
 =?utf-8?B?YXJqZzFRZGdHV0pqUXZBYjE4TmwrU2gxSnlLeU0yR3NxTHNSWm9vWGRuNkZw?=
 =?utf-8?B?WkVCaXRLbi9nMm5TT1dVZHMxTXBQTHNWY3kxd3dDL2pMWHRIQVFHak9YY2Zp?=
 =?utf-8?B?RlNOc0ZMYlByKzEySXA2anJzR2IwdEt0WjRyZGkwYnYzV0I1aDZuQURqazJn?=
 =?utf-8?B?Z0t0Y0lObDBjVkFESVdEeDdYVFV4UFplMFM4ckpqK1czK2Q0RjZnenI4T1Vk?=
 =?utf-8?B?VjYxMzlHTEV4VDc4Y1BYeHUwOG9YaEJIZmpsSzFkc2h5M09QRVQ0bkhMdVN4?=
 =?utf-8?B?bFRYcVdlTkZ4QUlQN3NYZ0tVWTRKWEczWGIybExGK29xK3JRSDExQUVmQzE5?=
 =?utf-8?B?YmE5TjhrQnNqZSt2bm5Xc2tobXI4c3Fxa3dTM1RmUFF4NWhjWS9NWkxUUVdW?=
 =?utf-8?B?dVNWU2ZzQW9IYm0rOTM5czExenRDcnFqSExUR09EOXdLVHExZ3ZKR2NTbEt3?=
 =?utf-8?B?VGR1eDYxTXlnV0RaUmdHcys0aHNuL2FhZ014NWpBSWl3TklmdkRUWkpjZmJS?=
 =?utf-8?B?ek8xdDc1aFlmMUJWQzF5Sng2SkxLeXQ3MFZFeGM1Z3JaMWtiNGkxZFhlc0k1?=
 =?utf-8?B?OEt3QXpRVUJhQ3pEZG1ISktkMFhNV3MzRUxsTGZQdVFwUVorQitkUzVpc1hQ?=
 =?utf-8?B?Z2FoVzR5VkhHb25lRmg4bFIxeENNQUlMWVYyQndjV082OFF0K1VNWjlCY2RO?=
 =?utf-8?B?Tk83WUM1eXhXUjVjbnpxNG9uRlJMQW01SFR2VHFKQmNPZFRDZytCNWVyVitR?=
 =?utf-8?B?eEd3cXdyUytXQVpPVE52UlFud1VJRWxoWEpGb1dtYnZmUUlvSUtCeWZKN29Y?=
 =?utf-8?B?WjJHMHBNbWVMb21mZU51UWFZMWdRZWc0dmppVU4yM09GbjRyVVhyMEtib0Fv?=
 =?utf-8?B?bGlaK01Rb2IyUVB5aEdRL3lCRHRTYWlYN2kySWZ3OXFRQzFHZ004RURtLzlo?=
 =?utf-8?B?MFhtajVjclcvUkNwblp4bFRiUDVWWXNxTWhOb0Y3RGpvTlJUMC9lb0dFTi9h?=
 =?utf-8?B?ZEZVOWJISmNkTnNxd2RiSng3eXdIeWN2VS84c0VYL3J0ekNxNVNQaWtnTlcw?=
 =?utf-8?B?Ty9DbzNDMndodTFGNFc1dEYxeGoxdGNXYXVSQ2Q5Qlc1NWdsYnV2a3pxbnRL?=
 =?utf-8?B?OXVrRkFaQStiK0pNc3J0b2JEelh0ZUs4bnc1dzFBektzTDNsSVRsZlorWUNT?=
 =?utf-8?B?UXczK1hzQm1tcS8xSGF5eDhwdjloK0dzYkpJZExMVk9PVDkyQ1VZdHA1Q2RP?=
 =?utf-8?B?enRJSWVDc0NFUkRCVE05b3hna3RWUFJ6MTBPaDFlUUk4MENtdk0ycFIxZUsr?=
 =?utf-8?B?dFlqakUrbXNLWWt0Rm0yeG9rbG9ZQm9URGF0cGZKeUNEOWRZU252YTByTkcr?=
 =?utf-8?B?b3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D5BF6EDC3F94B4180AACD1F72530385@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6105eb2c-d003-40cc-ef14-08db92dc2c01
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 22:10:53.1412
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lW7U3TY7Rvt1Rvu+WybpJ5r2BYuoiPcWwE4/GcSAOXbVLH2Hx8kYjxl3/BGoI39BIkS7b9fupzhjixfZQpP8wq6RnuAdqevFJqPaxP7HuxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5878
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
Cc: "pmenzel@molgen.mpg.de" <pmenzel@molgen.mpg.de>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "Fair, Benjamin" <benjaminfair@google.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "avifishman70@gmail.com" <avifishman70@gmail.com>, "venture@google.com" <venture@google.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gVHVlLCAyMDIzLTA4LTAxIGF0IDExOjQwICswMzAwLCBUb21lciBNYWltb24gd3JvdGU6Cj4g
SGkgSXdvbmEsCj4gCj4gSSBoYXZlIGRvbmUgci1iLCBKdXN0IGNvdWxkIHlvdSBkbyBhIHNtYWxs
IG1vZGlmaWNhdGlvbgo+IAo+IE9uIFRodSwgMjcgSnVsIDIwMjMgYXQgMjM6MjMsIEl3b25hIFdp
bmlhcnNrYSA8aXdvbmEud2luaWFyc2thQGludGVsLmNvbT4KPiB3cm90ZToKPiA+IAo+ID4gQWRk
IFBFQ0kgY29udHJvbGxlciBub2RlIHdpdGggYWxsIHJlcXVpcmVkIGluZm9ybWF0aW9uLgo+ID4g
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBJd29uYSBXaW5pYXJza2EgPGl3b25hLndpbmlhcnNrYUBpbnRl
bC5jb20+Cj4gPiAtLS0KPiA+IMKgYXJjaC9hcm0vYm9vdC9kdHMvbnV2b3Rvbi9udXZvdG9uLWNv
bW1vbi1ucGNtN3h4LmR0c2kgfCA5ICsrKysrKysrKwo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgOSBp
bnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9udXZv
dG9uL251dm90b24tY29tbW9uLW5wY203eHguZHRzaQo+ID4gYi9hcmNoL2FybS9ib290L2R0cy9u
dXZvdG9uL251dm90b24tY29tbW9uLW5wY203eHguZHRzaQo+ID4gaW5kZXggYzdiNWVmMTViNzE2
Li5jY2NjMzM0NDEwNTAgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9udXZvdG9u
L251dm90b24tY29tbW9uLW5wY203eHguZHRzaQo+ID4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMv
bnV2b3Rvbi9udXZvdG9uLWNvbW1vbi1ucGNtN3h4LmR0c2kKPiA+IEBAIC0yMjAsNiArMjIwLDE1
IEBAIGtjczM6IGtjczNAMCB7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Owo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Owo+ID4gCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGVjaTA6IHBlY2ktY29udHJvbGxlckBmMDEwMDAw
MCB7Cj4gUGxlYXNlIG1vZGlmeSB0aGUgcGVjaTAgdG8gcGVjaSB3ZSBoYXZlIG9ubHkgb25lIFBF
Q0kgY29udHJvbGxlci4KCkknbGwgZml4IHVwIGJvdGggRFRTIGZpbGVzIHdoaWxlIGFwcGx5aW5n
IHRvIHBlY2ktbmV4dC4KClRoYW5rcwotSXdvbmEKCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAibnV2
b3RvbixucGNtNzUwLXBlY2kiOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHhmMDEwMDAwMCAweDIwMD47Cj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGludGVycnVwdHMgPSA8R0lDX1NQSSA2Cj4gPiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsK
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgY2xvY2tzID0gPCZjbGsgTlBDTTdYWF9DTEtfQVBCMz47Cj4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNtZC10
aW1lb3V0LW1zID0gPDEwMDA+Owo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4gPiArCj4gPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNwaTA6IHNwaUAy
MDAwMDAgewo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJudXZvdG9uLG5wY203NTAtcHNwaSI7Cj4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZWcgPSA8MHgyMDAwMDAgMHgxMDAwPjsKPiA+IC0tCj4gPiAyLjQwLjEKPiA+IAo+
IAo+IFJldmlld2VkLWJ5OiBUb21lciBNYWltb24gPHRtYWltb243N0BnbWFpbC5jb20+Cj4gCj4g
VGhhbmtzLAo+IAo+IFRvbWVyCgo=
