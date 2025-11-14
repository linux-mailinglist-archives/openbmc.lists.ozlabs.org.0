Return-Path: <openbmc+bounces-898-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EC1C5D62F
	for <lists+openbmc@lfdr.de>; Fri, 14 Nov 2025 14:40:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d7JDP5Wlbz2yvN;
	Sat, 15 Nov 2025 00:40:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=198.175.65.9 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763127621;
	cv=pass; b=bG/ebLFrxlLFSU3yIHNTQl6ZfiQ0VDncvBGEEEM9dLD6QPQldwzltECa3LAJejMyvmFsqg44aF3DZ4uWVJvbWSjEOXfQFQcougCHDYpvc00NPMWbRLC6NDYwvfqNSe9KUw6beTbmg00b4X0oIPX+f20b73SxkQnCop8RKTTjPfc1kNNn8JUMlZb1l3ycjNtMaon0SGZm1kbEeFPKE6IMDccczB6tBfxeNbQjhDv6Dr7lWnF5DHV4c7WPrAoXnQeWp4Tg6Acm1hmHRf7G124Uj0Ib9UR8XWP7kqrk/r13jGQsWbPfsMMqPKCHGoT0/q+aXTB12IZ88FbwmV7GWQqFTw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763127621; c=relaxed/relaxed;
	bh=MN9hY6D/yITVQ0KUXNKoRzrhLK+SZBxJTwYX8Cfq2nI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bVDRQfhFTBkwFJbqHssgFFgTwJBMAX9o3uO/6Ec6RkSvsQTtZ7vytVY1rfvt5UhohtqpcEySjwU7EpbnpWThppxhjm/mBwiJ7Pvyqc9WA+1YcTH1JCgvUTlgPUftoBLdlWhT9VOdC+NQZEwG4VOA+Gww3+5z9BQyMUcm5neEKSln+SbW37Qt1CuBGa7NZTNThxNgZI2jD2VD4IW5XMoqxd52RsvGjlhoPdKRHJMihW365jJduftdhL7CSxF6U14CQXvrPpFZz+4MRILHXM/i62tEy0gMzD6De/V58EyAnOUGfLyfPjUJzfVVOsTOGvVVQClYi+9jQW0IYBHVtvHdNg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hCsy+tVj; dkim-atps=neutral; spf=pass (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hCsy+tVj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d7JDL221nz2ynW;
	Sat, 15 Nov 2025 00:40:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763127619; x=1794663619;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=MN9hY6D/yITVQ0KUXNKoRzrhLK+SZBxJTwYX8Cfq2nI=;
  b=hCsy+tVjeRgTE/50h9+3Dm1NLSHIWkk6KII8jszwY9BUopsHSXHET1i+
   AIqWIhHUyknCy9evPTy5f8TxTsJYRZDcwhKIGYILK8nKZePF1q4Bifwku
   +gBGPgMZmi7ESp5UNK4+m8J++5jM328NjKjZswfw6TOuC1xQfrjYOA4Am
   NhqNZbkAnSv2DvnfmWFAJq7OwQwf7W2/WA44PejTUeeu4ncq1MMOK7llV
   2JV+8pNbNG7ZwWEH3hcA6p0+Yd4Q3ay5okTFlFgVz1iPkwb02fYRuRGAs
   KJE9zNq88dEgofPQsQ18cc2eo1AJ1aPNRA2XVwV1lU4WwQ2YpAckqZ/2i
   A==;
X-CSE-ConnectionGUID: yOMUrW1CQzibFquTgjOyAA==
X-CSE-MsgGUID: 0ISvq/nGQ6ydWgwWEyvZxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="87867422"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="87867422"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 05:40:13 -0800
X-CSE-ConnectionGUID: xLik+obgS4GexU+p94MWXA==
X-CSE-MsgGUID: xf4IsPD1Svm4TACvW4V4tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="189977962"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 05:40:12 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 05:40:11 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 05:40:11 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.33) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 05:40:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=liJKiaZUh/R940BTuWtBxAKjEmBmzUkQnjLmdYbAcKZfVTg0SSt7ddZ1fki9m+ihqsIymAURGBGM56w1bN8QzGt2c/o0bLkNhXMVYt3Pt21MRSClv4dnU09oMNkdwgQISbnr+/PUnJjuZwxMepBAGcbLHhMtCxLuAN/6BQWQLpAL82mOK/2h6pcHoUIhvIPs0kQ5QrkQtSfFq2covJ7HtSlt+HVWUubRytI8KOu1LZwadaf4Rq7SNeza25aYDDNEyl717xiG016BOIpSy0QgaJS+PD94IJlTIu+NQr9ALhhvxOqQaH6QL8dBf7NRCLFBXtzYE1TaNJ4UytZ3NdWxIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MN9hY6D/yITVQ0KUXNKoRzrhLK+SZBxJTwYX8Cfq2nI=;
 b=rrre9TLF32BoAYbnoLXaMr+z8r2F4pjCjqOFANWThfx+k7Dmdi9LuSlRMimEwdZWt1cs9bbnQfHyBXPSRQT27nG7ON0RDeKB6AX/pMUE9yY0lOSlrOMjTQTz8HFYlKRZGpQt8NjDmceDrw/QC5lbHL9m3p4tAlnfPy2D4/JBNxBulGpZaQfZ2NzxENvlgL2EJcJZcUxDFOShgDvZQedcMIfa787cgRL2aWC6Tx812fd6Bgq0mYDRNhukDtFr8icVhVwwSFfT0CZR+u30BPU3xAPqr/3zk0uduDBf+GdnhXG90bplYPXqlE2bC3WliER2jQzZpsaBr2NPaOtybLgiuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5330.namprd11.prod.outlook.com (2603:10b6:610:bd::7)
 by SA0PR11MB4607.namprd11.prod.outlook.com (2603:10b6:806:9b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 13:40:08 +0000
Received: from CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::9d32:3dfb:c2f1:40e2]) by CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::9d32:3dfb:c2f1:40e2%3]) with mapi id 15.20.9298.015; Fri, 14 Nov 2025
 13:40:08 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "bmasney@redhat.com" <bmasney@redhat.com>
