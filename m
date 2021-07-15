Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEEB3CA496
	for <lists+openbmc@lfdr.de>; Thu, 15 Jul 2021 19:35:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQhN34pHwz308f
	for <lists+openbmc@lfdr.de>; Fri, 16 Jul 2021 03:35:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=OCfOgN6L;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=OCfOgN6L; dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQhMd1DRHz2xbB;
 Fri, 16 Jul 2021 03:34:47 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="207574163"
X-IronPort-AV: E=Sophos;i="5.84,243,1620716400"; d="scan'208";a="207574163"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 10:33:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,243,1620716400"; d="scan'208";a="494657741"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga001.jf.intel.com with ESMTP; 15 Jul 2021 10:33:38 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 15 Jul 2021 10:33:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 15 Jul 2021 10:33:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Thu, 15 Jul 2021 10:33:37 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 15 Jul 2021 10:33:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AX7yv0b2X9Lp9i9R7/mAfXa0bFQoQ66kOxnWrCYZVi/SaOn+QBst68ofes8liI/C/8SJqt5QsKjZiR+XBnQ50OFHaiZpzRZyrr8z7lAZyjk8D4FSkzrPk9j9ifAgSQwGHWCb994GKESnFBXhRHSCob3A3JJPGpXHr/ccJmE11DdPg2dx3gHy/dCv7kAtkonOAT448WRQ4Y5+ykNOnp9248OWr9d+/laNkNOWtpq+y+KJNVlJV4y5wxsU5LgBK2yDGlLlFemPGSSGW9ZimyAy27LTSmRlVb9do9hroe7rrVwK5PTPZJclSQuwPydq0NhglvWYaYjTCtNq5YD9Wz+uYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1t4SkmLxOpasfA4XMOLpRUdG9TkbZ7sNQQgv/zU40M=;
 b=NqOn3ZQJN/2u/bnRyUGER7Jl09z0TQRsSOxz5JtAChiW9oqAkd6+pp+ISRTsDAQqXGFwpM+rRUTs4dtlnb6zHlSP46cV7HO+hdC+bctH4jiDsbRE57AFP5huZ2ZDZ/icucnd05aoxU4OBN76jlibep5pHtYV71ZiGF11cgcJLqfw9Syk3TUBPh5OvJgOyWr3RlP+52e5Gmo7HJNmlLWf0tnhbRb4XHkmZ8qwBZjAh/Ns/Lsojm+zYfHVQl1Fm4Uae19rsTt9TMO+Ix89C9GB+Gn/3x06GfqJSqY/omUolZTxjD/R5VNb4WYuoKMAr3OsL7ktPVnl2IBIzYXtAOqlQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1t4SkmLxOpasfA4XMOLpRUdG9TkbZ7sNQQgv/zU40M=;
 b=OCfOgN6LAZWM864iQkRNYPIsnc0y0nN0K69Vi/4y3r+bZonbEYHf80OTP94OoEw3/VHY4dPUpyQLjuFe1kFIcW0C9EQMXQCFmzi1bgoXyzCkQz5ASYxgosr1RcB4gnCAUXhrrz5aYCET6M6akFT5R1ahR/UIhPZMEF7Luw+fs4o=
Received: from SN6PR11MB2589.namprd11.prod.outlook.com (2603:10b6:805:53::12)
 by SN6PR11MB2703.namprd11.prod.outlook.com (2603:10b6:805:59::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Thu, 15 Jul
 2021 17:33:34 +0000
Received: from SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::357a:ba5:ee4f:d5f1]) by SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::357a:ba5:ee4f:d5f1%7]) with mapi id 15.20.4331.022; Thu, 15 Jul 2021
 17:33:34 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "Williams, Dan J" <dan.j.williams@intel.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH 00/14] Introduce PECI subsystem
