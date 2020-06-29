Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A787A20E7A2
	for <lists+openbmc@lfdr.de>; Tue, 30 Jun 2020 00:11:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49whXY0hsHzDqZT
	for <lists+openbmc@lfdr.de>; Tue, 30 Jun 2020 08:11:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=cqEK9oci; dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49whVk1LrkzDqdM
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jun 2020 08:09:49 +1000 (AEST)
Received: by mail-ot1-x344.google.com with SMTP id m2so16857418otr.12
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jun 2020 15:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ftQj1wJ+Wl6lQC19dhW955Gbk56jhCNCa8n/Nx37KJk=;
 b=cqEK9ociHYhTk2lFkresj0fuckytSiMWAXXJjQIlbEmW1Byi85W2R7XO2zIB9LCG2c
 Nt+7FUE0DhZ0zjrUUcgqMmRCRWI+xu6mkskh993uqKGUKmtfpIaRmW9nlZWm/NDZeXNd
 n1u2XPaxMGY25xyfQncNN+dZ0RckIj0xuPcQ7FcTREgGoRsf6RRLBnGECW1gkubdhQU8
 zCk6oTVlmm0NQ36vJWGB2mhocbVatgAwXToIyXAZTPAlSPF9HTRifJSe/zWOkWiuh9CZ
 mGzUTPeaJ123hYjeBcVQkX8Hw/61Ny5aR3vZn1Tds22dNg6R9CsIBJgQ1tf7YeF4auy9
 Nf0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ftQj1wJ+Wl6lQC19dhW955Gbk56jhCNCa8n/Nx37KJk=;
 b=U0tU5SgGgFs8iymxa98FXSo2peqkD41e3srB7JZM8Uxz69LUhsOlM84XVuFbz6NHhK
 Uw1GM0s7X6igsw82s/Dx4hMOhrL48/baOyxXj99Mw1T4aRKTONPpOyMBcrmILdXcv5x+
 i/OjdPqxmQ5IZRx+3FDW5f5rhSyG2iFR9di5baXW2hfxOtqNhz//6svHFf/L2Nm2/yLE
 2lVPNcV6unPVW4m1Kxn81Nr2dOzjrkSkXazfPEFJoYYc2iJ9pV8dqn2FoiN2UOCGQUuu
 hbnXYVjukjZjD++paFNY4RyIcui8jgILvNcoRVCOTlTzux6mYwgmm8sUT0kUW0o9xbGg
 Nlfg==
X-Gm-Message-State: AOAM533DaSjkOCoe7xzbmAFAQiXHK5EY462Sf0R6EnNzgg+QsrtR6UaS
 ve6Ryg6F5b86Q6C46weP6wwRWVNCqdCkpFh+8ucGFQ==
X-Google-Smtp-Source: ABdhPJyJPWLPrqDVPe7yFQUbuyQ4ahYHuMTrgasARwTxk/7tKTg0x3sVzyqHz4uiw4jDtcyQzXiLcOystpbImdsaK3Q=
X-Received: by 2002:a9d:88a:: with SMTP id 10mr15157521otf.274.1593468586988; 
 Mon, 29 Jun 2020 15:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_a9xKn77KSnwPq2pEq36JGtfWctaBXOA_4vXtP+=JGszaPkg@mail.gmail.com>
 <CACWQX82=MuAavxCqOerxi-Sdywh0xatb-f+1YzGyVSg74oNGqA@mail.gmail.com>
 <CAA_a9xLUkr5rR5Q8YATphtmWUBEE6V=6N4=k74v8hr8PePMMAQ@mail.gmail.com>
 <CACWQX80fbSwvmyNX1d=kfZEcsS30k1ziN8JtA9LtwFfkNC9ciw@mail.gmail.com>
 <CAA_a9x+7DLrwoN9YmjZneghnGaZHAqM9kzzPo2RThH=GgSFw6w@mail.gmail.com>
 <CACWQX83XycCWC+oXXea8z6vB3Vm61_C=niUXyGXA9NO89Zwf-A@mail.gmail.com>
In-Reply-To: <CACWQX83XycCWC+oXXea8z6vB3Vm61_C=niUXyGXA9NO89Zwf-A@mail.gmail.com>
From: Alex Qiu <xqiu@google.com>
Date: Mon, 29 Jun 2020 15:09:36 -0700
Message-ID: <CAA_a9x+h61N1j3_OPvXeb7uCH+gcouy=r7_y8uSt3+XFh38ddA@mail.gmail.com>
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