CC: "joel@jms.id.au" <joel@jms.id.au>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "mripard@kernel.org" <mripard@kernel.org>
Subject: Re: [PATCH] peci: controller: peci-aspeed: convert from round_rate()
 to determine_rate()
Thread-Topic: [PATCH] peci: controller: peci-aspeed: convert from round_rate()
 to determine_rate()
Thread-Index: AQHcCkU9/Mtiofu43UmyoEi8nlGYDrSSyKAAgAEf6QCAMXIYgIAA7bGAgAAFLwCAAA0DAIAABGUAgAQk0ACAAwNeAIAZScOAgAvy+gA=
Date: Fri, 14 Nov 2025 13:40:08 +0000
Message-ID: <944fc5f44d9de1d21eee2548711be71bbe315dc2.camel@intel.com>
References: <20250810-peci-round-rate-v1-1-ec96d216a455@redhat.com>
	 <aMatZAX6eFI1RmDH@redhat.com>
	 <28dc3bd8aeca7e3164747960747f75060c596704.camel@codeconstruct.com.au>
	 <aPEZSY6RC-UVclxN@redhat.com>
	 <ba2e6b78e59afb7c89e5022770a142ec8c31659a.camel@codeconstruct.com.au>
	 <2025101759-runner-landing-374b@gregkh>
	 <2975918e3f3a7de245e93fbee52335acb78bb23a.camel@codeconstruct.com.au>
	 <2025101721-twiddling-huskiness-4852@gregkh>
	 <13566a08eeaed313ad789abcae1920d9b00483b0.camel@codeconstruct.com.au>
	 <d53256b35ee7089607463c66bb4a8c3420faf058.camel@intel.com>
	 <aQ0rJ3ahOV0gmUVM@redhat.com>