Thread-Topic: [PATCH 00/14] Introduce PECI subsystem
Thread-Index: AQHXd2pJyx4ckFPI00SFj5EUUUvouqtCsiSAgAGeGIA=
Date: Thu, 15 Jul 2021 17:33:34 +0000
Message-ID: <fe9a5191e401b38325aaff11365b5970034d26cc.camel@intel.com>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <3b9cfe5f728c40c473a22070029c8790b452daf4.camel@intel.com>
In-Reply-To: <3b9cfe5f728c40c473a22070029c8790b452daf4.camel@intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.4 (3.38.4-1.fc33) 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b0fb5dd-7c5b-4f74-c72e-08d947b6abfe
x-ms-traffictypediagnostic: SN6PR11MB2703:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB2703F4395CAC7B6EF24B9438EC129@SN6PR11MB2703.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7FAvEqcgLPuPokvMHHM0s/fGrXzDZa0tPQAPYPDEOM5ei9Xk6s3aLoWTYhiyRLG/YWRJmk52++XbYvCOuMfvfudfx0geeNQkG519YH3BrJP0KT3OSei7Ag4upDrDtdVVEzBGBEmOz2s/KxAsC409G5LNBWvsGgEXyqSqBK2f41lmZM7i7Pcs0tH+37zr4U0XNCm23GjFFuZWcDRla3air3Sd0B3xlCNI42LQdBknW+0b/n9LSTcwM/r/ynF0++bT84gsl21zO2AJYSeoRNqWgQcP6YF+N5eq8fgHaVC9fkHNMiPLEfUIEU4WT0lu9oAcJ1GUiInxPJsX+A9mNSArjnVmaFLaWExl85UKQ8Nz2PlCR+q8j5/t1mfC2Ey0CWI2ArlcAECr1cTR+ITdz8RSUpPP1HEkoHW3/l6IoIL4uRoWsO3vbI7K2coieaB+2l05MxWNVhmtPJ80K4njI9+Xa+vU/o2xaBbnJZjYuKAZ7OY9/u5rap4Rbp+OuuKMCyRPKMMImGN2VZz9hVX06RszjRL44E04wZiUxa+B8YMu2rh2gUddA7sgnNtG2IS0lp0B5fiQ0++BFSLJcVhf0j3hN92mFjrlwqDC147xR1/ZW079dSvGOXbEM+MObfnFGWewpeV9V1vcyxA2WJP2L1ZdCfuRFpuCo2WrRDpazA7TsiRgOGuJLyJoD5d5BoHhsWLzyZO2gnUcN84V1Gv+TBNa1zI28fczCDRO43VHJM/WFxkFeDF0O+P+N7/UCZPGVC7wWsqZKLS6JnPnGj0XXFRi65nCCgIT0Mdl5FmhOTOfjHF2nN5yIRuEAf+dbd42cVV3bPxiWd+sjJUbEO99991xEw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2589.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(366004)(39860400002)(376002)(86362001)(5660300002)(66476007)(478600001)(966005)(6512007)(66556008)(64756008)(6506007)(2616005)(83380400001)(26005)(2906002)(66946007)(38100700002)(76116006)(186003)(8676002)(4326008)(36756003)(91956017)(66446008)(8936002)(6486002)(7416002)(54906003)(122000001)(316002)(71200400001)(110136005)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bHB4MlZWeHVjRUNUT054VGUzU3dkTmEvbUlVODhEdkV5cVRPaUxKY2R1OGNY?=
 =?utf-8?B?OE1NVElBOFFZbEZDMjQ5NFAxWFp1K2t4Rk5vdmRDWmR1OFR1QzllOUtaZ3dZ?=
 =?utf-8?B?TjIxYm5FMWMxVUlOSlhQN05PNk5sL2NMYW5mQmM5QndWTVlaMUpVY1VsSUtR?=
 =?utf-8?B?dVZTYXhUT1VRQ2F4T2dTL05ZTmZMMi9JRXhkYnhZZ2VxdFp0OEJ4RGdTR3Fj?=
 =?utf-8?B?aitFY0JpK2RKck9BVk5VcGJOUjgwdWl5bGt1ay9PZWs3Y05YZVFFZmgzVnFs?=
 =?utf-8?B?TzdWSkh3REtTQ1ZuYnNUb3VnenluNlZDcGhZd1VLaUlVejB1d1E1bGJBbGJP?=
 =?utf-8?B?WFp4K0NOZnRMbS9vMFRRa3BDUy9jck14TEczR1ZIdTdjSVR1d1hsRTJxUXpN?=
 =?utf-8?B?UVBuOHhNTC9CckJxcE9pWFZlUmJhK2FRYjA2OVE4c3NuYThpR0dKOXd6UHNp?=
 =?utf-8?B?Umx0eGkvZG5qNXFoazRaaHcvRlBWTGNxMGpqangzTUtsSEFvWG5FcDZic1Zm?=
 =?utf-8?B?TGZrZkY2OXA3SVM5L3NaYksrMkJBS2s2aHhjMExkQVpDTnpUV1AyYU9xbnhX?=
 =?utf-8?B?L0Yzcm42Y3IzcU1Fc3M3STl6QXNDV09vMnB3OUdBMGRIelhwNGlSeXBJc3FF?=
 =?utf-8?B?SkxJSnlmdksyNU15N2MyWnpaWUMwRUJrYlFiYnY3TTBmak92c3hhekNFZTZh?=
 =?utf-8?B?SzFzYlRxYTV4cDBMb3hyN29Jcjc3bXYxUmhzSVhRejIvUkFiV0dLOWpPdWFJ?=
 =?utf-8?B?U1JxWmpQQ0NMY1N1TWZZKytDYTAvTVFza0dBdmh4M21QWEgyUm1EMlBPd1lN?=
 =?utf-8?B?bjRsV0ErUWpvSU96MnpqbXR1ZWQyd0xTZ3AxMTJkN0dPdk1ENjlyVzNncnZY?=
 =?utf-8?B?bVVoVXM0NXI2VHA1V1JZRXg1MzVqVlRzeEtvNTk5Q1diRWZ0cng4UWFTd0c1?=
 =?utf-8?B?ODMzcHJ4clBucTMzVTRHc1R3RnltYis3RkpYaHJldXJWK2dRLzk5TWRnaGY5?=
 =?utf-8?B?ODNWU2hNeGEzYUUrVjFNNHZ4dktwV3dRMkxiUDdER1ZrOGtzYzlrcm9JemFD?=
 =?utf-8?B?VDVwb0NKa1NSeSs4TThmbXhINUZkemFCMFF2VjlPZ0F5Z05rU05uWmJsRDAw?=
 =?utf-8?B?N3d0NHF3b0VFUS9sV3RHVS8zTWZMM3BwZkNEKzBCeDI0SzNKeFVZN29rVmpF?=
 =?utf-8?B?d2MvR3BxK0lOeWQxQWNSQ3ZnUTh4VU4xMjRUUENmSVNNcmE4RGtMWmZUTjRh?=
 =?utf-8?B?MlRRZCtLL1VCRnZ0T0x2Qjd5bHFQOFkzekRsN3NmZVhNelhhT3R3VXhtMnhk?=
 =?utf-8?B?bEQ5RGRjWHZPTmxvSlBrNU5CaDhabEcvRTZwZFBzZis2WXAwcWd2ZXJCQzY1?=
 =?utf-8?B?eit2ZGQvcTRPUVlVeWhkejZMU0FGZW42NExBOWRFdGpiVU5MZktiQlRLQzM2?=
 =?utf-8?B?QzdIcFAzQXB2QjhEcXJvemVYQytia2NTRkg4STVLZHhHMndzVzhZL1M4UzVZ?=
 =?utf-8?B?ZmF6NDR1RjBIQWpibUl6ZG9hT1hMcjVIT01qcDNCeFYxRkRENzExclZoditR?=
 =?utf-8?B?UEs2dU1YbWk5YThZK1NVL2pqNGFTTk8raE9Kc3FxOGF2aVBYWGdDbGZjNllT?=
 =?utf-8?B?RXVzRWo2c0U1SDBzZGpUd1U0K0JCUUo4aEwyZWtIMWlGeDAvT29lcGwyM2dn?=
 =?utf-8?B?dEpXc2IxK2RzckZYQTlEdjFuYnExaUhxSFBOc2dVZXE3S25VdkdxbGRveEJX?=
 =?utf-8?B?UmN2YUhGZG1CYisvQVlMNWZnTFU2bkRZQ1NnZXJaR1lLSjZ3NHVsSDN4bTVY?=
 =?utf-8?B?OWx0TlNra2Z2L0loZmo3QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <21CDD1749A5ACE45A2C2D748E66E40E5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2589.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b0fb5dd-7c5b-4f74-c72e-08d947b6abfe
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2021 17:33:34.3537 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OrcGSTlBzjeGpV3+TX9DpIDOte98g+9G2fbuhE6fRqwJu3hV9m+o4eABAhSy/PThU8ofonFZLtefNttCr+ZlCYHoEtoPhsf4eKl8HSUt3ak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2703
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
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>,
 "x86@kernel.org" <x86@kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "Lutomirski, Andy" <luto@kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "Luck,
 Tony" <tony.luck@intel.com>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "yazen.ghannam@amd.com" <yazen.ghannam@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gV2VkLCAyMDIxLTA3LTE0IGF0IDE2OjUxICswMDAwLCBXaWxsaWFtcywgRGFuIEogd3JvdGU6
