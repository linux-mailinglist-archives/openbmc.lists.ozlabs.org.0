Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9233490B141
	for <lists+openbmc@lfdr.de>; Mon, 17 Jun 2024 16:15:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ap6urRwb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2sNH1vfkz3g4W
	for <lists+openbmc@lfdr.de>; Tue, 18 Jun 2024 00:15:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ap6urRwb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Tue, 18 Jun 2024 00:14:05 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2sM10nVrz3fxV
	for <openbmc@lists.ozlabs.org>; Tue, 18 Jun 2024 00:14:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718633646; x=1750169646;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=92FdSnBHgsrAjDAJo9j2vLckH9LvUjmpekpFtUMwPbY=;
  b=ap6urRwbg3DMGnQsy0TuKmvT8ggvZmpxLpZlmmBIw77FRWKZgYNu5Deq
   hNsI+d/a5rDOm6iQRNlSZpnxajjn8R0E2uYPwxBZvwKDlCI4pCJYxtJdn
   QASc5f6ey9gQgLjwnYX7hpk2oyQJKfpprFfOnebnerkcWFehCFdDH2N8r
   8voJ8RpI5qw7vSV8IUOWBHKvO3ybxdwzexTiRh2DtVID6MSY75HV8DrV7
   Mt2RJ5OIq/LS4moAO1/h1mBmF0StTOcighrBYFbHTX1XdanYTOKYLWPgi
   kRY41VnKZhudjBcklimtbOTes6AHCVcAT2OcT9BWVwGQ2c4qunR34H9fk
   g==;
