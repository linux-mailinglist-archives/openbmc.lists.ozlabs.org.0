Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E951265687
	for <lists+openbmc@lfdr.de>; Fri, 11 Sep 2020 03:20:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BndHJ21DCzDqmf
	for <lists+openbmc@lfdr.de>; Fri, 11 Sep 2020 11:20:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=james.mihm@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=FVjAj43B; dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BndGK0j0nzDqNj
 for <openbmc@lists.ozlabs.org>; Fri, 11 Sep 2020 11:19:52 +1000 (AEST)
IronPort-SDR: AZmncQvTg7NhJbJEYF3QOjotnVovWTGOWIvlZTH43CCdg892U2Elk5XRndOl4vtrkbKnESwYTe
 HJSm3lKlDb+Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="176733099"
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; d="scan'208";a="176733099"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 18:19:50 -0700
IronPort-SDR: sOUTqpFJa0gQw/c5HMDn0ebTQooNJ3SHVjpmJtjUtSi5py9cnJ6nRXNVcttnbUH589Ue2YhKQ+
 zOwdvi8fCEAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; d="scan'208";a="378393470"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 10 Sep 2020 18:19:50 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 10 Sep 2020 18:19:50 -0700
Received: from orsmsx151.amr.corp.intel.com (10.22.226.38) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 10 Sep 2020 18:19:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX151.amr.corp.intel.com (10.22.226.38) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 10 Sep 2020 18:19:49 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 10 Sep 2020 18:19:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LM7Ky/CVZPDE9CEZCr8ph082Dv1r2UoP2nATHao0XrOm7cxeTjfG65cdi+tYj1MwNT5vvW+tsacyifYpVYqA+WZ7W8JzKxL63nNf3faxApptl/H0Oy3RaUuHXtwPYFApMAs0bOYjr4OTWeMokaYS78n/tvZCX6Tcssjk5IYOLGWYRr0hjP2gK3rUnuuHfu2LNCtPX0yJLfzUAQn26eU7Vh6f9cWrUK7YE4/8OVwIgHT3tlGH3zejJMOREoiYsLA7dNn+OCuFW9TCDuyfsWZ8wo2R5/v9O0uu4Q9WlDLgJ2hGxYdmkE36ACPIHtyqEPcCbKzpBxkc59m2oNkcGlh0aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=24s9iC9Q5QqoO/RQlNSmlvBPSHp2fFdwfJNxtgpwv8g=;
 b=jU5WZvn7beiIcQR+aVr0QZ49BwkFXF1dSagQKsHzm3XZ76/XkKJaFI6fEVTHUgGXPSrPfitT0kwZqSrr7niwQ2+prPSfEMNMgCr7n1mALE/LODYvG7aoG3RMFxOmtbSBLfaL+RH4JWVw7dBzDY6vad4CLh6G9rqGtqfxHgirVzBN9vMOlXNbvzzSVrBNVql4A+2ZnGYqVoZoxuZ4kdg6lfeOn29dhfZvvjJDlat7pee72G6QqieTjwaiAD/fVhCk/0MD+lB0z8t5oaSRGmMtnIxSn4z5SK3ESV0A0Jkk30k4PIXJ1ddT02EsNt3TMFQjtkAH7HumnuaOnHhkqW9Uhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=24s9iC9Q5QqoO/RQlNSmlvBPSHp2fFdwfJNxtgpwv8g=;
 b=FVjAj43BZQi/3B6Ent71/eFd3yA5bSBRV+Pnpr7fQrt/lvERdK3Go4cImDyP+9SNduvGEiUY1Dhb/af8HrbMZ9CBY3yMEinaHiBr45jy44Vgql2OB78siRlBGdXlSVaVp8dvGANgbSfq0+RLK0pIc912kJkjKRdDXKwu6kt7Z5Q=
