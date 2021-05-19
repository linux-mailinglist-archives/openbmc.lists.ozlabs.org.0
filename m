Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B85389920
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 00:14:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlnGm466kz303g
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 08:14:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=rGSpNfu7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b33;
 helo=mail-yb1-xb33.google.com; envelope-from=nanzhou@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=rGSpNfu7; dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlnGW435xz2xg6
 for <openbmc@lists.ozlabs.org>; Thu, 20 May 2021 08:14:24 +1000 (AEST)
Received: by mail-yb1-xb33.google.com with SMTP id l7so20118122ybf.8
 for <openbmc@lists.ozlabs.org>; Wed, 19 May 2021 15:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
 bh=iARP6YjHl6+2jq1uhzlU9W3sxz7XCuoQL7Ia4n6sAGU=;
 b=rGSpNfu7t/VBb4nsT0qzTbLOeA62XB2wOh1IzR6j0sCcDKGUKd2IPrzDKQEWzrqZVM
 p1dJ9p8p/WP9RQsOajHBlm2ygU6HZq2J3l7rzue4zqhq/RwEvt5Uul3KFp0qwBHZmskO
 z5z4I4nrl2SdNAKkivS8Ne/Gj3kBc1N57NA9zjtOqg0RJp0R6EWcb77uJMSgCj8vL/AN
 7eWrc6swxNT+KlSeP58xToSpjTK+SJ9C8daLDdWhlCQyJG4LQ6GcWKYkAJuPLH0DCZfl
 nYBp5FjXwrg9oSAuThIDo9c/LfrwQg31dhKJ+/OrLO7DBLi3ilih0FQMxg9WtCH8CRhk
 zNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:cc;
 bh=iARP6YjHl6+2jq1uhzlU9W3sxz7XCuoQL7Ia4n6sAGU=;
 b=kkWFgJZoZ1bIYeKiC+PMxTs2wSkb1b96FYUeG6bfKFzvjf0Q5jdj1JTk9H+HnlJle9
 5wh5532nqfF/L7v8t5CHa7m1aSgT7S61Z4cOG9rFXpgjihmY3wdS9HkI/LbCGqsW6mq1
 ibQwLMhcx+oX59n7XdW1wKqgORjul4aMvwKYKpdZGOPfUQV4Kwgc7qxtNp29PEJytDWm
 kfI2rqDNq8EPp1opyOo8QErrq3QMUBsa6zUXz35Yi+8xFiXKUQPUkS80HcTQ6+0xw9dy
 YUXnlbChSUkAUwyJJDck6rlGpTfWmAPp90asG+JhnNTdokDYBX6wSr6OmWPBVKgiHX3B
 05ng==
X-Gm-Message-State: AOAM531PWGhqO2yquy2SXPIQKsK8oheyHCt3KStf3x1xKviaApk9vH5P
 Jpp5znnbSznAkGlGLt8+UBnDr8saCE10vv+J2twEBBOkMjfxDw==
X-Received: by 2002:a25:b112:: with SMTP id g18mt2559588ybj.281.1621462459941; 
 Wed, 19 May 2021 15:14:19 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR04MB33460E66D59FF4F2DF64CBDDB12B9@HK0PR04MB3346.apcprd04.prod.outlook.com>
 <CACWQX81Xnpmq7x5S2E=wnRfx=0ob_0zfchA7azks=voVqQ9-Rw@mail.gmail.com>
 <CAOLfGj6ApsbrU9YKvQ4N_VFHkC1jZJ3WPDuLo1KwwSoOCp7HGw@mail.gmail.com>
 <CAH2-KxCEV-vJr0kM9DVa3n+V3nayh_Pq0WkGPahqDimqa6ghnA@mail.gmail.com>
In-Reply-To: <CAH2-KxCEV-vJr0kM9DVa3n+V3nayh_Pq0WkGPahqDimqa6ghnA@mail.gmail.com>
From: Nan Zhou <nanzhou@google.com>
Date: Wed, 19 May 2021 15:14:09 -0700
Message-ID: <CAOLfGj7ZUCvfvKNsgQtMMoX_EZwOhYp3NM0yuzUaAVtZ4FWVLw@mail.gmail.com>
Subject: Re: SimpleStorage proposals
Content-Type: multipart/alternative; boundary="000000000000f2640005c2b6254b"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>,
 =?UTF-8?B?SnVuLUxpbiBDaGVuICjpmbPkv4rpnJYp?= <Jun-Lin.Chen@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000f2640005c2b6254b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> >
