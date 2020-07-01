Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 666FE2101B7
	for <lists+openbmc@lfdr.de>; Wed,  1 Jul 2020 04:01:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xPbV43q0zDqnw
	for <lists+openbmc@lfdr.de>; Wed,  1 Jul 2020 12:01:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b44; helo=mail-yb1-xb44.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=XUn31qIQ; dkim-atps=neutral
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xPZQ5fKjzDqnB
 for <openbmc@lists.ozlabs.org>; Wed,  1 Jul 2020 12:00:29 +1000 (AEST)
Received: by mail-yb1-xb44.google.com with SMTP id s1so11133820ybo.7
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jun 2020 19:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+rsF5iJZEIzcxksRjCH2yBB3nR+F5Mz71PKRo2DYE3w=;
 b=XUn31qIQXo48BcXpxm6TtaRL+/4Ex+emucD6lgzRR/uCCQziQPjSttHaoo2KLpeVIM
 WpN2g+Iu3pio3qkGtrk+NWEfp5gztAKYSkhntXD3eRio4rrz7nEwv9Uwn9bLAxyOI3iY
 kUKQ9/Zfh1TEYiVe1ZceJlvO8bvH2veJErCUWiUN1KEt8YRQ7DhwqwDsKn0TddQ8Jx1o
 jjbu7Zy6FDfUbQJChmmQ8fxJ/Y9DNRwaqKyd3id1aklwpZwzzhEKEMQ+qZH1iZquU4li
 FU/dOz+zCnvbZVdyjRFNlvKRrhbhLjJv+XCLjpInrVP6zsrZg4u6iZL4Kkaay6iM8dJT
 OqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+rsF5iJZEIzcxksRjCH2yBB3nR+F5Mz71PKRo2DYE3w=;
 b=DhqFuCb39Co4GTIhRsluIdujFDNAne8rCnUYqkqYrovhui61imzsDVe4rhcKJXNx1o
 4KTr06+VOJ+mNF9ngYU50IfM+/HoMGOGHksT1rJcASBnQXIJ4YQBKNQCa/TojlIrBVCJ
 NebyO4B9mKEIVQEd1y2ZYUlKR4tiL/7fHaPnRmzzBriaP/5u/h+EzUvlkFIWYyvXGLui
 hMVw5nQZCDYGK8wbZRe3JOTPa0yk0KAh9Z3Bqta9n/Y5jKoHFhDNZ11u6AHkqk4ZXCxM
 XFNOZpc8047MiwI6/ngQRuB5hsryvdFinhKBWkx0jHlzT8OJ1/7X44FW9YfDlFu0UjeG
 DK8g==
X-Gm-Message-State: AOAM5305XWeJ5LP6O4FcQoEmDVuJJsjSfd/NM4wCnUgyLUdDaa6lKb4a
 3/bIp4pMnBqXZ2SVeJ4DEtRQ+BjqbjwxhLjL851fLg==
X-Google-Smtp-Source: ABdhPJy9TZiCEOK7GwiVnKwrpp+vtquj31DHNT5Wi9cqNsL3bZZEgy4tg4TvJazSQkBYlQlTdHodU7Ursf9fgHlTx08=
X-Received: by 2002:a25:aa44:: with SMTP id s62mr35990600ybi.480.1593568823719; 
 Tue, 30 Jun 2020 19:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_a9xKn77KSnwPq2pEq36JGtfWctaBXOA_4vXtP+=JGszaPkg@mail.gmail.com>
 <CACWQX82=MuAavxCqOerxi-Sdywh0xatb-f+1YzGyVSg74oNGqA@mail.gmail.com>
 <CAA_a9xLUkr5rR5Q8YATphtmWUBEE6V=6N4=k74v8hr8PePMMAQ@mail.gmail.com>
 <CACWQX80fbSwvmyNX1d=kfZEcsS30k1ziN8JtA9LtwFfkNC9ciw@mail.gmail.com>
 <CAA_a9x+7DLrwoN9YmjZneghnGaZHAqM9kzzPo2RThH=GgSFw6w@mail.gmail.com>
 <CACWQX83XycCWC+oXXea8z6vB3Vm61_C=niUXyGXA9NO89Zwf-A@mail.gmail.com>
 <CAA_a9x+h61N1j3_OPvXeb7uCH+gcouy=r7_y8uSt3+XFh38ddA@mail.gmail.com>
 <CACWQX83baDkPtr6CxEUvBCQQF2YdOkfQDxc03c8YVpqX5qcpfQ@mail.gmail.com>
 <CAA_a9x+6OfxGP+Sd6hYeBo3u1yEm1Z=OeXbk5+EOkcik9KyGdg@mail.gmail.com>
