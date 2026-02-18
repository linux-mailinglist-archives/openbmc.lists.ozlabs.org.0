Return-Path: <openbmc+bounces-1392-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKcAE/1FlmmYdAIAu9opvQ
	(envelope-from <openbmc+bounces-1392-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Thu, 19 Feb 2026 00:06:37 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 669B615ACA2
	for <lists+openbmc@lfdr.de>; Thu, 19 Feb 2026 00:06:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fGXF463rgz309y;
	Thu, 19 Feb 2026 10:06:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.13
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771443427;
	cv=fail; b=nAeGxLKv9L2vkfjXrZROLzyaG3jFctSVkfcAx8ZPHv3+f00PTc5LtI4kj38FcorVrXXNtxXfEJosu+M2R5WwoTovk3hzndh+ei9rvaKRWeiFERG+fP5gjJgmbWErSpFb03L4+Q91mHgw4zaJz7cYfQVzM18LFvOmLCIIwibNYG5zXj+0vtx4KrzSYtIEYq9PMXojRGdGsPPZSedUBtuo03m9TzSTXY1Bo5l9IaPJ8jXvpgKNrvJB+14WZlEkJpdzQtpT5MuSnBtG+ssG4ufo0OW8XGxi/cXvh3pbqT89DkGBUCqDLYhCwE9o2wApIKxxk0PsMaIjxXmmYQYyCluBlw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771443427; c=relaxed/relaxed;
	bh=jOKjJynqWmceuI95sDaBCC7S+++/s+KkQYuDu46nMRE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NGfeE+S/OEeTJDjZN+dw9eVbuulcuPJOwN9MLCNXRqS5BXt/cXxkPQZNC0ot3ZNuhiavEERB1bfL/yzt2vNJHdER3Ej4qNuqBuyItzgh9C/wxlD3eUe3wHbpVxjg2B8n7L95LEQ6LlGQYk4ynlp+l6DhUlh82eRN2x2bEIoXRoKfYsygVOc38BtyY1YN+J+1N3u5u9ZVmWMTV+Wkktde6jxZlSCuG7CIDJ8Mr7WM9MsMcNfjQK5AUsFZ211FgWjF+A4wxQxUNuga8axT6x3wKB4zCuqSOjp7W58oOHXOFK+P0MFEHbbNvZ+BlmKeIMcd0QVlUOp4AGUwTggbb55ZAg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WTib/c9/; dkim-atps=neutral; spf=pass (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=sohil.mehta@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WTib/c9/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=sohil.mehta@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fGRbk2jltz2xLv
	for <openbmc@lists.ozlabs.org>; Thu, 19 Feb 2026 06:37:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771443427; x=1802979427;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/WeIVCxzUk7XMxoWxeXCzWpOMvmyiHEKy+PERGdZLag=;
  b=WTib/c9/6RijUm4om+a14/+sr4fKoGJrQedsTBl6V1quFjkeOyCu3myP
   1rN8V6a+dpIouoSB+uoV2dwDSMPHrn55cQmzRhYISG31Dl3i/KEDUkmVz
   FR64Jkq4dTh1vWHwjA/uMroRnPUcrFtLBBJY1CqnIfo8iSMwV+MVSpvp7
   qiGRiHrAXB1KQdpJdBCFAaUtayK/CvU7SifefL5P6Pi0jwPquL+hfGho7
   oB/sEMqE85Od+I6HBw3aTD5fGUuQbjv+2lP55JNVRmVHOE1kElWQmwy8g
   D82jvB1US8UMBXC1o46yFmUOC03/CqAL5c4Igp8q6fW+y8r6CQ/VfBB9h
   g==;
X-CSE-ConnectionGUID: 8QfK9YZSRgaLbRSWR1XXYg==
X-CSE-MsgGUID: NCY3p4zJTciqSnZWwf6Sjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="83631707"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="83631707"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 11:37:02 -0800
X-CSE-ConnectionGUID: Cv9u+K0tRsek18GR2iH9nA==
X-CSE-MsgGUID: LGHe8mGCTMigJkrd8ombUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="212606525"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 11:37:01 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 11:37:01 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 11:37:01 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.9) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 11:37:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=olXAh4106ICnOm9LTk7XHdouTljK+PMPbNOk8lYI1ZNhSvQEULaxV7DyCtEYSW2irEjblj10wLZxRTVQpkhwJw45APuiM3ujYhYthJ/BUMPGy8Y7TkgekbjKBGMddntMAQ8uUG7zaKYXbiICVhAYasWyaocR94kzOjqlDZHYI0SL+1ZQ+Z2QQ89uBu4pB9IALbz9omz8nwi+1NtQ4ybrCuRjRxcwSWCYn+ZroRsUM5DgCnOkb12P7lsuTOPdRovok/Qtou9Sn1zdCjyOV74nSkVjntFZ1cbW6k/ua9/ZnEXOGtlFBrFhnp/nvCkUk4DfxySxL1uZ0h62qd2di+SpBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jOKjJynqWmceuI95sDaBCC7S+++/s+KkQYuDu46nMRE=;
 b=VvSXR/vDQYWE/JSMwBimJQBuDlMVkAjuekg9EP1dRt9u8iHrk/NOMkg1cGU3AQyaODfGlctn9KcfkcvGVgrUZqs/p+QV0AN22UWg//qnG0HhUv0e8cTqZRUaWytmqkK/S41m2kN1XMTYeNnD8V0ggaS+S6yyVAp/UvyEZPXY93HsnY3rthxOB05MNTBVlFdeqf+SGftn11WfqPyYWcLwAUJhqE+Qk+mH5lvXvb7RYEcXJYUqLrztfJi05F4eg5oOipUhPbb82kRMVkjB0OfLh4zAtapKRGqJ4vB6Axjr94Qat/tL2PHvM6+MLjCBNb55LpOnPIjL4IbH9L/Aj2tlOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7997.namprd11.prod.outlook.com (2603:10b6:8:125::14)
 by PH0PR11MB7423.namprd11.prod.outlook.com (2603:10b6:510:282::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 19:36:53 +0000
Received: from DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246]) by DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 19:36:53 +0000
Message-ID: <513b4954-6c41-44f1-ae54-d7408ccd999c@intel.com>
Date: Wed, 18 Feb 2026 11:36:50 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] peci: Remove dependency on x86 CPU variables
Content-Language: en-US
To: Dave Hansen <dave.hansen@intel.com>, Dave Hansen
	<dave.hansen@linux.intel.com>, <linux-kernel@vger.kernel.org>
