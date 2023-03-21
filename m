Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 647856C2EF9
	for <lists+openbmc@lfdr.de>; Tue, 21 Mar 2023 11:30:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PgntB2L9xz3cLx
	for <lists+openbmc@lfdr.de>; Tue, 21 Mar 2023 21:30:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bAD5D5FM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bAD5D5FM;
	dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PgnsW52tyz2ynD
	for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2023 21:29:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679394575; x=1710930575;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=QUcMUb/MzBtWf5BHEuwTvaZyyZlsks7v1R+yyS/hwlk=;
  b=bAD5D5FM71uHtuF11sYV5FM/eIUeX8z7BofHBHrtpLARjCMDPxCRjMhR
   S1ipS6Yg5f7yQ6w6Dp4v4+M1LAwfDEgZPNIUalICExfPC2FmhPyvMCrpS
   lOaljTR/MQbXfbGwvw058xbeB9Mk2YMoqFHD5VNzFRtGmxX1TLci7Wcr4
   qeDpxb9v8QXaXCtXcJ5fVyoRPtVmvL0GZqWDGBg3XAphkFusQY6pugQSC
   euRXCCcf2zYOzlO92ggz7o1126ulQSL1+Tgi/7KNOgJNm8U/S5Ktqsxu0
   Wb+Pj9upJ3sIHvxqeVTql32avhfC9ma43FunBvpTcrI93cneL5RZGeDMK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="403777607"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="403777607"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 03:29:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="750495258"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="750495258"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga004.fm.intel.com with ESMTP; 21 Mar 2023 03:29:25 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 03:29:25 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 03:29:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 21 Mar 2023 03:29:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 21 Mar 2023 03:29:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g7mm9aw1n0gtxkvkWPwRpPHhhUyUB7NAfZoSdHuIKr13HJJi9OKEc+t1d6MMcyt+yEVPEu4eTX/Utfsu+0c9FPgZS6mkaydsM8/2hk03KSQpG1ep948VI/itZ7qe3OKcviU8S2SwrQqhyO4wW7VGxQwO0wQ2Y9OGF0iThZoGg3IMOn78cOzgVob6PbX//SxysBXb4PCiejKvwjOOk0ZNt/DJOfrk171PGb+bQgwA9KrWiUtStpR8KivIrWqK7K4fFVI4QQoMY6qlEAYxcRpMvxFLj4oVFdcoQc54N3cwV+VMw2evb6+fY4pVzeMRdRYb46ev7YOCw813wKknvt3imQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QUcMUb/MzBtWf5BHEuwTvaZyyZlsks7v1R+yyS/hwlk=;
 b=FiQ+GwJLD0toyAwwY7PNGws5clf6XpJeeaNWlelKmriS+L4irW4J3ngV9bhwGD3tfUSVJEhobhGfoNOM0mN9o3s24cAM4s+U4UEfbOl+XuD82danFSBe7VmY57bY7hEuFuUxMYe5VBotQpeHnwxytRVh/BOOnFSnr19Z1DKiLtTkCD+3y3fmJwJQcJnTV6XBNx0QmvioZrOkNckBIk7nMhUc+NFWzD2zKZiebR6/Wig/YfGFrwYPfoNU9A+Qa7jqmGSDz62jGNjnl9NWZVMzajAlFA5gYGJACwtoZ09OcUcUqkYyymvSRMkdddEUaEIWXcpwFIQjU31hmvGOPBUVQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by SJ0PR11MB4976.namprd11.prod.outlook.com (2603:10b6:a03:2d7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 10:29:22 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::1181:71b3:9254:ea83]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::1181:71b3:9254:ea83%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 10:29:22 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "pmenzel@molgen.mpg.de" <pmenzel@molgen.mpg.de>
