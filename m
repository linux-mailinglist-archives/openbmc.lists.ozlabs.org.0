Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0832148DF5F
	for <lists+openbmc@lfdr.de>; Thu, 13 Jan 2022 22:04:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZcPv5x3vz2yLT
	for <lists+openbmc@lfdr.de>; Fri, 14 Jan 2022 08:04:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T24sc0Cv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=T24sc0Cv; dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZcNx4cLjz2yZ6;
 Fri, 14 Jan 2022 08:04:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642107842; x=1673643842;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=cJIBkVtbinRfc5500gHdP0GjpmbzZqLl77u5h2Vl8ik=;
 b=T24sc0Cvz2f/WDcp+6tErg4cxm9ZG8RtbSqSRFo7ZxraTTDo6yBlwXYg
 qkraxG5XCPxwN/gxwlR0ALD1BrfXJcBLtIcC64kCz+j3AnGEvL0/3MKz6
 afQxtnD9ea1Wq4+Hv2D9CM5tKoABLIc+9DOzBE/ifaSzKLepAPXDRDTlB
 pdKWglKkhEHI2s71EkM+DBr/ZPkRH0fL3YMxyHmI7Y9+L+qGIpq/q0VJx
 ILa/JueIqVLFL3/H/up72yw9G4ZSLepNzah4st++98l0IH5VoMpomHcn/
 C4uocD1MD0T4sY4TKc9Es3eNDP1Vulv8I4XF+2cosVcsdClIbTILCWrG9 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="330460700"
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="330460700"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 13:02:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="529837796"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 13 Jan 2022 13:02:57 -0800
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 13 Jan 2022 13:02:59 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 13 Jan 2022 13:02:57 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 13 Jan 2022 13:02:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZ9PBUTUePKEox45niZRyy2bvz4E/qCagl4qA714bQp7NCkeq3HiNeZd8PR528Cs5JTr/AJx7nz0N8gHU++H7NYCkmjAu+br8I0JRgQhALkAhDT9RYo/kxZi5EeY9c40g1dKn5G8ywmZ+8tsvFMus9kNrKMJwur/Fgdi2juDz1GIPBgtzksobRDKqsWWk6X2M1WZU1lbaq9OsnbNyc1M3y1XrNoHUypcEDnVDk1XRXrBFw9SMzSY5c/DZ2BaThzWyVX59Zx8R5zbM5kuaQjM+GIv0iBDOEuIPZlzxpQY05JA626zSeIGY/nb3Ibo1sUcAgTFHs1zfen3WdMxyolUnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJIBkVtbinRfc5500gHdP0GjpmbzZqLl77u5h2Vl8ik=;
 b=BU2/GO2dlEoBDLvFQnWNmbARf0+Bk/qUObesHfWYetu1dms3loqLnok9WmkIPW1IRl6nLveCfjJIYIlqJlKyrUfjTcF+dJjSOwXXuvMnps9ArmeuAgZ9Ju/xE2r7DvrECxIlgg7I8islwquKBfdkORIu6Wod4Hs1/tDn8HblzxtgLAOFBv+ehikyF/qDsfKGT5feyBSNZYtXAUMEDRa3wGpXZ7kpMTkIPqzqKgOQkNCkqvMKeeKs0MUMFJcB/r8K0qZMuUT1t4Afr7pHiC0j60bMnQgYy2FonzzCGGBk4Y6j+TdhOc5qh8PWIMkdwZc42HijPmQXD3XvCJke13fiFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by MWHPR11MB1517.namprd11.prod.outlook.com (2603:10b6:301:e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Thu, 13 Jan
 2022 21:02:54 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::1d1b:2541:5263:68de]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::1d1b:2541:5263:68de%4]) with mapi id 15.20.4888.011; Thu, 13 Jan 2022
 21:02:54 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "joel@jms.id.au" <joel@jms.id.au>
Subject: Re: [PATCH v5 05/13] peci: Add peci-aspeed controller driver
Thread-Topic: [PATCH v5 05/13] peci: Add peci-aspeed controller driver
Thread-Index: AQHYCAj/44Y4paXx2k6ug08mlsae3KxgV20AgAEaXAA=
Date: Thu, 13 Jan 2022 21:02:54 +0000
Message-ID: <f2a7582d6ea4bd7fc04f3a31c98fdd8b80e46296.camel@intel.com>
References: <20220112230247.982212-1-iwona.winiarska@intel.com>
 <20220112230247.982212-6-iwona.winiarska@intel.com>
 <CACPK8XewQJBvwssM6zQKQoxT=JLpk-qjGhsiTAa980OtbU7JBw@mail.gmail.com>
