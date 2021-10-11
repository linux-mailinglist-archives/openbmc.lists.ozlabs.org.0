Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFE74298EE
	for <lists+openbmc@lfdr.de>; Mon, 11 Oct 2021 23:31:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSsRX06jYz2yQM
	for <lists+openbmc@lfdr.de>; Tue, 12 Oct 2021 08:31:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=hN1x3fJH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=hN1x3fJH; dkim-atps=neutral
X-Greylist: delayed 123 seconds by postgrey-1.36 at boromir;
 Tue, 12 Oct 2021 07:42:01 AEDT
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HSrLx3Z4zz2yNp;
 Tue, 12 Oct 2021 07:42:01 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="227252206"
X-IronPort-AV: E=Sophos;i="5.85,365,1624345200"; d="scan'208";a="227252206"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 13:38:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,365,1624345200"; d="scan'208";a="441568574"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga003.jf.intel.com with ESMTP; 11 Oct 2021 13:38:48 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 11 Oct 2021 13:38:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 11 Oct 2021 13:38:47 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 11 Oct 2021 13:38:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l0xngkOAJ+Qut0yUxaibihmG5qt9b118dH5yIxwRxcPa49bMbaSrOmsFvb2nNSH7NiU85f4+r4jjxLFCTci13YseZZBIl9sq/VcP19QpPJ8YAHG7RvSs47VPIg/VfkBnNGDUn09pM0fOyReEsQLExCmsIYOTjyz7w85FvNJabkyHw3+neKIVBSdf/fclUAdAvz4Vr26uy4VQHG5VByBA2RYhfCsZY8bf7YHTaBu9zPLhkVOYbHSYlvAeepj8ZuSoT7MkMGUff5EEXLWmHtlFN+B+Qi7+jrzx7Ia+0IpaVF6Tm/rQQAFIkXmMKm2uDzDkZ2g2BOkKmmFVrIc1rH+2+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FiDYVmOJOvldamym957IgpL6OmeSptWpPF5I8o8QExU=;
 b=Zn9bbYd0uZ4sv0n0CInKrwIc4Oql3vooLGWc3SzjZE5K+MTrla6B1Ru71FPh9bJtf3rndb+1KNu2C8a26UJ31RugYLEyZdUmH8vDjbef01jChV+oQMPVP38sBmTNxr1cETxIcl/0X4FTEx70i/qr9EUEFghMV2NRQl2oy2ePRoEWej9wMCxH/+nj8ydbKg/2cbrzOQ6AoGeB0tdjjuKP0qYeN/nvIThl2kLyCR9eGt2ZioMDVIZI6tDkP003581rZ016G6K1Nd05q2nBbypcg2awvaZ3zSKlm2j3H9onSGufx0XfWcwrHguONnalbA3aSJ5R0mgeorcjgSGJoJb4Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FiDYVmOJOvldamym957IgpL6OmeSptWpPF5I8o8QExU=;
 b=hN1x3fJHqZU58ucIwhsIcYIMeGQXKpIZv9PeqPZLDC6+okIy6SVGyicyJ3w0T4W/zohjOIaDI3Pv9pFipWIi1jTt6VHz9cgqdqoshtyMfzGL5mfaBsnF8MgUrjvr9hLHlGmvJ00JfqLIAR1aZ5r22EWKP4klfWarir2vGyBfwdk=
