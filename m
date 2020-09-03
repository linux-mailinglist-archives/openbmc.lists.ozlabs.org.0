Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1D025C0D9
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 14:21:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bj0Kk0L4wzDr6B
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 22:21:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=raviteja28031990@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pR+PzpEv; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bj0JH6y3szDr4m
 for <openbmc@lists.ozlabs.org>; Thu,  3 Sep 2020 22:20:31 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id o68so2205548pfg.2
 for <openbmc@lists.ozlabs.org>; Thu, 03 Sep 2020 05:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v0F4T4sGgZ9SpFeBJvHXXvHD3y6vBxKRuMtXjgonNXA=;
 b=pR+PzpEvibSlKL0dnV9UtPfwL2aOpXw5B+jUOxWZ9sC4P+oLjFZDGOr1r8ssoBXk8b
 ivR5Z+EwXDWv27zK2Tm2xrUKv2OYNJrGABLwM4Dkq3/q06hdh1g2fP6VqXL+1S33uuZC
 bvXN3ZF/HZ4TZCAjoaCJBwDaBmhpndnvXiyk6eUn5hKHIrtzOddlgEeaTH4tvCPCGcLI
 g9y8WEmHsJff59e6rJpjqiApNY0HGN/uEleg8ZJG6os16HFr3OR50x2lgHmY+NlsAu4e
 2Yr4nlAPSv8Jg7pGUU5fX3vuL14A4UMxoGQ7vYkFKe7TMFUva3FxESvZw4zpBm7LMzrW
 qtyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v0F4T4sGgZ9SpFeBJvHXXvHD3y6vBxKRuMtXjgonNXA=;
 b=Td7mPSB7dupbaUvzCWo657exoHxFUA1cbJtWSD3mD4hCFvPcqaaxS6MyLNclH7gbhG
 TXIzZG9IsJ3NMdJOyeL14nMZEEcfXdr56kmTArJqT/0mx4uyE3E3fW6V1hmtVrmpXLy6
 o2FFbv2VNtjwz6NWQC2S2VkD5udYxPAZQ5lEvbJfZtD+cU9kbQM1vFNu7QTFpKMFLA4+
 RfgeUtWuD2SPSzF41lm/BBglATV5WLlPx2uhIUGdbkAzmlmlbnR/Wzu9lm05AdBCJ4ax
 CVP7GKhE7p04/KYqWddbipe5Ym7tspX1qlkJhO2nhEbaKhdA3dHL8HZcYBJZpi3q0G1s
 N7UQ==
X-Gm-Message-State: AOAM531d7Ebv0VaA1WpNpXFgSubX0A6ZxZeK6k5Zh6JK3bhs+YmqHzfO
 qu3sekWlVpZiIGoH3P7LFbyZcCmjOdoORKQnNoKGoeGw0QQ=
X-Google-Smtp-Source: ABdhPJxElC738qSUBzZiC+L+XuVO7HJygIDbtiyoN3pHtwXqpqMwPscsDWx1tfcTWjItfeaa8x4QdtZwNSCm+80A2HU=
X-Received: by 2002:a63:6503:: with SMTP id z3mr2770926pgb.421.1599135627734; 
 Thu, 03 Sep 2020 05:20:27 -0700 (PDT)
MIME-Version: 1.0
References: <CACWQX82sSvONiMq53s39P42Sky5C+GsvLGyN42xvKUYSGHjyrQ@mail.gmail.com>
 <CACWQX82=j3QiYotB1ynOor=HkuMEmyDxa=aNr7_uGwkfuFXJaA@mail.gmail.com>
 <CAM4DKZm7PxT2=OaFQonP0yBTDjcNjssvw46QbDNG30qUKydeqw@mail.gmail.com>
 <CAM4DKZkE6JTP0jMF0j90KQxkBVxtDXP2TP=e45cQGRP-AqvGfQ@mail.gmail.com>
 <CACWQX836e0w2kP0R3+MSUzyHU_KcipHHv_21NsZdudVeteJaYA@mail.gmail.com>
In-Reply-To: <CACWQX836e0w2kP0R3+MSUzyHU_KcipHHv_21NsZdudVeteJaYA@mail.gmail.com>
From: raviteja bailapudi <raviteja28031990@gmail.com>
Date: Thu, 3 Sep 2020 17:50:16 +0530
Message-ID: <CAM4DKZmZV2gNaFQG1+OaAhDGo+V_TVSeuEqvo7FV0ow9Dp8E1g@mail.gmail.com>
Subject: Re: Recent architecture breakages to bmcweb
To: Ed Tanous <ed@tanous.net>
Content-Type: multipart/alternative; boundary="00000000000009f8d105ae67c762"
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

