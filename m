Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1CF117C74
	for <lists+openbmc@lfdr.de>; Tue, 10 Dec 2019 01:32:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47X1HN11FgzDqTh
	for <lists+openbmc@lfdr.de>; Tue, 10 Dec 2019 11:32:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::242;
 helo=mail-lj1-x242.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Jq4GVhmK"; 
 dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47X1Gb56c5zDqT9
 for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2019 11:32:06 +1100 (AEDT)
Received: by mail-lj1-x242.google.com with SMTP id 21so17842136ljr.0
 for <openbmc@lists.ozlabs.org>; Mon, 09 Dec 2019 16:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9Z77LtVHnCuhgykRCh+FPJfpIprr9FdWRzkCr3Lgelo=;
 b=Jq4GVhmKloAXw+/9PfJmYqMx8NmFimy5toonVUAlz4EpB/noiT72G9FYlDm1YUTdWF
 /PyJ7RAHMfFE5k2x3y9iv87viy6vmEauNnS2GG2/ZAWu89tYfqIdihINrxV4cK2rR073
 xOj+wm0rsvRZqXqBTgjxsLHs06m3Wr8whvJBA+y1ic+OSSrVaFY79xHliY5WGXGOBFvd
 Dqc1cgEzYlVsMdIAx+7eo+cfue15gK4UGfl/Fjwx6hbz8k8ykLO5PEEdiAIMMt3fAwdZ
 XWxRaQxzkiUfqDlV187h3pSS66SiaUTen9SRUakQGSsawic94byWgdUzR6arC+Ed0STo
 ZFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9Z77LtVHnCuhgykRCh+FPJfpIprr9FdWRzkCr3Lgelo=;
 b=AVn6Ic+RgzBo6EV9u7jmQOevzKK25C9AoRlw+BNw1yxw0g58oj29rke+Y3Y0pG5jyM
 cVSZsYQorcmPvxIN7RDIgiv0dj5LfXujP1BkRZZYBHLV88xFDMSppBeuN00lJKlU+hO3
 /BRAN1gLAdUb8vbj7MhmE0Skf6yJs7mTQfdB3cwSrxoCABqc8LuEtiG5QWWG5pk32DI7
 E6A+I+qiTcoq00KZk7TWIPZexV8q1zeEiDIVweAamOFawskXWcfHXbcTb/EGnL791lPg
 WFzj/CZFxet/AgFRLRb/RL/o9+FyVcj/++EFbRuaTG51QWqRrAj4odozUQs9IdQdM16Z
 lMIQ==
X-Gm-Message-State: APjAAAVEESk2Huk4JjvSqO5cgCi0osy/reJJZaBUs3MPn62w5N32dmow
 SWtvLHq8f9NMWrwWdrVHF3UpVjOftnVe+swLl+r/lg==
X-Google-Smtp-Source: APXvYqza8vz5ceHgAdaeZQRXw41FsNtmmj7uCUt4bP++SqrFlimSnwsRzjYmrEkbgLEHzTxw5xYeEVvmXEYKmEZMOSU=
X-Received: by 2002:a2e:6f19:: with SMTP id k25mr18161844ljc.84.1575937920967; 
 Mon, 09 Dec 2019 16:32:00 -0800 (PST)
MIME-Version: 1.0
References: <CAH1kD+anPrvv4=BEt9MTvqpLNpLEDfa1ERMNQvtXAWrDmv1c2g@mail.gmail.com>
 <49909d49-5218-e492-aa4b-8602a8baa041@linux.intel.com>
In-Reply-To: <49909d49-5218-e492-aa4b-8602a8baa041@linux.intel.com>
From: Richard Hanley <rhanley@google.com>
Date: Mon, 9 Dec 2019 16:31:49 -0800
Message-ID: <CAH1kD+aCPD0ZqwRz5Kcb_Rg8V+KfsqrpeLCJzssrND4N=1LdTw@mail.gmail.com>
Subject: Re: Inserting a Redfish Aggregator
To: James Feist <james.feist@linux.intel.com>
Content-Type: multipart/alternative; boundary="000000000000f842f205994ea384"
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

