Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D39508D83B9
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2024 15:18:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gq8R46hT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VtDnl6rlPz3cdV
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2024 23:18:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gq8R46hT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Mon, 03 Jun 2024 23:18:19 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtDn723Plz3cYh
	for <openbmc@lists.ozlabs.org>; Mon,  3 Jun 2024 23:18:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717420700; x=1748956700;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=yX4Ss9G87v9U9CDOgPSwnJkZM9epb8FkFb0Dn6+Rnio=;
  b=Gq8R46hT+u5qGEhhJ9SYPH1fjlPKr/Xaor6vNYA0UcXTZhJ2DFZvgXqu
   8jtB95yvUc1bEqlAaCxnt9uEPpl8xM4bIhK7KE/ARlWRPrL40D/SRSkIQ
   jBvt5uUujroCLTQz5GgQ2uJ6XiyXDJFbNg630RHYQps4b2PbdkQlPbUpR
   3dqtyBzlNj+abaXjs83m+ysQwFzpAmUOdVp2nskwO4fd4aPG7hGd+jgqT
   dKob9oi6H3XI+1p/2HmUhpSbgd9fBXh9C687NYmBzHuARZXAiCDp2Wysq
   LMt34yZhD7gyQsXZjbSwVWF+fee+bkan3k5j8jGJqsLMn06fnvxwBM6Wc
   g==;
X-CSE-ConnectionGUID: KD39tOocQXe+Fum2vnMVYQ==
X-CSE-MsgGUID: 4aUGRUrYQp6lBEEnzkhbrg==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="25310318"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="25310318"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 06:17:08 -0700
X-CSE-ConnectionGUID: SZBVTlWiRW+gO7ULIRAN6Q==
X-CSE-MsgGUID: cqRWb+6YQWm+85MuC1f8ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="36857232"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Jun 2024 06:17:08 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 06:17:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 06:17:07 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 06:17:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXDan0++vC2GO1H+dbCEKrTfWQh/yZ6XybbSjfP7XtQEcW05dWsTMFG8f/4z37tnIfHpUE3ABjrdVMbwAk/m/NhEg3cTbqsX7ivGqxLS874jXGQ75c6/PJuogZ7WY7kgchhnoFvUd6NM/bjs5Rl/u4nPcWU8xACkjce6Xs2bWs4SgHxzA8s9QlDl89qEpRHnMFFizpOLVPj90Vz8qh11ftliGssd4xWxmCbTrtIy679D3PjfgVV7qJ/a/p0IQZwYu4T34+JORkHLX8QVyaStux65DG5kI/1lF380Rp2AEYBSnDll4lo+liUM6QwhQhD3OHVD2ogPn8SgXmH1whMZaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yX4Ss9G87v9U9CDOgPSwnJkZM9epb8FkFb0Dn6+Rnio=;
 b=SgK1UD44PL1VpSY+cBy50a65dOSluUkCJAu/lw8KGqr1d9xCrBWfegYyIGKYyRxmozJzqoOAP+UJjR0DAq+dm4+3H5a6xSirNSoacKntMEdhMjUvsdg/c73MnEaIJzfRCjGiq8KKuEYST+yG76YRX35pkuB95iDpeE1AVfSWrutIcmRIUiFykr/E9genJeZhZCu+boIZfXyI+XyaEfDzFenooYraC8tAWn/p3qZ9p7f6omrJu+y+ZJm9Xkgq14n5QprVZ6iHJwfDkwsEeOaJ4iNzu9D1tuzMwlgOBnG1oj2JJZcFHfXzTkS4mOD9T3XCa1vlak7ABVaItlnQ7IwbdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5330.namprd11.prod.outlook.com (2603:10b6:610:bd::7)
 by PH0PR11MB5142.namprd11.prod.outlook.com (2603:10b6:510:39::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Mon, 3 Jun
 2024 13:17:04 +0000
Received: from CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::e179:e:20e5:53db]) by CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::e179:e:20e5:53db%7]) with mapi id 15.20.7633.018; Mon, 3 Jun 2024
 13:17:04 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>, "Luck, Tony"
	<tony.luck@intel.com>, "jdelvare@suse.com" <jdelvare@suse.com>
