Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D6B25D09A
	for <lists+openbmc@lfdr.de>; Fri,  4 Sep 2020 06:35:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BjPxB5K9jzDrFC
	for <lists+openbmc@lfdr.de>; Fri,  4 Sep 2020 14:35:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=raviteja28031990@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ay19l3w2; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BjPvy33v7zDrCl
 for <openbmc@lists.ozlabs.org>; Fri,  4 Sep 2020 14:34:22 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id l9so560958plt.8
 for <openbmc@lists.ozlabs.org>; Thu, 03 Sep 2020 21:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iLE5k0jXqkfs/SxMzk/ZAZzlqCwUawQYKZ0ubB3jcfs=;
 b=ay19l3w2vIYOlnv2BWRL13NAa/sXZ5lgVA1d1m1FpSU00y3+u2dmiDW5XdMjK6056n
 W4pR31kGrtclvxy9PyEKYfzRVTs++KmVyMXt3Fib3xs29fvVc2XaAInTUAiucIjxhdDc
 ploo/BIilnT4v7wkdQlGUgox2x5DfK/NtWznCvTvu6pp8ZQkVwROKbHVG0mZXv8y/D8v
 EYD7fZ78Q5it0qg9zxwXdIGkKo/zBzoBJ9QkCpNpMsIha3VXGxi3MfzJnrrAEPzDRMkj
 gxKrQyWeGHW86cBEAnuevCaPuD7Ptz6t1U0ho2fQG8c08su0SGnht6rdCtWWxxqVLfWq
 QMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iLE5k0jXqkfs/SxMzk/ZAZzlqCwUawQYKZ0ubB3jcfs=;
 b=o12YABG+KjZhXgIbkgOVVIEdesr3xW3vMseuKjZPTdKfh6LyrRE2qTgmjWk7fyi3bJ
 ZdFn0TRrdR3dYkf33QmzzYcnkLqpVZ+Ev2dTu0JEjcmZO3WsJ0i0+Qq0WDy5b9+U/Ums
 nt2PAqek4dl5h828PuWYvDf6Q5lz6fy0Qcxzv+21T77hOvdxGYwMZchHd1DLe0F0V1zm
 muNd7TiJfxmF73Bjkz+INh+4Qt87w1+piwa92crMSpPvoE1r1juuNVsZrSzAZVagTuQJ
 8h3+J7AffOyKFDn56JipW8kHvBL1PrvyjyNvPuSuVBA6uZ+YO/ASpoDryWnn88Or2OYP
 iaKA==
X-Gm-Message-State: AOAM532Hzfw0CK5QdUBiE7l6qQvwmjHQq99BjQyg+X2I7Yx8TPjMsT4b
 6FPHBJeGmxmLh/dl/ecgIdg7sTdOZmD+ZmvbJODa239wKWg=
X-Google-Smtp-Source: ABdhPJxPhHYzTYnIeyskWx8mKkBik19X3ezwFTHD6ctTAio0NdJ50POLYlbQA5ZRwu7zOYxVgkhD7buO/UnL+Qalfls=
X-Received: by 2002:a17:90a:4046:: with SMTP id
 k6mr6378729pjg.11.1599194058616; 
 Thu, 03 Sep 2020 21:34:18 -0700 (PDT)
MIME-Version: 1.0
References: <CACWQX82sSvONiMq53s39P42Sky5C+GsvLGyN42xvKUYSGHjyrQ@mail.gmail.com>
 <CACWQX82=j3QiYotB1ynOor=HkuMEmyDxa=aNr7_uGwkfuFXJaA@mail.gmail.com>
 <CAM4DKZm7PxT2=OaFQonP0yBTDjcNjssvw46QbDNG30qUKydeqw@mail.gmail.com>
 <CAM4DKZkE6JTP0jMF0j90KQxkBVxtDXP2TP=e45cQGRP-AqvGfQ@mail.gmail.com>
 <CACWQX836e0w2kP0R3+MSUzyHU_KcipHHv_21NsZdudVeteJaYA@mail.gmail.com>
 <CAM4DKZmZV2gNaFQG1+OaAhDGo+V_TVSeuEqvo7FV0ow9Dp8E1g@mail.gmail.com>
 <CACWQX81ruudwVi+ubJX_V3aAocx0TqC4Wc3_G=Hw6FgbX_5Pcg@mail.gmail.com>
In-Reply-To: <CACWQX81ruudwVi+ubJX_V3aAocx0TqC4Wc3_G=Hw6FgbX_5Pcg@mail.gmail.com>
From: raviteja bailapudi <raviteja28031990@gmail.com>
Date: Fri, 4 Sep 2020 10:04:06 +0530
Message-ID: <CAM4DKZkBpEAJVvCQi7Ga6_+azyPOzfhofQxocDjssn-2ANUFqg@mail.gmail.com>
Subject: Re: Recent architecture breakages to bmcweb
To: Ed Tanous <ed@tanous.net>
Content-Type: multipart/alternative; boundary="000000000000ca723905ae756192"
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

