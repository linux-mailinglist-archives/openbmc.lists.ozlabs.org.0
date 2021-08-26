Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6363F9410
	for <lists+openbmc@lfdr.de>; Fri, 27 Aug 2021 07:43:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GwpYP3n9Bz2yZf
	for <lists+openbmc@lfdr.de>; Fri, 27 Aug 2021 15:43:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=BLiLtk9I;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=BLiLtk9I; dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GwdBb72fkz2yJ1;
 Fri, 27 Aug 2021 08:41:52 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10088"; a="281574878"
X-IronPort-AV: E=Sophos;i="5.84,354,1620716400"; d="scan'208";a="281574878"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 15:40:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,354,1620716400"; d="scan'208";a="537655526"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga002.fm.intel.com with ESMTP; 26 Aug 2021 15:40:49 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 26 Aug 2021 15:40:48 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Thu, 26 Aug 2021 15:40:48 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 26 Aug 2021 15:40:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJkfc2fhcV/POeVA+Aa0ZvForJqCMDqwvfyoXM/FC//YPhRS4ZNThgrl+Sdg7NWdo2fNkI+3GYeeRIzxTUoZ7NcDQw5fkwVodAMjaq7Iic+c5mkfHu7xuKOq4gDDHQZiDR0iQUZSj3csxaIY1COhh6y5ZPUIAtlIY6Qum/C8kIWcl3ROrvyCBevTENhZpBuiWw9fJICn518Sf1i5NcLTvI2zJBUxucRTLFSQuied6SkTepfjQZ/CnGNyGsDwwmliD53mm0e4v3AS8OO88z0epjzRIpzuhppCtlNahivRULdPNeV2yt1J0I8g5tf3MDDQvREEL0RA6N02vnqrzeTIRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6t3gIhXVBelIp8/pPfZ6i4g12SLiWoeQra4cj4ydjpE=;
 b=AAhqNvPQcqC4anZmB3WVXzEBm3HoucEWKmbDkEXxvJk/lN8qXDRTT8gRqwLXpysCJL8MsdRDw+/Ykw6N8kPpwTEDKTg9iSgyPQZSXx5GjpWx5Y1Cr4lEAHflUxM375aRfc7la2T7QX7m0pG1QZg4PdbidsqaOIIdVdp5FSXFb9Nhmm5HaFXNYp1B7FdbV4ClwBuUetLE826CmWrFtV7yt+Zb3K3DboHoTzMXdmvgG+m0ZImsaijerlhjHEq61pAhGS+XhQOUSCEjaU9fHK6oFjT6Bear+WKWMhYQD1oneHc8xO3zMV5dbMLRUfUgbBw4HA1qCVzginGnV7nCwnNWHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6t3gIhXVBelIp8/pPfZ6i4g12SLiWoeQra4cj4ydjpE=;
 b=BLiLtk9IwqUz4uJhT4ydtbmit0qfknI24CV3Ol2g250Vf72c3qzvG9mU6fCkPT+AURZ+YgSk/PEKUvW70+wiUHX458rh2hSG3X2wu1wmbibBZzyrDs3rEuFrzAG/cq2SLWHSSobGnh71z+TA+Uc+jLwm8znmTZIFakeQDiMBQlY=
Received: from SN6PR11MB2589.namprd11.prod.outlook.com (2603:10b6:805:53::12)
 by SN6PR11MB3069.namprd11.prod.outlook.com (2603:10b6:805:d5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Thu, 26 Aug
 2021 22:40:43 +0000
Received: from SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::6e:364a:dc09:3d35]) by SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::6e:364a:dc09:3d35%5]) with mapi id 15.20.4436.027; Thu, 26 Aug 2021
 22:40:43 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "Williams, Dan J" <dan.j.williams@intel.com>
Subject: Re: [PATCH v2 06/15] peci: Add core infrastructure
Thread-Topic: [PATCH v2 06/15] peci: Add core infrastructure
Thread-Index: AQHXiFubtpznDqTId0GMkIMBdaiTRKuE+NWAgAGNP4A=
Date: Thu, 26 Aug 2021 22:40:43 +0000
Message-ID: <4aa3fac69a92b175beb59d2678eb914c35ea98b7.camel@intel.com>
References: <20210803113134.2262882-1-iwona.winiarska@intel.com>
 <20210803113134.2262882-7-iwona.winiarska@intel.com>
 <CAPcyv4giVBjZWjXO2H+vYSR29Vapi6_FvMwO7nvts-JXmCHcOA@mail.gmail.com>
