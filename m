Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C087D97124D
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2024 10:41:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2L0C4Yj1z3cH2
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2024 18:41:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=198.175.65.15 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725871270;
	cv=pass; b=bVAgj1VKOY4yma+c9BVEgWRuBviiECGkuNIIqp5QrVl+f4yAAZ58uYuSgYQUcKglI/mWfXGOATYdEjag9Q38DgDhjKiMb4w3hYPfgEyvnl2vNuYjUbwvZui7j4NUACGZ4/Yd2NQbpo/Ng9ZqpWjh2akBZNDGtrFBt2144quxgcCau4FF6AfTPl+SIsSU+PQcew9P2P9rJ3LOtcKWD3P5EyHeMXMuTD97I9wEgfKhlLzbJH3i6eSML0q+XHJQs/++gSrcgDSUOdzFMkoNYpRN97P66T1j/ErfD/w6jjYFHFxRp+BFLLf3g5lHMtZwQ5Ki9wZTZQdif+MPML50hXkblw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725871270; c=relaxed/relaxed;
	bh=eGGR/Kv9YumRjKkGKxL+ETE6rYDHSrgJr1XeyWhu38M=;
	h=DKIM-Signature:From:To:CC:Subject:Date:Message-ID:References:
	 In-Reply-To:Content-Type:MIME-Version; b=NPzDOwrXgYur99xB3nQekmYQVf8oS1VleT0VBAt1E91Lhmsv3bWq4t8cODUhXLR48+m6ObsAkJPVysNlEthRU+h8NP6ZJOzpAnTsU43qi3nEHDaNgSku6JxXdUJuixDTFVniZLUomb5t7nz8YJhV7Ohalnbq4m242KJVdLy+cVQMDt8nT7KD5nr4d83yzZiB5VSZxMnsejOI/jppfs8xbmb8rY5wEh+yqh8a+tEsjV5uu1O+B13gom0t7ltll0HlBpBHgGg/8Abg+N9LV6efl+8jWOMfIpUqtPi19U22eNkzUp8zdhvv0HZcucQJSM0RrEVU/4NrGtcE/IiDiKzHkQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sv2M2tGz; dkim-atps=neutral; spf=pass (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sv2M2tGz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2L046JNkz2xch
	for <openbmc@lists.ozlabs.org>; Mon,  9 Sep 2024 18:41:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725871269; x=1757407269;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=eGGR/Kv9YumRjKkGKxL+ETE6rYDHSrgJr1XeyWhu38M=;
  b=Sv2M2tGzDIvR+vhBuBqfzoAWiSK2fu5lxlmB0np96aK4ZxbrjRwz/Upb
   gNqJqEnKb8vM6mBXObpfhqrUikljNO3TCMT6PkJfXA7rY3S/ajiwjtsa+
   nXaHZWkRqZ8asa8fkMk8XBlkz+CRy451NTc5bZ1m1YBSMupQWWK8NbdWe
   ElCz9u4JGFnMZb9lmBBBwmLCM8k/c5jyNjbwVW3dPnzgzDXNMUUMvvx5V
   p36ZbGkyk0SUCt9m2sJLaXlaLArljDKhgBpWvv0JjxZM9VYTojGOmFG6p
   ieKAnvzzPbTbiZkeh+E6r4Gbw1v5PZNPNO9vWPHanjm6XJ1Cgn2n7n+YI
   Q==;
X-CSE-ConnectionGUID: rIyV4weIQ/2XQ5v7Lt40hw==
X-CSE-MsgGUID: LS9bAgwjQCWO1qK3M8IEiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="28296197"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="28296197"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 01:39:36 -0700
X-CSE-ConnectionGUID: KTIGC3AAQQ+J90sGtbeK4A==
X-CSE-MsgGUID: 6r3sM4FsQ2+MrZm3Vx4HXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="66580939"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 Sep 2024 01:39:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 01:39:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Sep 2024 01:39:35 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Sep 2024 01:39:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EruZhgByqxNB+9o4w8tlwpwecid0MaqXxcrjNvtic0UvbR6k4/r8vUwinEqBCPbZ/kPmlG+1zjvutiiZmNPWGye7UfEr4BzEVy6Cr6YgqvDsrD4RsoslbEkp8Jbc6doTkGAmK345pVkEdi1Q6T0wAfVDUx3jOcVLGVlOQZY4HqVr3/GPQUpX47Rdx2PGYgh9YfNXR22zMjDoL4uivaHnpXsNuj7+KVTbzsH/NtCsePHzSawKBJmwkPisgyyZmyMDJQX3e4ywjrHTt+CItR5i1rzs0i25m78avuptDCde3+1KbV+qnQVhM1+3dnoTOAm93kZShrHgIsoEXcAI5mFBYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eGGR/Kv9YumRjKkGKxL+ETE6rYDHSrgJr1XeyWhu38M=;
 b=APKkDUXKA9iaERn0omCi1TWF/jFLQtpQOkmzAZJLb5B2J38gqNb2fFtF8SoHSbS4x4pGkyPP9sZrVNixmlprSHPpPQKJk7nP74OHghyqbygw33m73y2KsSKkmIDcssQfF8vjRAX/c1KSmQv/V/a/UqfmYYOONiDaFvytC/nKteUrrC+Mn1HnVHkhT5mpPWjKmzcdKmvrcV3jG/El/r/eiK/kjvknBu8UdeaoRUVIckCTVE9MhJzdBzR0j9qLNi9hIV9anVBDVYwoliDFaltlatuy1Pbl3Spsa7wMhtQMO1xK6jhgUSIQVdIcPqdjJokMcESNID39hM1ZB/hkeNagzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5330.namprd11.prod.outlook.com (2603:10b6:610:bd::7)
 by LV2PR11MB6024.namprd11.prod.outlook.com (2603:10b6:408:17a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Mon, 9 Sep
 2024 08:39:24 +0000
Received: from CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::e179:e:20e5:53db]) by CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::e179:e:20e5:53db%7]) with mapi id 15.20.7939.017; Mon, 9 Sep 2024
 08:39:24 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "tmaimon77@gmail.com" <tmaimon77@gmail.com>, "tali.perry1@gmail.com"
	<tali.perry1@gmail.com>, "venture@google.com" <venture@google.com>,
	"avifishman70@gmail.com" <avifishman70@gmail.com>,
	"christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
	"yuenn@google.com" <yuenn@google.com>, "Fair, Benjamin"
	<benjaminfair@google.com>
