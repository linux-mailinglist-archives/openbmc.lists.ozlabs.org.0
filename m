Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8653025A535
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 07:54:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhCmv5jvpzDqj1
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 15:54:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=kuiying.wang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=ycc/ceyg; dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhCm50Wg4zDqfv
 for <openbmc@lists.ozlabs.org>; Wed,  2 Sep 2020 15:53:23 +1000 (AEST)
IronPort-SDR: m6En9WFgSCVqp+f7YX//dhQ0Mmb7ddGh7Nc//iTU5ULdqDbURESKoos+zzSXOr5ISgEzH81/cz
 nRZPcFEqCvhA==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="154727402"
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; d="scan'208";a="154727402"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 22:53:19 -0700
IronPort-SDR: pi1Y707GZqUE6WSvGjTiLCGPefX7aqVnG9eQUJEiMwLuTE8b0MKWisx9pA2IriBKbYbuThObew
 i10yCY6tFk5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; d="scan'208";a="333985531"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga002.fm.intel.com with ESMTP; 01 Sep 2020 22:53:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 1 Sep 2020 22:53:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 1 Sep 2020 22:53:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 1 Sep 2020 22:53:18 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 1 Sep 2020 22:53:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bNZJ8vhjBWHxT46asnrLzTA3XWTF5BDh+xGEopQQaBw8V+BpCHI9+59kqSZCFEdhOoAqCo2xTL5/7+faRfKnoc73gLg5BADg5rsKTsth8FrWEfDuKwZ1Swy5Wa68iVjjnx5mvg3FxjXyXnkjKLBbGPStrkUv5mj8h6pQjUUI22LyZPIk7Vpyq3uE93+lM3KU+wLmxDkrvIEwp6ttMEkjIZUquiyocZ0p13YD1WkjYEL/GbSpeUYmbAo7p1ILP7UFFYLU7MaR5wMCA5LNRQO15Q8cm0JSnBtrFTATFEl8v0WCgXo9u4srcTTnCz5mlUOlH8FUHm3L7yDYgNRwa6xHEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQ+I29BeZyJW9fRIGLHKQJQaAnkitJMxoIwEKbnXoUY=;
 b=m4hU/t2u+KU2JjaRJn2clDXyGVyypM1pn4Hvc+5mShdrFp0SvM3PB3XveHREJ7H8PkYBS4u7X0e3fmCBxgZskGgc/G/9d0Mz6eJ5/6mg/AkPZGj/VlMfziUvhFjs69XqZg1hHw0PZf3nWost3EyPhcisNbKIFvBGGOlkoQaMtvfaS6oJP6OJoRObIGKj/ejLe+eYScbJ4ebXxHbLONKka1g3spOgjxthVXaTLT8zzFC7io2vEpnPrh2PRwJ3f7vjZCAb38FO1lL+sEPe75HzIHM4SWbD2FtmAiXmHV4y3LA8wJsW50DfAeZrXFQhEysXIXWA7sR3PwC8NCiGbtmNHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQ+I29BeZyJW9fRIGLHKQJQaAnkitJMxoIwEKbnXoUY=;
 b=ycc/ceyg6kt8f1nVl1XkxZFlgEpR6fbATh4VceRaXNH4zCuvGsytrBf5KLBEw9wzFhNi+/llmqDrz1kBF3mj9m99dgrfFQ0cYDcXogXEEPA2DK09mziVpJSuI2k3DOK+ABaZuakGxnnnDLWClzpatO6GEH0dLxZisTw+FTiYlzY=
