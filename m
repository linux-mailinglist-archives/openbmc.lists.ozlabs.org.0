Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 189BD3DBF74
	for <lists+openbmc@lfdr.de>; Fri, 30 Jul 2021 22:14:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GbzC56hGsz3cLt
	for <lists+openbmc@lfdr.de>; Sat, 31 Jul 2021 06:14:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=QP0gQuPX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=QP0gQuPX; dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GbzBk19j3z2xb6;
 Sat, 31 Jul 2021 06:14:21 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10061"; a="210048914"
X-IronPort-AV: E=Sophos;i="5.84,282,1620716400"; d="scan'208";a="210048914"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2021 13:13:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,282,1620716400"; d="scan'208";a="477103497"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 30 Jul 2021 13:13:18 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 30 Jul 2021 13:13:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Fri, 30 Jul 2021 13:13:17 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 30 Jul 2021 13:13:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GszySQNQIK6tU3DcX+0i+tIjvjw5yRNp/aMoxUXse/oEtFfgPGqCWUb6dKxNfA8OYO/75Y5Pz+AcpvtPP7jIeQiN7+ZSCmm7lRF2cOjU09uqd54MX2HwGSfmQ4j9VBHD6H5hbHpNUIIe3VI6iU/fFkqbdn+XC6oKAPq4WJrvNuPEC8TxopvcNtvHlhIs7zDtBU64kBLPwPkqXMyiAzc9PgtPAx9v4dDFOcl4A3BczGNZXCpXtWur8CGZXzKdLi7pWEnFZEHsdVFu6BhKqqRoLH0EwzFQqifC4vYtfdrLSx9gDk+DRlQopMj9pyhlfU3VM6FPTo1B3VJouOwabQZlZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWNVxjlHX4O4tojm0ld16bEhSn/iyCE9if1xEv+grk8=;
 b=BdRll7lwMT7AuTQWUskLssdz2Buzla/YUPm9HzzhbmrwahYnGAKDgHpR7nFpZpppSpuUuqL5ykZfj07idGlYY5wspDTInfnY0U0pBSM3rIti1eya5RAJn/DSYuVH3w8RiQ373qBmDxijsOaZ6iTi0s3layD1cCGDucOO5Zl/WHx9I1gUT1niVH+51EaTdMT5FORu5R/Ix4vcDLLdDfMxZZX6eoWn/80uarNrmtyNedQhaF5AldirN4mqawubNwHkDpUgHafSUAxo++qWASyn3lPSeoZ5yciepJRvY9BmzKg6YHfPa6zGHTZP5rLb2VuHqOCEToc9EwuS0QtVJIXkuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWNVxjlHX4O4tojm0ld16bEhSn/iyCE9if1xEv+grk8=;
 b=QP0gQuPX3zfPDFmHBoDuVClNxRFTSdnZRiSUK1dhD7HQBH46KsW2qw+S/DaUG7L8m1ez5RjD/Wd3vh8F1Y4cg06JsyRxGWuNSwQtY2NVAk5LZSyvLUTNgWmUUHEh1L70dXrvAPoz1PW8fX2T+ubEpx9T2bVzR5Att7GNZ7guAcM=
Received: from SN6PR11MB2589.namprd11.prod.outlook.com (2603:10b6:805:53::12)
 by SN6PR11MB3006.namprd11.prod.outlook.com (2603:10b6:805:d1::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17; Fri, 30 Jul
 2021 20:13:14 +0000
Received: from SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::6e:364a:dc09:3d35]) by SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::6e:364a:dc09:3d35%5]) with mapi id 15.20.4373.021; Fri, 30 Jul 2021
 20:13:14 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "zweiss@equinix.com" <zweiss@equinix.com>
Subject: Re: [PATCH 09/14] peci: Add support for PECI device drivers
Thread-Topic: [PATCH 09/14] peci: Add support for PECI device drivers
Thread-Index: AQHXd2q8DON5fF1eD0ing5D46+2CZatXWA6AgAM3RYCAACLuAIABXY+A
Date: Fri, 30 Jul 2021 20:13:14 +0000
Message-ID: <5476aacfd0c83fbe69c9eb2af3327ff29a03674d.camel@intel.com>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-10-iwona.winiarska@intel.com>
 <20210727201028.GS8018@packtop>
 <79f5b6ed4942ddeb66beea03907a58495376ccef.camel@intel.com>
 <20210729232205.GX8018@packtop>
