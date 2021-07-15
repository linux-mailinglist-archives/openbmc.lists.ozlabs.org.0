Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A013CA342
	for <lists+openbmc@lfdr.de>; Thu, 15 Jul 2021 18:53:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQgRS5YxGz2yjY
	for <lists+openbmc@lfdr.de>; Fri, 16 Jul 2021 02:53:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=bT7i2Rpl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=bT7i2Rpl; dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQgR14Nypz2yX1;
 Fri, 16 Jul 2021 02:52:44 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="197772465"
X-IronPort-AV: E=Sophos;i="5.84,242,1620716400"; d="scan'208";a="197772465"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 09:51:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,242,1620716400"; d="scan'208";a="494643685"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga001.jf.intel.com with ESMTP; 15 Jul 2021 09:51:40 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 15 Jul 2021 09:51:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Thu, 15 Jul 2021 09:51:40 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 15 Jul 2021 09:51:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFG3Ie595cFvEd1m85vYQT6i1sno71ZTwQhzMJwJLwSBGXQf8XE2EVrdM1rUYzSMrPhQ8OH9+h9eNWDPXyIz2tx1FfgtHSJowb0RyikY0vRj1UqSJuNN3+J+LCt8EV4kc9tdsQmrBr6zC/RTO+b2wTs++jCAUI2bKiW01jEPFH6blxwAj19LK4k+UKiv6iTwJ283Wz2YEL0GkmfrFyJpwGAdziWFYaCjgAn/3yetcPcE7SdHOyvRAN2CVaWB6fxNxPwxOnRahNAq5bR7qfU85NrJiT7sFlZtxMbB9wVJBSEyODc6o6LwiKNEx9Ieu67VLZkSw0cm2L9cmnUksSU/Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/Xx/DXzNgrw/mctB0JKEhSB9eHabNP8idnB5ZbjFjQ=;
 b=lLfrADKsHkA6LqoVlrDVxlnl4Wlokv5RGSPl4dNTnXLH3pPGl/LUyWAL7wmae2lsO2J9BgrjCubLaYU+/Rc2RvMfcj4RqbE/3gG0cDVGyD83+0AObwtA1493Ch6nvaA2NJFotjLp+dQFtibUMdNg3Hw5m59YJi2MTd+0HjXAHADlFuebDpz5d352tRINAQoL/AbkIW2D9R8pVmvTqVWGZhG1GhsnQHFnTd9yLXuNstlB8WsZLMfO/O8R2rv7tUIRR6Kp/6BK6og/N66qW65SE5JEF4wqUc2vzl0TP+SUguvXY3oaI6eqpwUdghfEMtUprZH6vli7NMbi9Fd9Nwgn/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/Xx/DXzNgrw/mctB0JKEhSB9eHabNP8idnB5ZbjFjQ=;
 b=bT7i2RplJ3DwyTnYHyRJI84Vut6xH1vJMiLd7eAx/sgaowRNEQmimvn9bUmPUwT7C5LpcO9x7VAVboIZRurX7gL/229oSX0wU2yheu8x9AMPOxWFxUVAudNEBkdva0UnIEMpouffXw4+fwo3L3iUyhcWoZDVh7BSJBlmWOZm+xE=
Received: from SN6PR11MB2589.namprd11.prod.outlook.com (2603:10b6:805:53::12)
 by SA0PR11MB4575.namprd11.prod.outlook.com (2603:10b6:806:9b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Thu, 15 Jul
 2021 16:51:36 +0000
Received: from SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::357a:ba5:ee4f:d5f1]) by SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::357a:ba5:ee4f:d5f1%7]) with mapi id 15.20.4331.022; Thu, 15 Jul 2021
 16:51:36 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "Williams, Dan J" <dan.j.williams@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH 02/14] x86/cpu: Extract cpuid helpers to arch-independent
Thread-Topic: [PATCH 02/14] x86/cpu: Extract cpuid helpers to arch-independent
Thread-Index: AQHXd2pfXYHCbXXnwEGKQF1SxfrEOKtCtB2AgAGQZYA=
Date: Thu, 15 Jul 2021 16:51:36 +0000
Message-ID: <87be3ed7be9949f6e929c2b185dc7d623d525f8e.camel@intel.com>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-3-iwona.winiarska@intel.com>
 <c81be21327124c2269baa13741cacbd304120e7f.camel@intel.com>