--00000000000009f8d105ae67c762
Content-Type: text/plain; charset="UTF-8"

Ed,

Thank you so much for quick response.

>    1) Create StreamSocketRule and StreamSocket classes as like as
> websocket
> >    2) Add one more RuleParameterTraits for StreamSocketTwo ways to
> invoke this new class -
> >     1) Create static bmcweb route for each logservice with dump uri
> with specific rule trait for streamsocket
> >       eg:
> >         BMCWEB_ROUTE(app, "/system/LogServices/Dump/attachment/<str>",id)
> >         .privileges({"ConfigureComponents", "ConfigureManager"})
> >         .streamsocket()
>
> I'd much rather call it "dyamicResponse" and have it take 3 callables,
> one for onRequest, that accepts a Request and a Response object, like
> a normal handler, one for onData, that accepts a buffer of the body
> data, and one for onClose, that informs the calling code the socket
> was closed.



Exactly, we thought to implement 4 callables in new rule class similar to
websocket
   OnOpen(),OnMessage(),OnClose(),OnError() .  We can use names as
suggested.

Dump dump offload happens using NBD protocol, it's like NBD over http.
In this  streaming use-case, data will be bidirectional as there will be
nbd acknowledgement
for each nbd packet transferred to client. so thought to use "StreamSocket"
name.


>     2) Create another redfish node class(as the existing node class is
> for dynamic route)

which would call app.route with the streamSocket trait.Do you have any
> preference here?handleUpgrade() of router class gets invoked in the
> following conditions -
>
> The Redfish Node class is specifically for request->response type
> operations, and in the long run, I'd really like to see it just go
> away.  Today, it doesn't do anything more than the underlying router
> already does, and is missing a number of things, like typesafe
> parameter parsing, as well as copy-less parameters.  If it were me, I
> would simply model your dynamic responses around BMCWEB_ROUTE


>
>     a)request contains http header(upgrade:websocket)
> >     b)request contains http header (accept: text/event-stream) ---> yet
> to be upstreamedIn our use case for dump stream, we do not need to take
> this decision by looking at the request header as the URL is already
> registered with their associated rule(StreamSocketRule) class.When we
> search in the trie for a specific URL, we will get the associated rule
> class object, which in our case would be StreamSocketRule and the handle
> function of this class should make sure that socket is not closed.
> > Is my understanding correct understanding or do you have more suggestion
> on this?There is an active discussion going on in the following commit for
> the same.
> > https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/36038
>
> I think you've described what bmcweb does today.  In this case, we
> might want to just promote an "isUpgrade" method from the app, that we
> can use to determine if a given route is dynamic or not, and call into
> the correct "handleStream" operator.  Keep in mind that at some point
> you need to transfer control back to httpConnection to handle
> keepalive properly.
>


> Thinking about keepalive more gave me another thought: This isn't
> really an "upgrade" in the normal sense.  What if we just added a
> "write" method to the Response object that immediately wrote the
> payload to the dynamic body and sent it?  write() could return an
> error code in the cases where the client has disconnected, and we
> never have to transfer ownership or knowledge of the socket, and the
> keepalive and end() mechanisms would continue to work like normal.
> HttpConnection would have to get some knowledge about whether this
> request was dynamic or not, but that seems pretty doable, and could
> just be based on the first call to write.  Also, this keeps all the
> keepalive code the same, which I think is good.
>
> That's exactly why we thought to use handle() method, but* there is a gap
how to transfer ownership*
*of socket from connection class to rule class.*

In the existing implementation where we transferred ownership of socket
from connection class to rule class
based on  http header field "upgrade::websocket"

 As I explained above, we need bi-directional communication, where bmc
sends certain payload and nbd on client-side
acknowledges received payload.

So we need websocket way of implementation, where we need to keep reading
and writing constantly on the same socket.

What I am unable to connect is how to transfer ownership of socket
connection to new rule class, as in this case
we can't take the decision based on  request header/content. can you
provide your suggestion  please?

What do you mean by dynamic request and dynamic response?
As per my understanding, dynamic response is based on http request content,
one of the header field "accept"
where client specifies data format and depending on this format,
response gets generated. Is it a dynamic response?
if it's true, how is it applicable here?