CC: Borislav Petkov <bp@alien8.de>, Guenter Roeck <linux@roeck-us.net>, "H.
 Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Iwona Winiarska
	<iwona.winiarska@intel.com>, <linux-hwmon@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, Thomas Gleixner <tglx@kernel.org>, Tony Luck
	<tony.luck@intel.com>, <x86@kernel.org>
References: <20260218170301.D814B556@davehans-spike.ostc.intel.com>
 <02494c50-8239-4e9d-b653-451728e5b5fc@intel.com>
 <5cfea5f4-1ced-4559-8de1-4e96116536f4@intel.com>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <5cfea5f4-1ced-4559-8de1-4e96116536f4@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0190.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::15) To DS0PR11MB7997.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR11MB7997:EE_|PH0PR11MB7423:EE_
X-MS-Office365-Filtering-Correlation-Id: fcba8e4d-000d-405a-d466-08de6f25119a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0hoS09wSGR1OUc5bTVoZ25LNFFkejFzdVFrU0hjVkxiand5a2JtYUxITTMz?=
 =?utf-8?B?UUNWQktRR1VrMWEyamcwa2RCRzdnZThMbFN1OER3RjZZZ3J1N09DQitVelp5?=
 =?utf-8?B?Q21Iekt4WExjVkNFdnRGYWY4NkNIazFmdXJvNmVGZHRxMDU3TjNJRmNOdzUw?=
 =?utf-8?B?QjJuY0MwT2lFdjZCTjhLUzVnZGY4Yy85MGoveGVaUklZSlo4VkZJREM3TE9n?=
 =?utf-8?B?R1BoY3AyTjUvRUU0V2JpdnVaNnptTXR5ZlVOQnU1NXNNWkNhSnYwNDZkTFg0?=
 =?utf-8?B?SUNERXdmbWJwTEZSMmNhL2duT1ZVa3dObWNwUkxNdzRyWXgwQW9FQnhRSnA5?=
 =?utf-8?B?UnlwZ2l6OVFPRXV3T0c0aWVZMXBCbzlmN2cxa2NybjRaK09JbDJxMEl4b3Fv?=
 =?utf-8?B?Uko3WHV2eHpQdDEvTHJzcTdGQTRmQ1NnK1RmVXllVFk0SlVrQk43V01kT1N3?=
 =?utf-8?B?Nk9oZC9MLy9YNDkyYzJ6dmd5akZkTExLWW1qRkJyaDNWdWNta2tBdTBTcG9z?=
 =?utf-8?B?cUlCVVk3UjBuMmpEcXlQVGRobi9la0loUDQ1cjlTT1pWc05yVHFCTHMzSVYv?=
 =?utf-8?B?enNtWmJ6VWxnNVdCYkE3S3VSTWNyRlJjVmtlc1hUK2ZTR2xlQk1TRXYzTFlQ?=
 =?utf-8?B?ZktzZUpsMjVaU0dBakZ1dVE4OHdIRVo1OGp3Ri9SbXZrejJCWjJQN2hNVDdw?=
 =?utf-8?B?R2xYZ0IvSHlzTWdOYjZpdGdMN0Y2L245K3Y5T1FORzBPR2VIdVJmVGFpMGl2?=
 =?utf-8?B?TXRZSElvRnVMcWsycFpLMkFkSHEyU2p1eWY5OHdlN2ZQaENmRVFPNThRdm5n?=
 =?utf-8?B?ak5ibmdYSWMxZFZ1R0RQUzR1N2w5eWlsOHprazRSOXZlUTB2SGVhd3UrUWQv?=
 =?utf-8?B?T1M2TmcrQVAwcytmcjkrRStkMnhoNTg1K29XZFRNSFdsbnlna2JSOVJpWTMv?=
 =?utf-8?B?SVFFQkx0cEhjbjdNbzR5L29RZFVFTHA5cWh5aVkvdkxLY21nVDVSQUpWUGs5?=
 =?utf-8?B?L2xqcTE5dHBpMnBib0J6a1YzT3A4TDZydzExTDhGbEt0SWNVLzF3UVJvT3lI?=
 =?utf-8?B?cGw0Wm5NSG5VZ0xLU2VYbVJrSUt4dEtDeCtpUUNCQkFibkZrUjVsWkFGa0NB?=
 =?utf-8?B?ZE5lY2FjT1VCWExIRHlkZmUxdTBIMVBpZGZWRllpYWFhUzBTWG5ZTCt0OXd3?=
 =?utf-8?B?aWM0TGUvTlg0c0xnRldTR240OE9ZcExyenRTbG0zb25yc0dtMDlXeit6OUFa?=
 =?utf-8?B?S3BXeTJDOEFVVktMVEZKNWF0b0E2NnlwUUY5d3N1TnZKNW95c05RTHRidXdC?=
 =?utf-8?B?NHVOSTdXT1R0SERXZkRzZERnRThSN3lzZ1Jkd0xzc0JxSUtVRXdQeG5BOFht?=
 =?utf-8?B?TDFnb3NNZm1INzhGT0xqUnlFRFROQkpFbUJBd3ZCK2o2RzhudUttaDdDTDFZ?=
 =?utf-8?B?OTI1ZHR5VlF1bnNndlN4ckx3MGZ2cWRZOUxINWlEOTNPdEJ5V2ZJeHZMWnZP?=
 =?utf-8?B?cW1UekNoZjhZSWU0RVpBT3BnUXVQRnJYZEpid3JlV1Joc3VpMFFLdnBNeWs5?=
 =?utf-8?B?MTFVV3Mwcmx2RjdTNmI1YTJ2SzlORWw3RHZqbGNES2VxZHMrVHpydzdQWXZj?=
 =?utf-8?B?R0hPU0x3ckV1R0VYK3RraXJyUkxFS2ZtanFOZ0pGWVlTa3BFMjdOTmJ3c2ZC?=
 =?utf-8?B?azNMRCtTN3ZkM0hEMFFoN1djdG5iTGVaVEVudTU5ZjA4ZWkydEhFTUlmSVNC?=
 =?utf-8?B?eWVOMWdWbEZtc1pwOS9rdk9VMnNDNmtnR3Y4WXdyRkRERjJZeUFxVWwwandq?=
 =?utf-8?B?SnlrU2FPRWt5dUZ6WWVDMEhrLzhsUDZFc3RSc3oyQVN0YmRETnBMczJJTGJn?=
 =?utf-8?B?Q09QOEJQMFFqTlRCTU1oaFBNRHRNWlpTZUl4UGZucUVKV3NpUjJlMnpMdkt2?=
 =?utf-8?B?bTB4QVAyQlY3bjhXbmlURWhsTjhuQ2hKOEFOWCtvRk1qOFhZbnRHRDFZRmJq?=
 =?utf-8?B?VkozYkJlK2twOCtkN1hCakxlT3Y2bUpGS0QxcDlWQkdVZDBRVkNFa1VHVklB?=
 =?utf-8?B?Uzd0S1JZRFg3aWI3OEtyR25pZkJUT3dKRlpvZWU5ajR4b1FkZVpqa1paeHZ3?=
 =?utf-8?Q?9rKk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7997.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVhqUFpjM1QrVkhRaFNKWTlSTSttVHltVngxaFhDeHdnbkxreXpFR0d3VnBn?=
 =?utf-8?B?T1NYNjIwVnBDblRTUjZuZjkvWllxTmFIMm5zRjFENHVMTmIvd3l4d3BqZWJ5?=
 =?utf-8?B?TExvb3RhdHZocE1sQ0tmdG5JWTJQOWJYbURlUUpHUzJOSWlXTU5IMnRrcE9S?=
 =?utf-8?B?NVdWUEFNNVhkNlZLZmRWeG9IdkJVWVZBKzFvMHhCMEtobTQvdXZWanFkV1du?=
 =?utf-8?B?MmN1VFZUWnlFSHgzcUlQcjlybktheWc0NGlPdGVTdXBIQ3paVU9QTUxoMU5G?=
 =?utf-8?B?WEhIaWtwY3RHVXkzY0VHWVBZRzdOTHlWdzJpK1FzZzZBeVZSamYwV05vV0tX?=
 =?utf-8?B?Z0dKcUtrdG5xT2VDYlBJYmhaK0I4WVU4Mjg3d1lmSFNiVHpQTWxSdFo0SUJt?=
 =?utf-8?B?c0p6NjNqM0p5VjZZSWhwMmxhcmVBZnpzTitVMmU0Yk9wV1JwSURwck1vOUov?=
 =?utf-8?B?UzAwaStuSm8xTHNWb21BUEs1aHlGOU5SRi9sZ01La0NGZWlEZW9naS96YUU3?=
 =?utf-8?B?M1R6WTVBR2VFdERFU2IvZUltVUxud293RUdlS2hWT0NrRExqMTQ2RWhRMVRq?=
 =?utf-8?B?SEZmRjZlNmUwMFJpUStjTzYvWkJBR3gyaDNFZ3dUV2lqL09WMG9JL3lPL0wv?=
 =?utf-8?B?cytZaXF4emlxaUdwaG1sc3ZvNG1qRldGeDZPbXI2M0JYTjkzZit6b016bTgv?=
 =?utf-8?B?dC9YUGJ0WkwrM3hadEEzUDdkam5CYWRKS2FlbncrWFJCdUhQeHNqanQrdE9E?=
 =?utf-8?B?QmxxOXovN2VQeGtMTE5UTlFLOUp2QjdxNlVJMDdValgxcDlnMGVVZUlpZytH?=
 =?utf-8?B?ZFJZRGpZcVZlNy9IVzdKQVU1WDgyTnVXakM0SFJrdXZtaGx3NVpwZlBHeHI5?=
 =?utf-8?B?aE1VdzN3NTV0UDlvbVlWcjg1MVpGK1BIVHRUSVRjbllacjJMZDdLWVNRSmNV?=
 =?utf-8?B?aHRVcTJHc2x1SXhDZlRWNGRRQjFqd0RNRTV5Vlh4QlNFMFhycld3OW9GZWNP?=
 =?utf-8?B?Mjhrd1JYNGU2Wnl0VzdGekF1QldQM2lIeXVCNFAzbzNBMGVySDJCc2tYb0Fx?=
 =?utf-8?B?SlE2d1AxaXpRRU5lUkRTcGdpVDB5cVlVejdhTnV0TDNPNEVxdnRpaWdRNDNi?=
 =?utf-8?B?T3pXWUVLdUQxWDdvVlh5RStkRTRFZGZjUWdMUi9CQnBZWFlNNlUvRmtGVG92?=
 =?utf-8?B?d0pzM2FDK2RrdXV3bFNKUGxiSnBKdXp6TkYvQXptSlJVd09acU1lMDF2cDFW?=
 =?utf-8?B?bUR4WlZwVFFIckR6TTI4NzBCdXZWUEU5QkpYOE1acWttN21hL0ZDdHlwSkxC?=
 =?utf-8?B?RDZtWGM5b3U5eE5oZXlzTVJTSjIwWjRDYnZKNGJUVjBha2dZY0pFZ0JFZlpZ?=
 =?utf-8?B?RHVGclorRVdXTkJUQWw3TGFVNEZ4a1FRd1I1aWovTllPZEVDeGoweGM5K2xX?=
 =?utf-8?B?VUhNM2pOQlVqa1IwcGxyK05DWW1VWFN5K1FadElBK1poQW1pWWw2UFQwT1ox?=
 =?utf-8?B?Vi9oNjdia1Bua2d3MjRRYWxrUHVYVXRPZ1p2ZWtpNDVrM25tOWlOaHZ0UG00?=
 =?utf-8?B?MHc0OWxqanZQaTZxMlpSLzBhRlduTHF2NEpkcGZCUnRGcVVWMVM1VnZZcm9B?=
 =?utf-8?B?UUIvY3N2dzJobS9nOHpGeDVML3loTWJRd0dzYjNpN1NxOEQyK3NsOUVEdkV2?=
 =?utf-8?B?ZFlZOUZiQzhPVXRhR2hUZUY1bncybDltK1d2T0dKNXRDaHJCTnBvZWwwZGhR?=
 =?utf-8?B?TWFXajVyaVd4SzZPMmluZ1UxaWtzK1A5OVFxSDM1S2h4SG9XS2U3QVBqMGw0?=
 =?utf-8?B?U0R5MmxkRDZQTUhnZHI2dkl5VFlIWUhGQUNyUVdpdklDb29UblNDNVIrbGdU?=
 =?utf-8?B?K1FabVhRT3FGbE1OVnhBZDhtM1IxMUVQOVRXMTZzaHh1eVludXkxYlh1cVdB?=
 =?utf-8?B?aEFidk9jamdzV1Q4b3pqOW5OTjlkVzdYdmdhSnZXY1lYRjA3N1ZOeUo0Yzlk?=
 =?utf-8?B?eUpBRnlWQ0QxTENYVG9ZZ2IvZlQvb2w2TThkTE1xTG1ZQTZSOXdYSE9BSTNa?=
 =?utf-8?B?YTFLWU5GRVFjbFBIM0x5MUc1bmZXTDhRM0ZaV2hCdVMvRGJsclZiUk0zVUJ5?=
 =?utf-8?B?UWdQc2lCN3krTy8zZW5vY1VYNlJuQSszSHFSTURCODUzcG5rY3ZnWWlrQlRU?=
 =?utf-8?B?S3AyTGN2YzcrVWVMcSswSFk4UWpCaVEzSnRueVpOSUk2eHpyaUhyOUhlbFBJ?=
 =?utf-8?B?Zlo0MVNUZER6b1ZWKy9GOTh1RTBMNnpzMFExL2g2eG1udFlkUi9NekRvVTky?=
 =?utf-8?B?M1lveG5hUDgzbWdLTzJULzFnVGtwd0VmTmNWVEg1d3RYMkcrM2t4Zz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fcba8e4d-000d-405a-d466-08de6f25119a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7997.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 19:36:53.5374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YR01QqDa20eqiQDP4ejOzsRbtQPpiDMVLIuAU/gUO15jA9rdYcPN2TmxOVHfJX0Wgqe0ERkERoNWmPpnkHrufw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7423
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
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-1392-lists,openbmc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[sohil.mehta@intel.com,openbmc@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:dave.hansen@intel.com,m:dave.hansen@linux.intel.com,m:linux-kernel@vger.kernel.org,m:bp@alien8.de,m:linux@roeck-us.net,m:hpa@zytor.com,m:mingo@redhat.com,m:iwona.winiarska@intel.com,m:linux-hwmon@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:tglx@kernel.org,m:tony.luck@intel.com,m:x86@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,intel.com:mid,intel.com:dkim];
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
X-Rspamd-Queue-Id: 669B615ACA2
X-Rspamd-Action: no action

