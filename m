Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0845A1DABD
	for <lists+openbmc@lfdr.de>; Mon, 27 Jan 2025 17:43:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhZ3h1GbGz3bZK
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2025 03:43:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=198.175.65.21 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737996189;
	cv=pass; b=hB3DpfCKIvz84PkE+nqYTQWA4hw6BQy5ZNFRrl41CJXze5ZXMsNljXc0qDyk4R2ng0fYYrPyU1Zff1lOwNUPTzlNZor9OZcd+6jpa5Gb/3X6Frsd2kgUClkqQXy3dNDA+lom3AEYcuwDikRKyh6lf6MF8iH5MRcnd/bAsA0fihgiLJLMPz4hQb/3ncFMcWkYaHry8bSLbnnV+ok0mrpP5R4l6P8/UwDEAn0hOw66fJH1/TvdYWyZZ8uLFPuFGUY/Yl8ji3nV/OVUHkPv+2k28IkUzrOBA48kB5iqJMiz6FPUFpzbZBKl4Ad0e/1jgR8ij+SUGC2rRFpqUv2ilSvHRQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737996189; c=relaxed/relaxed;
	bh=yfdLxixN4mq29kg+cTTD1Hxw62S0LHTWmwUJZHkrGRk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kJ6LmkDHFmjxbs4AxbnQVi6erccaCbbtWAgb3m/54E2pIq4YX3oV9P2vZs4atTsa6Z9Ke/Hc59F0lwa8Dd12D/xJd3m06zjizNS12cy6Ez9WUb4iPWdHNjDRCN2LN5ytq1t7jKt/gH5C1Mz/bXzvIpxDvrz7y1Ky5zQ1GKBtMPOk8sZwS5moxQ52W8OMMdrFPArUsJrUbTQEAuAXlUBALABzpTxSKk05XUiI+XAwe+DQ4IfpbMuvqpTHVACiXVcvA182U2DcbNQEXcLH/7CTorMWG0omJUCNyMtZDDSDUJdpB2iTzwuaetS/M8Mp9S9TYGo9mdlLfZpNDv+OCFl5hQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BUfuFfj3; dkim-atps=neutral; spf=pass (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BUfuFfj3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 66 seconds by postgrey-1.37 at boromir; Tue, 28 Jan 2025 03:43:06 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YhZ3Z6xD0z2yGN
	for <openbmc@lists.ozlabs.org>; Tue, 28 Jan 2025 03:43:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737996187; x=1769532187;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=yfdLxixN4mq29kg+cTTD1Hxw62S0LHTWmwUJZHkrGRk=;
  b=BUfuFfj304WjMlI3h5nEN8iHyyxRH012RxUweHnXGEcQdW+EGsY80v4m
   yMtUcWk4brAsYP33LJDBBWiTWm6ldInAzr9JO3xLOyF5fAQiF1IGGZq7d
   rl47J5KD9q7wYj/WVSXREgN6FFSSi+C6c0Aw0tx3B3cJZyBHlvr/ICNwm
   +2IX6tE1sdTUJpkaWdluFUvbTlZ+vZJB4JcohlBWiE5hrI3P6s/nObRJD
   vaSFn7RAal5EnV8WDfVpVspeYLr9scTgXH5tCBlXX46XCfuaJ3VBakf9Q
   e4yB/BCqR4JVo9cIdKlCfKOKijXCD7E+A+lYc3iWWyaUb7LFy6/UEVqWo
   Q==;
X-CSE-ConnectionGUID: WFyK0qQtQB2YI/GBQfKDag==
X-CSE-MsgGUID: 36c4J2H5SLGIHlD2dPTSjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="38351311"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="38351311"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 08:41:46 -0800
X-CSE-ConnectionGUID: qY75RQhcSVOtVrBFI00BZg==
X-CSE-MsgGUID: T4g4t5FJQLu3cUTqvN+bOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113108602"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Jan 2025 08:41:45 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 08:41:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 08:41:45 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 08:41:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oAnSaCwtqTYwqeFXfqYcH+8wREaoiJPArqaiUuSxUYU+PR2kuA2zic5nSZW7mmYy5cM9FVRjLhemI8r2erPxDd3KxU/+t3GpT85gK1qs7EUhKrp54Mir5LvaQxOuMWKHAZjnsxrwr91ZLSwHP/qigGZ3FBLcYXKr/HY6hTwt1c/+9RLkYuavSKgd1AwiTtXeU0lK508GTJehk1bY6X2+FIvOP/JtubBwWCFL+pRBXBxvLvR9Ey05jt5iGun8zdggcHse6IEdOox6jmadeQPRrLGYBHgMnKtgA8mpUVr2CbDox690eZcOQolOe3rnSZxm5a9NET33rLLvU7zJ/mBU4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfdLxixN4mq29kg+cTTD1Hxw62S0LHTWmwUJZHkrGRk=;
 b=FHyznh8B0Gv8nivILR+PkJTsJUEifQoBRkjbqoArGAfojLSEViNp+Gkvor3o9X5p44C3kgUnWcgrI05ZSOuux8595Y2dSW6hpGGm7RFicbxwEFyxtPjhCvKO42x7kypwpYuCUQUa1xlqjVrMXMV3lDVorgR5M2SFhfiO6lLorrADhOlivHKGjYeAafYXrEmZ2mnzGLP033Y7ctpyzsS/wSyv8g54MM9B0np1E1qVKotA9nhTSYPB2YHnDdm/WtmbU+A5VWlo5CQwvOXkUBZDOHJ9z6DTEtWEb5IV+X62ETjUXzXupsljGldwzYhdWVErmGUkoO8wpoNoY8x8mY6XAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5330.namprd11.prod.outlook.com (2603:10b6:610:bd::7)
 by DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.20; Mon, 27 Jan 2025 16:40:52 +0000
Received: from CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::e179:e:20e5:53db]) by CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::e179:e:20e5:53db%2]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 16:40:52 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>, "jae.hyun.yoo@linux.intel.com"
	<jae.hyun.yoo@linux.intel.com>, "Rudolph, Patrick"
	<patrick.rudolph@9elements.com>, "pierre-louis.bossart@linux.dev"
	<pierre-louis.bossart@linux.dev>, "Solanki, Naresh"
	<naresh.solanki@9elements.com>, "fercerpav@gmail.com" <fercerpav@gmail.com>,
	"jdelvare@suse.com" <jdelvare@suse.com>
