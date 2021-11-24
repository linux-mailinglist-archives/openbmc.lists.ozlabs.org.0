Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFA545CA52
	for <lists+openbmc@lfdr.de>; Wed, 24 Nov 2021 17:47:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hzn4N4lX7z3056
	for <lists+openbmc@lfdr.de>; Thu, 25 Nov 2021 03:47:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=kGYZE6rG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=kGYZE6rG; dkim-atps=neutral
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hzn3l4m63z2xtv;
 Thu, 25 Nov 2021 03:47:09 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="296123472"
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800"; d="scan'208";a="296123472"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2021 08:15:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800"; d="scan'208";a="457084650"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 24 Nov 2021 08:15:21 -0800
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 24 Nov 2021 08:15:20 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 24 Nov 2021 08:15:20 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 24 Nov 2021 08:15:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UW5Rki8ZVisyMuXpjD1qec/FiUKdop3gKZjRyYjPecyitueKFjhpS/tk3R7V2PHFp8WVdaSRtwnqibWTdB5/pOmlPfOG+w9Z/atNQBSzpB+DfiyaIwat2xEro2p/icw5Ph6SP1L42UauY9hsCCUik/NqZgk878yMurVcu286RL/YRnb5rp9KP5UvrbjiSoeSprAX66juHOe9MtX+WJOmo6dVmLOtL+1/L5qaWjAk9s+0PeEYALoAxc448zPFPZkT/l0IJw4/BSCYpKSNteArEaz3+LsyHJHD75oRRgehyDw2jkWNOMYl4BZu9FHNv2Ct5BSjFvgSlz+uieqg4zrIKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZojRiDTE8FBwd+PCVTqWXkp/4Ra2e74Keih8H6AFpnY=;
 b=bhNsTsJ+50GPUm5BlgYv9kfVFWO0dHp3ElHLiIGN7E0Kfc/voJGDPk1d6OwH+Cy0ZlnBnoHOVxbW03z7oV10P+Xlc2ohdjgWh0hvNtnzr9JkrIphbQesY5UwQrz7t7Vqi4MDwpPahHYOJkbyIfzXqLyXCmxLS+X2+J1umoU17+MSuNzeNWjfT8aou91ZAeR2RHuSI/CisX6UNcrWaUeXa9ZTVpuv70o/2v3LT86fqUQP1o3prOEm/PnqA/1WA5UJI3WSEY5dj8W/sFYG3XEEq1uiUlOfmlQ/lQ7iaJxbjFgaoHLFY9o3WefJjjk79m2ZVgllCbJtIoSQDB+F7EM4IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZojRiDTE8FBwd+PCVTqWXkp/4Ra2e74Keih8H6AFpnY=;
 b=kGYZE6rG5wvMMhloiwm7fhjDIcMmug5IPLKo9YT2of/JEJToo/5rQMTLl7EdD9vy4y/M+QK5P6MVBPaKkIfzRmalBGGxCcAYcKee8DwlT8zrOxqmkteEWKBr7cKA1hICh3fls5UWav2UbRXOHCetLvxjxEla1TzWSLM9koP1ArM=
