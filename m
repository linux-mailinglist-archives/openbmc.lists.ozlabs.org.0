Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E79A7195B4
	for <lists+openbmc@lfdr.de>; Thu,  1 Jun 2023 10:36:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWzxZ5SGFz3dwB
	for <lists+openbmc@lfdr.de>; Thu,  1 Jun 2023 18:36:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f3JSegvc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f3JSegvc;
	dkim-atps=neutral
X-Greylist: delayed 65 seconds by postgrey-1.36 at boromir; Thu, 01 Jun 2023 18:35:45 AEST
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWzwx0qFdz3cR7
	for <openbmc@lists.ozlabs.org>; Thu,  1 Jun 2023 18:35:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685608545; x=1717144545;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Dw4/JMP5fmj5cSyenQZaj/+2G4vt7MLin7aH992MCQ0=;
  b=f3JSegvcai0LZHf1Yosg+zipY54p9iNTG5SuuO8cBKcLuQQNmkfm84SC
   ldlVkVHGD0tkOyaWRpKm4MQBDI0s4oLzp7DJVQMbznWAolPU/9S1M7KJK
   Qn/dPBmOzXM6ipCOeykAPBVA236kJcFQiTAWniYm0oX0ayzzB61xaT0qP
   VrXn2vDcX3lG3qxKN/Ihm6jeIQcHEv0xgHXzWyGkx5OyAI6KwtCGALP6m
   lFg9o7BPV88TbRNcaLm8sLJcTIQrgkJODEU9BPvq2JOTPKVeHGLwNPb/k
   h6C5PWIp3LWP8wipuZCzL7SfaI6OidpJz5LuRRDZKN5XGHIJk+Flefmo9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="441856382"
X-IronPort-AV: E=Sophos;i="6.00,209,1681196400"; 
   d="scan'208";a="441856382"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 01:34:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="710398505"
X-IronPort-AV: E=Sophos;i="6.00,209,1681196400"; 
   d="scan'208";a="710398505"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga007.fm.intel.com with ESMTP; 01 Jun 2023 01:34:24 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 01:34:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 01:34:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 1 Jun 2023 01:34:22 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 1 Jun 2023 01:34:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cy5GdZ41cIOkawl6MI/sov+GNprfX99M/XNHxRIU+1U8omo4AlC/ezcFhQ8lWH2cZMTRNfyEcztyKsHNqrdyGYqo8xJ9Q2F311ElZ8LH/oeIZmqlPBLERijIax+lthhJpPYnIbwQ1ji8NY39MEH0+LI8Mu58GIj4jZdQaR1oFcP/piItUOpdE5fNYJbAeJ3i9gk7acQUe0fwd2Ha1pcZ1QInYyf5fJ90IXtkednismkX7xR38hT6maqZqcuiVIx5r85XO6KPYQTqvYOtkkHMZ7MhTOKQryUmng4A+fwGN7VqfhCypmFH3YissmUG235VIqbXSHjZIY5fjE/hVtExGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dw4/JMP5fmj5cSyenQZaj/+2G4vt7MLin7aH992MCQ0=;
 b=LSGB8ORWMWE/4PylKtrNjWtgc43ULlTm9lcuDa6RTUje7QrS4MsFQYLhgO1hwcvIbfRdPrcJwr6XNEAoPdqqzKi9aFlq2v/JJS46zlndSIv56pG0/teZoyocjqKaixNlWNmOVPE4MuRFDE9qZ5fuNDaDBByYYXgqofveVJMvMhmm5UUfyCIaZ/Bunqeckl0utqJQQcoZyca2j7ygYM8q1hdQu4nr8BB/3uzEWbSpykDnQpfH4vGKaX5YIsKWG/DDObEbmUOGIBqFqjCFFqWXcGX4g4SWeDgf9qR6m3PVBapvu4KQiGqUWWEKyq8MpBIWCapaS9VrfGSSMDdFzGzXGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by CO1PR11MB4801.namprd11.prod.outlook.com (2603:10b6:303:9c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Thu, 1 Jun
 2023 08:34:21 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::67e5:1ba2:5837:339e]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::67e5:1ba2:5837:339e%4]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 08:34:21 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: [GIT PULL] PECI fixes for v6.4