In-Reply-To: <CACPK8XewQJBvwssM6zQKQoxT=JLpk-qjGhsiTAa980OtbU7JBw@mail.gmail.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-2.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 24127403-47c4-4f1e-0379-08d9d6d81173
x-ms-traffictypediagnostic: MWHPR11MB1517:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr,ExtFwd
x-microsoft-antispam-prvs: <MWHPR11MB1517D322728C986B695C5399EC539@MWHPR11MB1517.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VD14GeKnOyW8hh28cDyvsZAX82lEnRWC9Wxa58hFUjdmw6cTA3jsBcaEG469kaJSPBuApTVsLEVf7VnSMBd8JZMmIAf6RL8SLbRsmf+u6bGJRMs0TYITOBBflIMKIVaHvQyjA181MzJyUd2wXUWkQLPAtDu6ag3ig08yOZdxKOI9wAXQ2m1z2CVH8TCXFoEJCcb1WBT7VzxoTPnFPGBzfdNXWOLUUNaK0x6gxMwTj703GCDe+llJy0F5aMVGAD6qIduebxzsQ10FVk9c18E+ivwEX0gza3uh7CnX3lhcMxgvyiNTj6plX+D+/vFv4ys15e9v4CdInBkByPaapjUaskMEpBGNngzVBfAMS9hnIwO5pK0iiOymQq7PX2SiFr53BCzygiQ/V1Sp5xQI+N1prz0N0gmUR3oLR0vfaEgUKvB+shZrUFRKVQGwFAHJORTOjjWsGNlHmuI1X492KCz9mis2psTI4RLo7IBUDm6AXah37/ypYvvD0PzRhe6fA8cFnluwzqPXsgFzG+0r9C6yvhpM4afnX7LfVnKS0Wi2gzY9cRPfQ9v9vgUdTb7WFoxeAB76ZmcsvTx8QO8kUufULaS9wlStabZRfbIpMZB0Fnp+0P8cl5LhzT3L9Cm6g5HyJTQBCS6uYOvRqPPoxnrDnkLRxKySwCghBvglZ+SzmqMxj2NLDWATqy9SpQKHxYrhOBduK/4++dbJPq7NT5/VDQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5823.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(508600001)(186003)(7416002)(4326008)(2616005)(83380400001)(6486002)(19627235002)(316002)(36756003)(26005)(6916009)(82960400001)(66946007)(54906003)(66446008)(66556008)(86362001)(6506007)(91956017)(8676002)(64756008)(38100700002)(6512007)(2906002)(76116006)(5660300002)(8936002)(38070700005)(66476007)(122000001)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?REk1aVkyV3pReklrckhsL1JKeDhIM1dsTWU3S1Vrd1VxOG5YRGIrU2lCVEZp?=
 =?utf-8?B?dFY2Z1g2TnFzdVYzMHJobDZVZTlEUGlRcjJFYWNLb2lLc2kvWGd1ZW5iZURS?=
 =?utf-8?B?dXhzR0dJN2w1U29LUTIrWGNlUFJqRFJOVEV4VlFjV1h5YVIxa2huSmpLSGFU?=
 =?utf-8?B?bWw3S0t0ZmtadWdrcEFGV3RTaW56bU5vYkhXbU5BU1dEdUw5aUFSN1pLaHFJ?=
 =?utf-8?B?cFFxUm9iWFlIRHgzUUk3OFV5MHJiaG4ydVh2ZEVlNkNCZUYxZVQ5ZUF0Wkh1?=
 =?utf-8?B?T0NrYjFVRG1yMVdKeGp6UHZueDBoc1p6RU9OVjRqMmhFcmlMUU1nbHgwc1FU?=
 =?utf-8?B?RlR5SFV5bTQxMEVFekxMMTU3SDlnZnh5ak80RVJyUW9sTms5aDdxOG5PQ0V0?=
 =?utf-8?B?aXc3VUp5aU5weEdNdEU3bU5UUDgrZlltNXFSVlNnN0t6ZXRmNWhQbEZCREdG?=
 =?utf-8?B?SlF6Sld3UU9ZOTZDckMrYWwrbjZuczk0dHJuMTV2dEdOZzVRMXpOVVlwL1ZO?=
 =?utf-8?B?b0xGZi9QZnlhdjRDaGpNbUVrQkRmOGF4MGtRNEdNcThYNjlRQ2oxTkdxaW5y?=
 =?utf-8?B?azJLYjJ6ZVA3NzAzMFpQdUo1UzVESXBDZGVlL0JhU1huUFFzazdDelpQdnBE?=
 =?utf-8?B?dldOcVd1MnZIVG9uN0VKN3laTWgyd0UyTTIybHMzbVBvTG5KamluYVNnL0VB?=
 =?utf-8?B?SHV4VjdocU9qVWVaS3FVN05xa1Vrc1p6cGs0VlN1aDN6bnlMWXVQWkdMLzRE?=
 =?utf-8?B?MEcrTGE0aXJWSTg1Z252NjB0UVdObGZUVVIxaFpwaWJ0dTZnWUliRm9nV1E5?=
 =?utf-8?B?ZlpBOGNjaDAvVjJBcngzMkxveng1OTNocWdlMFlDajl5QmhTQnVLSjBObXZG?=
 =?utf-8?B?TkkyMkpBSGM0VmVMeTRlbVZkNTFzNEVBb0dKMjhzSzFaNGZTVXlmajNPaGd1?=
 =?utf-8?B?TEFMUGFmTE5MU2tPU1FxM3o3Q1ZuVUhOZkhOR05HNU9IaXBpcVRwOEVjQ252?=
 =?utf-8?B?YnUyOG9wSDJLOWxHUmVKU0RtT3c5Y29QSW5yOTUzZWNiNjBMaXVlYXZsNG5m?=
 =?utf-8?B?WUJLYW5aaGkrZEUwbFdLS2dSVjEyYlU3a2dZT0V5Rmh4a0FlcnlQdjhhSjNP?=
 =?utf-8?B?d29TcmtvL1hDWWVsTm9wVDVUMnNrVkowOVlEdHROSlVSV3VxWmc4OTZRcU9U?=
 =?utf-8?B?Q3hJMGh3NGVPVkZTdmxDN0pXRmFXVHdTM1NUR2dzdk0xSEkrZ2FrcERHUVV4?=
 =?utf-8?B?Ly94M3UrV3VKLzRxTFd4enBSbWMyMFRrL1dBREQ2VlBzTkJsMjBzVzhibERW?=
 =?utf-8?B?bnl6L24zNXVwVjdoR2U5NWkveXM0c2FEdkE1SHdtd0ZUNytXMU5ROUFiMUsr?=
 =?utf-8?B?VGsyck84S1lpMG9aczlmTzFna3hSVndnUVlTU2w1L0FyblF2SENqek9PRGo0?=
 =?utf-8?B?UjM4aTBReUV6b0VJZWRlOExQUDhqOEVyWmh1ZEIxeHlCaDBySEZQU3dSRUty?=
 =?utf-8?B?ZWVpMW5jVGlHQ0FXVnRCT0Exa1ZxZlJLLy9qemo5TzBkdVQ1VEhscGdoWitq?=
 =?utf-8?B?bkZ1YzI3cWpnQjYyRExjUGtsVnd3MEdna0RCNmJSS0txdDJnVXFsb1FwQW1C?=
 =?utf-8?B?V0gxcXRMUmtMRU00bmszZGc0OGdFZEJSTTRmN3JaaFZxU3JDMVQyZHlLRmhO?=
 =?utf-8?B?c1FRZzY0Vmo2MTZ3VklkTmRhMjdkdDFocWlieHAxczFjZm5JOVM0R2dadXhw?=
 =?utf-8?B?d1duUG8rTEkwSzVZTXUyZzFqQTZSQmZGbkdHVGhyQ2lSeXQrOEI0TVBjSzhh?=
 =?utf-8?B?SG9XZ3hLM1VFUEZoY1pTMHZTVHY1L1FvSUNmL3l2NjNxQXJKcHRTSFVoRHNt?=
 =?utf-8?B?VjFSRTIzSGFFRFlxQnBpa01xdUQ5SWhuNDRqZnBENGtSL05PSXpqLzc4dUJn?=
 =?utf-8?B?VWd5WFdVV2sxR2dmKzdSN1VoRDV2cDlYUUZuc0NrTVVwSUdRWFIwU3ZIL3Rl?=
 =?utf-8?B?dEhqMkJrcDNtRHhSS3pDWTJtemRUTXNQOWFGekpOSmkxYzBwQmgyVmxoZDJH?=
 =?utf-8?B?TUlWRTBsRm1PSFJvQ2JueXBENHRwMXA3endVU2U2MGRSb21mSWZZcUFMZzhm?=
 =?utf-8?B?Sm9MdnFIYVJKYm9FM2M2dytaZ2RiR0twdEhXaDJkMnh5MysxK3JxMS94cXhj?=
 =?utf-8?B?eHlnT3FWWGU3b20yYzk0UUR2OUF3UG1hODJjTmJCdHJUbnppVmxBMVFra3JN?=
 =?utf-8?Q?lWBhwfbyWlmikEQ1FeyFMBdbMjD9D9gsDoSAVQRpZQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <39018ED51959A8478A023D44B5F4486A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24127403-47c4-4f1e-0379-08d9d6d81173
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2022 21:02:54.1824 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Qg4DicdnKvpw1FpVQMi7ihuXUIpLJ5EG8woWCRhsQCe/O8G3xkCOYvXHdm2+PwXrwM70GGesBgULwOERScPaL6g3nRKBW8jZKyU/oa7BjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1517
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "Hansen,
 Dave" <dave.hansen@intel.com>, "Weiss, Zev" <zweiss@equinix.com>,
 "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "billy_tsai@aspeedtech.com" <billy_tsai@aspeedtech.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "Williams, Dan J" <dan.j.williams@intel.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "Luck, 
 Tony" <tony.luck@intel.com>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "olof@lixom.net" <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gVGh1LCAyMDIyLTAxLTEzIGF0IDA0OjEyICswMDAwLCBKb2VsIFN0YW5sZXkgd3JvdGU6Cj4g
