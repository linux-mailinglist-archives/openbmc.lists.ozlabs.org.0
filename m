Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F33897BE9
	for <lists+openbmc@lfdr.de>; Thu,  4 Apr 2024 01:15:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cKWDr9tS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V90w70s1Dz3dVp
	for <lists+openbmc@lfdr.de>; Thu,  4 Apr 2024 10:15:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cKWDr9tS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Thu, 04 Apr 2024 10:14:42 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V90vQ1y94z2ygY
	for <openbmc@lists.ozlabs.org>; Thu,  4 Apr 2024 10:14:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712186082; x=1743722082;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=yJP+FJwIi1zJ1zvNeNwVQz/59VI4s/HZ4q0DnuTweOQ=;
  b=cKWDr9tS9fTzy8aVuqvGJcNX9GBgPnmBDlGh0LaX6cNV/nA/Jl4n16im
   njWmT7C6d6Cwexo7ZtWb0Xf7xkNE/b2wghNTZuPGsZQr3Npyf/0UyDaNN
   vLWSP9alcKbsNGlSpoLDxo5DXN/hhL3Z0kUEa/0MLPtXnTEY8E0o9Uku2
   ZEd6DrULApQoT/qYFPq6hHvxWq5h7cgmyFf3i0JqrPfM54+cffT3Uitth
   Hh0TKq0dNrEAUW4sh8wiGEZpDV73PCtAtOhzYaF2eCsqtyYZgYX4NI/eL
   uTe8A7dwFA/5zkjnNoTBCQbe8jlYc2A6jTn89jILwua0n2xupha+oqlq7
   Q==;
X-CSE-ConnectionGUID: mLSC1HsQRFy0aDnlmnRRkQ==
X-CSE-MsgGUID: QzVNE3ENSkuIIkm/6NNcHg==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7293430"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="7293430"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 16:13:33 -0700
X-CSE-ConnectionGUID: 8ASjC9thQIuW7RbdBtwxvA==
X-CSE-MsgGUID: eHP4bvq7TzKy2XIm/T1GiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="19044186"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Apr 2024 16:13:33 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 16:13:32 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 16:13:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 16:13:31 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 16:13:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUGZeaZx4EKxZNYX1BoEZ8cA8jkWRpBqKGEiTTM7yLykNLaDaVfOm4kZRPO9S65zSP8jGb+RT4ofLEis/4GvHT3N40cz0SUjYCQXrFMl2lnMXVDhoAaNrkQj1JhvZJO60JR/8svuG+9DZVAxXr7yg7gb46jjXl8kt7MvULWP1bF66wY4nirqweXtL7ivoAqojuNgX9NLT0fwIih/wZIJMLK6MoCZ9388+7KydpW70y7+qhHSSu9OcBy0jtpun2VZeHbGA5SaRlOkCH+5czhk0NjPm3oOQGnBPe/ZlI8svZNWQ8yu/DOx0/qRccoZH3Ckko/F9ZLAzPMzRyeTjTjTKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJP+FJwIi1zJ1zvNeNwVQz/59VI4s/HZ4q0DnuTweOQ=;
 b=lEQh8i9mbCd7XAbfxr7uA5EKhom3Q7YJuvPd4Tyhk3nAvYWYAb2s53EtdPz2eX2dJ2Tq7cXSADy/UefFWm54cZJeAqTppXkpTdggjEm9QNtVEKlRUEZzb19MkSKMyM8bEIxX8VLvbEsoESLQo56ChwsT+JZUGOyhC2ShGLwHFPZbPfSn77aHUCd+JK6ZPWFyxjaSZFKMeTme2avPedt/QuU0k2asJ1HiiJVZEJJr+KeBsSOaRa7wRdXs6Z3jOaZxc0w0IH0ZvS96pET6xdYXzE7pvT7+pV7G66NUdE7qCpEdJ5kxicT9bAWdlh5WeC8oO7uHq+7Iincw6EyruR8cXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5330.namprd11.prod.outlook.com (2603:10b6:610:bd::7)
 by PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Wed, 3 Apr
 2024 23:13:27 +0000
Received: from CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::5627:e6de:5e36:aacf]) by CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::5627:e6de:5e36:aacf%6]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 23:13:27 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "rdunlap@infradead.org" <rdunlap@infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] peci: linux/peci.h: fix Excess kernel-doc description
 warning
Thread-Topic: [PATCH v2] peci: linux/peci.h: fix Excess kernel-doc description
 warning