In-Reply-To: <aQ0rJ3ahOV0gmUVM@redhat.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5330:EE_|SA0PR11MB4607:EE_
x-ms-office365-filtering-correlation-id: 0b868269-9c33-47be-b396-08de238353c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?Mm9vOSt2bGZBY3pibm5lOEUzRHR6M1FWSzA5clVNTi91NnVLRU1DN1JRbStz?=
 =?utf-8?B?RGIzbDlEU1g3V0NlKzUzOVQvQVBXOUI3ZzZTanFCZnp3eDNsdnRvL1d6b2Zv?=
 =?utf-8?B?OENmd2hHQ0VTOVp2RmwrL3NZK2gyV3I0Si9jalR6UHdlQjBleHhKaHBDaDNl?=
 =?utf-8?B?aE5Yb2RrN0dSSnVucFI4VXNTbVVBc01rLzBseEFYRmhkUE1COFE5c21ZWWJP?=
 =?utf-8?B?SFFiRlFmM2tKeTZtQVo2TGtOSUNkaDVkVW5HeDUvd3FtMDJ3NU03OU16eC9B?=
 =?utf-8?B?N1lISUZQeXU3c2NWZEdvTmxpVXpZMCtxWVhlZUN3dHFWK2Rsb0FPRDJVN2w3?=
 =?utf-8?B?R2xjNXkwZE0xdTRwdHJ2cjQwcFhGQXI3OHlLOGE1c0lxbVdiU3Q4ZzRJMTIw?=
 =?utf-8?B?akVxK2ZpVlN3ckR5YVk2Y3l3Q3EydnorN1NmdFpNUHZBZlRpOGgzZExOR1po?=
 =?utf-8?B?SEZBcUp0QmxVZDE2OFBvS2JpSUVHZkFYdmx5RmwvRGlZUktKWElMeEhRSlFV?=
 =?utf-8?B?aFJySWFiZW5MMFBEUTVhQ2o3S0d4VGJ0RzhpcHNrWkN6b09HclI1S2xSeVRT?=
 =?utf-8?B?Q21EZ0ZDc3hicFd2VkZ3dGxDYlZHMWhZRWNHVC9kZ2J2RDNGVnU3OC9nYnRS?=
 =?utf-8?B?YjlITXhiQTBPL2pKQUxBUVo2N0JpK3NLRVJFSDhjVEFtZmo0Z3BidVBmN0dY?=
 =?utf-8?B?bkFuYjZOdkViWGIrUzRwbWI5VzNFZWNyMFlOdGpvL3NCR3pISndwNVBEbTY5?=
 =?utf-8?B?UTk4Uy95bEVKMW9WdytTb3pjNzF5ZVczZHo4MzNhL2xvdlZ5MkYxUkRYdE1o?=
 =?utf-8?B?TmlDNGt3T3NnbVdqMFRkV2dIa21EcVRCNXFLVmNVa0JjMnlTUnNQcS91YlJX?=
 =?utf-8?B?czJNQXhzS3owYVUyQk9EMjNNMjhUb210TUJqMUFxUFpyR1c5RXo5TG43ZU1r?=
 =?utf-8?B?WURJV3BEZHM5SmVJcVB5ZGR4MkJ4L0c4dm9QZ3l5aVBmVUhXZXEyS3R4MkND?=
 =?utf-8?B?bFpPcFpjNituMU5mN1QxWE1zN3NPeHE3TVd3cW5vLy9KWDlUd3MzWWJOb1Vv?=
 =?utf-8?B?Q1lzRlltbTlJVnl1K2dqUVpXamwxeTJPVG5ZM2hML1JCODBBa2YyRGtTazlE?=
 =?utf-8?B?MW83Ym1OTDI5b2tNWXBCT3JzRWcwSTVhMVpEM2ZuTThuazMrM3R4cDE1aTRD?=
 =?utf-8?B?cTJLZ2hFTFhFZFo2UVp3bi9BbS9EQ3p3M0ZUZ0JvUjFCR0JOSWxnNG82dkNr?=
 =?utf-8?B?bHB1bFZkRjc2MHJiMkpESWRraDRnWTV5NUVsQ0x6K3FhWEJ0T2ZRQjg4Qmdm?=
 =?utf-8?B?N0duREVCYVdUR1h3cGJuZExWSGZ2cG1veEVvY01CRk5oa1o3c3Zrdit0dUUy?=
 =?utf-8?B?ZStNL0IrUGlSK2JPbGJ6YXhHWW90K2F1aHBQVDdTbnhXSGxLRDBIaUpOVUdU?=
 =?utf-8?B?MnVlTitMR000QzVVcGdXa3N1NkNjS2lJdUFoZk94VFNKc2w4VmVvQ2YxZ1JG?=
 =?utf-8?B?bTc4a1JucGZ4YjhxWXZDaGg0MnNWbWZNc3dQczh4R0RlcUN2bkpmaTR4czdK?=
 =?utf-8?B?aVRQdlFJQWEwZk5Gd0ZWY3p5KzFKeVVydkorRmNwQ0FaQks4MGg1NWt5eWs4?=
 =?utf-8?B?YUY4dXBsU09CSmRRMi9lNW9kcVdWcWFrOFl0OHlXb3l0ZmdtM29SRkg1T0V1?=
 =?utf-8?B?QThlZ1ZBYXV1YkUzRTVZN2E1Q0NkakZVdTB0cjgrUW1LdWlHK29WaWMrYWYx?=
 =?utf-8?B?d1JSREh3dm9LUnViZDB3d0FJOVVFV0dXR1FMb1FjWGFweFFHZ1c1UTJDczBl?=
 =?utf-8?B?N2kvMGx1Z0h4bXhyR0M5empEUk5pNjFQM0F1QjNBMmFlR1BORTBUaXRRSjhZ?=
 =?utf-8?B?UzZiQ1BYOXBISGdnc1dlYlFyN3AwVllzNHBtRHhEZlpUVXZKbXJXV0QzNFlZ?=
 =?utf-8?B?SHlpVUFpNG1ZbjF6QklGbGFxUkVMVVVDV1VPKzJpd2s2VEpHamxZMHY2NUJk?=
 =?utf-8?B?VFNYc2FScXdGQ0xSQ3ZlWE0yMnpIc082TzdiejYvdmdmM2ZGdUw3VElGOFE2?=
 =?utf-8?Q?VW/S/f?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5330.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QU5zZ3NzUjhlRzBkblR5bE91ZVRnTzYxdnd5NHB3QUpneXdqZ0lJYVZKUmkv?=
 =?utf-8?B?RzZZZTZHTzRqazJPYzhoTzNLM0tmZU5KVENGQXdQcVdOSzlMQVNuK3dFQ0w5?=
 =?utf-8?B?eUJZUXpvbWp2REZnd1loemFZTkFLY212ekpRdmQwaXdMS1ZEbkJhaENJemNs?=
 =?utf-8?B?RXZwVHo5MzZJUnNTOEtGYXpsQnFhN3ZOc0pMWFpKWWRJUWY4SXVqWkduczlK?=
 =?utf-8?B?WnN5VHN5cGtacWNvYXgzcFVubk1GT1NFTmdRWmF2OVdMQjNKWGVZbjhma3B0?=
 =?utf-8?B?ek5VeFo0YVdhNEt4RThBSHhnRENVM2ZXWmpNN3I3alNNdncwUzhzNTJPTmVs?=
 =?utf-8?B?dFREdUM3dytPaFhEWEs1U3pzaUhMT3QzNTJ4MmlBWDM2ZkpWL2x6V3M0dEhI?=
 =?utf-8?B?WjBud3JQR3QvNndQcUZYUmozbXhDekU4dEF0YVRrYTVmWFp4UDE4ODdBaDRZ?=
 =?utf-8?B?cnpzMFlZUkdNSitXQlY3eEt5bFJVV2drSTV0eDJSY3lOR1ZuZDhDZXJmQXVS?=
 =?utf-8?B?Q1htQWRhKzgwcG9vOFc0ZEorbTJITGxiZlBvYzNPMEZaNldwRVBHSWQ4UVNk?=
 =?utf-8?B?d053OFRFVjNVNHNDbkxMdFhLbmlRdFNPNE5xQ0dISm9tVVVXUCtMK1R5Tklo?=
 =?utf-8?B?RDBDNXJiMTNVZTY1cmdqd1FIeWZjRy9XSFQ1Z2l4Q2hWZWs4NkE1NWRvaFF3?=
 =?utf-8?B?Qm9URUtjQVEwTUFxK3lGWHM0TGJmT0xYWDVpSjgxNmtoMEk1WXFiVUFEQy9Q?=
 =?utf-8?B?TVFoZC9LK0lsZWtBajgzTGp5M3FzOFRXVEpLaGdqeEFsNktvbzliejJRaTR0?=
 =?utf-8?B?WFM5ODN0WHpJRFlVOGh5VE5IaXNwbUpBSSszRXBxeEdENmZuQnRISWNKZzlj?=
 =?utf-8?B?a0U3SmRPZ1pVOWRSWGRzcjNlUmUrVmk1VXEvdUw5R3pUOVU1ZDZmSXAyK21v?=
 =?utf-8?B?b2VTS2ZHVmdSeWVxRkFxVWhxM0hEVGZoTWoxMTdzemQ0QUhGNDNMM2RLeXlN?=
 =?utf-8?B?UWVmT3ZhNnlrcll1Y0lSQmR2YlZjb3RzcmFVUmFMS3kveW42SzVjQlJsR2Vn?=
 =?utf-8?B?Sy9QcXhPblUvNkhwRTVPZjR4VjJoV3RVT3JzMjM3M0lVTDVJQTloZEhmckdy?=
 =?utf-8?B?SDVEK3VHR3FLd2gvUG93L0ZVK0ZhWVI5ck9jOGU0MHJFRFNIV0ZuZllQYUds?=
 =?utf-8?B?VDYxcFgySGV0bzAzbzVqTnI3c3VJY29BOEU2UmJIallzWUhvTmJnSENJWUg1?=
 =?utf-8?B?WGUzZGZDc2NSZmQrMzlDZndaa3hVV2g4c0d4c3N6ZmQ4cDAvYTc0ejVCS3J4?=
 =?utf-8?B?SVpOSVB5ejcyckFUdnhXeGpycExtUkZHKzZQT1NkcDhJZTZqRzltR0N5RzBD?=
 =?utf-8?B?OHRpT05ka3BUMW9zeWw5eWhLemYxM052S00wWWFDR1VuUTg2M3p1YmhZbXFY?=
 =?utf-8?B?aUhDbVBHYWhvMm0vZjVqM1Fnc1JPRnlMcWlBNjltWTNlZnhjckZIVjdYWVBX?=
 =?utf-8?B?QWFMTnVPMStRVDVJZjFML1dJQW91QjJ2aXFGNFE1akpzdWpTc1Y0cWJpWG5W?=
 =?utf-8?B?MjFNWXZuS0g4bE10Sm1IVU1CQi8xTDZiT2NlZklOZmV1VVY4b2s1a0IwTWtm?=
 =?utf-8?B?V3Z2R0dtOXVjYzhaMTh0amVBZXBYMGVrVHdDaE95RnNGaDRXSExIY0lFMUxF?=
 =?utf-8?B?Z1luczhlR3RhVjVJMi9vNzF3aTJ2L0lVUGpSWnE4RFVyM2t1b2Y4aFpLVGdp?=
 =?utf-8?B?MlhveEorZzdRV0pGRWh3b3BqbVhtRUlPR2dLMHgveWRoZnd3MEs5b0QzVStG?=
 =?utf-8?B?dkhmKy9YNTZqcDVUd0pBVkxyZEtGUWFabXUyU1JscDJTY08xZEZXRy8zU1hN?=
 =?utf-8?B?ejZnRnpHMGdjeFNWNmhZeHFyMkIyT2hiODNFZ3RhVzVQK0k2bTBnZjlvQjl5?=
 =?utf-8?B?YUlZbmsyQjZRUXYyRmV1elE3SHEvYk83cS95TVUxekRIV3VyQkk5S2V1MFVv?=
 =?utf-8?B?SEZ4MkE3dXZvUDZLbVNUY2ViR3ByaE1JRkJNUTAwVjBPeCtIYjh0NVFrMTJw?=
 =?utf-8?B?akNiNThLZDdnVWdpajFyL1dRbnJGREpCSHhHazVISmp1aUR1R2UwNlhBM0RD?=
 =?utf-8?B?K3FMUlF4L0s0RGg2clhQdzZvZ3U4YnQxd3U2NExTYWtSSGUzWVMvY1dQcFNK?=
 =?utf-8?B?T0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <13EBEEA8E7662C4491755C825EA809D2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
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
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5330.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b868269-9c33-47be-b396-08de238353c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2025 13:40:08.6110
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1CG542sF93b4WHZIXcez8RG3O/ncv0goy01he12xM4RewwqJGFUmix+lWiUOeHEV0V2aimDcE86VGXLSboBgHmVxaXjmBECiffGkCUbov+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4607
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

