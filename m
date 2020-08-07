Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 631CB23F418
	for <lists+openbmc@lfdr.de>; Fri,  7 Aug 2020 23:06:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNdFs4GLRzDqYd
	for <lists+openbmc@lfdr.de>; Sat,  8 Aug 2020 07:06:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::342;
 helo=mail-ot1-x342.google.com; envelope-from=jasonling@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Wb0ZTdY+; dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNdDz5hmyzDqLW
 for <openbmc@lists.ozlabs.org>; Sat,  8 Aug 2020 07:05:54 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id r21so2649458ota.10
 for <openbmc@lists.ozlabs.org>; Fri, 07 Aug 2020 14:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pPd9i7AZodW3iV4J3ARM1j0x/fFXMER/arOvwaBxXcU=;
 b=Wb0ZTdY+15/mQTG40eoIDFhIGa2u9e2nf53G4AFYo5Z4H0+WbNgmzevI/rq0GIzirH
 PEy9+lH6ZnUsTBlNFw3OahQVsZBARWvPm9/jl4cLfteyRkmu48kHf878nFQPQMba2n53
 DvLlpi0OPlXCC/vc1hm9E2EPjoXAki5IF2XrbMQZVD3ihRH+QvDxalAkffC7hhY69Soj
 Z/+G27XfFJn8wTq1SnKxIIJVHKhjGzWL2QXetfYyAjeym65GsH8K5GE5k2X9sGMSh9Fm
 0uPzCj1XvpNEhak/fSRd86tq3ME9O+TlOkjPxl7UjoHKHr+KTWCs1uorhJHC/4IShG0s
 wbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pPd9i7AZodW3iV4J3ARM1j0x/fFXMER/arOvwaBxXcU=;
 b=ufBudMm5eM9GDFWK59CtPvRQ1k9kkghjFxOSGsyXmzSM0RFKACSgQg4jGYyLe6jcgc
 vVjJIqcnYdDtdc/zOXJO10v+u9v83rZo4V5ETHeZznJAftIbMXbYWqONgP83oYBjfpUj
 tmJEHpMtTT7OI2VwoWmIVQa0liQuLcW0x40SgFFfEyjmRZraKn4CcjDWpkH5efzOIrv6
 LMnDZRIcKeEZ1zTtAOUC/KqZoXrK+AEdoQAKUzZkKzHkHn1CSFNAhnhRLUtmdrkDsBEk
 HSNPL/XalbllJ0+L0Rbv4Bjm70DcUChhT34fHhYz7DHf83VP77nQUjHAhSi1q0OwitJ6
 E6lQ==
X-Gm-Message-State: AOAM533RPQL4qDFYWSFwyNzWwzMVI0+zPF0zGU2/xWIL4l5hds1EB/ws
 K/QUmRV5yUTYjhmuDxPVbW5wpAqyhznUGVWhbnxryZ8yXUc=
X-Google-Smtp-Source: ABdhPJzO/bQ8wDESKHtC9yyrxQXk54+dYd5USyVP3qgQXjTZ95OXhPYDazeUghNW3OC5o++j0tvwpXaIj4fSngA/WbQ=
X-Received: by 2002:a9d:450a:: with SMTP id w10mr13622710ote.327.1596834351151; 
 Fri, 07 Aug 2020 14:05:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAHBbfcUoAB_nmsaCh2-vAEAjE7Fuu3MNydHLUwBS7zkt7pcPkw@mail.gmail.com>
 <f1b0300f-06ac-c350-8fcc-24eae806cdb2@linux.intel.com>
 <CAHBbfcUXLueZ3MZAP9b38B-fXyrNCMAeZcC7uk8uPrR5gw=3xQ@mail.gmail.com>
 <2bb88ede-4d35-8b9c-936f-be8dc9a453e5@linux.intel.com>
 <CAHBbfcUDMOZjxSvy8wVW_F9f3+NaX-WU3G5PF1oUoRx5VP7ZoQ@mail.gmail.com>
 <CACWQX82KAhmRbg-CYa8+Yjd8mE7qCM_vG_Q1_hYZVR77c3gdtw@mail.gmail.com>
 <CAHBbfcUJGnsW_dxONwjsT=w3ZM453-o0Ubc7DE7oOJQ8u28=ww@mail.gmail.com>
 <5a59238b-7653-b11f-701b-039d57dd5b98@linux.intel.com>
 <CAHBbfcXRO5ZB3S0T6SyRkWkLLAruKPdS8UhUkyG3qssU5YkHNw@mail.gmail.com>
 <9deda21d-aa01-d15e-464e-7ab0fb2f751c@linux.intel.com>
 <CAHBbfcX7TahfKcVcUqWKQGTK5s9Rzw3mT4_3v4tWtkAgHBgX6g@mail.gmail.com>
 <CACWQX83AdMHFk5NUJmpoesghK_2YZ9MMo6h-KoWzDtZ-jrTYRw@mail.gmail.com>
