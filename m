Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5684A340BCB
	for <lists+openbmc@lfdr.de>; Thu, 18 Mar 2021 18:27:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1YrN28Sjz3by7
	for <lists+openbmc@lfdr.de>; Fri, 19 Mar 2021 04:27:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=uR6UQD7M;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=zhikui.ren@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=uR6UQD7M; dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1Yr452Ggz2yRP
 for <openbmc@lists.ozlabs.org>; Fri, 19 Mar 2021 04:27:30 +1100 (AEDT)
IronPort-SDR: z8puKQ0wsd3ng3y0DIUwrXpaZ3kUVmX2ZMc6MMq7u/DsAl8lKpSSc+XbO+6Fb0G1jPGZYN597E
 IYD+BsvIivew==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="274791496"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="274791496"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 10:27:03 -0700
IronPort-SDR: 2Ul5SSINHEK7NMw1igfWY1OK5hDGyqNW0jyEIJB2sj+43KEPX2AqxAcXU7U5f65lCrEdvj2xcK
 z7ZwgIhqDCcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="602792751"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 18 Mar 2021 10:27:03 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 18 Mar 2021 10:27:02 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 18 Mar 2021 10:27:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Thu, 18 Mar 2021 10:27:02 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Thu, 18 Mar 2021 10:27:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aSrWvi2pOvP7YGJpCkpCtnp+OZZhWtg2j2lrImSYKZlMta3jIAlUSzzJt+U2eEIkFyZbN6IyopPPdR84FSDTmW0Iid0in2BtIKsWgkcB9vZ4qeNphj3ySEVHuJmEqNjVEYoOB6LCIOj+SVBD5jQW1nh3FvLHsPjp2cmtrzum+ef8ZwjQWMAPJHCxS3444vvsM7NuupTWhxtgjX2Fi6OIcpCS77W9QuReQtbf4bBTNP9D8IwPHoE/8rQISjMJkN9wE1QuEClRQOq8BzONz6WbOafEh/clfGJNMDAmlXF8g5VqmF/i9w4D76yGeYedqGomqdCPTARjGuJNwvH6U0+OdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5IDhpNZwbOLlDGb/Z9tz7VMp078mcsN6znOc6V6Mkk4=;
 b=gO+u055dBbIDVG3j3qPr+mJgoBTuZlSKv3Rl1t/Uy080VQtkS4ktph3HY4AWlclG3zj3gBL7xp4AiHYa2IpT2T3B5G0UoTjeBuYBraS1YJNQHUTDY1NisANlPpQLBfZrEcoE694Rya4xT6INuv5TSP7+DmnpO1DrcYDVhyqjVcKpDNJdnlgmovp6L7Su4tENlY6v/1jevgKRV3/RPqF1aZjCeZ//M5c5ruIBeXqzjYShsUcWFiOW6bINYy3AHkNcEEQd/zw3daARieyUpRoqFoWqYJJfDa+jafmYXlyAwp8bDnxA//34bs/qdn6USnRgtknkGynD8QygIu0p8wwH1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5IDhpNZwbOLlDGb/Z9tz7VMp078mcsN6znOc6V6Mkk4=;
 b=uR6UQD7MO0X+d3aYoFP1+nhFB7jYx5E4vqCUfTBPfzNBMr8eiIv3tlINtnaqS9FwwG0s+ccP/LlzdLPWwSOUCbJgYrO2dgNNA/johHJQqpwY61+0pZM6qz3KrD693UshXGgKU8iNPE/5NRaM8TjIWrtLDJmX4Uo6XZUmQ9mAxio=
Received: from DM6PR11MB4410.namprd11.prod.outlook.com (2603:10b6:5:1d9::11)
 by DM6PR11MB3036.namprd11.prod.outlook.com (2603:10b6:5:6f::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Thu, 18 Mar
 2021 17:26:58 +0000
Received: from DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::d040:bf81:df34:7648]) by DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::d040:bf81:df34:7648%3]) with mapi id 15.20.3933.032; Thu, 18 Mar 2021
 17:26:58 +0000