Received: from SN6PR11MB3520.namprd11.prod.outlook.com (2603:10b6:805:cf::12)
 by SA0PR11MB4605.namprd11.prod.outlook.com (2603:10b6:806:95::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Wed, 2 Sep
 2020 05:53:17 +0000
Received: from SN6PR11MB3520.namprd11.prod.outlook.com
 ([fe80::d933:53ea:b87a:f917]) by SN6PR11MB3520.namprd11.prod.outlook.com
 ([fe80::d933:53ea:b87a:f917%4]) with mapi id 15.20.3326.025; Wed, 2 Sep 2020
 05:53:17 +0000
From: "Wang, Kuiying" <kuiying.wang@intel.com>
To: =?utf-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>
Subject: RE: Need update CI build config for new repo smbios-mdr.
Thread-Topic: Need update CI build config for new repo smbios-mdr.
Thread-Index: AdZ8T8WMWe7UjTu1QQafCbbBYikJpQBJL32AAHDrLbAAUQMGgAAAodOAABNvhOAAB/jZgAAAOaGg
Date: Wed, 2 Sep 2020 05:53:17 +0000
Message-ID: <SN6PR11MB352073500A042086DEAD506E902F0@SN6PR11MB3520.namprd11.prod.outlook.com>
References: <SN6PR11MB35203BE16B23BAD1193FCB9F90550@SN6PR11MB3520.namprd11.prod.outlook.com>
 <5a9a43046be525f9ed5d23bc40eac14d4ed8d53c.camel@fuzziesquirrel.com>
 <SN6PR11MB35205154DB67E625EF74388A90510@SN6PR11MB3520.namprd11.prod.outlook.com>
 <20200901162333.GT3532@heinlein> <20200901164139.GV3532@heinlein>
 <SN6PR11MB352047845E48681E8F71B139902F0@SN6PR11MB3520.namprd11.prod.outlook.com>
 <CAGm54UFR1rk4F19ucr6N0kS69k405YWa=8XDuaCyLUchKgM-Xg@mail.gmail.com>
In-Reply-To: <CAGm54UFR1rk4F19ucr6N0kS69k405YWa=8XDuaCyLUchKgM-Xg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMjdjMGNjNDAtZTIxOC00NmRjLWE0OTktOWMwZDdiNGRkMWM5IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiS1hZYXBncUFwc2kzSmlORnEzTlBmWFg3bTQ3Z1pHbzFYNzZpNk52enFsUzNWb0NXc3prR3dwc0QzNXlpMXJ3aCJ9
dlp-version: 11.5.1.3
dlp-reaction: no-action
dlp-product: dlpe-windows
x-ctpclassification: CTP_NT
authentication-results: bytedance.com; dkim=none (message not signed)
 header.d=none;bytedance.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.46.46]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cda20f3a-adb6-4f59-aa14-08d84f047d53