--000000000000ca723905ae756192
Content-Type: text/plain; charset="UTF-8"

Hi Ed,


>
> > Exactly, we thought to implement 4 callables in new rule class similar
> to  websocket
> >    OnOpen(),OnMessage(),OnClose(),OnError() .  We can use names as
> suggested.
>
> This is a one way dynamic loader, there's no such thing as an http
> server sending a message while a response is in progress, so OnMessage
> isn't required.
>
>
> > Dump dump offload happens using NBD protocol, it's like NBD over http.
> > In this  streaming use-case, data will be bidirectional as there will be
> nbd acknowledgement
> > for each nbd packet transferred to client. so thought to use
> "StreamSocket" name.
>
>
> HTTP (with the exception of websockets) is not bidirectional.  It's
> request->response.  Please do not break the HTTP protocol in this
> case.  If acknowledgement is needed, that would be a separate URL
> route, so you can track the state in the backend, or you can use
> websockets, which give a bidirectional socket API.
> I will try to go through the code and understand your use case, but it
> sounds a little odd to me.  Given we already have a websocket based
> nbd, was that not a good fit to your use case?
>
>
I do understand that HTTP is not bidirectional and works with
request-response model.
but  seems  HTTP/2 supports bidirectional stream
https://tools.ietf.org/html/rfc7540
stream:  A bidirectional flow of frames within the HTTP/2 connection.



> >
> >
> >> >     2) Create another redfish node class(as the existing node class
> is for dynamic route)
> >>
> >> which would call app.route with the streamSocket trait.Do you have any
> preference here?handleUpgrade() of router class gets invoked in the
> following conditions -
> >>
> >> The Redfish Node class is specifically for request->response type
> >> operations, and in the long run, I'd really like to see it just go
> >> away.  Today, it doesn't do anything more than the underlying router
> >> already does, and is missing a number of things, like typesafe
> >> parameter parsing, as well as copy-less parameters.  If it were me, I
> >> would simply model your dynamic responses around BMCWEB_ROUTE
> >>
> >>
> >>
> >> >     a)request contains http header(upgrade:websocket)
> >> >     b)request contains http header (accept: text/event-stream) --->
> yet to be upstreamedIn our use case for dump stream, we do not need to take
> this decision by looking at the request header as the URL is already
> registered with their associated rule(StreamSocketRule) class.When we
> search in the trie for a specific URL, we will get the associated rule
> class object, which in our case would be StreamSocketRule and the handle
> function of this class should make sure that socket is not closed.
> >> > Is my understanding correct understanding or do you have more
> suggestion on this?There is an active discussion going on in the following
> commit for the same.
> >> > https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/36038
> >>
> >> I think you've described what bmcweb does today.  In this case, we
> >> might want to just promote an "isUpgrade" method from the app, that we
> >> can use to determine if a given route is dynamic or not, and call into
> >> the correct "handleStream" operator.  Keep in mind that at some point
> >> you need to transfer control back to httpConnection to handle
> >> keepalive properly.
> >
> >
> >>
> >> Thinking about keepalive more gave me another thought: This isn't
> >> really an "upgrade" in the normal sense.  What if we just added a
> >> "write" method to the Response object that immediately wrote the
> >> payload to the dynamic body and sent it?  write() could return an
> >> error code in the cases where the client has disconnected, and we
> >> never have to transfer ownership or knowledge of the socket, and the
> >> keepalive and end() mechanisms would continue to work like normal.
> >> HttpConnection would have to get some knowledge about whether this
> >> request was dynamic or not, but that seems pretty doable, and could
> >> just be based on the first call to write.  Also, this keeps all the
> >> keepalive code the same, which I think is good.
> >>
> > That's exactly why we thought to use handle() method, but there is a gap
> how to transfer ownership
> > of socket from connection class to rule class.
> >
> > In the existing implementation where we transferred ownership of socket
> from connection class to rule class
> > based on  http header field "upgrade::websocket"
> >
> >  As I explained above, we need bi-directional communication, where bmc
> sends certain payload and nbd on client-side
> > acknowledges received payload.
> >
> > So we need websocket way of implementation, where we need to keep
> reading and writing constantly on the same socket.
>
> Why not just use websockets?  That's what they're designed to do.
>
>
We can't use websockets, Because how does the client knows that they need
to make the websocket request rather than HTTP.
Dump offload url is given as url, we don't specify the protocol in the url.