In-Reply-To: <CAA_a9x+6OfxGP+Sd6hYeBo3u1yEm1Z=OeXbk5+EOkcik9KyGdg@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 30 Jun 2020 19:00:12 -0700
Message-ID: <CACWQX83treqBh2Xh6ycyK=3eO3HbGmZuPyqFPTEXt1dH8QheFA@mail.gmail.com>
Subject: Re: Feedback on Current OpenBMC and Proposing Some Improvements ----
 "Improvements" Ideas
To: Alex Qiu <xqiu@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ofer Yehielli <ofery@google.com>,
 Josh Lehan <krellan@google.com>, Richard Hanley <rhanley@google.com>,
 Kais Belgaied <belgaied@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jun 30, 2020 at 2:28 PM Alex Qiu <xqiu@google.com> wrote:
>
> On Mon, Jun 29, 2020 at 6:28 PM Ed Tanous <ed@tanous.net> wrote:
> >
> > On Mon, Jun 29, 2020 at 3:09 PM Alex Qiu <xqiu@google.com> wrote:
> > >
> > > On Mon, Jun 29, 2020 at 7:53 AM Ed Tanous <ed@tanous.net> wrote:
> > > >
> > > >
> > > > On Thu, Jun 25, 2020 at 6:08 PM Alex Qiu <xqiu@google.com> wrote:
> > > > > Yes, there are some restrictions in my current demo, and I'm afra=
id
> > > > > that I may not have the bandwidth to cover it further alone. My p=
oint
> > > > > is that, sometimes hardwares is designed with some unexpected
> > > > > complexity on topology (EEPROM behind MUX for example).
> > > > To my understanding this case is already handled.  Assign the mux t=
o the parent FRU config file, and the eeprom behind it will be detected cor=
rectly.  With that said, this type of hardware (optional mux with an eeprom=
 behind it) is difficult to identify automatically with no other impact, he=
nce needing to explicitly add it to the parent board.  Can you think of any=
 other examples of unexpected topology that aren't covered?
> > >
> > > There's no parent FRU in this case; the MUX belongs to the specific
> > > FRU, and its EEPROM is behind the MUX.
> >
> > I called the baseboard a FRU, that was my bad and I suspect you got
> > confused.  I should've said baseboard "entity".  The FRU you're trying
> > to detect is plugged into _something_ else.  If it's not detectable by
> > other means, you need to add the circuity to the parent component.  If
> > you've implemented entity manager as intended, you would have a
> > configuration file for your baseboard/motherboard/primary comms board.
> > That is the one I was suggesting you should put it in.  This is the
> > exact reason the baseboard is a first class component in EM.
> > Look at one of the *_baseboard.json as an example.  I believe Wolf
> > Pass handles this exact case for a PCIe riser (although I'm not sure
> > about the state of it in EM).
>
> Ah, I see. So basically it's a workaround to register the MUX that may
> be plugged onto the baseboard?

Correct.

