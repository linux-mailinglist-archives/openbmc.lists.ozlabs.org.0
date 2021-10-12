Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FFB42CCB6
	for <lists+openbmc@lfdr.de>; Wed, 13 Oct 2021 23:22:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HV58S2Pxyz2yQm
	for <lists+openbmc@lfdr.de>; Thu, 14 Oct 2021 08:22:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=viuZm859;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=viuZm859; dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTWkT02dvz2yM4;
 Wed, 13 Oct 2021 10:16:10 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="250702669"
X-IronPort-AV: E=Sophos;i="5.85,369,1624345200"; d="scan'208";a="250702669"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 16:15:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,369,1624345200"; d="scan'208";a="717049022"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 12 Oct 2021 16:15:06 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 12 Oct 2021 16:15:06 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 12 Oct 2021 16:15:05 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 12 Oct 2021 16:15:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GlsjysQy0rJcSvEOxSYp/QzDvNKSBchcEKG48SRjVwvw5eTHHk+zYwtGLi//W3SV126fndr5/RmF4QqbR0Us435QYmtjquxM3kSNm7GFXj5HCS8kGH9zD59kfUszFE85Kw0CaI61cI4zmeVImEvHMlaBFnBocAQYUizIwVw6R/+aotcRkQZOT6nlGPqsXg3xXFDoHffo7dBVlxW+uZgXHdmbpQgZAKeExEEE5p+hYSWSn8mp0x1LNyaVP1ITUzqcpeGLerqfQwxaC+nhhDxsKw0skgncfnyqph92rIo6/2UqbQ6ZDUuJ2TODHaD1z6KGQ+3jXLVitgmS8sO9LEstWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIar0rxq4/xF8UZnP74GwakCXBdK4+rUZRtp3TNxUDk=;
 b=B5V6dovVWWTIIJKaKhc3eaNwLW6NI+XJkF37sLybgBpVCLVUSJbZ/Zy2y6r+4XlIVAB7/wljHIo7y4bYdLr0BAeelgs9hfnD9rhtmCEIiQw35OKEig+cAfK5h6nc36bSsr1/HGaRrtoB6jKohHZykvXw9i0SJnhq7afKhhdtUHgIqvhNtUp8Ua77CUKfSynyDoU9VZ8lzAYhESr6xfpTw8GePurhKkDiBudN+q4fkl/qG0IPIOr7pBCXISM7As1Vp2YB0F3VcrqIt5YERi/wjE9I+//NPO81kmkjUlPIlN1ZKXK9M6Nvswetq51VEC24+CikfgaklUMoThX/NjwwDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIar0rxq4/xF8UZnP74GwakCXBdK4+rUZRtp3TNxUDk=;
 b=viuZm8590v/SeoiTcy3e0KR98KVMtPFpjA9ZucbLVxV6vwjXiwUgHBeXmLT60vZJh5athY/6tdKDFH+BWCcExosGwkuoJXS9VP/FWmaSRyxo106mk96LsxruqWxwiTxnmY1WZJ5ASLjDKB0K4F0k6VzK+SyCjoKnE7zGjYyf9Gk=
Received: from CY4PR1101MB2278.namprd11.prod.outlook.com
 (2603:10b6:910:18::13) by CY4PR11MB2054.namprd11.prod.outlook.com
 (2603:10b6:903:2d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Tue, 12 Oct
 2021 23:15:00 +0000
Received: from CY4PR1101MB2278.namprd11.prod.outlook.com
 ([fe80::c482:c237:bcf1:70bc]) by CY4PR1101MB2278.namprd11.prod.outlook.com
 ([fe80::c482:c237:bcf1:70bc%11]) with mapi id 15.20.4587.026; Tue, 12 Oct
 2021 23:15:00 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "bp@alien8.de" <bp@alien8.de>
Subject: Re: [PATCH v2 01/15] x86/cpu: Move intel-family to arch-independent
 headers
Thread-Topic: [PATCH v2 01/15] x86/cpu: Move intel-family to arch-independent
 headers
Thread-Index: AQHXiFtZAf43JMVeikGj7NGS9LF26KvDlHGAgAsFNYCAAAyiAIAACPWAgAAO04CAAa8sAA==
Date: Tue, 12 Oct 2021 23:15:00 +0000
Message-ID: <15d81463b631e03b00a7031510304d5598fc246c.camel@intel.com>
References: <20210803113134.2262882-1-iwona.winiarska@intel.com>
 <20210803113134.2262882-2-iwona.winiarska@intel.com>
 <YVtQG+idmwKn0qLe@zn.tnic>
 <58ef4107e9b2c60a2605aac0d2fb6670a95bc9e0.camel@intel.com>
 <YWSZTq8NWWcCMXtA@zn.tnic>
 <337b6332312ea63862aedd09279417c9e1c7e11f.camel@intel.com>
 <YWStQSrRJQ09KXVY@zn.tnic>
In-Reply-To: <YWStQSrRJQ09KXVY@zn.tnic>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-1.fc34) 
authentication-results: alien8.de; dkim=none (message not signed)
 header.d=none;alien8.de; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a066c741-8302-4514-226a-08d98dd61d59
