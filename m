Return-Path: <openbmc+bounces-1393-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKG7LARGlmmYdAIAu9opvQ
	(envelope-from <openbmc+bounces-1393-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Thu, 19 Feb 2026 00:06:44 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CE815ACA9
	for <lists+openbmc@lfdr.de>; Thu, 19 Feb 2026 00:06:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fGXF54PMFz30N8;
	Thu, 19 Feb 2026 10:06:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.13
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771442802;
	cv=fail; b=E1w7FJprJ4kClIM3O391RP8S8gf3kV58ccmrdqLXeYvUJJT5IWYD/HXI3BS+WL9E/vT8O+ZN9WAa1CDiyd6c00zJEFvoZIxZSsNavTyVdO75DCp8VvI7cMPas+kWxCOUmdyyL6YRFyYSPCCfPAwECn/0F4emnziOm/ji4Xp8OCCKxP0t5p6EP69x4qH3ia+Y58rGbaDNOOoZ5JzbAsfqEjWrw5tDJeF6p6d1UPOTAK6G/aXMSxwIjoPIdPCroy3aXFXdyz+ehokPFk8t260lTNxnnmdzEMlh3C77cKwcIXWcC3TxgkuMzbNmzMgVA/cn2PxOIsnxJhUf7Q+p/OCWpw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771442802; c=relaxed/relaxed;
	bh=pwjiBER1u0IqohJjUaemXuMeMa/Vh3H/oSQw+Y7FhHU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oGKxKsq8ZSseSZosr0J7rdaRmtZXHJCITMGrF1QWA3WwYmkuJDftXshY/7DlxeMTeQFqnUTxh1F9uB79Mv+m22DVJvoMsV5YjvSfjOdCbtR1olRhDlxlGEG6zHN56dE96ctL29S0j/D0pBNYNNmtHLQRq35tVz3XtvFpKzwn8E4NOM31kyFSWVM2j3vhvgyj1aIPWmWe4YfEOuSda1twfn7QBlDoCbg8nQLQI4ib4cnqKv/dN+Lj3BgDFu+Qqs8idthUpDjKEju3Dzta/lCp2GrW64VtUR0wGvmLEZjzwoFbP78FWL5ERgjkBNqziRr5r92gglZc8rmNBIKfbDWEVA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UTT7FmK5; dkim-atps=neutral; spf=pass (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=sohil.mehta@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UTT7FmK5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=sohil.mehta@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fGRMd6n1mz2xMQ
	for <openbmc@lists.ozlabs.org>; Thu, 19 Feb 2026 06:26:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771442798; x=1802978798;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bxqSJbgqjT9NLIqi9LQ3AIfROHNcI3dmm8Oaz/gLpzU=;
  b=UTT7FmK5YohuE/29moe7AHsansg3tg1rkuOSYgEY8Ay/HdwxEDasLbq9
   JEg1aZKOKGlmNOjfWqzZQVu5R364OvaGIuQWBKvEbxqo0NsPLV/5L+hUO
   I8vsqRcjOiUWP9Fv1/WIgpnCdDGGFYVReIqsNvhSFMU6kMte9Trloi8Sf
   BiHdmBykitvHVtDxT1gs4598gZpGnC/PYAB1filoip1WtIcJ5qUCEswkp
   JpPvWRzeHScAHBvm1eK8LC+lkjk3ibwrwSWHwhTg2RoV7+SfSvREW7Avz
   WgdGY4ph7OqaXf+W6LE4Y/4mNFt1Po04h5AgngNXHYNZs5uYTz+EzeCCD
   Q==;
X-CSE-ConnectionGUID: lzHaEAhiSGKo9qMxgzF9Dg==
X-CSE-MsgGUID: WQpBsrv3TdeB5vQYj4x8Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="75136445"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="75136445"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 11:26:32 -0800
X-CSE-ConnectionGUID: c43v3wKRQ22rOW8ua33vbA==
X-CSE-MsgGUID: U4dpQx7vQ8SxGWhQ11ZfCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="218424648"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 11:26:32 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 11:26:31 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 11:26:31 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.20)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 11:26:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iraKhtxWL4hB9PTADqitY9/jB7Fpi4YKiKJVvEJyd4MBSqeEjXScKrY0CdRiSMrFYOyWAEpgJw2BywpYbFDgE9V0ngakyCT+rc5v9sYB+srdcpw/bh5PpwWrUvcmSHB0OcY5RNGB5VSp9cekQ7xxuUgWpmaXJNypDq7j6cDGwwHWw0BLkocQvx+dIuZEXi5u/JP68szoPhcVXgxgQYSRtb+ZG4+pEVOJwxWfjIOiYev5R3xCmfNgAf2owJ8MxG5vb9fLYYtCFxaskVd8crY8lBdR/eXhE01X6b9jhM3/iltolh09MyeF+M+VYoPOFZWwnJpVA2c/60CPwuHMDPIr1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pwjiBER1u0IqohJjUaemXuMeMa/Vh3H/oSQw+Y7FhHU=;
 b=rp5bFDy8KBteblJNY+kAiBQb04x43Q6iINsaP40OICTcku/36IXSEK4tXpIIt+h//tv6usdTHToervsLXgnZ+/Fl9FXjLlqawK90YmyKiyswkwg+SESyvS51uJsyQI1D6IHJuAY0hb0vf23jpQNWEx+4xt4kr2nex5mXQtuKjoAzdEav3Qd6mCdIO9qsrZYOdTdumiLj5TgUiYCh9D2avMkVEdRM2HTWhVkYAvqzfc0/gkbJPQuvhZ5nPsc9SaJWY1wGeVHxQUDgBjfGeDnHVJlqoL4n/oO6R/ezTgXVbzkI4SbTVCxKbCIuPd6UhCynYgikkf1Vu5EDhU2IJZF+dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7997.namprd11.prod.outlook.com (2603:10b6:8:125::14)
 by SN7PR11MB8066.namprd11.prod.outlook.com (2603:10b6:806:2df::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Wed, 18 Feb
 2026 19:26:28 +0000
Received: from DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246]) by DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 19:26:28 +0000
Message-ID: <02494c50-8239-4e9d-b653-451728e5b5fc@intel.com>
Date: Wed, 18 Feb 2026 11:26:25 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] peci: Remove dependency on x86 CPU variables
To: Dave Hansen <dave.hansen@linux.intel.com>, <linux-kernel@vger.kernel.org>
CC: Borislav Petkov <bp@alien8.de>, Guenter Roeck <linux@roeck-us.net>, "H.
 Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Iwona Winiarska
	<iwona.winiarska@intel.com>, <linux-hwmon@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, Thomas Gleixner <tglx@kernel.org>, Tony Luck
	<tony.luck@intel.com>, <x86@kernel.org>