In-Reply-To: <CACWQX83AdMHFk5NUJmpoesghK_2YZ9MMo6h-KoWzDtZ-jrTYRw@mail.gmail.com>
From: Jason Ling <jasonling@google.com>
Date: Fri, 7 Aug 2020 14:05:14 -0700
Message-ID: <CAHBbfcUBBUpO9o2pNSbr0YKXNRHPju4gNNHxxNxuda9k5D0BYQ@mail.gmail.com>
Subject: Re: dbus-sensors:hwmontemp: additional attribute proposal
To: Ed Tanous <ed@tanous.net>
Content-Type: multipart/alternative; boundary="000000000000448d1e05ac4ff8a1"
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
Cc: Alex Qiu <xqiu@google.com>, James Feist <james.feist@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000448d1e05ac4ff8a1
Content-Type: text/plain; charset="UTF-8"

>
>  don't like the merging of base lists with extended lists, as it adds
> a dependency between how we represent that, and implies that we have a
> published plugin interface, which we definitely don't, nor do we want
> to maintain it at the entity manager level.  It also means that
> upstream never tests the "extended" list, which means it's a lot more
> likely to break.
>
My stance on devices added to the extended list is the same as devices
added by downstream patches. Upstream maintainers aren't responsible for
testing those, if you're patching in devices then you take the
responsibility of testing those.
My objective is to make it so devices that we don't want to upstream yet
can be maintained more easily.
First idea was a json file that extends types/lists but there are concerns
with runtime parsing for devices for the purposes of exposing telemetry
(I'd think runtime parsing of things like PID configurations would be more
worrisome).
So second idea was just to move data structures around in
dbus-sensors/PSUSensor to make upstream changes less likely to result in
merge conflicts for those who are maintaining downstream patches.
Furthermore just split the data structure up into a portion that is
upstream and downstream.
Yes, it's definitely making it friendlier for those who want to maintain
downstream patches to extend devices. I don't see how this increases
maintenance or testing burden for the maintainers though.
If however , the intent is to explicitly send the message
"You shouldn't try to use this service for any devices that do not have
explicit upstream support. Any patches that make it easier to do so will be
rejected."
then I agree with your earlier suggestion that maybe the best approach is
to create another service for those devices.

I originally wrote a big long idea about how to make the above work,
> but got to the end, and realized that I'm still trying to understand
> what we're trying to avoid here with the downstream/upstream lists
> thing.  It's easy enough to patch the existing list to add your new
> custom types, then when it comes time to merge because the
> project/component is public, the patch is ready and good to upstream.
> What are we buying by moving that info to a non-patch format?

You get the benefit of separating devices into two classes..
(1) types that are upstream , have been tested by someone else and they are
ready to go without additional work.
(2) types that are not upstream, because the devices are not public yet or
may never be public and need to be kept downstream for a long period of
time (or forever).

> I think
> moving it to a file means it's a lot less likely to be upstreamed, as
> it requires the next person to understand it to use it, and modify the
> patch rather than simply cleaning up the commit message, testing it,
> and firing it at gerrit.

Yes, the file would be for those things that are never meant to be
upstreamed or won't be upstreamed for a long while.

> Having done this pattern many times
> (including with that list specifically) I think the only thing we
> could improve would be to move that list to its own file (but still
> C++ code), so it gets fewer merge conflicts, and you can completely
> replace it if you like, but even that doesn't solve the problem if
> code is never upstreamed.