>
> > What I am unable to connect is how to transfer ownership of socket
> connection to new rule class, as in this case
> > we can't take the decision based on  request header/content. can you
> provide your suggestion  please?
>
> I think I know how to do it, but let's make sure it's the right thing
> to do before we commit to that.


ok. can you please explain your thoughts here?

> >
> > What do you mean by dynamic request and dynamic response?
>
> It's a concept within Beast, for a body that is streaming the output.
>
> > As per my understanding, dynamic response is based on http request
> content, one of the header field "accept"
> > where client specifies data format and depending on this format,
> response gets generated. Is it a dynamic response?
> > if it's true, how is it applicable here?
>
> No, dynamic requests and dynamic responses are where the http
> framework doesn't wait for the request to be done sending before
> reading it in.  It's generally used for large requests you don't want
> to buffer before sending.
>
>
> https://www.boost.org/doc/libs/1_74_0/libs/beast/doc/html/beast/ref/boost__beast__http__basic_dynamic_body.html
>



>
> > Response object writing payload to dynamic body may not work in this
> case.
> > Response object does not  hold  socket, only connection class which is
> having socket, except handleUpgrade case
> > where we transfer socket ownership to connection to rule class which
> creates another connection
>
> That's what I'm saying, don't transfer the ownership at all, just
> create a response API that allows you to send data to socket directly.
>
> >
> > Thanks
> > -Raviteja
> >
> >>
> >>
> >>
> >> >> On Fri, 28 Aug, 2020, 12:42 am Ed Tanous, <ed@tanous.net> wrote:
> >> >>>
> >> >>> On Sun, Aug 2, 2020 at 8:53 AM Ed Tanous <ed@tanous.net> wrote:
> >> >>> >
> >> >>> > I'm looking at a couple recent changes to bmcweb, and I'm finding
> a
> >> >>> > significant architecture problem has been injected.  Namely, it's
> >> >>> > these innocuous looking 4 lines here, which injects the socket
> adaptor
> >> >>> > into the request object for use later.
> >> >>> >
> https://github.com/openbmc/bmcweb/blob/30c58d581606b4484757e6ee9133c248de1514a6/http/http_request.h#L18
> >> >>> >
> >> >>> > The problem with this approach has a few roots:
> >> >>> > 1. The Request class is meant to model a single request, single
> >> >>> > response model.  Adding the stream semantics breaks this in pretty
> >> >>> > significant ways, and forces a hard dependency between the
> streaming
> >> >>> > adapter and the Request, which was not the intent.  We have
> >> >>> > abstractions for "streaming" requests, but that was seemingly not
> >> >>> > used.
> >> >>> >
> >> >>> > 2. In the code that existed before this, Adaptor was a template on
> >> >>> > purpose.  It is designed to implement the std::networking
> >> >>> > AsyncReadStream and AsyncWriteStream concepts.  This is designed
> to
> >> >>> > allow injection of Unit Tests at some point, as I've talked about
> >> >>> > before.  Hardcoding it in request to 2 forced stream types, based
> on
> >> >>> > the compiler flag is incorrect per asio standards, and removes the
> >> >>> > ability to inject arbitrary adapters, like test adaptors.  Also,
> the
> >> >>> > flag used is incorrect, as it's possible to inject a non-ssl
> socket
> >> >>> > even if SSL is enabled.
> >> >>> >
> >> >>> > 3. There is already a precedent and pattern for streaming
> interfaces
> >> >>> > in bmcweb that we adopted from Crow.  If you look at the Websocket
> >> >>> > request response type, it implements a way to request a route that
> >> >>> > streams dynamically.  Frustratingly, part of what this was used
> for
> >> >>> > was SSE, which I had already written a patch for that didn't have
> any
> >> >>> > of the above issues, and only hadn't merged it because we didn't
> have
> >> >>> > any SSE routes yet, and didn't want to check in dead code.
> >> >>> > https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/13948
> >> >>> >
> >> >>> > 4. It opens the possibility for lifetime and possible (at the very
> >> >>> > least harder to audit) security issues, as now the "http server"
> >> >>> > component is no longer the only thing that can own sockets.
> >> >>> > Previously, the server owned the sockets until handed off, then
> there
> >> >>> > was no shared ownership between the websocket class, and the
> >> >>> > Connection class.  The Connection class could be completely
> destroyed
> >> >>> > (and memory freed) while the websocket was still connected and
> >> >>> > running.
> >> >>> >
> >> >>> > Moving to another track, you may ask, how did I come across this
> and
> >> >>> > why does it matter?  I'm trying to add 2 new features to bmcweb.
> The
> >> >>> > first allows opening multiple sockets, and dynamically detecting
> TLS
> >> >>> > streams on them.  This allows bmcweb to handle both HTTPS
> redirects in
> >> >>> > band, and handle the case where users type in something erroneous,
> >> >>> > like "http://mybmc:443" and connect to an SSL socket with a
> non-ssl
> >> >>> > protocol.  In those cases, we can simply do the right thing.  It
> also
> >> >>> > allows bmcweb to host on multiple ports, which might be
> interesting
> >> >>> > for aggregator types.  More importantly, it cleans up some of the
> >> >>> > Adaptor abstraction to make way for unit testing, and being able
> to
> >> >>> > inject a "test" socket, that we can control the semantics of.  I'm
> >> >>> > hoping eventually to be able to mock dbus, and mock the TCP
> socket,
> >> >>> > and run a full Redfish validator run in a unit test.  I think that
> >> >>> > would save a lot of time overall for both committers and
> consumers.
> >> >>> >
> >> >>> > The first of these patches is posted here, and simply comments
> out the
> >> >>> > above problems for now.
> >> >>> > https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/35265
> >> >>> >
> >> >>> > If I look through the commit logs, it looks like Ravi and Appu
> built
> >> >>> > the two small subsystems that rely on the above abstraction, one
> for
> >> >>> > SSE, and one for some NBD streamer.
> >> >>> > What do you two think about the above?  Was it something you
> >> >>> > considered when you wrote your patches?  Would you consider fixing
> >> >>> > them?
> >> >>> >
> >> >>> >   My recommendation would be to move both of those two over to
> >> >>> > something similar to the websocket abstraction we have, with, on
> >> >>> > connect, on data, and on close handlers.  This means that
> handlers no
> >> >>> > longer take a hard dependency on the transport, which will help
> for
> >> >>> > both unit testing, and if we ever want to support redfish device
> >> >>> > enablement (which relies on an i2c based transport). The SSE one
> can
> >> >>> > probably be used more or less as-is from my old patch.  The NBD
> one
> >> >>> > might need a "Dynamic body" type, which beast already has an
> >> >>> > abstraction for that seems to have been discounted.
> >> >>> >
> >> >>> > What do you guys think?
> >> >>> >
> >> >>> > -Ed
> >> >>>
> >> >>>
> >> >>> It's been 3 weeks and I haven't gotten any replies to this pretty
> >> >>> major architecture break.  It also looks like it can also cause a
> >> >>> memory leak in HttpConnection here (found by code inspection here).
> >> >>>
> https://github.com/openbmc/bmcweb/blob/ebd459060ea4f42761402dd54acd0962c36136c2/http/http_connection.h#L351
> >> >>>
> >> >>> I've pushed a revert to remove the features in question.  I would
> love
> >> >>> some comments from the developers that caused these breakages, so I
> >> >>> can make sure I'm doing the right thing here, and I'm not completely
> >> >>> off base (or that you intend to fix them, and this patch is
> >> >>> unnecessary).
> >> >>> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/36038
> >> >>>
> >> >>> Thanks,
> >> >>>
> >> >>> -Ed
>

