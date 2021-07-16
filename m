Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FCA3CBE6C
	for <lists+openbmc@lfdr.de>; Fri, 16 Jul 2021 23:23:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GRPP21l12z3bWq
	for <lists+openbmc@lfdr.de>; Sat, 17 Jul 2021 07:23:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=FMSLN2TH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=FMSLN2TH; dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GRPNj05t3z2xZn;
 Sat, 17 Jul 2021 07:23:16 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10047"; a="210843788"
X-IronPort-AV: E=Sophos;i="5.84,246,1620716400"; d="scan'208";a="210843788"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 14:22:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,246,1620716400"; d="scan'208";a="563251426"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga004.jf.intel.com with ESMTP; 16 Jul 2021 14:22:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 16 Jul 2021 14:22:13 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 16 Jul 2021 14:22:12 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Fri, 16 Jul 2021 14:22:12 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 16 Jul 2021 14:22:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDlbJw9RCxijevYBEp6MgMSplLxK7yPgQLWOVL2q7KebOvoaYtzNlVzpd4Chk+ZsFL00gkt/wzzu9sbTIhyAqBbVH8xC5/H52poYe/Mcgyx5eFXmYL6GY7zBBwQjapYRX7lCQB0ilPozmcRZavYqNJSbQNLVZCZNh4d4ae3UCLtQ7E0+Q7dWZ1+CCqDTvqDF0znjDari3P9lL7jAOEG14X0TTeQOHtfmqAXIotJ823SVTSPPlp9IDo5VSdi+xDql3zmkVlftEm0HNo4pI3gW24C42IGk1j2CQqmDsnIYAC7SqgHQSnkltS/+gyOU+bcaVSHZqeHz7fgc2krk8SaYdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1e1E/2cx+tBxMh6tCa3Rp9DRJm12sBtkArASHcVr6M=;
 b=Uxp3pyAFUHDUfh68Q5yxU1d0R+8fJpVVgetxsjbcbO6X8llQnQ9A9Ad2+1e+1+9C5ahcl8U41tfdx99+iX57XaHuFMaasbGcA6kFBP+FoNAgjf2TXua4ucN75yFJMA9inkPMOlWNTAz4Tll59IqzEeVTIbAqFZzdwLLUNTL75VHZQwFDgFbZsZce32GuMLpEjTsY8nxSjlEbA+oMmXECdh18NhPkXZA7JyoMowGuuSxrNfM1OlqoVrCD2NFMIgZ6OnKIOk5WeVVMyKn5j+7pn+NUYIaOOUtTk81SbUkuhSxEsThFZq1Bv08GvIuYvmbXp2V6yx75p9o/ehF+G5mv/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1e1E/2cx+tBxMh6tCa3Rp9DRJm12sBtkArASHcVr6M=;
 b=FMSLN2THAGV+aZLIRPZ7EI1KQREFy6eo5Csw9iC7Ys8kJqhmHJotXrjYd7EqhW1290rQ8flT2Pnuwa/VnrqmveWkO47LnlC5IYFT9DbijY5CDJt5HHGGndCk0cfsSTeEjxRNELrH8cJKBrjVl5Dpo4niUDhu9DovyC6nrxLq9Hc=
Received: from SN6PR11MB2589.namprd11.prod.outlook.com (2603:10b6:805:53::12)
 by SA2PR11MB4812.namprd11.prod.outlook.com (2603:10b6:806:f8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Fri, 16 Jul
 2021 21:22:10 +0000
Received: from SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::357a:ba5:ee4f:d5f1]) by SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::357a:ba5:ee4f:d5f1%7]) with mapi id 15.20.4331.026; Fri, 16 Jul 2021
 21:22:10 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "robh@kernel.org" <robh@kernel.org>
Subject: Re: [PATCH 04/14] dt-bindings: Add bindings for peci-aspeed
Thread-Topic: [PATCH 04/14] dt-bindings: Add bindings for peci-aspeed
Thread-Index: AQHXd2pqdRpTitBIjUmhO8tQzWLkSKtEPhsAgAHkVYA=
Date: Fri, 16 Jul 2021 21:22:10 +0000
Message-ID: <cabd7cbb2746bcf64f8fd8f8948cab54f1b148ef.camel@intel.com>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-5-iwona.winiarska@intel.com>
 <20210715162840.GA1187226@robh.at.kernel.org>
