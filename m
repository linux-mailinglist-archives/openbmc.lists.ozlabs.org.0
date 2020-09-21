Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E72272469
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 14:56:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bw4Fs1fgVzDqdP
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 22:56:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bw4Dk3vdbzDqXG
 for <openbmc@lists.ozlabs.org>; Mon, 21 Sep 2020 22:55:47 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Mon, 21 Sep 2020 08:55:40 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Ed Tanous <ed@tanous.net>
Subject: Re: interest in a minimal image recipe
Message-ID: <20200921125540.4d6amvus3wt57igg@thinkpad.fuzziesquirrel.com>
References: <20200915202832.rq3os62pdj7mzaco@thinkpad.fuzziesquirrel.com>
 <CACWQX80tELWA-EW0A8-DnJGFmJyMxDC04YTq4B+--bRaoV8rOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <CACWQX80tELWA-EW0A8-DnJGFmJyMxDC04YTq4B+--bRaoV8rOQ@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
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

On Thu, Sep 17, 2020 at 01:56:34PM -0700, Ed Tanous wrote:

>As a general description, this sounds great, but as always the devil
>is in the details.  The biggest obstacle to this I see is that we'd
>need a policy and design around supporting mix-and-match on features,

What is this an obstacle to?  Adding content (image features) to my=20
proposed image recipe or even having the recipe at all?  If the latter,=20
it isn't obvious to me how having that could impact anyone?

Also, can you give an example policy around mix-and-match?

>Today, most features don't mix and match well, one example of this=20
>being entity-manager requiring intel-ipmi-oem. =20

In what way does EM require intel-ipmi-oem?  I am using EM without=20
intel-ipmi-oem without (I thought anyway) issue.

>Thus far for that simple example, nobody has stepped up to make it a=20
>generic yocto feature

Can you be more specific?  There is no such thing as a yocto feature -=20
there are image features, machine features, distro features, kernel=20
features...

>and separate out the code, despite pretty widespread adoption.

Can you elaborate on what source code should be reorganized?  I probably=20
won't understand this until I understand how EM depends on=20
intel-ipmi-oem?

>I think the idea that we're suddenly going to just start doing a better=20
>job of feature separation because of a single patch is a little naive

Agreed...I don't remember saying my patch would help with feature=20
separation =F0=9F=99=82

>and I'd really like to see the project make steps forward toward that=20
>before we create a minimal image.

So I have the same question as above.  Do you want to see things happen=20
before the recipe is even created or before IMAGE_FEATUREs are added to=20
it?  If the former can you explain why?  In my mind it is something that=20
helps people right now, and doesn't impact anyone that doesn't use it.

>If we want to do this going forward, my personal opinion is that:
>1. Someone needs to go figure out an example for one non-trival, cross
>application feature with multiple options, and get yocto sorted such
>that said "feature" enables the right component options.

What are component options?  configure flags/meson options?  In yocto=20
these correlate to machine or disto features.  machine and distro=20
features aren't really relevant in the context of an image recipe are=20
they?

>Entity >manager might be a good one,

I tried to propose an EM distro feature already:

https://gerrit.openbmc-project.xyz/35764

James/Patrick decided it made more sense for pid control to check at=20
runtime for a running EM instance.  That made sense to me.  So we don't=20
need an EM distro feature until someone adds conditional compilation for=20
EM support in another application.

>phosphor-webui vs webui-vue might be another good one (I'm looking into=20
>this currently),

If the world made any sense, there would just be an image feature for=20
both, much like how of how upstream has an image feature for dropbear=20
and an image feature for openssh.  I'm still trying to figure out how we=20
got ourselves into a position where building the webserver needs to be=20
aware of what javascript application is running on it...my point=20
is...there are less strange examples to be building out our best=20
practices w.r.t distro features on.

>or individual Redfish resources in bmcweb might be another. =20

Let's stick with PACKAGECONFIGs here until patterns emerge?

>There are a bunch of examples of this you could start with.

>2. Document a policy around what it means to be a "feature"=20

There is pretty good documentation in Yocto covering the different types=20
of features (image/distro/machine) at a conceptual level.  What more is=20
there to add in the OpenBMC documentation?  Maybe just a list of the=20
current openbmc image/distro/machine features?

>including some relevant examples.  Is Redfish a feature?  Is IPMI a=20
>feature?

For sure, but maybe the question we should ask is are they image=20
features or distro features?  The way they are implemented today they=20
are image features.  To opt out of Redfish, you don't install the bmcweb=20
package.  To opt out of IPMI, you don't install the 4 or so IPMI related=20
packages (host-ipmid, ipmi-kcs, ipmi-bt, ipmi-ipmb, ipmi-net...)

>or are those just interfaces to access other features?

They could be, if someone needs that level of granularity.  Does someone=20
want to do this?

>Do we need a hierarchy of features?

I hope not?

>When/where should we use DBus to determine feature enablement, and when=20
>should it be a compile option? =20

I like this question.  My strawman answer would be always use Dbus.
That simplifies the configuration required.  But it need not be mutually=20
exclusive.  If someone needs something completely compiled out for some=20
reason, that can be supported too.

>We've been very inconsistent about these questions in the past, and=20
>it's part of the reason that adding "features" properly is hard.

I don't really think image features need to be all that hard.  they just=20
control what packages get installed in the rootfs.  It might help this=20
discusssion if you refrain from using "features" unqualified without
image/distro/machine because those all have clear meaning in Yocto.

>3. Someone needs to go through the user-facing clients (phosphor-ipmi,
>bmcweb, ect) as well as the recipes, and make sure command handlers
>are organized in such a way that they're enabled or disabled by
>feature, and we can successfully enable one feature at a time. =20

Ok but those are autotools/cmake/meson options which correlate to a=20
distro feature or maybe a packageconfig.  Those are orthogonal to image=20
features and image recipes, which is what I've proposed.  I've not=20
proposed a minimal distro policy.

>will likely expose some interesting dependencies (like how IPMI
>commands have to be enabled/disabled by library) that we'll likely
>need to tackle.
>
>If the above tasks just fall onto the subsystem maintainers, who now
>have to field the "I enabled X on my minimal build and it doesn't
>work" type bugs, that seems like a non-starter, and likely to cause
>more confusion than the current status quo. =20

I think maybe image features and distro features are being conflated=20
some.  I don't see how this can happen with a minimal set of image=20
features.  If something doesn't work its because a package dependency is=20
missing (RDEPENDS) and that is a simple bug that should be fixed.

I _do_ see how this can happen with a minimal set of distro features,=20
but that isn't what I've proposed.

Lots of great questions here Ed, thanks.  I wonder if several different=20
threads need to be spun off?

-brad
