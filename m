Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2AE75AF39
	for <lists+openbmc@lfdr.de>; Thu, 20 Jul 2023 15:10:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fCrxqWI/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6CjJ3hHRz3bx3
	for <lists+openbmc@lfdr.de>; Thu, 20 Jul 2023 23:10:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fCrxqWI/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6Chd4R4pz2ykc
	for <openbmc@lists.ozlabs.org>; Thu, 20 Jul 2023 23:09:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689858594; x=1721394594;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=LVDd5U4eT6iWV1ntpQYDoD2WoE2Gg9qcCtbAywlf8Oo=;
  b=fCrxqWI/SQ3mym0FXyhO4Dy5zReyF8AM5UpkRljqEFqUgfLBJyCpH20R
   EZVx+ysyLmLxTRrtUbmgA6MeK0hSzMn2HGil3kFaF78WTC8FI3dpu3EWh
   nlZxJj5AusmLpuFjkPFyva9EuGMVfsc8Nu2HWccyYSzs5u7ayimRgzT3+
   C0OzIzepLj7QYzqm/hKwT4a/oCy/TpSZKQ+XrRIo/A6D3+L73pHzzL/it
   M+zrxG+KxBe/BoWvzZIgAOn3MmxWszbWSaSQGvEBUhW95MyfEPjfy3Uyj
   M7H4iY6ODZLxRKOkaDb5tRyuKkU2CS+lwugvroKB1H4fr1y9M/+9CM1mm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="430494920"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="scan'208";a="430494920"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 06:06:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="794482327"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="scan'208";a="794482327"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga004.fm.intel.com with ESMTP; 20 Jul 2023 06:06:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 06:06:13 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 06:06:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 20 Jul 2023 06:06:12 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 20 Jul 2023 06:06:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJ/rXE1IeOblFu1mfPCad4hQ+zySw5FrZZ5t644IjMr3RmbE9tMHnZWWsmOvjgDh6NDyh0FIv5GqCMKh3KFLSL6eqaeXw5TLZ4A+WRqWNcyO5b5daH0Ys8q0tsynBd0+Qhme1CRD+m68d8k1bB8MJtTMpQuzPXgT8JOpc6o0RvK6RPNQaMUuwiLD5zpBREtY5GKIkGMeRZj6NYx4dOlSE1P3MbaQPV90OS6A+e0vIuHQ/LcW957Rs35QM4aJYOMxSjnYzZF27Zp/NlNY8z4nwzfsPcLQfJB2db6vxMcZvMfqT1WTvROhLXSRqG0kZEvbTatbYd3yIRd78JjWl1hozQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LVDd5U4eT6iWV1ntpQYDoD2WoE2Gg9qcCtbAywlf8Oo=;
 b=BkWjKOO9XzRGKdHALKPQsUD+BGrfkXWE7Q37se5dyh3ScWsIbHVTZt28LTa78RH4AruqgABlsQKXhO1URi9zuQFIb4mX2lw36W+3ilAUrRY4mgqemjs7NFH1BCjxfYsjnjscDniB45bR3j/RAj16lcosxDuBBcTv52S6chBog3141ZWE5sg27U+As6mkMYncplYTOrqGtvoKrZ73gOvVG6KyNAtQoJxVxrXLZ9irjjIQRCfaPQeJSvafFXTzgoDsq1o2cVdWmyePmywGJZ1NIUUacZjsTowY+E8PstvHz2z7FF7l8EdbEZJXv0eDf+wZnmpejDepUHn9LKt7Qnptxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by CY5PR11MB6318.namprd11.prod.outlook.com (2603:10b6:930:3e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Thu, 20 Jul
 2023 13:06:09 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::2f24:2dc9:60b:a244]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::2f24:2dc9:60b:a244%7]) with mapi id 15.20.6609.024; Thu, 20 Jul 2023
 13:06:09 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/4] Add support for PECI Nuvoton
Thread-Topic: [PATCH 0/4] Add support for PECI Nuvoton
Thread-Index: AQHZuo24Hm9PV44gH0SjPkNEG1z6cq/CLrMAgAAcuQCAAAscAIAASkCA
Date: Thu, 20 Jul 2023 13:06:09 +0000
Message-ID: <0435e63e367e8e3e612c8c66c87dea2ca6189bea.camel@intel.com>
References: <20230719220853.1029316-1-iwona.winiarska@intel.com>
	 <b0993a11-6589-2fcd-3487-2e6eb68e18e4@linaro.org>
	 <9a400a1be13adb87002ae476839e235aea117060.camel@intel.com>
	 <ca665afc-24af-4a9a-4bb1-a5421b2d6912@linaro.org>
