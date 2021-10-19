Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DBE433828
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 16:14:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYbMz6yCBz30JT
	for <lists+openbmc@lfdr.de>; Wed, 20 Oct 2021 01:14:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=KvuUvaRt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=KvuUvaRt; dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYbMV3RvRz2ypT
 for <openbmc@lists.ozlabs.org>; Wed, 20 Oct 2021 01:13:52 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="225981611"
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; d="scan'208";a="225981611"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 06:45:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,163,1631602800"; d="scan'208";a="462761203"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 19 Oct 2021 06:45:34 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 19 Oct 2021 06:45:34 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 19 Oct 2021 06:45:34 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 19 Oct 2021 06:45:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W+ZrpTPD3YRzag1nRlpwwUtWRxURLFAQv44liZr7KwB7EEbCO8tBRYnj+VHLEHKQJ1r8EoB/5Im7NzrYk2sXG35uQj9sfM9dNaM1eYB69JHHXvqFiOwlVShmYD+HLYTZYnnUUpG5XKjlDlZOjedwcwVL8smIWYHAMU0lFqb8wCT0hnnohBocrT5LTay/sdnm8WBmyjXl7ibZ2iDx2xWWdmFiOtgUakzY0EPAVrSpAFWC7HFjfWQ2WsD/GAI7kKG+S7suP88Kbvij+wvFujXykggwOTcqMLFEqVUofbdJ+ZR5hyNuTvS8Qg0bZQJ33+9dIoSUfae8wrUHp5kF/g3yYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PaGCVhX2lePQzCqFZE2qEOZ8IcloiAvFEqHDEnwX7gk=;
 b=kbLz0FKEuOZey0gghj5tuOP+pUHknneHj1ho024Citb+zhLiw63fOZ7lfd+so+nHuo0V06YH9QOkJIsy9GSl4FkKuSuT8J1KvWqSYIHOvBrT1xozBRl9vj0Nwl3h9y4V1LfYs3rNnXPua25w+NbBfUJ+hWrCyz2KG7+tgXGTnTgOcHoiD7zGV+V4XFn40sG6KiNQ+ZgGOdq9eoEgfK7Pq+dewohmzNRlc+gnAaxWhpr85UTQB2z3ejlMqQNg38Bs7xVGy0E2xpIRA3hzVjACMkWHh+MmKlYZpbpYNZ9KspmvlkCTs/TjGVisxf07b+M4q5M25YovcGBg9HF09hdJaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PaGCVhX2lePQzCqFZE2qEOZ8IcloiAvFEqHDEnwX7gk=;
 b=KvuUvaRtSDG3g+ETepeAicshCc6VzAH4ckfAhhEmvN+tbYJ/k2RIIVv0ynStmPmnAnZJfGpzo9j8fSMaBjDufcG8/GNBVGwIOjG/0qUPKhm9pzL7Bt41R1JTIpKpBRe6LtI+32V5L+eDyXZpNL4VbtZoa72kJsNUreAP9Ftzrl0=
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by MW5PR11MB5905.namprd11.prod.outlook.com (2603:10b6:303:19f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Tue, 19 Oct
 2021 13:45:32 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::6553:c7f9:a224:cac1]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::6553:c7f9:a224:cac1%5]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 13:45:32 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "61a91bc@gmail.com" <61a91bc@gmail.com>
Subject: Re: kenel module dont enable
Thread-Topic: kenel module dont enable
Thread-Index: AQHXwboS0D+58AIk+0mhW5qv/yvja6vY2X6AgAEdYwCAABf6gIAATNuA
Date: Tue, 19 Oct 2021 13:45:32 +0000
Message-ID: <4f41bc7f0f320a9114d3576c814e99ae8a3015fa.camel@intel.com>
References: <CAMqwjCA0HFE4O9YHMAG4pxciCGLY5cLPJVdrDiKJMjTtQqrrEA@mail.gmail.com>
 <f06c4b91d9459061e380f860acd89802ab495524.camel@intel.com>
 <CAMqwjCBWB4LT8ZYO6gSY2azR_VoGoFqPj9rrLrR+yK20k7NMKw@mail.gmail.com>
 <CAMqwjCB7GaoNy4eSzrBEOeKCO1zj9fJ1=rZh3j3=AvgXhThfVQ@mail.gmail.com>
