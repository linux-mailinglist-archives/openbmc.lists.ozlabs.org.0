Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E93BA7343E9
	for <lists+openbmc@lfdr.de>; Sat, 17 Jun 2023 23:21:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h1XDTXCG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qk89X5NVHz3Wtt
	for <lists+openbmc@lfdr.de>; Sun, 18 Jun 2023 07:21:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h1XDTXCG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qk88s6PyTz30P5
	for <openbmc@lists.ozlabs.org>; Sun, 18 Jun 2023 07:21:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687036878; x=1718572878;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=DI+70+ACn67ouYsaA0DI9oM9U5tTsDcj+VKn0BD3GsI=;
  b=h1XDTXCGe5jTpVO+rOyRnOIYvLzWEilJJea4AcJ8CpbN3L7Nrmn5HN4B
   USR5L7bFv1ySC6CLAnStJXtrbVXwFQsfaDt5TzTkHdPsv+W5YaGgLeetT
   4fKa+dFEC74v4Xy9Z2tnQLS14/AjXvoiRmlq13/NJ1xNADo0rtf/brFKZ
   8StNLKaD/SjGwAiNY7Mno+gVZTmjfDzk37poPPaYsi5W4DZaVwSg8zwTj
   HC9dNIk0O/hDRcqXErYs03nuQqtXebUZQ4VZ10Yr/Q0JCw/i9NAuGEWgy
   Rn/sz7tTKxaXX9uww4qR5Y7bi8FVbDkVLkCd4iRq/hj2dwR2YTWoVRwUV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="445806167"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="445806167"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 14:21:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="826136891"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="826136891"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga002.fm.intel.com with ESMTP; 17 Jun 2023 14:21:08 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sat, 17 Jun 2023 14:21:07 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sat, 17 Jun 2023 14:21:07 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sat, 17 Jun 2023 14:21:07 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sat, 17 Jun 2023 14:21:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kHVEDKIujFrKYVeCxnfGtKMbn1ZHdCHQWtUc+vx4DWFjFc1JKGCi0ifYR9cKyHLGnVTgOIseICIPMyUnXueWXL0CcillAb042lE1HHRQsWHI8TPIqQcMyjhEoGvvyNRiXuIH9ZCo/i0dH4/x86t8yNYurt7LD4LcQNEqTJUK14TGANOvdgZNgKzTLJCG1/JJTd4sdtx7lcGccyqZU6mjiSjNaN+JRuV90v+f7xofBUalN7ROiuITl7vTr7nFUA7NUjOTJ6oqYNJoE49RR+yFYZzmpzXrlSC2ew496EDZjXUyxUagLVvFMKPU1wT0OWKG2zdjwv3Hlgu7hw2d9EWWbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DI+70+ACn67ouYsaA0DI9oM9U5tTsDcj+VKn0BD3GsI=;
 b=hMw/a0Wol+4bgOipJ/XSu4pAdSqtvJm8+HeLUjke7Y8j3PfK6mBaKTZjOPDFWyA/4EtTZgM1BHjCryx10W+0sWJkygf7mzqPsp3658IfGwipr7wB9S7bPJ3uF0Z5k4cAE2q2duhR8frx/wR6Gz/iWpn/NS0NqTOuEICMQ6lqUn1DPfdg/ZtTZ680f1FhT/EecWO2asephkDjV4aMJoRxufbvaCfDJKvlsRyLvlxBn7lMaOCTBoZGPM2FhkfJMnCNsCb5MNcNMz4Qln8dWnheIjkhnY+m0/bl0K6414Nkie3ELKkFffX0/7OFYzJ3EKi9gVgHYHq8VLkc/ZS80aRXpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by SA1PR11MB8445.namprd11.prod.outlook.com (2603:10b6:806:3a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Sat, 17 Jun
 2023 21:21:05 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::4ebf:e573:321c:3a5]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::4ebf:e573:321c:3a5%4]) with mapi id 15.20.6500.031; Sat, 17 Jun 2023
 21:21:05 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "tmaimon77@gmail.com" <tmaimon77@gmail.com>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "warp5tw@gmail.com" <warp5tw@gmail.com>,
	"krzk@kernel.org" <krzk@kernel.org>
Subject: Re: [RFT PATCH 1/4] dt-bindings: Add bindings for peci-npcm
Thread-Topic: [RFT PATCH 1/4] dt-bindings: Add bindings for peci-npcm
Thread-Index: AQHZoIm7WQK7ry+UwU2sCqrFIV+fZK+OnyoAgADi/4A=
Date: Sat, 17 Jun 2023 21:21:05 +0000
Message-ID: <6db5ac93a4308640cf55b837727d437bce7a2430.camel@intel.com>
References: <20230616193450.413366-1-iwona.winiarska@intel.com>
	 <20230616193450.413366-2-iwona.winiarska@intel.com>
	 <2cf63766-dc02-0940-9d28-4c6f9a6b5661@kernel.org>
