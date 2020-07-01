Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F239121119A
	for <lists+openbmc@lfdr.de>; Wed,  1 Jul 2020 19:07:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xnhy4gNwzDr3f
	for <lists+openbmc@lfdr.de>; Thu,  2 Jul 2020 03:07:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::32d;
 helo=mail-ot1-x32d.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=MnnBjFCN; dkim-atps=neutral
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xnhC72VNzDr1c
 for <openbmc@lists.ozlabs.org>; Thu,  2 Jul 2020 03:06:50 +1000 (AEST)
Received: by mail-ot1-x32d.google.com with SMTP id m2so21964195otr.12
 for <openbmc@lists.ozlabs.org>; Wed, 01 Jul 2020 10:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uey2Tt6lJqnti6Hi8RjuYETGNvmWzCx2WsHaXwC7gUk=;
 b=MnnBjFCNEtjWJKb9Ju5wih240FaAWJ4w8NDiCIHWUwyRm83JZ5WuQvUlk0kyuIiy92
 2pLCNXhBHRUrhskk+nxmOQhwJyboGOqVek+ZfGZrhlMxvYAV1jpXKU70QwNPpef6ZXLQ
 dOLU+Ld43ZUUyPjYiTBtI4FmcoYPi8Ci/rYM9kUIgrDpRclUxKPbVIUdCYaq4ljQoI8/
 hjfXpfZFy3Th/pEyCZxavzs00N08TiS9QGwnkA3qEE0ENSFXJj9b7FHJFQu0CINO/rsG
 a1uPqlLPhj+VjmE3MPeBanuecBCSdJkvMEVLBsfvulZ6Xgqz0fze6eRkKbSRt00s9UvS
 DJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uey2Tt6lJqnti6Hi8RjuYETGNvmWzCx2WsHaXwC7gUk=;
 b=rGFqG3ArZtHfEtYUxhH/JRUvtxgHIXsb8cWKuwEqg6NC3RWXvSH9ogKyS2cQkS525V
 fdP4dQgIRsYVLQ9VmRG2jw5j7j9rS5jt2hJ1mac0lRkz4wLKNZnPiSIivRH4D+u7HsRB
 tSxMp73UumJfPn14WHE22KdMJ4aSa4LaEqg9YBmaUf1Ou0yA9ZNE+2TnOSKisFaziazy
 9W5BiqLOVyHj7Gkc7jjtPwFNaHcGWeW3fIoaabLgHC4zYFM5IRUl1vBkWQBWhr7pi/Wu
 uRKXvDG+BdZm7Ms0JoY7Upy6TZjvRi9paM4HXBxkuaZBw7NfpOxaA2h4rXc7tlIHY97G
 4LvA==
X-Gm-Message-State: AOAM531zaBJgjlUwRvI0L4ULT1SrIMnK4EFsgkSvpU2pe3Ce6FuiNArw
 tB7UknroKQ65vMTB7wTaKl8EOPOYXGeO0IGD+kWm9w==
X-Google-Smtp-Source: ABdhPJy5yZhlwBkoeIg+6wvRiKCBYJDA3iYFoOKOeGUHXOC2IymOIJFvZTZO8A29IZgpk3e2uJItrFUYDiJrDmYhk6c=
X-Received: by 2002:a05:6830:3149:: with SMTP id
 c9mr23334252ots.302.1593623204634; 
 Wed, 01 Jul 2020 10:06:44 -0700 (PDT)
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
 <CACWQX83treqBh2Xh6ycyK=3eO3HbGmZuPyqFPTEXt1dH8QheFA@mail.gmail.com>
In-Reply-To: <CACWQX83treqBh2Xh6ycyK=3eO3HbGmZuPyqFPTEXt1dH8QheFA@mail.gmail.com>
From: Alex Qiu <xqiu@google.com>
Date: Wed, 1 Jul 2020 10:06:33 -0700
Message-ID: <CAA_a9xLuCPRGawer58S-XUMo_2A27hLYsn=5_0LE4BUvqSLmtg@mail.gmail.com>
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

On Tue, Jun 30, 2020 at 7:00 PM Ed Tanous <ed@tanous.net> wrote:
>
> On Tue, Jun 30, 2020 at 2:28 PM Alex Qiu <xqiu@google.com> wrote:
> >
> > On Mon, Jun 29, 2020 at 6:28 PM Ed Tanous <ed@tanous.net> wrote:
> > >
> > > On Mon, Jun 29, 2020 at 3:09 PM Alex Qiu <xqiu@google.com> wrote:
> > > >
> > > > On Mon, Jun 29, 2020 at 7:53 AM Ed Tanous <ed@tanous.net> wrote:
> > > > >
> > > > >
> > > > > On Thu, Jun 25, 2020 at 6:08 PM Alex Qiu <xqiu@google.com> wrote:
> > > > > > Yes, there are some restrictions in my current demo, and I'm af=
raid
> > > > > > that I may not have the bandwidth to cover it further alone. My=
 point
> > > > > > is that, sometimes hardwares is designed with some unexpected
> > > > > > complexity on topology (EEPROM behind MUX for example).
> > > > > To my understanding this case is already handled.  Assign the mux=
 to the parent FRU config file, and the eeprom behind it will be detected c=