Response object writing payload to dynamic body may not work in this case.
Response object does not  hold  socket, only connection class which is
having socket, except handleUpgrade case
where we transfer socket ownership to connection to rule class which
creates another connection

Thanks
-Raviteja


>
>
> >> On Fri, 28 Aug, 2020, 12:42 am Ed Tanous, <ed@tanous.net> wrote:
> >>>
> >>> On Sun, Aug 2, 2020 at 8:53 AM Ed Tanous <ed@tanous.net> wrote:
> >>> >
> >>> > I'm looking at a couple recent changes to bmcweb, and I'm finding a
> >>> > significant architecture problem has been injected.  Namely, it's
> >>> > these innocuous looking 4 lines here, which injects the socket
> adaptor
> >>> > into the request object for use later.
> >>> >
> https://github.com/openbmc/bmcweb/blob/30c58d581606b4484757e6ee9133c248de1514a6/http/http_request.h#L18
> >>> >
> >>> > The problem with this approach has a few roots:
> >>> > 1. The Request class is meant to model a single request, single
> >>> > response model.  Adding the stream semantics breaks this in pretty
> >>> > significant ways, and forces a hard dependency between the streaming
> >>> > adapter and the Request, which was not the intent.  We have
> >>> > abstractions for "streaming" requests, but that was seemingly not
> >>> > used.
> >>> >
> >>> > 2. In the code that existed before this, Adaptor was a template on
> >>> > purpose.  It is designed to implement the std::networking
> >>> > AsyncReadStream and AsyncWriteStream concepts.  This is designed to
> >>> > allow injection of Unit Tests at some point, as I've talked about
> >>> > before.  Hardcoding it in request to 2 forced stream types, based on
> >>> > the compiler flag is incorrect per asio standards, and removes the
> >>> > ability to inject arbitrary adapters, like test adaptors.  Also, the
> >>> > flag used is incorrect, as it's possible to inject a non-ssl socket
> >>> > even if SSL is enabled.
> >>> >
> >>> > 3. There is already a precedent and pattern for streaming interfaces
> >>> > in bmcweb that we adopted from Crow.  If you look at the Websocket
> >>> > request response type, it implements a way to request a route that
> >>> > streams dynamically.  Frustratingly, part of what this was used for
> >>> > was SSE, which I had already written a patch for that didn't have any
> >>> > of the above issues, and only hadn't merged it because we didn't have
> >>> > any SSE routes yet, and didn't want to check in dead code.
> >>> > https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/13948
> >>> >
> >>> > 4. It opens the possibility for lifetime and possible (at the very
> >>> > least harder to audit) security issues, as now the "http server"
> >>> > component is no longer the only thing that can own sockets.
> >>> > Previously, the server owned the sockets until handed off, then there
> >>> > was no shared ownership between the websocket class, and the
> >>> > Connection class.  The Connection class could be completely destroyed
> >>> > (and memory freed) while the websocket was still connected and
> >>> > running.
> >>> >
> >>> > Moving to another track, you may ask, how did I come across this and
> >>> > why does it matter?  I'm trying to add 2 new features to bmcweb.  The
> >>> > first allows opening multiple sockets, and dynamically detecting TLS
> >>> > streams on them.  This allows bmcweb to handle both HTTPS redirects
> in
> >>> > band, and handle the case where users type in something erroneous,
> >>> > like "http://mybmc:443" and connect to an SSL socket with a non-ssl
> >>> > protocol.  In those cases, we can simply do the right thing.  It also
> >>> > allows bmcweb to host on multiple ports, which might be interesting
> >>> > for aggregator types.  More importantly, it cleans up some of the
> >>> > Adaptor abstraction to make way for unit testing, and being able to
> >>> > inject a "test" socket, that we can control the semantics of.  I'm
> >>> > hoping eventually to be able to mock dbus, and mock the TCP socket,
> >>> > and run a full Redfish validator run in a unit test.  I think that
> >>> > would save a lot of time overall for both committers and consumers.
> >>> >
> >>> > The first of these patches is posted here, and simply comments out
> the
> >>> > above problems for now.
> >>> > https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/35265
> >>> >
> >>> > If I look through the commit logs, it looks like Ravi and Appu built
> >>> > the two small subsystems that rely on the above abstraction, one for
> >>> > SSE, and one for some NBD streamer.
> >>> > What do you two think about the above?  Was it something you
> >>> > considered when you wrote your patches?  Would you consider fixing
> >>> > them?
> >>> >
> >>> >   My recommendation would be to move both of those two over to
> >>> > something similar to the websocket abstraction we have, with, on
> >>> > connect, on data, and on close handlers.  This means that handlers no
> >>> > longer take a hard dependency on the transport, which will help for
> >>> > both unit testing, and if we ever want to support redfish device
> >>> > enablement (which relies on an i2c based transport). The SSE one can
> >>> > probably be used more or less as-is from my old patch.  The NBD one
> >>> > might need a "Dynamic body" type, which beast already has an
> >>> > abstraction for that seems to have been discounted.
> >>> >
> >>> > What do you guys think?
> >>> >
> >>> > -Ed
> >>>
> >>>
> >>> It's been 3 weeks and I haven't gotten any replies to this pretty
> >>> major architecture break.  It also looks like it can also cause a
> >>> memory leak in HttpConnection here (found by code inspection here).
> >>>
> https://github.com/openbmc/bmcweb/blob/ebd459060ea4f42761402dd54acd0962c36136c2/http/http_connection.h#L351
> >>>
> >>> I've pushed a revert to remove the features in question.  I would love
> >>> some comments from the developers that caused these breakages, so I
> >>> can make sure I'm doing the right thing here, and I'm not completely
> >>> off base (or that you intend to fix them, and this patch is
> >>> unnecessary).
> >>> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/36038
> >>>
> >>> Thanks,
> >>>
> >>> -Ed
>

