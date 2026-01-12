Return-Path: <openbmc+bounces-1157-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E05AD1130C
	for <lists+openbmc@lfdr.de>; Mon, 12 Jan 2026 09:23:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqQPx5pKPz2yvK;
	Mon, 12 Jan 2026 19:23:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.17
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768206229;
	cv=fail; b=L0VgrmcSD+4vdjH0ujulpxcIlxmkeCmdyX2vMmkAY63wYiwrdG1eZvyAyiQ09TyBavEmY3UhuDoYA9nl94JJpdeTm0DlppPchcbUlJ9UsQJLPQxJ1EhyW19TzzMFa9p2rgj9jCLOnw/xhZmHy9FYNb+B2sf2Ih98OikU0c1wOo//9t88PYgakY5ixxPQJH56y0XsUaIK9UHYrjzFHC3mVV9Pi9knHL3Nm9BrmZqMD1jrTdv5XawvO+bpb801MxNZDL/lTvlgYv2MTBFTspkWN5W9HxdX4hAl/BgGBOO/0shOoNPMxkkay8e34BedejPn9JfdvyKNYuq0dsYDKSQbHg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768206229; c=relaxed/relaxed;
	bh=mhf/b1RRgf05TyJGIzg21Fp9z1KB3VHnO0PNjCxejDU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mT1ayFMdfZkvjQsDQ1bgR7F6S0g5Wle6WUO2oFyQwbZnMm5kmdkHWx5eipUipfMIKWslHZkhsETcLCX5uGVfwT4BGYZ7wfXLmWrWvW44ChUOOTyowl/0txlBGHwrLyM6ece1W3qikvJAVA9EvrtfemUVLpxtSklq4AcYvEDuHpwqfOXoDpVPX7tNKGG6WMWTF8gQZqHj0LUggDrdFY2voWGP4jJ+RwOjQ9KRR12FDrKCeQuHt4dIVwGG9E+N9UV5FghT9MWmK95UWr/UEwxC1ifu3ohF/jThd7Ax/LQVkLFaYXBmuJt6XPxgMKJGDoDCs2gQIW73lLorm0BwqgLjsw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cojNursx; dkim-atps=neutral; spf=pass (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cojNursx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqQPv1DpPz2yv9
	for <openbmc@lists.ozlabs.org>; Mon, 12 Jan 2026 19:23:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768206227; x=1799742227;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=T9XI6pKemkhlOyrL2lInpONqf6yaSvatlInNqc3FjWE=;
  b=cojNursxcrRlkbLWMVUyV6Z3WoXtBsxCAkaJW3X3g8pbmN6RrESDHSiM
   2sk7JoPZaM8fLqXOzwuWXo+eAQ2x7HfkSs6JzLx4M43lAI+ESgOHAHd/9
   my7gRGNZBglzAJ/OZQMoMYijwAVhHcOsB9QTOeAo8EknC6SEDSniF4sed
   8YIfHJlduT+qc2dkZGEb+tvtoJ86EpYO6bnRdUV8SgeDOGaOL6m/RpTvN
   O03i9eRWmXyUN9WS+d77FOFrnDX7L4CcG99L6hF/3r9ZSs6SIHqwQKG39
   +1zhG2ovwU3vTGpfVAYX+43IZlNzoEbxe7umBhzdlOU0jCjUMNySqQvBp
   w==;
X-CSE-ConnectionGUID: C/Q5DHIWQDexPOVBG1Gcdw==
X-CSE-MsgGUID: UfxoE5i2QnmCUoDGEpFT4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69390106"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69390106"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 00:23:42 -0800
X-CSE-ConnectionGUID: KALQh3aVSFWrK45ULrkxaQ==
X-CSE-MsgGUID: adYCZgrjToqcPdLFpxBbfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="204107306"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 00:23:42 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 00:23:41 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 00:23:41 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.41) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 00:23:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mXLS3F87IfxkHa9mj5+qDyy/XII0G76ri1eYHBBdDHu0BFXHZzPXIlyY12O8Gx5619nUqkTFhyg5dcPysCtYI6R237ApfQJbO7KtNtQkc/P77pyjCesK+Wy1IK7Wc4ZikubbPZTg1tdNdPK05v6pQU87mvr61ay0qlHpKU8QMO2ylfC/pKaPX/scmowDsmovl30HyLEmwZQ2Gcb+hnws2G2KiCb4IvgZmkhzRxt6+xlgUhlsg1/pRM3/2KMQDToQEeb+IhAyisFrQIoeRdlkELlrLysfRf1xPzvdPRR8b1ShjvuyH4wpfSUSf/H95rMekj+6Z4bufaMNPwXETalIfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mhf/b1RRgf05TyJGIzg21Fp9z1KB3VHnO0PNjCxejDU=;
 b=HNNVYU4U3x7ec5V+mJAB9dZbcm1j9PmGzyg7NZHni+1r5am+LCgwtvPuGYRwzAgw5aXdP7x8umcqeOayokrTyOEJBCNFf+VRFwNax5XPkfT5qwUGYhLQzup5ciH6o02LnWtx22TS/iGKfSVIvVrqkGqvpq+jNig1Y3OwfdL0L1aIEvtMcmk++k4jSQf2h2r7z49Z9qvR1GlwmNcwQqD9Ne3fuZWRTvjP60HAdMfBtGPzwlVLGRbSI1TRE6t+Qf3fNyoxAMSWcC5M8XPGfPtA13Ve3zd5R4/IimTYVSpu7/Pibd85capFKznzjeGj76Bl9hz2pXvJxbuz3+l86APNng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SJ0PR11MB5021.namprd11.prod.outlook.com (2603:10b6:a03:2dc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 08:23:40 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 08:23:33 +0000
Message-ID: <d370870a-d4f9-4989-ade3-e2b26b2a1134@intel.com>
Date: Mon, 12 Jan 2026 10:23:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mmc: sdhci-of-arasan: add support on Axiado AX3000
 SoC
To: Tzu-Hao Wei <twei@axiado.com>, SriNavmani A <srinavmani@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>,
	"Neil Armstrong" <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, Michal Simek <michal.simek@amd.com>
CC: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <openbmc@lists.ozlabs.org>
References: <20260109-axiado-ax3000-add-emmc-host-driver-support-v2-0-934f1a61f7c0@axiado.com>
 <20260109-axiado-ax3000-add-emmc-host-driver-support-v2-2-934f1a61f7c0@axiado.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260109-axiado-ax3000-add-emmc-host-driver-support-v2-2-934f1a61f7c0@axiado.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0086.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::19) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
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
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SJ0PR11MB5021:EE_
X-MS-Office365-Filtering-Correlation-Id: 2892040a-3a3b-49c8-860f-08de51b3e030
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VDZFNE5RVHpHZldEZGxFZzExVmFZMzE4OFgxRUh2YWRiN1JuSExTd3B2RzhD?=
 =?utf-8?B?UjhHRHRwK3hRMUhQelN1RGxVTnNmZUZ1RVlYVGRDa3dmQm9ZY3BWNDVPUElK?=
 =?utf-8?B?YjkrSDdGaHFRSGxoc1RIZ3MwMEFWUDgzWXc3R3FYRjFBWjZWUzlNNDBHUE0w?=
 =?utf-8?B?NVRZT3JOVTQwRlRMQjBYc0RRVUZpNTVDTDhDeDBGRFZMK1NoZDhqbVVKNlRy?=
 =?utf-8?B?RzBROFU4R3A0ZG9ZUVNMQUg2T0daeTllUmVoYUNYNFpNVTlJVFBPN2l4M1hV?=
 =?utf-8?B?eFp5cXhUS2xJVWYwR2hMdGRpT0wzSmxaZHkvUFVFVk1VbHU1TzJ4NEJnL1Fr?=
 =?utf-8?B?UnRaZ1FEUWM3YTRjUEtQMkt1Y25UTnhZamJFczg1aUVudUpsb2pCSVpoekcz?=
 =?utf-8?B?OXFLQmNLNVBnOFZRMUJTVlZoU0VYOUlqR0tzLzhzUWx3Yy9xMmdlVHFTd2RW?=
 =?utf-8?B?S1ZOSTkreDVZbUdyN0ZvR1FRQ2xnU1B6YlQyWUlUMWI3S25xdjJUNmIvY2NG?=
 =?utf-8?B?SVFYbzI2Z2o1UklWaDVzU01SaFg2M05PQ3U2cXZIRnlvVkV6M3JyZUJGU1di?=
 =?utf-8?B?VldtUTFCcGZGSEFqWnFKa0RMNXp0YzVqT0g1c3ZJdUR1T2NzWFdoZGgvcnR4?=
 =?utf-8?B?R2JWem96QXJLOE1IRzJESDh3SkFOMmk0eDhmY1dRQzJzSVRRbWpheGUwY2Rv?=
 =?utf-8?B?MEU0bmN6d2R3UTM1Y0UrTmRiS0NlenJCZ0RVdlBBak94Z1Z1aUw2Y293SGUw?=
 =?utf-8?B?QXd5K1o5L2pnblhDdVVUc1RmWU9oOEtGWCtSSGpXajQ3cWVvTGpTSStCUFMx?=
 =?utf-8?B?SWQzd3dpOHl4ei9vTWRuaFpKdG1lekNvdWtzaXo4c1gxZ0ZtSW5uZ3h5aXhN?=
 =?utf-8?B?ZDdrdVREWVBIcVkxZ0VqbmhRNGRSRzVIOFJQRXE2d3NBUElDdEJiUDVnWkQx?=
 =?utf-8?B?ZTZrMlJGUTJNZWd6VFhMVTRibFk0TjNqZWh5b0E5VnArbm13b0ZTbUFhMnoz?=
 =?utf-8?B?Wi9jazVDbURaT1IrN09mbk1CR05Ha2diWFpFUlZ1b3czdzhOMURPcDZFRGNq?=
 =?utf-8?B?dDJYelh2S1pDTFRqLzVVRWUyRWlmT0JRbExrbkdrWklGNHlxWFcxd3N4a3VJ?=
 =?utf-8?B?MVRTRTQ1Q28yZ28xRnVDUDJhK1FTV3VWNUZRZjZKQk1sQldYMVdrUjFSS0l3?=
 =?utf-8?B?UmVoUnZSMW9DWSs1c3J4OE80VWVIbm15R2wzRnhqOHVpOTB2SEFHTnlUKzhn?=
 =?utf-8?B?SFdDTGZ6OVArVTRJTEVhVFJ6SmM1VFB4UVFVRzgzemszaGpidktCVGxNcHJM?=
 =?utf-8?B?Y1d1M0lBb2p1SWlqdzF5Uk5LMjFHZ0lnbi9GRXNLYzkrbmJTRXBzcStSSmNr?=
 =?utf-8?B?MFdCMUZjVW9VVDRZV0JZRFltUWZvd2RiREZkVGMwMjVUc3phUjd3WWRtbkcy?=
 =?utf-8?B?RzB4M3BaRWtUSzBSeTNsamo1QnlMeTlPUFhlWm5JWlZTVEljVGhweEZpSVJh?=
 =?utf-8?B?YzBCa291a1hrZ0ZLcGszNHNWclVjWWVEOHdQK04ydU1nSlhvNHpDSkJPazNT?=
 =?utf-8?B?bG1FeGJIaEcveVlTYVZRUkdmNDN6ZVVQandNUDFSbit0Z24zZnl1N3B2ODBY?=
 =?utf-8?B?dEQrMGFSRUhCZWpVVWk3OUNOaVdoZ0ZPZ2ZOTjJ5Yzh5VkhMUXkybmJFUlVL?=
 =?utf-8?B?aHdGcW1DenhZUkpyZFcxTzFxSyt3bG1JUTBCZUlrbUNiOHZsTGMxWDhtRklD?=
 =?utf-8?B?d1JZbUYyMTNaRHpSSk9zWE51MkFkTldMbW11TWFDYUYyRjl5emZNVFAxVzdh?=
 =?utf-8?B?anU1aFQrZ3F4MU4wZllhNHpZeGhuZWJ2WFJFektRLzhPWVFsbWtyQ1JzQzhV?=
 =?utf-8?B?SkxRMzhGTXlDQ0J0SkN3OUM2NG4rVnVTMWpqNkhObU1qaEh5elQ2ME5pcUxa?=
 =?utf-8?B?cmovUnBwdCthY0NqOS9ZWFZDMWQ1OGtDSElYMGNkb2dQcFIrVjFIS2QzSm5w?=
 =?utf-8?Q?+3y47sTHZnpZ5B+J/FdxDQxAXKPhaQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0IwSmJsQTlHNFJLT3c5bkZXbW1nTW9UVE1tOTZQSGxCbSs2SEVkeTVVaUJ6?=
 =?utf-8?B?QTVHZi84MzFadWJKdXR3TkRJRnBEb2MyNUk5VndsZTNOU2QrSUtaTmEvWXBO?=
 =?utf-8?B?cDA0aGtkTHMvSU5yREdwRHhlbk1Sd1ZqVXI0MExYb09zVE9ublpuM2NYQkVo?=
 =?utf-8?B?WnVCR1p1VGVtVVlZNDJQQWZTNkx3ZnF6MG54bHFGU0RmbEFVbUZyVlpGVGR3?=
 =?utf-8?B?eTB3Y1VwVkYwWWUvTDRyMTM3N1NSUVBCQXZPMlR2WVRBSndKWEFXZzJUQnYw?=
 =?utf-8?B?M2xQdi8vTlp0SjhwTXRyeU5tRlJ2c3p4UDJKZ2pWZkJkQTBUOUtnMm1xZHpM?=
 =?utf-8?B?bkJLa2kyalFtalkvQzFGSG5OekViWTgzZndnU1BTU09Wb2hYWjMrMVg5SWlT?=
 =?utf-8?B?dDhMOG5mNWlLNzdlMEpuMjh0RmpDdHFQdVNhbk5tYkp5c28zb2dWRXdseVI1?=
 =?utf-8?B?UzViNytzT0gwbUhWOUh4Ti9rY2U1Rzd6NkNvU2pxRlhFYXdGN0h3SGd1OEY2?=
 =?utf-8?B?cGdIeFBBZTRDSHlZR2VPZldHeTFNYTFlVDlqVnBiY2xBNDl5SzEzb1JXaHRE?=
 =?utf-8?B?TGNzZXYvbzlJSXh4cjRNTWE3OXpaUWNzKzlWdk9yVE05aGlEd0g4UWswRnBh?=
 =?utf-8?B?TFVjaHhtNGY4SW56MFJqNm5pT2JIWWl2U0ZmUWpOQUtxQ3pkSkU5NWNaT0pY?=
 =?utf-8?B?UVNpaXEwRENVYTA1emNEaXEyeDBQSWo3c3NlM1hKNXNicC9PUXRGVngwajNx?=
 =?utf-8?B?clJQbVU1RkhPVmN3dmNMcTgxb29wd3ZZc2FxOXhMTlhnOTk3dFpKeEN6MG5H?=
 =?utf-8?B?Z0tXRlZmdCt1RVQ2TWdUZklUMW8yM2FnUkFiTGFUYWszMmlkemdhMVptTGhp?=
 =?utf-8?B?VENHQWF4TGRlTUovQldMOHFFN1NRQVJBaEliMnZQSzEzdytLUzFSRDYrRjBN?=
 =?utf-8?B?ckdYMEVudGMzYnVMa0d1RWVhaHFJWUpDOVVvY01OaS9HanNGK2E2Ui9VcDh1?=
 =?utf-8?B?V3BvQVBtU056bUR5THFlcHprV3JFYW9ra1RTNVNIQ3pjejJpUTg0MkZqWWNF?=
 =?utf-8?B?R2h5U3BkS08xdWZETG5XU0EwQ3JSNkVKaFBDeFk5MjJDUkMrOHNlS01nQ0Vm?=
 =?utf-8?B?TW5RN05yUHdJallJbUk5Wm5rVjFkcisxY2VweXpxU3AwQXVFSzN3cWJmYThH?=
 =?utf-8?B?UG1TQkNrVGxiOGl0Z1plNWR4SWxON2hqNVZRUytOdDhETlhhbElMZlFGcFlp?=
 =?utf-8?B?Z04xQzd0Z09pcE0yT25GR215a0pDSlpVejN3U2F4d3pPWEpCcWJ6a203Mzhs?=
 =?utf-8?B?TDhBV3V3TUJVZ1QxcDZ2R0wrRUlRa1pxTHVqQWNITkRMSk1KdWJJbEZ0bi8v?=
 =?utf-8?B?d2VSYVJORitERGpuajFKVWR5T0J2L3lwZnZ0UklKS2NnY1JWd1Z1cFZWeUhy?=
 =?utf-8?B?TnNqdlVCS3gwWVcxblhQY3dlNnM2YTZOUlFrc1g5b0xhdjNCdkZ2czJuWHJC?=
 =?utf-8?B?aG50NXBDUmZha1ZYSVlpN3dQbTRHMjU0cEYvbUUvdUJ5MTJzL0VoQklCZ2lT?=
 =?utf-8?B?MTJsaVlQN2Jwdk5wVVliNEdsd3IwVWFUcDdoR2Q1TlYxUjBZL2RmcWRKU0M2?=
 =?utf-8?B?aFJUUVljUmNoMG0xZ3F5VzI3RlhyUFRBa3lYUzJTVXB0djFEdnFEWGh6U1F3?=
 =?utf-8?B?MjI5K3pITVRlREZWSlVDM2RIVGVzWVJwK1M5TzFGMjlZVzhMc21CWnJ1NG9M?=
 =?utf-8?B?b01lY0xTbHNmREU2WEdaOVM2Y3pJZmZuc1gxVFBlWEswQXl3K09UYUtJME9t?=
 =?utf-8?B?VzBDd2V6cHBKVG9xWmxpck04cUk3bnFjYVhMbzUrYnhlaXdINlNCaER3M2pU?=
 =?utf-8?B?czlYekdjL055TTdKQzV3MGZLU1prdzVQYkc2NVN2U25ldENXcmJsbmp5WVRO?=
 =?utf-8?B?Z3BibXhMdmxWYkd0YXRKMHJQRHRPbVJHNng3Z0pmSUlCSm0vUDg1Uk5zbXdh?=
 =?utf-8?B?SDlkWGZBZU8vT3h5QTZIMDRrbGI5RTNUYU5lNEwrR1hXRXNYbzM5U2Nmak9o?=
 =?utf-8?B?YjJWZ1BBZit3MEgycUFhMVRZQlJiU05GM2orT0FVd09VK2pWaGVtYVo4VS9P?=
 =?utf-8?B?c0did3d0ckdSeGJpSE01MzMvNm42R0cwTXJ3MEZPcGdvZVpvZGRiWGV3c0Yz?=
 =?utf-8?B?S0tyTDdkVVhTV3BWZE1xWGpKSXR0UFdWTkxNUFZiTHVqTCtRcE9EREg4cVl0?=
 =?utf-8?B?R21aWmxScVZ4dm15TnFKTHo3Wm4zN2pybzdTaG5PY0pNY3JtSllzaDRTVTRa?=
 =?utf-8?B?cmVnckpZbGp4akwrK0VZNW54ZDhRSW9zTWN5dnYrZEhBU2lCYS9jQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2892040a-3a3b-49c8-860f-08de51b3e030
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 08:23:33.7893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QjAhuvQz4O6ZJkaZzAk/nOy8lADW4SD4v/UQXA679lAAP5BteOUlRSOf5ENUDapMqSKNX08wA+Cktp+Nw1Nmxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5021
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 09/01/2026 11:46, Tzu-Hao Wei wrote:
> From: SriNavmani A <srinavmani@axiado.com>
> 
> Axiado AX3000 SoC eMMC controller is based on Arasan eMMC 5.1 host
> controller IP.
> 
> Signed-off-by: SriNavmani A <srinavmani@axiado.com>
> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>

