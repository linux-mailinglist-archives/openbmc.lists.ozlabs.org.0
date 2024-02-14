Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4342A854AEF
	for <lists+openbmc@lfdr.de>; Wed, 14 Feb 2024 15:00:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jA6ImKPm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZfwV51c5z309c
	for <lists+openbmc@lfdr.de>; Thu, 15 Feb 2024 01:00:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jA6ImKPm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Thu, 15 Feb 2024 00:59:55 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZfvv3yD8z301f
	for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2024 00:59:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707919196; x=1739455196;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=phSNc0faDrBoyP/i1YwiMkmBKXEG57VvjB8ILW3xp7A=;
  b=jA6ImKPmnLnxy8fz3qWaIuHqGJvqnN6lAAGGPQwcx9aTtRfoAWqJ+9ZR
   zqWgq+MtU+DlvZPi8MsD8wkRmSoNWkspnxmxEzNlYt4Q5eaCshzqnp37h
   JBsgPn9Ur2RMsm4rbxmSWCP0Wy1YywFU94cHBmD5PNhFCAGzSwBdoKw8i
   7WZDLPwxuQUpqkCsVbFigrGAaNALZggrOAvCp2Qj3BDFS9SsnjBQL0Uzo
   xHOWtWosrcLIZ2ITkQqcJQSKxTeFSvItB7JzDZymxXCMjQjlB/dP6J3fs
   bcc9ZbELAm6xmLXpedFiy+4XWEOku1hFG07efwR/agYHTes3ogNssIft1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="2341767"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="2341767"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 05:58:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="26365698"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Feb 2024 05:58:45 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 05:58:44 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 14 Feb 2024 05:58:44 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 14 Feb 2024 05:58:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=afrCj/EddNDetdG5ncE4BWF+CfQg/mOIBAkVATN860DfOy0HvvZ+7Lb1hASNVfdOnC3ulvtPzMaJTZMvo6IuOJ4jCPWqjpWC+pkxuPXlBNH/enw2KmEFucvLkAw6xvOpzoqOMUs0Qv2Yz3mQxCvTPAEUEv733ZMum78OMhT9iXTD5IHoOLI0zaZFFxsFkIlBUQ2Vsz6WtM2Zn2+G1hALWhE8Ade8ovEK6jdRGw4aFksSTqEdcrTEJzzWgrmihFsHFOLaOnkhYH0PQDIkbrRt8xR98bf/tGkZfOyqbV97RRVJzip1BX3gCKk6Yv6GK/WEJ5j533rSUu8qOpBNqAEQhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=phSNc0faDrBoyP/i1YwiMkmBKXEG57VvjB8ILW3xp7A=;
 b=b4AWv/ilgvv0eWngbdM/4U+TY04QPqSlutfoMstuAjnZbOICiubZze0l1JUIRcAL/IDNsriJb4EkA7lMqK67a7BzxWwU3fL0ecMIg2lcJlje9Up3vlTKR9z4jGMLZvQsFDxhteTy7cbojyw4iubngo/mxyxwisd0Ss/SpozUBexG45szQSS4LM4ixc/V9be6s37eS2QQfsrt4IukT6RBfJIWBx+X4voiUCX/f4Clv+26JlLbfgHIB+c+biPi0ffNufdA4rADsZEyAlXiypGlELtjxHffYmSnxnFic1kpDhUGmH7gBhj1WoqHAuuzDpkyqp1dKw/OWI7zlhEdy/S9xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5330.namprd11.prod.outlook.com (2603:10b6:610:bd::7)
 by MN0PR11MB6301.namprd11.prod.outlook.com (2603:10b6:208:3c3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Wed, 14 Feb
 2024 13:58:42 +0000
Received: from CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::b08e:2300:aa47:da47]) by CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::b08e:2300:aa47:da47%4]) with mapi id 15.20.7270.036; Wed, 14 Feb 2024
 13:58:42 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "ricardo@marliere.net" <ricardo@marliere.net>
