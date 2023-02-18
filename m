Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDDB69BCCA
	for <lists+openbmc@lfdr.de>; Sat, 18 Feb 2023 22:21:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PK1nN6wjBz3chZ
	for <lists+openbmc@lfdr.de>; Sun, 19 Feb 2023 08:20:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i0AYH6Uq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i0AYH6Uq;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PK1mk4VC0z3bnP
	for <openbmc@lists.ozlabs.org>; Sun, 19 Feb 2023 08:20:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676755222; x=1708291222;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=6DTP2FqmRenUAIf3MQMj0XqW9gZESd4PTL2fZXa47U0=;
  b=i0AYH6Uq4kbHEblNZaGelBNh8PyUkSA3zRV6jA0SlAeMTYfdHBT/ZIH4
   u7jdtl+gcTitJ/zbdFwDAq5D4j1bDxyDLrNie6zfWJQpbc6IKx/iprCeo
   MS9RzgpGrUahBBbxYJIts0IQQ1Yby2UVaPPXrlgIEBMj4Q0oZGBzTpZxo
   5Bl3yL6gEPKgGOfjHQa8CI6xMtZ9fNSvTYMQm/AQWZUKNE2uP3o9rKjZw
   WsH42XmS3RMCQbKyV2LoqLkx13lXTgbQxFtACzCs1AWe6Q83cYQBnzaNv
   7gwOgEeb3T18OEVjQ94Nd527LloztOMx4fbenBWjXE0FE+UZKUezQBDRB
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="330871083"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="330871083"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 13:20:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="672968299"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="672968299"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga007.fm.intel.com with ESMTP; 18 Feb 2023 13:20:20 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sat, 18 Feb 2023 13:20:19 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sat, 18 Feb 2023 13:20:19 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Sat, 18 Feb 2023 13:20:19 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Sat, 18 Feb 2023 13:20:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=enD2mwzpMP1skACPT0HjLJ+22Bt7uSPGfMI6AG4c0EzNCtV1Oe0ZD9YDYpJrRCK3r620mcp8SzeV30j28Rb1ImV/c6cQMN2huPdU4UQ7YG19FwK7iBhUQ9x+f6wsKF+Ck9OKGmR4BUzOEyi6BkcV7zPHq7FwdGcq8H0YJOMbSW230cOWxg385NErNM/fgyxNTzIYWmPKZEFJpwI5AZFkvVKLxPLg3G8TeZlH537NSWHW3yUBxHx3nVuu7UMab5C/Uvrj7XsgGWkvsaG7W+dUNXpGXVH42xmhx60V5ych3jPqq/ODR3QKnTWX3hOeDgL749owHcbjWASlhdsG443J6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6DTP2FqmRenUAIf3MQMj0XqW9gZESd4PTL2fZXa47U0=;
 b=kYFoYctdRMfj7l0NGXJYaM4CNmLb3FCrn+owbmT2/m1C487xKSRCH+SSkj5RaPIPjtn21kG6ngQBE1yzyIrMNepuodVhakqeeaY0lpcDHwBtwcWfqA+TOP4fRE9PhfzA5aMw1TAXjgdUn+KmKHc8Wgp1ZOqcmH6l7HHdO5dL7E3jxRclTLTQ2LgnxImYfzBiosmm9mau/yS1mrN8Xv2TyQF1e4IxfQgIYNzq30tmGKk6pNiIRCjmQSmYzKCzAEUvSDVi0RA134UBdoVsOLTxjyeT8NAS6AWtCkxtLGJjROaCfiDgPkkHe3Af7uYOV+2Hf5+sV/YFs4vZOIfX3DIxqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by SJ0PR11MB5215.namprd11.prod.outlook.com (2603:10b6:a03:2d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.18; Sat, 18 Feb
 2023 21:20:15 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::1181:71b3:9254:ea83]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::1181:71b3:9254:ea83%4]) with mapi id 15.20.6111.013; Sat, 18 Feb 2023
 21:20:15 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>, "zev@bewilderbeest.net"
	<zev@bewilderbeest.net>