--00000000000009f8d105ae67c762
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>=C2=A0 <br>Ed,<br><br>Thank you so much for quick res=
ponse.=C2=A0<br><br></div><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 1) Create StreamSocketRule and StreamSocket classes as li=
ke as websocket<br>
&gt;=C2=A0 =C2=A0 2) Add one more RuleParameterTraits for StreamSocketTwo w=
ays to invoke this new class -<br>
&gt;=C2=A0 =C2=A0 =C2=A01) Create static bmcweb route for each logservice w=
ith dump uri=C2=A0 with specific rule trait for streamsocket<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0eg:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BMCWEB_ROUTE(app, &quot;/system/LogSe=
rvices/Dump/attachment/&lt;str&gt;&quot;,id)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.privileges({&quot;ConfigureComponent=
s&quot;, &quot;ConfigureManager&quot;})<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.streamsocket()<br>
<br>
I&#39;d much rather call it &quot;dyamicResponse&quot; and have it take 3 c=
allables,<br>
one for onRequest, that accepts a Request and a Response object, like<br>
a normal handler, one for onData, that accepts a buffer of the body<br>
data, and one for onClose, that informs the calling code the socket<br>
was closed.</blockquote><div>=C2=A0<br>=C2=A0<br>Exactly, we thought to imp=
lement 4 callables in new rule class similar to=C2=A0 websocket<br>=C2=A0 =
=C2=A0OnOpen(),OnMessage(),OnClose(),OnError() .=C2=A0 We can use names as =
suggested.=C2=A0<br><br>Dump dump offload happens using NBD protocol, it&#3=
9;s like NBD over http.<br>In this=C2=A0 streaming use-case, data will be b=
idirectional as there will be nbd acknowledgement <br>for each nbd packet t=
ransferred to client. so thought to use=C2=A0&quot;StreamSocket&quot; name.=
=C2=A0<br><br><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A02) Create another redfish node class(as the existin=
g node class is for dynamic route)=C2=A0</blockquote><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">which would call app.route with the streamSocke=
t trait.Do you have any preference here?handleUpgrade() of router class get=
s invoked in the following conditions -<br>
<br>
The Redfish Node class is specifically for request-&gt;response type<br>
operations, and in the long run, I&#39;d really like to see it just go<br>
away.=C2=A0 Today, it doesn&#39;t do anything more than the underlying rout=
er<br>
already does, and is missing a number of things, like typesafe<br>
parameter parsing, as well as copy-less parameters.=C2=A0 If it were me, I<=
br>
would simply model your dynamic responses around BMCWEB_ROUTE=C2=A0</blockq=
uote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0<br></blockquo=
te><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0a)request contains http header(upgrade:websocket)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0b)request contains http header (accept: text/event-=
stream) ---&gt; yet to be upstreamedIn our use case for dump stream, we do =
not need to take this decision by looking at the request header as the URL =
is already registered with their associated rule(StreamSocketRule) class.Wh=
en we search in the trie for a specific URL, we will get the associated rul=
e class object, which in our case would be StreamSocketRule and the handle =
function of this class should make sure that socket is not closed.<br>
&gt; Is my understanding correct understanding or do you have more suggesti=
on on this?There is an active discussion going on in the following commit f=
or the same.<br>
&gt; <a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/36038=
" rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc-project.xyz/c=
/openbmc/bmcweb/+/36038</a><br>
<br>
I think you&#39;ve described what bmcweb does today.=C2=A0 In this case, we=
<br>
might want to just promote an &quot;isUpgrade&quot; method from the app, th=
at we<br>
can use to determine if a given route is dynamic or not, and call into<br>
the correct &quot;handleStream&quot; operator.=C2=A0 Keep in mind that at s=
ome point<br>
you need to transfer control back to httpConnection to handle<br>
keepalive properly.<br></blockquote><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
Thinking about keepalive more gave me another thought: This isn&#39;t<br>
really an &quot;upgrade&quot; in the normal sense.=C2=A0 What if we just ad=
ded a<br>
&quot;write&quot; method to the Response object that immediately wrote the<=
br>
payload to the dynamic body and sent it?=C2=A0 write() could return an<br>
error code in the cases where the client has disconnected, and we<br>
never have to transfer ownership or knowledge of the socket, and the<br>
keepalive and end() mechanisms would continue to work like normal.<br>
HttpConnection would have to get some knowledge about whether this<br>
request was dynamic or not, but that seems pretty doable, and could<br>
just be based on the first call to write.=C2=A0 Also, this keeps all the<br=
>
keepalive code the same, which I think is good.<br>
<br></blockquote><div>That&#39;s exactly why we thought to use handle() met=
hod, but<b> there is a gap how to transfer ownership</b></div><div><b>of so=
cket from connection class to rule class.</b></div><div><br></div><div>In t=
he existing implementation where we transferred ownership of socket from co=
nnection class to rule class</div><div>based on=C2=A0 http header field &qu=
ot;upgrade::websocket&quot;<br><br>=C2=A0As I explained above, we need bi-d=
irectional communication, where bmc sends certain=C2=A0payload and nbd on c=
lient-side</div><div>acknowledges received payload.<br><br>So we need webso=
cket way of implementation, where we need to keep reading and writing const=
antly on the same socket.<br><br>What I am unable to connect is how to tran=
sfer=C2=A0ownership of socket connection to new rule class, as in this case=
=C2=A0</div><div>we can&#39;t take the decision based on=C2=A0 request head=
er/content. can you provide your suggestion=C2=A0 please?<br><br>What do yo=
u mean by dynamic request and dynamic response?<br>As per my understanding,=
 dynamic response is based on http request content, one of the header field=
