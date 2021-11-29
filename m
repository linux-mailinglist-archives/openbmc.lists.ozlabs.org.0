Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AEA4613B2
	for <lists+openbmc@lfdr.de>; Mon, 29 Nov 2021 12:13:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2jPr0Ypdz30J5
	for <lists+openbmc@lfdr.de>; Mon, 29 Nov 2021 22:13:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jWuUsTWK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=rushtotom@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=jWuUsTWK; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2jPR4NdZz2yJV
 for <openbmc@lists.ozlabs.org>; Mon, 29 Nov 2021 22:12:41 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id u17so11866094plg.9
 for <openbmc@lists.ozlabs.org>; Mon, 29 Nov 2021 03:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3ZDO54jN9z+z7IhGAfCbWDWLd++ynf9+Dg4iJUYA+n8=;
 b=jWuUsTWKSCgBf1VF+W8rgJ/VsBbxqN22E0cWm5vdjhtwtOh6d+gbtwynjtiI9uK4VH
 ZNUvoaUwMicQK3GjQPrc/QAo+AyA+hYOhT+ZdegPTnPUDtnC8iQL1fewe0DuptabJoLc
 Cx0u7GFejF7Mw1D+Yzd8Myf2h4M1D17Ni0IGBRlyoEUEg612lRad3ArScXIiHYHtGXJi
 FAcJn5Og8vMMQZ3GH3PuN+GYEarNJkyQKID7rvaVLpQl32xgD9kHQcU1efRotPgbj+zF
 6AP4ps3Z9UKDVi0bXqx3d98dpHmq0OEckovTBlxB4GBnk4VOgvQcJ9dHHgEt4iuvn3y/
 idOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3ZDO54jN9z+z7IhGAfCbWDWLd++ynf9+Dg4iJUYA+n8=;
 b=Ri9EKGTHYyIf5o2Sj9qU5OnBuP6lDs1dU5SzrkQWXkC35SmBS8op1sRASKcxwayxXc
 JmJVQKoshMILLBgbkUtnua4CyraDF+Vk0cN3qCqJH7Ht956wQ+xqsh+8Ht0O2c2ejacH
 pPEE/8M6sD+BskMQtDyxR/jke0AIRz7Rnu3LVNGxg0btDtfpeoHA8TsPOi32FPDFmrXx
 wNCmIZT9qCdWSVrn53PBRZzRd6ZXbYMkLDYRNWGlXpIImAfGKV9D6/Td5u2ULbPkZYbP
 U/Cl4iUQkbMsmXox/NrfKOq3tl04P5u1G0ZTDxHXnnJLWC7OxjMHbLFUCrrS8zFx9LEl
 r6Cw==
X-Gm-Message-State: AOAM532DcBCECy1WmUL3XAcrBhORW11CB2xZI54wDisBqfvL/9PGaId4
 DrWimqR/AVZAGAqqyapPgphyR5TKMky4/Nfa/Nk=
X-Google-Smtp-Source: ABdhPJzkbJmsXk2wGPMzN/p2GIbi4o7doSBqFEcA4RCgCqEw+3LKUs4UWMpuxQB3nx06si+linYSp5BuGzoBiUaBOXM=
X-Received: by 2002:a17:90b:3a83:: with SMTP id
 om3mr37553661pjb.211.1638184359349; 
 Mon, 29 Nov 2021 03:12:39 -0800 (PST)
MIME-Version: 1.0
References: <YaPzMYi/UHwvEiGf@heinlein>
 <954c1bbd0bf7996b82b5890b1ecb1a6903c8b047.camel@yadro.com>
In-Reply-To: <954c1bbd0bf7996b82b5890b1ecb1a6903c8b047.camel@yadro.com>
From: Tom Joseph <rushtotom@gmail.com>
Date: Mon, 29 Nov 2021 16:42:28 +0530
Message-ID: <CADCscQ=iuhyi5_H3TAn1JXPLBq4BrdJJeHZqGNLahRzgnzwTzg@mail.gmail.com>
Subject: Re: C++ co-routines are coming soon...
To: Andrei Kartashev <a.kartashev@yadro.com>
Content-Type: multipart/alternative; boundary="000000000000d0d15b05d1eb84ab"
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000d0d15b05d1eb84ab
Content-Type: text/plain; charset="UTF-8"

Thanks Patrick! Really excited to see C++20 features in action.

Regards,
Tom


