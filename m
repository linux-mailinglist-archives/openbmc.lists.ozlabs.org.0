Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1BB593611
	for <lists+openbmc@lfdr.de>; Mon, 15 Aug 2022 21:19:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M63xz0wtNz3bb2
	for <lists+openbmc@lfdr.de>; Tue, 16 Aug 2022 05:19:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eOQAZ+dk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eOQAZ+dk;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M63xL11wPz2xkL;
	Tue, 16 Aug 2022 05:19:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660591158; x=1692127158;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=YoUQCkde/jmHEdRz9AenljGkPxGQGlurLwAm0HMng0Y=;
  b=eOQAZ+dkw/1PiUNnrYQW2OVGLpYvg1RUzSrNpSVX6jginQgxsXdhiSxd
   G5XYRaB9xDLFkwRysZKie4GEVxC/jpGHZYDh1vL3WFrF6Kpbj5Tz6Hlv5
   Y4X6tCW4joXH3hGps5pTgAzTab5MEQtBBejTeOA5xfJhbLuAb4nMGRFmS
   iWQz6I07H/p0NSehz0JRKCoa/N+uLcSz1gkjNjg56w9krsSA/ruiM9ViV
   fRPvPcr39gFe9BS1Lhb/Fsgor7ZWx8ybvODa6LcVSxBQ4tlH1JGY4YVrt
   kbBQpsVd6xglcyRcAMmkIc800JyKDO2yitxHG8KHcrRbm1xHGb9e/GFez
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="292837363"
X-IronPort-AV: E=Sophos;i="5.93,239,1654585200"; 
   d="scan'208";a="292837363"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2022 12:19:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,239,1654585200"; 
   d="scan'208";a="603280188"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga007.jf.intel.com with ESMTP; 15 Aug 2022 12:19:07 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 15 Aug 2022 12:19:06 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 15 Aug 2022 12:19:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 15 Aug 2022 12:19:06 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Mon, 15 Aug 2022 12:19:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k20S0pw80IxmeQP2vbktSXqbJxgF4PahJiOLZEpsNLuWzZ0J3fyCXvVAxf6DOEeI93Ad7UASy8SMJ831O16RDNBH3NTYnTAxL7sWSDyIoJ+K9ZC8E00HAWSX7hcVUNX7nt1xNRQJZzCi3bndElNN0MdYtPpnIqMqv/AaSuuq8TG9PLv1P4Qi6DEPQLgU6oMIh+3ksmjQj0walizVDgNGufiG6/Hz5TdIbuPuFf5wPEdSUkJmXNjLFXF+GffruptqhqeCTihYKAH+oDzCC7+6dBsZFivyVxTcaAsxr/ZjLEYgBw34CMsFJzAkqqBO1XcfZSj7O4fyxblUjO5tda7Z3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YoUQCkde/jmHEdRz9AenljGkPxGQGlurLwAm0HMng0Y=;
 b=A1iZ1mkYpwSfcwlUTpmQk2aMwROr0/Z/5rPYXOZ9WfoGeqzTaD0XNFEDzHa5BRfDJyviWPbPhZe3nrqHf66SXFhj+qjoDy7YsRv16a0HDc4p/PpzRCodyEANrICKgZZBuKe7VfEAWieAMkNkaebF9MgLQej0W6SiTCRdKuIOhFF0LN4+3kcmmjsRivgDK3ClXGs1fe6+741bmLyVO1ACEYN86aO6yY/bTN7ShtldMKnRbg+zikQIWsqyojuMaXyWqbbXHtu2Fyo9ieWDTstaBdhtrAskVLRnQVamaA80MYbJeNCI7wg+5zvVZsg28aujDw3qPPiF6lXUjz1SxJkX0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by DM6PR11MB4489.namprd11.prod.outlook.com (2603:10b6:5:203::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Mon, 15 Aug
 2022 19:19:04 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::e89d:7ae8:fe67:76b9]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::e89d:7ae8:fe67:76b9%8]) with mapi id 15.20.5525.011; Mon, 15 Aug 2022
 19:19:04 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>