Subject: Re: [PATCH] peci: Make peci_bus_type const
Thread-Topic: [PATCH] peci: Make peci_bus_type const
Thread-Index: AQHaXDPneP6i/dQPEE6nWkpj+VQ1IbEJ42sA
Date: Wed, 14 Feb 2024 13:58:42 +0000
Message-ID: <fd2d505396378941784331ebb24f56b5dd839653.camel@intel.com>
References: <20240210-bus_cleanup-peci-v1-1-1e64bef6efc0@marliere.net>
In-Reply-To: <20240210-bus_cleanup-peci-v1-1-1e64bef6efc0@marliere.net>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.2 (3.50.2-1.fc39) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5330:EE_|MN0PR11MB6301:EE_
x-ms-office365-filtering-correlation-id: dea4caa8-0f9b-430f-c37e-08dc2d650da0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0356zg2NN0NLA/MbDHrVacVsICjhf7XL5wZiz0Lb5xVUM8s+TkbEY/6g1TUjvTX081EX1KtZt0yP8RBv9p6Ogs1b+TiLeJOst/j18ysLIGydOuVmK4i4Acq3q2wOTkESkDfMtX1zrlFtLgrd/XMl0qj9QB3pv/yLTShlbTxEaZIJv6SOfpwlLx7egAOPvnycQ4fHaXNDK/tKB7HjJq6JNCncgh7ogap6t1EEA0Ap0QaAe66E948puivjc04SHXjXl2j9RXTwaOQRzBr8CQIfSHbkIkVt21DzRH38+dUHdrpN4cONYm410ZgL6Q9DuNN0IH3qRkwKuWOIEKNv8vAWRTV/29y0794GJKCL9Ux/Ib219odNIkMO9Trxe1X8ZVPSH9MSpFzwKAFjzLZxhh5YowgILdcInHyA4K3P38R29onTgH/UGR33+UmZJU182lIJNEInR7k7SsYTQ/xgyXWWk2+fP7vHSEdf4FytY0lxN/c3TLYypVU7TFNlgSW7K1MqWNde5Tz4+LhwihlAtFHKJwA07/q0KJ/TY4L01OqcyK9AZGHkb7iJ2TVrx+WCkrIIDasCxibCZEL1HKPyoF+lHIGVGyotbdSOtN32G21FdLyxVL/QhToybs8veo6N6Sk9
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5330.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(2906002)(4326008)(8936002)(41300700001)(8676002)(5660300002)(82960400001)(86362001)(83380400001)(38070700009)(76116006)(36756003)(66446008)(2616005)(26005)(66476007)(71200400001)(66556008)(66946007)(6486002)(316002)(38100700002)(6506007)(122000001)(54906003)(478600001)(6916009)(64756008)(6512007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M2Jnbi8veTBjVzYwb2pQNUR5b0ZnemEzRWlDLzVnS2Exb1ZVV2JNbi9WTnY3?=
 =?utf-8?B?dUVzR1RrOHRCYUtGdjkwMk1MemZycFluSC9oNU5sU0tiaFVJdlVnWUxZT3BR?=
 =?utf-8?B?VUhmRVFzZUsxRWtSVEVtUkcrYnFER2hTY3kxVVVXZ1A0WGl2QWtzTjZiUUpy?=
 =?utf-8?B?OUIxYUwzNkdWUE1WbWoyTzVEb2RVbWJGNWg5OS9CcDJOQ1drOERUZWtxN0lr?=
 =?utf-8?B?ck9acHF1SEUreUhtVi96RVhqOHc5RWQrZTlha1N2N1ljN1JkVlhJcHV1M3ZM?=
 =?utf-8?B?U1JUbTlLTUlTalBETzhUd2xaaUlWYnhRcXpvT1d5T2hRTHJUQjR2KzdZaFVr?=
 =?utf-8?B?ZVp3a0dTSW8zQ0RMSUllN1BRQ0hnSDBERWJNWEFraGFUWUxZMlFSdjJhZSts?=
 =?utf-8?B?bm5vNHdnOWR1K3YyZ1d3Zm5hWmdDeExqdmNXT0hPcWpaQi9xWnZmQk03RkZP?=
 =?utf-8?B?VEFYeVM2Mm91OFB1V1RRVUtCQW9lb2ZvRll6Nm1OUGNTVkNnUkhmdmlYMjg3?=
 =?utf-8?B?WmhHclVLUUQ2N0ZGdEl5bFg4cjNYMkpPRVUvN2YwQi9QenZIY1pNNlYwR3ow?=
 =?utf-8?B?SEF6aUxHKzNHczFZcGl0c3BuTWlySmF5MEdGaUZvUFVzb0pNb2ljMGgzWldu?=
 =?utf-8?B?MzdDVTdTZXIyaWpoVTVaZnRNT2M3Ym1Wam9wS3JtU2lwQnh6ckJIVWpvaEJ3?=
 =?utf-8?B?SGlsMUo2VXFMK2RzVW5obWJnTDFWS0lneTB5MmFRb2Joamw2cDNKRU92TGZ3?=
 =?utf-8?B?aEs5THQ3aXlSMWV5bVJXS1dIZk5TVGVxaFU2aUU0NkxlbmtQV1VuZDFUTDFB?=
 =?utf-8?B?Q1dxMWZLTWszcmNVSFV2TURJWDVSS2RrREVXckVWTWI1dHBsbkhKdzJ2V2Jn?=
 =?utf-8?B?QlZtWFBZcGNEMUhnTUZIeHNZV0RsTGdtWkxQNVdXMER0NXVIckFqVzVDRkU4?=
 =?utf-8?B?MnVleml5SGNzUW9ZTGJyT2hhZVZSVEhuR3JZVllWNnhSREVEbEJnSXB4dlN2?=
 =?utf-8?B?MTF1MHpTY1Fja2ZWOFJ2Rk9Scy9NL1prYXp1cnJxK0pjZnltSjRNQ3NYenoz?=
 =?utf-8?B?OXRzUGp6U1l2TXNuNVUrSHF6cW52eTBXZjdOS2hLYTFiRFNFWDAvalgwSFFx?=
 =?utf-8?B?SmYvREppOFRuTGlZOWdwRFlSSG9BQ3U3SjNqTVhqN1VBSHJRdVZyUG1ZVUM3?=
 =?utf-8?B?ZlJacUZPWVJqTmthOVlyV0V4aWJ0Y3JGOVN6bjV1RzRxVnN2ek9CNkZzMUpk?=
 =?utf-8?B?S0pBK0NFYmhMcm9xWXNSNjBHWnRzVkRFaGtMNmRJeG43ZWRZbkt6OTFxcUtO?=
 =?utf-8?B?SGtwMXJPQnFsTXR6b3ViUkFlT3JxVlRDVG9iNS8vdWdnUHpXN05yWlU1d29r?=
 =?utf-8?B?ekRjRlhBNjZSeklrTmlpOHl6MXVGcXZ6S1hySWcxOG1yakhkSTZBU2V4MHFx?=
 =?utf-8?B?MlJZemlObFVJV2ZVL05IZHJValptV1BFK3VNS0dxM0lzeEk4TVNCODZaNDFi?=
 =?utf-8?B?ODRKZ0xDbWFEeWR1WVJXclFkSTJTSmp3K3VnNCt2S2VZODhLYWZLZ2ZodDRB?=
 =?utf-8?B?YkZoTDRJRFdwN29sakNuZ2hmZ1ZhYktrMzZuUU5wOUE4aVBSNU5uRW54TkpN?=
 =?utf-8?B?ekRDSDFOMDJsekFMeGgwMVdySis4amJoWGxXQ3c5KzhFT3NSY3ZtOGhyMU84?=
 =?utf-8?B?ekg3SlU4c2hEMXVWMExYOFZTcmI1M0VWS29lTDE4c0ZHRkk2STgvVm92TWtx?=
 =?utf-8?B?cWVQRzgwL2xwQjg5em5SK3V3TEZjRnNZeHAyVHdUN3kxZEJEODc2Ty9kbDBX?=
 =?utf-8?B?cTkyUDNBRHd0UGRqTUxkcGpGeXA0YkpONlF2bHc0R3hIdllRc3lGUUNKU0hl?=
 =?utf-8?B?VS90UE9vVDgxMDJydVVHaUQzMkpvSlFRWXVFTGNoQ3o0TGZWRzRGeEdTOGpj?=
 =?utf-8?B?dFlZbWwvaWFITjVGTmFwS1NTWVNmcFZsaGxqaFFXQ0E3dmFCYVp3NWY4WmV4?=
 =?utf-8?B?clFwaDVPbXhucDNhMWJOTitqazkwTDJuTkJzMVoyNFdDUnRLb1FjdnlmNzRi?=
 =?utf-8?B?ZzEza3BQTHRFRERiUklhSFRhQ2JBU2NZQWc3YWMwNEVvQVI5NEJDWHA3WUZa?=
 =?utf-8?B?eHlMNnRuZnNyZ1Mzb3Y3eFYweTE4TndBN29nbkNHRGIrbVpPNFZkZkIzc3dp?=
 =?utf-8?B?OFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EFFE35DA1FE2C54D923D47967595B312@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5330.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dea4caa8-0f9b-430f-c37e-08dc2d650da0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2024 13:58:42.2833
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eKZAa6kCJwfz6VUGXJ5j2+n+/imRej1/0cs7mgsrSGxCV1UzmcxTJAXn451B4zmX4DimtPE1MJBVygl5CFhavBfxA3JSaQZQr0M5rrELums=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6301
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gU2F0LCAyMDI0LTAyLTEwIGF0IDEyOjEwIC0wMzAwLCBSaWNhcmRvIEIuIE1hcmxpZXJlIHdy
b3RlOg0KPiBOb3cgdGhhdCB0aGUgZHJpdmVyIGNvcmUgY2FuIHByb3Blcmx5IGhhbmRsZSBjb25z
dGFudCBzdHJ1Y3QgYnVzX3R5cGUsDQo+IG1vdmUgdGhlIHBlY2lfYnVzX3R5cGUgdmFyaWFibGUg
dG8gYmUgYSBjb25zdGFudCBzdHJ1Y3R1cmUgYXMgd2VsbCwNCj4gcGxhY2luZyBpdCBpbnRvIHJl
YWQtb25seSBtZW1vcnkgd2hpY2ggY2FuIG5vdCBiZSBtb2RpZmllZCBhdCBydW50aW1lLg0KPiAN
Cj4gQ2M6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+
IFN1Z2dlc3RlZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZz4NCj4gU2lnbmVkLW9mZi1ieTogUmljYXJkbyBCLiBNYXJsaWVyZSA8cmljYXJkb0BtYXJs
aWVyZS5uZXQ+DQoNClJldmlld2VkLWJ5OiBJd29uYSBXaW5pYXJza2EgPGl3b25hLndpbmlhcnNr
YUBpbnRlbC5jb20+DQoNClRoYW5rcw0KLUl3b25hDQoNCj4gLS0tDQo+IMKgZHJpdmVycy9wZWNp
L2NvcmUuY8KgwqDCoMKgIHwgMiArLQ0KPiDCoGRyaXZlcnMvcGVjaS9pbnRlcm5hbC5oIHwgMiAr
LQ0KPiDCoDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGVjaS9jb3JlLmMgYi9kcml2ZXJzL3BlY2kvY29y
ZS5jDQo+IGluZGV4IDBmODNhOWM2MDkzYi4uYjJmOGRiOTY3ZTliIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL3BlY2kvY29yZS5jDQo+ICsrKyBiL2RyaXZlcnMvcGVjaS9jb3JlLmMNCj4gQEAgLTIw
MSw3ICsyMDEsNyBAQCBzdGF0aWMgdm9pZCBwZWNpX2J1c19kZXZpY2VfcmVtb3ZlKHN0cnVjdCBk
ZXZpY2UgKmRldikNCj4gwqAJCWRyaXZlci0+cmVtb3ZlKGRldmljZSk7DQo+IMKgfQ0KPiDCoA0K
PiAtc3RydWN0IGJ1c190eXBlIHBlY2lfYnVzX3R5cGUgPSB7DQo+ICtjb25zdCBzdHJ1Y3QgYnVz
X3R5cGUgcGVjaV9idXNfdHlwZSA9IHsNCj4gwqAJLm5hbWUJCT0gInBlY2kiLA0KPiDCoAkubWF0
Y2gJCT0gcGVjaV9idXNfZGV2aWNlX21hdGNoLA0KPiDCoAkucHJvYmUJCT0gcGVjaV9idXNfZGV2
aWNlX3Byb2JlLA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wZWNpL2ludGVybmFsLmggYi9kcml2
ZXJzL3BlY2kvaW50ZXJuYWwuaA0KPiBpbmRleCA5ZDc1ZWE1NDUwNGMuLjhhODk2YzI1NmM1ZiAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9wZWNpL2ludGVybmFsLmgNCj4gKysrIGIvZHJpdmVycy9w
ZWNpL2ludGVybmFsLmgNCj4gQEAgLTgxLDcgKzgxLDcgQEAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBh
dHRyaWJ1dGVfZ3JvdXAgKnBlY2lfZGV2aWNlX2dyb3Vwc1tdOw0KPiDCoGludCBwZWNpX2Rldmlj
ZV9jcmVhdGUoc3RydWN0IHBlY2lfY29udHJvbGxlciAqY29udHJvbGxlciwgdTggYWRkcik7DQo+
IMKgdm9pZCBwZWNpX2RldmljZV9kZXN0cm95KHN0cnVjdCBwZWNpX2RldmljZSAqZGV2aWNlKTsN
Cj4gwqANCj4gLWV4dGVybiBzdHJ1Y3QgYnVzX3R5cGUgcGVjaV9idXNfdHlwZTsNCj4gK2V4dGVy
biBjb25zdCBzdHJ1Y3QgYnVzX3R5cGUgcGVjaV9idXNfdHlwZTsNCj4gwqBleHRlcm4gY29uc3Qg
c3RydWN0IGF0dHJpYnV0ZV9ncm91cCAqcGVjaV9idXNfZ3JvdXBzW107DQo+IMKgDQo+IMKgLyoq
DQo+IA0KPiAtLS0NCj4gYmFzZS1jb21taXQ6IDA0NzM3MTk2OGZmYzQ3MDc2OWY1NDFkNjkzM2Uy
NjJkYzcwODU0NTYNCj4gY2hhbmdlLWlkOiAyMDI0MDIxMC1idXNfY2xlYW51cC1wZWNpLTA5MzNj
NjI5ZDU4Yg0KPiANCj4gQmVzdCByZWdhcmRzLA0KDQo=
