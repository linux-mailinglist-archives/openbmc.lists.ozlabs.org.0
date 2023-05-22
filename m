Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CB570CC50
	for <lists+openbmc@lfdr.de>; Mon, 22 May 2023 23:26:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQ9Vl3cBQz3cf8
	for <lists+openbmc@lfdr.de>; Tue, 23 May 2023 07:26:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m/oSqNkl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m/oSqNkl;
	dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir; Tue, 23 May 2023 07:25:50 AEST
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQ9V641qTz3bgr
	for <openbmc@lists.ozlabs.org>; Tue, 23 May 2023 07:25:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684790750; x=1716326750;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=jp4jPiGP0iEltHWMAQ9JMt6/brgiUlvMi5cplSzoXqQ=;
  b=m/oSqNkleAbQtaDqrIz9zf4a91jLa5tRh7a1ZXRkf11xUh3CNj9s0wdp
   BuER0rB5bKNJefoXaxk5oHFUFWPeatNAJ8t9H1+SyuPvDfy45gQD0dqBP
   NPbqk/PyZM1XqfL6xX1aPRWT9tD2b3m51G4mmQAS2bbra+xjAy2TGGKGG
   +rVa4ueTG3TEwwWbRdDKD3padBceTkYXyLvZtN2qGuKk1CAu0LxDLG3Ek
   v4Zpjg/gKTQxoTKVxo4fJuBRR/Us/6pcqJfYlGR2x/747OY6HwbtOFEI5
   QrQUf8RcOkbda2jMrlPV4CLyJrW52wVPOlX8XXgjCYMwgCFQhBOJq1q6w
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="337634791"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="337634791"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2023 14:24:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="815842887"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="815842887"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga002.fm.intel.com with ESMTP; 22 May 2023 14:24:29 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 22 May 2023 14:24:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 22 May 2023 14:24:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 22 May 2023 14:24:28 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 22 May 2023 14:24:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JbwbXfuleDc4x6Btl0NnVTX4frGxSe1vPXUu1PDzAueo2iZE8TWmRySIuO9zNErFQzk3eVB5d4gxGsP/0XXfqehdq6LP30LjJWnQHbVEebR9NHFw0S5RkNvlCflcWzq6ue70W8p2M47gTnsYopDnDw1fKZ1wvhD/YxIkKjpXt9OGyB+TGvyDK/1hyI44hYo6HrsaRsC/kMXrRnFdVQs6Ob6Os673yhgY7/f+n/M63i7pYL96xBkF9cT/fjvs9fl0H05l2JUJfpBV3sB4peNTMNqajEOWm10cpLN2+eKMDEoEwN/0LywInIL8/ghBRvuxOB6fxEJtlRMeLdKBaoAlnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jp4jPiGP0iEltHWMAQ9JMt6/brgiUlvMi5cplSzoXqQ=;
 b=STJScPf2tsIm3eod4E0YL9qA5RjdR5wp8rPyNyMwGm6mH6W7B1Hrlf2U/CJvkLAzzgpLm/M27LUCpeUJ0Kceg6NZkBtBg7Py1dQB+hdqCKTd2Ka7bccH0U6aKGf2Q77d2qgyexzlCSCPlvqPNdKsDe7Fxz+TIc3beKEW6DjXLPHvtt/FKWvvTh8Yvqi9B4AvfcgBJLRhQLxVGuSoAtnwscnzyZSNlq3WgDO5EiNl2bMwalVZn/de55mtoZWr4jwRrvrNHhSFajD/MpbWtp0ygYukBHYDFbSw9AxOguTc+9IHqgmj2S64seWGREA16WeKbydDsoaToCL+KzYOBu3FSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by IA0PR11MB8336.namprd11.prod.outlook.com (2603:10b6:208:490::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 21:24:26 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::c91d:6ffc:c1a5:8c5d]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::c91d:6ffc:c1a5:8c5d%6]) with mapi id 15.20.6411.025; Mon, 22 May 2023
 21:24:26 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: [GIT PULL] PECI fixes for v6.4
