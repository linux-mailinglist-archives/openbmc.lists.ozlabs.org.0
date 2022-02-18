Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 705DA4BC017
	for <lists+openbmc@lfdr.de>; Fri, 18 Feb 2022 20:05:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0h3m02pcz3cVP
	for <lists+openbmc@lfdr.de>; Sat, 19 Feb 2022 06:05:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AS343iBi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=jonathan.doman@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=AS343iBi; dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0h3C33Pgz3cRQ
 for <openbmc@lists.ozlabs.org>; Sat, 19 Feb 2022 06:05:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645211112; x=1676747112;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=ZL9pC3sMlO3Vd9G5GfJ62WDMhuopVZSW4vFrxSboNcM=;
 b=AS343iBiLwYKzAkBBnV05OTZUyjgF8tr8T951yEn6+7REAMVbs59e9tT
 s4GFffTLatpE3nNtZNONR/+QE/F91u3x5GeZX4kdZ7JkBO3TYENLPxRm5
 34pEL0e2ua8Rmje4N2V8xzBQ1vXWk3liWj0L+G6/h5WjOFoVc+9pue8ey
 MLqqnklF6v1cs8gu680CmD7UWnsCdYgwTwCbX+IYWZV3gjn557+Gq5/aN
 KimgvwyM2Y/fX0TuoyxJhMWgcVaRjHCLkdZOCPZJwYaBbA5uZHRXq93qf
 xo4FpOUGp41cbVX2IDBkFK4gxqE7FqStOP0HSRVz7Lq2lkIytZ3KUZXzg g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10262"; a="337636982"
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="337636982"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 11:04:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="531024785"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga007.jf.intel.com with ESMTP; 18 Feb 2022 11:04:02 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 18 Feb 2022 11:04:02 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 18 Feb 2022 11:04:01 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 18 Feb 2022 11:04:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JFBCXkZDErLKu1WL7cuB4XTNwN/0Gs2dtq+xaeF3cAiroMjypt2wn3NMdyQA7MJBk1DlXdtFnErHSqqIwgivAAwCwR5sJAgqenrblVW1FPZfhJbsZqeaoqUf/XaYd540G0EiwJ4LKo5f87VlLUEUZVbfGNzwzTYk0RdipoGKStkhIODMP/zk8Do30FlU1QLC0cpEcX81ynB2kyl0P7UbZaaLfIil6WOSNUGov0fxr313W4fFHklYPnZF47S4RaFWlkPzGfKII77w7/4QOel8wWdfz7NB78zpUToALAqtKXojwXdqJT8MzXMdioHgCQvsrwuPzZ3IV0cfUsAIKgXITQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZL9pC3sMlO3Vd9G5GfJ62WDMhuopVZSW4vFrxSboNcM=;
 b=nQpFf0eP121Cnc5cVRdSW8WcrGxbGuVEuZVAEJnpelFae92AQILbaeVm2ieWvO9jB98JN/l30WLFqIGcHLmQTQYw0BiMlBU5DN3MvcmwIqDXUwY+E1TvDhpNCs20VF9mNzEzyPkupc7qu0IFn1Zx2FIAC8U+rUhA3yQIH8zeQze8onSgQNezMsa1CJSnNyINcHEfUiUBEwR8LsImfsIsx4uYftq20q9lvDp1VBdiObh947NpVad/5Hl0MlDN/CkJNKgQYePFb8mBhJCUjqiCVKqTJL8kXiD/DNg7Ss87j2gTQ/9DZwpdVKqmu4fk9rOmlPRqohIdKDQ2bytnD3XUqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM5PR11MB1595.namprd11.prod.outlook.com (2603:10b6:4:c::14) by
 DM6PR11MB3307.namprd11.prod.outlook.com (2603:10b6:5:9::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.14; Fri, 18 Feb 2022 19:04:00 +0000
Received: from DM5PR11MB1595.namprd11.prod.outlook.com
 ([fe80::4951:2628:ae6a:6c67]) by DM5PR11MB1595.namprd11.prod.outlook.com
 ([fe80::4951:2628:ae6a:6c67%10]) with mapi id 15.20.4995.022; Fri, 18 Feb
 2022 19:04:00 +0000
From: "Doman, Jonathan" <jonathan.doman@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Mantey,
 JohnathanX" <johnathanx.mantey@intel.com>
Subject: Re: Checking for network online
Thread-Topic: Checking for network online
Thread-Index: AQHYJFGTLujjRIKuLE6m1arFIAlZaayZq+6A
Date: Fri, 18 Feb 2022 19:04:00 +0000
Message-ID: <c5ca733f6c1dc5041c787fc160d5bf3e4d722b36.camel@intel.com>
References: <af9a0274-2fb3-8195-a02b-c1d5ecf4848e@intel.com>
In-Reply-To: <af9a0274-2fb3-8195-a02b-c1d5ecf4848e@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 41105d9f-19ef-44ca-994e-08d9f3116c32
x-ms-traffictypediagnostic: DM6PR11MB3307:EE_
x-microsoft-antispam-prvs: <DM6PR11MB3307FD8D6D197893219D818E91379@DM6PR11MB3307.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0de+uNiOpZwXynh1m/JAD8QcqnlbDBmsENsr8qDfueXrqwNI3cbAbqnwkMgfoG2N4QQP83lUowJ9IKq0Utm5svPwIdgnZ/dZUAe38mnEGq7Z4YNUx6VT4L7cB7cV9KHzPFTthvY/aC4hJjxZEQuk8y+vsorZk8NOS6zuh3e/gn08vKtE1sRh1a6FeDCkcuE12Qsk5RPSiul27/03bXb+BHzoHYOg4XHAzgZMR+T8QIJqajUvBUwc4iXvTd7XE4RCot7OkMuGb7N8oFVNcHgOeAGoSfVHjyuEJxMoyousu/aBG1x3Xj7x9Xe58r0TYnCkN0Mk5FzuE2hw6G19K2Enuu1H7X8mBganTQrdgck5fOMFnmD+kUtig/y1UHRESnz1Q90Np7UIvTZ9V3w22/UWY3cYWyOIszJg7k7hffDxG29ZsIUIGJoD/ClzeRx1SrLpmmel9mrYKRw/HMAQztc0q9nr4sBEfXW0q35426/BJXcN/1PrKrAKfR0+kMEtLUgXCZ/Peuz79ayU7LentXb/ItpQrLI1HVIJoJ+9FBGdf1mOgl4PNNT8QmmvV7N/FDV9GKUDV+gXhBzy1hNKvkuIDTnb3IVND5T24BzPXm23GiLqzUMiIX8vQIkLLETVEpLfdSpkq41nGLYa2d8OTRrr8szXPhyOTW5JvqcX8ixkwJQEu64TXUxpqfoku0mbxc9aGeH1QG22rcTUscs5dPIZuQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1595.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(508600001)(6512007)(66446008)(8936002)(8676002)(66946007)(76116006)(91956017)(66556008)(83380400001)(110136005)(64756008)(6486002)(66476007)(38100700002)(86362001)(3480700007)(122000001)(6506007)(82960400001)(5660300002)(2906002)(316002)(186003)(26005)(2616005)(38070700005)(6636002)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?REx3MHM1RE5UYW1IZHVnZ1owWTcyNTdSU0wyL0twbFR0RjZxcjBGY3lTUFhS?=
 =?utf-8?B?VytjSWx6NXNpN0krejNranZhSi9JR0wwM05lc2VPK0xIYWpCbWlyWWM4RG9l?=
 =?utf-8?B?dDRVT1dUNC9Ib1pENDhoQ1A0c2hoeWZST3JhdU1vb2pnQ1kyOUZLRFJCVDF6?=
 =?utf-8?B?WXFQOUFoMzlWT1ZVSUpCWkEwcllKam1tRTVTMkJKNzlZYmpKTkRjRkZqQVg2?=
 =?utf-8?B?QU0xSlNZQmhtR1lYTGdEU2ZndTRqTlFWaFhyaFYyODhSM3pCY2RjWGRXWmNk?=
 =?utf-8?B?MkNpaFg0aUNYa1BlMWtDRlZ4L2d6blJROXJuWEUwV0M5TFNFRDRwWWxZZm96?=
 =?utf-8?B?c2NtTVBiT3lTZW1MUXhpV29Sa0hJdk1WemZETVJJZWJuc3crbnpJcWpkZ0ZI?=
 =?utf-8?B?b0FnQlRhZnRZejEzVWVLWUt2ck85OTZMRk9NWmpLZE1OMk4yTHJDd002dmVS?=
 =?utf-8?B?TUdLN1NtcGg5cWhiTU9TV2k4SFp6MTNyNFpDYm9raE1uNzZlTEo3ZW9rSzhs?=
 =?utf-8?B?TmhFZE5HRlFhemRpcXh1WjFPR0dDa1M0c2tBZGVWVFFBUWY4SGYzVElycDhl?=
 =?utf-8?B?K2pSSGVqaHdscW42K1FzRUMwNW1yRU45dU1xV05zZnNSVzcwNC8vK3FRN2JI?=
 =?utf-8?B?SnA2VXJYY1lWRjh6eUN0d2h2TkVJLzhHUS9zMTBaSmdOcWZyaTQ4alZDM3Yv?=
 =?utf-8?B?SHJ2WFJxYjVCazFHK3c5elNMeVlhZFdiSEIyL1hENUhpL3o2RTBjNFQwdFZI?=
 =?utf-8?B?eE1XNGlhK3VjUjhPNVdlRis0MExrclQ0dURUR1h1V1VRUDlicmpWK3IwSVZI?=
 =?utf-8?B?c1pPVDlLc1ZiTlpJZlZSUEhBRFk5VG1SSFFDYkErNG16UDMreSs5dlgzc1ZM?=
 =?utf-8?B?SktmOU9LZklxQ0o0WTV6Vkl3Q2QrNlFhR1Q2R2p3WkFBK0dSR3pUYzgrempV?=
 =?utf-8?B?WE1qdnVaSEdUNWdrcjI2YlkzVTB3cklva0dDcTRlcXhNQnkzdUhmS2pDR1N3?=
 =?utf-8?B?dGI5TkxJUE5jU2xxYnlEVGoybkpCRzUxV2VRQWJqMGNDUlRVTHd2TTJ1RzV1?=
 =?utf-8?B?Q0tXOGNQMnhEcWp1K25OdkVMS0k4UzFSYmhrVnBURG1EZDgrZXRISkd0MWZ4?=
 =?utf-8?B?Rm9RbXptelljeGd0L3E4SnBUM21EaWJ5NWdsVDJ2UURscnVRZ0tsbjJUN1lF?=
 =?utf-8?B?WmU4NmFna3lNUVYzQ1M3alphemllbkNMWHNlSStzMXp4ZXR5RWhDZWQ0NmtH?=
 =?utf-8?B?YXZwYjZzNGdsVmpmMmsxNnVMUGVlK2JnSFMvTlhEUURxQUJYK1VyWkpId0JO?=
 =?utf-8?B?eWhrcGVVWDdzdEZncXF4YSsra1owdk81OGVTT3dqSTBHUDVHYzBnWnhtbko0?=
 =?utf-8?B?VFpMaTZjR3VENFlwOEdvYTdzUlo3REx2b2dxKzc0ZzNrWEJybE5vUUdIcy9U?=
 =?utf-8?B?Tk0xVGZoN25NSVE1NkdZOU83MHNTdnlPSFA2RlpJS1hIWHh0S1IxZDcvQnhw?=
 =?utf-8?B?d2dDSlFCMkhZNDJyMjNDOTBhU00wMjBTcUZjT3ArajV3bSs2Tmt5bDRVZk1s?=
 =?utf-8?B?cnJmY09jbzF1T2dISEYrLzc1Rk40aVc4OGgyNkx1V2pnOVZwc0YvQmZ1Z0hM?=
 =?utf-8?B?Zm1ra2JXS2JOUHVwVFAwR1pZY3B0NWEvYnV4QWxsKzdHeHh3dVBhZWU2V2NP?=
 =?utf-8?B?Yk9UQzNINjRsUyt1Z1RMNDJ3VkZZRTd2M3NyOE5uOWxHL3dzSE1ZQTk3VE9C?=
 =?utf-8?B?TEtqcmdCRmFHOGw0Vnk3YUpSczJDYThTR0RXWldXYmpnSWVUUUJUcm9SL3Qw?=
 =?utf-8?B?K2pqTHhmK0p4RDJGY0RiVXYzVG5yWUFWMGNBZUMyNWZUWmEzeHl2Q1FETXpF?=
 =?utf-8?B?T3YrcHBhN3c4NUZrNXcwWEZuREZYSDgrL3VRUC9OaU5aOEwvVGlLNDRIR3VX?=
 =?utf-8?B?emlMbVRDazYwdi9OZUkwSzVmVkUvTXRmR2FJUEVEVzZIQ0xJMW5NdzIybGxU?=
 =?utf-8?B?TTYyb3RLSVFKTllBUlVrbzhURmVPZFRFSkNVK2w2R0xpVlJ3T2dDTkRsSHB0?=
 =?utf-8?B?N3AyeWtyY1VXUnBrTEdNT2hyMVU4M2k3QmRXWk1YdkFVb3BiS2hWSVhVblBX?=
 =?utf-8?B?MEtBekZsdnZ6K1NFb2NtWkRqQVEzbUNtUlFYQU5mRWllMG5LNlhTYVdQSnQ1?=
 =?utf-8?B?WURnSG1JUmpMMStvbkQ4cmdiL3k5eFNEbFVMaTZTRmExdkRmOWRMZUZIS1Vs?=
 =?utf-8?Q?Yqtmm6zy3x59SBCgdzjSUMDtZDdwoxIWikYDFyzjxs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7E8DDFAA317C034C8BD37EC21DADE972@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1595.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41105d9f-19ef-44ca-994e-08d9f3116c32
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2022 19:04:00.3791 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c+yQnfmbUzOe53O+IgGuWlfvN8ZDzZLQ+iDyExO8R5mop3HsugQROZ2QJCX70yyDWLLR/2cHSAZCaV51K/pM/wrZDL02JP+6TXuE4zLzckg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3307
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gVGh1LCAyMDIyLTAyLTE3IGF0IDE0OjU0IC0wODAwLCBKb2huYXRoYW4gTWFudGV5IHdyb3Rl
Og0KPiAvSS9udGVsIGhhcyByZWNlbnRseSBydW4gaW50byBhbiBpc3N1ZSByZWdhcmRpbmcgYSBz
eXN0ZW1kIHNlcnZpY2UsIGFuZCANCj4gd2UncmUgaW50ZXJlc3RlZCBpbiBzb2xpY2l0aW5nIGZl
ZWRiYWNrIGZyb20gdGhlIGNvbW11bml0eS4NCj4gDQo+IElzc3VlOiBzeXN0ZW1kLW5ldHdvcmtk
LXdhaXQtb25saW5lLnNlcnZpY2Ugc3RhbGxzIGZvciAxMjAgc2Vjb25kcyB3aGVuIA0KPiB0aGUg
bWFuYWdlZCBOSUNzIGRvIG5vdCBoYXZlIGEgbmV0d29yayBjb25uZWN0aW9uLg0KPiANCj4gVExE
UjogU2hvdWxkIE9wZW5CTUMgcmVtb3ZlIHN5c3RlbWQtbmV0d29ya2Qtd2FpdC1vbmxpbmUuc2Vy
dmljZSANCj4gdW5pdmVyc2FsbHk/DQo+IA0KPiBTeXN0ZW0gQ29uZmlnOiBBbGwgTklDcyBpbiB0
aGUgc3lzdGVtIGFyZSBub3QgY29ubmVjdGVkIHRvIGFuIGFjdGl2ZSANCj4gbmV0d29yay4NCj4g
DQo+IFRlc3QgUHJvY2VzczogVGhlIHN5c3RlbSB1bmRlciB0ZXN0IChTVVQpIGhhcyBBQyByZW1v
dmVkLCBhbmQgc29tZSB0aW1lIA0KPiBsYXRlciBBQyBhcHBsaWVkLiBXYWl0IGZvciBCTUMvQklP
UyB0byBib290DQo+IA0KPiBCZWhhdmlvcjogVS1Cb290IGhhbmRzIGNvbnRyb2wgdG8gdGhlIExp
bnV4IGJvb3QgcHJvY2VzcywgYW5kIHRoZSANCj4gc3lzdGVtZCBzZXJ2aWNlcyBhcmUgc3RhcnRl
ZC4gV2hlbiBzeXN0ZW1kLW5ldHdvcmtkLXdhaXQtb25saW5lLnNlcnZpY2UgDQo+IHN0YXJ0cyBp
dCBzdGFsbHMgd2FpdGluZyBmb3IgdGhlIE5JQ3MgdG8gZW50ZXIgYSBmdWxseSBmdW5jdGlvbmFs
IHN0YXRlLiANCj4gVGhpcyBuZXZlciBoYXBwZW5zIGR1cmluZyB0aGUgZGVmYXVsdCAxMjAgc2Vj
b25kIHRpbWVvdXQgcGVyaW9kIGZvciB0aGlzIA0KPiBzZXJ2aWNlLiBXaGVuIHRoZSB0aW1lb3V0
IGVsYXBzZXMsIGFuIGVycm9yIG1lc3NhZ2UgaXMgbG9nZ2VkIHRvIHRoZSANCj4gam91cm5hbCBy
ZXBvcnRpbmcgdGhlIHNlcnZpY2UgZXhpdGVkIHVuc3VjY2Vzc2Z1bGx5Lg0KPiANCj4gSXNzdWVz
OiBUaGlzIHNlcnZpY2UgYmxvY2tzIGVudHJ5IHRvIG11bHRpLXVzZXIudGFyZ2V0Lg0KPiBwaG9z
cGhvci1zdGF0ZS1tYW5hZ2VyIHVzZXMgbXVsdGktdXNlci50YXJnZXQgdG8gcmVwb3J0IHRoZSBC
TUMgaXMgcmVhZHkgDQo+IHRvIHVzZS4NCj4gVGhpcyBpcyByZXBvcnRlZCB2aWEgSVBNSSBHZXQg
RGV2aWNlIElELg0KPiBUaGUgSW50ZWwgQklPUyBpcyBibG9ja2VkIGZyb20gYm9vdGluZyB1bnRp
bCANCj4gc3lzdGVtZC1uZXR3b3JrZC13YWl0LW9ubGluZSB0aW1lcyBvdXQuDQo+IEJNQyBlbnRy
eSB0byBtdWx0aS11c2VyLnRhcmdldCBpcyBkZWxheWVkLiBKb3VybmFsIGVudHJpZXMgYXJlIGNy
ZWF0ZWQuDQo+IA0KPiBRdWVzdGlvbiBmb3IgdGhlIGNvbW11bml0eTogR2l2ZW4gdGhlIG5lZ2F0
aXZlIHNpZGUgZWZmZWN0cyBjYXVzZWQgYnkgDQo+IHJ1bm5pbmcgdGhpcyBzZXJ2aWNlIGRvZXMg
dGhlIGNvbW11bml0eSB3YW50IHRvIGhhdmUgdGhpcyBzZXJ2aWNlIA0KPiBjb2xsZWN0aXZlbHkg
cmVtb3ZlZCBmcm9tIGdsb2JhbCBidWlsZCBpbWFnZT8NCg0KSSB0aGluayB0aGUgaW5pdGlhbCBk
aXNjdXNzaW9uIGluICNnZW5lcmFsIGdvdCB0byB0aGUgcm9vdCBvZiB0aGUNCmlzc3VlOiBtdWx0
aS11c2VyLnRhcmdldCBXYW50cyByc3lzbG9nLnNlcnZpY2UsIHdoaWNoIGluIHR1cm4gaXMNCm9y
ZGVyZWQgQWZ0ZXIgbmV0d29yay1vbmxpbmUudGFyZ2V0LiByc3lzbG9nIHNlZW1zIHRvIGJlIHRo
ZSBvbmx5IHRoaW5nDQp0eWluZyBtdWx0aS11c2VyIHRvIG5ldHdvcmstb25saW5lLg0KDQpEaWQg
eW91IHRyeSByZW1vdmluZyB0aGUgV2FudHMvQWZ0ZXI9bmV0d29yay1vbmxpbmUudGFyZ2V0IGZy
b20NCnJzeXNsb2cuc2VydmljZSB0byBzZWUgaWYgdGhlIHNpdHVhdGlvbiBpbXByb3Zlcz8gSWYg
aXQgZG9lcywgdGhlbiB3ZQ0KY2FuIGRpc2N1c3MgcmVtb3ZpbmcgdGhhdCBkZXBlbmRlbmN5IG9y
IG1ha2luZyBpdCBjb25maWd1cmFibGUuDQo=