Subject: =?utf-8?B?UmU6IFtQQVRDSF0gcGVjaTogbnBjbTogQ29uc3RpZnkgc3RydWN0IHBlY2lf?=
 =?utf-8?B?Y29udHJvbGxlcl9vcHPigIs=?=
Thread-Topic: =?utf-8?B?W1BBVENIXSBwZWNpOiBucGNtOiBDb25zdGlmeSBzdHJ1Y3QgcGVjaV9jb250?=
 =?utf-8?B?cm9sbGVyX29wc+KAiw==?=
Thread-Index: AQHbAPOgpOD4XhEgqESYMUOgiOtg7bJPJYaA
Date: Mon, 9 Sep 2024 08:39:24 +0000
Message-ID: <5f7e348bb17b19ced22eaa20d5396e66eb724a8f.camel@intel.com>
References: <3c7d455745c2265c19ed02f026dfc9610271d3c2.1725692376.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <3c7d455745c2265c19ed02f026dfc9610271d3c2.1725692376.git.christophe.jaillet@wanadoo.fr>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3 (3.52.3-1.fc40) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5330:EE_|LV2PR11MB6024:EE_
x-ms-office365-filtering-correlation-id: 8acc6b88-f30e-4446-f5c7-08dcd0aae88e
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?M0ZpbG9Xbmg4WUNFYTYzeWhRaXJyZVMybWorbHhhQS9CakZTU1NWcm9sRFJs?=
 =?utf-8?B?RjUxZlhPMGhmWnJRNmltc21tb2pwUkpzUDBPdlpaU1hNTWROVlZFM2RKK0tD?=
 =?utf-8?B?VmNKNndiL2dEaytJMjhaOEJkZmprS1FnaUVkU1g3NHpMT2JlNkdTWGNodGlj?=
 =?utf-8?B?V2xMVjlzV2dQWElReUxQcTVuS2RQVlc2RFBzbHRBWTlpaUkzMjhvMzVuRnNj?=
 =?utf-8?B?ZG1CSHFEM0d2VkNQWm9pNDZUeDNPdU4wOUthejRBcTc1ZDJ6NGx2K1NVTTN5?=
 =?utf-8?B?NXFOUHV4bEg5TU56aStSbUZTNnNGNUlTVno1ZTdsS2Y0SGoxZ2ZjbTk1bGhS?=
 =?utf-8?B?YkFaL2tWRXJVSlozcEtXbWdub0pmbFhYVWZxRDM5eTlMby8vdU4xYlJxN0dO?=
 =?utf-8?B?MUZEMGNTRjU0ZEl2dEt4ZU14SjZITGxZVWtva1F2RkE3YVQybTE2VENJMXdl?=
 =?utf-8?B?QlpteUNlRDFteUppZDl4MDlnbVBNRUJlaVh6NTgwNll0K1FndmdCWTQwa3Q2?=
 =?utf-8?B?cnFtRitWODEvaTRCQjIxN2pjeWdkdHRSU3dzNjBSZWorbGI2WXFQU204aEtY?=
 =?utf-8?B?aVNKaG5pOEM5SDZmaE9UZ1pVdDlHbkpaekdxM2l5cyt5enpJWCtpZHQxV2ZH?=
 =?utf-8?B?VTlnV25nRDYxaHE1MjQxMGl0TWFkMFRlM2xjeDV4NXRCSCtEaXZ2UlltZENl?=
 =?utf-8?B?RFpOYnlpTVVmckJ4RzJIcjZOT2dzL2hDb3IvV0hoK2lQSVlJK1o3bmRqQVhz?=
 =?utf-8?B?d0d6V0RVd2VQNG4vWTJFTURXNnFlQTVxaTVtLzdORERJalNEanl5ZUZLakxY?=
 =?utf-8?B?VEc3d05WUW9rZkNWamtPZUQxTXBrOVBpMkVGSDloSEtOUzJNTjhqRVkyaklW?=
 =?utf-8?B?YVBUMWFaZ3RHRUhiSXUvT1lXT1lwY3pTN3VJVjZFWVdma2JwZloxeGhTcENo?=
 =?utf-8?B?cWJYYXdPQWV5bERNUktFb0V6bzMvMm1VcGpEVlNPUmpIcTJMM1pOcDU4WkdE?=
 =?utf-8?B?dTQ5cXBkOTRoOFBXem1SVVd0cDZYMVhzR2hMOEJoYTdUYWorNnYxc0NwNHVI?=
 =?utf-8?B?R1I1UUZnaVhpZ1JyaXFia3Q1aWEycXdQY0NBdlZBdTA0N29WME5pc1NEV2JZ?=
 =?utf-8?B?Yjl3dTRyRTRVN09oVXBRZlhnbXEwZ3phWURibElmc2RzWFFUUUUxMlZCemI0?=
 =?utf-8?B?MnJkaWxGY05UQjJ5bGtRVlZRUG5wcllNcC9JczJLQVVNWG9SVVdTMUc3bHBn?=
 =?utf-8?B?ckFpeldxVitsZTJYcEREM0RERXcxUHcxdFVEbFlWZmtIZmVWOHlQSnFCbjhw?=
 =?utf-8?B?bUFwZ1JpL1UrWXFyS0FpQ2pZd2Z0Z2N4eVhNYVlaMkxXVG5zQ0F5eEx5aVBO?=
 =?utf-8?B?TFF0YjBxMGs5TUN3MWNlemg4VjVveE8vOHRiUFEvU3FaM2swUVN0RUUvK290?=
 =?utf-8?B?TUtkOHNlUjg1NUF5WWttM2lSbGF5QWU1aHRpSHUxYVdrSDRJNG5rbVNRcXdO?=
 =?utf-8?B?UlB6ZUZYbnl2d3NFOG85MFRBWm5USG14aFVGb2hNWHpHbkc0ajJXbU1qaGtV?=
 =?utf-8?B?YkdhSktOZ3VCdnFvVko1eDF4eS9ybXBkRmcvRHhZd3pvajFoaEJwazZoNlln?=
 =?utf-8?B?OUFraDV6TzlaYWZhT2c5YXE2K0JBTkpCcE9jUUoxREpIVUZNaUhVN3NSWEcv?=
 =?utf-8?B?b25rZWZ4VElJRkJmNkpPVzczaThFQkl0UU8wWG1RYjNOajUxV0xSVzNGTC9z?=
 =?utf-8?B?ZlBCTW9COEpsSktVZXZwY3VMOFdNRzBoVlNVMjE5OHpQdHplZDBuSjdQWk96?=
 =?utf-8?B?aEJLcGc1Q25UNWRXcDVGenpTV1diT2Zhck5wQUlWYzQzVm5sanAyandGY01j?=
 =?utf-8?B?cFdqaFUxcWdCc1VJb25QcE85RldENndGUi9BWHpSRWVGWUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5330.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YnhIcm9FMm9kVWZhUUthTE9aTWtLYUtuMVlEbEJjU0pXMUc3QngzYWc1NmRC?=
 =?utf-8?B?NDR4U2NKQytxY1ltV01KSEZLMXFQQVFWb3Nyd0dJQXNnVm5ZekZmbTgvNHEw?=
 =?utf-8?B?Y25nSFZSSWdHUGRma21oRTR6L1RpbHRzd1NzUDJ3TXd0Sm9FckdrUGxZdllL?=
 =?utf-8?B?OWZ6NEdVNDBHaXBNejFVQWdDbWpLcmd0N2JiUmh6R3I1RVBsdjlTYmNwQko3?=
 =?utf-8?B?Qld2UnBkb1hOR2w4RlRHampVZDN6ZjFaMlRsVFdjbzA3aGtGTWNSMmxzcXR4?=
 =?utf-8?B?cEYxcDVIYXg1b0hGU1R1S2VlaEdacmw3T1NuSFBhOTBqamlEYms4eVZRSVNP?=
 =?utf-8?B?VWptUVpERjEzd214OHI0dDhrWTBXRDFBa0w1Y3Z6MjVKMW5ibTFmMjg2SW96?=
 =?utf-8?B?Z1FmSlBPRDl4eTBDaHV4cWlEN01IdEV1ZVQwdldpWFluT3JPQ0dQdmZNRUI5?=
 =?utf-8?B?VEdwb21VcDBpVjBxNDh2NVpnUDNPd1JxWStzVVExS1IwUXJuOEtxc3ZOMWV4?=
 =?utf-8?B?K1ZGelNOejJ2ZmRkZUQxTjBNQ2F1d3dKUGs0cnAwQS92YXN6d0plb1F6OFFy?=
 =?utf-8?B?eGNoK2tPT3BEeWxrUHQ1NEtQVDM1K3laUEpzb21ITHYyRjBxNTl2TXhpMWkw?=
 =?utf-8?B?cWp2K2RFYnkzUkwvc3BrZU84R213aUUwWTdlV28vUTU4R0xtc2RZTXdIRWZL?=
 =?utf-8?B?dnRLblY5b3Y2ejVYTVVOalVrYVVtL2RJV3JWcU9NbXcvM3JtUWpwU1p1Y0dG?=
 =?utf-8?B?R0JLQ003STZRemN5UnF4KzhSOG05VUtMZnh5NCtoc2V3a2xUZGx1R3V2MWNh?=
 =?utf-8?B?QTBzelo0dmx4YXRnRm0ycUlpUjBWRHBKQlZQZGZDdDFOSFhpbEFZUDQ4TWtL?=
 =?utf-8?B?MXlEWkFqbkpldHVsN2hWWkRmMXljemUxQzNpK2EyREpQUWo1YUJ4ck5ibDli?=
 =?utf-8?B?bk5sTklrc2Q2OXhWbnpkTVloYnVTUUo0aDRDbjY4c2txVWFRVWVzYkk1dk5p?=
 =?utf-8?B?SnZRc3ZvT0ZOQklaNDFXNjAxbng4OG9jNWl3MkFTQjZOTmczOVlRaXE2eDZ4?=
 =?utf-8?B?bnZmZUMvaTAzaGFrR2wrTG16MW4zZHpkUWFRUC8vSm5QQ2FFdEdnbVpBbU84?=
 =?utf-8?B?NkhEK2RocFNodzhTVWRBdmdkMytVNmF6MmFhUmU0Wk55d2c0RDF6QmIwektW?=
 =?utf-8?B?ZHNEcWpIanh2NjBrMTZ1azc4TFE0YzB1bmVLRWFTOWdLYjhTSkNCRkFueG9x?=
 =?utf-8?B?UExKSzNibkdGUy8vdGFsVGJnajR1b3JNRkZFZVhzZXQ2aVZIK1lGM3VKTVc1?=
 =?utf-8?B?dnZTQzRUM0VqNGhxM3Z1TzAvaGdYcGZEcHNObXl2VlJrZnVDYmFWNEFGUy9F?=
 =?utf-8?B?WXJlVVpPcnRqT3JiUHJoUm52UnhONnVwR3hYSkNFeGp1Si9FZEZhUEZvZXVR?=
 =?utf-8?B?MnVCTUQ5Wkx4SzZBdmVtZGQ1OWgvd0NkblJJc1pTM3RiQ1hqSXZTa1FGTnNI?=
 =?utf-8?B?TU15cHcycDR3SThGWi9ER3duOGowVjNUQ01qN2kvN2FKMmoyT3RJVHBJNHVn?=
 =?utf-8?B?ZGZHaHFQdUVMQnNmck5QaXNKNDZZVjBRckJkUmZaZ2hKQlBpL2ZNT0VtaGFD?=
 =?utf-8?B?MW1waHdVUG9EanVqOWc5QzhQdWszOTJnb3ZkTHg4eU9RWS9rU2U4TW5DQUZS?=
 =?utf-8?B?MjMzNHM4VDhULzNMNUNFYmhQY2IreklZN05XWUx5MGFvUWdaN2dIT05nc25p?=
 =?utf-8?B?ZGlQSXdqTzhnWTNIWVBDUHJLazVTUUU3MXpwOHFhVnBhU0JRTzlMOHdhUWJJ?=
 =?utf-8?B?ZHQxRzdJcmZQUjhnUUpQR1pmNlZOeVdrNlN0SkZEVjM4UjVYeFVwUmYrRW4x?=
 =?utf-8?B?ZHZyR0FJS1hwSmV1aTJKK3lXWDhjOEJrV3lINGpFZFlOY3JNM2VkS1AzZHlV?=
 =?utf-8?B?S2RPdWIzam5KUGkySFNUcHlkM3prTlliVDNjSHpDd1l5WURxekQzc1F4dnN0?=
 =?utf-8?B?WU03eko3OU0vVmI3bzdPUGVNelcxWUZKYS9Yc21wbHUxamxDKzJVTzdCVnNU?=
 =?utf-8?B?RWRTN0RVOExvT1ZGVXN6QVBsOHVaVTRQanZQRy9GWXFKdzlUdGlWby8zVWoy?=
 =?utf-8?B?V1Jma3dzWHBlWXpRQTlYN2dXczZ5WXljWUoxbDczVTJTZWpQYVkvSmdHc3R2?=
 =?utf-8?B?WkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <165248386D8FD64A964B0D559436E8B4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5330.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8acc6b88-f30e-4446-f5c7-08dcd0aae88e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2024 08:39:24.4332
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiCqoza0wPYa9H1WiY9tvj1VBDUFcJVltX1BsBI2NbHlLovLtvcz6hfEREhp46YPZ5BhvcJPCwBaZrVDXgAI1HRRf6PPEGMqRJ1dO5uc/g0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6024
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gU2F0LCAyMDI0LTA5LTA3IGF0IDA5OjAwICswMjAwLCBDaHJpc3RvcGhlIEpBSUxMRVQgd3Jv
dGU6DQo+ICdzdHJ1Y3QgcGVjaV9jb250cm9sbGVyX29wcycgaXMgbm90IG1vZGlmaWVkIGluIHRo
aXMgZHJpdmVyLg0KPiANCj4gQ29uc3RpZnlpbmcgdGhpcyBzdHJ1Y3R1cmUgbW92ZXMgc29tZSBk
YXRhIHRvIGEgcmVhZC1vbmx5IHNlY3Rpb24sIHNvDQo+IGluY3JlYXNlIG92ZXJhbGwgc2VjdXJp
dHksIGVzcGVjaWFsbHkgd2hlbiB0aGUgc3RydWN0dXJlIGhvbGRzIHNvbWUNCj4gZnVuY3Rpb24g
cG9pbnRlcnMuDQo+IA0KPiBPbiBhIHg4Nl82NCwgd2l0aCBhbGxtb2Rjb25maWc6DQo+IEJlZm9y
ZToNCj4gPT09PT09DQo+IMKgwqAgdGV4dAnCoMKgIGRhdGEJwqDCoMKgIGJzcwnCoMKgwqAgZGVj
CcKgwqDCoA0KPiBoZXgJZmlsZW5hbWUNCj4gwqDCoCA4MDAzCcKgwqDCoCA3ODQJwqDCoMKgwqAg
NDgJwqDCoCA4ODM1CcKgwqANCj4gMjI4Mwlkcml2ZXJzL3BlY2kvY29udHJvbGxlci9wZWNpLW5w
Y20ubw0KPiANCj4gQWZ0ZXI6DQo+ID09PT09DQo+IMKgwqAgdGV4dAnCoMKgIGRhdGEJwqDCoMKg
IGJzcwnCoMKgwqAgZGVjCcKgwqDCoA0KPiBoZXgJZmlsZW5hbWUNCj4gwqDCoCA4MDAzCcKgwqDC
oCA3NzYJwqDCoMKgwqAgNDgJwqDCoCA4ODI3CcKgwqANCj4gMjI3Yglkcml2ZXJzL3BlY2kvY29u
dHJvbGxlci9wZWNpLW5wY20ubw0KPiANCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBKQUlM
TEVUIDxjaHJpc3RvcGhlLmphaWxsZXRAd2FuYWRvby5mcj4NCg0KUmV2aWV3ZWQtYnk6IEl3b25h
IFdpbmlhcnNrYSA8aXdvbmEud2luaWFyc2thQGludGVsLmNvbT4NCg0KVGhhbmtzDQotSXdvbmEN
Cg0KPiAtLS0NCj4gQ29tcGlsZSB0ZXN0ZWQgb25seQ0KPiAtLS0NCj4gwqBkcml2ZXJzL3BlY2kv
Y29udHJvbGxlci9wZWNpLW5wY20uYyB8IDIgKy0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BlY2kv
Y29udHJvbGxlci9wZWNpLW5wY20uYw0KPiBiL2RyaXZlcnMvcGVjaS9jb250cm9sbGVyL3BlY2kt
bnBjbS5jDQo+IGluZGV4IGVjNjEzZDM1Yzc5Ni4uZmE5MWJlNThmNmYzIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL3BlY2kvY29udHJvbGxlci9wZWNpLW5wY20uYw0KPiArKysgYi9kcml2ZXJzL3Bl
Y2kvY29udHJvbGxlci9wZWNpLW5wY20uYw0KPiBAQCAtMjI0LDcgKzIyNCw3IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgcmVnbWFwX2NvbmZpZyBucGNtX3BlY2lfcmVnbWFwX2NvbmZpZw0KPiA9IHsN
Cj4gwqAJLmZhc3RfaW8gPSB0cnVlLA0KPiDCoH07DQo+IMKgDQo+IC1zdGF0aWMgc3RydWN0IHBl
Y2lfY29udHJvbGxlcl9vcHMgbnBjbV9vcHMgPSB7DQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHBl
Y2lfY29udHJvbGxlcl9vcHMgbnBjbV9vcHMgPSB7DQo+IMKgCS54ZmVyID0gbnBjbV9wZWNpX3hm
ZXIsDQo+IMKgfTsNCj4gwqANCg0K
