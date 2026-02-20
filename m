Return-Path: <openbmc+bounces-1403-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id k11dKPuLm2lN1wMAu9opvQ
	(envelope-from <openbmc+bounces-1403-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Mon, 23 Feb 2026 00:06:35 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA1B170AAD
	for <lists+openbmc@lfdr.de>; Mon, 23 Feb 2026 00:06:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fK03W5Nhwz309C;
	Mon, 23 Feb 2026 10:06:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.13
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771611314;
	cv=fail; b=dDpsemKlqxiZWMzDntexGc5rRgIoAzOghFjAIt9vvQI0+MsC56LNqCgq64rxQHQejTTZdeNJDJvBWj0ZbaFEmPFSYr8Fr0jgJrCIHsfhnZ/x7ksGWmAh0O0+caKrmyKbxQ5qQm7Aa7npYGIetPYfTnbQibmM37owzK1UIJKmT/XY/La4Nm3a3Yg5wYnIDPQ6dspCyXOoBO8yX8z/cgePfNMMfQt7jK7oq1mZsHHGLyjJL5zDaUh+mzRJkDdEWO/VGnwQN7gdeU/hvvVVk87gzc6hGBGsscwpfDPva56vh3h3Md95yJw+lqeLyiVj/Qx+t3JUvHw6rgH+XXPJlY4ASw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771611314; c=relaxed/relaxed;
	bh=yqORJCjCAdfz2nvQV10udQDOoUga3ZnLjUY9Edxe88s=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GtmKUW1Ghy+6itUk7GnN98T6Fdu/rrgYmcx5fnaMzPhx9zIaj8hJlZ51B6oDUS09I0GK36fWjcyi5ioOCVkOBPl3tpKOWkBjQAib00uaQ5cDOXFjzgoumDOeUaCsUN1144JVTgU4EiCZCD6AIdSj8QU5T9zyHOby6VkoBFSDGASoT8RBCmfITP+iGwtFsXHCevvMo3LPMhtCM70d5T+SyJwu3Pat8OI6w9tdD4tZyZX/Z67fud1oQeMW1gTt2uXmvfwjIWJntabEX5+QdC8lKq+LmymiIbtm09qcJMMPnJRl+If0BVdXB8HUF8+5jQ/2RE/P2x1S3PMF5iU1FZJHLQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZEtSEfX7; dkim-atps=neutral; spf=pass (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=sohil.mehta@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZEtSEfX7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=sohil.mehta@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fHdhH4RDGz30Lw
	for <openbmc@lists.ozlabs.org>; Sat, 21 Feb 2026 05:15:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771611312; x=1803147312;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qXfmqHFlRr12dRe14dst+EK8q/Tn6HyHv7AVmexjTpg=;
  b=ZEtSEfX78je38SmN6+52MCVY9fGUMJRtInqxIoNjWyRyfQCVABxezL+4
   ukPoJlhkW9PrA+cKKDyMEy+kB+VDa1KtoADgNhIR4IVNP+HwklLHVadUD
   vX+R39bc+xy9sZqngkwPGQbhcVeOxG9jejQQ2u+GVN8bzbDeEkPQnnB2U
   JqcEKvbg+ixDWVSxOg1gbSb/M2iIu2IeyVGD5qQXvWjEV4qR/BLhr+oJ8
   eqO55ZjljzqtPo87XkMJAA4ZKMe4IJVRGfrx75v3Y3OT4yWZy9HaWJ8Pi
   bOawGKZAaYU0Tdh88RHv7bONPxV7MdT8d+BIFLmwn9b9xbPzx9owPasLL
   w==;
X-CSE-ConnectionGUID: joEsZ8BRQ6apGi0mGMubUQ==
X-CSE-MsgGUID: qeHhSwF/TqGoza2qKmiFfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="83810980"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="83810980"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 10:15:04 -0800
X-CSE-ConnectionGUID: gfaCNP3UR4Weuh13ugvlvA==
X-CSE-MsgGUID: 7cTZ2078Qa6c8l0f/vZxsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="213951850"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 10:15:03 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 10:15:03 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 20 Feb 2026 10:15:03 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.39) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 10:15:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MtcGh5MAOCJavX2SDi0119lQmEYmXHWZP9doN4942jazRkk9zUej7iP9r0U9Z8z/trBFmZ2WWX0rUW2QzSWO2oCBwl3sf9Go5fAayi7bw+Uf7BisqxB+DYXWYwz9EhjRzEat8Zq3TPqZ93rMhBRHbQklBNAoRZDx9Zdjnyit0TPsAdqj/LAAEIU6WxhyLgoQ9A9sfhn0v2DH+Ps8fyYKzn73VgZKPfpFnbmo939Pi5t2RoPnm3q1rsuFTh1YMbIBSWZNw7JmLqmo+ZddzbIZxdTZhMRMhzNK6eutcfsoPKiSJA3ST6f6MiWgzFXJ7UcH8PLJu7HYSYSiJsriKrK68w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yqORJCjCAdfz2nvQV10udQDOoUga3ZnLjUY9Edxe88s=;
 b=OmuauTFKjk0Brx6xTfLGk/20HCouUf2jS5EobdfbCzW5avw3cqJNTu8UMpoQE7MzduZTQDPEDxYGAnCOz1yMzHy20L3JqbXdN9xRvuoG6aHudkI4k+ZEXW4zsTQgf/YyN2jQQ/MIO8n3Rxk3DVTwJmejevOThhOky3RWj9aIdn/KeJOngubmsuvvvAiyVb7+ok223Bu6vaZ7c8GA2OXkP3puwkWbJPUTO6QqNlNw6RalkI6vgTy2MgyUchTThyku8AbN2M9hxLZtGAVxktLaAKJxiQBuGiiALA0wZQfuwU76II9MqLN7nrkF7o1Lk9WWJuBcvk/8ittjPKyHImFZHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7997.namprd11.prod.outlook.com (2603:10b6:8:125::14)
 by DS7PR11MB6200.namprd11.prod.outlook.com (2603:10b6:8:98::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Fri, 20 Feb
 2026 18:15:00 +0000
Received: from DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246]) by DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246%4]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 18:15:00 +0000
Message-ID: <b59da36c-4ddd-4cd9-98f2-b5a1db698889@intel.com>
Date: Fri, 20 Feb 2026 10:14:57 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v2] peci: Remove dependency on x86 CPU variables
Content-Language: en-US
To: Dave Hansen <dave.hansen@linux.intel.com>, <linux-kernel@vger.kernel.org>
CC: Borislav Petkov <bp@alien8.de>, Guenter Roeck <linux@roeck-us.net>, "H.
 Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Iwona Winiarska
	<iwona.winiarska@intel.com>, <linux-hwmon@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, Thomas Gleixner <tglx@kernel.org>, Tony Luck
	<tony.luck@intel.com>, <x86@kernel.org>