In-Reply-To: <CAMqwjCB7GaoNy4eSzrBEOeKCO1zj9fJ1=rZh3j3=AvgXhThfVQ@mail.gmail.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-1.fc34) 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0487a4b2-f51c-4d68-db7c-08d99306b8b3
x-ms-traffictypediagnostic: MW5PR11MB5905:
x-microsoft-antispam-prvs: <MW5PR11MB590523E04B9AD01DE515272AECBD9@MW5PR11MB5905.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IJQM68tHfWynbBV/isfaXGteirxZEOp3oXEnA/TE57/sphlz4Ys1RHfYMeUp5fx2F31eD6Vsmkds8gCHW06F9Ty1Dw0VcD/09fDezKGDfgIaeuhvSo4HWR0qmbaDhukb6IYsPsA1oi2lpfy1lD3Vk5Ccr2RVun1eDrInVej5Z8AdhXxRK/CBK0vdzW+uHeejtJJXKn7pDNg01cIi55FR/1QcwS4Sj6oYm//La1PLkDklbxd3n44Ms2uExtdnFQV7Sm5AvgkqcFmyFTPmB3sxhNETIa8f4uP0RhIOt0mIwlFzlOxlarvu+xECz1vmSPQnUoTDbRrHJqI3bd8uSdrnpt/snOUWiftIsk1ty4rusxp6KDS/sb/uqRQL5PwfToDyuuTM0ivKR6ap/8HD6fh1yu64LuG588YvyDrZIWMeeNoDBscT+xLpq7QvHZZrS7eii7RKf3BHLGH/aHXdUJTUxxbrg8DgKrCdDqYHVmI6oEjt2TQFFh5tbEb4mNdnWnWgTbMLJ2pplfVMZh6blytZUHD5L09WGnpLJNfIEIcOundqbOMYbkWS+JIbvaCHDyqy3fcH3HbME8EhG1tg0B2YvhzbomJt86tMZxchGNmwfan4meMYvOkh7mrzTDohRFmNcWILqtU4E3ZSvRTD0IKthgfk5reN3kUB+mI3MEJBBEEoOVIGKVVD0oGdu1usZgC7nsNmFrNKt25tJvhCwTTuqBk91qx67YZwcfpOGdzPFNQfNDkvwE6MfAmqRWlxD0IbWKuqtdQkre6ofU+orhpZSeyBodBrfBpTCQTgezC/8WrcnvpW92lwLE4M5OhvVFAy3bOhogIPPQCPDRFMoZV5ZVRK4MB+HZ+gbyha+BshPM0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5823.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(36756003)(83380400001)(122000001)(38070700005)(38100700002)(3480700007)(82960400001)(86362001)(71200400001)(66946007)(76116006)(64756008)(5660300002)(66476007)(2616005)(66556008)(91956017)(66446008)(4001150100001)(8936002)(8676002)(186003)(6506007)(4326008)(26005)(53546011)(6512007)(6916009)(316002)(508600001)(2906002)(966005)(6486002)(192303002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bVBxSjg3SHEzckhDZldjMUFpZ3hPT0ZETjJOZjZxTzZnYWg3bndha3R5OFpQ?=
 =?utf-8?B?VlcvVGRLb1dYcnhxeEY4dDJhL2pYZXM2dlB1dnQ3a2NrOVFBaFZibDZLWGFK?=
 =?utf-8?B?a04rQUlBTlVkdmVCejZhS21YMXBqb2VnS3ZqUDYrZWJOcmEwNTNqNHBXL3lT?=
 =?utf-8?B?WDVuVkphb3RaYzdNRzlEQW9qZW9rblEvVzB6UG9Sb3Q0K1RDbytldGR4YXJx?=
 =?utf-8?B?a05xTGxsTEp5RmFqbEZvYVpHTm1LUGJ0UWFKZjgySWhaSFg4Y3E0KzFSVEZq?=
 =?utf-8?B?U2NZeHg5eGlNSkc2K3lOTzY1eXBMejhnaXRGcXpNbTJaNVdPTE9sQndMR29E?=
 =?utf-8?B?OENVOWFUTlJRZjI3aUNES0FwTHNKNG54TEdsTmtnb08zS2pjREh4VmdUU3hv?=
 =?utf-8?B?SmtodHpydS93aHpCS2RZcGorRFVsQXZiejBwRVp4MDZGa3JtdzR5ZnVzNzZv?=
 =?utf-8?B?aC8xK3FnamJCVVNMeHlTc3BxM3Yyb2FqZkU5bWo0ZnNkZGorNHp0Tjg0VWdM?=
 =?utf-8?B?REpPWjFKNDhKamFxamNwOUhZQTVGNCszeklma0VUZTFmcWYyWHlFRzl1ejZU?=
 =?utf-8?B?R2FIK0VzaW43amNnOHorbE9RZGNPMTR2N1J4akRkYVhhck1iRU1QSE05cStV?=
 =?utf-8?B?dTF3OUYzb0wrTkZndTBwZWhZWVdIVm8vcjRkdjhkZVFOWG9zU3dwRVdXd0ti?=
 =?utf-8?B?UWs2YkNYdHJuUHlpY1NvV2orQ28xMCtkMjkwdTZKMCtCOERWWWVXVlYzcGZI?=
 =?utf-8?B?aUc0UGxOeTRvWEN3dGU1czFhTTIzR012SXo3Wlg3cS9pL2REUktTN0V1djl3?=
 =?utf-8?B?ZW16UVBoNi9kM0hzNjNGSnpHaldQaFR4ZGJRaytaMzRROVNHMnNSVXNad2xl?=
 =?utf-8?B?a2VPY0FnY0NDMmVKUStKMFlRZEZEQmtzaGtOcjc0MFM4dVJLeFp1WXh6bVli?=
 =?utf-8?B?dnROZU1Hd2p5b3VZa0FYajJlYXl2aGZVVUk2QmdpeXdIM2RUdlJzdFUwTmhZ?=
 =?utf-8?B?S0Nxd0FQcExxQW15R3RJRGFmZnJBb05RUWlrTTN4bXRuL2FuL1dTWGhQNmVZ?=
 =?utf-8?B?MDBLQmJ5ZDBDQVpIODZSNG8xZW92SndkSEtDUlZTUEJwRTFwMkZFR0lHVFM1?=
 =?utf-8?B?UmtaaS8zZTRCR2NzNlpBWlVNa0owN2JLR2VhOE1qTWM4SWxEQjBDdkZqRlM4?=
 =?utf-8?B?czZZazR4cmhIeks0bG5nUkxiSTVTMmRZTVRaQ0VQNm5aaG0yNmMvdWJ6RWlW?=
 =?utf-8?B?TjJxT3k3WnhrNzZxUUhFQXJGeXdreXNpcXVmK2cvdXhxYkZlT1duSGxac3NV?=
 =?utf-8?B?VFVIVHllUWxkd2EwOHQrZ1lGZ2diWE1vdlQ5c05EakJ4M2xNdEY4OGg5bVF4?=
 =?utf-8?B?ZVV1Z0I0UHF1NkFiNythNklvY04yZEE4bDI2TFpka1hLSFBFYUZuMUhzWWlN?=
 =?utf-8?B?Vk1yYkgybExNdDlNNGNDdGwxemMyRWlZcU1zckIramYzWE5ZTEZTaWVhTEx2?=
 =?utf-8?B?Zi9YWXVFODRDV3J3anNkU0psM0x0bXpVbGdvRWhGK1duVDhXak9oOTQ4dUg1?=
 =?utf-8?B?am04U3dxUDBOekNZUW9xZkxsZUV5SS8rWUVzOXprNDdtN3NJWERLanZoMS9F?=
 =?utf-8?B?SWtpZGpyN3lSWkszTytmNXdxZ3ZEZjVRcHFFaU5ZSTZteHljdjJHMjRPUkh5?=
 =?utf-8?B?Z3RxZ0dVNDJKcmNTTFYvVGc3SEg0cGpkTGJEMzloOVZ1YVdPdHJjRVRtUnQv?=
 =?utf-8?B?cndoejVzMVJ4d3Blay9MaG8rRXBTN1dyTXNOWU14WVBQbGtLNGNEWFEyYW5B?=
 =?utf-8?B?Q0hxa1ptbW9pNlVzV2cveHd4MHZCZmdCaDQzeWd1a3h1SWQxVDErdGhjeWR1?=
 =?utf-8?B?NEp4MDBRZFIrZFJMNXRtbG41RzVraVBQaXdoc2dTOFpwTE1MSGVGN013Wm5E?=
 =?utf-8?B?cUdkMlBnZ1RGUWp0d1R1OTZmQUluOEYyYndhOHRWY3JhSmRNSE1zcitEMzhj?=
 =?utf-8?B?V01CZWZlY2lNOVhRck1KZm5tcXBFYnJpdSt1cVRNWjMvNy9tQzNZVHdNL0Yz?=
 =?utf-8?B?ODdvdS9DSThLcTBLVVBXZFhMODdna0pkeS9zclB6NXZPR1R2ZDZjeXhjc01P?=
 =?utf-8?B?SVU1dTNTTmdWT0tYNGZtazROaHI1UlNldGxXVnUvRmRXTDRGWG1VZkdza0Vz?=
 =?utf-8?B?ZUJBMUVlbHlCSkplQWExdGFRUHRicWNhaFJUM2xnTk52N05XbElqc2c2NU45?=
 =?utf-8?Q?ZJnto8hRNABJXadzrH9L/V6yE+dazsssQwNYUGN050=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <22727B644E0A1549AC6448B69F28854F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0487a4b2-f51c-4d68-db7c-08d99306b8b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2021 13:45:32.5914 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: POza/2t1iSU5m9Q3A8ZET7olKGc8CmspTV9XwnGzc6o62+miIL4bKxDr5+KbBIlM7hSZeJi65lgETFq1q609ElAkqyzpFh8PEgf0zgfkSsg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5905
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

