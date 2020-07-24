Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B434D22CB1E
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 18:33:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCvsT215dzDrqc
	for <lists+openbmc@lfdr.de>; Sat, 25 Jul 2020 02:33:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=zhikui.ren@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=bCbgvFxx; dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCvr56xjLzF1Hw
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jul 2020 02:32:35 +1000 (AEST)
IronPort-SDR: ssXWDzfOoqXBicFZGrTaoL2M8T52qo08hasnluWO7SkO1iFO2S4wWTb4JQV/WYQiYuQUfyRide
 TwcOeXzfxjTg==
X-IronPort-AV: E=McAfee;i="6000,8403,9692"; a="235611712"
X-IronPort-AV: E=Sophos;i="5.75,391,1589266800"; d="scan'208";a="235611712"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2020 09:32:22 -0700
IronPort-SDR: R428YAF1ElQpMntQ5TuWazmjG9Xzqea1+2zowSmm0c3yc4HgUaHjETbO85VlP4/1nyHd8GuSax
 WEiTNvrQqJPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,391,1589266800"; d="scan'208";a="489258289"
Received: from orsmsx101.amr.corp.intel.com ([10.22.225.128])
 by fmsmga005.fm.intel.com with ESMTP; 24 Jul 2020 09:32:21 -0700
Received: from orsmsx155.amr.corp.intel.com (10.22.240.21) by
 ORSMSX101.amr.corp.intel.com (10.22.225.128) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 24 Jul 2020 09:32:21 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 ORSMSX155.amr.corp.intel.com (10.22.240.21) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 24 Jul 2020 09:32:20 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 24 Jul 2020 09:32:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PKOi2ZUkae8YCBEfsLugctJ3tMW30afleIKihBwcKyo59s6vxbThJOv82iSgvFWI9xNjyuQg30PCCNEucMoivK0WWxH+PuDGn19aK4su7HQCgJCtUxAL5/xMZmP6IM1g6xm0vp/hQ1LDnMWDjY72UgGuIhASyu3O6VrvHiIG99+auNC2HQh24mG5t0evbeelrH+F9FGNwf/sIKmRIl319rpb3gb0QLZzQUlNAhye9GnkVCH0E0qWjBYpFXkckajt3wKTDOaJIVmpiLOsjHJevA9mIXwHs4QCD4yLh9Fo2KEJARhwtYMJ2muL+Mvws/JJxoWyShRdn/kaUt8FF7i7VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0L6Zqt15X7/3SKDPD5J5uuUyJxk84Aq0rfHtesXiSM=;
 b=LAeTHjl4FfDLAMcEPZ5Ydjncdy4p6Kz0mVyXPSa48phtfCNDvuJtDJLrel/4D3lgL8NpA2ar9tuXDeTrklaVgALDDBrXzVlgfOfWZgd6WZSHUBv2hvXFAXigXaPhnzCuncxe3HdOFkx42HXHrLaXUsVHQCyhMt2sWHqP9k1RxMM3kXafgrGmjcjPHFfUptFgJsDvLUwnBtmP0sGyesBRW2msjmvKVpY0tgak1agReoyuoYcDl2NwSW8t6V1lbRMzitoP1iUOEsAGH/hJr/TwpNFeQFLZmHOQ859VmyL7qumpRRR9/mo/yAUEgm/zwQs7/r5h/cpRIyNo4jYye9DR9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0L6Zqt15X7/3SKDPD5J5uuUyJxk84Aq0rfHtesXiSM=;
 b=bCbgvFxxeX4/2xVYkvBAMSPNC/NO/BHaWqCen2i7EMAfH3ayo0vyrsBI7aGTCJ0X8i4bkYwrjqg188P0501mlnHxBgvR4Z8B9XIygCjNZSOav/x+RbUmNUEc9WMGeIQyGxvp5gHi/Rs+y+3RQZqI3K1yTJOeA0x/CHmMWEPPM1g=
Received: from DM6PR11MB4410.namprd11.prod.outlook.com (2603:10b6:5:1d9::11)
 by DM5PR1101MB2139.namprd11.prod.outlook.com (2603:10b6:4:56::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Fri, 24 Jul
 2020 16:32:19 +0000
Received: from DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::c42:f20f:e1aa:3376]) by DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::c42:f20f:e1aa:3376%7]) with mapi id 15.20.3216.025; Fri, 24 Jul 2020
 16:32:19 +0000
From: "Ren, Zhikui" <zhikui.ren@intel.com>
To: Manikandan <manikandan.hcl.ers.epl@gmail.com>
Subject: RE: add multi-host support in the phosphor-post-code-manager
Thread-Topic: add multi-host support in the phosphor-post-code-manager
Thread-Index: AQHWXq+mhza35ZDnykiDwP2psifYNqkSRKOwgASq3wCAAAItcA==
Date: Fri, 24 Jul 2020 16:32:19 +0000
Message-ID: <DM6PR11MB4410E72996262865A6C8937994770@DM6PR11MB4410.namprd11.prod.outlook.com>
References: <20200720160013.GB17117@cnn>
 <DM6PR11MB441079DE8A76ECF6C35E185094780@DM6PR11MB4410.namprd11.prod.outlook.com>
 <20200724162110.GA9905@cnn>