> > Thanks for your reply, Ed!
> >
> >>
> >> You've also omitted what properties you're trying to target.  Could
> >> you walk through a little bit about what you're trying to accomplish
> >> with this?  (beyond just "implement the redfish schemas).  Are you
> >> trying to get smart data?  just inventory information?  Do you plan to
> >> represent connections?
> >
> >
> > As a first step, we are only going to implement three properties, Name,
> Presence, and PowerStatus. We don't plan to represent connections at the
> moment.
> I'm assuming these will be the dbus properties names, as redfish
> doesn't really have a presence property or a powerstatus property.
> With that said, that seems reasonable to me to want to do, but we need
> to make sure we're clear on how this differs from the existing Drive
> interfaces.

Hi Ed, the presence I am talking about is kind of a logical concept. You
can find the dbus and redfish properties in the proposal. I believe we plan
to use the following mappings,

dbus                             redifish
 logical
State(enabled)       Device#Status#State             If state is "enabled",
the device is considered present.
Health(OK)            Device#Status#Heatlth(OK)   If health is "OK", the
device is considered present and its current status is OK (its power should
be OK at least).

On Wed, May 19, 2021 at 2:40 PM Ed Tanous <edtanous@google.com> wrote:

> On Wed, May 19, 2021 at 2:27 PM Nan Zhou <nanzhou@google.com> wrote:
> >
> > Thanks for your reply, Ed!
> >
> >>
> >> You've also omitted what properties you're trying to target.  Could
> >> you walk through a little bit about what you're trying to accomplish
> >> with this?  (beyond just "implement the redfish schemas).  Are you
> >> trying to get smart data?  just inventory information?  Do you plan to
> >> represent connections?
> >
> >
> > As a first step, we are only going to implement three properties, Name,
> Presence, and PowerStatus. We don't plan to represent connections at the
> moment.
>
> I'm assuming these will be the dbus properties names, as redfish
> doesn't really have a presence property or a powerstatus property.
> With that said, that seems reasonable to me to want to do, but we need
> to make sure we're clear on how this differs from the existing Drive
> interfaces.
>
> >
> > On Wed, May 19, 2021 at 1:43 PM Ed Tanous <ed@tanous.net> wrote:
> >>
> >> On Wed, May 19, 2021 at 12:57 AM Jun-Lin Chen (=E9=99=B3=E4=BF=8A=E9=
=9C=96)
> >> <Jun-Lin.Chen@quantatw.com> wrote:
> >> >
> >> > Hi all,
> >> >
> >> >
> >> >
> >> > In order to implement the feature to view simple storage device
> status, such SATA HDD presence status.
> >> >
> >> > We propose to implement it on the Redfish SimpleStorage URI.
> >> >
> >> >
> >> >
> >> > As our proposal for Redfish SimpleStorage,
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/43352
> >> >
> >> > And an new daemon,
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/43351
> >> >
> >> >
> >> >
> >> > There are two new dbus-interfaces to be proposed,
> >> >
> >> > xyz.openbmc_project.Inventory.Item.StorageDevice: here is an empty
> interface just mark the dbus path that SimpleStorage Manager should colle=
ct.
> >> >
> >> > xyz.openbmc_project.Inventory.Item.SimpleStorage: it should have the
> properties redfish needs, and can be parser by bmcweb.
> >>
> >>
> >> How does this differ from xyz.openbmc_project.Inventory.Item.Drive?
> >> They look fairly similar;  We generally don't name dbus interfaces
> >> after Redfish directly.  We should reuse what already exists where
> >> possible, and only invent new things where needed.
> >>
> >> You've also omitted what properties you're trying to target.  Could
> >> you walk through a little bit about what you're trying to accomplish
> >> with this?  (beyond just "implement the redfish schemas).  Are you
> >> trying to get smart data?  just inventory information?  Do you plan to
> >> represent connections?
> >>
> >> >
> >> >
> >> >
> >> > The details are in the proposal.
> >> >
> >> >
> >> >
> >> > Welcome and thank you for comments and suggestions
> >> >
> >> >
> >> >
> >> > Best regards,
> >> >
> >> > Jun-Lin Chen
> >> >
> >> >
>

--000000000000f2640005c2b6254b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span cl=
ass=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt;<br></span><span class=3D=
"gmail-im" style=3D"color:rgb(80,0,80)">&gt; Thanks for your reply, Ed!<br>=
</span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt;<br></span=
><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt;&gt;<br></span><=
span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt;&gt; You&#39;ve al=
so omitted what properties you&#39;re trying to target.=C2=A0 Could<br></sp=
an><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt;&gt; you walk =
through a little bit about what you&#39;re trying to accomplish<br></span><=
span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt;&gt; with this?=C2=
=A0 (beyond just &quot;implement the redfish schemas).=C2=A0 Are you<br></s=
pan><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt;&gt; trying t=
o get smart data?=C2=A0 just inventory information?=C2=A0 Do you plan to<br=
></span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt;&gt; repr=
esent connections?<br></span><span class=3D"gmail-im" style=3D"color:rgb(80=
,0,80)">&gt;<br></span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)=
">&gt;<br></span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt;=
 As a first step, we are only going to implement three properties, Name, Pr=
esence, and PowerStatus. We don&#39;t plan to represent connections at the =
moment.</span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)"><br></s=
pan>I&#39;m assuming these will be the dbus properties names, as redfish<br=
>doesn&#39;t really have a presence property or a powerstatus property.<br>=
With that said, that seems reasonable to me to want to do, but we need<br>t=
o make sure we&#39;re clear on how this differs from the existing Drive<br>=
interfaces.</blockquote><div>Hi Ed, the presence I am talking about is kind=
 of a logical=C2=A0concept.=C2=A0You can find the dbus and redfish properti=
es in the proposal. I believe we plan to use the following mappings,</div><=
div><br></div><div>dbus=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0redifish=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0logical=C2=A0=C2=A0</div><div>State(enabled)=C2=A0 =C2=A0 =
=C2=A0 =C2=A0Device#Status#State=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0If state is &quot;enabled&quot;, the device is considered present.<br=
></div><div>Health(OK)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Device#Stat=
us#Heatlth(OK)=C2=A0 =C2=A0If health is &quot;OK&quot;, the device is consi=
dered present and its current status is OK (its power should be OK at least=
).</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Wed, May 19, 2021 at 2:40 PM Ed Tanous &lt;<a href=3D"mailto:edt=
anous@google.com">edtanous@google.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On Wed, May 19, 2021 at 2:27 PM Nan Zh=
ou &lt;<a href=3D"mailto:nanzhou@google.com" target=3D"_blank">nanzhou@goog=
le.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Thanks for your reply, Ed!<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; You&#39;ve also omitted what properties you&#39;re trying to targe=
t.=C2=A0 Could<br>
&gt;&gt; you walk through a little bit about what you&#39;re trying to acco=
mplish<br>
&gt;&gt; with this?=C2=A0 (beyond just &quot;implement the redfish schemas)=
.=C2=A0 Are you<br>
&gt;&gt; trying to get smart data?=C2=A0 just inventory information?=C2=A0 =
Do you plan to<br>
&gt;&gt; represent connections?<br>
&gt;<br>
&gt;<br>
&gt; As a first step, we are only going to implement three properties, Name=
, Presence, and PowerStatus. We don&#39;t plan to represent connections at =
the moment.<br>
<br>
I&#39;m assuming these will be the dbus properties names, as redfish<br>
doesn&#39;t really have a presence property or a powerstatus property.<br>
With that said, that seems reasonable to me to want to do, but we need<br>
to make sure we&#39;re clear on how this differs from the existing Drive<br=
>
interfaces.<br>
<br>
&gt;<br>
&gt; On Wed, May 19, 2021 at 1:43 PM Ed Tanous &lt;<a href=3D"mailto:ed@tan=
ous.net" target=3D"_blank">ed@tanous.net</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Wed, May 19, 2021 at 12:57 AM Jun-Lin Chen (=E9=99=B3=E4=BF=8A=
=E9=9C=96)<br>
&gt;&gt; &lt;<a href=3D"mailto:Jun-Lin.Chen@quantatw.com" target=3D"_blank"=
>Jun-Lin.Chen@quantatw.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hi all,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; In order to implement the feature to view simple storage devi=
ce status, such SATA HDD presence status.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; We propose to implement it on the Redfish SimpleStorage URI.<=
br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; As our proposal for Redfish SimpleStorage, <a href=3D"https:/=
/gerrit.openbmc-project.xyz/c/openbmc/docs/+/43352" rel=3D"noreferrer" targ=
et=3D"_blank">https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/43352</a>=
<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; And an new daemon, <a href=3D"https://gerrit.openbmc-project.=
xyz/c/openbmc/docs/+/43351" rel=3D"noreferrer" target=3D"_blank">https://ge=
rrit.openbmc-project.xyz/c/openbmc/docs/+/43351</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; There are two new dbus-interfaces to be proposed,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; xyz.openbmc_project.Inventory.Item.StorageDevice: here is an =
empty interface just mark the dbus path that SimpleStorage Manager should c=
ollect.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; xyz.openbmc_project.Inventory.Item.SimpleStorage: it should h=
ave the properties redfish needs, and can be parser by bmcweb.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; How does this differ from xyz.openbmc_project.Inventory.Item.Drive=
?<br>
&gt;&gt; They look fairly similar;=C2=A0 We generally don&#39;t name dbus i=
nterfaces<br>
&gt;&gt; after Redfish directly.=C2=A0 We should reuse what already exists =
where<br>
&gt;&gt; possible, and only invent new things where needed.<br>
&gt;&gt;<br>
&gt;&gt; You&#39;ve also omitted what properties you&#39;re trying to targe=
t.=C2=A0 Could<br>
&gt;&gt; you walk through a little bit about what you&#39;re trying to acco=
mplish<br>
&gt;&gt; with this?=C2=A0 (beyond just &quot;implement the redfish schemas)=
.=C2=A0 Are you<br>
&gt;&gt; trying to get smart data?=C2=A0 just inventory information?=C2=A0 =
Do you plan to<br>
&gt;&gt; represent connections?<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The details are in the proposal.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Welcome and thank you for comments and suggestions<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Best regards,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Jun-Lin Chen<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
</blockquote></div>

--000000000000f2640005c2b6254b--
