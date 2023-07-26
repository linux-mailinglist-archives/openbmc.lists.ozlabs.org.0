Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA9B764110
	for <lists+openbmc@lfdr.de>; Wed, 26 Jul 2023 23:22:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LwUwiMhn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RB6Lf2nLFz3cCx
	for <lists+openbmc@lfdr.de>; Thu, 27 Jul 2023 07:22:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LwUwiMhn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RB6L03mx9z2ykT
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2023 07:22:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690406537; x=1721942537;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=RUxHmBeFLH3bNJIUSNwCEtJE+TzA9Z9WJi5QDUl16J8=;
  b=LwUwiMhnA3mCd/0RZgIMqNPTi3BLe3HuLtFXWQevY9G/voLYvXv+Z1SP
   vRn9t8+EOZp1jcO1tG611N359e4e7DeU3N1TjHyG6kFzXIVn6YyAdUO27
   kZMMZtK2oaigb//ZInscI8qiTF6CAvGl+vUtQIrqWJSgCl7FD4vvxvCkh
   RJNioFm0bbqMX3BAXSe1Er+E1rZ1R6/7uNx4mKsMR8Qj46niL7vO1xIKA
   xWam0SQyb3YprDRsUVOd+Mkw5MnIyadPmmBeHuDbohpprOzkTdUP9nViS
   KQosrY6M8S8X3ZEXLfn/13sBceOTXnxCfLU9NGCKOnl/orMldwHHf5V4e
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="434402566"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="434402566"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 14:21:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="900593915"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="900593915"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga005.jf.intel.com with ESMTP; 26 Jul 2023 14:21:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 14:21:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 14:21:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 14:21:58 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 14:21:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jEqarhlKsVOqC0hJlx9j6JMqq6saQOD9Sn8xN2c0UyZdN7h9x1gBVUlpMKHHWv+j70OAXS2bYEZSj02BgUdU4L9Flcan30wZtEAIPdWqT6dLoaKIs9Kg5S1BJzdNrsSF9eLJDSIXP1j+A1Oyrqm0DU1SwTQpDlmzo79cL1/dYk1ZeUTuZnhWM6YGcNRTTK0eiAganftbsMAbB/MAk31sBUEbXc2ueCYqqkYd+rflDPdyzaYOJSXUwgbDfstLSoNUYJdZr05kiskGWK1p2+V2xVj5Vsn4Gr/Ph0yYJN5FtYR559XKiHn/d3O9BOGqLOVswKMi/QdN1b3DaG6RMU5/pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUxHmBeFLH3bNJIUSNwCEtJE+TzA9Z9WJi5QDUl16J8=;
 b=TnClWGckjGJyBZoZjxj+Ed2sR8qAQ8VIebHPjBVYCyi4fSu8PDMLvnG66uPMYD17FpKUB6GYysJzi4wkyH15c1EcjQVRQuMMs656L9zOnrE1SHjQdjEefTtEketxgkGCFhPLQx2keegxorNzc6PoKtVG7p3FVGST2hg75D19JoYWIzSTgLJ59pYQfSrltQcs2zN0vzIeqNm4wBM30KVNqupcJTdWWZBc5eipxQ1yy5j0IhAVcG6DCq5BlHFCaEBn0J0SSnvHbE5qff/JzO7aMfE+L8x69v1mQVpTUmwsIpqPsot8qgw9Arajb0bU9P35pM0pBMjq/QgaM17QNO+P1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by CY8PR11MB7779.namprd11.prod.outlook.com (2603:10b6:930:77::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Wed, 26 Jul
 2023 21:21:55 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::95fe:e2ee:d733:6399]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::95fe:e2ee:d733:6399%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 21:21:55 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "robh@kernel.org" <robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: Add bindings for peci-npcm