DQo+IE9uIFR1ZSwgMjAyMS0wNy0xMyBhdCAwMDowNCArMDIwMCwgSXdvbmEgV2luaWFyc2thIHdy
b3RlOg0KPiA+IE5vdGU6IEFsbCBjaGFuZ2VzIHRvIGFyY2gveDg2IGFyZSBjb250YWluZWQgd2l0
aGluIHBhdGNoZXMgMDEtMDIuDQo+IA0KPiBIaSBJd29uYSwNCj4gDQo+IE9uZSBtZXRhIHF1ZXN0
aW9uIGZpcnN0LCB3aG8gaXMgdGhpcyBzdWJtaXNzaW9uICJUbzoiPyBJcyB0aGVyZSBhbg0KPiBl
eGlzdGluZyB1cHN0cmVhbSBtYWludGFpbmVyIHBhdGggZm9yIE9wZW5CTUMgY2hhbmdlcz8gQXJl
IHlvdQ0KPiBleHBlY3RpbmcgY29udHJpYnV0aW9ucyB0byB0aGlzIHN1YnN5c3RlbSBmcm9tIG90
aGVycz8gV2hpbGUgR3JlZw0KPiBzb21ldGltZXMgZW5kcyB1cCBhcyBkZWZhdWx0IG1haW50YWlu
ZXIgZm9yIG5ldyBzdHVmZiwgSSB3b25kZXIgaWYNCj4gc29tZW9uZSBmcm9tIHRoZSBPcGVuQk1D
IGNvbW1udWl0eSBzaG91bGQgc3RlcCB1cCB0byBmaWxsIHRoaXMgcm9sZT8NCj4gDQoNClRoZSBp
bnRlbnRpb24gd2FzIHRvIGRpcmVjdCBpdCB0byBHcmVnLCBidXQgSSBndWVzcyBJIGRpZG4ndCBl
eHByZXNzDQp0aGF0IHRocm91Z2ggdGhlIG1haWwgaGVhZGVycy4NCkkgYW0gZXhwZWN0aW5nIGNv
bnRyaWJ1dGlvbnMgLSBmb3IgZXhhbXBsZSB0aGVyZSBpcyBhdCBsZWFzdCBvbmUgb3RoZXINCm1h
am9yIEJNQyB2ZW5kb3Igd2hpY2ggYWxzbyBzaGlwcyBQRUNJIGNvbnRyb2xsZXJzLg0KDQpGcm9t
IG15IHBlcnNwZWN0aXZlLCB0aGUgcGllY2VzIHRoYXQgbWFrZSB1cCBhIEJNQyBhcmUgcHJldHR5
IGxvb3NlbHkNCmNvbm5lY3RlZCAoYXQgbGVhc3QgZnJvbSB0aGUga2VybmVsIHBlcnNwZWN0aXZl
IC0gc2NhdHRlcmVkIGFsbCBvdmVyDQp0aGUga2VybmVsIHRyZWUpLCBzbyBJIGRvbid0IHNlZSBo
b3cgdGhhdCB3b3VsZCB3b3JrIGluIHByYWN0aWNlLg0KDQpUaGFua3MNCi1Jd29uYQ0KDQoNCj4g
PiANCj4gPiBUaGUgUGxhdGZvcm0gRW52aXJvbm1lbnQgQ29udHJvbCBJbnRlcmZhY2UgKFBFQ0kp
IGlzIGEgY29tbXVuaWNhdGlvbg0KPiA+IGludGVyZmFjZSBiZXR3ZWVuIEludGVsIHByb2Nlc3Nv
cnMgYW5kIG1hbmFnZW1lbnQgY29udHJvbGxlcnMgKGUuZy4NCj4gPiBCYXNlYm9hcmQgTWFuYWdl
bWVudCBDb250cm9sbGVyLCBCTUMpLg0KPiA+IA0KPiA+IFRoaXMgc2VyaWVzIGFkZHMgYSBQRUNJ
IHN1YnN5c3RlbSBhbmQgaW50cm9kdWNlcyBkcml2ZXJzIHdoaWNoIHJ1biBpbg0KPiA+IHRoZSBM
aW51eCBpbnN0YW5jZSBvbiB0aGUgbWFuYWdlbWVudCBjb250cm9sbGVyIChub3QgdGhlIG1haW4g
SW50ZWwNCj4gPiBwcm9jZXNzb3IpIGFuZCBpcyBpbnRlbmRlZCB0byBiZSB1c2VkIGJ5IHRoZSBP
cGVuQk1DIFsxXSwgYSBMaW51eA0KPiA+IGRpc3RyaWJ1dGlvbiBmb3IgQk1DIGRldmljZXMuDQo+
ID4gVGhlIGluZm9ybWF0aW9uIGV4cG9zZWQgb3ZlciBQRUNJIChsaWtlIHByb2Nlc3NvciBhbmQg
RElNTQ0KPiA+IHRlbXBlcmF0dXJlKSByZWZlcnMgdG8gdGhlIEludGVsIHByb2Nlc3NvciBhbmQg
Y2FuIGJlIGNvbnN1bWVkIGJ5DQo+ID4gZGFlbW9ucyBydW5uaW5nIG9uIHRoZSBCTUMgdG8sIGZv
ciBleGFtcGxlLCBkaXNwbGF5IHRoZSBwcm9jZXNzb3INCj4gPiB0ZW1wZXJhdHVyZSBpbiBpdHMg
d2ViIGludGVyZmFjZS4NCj4gPiANCj4gPiBUaGUgUEVDSSBidXMgaXMgY29sbGVjdGlvbiBvZiBj
b2RlIHRoYXQgcHJvdmlkZXMgaW50ZXJmYWNlIHN1cHBvcnQNCj4gPiBiZXR3ZWVuIFBFQ0kgZGV2
aWNlcyAodGhhdCBhY3R1YWxseSByZXByZXNlbnQgcHJvY2Vzc29ycykgYW5kIFBFQ0kNCj4gPiBj
b250cm9sbGVycyAoc3VjaCBhcyB0aGUgInBlY2ktYXNwZWVkIiBjb250cm9sbGVyKSB0aGF0IGFs
bG93IHRvDQo+ID4gYWNjZXNzIHBoeXNpY2FsIFBFQ0kgaW50ZXJmYWNlLiBQRUNJIGRldmljZXMg
YXJlIGJvdW5kIHRvIFBFQ0kNCj4gPiBkcml2ZXJzIHRoYXQgcHJvdmlkZXMgYWNjZXNzIHRvIFBF
Q0kgc2VydmljZXMuIFRoaXMgc2VyaWVzIGludHJvZHVjZXMNCj4gPiBhIGdlbmVyaWMgInBlY2kt
Y3B1IiBkcml2ZXIgdGhhdCBleHBvc2VzIGhhcmR3YXJlIG1vbml0b3JpbmcNCj4gPiAiY3B1dGVt
cCINCj4gPiBhbmQgImRpbW10ZW1wIiB1c2luZyB0aGUgYXV4aWxpYXJ5IGJ1cy4NCj4gPiANCj4g
PiBFeHBvc2luZyAicmF3IiBQRUNJIHRvIHVzZXJzcGFjZSwgZWl0aGVyIHRvIHdyaXRlIHVzZXJz
cGFjZSBkcml2ZXJzDQo+ID4gb3INCj4gPiBmb3IgZGVidWcvdGVzdGluZyBwdXJwb3NlIHdhcyBs
ZWZ0IG91dCBvZiB0aGlzIHNlcmllcyB0byBlbmNvdXJhZ2UNCj4gPiB3cml0aW5nIGtlcm5lbCBk
cml2ZXJzIGluc3RlYWQsIGJ1dCBtYXkgYmUgcHVyc3VlZCBpbiB0aGUgZnV0dXJlLg0KPiA+IA0K
PiA+IEludHJvZHVjaW5nIFBFQ0kgdG8gdXBzdHJlYW0gTGludXggd2FzIGFscmVhZHkgYXR0ZW1w
dGVkIGJlZm9yZSBbMl0uDQo+ID4gU2luY2UgaXQncyBiZWVuIG92ZXIgYSB5ZWFyIHNpbmNlIGxh
c3QgcmV2aXNpb24sIGFuZCB0aGUgc2VyaWVzDQo+ID4gY2hhbmdlZCBxdWl0ZSBhIGJpdCBpbiB0
aGUgbWVhbnRpbWUsIEkndmUgZGVjaWRlZCB0byBzdGFydCBmcm9tIHYxLg0KPiA+IA0KPiA+IEkg
d291bGQgYWxzbyBsaWtlIHRvIGdpdmUgY3JlZGl0IHRvIGV2ZXJ5b25lIHdobyBoZWxwZWQgbWUg
d2l0aA0KPiA+IGRpZmZlcmVudCBhc3BlY3RzIG9mIHByZWxpbWluYXJ5IHJldmlldzoNCj4gPiAt
IFBpZXJyZS1Mb3VpcyBCb3NzYXJ0LA0KPiA+IC0gVG9ueSBMdWNrLCANCj4gPiAtIEFuZHkgU2hl
dmNoZW5rbywNCj4gPiAtIERhdmUgSGFuc2VuLg0KPiA+IA0KPiA+IFsxXSBodHRwczovL2dpdGh1
Yi5jb20vb3BlbmJtYy9vcGVuYm1jDQo+ID4gWzJdIA0KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL29wZW5ibWMvMjAxOTEyMTExOTQ2MjQuMjg3Mi0xLWphZS5oeXVuLnlvb0BsaW51eC5pbnRl
bC5jb20vDQo+ID4gDQo+ID4gSXdvbmEgV2luaWFyc2thICgxMik6DQo+ID4gwqAgeDg2L2NwdTog
TW92ZSBpbnRlbC1mYW1pbHkgdG8gYXJjaC1pbmRlcGVuZGVudCBoZWFkZXJzDQo+ID4gwqAgeDg2
L2NwdTogRXh0cmFjdCBjcHVpZCBoZWxwZXJzIHRvIGFyY2gtaW5kZXBlbmRlbnQNCj4gPiDCoCBk
dC1iaW5kaW5nczogQWRkIGdlbmVyaWMgYmluZGluZ3MgZm9yIFBFQ0kNCj4gPiDCoCBkdC1iaW5k
aW5nczogQWRkIGJpbmRpbmdzIGZvciBwZWNpLWFzcGVlZA0KPiA+IMKgIEFSTTogZHRzOiBhc3Bl
ZWQ6IEFkZCBQRUNJIGNvbnRyb2xsZXIgbm9kZXMNCj4gPiDCoCBwZWNpOiBBZGQgY29yZSBpbmZy
YXN0cnVjdHVyZQ0KPiA+IMKgIHBlY2k6IEFkZCBkZXZpY2UgZGV0ZWN0aW9uDQo+ID4gwqAgcGVj
aTogQWRkIHN1cHBvcnQgZm9yIFBFQ0kgZGV2aWNlIGRyaXZlcnMNCj4gPiDCoCBwZWNpOiBBZGQg
cGVjaS1jcHUgZHJpdmVyDQo+ID4gwqAgaHdtb246IHBlY2k6IEFkZCBjcHV0ZW1wIGRyaXZlcg0K
PiA+IMKgIGh3bW9uOiBwZWNpOiBBZGQgZGltbXRlbXAgZHJpdmVyDQo+ID4gwqAgZG9jczogQWRk
IFBFQ0kgZG9jdW1lbnRhdGlvbg0KPiA+IA0KPiA+IEphZSBIeXVuIFlvbyAoMik6DQo+ID4gwqAg
cGVjaTogQWRkIHBlY2ktYXNwZWVkIGNvbnRyb2xsZXIgZHJpdmVyDQo+ID4gwqAgZG9jczogaHdt
b246IERvY3VtZW50IFBFQ0kgZHJpdmVycw0KPiA+IA0KPiA+IMKgLi4uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcGVjaS9wZWNpLWFzcGVlZC55YW1sIHwgMTExICsrKysNCj4gPiDCoC4uLi9iaW5kaW5n
cy9wZWNpL3BlY2ktY29udHJvbGxlci55YW1swqDCoMKgwqDCoMKgwqAgfMKgIDI4ICsNCj4gPiDC
oERvY3VtZW50YXRpb24vaHdtb24vaW5kZXgucnN0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfMKgwqAgMiArDQo+ID4gwqBEb2N1bWVudGF0aW9uL2h3bW9uL3BlY2ktY3B1dGVtcC5y
c3TCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDkzICsrKysNCj4gPiDCoERvY3VtZW50YXRpb24vaHdt
b24vcGVjaS1kaW1tdGVtcC5yc3TCoMKgwqDCoMKgwqDCoMKgIHzCoCA1OCArKw0KPiA+IMKgRG9j
dW1lbnRhdGlvbi9pbmRleC5yc3TCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8wqDCoCAxICsNCj4gPiDCoERvY3VtZW50YXRpb24vcGVjaS9pbmRleC5yc3TCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxNiArDQo+ID4gwqBEb2N1bWVudGF0
aW9uL3BlY2kvcGVjaS5yc3TCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
IDQ4ICsrDQo+ID4gwqBNQUlOVEFJTkVSU8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAzMiArKw0KPiA+IMKgYXJj
aC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc0LmR0c2nCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqAgMTQgKw0KPiA+IMKgYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc1LmR0c2nCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8wqAgMTQgKw0KPiA+IMKgYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVk
LWc2LmR0c2nCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMTQgKw0KPiA+IMKgYXJjaC94
ODYvS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgwqAgMSArDQo+ID4gwqBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9jcHUuaMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDMgLQ0KPiA+IMKgYXJj
aC94ODYvaW5jbHVkZS9hc20vaW50ZWwtZmFtaWx5LmjCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE0
MSArLS0tLQ0KPiA+IMKgYXJjaC94ODYvaW5jbHVkZS9hc20vbWljcm9jb2RlLmjCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICstDQo+ID4gwqBhcmNoL3g4Ni9rdm0vY3B1aWQuaMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDMg
Ky0NCj4gPiDCoGFyY2gveDg2L2xpYi9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICstDQo+ID4gwqBkcml2ZXJzL0tjb25maWfC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgwqAgMyArDQo+ID4gwqBkcml2ZXJzL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsNCj4gPiDCoGRy
aXZlcnMvZWRhYy9tY2VfYW1kLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoMKgIDMgKy0NCj4gPiDCoGRyaXZlcnMvaHdtb24vS2NvbmZpZ8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICsNCj4gPiDC
oGRyaXZlcnMvaHdtb24vTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoMKgIDEgKw0KPiA+IMKgZHJpdmVycy9od21vbi9wZWNpL0tjb25maWfC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMzEgKysNCj4gPiDCoGRy
aXZlcnMvaHdtb24vcGVjaS9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqDCoCA3ICsNCj4gPiDCoGRyaXZlcnMvaHdtb24vcGVjaS9jb21tb24uaMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNDYgKysNCj4gPiDCoGRyaXZlcnMvaHdt
b24vcGVjaS9jcHV0ZW1wLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNTAz
DQo+ID4gKysrKysrKysrKysrKysrKysNCj4gPiDCoGRyaXZlcnMvaHdtb24vcGVjaS9kaW1tdGVt
cC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA1MDgNCj4gPiArKysrKysrKysr
KysrKysrKysNCj4gPiDCoGRyaXZlcnMvcGVjaS9LY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDM2ICsrDQo+ID4gwqBkcml2ZXJzL3Bl
Y2kvTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgIDEwICsNCj4gPiDCoGRyaXZlcnMvcGVjaS9jb250cm9sbGVyL0tjb25maWfCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxMiArDQo+ID4gwqBkcml2ZXJzL3BlY2kvY29udHJv
bGxlci9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDMgKw0KPiA+IMKg
ZHJpdmVycy9wZWNpL2NvbnRyb2xsZXIvcGVjaS1hc3BlZWQuY8KgwqDCoMKgwqDCoMKgwqAgfCA1
MDENCj4gPiArKysrKysrKysrKysrKysrKw0KPiA+IMKgZHJpdmVycy9wZWNpL2NvcmUuY8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyMjQgKysr
KysrKysNCj4gPiDCoGRyaXZlcnMvcGVjaS9jcHUuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDM0NyArKysrKysrKysrKysNCj4gPiDCoGRy
aXZlcnMvcGVjaS9kZXZpY2UuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8IDIxMSArKysrKysrKw0KPiA+IMKgZHJpdmVycy9wZWNpL2ludGVybmFsLmjC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEzNyArKysrKw0K
PiA+IMKgZHJpdmVycy9wZWNpL3JlcXVlc3QuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfCA1MDINCj4gPiArKysrKysrKysrKysrKysrKw0KPiA+IMKgZHJp
dmVycy9wZWNpL3N5c2ZzLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8wqAgODIgKysrDQo+ID4gwqBpbmNsdWRlL2xpbnV4L3BlY2ktY3B1LmjCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDM4ICsrDQo+ID4gwqBp
bmNsdWRlL2xpbnV4L3BlY2kuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCA5MyArKysrDQo+ID4gwqBpbmNsdWRlL2xpbnV4L3g4Ni9jcHUuaMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDkgKw0KPiA+
IMKgaW5jbHVkZS9saW51eC94ODYvaW50ZWwtZmFtaWx5LmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8IDE0NiArKysrKw0KPiA+IMKgbGliL0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA1ICsN
Cj4gPiDCoGxpYi9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICsNCj4gPiDCoGxpYi94ODYvTWFr
ZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHzCoMKgIDMgKw0KPiA+IMKge2FyY2gveDg2L2xpYiA9PiBsaWIveDg2fS9jcHUuY8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArLQ0KPiA+IMKgNDcgZmlsZXMgY2hh
bmdlZCwgMzkwMiBpbnNlcnRpb25zKCspLCAxNDkgZGVsZXRpb25zKC0pDQo+ID4gwqBjcmVhdGUg
bW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BlY2kvcGVjaS0N
Cj4gPiBhc3BlZWQueWFtbA0KPiA+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9wZWNpL3BlY2ktDQo+ID4gY29udHJvbGxlci55YW1sDQo+ID4g
wqBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9od21vbi9wZWNpLWNwdXRlbXAucnN0
DQo+ID4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9od21vbi9wZWNpLWRpbW10
ZW1wLnJzdA0KPiA+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vcGVjaS9pbmRl
eC5yc3QNCj4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL3BlY2kvcGVjaS5y
c3QNCj4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2h3bW9uL3BlY2kvS2NvbmZpZw0K
PiA+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaHdtb24vcGVjaS9NYWtlZmlsZQ0KPiA+
IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaHdtb24vcGVjaS9jb21tb24uaA0KPiA+IMKg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaHdtb24vcGVjaS9jcHV0ZW1wLmMNCj4gPiDCoGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2h3bW9uL3BlY2kvZGltbXRlbXAuYw0KPiA+IMKgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvcGVjaS9LY29uZmlnDQo+ID4gwqBjcmVhdGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9wZWNpL01ha2VmaWxlDQo+ID4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9wZWNpL2NvbnRyb2xsZXIvS2NvbmZpZw0KPiA+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvcGVjaS9jb250cm9sbGVyL01ha2VmaWxlDQo+ID4gwqBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9wZWNpL2NvbnRyb2xsZXIvcGVjaS1hc3BlZWQuYw0KPiA+IMKgY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvcGVjaS9jb3JlLmMNCj4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL3BlY2kvY3B1LmMNCj4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3BlY2kvZGV2
aWNlLmMNCj4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3BlY2kvaW50ZXJuYWwuaA0K
PiA+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvcGVjaS9yZXF1ZXN0LmMNCj4gPiDCoGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3BlY2kvc3lzZnMuYw0KPiA+IMKgY3JlYXRlIG1vZGUg
MTAwNjQ0IGluY2x1ZGUvbGludXgvcGVjaS1jcHUuaA0KPiA+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0
IGluY2x1ZGUvbGludXgvcGVjaS5oDQo+ID4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9s
aW51eC94ODYvY3B1LmgNCj4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L3g4
Ni9pbnRlbC1mYW1pbHkuaA0KPiA+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYi94ODYvTWFrZWZp
bGUNCj4gPiDCoHJlbmFtZSB7YXJjaC94ODYvbGliID0+IGxpYi94ODZ9L2NwdS5jICg5NSUpDQo+
ID4gDQo+IA0KDQo=