T24gVHVlLCAyMDIxLTEwLTE5IGF0IDEyOjEwICswMzAwLCBBbGV4YW5kZXIgUmFpaCB3cm90ZToN
Cj4gSGksDQo+IEkgdHJ5IHRvIHJlZ2lzdGVyIHBlY2kgZGV2aWNlIGluIHN5c2ZzIGJ1dCBJIGhh
dmUgc2FtZcKgcHJvYmxlbQ0KPiANCj4gWyDCoDgwMC4zMzk2MDVdIHBlY2kgcGVjaS0wOiBGYWls
ZWQgdG8gcmVnaXN0ZXIgcGVjaSBjbGllbnQgcGVjaS1jbGllbnQgYXQgMHgzMA0KPiAoLTUpDQoN
CldlcmUgeW91IGFibGUgdG8gY29uZmlybSB0aGF0IHlvdXIgcGxhdGZvcm0gaXMgaW4gUzAgcG93
ZXIgc3RhdGUgYmVmb3JlIHlvdQ0KdHJpZWQgdGhpcz8NCg0KQ291bGQgeW91IHNoYXJlIGRldGFp
bHMgYWJvdXQgSW50ZWwgUGxhdGZvcm0vQ1BVIHRoYXQgeW91J3JlIHVzaW5nPw0KDQotSXdvbmEN
Cg0KPiANCj4gDQo+IA0KPiANCj4gDQo+INCy0YIsIDE5INC+0LrRgi4gMjAyMSDQsy4g0LIgMTA6
NDQsIEFsZXhhbmRlciBSYWloIDw2MWE5MWJjQGdtYWlsLmNvbT46DQo+ID4gVGhhbmtzLCBJd29u
YQ0KPiA+IEkgd2lsbCB0cnkgdGhpcy4NCj4gPiANCj4gPiBCZXN0IHJlZ2FyZHMsDQo+ID4gQWxl
eA0KPiA+IA0KPiA+INC/0L0sIDE4INC+0LrRgi4gMjAyMSDQsy4g0LIgMTc6NDMsIFdpbmlhcnNr
YSwgSXdvbmEgPGl3b25hLndpbmlhcnNrYUBpbnRlbC5jb20+Og0KPiA+ID4gSGkgQWxleCwNCj4g
PiA+IA0KPiA+ID4gKGluIHRoZSBmdXR1cmUsIHBsZWFzZSBDYzogb3BlbmJtYyBtYWlsaW5nIGxp
c3QpDQo+ID4gPiDCoMKgDQo+ID4gPiBUaGlzIG1heSBvY2N1ciB3aGVuIENQVSBjYW7igJl0IGJl
IGRldGVjdGVkIC0gaXMgeW91ciBwbGF0Zm9ybSBpbiBTMCBwb3dlcg0KPiA+ID4gc3RhdGU/DQo+
ID4gPiBCTUMgdXN1YWxseSBpcyBib290ZWQgYmVmb3JlIHRoZSBwbGF0Zm9ybSBnb2VzIHRvIFMw
LCBzbyBJIHdvdWxkIHJlY29tbWVuZA0KPiA+ID4gcmVnaXN0ZXJpbmcgcGVjaS1jbGllbnQgbWFu
dWFsbHkgKHVzaW5nIHN5c2ZzKSByYXRoZXIgdGhhbiB1c2luZyBEVFMuDQo+ID4gPiDCoA0KPiA+
ID4gIyBlY2hvIHBlY2ktY2xpZW50IDB4MzAgPiAvc3lzL2J1cy9wZWNpL2RldmljZXMvcGVjaS0w
L25ld19kZXZpY2UNCj4gPiA+IMKgDQo+ID4gPiBPciBpZiB5b3XigJlyZSB1c2luZyBkYnVzLXNl
bnNvcnMsIHBlY2ktY2xpZW50IGRldmljZXMgYXJlIGV4cG9ydGVkIHRoZXJlOg0KPiA+ID4gaHR0
cHM6Ly9naXRodWIuY29tL29wZW5ibWMvZGJ1cy1zZW5zb3JzL2Jsb2IvbWFzdGVyL3NyYy9DUFVT
ZW5zb3JNYWluLmNwcCNMNDA2DQo+ID4gPiANCj4gPiA+IC0tDQo+ID4gPiBOb3RlIHRoYXQgUEVD
SSBzdWJzeXN0ZW0geW914oCZcmUgdXNpbmcgaXMgc3ViamVjdCB0byBjaGFuZ2UgaW4gdGhlIGZ1
dHVyZToNCj4gPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMTA4MDMxMTMxMzQu
MjI2Mjg4Mi0xLWl3b25hLndpbmlhcnNrYUBpbnRlbC5jb20vDQo+ID4gPiDCoA0KPiA+ID4gLUl3
b25hDQo+ID4gPiDCoA0KPiA+ID4gRnJvbTogQWxleGFuZGVyIFJhaWggPDYxYTkxYmNAZ21haWwu
Y29tPiANCj4gPiA+IFNlbnQ6IEZyaWRheSwgT2N0b2JlciAxNSwgMjAyMSAxOjQ2IFBNDQo+ID4g
PiBUbzogWW9vLCBKYWUgSHl1biA8amFlLmh5dW4ueW9vQGludGVsLmNvbT47IFdpbmlhcnNrYSwg
SXdvbmENCj4gPiA+IDxpd29uYS53aW5pYXJza2FAaW50ZWwuY29tPg0KPiA+ID4gU3ViamVjdDog
a2VuZWwgbW9kdWxlIGRvbnQgZW5hYmxlDQo+ID4gPiDCoA0KPiA+ID4gSGVsbG8sDQo+ID4gPiBJ
IHVzZSBpbnRlbCBrZXJuZWwgbW9kdWxlIHBlY2kuIEluIGR0YiBJIGhhdmUgdGhpcyBkZXNjcmli
ZSBhYm91dCBwZWNpOsKgDQo+ID4gPiDCoA0KPiA+ID4gwqANCj4gPiA+IGJ1c0AxZTc4YjAwMCB7
DQo+ID4gPiBjb21wYXRpYmxlID0gInNpbXBsZS1idXMiOw0KPiA+ID4gI2FkZHJlc3MtY2VsbHMg
PSA8MHgwMT47DQo+ID4gPiAjc2l6ZS1jZWxscyA9IDwweDAxPjsNCj4gPiA+IHJhbmdlcyA9IDww
eDAwIDB4MWU3OGIwMDAgMHg2MD47DQo+ID4gPiBwZWNpLWJ1c0AwIHsNCj4gPiA+IGNvbXBhdGli
bGUgPSAiYXNwZWVkLGFzdDI1MDAtcGVjaSI7DQo+ID4gPiByZWcgPSA8MHgwMCAweDYwPjsNCj4g
PiA+ICNhZGRyZXNzLWNlbGxzID0gPDB4MDE+Ow0KPiA+ID4gI3NpemUtY2VsbHMgPSA8MHgwMD47
DQo+ID4gPiBpbnRlcnJ1cHRzID0gPDB4MGY+Ow0KPiA+ID4gY2xvY2tzID0gPDB4MDIgMHgwNj47
DQo+ID4gPiByZXNldHMgPSA8MHgwMiAweDA2PjsNCj4gPiA+IGNsb2NrLWZyZXF1ZW5jeSA9IDww
eDE2ZTM2MDA+Ow0KPiA+ID4gbXNnLXRpbWluZyA9IDwweDAxPjsNCj4gPiA+IGFkZHItdGltaW5n
ID0gPDB4MDE+Ow0KPiA+ID4gcmQtc2FtcGxpbmctcG9pbnQgPSA8MHgwOD47DQo+ID4gPiBjbWQt
dGltZW91dC1tcyA9IDwweDNlOD47DQo+ID4gPiBzdGF0dXMgPSAib2theSI7DQo+ID4gPiANCj4g
PiA+IHBlY2ktY2xpZW50QDMwIHsNCj4gPiA+IGNvbXBhdGlibGUgPSAiaW50ZWwscGVjaS1jbGll
bnQiOw0KPiA+ID4gcmVnID0gPDB4MzA+Ow0KPiA+ID4gfTsNCj4gPiA+IA0KPiA+ID4gcGVjaS1j
bGllbnRAMzEgew0KPiA+ID4gY29tcGF0aWJsZSA9ICJpbnRlbCxwZWNpLWNsaWVudCI7DQo+ID4g
PiByZWcgPSA8MHgzMT47DQo+ID4gPiB9Ow0KPiA+ID4gfTsNCj4gPiA+IH07DQo+ID4gPiDCoA0K
PiA+ID4gwqANCj4gPiA+IEkgaGF2ZSB0aGlzIGVycm9yIGluIGRtZXNnOg0KPiA+ID4gWyDCoCDC
oDIuNTE2MzgzXSBwZWNpIHBlY2ktMDogRmFpbGVkIHRvIHJlZ2lzdGVyIHBlY2kgY2xpZW50IMKg
YXQgMHgzMCAoLTUpDQo+ID4gPiBbIMKgIMKgMi41MjY3NjddIHBlY2kgcGVjaS0wOiBGYWlsZWQg
dG8gY3JlYXRlIFBFQ0kgZGV2aWNlIGZvcg0KPiA+ID4gL2FoYi9hcGIvYnVzQDFlNzhiMDAwL3Bl
Y2ktYnVzQDAvcGVjaS1jbGllbnRAMzANCj4gPiA+IMKgDQo+ID4gPiBIb3cgSSBjYW4gcmVzb2x2
ZSB0aGlzID8NCj4gPiA+IMKgDQo+ID4gPiBiZXN0IHJlZ2FyZHMsDQo+ID4gPiBhbGV4DQoNCg==
