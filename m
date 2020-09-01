Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D231258C27
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 11:57:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgjDg319MzDqWv
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 19:57:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=raviteja28031990@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Srp6kLYV; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgjCs2L9HzDqGq
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 19:57:09 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id mw10so361623pjb.2
 for <openbmc@lists.ozlabs.org>; Tue, 01 Sep 2020 02:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xuUTTKThYodfEbGD8h03xkRxg6sZhBwwYYvrJaWFD+w=;
 b=Srp6kLYVBei/HJdGfJLG0VAYCH4fQusBP0mnMjd3gGrG+eyp4sSlpjVcmpub9vD2vw
 KZuXh1vQVC2Aiu3M+JqHzFtBftmi/tVlk8jZnJx1nbiWIbYhhBkWXb+vIw7Y2V/3jAub
 TQns3XmNmzuX2RqUL/+d7hnq/aBjtPZJeiMkAYQZMzl01kCgDr8+GTLw6u/gmosCZe7k
 giL+dQqunL4RcOaYsmEfLev1t9O6+psziQy08hBl/myzLIP4OXAEIyfwmiG3sYXWbKiz
 uRjXgtrxx8bsB1cepzFtgQdldiYqRIMTXtELYA7q7bgX+XOh6FBnwig58Pv6Cqrmq9+U
 7Wnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xuUTTKThYodfEbGD8h03xkRxg6sZhBwwYYvrJaWFD+w=;
 b=Hsqh/86hkg+FOTp4nrZiXkms0Ex2VEVN4PGpXHvuXE6dmGD3W9kQINXsBf8Nh8JhNm
 Odmu3nuU90FZgM+3xjFFNtZN5XV7GqI/3lqQW2YhGSjgGovc0xxbzc9H+GZNk1UWIDtP
 xeykDZqv4MxQ4JxuzDxKah420Uxj+5L3Fc/NoxARmOqQkzvE9kzmK4uAPNgpnv2KSM34
 9tHxpUxmNzCuewMWZ0Sj8paTg62cLfdJGFP6io3PbzYiy4Av7MuO3SocThhxtxUDU4yf
 sbVa5rUyhwVAWTe7Y6BoZwbLwRiozdj+oUYnPPsXG/AS4kE/LdOU5KNpYnosAbQLZbA4
 5Kug==
X-Gm-Message-State: AOAM530Of8VHRVhNbT2Nw96mgfGxgoubTj1iBh9q8mWwHHmWO9oUUdxh
 byv2bj7OST5GxjAM5JahepA7evqwggcS/jQiib9C6Imw
X-Google-Smtp-Source: ABdhPJxIfL1nA2qPDxAcn3HRht7J5DFJpyskQ78HkvOVwXKRZwesoiPyjGdsCJaA4kMeJIb2wAXqxZ6wf/i8q8n+XHo=
X-Received: by 2002:a17:90a:c253:: with SMTP id
 d19mr805815pjx.113.1598954226187; 
 Tue, 01 Sep 2020 02:57:06 -0700 (PDT)
MIME-Version: 1.0
References: <CACWQX82sSvONiMq53s39P42Sky5C+GsvLGyN42xvKUYSGHjyrQ@mail.gmail.com>
 <CACWQX82=j3QiYotB1ynOor=HkuMEmyDxa=aNr7_uGwkfuFXJaA@mail.gmail.com>
In-Reply-To: <CACWQX82=j3QiYotB1ynOor=HkuMEmyDxa=aNr7_uGwkfuFXJaA@mail.gmail.com>
From: raviteja bailapudi <raviteja28031990@gmail.com>
Date: Tue, 1 Sep 2020 15:26:53 +0530
Message-ID: <CAM4DKZm7PxT2=OaFQonP0yBTDjcNjssvw46QbDNG30qUKydeqw@mail.gmail.com>
Subject: Re: Recent architecture breakages to bmcweb
To: Ed Tanous <ed@tanous.net>
Content-Type: multipart/alternative; boundary="000000000000aa039005ae3d8ab0"
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

--000000000000aa039005ae3d8ab0
Content-Type: text/plain; charset="UTF-8"

Ed,Sorry for the late response, I forgot to reply here, Some how the first
mail got missed but once I got a  reminder mail, I started working on this
and the discussion is going on in the gerrit.
I had few more doubts which I asked in the gerrit, Can you please take a
look?



-RaviTeja

On Fri, 28 Aug, 2020, 12:42 am Ed Tanous, <ed@tanous.net> wrote:

