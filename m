Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3406C75C2FE
	for <lists+openbmc@lfdr.de>; Fri, 21 Jul 2023 11:24:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WBQvgbnm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6kdz0dpYz3bl6
	for <lists+openbmc@lfdr.de>; Fri, 21 Jul 2023 19:24:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WBQvgbnm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6kcN38Vnz3bvJ
	for <openbmc@lists.ozlabs.org>; Fri, 21 Jul 2023 19:22:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689931380; x=1721467380;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=yqiLsXPTpjUpyc0aOzSAQmSxKBJxhBppePwD2WK1azA=;
  b=WBQvgbnmVLCOQicXXgXEA7qcrJ5xvQj89UfrSxJEab2UYYTDxyTvKsZI
   X+R6KVlkGpNgqMu9Rlw0j9oMYb3H0Dt+nRHiG5nbFqYlY6ioHVyvBpJ1D
   wCFIf5G58+/kljSIULSgn39igbKTXjqDYWoOkXHiTObB1eS8iJsIwMpAN
   ziEA+roVLzANjUA8Lix0F4aen9vXxlelbvfwrgVCVK0aLiR++cSW+a1Ln
   f/Y8d9ZEd63pus/ROwEZFUtIsTR+AukKNZNzovsW9CzhSq1x9nz/Tj2/7
   W+ke60wJOYZ20JZHM7v2v3gDzrOg7qSQCOUpBBiLNXVgAmoteENYYmTXJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="370580243"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="370580243"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 02:22:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="848770584"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="848770584"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga004.jf.intel.com with ESMTP; 21 Jul 2023 02:22:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 02:22:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 02:22:53 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 02:22:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mf5Xb9c3sSlEysQLymaAKkeco9SM01Io78ABdNdw08B3mkH0kms5ur6dGcH9GRhETcNAe3bDPvyWdLVul0FDN7or4NDj4OTqct/cK3bhnid1lNXvX8sCxPqCOney5Hm9NGjZk6CRL+ndPtp2iK0adafbuqpYvNfrX+CAx5koYbwNBMx1qzKAncwddZGMteKlBesCaJiTLej+hux6bOl0OT07jc/xcaPExXrp2HxgBp1QW0+3My/T6of/LaMSRXtR6PCuIw8fY/ng3QZGNElpP8SB8dzFVdU/s0wuVCe0MX5OqP1IVKpTSxYPwiGQIICQ651yxBv8I/F93kGh2DAw6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yqiLsXPTpjUpyc0aOzSAQmSxKBJxhBppePwD2WK1azA=;
 b=fVACy/cvd8AzWWxDa/VA9fhtP48ddL45RpvzigYJSPKdVi4i/afirnGL30GzKUasY1OFl1ROorGg/hUkI+/CZBdTWTUMJRZiGdcl4j0a6zxnIwRPZByuC6t0mqXn7/n3boFWBPrinqpKqQo0Tt8ehJlemQyzjCprUJvH4fYGrPVgWtYlza6Hd4WH2Q7JpK7yeHLRxIHFY7L6USradpXfa4zCh+FmsQppEZ81zvnCXb79KbHfg0A3P9X23ZLW7JxF22Rn8CKg6UowOmulLI0vnJp1YdF1LOZkjaYOnkq5Ox3iyrEv8zRqF5+0FgxPREg9vmq8+7FeotyuGJxcRXha1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by CH3PR11MB7345.namprd11.prod.outlook.com (2603:10b6:610:14a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 09:22:45 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::2f24:2dc9:60b:a244]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::2f24:2dc9:60b:a244%7]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 09:22:45 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "pmenzel@molgen.mpg.de" <pmenzel@molgen.mpg.de>
Subject: Re: [PATCH 2/4] peci: Add peci-npcm controller driver
Thread-Topic: [PATCH 2/4] peci: Add peci-npcm controller driver
Thread-Index: AQHZuo3OPHLtIwLsKUWAISvdIc8ZeK/CL1aAgAAmpICAAGc4gIAAXNiAgACqo4CAADAFgA==
Date: Fri, 21 Jul 2023 09:22:45 +0000
Message-ID: <88901141184a2fc5309dca1609e62e3e8c128fb0.camel@intel.com>
References: <20230719220853.1029316-1-iwona.winiarska@intel.com>
	 <20230719220853.1029316-3-iwona.winiarska@intel.com>
	 <dfda43af-e9b4-85bf-e165-02127e02fbf0@molgen.mpg.de>
	 <9a6eb22ef6b7a6a686250ed83894e8d37de30baa.camel@intel.com>
	 <2f9858b0-88e2-736a-f16a-f4fbe549e389@molgen.mpg.de>
	 <d6de8b0e5b54ca12d9f9930f01a85467b145b134.camel@intel.com>
	 <54fc5f74-d293-e467-709f-5077c03be80c@molgen.mpg.de>
