Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A140272D25
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 18:38:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bw9915XZKzDqqY
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 02:37:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=WhxBi6cY; dkim-atps=neutral
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bw8B057sGzDqD8
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 01:53:42 +1000 (AEST)
Received: by mail-yb1-xb2e.google.com with SMTP id k18so1884956ybh.1
 for <openbmc@lists.ozlabs.org>; Mon, 21 Sep 2020 08:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nOXtxU/zzdB4XJK7fRcXfHgKtKSt9WetdGRJPzyyNcE=;
 b=WhxBi6cYSZ54Q5b/Q3EjTpjOLmIYc2si5O8A0GkT8GsVQo72gu/5ejNJPqAIOZjNoc
 6SBUz0NXzEMhfBg6cE+xLB9Byl2FCEjBvWcqqxfK/ymn/8gHIxJnR3XG2JK2Bv0Q5Q3t
 oG93Kc6mYOS+tpZuao+9FiZPnKjaTksybfq0xledQCwospdRBY2JkDFeHAx0rfcfx3ov
 S1M87aJNPvOxtv9rsghU8Vv7Ryg9+jpB6YEOq7OfD1LarJ6tmECMz+aOh5pqUsK7v6T+
 DPJZ1b0JvrkYXJ4qGAJL79RQUv9Oa8lM5CGYP0PuMk5lVJnRg1HahF4BPPqbAHqI5nuR
 lZ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nOXtxU/zzdB4XJK7fRcXfHgKtKSt9WetdGRJPzyyNcE=;
 b=r0N94MpsmgfV1w4uxeKODq81XYkHhQxBoIRCucm5EhDqkKedHV6yoLlgnsnXDB3z8d
 N7PDJKcNRYhSQO6PZgtYb6SLnOoQQ3k5T7zBL5GXDYoZyGSPjHiYuWd4plSkmZtC4QQn
 Ck7Fwo7pewMd4Ylzi6kv5jm1Ui7HS4G2iOMzGz6yesrvVOsa3r0eakbfcs2eK/gfYY+d
 Xj1cPR0KqlvxxzkRkovaOLjeR532RCgEegRsnf6gfPTKmiWEoo9e3BdGY+l5GkZYLkk9
 yORJh8O0SojFKjaM8moizf8e/YB8rbbVywCuOf2FNYbVUYL/qZo8qDj3gjofGhkAxF4I
 4YOQ==
X-Gm-Message-State: AOAM530jwlh/BL/WaN3I7lCba7kQJo6ZlxatDBQ/3DEMaue7lBi8duZf
 xpVDE9A20eYyVTq1w03fwnZgV4uXzMWDwqQ6Wc/eTBFyzIVvxgY1
X-Google-Smtp-Source: ABdhPJy3R01tB2Aro5+It/7y31Oa7vBIvFmOGH60PNdTDmRsUeOBt55StXS4qIFpspN03rpcrbNhFYhrnDrIIumZ0kY=
X-Received: by 2002:a25:aaf4:: with SMTP id t107mr616555ybi.209.1600703616172; 
 Mon, 21 Sep 2020 08:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200915202832.rq3os62pdj7mzaco@thinkpad.fuzziesquirrel.com>
 <CACWQX80tELWA-EW0A8-DnJGFmJyMxDC04YTq4B+--bRaoV8rOQ@mail.gmail.com>
 <20200921125540.4d6amvus3wt57igg@thinkpad.fuzziesquirrel.com>
In-Reply-To: <20200921125540.4d6amvus3wt57igg@thinkpad.fuzziesquirrel.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 21 Sep 2020 08:53:26 -0700
Message-ID: <CACWQX82i4k+PADJkOjDQEeUAQJtve+pySLRQVcqR7XayG5cJCw@mail.gmail.com>
Subject: Re: interest in a minimal image recipe
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, Sep 21, 2020 at 5:55 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> On Thu, Sep 17, 2020 at 01:56:34PM -0700, Ed Tanous wrote:
>
> >As a general description, this sounds great, but as always the devil
> >is in the details.  The biggest obstacle to this I see is that we'd
> >need a policy and design around supporting mix-and-match on features,
>
> What is this an obstacle to?  Adding content (image features) to my
> proposed image recipe or even having the recipe at all?  If the latter,
> it isn't obvious to me how having that could impact anyone?

Setting the expectation that features are selectable by creating a
minimal build, then having feature not be selectable is ripe for
confusion.  In practice, we already have this problem without the
minimal image, but thusfar can cover ourselves with some logic of the
sort "you're not using the default build, it's going to be difficult"

>
> Also, can you give an example policy around mix-and-match?

