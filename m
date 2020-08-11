Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E21424140A
	for <lists+openbmc@lfdr.de>; Tue, 11 Aug 2020 02:10:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQY9z1f3YzDqQS
	for <lists+openbmc@lfdr.de>; Tue, 11 Aug 2020 10:09:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::32e;
 helo=mail-ot1-x32e.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=NWl9rrN2; dkim-atps=neutral
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQY9207rlzDqJ8
 for <openbmc@lists.ozlabs.org>; Tue, 11 Aug 2020 10:09:08 +1000 (AEST)
Received: by mail-ot1-x32e.google.com with SMTP id h16so8778278oti.7
 for <openbmc@lists.ozlabs.org>; Mon, 10 Aug 2020 17:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LjC5WuUPBtZZkT7BW0yE/07GeTcLXIkYnzE2wviDrTs=;
 b=NWl9rrN2QpnHxOwdbL6Sy6wSCMSr+FbBCgjWLMlaE26S78PO4GjGOdOLZrat4C1W24
 3YtaP4cdE5iMFTaid2Dm+t4V3KKC1KYnG/MHttsq9290/Qn/quBWL2hviLhQLGxVhVnf
 iBBUfWpi02SO+lmHg/DwPIv7QTcsAdjbJx62ujOJIntsdSCONsRaYFGEspE5tVNEIlSB
 3/hZVWDHNnWtx6ZrDuRu4fyZrGPqp37TdnCqLr4sHkKtqkxV1qJSiVEVRJspFJ5Br+Dl
 3IA53gOd5iKcWZrotxTQaYKYN2vabhdMGRJIfTbwD8W7jFiK3Tg1eHA2WllFSDU/Mg6R
 aT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LjC5WuUPBtZZkT7BW0yE/07GeTcLXIkYnzE2wviDrTs=;
 b=CmXot8fgAlz1FLN+aHM1iZugWGOPA1MmQAEbkcL/oFdmYJ4JQEt3Mxwlrm5UIveXY+
 sl9zdlDLWJDDZA3jFRUfSHqj1lWacfyMzDYH2i8hWIbGShmAX4mwx7WDNdyv9mjXDS+L
 liv00354osmjLemjDW/3k644BLdZUVue9pHaB7TfH0gB2jJs1AxOTi7cLA1kvnrv5ySp
 J9rP6XqdGbtpr/bsHfmzei/vytJ/4FMw+H8a1Fsx7Le6m3QGcsrx3+OCJjiYNTWvkLdf
 QmYJxsXVqp9b4XIvgiNiYqdXG93i1e9XYagJ84K+Bai1vrPQIW7TJi82d0PRvU08eQKg
 EGQQ==
X-Gm-Message-State: AOAM531wM1lM/TJNNNwQkM6jMqAElSJMqpKHXfZ/B0I4MUPkpva+Q74i
 evgHkn7XeGAfG2zPS7gd1Viwfd9eLPSzFfaaYeTZJg==
X-Google-Smtp-Source: ABdhPJwpCfZ42wzKwQPL1NpsM1aJQsubTEEbUOcVa+sVusViNuj47aOQDfF/ZMBVodRsYayPCP6/aeaPD/5FEI5HWUg=
X-Received: by 2002:a05:6830:22e2:: with SMTP id
 t2mr2760797otc.274.1597104544705; 
 Mon, 10 Aug 2020 17:09:04 -0700 (PDT)
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
 <CAHBbfcUBBUpO9o2pNSbr0YKXNRHPju4gNNHxxNxuda9k5D0BYQ@mail.gmail.com>
 <CACWQX809R7wx+qNt5PhZW-Snv0jdPnUVGSt+A_jobrTcYC8B2Q@mail.gmail.com>
In-Reply-To: <CACWQX809R7wx+qNt5PhZW-Snv0jdPnUVGSt+A_jobrTcYC8B2Q@mail.gmail.com>
From: Alex Qiu <xqiu@google.com>
Date: Mon, 10 Aug 2020 17:08:53 -0700
Message-ID: <CAA_a9xJhKikZR0rhZWfVfKF1VKMkP1yUkRJxhWSC37JA-2h7sA@mail.gmail.com>
Subject: Re: dbus-sensors:hwmontemp: additional attribute proposal
To: Ed Tanous <ed@tanous.net>, James Feist <james.feist@linux.intel.com>
Content-Type: multipart/alternative; boundary="0000000000000f0cee05ac8ee17c"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jason Ling <jasonling@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000000f0cee05ac8ee17c
Content-Type: text/plain; charset="UTF-8"

