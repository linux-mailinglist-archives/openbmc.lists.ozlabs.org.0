Return-Path: <openbmc+bounces-784-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DC1BF8E4B
	for <lists+openbmc@lfdr.de>; Tue, 21 Oct 2025 23:07:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crlHt0y1Vz2ypY;
	Wed, 22 Oct 2025 08:07:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=198.175.65.12 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761080874;
	cv=pass; b=IpqYysTu/OmCroM67a/fb04rrAC6mE4ewHkGkf9wdIY/PZPl1XL7FbGS9bDbPOM+Bs8Vza1dDLJn9Io3vhCEkawIt0EqslQAbbZ1+r3u7BbMjvOMHazQWzFe16HIvGiLzzMyjNyGyX6VlNsZyga5cg1ZkXpms/zgFnXAydDt+KYu6oyTy1WzGC7LOE5zYlceeQVF7Qf3D0cqhGGoKeJbrtNmTF3jEpJ/7z1nIiz4lmWYSk2l94WlnQSx6VfQg6wLntNT/QqfaNqD25/8wcpt7KLoVgIH4GuDAs4xk+hHHY0YoK+FbjEdMySDlha1Nz2ObWGP7wEzdlCrkTrE8Y6sBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761080874; c=relaxed/relaxed;
	bh=ntP3ch6vZ1tQP953nAQSl356BPt689yOdiUzbD8nbT4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RFqPwb2dL+Qi+ImNgIxRH5dm0W0W8i+jDd5G8Ilo1xL4BDthbdJMdUd9tTO5G1uL2o1Jp8eJNC6/stzOW1Yr4OFshKZZlBLTJ+SfV5vH16qg2dZKpGjkNHKjngGzB7slDR67xJFIWTsm2htYGhIm7IjA9nV9zhRWUrI+l+JpwkNk36TQ1WrSgB6OWqcTeaa+qb6Low1g6rpuuZpng5Tvq2YpXdE69q+Vxv6Xx2mzO/SnEYq9NuOa8SbrIGxhcs2FIwCOfqshxbS4hl2iIqZtyCz9GQOLVBC4Gf6BWlb7EAMcTzZgiRFPeAsEYAWN0v1d0VAMUicZToluHygc/k88eg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nZVwieOU; dkim-atps=neutral; spf=pass (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nZVwieOU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crlHr1VYTz2yhb;
	Wed, 22 Oct 2025 08:07:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761080873; x=1792616873;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ntP3ch6vZ1tQP953nAQSl356BPt689yOdiUzbD8nbT4=;
  b=nZVwieOUYNeYOPCDgtuDB2x/qGRLIwXytbDYv/4Dp6ULWNa8BW6fuvEq
   +GGRGv4TbBz9gK5aSeZhkpFLxEKeGk5Stajfk9EGdHJs/vq/Gzb0g64sP
   YPAhVUQMA701c00MqA0Y/TR0aoRp74ja26ec5bzjuM0JlIsNgCONYniF+
   i8k6gpSPSC9rfBsfi7QmvbiTgutqS5Ofmh0RaELVamQL0kL8e/1J980Ty
   qIwQf05nAZ0/8OnKxioKFsrPpKgmSbUo8njgYmo9Wsj8TBwVfU5NkFMW5
   FBUHVeFu8hm5f2dlhypRNQR8b/wE8pSWBjUpu2W5zdnZoZZD2YXUPu/wm
   A==;
X-CSE-ConnectionGUID: 8WF2vMs/TzaWacAXNJI7rg==
X-CSE-MsgGUID: 0xW2qAxqRpGnP8/At4Y8Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74656832"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="74656832"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 14:07:51 -0700
X-CSE-ConnectionGUID: nTMpMCUyRzK6DOYbkscSyg==
X-CSE-MsgGUID: D0yNVXlcSE2r0EJyXgsarw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="182854004"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 14:07:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 14:07:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 14:07:49 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.22) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 14:07:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UBto3o+NGCpF4z5HUica6HCGHseuxeObN37U51aDaeAYdnXD5LKultR6Rg9L6g0rrVInApxSvbKNIjxhKiMM30vLjR+NL3O3E1U8TZG4uZ25mS/Ilzd0bj2GAwNdcpDAjuOL/snC9GnxoyhpailQV5Bwo29keNOVjnxoAMFQjQwfO276dVAfAyWgNsNcH6yokp0kgnLg0/B15wbkXzOPERkxjuxj1sYX2hWQ5ZH2TJPecI2Vr/231B/oxCfWo2Su4eEb6G0LBUb6nbO71dJLv/6n3d5UCgy+Vzg/bX7Kznq8jypqgeO4nSa33KKwJUKlmLAGGQS2CREzX5ymm/zOkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntP3ch6vZ1tQP953nAQSl356BPt689yOdiUzbD8nbT4=;
 b=oLT46LBkZuxdb9oHBeK9SswUSpnp15aIvdsIMYOl2EYVmF+nYUqg6n8riPz23cPgIOwMIgYcUmdlpZIVtRL4eZUDK5k2CcRX3/3HPCwM55rCToSMv5A9CrDeYYuDrxsPZNoDncKU7CLeZ7FZ0hQTqXEjtJHtmN2l1+lnL7suHWyhw6KqJxrfyGmhszuGhsSjNtlLvirin6m+0JPxTkfkkDXZ4sS1MQAP9ReUTsxwXT4VwsJWqPiioZiFOOulV9x87jrLXqKgurxKmR45uPBGZeAoFdBcXjqJvjw8zETp9j293sNmZsFQYTyTWMXwzyBV9KCWYUB8wxw0VNcxdzSuag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5330.namprd11.prod.outlook.com (2603:10b6:610:bd::7)
 by CY5PR11MB6341.namprd11.prod.outlook.com (2603:10b6:930:3e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 21:07:47 +0000
Received: from CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::9d32:3dfb:c2f1:40e2]) by CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::9d32:3dfb:c2f1:40e2%3]) with mapi id 15.20.9203.007; Tue, 21 Oct 2025
 21:07:47 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"mripard@kernel.org" <mripard@kernel.org>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "bmasney@redhat.com" <bmasney@redhat.com>,
	"joel@jms.id.au" <joel@jms.id.au>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] peci: controller: peci-aspeed: convert from round_rate()
 to determine_rate()