In-Reply-To: <CAPcyv4giVBjZWjXO2H+vYSR29Vapi6_FvMwO7nvts-JXmCHcOA@mail.gmail.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.3 (3.40.3-1.fc34) 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e0b3e7d-8378-4c27-8adb-08d968e289c8
x-ms-traffictypediagnostic: SN6PR11MB3069:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB3069E8A2F95838C0B78463A7ECC79@SN6PR11MB3069.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TwWDrvgUwaoR3Bh3lqjEAw4Y/JexZzq2rEMOlxuwTOdq7WLJxfVgfKsrXgnplt8hrXKXYP96UwSw8BfshFjl78XtYLURYCzD96gSAlebSm7kNBUXVQ0SC7rnFXv3WIpceBYvHMg6JlvZAWDexXg0IrkT+X/IUIvrA+x5KgUBjmi+ghU2I1u8oyWkvu+4R9wPkcbYehWgpgfmq0bH9iQKyC9PFx856ULrjSJwRjV3jThLd0KkkE5oxmnPTETxWk6vgvdFNzp91FDPUAsrKkzWHb7rWCA4hnFE27fcDUk6D0PvteiSYTPQuTGduj0Zgaopm3GiTJZrz8fVEuwX37WJAlE8vy9KHVoDPo/TqFWlAAhq3MABrtWul48Mxz4DQnZ5BY1L3rvzr2OcH4StXERoZ4o2Vw9+jIMYI+ulT6oJ7H7ScOhUBnF4RZbzZVROCM/vK7u1czWkOIft5xKGPZ450XTtn9ZtAu4ZgLVc/tpjcqKbHo1CcuFYoJ6sNnqLHahuyaEBbzFO1VdW39lLDgLDDFJDdXEsoO5STHf6gx9zi99Yb3i+EnM8pCzeAfKWZiIgd094qg+rlUBKVCNuPJjStSFeGejcHXtde5Yvd392sHbSPWOyvcCLG47ooefx3c1BBw4aVazmzrPKYLekyHv3nlDJ5NO/PdQD4xbjD7LJIZ73PW/QcV+WIGGfd8dM0MZ7G+2bEi2VpYGVBszUM6McWw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2589.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(54906003)(7416002)(6862004)(7406005)(508600001)(66446008)(66476007)(86362001)(38100700002)(2906002)(36756003)(6512007)(122000001)(38070700005)(66556008)(91956017)(64756008)(8676002)(186003)(5660300002)(4326008)(2616005)(316002)(8936002)(71200400001)(6636002)(37006003)(53546011)(6506007)(26005)(76116006)(6486002)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2tETXNVeFdITVg1QzRuR080UTdxd3AzTEpXV0piQ1FGQnlTZUpuMlo2bE1v?=
 =?utf-8?B?L3Zld3pDQnpBK1BhaG5sZWp3WnJYaDZFcmVRSzF4ekJGQ0tlZUZoKzVxK1gw?=
 =?utf-8?B?UTEzajNZNDlFMkFSQk1sR2FQdU5CSkhnVDFpbE9zVDhUS2JIR1psMGJ1RmEv?=
 =?utf-8?B?NGVRbWFnMmI5czkvVm16bGdrYmtHM2pHbXFTS0JjVUhtbnhJZGx3aGpiVXVk?=
 =?utf-8?B?Z3lqQU9PL2Y0emt0aGxLZFBWa1g2dVE3Uk5aK2l0RnBtK0YyV0tsK0x2WUhx?=
 =?utf-8?B?L250L1lraFhoVjlrTkltd0JkdUVsZW5yUGpmNUgzUndSTStmMHZBSGh6OHV3?=
 =?utf-8?B?L3F4OUJSWXIzamErSTczbkVYUDRzNXFoMGdvK3RRUngwZVdEWHFEZkV6RWxM?=
 =?utf-8?B?cDVNSnVaYXp0T2lyYmVWZ0hRc1o1S3V3Q3hyY0tHN3VxWTBEZWs5dVBLVTRh?=
 =?utf-8?B?STJCZmRkWEpIdWt0dURHZjF4NENtZFhqRFpiOVRLWmM4aWN0YUgzcEY1VWNn?=
 =?utf-8?B?R1MwZEFWN21GK0YvSytvN0g0bWlNdmhjQUV0c3huS1BrVXJVZDlGWGc5WjAz?=
 =?utf-8?B?M3VseDZsVkhURm50VytJSW5SdjN2WEJHcGJtckRvUlkyVEJVd0dISWhjbDhQ?=
 =?utf-8?B?cnNpRUdMZ2M3R0ZYYnNjZjhrUlk3NHJQZStvMnJEVUtoWTd2Nk84WnZ1MU5S?=
 =?utf-8?B?Mi9UaVFSRTh1K0N1bjJmU1Q3RWlKa1gxbEFSa3BJVHZyK3V2TzdUSWVtQ1ZK?=
 =?utf-8?B?OVJsRGpVMS9hcjBkb3RaYnVINldJYkd6dlRuUEZ5NnNiRStpM1p5dVlKNnBE?=
 =?utf-8?B?aUFxZUFQWTErWnZwelg5TFhLN2FEQXRUd2tPSmhzK1owdk1PUU1ySUYxUmta?=
 =?utf-8?B?aUQ0eDVoSk1sOWxCMkhzNC9DdHpsMGR4OEZKLzZBQm1WcmRtb2xhbFVheWts?=
 =?utf-8?B?eCtGdVlkaTBZdmtIbzdQVlJiazB5OFc0bnBndGZpTjZ4SVluYUZBREJGRzh3?=
 =?utf-8?B?MjQ0UmNqeWYzNUdWQmxpY1l1ZEk5d2szMVJsOHZCbHFubldTd0syejRpYUgx?=
 =?utf-8?B?bHJ6cDJaMmtjTk9KQlExWStrSjREZmdKSGt3SC8wcGNqSGZ5YWYxQkphVWdv?=
 =?utf-8?B?YXp5bGJHZkhacmFGVjRod0Q1QzZtUWZTVmRDQ0dtZ250TERQNmIra0pERDB3?=
 =?utf-8?B?bmNzTGxBMHMwWmFXcm9zREhORyt1UmlXc21vb1BaeW5jeG9FN3FkampmcjYy?=
 =?utf-8?B?c21YbS9HaEY3ZXpMcG81WGM1MkJwZC9QK0FwNkFXa3BLQjI1UmtqbkZNV1VU?=
 =?utf-8?B?bGwvcW1BQTdXbndBSm51azZrS3Juelp0cHBGTGtybitrOGRPRFZnMmdtL1dJ?=
 =?utf-8?B?bTNKY2NNazFrK045S3h1RGxEdXFpK0ovYzRuNzY0dWpMb1N0VkhwY1JIbElr?=
 =?utf-8?B?cUlHdTdjSUVyTUcybGs0OHRTb3FhcEtLWTg1eVoxVVh6K2tGakxSOXlKaVRl?=
 =?utf-8?B?cHA0alFudGcyak5mQkNyQk8vS0lDSlRLTExYVjNtbjRZb204MUlmMlM3Wm9h?=
 =?utf-8?B?azJpUHNtODZwc2kzK1UvaSsySXZJTjgwZW9UZGZsa2FrSUVUa1d1R1dEbEZt?=
 =?utf-8?B?anVkL3NtWXJKdEp5M0dqWTJFaUVpUklMczZEUEJta0p2VVNnZmVrOFVHc2Nq?=
 =?utf-8?B?MVpuMUhrcGtWL2JOUDRtU0svZlExVkJTZ0w1RXE1Y0kzcGpLbkc3a3BJV0cz?=
 =?utf-8?B?cWFVdFhqRmRzMmVHdm9PZ01vWFE5b2NXZDdjNEsyOWZYVlVFZTEwNkFJL2Qy?=
 =?utf-8?B?TDMwVG5uU2lkRm1TbWFHQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1AEADA302D09F4439C5FECE4FCB08F29@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2589.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e0b3e7d-8378-4c27-8adb-08d968e289c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2021 22:40:43.1335 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w2aY/KHCAsyqH85Ap7KKP7D1OXX4sqnSs0iYnpcBfMqXaGv1IL4XulUiK7Q6eDU199gx1pM8mvCr0hKGv7MajZ+RQg1ypzYHR33gFOmBBRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3069
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Fri, 27 Aug 2021 15:43:30 +1000
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
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "zweiss@equinix.com" <zweiss@equinix.com>,
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
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "Lutomirski, Andy" <luto@kernel.org>,
 "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>,
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

