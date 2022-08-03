Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9957A588517
	for <lists+openbmc@lfdr.de>; Wed,  3 Aug 2022 02:19:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LyCCH3FXrz308b
	for <lists+openbmc@lfdr.de>; Wed,  3 Aug 2022 10:19:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MbQWrXMG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MbQWrXMG;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LyCBl29yjz2xGG
	for <openbmc@lists.ozlabs.org>; Wed,  3 Aug 2022 10:18:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659485919; x=1691021919;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=a02rcBX83s070jc6sg4P+14WK79ykseRRZNoMNmkXq4=;
  b=MbQWrXMG7Y9ILta9zCNOkiQ/B0OzGYgmjq2yINmEyIHT7fW/tdaq694J
   EEwjGP5vWFJdgHtoJpU8ODDbQIF2F1h7RFc7fgxSQMCZrI5JsOP4LeFOc
   pd4YLtmi+iAUAklpFVejYJ01icu57af43vdjQjFCbP+xbAFEImhXRVF0e
   r7H0txy9iavWW8n5IDLQHl+v79g4pS0yOOVeVWcLMhy1FksXYMWuRAJFu
   nK1NAqDEScY7ic61ekT3WrO6wL8Od98YHv2xmSpbV4sCwCpbJ5m58Qjf1
   7hrwZyLZ//vM13H4NiG5wWu2csCIwJUBctgwoc3dswE3aI6g6IXI6mkeh
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="288303967"
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; 
   d="scan'208";a="288303967"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2022 17:18:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; 
   d="scan'208";a="670649802"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by fmsmga004.fm.intel.com with ESMTP; 02 Aug 2022 17:18:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 2 Aug 2022 17:18:28 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 2 Aug 2022 17:18:28 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 2 Aug 2022 17:18:27 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 2 Aug 2022 17:18:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l98nbW8w2GVfaan40/hnnmomfdpbOHq39jmDowS2jL9kHSo3mojXhKzeiwgLlH7t9ETjAblUfhLxwPg+VZ0RzN4StfcjH5ft3GX64esgo9XykOwFX3bKlrYmik3tf+Bs+WpCrcOURvtMWxT3cMIkvtszamVPaToE8g8Yaf+7GJdqzSzAku9LGiEBOtIklrUyrMyINsGQAl/FIaro5TYC6Qwn9jj+hFivKdWcf+dFzNDVESUxm/TyrxGMxiIFsGG66z6SKkLhd6ztG2CMpCZPWR8z0oYgen60nxereF8IeCijR72vxA3zXxUe+V7Qecgw3w3aqfvziBKr7hebINKibw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a02rcBX83s070jc6sg4P+14WK79ykseRRZNoMNmkXq4=;
 b=T6F2hv32JF+jFgF0gNzec9Xtn/SnrboY3mTOAkt9koaO8Bh497yM9WuzLEG7z81SkPV8BTYRBaVdgSqr4l6txbi09FWnzlwOGt/cnrW8Vit/xzfLacVuKbgeVvYpuduF+09je45p65CVsHBSvaYk3Csc58TJ13O91nabA7mQ6QE+EmEzGnDrIpUbCQd0MyduMmqx6AbAchBnQpBipwNw5i063iNKpmoAfs9k35OhoP0aIGyndk0Rzr8QwJ+z8vnRAqWSxkfeegw82PWSN34VdD3g0ZTLQIP5WxPxEcpqL6fzuYGSEUKmHW+tl+5HiBAReS2ULa6c+upE/1BZXVkXKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by CY4PR1101MB2229.namprd11.prod.outlook.com (2603:10b6:910:19::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.15; Wed, 3 Aug
 2022 00:18:24 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::64a8:fab7:454d:be01]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::64a8:fab7:454d:be01%4]) with mapi id 15.20.5482.012; Wed, 3 Aug 2022
 00:18:24 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: [GIT PULL] PECI changes for v6.0-rc1