x-ms-traffictypediagnostic: SA0PR11MB4605:
x-microsoft-antispam-prvs: <SA0PR11MB4605DCA1B2933DE9B49DCEA6902F0@SA0PR11MB4605.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D/T0bt35WGIt471sP8jVpsGjFbgrjsiWLp3Xo0e4WYl/KtnVqHomYVnTF05wONns+0OJkRS/bgodkEPzODsjXJjv4hR1hxDg/866peij8+C/BvUsVPU3rtx6/afAfeTuZVshYjhyU6oWqpdPXUmlegLwWGu5uDpLrZTOvRpKjeJJ7k/LXSavTI7ezEXEtXnKL0z/kwFPkEHFi/UQiNzYPoi4FrXiHywtK6mQ28mYTpcIHby5f9C2hssG7BJhAFxoA/VlN0ZnEDBc641/JD73sWp0Z6xU7aDZ2f/1ex2iU+kEWTWKbJrYkG3NbmT4cGWk3NuZUoD/bqSE/S0SE4kO4xnm9zgR60YN4mp8PiCrMZ6mUvirOMcWDyW364cuMXBvQvlJdDsYgPwDbFtd/d/wtw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3520.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(55016002)(83380400001)(26005)(86362001)(8676002)(478600001)(8936002)(186003)(15650500001)(6916009)(54906003)(2906002)(9686003)(64756008)(6506007)(7696005)(52536014)(4744005)(316002)(71200400001)(33656002)(966005)(66946007)(66476007)(5660300002)(76116006)(4326008)(53546011)(66446008)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: RDPvD+5pVlCVPgkqSZb9o8EfHoLPqAPdP0o/BVcAH2hB24kcvJu9/j4eYqtXZi6pwzNgjVa07ir6ueli9MidQNAcoUYBKMVNxe7NToXHfYriDx1fVWn5NQBSB6qNrUhvhp+fQaeIFcyLHA32GkFsL9cqNfr1x+baOmlYc+VMHobnvVX8mYY/W35hXFnCSVeDmosjB/kW+MtYeMqkG00IELCMn0bVjnXbrLui6EWsrhNX4sy9LtItN8NwBdtTF1k1Y/RP/1UOQmQdxsvNXkitG1u2bDj15We5B2LKZeDeCB+WoV391fbjUe2pk/2wLSypXTd8+yKIEjyR312ArPD0JITOAggVorFcZ1gN8MePhW3A8/HUtomDiyE56wxtQFElu0dLj8QJwu0+Zoa5o0wfT4KMcVYLs8qdvqgBzaM1wsSou+CbyN7ykrnSqmXvsne1CJeHOP7O1+iBcGqKBbnieFSIC2wHtqm1Ys/Xu3/ypaSGBAj1W/3twDf5sqjRBOkOr3PxGqaDmSeq1xh9tq148A15urWQzOgHFHtXSZk0x8inQCpqCNEF+8bEnkeSpZpzF5K50bR0hBbAO7L5rTRPUQuL3lIJAMvAlyDmS8pichGZ1/VSFvN4gEBsVycsMci7S8ymoiRdvPl5GaA5Ix5lOA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3520.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cda20f3a-adb6-4f59-aa14-08d84f047d53
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2020 05:53:17.2384 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: os3vux3tGUQ1BpE0nReaxRBCdLIVMEazunLlOZ3ejIfgpWzc1LjfnDwhJ7YPVeme2046BcJQQuzfYAboN0batQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4605
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
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T2ssIGxldCBtZSBjaGVjay4NClRoYW5rcyBhIGxvdCBZdWxlaS4NCg0KVGhhbmtzLA0KS3dpbi4N
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IOmDgembtyA8eXVsZWkuc2hAYnl0
ZWRhbmNlLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIFNlcHRlbWJlciAyLCAyMDIwIDE6NDYgUE0N
ClRvOiBXYW5nLCBLdWl5aW5nIDxrdWl5aW5nLndhbmdAaW50ZWwuY29tPg0KQ2M6IFBhdHJpY2sg
V2lsbGlhbXMgPHBhdHJpY2tAc3R3Y3gueHl6Pjsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOyBC
cmFkIEJpc2hvcCA8YnJhZGxleWJAZnV6emllc3F1aXJyZWwuY29tPg0KU3ViamVjdDogUkU6IE5l
ZWQgdXBkYXRlIENJIGJ1aWxkIGNvbmZpZyBmb3IgbmV3IHJlcG8gc21iaW9zLW1kci4NCg0KT24g
V2VkLCBTZXAgMiwgMjAyMCBhdCAxMDowNCBBTSBXYW5nLCBLdWl5aW5nIDxrdWl5aW5nLndhbmdA
aW50ZWwuY29tPiB3cm90ZToNCj4NCj4gSGkgV2lsbGlhbXMsDQo+IFRoZSBrZXkgdGhpbmcgaXMg
c2RidXNwbHVzIGludGVyZmFjZSBpcyBub3QgbWF0Y2guDQoNClRoZSBzZGJ1c3BsdXMgaW4gb3Bl
bmJtYy1idWlsZC1zY3JpcHRzIGFsd2F5cyBwaWNrIHRoZSBsYXRlc3Qgb25lIFsxXSwgc28gSSB3
b3VsZCBndWVzcyB0aGF0IHNtYmlvcy1tZHIgaXMgbm90IHVzaW5nIHRoZSBsYXRlc3Qgc2RidXNw
bHVzLg0KQ291bGQgeW91IGNoZWNrIHRoYXQ/DQoNCg0KWzFdOiBodHRwczovL2dpdGh1Yi5jb20v
b3BlbmJtYy9vcGVuYm1jLWJ1aWxkLXNjcmlwdHMvYmxvYi9tYXN0ZXIvYnVpbGQtdW5pdC10ZXN0
LWRvY2tlci5zaCNMNTQNCg==
