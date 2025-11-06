Return-Path: <openbmc+bounces-852-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C3EC3BEF3
	for <lists+openbmc@lfdr.de>; Thu, 06 Nov 2025 16:02:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2QQk4jP7z2xS2;
	Fri,  7 Nov 2025 02:02:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=198.175.65.19 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762441342;
	cv=pass; b=g9CtToDJc6C57Ogic/gYwApPNa7lqMvhzgOcXL25L2qPwUY5QamMxogfI+vrODJ/OD9LQy83RZY3ZXnql2uPBhiFrWhg7vS8046ehECJC3iZxoUdFa6tSyqxfF4QiuMljRzOsmuaMclrN8z0TwbF4xmCUS7dJT/8M4V1mgbqtlltPOQp3Ml8IGordbvEKbYcuk+glMYuH2/HavoP4zm5JeJGgYPgNHmUcBmyYMsYXwD0cJVZ/xeaneCbVNBcDt3+Amine37nmPhkR3G+P1R2dM9+l+APwsXQ1w60hi5svZ7rVAy+ts+E73RB/qSj0XzWpiml54m/TNwdQSuDoGNT8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762441342; c=relaxed/relaxed;
	bh=ds14I6qcHzLD0H9wdHge5WM2YtobQnfFE5A0FW9rn7A=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=g7/xDArTVKT1178nfRVFUFvtRPl8UylssaN/YTwqBS+2Ck0rksfg4IMsBCahrJzWqF+ueccUQPJNqGOeZmmUKVOE2HG9PDUidBwgnb9AL1SgDweR5Armz4XyRg91VtK+y9rY9sLYgwGjSiQdDY0Neoy9zX4cF7sQiPdi2jfx0rQZhWERnn7qRHEDVvZSsRM9yQRpcZ4gsmCJ5Jdmfin9Lyd84joiNAJzQVTH0i7x+X5O0YsD9we/S5xS8hF3m0N1oPVIqC7Iij2iJSF6WtraUFRdP+XbILzQDvR+qJoH8i10GNxtPZ9wHDkPvo0usKpyPHVuS7J9BueEVF9J20gk6g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K0/0OA1j; dkim-atps=neutral; spf=pass (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K0/0OA1j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2QQj4mmDz2xK5
	for <openbmc@lists.ozlabs.org>; Fri,  7 Nov 2025 02:02:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762441343; x=1793977343;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=ds14I6qcHzLD0H9wdHge5WM2YtobQnfFE5A0FW9rn7A=;
  b=K0/0OA1jeuiJfzCA2BPy/Fb3Agg5fwdhC7QyO/WrHyaQGoB3FZCzUTmc
   mOV4ZkPl/1RyX1KGAgihAD06l0lvFgVSOsXO3dsB+3vPX5dvskP1C5OxZ
   cmnVUnnZQZQRUrr/X3OnUhiWyHeV2WIMJ+Ff7bQXohUOC3izaMeePa6Je
   CzGK1wbPn2pu0gZ62WsqcFMDJQjo7O3FjwTXi1wNksqiLsnZqag+DtyD+
   FmXaLD1t3OQNwI9tGBxIo+0kc4/o9BuAiLRG3Mn/jaT/pj0WyKlz94BsK
   8fVDUx/Eg3qTy1i95VnyTeg84DGOFlINQXTzeYPixQxC/sy8rxOzmJlBm
   w==;
X-CSE-ConnectionGUID: ITQ0PGOBT+SP6qGqSWOhQA==
X-CSE-MsgGUID: zD6JB8P5TZC5iAzRVHc3hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64461864"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="64461864"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 07:02:19 -0800
X-CSE-ConnectionGUID: /x+4XfB9SHWxHYsopO8S3w==
X-CSE-MsgGUID: +wucdORETkOiLYF2JOxVfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="187492374"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 07:02:18 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 07:02:17 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 07:02:17 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.41) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 07:02:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bzsa3f+31zNTShP7jgyRtC4RBg+0K3bpZNCr10JEGjP2vGWWaBPg7eKxo49Hxj/aNe3Ng6dtK91X5T3mAgofBtTEYpV2K3krJkB3oFTN/AVySUOr+hlxXvaN0oNsAfFteFjSWNQyrw2WFqh2GVsuGZLX/wTCutLC3re0cwgFuiCq7H4lg7TyuMnM/yKng+48/ZgtA/QGq7sEIGq0178qwXzRk/8sH4YXkcT4xBbzjvZdWHQlcDVlEW2kvEoWNSrhLw+At7rFokLu/tFOB2CVS7el95EhnbEE71MljlARmlm6f2WeY/E345x7tZR4h/sVNhM6OqXIMiHWJSnjorCvLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ds14I6qcHzLD0H9wdHge5WM2YtobQnfFE5A0FW9rn7A=;
 b=bgU1o5cVinsoKHBiAL9ggLvAerNlQ8nUQ9ncSkrjpX9iUyin7Md5o3+fBuDpVpfHDRq5p3XiuJwQNp9vBXwDRJWjTxgVs2qFNKFSvNEcHy7Ck9u4WQO5FdSSApZUKODeKU9b72XH6auD41mqnZLXMASVQkmiS8FGFUZ9am8PVRs3l43E7vvyOHX2CRTFwzGwvu2iP56Z3x8ESX3I67jDK8P0cHNsuhn0NdwdrSjQwTvtzO68gXGkJtnFR+/2XCkOTGAnaOVmSt51VftRoQP9klZL6CoaaW6NvO3v5R0l+T0cs1kfTdJ7jnFRMDRbCjIMgX2nRs/z/TlKn73bIPDlcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5330.namprd11.prod.outlook.com (2603:10b6:610:bd::7)
 by IA1PR11MB9494.namprd11.prod.outlook.com (2603:10b6:208:59c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 15:02:16 +0000
Received: from CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::9d32:3dfb:c2f1:40e2]) by CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::9d32:3dfb:c2f1:40e2%3]) with mapi id 15.20.9275.013; Thu, 6 Nov 2025
 15:02:15 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] PECI changes for v6.19-rc1