=C2=A0&quot;accept&quot;</div><div>where client specifies data format and d=
epending on this format, response=C2=A0gets generated. Is it=C2=A0a dynamic=
 response?</div><div>if it&#39;s true, how is it applicable here?<br><br></=
div><div>Response object writing payload to dynamic body may not work in th=
is case.<br>Response object does not=C2=A0 hold=C2=A0 socket, only connecti=
on class which is having socket, except handleUpgrade case <br>where we tra=
nsfer=C2=A0socket ownership to connection to rule class which creates anoth=
er connection</div><div><br>Thanks<br>-Raviteja<br>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><br><br>
&gt;&gt; On Fri, 28 Aug, 2020, 12:42 am Ed Tanous, &lt;<a href=3D"mailto:ed=
@tanous.net" target=3D"_blank">ed@tanous.net</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Sun, Aug 2, 2020 at 8:53 AM Ed Tanous &lt;<a href=3D"mailto=
:ed@tanous.net" target=3D"_blank">ed@tanous.net</a>&gt; wrote:<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; I&#39;m looking at a couple recent changes to bmcweb, and=
 I&#39;m finding a<br>
&gt;&gt;&gt; &gt; significant architecture problem has been injected.=C2=A0=
 Namely, it&#39;s<br>
&gt;&gt;&gt; &gt; these innocuous looking 4 lines here, which injects the s=
ocket adaptor<br>
&gt;&gt;&gt; &gt; into the request object for use later.<br>
&gt;&gt;&gt; &gt; <a href=3D"https://github.com/openbmc/bmcweb/blob/30c58d5=
81606b4484757e6ee9133c248de1514a6/http/http_request.h#L18" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/openbmc/bmcweb/blob/30c58d581606b44=
84757e6ee9133c248de1514a6/http/http_request.h#L18</a><br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; The problem with this approach has a few roots:<br>
&gt;&gt;&gt; &gt; 1. The Request class is meant to model a single request, =
single<br>
&gt;&gt;&gt; &gt; response model.=C2=A0 Adding the stream semantics breaks =
this in pretty<br>
&gt;&gt;&gt; &gt; significant ways, and forces a hard dependency between th=
e streaming<br>
&gt;&gt;&gt; &gt; adapter and the Request, which was not the intent.=C2=A0 =
We have<br>
&gt;&gt;&gt; &gt; abstractions for &quot;streaming&quot; requests, but that=
 was seemingly not<br>
