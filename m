Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E6346C2ED
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 19:33:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7ppP4d4dz3015
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 05:33:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=N7F9RDqV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=N7F9RDqV; dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7pnt097fz2xC6;
 Wed,  8 Dec 2021 05:33:05 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="261724643"
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="261724643"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 10:15:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="479613813"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 07 Dec 2021 10:15:13 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 7 Dec 2021 10:15:12 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 7 Dec 2021 10:15:12 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 7 Dec 2021 10:15:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VSNFVQcPxGmmB1jsZuTIu8mrAllE1IWxTaBc2Ud6syP12z69pACkDyEvf3sj/RdVIUXsZglunt0OzLfnJhtO/imSOFGx5JM7sWTpNq5R/ZnsBSKBhcPg2fro3T+3fkl43YKoGLjIwvrVTFj1f0VdmloFJSwzNtapBp6OI8M24h2g4H4qRhHUROKmnkxUTRQqnBP5zY4yh9J4YSSRIifRoAHRjkcMYiY2AcZWQ0lZAupt/tx0ZlXFYmeQSnWyqnHBpqESxI9yIUPmGYcPKVisQ2CGA8rwojptlBD9QN9yCRAiQeAuwqX+WhFBh3hW8NNtp+1kEtSMLTRZ7odQY7HxtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1AxncFjhSGRS7O8+aAt0WcCSy/+3T6035c7oyhdHNA=;
 b=CqBlSX4dDLIjx33PtRcMGt7wzb3tijYYkX6ukIkGw7OcLYgJm45sNoTALtn/50eq1hcWp+WtU89KNvJ3WygFvkVRGNEZorHXGSOmFc3BS446UV621u8A2nx/V8bVVBzDy91+MtuQZ47gBK/+/4aA7gvGcWkIdifl9I0avrDt+huKT1RCidVPEOFyGeTEDKBip6sJPJEzNaZ9ZTbMYvpJaEaAf2pGVOgwxK0bK0LPU4G/eF10k7n+SCLlzfGvmucrpw6HHmCj+Dm+L1ln1Ovno7Ef0mHsRoRbL4iisQi3qK4w/+gka0Otd0Wr8kx49kHWo1zW3TTRQr5y4VnorIhM/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1AxncFjhSGRS7O8+aAt0WcCSy/+3T6035c7oyhdHNA=;
 b=N7F9RDqV7p+5xX3nq2SPggV29z5+6dqrxQpJqDM2sY/MS7TS+1VUQFUcZQ4BjLifWZJMqFGSf4BW6pEWtgD9vE9Ii+OPxAnOFwWHVX9RgFcbEl5vmUwasSLCAprGjxiaesBr1mH5WAWpdNUo+SR/pWGsJUjECywPSVS4Lp1orKs=
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by MW5PR11MB5858.namprd11.prod.outlook.com (2603:10b6:303:193::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Tue, 7 Dec
 2021 18:15:11 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::1d1b:2541:5263:68de]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::1d1b:2541:5263:68de%5]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 18:15:11 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "billy_tsai@aspeedtech.com" <billy_tsai@aspeedtech.com>,
 "zweiss@equinix.com" <zweiss@equinix.com>
Subject: Re: [PATCH v4 02/13] dt-bindings: Add bindings for peci-aspeed
Thread-Topic: [PATCH v4 02/13] dt-bindings: Add bindings for peci-aspeed
Thread-Index: AQHX4HOYEttsdpzRq0uN4nTFYN86p6wdfiMAgAEAKwCAAApZAIAI4y8A
Date: Tue, 7 Dec 2021 18:15:11 +0000
Message-ID: <0a82b85608ea13424c601a4a6364652d2a411675.camel@intel.com>
References: <20211123140706.2945700-1-iwona.winiarska@intel.com>
 <20211123140706.2945700-3-iwona.winiarska@intel.com>
 <DDB2E224-472B-41CC-A5C6-BEADB4BF2041@aspeedtech.com>
 <20211202015455.GB25091@packtop>
 <4B35121C-3BF3-4EF2-BBE6-AA76FA1920E3@aspeedtech.com>
