Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 293723DD4D8
	for <lists+openbmc@lfdr.de>; Mon,  2 Aug 2021 13:41:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GdbgC0R0Bz30G9
	for <lists+openbmc@lfdr.de>; Mon,  2 Aug 2021 21:41:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=NHB9A+h0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=NHB9A+h0; dkim-atps=neutral
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gdbfn5bDrz2xYd;
 Mon,  2 Aug 2021 21:40:49 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="274503099"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; d="scan'208";a="274503099"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2021 04:39:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; d="scan'208";a="501745746"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga004.fm.intel.com with ESMTP; 02 Aug 2021 04:39:45 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 2 Aug 2021 04:39:44 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Mon, 2 Aug 2021 04:39:44 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Mon, 2 Aug 2021 04:39:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KWNamQifR1lnJ6HTW5dLyRbNd1o/BT+rogBVtSs16Ef3JLPPupI/E42PKt4/l453/3LDiazFxgVBiYrfizPnwnmf1WFJT5qzkyTVpsEUileX9RWdkB2qMrcyeeAh+FSuxQIBkHkAbzlhrNuImOMtF3teTcN6k4TU7EZ4RdpkYbfIAkPArEQbEghetyZmWqFSgUrumOuteX115u39+uOgwobN0rqvwqezX6JYAcjLoynSYod2nRyMBdxQhJe7pd+T+6xHgPq83Ts3WAERZ5fuOwIxCB/t5fNzdayRYtTnwuito8CObs25SSOdwu5DD9U+YK8xcj0tCwO365FX4HzaZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0y7oZMry3eG9dVVyyXPXIQkbdCREfM/on2e8MSOmK5g=;
 b=axncCj3w381L8pf078CYK+TmL857LObUCBnPPu3CCOcm+lsKx4HDHMaV3OfEKHXLG/SeMuwG/an3L0oRIUUs6A95qg8Pa1SsIqqPsFsgEnoQx1+bCvIlap4j6gzbDdrwqlbvkrjeqTsw3SH6ATNcT93vn9cGc/YCse1ULyHYzDEyXGZ+R32V6c4y0+yIi5sgbjcByBirK6I4sQ5XmI+xXXnPi4145Nu4MJS3F/Yw8OeKUPQxIKs3gxTU6xsBrDWwydDxZZY1P8NedyUBo7npmlE96Rn3qVFGnfKKtruu+QNWo+kMfpNbQkAho6Fb0LEYsxTKb4zwfy24I0uzYXn0vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0y7oZMry3eG9dVVyyXPXIQkbdCREfM/on2e8MSOmK5g=;
 b=NHB9A+h08ROt0w4LOiWPUoy8lO0zNOUAWeF2fWLRIwZRiuNTF4sRFTJYPvHZeqYJbXDd8C9/8B9Tl/y1uK+xRBVSgYARpeotPJoiq10EBN4JIch8IZGcKPHlqNtWSonNKwuq9f9ct7emqR1DhAooJsrRe5Rd1KDTyvf/CjyJphY=
Received: from SN6PR11MB2589.namprd11.prod.outlook.com (2603:10b6:805:53::12)
 by SA0PR11MB4624.namprd11.prod.outlook.com (2603:10b6:806:98::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Mon, 2 Aug
 2021 11:39:36 +0000
Received: from SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::6e:364a:dc09:3d35]) by SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::6e:364a:dc09:3d35%5]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 11:39:36 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>, "zweiss@equinix.com"
 <zweiss@equinix.com>
Subject: Re: [PATCH 13/14] docs: hwmon: Document PECI drivers
Thread-Topic: [PATCH 13/14] docs: hwmon: Document PECI drivers
Thread-Index: AQHXd2r9gaflsnB05ke+TXWeCzETMKtXhuUAgAAe+4CACJFsgA==
Date: Mon, 2 Aug 2021 11:39:36 +0000
Message-ID: <ad6b0ccbed7ad3e4a8b8519571f5c23cca22a12d.camel@intel.com>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-14-iwona.winiarska@intel.com>
 <20210727225808.GU8018@packtop>
 <0521a076-9772-532f-2eab-8870464ca211@roeck-us.net>