Subject: Re: [PATCH] hwmon: (peci/dimmtemp) Do not provide fake thresholds
 data
Thread-Topic: [PATCH] hwmon: (peci/dimmtemp) Do not provide fake thresholds
 data
Thread-Index: AQHbbZE9nRm80piZm0Kjr8sk63pHVLMq2U8A
Date: Mon, 27 Jan 2025 16:40:52 +0000
Message-ID: <71b63aa1646af4ae30b59f6d70f3daaeb983b6f8.camel@intel.com>
References: <20250123122003.6010-1-fercerpav@gmail.com>
In-Reply-To: <20250123122003.6010-1-fercerpav@gmail.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5330:EE_|DS7PR11MB5990:EE_
x-ms-office365-filtering-correlation-id: e075121b-35e1-487b-4299-08dd3ef15cf5
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SXpoQWRpRzJkdGxISGJnT3ZBQnY4Ri9XWURNVUx5UWh6aE9rSFZhcmtnWXVu?=
 =?utf-8?B?NmlldkRITDIrSEQwTlcxMWZnTUlQa1l0aFpDZ1ppWlFrOE5oZDlCa0RhT1dC?=
 =?utf-8?B?NlRvZUFqTEZtRHlDZkJCM2RaSTV1dXhlVjk2NWlPVnFnVmRBOHNIL21OZ1Bz?=
 =?utf-8?B?WUVwYzRFdDdZRGFpR29YYzhEUXovK0RYbjFtczB1bXF0ZExEZ2pLYU1jM3Z5?=
 =?utf-8?B?U1QxMzBTbGIzRmFLTHFEZEk4dFdleWFQaXJ6MEttNjFaUXdEU215TDBjWDVm?=
 =?utf-8?B?RnRkVWpZbXBjN0FtRDArbkJTNTE5cWxQeE5sUTNkeUZYRjFIV2FrMEJqK0pK?=
 =?utf-8?B?bUc4Q0JrNUNPdWFjK0Y3NjBsM1Q0SGpCVy9JME9kdlBlam5EK096Q3RDNDNa?=
 =?utf-8?B?ckgyQm5lUlRGa1FObEN2SytkaWZRNzhuK2lPemtGeCt0aTZ2ckkxWEpNU1Ay?=
 =?utf-8?B?TXdXQWptL2ZZT1pHSm1ydk45YkViLzVxS0NPVEJmV2dPWTRzREgyaVVxS3Ji?=
 =?utf-8?B?d0tXQ3pQVlY2eXFrNmQ4T0hzN2dHWEhaRytEa3VFSk1qK0E0RU9sMEhITC8x?=
 =?utf-8?B?UXQ0MSs3UG9zQWFnajdLdXdIMEpGN3pVVkxBb0hBTjVBUEpTVUNuRkdUL1RO?=
 =?utf-8?B?M1ZTejgzNng0TkRTUHhzVWpxWWw1bUxhVnhlWVlkQ1l3OHRVYXVDSjhiYWdN?=
 =?utf-8?B?dkVQNzh2Mk13TExnc2s4azlUQVJlaUtBbURkYURXZU1xcnFySkRMcHF5Nmhu?=
 =?utf-8?B?WXBwcFhMZ29XUmczQ1VQWlI1eDRsdmR6YXRJNHFCSjZuRGtld3RsUDhaM0Ur?=
 =?utf-8?B?RjZlcXlRb3A5S0hhSTRMbjZ1U2VIT0l5OTRHYW85RmFjdkNJUGMwR1cxdk5j?=
 =?utf-8?B?RTRzaXp4eVpuSUExL2hsVXFOZytja1p2Y3lLSlhqRlhrcjN3K1BqQW1xTnFG?=
 =?utf-8?B?NmhRenNMY2lNSFJDdEJOYWd4MlU0WXRUVGUwTTVSUmZDMTlZemlseUVnak9h?=
 =?utf-8?B?dWVmaDUzL2UxT0xsOTRnNjlQNkN4RlF5OXRENEFzSGNHNWFJVFpGbFJ3c0g5?=
 =?utf-8?B?VEI1Mm8rbGRjUjhGckFFYndNVEFnSmZCS1FjZE1vaS92N3hya0xvU3pjZ2VO?=
 =?utf-8?B?aDBGVGNLVUV5cEhJVWFCTDAvNVFnZ0NSNm1NMDlyVzNkY20raHBNK0NmSkE3?=
 =?utf-8?B?OVY5Q3YxT1hZMlBBZlU4VTdveUpaZFJ1U01qSTVLUVlkMVMwaVRqQzJEbmUx?=
 =?utf-8?B?MjFBZ2ZFRWRBSlJWRHRoVEh0TzBUMmtZUkNHNVc1ekFJUy9kSXZieG8rQWlu?=
 =?utf-8?B?WktZRlZyQ09wby9kWXdESkVaNUVpUlNvRjA1NXVoa3RPbW9hMVJXZlBudjN3?=
 =?utf-8?B?WHhtOVduVzZQQkZQa0h0bjJ6anYzWWhiTUtSTEdDc2RpeCsvKzNLVFNMTExK?=
 =?utf-8?B?dlh0eFdUbWRUMUV4ek1XVmMxVkFvbnZLKzJuZTNLT2paUGo5bjR4WTA4M3JV?=
 =?utf-8?B?NWFXL1ZEYlhPa1loWWZWRm9SYnZSWVdxVVRvd2NEOWZCQmQrOXpTU0hoaGZn?=
 =?utf-8?B?UUpDSmFOdjEwOTRjOWsvVmdmUWFoMFpsUEZjLzdPYmNwQnNlTlJ6L3pGekU5?=
 =?utf-8?B?dXI4Q2t3MnJjNU1VcDBKdjRzajJMcTlaaVlZTit3a0F4ekkwSXZtcWVZdFV3?=
 =?utf-8?B?T0RGMFQ4RW1tTk5UVS9rL3dkUFpFL25rVzdmQUMza2FOSC9GUWFUOStCLzEv?=
 =?utf-8?B?Z3ZPWlpwOXZrUmtaU2E4UGFrekM4SU96ZFFPaDFmYXJIdkZJUG9OTkxyMzh0?=
 =?utf-8?B?YldwaFd4UTU3MnZaMTdzTjh6Vm1DaEsyU0d1dkxEMXgzNTVDTHdiWUhta2Jv?=
 =?utf-8?B?YlIva0Jpb2JrV2JpVWRJM3Bhc0x3c3I2aHdpTjhzazcrYW50UGZpakhaeks4?=
 =?utf-8?Q?idHqnVGpxhe86ahFuwzUSDcZbNStgeBa?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5330.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eEU1N1RmUTB2YnZKallFc0JZUkpwdE44Lysyc0hwc0NwcWd5a3FaRThYVHdw?=
 =?utf-8?B?Y2JDM3hrZngxaGphSmIrV1o3S2ZaNXJLb1pra2Z1dHhNTTk2cGJrK29GNVAw?=
 =?utf-8?B?c0FSVVJEUFlVR2hnSXBpRjNhOGxMOWxhZWNzRTJheVlQZzZ3MWV2ZTVRUFVK?=
 =?utf-8?B?aVJjNTQrSUtyOG44MGlJeXhsVFdGcWNHK2dMZTJQUVhWS3MxTjhLYWZoQkZS?=
 =?utf-8?B?ZDVIcXlCdXNNVkx0RFZYMjB6VDlXQzZPNXJjUVgyVW1Sa0JLVHpEZGRwOW80?=
 =?utf-8?B?YWJpYlpEWUlBRTY1N2VsOSt0YXF2MlZGVkRlL0dLU3FEMWJZRXh6SDJSdzlx?=
 =?utf-8?B?TnRYT2pldlFuNzRYT1RtNWF6VG9USmxVRE9neTcwM1ZzVEVZSlpUakQ5SC9D?=
 =?utf-8?B?akloVkY4U2lxL2ZYN2M5QWZTUjM4WDhiZTJneVVsSko1OUVvQ1Yya3lmNXhm?=
 =?utf-8?B?OVNvcEFIY0JvaTZuWVg1UWpuVXNKNkJjMVI5dnlxYzRnNFJwY3VoSS90bTlW?=
 =?utf-8?B?U28xUTVvMjhLN0N5QVlYMnl0aHdqekIveGJtVC8zMjQxUDBha0E2dUFSeTM5?=
 =?utf-8?B?Skp0Wk1xS0dlSSt4blZnSCt1MXFnS3gzcWZhdUluK2NmM2xvellXNGJQLzFS?=
 =?utf-8?B?eDlUV2h2YzFHbzV2c3BVSFE4dXVlcWpTWG14Wk1raXMvNXVScFpkL3U0cFFY?=
 =?utf-8?B?aDQvWG41d0tEWmdXYnFyOVRWV3NrNEVDZ0M0TDN3ak5WanlCeVo2RkNqZVFn?=
 =?utf-8?B?a0FpcGtkYmh3Y2QzOVlCWmNQUUJocnVzeFR5Q0xnbHRqc2hISlNubTR3VTds?=
 =?utf-8?B?SlYzYVZQc1poN0M5MFI2dTNRVXRLMTZIWWlMekF1QjZpdmd2UVdBQUkrMEdn?=
 =?utf-8?B?OE96QStiK083bmlPeTRQTFFBM1NIZUlBVlRrdXZteGtZN1hmbXYxTUtwNUVj?=
 =?utf-8?B?NHB3TG5ZQmhvWE8xRnlNNkVSeFpSdks1anNjbENFMFNqWjF4L0xtd3VZMUdR?=
 =?utf-8?B?elFDZVZPQ3l6YkcvN2xiellUVzI0cmV1TkRnSjNQZ3RJVmhaZi9aNWYrd2Zs?=
 =?utf-8?B?czJ3d2ZCUmN3TDdmNVBFVCtUekhZd2ZuN0c5Z2JxYmVzNUxueityVXNleDY3?=
 =?utf-8?B?bk1acHIyODhNZG0yQXNTd1pFdDMva2FHV3pwTVh4ZWY0VFM1OS9kUFMzY3cy?=
 =?utf-8?B?djNEMWM5ZlI5MWpqUG5RK2hseFB4TXB1c2hmNkpIQ0RvK3NkSTI4TDFTd1hL?=
 =?utf-8?B?bUtlQi9PR2U3MjV1bC92R1lZclpDQTlQeFl5TWpqY2hsZHc1Q0JNNVN4dCt5?=
 =?utf-8?B?c2V1SW0rU3FPb3c2Ymd5ZXJXaHcxQUx5VUdKSjlFUVp0MGVoT3RZZnpha2Zo?=
 =?utf-8?B?YWxNUlJNVjZmeGVGSTZmREI2ZWRkM3VYL01LNzh1TEwxSHNzVXljbjBOWUJI?=
 =?utf-8?B?NEdnalNxbEtKd3BrdmUzNDZtbDByOUZCU0V5NjhXbURHbnVzZmRXMFYydjN1?=
 =?utf-8?B?R0xyUldsUUthelUvdWtaT0dtUFZDYnlIRjlYN3ovUUxRbU1YZE1zb2FYUjVR?=
 =?utf-8?B?QTNaYnFMaUZXVXE2SGNIOHhhOG1oNnMySWp5M2ZuV2srbDVqRHFlS1IzbHRF?=
 =?utf-8?B?ZEI2eUFzMXlzNmc0eE11VHNNdmlaVmtXRTdXMFI5azZ5NXZvdnBTWjJTSnlz?=
 =?utf-8?B?Rk1SRFR5bG5OeHduVlBMWitmNVJ0cjlWaVRXMEpvMmRVVEVtVUNUSlE5TlZk?=
 =?utf-8?B?clM1NG9hdmhBcW9OcWFQejZqNGdqbC9ORzRjMDRMbnhwUDNRUFVGNFRDa1la?=
 =?utf-8?B?QXJFbWw4UUZkb0wvNGp1VVZweE1WTjVZcWVKbEVWSCs2eDVWVm5YWklSdElj?=
 =?utf-8?B?VmQvQTg4Z0dsVTFoNXFOQXVwWm1Lbnhuekh1YWNhdmVaRWIwYUpzVVZsMlgy?=
 =?utf-8?B?aHhOUndaZ2FWSlhhZFI1ckRWNkU0TVF1UWgxc29OcU81ZVNiWk9PeDFrb20z?=
 =?utf-8?B?V2lMODFSbzVNdmo4TSswaVordlpobTlocGhZck1YY0NCZVVCL3Rvd0xSUEhI?=
 =?utf-8?B?dnJXMDhRN05KeXJ0cUZ2TU1hQmdSTFhXWmJCbVZLTVQ3QnY1VUw2ZFJwQlp1?=
 =?utf-8?B?UVRNNW5NaVN5MEE0akNqV2xxejdQclcva1hETkF6bURZYlpFUWtPWXZ3TWVU?=
 =?utf-8?B?M3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FCCB85442880C6459537E9796DA308EF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5330.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e075121b-35e1-487b-4299-08dd3ef15cf5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2025 16:40:52.3601
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jAtE59tIGaBjp0TnE/Ol5x01fjiMohfz041+NoJ8k5B5zQrt2KCN8MunE3oNreMt5201nQ9acIA6ILXIcrA0N89KD+T1kFCGPW4pASnONkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5990
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, "fr0st61te@gmail.com" <fr0st61te@gmail.com>, "joel@jms.id.au" <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gVGh1LCAyMDI1LTAxLTIzIGF0IDE1OjIwICswMzAwLCBQYXVsIEZlcnRzZXIgd3JvdGU6DQo+
IFdoZW4gYW4gSWNlbGFrZSBvciBTYXBwaGlyZSBSYXBpZHMgQ1BVIGlzbid0IHByb3ZpZGluZyB0
aGUgbWF4aW11bSBhbmQNCj4gY3JpdGljYWwgdGhyZXNob2xkcyBmb3IgcGFydGljdWxhciBESU1N
IHRoZSBkcml2ZXIgc2hvdWxkIHJldHVybiBhbg0KPiBlcnJvciB0byB0aGUgdXNlcnNwYWNlIGlu
c3RlYWQgb2YgZ2l2aW5nIGl0IHN0YWxlIChiZXN0IGNhc2UpIG9yIHdyb25nDQo+ICh0aGUgc3Ry
dWN0dXJlIGNvbnRhaW5zIGFsbCB6ZXJvcyBhZnRlciBremFsbG9jKCkgY2FsbCkgZGF0YS4NCj4g
DQo+IFRoZSBpc3N1ZSBjYW4gYmUgcmVwcm9kdWNlZCBieSBiaW5kaW5nIHRoZSBwZWNpIGRyaXZl
ciB3aGlsZSB0aGUgaG9zdCBpcw0KPiBmdWxseSBib290ZWQgYW5kIGlkbGUsIHRoaXMgbWFrZXMg
UEVDSSBpbnRlcmFjdGlvbiB1bnJlbGlhYmxlIGVub3VnaC4NCj4gDQo+IEZpeGVzOiA3M2JjMWI4
ODVkYWUgKCJod21vbjogcGVjaTogQWRkIGRpbW10ZW1wIGRyaXZlciIpDQo+IEZpeGVzOiA2MjE5
OTViNmQ3OTUgKCJod21vbjogKHBlY2kvZGltbXRlbXApIEFkZCBTYXBwaGlyZSBSYXBpZHMgc3Vw
cG9ydCIpDQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+IFNpZ25lZC1vZmYtYnk6IFBh
dWwgRmVydHNlciA8ZmVyY2VycGF2QGdtYWlsLmNvbT4NCg0KSGkhDQoNClRoYW5rIHlvdSBmb3Ig
dGhlIHBhdGNoLg0KRGlkIHlvdSBoYXZlIGEgY2hhbmNlIHRvIHRlc3QgaXQgd2l0aCBPcGVuQk1D
IGRidXMtc2Vuc29ycz8NCkluIGdlbmVyYWwsIHRoZSBjaGFuZ2UgbG9va3Mgb2theSB0byBtZSwg
YnV0IHNpbmNlIGl0IG1vZGlmaWVzIHRoZSBiZWhhdmlvcg0KKGFwcGxpY2F0aW9ucyB3aWxsIG5l
ZWQgdG8gaGFuZGxlIHRoaXMsIGFuZCByZXR1cm5pbmcgYW4gZXJyb3Igd2lsbCBoYXBwZW4gbW9y
ZQ0Kb2Z0ZW4pIHdlIG5lZWQgdG8gY29uZmlybSB0aGF0IGl0IGRvZXMgbm90IGNhdXNlIGFueSBy
ZWdyZXNzaW9ucyBmb3IgdXNlcnNwYWNlLg0KDQpPbmNlIHdlIGFyZSBhYmxlIHRvIGNvbmZpcm0g
dGhhdDoNCg0KUmV2aWV3ZWQtYnk6IEl3b25hIFdpbmlhcnNrYSA8aXdvbmEud2luaWFyc2thQGlu
dGVsLmNvbT4NCg0KVGhhbmtzDQotSXdvbmENCg0KPiAtLS0NCj4gwqBkcml2ZXJzL2h3bW9uL3Bl
Y2kvZGltbXRlbXAuYyB8IDEwICsrKystLS0tLS0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaHdt
b24vcGVjaS9kaW1tdGVtcC5jIGIvZHJpdmVycy9od21vbi9wZWNpL2RpbW10ZW1wLmMNCj4gaW5k
ZXggZDY3NjIyNTlkZDY5Li5mYmU4MmQ5ODUyZTAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaHdt
b24vcGVjaS9kaW1tdGVtcC5jDQo+ICsrKyBiL2RyaXZlcnMvaHdtb24vcGVjaS9kaW1tdGVtcC5j
DQo+IEBAIC0xMjcsOCArMTI3LDYgQEAgc3RhdGljIGludCB1cGRhdGVfdGhyZXNob2xkcyhzdHJ1
Y3QgcGVjaV9kaW1tdGVtcCAqcHJpdiwNCj4gaW50IGRpbW1fbm8pDQo+IMKgCQlyZXR1cm4gMDsN
Cj4gwqANCj4gwqAJcmV0ID0gcHJpdi0+Z2VuX2luZm8tPnJlYWRfdGhyZXNob2xkcyhwcml2LCBk
aW1tX29yZGVyLCBjaGFuX3JhbmssDQo+ICZkYXRhKTsNCj4gLQlpZiAocmV0ID09IC1FTk9EQVRB
KSAvKiBVc2UgZGVmYXVsdCBvciBwcmV2aW91cyB2YWx1ZSAqLw0KPiAtCQlyZXR1cm4gMDsNCj4g
wqAJaWYgKHJldCkNCj4gwqAJCXJldHVybiByZXQ7DQo+IMKgDQo+IEBAIC01MDksMTEgKzUwNywx
MSBAQCByZWFkX3RocmVzaG9sZHNfaWN4KHN0cnVjdCBwZWNpX2RpbW10ZW1wICpwcml2LCBpbnQN
Cj4gZGltbV9vcmRlciwgaW50IGNoYW5fcmFuaywgdQ0KPiDCoA0KPiDCoAlyZXQgPSBwZWNpX2Vw
X3BjaV9sb2NhbF9yZWFkKHByaXYtPnBlY2lfZGV2LCAwLCAxMywgMCwgMiwgMHhkNCwNCj4gJnJl
Z192YWwpOw0KPiDCoAlpZiAocmV0IHx8ICEocmVnX3ZhbCAmIEJJVCgzMSkpKQ0KPiAtCQlyZXR1
cm4gLUVOT0RBVEE7IC8qIFVzZSBkZWZhdWx0IG9yIHByZXZpb3VzIHZhbHVlICovDQo+ICsJCXJl
dHVybiAtRU5PREFUQTsNCj4gwqANCj4gwqAJcmV0ID0gcGVjaV9lcF9wY2lfbG9jYWxfcmVhZChw
cml2LT5wZWNpX2RldiwgMCwgMTMsIDAsIDIsIDB4ZDAsDQo+ICZyZWdfdmFsKTsNCj4gwqAJaWYg
KHJldCkNCj4gLQkJcmV0dXJuIC1FTk9EQVRBOyAvKiBVc2UgZGVmYXVsdCBvciBwcmV2aW91cyB2
YWx1ZSAqLw0KPiArCQlyZXR1cm4gLUVOT0RBVEE7DQo+IMKgDQo+IMKgCS8qDQo+IMKgCSAqIERl
dmljZSAyNiwgT2Zmc2V0IDIyNGUwOiBJTUMgMCBjaGFubmVsIDAgLT4gcmFuayAwDQo+IEBAIC01
NDYsMTEgKzU0NCwxMSBAQCByZWFkX3RocmVzaG9sZHNfc3ByKHN0cnVjdCBwZWNpX2RpbW10ZW1w
ICpwcml2LCBpbnQNCj4gZGltbV9vcmRlciwgaW50IGNoYW5fcmFuaywgdQ0KPiDCoA0KPiDCoAly
ZXQgPSBwZWNpX2VwX3BjaV9sb2NhbF9yZWFkKHByaXYtPnBlY2lfZGV2LCAwLCAzMCwgMCwgMiwg
MHhkNCwNCj4gJnJlZ192YWwpOw0KPiDCoAlpZiAocmV0IHx8ICEocmVnX3ZhbCAmIEJJVCgzMSkp
KQ0KPiAtCQlyZXR1cm4gLUVOT0RBVEE7IC8qIFVzZSBkZWZhdWx0IG9yIHByZXZpb3VzIHZhbHVl
ICovDQo+ICsJCXJldHVybiAtRU5PREFUQTsNCj4gwqANCj4gwqAJcmV0ID0gcGVjaV9lcF9wY2lf
bG9jYWxfcmVhZChwcml2LT5wZWNpX2RldiwgMCwgMzAsIDAsIDIsIDB4ZDAsDQo+ICZyZWdfdmFs
KTsNCj4gwqAJaWYgKHJldCkNCj4gLQkJcmV0dXJuIC1FTk9EQVRBOyAvKiBVc2UgZGVmYXVsdCBv
ciBwcmV2aW91cyB2YWx1ZSAqLw0KPiArCQlyZXR1cm4gLUVOT0RBVEE7DQo+IMKgDQo+IMKgCS8q
DQo+IMKgCSAqIERldmljZSAyNiwgT2Zmc2V0IDIxOWE4OiBJTUMgMCBjaGFubmVsIDAgLT4gcmFu
ayAwDQoNCg==