&gt;&gt;&gt; &gt; used.<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; 2. In the code that existed before this, Adaptor was a te=
mplate on<br>
&gt;&gt;&gt; &gt; purpose.=C2=A0 It is designed to implement the std::netwo=
rking<br>
&gt;&gt;&gt; &gt; AsyncReadStream and AsyncWriteStream concepts.=C2=A0 This=
 is designed to<br>
&gt;&gt;&gt; &gt; allow injection of Unit Tests at some point, as I&#39;ve =
talked about<br>
&gt;&gt;&gt; &gt; before.=C2=A0 Hardcoding it in request to 2 forced stream=
 types, based on<br>
&gt;&gt;&gt; &gt; the compiler flag is incorrect per asio standards, and re=
moves the<br>
&gt;&gt;&gt; &gt; ability to inject arbitrary adapters, like test adaptors.=
=C2=A0 Also, the<br>
&gt;&gt;&gt; &gt; flag used is incorrect, as it&#39;s possible to inject a =
non-ssl socket<br>
&gt;&gt;&gt; &gt; even if SSL is enabled.<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; 3. There is already a precedent and pattern for streaming=
 interfaces<br>
&gt;&gt;&gt; &gt; in bmcweb that we adopted from Crow.=C2=A0 If you look at=
 the Websocket<br>
&gt;&gt;&gt; &gt; request response type, it implements a way to request a r=
oute that<br>
&gt;&gt;&gt; &gt; streams dynamically.=C2=A0 Frustratingly, part of what th=
is was used for<br>
&gt;&gt;&gt; &gt; was SSE, which I had already written a patch for that did=
n&#39;t have any<br>
&gt;&gt;&gt; &gt; of the above issues, and only hadn&#39;t merged it becaus=
e we didn&#39;t have<br>
&gt;&gt;&gt; &gt; any SSE routes yet, and didn&#39;t want to check in dead =
code.<br>
&gt;&gt;&gt; &gt; <a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/b=
mcweb/+/13948" rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc-=
project.xyz/c/openbmc/bmcweb/+/13948</a><br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; 4. It opens the possibility for lifetime and possible (at=
 the very<br>
&gt;&gt;&gt; &gt; least harder to audit) security issues, as now the &quot;=
http server&quot;<br>
&gt;&gt;&gt; &gt; component is no longer the only thing that can own socket=
s.<br>
&gt;&gt;&gt; &gt; Previously, the server owned the sockets until handed off=
, then there<br>
&gt;&gt;&gt; &gt; was no shared ownership between the websocket class, and =
the<br>
&gt;&gt;&gt; &gt; Connection class.=C2=A0 The Connection class could be com=
pletely destroyed<br>
&gt;&gt;&gt; &gt; (and memory freed) while the websocket was still connecte=
d and<br>
&gt;&gt;&gt; &gt; running.<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; Moving to another track, you may ask, how did I come acro=
ss this and<br>
&gt;&gt;&gt; &gt; why does it matter?=C2=A0 I&#39;m trying to add 2 new fea=
tures to bmcweb.=C2=A0 The<br>
&gt;&gt;&gt; &gt; first allows opening multiple sockets, and dynamically de=
tecting TLS<br>
&gt;&gt;&gt; &gt; streams on them.=C2=A0 This allows bmcweb to handle both =
HTTPS redirects in<br>
&gt;&gt;&gt; &gt; band, and handle the case where users type in something e=
rroneous,<br>
&gt;&gt;&gt; &gt; like &quot;<a href=3D"http://mybmc:443" rel=3D"noreferrer=
" target=3D"_blank">http://mybmc:443</a>&quot; and connect to an SSL socket=
 with a non-ssl<br>