Hi Ed and James,

Is it acceptable for a device to be listed in both HwmonTempSensor and
PSUSensor?

- Alex Qiu


On Fri, Aug 7, 2020 at 2:53 PM Ed Tanous <ed@tanous.net> wrote:

> On Fri, Aug 7, 2020 at 2:05 PM Jason Ling <jasonling@google.com> wrote:
> >>
> >>  don't like the merging of base lists with extended lists, as it adds
> >> a dependency between how we represent that, and implies that we have a
> >> published plugin interface, which we definitely don't, nor do we want
> >> to maintain it at the entity manager level.  It also means that
> >> upstream never tests the "extended" list, which means it's a lot more
> >> likely to break.
> >
> > My stance on devices added to the extended list is the same as devices
> added by downstream patches. Upstream maintainers aren't responsible for
> testing those, if you're patching in devices then you take the
> responsibility of testing those.
>
> Sure, but upstream does bear the responsibility for testing that this
> "extended types" system works?
>
> > My objective is to make it so devices that we don't want to upstream yet
> can be maintained more easily.
>
> Ever?  To be frank for a moment, you're going to have a hard time
> pushing that one forward in an open source project.  If there are a
> lot of users that are planning on maintaining private forks forever,
> maybe there's a case for this, but I think most uses of private forks
> tends to be temporary, even if it's longer term, and the long term
> intention is to upstream.
>
> > First idea was a json file that extends types/lists but there are
> concerns with runtime parsing for devices for the purposes of exposing
> telemetry (I'd think runtime parsing of things like PID configurations
> would be more worrisome).
> > So second idea was just to move data structures around in
> dbus-sensors/PSUSensor to make upstream changes less likely to result in
> merge conflicts for those who are maintaining downstream patches.
> Furthermore just split the data structure up into a portion that is
> upstream and downstream.
> > Yes, it's definitely making it friendlier for those who want to maintain
> downstream patches to extend devices. I don't see how this increases
> maintenance or testing burden for the maintainers though.
>
> It increases burden because any time the maintainer wants to change
> the name of that file, change the name of the structure in that file,
> add a field, rename fields, or change compiler flags, that file will
> break in your downstream, and the maintainers will have no idea.  It
> definitely increases the maintenance burden, and all of the things
> I've mentioned and more have happened over the short life of entity
> manager.  I'm sure they will continue to happen as they evolve (or
> until EM is replaced by something better).
>
> > If however , the intent is to explicitly send the message
> > "You shouldn't try to use this service for any devices that do not have
> explicit upstream support. Any patches that make it easier to do so will be
> rejected."
> > then I agree with your earlier suggestion that maybe the best approach
> is to create another service for those devices.
>
> I'm not the maintainer of this project anymore, so my opinion is just
> that, and I have no ability to reject patches :)  I would rephrase my
> position as: Modifying the source code directly is not an adequate
> long term API for making permanent, never to be upstreamed changes.
> The closest guarantee to that kind of API that is dbus, the second
> closest is an Entity manager config, each of which have their own pros
> and cons.  If we as a project can do anything to make the transition
> between downstream code to upstream code easier, like trying to make
> merge conflicts less likely on commonly modified files, without the
> expense of maintainability or complexity, I'm absolutely for it, but
> creating explicit data structures and hard guarantees about downstream
> code on a binary boundary needs a much larger discussion, and speaks
> to some of the project's main principles about the "Open" part of
> OpenBMC.
>
> >
> >> I originally wrote a big long idea about how to make the above work,
> >> but got to the end, and realized that I'm still trying to understand
> >> what we're trying to avoid here with the downstream/upstream lists
> >> thing.  It's easy enough to patch the existing list to add your new
> >> custom types, then when it comes time to merge because the
> >> project/component is public, the patch is ready and good to upstream.
> >> What are we buying by moving that info to a non-patch format?
> >
> > You get the benefit of separating devices into two classes..
> > (1) types that are upstream , have been tested by someone else and they
> are ready to go without additional work.
> > (2) types that are not upstream, because the devices are not public yet
> or may never be public and need to be kept downstream for a long period of
> time (or forever).
>
> Don't you already have that distinction today?  Devices that are in
> your downstream patch fall into category 2, devices that are on
> openbmc master fall into category 1.  Maybe I'm missing something?
>
> >>
> >> I think
> >> moving it to a file means it's a lot less likely to be upstreamed, as
> >> it requires the next person to understand it to use it, and modify the
> >> patch rather than simply cleaning up the commit message, testing it,
> >> and firing it at gerrit.
> >
> > Yes, the file would be for those things that are never meant to be
> upstreamed or won't be upstreamed for a long while.
>
> See above.
>
> >>
> >> Having done this pattern many times
> >> (including with that list specifically) I think the only thing we
> >> could improve would be to move that list to its own file (but still
> >> C++ code), so it gets fewer merge conflicts, and you can completely
> >> replace it if you like, but even that doesn't solve the problem if
> >> code is never upstreamed.
> >
> > Yup, the problem here are the following
> > "I have patches I keep downstream and they keep getting broken whenever
> the types/device list gets updated. I wish these data structures were in a
> file that doesn't get patched often"
>
> Moving that structure to its own file sounds totally reasonable,
> although (if I were the maintainer) it would have no guarantees
> granted.  Said file may change name, structure, naming, or compiler
> magic that will cause downstream to break.  Funnily enough, in the act
> of implementing that, you will ironically break a lot of peoples
> downstreams, and I'm personally ok with that.  You (and your team)
> needs to be ok when people break your downstream for similar reasons.
>
> On a personal note, if you haven't already, I highly recommend
> spending some learning time on getting a good setup and mental model
> for merging conflicting patches.  As a useful skill, it comes up
> ridiculously often in software, especially if you're a maintainer.  If
> you have the ability to resolve conflicts quickly and correctly it
> puts you at a significant time advantage to your peers that don't.
>
> > and
> > "I have patches to add devices to the type/list data structure and I
> can't upstream them for a long time (or ever). I don't want to waste time
> constantly fixing my broken patches everytime someone adds a new public
> supported type."
> > Both approaches (parsing json and extending the list runtime and
> separating the data structs into a separate file + returning the union of
> base + extended) accomplish the same thing. One requires a recipe to copy a
> ExtendPSUSensorConfig.json in a recipe somewhere to usr/share/PSUSensors
> (or something) and the other is just a patch that gets applied. Talking it
> through, I now realize that the slight code refactoring approach is a lot
> less work and a lot more simple..and something that I'd actually have time
> to contribute.
>
> EXCELLENT!  Add me to the patch, and I'd be happy to review it for you
> (With that said, James is pretty fast and sometimes beats me to the
> punch).
>
> >
> >
> >> Have you filed a bug, or asked on the mailing list before now?  This
> >> is the kind of feedback the authors of that sensor need (Ideally
> >> before you move over to another subsystem like hwmontemp).
> >
> > I never really considered hwmontemp a different sub-system since they
> live in the same repo and seemed to be more specific towards monitoring
> temperature telemetry.
>
> Ignore the above comment about subsystem.  I thought you were talking
> about phosphor-hwmon.  My bad.
>
> > As far as bugs go, I CC'ed Alex Qiu who has more experience with the
> performance of PSUSensors. I haven't personally ran into this problem; just
> know about it from talk amongst the larger team.
>
> Excellent.  Looking forward to details.
>
> >>
> >> If I
> >> didn't see your message/bug and you did post it, I apologize, I'm not
> >> trying to call you out.
> >> If you have specifics, like the value of N, and the details around
> >> what chips you're interacting with and whatever debugging you've done,
> >> it would be helpful to put that in a bug for triage.
> >
> > Alex, maybe you can add some color here?
> >>
> >> Keep in mind, PSUSensor by default has a 1 second scan rate.
> >>
> https://github.com/openbmc/dbus-sensors/blob/41061e2c3198c0f597d4f6bb702b690a273ab45d/include/PSUSensor.hpp#L38
> >> If it's not obeying that, clearly there's a bug to fix somewhere.
> >> On some platforms, I have seen very high rate polling of power values
> >> on the PSU I2c bus by other devices, and that tends to hold up
> >> transactions for other components.  If that bus is misbehaving or
> >> overloaded on your platform, it might have triggered a weird condition
> >> within the PSU sensor (like the scans taking longer than the scan
> >> rate).
> >> If you have any more details here, it's quite possible someone will
> >> have an idea where to look, or know exactly where the problem is.
> >
> >
>