Received: from CY4PR1101MB2278.namprd11.prod.outlook.com
 (2603:10b6:910:18::13) by CY4PR11MB1399.namprd11.prod.outlook.com
 (2603:10b6:903:2f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Mon, 11 Oct
 2021 20:38:43 +0000
Received: from CY4PR1101MB2278.namprd11.prod.outlook.com
 ([fe80::c482:c237:bcf1:70bc]) by CY4PR1101MB2278.namprd11.prod.outlook.com
 ([fe80::c482:c237:bcf1:70bc%11]) with mapi id 15.20.4587.026; Mon, 11 Oct
 2021 20:38:43 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "bp@alien8.de" <bp@alien8.de>
Subject: Re: [PATCH v2 01/15] x86/cpu: Move intel-family to arch-independent
 headers
Thread-Topic: [PATCH v2 01/15] x86/cpu: Move intel-family to arch-independent
 headers
Thread-Index: AQHXiFtZAf43JMVeikGj7NGS9LF26KvDlHGAgAsFNYCAAAyiAIAACPWA
Date: Mon, 11 Oct 2021 20:38:43 +0000
Message-ID: <337b6332312ea63862aedd09279417c9e1c7e11f.camel@intel.com>
References: <20210803113134.2262882-1-iwona.winiarska@intel.com>
 <20210803113134.2262882-2-iwona.winiarska@intel.com>
 <YVtQG+idmwKn0qLe@zn.tnic>
 <58ef4107e9b2c60a2605aac0d2fb6670a95bc9e0.camel@intel.com>
 <YWSZTq8NWWcCMXtA@zn.tnic>
In-Reply-To: <YWSZTq8NWWcCMXtA@zn.tnic>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-1.fc34) 
authentication-results: alien8.de; dkim=none (message not signed)
 header.d=none;alien8.de; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 434f7dac-9043-4e78-09cd-08d98cf71dbc