T24gV2VkLCAyMDIxLTA4LTI1IGF0IDE1OjU4IC0wNzAwLCBEYW4gV2lsbGlhbXMgd3JvdGU6DQo+
IE9uIFR1ZSwgQXVnIDMsIDIwMjEgYXQgNDozNSBBTSBJd29uYSBXaW5pYXJza2ENCj4gPGl3b25h
LndpbmlhcnNrYUBpbnRlbC5jb20+IHdyb3RlOg0KPiA+IA0KPiA+IEludGVsIHByb2Nlc3NvcnMg
cHJvdmlkZSBhY2Nlc3MgZm9yIHZhcmlvdXMgc2VydmljZXMgZGVzaWduZWQgdG8gc3VwcG9ydA0K
PiA+IHByb2Nlc3NvciBhbmQgRFJBTSB0aGVybWFsIG1hbmFnZW1lbnQsIHBsYXRmb3JtIG1hbmFn
ZWFiaWxpdHkgYW5kDQo+ID4gcHJvY2Vzc29yIGludGVyZmFjZSB0dW5pbmcgYW5kIGRpYWdub3N0
aWNzLg0KPiA+IFRob3NlIHNlcnZpY2VzIGFyZSBhdmFpbGFibGUgdmlhIHRoZSBQbGF0Zm9ybSBF
bnZpcm9ubWVudCBDb250cm9sDQo+ID4gSW50ZXJmYWNlIChQRUNJKSB0aGF0IHByb3ZpZGVzIGEg
Y29tbXVuaWNhdGlvbiBjaGFubmVsIGJldHdlZW4gdGhlDQo+ID4gcHJvY2Vzc29yIGFuZCB0aGUg
QmFzZWJvYXJkIE1hbmFnZW1lbnQgQ29udHJvbGxlciAoQk1DKSBvciBvdGhlcg0KPiA+IHBsYXRm
b3JtIG1hbmFnZW1lbnQgZGV2aWNlLg0KPiA+IA0KPiA+IFRoaXMgY2hhbmdlIGludHJvZHVjZXMg
UEVDSSBzdWJzeXN0ZW0gYnkgYWRkaW5nIHRoZSBpbml0aWFsIGNvcmUgbW9kdWxlDQo+ID4gYW5k
IEFQSSBmb3IgY29udHJvbGxlciBkcml2ZXJzLg0KPiA+IA0KPiA+IENvLWRldmVsb3BlZC1ieTog
SmFzb24gTSBCaWxscyA8amFzb24ubS5iaWxsc0BsaW51eC5pbnRlbC5jb20+DQo+ID4gU2lnbmVk
LW9mZi1ieTogSmFzb24gTSBCaWxscyA8amFzb24ubS5iaWxsc0BsaW51eC5pbnRlbC5jb20+DQo+
ID4gQ28tZGV2ZWxvcGVkLWJ5OiBKYWUgSHl1biBZb28gPGphZS5oeXVuLnlvb0BsaW51eC5pbnRl
bC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogSmFlIEh5dW4gWW9vIDxqYWUuaHl1bi55b29AbGlu
dXguaW50ZWwuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEl3b25hIFdpbmlhcnNrYSA8aXdvbmEu
d2luaWFyc2thQGludGVsLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogUGllcnJlLUxvdWlzIEJvc3Nh
cnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiDC
oE1BSU5UQUlORVJTwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDkgKysrDQo+ID4gwqBk
cml2ZXJzL0tjb25maWfCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDMgKw0KPiA+IMKgZHJpdmVycy9N
YWtlZmlsZcKgwqDCoMKgwqDCoMKgIHzCoMKgIDEgKw0KPiA+IMKgZHJpdmVycy9wZWNpL0tjb25m
aWfCoMKgwqAgfMKgIDE1ICsrKysNCj4gPiDCoGRyaXZlcnMvcGVjaS9NYWtlZmlsZcKgwqAgfMKg
wqAgNSArKw0KPiA+IMKgZHJpdmVycy9wZWNpL2NvcmUuY8KgwqDCoMKgIHwgMTU1ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiDCoGRyaXZlcnMvcGVjaS9pbnRl
cm5hbC5oIHzCoCAxNiArKysrKw0KPiA+IMKgaW5jbHVkZS9saW51eC9wZWNpLmjCoMKgwqAgfMKg
IDk5ICsrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiDCoDggZmlsZXMgY2hhbmdlZCwgMzAz
IGluc2VydGlvbnMoKykNCj4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3BlY2kvS2Nv
bmZpZw0KPiA+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvcGVjaS9NYWtlZmlsZQ0KPiA+
IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvcGVjaS9jb3JlLmMNCj4gPiDCoGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL3BlY2kvaW50ZXJuYWwuaA0KPiA+IMKgY3JlYXRlIG1vZGUgMTAw
NjQ0IGluY2x1ZGUvbGludXgvcGVjaS5oDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL01BSU5UQUlO
RVJTIGIvTUFJTlRBSU5FUlMNCj4gPiBpbmRleCA3Y2RhYjcyMjk2NTEuLmQ0MTE5NzRhYWE1ZSAx
MDA2NDQNCj4gPiAtLS0gYS9NQUlOVEFJTkVSUw0KPiA+ICsrKyBiL01BSU5UQUlORVJTDQo+ID4g
QEAgLTE0NTAzLDYgKzE0NTAzLDE1IEBAIEw6wqDCoMKgwqAgcGxhdGZvcm0tZHJpdmVyLXg4NkB2
Z2VyLmtlcm5lbC5vcmcNCj4gPiDCoFM6wqDCoMKgwqAgTWFpbnRhaW5lZA0KPiA+IMKgRjrCoMKg
wqDCoCBkcml2ZXJzL3BsYXRmb3JtL3g4Ni9wZWFxLXdtaS5jDQo+ID4gDQo+ID4gK1BFQ0kgU1VC
U1lTVEVNDQo+ID4gK006wqDCoMKgwqAgSXdvbmEgV2luaWFyc2thIDxpd29uYS53aW5pYXJza2FA
aW50ZWwuY29tPg0KPiA+ICtSOsKgwqDCoMKgIEphZSBIeXVuIFlvbyA8amFlLmh5dW4ueW9vQGxp
bnV4LmludGVsLmNvbT4NCj4gPiArTDrCoMKgwqDCoCBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmfC
oChtb2RlcmF0ZWQgZm9yIG5vbi1zdWJzY3JpYmVycykNCj4gPiArUzrCoMKgwqDCoCBTdXBwb3J0
ZWQNCj4gPiArRjrCoMKgwqDCoCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGVj
aS8NCj4gPiArRjrCoMKgwqDCoCBkcml2ZXJzL3BlY2kvDQo+ID4gK0Y6wqDCoMKgwqAgaW5jbHVk
ZS9saW51eC9wZWNpLmgNCj4gPiArDQo+ID4gwqBQRU5TQU5ETyBFVEhFUk5FVCBEUklWRVJTDQo+
ID4gwqBNOsKgwqDCoMKgIFNoYW5ub24gTmVsc29uIDxzbmVsc29uQHBlbnNhbmRvLmlvPg0KPiA+
IMKgTTrCoMKgwqDCoCBkcml2ZXJzQHBlbnNhbmRvLmlvDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvS2NvbmZpZyBiL2RyaXZlcnMvS2NvbmZpZw0KPiA+IGluZGV4IDhiYWQ2MzQxN2E1MC4uZjQ3
MmIzZDk3MmIzIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvS2NvbmZpZw0KPiA+ICsrKyBiL2Ry
aXZlcnMvS2NvbmZpZw0KPiA+IEBAIC0yMzYsNCArMjM2LDcgQEAgc291cmNlICJkcml2ZXJzL2lu
dGVyY29ubmVjdC9LY29uZmlnIg0KPiA+IMKgc291cmNlICJkcml2ZXJzL2NvdW50ZXIvS2NvbmZp
ZyINCj4gPiANCj4gPiDCoHNvdXJjZSAiZHJpdmVycy9tb3N0L0tjb25maWciDQo+ID4gKw0KPiA+
ICtzb3VyY2UgImRyaXZlcnMvcGVjaS9LY29uZmlnIg0KPiA+ICsNCj4gPiDCoGVuZG1lbnUNCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9NYWtlZmlsZSBiL2RyaXZlcnMvTWFrZWZpbGUNCj4gPiBp
bmRleCAyN2MwMThiZGY0ZGUuLjhkOTZmMGMzZGRlNSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJz
L01ha2VmaWxlDQo+ID4gKysrIGIvZHJpdmVycy9NYWtlZmlsZQ0KPiA+IEBAIC0xODksMyArMTg5
LDQgQEAgb2JqLSQoQ09ORklHX0dOU1MpwqDCoMKgwqDCoMKgwqDCoMKgICs9IGduc3MvDQo+ID4g
wqBvYmotJChDT05GSUdfSU5URVJDT05ORUNUKcKgwqDCoMKgICs9IGludGVyY29ubmVjdC8NCj4g
PiDCoG9iai0kKENPTkZJR19DT1VOVEVSKcKgwqDCoMKgwqDCoMKgwqDCoCArPSBjb3VudGVyLw0K
PiA+IMKgb2JqLSQoQ09ORklHX01PU1QpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICs9IG1vc3Qv
DQo+ID4gK29iai0kKENPTkZJR19QRUNJKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCArPSBwZWNp
Lw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BlY2kvS2NvbmZpZyBiL2RyaXZlcnMvcGVjaS9L
Y29uZmlnDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAu
LjcxYTRhZDgxMjI1YQ0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9kcml2ZXJzL3BlY2kv
S2NvbmZpZw0KPiA+IEBAIC0wLDAgKzEsMTUgQEANCj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMC1vbmx5DQo+ID4gKw0KPiA+ICttZW51Y29uZmlnIFBFQ0kNCj4gPiArwqDC
oMKgwqDCoMKgIHRyaXN0YXRlICJQRUNJIHN1cHBvcnQiDQo+ID4gK8KgwqDCoMKgwqDCoCBoZWxw
DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqAgVGhlIFBsYXRmb3JtIEVudmlyb25tZW50IENvbnRyb2wg
SW50ZXJmYWNlIChQRUNJKSBpcyBhbiBpbnRlcmZhY2UNCj4gPiArwqDCoMKgwqDCoMKgwqDCoCB0
aGF0IHByb3ZpZGVzIGEgY29tbXVuaWNhdGlvbiBjaGFubmVsIHRvIEludGVsIHByb2Nlc3NvcnMg
YW5kDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqAgY2hpcHNldCBjb21wb25lbnRzIGZyb20gZXh0ZXJu
YWwgbW9uaXRvcmluZyBvciBjb250cm9sIGRldmljZXMuDQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKg
wqDCoMKgIElmIHlvdSBhcmUgYnVpbGRpbmcgYSBCYXNlYm9hcmQgTWFuYWdlbWVudCBDb250cm9s
bGVyIChCTUMpIGtlcm5lbA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgIGZvciBJbnRlbCBwbGF0Zm9y
bSBzYXkgWSBoZXJlIGFuZCBhbHNvIHRvIHRoZSBzcGVjaWZpYyBkcml2ZXIgZm9yDQo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqAgeW91ciBhZGFwdGVyKHMpIGJlbG93LiBJZiB1bnN1cmUgc2F5IE4uDQo+
ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgIFRoaXMgc3VwcG9ydCBpcyBhbHNvIGF2YWlsYWJs
ZSBhcyBhIG1vZHVsZS4gSWYgc28sIHRoZSBtb2R1bGUNCj4gPiArwqDCoMKgwqDCoMKgwqDCoCB3
aWxsIGJlIGNhbGxlZCBwZWNpLg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BlY2kvTWFrZWZp
bGUgYi9kcml2ZXJzL3BlY2kvTWFrZWZpbGUNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+
IGluZGV4IDAwMDAwMDAwMDAwMC4uZTc4OWEzNTRlODQyDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+
ICsrKyBiL2RyaXZlcnMvcGVjaS9NYWtlZmlsZQ0KPiA+IEBAIC0wLDAgKzEsNSBAQA0KPiA+ICsj
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkNCj4gPiArDQo+ID4gKyMgQ29y
ZSBmdW5jdGlvbmFsaXR5DQo+ID4gK3BlY2kteSA6PSBjb3JlLm8NCj4gPiArb2JqLSQoQ09ORklH
X1BFQ0kpICs9IHBlY2kubw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BlY2kvY29yZS5jIGIv
ZHJpdmVycy9wZWNpL2NvcmUuYw0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXgg
MDAwMDAwMDAwMDAwLi43YjM5MzhhZjAzOTYNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIv
ZHJpdmVycy9wZWNpL2NvcmUuYw0KPiA+IEBAIC0wLDAgKzEsMTU1IEBADQo+ID4gKy8vIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkNCj4gPiArLy8gQ29weXJpZ2h0IChjKSAy
MDE4LTIwMjEgSW50ZWwgQ29ycG9yYXRpb24NCj4gPiArDQo+ID4gKyNkZWZpbmUgcHJfZm10KGZt
dCkgS0JVSUxEX01PRE5BTUUgIjogIiBmbXQNCj4gDQo+IFRoaXMgbG9va3MgbGlrZSBvdmVya2ls
bCBmb3Igb25seSBvbmUgcHJpbnQgc3RhdGVtZW50IGluIHRoaXMgbW9kdWxlLA0KPiBlc3BlY2lh
bGx5IHdoZW4gdGhlIGRldl8gcHJpbnQgaGVscGVycyBvZmZlciBtb3JlIGRldGFpbC4NCg0KT2ss
IEknbGwgcmVtb3ZlIGl0Lg0KDQo+IA0KPiA+ICsNCj4gPiArI2luY2x1ZGUgPGxpbnV4L2J1Zy5o
Pg0KPiA+ICsjaW5jbHVkZSA8bGludXgvZGV2aWNlLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9l
eHBvcnQuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2lkci5oPg0KPiA+ICsjaW5jbHVkZSA8bGlu
dXgvbW9kdWxlLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9vZi5oPg0KPiA+ICsjaW5jbHVkZSA8
bGludXgvcGVjaS5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPg0KPiA+ICsj
aW5jbHVkZSA8bGludXgvcHJvcGVydHkuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4N
Cj4gPiArDQo+ID4gKyNpbmNsdWRlICJpbnRlcm5hbC5oIg0KPiA+ICsNCj4gPiArc3RhdGljIERF
RklORV9JREEocGVjaV9jb250cm9sbGVyX2lkYSk7DQo+ID4gKw0KPiA+ICtzdGF0aWMgdm9pZCBw
ZWNpX2NvbnRyb2xsZXJfZGV2X3JlbGVhc2Uoc3RydWN0IGRldmljZSAqZGV2KQ0KPiA+ICt7DQo+
ID4gK8KgwqDCoMKgwqDCoCBzdHJ1Y3QgcGVjaV9jb250cm9sbGVyICpjb250cm9sbGVyID0gdG9f
cGVjaV9jb250cm9sbGVyKGRldik7DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqAgcG1fcnVudGlt
ZV9kaXNhYmxlKCZjb250cm9sbGVyLT5kZXYpOw0KPiANCj4gVGhpcyBzZWVtcyBsYXRlIHRvIGJl
IGRpc2FibGluZyBwb3dlciBtYW5hZ2VtZW50LCB0aGUgZGV2aWNlIGlzIGFib3V0DQo+IHRvIGJl
IGZyZWVkLiBLZWVwIGluIG1pbmQgdGhlIGxpZmV0aW1lIG9mIHRoZSB0aGlzIG9iamVjdCBjYW4g
YmUNCj4gYXJ0aWZpY2lhbGx5IHByb2xvbmdlZC4gSSBleHBlY3QgdGhpcyB0byBiZSBkb25lIHdo
ZW4gdGhlIGRldmljZSBpcw0KPiB1bnJlZ2lzdGVyZWQgZnJvbSB0aGUgYnVzLg0KDQpNYWtlcyBz
ZW5zZS4NCg0KPiANCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoCBtdXRleF9kZXN0cm95KCZjb250
cm9sbGVyLT5idXNfbG9jayk7DQo+ID4gK8KgwqDCoMKgwqDCoCBpZGFfZnJlZSgmcGVjaV9jb250
cm9sbGVyX2lkYSwgY29udHJvbGxlci0+aWQpOw0KPiA+ICvCoMKgwqDCoMKgwqAgZndub2RlX2hh
bmRsZV9wdXQoY29udHJvbGxlci0+ZGV2LmZ3bm9kZSk7DQo+IA0KPiBTaG91bGRuJ3QgdGhlIGdl
dCAvIHB1dCBvZiB0aGlzIGhhbmRsZSByZWZlcmVuY2UgYmUgYm91bmQgdG8gc3BlY2lmaWMNCj4g
YWNjZXNzZXMgbm90IGhlbGQgZm9yIHRoZSBlbnRpcmUgbGlmZXRpbWUgb2YgdGhlIG9iamVjdD8g
QXQgYSBtaW5pbXVtDQo+IGl0IHNlZW1zIHRvIGJlIGEgcmVmZXJlbmNlIHRoYXQgY2FuIHRha2Vu
IGF0IHJlZ2lzdHJhdGlvbiBhbmQgZHJvcHBlZA0KPiBhdCB1bnJlZ2lzdHJhdGlvbi4NCg0KSSds
bCBtb3ZlIGl0IHRvIHRha2UgcmVmIGF0IHJlZ2lzdHJhdGlvbiBhbmQgdG8gZHJvcCBpdCBhdCB1
bnJlZ2lzdHJhdGlvbi4NCg0KPiANCj4gPiArwqDCoMKgwqDCoMKgIGtmcmVlKGNvbnRyb2xsZXIp
Ow0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdHJ1Y3QgZGV2aWNlX3R5cGUgcGVjaV9jb250cm9sbGVy
X3R5cGUgPSB7DQo+ID4gK8KgwqDCoMKgwqDCoCAucmVsZWFzZcKgwqDCoMKgwqDCoMKgID0gcGVj
aV9jb250cm9sbGVyX2Rldl9yZWxlYXNlLA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArc3RhdGljIHN0
cnVjdCBwZWNpX2NvbnRyb2xsZXIgKnBlY2lfY29udHJvbGxlcl9hbGxvYyhzdHJ1Y3QgZGV2aWNl
ICpkZXYsDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBzdHJ1Y3QNCj4gPiBwZWNpX2NvbnRyb2xsZXJfb3BzICpvcHMpDQo+ID4gK3sNCj4gPiArwqDC
oMKgwqDCoMKgIHN0cnVjdCBmd25vZGVfaGFuZGxlICpub2RlID0gZndub2RlX2hhbmRsZV9nZXQo
ZGV2X2Z3bm9kZShkZXYpKTsNCj4gPiArwqDCoMKgwqDCoMKgIHN0cnVjdCBwZWNpX2NvbnRyb2xs
ZXIgKmNvbnRyb2xsZXI7DQo+ID4gK8KgwqDCoMKgwqDCoCBpbnQgcmV0Ow0KPiA+ICsNCj4gPiAr
wqDCoMKgwqDCoMKgIGlmICghb3BzLT54ZmVyKQ0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybiBFUlJfUFRSKC1FSU5WQUwpOw0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKg
IGNvbnRyb2xsZXIgPSBremFsbG9jKHNpemVvZigqY29udHJvbGxlciksIEdGUF9LRVJORUwpOw0K
PiA+ICvCoMKgwqDCoMKgwqAgaWYgKCFjb250cm9sbGVyKQ0KPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJldHVybiBFUlJfUFRSKC1FTk9NRU0pOw0KPiA+ICsNCj4gPiArwqDCoMKg
wqDCoMKgIHJldCA9IGlkYV9hbGxvY19tYXgoJnBlY2lfY29udHJvbGxlcl9pZGEsIFU4X01BWCwg
R0ZQX0tFUk5FTCk7DQo+ID4gK8KgwqDCoMKgwqDCoCBpZiAocmV0IDwgMCkNCj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycjsNCj4gPiArwqDCoMKgwqDCoMKgIGNvbnRy
b2xsZXItPmlkID0gcmV0Ow0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgIGNvbnRyb2xsZXItPm9w
cyA9IG9wczsNCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoCBjb250cm9sbGVyLT5kZXYucGFyZW50
ID0gZGV2Ow0KPiA+ICvCoMKgwqDCoMKgwqAgY29udHJvbGxlci0+ZGV2LmJ1cyA9ICZwZWNpX2J1
c190eXBlOw0KPiA+ICvCoMKgwqDCoMKgwqAgY29udHJvbGxlci0+ZGV2LnR5cGUgPSAmcGVjaV9j
b250cm9sbGVyX3R5cGU7DQo+ID4gK8KgwqDCoMKgwqDCoCBjb250cm9sbGVyLT5kZXYuZndub2Rl
ID0gbm9kZTsNCj4gPiArwqDCoMKgwqDCoMKgIGNvbnRyb2xsZXItPmRldi5vZl9ub2RlID0gdG9f
b2Zfbm9kZShub2RlKTsNCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoCBkZXZpY2VfaW5pdGlhbGl6
ZSgmY29udHJvbGxlci0+ZGV2KTsNCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoCBtdXRleF9pbml0
KCZjb250cm9sbGVyLT5idXNfbG9jayk7DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqAgcG1fcnVu
dGltZV9ub19jYWxsYmFja3MoJmNvbnRyb2xsZXItPmRldik7DQo+ID4gK8KgwqDCoMKgwqDCoCBw
bV9zdXNwZW5kX2lnbm9yZV9jaGlsZHJlbigmY29udHJvbGxlci0+ZGV2LCB0cnVlKTsNCj4gPiAr
wqDCoMKgwqDCoMKgIHBtX3J1bnRpbWVfZW5hYmxlKCZjb250cm9sbGVyLT5kZXYpOw0KPiANCj4g
UGVyIGFib3ZlLCBhcmUgeW91IHN1cmUgdW5yZWdpc3RlcmVkIGRldmljZXMgbmVlZCBwbV9ydW50
aW1lIGVuYWJsZWQ/DQo+IA0KPiBSZXN0IGxvb2tzIG9rIHRvIG1lLg0KDQpUaGFua3MNCi1Jd29u
YQ0KDQo=