> On Sun, Aug 2, 2020 at 8:53 AM Ed Tanous <ed@tanous.net> wrote:
> >
> > I'm looking at a couple recent changes to bmcweb, and I'm finding a
> > significant architecture problem has been injected.  Namely, it's
> > these innocuous looking 4 lines here, which injects the socket adaptor
> > into the request object for use later.
> >
> https://github.com/openbmc/bmcweb/blob/30c58d581606b4484757e6ee9133c248de1514a6/http/http_request.h#L18
> >
> > The problem with this approach has a few roots:
> > 1. The Request class is meant to model a single request, single
> > response model.  Adding the stream semantics breaks this in pretty
> > significant ways, and forces a hard dependency between the streaming
> > adapter and the Request, which was not the intent.  We have
> > abstractions for "streaming" requests, but that was seemingly not
> > used.
> >
> > 2. In the code that existed before this, Adaptor was a template on
> > purpose.  It is designed to implement the std::networking
> > AsyncReadStream and AsyncWriteStream concepts.  This is designed to
> > allow injection of Unit Tests at some point, as I've talked about
> > before.  Hardcoding it in request to 2 forced stream types, based on
> > the compiler flag is incorrect per asio standards, and removes the
> > ability to inject arbitrary adapters, like test adaptors.  Also, the
> > flag used is incorrect, as it's possible to inject a non-ssl socket
> > even if SSL is enabled.
> >
> > 3. There is already a precedent and pattern for streaming interfaces
> > in bmcweb that we adopted from Crow.  If you look at the Websocket
> > request response type, it implements a way to request a route that
> > streams dynamically.  Frustratingly, part of what this was used for
> > was SSE, which I had already written a patch for that didn't have any
> > of the above issues, and only hadn't merged it because we didn't have
> > any SSE routes yet, and didn't want to check in dead code.
> > https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/13948
> >
> > 4. It opens the possibility for lifetime and possible (at the very
> > least harder to audit) security issues, as now the "http server"
> > component is no longer the only thing that can own sockets.
> > Previously, the server owned the sockets until handed off, then there
> > was no shared ownership between the websocket class, and the
> > Connection class.  The Connection class could be completely destroyed
> > (and memory freed) while the websocket was still connected and
> > running.
> >
> > Moving to another track, you may ask, how did I come across this and
> > why does it matter?  I'm trying to add 2 new features to bmcweb.  The
> > first allows opening multiple sockets, and dynamically detecting TLS
> > streams on them.  This allows bmcweb to handle both HTTPS redirects in
> > band, and handle the case where users type in something erroneous,
> > like "http://mybmc:443" and connect to an SSL socket with a non-ssl
> > protocol.  In those cases, we can simply do the right thing.  It also
> > allows bmcweb to host on multiple ports, which might be interesting
> > for aggregator types.  More importantly, it cleans up some of the
> > Adaptor abstraction to make way for unit testing, and being able to
> > inject a "test" socket, that we can control the semantics of.  I'm
> > hoping eventually to be able to mock dbus, and mock the TCP socket,
> > and run a full Redfish validator run in a unit test.  I think that
> > would save a lot of time overall for both committers and consumers.
> >
> > The first of these patches is posted here, and simply comments out the
> > above problems for now.
> > https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/35265
> >
> > If I look through the commit logs, it looks like Ravi and Appu built
> > the two small subsystems that rely on the above abstraction, one for
> > SSE, and one for some NBD streamer.
> > What do you two think about the above?  Was it something you
> > considered when you wrote your patches?  Would you consider fixing
> > them?
> >
> >   My recommendation would be to move both of those two over to
> > something similar to the websocket abstraction we have, with, on
> > connect, on data, and on close handlers.  This means that handlers no
> > longer take a hard dependency on the transport, which will help for
> > both unit testing, and if we ever want to support redfish device
> > enablement (which relies on an i2c based transport). The SSE one can
> > probably be used more or less as-is from my old patch.  The NBD one
> > might need a "Dynamic body" type, which beast already has an
> > abstraction for that seems to have been discounted.
> >
> > What do you guys think?
> >
> > -Ed
>
>
> It's been 3 weeks and I haven't gotten any replies to this pretty
> major architecture break.  It also looks like it can also cause a
> memory leak in HttpConnection here (found by code inspection here).
>
> https://github.com/openbmc/bmcweb/blob/ebd459060ea4f42761402dd54acd0962c36136c2/http/http_connection.h#L351
>
> I've pushed a revert to remove the features in question.  I would love
> some comments from the developers that caused these breakages, so I
> can make sure I'm doing the right thing here, and I'm not completely
> off base (or that you intend to fix them, and this patch is
> unnecessary).
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/36038
>
> Thanks,
>
> -Ed
>