From: "Ren, Zhikui" <zhikui.ren@intel.com>
To: Ed Tanous <edtanous@google.com>
Subject: RE: Negative value returns for sensor in tiogapass
Thread-Topic: Negative value returns for sensor in tiogapass
Thread-Index: AdcMHNUlzX6I6Je8Q2WRGNkpWs0ATgAP1CQAAeFPK8AAFO7oAAAoI65QAYo5M+AAFhb5oAAuk68AAAH/PTA=
Date: Thu, 18 Mar 2021 17:26:58 +0000
Message-ID: <DM6PR11MB441073C8A728B64BAA84733D94699@DM6PR11MB4410.namprd11.prod.outlook.com>
References: <SG2PR04MB30939CC20F08C50A7031DBA5E19D9@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <CAH2-KxA4tQvaxzFcAWYhYrq9WeCLrLTRdknZW66XUBzOipoFrg@mail.gmail.com>
 <SG2PR04MB3093F7CA1D6801FDF9D6C5BAE1939@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <CACWQX80yb9PiT5S=rg_xOBiqJgETwRHekN=dE18rtxKKPuWfPA@mail.gmail.com>
 <SL2PR04MB30975F3703CAFEFBC1328025E1929@SL2PR04MB3097.apcprd04.prod.outlook.com>
 <SG2PR04MB30938BD2D16A0956E2BEEFD6E16A9@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <DM6PR11MB441097913A35ADC1B63974E5946A9@DM6PR11MB4410.namprd11.prod.outlook.com>
 <CAH2-KxAva6Sz6Q7GN-B8Tat+K855M1LZ2FiTcqxx7Smui=MqNA@mail.gmail.com>