Yup, the problem here are the following
"I have patches I keep downstream and they keep getting broken whenever the
types/device list gets updated. I wish these data structures were in a file
that doesn't get patched often"
and
"I have patches to add devices to the type/list data structure and I can't
upstream them for a long time (or ever). I don't want to waste time
constantly fixing my broken patches everytime someone adds a new public
supported type."
Both approaches (parsing json and extending the list runtime and separating
the data structs into a separate file + returning the union of base +
extended) accomplish the same thing. One requires a recipe to copy a
ExtendPSUSensorConfig.json in a recipe somewhere to usr/share/PSUSensors
(or something) and the other is just a patch that gets applied. Talking it
through, I now realize that the slight code refactoring approach is a lot
less work and a lot more simple..and something that I'd actually have time
to contribute.


Have you filed a bug, or asked on the mailing list before now?  This
> is the kind of feedback the authors of that sensor need (Ideally
> before you move over to another subsystem like hwmontemp).

I never really considered hwmontemp a different sub-system since they live
in the same repo and seemed to be more specific towards monitoring
temperature telemetry.
As far as bugs go, I CC'ed Alex Qiu who has more experience with the
performance of PSUSensors. I haven't personally ran into this problem; just
know about it from talk amongst the larger team.

> If I
> didn't see your message/bug and you did post it, I apologize, I'm not
> trying to call you out.
> If you have specifics, like the value of N, and the details around
> what chips you're interacting with and whatever debugging you've done,
> it would be helpful to put that in a bug for triage.
>
Alex, maybe you can add some color here?

> Keep in mind, PSUSensor by default has a 1 second scan rate.
>
> https://github.com/openbmc/dbus-sensors/blob/41061e2c3198c0f597d4f6bb702b690a273ab45d/include/PSUSensor.hpp#L38
> If it's not obeying that, clearly there's a bug to fix somewhere.
> On some platforms, I have seen very high rate polling of power values
> on the PSU I2c bus by other devices, and that tends to hold up
> transactions for other components.  If that bus is misbehaving or
> overloaded on your platform, it might have triggered a weird condition
> within the PSU sensor (like the scans taking longer than the scan
> rate).
> If you have any more details here, it's quite possible someone will
> have an idea where to look, or know exactly where the problem is.

--000000000000448d1e05ac4ff8a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0do=
n&#39;t like the merging of base lists with extended lists, as it adds<br>a=
 dependency between how we represent that, and implies that we have a<br>pu=
blished plugin interface, which we definitely don&#39;t, nor do we want<br>=
to maintain it at the entity manager level.=C2=A0 It also means that<br>ups=
tream never tests the &quot;extended&quot; list, which means it&#39;s a lot=
 more<br>likely to break.<br></blockquote><div>My stance on devices added t=
o the extended list is the same as devices added by downstream patches. Ups=
tream maintainers aren&#39;t responsible for testing those, if you&#39;re p=
atching in devices then you take the responsibility of testing those.</div>=
<div>My objective is to make it so devices that we don&#39;t want to upstre=
am yet can be maintained more easily.</div><div>First idea was a json file =
that extends types/lists but there are concerns with runtime parsing for de=
vices for the purposes of exposing telemetry (I&#39;d think runtime parsing=
 of things like PID configurations would be more worrisome).</div><div>So s=
econd idea was just to move data structures around in dbus-sensors/PSUSenso=
r to make upstream changes less likely to result in merge conflicts for tho=
se who are maintaining downstream patches. Furthermore just split the data =
structure up into a portion that is upstream and downstream.<br>Yes, it&#39=
;s definitely making it friendlier for those who want to maintain downstrea=
m patches to extend devices. I don&#39;t see how this increases maintenance=
 or testing burden for the maintainers though.=C2=A0<br>If however , the in=
tent is to explicitly send the message=C2=A0<br>&quot;You shouldn&#39;t try=
 to use this service for any devices that do not have explicit upstream sup=
port. Any patches that make it easier to do so will be rejected.&quot;</div=
><div>then I agree with your earlier suggestion that maybe the best approac=
h is to create another service for those devices.</div><div><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">I originally wrote a big long =
idea about how to make the above work,<br>but got to the end, and realized =
that I&#39;m still trying to understand<br>what we&#39;re trying to avoid h=
ere with the downstream/upstream lists<br>thing.=C2=A0 It&#39;s easy enough=
 to patch the existing list to add your new<br>custom types, then when it c=
