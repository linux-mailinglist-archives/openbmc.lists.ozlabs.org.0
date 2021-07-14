Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9523C94AB
	for <lists+openbmc@lfdr.de>; Thu, 15 Jul 2021 01:49:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQDk51KBZz308C
	for <lists+openbmc@lfdr.de>; Thu, 15 Jul 2021 09:49:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=rkwqluY9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=rkwqluY9; dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQ3Yb1n0Tz2yNG;
 Thu, 15 Jul 2021 02:56:18 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10045"; a="210372759"
X-IronPort-AV: E=Sophos;i="5.84,239,1620716400"; d="scan'208";a="210372759"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 09:55:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,239,1620716400"; d="scan'208";a="412846925"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 14 Jul 2021 09:55:16 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 14 Jul 2021 09:55:15 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 14 Jul 2021 09:55:15 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Wed, 14 Jul 2021 09:55:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 14 Jul 2021 09:55:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h1Y6byvy6YVzVSflystU/Fjrms8Awror7Dhef1M1zAa2s/5kjrRQHwbQ0tP2y9kN2d+ABlMNSGyMqgJbrgf9M3YWCqDVymWyCfO5GRpKIruTT5XsvZGpFhJ709Sx2yRD/j6ksv90TRPLgOGzbil/EFQFaqb9Etz0Yex0LlKj2MQwoPPYbW98IcGl9TfiBR1jyEN0ZfrTc/5ffZCSUkKkQUlPaHruTPQzB+lRTpNIw9zrEU8kpp1eK8MgpRbXA/AM/fhA6joYa/d+VXDWpPhuoMWI4kAX3yJjgXxJOnkBKkoESuM10nvNLaJGmHS6ovqr3wf8bWlwcEjNIZfjXdeztQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZbE4WQxJXy09sd8laaEUvkwqEjlGNl8E4l+7bySscM=;
 b=VRTCG45xFw7YW3hqw+GoRjWlvE0w55FwaW+/afJyTxhg55kAUl/x4oTVC6sXgxa4orWjirJdEuOjwJ2YzbH/NpB2Y3dA2i/+mNJg7qb+zVzS/gfWIJiMmxBKQiDFDMFQ3WhcQgFgC8zYWzKNWpM3uha5ZOVeypdekJ/6IzKhPPQX245G7+BaCGdwzJ5cKCTkvHigrj6Ro0e3YcBXL5TS+KKbW+IB9paY/T5+/K0PH9XoL4CZSHVCLVgaugjzZxXpn5uT26Vkn0/p776OYxda//fCBNn5x23cTFFO/XjOl/Om+3nYha4vDt7bYF2tO4g/ExKnQgyFJKev8K3Yo6xeXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZbE4WQxJXy09sd8laaEUvkwqEjlGNl8E4l+7bySscM=;
 b=rkwqluY9FGbx6q43fDqaG1zEqnFrvt2e0V1HrmSdyv/sbr55ugGzIsy1htTIQx3PyHjUyEIRVGraT39PdkrSrL1rvMdJ4Z7w10X3eNWcqjFJSVkino3W/NUphvSx7vtM2UrdX52ZKQCd2DLHKpvUTZWPI0Mc/OU6i1bWYrpncis=