Thread-Topic: [GIT PULL] PECI changes for v6.19-rc1
Thread-Index: AQHcTy5WXMP3ESrIeE2JL4gXZ8xGCA==
Date: Thu, 6 Nov 2025 15:02:15 +0000
Message-ID: <a8bc9becd448a48eb286697155ac8ec716e3467c.camel@intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5330:EE_|IA1PR11MB9494:EE_
x-ms-office365-filtering-correlation-id: ca6c9034-9667-4b8e-9a46-08de1d457938
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?bGtUT2htRzNISTFEVWhFT3Bnc0tkUmJBTkJEcnM5aERibGUrOFlpVnNQbFN4?=
 =?utf-8?B?VVROUWd0N3NzdnFXNS9RSnUrZ1lreGJDZVo5QjRVSzlaWjZjMUx2QWg3Y0RE?=
 =?utf-8?B?TmlOU2oyY1J3Z1NQSVlBK3JOTk5scGN6WTdTWk1tS042d0hDUUwyZ1FTRzYz?=
 =?utf-8?B?MTZqVGhpckJYeG5hYjNPQ0w5SnBHRVBqNlhsVmRwL3h5eWUwREtCRnp6WkRN?=
 =?utf-8?B?Q296Rm5KTzY2L1BSMG5tUmpuR2VSb3diazNpNk5oWXBEbS9CdEdpTVNMeTNu?=
 =?utf-8?B?RWpjQUdSazkrcVhVdm1mSGh4R0JTdWFQWUIybU1tKzdUMjFaMnhBUVlFNG9y?=
 =?utf-8?B?MjFId3ZVaEdramROQlRMcXArdGhDeWE4YmhGWklOWW9HNXlwb2VxYklVajNw?=
 =?utf-8?B?Zm9UKzFMdGpoNk9qbkQxVzJ6NGZSd3BxYXJvRnZQajFoWmdXdEdmUDdNNzRR?=
 =?utf-8?B?RUY2NVRzT2c5WDBxQVV1aVVCNmt6R3VPU2dwTUhxS1dzN0E5V2M0ZUJxYk9M?=
 =?utf-8?B?M3N0NkVsUm1WK2NHK3YvaWFxNHVjMTMrMVMwaHEzeE1GL2EzeUJIV3k1WDRC?=
 =?utf-8?B?RkR3VXpYd21lczcxM1NabnhyZENkMWx4Q0hIMHEybjVnRnB6TFQybHRGeHVy?=
 =?utf-8?B?V2JYMmI4bzdDUUd2RGt3WERtQm50U05jY2M0MVd6TmY1c1I3U1BxMmhvcEt2?=
 =?utf-8?B?YUd3R0VCMm5zNUhEd1RrNGt2VzRiellCYTRuWUpna29pNmZwaG9Qcm9FZDMz?=
 =?utf-8?B?d010QnJuVGtoVTk4NDJjcG1xM0Y3aGJLZWZZZExhUGp0eGhXUlhDS3hqZEdz?=
 =?utf-8?B?Z1g4SlEzSm51SUdtUVYxVzFDd0UyQk5ma1VKcHVpWTNkZ0JkdHlJMGlsSFQ0?=
 =?utf-8?B?ZlorWVJvdG1FY1FLakxlSEV4TnNtRS9ILzdESlNzMTd5KzFBbjhHRGRFSy9H?=
 =?utf-8?B?NElxbGdVamY5cnRacC9mS2E1Rk9kR2I0UjdNTjlLeVVZTjN1MWM4cU4yL3N6?=
 =?utf-8?B?bFhpYTNtSXJzaXZVMnFnZUdMemE0dVpTVVFEdjF0TDhWR3lhUVdtOWZLQ1Fr?=
 =?utf-8?B?SEl3Ymh1NzV5U0x0V09uSjNPcHRQMmY3MUNRcXNxc25oZjErdDQ0eElCU0c0?=
 =?utf-8?B?QzJ5SlcvdERGdUNKWWp2REpoSGF2aWduTTRZamwyRm0wNE5LblE3Q0dMRjY1?=
 =?utf-8?B?cldMRXJEb0ZHMGY2c055V3RCTm1MTXh4cFBySkEzOEhIcVRFT2lSUnJzNisv?=
 =?utf-8?B?YmtVWWkya2x4aW13K0tGVXIySmtpeXcxNVhaS2UwYzdPKzZhQWVkZjNaei80?=
 =?utf-8?B?dUw5N2Njb1J0Q2cvd0F4VkU4T29iQzRKVTBDK3FQRktEM05tSlBnZGhWbEhk?=
 =?utf-8?B?Q1FnOVlDMnJyaE9lSzdWaHBhTklrTjVudkJXZjA1bUsrL0hRNTFlcCttakhi?=
 =?utf-8?B?VHpXdi9PM2NFVDFGQ0NVL0tKbWNHdkE0ZVAwU2N3d3FDTXF2M1ZEZ0lOcU1m?=
 =?utf-8?B?ZVUwRmpJRlJjcnk1akd2MkxsVU02ZGxsMkg4bmVLWEdSWmpPc2E4S01KL3Ry?=
 =?utf-8?B?b2t2clRuSWRQdlMzOTJlb1hQY0JVNnhLSm1UblQyL1FFRkFDR3BabU5ZcXBO?=
 =?utf-8?B?ZFNYbTkwM2N1TDhtNWhMTGsvenkyZ1pTaVBxbUxuV1BUMlhWZktQYi9NVk5X?=
 =?utf-8?B?bTZNdEhCZTJpd1ZaYnc1amRhMVJQblRqcWpiM1JSVm8vb1VsNnFhc0FKRG9n?=
 =?utf-8?B?Sy9FWHVBalk1QnZmM2V5TVdlQXA5UjJsU0tiT3UrZFlocHhTWVFoWlcyZ3JB?=
 =?utf-8?B?MHJTeEphRWhPa3doSDZtL0FoRnV0QUhraWNFdi9rNTlKV3NGSTk5cC95S0lT?=
 =?utf-8?B?UmtMRUVBNXdPazZIYVNkVlREN3ovWWtQVnM1SjR0Rk0zcURSNk8yN0pFNmMw?=
 =?utf-8?B?a0xRTGdJUHJiTUdoVTFsV2d4YTRteHFOaGNENEpSU25jemVLWTkxMk1KbGdR?=
 =?utf-8?B?OUF2OUdKemFkVE84ZlZ0VERrOTQrcGkyMHhia2FUL0I2WFpJTUFrUERDRk5V?=
 =?utf-8?Q?4b/NQa?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5330.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T3I0Q1dublR2eWhTQ3hLaWQ0QlY3WjBiNDBBcERYbmNUS3Qxd0JuWllGWndh?=
 =?utf-8?B?dmhnQ2t4U0U1U1pNVXRYemowZU5IK0pxTHY0Mnd4Y1R4QW9yZG9hbEgxYVJF?=
 =?utf-8?B?U3UrYitLdS9USjRTUXk3YzhlZVQrajArS1ZUQlhKUmZKM2hldjI0YTZwdVhu?=
 =?utf-8?B?ZnBhTHpGWG5QMFRGc0pYRGJFK1BvWnNnUWJuSEdWTlV3MUdZeEcwaFp0T2tK?=
 =?utf-8?B?bUlFOEZCRmRJRnhlUmdBOUw4T1pRNDBnZXZ0aEYzZm05bG5NVmthM3VFbkNG?=
 =?utf-8?B?Mlg1dGIrYU5WNVFhY2lONWRFaENmSGExL25ZZ2xkclp5T2wvbTI2RmpmcW83?=
 =?utf-8?B?cjZzemxTckEvcmdUTmZmTWx5Wk9mMDlwdHZSYncrRlF2bXpwdWM1ZHVNbEJE?=
 =?utf-8?B?cTV1WnFMRnVLa3ZOVlZSaDZ6YlJQTXZEWXdiMllRLzNhTVRycDNuNi8wcEtC?=
 =?utf-8?B?KzB4d2F0WGhiV0Jkb2tDVXZkU2lObjN2YkxldFhKcjNPZFNvNmZCSXpGMS9s?=
 =?utf-8?B?OVBKdDNyRDI1RzNlbUpaTU94MDhuVFRSOFBubFFCSm9XeVNIR0RyNTg3NU5X?=
 =?utf-8?B?TUR4Z2hDUUJUNkVkUVJSMTFUd2VlSitiUFQ1a1dVL044OHFMYllTa3RBVmhT?=
 =?utf-8?B?MWFIOVNVVUoycVh3S1hRKzBKQzFXQUpySVg2cHBQNlZFRmcxQWh0a05SRVp3?=
 =?utf-8?B?cEkxNXdJTWdyQ25FdUdaZlVmRnVKWmgxbysxMzNjRTZnN0x2WFFZVDNpR0Fa?=
 =?utf-8?B?U0VQZHgzcnB2OTM5aTFGV29QMlBNMHl5K3VnbndDejROUEUzUHV6MEhYNW5n?=
 =?utf-8?B?NnJIOFZ6RFRibTV0TEtWY2hMSVNkaGcrZ3pVVWUwcTdPdzh1Umlud01XZkMy?=
 =?utf-8?B?V2N4Wnd6NFVBOVFHY0Zqd1JZVUdKdkw1MzUxTlZNeGpBRWtPdFI4SytuVDF5?=
 =?utf-8?B?TEtEQlExSG9KTHJQUnV6UGdkWE54QWpNckVycGJTVjFQdVRMN3h6ZVkvVTc1?=
 =?utf-8?B?K1dNaDZPQjBNdUVvM282WWtoQngyeTRqYzBISE9HUzFkbFpnNGVudjFZQ2hO?=
 =?utf-8?B?RUNnUGNxb1haaEJBaXVTaFdHTEVCNFZGQWFIaE5kMnRUbUN0Vnh0eUgwTmNU?=
 =?utf-8?B?UmxDbEZZTzFkZjcxaTRPZFhFMWJWb1crbmY4bmw3eXNFT2l0Qk9YK3M5WGNP?=
 =?utf-8?B?S2NzVHdTemJlN2UzbGhrVVVRWWtrQXRxb0Z6aXBoTDY0RVJpMzNJWUpMT25z?=
 =?utf-8?B?ci9DS2dvdlgzTWxJMWJFNzNsZjhnTFdqL2pnN3J3TndvKzh5L3NNN2p2WEJO?=
 =?utf-8?B?ZEZWMUIzSnp4Q3ljbC9ZUC9kdXB6YTVDSlBlcEFJOXpyQ0hCeEtwS1pkOHl4?=
 =?utf-8?B?ZGZ0NU5JWW9JMEluSzJRYzZqTnhDVldzOEdQYUo0anVTTkZiN2JRZEUzcFpZ?=
 =?utf-8?B?cDdML3pZb0ZVN0lSbDluWDhjcmZKbW1sYkRWckJWZTZKNGFHcnM5QUx6REVu?=
 =?utf-8?B?TnlWWVAwaEZpRWx6QUpkU2ErN20zYzFMeWJHTXVMWDhxSEdJQ0U3enRSMzhD?=
 =?utf-8?B?aWx0WjhWdHlMQmsrNjRHSVdLU0FMMVg3bHFPbDZiaDF0eWxteG1NQ2VRc09m?=
 =?utf-8?B?bmEwZmMzazFWVUgyQUM4NXJieU5MdXhGQmZZeEx3SXlUQ25pSVdLaFBONC8x?=
 =?utf-8?B?ZXdXWXRyR29nYUF0cDdrNC91aGxyeWNpQnExRjRhcVpITDRFYUlMYlE0U0hB?=
 =?utf-8?B?dkFNeW5VcXBnVmt4dkw3N05kL1pPVGVUUk82V2lUTFc2VTFhaURsM3dPbmty?=
 =?utf-8?B?UkhzZGlKUC85T0tyRFJUbE9VQU93R2VVMkRsV3NQWlRQWG1OdGNzd3JHaFAx?=
 =?utf-8?B?VkhMb3gzNWVuckZveDl2MkN5OUZvS3pSYTB4Yy9md01yQklqeExCS3lrWTRm?=
 =?utf-8?B?MnZWZHFLb01TRUM5RllyYTdaZEtVSzFnSS8zM1M2R1RWc3lGRnFwaG4wOFF1?=
 =?utf-8?B?NyszZHRvd3VsWUlQOEpXSDYxSHpJVklkejE1TzVDajhDT0V1U2hrQ3lTeHRL?=
 =?utf-8?B?cU5GNnBPam1QenV3VDhlcS93WlBUcU1ueTkwK1NYMnVUVk1YMXpxRC8zRUpU?=
 =?utf-8?B?MnFUbERrU3RpTStMY2R3UlB5Vk5taHh0bkpyYWQ5QkVaV1VoaVZZTGtlSjQv?=
 =?utf-8?B?ekE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <77D55C33A1406B43BFAD137212F799A6@namprd11.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ca6c9034-9667-4b8e-9a46-08de1d457938
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 15:02:15.6532
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: naVNN9JZENpzjT6lYCtMhp38OnE7TbwIU/uH+hj97lBhNTgBvZSjgIN7U09jkaJ59Hq0ZO6+PREPoLVEkaDhw+nfsHrUjFFGTNlkapBZiNE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9494
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