Thread-Topic: [GIT PULL] PECI fixes for v6.4
Thread-Index: AQHZjPPJ5i7UoODNFEO5sN2db5uHlg==
Date: Mon, 22 May 2023 21:24:26 +0000
Message-ID: <f8506bf66b8bdaa85b5a2bec48bcdcc6a2853da7.camel@intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5823:EE_|IA0PR11MB8336:EE_
x-ms-office365-filtering-correlation-id: 3b53d8ba-c4ab-44ef-f002-08db5b0aeb91
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iUfuoO4LrmauSfHvGrdtlK0r/j0L0eq3U1g/1bHidSESjV5cjvD6WhWhkOZzearhQ7I4bNvjOQfhE8kFv35zSXXXd7Tiw8SFSzz8QAp+33YaghXPIxhVYYjgSQ4qheBMiHRrJ5h179sgLgxzosMyKgWtNNuVzeSlXk+xYyaxJLtECJfudV3n4BWMpJUgyvHUat2ppPzt37awV5gkuycLOMI4BbaDo+QAnHTlTtwAX0Nt9avLSl3iNOV35uX37QuJP5LfSZhq2pjY6S1HmHMufikgVnwEEIIIF8q+kuq/L2yGHhp78glVx1lCD0SEDLExli2NxdVCSs1dy0HI0SnjNcdXD/GDqFZoJCMAvrmg5G3lw0nFUx7wkNs6gxskwOCRxhHsH1kCd3akI0BQL96YWcrEX/vpyV8yiooAqLytmYAmrUDStrAOJxc+1iJLCOQ6JBgEDyV+XzMzxBp2KVqhyLFdB1Z+pSLuxWmJfBhYnY0ccL8+j3j2FdZy8+7CTkbpvflcFcJ/tpGr4fFVY8d6iMH4BSWOrFg4qo0EbXjLLdRGBw202XM/amO2ki57z8G1cChfEXkgjSAo+VQ9ThQi022cCtM3FQrG07FI5bNIe0Ie2wBfKIKtmRN+V+Gs5n1r
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5823.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(39860400002)(136003)(346002)(366004)(451199021)(2906002)(4744005)(71200400001)(38100700002)(122000001)(2616005)(8676002)(6506007)(26005)(83380400001)(6512007)(186003)(8936002)(36756003)(86362001)(316002)(4326008)(41300700001)(5660300002)(6486002)(6916009)(82960400001)(38070700005)(91956017)(66476007)(76116006)(66556008)(54906003)(66946007)(478600001)(64756008)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmVGbWpQS3ZOemVuQjk0UXFsUWx2ZThRT0pLL1N1azRwckJNc09nYTlHYXVi?=
 =?utf-8?B?Y3p0MTVTSitmdWMxS3lQRFB2MzY4STFvT2dOanRwMHlwaUVIUnJ3NUhVZGoz?=
 =?utf-8?B?Rmk2NWxqZGFYWWFoUEtocEJZNFNqV1RMZTFtQWk1MXdwVDViR0NPYkRSRFpO?=
 =?utf-8?B?VmJhRENiL2U5ZlFBUUNvWEJ3eDNvbDRWVFFGN0Y0SGViOWJTdkRDWnpDTFda?=
 =?utf-8?B?cDRyZFBZNlpTVWE3WTJvbUVkRVJrdU84bWlERnpaNC83cXgvWmQ3SGhGR1ZN?=
 =?utf-8?B?ZXBydk9OWFJwYkFNQUdsaVozZE1pU255Z0FLUi9vNEZHc1ZDeEF4cE9XWVBp?=
 =?utf-8?B?bXVtOWFrVXdHS2VxaUpNd2JzR05DZ1hoLyszRlZlcVNmU3NEY2p3S1FQYnpX?=
 =?utf-8?B?RWZOY0VjbGtzWDQ0T1BSUWdpV3g1OXl4TzV1akhqZUJhVnhmWTdCbXBJMk1H?=
 =?utf-8?B?blJSY2tkdm9mMUVxR0lnQUE3Z2F2OCtDME1aNE5tRUJ5Z0NLMTdOSC9CeXdQ?=
 =?utf-8?B?N2dZZnpHc0d1VkgyMlpHU1VFOUo1TTBCUmFKOGYxdDcxeWVob285dHNDQzd1?=
 =?utf-8?B?MnBWcTRiN0JjVnVKazlRY3lWbWlSUEVoZzNTUjVvNmRWM2J6NDI5dkVabFUw?=
 =?utf-8?B?anBBVVhJR2UvcU81dG1FNU1oOTVVZUhzME9ERnhlSG9VYzZvdmxrQzJWVDds?=
 =?utf-8?B?TTVWSmE5Vi9HQWc0UWMwaE5OY1VVd3NrY29zYThub0RXM1RUeHRzTXNZWlo0?=
 =?utf-8?B?QnNpRkp2UzBDUWk2YTkzZjU4SWZvdlNKZVU5aUo4am9WRUlVZVZnTDIvQ3Nt?=
 =?utf-8?B?bXBBSDRNdDc1RmJoL0FRTHNTVkFhSHJCRE1sL3R4NVk2RzNkZmFuVXFQRE5I?=
 =?utf-8?B?dkppWHZ1MWduUEFjTk1xRk5wMHdiTFptZHN1aHg4KzF1NU1QOW8wUHEyalVF?=
 =?utf-8?B?bkVrK1o4b1ZxU24vNW5OTVVJaGtuOEZvMGZXUHgvc3ppVEIrNVdzeGhrOGVL?=
 =?utf-8?B?SlAzTXF3dkxnMVRheTZFV2FUYmVydUZjU1M0YmJCSDFURWRYMG5FRDc1UEdC?=
 =?utf-8?B?NUcrTFBZeCs3bEFGQUE4TkdIVHMwT1k2TjdWc0QyRVkybksrejRkTHpGWWV3?=
 =?utf-8?B?R1NuZnlPT1RSU1RpcmthMUNXdnQxUmhrWm5KN0JONjcyTEh0aS8xMHI4OXZ0?=
 =?utf-8?B?bnY1SE45OFp4c0JRNktNeGNrdjNrZzRGRUxwZFcydFRIcW5PZzF6dE5leUxu?=
 =?utf-8?B?M2JrL1MwTHBQVC9hWFV4Q3ZHclVOSW8vMUF5SkNCbktPZFVQL3dad0tleVcw?=
 =?utf-8?B?MmQ4a1NQTzZUOGY1dG5pVGNuR2FjQlpUcHhiWklxMVpzRVFVRDcwZ0htd1dR?=
 =?utf-8?B?NGpUcGs4S09JQWp5VUhFWklBQnVnU1h3YW9BekJQbmMrdGtybmJjdEliVDNF?=
 =?utf-8?B?UElMUHBVeU54MEZqN0N3OWZRcFU5Mm1tdHZSSFozVXp2ODNqb1p5elJoOXZs?=
 =?utf-8?B?KyswTHdWNWtIT05SdEhXZHJZZzhWUFBKZlJrUGI3b3MzOWhBQW9udDRlekto?=
 =?utf-8?B?eWVaNEU1VUY5OGpEeDYvaDlPY2hzMnVNazJmdi9CUEJWeUJubnpjY2pHQWRS?=
 =?utf-8?B?aEU2dHVrcFlpUW5UQmhUdVd1bEh4SVBobnU2QlQ5TjY1S2NjY2hwZzloT0c5?=
 =?utf-8?B?ZWhteWhMMXp2VzNHd2duejYwd09mQmF4VHcycmJKbzgvVXdvOExxTDkxVlUx?=
 =?utf-8?B?Tk1TbzBISHkydWRkZjBOeUh0UlMyc0h5eDVKQXdFdkVzKy9ua2piaVp3RFhZ?=
 =?utf-8?B?WFNwRlo5KzgxempJY3pTcW8xZEZ6SmlGUW1qdWN1YlowTVczMjIzOUgxcHhX?=
 =?utf-8?B?ZUxCTFBGU1pTOWpZYlNUc09PUDBYL2N3VjFWOWhCaFI1UGNKSmZTNUp4YTFj?=
 =?utf-8?B?QlBRK0RuYmQ4MVFhZDJrT0dISnB4K2ZHZjBuTUdiTjhiS2RSTHkvRDkwdm9K?=
 =?utf-8?B?UnM4N0lENXJ1akxuMk5qL0tZSWZHZVBERVg1SUQrdUE5b1Q0OGpFNlhqOEtv?=
 =?utf-8?B?MUViZEdQakxLZ0EyYXJoT3p3Tzh3S3lYOTFIenowVzVVUDIyZ3NhN2h0Ri96?=
 =?utf-8?B?MjRuQTVaTThLMjJkZDZLMXBCeUN6WkRnMWpJQ0tzT1JGRTd3WGZYTWJVTkI5?=
 =?utf-8?B?aGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E792B81B2AF2748AC1BB8F9E0256391@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b53d8ba-c4ab-44ef-f002-08db5b0aeb91
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2023 21:24:26.2660
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QI6DQeuNuwdTOwKhMM11whXBdMYrm1Zzch/h1FKiZWTgy5Ib68wzUA3zzxVJZ2c3xvlnQt1MhjxHaMfGaRT/bEi/07uxzhKtZPZevnz4IPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8336
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgR3JlZywNCg0KcGxlYXNlIHB1bGwgUEVDSSB1cGRhdGUgZm9yIExpbnV4IHY2LjQuDQoNClRo
YW5rcw0KLUl3b25hDQoNClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgYzIxYzBm
OWEyMGE5NjNmNWExODc0NjU3YTRlM2Q2NTc1MDNmNzgxNToNCg0KICBCaW5kZXI6IEFkZCBhc3lu
YyBmcm9tIHRvIHRyYW5zYWN0aW9uIHJlY29yZCAoMjAyMy0wNS0xMyAyMDozODoxMiArMDkwMCkN
Cg0KYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6DQoNCiAgZ2l0Oi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2l3aS9saW51eC5naXQgdGFncy9w
ZWNpLWZpeGVzLTYuNA0KDQpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gODQ5YjM5MTI1
NGJmNjQ3OTY2NTU4NjhkYmI2ZGVlMjM1NTFmZjdkMzoNCg0KICBwZWNpOiBDb25zdGlmeSBzdHJ1
Y3QgcGVjaV9jb250cm9sbGVyX29wcyAoMjAyMy0wNS0yMiAyMjoxNjoxNiArMDIwMCkNCg0KLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQ0KUEVDSSBmaXhlcyBmb3IgdjYuNA0KDQpBIHNtYWxsIGNoYW5nZSB0byBtYXJrIHBlY2lf
Y29udHJvbGxlcl9vcHMgYXMgY29uc3QuDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NClpldiBXZWlzcyAoMSk6DQogICAg
ICBwZWNpOiBDb25zdGlmeSBzdHJ1Y3QgcGVjaV9jb250cm9sbGVyX29wcw0KDQogZHJpdmVycy9w
ZWNpL2NvbnRyb2xsZXIvcGVjaS1hc3BlZWQuYyB8IDIgKy0NCiBkcml2ZXJzL3BlY2kvY29yZS5j
ICAgICAgICAgICAgICAgICAgIHwgNCArKy0tDQogaW5jbHVkZS9saW51eC9wZWNpLmggICAgICAg
ICAgICAgICAgICB8IDQgKystLQ0KIDMgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQ0K
