Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ECA75A972
	for <lists+openbmc@lfdr.de>; Thu, 20 Jul 2023 10:39:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Wz7AmIBd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R65hZ531sz3bWr
	for <lists+openbmc@lfdr.de>; Thu, 20 Jul 2023 18:39:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Wz7AmIBd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R65gw1GCGz2xq8
	for <openbmc@lists.ozlabs.org>; Thu, 20 Jul 2023 18:38:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689842332; x=1721378332;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=pNqT6uuuGXq2imqkXm6J4xdsOH9EH46fOaEgCTNRdVM=;
  b=Wz7AmIBdBY93QRSYr/jBEhMQk55TXlMg+E3nk7hrlAtX0zihXf8M86Rp
   l0lfgWmyflg31/5cia22e6x7wavXNEAxQbd0TOqAaezLuGITnKWb0f/CP
   MDBR/sVs1UOWcTU1+IR7ZoFYJfIGeD0uQNrnvhvGp5qRGLQ7L+2ovAOhE
   qt5oFvCXqZZxBc2nUEvGfTkJXNytyQ1+4TxJj617kC6u6ftN+wcZl8XKV
   SOIqOjjJaUqeb5wfId5HrjwZALC/0+T7JsyTm7PirhrkXasjTHxxSDQov
   mnhlDZ1PgfXHLY2/GW46K/11ugCMLGRVTQozwZqCF24CY176k0GbfRZzL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="453048792"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="scan'208";a="453048792"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 01:38:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="753992797"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="scan'208";a="753992797"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga008.jf.intel.com with ESMTP; 20 Jul 2023 01:38:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 01:38:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 01:38:30 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 20 Jul 2023 01:38:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 20 Jul 2023 01:38:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LLjSf2xl5HatT+Qb4rDfXDvWLCTKNzm5CtZCLHuTdbvE2MV8Xh2m2bYPF/FcdO95gWzdTvUEhhXeX6Gg7lPCI1o5eErIiHZQYVF87mSo5oqWOomrw5njnU3nQsrUsUtu7mwdJu6XYjWCjRObxWs9ZRKskwQMG00J3FlcgIJTg2KLYIYwwaRIAcefJaW9oGQDVjHgP8li8AQPtZ4RewPbdLv1SAbLV2q3YtzrKVAhdp67Q+lohuZtElu8cD4n3PREelMuWwifMzd9/lBa37ETZQxDks5lwEViuC90dStRYczk8/egLll5bF4U0QGCK9jpRgGhDJfh8f0D7HS1dX5VqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNqT6uuuGXq2imqkXm6J4xdsOH9EH46fOaEgCTNRdVM=;
 b=TxzCm015DTCgDic0jqsmMRVYBfOc9pHn0UURYzBOu3VnIdt6nBd+ACrlphgVFPrB+vwK8yk9SLLpb4Cg2eGpD/0fJHg7QsQI1r1XwdnXRU2NyIAhwjLw5eG6dLqHCz3JTUDs4NoPB9uQzD3fzT82ujZ5CwW8B8mf5z06o4T6Tr8iwpe58acpD+V71xHHeu1epe9jQlMwdlGAEFtFu4SkzOVaEu2EevLhy3W4sZDBHRlnoevbATmlyOxTjd6nMQGMdDAgd2pE4iX0dQCZ4Fk1m6bjAGqkg10KfRzyauQqMSX9jdzvCbPzrhs6R6EXpVaDi4+eiuObr0oOA99bYTTzlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by CH3PR11MB7252.namprd11.prod.outlook.com (2603:10b6:610:144::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.23; Thu, 20 Jul
 2023 08:38:25 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::2f24:2dc9:60b:a244]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::2f24:2dc9:60b:a244%7]) with mapi id 15.20.6609.024; Thu, 20 Jul 2023
 08:38:25 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "pmenzel@molgen.mpg.de" <pmenzel@molgen.mpg.de>