--0000000000000f0cee05ac8ee17c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Ed=C2=A0and James,</div><div><br></div><div>Is it =
acceptable for a device to be listed in both HwmonTempSensor and PSUSensor?=
</div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" dat=
a-smartmail=3D"gmail_signature"><div dir=3D"ltr">- Alex Qiu</div></div></di=
v><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Fri, Aug 7, 2020 at 2:53 PM Ed Tanous &lt;<a href=3D"mailto:ed@tan=
ous.net">ed@tanous.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On Fri, Aug 7, 2020 at 2:05 PM Jason Ling &lt;<a href=
=3D"mailto:jasonling@google.com" target=3D"_blank">jasonling@google.com</a>=
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 don&#39;t like the merging of base lists with extended lists=
, as it adds<br>
&gt;&gt; a dependency between how we represent that, and implies that we ha=
ve a<br>
&gt;&gt; published plugin interface, which we definitely don&#39;t, nor do =
we want<br>
&gt;&gt; to maintain it at the entity manager level.=C2=A0 It also means th=
at<br>
&gt;&gt; upstream never tests the &quot;extended&quot; list, which means it=
&#39;s a lot more<br>
&gt;&gt; likely to break.<br>
&gt;<br>
&gt; My stance on devices added to the extended list is the same as devices=
 added by downstream patches. Upstream maintainers aren&#39;t responsible f=