Thread-Topic: [GIT PULL] PECI fixes for v6.4
Thread-Index: AQHZjPPJ5i7UoODNFEO5sN2db5uHlq9xUBWAgARduoA=
Date: Thu, 1 Jun 2023 08:34:21 +0000
Message-ID: <1693fe7002af39c4efc899a6e60dbafc906d6b25.camel@intel.com>
References: <f8506bf66b8bdaa85b5a2bec48bcdcc6a2853da7.camel@intel.com>
	 <2023052904-platypus-mower-0e01@gregkh>
In-Reply-To: <2023052904-platypus-mower-0e01@gregkh>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5823:EE_|CO1PR11MB4801:EE_
x-ms-office365-filtering-correlation-id: a5206099-2edf-4c01-b9c2-08db627aff98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /zOg2jABR+jRAGpeLaKy4Mosu56wqKqjWWWIYiTHm20/8LIzeYs9oCCVE2tUcP/46b27y6xRsb6Vdx1AbUWjY1IwuBCsCdL/JGB0JTLryM0rwTFUPVQGG9k5WSeHpVJAmhFy47Iu4ALOxOWGtsCAewVbSUVtVU8XgjyiDOviJTQzqIt8dryFwC/okIchvb3C5qIcMJnaAwBCuVw4gaGlvShqF1ncs1eUgH5BwqiSA1aQSTEr4BGe/eJu0YMrDMe5UJ5fjF1JnwHXbuZ3htvzXXxqSAcd95dsnsbOJRX0IlUZqx6eSsa2bdGnwMFBpMQLm0dZwx5NyV/FFIwsYqciKMUQWzzwbRPqoZpKK9EbFSyjPQqzzC3qDKx8+Wz1Ek2iBw0pseBJW9RTASpfSS/Il8wxYnDXQ8IJUH5Tz1wTsVOgtlOJgm9RgX8vIWTBcVldRCM/Up+8aJOwgD18i3g6ywfF26wCUJOTxymNCd7+Eez2TN5G6KFDx/PY/6eZ06H9/m5/d9E9cQCA5wBSeJRuBU0W9p9EFHHgH6fRXlu1EWrV3ioas3B4br7NCXG346gCwB8UOtmNpLVjJ4U+/Ej9/WEoTMjLSc7px1dE597VfIFZXkb4lcfmAYi7e6mVhR7u
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5823.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(346002)(376002)(39860400002)(396003)(451199021)(54906003)(38070700005)(66446008)(26005)(6506007)(91956017)(83380400001)(122000001)(4326008)(2616005)(86362001)(316002)(6512007)(66946007)(6916009)(82960400001)(478600001)(66476007)(64756008)(66556008)(2906002)(76116006)(41300700001)(5660300002)(71200400001)(186003)(6486002)(38100700002)(8676002)(8936002)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K09mZnB3WTlJeEV3dVRncHlHYWd1NmQxL1M1RHpBY1pSVkYwWHBmRTI1aG5w?=
 =?utf-8?B?RTRNZzZvem5ORklVSGhWOXVJK0c2ZEhSaTh6YU1uNm1FRnQxV2M4RVhGcGtO?=
 =?utf-8?B?R3ZHVW5FdFRUQ0ExQkhOVWxXNWtodjhXM0R1YklRVWl2Y0JxZzR4WExwR2Np?=
 =?utf-8?B?cmxGck1sb3VSaXhxM056ZFRqL25uZjhSRHA2UTBqYUN3VllwMzJYNVI4UTF3?=
 =?utf-8?B?UUI2bis1Q1ZlMTAxdktNeklyUnI5Y1gwd0VLd2pRSGNyZVJDMmJRYWRTQnQx?=
 =?utf-8?B?Rnk1RTgyMkNycUdFMjZvTlFYbGJXKzdYTzA2YVc3WTNPUkcxR3V1WVd4M054?=
 =?utf-8?B?Mk41TGk1RGlXSWdIZnYwbG9EdjkxSjFLR0hVem9YOTJtelkweFRPZmNQcUZj?=
 =?utf-8?B?T0t5K0NjTGVmb0dzUlFjb3pzcXpyZkZBcWZRQ3RSVG8vRmc3a0FneW93WHBF?=
 =?utf-8?B?L1N6YW9BY2tvbzlzcEZNSHdTb21GcDdRRGtEUzc1VlppR25sYnlsTUdRVFJn?=
 =?utf-8?B?UVF3SnAwR0pMQit6aU1EbmlCcElHeWdzb1ZwT0pBM2lDK3orVDVTQm1NdUM4?=
 =?utf-8?B?KzNYMEMwMDQreG1iRmZ3Z0NSWTgxbFM3VTJQei94WmFHYTJScHdGQWRlc2lI?=
 =?utf-8?B?YUZhYkNpL1JyWjhrZkJ6Ty9mSG9UWi9mdHlkci9KMzA3YWM0eC9ENU9ZaFpi?=
 =?utf-8?B?YUI3MjdCU3phTDhSVFovcWpkcnVOeEhQL2VLYlgwdjI1eHpCamg4MHJQUTUv?=
 =?utf-8?B?VHBuVnBIaS9aWXpvemRVRjdTMmNTYVNIcDljdHRRT0xYSDR1ZDZUb2pST3FW?=
 =?utf-8?B?ZHBNdWtCa2N0S0ZxaVdUNEJsZ0lqMlVITUhnS2h1cytKVGdrbmRUQXM0MzI1?=
 =?utf-8?B?WncrOHByU05JZFBOakZ6YkRRT0tpNFhQK2l2dmVwOHNSK2F3a09WN1hVVVp0?=
 =?utf-8?B?eWpicG1QOSsvcmFLWkNRQVRSdWFsUmJPSVpFMGJaZWJaUzVUMU9xcjlOMGhq?=
 =?utf-8?B?d0NIK3hWcWJCaTZadXBmZXZ0Y3ZTeHlLRzhxaEc2SVMyZGY2alMxMlJuYkNp?=
 =?utf-8?B?dEJhOFBselpmM1FvcUI1OU96MXZRUGg2N0c2dWxuMDh1dGJtV0VWL0VOSnk1?=
 =?utf-8?B?NzVWRTVpbFBYMTd0UHdOYUl6bW92Vjdjc2l5WVEyODdHZXJPS2N3UDZkQ3dI?=
 =?utf-8?B?WnpFTzM2UGJTa1BtYVFSUlJ3cTVmMjRlWkRHNGlucThVYmlEaW4zT3FwdVRs?=
 =?utf-8?B?YTZJb214UGF1d2hJVGg4bmFvNWRnKzBvUXF1RkY4SzNWTTU4S21URjk0MFdY?=
 =?utf-8?B?WVo1N1A3RjdTTG93UTFBMS9POTNMeFZNeUtwcHBEcnBtRXk1eEJDNVhQczRt?=
 =?utf-8?B?MUFLQTRnTHR3L0dGSm8vQUZEUHJUNXhhZm0yVWxyVFNEb0R2UXVEcHVyQmgx?=
 =?utf-8?B?VmRkZGl6a3kzSmxNRFZmNWN2UWFXemF0d0V5M2Z3b1NkYS9sVmNHM3FwUXl4?=
 =?utf-8?B?MU9FOFBhWGt0aXNDaTU5TSs0TDkzQ0FXSjNCdUlucWtSODNGMksrczBNaU1Z?=
 =?utf-8?B?bTlvVnBVQ08xN2RERVpWeFJOZ2ZBZmFjNHNlQ2JoU3hnaERiK2oxemV5UU9M?=
 =?utf-8?B?NTBDZlpFTEJsNkN1V29hU0d3VUtBeFRNSXBoTWd2Vy9hamZONEs4VnFQaUFO?=
 =?utf-8?B?Yk9iRjVsbEw2Z0trOTV5OGo5QTh1bXdscXhrNXJBVzVsNjJuL3dHQXlpaVJi?=
 =?utf-8?B?YkM5alkzNWdIZ0pTclplTFNLY3p3NWNQMS8xZHZDQk82S2FGdEJsQVZCTVIy?=
 =?utf-8?B?Rm5mTDRPbThPVXdTRFZldlhoY1dVK0Jmek9PNysvZ05NL3BYeDZGamJMcU5u?=
 =?utf-8?B?azY2enp2d0RtTWtVbVU4NzJOWjVzNVpiQ1FmanA4Yi9aWUlUVHlpdU1uV2gy?=
 =?utf-8?B?TVdFOTlCUjVlVXlVQnhvdWRNZHJmMEt6RFpoSXozSU5HZGtPV3ZXRHUyblRt?=
 =?utf-8?B?N3FQQkZMbUhkbTlsb1FKZEdhczdxMDliWC90RVdNbTZsWFMrNU5adS9Nb000?=
 =?utf-8?B?WXJDbHZ2OXVWa1NnOGZPQmZKbjRsb3BaSlpmRStudHZyYkhIVU1tZ2xaWkx0?=
 =?utf-8?B?ZFhtM2wybkdveUhOdlFISElObFNtUmdFa1VQeExkaVVxOHlYd0l5dDAzWnpI?=
 =?utf-8?B?VXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <71BD1E81D1CCD5468FBDAD2FE6CD1F74@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5206099-2edf-4c01-b9c2-08db627aff98
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2023 08:34:21.6411
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eL1IHvIs7L8uHlrpNLmB5G9vUx4RkS91VCsQPLklrNC0zM+4xMIC1mnTHycNqM/wrRYP9Hxw+QQ5M4moR45wsG943KtFqUahyabrm+jmk1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4801
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