> On the other hand, I just realized
> today that our current workaround to statically assign these possible
> MUX in the device tree could make these logical I2C bus numbers fixed,
> which is very friendly for engineers to issue raw I2C commands with
> i2ctools.
For a given configuration, entity manager will give consistent bus
numbers as well, and also provides helpful symlinks in the filesystem,
for example, /dev/PCIE_SLOT1 points to the bus of the first PCIe slot,
be it a root bus plugged directly into the bmc, or 3 levels of mux
connected through several boards.  I believe the i2c tools can also
use the symlink to interact directly with that in a named way that's
friendly.
> Non-BMC engineers would probably have a headache when they
> are told how to find the bus number in sysfs for a device instead of
> being given a formula to calculate (which is already a headache to
> explain).
I'm not following that statement.  "find the bus number" would occur
whether or not you have the busses hardcoded.  Are you advocating for
not using hwmon sensors here?  Needing to do a calculation for the new
part you're adding would need to be done regardless.  If you turn it
into a hwmon sensor, you could have the kernel do the math for you,
and keep your debugability.

> > >
> > > >
> > > >
> > > > > Having the
> > > > > ability to aid the topology discovery with code, and having the
> > > > > topology info available to other functionalities can help a lot. =
JSON
> > > > > config files are having a hard time bearing these logics, and any
> > > > > extra logic implemented in JSON config files requires some kind o=
f
> > > > > script parser in daemons processing them.
> > > > The majority of the config parsing is also able to be done at compi=
le time, it just isn't implemented today.  With that said, the config file =
parsing in practice takes up very little CPU time in the last profile I did=
, so it hasn't been a priority.
> > >
> > > I'm not quite concerned about CPU time on the parsing, but more on th=
e
> > > burden of developing. Because right now I feel like we need to
> > > implement a parser per daemon for what it's consuming.
> >
> > I have no clue where you got that idea.  There is, by design, one json
> > parser, and it lives in entity manager.  Entity manager runs the
> > detection and posts the relevant interfaces to Dbus.  You do not have
> > to reimplement it for every single daemon.  Can you point out any
> > example of a json parser in one of the existing sensor daemons?  I
> > suspect you're not quite understanding the code you're looking at.
>
> I think I just got this idea from the virtual sensor design doc, which
> is against the design principle of EM in your opinion...

Sounds like we're on the same page here then.  See my comments on that revi=
ew.

>
> >
> > If you're talking about the sensor daemons "parsing" dbus, I agree,
> > dbus interfaces are relatively complicated and error prone, but at
> > this point, a non-dbus OpenBMC is probably a massive undertaking
> > (although I'm sure you'd get a lot of support if you did it).
> >
> > > Unless we agree
> > > on a format and implement an OpenBMC library for it. Take the Virtual
> > > Sensor design doc under review for example:
> > > https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/32345/ I think it
> > > will also have its own parser to deal with the "Algo" attribute.
> > Yes, I agree.  If I'm honest, I think the virtual sensor design goes
> > against some of the principles that EM was built on, as it moves large
> > amounts of complexity into config files (in exactly the way you've
> > noted), essentially ignores the dynamic nature of system topology, is
> > parsing "code" at runtime and makes debugging issues difficult.  I
> > think it will be hard to build, and even harder to maintain.  I (nor
> > any of the EM/dbus-sensors maintainers last time I looked) have
> > weighed in on it, so it's far from done (update, I just did).  Clearly
> > I should've left feedback on it earlier, but I, like you, don't have
> > much time for openbmc these days, so I pick my battles carefully.
> > > To
> > > make more fragments, right now entity-manager does the calculation
> > > without support for parenthesis and does not follow arithmetic order
> > > of operations, and we are trying to come up with one supporting
> > > parenthesis without breaking the compatibility.
> >
> > Again, remember that you're looking at something not on master.  I had
> > a bunch of comments staged on that review that I just pushed.  I'm
> > glad to see you left some similar comments to what I posted.
> > If you're talking about the parser in entity manager, I'm confused.
> > There aren't any arithmetic operations (besides one hack), nor is it
> > doing any DSL level parsing at that level.  That would go against a
> > lot of the intent.
>
> For the parser, I'm referring to the function templateCharReplace() in
> https://github.com/openbmc/entity-manager/blob/master/src/Utils.cpp#L154.
> We found it unintuitive that it does not support parenthesis and does
> not follow arithmetic order of operations. If we try to improve it to
> support parenthesis and arithmetic order of operations, it will break
> compatibility if we don't watch it carefully.