x-ms-traffictypediagnostic: CY4PR11MB2054:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR11MB20542CD234DC6AEEFBFEFF00ECB69@CY4PR11MB2054.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fsOHkNNZJeF8VtPA14kO43F2X6j5Adz2UogYyvJBNHFSsQ6eTIrmVygdCXbJNN2OkkSVH929wDnc9CPWYpCEBCcjn2vbb0KiD1DHbJgw8nur4K9+adiNaDTHDIbfOrCyE4QN6lUV/mlQKvLo1EBTbsABkitA0Dt/7Ybu1pdhHHcZDCv5Nl2xJIYan87D0dU7vLKFkWsXxFEYDC/9Ruq1B6ZQfEO9p7o0VhR0TVXJWOgT7P+l/v130D8J1z25Hc12as6Dud76WWFySwOeaG/LtYvuvbXlU89t0wsr2gSDsfJhugHil2bsUAh5gQ4Ktq5dfde+JjdJI/lvyuz/F79CkuIpyaqz/cRCb8BOnIDFt1eX4nM5CG+7oLDhKZErchuDMqJr9rDOmFvN480B1PQ30ZFXcRZZ1ksjFoGNSs7ZxyDBCN3NKA0UxrTu3vltbZN5VUYQDnWQvprmIfTt3V/+oObMjiI6tMh+2E00Amhm5ozICqMxxavJ/Yhr4xz0KWYX41KF2Vx9SGcw4dSOZL7rDxkJhil3fXSExtT9PJpKWuK8Yh/1ns8t4kOUAtZBopJVSGmDjKPDxaoFahxpwbtxci4ltM50/miqhJ9XwQOb4llUMjf8bZQMKI6LNLUuMRVjI8XpwG2FPWjapILxUxs/25jie3/2ev91Qs1pS07sngVVdyR2/tH/A3zZ8+S7NbqfI/7VRnJHosCJF+/CRSasNw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1101MB2278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4001150100001)(86362001)(83380400001)(7416002)(7406005)(2616005)(6512007)(316002)(8936002)(6506007)(5660300002)(54906003)(2906002)(82960400001)(26005)(186003)(38070700005)(66476007)(8676002)(38100700002)(91956017)(4326008)(66946007)(508600001)(6916009)(6486002)(64756008)(66556008)(36756003)(71200400001)(66446008)(76116006)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WnBOeW5PVEJvdTJKYzFheENFM0Q0OHh0SHhOK1hJSUxsb3BXZElHNWZIenYw?=
 =?utf-8?B?aGE1alZQVEpycG5BeHlGTHlydTI1RUJwaWFpeEwxbXhuWmVUTDVqVmZ1RlI1?=
 =?utf-8?B?TmYxamdFUVNmbS9WanpxY3laTUxmRWpGdnNSL2x4UGNpQjRxaFZwQlFqaksz?=
 =?utf-8?B?Wk1PRFlkSmZzdlJkSGpaaUhoVGVLN3lBNytCRFJRcG5ld05uWC93MjRnWW5Z?=
 =?utf-8?B?bXVBV01UQ3E2UnU1QnZTNDRET1d0QTV6YmZ6VlJybzVhVnhQYUVzNnUwWXU0?=
 =?utf-8?B?ZU9PcmtwT1J4RzRwZzU1NWNHVTBDdDh0cW1MTjdVaXVSK2d3UGFBRmJpNFlE?=
 =?utf-8?B?WSs4dW9VSDl5NWtReXhhbzE0RzVLSXN0WUVMQ0xxdWJWRCtvSXFLcmJnNHo3?=
 =?utf-8?B?U29uQzF4VUpETzVXbnVUcUZKUnovMTI3bnlHSmF0UzBic3NkNzl6MkxXWFd1?=
 =?utf-8?B?TGJOcWVJZ095M3JlVmRxLzNGaW9rbzJXOWk0OWs4TmVOMEFYZFUvSFBzNm8w?=
 =?utf-8?B?RkNZNlRnUkg0SEQxdU1PWHRacXByODFxU282d29MVERvejIxRDB5ZHNlejdu?=
 =?utf-8?B?eEcydUI1c0t0OFlHSzZ0RWZmRGpUMkJkSDc5RHg4dlVmcU5wOEhUU0RDcmZG?=
 =?utf-8?B?NlNGMTBJZGJkRlpnVVNNYk9TMlAwcHM3Q3pNYzVwQkVvQXdobXBzUCtQSS8z?=
 =?utf-8?B?YjhBek53VFlRNzhOYXlwb0dhSmhub3c5cEw4NlBVLzRnQ1BrUlNoUCtaREtv?=
 =?utf-8?B?ancrRWdxa21iVjRaNjh3WkgrSGt1b3RSYkxzeGZpZzVlcUZXNEdYalRTNUlu?=
 =?utf-8?B?SGdsNys2SjlMdGRtcGdtdktuRkhrNDE2VnJQZ2RERGtENHZ2TzdCcWNZcTly?=
 =?utf-8?B?OHJTZGJYNmlPWGhBdXdiN244R2k1TThkVXl3MDJkc1oxb1pHRnhlRHRNZlhF?=
 =?utf-8?B?QU9XNjUrTDRhekZTRDNMYTIwZUxnWGl2RXVvL3pDNHNxYUZwT0gvYWRMTUZR?=
 =?utf-8?B?emZyektpV0xjYzd4M2ZjQ0RmdXRwbDZlejF4SnJYdlhOMjYrcVlpNlNmeFJB?=
 =?utf-8?B?SExoU2pOWUNITkJ0UkIza0VOc1R2SHZoMm80akkrNUY0TUY0Rjc5N1dTVUlB?=
 =?utf-8?B?WFRzVitHK2pxYWtPZGZXeGdYVTFrZlpwNjRhUFZXdVo4a1ArVmVzYmwyT1dm?=
 =?utf-8?B?T1dURUZ5Wmg3bWpTWkxMNnd2cE5CWVBoNFNpejRYU3FlZmxXMEZmVUxIMFdh?=
 =?utf-8?B?NGNHTjQwSlZQVGJqc3h2YXgrSEpwVERObm5MU3lCR08xRVBUR2diM2NNdnhu?=
 =?utf-8?B?TXlONXI2T2Rjb05ER3VtQVhwbTF3L0drVHYvYU4rNm5SSnM4Q3czejBJNVph?=
 =?utf-8?B?ZnhSU2Jwb0o1eFM1R2c2akNiV0RUTlE3N2FFK0pjcFYyV2p3S1ZsdkRUZHll?=
 =?utf-8?B?Z0hDS0lyQUpYUnpKSGdoUHNDcWsxQ3U5V1NuUHA4QXkyVTZWY0E3ZUd4am5O?=
 =?utf-8?B?UlpIMHVaOUhwTTNCMExLSkR0SzNWeGI1Zm1laGE4dkpDQ0pCM0x3QWJWK0JE?=
 =?utf-8?B?MGZaSEE5M3A0U2dTZ1p1TTBoZnhaNmJVcVVoZStVSHFNN0hFUFlFaGlZTFlh?=
 =?utf-8?B?TWsvN2g4VW1FcGt4d3BEN1EvN09SUEFwSW5hL1NjOUd4TjdzaHc4SyszaEc4?=
 =?utf-8?B?dGZLODRHTWhLTUg1ZGovejVicHFpejE0M2IrdWljS2tLNU10VnJBRVdkZDEy?=
 =?utf-8?B?bVpvSWh5Y1JoSkFuZGVxaGZ5a0Eyd2RGUjBUUHhtVkhtQW9OZldkMTZZQVhy?=
 =?utf-8?B?akZ0R1JBTGgxMFRFOTRhZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5584D61A0EEEB040B4B6D93D6013587B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1101MB2278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a066c741-8302-4514-226a-08d98dd61d59
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2021 23:15:00.2785 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jpHwdSfHeZKCd76kP+QZ6R5+gyTxfviQUfBLNLUf8ojpClBhW47tOxLurfkAXNxREFClexfYeyPCDpTmpHojE4b347SALhMZ9xsuXVwodFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB2054
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Thu, 14 Oct 2021 08:21:53 +1100
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