References: <20260220175121.C16ADAAA@davehans-spike.ostc.intel.com>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <20260220175121.C16ADAAA@davehans-spike.ostc.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0005.namprd08.prod.outlook.com
 (2603:10b6:a03:100::18) To DS0PR11MB7997.namprd11.prod.outlook.com
 (2603:10b6:8:125::14)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7997:EE_|DS7PR11MB6200:EE_
X-MS-Office365-Filtering-Correlation-Id: 65e8838e-fb4c-4c6a-133f-08de70abf5e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OVhuRDkvbS82OFdrZVJ2eUNjdC9wZFdGdXI3SVJDYzdBbkdKYVVWTUVOUTBU?=
 =?utf-8?B?T0pCWVN4Y3JXTURrMlFJUHY1b1ZKT01BYWRRVjRmWkpqOU02RU1aakJsMjg0?=
 =?utf-8?B?d3Q4NEFqejNuQ1BMWW9POUhQeFVTN3ZPWCs0aGREVE9UU3U1aFo5MU5oQ1RG?=
 =?utf-8?B?c2NHTzJqRzdpRkZMZ1Z4WWJEeE9Oakh4Uml6REZLanM3dmZsSlZKUEdqWU05?=
 =?utf-8?B?TmdvakczeEJETnBhbHB2aXNLd3oyQldZOHNadmlZOVVSc1l5eGhkWWRmejdO?=
 =?utf-8?B?QnlmME85ZTRIb1RKMjc4UklqSE1yT2p0OTJIaTFuSlhUVXE1MXdQcm9IdStl?=
 =?utf-8?B?cmhqVW9QL251UGhpS1ZyOTlraTZDTTM3Y1pHZzZwN2JiU2NZS3RmVFVKYktZ?=
 =?utf-8?B?dkVQd2lla2FFY3AzeDNOTVVaOExFaGNVTnFZTU5Tc3dtdmNmTjF2Rk5PRDEx?=
 =?utf-8?B?cElhTmowMkxycEVEZGhIYW5reTY1eEZJNXNmVnJFTVVpUUlzVVVSbzlCVlpn?=
 =?utf-8?B?VHFDQThoUkh5OTU3M0VJV1U0Y3JTWC9zZUY5cjZBYy9BMkRxd1pOcUxjTkFE?=
 =?utf-8?B?b0JEZXZPV09xZlZ4ajc2M1pUUzgzVGl3RTUxaG9rV1JCb2JDVzNOZVkwd2pj?=
 =?utf-8?B?VFVCdHhrVHI1N1pqSkxtYWRrRno1NEhsVzNFazdOUDNlMFZ0MmlrUkNDa3hW?=
 =?utf-8?B?ZXFZR2lsMVhjcHpaby8xYXJTdmxrdUxNOUFheStZRjJYdVdER2dMVnJWUkRR?=
 =?utf-8?B?cmx4M1hGaUVua29GYkRUOUp4bGVaRU9zellIei9RMHlIRk1FdkZSeStyaFVT?=
 =?utf-8?B?M2tTYnUvR0hYeWR4NWZZY3ZxK1ZyWGdmYVlRak9oS2RQdE9jZjJQSm9MQWdI?=
 =?utf-8?B?V3A5M1B5RGUxT3J3VzdPdGlPM0I3ZHJtZ2ovaC9hNjM1UG1UU3pHS1RFbkpa?=
 =?utf-8?B?c3BaaTMwM1J6TGtYQTZvVkIvRjJuQ2xWbEVqY3hydUZDOTM4OCszUkxzYXhq?=
 =?utf-8?B?Wnl0a0J6eG0wazh2RVNxUnQxWmYvSVFnd0lPeCtGRlptMEduTGZUVjBBamFn?=
 =?utf-8?B?R1drM0pRSmgwNURsb281R3o5a2w5dmNPYmNnQy8wZ2VKdHZabnJydjBoSGYr?=
 =?utf-8?B?b2NUMWNNc0ovR0IrN21Dc2RxcDM3VHkyMWRqZ3FMUDBpMlFxdmRGSTQxU3hj?=
 =?utf-8?B?REpPeHV3OWdkYzAvWWpFL1dsTS92WTRZUzVOOGorZHhPQ1hlR2ZrWlg2ZnJI?=
 =?utf-8?B?TUdHMVByOWRVMUUxSEs4SEFXQmdyR0R3ZkhMeHFPQlFKeVZ2WGtGd2JnUHZJ?=
 =?utf-8?B?ZTN5cVMvcXRHM1ZBcERjMVNVZGlWbEFxbmJPano3SkNLQXMwcUJCdVZOajg3?=
 =?utf-8?B?TTZidStBcVNRS1hmMDFPS0p2REc0QTQyTDRhY3o4SWJNWG5ydkpMUHNjaUhB?=
 =?utf-8?B?UEluRDV0UDJpOHZwV1EvTG9LQUhiLy8xeXNaM0d6TWgxWWdmSHl2MmpRTXN3?=
 =?utf-8?B?NUNMNEtSeCs5MTd3RFBzRW9vSU5YbEhKMC96VkJyWUxJN2N0aU1CY2NCSUxj?=
 =?utf-8?B?RlF1cmF3SVZ0YzI4TXJGQUlaMUtxa25DbmhaQzZRRlJrWmVXY0RKNFBUQnRx?=
 =?utf-8?B?RzQvV00xVjZXWGZhaFIrSk9YNDhUS0tDc0RBdzhLS01DZ0NEMnVEMVZoOUlN?=
 =?utf-8?B?Wk54NENTSWRmT3hZcWs2dVJsdGlVNnZWNlh3VEJxN0Q5MGRSYXI5MVVwZm0x?=
 =?utf-8?B?ZnBZNHZMUmVDUjBHK2MyUE5UYTE5aUtSMzFXQzcrcy9ibEJvU1pGQkFpZ1po?=
 =?utf-8?B?c29iL1VtUjZ5THlsZmpGdlY5ZGEvS3ZSL1BTUVZOUkE5TG9uUU83OE5qZm45?=
 =?utf-8?B?RzlZRUlHS1RwN0xacW83KzA2YWRLMFpzT2d2TVN6bS9TeWFZL3p6QldkVWhN?=
 =?utf-8?B?YittQmYwUnVzYkJjb3RJaUQxNnJIeTR3VkIzTGNKRjZraUo2VG9aV0lld1ND?=
 =?utf-8?B?OGx2WkRXdHB1S2xRNFdBMG5Jd1hUM2grS0tRb0p6UEpIejBRNllCZEpGcGlQ?=
 =?utf-8?B?Qjh2SlZCSTdoMS9IeWRRVmdtbWdvcHE3NTlocGFsblFkR01wbmhFRE1EOFM4?=
 =?utf-8?Q?UoHo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7997.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmxIYTB2bWFOeldRcEI3SDYzOWl2d25ZNWluK0MxNm43eWVNeUd6L25NVFM1?=
 =?utf-8?B?RjIrV1VxSVhERU1hWUQzSy9WOEV5Z2ExcHcvNjg5S2JpWjJGaXJOVitRclRP?=
 =?utf-8?B?VHFBNEFOR2VKSFhwSHNaSTBTT3lqVFdYRWNuZHdhSGUycDJ0K1dFTEF0djVX?=
 =?utf-8?B?ckJWdzhZWURQOGpGRFkySk9ZRUFiMDNBZDJJSEh4RUx2UWxJN28vVmFRNlcr?=
 =?utf-8?B?SUovUi9QbWQ5TFdUcDdFZEFYeFFXSmJxVm92U2FhQWJCSXRxcXJVVUs3bk02?=
 =?utf-8?B?Sms3T3lVN0dtVC9PWjZlWEdMQldHY1E4c2FEMmFGN2c0SEk4b1pjMVk1Vm14?=
 =?utf-8?B?NmRETElqaGthYnpRcHM2OWQyS2FzQVM0MTg5RTRGSWJiNWc2T3AvakxrTjBj?=
 =?utf-8?B?TEhjbE9Bbm5RNlA0bVkrdTF2czB5ejBpSng1NXI5S1JCUS9HUm9NWUFYL1dl?=
 =?utf-8?B?RnNtTEZFSHdxRGNoNTNtQlRNdUNlZUxySDdYQndVVGJWbHQrTEx2dVFhdXNE?=
 =?utf-8?B?M1M2NzExdXFtNG9nM0VhTXhvb1BSSW0zV0k0UU45M01XQjUvRVRrZFJtV29E?=
 =?utf-8?B?VVhPZ2FtMDUyV1UybHJJT25IUGpuYkpuajFiSjZqSUZuS1RLaDJXbXpyYmNw?=
 =?utf-8?B?dmdoNzNzTkxKUFhZMTUxZEl2Zy9HNWJHNGxTOTQzTTR4T2gzcVJ5TE9VLzhO?=
 =?utf-8?B?L2ttVVVPb3hFZ1RFSXZ5bzhubXlFeGx1ejZ1K3Q5K3RFOG5SQXNMbGVnM0JR?=
 =?utf-8?B?QnF1dFFTc1paNFB2M0w4OUJxeTQ5dVRhdXNJTllUbWNncWdqQmFjcnFaUGhr?=
 =?utf-8?B?Qm95ZFJLUndGZjRxaFdONnZHWGNRdXVpWFhVNkZLQ0pVK2tIcTNIazhpUkMy?=
 =?utf-8?B?MTVsTFU4d29KWG0rM0EyTzYyOGo1cExzeEFnTDl4NzlBUURUY0s2bmlnVkpt?=
 =?utf-8?B?bnh3aDc5Q1lndjFyTTgxWkE5MWJpYmwwL2NMZ0oxbHlZQlhnRjJ1cnByMGFw?=
 =?utf-8?B?S2ZOeVRZTXF6RlBrMHRzdWg4ZW9yWWcxV1Y5MjJ5bUVkRnFuZXhkc0N4VlNq?=
 =?utf-8?B?S3lDdlR6REtwRENzaWRwUEdIdUZhSll5ckNZN2g0Rng3ZkowMzlJbW1rNmRC?=
 =?utf-8?B?ZFN2SW9HVjlQWXBNVDl2OFU1Qmsrb0wrWWwwOHRKOXJIUk9BTGdCd2pXTG0x?=
 =?utf-8?B?a2RXQlhKRzdTNVVPTURQZ3pyazJIVnV3WC9hQVlLbE10RFBiODhNclNtS0JO?=
 =?utf-8?B?OHNNMENuQkIrWUpRWm1GNTExREgrTy8zR2xwcGxEZDBvQURMRTYvMko2dWlh?=
 =?utf-8?B?L3hhTmk0T1hIYWU3eloxV3E0cGNiWDFscnJwQTZBdkdFN1JSb1ZEMng0QTdJ?=
 =?utf-8?B?L0xnak9YSy9lVWcyQjZ1cVZKQ01takxpQlovLyszVkZORHdaS0I2enczbU1p?=
 =?utf-8?B?OUVORjFabzJMbHR3OGRRL3J1Z0drQVR1R0V2ekdPVjl1eVBXOC9sR05kczJP?=
 =?utf-8?B?T28xOEtDcjI0dzZkM2NxcEpYUnpVU3U1Y0NIS0hwVTFxT1puMzNlV204N3Fm?=
 =?utf-8?B?a2pNU1UvUk9JbThYY0F4U2JKKy9YUnpDRHNDVnNZYThtRXhJSmJpVWVPMWsz?=
 =?utf-8?B?K1VyQWhNeVB5V2NDNlN0NEtwNFJIRWZhSkl2RVlFYUpUNU1PUFlXNVI2cDNl?=
 =?utf-8?B?U1VYMlFFaDZpWUdCOUpNVm5tRzg3VUEwcmVFVGZWQmlZRzN5UTZrdEpvZG9T?=
 =?utf-8?B?bG1ZNG81OEJPc1JTQ2Y3WlpQaWQ4TWtuazdmRnJQdGMwTE96emlEUnZMTDRw?=
 =?utf-8?B?QTRlRGk4VDlLUzZOOCtRY2s5WnZINnNNQVR0UjlRbkNzcEkvNVppeUh1MmFo?=
 =?utf-8?B?RjVwTlYzdFNWRWZ1eUNBMUl6Vjg2ZzdyL0VjY2laNzIzMzg0UVlXOGJ3Q0Fh?=
 =?utf-8?B?ZmJ0RWcvRm5lSVlBdUp1RGFhcVlTaU9hVndKTWFBVy83Y0Rnd1dnQUtjbGFC?=
 =?utf-8?B?YnB3SE50am1WZ0VqNGhMS0EvZ2tlekpTdGs4SXpna1VtbFRKMDRtWnFYVDF0?=
 =?utf-8?B?WTlVL3poNXhEN0Z4L3VieS82NDBZSWdnU05Xb3VsRlRxL1NLMWFHRDNBNFA5?=
 =?utf-8?B?bjl1YXpjSm9xY01tSW1HWnZBNkdrRVpSQUdYWDE4MG9zYkZwNVZpY1ExU0Ja?=
 =?utf-8?B?Q2toT01wazUxc0Z1QVlWSWRDUkJ2OGtFRFBuR2tsbW5vc2hCcGJtaVhTYXpG?=
 =?utf-8?B?ek5EM1o4U2NXNzcrRVh1YmZWYlpCeHlhS2JUb0k3RHpPTjRpZ1ZHTlg4VXpr?=
 =?utf-8?B?NzJUNkp3MUZBSTMyazJTOHZLWEhvZ2N5ZDJLYk1FUmQwVzNBTTRpdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e8838e-fb4c-4c6a-133f-08de70abf5e8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7997.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 18:15:00.3220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r5T8uDo4tiJ+Ir+RzTAn5WZWS0IWpx2nCYPbFTPEjHPiOcbExPjd4xxqZbW7dlbjS5AMxY4XfhszXggXXwh51w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6200
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.80 / 15.00];
	DATE_IN_PAST(1.00)[52];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-1403-lists,openbmc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[sohil.mehta@intel.com,openbmc@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:dave.hansen@linux.intel.com,m:linux-kernel@vger.kernel.org,m:bp@alien8.de,m:linux@roeck-us.net,m:hpa@zytor.com,m:mingo@redhat.com,m:iwona.winiarska@intel.com,m:linux-hwmon@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:tglx@kernel.org,m:tony.luck@intel.com,m:x86@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[sohil.mehta@intel.com,openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[openbmc];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: ABA1B170AAD
X-Rspamd-Action: no action

On 2/20/2026 9:51 AM, Dave Hansen wrote:

>   * struct peci_device_id - PECI device data to match
>   * @data: pointer to driver private data specific to device
> - * @x86_vfm: device vendor-family-model
> + * @device_id: device identifier, includes CPU vendor-family-model

Just a nit. There is an inconsistency between the two Kdoc comments.

device_id no longer stores the vendor. The one below one is correct.
CPUID.01H:EAX only gives the family-model-stepping information which is
stored in the device_id after removing the stepping.


>   * struct peci_device - PECI device
>   * @dev: device object to register PECI device to the device model
>   * @info: PECI device characteristics
> - * @info.x86_vfm: device vendor-family-model
> + * @info.device_id: device identifier (CPU family-model)