Received: from SJ0PR11MB5150.namprd11.prod.outlook.com (2603:10b6:a03:2d4::18)
 by SJ0PR11MB4848.namprd11.prod.outlook.com (2603:10b6:a03:2af::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 14 Jul
 2021 16:54:47 +0000
Received: from SJ0PR11MB5150.namprd11.prod.outlook.com
 ([fe80::15f9:1166:732a:313d]) by SJ0PR11MB5150.namprd11.prod.outlook.com
 ([fe80::15f9:1166:732a:313d%3]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 16:54:47 +0000
From: "Williams, Dan J" <dan.j.williams@intel.com>
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH 01/14] x86/cpu: Move intel-family to arch-independent
 headers
Thread-Topic: [PATCH 01/14] x86/cpu: Move intel-family to arch-independent
 headers
Thread-Index: AQHXeND05/moFbfIGEiP1vtR+0W8tA==
Date: Wed, 14 Jul 2021 16:54:47 +0000
Message-ID: <32c71687f11fb418dafa45ecf15f7c6b50dd0397.camel@intel.com>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-2-iwona.winiarska@intel.com>
In-Reply-To: <20210712220447.957418-2-iwona.winiarska@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.1 (3.40.1-1.fc34) 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ba5cb94-f48a-448c-042b-08d946e816cc
x-ms-traffictypediagnostic: SJ0PR11MB4848:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR11MB4848AC1439D9F467E2990B4AC6139@SJ0PR11MB4848.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ms36BOIrW4cgSv9+UUBcny8R6M3T3CH8DpeFpIi9xDVV/4apPzLYIKIyC3Jbjs9dEUMT0I6mHfiqyoqYTo6zLFez0haTcJa4WkmzCmnvQyDBWDt3q0Ec7ojU1UI7sC6djx6uvJyGV9vDmm9kzT2buo6McSuib0nabvYzfGW230kyWpuD21gecBT+scLNqIBXcRoGDwtUJd0i4QOgCnAjOyfC9rrerUwi3ELiDMl2zgQznl3YbVcVcOsTF5IB61aPlFOimkDMpPTy1dDT/IwFMa21K6Rf51S60KceSsseBMRsLnIBfG9vM/bXSGfU4421vqMdvNv6+wgK632NC/RZwOz+wmrH679PTWmm5Gp7YaifWOExpL6jiMl+36fSuxTLwRtQMxzoS3pTZSpgk3QzuxH3mq7RSJSaBV3r8ZAgpC999pg49T8EGGUopQAMYFk3Ji+glp3JLxax9Txl4hPw5iMzdBS6H2h+ClejS/vX5z2pEcJHMqz3D3JNwA9J5XnYBV/dSHX9OFO9gF08soXU6yUylkyKhez2hFXDewjddFncTbZwFEhNSvvrZuMimutoxaEjggWqslSE4nJHfiZlhb1UHX6DkjaPi9phnOgHqF4ge5qLBes95c0sVBkC7WFwURVYK9WG2jariRX7nIi+yVU8lMhybMdgkLqqvfmS4j2JqPomloj6Zdti4J/9pvjPg/tCJhxNEqRZZWYW9IWyaQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5150.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(366004)(346002)(376002)(136003)(6512007)(7416002)(186003)(122000001)(110136005)(71200400001)(316002)(86362001)(83380400001)(54906003)(6486002)(4326008)(2906002)(8676002)(38100700002)(36756003)(66476007)(66946007)(8936002)(5660300002)(478600001)(91956017)(76116006)(2616005)(64756008)(66446008)(66556008)(6506007)(26005)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N2MrVFhDL0ZzTEtpWHhKQmlxNEpSLzhQcU1jdTk1YTcrUG8wNkJjRVNMTXJV?=
 =?utf-8?B?cFB3Qkd1UTNpSmlyYnNtemJqcVQrRmM1S0I3a21nbHhXTHQyTDhxbnNsODk0?=
 =?utf-8?B?VTNwY3I1Z0kwZ0srekdCVmlnUUY3N0cyS3dTaDBNS015Z3k0MGI4bys3by9L?=
 =?utf-8?B?YXVxamxPaEZsVlFGRHJORi9Ya0VydDZxQnpidmM4TFBKd0VsVlBHb3R3VnBr?=
 =?utf-8?B?aEFuTHBWM0s5Mm5lMFdZeGFDeUNlOWpuajhmTCtVbzc2ZHNJZk12Wnk2Y2Zu?=
 =?utf-8?B?aldpZzVheFo2NGtMY1YwT2FKS3JEWTVoTlR0a1JzWkQwWmpRdGJOL2Vyalgy?=
 =?utf-8?B?RU1FeCtpWTZjc0pIY2NjUk9SWGlJMUhGSStLYTVvNzZXeFRMQmREemF1RmY5?=
 =?utf-8?B?MUJUNUNsRDlkZ2RjbnV2cWxVbDU2bW82SEFkOU94WlRvTmErSXBBc3F1TGk3?=
 =?utf-8?B?di9FYTBBVEU3MVZta0Y4dk5Ta0cyNjV1dWI2UWVQTkJ1RGlSQzR0YWI2ZlM2?=
 =?utf-8?B?V1BVOEY0K051ek1lWnJZdXNNNzRHSWRQUkdzZU5oTEIyamlmMmlTeCtmN2dv?=
 =?utf-8?B?cmNaOHc2c2tKbTZKK2hsMlpQbGREVHdLQ2FBbTVraE53SnpwbHQ5UmxGYWdM?=
 =?utf-8?B?S1lNUENxRk1JMFpkME02cFlMcTFLNGMwSUxlSG9pWndSa085OVVVc1MrUW51?=
 =?utf-8?B?ckh5dElqNjN3RVlJenNwdnpsVlBhZW40WUhzRmV5YlBNKzdzdDUxMHFlUGhv?=
 =?utf-8?B?M3k3WXRGdTAraVFOZkJmUlBKR3RMTVdab2F5Q2MySGF3cHBObEpqNzYvbEps?=
 =?utf-8?B?UXpPTjgrK1h3T241Rk9sNGliRmNGZVRHb1Rha2h1emZmVTdaR2dhTjRhUEtw?=
 =?utf-8?B?R1lwY25Cem1nNXpTWlltRFV3cXM5dGFVQ2hsa0hwNjV2WmxJM2x4ZVJTekw3?=
 =?utf-8?B?MldaM29HRWxDcDN3cG1KTElZUktHSjZSV2kwTlVMTGUwa2VwTEFYMy8xWjAz?=
 =?utf-8?B?eDVqTWlDdHBsT1ZHNm9MejBjQmkvbldTUXFFNWhJQllhVmhkNjZlSnpVZzJJ?=
 =?utf-8?B?NWJzL3luSDNjdlYrTWtNak5oQWpNYWtGZk1CUFFwVURoODlDK1RWekl3eVJI?=
 =?utf-8?B?TnZCZlJFMVRRenl1TXhrTUVKNU96RUNqR3lIU1dqQ3g2WmorcEU1MDY3cGRk?=
 =?utf-8?B?ZzA0dnllOGRQV2ZWTmhrajkrYUxncTBMOW5GSzRXeHhPS3lnSk9hRDJsaGYz?=
 =?utf-8?B?UFpIbDRUZ0hOckZ5Sm5oc2k3UXR4OUNTc3A4L1lNbE5lMklhS3J5bVBqSzM4?=
 =?utf-8?B?L0xzQ3RvemNqczhKVTJpdWVDYktYZ04yVnFDWVJZVG9KYnBwQnA5Q1ExOWJT?=
 =?utf-8?B?YTQrUnFLYU9RaEdGdlZjQkZtV215YXZrZ0tENXh6azdac0huUVNOYzNFaHhk?=
 =?utf-8?B?TjdhQWZVMGtSQUFpRjlwUDNKV2Z6TmdNeEpHYXNWZVJBQ2hlTmVNa2kzTm1Z?=
 =?utf-8?B?UVhVLzFKSUpEVnVvNDRBU3hKazlvWWwxSUl1M0ZZTEx3dnUxMFJ5WmtTRWxS?=
 =?utf-8?B?NjN2T1RaQWdRR0tYVjhCc1lzQ1NleWI4eVdINTF3T0kySlUrSFRnMS8wWDFG?=
 =?utf-8?B?djNac1ZJcEVON3N0WlBxQTlMMlVjWWZCU3RGektkRFQxcGU1ekFhOVMra0Fi?=
 =?utf-8?B?QUFKOFVXU2EvUm5mZWVFa2w0T1g2ZXgzVnYrLy9CUyszS3pPbTVOckhtMWFS?=
 =?utf-8?B?NkJUcFJTQjRLUkM2SXNDUks5K3FtNndaMHNMWFZINVJHTjB3disxbUJFUHVZ?=
 =?utf-8?B?cVZqNDZicGk0NWQyQjdzZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <39D7E6ABDB11D547A079BA19DC69F6D9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5150.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba5cb94-f48a-448c-042b-08d946e816cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2021 16:54:47.6401 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TPLwfv8DDzq47NofuI4CdAhfCXF1bzdcLRI4mBolTBLv8EbZILbv8VgFdw4Buuidbj7vusW4N/01+O/ADCdeYCCnlWdSfoo79WxRo60rCpE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4848
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
eSBuZWVkIHRvIGRlY29kZSB0aGUgZmFtaWx5DQo+IGFuZCBtb2RlbC4NCj4gDQo+IE1vdmUgdGhl
IGRhdGEgZnJvbSBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9pbnRlbC1mYW1pbHkuaCBpbnRvIGEgbmV3
IGZpbGUNCj4gaW5jbHVkZS9saW51eC94ODYvaW50ZWwtZmFtaWx5Lmggc28gdGhhdCBpdCBjYW4g
YmUgdXNlZCBieSBvdGhlcg0KPiBhcmNoaXRlY3R1cmVzLg0KDQpBdCBsZWFzdCBpdCB3b3VsZCBt
YWtlIHRoZSBkaWZmc3RhdCBzbWFsbGVyIHRvIGFsbG93IGZvciByZW5hbWUNCmRldGVjdGlvbiB3
aGVuIHRoZSBvbGQgZmlsZSBpcyBkZWxldGVkIGluIHRoZSBzYW1lIHBhdGNoOg0KDQogTUFJTlRB
SU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEg
Kw0KIHthcmNoL3g4Ni9pbmNsdWRlL2FzbSA9PiBpbmNsdWRlL2xpbnV4L3g4Nn0vaW50ZWwtZmFt
aWx5LmggfCA2ICsrKy0tLQ0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQ0KDQouLi5vbmUgdGhpbmcgcGVvcGxlIGhhdmUgZG9uZSBpbiB0aGUgcGFzdCBp
cyBpbmNsdWRlIGEgY29udmVyc2lvbg0Kc2NyaXB0IGluIHRoZSBjaGFuZ2Vsb2cgdGhhdCBwcm9k
dWNlZCB0aGUgZGlmZi4gVGhhdCB3YXkgaWYgYQ0KbWFpbnRhaW5lciB3YW50cyB0byBiZSBzdXJl
IHRvIGNhdGNoIGFueSBuZXcgdXNhZ2Ugb2YgdGhlIGhlYWRlciBhdA0KdGhlIG9sZCBsb2NhdGlv
biB0aGV5IGp1c3QgcnVuIHRoZSBzY3JpcHQuDQoNCkkgYW0gbm90IGF3YXJlIG9mIHg4NiBtYWlu
dGFpbmVyIHByZWZlcmVuY2UgaGVyZS4gRWl0aGVyIHdheSB5b3UgZGVjaWRlDQp0byBnbyB5b3Ug
Y2FuIGFkZDoNCg0KUmV2aWV3ZWQtYnk6IERhbiBXaWxsaWFtcyA8ZGFuLmoud2lsbGlhbXNAaW50
ZWwuY29tPg0KDQo=