or testing those, if you&#39;re patching in devices then you take the respo=
nsibility of testing those.<br>
<br>
Sure, but upstream does bear the responsibility for testing that this<br>
&quot;extended types&quot; system works?<br>
<br>
&gt; My objective is to make it so devices that we don&#39;t want to upstre=
am yet can be maintained more easily.<br>
<br>
Ever?=C2=A0 To be frank for a moment, you&#39;re going to have a hard time<=
br>
pushing that one forward in an open source project.=C2=A0 If there are a<br=
>
lot of users that are planning on maintaining private forks forever,<br>
maybe there&#39;s a case for this, but I think most uses of private forks<b=
r>
tends to be temporary, even if it&#39;s longer term, and the long term<br>
intention is to upstream.<br>
<br>
&gt; First idea was a json file that extends types/lists but there are conc=
erns with runtime parsing for devices for the purposes of exposing telemetr=
y (I&#39;d think runtime parsing of things like PID configurations would be=
 more worrisome).<br>
&gt; So second idea was just to move data structures around in dbus-sensors=
/PSUSensor to make upstream changes less likely to result in merge conflict=
s for those who are maintaining downstream patches. Furthermore just split =
the data structure up into a portion that is upstream and downstream.<br>
&gt; Yes, it&#39;s definitely making it friendlier for those who want to ma=
intain downstream patches to extend devices. I don&#39;t see how this incre=
ases maintenance or testing burden for the maintainers though.<br>
<br>
It increases burden because any time the maintainer wants to change<br>
the name of that file, change the name of the structure in that file,<br>
add a field, rename fields, or change compiler flags, that file will<br>
break in your downstream, and the maintainers will have no idea.=C2=A0 It<b=
r>
definitely increases the maintenance burden, and all of the things<br>
I&#39;ve mentioned and more have happened over the short life of entity<br>
manager.=C2=A0 I&#39;m sure they will continue to happen as they evolve (or=
<br>
until EM is replaced by something better).<br>
<br>
&gt; If however , the intent is to explicitly send the message<br>
&gt; &quot;You shouldn&#39;t try to use this service for any devices that d=
o not have explicit upstream support. Any patches that make it easier to do=
 so will be rejected.&quot;<br>
&gt; then I agree with your earlier suggestion that maybe the best approach=
 is to create another service for those devices.<br>