On Mon, Nov 29, 2021 at 1:47 PM Andrei Kartashev <a.kartashev@yadro.com>
wrote:

> Thank you for your effort here!
> This three are really long waiting 'must have' things.
> I will try to test this proposal.
>
> On Sun, 2021-11-28 at 15:22 -0600, Patrick Williams wrote:
> > Hello,
> >
> > I just pushed up some code I've been working on for initial community
> > preview:
> > C++20 coroutine support in sdbusplus[1].  This code should be
> > considered
> > "experimental" for the time-being but a good preview of where I plan
> > to take the
> > sdbusplus bindings.  I know there are complaints about the current
> > sdbusplus
> > support in one of three veins depending on your perspective of
> > importance:
> >
> >     1. The current sdbusplus server bindings in phosphor-dbus-
> > interfaces are
> >        synchronous.
> >     2. There are no sdbusplus client bindings in phosphor-dbus-
> > interfaces.
> >     3. The code using the sdbusplus Boost/ASIO interfaces is very
> > callback
> >        intensive (and difficult to read).
> >
> > I've been wanting to leverage C++20 coroutines for quite a while in
> > order to
> > address these shortcomings but haven't gotten around to it due to
> > lack of
> > understanding on my part (and lack of time to fix this) and lack of
> > maturity in
> > the library support.  There is a proposal for C++23 (P2300)[2] which
> > attempts to
> > fix the "maturity" problem and the authors of that have been using
> > libunifex[3]
> > as their proving ground.  Using libunifex and becoming enlightened by
> > Eric
> > Niebler's excellent talk at CppCon'21, I've finally been able to make
> > some good
> > progress on this.
> >
> > There will be more to come, but I wanted to give a taste of what a
> > C++20
> > co-routine-based sdbusplus agent might look like.  This is an example
> > of a
> > task that reacts to D-Bus "NameOwnerChanged" signals:
> >
> > ```
> > auto watch_events(sdbusplus::async::context_t& ctx)
> >     -> sdbusplus::execution::task<void>
> > {
> >     using namespace sdbusplus::async::match;
> >     auto m = match(ctx, rules::nameOwnerChanged());
> >
> >     while (auto msg = co_await m.next())
> >     {
> >         std::string service, old_name, new_name;
> >         msg.read(service, old_name, new_name);
> >         if (!new_name.empty())
> >         {
> >             std::cout << new_name << " owns " << service <<
> > std::endl;
> >         }
> >         else
> >         {
> >             std::cout << service << " released" << std::endl;
> >         }
> >     };
> >
> >     co_return;
> > }
> > ```
> >
> > I currently have `match` implemented and I plan to get `call` working
> > very soon.
> > Sometime between now and late January I'll probably do an educational
> > talk on
> > co-routines.
> >
> > 1. https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/49117
> > 2. https://github.com/cplusplus/papers/issues/1054
> > 3. https://github.com/facebookexperimental/libunifex
> > 4. https://www.youtube.com/watch?v=xLboNIf7BTg
> >
>
> --
> Best regards,
> Andrei Kartashev
>
>
>

--000000000000d0d15b05d1eb84ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Thanks Patrick! Really excited to see C++=
20 features in action.<br></div><div dir=3D"ltr"><br></div><div>Regards,</d=
iv><div>Tom<br><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Mon, Nov 29, 2021 at 1:47 PM Andrei Kartashev &lt;<a =
href=3D"mailto:a.kartashev@yadro.com">a.kartashev@yadro.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Thank you for yo=
ur effort here!<br>
This three are really long waiting &#39;must have&#39; things.<br>
I will try to test this proposal.<br>
<br>
On Sun, 2021-11-28 at 15:22 -0600, Patrick Williams wrote:<br>
&gt; Hello,<br>
&gt; <br>
&gt; I just pushed up some code I&#39;ve been working on for initial commun=
ity<br>
&gt; preview:<br>
&gt; C++20 coroutine support in sdbusplus[1].=C2=A0 This code should be<br>
&gt; considered<br>
&gt; &quot;experimental&quot; for the time-being but a good preview of wher=
e I plan<br>
&gt; to take the<br>
&gt; sdbusplus bindings.=C2=A0 I know there are complaints about the curren=
t<br>
&gt; sdbusplus<br>
&gt; support in one of three veins depending on your perspective of<br>
&gt; importance:<br>
&gt; <br>
&gt; =C2=A0=C2=A0=C2=A0 1. The current sdbusplus server bindings in phospho=
r-dbus-<br>
&gt; interfaces are<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 synchronous.<br>
&gt; =C2=A0=C2=A0=C2=A0 2. There are no sdbusplus client bindings in phosph=
or-dbus-<br>
&gt; interfaces.<br>
&gt; =C2=A0=C2=A0=C2=A0 3. The code using the sdbusplus Boost/ASIO interfac=
es is very<br>
&gt; callback<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 intensive (and difficult to read)=
.<br>
&gt; <br>
&gt; I&#39;ve been wanting to leverage C++20 coroutines for quite a while i=
n<br>
&gt; order to<br>
&gt; address these shortcomings but haven&#39;t gotten around to it due to<=
br>
&gt; lack of<br>
&gt; understanding on my part (and lack of time to fix this) and lack of<br=
>
&gt; maturity in<br>
&gt; the library support.=C2=A0 There is a proposal for C++23 (P2300)[2] wh=
ich<br>
&gt; attempts to<br>
&gt; fix the &quot;maturity&quot; problem and the authors of that have been=
 using<br>