Received: from DM5PR11MB1884.namprd11.prod.outlook.com (2603:10b6:3:112::19)
 by DM6PR11MB4059.namprd11.prod.outlook.com (2603:10b6:5:4::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16; Fri, 11 Sep 2020 01:19:47 +0000
Received: from DM5PR11MB1884.namprd11.prod.outlook.com
 ([fe80::b1a1:52cb:5a75:4041]) by DM5PR11MB1884.namprd11.prod.outlook.com
 ([fe80::b1a1:52cb:5a75:4041%5]) with mapi id 15.20.3370.016; Fri, 11 Sep 2020
 01:19:47 +0000
From: "Mihm, James" <james.mihm@intel.com>
To: Patrick Williams <patrick@stwcx.xyz>, Vernon Mauery
 <vernon.mauery@linux.intel.com>
Subject: RE: PECI patchset status
Thread-Topic: PECI patchset status
Thread-Index: AQHWf3TU9Z7PObe4C0CIS3wcTpAcqalWL2yggADfP4CAAB4wAIABhsEAgAn/k+A=
Date: Fri, 11 Sep 2020 01:19:47 +0000
Message-ID: <DM5PR11MB188420C2AF67DA8C09C4689F90240@DM5PR11MB1884.namprd11.prod.outlook.com>
References: <CACPK8XddFvszC1daDKTtqwkE-XDfB7uYFP_H4HZXNUxvNHUaqw@mail.gmail.com>
 <DM5PR11MB188419A3302F33CE6FE80740902C0@DM5PR11MB1884.namprd11.prod.outlook.com>
 <20200903152753.GA57949@patrickw3-mbp.lan.stwcx.xyz>
 <20200903171556.GA32795@mauery.jf.intel.com> <20200904163430.GA3532@heinlein>
In-Reply-To: <20200904163430.GA3532@heinlein>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=none action=none header.from=intel.com;
x-originating-ip: [67.189.33.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e60e4517-6202-4dce-4ff8-08d855f0c5fc
x-ms-traffictypediagnostic: DM6PR11MB4059:
x-microsoft-antispam-prvs: <DM6PR11MB405927F77693D762CF5BFB8290240@DM6PR11MB4059.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Lh27zxLLiGOB9kgRc+T6UA4PNucNahrqSAdgZaeiXJeikZ2o0BszxEKVLQeMnc/8ZxNNb9dRQ1ayPjpSzgUgq8QPM0+nMRzBXN1+z+U14xk/Oc10rY2nmyaSKFNohwZ3QwyYvV0wCwQ4UmcofG9nCSJgbY2q4/QzCTqnPhMQHJEn/2RBdd2JpaIrWPw6Mg34qtyOT1CAyrsKpuTg3J8a2BdDLM7D1oGiRxuZJioCpP18tdZrTpUFKIWDVG4BPdso7mJ2FZG5EA/bbHVKDclTNKfVuh31pY55Hkq70Y0XY91zIkZP4uBFdIRhxxDaczFpy1zl1JR/a0GWhIFtIG3dTMS5PM1lDW4YO+kssNVCZvliBcJHYHO11hafP+2FPmS0pEUfCyo7nGhid/x5jE6vVw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1884.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(346002)(136003)(376002)(396003)(66556008)(7696005)(66476007)(9686003)(66946007)(2906002)(76116006)(52536014)(66446008)(6506007)(5660300002)(3480700007)(71200400001)(64756008)(8676002)(110136005)(86362001)(478600001)(53546011)(33656002)(966005)(8936002)(55016002)(7116003)(83380400001)(316002)(26005)(186003)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: FxCWBU59ww0L2Y8AXGFf2qkEVUlyNjxRcx421OPrqG8mtmsHr7dnvzeIa3aF0hvAg29xj4TJoKtk38RZfQUibIDaLlMHzF2sCgNuD5OUe9HBoSjC0gNo4isqR1S3uZICiV3dM7TGygBP3cDCIy329IP9AaccUKcpm0R60ggz+dFZSfs3EfBwRLQicxGHPAI3YE06KH2KBPEwrnXrJwVIVLzln1gEXlqDTwtCpxpFx22n6HTXURmCsBLzAPi1wvk8I472c3D7tQYl5zFTyEXNZ3xoml38OKMno9gVw8X83iqY8+rvKj4VzYVyyylRLwvhUWiOHT6+89YXLX1EA8rm8XZRO0dK2fv12kUzDzpc/6r83m/PqibyPjkBqEutVYUe7stajd6D3gHb7CELMqQ3FZXrepTTB++5I/WYk3DXy9CkwVbVNlx/GLzN9/pybYiJ8HW/SClKyIoD2ucfX/6uV8ibIU+VFl2tyzxVtR0dGy/yysXNr4OvuKDf93nRptjGWi11sG9o0zgCgpDh6SFm+1auVkp4Tw10CloH2ah91GnyWGfRJiibvL9C25tBE6zwarAXbfKoCz+Z7hEl5diVv5JFQ18f9DlhPhnyLTtuNiUDRWVQLtnzMZcic36sqFHkmRfmKCC+M328ejiCuqb/hw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1884.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e60e4517-6202-4dce-4ff8-08d855f0c5fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2020 01:19:47.3924 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W9o55zFTEru//yN9SN0821AWSvc8b+FJRA3cDpQoYfQ77W7z3jQtLc26fJx7p3+UYSyjQRL3OSv4uiZw1eQNFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4059
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


>-----Original Message-----
>From: Patrick Williams <patrick@stwcx.xyz>
>Sent: Friday, September 4, 2020 9:35 AM
>To: Vernon Mauery <vernon.mauery@linux.intel.com>
>Cc: Mihm, James <james.mihm@intel.com>; OpenBMC Maillist
><openbmc@lists.ozlabs.org>
>Subject: Re: PECI patchset status
>
>On Thu, Sep 03, 2020 at 10:15:56AM -0700, Vernon Mauery wrote:
>> On 03-Sep-2020 10:27 AM, Patrick Williams wrote:
>> >On Thu, Sep 03, 2020 at 05:57:48AM +0000, Mihm, James wrote:
>> >Rather than create a separate fork of the kernel, is there something
>> >that could be done here to have someone from Intel work with Joel on
>> >preparing the patches?  When a new kernel comes out, Joel can ensure it
>> >works on the base AST2xxx system design and before we move all the
>> >systems to it, someone from Intel can rebase the non-upstreamed patches
>> >they are carrying?  This hopefully reduces some of the burden on Joel
>> >and stops us from further fragmenting the community.
>>
>> Keep in mind that Intel does not plan to keep the fork around
>> indefinitely. The hope is to fully upstream all of the patches that we
>> have outstanding. Our intention is not to fragment the community, but to
>> provide a mechanism to continue to move forward while still providing a
>> way for other users to build the intel-platforms target.
>>
>> As an added feature, having our full kernel source in a publicly
>> available tree will allow us to upstream more features that depend on
>> kernel support that is not currently available.
>
>I'm not really following this last paragraph.  I suppose you're saying
>that you have kernel changes that are not in openbmc/linux that add
>additional features?  Why aren't they in openbmc/linux?  I thought there
>was a process for getting code in that isn't quite ready for
>upstreaming, as long as there is progress towards that?  Is there some
>list of what these features are and what the upstreaming state is,
>because this original thread was about PECI, but you're implying there
>is much more.
>
>If the process isn't working for the community shouldn't we discuss
>improving that to something that does work?  It seems like your team has
>decided to go to the nuclear option of forking after Joel has proposed
>dropping a patchset that he's been carrying for three months short of
>three years.
>
>Joel does great work of keeping the kernel up to date, both on a major
>release and picking up supplemental fixes.  Is Intel committing to this
>same level of support that Joel is currently providing for your own
>fork?
>
>Past performance doesn't really give me a lot of confidence that this
>will be a short-term fork.  In December 2019, Joel raised this exact
>same problem with the PECI driver[1] and it was promised that there
>would be forward progress "within a week"[2].  One week later, there was
>a v11 of the patches posted[3] and we got some good comments from a
>variety of upstream maintainers.  Since then, there has been zero
>activity.  Shouldn't we have seen a v12 pretty quickly after that?
>

[James Mihm]=20
As a product development team, we need to balance between product deliverab=
les and upstreaming. Where product deliverables and schedules have taken pr=
iority over upstreaming.
We are working on a prioritized kernel upstreaming plan and will be sharing=
 with the community after internal reviews.=20

Regarding the PECI v11 driver, the kernel maintainers reached out to us wit=
h additional requirements before we could proceed with v12. We are taking s=
teps to meet those requirements.

The Intel fork of openbmc/linux is to allow anyone needing to build openbmc=
 for an Intel server and to be able to do so without having to apply patche=
s. Placing the burden of maintaining the 84+ Intel patches against the kern=
el on ourselves while working through the upstreaming process. Intel would =
own rebasing the Intel fork with openbmc/linux. The lifespan of this fork w=
ould be as short as possible and is dependent upon our execution to upstrea=
m our patchsets.

Would it be acceptable for all of the 84+ Intel patches to reside in the op=
enbmc repo while we work through the upstreaming process?=20
Some of the patches require design changes and will take much longer to ups=
tream.

James

>1. https://lists.ozlabs.org/pipermail/openbmc/2019-December/019684.html
>2. https://lists.ozlabs.org/pipermail/openbmc/2019-December/019728.html
>3. https://lists.ozlabs.org/pipermail/openbmc/2019-December/019823.html
>
>--
>Patrick Williams