<br>
I&#39;m not the maintainer of this project anymore, so my opinion is just<b=
r>
that, and I have no ability to reject patches :)=C2=A0 I would rephrase my<=
br>
position as: Modifying the source code directly is not an adequate<br>
long term API for making permanent, never to be upstreamed changes.<br>
The closest guarantee to that kind of API that is dbus, the second<br>
closest is an Entity manager config, each of which have their own pros<br>
and cons.=C2=A0 If we as a project can do anything to make the transition<b=
r>
between downstream code to upstream code easier, like trying to make<br>
merge conflicts less likely on commonly modified files, without the<br>
expense of maintainability or complexity, I&#39;m absolutely for it, but<br=
>
creating explicit data structures and hard guarantees about downstream<br>
code on a binary boundary needs a much larger discussion, and speaks<br>
to some of the project&#39;s main principles about the &quot;Open&quot; par=
t of<br>
OpenBMC.<br>
<br>
&gt;<br>
&gt;&gt; I originally wrote a big long idea about how to make the above wor=
k,<br>
&gt;&gt; but got to the end, and realized that I&#39;m still trying to unde=
rstand<br>
&gt;&gt; what we&#39;re trying to avoid here with the downstream/upstream l=
ists<br>
&gt;&gt; thing.=C2=A0 It&#39;s easy enough to patch the existing list to ad=
d your new<br>
&gt;&gt; custom types, then when it comes time to merge because the<br>
&gt;&gt; project/component is public, the patch is ready and good to upstre=
am.<br>
&gt;&gt; What are we buying by moving that info to a non-patch format?<br>
&gt;<br>
&gt; You get the benefit of separating devices into two classes..<br>
&gt; (1) types that are upstream , have been tested by someone else and the=
y are ready to go without additional work.<br>
&gt; (2) types that are not upstream, because the devices are not public ye=
t or may never be public and need to be kept downstream for a long period o=
f time (or forever).<br>
<br>
Don&#39;t you already have that distinction today?=C2=A0 Devices that are i=
n<br>
your downstream patch fall into category 2, devices that are on<br>
openbmc master fall into category 1.=C2=A0 Maybe I&#39;m missing something?=
<br>
<br>
&gt;&gt;<br>
&gt;&gt; I think<br>
&gt;&gt; moving it to a file means it&#39;s a lot less likely to be upstrea=
med, as<br>
&gt;&gt; it requires the next person to understand it to use it, and modify=
 the<br>
&gt;&gt; patch rather than simply cleaning up the commit message, testing i=
t,<br>
&gt;&gt; and firing it at gerrit.<br>
&gt;<br>
&gt; Yes, the file would be for those things that are never meant to be ups=
treamed or won&#39;t be upstreamed for a long while.<br>
<br>
See above.<br>
<br>
&gt;&gt;<br>
&gt;&gt; Having done this pattern many times<br>
&gt;&gt; (including with that list specifically) I think the only thing we<=
br>
&gt;&gt; could improve would be to move that list to its own file (but stil=
l<br>
&gt;&gt; C++ code), so it gets fewer merge conflicts, and you can completel=
y<br>
&gt;&gt; replace it if you like, but even that doesn&#39;t solve the proble=
m if<br>
&gt;&gt; code is never upstreamed.<br>
&gt;<br>
&gt; Yup, the problem here are the following<br>
&gt; &quot;I have patches I keep downstream and they keep getting broken wh=
enever the types/device list gets updated. I wish these data structures wer=
e in a file that doesn&#39;t get patched often&quot;<br>
<br>
Moving that structure to its own file sounds totally reasonable,<br>
although (if I were the maintainer) it would have no guarantees<br>
granted.=C2=A0 Said file may change name, structure, naming, or compiler<br=
>
magic that will cause downstream to break.=C2=A0 Funnily enough, in the act=
<br>
of implementing that, you will ironically break a lot of peoples<br>
downstreams, and I&#39;m personally ok with that.=C2=A0 You (and your team)=
<br>
needs to be ok when people break your downstream for similar reasons.<br>
<br>
On a personal note, if you haven&#39;t already, I highly recommend<br>
spending some learning time on getting a good setup and mental model<br>
for merging conflicting patches.=C2=A0 As a useful skill, it comes up<br>
ridiculously often in software, especially if you&#39;re a maintainer.=C2=
=A0 If<br>
you have the ability to resolve conflicts quickly and correctly it<br>
puts you at a significant time advantage to your peers that don&#39;t.<br>
<br>
&gt; and<br>
&gt; &quot;I have patches to add devices to the type/list data structure an=
d I can&#39;t upstream them for a long time (or ever). I don&#39;t want to =
waste time constantly fixing my broken patches everytime someone adds a new=
 public supported type.&quot;<br>