In-Reply-To: <20200724162110.GA9905@cnn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.11.44.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d454727-4f11-464b-33ab-08d82fef2277
x-ms-traffictypediagnostic: DM5PR1101MB2139:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1101MB213936B08F8D610129498E3F94770@DM5PR1101MB2139.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NQ47zPB4yH4AgjCW1BzoXdF7uib/PM6fQxP9n2LKA78LBQZ6+qG1nacJno9+oWbHXfMOYJoA1yHLWFxPeHubgobRq8LYHt7UG6/5u1LLnRv1mV1JjWxfkyiqZMv+2czzOMdukZQHFxEfs/bz87JMGZWoOqs8EMFhlwNlejMZCxjkfG5AkNRN26HBsy9e1CVkNAfYEpKRuRtn2IgxHaIw74exvRSDQwDCchdNbv0F1bv4PU8iGh/HRWxqXct5AeelQCdxLAJNHBB51m01Hh6jpV77mYiz3Uxti0fpGGxq6HkIUNrhHU3YOfYWqNa/ikYYut26thPsTyGolXK3g6lN5Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(33656002)(52536014)(66556008)(66476007)(66446008)(64756008)(5660300002)(8936002)(76116006)(66946007)(8676002)(316002)(54906003)(83380400001)(6916009)(55016002)(53546011)(6506007)(186003)(26005)(71200400001)(19627235002)(9686003)(7696005)(4326008)(86362001)(478600001)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: bWJGH6S0u+FWKfSn1NvO3m0ZJwKS8Us46qmCpnxh/RJcDEsz2vRvUkdU/Ndk2ZoGIuk6I0sr/Tswlk+/Z0x2UxeqEcqjKPGdNIyapgl2Hh7QdE5Rn/uukPhrMeSMmTRVoIVaFOQ1wX5kTJKDNnTRudXfyi+84AEONICCyHnhoL/LQVF9/fJoCphdh2Z4sjnyl1+631Rn6LaF3f54CLK7IPdRS4yq9beNzSwIPfl4AgaA93HVHMrIihmf2M/3rkV+2qxOzHqKfT4wTX7WK3HTv8Cg05VewHx7ZuQgB0RHvJJBTK3i1Q73xd/pdWGmUfBhBwCImdpS1xVObhygLJtNTyRd5kP7zaKJd3oi0Wvao1tsKVS/mqG7k260BQwS2VZrU38ZlEcg2syXcNpXENJ70bc4BRVG0KjdZGh7aJ5Lthb28F48TWwn4MwsrnDvTbHrYyjHXqXZHYm57aVHgShtt3FfJxgJ1t9WjVD4JR6dJ4M=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d454727-4f11-464b-33ab-08d82fef2277
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2020 16:32:19.3302 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qxhfpkEiY6ePmKl7Y/cSx1y+92nJnmjvFjndY2FXaTMjkAAg63bVlDWrNkqDz9lIzo2zBW088cCDzBY1URhjNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2139
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
 "velumanit@hcl.com" <velumanit@hcl.com>, "Wang,
 Kuiying" <kuiying.wang@intel.com>,
 "manikandan.e@hcl.com" <manikandan.e@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



-----Original Message-----
From: Manikandan <manikandan.hcl.ers.epl@gmail.com>=20
Sent: Friday, July 24, 2020 9:21 AM
To: Ren, Zhikui <zhikui.ren@intel.com>
Cc: openbmc@lists.ozlabs.org; Wang, Kuiying <kuiying.wang@intel.com>; velum=
anit@hcl.com; manikandan.e@hcl.com
Subject: Re: add multi-host support in the phosphor-post-code-manager

On Tue, Jul 21, 2020 at 05:10:04PM +0000, Ren, Zhikui wrote:
> I would think that one process to handle all post-code is a cleaner desig=
n.

   Thanks Ren for comments.

   As Patrick mentioned on different hardware toplogy and hot-plug-able=20
   concept matches with our platform.
=20
   As per my undersatnd on recent multi-host feature such as =20
   obmc-console, host-logger and x86-power-control implemented based on the=
 multi-process.

   I will update design doc in Gerrit to discuss to further on single or mu=
lti-host approach.=20
=20
>It is good to be consistent. Thanks.

> -----Original Message-----
> From: openbmc <openbmc-bounces+zhikui.ren=3Dintel.com@lists.ozlabs.org> O=
n Behalf Of Manikandan
> Sent: Monday, July 20, 2020 9:00 AM
> To: openbmc@lists.ozlabs.org
> Cc: Wang, Kuiying <kuiying.wang@intel.com>; velumanit@hcl.com; manikandan=
.e@hcl.com
> Subject: add multi-host support in the phosphor-post-code-manager
>=20
> Hi All,
>=20
>  We woukld like to get opion on below multi-host support approaches.
>=20
> Background :
> ------------
>   The Phosphor-post-code-manager supports only host to store/retrieve the=
 host postcode history.
>=20
> Approaches:
> -----------
> Approach 1: << run the multiple process >>
>=20
> Create and run the multiple phosphor-post-code-manager process to handle =
each host postcode history.
>=20
>    xyz.openbmc_project.State.Host0.Boot.PostCode
>    xyz.openbmc_project.State.Host1.Boot.PostCode
>    xyz.openbmc_project.State.Host2.Boot.PostCode
>    xyz.openbmc_project.State.Host3.Boot.PostCode
>=20
> Approach 2: << pass number of host to single process >>
>=20
> Pass number of host to single process phosphor-post-code-manager to regis=
ter dbus object and handle each host postcode.
>=20
>    xyz.openbmc_project.State.Host0.Boot.PostCode
>    xyz.openbmc_project.State.Host1.Boot.PostCode
>    xyz.openbmc_project.State.Host2.Boot.PostCode
>    xyz.openbmc_project.State.Host3.Boot.PostCode
>=20
>=20
> Thanks
> Mani.E
