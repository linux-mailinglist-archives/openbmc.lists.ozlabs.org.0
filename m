Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7BF3DBF77
	for <lists+openbmc@lfdr.de>; Fri, 30 Jul 2021 22:15:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GbzDP6LWsz3cLp
	for <lists+openbmc@lfdr.de>; Sat, 31 Jul 2021 06:15:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=hl50ZVfe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=hl50ZVfe; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GbzD51DJ4z2xdM;
 Sat, 31 Jul 2021 06:15:32 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10061"; a="212888100"
X-IronPort-AV: E=Sophos;i="5.84,282,1620716400"; d="scan'208";a="212888100"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2021 13:14:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,282,1620716400"; d="scan'208";a="477103791"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 30 Jul 2021 13:14:29 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 30 Jul 2021 13:14:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Fri, 30 Jul 2021 13:14:29 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 30 Jul 2021 13:14:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fhh+LxGvg+3CKQHiKofTPc0iKJwJ8RGn9Ok0jiJXJwhQiIY8MEPelxwtwrP8n38LPnixhbXWrUeutnr1N9WQ6PzK6STego0axibFWJSKOm2WkUFNIuvCpsPRsr+4vNd8UJUE729xstWXSiQvAej8ys4fCrHfqyi3bG/EJZ3NSxSdWja9nLM7QYe6OM6+p5aRGmB/AIODQAHSAhI4Pq/ViHeNzeOIQBK1HSjZdWCLKE74Mqo9PT+VfEFUHfXm6XzqZBedK7vjwy4HfWqqMzs7v5zJX0x5m4sO2vPYDDAqcMYagr3n9XTOTa0Zvjs/WEGj580eLPNhfoQpMkUTjXlmzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzav6wS+vT8BTQwVAOnffzuQDge77ng+XPdJjm2IDUk=;
 b=oH2AQVTYWiwe4AQzbNUIHAELBsuRWut+L856bjTj0MOASKDyoq64Gh16s5IffqHb4eVhiAD2WK7ABKT9kLck6ulzZy4rUl0gHlrhSkNJbnaXpFvuQcpLMRvHK+GJmaGy0/9RJNY1CeLj5Q+l3Z2urMBmCFwFuVbBPFHbrJWOYPX7fDkCdyOQon2rUz7xTUx77IgI5mnMfL+O1zXzekY3qTTb1Svl5b7N89SOW3HV+huzJTPz+2vgRgtnaQ4YESrx3kA/z72nJ9cQfxYIbw+e19bgH+zjq8OrN8RMv84Zj4ifpMegxwLMZepF42OqPUNySCMeYEnRO0gHsczBhJGNEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzav6wS+vT8BTQwVAOnffzuQDge77ng+XPdJjm2IDUk=;
 b=hl50ZVfe2MXNcHWHZ9qVm7W4dEjNrelKZxrtSpf3RXjv8HWL7NFp+E2O6Dg/vrCSR5EkKpfgXUkJq8HOKsplOyCKP+f1g+duxAdZkJCQ7khHZ7W7Qc8g6z8mCyHqsAu2GFXYOoBTVS/56RlodQZjghYWqhIJwfI5mEwguwjuRVI=
Received: from SN6PR11MB2589.namprd11.prod.outlook.com (2603:10b6:805:53::12)
 by SA0PR11MB4557.namprd11.prod.outlook.com (2603:10b6:806:96::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17; Fri, 30 Jul
 2021 20:14:26 +0000
Received: from SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::6e:364a:dc09:3d35]) by SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::6e:364a:dc09:3d35%5]) with mapi id 15.20.4373.021; Fri, 30 Jul 2021
 20:14:26 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "d.mueller@elsoft.ch" <d.mueller@elsoft.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH 10/14] peci: Add peci-cpu driver
Thread-Topic: [PATCH 10/14] peci: Add peci-cpu driver
Thread-Index: AQHXd2r1hRGBqT5GKk6Tgq1RBp6qYKtWwvCAgAVNNYA=
Date: Fri, 30 Jul 2021 20:14:26 +0000
Message-ID: <a6b25deb2b9c7690270c9fdd619d980e6e26289f.camel@intel.com>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-11-iwona.winiarska@intel.com>
 <26dbd0d3-c326-96a5-2ec7-4fc3387865e9@elsoft.ch>
In-Reply-To: <26dbd0d3-c326-96a5-2ec7-4fc3387865e9@elsoft.ch>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.3 (3.40.3-1.fc34) 
authentication-results: elsoft.ch; dkim=none (message not signed)
 header.d=none;elsoft.ch; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7302225-2717-4e0a-bd60-08d95396a128