--000000000000ca723905ae756192
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div><br></div><div>Hi Ed,</div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
&gt; Exactly, we thought to implement 4 callables in new rule class similar=
 to=C2=A0 websocket<br>
&gt;=C2=A0 =C2=A0 OnOpen(),OnMessage(),OnClose(),OnError() .=C2=A0 We can u=
se names as suggested.<br>
<br>
This is a one way dynamic loader, there&#39;s no such thing as an http<br>
server sending a message while a response is in progress, so OnMessage<br>
isn&#39;t required.=C2=A0<br></blockquote><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
&gt;<br>
&gt; Dump dump offload happens using NBD protocol, it&#39;s like NBD over h=
ttp.<br>
&gt; In this=C2=A0 streaming use-case, data will be bidirectional as there =
will be nbd acknowledgement<br>
&gt; for each nbd packet transferred to client. so thought to use &quot;Str=
eamSocket&quot; name.<br>
<br>
<br>
HTTP (with the exception of websockets) is not bidirectional.=C2=A0 It&#39;=
s<br>
request-&gt;response.=C2=A0 Please do not break the HTTP protocol in this<b=
r>
case.=C2=A0 If acknowledgement is needed, that would be a separate URL<br>
route, so you can track the state in the backend, or you can use<br>
websockets, which give a bidirectional socket API.<br>
I will try to go through the code and understand your use case, but it<br>
sounds a little odd to me.=C2=A0 Given we already have a websocket based<br=
>
nbd, was that not a good fit to your use case?<br>
<br></blockquote><div><br>I do understand that HTTP is not=C2=A0bidirection=
al and works with request-response model.<br>but=C2=A0 seems=C2=A0 HTTP/2 s=
upports bidirectional stream</div><a href=3D"https://tools.ietf.org/html/rf=
c7540">https://tools.ietf.org/html/rfc7540</a><br>stream:=C2=A0 A bidirecti=
onal flow of frames within the HTTP/2 connection.<br><div><span class=3D"gm=
ail-c-message__edited_label" dir=3D"ltr" style=3D"box-sizing:inherit;font-s=
ize:13px;white-space:nowrap;font-family:Slack-Lato,appleLogo,sans-serif;fon=
t-variant-ligatures:common-ligatures;background-color:rgb(248,248,248)">=C2=
=A0</span>=C2=A0<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
&gt;<br>
&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A02) Create another redfish node class(as th=
e existing node class is for dynamic route)<br>
&gt;&gt;<br>
&gt;&gt; which would call app.route with the streamSocket trait.Do you have=
 any preference here?handleUpgrade() of router class gets invoked in the fo=