Thread-Topic: [GIT PULL] PECI changes for v6.0-rc1
Thread-Index: AQHYps6LaN/VudCl80WQKYpKGxF+bw==
Date: Wed, 3 Aug 2022 00:18:24 +0000
Message-ID: <e34c084a69cc5c51c60b1813ac7fdf0b845d1226.camel@intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.3 (3.44.3-1.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e3aaa5a1-55ca-428d-4001-08da74e5ae3f
x-ms-traffictypediagnostic: CY4PR1101MB2229:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hWUh9M57mPXv7N6oQlnvLeA0svmqPzTghi1YWKOCwdYeiW15iQwk6k5Duo36IW86Qc47IU0o7iZH73FZSCz8v1TMeQoJli0UvbMv/DdQ5XdEf8/vQudhcOfpX5gvQu0yZKLiE0PaXXboIN2p+LnzkE0nYQElQznZWpt/+GKMX1XX/O1RuT+EoobCjHU2DWlW6iEpkuX2AT/PHIbqBs4kU/KnrMgbJDdIBMvGYROsqR+FLcvbfW6WD9MvVII8v/2trpBD1pugQgOXh7hVTEdQNFFzspTdEIyBFSlk7HWf//CRbpwkHqn/EAXMfMREudZV8ClNqbZZNDzSbmjPliEtyCmzXQGFWA6qNb/1kVVGor7UWk1zrEQPjTVQ+hT4bcF0MsGjNQLxaN+waDwiYkm7qZ5XluOiCcdlWHUWoTMVmIc3+xUVgrXnb6QVacf/ZsTJn27B2YVVcLhLsAiSwCvjt5M+yy5BLvz86UMld00FO8TcBe57IQ9UTUnHCk0Y/VtnBkZlljgdrDeX7cZbitusqu7zbTkmAdoU8afRNsIA/J2+Gd6bilbE0yXPXilFQ4VCfKvaS16ZDyQ602k60/qS49mMlJW8JfJjyBN1sYw9sySu4LcPSZmjS9TToRtt9EEMul2BdeedBEDVudkPckg+kHIg7gnM70fQqp/Qm/+Vi9tOeigaDx9Z4RXYKQSqB4s+GJdfQOCtA2OVf+zU5qEnS/y+dvB9VCJ0YUxWwqE1/Wt1ETDAJf7dVQ3WcxxuiYPydFiC70tEbKcZcP7aooHEpe18jqsQR1cqBE/h/41ygBg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5823.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(346002)(136003)(396003)(376002)(6916009)(6506007)(54906003)(8936002)(38100700002)(26005)(91956017)(6512007)(76116006)(66446008)(86362001)(186003)(64756008)(66946007)(8676002)(38070700005)(66556008)(66476007)(316002)(4326008)(82960400001)(71200400001)(83380400001)(41300700001)(36756003)(5660300002)(2906002)(122000001)(6486002)(2616005)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M2M2UHQrMmJmUDQvRUJSOXFobWYrUm9MbGgyM2Vla2c1UTVwMU1OUTlCdk92?=
 =?utf-8?B?NnJUNklQMDVVK0NabXlZbHZveGJvSUF3Y3d1WFJIN1lCaUJCd3ZTdlM0aUFJ?=
 =?utf-8?B?ajZwbk0xT2tZUFlLbVdTRzRvdHBzcnVmSllyc3hMM3pCcUhtV3VOVzhmOVgr?=
 =?utf-8?B?c25GZGN4Mjd1UFptQnRTOTVWdUlSdXR3OUJpb1ZjS3puRXFiL1g0akEyQUly?=
 =?utf-8?B?Ymsxd0xkazNUWEVwUWpVc2RIWFR2dzZCM2tlRUlpNVpoWnZZencxRmpVaENS?=
 =?utf-8?B?cVJ0SzhPZmZNeS9PRUdDRExUYytQNUQzWlRhN3RPZEZOS1lsWkRrM1RCcVV4?=
 =?utf-8?B?KytoeDN5c3ZGVEJkMTlzQytQSWJnK29nU2M5SnczdXJINW1CR0RvQ1ptMWcx?=
 =?utf-8?B?Z0hvQ0VwT0s1S3ZIZTJqTC9lUnUzalNJVm5ISC95RGhaWmlXMzR6U0xLbld6?=
 =?utf-8?B?am5jem5sZUJQY1BLVGxhR0NxaVVQYW00ODVVdVNSZ0p6bTArWk0xV2Y3UnRp?=
 =?utf-8?B?eUlvblQwOVFsRHdXaFlBVVlmbTdVUHh5c3p1bzlHUEZJOWdIY1NzR29ERG0v?=
 =?utf-8?B?aktWNUNtY2hNRy9FWXBjWWpJbGZBelhWUXEwQ1BYQ0VoQm1XOG9Ka2xSeU4v?=
 =?utf-8?B?dURLUmZVZDN1Y2NPUmtkYUJZSWRjR0oybEl0dTJWOVRQK09od1hrSmQyQXR5?=
 =?utf-8?B?VEZNZjFYMmtIam9wRnYwTEpNamRVWWJxMG5SSnlEb1JFWlAreE1BY1l0dHJT?=
 =?utf-8?B?WjQ3TkNMWmVnWGYzQmdldGppbkR6WE9sVWVrY05iYWRzOFlSSkJFZ0ZSUFlM?=
 =?utf-8?B?ZnFYNWlzV0JMV1pHcml0aC9MbS9POFZEMDZOeFNYT3dLZzNDcnR2OVBJZE5K?=
 =?utf-8?B?eE91STcvNzJybThqK0w1LzEwaTVTVi93MlM1ZnNLd1ROYjZTUjlxVTZxOEhJ?=
 =?utf-8?B?YUlicEFxK2xydDJiQlVLV05nM2NZdkYwK3B1V3crT2VTRWRmaS9ScFlkdFV2?=
 =?utf-8?B?NXd6bUROcGdyQTFqVTNmMG5tRDZZUlBXd050MkZWcHJINGtVdXVjTjZNYzVu?=
 =?utf-8?B?T1k3ODl0QVRKd3lUbVJ5SnZYZ2ZOUnBJcGtZRUVyeGNwTm0wd21aaWIrc1Ro?=
 =?utf-8?B?VFZGUjh0REk4MWlSdWQybW10bTU3bjRha2FrSWYvZmU3c3lSdmRiVVZLbWEy?=
 =?utf-8?B?blNUaUFaUFpZZEdzemtqVlN5aUNGMVZYL1ozNFJaWDZ3a0wvK0Z3Q0orTjh3?=
 =?utf-8?B?N1l6T3NNdFhWTDZTSndWdlF4YWYxdDdUSDc3dUJLWElEem1HZXQ1WVc0blNI?=
 =?utf-8?B?bEt2T0tudVRjMzVCY21TeXc5NnY5WG1VQUppeHo0SHFXWFVtbGJqTjh0bWxD?=
 =?utf-8?B?NkhTeUplZTVqRExaZVZuQldySENNQXpTeGQ3blpoZy9LME1uUnBtTHRNY2tV?=
 =?utf-8?B?OHN3ekttODVnWlBXNEtNWnlnQXMxS25INXlDKzBPS2NSV1d5Q2U1c3EwRHcx?=
 =?utf-8?B?Y2xKNndUSVQ2RGxhVVVmSEkreWdiNzRLZUpNalM0NUVORDdDUEdnd1BsRDBa?=
 =?utf-8?B?TVVVS2FQblVTMmloWG9hWDNlMzlFNTFITHlFbXU3akZNaC9YeGhMcU9FNlFp?=
 =?utf-8?B?S3VXMVRtNG83MmhpTmFxbDZxSXoxTVl5eXNKekYvN3hyQ1l4cWJrNDZQdFdo?=
 =?utf-8?B?bzhiaG1ZUDFwazNSM2hjVSsxODQ3aFYyOHo1czc0UXd0cTRvK1RNRUFzK3Ex?=
 =?utf-8?B?eXNGblJnTTZQcHl4eEN0VENzQXJITGtWMFlKTVJGanh6QjZ3dnNuandRSVpQ?=
 =?utf-8?B?UDhhMVJ6S1BFTVVMQ29OQlQwNy9BK01XVVAwVzduTlpMQVp6VEYzVkxoK0ZX?=
 =?utf-8?B?b1FkQjVBR0hkWTdUaGtocXlHY2plNi9PNUoxZzVrUmw3ZjlFQ1BSalF3YVR3?=
 =?utf-8?B?bVZFb05NRy8zblVoMFltTWViejJraWo1Q2k5U2g1bmxkZXJBSm9vY29FeTlp?=
 =?utf-8?B?dmV1dzFmZHY4K0xXcldNcCs3WjdiZGtQSzd2djRkVEN4elFJRmFrcTNTMDA5?=
 =?utf-8?B?WGZ4eTlDNXVtOTNwMGZkOStUOW1Wck9BaFUzZFBwK0RBOEtjVUhDL1htOHpD?=
 =?utf-8?B?cllqbzlQdTU3MEFCRDZJNUdoMkVHcTh4RmgxT29xNUgxZmVJUUlhYm0zMG5z?=
 =?utf-8?B?dGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <15EFBD00D1798848B92E236DE8E2E654@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3aaa5a1-55ca-428d-4001-08da74e5ae3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2022 00:18:24.5747
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L3DPLJbpMdSDAlGbfL73c926L5h+kgrWdN3MA44t+efWU/3LRaGzbD2nILjbvGLZMHGOH59mM+i3xH/f0EtA4WF5GhIvNysDXCZAW+WDW6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2229
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

SGkgR3JlZywNCg0KcGxlYXNlIHB1bGwgUEVDSSB1cGRhdGUgZm9yIExpbnV4IHY2LjAtcmMxLg0K
DQpUaGFua3MNCi1Jd29uYQ0KDQpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGI1
Mjc2YzkyNDQ5NzcwNWNhOTI3YWQ4NWE3NjNjMzdmMmRlOTgzNDk6DQoNCiAgZHJpdmVyczogbGtk
dG06IGZpeCBjbGFuZyAtV2Zvcm1hdCB3YXJuaW5nICgyMDIyLTA3LTI4IDE2OjIwOjM2ICswMjAw
KQ0KDQphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoNCg0KICBnaXQ6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvaXdpL2xpbnV4LmdpdCB0YWdz
L3BlY2ktbmV4dC02LjAtcmMxDQoNCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBjYWNi
YWM0MzRmNmIwMjBmOTlkNGFmNjQ4ODQzNDY1ZmQ5ZWJhMTY3Og0KDQogIHBlY2k6IGNwdTogRml4
IHVzZS1hZnRlci1mcmVlIGluIGFkZXZfcmVsZWFzZSgpICgyMDIyLTA4LTAzIDAwOjU2OjE3ICsw
MjAwKQ0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tDQpVcGRhdGUgcGVjaS1uZXh0IGZvciB2Ni4wLXJjMQ0KDQpUd28gbWlu
b3IgZml4ZXM6DQoqIGNwdQ0KLSBGaXggdXNlLWFmdGVyLWZyZWUgaW4gYWRldl9yZWxlYXNlKCkN
Cg0KKiBhc3BlZWQNCi0gRml4IGVycm9yIGNoZWNrIGZvciBwbGF0Zm9ybV9nZXRfaXJxKCkNCg0K
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQ0KSXdvbmEgV2luaWFyc2thICgxKToNCiAgICAgIHBlY2k6IGNwdTogRml4IHVzZS1h
ZnRlci1mcmVlIGluIGFkZXZfcmVsZWFzZSgpDQoNCkx2IFJ1eWkgKDEpOg0KICAgICAgcGVjaTog
YXNwZWVkOiBmaXggZXJyb3IgY2hlY2sgcmV0dXJuIHZhbHVlIG9mIHBsYXRmb3JtX2dldF9pcnEo
KQ0KDQogZHJpdmVycy9wZWNpL2NvbnRyb2xsZXIvcGVjaS1hc3BlZWQuYyB8IDIgKy0NCiBkcml2
ZXJzL3BlY2kvY3B1LmMgICAgICAgICAgICAgICAgICAgIHwgMyArLS0NCiAyIGZpbGVzIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCg==