Thread-Topic: [PATCH] peci: controller: peci-aspeed: convert from round_rate()
 to determine_rate()
Thread-Index: AQHcCkU9/Mtiofu43UmyoEi8nlGYDrTNiOEA
Date: Tue, 21 Oct 2025 21:07:47 +0000
Message-ID: <ec059291186911553b38ddaab4375b51e89bd0af.camel@intel.com>
References: <20250810-peci-round-rate-v1-1-ec96d216a455@redhat.com>
In-Reply-To: <20250810-peci-round-rate-v1-1-ec96d216a455@redhat.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5330:EE_|CY5PR11MB6341:EE_
x-ms-office365-filtering-correlation-id: 92d4e1e4-3dce-4312-fe95-08de10e5e2bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?VElOc3hpZ1hVNmRMdWVtK1lxdjdURG9jVm1BVk9GYUN3WlgzeGZHYS9EZ3p6?=
 =?utf-8?B?RnhDUHhQd3E2U1JIZTEwOU1YSnVkL3lEeU5lZzlTUXhzeDRPdmpPMUZ4bHRF?=
 =?utf-8?B?YXQyWTZpV3l1YVl1eHVTUEJkMlVlU2FORS9oaWdybms4SFc1Q3JnVTBVbkNa?=
 =?utf-8?B?N2k4a0NXZ0gzRHArTnUxT3Urd3VObzFlSkFBWDU0bm1IM2ZVak15U2RDcU83?=
 =?utf-8?B?Lythc21LSXNSVGlRSlY5L0lYbUFuZkRYSTBYUzdkb3pIaGFCcVZXeWI0WU5i?=
 =?utf-8?B?MVpXWStEK3hhUFNVaFNHZ3RuTlNIRHA3UEFkbW14L2RlR1h3QTdRTnRsRlE5?=
 =?utf-8?B?UEtqSFZzQk9vMTVGSVVjdjl3ckgyU292eWJoUlFjbFFXM0Y4a3ZlVkEyMi9p?=
 =?utf-8?B?TXFoK2QyNDF4K3JUNHdoS2VEbmdHVExyNGZkOE9iam5WNnczRkd3RkhxQ3RO?=
 =?utf-8?B?ZVdzMTlTZHRQNzNtU1dNZmpJZFlLSUN3VGEzc0RiUTBpZnY0NmxHZ2t5UWM5?=
 =?utf-8?B?bXh3d0lDYUJ3U0RqMmZIRnFMSU1rT1dsRWFpclV0NnppdlZCK0liQ1h1T3FG?=
 =?utf-8?B?NW00eTlDOWJIMHQ4UCszTUhFaWV3aVFQcFNNTkk3NThJRmQ2OTY4eVVTek0v?=
 =?utf-8?B?ZlpoRjFxTEhUSUN6cFU1VG13VlBIMEN0Y1RJVzJ0V2V0VHk1Y0hXKzVqUS9V?=
 =?utf-8?B?aE5JV0RqNWxNL3ZPUExhUlFrc0dOZkc2TzhzbVJ2QmF3aGh0K1kzUjc4clc4?=
 =?utf-8?B?WXIyOWlRMU9yWUJwVmR0cHMrRjAzc3UxeUorekg1eDRQSXI1S0ptTE8yMVVK?=
 =?utf-8?B?emlUN0dkblYzZ1NaNlhmRXR2OFRMc1FVZklIbVlyTE4zalowZkFvWEpKa0hw?=
 =?utf-8?B?UUZSSk1XQ0hoMzJOUTdaQlZvOVdtMmZHbzc4d2s1ZXVZaFIyYkI4NnlWM2xU?=
 =?utf-8?B?WjNvRkxhT3dveUN3Z0JGNTVMSGlUQkh4UDd0NlBOUFpEZTlHSUdjNW50RjRw?=
 =?utf-8?B?bWE0Y2FvOWo5eGFFVWFmZ2JraiswZ3pBVi9SeGhhb09odGhxNTF4dSs4a1Vj?=
 =?utf-8?B?WGsvMTRvcGY0NWNaUUFXL2o2VkxDM0QrRUl2UUNDRXVRc1VMdjBrdmxpVG9u?=
 =?utf-8?B?RGUvU3pxQndjaWdFcHpjQ1kxVkx6T0ZVdTJoVDM5SHFTZjZqVlNPMTZoa2NS?=
 =?utf-8?B?Q2c5SGMwTGJmU0ovMGlsSGZrU3JRaWRMZFFMbXErZTFTVHRvbUZhRlVpSVJt?=
 =?utf-8?B?aHN4dnVNVzFXUkcwa3ZYeGEwQXlpQ010WTNaWUtiVTNHTFRhK0wvSjZ1ekFt?=
 =?utf-8?B?QnRVUFhQSVVXZ2FKVC9teW1hSmhwRno0SFlaTHhhdldvMWRzVHFhTUltZm9p?=
 =?utf-8?B?TmMrMjk1WkNJYXpWQzhOU1cwcG4wN2VLV1hya0JaSHdsc1FRWFlnbEJCK3l6?=
 =?utf-8?B?V0IrdHc3VHFNeTFXZ3NwbXlZT0VSNDZWQzdGYjFJZExHekcyZFo5WElqeHlO?=
 =?utf-8?B?SEdHQmdlcjVqOU5jY0lubGNWY3RUdWNIVDlvV2ZmdWd4OXQ2MXlsUFRFNjB4?=
 =?utf-8?B?VE1PenNJbFFOS3JTTW1PL2JqZE96UHRmZkt1YW9IZjF5T3dPR0w3cnlSYVVw?=
 =?utf-8?B?VnpiZ2s4dTUyYUNFNTUyaUZLRUpPbGJvMVNGeTdrYXMxNEIrcVU3S1lZWm42?=
 =?utf-8?B?akJRRzd6dXVTejI2RExBcDk5b0xocXlCWld5U2F3R01ZVU5sKzl5T2VyVFBW?=
 =?utf-8?B?T3BrdGY4eURwZkdmd0dFVi80YzB1U0xhYy9pbzE4MFd1NG9zUTdySGcvS3RV?=
 =?utf-8?B?c2RHd1FyOFk2VmtTRFgwL2xuRUswRWRDRkNrNkVNNFc0WnhKU1VrNkVXY2c1?=
 =?utf-8?B?NngvREVZZE0vLzdBdnpKSHF2TEZrYjlta3dKbm5JdnlvWGtTd3dOZ0p4T3Zq?=
 =?utf-8?B?enN5SXpOdXV6b3I1UXUzME9UdFlaL3c4REdyQURXcEZzUmhXK1M2eGdLV1Mw?=
 =?utf-8?B?Yko0R2dheU96Y0t4MFZqZWgrbGpjNTd4MGxyRHpCTDRJMjR3WjQzUngwYU44?=
 =?utf-8?Q?mOkkxd?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5330.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MlRVTUdCdG0ySFJ6eXROMXhJTG8vWklWSHdoSWxhSm1YWWs5ZjY5N3Zoc1V2?=
 =?utf-8?B?RXJoWjlvcFRmVTZxWkxUZEpuZEhVYXUwS0VaQzhDaGdpWjdWckFLSTRVSHdR?=
 =?utf-8?B?OE5mK1ByZFNGM2pmdjI1dWtrRkxUeGU4RU9wMzM1Z3lzTWJTVjlMMC93WHRY?=
 =?utf-8?B?ZlVGb1EzOEFlbllCNU5RVHdqdE1PTE1sUHNUb2RMOVh5bDd5dnEzNWI2d0lx?=
 =?utf-8?B?cmV1SFI5RWhZTHozZFFxWFhhOWxDakZVeEI0dVQzbkNRc2plK0ZHTTcxdUUw?=
 =?utf-8?B?clg0NktTcEUxOFptQkpJUUhJSVMvbG5XbkFYdXZyMVRycFRNOTFRN1M4WDR2?=
 =?utf-8?B?MGx0RkFMYlRSdUhHcVo0bDRkQWRCNGxxcUQyQmNjQThEcGVwUVFHS0lhN1pG?=
 =?utf-8?B?VEQzOEtSTmZ4QUkrT0x4a2JwVEErRFRCMGtCVjdMNUxMbThQK2o2cjYzU005?=
 =?utf-8?B?Z2txZDkyQWRUKzFiVUF5MXZ0U1Y1K0dkQ2VEdlBFYWY2bktndnVlMURUVjhp?=
 =?utf-8?B?SDN4cHhOdkRKdFc5R0lSSkJiNjFKYWdpbVJnTmw5eGY2WEFnSG5uYkdobCtz?=
 =?utf-8?B?WXNLcFJ0RDI3dThIbU9PTk56R2VTU3dTMXNyU1NxbTE0OEhqYStERERPVDlL?=
 =?utf-8?B?RGlUWS94Y2xQeE51anpMdU1YN2Y5V3VTNXR3RnBPWHdzVVFPZzArTURjOE5z?=
 =?utf-8?B?VGtmUVFsemU3UWkxc1lRVzQzQVJKRHl2eU9IOFpSUUpoeFRJTE14WFJ3OHl5?=
 =?utf-8?B?cWM3bC8zcW5CKzBnNUwrVnVMMVhEelRaL3B5UDhjU1dmRjR5clhMMlhiZ1NH?=
 =?utf-8?B?NjE0a2NCVnozN2R5bkVJNUZ4TUY5ZTlRZnNKL0pqYTlNQTZMMnJzMHZsNHRn?=
 =?utf-8?B?blJXRGZwbVB6QU13WHcwcWNFZUhidVdFL0RHVzRRVU1hUytWbmtrSjJBM3Fx?=
 =?utf-8?B?N1hYVk9Ub2VXT09HTUJTcnNHd0t5NGVkZmdJYjM1dS9IU3Q0c1lZRkNCT3FS?=
 =?utf-8?B?U1o5cUlGa3pTb3VDNFl0blNqN25sNk1uK2JzOHV2UTlmakZRVnM3S1FFSDZ1?=
 =?utf-8?B?OW40RzAvcEJZWnRtOFpDZkhZaU93UkpQRjhXYlloRWV5TE43OUNxVDZqcm4z?=
 =?utf-8?B?U2gwakZCdGNJV0Qrc3F3WmREWlgzSlVGcnBrdlFUUGFwbDArcEY0NlJNRjVN?=
 =?utf-8?B?MWgybmpVZVVMcTZiZUVianB0c00yVHhwK3Z0bmxQbEtJdEhWOWFmQlJjblQy?=
 =?utf-8?B?S25nTXlMa2NGd2d6OE9MellsWXYxV1o4czlpQjRtcDJFanhITlhJQW9yNThL?=
 =?utf-8?B?b2tQbWhwRGZueVcxcTR6V2ltd0RtdnNNN3pzUDl5ZG9vcDhrcE5lamhOc0t4?=
 =?utf-8?B?WGo2c21xcEJlMDE2dzM4Q0VvMjRRaW5jd2lkYjduWlNORmVCeTZTWmVqVWRD?=
 =?utf-8?B?dzhoU0hudWsrMTdBVVlDRVROb01haFhqUVFvMmlyOVUxbkFPa21lcFZiQXBR?=
 =?utf-8?B?aUVHNDkwT2Flb0xYZ2syVFZYSU9PckllUmdmcHluWGJnYVQ0U1VFalpVWFJj?=
 =?utf-8?B?N2hnNUg0b09rZVF2cjVBYTJyRWNUK2RTa0RyVjByajlEWnhCZ1R2VDg3aUV3?=
 =?utf-8?B?RzUwOFU5R1o5aElIT0FvQXRTTDZMYW9NRzVXdi9KcTZlblpWb0IvSzRySERx?=
 =?utf-8?B?NndZaThyNzFML1NFQWFhQkd4dXJYMGxsd1o3b1kyR1VHdHJ0WGt6aTdjdVBh?=
 =?utf-8?B?cTN1OGFrc29lTDlkWUVDNE9paUVEVzJFaUhuODdhdjhJWUZ6QTVFZ3dzVnE1?=
 =?utf-8?B?ZWYxbEpEY0RHRU5MRTUzOTlxK0lSTDk0d0w2T2RuMnZRMERzbnRlVEN2TFNp?=
 =?utf-8?B?Y2o5b2xqdDJIR1BvV3FHR2FjTFYzUmFxUTNCcm1nSlRpN29JOGJYZURiUG9t?=
 =?utf-8?B?Nk5zUlJ2bGFqWVBmdkxZb2JsazBCdGVPVFBiYjlvdmZhVDFEYS85UEQ0MmNl?=
 =?utf-8?B?WklxS3gvY2ZaQjdkYVpJL1ZTWFlVVWs3d2VsUVJYa1RYSnMzS0k5KzE5S1Q3?=
 =?utf-8?B?S2hRT01kd2wzMnVQYzNNOTJkM3g2S2RGd0o2TkM1bWhtR0ZubW5NNUIwSmRv?=
 =?utf-8?B?MWhJR0QvQjBZemRNWU5pcnhXWm9HbFVPQ0JmcTNPTHZWcGYvYWs4UDFLRU1C?=
 =?utf-8?B?R2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <51CC0E895BD2DA43848B70B1A571EA3F@namprd11.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d4e1e4-3dce-4312-fe95-08de10e5e2bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2025 21:07:47.0326
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XXBFtfNesDkgxZyp0PyFIrkuEZ95W4uKzlIw1ekQ1IRIeNOz50RxNNJm16ov4Zgy7pjTKnI5d2gqhpZoqMQR3uUPUWjFk5b4EG8x+pzhGEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6341
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