In-Reply-To: <2cf63766-dc02-0940-9d28-4c6f9a6b5661@kernel.org>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5823:EE_|SA1PR11MB8445:EE_
x-ms-office365-filtering-correlation-id: 60801e56-421d-4a6e-17be-08db6f78c276
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6bZnkzF+rNGNoayVkj3Tx4zH0U2Yw92hrZ25iMOgc/AZoGhzZCjWtsCQ1y0tcPmTIcKdk0IRWX4qsH5FAuMpyTutY7FmVo2S8yvvINMc7GNlpFMX8D8qk04V838B+hMllkKPLviVHQQ6dDfM5qZ748XmRBrV2zIFxCKMIfEHOhrN97VVJBlzS2YVSeb/lgZFNcv963rv1wv0AUNP8GpdMXbvMjq74LQ4jgX44H3MyGLrcm/eobjU7OgNKcvPZMbR63FLRdBeGQAt10+YLerxX8sLWgQyt3kOg+4cpRC7TO+Mng6JBM9l6B4AxZl2XxXafGL6ncasvwz5FSXeJ3naEMQNnAfohHyQOspFm/bP1rpL2QBiMZdZxWgQKLOGQliG/wG4cgDV7T3EhHNFK7qwj2y/7vnj00muYqHLHenvelOu8KD4awXihgKnObtjcZ93lLWrNkzgnMtRl6zvB3lz3VGTEGrQ5qCyTZ4K19wX+Y1saq3L8klIHV0PQZwjjvJPSpCPj7n8ont0gFOsFsxu85yyNHpcH86UAfz57RtA6EWK8bHLO/Vdat1D5bHx6W7YqJLinHhNCWhkKgzNdBcyUnnkCa2KqTNLJwyP2grEJyEW5ae5CAiVlX6GpZGKvl5k
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5823.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(376002)(346002)(396003)(136003)(451199021)(122000001)(2616005)(38070700005)(91956017)(86362001)(2906002)(82960400001)(76116006)(5660300002)(110136005)(64756008)(66446008)(66476007)(8936002)(186003)(8676002)(66946007)(66556008)(26005)(478600001)(38100700002)(36756003)(41300700001)(6512007)(6506007)(53546011)(71200400001)(6486002)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YTVySmRxdkQva1lEZ2ZuSmNhdG90aGdrSDljZW1wOWxaTmlSakw0MElFR3Zr?=
 =?utf-8?B?SllOV0dNVHNVUVdlZGZQczl1OXY5MEdscG9aYkRkcFBlZjRZYWsyU3R5Smsy?=
 =?utf-8?B?VW5IbGFVMWlwRlVNQ25tVFJkN1A5bVBxRzdyS2NSclRYanVpalFiNGlVV3JF?=
 =?utf-8?B?TXZEb2FOaXpqQTJBTUNZNmVhaERWb2M5NUY3MjBDc1cvSmpobFd4bDRxdjRu?=
 =?utf-8?B?cHVEQmw1RGczbmVETXZHT2dBZHU1K2FHZkNwNzhhVEkxRDZUT0hLVEs0STE3?=
 =?utf-8?B?Tzh4UDFNUWNOOXV4WVpDTEIvVFMvWldJcFhsTlkwTU1wdkFubDNLUGd5ZW5h?=
 =?utf-8?B?cFNad3dUY2FBSHR1MFBjMndhb242UmticHJmdENZc1RGQ242MU5kSXVzeTdM?=
 =?utf-8?B?RWVSRFE1YzYrK2hZa0FSeUoyNFRXbk15MDV5YmRkRHZoaUtVRm4yaktjOFEv?=
 =?utf-8?B?NWZuQjlWczR1a1k3VENENFhMS1JFaVFtajVhaGtoZ1pSOXExd2hzei9mYkND?=
 =?utf-8?B?cVk3RHhrbDRLQUtpOUZkTDZrSkc4OEdmdUxPbEVmZjFRL3BwQWFFRkxFc1VN?=
 =?utf-8?B?bHc0d2JOa0JwUGgyNHUySmRUSExLTmdPTzJGM29LbklSWWlUT3JHMHIxdHRl?=
 =?utf-8?B?QnltSzMvOHo4aEtnOVQ4aEx2eVVmbStPVVA4MHRvdjc4RDdKcXZmby9LbXVr?=
 =?utf-8?B?ejA5YWZLQlJSSG1CY1ZhWXhIVFpUV3JwNkFDOHBSRjBZV3hZTzA2MEJoQVZN?=
 =?utf-8?B?c1BzTlJPY2tvZEFrd05FSVFrczhId1BEVW9EeUhia1hiaGtLRFdhNnpFdzlG?=
 =?utf-8?B?TVNISUdtdXNUR0RuY1JkS0N4OGhHNUFQMDRpa0gvbDhuMGFqZk9Nd0VzZm55?=
 =?utf-8?B?cVdOTDRtNHpYdlE3MVJkaFRKeU13d01xWndmcmVVZmh0ajlJTnZEZVJ4eW9H?=
 =?utf-8?B?b09Hb1dHTDRvaVUzWkpTOE8xVkZYZEdZOVY4WGJxczJUb2JyQnZESkRnbmhO?=
 =?utf-8?B?NS9US2k3VjJCZkg1K1RlNWNFbXQxb1grTDRxS2szWlZicWhYa2lwZGFmSlF4?=
 =?utf-8?B?Z01ZYU13RUV4VUJjc2FQcWZZZFh2RTFYVHdNamlTbW51ZE41V2hubEZ2ZExz?=
 =?utf-8?B?UHd0U25GY29OajgzU3JaSVhUV3Q1RTErRXFsZGxOeGdDdFV4VkVCT1ZrYlBI?=
 =?utf-8?B?Y3ZpYVZJdVgvUTlVUldyY3E1V2ZDa0NHTTU4cGZ6THF6RFVoOXAxVUdxUzg3?=
 =?utf-8?B?Mm5hcUc5c0RJRXoxNk9nSS9VU3R5QXFTRncyS1loNzhIWldVRSthSmo5cC9v?=
 =?utf-8?B?NHdLa1JNWkY1UVVkQ2xVYmlWZGtsSmpOeHhGOVBMRXZzU2xBeVIyRjF6N3kv?=
 =?utf-8?B?Yi9wVzMrS1V4b1RNNHNjWUMwdXVjSW9TZnZYaGRLS3JEaTBqVXdNZ25lVmdU?=
 =?utf-8?B?SDFqankvbHdBMzVXK0dFZ0lIMDIzR2liQkRUZ2luYjdkWXA2ajkreWhYdjl0?=
 =?utf-8?B?dVVCcHVMK0JqN3hQZXZNY25VSTZ3YjJNLytRNTNUNW9uMFlmd2xkOXppbFpW?=
 =?utf-8?B?K2QzZ3lzbzdJSjJLY3E4SVR6aU1RWEQrV2lsL3lOd3M1V0ZjZTl1NHZmSzM1?=
 =?utf-8?B?d3JhemtiTkI1Yng2YkNzTklIcWdMa0VIMXJLbWVFNmNPMXRMOWJwK1U4Mmxx?=
 =?utf-8?B?NVViWXpPMktHUXd0ekdGNkF5RnJ6NkRWbi9ZL2hEYVJHR2xlcE5TZ1FSVzRh?=
 =?utf-8?B?anJVSTFnRWxIRlVmZVZsVGc2NVMvM0U4eWNyUTJVbXNwLy84b2syQWJJSzdJ?=
 =?utf-8?B?K1cvcHlXN2liSkZON1Fybk1pSnk1Y2RmdE1Ec0xUNlZHZTVvTDBvRTRmdnRF?=
 =?utf-8?B?cG4rZ09oVWFueWFYVzF6YXBJd2Y1cnl3RUFVeHpaclYrenlEQyt6MkhjOEo3?=
 =?utf-8?B?S2pya3FPMnhaQUE1QS9OZWZ2S3pvQ3lWVEJQOTQ0dFU4aDFBRUZVRENZSW9U?=
 =?utf-8?B?VVhWRS9XNzdUWG9yRXBwdmRqbzBHMGRScUtsSnR3NTIra0tRcDNOTm1RUmxC?=
 =?utf-8?B?YlpsTUJmT2Y3SldKbWNVc215enFsWEpvMzMxQW1iY0dZaWJIMTJSQ3kvbCs4?=
 =?utf-8?B?YmE3RVY4RmpTVlIrelNhUlY5ckVISFk1dVE3dTF1dXRvUWM2RWlDWjJlQ2Y4?=
 =?utf-8?B?ZXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1148A9A3B33C9D4EB0F3714467930111@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60801e56-421d-4a6e-17be-08db6f78c276
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2023 21:21:05.1881
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O+n1iEJiqa/FowLMWZCfT7idJRcBVveB9ghsQrM7fOXJwi5w2umDfg8bOGguKC5ElY9DFtoCnULN3mOxR7JlATw1ytu0dUkxuHeCxtczrPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8445
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

