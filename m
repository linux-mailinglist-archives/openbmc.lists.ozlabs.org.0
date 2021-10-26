Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6BE43B9B7
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 20:38:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hf0v924D3z2yxL
	for <lists+openbmc@lfdr.de>; Wed, 27 Oct 2021 05:38:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=E2Rq7CBX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=E2Rq7CBX; dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hf0tW3Qf4z2yNC
 for <openbmc@lists.ozlabs.org>; Wed, 27 Oct 2021 05:37:37 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="227441359"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="227441359"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 11:36:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="722592998"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP; 26 Oct 2021 11:36:33 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 26 Oct 2021 11:36:33 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 26 Oct 2021 11:36:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 26 Oct 2021 11:36:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xw6ujqGGZ0Lbnu1bQumYU+B266Rcg23gvcT5bdfl8XV7z9a0MAJb51RVdh50/tvsZ/S9RaJI/fJ5UfdjdaOUqHbcdiq+vVlQ3Q89EI3+zJTDlKtr5ZwK0Lg7gu0He2CQqgdIJAqDopWq6kZD4PybtcRicoEMAQ34PYTLJQJllKUx9p/PGsj5R4mtl5ppMPrq2ME+Il2t/p+sANicA1qnHJxd7b2uSL+R5nKJtJHeiEbZ3nFystuei3ORGrOaCT7oFRNSQyHxZRRZoRMz+ayMJMAbFjUz1RwAMAN993dMuG7ly4+acUan28gSHXS2VLwzYioytxr3ntGPSqbdFQzEnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=setO7pTIzu/tU8OMfjoxwNuuU2qMvTHfUVwjOi2RBnc=;
 b=jqANq8RIGxOVAf+pEWOOypuZvznRugCapp0Xb4YfiA4ScGDa0ysivsTynueXkOwcud+rZiwC8YOLkOuHqcqN1QI5MjCQtXf7E3nJaYw6hXSoG9mspBdRRwz0UJsEO30KMDeU+Ey07oN7AdHFzkIkHd6QHuCKhwfCb4ZAAzq+mlCG5OGkGTR+vByvByrcWMFEz9TRCEZtcHf4hXkISS2Dc1AVaPHQn8nZUN6rP0f+NAmR21rAdkLSjJIreCAhaiEM1OwFtajWJFH/u2ZxnesSfFgnk/7EQGRpanGDXVRnpSXqFg6o9UodQWTe046JrkojdFkLNQ3CkZzz1VOZXEL2Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=setO7pTIzu/tU8OMfjoxwNuuU2qMvTHfUVwjOi2RBnc=;
 b=E2Rq7CBXlc0WOrJP1dr4TnfrmjYq+NYGF5UyAuqItUrrGvc11UwgNb0Z6pkVX/1kjopx+v/D5ecAmyAUC+QaDZz1QJy2UeSq/y8W8kQf5QWJh6FgYJt0HVAGjKKEekyCVJOI1//5ZNnQlYEwDcbqizCKoOFjoz/r4kIppVTOqsw=
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by MWHPR11MB1390.namprd11.prod.outlook.com (2603:10b6:300:22::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 18:36:32 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::6553:c7f9:a224:cac1]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::6553:c7f9:a224:cac1%4]) with mapi id 15.20.4628.020; Tue, 26 Oct 2021
 18:36:32 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "61a91bc@gmail.com" <61a91bc@gmail.com>