--000000000000f842f205994ea384
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi James,

I'd expect that we'd be getting data from a mixture of bmcs and host
interfaces.  I'm also expecting that any aggregator would first be put into
production on a host machine, and later moved to OpenBMC.

So that means that we can't make too many assumptions about the
hardware any of the Redfish services are running.

I'm imagining that this project would be connecting a group of management
domains that are on the same "system."  By that definition a system would
be a bunch of physically connected components.

Thanks,
Richard


On Wed, Dec 4, 2019 at 12:18 PM James Feist <james.feist@linux.intel.com>
wrote:

> On 12/3/19 7:14 PM, Richard Hanley wrote:
> > Hi everyone,
> >
> >
> > I=E2=80=99ve been thinking a bit about how to separate Redfish logic fr=
om DBus
> > in bmcweb.
> >
> >
> > As a motivating example, imagine a Redfish aggregator that has some
> > chassis that is located outside of its local instance.Once the
> > aggregator finds the external chassis, it needs to add it to the chassi=
s
> > collection.
> >
> >
> > However, looking at the current implementation of the
> > ChassisCollection.(located here:
> >
> https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/chassis.hp=
p#L246)
>
> > It isn=E2=80=99t clear to me how to add this in.
> >
> >
> > The current implementation does some setup on the response payload, and
> > then makes a DBus call to look through the entity manager.The collectio=
n
>
> It's not entity-manager per-say, it's whatever daemon produces the
> correct interface on d-bus. Entity-manager is just one option.
>
> > it sends as a response is entirely defined by the result from the entit=
y
> > manager. I basically see three ways that this could be solved.
> >
> >
> >  1. Move the aggregator logic down to the entity manager
> >  2. Refactor the Chassis Collection to have its own data model separate
> >     from the entity manager.
> >  3. Create some service that works on top of the bmcweb implementation
> >     of Redfish.
> >
> >
> > I think this comes up to a fundamental design decision, how
> > modular/flexible should the Redfish implementation be?Right now bmcweb
> > provides a very sane default implementation, and is tied very closely t=
o
> > the current hardware it is running on.Whereas I am envisioning a Redfis=
h
> > implementation that is a bit more abstracted from any particular
> hardware.
> >
>
> Can you describe a bit more where the data would come from? Are you
> thinking of multiple bmcs that are physically attached? Non-physically
> attached bmcs? BMCs not running OpenBmc? One idea I had in the past was
> remoting dbus from other systems in some way and creating a clone daemon
> that would show the interfaces from the other systems, although I never
> looked into it much.
>
> >
> > It=E2=80=99s taken me awhile to get up to speed with Redfish, Open BMC,=
 and
> > Google=E2=80=99s infrastructure; but I=E2=80=99m starting to get a more=
 concrete design
> > for an aggregator.However, I=E2=80=99m unsure about whether this should=
 be
> > framed as a new layer on top of the existing implementation, or as a
> > refactor of that implementation?
> >
> >
> > I can see some pros and cons between the two, but I=E2=80=99m intereste=
d in how
> > everyone feels about this.
> >
> >
> > Regards,
> >
> > Richard
> >
>

--000000000000f842f205994ea384
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi James,</div><div><br></div><div>I&#39;d expect tha=
t we&#39;d be getting data from a mixture of bmcs and host interfaces.=C2=
=A0 I&#39;m also expecting that any aggregator would first be put into prod=
uction on a host machine, and later moved to OpenBMC.</div><div><br></div><=
div>So that means that we can&#39;t make too many=C2=A0assumptions about th=
e hardware=C2=A0any of the Redfish services are running.</div><div><br></di=
v><div>I&#39;m imagining that this project would be connecting a group of m=
anagement domains that are on the same &quot;system.&quot;=C2=A0 By that de=
finition a system would be a bunch of physically connected components.</div=
><div><br></div><div>Thanks,</div><div>Richard</div></div><div dir=3D"ltr">=
<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Wed, Dec 4, 2019 at 12:18 PM James Feist &lt;<a href=3D"mailto:james=
.feist@linux.intel.com" target=3D"_blank">james.feist@linux.intel.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 12/=
3/19 7:14 PM, Richard Hanley wrote:<br>
&gt; Hi everyone,<br>
&gt; <br>
&gt; <br>
&gt; I=E2=80=99ve been thinking a bit about how to separate Redfish logic f=
rom DBus <br>
&gt; in bmcweb.<br>
&gt; <br>
&gt; <br>
&gt; As a motivating example, imagine a Redfish aggregator that has some <b=
r>
&gt; chassis that is located outside of its local instance.Once the <br>
&gt; aggregator finds the external chassis, it needs to add it to the chass=
is <br>
&gt; collection.<br>
&gt; <br>
&gt; <br>
&gt; However, looking at the current implementation of the <br>
&gt; ChassisCollection.(located here: <br>
&gt; <a href=3D"https://github.com/openbmc/bmcweb/blob/master/redfish-core/=
lib/chassis.hpp#L246" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/openbmc/bmcweb/blob/master/redfish-core/lib/chassis.hpp#L246</a>) <br>
&gt; It isn=E2=80=99t clear to me how to add this in.<br>
&gt; <br>
&gt; <br>
&gt; The current implementation does some setup on the response payload, an=
d <br>
&gt; then makes a DBus call to look through the entity manager.The collecti=
on <br>
<br>
It&#39;s not entity-manager per-say, it&#39;s whatever daemon produces the =
<br>
correct interface on d-bus. Entity-manager is just one option.<br>
<br>
&gt; it sends as a response is entirely defined by the result from the enti=
ty <br>
&gt; manager. I basically see three ways that this could be solved.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 1. Move the aggregator logic down to the entity manager<br>
&gt;=C2=A0 2. Refactor the Chassis Collection to have its own data model se=
parate<br>
&gt;=C2=A0 =C2=A0 =C2=A0from the entity manager.<br>
&gt;=C2=A0 3. Create some service that works on top of the bmcweb implement=
ation<br>
&gt;=C2=A0 =C2=A0 =C2=A0of Redfish.<br>
&gt; <br>
&gt; <br>
&gt; I think this comes up to a fundamental design decision, how <br>
&gt; modular/flexible should the Redfish implementation be?Right now bmcweb=
 <br>
&gt; provides a very sane default implementation, and is tied very closely =
to <br>
&gt; the current hardware it is running on.Whereas I am envisioning a Redfi=
sh <br>
&gt; implementation that is a bit more abstracted from any particular hardw=
are.<br>
&gt; <br>
<br>
Can you describe a bit more where the data would come from? Are you <br>
thinking of multiple bmcs that are physically attached? Non-physically <br>
attached bmcs? BMCs not running OpenBmc? One idea I had in the past was <br=
>
remoting dbus from other systems in some way and creating a clone daemon <b=
r>
that would show the interfaces from the other systems, although I never <br=
>
looked into it much.<br>
<br>
&gt; <br>
&gt; It=E2=80=99s taken me awhile to get up to speed with Redfish, Open BMC=
, and <br>
&gt; Google=E2=80=99s infrastructure; but I=E2=80=99m starting to get a mor=
e concrete design <br>
&gt; for an aggregator.However, I=E2=80=99m unsure about whether this shoul=
d be <br>
&gt; framed as a new layer on top of the existing implementation, or as a <=
br>
&gt; refactor of that implementation?<br>
&gt; <br>
&gt; <br>
&gt; I can see some pros and cons between the two, but I=E2=80=99m interest=
ed in how <br>
&gt; everyone feels about this.<br>
&gt; <br>
&gt; <br>
&gt; Regards,<br>
&gt; <br>
&gt; Richard<br>
&gt; <br>
</blockquote></div>

--000000000000f842f205994ea384--