T24gU2F0LCAyMDIzLTA2LTE3IGF0IDA5OjQ4ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBPbiAxNi8wNi8yMDIzIDIxOjM0LCBJd29uYSBXaW5pYXJza2Egd3JvdGU6DQo+ID4g
RnJvbTogVG9tZXIgTWFpbW9uIDx0bWFpbW9uNzdAZ21haWwuY29tPg0KPiA+IA0KPiA+IEFkZCBk
ZXZpY2UgdHJlZSBiaW5kaW5ncyBmb3IgdGhlIHBlY2ktbnBjbSBjb250cm9sbGVyIGRyaXZlci4N
Cj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBUb21lciBNYWltb24gPHRtYWltb243N0BnbWFpbC5j
b20+DQo+ID4gU2lnbmVkLW9mZi1ieToga2Z0aW5nIDx3YXJwNXR3QGdtYWlsLmNvbT4NCj4gPiBD
by1kZXZlbG9wZWQtYnk6IEl3b25hIFdpbmlhcnNrYSA8aXdvbmEud2luaWFyc2thQGludGVsLmNv
bT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBJd29uYSBXaW5pYXJza2EgPGl3b25hLndpbmlhcnNrYUBp
bnRlbC5jb20+DQo+IA0KPiBQbGVhc2UgdXNlIHNjcmlwdHMvZ2V0X21haW50YWluZXJzLnBsIHRv
IGdldCBhIGxpc3Qgb2YgbmVjZXNzYXJ5IHBlb3BsZQ0KPiBhbmQgbGlzdHMgdG8gQ0MuwqAgSXQg
bWlnaHQgaGFwcGVuLCB0aGF0IGNvbW1hbmQgd2hlbiBydW4gb24gYW4gb2xkZXINCj4ga2VybmVs
LCBnaXZlcyB5b3Ugb3V0ZGF0ZWQgZW50cmllcy7CoCBUaGVyZWZvcmUgcGxlYXNlIGJlIHN1cmUg
eW91IGJhc2UNCj4geW91ciBwYXRjaGVzIG9uIHJlY2VudCBMaW51eCBrZXJuZWwuDQo+IA0KPiBZ
b3UgbWlzc2VkIGF0IGxlYXN0IERUIGxpc3QgKG1heWJlIG1vcmUpLCBzbyB0aGlzIHdvbid0IGJl
IHRlc3RlZCBieSBvdXINCj4gdG9vbHMuIFBlcmZvcm1pbmcgcmV2aWV3IG9uIHVudGVzdGVkIGNv
ZGUgbWlnaHQgYmUgYSB3YXN0ZSBvZiB0aW1lLCB0aHVzDQo+IEkgd2lsbCBza2lwIHRoaXMgcGF0
Y2ggZW50aXJlbHkgdGlsbCB5b3UgZm9sbG93IHRoZSBwcm9jZXNzIGFsbG93aW5nIHRoZQ0KPiBw
YXRjaCB0byBiZSB0ZXN0ZWQuDQoNClRoYXQgd2FzIHRoZSBpZGVhIGJlaGluZCBtYXJraW5nIGl0
IGFzICJSRlQiLCBhZGRpbmcgYSBub3RlIHRoYXQgIkkgd2Fzbid0IGFibGUNCnRvIHRlc3QgaXQg
b24gYSByZWFsIGhhcmR3YXJlIHNvIEkgd291bGQgbGlrZSB0byBhc2sgZm9yIGhlbHAgdG8gdGVz
dCBpdCBvbg0KTnV2b3RvbiBzeXN0ZW1zLiIgaW4gdGhlIGNvdmVyIGxldHRlciwgYW5kIHNlbmRp
bmcgaXQgZXhjbHVzaXZlbHkgdG8gT3BlbkJNQw0KbWFpbGluZ2xpc3QgLSB0byBhdm9pZCB3YXN0
aW5nIHRpbWUgb24gcmV2aWV3IGJlZm9yZSBzb21lb25lIGhhcyBhIGNoYW5jZSB0byBydW4NCml0
IG9uIE51dm90b24gaGFyZHdhcmUuDQoNCi1Jd29uYQ0KDQo+IA0KPiBQbGVhc2Uga2luZGx5IHJl
c2VuZCBhbmQgaW5jbHVkZSBhbGwgbmVjZXNzYXJ5IFRvL0NjIGVudHJpZXMuDQo+IA0KPiANCj4g
QmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCj4gDQoNCg==