Subject: Re: [PATCH] peci: Fix platform_get_irq() error checking
Thread-Topic: [PATCH] peci: Fix platform_get_irq() error checking
Thread-Index: AQHYrXA4qpNFE/C0EkqsERvA93+Xm62wXM6A
Date: Mon, 15 Aug 2022 19:19:04 +0000
Message-ID: <3012726d084c09d7f5754419774cb1fea73a9874.camel@intel.com>
References: <YvTettdmRKZw46mb@kili>
In-Reply-To: <YvTettdmRKZw46mb@kili>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.3 (3.44.3-1.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1517ed64-408d-4f3f-418d-08da7ef3047d
x-ms-traffictypediagnostic: DM6PR11MB4489:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y87Adic/0IQjkoedsAIRVlWWk7QZegU1nOk7LZfqX31CHEgKRnqDhXIIXkU8AlbrWP2xPNoqjIzIouAvgyyki9oT61HXUCiPPW5rtX3fUsQcIir+JCEYD2ngcZ8knslE863Fv9sopN2ziqNqMyUoFBuI0Glkwm3vpFj5c7PnrSABbpk+jojUVKqdceadUrXB0edKnJy8JbaaWO1A0VoVrSOXwCk9bIiTveIU0XbOYGfwaO9tdRJDPKbtFxGjrEyqnUGsyYWUvOyV+KkttzI0axUwwEkJGcxhWB1/eCp7hr22PpPJxx8YjFGdl9Ka0A7VKWpvkQDkmoLRQqIguGfu+6FBScVMx4BsAo/vN3voO7KcAI8SGFVGMUlL93K7oEMYGIU1qC1rku8GFhufAGaJMpJsLGvp83nwN7x+g3++8bmTEViNdr+xxyBQTJb4SjKaEtKeszbDZ64fXC2oCaeGxB6UAx5/kWnhMyMCGEERvzlIZf8vAXr4Yz5xyrmlgBRF+KGPegAmIKWWxoAw99gfWB1WGcLPx3CXQduRZ055MAyuDT4XrYuNGVPUy0X71FTgIPrL9pwormM69jSfb0WkjDi9iMIgWafups3WDnbOs1E2tVfVGqtCtNnEYCv3MKZuPrkK4rXsMxu2EL3mR2YOpVWltfuDn/dftQgQKu7sK/hrMh2CwGXW38e4SKXo9+Zy0PuJuPVJRUvnOew0Etu7GFVVQNsYWWJ1BdbSeM5cQ2bnqKgdAjzBPyLru+lb4DMf/QQgi9Wop5FW+EV2kC6Gn93p/e4mziF3YmmTbDkkekAAuLkTcSh+3uTtL15De3kZ9b5R+ozmZnxlH7gLPAJVhA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5823.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(376002)(366004)(39860400002)(396003)(2906002)(41300700001)(478600001)(36756003)(6506007)(86362001)(82960400001)(38070700005)(2616005)(6512007)(186003)(6486002)(71200400001)(966005)(26005)(83380400001)(91956017)(5660300002)(66556008)(4326008)(66446008)(66946007)(8676002)(66476007)(76116006)(64756008)(316002)(54906003)(6916009)(38100700002)(122000001)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MDFJcTNXakVzaGtvZ2dtclA0V1RpWC8zOXB1MVZTeUF0ODdEcjVxQ0laODJY?=
 =?utf-8?B?OHlYS2U1TUFPNUtReDA4ZWsrdkJpS2pMVFQ0bnVvZ0RmM3hhOWtmV2xuSkFC?=
 =?utf-8?B?VmJGQ1haY0VtZVdGelpIV0tpbmVkR24zR3N1NW1vb3BYOVVPWDUxWENIQSs2?=
 =?utf-8?B?L0tsUktRSEhvSUxDbTBBdkd6OXg1SC8zaVBpVDlpWERUUHJCcURzeDNxR2ZP?=
 =?utf-8?B?amZXdld5azdueFhab1N2Z012YzNxQTdUSG9VMUdtM3piYjhxRXRoWENjVGZG?=
 =?utf-8?B?aUJyUG1hZWo1TDdZcGZoUGhDdlVENk5ickN6a25kSWVJbCtoZVJ4VXBzVjBI?=
 =?utf-8?B?cFhGNGxXUWJvTnJRZDh5cWI0eGlzTFduV3lFYXV4dy85RjVzZXVlR0FMS1NI?=
 =?utf-8?B?RCtqRkRsSWhIUDk5VXd2b1oxZFBUN3pZOGoxcEgrN2dHbllZM3pCeWdOVTU4?=
 =?utf-8?B?SlY2MUozOGRWWnl2R0wybzVrdmJVSURGR3NRSE10aGJ4c0FQRktZNk9idkFM?=
 =?utf-8?B?WHR5SkJmK1JhUHNWVDROeWpzS0s1U3ZTUjVONnZsc1NHTjdTenl5TEpQUHhp?=
 =?utf-8?B?N1dQamU1R2FOYjlqSzBUNHJzUUpiZ2J6cHUwZDl6bUZiMlgvUGlXSkk4a0ps?=
 =?utf-8?B?eUs4b1BRUWtYMGo3dzBhY2xEWjUwd3B0THROa1dXY2pEa3BiRkhUVkxIdjFS?=
 =?utf-8?B?UVlZbm9sRHhnSndsVlZrdklhVUN4a1hwT1ZkSy9GYU9YUjVmR25rcGlySVha?=
 =?utf-8?B?WnVsOWthcjhmVnhzZ2JmQmRGU3Jhc0M4a0ZHZzg4TFJDY1pGS05zczZOelVR?=
 =?utf-8?B?cWRUdytsZVlHejR4V0w5Vlp3U0d3ZzRnQlVVR3NhUlZNTWhRMGF1aXdBZmdn?=
 =?utf-8?B?R1JKaXBaSlMyNEpBcGxGRm1zdUNYYU5FTHdOemlnRGVlYlFrN0dtRlZtTFZi?=
 =?utf-8?B?aDkrREhKaU9ma1k4WnFodkFkM0dtZDRYVXVJTStoOUtpNG9WSWMzVmVDVkZV?=
 =?utf-8?B?MjloKzBQVFlWSUxQZHNXanliZWZ4ZFMyWGdPZlhaQjVkclRxVXRsaEFicjVK?=
 =?utf-8?B?emZ1YTRORGo1bjJ3VjdiRVJkWjR4NHdxRElLL0tPSDZiTWlnUElYM3Jzakds?=
 =?utf-8?B?cmVGSEZGb0RJUm0yclVFUFNFM2kyZ3Q2SkZrUlp4bnNVcFA4S05JcG0wQ25P?=
 =?utf-8?B?a1pjZ25RVUNPQldDMnFFdW02czJEcjUzbGdBN0FxclUvQUQ5V2wweTcwQkNE?=
 =?utf-8?B?YzVvbFZwSDZjYktHUDhSVUFta1dSaGFVaG1mYXlrQjFDUVYySXc4cmhHTGUw?=
 =?utf-8?B?YlA0cEZqVGNhNDdhSmJVVjFxMll3Mm1qMHJ4dFhHbzJLSEhjd0cyc3FvMkxs?=
 =?utf-8?B?eEhvUXVYbWY1ajAzcnpySXVadFJzckhIcTFubitmNERMMWdFT084bmJxTTBi?=
 =?utf-8?B?K0xUWDJnTkt1R3A3ZUd5OGxFSlFqRjRJdXFONUpab0NFdk83RFZheGVuUEZv?=
 =?utf-8?B?d1lldmMvZEdBWi9lSTcyZndCclcxRjlmbjJ6dDQ1NFpzVCs4NjF0QjlzWm1K?=
 =?utf-8?B?U0lZTkZsSitvZXdPQkw1QTdUZm9VbGR3UUZwakZBNjVaL0kzcHFCb2JBeUV1?=
 =?utf-8?B?L1Rac2Q4WHZ4cGVVOGl6ZVFoVDNOTlpDQThsTVVHbGx4VnVMc3pabUVqYTF5?=
 =?utf-8?B?MWI1ZDFzN011WGFkcTdpc01wR3RsWXphUERwSlJ5anllMDVaWjdmaDVXYVNL?=
 =?utf-8?B?WWF2ZUZOTnFaL3g3ZllWMEQ1S1JPa2FYblhaSVVXODFxSjJVN2NweUlkMXhy?=
 =?utf-8?B?enAzQmF1cUlYeWFCdUV4cU42UHNxMHg3bHhjbC9EYU9EVkZuRUhPVGdpL1Mv?=
 =?utf-8?B?NEpCRXdlWWNqNGpPbEwwOFVhSGNjK0wxalFCalJRTjN5SFlqekdvOEZDUmxl?=
 =?utf-8?B?MXRoa1RzbGp3OHd3ZGUvUDBCQjcrNWlDTUJVZmhRL0FyNDFZa1ptY0g4OWkx?=
 =?utf-8?B?dnBpZ25tWlY0VUJBUFVUSXdMUm15dzU4VEkvbzl3MDJVbTRoVitlQy9LTFMx?=
 =?utf-8?B?dnlPdWh4aUhBVVROeFdIQXhSbTluakJmclpucFFJZVQ0dlUrbmJ4dkZGcW1x?=
 =?utf-8?B?N0hsLzJGd1NpeGYzWVhoeWNUQkZmSUlKRHFrVjloS2NxRlA2SFd2TXdQNzQv?=
 =?utf-8?B?OWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B76D16660CF97B43A44C3525D15DB13C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1517ed64-408d-4f3f-418d-08da7ef3047d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2022 19:19:04.3660
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WmdxRO5dcwpweg4nfsQNBE8rQJ3J8yTmIcZNewdy7yl/bXCg80Gn5tXRwYS/mAJeZV9IXHuVik9zN6ishYAAAzW4ujs87VW/aVmuwC88vto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4489
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
Cc: "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "andrew@aj.id.au" <andrew@aj.id.au>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>, "joel@jms.id.au" <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gVGh1LCAyMDIyLTA4LTExIGF0IDEzOjQ5ICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0K
PiBUaGUgcGxhdGZvcm1fZ2V0X2lycSgpIGZ1bmN0aW9uIHJldHVybnMgc3VjY2VzcyBvciBuZWdh
dGl2ZSBlcnJvciBjb2Rlcw0KPiBvbiBmYWlsdXJlLg0KDQpIaSwNCg0KVGhlIHBhdGNoIHRoYXQg
Zml4ZXMgdGhpcyBwcm9ibGVtIHdhcyBhbHJlYWR5IHBpY2tlZCB1cDoNCmh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2l3aS9saW51eC5naXQvY29tbWl0Lz9o
PXBlY2ktbmV4dCZpZD1lNzliNTQ4YjcyMDJiYjNhY2NkZmU2NGYxMTMxMjlhNDM0MGJjMmY5DQoN
ClRoYW5rcw0KLUl3b25hDQoNCj4gDQo+IEZpeGVzOiBhODVlNGM1MjA4NmMgKCJwZWNpOiBBZGQg
cGVjaS1hc3BlZWQgY29udHJvbGxlciBkcml2ZXIiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2Fy
cGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvcGVj
aS9jb250cm9sbGVyL3BlY2ktYXNwZWVkLmMgfCAyICstDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9w
ZWNpL2NvbnRyb2xsZXIvcGVjaS1hc3BlZWQuYw0KPiBiL2RyaXZlcnMvcGVjaS9jb250cm9sbGVy
L3BlY2ktYXNwZWVkLmMNCj4gaW5kZXggMTkyNWRkYzEzZjAwLi43MzFjNWQ4Zjc1YzYgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvcGVjaS9jb250cm9sbGVyL3BlY2ktYXNwZWVkLmMNCj4gKysrIGIv
ZHJpdmVycy9wZWNpL2NvbnRyb2xsZXIvcGVjaS1hc3BlZWQuYw0KPiBAQCAtNTIzLDcgKzUyMyw3
IEBAIHN0YXRpYyBpbnQgYXNwZWVkX3BlY2lfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gUFRSX0VSUihw
cml2LT5iYXNlKTsNCj4gwqANCj4gwqDCoMKgwqDCoMKgwqDCoHByaXYtPmlycSA9IHBsYXRmb3Jt
X2dldF9pcnEocGRldiwgMCk7DQo+IC3CoMKgwqDCoMKgwqDCoGlmICghcHJpdi0+aXJxKQ0KPiAr
wqDCoMKgwqDCoMKgwqBpZiAocHJpdi0+aXJxIDwgMCkNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqByZXR1cm4gcHJpdi0+aXJxOw0KPiDCoA0KPiDCoMKgwqDCoMKgwqDCoMKgcmV0
ID0gZGV2bV9yZXF1ZXN0X2lycSgmcGRldi0+ZGV2LCBwcml2LT5pcnEsIGFzcGVlZF9wZWNpX2ly
cV9oYW5kbGVyLA0KDQo=