In-Reply-To: <4B35121C-3BF3-4EF2-BBE6-AA76FA1920E3@aspeedtech.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-2.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f71b8cd-8a25-46c0-4e2f-08d9b9ad822e
x-ms-traffictypediagnostic: MW5PR11MB5858:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr,ExtFwd
x-microsoft-antispam-prvs: <MW5PR11MB58584675F74E185E057C3B8CEC6E9@MW5PR11MB5858.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I5u6ZTGX1Z70gLkQ+Qq+3EOrGtkWNoXzGgd1a6xy0ahSR6rUuqcCfWxlNgQXKRIfcYtLQVyFQngr8tV1yD52k4+8ahKHqhDMOvSAkpuaId7LAdDzkPXR0bwibW03DPTzh2FteOqYk9d/6C1ckZUwisiSZ6HEAvQLpxzy4pv6Xh8fU6AT6YSX3Embn3kpwFloBCQggztCkvV9IPhRbKW+WyvNBA8oFYwmr176BZkLGwekyWvKBW17dlhUD7OSIrw7Xnufz0JYtEgtykqE8jmzMhwRNNHNmpkpZQufI0ajbvJvSlvF1cAkwoWiddn8Dp3QbTRLDBbYFsvBFxqeqjhquabKXikzLmyQwXLFlnsmM1B3cqY20HeLLYnfCO5U/Zut9KUNt6M/Jmr2ewLxiu05qGrHeao6UUxAuIZCe+3US7iOfeQR1TihHV5ETjagzu5A5BxwqcrwkCvVxaKehC8/Q/pjes7b0VQbHfp4ljhC/4ys4m4U2noZ7fJZMpqQLKN++kej9J3utmcpbo/eV9/0kcGi5h8k32kHK56WC4VCARk8Svmv+WtE26Zezt2m0Z91XGoUY9IVfiooiAHnJ6V0r/E1SDRy7UY/ICLedb6/5/anP2IuHSJAGt3SnYx3Yj0ddgdvhaPeEkMZRC2+fjTkNV2LzuhH9QFd+qj+d5ZcHqWH4N93d1Dh5fz+h/M2/wOCJn3jY0XFz7WO/0omaV1vig==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5823.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(36756003)(82960400001)(316002)(66946007)(66446008)(64756008)(76116006)(66556008)(110136005)(91956017)(66476007)(54906003)(4326008)(508600001)(6486002)(122000001)(186003)(38100700002)(53546011)(6506007)(2616005)(6512007)(71200400001)(7416002)(5660300002)(86362001)(2906002)(26005)(38070700005)(8676002)(83380400001)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TWhyYUM4eVRpODdXRUF0eWI3ajVPblZRc1I5QjZ2YUtzVDJUOHZnVlBUditN?=
 =?utf-8?B?UDBzUFJ0SmlPZ2RzcHpKcFlicGxySnBVV1V4RDUwL2k5SkhHNnhpVk00ZEg1?=
 =?utf-8?B?Q1dHTExaNTUrVFVzYXA2dk9rbnI3enRPOEx6dTZUekVNbTAwTVRXR1crRnNw?=
 =?utf-8?B?NWZBczlzdkcyaGJzaWU0VXpmRjY4TDh3RHlYdUtwZFpISE5WcWQvR1g5WHF3?=
 =?utf-8?B?QURaUzJWbHVxa2dub2Rrbm50ejIwdFVsQ0laaHVhYWZEUjFRaVViNUkvNWE4?=
 =?utf-8?B?NnBsMUxHcDdURTB1QVQ3WXlFQUNmTFEzS3BoQ25LemtJREpDaEpxSFJEa21n?=
 =?utf-8?B?YmsyMXJZcVZzREZyb2kwR1huNjRBMkIvVm0zRmM4Mlo4ZFVybDJDZnlmOG9V?=
 =?utf-8?B?SE5sUXA1NEJiMXF1UnBMS1lqelJ2R2dYOUZ0TEpLZzJRZ3JISFdFQ2tqVkI1?=
 =?utf-8?B?ZmZVbUR1OE9YWTlyR1NTMllZVWFhMHdXWFNWRE94TTlFSjJ5azNaRUNha0FX?=
 =?utf-8?B?ck9IY0ptS0ZGWncyTTlKU3VINWdDeXZTbWc1S1NVWTJPYUVLcnhjNlFzOTJE?=
 =?utf-8?B?cklQZFZJay9OZE41cWxNRFJJQmVObHBsZUhYaGI1bHVQK3p5Vkd4d2N2anls?=
 =?utf-8?B?MkR2V3NQL2ZWK2tNc056eGpNb3NpUWdMQmE1cU8rQTZPL0sycTZwUmprUmhu?=
 =?utf-8?B?elJtaWpheXZ1UjAyTVNuSUYyYkMya2ZncmdkNTBseXcwSWp1TWN2MlN0NTNK?=
 =?utf-8?B?bXpZNTYySmVLRm80MUZQVTZNMDMrTzFKTDV3MUJjMUFFRVJCVC8wQk9ha3RO?=
 =?utf-8?B?c1Y2QU9pL2ViV2JQRDRtL0NmWXlsajgyL1cvQzFGSHdUQzdKb0Z1UnV5ZFd0?=
 =?utf-8?B?VkFWTWh6eTJ6UndrMkVZQjVla1BDN3JLV3ZJdUpDUW5FeGlFbHkxNUpBZUp2?=
 =?utf-8?B?VDY0UW1YU0UvcjJsNWRGWmI1U1RPeDM1OWY3a0hXVHpWc3hZdXZyMURRNjNJ?=
 =?utf-8?B?TXdERnJRY1NUeUdKOWFUWml3dkV3QWQwUWtDektaZEVMMnBFcFRoSndPbldN?=
 =?utf-8?B?WFM0NGhNbFkvQjM4RWwzQ0w2c0twRnV5Zldrci9yMG9wM2dsZWtEZlJFVEF5?=
 =?utf-8?B?SE94SnpVVHVxN25vNzkxNHNHVTFVWkVDbnlHdExrclhFVFU4NndCRFV1U0NB?=
 =?utf-8?B?MUVVb1ZEdzRPN2o3UGhVSnh3RWVSdzhOMyt0M3ZpdzlEYkpSN0w1aG1YVHRY?=
 =?utf-8?B?bXVKVlZrZnJyQVA5enNraXNFOCtzREhSSUNmNGwvcG1GOXV0TTA4RFNRT3Ns?=
 =?utf-8?B?c0VVc01GR2NFRHA5THlGWVRTREhhVXJ0ZmlIbkdoU0ppQmx3QVlJLzdKRmgw?=
 =?utf-8?B?Tm92N0NOM0RSdmoxaXN0TzM2Vzc3eVJrZ2RrQTZscUhtaDRGNkx2LytlaEI5?=
 =?utf-8?B?NnFPcXFUZndOQ2RYYy9BVndoMWZIQzhrTHQ4M1dUYUI3cjhxOHN2aGp1R0Y0?=
 =?utf-8?B?V21odGhRNWxOZmdjQXd4b1krTS9ya3Zja3BTalZJa3VIZjg5Z3dYR0U1MHJZ?=
 =?utf-8?B?U2ZscGxxZVU2UVBOMFNhTndFUmwybmNscUlUeXBRN0M0amdURTlUSThzSHk1?=
 =?utf-8?B?YmtXVndWMUc4THB0ZGdlMFYrOU9aTS9kWU05RnY4dEdDTjZmb0tZMEJuU0Fz?=
 =?utf-8?B?TVFydDV5eUVhclJ2VStLYzdYOXFhMFJHa1doY1RZbGxBQ0dvYjVSdmw1MkhG?=
 =?utf-8?B?em5wQTI0ZlROTFVPdkJxQUtHMjVncS9scDRNRjBFditnSm9BMDBSWjl1T1F1?=
 =?utf-8?B?dXBNV2pocDZGaVdFM1FwMVBnV1ZvSkxyVmQwcE1DQWt3OEV6OXdzcUw4U0lY?=
 =?utf-8?B?bUhPdFZncmtxdDV2RWZ5b1p6dFBYLzdpbld1R0J1NTQzb0pxVTVOZThQV2pI?=
 =?utf-8?B?ZE93Vk9uUTJ3OEpEUFpKdllycWp1K1IwRVg4Qkd2d2xabjNIdTQxWU5TNVBB?=
 =?utf-8?B?UkNKWCtZZ0ZMc2IyUHk1cEo2b1pCaVpPdlNQOUU2SHVoaGpGa1ZRYTdoQlNv?=
 =?utf-8?B?czFtQ3lUdTV0SkY5WnU1VDgrUE9HSUVJT2xZZ21IaGtmQlhnWWw3NXlxTm1o?=
 =?utf-8?B?aGp5K1ZRcSs0aUVQQnRtYnpmdWdRVGk0SkNiRmQ1YkNVcUZwN092blY1M2E3?=
 =?utf-8?B?aWZXeVNMR1RVN3BqQWt1alpaQUJVZDFKNDJGUm40Q2dLWlR3cUFMZlFFMGdh?=
 =?utf-8?Q?xYngiv5/RRTmRYX3CPdCVh9NHECYdgBf9JI7oBtvhU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0F9AE7E32B25564FACAA4D1970421A50@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f71b8cd-8a25-46c0-4e2f-08d9b9ad822e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2021 18:15:11.3412 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5uj8lYX3TBJW+nv68fcyROQzOqpVOr9vhYemCzHIb0DklDVIc1bfLFpgzrilCv3qLu6bxsoQtVX4SabEOEOupgW7gQlLrMhUuUrsSqHVbXE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5858
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "Hansen,
 Dave" <dave.hansen@intel.com>, "robh@kernel.org" <robh@kernel.org>,
 "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "Williams, Dan J" <dan.j.williams@intel.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "Luck,
 Tony" <tony.luck@intel.com>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "olof@lixom.net" <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gVGh1LCAyMDIxLTEyLTAyIGF0IDAyOjMxICswMDAwLCBCaWxseSBUc2FpIHdyb3RlOgo+IEhp