References: <20260218170301.D814B556@davehans-spike.ostc.intel.com>
Content-Language: en-US
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <20260218170301.D814B556@davehans-spike.ostc.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::23) To DS0PR11MB7997.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR11MB7997:EE_|SN7PR11MB8066:EE_
X-MS-Office365-Filtering-Correlation-Id: 93546ac9-7c94-48f4-430c-08de6f239ca1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?alY0YVI2TElZME1VeUlUSTJRTEV3N21ZZHR4Y2JzYjlZY0czeUJkd3d2VElE?=
 =?utf-8?B?SDJUcy9EaGs4bytoL2dSU2JhSDdkaFpZcEpGL1NDMnZ6NTQzOHFMalowS2dk?=
 =?utf-8?B?dTNUMmdFQUR4Qmo0ZDRadHJrbm5ubXNoWUQ2dllEYmNsTC8yYUc5Rm5sWUxC?=
 =?utf-8?B?SjlLQklSUTJBN2p2anRuS0ZFWUtwTWNtelY3c2ZiOWFMN3dIbnhSRHArVU5i?=
 =?utf-8?B?NHFadDNrNkFqSHArc0RicWFEbFZLM05MUGFOZlJyQjlmUjZYWU12SFhYVFla?=
 =?utf-8?B?VUJqZmJJSnlFdmltU1dSNy9ZTDE4MTJadE1TMitINmxwUFkzempzODFkOXh1?=
 =?utf-8?B?ZnVjMG4rWXBqajY0d3J0TDh4enBWWURRaDJpa0JxeUYvekhWeDdDcThlS21l?=
 =?utf-8?B?Y3llU0hKZWpaZUpkVzZnNS9qNmVFUENScTVJL1crenc0WndwV0ZReWFwRjM5?=
 =?utf-8?B?SjVYSXQ2Nmt1bnFjT2NwREdXVWcyUzZpL3JYOFlKRXFnNjF3RHBWdVNlNDg1?=
 =?utf-8?B?Y3dzRE5BTktnVjh6WEZDRWpuVHFzaEVDemhXcTlNQnhIeExKR0RRUWpmcVhk?=
 =?utf-8?B?dkh1ZmdWbnBCYUFwR2ZXODU5YkVJclJScVM2bFZEdWRiNmlSTyswQjJucjNt?=
 =?utf-8?B?V21mR09FWjcrNGhBc2hNUXRTWWh5eW1pWGVYbEtoU0tLOUVCazdndzk0bzky?=
 =?utf-8?B?eDBtbGZPaGdPdDRkTlZ0NVpSeVdjRlZQc0ZEU1RENlBxU1lHZXdEZ3lzSzVO?=
 =?utf-8?B?M3Rnd2VyNzRQTWFEc1NqcUlFVFJ0RURCMXVPZnZIMkpnbTdPTXNnYUdXcjZ5?=
 =?utf-8?B?UXlIYm5KdkcwK2h1YXNEOElmc3RLWUZHSDU3WjhVajkvM1haMXI2Nm9neWdG?=
 =?utf-8?B?Sk9pSm9MZC9RU09wMk9mSWU2bytqN205aFVhOVZybVhVanpZZ290RmV3ay9k?=
 =?utf-8?B?VjBWbVh1VE8ySTk3d2FyQ2pqU21tdXR1KzNMcSsyNHE3aHVFMUpJcVBoanJJ?=
 =?utf-8?B?cDBwR1NQU3dabjNCZUZ3V2hrdE9IWU1OQnJiVXdlTXBwUTMvSWV1aHNucHRa?=
 =?utf-8?B?UGhGU3R4WDcrM0JNM0lmZVVkMGdDVXAzM09BZHFvMEZBZXhJWDdsSUhXRXg3?=
 =?utf-8?B?NVY4QlRxVkgwbFZPbWh0UkVma0lxZWJHRm9raFJLYjVBVmdPRFVoY0czQWZu?=
 =?utf-8?B?dEp2UFg2Qk4xVVV3b3MzUGdOMHRFZ3E2Vlk5eFVibVVZUGxNZTZrVUU3SmVC?=
 =?utf-8?B?K3pnd1BpY1hxY0hHNzVyc3dqWnJMamhha044bmNZcExzV1Rta1BpNFNOM3dt?=
 =?utf-8?B?eXZsVGNicGZzNTBsWDFWRkZsRHRWVS9vV3hTZlo3UlZjNWQwUzkreHI2dHd2?=
 =?utf-8?B?UXp6M2ZXT0FjSWxxRWIyK1Z0Uk01V2o2ZWM0aUVMbnkxc1l5RHF0WDU1c2xF?=
 =?utf-8?B?MmpqK3E5MTlTeTFhWS9yN214OERLcmtuTDJIMTZsVXN1ZFVTYXZHUy9EUE8z?=
 =?utf-8?B?SFBaUExKL1JwcjdGaFpZVjd1aWQ1Skp5RThZSytvdTlES1RXa3c5R1JBNi9X?=
 =?utf-8?B?Nnh6ZTZLR1VKQ3ZubFd0eWZpZXR2anhTSGhCMURURkVwNE5xalVZbE44TFpv?=
 =?utf-8?B?R2NCdUx6cWlEMHpMRVFoOStxbDgxSVNzUnRSMEpBNlpOVlQwRjk3THZ6U3hI?=
 =?utf-8?B?Ri9qdHMzTWwvaHEvYWdGSkI3NGpRL1FIVEhEZ3Q1cHhWaWFuTmdhSlZoekVo?=
 =?utf-8?B?T2ZjRnV4WG9WTHNEcUF5T0hrcVRualdkb25kOGQ3Z29GNmtqUmMxNTFaNWtF?=
 =?utf-8?B?TmxPWld3YjUrbFE3Q3ZaMXNjU1BWU2lvc2ZySEJ5bVZtb1FhQ1Z0cndIelRn?=
 =?utf-8?B?dllxcWlGNDgwYmYxTm85MW1ERDFNRlFHdmk1UWFLbkVYOFYzTS9keXVVM0Zi?=
 =?utf-8?B?WlRtd3NxRUJuL1ZyMk01RUlWNG5sYVF5L3NKTE1KdEhCMFh0Q0p6MVovczZQ?=
 =?utf-8?B?R2VrRHg5N3JyNFJhS0M0UCtYSnJSbm9BZG82dEtvTlNkbnVRVXBQKzNVamJv?=
 =?utf-8?B?cmoreWtaUXV1NTdmMGpzOGpBeW1jVjJSNk16ZWFLMjJTdUFRRUFPeDl1MUsy?=
 =?utf-8?Q?TPB0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7997.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmxzTkVBRXZzZURid01oQ2llL3A0UlZlRHhudGdGeE5rbWJsZ0ozSm1ieWtS?=
 =?utf-8?B?azF0QXNJNEo4RXovYjIrZjZyQWtmMUpyOWxOVm1VRFBpTEIza0JQOGQ4Ylpa?=
 =?utf-8?B?NlNjY2w3eFZjeEJ4ZHJnWDhENnU4cFJIQURKUm1wMDZIeVh3THJjS1Fabkhn?=
 =?utf-8?B?WDZFVFFSS1dPc2NkQ01wUDBEZjM4QmtmMnlhQ01sdWZuY3JlL1JoUitXSU4r?=
 =?utf-8?B?endlaWRpeE9pNHJRcTJnY2tHR3JGR3Z1UngvVGxldXFMQnpZZEk2SWwvSjln?=
 =?utf-8?B?MkErYUUydUVUSzdES01Jd0NBck9uTmtmckxqcVpTQ3VBdmd4NlU5V3RkOUJM?=
 =?utf-8?B?ZzBwMkhJbWhFNE9acXFwTEFDVlIrMXQzR2NyZ0lUaGVQZXh5bG9kVldBdTJl?=
 =?utf-8?B?djNyU0o3L0twWitkaWZWcTRZYjhOd1hBRkpIUDhvWWxiS0M0MkQwY2FxTlF0?=
 =?utf-8?B?N1lKeXQ0akErbWV5eld4blJ5NStXUVZaU1BkY1BjNG9XTjErcFdHT1gxQTlB?=
 =?utf-8?B?dXlxYmhPdUExeFhxSXY4ZHpqZWxMZlRHQUthSHNnT3BGemdjTitlWXdQZjJJ?=
 =?utf-8?B?RXFUL3R1cm1LR1I2UU1FVWF1VGJTdGlma0tLRFB5YU45Vlh0SHUzallPcmJQ?=
 =?utf-8?B?dWRodWpGODZhQ1FLMEZvZG5DVy8rQ1k2eHVrd3NzL0FLcC9EaDVLR205YVhK?=
 =?utf-8?B?amFJM0g2L1JJN0J4R1QwaUtLVThXbFR1YnFZMFFueU84cmRJNVhNeFpDc0dG?=
 =?utf-8?B?Y0J5T0hUN2NULzRrVlRhVEl0RVJBazMyRk5jNnJiMnBOZFJSM3JJVmRVa3Zz?=
 =?utf-8?B?Q1RiMGw2WjZZb3BtRWptOEk5ekJYZ1d1cmpYSllUYmk5VkVQYlhmeXpiY0Qy?=
 =?utf-8?B?R29TbmpIWkgwS3BZQldLOXBIV3FQSW1RZFAyT202MWhpWlArNWlHMmR1ZklH?=
 =?utf-8?B?alM5OXpUUjFHenIzSjNJMCthQkdqNnhsRHh3WEdDMjBwNXlPKzI0Qml5aFdm?=
 =?utf-8?B?S0k1Mk5VMTFxL2NSN1R3YnJIbExNYXlYS2pLSnh6K2tMZXdRcHpyOGlpNTMy?=
 =?utf-8?B?MkRXeE5uOFVOSWw1d3NiTHpPbU01SXVuZlcrZHI5SHJJVC8vbVlKVy9uWG9m?=
 =?utf-8?B?RHR3N2V1WFpaQWZaVGc3eU16MnRNUUZHd3E0SHpSM0UzMFJCcW43WGEvR1Iz?=
 =?utf-8?B?b1ZBOFFhMUFab0xvbHFNdkk4Rm1kUUlnRmtJaGlIcmZpblN0MGZsMkhxMUZV?=
 =?utf-8?B?b1dHWklab1pBR2FHOHRESm1HUDY4cXZ3aTgyUlNZODAvMlNmVjlLNExJZnZ3?=
 =?utf-8?B?aXlOZ1B5R1Z6R2VHOTVhZ0hTVUxibkxHdFZvRGp0a0U3Y2RXaEVrN3dBZSti?=
 =?utf-8?B?M1BRbC9zQzRZMUVaKzcrS3FVL3RwcWw0a0pBU3RqbnhhWE51SmZhUGxtYjcv?=
 =?utf-8?B?YmZvZ21BVjkvZTBpRXdsbU5tUUxBQXlIV2V3QU45NlIzcnlUclRGbjhlUzhz?=
 =?utf-8?B?R0Vsd081TFlZbW1XSW1XU2Jobkg5VG1UZk50MW5kUnM3UFNucVBXeXdEOGpw?=
 =?utf-8?B?ZlNGRVpuZlB5dTcvRzhiaHB1S3ZBcWFxVkJvanczL0JLcVgwT0l4UmVOUTZF?=
 =?utf-8?B?TnlhckhFbVEvSCtWMEE0alhhSUVKOGQ5SlhmSk1pSjk1NUZySzhsWlg5alJi?=
 =?utf-8?B?bEJXVVljMkhqNTV2WlowZ0RPa0drMlpSaFJmM01JV2pueTllc1lKU1lhM1Ro?=
 =?utf-8?B?L2tVcm9pb0lMVXMrQVU3OG45RDhvYTc3bVlSQVZaVjFtVG55bjgycVZLZ1ZN?=
 =?utf-8?B?dW5neU5UNG4rbDZ2UFpKcVdEL3kwanFzdnJ6eTY2MnhZVjBiY1lpNk1GcHR0?=
 =?utf-8?B?OWFQNXR0NnFNcU9pSXZ5YlFzZmp2S3FsNEtKay9xY3VCM2h3MnVrUGpBWGRS?=
 =?utf-8?B?cEgwOHJVcFh3bkFLaWQzbTJiaU1DWTd1TDZUODRIM0k0OTlrd0tOc2gwK1FR?=
 =?utf-8?B?NUFTTTRGSGphZExySHYxSnZCNXNJT202d0ExVWNYdENZR1QyMDFvdk4zWE9C?=
 =?utf-8?B?eXdPZGtmakJhZnIrRHJnMGtEU1J5UU1BMVo2UzUxbUxuZTR2dzZNWFJHYWZX?=
 =?utf-8?B?Z0VvaEtkOU1PcnhRRFFaWGJoMlNmV1JkSStTQyt4ZitOV3dZdGJMNTJQaUkx?=
 =?utf-8?B?VFgrNW1SZlpXUExzck53OFZwbStNL2wxdjE5SWJndlVPeERFZE1WMXJJUldN?=
 =?utf-8?B?a0Z1Ykk1eGlidnBJUVgxSUdlVWJsM2hLWjY1K2FETlQxT3hnWWROY0h1R3Jw?=
 =?utf-8?B?RGdldmg4djlrZnJ5Y2xETTZ6cnVCMlI5QUxheXpHc2FpeHdPcDQwQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93546ac9-7c94-48f4-430c-08de6f239ca1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7997.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 19:26:27.7465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YoC+4YKIme7yoWUtfM1dx+U+Yf7zPyuHOMi1BpPondOUe0YB45MjBOzd+v8sOGibjJUCcqjQK0Zt1Y9U4WHlIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8066
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.20 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-1393-lists,openbmc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[sohil.mehta@intel.com,openbmc@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:dave.hansen@linux.intel.com,m:linux-kernel@vger.kernel.org,m:bp@alien8.de,m:linux@roeck-us.net,m:hpa@zytor.com,m:mingo@redhat.com,m:iwona.winiarska@intel.com,m:linux-hwmon@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:tglx@kernel.org,m:tony.luck@intel.com,m:x86@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email];
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
X-Rspamd-Queue-Id: 08CE815ACA9
X-Rspamd-Action: no action