In-Reply-To: <0521a076-9772-532f-2eab-8870464ca211@roeck-us.net>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.3 (3.40.3-1.fc34) 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47fd3207-0ec6-4764-5a42-08d955aa34bd
x-ms-traffictypediagnostic: SA0PR11MB4624:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR11MB462487E74FC907B1C7CDAF50ECEF9@SA0PR11MB4624.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rtRuTozQkIazoccVe6rikUsNkrgsrzDyLLyCb2QqcurkHCbAZ91VASVNw/FRCt6CbBwfqIX7P6Ybur6MvuPXHl4pCoA7bRZKxb+lLAc/41L6N7WaBwvRTEkF0u1fDhDIeVpNCH+HSU185r1SS32oQ8XALOi8iWZjLZLhghvmo3HVbaZkYOvijbwCt7ZmdNGpffEYygYU+O2gBHs72vz59I+P98FBLjC3JzEsJl4MczBaVEXKPmLaVjRBqppNZFduM58vuu67n9HCSe1MjxCK7Puyrnv/AILFo9p49vwDVdE0NhmjoY6d1UCCvmQLHvgFQdKJNvKVc5S2et34PwobuzqZhe92hU2aSff4v4xkizP7jkXNj0yTBAkh01flVq1Zb1fEOQcCUWZs4Lmg2SU7qkQ0oXDLu210tMgqF/ZcrQZi1KZBB5nnGCSR6EzeILPZ6VXj4CFkYP0jlw6FBn7sc3UAP51LyTvgQFqRfOsEpOl+vcvt647pB/113pUxQfDCvvnnKuwgdb7o+GoXps4OlzhBWgEee/N/zB70sb8PQBLf7m8LqPl18c879lAQebVHM9ea/GSAedPO5f7sFNtcmVdE1NHOBvX89GZHpm1EyNETTFqbpTjVlKpmOks32uEXOVWbFxUR9c7BStGiZDwRjXYC4YiwV7Y32yStq9nAhfbMdrGBqVpMwkdG4eA3sQIHVqlo2UNtb2UcxuJkWPnA9OyJUx++BbDM12UnevI86KKzfNPCbRRqFCFPnl3D5TIN3B5wnGxELlDNuXcOh6HtPsJ0E/5R15huDVV44TOsZ0n8zzFI0WiN1o16ggZEoZ0fMrZ5+SsiTMWV6AddvJaGzepxZQE2PMzoqzTvjDCReQ8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2589.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(19273905006)(8936002)(26005)(6506007)(7416002)(38100700002)(122000001)(38070700005)(186003)(53546011)(91956017)(54906003)(2906002)(66446008)(86362001)(83380400001)(6486002)(2616005)(110136005)(6512007)(76116006)(36756003)(71200400001)(508600001)(966005)(66946007)(64756008)(66476007)(4326008)(66556008)(316002)(5660300002)(562404015)(563064011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RHVuWGRrd2hodHpqVkM3aVBGTWJPNTFYZWlCcW16YlhjTmxsbWtySXhCL2k0?=
 =?utf-8?B?aHVuK0xrN0QvWXpZS09UVGVKUWxud2hzdzFuRldObkxNRHFqZ3NSUmFWd3Mz?=
 =?utf-8?B?ZEswMVlEOGUrc3dsRVpRalNKR0cvai9wUHJGdDAyV2NVUXNYQWxpeURvSTFo?=
 =?utf-8?B?R0c3cWVGczJnQWZQL3JxWjVzTEFHb0lQeVZacE9kVk5aZ2VPZ0FXZXJzZmNX?=
 =?utf-8?B?aHp1VVYwOWlHMjRiVEt3WlRKWWhKV1F4ZDFhV3N3SFl2VzRVS1JQNzdrMTU0?=
 =?utf-8?B?M2NrYzA3bjlEaVRoRXQrOHdFUkJlVnN5YS9hM3NnVG1jSmtoRzA3cTc4Q1A4?=
 =?utf-8?B?ckJ2b2xTWGhDMGFYblg1SldmZit3ci9rc3UyZlN1YjgrMW80ZGFmLy9zVWZP?=
 =?utf-8?B?YURRNDNRU2trVk5HZXhlNHJZZXduci9tTU1HMytjNEYyWFhvNXNuMm92MHFN?=
 =?utf-8?B?NHYwN1dqYTJVYmdTSGdVUFFlODNyMGpCUFIvMDB2WVVWUlNPVGV1RHZzaHVC?=
 =?utf-8?B?eW1FaUh4UUh1WXgzRDdhSGh2VGxmSk5FN3U1Tkl2YkVlSkRnKzl3USsyWmk3?=
 =?utf-8?B?bmp0dk9XQXpRVytuVmFCbTJBZzFxWkZ1L3NLUzIwN1MxMWlQbzI4aUdrNVlo?=
 =?utf-8?B?MFZuUTg0N1FScjFaa2FwQWQ5cnE0ZVloTHUrRXoxTk5NOFRJMG1QbHpwOWps?=
 =?utf-8?B?R0VLdXZDMW5uYnM4aFVZbTIySVovVHByZUpickpQcENYNmhqU0xlakVXOWZw?=
 =?utf-8?B?SmY0VTYzNXhQcVB6WFNPajNncXgzOXJNazUvTG5DamtCSmNiYWZDNEN1QnRV?=
 =?utf-8?B?a25VT3ZyUUs0RzFOeEJ0dllnZW9UQXRqTFdXYlBMUGM4amF0Q2VtYmpvMnBP?=
 =?utf-8?B?Uk4veEhvdFNGcXFwR0orZ2sxSHVmZ1NRMlBkZmVuZGVtYkhIVGM3WGxsSUIz?=
 =?utf-8?B?SU5RcE9FazJKL3BIbUxKU05ZNjlSampscUs3UTRFVXBNVjVMZzJpdEhQeXZZ?=
 =?utf-8?B?MnltWklTOHVwbE1WOVZHSmFzSUNDQWxpcUdQeWYwY01WNU5XalF4Z2JuWVZ5?=
 =?utf-8?B?NHZzdmtrOE5oYlVvODJiWDA3cGVWWlpjaVloSWVsU24rendGUTFLWFYyVFNj?=
 =?utf-8?B?ZGp4bWVVLzVSNDZNbnpXa0NQREphblI3eXNPWFFBZVBOenlvTDNKcTRXWnZk?=
 =?utf-8?B?ZHF6Q2NtMlQzSUp5QWN0dUg4TVoxZGRMMGVNZHpFR3J3VlpBM0d2QlQyb29j?=
 =?utf-8?B?bjNrSGRDS2dlWVVmeVNraktaREpjbngzdmI3d3N0R2RaRUh3V1ltMGJCc2tW?=
 =?utf-8?B?MFZRWUI0MVBVdUhuZ0VkOEJCYzhkZnRxNzlKamNKdmZMcFBjZ0NTNmpvdU9v?=
 =?utf-8?B?SVcxdGRQOU8vaHZ6anJZeXpyZjNtTldTTzczbnlad3R5VE1ReVQzWGVLQ0Zs?=
 =?utf-8?B?T3pVQk5xdlV3VGxjMjZpRGF6eXA4STlVeHltV0x4YmRWY1QzN2YxSVVremVi?=
 =?utf-8?B?WFVTKzJjNlkydndvN0o3dEtja1RvVzJkNnRTdTNzc1hVTDl6dXdGWDROT1hL?=
 =?utf-8?B?ditUQXYrTWU2ajNMdFhCcDJRQTRoMVlobFdiZGs2TlEvZlYzZDZYRkw1SDFr?=
 =?utf-8?B?dDNQajJtVVBkQjhnY2QvVzI2dk1ZSmNCVmtlRGdmc3BDNGlaZ2Y5a0RZR2tr?=
 =?utf-8?B?azNXZXpLT2RpNGl6MUc4aWx0aVJKV0lwQVZDdXVnbEVqaU5qcmZrOE1mR0tO?=
 =?utf-8?B?bW9pWFBhVmdXMTBYNUU2V3JVb2cxZVpMbUlPN2cvSExWai93S2EzMDZQTUtW?=
 =?utf-8?B?S2MrcjNrMng3WGhRQXlydz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <94D59942851FCB41BE9B7FFFC41C9295@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2589.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47fd3207-0ec6-4764-5a42-08d955aa34bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2021 11:39:36.6122 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gsk+EUGBORkSeMchFxVj9B1NJNg3bRqSU4adRaZOBI5ODNI0BflMuN6+jbeiYEvg12LrMNRlKS8CEbNzvs2L+4jv5vAq74LtkzmSVWLuCw4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4624
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
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "yazen.ghannam@amd.com" <yazen.ghannam@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gVHVlLCAyMDIxLTA3LTI3IGF0IDE3OjQ5IC0wNzAwLCBHdWVudGVyIFJvZWNrIHdyb3RlOgo+
IE9uIDcvMjcvMjEgMzo1OCBQTSwgWmV2IFdlaXNzIHdyb3RlOgo+ID4gT24gTW9uLCBKdWwgMTIs
IDIwMjEgYXQgMDU6MDQ6NDZQTSBDRFQsIEl3b25hIFdpbmlhcnNrYSB3cm90ZToKPiA+ID4gRnJv
bTogSmFlIEh5dW4gWW9vIDxqYWUuaHl1bi55b29AbGludXguaW50ZWwuY29tPgo+ID4gPiAKPiA+
ID4gQWRkIGRvY3VtZW50YXRpb24gZm9yIHBlY2ktY3B1dGVtcCBkcml2ZXIgdGhhdCBwcm92aWRl
cyBEVFMgdGhlcm1hbAo+ID4gPiByZWFkaW5ncyBmb3IgQ1BVIHBhY2thZ2VzIGFuZCBDUFUgY29y
ZXMgYW5kIHBlY2ktZGltbXRlbXAgZHJpdmVyIHRoYXQKPiA+ID4gcHJvdmlkZXMgRFRTIHRoZXJt
YWwgcmVhZGluZ3MgZm9yIERJTU1zLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogSmFlIEh5
dW4gWW9vIDxqYWUuaHl1bi55b29AbGludXguaW50ZWwuY29tPgo+ID4gPiBDby1kZXZlbG9wZWQt
Ynk6IEl3b25hIFdpbmlhcnNrYSA8aXdvbmEud2luaWFyc2thQGludGVsLmNvbT4KPiA+ID4gU2ln
bmVkLW9mZi1ieTogSXdvbmEgV2luaWFyc2thIDxpd29uYS53aW5pYXJza2FAaW50ZWwuY29tPgo+
ID4gPiBSZXZpZXdlZC1ieTogUGllcnJlLUxvdWlzIEJvc3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3Nz
YXJ0QGxpbnV4LmludGVsLmNvbT4KPiA+ID4gLS0tCj4gPiA+IERvY3VtZW50YXRpb24vaHdtb24v
aW5kZXgucnN0wqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArCj4gPiA+IERvY3VtZW50YXRpb24vaHdt
b24vcGVjaS1jcHV0ZW1wLnJzdMKgIHwgOTMgKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4g
PiA+IERvY3VtZW50YXRpb24vaHdtb24vcGVjaS1kaW1tdGVtcC5yc3QgfCA1OCArKysrKysrKysr
KysrKysrKwo+ID4gPiBNQUlOVEFJTkVSU8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKwo+ID4gPiA0IGZpbGVzIGNoYW5nZWQsIDE1NSBp
bnNlcnRpb25zKCspCj4gPiA+IGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2h3bW9u
L3BlY2ktY3B1dGVtcC5yc3QKPiA+ID4gY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
aHdtb24vcGVjaS1kaW1tdGVtcC5yc3QKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2h3bW9uL2luZGV4LnJzdCBiL0RvY3VtZW50YXRpb24vaHdtb24vaW5kZXgucnN0Cj4g
PiA+IGluZGV4IGJjMDE2MDFlYTgxYS4uY2M3NmI1YjNmNzkxIDEwMDY0NAo+ID4gPiAtLS0gYS9E
b2N1bWVudGF0aW9uL2h3bW9uL2luZGV4LnJzdAo+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2h3
bW9uL2luZGV4LnJzdAo+ID4gPiBAQCAtMTU0LDYgKzE1NCw4IEBAIEhhcmR3YXJlIE1vbml0b3Jp
bmcgS2VybmVsIERyaXZlcnMKPiA+ID4gwqDCoMKgIHBjZjg1OTEKPiA+ID4gwqDCoMKgIHBpbTQz
MjgKPiA+ID4gwqDCoMKgIHBtNjc2NHRyCj4gPiA+ICvCoMKgIHBlY2ktY3B1dGVtcAo+ID4gPiAr
wqDCoCBwZWNpLWRpbW10ZW1wCj4gPiA+IMKgwqDCoCBwbWJ1cwo+ID4gPiDCoMKgwqAgcG93cjEy
MjAKPiA+ID4gwqDCoMKgIHB4ZTE2MTAKPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
aHdtb24vcGVjaS1jcHV0ZW1wLnJzdAo+ID4gPiBiL0RvY3VtZW50YXRpb24vaHdtb24vcGVjaS1j
cHV0ZW1wLnJzdAo+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gPiBpbmRleCAwMDAwMDAw
MDAwMDAuLmQzYTIxOGJhODEwYQo+ID4gPiAtLS0gL2Rldi9udWxsCj4gPiA+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vaHdtb24vcGVjaS1jcHV0ZW1wLnJzdAo+ID4gPiBAQCAtMCwwICsxLDkzIEBACj4g
PiA+ICsuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5Cj4gPiA+ICsKPiA+
ID4gK0tlcm5lbCBkcml2ZXIgcGVjaS1jcHV0ZW1wCj4gPiA+ICs9PT09PT09PT09PT09PT09PT09
PT09PT09PQo+ID4gPiArCj4gPiA+ICtTdXBwb3J0ZWQgY2hpcHM6Cj4gPiA+ICvCoMKgwqDCoMKg
wqDCoE9uZSBvZiBJbnRlbCBzZXJ2ZXIgQ1BVcyBsaXN0ZWQgYmVsb3cgd2hpY2ggaXMgY29ubmVj
dGVkIHRvIGEgUEVDSQo+ID4gPiBidXMuCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAqIEludGVsIFhlb24gRTUvRTcgdjMgc2VydmVyIHByb2Nlc3NvcnMKPiA+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBJbnRlbCBYZW9uIEU1LTE0
eHggdjMgZmFtaWx5Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgSW50ZWwgWGVvbiBFNS0yNHh4IHYzIGZhbWlseQo+ID4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEludGVsIFhlb24gRTUtMTZ4eCB2MyBm
YW1pbHkKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBJbnRlbCBYZW9uIEU1LTI2eHggdjMgZmFtaWx5Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgSW50ZWwgWGVvbiBFNS00Nnh4IHYzIGZhbWlseQo+
ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEludGVs
IFhlb24gRTctNDh4eCB2MyBmYW1pbHkKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBJbnRlbCBYZW9uIEU3LTg4eHggdjMgZmFtaWx5Cj4gPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAqIEludGVsIFhlb24gRTUvRTcgdjQgc2VydmVy
IHByb2Nlc3NvcnMKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBJbnRlbCBYZW9uIEU1LTE2eHggdjQgZmFtaWx5Cj4gPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgSW50ZWwgWGVvbiBFNS0yNnh4IHY0IGZh
bWlseQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oEludGVsIFhlb24gRTUtNDZ4eCB2NCBmYW1pbHkKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBJbnRlbCBYZW9uIEU3LTQ4eHggdjQgZmFtaWx5Cj4g
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgSW50ZWwg
WGVvbiBFNy04OHh4IHY0IGZhbWlseQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgKiBJbnRlbCBYZW9uIFNjYWxhYmxlIHNlcnZlciBwcm9jZXNzb3JzCj4gPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgSW50ZWwgWGVvbiBEIGZhbWls
eQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoElu
dGVsIFhlb24gQnJvbnplIGZhbWlseQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoEludGVsIFhlb24gU2lsdmVyIGZhbWlseQo+ID4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEludGVsIFhlb24gR29sZCBm
YW1pbHkKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBJbnRlbCBYZW9uIFBsYXRpbnVtIGZhbWlseQo+ID4gPiArCj4gPiA+ICvCoMKgwqDCoMKgwqDC
oERhdGFzaGVldDogQXZhaWxhYmxlIGZyb20gaHR0cDovL3d3dy5pbnRlbC5jb20vZGVzaWduL2xp
dGVyYXR1cmUuaHRtCj4gPiA+ICsKPiA+ID4gK0F1dGhvcjogSmFlIEh5dW4gWW9vIDxqYWUuaHl1
bi55b29AbGludXguaW50ZWwuY29tPgo+ID4gPiArCj4gPiA+ICtEZXNjcmlwdGlvbgo+ID4gPiAr
LS0tLS0tLS0tLS0KPiA+ID4gKwo+ID4gPiArVGhpcyBkcml2ZXIgaW1wbGVtZW50cyBhIGdlbmVy
aWMgUEVDSSBod21vbiBmZWF0dXJlIHdoaWNoIHByb3ZpZGVzIERpZ2l0YWwKPiA+ID4gK1RoZXJt
YWwgU2Vuc29yIChEVFMpIHRoZXJtYWwgcmVhZGluZ3Mgb2YgdGhlIENQVSBwYWNrYWdlIGFuZCBD
UFUgY29yZXMgdGhhdAo+ID4gPiBhcmUKPiA+ID4gK2FjY2Vzc2libGUgdmlhIHRoZSBwcm9jZXNz
b3IgUEVDSSBpbnRlcmZhY2UuCj4gPiA+ICsKPiA+ID4gK0FsbCB0ZW1wZXJhdHVyZSB2YWx1ZXMg
YXJlIGdpdmVuIGluIG1pbGxpZGVncmVlIENlbHNpdXMgYW5kIHdpbGwgYmUKPiA+ID4gbWVhc3Vy
YWJsZQo+ID4gPiArb25seSB3aGVuIHRoZSB0YXJnZXQgQ1BVIGlzIHBvd2VyZWQgb24uCj4gPiA+
ICsKPiA+ID4gK1N5c2ZzIGludGVyZmFjZQo+ID4gPiArLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4g
PiArCj4gPiA+ICs9PT09PT09PT09PT09PT09PT09PT09PQo+ID4gPiA9PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gPiA+ICt0ZW1wMV9sYWJl
bMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCJEaWUiCj4gPiA+ICt0ZW1wMV9pbnB1dMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoFByb3ZpZGVzIGN1cnJlbnQgZGllIHRlbXBlcmF0dXJlIG9mIHRoZSBD
UFUgcGFja2FnZS4KPiA+ID4gK3RlbXAxX21heMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBQ
cm92aWRlcyB0aGVybWFsIGNvbnRyb2wgdGVtcGVyYXR1cmUgb2YgdGhlIENQVQo+ID4gPiBwYWNr
YWdlCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
d2hpY2ggaXMgYWxzbyBrbm93biBhcyBUY29udHJvbC4KPiA+ID4gK3RlbXAxX2NyaXTCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoFByb3ZpZGVzIHNodXRkb3duIHRlbXBlcmF0dXJlIG9mIHRoZSBD
UFUgcGFja2FnZQo+ID4gPiB3aGljaAo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGlzIGFsc28ga25vd24gYXMgdGhlIG1heGltdW0gcHJvY2Vzc29y
IGp1bmN0aW9uCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgdGVtcGVyYXR1cmUsIFRqbWF4IG9yIFRwcm9jaG90Lgo+ID4gPiArdGVtcDFfY3JpdF9o
eXN0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBQcm92aWRlcyB0aGUgaHlzdGVyZXNp
cyB2YWx1ZSBmcm9tIFRjb250cm9sCj4gPiA+IHRvIFRqbWF4IG9mCj4gPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdGhlIENQVSBwYWNrYWdlLgo+ID4g
PiArCj4gPiA+ICt0ZW1wMl9sYWJlbMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCJEVFMiCj4gPiA+
ICt0ZW1wMl9pbnB1dMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFByb3ZpZGVzIGN1cnJlbnQgRFRT
IHRlbXBlcmF0dXJlIG9mIHRoZSBDUFUgcGFja2FnZS4KPiA+IAo+ID4gV291bGQgdGhpcyBiZSBh
IGdvb2QgcGxhY2UgdG8gbm90ZSB0aGUgc2xpZ2h0bHkgY291bnRlci1pbnR1aXRpdmUgbmF0dXJl
Cj4gPiBvZiBEVFMgcmVhZGluZ3M/wqAgaS5lLiBhZGQgc29tZXRoaW5nIGFsb25nIHRoZSBsaW5l
cyBvZiAiVGhlIERUUyBzZW5zb3IKPiA+IHByb2R1Y2VzIGEgZGVsdGEgcmVsYXRpdmUgdG8gVGpt
YXgsIHNvIG5lZ2F0aXZlIHZhbHVlcyBhcmUgbm9ybWFsIGFuZAo+ID4gdmFsdWVzIGFwcHJvYWNo
aW5nIHplcm8gYXJlIGhvdC4iwqAgKEluIG15IGV4cGVyaWVuY2UgcGVvcGxlIHdobyBhcmVuJ3QK
PiA+IGFscmVhZHkgZmFtaWxpYXIgd2l0aCBpdCB0ZW5kIHRvIHRoaW5rIHNvbWV0aGluZydzIHdy
b25nIHdoZW4gYSBDUFUKPiA+IHRlbXBlcmF0dXJlIHJlYWRpbmcgc2hvd3MgLTUwQy4pCj4gPiAK
PiAKPiBBbGwgYXR0cmlidXRlcyBzaGFsbCBmb2xsb3cgdGhlIEFCSSwgYW5kIHRoZSBkcml2ZXIg
bXVzdCB0cmFuc2xhdGUgcmVwb3J0ZWQKPiB2YWx1ZXMgdG8gZGVncmVlcyBDLiBJZiB0aG9zZSBz
ZW5zb3JzIGRvIG5vdCBmb2xsb3cgdGhlIEFCSSBhbmQgcmVwb3J0IHNvbWV0aGluZwo+IGVsc2Us
IEkgd29uJ3QgYWNjZXB0IHRoZSBkcml2ZXIuCj4gCj4gR3VlbnRlcgoKU3VyZSwgSSBiZWxpZXZl
IGFsbCBhdHRyaWJ1dGVzIGFscmVhZHkgZm9sbG93IHRoZSBBQkkgYW5kIHRoZSByZXBvcnRlZCB2
YWx1ZXMKYXJlIGluIG1pbGxpZGVncmVlIENlbHNpdXMuCgpUaGFua3MKLUl3b25hCj4gCgo=
