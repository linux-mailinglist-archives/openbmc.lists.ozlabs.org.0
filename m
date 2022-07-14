Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7955740A6
	for <lists+openbmc@lfdr.de>; Thu, 14 Jul 2022 02:50:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LjwrW5pDnz3brl
	for <lists+openbmc@lfdr.de>; Thu, 14 Jul 2022 10:50:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Lg0feDlB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=nanzhou@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Lg0feDlB;
	dkim-atps=neutral
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ljwr52FDZz3bwr
	for <openbmc@lists.ozlabs.org>; Thu, 14 Jul 2022 10:49:56 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id j22so692435ejs.2
        for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2022 17:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3plEp34raKxzkDvY1r/aP0nOhv+ngiXU+X7Y96Salfk=;
        b=Lg0feDlBoaIKH5Y5hGVQCVHDX/OUf5XFpYq3x9zq3EAz8MN3E2doM9Mqn0YlPOlIEE
         syM7ZQdpHSWMwQ91pno3bRbD1ljsBb7bcwvO9cZs83Z+xexx/9duXUyZc0a1GasEPkvs
         eCkV/ZbqO7QWtFkX4QyA4HBEspc1hv+L2YyxlhVBluxzyyTsaPxKGenh5kWS8/V4p9er
         ktSX+2DAtEqruqo810ktku8a1Kw66ylITZ5d25A53Yxd8l06za8Y//iTmYnLqidhVl0R
         BkMY7MWq001xeSZF9UmHtLXpYPx/n/m9dde5iZbZP37px9PGK3ONRInY6dtDtxq0Hsk/
         236Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3plEp34raKxzkDvY1r/aP0nOhv+ngiXU+X7Y96Salfk=;
        b=CePOix3aMLo9g3RZfqpF/aCUyce+ykz3+RVT7nleK7ElonkGtcGXwAz4SAfT6nnghK
         Afk/mmos4mJxxe6wMF10li+7NomimaiUCptc5P13p9xEVxON8v01teTJJh8BFKgDJ6YJ
         /ykjSBvXqalwlCFuBa5xRplY84VDaVmOpp83i0UtMfEeMdw9kXKNjH1gBlztw2VFw6Fb
         wJtGq2rs7Ms3AQBrz4SIatNEbehyXB9PVoraW9YpyYBoRCMpb175kSjHtAbz0QUOXMpn
         g+lWSYWH/xzBKOMqoDrnYOpJlmptp0g4fWnw5+Kcl7qx/IAXD0h9E6x4rRK8WOWC924/
         FWIA==
X-Gm-Message-State: AJIora/+HNh2ah404fKQkCS4vDRJgElnokTSEx6m7rp8QWZzuhSS79oP
	8R2hLvDAz42Bx5XyzGShbXr8mlTQ92ug9WXc4bOSeQ==
X-Google-Smtp-Source: AGRyM1txxavEHOXBWLQWEYiwQ9cOHx71QJdumlzo5+nZHXgMQXLsQmYvcjXUusiBxHq5j8S6Xc37zZ/50tlLLYHtIzE=
X-Received: by 2002:a17:907:60cc:b0:72b:40a8:a5b with SMTP id
 hv12-20020a17090760cc00b0072b40a80a5bmr5909488ejc.379.1657759787248; Wed, 13
 Jul 2022 17:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2-KxBmFwVmF4cr+_eTFrwdz9-he--PPfRvW=cN6oNGf4KA_A@mail.gmail.com>
 <Ys6riEnZm5SP8v76@heinlein.stwcx.org.github.beta.tailscale.net> <CAH2-KxBYyg240d48oNRbhNyRK+JkdWrzOcjrxs2JU959=NGP+A@mail.gmail.com>