&gt;&gt;&gt; &gt; protocol.=C2=A0 In those cases, we can simply do the righ=
t thing.=C2=A0 It also<br>
&gt;&gt;&gt; &gt; allows bmcweb to host on multiple ports, which might be i=
nteresting<br>
&gt;&gt;&gt; &gt; for aggregator types.=C2=A0 More importantly, it cleans u=
p some of the<br>
&gt;&gt;&gt; &gt; Adaptor abstraction to make way for unit testing, and bei=
ng able to<br>
&gt;&gt;&gt; &gt; inject a &quot;test&quot; socket, that we can control the=
 semantics of.=C2=A0 I&#39;m<br>
&gt;&gt;&gt; &gt; hoping eventually to be able to mock dbus, and mock the T=
CP socket,<br>
&gt;&gt;&gt; &gt; and run a full Redfish validator run in a unit test.=C2=
=A0 I think that<br>
&gt;&gt;&gt; &gt; would save a lot of time overall for both committers and =
consumers.<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; The first of these patches is posted here, and simply com=
ments out the<br>
&gt;&gt;&gt; &gt; above problems for now.<br>
&gt;&gt;&gt; &gt; <a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/b=
mcweb/+/35265" rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc-=
project.xyz/c/openbmc/bmcweb/+/35265</a><br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; If I look through the commit logs, it looks like Ravi and=
 Appu built<br>
&gt;&gt;&gt; &gt; the two small subsystems that rely on the above abstracti=
on, one for<br>
&gt;&gt;&gt; &gt; SSE, and one for some NBD streamer.<br>
&gt;&gt;&gt; &gt; What do you two think about the above?=C2=A0 Was it somet=
hing you<br>
&gt;&gt;&gt; &gt; considered when you wrote your patches?=C2=A0 Would you c=
onsider fixing<br>
&gt;&gt;&gt; &gt; them?<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0My recommendation would be to move both of th=
ose two over to<br>
&gt;&gt;&gt; &gt; something similar to the websocket abstraction we have, w=
ith, on<br>
&gt;&gt;&gt; &gt; connect, on data, and on close handlers.=C2=A0 This means=
 that handlers no<br>
&gt;&gt;&gt; &gt; longer take a hard dependency on the transport, which wil=
l help for<br>
&gt;&gt;&gt; &gt; both unit testing, and if we ever want to support redfish=
 device<br>
&gt;&gt;&gt; &gt; enablement (which relies on an i2c based transport). The =
SSE one can<br>
&gt;&gt;&gt; &gt; probably be used more or less as-is from my old patch.=C2=
=A0 The NBD one<br>
&gt;&gt;&gt; &gt; might need a &quot;Dynamic body&quot; type, which beast a=
lready has an<br>
&gt;&gt;&gt; &gt; abstraction for that seems to have been discounted.<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; What do you guys think?<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; -Ed<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; It&#39;s been 3 weeks and I haven&#39;t gotten any replies to =
this pretty<br>
&gt;&gt;&gt; major architecture break.=C2=A0 It also looks like it can also=
 cause a<br>
&gt;&gt;&gt; memory leak in HttpConnection here (found by code inspection h=
ere).<br>
&gt;&gt;&gt; <a href=3D"https://github.com/openbmc/bmcweb/blob/ebd459060ea4=
f42761402dd54acd0962c36136c2/http/http_connection.h#L351" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/openbmc/bmcweb/blob/ebd459060ea4f427=
61402dd54acd0962c36136c2/http/http_connection.h#L351</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I&#39;ve pushed a revert to remove the features in question.=
=C2=A0 I would love<br>
&gt;&gt;&gt; some comments from the developers that caused these breakages,=
 so I<br>
&gt;&gt;&gt; can make sure I&#39;m doing the right thing here, and I&#39;m =
not completely<br>
&gt;&gt;&gt; off base (or that you intend to fix them, and this patch is<br=
>
&gt;&gt;&gt; unnecessary).<br>
&gt;&gt;&gt; <a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb=
/+/36038" rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc-proje=
ct.xyz/c/openbmc/bmcweb/+/36038</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thanks,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; -Ed<br>
</blockquote></div></div>

--00000000000009f8d105ae67c762--
