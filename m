Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01ABD9B00A5
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2024 12:55:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZfp53v5tz3c3n
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2024 21:55:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=198.175.65.9 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729853738;
	cv=pass; b=WwP6RLRwVVI1q2drHbZMlYgCMmXYlhcBg4FgQFOBx4ouEI0PPBdH03zhKNpRUOLkl41y8tsiMoldwFDm6Z3CFI1IKmZRvJEUH5OyEA09p1cY6ZtrWvFEIT/R3WR0+h7GL0bLoxz/QID1DPt5zaRtFVNXtZ+5dcKXIHAo9n/z5Bj7jtWSrX68Ppj69Oy8Nlu1fGCHI4rONK9f2EHH8E+I6lv47pgdqk+jkBaUpsdz3OA3SoTiwky8ng2ZGxp1gLrnotnTYrikOlDXbM1cTL7L7ryX5Vv6e0zCQ+LZ3Ru3D8SwKh+LFkaOVc82NcjK1MkQj7ro3Piqh+aSiyfPWwzLCg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729853738; c=relaxed/relaxed;
	bh=uCIeAR6pnz4dv8ueSV2dYUDH/OFSamPkG39doBDt440=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=mbX/2yHinZIQ9cdnwrS1z3h1Ov+BmTyQq4LWfk/NSxDtl8JfG6iBg8fXau3Hxn5yBlPgpWYHtS4ZcHaKMNVhsX1fUyaP/ovLV2vs2L6R4KpgkZN04sG0hA8NNmq3e6DzZyilbSHlshLoVhVfcBGvpjO3bGzD2T52f8i2YPxc2ZLVwddVBnCue4TuLABj5XctAmqIoMpqD1G2PpMloPclRqH1/pFhZZ71apm446VJNayzvi/XKVh5MK9se3YzoHOKCrjGWMmbLwU8QZNYOmcPUC78+e3od7i1BYLePYqnE+B75I9NyjNfP37v9k3ZbSeqZ/UoyZf+KuBH+hLmSLbpLw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gBvPUPpk; dkim-atps=neutral; spf=pass (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gBvPUPpk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Fri, 25 Oct 2024 21:55:34 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZfny683tz2xjH
	for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2024 21:55:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729853735; x=1761389735;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=uCIeAR6pnz4dv8ueSV2dYUDH/OFSamPkG39doBDt440=;
  b=gBvPUPpkXhc15o/RHzR4RX8ADa6Exy1EMl41XcYxz5YaXkDHQej0bQ8a
   yMAJG0F0bDHKXSWCj3UqiTvrYLNyIbqKlaEicUZx26uefMbkprjmLcVm2
   olBZo89WiQ+hVqA0MpdDSuMYMbBwuq3E9hXEwCVqZsvp3SAsgTh+qudre
   V1lcMO0nRo8rz2a/FV7x141GntUaL0AlSdOcz4Vyo0bNM+yulJZCXr4rC
   gBqyCwZ2XjbkByKdR9kY54EfaIgnQPnbn2W7f5OD+cwPQeUfdnB94efdR
   eQ9OSE/8NLWx3kFUrpVK1fV+QWY5K5VmxpweeMmEimOT8jjjoBi9D3M5o
   g==;
X-CSE-ConnectionGUID: xv70u1cBTsWyrMMj1Kfa8A==
X-CSE-MsgGUID: 78GCRzj4T9yIVV+WlsvKSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52074450"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52074450"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 03:54:22 -0700
X-CSE-ConnectionGUID: GPF3Hn/GQ6ejR/Uyn+QCBQ==
X-CSE-MsgGUID: p/gar7knR0Colixg6K/Shg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="85466388"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Oct 2024 03:54:23 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 03:54:21 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 03:54:21 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 25 Oct 2024 03:54:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EtJCg15PGW0oXYyW/DOyP24vYjiBvkTAw9KQ9z6bUeo9KnYmWN0m66FzfMXpnC2Ck3TcrpLjrAmKoicSAsczcMbOa9B3LH6YTIQ0edLYHVVgkAl0GNEo8woDZlcs2j5xm+/OriT0iAGH6BKbag9fg3/mq7rz4Hk12Wpnf+vjL2Xa4dAW4l0iz2YRzayWtjqfchNQeE5VPLOqHTPp3RPdu5to8+GcjKq9SY1Fus6k9rpovaz1Ba5axKdijVryr7bgnebvg23ghJZlsMgKensBtXDkoptnFcifwTVAGTFhMVZoa4OKXi/lfOEOkGHefuVlWJMHbDn0PX7hYnMSPzZs5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCIeAR6pnz4dv8ueSV2dYUDH/OFSamPkG39doBDt440=;
 b=Y+nSGjHqX2Hz0eF02eUCH0bGt1iSoOjuLU1w2V1eI76BL1zNyBt/Xm7E4osUpAiZc9oSqX/YXAbsmqIYhZr2pXoXGNSLqad5hB2kuWjci37raOlFUwX/K1hsoZgsZ9IDkINbA7E/q6dhoSk5QQexC0gWhVl/mgYLW9b+KW92mnVapQR85wTxei1FbyvrAmjsBWrmZzKjrHgVXiDi0z8jtGnyjUjGkFCl9wY+jqMRorwMAX487dfDMLzzoDrc+74FFl03IKD8DE7sSPeBR6sbIXwXaW0EBs92gVSfDuF0nq53StlDmpOHm3BRqMKRZHBqWV0+U/qlodhul+MX43D0Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5330.namprd11.prod.outlook.com (2603:10b6:610:bd::7)
 by MN0PR11MB6035.namprd11.prod.outlook.com (2603:10b6:208:376::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Fri, 25 Oct
 2024 10:54:13 +0000
Received: from CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::e179:e:20e5:53db]) by CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::e179:e:20e5:53db%4]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 10:54:13 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: [GIT PULL] PECI changes for v6.13-rc1
Thread-Topic: [GIT PULL] PECI changes for v6.13-rc1
Thread-Index: AQHbJsw6WEK6H5K+fk28j5ICJt8iog==
Date: Fri, 25 Oct 2024 10:54:13 +0000
Message-ID: <bb5eaca8dc2ea5b8e900efbccd53b3d991da753d.camel@intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.4 (3.52.4-2.fc40) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5330:EE_|MN0PR11MB6035:EE_
x-ms-office365-filtering-correlation-id: 432d23c4-5de4-4fa3-5b44-08dcf4e35ce0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eDFyWHNSYmQ4SUN6OXdWNTNtd3FnaWwzUEhVd2Ria25zbGZ0cVRoaDlONU5G?=
 =?utf-8?B?ZS95SXYyRVFENzFJb25VM3prRXludmFFd3g1eWdtajJSVFllL3RTeE5Kcy93?=
 =?utf-8?B?aEV1bHFTdkhHY1M0MUQ0MllWK0dXRGZqbFhaNWJIc3BBS1VFVlRydnJWVklt?=
 =?utf-8?B?OG1wQ0s3bmk0NDdRSDhKRlNCVmNvdklyQkhJVXNVdlNXcTY3NmJvc0xKelpH?=
 =?utf-8?B?Um8yVDU1TXorQmlrNXpVZVVrLzlFYUphQ2Jzc1FLV2VqdXcwTE4vYjg5RTNk?=
 =?utf-8?B?aCttWGVETHF1cWZuMjNpRTMxM01qK29YajdNV0JmeTFPZ0k4a3lwakhHTEVI?=
 =?utf-8?B?MUY1eTlEb21wa0E3OTMvOU1kZGRSUG9DbzJFUjNLK3NubkJhdUpYK0o4TC93?=
 =?utf-8?B?TVdoR3BRM3NVTXFrQ25WRUxVcjVYcEEvdzlVSUR0cENUNGh3QkpmQXFqY29j?=
 =?utf-8?B?QktqMDhHTkVacWlkUlJvVU56TXZpZ1d4UmJXZDJHUThQeWJGNm5MUEFCRVV6?=
 =?utf-8?B?R3JFeUtDYlZrOW9COUc2bWtmc0JZUDJwUGZyazJjWTBPNHUzdmwvdWdlV0lh?=
 =?utf-8?B?cUxwbDJaWDg3WjMxaFc1UE9wTWN4Q1luL0JXYmkrb0dvOW9nc0RtcHM3TDQ0?=
 =?utf-8?B?eVlqejlPVzErTXVaS1JPN0pVckFqWHZkbFp2RWNpdEFIS0pOZ1U4UmFJdzJ0?=
 =?utf-8?B?MmVVUU5ESkpldkwrSjBySmRvYUk5eGRCcnk3OGxyNDFJSzVpN2NnTktuWjgy?=
 =?utf-8?B?d2RuK2lYMStPUldsYU9VTys2bEc4dTRtVDJ2clZuQzN2eFhPeTh2YjZuVzNu?=
 =?utf-8?B?VzJzYnVNN0pmejdycDY0K29PVXVjelRjM3NsTCtWeWdPcHZ0anN3dmU3dE1Z?=
 =?utf-8?B?Ty80M3lKRDYySWc3ODhrQkIwSE5PcENJLzBZdlIvZ0ZYcTRYQzV4RVptT2Jq?=
 =?utf-8?B?K3gvMmlPcXE3dkFNekl5MDlOTUNURmNHK3VqNjQrczFxaTJUb3dyeVlYOWg3?=
 =?utf-8?B?Mkx1SFR3anRUMmZSSS9yeWlQNUlqclNTWFQ1VDF6cnF3dXdMN1BHQm13aHRZ?=
 =?utf-8?B?L2J2Rm5nU1c4cVVrWUxocDhURFRlMEgyTHZiM1kyTk5rdkd5NnpRWFpYNnd5?=
 =?utf-8?B?ODZsZGYwUlBCakxEaTVDcEs4di9EUEtSMWhOVzR3aytkTzduenRGQ3VSQzdM?=
 =?utf-8?B?aU50Z2RQL1NaY3FKU0RUV25XS2l4VkJYbWxERzhDZmVvWWVudm9JcTZ6U3Na?=
 =?utf-8?B?TnByanNib0orOGlhcDFwek9FMFY1R21VUEVnN2VuNkRVQzl2UWdIQUkyelNV?=
 =?utf-8?B?QnRsN0lxbWU4Q1lSSkJHNFkzQUV2ZzQ3MXNXdzZkeW1jbU1aVkVZMGpuNVZE?=
 =?utf-8?B?OTE2YWdQKzM3cEFqcEhpOWFaaldrb0ZOVXhhb09Oak0xRElxcllrbWdIdVlw?=
 =?utf-8?B?cGpKVGVMQjdoZWQvMXFwL0lUcE4rbkhiYUpLZitJMWlHUVA0WG5JclZtL3BZ?=
 =?utf-8?B?OXZYT3ZSVHFrTzArNDVGaHlDdGZJY0xURUZSVk9XMlFDQUl0elV4d0grSHA2?=
 =?utf-8?B?QVprOUtQMTJMeXJnUWVSNVdkOGhhR0dRa2NXUndFZ1ZqMHZuRVFpcW1IdWx6?=
 =?utf-8?B?ZXpmcWh4YTBpQ0ttQmlFdW8wZXZ1cG9WT3RDSlFPNEdnVU4vMVV0MEEzYmxv?=
 =?utf-8?B?SERMelVtb0pBTHFwZWZOZkhoL2R6MjN4YmFMTlIwYjdrMk9nb01qSVJZQ0pw?=
 =?utf-8?B?WVoxUGsyUjdaWGRQZEo0T3h4aTNXSDgvRkFJdjN5bmxMSUJBazJIRi8zY2JJ?=
 =?utf-8?Q?xjsG3XBjZTsdyNGJSATAo7B47HhunOoC/BUBY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5330.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q2R1TEhyL1VnS0ZMOXZjMFVDQzYwOXpqR1BYZ0xsWDFRbFJrL1NtbmpHL2ZB?=
 =?utf-8?B?YVRZRndudFlMQzVzbjFPVGtRVDhWZS90Y0FNYXZ4bkJXUTN2cXlyQ2xLQXFO?=
 =?utf-8?B?Ulh5Vk5kaTF3ZFhRVHRGYlZUN2JIQzJmWWduU29GT0gwOS9yT1p1RHhYbmVq?=
 =?utf-8?B?TW5zNXZiQU9JcW1ieUNOZVpwelgyWDZHTndtYlZPK2Z5UUxnWURhU2hHdk5B?=
 =?utf-8?B?SkFBMVZYOURCNWgyZGJGcitUNEFhQjRsSmNlMWVCRmpMd2hCU011R3ZQK1lJ?=
 =?utf-8?B?VEp0ZWkvbEs2QXBieGh6OVRKZkp6OXZQWWNnQnhFRUNKQlFKeFA3T2lMODQ1?=
 =?utf-8?B?UFhaVUkrbTlUU0NSbXNpaXdNUGNOQ3dLWXpEUVpMRzJqR1hDYi9hbjFKV3Y4?=
 =?utf-8?B?cjM3Qk4wYVFwZHN1UkEyb0VyQ3MrZm9vWmZmcmdmZlMyMjc0OHRmV0xqWlJ2?=
 =?utf-8?B?dTdUdWdSRTRTVHpsbWcxbUFLWGhBUDFaMW1MU3NWMXJGRDRzeStxcndhb2JE?=
 =?utf-8?B?d1NBL0VrbkZ4eks3NUlpTk9TWmpNb290bzNPMFNkQUIxa01CNVdWN0h1WmFw?=
 =?utf-8?B?MjVlUU1heEw3cEo1UGordXMyYUYvQXVxV3k4dDhXdm1tTHUvN3V2YkZHYjha?=
 =?utf-8?B?eHNjVm9VY1liK3B1NEJaOWYwZEFNUVF2UXZyQXlEcWpock9VVmpaZnpPeWhF?=
 =?utf-8?B?MTY5NjZxOWNRYTZYUUFzTHdRemZqQTJETUtPY1hhelhZc3hGMUtkV3ZqdXVC?=
 =?utf-8?B?Z3hOdEtlYWNrTHp1WjFSYnFPMjVpWVkwUVBTczZaRmNXMmZ6T2lCUnJPRDVQ?=
 =?utf-8?B?SWpqdHMyRm9KSWdXaEcxSU1sM2ZQd2tCeTV0M2tFVXNhWS9OTy90WUdRQ0oy?=
 =?utf-8?B?WFZXc1RsSFk5b0hnQTN4aVRLbmRNbEFmdXN2ZG5tVnMvNDlNakwrb0xPalhT?=
 =?utf-8?B?cURLSkxENlFzYi9WUlExZCtLN21zMHAvRFR0d1ZJaCtNZ0JUSTdOWTluWTF4?=
 =?utf-8?B?UWE4Qk9yR3cxcUYrR0tWRGxwTSt1aXVrWFhRODZGQm5tSWlYSEd5b2JXcGZR?=
 =?utf-8?B?dDRqWlZSREI5bGx4NTRtWVJ0OGN0cEZtaFVDZDM4cU5ZM1FLeHUva3pMNG13?=
 =?utf-8?B?TERDNkY4dU9QRTB5bzU0b3RlVkovaVNTNHlaMForVkt0QzZYcWxnZ2R5S0FH?=
 =?utf-8?B?dHA5SVo3NGlyckpvRGF0b0c5YmJVYW5DbDZDK3BJQURwK1VMMnNIUzNJY0dT?=
 =?utf-8?B?NzBIZ3JONEdJYjJUeXRKMnk4R1VsQ0ZRN0sydXZ4Tm1FblB5R3pJd041QU1K?=
 =?utf-8?B?NVZKcGtjbVVCQ1FBY3JNOHhRWG9TdWpvTWw3d0FQSUJFN1RHUDd2SVd2d2Z0?=
 =?utf-8?B?aERjSlMzcy9DNk96bFd0cnhsWEN0aHZyVkFYc015S1pZUStneFRFTFBiM2ht?=
 =?utf-8?B?dFczUTJ3Wko0Nmc2TjJzSExwcXA5RXVjaTVyUTVkbDd1UXNZZHRvU3Z3RHdj?=
 =?utf-8?B?d2RqOGFWRkcrWU1uN2tqN1g0cmVsNlJsNklJYkZEeWVXTmdGa1NUMjFlTDc1?=
 =?utf-8?B?L3U3SFkwRW9KVzdBQ3VtNmk3Z1M3QmFMZWZ0bGJOekVObWk0bFlmYnFyWU1q?=
 =?utf-8?B?bmt1VkV1WStEbjFCdHNnSGtlMWJsL0loNjRPU0d3YUNhd0ZwQVVhZi9VWE9B?=
 =?utf-8?B?eVdqYWFFVGVReFFzSm9nUy8rRm1yUk9aa0YwVVNFSXBQRjBmK0U3ZDJOY3Ba?=
 =?utf-8?B?ekdIeld0TWphd3lLUno0cHBBUHlPY0VxSmlXTHdJdTdNdWp0dVpVSGZ2TjN3?=
 =?utf-8?B?V2Q5b2ZBMFJrRUFab01DOG5udmlTYXpUUlJuL1FMZytHWklKMnE3aHp6aEdu?=
 =?utf-8?B?b2JMMlFXbGNwRkNmQlBKZER3M3N6eGgvYXk2a1hwem55eHc2dGwyUnlYVFc3?=
 =?utf-8?B?S29TMGxrOVNXQ1dyNGlyT3B6MTIwVU5nRTk1bWpCZzRJQittVU9JYUkvcDdO?=
 =?utf-8?B?WGU0UVlEcW9QbzBURDI2S082dExDd1YrcUJIdjY2R3dZeThWMUZSWUJuK3dN?=
 =?utf-8?B?cTNWV1JRamQzczJwZk9UQ1VOczRvS2YwMmMvNm5vUnVKUHdoOGJYKzYvOWxi?=
 =?utf-8?B?OWVwb0NqSFIvdC9RVTFwcWRlTjNqRU1PWXNUaFdiYnpjeEI4V0lMU0dleXNt?=
 =?utf-8?B?NEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D576270CE4F55D498F137684D6B38126@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5330.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 432d23c4-5de4-4fa3-5b44-08dcf4e35ce0
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2024 10:54:13.2122
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jNYaWAfHDTmPc4ri9Uq6kkqc/8wBN5WMgvCcksAn83m+kyJDaClgtRwUfR2eXmw2EJ26GkL9ozwAtRqeShJJ40QgSfkIeqSOjcjeuMS9zfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6035
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.6 required=5.0 tests=ARC_SIGNED,ARC_VALID,
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgR3JlZyENCg0KUGxlYXNlIHB1bGwgUEVDSSB1cGRhdGUgZm9yIExpbnV4IHY2LjEzLg0KDQpU
aGFua3MNCi1Jd29uYQ0KDQpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDQyZjc2
NTJkM2ViNTI3ZDAzNjY1YjA5ZWRhYzQ3Zjg1ZmI2MDA5MjQ6DQoNCiAgTGludXggNi4xMi1yYzQg
KDIwMjQtMTAtMjAgMTU6MTk6MzggLTA3MDApDQoNCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCBy
ZXBvc2l0b3J5IGF0Og0KDQogIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC9pd2kvbGludXguZ2l0IHRhZ3MvcGVjaS1uZXh0LTYuMTMtcmMxDQoNCmZvciB5b3Ug
dG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA3MzNkYzk3OGZhYjY1OWRlZTk5Mzg3MzllMmI5ZTg4Y2U3
MmYwNDA4Og0KDQogIHBlY2k6IG5wY206IENvbnN0aWZ5IHN0cnVjdCBwZWNpX2NvbnRyb2xsZXJf
b3Bz4oCLICgyMDI0LTEwLTI1IDEwOjU4OjA3ICswMjAwKQ0KDQotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpVcGRhdGUgcGVj
aS1uZXh0IGZvciB2Ni4xMy1yYzENCg0KQSBzbWFsbCBjaGFuZ2UgaW4gcGVjaS1ucGNtIGRyaXZl
ciB0byBtYXJrIHBlY2lfY29udHJvbGxlcl9vcHMgYXMgY29uc3QuDQoNCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCkNocmlz
dG9waGUgSkFJTExFVCAoMSk6DQogICAgICBwZWNpOiBucGNtOiBDb25zdGlmeSBzdHJ1Y3QgcGVj
aV9jb250cm9sbGVyX29wc+KAiw0KDQogZHJpdmVycy9wZWNpL2NvbnRyb2xsZXIvcGVjaS1ucGNt
LmMgfCAyICstDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
DQo=