x-ms-traffictypediagnostic: CY4PR11MB1399:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR11MB1399E6E405C3D6DF63CEB135ECB59@CY4PR11MB1399.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xWR07BHcjEKNhraSEOn6397eESSP7awYTZ+EnGNzEQQLQI8KTAexqpV+UOPI11dLLmi0mrsvTU7bTFCjn6nd5aGj1P048yeZwUVudEHgkbkj2YADJvpO2yyDEgrswvqzeJhp/HATXi2ufcwqLdvj0FFz85ppxbKuYGT7NHMWv3H/xR74nnGXa8J+RBNHAO3++qVolU/eWDoSfW8V9fliX9t42y0bLz1jKZIywoUnDq66AXFWxeWyOBXyOUGyqQ9Yes+dF4BNOzO4YaQgdgPgYSHy5Qi9fpnuliWfRsspdZluZfmhjP95WKd07vB5S9UszRShnSPwR/77PSrs5aCjlMTp6t9EmB3eXCPQvC7ZwJad9xcdoQkzCO++ELhaPXZerdNclkutLE+qDtKkcUuBZl6qoPcncAioaiqheQ0vFPFhMCqcWIXkwWRWLJm/5O0tZvZVVMjfGbmIYvQNtW1xqPiAPlPxGxld/bS9VJr9gBAjneTahuAq2CnxxAjR6pmunrPcEtN/RMo8wie2xaDftLgBDCFzgzv7mh289jDAnUHcbqO35E6z1fulXGNft9rQdEfO++ZYw7tFg3/Nu9BwE3I+egL+w5YBoM24bdHpd42gFszyzOOZLk2Y/CV5sq/5FYVepu8Tzeu4SBhhfm3EB9R/kXSHdxPhAVN2W0wOqyetZUYRMjr13Wm0E8RS8SMIpSUqnKzujyuFI/IXALDNdA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1101MB2278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(6506007)(4001150100001)(7416002)(7406005)(76116006)(8936002)(86362001)(83380400001)(186003)(26005)(122000001)(5660300002)(6486002)(8676002)(38100700002)(36756003)(91956017)(38070700005)(54906003)(316002)(508600001)(64756008)(6512007)(66446008)(6916009)(66556008)(66476007)(2906002)(2616005)(71200400001)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?THU2V3I2KzFOL2JMaDNYazFvSWxjL2ZXSWpaWENwMWhVRm0vRXBhazgzcWxx?=
 =?utf-8?B?OVFJUi9Ga2dpdXhVUFJJQit5M05aUUh1MTByYmpVakg4OGY2UHNsaWlDZzFX?=
 =?utf-8?B?WWhjcFVDbitxVnZXaStqbmlWQnQ4SDJXOFJHVFR2bWNHMlUrYTR5eUtSalZa?=
 =?utf-8?B?U3habzZTUjlkSjArajdxbVRoRWZQdWFweFJKZWF3cjA4Z1FqZi9kR0lsNzYr?=
 =?utf-8?B?dVpWenFiT0RESWhwaEZzM3FobVVOZXhyR1FsQ3VxVUxlUTBWY29UMEN1SGJO?=
 =?utf-8?B?NHRETWgyZHU1Z1Z4R1BaMzJsUEU2ZS9DWThsNHQ4WHRwTys1UlZqVTJKZlp0?=
 =?utf-8?B?WEdpaUZ0dWlyVVBxcWNOZEhvTHo5U0V5UWVwRG8xTGJvQ0RSanQ5OTF5dURU?=
 =?utf-8?B?RVIwVFErMEw2Skl6OFRVQXJtaEsvYVlWVFVPUzJNOEN5VjRUeGI4Yko4REVY?=
 =?utf-8?B?OHd5ZTUybUVYTm42aUNGbzNvblFoeUlweE9kYzBYUVRqNDBKVkdkMnJ3dHdU?=
 =?utf-8?B?elNqaG5vVURWcysvbzh1ZUQ3KzVQekNXL2pWT1IrR1k4OGlZK1VOTEhkWjVC?=
 =?utf-8?B?WXBXUDQ1Ky9hSXRXL1czS3FXa1ZncTJaUUhCWVpOamdZdHhPM0U5ZVMzOHY1?=
 =?utf-8?B?QUlHVnhGKzNJZ0wwcUYrVk1mSXZoUU1ReDQ0c1NGVnBvWitWekJhenJBMzdq?=
 =?utf-8?B?bzN0VE5IV210OW8wU2hwK0l4eVAvSE1LcEpUb0xRbTFmYkxzV0JxblFHaFky?=
 =?utf-8?B?bERlNkZuR2RmamtrVEJxdTUrc2VSeTZUczdVY3kzOSt1QWhyWTh6OFF4dGtE?=
 =?utf-8?B?YS9OSHJJT2FPTWZ3SlBlM3lLdCt5OGg5dThMdkc2TWtZSGYvWHhtQUw1SzE2?=
 =?utf-8?B?aUpuY2tuSWE1TXc2RUg2L2szUytSejdlV3UvWVpERFZqVFRzQ0hwb1cxMHVl?=
 =?utf-8?B?NnRTWkhwcmJDS2llNlFxTXYzb1RwVk8rcWh5S0ZCblVsN0dkeGw2VGlVMDNQ?=
 =?utf-8?B?cFRFb3lVNjZqcmFUZzBFTEJYSWlsU2NsN1hWSENhQzJoaE9iZkZqNFp3a0o1?=
 =?utf-8?B?ZVFXRkVuWXBwV0NBemc1dnpwYitYRnZzR3BUOWxiWml1V0lHV1RBb3Q0b0FI?=
 =?utf-8?B?VVlVY0t1SHU0SXBQTFVwSDlKRG5wMFJrTlp4WEF1UmJqaDJUcnBwYkJONnRW?=
 =?utf-8?B?dXY2M2hKRDJKSGV4UlRrS2QvamZ5bHVPR1B3TVI2aHkzbmh2VVZoZC93Umpw?=
 =?utf-8?B?Yk43c1R6V0lpbXJqbldLVUJtaTNlcWgzOWtEWUZKVGtwUEJjam5WV0NaRU0z?=
 =?utf-8?B?OWhybUFXS2V4RWFsbE9qMVYzVWtKaHRQRi94dzhacitkdENUMjFjUDEydHdJ?=
 =?utf-8?B?SlRBbDNTUzNueFVaM0l2d3VrMk0ramV6cXRoRlBHbDlFU2dDeWZHZytoUE9t?=
 =?utf-8?B?OUFrOU90eDA5TGpXaHNia0R1Q09IVGtFTEpJc2c3bm81d1Fvd0x6dnh0djFy?=
 =?utf-8?B?b0xYd21vSjRLdWFKUk5jUGk1OW5rN09yS1d0bTFZL0VGUHV2bDR3b3BKY2JI?=
 =?utf-8?B?N3VrRk9xRi9lYmJOQVppc2lKd3Jvekt4YnFRTjkvL3lVOG1ZUWd3OFlqaFY4?=
 =?utf-8?B?QS9ORk8wc0lHMzdTaTlMSjZUeTdIOXJuelV3Y1o2Rno3ejdXajhqeGxQZVYw?=
 =?utf-8?B?YmtRUW1DR3JkczZkeFJwNGhidnJmWnYzelZ2b3lJWlZURkQxN0hZcmhFZ3hN?=
 =?utf-8?B?c0FiTTN2U1dBSnZmdTRtVkNhQTdVMmd1cmJaS2xrOSt5VTRYZjNBamk3WThM?=
 =?utf-8?B?Yk1SVkg3a1hCbHlYS09XZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E73F2F100B2FD34DAE85212290609955@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1101MB2278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 434f7dac-9043-4e78-09cd-08d98cf71dbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2021 20:38:43.0890 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /it4gJlCZtDQuAbzhqPpU2Za9727q6FChjbFVl51J/nnYf+aTrLDMgHAGesjyUi1yHH1b44QM/5zFp1rKuWKfQ2IrUXx6+C24m+gi40Df+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1399
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Tue, 12 Oct 2021 08:28:10 +1100
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
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "Williams,
 Dan J" <dan.j.williams@intel.com>, "zweiss@equinix.com" <zweiss@equinix.com>,
 "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "Lutomirski,
 Andy" <luto@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "Luck,
 Tony" <tony.luck@intel.com>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "yazen.ghannam@amd.com" <yazen.ghannam@amd.com>,
 "olof@lixom.net" <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gTW9uLCAyMDIxLTEwLTExIGF0IDIyOjA2ICswMjAwLCBCb3Jpc2xhdiBQZXRrb3Ygd3JvdGU6
