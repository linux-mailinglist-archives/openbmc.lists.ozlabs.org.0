Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB76618839
	for <lists+openbmc@lfdr.de>; Thu,  3 Nov 2022 20:10:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3Cxr5RDXz3cMj
	for <lists+openbmc@lfdr.de>; Fri,  4 Nov 2022 06:10:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A5Jl+BYj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=zhikui.ren@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A5Jl+BYj;
	dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3CxF62wdz3cFb
	for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2022 06:09:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667502578; x=1699038578;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0AfzhJbtRhSiJdkfO3ArkoLoJnFSgASda/OnzMTqKaM=;
  b=A5Jl+BYjyDx9vTx7fy1PDU7Kv7G4L28IegvCgNos9cNq7AiwoaSpWuoD
   Wgr1EX56GWYUvguKKYDlbNObRQj3LaORCUwxDJNwFDTNgc88dEZuU8Z6p
   IpazpLVqPfQdQe55vBb3GmhS30f9iMMqhTq2BHQzL2RRgz0xKHvNa5tNh
   Aye/9RXZraAReu71ty7I8UI2C+sGE92apBlwShIVZ5kOdWH2qNNb4Sytf
   opcBQOH6w8IzwM0Klahzf99RRM2FR8QX7Uq3ofXHIjUFM6kCVSutLHdZE
   hE663fZHj56tDh5t6Sbe3OnLAEpm3nWE++8o+B4SL1J+AbSCQKR6m2adU
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="290169354"
X-IronPort-AV: E=Sophos;i="5.96,135,1665471600"; 
   d="scan'208";a="290169354"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2022 12:09:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="777425741"
X-IronPort-AV: E=Sophos;i="5.96,135,1665471600"; 
   d="scan'208";a="777425741"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga001.fm.intel.com with ESMTP; 03 Nov 2022 12:09:30 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 3 Nov 2022 12:09:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 3 Nov 2022 12:09:30 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 3 Nov 2022 12:09:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Alu3FBsN9lF+Y5ZSAz6QPuXgVoeufd2pe7MbHsOezR3X+mz3919ySUSpnxX3qvTau/MYntG/AdBJ3radLMtQz0DdNusQt4i0vkK5Sp2kr4em5b+S9d539xPVL4hzlAttWjCsWByJOasoAnsVb/J+GmLx0HRiPgRGkjdV2xeK1utL3C+EIfUSGtu3QlxnedbiyLBIUquKB0ju1YunO9FOL/SNqQUuTwzLb0yN+zw6qMNprlFzi3/Xg+oBFBgisZ34mVPGO1qbto502BbWME/L0IwJk5xFVaxj4nrlu0kaXkawESjOSyLF7XmPQA6+DjjTfV/moFLHJRBhAG7xBOwYsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0AfzhJbtRhSiJdkfO3ArkoLoJnFSgASda/OnzMTqKaM=;
 b=S4jQXW0PE0HVK5B62Lkyc8eTEm7BW1XDphJ5Z6YqoMljZpswSmkJFI7KrCs4GofD0COixFuDPXP6uLUz+6gGAnbUseccPVBaJyB9Sx+RYfdIG8lzbQ0hLCEXtkdGWLIUaHVH3ta0n8Pt7FhezXzVlp3WRDNXnb11VQwAD4EZZf3D/TSbH2ZEw35A+iffULZ9P1qdKprKLVwNijFVy5u716kfshp+qpbUTd6QrwxWuBL2hJII2np/sn48AUsXFBjPFbHiivZByD+MH1trRLerbomgnaEQl+CGV8+uTBac0+DemJC0ya4BXTjcPVMpA8IwGSVOPhthK/Q8bNre997mbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4410.namprd11.prod.outlook.com (2603:10b6:5:1d9::11)
 by BN0PR11MB5712.namprd11.prod.outlook.com (2603:10b6:408:160::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 19:09:27 +0000
Received: from DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::9deb:6035:3a50:e3be]) by DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::9deb:6035:3a50:e3be%5]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 19:09:27 +0000
From: "Ren, Zhikui" <zhikui.ren@intel.com>
To: "Tanous, Ed" <edtanous@google.com>, OpenBMC Maillist
	<openbmc@lists.ozlabs.org>