T24gTW9uLCAyMDIzLTA1LTI5IGF0IDE0OjUzICswMTAwLCBncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZyB3cm90ZToNCj4gT24gTW9uLCBNYXkgMjIsIDIwMjMgYXQgMDk6MjQ6MjZQTSArMDAwMCwg
V2luaWFyc2thLCBJd29uYSB3cm90ZToNCj4gPiBIaSBHcmVnLA0KPiA+IA0KPiA+IHBsZWFzZSBw
dWxsIFBFQ0kgdXBkYXRlIGZvciBMaW51eCB2Ni40Lg0KPiA+IA0KPiA+IFRoYW5rcw0KPiA+IC1J
d29uYQ0KPiA+IA0KPiA+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgYzIxYzBm
OWEyMGE5NjNmNWExODc0NjU3YTRlM2Q2NTc1MDNmNzgxNToNCj4gPiANCj4gPiDCoCBCaW5kZXI6
IEFkZCBhc3luYyBmcm9tIHRvIHRyYW5zYWN0aW9uIHJlY29yZCAoMjAyMy0wNS0xMyAyMDozODox
MiArMDkwMCkNCj4gPiANCj4gPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBh
dDoNCj4gPiANCj4gPiDCoCBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvaXdpL2xpbnV4LmdpdCB0YWdzL3BlY2ktDQo+ID4gZml4ZXMtNi40DQo+IA0KPiBUaGlz
IGluY2x1ZGVzIHNvbWUgcmFuZG9tIEJpbmRlciBjaGFuZ2VzIHRoYXQgZG8gbm90IGJlbG9uZyBp
biBteQ0KPiBjaGFyLW1pc2MtbGludXMgYnJhbmNoIHJpZ2h0IG5vdyBmb3IgNi40LWZpbmFsDQoN
ClNvcnJ5IC0gSSBiYXNlZCBpdCBvbiBjaGFyLW1pc2MtdGVzdGluZyAvIGNoYXItbWlzYy1uZXh0
Lg0KDQo+IA0KPiA+IA0KPiA+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA4NDliMzkx
MjU0YmY2NDc5NjY1NTg2OGRiYjZkZWUyMzU1MWZmN2QzOg0KPiA+IA0KPiA+IMKgIHBlY2k6IENv
bnN0aWZ5IHN0cnVjdCBwZWNpX2NvbnRyb2xsZXJfb3BzICgyMDIzLTA1LTIyIDIyOjE2OjE2ICsw
MjAwKQ0KPiANCj4gV2h5IGlzIHRoaXMgYSBidWdmaXggdGhhdCBuZWVkcyB0byBnZXQgbWVyZ2Vk
IG5vdz/CoCBTaG91bGRuJ3QgdGhpcyBiZQ0KPiBmb3IgNi41LXJjMT8NCg0KSXQncyBhIHNtYWxs
IGZpeCAtIGl0IGNhbiB3YWl0IGZvciA2LjUtcmMxLg0KDQpUaGFua3MNCi1Jd29uYQ0KDQo+IA0K
PiB0aGFua3MsDQo+IA0KPiBncmVnIGstaA0KDQo=