Yes, it's not a real parser, but if you look at the commit for the
problem it was fixing (massively duplicated config files for power
supplies because of minor changes) then it starts to make more sense
that what's there is better than what came before.  If it's important
to you, then put together a patch to add a real parser?  Remember that
the relevant config files are checked into that repo, so you can
actually dump every single config statement and flush it through your
parser to test that it gives the same result, and in the cases it
doesn't, add parenthesis where required to get the same result.  I
would really only expect the quad mode power supply files to even be
effected, and I believe (based on how their expression is parsed) they
won't be.



>
> >
> > One thing to remember is that so long as you update the relevant
> > config files, you should feel free to change semantics of how some of
> > these things work.  There aren't that many config files on master.
> >
> > >
> > > >
> > > >
> > > > > Based on your replies, the
> > > > > concept for functionally extensions that I was asking for should =
be
> > > > > implemented as daemons either standalone or plugged onto dbus?
> > > >
> > > > I'm not understanding the distinction of standalone vs plugged into=
 dbus, but I''ll hazard a guess, and say yes, the dbus interfaces to the re=
st of the system is (one of) the project's intended extension points.  You =
can either manipulate them from an existing daemon, or create an all new da=
emon that has exactly the behavior you want.
> > > >
> > > >
> > > > >
> > > > > On "reading sensors within the BMC console", I'm actually using a
> > > > > script to directly read from hwmon right now, because we are havi=
ng
> > > > > sensor number limit on IPMI and performance issues with IPMI and =
dbus.
> > > > > We are still actively investigating these performance issues now =
to
> > > > > unblock the project, but based on the current findings, I think i=
t's
> > > > > better to have this tool before the protocol layers.
> > > > Have you considered opening a review with this tool to make it avai=
lable to others?  I'd recommend opening a review to put it in here:
> > > > https://github.com/openbmc/openbmc-tools
> > > > This repo is much less formal, but gives people a place for these "=
might be useful to others" type scripts.  Write up a commit message with so=
mething to the effect of "I wrote this tool, this is how you use it, I find=
 it makes platform development easier because X." and get it checked in.
> > >
> > > It had topology information and sensor information that we would like
> > > baked in as its major part, so unfortunately it's not an upstream-abl=
e
> > > script...
> > Here is yet another opportunity to make things better, and I feel like
> > you're squandering it.  I like to complain about the current state as
> > much as anyone, but if we're not putting up patchsets, it will never
> > improve, and the next person will just come in with the same
> > complaints.  If you have tools that you think are better, or provide
> > the start to a better tool, consider putting them up under your
> > username so other people can benefit, and see the ideas encapsulated
> > within it.
>
> Sorry about that, but we've been really doing a lot of
> platform-specific scripts or hacks, and it's non-trivial or losing a
> lot of its core to upstream them.
>
> >
> > >
> > > >
> > > >
> > > > >
> > > > > On issues like uint8_t, yes, we've noted them down, but they are =
still
> > > > > tech debts on our backlog, and dealing with the performance issue
> > > > > described above remains as our priority right now.
> > > >
> > > > It sounds like you're swamped for time, which I can respect.  With =
that said, If you start by making technical improvements on small things li=
ke the above, you're much more likely to have feedback (and help) when you =
propose more wide sweeping changes, like your python example.
> > > > If you ever get free time, and want to continue moving your proposa=
l more toward an actionable change we can make, I'm happy to help discuss o=
ptions.  To be clear, I think if you can resolve some of the technical limi=
tations of your proposal, and put together a patchset that implements it in=
 a language that the project can use on a majority of platforms, I think it=
 could be a better developer experience.  We just can't remove some of the =
user facing features that are implemented and/or planned already.
> > >
> > > Makes sense. We'll see if we could gather enough resources at some
> > > time to actually make it a concrete product, or we can come up with a
> > > plan to improve the existing ones bit by bit. It's been a pleasure to
> > > hear from you on what I haven't realized or taken into account yet,
> > > because my team was more hardware project focused and had less
> > > exposure to the general OpenBMC discussions or design philosophies.
> > > Thank you!
> > >
> > You're very welcome.
>
> - Alex Qiu