Something like: "Any new non-trivial, user facing feature should be
selectable independently at compile time through an OpenBMC distro
feature.  Said image feature should enable or disable redfish, webui,
and IPMI command handlers for said feature.  Effort should be taken to
avoid adding binary size for features that are disabled."

>
> >Today, most features don't mix and match well, one example of this
> >being entity-manager requiring intel-ipmi-oem.
>
> In what way does EM require intel-ipmi-oem?  I am using EM without
> intel-ipmi-oem without (I thought anyway) issue.

You're running Entity Manager, without intel-ipmi-oem, and you can run
a successful "ipmitool sensor list" or "ipmitool fru print" command,
and have it return the entity manager/dbus-sensors/FruDevice results?
In my understanding, this shouldn't work, and we've had many reports
of "I enabled entity manager, and my sensors don't show up in IPMI".

>
> >Thus far for that simple example, nobody has stepped up to make it a
> >generic yocto feature
>
> Can you be more specific?  There is no such thing as a yocto feature -
> there are image features, machine features, distro features, kernel
> features...

I think it depends on the specific feature, but I think a lot of them
would end up being distro or image features.

>
> >and separate out the code, despite pretty widespread adoption.
>
> Can you elaborate on what source code should be reorganized?  I probably
> won't understand this until I understand how EM depends on
> intel-ipmi-oem?

https://github.com/openbmc/intel-ipmi-oem/blob/master/src/sensorcommands.cpp
That whole file would likely need to move to another repo/library to
make it selectable independently from the rest of the command handlers
in intel-ipmi-oem.  Separating it out has been discussed a few times.

>
> >I think the idea that we're suddenly going to just start doing a better
> >job of feature separation because of a single patch is a little naive
>
> Agreed...I don't remember saying my patch would help with feature
> separation

Is this something you think the project should do after the image is available?

>
> >and I'd really like to see the project make steps forward toward that
> >before we create a minimal image.
>
> So I have the same question as above.  Do you want to see things happen
> before the recipe is even created or before IMAGE_FEATUREs are added to
> it?  If the former can you explain why?  In my mind it is something that
> helps people right now, and doesn't impact anyone that doesn't use it.

I had imagined an influx of the "I enabled X on the minimal image, and
Y doesn't work" type bugs.  As is, we get them a lot more than I'd
like to see, but I guess we could just have the policy that if you're
using the minimal image, you're using a "power" feature, and there's
an expectation that there's dragons?

With that said, on second look the two problems aren't quite as tied
as I thought they were.  I retract the statement that we should do it
before the minimal image, but I'd still like to see the project get
better in that regard.

>
> >If we want to do this going forward, my personal opinion is that:
> >1. Someone needs to go figure out an example for one non-trival, cross
> >application feature with multiple options, and get yocto sorted such
> >that said "feature" enables the right component options.
>
> What are component options?  configure flags/meson options?

In general, yes, they tend to be autotools/cmake/meson flags to
enable/disable features.  In the case of IPMI, it might be just
modified RDEPENDS statements.

>  In yocto
> these correlate to machine or disto features.  machine and distro
> features aren't really relevant in the context of an image recipe are
> they?

I think they become more important, because if you're starting with a
minimal image, I'd expect that there be an easy way to add independent
features without pulling in a bunch of features I didn't explicitly
enable.

>
> >Entity >manager might be a good one,
>
> I tried to propose an EM distro feature already:
>
> https://gerrit.openbmc-project.xyz/35764

I had not seen that discussion before.  Interesting.

>
> James/Patrick decided it made more sense for pid control to check at
> runtime for a running EM instance.  That made sense to me.  So we don't
> need an EM distro feature until someone adds conditional compilation for
> EM support in another application.

I was speaking to a slightly bigger issue.  Now that you have an
Entity-Manager feature, do your IPMI command handlers work?  Or are
they still using the old phosphor-inventory type commands.  It's this
kind of cross linking I'd like to see us get better at.  See above, I
suspect this is something we can work toward, and probably shouldn't
block your minimal image patch.

>
> >phosphor-webui vs webui-vue might be another good one (I'm looking into
> >this currently),
>
> If the world made any sense, there would just be an image feature for
> both, much like how of how upstream has an image feature for dropbear
> and an image feature for openssh.

Totally agree.

>  I'm still trying to figure out how we
> got ourselves into a position where building the webserver needs to be
> aware of what javascript application is running on it...my point
> is...there are less strange examples to be building out our best
> practices w.r.t distro features on.

Because webui-vue didn't develop all the login/authorization logic
that phosphor-webui had, and in the meantime, added new features to
pre-auth, so now as we try to tighten security, it's breaking.  It's a
great example of something that has cross recipe dependencies that are
mutually exclusive.

