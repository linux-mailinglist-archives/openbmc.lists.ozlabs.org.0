Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D71E320FEEC
	for <lists+openbmc@lfdr.de>; Tue, 30 Jun 2020 23:29:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xHZ06wSLzDqkZ
	for <lists+openbmc@lfdr.de>; Wed,  1 Jul 2020 07:29:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::341;
 helo=mail-ot1-x341.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=AbfO5Kr3; dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xHY265TRzDqRv
 for <openbmc@lists.ozlabs.org>; Wed,  1 Jul 2020 07:28:52 +1000 (AEST)
Received: by mail-ot1-x341.google.com with SMTP id w17so11829847otl.4
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jun 2020 14:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pEiPwSKI1J1ME8rdukWNlcVTxX0OD+j9wF7RO/Wo5fI=;
 b=AbfO5Kr3Q7nr3ECB03g1Kp0WPBPqdp95UMI6s0hKohVC+Fw7rmwVTmhzLOx26OaTHC
 SL74oKBb7UBE1IzNxpQpbn+nYihOr9XdKvR7eaee1kkUWQQ7oA6+b1cUaXnBLbZrkaXI
 tT3zF8GDBcz4yDqLC2Ln+mPH3SF5uBjviopmQVJWg1Kkkzbek9bnF/efAK8RPxkiiBf1
 dvfvJY4p+U7Mz83/MGAqwwyk0ivtUB6rHldnixgTSGBI7dyP8+LKnePVjZ3PL9dQHvU3
 /ZURaOodDeAyFXK4hSx1+cH0pfKNds03CjdYw40vUr3Va17NdqhowldxDVqJvDzLOOAw
 O/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pEiPwSKI1J1ME8rdukWNlcVTxX0OD+j9wF7RO/Wo5fI=;
 b=N32zfYWP8ov90cF/7cU7UhBBxutQVXp5r3vOfaSKaIP+CA5qPRrFB/ItnzlhrZzq+S
 EE9Yxwk7NPQtRVX/Fy+66tFouPVJfBF1rTDK6SJO3r/t5kU4nHTAB/MA/3H1Jc1tmVvX
 azHXv5u6IyGZUN2dNGGYuG7Cois0yUzhmIn9bTQPHVctfQMXER0Nl0CEKrj0LrUXo8EP
 SBm0tSwQuww+8fsp5M+r+1N56vzu8qoBT54nb6T14CRZtJ7djCO44MA978QyMReYzevY
 kLmoJeVIm9zKYVckJKH0i4Ekwv4gg54wbvuXIoofI5NdZcv9zZ3W9UGeoCn/+Rtc2cig
 txKA==
X-Gm-Message-State: AOAM532ziIvJoRIroxCFFMTW4RUhXHavIl08aiuryVvhSZG5aYZJ7Znj
 3JbLFIDL8cQHXcuVMYtQjRicbgkpT9BZnYTs39StyQ==
X-Google-Smtp-Source: ABdhPJxC8gyrCxKN9QBIkhS4E23E2iuLrMwN52sPkdKMUUZG+QLG28W6oosDvNBdUTg3u773P3XtCp8Onscnv2KxgDg=
X-Received: by 2002:a05:6830:3149:: with SMTP id
 c9mr19609665ots.302.1593552528908; 
 Tue, 30 Jun 2020 14:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_a9xKn77KSnwPq2pEq36JGtfWctaBXOA_4vXtP+=JGszaPkg@mail.gmail.com>
 <CACWQX82=MuAavxCqOerxi-Sdywh0xatb-f+1YzGyVSg74oNGqA@mail.gmail.com>
 <CAA_a9xLUkr5rR5Q8YATphtmWUBEE6V=6N4=k74v8hr8PePMMAQ@mail.gmail.com>
 <CACWQX80fbSwvmyNX1d=kfZEcsS30k1ziN8JtA9LtwFfkNC9ciw@mail.gmail.com>
 <CAA_a9x+7DLrwoN9YmjZneghnGaZHAqM9kzzPo2RThH=GgSFw6w@mail.gmail.com>
 <CACWQX83XycCWC+oXXea8z6vB3Vm61_C=niUXyGXA9NO89Zwf-A@mail.gmail.com>
 <CAA_a9x+h61N1j3_OPvXeb7uCH+gcouy=r7_y8uSt3+XFh38ddA@mail.gmail.com>
 <CACWQX83baDkPtr6CxEUvBCQQF2YdOkfQDxc03c8YVpqX5qcpfQ@mail.gmail.com>
In-Reply-To: <CACWQX83baDkPtr6CxEUvBCQQF2YdOkfQDxc03c8YVpqX5qcpfQ@mail.gmail.com>
From: Alex Qiu <xqiu@google.com>
Date: Tue, 30 Jun 2020 14:28:37 -0700
Message-ID: <CAA_a9x+6OfxGP+Sd6hYeBo3u1yEm1Z=OeXbk5+EOkcik9KyGdg@mail.gmail.com>
Subject: Re: Feedback on Current OpenBMC and Proposing Some Improvements ----
 "Improvements" Ideas