--000000000000aa039005ae3d8ab0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><span style=3D"color:rgb(29,28,29);font-family:slack-lato=
,applelogo,sans-serif;font-size:15px">Ed,</span><span style=3D"display:bloc=
k;height:8px;color:rgb(29,28,29);font-family:slack-lato,applelogo,sans-seri=
f;font-size:15px"></span><span style=3D"color:rgb(29,28,29);font-family:sla=
ck-lato,applelogo,sans-serif;font-size:15px">Sorry for the late response, I=
 forgot to reply here, Some how the first mail got missed but once I got a=
=C2=A0 reminder mail, I started working on this and the discussion is going=
 on in the gerrit.</span><br style=3D"color:rgb(29,28,29);font-family:slack=
-lato,applelogo,sans-serif;font-size:15px"><span style=3D"color:rgb(29,28,2=
9);font-family:slack-lato,applelogo,sans-serif;font-size:15px">I had few mo=
re doubts which I asked in the gerrit, Can you please take a look?</span><d=
iv style=3D"color:rgb(136,136,136);font-family:sans-serif;font-size:12.8px"=
 dir=3D"auto"><span style=3D"display:block;height:8px;color:rgb(29,28,29);f=
ont-family:&#39;slack-lato&#39;,&#39;applelogo&#39;,sans-serif;font-size:15=
px"><br><br></span><span style=3D"color:rgb(29,28,29);font-family:&#39;slac=
k-lato&#39;,&#39;applelogo&#39;,sans-serif;font-size:15px"><br>-RaviTeja</s=
pan>=C2=A0</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, 28 Aug, 2020, 12:42 am Ed Tanous, &lt;<a href=3D"ma=
ilto:ed@tanous.net">ed@tanous.net</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On Sun, Aug 2, 2020 at 8:53 AM Ed Tanous &lt;<a href=3D"mailt=
o:ed@tanous.net" target=3D"_blank" rel=3D"noreferrer">ed@tanous.net</a>&gt;=
 wrote:<br>
&gt;<br>
&gt; I&#39;m looking at a couple recent changes to bmcweb, and I&#39;m find=
ing a<br>
&gt; significant architecture problem has been injected.=C2=A0 Namely, it&#=
39;s<br>
&gt; these innocuous looking 4 lines here, which injects the socket adaptor=
<br>
&gt; into the request object for use later.<br>
&gt; <a href=3D"https://github.com/openbmc/bmcweb/blob/30c58d581606b4484757=
e6ee9133c248de1514a6/http/http_request.h#L18" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">https://github.com/openbmc/bmcweb/blob/30c58d581606b4484=
757e6ee9133c248de1514a6/http/http_request.h#L18</a><br>
&gt;<br>
&gt; The problem with this approach has a few roots:<br>
&gt; 1. The Request class is meant to model a single request, single<br>
&gt; response model.=C2=A0 Adding the stream semantics breaks this in prett=
y<br>
&gt; significant ways, and forces a hard dependency between the streaming<b=
r>
&gt; adapter and the Request, which was not the intent.=C2=A0 We have<br>
&gt; abstractions for &quot;streaming&quot; requests, but that was seemingl=
y not<br>
&gt; used.<br>
&gt;<br>
&gt; 2. In the code that existed before this, Adaptor was a template on<br>
&gt; purpose.=C2=A0 It is designed to implement the std::networking<br>
&gt; AsyncReadStream and AsyncWriteStream concepts.=C2=A0 This is designed =
to<br>
&gt; allow injection of Unit Tests at some point, as I&#39;ve talked about<=
br>
&gt; before.=C2=A0 Hardcoding it in request to 2 forced stream types, based=
 on<br>
