Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF873435A4F
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 07:22:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZbTh3LBKz2yp8
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 16:22:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=o38bxOJJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=mei.xie@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=o38bxOJJ; dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZWV50f7Nz2yKJ
 for <openbmc@lists.ozlabs.org>; Thu, 21 Oct 2021 13:22:50 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="292391544"
X-IronPort-AV: E=Sophos;i="5.87,168,1631602800"; d="scan'208";a="292391544"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 19:21:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,168,1631602800"; d="scan'208";a="632020708"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga001.fm.intel.com with ESMTP; 20 Oct 2021 19:21:44 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 20 Oct 2021 19:21:43 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 20 Oct 2021 19:21:43 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 20 Oct 2021 19:21:43 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 20 Oct 2021 19:21:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dhqP8hKWgizC3Oco/wc39m3KTwkJwJEhoIDEgm3GkU3214l9wD6O7S+vKXoa7EH06XgyYT5j6lonzwlX5aYHIt+br//0LLu1O4M0BvSOL+Ul38CnZyRqrEHHnx/Gw1k/H+oHn1vMgCpRfndeofPdbarV6D/zszhopPuAM94p0SR2zYeB8S580R02Oa0Gan4o2idocY5JCH9KgJRPBkIdDqJ7SFNLaU9YhCcO3rv2nSVUqPXynGNMAUg9G9yVtrGYnD1XvdAsoW0ByduiB4OiUysBn4DkCZHFyOgojb/VYj4E/mj6rhGIrPBjHpw7N1DsF/WOzW5gvLS0Ym081k5zGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOmG8EGyScJ7mZDABIb4Zzkznbwu/JTDhg6SnKbo4+k=;
 b=l9ZFeHsWZveCoYT0FyWNjFGKNWHg4oWPPJd+UuW5A727aa0u1B0sKTa+gyQiO35OujgB5CLj3NxeZnQShV4yEDd8H+KaCLT7lRP3z7cG8B8qrdZ2GW7NJXgtjABhgMF/zZ4AmM2+wJqXUPO6dek1rXizs6XrPu45siAu0qTk+uwvsyasSA31hsf0HnFeJMnhaPQ1VKpt47mhrUQtKnfDyg/8KcV8EMV6K4addK0dQtwmHx1OqB2bfFkw97r21XoLhxQUkD+rPpDyA4GhPrJQZhgPbY23isd3riczWs+lklatj7IOz49bdSbz59wOp4kzSXVQkzhGuiGzfV+HDBKfIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOmG8EGyScJ7mZDABIb4Zzkznbwu/JTDhg6SnKbo4+k=;
 b=o38bxOJJvFYRePdyb+eb+YClZbf7DdLyYKRBqhZKgtmaQUYaV2vGH4r5i9iFCpk3NsbH/KzQq3HIpbDbKw0ju9xbwxL6rI46YuEoj//FFupc+MwghU49QJZeJ941PKvYP2GfIi3tMjqdgG6RLZCyXF6lwEONkYcUMv3BUGzBILo=
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 DM6PR11MB4396.namprd11.prod.outlook.com (2603:10b6:5:203::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.18; Thu, 21 Oct 2021 02:21:40 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::4c7b:bf49:9511:30da]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::4c7b:bf49:9511:30da%7]) with mapi id 15.20.4608.019; Thu, 21 Oct 2021
 02:21:40 +0000
From: "Xie, Mei" <mei.xie@intel.com>
To: Andrew Geissler <geissonator@gmail.com>
Subject: RE: Question about power_restore_policy one time in
 phosphor-state-manager repo
Thread-Topic: Question about power_restore_policy one time in
 phosphor-state-manager repo
Thread-Index: AdfFpIiEpcPEwnNhRkKb6EfunqCKlAAGtgIAABil3VA=
Date: Thu, 21 Oct 2021 02:21:40 +0000
Message-ID: <DM4PR11MB53092EC1F8A352EDE827D8DAF4BF9@DM4PR11MB5309.namprd11.prod.outlook.com>
References: <DM4PR11MB53098DFBA31C8060FA3B7FD7F4BE9@DM4PR11MB5309.namprd11.prod.outlook.com>
 <1AE5C7D9-A6C3-45CD-9882-54F83D25A55B@gmail.com>