In-Reply-To: <20210729232205.GX8018@packtop>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.3 (3.40.3-1.fc34) 
authentication-results: equinix.com; dkim=none (message not signed)
 header.d=none;equinix.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 045fb1bc-feb5-4fe4-e325-08d95396768c
x-ms-traffictypediagnostic: SN6PR11MB3006:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB300615CFF80E02FE7B01DBE1ECEC9@SN6PR11MB3006.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YayiVvOR9kx8eMga+exgcRUTrgiRUkWbBfX0ABD7rBMkyDk2jJ4iFWOjKGIr+YCn7oYB7j9eDmYyvl9fV9zQFh/XTvnU3CVGvzTdkKQW14Dx8iBq7+UX3cmMlmWfnB3SUq3FNjq8kWt/49qqwCNfMrPntD6X2Ei7kE7xDuXEP5pvTbkMMBrmwzfoLBTDmRnUmRyAlmXhrdNQ3s+NRxGQ09AshvIuExzpG7NuNFW3gyHjwdWKwk1CfQOdz1XHEL3E+fl8UDlx5PZ+1tDpm3H40JIWllCoXnIaRXk3VQtlzFW+woykNp+ZyRET6fboFOrHdWndhinL4FvIUwA2vovjvTUvcD6x9n0ZdHOc7sgR03Z3ziY4Sswo1TBiPK1qrSM/FGONFSQYw/lRjQU5kKrhK8kx6YJweMZcY9dN4IFPg83gHpwJz+ZGCx14MeLSzZo4geuZQzFP2tddSRa1anYx+3ISM8vrncvuChB30P4KehSlHw4mA8e+HQ5dahQXXyu0VT9yruLxbkyUpIgpm7QwfC9VIrTU29s3GPBQ8NLBo4ZlayYE+ms8lIHVSJLhHv7Cc+wRN7THSlVNAbu4Ll9IzRp2dCN8oImeh5M2Q/nUWF9d7Qr3Dd1NRNrObbZwHSxLMUPBzr63GYFGpMTchSMLtlR3ppEb+V+aPiHLKH/paLp+FKvyP1jGVIXACwbFCQFLMruu4t1EPmxpvxsXfuf+xg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2589.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39860400002)(136003)(376002)(396003)(66946007)(36756003)(66446008)(86362001)(66556008)(316002)(54906003)(38100700002)(186003)(6916009)(4326008)(38070700005)(2616005)(76116006)(71200400001)(91956017)(66476007)(26005)(64756008)(478600001)(2906002)(8676002)(6506007)(122000001)(6512007)(6486002)(8936002)(5660300002)(7416002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TEFjT3VrUTFscFF5TjJjbTF1Rkx4aXppVTZ2NUFWNjlkZU9YS094Z2QxeUc3?=
 =?utf-8?B?V2s4a0JMSmx0OC9kcUxOUjJSUnVhQUpwZncySGVxOUQyWFpIQ2s1bHFQaUpl?=
 =?utf-8?B?ZzFHQjlDWkxrU0FBQ0FaOE5yMnRzNGJmeDV0VmFuWHQxU2ZVVDVSaG12c1Vq?=
 =?utf-8?B?dnpKWVF0MHc3Q1laZ0N1N0xhTzF6dXN2NVpHQjk4ZEZueGhqMzAxeVJqdzVJ?=
 =?utf-8?B?NUkrWGNLUEt4UWFPclZhb3ZBSzRGYXpjTW5idHNrdmZFR1ZNdXBDSWxtUWto?=
 =?utf-8?B?TS8vK2lnZkZzeDFHK1Q4QzNkUFZnbWVNMUl3c04weHYxd0Job0pPYStCcmFu?=
 =?utf-8?B?RFpUWHV3eFZWQ1g4WW14d285Q2d0Ni9kb3B1b1NZZjhDcGEzRVlqUyt5WGlk?=
 =?utf-8?B?ODhkV2duMzlwVDFjeEZsRHo0Nk1pVk9FSmsvZkoxU3ZFTVB4YUdKMDBmbmZt?=
 =?utf-8?B?Q2Q1cHRhbUZmV3ovREtGc0pJL1ZMRWQ1UFVEaDF5Qk5YMTdXemJLSWhsc2xO?=
 =?utf-8?B?SHhZeGxhUkx1MThlM2MrNE9kQXU3ZW1IL2RXODRsK0puUmpyU0FQWTJWU25t?=
 =?utf-8?B?cE9QOWwyOHlZV3d2a1pvK00rMm8zMVlLZjhFV096a29KNWp6dU9qanRBa3Fw?=
 =?utf-8?B?OGJLMkovUGIwQXpISFpqL1B1bXNvTmRXUXpuUHpqTHhwQUZlb0IreUt0WmY1?=
 =?utf-8?B?WkRoT2ZOUEZVWnBWck5jTzlOMUZocnhVdFBNVUtTTjdVM1B4ajc0L0VKWGRE?=
 =?utf-8?B?alh2djRQODI0WDVRbFIzNmlkQlVFUXYrSmdxZWJuU295Qms3RkU5T3ZuT3Yv?=
 =?utf-8?B?MEgvKzNucGQzRUNUNDY1WTh5NTl4Ymh4UlJyQTJReEExclFyVytwN2F5ZVNW?=
 =?utf-8?B?NXRNSTZlRGtLYmlPS1NDbXF1dzNMQ0dlRmxOVStDSjhQdTRzUTdnb0NYdWNj?=
 =?utf-8?B?U3hmcGNxQ1Y1cDNwU2lqditwUWVCVGozbHk2NW11UkpGNFNMTEZreFE5WTU4?=
 =?utf-8?B?T2gvNWQ2SmFsSEdQeENEQ3ZXZXBhNnJUd3paOVUzS2cvSWVsakJLc0pRNlg3?=
 =?utf-8?B?Vk5VMVlLYlkwaCtlc3VDVGY4K2FObk9odzcwK2VRNHV1eGtucXVTZmR4aTNI?=
 =?utf-8?B?dDA5RTRQbE83Tkt3eVlqTGdTeGpGbGJzZzNHdURmMWlEcy9qWEljZDlHN01o?=
 =?utf-8?B?VlVRRUxuNUExZGtyN3NvdGxpT3JZeTNiRzdzM2gyTmI5a2ZBb1JET0tOa1dR?=
 =?utf-8?B?eGRGMVQ5ZHd5OGYwWXB1OUhDZ25VZmd6aG9uR25sZnhmSzQyRUJJQjdCYVd3?=
 =?utf-8?B?OXlCUjY0R3dJU2Y5UWUySm50UkVGdmZGRDR4Q2RibVM5RG92MGEyN1pzOHlo?=
 =?utf-8?B?MGxDemdsS2doSW9tT3NxSW5tZTllTXhwQVhvSFVQTHdxUERkdk5YVnl0V29O?=
 =?utf-8?B?THc5ek9hUVZzTlVrdjlmZ3oxa3hlbVhxRUN0K0I4WFZpWGJxM1V5b1NqdHdo?=
 =?utf-8?B?K0p5d0dvbUxrT29EM0ZGRkNjajJoeWhzRHVLOGlwOWQ3UXNPRE1OWEd0RWdE?=
 =?utf-8?B?MlhZRDEyNzcyVFVPYWtwNlhWTlpXaDAySVMvcFBocHZLYjdjWmJLZHJnOVN3?=
 =?utf-8?B?RUV1dFRpZ0ZLc3hwL2lUY0wxWXlTVm1kamVMOWxheHpjYjduQjg4OWFkdlI5?=
 =?utf-8?B?eUR5U2xxcEgwcGJRc0Y2YnRwTHN1clhjU25oZGJsV0M0NTBzTHB4K2h1K3Fx?=
 =?utf-8?B?dysySVZwNjZKUHhhV3NLWXg1WUVvR29LVUNiNFl3Uk95a2Y4SkZQWkovNUxh?=
 =?utf-8?B?UDRibXN0NjdWaEgxak5uQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <63AA470ED51F6941BABD03B9674693C3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2589.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 045fb1bc-feb5-4fe4-e325-08d95396768c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2021 20:13:14.7391 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RgPGFADRDoMnQkJN1ZteTp0Okc2SpllS14F4gsxny0HiwS2sYEbsRwSwDbxCjuYiOuDbxnF5nvBDRhlzeoslk7HP9pav94JmDNQAA19hgyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3006
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "yazen.ghannam@amd.com" <yazen.ghannam@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gVGh1LCAyMDIxLTA3LTI5IGF0IDIzOjIyICswMDAwLCBaZXYgV2Vpc3Mgd3JvdGU6DQo+IE9u
IFRodSwgSnVsIDI5LCAyMDIxIGF0IDA0OjE3OjA2UE0gQ0RULCBXaW5pYXJza2EsIEl3b25hIHdy
b3RlOg0KPiA+IE9uIFR1ZSwgMjAyMS0wNy0yNyBhdCAyMDoxMCArMDAwMCwgWmV2IFdlaXNzIHdy
b3RlOg0KPiA+ID4gT24gTW9uLCBKdWwgMTIsIDIwMjEgYXQgMDU6MDQ6NDJQTSBDRFQsIEl3b25h
IFdpbmlhcnNrYSB3cm90ZToNCj4gPiA+ID4gDQo+ID4gPiA+IA0KPiA+ID4gPiArI2RlZmluZSBS
RVZJU0lPTl9OVU1fTUFTSyBHRU5NQVNLKDE1LCA4KQ0KPiA+ID4gPiArc3RhdGljIGludCBwZWNp
X2dldF9yZXZpc2lvbihzdHJ1Y3QgcGVjaV9kZXZpY2UgKmRldmljZSwgdTggKnJldmlzaW9uKQ0K
PiA+ID4gPiArew0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgcGVjaV9yZXF1ZXN0ICpy
ZXE7DQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoHU2NCBkaWI7DQo+ID4gPiA+ICsNCj4gPiA+ID4g
K8KgwqDCoMKgwqDCoMKgcmVxID0gcGVjaV9nZXRfZGliKGRldmljZSk7DQo+ID4gPiA+ICvCoMKg
wqDCoMKgwqDCoGlmIChJU19FUlIocmVxKSkNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHJldHVybiBQVFJfRVJSKHJlcSk7DQo+ID4gPiA+ICsNCj4gPiA+ID4gK8KgwqDC
oMKgwqDCoMKgZGliID0gcGVjaV9yZXF1ZXN0X2RhdGFfZGliKHJlcSk7DQo+ID4gPiA+ICvCoMKg
wqDCoMKgwqDCoGlmIChkaWIgPT0gMCkgew0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgcGVjaV9yZXF1ZXN0X2ZyZWUocmVxKTsNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRUlPOw0KPiA+ID4gDQo+ID4gPiBBbnkgcGFydGljdWxh
ciByZWFzb24gdG8gY2hlY2sgZm9yIHplcm8gc3BlY2lmaWNhbGx5IGhlcmU/wqAgSXQgbG9va3MN
Cj4gPiA+IGxpa2UgdGhhdCB3b3VsZCBiZSBhIGNhc2Ugd2hlcmUgdGhlIGhvc3QgQ1BVIHJlc3Bv
bmRzIGFuZCBldmVyeXRoaW5nJ3MNCj4gPiA+IG90aGVyd2lzZSBmaW5lLCBidXQgdGhlIGhvc3Qg
anVzdCBoYXBwZW5lZCB0byBzZW5kIGJhY2sgYSBidW5jaCBvZiB6ZXJvcw0KPiA+ID4gZm9yIHdo
YXRldmVyIHJlYXNvbiAtLSB3aGljaCBtYXkgbm90IGJlIGEgdmFsaWQgUEVDSSByZXZpc2lvbiBu
dW1iZXIsDQo+ID4gPiBidXQgaWYgaXQgc2VudCBiYWNrIGEgYnVuY2ggb2YgMHhmZiBieXRlcyBp
bnN0ZWFkIHdvdWxkbid0IHRoYXQgYmUNCj4gPiA+IGVxdWFsbHkgaW52YWxpZD8NCj4gPiANCj4g
PiBUaGUgcmVzcG9uc2Ugd2l0aCBhbGwgMCdzIGlzIHBvc3NpYmxlIChhbmQgZGVmaW5lZCkgaW4g
Y2VydGFpbiBkZXZpY2UNCj4gPiBzdGF0ZXMuIElmDQo+ID4gdGhhdCBoYXBwZW5zIC0gd2UgZG9u
J3Qgd2FudCB0byBjb250aW51ZSBhZGRpbmcgdGhlIGRldmljZSAod2l0aCAiaW52YWxpZCINCj4g
PiByZXZpc2lvbiAwKSwgd2UganVzdCB3YW50IHRvIHJldHVybiBlcnJvci4NCj4gPiANCj4gDQo+
IE9rYXksIHRoYXQncyByZWFzb25hYmxlIC0tIG1heWJlIHdvcnRoIGEgYnJpZWYgY29tbWVudCB0
aG91Z2guDQoNCi8qDQogKiBQRUNJIGRldmljZSBtYXkgYmUgaW4gYSBzdGF0ZSB3aGVyZSBpdCBp
cyB1bmFibGUgdG8gcmV0dXJuIGEgcHJvcGVyIERJQiwNCiAqIGluIHdoaWNoIGNhc2UgaXQgcmV0
dXJucyAwIGFzIERJQiB2YWx1ZS4NCiAqIExldCdzIHRyZWF0IHRoaXMgYXMgYW4gZXJyb3IgdG8g
YXZvaWQgY2Fycnlpbmcgb24gd2l0aCB0aGUgZGV0ZWN0aW9uIHVzaW5nDQogKiBpbnZhbGlkIHJl
dmlzaW9uLg0KICovDQoNCj4gDQo+ID4gPiANCj4gPiA+IEFsc28sIGdpdmVuIHRoYXQgdGhlIGRv
Y3MgKHRoZSBvbmVzIEkgaGF2ZSwgYXQgbGVhc3QpIGRlc2NyaWJlIHRoZSBESUINCj4gPiA+IGFz
IGEgY29sbGVjdGlvbiBvZiBpbmRpdmlkdWFsIGJ5dGVzLCBkZWFsaW5nIHdpdGggaXQgYXMgYSBj
b21iaW5lZCB1NjQNCj4gPiA+IHNlZW1zIGEgYml0IGNvbmZ1c2luZyB0byBtZSAtLSBjb3VsZCB3
ZSBqdXN0IHJldHVybiByZXEtPnJ4LmJ1ZlsxXQ0KPiA+ID4gaW5zdGVhZD8NCj4gPiANCj4gPiBH
ZXRESUIgcmV0dXJucyA4LWJ5dGUgcmVzcG9uc2UsIHdoaWNoIGlzIHdoeSB3ZSdyZSB0cmVhdGlu
ZyBpdCBpbiB0aGlzIHdheQ0KPiA+IChzaW1pbGFyIHRvIG90aGVyIGNvbW1hbmRzKS4gV2UncmUg
cHVsbGluZyBvdXQgdGhlIHdob2xlIHJlc3BvbnNlIGFuZCB1c2UNCj4gPiBGSUVMRF9HRVQgdG8g
b2J0YWluIHRoZSBkYXRhIHdlIG5lZWQuDQo+ID4gDQo+IA0KPiBTdXJlIC0tIGJ1dCBzaW5jZSB0
aGUgOCBieXRlcyB0aGF0IEdldERJQiByZXRyaWV2ZXMgYXJlIGEgZGV2aWNlIGluZm8NCj4gYnl0
ZSwgYSByZXZpc2lvbiBudW1iZXIgYnl0ZSwgYW5kIHNpeCByZXNlcnZlZCBieXRlcyAoYXQgbGVh
c3QgYXMgb2YgdGhlDQo+IGRvY3VtZW50YXRpb24gSSBoYXZlIGFjY2VzcyB0byksIEknbSBub3Qg
c3VyZSB3aHkgd2Ugd2FudCB0byBwYWNrIHRoYXQNCj4gYWxsIHVwIGludG8gYSB1NjQgb25seSB0
byB1bnBhY2sgYSBzaW5nbGUgYnl0ZSBmcm9tIGl0IGEgbW9tZW50IGxhdGVyDQo+IHdpdGggRklF
TERfR0VUKCksIHdoZW4gd2UndmUgYWxyZWFkeSBnb3QgaXQgaW4gYSBjb252ZW5pZW50DQo+IGFy
cmF5LW9mLWJ5dGVzIGZvcm0gKHJlcS0+cnguYnVmKS7CoCBJIGNvdWxkIHVuZGVyc3RhbmQgd2Fu
dGluZyBhIHU2NCBpZg0KPiB0aGUgOCBieXRlcyB3ZXJlIGFsbCBhIHNpbmdsZSB2YWx1ZSwgb3Ig
aWYgaXQgaGFkIHN1Yi1maWVsZHMgdGhhdA0KPiBzcGFubmVkIGJ5dGUgYm91bmRhcmllcyBpbiBh
d2t3YXJkIHdheXMgb3Igc29tZXRoaW5nLCBidXQgZ2l2ZW4gdGhlDQo+IGZvcm1hdCBvZiB0aGUg
cmVzcG9uc2UgZGF0YSBhIGJ5dGUgYXJyYXkgc2VlbXMgbGlrZSB0aGUgbW9zdCBuYXR1cmFsIHdh
eQ0KPiBvZiBkZWFsaW5nIHdpdGggaXQuDQo+IA0KPiBJIHN1cHBvc2UgaXQgZmFjaWxpdGF0ZXMg
YW4gZWFzeSB6ZXJvIGNoZWNrLCBidXQgdGhhdCBjb3VsZCBhbHNvIGJlDQo+IHdyaXR0ZW4gYXMg
IW1lbWNocl9pbnYocmVxLT5yeC5idWYsIDAsIDgpIGluIHRoZSBub24tdTY0IGNhc2UuDQoNCldo
YXQgeW91IHN1Z2dlc3Qgd291bGQgbG9vayBsaWtlIHRoaXM6DQoNCnN0YXRpYyBpbnQgcGVjaV9n
ZXRfcmV2aXNpb24oc3RydWN0IHBlY2lfZGV2aWNlICpkZXZpY2UsIHU4ICpyZXZpc2lvbikNCnsN
CiAgICAgICAgc3RydWN0IHBlY2lfcmVxdWVzdCAqcmVxOw0KDQogICAgICAgIHJlcSA9IHBlY2lf
Z2V0X2RpYihkZXZpY2UpOw0KICAgICAgICBpZiAoSVNfRVJSKHJlcSkpDQogICAgICAgICAgICAg
ICAgcmV0dXJuIFBUUl9FUlIocmVxKTsNCg0KICAgICAgICBpZiAoIW1lbWNocl9pbnYocmVxLT5y
eC5idWYsIDAsIFBFQ0lfR0VUX0RJQl9SRF9MRU4pKSB7DQogICAgICAgICAgICAgICAgcGVjaV9y
ZXF1ZXN0X2ZyZWUocmVxKTsNCiAgICAgICAgICAgICAgICByZXR1cm4gLUVJTzsNCiAgICAgICAg
fQ0KICAgICAgICAqcmV2aXNpb24gPSByZXEtPnJ4LmJ1ZlsxXTsNCg0KICAgICAgICBwZWNpX3Jl
cXVlc3RfZnJlZShyZXEpOw0KDQogICAgICAgIHJldHVybiAwOw0KfQ0KDQpOb3RlIHRoYXQgdGhl
IGNhbGxlciAoZGV2aWNlLmMpIG5vdyBuZWVkcyB0byBrbm93IHJlYWQgbGVuZ3RoIC0NClBFQ0lf
R0VUX0RJQl9SRF9MRU4gKHdoaWNoIGN1cnJlbnRseSBpcyBpbnRlcm5hbCB0byB0aGUgcmVxdWVz
dC5jKSBhbmQgaXMNCmRpZ2dpbmcgaW50byByeC5idWYgZGlyZWN0bHkgKHJhdGhlciB0aGFuIHVz
aW5nIGhlbHBlciBmcm9tIGludGVybmFsLmgpLg0KDQpCeSBmb3JjaW5nIHRoZSBjYWxsZXJzIHRv
IHVzZSBoZWxwZXIgZnVuY3Rpb25zLCB3ZSBjYW4gbWFrZSB0aGluZ3MgY29uc2lzdGVudA0KYWNy
b3NzIHZhcmlvdXMgY29tbWFuZHMgYW5kIGF2b2lkIGV4cG9ydGluZyBldmVyeXRoaW5nIHRvIGV2
ZXJ5b25lIHVzaW5nIGEgZ2lhbnQNCmhlYWRlciB3aXRoIGFsbCBkZWZpbml0aW9ucy4NCg0KSSB3
b3VsZCBwcmVmZXIgdG8ga2VlcCBwZWNpX2dldF9yZXZpc2lvbigpIGFzIGlzLg0KDQpUaGFua3MN
Ci1Jd29uYQ0KDQo=