In-Reply-To: <c81be21327124c2269baa13741cacbd304120e7f.camel@intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.4 (3.38.4-1.fc33) 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c887c05e-e5be-48ee-e0d8-08d947b0cf38
x-ms-traffictypediagnostic: SA0PR11MB4575:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR11MB457599C71ACF6DA45A8AA951EC129@SA0PR11MB4575.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: acCoE/onI6tzyK8i8QKNPKd0GH4JBPoSr+K/p+P/HdRyNzUV5maahg+L1MIXLqj2+M5aH5ohBE5SPAMu57EaqD705lo5KM7Xs6MVV9Xwk9zQELVRBWxYjfbZFAPkfi8zHtfCHljt16lLFe1qJ9ZsdYeUh+S3NhzL2KKw/n6rSzrCh0ZHi1/Be9gyzyN9qM3CDgbkH4+zF1YCati4ymdEn7naWboP7wn7Vj93H96k0VvrBLF2BeiwFCSRnlkOhfVDVQQ6Nvzxxc8TX4xp3cqiwhBECLEAwHQoHbnD1v6w6kYFTYH52YxksHLRKDi6+pvERgGmnipyxQ2N/d+0sKEzTrpwXFuCKckjdmDV460dRUOgJcDuWAe0tBcYypvuS9QjP2tjNb+tZvSRZH0Z3UVGooLfKdaviRu0iU29TT7FDXcP9XPplMGW5ftRYJLV9pfisJBlzZBlOq8QCXK6KLSiOIUCBMdicMQePd7PaXSpUfwwj8ze7Q8KV0cp2yodXEKqedu48PwX0OGRKE8Tk5qhzu1ssJNyj4ttzrGuLU0rYdqCnebi58y0unJg4RXGELMFAiQvs0gguv+x6gIyFg/7E7wo1ae14ibu5xJ3DsQHXuSeDjPcE4v1C475GLRTPHQVl5yvqHfdr+29bWRmQ2bly9qTTfJbvck4hLGX6tkNSMmAD8mzqTikbZZcdpnMLacaXKTeiQEneWruAvaOYO8LGA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2589.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(5660300002)(8936002)(64756008)(66946007)(86362001)(66446008)(91956017)(2906002)(36756003)(6512007)(76116006)(66556008)(186003)(83380400001)(66476007)(26005)(478600001)(38100700002)(110136005)(6506007)(7416002)(2616005)(316002)(71200400001)(122000001)(8676002)(4326008)(6486002)(54906003)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VHlBZWprUnlsSTV6QXE4elI5VTRHZEhuaTVWWFZYVmpETnM5Z3BUT20xVlZr?=
 =?utf-8?B?SmUyTWlPYVFtSUUxTmVyQXZQVmVJNk8yTGZUeVRURFdmUnVaak5EMVZtNkRF?=
 =?utf-8?B?WHd4ZG1xWXZLSlJyWWROZGhtRmN5RVVRNzg2cGduV2U4Q284L21pVk9SN3c4?=
 =?utf-8?B?bHlNOFd6ZERydlNUNER6UzFzaFpxR0I4cWlkTFZyY282bHdwUU12WkNFR3N6?=
 =?utf-8?B?OEdCVzZ2SE5SeEQ5cE1Hcjl4VTV4Tm5uUXdubzZDdUQ5VTNldk5xVWdGNEdL?=
 =?utf-8?B?WklybXBrSVlZNDU4TUwrOE9IdElXaG9FbjlaMzFYMTB4S09oVDkwR0dOdDFH?=
 =?utf-8?B?WlZGb2xPSVFEWXRmWGs5UWFGZm1oaFJETUN2VHlqT092V1JUWjZIZFJocjdz?=
 =?utf-8?B?aGNvRjBtbDRwWHVpQVdydjdhRVNwdWREQjdqOUtPcTNBa1ZHNjdwTldGbXht?=
 =?utf-8?B?eDhJZGdxejRjTVhTQW84WVRPV3pkS0t6TU1iTGxqdFlQQkdhL0FabjRMUDFs?=
 =?utf-8?B?Q3BaOXo2R1Q5bGpnZ2tHTWZRaHFYSFp5NFQvVHpkeUFEL1E3bTI3QWRhMHll?=
 =?utf-8?B?R1VSUFdSQWdMZDdZaUhvMEFyMEJ6aW9VK0xJWEtDZWZCbmxvSnNXU0dROEpZ?=
 =?utf-8?B?dDVtVlRzVzltanJ0Q3dGbTYweWpsNFQwVDZsd3FoS2RKdHJGZkNyc1Y0OFo4?=
 =?utf-8?B?T05mNGZXV3RZY0lIOEs1T1JCNGhqSmtRQ0QxSXJHQmpTT2Z0bzRPcnBaQ0ty?=
 =?utf-8?B?M29lRERWZmNIVVMwZld4UmdacXNaTElmTjFCYzk3YUNxdndyWGRmZVBKVlpZ?=
 =?utf-8?B?Q3dZSGh3RytVMEQ5cmRNMHdMUDhYYWZqTXNNODNVcnQ0UGFPTmlmTVdrSzF4?=
 =?utf-8?B?L3QyZWdFS0FETjZWU3Zsa3ZFdUltRDcxMGRYekEya1BnNzdjbHkzVkVvQVZ3?=
 =?utf-8?B?bzFnbUluOVh5aCt2N0xOWHF1T1NLc1ZOaGVhYWlsUEI2QTZPNTVNTkp6Q3gr?=
 =?utf-8?B?cDZ4VEl5dS9yZXpOckFTaHl6ZG9wdWdsU0l0QXFLa1VRQ3hZeG5MS1ZHNUwy?=
 =?utf-8?B?L1JWdGlJcnRxdFJKVTExVzNDcW9HVFRWWUJ3Vnc3WkJQQlVPVVoyR3R5bitz?=
 =?utf-8?B?dG9sMGlqYW5nL1NlV1pBWXpod29qdXB6Mm9ldUY0aVRjTGVuVEZzNzVHSDJv?=
 =?utf-8?B?aTZsUTV1QzN5VnJybFJTUkhhUkRHUkJHeXhrc0J4YW5QVHFoMHpnaUNQZHBP?=
 =?utf-8?B?LzVKSS9mN1VGQ0pFTXFGSTU5MHVobFZRM3drb1VUMTIzY1RKLzJ6VDVkWjJK?=
 =?utf-8?B?cVgzb29GM2t0cG9wTGdDaWl4Qlg0NkNKcWFNcUw2ZmtvenVCOUlpN2ZNa0Jv?=
 =?utf-8?B?WU43YW8vM3VPc25BMC9jZzFwV1Fsb05hblJreUVqMWFNZXdVM1dNaG8wa2tJ?=
 =?utf-8?B?dzlJWnJTK2dqaUlZczdldkZRb01OMDlLWUpJM2ErUGhmT1JKWDJuWHd6ZnpK?=
 =?utf-8?B?NEtJOWdCbG41d094ZDFhVGRwZFNiQnBYaGRzd2pMdndqYjJGb1FBNitaQkVF?=
 =?utf-8?B?UWtZSVVhTDQyU1U1VW44Sld2RmF4VS81RVVGeml3aCtOM1A0R3FmQWI5SHlq?=
 =?utf-8?B?MUdmSTdCZVdBcjRrMy9ydDVrVktvMHlTemJQbURBUWJNdElZZFpKQUNnM25J?=
 =?utf-8?B?TkljZ2xpdFBLOWNmNUdGK0FZbmNOc0Q5M3NLbWlBNW55MU01RmdYRENwRXdi?=
 =?utf-8?B?TEt5c3RJTTNRb0RHSmEzak1wcFZCMkUrWU9GN1FaKzRUTVU4WjlBS2RJSDRM?=
 =?utf-8?B?cXJvaytEWFdxakdmTjRYZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <127641799A243544B6B0508F06CAACAB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2589.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c887c05e-e5be-48ee-e0d8-08d947b0cf38
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2021 16:51:36.4824 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fGMHAEeLWuuZMspIODuNKjoxyxQKv69MV17s5MOPlFReFCLtwTCoJdiQuTGBsbWkCGlQzeq3NlIT11AE9SVkXbBP7jgDC1hNznrCyXxwnqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4575
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
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "yazen.ghannam@amd.com" <yazen.ghannam@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gV2VkLCAyMDIxLTA3LTE0IGF0IDE2OjU4ICswMDAwLCBXaWxsaWFtcywgRGFuIEogd3JvdGU6
DQo+IE9uIFR1ZSwgMjAyMS0wNy0xMyBhdCAwMDowNCArMDIwMCwgSXdvbmEgV2luaWFyc2thIHdy
b3RlOg0KPiA+IEJhc2Vib2FyZCBtYW5hZ2VtZW50IGNvbnRyb2xsZXJzIChCTUMpIG9mdGVuIHJ1
biBMaW51eCBidXQgYXJlDQo+ID4gdXN1YWxseQ0KPiA+IGltcGxlbWVudGVkIHdpdGggbm9uLVg4
NiBwcm9jZXNzb3JzLiBUaGV5IGNhbiB1c2UgUEVDSSB0byBhY2Nlc3MNCj4gPiBwYWNrYWdlDQo+
ID4gY29uZmlnIHNwYWNlIChQQ1MpIHJlZ2lzdGVycyBvbiB0aGUgaG9zdCBDUFUgYW5kIHNpbmNl
IHNvbWUNCj4gPiBpbmZvcm1hdGlvbiwNCj4gPiBlLmcuIGZpZ3VyaW5nIG91dCB0aGUgY29yZSBj
b3VudCwgY2FuIGJlIG9idGFpbmVkIHVzaW5nIGRpZmZlcmVudA0KPiA+IHJlZ2lzdGVycyBvbiBk
aWZmZXJlbnQgQ1BVIGdlbmVyYXRpb25zLCB0aGV5IG5lZWQgdG8gZGVjb2RlIHRoZQ0KPiA+IGZh
bWlseQ0KPiA+IGFuZCBtb2RlbC4NCj4gPiANCj4gPiBUaGUgZm9ybWF0IG9mIFBhY2thZ2UgSWRl
bnRpZmllciBQQ1MgcmVnaXN0ZXIgdGhhdCBkZXNjcmliZXMgQ1BVSUQNCj4gPiBpbmZvcm1hdGlv
biBoYXMgdGhlIHNhbWUgbGF5b3V0IGFzIENQVUlEXzEuRUFYLCBzbyBsZXQncyBhbGxvdyB0bw0K
PiA+IHJldXNlDQo+ID4gY3B1aWQgaGVscGVycyBieSBtYWtpbmcgaXQgYXZhaWxhYmxlIGZvciBv
dGhlciBhcmNoaXRlY3R1cmVzIGFzDQo+ID4gd2VsbC4NCj4gDQo+IEp1c3Qgc29tZSBtaW5vciBj
b21tZW50cyBiZWxvdy4NCj4gDQo+IFlvdSBjYW4gZ28gYWhlYWQgYW5kIGFkZDoNCj4gDQo+IFJl
dmlld2VkLWJ5OiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4NCj4gDQo+
ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSXdvbmEgV2luaWFyc2thIDxpd29uYS53aW5pYXJza2FA
aW50ZWwuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBUb255IEx1Y2sgPHRvbnkubHVja0BpbnRlbC5j
b20+DQo+ID4gLS0tDQo+ID4gwqBNQUlOVEFJTkVSU8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8IDIgKysNCj4gPiDCoGFyY2gveDg2L0tjb25maWfCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEgKw0KPiA+IMKgYXJjaC94ODYvaW5jbHVkZS9hc20v
Y3B1LmjCoMKgwqDCoMKgwqAgfCAzIC0tLQ0KPiA+IMKgYXJjaC94ODYvaW5jbHVkZS9hc20vbWlj
cm9jb2RlLmggfCAyICstDQo+ID4gwqBhcmNoL3g4Ni9rdm0vY3B1aWQuaMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8IDMgKystDQo+ID4gwqBhcmNoL3g4Ni9saWIvTWFrZWZpbGXCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHwgMiArLQ0KPiA+IMKgZHJpdmVycy9lZGFjL21jZV9hbWQuY8KgwqDCoMKg
wqDCoMKgwqDCoMKgIHwgMyArLS0NCj4gPiDCoGluY2x1ZGUvbGludXgveDg2L2NwdS5owqDCoMKg
wqDCoMKgwqDCoMKgIHwgOSArKysrKysrKysNCj4gPiDCoGxpYi9LY29uZmlnwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNSArKysrKw0KPiA+IMKgbGliL01ha2Vm
aWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIgKysNCj4gPiDC
oGxpYi94ODYvTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDMgKysr
DQo+ID4gwqB7YXJjaC94ODYvbGliID0+IGxpYi94ODZ9L2NwdS5jwqAgfCAyICstDQo+ID4gwqAx
MiBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPiA+IMKg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgveDg2L2NwdS5oDQo+ID4gwqBjcmVhdGUg
bW9kZSAxMDA2NDQgbGliL3g4Ni9NYWtlZmlsZQ0KPiA+IMKgcmVuYW1lIHthcmNoL3g4Ni9saWIg
PT4gbGliL3g4Nn0vY3B1LmMgKDk1JSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5F
UlMgYi9NQUlOVEFJTkVSUw0KPiA+IGluZGV4IGVjNTk4N2EwMDgwMC4uNmY3N2FhY2EyYTMwIDEw
MDY0NA0KPiA+IC0tLSBhL01BSU5UQUlORVJTDQo+ID4gKysrIGIvTUFJTlRBSU5FUlMNCj4gPiBA
QCAtMjAwODEsNiArMjAwODEsOCBAQCBUOsKgwqDCoMKgwqDCoGdpdA0KPiA+IGdpdDovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90aXAvdGlwLmdpdCB4ODYvY29yZQ0K
PiA+IMKgRjrCoMKgwqDCoMKgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3g4Ni8N
Cj4gPiDCoEY6wqDCoMKgwqDCoERvY3VtZW50YXRpb24veDg2Lw0KPiA+IMKgRjrCoMKgwqDCoMKg
YXJjaC94ODYvDQo+ID4gK0Y6wqDCoMKgwqDCoGluY2x1ZGUvbGludXgveDg2Lw0KPiANCj4gRG9l
c24ndCB0aGlzIHRlY2huaWNhbGx5IGJlbG9uZyBpbiBwYXRjaDEgc2luY2UgdGhhdCBvbmUgaW50
cm9kdWNlZA0KPiB0aGUgZGlyZWN0b3J5Pw0KDQpJbiB0aGUgZmlyc3QgcGF0Y2ggd2UgYXJlIG1v
dmluZyBhcmNoL3g4Ni9pbmNsdWRlL2ludGVsLWZhbWlseS5oDQpjb250ZW50IHRvIGEgbmV3IGZp
bGUsIHdoaWNoIGlzIHdoeSBJIHVwZGF0ZWQgTUFJTlRBSU5FUlMganVzdCBmb3INCiJJTlRFTCBD
UFUgZmFtaWx5IG1vZGVsIG51bWJlcnMiLg0KDQpIZXJlIHdlJ3JlIG1vdmluZyBvdGhlciBjb250
ZW50IHRoYXQgd2FzIG1haW50YWluZWQgdW5kZXIgYXJjaC94ODYNCndoaWNoIGlzIHdoeSBJIGV4
dGVuZGVkICJYODYgQVJDSElURUNUVVJFICgzMi1CSVQgQU5EIDY0LUJJVCkiLg0KDQpCdXQgSSBh
Z3JlZSAtICJYODYgQVJDSElURUNUVVJFIiBpbmNsdWRlcyAiSU5URUwgQ1BVIGZhbWlseSIsIHNv
IEkNCmd1ZXNzIGl0IG1ha2VzIHNlbnNlIHRvIGFkZCBib3RoIGluIHByZXZpb3VzIHBhdGNoIChv
dGhlcndpc2UNCmdldF9tYWludGFpbmVyLnBsIHdvdWxkIHByb2R1Y2UgZGlmZmVyZW50IG91dHB1
dCBmb3INCmluY2x1ZGUvbGludXgveDg2L2ludGVsLWZhbWlseS5oIHVudGlsIHRoaXMgcGF0Y2gg
aXMgYXBwbGllZCkuDQoNClRoYW5rIHlvdQ0KLUl3b25hDQoNCj4gDQo+ID4gK0Y6wqDCoMKgwqDC
oGxpYi94ODYvDQo+ID4gwqANCj4gPiDCoFg4NiBFTlRSWSBDT0RFDQo+ID4gwqBNOsKgwqDCoMKg
wqBBbmR5IEx1dG9taXJza2kgPGx1dG9Aa2VybmVsLm9yZz4NCj4gPiBkaWZmIC0tZ2l0IGEvYXJj
aC94ODYvS2NvbmZpZyBiL2FyY2gveDg2L0tjb25maWcNCj4gPiBpbmRleCA0OTI3MDY1NWU4Mjcu
Ljc1MGY5Yjg5NmU0ZiAxMDA2NDQNCj4gPiAtLS0gYS9hcmNoL3g4Ni9LY29uZmlnDQo+ID4gKysr
IGIvYXJjaC94ODYvS2NvbmZpZw0KPiA+IEBAIC0xNDEsNiArMTQxLDcgQEAgY29uZmlnIFg4Ng0K
PiA+IMKgwqDCoMKgwqDCoMKgwqBzZWxlY3QgR0VORVJJQ19JUlFfUFJPQkUNCj4gPiDCoMKgwqDC
oMKgwqDCoMKgc2VsZWN0IEdFTkVSSUNfSVJRX1JFU0VSVkFUSU9OX01PREUNCj4gPiDCoMKgwqDC
oMKgwqDCoMKgc2VsZWN0IEdFTkVSSUNfSVJRX1NIT1cNCj4gPiArwqDCoMKgwqDCoMKgwqBzZWxl
Y3QgR0VORVJJQ19MSUJfWDg2DQo+ID4gwqDCoMKgwqDCoMKgwqDCoHNlbGVjdCBHRU5FUklDX1BF
TkRJTkdfSVJRwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIFNNUA0KPiA+IMKgwqDCoMKg
wqDCoMKgwqBzZWxlY3QgR0VORVJJQ19QVERVTVANCj4gPiDCoMKgwqDCoMKgwqDCoMKgc2VsZWN0
IEdFTkVSSUNfU01QX0lETEVfVEhSRUFEDQo+ID4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1
ZGUvYXNtL2NwdS5oDQo+ID4gYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9jcHUuaA0KPiA+IGluZGV4
IDMzZDQxZTM1MGM3OS4uMmE2NjNhMDVhNzk1IDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gveDg2L2lu
Y2x1ZGUvYXNtL2NwdS5oDQo+ID4gKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vY3B1LmgNCj4g
PiBAQCAtMzcsOSArMzcsNiBAQCBleHRlcm4gaW50IF9kZWJ1Z19ob3RwbHVnX2NwdShpbnQgY3B1
LCBpbnQNCj4gPiBhY3Rpb24pOw0KPiA+IMKgDQo+ID4gwqBpbnQgbXdhaXRfdXNhYmxlKGNvbnN0
IHN0cnVjdCBjcHVpbmZvX3g4NiAqKTsNCj4gPiDCoA0KPiA+IC11bnNpZ25lZCBpbnQgeDg2X2Zh
bWlseSh1bnNpZ25lZCBpbnQgc2lnKTsNCj4gPiAtdW5zaWduZWQgaW50IHg4Nl9tb2RlbCh1bnNp
Z25lZCBpbnQgc2lnKTsNCj4gPiAtdW5zaWduZWQgaW50IHg4Nl9zdGVwcGluZyh1bnNpZ25lZCBp
bnQgc2lnKTsNCj4gPiDCoCNpZmRlZiBDT05GSUdfQ1BVX1NVUF9JTlRFTA0KPiA+IMKgZXh0ZXJu
IHZvaWQgX19pbml0IHNsZF9zZXR1cChzdHJ1Y3QgY3B1aW5mb194ODYgKmMpOw0KPiA+IMKgZXh0
ZXJuIHZvaWQgc3dpdGNoX3RvX3NsZCh1bnNpZ25lZCBsb25nIHRpZm4pOw0KPiA+IGRpZmYgLS1n
aXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9taWNyb2NvZGUuaA0KPiA+IGIvYXJjaC94ODYvaW5j
bHVkZS9hc20vbWljcm9jb2RlLmgNCj4gPiBpbmRleCBhYjQ1YTIyMGZhYzQuLjRiMGVhYmY2M2I5
OCAxMDA2NDQNCj4gPiAtLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9taWNyb2NvZGUuaA0KPiA+
ICsrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL21pY3JvY29kZS5oDQo+ID4gQEAgLTIsOSArMiw5
IEBADQo+ID4gwqAjaWZuZGVmIF9BU01fWDg2X01JQ1JPQ09ERV9IDQo+ID4gwqAjZGVmaW5lIF9B
U01fWDg2X01JQ1JPQ09ERV9IDQo+ID4gwqANCj4gPiAtI2luY2x1ZGUgPGFzbS9jcHUuaD4NCj4g
PiDCoCNpbmNsdWRlIDxsaW51eC9lYXJseWNwaW8uaD4NCj4gPiDCoCNpbmNsdWRlIDxsaW51eC9p
bml0cmQuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L3g4Ni9jcHUuaD4NCj4gDQo+IEhhcyB0aGlz
IHBhdGNoIHNldCByZWNlaXZlZCBhIGJ1aWxkIHN1Y2Nlc3Mgbm90aWZpY2F0aW9uIGZyb20gdGhl
DQo+IGtidWlsZCByb2JvdD8gSS5lLiBhcmUgeW91IHN1cmUgdGhhdCB0aGlzIGluY2x1ZGUgd2Fz
IG9ubHkgaGVyZSBmb3INCj4gdGhlDQo+IA0KPiB1bnNpZ25lZCBpbnQgeDg2X2ZhbWlseSh1bnNp
Z25lZCBpbnQgc2lnKTsNCj4gdW5zaWduZWQgaW50IHg4Nl9tb2RlbCh1bnNpZ25lZCBpbnQgc2ln
KTsNCj4gdW5zaWduZWQgaW50IHg4Nl9zdGVwcGluZyh1bnNpZ25lZCBpbnQgc2lnKTsNCj4gDQo+
IC4uLmhlbHBlcnMuIEFsbCB0aGUgb3RoZXIgcmVwbGFjZW1lbnRzIGxvb2sgdHJpdmlhbGx5IHZl
cmlmaWFibGUgYXMNCj4gb25seSBuZWVkaW5nIHRoZXNlIDMgaGVscGVycy4NCj4gDQo+ID4gwqAN
Cj4gPiDCoHN0cnVjdCB1Y29kZV9wYXRjaCB7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBs
aXN0X2hlYWQgcGxpc3Q7DQo+ID4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9jcHVpZC5oIGIv
YXJjaC94ODYva3ZtL2NwdWlkLmgNCj4gPiBpbmRleCBjOTllZGZmZjdmODIuLmJmMDcwZDJhMjE3
NSAxMDA2NDQNCj4gPiAtLS0gYS9hcmNoL3g4Ni9rdm0vY3B1aWQuaA0KPiA+ICsrKyBiL2FyY2gv
eDg2L2t2bS9jcHVpZC5oDQo+ID4gQEAgLTQsMTAgKzQsMTEgQEANCj4gPiDCoA0KPiA+IMKgI2lu
Y2x1ZGUgIng4Ni5oIg0KPiA+IMKgI2luY2x1ZGUgInJldmVyc2VfY3B1aWQuaCINCj4gPiAtI2lu
Y2x1ZGUgPGFzbS9jcHUuaD4NCj4gPiDCoCNpbmNsdWRlIDxhc20vcHJvY2Vzc29yLmg+DQo+ID4g
wqAjaW5jbHVkZSA8dWFwaS9hc20va3ZtX3BhcmEuaD4NCj4gPiDCoA0KPiA+ICsjaW5jbHVkZSA8
bGludXgveDg2L2NwdS5oPg0KPiA+ICsNCj4gPiDCoGV4dGVybiB1MzIga3ZtX2NwdV9jYXBzW05S
X0tWTV9DUFVfQ0FQU10gX19yZWFkX21vc3RseTsNCj4gPiDCoHZvaWQga3ZtX3NldF9jcHVfY2Fw
cyh2b2lkKTsNCj4gPiDCoA0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9saWIvTWFrZWZpbGUg
Yi9hcmNoL3g4Ni9saWIvTWFrZWZpbGUNCj4gPiBpbmRleCBiYWQ0ZGVlNGYwZTQuLmZkNzNjMWI3
MmMzZSAxMDA2NDQNCj4gPiAtLS0gYS9hcmNoL3g4Ni9saWIvTWFrZWZpbGUNCj4gPiArKysgYi9h
cmNoL3g4Ni9saWIvTWFrZWZpbGUNCj4gPiBAQCAtNDEsNyArNDEsNyBAQCBjbGVhbi1maWxlcyA6
PSBpbmF0LXRhYmxlcy5jDQo+ID4gwqANCj4gPiDCoG9iai0kKENPTkZJR19TTVApICs9IG1zci1z
bXAubyBjYWNoZS1zbXAubw0KPiA+IMKgDQo+ID4gLWxpYi15IDo9IGRlbGF5Lm8gbWlzYy5vIGNt
ZGxpbmUubyBjcHUubw0KPiA+ICtsaWIteSA6PSBkZWxheS5vIG1pc2MubyBjbWRsaW5lLm8NCj4g
PiDCoGxpYi15ICs9IHVzZXJjb3B5XyQoQklUUykubyB1c2VyY29weS5vIGdldHVzZXIubyBwdXR1
c2VyLm8NCj4gPiDCoGxpYi15ICs9IG1lbWNweV8kKEJJVFMpLm8NCj4gPiDCoGxpYi0kKENPTkZJ
R19BUkNIX0hBU19DT1BZX01DKSArPSBjb3B5X21jLm8gY29weV9tY182NC5vDQo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZWRhYy9tY2VfYW1kLmMgYi9kcml2ZXJzL2VkYWMvbWNlX2FtZC5jDQo+
ID4gaW5kZXggMjdkNTY5MjBiNDY5Li5mNTQ1ZjVmYWQwMmMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJp
dmVycy9lZGFjL21jZV9hbWQuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZWRhYy9tY2VfYW1kLmMNCj4g
PiBAQCAtMSw4ICsxLDcgQEANCj4gPiDCoC8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wLW9ubHkNCj4gPiDCoCNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gPiDCoCNpbmNsdWRl
IDxsaW51eC9zbGFiLmg+DQo+ID4gLQ0KPiA+IC0jaW5jbHVkZSA8YXNtL2NwdS5oPg0KPiA+ICsj
aW5jbHVkZSA8bGludXgveDg2L2NwdS5oPg0KPiA+IMKgDQo+ID4gwqAjaW5jbHVkZSAibWNlX2Ft
ZC5oIg0KPiA+IMKgDQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgveDg2L2NwdS5oIGIv
aW5jbHVkZS9saW51eC94ODYvY3B1LmgNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGlu
ZGV4IDAwMDAwMDAwMDAwMC4uNWYzODNkNDc4ODZkDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsr
KyBiL2luY2x1ZGUvbGludXgveDg2L2NwdS5oDQo+ID4gQEAgLTAsMCArMSw5IEBADQo+ID4gKy8q
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgKi8NCj4gPiArI2lmbmRlZiBf
TElOVVhfWDg2X0NQVV9IDQo+ID4gKyNkZWZpbmUgX0xJTlVYX1g4Nl9DUFVfSA0KPiA+ICsNCj4g
PiArdW5zaWduZWQgaW50IHg4Nl9mYW1pbHkodW5zaWduZWQgaW50IHNpZyk7DQo+ID4gK3Vuc2ln
bmVkIGludCB4ODZfbW9kZWwodW5zaWduZWQgaW50IHNpZyk7DQo+ID4gK3Vuc2lnbmVkIGludCB4
ODZfc3RlcHBpbmcodW5zaWduZWQgaW50IHNpZyk7DQo+ID4gKw0KPiA+ICsjZW5kaWYgLyogX0xJ
TlVYX1g4Nl9DUFVfSCAqLw0KPiA+IGRpZmYgLS1naXQgYS9saWIvS2NvbmZpZyBiL2xpYi9LY29u
ZmlnDQo+ID4gaW5kZXggZDI0MWZlNDc2ZmRhLi5jYzI4YmMxZjJkODQgMTAwNjQ0DQo+ID4gLS0t
IGEvbGliL0tjb25maWcNCj4gPiArKysgYi9saWIvS2NvbmZpZw0KPiA+IEBAIC03MTgsMyArNzE4
LDggQEAgY29uZmlnIFBMRE1GVw0KPiA+IMKgDQo+ID4gwqBjb25maWcgQVNOMV9FTkNPREVSDQo+
ID4gwqDCoMKgwqDCoMKgwqAgdHJpc3RhdGUNCj4gPiArDQo+ID4gK2NvbmZpZyBHRU5FUklDX0xJ
Ql9YODYNCj4gPiArwqDCoMKgwqDCoMKgwqBib29sDQo+ID4gK8KgwqDCoMKgwqDCoMKgZGVwZW5k
cyBvbiBYODYNCj4gPiArwqDCoMKgwqDCoMKgwqBkZWZhdWx0IG4NCj4gDQo+IE5vIG5lZWQgZm9y
IGEgImRlZmF1bHQgbiIgbGluZS4gT21pdHRpbmcgYSBkZWZhdWx0IGlzIHRoZSBzYW1lIGFzDQo+
ICJkZWZhdWx0IG4iLg0KPiANCg0K