IFpldiwKPiAKPiBPbiAyMDIxLzEyLzIsIDk6NTUgQU0sICJaZXYgV2Vpc3MiIDx6d2Vpc3NAZXF1
aW5peC5jb20+IHdyb3RlOgo+IAo+IMKgwqDCoCBPbiBXZWQsIERlYyAwMSwgMjAyMSBhdCAwMjoz
ODowNEFNIFBTVCwgQmlsbHkgVHNhaSB3cm90ZToKPiDCoMKgwqAgPsKgwqAgPkhpLAo+IMKgwqDC
oCA+wqDCoCA+Cj4gwqDCoMKgID7CoMKgID5PbiAyMDIxLzExLzIzLCAxMDoxMCBQTSwgIm9wZW5i
bWMgb24gYmVoYWxmIG9mIEl3b25hIFdpbmlhcnNrYSIKPiA8b3BlbmJtYy1ib3VuY2VzK2JpbGx5
X3RzYWk9YXNwZWVkdGVjaC5jb21AbGlzdHMub3psYWJzLm9yZ8Kgb24gYmVoYWxmIG9mCj4gaXdv
bmEud2luaWFyc2thQGludGVsLmNvbT4gd3JvdGU6Cj4gwqDCoMKgID7CoMKgID4KPiDCoMKgwqAg
PsKgwqAgPsKgwqDCoCBBZGQgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIHRoZSBwZWNpLWFzcGVl
ZCBjb250cm9sbGVyIGRyaXZlci4KPiDCoMKgwqAgPsKgwqAgPgo+IMKgwqDCoCA+wqDCoCA+wqDC
oMKgID7CoMKgICvCoCBhc3BlZWQsY2xvY2stZGl2aWRlcjoKPiDCoMKgwqAgPsKgwqAgPsKgwqDC
oCA+wqDCoCArwqDCoMKgIGRlc2NyaXB0aW9uOgo+IMKgwqDCoCA+wqDCoCA+wqDCoMKgID7CoMKg
ICvCoMKgwqDCoMKgIFRoaXMgdmFsdWUgZGV0ZXJtaW5lcyBQRUNJIGNvbnRyb2xsZXIgaW50ZXJu
YWwgY2xvY2sKPiBkaXZpZGluZwo+IMKgwqDCoCA+wqDCoCA+wqDCoMKgID7CoMKgICvCoMKgwqDC
oMKgIHJhdGUuIFRoZSBkaXZpZGVyIHdpbGwgYmUgY2FsY3VsYXRlZCBhcyAyIHJhaXNlZCB0bwo+
IHRoZSBwb3dlciBvZgo+IMKgwqDCoCA+wqDCoCA+wqDCoMKgID7CoMKgICvCoMKgwqDCoMKgIHRo
ZSBnaXZlbiB2YWx1ZS4KPiDCoMKgwqAgPsKgwqAgPsKgwqDCoCA+wqDCoCArwqDCoMKgICRyZWY6
IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgo+IMKgwqDCoCA+wqDCoCA+
wqDCoMKgID7CoMKgICvCoMKgwqAgbWluaW11bTogMAo+IMKgwqDCoCA+wqDCoCA+wqDCoMKgID7C
oMKgICvCoMKgwqAgbWF4aW11bTogNwo+IMKgwqDCoCA+wqDCoCA+wqDCoMKgID7CoMKgICvCoMKg
wqAgZGVmYXVsdDogMAo+IMKgwqDCoCA+wqDCoCA+wqDCoMKgID7CoMKgICsKPiDCoMKgwqAgPsKg
wqAgPsKgwqDCoCA+wqDCoCArwqAgYXNwZWVkLG1zZy10aW1pbmc6Cj4gwqDCoMKgID7CoMKgID7C
oMKgwqAgPsKgwqAgK8KgwqDCoCBkZXNjcmlwdGlvbjoKPiDCoMKgwqAgPsKgwqAgPsKgwqDCoCA+
wqDCoCArwqDCoMKgwqDCoCBNZXNzYWdlIHRpbWluZyBuZWdvdGlhdGlvbiBwZXJpb2QuIFRoaXMg
dmFsdWUgd2lsbAo+IGRldGVybWluZSB0aGUgcGVyaW9kCj4gwqDCoMKgID7CoMKgID7CoMKgwqAg
PsKgwqAgK8KgwqDCoMKgwqAgb2YgbWVzc2FnZSB0aW1pbmcgbmVnb3RpYXRpb24gdG8gYmUgaXNz
dWVkIGJ5IFBFQ0kKPiBjb250cm9sbGVyLiBUaGUgdW5pdAo+IMKgwqDCoCA+wqDCoCA+wqDCoMKg
ID7CoMKgICvCoMKgwqDCoMKgIG9mIHRoZSBwcm9ncmFtbWVkIHZhbHVlIGlzIGZvdXIgdGltZXMg
b2YgUEVDSSBjbG9jawo+IHBlcmlvZC4KPiDCoMKgwqAgPsKgwqAgPsKgwqDCoCA+wqDCoCArwqDC
oMKgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgo+IMKgwqDC
oCA+wqDCoCA+wqDCoMKgID7CoMKgICvCoMKgwqAgbWluaW11bTogMAo+IMKgwqDCoCA+wqDCoCA+
wqDCoMKgID7CoMKgICvCoMKgwqAgbWF4aW11bTogMjU1Cj4gwqDCoMKgID7CoMKgID7CoMKgwqAg
PsKgwqAgK8KgwqDCoCBkZWZhdWx0OiAxCj4gwqDCoMKgID7CoMKgID7CoMKgwqAgPsKgwqAgKwo+
IMKgwqDCoCA+wqDCoCA+wqDCoMKgID7CoMKgICvCoCBhc3BlZWQsYWRkci10aW1pbmc6Cj4gwqDC
oMKgID7CoMKgID7CoMKgwqAgPsKgwqAgK8KgwqDCoCBkZXNjcmlwdGlvbjoKPiDCoMKgwqAgPsKg
wqAgPsKgwqDCoCA+wqDCoCArwqDCoMKgwqDCoCBBZGRyZXNzIHRpbWluZyBuZWdvdGlhdGlvbiBw
ZXJpb2QuIFRoaXMgdmFsdWUgd2lsbAo+IGRldGVybWluZSB0aGUgcGVyaW9kCj4gwqDCoMKgID7C
oMKgID7CoMKgwqAgPsKgwqAgK8KgwqDCoMKgwqAgb2YgYWRkcmVzcyB0aW1pbmcgbmVnb3RpYXRp
b24gdG8gYmUgaXNzdWVkIGJ5IFBFQ0kKPiBjb250cm9sbGVyLiBUaGUgdW5pdAo+IMKgwqDCoCA+
wqDCoCA+wqDCoMKgID7CoMKgICvCoMKgwqDCoMKgIG9mIHRoZSBwcm9ncmFtbWVkIHZhbHVlIGlz
IGZvdXIgdGltZXMgb2YgUEVDSSBjbG9jawo+IHBlcmlvZC4KPiDCoMKgwqAgPsKgwqAgPsKgwqDC
oCA+wqDCoCArwqDCoMKgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3Vp
bnQzMgo+IMKgwqDCoCA+wqDCoCA+wqDCoMKgID7CoMKgICvCoMKgwqAgbWluaW11bTogMAo+IMKg
wqDCoCA+wqDCoCA+wqDCoMKgID7CoMKgICvCoMKgwqAgbWF4aW11bTogMjU1Cj4gwqDCoMKgID7C
oMKgID7CoMKgwqAgPsKgwqAgK8KgwqDCoCBkZWZhdWx0OiAxCj4gwqDCoMKgID7CoMKgID5JIHN1
Z2dlc3QgZGVsZXRpbmcgdGhlc2UgdGhyZWUgcHJvcGVydGllcyBhbmQgcmVwbGFjaW5nIHRoZW0g
d2l0aCB0aGUKPiBmb2xsb3dpbmcKPiDCoMKgwqAgPsKgwqAgPgo+IMKgwqDCoCA+wqDCoCA+YXNw
ZWVkLHBlY2ktYml0LXRpbWU6Cj4gwqDCoMKgID7CoMKgID7CoMKgwqDCoMKgwqDCoCBkZXNjcmlw
dGlvbjoKPiDCoMKgwqAgPsKgwqAgPsKgwqDCoMKgwqDCoMKgwqDCoCBUaGUgYml0IHRpbWUgZHJp
dmVuIGJ5IFBFQ0kgY29udHJvbGxlci4gVGhlIHVuaXQgb2YgdGhlCj4gdmFsdWUgaXMgSHouCj4g
wqDCoMKgID7CoMKgID7CoMKgwqAgbWluaW11bTogMjAwMAo+IMKgwqDCoCA+wqDCoCA+wqDCoMKg
IG1heGltdW06IDEwMDAwMDAKPiDCoMKgwqAgPsKgwqAgPgo+IMKgwqDCoCA+wqDCoCA+QW5kIHRo
ZSBkcml2ZXIgc2hvdWxkIHVzZSB0aGlzIHByb3BlcnR5IHRvIGNhY3VsYXRlIHRoZSBhcHByb3By
aWF0ZQo+IGNsb2NrLWRpdmlkZXIsCj4gwqDCoMKgID7CoMKgID5tc2ctdGltaW5nIGFuZCBhZGRy
LXRpbWluZywgaW5zdGVhZCBvZiBleHBvc2luZyBoYXJkd2FyZSByZWdpc3RlcnMgdG8KPiBkdHMu
Cj4gwqDCoMKgID7CoMKgID4KPiAKPiDCoMKgwqAgPsKgwqAgT3IgcGVyaGFwcyBqdXN0ICdidXMt
ZnJlcXVlbmN5JyBhIGxhIGkyYy1hc3BlZWQsIGdwaW8tYXNwZWVkLXNncGlvLAo+IGV0Yz8KPiAK
PiBJdCdzIGEgZ29vZCBpZGVhbCBmb3IgdGhlIGNvbnNpc3RlbmN5LgoKSWYgd2Ugd2FudCB0byBn
byB3aXRoIHBhc3NpbmcgZnJlcXVlbmN5IC0gSSB3b3VsZCBwcmVmZXIgdG8gZ28gd2l0aCAiY2xv
Y2stCmZyZXF1ZW5jeSIgYW5kIHVzZSBjbG9jayBmcmFtZXdvcmsgZm9yIGV4cG9zaW5nIGl0IHRv
IHBlY2ktYXNwZWVkIChhcyBJCm1lbnRpb25lZCBpbiByZXBseSB0byBwYXRjaCAwNSkuCgpXaGF0
IGRvIHlvdSB0aGluaz8KClRoYW5rcwotSXdvbmEKCj4gCj4gVGhhbmtzCj4gCj4gQmVzdCBSZWdh
cmRzLAo+IEJpbGx5IFRzYWkKPiAKPiAKCg==