In-Reply-To: <CAH2-KxBYyg240d48oNRbhNyRK+JkdWrzOcjrxs2JU959=NGP+A@mail.gmail.com>
From: Nan Zhou <nanzhou@google.com>
Date: Wed, 13 Jul 2022 17:49:36 -0700
Message-ID: <CAOLfGj4fje3YBb+RTwXOPEpcNVf4O9bZ4CZhpe=Ai=J8baSf_Q@mail.gmail.com>
Subject: Re: DBus ObjectManager Interface usages within the project
To: Ed Tanous <edtanous@google.com>
Content-Type: multipart/alternative; boundary="0000000000003ebee305e3b94750"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000003ebee305e3b94750
Content-Type: text/plain; charset="UTF-8"

>
> I don't think "OM is optional" is really a true statement.  It is
> optional from a dbus perspective, true, but practically speaking all of
> our daemons have it (just at an inconsistent location).  One of the
> primary features of the object manager is to emit the signals for
> managed objects, such as PropertiesChanged.  If you don't have an object
> manager you don't get those signals.  We have to have that on Sensors,
> at least, and I'm pretty sure everyone adds them for Inventory as well.


As you're seeing, there are typically two behaviors of implementation:


1. Anything using ASIO places OM at the root by default.
> 2. Anything using PDI-bindings places the OM at the lowest common part
>    in their hierarchy.  (Something like /xyz/openbmc_project/sensors or
>    /xyz/openbmc_project typically).


Is this documented somewhere formally so that when people ask or question
about it, we can have a pointer.

If not, is PDI a good place to place this requirement?

On Wed, Jul 13, 2022 at 7:36 AM Ed Tanous <edtanous@google.com> wrote:

> On Wed, Jul 13, 2022 at 4:24 AM Patrick Williams <patrick@stwcx.xyz>
> wrote:
> >
> > On Tue, Jul 12, 2022 at 11:48:31AM -0700, Ed Tanous wrote:
> > > We've had a couple cases in the project where patches have needed to be
> > > slowed down because of inconsistencies in our use of object manager, so
> > > IMO, the time has come to make our usage of ObjectManager consistent,
> > > documented, and drop support for the (not upstream) daemons that don't
> > > follow the rules.  As part of this, we will port forward all the
> upstream
> > > daemons to be consistent, and do our best to avoid bugs, but this
> email is
> > > intended to inform those that have non-upstream daemons about the
> change so
> > > they can resolve their implementations.
> >
> > There isn't much in the dbus spec that puts requirements on where the
> > object manager is, but that certainly doesn't mean we can't add our own
> > design requirements on top of it.  Thanks for starting this.
> >
> > > The basics:
> > > ObjectManager DBus interface will now be required for any daemon
> > > implementing a Sensor.Value interface or Inventory.Item interface.
> > >
> > > Daemons producing sensors will be required to place their
> ObjectManager at
> > > /xyz/openbmc_project/sensors
> > > Daemons producing inventory items will be required to place their
> > > ObjectManager at /xyz/openbmc_project/inventory.
> > >
> > > Both of these interfaces will be required to be published before
> claiming a
> > > well known name on dbus, to allow for the possibility of caching
> > > implementations at some point in future.
> >
> > This means we can end up having N object managers in a single daemon if
> > it is hosting multiple namespaces?  Why not just host it at
> > /xyz/openbmc_project?
>
> Because rarely is the question being asked "What are all the openbmc
> interfaces and values for those interfaces that this application
> supports".  Usually the question is more specific, like "What sensors
> does this application support".  If we had to get all the inventory
> items, nics, and other stuff at the same time that we got all the
> sensors, it would make the responses larger.
>
> >
> > > This was discussed pretty heavily on discord in the #development
> topic, and
> > > some of the nitty gritty details on why this is needed is available
> there,
> > > as well as I'm happy to discuss here.  This is one of those nasty
> > > spaghetti-code things that we've lived with for a while;  Hopefully if
> we
> > > can get this behind us, we can get some good real world performance
> > > improvements.
> >
> > I see the background being discussed when I read through the history on
> > #development, but I don't see the rationale on why this was chosen.  I
> see one
> > comment that placing the OM at / is "wrong" but I don't see any
> justification.
> > Why is ".../sensors" right but "/" or "/xyz/openbmc_project" is not?
>
> GetManagedObjects doesn't have a way to filter down further, and for
> daemons that might return both, it's advantageous to be able to filter
> down more and not return every interface in one response.
>
> >
> > We had a good chunk of this discussion about 6 months back in
> > phosphor-virtual-sensors where some Redfish code was broken against that
> > daemon because it _was_ using "/xyz/openbmc_project/sensors" and there
> > was a patch to move it to "/" which ended up getting merged.
>
> Yep, this is essentially the continuation of that discussion.
>
> > Fundamentally, I think it boiled down to neither being in opposition to
> > the standard and there was a bunch of code that already implied "/" so
> > it was the simplest way forward to achieve compatibility.
> >
> > >
> > > Thoughts?
> >
> > I do think that moving the OM lower in the hierarchy is probably better
> > because it allows us to have parts of the hierarchy which do not emit
> > signals, where having it on "/" does not.  I'm just trying to understand
> > (and hopefully document more) the rationale on why this choice was made.
>
> Sounds good.
>
> >
> > --
> > Patrick Williams
>