Thread-Topic: [PATCH v2 1/4] dt-bindings: Add bindings for peci-npcm
Thread-Index: AQHZv/dpu+gY7KMqZkewjYLfi4g7oa/Me4EAgAAS9YA=
Date: Wed, 26 Jul 2023 21:21:55 +0000
Message-ID: <1b47e8b9277756643cc770fe050426334d36f315.camel@intel.com>
References: <20230726192740.1383740-1-iwona.winiarska@intel.com>
	 <20230726192740.1383740-2-iwona.winiarska@intel.com>
	 <169040244201.1980325.11685396975848728495.robh@kernel.org>
In-Reply-To: <169040244201.1980325.11685396975848728495.robh@kernel.org>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5823:EE_|CY8PR11MB7779:EE_
x-ms-office365-filtering-correlation-id: c3d73354-c05a-420c-0d47-08db8e1e56af
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IL05u+hQlYyTg8ixMXBdoEnek7OeG+jihp2ycc/duc41hSCXNWLCZ8GDq1JC6YmA8w6vtAUAJ+XdV7Wjgw8Szko8EoX2R9s/wFyqFE+tdvL/FvZbxkxHfeic0AOwX6PzAl9Q9ZxwCRb36EAgJ204fq5QboEytfdOvZBHTdianQ7czTRMCtUiAqWg2tDLIU9DTg851mUfGtGikfxgVQcMLCRkERXNhHm5QvCxVySCaP3sjnLevtpeVsjSDNMfGSiovvEz4UDv9WRNNUPRfKDZXsCaJ/WSpLkuuzVyY7eD67hemVYdFoKgZmkabgxDZXaI3/oT2B5q/AxGxjM4WMdXUBJi8ywkMwIH5w02p3MM/T1PE5ek3ryodZARv/ARM47R5zlK0UFuNn6RxGBOUso1Abnwl5574tQHLjs/2of0ONnnNCeab3NwI21G+VZPfIHe4hAqJv4W/xTCJUq2rqSh9VCDrECZZdfRgOvMDjG9Sh/0v7Uo7Bf13CARdgUlfSpQ3B91xON19TCWZkL5O9Ir3+IjjuziursnybcvykTuYXhXFRptfmhu34olrKEMSUZriF/NOZP+lRQVYR10i4bwen0CTsg8Gf19luEQaL6sOaQjdfMr9+vzEkooAlJYoXBY7rDBabDeApmCMy7oLnzgAQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5823.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(39860400002)(346002)(136003)(376002)(451199021)(8936002)(5660300002)(2616005)(41300700001)(8676002)(6506007)(7416002)(26005)(186003)(83380400001)(66446008)(122000001)(6916009)(4326008)(71200400001)(64756008)(76116006)(316002)(66476007)(66556008)(66946007)(91956017)(82960400001)(86362001)(966005)(6486002)(36756003)(478600001)(6512007)(38100700002)(54906003)(38070700005)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a1gyNVJRK2tDSjhKMVRjbkIwYWpyRnczNmNhTzhPakNPbTJCdEkwUzFnV0F1?=
 =?utf-8?B?T2xId1didGtsWUcvMlRkMUlkckxTTXF6MTVMRGZ4bzhnYlo0SkVaMlVzcVg2?=
 =?utf-8?B?bVBOY3lJYy9xWXppQk1YbWJMTzhLajN5ZU9KV3JLRkE2cHlGM3RHN2RVUDFv?=
 =?utf-8?B?amZHYUt0aDVjRUV3NzdCNSt1dFlIOGpGR2lSNm1sWWJSREVyaFFRMDZ4RXBE?=
 =?utf-8?B?T3hFRXFXcXAwcEpCbW9zRm9tekY5dWVuek9mWVpxTloraFk5Z3FLWHJ6SkR5?=
 =?utf-8?B?MXVmQm1JNDFkT2NEWVFIZVdhdUVLNzR2UWI2L2MweE9qbk9iS295WkpSRS9D?=
 =?utf-8?B?c0d4S0tSTkxmQzFLekpjVzJTZmRPOUdFWVlOdkhrTEVTL1JhUS9uNUxaUUNp?=
 =?utf-8?B?VHJhZTJIaFErWVNRaFp3bmUzTlcxaTB0OURMQ0dlUzlHWStldFpmcmR0RUhB?=
 =?utf-8?B?N3FlbGRCcmtQTDJuOFpUWURyS1JpcE5OTDlkVEx2ejNUcW8wQXl0YVJGSFM1?=
 =?utf-8?B?N0pSdmdSVnpoTWV2SXZ3RllSZTFJaVpkVzR1UWs3SFdQUzlKZEZvNXFMalZw?=
 =?utf-8?B?dGZXeFlFUno4aU5pbGxzSU1aaXNyYjA1YlFjeDFCNHBvdlkxd2RqOExTR2NV?=
 =?utf-8?B?SUNvVnF5ajBiR25qc0NjYWp6dXNkekhOZVpnM0FPV0xOaXJQYTl0eTlJemUx?=
 =?utf-8?B?Z2lFeGxyWHY2bUxhNEJaTkVJc2kvNmhabVNqVVBNd3lpSGFjeE9PREpXUENR?=
 =?utf-8?B?TllCcHhrTE5nVEVCKzJSbmhxOUtMczhySlhZeUt2NkZmYWl3S1grWGRGUmdF?=
 =?utf-8?B?Z1FKWmpQcitKL1IxQkdUUStEaEFNanVXczJxdUNHL3FyV2JtaDdmKyszOTRz?=
 =?utf-8?B?SFFrT0IyTHJWejkwNTVJK3ovb1VBRU9KZ21UMURtTHBIY052dXRmcjNkL0hV?=
 =?utf-8?B?MFpCT2paaUNOU2dpSUJvZEFIZy8zcE9LWHdkNGlsWGdnTWF3QkZaajZZY1hz?=
 =?utf-8?B?dXY0TS94YVdOZnFHRmV3bjRTMHNjWEtuMUErdVBSR2cyTDR3bU9tSkgySktN?=
 =?utf-8?B?RGc3VFFqOTN6eW5QZWpGL3IwN0x5WWc5UEFDZzlyMjNnakRLVTk0elM0UEN4?=
 =?utf-8?B?M2RULzRVOEFObHVzUTF4ZHkwQmVERkd4Y213OXo0UlZtV2hTVzZDenZlSjh3?=
 =?utf-8?B?Tjh6aGtwNlhFZytkWTQzMEFZSzlkZXBSL2VmZ1UrOHRhR2ZZNTBRN3RnSmZk?=
 =?utf-8?B?dG16SVVNTkFIVmZzRUdYM2d3L0ZVeXNscURCQ0l5SXBpY1pUSGNobmJ4dmNP?=
 =?utf-8?B?dzRzMmZBcHlxWndMVHNzS1hCYjdLU3crUS9Uc1VONzdoTHdrL09hblVLUjgy?=
 =?utf-8?B?Y1VjK2hYM2Q1SUJnZEZUcldLY0NObVF0UVh5ZkxGK05hbFV2UnZOVWhoRTh0?=
 =?utf-8?B?MnZxSjdPZWhxRUlVL1hSQUIydm1QQko4ZlNCYll5ZlowZEhDNlc0NENFZnNx?=
 =?utf-8?B?S1o1UFNzeDVtbys3UW14dG5ncTVzVlFpTENhK0RSL1FOMXg0N0xCK2ZIcDFa?=
 =?utf-8?B?RHpxNDJ3MlZ3dmFUNlJ2Q2UvWGsyMFp1TlZhUzVicW82T29GTUcvSnczdlNB?=
 =?utf-8?B?S2F6Tkg0WGMwOVVlbG1vT1ZoMXI2WE5ENEZsekxCU3IxV29FUjdQUWlla0Mx?=
 =?utf-8?B?YlhqK09DdXVXaEJjaUlKUHdadDkySzRzY3NEKzZUb1IyZEZJMWQ5ZDkwOWtn?=
 =?utf-8?B?YUVaWG0zVElGMk9WcHFxMzYrajFFN3hqWmtmWnd6Q2tXR0IvNDY4K2RwcGV1?=
 =?utf-8?B?QVY5VW56V2dnekVqQ2VzaVU2WEJsUVJicHEvTjVaVjVWL2N6SGJHckNOY2Nh?=
 =?utf-8?B?ZTRwd1dwM2EydEJKREtRaG1LbDNpK2VnMVdNdlRhWkFJV3VlS0xydDYySWFp?=
 =?utf-8?B?K210M1dwejhXQWlOc2ZIVklwRW9xcFdOMkZJZDNYZHBtZGpwaXduZ2xxSmZx?=
 =?utf-8?B?OFVyWUZUc0h5cFpPdXdsT3p5VUkwMW9BV2RaNmlEWnVOcE9uYWNVMmVGUWFs?=
 =?utf-8?B?ekIwS1diNmY0enJVZk1ERjFDM010WXlQSWRGU0tIUGxJZUFDdDJsSW94VmJh?=
 =?utf-8?B?cW14RGNHR3NORWl4OHZjR0Y1SldWaCtBblpTTmxXWlVwOGtUNGVxTVQzVWQ3?=
 =?utf-8?B?N2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <10FD4C748307DF4B99653097E0694A86@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d73354-c05a-420c-0d47-08db8e1e56af
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2023 21:21:55.7031
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o1YfQru5fRmytOCu0Gjjs4xST+RPDya2UbjiTOlsHNkSTyyhE5fRoTZQbZHZwrv4ZCJBuPdot0nTXPUW47IMXfAdWJ4kMq8tv8SWTfyzSY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7779
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
Cc: "pmenzel@molgen.mpg.de" <pmenzel@molgen.mpg.de>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "Fair, Benjamin" <benjaminfair@google.com>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "avifishman70@gmail.com" <avifishman70@gmail.com>, "venture@google.com" <venture@google.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "warp5tw@gmail.com" <warp5tw@gmail.com>, "tmaimon77@gmail.com" <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gV2VkLCAyMDIzLTA3LTI2IGF0IDE0OjE0IC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
DQo+IE9uIFdlZCwgMjYgSnVsIDIwMjMgMjE6Mjc6MzcgKzAyMDAsIEl3b25hIFdpbmlhcnNrYSB3
cm90ZToNCj4gPiBGcm9tOiBUb21lciBNYWltb24gPHRtYWltb243N0BnbWFpbC5jb20+DQo+ID4g
DQo+ID4gQWRkIGRldmljZSB0cmVlIGJpbmRpbmdzIGZvciB0aGUgcGVjaS1ucGNtIGNvbnRyb2xs
ZXIgZHJpdmVyLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFRvbWVyIE1haW1vbiA8dG1haW1v
bjc3QGdtYWlsLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBUeXJvbmUgVGluZyA8d2FycDV0d0Bn
bWFpbC5jb20+DQo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBJd29uYSBXaW5pYXJza2EgPGl3b25hLndp
bmlhcnNrYUBpbnRlbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogSXdvbmEgV2luaWFyc2thIDxp
d29uYS53aW5pYXJza2FAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+IENoYW5nZXMgdjEgLT4gdjI6
DQo+ID4gDQo+ID4gKiBSZW5hbWVkIGJpbmRpbmcgZmlsZW5hbWUgdG8gbWF0Y2ggY29tcGF0aWJs
ZSAoS3J6eXN6dG9mKQ0KPiA+IC0tLQ0KPiA+IMKgLi4uL2JpbmRpbmdzL3BlY2kvbnV2b3Rvbixu
cGNtLXBlY2kueWFtbMKgwqDCoMKgwqAgfCA1NiArKysrKysrKysrKysrKysrKysrDQo+ID4gwqAx
IGZpbGUgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKQ0KPiA+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wZWNpL251dm90b24sbnBjbS0NCj4g
PiBwZWNpLnlhbWwNCj4gPiANCj4gDQo+IE15IGJvdCBmb3VuZCBlcnJvcnMgcnVubmluZyAnbWFr
ZSBEVF9DSEVDS0VSX0ZMQUdTPS1tIGR0X2JpbmRpbmdfY2hlY2snDQo+IG9uIHlvdXIgcGF0Y2gg
KERUX0NIRUNLRVJfRkxBR1MgaXMgbmV3IGluIHY1LjEzKToNCj4gDQo+IHlhbWxsaW50IHdhcm5p
bmdzL2Vycm9yczoNCj4gDQo+IGR0c2NoZW1hL2R0YyB3YXJuaW5ncy9lcnJvcnM6DQo+IC9idWls
ZHMvcm9iaGVycmluZy9kdC1yZXZpZXctDQo+IGNpL2xpbnV4L0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9wZWNpL251dm90b24sbnBjbS1wZWNpLnlhbWw6ICRpZDoNCj4gQ2Fubm90
IGRldGVybWluZSBiYXNlIHBhdGggZnJvbSAkaWQsIHJlbGF0aXZlIHBhdGgvZmlsZW5hbWUgZG9l
c24ndCBtYXRjaA0KPiBhY3R1YWwgcGF0aCBvciBmaWxlbmFtZQ0KPiDCoMKgwqDCoMKgwqDCoMKg
ICRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvcGVjaS9wZWNpLW5wY20ueWFtbA0K
PiDCoMKgwqDCoMKgwqDCoMKgZmlsZTogL2J1aWxkcy9yb2JoZXJyaW5nL2R0LXJldmlldy0NCj4g
Y2kvbGludXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BlY2kvbnV2b3Rvbixu
cGNtLXBlY2kueWFtbA0KDQpPb3BzLCBzb3JyeSBhYm91dCB0aGF0IC0gSSdsbCBzZW5kIHYzLg0K
DQpUaGFua3MNCi1Jd29uYQ0KDQo+IA0KPiBkb2MgcmVmZXJlbmNlIGVycm9ycyAobWFrZSByZWZj
aGVja2RvY3MpOg0KPiANCj4gU2VlDQo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJv
amVjdC9kZXZpY2V0cmVlLWJpbmRpbmdzL3BhdGNoLzIwMjMwNzI2MTkyNzQwLjEzODM3NDAtMi1p
d29uYS53aW5pYXJza2FAaW50ZWwuY29tDQo+IA0KPiBUaGUgYmFzZSBmb3IgdGhlIHNlcmllcyBp
cyBnZW5lcmFsbHkgdGhlIGxhdGVzdCByYzEuIEEgZGlmZmVyZW50IGRlcGVuZGVuY3kNCj4gc2hv
dWxkIGJlIG5vdGVkIGluICp0aGlzKiBwYXRjaC4NCj4gDQo+IElmIHlvdSBhbHJlYWR5IHJhbiAn
bWFrZSBkdF9iaW5kaW5nX2NoZWNrJyBhbmQgZGlkbid0IHNlZSB0aGUgYWJvdmUNCj4gZXJyb3Io
cyksIHRoZW4gbWFrZSBzdXJlICd5YW1sbGludCcgaXMgaW5zdGFsbGVkIGFuZCBkdC1zY2hlbWEg
aXMgdXAgdG8NCj4gZGF0ZToNCj4gDQo+IHBpcDMgaW5zdGFsbCBkdHNjaGVtYSAtLXVwZ3JhZGUN
Cj4gDQo+IFBsZWFzZSBjaGVjayBhbmQgcmUtc3VibWl0IGFmdGVyIHJ1bm5pbmcgdGhlIGFib3Zl
IGNvbW1hbmQgeW91cnNlbGYuIE5vdGUNCj4gdGhhdCBEVF9TQ0hFTUFfRklMRVMgY2FuIGJlIHNl
dCB0byB5b3VyIHNjaGVtYSBmaWxlIHRvIHNwZWVkIHVwIGNoZWNraW5nDQo+IHlvdXIgc2NoZW1h
LiBIb3dldmVyLCBpdCBtdXN0IGJlIHVuc2V0IHRvIHRlc3QgYWxsIGV4YW1wbGVzIHdpdGggeW91
ciBzY2hlbWEuDQo+IA0KDQo=