omes time to merge because the<br>project/component is public, the patch is=
 ready and good to upstream.<br>What are we buying by moving that info to a=
 non-patch format?=C2=A0</blockquote><div>You get the benefit of separating=
 devices into two classes.. <br>(1) types that are upstream , have been tes=
ted by someone else and they are ready to go without additional work.=C2=A0=
<br>(2) types that are not upstream, because the devices are not public yet=
 or may never be public and need to be kept downstream for a long period of=
 time (or forever).</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
 I think<br>moving it to a file means it&#39;s a lot less likely to be upst=
reamed, as<br>it requires the next person to understand it to use it, and m=
odify the<br>patch rather than simply cleaning up the commit message, testi=
ng it,<br>and firing it at gerrit.=C2=A0</blockquote><div>Yes, the file wou=
ld be for those things that are never meant to be upstreamed or won&#39;t b=
e upstreamed for a long while.=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"> Having done this pattern many times<br>(including with th=
at list specifically) I think the only thing we<br>could improve would be t=
o move that list to its own file (but still<br>C++ code), so it gets fewer =
merge conflicts, and you can completely<br>replace it if you like, but even=
 that doesn&#39;t solve the problem if<br>code is never upstreamed.=C2=A0=
=C2=A0</blockquote><div>Yup, the problem here are the following</div><div>&=
quot;I have patches I keep downstream and they keep getting broken whenever=
 the types/device list gets updated. I wish these data structures were in a=
 file that doesn&#39;t get patched often&quot;</div><div>and</div><div>&quo=
t;I have patches to add devices to the type/list data structure and I can&#=
39;t upstream them for a long time (or ever). I don&#39;t want to waste tim=
e constantly fixing my broken patches everytime someone adds a new public s=
upported type.&quot;</div><div>Both approaches (parsing json and extending =
the list runtime and separating the data structs into a separate file=C2=A0=
+ returning the union of base=C2=A0+ extended) accomplish the same thing. O=
ne requires a recipe to copy a ExtendPSUSensorConfig.json in a recipe somew=
here to usr/share/PSUSensors (or something) and the other is just a patch t=
hat gets applied. Talking it through, I now realize that the slight code re=
factoring approach is a lot less work and a lot more simple..and something =
that I&#39;d actually have time to contribute.</div><div><br></div><div><br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Have you filed a b=
ug, or asked on the mailing list before now?=C2=A0 This<br>is the kind of f=
eedback the authors of that sensor need (Ideally<br>before you move over to=
 another subsystem like hwmontemp).=C2=A0 </blockquote><div>I never really =
considered hwmontemp=C2=A0a different sub-system since they live in the sam=
e repo and seemed to be more specific towards monitoring temperature teleme=
try.</div><div>As far as bugs go, I CC&#39;ed Alex Qiu who has more experie=
nce with the performance of PSUSensors. I haven&#39;t personally ran into t=
his problem; just know about it from talk amongst the larger team.=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">If I<br>didn&#39;t see=
 your message/bug and you did post it, I apologize, I&#39;m not<br>trying t=
o call you out.<br>If you have specifics, like the value of N, and the deta=
ils around<br>what chips you&#39;re interacting with and whatever debugging=
 you&#39;ve done,<br>it would be helpful to put that in a bug for triage.<b=
r></blockquote><div>Alex, maybe you can add some color here?=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Keep in mind, PSUSensor by d=
efault has a 1 second scan rate.<br><a href=3D"https://github.com/openbmc/d=
bus-sensors/blob/41061e2c3198c0f597d4f6bb702b690a273ab45d/include/PSUSensor=
.hpp#L38" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/d=
bus-sensors/blob/41061e2c3198c0f597d4f6bb702b690a273ab45d/include/PSUSensor=
.hpp#L38</a><br>If it&#39;s not obeying that, clearly there&#39;s a bug to =
fix somewhere.<br>On some platforms, I have seen very high rate polling of =
power values<br>on the PSU I2c bus by other devices, and that tends to hold=
 up<br>transactions for other components.=C2=A0 If that bus is misbehaving =
or<br>overloaded on your platform, it might have triggered a weird conditio=
n<br>within the PSU sensor (like the scans taking longer than the scan<br>r=
ate).<br>If you have any more details here, it&#39;s quite possible someone=
 will<br>have an idea where to look, or know exactly where the problem is.<=
/blockquote><div><br></div></div>

--000000000000448d1e05ac4ff8a1--
