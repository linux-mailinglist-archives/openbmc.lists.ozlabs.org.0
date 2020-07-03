Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F5721306E
	for <lists+openbmc@lfdr.de>; Fri,  3 Jul 2020 02:19:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ybF05Ts6zDqmC
	for <lists+openbmc@lfdr.de>; Fri,  3 Jul 2020 10:19:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=zhikui.ren@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=oqqe1LJp; dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ybD84GQvzDqB0
 for <openbmc@lists.ozlabs.org>; Fri,  3 Jul 2020 10:18:43 +1000 (AEST)
IronPort-SDR: Ieofob2JYpYtd/lAx3gLUyjqr3882wO1jxbChWvlW2ZEX6lWjOENMFwf/FZgl1iI84IMk4hz2L
 C8ZnE0CqE5SQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="135339605"
X-IronPort-AV: E=Sophos;i="5.75,306,1589266800"; d="scan'208";a="135339605"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 17:18:41 -0700
IronPort-SDR: dQ9c7SCWKqoDFgoB6D383MUqB+iALD+tIzltN+tfKK2th8dZXEpKcYrGewzDInoIfvaK0ujPej
 I9n5MXXuAB3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,306,1589266800"; d="scan'208";a="313176514"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga008.jf.intel.com with ESMTP; 02 Jul 2020 17:18:41 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 2 Jul 2020 17:18:40 -0700
Received: from fmsmsx153.amr.corp.intel.com (10.18.125.6) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 2 Jul 2020 17:18:40 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 FMSMSX153.amr.corp.intel.com (10.18.125.6) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 2 Jul 2020 17:18:39 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Thu, 2 Jul 2020 17:18:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GXPfQ91cpF/FD+1IsODfaGO8hNQDvWhThWQyBU1wWc7YINheuX/S+aqsh9/GtRaN4Dw3LSHxLytuBOvldT0OBa98iEHCrGTfJPlEmEfyFNTl1HDa7NqR1Xbbqggq54H8ucKjihXyNrVDE8JUEb/5T7xx0lLAtb0spycj1qrrx1/zZmrDaIWXj4mZoV08vgq9GSXj3l5ItV9K3YoshtSsITBV+ns2ddJrqXV3fJYmsAhXguARm44BWS8zKiWKRWqEFm56x3rlacPiL95WXux4bPz8g7LvOOifxMvD0e9VydUgkVByaQdhE28MobRct+W8bnlUpVcBHGf6i0+E8IrQJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09mchSszMzWg5dC3qxlFrc0GmGQXPcUfMHXF8O9BAjs=;
 b=DPW6my7bt8Ye8y7dH6plNMiNIVDECQ42FmeQIYGtII7zJmQQCA/FmPbTtr9C6kCg/bU3HAUrVm9Kega1wEIr+qRygzFyCbEEgyzSLZBERdBO6EKfEuSnnTFkeDTl/kAYQtkCi4+y/dOzTIToc7TgifWSYPKZPhCXwybG8f1cu98Zu6nhFJIGGR7yjjGByU6WbnTmeFc2MxSdL90ww9ROUUYV+KjmeLabx7tTD+xTuJiiy3rOX31ngfguQIqHHH34BVWa5bvAjl38QLQWwwzhAmKK90BFWMvSVV/u77BC4yKFimNEN/q2Z5nNEwUJnJzMjb45IcutnYrwyeM16os8kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09mchSszMzWg5dC3qxlFrc0GmGQXPcUfMHXF8O9BAjs=;
 b=oqqe1LJp7B7THoEiuvbbQ+Yu83uu+BwCKPx80OUL99OkdGOM9lM8hwjAzaXTo5K7bdYZCYUpl3Rf2YQA5I5BC1Km9zK1Oa/AfdP0K/U4SWmk5MpQ6fsSV3/PyUf5kBARLGd9O0lOUMyzzYminwYgeo0Akk869gAjTxRgouJ0JQ0=
Received: from DM6PR11MB4410.namprd11.prod.outlook.com (2603:10b6:5:1d9::11)
 by DM5PR11MB1322.namprd11.prod.outlook.com (2603:10b6:3:d::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.28; Fri, 3 Jul 2020 00:18:34 +0000
Received: from DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::c42:f20f:e1aa:3376]) by DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::c42:f20f:e1aa:3376%7]) with mapi id 15.20.3153.024; Fri, 3 Jul 2020
 00:18:34 +0000
From: "Ren, Zhikui" <zhikui.ren@intel.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Weird build dependency issue causing missing symbols
Thread-Topic: Weird build dependency issue causing missing symbols
Thread-Index: AQHWUK5qDTwVy4B+o0qAMUUnahw4b6j0z3wAgAAo2ICAAAHYEA==
Date: Fri, 3 Jul 2020 00:18:34 +0000
Message-ID: <DM6PR11MB441039521253333CFA3BEF22946A0@DM6PR11MB4410.namprd11.prod.outlook.com>
References: <c99c6e23-a2b4-01de-7cb9-ab035dcf8e01@linux.intel.com>
 <20200702213328.GD3922@heinlein>
 <ac51ef67-40de-933e-a5a9-50d7506e073f@linux.intel.com>