T24gVGh1LCAyMDI1LTExLTA2IGF0IDE4OjExIC0wNTAwLCBCcmlhbiBNYXNuZXkgd3JvdGU6DQo+
IEhpIEl3b25hLA0KPiANCj4gT24gVHVlLCBPY3QgMjEsIDIwMjUgYXQgMDk6MDE6MjNQTSArMDAw
MCwgV2luaWFyc2thLCBJd29uYSB3cm90ZToNCj4gPiBTb3JyeSBmb3IgdGhlIGRlbGF5IC0gZm9y
IHNvbWUgcmVhc29uIHRoaXMgZW50aXJlIHRocmVhZCBkaWRuJ3QgbGFuZCBpbiBteQ0KPiA+IGlu
Ym94DQo+ID4gYW5kIEkganVzdCBmb3VuZCBpdCBub3csIHJhbmRvbWx5IGJyb3dzaW5nIG1haWxp
bmcgbGlzdCA6Lw0KPiA+IA0KPiA+IEkgd2lsbCBzZW50IGl0IGFzIGEgUFIgZm9yIHY2LjE5Lg0K
PiANCj4gSSdtIGp1c3QgY2hlY2tpbmcgaWYgdGhpcyBwYXRjaCBzaG91bGQgc2hvdyB1cCBpbiBs
aW51eC1uZXh0IGJ5IG5vdz8NCg0KSGksDQoNCkl0IGdvdCBwdWxsZWQgcmVjZW50bHksIHNvIGl0
IHNob3VsZCBiZSBhdmFpbGFibGUgaW4gbGludXgtbmV4dCBieSBub3cuDQoNClRoYW5rcw0KLUl3
b25hDQoNCj4gDQo+IFNvcnJ5IHRvIGJlIGEgcGVzdC4gVGhpcyBwYXRjaCwgYW5kIG9uZSBvdGhl
ciBzZXJpZXMgaW4gYW5vdGhlcg0KPiBzdWJzeXN0ZW0gaXMgYWxsIHRoYXQncyBob2xkaW5nIG1l
IGJhY2sgZnJvbSByZW1vdmluZyBhIGxlZ2FjeSBBUEkgaW4NCj4gdGhlIGNsayBzdWJzeXN0ZW0u
IEknZCByZWFsbHkgbGlrZSB0byBnZXQgdGhlc2UgZGVwZW5kZW5jaWVzIG1lcmdlZCBmb3INCj4g
djYuMTkgc28gdGhhdCBJIGNhbiBkbyB0aGF0IGNsZWFudXAgd29yayBpbiB2Ni4yMC4NCj4gDQo+
IFRoYW5rcywNCj4gDQo+IEJyaWFuDQo+IA0KDQo=