In-Reply-To: <1AE5C7D9-A6C3-45CD-9882-54F83D25A55B@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1bd255d4-6292-4e8e-fad3-08d994398491
x-ms-traffictypediagnostic: DM6PR11MB4396:
x-microsoft-antispam-prvs: <DM6PR11MB439629A989590B566BCC6FB3F4BF9@DM6PR11MB4396.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AYMT/YOMzkASOQ1EP01wj3mIva7nz0XCOTQo+cWl1q6u61vKN6McXSNuTif9eiWoNTy1EL5DsIjmhnm0eVSoFPHTg5SY7I4IoRP6XEcuoZ0A/my6evS7gE6ev66XV8cyP30gG4dKDcJJxQqGPrjDjgxrkRvnfYgZAwJEQjNN0ck/pudK41hZV7mfPQeNKtdBPrTXRaoJl9HkQ6NcbfGHfSp1BXOjG+2H82H1fRATHk9Yly8iq15QrJ2xzbyvhSJmlhMm5uXrKGhM33LU+ogzYrAuXRTfrWoPE4Ux/C23D7hqxp48jM8OJSyAmiBS3vux+7G1JjOwpvOQ+ovnDFcguNMpgOq80i1LyGL/61lK9wlmI6C2ge0J8Hlk4E19TW5Obn4f27o9UaV+jb6aA+xi82IBY/XTHO9CEW6UyO/hlErfSqjsge31LNZsCKrqYY/mUlQv5ublTMi+7ATLqE+CRJZ+wXjYi6mcZ4kUFyg+S0dqrC9RubzALtKq7xBCkdR6hYI1HAIsR/tVOEctXVfIy3qXbv20yA6wDZu4HzHeFTTqF0kuncCmRH0Hl9slOTkVFfhwfvo638+pMHqs07l61QNlh9tNlYa8Dpis19KF9bjb0pdVuuLLggkHml4I/HsU8oPSmTsQ0DO2lJFS2DGlyZCj5DLs52eDZR/HIiqxRsZNyWiIGJwDFmnaH/A/OnQAQDsfUEKEnDas2/VDt//BD/Taz6+rtAH3sciD4h+Onijn41xPH6auwOFbbe8mw8/m6YneVEE1JbgbzHgm7EN+wPY+nftQsLP9RPPzTgGmlM+en1YurAa5rmN9jZUw4DW3PC0cUWwwTISYfEfmDDnvRg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(55016002)(33656002)(26005)(508600001)(66446008)(86362001)(64756008)(66556008)(82960400001)(53546011)(52536014)(6916009)(186003)(966005)(38100700002)(122000001)(71200400001)(38070700005)(66476007)(4326008)(76116006)(66946007)(2906002)(8676002)(83380400001)(9686003)(6506007)(316002)(7696005)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WVBaWUY1SWVEWHM2dzcyWVNBRDdoWEt4ZmZiTS9xZEdBOXNZeU5xWnpqTkJZ?=
 =?utf-8?B?NENBNWFKb0c4YTBqU1poMHJXbG44ZE0rQ2RGR05GUUZkOWlMbUVoWmxzNTNU?=
 =?utf-8?B?M1o4ZGdCT0FMRGl2Z2pjSHZzLzhFTWZxTW1ITFdBdVgvYkxGZVlEMkFXOWZz?=
 =?utf-8?B?cHF5VUIvNGNoRjR4R29ldWRTS2Z6QmdyN0RWakhNQUNJbHpFREtFVXVraGli?=
 =?utf-8?B?WmJ0RXBkUEF4OG1QU2djYzQxQVpkVHE0dGt1TmE3MmxkMHhkV1Vxc3F4Rkxa?=
 =?utf-8?B?Z1YyVHE1c2dYaG0ySlZLNDIxMXA5NklWMmNXSkZ1ZE9CZktYTnVZU3dKTjRu?=
 =?utf-8?B?UjdTTzhaMHM2YmxmbDduOHFKVnRxM1daMENNYlVIcWtRMWNjMjVZZ3dxVkNV?=
 =?utf-8?B?b0Z1ZHV0bVJIVWtZWGxnRnAxVFVpbGs3TjJnT1RHc1FCbVdrSU92Qm9hd1lo?=
 =?utf-8?B?ZVVHNEZVaG04ZFRjM0lPZ3BGam83dVZpN1I4aW1zRGJoWk1yZlUwM2s2ZE8r?=
 =?utf-8?B?S0F6dFdYalE0U1JBRDFKSExnaFBVVlhFdW9IbXJvaEFVNHdIcklEVllFOXhm?=
 =?utf-8?B?NTBPWFRrS1ZRSDNDb0owM0FqdzBZSmxpYmt0Q1IxMm1Ib0p5N090L0JGNU1X?=
 =?utf-8?B?Umhva1JxTVhrRWNNZmRPYWs0N09RVXZob1dxNFpPdGtvZXh2Q3poQWlrM3Nt?=
 =?utf-8?B?WjVFSjBxQzZOL2lqTEhIWUN3TmduSnBRUUxadDFjNDVmYjhoOXJ4WUpTaHNw?=
 =?utf-8?B?c3FneDEyWktkYUR3MlVaMC9uOUcvc28xSXh0eUVIeHhScWwvYkR2TzAza1Qz?=
 =?utf-8?B?cERkQnJoUUZuSVVKVVVYSUd1N3JxN3VPOVlaMlh6aG1qWFlIaUx5akhRYnBw?=
 =?utf-8?B?TnNIZU9tSVlxSmJYSzkwYnRNdnNxdThDaHpmUlk4TnRLOXVtazdEVFl4VitV?=
 =?utf-8?B?UVQ1TFlUMzRSa2tXVnpiTnM3TjE1c2RzeElFTDdObURNOGVwZWNKYW8vWGcz?=
 =?utf-8?B?MnZnK2QyR1V5Z0ZwYlBSdFhOUnlSOGtIVzErN2NNeXFhK3hvWDNjcXVlNFp4?=
 =?utf-8?B?ZFhLQlY0OHJSU3VKRk9XbGpGdnUralVlcWJod2ZYT3oyQWtzKzRTcUJZamxH?=
 =?utf-8?B?NXBQbm5sUmRsUE9RcU9oUmpHMjNpQW5lRnllRHpwMWJXdWo2cDlsV3o2Z0lB?=
 =?utf-8?B?WDBFS1YxMFR1dSt2NllHRWVPZklIMWlwU0lZcTU2aVl2c1RlY3hqUk9mTHRG?=
 =?utf-8?B?eEpxdUFEWk5mZWduU3lIZ0RIRTM3Tm1JUUZyZ3JQbHY0cjI4VGhOOEVQWHFn?=
 =?utf-8?B?R0p2Qys2WFBvaDd2NERGcDZVYmFnK2oyNFJ3MTMvd2d1azZKTmRrZ1IzTjhn?=
 =?utf-8?B?ZGh0Z202cEtNT2RXYTFqbGtNMFd3ekExTEgxRGdrb1V2OTJoMlplT1NUNVhu?=
 =?utf-8?B?OG54UGp1aFE5MllkbmEwOWhsL2Q5THBKZXdvcUVjQXM5aHhZTUprbnhlZHBY?=
 =?utf-8?B?QWFwUkpRRnBCZEw5ZCtBRWthL2dDT0o3aG5jTkN2cVJVWTYzYWdUWEhqMmxx?=
 =?utf-8?B?bnlpNTM3V1ZtdXp2NkUycVFaNEE1aTJCQTlTYVNDeVFqZWdDZkIwZXUyUFlp?=
 =?utf-8?B?U1JtbDUxT3Q3eVY4QXBER0NjUzIyckh0RDV3TmExbkxWT1oxcXJLanVrTU9X?=
 =?utf-8?B?QjdrVnBqY2VBcE15UVN1TU5WbzdoL29ncUJFWGI1bnV4Mk5GeU96eGhBaUI0?=
 =?utf-8?Q?Zug/Cfl5VJnlUh0DGbhPNR8+FcV5ycxjM9I+AeM?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd255d4-6292-4e8e-fad3-08d994398491
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2021 02:21:40.7264 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yS17Ooe2Q7VbNtKQY9kz4qiMvYPzq2YE08ow9dLEHAUVDb/f0pdi/MexiTAoJDt8szlDq9UXPC5xyc/xrQ2ntw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4396
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Thu, 21 Oct 2021 16:22:26 +1100
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

