Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC9B3C94AC
	for <lists+openbmc@lfdr.de>; Thu, 15 Jul 2021 01:49:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQDkd4BRkz303j
	for <lists+openbmc@lfdr.de>; Thu, 15 Jul 2021 09:49:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=rUZwHH3U;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=rUZwHH3U; dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQ3dR17LJz2yj0;
 Thu, 15 Jul 2021 02:59:38 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10045"; a="210432768"
X-IronPort-AV: E=Sophos;i="5.84,239,1620716400"; d="scan'208";a="210432768"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 09:58:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,239,1620716400"; d="scan'208";a="488126619"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga004.fm.intel.com with ESMTP; 14 Jul 2021 09:58:34 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 14 Jul 2021 09:58:34 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 14 Jul 2021 09:58:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Wed, 14 Jul 2021 09:58:34 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 14 Jul 2021 09:58:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GfaQqAO/PesmRemImBQigPsmPycEhQCzHihif6qWRQnqKJvw2CMvQCfwZNc40rzHaEPyF/E4jMeMRQCgd85p/bKVBoSDEaOt+90+LZgz/ekiq6AvaoZy4n8E4ScmCzm6gaKtGrDEaI4ZNhRg1i11ZkbJtITDuopButrg4Ek4ewct0o9sX4LbidliwyYf+oWIUR/SN8cOE4Pdl53hxeqg90Frzo75pAc4/8QSbONfzDFibsePy1ihgyIWyntwfYFnP0yBJ+1uhcUowDswpR2QZMD7SakTjFeT39CVj5Q9RYcPU5PPq9C7sQtH6I4mLVNSW2DHdHiXghpt5F4Khxf1/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C/VQnL+DnmYSHvJwpsRtR9K6zmTfVRf65oEHLkOyncU=;
 b=OGHlmfScJ26HPlg5QRpbD1mLlkEbJXqWBhryLbx2dNknUstY35ykq3oRxEY4KCisCTnbqbSAncv6Rqa+IIFGpISwEGMgMgwIk3hSBueY0FgLqmLb7RE+7MEh3OHKdurEpliWUqjhGpJVo6H5XWIqgxYkNabdH/fgghtKlIh8PhnDF5v+INh0Ri1hUPelziGdEi4S/PxV1whN4AWTpi/XfsyaE5YbgHo4zH4nI0btesxzLqYK88R/7ieLfHjdW+tWOCx5g6qeazZjO91bp1Uup9l4Z7GtYyl57EHUakV5RqkSSwhJEBX5QJOmvM8H9IH49VsH6cbgdCVDiB+sY75CFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C/VQnL+DnmYSHvJwpsRtR9K6zmTfVRf65oEHLkOyncU=;
 b=rUZwHH3URNiPUoMwkXcDNGPHxd08pC9pLzmfp73UXT42QZfOFtx3D5tHIN4hSZFrlRtLITZMZFwqNBXY/ZxK4aSuLJx/EVDSOQHt3yJ+iS8vLy8lre+qEHDZq/OnLnFPJSCHQotyhJGJgkAvLczEaY4BP//NKPrK8No4RSSklzg=