On 2/18/2026 11:30 AM, Dave Hansen wrote:

>>> +#define PECI_INTEL_HASWELL_X		0x306C
>>> +#define PECI_INTEL_BROADWELL_X		0x406F
>>> +#define PECI_INTEL_BROADWELL_D		0x5066
>>> +#define PECI_INTEL_SKYLAKE_X		0x5065
>>> +#define PECI_INTEL_ICELAKE_X		0x606A
>>> +#define PECI_INTEL_ICELAKE_D		0x606C
>>> +#define PECI_INTEL_SAPPHIRERAPIDS_X	0x806F
>>> +#define PECI_INTEL_EMERALDRAPIDS_X	0xC06F
>>>  
>>
>> The _D has been used in Intel official product names such as "XEON D".
>> AFAIU, The _X notation is specific to intel-family.h. Should that be
>> explained in the comment above?
>>
>> Something like:
>>
>>  *	_X	- regular server parts
>>  *	_D	- micro server parts
> 
> I think I just verbatim copied the intel-family.h names and added PECI_.
> Are you seeing something different.
> 

No.

> BTW, we should probably comment the naming scheme and at least mention
> that it should be consistent with the x86 code.

The naming scheme is already commented in intel-family.h. Yeah, this
just needs some breadcrumbs to help the user understand the naming.

