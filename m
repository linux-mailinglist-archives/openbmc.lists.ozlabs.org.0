Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 497793FAF90
	for <lists+openbmc@lfdr.de>; Mon, 30 Aug 2021 03:30:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GyXnz0ZK1z2yJp
	for <lists+openbmc@lfdr.de>; Mon, 30 Aug 2021 11:30:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=dCBAaAOy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=dCBAaAOy; dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GyP553ZRsz2xlF;
 Mon, 30 Aug 2021 05:43:15 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10091"; a="205389675"
X-IronPort-AV: E=Sophos;i="5.84,361,1620716400"; d="scan'208";a="205389675"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2021 12:42:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,361,1620716400"; d="scan'208";a="509346810"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 29 Aug 2021 12:42:11 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Sun, 29 Aug 2021 12:42:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Sun, 29 Aug 2021 12:42:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Sun, 29 Aug 2021 12:42:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cfX4FmTcLcsCXAYCGZs/89HyF7c0EQ4y3uVMRyj1kzuplyyGiMWMVE2EXEwRigt0Li4vM2xVQN1RUKWf7WzilKbrhD1xllu5+KmV5ml9moQAG9Ej6G0tkxrJaaySEBIHAzp9gI83K0pnBs2Q3z7uQ9SSyzALCngMQrCBgkDbLRQVVdv+fV3xjIWdG0B6hOxIwccXcDde3CpxFXtvXwMoblRmIi6kS0hq0DfWVRSElcusQbgWsze9Bza3rdT/UjQjGz/i9hUxCD0NuiuR4803njXcTBsjgpokriDpwyZyN/LgJjHiy7Ss90pbQbL9j0GGbYJUnF1E78YJtUuZVGO9Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GyZ3mUSe3UVxhdWhlg99M9CLAJ1VqW0cdDbb5Zb7SAQ=;
 b=AehWhjxNKv3mIyD86g5jFeaURfj2w7Ggzw1V6IfQN9ZJmPc+RDhnZQwIEyjxfYkOMYhScJC6K0/qfiMHU0s+ofclEqcw3Z3sbiGVkChjod62rWddiX8joqD2z3LJe5lskdF4sQbPZItTLEopEdUb93scrbI+BLqmdhT7+cMGfsP9dRDsPH+JwUSqCzPH2mafPLpMc6ffmoHi11ZlFCLIoZwf9IoP6QHzuxWorJr+yNo06UNKLca8dh3QPUHiF4TvCGgjCMCSL0NFrSbSCzdP8H1SgoRW3ZrcCSmyH6iUv/Kpq9ZnuE4j+KjFga4lW2zkJE1fxvuZkG5Ek4Z2Ja+SxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GyZ3mUSe3UVxhdWhlg99M9CLAJ1VqW0cdDbb5Zb7SAQ=;
 b=dCBAaAOyJf1pBPevVrRBac1eNXsxbSjUk8yyyb+MvUJImcDrVtsQXL5I48qqbQG2ri85XwDQa+EYYdKGzLUIPHKoqz9bdNY4qd/gOPH6hoWy71LBIvczJbySAwDcNMU0BkggKWqJ0qL6ajtEuIiW2GNzVxdaIY1pYLVWSipq0eM=
Received: from SN6PR11MB2589.namprd11.prod.outlook.com (2603:10b6:805:53::12)
 by SA2PR11MB4843.namprd11.prod.outlook.com (2603:10b6:806:fb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Sun, 29 Aug
 2021 19:42:09 +0000
Received: from SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::6e:364a:dc09:3d35]) by SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::6e:364a:dc09:3d35%5]) with mapi id 15.20.4436.027; Sun, 29 Aug 2021
 19:42:09 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "Williams, Dan J" <dan.j.williams@intel.com>
Subject: Re: [PATCH v2 07/15] peci: Add peci-aspeed controller driver
Thread-Topic: [PATCH v2 07/15] peci: Add peci-aspeed controller driver
Thread-Index: AQHXiFunuciRrfn9A0Gdd0pZW2+RiquFJLOAgAF2HQCAARSVgIADW8mA
Date: Sun, 29 Aug 2021 19:42:09 +0000
Message-ID: <d43b405df504b26e8af2356921570c341976b890.camel@intel.com>
References: <20210803113134.2262882-1-iwona.winiarska@intel.com>
 <20210803113134.2262882-8-iwona.winiarska@intel.com>
 <CAPcyv4jPVSt9Wr2TkDActFVLP+ygaDwBnsKG410Nf1qfP_MB9A@mail.gmail.com>
 <b26ee278838698289869964fe59578f0d5f7b19c.camel@intel.com>
 <CAPcyv4hUm0Ec1+_n0PZ+S0A9Tt1=8oLdeYtEiEnAmntm8PtmKQ@mail.gmail.com>