x-ms-traffictypediagnostic: SA0PR11MB4557:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR11MB4557DCC301A9FC646C6E6D02ECEC9@SA0PR11MB4557.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jjdma0BgPRR9ms5fVTqBVlL0OvpukgzEyGUIyfu5WHDAPfvSl5AelqjoffcRKg/fdMWCVyROBGi+fiDF9FCOi5/IEAnEpwvV+pkA4A2pkDBOcTp8HS0fuXwF2yyXqOOVYH5YUecJhXfIadr3Lg1lCGnSvov0GSHCoVFsa0NeO6fgU7lu2DDleuGoR87Ay9IOqlvR+xLLkEIjB0UOcofi9mbPiEumn+J80pvsx/eoV17/949AvDxBmQzCBZW708z94Dp1X54VAOl0qvYtPervXKLwxCc6OjJr+c3olKxCp0hFzVIdXEKWB65ZP7REgcxFzY8JYsbWpqAVrY6WsPtOD7A+bnL0GNoLuMPrVHYkb3If1hU0554dC3J9SmHXGeR8RpsEwyIjQ3WJz1ak7AEc4xCaGzeulBVvmcawDKhATo2e4C3gvf8Ep48p6jM1gY0BVfsWMc1B1AwFE28vyTI8z8v+8AMRtLyyc+Qh73c2Iz/e/TROzs4HuLgbxdDheg5nXWS0CWXOgHCAfVKdnCnA0L+buYmwEXKh75AE5u1WsulRNKLXmtCVX+rTak/fqPGiF7lmmDiDPAmYQ3CO9XytCI5aWX/+agOkBwy0FVqRcWH27JbArJBTneqn0uA6+1yvihkATkc1zyxM8zBSL4tcUDBrrdJgK8Ad+CvZzalmwVNDoTd/8aUlSj8x8O+ckt9ycMCYrXyOzT+Sksltfc91HA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2589.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(76116006)(316002)(71200400001)(4744005)(4326008)(122000001)(66946007)(66446008)(2906002)(6486002)(2616005)(66556008)(38100700002)(66476007)(64756008)(186003)(91956017)(478600001)(36756003)(7416002)(6506007)(38070700005)(8676002)(26005)(6512007)(86362001)(110136005)(54906003)(5660300002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OUJra2REUHFvc0VWZUVUUmRRTDJFa2VQa0FhRDhDL2h0NEhKaFpyN0hrVnRr?=
 =?utf-8?B?Mzh4Z0JBL1huOThxMXpXcDJmb0thUEdNQU4ybDJ1QXQzc00vTWJkeS9CR2Iy?=
 =?utf-8?B?Sk9GQlhzWFBuVkR6NjBuM1BpTXFJM3cvRmt3UkM3MXZlbUpaazZjUVNGeVZH?=
 =?utf-8?B?UGswUVo1U3p2bTdsWUtXVHNxZDhNbVFvZXBGZWg1c1ZhbHFLaEVOelRCVjJr?=
 =?utf-8?B?U0pURUFBWExzWUhiNVlSdFphb3BaSEd3ZWRyOUM3MTV2T1FQU1p1KzJSNGVL?=
 =?utf-8?B?aWRLa0R0cVR2ZjFaVnRFRHdrdVlld0xGOHlGdTZ3S2dXTFpxSWV2bkdUMDJ1?=
 =?utf-8?B?ODVHQktIM3JiaGdOWG1Xd1YrOHZ3VG0wWDlJVWNBeG5UYWwzRmh6enNHUElO?=
 =?utf-8?B?UmxGenJ1eVVjVktxY2R3Y1dmcjVlK1JraGpCY3l2WVZmTkRrQW45OHN6VkhL?=
 =?utf-8?B?YkREdUUrUGN0YUJZODNaNlAvMkkyWnlqcHFua0dYYkcvL2tLYzhFYjAvYVA5?=
 =?utf-8?B?a2hOa1VVZHZ0OUM4Z1RuckgzUmtvYXZub0p0T3RrbUNINTIrUWFXZ0xhdUxp?=
 =?utf-8?B?STdWajJiMWhxVHpmR1M2NHlOZlJJMXhxK3JRblphNlRPbFR4QThBbm5MNVIy?=
 =?utf-8?B?c0c1N0R4WnlWQXUwSU5DRERwZGFvSnZMY2M5d1MzNmxvR2JBSmNGaE94S3J5?=
 =?utf-8?B?QjNuUzNZeE12QzVtR1BHNURPSkdCZlMrcUV4dnVEb1g4RzBGYnFTam15N2p2?=
 =?utf-8?B?ZTBFeWZPTDRINVNRbEhaeUZRS28rU1cxRHJPTnRPcWpBTldmU0s1Z0dWbWw1?=
 =?utf-8?B?UElpTVExblBkVXZNeW9VOS9oSmtrRC9XdEoyaFl3dFRNamtVdmdGRkZoc1RC?=
 =?utf-8?B?azRJWVBzN0sxRXRkQ2dFVGRsbE12UDNhNHRGRGNacTZjb3dMaGxRK25qNkZY?=
 =?utf-8?B?YStkVGRmQThrbld3YVpablplL3pFNWFJR2Y2bzhDVzFFKy84alNKYU9SdTZy?=
 =?utf-8?B?aU14UFQ3VTMwOUdPdlNVSlFFQWljR3IxdERMbXJ4eXFiUmZVUlgwaUludzVz?=
 =?utf-8?B?ZUwyN0FaaXJlZWd5aVlkZ3BuYU5zVGJRTHNiNlp3ZkVHNG1CWFNhMmNGUnFy?=
 =?utf-8?B?cnhLZEhBM0VZd0loTFBwOHpvL3ZhRHJKTXM3bWRXSzY4NDZ5cTg4SXNybllV?=
 =?utf-8?B?bFBPOU0yeDliNEFkRWE5RWIySGMwRGY3MVJWNXA5WlQvK3N0K3VsNDZjNWFS?=
 =?utf-8?B?a3V2cVplSXdtam5VMTJTSjhxdGdiZ2NmTWJYdThvNi9iN0lNMWV2VU4vRHpB?=
 =?utf-8?B?Z0dXNXhXb3kxMDV2bU9TMkxic0t0dTFuZ0ZNeFpFR3VySG05TU5ySzZFenJj?=
 =?utf-8?B?QlptN2ZiUDE5bUgwU2thUmtIZ0txaG9aV0tLc3hRMGljS045MHJPK1QrQWkx?=
 =?utf-8?B?d1huR2JwTVhoWUxKdkJUT2ttVEpuTkNLL2lSUGNmY0hqV2VxZ25CbmlwUWQv?=
 =?utf-8?B?VlpNL1BINWhTeVhjVVVHbmlTT25tR0UzakplMFJxT1o1Z091RUI2TWVoK2xK?=
 =?utf-8?B?YUlpanpLWnJPaWpVSjg1NEZsSGNBY3JkN0IyZG9YdnBoMEs5Y1VJK2FkSnNk?=
 =?utf-8?B?UWs5T0Z1MkM1T1ZqT1UyblE5ZXY5Sm9uY1ZuWm9yakdFNGd1VzJ6cUk5MVp4?=
 =?utf-8?B?Q2NwbzZCM3pweVJtMTBYc1g3QUNYdEViZFhORHJNbVlBNXlKa0xXdk1HajBC?=
 =?utf-8?B?dU04bDd2QXR5MzB0bGZSYkliTmM5b0FZd3l3eEpqZ2lOeVpGZWU1c0RnY1BX?=
 =?utf-8?B?RERxcUk0YTlpdmNuNFZHZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C8F3CDA1E293A74E859139F6CC48EB48@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2589.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7302225-2717-4e0a-bd60-08d95396a128
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2021 20:14:26.2228 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ONVHIEEj8B6xHkJ7pPrVH5bKeDJIILpwFPxWeR5xWiHsQxI918PJzSbYXHc1Z0Dv2+Glv1AnC2r5vTZp0ErZlL6ltqaZzk3CvzFqH9iuzl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4557
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

T24gVHVlLCAyMDIxLTA3LTI3IGF0IDEzOjE2ICswMjAwLCBEYXZpZCBNw7xsbGVyIChFTFNPRlQg
QUcpIHdyb3RlOgo+IEl3b25hIFdpbmlhcnNrYSB3cm90ZToKPiAKPiA+ICtzdGF0aWMgY29uc3Qg
c3RydWN0IHBlY2lfZGV2aWNlX2lkIHBlY2lfY3B1X2RldmljZV9pZHNbXSA9IHsKPiA+ICvCoMKg
wqDCoMKgwqDCoHsgLyogSGFzd2VsbCBYZW9uICovCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgLmZhbWlsecKgPSA2LAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oC5tb2RlbMKgwqA9IElOVEVMX0ZBTTZfSEFTV0VMTF9YLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoC5kYXRhwqDCoMKgPSAiaHN4IiwKPiA+ICvCoMKgwqDCoMKgwqDCoH0sCj4g
PiArwqDCoMKgwqDCoMKgwqB7IC8qIEJyb2Fkd2VsbCBYZW9uICovCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgLmZhbWlsecKgPSA2LAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoC5tb2RlbMKgwqA9IElOVEVMX0ZBTTZfQlJPQURXRUxMX1gsCj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLmRhdGHCoMKgwqA9ICJiZHgiLAo+ID4gK8KgwqDCoMKg
wqDCoMKgfSwKPiA+ICvCoMKgwqDCoMKgwqDCoHsgLyogQnJvYWR3ZWxsIFhlb24gRCAqLwo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC5mYW1pbHnCoD0gNiwKPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAubW9kZWzCoMKgPSBJTlRFTF9GQU02X0JST0FEV0VMTF9E
LAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC5kYXRhwqDCoMKgPSAic2t4ZCIs
Cj4gCj4gSSB0aGluayB0aGlzIHNob3VsZCByZWFkICJiZHhkIiBhcyAic2t4ZCIgZG9lcyBub3Qg
ZXhpc3QgaW4gdGhlCj4gY3B1dGVtcC9kaW1tdGVtcCBkcml2ZXJzLgoKSXQgc2hvdWxkIGJlICJi
ZHhkIiAtIEknbGwgZml4IGl0IGluIHYyLgoKVGhhbmsgeW91Ci1Jd29uYQo=