In-Reply-To: <20210715162840.GA1187226@robh.at.kernel.org>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.4 (3.38.4-1.fc33) 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0951bf99-6a94-4f30-eebd-08d9489fc59a
x-ms-traffictypediagnostic: SA2PR11MB4812:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB481243BAE7EBFDFBC67F2F9EEC119@SA2PR11MB4812.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KBItIDgYLK5FJjyr//uv+Y9uduQI4ajfyWD27S21G/X+XrRxCvTCfQ3Ep3ELAunAf2DRTT07278kjSr7HV2oRAnZeT2BhblJ5rZ+G94rDVSd/sOMt9GU6uPoUlCtakAz0VLbtu07T8KFh5rzkV6f93idedKz/fhOiR7kHfI1arJmV9GXo6Z0LH88eU/PDQp3Z892RwtgC84Y3U6rYmuzBGMYeClmQxUSMYukZNfPmX4mqJgVc+A7onrJKqmQUFJ3+BH241343OwuyGuwt2R3ahLgqf3lXLCzMLmakK3l8NMx2vvmXG/pvv2zqgy5/TSjwyeEFOu8kpWSBWKggPmcDBcoIOmruChYDxUjeMos92Ulxx6JvssavMmfKXbOrxZLZmvIdyHR1xUPDLRMsDo5OAN1PU2S+4nQ3vlyPAZD/VVIbeVSXhIRxQLTVd111BzCys9GOcFx+OEyLzCpxHuygcUjbdELE0eaCElg+Hv/GeRIqL3iBNlIaHWoZ8Y2FHq2FwN8imjPDTr98Jk4ijR0DFTaRzIacJ8/WELOgqY1/KQwRajbl3AtNO4rTynI4VXNLrMS2IDGYcNJk446ce5wrBcgejfEPY8N9OSJZo666JRcJ3Ypzup+aoWtMUqXt0iw1ysXgflOnth8FuQlsHIumzWjPZQl2rCzfXx2aUZVMKB5tnkupIJPQ9k/mv2wpjBmJa8CK1vQtU5f0eltxAAPiXZETijLiLTwR0Ck9G+VZkpZBW4EPxR8LYaJDtWg+7t2/ELxS1h90OXUrWrTs4oRTJD8p0gT8icJ2p7HPxmMSRTDFDuyf2i34INx1U5mjIj8757kc5h6cMz/p/596BKRDg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2589.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(6512007)(8676002)(6486002)(316002)(8936002)(4326008)(83380400001)(91956017)(86362001)(478600001)(64756008)(66446008)(6916009)(54906003)(186003)(966005)(5660300002)(2906002)(7416002)(71200400001)(122000001)(38100700002)(36756003)(6506007)(2616005)(66556008)(76116006)(66946007)(66476007)(26005)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WE5YT3RYSDRoYVRaQlhGMUJJQUtBSnJoSVlFLzM1SU1sMTJaS3g1UnlCS0lP?=
 =?utf-8?B?QUhmbzU2R2pqcTAxMWc4S0dWT2hhOVNiSmhXSGdwWmxPUVJmWnZnVXgrUTJO?=
 =?utf-8?B?alc4NVpjeTBCbGJTZDdEN0I2dG03bVd4bXhRQWZLSys3Rm9ia1J4dzdPRktD?=
 =?utf-8?B?L3h0NTlLekFyTmpXMEdISWZJY0hTbFppS3NLU1MvU2lUT0U3MXJTdy9vcVh4?=
 =?utf-8?B?VXZ4UlNFOUZrQTlFekZrbzhCVXBKTmN1N0d3aVpMY0FxQXI1aGNUWS9hRGd4?=
 =?utf-8?B?NEFsMGNRZG45N2lyUEFOWEZqNGRkSWtqazJiRzFmSUp4Y2dreEpDWVFna1pI?=
 =?utf-8?B?WlFKSEIzWTkrbUR6MitsZnkxcU9FdU5SWmlMdHRSQytRazhJOHE4VFlETVVh?=
 =?utf-8?B?NFlhczBxNFZWMEpsdHZFSmc0MEh6N204YjRiaVJhZEpsOGlXaUNQQUh5bFA0?=
 =?utf-8?B?N0t0Vlh4UHFnMVFEc3BvT0VKU2pxWXBDMFhqR2VlRkFGbWJHTlR1L1VoWFFM?=
 =?utf-8?B?ZlRpbU9sTmlCaUQ5dSt2SjRXNjEwYVk3Qk53SHhrVnZuU2o0SGwvaGV2cUc4?=
 =?utf-8?B?d3pmVUk4Skp5SFUzU3NwckgvZWg1WTh4dSttRkZ0SERzZnlsM2k5Z1dtb3lQ?=
 =?utf-8?B?bGRqVVk0WW5LcFJiYS9abUQ1MjdyWFk1bmtYVGJ0eC95UWV6bEhUYzIxUzNG?=
 =?utf-8?B?TXNoNGQ5cTRJQTI3SlFzUFdqK1BCUnNtNXpKdThDY1B6TlNhREpkMnlzU21B?=
 =?utf-8?B?b01TbjRMUG02Q1c0T2Q2ZWpUUEdFQXkvUmluYXFsS2k0bG4rRXBJSGJUbk9r?=
 =?utf-8?B?azBRZGsrZS9XUjh4YXJGdXUzQVhIUHpOb2IyWFIvREMvaWYwRXZ3Wkw2VWZi?=
 =?utf-8?B?OXFSTTdoQ1R5M3E3VWxJUGxvd25HcWk0dzZpaEhocm83ckM4U2tWOCtDeExD?=
 =?utf-8?B?cllweDNDbWhreGdnU2RIWFhKMUErS1lxZjRzbVBJNGxHYm9DSjlpdTA1Mkhz?=
 =?utf-8?B?TDZIVEpUdys2eTM4S2Rac0YwQU4yM3dXcWpQZEtVQzRMQllDMWYwV09nWWdQ?=
 =?utf-8?B?SWV4Uy9YaWZYU3MwSFY3YmN1UW93amM3SURuZFFQd3Q4cDRiS0RzNlhqeDRI?=
 =?utf-8?B?Nmp5TmVjRjlicFdSM3FDakNoMFh3ano1MHBObk5aa08wUEhhRmIzVXc0R2x6?=
 =?utf-8?B?T2RwRHFIOG04L1I0elQyaXZUTlhqWGl2L1dMOExBQzZNK3dicno0aVRXdnJ2?=
 =?utf-8?B?YkNueHdsbk9kMlBXWFNVYXdkVmNFNFhjRUFBcmk0MUozNXpPdEdnTmFqaGhJ?=
 =?utf-8?B?MTJHTEk5QkRzMG5VSmVFRm9Db3daRlRoelFXY05xRk1xVllKcUh6OEpTNFRi?=
 =?utf-8?B?T0dGUnBBTlpqcVkyYUhFdEJvdFdIN3BYSnIvbERwKytoUTNuS0Q2TlMydG1I?=
 =?utf-8?B?eGw0RXJqaFgvMlowTEtCUTdpai9Fc1ZwM05qRm1PcXg4bHd4bHlmcm1IMENi?=
 =?utf-8?B?Z2J2VXh4a0NEbTgxZXdlaXB3NXBxZDkybDJ2OFNsek8vOUJCclByZ09IRUR1?=
 =?utf-8?B?YmdPV2gwcDI2M2NCajFwL3pOVHJtSUJ3dkRibnZRTnFvc0s1amI2azdwZkJU?=
 =?utf-8?B?aGVybGdCckZkYVRmZXpZb0RKc0IwSzZwUGVHUDNNUXFOSEFSWHc0TlFzRkI3?=
 =?utf-8?B?b3Z3alJYZ3ZhUGtRaFVsdXdNWFl5TzhkdTVxeGt0WEFCd3Evd243MG5NcEZC?=
 =?utf-8?B?b1RFYWR6UGdSQXdwdkhYTGVQMnJER05oaHJ5R0RISS9vRW0rdE1sYUc0WnVu?=
 =?utf-8?B?d3hFNTJ4S1FWWGNicHFEdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4A6A09EA40D3F241A1DA80BFF04328B1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2589.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0951bf99-6a94-4f30-eebd-08d9489fc59a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2021 21:22:10.0691 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FKiNk/txICpgMWWZVGd9KZddxJAtr673T8Xi/i5ulYchQ3VYGapHZFKO5MsXIk96LLp9yTa1g65icx73xVGhUjlETt30LW4mV46rFMmzkTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4812
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
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>, "bp@alien8.de" <bp@alien8.de>,
 "Lutomirski, Andy" <luto@kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "Luck, 
 Tony" <tony.luck@intel.com>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "yazen.ghannam@amd.com" <yazen.ghannam@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gVGh1LCAyMDIxLTA3LTE1IGF0IDEwOjI4IC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