To: Ed Tanous <ed@tanous.net>
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

On Mon, Jun 29, 2020 at 6:28 PM Ed Tanous <ed@tanous.net> wrote:
>
> On Mon, Jun 29, 2020 at 3:09 PM Alex Qiu <xqiu@google.com> wrote:
> >
> > On Mon, Jun 29, 2020 at 7:53 AM Ed Tanous <ed@tanous.net> wrote:
> > >
> > >
> > > On Thu, Jun 25, 2020 at 6:08 PM Alex Qiu <xqiu@google.com> wrote:
> > > > Yes, there are some restrictions in my current demo, and I'm afraid
> > > > that I may not have the bandwidth to cover it further alone. My poi=
nt
> > > > is that, sometimes hardwares is designed with some unexpected
> > > > complexity on topology (EEPROM behind MUX for example).
> > > To my understanding this case is already handled.  Assign the mux to =
the parent FRU config file, and the eeprom behind it will be detected corre=
ctly.  With that said, this type of hardware (optional mux with an eeprom b=
ehind it) is difficult to identify automatically with no other impact, henc=
e needing to explicitly add it to the parent board.  Can you think of any o=
ther examples of unexpected topology that aren't covered?
> >
> > There's no parent FRU in this case; the MUX belongs to the specific
> > FRU, and its EEPROM is behind the MUX.
>
> I called the baseboard a FRU, that was my bad and I suspect you got
> confused.  I should've said baseboard "entity".  The FRU you're trying
> to detect is plugged into _something_ else.  If it's not detectable by
> other means, you need to add the circuity to the parent component.  If
> you've implemented entity manager as intended, you would have a
> configuration file for your baseboard/motherboard/primary comms board.
> That is the one I was suggesting you should put it in.  This is the
> exact reason the baseboard is a first class component in EM.
> Look at one of the *_baseboard.json as an example.  I believe Wolf
> Pass handles this exact case for a PCIe riser (although I'm not sure
> about the state of it in EM).

Ah, I see. So basically it's a workaround to register the MUX that may
be plugged onto the baseboard? On the other hand, I just realized
today that our current workaround to statically assign these possible
MUX in the device tree could make these logical I2C bus numbers fixed,
which is very friendly for engineers to issue raw I2C commands with
i2ctools. Non-BMC engineers would probably have a headache when they
are told how to find the bus number in sysfs for a device instead of
being given a formula to calculate (which is already a headache to
explain).

>
> > Unfortunately, maybe usually we
> > only realize some hardware design is problematic to the software until
> > we see it? :) I haven't started in Google when these boards were
> > designed, and I'm not so sure if I could point it out even if I had
> > been started in Google.
>
> To reiterate, I think this case is handled, in a similar way to what
> you'd have to implement in control flow code, given the fact that the
> card itself is undetectable through conventional scanning.  You have
> to make some assumption about "If I'm on Platform X, I MIGHT have an
> undetectable card behind a mux at address Y.  If I see something
> there, assume it's that type, and try to scan behind it.
>
> With that said, I'm still interested to see if there's a way to make
> your hardcoded approach viable for the things we need entity manager
> to do.  Again, if you have time, start hacking on it and see what you
> can integrate.
>
> >
> > >
> > >
> > > > Having the
> > > > ability to aid the topology discovery with code, and having the
> > > > topology info available to other functionalities can help a lot. JS=
ON
> > > > config files are having a hard time bearing these logics, and any
> > > > extra logic implemented in JSON config files requires some kind of
> > > > script parser in daemons processing them.
> > > The majority of the config parsing is also able to be done at compile=
 time, it just isn't implemented today.  With that said, the config file pa=
rsing in practice takes up very little CPU time in the last profile I did, =
so it hasn't been a priority.
> >
> > I'm not quite concerned about CPU time on the parsing, but more on the
> > burden of developing. Because right now I feel like we need to
> > implement a parser per daemon for what it's consuming.
>
> I have no clue where you got that idea.  There is, by design, one json
> parser, and it lives in entity manager.  Entity manager runs the
> detection and posts the relevant interfaces to Dbus.  You do not have
> to reimplement it for every single daemon.  Can you point out any
> example of a json parser in one of the existing sensor daemons?  I
> suspect you're not quite understanding the code you're looking at.

I think I just got this idea from the virtual sensor design doc, which
is against the design principle of EM in your opinion...