X-CSE-ConnectionGUID: xJ6DOYJ+RumtoEzCcj/jbA==
X-CSE-MsgGUID: gRSPvjXdQRe044454q3gWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="15691287"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="15691287"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 07:09:03 -0700
X-CSE-ConnectionGUID: wGvaeTnaSM2dZYhU3SJpnA==
X-CSE-MsgGUID: TXjlwCiaSQOWtSNysPgDIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="46320216"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Jun 2024 07:09:03 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 07:09:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 07:09:02 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 07:09:02 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 17 Jun 2024 07:09:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vo/HTgMa4yN6qYT8e7RVzWjRP651WqLK/eOiH3gkkGSHXfQDWgA3y33gkBUPmKwoTgrxok7vxkYYB63hUv4+I3bSCVxtVDwvcvrvZCrecA9rFZW7ISBhuVbunGeArFr5YL8can751x2Q/z5pc/ZZdTENrcK7qYtIZiCpty2JzbvtdCkKK/uORoUu76gor4qBNvQa6pm0FsR6bS0+K6hdBZvfeKJiTosJyaT8fdfMFpFVb08/1VZT3+RMtEDg0RJ8PHtTGnZcqTSxG7k2SLKkwlfKCrPV+KEEfrjKfr3PqGjuvm/x3DGEyWl0Gw9VV6jgGiVsmN/meQT963dE93Ji/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=92FdSnBHgsrAjDAJo9j2vLckH9LvUjmpekpFtUMwPbY=;
 b=msnA3cDEL61Jo/TDTd9Jia1sjO3AY2l1k2FhjKGBZIq6vMU5uSHLpKZxqAVbzvWhnBbXlM6k+nXP9kHWh75edab5da35FczEaNfwXhxg9Cc3z8Yk0AFvON0hAHlqL8gBdRS0lQoRv9LcEa8mPSXVeUrMBjPXsR5sUlRYslcBz0gmxvu40jQUYmokIG9c1/fmTeWJ9Li0IFD+dAF6o9G7qEijChJ/RonzYr+o8z2DzlQIO4dcPyGhGx0zRKWyuKnefyZncs7PY/y4oHRn+xH5Of0DaKQfRUUbGprXUUVyKdUPRS98KPSpIlgQTwDb8a+176NNI2Z7wNM7CEEtDbfw0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5330.namprd11.prod.outlook.com (2603:10b6:610:bd::7)
 by MW4PR11MB7104.namprd11.prod.outlook.com (2603:10b6:303:22e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 14:08:58 +0000
Received: from CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::e179:e:20e5:53db]) by CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::e179:e:20e5:53db%7]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 14:08:58 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: [GIT PULL] PECI changes for v6.11-rc1
Thread-Topic: [GIT PULL] PECI changes for v6.11-rc1
Thread-Index: AQHawL/lGlHt1nhEPEqpboYdhM1+5A==
Date: Mon, 17 Jun 2024 14:08:58 +0000
Message-ID: <4726946cc4ece91b414994fcd696aebf69ee115b.camel@intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.2 (3.52.2-1.fc40) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5330:EE_|MW4PR11MB7104:EE_
x-ms-office365-filtering-correlation-id: f25c7839-1bd3-4d92-c79a-08dc8ed70810
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|366013|376011|1800799021|38070700015;
x-microsoft-antispam-message-info: =?utf-8?B?N3hlRmtlZlJuUUxJanNEbWFKbFE4MVhsb2Zaa29uRTZNVGtqUThPMzI3Tm81?=
 =?utf-8?B?VkFzM2ozK2FEdFRxVGxZalNUZUFEdStjZEtQMTVPZ2RickRJV1YxMXZpOGVj?=
 =?utf-8?B?cWt3WUxIS3VIb1ZKSXBEZU5taWdsY3V6R1BUWDV4Vy9pQUt5eVpYTkkva0ZV?=
 =?utf-8?B?VmJQNy9pZFFXVmFWbDNBUmZwelZLQlRWQ2hGNnA5K1g2T1dzaG5QMnltQkJC?=
 =?utf-8?B?NVdwQ3l0K1JnaVF5SGZVZG9uK2RGdy8yMFR4Qms2MDd1TmNSYytzK0lVYVBB?=
 =?utf-8?B?VUZWN0Qwd2hvQTdLdVNjdzRtVzRBYXpxWEVLN1p1MUlrZGxVTzlXVFljUXBl?=
 =?utf-8?B?R21vdDRjR083YkorWVNTQkxhUjh4Y0dTclRWSUozUS91TXhGYWo5N3lHS1R4?=
 =?utf-8?B?RU1vL2R1T0ZKZmkyR3hMVExNc0NXVHhTODl3d3hiWXlySmJXb3dlMStZZVg5?=
 =?utf-8?B?bXZJelo1ZzdOREV6MGpwUjdsWGFEdnNzNnNMWnZ6OVhLcWUya0Z1alVNVnFt?=
 =?utf-8?B?SHE4ZC9rK0Jqa1VUNlRCN1NaaVlHN3k4Y0lVLytNaFE1cTdRSmpvalBzVHlZ?=
 =?utf-8?B?bG1lSkhLKzJDRVF6NmZLVGVqRnBDalZuOEYxV1MyM2YrYXR4SlorTGN2YUV3?=
 =?utf-8?B?UVk1VUtqT1pxaFhFa1U4ZnhpbUtwNFphSkxJWWE5b3VxUUt1M05mYVFGVVVp?=
 =?utf-8?B?L3FuQkxUd0syRjhyTHQ0SHg2Z0lYVWs1YnNDZlRic0FlU3JjTHptdTZWU0s5?=
 =?utf-8?B?QTF0K2dZQjBsZ1FzV1JJdWRUOXVOL0dvSlBoa1JkUnNydlhCeG9VRExqSDNq?=
 =?utf-8?B?RXRoazBPOEZGMlZldWtpaFRBOFJaZFFVVnpiOW1KZFZFTmhmc3h2YkdvdDZ2?=
 =?utf-8?B?S1NBWU9vT2F0eVJuSloxL0RrZnpUd2xCMHdFQ0NObXhjSHpLWWlFcFhoVHBx?=
 =?utf-8?B?SUhtSDNKdTVlQVZodHBLQlRKOGo3dG52bEZPeFVWQnlwOHpnWkVZN0V1UVJY?=
 =?utf-8?B?c21ZRXZ5TU9sYUMyUDJBR3gzL1l3NUZvSUE2ckg0ZFJTY2NjK3MzaE1xMEpB?=
 =?utf-8?B?THhZdkw3ckdFMVRuNzVKdWNEMXd6S05TTlc3YmluL0Rra0x4eFJaUjF4VG9j?=
 =?utf-8?B?a3FGSnhJS204VEkvV1FnNTdFYjNNOThFRG4zTEwvZVppdkNGN2lCM1VJTjNK?=
 =?utf-8?B?SDREcHk5SFJTbHIxUWo0WXh3dnRmb3krQmQ2UUp1Wm5JMlBYT09WTkIzOU9Z?=
 =?utf-8?B?b1hrcDZGa1F4YXc2UGJSanhXWnVzUGhWa3N0RzE3SUgycnNvQW01WnZERGY1?=
 =?utf-8?B?ZnY3YUx1YzR5ODRPdlpiWjZFamJ2eUt2OGFWOThvZkFDR0NoT2VoZjhaYmw4?=
 =?utf-8?B?dHhubFZCQkV4b3lPaFZOS1VxNW1Mdm5tTDRWMlYxb3U4NXAyVGxjMFlnOG00?=
 =?utf-8?B?aFZYSjc4c2VvanlIejVOcVpmU0FIS3BMUnN3MGoxWDA5NmNSa1p0MWF5cUFj?=
 =?utf-8?B?L2JvcWFVcGtKYTNpYzNkdVIxd3ZhbmV5RFZ0UXMzN3d4L1VRays3OE5MT1hU?=
 =?utf-8?B?S01kQzFZZnZSUDR4VG5qajhzclN0eU0xVk9iVUpOK0NDZXAwVkRpTGtwcUo0?=
 =?utf-8?B?Uk9JTEwreWdtTTRUSlJhdFVMUFhUTnNCbzNyeXg4VDhxdWhzQkp0S0IycWti?=
 =?utf-8?B?MmR3ektEdFJYc1Q0aE9hUHMvZ1JpcUR4Z21aV1JERXNZK0xkNk5TU1d6VjBm?=
 =?utf-8?B?bGdYazRMaVJrVGoyVVVJWlpqUDQrNUhIOEpBdDlRcGtVVU5iR2g2NDhjeUd0?=
 =?utf-8?Q?HWvLdQ/lwqX372dw38G4J+SsrT7bvVVgA2ek0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5330.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(1800799021)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SS92NXBPaHZPbUZrdFVhdjgzL3J1VWJNZDlqZHBDMlR2QmJMVDZ3U0dpb3FQ?=
 =?utf-8?B?ODhPZXdIdG54emllb2tBQVBNaFpNSkFwUTlTbm1KYVF1Vnd5WHhWL1FGeWtk?=
 =?utf-8?B?QnllSThETFZEZnVtR3pQbDNkbWU4T2FOVEZSM3djaWdSM3RTOTBIbmZMYkJx?=
 =?utf-8?B?RmJYVlk1RHd4SWt6OXNEbVhwRFJtNDhIL05WeEd4RHp5WDF5MzRLUzNkblFm?=
 =?utf-8?B?c1RUU2pSKzl3ODladWZDaWt3OVdjVUJ3a0RiU2RnaTJrVStyeFZpeXRPQis4?=
 =?utf-8?B?RmdSZEU2TkVDOXdrUytCZFFPNkc2cmpMSVBqT0lJanVTVVA4OEs0Y0UzL3lC?=
 =?utf-8?B?VzAraThSNEJlSE4rWjNDeU91QzUyWG0xa0hkTDFjdVBJSTVQTXFpd2xXQ1Nm?=
 =?utf-8?B?YnR0VkZwS2RFSm5DRVpEMzZvWnJKTlRWTzBLblFib2F2MGx3K0h6SURXVXkr?=
 =?utf-8?B?MWFvbzlmcDdKc05Ec1VBUVIrR0lNYWVZZkE2RHZYZGM2aUFOWk9hTEZaSFFM?=
 =?utf-8?B?Z1IyZmZzYTJKQzgrQzdrclBzQU8wcDhFR3owQ2VFS2thMUI0MUJ4cE1nNyt2?=
 =?utf-8?B?anhid1I0ZDJPdkxVVlVRajNwT3JuUmZhWGU2cjk1UXRzcG13K0tCSk5vc1RG?=
 =?utf-8?B?WFZvK2lNWXNlbmtZb29HMDV5MUozbi9YTVQzMUVGVTlvVWpmbnFTTnY1Mm05?=
 =?utf-8?B?MFd0ekxoUFFnSkNpUHlXRGVXY1dsSVloUEs5SlRXbCtDVW1GamFyS3o0THBo?=
 =?utf-8?B?QzB0dVdmV2M1Z2phWWhacDYrK241SVI2SzdCZG0wbWNORlhESmxhcXhia1Jq?=
 =?utf-8?B?N2JnTUxiL3pyenZ6N2h2N1F1Y3ArenkxZE1JNVY0UTkvNjV4cXcrN3oxWVVr?=
 =?utf-8?B?YTVoY0dhZmx4WUQwWW5SanVBYllwaEl5WXc5MGtjTGpEU05YSE9ENXNKRS9w?=
 =?utf-8?B?cmRYNU1JOTIxY2ZiRnNZenZKRjEybDdMRjZ3V3p6UTQ0YWRMdkNzcU0xbkpp?=
 =?utf-8?B?Y21UeFVrL3lzOHF6OHRmUWZNOUZJM3BrK2FFL2VIcUNDRmlycy92YnI4bzk1?=
 =?utf-8?B?Ui9pYU9Qb3hJTndtU1VOTE5McDZJWWxDYjBWSVo2Rnh3V3crRzRySk42Skxm?=
 =?utf-8?B?VzRJY0plK1BGc1lST1Zob1NsNGl5aVI4YXJOMDZubzdHdFFzOVo0cWtaT2gw?=
 =?utf-8?B?cGhUK3dKRmVmdHB6K3o4U0F3VFZVVWY2MTF4WThPNGVRTVBaQk5xSWU5THVh?=
 =?utf-8?B?OElNYUFYdytuc1lPUWlONTlsQUVwai9nTWZLNFFPWDZGWFVMUldIUHdDWTQw?=
 =?utf-8?B?eGRDZGRES2Vra0d4QUVZMDBKdkIwWi9NZSs4TSs0emxWbThMSDJxcjlEdjNn?=
 =?utf-8?B?UTRnL294eTdOZ3FVODJRVUY1TjdSTXNZeTAxOGxxTmMybDhZMHcwTnQ1NXFh?=
 =?utf-8?B?MksyYk4wNkF1ZjJCZXRob2l1TlUxelV4dmFFMEx2RDhBRjJvWUE0czdFK2cz?=
 =?utf-8?B?RDkyVzNPQ1NZb2puRE5vN3ZXcE9PcDFVdjFISTkwVU40MGFvcHVsb3VFV2hX?=
 =?utf-8?B?eEREdG1aT3N0YnRnTUVtK1M2VVVyeWZOY1F0R25VM1I2RTUyVlFBekJ4Tm1Y?=
 =?utf-8?B?anhhMnJqYVdPcjRyTHpGVXFhKzFVWGRyQ3pERU5WYVQ1RDN3d2NmNSt0ekor?=
 =?utf-8?B?eTZzY0RFRE9TUTJXeFpIUFp3RHVZUFpKcDVlMy80cGozYUNmdFFuVWR5WGRZ?=
 =?utf-8?B?SCtCMnh2dXJkYzh5bFpzYWlsOXlaZmQxWHA2cll5UnFaSDFBNnVZWnkrYXhK?=
 =?utf-8?B?TlU4QWw5UmtEL3VMYmkrUStTSkZFUkwwS1hRV2NOdWxYZEJqb0dxUUI5OEJ0?=
 =?utf-8?B?eTVHZnFSbTVBTW9LQVNNNjg2dTBockEzb1F5Y08xS3p2M09JdEpuWE4ydWhI?=
 =?utf-8?B?Ri9EeC82R0UvWEtReFY5bkhtMFdYRURIL1d3dC9XV2t4WHVzN2wrTDJZa3hm?=
 =?utf-8?B?QzUra2w4ZjhMemFlRHVld1ZuVU40OW5pWVF1a05RN2c2YWtsRWxkblpPc3Rq?=
 =?utf-8?B?cXVtTkJKcHBuNXkvU2FFTGg4VFoxdEZLTld5V3JNRmxCVGMwcFhWeEV3blFw?=
 =?utf-8?B?UWZOY21sOHczeEN3VEdRUEtuZVFsOTYvRTlodjhmMEt2QVFmanltaHB6NDdu?=
 =?utf-8?B?NEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <305965622FBF454C96CCC18A358A1FCA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5330.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f25c7839-1bd3-4d92-c79a-08dc8ed70810
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2024 14:08:58.4069
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HpwzHvOjSns7stfTd5CvnTF7Cr8rLVqNooQ8LyETHeTDvBu3sW+NH7IosRUbcKAGVLjt3tUFiodUDHR39kgPcajybznVFL9jtQS7K34x2i4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7104
X-OriginatorOrg: intel.com
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

