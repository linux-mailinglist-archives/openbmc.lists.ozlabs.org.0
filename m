Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4034A9F6FAC
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2024 22:43:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YD6c32vFBz3cb5
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2024 08:42:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.16
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734528492;
	cv=fail; b=DObD0HzWaPeUPT9R0c1liM5zWMClVvBQXYL6pSr4lrR5jSCL/57M/X8FqJGANsih52f8zljKox+PAbxu2jncgUNbYHzDWAdYT5nWG4RiMF7qouugA7AVQgpsNoptyIBvwJ172bSSpnFJto17X/kwToXUPO6U81Mu2cyFrCVEjxRpaXfa5u2oiD9biL6bogB64qPmqcIT24ZftVz9m0OdOuDhhwjITKp8kcsq65pZ9U/pY9QSgPF5lW0ahUUNT5cAC0MGKdPo72CvBuzVyH0YKPMtFhJoey4EWZQGjFXj6rBk3lE6WUDNBWrrr8+74MEoM5UsKkJbhG9Awzasu7Lmkg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734528492; c=relaxed/relaxed;
	bh=owbqS0501Xl2YQzgHFlBEk07x+jI08blpCvPoRyQ5p0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IHD9qcHMJIJcS31LsAMK+xV59ljqk9H3a4UphAM2cILLu+AtLiqdGKkyNhAhuypTF6686WVJ2EBTqshrHDHhiSCz0RHffAzoAkz7k1l1p44KhAOUUSY+Yt1oHAZrV1ixkiReiOsaIWjv9YT6kHF74ZJ738vT2ib/zASZ5fD8IyZ/5IC0RpcfFEgfDWnnybFQkeU4kc9o6loP4gt8UIPdZUFWJ77zNgSe6didSUQoGuCmmy289d00+29MmNVWUmnfMYxHQIKZ8ag5WB7hQSM9lVgRw+HI+ew/OsWXVelzUFsdC5mtEwD9ld1b8M7mOavC5e5BCmIpgxSMlgj904IPEA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jeSnjv5L; dkim-atps=neutral; spf=pass (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=przemyslaw.kitszel@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jeSnjv5L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=przemyslaw.kitszel@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Thu, 19 Dec 2024 00:28:09 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCvd54wFdz30T0
	for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2024 00:28:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734528489; x=1766064489;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eGId5OsODO+06k+0X1XwMRRhaGKPfR5fcZP0lp1kVnI=;
  b=jeSnjv5LlkrHd5g6EtAlssCIezfOMejKVAclkDjib2KX4t2HB1itplXa
   Li6vBdnQRSLUBKijML3uvnTDSiu6WShJsWSjOhXuqShuPu8UmYR5zxkYS
   y12UXHMbPrRWwxNI/Z59UVyRMnoxXIrOwSqQSGKOETXCv4hUK4e3PkmAm
   X+YvvFvTImsJlQUKFX4Na6cXp52NXAzMov2g5jLVtCoCUm40VAOaiqq+d
   devAyj9uStNz/N7efPWhD2/2i0Wu2Z2ZzPYEltGIkw+fYLtDyIgeNVWR6
   6/ukkKFkhDAByRTqZEWHDT+3fbvG6WsDphNfd08knifzPb2aJpYJygTD6
   g==;
X-CSE-ConnectionGUID: saxg0QU5TcSnrEbIhasfzw==
X-CSE-MsgGUID: Yedaizd9ROCmk6cQSKO6Bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="22590870"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="22590870"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 05:26:57 -0800
X-CSE-ConnectionGUID: aKPbNRKeRIaNo369qHepLA==
X-CSE-MsgGUID: 2DUGIV8ySni1Tyn4EfYksg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102476219"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Dec 2024 05:26:58 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 05:26:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 05:26:57 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 05:26:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s2OLMcfqv4C5szuj4QiAVSxlRHrhHHDBRmoVuDqVN4Pl3YfVAviNWAmX/H9fxm3ggOEtsCgsy+lLYpQ6+iZZ3Kk1FaxNeJ0KDlRvSECqMgKs5ASXfz9JrjQ5GfB94Kcg/3coZTMiIx1hdzpA6g3SvOBddsn9T4X5UxKW/M/wLR4vMxvZGe8NeUHlThteh/8de4srgrPRKgDEeMowoSJkhLcSd4dI64p+R84ZSZMpNcwEiLj2PA6ewnakpzJvP4Gp5yK1eVY4XhFxE7c4FUSl32cCfuXZyaFv34C8yQXml0rWq1sVAu96Oz4+do+xgsKCuFOUwghGMk39PM6CKIarTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=owbqS0501Xl2YQzgHFlBEk07x+jI08blpCvPoRyQ5p0=;
 b=QBfZ31/KVE4mkPJm8Cv0Ar/RI263p9kpc1ez/xb/G4/pO42u1WlFZF3xrwvRXxfFxXA6lfupc+dciJ/klvztLT5E9ZCi4juyaLiWcT010SjI6pWVCZbHdE6n8eRwOPaaTy3N4RO9qwfVTOUvXavMT16lwc2h415h7ihkWUh2guhDgQdPx6x8yWEByaGnhZWRKZ/nNtEk/VcC8PmK0Q0bs7Xxt8Jusk0Vtgft44paL6IZTRPcpfC8et7U7YtbZlf0CcAqRSaHIVXrztPfm7KshI51CuxVoJ+YWPzvgeVOmlt48Zh5Pe7PKIT0lBZHn1/regwvNjWm0VFuH39XmBRFQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8102.namprd11.prod.outlook.com (2603:10b6:208:46d::9)
 by MN2PR11MB4568.namprd11.prod.outlook.com (2603:10b6:208:266::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 13:26:41 +0000
Received: from MN6PR11MB8102.namprd11.prod.outlook.com
 ([fe80::15b2:ee05:2ae7:cfd6]) by MN6PR11MB8102.namprd11.prod.outlook.com
 ([fe80::15b2:ee05:2ae7:cfd6%4]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 13:26:41 +0000
Message-ID: <7a4f5769-0010-40fd-8bb7-a20f2725114f@intel.com>
Date: Wed, 18 Dec 2024 14:26:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for
 Nuvoton MA35 family
To: Joey Lu <a0987203069@gmail.com>
References: <20241218114442.137884-1-a0987203069@gmail.com>
 <20241218114442.137884-4-a0987203069@gmail.com>
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Content-Language: en-US
In-Reply-To: <20241218114442.137884-4-a0987203069@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0161.eurprd07.prod.outlook.com
 (2603:10a6:802:16::48) To MN6PR11MB8102.namprd11.prod.outlook.com
 (2603:10b6:208:46d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8102:EE_|MN2PR11MB4568:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fc5821b-6e67-49a6-a846-08dd1f679b9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QlR3OTdFSEpsVkxLRHhHaUZvV1hTNUZCQmpzWUNVRGVITCtKWHpXbVBOVXZY?=
 =?utf-8?B?MEZDa1EzWDhzODBuV2dTRWlDRlhWNXBQK3lLK0l6NzJrR2hNdWQweHN3TG1l?=
 =?utf-8?B?UjFZM2RCRDc3dUhmY1dTVHdvM0RpbW5FL1ZUUHZXMUxqUlo0TGN3NlhnQnlx?=
 =?utf-8?B?RkNYOWVhUUIwbC96WkJzN1p5V0cxZzBNUldMaFlscTFZU3RhcHdOclEvRFNx?=
 =?utf-8?B?UldzWjVLTVJwVm16c2VaR1krWUcwWmdlaVBnZ0RRU1UyNlVvNUFLT2owTlA3?=
 =?utf-8?B?TGN0WDlxYVFyRnIzYStlWVc2T0M3L3VsVkp2c1ZXaktpY0RKbFRLWk9UcTRL?=
 =?utf-8?B?MElJTms1b3JodUFLendaUXkzRFFuUzlhNFNUb0s4amZ5bFFqNlpCYkdEMUd5?=
 =?utf-8?B?UUNRNkhsRFRQSTdLQ3lPOG9zZ0dGUk9jOFNpWUZxb21sZURGQ2hwRFl2TUtO?=
 =?utf-8?B?Q3pROVRYbjJmWWNVSTEwRFNLY2daQU1jWDFPdGYrS3JQT3RURVM4K1d3T0Iw?=
 =?utf-8?B?YmFqa2JMVW9LZFJ2TkFHaEZlY3ArQXYrVmtEenk3bVR4SjVjcFhySGZ1eTZn?=
 =?utf-8?B?eWZmWjlyVDBNalFMYStwUVRsSjNMa2ZFY3kyWTIvTUxXK0NpYjZ5SFR5S3lK?=
 =?utf-8?B?UU5GM1RsTUZFQlhoVnhKK1kyN1didEk2dmxkUGNDZkZ3K1ZPbXNWWklQU1VM?=
 =?utf-8?B?ZUt6K1psZGVsR1B4SHlaYjRyVE1YZ2VNdVI5MFNkZzRkYlEvdkdVbEROVXd3?=
 =?utf-8?B?K2trbDFjM0ladklrMi8xanBIWjAyMkVtVWRreGNObVRKNVRwNHlYaVZTaXph?=
 =?utf-8?B?S21pdXBiU2IwSXR5c3lRR0k4QmwzYzhxV1ErMEUzcU1tb3czOE1BYXVDT0JQ?=
 =?utf-8?B?ZmhNeGl1bzJWcWpNYWQ1Y25qY0dmbDN1RDc5Rk1jN0lNZkRwVUhhT1lEcXV4?=
 =?utf-8?B?c0lBZTRrY2FhQkZaaERTWlBXTHZkSU42ZkRlbmNiUVBDVHNtT09jdWRGcWt0?=
 =?utf-8?B?WDBIemhuTGgzblMwSUtzZEtoMFR1WTh5YWFua0d4OFJIUHFwUThCN3I1Mkww?=
 =?utf-8?B?blo0d2VQSURPMHZPa21JOEhqNDlRNnhpQmZjSFZ0Zmd4UlBUS3Y5Y0E1K3JE?=
 =?utf-8?B?ekJWa0xMdzZ6dUo1N3lYRXRmViszYkZiNkxxOEttTFpzUzFpc1Noc1pQcGNr?=
 =?utf-8?B?U29iQ0EvSHQ4SFZrOTA3VE43Rkc5ajdKN2FqeDc5aExFQnR6ZmNDenE1dFFY?=
 =?utf-8?B?MVA2eGZzZjU1V2t4aTBac0wxYVBaeEZhMTZKdExQOXhmdy8wS2FLWjIyN2hj?=
 =?utf-8?B?VVZuS3lzMWhFVnBWSW91SHhoUk9PMlZWVVlFZ0svdGtFOUlwZ0hLY0ZUV3hm?=
 =?utf-8?B?UXdMOVU5OEQxcWJsZ1BPNDRacDExSWx2ZCtqbTFlcDM1NHd3Tlh4bitlWVUz?=
 =?utf-8?B?S2VTZ1FIaUhpczh0a3pFUURpWEVEdk9IM1ExM2Y2SE5naXQvL3BRVnpkVnBu?=
 =?utf-8?B?a2tmdWhSVC9Vbkk1cXpjY2Q5ZTZPek93WVg3SFlnNkdYeFZxcFRTYnJab2RZ?=
 =?utf-8?B?YzFDaVN0Q0FhRHNSSkV0SmluaDhxZTZnS2lhYnlpcEl3d2Vac3U4ajV2TGFP?=
 =?utf-8?B?YjgxUUYyLzJqY1k2bGo5UGpwa0hYV3VZT2ErdUUwSGdMR0dXTFdHZmQvWnhJ?=
 =?utf-8?B?eW93MlNRSE5ERFJWaFpOcTkvaUc4UFNmQW1TWm9RY3cyVE8zZGNzdCtoWlJC?=
 =?utf-8?B?bGFxdGpYV0pjRmhzZVRnOFFsM29TdkxCdC9WWTUwMjh0Rmo4WFNEUUxITXk2?=
 =?utf-8?B?bWpyZENoYnVxbmdWVWFWK0tHdExINEFOL3JCRXhDbnloZTM1Y2pvbVJDQ3VN?=
 =?utf-8?Q?67SojYX2SRkWK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR11MB8102.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGRzcFQ1SE5acGZvSTU5MGpvT01sNmZHTCtRbnBIQVhXRzNEcm8yMHJrRzZZ?=
 =?utf-8?B?SUh1MnBpUDFaZEE2Z3I3d2VlZys5TGRxdHoreitrVmxMNWlsbWh6L0kybmhR?=
 =?utf-8?B?ODB1WnBPQTVLYVBqOUJhQnMxdmlUVXp0UUd4dGdkaW9BS1ExRnRFOWhPWTNj?=
 =?utf-8?B?eVMwUTFZQWlzNWhaWjQyNUNCRVJrS011SkR1RU13czB2clJZbVRxdXhaWFVr?=
 =?utf-8?B?b2N1LytoT1RYWStlVHRweis1OUt6eUFVeGhvL3Roc0pNZ1NBcjdmUzJMVEVv?=
 =?utf-8?B?T1FDSnRQK0NmRjl4cDNKZXN0dzJOblpjWUVYUiszVDVhRWpRRGlxZ1dUQkRJ?=
 =?utf-8?B?QjlXNHI2VE5XaWhBcm5NbUNNaUQrYTRRcjNTWFpIVXo5OTh4TndzdTh3R1Zu?=
 =?utf-8?B?emFvUk5lMHFyWDh2ZlROa0pqRklzVkI0RUpVN09EUXZYL2FnNGYrYzFlYWFn?=
 =?utf-8?B?QUtTVENpYWRzSWZvTjgzUWhQbkVZbFJqR3hpU3hUY2FnemhWaWNsT1lDaWlD?=
 =?utf-8?B?NGMzUEVpZGMzcUlEdUVSZ0VuOXRoQUdDZHBKQVdZaGhrcjFTQUR6K1pMdjNs?=
 =?utf-8?B?eis4SzF2RWV3MGVldElKbGlJRTIvdkdJQ1Q4MTBxS2FnVjFhWmt0SFNXNzdO?=
 =?utf-8?B?Zjl6OVpSWlFxV0NQanJBSTMyNEZXbWVFL3c2dE1ycGNEeFJQTVlIakRMeVMv?=
 =?utf-8?B?dkZsVlJka3AxQmZGakEzeDcwWVprNzZmVjM2NHdtNEhuL0FwK09wQVN6UHBm?=
 =?utf-8?B?YWNjdTRpN281VlYyazZNcUttakk2YWRoZUhoVGdiV25HNlplV2NoR0VTd0tD?=
 =?utf-8?B?SnZXZU0xc043bkFiVGdJTTc4ckJKK0VXRXNGMWhHRm0xclVwOHlXN3BhRDdS?=
 =?utf-8?B?b3FrSHh1bzFNVHV6WGtDOG5obHgyVXhuSU1nTWE3dUtiUU1pVy8zc3ovcm9j?=
 =?utf-8?B?QWFIQzIwQzdHQkRTVVJGOGdhMGo0MEZlelExTVF1OGxSVExiWVl3c1VHOGoy?=
 =?utf-8?B?ZWxFYzV0NXFaWEVwbzE5ZkVCUCttRXdTS2l0RTYvWHBuY1hoSUJCWHFZd2Jp?=
 =?utf-8?B?b3R2ZTNDaXE3enJKakpOWDdsMGdoY3YxdmtZeUFwcDByMU1aZ3VjM2N2S2d0?=
 =?utf-8?B?WGlGMlRQTmxQNkZOenVOVG1lWHlZY0MrNzJLUEdnTlJwY1R6V3JaeHVVSmNy?=
 =?utf-8?B?S1V5VjZFcTluVmFwZmJVSENZUzh1RVNqaEgyWGlvL1Q3T05sNXFiVW9ZRjR4?=
 =?utf-8?B?eGtYUzhMOFNiV0piTnRsTG45aHNOcFdJRWg0U2xvdmxMYnYydnZEQVlsSzN0?=
 =?utf-8?B?TEFxWnBrbVlKYU5TUFpBQjhrNDZkZnRTTGlqTGgxSHdjSFRWSURoQUd5K0F2?=
 =?utf-8?B?ZVZsT0lUaEVmTmx2WFFDcjhiVE5uZGtkKzZFUHVrbEtuMTdiTGM4QzRKcDQ2?=
 =?utf-8?B?Rm1yZXZJckpOS2llLzMwOGtyUk9IRnk0TXp4TTF6bndOdUtLdTgxeG5qZ04y?=
 =?utf-8?B?QXlTVzluWnhUL2d5QjlXNmxFeDM4UXhiZEVmUFJjc05zbi83NjZuQXNlbjdl?=
 =?utf-8?B?SmlQcS9FN1B2SUpGbW93bGJZZk1tWlVmL0c5T3NBOC9yYnh3aHhnRFB2K2xR?=
 =?utf-8?B?bmZjcFQxZmpqVm5ucko2N0trbzhMaEdMZWpxcytlL3NjdmVRM1BKV2tKTVJ5?=
 =?utf-8?B?UFFqQWIycUREai9YZEp0MDVrelNMdjRiYkFXcGRrMC9CTTNvSTVoNjY1U0Q0?=
 =?utf-8?B?V3JQREJMMC9sTm1zRE1jd2srTEU2UXJldDY2ajJzKy90YkFFNktJc3VMd2Y5?=
 =?utf-8?B?ZTVHczBEanlrTmhrOTdYNFRyeUhqcENZL056L2pxUEU0b0ZvdTFnbG9oRXpE?=
 =?utf-8?B?cUw5YUMrVVhQTTE2djlaN1laUndVaDFpTUJraGFhSGYrT3BxQ1pGbUo1Q2F1?=
 =?utf-8?B?WWt4Uk9uNnp5RG9kdWZaNWhhV251QzE5VVhzTTRaY1JEZk1aRVRSMThOV1E3?=
 =?utf-8?B?aThJNzBBYTZBSXc4aHpsOGhQd1l4OVY2MjF2c0pXZlo4T3hIbVpUUWRDdm5H?=
 =?utf-8?B?NTBaQ1g5Z0Q1aE43RU5LTlZBWVJYV3Ewb1ROUlpKdmxZLzRDcGMzSCtRb0Yr?=
 =?utf-8?B?OVNKRWF6SnVXSmJtUUR2SU5mQnNsMGk3YWhTWEd0U3ZMOExBTFNKZGVCQ2ZY?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc5821b-6e67-49a6-a846-08dd1f679b9e
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8102.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 13:26:41.2113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x5FuFMsYDjLt8m7/KXLyajwGssJsSlUIakC33SWNoK8bXOd+wtiUF5BT/oCWnfxtYABc6G1MJdTec8q2CYzcMoIMb743AW9mNWXxT3oExfQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4568
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 19 Dec 2024 08:42:42 +1100
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
Cc: alexandre.torgue@foss.st.com, edumazet@google.com, schung@nuvoton.com, yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org, openbmc@lists.ozlabs.org, joabreu@synopsys.com, kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org, ychuang3@nuvoton.com, richardcochran@gmail.com, peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, davem@davemloft.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12/18/24 12:44, Joey Lu wrote:
> Add support for Gigabit Ethernet on Nuvoton MA35 series using dwmac driver.
> 
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>   drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
>   drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>   .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 182 ++++++++++++++++++
>   3 files changed, 194 insertions(+)
>   create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> index 6658536a4e17..c8cbc0ec1311 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -121,6 +121,17 @@ config DWMAC_MESON
>   	  the stmmac device driver. This driver is used for Meson6,
>   	  Meson8, Meson8b and GXBB SoCs.
>   
> +config DWMAC_NUVOTON
> +	tristate "Nuvoton MA35 dwmac support"
> +	default ARCH_MA35
> +	depends on OF && (ARCH_MA35 || COMPILE_TEST)
> +	select MFD_SYSCON
> +	help
> +	  Support for Ethernet controller on Nuvoton MA35 series SoC.
> +
> +	  This selects the Nuvoton MA35 series SoC glue layer support
> +	  for the stmmac device driver.
> +
>   config DWMAC_QCOM_ETHQOS
>   	tristate "Qualcomm ETHQOS support"
>   	default ARCH_QCOM
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> index 2389fd261344..9812b824459f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> @@ -19,6 +19,7 @@ obj-$(CONFIG_DWMAC_IPQ806X)	+= dwmac-ipq806x.o
>   obj-$(CONFIG_DWMAC_LPC18XX)	+= dwmac-lpc18xx.o
>   obj-$(CONFIG_DWMAC_MEDIATEK)	+= dwmac-mediatek.o
>   obj-$(CONFIG_DWMAC_MESON)	+= dwmac-meson.o dwmac-meson8b.o
> +obj-$(CONFIG_DWMAC_NUVOTON)	+= dwmac-nuvoton.o
>   obj-$(CONFIG_DWMAC_QCOM_ETHQOS)	+= dwmac-qcom-ethqos.o
>   obj-$(CONFIG_DWMAC_ROCKCHIP)	+= dwmac-rk.o
>   obj-$(CONFIG_DWMAC_RZN1)	+= dwmac-rzn1.o
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
> new file mode 100644
> index 000000000000..c5b8933c1f44
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
> @@ -0,0 +1,182 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Nuvoton DWMAC specific glue layer
> + *
> + * Copyright (C) 2024 Nuvoton Technology Corp.
> + *
> + * Author: Joey Lu <yclu4@nuvoton.com>
> + */
> +
> +#include <linux/mfd/syscon.h>
> +#include <linux/of_device.h>
> +#include <linux/of_net.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/stmmac.h>
> +
> +#include "stmmac.h"
> +#include "stmmac_platform.h"
> +
> +#define REG_SYS_GMAC0MISCR  0x108
> +#define REG_SYS_GMAC1MISCR  0x10C
> +
> +#define MISCR_RMII          BIT(0)
> +
> +/* 2000ps is mapped to 0 ~ 0xF */
> +#define PATH_DELAY_DEC      134

would be great to previx your macros by NVT_

why 134 and not 125?

> +#define TX_DELAY_OFFSET     16

please remove and replace the usage point by FIELD_PREP()

> +#define TX_DELAY_MASK       GENMASK(19, 16)
> +#define RX_DELAY_OFFSET     20

ditto

> +#define RX_DELAY_MASK       GENMASK(23, 20)
> +
> +struct nvt_priv_data {
> +	struct platform_device *pdev;
> +	struct regmap *regmap;
> +};
> +
> +static struct nvt_priv_data *
> +nuvoton_gmac_setup(struct platform_device *pdev, struct plat_stmmacenet_data *plat)

please stick to one previx for all functions, structs, and defines,
NVT/nvt looks good
s/nuvoton/nvt/

> +{
> +	struct device *dev = &pdev->dev;
> +	struct nvt_priv_data *bsp_priv;
> +	phy_interface_t phy_mode;
> +	u32 tx_delay, rx_delay;
> +	u32 macid, arg, reg;
> +
> +	bsp_priv = devm_kzalloc(dev, sizeof(*bsp_priv), GFP_KERNEL);
> +	if (!bsp_priv)
> +		return ERR_PTR(-ENOMEM);
> +
> +	bsp_priv->regmap =
> +		syscon_regmap_lookup_by_phandle_args(dev->of_node, "nuvoton,sys", 1, &macid);
> +	if (IS_ERR(bsp_priv->regmap)) {
> +		dev_err_probe(dev, PTR_ERR(bsp_priv->regmap), "Failed to get sys register\n");
> +		return ERR_PTR(-ENODEV);
> +	}
> +	if (macid > 1) {
> +		dev_err_probe(dev, -EINVAL, "Invalid sys arguments\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	if (of_property_read_u32(dev->of_node, "tx-internal-delay-ps", &arg)) {
> +		tx_delay = 0; /* Default value is 0 */

please remove obvious comments

> +	} else {
> +		if (arg <= 2000) {
> +			tx_delay = (arg == 2000) ? 0xF : (arg / PATH_DELAY_DEC);
> +			dev_dbg(dev, "Set Tx path delay to 0x%x\n", tx_delay);
> +		} else {
> +			dev_err(dev, "Invalid Tx path delay argument.\n");
> +			return ERR_PTR(-EINVAL);
> +		}
> +	}
> +	if (of_property_read_u32(dev->of_node, "rx-internal-delay-ps", &arg)) {
> +		rx_delay = 0; /* Default value is 0 */
> +	} else {
> +		if (arg <= 2000) {
> +			rx_delay = (arg == 2000) ? 0xF : (arg / PATH_DELAY_DEC);
> +			dev_dbg(dev, "Set Rx path delay to 0x%x\n", rx_delay);
> +		} else {
> +			dev_err(dev, "Invalid Rx path delay argument.\n");
> +			return ERR_PTR(-EINVAL);
> +		}
> +	}
> +
> +	regmap_read(bsp_priv->regmap,
> +		    macid == 0 ? REG_SYS_GMAC0MISCR : REG_SYS_GMAC1MISCR, &reg);
> +	reg &= ~(TX_DELAY_MASK | RX_DELAY_MASK);
> +
> +	if (of_get_phy_mode(pdev->dev.of_node, &phy_mode)) {
> +		dev_err(dev, "missing phy mode property\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	switch (phy_mode) {
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +		reg &= ~MISCR_RMII;
> +		break;
> +	case PHY_INTERFACE_MODE_RMII:
> +		reg |= MISCR_RMII;
> +		break;
> +	default:
> +		dev_err(dev, "Unsupported phy-mode (%d)\n", phy_mode);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	if (!(reg & MISCR_RMII)) {
> +		reg |= tx_delay << TX_DELAY_OFFSET;
> +		reg |= rx_delay << RX_DELAY_OFFSET;
> +	}
> +
> +	regmap_write(bsp_priv->regmap,
> +		     macid == 0 ? REG_SYS_GMAC0MISCR : REG_SYS_GMAC1MISCR, reg);
> +
> +	bsp_priv->pdev = pdev;
> +
> +	return bsp_priv;
> +}
> +
> +static int nuvoton_gmac_probe(struct platform_device *pdev)
> +{
> +	struct plat_stmmacenet_data *plat_dat;
> +	struct stmmac_resources stmmac_res;
> +	int ret;
> +
> +	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
> +	if (ret)
> +		return ret;
> +
> +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
> +	if (IS_ERR(plat_dat))
> +		return PTR_ERR(plat_dat);
> +
> +	/* Nuvoton DWMAC configs */
> +	plat_dat->has_gmac = 1;
> +	plat_dat->tx_fifo_size = 2048;
> +	plat_dat->rx_fifo_size = 4096;
> +	plat_dat->multicast_filter_bins = 0;
> +	plat_dat->unicast_filter_entries = 8;
> +	plat_dat->flags &= ~STMMAC_FLAG_USE_PHY_WOL;
> +
> +	plat_dat->bsp_priv = nuvoton_gmac_setup(pdev, plat_dat);

would be great to extend plat_stmmacenet_data allocation to allocate
also the space for the priv data - but this is outside of the scope
of this patchset

> +	if (IS_ERR(plat_dat->bsp_priv)) {
> +		ret = PTR_ERR(plat_dat->bsp_priv);
> +		return ret;

just return PTR_ERR(...)

> +	}
> +
> +	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
> +	if (ret)
> +		return ret;
> +
> +	/* The PMT flag is determined by the RWK property.
> +	 * However, our hardware is configured to support only MGK.
> +	 * This is an override on PMT to enable WoL capability.
> +	 */
> +	plat_dat->pmt = 1;
> +	device_set_wakeup_capable(&pdev->dev, 1);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id nuvoton_dwmac_match[] = {
> +	{ .compatible = "nuvoton,ma35d1-dwmac"},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, nuvoton_dwmac_match);
> +
> +static struct platform_driver nuvoton_dwmac_driver = {
> +	.probe  = nuvoton_gmac_probe,
> +	.remove = stmmac_pltfr_remove,
> +	.driver = {
> +		.name           = "nuvoton-dwmac",
> +		.pm		= &stmmac_pltfr_pm_ops,
> +		.of_match_table = nuvoton_dwmac_match,
> +	},
> +};
> +module_platform_driver(nuvoton_dwmac_driver);
> +
> +MODULE_AUTHOR("Joey Lu <yclu4@nuvoton.com>");
> +MODULE_DESCRIPTION("Nuvoton DWMAC specific glue layer");
> +MODULE_LICENSE("GPL v2");