T24gU3VuLCAyMDI1LTA4LTEwIGF0IDE4OjIxIC0wNDAwLCBCcmlhbiBNYXNuZXkgd3JvdGU6DQo+
IFRoZSByb3VuZF9yYXRlKCkgY2xrIG9wcyBpcyBkZXByZWNhdGVkLCBzbyBtaWdyYXRlIHRoaXMg
ZHJpdmVyIGZyb20NCj4gcm91bmRfcmF0ZSgpIHRvIGRldGVybWluZV9yYXRlKCkgdXNpbmcgdGhl
IENvY2NpbmVsbGUgc2VtYW50aWMgcGF0Y2gNCj4gYXBwZW5kZWQgdG8gdGhlICJ1bmRlci10aGUt
Y3V0IiBwb3J0aW9uIG9mIHRoZSBwYXRjaC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE1h
c25leSA8Ym1hc25leUByZWRoYXQuY29tPg0KDQpSZXZpZXdlZC1ieTogSXdvbmEgV2luaWFyc2th
IDxpd29uYS53aW5pYXJza2FAaW50ZWwuY29tPg0KDQpUaGFua3MNCi1Jd29uYQ0KDQo+IC0tLQ0K
PiBDb2NjaW5lbGxlIHNlbWFudGljIHBhdGNoIGlzIGJlbG93LiBJdCdzIGxhcmdlIGFuZCBJIGRv
bid0IHdhbnQgdG8NCj4gcG9sbHV0ZSB0aGUga2VybmVsIGNoYW5nZWxvZyB3aXRoIHRoZSBzYW1l
IGNvZGUgaHVuZHJlZHMgb2YgdGltZXMsDQo+IHNvIHRoYXQncyB3aHkgaXQncyBpbmNsdWRlZCB1
bmRlciB0aGUgY3V0LiBGb3Igc3Vic3lzdGVtcyB3aXRoIG1vcmUNCj4gdGhhbiBvbmUgcGF0Y2gs
IEkndmUgaW5jbHVkZWQgaXQgb24gdGhlIGNvdmVyIGxldHRlci4NCj4gDQo+IMKgwqDCoCB2aXJ0
dWFsIHBhdGNoDQo+IA0KPiDCoMKgwqAgLy8gTG9vayB1cCB0aGUgY3VycmVudCBuYW1lIG9mIHRo
ZSByb3VuZF9yYXRlIGZ1bmN0aW9uDQo+IMKgwqDCoCBAIGhhc19yb3VuZF9yYXRlIEANCj4gwqDC
oMKgIGlkZW50aWZpZXIgcm91bmRfcmF0ZV9uYW1lID1+ICIuKl9yb3VuZF9yYXRlIjsNCj4gwqDC
oMKgIGlkZW50aWZpZXIgaHdfcGFyYW0sIHJhdGVfcGFyYW0sIHBhcmVudF9yYXRlX3BhcmFtOw0K
PiDCoMKgwqAgQEANCj4gDQo+IMKgwqDCoCBsb25nIHJvdW5kX3JhdGVfbmFtZShzdHJ1Y3QgY2xr
X2h3ICpod19wYXJhbSwgdW5zaWduZWQgbG9uZyByYXRlX3BhcmFtLA0KPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgKnBhcmVudF9yYXRlX3BhcmFtKQ0K
PiDCoMKgwqAgew0KPiDCoMKgwqDCoAkuLi4NCj4gwqDCoMKgIH0NCj4gDQo+IMKgwqDCoCAvLyBS
ZW5hbWUgdGhlIHJvdXRlX3JhdGUgZnVuY3Rpb24gbmFtZSB0byBkZXRlcm1pbmVfcmF0ZSgpDQo+
IMKgwqDCoCBAIHNjcmlwdDpweXRob24gZ2VuZXJhdGVfbmFtZSBkZXBlbmRzIG9uIGhhc19yb3Vu
ZF9yYXRlIEANCj4gwqDCoMKgIHJvdW5kX3JhdGVfbmFtZSA8PCBoYXNfcm91bmRfcmF0ZS5yb3Vu
ZF9yYXRlX25hbWU7DQo+IMKgwqDCoCBuZXdfbmFtZTsNCj4gwqDCoMKgIEBADQo+IA0KPiDCoMKg
wqAgY29jY2luZWxsZS5uZXdfbmFtZSA9IHJvdW5kX3JhdGVfbmFtZS5yZXBsYWNlKCJfcm91bmRf
cmF0ZSIsDQo+ICJfZGV0ZXJtaW5lX3JhdGUiKQ0KPiANCj4gwqDCoMKgIC8vIENoYW5nZSByYXRl
IHRvIHJlcS0+cmF0ZTsgYWxzbyBjaGFuZ2Ugb2NjdXJyZW5jZXMgb2YgJ3JldHVybiBYWFgnLg0K
PiDCoMKgwqAgQCBjaGdfcmF0ZSBkZXBlbmRzIG9uIGdlbmVyYXRlX25hbWUgQA0KPiDCoMKgwqAg
aWRlbnRpZmllciBoYXNfcm91bmRfcmF0ZS5yb3VuZF9yYXRlX25hbWU7DQo+IMKgwqDCoCBpZGVu
dGlmaWVyIGhhc19yb3VuZF9yYXRlLmh3X3BhcmFtOw0KPiDCoMKgwqAgaWRlbnRpZmllciBoYXNf
cm91bmRfcmF0ZS5yYXRlX3BhcmFtOw0KPiDCoMKgwqAgaWRlbnRpZmllciBoYXNfcm91bmRfcmF0
ZS5wYXJlbnRfcmF0ZV9wYXJhbTsNCj4gwqDCoMKgIGlkZW50aWZpZXIgRVJSID1+ICJFLioiOw0K
PiDCoMKgwqAgZXhwcmVzc2lvbiBFOw0KPiDCoMKgwqAgQEANCj4gDQo+IMKgwqDCoCBsb25nIHJv
dW5kX3JhdGVfbmFtZShzdHJ1Y3QgY2xrX2h3ICpod19wYXJhbSwgdW5zaWduZWQgbG9uZyByYXRl
X3BhcmFtLA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxv
bmcgKnBhcmVudF9yYXRlX3BhcmFtKQ0KPiDCoMKgwqAgew0KPiDCoMKgwqAgPC4uLg0KPiDCoMKg
wqAgKA0KPiDCoMKgwqAgLXJldHVybiAtRVJSOw0KPiDCoMKgwqAgK3JldHVybiAtRVJSOw0KPiDC
oMKgwqAgfA0KPiDCoMKgwqAgLSByZXR1cm4gcmF0ZV9wYXJhbTsNCj4gwqDCoMKgICsgcmV0dXJu
IDA7DQo+IMKgwqDCoCB8DQo+IMKgwqDCoCAtIHJldHVybiBFOw0KPiDCoMKgwqAgKyByZXEtPnJh
dGUgPSBFOw0KPiDCoMKgwqAgKw0KPiDCoMKgwqAgKyByZXR1cm4gMDsNCj4gwqDCoMKgIHwNCj4g
wqDCoMKgIC0gcmF0ZV9wYXJhbQ0KPiDCoMKgwqAgKyByZXEtPnJhdGUNCj4gwqDCoMKgICkNCj4g
wqDCoMKgIC4uLj4NCj4gwqDCoMKgIH0NCj4gDQo+IMKgwqDCoCAvLyBDb2NjaW5lbGxlIG9ubHkg
dHJhbnNmb3JtcyB0aGUgZmlyc3Qgb2NjdXJyZW5jZSBvZiB0aGUgcmF0ZSBwYXJhbWV0ZXINCj4g
wqDCoMKgIC8vIFJ1biBhIHNlY29uZCB0aW1lLiBGSVhNRTogSXMgdGhlcmUgYSBiZXR0ZXIgd2F5
IHRvIGRvIHRoaXM/DQo+IMKgwqDCoCBAIGNoZ19yYXRlMiBkZXBlbmRzIG9uIGdlbmVyYXRlX25h
bWUgQA0KPiDCoMKgwqAgaWRlbnRpZmllciBoYXNfcm91bmRfcmF0ZS5yb3VuZF9yYXRlX25hbWU7
DQo+IMKgwqDCoCBpZGVudGlmaWVyIGhhc19yb3VuZF9yYXRlLmh3X3BhcmFtOw0KPiDCoMKgwqAg
aWRlbnRpZmllciBoYXNfcm91bmRfcmF0ZS5yYXRlX3BhcmFtOw0KPiDCoMKgwqAgaWRlbnRpZmll
ciBoYXNfcm91bmRfcmF0ZS5wYXJlbnRfcmF0ZV9wYXJhbTsNCj4gwqDCoMKgIEBADQo+IA0KPiDC
oMKgwqAgbG9uZyByb3VuZF9yYXRlX25hbWUoc3RydWN0IGNsa19odyAqaHdfcGFyYW0sIHVuc2ln
bmVkIGxvbmcgcmF0ZV9wYXJhbSwNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB1bnNpZ25lZCBsb25nICpwYXJlbnRfcmF0ZV9wYXJhbSkNCj4gwqDCoMKgIHsNCj4gwqDCoMKg
IDwuLi4NCj4gwqDCoMKgIC0gcmF0ZV9wYXJhbQ0KPiDCoMKgwqAgKyByZXEtPnJhdGUNCj4gwqDC
oMKgIC4uLj4NCj4gwqDCoMKgIH0NCj4gDQo+IMKgwqDCoCAvLyBDaGFuZ2UgcGFyZW50X3JhdGUg
dG8gcmVxLT5iZXN0X3BhcmVudF9yYXRlDQo+IMKgwqDCoCBAIGNoZ19wYXJlbnRfcmF0ZSBkZXBl
bmRzIG9uIGdlbmVyYXRlX25hbWUgQA0KPiDCoMKgwqAgaWRlbnRpZmllciBoYXNfcm91bmRfcmF0
ZS5yb3VuZF9yYXRlX25hbWU7DQo+IMKgwqDCoCBpZGVudGlmaWVyIGhhc19yb3VuZF9yYXRlLmh3
X3BhcmFtOw0KPiDCoMKgwqAgaWRlbnRpZmllciBoYXNfcm91bmRfcmF0ZS5yYXRlX3BhcmFtOw0K
PiDCoMKgwqAgaWRlbnRpZmllciBoYXNfcm91bmRfcmF0ZS5wYXJlbnRfcmF0ZV9wYXJhbTsNCj4g
wqDCoMKgIEBADQo+IA0KPiDCoMKgwqAgbG9uZyByb3VuZF9yYXRlX25hbWUoc3RydWN0IGNsa19o
dyAqaHdfcGFyYW0sIHVuc2lnbmVkIGxvbmcgcmF0ZV9wYXJhbSwNCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nICpwYXJlbnRfcmF0ZV9wYXJhbSkNCj4g
wqDCoMKgIHsNCj4gwqDCoMKgIDwuLi4NCj4gwqDCoMKgICgNCj4gwqDCoMKgIC0gKnBhcmVudF9y
YXRlX3BhcmFtDQo+IMKgwqDCoCArIHJlcS0+YmVzdF9wYXJlbnRfcmF0ZQ0KPiDCoMKgwqAgfA0K
PiDCoMKgwqAgLSBwYXJlbnRfcmF0ZV9wYXJhbQ0KPiDCoMKgwqAgKyAmcmVxLT5iZXN0X3BhcmVu
dF9yYXRlDQo+IMKgwqDCoCApDQo+IMKgwqDCoCAuLi4+DQo+IMKgwqDCoCB9DQo+IA0KPiDCoMKg
wqAgLy8gQ29udmVydCB0aGUgZnVuY3Rpb24gZGVmaW5pdGlvbiBmcm9tIHJvdW5kX3JhdGUoKSB0
byBkZXRlcm1pbmVfcmF0ZSgpDQo+IMKgwqDCoCBAIGZ1bmNfZGVmaW5pdGlvbiBkZXBlbmRzIG9u
IGNoZ19yYXRlIEANCj4gwqDCoMKgIGlkZW50aWZpZXIgaGFzX3JvdW5kX3JhdGUucm91bmRfcmF0
ZV9uYW1lOw0KPiDCoMKgwqAgaWRlbnRpZmllciBoYXNfcm91bmRfcmF0ZS5od19wYXJhbTsNCj4g
wqDCoMKgIGlkZW50aWZpZXIgaGFzX3JvdW5kX3JhdGUucmF0ZV9wYXJhbTsNCj4gwqDCoMKgIGlk
ZW50aWZpZXIgaGFzX3JvdW5kX3JhdGUucGFyZW50X3JhdGVfcGFyYW07DQo+IMKgwqDCoCBpZGVu
dGlmaWVyIGdlbmVyYXRlX25hbWUubmV3X25hbWU7DQo+IMKgwqDCoCBAQA0KPiANCj4gwqDCoMKg
IC0gbG9uZyByb3VuZF9yYXRlX25hbWUoc3RydWN0IGNsa19odyAqaHdfcGFyYW0sIHVuc2lnbmVk
IGxvbmcgcmF0ZV9wYXJhbSwNCj4gwqDCoMKgIC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHVuc2lnbmVkIGxvbmcgKnBhcmVudF9yYXRlX3BhcmFtKQ0KPiDCoMKgwqAgKyBpbnQgbmV3X25h
bWUoc3RydWN0IGNsa19odyAqaHcsIHN0cnVjdCBjbGtfcmF0ZV9yZXF1ZXN0ICpyZXEpDQo+IMKg
wqDCoCB7DQo+IMKgwqDCoMKgwqDCoMKgIC4uLg0KPiDCoMKgwqAgfQ0KPiANCj4gwqDCoMKgIC8v
IFVwZGF0ZSB0aGUgb3BzIGZyb20gcm91bmRfcmF0ZSgpIHRvIGRldGVybWluZV9yYXRlKCkNCj4g
wqDCoMKgIEAgb3BzIGRlcGVuZHMgb24gZnVuY19kZWZpbml0aW9uIEANCj4gwqDCoMKgIGlkZW50
aWZpZXIgaGFzX3JvdW5kX3JhdGUucm91bmRfcmF0ZV9uYW1lOw0KPiDCoMKgwqAgaWRlbnRpZmll
ciBnZW5lcmF0ZV9uYW1lLm5ld19uYW1lOw0KPiDCoMKgwqAgQEANCj4gDQo+IMKgwqDCoCB7DQo+
IMKgwqDCoMKgwqDCoMKgIC4uLiwNCj4gwqDCoMKgIC3CoMKgIC5yb3VuZF9yYXRlID0gcm91bmRf
cmF0ZV9uYW1lLA0KPiDCoMKgwqAgK8KgwqAgLmRldGVybWluZV9yYXRlID0gbmV3X25hbWUsDQo+
IMKgwqDCoMKgwqDCoMKgIC4uLiwNCj4gwqDCoMKgIH0NCj4gDQo+IE5vdGUgdGhhdCBJIHVzZWQg
Y29jY2luZWxsZSAxLjIgaW5zdGVhZCBvZiAxLjMgc2luY2UgdGhlIG5ld2VyIHZlcnNpb24NCj4g
YWRkcyB1bm5lY2Vzc2FyeSBicmFjZXMgYXMgZGVzY3JpYmVkIGluIHRoaXMgcG9zdC4NCj4gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvY29jY2kvNjc2NDI0NzctNWYzZS00YjJhLTkxNGQtNTc5YTU0
ZjQ4Y2JkQGludGVsLmNvbS8NCj4gLS0tDQo+IMKgZHJpdmVycy9wZWNpL2NvbnRyb2xsZXIvcGVj
aS1hc3BlZWQuYyB8IDEyICsrKysrKystLS0tLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wZWNp
L2NvbnRyb2xsZXIvcGVjaS1hc3BlZWQuYw0KPiBiL2RyaXZlcnMvcGVjaS9jb250cm9sbGVyL3Bl
Y2ktYXNwZWVkLmMNCj4gaW5kZXgNCj4gYWQzYTdkNzFlZDRjNjFlNjEyM2RjYmJhZDI2NDgxMmNi
ODNjYmIwNy4uYTBjOTllY2Y3ZjM4MDVhMWNkYWM1NWE4ZDVkYjljNjFhZDNjDQo+IGYzN2MgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvcGVjaS9jb250cm9sbGVyL3BlY2ktYXNwZWVkLmMNCj4gKysr
IGIvZHJpdmVycy9wZWNpL2NvbnRyb2xsZXIvcGVjaS1hc3BlZWQuYw0KPiBAQCAtMzYyLDEyICsz
NjIsMTQgQEAgc3RhdGljIGludCBjbGtfYXNwZWVkX3BlY2lfc2V0X3JhdGUoc3RydWN0IGNsa19o
dyAqaHcsDQo+IHVuc2lnbmVkIGxvbmcgcmF0ZSwNCj4gwqAJcmV0dXJuIDA7DQo+IMKgfQ0KPiDC
oA0KPiAtc3RhdGljIGxvbmcgY2xrX2FzcGVlZF9wZWNpX3JvdW5kX3JhdGUoc3RydWN0IGNsa19o
dyAqaHcsIHVuc2lnbmVkIGxvbmcgcmF0ZSwNCj4gLQkJCQnCoMKgwqDCoMKgwqAgdW5zaWduZWQg
bG9uZyAqcHJhdGUpDQo+ICtzdGF0aWMgaW50IGNsa19hc3BlZWRfcGVjaV9kZXRlcm1pbmVfcmF0
ZShzdHJ1Y3QgY2xrX2h3ICpodywNCj4gKwkJCQkJwqAgc3RydWN0IGNsa19yYXRlX3JlcXVlc3Qg
KnJlcSkNCj4gwqB7DQo+IC0JaW50IGRpdiA9IGNsa19hc3BlZWRfcGVjaV9nZXRfZGl2KHJhdGUs
IHByYXRlKTsNCj4gKwlpbnQgZGl2ID0gY2xrX2FzcGVlZF9wZWNpX2dldF9kaXYocmVxLT5yYXRl
LCAmcmVxLT5iZXN0X3BhcmVudF9yYXRlKTsNCj4gwqANCj4gLQlyZXR1cm4gRElWX1JPVU5EX1VQ
X1VMTCgqcHJhdGUsIGRpdik7DQo+ICsJcmVxLT5yYXRlID0gRElWX1JPVU5EX1VQX1VMTChyZXEt
PmJlc3RfcGFyZW50X3JhdGUsIGRpdik7DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gwqB9DQo+IMKg
DQo+IMKgc3RhdGljIHVuc2lnbmVkIGxvbmcgY2xrX2FzcGVlZF9wZWNpX3JlY2FsY19yYXRlKHN0
cnVjdCBjbGtfaHcgKmh3LCB1bnNpZ25lZA0KPiBsb25nIHByYXRlKQ0KPiBAQCAtMzk0LDcgKzM5
Niw3IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIGNsa19hc3BlZWRfcGVjaV9yZWNhbGNfcmF0ZShz
dHJ1Y3QNCj4gY2xrX2h3ICpodywgdW5zaWduZWQgbG9uDQo+IMKgDQo+IMKgc3RhdGljIGNvbnN0
IHN0cnVjdCBjbGtfb3BzIGNsa19hc3BlZWRfcGVjaV9vcHMgPSB7DQo+IMKgCS5zZXRfcmF0ZSA9
IGNsa19hc3BlZWRfcGVjaV9zZXRfcmF0ZSwNCj4gLQkucm91bmRfcmF0ZSA9IGNsa19hc3BlZWRf
cGVjaV9yb3VuZF9yYXRlLA0KPiArCS5kZXRlcm1pbmVfcmF0ZSA9IGNsa19hc3BlZWRfcGVjaV9k
ZXRlcm1pbmVfcmF0ZSwNCj4gwqAJLnJlY2FsY19yYXRlID0gY2xrX2FzcGVlZF9wZWNpX3JlY2Fs
Y19yYXRlLA0KPiDCoH07DQo+IMKgDQo+IA0KPiAtLS0NCj4gYmFzZS1jb21taXQ6IDhmNWFlMzBk
NjlkNzU0M2VlZTBkNzAwODNkYWY0ZGU4ZmUxNWQ1ODUNCj4gY2hhbmdlLWlkOiAyMDI1MDcyOS1w
ZWNpLXJvdW5kLXJhdGUtNTQzNjM5Mjk3ZWM2DQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQoNCg==