In-Reply-To: <ca665afc-24af-4a9a-4bb1-a5421b2d6912@linaro.org>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5823:EE_|CY5PR11MB6318:EE_
x-ms-office365-filtering-correlation-id: 0a918ff6-836b-4bb0-3f90-08db89221646
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H+y5E3CEdQspzmEGTpA7SPJFX4GgPGEWOnnHKZDABepQhppnJNP6rEuBftu4ApJQ3x6B3WN17Hhac6hkZLqRp1T3KLkevEJs5hGDTlF5vziG6WLau0Kkv6kXudkVG42WkOyy2kJKru2J1j0Od0CDaCmQWkb3E8bYmtxEDUiLegl8ORMvWwzqvlc45LIKWyr6uj5BVt2yRZmt9KJmE3RU0YUpfwbV3KFYZUGjnxqKEsD6cqyuYuc5Ilw6ZgdLBU8apZiv7k1tstFhvLyKWjLilP2O5BDVuCKCwruyrELspS+Mfp2sWggH4MUhcNaJcEDFMoPoN0WEP8qEVYXPau2I/0omPuU5ffbGYjoSBd8BGx/6X9CbPDV7KS+lTe99XpWjEeVymJfCRqgr+H5REXEVSajsQkWcQXLdtnD/lxMqqop9vhy8CqouyVzBnzUIOZn0D8Qu46CABDCPL1S9liY/WcZ0SO2bY245wed6oHXI1Zis5CN1STLOPp8FYiH8VJLDtB+SL9dtdEXjvVhUazL8dwZsW/hhGN1rOTUqhIkW8eYkrNRW9vS8amrHUo6qR6dnWfQ5FOYuSvLas+JFZQxYe8ZRSe6zYwafmlwQ1dZ+Rdv2KHyaT2j4iNORDykl8mlEuQg6OEdUEJJcTEciOhgS1Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5823.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(136003)(346002)(376002)(396003)(451199021)(38070700005)(66446008)(82960400001)(38100700002)(86362001)(122000001)(36756003)(2906002)(66476007)(8936002)(478600001)(8676002)(7416002)(2616005)(71200400001)(5660300002)(966005)(6512007)(6486002)(53546011)(186003)(26005)(6506007)(54906003)(316002)(4326008)(110136005)(66946007)(76116006)(41300700001)(91956017)(66556008)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UElIeHVCTGkwZ3ZGdWFheWY3K3BMY0tMMk9zK0xwMGZmQ1FrNUMxekVEc1hq?=
 =?utf-8?B?VkMrVEsySXN6bjE2N2Q4MEhqWWttb1hiQzM2TzlDRklwK201MUo0OWJDK3F4?=
 =?utf-8?B?d1pkRlZXeGY0RDBBWWpqYitQM2F3VlVUb3Y3czRySXlFc0lRRFkrVkdQTFp5?=
 =?utf-8?B?UHhVZ3FrdU40UEV2R09yaXZZdStGK0I4ZURNRWh2NnVkRG95cXU1TUxpMXNh?=
 =?utf-8?B?djRDSXpYQ2JtOVZZdnlmU3ovMCtiOFAvUG5OSDJTYXVyM3YwSGV5S0hUaHA2?=
 =?utf-8?B?cU9EUDJoNHhZV1FoYmhRbnU5WkVoVFZKSjcwNXdWYUN3YjBmaGw1Yjlpbyt4?=
 =?utf-8?B?REdyS0J1bEpRUkFCZHJOaGpCdUFreWtYa08wcVZ3ZCsxcGhMb1ZvWkdDOHdG?=
 =?utf-8?B?bGM3ZmlxWmYyUENERC9naDJaRnNGY3hGRXBoUVlZZm91K1pXekpSQ0diYnFy?=
 =?utf-8?B?YmtpL2JTdHk5S2FIZ0JEaC9hQWNaZHJrall1Q0paY1RUK3RxeVV4bnZpYzJX?=
 =?utf-8?B?ZjdzcjNYL1RldUdWUFRDNzI3RjJHQlZHdFRmS0xvVVZZMUZVeVNmTGJBUzUz?=
 =?utf-8?B?Zi9FWnhPb2pWTkFQR3JPZnJibVoxanFLZU0razFweHl2TnUyWm5nSVFTdjg3?=
 =?utf-8?B?UnpoaG9rdGdBakpJVkgvOXBUSzBhNW5DYWdiVEs5d0wvUUdiRFZVTCtSOTNi?=
 =?utf-8?B?NE5na0NnN2Q0VnRORU9XWGVRWDlFQXExUnRmUDZmVUdhRjUvR1VsdUthYjFV?=
 =?utf-8?B?VVRoRklWeW9RQ1BZQnpzSy9ZWVNBS1grUnNlV2dkaTVHZ2p1aVlhQlpPdFZP?=
 =?utf-8?B?L29pVXNSMHdJdzNHazhTNVJ4cE5nL1lxcUg5RXhsL1BTR2pqbWZ4ZnRyaXh6?=
 =?utf-8?B?RDg1K2hUY3Y5aXZpVGRMUUhYcmVOZzFVTGhnWDRxeFArQUFneVJOU01FaitB?=
 =?utf-8?B?eStEMkU5YjZnaDdVd1R3alNuc2VIbzhHdE9XeXo4OFpoQk9hS3BvbFlHeHFI?=
 =?utf-8?B?VmNQWGkveTRTZmpMMStobHdJL1htbkYrWnNZajhVM3RwYWpLQ3pGd1pwb3Bu?=
 =?utf-8?B?M3VMenVRckRoTFg2bEZvSU5RRHp6OGxIN013TlNmSHFVa2wxN2pJNXNlWkM2?=
 =?utf-8?B?WTlrd2VkK0pJbW5Yc0ZCdFl6ZjV4VVpDWDlmbXdMT1daTm9VSzZFdE9YN0ky?=
 =?utf-8?B?aGFQWmhJYjVNR0Q2bzdLd3liNW5YL1YzOC85VkQvQlpLaTFzdWlJSkFoQmd2?=
 =?utf-8?B?L1BKN1hoQ0MxdTEwckJ0eEtWOFpVaEd5SldjRVF6QUdodkY2a09SQnNyNUZD?=
 =?utf-8?B?anZ4Sk1ZRXliLzhkeEpSNTJjd2tCNElOYXJOUWtWTm5PKzBJdGczb1pTVGc5?=
 =?utf-8?B?am1kemp5RFZRUjBKZGFZV3orYTNzc1FIc0trSFE0dUsyZ1R2enhqRWpodDE4?=
 =?utf-8?B?TTZ3KzVUb2o1WkdCam1GM2ZNNjRLeURKT1VqVGU5T2s4UmswR3ljOUZoQXJl?=
 =?utf-8?B?NGlKcXlLeEJ4a25vQngzZFhhT3g0UHQrYzZneWtyZ2JRS0NyS0xZZWZzdTQy?=
 =?utf-8?B?cVNzSDRwSHBVWEsrRmNOSXhQRGRrTExhNCtET04vbFdOWkM2Y1RJaS9aT1VL?=
 =?utf-8?B?THVvSlVvNzFzd2xoL2pFb3BqWHI3eFpTTXh4QnFDaFVVZGxXcWg4akNwcUw3?=
 =?utf-8?B?dmhULyt0TXZmQmRBVmNJMks4VWdPMldkUFU2U21GUE9MK0JFditUMTJRbmdm?=
 =?utf-8?B?UUljZEVubVdIT2JwYVBDbUJTQU1obXdYb2NVajY1elU1czZRNjFiMXl1T1F0?=
 =?utf-8?B?K0tQdWRvZ2lqZlhlUm56MXFQQUNnb21WelJyZTQ5MmtpeU5teG5IcHJoRGFx?=
 =?utf-8?B?M3QyT2JQMnd3MnlIS3ZOcWxQUS9ST3JFaU1ncDB6M3dkYzJRV1BQb3lwWTMz?=
 =?utf-8?B?MXJSSG5GNmFhaVpvd3NoekJKckxidVhmNTcya0EyQkRwdGo5Q0FYR21oSTIy?=
 =?utf-8?B?eEU5aHI5dVFNMlU5bzN4Z3BqMWdnTnhRa1llYnZBbkdEcm5FanYvZnl1Q1BC?=
 =?utf-8?B?T1V0RFYwR1RjTkVNcnl6ZUJoV0R5b2psSWxNd3pyMmZ5RzFEczh4VGRpOG9L?=
 =?utf-8?B?MXNWeFp3ejI0cTVjNUpxRGZ6OFhudU5sN1A0SkRtNTE4cEliZFVmdU5ONTJO?=
 =?utf-8?B?Nnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <713A0D0A92EEC74CBDE66143C5FC759B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a918ff6-836b-4bb0-3f90-08db89221646
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 13:06:09.8550
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k0Lyq5Sv1ocNq2D32jzigdXcHYu4vz9KCvvLEbU8En98Wk6ODYc93tIN/BfRJdTY1TBmT0v/8i265s6+FzN3VIaXBAf9xgygS0sjHi4YPmo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6318
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
Cc: "conor+dt@kernel.org" <conor+dt@kernel.org>, "Fair, Benjamin" <benjaminfair@google.com>, "avifishman70@gmail.com" <avifishman70@gmail.com>, "venture@google.com" <venture@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "tmaimon77@gmail.com" <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gVGh1LCAyMDIzLTA3LTIwIGF0IDEwOjQwICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBPbiAyMC8wNy8yMDIzIDEwOjAwLCBXaW5pYXJza2EsIEl3b25hIHdyb3RlOg0KPiA+
IE9uIFRodSwgMjAyMy0wNy0yMCBhdCAwODoxNyArMDIwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3
cm90ZToNCj4gPiA+IE9uIDIwLzA3LzIwMjMgMDA6MDgsIEl3b25hIFdpbmlhcnNrYSB3cm90ZToN
Cj4gPiA+ID4gSGkhDQo+ID4gPiA+IA0KPiA+ID4gPiBUaGUgc2VyaWVzIGFkZHMgc3VwcG9ydCBm
b3IgUEVDSSBvbiBOdXZvdG9uLWJhc2VkIEJNQyBib2FyZHMuDQo+ID4gPiA+IEl0IGlzIGJhc2Vk
IG9uIHBhdGNoZXMgdGhhdCB3ZXJlIHNlbnQgYnkgVG9tZXIgTWFpbW9uIGZyb20NCj4gPiA+ID4g
TnV2b3RvbiBbMV0uDQo+ID4gPiA+IFNpbWlsYXIgdG8gQXNwZWVkIGRyaXZlciwgdW51c2VkIChh
cyBpbiwgZGVmYXVsdCB2YWx1ZXMgd2VyZSB1c2VkIGluDQo+ID4gPiA+IGFsbCBvZiB0aGUgYXZh
aWxhYmxlIERUUyBmaWxlcykgdmVuZG9yLXNwZWNpZmljIHByb3BlcnRpZXMgd2VyZQ0KPiA+ID4g
PiByZW1vdmVkLg0KPiA+ID4gPiBJZiB0aGVyZSBpcyBhIHVzZS1jYXNlIGZvciBzdWNoIHByb3Bl
cnRpZXMsIHRoZXkgY2FuIGJlIGFkZGVkIGluDQo+ID4gPiA+IGEgc2VwYXJhdGUgc2VyaWVzLg0K
PiA+ID4gPiANCj4gPiA+ID4gVGhhbmsgeW91IFRvbWVyIGZvciB0ZXN0aW5nIHRoaXMgc2VyaWVz
IG9uIE51dm90b24gaGFyZHdhcmUuDQo+ID4gPiA+IA0KPiA+ID4gPiBUaGFua3MNCj4gPiA+ID4g
LUl3b25hDQo+ID4gPiA+IA0KPiA+ID4gPiBbMV0NCj4gPiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvb3BlbmJtYy9DQVA2WnExam5iUThrOVZFeWY5V2dWcTVEUnJFemY1VjZrYVlQMzBTN2c5
QlY5akt0YVFAbWFpbC5nbWFpbC5jb20vDQo+ID4gPiA+IA0KPiA+ID4gDQo+ID4gPiBUaGlzIGlz
IG5vdCB2MSBidXQgdjMgb3IgdjQuIFBsZWFzZSBwcm92aWRlIHByb3BlciBjaGFuZ2Vsb2cgYW5k
DQo+ID4gPiB2ZXJzaW9uaW5nLg0KPiA+IA0KPiA+IFRoaXMgaXMgdGhlIGZpcnN0IHN1Ym1pc3Np
b24gLSBhbHNvIGtub3duIGFzIHYxIDopDQo+ID4gQ291bGQgeW91IGVsYWJvcmF0ZSBvbiB3aHkg
ZG8geW91IGJlbGlldmUgdGhhdCB0aGlzIGlzIHYzIG9yIHY0Pw0KPiANCj4gSSBoYWQgc3VjaCBp
bXByZXNzaW9uIGJlY2F1c2UgSSBzYXcgaXQ6DQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC8yMDIzMDYxNjE5MzQ1MC40MTMzNjYtMi1pd29uYS53aW5pYXJza2FAaW50ZWwuY29tLw0KPiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzA2MjgwOTA0MDQuMjM0OTY1LTItdG1haW1v
bjc3QGdtYWlsLmNvbS8NCg0KQ2hhbmdlbG9nIC8gdmVyc2lvbmluZyBpcyBtYWludGFpbmVkIGZv
ciBjaGFuZ2VzIHRoYXQgYXJlIHN1Ym1pdHRlZCBmb3INCmluY2x1c2lvbiBpbiB1cHN0cmVhbSBM
aW51eC4NClRoZSBzZXJpZXMgeW91J3JlIHJlZmVycmluZyB0byBhcmUgbm90IHVwc3RyZWFtIExp
bnV4IHN1Ym1pc3Npb25zLg0KQWRkaXRpb25hbGx5IC0gdGhlcmUgd2VyZSBubyBjaGFuZ2VzIDop
DQoNCi1Jd29uYQ0KDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPiANCg0K
