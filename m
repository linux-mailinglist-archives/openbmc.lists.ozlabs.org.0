Return-Path: <openbmc+bounces-839-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71ED7C26243
	for <lists+openbmc@lfdr.de>; Fri, 31 Oct 2025 17:36:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cympJ676sz2xnh;
	Sat,  1 Nov 2025 03:36:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=198.175.65.10 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761928600;
	cv=pass; b=lRMrNfVoO84BnvN4zPRxXy2uB/8Y46uMQ2u9RtFe2ahB/Ait7GnTFM10TrKoqj4N0A4KR/YL102cw5iT1fC/UCuKy52hZwIIHQm0KSyDMOCJt9GqMs1xMAdjQEX7Ll9bbLSrxFp9wDXvibJTF6ql84CZ5SM+w6r44heasRHIcC34U6tzkOSMhEpWOnMKBQLKVEfT0kFu/9tL9iGn17dbFGLp55NCVlwgS6YPDBY7nTUON2v0RjbtffZSs2kao1Yp+392asUTlOVi3vnM12LJD4wpkJpdfS4wokCoKrXFevc/5NIsaJcCO5DcDaeVOBryQkPu0I3FkEnTf8aSKFFheQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761928600; c=relaxed/relaxed;
	bh=AovftdtBGPooMjUzHx6+ToFJk7oIVcuG8TAgmbhPOl8=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=V9krkuW3XA047an5OiMiHcBOEQpTsn8cU7oCu0YVvrA5Nlq+OdU6Wi+uzi70vMQJCxr2NIcaxOeJbRrbp9Aidpq7N+Hnkwjl+DIEqyW+VYO9RZEYaV5i8CEqlcJ1GuRl6N1q3HF+zNGWWwD13GEQTdec/3Egz4StEmGC4hiOKSl/m7zLXaw1Fta5ipHheneAnnGcPpHjBkxVhkg9VMJlmBf/ytwRlLQvkT+aGyA8E5cgGChmvrN0nYEDwZ2HvyzqI2+3dt8RLxnA/PmMfW//IHWQvfxiz/+85tSmWduWcdD/tDdumWI+2LpKKn/q2EQkTVeF3rj9VLI8ONtv4T6ChQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HgNk58mw; dkim-atps=neutral; spf=pass (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=jonathan.doman@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HgNk58mw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=jonathan.doman@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Sat, 01 Nov 2025 03:36:37 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cympF6mqmz2xdg
	for <openbmc@lists.ozlabs.org>; Sat,  1 Nov 2025 03:36:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761928598; x=1793464598;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=AovftdtBGPooMjUzHx6+ToFJk7oIVcuG8TAgmbhPOl8=;
  b=HgNk58mwDM3BhHuw8DTqqoCwsBtvVVZW/JXaGAJW23LqhsQ9StZgrDFD
   HYaQn8sT5hWuVfE8zibfwMy7llBQyNPeQn20wCsxjdNXHu781c687Yw3x
   xlkOLbV7NRJ4M8VGFWRbADogJ3cN+y8ZWBRiQF1rKgu8W6YknGV+LYQG5
   NxLoXZb2zt0OX7KnbjYfuK7+ePxHNvM04vTU6uNnYMFI2vkEL2oHTa2R6
   SYZEy9Cqs+0iTgWCoVLfFGDuSJY9G2DS5SnSKURwssTLKqE0cXpiOkVe4
   T/XxMeLbVzoWs4uidFch91GuZEKi4uUlxxIs7LzJkR/BG5vJrM40901Rt
   Q==;