SGkgR3JlZyENCg0KUGxlYXNlIHB1bGwgUEVDSSB1cGRhdGUgZm9yIExpbnV4IHY2LjE5Lg0KDQpU
aGFua3MNCi1Jd29uYQ0KDQpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGRjYjZm
YTM3ZmQ3YmM5YzNkMmIwNjYzMjliMGQyN2RlZGY4YmVjYWE6DQoNCiAgTGludXggNi4xOC1yYzMg
KDIwMjUtMTAtMjYgMTU6NTk6NDkgLTA3MDApDQoNCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCBy
ZXBvc2l0b3J5IGF0Og0KDQogIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC9pd2kvbGludXguZ2l0IHRhZ3MvcGVjaS1uZXh0LTYuMTktcmMxDQoNCmZvciB5b3Ug
dG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAzMTEyYjU4OWQzYTk5YTUyNDY3YTAzNGRiNmFiZDM1ZmVl
NWM3YzdjOg0KDQogIHBlY2k6IGNvbnRyb2xsZXI6IHBlY2ktYXNwZWVkOiBjb252ZXJ0IGZyb20g
cm91bmRfcmF0ZSgpIHRvIGRldGVybWluZV9yYXRlKCkgKDIwMjUtMTEtMDYgMTQ6NTE6MzcgKzAx
MDApDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0NClVwZGF0ZSBwZWNpLW5leHQgZm9yIHY2LjE5LXJjMQ0KDQpBIHNtYWxs
IGNoYW5nZSBpbiBwZWNpLWFzcGVlZCBjb252ZXJ0aW5nIHRoZSBkcml2ZXIgYXdheSBmcm9tIGRl
cHJlY2F0ZWQNCnJvdW5kX3JhdGUoKSwgYWxsb3dpbmcgaXQgdG8gZXZlbnR1YWxseSBiZSByZW1v
dmVkIGZyb20gY2xrIHN1YnN5c3RlbS4NCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KQnJpYW4gTWFzbmV5ICgxKToNCiAg
ICAgIHBlY2k6IGNvbnRyb2xsZXI6IHBlY2ktYXNwZWVkOiBjb252ZXJ0IGZyb20gcm91bmRfcmF0
ZSgpIHRvIGRldGVybWluZV9yYXRlKCkNCg0KIGRyaXZlcnMvcGVjaS9jb250cm9sbGVyL3BlY2kt
YXNwZWVkLmMgfCAxMiArKysrKysrLS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspLCA1IGRlbGV0aW9ucygtKQ0K