orrectly.  With that said, this type of hardware (optional mux with an eepr=
om behind it) is difficult to identify automatically with no other impact, =
hence needing to explicitly add it to the parent board.  Can you think of a=
ny other examples of unexpected topology that aren't covered?
> > > >
> > > > There's no parent FRU in this case; the MUX belongs to the specific
> > > > FRU, and its EEPROM is behind the MUX.
> > >
> > > I called the baseboard a FRU, that was my bad and I suspect you got
> > > confused.  I should've said baseboard "entity".  The FRU you're tryin=
g
> > > to detect is plugged into _something_ else.  If it's not detectable b=
y
> > > other means, you need to add the circuity to the parent component.  I=
f
> > > you've implemented entity manager as intended, you would have a
> > > configuration file for your baseboard/motherboard/primary comms board=
.
> > > That is the one I was suggesting you should put it in.  This is the
> > > exact reason the baseboard is a first class component in EM.
> > > Look at one of the *_baseboard.json as an example.  I believe Wolf
> > > Pass handles this exact case for a PCIe riser (although I'm not sure
> > > about the state of it in EM).
> >
> > Ah, I see. So basically it's a workaround to register the MUX that may
> > be plugged onto the baseboard?
>
> Correct.
>
> > On the other hand, I just realized
> > today that our current workaround to statically assign these possible
> > MUX in the device tree could make these logical I2C bus numbers fixed,
> > which is very friendly for engineers to issue raw I2C commands with
> > i2ctools.
> For a given configuration, entity manager will give consistent bus
> numbers as well, and also provides helpful symlinks in the filesystem,
> for example, /dev/PCIE_SLOT1 points to the bus of the first PCIe slot,
> be it a root bus plugged directly into the bmc, or 3 levels of mux
> connected through several boards.  I believe the i2c tools can also
> use the symlink to interact directly with that in a named way that's
> friendly.
> > Non-BMC engineers would probably have a headache when they
> > are told how to find the bus number in sysfs for a device instead of
> > being given a formula to calculate (which is already a headache to
> > explain).
> I'm not following that statement.  "find the bus number" would occur
> whether or not you have the busses hardcoded.  Are you advocating for
> not using hwmon sensors here?  Needing to do a calculation for the new
> part you're adding would need to be done regardless.  If you turn it
> into a hwmon sensor, you could have the kernel do the math for you,
> and keep your debugability.

Hardware engineers want to set the output voltage for voltage
regulators for debugging, which is not covered by hwmon interface or
drivers, so we need to send raw I2C commands. When a system is not
fully populated, I believe the kernel always assigns the largest
sequential numbers to newly created MUX channels, so that number will
vary based on the debug system configurations. On the other hand, our
current workaround to populate the MUXes in the device tree while they
may not exist fixes the bus numbers which can be calculated from a
formula, instead of tracing symlinks.

>
> >
> > >
> > > If you're talking about the sensor daemons "parsing" dbus, I agree,
> > > dbus interfaces are relatively complicated and error prone, but at
> > > this point, a non-dbus OpenBMC is probably a massive undertaking
> > > (although I'm sure you'd get a lot of support if you did it).
> > >
> > > > Unless we agree
> > > > on a format and implement an OpenBMC library for it. Take the Virtu=
al
> > > > Sensor design doc under review for example:
> > > > https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/32345/ I think =
it
> > > > will also have its own parser to deal with the "Algo" attribute.
> > > Yes, I agree.  If I'm honest, I think the virtual sensor design goes
> > > against some of the principles that EM was built on, as it moves larg=
e
> > > amounts of complexity into config files (in exactly the way you've
> > > noted), essentially ignores the dynamic nature of system topology, is
> > > parsing "code" at runtime and makes debugging issues difficult.  I
> > > think it will be hard to build, and even harder to maintain.  I (nor
> > > any of the EM/dbus-sensors maintainers last time I looked) have
> > > weighed in on it, so it's far from done (update, I just did).  Clearl=
y
> > > I should've left feedback on it earlier, but I, like you, don't have
> > > much time for openbmc these days, so I pick my battles carefully.
> > > > To
> > > > make more fragments, right now entity-manager does the calculation
> > > > without support for parenthesis and does not follow arithmetic orde=
r
> > > > of operations, and we are trying to come up with one supporting
> > > > parenthesis without breaking the compatibility.
> > >
> > > Again, remember that you're looking at something not on master.  I ha=
d
> > > a bunch of comments staged on that review that I just pushed.  I'm
> > > glad to see you left some similar comments to what I posted.
> > > If you're talking about the parser in entity manager, I'm confused.
> > > There aren't any arithmetic operations (besides one hack), nor is it
> > > doing any DSL level parsing at that level.  That would go against a
> > > lot of the intent.
> >
> > For the parser, I'm referring to the function templateCharReplace() in
> > https://github.com/openbmc/entity-manager/blob/master/src/Utils.cpp#L15=
4.
> > We found it unintuitive that it does not support parenthesis and does
> > not follow arithmetic order of operations. If we try to improve it to
> > support parenthesis and arithmetic order of operations, it will break
> > compatibility if we don't watch it carefully.
>
> Yes, it's not a real parser, but if you look at the commit for the
> problem it was fixing (massively duplicated config files for power
> supplies because of minor changes) then it starts to make more sense
> that what's there is better than what came before.  If it's important
> to you, then put together a patch to add a real parser?  Remember that
> the relevant config files are checked into that repo, so you can
> actually dump every single config statement and flush it through your
> parser to test that it gives the same result, and in the cases it
> doesn't, add parenthesis where required to get the same result.  I
> would really only expect the quad mode power supply files to even be
> effected, and I believe (based on how their expression is parsed) they
> won't be.

For the concern of compatibility, we worry that other companies are
also using these features downstream. FYI, we are heavily relying on
it right now, even though we find out it's not following arithmetic
order of operations.

- Alex Qiu