SGkgR3JlZyENCg0KUGxlYXNlIHB1bGwgUEVDSSB1cGRhdGUgZm9yIExpbnV4IHY2LjExLg0KDQpU
aGFua3MNCi1Jd29uYQ0KDQpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDZiYTU5
ZmY0MjI3OTI3ZDNhODUzMGZjMjk3M2I4MGU5NGI1NGQ1OGY6DQoNCiAgTGludXggNi4xMC1yYzQg
KDIwMjQtMDYtMTYgMTM6NDA6MTYgLTA3MDApDQoNCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCBy
ZXBvc2l0b3J5IGF0Og0KDQogIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC9pd2kvbGludXguZ2l0IHBlY2ktbmV4dC02LjExLXJjMQ0KDQpmb3IgeW91IHRvIGZl
dGNoIGNoYW5nZXMgdXAgdG8gYWJhNTljZTEwOWRlY2EyYjlhYmViOTA3MmRkY2EwZWE4NjgyYmY1
YToNCg0KICBwZWNpOiBhc3BlZWQ6IENsZWFyIGNsb2NrX2RpdmlkZXIgdmFsdWUgYmVmb3JlIHNl
dHRpbmcgaXQgKDIwMjQtMDYtMTcgMTU6MTg6MjkgKzAyMDApDQoNCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NClVwZGF0ZSBw
ZWNpLW5leHQgZm9yIHY2LjExLXJjMQ0KDQoqIHBlY2ksIGh3bW9uDQotIFVwZGF0ZSBwZWNpIHN1
YnN5c3RlbSB0byB1c2UgbmV3IEludGVsIENQVSBtb2RlbCBkZWZpbmVzLg0KDQoqIGFzcGVlZA0K
LSBDbGVhciBjbG9ja19kaXZpZGVyIGJlZm9yZSBzZXR0aW5nIGl0Lg0KDQotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpJd29u
YSBXaW5pYXJza2EgKDEpOg0KICAgICAgcGVjaTogYXNwZWVkOiBDbGVhciBjbG9ja19kaXZpZGVy
IHZhbHVlIGJlZm9yZSBzZXR0aW5nIGl0DQoNClRvbnkgTHVjayAoMSk6DQogICAgICBwZWNpLCBo
d21vbjogU3dpdGNoIHRvIG5ldyBJbnRlbCBDUFUgbW9kZWwgZGVmaW5lcw0KDQogZHJpdmVycy9o
d21vbi9wZWNpL2NwdXRlbXAuYyAgICAgICAgICB8ICA4ICsrKystLS0tDQogZHJpdmVycy9wZWNp
L2NvbnRyb2xsZXIvcGVjaS1hc3BlZWQuYyB8ICAxICsNCiBkcml2ZXJzL3BlY2kvY29yZS5jICAg
ICAgICAgICAgICAgICAgIHwgIDUgKystLS0NCiBkcml2ZXJzL3BlY2kvY3B1LmMgICAgICAgICAg
ICAgICAgICAgIHwgMjEgKysrKysrKy0tLS0tLS0tLS0tLS0tDQogZHJpdmVycy9wZWNpL2Rldmlj
ZS5jICAgICAgICAgICAgICAgICB8ICAzICstLQ0KIGRyaXZlcnMvcGVjaS9pbnRlcm5hbC5oICAg
ICAgICAgICAgICAgfCAgNiArKy0tLS0NCiBpbmNsdWRlL2xpbnV4L3BlY2ktY3B1LmggICAgICAg
ICAgICAgIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKysrDQogaW5jbHVkZS9saW51eC9wZWNp
LmggICAgICAgICAgICAgICAgICB8ICA2ICsrLS0tLQ0KIDggZmlsZXMgY2hhbmdlZCwgNDMgaW5z
ZXJ0aW9ucygrKSwgMzEgZGVsZXRpb25zKC0pDQo=