&gt; the compiler flag is incorrect per asio standards, and removes the<br>
&gt; ability to inject arbitrary adapters, like test adaptors.=C2=A0 Also, =
the<br>
&gt; flag used is incorrect, as it&#39;s possible to inject a non-ssl socke=
t<br>
&gt; even if SSL is enabled.<br>
&gt;<br>
&gt; 3. There is already a precedent and pattern for streaming interfaces<b=
r>
&gt; in bmcweb that we adopted from Crow.=C2=A0 If you look at the Websocke=
t<br>
&gt; request response type, it implements a way to request a route that<br>
&gt; streams dynamically.=C2=A0 Frustratingly, part of what this was used f=
or<br>
&gt; was SSE, which I had already written a patch for that didn&#39;t have =
any<br>
&gt; of the above issues, and only hadn&#39;t merged it because we didn&#39=
;t have<br>
&gt; any SSE routes yet, and didn&#39;t want to check in dead code.<br>
&gt; <a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/13948=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gerrit.openbmc-pr=
oject.xyz/c/openbmc/bmcweb/+/13948</a><br>
&gt;<br>
&gt; 4. It opens the possibility for lifetime and possible (at the very<br>
&gt; least harder to audit) security issues, as now the &quot;http server&q=
uot;<br>
&gt; component is no longer the only thing that can own sockets.<br>
&gt; Previously, the server owned the sockets until handed off, then there<=
br>
&gt; was no shared ownership between the websocket class, and the<br>
&gt; Connection class.=C2=A0 The Connection class could be completely destr=
oyed<br>
&gt; (and memory freed) while the websocket was still connected and<br>
&gt; running.<br>
&gt;<br>
&gt; Moving to another track, you may ask, how did I come across this and<b=
r>
&gt; why does it matter?=C2=A0 I&#39;m trying to add 2 new features to bmcw=
eb.=C2=A0 The<br>
&gt; first allows opening multiple sockets, and dynamically detecting TLS<b=
r>
&gt; streams on them.=C2=A0 This allows bmcweb to handle both HTTPS redirec=
ts in<br>
&gt; band, and handle the case where users type in something erroneous,<br>
&gt; like &quot;<a href=3D"http://mybmc:443" rel=3D"noreferrer noreferrer" =
target=3D"_blank">http://mybmc:443</a>&quot; and connect to an SSL socket w=
ith a non-ssl<br>
&gt; protocol.=C2=A0 In those cases, we can simply do the right thing.=C2=
=A0 It also<br>
&gt; allows bmcweb to host on multiple ports, which might be interesting<br=
>
&gt; for aggregator types.=C2=A0 More importantly, it cleans up some of the=
<br>
&gt; Adaptor abstraction to make way for unit testing, and being able to<br=
>
&gt; inject a &quot;test&quot; socket, that we can control the semantics of=
.=C2=A0 I&#39;m<br>
&gt; hoping eventually to be able to mock dbus, and mock the TCP socket,<br=
>
&gt; and run a full Redfish validator run in a unit test.=C2=A0 I think tha=
t<br>
&gt; would save a lot of time overall for both committers and consumers.<br=
>
&gt;<br>
&gt; The first of these patches is posted here, and simply comments out the=
<br>
&gt; above problems for now.<br>
&gt; <a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/35265=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gerrit.openbmc-pr=
oject.xyz/c/openbmc/bmcweb/+/35265</a><br>
&gt;<br>
&gt; If I look through the commit logs, it looks like Ravi and Appu built<b=
r>
&gt; the two small subsystems that rely on the above abstraction, one for<b=
r>
&gt; SSE, and one for some NBD streamer.<br>
&gt; What do you two think about the above?=C2=A0 Was it something you<br>
&gt; considered when you wrote your patches?=C2=A0 Would you consider fixin=
g<br>
&gt; them?<br>
&gt;<br>
&gt;=C2=A0 =C2=A0My recommendation would be to move both of those two over =
to<br>
&gt; something similar to the websocket abstraction we have, with, on<br>
&gt; connect, on data, and on close handlers.=C2=A0 This means that handler=
s no<br>
&gt; longer take a hard dependency on the transport, which will help for<br=
>
&gt; both unit testing, and if we ever want to support redfish device<br>
&gt; enablement (which relies on an i2c based transport). The SSE one can<b=
r>
&gt; probably be used more or less as-is from my old patch.=C2=A0 The NBD o=
ne<br>
&gt; might need a &quot;Dynamic body&quot; type, which beast already has an=
<br>
&gt; abstraction for that seems to have been discounted.<br>
&gt;<br>
&gt; What do you guys think?<br>
&gt;<br>
&gt; -Ed<br>
<br>
<br>
It&#39;s been 3 weeks and I haven&#39;t gotten any replies to this pretty<b=
r>
major architecture break.=C2=A0 It also looks like it can also cause a<br>
memory leak in HttpConnection here (found by code inspection here).<br>
<a href=3D"https://github.com/openbmc/bmcweb/blob/ebd459060ea4f42761402dd54=
acd0962c36136c2/http/http_connection.h#L351" rel=3D"noreferrer noreferrer" =
target=3D"_blank">https://github.com/openbmc/bmcweb/blob/ebd459060ea4f42761=
402dd54acd0962c36136c2/http/http_connection.h#L351</a><br>
<br>
I&#39;ve pushed a revert to remove the features in question.=C2=A0 I would =
love<br>
some comments from the developers that caused these breakages, so I<br>
can make sure I&#39;m doing the right thing here, and I&#39;m not completel=
y<br>
off base (or that you intend to fix them, and this patch is<br>
unnecessary).<br>
<a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/36038" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://gerrit.openbmc-project=
.xyz/c/openbmc/bmcweb/+/36038</a><br>
<br>
Thanks,<br>
<br>
-Ed<br>
</blockquote></div>

--000000000000aa039005ae3d8ab0--