In-Reply-To: <54fc5f74-d293-e467-709f-5077c03be80c@molgen.mpg.de>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5823:EE_|CH3PR11MB7345:EE_
x-ms-office365-filtering-correlation-id: 83216eb0-393c-4b57-cdda-08db89cc0af5
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qCqSqyZ6bmC1ZIkll1wjZGsS6n8PGrQdOnHM2vNRPYJOFV0XRyG4qGuXJb2KAu+X3LmY3zKx2zJSmuVBPwKxNGpWA9Bmt6pFahN4c7S3o4oMI9JxBdaB7JEL38UPL5d8huD4gClO3pXfNLcxeBs0gVAxPhfKDOx0uAjrjcpETosxLbHOaMieo6M4noidYD6nxObhUyde7doi8PdTIL0FzFSXwqeXM/LrFLRcSA+YLmpUD6lhBKsIQjPLGNmx5KfzTg9iHiR5idpbVMvuqSAmvlcjMUioCaP2sVFcZB94RRtX/ga79xkLso/PRH10aQomLWSjHzoO69r2EDZDNnCJxjjSiUgPHQPiuadYWBKkzRlAKNwW1jvWrArNcn+cdc0Jh6h4lo7mzUhuih2i5mFWYZH9/vBG/BpoyvetRY5PsmNeeMfJ0/tHClntcmGTBkOgOTNeNcTivysj32huJP2c9kIpC2C24XH+lWQedSK4H8RrgNwr8AIOOtJLeMes91Snj+oZk+/aaNwBzfLL848TI+W6nS3+4mJTt59itAJnCmY4vfRzntS7ug7ZdSBkaNZSoB8RhJ3aeV5AhFR0I9ix8CfGoucOEhjKXhasPYHwr2kM5K7wu3PvKekE3e6qedIWU1JJzRcuxsSVnEiUVP9Sdw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5823.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(39860400002)(376002)(136003)(346002)(451199021)(5660300002)(8936002)(2616005)(41300700001)(26005)(83380400001)(66899021)(8676002)(7416002)(6506007)(186003)(122000001)(91956017)(6916009)(71200400001)(4326008)(66446008)(64756008)(316002)(76116006)(66476007)(66556008)(66946007)(86362001)(6486002)(6512007)(966005)(38100700002)(36756003)(82960400001)(38070700005)(54906003)(478600001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bXF3NVlTdE5QSDYxK0tjVTgrZUN6RmNEN21GN3Z4Y2FvVFM2ZXBQUENGZUVu?=
 =?utf-8?B?UXBiSnRCV2RvQXZXdjlrK1hLN3VoWGxsa2c3NzM5eStBcU9GeHQxaFhqRDYz?=
 =?utf-8?B?UmR0N2NJVHBHM0V4bncxbFpJMkNQMFVOanJZZ1hrdVllT3BXVVZhb2IxaG5r?=
 =?utf-8?B?YlFaVWEvUFltMkNaME9qUzlRcFQveWdxRk9OcEV0Qk5SNnM2L2NzcTUzMi80?=
 =?utf-8?B?REp5MXRxSzVzaVZWTjJtWFVPTWV1ajB4QWt2c05DMGtrNkZoN21nV2dHbWxL?=
 =?utf-8?B?b0xrTzA5NHQ1Zzg5QUlTK3ZuL3pwTjZlajlWMmhhR3FKV2tBUDVhZHgwcG9o?=
 =?utf-8?B?RENNbkVZdkRDMmpEc0FiSnAvZUpkSW5yVklFNTNOaURPcjJGYzJFaEtHR04w?=
 =?utf-8?B?a1ltUVY3R0ZJTkJxaTllckNCSk5Pblp0WUJCSVdVdVNteTM1aFpsVGcvQ08r?=
 =?utf-8?B?REZTTjB4eTBHZUFRTHlYalNIWXFqWHUvM3U5cm9pKzZDdkJvSFhpR1o4dDdF?=
 =?utf-8?B?K2l6K1RDbTVqZldmaFlUZ3dTTmw3UjRRd2IwR0kwaGdGcnhqUlV4NTFjeGtU?=
 =?utf-8?B?Vk5mOCtTQjVzMkpUcXYwMXI1dktDSHNOcmtGYnpOVmpVemtBaFMxU1BTNEtt?=
 =?utf-8?B?YWxGZzhTd1lVYXZoRTFMN05CSk5zbWIxYVlmWDBxZU0vYi9tcEJaUytFVU9h?=
 =?utf-8?B?UnJqcWp3dVZ3VlpXbEZ4bnIzZUVLWkgwZkxqbmxjdFptaHBkekU2cGNPK1lJ?=
 =?utf-8?B?aUp0dkFCQUt5Z1BOQ1h1aGlRR2xTWGYwM1dJOWMyTjVtdTdJVGtLTXdqZ3N4?=
 =?utf-8?B?L0laM0VxL0VCZHpEOFBNK1dHT2lwUDhnZHl5UzRvNmxVLy9hSGU4bDdid0FG?=
 =?utf-8?B?czF6MUJWb3ZvaXUvTmpmRXEzdmcyYnpGOUhmRk5sYTM2Rzh6bFRIRTlrZGd4?=
 =?utf-8?B?Z2piVDZMd09aZ0NKNDZ4KzBhL3huWmdBT3dwVWxIRXRZS1U2eGtVQzQwOUs1?=
 =?utf-8?B?d0tzN1RQNzNrdnd3VlFKM3BsOE1rc2JKNVIvUGlsYXhFSldIeFhqWnlocWxC?=
 =?utf-8?B?Sno2OWJ1cmtWdm9BKzFOdHBRSGxJTlhPdEJ6c0V1VElwN3FzMkkvaGZpUGFR?=
 =?utf-8?B?U1ZRUmd5YnA1R0M3M0xxQjZpbW0wcGovcEhyRzM4REVGWC9YanBOb2laZzI3?=
 =?utf-8?B?cWFzaVB2Y0o5RzVOSmhEaFhSdzBkSTdrYmQ3cklVL29FN3pjTmFYZGhOK045?=
 =?utf-8?B?bUlRTVJML1RWWUkyZVRNcDMxY2dPaEpBZmtPSC91cXpGcG9xcWZiU0tBVTZt?=
 =?utf-8?B?RHNna1ZHZFM4LzRSSjk3SVZvZlFSRVpGYVhVR2cwZzk4dXQ5S2RhVWFMdTZC?=
 =?utf-8?B?dnRkUVRZT2djZXVxN3c4bVJtdzcwUVM4RjZhR1FBT0tGK05QWUxWT2kzQXQz?=
 =?utf-8?B?aTNaUTl2WWMzRWo3d1dFblRFdjFWdWhDYWlrU2t0UC9nblBrVy85clRDeFVL?=
 =?utf-8?B?dEIrWUF6UUl3V1lkYkxmUThwa01pL0gvNjhoZC9uZGhWMmphOGhOM0xMZ0RE?=
 =?utf-8?B?OE05dVEyeGw4L0IvZU5HbTdMN2xQV3cwTjEwajlveWdodjhZUGhoaUFqbFVz?=
 =?utf-8?B?NnoxLzlERzVwQjI2MFM0Y3o1RjNKOEFaTnlzaitoclVJZzRPMGlrdk8wWDZs?=
 =?utf-8?B?MFNwSDZUN3VmQ3RhRVVJRDMzcVBZMnZXTU1saEgzUFFLdTJ0SjZtU2FVdDRy?=
 =?utf-8?B?eThXbk9SdGhHYUZCYVdTY3ZhbFBwaFlWdmYyT0F0L1Q2U0dEdjhEMjdqOEtq?=
 =?utf-8?B?OUVSMFI3TXlFL2RQYnhjcFJIeURaVWx0UHFSU1dreXEyemVXdEs1bTlDU2lC?=
 =?utf-8?B?eDN1RjlUSnFhNlV3Z0hnVE8vNnhkeUFCRjhITjdTd2dGYVNGTW9HWEV4aWtU?=
 =?utf-8?B?WGxBampqMG92RUloVkFlUUc2TXJnKzRXOWdodlJKTjhNeXdOeXJFOVlCSWpr?=
 =?utf-8?B?OVYyczJYREZWSTQrWm10NUQ2SEFlRlRTMGQycFhYRVk3Z3hBSWY5NmhJMnNs?=
 =?utf-8?B?eXBGcVpiUzl2T3RudWNpZWhDNGhYcTJZUnl3MDcrVE9HWDh2aDZxMjFlUVA4?=
 =?utf-8?B?VlZOVno3SEN1eW5DT2NZbGZ2Nk05Nm1TQ2JmbGFKN2xnR0NJM1FHNThVRUIy?=
 =?utf-8?B?a2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <94068EE28083274E99ABA2E19BC55619@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83216eb0-393c-4b57-cdda-08db89cc0af5
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2023 09:22:45.2814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vzNmOSZCM5tZBeyVucB9oaJCDP9DRAp5x6qLjBjS+z76E1jFPljlHLMMJ1Nr1J/JGKvJ9RCZCaz5yTW9HzhO/9136ganGyUmwDAKgb1v/4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7345
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

T24gRnJpLCAyMDIzLTA3LTIxIGF0IDA4OjMwICswMjAwLCBQYXVsIE1lbnplbCB3cm90ZToNCj4g
RGVhciBJd29uYSwNCj4gDQo+IA0KPiBBbSAyMC4wNy4yMyB1bSAyMjoyMCBzY2hyaWViIFdpbmlh
cnNrYSwgSXdvbmE6DQo+ID4gT24gVGh1LCAyMDIzLTA3LTIwIGF0IDE2OjQ3ICswMjAwLCBQYXVs
IE1lbnplbCB3cm90ZToNCj4gDQo+ID4gPiBBbSAyMC4wNy4yMyB1bSAxMDozOCBzY2hyaWViIFdp
bmlhcnNrYSwgSXdvbmE6DQo+ID4gPiA+IE9uIFRodSwgMjAyMy0wNy0yMCBhdCAwODoyMCArMDIw
MCwgUGF1bCBNZW56ZWwgd3JvdGU6DQo+ID4gPiANCj4gPiA+ID4gPiBBbSAyMC4wNy4yMyB1bSAw
MDowOCBzY2hyaWViIEl3b25hIFdpbmlhcnNrYToNCj4gPiA+ID4gPiA+IEZyb206IFRvbWVyIE1h
aW1vbiA8dG1haW1vbjc3QGdtYWlsLmNvbT4NCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gQWRk
IHN1cHBvcnQgZm9yIE51dm90b24gTlBDTSBCTUMgaGFyZHdhcmUgdG8gdGhlIFBsYXRmb3JtDQo+
ID4gPiA+ID4gPiBFbnZpcm9ubWVudA0KPiA+ID4gPiA+ID4gQ29udHJvbCBJbnRlcmZhY2UgKFBF
Q0kpIHN1YnN5c3RlbS4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBQbGVhc2UgZWxhYm9yYXRlIG9u
IHRoZSBpbXBsZW1lbnRhdGlvbiwgYW5kIGRvY3VtZW50IHRoZSB1c2VkDQo+ID4gPiA+ID4gZGF0
YXNoZWV0cy4NCj4gPiA+ID4gDQo+ID4gPiA+IEFzIGZhciBhcyBJIGtub3csIHRoZXJlIGlzIG5v
IHB1YmxpY2x5IGF2YWlsYWJsZSBkb2N1bWVudGF0aW9uLg0KPiA+ID4gDQo+ID4gPiBUb28gYmFk
LiBEb2N1bWVudGluZyB0aGUgZGF0YXNoZWV0IG5hbWUgYW5kIHZlcnNpb24gaXMgc3RpbGwgaW1w
b3J0YW50LA0KPiA+ID4gc28gZGV2ZWxvcGVycyBjb3VsZCByZXF1ZXN0IGl0LCBhbmQgaXQgY2Fu
IGJlIG1hcHBlZCwgb25jZSB0aGV5IGFyZSBtYWRlDQo+ID4gPiBwdWJsaWMuDQo+ID4gDQo+ID4g
U29ycnksIHVuZm9ydHVuYXRlbHkgSSBjYW4ndCBoZWxwIHdpdGggdGhhdCwgSSBkb24ndCBoYXZl
IGFjY2VzcyB0byBhbnkNCj4gPiBOdXZvdG9uDQo+ID4gZG9jcy4gUGVyaGFwcyBUb21lciBjYW4g
cHJvdmlkZSBtb3JlIGluZm9ybWF0aW9uPw0KPiANCj4gSG9wZWZ1bGx5LiBCdXQgSSB3b25kZXIs
IGhvdyBjYW4geW91IGRldmVsb3AgYW5kIHJldmlldyB0aGUgcGF0Y2ggdGhlbj8NCg0KSXQgaXMg
ZXhwbGFpbmVkIGluIHRoZSBjb3ZlciBsZXR0ZXIuDQpBbHNvLCB0aGUgcmV2aWV3IGlzIG5vdCBv
bmx5IGFib3V0IHZlcmlmeWluZyBkcml2ZXIvaGFyZHdhcmUgaW50ZXJhY3Rpb25zLg0KSW4gZmFj
dCAtIHdlIG9mdGVuIGhhdmUgdG8gdHJ1c3QgdGhlIGF1dGhvciwgYmVjYXVzZSB0aGUgZG9jcyBh
cmUgbm90IGF2YWlsYWJsZS4NCkludGVyYWN0aW9ucyBiZXR3ZWVuIHNvZnR3YXJlIChvdGhlciBr
ZXJuZWwgY29tcG9uZW50cyksIHdoZXRoZXIgdGhlIGRyaXZlciBpcyBhDQpnb29kIGZpdCB3aXRo
aW4gaXRzIHN1YnN5c3RlbSwgZXRjLiBhcmUganVzdCBhcyBpbXBvcnRhbnQsIGFuZCBpdCdzIHNv
bWV0aGluZw0KdGhhdCB3ZSBjYW4gcmV2aWV3IHdpdGhvdXQgdGhlIGRvY3MuDQoNCj4gDQo+ID4g
PiA+ID4gQWRkaXRpb25hbGx5LCBwbGVhc2UgZG9jdW1lbnQgaG93IHlvdSB0ZXN0ZWQgdGhpcy4N
Cj4gPiA+ID4gDQo+ID4gPiA+IEFyZSB5b3UgYXNraW5nIHRvIGluY2x1ZGUgdGhpcyBpbmZvcm1h
dGlvbiBpbiB0aGUgY29tbWl0IG1lc3NhZ2U/DQo+ID4gPiANCj4gPiA+IFllcy4NCj4gPiA+IA0K
PiA+ID4gPiBUaGF0IHdvdWxkIGJlIHVudXN1YWwuDQo+ID4gPiA+IEJ1dCBpbiBnZW5lcmFsIC0g
aXQncyBhIGNvbnRyb2xsZXIgZHJpdmVyLCBpdCBhbGxvd3MgUEVDSSBzdWJzeXN0ZW0gdG8NCj4g
PiA+ID4gZGV0ZWN0DQo+ID4gPiA+IGRldmljZXMgYmVoaW5kIGl0IGFuZCBmb3IgUEVDSSBkcml2
ZXJzIHRvIGJpbmQgdG8gdGhvc2UgZGV2aWNlcy4NCj4gPiA+IA0KPiA+ID4gSGF2aW5nIGEgdGVz
dCBsaW5lIGluIHRoZSBjb21taXQgbWVzc2FnZSBpcyBub3QgdW51c3VhbCBhdC4gU28gcGVvcGxl
DQo+ID4gPiB3aXRoIHN5c3RlbXMgd2hlcmUgaXQgZG9lc27igJl0IHdvcmssIGNvdWxkIHJlcGxp
Y2F0ZSB0aGUgdGVzdCBzZXR1cCB0byBhdA0KPiA+ID4gbGVhc3QgdmVyaWZ5IHRoYXQgaXQgd29y
a3MgaW4gdGhhdCBjb25maWd1cmF0aW9uLg0KPiA+IA0KPiA+IEl0J3MgdW51c3VhbCBhcyBhbG1v
c3Qgbm9uZSBvZiB0aGUgY29tbWl0cyBpbiBMaW51eCBrZXJuZWwgY29udGFpbiAiaG93IHRvDQo+
ID4gdGVzdA0KPiA+IGl0IiBkZXNjcmlwdGlvbi4NCj4gDQo+IEkgc2F3IHNvbWUgY29tbWl0cyBk
b2N1bWVudCBvbiB3aGF0IGhhcmR3YXJlIGl0IHdhcyB0ZXN0ZWQuDQo+IA0KPiA+IFRoZSBleHBs
YW5hdGlvbiBib2R5IGluIHRoZSBjb21taXQgbWVzc2FnZSBzaG91bGQgZXhwbGFpbiAqd2h5KiB0
aGUgcGF0Y2gNCj4gPiB3YXMNCj4gPiBjcmVhdGVkLCBub3QgaG93IHRvIHRlc3QgaXQuDQo+IA0K
PiBJIGRpc2FncmVlLiBJdCBzaG91bGQgb2YgY291cnNlIHRoZSB3aHksIGJ1dCBzb21ldGltZXMg
YWxzbyB0aGUgaG93IA0KPiAoaW1wbGVtZW50YXRpb24pLCB0aGUgdXNlZCBkYXRhc2hlZXRzLCBh
bmQgYWxsIG90aGVyIGRldGFpbHMgbWFraW5nIGl0IA0KPiBlYXN5IHRvIHJldmlldyBhbmQgZ2l2
ZSByZXZpZXdlcnMgd2l0aG91dCB0aGUgaGFyZHdhcmUgY29uZmlkZW5jZSwgdGhhdCANCj4gdGhl
IHBhdGNoIGlzIGdvb2QuDQoNCkJ1dCBpdCB3aWxsIGJlIHBlcnNpc3RlZCBmb3IgZXRlcm5pdHkg
aW4gdGhlIGdpdCBsb2cuDQpBbmQgaXQgaXMgb25seSBhYm91dCB0aGUgcmV2aWV3IG9mIHRoZSBz
ZXJpZXMgYXMgYSB3aG9sZSwgd2hpY2ggbWVhbnMgdGhhdA0KdWx0aW1hdGVseSwgaGF2aW5nIHRo
aXMgaW5mb3JtYXRpb24gaW4gaW5kaXZpZHVhbCBjb21taXRzIGlzIGp1c3QgYWRkaW5nIG5vaXNl
Lg0KDQo+IA0KPiA+IEFuZCB3aGVuIHRha2VuIGFzIGEgc2VyaWVzIC0gaXQncyBzZWxmIGRvY3Vt
ZW50aW5nLiBUaGVyZSdzIGEgS2NvbmZpZyB3aGljaA0KPiA+IGFsbG93cyB0byBlbmFibGUvZGlz
YWJsZSB0aGUgZHJpdmVyLCBhbmQgdGhlcmUgYXJlIGJpbmRpbmdzIHdoaWNoIHNob3cgd2hhdA0K
PiA+IHBsYXRmb3JtIGNvbnRhaW5zIHRoZSBoYXJkd2FyZSB0aGF0IGlzIGNvbXBhdGlibGUgd2l0
aCBpdC4NCj4gDQo+IEkganVzdCBtZWFudDogVGVzdGVkIG9uIHNlcnZlciBYIHdpdGggQk1DIFkg
dXNpbmcgTnV2b3RvbiBaLiBEcml2ZXIgDQo+IHJlZ2lzdGVyZWQgY29ycmVjdGx5LCBhbmQgZGV2
aWNlcyBBIHdlcmUgZGlzY292ZXJlZC4NCg0KVGhlIHNlcmllcyAoYWZ0ZXIgbXkgbW9kaWZpY2F0
aW9ucykgd2FzIHRlc3RlZCBieSBUb21lciBmcm9tIE51dm90b246DQpodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9vcGVuYm1jL0NBUDZacTFoMWlmNGh5dWJ5aDZOOEVPZEdPdSt6cDBxVlVpbUYtOUwy
ZVhaLVFGQVlqd0BtYWlsLmdtYWlsLmNvbS8NCkkgY2FuIGxpbmsgdGhpcyBpbiB0aGUgY292ZXIg
bGV0dGVyLg0KDQo+IA0KPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogVG9tZXIgTWFpbW9uIDx0
bWFpbW9uNzdAZ21haWwuY29tPg0KPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogVHlyb25lIFRp
bmcgPHdhcnA1dHdAZ21haWwuY29tPg0KPiA+ID4gPiA+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBJd29u
YSBXaW5pYXJza2EgPGl3b25hLndpbmlhcnNrYUBpbnRlbC5jb20+DQo+ID4gPiA+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBJd29uYSBXaW5pYXJza2EgPGl3b25hLndpbmlhcnNrYUBpbnRlbC5jb20+DQo+
ID4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiA+IMKgwqDCoCBkcml2ZXJzL3BlY2kvY29udHJvbGxl
ci9LY29uZmlnwqDCoMKgwqAgfMKgIDE2ICsrDQo+ID4gPiA+ID4gPiDCoMKgwqAgZHJpdmVycy9w
ZWNpL2NvbnRyb2xsZXIvTWFrZWZpbGXCoMKgwqAgfMKgwqAgMSArDQo+ID4gPiA+ID4gPiDCoMKg
wqAgZHJpdmVycy9wZWNpL2NvbnRyb2xsZXIvcGVjaS1ucGNtLmMgfCAyOTgNCj4gPiA+ID4gPiA+
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiA+ID4gPiA+IMKgwqDCoCAzIGZpbGVz
IGNoYW5nZWQsIDMxNSBpbnNlcnRpb25zKCspDQo+ID4gPiA+ID4gPiDCoMKgwqAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvcGVjaS9jb250cm9sbGVyL3BlY2ktbnBjbS5jDQo+ID4gPiA+ID4g
PiANCj4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BlY2kvY29udHJvbGxlci9LY29u
ZmlnDQo+ID4gPiA+ID4gPiBiL2RyaXZlcnMvcGVjaS9jb250cm9sbGVyL0tjb25maWcNCj4gPiA+
ID4gPiA+IGluZGV4IDJmYzVlMmFiYjc0YS4uNGY5YzI0NWFkMDQyIDEwMDY0NA0KPiA+ID4gPiA+
ID4gLS0tIGEvZHJpdmVycy9wZWNpL2NvbnRyb2xsZXIvS2NvbmZpZw0KPiA+ID4gPiA+ID4gKysr
IGIvZHJpdmVycy9wZWNpL2NvbnRyb2xsZXIvS2NvbmZpZw0KPiANCj4gW+KApl0NCj4gDQo+ID4g
PiA+ID4gPiArI2lmIElTX0VOQUJMRUQoQ09ORklHX0RZTkFNSUNfREVCVUcpDQo+ID4gPiA+ID4g
PiArwqDCoMKgwqDCoMKgwqBkZXZfZGJnKHByaXYtPmRldiwgImFkZHIgOiAlIzAyeCwgdHgubGVu
IDogJSMwMngsIHJ4LmxlbiA6DQo+ID4gPiA+ID4gPiAlIzAyeFxuIiwNCj4gPiA+ID4gPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBhZGRyLCByZXEtPnR4LmxlbiwgcmVxLT5yeC5s
ZW4pOw0KPiA+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgcHJpbnRfaGV4X2R1bXBfYnl0ZXMoIlRY
IDogIiwgRFVNUF9QUkVGSVhfTk9ORSwgcmVxLT50eC5idWYsDQo+ID4gPiA+ID4gPiByZXEtdHgu
bGVuKTsNCj4gPiA+ID4gPiA+ICsjZW5kaWYNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBUaGUgcHJl
cHJvY2Vzc29yIGd1YXJkcyBhcmUgbm90IG5lZWRlZCwgYXMgaXTigJlzIHRha2VuIGNhcmUgb2Yg
aW4NCj4gPiA+ID4gPiBgaW5jbHVkZS9saW51eC9wcmludGsuaGAuIEFsc28gaW4gb3RoZXIgcGFy
dHMgb2YgdGhlIHBhdGNoLg0KPiA+ID4gPiANCj4gPiA+ID4gU2luY2UgdGhpcyBpcyBkdW1waW5n
IHRoZSByYXcgY29udGVudHMgb2YgUEVDSSBtZXNzYWdlcywgaXQncyBnb2luZyB0bw0KPiA+ID4g
PiBiZSBxdWl0ZQ0KPiA+ID4gPiB2ZXJib3NlLiBUaGUgaWRlYSBiZWhpbmQgcHJlcHJvY2Vzc29y
IGd1YXJkIGlzIHRoYXQgd2UgZG9uJ3QgZXZlciB3YW50DQo+ID4gPiA+IHRoaXMgdG8NCj4gPiA+
ID4gYmUgY29udmVydGVkIHRvIHJlZ3VsYXIgcHJpbnRrLiBJZiB0aGVyZSdzIG5vIGR5bmFtaWMg
ZGVidWcgYXZhaWxhYmxlIC0NCj4gPiA+ID4gdGhpcw0KPiA+ID4gPiB3b24ndCBiZSBwcmludGVk
IHVuY29uZGl0aW9uYWxseSAoZXZlbiB3aXRoIC1EREVCVUcpLg0KPiA+ID4gDQo+ID4gPiBIb3cg
d2lsbCBpdCBiZSBjb252ZXJ0ZWQgdG8gYSByZWd1bGFyIHByaW50az8NCj4gPiA+IA0KPiA+ID4g
wqDCoMKgwqDCoCAjaWYgZGVmaW5lZChDT05GSUdfRFlOQU1JQ19ERUJVRykgfHwgXA0KPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgIChkZWZpbmVkKENPTkZJR19EWU5BTUlDX0RFQlVHX0NPUkUpICYm
DQo+ID4gPiBkZWZpbmVkKERZTkFNSUNfREVCVUdfTU9EVUxFKSkNCj4gPiA+IMKgwqDCoMKgwqAg
I2RlZmluZSBwcmludF9oZXhfZHVtcF9kZWJ1ZyhwcmVmaXhfc3RyLCBwcmVmaXhfdHlwZSwgcm93
c2l6ZSzCoMKgwqDCoMKgDQo+ID4gPiBcDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ3JvdXBzaXplLCBidWYsIGxlbiwg
YXNjaWkpwqDCoMKgwqDCoMKgwqAgXA0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgIGR5bmFtaWNf
aGV4X2R1bXAocHJlZml4X3N0ciwgcHJlZml4X3R5cGUsIHJvd3NpemUswqDCoMKgwqDCoCBcDQo+
ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGdyb3Vwc2l6ZSwgYnVmLCBsZW4sIGFzY2lpKQ0KPiA+ID4gwqDCoMKgwqDCoCAjZWxpZiBkZWZp
bmVkKERFQlVHKQ0KPiA+ID4gwqDCoMKgwqDCoCAjZGVmaW5lIHByaW50X2hleF9kdW1wX2RlYnVn
KHByZWZpeF9zdHIsIHByZWZpeF90eXBlLCByb3dzaXplLMKgwqDCoMKgwqANCj4gPiA+IFwNCj4g
PiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBncm91cHNpemUsIGJ1ZiwgbGVuLCBhc2NpaSnCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqANCj4gPiA+IFwNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoCBwcmludF9oZXhfZHVt
cChLRVJOX0RFQlVHLCBwcmVmaXhfc3RyLCBwcmVmaXhfdHlwZSwgcm93c2l6ZSzCoMKgwqANCj4g
PiA+IFwNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBncm91cHNpemUsIGJ1ZiwgbGVuLCBhc2NpaSkNCj4gPiA+IMKgwqDCoMKgwqAgI2Vsc2UN
Cj4gPiA+IMKgwqDCoMKgwqAgc3RhdGljIGlubGluZSB2b2lkIHByaW50X2hleF9kdW1wX2RlYnVn
KGNvbnN0IGNoYXIgKnByZWZpeF9zdHIsIGludA0KPiA+ID4gcHJlZml4X3R5cGUsDQo+ID4gPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludCByb3dzaXplLCBpbnQgZ3JvdXBzaXplLA0KPiA+
ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCB2b2lkICpidWYsIHNpemVfdCBsZW4s
DQo+ID4gPiBib29sIGFzY2lpKQ0KPiA+ID4gwqDCoMKgwqDCoCB7DQo+ID4gPiDCoMKgwqDCoMKg
IH0NCj4gPiA+IMKgwqDCoMKgwqAgI2VuZGlmDQo+ID4gDQo+ID4gTGV0J3MgY29uc2lkZXIgMyBz
Y2VuYXJpb3MNCj4gPiAxKSBEeW5hbWljIGRlYnVnIGlzIGF2YWlsYWJsZQ0KPiA+IDIpIER5bmFt
aWMgZGVidWcgaXMgbm90IGF2YWlsYWJsZSwgYnV0IHdlJ3JlIGJ1aWx0IHdpdGggLURERUJVRw0K
PiA+IDMpIER5bmFtaWMgZGVidWcgaXMgbm90IGF2YWlsYWJsZSwgd2UncmUgYnVpbHQgd2l0aG91
dCAtRERFQlVHDQo+ID4gDQo+ID4gRm9yIDEpLCBwcmludF9oZXhfZHVtcF9kZWJ1ZyBpcyBkeW5h
bWljIC0gaXQgY2FuIGJlIGNvbnRyb2xsZWQNCj4gPiAoZW5hYmxlZC9kaXNhYmxlZCkgdXNpbmcg
ZHluYW1pYyBkZWJ1ZyBrbm9icyAoZGVidWdmcyAvIGR5bmRiZyBrZXJuZWwgYXJnKS4NCj4gPiBG
b3IgMiksIHByaW50X2hleF9kdW1wX2RlYnVnIGlzIHVzaW5nIHByaW50X2hleF9kdW1wLCB3aGlj
aCBpcyBqdXN0IHVzaW5nDQo+ID4gcHJpbnRrDQo+ID4gd2l0aCBLRVJOX0RFQlVHIGxldmVsIHVu
ZGVyIHRoZSBob29kLg0KPiA+IEZvciAzKSwgaXQncyBjb21waWxlZCBvdXQuDQo+ID4gDQo+ID4g
QW5kIGl0J3Mgc2NlbmFyaW8gMikgdGhhdCB3ZSB3b3VsZCBsaWtlIHRvIGF2b2lkLCBhcyBoZXgt
ZHVtcGluZyBhbGwgUEVDSQ0KPiA+IGNvbW11bmljYXRpb24gaW50byBkbWVzZyBpcyBsaWtlbHkg
Z29pbmcgdG8gbWFrZSBkbWVzZyBvdXRwdXQgdW51c2FibGUgKGNhbg0KPiA+IG92ZXJmbG93LCBw
cmludGluZyB0aGF0IHRvIHRlcm1pbmFsIGlzIGdvaW5nIHRvIGJlIHNsb3csIGV0YykuDQo+ID4g
DQo+ID4gVGhlIGR1bXAgY2FuIGJlIHVzZWZ1bCwgaXQncyBqdXN0IHRoYXQgaW4gb3JkZXIgdG8g
YmUgdXNlZnVsIGl0IG5lZWRzIHRoZQ0KPiA+IGR5bmFtaWMgZGVidWcgZmFjaWxpdGllcyA6KQ0K
PiANCj4gVGhhbmsgeW91IGZvciB0aGUgZXhwbGFuYXRpb24uIEN1cnJlbnRseSwgdGhpcyBpcyBv
bmx5IHVzZWQgaW4gdGhlIFBFQ0kgDQo+IHN1YnN5c3RlbToNCg0KVGhhdCdzIHNpbXBseSBub3Qg
dHJ1ZS4NClRoZSBzYW1lIGFwcHJvYWNoIGlzIHVzZWQgaW4gb3RoZXIgc3Vic3lzdGVtcyBhcyB3
ZWxsLCBzb21ldGltZXMgaXQgY292ZXJzDQppbmRpdmlkdWFsIHByaW50azoNCmh0dHBzOi8vZWxp
eGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjQvc291cmNlL2RyaXZlcnMvcnBtc2cvcnBtc2dfbnMu
YyNMNDANCkluIG90aGVyIGNhc2VzIGl0IGNvdmVycyBjdXN0b20gd3JhcHBlcnM6DQpodHRwczov
L2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni40L3NvdXJjZS9kcml2ZXJzL3VzYi9ob3N0L2Vo
Y2ktZGJnLmMjTDgNCg0KVGhlcmUgYXJlIG1vcmUgZXhhbXBsZXMgaW4gdGhlIHRyZWUsIGJ1dCB0
aGUgZ2VuZXJhbCBpZGVhIGlzIHRoZSBzYW1lIC0gaWYgdGhlDQpsb2cgaXMgdmVyYm9zZSBhbmQg
cHJpbnRlZCBvZnRlbiAobGllcyBvbiBhIGhvdHBhdGgpLCBhbmQgd2UgY2FuJ3QgcmF0ZWxpbWl0
LA0KaGlkaW5nIGl0IGJlaGluZCBkeW5hbWljIGRlYnVnIGF2YWlsYWJpbGl0eSBpcyBhbiBvcHRp
b24gdG8gY29uc2lkZXIuDQoNCj4gDQo+IMKgwqDCoMKgICQgZ2l0IGdyZXAgJ2lmIElTX0VOQUJM
RUQoQ09ORklHX0RZTkFNSUNfREVCVUcpJw0KPiDCoMKgwqDCoCBkcml2ZXJzL210ZC9uYW5kL3Jh
dy9uYW5kX2Jhc2UuYzojaWYgDQo+IElTX0VOQUJMRUQoQ09ORklHX0RZTkFNSUNfREVCVUcpIHx8
IGRlZmluZWQoREVCVUcpDQo+IMKgwqDCoMKgIGRyaXZlcnMvcGVjaS9jb250cm9sbGVyL3BlY2kt
YXNwZWVkLmM6I2lmIA0KPiBJU19FTkFCTEVEKENPTkZJR19EWU5BTUlDX0RFQlVHKQ0KPiDCoMKg
wqDCoCBkcml2ZXJzL3BlY2kvY29udHJvbGxlci9wZWNpLWFzcGVlZC5jOiNpZiANCj4gSVNfRU5B
QkxFRChDT05GSUdfRFlOQU1JQ19ERUJVRykNCj4gwqDCoMKgwqAgaW5jbHVkZS9saW51eC9tdGQv
cmF3bmFuZC5oOiNpZiBJU19FTkFCTEVEKENPTkZJR19EWU5BTUlDX0RFQlVHKSB8fCANCj4gZGVm
aW5lZChERUJVRykNCj4gDQo+IEkgdGhpbmssIGl0IHdpbGwgb25seSBjYXVzZSBjb25mdXNpbmcg
Zm9yIHVzZXJzLCB3b25kZXJpbmcgd2h5IGl0IGRvZXMgDQo+IG5vdCBzaG93IHVwIHdpdGggYC1E
REVCVUdgLiBJIGFzc3VtZSB0aGUgTGludXgga2VybmVsIG9mZmVycyBvdGhlciB3YXlzIA0KPiB0
byBkbyB3aGF0IHlvdSBhcmUgdHJ5aW5nIHRvIGFjaGlldmUuIE1heWJlIHVzaW5nIGEgZHVtcF90
cmFmZmljIGtub2Igb3IgDQo+IHNvIGluIGAvc3lzYC4NCg0KQWRkaW5nIGEgbmV3IHN5c2ZzIEFC
SSBmb3IgZGVidWcgcHJpbnRzPyBOby4NCkFsdGVybmF0aXZlIHdvdWxkIGJlIHRvIHVzZSB0cmFj
ZXBvaW50cywgYnV0IHRoYXQncyBzZW1pLXN0YWJsZSBhbmQgdW50aWwgbm93IHdlDQpvbmx5IGhh
ZCBvbmUgY29udHJvbGxlciBkcml2ZXIsIHNvLCBmb3Igbm93LCBJIHdvdWxkIHByZWZlciB0byBw
b3N0cG9uZSBhbnkgUEVDSQ0KdHJhY2Vwb2ludCBjb252ZXJzaW9ucy4NCg0KVGhhbmtzDQotSXdv
bmENCg0KPiANCj4gDQo+IEtpbmQgcmVnYXJkcywNCj4gDQo+IFBhdWwNCg0K