&gt; Both approaches (parsing json and extending the list runtime and separ=
ating the data structs into a separate file + returning the union of base +=
 extended) accomplish the same thing. One requires a recipe to copy a Exten=
dPSUSensorConfig.json in a recipe somewhere to usr/share/PSUSensors (or som=
ething) and the other is just a patch that gets applied. Talking it through=
, I now realize that the slight code refactoring approach is a lot less wor=
k and a lot more simple..and something that I&#39;d actually have time to c=
ontribute.<br>
<br>
EXCELLENT!=C2=A0 Add me to the patch, and I&#39;d be happy to review it for=
 you<br>
(With that said, James is pretty fast and sometimes beats me to the<br>
punch).<br>
<br>
&gt;<br>
&gt;<br>
&gt;&gt; Have you filed a bug, or asked on the mailing list before now?=C2=
=A0 This<br>
&gt;&gt; is the kind of feedback the authors of that sensor need (Ideally<b=
r>
&gt;&gt; before you move over to another subsystem like hwmontemp).<br>
&gt;<br>
&gt; I never really considered hwmontemp a different sub-system since they =
live in the same repo and seemed to be more specific towards monitoring tem=
perature telemetry.<br>
<br>
Ignore the above comment about subsystem.=C2=A0 I thought you were talking<=
br>
about phosphor-hwmon.=C2=A0 My bad.<br>
<br>
&gt; As far as bugs go, I CC&#39;ed Alex Qiu who has more experience with t=
he performance of PSUSensors. I haven&#39;t personally ran into this proble=
m; just know about it from talk amongst the larger team.<br>
<br>
Excellent.=C2=A0 Looking forward to details.<br>
<br>
&gt;&gt;<br>
&gt;&gt; If I<br>
&gt;&gt; didn&#39;t see your message/bug and you did post it, I apologize, =
I&#39;m not<br>
&gt;&gt; trying to call you out.<br>
&gt;&gt; If you have specifics, like the value of N, and the details around=
<br>
&gt;&gt; what chips you&#39;re interacting with and whatever debugging you&=
#39;ve done,<br>
&gt;&gt; it would be helpful to put that in a bug for triage.<br>
&gt;<br>
&gt; Alex, maybe you can add some color here?<br>
&gt;&gt;<br>
&gt;&gt; Keep in mind, PSUSensor by default has a 1 second scan rate.<br>
&gt;&gt; <a href=3D"https://github.com/openbmc/dbus-sensors/blob/41061e2c31=
98c0f597d4f6bb702b690a273ab45d/include/PSUSensor.hpp#L38" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/openbmc/dbus-sensors/blob/41061e2c31=
98c0f597d4f6bb702b690a273ab45d/include/PSUSensor.hpp#L38</a><br>
&gt;&gt; If it&#39;s not obeying that, clearly there&#39;s a bug to fix som=
ewhere.<br>
&gt;&gt; On some platforms, I have seen very high rate polling of power val=
ues<br>
&gt;&gt; on the PSU I2c bus by other devices, and that tends to hold up<br>
&gt;&gt; transactions for other components.=C2=A0 If that bus is misbehavin=
g or<br>
&gt;&gt; overloaded on your platform, it might have triggered a weird condi=
tion<br>
&gt;&gt; within the PSU sensor (like the scans taking longer than the scan<=
br>
&gt;&gt; rate).<br>
&gt;&gt; If you have any more details here, it&#39;s quite possible someone=
 will<br>
&gt;&gt; have an idea where to look, or know exactly where the problem is.<=
br>
&gt;<br>
&gt;<br>
</blockquote></div>

--0000000000000f0cee05ac8ee17c--