T24gV2VkLCAxMiBKYW4gMjAyMiBhdCAyMzowNiwgSXdvbmEgV2luaWFyc2thIDxpd29uYS53aW5p
YXJza2FAaW50ZWwuY29tPiB3cm90ZToKPiA+IAo+ID4gRnJvbTogSmFlIEh5dW4gWW9vIDxqYWUu
aHl1bi55b29AbGludXguaW50ZWwuY29tPgo+ID4gCj4gPiBBU1BFRUQgQVNUMjR4eC9BU1QyNXh4
L0FTVDI2eHggU29DcyBzdXBwb3J0IHRoZSBQRUNJIGVsZWN0cmljYWwKPiA+IGludGVyZmFjZSAo
YS5rLmEgUEVDSSB3aXJlKSB0aGF0IHByb3ZpZGVzIGEgY29tbXVuaWNhdGlvbiBjaGFubmVsIHdp
dGgKPiA+IEludGVsIHByb2Nlc3NvcnMuCj4gPiBUaGlzIGRyaXZlciBhbGxvd3MgQk1DIHRvIGRp
c2NvdmVyIGRldmljZXMgY29ubmVjdGVkIHRvIGl0IGFuZAo+ID4gY29tbXVuaWNhdGUgd2l0aCB0
aGVtIHVzaW5nIFBFQ0kgcHJvdG9jb2wuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEphZSBIeXVu
IFlvbyA8amFlLmh5dW4ueW9vQGxpbnV4LmludGVsLmNvbT4KPiA+IENvLWRldmVsb3BlZC1ieTog
SXdvbmEgV2luaWFyc2thIDxpd29uYS53aW5pYXJza2FAaW50ZWwuY29tPgo+ID4gU2lnbmVkLW9m
Zi1ieTogSXdvbmEgV2luaWFyc2thIDxpd29uYS53aW5pYXJza2FAaW50ZWwuY29tPgo+ID4gUmV2
aWV3ZWQtYnk6IFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IDxwaWVycmUtbG91aXMuYm9zc2FydEBsaW51
eC5pbnRlbC5jb20+Cj4gCj4gVGhlIGRyaXZlciBsb29rcyBnb29kIHRvIG1lLiBJIHdvdWxkIGJl
IGhhcHB5IHRvIHNlZSBpdCBtZXJnZWQgaW4gaXRzCj4gY3VycmVudCBzdGF0ZS4KPiAKPiBSZXZp
ZXdlZC1ieTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4KClRoYW5rIHlvdSA6KQoKPiAK
PiBJJ3ZlIGEgZmV3IHF1ZXN0aW9ucyBiZWxvdyB0aGF0IGNhbiBiZSBmb2xsb3dlZCB1cCBsYXRl
ciBpZiBuZWVkIGJlLgo+IAo+ID4gKwo+ID4gK3N0YXRpYyB2b2lkIGFzcGVlZF9wZWNpX2luaXRf
cmVncyhzdHJ1Y3QgYXNwZWVkX3BlY2kgKnByaXYpCj4gPiArewo+ID4gK8KgwqDCoMKgwqDCoCB1
MzIgdmFsOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoCAvKiBDbGVhciBpbnRlcnJ1cHRzICovCj4g
PiArwqDCoMKgwqDCoMKgIHZhbCA9IHJlYWRsKHByaXYtPmJhc2UgKyBBU1BFRURfUEVDSV9JTlRf
U1RTKSB8IEFTUEVFRF9QRUNJX0lOVF9NQVNLOwo+IAo+IFNob3VsZCB0aGF0IGJlICYgTUFTSz8K
PiAKPiBBcyB5b3UncmUganVzdCBzYW5pdGlzaW5nIHRoZSByZWdpc3RlcnMsIHlvdSBjb3VsZCBj
bGVhciB0aGUgc3RhdHVzCj4gdW5jb25kaXRpb25hbGx5Ogo+IAo+IMKgd3JpdGVsKEFTUEVFRF9Q
RUNJX0lOVF9NQVNLLCBwcml2LT5iYXNlICsgQVNQRUVEX1BFQ0lfSU5UX1NUUyk7Cj4gCgpUaGUg
aWRlYSBpcyB0byBub3QgbW9kaWZ5IGFueSBvdGhlciBmaWVsZHMgaW4gdGhpcyByZWdpc3RlciBh
bmQgd3JpdGUgMSdzIG9ubHkKdG8gSU5UX01BU0suCkluIHRoZW9yeSB0aGUgb3RoZXIgZmllbGRz
IGFyZSBSTywgYnV0IEkgYWxyZWFkeSBmb3VuZCB0aGF0IHRvdWNoaW5nIHJlc2VydmVkCmZpZWxk
cyBpbiBvdGhlciByZWdpc3RlcnMgbWF5IG1ha2UgdGhlIEhXIHVwc2V0LgpJJ2xsIGNoZWNrIHdo
ZXRoZXIgY2xlYXJpbmcgdW5jb25kaXRpb25hbGx5IHdvcmtzIGhlcmUuCgo+ID4gK8KgwqDCoMKg
wqDCoCB3cml0ZWwodmFsLCBwcml2LT5iYXNlICsgQVNQRUVEX1BFQ0lfSU5UX1NUUyk7Cj4gPiAr
Cj4gPiArwqDCoMKgwqDCoMKgIC8qIFNldCB0aW1pbmcgbmVnb3RpYXRpb24gbW9kZSBhbmQgZW5h
YmxlIGludGVycnVwdHMgKi8KPiA+ICvCoMKgwqDCoMKgwqAgdmFsID0gRklFTERfUFJFUChBU1BF
RURfUEVDSV9USU1JTkdfTkVHT19TRUxfTUFTSywKPiA+IEFTUEVFRF9QRUNJXzFTVF9CSVRfT0Zf
QUREUl9ORUdPKTsKPiAKPiBUaGF0J3MgYSBjb21wbGljYXRlZCB3YXkgdG8gc2V0IHZhbCB0byB6
ZXJvIDopCgpBZ3JlZWQgLSBob3dldmVyLCB5b3UgY2FuIHRoaW5rIG9mIGl0IGFzIGEgd2F5IHRv
IGRvY3VtZW50IHRoZSBwcm9ncmFtbWluZwpzZXF1ZW5jZSA6KQoKPiAKPiA+ICvCoMKgwqDCoMKg
wqAgdmFsIHw9IEFTUEVFRF9QRUNJX0lOVF9NQVNLOwo+ID4gK8KgwqDCoMKgwqDCoCB3cml0ZWwo
dmFsLCBwcml2LT5iYXNlICsgQVNQRUVEX1BFQ0lfSU5UX0NUUkwpOwo+ID4gKwo+ID4gK8KgwqDC
oMKgwqDCoCB2YWwgPSBGSUVMRF9QUkVQKEFTUEVFRF9QRUNJX0NUUkxfU0FNUExJTkdfTUFTSywK
PiA+IEFTUEVFRF9QRUNJX1JEX1NBTVBMSU5HX1BPSU5UX0RFRkFVTFQpOwo+ID4gK8KgwqDCoMKg
wqDCoCB3cml0ZWwodmFsLCBwcml2LT5iYXNlICsgQVNQRUVEX1BFQ0lfQ1RSTCk7Cj4gCj4gVGhp
cyB3aWxsIGNsZWFyIHRoZSByZXN0IG9mIHRoZSBjdHJsIHJlZ2lzdGVyLCBpbmNsdWRpbmcgdGhl
IGRpdmlzb3IKPiBzZXR0aW5ncy4gV2FzIHRoYXQgeW91ciBpbnRlbnRpb24/CgpZZXMsIGl0IHdh
cyBteSBpbnRlbnRpb24gLSB0aGUgcmVnaXN0ZXIgaXMgaW5pdGlhbGl6ZWQgd2l0aCAicmFuZG9t
IiB2YWx1ZXMgc28KaXQgcmVxdWlyZXMgdG8gYmUgY2xlYXJlZCB3aGVuIHdlIGZpcnN0IGFjY2Vz
c2VkIGl0IChpZiB3ZSBqdXN0IFJNVyBpdCwgdGhlIEhXCmdldHMgdXBzZXQpLgo+IAo+IFJlYWRp
bmcgdGhlIHJlc3Qgb2YgeW91ciBkcml2ZXIgeW91IG9ubHkgY2FsbCBfaW5pdF9yZWdzIGFmdGVy
Cj4gX2NvbnRyb2xsZXJfZW5hYmxlLCBzbyBJIGd1ZXNzIHlvdSdyZSBmaW5lLgoKYXNwZWVkX3Bl
Y2lfaW5pdF9yZWdzKCkgaXMgYWx3YXlzIGNhbGxlZCBhZnRlciBjb250cm9sbGVyIHJlc2V0LCBh
bnkgb3RoZXIKcmVnaXN0ZXIgcHJvZ3JhbW1pbmcgaXMgZ29pbmcgdG8gaGFwcGVuIGxhdGVyIG9u
ICh3aXRoIFJNVykuIAoKPiAKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIGludCBhc3BlZWRfcGVj
aV9jaGVja19pZGxlKHN0cnVjdCBhc3BlZWRfcGVjaSAqcHJpdikKPiA+ICt7Cj4gPiArwqDCoMKg
wqDCoMKgIHUzMiBjbWRfc3RzID0gcmVhZGwocHJpdi0+YmFzZSArIEFTUEVFRF9QRUNJX0NNRCk7
Cj4gPiArwqDCoMKgwqDCoMKgIGludCByZXQ7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgIC8qCj4g
PiArwqDCoMKgwqDCoMKgwqAgKiBVbmRlciBub3JtYWwgY2lyY3Vtc3RhbmNlcywgd2UgZXhwZWN0
IHRvIGJlIGlkbGUgaGVyZS4KPiA+ICvCoMKgwqDCoMKgwqDCoCAqIEluIGNhc2UgdGhlcmUgd2Vy
ZSBhbnkgZXJyb3JzL3RpbWVvdXRzIHRoYXQgbGVkIHRvIHRoZSBzaXR1YXRpb24KPiA+ICvCoMKg
wqDCoMKgwqDCoCAqIHdoZXJlIHRoZSBoYXJkd2FyZSBpcyBub3QgaW4gaWRsZSBzdGF0ZSAtIHdl
IG5lZWQgdG8gcmVzZXQgYW5kCj4gPiArwqDCoMKgwqDCoMKgwqAgKiByZWluaXRpYWxpemUgaXQg
dG8gYXZvaWQgcG90ZW50aWFsIGNvbnRyb2xsZXIgaGFuZy4KPiA+ICvCoMKgwqDCoMKgwqDCoCAq
Lwo+ID4gK8KgwqDCoMKgwqDCoCBpZiAoRklFTERfR0VUKEFTUEVFRF9QRUNJX0NNRF9TVFNfTUFT
SywgY21kX3N0cykpIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlc2V0X2Nv
bnRyb2xfYXNzZXJ0KHByaXYtPnJzdCk7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZXQgPSByZXNldF9jb250cm9sX2RlYXNzZXJ0KHByaXYtPnJzdCk7Cj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocmV0KSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2Vycihwcml2LT5kZXYsICJjYW5ub3Qg
ZGVhc3NlcnQgcmVzZXQgY29udHJvbFxuIik7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIH0KPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFzcGVl
ZF9wZWNpX2luaXRfcmVncyhwcml2KTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldCA9IGNsa19zZXRfcmF0ZShwcml2LT5jbGssIHByaXYtPmNsa19mcmVxdWVuY3kp
Owo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHJldCA8IDApIHsKPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKHByaXYt
PmRldiwgImNhbm5vdCBzZXQgY2xvY2sgZnJlcXVlbmN5XG4iKTsKPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgYXNwZWVkX3BlY2lfY29udHJvbGxlcl9lbmFibGUocHJpdik7Cj4gPiArwqDCoMKgwqDC
oMKgIH0KPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqAgcmV0dXJuIHJlYWRsX3BvbGxfdGltZW91dChw
cml2LT5iYXNlICsgQVNQRUVEX1BFQ0lfQ01ELAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY21kX3N0cywKPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICEoY21kX3N0cyAmIEFTUEVFRF9QRUNJX0NNRF9JRExFX01BU0spLAo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgQVNQRUVEX1BFQ0lfSURMRV9DSEVDS19JTlRFUlZBTF9VUywKPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFTUEVF
RF9QRUNJX0lETEVfQ0hFQ0tfVElNRU9VVF9VUyk7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBp
bnQgYXNwZWVkX3BlY2lfeGZlcihzdHJ1Y3QgcGVjaV9jb250cm9sbGVyICpjb250cm9sbGVyLAo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
dTggYWRkciwgc3RydWN0IHBlY2lfcmVxdWVzdCAqcmVxKQo+ID4gK3sKPiA+ICvCoMKgwqDCoMKg
wqAgc3RydWN0IGFzcGVlZF9wZWNpICpwcml2ID0gZGV2X2dldF9kcnZkYXRhKGNvbnRyb2xsZXIt
PmRldi5wYXJlbnQpOwo+ID4gK8KgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIHRpbWVvdXQgPSBt
c2Vjc190b19qaWZmaWVzKHByaXYtPmNtZF90aW1lb3V0X21zKTsKPiA+ICvCoMKgwqDCoMKgwqAg
dTMyIHBlY2lfaGVhZDsKPiA+ICvCoMKgwqDCoMKgwqAgaW50IHJldDsKPiA+ICsKPiA+ICvCoMKg
wqDCoMKgwqAgaWYgKHJlcS0+dHgubGVuID4gQVNQRUVEX1BFQ0lfREFUQV9CVUZfU0laRV9NQVgg
fHwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXEtPnJ4LmxlbiA+IEFTUEVFRF9QRUNJX0RB
VEFfQlVGX1NJWkVfTUFYKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IC1FSU5WQUw7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgIC8qIENoZWNrIGNvbW1hbmQgc3RzIGFu
ZCBidXMgaWRsZSBzdGF0ZSAqLwo+ID4gK8KgwqDCoMKgwqDCoCByZXQgPSBhc3BlZWRfcGVjaV9j
aGVja19pZGxlKHByaXYpOwo+ID4gK8KgwqDCoMKgwqDCoCBpZiAocmV0KQo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsgLyogLUVUSU1FRE9VVCAqLwo+ID4gKwo+
ID4gK8KgwqDCoMKgwqDCoCBzcGluX2xvY2tfaXJxKCZwcml2LT5sb2NrKTsKPiA+ICvCoMKgwqDC
oMKgwqAgcmVpbml0X2NvbXBsZXRpb24oJnByaXYtPnhmZXJfY29tcGxldGUpOwo+ID4gKwo+ID4g
K8KgwqDCoMKgwqDCoCBwZWNpX2hlYWQgPSBGSUVMRF9QUkVQKEFTUEVFRF9QRUNJX1RBUkdFVF9B
RERSX01BU0ssIGFkZHIpIHwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgRklFTERfUFJFUChBU1BFRURfUEVDSV9XUl9MRU5fTUFTSywgcmVxLT50eC5sZW4pIHwKPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRklFTERfUFJFUChBU1BFRURf
UEVDSV9SRF9MRU5fTUFTSywgcmVxLT5yeC5sZW4pOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoCB3
cml0ZWwocGVjaV9oZWFkLCBwcml2LT5iYXNlICsgQVNQRUVEX1BFQ0lfUldfTEVOR1RIKTsKPiA+
ICsKPiA+ICvCoMKgwqDCoMKgwqAgbWVtY3B5X3RvaW8ocHJpdi0+YmFzZSArIEFTUEVFRF9QRUNJ
X1dSX0RBVEEwLCByZXEtPnR4LmJ1ZiwgbWluX3QodTgsCj4gPiByZXEtPnR4LmxlbiwgMTYpKTsK
PiA+ICvCoMKgwqDCoMKgwqAgaWYgKHJlcS0+dHgubGVuID4gMTYpCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBtZW1jcHlfdG9pbyhwcml2LT5iYXNlICsgQVNQRUVEX1BFQ0lfV1Jf
REFUQTQsIHJlcS0+dHguYnVmICsKPiA+IDE2LAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVxLT50eC5sZW4gLSAxNik7Cj4gPiArCj4g
PiArI2lmIElTX0VOQUJMRUQoQ09ORklHX0RZTkFNSUNfREVCVUcpCj4gPiArwqDCoMKgwqDCoMKg
IGRldl9kYmcocHJpdi0+ZGV2LCAiSEVBRCA6ICUjMDh4XG4iLCBwZWNpX2hlYWQpOwo+ID4gK8Kg
wqDCoMKgwqDCoCBwcmludF9oZXhfZHVtcF9ieXRlcygiVFggOiAiLCBEVU1QX1BSRUZJWF9OT05F
LCByZXEtPnR4LmJ1ZiwgcmVxLQo+ID4gPnR4Lmxlbik7Cj4gPiArI2VuZGlmCj4gCj4gVGhlIGlm
ZGVmIGlzIHVuZm9ydHVuYXRlLiBDb3VsZCB5b3UgZG8gdGhpcz8KPiAKPiBkZXZfZGJnKHByaXYt
PmRldiwgIkhFQUQgOiAlIzA4eFxuIiwgcGVjaV9oZWFkKTsKPiBpZiAoSVNfRU5BQkxFRChDT05G
SUdfRFlOQU1JQ19ERUJVRykpCj4gwqDCoMKgwqDCoMKgIHByaW50X2hleF9kdW1wX2J5dGVzKCJU
WCA6ICIsIERVTVBfUFJFRklYX05PTkUsIHJlcS0+dHguYnVmLAo+IHJlcS0+dHgubGVuKTsKPiAK
PiBOb3QgYSBiaWdnaWUgdGhvdWdoLCBkb24ndCBsZXQgdGhpcyBob2xkIHVwIG1lcmdpbmcuCgpJ
IGRvbid0IHVuZGVyc3RhbmQgd2h5IHNob3VsZCB3ZSB0cmVhdCBIRUFEIGRpZmZlcmVudGx5IHRo
YXQgdGhlIHJlc3Qgb2YgdGhlCmJ1ZmZlci4gVWx0aW1hdGVseSAobG9va2luZyBhdCB0aGlzIGZy
b20gdGhlIFBFQ0kgcHJvdG9jb2wgbGV2ZWwpIHRoaXMgaXMganVzdCBhCnBhcnQgb2YgVFggcGFj
a2V0LgpPdmVyYWxsLCB0aGlzIGlzIHRoZSAiaG90IHBhdGgiIG9mIHRoaXMgcGFydGljdWxhciBk
cml2ZXIgLSB0aGUgaWZkZWYgaXMgaGVyZSB0bwphdm9pZCBkdW1waW5nIGFsbCBwYWNrZXRzIGFs
bCB0aGUgdGltZSAod2hpY2ggd291bGQgaGFwcGVuIGlmIGR5bmFtaWMgZGVidWcgaXMKbm90IHBy
ZXNlbnQpLgoKVGhhbmtzCi1Jd29uYQoKPiAKPiA+ICvCoMKgwqDCoMKgwqAgcHJpdi0+c3RhdHVz
ID0gMDsKPiA+ICvCoMKgwqDCoMKgwqAgd3JpdGVsKEFTUEVFRF9QRUNJX0NNRF9GSVJFLCBwcml2
LT5iYXNlICsgQVNQRUVEX1BFQ0lfQ01EKTsKPiA+ICvCoMKgwqDCoMKgwqAgc3Bpbl91bmxvY2tf
aXJxKCZwcml2LT5sb2NrKTsKPiA+ICsKCg==