PiB4ODYtcG93ZXItY29udHJvbCBpcyBhbiBhbHRlcm5hdGl2ZSB0byBwaG9zcGhvci1zdGF0ZS1t
YW5hZ2VyIGFuZCBpbXBsZW1lbnRzIGEgbG90IG9mIHRoZSBzYW1lIGludGVyZmFjZXMuIE15IGd1
ZXNzIHdvdWxkIGJlIHRoYXQgeW91IGhhdmUgdGhpcyBpbnN0YWxsZWQgb24geW91ciBzeXN0ZW0u
IEnigJltIG5vdCBzdXJlIHdoZXJlIHRoZWlyIHN1cHBvcnQgaXMgb2Ygc29tZSBvZiB0aGVzZSDi
gJxleHRyYeKAnSBmZWF0dXJlcyBsaWtlIG9uZV90aW1lLiBJdCBtYXkgYmUgdGhhdCBpZiB5b3Ug
bmVlZCB0aGlzIG9uZV90aW1lIGZlYXR1cmUgeW914oCZZCBuZWVkIHRvIHN1Ym1pdCBzb21lIGNv
ZGUgdG8geDg2LXBvd2VyLWNvbnRyb2wgdG8gc3VwcG9ydCBpdCBzaW1pbGFyIHRvIHBob3NwaG9y
LXN0YXRlLW1hbmFnZXINCg0KWWVzLCB5b3UgYXJlIHJpZ2h0LCB4ODYtcG93ZXItY29udHJvbCBp
cyBpbnN0YWxsZWQgaW4gbXkgc3lzdGVtLiBVbmRlcnN0b29kLCBzbyBJIGRvbid0IG5lZWQgdG8g
cGF5IG1vcmUgYXR0ZW50aW9uIHRvIHRoZSBwaG9zcGhvci1zdGF0ZS1tYW5hZ2VyIHJlcG8sIEkg
Y2FuIGFkZCB0aGUgY29kZSB0byBzdXBwb3J0IHRoZSBmdW5jdGlvbiBsaWtlIG9uZSB0aW1lIGlu
IHg4Ni1wb3dlci1jb250cm9sIHJlcG8uIFRoYW5rcy4NCg0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogQW5kcmV3IEdlaXNzbGVyIDxnZWlzc29uYXRvckBnbWFpbC5jb20+IA0K
U2VudDogV2VkbmVzZGF5LCBPY3RvYmVyIDIwLCAyMDIxIDEwOjMzIFBNDQpUbzogWGllLCBNZWkg
PG1laS54aWVAaW50ZWwuY29tPg0KQ2M6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KU3ViamVj
dDogUmU6IFF1ZXN0aW9uIGFib3V0IHBvd2VyX3Jlc3RvcmVfcG9saWN5IG9uZSB0aW1lIGluIHBo
b3NwaG9yLXN0YXRlLW1hbmFnZXIgcmVwbw0KDQoNCg0KPiBPbiBPY3QgMjAsIDIwMjEsIGF0IDY6
MjAgQU0sIFhpZSwgTWVpIDxtZWkueGllQGludGVsLmNvbT4gd3JvdGU6DQo+IA0KPiBIaSBHZWlz
c2xlci9hbGwsDQo+ICANCj4gSSBhbSBYaWUgTWVpIGZyb20gaW50ZWwuIEkgYW0gZm9jdXMgb24g
T3BlbkJNQyBkZXZlbG9wbWVudC4gSSBtZXQgc29tZSBxdWVzdGlvbnMsIGhvcGUgeW91IGNhbiBo
ZWxwIG1lIHRvIGZpZ3VyZSBpdCBvdXQuIFRoYW5rcy4gSg0KPiAgDQo+IEkgc2VlIHRoZSBiZWxv
dyBwYXRjaCBpbiBwaG9zcGhvci1zdGF0ZS1tYW5hZ2VyIHJlcG8uIA0KPiBXZSBhbHNvIG5lZWQg
dG8gYXV0byBwb3dlciBvbiBhZnRlciBiaW9zIGluLWJhbmQgdXBkYXRlLiANCj4gQnV0IEkgaGF2
ZSBiZWxvdyBxdWVzdGlvbnMsIGNvdWxkIHlvdSBwbGVhc2UgaGVscCB0byBsb29rIGF0IHRoZW0/
DQo+IAnigKIgRG8geW91IGtub3cgd2hlcmUgaXMgdGhlIGRlZmluaXRpb24gb2YgL3h5ei9vcGVu
Ym1jX3Byb2plY3QvY29udHJvbC9ob3N0MC9wb3dlcl9yZXN0b3JlX3BvbGljeS9vbmVfdGltZT8g
QmVjYXVzZSBpbiBteSBjb2RlLCBJdCBkb2VzbuKAmXQgaGF2ZSAveHl6L29wZW5ibWNfcHJvamVj
dC9jb250cm9sL2hvc3QwL3Bvd2VyX3Jlc3RvcmVfcG9saWN5L29uZV90aW1lIHBhdGguDQo+IDxp
bWFnZTAwMS5qcGc+DQoNCkhpIE1laSwgdGhlc2UgYXJlIGRlZmluZWQgd2l0aGluIHRoZSBwaG9z
cGhvci1zZXR0aW5ncyBhcHAuIFRoZXkgYXJlIHB1bGxlZCBpbiB2aWEgaHR0cHM6Ly9naXRodWIu
Y29tL29wZW5ibWMvb3BlbmJtYy9ibG9iL21hc3Rlci9tZXRhLXBob3NwaG9yL3JlY2lwZXMtcGhv
c3Bob3Ivc2V0dGluZ3MvcGhvc3Bob3Itc2V0dGluZ3MtZGVmYXVsdHMvZGVmYXVsdHMueWFtbCBz
byB5b3XigJlkIHdhbnQgdG8gc2VlIGlmIHlvdXIgc3lzdGVtIGhhcyBzb21lIHNvcnQgb2Ygb3Zl
cnJpZGUgdGhhdOKAmXMgbm90IGJyaW5naW5nIHRoaXMgaW4uDQoNCj4gCeKAoiBJIHNlZSB5b3Vy
IGNvbW1pdCBpbmZvLCB5b3UgdXNlIGRidXMgdG8gaW52b2tlIG9uZV90aW1lIHBhdGguIFdoZXJl
IHdpbGwgaW52b2tlIHRoaXMgb25lIHRpbWUgZnVuY3Rpb24gaW4gY29kZT8NCg0KQXMgeW91IG5v
dGUgYmVsb3csIHN1cHBvcnQgZnJvIHRoaXMgZnVuY3Rpb24gaXMgaW4gaHR0cHM6Ly9naXRodWIu
Y29tL29wZW5ibWMvcGhvc3Bob3Itc3RhdGUtbWFuYWdlci9ibG9iL21hc3Rlci9kaXNjb3Zlcl9z
eXN0ZW1fc3RhdGUuY3BwDQoNCj4gCeKAoiBJbiAvdXNlci9iaW4gZm9sZGVyLCBJIGRvbuKAmXQg
aGF2ZSBwaG9zcGhvci1kaXNjb3Zlci1zeXN0ZW0tc3RhdGUgaW4gbXkgcGxhdGZvcm0uIFNvIG1h
eWJlIHBob3NwaG9yLXN0YXRlLW1hbmFnZXIgc2VydmljZSBpc27igJl0IGV4aXN0ZWQgaW4gbXkg
cGxhdGZvcm0uIFRoZXJlIGFyZSBzZXZlcmFsIHNlcnZpY2UgaW4gcGhvc3Bob3Itc3RhdGUtbWFu
YWdlciByZXBvP2h0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bob3NwaG9yLXN0YXRlLW1hbmFn
ZXIvY29tbWl0LzM1Y2EyZTM0Y2QwNGI3Mjg4YTViNjU5ZTRlN2RjZDQ1OTAwNTZiN2QNCg0KeDg2
LXBvd2VyLWNvbnRyb2wgaXMgYW4gYWx0ZXJuYXRpdmUgdG8gcGhvc3Bob3Itc3RhdGUtbWFuYWdl
ciBhbmQgaW1wbGVtZW50cyBhIGxvdCBvZiB0aGUgc2FtZSBpbnRlcmZhY2VzLiBNeSBndWVzcyB3
b3VsZCBiZSB0aGF0IHlvdSBoYXZlIHRoaXMgaW5zdGFsbGVkIG9uIHlvdXIgc3lzdGVtLiBJ4oCZ
bSBub3Qgc3VyZSB3aGVyZSB0aGVpciBzdXBwb3J0IGlzIG9mIHNvbWUgb2YgdGhlc2Ug4oCcZXh0
cmHigJ0gZmVhdHVyZXMgbGlrZSBvbmVfdGltZS4gSXQgbWF5IGJlIHRoYXQgaWYgeW91IG5lZWQg
dGhpcyBvbmVfdGltZSBmZWF0dXJlIHlvdeKAmWQgbmVlZCB0byBzdWJtaXQgc29tZSBjb2RlIHRv
IHg4Ni1wb3dlci1jb250cm9sIHRvIHN1cHBvcnQgaXQgc2ltaWxhciB0byBwaG9zcGhvci1zdGF0
ZS1tYW5hZ2VyLg0KDQo+ICANCj4gSSBhbSByZWFsbHkgYXBwcmVjaWF0ZSBpZiB5b3UgY2FuIGRv
IG1lIGEgZmF2b3IuDQo+ICANCj4gQmVzdCBSZWdhcmRzLA0KPiBNZWkNCg0K