X-CSE-ConnectionGUID: /w2ECaRcSMCqP+ff+RyPPg==
X-CSE-MsgGUID: /Qimf86KTYSmmcXYOYx3sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="81504536"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="81504536"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 09:35:29 -0700
X-CSE-ConnectionGUID: LIFIqcIWQ56GaP52kxzoQA==
X-CSE-MsgGUID: WbNt1ONoSI+3l4YFgXH5yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="190622913"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 09:35:28 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 09:35:28 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 09:35:28 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.43) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 09:35:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uJwD3SKxE5vzSEmKwmNEy/iOFvi8xZ5A4XCVxYQrr/doNLrEKgWltuHd5S02bNgrl8eHV9Zn/DeqsJCUJVIQlXefcDz6FkKHtjf8MVTMYLOFEnfiwYGnffOxuobump4yqlJe8lxHLiMmaDSrScu+fLmyiQUoPf4aVJPRXGFQCLwA/Y3BH5jfkezJWWmtMNepRf90wuQVtctoxZLM7FP5RGhSALsggsTQBYtC4Xfi/OmaD1gsnAyjnrm1WKyYkwptbFDkD6KyPciPmIq+PmD/4LHJdtjhxXRZL9skouGqlavitJ/555nSfQJL5wG7Fsu4MXkOFCuwva6NrLN1gr0fZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AovftdtBGPooMjUzHx6+ToFJk7oIVcuG8TAgmbhPOl8=;
 b=hSltc0agagKvwSONNFdxNRXL55NTqTbIf6RhoOCEsGrq0z/bPPovYh+HAyemYsF5oYzRvePspj6e6BHkcjcgvKPBFL7dDTcr8roRMUET1sEP3gKmj3qjgohH6E1gRH1/wMlOa1FGvN6px6nx+ZEramFPl3fqg3ky3c6gGgRdM7FLGsATItpZRBaZ4MRa4A1E0I/AG+xi2m+SSn7VwqpTJDgEcrdpyYwSoX/IWgq8gToAuKBCEGKbUwubJrg0cBQMEeJsutSfXxFmwtpOAIaAQGm+UNK2Wb3UOt/EDPtv1j4atSluYCzlilbtfmVyd7Oi6wvvW5YsVHXLjaMnmR0dWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB6198.namprd11.prod.outlook.com (2603:10b6:8:9a::10) by
 SA1PR11MB7063.namprd11.prod.outlook.com (2603:10b6:806:2b5::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.18; Fri, 31 Oct 2025 16:35:25 +0000
Received: from DS7PR11MB6198.namprd11.prod.outlook.com
 ([fe80::fb50:2510:bdb5:4b57]) by DS7PR11MB6198.namprd11.prod.outlook.com
 ([fe80::fb50:2510:bdb5:4b57%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 16:35:25 +0000
From: "Doman, Jonathan" <jonathan.doman@intel.com>
To: "Wang, Kuiying" <wangkuiying.wky@alibaba-inc.com>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: It's time to build Zephyr Kernel WG in OpenBMC.
Thread-Topic: It's time to build Zephyr Kernel WG in OpenBMC.
Thread-Index: AQHcRsj7E94M22Vxq0iHAyJnW80ZRbTceyQA
Date: Fri, 31 Oct 2025 16:35:24 +0000
Message-ID: <1345bb03bda1a9362aa78d43260b573ee710fa53.camel@intel.com>
References: <e648559f-0d62-4be5-8ad9-10f05a3b736f.wangkuiying.wky@alibaba-inc.com>
In-Reply-To: <e648559f-0d62-4be5-8ad9-10f05a3b736f.wangkuiying.wky@alibaba-inc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB6198:EE_|SA1PR11MB7063:EE_
x-ms-office365-filtering-correlation-id: a0e114c6-cf1e-4708-122c-08de189b7e46
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|13003099007;
x-microsoft-antispam-message-info: =?utf-8?B?U2NxTHZkMEhLMVAyVVdmeU1HREdKSnBkUjZZdnFJSU4vd0hvb0Vsc3JiZ0li?=
 =?utf-8?B?RHpFMnVZcFpFemR4aDFoWkQ4WlpRaFBEbEU4Q2h5aEcrUmtHQ3pPb05TZnVI?=
 =?utf-8?B?MGF2bENVbXlXTVZ6ZzJybUx3eGdwL2o2Y2lRSUtaaVF5V0x1b0dqVGpNWkFU?=
 =?utf-8?B?QmoxOTJBT24vMjFkRmFpckpEQ0ZlY2xKekloTDExYkJjQUpSWVdCcGhKMUxH?=
 =?utf-8?B?alcrMWUyY3pRaHJBOTd1MGZtWWhVbXN2L1lqUXliSGJlY3pnc1l1UWtadGRu?=
 =?utf-8?B?TElybjlCT2tuTU1yalB6Rm9KcVRnU05ONmUxUnBDY29VMUN1K3JBS2w2cmNt?=
 =?utf-8?B?TURxT0tpMHp4SzQ0bkQ5SjJnNGU3enFEZkRPTm8zc0V3SDNnbEN0b2ppbFRB?=
 =?utf-8?B?TU1DeUJ6U3kyajdvUEJqN2FIODFZK1duMFRIT1FHNkkwR2NoUGVHQ0R3c0ts?=
 =?utf-8?B?TjcvNFJvMUpVNFdBbU0wS0dRcHlkN2tWcjkrb2lpdlVYQXNFMDF6NjhESVZN?=
 =?utf-8?B?dThmVmhIbjFGQkxQSUZtUWxIM0dKMGZEQ1BFSFE4ZXFsYUdSR3Jzcm9qZGY2?=
 =?utf-8?B?dlg1VzlweXhxNXh0NEwzZ0REU3VkSkpTNTlhSjN3MDJ2bnNHa3cvc0NQRlpY?=
 =?utf-8?B?cUJmMjNPYXczL0Iyd3FMUXZPTzlYODZvTGdrS3dyYmZwaURGMDllZDRLcEZS?=
 =?utf-8?B?MWdRU0tXNW01eTEwZ3dPM1owcHEwSkpCSkdDUjF1eGJXRi9sVWdtZFdCS1NJ?=
 =?utf-8?B?QVVMNFRZaW9pRStQVDFBWk41Zko1bFlmZm0za3EwQjNhT3Y5OXRLeUI0bTI5?=
 =?utf-8?B?Ylg5ZzBMbHdlSjRUYTJpc3JncUU5OW9TaEhrNGhxcm9NNUVXdWVYY2lyc3ZV?=
 =?utf-8?B?REV4dXVtWTNaVUs2UEZ0OTl4MUdHalJwMFdzMFA1aUhXSEMwR1ZpbWJXR1JO?=
 =?utf-8?B?czI2YmUwbk9Ub0lPZmt4TFJoNVp2Lyt6SHoyVHB6WjYwY2VtQUVxRGU3aENT?=
 =?utf-8?B?Qk1OR1FnZ2oveEFXb01EQlIvcWt2clZiTjFsNkNXSmhkV3kyaHJGV3VKUnll?=
 =?utf-8?B?WXpSdkpWQlF2T3hPaHNqUnhIRmY1VFc3ckoxUXUwYVRxQ0RXdmw1Um5ZMnRr?=
 =?utf-8?B?NGgrdGJ3cVNLam5pVTZpZlg2K0xMY2NRUXF1NGZBSXNMZnJjTnI5aDRZYVVv?=
 =?utf-8?B?YjZpaVpTRytiSjhjTEsveDM0MzgxZHA1K1F1SDROQURpSDlrZmF5cjBxdElB?=
 =?utf-8?B?OG5RaXR6QzQ1NUJ5YXIwWGkzUmNXdFlpaTNhNVZTVmo3NDlJTUVBSDExVHgy?=
 =?utf-8?B?QmEwSXRkcC9GTHA0TnEreFJyQmxtenlSbVNNSStYMWp0cGpHWlYvdzI4T2Fp?=
 =?utf-8?B?aW9NcW0vRWpYamd1TFRidTl1aGs3ZmdteC9aY2g0T01BazZxd0NkeTBFZjA4?=
 =?utf-8?B?bGl3cXBoYWFieDQrYktaM3NkUG5XQXhCaVhjSTB2VWZJcGVpUnE0OVRqZTNV?=
 =?utf-8?B?NEtqUWhzNTJmQlJkSnVXcHBWdmZLamNwNEUvNGpUUUx3Z0dxLzcwaWVDNnll?=
 =?utf-8?B?dUNNaHU5Z080ZjVNMDFSUG14V3B0ck9YVFQydzIxUExyaGlIYTRmYitTbm5Q?=
 =?utf-8?B?ZFNXKzlLc0ZKRE1JMmFqQnd0TThuOVlLcEs4cDRuWncwMXdjMTRKRlc1NlJS?=
 =?utf-8?B?RElRcnBYKytoVXJmcWlVUFBNWGZiQVN0NndpT1hjU1RhOVE0ZkZLK0V0cXo2?=
 =?utf-8?B?RDZ6cHdEWWRsSTgyS0pTUGMyUGJ4MFR0VUJZQ3ZGck1KcnAwcUZCbDgwRDBx?=
 =?utf-8?B?UXVyd3ZUYUx5d2FWclBRWkRUOUtKWTYyQ21XRWJwdlRwKzJnNHIxcUhLNlNu?=
 =?utf-8?B?K3lrdGJ2cnZEdk9vQWRvSE95eHE3azlhS2VYa0toR0FCY1pvdy9IV0VONFEx?=
 =?utf-8?B?RmNCS05ialJYbGdmbHFJa1hteXJUdlNXeVFuYjQ4S01QRWhlTTZXc2pyK3hO?=
 =?utf-8?B?elRRNnlaMHJnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N1lNZFd6ZkZBNG4xb0s0MHhVUmRKOWxzdmRhY3RpdEFSYUhSeGtxTlZJV01R?=
 =?utf-8?B?aHowcEhOSlFBaU9YTDcyQlBsaExXL1hLZjU2d3JwVzY5VGVRR2g4M1U4NW0x?=
 =?utf-8?B?cFIzWDI1NWZ4c0pJdWNmUmxCN0NETmlOclFsYUtGL0NBOTdrbmVFZWVPaktn?=
 =?utf-8?B?UGpzZyttdkgxU2xVdTN6V3h5NktGNG1IZDlIQ1NVOXFENEJVZ3ZnWUNXbHNh?=
 =?utf-8?B?R3hLUWphemhvNjdNMlIxczhxajJsR3E2dkhDd1Z2OXhvRjREZHE1eWE4TFRy?=
 =?utf-8?B?REtPZEJOM05MSmE2WlM2U2RMTjJXZW1UYTZtcGNpYlBHUUREMWVvQWNOWG1i?=
 =?utf-8?B?UHVjam4zQ2oxRU1YS3lqSFZCcTBIaThiSXZnOVA3RnIrampNZGhYQWt0TTl2?=
 =?utf-8?B?eFAyVFExUWVWemgwRlNUNitBSFBKK296eEZSMjVIa1R0L1lMb2VXcDRRZ1JL?=
 =?utf-8?B?KytwdHNYZmlaOTduNmMrM2hyL092L1dYQU9Ednd6RU1nc09XdUNaT3dSUEZU?=
 =?utf-8?B?ZkIvK0Z0TDl1YXIwOUVIL0hCMVhXb3lPSFVSeEY0K2VKMHhvR1pjS3RvSktR?=
 =?utf-8?B?RndJUU12dm8zeFl5cWdXY1YxL2lsdzdVR3RrV1ZYTFVLU212SWl0bWNzdlFi?=
 =?utf-8?B?a1VnaVVVVnI3RlUvSFNZSE1xdWRLNnBodlNJRXNITTFyV24zeVNpc1RCYjEz?=
 =?utf-8?B?UStnT0s2UUNvYTYrcGhTV3RQNERaVzh4MmhaVEFnU3N3UVJJbnBublk5OUlq?=
 =?utf-8?B?ZE1oamVZTEF2M2IrVE9WRndQNG5ldm9tWEJGckxGd05KMTFZZERERVF0eVZU?=
 =?utf-8?B?a3I5U2prdld3UHpBczlEK0JVdFFuQTg1a25DY3FQbDQzYTFoVFBQZXFxZk1x?=
 =?utf-8?B?dnNjR2dHa1dDY2lmUU5nQlFRK1ptdG44YzkxY2Q5a3VwUjg1M2tVdXg3Yjc5?=
 =?utf-8?B?MXp3ZkxMNFZvRnRHbHh6VjhQR2RsSGx4eHZtUVdOZktlUXNScmE1ZzZCRWpt?=
 =?utf-8?B?UlBTWWNJeEJKQm1VK2d4K1JWWmV6aktCM3g2SysxUURXUlNzcFk2bGh2cHdT?=
 =?utf-8?B?Y0loK010anFWeXo0WXUvNFE0dThNWk5KTDdKZFBWMkpwbzRjZmpaL3hiampw?=
 =?utf-8?B?bldycnU5ZUhDRnArNzBCRTUxU3RJVkxFSm5haEkzSmlkNHQ5TWpvK3ZtakdX?=
 =?utf-8?B?UGJNQXhiZzNvb0FhZEV4Sk1tSENrMmFiSlBGWlBUWUFQTzBjMVl0bGtSNmVV?=
 =?utf-8?B?MDF0Z0tLSVBzY0hTcHpJRHJ4TEl6ck56bzNIdzdHUnhLZjFFYit6dVgrOCtl?=
 =?utf-8?B?VXZSYWNDT1crYjBtUXkzUmdBa20xVEVyYS9iWjJnOFVZTFk1ZHUzdWxzenlt?=
 =?utf-8?B?WW5ET1oxRG1yZWplMmRCZmJ3QWl4UFJuSmF5aW5hRjJKc2pBV1JoWDBncnlU?=
 =?utf-8?B?MVhrYjVyYm4vYkxMRDJhOENJai9Id3Uyd05YSVB0Mk5RYUJVQTMyNGV3YUpz?=
 =?utf-8?B?eG5JOHNHSnI0SHZiZEtxTEk2RUFQRmtOd0Nnb0RXSEl0bW04azB4TlNYeU1Y?=
 =?utf-8?B?a0NRWnRLTXR6Tzg4UVFDVitqQng2c09Vd3QvZU55Yjc5RkV5eTdGc0xIbTlL?=
 =?utf-8?B?Z28zeURFc2N6N3owNktsSWI0a2VDRlVjWEFwYXB1MWRtMHJtWE1vS3Bhb1Zj?=
 =?utf-8?B?WGs4aHU3NWtNdllQNTIrRE43akJLNkdZYjI0MUgvS2k2SWFnMldZZWdUaU5I?=
 =?utf-8?B?T0ZhS3g5MHVNRm5NbC9yaEJCU0Fna2FvelRjZlJSQUp6MmpiTlo4aGdHR2RH?=
 =?utf-8?B?Ty9HSXp1Z3pZd2x6eFdjRldvS0cvbmZ3VEd3YzJSQ3N3TlJ1T1lHcTlId3Ew?=
 =?utf-8?B?YnJxcHpRR1d6MGM3bmMvNERpd0xlalRWNlFHQlBpbTVLVmJNaFVlU2RVN0hD?=
 =?utf-8?B?Q0p0REtVTFhGRXBqcnc0b3ZxeVJHM3grdm9CcmQ4TW1KcS9Db3hlUVN3a3F5?=
 =?utf-8?B?RnRYUSsydUFJMHUvR1FPOUl5aG8weE4zald1LzROaytoclhSenlDNkVzbzZF?=
 =?utf-8?B?NmYzU0VUUnIwd09RLytyTkxQOTdRTU52ZnhVYnhUdCsyUlVTZ1U0SVYwZlhh?=
 =?utf-8?B?OU1sRmJYdCsxUzk0ZGZPUForODRnc1pJL09yNkpOU1RBelFKTzhSL3hXSjlu?=
 =?utf-8?B?WVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E9DD9DDBE68084DB3B750EBFEBB0916@namprd11.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0e114c6-cf1e-4708-122c-08de189b7e46
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2025 16:35:25.0364
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lSVr0W+I3c3OaiiY4TkAvjmk08uaja1J7ZNQgC3vHPd1sEJqCy4hc3UwfseA41tmpiQoM9nMUoo4wxzsaO1Ed4N7xMpn0PtKqBEvNxdYDCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7063
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

T24gU3VuLCAyMDI1LTEwLTI2IGF0IDExOjMxICswODAwLCDnjovprYHoi7Eo6a2B5oGpKSB3cm90
ZToNCj4gSGkgYWxsLA0KPiBUaGlzIGlzIEt1aXlpbmcoS3dpbikgV2FuZy7CoMKgSSBhbSBCTUMg
QXJjaGl0ZWN0dXJlIG9mIEFsaWJhYmEgQ2xvdWQNCj4gYW5kIE9wZW5CTUMgbWFpbnRhaW5lci4N
Cj4gV2UgaGF2ZSBmaW5pc2hlZCB0aGUgRERSLUxlc3MgQk1DIGNoaXAgd2hpY2ggaXMgdGhlIHdv
cmxkJ3MgZmlyc3QNCj4gTGl0ZUJNQyBydW5zIE9wZW5CTUMgRlcuDQo+IFdlIGhhdmUgZmluaXNo
ZWQgdGhlIFplcGh5ciBiYXNlZCBPcGVuQk1DIHJ1bnMgb24gTGl0ZUJNQyAoRERSLWxlc3MpLg0K
PiBJIHNoYXJlZCB0aGUgd2hvbGUgaWRlYSBhbmQgdGhlIHByYWN0aWNlIGluIEFsaWJhYmEgQ2xv
dWQgYXQgdGhpcw0KPiBPU0ZDLg0KPiBCb3RoIFplcGh5ciBhbmQgT3BlbkJNQyBhcmUgdGhlIHBv
cHVsYXIgY29tbXVuaXR5LiBUaGlzIG1hcmtzIHRoZQ0KPiBmaXJzdCBpbnRlcnNlY3Rpb24gb2Yg
dGhlc2UgdHdvIGFyZWFzLsKgDQo+IE9wZW5CTUMgY291bGQgbGV2ZXJhZ2UgWmVwaHlyIGtlcm5l
bCBleHBlbmQgaW50byBMaXRlQk1DIGRvbWFpbi7CoA0KPiBOb3csIEl0J3MgdGltZSB0byBidWls
ZCBaZXBoeXIgS2VybmVsIFdHIGluIE9wZW5CTUPCoGNvbW11bml0eS4gV2UgY2FuDQo+IGhhdmUg
YSBkZXRhaWwgdGFsa2luZyBvbiB0aGUgYXJjaGl0dXJlLCBpbXBsZW1lbnRhdGlvbiBhbmQgaXRz
DQo+IGFkdmFudGFnZS9jb250cmlidXRlIHRvIHRoZSBBSSBzZXJ2ZXIgZXZvbHV0aW9uLiBFc3Bl
Y2lhbGx5IGluIHRoZQ0KPiBEUFUvR1BVIG5vZGUgZG9tYWluIGFyZWEuDQo+IA0KPiBUaGUgRGVt
b3Mgb24gWmVwaHlyIGJhc2VkIE9wZW5CTUM6DQo+IGh0dHBzOi8vd3d3LmxpbmtlZGluLmNvbS9w
b3N0cy9rd2luLXdhbmctNDI3YmIzNDBfb3NmYy1hY3Rpdml0eS0NCj4gNzM4NzYzMzAxMjI2NTU4
NjY4OC0NCj4gU1dfSj91dG1fc291cmNlPXNoYXJlJnV0bV9tZWRpdW09bWVtYmVyX2FuZHJvaWQm
cmNtPUFDb0FBQWk0Vlo4QlpFZHRXDQo+IHAtN0FpUHhhTW5TQWJwRGJRMnhqelkNCj4gDQo+IFRo
ZSBhcmNoaXRlY3R1cmUgb24gWmVwaHlyIGJhc2VkIE9wZW5CTUM6DQo+IGh0dHBzOi8vd3d3Lmxp
bmtlZGluLmNvbS9wb3N0cy9rd2luLXdhbmctNDI3YmIzNDBfb3NmYy1hY3Rpdml0eS0NCj4gNzM4
Nzg2Mjg0NTA0MTkwNTY2NC0NCj4gWkVSNj91dG1fc291cmNlPXNoYXJlJnV0bV9tZWRpdW09bWVt
YmVyX2FuZHJvaWQmcmNtPUFDb0FBQWk0Vlo4QlpFZHRXDQo+IHAtN0FpUHhhTW5TQWJwRGJRMnhq
elkNCg0KVGhhbmsgeW91IGZvciBzaGFyaW5nIEt3aW4uIEkgd2F0Y2hlZCB0aGUgc2Vzc2lvbiBh
bmQgaGF2ZSBzb21lDQpxdWVzdGlvbnM6IGhvdyBkbyB5b3UgY29tcGlsZSBhbmQgcnVuIGVhY2gg
cHJvY2Vzcy9kYWVtb24gYXMgYSB6ZXBoeXINCnRocmVhZD8gaG93IGlzIHRoZSBsb2dpYyBlbmNv
ZGVkIGluIHN5c3RlbWQgdW5pdCBmaWxlcyB0cmFuc2ZlcnJlZCB0bw0KemVwaHlyIChkZXBlbmRl
bmNpZXMsIGV0Yy4pPyBBbnkgbGluayB0byBzb21lIHNvdXJjZSBjb2RlIGluIHRoYXQgYXJlYQ0K
d291bGQgYmUgbmljZS4NCg0KPiANCj4gVGhhbmtzLA0KPiBLd2luLg0K