Subject: Re: [PATCH] peci, hwmon: Switch to new Intel CPU model defines
Thread-Topic: [PATCH] peci, hwmon: Switch to new Intel CPU model defines
Thread-Index: AQHasexkWgFKTZ2Se0GLxK6MieuIjrG2DL8A
Date: Mon, 3 Jun 2024 13:17:04 +0000
Message-ID: <e8d2acda5fcb9e9c39e1a621ebaaa4cd17c95fc3.camel@intel.com>
References: <20240529171920.62571-1-tony.luck@intel.com>
In-Reply-To: <20240529171920.62571-1-tony.luck@intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.1 (3.52.1-1.fc40) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5330:EE_|PH0PR11MB5142:EE_
x-ms-office365-filtering-correlation-id: 41d065d8-69c1-4a1a-3430-08dc83cf7648
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?NHNhbjdaeklSNlFkcm1qSGhnWFA4UlZFYUlsR1FqV3k2dEMyeTVyNjA1MDRa?=
 =?utf-8?B?T0FCZW52em9mTXRXTFJQTHVNdFlFSmlRdTljRkRjVVJVSEpFYStETWl2WmVE?=
 =?utf-8?B?SHV1ZW1FQThCaFIwYkJPd3dYTlFKL0Y1Q1YvYzlNNEo3eUJFdWwvQUlEQzdv?=
 =?utf-8?B?STlOT2xpcC90eFgvRDFpWkhVSndKQTVDUW90RmZmaHVkRzc4eUVIengzK1V5?=
 =?utf-8?B?ajZ6SFFlZlEwd2o4aml6MWh4ZVQ5TjdFYitETytSQ044UCtxVy9kWTB6K0V2?=
 =?utf-8?B?K2piUFIwSUdrNlJkWXo0RTFuR3VHQytpWlUybE9NTkVoUW85clpnKzBhcDVC?=
 =?utf-8?B?Tzl2N1BXQVNDT29lTXNkZFVQdlFUNzFCTkRSMG9DeUZCbjBTK1Nhd1l5NlBH?=
 =?utf-8?B?T1NXWmJLR3pzTXZCaC93cDdKcjU1Q2NmZTh1bUxWVGp0eEJGM256dE9Jby9j?=
 =?utf-8?B?Q0k2SllWdHErbU5EV21BYVhBYTRRa0JIeU9walZxWCtkM3V1TWFqT1p3bDJk?=
 =?utf-8?B?MU1FZW9HRTBiNzVBWlFwRXBvSFdNWXVqZGI1YlplODVtdEhSYkxJSHpXZ2NX?=
 =?utf-8?B?TFFEV0UvTWxsSGsxQTZtUUljb013OG9sMXNiT2NRWG9jTmRvdGtuQVdhNXpy?=
 =?utf-8?B?NXU1MlFPWElnRStXTWIrNzlVVUtSS0ZjZWpadno1NU80b3VOV3plTE80c290?=
 =?utf-8?B?aERZNG0zQVZIRUZwbGlHTlZHQkZ3SGFaVVJxV2tORExRNStUb3BVS3JwRnhu?=
 =?utf-8?B?ZjVjazJ3MnZtSDVLWFdzTXUxOVNQckhoYnMyWERQbXdYWmlqUDVlNndyREY0?=
 =?utf-8?B?TTRZVW1qVGRFcFJKeTVVekFlNS9aNGVlRzhhVlBMY0FhRkYwQ2x5QUQ0NnpF?=
 =?utf-8?B?dWNQaE1VNVZvUm1FVS9reXA1dlRXRjdvTzJhR3RqK25tOGh6STV5SDJXTzJr?=
 =?utf-8?B?TkFMbzgzQW5pWitHVzZCd0VVb1RhMEdLaE9kUUMvSktQQVprSlBsOTBkeWYx?=
 =?utf-8?B?NXdWNGt6aGJhM0dPVU51ZGFHY21aNWRCZEcrR3BRSzhpVkViWWVqYnlFTTV4?=
 =?utf-8?B?MUFISGMxWGs3Rk1zb0gvdnJwYk9WdjZUS0UzaE12MVZoNkJjL2piZWdjMzdv?=
 =?utf-8?B?WklUNWpkV3J6MW95MWNSRFlGdFhiNmJtcjliRlovbjE3THJDdGdMajR5dDdz?=
 =?utf-8?B?ZVdwbFhLOE9CRTQ4eStId2xzMFBJOEdyS0djbUk5MFFza3NhMnUyT3l6Y0d6?=
 =?utf-8?B?dEk5VWxKRVB6c0YweGRoZE1ZRnFqOXF5Wk9IdmE5RS9uQWdUTW5XdGtnNjlz?=
 =?utf-8?B?dm5DNjlld0JTZG9rUHZpRHFNOU84N0doejRLMnJxNjBUdUFVUWtYRUJGRi9W?=
 =?utf-8?B?dE44YURHc2YxMUN5QkVhb2dQL0lLK2RBMDkvdm0wb0VTbTRleHU3Ylg5bGxl?=
 =?utf-8?B?WVM4MUNqbjRvRmZDSGhBWUM1SGFpaDU3aGtxSXN0bDd6dUVUeVFhWTlwL0ly?=
 =?utf-8?B?R01VeGxxbmJPYW1EQ0FUeEVjNDJodkRXbUEzVHdCbTBvYktFR0pQUWJSK3Vn?=
 =?utf-8?B?UkFZM0RHb0REMFNCN3ZyOXJ2enhpNnR5TEoxcitMNURZOS9rV2g1MmZaSDZC?=
 =?utf-8?B?cDMxUXREbFU5anRnOSt3STRoc25SR3daU2xHSUdNL25qbGFwb0M4WGt3cDNo?=
 =?utf-8?B?SmRWTSthVnZsRFhTTkszUUh6MnpqUGVpQytQV3VtTi9XS25wSXpyZlVEa3BJ?=
 =?utf-8?B?anQ3UkRHbGZGTE4vUjdmNno0aXc1dzNENHQralJlN1FURjlORXI2Z1RBSkwz?=
 =?utf-8?B?UEx4ZzFCNzhydlFBY1hOZz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5330.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0RYTksreHVpSXowazBiUzU3clZIdG8zSU5adlFyU0FDSkdqQktHVXUydlk5?=
 =?utf-8?B?M01zdWZ1Wm1nR0hsY0NPU0tFNGtkZU5uSklMUk1JN2JjTm5nZ2NhVDFkWGpo?=
 =?utf-8?B?R0orL3hPdUFFMUp2bGE2N2ZzRkJKYTg0MStRM3p0MzBvMlVnOENHaTl4ZEs5?=
 =?utf-8?B?eHFzUnhLZCt2bCtWVGVhdTRSUzRCZGZVa3R5a1hHRkhtd3FtV1JVV1RQU2I2?=
 =?utf-8?B?QWd0eWY1cmZuYm8vSysyK3pJZVlSRWRFTnRhVXpmVTVjSms0ZlJWbUNRZ3dX?=
 =?utf-8?B?eC9DWldEUGZjWmJEbCtoZHlkVWxZcEFTbzY4NllHeXZVSzQweU0wVEozQXRh?=
 =?utf-8?B?bHpqYnQ0UU5nQU5vN3dmTFdGWlllekZoQkxUd2gxdkg5eWRYSkxWdFROcHRJ?=
 =?utf-8?B?c1cvSjBtR050NEJaVEFWQU1waUJUYjhkcmZtWm43Y1ZTZkpuS2g5UWQ2dG5R?=
 =?utf-8?B?RS9OZEpVRjAvSDNQdkExTE4zT1ArdE8xUXVINFlwSlhvRmg1bkJQMGRPdHV3?=
 =?utf-8?B?ZEV4M0JBZUl3QzB1alFzMVpmb1hMNjZYSHZITzYzVjlzTFNmWi9xNFFuZGVW?=
 =?utf-8?B?bDhDazhKVTNYZTkzRHprZG1CclkwQ3RISWsxN25mSkJkSE1JYnNVK2txc1lH?=
 =?utf-8?B?WHpDbzRrandWNzA4bnVtU3kzTHZDQU8weDhUVmx1WXZ3dHBWME95bXQyWjBB?=
 =?utf-8?B?bzViYVJCYk5OQk54dnhYUm0ySVR6MzlIdlJDbVl4TUhDaklMQ1pSTjFUQ3N2?=
 =?utf-8?B?YWtWNXFIY05TQ2NPQUc2anJDTEFjYmxkWkhPOXBiTWNaaE1uQkdQL3Jmbk9C?=
 =?utf-8?B?WHFUbmNqYmcvYnpzQ2tKaFE2K2ZCV3lYZk8zeVBJNG1KQ1NvUkdRWG5GUEla?=
 =?utf-8?B?YkZydVJudGhERldBTjBjdDdRZTdMQlR4MEJ3S2VSTjQ2bStHajdRTFJvN2ta?=
 =?utf-8?B?VjFiSUdVZ2tIb0JlWEgrL1RXRjZrSnBzMko1OHltTC9NVVpCemVmcThWem9X?=
 =?utf-8?B?dnM4Y29WbkU0cldUQ0ZqWndKTmtXTy9uK3ZETUtjajJoNHdodVFSOEFBNmxV?=
 =?utf-8?B?TzI2RmcreGVsNis3TURnN1UyaEpPdXNpdkVGV3JSQndqa2t5SStCdTNoYzda?=
 =?utf-8?B?TFhCSEZvVnZpcGd2M3JHWXhiUjNvejFSdmNmRnZDZHh3NENyMzV5Yi9iZnla?=
 =?utf-8?B?UGZvbnVRRy9rMDMvbVd4YVZmT0lac1ppSzVuTGt4Rm5Ca1piVGVCT2k4RStQ?=
 =?utf-8?B?ZTgxelZ1Tk5UVjdaWWxPYTlyN2o5V2dBWVVTWldIRzdkdTFkeTFLV2lqWUFZ?=
 =?utf-8?B?ellWYk9BMFpRSzIwOWJVV2Nwb0czVUtmRmkrd2NaNGRlRGxaVFZRZTdwa1Vj?=
 =?utf-8?B?VWVKaGRMZ0VxcXB2RXFyR2trZFBQcVRhcCtZNXZuTnpOTURFazFwTXByZzIz?=
 =?utf-8?B?eTA5UzRtN3lHdlhSbTd1cXE1Mnpvandtd2dGZE5McWVGQ3dCNkZuRngxWHVI?=
 =?utf-8?B?eXRsVGs3VFRXOGwxY0dKR2dPVmh6NEhSWitzdzRFSDJ3YUI5d0ROQTgrdVhO?=
 =?utf-8?B?OE90UGJqNTdFOTV4OTJGUkRHb2g0S3dOeEdHaFZlcHgwcUNIZ1BEOW1aeVAw?=
 =?utf-8?B?YU42amJ3S1ltMTB3MmN0T1JZS24vbWxRMmRNRXl1YUY3TnM1MkpvejNSYTFI?=
 =?utf-8?B?TnR3K05aRjVDK2R3bmNBTjdrYVd4TU1iWlFWWDJoTHE3ZHN2clRWSVlTRTkr?=
 =?utf-8?B?Skx5bThUQUZZR1FQYkhoc2w1WUF0TVlrdEhJMnI4TVQ5YkhGdXV6aUFsUFJU?=
 =?utf-8?B?bW5FSWVWaVBvNmxOM3FHc2FqSC9rZTM5MUF4UWNIb2k3NDFoVVJMWm40Tk55?=
 =?utf-8?B?cmZIemZoUklMYkk5Vm1XZUVFcG9mVUlkTGtWa1ptS1cxVnR4Nzh4eGFaSHNS?=
 =?utf-8?B?dWdMb3hhbEhYSnJJWW5oc3ZlQlpzTnNBUGNQMzZUKzVUL0FZUVlGaWdwaEhB?=
 =?utf-8?B?Wi8ydnRpM2U1cXFZVGhhOWF4Qk5OTHY3U01wSnN6RSsvTHhMR2Z2N3VWelFq?=
 =?utf-8?B?ci95VllBamRMZG5UVmdIU0lkRDVZd1p2YlVsRFdneTBPV3djZ0pSQWJxeDY0?=
 =?utf-8?B?Z3pSMnlPZ3pMeUFIWnh5Uld2M1Q2L2NkZDhjK2taT3J0VU81OGJGZThhcXk3?=
 =?utf-8?B?Znc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <73725D29689516409DDE7120DF97C48E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5330.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41d065d8-69c1-4a1a-3430-08dc83cf7648
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2024 13:17:04.5223
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jd3mkF7KP5ueWxhxXMEzG4vx5IgOtXGCvI+UJPvrvGxBZT7dr7cH3yWT5UGU/fiyNgHgM+9V1rDcawh+5vPygCfrUNPrTfdc5cgyKUenqYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5142
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "patches@lists.linux.dev" <patches@lists.linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gV2VkLCAyMDI0LTA1LTI5IGF0IDEwOjE5IC0wNzAwLCBUb255IEx1Y2sgd3JvdGU6DQo+IFVw
ZGF0ZSBwZWNpIHN1YnN5c3RlbSB0byB1c2UgdGhlIHNhbWUgdmVuZG9yLWZhbWlseS1tb2RlbA0K
PiBjb21iaW5lZCBkZWZpbml0aW9uIHRoYXQgY29yZSB4ODYgY29kZSB1c2VzLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogVG9ueSBMdWNrIDx0b255Lmx1Y2tAaW50ZWwuY29tPg0KDQpSZXZpZXdlZC1i
eTogSXdvbmEgV2luaWFyc2thIDxpd29uYS53aW5pYXJza2FAaW50ZWwuY29tPg0KDQo+IC0tLQ0K
PiBUSVAgdHJlZSBhcHBsaWVkIHRoZSBwYXRjaGVzIHRoYXQgaW1wbGVtZW50IHRoZSBuZXcgQ1BV
IG1vZGVsIG51bWJlcg0KPiBtYWNyb3MgKGFuZCBhIGNvdXBsZSBvZiBkb3plbiBwYXRjaGVzIHRv
IGFyY2gveDg2LyBmaWxlcyB0b28pLiBTbw0KPiB2Ni4xMC1yYzEgaGFzIGFsbCB0aGUgbmVjZXNh
cnkgY29kZSB0byBhcHBseSBwYXRjaGVzIHRvIG90aGVyIHRyZWVzIGluDQo+IHRoaXMgY3ljbGUu
DQo+IA0KPiBUaGUgcHJldmlvdXMgcG9zdGluZyBvZiB0aGlzIHBhdGNoWzFdIGhhZCBhIHRpbnkg
Yml0IG9mIGZ1enogZHVlIHRvDQo+IG5lYXJieSBjaGFuZ2VzIGluIGRyaXZlcnMvcGVjaS9pbnRl
cm5hbC5oLiBUaGlzIG9uZSBhcHBsaWVzIGNsZWFubHkNCj4gdG8gdjYuMTAtcmMxLg0KPiANCj4g
SXdvbmEsIEplYW4sIEd1ZW50ZXI6IENhbiB5b3UgY2hlY2sgdGhhdCBpdCBzdGlsbCBsb29rcyBn
b29kLiBJZiBzbw0KPiBhcHBseSBpdCB0byB5b3VyIHRyZWUgYW5kIGtpY2sgdGhlIHByb2Nlc3Mg
aW4gZ2VhciB0byBoYXZlIGl0IGFwcGVhciBpbg0KPiB0aGUgaW50ZWwtbmV4dCB0cmVlIHdpdGgg
ZXZlbnR1YWwgbWVyZ2UgdG8gTGludXMgaW4gbmV4dCBtZXJnZSB3aW5kb3cuDQoNCkknbGwgYXBw
bHkgaXQgdG8gcGVjaS1uZXh0IGFuZCB3ZSBjYW4gbWVyZ2UgaXQgaW4gdjYuMTEgY3ljbGUuDQoN
ClRoYW5rcw0KLUl3b25hDQoNCj4gDQo+IFRoYW5rcw0KPiANCj4gLVRvbnkNCj4gDQo+IFsxXSBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDA1MjAyMjQ2MjAuOTQ4MC00OC10b255Lmx1
Y2tAaW50ZWwuY29tLw0KPiANCj4gwqBpbmNsdWRlL2xpbnV4L3BlY2ktY3B1LmjCoMKgwqDCoCB8
IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKw0KPiDCoGluY2x1ZGUvbGludXgvcGVjaS5owqDC
oMKgwqDCoMKgwqDCoCB8wqAgNiArKy0tLS0NCj4gwqBkcml2ZXJzL3BlY2kvaW50ZXJuYWwuaMKg
wqDCoMKgwqAgfMKgIDYgKystLS0tDQo+IMKgZHJpdmVycy9od21vbi9wZWNpL2NwdXRlbXAuYyB8
wqAgOCArKysrLS0tLQ0KPiDCoGRyaXZlcnMvcGVjaS9jb3JlLmPCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgIDUgKystLS0NCj4gwqBkcml2ZXJzL3BlY2kvY3B1LmPCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
IDIxICsrKysrKystLS0tLS0tLS0tLS0tLQ0KPiDCoGRyaXZlcnMvcGVjaS9kZXZpY2UuY8KgwqDC
oMKgwqDCoMKgIHzCoCAzICstLQ0KPiDCoDcgZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygr
KSwgMzEgZGVsZXRpb25zKC0pDQo=