T24gTW9uLCAyMDIxLTEwLTExIGF0IDIzOjMxICswMjAwLCBCb3Jpc2xhdiBQZXRrb3Ygd3JvdGU6
DQo+IE9uIE1vbiwgT2N0IDExLCAyMDIxIGF0IDA4OjM4OjQzUE0gKzAwMDAsIFdpbmlhcnNrYSwg
SXdvbmEgd3JvdGU6DQo+ID4gRXZlcnl0aGluZyB0aGF0J3MgcGFydCBvZiB0aGlzIHNlcmllcyBy
dW5zIG9uIHRoZSBCTUMgKEJhc2Vib2FyZA0KPiA+IE1hbmFnZW1lbnQgQ29udHJvbGxlcikuIFRo
ZXJlJ3Mgbm90aGluZyBBUk0gc3BlY2lmaWMgdG8gaXQgLSBpdCdzIGp1c3QNCj4gPiB0aGF0IHRo
ZSBCTUMgaGFyZHdhcmUgd2UncmUgY3VycmVudGx5IHN1cHBvcnRpbmcgaXMgQVJNLWJhc2VkLiBQ
RUNJIGlzDQo+ID4gYW4gaW50ZXJmYWNlIHRoYXQncyBleHBvc2VkIGJ5IHNvbWUgeDg2IENQVXMg
LSBidXQgdGhhdCdzIGEgaGFyZHdhcmUNCj4gPiBpbnRlcmZhY2UgKGF2YWlsYWJsZSBjb21wbGV0
ZWx5IGluZGVwZW5kZW50IGZyb20gd2hhdGV2ZXIgaXMgYWN0dWFsbHkNCj4gPiBydW5uaW5nIG9u
IHRoZSB4ODYgQ1BVKS4NCj4gDQo+IEFoYSwgSSB0aGluayBJIGdvdCBpdDogc28gdGhpcyB3aG9s
ZSBQRUNJIHBpbGUgaXMgc3VwcG9zZWQgdG8gcnVuIG9uDQo+IHRoZSBCTUMgLSB3aGljaCBjYW4g
YmUgQVJNIGJ1dCBkb2Vzbid0IGhhdmUgdG8gYmUsIGkuZS4sIGNvZGUgc2hvdWxkIGJlDQo+IGdl
bmVyaWMgZW5vdWdoIC0gYW5kIHRoZSBpbnRlcmZhY2VzIHRvIHRoZSB4ODYgQ1BVIGRvIGdldCBl
eHBvc2VkIHRvIHRoZQ0KPiBMaW51eCBydW5uaW5nIG9uIHRoZSBCTUMuDQo+IA0KPiBXaGljaCBi
cmluZ3MgbWUgdG8gdGhlIGFuc3dlciB0byB5b3VyIG90aGVyIG1haWw6DQo+IA0KPiBPbiBNb24s
IE9jdCAxMSwgMjAyMSBhdCAwNzozMjozOFBNICswMDAwLCBXaW5pYXJza2EsIEl3b25hIHdyb3Rl
Og0KPiA+IE5vdGhpbmcgd3JvbmcgLSBqdXN0IGEgdHJhZGUtb2ZmIGJldHdlZW4gY2h1cm4gYW5k
IGtlZXBpbmcgdGhpbmdzIHRpZHkNCj4gPiBhbmQgbm90IGR1cGxpY2F0ZWQsIHNpbWlsYXIgdG8g
cGF0Y2ggMS4gQW5kIGp1c3QgbGlrZSBpbiBwYXRjaCAxLCBpZg0KPiA+IHlvdSBoYXZlIGEgc3Ry
b25nIG9waW5pb24gYWdhaW5zdCBpdCAtIHdlIGNhbiBkdXBsaWNhdGUuDQo+IA0KPiBTbyBpdCBp
cyBub3QgYWJvdXQgc3Ryb25nIG9waW5pb24uIFJhdGhlciwgaXQgaXMgYWJvdXQgd2hldGhlciB0
aGlzDQo+IGV4cG9ydGluZyB3b3VsZCBiZSBkaXNhZHZhbnRhZ2VvdXMgZm9yIHg4NiBmcmVlZG9t
LiBBbmQgSSB0aGluayBpdCB3aWxsDQo+IGJlOg0KPiANCj4gQmVjYXVzZSBpZiB5b3UgZXhwb3J0
ZWQgdGhvc2UgYW5kIHRoZW4gd2Ugd2VudCBhbmQgY2hhbmdlZCB0aG9zZQ0KPiBpbnRlcmZhY2Vz
IGFuZCBkZWZpbmVzIChjaGFuZ2VkIHRoZWlyIG5hbWluZywgZnVuY3Rpb24gYXJndW1lbnRzLA0K
PiB3aGF0ZXZlcikgYW5kIHNvbWV0aGluZyBvdXRzaWRlIG9mIHg4NiB1c2VkIHRoZW0sIHdlIHdp
bGwgYnJlYWsgdGhhdA0KPiBzb21ldGhpbmcuDQo+IA0KPiBBbmQgdXN1YWxseSB3ZSBnbyBhbmQg
Zml4IHRob3NlIHVzZXJzIHRvbyBidXQgSSBkb3VidCBhbnlvbmUgaGFzIGFjY2Vzcw0KPiB0byB0
aGF0IFBFQ0kgaHcgdG8gYWN0dWFsbHkgdGVzdCBmaXhlcywgZXRjLCBldGMuDQoNCldlIChPcGVu
Qk1DKSBkbyBoYXZlIFBFQ0kgSFcsIHNvIHRoYXQgc2hvdWxkbid0IGJlIGEgcHJvYmxlbS4NCg0K
PiBTbyBJJ2QgcHJlZmVyIHRoZSBzbWFsbCBhbW91bnQgb2YgZHVwbGljYXRpb24gdnMgZXh0ZXJu
YWwgc3R1ZmYgdXNpbmcNCj4geDg2IGZhY2lsaXRpZXMgYW55IGRheSBvZiB0aGUgd2Vlay4gQW5k
IHNvIEknZCBzdWdnZXN0IHlvdSBzaW1wbHkgY29weQ0KPiB0aGUgaGFuZGZ1bCBvZiBmdW5jdGlv
bnMgYW5kIGRlZmluZXMgeW91J3JlIGdvbm5hIGJlIG5lZWRpbmcgYW5kIHRoZQ0KPiBkZWZpbmVz
IGFuZCBiZSBkb25lIHdpdGggaXQuDQo+IA0KPiBEYXZlJ3MgaWRlYSBtYWtlcyBzZW5zZSB0byBt
ZSB0b28gYnV0IGxhdGVseSBpdCBrZWVwcyBoYXBwZW5pbmcgdGhhdA0KPiB3ZSBjaGFuZ2Ugc29t
ZXRoaW5nIGluIHg4Ni1sYW5kIGFuZCBpdCB0dXJucyBvdXQgc29tZXRoaW5nICJmcm9tIHRoZQ0K
PiBvdXRzaWRlIiBpcyB1c2luZyBpdCBhbmQgaXQgYnJlYWtzLCBzbyBpdCBpcyBhIGxvdCBlYXNp
ZXIgaWYgdGhpbmdzIGFyZQ0KPiBpbmRlcGVuZGVudC4NCg0KQm90aCBDUFVJRC5FQVg9MSBkZWNv
ZGluZyBhbmQgZGVmaW5pdGlvbnMgaW4gaW50ZWwtZmFtaWx5IGFyZSBwcmV0dHkgIndlbGwtDQpk
ZWZpbmVkIi4gSSB1bmRlcnN0YW5kIHRoZSBzY2VuYXJpbyB0aGF0IHlvdSdyZSBkZXNjcmliaW5n
LCBidXQgaW4gb3JkZXIgdG8NCmJyZWFrIHRoZSBvdXRzaWRlIHVzZXIgdGhlcmUgd291bGQgbmVl
ZCB0byBiZSBzb21lICJsb2dpYyIgYmVoaW5kIHRoZSBwdWxsZWQgaW4NCmNvbmNlcHRzIChpZiwg
Zm9yIGV4YW1wbGUsIEkgd291bGQgdXNlIHNvbWV0aGluZyBsaWtlIFg4Nl9NQVRDSF8qIGRlZmlu
ZXMgaW4NClBFQ0kpLg0KDQpUaGFua3MNCi1Jd29uYQ0KDQo+IA0KPiBUaHguDQo+IA0KDQo=