Apart from dt-bindings issues:

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/sdhci-of-arasan.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
> index ab7f0ffe7b4f007a58eb0a26868b08b0b02b40f3..5da915edd7416ab5c725a784867098c5e19236b6 100644
> --- a/drivers/mmc/host/sdhci-of-arasan.c
> +++ b/drivers/mmc/host/sdhci-of-arasan.c
> @@ -1512,6 +1512,16 @@ static struct sdhci_arasan_of_data intel_keembay_sdio_data = {
>  	.clk_ops = &arasan_clk_ops,
>  };
>  
> +static const struct sdhci_pltfm_data sdhci_arasan_axiado_pdata = {
> +	.ops = &sdhci_arasan_ops,
> +	.quirks = SDHCI_QUIRK_BROKEN_CQE,
> +};
> +
> +static struct sdhci_arasan_of_data sdhci_arasan_axiado_data = {
> +	.pdata = &sdhci_arasan_axiado_pdata,
> +	.clk_ops = &arasan_clk_ops,
> +};
> +
>  static const struct of_device_id sdhci_arasan_of_match[] = {
>  	/* SoC-specific compatible strings w/ soc_ctl_map */
>  	{
> @@ -1538,6 +1548,10 @@ static const struct of_device_id sdhci_arasan_of_match[] = {
>  		.compatible = "intel,keembay-sdhci-5.1-sdio",
>  		.data = &intel_keembay_sdio_data,
>  	},
> +	{
> +		.compatible = "axiado,ax3000-sdhci-5.1-emmc",
> +		.data = &sdhci_arasan_axiado_data,
> +	},
>  	/* Generic compatible below here */
>  	{
>  		.compatible = "arasan,sdhci-8.9a",
> 