On Mon, Jun 29, 2020 at 7:53 AM Ed Tanous <ed@tanous.net> wrote:
>
>
> On Thu, Jun 25, 2020 at 6:08 PM Alex Qiu <xqiu@google.com> wrote:
> > Yes, there are some restrictions in my current demo, and I'm afraid
> > that I may not have the bandwidth to cover it further alone. My point
> > is that, sometimes hardwares is designed with some unexpected
> > complexity on topology (EEPROM behind MUX for example).
> To my understanding this case is already handled.  Assign the mux to the =
parent FRU config file, and the eeprom behind it will be detected correctly=
.  With that said, this type of hardware (optional mux with an eeprom behin=
d it) is difficult to identify automatically with no other impact, hence ne=
eding to explicitly add it to the parent board.  Can you think of any other=
 examples of unexpected topology that aren't covered?

There's no parent FRU in this case; the MUX belongs to the specific
FRU, and its EEPROM is behind the MUX. Unfortunately, maybe usually we
only realize some hardware design is problematic to the software until
we see it? :) I haven't started in Google when these boards were
designed, and I'm not so sure if I could point it out even if I had
been started in Google.

>
>
> > Having the
> > ability to aid the topology discovery with code, and having the
> > topology info available to other functionalities can help a lot. JSON
> > config files are having a hard time bearing these logics, and any
> > extra logic implemented in JSON config files requires some kind of
> > script parser in daemons processing them.
> The majority of the config parsing is also able to be done at compile tim=
e, it just isn't implemented today.  With that said, the config file parsin=
g in practice takes up very little CPU time in the last profile I did, so i=
t hasn't been a priority.

I'm not quite concerned about CPU time on the parsing, but more on the
burden of developing. Because right now I feel like we need to
implement a parser per daemon for what it's consuming. Unless we agree
on a format and implement an OpenBMC library for it. Take the Virtual
Sensor design doc under review for example:
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/32345/ I think it
will also have its own parser to deal with the "Algo" attribute. To
make more fragments, right now entity-manager does the calculation
without support for parenthesis and does not follow arithmetic order
of operations, and we are trying to come up with one supporting
parenthesis without breaking the compatibility.

>
>
> > Based on your replies, the
> > concept for functionally extensions that I was asking for should be
> > implemented as daemons either standalone or plugged onto dbus?
>
> I'm not understanding the distinction of standalone vs plugged into dbus,=
 but I'll hazard a guess, and say yes, the dbus interfaces to the rest of t=
he system is (one of) the project's intended extension points.  You can eit=
her manipulate them from an existing daemon, or create an all new daemon th=
at has exactly the behavior you want.
>
>
> >
> > On "reading sensors within the BMC console", I'm actually using a
> > script to directly read from hwmon right now, because we are having
> > sensor number limit on IPMI and performance issues with IPMI and dbus.
> > We are still actively investigating these performance issues now to
> > unblock the project, but based on the current findings, I think it's
> > better to have this tool before the protocol layers.
> Have you considered opening a review with this tool to make it available =
to others?  I'd recommend opening a review to put it in here:
> https://github.com/openbmc/openbmc-tools
> This repo is much less formal, but gives people a place for these "might =
be useful to others" type scripts.  Write up a commit message with somethin=
g to the effect of "I wrote this tool, this is how you use it, I find it ma=
kes platform development easier because X." and get it checked in.

It had topology information and sensor information that we would like
baked in as its major part, so unfortunately it's not an upstream-able
script...

>
>
> >
> > On issues like uint8_t, yes, we've noted them down, but they are still
> > tech debts on our backlog, and dealing with the performance issue
> > described above remains as our priority right now.
>
> It sounds like you're swamped for time, which I can respect.  With that s=
aid, If you start by making technical improvements on small things like the=
 above, you're much more likely to have feedback (and help) when you propos=
e more wide sweeping changes, like your python example.
> If you ever get free time, and want to continue moving your proposal more=
 toward an actionable change we can make, I'm happy to help discuss options=
.  To be clear, I think if you can resolve some of the technical limitation=
s of your proposal, and put together a patchset that implements it in a lan=
guage that the project can use on a majority of platforms, I think it could=
 be a better developer experience.  We just can't remove some of the user f=
acing features that are implemented and/or planned already.

Makes sense. We'll see if we could gather enough resources at some
time to actually make it a concrete product, or we can come up with a
plan to improve the existing ones bit by bit. It's been a pleasure to
hear from you on what I haven't realized or taken into account yet,
because my team was more hardware project focused and had less
exposure to the general OpenBMC discussions or design philosophies.
Thank you!

- Alex Qiu