&gt; libunifex[3]<br>
&gt; as their proving ground.=C2=A0 Using libunifex and becoming enlightene=
d by<br>
&gt; Eric<br>
&gt; Niebler&#39;s excellent talk at CppCon&#39;21, I&#39;ve finally been a=
ble to make<br>
&gt; some good<br>
&gt; progress on this.<br>
&gt; <br>
&gt; There will be more to come, but I wanted to give a taste of what a<br>
&gt; C++20<br>
&gt; co-routine-based sdbusplus agent might look like.=C2=A0 This is an exa=
mple<br>
&gt; of a<br>
&gt; task that reacts to D-Bus &quot;NameOwnerChanged&quot; signals:<br>
&gt; <br>
&gt; ```<br>
&gt; auto watch_events(sdbusplus::async::context_t&amp; ctx)<br>
&gt; =C2=A0=C2=A0=C2=A0 -&gt; sdbusplus::execution::task&lt;void&gt;<br>
&gt; {<br>
&gt; =C2=A0=C2=A0=C2=A0 using namespace sdbusplus::async::match;<br>
&gt; =C2=A0=C2=A0=C2=A0 auto m =3D match(ctx, rules::nameOwnerChanged());<b=
r>
&gt; <br>
&gt; =C2=A0=C2=A0=C2=A0 while (auto msg =3D co_await m.next())<br>
&gt; =C2=A0=C2=A0=C2=A0 {<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 std::string service, old_na=
me, new_name;<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg.read(service, old_name,=
 new_name);<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!new_name.empty())<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 std=
::cout &lt;&lt; new_name &lt;&lt; &quot; owns &quot; &lt;&lt; service &lt;&=
lt;<br>
&gt; std::endl;<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 std=
::cout &lt;&lt; service &lt;&lt; &quot; released&quot; &lt;&lt; std::endl;<=
br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; =C2=A0=C2=A0=C2=A0 };<br>
&gt; <br>
&gt; =C2=A0=C2=A0=C2=A0 co_return;<br>
&gt; }<br>
&gt; ```<br>
&gt; <br>
&gt; I currently have `match` implemented and I plan to get `call` working<=
br>
&gt; very soon.<br>
&gt; Sometime between now and late January I&#39;ll probably do an educatio=
nal<br>
&gt; talk on<br>
&gt; co-routines.<br>
&gt; <br>
&gt; 1. <a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+=
/49117" rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc-project=
.xyz/c/openbmc/sdbusplus/+/49117</a><br>
&gt; 2. <a href=3D"https://github.com/cplusplus/papers/issues/1054" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/cplusplus/papers/issues/10=
54</a><br>
&gt; 3. <a href=3D"https://github.com/facebookexperimental/libunifex" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/facebookexperimental/l=
ibunifex</a><br>
&gt; 4. <a href=3D"https://www.youtube.com/watch?v=3DxLboNIf7BTg" rel=3D"no=
referrer" target=3D"_blank">https://www.youtube.com/watch?v=3DxLboNIf7BTg</=
a><br>
&gt; <br>
<br>
-- <br>
Best regards,<br>
Andrei Kartashev<br>
<br>
<br>
</blockquote></div></div>

--000000000000d0d15b05d1eb84ab--