--0000000000003ebee305e3b94750
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I don&#3=
9;t think &quot;OM is optional&quot; is really a true statement.=C2=A0 It i=
s<br>optional from a dbus perspective, true, but practically speaking all o=
f<br>our daemons have it (just at an inconsistent location).=C2=A0 One of t=
he<br>primary features of the object manager is to emit the signals for<br>=
managed objects, such as PropertiesChanged.=C2=A0 If you don&#39;t have an =
object<br>manager you don&#39;t get those signals.=C2=A0 We have to have th=
at on Sensors,<br>at least, and I&#39;m pretty sure everyone adds them for =
Inventory as well.</blockquote><br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">As you&#39;re seeing, there are typically two behaviors of imple=
mentation:</blockquote><br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">1. Anything using ASIO places OM at the root by default.<br>2. Anything u=
sing PDI-bindings places the OM at the lowest common part<br>=C2=A0 =C2=A0i=
n their hierarchy.=C2=A0 (Something like /xyz/openbmc_project/sensors or<br=
>=C2=A0 =C2=A0/xyz/openbmc_project typically).</blockquote><div><br></div><=
div>Is this documented somewhere formally so that when people ask or questi=
on about it, we can have a pointer.</div><div><br></div><div>If not, is PDI=
 a good place to place this requirement?</div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 13, 2022 at 7:36 =
AM Ed Tanous &lt;<a href=3D"mailto:edtanous@google.com">edtanous@google.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On Wed, Jul 13, 2022 at 4:24 AM Patrick Williams &lt;<a href=3D"mailto:patr=
ick@stwcx.xyz" target=3D"_blank">patrick@stwcx.xyz</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, Jul 12, 2022 at 11:48:31AM -0700, Ed Tanous wrote:<br>
&gt; &gt; We&#39;ve had a couple cases in the project where patches have ne=
eded to be<br>
&gt; &gt; slowed down because of inconsistencies in our use of object manag=
er, so<br>
&gt; &gt; IMO, the time has come to make our usage of ObjectManager consist=
ent,<br>
&gt; &gt; documented, and drop support for the (not upstream) daemons that =
don&#39;t<br>
&gt; &gt; follow the rules.=C2=A0 As part of this, we will port forward all=
 the upstream<br>
&gt; &gt; daemons to be consistent, and do our best to avoid bugs, but this=
 email is<br>
&gt; &gt; intended to inform those that have non-upstream daemons about the=
 change so<br>