On 2/18/2026 9:03 AM, Dave Hansen wrote:

> 
>  b/drivers/hwmon/peci/cputemp.c |   10 ++++-----
>  b/drivers/peci/core.c          |    4 +--
>  b/drivers/peci/cpu.c           |   16 +++++++--------
>  b/drivers/peci/device.c        |   40 ++++++++++++---------------------------
>  b/drivers/peci/internal.h      |    4 +--
>  b/include/linux/peci-cpu.h     |   42 ++++++++++++++++-------------------------
>  b/include/linux/peci.h         |    2 -
>  7 files changed, 48 insertions(+), 70 deletions(-)
> 

Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>

Everything mostly looks good. A few small suggestions below.


> diff -puN include/linux/peci.h~peci-sanity include/linux/peci.h
> --- a/include/linux/peci.h~peci-sanity	2026-02-18 08:19:42.371396743 -0800
> +++ b/include/linux/peci.h	2026-02-18 08:19:42.388397383 -0800
> @@ -72,7 +72,7 @@ static inline struct peci_controller *to
>  struct peci_device {
>  	struct device dev;
>  	struct {
> -		u32 x86_vfm;
> +		u32 device_id;

There is a kernel-doc comment on top of this struct as well that needs
to reflect the change.

>  		u8 peci_revision;
>  		u8 socket_id;
>  	} info;


> diff -puN include/linux/peci-cpu.h~peci-sanity include/linux/peci-cpu.h
> -#include "../../arch/x86/include/asm/intel-family.h"
> +/*
> + * These are in the format of and match the values of the x86
> + * CPUID.01H:EAX[19:4]. They encode the model and family of

Can we include the extended family bits in the *comment* to say
EAX[27:4]? I expect Family 19 (DMR) will be added soonish, which will
make the comment stale.

> + * the CPU with which the driver is interfacing.
> + *
> + * All driver functionality is common across all CPU steppings
> + * of a given model, so the lower 4 stepping bits are excluded
> + * from these IDs.
> + */
> +#define PECI_INTEL_HASWELL_X		0x306C
> +#define PECI_INTEL_BROADWELL_X		0x406F
> +#define PECI_INTEL_BROADWELL_D		0x5066
> +#define PECI_INTEL_SKYLAKE_X		0x5065
> +#define PECI_INTEL_ICELAKE_X		0x606A
> +#define PECI_INTEL_ICELAKE_D		0x606C
> +#define PECI_INTEL_SAPPHIRERAPIDS_X	0x806F
> +#define PECI_INTEL_EMERALDRAPIDS_X	0xC06F
>  

The _D has been used in Intel official product names such as "XEON D".
AFAIU, The _X notation is specific to intel-family.h. Should that be
explained in the comment above?

Something like:

 *	_X	- regular server parts
 *	_D	- micro server parts


>  #define PECI_PCS_PKG_ID			0  /* Package Identifier Read */
>  #define  PECI_PKG_ID_CPU_ID		0x0000  /* CPUID Info */