llowing conditions -<br>
&gt;&gt;<br>
&gt;&gt; The Redfish Node class is specifically for request-&gt;response ty=
pe<br>
&gt;&gt; operations, and in the long run, I&#39;d really like to see it jus=
t go<br>
&gt;&gt; away.=C2=A0 Today, it doesn&#39;t do anything more than the underl=
ying router<br>
&gt;&gt; already does, and is missing a number of things, like typesafe<br>
&gt;&gt; parameter parsing, as well as copy-less parameters.=C2=A0 If it we=
re me, I<br>
&gt;&gt; would simply model your dynamic responses around BMCWEB_ROUTE<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0a)request contains http header(upgrade:web=
socket)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0b)request contains http header (accept: te=
xt/event-stream) ---&gt; yet to be upstreamedIn our use case for dump strea=
m, we do not need to take this decision by looking at the request header as=
 the URL is already registered with their associated rule(StreamSocketRule)=
 class.When we search in the trie for a specific URL, we will get the assoc=
iated rule class object, which in our case would be StreamSocketRule and th=
e handle function of this class should make sure that socket is not closed.=
<br>
&gt;&gt; &gt; Is my understanding correct understanding or do you have more=
 suggestion on this?There is an active discussion going on in the following=
 commit for the same.<br>
&gt;&gt; &gt; <a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/bmcwe=
b/+/36038" rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc-proj=
ect.xyz/c/openbmc/bmcweb/+/36038</a><br>
&gt;&gt;<br>
&gt;&gt; I think you&#39;ve described what bmcweb does today.=C2=A0 In this=
 case, we<br>
&gt;&gt; might want to just promote an &quot;isUpgrade&quot; method from th=
e app, that we<br>
&gt;&gt; can use to determine if a given route is dynamic or not, and call =
into<br>
&gt;&gt; the correct &quot;handleStream&quot; operator.=C2=A0 Keep in mind =
that at some point<br>
&gt;&gt; you need to transfer control back to httpConnection to handle<br>
&gt;&gt; keepalive properly.<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Thinking about keepalive more gave me another thought: This isn&#3=
9;t<br>
&gt;&gt; really an &quot;upgrade&quot; in the normal sense.=C2=A0 What if w=
e just added a<br>
&gt;&gt; &quot;write&quot; method to the Response object that immediately w=
rote the<br>
&gt;&gt; payload to the dynamic body and sent it?=C2=A0 write() could retur=
n an<br>
&gt;&gt; error code in the cases where the client has disconnected, and we<=
br>
&gt;&gt; never have to transfer ownership or knowledge of the socket, and t=
he<br>
&gt;&gt; keepalive and end() mechanisms would continue to work like normal.=
<br>
&gt;&gt; HttpConnection would have to get some knowledge about whether this=
<br>
&gt;&gt; request was dynamic or not, but that seems pretty doable, and coul=
d<br>
&gt;&gt; just be based on the first call to write.=C2=A0 Also, this keeps a=
ll the<br>
&gt;&gt; keepalive code the same, which I think is good.<br>
&gt;&gt;<br>
&gt; That&#39;s exactly why we thought to use handle() method, but there is=
 a gap how to transfer ownership<br>
&gt; of socket from connection class to rule class.<br>
&gt;<br>
&gt; In the existing implementation where we transferred ownership of socke=
t from connection class to rule class<br>
&gt; based on=C2=A0 http header field &quot;upgrade::websocket&quot;<br>
&gt;<br>
&gt;=C2=A0 As I explained above, we need bi-directional communication, wher=
e bmc sends certain payload and nbd on client-side<br>
&gt; acknowledges received payload.<br>
&gt;<br>
&gt; So we need websocket way of implementation, where we need to keep read=
ing and writing constantly on the same socket.<br>
<br>
Why not just use websockets?=C2=A0 That&#39;s what they&#39;re designed to =
do.<br><br></blockquote><div class=3D"gmail_quote"><br></div>We can&#39;t u=
se websockets, Because how does the client knows that they need to make the=
 websocket request rather than HTTP.</div><div class=3D"gmail_quote">Dump o=