In-Reply-To: <CAPcyv4hUm0Ec1+_n0PZ+S0A9Tt1=8oLdeYtEiEnAmntm8PtmKQ@mail.gmail.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-1.fc34) 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f23adce-4e49-4baa-1da8-08d96b2516f2
x-ms-traffictypediagnostic: SA2PR11MB4843:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB4843DF26C6503B4E0FBFD541ECCA9@SA2PR11MB4843.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3yX0ZRPbPLVreJ8+QhtoROR3joQNNkG6/MGB0llYJeu/FPr/C8+9zw8TxFU3uIlGkOAy8hPUH/YndKrwzG+6Go+b4Cp9b9mtZL57l+Gky48U1YaKYiPg9PFP9omvsnBueFnDEnyXkFthTBI8CmpmQKneBC7iRyqX5kDBJYjgIHZs3sGGVa+xuNgZfZJCfQzjCg0bnys2s0eGe3wIYoDlYB//o286dDJ6YQm0CIGuGelWMIFnlvnv/Gy8/B3vmum+5kQQpxEVoPlN7xzyqyP54rfLD7Bc7P7FGmFZs337MAB0BZrgPe/S7Zk4XPrCfz5L7b1dnlz18pN5a2ZPBiTvVXYLzhJA7v1v4I7T52zPisay5kfHW7lrjw/kKSZ3WfayzmiPKNXlCWRpVuqcvwjtcXNhFNf3edzg0lVJRMLalOZfV0GEMenFm2K53Of2pCqssmku4Rp8WB8i14nUC61cEpRqusWIASW6kEDMLP1s9TEhneAFJRPt5D+dF2sMEC1aOESoX+rjurSI5k1i/b93eHR8sc8MhxxoloRXPR2YmnVLcTvASrovHSK3UKg/vzJLA2KzGoGlyB8t/UznnwKEZGPfqK4N4qcP5vq1ofIVwFsHbV40wv8iVwM9QPM/unPUZMKRWZLRAPmCr6m59TOBiW66GtZdwim6sW/jJJXX01HrC7uNc0XV+Fr3Ah/H3LQZWpgNePSM+uMCDLGsuyyfrA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2589.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(39860400002)(346002)(396003)(8936002)(19627235002)(38070700005)(316002)(36756003)(122000001)(6636002)(54906003)(5660300002)(7406005)(7416002)(71200400001)(8676002)(6862004)(66446008)(86362001)(76116006)(37006003)(83380400001)(6512007)(6486002)(4326008)(66946007)(64756008)(2906002)(53546011)(91956017)(66476007)(186003)(478600001)(2616005)(26005)(38100700002)(66556008)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bHdJVUhIODAwL0V0OTN3MWZNK3NuY1hwM2FWZG44Tm1kT3c0aXNkM1pIMWVj?=
 =?utf-8?B?SjdERkxQaG9DNDlBa004SnI1dmM5ZjlkN2hvSUxISTNSQURDelBTYmxTc3ZO?=
 =?utf-8?B?NkJDZ2hHNmdMbUwzMlJEVlJoTDA3SmlZMUNHQ0dhWmNVSVBHU3BZeThCZVJy?=
 =?utf-8?B?ZXhURUQwNmhvTGxMdERmbWhwSUZmN3krdmhDdkxPenE0MUFkbXd4WjZpM3RN?=
 =?utf-8?B?eVcycnMrVmxVRk1IOGo5QlRmcHlKUFNoQU80dWorUEFQOVU5aXpSYjZZZnV0?=
 =?utf-8?B?cjFOaGFVZkNSTk40N1lhOXQ0ODFkUGJmeDdnMFRad0dkTTJoaWxSYVVGMitN?=
 =?utf-8?B?dHNnaXJmc2dsNUt4SDBGclpIUnlhODFpZEdvTkQ0RFRGUnpSZ3kxNy9pYzhR?=
 =?utf-8?B?NWFLc2w4Rzk5dDR3NFh0RU5Wc2E3MUROUFFqTHd2RlBsSXpDd2RXaGNpeThB?=
 =?utf-8?B?VUdPRVBGM2tNL1Q2V3BHNEhXdlpzMW9sY3JkbWVnRWNOSU0yVnlBTW9YZGE4?=
 =?utf-8?B?VExLQjk4QjlzT0Rocy9OVzlhN1NVOU5iNy9OdzU4andrZmVJc2c2Zzc1Sktj?=
 =?utf-8?B?cVg3MGI1WHdMZjJJZlFLKzJEL0prM01td0Z3Z3p5bWhBc1JxMVZ4NGxYVUhM?=
 =?utf-8?B?dmFZVlpMMGQ3TkYwZTQrMUpsd0YrSStWZER0VHJHNXFVVEtsaE1HRmF4Q2kx?=
 =?utf-8?B?ZXIzSTU1KzI2cTJjK3l5YTU1QThKU09aYzRLcDRFdi9aMjEybFRjS1RVRHNF?=
 =?utf-8?B?TGkvUnBQSXpablFpOEUwdGdkQjNMbzBmdDU2TGcwNE9WaTFkMFBYaEpDRjRE?=
 =?utf-8?B?bUtqTngzQ2I4ZE4wV1JxTWVPVkNTZ1dhZFlaYXFuV2xtSmJ3U0N0QURSQ1Vm?=
 =?utf-8?B?VHlPYjRjZGhKUTNMZHdURjNzaUdmU3pzM09yUSthakg1RjJGL0U5WnlyZGNo?=
 =?utf-8?B?UzFlZFBzdWZLZXdMUnd2c2xHbUFqbGZZWmdLQlNNN0c2aDNxNUMyWTd3R2ZI?=
 =?utf-8?B?b3dtcEExTEs3ZWsweWxLSWFKUWFQRGJka3ltSFhzcnRmd3pxVkMxdTVMUm9U?=
 =?utf-8?B?SnBHSDNJcm5JbmtCVHBsYVVOWjBLWExiWkJvV0JRYnpHajEzYldiVlNXQmpX?=
 =?utf-8?B?TVdKZWY2N3hma1oyT1lrWkR3TEE5VkpqZE5FNFFUMzZCa0lYOTA5d1ROTmph?=
 =?utf-8?B?SVZRa0NpcTBTQ2Q1R1dwTVV6d1ptY0NvRXd0ZVZJbCs1N0d6WGNoblhkZlVw?=
 =?utf-8?B?QTdCenZ4aE9JbXQrWkM4QnI3cFFlUnlvZG9RTG1haDZZREFjN1g2Q0tETmZK?=
 =?utf-8?B?a3haWDlyalhkczhEc2xIVWJVY1J1NTlLM2ZQN1o5Q2lYNkZDeFZKczZ2UlYv?=
 =?utf-8?B?WE1rczRDb2VSTFl2ZUVDMWFKY0NCWFVuTGs5U0xLWVpCd2RHVlNBOEJGakw2?=
 =?utf-8?B?TkhGdDdlL09hWmFjL1dBRTY0bnJLQ1ExSHUzbnVyUHhWR3dZaXZ6cWFjdHdY?=
 =?utf-8?B?bWprZUx4ZmxuT09TUEk0VWM5Z2VjTlBJQ3M5Wk9vWnp1aWdDOVRWTkdRUlh6?=
 =?utf-8?B?QUFnUlJDWDIrQnJlbWlSSjliOEx2Ujl5bnhoRVE1TmNDbCtWYWtadWw5R3g3?=
 =?utf-8?B?MEhOREtVZHpseUx3L0VzdHhpNGxEdnM0aXF1TEhReG5lSUFzN0hhVmJGcUdY?=
 =?utf-8?B?ZXVGQ1FKME1JQ3Nna1NNcHVBaFF2S1NsWWx4N1ByajB3ZUsxNms4dXRkelZ6?=
 =?utf-8?B?eS9BYVAvZkUrbm5vQVNpNGlrM0lNYjZZRitBb1ZSZXRBcHIzc25mMkU4ZVRT?=
 =?utf-8?B?QTZzbGg0cWhvb1Bja2ZjUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F742D9AE28FC940B5DD4F463D1343D4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2589.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f23adce-4e49-4baa-1da8-08d96b2516f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2021 19:42:09.1134 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ULC4VxrUAw+c5qNZTBNqYGuO04LQhOiMly/aD0EnKAUAwTpPWfZocB6fS52XkylkTuIsbLb9HHXO7EG8iFKQw/fweooQ0urbxCxk+Xjt5u8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4843
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Mon, 30 Aug 2021 11:27:51 +1000
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
 "tglx@linutronix.de" <tglx@linutronix.de>,
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