>
> If you're talking about the sensor daemons "parsing" dbus, I agree,
> dbus interfaces are relatively complicated and error prone, but at
> this point, a non-dbus OpenBMC is probably a massive undertaking
> (although I'm sure you'd get a lot of support if you did it).
>
> > Unless we agree
> > on a format and implement an OpenBMC library for it. Take the Virtual
> > Sensor design doc under review for example:
> > https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/32345/ I think it
> > will also have its own parser to deal with the "Algo" attribute.
> Yes, I agree.  If I'm honest, I think the virtual sensor design goes
> against some of the principles that EM was built on, as it moves large
> amounts of complexity into config files (in exactly the way you've
> noted), essentially ignores the dynamic nature of system topology, is
> parsing "code" at runtime and makes debugging issues difficult.  I
> think it will be hard to build, and even harder to maintain.  I (nor
> any of the EM/dbus-sensors maintainers last time I looked) have
> weighed in on it, so it's far from done (update, I just did).  Clearly
> I should've left feedback on it earlier, but I, like you, don't have
> much time for openbmc these days, so I pick my battles carefully.
> > To
> > make more fragments, right now entity-manager does the calculation
> > without support for parenthesis and does not follow arithmetic order
> > of operations, and we are trying to come up with one supporting
> > parenthesis without breaking the compatibility.
>
> Again, remember that you're looking at something not on master.  I had
> a bunch of comments staged on that review that I just pushed.  I'm
> glad to see you left some similar comments to what I posted.
> If you're talking about the parser in entity manager, I'm confused.
> There aren't any arithmetic operations (besides one hack), nor is it
> doing any DSL level parsing at that level.  That would go against a
> lot of the intent.

For the parser, I'm referring to the function templateCharReplace() in
https://github.com/openbmc/entity-manager/blob/master/src/Utils.cpp#L154.
We found it unintuitive that it does not support parenthesis and does
not follow arithmetic order of operations. If we try to improve it to
support parenthesis and arithmetic order of operations, it will break
compatibility if we don't watch it carefully.

>
> One thing to remember is that so long as you update the relevant
> config files, you should feel free to change semantics of how some of
> these things work.  There aren't that many config files on master.
>
> >
> > >
> > >
> > > > Based on your replies, the
> > > > concept for functionally extensions that I was asking for should be
> > > > implemented as daemons either standalone or plugged onto dbus?
> > >
> > > I'm not understanding the distinction of standalone vs plugged into d=
bus, but I''ll hazard a guess, and say yes, the dbus interfaces to the rest=
 of the system is (one of) the project's intended extension points.  You ca=
n either manipulate them from an existing daemon, or create an all new daem=
on that has exactly the behavior you want.
> > >
> > >
> > > >
> > > > On "reading sensors within the BMC console", I'm actually using a
> > > > script to directly read from hwmon right now, because we are having
> > > > sensor number limit on IPMI and performance issues with IPMI and db=
us.
> > > > We are still actively investigating these performance issues now to
> > > > unblock the project, but based on the current findings, I think it'=
s
> > > > better to have this tool before the protocol layers.
> > > Have you considered opening a review with this tool to make it availa=
ble to others?  I'd recommend opening a review to put it in here:
> > > https://github.com/openbmc/openbmc-tools
> > > This repo is much less formal, but gives people a place for these "mi=
ght be useful to others" type scripts.  Write up a commit message with some=
thing to the effect of "I wrote this tool, this is how you use it, I find i=
t makes platform development easier because X." and get it checked in.
> >
> > It had topology information and sensor information that we would like
> > baked in as its major part, so unfortunately it's not an upstream-able
> > script...
> Here is yet another opportunity to make things better, and I feel like
> you're squandering it.  I like to complain about the current state as
> much as anyone, but if we're not putting up patchsets, it will never
> improve, and the next person will just come in with the same
> complaints.  If you have tools that you think are better, or provide
> the start to a better tool, consider putting them up under your
> username so other people can benefit, and see the ideas encapsulated
> within it.

Sorry about that, but we've been really doing a lot of
platform-specific scripts or hacks, and it's non-trivial or losing a
lot of its core to upstream them.

>
> >
> > >
> > >
> > > >
> > > > On issues like uint8_t, yes, we've noted them down, but they are st=
ill
> > > > tech debts on our backlog, and dealing with the performance issue
> > > > described above remains as our priority right now.
> > >
> > > It sounds like you're swamped for time, which I can respect.  With th=
at said, If you start by making technical improvements on small things like=
 the above, you're much more likely to have feedback (and help) when you pr=
opose more wide sweeping changes, like your python example.
> > > If you ever get free time, and want to continue moving your proposal =
more toward an actionable change we can make, I'm happy to help discuss opt=
ions.  To be clear, I think if you can resolve some of the technical limita=
tions of your proposal, and put together a patchset that implements it in a=
 language that the project can use on a majority of platforms, I think it c=
ould be a better developer experience.  We just can't remove some of the us=
er facing features that are implemented and/or planned already.
> >
> > Makes sense. We'll see if we could gather enough resources at some
> > time to actually make it a concrete product, or we can come up with a
> > plan to improve the existing ones bit by bit. It's been a pleasure to
> > hear from you on what I haven't realized or taken into account yet,
> > because my team was more hardware project focused and had less
> > exposure to the general OpenBMC discussions or design philosophies.
> > Thank you!
> >
> You're very welcome.

- Alex Qiu