ffload url is given as url, we don&#39;t specify the protocol in the url.</=
div><div class=3D"gmail_quote">=C2=A0<blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
&gt; What I am unable to connect is how to transfer ownership of socket con=
nection to new rule class, as in this case<br>
&gt; we can&#39;t take the decision based on=C2=A0 request header/content. =
can you provide your suggestion=C2=A0 please?<br>
<br>
I think I know how to do it, but let&#39;s make sure it&#39;s the right thi=
ng<br>
to do before we commit to that.</blockquote><div>=C2=A0=C2=A0</div><div>ok.=
 can you please explain your thoughts here?=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
&gt;<br>
&gt; What do you mean by dynamic request and dynamic response?<br>
<br>
It&#39;s a concept within Beast, for a body that is streaming the output.<b=
r>
<br>
&gt; As per my understanding, dynamic response is based on http request con=
tent, one of the header field &quot;accept&quot;<br>
&gt; where client specifies data format and depending on this format, respo=
nse gets generated. Is it a dynamic response?<br>
&gt; if it&#39;s true, how is it applicable here?<br>
<br>
No, dynamic requests and dynamic responses are where the http<br>
framework doesn&#39;t wait for the request to be done sending before<br>
reading it in.=C2=A0 It&#39;s generally used for large requests you don&#39=
;t want<br>
to buffer before sending.<br>
<br>
<a href=3D"https://www.boost.org/doc/libs/1_74_0/libs/beast/doc/html/beast/=
ref/boost__beast__http__basic_dynamic_body.html" rel=3D"noreferrer" target=
=3D"_blank">https://www.boost.org/doc/libs/1_74_0/libs/beast/doc/html/beast=
/ref/boost__beast__http__basic_dynamic_body.html</a>=C2=A0</blockquote><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0</blockquote><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt; Response object writing payload to dynamic body may not work in this c=
ase.<br>
&gt; Response object does not=C2=A0 hold=C2=A0 socket, only connection clas=
s which is having socket, except handleUpgrade case<br>
&gt; where we transfer socket ownership to connection to rule class which c=
reates another connection<br>
<br>
That&#39;s what I&#39;m saying, don&#39;t transfer the ownership at all, ju=
st<br>
create a response API that allows you to send data to socket directly.<br>
<br>
&gt;<br>
&gt; Thanks<br>
&gt; -Raviteja<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt;&gt; On Fri, 28 Aug, 2020, 12:42 am Ed Tanous, &lt;<a href=3D"=
mailto:ed@tanous.net" target=3D"_blank">ed@tanous.net</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; On Sun, Aug 2, 2020 at 8:53 AM Ed Tanous &lt;<a href=
=3D"mailto:ed@tanous.net" target=3D"_blank">ed@tanous.net</a>&gt; wrote:<br=
>
&gt;&gt; &gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt; I&#39;m looking at a couple recent changes to bm=
cweb, and I&#39;m finding a<br>
&gt;&gt; &gt;&gt;&gt; &gt; significant architecture problem has been inject=
ed.=C2=A0 Namely, it&#39;s<br>
&gt;&gt; &gt;&gt;&gt; &gt; these innocuous looking 4 lines here, which inje=
cts the socket adaptor<br>
&gt;&gt; &gt;&gt;&gt; &gt; into the request object for use later.<br>
&gt;&gt; &gt;&gt;&gt; &gt; <a href=3D"https://github.com/openbmc/bmcweb/blo=
b/30c58d581606b4484757e6ee9133c248de1514a6/http/http_request.h#L18" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/openbmc/bmcweb/blob/30c58d=
581606b4484757e6ee9133c248de1514a6/http/http_request.h#L18</a><br>
&gt;&gt; &gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt; The problem with this approach has a few roots:<=
br>
&gt;&gt; &gt;&gt;&gt; &gt; 1. The Request class is meant to model a single =
request, single<br>
&gt;&gt; &gt;&gt;&gt; &gt; response model.=C2=A0 Adding the stream semantic=
s breaks this in pretty<br>
&gt;&gt; &gt;&gt;&gt; &gt; significant ways, and forces a hard dependency b=
etween the streaming<br>
&gt;&gt; &gt;&gt;&gt; &gt; adapter and the Request, which was not the inten=
t.=C2=A0 We have<br>
&gt;&gt; &gt;&gt;&gt; &gt; abstractions for &quot;streaming&quot; requests,=
 but that was seemingly not<br>
&gt;&gt; &gt;&gt;&gt; &gt; used.<br>
&gt;&gt; &gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt; 2. In the code that existed before this, Adaptor=
 was a template on<br>