I intentionally picked these examples because they're strange.  I
think the straightforward ones (remove an old recipe, and add a new)
we tend to know how to solve as a project.

>
> >or individual Redfish resources in bmcweb might be another.
>
> Let's stick with PACKAGECONFIGs here until patterns emerge?

Sure.

>
> >There are a bunch of examples of this you could start with.
>
> >2. Document a policy around what it means to be a "feature"
>
> There is pretty good documentation in Yocto covering the different types
> of features (image/distro/machine) at a conceptual level.  What more is
> there to add in the OpenBMC documentation?  Maybe just a list of the
> current openbmc image/distro/machine features?
>
> >including some relevant examples.  Is Redfish a feature?  Is IPMI a
> >feature?
>
> For sure, but maybe the question we should ask is are they image
> features or distro features?  The way they are implemented today they
> are image features.  To opt out of Redfish, you don't install the bmcweb
> package.

But then you'd disable the and webui, dbus-rest, and the KVM as well.
Technically to opt out of just Redfish, but not the webui or
dbus-rest, you can add a "BMCWEB_ENABLE_REDFISH=OFF" to a bbappend.
But that's not very obvious.

>  To opt out of IPMI, you don't install the 4 or so IPMI related
> packages (host-ipmid, ipmi-kcs, ipmi-bt, ipmi-ipmb, ipmi-net...)

Right, the case of "I want to remove the protocol entirely" is pretty
easy, and falls cleanly on recipe bounds.  What if I want to opt out
of the IPMI FRU implementation, and use the intel-ipmi-oem one?

>
> >or are those just interfaces to access other features?
>
> They could be, if someone needs that level of granularity.  Does someone
> want to do this?

In the case of Entity-manager, I've seen the request many times.  I
don't know of a lot of other common examples, but I suspect they'll
pop up.

>
> >Do we need a hierarchy of features?
>
> I hope not?
>
> >When/where should we use DBus to determine feature enablement, and when
> >should it be a compile option?
>
> I like this question.  My strawman answer would be always use Dbus.
> That simplifies the configuration required.  But it need not be mutually
> exclusive.  If someone needs something completely compiled out for some
> reason, that can be supported too.

Sounds reasonable.

>
> >We've been very inconsistent about these questions in the past, and
> >it's part of the reason that adding "features" properly is hard.
>
> I don't really think image features need to be all that hard.  they just
> control what packages get installed in the rootfs.  It might help this
> discusssion if you refrain from using "features" unqualified without
> image/distro/machine because those all have clear meaning in Yocto.

That's part of it.  As a project, when do we use an image feature?
When do we use a distro feature?  When do we use a machine feature?
I will fully admit that I'm not as well versed on the yocto features
as I should be, but I suspect a lot of my project is in my same
position, and would love some clear examples of when and how to use
each, with relevant examples.

>
> >3. Someone needs to go through the user-facing clients (phosphor-ipmi,
> >bmcweb, ect) as well as the recipes, and make sure command handlers
> >are organized in such a way that they're enabled or disabled by
> >feature, and we can successfully enable one feature at a time.
>
> Ok but those are autotools/cmake/meson options which correlate to a
> distro feature or maybe a packageconfig.  Those are orthogonal to image
> features and image recipes, which is what I've proposed.  I've not
> proposed a minimal distro policy.

Maybe this has all been a wash then.  I had thought you were proposing
a minimal distro, and didn't realize you were building a minimal image
with the existing distro.  My bad.

With that said, the images description is "Basic OpenBMC image with
full support for the hardware supported by the system".  Was it
intentional to call out "full support"?  Maybe I've misinterpreted the
long term intent of this patch?

>
> >will likely expose some interesting dependencies (like how IPMI
> >commands have to be enabled/disabled by library) that we'll likely
> >need to tackle.
> >
> >If the above tasks just fall onto the subsystem maintainers, who now
> >have to field the "I enabled X on my minimal build and it doesn't
> >work" type bugs, that seems like a non-starter, and likely to cause
> >more confusion than the current status quo.
>
> I think maybe image features and distro features are being conflated
> some.  I don't see how this can happen with a minimal set of image
> features.  If something doesn't work its because a package dependency is
> missing (RDEPENDS) and that is a simple bug that should be fixed.
>
> I _do_ see how this can happen with a minimal set of distro features,
> but that isn't what I've proposed.
>
> Lots of great questions here Ed, thanks.  I wonder if several different
> threads need to be spun off?

We could certainly.

To be clear, I'm in support of the above overall, and thinking about
it, I'm in support of getting it in, just because it'll force the
feature selection issue some more, which will hopefully lead to a
bunch of the above being fixed in short order.

>
> -brad