Received: from PH7PR11MB5819.namprd11.prod.outlook.com (2603:10b6:510:13b::9)
 by PH0PR11MB4790.namprd11.prod.outlook.com (2603:10b6:510:40::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Wed, 24 Nov
 2021 16:15:17 +0000
Received: from PH7PR11MB5819.namprd11.prod.outlook.com
 ([fe80::3508:ff4c:362d:579c]) by PH7PR11MB5819.namprd11.prod.outlook.com
 ([fe80::3508:ff4c:362d:579c%5]) with mapi id 15.20.4669.016; Wed, 24 Nov 2021
 16:15:17 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>
Subject: Re: [PATCH v4 11/13] hwmon: peci: Add dimmtemp driver
Thread-Topic: [PATCH v4 11/13] hwmon: peci: Add dimmtemp driver
Thread-Index: AQHX4IKtrFknD397kUi+mCxbfFiYtKwS2+cA
Date: Wed, 24 Nov 2021 16:15:17 +0000
Message-ID: <f6fd690c7cf2019d20968e9b52741c99c259de7b.camel@intel.com>
References: <20211123155608.GA2258206@roeck-us.net>
In-Reply-To: <20211123155608.GA2258206@roeck-us.net>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-2.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d6f885e8-75ed-4aee-a5cb-08d9af659ac8
x-ms-traffictypediagnostic: PH0PR11MB4790:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr,ExtFwd
x-microsoft-antispam-prvs: <PH0PR11MB479094724729AFF05CFA1962EC619@PH0PR11MB4790.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f44252zk3pU7nnTGeLCMNmYKcRla07TDqMPrKV1LiGm6G0oUy2kOO8kBHa3MIDYKRIeZi25zm/zs6lRwi6jCxoNChJNAEiTook7nBMv95zk22fnknLgvhjW1IoanpTAd65ovf9ybEIo/DdFCXNd6VNDEYUzsF8QlLUkQaBSbBX2SjWriDhu7HBoEGPmzQo2W0DRJb34bcJ+KTK52O3DRvg/jdWaX+yOT9gyVKpW/K/QWtKD6c8xs0p4+SgNtf2/UiW22nA/x6z+M2n7ITrjomeMjO4nb9m4oB9yp3TS4LFNwrkEBK0t0j6PcQnBNXJLZvz8KdnGxR3HMjF7I6N3xLNMhWvRUBQuWgHmd3r4ETZvFbmRvsD8ofW3N0iHBPaHFlU74M1ZXkaeLMFoS3+rErBscwiE20oKzQIuzeTc2rrbweQ7OnqHiIo57r8NRa8hOKQT5/mOXHU+1LZrERyd7FwqFAef8+28+cT6J72WcxECw4JnAtLwncAL9MQe29ZJ3ZZbBoszIecCZcPbuJ16IpqJ4oTxSB9rDThQtJ8+2XU0d8WEi4cxQtyjVfM//NM8pJhdVU34dHYZOdafaDLHJ/rDztkmrKSJggUwz4L8oXBediMt0QaJWgNYW5MGpBZ4ORpVQsH6yIDMhNYe6Rr+QqdAh9yIM7yEn/5oyfRHacRNddD/YkV3D49M/zs0c++OBH57eI3qPwqWf3VHqkv8kZw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5819.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(6506007)(7416002)(36756003)(71200400001)(76116006)(82960400001)(6512007)(38070700005)(66476007)(8676002)(66446008)(66946007)(5660300002)(122000001)(2616005)(4001150100001)(66556008)(508600001)(86362001)(2906002)(64756008)(6486002)(26005)(4326008)(186003)(83380400001)(8936002)(38100700002)(6916009)(91956017)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VlhWRzA4ZUdTWExSZlAyRUIvSml2WG9yZWhuTVFhbFJKNVQ1UDJhSFRIZDBL?=
 =?utf-8?B?V3A2TGIreXI3bGkzU0duMnAyeC94QXZTRG51QWtVV2M0Wk5zaU13c2VCV1Jl?=
 =?utf-8?B?Vlk4bUFLTTRibDVCbzlKYlFrRDVNTnBNZlZ1MkVyTDhVTnFzdFVDMnVuT212?=
 =?utf-8?B?QUpQU1F0b2liQXAvVGo2clp5MjFkN3FhVzJGbTJta21mMUd0a3J2QnZSSTB0?=
 =?utf-8?B?cVVEQWtKOUhpZDhTMjkrenBNV2NZMndzRmcremlRcXBjYjR3QXZsMDdDK3Ji?=
 =?utf-8?B?YXEwQlRVYnlpT0JPaTJGM2dsN2FIM2Z0Wmc1VW40TUkzS01ydTVKS2Nzancr?=
 =?utf-8?B?c1kwbWs0WHpkZFI3bTAxTXgzdW9EckxMTFVXSDNEcUYyVHlwbTFFK25pUWNF?=
 =?utf-8?B?S3JKaCtuZDlPRUdRUWRtdU10YTZrdndNMW11SmxwOEdGZHdvZ1lCZ0RHbWFV?=
 =?utf-8?B?YXV5RDgwVXFrNmNiSFFiWUpGNXN3MFRDdGx1VnBLVE9KRnNweWlVT1pZdy9L?=
 =?utf-8?B?Q0RiVkpLaVNEb0dselpVOFhVNnhwb2J2cUp2N3U2TmE5aFdMQ0IvcFIxNlJ3?=
 =?utf-8?B?U2hKa2RwemdQWlZRSlVOOW10TE9XWWx0ZmRWRmFjUFU0alIwMHZjenM5U2pD?=
 =?utf-8?B?dUE1aEM3MEVVaXZKTXJhbXBrVUpVVmk1bXZXUC9TOGpudkgxRGtkaUQvMGl3?=
 =?utf-8?B?T3hhajVHMnQyVjczMytiYkQwTXlYZVhRbnlMcEIwL2JGN05pOXNadG4yOEZy?=
 =?utf-8?B?NlZWMEpSa1ZWWVFLS2Q3eTF1MmFZeHlIVlVJbkpDSGkzTUE4SmpvUzZBbXFW?=
 =?utf-8?B?M2xHaDdsZzY1c0lvSWM2RWFLNDU3cWg0Y091TkNBbzE2RDJQZUxLcGJjQWh2?=
 =?utf-8?B?MmQ1QXJZZmNrUnNONm1RTFZpbEc2WDJhQVdLS2pqdDVrejlIRmFIMjdJM0x4?=
 =?utf-8?B?b0x0d0V5MHFnNERDVjZVaGRIQjhRVmp3NkFyYS9TeUlrVzN5aytmVFRaeGlu?=
 =?utf-8?B?RUx3aVpMSmVpUHhuZXliaGR6USttSUdZOUdjUjV1NVRlRHE4YllwRHVtSFdx?=
 =?utf-8?B?aXRRb3dNK2p1NC9Rd2d6MGxjVFUxcitna1Vwbnh3dVYvV2xHT1p0dmo1ME5w?=
 =?utf-8?B?Q2JrbTFmWHZNSFN3S3o3NVlZYndDSmVmY3VsTldPaU5XakUrdyt3Z2xsNG1X?=
 =?utf-8?B?SmhoTHVzRUNpRXdmRjFVY0dQekdIZEpYdFFNYTBQRU0wT3BGNldqQ2lVcExG?=
 =?utf-8?B?c0ZGU0wycjVmS212TVptMG5TQTFJVmNld1o2QVF5cHFBSlF1eU5UNEt4NFpY?=
 =?utf-8?B?bmZ2MDB4ZTU4SnBVRXJvVEc4Sm44Mmh0emxKc0gyT29TSTVCU1JqM1NhVlBx?=
 =?utf-8?B?YTBRaDZLclFxZitNTkdWMVlBb2tVYTJPZG5YbDZZei9hZ1MvNWowOXVIRnk1?=
 =?utf-8?B?bmR6enFJaGNWVUVCWERWcVlrY1ZHUUJxT3MzTDNFUzNWaTFBUk5YYit0K0Zv?=
 =?utf-8?B?QXgxU09MRlUyS0lVeUxLbmJFbFMrcUJNOTY3NUlHYlc0dmo0T1NzRXE5UVBF?=
 =?utf-8?B?RjRZbjNsWElOd2o5b1liVS9LM2VYcXNUOVZsS1ZpczhOTVFTOU0zOXk3ZUk0?=
 =?utf-8?B?ekxQYzNoNS95T3hZSVF0WnBZN0trK2ExbFdVUko2NFVMNHppZGttR1NyUWRs?=
 =?utf-8?B?T2hQbHVhZnRKODcxZy9mMExaNDBaZEg3RkRuYS9MOHBUZEhWUEI3UDNQcnpB?=
 =?utf-8?B?K1c5MXEraWx6ZjVZa0dnQTJjWTYwTlhkb2hSalJ5RnBoMXZabHBNSGEzODZz?=
 =?utf-8?B?Tk5pVXBHSmF3NTJ5anVFMGpVTEtQdk1tckt6YXNoWG5DMmh0amI3aE1jcnlv?=
 =?utf-8?B?ZDFGV1NIYVBuZ28zaWg2U3VGcGlDVzFhZWE5SzdhK21FUmJkaGE1a3FGdVp4?=
 =?utf-8?B?Yk94Nkh0NGx3YUpUVElaWmc1ZXByTWJNSy9jOFBGeWdwRHlNVGplM2FUREJU?=
 =?utf-8?B?SmU1djZRTTdpczNLZnkrTU1CUWo2NFRoWXZQVERPVlpNeFhHd2lIVXdhZkU3?=
 =?utf-8?B?eWR4aUoxelNJZHlybDdXZVZqeFQxaFMrekpyMDIzTTZrdXpXWXNDSEJWOU1x?=
 =?utf-8?B?cTFpdVo2S05kNmdOWGh2UStiSTZnRE5NbkpHNXY2dzRqVVc4L3IveWpKOHBq?=
 =?utf-8?B?Sk9NdGJTcXdTWEZoS2ZCdkRibXV2OFRkNlJSSFFNWDlBNmVkc1E4ZW4vSnB0?=
 =?utf-8?Q?JAcPQEV451817+sl8GTLjuo0W6c+15Sa1GP01lzrXw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <36E82C26FADFBC4D8FB7FEE0379193AF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5819.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6f885e8-75ed-4aee-a5cb-08d9af659ac8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2021 16:15:17.1421 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A3iSeYmt4/DGclwuaiGVXQzPlt3Ke7+8zvIMELp/MZGVmsGwXkGxsbRKtWtxFxybt1QeyzrAAFA/W6uGxWWfC7TL1zS/z7ql8+gDmv7Z72c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4790
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
 Dave" <dave.hansen@intel.com>, "zweiss@equinix.com" <zweiss@equinix.com>,
 "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
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

T24gVHVlLCAyMDIxLTExLTIzIGF0IDA3OjU2IC0wODAwLCBHdWVudGVyIFJvZWNrIHdyb3RlOgo+
IE9uIFR1ZSwgTm92IDIzLCAyMDIxIGF0IDAzOjA3OjA0UE0gKzAxMDAsIEl3b25hIFdpbmlhcnNr
YSB3cm90ZToKPiA+IEFkZCBwZWNpLWRpbW10ZW1wIGRyaXZlciBmb3IgVGVtcGVyYXR1cmUgU2Vu
c29yIG9uIERJTU0gcmVhZGluZ3MgdGhhdAo+ID4gYXJlIGFjY2Vzc2libGUgdmlhIHRoZSBwcm9j
ZXNzb3IgUEVDSSBpbnRlcmZhY2UuCj4gPiAKPiA+IFRoZSBtYWluIHVzZSBjYXNlIGZvciB0aGUg
ZHJpdmVyIChhbmQgUEVDSSBpbnRlcmZhY2UpIGlzIG91dC1vZi1iYW5kCj4gPiBtYW5hZ2VtZW50
LCB3aGVyZSB3ZSdyZSBhYmxlIHRvIG9idGFpbiB0aGVybWFsIHJlYWRpbmdzIGZyb20gYW4gZXh0
ZXJuYWwKPiA+IGVudGl0eSBjb25uZWN0ZWQgd2l0aCBQRUNJLCBlLmcuIEJNQyBvbiBzZXJ2ZXIg
cGxhdGZvcm1zLgo+ID4gCj4gPiBDby1kZXZlbG9wZWQtYnk6IEphZSBIeXVuIFlvbyA8amFlLmh5
dW4ueW9vQGxpbnV4LmludGVsLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEphZSBIeXVuIFlvbyA8
amFlLmh5dW4ueW9vQGxpbnV4LmludGVsLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEl3b25hIFdp
bmlhcnNrYSA8aXdvbmEud2luaWFyc2thQGludGVsLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBQaWVy
cmUtTG91aXMgQm9zc2FydCA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tPgo+
ID4gLS0tCj4gCj4gWyAuLi4gXQo+IAo+ID4gK3N0YXRpYyBpbnQgY2hlY2tfcG9wdWxhdGVkX2Rp
bW1zKHN0cnVjdCBwZWNpX2RpbW10ZW1wICpwcml2KQo+ID4gK3sKPiA+ICvCoMKgwqDCoMKgwqDC
oGludCBjaGFuX3JhbmtfbWF4ID0gcHJpdi0+Z2VuX2luZm8tPmNoYW5fcmFua19tYXg7Cj4gPiAr
wqDCoMKgwqDCoMKgwqBpbnQgZGltbV9pZHhfbWF4ID0gcHJpdi0+Z2VuX2luZm8tPmRpbW1faWR4
X21heDsKPiA+ICvCoMKgwqDCoMKgwqDCoHUzMiBjaGFuX3JhbmtfZW1wdHkgPSAwOwo+ID4gK8Kg
wqDCoMKgwqDCoMKgdTY0IGRpbW1fbWFzayA9IDA7Cj4gPiArwqDCoMKgwqDCoMKgwqBpbnQgY2hh
bl9yYW5rLCBkaW1tX2lkeCwgcmV0Owo+ID4gK8KgwqDCoMKgwqDCoMKgdTMyIHBjczsKPiA+ICsK
PiA+ICvCoMKgwqDCoMKgwqDCoEJVSUxEX0JVR19PTihCSVRTX1BFUl9UWVBFKGNoYW5fcmFua19l
bXB0eSkgPCBDSEFOX1JBTktfTUFYKTsKPiA+ICvCoMKgwqDCoMKgwqDCoEJVSUxEX0JVR19PTihC
SVRTX1BFUl9UWVBFKGRpbW1fbWFzaykgPCBESU1NX05VTVNfTUFYKTsKPiA+ICvCoMKgwqDCoMKg
wqDCoGlmIChjaGFuX3JhbmtfbWF4ICogZGltbV9pZHhfbWF4ID4gRElNTV9OVU1TX01BWCkgewo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFdBUk5fT05DRSgxLCAiVW5zdXBwb3J0
ZWQgbnVtYmVyIG9mIERJTU1zIC0gY2hhbl9yYW5rX21heDoKPiA+ICVkLCBkaW1tX2lkeF9tYXg6
ICVkIiwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgY2hhbl9yYW5rX21heCwgZGltbV9pZHhfbWF4KTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqByZXR1cm4gLUVJTlZBTDsKPiA+ICvCoMKgwqDCoMKgwqDCoH0KPiA+ICsKPiA+
ICvCoMKgwqDCoMKgwqDCoGZvciAoY2hhbl9yYW5rID0gMDsgY2hhbl9yYW5rIDwgY2hhbl9yYW5r
X21heDsgY2hhbl9yYW5rKyspIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBy
ZXQgPSBwZWNpX3Bjc19yZWFkKHByaXYtPnBlY2lfZGV2LCBQRUNJX1BDU19ERFJfRElNTV9URU1Q
LAo+ID4gY2hhbl9yYW5rLCAmcGNzKTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBpZiAocmV0KSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoC8qCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAqIE92ZXJhbGwsIHdlIGV4cGVjdCBlaXRoZXIgc3VjY2VzcyBvciAtRUlOVkFMIGluCj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIG9yZGVy
IHRvIGRldGVybWluZSB3aGV0aGVyIERJTU0gaXMgcG9wdWxhdGVkIG9yCj4gPiBub3QuCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIEZvciBhbnl0
aGluZyBlbHNlIHdlIGZhbGwgYmFjayB0byBkZWZlcnJpbmcgdGhlCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIGRldGVjdGlvbiB0byBiZSBwZXJm
b3JtZWQgYXQgYSBsYXRlciBwb2ludCBpbgo+ID4gdGltZS4KPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICovCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChyZXQgPT0gLUVJTlZBTCkgewo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgY2hhbl9yYW5rX2VtcHR5IHw9IEJJVChjaGFuX3JhbmspOwo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY29udGludWU7
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiA+
ICsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0
dXJuIC1FQUdBSU47Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+ID4gKwo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZvciAoZGltbV9pZHggPSAwOyBkaW1t
X2lkeCA8IGRpbW1faWR4X21heDsgZGltbV9pZHgrKykKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKF9fZGltbV90ZW1wKHBjcywgZGltbV9pZHgp
KQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgZGltbV9tYXNrIHw9IEJJVChjaGFuX3JhbmsgKiBkaW1tX2lkeF9tYXggKwo+
ID4gZGltbV9pZHgpOwo+ID4gK8KgwqDCoMKgwqDCoMKgfQo+ID4gKwo+ID4gK8KgwqDCoMKgwqDC
oMKgLyoKPiA+ICvCoMKgwqDCoMKgwqDCoCAqIElmIHdlIGdvdCBhbGwgLUVJTlZBTHMsIGl0IG1l
YW5zIHRoYXQgdGhlIENQVSBkb2Vzbid0IGhhdmUgYW55Cj4gPiArwqDCoMKgwqDCoMKgwqAgKiBE
SU1Ncy4gVW5mb3J0dW5hdGVseSwgaXQgbWF5IGFsc28gaGFwcGVuIGF0IHRoZSB2ZXJ5IHN0YXJ0
IG9mCj4gPiArwqDCoMKgwqDCoMKgwqAgKiBob3N0IHBsYXRmb3JtIGJvb3QuIFJldHJ5aW5nIGEg
Y291cGxlIG9mIHRpbWVzIGxldHMgdXMgbWFrZSBzdXJlCj4gPiArwqDCoMKgwqDCoMKgwqAgKiB0
aGF0IHRoZSBzdGF0ZSBpcyBwZXJzaXN0ZW50Lgo+ID4gK8KgwqDCoMKgwqDCoMKgICovCj4gPiAr
wqDCoMKgwqDCoMKgwqBpZiAoY2hhbl9yYW5rX2VtcHR5ID09IEdFTk1BU0soY2hhbl9yYW5rX21h
eCAtIDEsIDApKSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHByaXYt
Pm5vX2RpbW1fcmV0cnlfY291bnQgPCBOT19ESU1NX1JFVFJZX0NPVU5UX01BWCkgewo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwcml2LT5ub19kaW1t
X3JldHJ5X2NvdW50Kys7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRUFHQUlOOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoH0gZWxzZSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHJldHVybiAtRU5PREVWOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoH0KPiAKPiBTdGF0aWMgYW5hbHl6ZXJzIHdpbGwgY29tcGxhaW4gImVsc2UgYWZ0ZXIg
cmV0dXJuIGlzIHVubmVjZXNzYXJ5Ii4KCkknbGwgZml4IHRoaXMgaW4gdjUuCgpUaGFua3MKLUl3
b25hCgo+IAo+IEd1ZW50ZXIKCg==