Thread-Index: AQHaggcJ9XjElys6dkmri3wGFiPcSLFXNQEA
Date: Wed, 3 Apr 2024 23:13:27 +0000
Message-ID: <c28853d7e563482c5682e6cbbe5fcf20f218e487.camel@intel.com>
References: <20240329182910.29495-1-rdunlap@infradead.org>
In-Reply-To: <20240329182910.29495-1-rdunlap@infradead.org>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.4 (3.50.4-1.fc39) 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5330:EE_|PH8PR11MB8107:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lTgDXf+/7m5AcRNycfJK/gWW3gHNJ6yQnTPIeRc8qdyNexq3gh7nVF05Ud4Oae4AduOyoqcnR8gzlC6rRaP9Z37T/rd8ma4JnactAOFCAI8miBccbFEHLhj5hvMy/xRUcNaO13PPcRDXK5vv51N5N0kTNO2Zp9YF5htFY6Ic95AUbrtuY/Hayv5p/AKWWHrEA65B9D1N3zieXYDXxlEQL+tfarZxxY58Jey4XEW3ynxp/LErBdIIvPdvT+X/9/fcDqQsAngf8mtz3TBs4IZ+rEVF+4uXMEEIQAjRb1KG5fx5VL55It1soIuE33dpZAVmmCgAcxXY9RQKaKLwDd5uTxvLCOo8IRxjyYo4lciwlXQDmsePnXrKq7X7On2uKI0moioX1o9bz4jfJ/fW1hu8b/8D64qpZZ/T9ViV/npDHPLTL5RmHmsbqCh67doM4A3HdZhIRZx/aW+9nUmRsH/ZM1HVzi6c2BPdpg+1x56fvRmUYt2JEALYefk9QYe215+uqid6ZfcYj3Oa06cYZdrUt1W9wUyRZM6fEa0A8GGbV46KO9VL4HzQxb1KLpnsYnVdjEHzgS6OVnI8HYc9eIP+9ru4G+bR+PKKYrqinznk980=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5330.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TjJEY1NxL2t1Z1dQS2VsZWtobnVhU2U1OW50ckJqL2p1QVRmUkprOFkrZUx1?=
 =?utf-8?B?ems0L05la1NOZWFUNjJvZVdBc2lJYW9LV2pjRytWMSswZFlsVUtvSitsbTNE?=
 =?utf-8?B?MUZ0dmsrbW1DUG5iZTlSUmp2eEc5TzUyOXhUaWhDMGFhRXlmaW9sNGZQVlQz?=
 =?utf-8?B?bWt0Y2dIYTNoa3c1SGNDUTBsSmFKbUh2Zi9sREE5dCtwUmxmZ2wvQjZuQU5K?=
 =?utf-8?B?KzIzVUZxYUJCQmF5VTR4bGFaVmFCTDhxdWV2NjFKWmR4RWI5Yys1U1Y3WWFF?=
 =?utf-8?B?YldBWTl6ZUhwSkV1WlBXWXpROW15aWNIb2JiTVozeHhsSjhaMERYV3BId3N4?=
 =?utf-8?B?WU9ucW9kdXorcWlzSHdCcU4ra2M1bnR4Y09BQlIrMTFDUXZBcERIZFNVdTB6?=
 =?utf-8?B?RHhSa0VpNFRMWk1OZmNKUUcvdmpuQ1BuRXF0L1RwRnF5MEFnaTdPYlhPQlNp?=
 =?utf-8?B?MFFFRWlDSjVEbkJ0L3RWbE1LWDhLMTcya2JJU1R1cHFHYWxVdHdQNVZrYWtD?=
 =?utf-8?B?eHovUThSaEdibUV0VzQvbm4xM2V2Z2JxVkoxZHlseUI2Z2xkQU40Yk5lWU5q?=
 =?utf-8?B?NDJSaU93OTdFNS84YUlheVNVbm55ZVdydWZvdlZXVUNkRDUwbjd2VGVFckxq?=
 =?utf-8?B?aWU4YlRwYnRBVjlCNThzUTI2Rnc0MmNhZXM4aGwvVDJHNTd0a3hXdDBaTDNY?=
 =?utf-8?B?eUxudjZyeU1SMHlKUnVUdDF5MHBIOHJza01zTnVPZDVSd3ZwMFU0aXk1akJN?=
 =?utf-8?B?WWN0V1dVNi9IYkZaK0lZcksvTnJkeVVORjViNlpjazlOaHBxeU1KbjY3SUtZ?=
 =?utf-8?B?YTlleFhZWndQd0w1c1V0RnFRU2dSRXBJZWpMaWRlWnZVOEhMMmtxZlhiaFJ3?=
 =?utf-8?B?RDdFQ1hqM1hjcUZiSFJyYmVPSk5MUmlKMVJxK0ZnQTJpUU16S3NoRGduRlU2?=
 =?utf-8?B?YUkxRXJ3WG1oUFRRRTVZT0FvQStLK0JQbzh3YTFuQWY0dWk3QnRscWNRTWpP?=
 =?utf-8?B?dkRySnFMUERXcnFaUHd2c002dExwKzA5L0JuVHJCejYvQ0lOdEkxazBWRTgw?=
 =?utf-8?B?Y1lTL2FzR1dUUy95b2lxWEozTkhIeWp0RWtXU3FBZjNUWTNGdXE1MmdEemV2?=
 =?utf-8?B?VDArdDBJWExXbTBsNlpGRGJnQWJtVXZYaTE0UTBaMWVlMU4weGU5b0xKNGdo?=
 =?utf-8?B?bnJiaytTTGoxdkpGY3FMWHEzWlVPVWRJRHJ3Q2hyODl6akFQVjlXT3hySHFY?=
 =?utf-8?B?U3BUUGt0M0NYS2VwSVErMzltczBvd0cwU0dVQ1BFZy9PTmY1djNLM2FJMGY3?=
 =?utf-8?B?US9PVUlUY3ArRDBmZ3VwcFd2ZjJWREt2cmgwbXcvcFhmNFNHMEtZUmNldHUx?=
 =?utf-8?B?OXQ4QVpGMXA1Ly9POGw2ZWR1cGN3R09aL0Zyd25tSkthc2g1NWFwRTRpd0E3?=
 =?utf-8?B?Q3ltUVB6U1BEb1BMQTkrUmFvRG1iSEdFaElrODZXMTV5VFdrVGJLS1g4Q3pK?=
 =?utf-8?B?cFJJbXNNUVpvNUJyODJqZFhsWWVaeXAvaVRtSVY5dkhCQ0V2bGkzYkZIQi9Q?=
 =?utf-8?B?cldZQ1Z0Z2NCTHV5WlZDMHhQb1JCZi9xWDUyWHlYUWJDK01ET3VNdzZ1WjlP?=
 =?utf-8?B?dlROcEdrZDJLbXc3VTc3MGJPRWRROUxKbTVzOFJiNmN4Y3lMUyt4aFRnQmE3?=
 =?utf-8?B?ZFlNSE53RTEwM1d1akpBNk52L0ZFWVJON0lkaHg1U21EYzE5M3ZQUnRISGQ2?=
 =?utf-8?B?aEJGZVBvb045WlNtd3hmb1B1MERnN205UG9LalYxTVhSWVAyMm1ITnRMNVZH?=
 =?utf-8?B?bWtydU1rend1S0dIcktjUEVwQVVpaWhiM2EyODhic3AvS1RHNnNhRm41cVlQ?=
 =?utf-8?B?d0N4OFNvTDJ4d1Ntc25BY2VNeldMNlBEaEhaa2w0SUI0bk02U1BxaWdGaXpq?=
 =?utf-8?B?WTFDcUtDbk9XcGN6Q3JsbXowVUZ4WDFLeERSNWFSQXBhZm1tZWhkU01OTTZz?=
 =?utf-8?B?Q3kxOEJMeXcxaDBUR0w2Yy90VTZRMGhtNGhNNDdhQWdDNEVRYVlWcm9oZEEx?=
 =?utf-8?B?NjJCNmo5enZjVjNZcTN5eXJHOXpnMHd0Ri9yRVc1RU5uRVRzYzR6K3VRQXBH?=
 =?utf-8?B?d1FhYU04RjI0MzdHYzRoZHgzaVNSQVE2Unl2UW9HR1R6SVJmbEUvZDl4U1Np?=
 =?utf-8?B?Q2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6C8FDE8B570524B91DB6CD0649C6DE4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5330.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a2fcdf-3916-4440-2d94-08dc5433ab69
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2024 23:13:27.5169
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PAxWSajal93iMr8tgBjby6Dmt4qQwLEAFGaipwPTUi1lJiJwA83B0/nGQCsnippZHHLz/YG6Cw6hvrqPZ9QKWIdzNw8CwGpr6uq1X+iAJAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8107
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gRnJpLCAyMDI0LTAzLTI5IGF0IDExOjI5IC0wNzAwLCBSYW5keSBEdW5sYXAgd3JvdGU6DQo+
IFJlbW92ZSB0aGUgQGNvbnRyb2xsZXI6IGxpbmUgdG8gcHJldmVudCB0aGUga2VybmVsLWRvYyB3
YXJuaW5nOg0KPiANCj4gaW5jbHVkZS9saW51eC9wZWNpLmg6ODQ6IHdhcm5pbmc6IEV4Y2VzcyBz
dHJ1Y3QgbWVtYmVyICdjb250cm9sbGVyJw0KPiBkZXNjcmlwdGlvbiBpbiAncGVjaV9kZXZpY2Un
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9y
Zz4NCj4gQ2M6IEl3b25hIFdpbmlhcnNrYSA8aXdvbmEud2luaWFyc2thQGludGVsLmNvbT4NCj4g
Q2M6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KPiBSZXZpZXdlZC1ieTogSXdvbmEgV2luaWFy
c2thIDxpd29uYS53aW5pYXJza2FAaW50ZWwuY29tPg0KPiBDYzogR3JlZyBLcm9haC1IYXJ0bWFu
IDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gLS0tDQo+IHYyOiBhZGQgUmV2LWJ5LCBh
ZGQgZ3JlZ2toIGVtYWlsDQo+IA0KPiBXb3VsZCBpdCBtYWtlIHNlbnNlIHRvIGFkZCBHcmVnIGFz
IE06IGluIHRoZSBNQUlOVEFJTkVSUyBmaWxlPw0KPiBIb3cgZG9lcyBzb21lb25lIGtub3cgdG8g
Q2M6IEdyZWcgb24gUEVDSSBwYXRjaGVzPw0KDQpIaSBSYW5keSwNCg0KTm9ybWFsbHkgSSB3YXMg
dGFraW5nIFBFQ0kgcmVsYXRlZCBwYXRjaGVzIGludG8gcGVjaS1uZXh0IFsxXSBhbmQgc2VuZGlu
ZyBhIFBSDQp0byBHcmVnLiBVbmZvcnR1bmF0ZWx5LCBJIGRpZG4ndCBtYW5hZ2UgdG8gc2VuZCBp
dCBpbiB2Ni45IGN5Y2xlLCB3aGljaCBpcyB3aHkNCnlvdXIgcGF0Y2ggZGlkbid0IGxhbmQgaW4g
bWFpbmxpbmUgeWV0LiBTb3JyeSBhYm91dCB0aGF0IGRlbGF5Lg0KDQpbMV0gaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvaXdpL2xpbnV4LmdpdC9sb2cvP2g9
cGVjaS1uZXh0DQoNCi1Jd29uYQ0KDQo+IA0KPiDCoGluY2x1ZGUvbGludXgvcGVjaS5oIHzCoMKg
wqAgMSAtDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS0g
YS9pbmNsdWRlL2xpbnV4L3BlY2kuaCBiL2luY2x1ZGUvbGludXgvcGVjaS5oDQo+IC0tLSBhL2lu
Y2x1ZGUvbGludXgvcGVjaS5oDQo+ICsrKyBiL2luY2x1ZGUvbGludXgvcGVjaS5oDQo+IEBAIC01
OCw3ICs1OCw2IEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IHBlY2lfY29udHJvbGxlciAqdG8NCj4g
wqAvKioNCj4gwqAgKiBzdHJ1Y3QgcGVjaV9kZXZpY2UgLSBQRUNJIGRldmljZQ0KPiDCoCAqIEBk
ZXY6IGRldmljZSBvYmplY3QgdG8gcmVnaXN0ZXIgUEVDSSBkZXZpY2UgdG8gdGhlIGRldmljZSBt
b2RlbA0KPiAtICogQGNvbnRyb2xsZXI6IG1hbmFnZXMgdGhlIGJ1cyBzZWdtZW50IGhvc3Rpbmcg
dGhpcyBQRUNJIGRldmljZQ0KPiDCoCAqIEBpbmZvOiBQRUNJIGRldmljZSBjaGFyYWN0ZXJpc3Rp
Y3MNCj4gwqAgKiBAaW5mby5mYW1pbHk6IGRldmljZSBmYW1pbHkNCj4gwqAgKiBAaW5mby5tb2Rl
bDogZGV2aWNlIG1vZGVsDQoNCg==
