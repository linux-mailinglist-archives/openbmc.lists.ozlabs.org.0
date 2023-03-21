Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 142B36C2DA0
	for <lists+openbmc@lfdr.de>; Tue, 21 Mar 2023 10:09:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pgm4Z6BLDz3cD2
	for <lists+openbmc@lfdr.de>; Tue, 21 Mar 2023 20:09:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VVNNsGqj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VVNNsGqj;
	dkim-atps=neutral
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pgm3v4Fnbz2xHH;
	Tue, 21 Mar 2023 20:08:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679389707; x=1710925707;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Lc687E44DzKLHTqlEfNMEsPi3T3gEhxV7e3O1NnCOjo=;
  b=VVNNsGqjBv+wzCgXAYq/EY6mDoB1HZ3En4iLVdPoSyiu99Gs8LvWOJR1
   jPTdsO79ew+rvUBD0+axgHuYBbd0g9uPtLVRbaUuFOANXQNhJzE6LLjER
   Lr239LM/8+F0rJcQrujDXwDOy79mECB2ZQzP/1G8AlFwx1A0Or8Ei3pQo
   2jgR+U96pfcJAhD8NgsFc4AowPJw+wRT+VkaYtrU/MQb8KByVoAKnUNzp
   EmLoQMGOQvfqiriht5PfuaR0XfRs8SvYBwKRdunSp+7C+tD00gIoBOZTK
   +mPvgOaVEoh+JcKTl7b1W/Kj7BZphPVts5S/KwoDRlieQmqrCheBxm9kN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="401458714"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="401458714"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 02:08:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="770554689"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="770554689"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Mar 2023 02:08:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 02:08:21 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 21 Mar 2023 02:08:21 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 21 Mar 2023 02:08:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KxLAkd3d1j4h0FqFeCIk4TGBGOfuJhXQL4ysku9Ga7/pl0niVdmBiL0O4It+3uYksROqOUYdP69yfUEntSMCtgiSl9BQeCK8uS4zBsMrU8Sb+mWxy1OiUcMzHbJCXUOxCFkH1cOuNV7IUCfAtR/Fz9O2o1EDm8R1uuSHjkxeL525hyR5my1w6v2bkRrDJNy8aixjQhdMMRui2RgAM8FzoKaHp2YUzZAAIMZWoiJcltovVYSUOM/ZGpPQvgGW/5qOhcw6iXBDBSzxBdVQvhwbewYbSFhrfY66sVuVUPngdq+tfOGMEZdP4kmU9BWPQ4t82czXPgw/C4Q9AXEJbO8Uqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lc687E44DzKLHTqlEfNMEsPi3T3gEhxV7e3O1NnCOjo=;
 b=CYc1f35a+mKjagWTACUD905BPlrvoDxz3g/Ajz2+rxZoSOizsG/MqYUEbk6lmVkYh6CxRtbY2Ghmmf6Y6Eut0vrM6jwtQwzwOjMETZWvU+ZG0etpQPUow5JNg1Ng++0RCEg56VZnvUUuLopR3Vwr4ha/Up9NAseqlSV+rxvByb3qx5jqBACzJCv5tQlkR8Sbo1KGKD58peJN+bGjXTF25P5LqEEgLFFKrcnbPWM9TYIK4U+qi/RD89uTsuMs2KtmEQEnsKJZN/2IFbM5PJHwKZpyuPy2E/IQZR+QT4MWP7Qj7NHtbH0KgnkKPBJDknLf8d+yVoxAZSRDvolcwrS2ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by SA3PR11MB8076.namprd11.prod.outlook.com (2603:10b6:806:2f0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 09:08:16 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::1181:71b3:9254:ea83]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::1181:71b3:9254:ea83%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 09:08:16 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "fercerpav@gmail.com" <fercerpav@gmail.com>
Subject: Re: [PATCH v8 10/13] hwmon: peci: Add cputemp driver
Thread-Topic: [PATCH v8 10/13] hwmon: peci: Add cputemp driver
Thread-Index: AQHZWyF+dsGL5g1aG0yFYRXx28vYKq8E8xGA
Date: Tue, 21 Mar 2023 09:08:16 +0000
Message-ID: <35aff70623a156ebe39106db26a443659de2ef79.camel@intel.com>
References: <20220208153639.255278-1-iwona.winiarska@intel.com>
	 <20220208153639.255278-11-iwona.winiarska@intel.com>
	 <ZBhHS7v+98NK56is@home.paul.comp>