DQo+IE9uIE1vbiwgT2N0IDExLCAyMDIxIGF0IDA3OjIxOjI2UE0gKzAwMDAsIFdpbmlhcnNrYSwg
SXdvbmEgd3JvdGU6DQo+ID4gU2FtZSByZWFzb24gd2h5IFBFQ0kgY2FuJ3QganVzdCBpbmNsdWRl
IGFyY2gveDg2IGRpcmVjdGx5ICh3ZSdyZSBidWlsZGluZw0KPiA+IGZvcg0KPiA+IEFSTSwgbm90
IHg4NikuDQo+IA0KPiBBaGEuDQo+IA0KPiBTbyB3aGF0IGRvIHlvdSBuZWVkIHRob3NlIElOVEVM
X0ZBTTYqIGRlZmluZXMgZm9yPw0KDQpUbyBpZGVudGlmeSB0aGUgeDg2IENQVSBhbmQgdXNlIHRo
YXQgYXMgYSBtYXRjaCBmb3IgYmluZGluZyBQRUNJIGRyaXZlcnMuDQoNCj4gSSBzZWUgcGVjaV9j
cHVfZGV2aWNlX2lkc1tdIHdoaWNoIGFyZSB1c2VkIHRvIG1hdGNoIHRoZSBDUFUgc28gYXQgbGVh
c3QNCj4gdGhhdCB0aGluZyBtdXN0IGJlIGxvYWRpbmcgb24geDg2IGhhcmR3YXJlLi4uIHJlYWRp
bmcgeW91ciAwdGggbWVzc2FnZSwNCj4gaXQgc291bmRzIGxpa2UgdGhhdCBwZWNpLWNwdSB0aGlu
ZyBpcyBsb2FkZWQgb24gYW4geDg2IENQVSBhbmQgaXQgdGhlbg0KPiBleHBvc2VzIHRob3NlIGlu
dGVyZmFjZXMgd2hpY2ggYSBQRUNJIGNvbnRyb2xsZXIgYWNjZXNzZXMuDQoNCkV2ZXJ5dGhpbmcg
dGhhdCdzIHBhcnQgb2YgdGhpcyBzZXJpZXMgcnVucyBvbiB0aGUgQk1DIChCYXNlYm9hcmQgTWFu
YWdlbWVudA0KQ29udHJvbGxlcikuIFRoZXJlJ3Mgbm90aGluZyBBUk0gc3BlY2lmaWMgdG8gaXQg
LSBpdCdzIGp1c3QgdGhhdCB0aGUgQk1DDQpoYXJkd2FyZSB3ZSdyZSBjdXJyZW50bHkgc3VwcG9y
dGluZyBpcyBBUk0tYmFzZWQuDQpQRUNJIGlzIGFuIGludGVyZmFjZSB0aGF0J3MgZXhwb3NlZCBi
eSBzb21lIHg4NiBDUFVzIC0gYnV0IHRoYXQncyBhIGhhcmR3YXJlDQppbnRlcmZhY2UgKGF2YWls
YWJsZSBjb21wbGV0ZWx5IGluZGVwZW5kZW50IGZyb20gd2hhdGV2ZXIgaXMgYWN0dWFsbHkgcnVu
bmluZyBvbg0KdGhlIHg4NiBDUFUpLg0KDQo+IA0KPiBBbmQgdGhlbiBJIHNlZSBpbiBpbml0X2Nv
cmVfbWFzaygpIHRoZSBzaW5nbGUgdXNhZ2Ugb2YgSU5URUxfRkFNNiogYW5kDQo+IHRoYXQgZHJp
dmVycy9od21vbi9wZWNpL2NwdXRlbXAuYyBpcyBhIENQVSB0ZW1wIG1vbml0b3JpbmcgY2xpZW50
IHNvDQo+IHRoYXQgdGhpbmcgcHJvYmFibHkgcnVucyBvbiB4ODYgdG9vLg0KDQpUaGF0IGFsc28g
cnVucyBvbiBCTUMsIGl0IHVzZXMgZnVuY3Rpb25hbGl0eSBvZmZlcmVkIGJ5IHBlY2ktY3B1IHRv
IGV4cG9zZSBod21vbg0KaW50ZXJmYWNlIHRvIHVzZXJzcGFjZS4NClVzZXJzcGFjZSB0aGF0IG1h
a2VzIHVzZSBvZiB0aGF0IGh3bW9uIGludGVyZmFjZSBhbHNvIHJ1bnMgb24gdGhlIEJNQyBhbmQN
CmV4cG9zZXMgc2Vuc29yIGRhdGEgdG8gdXNlciAodmlhIHJlZGZpc2ggQVBJLCBvciB3ZWItYmFz
ZWQgaW50ZXJmYWNlKS4NCg0KPiBPcj8NCj4gDQo+IElmIGl0IGRvZXMsIHRoZW4geW91IGRvbid0
IG5lZWQgdGhlIGNvZGUgbW92ZS4NCj4gDQo+IEJ1dCBpdCBsb29rcyBsaWtlIEknbSBtaXNzaW5n
IHNvbWV0aGluZy4uLg0KPiANCg0KSSdtIHNvcnJ5IC0gaXQgbG9va3MgdGhhdCBteSBkZXNjcmlw
dGlvbiBpbiB0aGUgY292ZXIgbGV0dGVyIHdhc24ndCBjbGVhcg0KZW5vdWdoLg0KDQpUaGFua3MN
Ci1Jd29uYQ0KDQo=