T24gVHVlLCBKdWwgMTMsIDIwMjEgYXQgMTI6MDQ6MzdBTSArMDIwMCwgSXdvbmEgV2luaWFyc2th
IHdyb3RlOg0KPiA+IEFkZCBkZXZpY2UgdHJlZSBiaW5kaW5ncyBmb3IgdGhlIHBlY2ktYXNwZWVk
IGNvbnRyb2xsZXIgZHJpdmVyLg0KPiA+IA0KPiA+IENvLWRldmVsb3BlZC1ieTogSmFlIEh5dW4g
WW9vIDxqYWUuaHl1bi55b29AbGludXguaW50ZWwuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEph
ZSBIeXVuIFlvbyA8amFlLmh5dW4ueW9vQGxpbnV4LmludGVsLmNvbT4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBJd29uYSBXaW5pYXJza2EgPGl3b25hLndpbmlhcnNrYUBpbnRlbC5jb20+DQo+ID4gLS0t
DQo+ID4gwqAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9wZWNpL3BlY2ktYXNwZWVkLnlhbWwgfCAx
MTEgKysrKysrKysrKysrKysrKysrDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMTExIGluc2VydGlv
bnMoKykNCj4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcGVjaS9wZWNpLWFzcGVlZC55YW1sDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wZWNpL3BlY2ktYXNwZWVkLnlhbWwgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGVjaS9wZWNpLWFzcGVlZC55YW1sDQo+
ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjYwNjFlMDYw
MDlmYg0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcGVjaS9wZWNpLWFzcGVlZC55YW1sDQo+ID4gQEAgLTAsMCArMSwxMTEgQEAN
Cj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1D
bGF1c2UpDQo+ID4gKyVZQU1MIDEuMg0KPiA+ICstLS0NCj4gPiArJGlkOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvc2NoZW1hcy9wZWNpL3BlY2ktYXNwZWVkLnlhbWwjDQo+ID4gKyRzY2hlbWE6IGh0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KPiA+ICsNCj4gPiAr
dGl0bGU6IEFzcGVlZCBQRUNJIEJ1cyBEZXZpY2UgVHJlZSBCaW5kaW5ncw0KPiA+ICsNCj4gPiAr
bWFpbnRhaW5lcnM6DQo+ID4gKyAgLSBJd29uYSBXaW5pYXJza2EgPGl3b25hLndpbmlhcnNrYUBp
bnRlbC5jb20+DQo+ID4gKyAgLSBKYWUgSHl1biBZb28gPGphZS5oeXVuLnlvb0BsaW51eC5pbnRl
bC5jb20+DQo+ID4gKw0KPiA+ICthbGxPZjoNCj4gPiArICAtICRyZWY6IHBlY2ktY29udHJvbGxl
ci55YW1sIw0KPiA+ICsNCj4gPiArcHJvcGVydGllczoNCj4gPiArICBjb21wYXRpYmxlOg0KPiA+
ICsgICAgZW51bToNCj4gPiArICAgICAgLSBhc3BlZWQsYXN0MjQwMC1wZWNpDQo+ID4gKyAgICAg
IC0gYXNwZWVkLGFzdDI1MDAtcGVjaQ0KPiA+ICsgICAgICAtIGFzcGVlZCxhc3QyNjAwLXBlY2kN
Cj4gPiArDQo+ID4gKyAgcmVnOg0KPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiArDQo+ID4gKyAg
aW50ZXJydXB0czoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICsgIGNsb2NrczoN
Cj4gPiArICAgIGRlc2NyaXB0aW9uOiB8DQo+ID4gKyAgICAgIENsb2NrIHNvdXJjZSBmb3IgUEVD
SSBjb250cm9sbGVyLiBTaG91bGQgcmVmZXJlbmNlIHRoZSBleHRlcm5hbA0KPiA+ICsgICAgICBv
c2NpbGxhdG9yIGNsb2NrLg0KPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiArDQo+ID4gKyAgcmVz
ZXRzOg0KPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiArDQo+ID4gKyAgY2xvY2stZGl2aWRlcjoN
Cj4gPiArICAgIGRlc2NyaXB0aW9uOiBUaGlzIHZhbHVlIGRldGVybWluZXMgUEVDSSBjb250cm9s
bGVyIGludGVybmFsIGNsb2NrDQo+ID4gKyAgICAgIGRpdmlkaW5nIHJhdGUuIFRoZSBkaXZpZGVy
IHdpbGwgYmUgY2FsY3VsYXRlZCBhcyAyIHJhaXNlZCB0byB0aGUNCj4gPiArICAgICAgcG93ZXIg
b2YgdGhlIGdpdmVuIHZhbHVlLg0KPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMv
ZGVmaW5pdGlvbnMvdWludDMyDQo+ID4gKyAgICBtaW5pbXVtOiAwDQo+ID4gKyAgICBtYXhpbXVt
OiA3DQo+ID4gKyAgICBkZWZhdWx0OiAwDQo+ID4gKw0KPiANCj4gPiArICBtc2ctdGltaW5nOg0K
PiA+ICsgICAgZGVzY3JpcHRpb246IHwNCj4gPiArICAgICAgTWVzc2FnZSB0aW1pbmcgbmVnb3Rp
YXRpb24gcGVyaW9kLiBUaGlzIHZhbHVlIHdpbGwgZGV0ZXJtaW5lIHRoZSBwZXJpb2QNCj4gPiAr
ICAgICAgb2YgbWVzc2FnZSB0aW1pbmcgbmVnb3RpYXRpb24gdG8gYmUgaXNzdWVkIGJ5IFBFQ0kg
Y29udHJvbGxlci4gVGhlIHVuaXQNCj4gPiArICAgICAgb2YgdGhlIHByb2dyYW1tZWQgdmFsdWUg
aXMgZm91ciB0aW1lcyBvZiBQRUNJIGNsb2NrIHBlcmlvZC4NCj4gPiArICAgICRyZWY6IC9zY2hl
bWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMg0KPiA+ICsgICAgbWluaW11bTogMA0K
PiA+ICsgICAgbWF4aW11bTogMjU1DQo+ID4gKyAgICBkZWZhdWx0OiAxDQo+ID4gKw0KPiA+ICsg
IGFkZHItdGltaW5nOg0KPiA+ICsgICAgZGVzY3JpcHRpb246IHwNCj4gPiArICAgICAgQWRkcmVz
cyB0aW1pbmcgbmVnb3RpYXRpb24gcGVyaW9kLiBUaGlzIHZhbHVlIHdpbGwgZGV0ZXJtaW5lIHRo
ZSBwZXJpb2QNCj4gPiArICAgICAgb2YgYWRkcmVzcyB0aW1pbmcgbmVnb3RpYXRpb24gdG8gYmUg
aXNzdWVkIGJ5IFBFQ0kgY29udHJvbGxlci4gVGhlIHVuaXQNCj4gPiArICAgICAgb2YgdGhlIHBy
b2dyYW1tZWQgdmFsdWUgaXMgZm91ciB0aW1lcyBvZiBQRUNJIGNsb2NrIHBlcmlvZC4NCj4gPiAr
ICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMg0KPiA+ICsg
ICAgbWluaW11bTogMA0KPiA+ICsgICAgbWF4aW11bTogMjU1DQo+ID4gKyAgICBkZWZhdWx0OiAx
DQo+ID4gKw0KPiA+ICsgIHJkLXNhbXBsaW5nLXBvaW50Og0KPiA+ICsgICAgZGVzY3JpcHRpb246
IHwNCj4gPiArICAgICAgUmVhZCBzYW1wbGluZyBwb2ludCBzZWxlY3Rpb24uIFRoZSB3aG9sZSBw
ZXJpb2Qgb2YgYSBiaXQgdGltZSB3aWxsIGJlDQo+ID4gKyAgICAgIGRpdmlkZWQgaW50byAxNiB0
aW1lIGZyYW1lcy4gVGhpcyB2YWx1ZSB3aWxsIGRldGVybWluZSB0aGUgdGltZSBmcmFtZQ0KPiA+
ICsgICAgICBpbiB3aGljaCB0aGUgY29udHJvbGxlciB3aWxsIHNhbXBsZSBQRUNJIHNpZ25hbCBm
b3IgZGF0YSByZWFkIGJhY2suDQo+ID4gKyAgICAgIFVzdWFsbHkgaW4gdGhlIG1pZGRsZSBvZiBh
IGJpdCB0aW1lIGlzIHRoZSBiZXN0Lg0KPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFt
bCMvZGVmaW5pdGlvbnMvdWludDMyDQo+ID4gKyAgICBtaW5pbXVtOiAwDQo+ID4gKyAgICBtYXhp
bXVtOiAxNQ0KPiA+ICsgICAgZGVmYXVsdDogOA0KPiA+ICsNCj4gPiArICBjbWQtdGltZW91dC1t
czoNCj4gPiArICAgIGRlc2NyaXB0aW9uOiB8DQo+ID4gKyAgICAgIENvbW1hbmQgdGltZW91dCBp
biB1bml0cyBvZiBtcy4NCj4gPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmlu
aXRpb25zL3VpbnQzMg0KPiA+ICsgICAgbWluaW11bTogMQ0KPiA+ICsgICAgbWF4aW11bTogMTAw
MA0KPiA+ICsgICAgZGVmYXVsdDogMTAwMA0KPiANCj4gQXJlIGFsbCBvZiB0aGVzZSBwcm9wZXJ0
aWVzIGNvbW1vbiBmb3IgUEVDSSBvciBzcGVjaWZpYyB0byB0aGlzIA0KPiBjb250cm9sbGVyPyBU
aGUgZm9ybWVyIG5lZWRzIHRvIGdvIGludG8gdGhlIGNvbW1vbiBzY2hlbWEuIFRoZSBsYXR0ZXIg
DQo+IG5lZWQgdmVuZG9yIHByZWZpeGVzLg0KPiANCg0KVGhlIGxhdHRlciwgSSdsbCBhZGQgdmVu
ZG9yIHByZWZpeGVzIGluIHYyLg0KDQpUaGFuayB5b3UNCi1Jd29uYQ0KDQo+IA0KPiA+ICsNCj4g
PiArcmVxdWlyZWQ6DQo+ID4gKyAgLSBjb21wYXRpYmxlDQo+ID4gKyAgLSByZWcNCj4gPiArICAt
IGludGVycnVwdHMNCj4gPiArICAtIGNsb2Nrcw0KPiA+ICsgIC0gcmVzZXRzDQo+ID4gKw0KPiA+
ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gPiArDQo+ID4gK2V4YW1wbGVzOg0KPiA+
ICsgIC0gfA0KPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9s
bGVyL2FybS1naWMuaD4NCj4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9hc3Qy
NjAwLWNsb2NrLmg+DQo+ID4gKyAgICBwZWNpLWNvbnRyb2xsZXJAMWU3OGIwMDAgew0KPiA+ICsg
ICAgICBjb21wYXRpYmxlID0gImFzcGVlZCxhc3QyNjAwLXBlY2kiOw0KPiA+ICsgICAgICByZWcg
PSA8MHgxZTc4YjAwMCAweDEwMD47DQo+ID4gKyAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAz
OCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCj4gPiArICAgICAgY2xvY2tzID0gPCZzeXNjb24gQVNQ
RUVEX0NMS19HQVRFX1JFRjBDTEs+Ow0KPiA+ICsgICAgICByZXNldHMgPSA8JnN5c2NvbiBBU1BF
RURfUkVTRVRfUEVDST47DQo+ID4gKyAgICAgIGNsb2NrLWRpdmlkZXIgPSA8MD47DQo+ID4gKyAg
ICAgIG1zZy10aW1pbmcgPSA8MT47DQo+ID4gKyAgICAgIGFkZHItdGltaW5nID0gPDE+Ow0KPiA+
ICsgICAgICByZC1zYW1wbGluZy1wb2ludCA9IDw4PjsNCj4gPiArICAgICAgY21kLXRpbWVvdXQt
bXMgPSA8MTAwMD47DQo+ID4gKyAgICB9Ow0KPiA+ICsuLi4NCj4gPiAtLSANCj4gPiAyLjMxLjEN
Cj4gPiANCj4gPiANCg0K