In-Reply-To: <ZBhHS7v+98NK56is@home.paul.comp>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.3 (3.46.3-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5823:EE_|SA3PR11MB8076:EE_
x-ms-office365-filtering-correlation-id: c3b11b9e-5896-427f-3a25-08db29ebce92
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +KNCxHTnKU+3unIsLiITrWTxey3KjsjX/uwt9cGqQr1OV7Enac0YLY9G3YCifXZz0hg8CuC3p2amcT4J7qZsyOSXDvPez5nYvMBOhhFFrmxOcHwb7vZd1MYVzmQedic2t7rh8qNDtBR2m3f7Wf4MIboUtVeJ5j5eUV6nDD7m/RifAzgB+VUBhXjLJjkpXQ6LKuer+7THIhs3T768LOCqr4ddWecsFBEgy81HKDKMhYytZjZhOckSMGYbKp8vjU6UBKGzIhA6yIbq43fEIPWemLKHCVHjoi6FnC4DoDCHPABtzsDZ0YOl4gna31gPpUXQtPdkTiuOPd/p+47XIegZhNAGcW3erAxDIQzuOyz6DTHK2EPdt+3gmwn0U0OHn+JNGidgxofjCDxzDgfQAuURWN5vsDRBZnF7tOSNrZ33cmz6zep2kogi5fjndEkX3FlXWaY+I2Ld/BlZvLf8ziGQU7/uIxJKN18wH1xfKeQWpWQ/Vn9GwB/AYGHGRnOdFe3pDA05l/5rL+zt0/u/mRgGL0Nma6yRBq+AvnpEHUlW7vt62buI3sfdGhbDMV6jrAFVKeybonY5LDqvDGFtw/99Hm1GiqDFMzj2bCFhXwvKEYassA8FLe08N9Cgx/ycbxhcBrmJPzC+82XlG9OLHhME0ughFjEn1ulf17ceNZbWk0Ya5RDmKy/xUPucIQVX4L6UWqAMkICvExJIIh1cHU2wZbfxJ5lrbhDSFcRIOQ5lS0Y=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5823.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(136003)(39860400002)(396003)(366004)(451199018)(6506007)(186003)(6512007)(26005)(71200400001)(6486002)(966005)(2616005)(83380400001)(316002)(478600001)(54906003)(8676002)(4326008)(66946007)(6916009)(64756008)(66446008)(66476007)(66556008)(76116006)(8936002)(91956017)(41300700001)(38070700005)(36756003)(5660300002)(82960400001)(7416002)(2906002)(38100700002)(122000001)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NzluVjlGRjc1WEd3MWRvajIzSWZMa0dremdMZGk3SEk2QjhFMjRHSTZOeDhi?=
 =?utf-8?B?emxXVDlCOE9pQXBTK1kwcXdTVHU3RjZxNnI2VVp1Q2pnbTU5NkRPSWZ1RnlB?=
 =?utf-8?B?bExwZUJjeEdsWnhYTXRpT0tnSEhJY3doVThNR0k3N1YvdFZPU1NDSlZlQ1FH?=
 =?utf-8?B?a2pJS2JFVEkwUG1rNDF2ZDFFdnVuOHVlSGFMcUF0Y3hLTUNDdC9qZ1RVUkNH?=
 =?utf-8?B?c2lDakt3SDB5UzNnSmtnb1BtOE5VcUhWSStjQ0toa2o3aDhJNHM1c0pEbzRD?=
 =?utf-8?B?QjdOalBtYXVIQThIcEtPUk9IMDl4Yit2N3FwVmpxdDhFMVRWcG4zbVU4ZG1P?=
 =?utf-8?B?REFaa0FRdG1taXlqYjNOblp6TmZQSGZIRUlNY0U0VnkweXFGd3dQRnd6MzY0?=
 =?utf-8?B?R0ZmUXRHNzNqT3g0ZzQ4azlyN1pCb2c1YlJZRkZaR0c1SzRENEx6Q1F0aEFV?=
 =?utf-8?B?VEdSRStTRlRJcWQ0MmtBaXl6Q0Q4ejd4cW9MblhvaWdQTnpmUStrdkN3N0Uz?=
 =?utf-8?B?L2lISnkralJYZzVFVnJZK2ZPZy9JbTBncGhjV3M0L1NCTk9NeW8xc0pyUUxh?=
 =?utf-8?B?VVdYY2JjMCtOVDMycUpNNVpFbjBsQXFVYllUUmI2RnJQL0RobWV2djgwRzBQ?=
 =?utf-8?B?R0RoOFlwc0lKemxBNi9lZG1MZWZYSlNBNGc1VGgyYm1rTTFGbXRLZHBSM05r?=
 =?utf-8?B?ZjNYRDUyNmFCUlYyNEFsdVFBL0xCZnk1V0Q1RVJlRWxMbExWbHp4T082blBi?=
 =?utf-8?B?dE5YR0RjYlk0cFR3VUNaWlM1Z3NjSWVVVjEzdHcyVUJFL1NZOWovMDlLSXZI?=
 =?utf-8?B?MHZ0ViszdjJmRExua25VUWFOTmhZelgycGhKZHVOYlFsV2IybUsxYmFQVWNL?=
 =?utf-8?B?VVhtK2k0bzhaZG5XSE5jSGxPaG54Q0d4UlJPM2h6NlNlaGxYNDk5TWJ3Z0hY?=
 =?utf-8?B?dXdReTg2elg4OE14Y2lwK0IwVXhrb2hTTk1ZQTVQUXlXZGJoMm8zV1dadzhJ?=
 =?utf-8?B?aExZeHA5aXp5aEFXVUhCWlhoQzZsVDQwNEc0NjFqM25paHRGdzdNc0Rud1Za?=
 =?utf-8?B?UXMxYWtOYTAwMTQxOHBWU09mUWNHaW42VW01aHQ0UC9vUGVKeEdZdjhmZm82?=
 =?utf-8?B?TjQ3VnpBeXRVUkRIUWFWMWJ4b1UxMzdzM2lEUzJWRXc3Z09XUmlYZllYOE5E?=
 =?utf-8?B?WFREbkxjUDBXUG1EM1RrYzY0eG9pdnh6Z0dMSktCTU9hSjdjTFhtVk14dlo5?=
 =?utf-8?B?S0puTGN1VUdLTzAxemZVVEFEY2Y1dTNEVE4rN0QzaHdGNnJ2Q1UxWjN1aXNn?=
 =?utf-8?B?Z25iMDdxWlZ5UDdzV2dNOFBod0NwaG01WTVYUzJNWGd1VWh6Z0pST2NNRW5M?=
 =?utf-8?B?NXVHbmVJR3pYM2orUzZyeGNqZXRMOGJuODJtVlFzOTVQb1A4TUhnbFM5a2pK?=
 =?utf-8?B?VlNOd2RyOWJLU1IrTUpCMTJiTFhjczh1R3E5c09pQWxJbFd3akJIN2R6b0Uz?=
 =?utf-8?B?RjZOMXRIMVpMZ05rVlZjY3gwMVJRQkQ5MmxsTmE3SHRZdllwc3NSc0lzaEtP?=
 =?utf-8?B?L2wzQU0zUldqRjh3eEFUNnN4amFKN3JKeGFPYTYzNzdINDV2eEpsdVovTkZa?=
 =?utf-8?B?MzJwY0tCRFFRWGJRYmttSjY4aEJ1bTJZcFA0RndyNzc5T1Z2YXhTWjkvVmJM?=
 =?utf-8?B?OU5KTnM3MzBLV1RuS3BoaUd5WkN4a2JiVGNhd0haMEIvV0Z1enE1dkQrQTRt?=
 =?utf-8?B?ZEkxMEpoSTBrWWZRN3pQcWdkbEo2YUF5dWZYcmNCZGFnRlBRUEkxeTd3a2t3?=
 =?utf-8?B?Q1NCWlRSQTVPWFFMdVlxbGJBUllIUGtrZXVVYU9tQUlJbmM4T1pOcWxSUEoz?=
 =?utf-8?B?MCtnM3MvTVV3TDV0RVcrVExpYlZDZjdzaWtxcURZQ2xiN3h2dTBlSk9XNXNS?=
 =?utf-8?B?UHhFYUtlbkNMTUY0KzZUWklzbmgxUVljTXZKaE1VUUdleTFhbTQvZHZFeUJC?=
 =?utf-8?B?TDRpSG1mbHZKQThnUjdxdmErd0k4SzlUeEtIQkFoOWNiYXpQaUJvWFNGb013?=
 =?utf-8?B?dFMybDkrRjd6YnN0VGdwS0pVYjQrbVFLU21MQUFDdDNuRnkxWlpzMTdnVmE0?=
 =?utf-8?B?R2VPV2ltTWVSTEZ3ZEVKRFRYdUxjcmNYQlpZcUtpSGpoWmtZalBhS0ZWL0JL?=
 =?utf-8?Q?upo2W6Yk7SMq6Jtw4AHFv/Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <324599D343455F4599F99715E9F705A1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b11b9e-5896-427f-3a25-08db29ebce92
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2023 09:08:16.2331
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5N/VxYM2yhzaIKgdCW8OuObFxckbBJ+ZJGRJsXtiq7OBaON1p/o18FD5szlbHB6jaaZ7d+us6vph27/0eF8aXn+eO+0FGT9JMJQEDakX9/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8076
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "Hansen, Dave" <dave.hansen@intel.com>, "Weiss, Zev" <zweiss@equinix.com>, "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>, "corbet@lwn.net" <corbet@lwn.net>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>, "linux@roeck-us.net" <linux@roeck-us.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "jdelvare@suse.com" <jdelvare@suse.com>, "arnd@arndb.de" <arnd@arndb.de>, "billy_tsai@aspeedtech.com" <billy_tsai@aspeedtech.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "bp@alien8.de" <bp@alien8.de>, "Williams, Dan J" <dan.j.williams@intel.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
  "Luck,
 Tony" <tony.luck@intel.com>, "andrew@aj.id.au" <andrew@aj.id.au>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "rdunlap@infradead.org" <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "olof@lixom.net" <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gTW9uLCAyMDIzLTAzLTIwIGF0IDE0OjQ1ICswMzAwLCBQYXVsIEZlcnRzZXIgd3JvdGU6DQo+
IEhlbGxvLA0KPiANCj4gV2UgYXJlIHNlZWluZyB3cm9uZyBEVFMgdGVtcGVyYXR1cmVzIG9uIGF0
IGxlYXN0ICJJbnRlbChSKSBYZW9uKFIpDQo+IEJyb256ZSAzMjA0IENQVSBAIDEuOTBHSHoiIGFu
ZCBtb3N0IHByb2JhYmx5IG90aGVyIFNreWxha2UgWGVvbiBDUFVzDQo+IGFyZSBhbHNvIGFmZmVj
dGVkLCBzZWUgaW5saW5lLg0KPiANCj4gT24gVHVlLCBGZWIgMDgsIDIwMjIgYXQgMDQ6MzY6MzZQ
TSArMDEwMCwgSXdvbmEgV2luaWFyc2thIHdyb3RlOg0KPiA+IEFkZCBwZWNpLWNwdXRlbXAgZHJp
dmVyIGZvciBEaWdpdGFsIFRoZXJtYWwgU2Vuc29yIChEVFMpIHRoZXJtYWwNCj4gPiByZWFkaW5n
cyBvZiB0aGUgcHJvY2Vzc29yIHBhY2thZ2UgYW5kIHByb2Nlc3NvciBjb3JlcyB0aGF0IGFyZQ0K
PiA+IGFjY2Vzc2libGUgdmlhIHRoZSBQRUNJIGludGVyZmFjZS4NCj4gLi4uDQo+ID4gK3N0YXRp
YyBjb25zdCBzdHJ1Y3QgY3B1X2luZm8gY3B1X2hzeCA9IHsNCj4gPiArwqDCoMKgwqDCoMKgwqAu
cmVnwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgPSAmcmVzb2x2ZWRfY29yZXNfcmVnX2hzeCwNCj4g
PiArwqDCoMKgwqDCoMKgwqAubWluX3BlY2lfcmV2aXNpb24gPSAweDMzLA0KPiA+ICvCoMKgwqDC
oMKgwqDCoC50aGVybWFsX21hcmdpbl90b19taWxsaWRlZ3JlZSA9DQo+ID4gJmR0c19laWdodF9k
b3RfZWlnaHRfdG9fbWlsbGlkZWdyZWUsDQo+ID4gK307DQo+ID4gKw0KPiA+ICtzdGF0aWMgY29u
c3Qgc3RydWN0IGNwdV9pbmZvIGNwdV9pY3ggPSB7DQo+ID4gK8KgwqDCoMKgwqDCoMKgLnJlZ8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoD0gJnJlc29sdmVkX2NvcmVzX3JlZ19pY3gsDQo+ID4gK8Kg
wqDCoMKgwqDCoMKgLm1pbl9wZWNpX3JldmlzaW9uID0gMHg0MCwNCj4gPiArwqDCoMKgwqDCoMKg
wqAudGhlcm1hbF9tYXJnaW5fdG9fbWlsbGlkZWdyZWUgPSAmZHRzX3Rlbl9kb3Rfc2l4X3RvX21p
bGxpZGVncmVlLA0KPiA+ICt9Ow0KPiAuLi4NCj4gPiArwqDCoMKgwqDCoMKgwqB7DQo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC5uYW1lID0gInBlY2lfY3B1LmNwdXRlbXAuc2t4
IiwNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLmRyaXZlcl9kYXRhID0gKGtl
cm5lbF91bG9uZ190KSZjcHVfaHN4LA0KPiA+ICvCoMKgwqDCoMKgwqDCoH0sDQo+IA0KPiBXaXRo
IHRoaXMgY29uZmlndXJhdGlvbiB3ZSBnZXQgdGhpcyBkYXRhOg0KPiANCj4gL3N5cy9idXMvcGVj
aS9kZXZpY2VzLzAtMzAvcGVjaV9jcHUuY3B1dGVtcC5za3guNDgvaHdtb24vaHdtb24xNSMgZ3Jl
cCAuDQo+IHRlbXBbMTIzXV97bGFiZWwsaW5wdXR9DQo+IHRlbXAxX2xhYmVsOkRpZQ0KPiB0ZW1w
Ml9sYWJlbDpEVFMNCj4gdGVtcDNfbGFiZWw6VGNvbnRyb2wNCj4gdGVtcDFfaW5wdXQ6MzA5MzgN
Cj4gdGVtcDJfaW5wdXQ6Njc3MzUNCj4gdGVtcDNfaW5wdXQ6ODAwMDANCj4gDQo+IE9uIHRoZSBo
b3N0IHN5c3RlbSAic2Vuc29ycyIgcmVwb3J0DQo+IA0KPiBQYWNrYWdlIGlkIDA6wqAgKzMxLkMg
KGhpZ2ggPSArODAuQywgY3JpdCA9ICs5MC5DKQ0KPiANCj4gU28gSSBjb25jbHVkZSBEaWUgdGVt
cGVyYXR1cmUgYXMgcmV0cmlldmVkIG92ZXIgUEVDSSBpcyBjb3JyZWN0IHdoaWxlDQo+IERUUyBp
cyBtaXMtY2FsY3VsYXRlZC4gVGhlIG9sZCBkb3duc3RyZWFtIGNvZGUgaW4gT3BlbkJNQyB3YXMg
dXNpbmcNCj4gdGVuX2RvdF9zaXhfdG9fbWlsbGlkZWdyZWUoKSBmdW5jdGlvbiBmb3IgY29udmVy
c2lvbiwgYW5kIHRoYXQgd2FzDQo+IHByb3ZpZGluZyBleHBlY3RlZCByZXN1bHRzLiBBbmQgaW5k
ZWVkIGlmIHdlIHJldmVyc2UgdGhlIGNhbGN1bGF0aW9uDQo+IGhlcmUgd2UgZ2V0IDgwMDAwIC0g
KCg4MDAwMC02NzczNSkgKiAyNTYgLyA2NCkgPSAzMDk0MCB3aGljaCBtYXRjaGVzDQo+IGV4cGVj
dGF0aW9ucy4NCj4gDQoNCkhpIQ0KDQpUaGFua3MgZm9yIHRoZSByZXBvcnQuDQoNCkl0IHdhcyBj
aGFuZ2VkIGJldHdlZW4gdjIgYW5kIHYzIGFmdGVyIGEgcmVwb3J0IGFib3V0IG5lZ2F0aXZlIHRl
bXBlcmF0dXJlIG9uDQpwcmUtSUNYIHBsYXRmb3JtczoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xrbWwvNjg5MTQ5NmVhYmNjNmY5Y2FjZWM0ZmVhNTA1ZmI3NTdlYTljMTFmYy5jYW1lbEBpbnRl
bC5jb20vDQoNClVuZm9ydHVuYXRlbHksIEknbSBub3QgYWJsZSB0byB0ZXN0IHRoaXMgb24gQ2Fz
Y2FkZSBMYWtlIFggKG9yIGFueSBvdGhlciBwcmUtSUNYDQpwbGF0Zm9ybSkuDQpJIGp1c3Qgc2Vu
dCBhIHBhdGNoIHRoYXQgY2hhbmdlcyBTS1ggdG8gdXNlIFMxMC42IGZvcm1hdDoNCmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMzAzMjEwOTA0MTAuODY2NzY2LTEtaXdvbmEud2luaWFy
c2thQGludGVsLmNvbS8NCg0KVGhhbmtzDQotSXdvbmENCg==