Subject: Re: [RFC PATCH] hwmon: (peci/cputemp) Number cores as seen by host
 system
Thread-Topic: [RFC PATCH] hwmon: (peci/cputemp) Number cores as seen by host
 system
Thread-Index: AQHZPCQwgLi+c+61a02pEGLsEsI8mq7G5ZSAgABreQCAAANigIAAFuKAgAEcAoCADL32AA==
Date: Sat, 18 Feb 2023 21:20:14 +0000
Message-ID: <2e6e07e5decb9c9f2eef6a49f9e11ba23a15a180.camel@intel.com>
References: <20230209011632.32668-1-zev@bewilderbeest.net>
	 <20230209175001.GA667937@roeck-us.net>
	 <Y+WMcCukyTvPcN2F@hatter.bewilderbeest.net>
	 <97485a97-08c4-917b-1b8d-8102a8575a58@roeck-us.net>
	 <Y+WieWyU+055eEom@hatter.bewilderbeest.net>
	 <20230210184511.GA3670524@roeck-us.net>
In-Reply-To: <20230210184511.GA3670524@roeck-us.net>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.3 (3.46.3-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5823:EE_|SJ0PR11MB5215:EE_
x-ms-office365-filtering-correlation-id: 33ec4164-ed19-4809-b598-08db11f5ed62
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zwNyZqBDaEHUaIUmC+QVh9JjYuBW2EAewsrRO9fpGW4Kw33XqtNvYAXB485TqxowjF6jcLiZSFJ6unmzgMUYbos8lnAC5zgjgrix6p2npYzHaxvPrsv7h7VbcoS4o6u96JWdnPWHRG7UMbfdvA1CtTSWW3Owv/9chya1GILewnQu9rNcVNhacvwWW631Z+uC8JleC2t4XBHYthA/l5IoY3fLGcmHZjcVhK5HmJalGhHuigAIQZ30uOHo611aOOZmuAM9sYlRE1MQz/1zwqAt+gDkhVdy6A3CHm0SmkC5pzxhSITLuFQVcYrUpePeob/Z9xZtBJMl+xgf/uS2uniOlNA8NqcrrDJrSKOJjlMiWTKav2lwmAUTxrfyjGtGNcjyVllupo1ozXZt0RgV1/BWFjoMYsZHHoQc41UL1nAOTaBsu+XZ9M/S6pvWC5ArJx820IpIt7umVgR1z220j8xSxLc0AySgAW9tTaIx68WVNETqzpz0Hup4i4Dqo+RVIRTE9/o019QNxWnwKDxCL+EX+aB+7BrDRafGUzbjWVzWit5PzrJo9hHtXJT5A0RKVNh9s9drWhKCWeTpd9btKuZW9W+qRtMP/PpgbbFSYPiF0siMIUBwi9M/m6UDlek0vGIeqCV/BFopD1Vf9TrM68xJGTiQISu3kogInK8VxV5uQzbu6SYuXe9GwBYyhXPo9PeO4P4XsZtBalOMujXn3Fyp8w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5823.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39860400002)(366004)(136003)(376002)(346002)(451199018)(83380400001)(2906002)(6486002)(26005)(186003)(6506007)(71200400001)(6512007)(82960400001)(86362001)(122000001)(2616005)(38100700002)(38070700005)(5660300002)(7416002)(66446008)(8936002)(478600001)(41300700001)(8676002)(66476007)(64756008)(4326008)(76116006)(53546011)(66946007)(110136005)(66556008)(91956017)(36756003)(54906003)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UllZS2hOdkxtMldaNk9ML2hXcEd1WTNJTkNnZW00WHpYMXo5Y1BOWG5IaW15?=
 =?utf-8?B?Nnp1Q0pPTlJLUHR3c01HWmZHLzlqd1lhWi9WaURUSUxuMUZmWE5Bb0lhUnBq?=
 =?utf-8?B?eCtNQndNTG5CSXludUhLTEtib0JNT1p1QW9RVXYybzh6UlN5OGM3S3U4ek54?=
 =?utf-8?B?R3RJaUdBRUN1RFpDWWNENW9qSk5pSGZSeFFqVXk0MW5nLzhWRlNaMkRZR0FN?=
 =?utf-8?B?NkJ6S2haZ2JhWXR2eWRrQld0MFU2YU1YUS85enBrSWRxNGVQOU9NZ1dPbGZI?=
 =?utf-8?B?Y3haWHBiOGJpZWthZGJ2bDlLUENUalEwa1NnWElFbDIweS9hTXJNTEFHa2Np?=
 =?utf-8?B?ZzhlNURtbmpUZUxLSkd5Wld1ODk4Um1mdTJISEJDZVBxUll6eTlQZlE2ckd0?=
 =?utf-8?B?VkN5Nk4xMWlHK0FTVGo5aVRTMHNYeXZ6dXJSejVOZnFHQVplTkNNaFRBZkxz?=
 =?utf-8?B?TjJGNXJwWGhySnNYOUJXVEZGVFhEZWJ0NFpZTDJaYlMrQ0lOQXFVamJXalh3?=
 =?utf-8?B?ZTRxTTI5OS9kV0dtR0EvY2dJekxLZTlTS2ZmOUhoYXYvNGdSM0dGVC9NRG9U?=
 =?utf-8?B?Zk94a3RLMFRHSXFYYTMvanVUTTRiY3hFSXpUUXJ4MVNOZVltdXhWampZbXFE?=
 =?utf-8?B?RFNzOW1mVHVRYitIVzh0NmJHSnpGWkh6K1dPZEJwdE1hemcxWmdxZ0NldFg5?=
 =?utf-8?B?MkN3WlkxN2ZPbDVLdDl2NmlnVkZISFJHbFYrMGllR0lDUm9obWFRUG82Ny9O?=
 =?utf-8?B?ZWF5VUVMU2JCVzRiT0xIOGp1UE9VZmJDU1JMODMveFU4Snh2cHoyQ2c0by9y?=
 =?utf-8?B?VmluTG0rZHJJMmFXSG1qUnFSOG9WRndMWW5DVzd4amtpK29makV1Mnl3cmla?=
 =?utf-8?B?dVd4Mmt4UzFOTlF0cnFJR2tlWldUbmRmT2pueDNKdkZ0NGtDUTlIbWFkaXJD?=
 =?utf-8?B?TzhxWnRaRkVTbTBCckxkZGtMTURNZ1dOV3hrOTlxZkg4Snp2dlpJSEhEajVM?=
 =?utf-8?B?YmVBK2poVXNxcnRRMk5yRTIrL0NYbmt5RzBuVng5NVNaMHd4aEpWUTBhT3Zy?=
 =?utf-8?B?YllsMkNnMU9HWWp4d0UwbDZrYTVNOEZPVkdxT0JvK0dINldGSDdWdWVVZ2p1?=
 =?utf-8?B?eUFWNENKRTZSSFN2NzZuRDZmaTNaUGowTjBWMVMrc0UwUDJqTFhVeVZvckRM?=
 =?utf-8?B?eldLRURqMzJIdVZFUjU0TXJpdVNUYVZYOGhiejJocnVBc25ONERCa2RSODgv?=
 =?utf-8?B?WEtSMlRRdGtSVkNXUVhtbUJ4dk1lZkVaeTliejF4b0RQMnZKZGlGK3doWHJY?=
 =?utf-8?B?enA2WEVaMzlPcXB5YWJMVkgwTjJCY3hQTTZ3WTloVzcxRGFiWmVrbWNlQkxT?=
 =?utf-8?B?b3hGbmtCbFpCaXdlQXMyKzQ0Nm5naTA1VVJuVzVTRXptRjdMdzdPeWI1UmhI?=
 =?utf-8?B?cEs5TURMSWpxaU0rdUxZbkNLa3Byb3ZkU2dsRnBQMWhIdjZNQ0p6YTlYcGd5?=
 =?utf-8?B?R3dzeU04UE9VZkVNcnB4L3JWWDROdlpqaHYxYmNMd0E5MWJTbmwyek9xUTly?=
 =?utf-8?B?bWlZQTlXak5RYkt3bDlweW9kRzVXRWNYbi9BRVRmeTcvL213eXZ6MzhSRjBl?=
 =?utf-8?B?NDc1cCsyQzJjelMvUjZGb0k1WlZ5SVo5aTRvVEpuY2pNbE9YMktCajJRcFdh?=
 =?utf-8?B?N2lJamJxLzBsM1hSdHNxVUZSR1BDZk0yajQvS2ZTLzNYZ3RJVDlyNVlLekhH?=
 =?utf-8?B?RTdSR3NsQkM0cTlRZlpFbXRDT2Z0dlFrWDJPeWNtYWFwcGtwVk94U3hoZEdU?=
 =?utf-8?B?WXFzZXVxSjZqR05HNjE2RHh5TGpJdjBhbmthcFhxZjBFL3lCeUwrQWhlektT?=
 =?utf-8?B?TEJyQU44aEFJREh5Z2FPU1p6bzFpaHljU0wrTWF4cmRWOE1uWnBpdytZY1ZJ?=
 =?utf-8?B?cXV1bFRqWFVBTlUvWFlCWnRETmMvSFBFVTA4WkE4ZHZzcVJBdEszSEJiRndY?=
 =?utf-8?B?ZHFiM3E1REFTR1ZIcktpOW9BV1VPLzNVVDRZOUFzM2xHWkN5NjFHS1ZHTXZh?=
 =?utf-8?B?OEdOby8rdVdpMUNiUzVQMGlJMXArUVZzUnByTFkwS1dIcGVaZmFmeFdwYkxY?=
 =?utf-8?B?d3N0ZVhZVHhVY1VHWk1idmQwKzNtckJPK2pROGtRYW0vbGdEZEpqTjRnNlhM?=
 =?utf-8?B?L1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B80242BE5DFD4F41AC0A0CE7BF9BA006@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ec4164-ed19-4809-b598-08db11f5ed62
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2023 21:20:15.0229
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2iG3clmEuGs0D3cmMjvd7cQJPAXcJebbeuwF/s4tYQhXmYtSxYOdSQFxabHt/RFNUhcnGmNFJyCwYSA1obruEiEdTxBdNR0RtyyHA4YneAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5215
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>, "jdelvare@suse.com" <jdelvare@suse.com>, "andrew@aj.id.au" <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>, "joel@jms.id.au" <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gRnJpLCAyMDIzLTAyLTEwIGF0IDEwOjQ1IC0wODAwLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0K
PiBPbiBUaHUsIEZlYiAwOSwgMjAyMyBhdCAwNTo0ODo0MVBNIC0wODAwLCBaZXYgV2Vpc3Mgd3Jv
dGU6DQo+ID4gT24gVGh1LCBGZWIgMDksIDIwMjMgYXQgMDQ6MjY6NDdQTSBQU1QsIEd1ZW50ZXIg
Um9lY2sgd3JvdGU6DQo+ID4gPiBPbiAyLzkvMjMgMTY6MTQsIFpldiBXZWlzcyB3cm90ZToNCj4g
PiA+ID4gT24gVGh1LCBGZWIgMDksIDIwMjMgYXQgMDk6NTA6MDFBTSBQU1QsIEd1ZW50ZXIgUm9l
Y2sgd3JvdGU6DQo+ID4gPiA+ID4gT24gV2VkLCBGZWIgMDgsIDIwMjMgYXQgMDU6MTY6MzJQTSAt
MDgwMCwgWmV2IFdlaXNzIHdyb3RlOg0KPiA+ID4gPiA+ID4gV2hpbGUgcG9ydGluZyBPcGVuQk1D
IHRvIGEgbmV3IHBsYXRmb3JtIHdpdGggYSBYZW9uIEdvbGQgNjMxNFUgQ1BVDQo+ID4gPiA+ID4g
PiAoSWNlIExha2UsIDMyIGNvcmVzKSwgSSBkaXNjb3ZlcmVkIHRoYXQgdGhlIGNvcmUgbnVtYmVy
aW5nIHVzZWQgYnkNCj4gPiA+ID4gPiA+IHRoZQ0KPiA+ID4gPiA+ID4gUEVDSSBpbnRlcmZhY2Ug
YXBwZWFycyB0byBjb3JyZXNwb25kIHRvIHRoZSBjb3JlcyB0aGF0IGFyZSBwcmVzZW50DQo+ID4g
PiA+ID4gPiBpbg0KPiA+ID4gPiA+ID4gdGhlIHBoeXNpY2FsIHNpbGljb24sIHJhdGhlciB0aGFu
IHRob3NlIHRoYXQgYXJlIGFjdHVhbGx5IGVuYWJsZWQNCj4gPiA+ID4gPiA+IGFuZA0KPiA+ID4g
PiA+ID4gdXNhYmxlIGJ5IHRoZSBob3N0IE9TIChpLmUuIGl0IGluY2x1ZGVzIGNvcmVzIHRoYXQg
dGhlIGNoaXAgd2FzDQo+ID4gPiA+ID4gPiBtYW51ZmFjdHVyZWQgd2l0aCBidXQgbGF0ZXIgaGFk
IGZ1c2VkIG9mZikuDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IFRodXMgZmFyIHRoZSBjcHV0
ZW1wIGRyaXZlciBoYXMgdHJhbnNwYXJlbnRseSBleHBvc2VkIHRoYXQgbnVtYmVyaW5nDQo+ID4g
PiA+ID4gPiB0byB1c2Vyc3BhY2UgaW4gaXRzICd0ZW1wWF9sYWJlbCcgc3lzZnMgZmlsZXMsIG1h
a2luZyB0aGUgY29yZQ0KPiA+ID4gPiA+ID4gbnVtYmVycw0KPiA+ID4gPiA+ID4gaXQgcmVwb3J0
ZWQgbm90IGFsaWduIHdpdGggdGhlIGNvcmUgbnVtYmVyaW5nIHVzZWQgYnkgdGhlIGhvc3QNCj4g
PiA+ID4gPiA+IHN5c3RlbSwNCj4gPiA+ID4gPiA+IHdoaWNoIHNlZW1zIGxpa2UgYW4gdW5mb3J0
dW5hdGUgc291cmNlIG9mIGNvbmZ1c2lvbi4NCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gV2Ug
Y2FuIGluc3RlYWQgdXNlIGEgc2VwYXJhdGUgY291bnRlciB0byBsYWJlbCB0aGUgY29yZXMgaW4g
YQ0KPiA+ID4gPiA+ID4gY29udGlndW91cyBmYXNoaW9uICgwIHRocm91Z2ggbnVtY29yZXMtMSkg
c28gdGhhdCB0aGUgY29yZSBudW1iZXJpbmcNCj4gPiA+ID4gPiA+IHJlcG9ydGVkIGJ5IHRoZSBQ
RUNJIGNwdXRlbXAgZHJpdmVyIG1hdGNoZXMgdGhlIG51bWJlcmluZyBzZWVuIGJ5DQo+ID4gPiA+
ID4gPiB0aGUNCj4gPiA+ID4gPiA+IGhvc3QuDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiANCj4g
PiA+ID4gPiBJIGRvbid0IHJlYWxseSBoYXZlIGFuIG9waW5pb24gaWYgdGhpcyBjaGFuZ2UgaXMg
ZGVzaXJhYmxlIG9yIG5vdC4NCj4gPiA+ID4gPiBJIHN1c3BlY3Qgb25lIGNvdWxkIGFyZ3VlIGVp
dGhlciB3YXkuIEknbCBkZWZpbml0ZWx5IHdhbnQgdG8gc2VlDQo+ID4gPiA+ID4gZmVlZGJhY2sg
ZnJvbSBvdGhlcnMuIEFueSBjb21tZW50cyBvciB0aG91Z2h0cywgYW55b25lID8NCj4gPiA+ID4g
PiANCj4gPiA+ID4gDQo+ID4gPiA+IEFncmVlZCwgSSdkIGRlZmluaXRlbHkgbGlrZSB0byBnZXQg
c29tZSBpbnB1dCBmcm9tIEludGVsIGZvbGtzIG9uIHRoaXMuDQo+ID4gPiA+IA0KPiA+ID4gPiBU
aG91Z2ggc2luY2UgSSByZWFsaXplIG15IGluaXRpYWwgZW1haWwgZGlkbid0IHF1aXRlIGV4cGxh
aW4gdGhpcw0KPiA+ID4gPiBleHBsaWNpdGx5LCBJIHNob3VsZCBwcm9iYWJseSBjbGFyaWZ5IHdp
dGggYW4gZXhhbXBsZSBob3cgd2VpcmQgdGhlDQo+ID4gPiA+IG51bWJlcmluZyBjYW4gZ2V0IHdp
dGggdGhlIGV4aXN0aW5nIGNvZGUgLS0gb24gdGhlIDMyLWNvcmUgQ1BVIEknbQ0KPiA+ID4gPiB3
b3JraW5nIHdpdGggYXQgdGhlIG1vbWVudCwgdGhlIHRlbXBYX2xhYmVsIGZpbGVzIHByb2R1Y2Ug
dGhlIGZvbGxvd2luZw0KPiA+ID4gPiBjb3JlIG51bWJlcnM6DQo+ID4gPiA+IA0KPiA+ID4gPiDC
oMKgwqAgQ29yZSAwDQo+ID4gPiA+IMKgwqDCoCBDb3JlIDENCj4gPiA+ID4gwqDCoMKgIENvcmUg
Mg0KPiA+ID4gPiDCoMKgwqAgQ29yZSAzDQo+ID4gPiA+IMKgwqDCoCBDb3JlIDQNCj4gPiA+ID4g
wqDCoMKgIENvcmUgNQ0KPiA+ID4gPiDCoMKgwqAgQ29yZSA2DQo+ID4gPiA+IMKgwqDCoCBDb3Jl
IDcNCj4gPiA+ID4gwqDCoMKgIENvcmUgOA0KPiA+ID4gPiDCoMKgwqAgQ29yZSA5DQo+ID4gPiA+
IMKgwqDCoCBDb3JlIDExDQo+ID4gPiA+IMKgwqDCoCBDb3JlIDEyDQo+ID4gPiA+IMKgwqDCoCBD
b3JlIDEzDQo+ID4gPiA+IMKgwqDCoCBDb3JlIDE0DQo+ID4gPiA+IMKgwqDCoCBDb3JlIDE1DQo+
ID4gPiA+IMKgwqDCoCBDb3JlIDE4DQo+ID4gPiA+IMKgwqDCoCBDb3JlIDIwDQo+ID4gPiA+IMKg
wqDCoCBDb3JlIDIyDQo+ID4gPiA+IMKgwqDCoCBDb3JlIDIzDQo+ID4gPiA+IMKgwqDCoCBDb3Jl
IDI0DQo+ID4gPiA+IMKgwqDCoCBDb3JlIDI2DQo+ID4gPiA+IMKgwqDCoCBDb3JlIDI3DQo+ID4g
PiA+IMKgwqDCoCBDb3JlIDI4DQo+ID4gPiA+IMKgwqDCoCBDb3JlIDI5DQo+ID4gPiA+IMKgwqDC
oCBDb3JlIDMwDQo+ID4gPiA+IMKgwqDCoCBDb3JlIDMxDQo+ID4gPiA+IMKgwqDCoCBDb3JlIDMz
DQo+ID4gPiA+IMKgwqDCoCBDb3JlIDM0DQo+ID4gPiA+IMKgwqDCoCBDb3JlIDM1DQo+ID4gPiA+
IMKgwqDCoCBDb3JlIDM2DQo+ID4gPiA+IMKgwqDCoCBDb3JlIDM4DQo+ID4gPiA+IMKgwqDCoCBD
b3JlIDM5DQo+ID4gPiA+IA0KPiA+ID4gPiBpLmUuIGl0J3Mgbm90IGp1c3QgYSBkaWZmZXJlbnQg
cGVybXV0YXRpb24gb2YgdGhlIGV4cGVjdGVkIGNvcmUgbnVtYmVycywNCj4gPiA+ID4gd2UgZW5k
IHVwIHdpdGggZ2FwcyAoZS5nLiB0aGUgbm9uZXhpc3RlbmNlIG9mIGNvcmUgMTApLCBhbmQgY29y
ZSBudW1iZXJzDQo+ID4gPiA+IHdlbGwgaW4gZXhjZXNzIG9mIHRoZSBudW1iZXIgb2YgY29yZXMg
dGhlIHByb2Nlc3NvciByZWFsbHkgImhhcyIgKGUuZy4NCj4gPiA+ID4gbnVtYmVyIDM5KSAtLSBh
bGwgb2Ygd2hpY2ggc2VlbXMgbGlrZSBhIHJhdGhlciBjb25mdXNpbmcgdGhpbmcgdG8gc2VlIGlu
DQo+ID4gPiA+IHlvdXIgQk1DJ3Mgc2Vuc29yIHJlYWRpbmdzLg0KPiA+ID4gPiANCj4gPiA+IA0K
PiA+ID4gU3VyZSwgYnV0IHdoYXQgZG8geW91IHNlZSB3aXRoIC9wcm9jL2NwdWluZm8gYW5kIHdp
dGggY29yZXRlbXANCj4gPiA+IG9uIHRoZSBob3N0ID8gSXQgbWlnaHQgYmUgZXZlbiBtb3JlIGNv
bmZ1c2luZyBpZiB0aGUgY29yZSBudW1iZXJzDQo+ID4gPiByZXBvcnRlZCBieSB0aGUgcGVjaSBk
cml2ZXIgZG9uJ3QgbWF0Y2ggdGhlIGNvcmUgbnVtYmVycyBwcm92aWRlZA0KPiA+ID4gYnkgb3Ro
ZXIgdG9vbHMuDQo+ID4gPiANCj4gPiANCj4gPiBUaGUgaG9zdCBzZWVzIHRoZW0gbnVtYmVyZWQg
YXMgdGhlIHVzdWFsIDAtMzEgeW91J2QgZ2VuZXJhbGx5IGV4cGVjdCwgYW5kDQo+ID4gYXNzaWdu
ZWQgdG8gdGhvc2UgY29yZXMgaW4gdGhlIHNhbWUgaW5jcmVhc2luZyBvcmRlciAtLSBoZW5jZSB0
aGUgcGF0Y2gNCj4gPiBicmluZ2luZyB0aGUgdHdvIGludG8gYWxpZ25tZW50IHdpdGggZWFjaCBv
dGhlci7CoCBDdXJyZW50bHkgb25seSBjb3JlcyAwDQo+ID4gdGhyb3VnaCA5IG1hdGNoIHVwIGJl
dHdlZW4gdGhlIHR3bywgYW5kIHRoZSByZXN0IGFyZSBvZmYgYnkgc29tZXdoZXJlDQo+ID4gYmV0
d2VlbiBvbmUgYW5kIGVpZ2h0Lg0KPiA+IA0KPiANCj4gSG1tLCBpbnRlcmVzdGluZy4gSXQgaXMg
bm90IHNlcXVlbnRpYWwgb24gbXkgbGFyZ2Ugc3lzdGVtIChJbnRlbChSKSBYZW9uKFIpDQo+IEdv
bGQgNjE1NCkuIEkgYWxzbyBrbm93IGZvciBzdXJlIHRoYXQgY29yZSBJRHMgb24gSW50ZWwgc2Vy
dmVyIENQVXMgYXJlDQo+IHR5cGljYWxseSBub3Qgc2VxdWVudGlhbC4gVGhlIHByb2Nlc3NvciBu
dW1iZXIgaXMgc2VxdWVudGlhbCwgYnV0IHRoZSBjb3JlDQo+IElEIGlzbid0LiBPbiBteSBzeXN0
ZW0sIHRoZSBvdXRwdXQgZnJvbSB0aGUgInNlbnNvcnMiIGNvbW1hbmQgKHRoYXQgaXMsDQo+IGZy
b20gdGhlIGNvcmV0ZW1wIGRyaXZlcikgbWF0Y2hlcyB0aGUgbm9uLXNlcXVlbnRpYWwgY29yZSBJ
RHMgZnJvbQ0KPiAvcHJvYy9jcHVpbmZvLCB3aGljaCBpcyBleGFjdGx5IGhvdyBJIHdvdWxkIGV4
cGVjdCBpdCB0byBiZS4NCj4gDQo+IEd1ZW50ZXINCg0KT24gTGludXgsIGZyb20gaG9zdCBzaWRl
LCBjb3JlIElEIGlzIG9idGFpbmVkIGZyb20gRURYIG9mIENQVUlEKEVBWD0weGIpLg0KVW5mb3J0
dW5hdGVseSwgdGhlIHZhbHVlIGV4cG9zZWQgdG8gdGhlIGhvc3QgKGFuZCB3aGV0aGVyIGl0J3Mg
aW4gc2VxdWVudGlhbCBvcg0Kbm9uLXNlcXVlbnRpYWwgZm9ybSkgY2FuIHZhcnkgZnJvbSBwbGF0
Zm9ybSB0byBwbGF0Zm9ybSAod2hpY2ggQlRXIGlzIHdoeSBvbg0KTGludXgsIGNvcmUgSUQgc2hv
dWxkbid0IHJlYWxseSBiZSB1c2VkIGZvciBhbnkgbG9naWMgcmVsYXRlZCB0byB0YXNrIHBsYWNl
bWVudA0KLSB0b3BvbG9neSBpbmZvIHNob3VsZCBiZSB1c2VkIGluc3RlYWQpLg0KRnJvbSBCTUMg
cGVyc3BlY3RpdmUgLSB3ZSdsbCBhbHdheXMgZ2V0IHRoZSBub24tc2VxdWVudGlhbCBmb3JtLg0K
DQpJZiB3ZSBqdXN0IGFwcGx5IHRoZSBwYXRjaCBwcm9wb3NlZCBieSBaZXYsIHdlJ2xsIGVuZCB1
cCBiZWluZyBjb25zaXN0ZW50IG9uIG9uZQ0Kc2V0IG9mIHBsYXRmb3JtcyBhbmQgaW5jb25zaXN0
ZW50IG9uIG90aGVyIHNldCBvZiBwbGF0Zm9ybXMuDQpJZiB3ZSB3YW50IHRvIG1ha2UgdGhpbmdz
IGNvbnNpc3RlbnQsIHdlIG5lZWQgYSBkaWZmZXJlbnQgYXBwcm9hY2ggLSBlaXRoZXIgYnkNCm9i
dGFpbmluZyBhZGRpdGlvbmFsIGluZm9ybWF0aW9uIG92ZXIgUEVDSSBvciBieSBsaW1pdGluZyB0
aGUgc2NvcGUgb2YgdGhlDQpwcm9wb3NlZCBjaGFuZ2UgdG8gc3BlY2lmaWMgcGxhdGZvcm1zLg0K
DQpUaGFua3MNCi1Jd29uYQ0KDQo=