Subject: Re: kenel module dont enable
Thread-Topic: kenel module dont enable
Thread-Index: AQHXwboS0D+58AIk+0mhW5qv/yvja6vY2X6AgAEdYwCAABf6gIAATNuAgAAKf4CAC0cfAA==
Date: Tue, 26 Oct 2021 18:36:31 +0000
Message-ID: <1f788b07e883b8dd704769d9a33dde9dccff7d13.camel@intel.com>
References: <CAMqwjCA0HFE4O9YHMAG4pxciCGLY5cLPJVdrDiKJMjTtQqrrEA@mail.gmail.com>
 <f06c4b91d9459061e380f860acd89802ab495524.camel@intel.com>
 <CAMqwjCBWB4LT8ZYO6gSY2azR_VoGoFqPj9rrLrR+yK20k7NMKw@mail.gmail.com>
 <CAMqwjCB7GaoNy4eSzrBEOeKCO1zj9fJ1=rZh3j3=AvgXhThfVQ@mail.gmail.com>
 <4f41bc7f0f320a9114d3576c814e99ae8a3015fa.camel@intel.com>
 <CAMqwjCC-=z3ZyVDWcJRsvkMUBGo9QvvrpD=gcpwHGQgDuXKJxA@mail.gmail.com>
In-Reply-To: <CAMqwjCC-=z3ZyVDWcJRsvkMUBGo9QvvrpD=gcpwHGQgDuXKJxA@mail.gmail.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-1.fc34) 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c2e2dcc-e09a-468f-621a-08d998af882f
x-ms-traffictypediagnostic: MWHPR11MB1390:
x-microsoft-antispam-prvs: <MWHPR11MB13904C71AE02BD40E5D6C262EC849@MWHPR11MB1390.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6thbm2f/aNg1ajcQTyS9cMlaoHzNrWdU2ljBGZU7BiS1GtpfTkQwlpEg/DPPXVYvwbaRXEosirlhyrjX7ffZxLtB1dp4Hc8EjEZ+sk8h7PlX/u7bVwQ2rptqsj0+0Cg6iZS/6zCcLs5GoOvJLoyvLOrCb/+xxlLjtN5nGgHx9J4BwMGiPp0/x4PZJMjymjOGmzBmcYXL/uLSIfvsuGYOvVIp3IAaX0xiKgns3pVMRf485Ae/T6NXnSM96OSGrLkPIAp050dOno+bHCl7aP7bH3U2v4XpGSEs3PVgAz7sV/5SjVMItKz1bc7BivfFVENjJHnQiAGDaYoOFe7LYBwTaOfURfjhmU7faSRrFcu5ZDM0CJy+m1Zx47hueinc8Ca1Sm32m/r1puoPJS+6Yhq+VwfvgVP23A9UcBNr/nAwQkTV84tXWvVlpoW6pD9tjE17K/PJNO0qq/DAhUw0x39+g8OnZYVyoSE25MpXXYAxH3tG5tJfWVPeKw4jU8Pyad9KN5gBRZOGDjfVLcLG2KLN5SU5IEjxxCE//bTHT4pmpRJUEBi+SF4hyI8SxayezycNjmruTiVO8iTco7acwoKhedc37bRr5pEWm+wYi66+RFGQd0lbM9ydPWrvRGhY9AC+TBByI49PpKzXYM/hGSbUyqSaA7r5YpBeYGosngOdF+IRk0t2mXUet1mCSPUaZ5GrHhvzocQsGQNjcvKSiUeEPMOQOd2+tp0neOu3gQX3aAXP5MHiX+JlN+cWsLK6KdepY598dbR5qxb2cymDGA/Rr+2Z5syZLL80YfuVlvx98lXdQ9Wgj5jS12XQrAa7k5NlmRNmuJf9/tY0gS4YkvRtvMrmXXtOUrLJ1j+2tUueiDM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5823.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(76116006)(6486002)(91956017)(66946007)(2906002)(66476007)(64756008)(66556008)(66446008)(5660300002)(2616005)(71200400001)(6506007)(53546011)(4001150100001)(6512007)(186003)(508600001)(38070700005)(82960400001)(86362001)(26005)(4326008)(6916009)(966005)(8936002)(122000001)(316002)(36756003)(3480700007)(38100700002)(83380400001)(8676002)(192303002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkltTE0wbU01enNMemhHVk5tbVplQUFaWmhJb1lnOEMwR2tYSWdEWGlzL2R3?=
 =?utf-8?B?OHNocDZVSnozSDJRRG85c25IcVJBMDJHQ1orcXRvQ2pqQ1F3NFQzMWUyVFY0?=
 =?utf-8?B?dmlFMlFiQVJSalQ2UU44QXRWa1pKNUkyY2VCVFhpUlhlS0xlTEdwNWpaWE9V?=
 =?utf-8?B?NDNvMk92V25xQmlXcnBpSUM2L1hDOG5KUGx6ZEpKSEI5T21iblNuK0F0Wk5q?=
 =?utf-8?B?bDFxVlVFNmRxTGVXL0ZyYS9ZM3NING9ENGo2d29PWUVsNlp5S1BCUnV1K1pM?=
 =?utf-8?B?RmFtelR1K3EvcmlqalkrSXhtdXVKWlNxZUE3VUswYmhER29yajRaTi80YUQr?=
 =?utf-8?B?cVpVaHNvQVhkRG5IWS8rR0tVY3JjdkFNTytYYU44NHZGckxRbnBWT1N0ektZ?=
 =?utf-8?B?YkZ2LzZRUHR2SDcrbVVrVW11cWNYdytzNXVnNDdVZlFHSWhZQllQT2IvNExp?=
 =?utf-8?B?VmJCdzVoTTlrT1RMZ2E0SFpHUjZ5TnViYXFvYkFNeGR6TDh3K0ROTWlYek9Z?=
 =?utf-8?B?Q0lKc2VQUElsSlNVbEROS0hXSVpqcTJ6LzVpeG1vQnVGRW9ibWM4OTN1aURo?=
 =?utf-8?B?SU9sUnRmV1diSDJxeEpjOGtaM3A1dFpvY2R6RUVRc3ErTGFyVEtDSUdFVUJs?=
 =?utf-8?B?b2NtY3hrdGhlUlpmUmRFY0R3VVpJWWtMNlp1OGZqTFhHODlnbnVxSERWdzNk?=
 =?utf-8?B?OWFpSGRTcEx2cXdocnJjYzhxNVFjZStoK0J6MFhtb0dvTHh1Q1BVRW1vYnhk?=
 =?utf-8?B?RlhyTjlMaUNIcTMrekhDY3AwRlVwSng3bGJ6T1hUdXlyeWh1NEx2V2xOdC9w?=
 =?utf-8?B?VGExVU9TUVRVRkFMd2ZaRXJFZGZ2QkZIMUF4cEozS0MwVU1WZVlIWDY5ZlBi?=
 =?utf-8?B?Y3JRQ3kwNUFkdmQzTXJKQ3FVeTJWY2haVUNmaStEcytUa0RUbTQ5eG9CaVhM?=
 =?utf-8?B?T2x5WjR6b3o4dzNkQTNpRUh3U3Nia1hsSVBKZEVKMEduUVoyb3N0L1c0Y2Jm?=
 =?utf-8?B?WUpscnNuNkVscTFtZks3RnZ4WW5NV0oxS3JKdTZ5SEdVcW9qWnpUNU9aM0hu?=
 =?utf-8?B?YWlJY1c1Vjh3dmJDanlRYWNNU1lkMUlnTDVMRUc3bEFOR3Y3cDV2NHBxdWpt?=
 =?utf-8?B?dHUxN0oxbEszNFYvTFZISU9ETG9GZEUvK1lZQ2JFdThQQzJBUjY0SlRtamNG?=
 =?utf-8?B?cEVaK2FZdmhHRmhxWklJWC9pbStnMldxcTI2V0xYNURiYVEzM2RhRUtRdjJu?=
 =?utf-8?B?alYrbUpUcmNiYmhpVGJHMlFrTWFZajJabERWOE1zN015T3hBRCt2WjdRNzVp?=
 =?utf-8?B?QW9xTGpaSDZoNHFmS01tM1lIdmxZaHg5U29oZ3hRa1NQMU03aEFidGpwWmh1?=
 =?utf-8?B?NGFQdVk1dFlQSkU3d2JseDJEczFjTVQ3UVVJUE1FbkJEVSthbTlUbEhtZGpx?=
 =?utf-8?B?MzZiVW5EUzFaeWIzZ01UcXJDMkI4b1JJQnVOQ3drUmF0eUUxSVBvdWkwdU8w?=
 =?utf-8?B?dGI3aSt5NWVOSGNOVXduYndCWitHdC9SbERIai9pc3BhVDcvSzZrbmhMQSsv?=
 =?utf-8?B?SkwzaUdKUWswY0hpZ2Z4OCt2cWVFb1BCN0IybVBHUTE2ZnpxTnBqR2pOL1NS?=
 =?utf-8?B?YmNYT0NnY1hTcmxBMmllUTZiRmRkaWxtYzZqTzIwTUNXejI5QzlsbnNVYnF5?=
 =?utf-8?B?WkZsNHhIdE5rK1N0WlFwQ0xUbFIzMG56VXR0U2xaRXg1a2xSc3ZWSDFFOEFm?=
 =?utf-8?B?Q05EMUYvWWlFUXF5ZDRLYW43K3VtYVFjSkQ1OTdLQi9rNlZocjBPbytmak9k?=
 =?utf-8?B?OXNEWWJFNVEzQnFlUnR2WWpDWDFGV2w4L3BURUVFWWhxelJXenh5S1pkNTdv?=
 =?utf-8?B?aUFoKzBRcHpFbVdLSXhZcmh5R0NaMUFCRDBaSkN5Sm8yU1JyZm5henFjMEJX?=
 =?utf-8?B?NVAvbG4xQW9Jc2s4K2R6cXpiblhBNU1weGNyYzhDR09qRXpmSVFXMGdSQlV6?=
 =?utf-8?B?Qm1TSy9lUndiK3FGNmxES0V3N2RoMnNLSWpFMkE0b0lWYno0djhzOUNIYUV1?=
 =?utf-8?B?UkJocC9DMi9zNFlXNzB3SkhFQ2N2Qk40U2JUSWZQWndOd3RoVG9lNFhnV3hH?=
 =?utf-8?B?TWMxVmtEeURFVGE2bW9YT0F6eE9OUHNSVGNUNlAzRGEydGNxcG5QM2xyclJL?=
 =?utf-8?B?TFdhOHdCdjNQcHlyaHFLa04zbzVNRmNNU01nMzl1V1NMaXNsWHB1c0xER1ZL?=
 =?utf-8?Q?OoybjqAUz/F6fIkAMSVM8S/LcMptcEhPkx1eUiHhJE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6BE9D6526960284AB4C3EE45BF136A1F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c2e2dcc-e09a-468f-621a-08d998af882f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2021 18:36:31.9667 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gKmKEy15aG+rreoezutBlO77kgSnohTtwtfALnIEg9xT8FVkd+HVrlZK+tByPp128xoMSQUq5EjMyApo4Sr/mLyxlptMkSjMu4sUogj5pLw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1390
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gVHVlLCAyMDIxLTEwLTE5IGF0IDE3OjIzICswMzAwLCBBbGV4YW5kZXIgUmFpaCB3cm90ZToN
Cj4gUG93ZXIgc3RhdGUgaXMgUzAgc3RhdGUuDQo+IEkgaGF2ZSBpbnRlbCBwbGF0Zm9ybSB3aXRo
IDIgc29ja2V0cy7CoA0KPiAxIHNvY2tldDogaW50ZWwgeGVvbiBicm9uemUNCj4gMiBzb2NrZXQ6
IGVtcHR5DQo+IENoaXBzZXQ6IGxld2lzYnVyZw0KDQpPaywgc28geW91ciBwbGF0Zm9ybSBpcyBp
biBTMCBzdGF0ZSBhbmQgcGVjaSBjbGllbnQgZGV2aWNlIHJlZ2lzdGVyaW5nIGZhaWxlZC4NCkNv
dWxkIHlvdSBjb25maXJtIHRoYXQgZG9pbmc6DQoNCiQgcGVjaV9jbWRzIHBpbmcNCg0KZmFpbHM/
DQoNCklmIGl0IGRvZXMgLSBhcmUgeW91IHN1cmUgdGhhdCB5b3VyIEJNQyBoYXMgcGh5c2ljYWwg
UEVDSSB3aXJlIGNvbm5lY3Rpb24gd2l0aA0KdGhlIENQVT8gSWYgUEVDSSBpcyBub3QgY29ubmVj
dGVkIC0gdGhlcmUncyBub3QgbXVjaCB3ZSBjYW4gZG8gZnJvbSBCTUMgc29mdHdhcmUNCnBlcnNw
ZWN0aXZlLg0KDQotSXdvbmENCg0KPiANCj4g0LLRgiwgMTkg0L7QutGCLiAyMDIxINCzLiDQsiAx
NzowNSwgV2luaWFyc2thLCBJd29uYSA8aXdvbmEud2luaWFyc2thQGludGVsLmNvbT46DQo+ID4g
T24gVHVlLCAyMDIxLTEwLTE5IGF0IDEyOjEwICswMzAwLCBBbGV4YW5kZXIgUmFpaCB3cm90ZToN
Cj4gPiA+IEhpLA0KPiA+ID4gSSB0cnkgdG8gcmVnaXN0ZXIgcGVjaSBkZXZpY2UgaW4gc3lzZnMg
YnV0IEkgaGF2ZSBzYW1lwqBwcm9ibGVtDQo+ID4gPiANCj4gPiA+IFsgwqA4MDAuMzM5NjA1XSBw
ZWNpIHBlY2ktMDogRmFpbGVkIHRvIHJlZ2lzdGVyIHBlY2kgY2xpZW50IHBlY2ktY2xpZW50IGF0
DQo+ID4gMHgzMA0KPiA+ID4gKC01KQ0KPiA+IA0KPiA+IFdlcmUgeW91IGFibGUgdG8gY29uZmly
bSB0aGF0IHlvdXIgcGxhdGZvcm0gaXMgaW4gUzAgcG93ZXIgc3RhdGUgYmVmb3JlIHlvdQ0KPiA+
IHRyaWVkIHRoaXM/DQo+ID4gDQo+ID4gQ291bGQgeW91IHNoYXJlIGRldGFpbHMgYWJvdXQgSW50
ZWwgUGxhdGZvcm0vQ1BVIHRoYXQgeW91J3JlIHVzaW5nPw0KPiA+IA0KPiA+IC1Jd29uYQ0KPiA+
IA0KPiA+ID4gDQo+ID4gPiANCj4gPiA+IA0KPiA+ID4gDQo+ID4gPiANCj4gPiA+INCy0YIsIDE5
INC+0LrRgi4gMjAyMSDQsy4g0LIgMTA6NDQsIEFsZXhhbmRlciBSYWloIDw2MWE5MWJjQGdtYWls
LmNvbT46DQo+ID4gPiA+IFRoYW5rcywgSXdvbmENCj4gPiA+ID4gSSB3aWxsIHRyeSB0aGlzLg0K
PiA+ID4gPiANCj4gPiA+ID4gQmVzdCByZWdhcmRzLA0KPiA+ID4gPiBBbGV4DQo+ID4gPiA+IA0K
PiA+ID4gPiDQv9C9LCAxOCDQvtC60YIuIDIwMjEg0LMuINCyIDE3OjQzLCBXaW5pYXJza2EsIEl3
b25hDQo+ID4gPiA+IDxpd29uYS53aW5pYXJza2FAaW50ZWwuY29tPjoNCj4gPiA+ID4gPiBIaSBB
bGV4LA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IChpbiB0aGUgZnV0dXJlLCBwbGVhc2UgQ2M6IG9w
ZW5ibWMgbWFpbGluZyBsaXN0KQ0KPiA+ID4gPiA+IMKgwqANCj4gPiA+ID4gPiBUaGlzIG1heSBv
Y2N1ciB3aGVuIENQVSBjYW7igJl0IGJlIGRldGVjdGVkIC0gaXMgeW91ciBwbGF0Zm9ybSBpbiBT
MA0KPiA+ID4gPiA+IHBvd2VyDQo+ID4gPiA+ID4gc3RhdGU/DQo+ID4gPiA+ID4gQk1DIHVzdWFs
bHkgaXMgYm9vdGVkIGJlZm9yZSB0aGUgcGxhdGZvcm0gZ29lcyB0byBTMCwgc28gSSB3b3VsZA0K
PiA+IHJlY29tbWVuZA0KPiA+ID4gPiA+IHJlZ2lzdGVyaW5nIHBlY2ktY2xpZW50IG1hbnVhbGx5
ICh1c2luZyBzeXNmcykgcmF0aGVyIHRoYW4gdXNpbmcgRFRTLg0KPiA+ID4gPiA+IMKgDQo+ID4g
PiA+ID4gIyBlY2hvIHBlY2ktY2xpZW50IDB4MzAgPiAvc3lzL2J1cy9wZWNpL2RldmljZXMvcGVj
aS0wL25ld19kZXZpY2UNCj4gPiA+ID4gPiDCoA0KPiA+ID4gPiA+IE9yIGlmIHlvdeKAmXJlIHVz
aW5nIGRidXMtc2Vuc29ycywgcGVjaS1jbGllbnQgZGV2aWNlcyBhcmUgZXhwb3J0ZWQNCj4gPiA+
ID4gPiB0aGVyZToNCj4gPiA+ID4gPiANCj4gPiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9k
YnVzLXNlbnNvcnMvYmxvYi9tYXN0ZXIvc3JjL0NQVVNlbnNvck1haW4uY3BwI0w0MDYNCj4gPiA+
ID4gPiANCj4gPiA+ID4gPiAtLQ0KPiA+ID4gPiA+IE5vdGUgdGhhdCBQRUNJIHN1YnN5c3RlbSB5
b3XigJlyZSB1c2luZyBpcyBzdWJqZWN0IHRvIGNoYW5nZSBpbiB0aGUNCj4gPiBmdXR1cmU6DQo+
ID4gPiA+ID4gDQo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIxMDgwMzExMzEz
NC4yMjYyODgyLTEtaXdvbmEud2luaWFyc2thQGludGVsLmNvbS8NCj4gPiA+ID4gPiDCoA0KPiA+
ID4gPiA+IC1Jd29uYQ0KPiA+ID4gPiA+IMKgDQo+ID4gPiA+ID4gRnJvbTogQWxleGFuZGVyIFJh
aWggPDYxYTkxYmNAZ21haWwuY29tPiANCj4gPiA+ID4gPiBTZW50OiBGcmlkYXksIE9jdG9iZXIg
MTUsIDIwMjEgMTo0NiBQTQ0KPiA+ID4gPiA+IFRvOiBZb28sIEphZSBIeXVuIDxqYWUuaHl1bi55
b29AaW50ZWwuY29tPjsgV2luaWFyc2thLCBJd29uYQ0KPiA+ID4gPiA+IDxpd29uYS53aW5pYXJz
a2FAaW50ZWwuY29tPg0KPiA+ID4gPiA+IFN1YmplY3Q6IGtlbmVsIG1vZHVsZSBkb250IGVuYWJs
ZQ0KPiA+ID4gPiA+IMKgDQo+ID4gPiA+ID4gSGVsbG8sDQo+ID4gPiA+ID4gSSB1c2UgaW50ZWwg
a2VybmVsIG1vZHVsZSBwZWNpLiBJbiBkdGIgSSBoYXZlIHRoaXMgZGVzY3JpYmUgYWJvdXQNCj4g
PiA+ID4gPiBwZWNpOsKgDQo+ID4gPiA+ID4gwqANCj4gPiA+ID4gPiDCoA0KPiA+ID4gPiA+IGJ1
c0AxZTc4YjAwMCB7DQo+ID4gPiA+ID4gY29tcGF0aWJsZSA9ICJzaW1wbGUtYnVzIjsNCj4gPiA+
ID4gPiAjYWRkcmVzcy1jZWxscyA9IDwweDAxPjsNCj4gPiA+ID4gPiAjc2l6ZS1jZWxscyA9IDww
eDAxPjsNCj4gPiA+ID4gPiByYW5nZXMgPSA8MHgwMCAweDFlNzhiMDAwIDB4NjA+Ow0KPiA+ID4g
PiA+IHBlY2ktYnVzQDAgew0KPiA+ID4gPiA+IGNvbXBhdGlibGUgPSAiYXNwZWVkLGFzdDI1MDAt
cGVjaSI7DQo+ID4gPiA+ID4gcmVnID0gPDB4MDAgMHg2MD47DQo+ID4gPiA+ID4gI2FkZHJlc3Mt
Y2VsbHMgPSA8MHgwMT47DQo+ID4gPiA+ID4gI3NpemUtY2VsbHMgPSA8MHgwMD47DQo+ID4gPiA+
ID4gaW50ZXJydXB0cyA9IDwweDBmPjsNCj4gPiA+ID4gPiBjbG9ja3MgPSA8MHgwMiAweDA2PjsN
Cj4gPiA+ID4gPiByZXNldHMgPSA8MHgwMiAweDA2PjsNCj4gPiA+ID4gPiBjbG9jay1mcmVxdWVu
Y3kgPSA8MHgxNmUzNjAwPjsNCj4gPiA+ID4gPiBtc2ctdGltaW5nID0gPDB4MDE+Ow0KPiA+ID4g
PiA+IGFkZHItdGltaW5nID0gPDB4MDE+Ow0KPiA+ID4gPiA+IHJkLXNhbXBsaW5nLXBvaW50ID0g
PDB4MDg+Ow0KPiA+ID4gPiA+IGNtZC10aW1lb3V0LW1zID0gPDB4M2U4PjsNCj4gPiA+ID4gPiBz
dGF0dXMgPSAib2theSI7DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gcGVjaS1jbGllbnRAMzAgew0K
PiA+ID4gPiA+IGNvbXBhdGlibGUgPSAiaW50ZWwscGVjaS1jbGllbnQiOw0KPiA+ID4gPiA+IHJl
ZyA9IDwweDMwPjsNCj4gPiA+ID4gPiB9Ow0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IHBlY2ktY2xp
ZW50QDMxIHsNCj4gPiA+ID4gPiBjb21wYXRpYmxlID0gImludGVsLHBlY2ktY2xpZW50IjsNCj4g
PiA+ID4gPiByZWcgPSA8MHgzMT47DQo+ID4gPiA+ID4gfTsNCj4gPiA+ID4gPiB9Ow0KPiA+ID4g
PiA+IH07DQo+ID4gPiA+ID4gwqANCj4gPiA+ID4gPiDCoA0KPiA+ID4gPiA+IEkgaGF2ZSB0aGlz
IGVycm9yIGluIGRtZXNnOg0KPiA+ID4gPiA+IFsgwqAgwqAyLjUxNjM4M10gcGVjaSBwZWNpLTA6
IEZhaWxlZCB0byByZWdpc3RlciBwZWNpIGNsaWVudCDCoGF0IDB4MzAgKC0NCj4gPiA+ID4gPiA1
KQ0KPiA+ID4gPiA+IFsgwqAgwqAyLjUyNjc2N10gcGVjaSBwZWNpLTA6IEZhaWxlZCB0byBjcmVh
dGUgUEVDSSBkZXZpY2UgZm9yDQo+ID4gPiA+ID4gL2FoYi9hcGIvYnVzQDFlNzhiMDAwL3BlY2kt
YnVzQDAvcGVjaS1jbGllbnRAMzANCj4gPiA+ID4gPiDCoA0KPiA+ID4gPiA+IEhvdyBJIGNhbiBy
ZXNvbHZlIHRoaXMgPw0KPiA+ID4gPiA+IMKgDQo+ID4gPiA+ID4gYmVzdCByZWdhcmRzLA0KPiA+
ID4gPiA+IGFsZXgNCj4gPiANCg0K