Subject: RE: dbus-sensors and EM maintainership
Thread-Topic: dbus-sensors and EM maintainership
Thread-Index: AQHY7uRzTO85jyOEHEKLxXY5AIuNjq4tkUHA
Date: Thu, 3 Nov 2022 19:09:27 +0000
Message-ID: <DM6PR11MB44103D16D98BFCCB07DB693B94389@DM6PR11MB4410.namprd11.prod.outlook.com>
References: <CAH2-KxAsq8=+kYZHb9n_fxE80SuU29yT90Hb0k72bKfY8pnWEQ@mail.gmail.com>
In-Reply-To: <CAH2-KxAsq8=+kYZHb9n_fxE80SuU29yT90Hb0k72bKfY8pnWEQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: request-justification,no-action
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4410:EE_|BN0PR11MB5712:EE_
x-ms-office365-filtering-correlation-id: 72de79c6-8d2f-4b8f-e1d6-08dabdceed7a
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OIFNTD8GTTD8nmXon6j/vo7XMwtK6cQw/rKnlEXyyAQEA4RqnXviqRGYEW/7omhOA/qFDbfohoHI3XoOKrH6n7F722UHtTYZahCm2VEXVCFJSrtl7MXk9m33eRX/eOH72Kno6ODwtX5jzFt4J9h1+O8R1SHqlY3ssJs27wpGAuVCUEbPUQBzq4XTbpY23ygBAAJdv3JEBoddPeNX+iA85rb6U7HmobgNav8RAZFlIkrBAofMimcP9tKMK3AQ/ADTGuKcN6VncwlnGf3CAls9Tf0eW7927acq/sQiAJv7cWVul6PifMFLDNRNaHnjzh7IA274HcHqlrTtL6RxtsYa5bfXoRHeg8zbmesGkfYExzmSusXqyb3EyEnm04TSdX51aMHw8cuALhjKyxSUegRvkmyskQc3RE6NPjXFM8SxMX1+Q2tMOCkPZmZKHUG8wAZWwA3Ask+kymYu6+PLqIrS4RKWUtNNJAnzPGT8xFavS7HOFYCitAQYune4YfbVgG0/LcnfpvPg4sK5Ib0CXKYwjvrRU9rv+b1yTAAyzzab4u6zEoqcJwpI4vD57AKY2NxTeScqhslnBneHxv/vMvPx5XAzWYs3CwdeNoI1yq7Wb3cca14fvm59Xj2VFYZ9aBQs3V98ipRwg3MMkQgBHsT0AljBgmnQvWg2jMZLXiPPy3uMlJhxWCMT+w52b+bxbLp2LL4rX9lkTYpVNWJKGWIWdI+GbolreK/UMkLP6zhSUbhpNtQa8KwI6MhrtamNblu1rNXhjDmiMhhcurIfu2kc7A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4410.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(39860400002)(366004)(396003)(136003)(346002)(451199015)(66899015)(2906002)(82960400001)(66946007)(4326008)(76116006)(53546011)(7696005)(6506007)(66476007)(41300700001)(66556008)(26005)(9686003)(64756008)(8676002)(8936002)(110136005)(33656002)(316002)(54906003)(5660300002)(38070700005)(52536014)(66446008)(86362001)(122000001)(478600001)(38100700002)(71200400001)(83380400001)(55016003)(186003)(3480700007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXRWajN4S0d0TFJOSVRnYUhVUS9rVmJwMzdGWHFhS2M1emNOSnBIdzdoKzhs?=
 =?utf-8?B?ZEVOczh2NGYyZFVRakRnKzgrVHkxTUpodTdVbmFvWm9HNm41YTNyZ2dDMTVZ?=
 =?utf-8?B?RzA0c3hXQ0srLzYxQ2tRdERRZnVTT3hDL1hMcmZILzliVmZOTFlHMXNLaUJa?=
 =?utf-8?B?dytmL3FuejArdFhidGk4dTM5RmUzNmsvQnpiajRRQTJYa3hZSmNZdll2U0lz?=
 =?utf-8?B?L0lIck4vQklEdWhudnNRZ2xudkFJSmJjS3doVlBQV0tKeWVQdlRVcFZ2b2RW?=
 =?utf-8?B?MXZXd2Y0c1hxdG5oV2VseHNoL0NqcXMydFpXN2ZITkcxTVZWRVZxNkkwVzdZ?=
 =?utf-8?B?VHpvaWV0Sm1xUmVneTFiYWp6a2ZRNTFURWdtNm1tYVpHS2E5cnkzeFlYZ3Nn?=
 =?utf-8?B?Vi9qL2Q0eWtkRnFVSklxT1B1VnFPSVBabW5oOXlPZ1RzaWplOWMxSDJadStl?=
 =?utf-8?B?b09wMTRMNEEvRWN2OG5RRHd3TjFidHhNdWhqLzZxRVJmanNnSjQ0S3RJTUIr?=
 =?utf-8?B?N21HWlZ1SzBSZUZwY2FYa0tiS09ZenNJRDVsT3lQUE5DcDFrcXptOElqWXBV?=
 =?utf-8?B?YmJRVXlQd1BiMXVpMVlyTGxaREJORmdaNXJ2ejNmbWxFU0RjSEE4Y2lmQXdy?=
 =?utf-8?B?aGd6aStBajBDaUoxOXRsRW01anhWemVVcUhGSXVSZUF4ZkxxNXZ5d3V6cmtJ?=
 =?utf-8?B?OGI1RFVwVTBvdGJmaHJNWVhFdWdBTm1aaWxlZ0ZNYVZxV0pwK3h1SDk1eThz?=
 =?utf-8?B?ZVJIRjlleXgwRUhsRWs4QUdTZ1NQU1dFOGRlRDk0TUFtdytvTHh2ak9mcnd3?=
 =?utf-8?B?K3ZIdE1WVGlYY3ExT3FJdE9vd2hsL0h5ZlJvc0lVTlBicWJLZDhMSW0zOERS?=
 =?utf-8?B?ZTVUZ25ZeDFQb0NkTGlLVlFoNTRwcERCSUgzeUdhd0J0blU2Nnk0VFBqcGZu?=
 =?utf-8?B?WXlTUDFUK3ZJa3R3VDR2ZXI2bUEza2VObWo2OWNDaXVrNGROODFnby9PYVRI?=
 =?utf-8?B?eFczbHhqczJqemppYmJGSndsWmt5aExkS0JhcHBQZHdVeEluTTdZTFdjMUJ3?=
 =?utf-8?B?WGZabWw0dXNqMWpWQXFUNHFFb0wvMHE5Vzlxc1ZoalgxMVlIWVZ2MXFPOHZF?=
 =?utf-8?B?emNiYTN3YUZaZlgxZkJTdjVVZ1BlMHFUdG5FNVJQdHZFVXNPcldYeXVrYk42?=
 =?utf-8?B?TVdYMm5OSWVYZS80WGdWaTc0aVd2NFFqNWI2WkdzSGhJSlRGTitJcnRreThu?=
 =?utf-8?B?MkI0SjRVVGZJWVhGcFhDWXNtQnNZUHFsdisySjRxL2JnN1hrRDMyYmU5bzFI?=
 =?utf-8?B?VFppTXp2TzFRN0NwaDl4dGNlU3MwUzZXTWZwTnEyRWxtbjNqVG9tREpHeHY5?=
 =?utf-8?B?NlpNVWxsRWhQQ2trZFNUQjdjR0IzZklxOG41dWI2ZXFqeTVwbGtsMUdoUDNk?=
 =?utf-8?B?a2JKYU5zNVhPd0t4a2VXeSs5dWExU3hzSXdVWFpQUXNyTlVEZ0w5VTk5T1Ew?=
 =?utf-8?B?ZFh2RTJ5eDBMRzYrT1NISlQ5ZFYxVURqdWpFRzAxcWtBQ1FGbHNvR2YzcGJ1?=
 =?utf-8?B?aGJ6enorekQ2RzY2MndvTHRFaFVsKzhUZkwwTjhSL2k1NmVvdmEwUWdVRzlm?=
 =?utf-8?B?dWxoSVo1Q0NDUXhoeEdpZWl1L1h5aDIyRGRtWnRLSEZKNnZSTlJtT1JZdnVK?=
 =?utf-8?B?Mjh1VEJBS3pkSXl6bWd1cGtKLzQremUzRTlRM2oyS1NaYzl6cGFrcUx1YUU4?=
 =?utf-8?B?bmNxd1NvNnRkUG5CUGhyU1ppQ3plYlRrNlYycW1GemtuNytoNEJ4UmFnYUFT?=
 =?utf-8?B?Wk5QRlJLRC9Ya095aFNMaWgwMU9QQXk1NmFaNXh2S1ZoY0UySVo1UFdNZUIx?=
 =?utf-8?B?Y1N6M0tUbUh2dEhzcXlERWtBWmdMT3lqblNKTVVUN0RtSHdJVGV0VmNhSExD?=
 =?utf-8?B?N0tES3BCbXNIMzl3TUhUcndxbXk3MnE3djlKN3VZYS9DMFl4WTNQRmxNWVMx?=
 =?utf-8?B?QmJlZzY2cnZYK0lMUjRlMFlrWmJnOUhERmtGUHkwZlF5aWMwTitwZGZxOFR0?=
 =?utf-8?B?U1FkeXhXdHhDVDhheXlVTHFoZktRcjFMV3dGNis3blRGaHNXellPNEJFdHBF?=
 =?utf-8?Q?9aA5XdecXodpEHerf2mVpf8z8?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72de79c6-8d2f-4b8f-e1d6-08dabdceed7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2022 19:09:27.1356
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DhM91xg17jP4JYavwJEYFSlY2JqOZ1UaPUIfWjUZBaboZjngJhgFYwNm9MLUnw3qVQ0O4DuDDjGNnxgrKkDEaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5712
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, "Mauery, Vernon" <vernon.mauery@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBFZCBUYW5vdXMgPGVkdGFub3Vz
QGdvb2dsZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgTm92ZW1iZXIgMiwgMjAyMiAxMDo1NiBB
TQ0KPiBUbzogT3BlbkJNQyBNYWlsbGlzdCA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0KPiBD
YzogTWF1ZXJ5LCBWZXJub24gPHZlcm5vbi5tYXVlcnlAaW50ZWwuY29tPjsgUmVuLCBaaGlrdWkN
Cj4gPHpoaWt1aS5yZW5AaW50ZWwuY29tPjsgQW5kcmV3IEplZmZlcnkgPGFuZHJld0Bhai5pZC5h
dT47IEphZSBIeXVuIFlvbw0KPiA8amFlLmh5dW4ueW9vQGxpbnV4LmludGVsLmNvbT4NCj4gU3Vi
amVjdDogZGJ1cy1zZW5zb3JzIGFuZCBFTSBtYWludGFpbmVyc2hpcA0KPiANCj4gVEw7IERSIEkg
Y291bGQgdXNlIHNvbWUgaGVscCB3aXRoIHJldmlld2VycyBhbmQgbWFpbnRhaW5lcnMgZm9yIGRi
dXMtc2Vuc29ycw0KPiBhbmQgZW50aXR5LW1hbmFnZXIuDQo+IA0KPiBJIG9yaWdpbmFsbHkgdG9v
ayBvbiBtYWludGVuYW5jZSBvZiB0aGVzZSB0d28gcmVwb3MgYWZ0ZXIgdGhlIHByZXZpb3VzDQo+
IG1haW50YWluZXIgbGVmdCBvbiBzaG9ydCBub3RpY2UsIGhvcGluZyB0aGF0IHNvbWVvbmUgd291
bGQgc3RlcCB1cCB0byB0YWtlDQo+IG93bmVyc2hpcCBvZiB0aGUgcmV2aWV3cyBhbmQgbWFpbnRl
bmFuY2UuICBTZXZlcmFsIHllYXJzIGxhdGVyLCBhbmQgYSBmZXcNCj4gcGVvcGxlIGhhdmUgc3Rl
cHBlZCB1cCBmb3IgcG9ydGlvbnMgb2YgdGhvc2UgY29kZWJhc2VzLCBmb3Igd2hpY2ggSSdtDQo+
IHBlcnNvbmFsbHkgdmVyeSBncmF0ZWZ1bCwgYnV0IHJldmlld3MgYXJlIHN0aWxsIGEgc2lnbmlm
aWNhbnQgYW1vdW50IG9mIHRpbWUsIGFuZA0KPiBJJ20gc3RydWdnbGluZyB0byBrZWVwIHVwLg0K
PiANCj4gRm9yIEVNLCBWZXJub24gaXMgc3RpbGwgbGlzdGVkIGFzIGEgbWFpbnRhaW5lcjsgIElz
IHRoYXQgc29tZXRoaW5nIHlvdSdyZSBzdGlsbA0KPiBpbnRlcmVzdGVkIGluPyAgSXMgYW55b25l
IGVsc2UgaW50ZXJlc3RlZCBpbiB0YWtpbmcgYSBsYXJnZXIgcm9sZSB0aGVyZT8gIFRoZXJlJ3MN
Cj4gYWJvdXQgYSBjb3VwbGUgZG96ZW4gc3lzdGVtcyBzdXBwb3J0ZWQgZnJvbSB0aGUgRU0gcmVw
byB0b2RheSwgc28gSSdtIGhvcGluZw0KPiB0aGF0IHRoZXJlJ3Mgc29tZSBmb2xrcyB0aGF0IGhh
dmUgYSB2ZXN0ZWQgaW50ZXJlc3QgaW4ga2VlcGluZyBpdCBzdGFibGUuDQo+IA0KPiBGb3IgREJ1
cy1zZW5zb3JzLCB0aGVyZSdzIGFscmVhZHkgc2V2ZXJhbCBtYWludGFpbmVycyB0aGF0IGFyZSBm
YWlybHkgYWN0aXZlLiAgSWYNCj4geW91IGd1eXMgY291bGQgdGFrZSB0aGUgbGVhZCBvbiByZXZp
ZXdzLCB0ZXN0aW5nLCBhbmQgbWVyZ2VzIGdvaW5nIGZvcndhcmQsIEkNCj4gd291bGQgYXBwcmVj
aWF0ZSBpdC4gIEluIHRoZSBzYW1lIHF1ZXN0aW9uIGFzIEVNIGFib3ZlLCBpcyBhbnlvbmUgZWxz
ZQ0KPiBpbnRlcmVzdGVkIGluIHRha2luZyBhIG1vcmUgYWN0aXZlIHJvbGUgaW4gZGJ1cy1zZW5z
b3JzPyAgSSdtIGhhcHB5IHRvIGhlbHANCj4gbWVudG9yIGZvbGtzIGlmIHRoZXkgZG9uJ3QgZmVl
bCBsaWtlIHRoZXkgaGF2ZSB0aGUgdGVjaG5pY2FsIGFjdW1lbiBmb3IgaXQgeWV0LCBhbmQNCj4g
SSdtIHdpbGxpbmcgdG8gYmV0IHRoYXQgdGhlIG90aGVyIG1haW50YWluZXJzIHdvdWxkIGJlIHdp
bGxpbmcgdG8gaGVscCBhcyB3ZWxsLg0KPiANCj4gSWYgYW55b25lIHJlbGllcyBvbiBlaXRoZXIg
b2YgdGhlc2UgcmVwb3MgYW5kIHdvdWxkIGxpa2UgdG8gb2ZmaWNpYWxseSBwaXRjaCBpbiwNCj4g
cGxlYXNlIG9wZW4gYSByZXZpZXcgdG8gYWRkIHlvdXJzZWxmIHRvIHRoZSBPV05FUlMgZmlsZXMg
b2YgZWFjaC4gIElkZWFsbHkgSSdkDQo+IGxpa2UgdG8gZHJvcCBteXNlbGYgdG8gb25seSBhIHJl
dmlld2VyIGFuZCBzdWJtaXR0ZXIgb24gdGhvc2UgY29tcG9uZW50cy4NCj4gDQpJIGhhdmUgYmVl
biByZXZpZXdpbmcgc29tZSBvZiB0aGUgRU0gcGF0Y2hlcyBhbmQgd291bGQgbGlrZSB0byBwbGF5
IGEgYmlnZ2VyIHJvbGUuDQoNCj4gSSd2ZSBkb25lIG15IGJlc3QgdG8gc2V0IGJvdGggdGhlc2Ug
cmVwb3MgZG93biBhIGdvb2QgcGF0aCBieSBkb2N1bWVudGluZyBhcw0KPiBtdWNoIGFzIEkgY291
bGQuICBJZiBhbnlvbmUgc2VlcyBkb2N1bWVudGF0aW9uIHRoYXQgd291bGQgaGVscCBzb21lb25l
IGVsc2UNCj4gdG8gbWFpbnRhaW4gdGhlc2UsIEknbSBoYXBweSB0byB3cml0ZSBpdC4gIEFzIGl0
IHN0YW5kcywgdGhlIHJlcG9zIGhhdmUgcXVpdGUgYSBiaXQNCj4gbW9yZSBkb2N1bWVudGF0aW9u
IHRoYW4gd2hlbiBJIHN0YXJ0ZWQsIGFuZCBoYXZlIHN0YXRpYyBhbmFseXNpcyBhbmQgQ0kgdGVz
dGluZw0KPiBub3csIHNvIHJldmlld3MgYXJlIHNpZ25pZmljYW50bHkgZWFzaWVyIHRoYW4gdGhl
eSBvbmNlIHdlcmUuICBIb3BlZnVsbHkgd2UgY2FuDQo+IGNvbnRpbnVlIHRoaXMgdHJlbmQuDQo+
DQpUSEFOSyBZT1UhDQogDQo+IFRoYW5rcywNCj4gDQo+IC1FZA0K