&gt;&gt; &gt;&gt;&gt; &gt; purpose.=C2=A0 It is designed to implement the s=
td::networking<br>
&gt;&gt; &gt;&gt;&gt; &gt; AsyncReadStream and AsyncWriteStream concepts.=
=C2=A0 This is designed to<br>
&gt;&gt; &gt;&gt;&gt; &gt; allow injection of Unit Tests at some point, as =
I&#39;ve talked about<br>
&gt;&gt; &gt;&gt;&gt; &gt; before.=C2=A0 Hardcoding it in request to 2 forc=
ed stream types, based on<br>
&gt;&gt; &gt;&gt;&gt; &gt; the compiler flag is incorrect per asio standard=
s, and removes the<br>
&gt;&gt; &gt;&gt;&gt; &gt; ability to inject arbitrary adapters, like test =
adaptors.=C2=A0 Also, the<br>
&gt;&gt; &gt;&gt;&gt; &gt; flag used is incorrect, as it&#39;s possible to =
inject a non-ssl socket<br>
&gt;&gt; &gt;&gt;&gt; &gt; even if SSL is enabled.<br>
&gt;&gt; &gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt; 3. There is already a precedent and pattern for =
streaming interfaces<br>
&gt;&gt; &gt;&gt;&gt; &gt; in bmcweb that we adopted from Crow.=C2=A0 If yo=
u look at the Websocket<br>
&gt;&gt; &gt;&gt;&gt; &gt; request response type, it implements a way to re=
quest a route that<br>
&gt;&gt; &gt;&gt;&gt; &gt; streams dynamically.=C2=A0 Frustratingly, part o=
f what this was used for<br>
&gt;&gt; &gt;&gt;&gt; &gt; was SSE, which I had already written a patch for=
 that didn&#39;t have any<br>
&gt;&gt; &gt;&gt;&gt; &gt; of the above issues, and only hadn&#39;t merged =
it because we didn&#39;t have<br>
&gt;&gt; &gt;&gt;&gt; &gt; any SSE routes yet, and didn&#39;t want to check=
 in dead code.<br>
&gt;&gt; &gt;&gt;&gt; &gt; <a href=3D"https://gerrit.openbmc-project.xyz/c/=
openbmc/bmcweb/+/13948" rel=3D"noreferrer" target=3D"_blank">https://gerrit=
.openbmc-project.xyz/c/openbmc/bmcweb/+/13948</a><br>
&gt;&gt; &gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt; 4. It opens the possibility for lifetime and pos=
sible (at the very<br>
&gt;&gt; &gt;&gt;&gt; &gt; least harder to audit) security issues, as now t=
he &quot;http server&quot;<br>
&gt;&gt; &gt;&gt;&gt; &gt; component is no longer the only thing that can o=
wn sockets.<br>
&gt;&gt; &gt;&gt;&gt; &gt; Previously, the server owned the sockets until h=
anded off, then there<br>
&gt;&gt; &gt;&gt;&gt; &gt; was no shared ownership between the websocket cl=
ass, and the<br>
&gt;&gt; &gt;&gt;&gt; &gt; Connection class.=C2=A0 The Connection class cou=
ld be completely destroyed<br>
&gt;&gt; &gt;&gt;&gt; &gt; (and memory freed) while the websocket was still=
 connected and<br>
&gt;&gt; &gt;&gt;&gt; &gt; running.<br>
&gt;&gt; &gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt; Moving to another track, you may ask, how did I =
come across this and<br>
&gt;&gt; &gt;&gt;&gt; &gt; why does it matter?=C2=A0 I&#39;m trying to add =
2 new features to bmcweb.=C2=A0 The<br>
&gt;&gt; &gt;&gt;&gt; &gt; first allows opening multiple sockets, and dynam=
ically detecting TLS<br>
&gt;&gt; &gt;&gt;&gt; &gt; streams on them.=C2=A0 This allows bmcweb to han=
dle both HTTPS redirects in<br>
&gt;&gt; &gt;&gt;&gt; &gt; band, and handle the case where users type in so=
mething erroneous,<br>
&gt;&gt; &gt;&gt;&gt; &gt; like &quot;<a href=3D"http://mybmc:443" rel=3D"n=
oreferrer" target=3D"_blank">http://mybmc:443</a>&quot; and connect to an S=
SL socket with a non-ssl<br>
&gt;&gt; &gt;&gt;&gt; &gt; protocol.=C2=A0 In those cases, we can simply do=
 the right thing.=C2=A0 It also<br>
&gt;&gt; &gt;&gt;&gt; &gt; allows bmcweb to host on multiple ports, which m=
ight be interesting<br>
&gt;&gt; &gt;&gt;&gt; &gt; for aggregator types.=C2=A0 More importantly, it=
 cleans up some of the<br>