In-Reply-To: <CAH2-KxAva6Sz6Q7GN-B8Tat+K855M1LZ2FiTcqxx7Smui=MqNA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: request-justification,no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.11.44.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: afb24376-7013-4a8d-e7f0-08d8ea3308b1
x-ms-traffictypediagnostic: DM6PR11MB3036:
x-microsoft-antispam-prvs: <DM6PR11MB303640A752B8F8A92330229C94699@DM6PR11MB3036.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uy5Leh+nYu41UhJHK5s4osuOLgR/5L5AHJiN6k3DQT8fLK91hcIlkcTgi1JPl90d5nvouHYZpeiPJjIMRJ7RuQ/4DfGuFo3jio3ik4ykYShp+xaFydoygrzAqXzzMunI0LqgxTBIyDugtqjkcqAq5pegJNnSogaQ9D+ZWumRVVxMi1eklyMq3P05S5mA7SF4viyeMVJzie/FBmNO9DMSvLKStOMpLpvcs03K89Sv2mqRQYrqNf07tv3NtvV9IzRuSAa3J3bqzIiuZnx8cTgrK3p8naBAvDtBY3QE7A5SC1k3tNV0gM1c6APmT8Va9bL0jygj0TpMA/b1yCdpGVPFKqs2cUfGVtCun8j1MCOu5FpbZAnZYlrGy0B1dqfirPQoOw/YOE2prVYT0y24pEIgmS0Ectx7VT07O55mY9gVOPp0UvM4MDJYvsMDKKMa5WWh774bFED8RZPDlXJ02fFWRxDjzSGrJIctrlCECMS/8yXHDJaj/UCGVQEIEE808d9fWYmcFJgH6/9/4LaFN0WC24ZwD8vzphCuvpqVrS4pBxF0KVQBF2AY9E0DA3C4iA+O60rBvnfitIW+1kYZ44/QmRi50E61PCC4Rx27GeqHDeyFgNn2DXnaezZaZr2RCgOfjj1vy2uWxKd7uab5/ndC+/hb+COnbJFYnoVG6KXshoZRIfld0msr5PuxlWEMGre5YGRhJCSMHP60KVor81Us5w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(39860400002)(136003)(396003)(346002)(966005)(66446008)(8676002)(83380400001)(478600001)(52536014)(316002)(66946007)(9686003)(5660300002)(76116006)(66476007)(55016002)(38100700001)(66556008)(64756008)(71200400001)(33656002)(86362001)(54906003)(53546011)(6506007)(45080400002)(26005)(4326008)(6916009)(2906002)(7696005)(8936002)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?dDlLVmYyWFR2R0ovWnhxOXpSSXBHa29CaUoxNDlhQVhuUlE4NGxWbnFLbnVj?=
 =?utf-8?B?VUd5TFhaTEZISlkvbjJKRnFlSEtxaStWUHJlSVJJSXlWdytaNTREdmRpQjh2?=
 =?utf-8?B?NllDZHo1NWpZeC9RbWRoQzdzNyt5S2dqZFptVHhjMFdSeHM0NTN5U1NoQkpI?=
 =?utf-8?B?NHV3MzRiZmx6WDNuQlBDazhmdVZpd1NGVHVtTndPdVFwTWRxY3VpRnllYkJQ?=
 =?utf-8?B?SnB5QXhmMU1VaEpSanhDd3F5VFNuZG9IZVcwK2U1RGcxa25adEY1cUl4dCsz?=
 =?utf-8?B?QXNGbHkrbExMVWp4ZDVNWmV1TUQ4ZzNmMmdhcnVNbWg5VVI0M1gvbWg3MVB3?=
 =?utf-8?B?VmtRL05uNHBwYkR5V2gxRkJtVEE4aGtLbEc3dlFESTYyUEVBZVA2SHlBY2NY?=
 =?utf-8?B?aTR4QjUvN29aNVowTExPclExOEdoYzY4QkdOS01JczZBV1doUU5YR05DWWhx?=
 =?utf-8?B?ek1kZU5maHIxMmNlQUNmRE8zSndhWnVjN2I1WEY2cmJwd1IydW8yL1dyUUo4?=
 =?utf-8?B?eFh3czdDeHNDcjl6ZnVLMUpXMURYc1NJQWtqc2Q1dVEvK3lVSVBxMExveXJa?=
 =?utf-8?B?b0tvWUd1d2NHVEN6Y0pMNVNQMnczS1RHMnphMURXVDRXcVJhcU1aVzdhM0o2?=
 =?utf-8?B?dVpvT1E2OUFtMlJKVDJBYWV2TkZhYlpmRXo0b2dLakQ1SDFjYzVDeDFFZXFT?=
 =?utf-8?B?T2VrR2I4cU9nbGFlaW9zc1A0aEtvajBZOEpHMzhUTW1ZRXRSTHN6QXdrR2dX?=
 =?utf-8?B?V3Y4U2pYcFM1cHFWaElyeTVDaHAvdDl1SmxOdGt6dTZDUnMzK01XSG9kS1F3?=
 =?utf-8?B?MnJQMHdicm9lVUFMcmUrcjlhY00vZ0tabldQa09KelpqNm5rdEx5N3k4dlc1?=
 =?utf-8?B?Y3RXWUY2R0lkeWlrMm4xampLdTVsMkpGSFI2Q1hHVWFkY0VpeE8zRkw2VTRp?=
 =?utf-8?B?UTNSZkI4L0ZsdWVYNkxGNWZNTlk0Y1VDZzA4cllKNnpNY3ZEbS9qbmtkdjF0?=
 =?utf-8?B?bjJadFJkUEFKT1dKcjAvZjNxT0JrRUxFS1FKZWN3cm00YTBZYWVVbkx2M1g5?=
 =?utf-8?B?Q1h4NEV2OUUzWExpQzdTQS9sWCt1UzEvbGNNdjlXVEh5STQ3aWlXSURMYVJt?=
 =?utf-8?B?THBJZWNxT0p4UkZISUJEeU1kNjJQY0xGQm05R1NZVGhhVTZscWFFMGQxMkxF?=
 =?utf-8?B?LzQ5eFp3bFJaaGZTdHJCbHkrM24xUmdpdG14bEtybE9UekFhZmoyZ0NCRTA0?=
 =?utf-8?B?NzZtWDJMVDRKMExpODZvenVtdnFYTy90ZG9reTBEN3d6aUl2VkNWbmY4Um5Q?=
 =?utf-8?B?WlIzY3ZQc0ZqdHB2WFExZmVjWVZsZzM0Rlg3dGV2OW9MS2gvVkhPSzlrc0hL?=
 =?utf-8?B?ajU1Q0hTZnVwZTNRSlMvZThPSHdKTnVwMk9nK1FOSi9sMmxYWWt3Z0ZBdVJT?=
 =?utf-8?B?cTdQdWRVTHI5cGxnWSsvdjl4VmZpWXlNWlpFRy9JV3VnOGtHczhaQzlsS3Nq?=
 =?utf-8?B?Tys1M1hHUmJLVnVzejVVeFY0RkNhdXJhUVdlOU9TWE9KclVSTDVxemVMT201?=
 =?utf-8?B?RkN6UlFvWEltaHFSc2xYRXhrLzVtRHhCYnlnL3pwZlpDQmE1djYvZFJuR3Rz?=
 =?utf-8?B?UjdqZkxtbW53TC9ydkNxc29RVWs0cHBVYkRaTEpQUmExNWI0aEpvbU5GWXlT?=
 =?utf-8?B?OVVxcnFBY2FDaFZNVDBXd3NWZFZrVWlxNkNoSUlrTUxlUEU0dE82Mm9UeS8v?=
 =?utf-8?Q?HsGGFYoeEE3yAWw8v8=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afb24376-7013-4a8d-e7f0-08d8ea3308b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2021 17:26:58.1674 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8dYmJMtTqfWpvsI2Di0DYYGwKNsSsSb+S7CVl7fASIjS0TOSqOG7mdA/PESDhHLopIA7kVSFsIJeXh4y6v5pxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3036
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Jayashree D <jayashree-d@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEVkIFRhbm91cyA8ZWR0YW5v
dXNAZ29vZ2xlLmNvbT4NCj5TZW50OiBUaHVyc2RheSwgTWFyY2ggMTgsIDIwMjEgOToxMSBBTQ0K
PlRvOiBSZW4sIFpoaWt1aSA8emhpa3VpLnJlbkBpbnRlbC5jb20+DQo+Q2M6IEpheWFzaHJlZSBE
IDxqYXlhc2hyZWUtZEBoY2wuY29tPjsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQo+U3ViamVj
dDogUmU6IE5lZ2F0aXZlIHZhbHVlIHJldHVybnMgZm9yIHNlbnNvciBpbiB0aW9nYXBhc3MNCj4N
Cj5PbiBXZWQsIE1hciAxNywgMjAyMSBhdCAxMToxOCBBTSBSZW4sIFpoaWt1aSA8emhpa3VpLnJl
bkBpbnRlbC5jb20+IHdyb3RlOg0KPj4NCj4+DQo+Pg0KPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4+IEZyb206IG9wZW5ibWMgPG9wZW5ibWMtYm91bmNlcyt6aGlrdWkucmVuPWludGVs
LmNvbUBsaXN0cy5vemxhYnMub3JnPg0KPj4gT24gQmVoYWxmIE9mIEpheWFzaHJlZSBEDQo+PiBT
ZW50OiBXZWRuZXNkYXksIE1hcmNoIDE3LCAyMDIxIDEyOjM5IEFNDQo+PiBUbzogRWQgVGFub3Vz
IDxlZHRhbm91c0Bnb29nbGUuY29tPg0KPj4gQ2M6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0K
Pj4gU3ViamVjdDogUkU6IE5lZ2F0aXZlIHZhbHVlIHJldHVybnMgZm9yIHNlbnNvciBpbiB0aW9n
YXBhc3MNCj4+DQo+PiBDbGFzc2lmaWNhdGlvbjogUHVibGljDQo+Pg0KPj4gSGkgRWQsDQo+Pg0K
Pj4gUE1CdXMgc3BlYyBvbmx5IGhhdmUgcmVhZCBhbmQgd3JpdGUgZm9ybWF0LiBJbiB0aGUgYmVs
b3cgbGluaywgUFhFIFZSIHVzZXMNCj4xMSBiaXQgZm9ybWF0LiBBbHNvIHNpZ24gZXh0ZW5kIHRo
ZSAxMWJpdCByZWFkaW5nIHNvIHRoYXQgbmVnYXRpdmVzIHNob3cNCj5jb3JyZWN0bHkuDQo+Pg0K
Pj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvZGJ1cy0NCj5zZW5zb3JzL2NvbW1pdC9lNGE5
NzBkOWFlYTk3YzdjMWExMWM2Mw0KPj4gMjE1ZTdkM2NkYTIxMjRlNTQjZGlmZi0NCj4xMzU2Nzhk
ZDIwNDY5MzVjNWRkMGJlOGU1YTVhNTI5ZDMzMjMxMjAzMTQ5ZTc4Ng0KPj4gZDU3YjE1YTNjYzBj
YzEyNDANCj4+DQo+PiAgICAgICAgICAgICBjb25zdGV4cHIgY29uc3Qgc2l6ZV90IHNoaWZ0ID0g
MTYgLSAxMTsgLy8gMTFiaXQgaW50byAxNmJpdA0KPj4gICAgICAgICAgICAgdmFsdWUgPDw9IHNo
aWZ0Ow0KPj4gICAgICAgICAgICAgdmFsdWUgPj49IHNoaWZ0Ow0KPj4NCj4+IENvdWxkIGFueW9u
ZSBmcm9tIHRoZSBpbnRlbCB0ZWFtIGNhbiBjbGFyaWZ5IHRoZSBuZWVkIG9mIGFib3ZlIGxvZ2lj
IHVzZWQgaW4NCj5JcG1iU2Vuc29yLg0KPj4NCj4+IFtSZW4sIFpoaWt1aV0gIFRoaXMgY2hhbmdl
IHdhcyBtYWRlIHRvIGFsbG93IG5lZ2F0aXZlIG51bWJlcnMgYmUgcmVwb3J0ZWQNCj5jb3JyZWN0
bHkuICBUaGlzIGNhbiBoYXBwZW4gZHVyaW5nIHRlc3QuIFdpdGhvdXQgdGhlIGNoYW5nZSwgMjU1
ZGVncmVlIHdpbGwgYmUNCj5yZXBvcnRlZCBhbmQgdHJpcCB0aHJlc2hvbGQgZXZlbnQgaW5jb3Jy
ZWN0bHkuDQo+DQo+Q2FuIHlvdSB3YWxrIHRocm91Z2ggd2hhdCB5b3VyIHRlc3Qgd2FzPyAgSXQn
cyBzb3VuZGluZyBsaWtlIEpheWFzaHJlZSB3YXMNCj5zZWVpbmcgaW5jb3JyZWN0IHZhbHVlcyBp
biBhIHJlYWwgd29ybGQgYXBwbGljYXRpb24uICBJcyBpdCBwb3NzaWJsZSB3ZSBmaXhlZA0KPnNv
bWV0aGluZyBpbiBhIHRlc3QgYnkgYnJlYWtpbmcgc29tZXRoaW5nIGluIHRoZSByZWFsIHdvcmxk
PyAgQ2FuIHlvdSB0aGluayBvZg0KPmFueSBvdGhlciByZWFzb25zIHdoeSBvdGhlcnMgd291bGQg
YmUgc2VlaW5nIGRpZmZlcmVudCBiZWhhdmlvcj8NCj4NCltSZW4sIFpoaWt1aV0gVGhlIGlzc3Vl
IGhlcmUgaXMgdGhlIHR3byBkZXZpY2UncyB0ZW1wZXJhdHVyZXMgYXJlIG5vdCBvZiB0aGUgc2Ft
ZSBmb3JtYXQuDQpQWEUxNDEwIHVzZXMgUE1CdXMgTElORUFSMTEgZm9ybWF0LCB3aGVyZSB0aGUg
bWFudGlzc2EgIGlzIGEgc2lnbmVkIDExLWJpdCAy4oCZcyBjb21wbGVtZW50IGludGVnZXIuDQpB
RE0xMjc4IHRlbXBlcmF0dXJlIGlzIDExIGJpdCwgYnV0IG5vdCB3aXRoIExJTkVBUjExIGZvcm1h
dC4gDQpXZSBzaG91bGQgcmVuYW1lIHRoZSBjdXJyZW50IGVsZXZlbkJpdCB0byAgbGluZWFyRWxl
dmVuQml0IGFuZCBhZGQgZWxldmVuQml0IHdpdGhvdXQgdGhlIHNpZ24gZXh0ZW5zaW9uIGZvciBB
RE0xMjc4LiANCg0KPj4gRXhwb25lbnQgZGF0YSBpcyBub3QgdXNlZCBiZWNhdXNlIGl0IGlzIGFs
d2F5cyAwLg0KPj4NCj4+IFJlZ2FyZHMsDQo+PiBKYXlhc2hyZWUNCj4+DQo+PiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPj4gRnJvbTogSmF5YXNocmVlIEQNCj4+IFNlbnQ6IFR1ZXNkYXks
IE1hcmNoIDksIDIwMjEgNDo0OCBQTQ0KPj4gVG86IEVkIFRhbm91cyA8ZWRAdGFub3VzLm5ldD4N
Cj4+IENjOiBFZCBUYW5vdXMgPGVkdGFub3VzQGdvb2dsZS5jb20+OyBvcGVuYm1jQGxpc3RzLm96
bGFicy5vcmcNCj4+IFN1YmplY3Q6IFJFOiBOZWdhdGl2ZSB2YWx1ZSByZXR1cm5zIGZvciBzZW5z
b3IgaW4gdGlvZ2FwYXNzDQo+Pg0KPj4gQ2xhc3NpZmljYXRpb246IFB1YmxpYw0KPj4NCj4+IFRo
YW5rcyBFZCwgSSdsbCBjaGVjayBpdCBvdXQuDQo+Pg0KPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4+IEZyb206IEVkIFRhbm91cyA8ZWRAdGFub3VzLm5ldD4NCj4+IFNlbnQ6IE1vbmRh
eSwgTWFyY2ggOCwgMjAyMSA5OjM3IFBNDQo+PiBUbzogSmF5YXNocmVlIEQgPGpheWFzaHJlZS1k
QGhjbC5jb20+DQo+PiBDYzogRWQgVGFub3VzIDxlZHRhbm91c0Bnb29nbGUuY29tPjsgb3BlbmJt
Y0BsaXN0cy5vemxhYnMub3JnDQo+PiBTdWJqZWN0OiBSZTogTmVnYXRpdmUgdmFsdWUgcmV0dXJu
cyBmb3Igc2Vuc29yIGluIHRpb2dhcGFzcw0KPj4NCj4+IFtDQVVUSU9OOiBUaGlzIEVtYWlsIGlz
IGZyb20gb3V0c2lkZSB0aGUgT3JnYW5pemF0aW9uLiBVbmxlc3MgeW91DQo+PiB0cnVzdCB0aGUg
c2VuZGVyLCBEb24ndCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIGFzIGl0IG1heSBi
ZSBhDQo+PiBQaGlzaGluZyBlbWFpbCwgd2hpY2ggY2FuIHN0ZWFsIHlvdXIgSW5mb3JtYXRpb24g
YW5kIGNvbXByb21pc2UgeW91cg0KPj4gQ29tcHV0ZXIuXQ0KPj4NCj4+IE9uIFN1biwgTWFyIDcs
IDIwMjEgYXQgMTA6MTcgUE0gSmF5YXNocmVlIEQgPGpheWFzaHJlZS1kQGhjbC5jb20+IHdyb3Rl
Og0KPj4gPg0KPj4gPiBDbGFzc2lmaWNhdGlvbjogUHVibGljDQo+PiA+DQo+PiA+IEhpIEVkLA0K
Pj4gPg0KPj4gPiBJbiB0aGUgYmVsb3cgbGluaywgUFhFMTQxMENWUiBhbmQgQURNMTI3OEhTQyBh
cmUgdXNpbmcgdGhlIHNhbWUNCj5yZWFkaW5nIGZvcm1hdC4NCj4+ID4gSSBhbSBub3QgYWJsZSB0
byBmaW5kIGFueSBpbmZvcm1hdGlvbiBvbiBQWEUxNDEwQ1ZSLiBJZiB0aGVyZSBpcyBhbnkgc3Bl
Yw0KPmF2YWlsYWJsZSwgY291bGQgeW91IHBsZWFzZSBzaGFyZSBpdC4NCj4+ID4gSXQgd2lsbCBi
ZSBoZWxwZnVsIHRvIGFuYWx5emUgYm90aCB0aGUgc3BlY3MgYW5kIGZpeCB0aGUgcHJvYmxlbS4N
Cj4+DQo+PiBJIGRvbid0IGhhdmUgYW55IHNwZWNzIGF2YWlsYWJsZSBmb3IgdGhvc2UuICBJIHdv
dWxkIGFzc3VtZSB0aGV5IGZvbGxvdyB0aGUNCj5wbWJ1cyBzcGVjIHRob3VnaCwgeW91IG1pZ2h0
IHN0YXJ0IHRoZXJlLg0KPj4NCj4+ID4NCj4+ID4gaHR0cHM6Ly9hcGMwMS5zYWZlbGlua3MucHJv
dGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2kNCj4+ID4gdGgNCj4+ID4g
dWIuY29tJTJGb3BlbmJtYyUyRmRidXMtDQo+c2Vuc29ycyUyRmJsb2IlMkZtYXN0ZXIlMkZzcmMl
MkZJcG1iU2Vuc29yLmMNCj4+ID4gcHANCj4+ID4gJTIzTDE0NCZhbXA7ZGF0YT0wNCU3QzAxJTdD
amF5YXNocmVlLQ0KPmQlNDBoY2wuY29tJTdDODY3NmQzMGY0ZDNhNGRkYTENCj4+ID4gZTANCj4+
ID4NCj5lMDhkOGUyNGM0OTU3JTdDMTg5ZGU3MzdjOTNhNGY1YThiNjg2ZjRjYTk5NDE5MTIlN0Mw
JTdDMCU3QzYzNzUwOA0KPjE2NA0KPj4gPiA1Ng0KPj4gPg0KPjg3NzUyNDglN0NVbmtub3duJTdD
VFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYyDQo+bHVNeklpDQo+PiA+
IExDDQo+PiA+DQo+SkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzEwMDAmYW1wO3NkYXRh
PTVsaHVVZGZJJTJCRzc1QzhJMQ0KPkhEQWENCj4+ID4gRUgNCj4+ID4gVlA0NiUyQnoxcjNuSlYw
ZWszQ2lpUjQlM0QmYW1wO3Jlc2VydmVkPTANCj4+ID4NCj4+ID4gUmVnYXJkcywNCj4+ID4gSmF5
YXNocmVlDQo+PiA+DQo+PiA+DQo+PiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+PiA+
IEZyb206IEVkIFRhbm91cyA8ZWR0YW5vdXNAZ29vZ2xlLmNvbT4NCj4+ID4gU2VudDogRnJpZGF5
LCBGZWJydWFyeSAyNiwgMjAyMSA5OjU3IFBNDQo+PiA+IFRvOiBKYXlhc2hyZWUgRCA8amF5YXNo
cmVlLWRAaGNsLmNvbT4NCj4+ID4gQ2M6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KPj4gPiBT
dWJqZWN0OiBSZTogTmVnYXRpdmUgdmFsdWUgcmV0dXJucyBmb3Igc2Vuc29yIGluIHRpb2dhcGFz
cw0KPj4gPg0KPj4gPiBbQ0FVVElPTjogVGhpcyBFbWFpbCBpcyBmcm9tIG91dHNpZGUgdGhlIE9y
Z2FuaXphdGlvbi4gVW5sZXNzIHlvdQ0KPj4gPiB0cnVzdCB0aGUgc2VuZGVyLCBEb24ndCBjbGlj
ayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIGFzIGl0IG1heSBiZQ0KPj4gPiBhIFBoaXNoaW5n
IGVtYWlsLCB3aGljaCBjYW4gc3RlYWwgeW91ciBJbmZvcm1hdGlvbiBhbmQgY29tcHJvbWlzZQ0K
Pj4gPiB5b3VyIENvbXB1dGVyLl0NCj4+ID4NCj4+ID4gT24gRnJpLCBGZWIgMjYsIDIwMjEgYXQg
MTI6NTUgQU0gSmF5YXNocmVlIEQgPGpheWFzaHJlZS1kQGhjbC5jb20+DQo+d3JvdGU6DQo+PiA+
ID4NCj4+ID4gPiBDbGFzc2lmaWNhdGlvbjogUHVibGljDQo+PiA+ID4NCj4+ID4gPiBIaSBUZWFt
LA0KPj4gPiA+DQo+PiA+ID4NCj4+ID4gPg0KPj4gPiA+IFJlY2VudGx5LCBJIGhhdmUgdGVzdGVk
IHNlbnNvcnMgZm9yIHRpb2dhcGFzcywgaW4gd2hpY2ggb25lIHNlbnNvcg0KPnJldHVybnMgbmVn
YXRpdmUgdmFsdWUuDQo+PiA+ID4NCj4+ID4gPiBBZnRlciBhbmFseXNpbmcgdGhlIGNvZGUgaW4g
dGhlIGRidXMtc2Vuc29ycyByZXBvLCBJIGZvdW5kIHRoZSBmb2xsb3dpbmcNCj5pc3N1ZS4NCj4+
ID4gPg0KPj4gPiA+DQo+PiA+ID4NCj4+ID4gPiBkYnVzLXNlbnNvcnMvSXBtYlNlbnNvci5jcHAg
YXQgbWFzdGVyICogb3BlbmJtYy9kYnVzLXNlbnNvcnMNCj4+ID4gPiAoZ2l0aHViLmNvbSkNCj4+
ID4gPg0KPj4gPiA+DQo+PiA+ID4NCj4+ID4gPiBGcm9tIHRoZSBhYm92ZSBsaW5rLCBXZSBuZWVk
IG9ubHkgYmVsb3cgbGluZSBpbiB0aGUgY29kZSB0byBwcm9jZXNzIHRoZQ0KPkhTQyBzZW5zb3Jz
IHZhbHVlIGZvciB0aW9nYXBhc3MuDQo+PiA+ID4NCj4+ID4gPg0KPj4gPiA+DQo+PiA+ID4gaW50
MTZfdCB2YWx1ZSA9ICgoZGF0YVs0XSA8PCA4KSB8IGRhdGFbM10pOw0KPj4gPiA+DQo+PiA+ID4N
Cj4+ID4gPg0KPj4gPiA+IFNpbmNlIHRoZSBiZWxvdyBsb2dpYyBpcyBhZGRlZCwgdGhlIHZhbHVl
cyBnZXQgc2hpZnRlZCBhbmQgZ2V0dGluZw0KPm5lZ2F0aXZlIHZhbHVlcyBhcyBvdXRwdXQuDQo+
PiA+ID4NCj4+ID4gPg0KPj4gPiA+DQo+PiA+ID4gY29uc3RleHByIGNvbnN0IHNpemVfdCBzaGlm
dCA9IDE2IC0gMTE7IC8vIDExYml0IGludG8gMTZiaXQNCj4+ID4gPg0KPj4gPiA+IHZhbHVlIDw8
PSBzaGlmdDsNCj4+ID4gPg0KPj4gPiA+IHZhbHVlID4+PSBzaGlmdDsNCj4+ID4gPg0KPj4gPiA+
DQo+PiA+ID4NCj4+ID4gPiBDb3VsZCB5b3UgcGxlYXNlIHN1Z2dlc3QgYW55IGlkZWEgdG8gcmVz
b2x2ZSB0aGlzIGlzc3VlLg0KPj4gPg0KPj4gPiBJIGhhdmVuJ3QgbG9va2VkIGF0IHRoaXMgaW4g
ZGV0YWlsLCBidXQgd2Ugc2hvdWxkIGZvbGxvdyB3aGF0ZXZlciB0aGUgc3BlYw0KPnNheXMgaGVy
ZS4gIElmIHdob21ldmVyIHdyb3RlIHRoaXMgb3JpZ2luYWxseSBwdXQgaW4gdGhlIHdyb25nIG1h
dGggKHdoaWNoDQo+c2VlbXMgbGlrZWx5LCBnaXZlbiB0aGV5IHdlcmUgaW1wbGVtZW50aW5nIDQg
dHlwZXMgYW5kIHByb2JhYmx5IG9ubHkgdXNpbmcNCj5vbmUpIHRoZW4gd2Ugc2hvdWxkIGp1c3Qg
Z2V0IGl0IGZpeGVkIGFuZCBkbyB3aGF0IHRoZSBzcGVjIHNheXMuDQo+PiA+DQo+PiA+ID4NCj4+
ID4gPg0KPj4gPiA+DQo+PiA+ID4gUmVnYXJkcywNCj4+ID4gPg0KPj4gPiA+IEpheWFzaHJlZQ0K
Pj4gPiA+DQo+PiA+ID4NCj4+ID4gPg0KPj4gPiA+IDo6RElTQ0xBSU1FUjo6DQo+PiA+ID4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4+ID4gPiBUaGUgY29udGVudHMgb2YgdGhp
cyBlLW1haWwgYW5kIGFueSBhdHRhY2htZW50KHMpIGFyZSBjb25maWRlbnRpYWwgYW5kDQo+aW50
ZW5kZWQgZm9yIHRoZSBuYW1lZCByZWNpcGllbnQocykgb25seS4gRS1tYWlsIHRyYW5zbWlzc2lv
biBpcyBub3QNCj5ndWFyYW50ZWVkIHRvIGJlIHNlY3VyZSBvciBlcnJvci1mcmVlIGFzIGluZm9y
bWF0aW9uIGNvdWxkIGJlIGludGVyY2VwdGVkLA0KPmNvcnJ1cHRlZCwgbG9zdCwgZGVzdHJveWVk
LCBhcnJpdmUgbGF0ZSBvciBpbmNvbXBsZXRlLCBvciBtYXkgY29udGFpbiB2aXJ1c2VzIGluDQo+
dHJhbnNtaXNzaW9uLiBUaGUgZSBtYWlsIGFuZCBpdHMgY29udGVudHMgKHdpdGggb3Igd2l0aG91
dCByZWZlcnJlZCBlcnJvcnMpDQo+c2hhbGwgdGhlcmVmb3JlIG5vdCBhdHRhY2ggYW55IGxpYWJp
bGl0eSBvbiB0aGUgb3JpZ2luYXRvciBvciBIQ0wgb3IgaXRzIGFmZmlsaWF0ZXMuDQo+Vmlld3Mg
b3Igb3BpbmlvbnMsIGlmIGFueSwgcHJlc2VudGVkIGluIHRoaXMgZW1haWwgYXJlIHNvbGVseSB0
aG9zZSBvZiB0aGUNCj5hdXRob3IgYW5kIG1heSBub3QgbmVjZXNzYXJpbHkgcmVmbGVjdCB0aGUg
dmlld3Mgb3Igb3BpbmlvbnMgb2YgSENMIG9yIGl0cw0KPmFmZmlsaWF0ZXMuIEFueSBmb3JtIG9m
IHJlcHJvZHVjdGlvbiwgZGlzc2VtaW5hdGlvbiwgY29weWluZywgZGlzY2xvc3VyZSwNCj5tb2Rp
ZmljYXRpb24sIGRpc3RyaWJ1dGlvbiBhbmQgLyBvciBwdWJsaWNhdGlvbiBvZiB0aGlzIG1lc3Nh
Z2Ugd2l0aG91dCB0aGUNCj5wcmlvciB3cml0dGVuIGNvbnNlbnQgb2YgYXV0aG9yaXplZCByZXBy
ZXNlbnRhdGl2ZSBvZiBIQ0wgaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4NCj5JZiB5b3UgaGF2ZSBy
ZWNlaXZlZCB0aGlzIGVtYWlsIGluIGVycm9yIHBsZWFzZSBkZWxldGUgaXQgYW5kIG5vdGlmeSB0
aGUgc2VuZGVyDQo+aW1tZWRpYXRlbHkuIEJlZm9yZSBvcGVuaW5nIGFueSBlbWFpbCBhbmQvb3Ig
YXR0YWNobWVudHMsIHBsZWFzZSBjaGVjaw0KPnRoZW0gZm9yIHZpcnVzZXMgYW5kIG90aGVyIGRl
ZmVjdHMuDQo+PiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCg==