Subject: Re: [PATCH] hwmon: (peci/cputemp) Fix miscalculated DTS for SKX
Thread-Topic: [PATCH] hwmon: (peci/cputemp) Fix miscalculated DTS for SKX
Thread-Index: AQHZW9QkjE965MaRtk2iiVZ4euyib68E+xaAgAANPQA=
Date: Tue, 21 Mar 2023 10:29:22 +0000
Message-ID: <df6ab72faf9f1484f7f850ad7386f76b60e5bf02.camel@intel.com>
References: <20230321090410.866766-1-iwona.winiarska@intel.com>
	 <f2fe16cf-3838-df89-958f-c39d1bae81a1@molgen.mpg.de>
In-Reply-To: <f2fe16cf-3838-df89-958f-c39d1bae81a1@molgen.mpg.de>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.3 (3.46.3-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5823:EE_|SJ0PR11MB4976:EE_
x-ms-office365-filtering-correlation-id: 2d6096ba-6d14-4f75-5df4-08db29f722f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cFzfX+teqiClSqp5JJU1xz9JmSg3NzMfA+9fPISKeIAcQEWoFbg6TTFzELiRMKjM4ntzC3q5yez8by2F194YpVh5ldQOcpP0N2+CBpxkDYG+NyJZCe+vBi3czzMPpueN2dWZKSOWMdgFulNXwAxbJxSxnotZNlmNH0ritQ4LIHXtyL5Y5ydIkIkXuPSSn/UH0hvzIQ0hl3Jk2ssB2Ktm3nUHn1m4zASJNKVJfIfo4nVUlH5WS3zYOvZQYK3hEkiq6h+HY+MiPVtE/gyV3WNq/VWLFxapedwaki+wzAJUEQGwCB42Vm0W2mRmUR3rNGIfGnnGqAg9avpU632NkiKB04RYWuEHo/UWZa/yT3FoeoqguDn4nJAtf2jDXqd1hRD0dGCwn/Q0W3Q2ATs3aFq4QjYyq/4gNfeXDSEQgXX63YyOPOdltFyQBb9mbBlw0C7DHCPQXER+IVOKdI1KSnS2OUDjOMEYhMEybXgSOSa/MAs5faFCpjoyjRLWVQywh9H3LqwRoY+6fYOJwnOr7OpqPU7na854pahV0/DDJObOFVHRT+1n1VFeHMiDzF7rcnaYYMIJe/VudmYjfbzZEklkKIew0cySKlwUTaWOU0a1vZYugvmYdty56HreqzFIfotJIlnoFE4Mxlgb4o2bF7qMp4WxB+j7kCqmRVKwxERVe7XidR//F4kWjfFBe/5bP/OA
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5823.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(346002)(39860400002)(136003)(366004)(396003)(451199018)(2616005)(71200400001)(186003)(6486002)(966005)(4326008)(83380400001)(478600001)(316002)(66476007)(76116006)(6916009)(66946007)(66446008)(64756008)(8676002)(66556008)(91956017)(6506007)(6512007)(26005)(54906003)(41300700001)(8936002)(5660300002)(38100700002)(122000001)(82960400001)(2906002)(36756003)(38070700005)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGg4WFBQbW4zRlh0U0ZScjFSME1TWGpHK2gvNkxhem05MFhhaCtuVDJXQlVw?=
 =?utf-8?B?cFhWY0E4QkFKSWFlM3RvalAvb0ZZbEhKenVOUDkyQmFTTzVQZEdPcU5ncU5R?=
 =?utf-8?B?d3RIMEJTQ04rZXlEQkZmSTlJckt4dXI1OWFuQWhHaGtsdHAyaDBsek95aTcx?=
 =?utf-8?B?a2FZRHJhVDE4NG5VYVhWcy9LMU9QTEVuV3owWnFtc0orMmhkNDRoYysxbzFS?=
 =?utf-8?B?RGFVRHdMaHJPTzFLME0vcDVJbjFrOWQ2QmoyMm1qc1JGV3BPWmdzdkc1WFBj?=
 =?utf-8?B?TExyQWFhWHZCeHljZWFIWEkxMmQ2a1l6S2cyQzhRdEwzNlg5M1h6SXluMTVV?=
 =?utf-8?B?MVJMZFNLdDRrcTNNcjhUWjMrMy8wdkJFcEkwekhBRFlRQ2ZUNHpwL3JjSlov?=
 =?utf-8?B?UnZ0bmVJcGFwSUE0WG16VStnUEdXbTU1UkpPMDBCM25HYm02QTdVVlcwdW5X?=
 =?utf-8?B?VHl4K29aVTViQkFMM1haM0hBOVZrbHAzSjRWdDJXbUl0VmdXU052akgyWXFh?=
 =?utf-8?B?SXhMbk1KWG1vY3I0YXNHMFY4WVlROTJqWUduODlHUzZjenI2S2loRE9ZOU11?=
 =?utf-8?B?QVp3SjM5c2NvRWV4Q2kzckhLb281WDVWN3oxMW5zWGN5Z1lLNElxY1gzNHNI?=
 =?utf-8?B?dzJ5MXVqOXJ2Mlo1NjZ2T1hnNkFnVXFoUmhzaEJVQWlZeExGQzRjV1praWFs?=
 =?utf-8?B?WGh5SzZ0K2xHY05NWm9uRXVpQlppSExJcmJ2TUlPU0VXOEFoSTZkeDMrYlJ3?=
 =?utf-8?B?ZW9KNGc5VGwxRnNiVGVuYnFPQTdpUG5janFWMU5yNEY0eFJjVC9Bamp4eGFq?=
 =?utf-8?B?SjduNi9xTGpaL25Fc1RtVXB3RjFMbVpoNnBodHBRS2t2cWxBZ3RNeDBISDVG?=
 =?utf-8?B?WDBpS2E0QTZzRk5Dak43T3FZZXZpdzc2K0lscmcyTlBDOGVFK1BEcHZNTjJ1?=
 =?utf-8?B?VkZ2L2R1WmFJa2pjS2c0b1VWMFJYVkZXTEhoNm54OWJReTgrWVYvUGxCcm9T?=
 =?utf-8?B?d3NFcWRkbnZIYmJHc1JxZWdubnNxY0YxNVRkMS92cWhHRjIxQ0NpVkJGZ3o4?=
 =?utf-8?B?TnRaelpoeFpWSVljQkJEQjVKMzdvNk5qVHlBSnJINkNyL0EvVUw4WTdNb29U?=
 =?utf-8?B?SW0vN1lIS2RCZWUvczdOMTdPM2djTFpVaEdIZWVadThIY1RONktNV0RVV2xQ?=
 =?utf-8?B?Z3dSYXpmVEN4WFhNc29ZNWQrY0JoYVBkMWZpdlJ1Wm51MHN1S0M0NEI3bEtB?=
 =?utf-8?B?MGp3bmtaNElhQUs3WmZaVEkyL25BWGlKclpMdVdadkJkdTcwWEdrcUwwOFRB?=
 =?utf-8?B?bTBWdEgxSnBRMzh3Z2Z2QlkrVjJRRCtBMGpMcUwzZ0xHbkhMLys0WVE2TE5j?=
 =?utf-8?B?RE4zTzZXdWJ0MERMdnpjQ0VnbUNGNktaUy9uTVhRN29WMmZYWnRJSEVVS25o?=
 =?utf-8?B?OWtEaXlzVll3S2hOQkRhNlNrd1MzN2dUZzIrWU9OeHZDbXF0TWx0SWYwb05y?=
 =?utf-8?B?emtKaVRiUEk1a2lxeDZKY2hJQWlDcmp5WVkrY2NURklISWR1aWh4dHFUL21h?=
 =?utf-8?B?WGIrOXU3ajdma0JIWDQ1elJLQVdZRndPOGJ5cjlCNnh4SXd5Mkx2dmNIU0w3?=
 =?utf-8?B?dE53V1RmazZVN1NDem1hRk1EWktacyticm5sUktnWEIwbkNKb3ZHcWgvZWhB?=
 =?utf-8?B?K0VLeTVwZm10YXh3aUo1eFRyWXdXZ3Q5WEJMOVFRYXFFUDJUOU4rZzNQRHRo?=
 =?utf-8?B?cTVMK2VGZVlKYjZENkxsbUk2cVhRQ2pwdDdVanNaM1lkT0creTVDSHVKR0E2?=
 =?utf-8?B?elBsTnhGTUlob1lzK3prZmhEZVpSaTJnTEVvUndhYUFsNVV1bVRPRDVWSENN?=
 =?utf-8?B?aEJzWXRjRWhxeklJdmJWRmhRS3YrdTBPc2QzUDgwTGdxVjU5UkRZZlJkQ2JJ?=
 =?utf-8?B?d3ZNSUpMNDBUZm5kdTJkNDNIZkVCbDgvRFV3NDBtMmIzMmc0R05xTHdwZ05E?=
 =?utf-8?B?dVZOMi9WMGpTY0xJOW8xT2VCQ0YyOG1zWW9yaUF6UnhjN3V1T3lieVFISFRy?=
 =?utf-8?B?OUhWUkFxc1NYc2ZyVTdjVytBTzFWMmJDVUhmdW9JaHE3NWV0b25rSmxUZnpy?=
 =?utf-8?B?dzBlNlpBMUtDcys5M2xuUEVhbFRleUVvWW0wZGFvSmlhcnZSUm05RHNsRTF4?=
 =?utf-8?Q?J5HKjNrGsiEIiV8ZPawC0UE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2594B29C60B56B48A51D5E41715CC7AC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d6096ba-6d14-4f75-5df4-08db29f722f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2023 10:29:22.2598
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /wq2Te/+jXnQzfrxaSQ4AXkqEJR/ISPtfutrlVOvmiUVJMTT7hGNaroFRNUVqIUT847pUFehaGIqAE84XwHEPkef4Jg0gohS6MKUek1JwRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4976
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "jdelvare@suse.com" <jdelvare@suse.com>, "fercerpav@gmail.com" <fercerpav@gmail.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "linux@roeck-us.net" <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gVHVlLCAyMDIzLTAzLTIxIGF0IDEwOjQxICswMTAwLCBQYXVsIE1lbnplbCB3cm90ZToNCj4g
RGVhciBJd29uYSwNCj4gDQo+IA0KPiBBbSAyMS4wMy4yMyB1bSAxMDowNCBzY2hyaWViIEl3b25h
IFdpbmlhcnNrYToNCj4gPiBGb3IgU2t5bGFrZSwgRFRTIHRlbXBlcmF0dXJlIG9mIHRoZSBDUFUg
aXMgcmVwb3J0ZWQgaW4gUzEwLjYgZm9ybWF0DQo+ID4gaW5zdGVhZCBvZiBTOC44Lg0KPiA+IA0K
PiA+IFJlcG9ydGVkLWJ5OiBQYXVsIEZlcnRzZXIgPGZlcmNlcnBhdkBnbWFpbC5jb20+DQo+ID4g
TGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9aQmhIUzd2Kzk4Tks1NmlzQGhvbWUu
cGF1bC5jb21wLw0KPiA+IFNpZ25lZC1vZmYtYnk6IEl3b25hIFdpbmlhcnNrYSA8aXdvbmEud2lu
aWFyc2thQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiDCoCBkcml2ZXJzL2h3bW9uL3BlY2kvY3B1
dGVtcC5jIHwgOCArKysrKysrLQ0KPiA+IMKgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9od21vbi9w
ZWNpL2NwdXRlbXAuYyBiL2RyaXZlcnMvaHdtb24vcGVjaS9jcHV0ZW1wLmMNCj4gPiBpbmRleCAz
MDg1MGE0NzlmNjEuLjg3ZDU2ZjBmYzg4OCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2h3bW9u
L3BlY2kvY3B1dGVtcC5jDQo+ID4gKysrIGIvZHJpdmVycy9od21vbi9wZWNpL2NwdXRlbXAuYw0K
PiA+IEBAIC01MzcsNiArNTM3LDEyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgY3B1X2luZm8gY3B1
X2hzeCA9IHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgLnRoZXJtYWxfbWFyZ2luX3RvX21pbGxpZGVn
cmVlID0NCj4gPiAmZHRzX2VpZ2h0X2RvdF9laWdodF90b19taWxsaWRlZ3JlZSwNCj4gPiDCoCB9
Ow0KPiA+IMKgIA0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGNwdV9pbmZvIGNwdV9za3ggPSB7
DQo+ID4gK8KgwqDCoMKgwqDCoMKgLnJlZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoD0gJnJlc29s
dmVkX2NvcmVzX3JlZ19oc3gsDQo+IA0KPiBUaGlzIGlzIG5vdCBhbGlnbmVkLiBXaHkgbm90IG9u
bHkgdXNlIG9uZSBzcGFjZSBiZWZvcmUgdGhlIGVxdWFsIHNpZ24/DQoNClllYWggLSBzYW1lIGFs
aWdubWVudCBwcm9ibGVtIGlzIHByZXNlbnQgaW4gY3B1X2hzeCBhbmQgY3B1X2ljeCB0aG91Z2gs
IHNvIEkNCmp1c3QgZm9sbG93ZWQgYWxvbmcgZm9yIHNreCB0byBub3Qgc3RhbmQgb3V0IHZpc3Vh
bGx5Lg0KU28gd2hpbGUgSSBhZ3JlZSB0aGF0IGFsaWdubWVudCBpcyBicm9rZW4gaGVyZSwgSSB0
aGluayBpdCBtaWdodCBiZSBiZXR0ZXIgdG8NCnNlcGFyYXRlIG91dCB0aGUgcG90ZW50aWFsIGNs
ZWFudXAgZnJvbSB0aGUgZml4Lg0KDQpUaGFua3MNCi1Jd29uYSANCg0KPiANCj4gPiArwqDCoMKg
wqDCoMKgwqAubWluX3BlY2lfcmV2aXNpb24gPSAweDMzLA0KPiA+ICvCoMKgwqDCoMKgwqDCoC50
aGVybWFsX21hcmdpbl90b19taWxsaWRlZ3JlZSA9ICZkdHNfdGVuX2RvdF9zaXhfdG9fbWlsbGlk
ZWdyZWUsDQo+ID4gK307DQo+ID4gKw0KPiA+IMKgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgY3B1X2lu
Zm8gY3B1X2ljeCA9IHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgLnJlZ8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoD0gJnJlc29sdmVkX2NvcmVzX3JlZ19pY3gsDQo+ID4gwqDCoMKgwqDCoMKgwqDCoC5t
aW5fcGVjaV9yZXZpc2lvbiA9IDB4NDAsDQo+ID4gQEAgLTU1OCw3ICs1NjQsNyBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IGF1eGlsaWFyeV9kZXZpY2VfaWQNCj4gPiBwZWNpX2NwdXRlbXBfaWRzW10g
PSB7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoH0sDQo+ID4gwqDCoMKgwqDCoMKgwqDCoHsNCj4gPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC5uYW1lID0gInBlY2lfY3B1LmNwdXRlbXAu
c2t4IiwNCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLmRyaXZlcl9kYXRhID0g
KGtlcm5lbF91bG9uZ190KSZjcHVfaHN4LA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAuZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vsb25nX3QpJmNwdV9za3gsDQo+ID4gwqDCoMKg
wqDCoMKgwqDCoH0sDQo+ID4gwqDCoMKgwqDCoMKgwqDCoHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoC5uYW1lID0gInBlY2lfY3B1LmNwdXRlbXAuaWN4IiwNCj4gDQo+IA0K
PiBLaW5kIHJlZ2FyZHMsDQo+IA0KPiBQYXVsDQoNCg==