In-Reply-To: <ac51ef67-40de-933e-a5a9-50d7506e073f@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.52.196]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 99d19ad2-1f12-43f4-ed0e-08d81ee69ff9
x-ms-traffictypediagnostic: DM5PR11MB1322:
x-microsoft-antispam-prvs: <DM5PR11MB132225BE37AE94A34302D07A946A0@DM5PR11MB1322.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 045315E1EE
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QaA2MMMoLHGLR0wydwCrXc0juY0zGx7n4IKN5b3xyTPwl1WUS3WoRBERtCsqdOjsIiKQDflw6WVeNqXOiwxfnTC+JnYKQD4qEL6Xwp7cbYKvOe9Gs6OM8RYtJW7P9JAaqzPthUBMZnRSEiZl8/KJ6YR9OJLcetmkrI3Sy1WzHDDaTAx9Mtx6sBmXWTIPg6K2LrqlCmol8R/XZezEySnw+Fz5USuljGcwwA/YCmucVlvJWD5vdB3nTgR+65m2pOHixVx+Z4DD1IK53/ajEfvfAiGiV7AgD4DTnwBH6rl7S1xo0p4Uux51fMtHjIQd83vb47ktbNCR2mSpr3mnunQXTg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(39860400002)(376002)(396003)(366004)(136003)(8936002)(52536014)(66446008)(64756008)(66556008)(66476007)(86362001)(7696005)(2906002)(316002)(33656002)(26005)(76116006)(83380400001)(66946007)(5660300002)(478600001)(9686003)(55016002)(53546011)(71200400001)(8676002)(110136005)(186003)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 2I8Zs5CaB6YXMGgSnTJCIE5alNJJzTguVGqprPBlLd4fyuujei5y4KpHvPHcQEcRdt+RQOj0vz82qvb8ufg51Ef6YsGeTkcS0GFDq8KhRz9UA0N/cPPH1ovf3zh1vIo41kVDUatHE4aPIi3IeWTuo/4nWneyj6gU6Vu9NM08ozLIVQ92Ry8PRsHT8womkXNj6JjDhoohqsOkyfzgMJZtwrGYvl1bQgxibQ290n2sW0es04zkCyTS1jXdm/YoQL6BXUsQPC3KYiNt+KKGtR4bGP3Rerdh3gOqnqO1wKbonlNSYKQr1et8kKt1T/mvDR/SKrNAhCudEhRLtO+9Zoqz3sNwvHWJALCp0jxxcsLiG3c/ccrfti5GXc222zen5p6y9qd/snMJThAIGXcfj+HXImrr86DgAeDjjoPCys6JM6WVom/KokUhRUif7EvAdbFe8IES5XDb/9iMygtN+ZF2OQYoYdhcnsiNb83u1uW0bdQ=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99d19ad2-1f12-43f4-ed0e-08d81ee69ff9
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2020 00:18:34.6973 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KtZgxW8gd0p4q+SvQl7Yy97wdou3enxP/FBzGMQJCx5re7ebp6m6iejmNIVlfrtRHw8VrGbxawAOAW8ngT359A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1322
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

Maybe the problem is that this header server.hpp is generated not  a source=
.=20
Artifact created from the same source *should* be the same (except timestam=
p)
If the source did not update, just a forced rebuild to create new binaries,=
  I can see Yocto choose not to rebuild things depend on the package.
In the case of boost, since it is devtool modified and the header is a sour=
ce and not build artifact, it make sense to trigger all the rebuild.=20


-----Original Message-----
From: openbmc <openbmc-bounces+zhikui.ren=3Dintel.com@lists.ozlabs.org> On =
Behalf Of Bills, Jason M
Sent: Thursday, July 2, 2020 5:00 PM
To: openbmc@lists.ozlabs.org
Subject: Re: Weird build dependency issue causing missing symbols



On 7/2/2020 2:33 PM, Patrick Williams wrote:
> On Thu, Jul 02, 2020 at 12:58:43PM -0700, Bills, Jason M wrote:
>> We have narrowed this down to being caused by two separate issues:
>> 1. When phosphor-dbus-interfaces is rebuilt it will sometimes change=20
>> the order of the PropertiesVariant in server.hpp.
>=20
> This sounds like a bug in sdbus++.  We should be sorting the variant=20
> parameters or issuing them in array order.  I'll look into it.
>=20
>> 2. When the order of PropertiesVariant changes on a rebuild, the=20
>> recipes that already have an old copy of server.hpp are not triggered=20
>> to rebuild and are left with the old copy of server.hpp.
>=20
> This isn't surprising if what is triggering the rebuild is not a Yocto=20
> variable change (or git revision).  Yocto doesn't cache the contents=20
> of the packages, but caches the variables that went into a build step. =20
> A hash of the variables are used to look up the potential 'sstate-cache'
> files so that it can skip build steps.
>=20
> If you think a variable or a git-revision should have changed with=20
> what you were doing, then maybe it is something else.
>=20
It seems like a header file change should trigger a rebuild, though?  If I =
manually edited something like a library header file, I'd expect everything=
 that includes that library to be rebuilt with the new header change.

I tried to devtool modify boost to check the behavior, but that causes boos=
t to rebuild every time and correctly triggers the dependent builds.=20
  Maybe the case above of modifying a header file is invalid?