Subject: Re: [PATCH 2/4] peci: Add peci-npcm controller driver
Thread-Topic: [PATCH 2/4] peci: Add peci-npcm controller driver
Thread-Index: AQHZuo3OPHLtIwLsKUWAISvdIc8ZeK/CL1aAgAAmpIA=
Date: Thu, 20 Jul 2023 08:38:25 +0000
Message-ID: <9a6eb22ef6b7a6a686250ed83894e8d37de30baa.camel@intel.com>
References: <20230719220853.1029316-1-iwona.winiarska@intel.com>
	 <20230719220853.1029316-3-iwona.winiarska@intel.com>
	 <dfda43af-e9b4-85bf-e165-02127e02fbf0@molgen.mpg.de>
In-Reply-To: <dfda43af-e9b4-85bf-e165-02127e02fbf0@molgen.mpg.de>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5823:EE_|CH3PR11MB7252:EE_
x-ms-office365-filtering-correlation-id: 3d3ee745-f635-4072-f01e-08db88fcaf16
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gIFmw03BDPKTJBN/uX2KegkFrPkssZgH30+nqL4tXVc3V5DnyHdV1S5j6Q1sB88M0VpsDwnUhffcMS9qRRDeP2kgRqktjoKnjCOcZCxv7tPjmRiFb+iG7hqkmh6iPO2sZTj4WEjnAdT+/fhsUmIo6JNCqBM6Zq+Iw7SrPHBuHnY6/M8Elkvko1DDXE4qX3xqGey3J2LwgPciAFXEKlmwhzNmZmnd/rfp/RZ4NB5HfybR96+lutKBqftq+79EwRDg/Zws9b/W3uU+tFzrT8DvNmZe4TpIAHk7Plh2/fMF7hVTXR8TGQPaiBcGcxttsSg07dItY8zahujjU+ht4U2lVYOhaY2yHUGq7a1smg6IPtt2ppUtfdjkzBnnorX2Nk7j+uIwyPylVsaRWjJ5NFZl5+84jJewjZDW2AlJplBZKe+hIJftKZFs8BgckeQTo4zzl3aerKpu2kyEdlIvm767a3F0SDGUXna6a0zZuVJA1oF3DMjs+ZgxuisjfBjAXc7DrXQvgRFQbSeESMW7xoohm42N6K+j6NpmmV5+nmuuKxO/lAiVXYLKFlXxFen9Q8IQPIP+PEFZGSK8PZFo+22e8X+zxq6X9ikgd1LDwKaeXcuwEwcxIHZz90a4qcHAInoN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5823.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(39860400002)(396003)(376002)(136003)(451199021)(83380400001)(54906003)(478600001)(26005)(6512007)(6506007)(71200400001)(36756003)(86362001)(6486002)(186003)(38070700005)(2906002)(2616005)(66476007)(4326008)(66556008)(66446008)(6916009)(64756008)(316002)(5660300002)(66946007)(122000001)(91956017)(76116006)(82960400001)(8676002)(8936002)(7416002)(41300700001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a2txOGVtOGdCallFdWpBNFRNNUt5VEdVTmVneXJBMW56M0FNYlRTUXEyRVVq?=
 =?utf-8?B?Z0lKVStUYnBzNnhlSTBUemluamwrYTdPR2xVZFFIa0V5ZnMva1F5SFdaMXEy?=
 =?utf-8?B?TTdSM1NYS1NvRDhsaW9qblNIQlFOUU9uMzRPajUwZzFKQ1hWbUMxUW1LdFh3?=
 =?utf-8?B?RXFJUnFQTUpObDREL0hQOHRpNi9yWG9jZnFkMUVVRi9lM0VlbmtmNzIzTk5J?=
 =?utf-8?B?UjdMNTlHOGRENlFJT3lhSkgxQ2tlVm92STFRSjI3NFJNZzh0SmU2dzJMUmRk?=
 =?utf-8?B?S2VaZDRLaVFlQnF0Zk1RamtTZU1JY3dFdzNVRzQ5a3Z4UHVxWkdaTHM1RVNh?=
 =?utf-8?B?UjlGakg5dU1lT2N0Wk50ZzZqbi9jTDd1MUppSEw4L0trMENDeFRSVHNLNnNp?=
 =?utf-8?B?cWtqZ0lYbytFd1dEVytsWTduNWxDYXpEa01BaFBhWWVzcUorRHhtWlV4b21y?=
 =?utf-8?B?UVNOeWoxdFVSSk56MVcrZlJsbWVKSWxpeldNZnpHNXFnTEdiYi9COUlsa2VQ?=
 =?utf-8?B?UFp2b2VSWWtsYTF5VjJJNFBnUjRSbkdzZmZPbGpjNTRLNmg1VXJacTkwcEVF?=
 =?utf-8?B?SHY4SWQ0bEgrWFY0WDZQck1hWmx1UFFTUHpuV2ZWRXoxQnZKWTBDUVVVOTBo?=
 =?utf-8?B?ZEdUZXltUlBkS2RCM3F5a0wvR2Z2allHa0VSRDdjSjgwVFJ3MjVudEo3N2dx?=
 =?utf-8?B?NzQrSVd5NURxRWJoSnU4eXA5MEw4Nlh6YzVLR0ZLZkExczlvK044c2R4Y2dV?=
 =?utf-8?B?czF0N0xPMk1oOG1USnNDbDVYMTdUTGRvTEtJZVlaY3FReFBGb1dkWlgzeVQw?=
 =?utf-8?B?R0Jndll4NFFuMGdmZjQvWWZGSmVmVk5hMFVBc0F3Rm9WMnRTYTBiUEhJV2JS?=
 =?utf-8?B?a3RPTC9uZWp2WEtLNWd6d1E5N25iOVZoTnVSdFZNVlJFaCtlYWJlRk9uVmRZ?=
 =?utf-8?B?eU5MRlFmVjU2K2M0QnI1eXg5K1MvcGtnZVBUL3hnSkp6VWtvVkJYWUhTaloy?=
 =?utf-8?B?L1FPUlBKclovOFF6WlJLdjdQMmhlZGFFaVpTNDVZZnRnYVptRkFOZDdNVDBF?=
 =?utf-8?B?QXp4OUI4WDJZbForWCtndUI4TjgzZG83Q3VjZGdvalE4TjFmYnV6ZS9OT3dv?=
 =?utf-8?B?R0hzb3VwdVNZWGt2cGF5UnhiRFVCV0NDWU95cUc3ZEJtbDQzYUZNeFR0WEpp?=
 =?utf-8?B?R1VuVVpNSGd3ajAyS2xWTzg5eFJyc1ZacktLMFNhZWhSZUVsQlZHZWhRYUdD?=
 =?utf-8?B?QVQ2cnFTYUxIT0h2Tmx1b3NOL0I2T0trcUdOc0ZlMVBPOHM1aU1aNGNramFo?=
 =?utf-8?B?VGJ1Q1JqUFVwR0FjTkhzc1EyNEVuMlQ3QTR5aWFkVGR3QWpiS0Y5ZlJyZGZJ?=
 =?utf-8?B?U0hHemxRd25Wd0Q4azdVM1hnQkhwUndIL1NucmZsWlFEai9CS2wyeUZ2Mlhw?=
 =?utf-8?B?MHRodHdINTJDT3Q0a3libGluWGZYd0piSjY1ZkNJZXBLejN3Q1l1YkpaaFc2?=
 =?utf-8?B?WHVmYm5xL2N0enl2MjY1cTJ0QXRRc1FxNDUzWGhobXUrcnJoWWtmUTdFTnJ4?=
 =?utf-8?B?bEJuYzkvUUtka09XZUdDcXJCN1BpdXFFTmFlTklwSU1RSDE3M0VHbjZFSEtV?=
 =?utf-8?B?SitSK2pyVStoMHdxdGdkZzN2NUord0pFQ1JWb04vWUZIRmw1by9PY2NmNU5h?=
 =?utf-8?B?bStXMUc5bHFWYU5QNTdPY3hycGk1TFk3QWUwZFVqYnNENmtPNXNzZE0vNFJy?=
 =?utf-8?B?cGxKNkp6MU8vb2ZFVTZxVXRIRXFiUEgrUWx3dEp5Qys0emJ5cnRzVU0rSEQ3?=
 =?utf-8?B?cko5MlJWaTVzR3RMNHFiN2Rjc3BDeXNDR1pSTUhubmJIcjY4TmlBbk9rRmxx?=
 =?utf-8?B?MXM2QkFuNU5vUkVtUnppZnNFNzh4OUpuR1lzSzF4OG5KT1IvMERtay9sMkhE?=
 =?utf-8?B?eThlTVBlSTVVdSs2Qm8wdWs0UzRoaUpkZytUS2lKSERFSUQxaGFEUTBsd3ZT?=
 =?utf-8?B?R3F1YytPR2tza0NKVXQvUDhCUWdwR1gzWUN5MzkzZHh5TDFXU2ZRcmxoT0NQ?=
 =?utf-8?B?Ty9acGQzTHF4SjRwUlFVUW11UlpFbzQ5YkErV1pNNDZ5eHJCdjhMbDF2c2dR?=
 =?utf-8?B?ZUVDQnJWejUrbnVuY2F5UVBXU1FQbFUwYXhXQitZMStTem9aei9rWVlKbmpI?=
 =?utf-8?B?ZGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <875B6E5294CAC44FA4628A70EB13D227@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d3ee745-f635-4072-f01e-08db88fcaf16
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 08:38:25.3228
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kOydOg6JFBekRKOL9PHDEP2Othg/9VVw2N8+seb8PjXN6Rvk/SgImsonC9yCobgJ1qkuA+gNbzxG2BIhOBsfdhRwH5WQC2F4aNd0qustP0s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7252
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "Fair, Benjamin" <benjaminfair@google.com>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "avifishman70@gmail.com" <avifishman70@gmail.com>, "venture@google.com" <venture@google.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "warp5tw@gmail.com" <warp5tw@gmail.com>, "tmaimon77@gmail.com" <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gVGh1LCAyMDIzLTA3LTIwIGF0IDA4OjIwICswMjAwLCBQYXVsIE1lbnplbCB3cm90ZToNCj4g
RGVhciBJd29uYSwNCj4gDQo+IA0KPiBBbSAyMC4wNy4yMyB1bSAwMDowOCBzY2hyaWViIEl3b25h
IFdpbmlhcnNrYToNCj4gPiBGcm9tOiBUb21lciBNYWltb24gPHRtYWltb243N0BnbWFpbC5jb20+
DQo+ID4gDQo+ID4gQWRkIHN1cHBvcnQgZm9yIE51dm90b24gTlBDTSBCTUMgaGFyZHdhcmUgdG8g
dGhlIFBsYXRmb3JtIEVudmlyb25tZW50DQo+ID4gQ29udHJvbCBJbnRlcmZhY2UgKFBFQ0kpIHN1
YnN5c3RlbS4NCj4gDQo+IFBsZWFzZSBlbGFib3JhdGUgb24gdGhlIGltcGxlbWVudGF0aW9uLCBh
bmQgZG9jdW1lbnQgdGhlIHVzZWQgZGF0YXNoZWV0cy4NCg0KQXMgZmFyIGFzIEkga25vdywgdGhl
cmUgaXMgbm8gcHVibGljbHkgYXZhaWxhYmxlIGRvY3VtZW50YXRpb24uDQoNCj4gDQo+IEFkZGl0
aW9uYWxseSwgcGxlYXNlIGRvY3VtZW50IGhvdyB5b3UgdGVzdGVkIHRoaXMuDQoNCkFyZSB5b3Ug
YXNraW5nIHRvIGluY2x1ZGUgdGhpcyBpbmZvcm1hdGlvbiBpbiB0aGUgY29tbWl0IG1lc3NhZ2U/
DQpUaGF0IHdvdWxkIGJlIHVudXN1YWwuDQpCdXQgaW4gZ2VuZXJhbCAtIGl0J3MgYSBjb250cm9s
bGVyIGRyaXZlciwgaXQgYWxsb3dzIFBFQ0kgc3Vic3lzdGVtIHRvIGRldGVjdA0KZGV2aWNlcyBi
ZWhpbmQgaXQgYW5kIGZvciBQRUNJIGRyaXZlcnMgdG8gYmluZCB0byB0aG9zZSBkZXZpY2VzLg0K
DQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFRvbWVyIE1haW1vbiA8dG1haW1vbjc3QGdtYWlsLmNv
bT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBUeXJvbmUgVGluZyA8d2FycDV0d0BnbWFpbC5jb20+DQo+
ID4gQ28tZGV2ZWxvcGVkLWJ5OiBJd29uYSBXaW5pYXJza2EgPGl3b25hLndpbmlhcnNrYUBpbnRl
bC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogSXdvbmEgV2luaWFyc2thIDxpd29uYS53aW5pYXJz
a2FAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+IMKgIGRyaXZlcnMvcGVjaS9jb250cm9sbGVyL0tj
b25maWfCoMKgwqDCoCB8wqAgMTYgKysNCj4gPiDCoCBkcml2ZXJzL3BlY2kvY29udHJvbGxlci9N
YWtlZmlsZcKgwqDCoCB8wqDCoCAxICsNCj4gPiDCoCBkcml2ZXJzL3BlY2kvY29udHJvbGxlci9w
ZWNpLW5wY20uYyB8IDI5OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gwqAgMyBm
aWxlcyBjaGFuZ2VkLCAzMTUgaW5zZXJ0aW9ucygrKQ0KPiA+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL3BlY2kvY29udHJvbGxlci9wZWNpLW5wY20uYw0KPiA+IA0KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3BlY2kvY29udHJvbGxlci9LY29uZmlnDQo+ID4gYi9kcml2ZXJzL3BlY2kv
Y29udHJvbGxlci9LY29uZmlnDQo+ID4gaW5kZXggMmZjNWUyYWJiNzRhLi40ZjljMjQ1YWQwNDIg
MTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9wZWNpL2NvbnRyb2xsZXIvS2NvbmZpZw0KPiA+ICsr
KyBiL2RyaXZlcnMvcGVjaS9jb250cm9sbGVyL0tjb25maWcNCj4gPiBAQCAtMTYsMyArMTYsMTkg
QEAgY29uZmlnIFBFQ0lfQVNQRUVEDQo+ID4gwqAgDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgIFRo
aXMgZHJpdmVyIGNhbiBhbHNvIGJlIGJ1aWx0IGFzIGEgbW9kdWxlLiBJZiBzbywgdGhlIG1vZHVs
ZSB3aWxsDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgIGJlIGNhbGxlZCBwZWNpLWFzcGVlZC4NCj4g
PiArDQo+ID4gK2NvbmZpZyBQRUNJX05QQ00NCj4gPiArwqDCoMKgwqDCoMKgwqB0cmlzdGF0ZSAi
TnV2b3RvbiBOUENNIFBFQ0kgc3VwcG9ydCINCj4gPiArwqDCoMKgwqDCoMKgwqBkZXBlbmRzIG9u
IEFSQ0hfTlBDTSB8fCBDT01QSUxFX1RFU1QNCj4gPiArwqDCoMKgwqDCoMKgwqBkZXBlbmRzIG9u
IE9GDQo+ID4gK8KgwqDCoMKgwqDCoMKgc2VsZWN0IFJFR01BUF9NTUlPDQo+ID4gK8KgwqDCoMKg
wqDCoMKgaGVscA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgIFRoaXMgb3B0aW9uIGVuYWJsZXMgUEVD
SSBjb250cm9sbGVyIGRyaXZlciBmb3IgTnV2b3RvbiBOUENNN1hYDQo+ID4gK8KgwqDCoMKgwqDC
oMKgwqAgYW5kIE5QQ004WFggU29Dcy4gSXQgYWxsb3dzIEJNQyB0byBkaXNjb3ZlciBkZXZpY2Vz
IGNvbm5lY3RlZA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgIHRvIGl0IGFuZCBjb21tdW5pY2F0ZSB3
aXRoIHRoZW0gdXNpbmcgUEVDSSBwcm90b2NvbC4NCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoMKg
wqAgU2F5IFkgaGVyZSBpZiB5b3Ugd2FudCBzdXBwb3J0IGZvciB0aGUgUGxhdGZvcm0gRW52aXJv
bm1lbnQNCj4gPiBDb250cm9sDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqAgSW50ZXJmYWNlIChQRUNJ
KSBidXMgYWRhcHRlciBkcml2ZXIgb24gdGhlIE51dm90b24gTlBDTSBTb0NzLg0KPiA+ICsNCj4g
PiArwqDCoMKgwqDCoMKgwqDCoCBUaGlzIHN1cHBvcnQgaXMgYWxzbyBhdmFpbGFibGUgYXMgYSBt
b2R1bGUuIElmIHNvLCB0aGUgbW9kdWxlDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqAgd2lsbCBiZSBj
YWxsZWQgcGVjaS1ucGNtLg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BlY2kvY29udHJvbGxl
ci9NYWtlZmlsZQ0KPiA+IGIvZHJpdmVycy9wZWNpL2NvbnRyb2xsZXIvTWFrZWZpbGUNCj4gPiBp
bmRleCAwMjJjMjhlZjFiZjAuLmUyNDc0NDliYjQyMyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJz
L3BlY2kvY29udHJvbGxlci9NYWtlZmlsZQ0KPiA+ICsrKyBiL2RyaXZlcnMvcGVjaS9jb250cm9s
bGVyL01ha2VmaWxlDQo+ID4gQEAgLTEsMyArMSw0IEBADQo+ID4gwqAgIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMC1vbmx5DQo+ID4gwqAgDQo+ID4gwqAgb2JqLSQoQ09ORklHX1BF
Q0lfQVNQRUVEKcKgwqDCoMKgwqArPSBwZWNpLWFzcGVlZC5vDQo+ID4gK29iai0kKENPTkZJR19Q
RUNJX05QQ00pwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqArPSBwZWNpLW5wY20ubw0K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BlY2kvY29udHJvbGxlci9wZWNpLW5wY20uYw0KPiA+
IGIvZHJpdmVycy9wZWNpL2NvbnRyb2xsZXIvcGVjaS1ucGNtLmMNCj4gPiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uMzY0N2UzNjI4YTE3DQo+ID4gLS0tIC9k
ZXYvbnVsbA0KPiA+ICsrKyBiL2RyaXZlcnMvcGVjaS9jb250cm9sbGVyL3BlY2ktbnBjbS5jDQo+
ID4gQEAgLTAsMCArMSwyOTggQEANCj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjANCj4gPiArLy8gQ29weXJpZ2h0IChjKSAyMDE5IE51dm90b24gVGVjaG5vbG9neSBjb3Jw
b3JhdGlvbi4NCj4gDQo+IE5vIGRvdC9wZXJpb2QgYXQgdGhlIGVuZC4NCj4gDQo+IFvigKZdDQo+
IA0KPiA+ICtzdGF0aWMgaW50IG5wY21fcGVjaV94ZmVyKHN0cnVjdCBwZWNpX2NvbnRyb2xsZXIg
KmNvbnRyb2xsZXIsIHU4IGFkZHIsDQo+ID4gc3RydWN0IHBlY2lfcmVxdWVzdCAqcmVxKQ0KPiA+
ICt7DQo+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IG5wY21fcGVjaSAqcHJpdiA9IGRldl9nZXRf
ZHJ2ZGF0YShjb250cm9sbGVyLT5kZXYucGFyZW50KTsNCj4gPiArwqDCoMKgwqDCoMKgwqB1bnNp
Z25lZCBsb25nIHRpbWVvdXQgPSBtc2Vjc190b19qaWZmaWVzKHByaXYtPmNtZF90aW1lb3V0X21z
KTsNCj4gPiArwqDCoMKgwqDCoMKgwqB1bnNpZ25lZCBpbnQgbXNnX3JkOw0KPiA+ICvCoMKgwqDC
oMKgwqDCoHUzMiBjbWRfc3RzOw0KPiA+ICvCoMKgwqDCoMKgwqDCoGludCBpLCByZXQ7DQo+ID4g
Kw0KPiA+ICvCoMKgwqDCoMKgwqDCoC8qIENoZWNrIGNvbW1hbmQgc3RzIGFuZCBidXMgaWRsZSBz
dGF0ZSAqLw0KPiA+ICvCoMKgwqDCoMKgwqDCoHJldCA9IHJlZ21hcF9yZWFkX3BvbGxfdGltZW91
dChwcml2LT5yZWdtYXAsIE5QQ01fUEVDSV9DVExfU1RTLA0KPiA+IGNtZF9zdHMsDQo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICEoY21kX3N0cyAmDQo+ID4gTlBDTV9QRUNJX0NUUkxfU1RBUlRfQlVT
WSksDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE5QQ01fUEVDSV9JRExFX0NIRUNLX0lOVEVSVkFM
X1VTRUMsDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE5QQ01fUEVDSV9JRExFX0NIRUNLX1RJTUVP
VVRfVVNFQyk7DQo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKHJldCkNCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsgLyogLUVUSU1FRE9VVCAqLw0KPiA+ICsNCj4g
PiArwqDCoMKgwqDCoMKgwqBzcGluX2xvY2tfaXJxKCZwcml2LT5sb2NrKTsNCj4gPiArwqDCoMKg
wqDCoMKgwqByZWluaXRfY29tcGxldGlvbigmcHJpdi0+eGZlcl9jb21wbGV0ZSk7DQo+ID4gKw0K
PiA+ICvCoMKgwqDCoMKgwqDCoHJlZ21hcF93cml0ZShwcml2LT5yZWdtYXAsIE5QQ01fUEVDSV9B
RERSLCBhZGRyKTsNCj4gPiArwqDCoMKgwqDCoMKgwqByZWdtYXBfd3JpdGUocHJpdi0+cmVnbWFw
LCBOUENNX1BFQ0lfUkRfTEVOR1RILA0KPiA+IE5QQ01fUEVDSV9XUl9MRU5fTUFTSyAmIHJlcS0+
cngubGVuKTsNCj4gPiArwqDCoMKgwqDCoMKgwqByZWdtYXBfd3JpdGUocHJpdi0+cmVnbWFwLCBO
UENNX1BFQ0lfV1JfTEVOR1RILA0KPiA+IE5QQ01fUEVDSV9XUl9MRU5fTUFTSyAmIHJlcS0+dHgu
bGVuKTsNCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKHJlcS0+dHgubGVuKSB7DQo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlZ21hcF93cml0ZShwcml2LT5yZWdtYXAs
IE5QQ01fUEVDSV9DTUQsIHJlcS0+dHguYnVmWzBdKTsNCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGZvciAoaSA9IDA7IGkgPCAocmVxLT50eC5sZW4gLSAxKTsgaSsr
KQ0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVn
bWFwX3dyaXRlKHByaXYtPnJlZ21hcCwgTlBDTV9QRUNJX0RBVF9JTk9VVChpKSwNCj4gPiByZXEt
PnR4LmJ1ZltpICsgMV0pOw0KPiA+ICvCoMKgwqDCoMKgwqDCoH0NCj4gPiArDQo+ID4gKyNpZiBJ
U19FTkFCTEVEKENPTkZJR19EWU5BTUlDX0RFQlVHKQ0KPiA+ICvCoMKgwqDCoMKgwqDCoGRldl9k
YmcocHJpdi0+ZGV2LCAiYWRkciA6ICUjMDJ4LCB0eC5sZW4gOiAlIzAyeCwgcngubGVuIDogJSMw
MnhcbiIsDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGFkZHIsIHJlcS0+dHgu
bGVuLCByZXEtPnJ4Lmxlbik7DQo+ID4gK8KgwqDCoMKgwqDCoMKgcHJpbnRfaGV4X2R1bXBfYnl0
ZXMoIlRYIDogIiwgRFVNUF9QUkVGSVhfTk9ORSwgcmVxLT50eC5idWYsIHJlcS0NCj4gPiA+dHgu
bGVuKTsNCj4gPiArI2VuZGlmDQo+IA0KPiBUaGUgcHJlcHJvY2Vzc29yIGd1YXJkcyBhcmUgbm90
IG5lZWRlZCwgYXMgaXTigJlzIHRha2VuIGNhcmUgb2YgaW4gDQo+IGBpbmNsdWRlL2xpbnV4L3By
aW50ay5oYC4gQWxzbyBpbiBvdGhlciBwYXJ0cyBvZiB0aGUgcGF0Y2guDQoNClNpbmNlIHRoaXMg
aXMgZHVtcGluZyB0aGUgcmF3IGNvbnRlbnRzIG9mIFBFQ0kgbWVzc2FnZXMsIGl0J3MgZ29pbmcg
dG8gYmUgcXVpdGUNCnZlcmJvc2UuIFRoZSBpZGVhIGJlaGluZCBwcmVwcm9jZXNzb3IgZ3VhcmQg
aXMgdGhhdCB3ZSBkb24ndCBldmVyIHdhbnQgdGhpcyB0bw0KYmUgY29udmVydGVkIHRvIHJlZ3Vs
YXIgcHJpbnRrLiBJZiB0aGVyZSdzIG5vIGR5bmFtaWMgZGVidWcgYXZhaWxhYmxlIC0gdGhpcw0K
d29uJ3QgYmUgcHJpbnRlZCB1bmNvbmRpdGlvbmFsbHkgKGV2ZW4gd2l0aCAtRERFQlVHKS4NCg0K
PiANCj4gW+KApl0NCj4gDQo+ID4gK21vZHVsZV9wbGF0Zm9ybV9kcml2ZXIobnBjbV9wZWNpX2Ry
aXZlcik7DQo+ID4gKw0KPiA+ICtNT0RVTEVfQVVUSE9SKCJUb21lciBNYWltb24gPHRvbWVyLm1h
aW1vbkBudXZvdG9uLmNvbT4iKTsNCj4gPiArTU9EVUxFX0RFU0NSSVBUSU9OKCJOUENNIFBFQ0kg
ZHJpdmVyIik7DQo+ID4gK01PRFVMRV9MSUNFTlNFKCJHUEwiKTsNCj4gPiArTU9EVUxFX0lNUE9S
VF9OUyhQRUNJKTsNCj4gDQo+IEFsc28gYWRkIGFuIGVudHJ5IHRvIGBNQUlOVEFJTkVSU2AsIGlm
IFRvbWVyIGlzIGdvaW5nIHRvIGJlIHRoZSBtYWludGFpbmVyPw0KDQpBbGwgb2YgdGhlIG5ld2x5
IGFkZGVkIGZpbGVzIHNob3VsZCBhbHJlYWR5IGJlIGNvdmVyZWQgYnkgZWl0aGVyIEFSTS9OVVZP
VE9ODQpOUENNIEFSQ0hJVEVDVFVSRSBvciBQRUNJIFNVQlNZU1RFTS4NCg0KVGhhbmtzDQotSXdv
bmENCg0KPiANCj4gDQo+IEtpbmQgcmVnYXJkcywNCj4gDQo+IFBhdWwNCg0K