Received: from SJ0PR11MB5150.namprd11.prod.outlook.com (2603:10b6:a03:2d4::18)
 by BYAPR11MB3704.namprd11.prod.outlook.com (2603:10b6:a03:f9::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 14 Jul
 2021 16:58:31 +0000
Received: from SJ0PR11MB5150.namprd11.prod.outlook.com
 ([fe80::15f9:1166:732a:313d]) by SJ0PR11MB5150.namprd11.prod.outlook.com
 ([fe80::15f9:1166:732a:313d%3]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 16:58:31 +0000
From: "Williams, Dan J" <dan.j.williams@intel.com>
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH 02/14] x86/cpu: Extract cpuid helpers to arch-independent
Thread-Topic: [PATCH 02/14] x86/cpu: Extract cpuid helpers to arch-independent
Thread-Index: AQHXeNF5hXIq7h0miU274YsHgykTqQ==
Date: Wed, 14 Jul 2021 16:58:31 +0000
Message-ID: <c81be21327124c2269baa13741cacbd304120e7f.camel@intel.com>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-3-iwona.winiarska@intel.com>
In-Reply-To: <20210712220447.957418-3-iwona.winiarska@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.1 (3.40.1-1.fc34) 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e81cb2ca-208d-4c85-29a7-08d946e89c54
x-ms-traffictypediagnostic: BYAPR11MB3704:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB37044FAD86CC70851A0F8FF5C6139@BYAPR11MB3704.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qN1I1J1VdJSCS1NAFLz+utY6yxYU55DLaCVA7GHC2oqvIf98X5eSClFyBpEkrYYUqPzFmAnjTR8nIy1I6idNPDT+CrRhpEXhQpZIE2bNvqKo4j6PeDNObcyvVOXB0UthjcdVR7aPZ7kxuH7Y+o3zPTntTEUkjYLbFzvq/qajfasrQMmWDaq6NHLE8lOcdQp9sG5sRacLW76w+B+hq9y1N3X0XG6TpS53dT08eX4i4JJDPO6I1Ni5UPS/wDr/vcnlAqsL8b4jc4VjwBWyGq1YDEAF69FWTzzh+Kuxq7/7RTaD0grqmTRCKash7bl5GraBIBKAeZs4nYvZBr3vcz1vin6XdCl9GVgnNkTnd3GPZSGAj7ZtQ0spdEwGd/mguhAZUsDVenUK/BscFmlqtTY4+SZaw4rW4d3lOrIvcjvA48EjM/ZrhCXJg4ve4/Y9od9aaI71eGvWqbiEZVWJI5zuVtRSjikcjcdv/HDglofsGuDjYNyc9YdevS6ctV2aZ3jgtSbJhOAyLmebY19EH0+HLaS2XMlWiXJ2AlKLOZEKzf5xVNU/IznKxJm3Xf77+Bj5vQ5gbcL/QRBjWle0KEzXT1cCRDjFBzN8pZ84oLpTS1Jbu12OX5jk45QGmP+Y0pxpc//5y08hrI/wvZw2OyYgdygjNRhA3D+Etoyu+0mS5NHrJ8gJytghUVyPM3hEPjc7/GCFZSLll9hKwe4/MJWO9w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5150.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(54906003)(186003)(110136005)(122000001)(86362001)(2616005)(38100700002)(478600001)(26005)(7416002)(66946007)(6506007)(5660300002)(66446008)(64756008)(76116006)(91956017)(8676002)(2906002)(83380400001)(6512007)(66556008)(66476007)(4326008)(36756003)(6486002)(316002)(8936002)(71200400001)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YTk2dUdUUkNEWS9TbTQxSVo2cEYyQW1YYjhQa0xzbHhMUkh0STdoN1BGWjZB?=
 =?utf-8?B?b0tBQXZPR0NOSkhOLzduRCthZXN0T21BR2o3a21vL2RtaXpRdmhXcTFpNVRV?=
 =?utf-8?B?KzFBcFdGU1lvYUZuSnZoZTEyME14QklXTnFOY21FMmx5dDhvVlRBU0pib3F1?=
 =?utf-8?B?VEwvZGtFbndKREpUN0RJN0pkVWMwOXVvemNIV2xHZWRRRldQRFh1WlhPWks0?=
 =?utf-8?B?eU1XaytpV3EycTNRRTRDa0dHaFVDdUo4dzRRdXYybnpVcHFVbVRmd0ZNYkV4?=
 =?utf-8?B?bzVzYnpBUWd1d3NMWW50N1JsdTlYVGozU2tYQnQrSDBVSUFTblZ2LzFWanZP?=
 =?utf-8?B?Z2NwbDNXU3MwRGxLTDJ2dE41RS9NbERCWHYyNzJtRVdUQ0E5SEF5dTRPQS90?=
 =?utf-8?B?OG9TOGtITlRKb1ZEMkFSNzlEcmMweFJ6Y3RRUC9Wd2ppbWpwc2tJdkc3TFdF?=
 =?utf-8?B?SDdXMkUyelJZS1R1VVMxVGFaUjhxRGdSYmg0Nmh6ZzhTbldFSkk3U2U2MVRP?=
 =?utf-8?B?MmtrdFdNOEswRDllSDBlLy81NW5lY2o4RmtydnMwQ2dRdzZwVVFjV0MwdThM?=
 =?utf-8?B?QXphVUh5TGVnU2gwUWd1eVZ6bStnSTE3NEFWNkpTSFdSbCtpRlUvQnM4bDRK?=
 =?utf-8?B?UE9EdkJtMUJ3OThSVWROY2FkSUkrd2o0VzVjRmRPbjhUNnU1S2gvdGdQR01V?=
 =?utf-8?B?eTE4OTNlbTlvTVFKMDRpTks4Y3owYW4rYWxlQjBMZmFXSitwdFVtS3J5K1VK?=
 =?utf-8?B?RHl1cnlkcVNiT1FDZnNwMUF0NnVFUEJicWMwT0dZcHFyOEFUUVJFbDdkSWVs?=
 =?utf-8?B?WFp0am1McHJndTZCQnJJY21EMDc5Y0tEb3R3bkJhWHpkUFJkUEhOWU0wSGdD?=
 =?utf-8?B?bDNwdnM5cnhJM1JId0tpWjFOOUVBbGZxbnNyVEp1alFIdzBpV1QySHIyUVh0?=
 =?utf-8?B?YWt5aU5hMTJ6dmZMVlc1cStneGJ4WmZ1Uk1SSXZpVmR0UHRXbDVIeHdhekZz?=
 =?utf-8?B?M0ZNWkcrRnJaMlFzWmJOS1B0MGxYcGkrZ3pnNWdQQk14UGJJMk1qQTZmY0RD?=
 =?utf-8?B?bWluckNSVmZ6dG9DbWQzMFZiNVNHeSsrdW9rL3NvcUpDK2l6QUNDK3djbHJm?=
 =?utf-8?B?NU9FTm1ZT2RuamtrLzdBeVdmbmpqcnBxOWphZjNVei9rUmdUbzRoa0hRd3k1?=
 =?utf-8?B?akVwYWJxOTJGb25EZmI4UkkvYUlBazZUTDlHY0d6clFTYVJGc0FSMWEzZytD?=
 =?utf-8?B?ZjlnMkZNWXpTOGtyTkRjOGllVGlXSnJGRkxWQURtcVphNGxSNUVocFQ2aVYr?=
 =?utf-8?B?eFh2dEhCVkI3RDFnU080TDRPdTFQS3dLLzJZK3pmUFA4Qnk0VlUxWjUrVFY1?=
 =?utf-8?B?aEtjMVRldVR4eDNaWkkrQVFFQ2JyZmJQY2tzQTgwNVZxbkhXWkJBdTZwN21h?=
 =?utf-8?B?VzF6enEvZjcrUEk2MUxPTHAxZnozZ3lYS2wvOVBhd0lUamo1dWM5RnJKTWpV?=
 =?utf-8?B?MmwxekpVdVh3Y1Ywc0hxQmx3NitVVkNZcDlRc0FVR3hyQnoyR2dhZ3AzM1Iw?=
 =?utf-8?B?TXJUYkVzeW1SeEdBUk1ZdUN6UDFhV1d1MGowOStyaWpVVE5TR3FFSzlMYm5D?=
 =?utf-8?B?eEhuYWNTUTJ4enZmcUJKOVJSWk4xL2MwM0ZtTXpRbzZwY3QydEo2NVlWNnZR?=
 =?utf-8?B?WjJmcEVUQnhLSFZWK1IrYXlBTktXeUJOVVV5ajBocVY2SU5pd1lhVllldjBv?=
 =?utf-8?B?RG1SQmxycExkUk9FS2M3Vkd0YzdubUtTYi9nV21rcVZLdGRrRWVyQnRZRU45?=
 =?utf-8?B?U3lBQmtQRlFFd3FGWThndz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C717EAA60E6BB141B48D787DEC8CC4B2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5150.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e81cb2ca-208d-4c85-29a7-08d946e89c54
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2021 16:58:31.6185 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yWsvAYY8OeEGWfqAdaYWMmzhjZsaYtKDFFQHpgkm5s0eIlhlgapkPEAUV4GMxvMSP3h6APTKMRuzdqLqPXFJYwyhzbnn2lPtr8LIXLXt+gM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3704
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Thu, 15 Jul 2021 09:48:31 +1000
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
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>, "x86@kernel.org" <x86@kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "Lutomirski, Andy" <luto@kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "Luck, 
 Tony" <tony.luck@intel.com>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "yazen.ghannam@amd.com" <yazen.ghannam@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gVHVlLCAyMDIxLTA3LTEzIGF0IDAwOjA0ICswMjAwLCBJd29uYSBXaW5pYXJza2Egd3JvdGU6
DQo+IEJhc2Vib2FyZCBtYW5hZ2VtZW50IGNvbnRyb2xsZXJzIChCTUMpIG9mdGVuIHJ1biBMaW51
eCBidXQgYXJlIHVzdWFsbHkNCj4gaW1wbGVtZW50ZWQgd2l0aCBub24tWDg2IHByb2Nlc3NvcnMu
IFRoZXkgY2FuIHVzZSBQRUNJIHRvIGFjY2VzcyBwYWNrYWdlDQo+IGNvbmZpZyBzcGFjZSAoUENT
KSByZWdpc3RlcnMgb24gdGhlIGhvc3QgQ1BVIGFuZCBzaW5jZSBzb21lIGluZm9ybWF0aW9uLA0K
PiBlLmcuIGZpZ3VyaW5nIG91dCB0aGUgY29yZSBjb3VudCwgY2FuIGJlIG9idGFpbmVkIHVzaW5n
IGRpZmZlcmVudA0KPiByZWdpc3RlcnMgb24gZGlmZmVyZW50IENQVSBnZW5lcmF0aW9ucywgdGhl
eSBuZWVkIHRvIGRlY29kZSB0aGUgZmFtaWx5DQo+IGFuZCBtb2RlbC4NCj4gDQo+IFRoZSBmb3Jt
YXQgb2YgUGFja2FnZSBJZGVudGlmaWVyIFBDUyByZWdpc3RlciB0aGF0IGRlc2NyaWJlcyBDUFVJ
RA0KPiBpbmZvcm1hdGlvbiBoYXMgdGhlIHNhbWUgbGF5b3V0IGFzIENQVUlEXzEuRUFYLCBzbyBs
ZXQncyBhbGxvdyB0byByZXVzZQ0KPiBjcHVpZCBoZWxwZXJzIGJ5IG1ha2luZyBpdCBhdmFpbGFi
bGUgZm9yIG90aGVyIGFyY2hpdGVjdHVyZXMgYXMgd2VsbC4NCg0KSnVzdCBzb21lIG1pbm9yIGNv
bW1lbnRzIGJlbG93Lg0KDQpZb3UgY2FuIGdvIGFoZWFkIGFuZCBhZGQ6DQoNClJldmlld2VkLWJ5
OiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4NCg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogSXdvbmEgV2luaWFyc2thIDxpd29uYS53aW5pYXJza2FAaW50ZWwuY29tPg0KPiBS
ZXZpZXdlZC1ieTogVG9ueSBMdWNrIDx0b255Lmx1Y2tAaW50ZWwuY29tPg0KPiAtLS0NCj4gwqBN
QUlOVEFJTkVSU8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIg
KysNCj4gwqBhcmNoL3g4Ni9LY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fCAxICsNCj4gwqBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9jcHUuaMKgwqDCoMKgwqDCoCB8IDMgLS0t
DQo+IMKgYXJjaC94ODYvaW5jbHVkZS9hc20vbWljcm9jb2RlLmggfCAyICstDQo+IMKgYXJjaC94
ODYva3ZtL2NwdWlkLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAzICsrLQ0KPiDCoGFyY2gv
eDg2L2xpYi9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyICstDQo+IMKgZHJpdmVy
cy9lZGFjL21jZV9hbWQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMyArLS0NCj4gwqBpbmNsdWRl
L2xpbnV4L3g4Ni9jcHUuaMKgwqDCoMKgwqDCoMKgwqDCoCB8IDkgKysrKysrKysrDQo+IMKgbGli
L0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA1ICsr
KysrDQo+IMKgbGliL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8IDIgKysNCj4gwqBsaWIveDg2L01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfCAzICsrKw0KPiDCoHthcmNoL3g4Ni9saWIgPT4gbGliL3g4Nn0vY3B1LmPCoCB8
IDIgKy0NCj4gwqAxMiBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9u
cygtKQ0KPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L3g4Ni9jcHUuaA0KPiDC
oGNyZWF0ZSBtb2RlIDEwMDY0NCBsaWIveDg2L01ha2VmaWxlDQo+IMKgcmVuYW1lIHthcmNoL3g4
Ni9saWIgPT4gbGliL3g4Nn0vY3B1LmMgKDk1JSkNCj4gDQo+IGRpZmYgLS1naXQgYS9NQUlOVEFJ
TkVSUyBiL01BSU5UQUlORVJTDQo+IGluZGV4IGVjNTk4N2EwMDgwMC4uNmY3N2FhY2EyYTMwIDEw
MDY0NA0KPiAtLS0gYS9NQUlOVEFJTkVSUw0KPiArKysgYi9NQUlOVEFJTkVSUw0KPiBAQCAtMjAw
ODEsNiArMjAwODEsOCBAQCBUOsKgwqDCoMKgwqDCoGdpdCBnaXQ6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdGlwL3RpcC5naXQgeDg2L2NvcmUNCj4gwqBGOsKgwqDC
oMKgwqBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MveDg2Lw0KPiDCoEY6wqDCoMKg
wqDCoERvY3VtZW50YXRpb24veDg2Lw0KPiDCoEY6wqDCoMKgwqDCoGFyY2gveDg2Lw0KPiArRjrC
oMKgwqDCoMKgaW5jbHVkZS9saW51eC94ODYvDQoNCkRvZXNuJ3QgdGhpcyB0ZWNobmljYWxseSBi
ZWxvbmcgaW4gcGF0Y2gxIHNpbmNlIHRoYXQgb25lIGludHJvZHVjZWQNCnRoZSBkaXJlY3Rvcnk/
DQoNCj4gK0Y6wqDCoMKgwqDCoGxpYi94ODYvDQo+IMKgDQo+IMKgWDg2IEVOVFJZIENPREUNCj4g
wqBNOsKgwqDCoMKgwqBBbmR5IEx1dG9taXJza2kgPGx1dG9Aa2VybmVsLm9yZz4NCj4gZGlmZiAt
LWdpdCBhL2FyY2gveDg2L0tjb25maWcgYi9hcmNoL3g4Ni9LY29uZmlnDQo+IGluZGV4IDQ5Mjcw
NjU1ZTgyNy4uNzUwZjliODk2ZTRmIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3g4Ni9LY29uZmlnDQo+
ICsrKyBiL2FyY2gveDg2L0tjb25maWcNCj4gQEAgLTE0MSw2ICsxNDEsNyBAQCBjb25maWcgWDg2
DQo+IMKgwqDCoMKgwqDCoMKgwqBzZWxlY3QgR0VORVJJQ19JUlFfUFJPQkUNCj4gwqDCoMKgwqDC
oMKgwqDCoHNlbGVjdCBHRU5FUklDX0lSUV9SRVNFUlZBVElPTl9NT0RFDQo+IMKgwqDCoMKgwqDC
oMKgwqBzZWxlY3QgR0VORVJJQ19JUlFfU0hPVw0KPiArwqDCoMKgwqDCoMKgwqBzZWxlY3QgR0VO
RVJJQ19MSUJfWDg2DQo+IMKgwqDCoMKgwqDCoMKgwqBzZWxlY3QgR0VORVJJQ19QRU5ESU5HX0lS
UcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiBTTVANCj4gwqDCoMKgwqDCoMKgwqDCoHNl
bGVjdCBHRU5FUklDX1BURFVNUA0KPiDCoMKgwqDCoMKgwqDCoMKgc2VsZWN0IEdFTkVSSUNfU01Q
X0lETEVfVEhSRUFEDQo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9jcHUuaCBi
L2FyY2gveDg2L2luY2x1ZGUvYXNtL2NwdS5oDQo+IGluZGV4IDMzZDQxZTM1MGM3OS4uMmE2NjNh
MDVhNzk1IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9jcHUuaA0KPiArKysg
Yi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9jcHUuaA0KPiBAQCAtMzcsOSArMzcsNiBAQCBleHRlcm4g
aW50IF9kZWJ1Z19ob3RwbHVnX2NwdShpbnQgY3B1LCBpbnQgYWN0aW9uKTsNCj4gwqANCj4gwqBp
bnQgbXdhaXRfdXNhYmxlKGNvbnN0IHN0cnVjdCBjcHVpbmZvX3g4NiAqKTsNCj4gwqANCj4gLXVu
c2lnbmVkIGludCB4ODZfZmFtaWx5KHVuc2lnbmVkIGludCBzaWcpOw0KPiAtdW5zaWduZWQgaW50
IHg4Nl9tb2RlbCh1bnNpZ25lZCBpbnQgc2lnKTsNCj4gLXVuc2lnbmVkIGludCB4ODZfc3RlcHBp
bmcodW5zaWduZWQgaW50IHNpZyk7DQo+IMKgI2lmZGVmIENPTkZJR19DUFVfU1VQX0lOVEVMDQo+
IMKgZXh0ZXJuIHZvaWQgX19pbml0IHNsZF9zZXR1cChzdHJ1Y3QgY3B1aW5mb194ODYgKmMpOw0K
PiDCoGV4dGVybiB2b2lkIHN3aXRjaF90b19zbGQodW5zaWduZWQgbG9uZyB0aWZuKTsNCj4gZGlm
ZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL21pY3JvY29kZS5oIGIvYXJjaC94ODYvaW5j
bHVkZS9hc20vbWljcm9jb2RlLmgNCj4gaW5kZXggYWI0NWEyMjBmYWM0Li40YjBlYWJmNjNiOTgg
MTAwNjQ0DQo+IC0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL21pY3JvY29kZS5oDQo+ICsrKyBi
L2FyY2gveDg2L2luY2x1ZGUvYXNtL21pY3JvY29kZS5oDQo+IEBAIC0yLDkgKzIsOSBAQA0KPiDC
oCNpZm5kZWYgX0FTTV9YODZfTUlDUk9DT0RFX0gNCj4gwqAjZGVmaW5lIF9BU01fWDg2X01JQ1JP
Q09ERV9IDQo+IMKgDQo+IC0jaW5jbHVkZSA8YXNtL2NwdS5oPg0KPiDCoCNpbmNsdWRlIDxsaW51
eC9lYXJseWNwaW8uaD4NCj4gwqAjaW5jbHVkZSA8bGludXgvaW5pdHJkLmg+DQo+ICsjaW5jbHVk
ZSA8bGludXgveDg2L2NwdS5oPg0KDQpIYXMgdGhpcyBwYXRjaCBzZXQgcmVjZWl2ZWQgYSBidWls
ZCBzdWNjZXNzIG5vdGlmaWNhdGlvbiBmcm9tIHRoZQ0Ka2J1aWxkIHJvYm90PyBJLmUuIGFyZSB5
b3Ugc3VyZSB0aGF0IHRoaXMgaW5jbHVkZSB3YXMgb25seSBoZXJlIGZvcg0KdGhlDQoNCnVuc2ln
bmVkIGludCB4ODZfZmFtaWx5KHVuc2lnbmVkIGludCBzaWcpOw0KdW5zaWduZWQgaW50IHg4Nl9t
b2RlbCh1bnNpZ25lZCBpbnQgc2lnKTsNCnVuc2lnbmVkIGludCB4ODZfc3RlcHBpbmcodW5zaWdu
ZWQgaW50IHNpZyk7DQoNCi4uLmhlbHBlcnMuIEFsbCB0aGUgb3RoZXIgcmVwbGFjZW1lbnRzIGxv
b2sgdHJpdmlhbGx5IHZlcmlmaWFibGUgYXMNCm9ubHkgbmVlZGluZyB0aGVzZSAzIGhlbHBlcnMu
DQoNCj4gwqANCj4gwqBzdHJ1Y3QgdWNvZGVfcGF0Y2ggew0KPiDCoMKgwqDCoMKgwqDCoMKgc3Ry
dWN0IGxpc3RfaGVhZCBwbGlzdDsNCj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9jcHVpZC5o
IGIvYXJjaC94ODYva3ZtL2NwdWlkLmgNCj4gaW5kZXggYzk5ZWRmZmY3ZjgyLi5iZjA3MGQyYTIx
NzUgMTAwNjQ0DQo+IC0tLSBhL2FyY2gveDg2L2t2bS9jcHVpZC5oDQo+ICsrKyBiL2FyY2gveDg2
L2t2bS9jcHVpZC5oDQo+IEBAIC00LDEwICs0LDExIEBADQo+IMKgDQo+IMKgI2luY2x1ZGUgIng4
Ni5oIg0KPiDCoCNpbmNsdWRlICJyZXZlcnNlX2NwdWlkLmgiDQo+IC0jaW5jbHVkZSA8YXNtL2Nw
dS5oPg0KPiDCoCNpbmNsdWRlIDxhc20vcHJvY2Vzc29yLmg+DQo+IMKgI2luY2x1ZGUgPHVhcGkv
YXNtL2t2bV9wYXJhLmg+DQo+IMKgDQo+ICsjaW5jbHVkZSA8bGludXgveDg2L2NwdS5oPg0KPiAr
DQo+IMKgZXh0ZXJuIHUzMiBrdm1fY3B1X2NhcHNbTlJfS1ZNX0NQVV9DQVBTXSBfX3JlYWRfbW9z
dGx5Ow0KPiDCoHZvaWQga3ZtX3NldF9jcHVfY2Fwcyh2b2lkKTsNCj4gwqANCj4gZGlmZiAtLWdp
dCBhL2FyY2gveDg2L2xpYi9NYWtlZmlsZSBiL2FyY2gveDg2L2xpYi9NYWtlZmlsZQ0KPiBpbmRl
eCBiYWQ0ZGVlNGYwZTQuLmZkNzNjMWI3MmMzZSAxMDA2NDQNCj4gLS0tIGEvYXJjaC94ODYvbGli
L01ha2VmaWxlDQo+ICsrKyBiL2FyY2gveDg2L2xpYi9NYWtlZmlsZQ0KPiBAQCAtNDEsNyArNDEs
NyBAQCBjbGVhbi1maWxlcyA6PSBpbmF0LXRhYmxlcy5jDQo+IMKgDQo+IMKgb2JqLSQoQ09ORklH
X1NNUCkgKz0gbXNyLXNtcC5vIGNhY2hlLXNtcC5vDQo+IMKgDQo+IC1saWIteSA6PSBkZWxheS5v
IG1pc2MubyBjbWRsaW5lLm8gY3B1Lm8NCj4gK2xpYi15IDo9IGRlbGF5Lm8gbWlzYy5vIGNtZGxp
bmUubw0KPiDCoGxpYi15ICs9IHVzZXJjb3B5XyQoQklUUykubyB1c2VyY29weS5vIGdldHVzZXIu
byBwdXR1c2VyLm8NCj4gwqBsaWIteSArPSBtZW1jcHlfJChCSVRTKS5vDQo+IMKgbGliLSQoQ09O
RklHX0FSQ0hfSEFTX0NPUFlfTUMpICs9IGNvcHlfbWMubyBjb3B5X21jXzY0Lm8NCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZWRhYy9tY2VfYW1kLmMgYi9kcml2ZXJzL2VkYWMvbWNlX2FtZC5jDQo+
IGluZGV4IDI3ZDU2OTIwYjQ2OS4uZjU0NWY1ZmFkMDJjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2VkYWMvbWNlX2FtZC5jDQo+ICsrKyBiL2RyaXZlcnMvZWRhYy9tY2VfYW1kLmMNCj4gQEAgLTEs
OCArMSw3IEBADQo+IMKgLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQ0K
PiDCoCNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gwqAjaW5jbHVkZSA8bGludXgvc2xhYi5o
Pg0KPiAtDQo+IC0jaW5jbHVkZSA8YXNtL2NwdS5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L3g4Ni9j
cHUuaD4NCj4gwqANCj4gwqAjaW5jbHVkZSAibWNlX2FtZC5oIg0KPiDCoA0KPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9saW51eC94ODYvY3B1LmggYi9pbmNsdWRlL2xpbnV4L3g4Ni9jcHUuaA0KPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLjVmMzgzZDQ3ODg2ZA0K
PiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL2luY2x1ZGUvbGludXgveDg2L2NwdS5oDQo+IEBAIC0w
LDAgKzEsOSBAQA0KPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSAq
Lw0KPiArI2lmbmRlZiBfTElOVVhfWDg2X0NQVV9IDQo+ICsjZGVmaW5lIF9MSU5VWF9YODZfQ1BV
X0gNCj4gKw0KPiArdW5zaWduZWQgaW50IHg4Nl9mYW1pbHkodW5zaWduZWQgaW50IHNpZyk7DQo+
ICt1bnNpZ25lZCBpbnQgeDg2X21vZGVsKHVuc2lnbmVkIGludCBzaWcpOw0KPiArdW5zaWduZWQg
aW50IHg4Nl9zdGVwcGluZyh1bnNpZ25lZCBpbnQgc2lnKTsNCj4gKw0KPiArI2VuZGlmIC8qIF9M
SU5VWF9YODZfQ1BVX0ggKi8NCj4gZGlmZiAtLWdpdCBhL2xpYi9LY29uZmlnIGIvbGliL0tjb25m
aWcNCj4gaW5kZXggZDI0MWZlNDc2ZmRhLi5jYzI4YmMxZjJkODQgMTAwNjQ0DQo+IC0tLSBhL2xp
Yi9LY29uZmlnDQo+ICsrKyBiL2xpYi9LY29uZmlnDQo+IEBAIC03MTgsMyArNzE4LDggQEAgY29u
ZmlnIFBMRE1GVw0KPiDCoA0KPiDCoGNvbmZpZyBBU04xX0VOQ09ERVINCj4gwqDCoMKgwqDCoMKg
wqAgdHJpc3RhdGUNCj4gKw0KPiArY29uZmlnIEdFTkVSSUNfTElCX1g4Ng0KPiArwqDCoMKgwqDC
oMKgwqBib29sDQo+ICvCoMKgwqDCoMKgwqDCoGRlcGVuZHMgb24gWDg2DQo+ICvCoMKgwqDCoMKg
wqDCoGRlZmF1bHQgbg0KDQpObyBuZWVkIGZvciBhICJkZWZhdWx0IG4iIGxpbmUuIE9taXR0aW5n
IGEgZGVmYXVsdCBpcyB0aGUgc2FtZSBhcw0KImRlZmF1bHQgbiIuDQoNCg==