&gt; &gt; they can resolve their implementations.<br>
&gt;<br>
&gt; There isn&#39;t much in the dbus spec that puts requirements on where =
the<br>
&gt; object manager is, but that certainly doesn&#39;t mean we can&#39;t ad=
d our own<br>
&gt; design requirements on top of it.=C2=A0 Thanks for starting this.<br>
&gt;<br>
&gt; &gt; The basics:<br>
&gt; &gt; ObjectManager DBus interface will now be required for any daemon<=
br>
&gt; &gt; implementing a Sensor.Value interface or Inventory.Item interface=
.<br>
&gt; &gt;<br>
&gt; &gt; Daemons producing sensors will be required to place their ObjectM=
anager at<br>
&gt; &gt; /xyz/openbmc_project/sensors<br>
&gt; &gt; Daemons producing inventory items will be required to place their=
<br>
&gt; &gt; ObjectManager at /xyz/openbmc_project/inventory.<br>
&gt; &gt;<br>
&gt; &gt; Both of these interfaces will be required to be published before =
claiming a<br>
&gt; &gt; well known name on dbus, to allow for the possibility of caching<=
br>
&gt; &gt; implementations at some point in future.<br>
&gt;<br>
&gt; This means we can end up having N object managers in a single daemon i=
f<br>
&gt; it is hosting multiple namespaces?=C2=A0 Why not just host it at<br>
&gt; /xyz/openbmc_project?<br>
<br>
Because rarely is the question being asked &quot;What are all the openbmc<b=
r>
interfaces and values for those interfaces that this application<br>
supports&quot;.=C2=A0 Usually the question is more specific, like &quot;Wha=
t sensors<br>
does this application support&quot;.=C2=A0 If we had to get all the invento=
ry<br>
items, nics, and other stuff at the same time that we got all the<br>
sensors, it would make the responses larger.<br>
<br>
&gt;<br>
&gt; &gt; This was discussed pretty heavily on discord in the #development =
topic, and<br>
&gt; &gt; some of the nitty gritty details on why this is needed is availab=
le there,<br>
&gt; &gt; as well as I&#39;m happy to discuss here.=C2=A0 This is one of th=
ose nasty<br>
&gt; &gt; spaghetti-code things that we&#39;ve lived with for a while;=C2=
=A0 Hopefully if we<br>
&gt; &gt; can get this behind us, we can get some good real world performan=
ce<br>
&gt; &gt; improvements.<br>
&gt;<br>
&gt; I see the background being discussed when I read through the history o=
n<br>
&gt; #development, but I don&#39;t see the rationale on why this was chosen=
.=C2=A0 I see one<br>
&gt; comment that placing the OM at / is &quot;wrong&quot; but I don&#39;t =
see any justification.<br>
&gt; Why is &quot;.../sensors&quot; right but &quot;/&quot; or &quot;/xyz/o=
penbmc_project&quot; is not?<br>
<br>
GetManagedObjects doesn&#39;t have a way to filter down further, and for<br=
>
daemons that might return both, it&#39;s advantageous to be able to filter<=
br>
down more and not return every interface in one response.<br>
<br>
&gt;<br>
&gt; We had a good chunk of this discussion about 6 months back in<br>
&gt; phosphor-virtual-sensors where some Redfish code was broken against th=
at<br>
&gt; daemon because it _was_ using &quot;/xyz/openbmc_project/sensors&quot;=
 and there<br>
&gt; was a patch to move it to &quot;/&quot; which ended up getting merged.=
<br>
<br>
Yep, this is essentially the continuation of that discussion.<br>
<br>
&gt; Fundamentally, I think it boiled down to neither being in opposition t=
o<br>
&gt; the standard and there was a bunch of code that already implied &quot;=
/&quot; so<br>
&gt; it was the simplest way forward to achieve compatibility.<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Thoughts?<br>
&gt;<br>
&gt; I do think that moving the OM lower in the hierarchy is probably bette=
r<br>
&gt; because it allows us to have parts of the hierarchy which do not emit<=
br>
&gt; signals, where having it on &quot;/&quot; does not.=C2=A0 I&#39;m just=
 trying to understand<br>
&gt; (and hopefully document more) the rationale on why this choice was mad=
e.<br>
<br>
Sounds good.<br>
<br>
&gt;<br>
&gt; --<br>
&gt; Patrick Williams<br>
</blockquote></div>

--0000000000003ebee305e3b94750--