T24gRnJpLCAyMDIxLTA4LTI3IGF0IDA5OjI0IC0wNzAwLCBEYW4gV2lsbGlhbXMgd3JvdGU6DQo+
IE9uIFRodSwgQXVnIDI2LCAyMDIxIGF0IDQ6NTUgUE0gV2luaWFyc2thLCBJd29uYQ0KPiA8aXdv
bmEud2luaWFyc2thQGludGVsLmNvbT4gd3JvdGU6DQo+ID4gDQo+ID4gT24gV2VkLCAyMDIxLTA4
LTI1IGF0IDE4OjM1IC0wNzAwLCBEYW4gV2lsbGlhbXMgd3JvdGU6DQo+ID4gPiBPbiBUdWUsIEF1
ZyAzLCAyMDIxIGF0IDQ6MzUgQU0gSXdvbmEgV2luaWFyc2thDQo+ID4gPiA8aXdvbmEud2luaWFy
c2thQGludGVsLmNvbT4gd3JvdGU6DQo+ID4gPiA+IA0KPiA+ID4gPiBGcm9tOiBKYWUgSHl1biBZ
b28gPGphZS5oeXVuLnlvb0BsaW51eC5pbnRlbC5jb20+DQo+ID4gPiA+IA0KPiA+ID4gPiBBU1BF
RUQgQVNUMjR4eC9BU1QyNXh4L0FTVDI2eHggU29DcyBzdXBwb3J0cyB0aGUgUEVDSSBlbGVjdHJp
Y2FsDQo+ID4gPiA+IGludGVyZmFjZSAoYS5rLmEgUEVDSSB3aXJlKS4NCj4gPiA+IA0KPiA+ID4g
TWF5YmUgYSBvbmUgc2VudGVuY2UgYmx1cmIgaGVyZSBhbmQgaW4gdGhlIEtjb25maWcgcmVtaW5k
aW5nIHBlb3BsZQ0KPiA+ID4gd2h5IHRoZXkgc2hvdWxkIGNhcmUgaWYgdGhleSBoYXZlIGEgUEVD
SSBkcml2ZXIgb3Igbm90Pw0KPiA+IA0KPiA+IE9rLCBJJ2xsIGV4cGFuZCBpdCBhIGJpdC4NCj4g
Wy4uXQ0KPiA+ID4gPiArc3RhdGljIGludCBhc3BlZWRfcGVjaV94ZmVyKHN0cnVjdCBwZWNpX2Nv
bnRyb2xsZXIgKmNvbnRyb2xsZXIsDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHU4IGFkZHIsIHN0cnVjdCBwZWNpX3JlcXVlc3Qg
KnJlcSkNCj4gPiA+ID4gK3sNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoCBzdHJ1Y3QgYXNwZWVkX3Bl
Y2kgKnByaXYgPSBkZXZfZ2V0X2RydmRhdGEoY29udHJvbGxlci0NCj4gPiA+ID4gPmRldi5wYXJl
bnQpOw0KPiA+ID4gPiArwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgZmxhZ3MsIHRpbWVvdXQg
PSBtc2Vjc190b19qaWZmaWVzKHByaXYtDQo+ID4gPiA+ID4gY21kX3RpbWVvdXRfbXMpOw0KPiA+
ID4gPiArwqDCoMKgwqDCoMKgIHUzMiBwZWNpX2hlYWQ7DQo+ID4gPiA+ICvCoMKgwqDCoMKgwqAg
aW50IHJldDsNCj4gPiA+ID4gKw0KPiA+ID4gPiArwqDCoMKgwqDCoMKgIGlmIChyZXEtPnR4Lmxl
biA+IEFTUEVFRF9QRUNJX0RBVEFfQlVGX1NJWkVfTUFYIHx8DQo+ID4gPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZXEtPnJ4LmxlbiA+IEFTUEVFRF9QRUNJX0RBVEFfQlVGX1NJWkVfTUFYKQ0K
PiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsNCj4g
PiA+ID4gKw0KPiA+ID4gPiArwqDCoMKgwqDCoMKgIC8qIENoZWNrIGNvbW1hbmQgc3RzIGFuZCBi
dXMgaWRsZSBzdGF0ZSAqLw0KPiA+ID4gPiArwqDCoMKgwqDCoMKgIHJldCA9IGFzcGVlZF9wZWNp
X2NoZWNrX2lkbGUocHJpdik7DQo+ID4gPiA+ICvCoMKgwqDCoMKgwqAgaWYgKHJldCkNCj4gPiA+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsgLyogLUVUSU1FRE9V
VCAqLw0KPiA+ID4gPiArDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqAgc3Bpbl9sb2NrX2lycXNhdmUo
JnByaXYtPmxvY2ssIGZsYWdzKTsNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoCByZWluaXRfY29tcGxl
dGlvbigmcHJpdi0+eGZlcl9jb21wbGV0ZSk7DQo+ID4gPiA+ICsNCj4gPiA+ID4gK8KgwqDCoMKg
wqDCoCBwZWNpX2hlYWQgPSBGSUVMRF9QUkVQKEFTUEVFRF9QRUNJX1RBUkdFVF9BRERSX01BU0ss
IGFkZHIpIHwNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBG
SUVMRF9QUkVQKEFTUEVFRF9QRUNJX1dSX0xFTl9NQVNLLCByZXEtPnR4LmxlbikgfA0KPiA+ID4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEZJRUxEX1BSRVAoQVNQRUVE
X1BFQ0lfUkRfTEVOX01BU0ssIHJlcS0+cngubGVuKTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArwqDC
oMKgwqDCoMKgIHdyaXRlbChwZWNpX2hlYWQsIHByaXYtPmJhc2UgKyBBU1BFRURfUEVDSV9SV19M
RU5HVEgpOw0KPiA+ID4gPiArDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqAgbWVtY3B5X3RvaW8ocHJp
di0+YmFzZSArIEFTUEVFRF9QRUNJX1dSX0RBVEEwLCByZXEtPnR4LmJ1ZiwNCj4gPiA+ID4gbWlu
X3QodTgsIHJlcS0+dHgubGVuLCAxNikpOw0KPiA+ID4gPiArwqDCoMKgwqDCoMKgIGlmIChyZXEt
PnR4LmxlbiA+IDE2KQ0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtZW1j
cHlfdG9pbyhwcml2LT5iYXNlICsgQVNQRUVEX1BFQ0lfV1JfREFUQTQsIHJlcS0NCj4gPiA+ID4g
PnR4LmJ1ZiArDQo+ID4gPiA+IDE2LA0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXEtPnR4LmxlbiAtIDE2KTsNCj4gPiA+ID4g
Kw0KPiA+ID4gPiArwqDCoMKgwqDCoMKgIGRldl9kYmcocHJpdi0+ZGV2LCAiSEVBRCA6IDB4JTA4
eFxuIiwgcGVjaV9oZWFkKTsNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoCBwcmludF9oZXhfZHVtcF9i
eXRlcygiVFggOiAiLCBEVU1QX1BSRUZJWF9OT05FLCByZXEtPnR4LmJ1ZiwNCj4gPiA+ID4gcmVx
LQ0KPiA+ID4gPiA+IHR4Lmxlbik7DQo+ID4gPiANCj4gPiA+IE9uIENPTkZJR19EWU5BTUlDX0RF
QlVHPW4gYnVpbGRzIHRoZSBrZXJuZWwgd2lsbCBkbyBhbGwgdGhlIHdvcmsgb2YNCj4gPiA+IHJl
YWRpbmcgdGhyb3VnaCB0aGlzIGJ1ZmZlciwgYnV0IHNraXAgZW1pdHRpbmcgaXQuIEFyZSB5b3Ug
c3VyZSB5b3UNCj4gPiA+IHdhbnQgdG8gcGF5IHRoYXQgb3ZlcmhlYWQgZm9yIGV2ZXJ5IHRyYW5z
YWN0aW9uPw0KPiA+IA0KPiA+IEkgY2FuIHJlbW92ZSBpdCBvciBJIGNhbiBhZGQgc29tZXRoaW5n
IGxpa2U6DQo+ID4gDQo+ID4gI2lmIElTX0VOQUJMRUQoQ09ORklHX1BFQ0lfREVCVUcpDQo+ID4g
I2RlZmluZSBwZWNpX2RlYnVnKGZtdCwgLi4uKSBwcl9kZWJ1ZyhmbXQsICMjX19WQV9BUkdTX18p
DQo+ID4gI2Vsc2UNCj4gPiAjZGVmaW5lIHBlY2lfZGVidWcoLi4uKSBkbyB7IH0gd2hpbGUgKDAp
DQo+ID4gI2VuZGlmDQo+IA0KPiBJdCdzIHRoZSBoZXggZHVtcCBJJ20gd29ycmllZCBhYm91dCwg
bm90IHRoZSBkZWJ1ZyBzdGF0ZW1lbnRzIGFzIG11Y2guDQo+IA0KPiBJIHRoaW5rIHRoZSBjaG9p
Y2VzIGFyZSByZW1vdmUgdGhlIHByaW50X2hleF9kdW1wX2J5dGVzKCksIHB1dCBpdA0KPiBiZWhp
bmQgYW4gSVNfRU5BQkxFRChDT05GSUdfRFlOQU1JQ19ERUJVRykgdG8gZW5zdXJlIHRoZSBvdmVy
aGVhZCBpcw0KPiBza2lwcGVkIGluIHRoZSBDT05GSUdfRFlOQU1JQ19ERUJVRz1uIGNhc2UsIG9y
IGxpdmUgd2l0aCB0aGUgb3ZlcmhlYWQNCj4gaWYgdGhpcyBpcyBub3QgYSBmYXN0IHBhdGggLyBp
bmZyZXF1ZW50bHkgdXNlZC4NCg0KSSB3aWxsIHBsYWNlIGl0IGJlaGluZCBJU19FTkFCTEVEKENP
TkZJR19EWU5BTUlDX0RFQlVHKS4NCg0KPiANCj4gPiANCj4gPiAoYW5kIHNpbWlsYXIgcGVjaV90
cmFjZSB3aXRoIHRyYWNlX3ByaW50ayBmb3IgdXNhZ2UgaW4gSVJRIGhhbmRsZXJzIGFuZA0KPiA+
IHN1Y2gpLg0KPiA+IA0KPiA+IFdoYXQgZG8geW91IHRoaW5rPw0KPiANCj4gSW4gZ2VuZXJhbCwg
bm8sIGRvbid0IHdyYXAgdGhlIGJhc2UgbGV2ZWwgcHJpbnQgcm91dGluZXMgd2l0aA0KPiBkcml2
ZXItc3BlY2lmaWMgb25lcy4gQWxzbywgdHJhY2VfcHJpbnRrKCkgaXMgb25seSBmb3IgZGVidWcg
YnVpbGRzLg0KPiBOb3RlIHRoYXQgdHJhY2UgcG9pbnRzIGFyZSBidWlsdCB0byBiZSBldmVuIGxl
c3Mgb3ZlcmhlYWQgdGhhbg0KPiBkZXZfZGJnKCksIHNvIHRoZXJlJ3Mgbm8gb3ZlcmhlYWQgY29u
Y2VybiB3aXRoIGRpc2FibGVkIHRyYWNlcG9pbnRzLA0KPiB0aGV5IGxpdGVyYWxseSB0cmFuc2xh
dGUgdG8gbm9wcyB3aGVuIGRpc2FibGVkLg0KDQpBY2suDQoNCj4gDQo+ID4gDQo+ID4gPiANCj4g
PiA+ID4gKw0KPiA+ID4gPiArwqDCoMKgwqDCoMKgIHByaXYtPnN0YXR1cyA9IDA7DQo+ID4gPiA+
ICvCoMKgwqDCoMKgwqAgd3JpdGVsKEFTUEVFRF9QRUNJX0NNRF9GSVJFLCBwcml2LT5iYXNlICsg
QVNQRUVEX1BFQ0lfQ01EKTsNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoCBzcGluX3VubG9ja19pcnFy
ZXN0b3JlKCZwcml2LT5sb2NrLCBmbGFncyk7DQo+ID4gPiA+ICsNCj4gPiA+ID4gK8KgwqDCoMKg
wqDCoCByZXQgPSB3YWl0X2Zvcl9jb21wbGV0aW9uX2ludGVycnVwdGlibGVfdGltZW91dCgmcHJp
di0NCj4gPiA+ID4gPiB4ZmVyX2NvbXBsZXRlLCB0aW1lb3V0KTsNCj4gPiA+IA0KPiA+ID4gc3Bp
bl9sb2NrX2lycXNhdmUoKSBzYXlzICJJIGRvbid0IGtub3cgaWYgaW50ZXJydXB0cyBhcmUgZGlz
YWJsZWQNCj4gPiA+IGFscmVhZHksIHNvIEknbGwgc2F2ZSB0aGUgc3RhdGUsIHdoYXRldmVyIGl0
IGlzLCBhbmQgcmVzdG9yZSBsYXRlciINCj4gPiA+IA0KPiA+ID4gd2FpdF9mb3JfY29tcGxldGlv
bl9pbnRlcnJ1cHRpYmxlX3RpbWVvdXQoKSBzYXlzICJJIGtub3cgSSBhbSBpbiBhDQo+ID4gPiBz
bGVlcGFibGUgY29udGV4dCB3aGVyZSBpbnRlcnJ1cHRzIGFyZSBlbmFibGVkIg0KPiA+ID4gDQo+
ID4gPiBTbywgb25lIG9mIHRob3NlIGlzIHdyb25nLCBpLmUuIHNob3VsZCBpdCBiZSBzcGluX3ts
b2NrLHVubG9ja31faXJxKCk/DQo+ID4gDQo+ID4gWW91J3JlIHJpZ2h0IC0gSSdsbCBmaXggaXQu
DQo+ID4gDQo+ID4gPiANCj4gPiA+IA0KPiA+ID4gPiArwqDCoMKgwqDCoMKgIGlmIChyZXQgPCAw
KQ0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Ow0KPiA+
ID4gPiArDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqAgaWYgKHJldCA9PSAwKSB7DQo+ID4gPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9kYmcocHJpdi0+ZGV2LCAiVGltZW91dCB3
YWl0aW5nIGZvciBhIHJlc3BvbnNlIVxuIik7DQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiAtRVRJTUVET1VUOw0KPiA+ID4gPiArwqDCoMKgwqDCoMKgIH0NCj4g
PiA+ID4gKw0KPiA+ID4gPiArwqDCoMKgwqDCoMKgIHNwaW5fbG9ja19pcnFzYXZlKCZwcml2LT5s
b2NrLCBmbGFncyk7DQo+ID4gPiA+ICsNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoCB3cml0ZWwoMCwg
cHJpdi0+YmFzZSArIEFTUEVFRF9QRUNJX0NNRCk7DQo+ID4gPiA+ICsNCj4gPiA+ID4gK8KgwqDC
oMKgwqDCoCBpZiAocHJpdi0+c3RhdHVzICE9IEFTUEVFRF9QRUNJX0lOVF9DTURfRE9ORSkgew0K
PiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzcGluX3VubG9ja19pcnFyZXN0
b3JlKCZwcml2LT5sb2NrLCBmbGFncyk7DQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGRldl9kYmcocHJpdi0+ZGV2LCAiTm8gdmFsaWQgcmVzcG9uc2UhXG4iKTsNCj4gPiA+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU87DQo+ID4gPiA+ICvC
oMKgwqDCoMKgwqAgfQ0KPiA+ID4gPiArDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqAgc3Bpbl91bmxv
Y2tfaXJxcmVzdG9yZSgmcHJpdi0+bG9jaywgZmxhZ3MpOw0KPiA+ID4gPiArDQo+ID4gPiA+ICvC
oMKgwqDCoMKgwqAgbWVtY3B5X2Zyb21pbyhyZXEtPnJ4LmJ1ZiwgcHJpdi0+YmFzZSArIEFTUEVF
RF9QRUNJX1JEX0RBVEEwLA0KPiA+ID4gPiBtaW5fdCh1OCwgcmVxLT5yeC5sZW4sIDE2KSk7DQo+
ID4gPiA+ICvCoMKgwqDCoMKgwqAgaWYgKHJlcS0+cngubGVuID4gMTYpDQo+ID4gPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1lbWNweV9mcm9taW8ocmVxLT5yeC5idWYgKyAxNiwg
cHJpdi0+YmFzZSArDQo+ID4gPiA+IEFTUEVFRF9QRUNJX1JEX0RBVEE0LA0KPiA+ID4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVx
LT5yeC5sZW4gLSAxNik7DQo+ID4gPiA+ICsNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoCBwcmludF9o
ZXhfZHVtcF9ieXRlcygiUlggOiAiLCBEVU1QX1BSRUZJWF9OT05FLCByZXEtPnJ4LmJ1ZiwNCj4g
PiA+ID4gcmVxLQ0KPiA+ID4gPiA+IHJ4Lmxlbik7DQo+ID4gPiA+ICsNCj4gPiA+ID4gK8KgwqDC
oMKgwqDCoCByZXR1cm4gMDsNCj4gPiA+ID4gK30NCj4gPiA+ID4gKw0KPiA+ID4gPiArc3RhdGlj
IGlycXJldHVybl90IGFzcGVlZF9wZWNpX2lycV9oYW5kbGVyKGludCBpcnEsIHZvaWQgKmFyZykN
Cj4gPiA+ID4gK3sNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoCBzdHJ1Y3QgYXNwZWVkX3BlY2kgKnBy
aXYgPSBhcmc7DQo+ID4gPiA+ICvCoMKgwqDCoMKgwqAgdTMyIHN0YXR1czsNCj4gPiA+ID4gKw0K
PiA+ID4gPiArwqDCoMKgwqDCoMKgIHNwaW5fbG9jaygmcHJpdi0+bG9jayk7DQo+ID4gPiA+ICvC
oMKgwqDCoMKgwqAgc3RhdHVzID0gcmVhZGwocHJpdi0+YmFzZSArIEFTUEVFRF9QRUNJX0lOVF9T
VFMpOw0KPiA+ID4gPiArwqDCoMKgwqDCoMKgIHdyaXRlbChzdGF0dXMsIHByaXYtPmJhc2UgKyBB
U1BFRURfUEVDSV9JTlRfU1RTKTsNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoCBwcml2LT5zdGF0dXMg
fD0gKHN0YXR1cyAmIEFTUEVFRF9QRUNJX0lOVF9NQVNLKTsNCj4gPiA+ID4gKw0KPiA+ID4gPiAr
wqDCoMKgwqDCoMKgIC8qDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoCAqIEluIG1vc3QgY2FzZXMs
IGludGVycnVwdCBiaXRzIHdpbGwgYmUgc2V0IG9uZSBieSBvbmUgYnV0IGFsc28NCj4gPiA+ID4g
bm90ZQ0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqAgKiB0aGF0IG11bHRpcGxlIGludGVycnVwdCBi
aXRzIGNvdWxkIGJlIHNldCBhdCB0aGUgc2FtZSB0aW1lLg0KPiA+ID4gPiArwqDCoMKgwqDCoMKg
wqAgKi8NCj4gPiA+ID4gK8KgwqDCoMKgwqDCoCBpZiAoc3RhdHVzICYgQVNQRUVEX1BFQ0lfSU5U
X0JVU19USU1FT1VUKQ0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZf
ZGJnX3JhdGVsaW1pdGVkKHByaXYtPmRldiwNCj4gPiA+ID4gIkFTUEVFRF9QRUNJX0lOVF9CVVNf
VElNRU9VVFxuIik7DQo+ID4gPiA+ICsNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoCBpZiAoc3RhdHVz
ICYgQVNQRUVEX1BFQ0lfSU5UX0JVU19DT05URU5USU9OKQ0KPiA+ID4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBkZXZfZGJnX3JhdGVsaW1pdGVkKHByaXYtPmRldiwNCj4gPiA+ID4g
IkFTUEVFRF9QRUNJX0lOVF9CVVNfQ09OVEVOVElPTlxuIik7DQo+ID4gPiA+ICsNCj4gPiA+ID4g
K8KgwqDCoMKgwqDCoCBpZiAoc3RhdHVzICYgQVNQRUVEX1BFQ0lfSU5UX1dSX0ZDU19CQUQpDQo+
ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9kYmdfcmF0ZWxpbWl0ZWQo
cHJpdi0+ZGV2LA0KPiA+ID4gPiAiQVNQRUVEX1BFQ0lfSU5UX1dSX0ZDU19CQURcbiIpOw0KPiA+
ID4gPiArDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqAgaWYgKHN0YXR1cyAmIEFTUEVFRF9QRUNJX0lO
VF9XUl9GQ1NfQUJPUlQpDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRl
dl9kYmdfcmF0ZWxpbWl0ZWQocHJpdi0+ZGV2LA0KPiA+ID4gPiAiQVNQRUVEX1BFQ0lfSU5UX1dS
X0ZDU19BQk9SVFxuIik7DQo+ID4gPiANCj4gPiA+IEFyZSB5b3Ugc3VyZSB0aGVzZSB3b3VsZCBu
b3QgYmUgYmV0dGVyIGFzIHRyYWNlcG9pbnRzPyBJZiB5b3UncmUNCj4gPiA+IGRlYnVnZ2luZyBh
biBpbnRlcnJ1cHQgcmVsYXRlZCBmYWlsdXJlLCB0aGUgcmF0ZWxpbWl0aW5nIG1pZ2h0IGdldCBp
bg0KPiA+ID4geW91ciB3YXkgd2hlbiB5b3UgcmVhbGx5IG5lZWQgdG8ga25vdyB3aGVuIG9uZSBv
ZiB0aGVzZSBlcnJvcg0KPiA+ID4gaW50ZXJydXB0cyBmaXJlIHJlbGF0aXZlIHRvIGFub3RoZXIg
ZXZlbnQuDQo+ID4gDQo+ID4gVHJhY2Vwb2ludHMgYXJlIEFCSShpc2gpLCBhbmQgdXNpbmcgYSBm
dWxsIGJsb3duIHRyYWNlcG9pbnQganVzdCBmb3IgSVJRDQo+ID4gc3RhdHVzDQo+ID4gd291bGQg
cHJvYmFibHkgYmUgdG9vIG11Y2guDQo+IA0KPiBUcmFjZXBvaW50cyBiZWNvbWUgQUJJIG9uY2Ug
c29tZW9uZSBzaGlwcyB0b29saW5nIHRoYXQgZGVwZW5kcyBvbiB0aGVtDQo+IGJlaW5nIHRoZXJl
LiBUaGVzZSBkb24ndCBsb29rwqAgYXR0cmFjdGl2ZSBmb3IgYSB0b29sLCBhbmQgdGhleSBkb24n
dA0KPiBsb29rIGRpZmZpY3VsdCB0byBtYWludGFpbiBpZiB0aGUgaW50ZXJydXB0IGhhbmRsZXIg
bmVlZHMgdG8gYmUNCj4gcmV3b3JrZWQuIEkuZS4gaXQgd291bGQgYmUgdHJpdmlhbCB0byBrZWVw
IGEgZGVhZCB0cmFjZXBvaW50IGFyb3VuZCBpZg0KPiB3b3JzZSBjYW1lIHRvIHdvcnNlIHRvIGtl
ZXAgYSB0b29sIGZyb20gZmFpbGluZyB0byBsb2FkLg0KDQpBZnRlciBtb3JlIGNvbnNpZGVyYXRp
b24sIEkgd291bGQgcHJlZmVyIHRvIHJlbW92ZSB0aGVzZSBsb2dzIGZvciBub3cgLSBpbiBjYXNl
DQpvZiBlcnJvciBJJ2xsIGxvZyBmdWxsIHN0YXR1cyBpbiB4ZmVyKCkuDQoNCj4gDQo+ID4gSSB3
YXMgdGhpbmtpbmcgYWJvdXQgc29tZXRoaW5nIGxpa2UgdHJhY2VfcHJpbnRrIGhpZGRlbiB1bmRl
ciBhDQo+ID4gIkNPTkZJR19QRUNJX0RFQlVHIiAoc2VlIGFib3ZlKSwgYnV0IHBlcmhhcHMgdGhh
dCdzIHNvbWV0aGluZyBmb3IgdGhlIGZ1dHVyZQ0KPiA+IGltcHJvdmVtZW50Pw0KPiANCj4gQWdh
aW4gdHJhY2VfcHJpbnRrKCkgaXMgb25seSBmb3IgcHJpdmF0ZSBidWlsZHMuDQo+IA0KPiA+IA0K
PiA+ID4gDQo+ID4gPiA+ICsNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoCAvKg0KPiA+ID4gPiArwqDC
oMKgwqDCoMKgwqAgKiBBbGwgY29tbWFuZHMgc2hvdWxkIGJlIGVuZGVkIHVwIHdpdGggYQ0KPiA+
ID4gPiBBU1BFRURfUEVDSV9JTlRfQ01EX0RPTkUNCj4gPiA+ID4gYml0DQo+ID4gPiA+ICvCoMKg
wqDCoMKgwqDCoCAqIHNldCBldmVuIGluIGFuIGVycm9yIGNhc2UuDQo+ID4gPiA+ICvCoMKgwqDC
oMKgwqDCoCAqLw0KPiA+ID4gPiArwqDCoMKgwqDCoMKgIGlmIChzdGF0dXMgJiBBU1BFRURfUEVD
SV9JTlRfQ01EX0RPTkUpDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNv
bXBsZXRlKCZwcml2LT54ZmVyX2NvbXBsZXRlKTsNCj4gPiA+IA0KPiA+ID4gSG1tLCBubyBuZWVk
IHRvIGNoZWNrIGlmIHRoZXJlIHdhcyBhIHNlcXVlbmNpbmcgZXJyb3IsIGxpa2UgYSBjb21tYW5k
DQo+ID4gPiB3YXMgbmV2ZXIgc3VibWl0dGVkPw0KPiA+IA0KPiA+IEl0J3MgaGFuZGxlZCBieSBj
aGVja2luZyBpZiBIVyBpcyBpZGxlIGluIHhmZXIgYmVmb3JlIGEgY29tbWFuZCBpcyBzZW50LA0K
PiA+IHdoZXJlDQo+ID4gd2UganVzdCBleHBlY3QgYSBzaW5nbGUgaW50ZXJydXB0IHBlciBjb21t
YW5kLg0KPiANCj4gSSdtIGFza2luZyBob3cgZG8geW91IGRldGVybWluZSBpZiB0aGlzIHN0YXR1
cyB3YXMgc3B1cmlvdXMsIG9yIHRoZXJlDQo+IHdhcyBhIHNlcXVlbmNpbmcgZXJyb3IgaW4gdGhl
IGRyaXZlcj8NCg0KSSBkb24ndCB0aGluayB3ZSBoYXZlIGFueSBtZWFucyB0byBkZXRlcm1pbmUg
aXQuDQpQRUNJIGl0c2VsZiBkb2Vzbid0IHByb3ZpZGUgYW55IG1lY2hhbmlzbSB0byB2ZXJpZnkg
aXQgKHRoZXJlIGlzIG5vIHNlcXVlbmNlDQpudW1iZXIgb3IgdGFnIHRvIG1hdGNoIHJlcXVlc3Qv
cmVzcG9uc2UpLg0KV2UncmUgcmVseWluZyBvbiB0aGUgZmFjdCB0aGF0IEJNQyBpcyBhIHJlcXVl
c3RlciBhbmQgaW5pdGlhdGVzIGNvbW11bmljYXRpb24NCndpdGggQ1BVIC0gdGhlIGludGVycnVw
dCB3b24ndCBiZSBnZW5lcmF0ZWQgaWYgQk1DIGRvZXNuJ3Qgc2VuZCBhbnkgcmVxdWVzdC4NCg0K
VGhhbmtzDQotSXdvbmENCg==