&gt;&gt; &gt;&gt;&gt; &gt; Adaptor abstraction to make way for unit testing=
, and being able to<br>
&gt;&gt; &gt;&gt;&gt; &gt; inject a &quot;test&quot; socket, that we can co=
ntrol the semantics of.=C2=A0 I&#39;m<br>
&gt;&gt; &gt;&gt;&gt; &gt; hoping eventually to be able to mock dbus, and m=
ock the TCP socket,<br>
&gt;&gt; &gt;&gt;&gt; &gt; and run a full Redfish validator run in a unit t=
est.=C2=A0 I think that<br>
&gt;&gt; &gt;&gt;&gt; &gt; would save a lot of time overall for both commit=
ters and consumers.<br>
&gt;&gt; &gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt; The first of these patches is posted here, and s=
imply comments out the<br>
&gt;&gt; &gt;&gt;&gt; &gt; above problems for now.<br>
&gt;&gt; &gt;&gt;&gt; &gt; <a href=3D"https://gerrit.openbmc-project.xyz/c/=
openbmc/bmcweb/+/35265" rel=3D"noreferrer" target=3D"_blank">https://gerrit=
.openbmc-project.xyz/c/openbmc/bmcweb/+/35265</a><br>
&gt;&gt; &gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt; If I look through the commit logs, it looks like=
 Ravi and Appu built<br>
&gt;&gt; &gt;&gt;&gt; &gt; the two small subsystems that rely on the above =
abstraction, one for<br>
&gt;&gt; &gt;&gt;&gt; &gt; SSE, and one for some NBD streamer.<br>
&gt;&gt; &gt;&gt;&gt; &gt; What do you two think about the above?=C2=A0 Was=
 it something you<br>
&gt;&gt; &gt;&gt;&gt; &gt; considered when you wrote your patches?=C2=A0 Wo=
uld you consider fixing<br>
&gt;&gt; &gt;&gt;&gt; &gt; them?<br>
&gt;&gt; &gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;=C2=A0 =C2=A0My recommendation would be to move b=
oth of those two over to<br>
&gt;&gt; &gt;&gt;&gt; &gt; something similar to the websocket abstraction w=
e have, with, on<br>
&gt;&gt; &gt;&gt;&gt; &gt; connect, on data, and on close handlers.=C2=A0 T=
his means that handlers no<br>
&gt;&gt; &gt;&gt;&gt; &gt; longer take a hard dependency on the transport, =
which will help for<br>
&gt;&gt; &gt;&gt;&gt; &gt; both unit testing, and if we ever want to suppor=
t redfish device<br>
&gt;&gt; &gt;&gt;&gt; &gt; enablement (which relies on an i2c based transpo=
rt). The SSE one can<br>
&gt;&gt; &gt;&gt;&gt; &gt; probably be used more or less as-is from my old =
patch.=C2=A0 The NBD one<br>
&gt;&gt; &gt;&gt;&gt; &gt; might need a &quot;Dynamic body&quot; type, whic=
h beast already has an<br>
&gt;&gt; &gt;&gt;&gt; &gt; abstraction for that seems to have been discount=
ed.<br>
&gt;&gt; &gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt; What do you guys think?<br>
&gt;&gt; &gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt; -Ed<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; It&#39;s been 3 weeks and I haven&#39;t gotten any re=
plies to this pretty<br>
&gt;&gt; &gt;&gt;&gt; major architecture break.=C2=A0 It also looks like it=
 can also cause a<br>
&gt;&gt; &gt;&gt;&gt; memory leak in HttpConnection here (found by code ins=
pection here).<br>
&gt;&gt; &gt;&gt;&gt; <a href=3D"https://github.com/openbmc/bmcweb/blob/ebd=
459060ea4f42761402dd54acd0962c36136c2/http/http_connection.h#L351" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/openbmc/bmcweb/blob/ebd4590=
60ea4f42761402dd54acd0962c36136c2/http/http_connection.h#L351</a><br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; I&#39;ve pushed a revert to remove the features in qu=
estion.=C2=A0 I would love<br>
&gt;&gt; &gt;&gt;&gt; some comments from the developers that caused these b=
reakages, so I<br>
&gt;&gt; &gt;&gt;&gt; can make sure I&#39;m doing the right thing here, and=
 I&#39;m not completely<br>
&gt;&gt; &gt;&gt;&gt; off base (or that you intend to fix them, and this pa=
tch is<br>
&gt;&gt; &gt;&gt;&gt; unnecessary).<br>
&gt;&gt; &gt;&gt;&gt; <a href=3D"https://gerrit.openbmc-project.xyz/c/openb=
mc/bmcweb/+/36038" rel=3D"noreferrer" target=3D"_blank">https://gerrit.open=
bmc-project.xyz/c/openbmc/bmcweb/+/36038</a><br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; Thanks,<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; -Ed<br>
</blockquote></div></div>

--000000000000ca723905ae756192--
