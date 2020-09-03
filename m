Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 815FC25C603
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 18:00:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bj5B950gzzDrC5
	for <lists+openbmc@lfdr.de>; Fri,  4 Sep 2020 02:00:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=YgLQXGSk; dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bj4GF6tcDzDqxl
 for <openbmc@lists.ozlabs.org>; Fri,  4 Sep 2020 01:19:01 +1000 (AEST)
Received: by mail-yb1-xb2a.google.com with SMTP id s92so2468948ybi.2
 for <openbmc@lists.ozlabs.org>; Thu, 03 Sep 2020 08:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ygW7scDi8BlcXRs2DNubc3i5kBPJu0eviyWC54RWAfs=;
 b=YgLQXGSkwxmZOGX9ERgJIcQMPs2g+Exk077AmEFq2zApKd63DfvyjH8donVMn6m4Kl
 sVXK7TeotVzDlDw0M8bq/E2heSBrC0jQVjkeSsVPf/au0NrOayPPE/dQyzvHMt3n7nbV
 ImBiXPVspmXLpYN1+bPcG0v2kQklWosXje4Q3vMuBPXLrg6JUCH54OBG9xJadbVmtk/q
 5h4dRWTk+jFwkZQla3OOY0FU26+enoxu80GZGWT+OCRvpeRZ0Gc7sMJiHSOWZ95WSXgE
 Pff7KSnCXy5ic6LeOeXjPyPXWA9ynaUzVdDlEwO5y7ZCaj8kisoaNuLLAZn7yMhEN3f0
 ApSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ygW7scDi8BlcXRs2DNubc3i5kBPJu0eviyWC54RWAfs=;
 b=Gw05iKOwKLX2i/vZQdW1Wk1JmvdhU8GlbCUQ7POIG/QpZfWEzIqIzXa3YrhPOt8L+x
 UL5NMBzivagxIcSLmmB+TQ2s0sRqqFsgI79MSpWTxZtocHNCnlay4Rz/r0Ds3jPrDg6U
 gdowXRHuHAoIfgj2rcZyjS/Rx6MiNNl36iJrBNaykfAF1JoVM91McMsoFhPmJ1dzTSiw
 BCr5OTdH1w+mObnWctdOO0Z16CP2HnWu0f8X75a8FeTvTargnrSoMAkN14bHWk/TvEH1
 7RMPhlpxxfg+89REJtTusxTuCqpMoesoRsom1kXUGwDAqsC+yVoDPDli/JJCyqL63dYa
 Vk/A==
X-Gm-Message-State: AOAM533lV+QJPLkwlKphxQxbo17gS9CCOcHmAjlAa9Z7M6mOjF3KCzZg
 BOLoYXhllaVE9D//MbDK9x4CtFJS9PTYelKA+/1Xxw==
X-Google-Smtp-Source: ABdhPJyckBrBBfX7KxhL6moCHBgt41N17m2DdTLcgTAz07BvNttnpk1y3ghDMCb3bMuybdU2p9a17cATPA6L8t0lkJo=
X-Received: by 2002:a25:2d69:: with SMTP id s41mr3369580ybe.417.1599146337077; 
 Thu, 03 Sep 2020 08:18:57 -0700 (PDT)
MIME-Version: 1.0
References: <CACWQX82sSvONiMq53s39P42Sky5C+GsvLGyN42xvKUYSGHjyrQ@mail.gmail.com>
 <CACWQX82=j3QiYotB1ynOor=HkuMEmyDxa=aNr7_uGwkfuFXJaA@mail.gmail.com>
 <CAM4DKZm7PxT2=OaFQonP0yBTDjcNjssvw46QbDNG30qUKydeqw@mail.gmail.com>
 <CAM4DKZkE6JTP0jMF0j90KQxkBVxtDXP2TP=e45cQGRP-AqvGfQ@mail.gmail.com>
 <CACWQX836e0w2kP0R3+MSUzyHU_KcipHHv_21NsZdudVeteJaYA@mail.gmail.com>
 <CAM4DKZmZV2gNaFQG1+OaAhDGo+V_TVSeuEqvo7FV0ow9Dp8E1g@mail.gmail.com>
In-Reply-To: <CAM4DKZmZV2gNaFQG1+OaAhDGo+V_TVSeuEqvo7FV0ow9Dp8E1g@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 3 Sep 2020 08:18:45 -0700
Message-ID: <CACWQX81ruudwVi+ubJX_V3aAocx0TqC4Wc3_G=Hw6FgbX_5Pcg@mail.gmail.com>
Subject: Re: Recent architecture breakages to bmcweb
To: raviteja bailapudi <raviteja28031990@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Sep 3, 2020 at 5:20 AM raviteja bailapudi
<raviteja28031990@gmail.com> wrote:
>
>
> Ed,
>
> Thank you so much for quick response.
>
>> >    1) Create StreamSocketRule and StreamSocket classes as like as webs=
ocket
>> >    2) Add one more RuleParameterTraits for StreamSocketTwo ways to inv=
oke this new class -
>> >     1) Create static bmcweb route for each logservice with dump uri  w=
ith specific rule trait for streamsocket
>> >       eg:
>> >         BMCWEB_ROUTE(app, "/system/LogServices/Dump/attachment/<str>",=
id)
>> >         .privileges({"ConfigureComponents", "ConfigureManager"})
>> >         .streamsocket()
>>
>> I'd much rather call it "dyamicResponse" and have it take 3 callables,
>> one for onRequest, that accepts a Request and a Response object, like
>> a normal handler, one for onData, that accepts a buffer of the body
>> data, and one for onClose, that informs the calling code the socket
>> was closed.
>
>
>
> Exactly, we thought to implement 4 callables in new rule class similar to=
  websocket
>    OnOpen(),OnMessage(),OnClose(),OnError() .  We can use names as sugges=
ted.

This is a one way dynamic loader, there's no such thing as an http
server sending a message while a response is in progress, so OnMessage
isn't required.

>
> Dump dump offload happens using NBD protocol, it's like NBD over http.
> In this  streaming use-case, data will be bidirectional as there will be =
nbd acknowledgement
> for each nbd packet transferred to client. so thought to use "StreamSocke=
t" name.


HTTP (with the exception of websockets) is not bidirectional.  It's
request->response.  Please do not break the HTTP protocol in this
case.  If acknowledgement is needed, that would be a separate URL
route, so you can track the state in the backend, or you can use
websockets, which give a bidirectional socket API.
I will try to go through the code and understand your use case, but it
sounds a little odd to me.  Given we already have a websocket based
nbd, was that not a good fit to your use case?

>
>
>> >     2) Create another redfish node class(as the existing node class is=
 for dynamic route)
>>
>> which would call app.route with the streamSocket trait.Do you have any p=
reference here?handleUpgrade() of router class gets invoked in the followin=
g conditions -
>>
>> The Redfish Node class is specifically for request->response type
>> operations, and in the long run, I'd really like to see it just go
>> away.  Today, it doesn't do anything more than the underlying router
>> already does, and is missing a number of things, like typesafe
>> parameter parsing, as well as copy-less parameters.  If it were me, I
>> would simply model your dynamic responses around BMCWEB_ROUTE
>>
>>
>>
>> >     a)request contains http header(upgrade:websocket)
>> >     b)request contains http header (accept: text/event-stream) ---> ye=
t to be upstreamedIn our use case for dump stream, we do not need to take t=
his decision by looking at the request header as the URL is already registe=
red with their associated rule(StreamSocketRule) class.When we search in th=
e trie for a specific URL, we will get the associated rule class object, wh=
ich in our case would be StreamSocketRule and the handle function of this c=
lass should make sure that socket is not closed.
>> > Is my understanding correct understanding or do you have more suggesti=
on on this?There is an active discussion going on in the following commit f=
or the same.
>> > https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/36038
>>
>> I think you've described what bmcweb does today.  In this case, we
>> might want to just promote an "isUpgrade" method from the app, that we
>> can use to determine if a given route is dynamic or not, and call into
>> the correct "handleStream" operator.  Keep in mind that at some point
>> you need to transfer control back to httpConnection to handle
>> keepalive properly.
>
>
>>
>> Thinking about keepalive more gave me another thought: This isn't
>> really an "upgrade" in the normal sense.  What if we just added a
>> "write" method to the Response object that immediately wrote the
>> payload to the dynamic body and sent it?  write() could return an
>> error code in the cases where the client has disconnected, and we
>> never have to transfer ownership or knowledge of the socket, and the
>> keepalive and end() mechanisms would continue to work like normal.
>> HttpConnection would have to get some knowledge about whether this
>> request was dynamic or not, but that seems pretty doable, and could
>> just be based on the first call to write.  Also, this keeps all the
>> keepalive code the same, which I think is good.
>>
> That's exactly why we thought to use handle() method, but there is a gap =
how to transfer ownership
> of socket from connection class to rule class.
>
> In the existing implementation where we transferred ownership of socket f=
rom connection class to rule class
> based on  http header field "upgrade::websocket"
>
>  As I explained above, we need bi-directional communication, where bmc se=
nds certain payload and nbd on client-side
> acknowledges received payload.
>
> So we need websocket way of implementation, where we need to keep reading=
 and writing constantly on the same socket.

Why not just use websockets?  That's what they're designed to do.

>
> What I am unable to connect is how to transfer ownership of socket connec=
tion to new rule class, as in this case
> we can't take the decision based on  request header/content. can you prov=
ide your suggestion  please?

I think I know how to do it, but let's make sure it's the right thing
to do before we commit to that.

>
> What do you mean by dynamic request and dynamic response?

It's a concept within Beast, for a body that is streaming the output.

> As per my understanding, dynamic response is based on http request conten=
t, one of the header field "accept"
> where client specifies data format and depending on this format, response=
 gets generated. Is it a dynamic response?
> if it's true, how is it applicable here?

No, dynamic requests and dynamic responses are where the http
framework doesn't wait for the request to be done sending before
reading it in.  It's generally used for large requests you don't want
to buffer before sending.

https://www.boost.org/doc/libs/1_74_0/libs/beast/doc/html/beast/ref/boost__=
beast__http__basic_dynamic_body.html

>
> Response object writing payload to dynamic body may not work in this case=
.
> Response object does not  hold  socket, only connection class which is ha=
ving socket, except handleUpgrade case
> where we transfer socket ownership to connection to rule class which crea=
tes another connection

That's what I'm saying, don't transfer the ownership at all, just
create a response API that allows you to send data to socket directly.

>
> Thanks
> -Raviteja
>
>>
>>
>>
>> >> On Fri, 28 Aug, 2020, 12:42 am Ed Tanous, <ed@tanous.net> wrote:
>> >>>
>> >>> On Sun, Aug 2, 2020 at 8:53 AM Ed Tanous <ed@tanous.net> wrote:
>> >>> >
>> >>> > I'm looking at a couple recent changes to bmcweb, and I'm finding =
a
>> >>> > significant architecture problem has been injected.  Namely, it's
>> >>> > these innocuous looking 4 lines here, which injects the socket ada=
ptor
>> >>> > into the request object for use later.
>> >>> > https://github.com/openbmc/bmcweb/blob/30c58d581606b4484757e6ee913=
3c248de1514a6/http/http_request.h#L18
>> >>> >
>> >>> > The problem with this approach has a few roots:
>> >>> > 1. The Request class is meant to model a single request, single
>> >>> > response model.  Adding the stream semantics breaks this in pretty
>> >>> > significant ways, and forces a hard dependency between the streami=
ng
>> >>> > adapter and the Request, which was not the intent.  We have
>> >>> > abstractions for "streaming" requests, but that was seemingly not
>> >>> > used.
>> >>> >
>> >>> > 2. In the code that existed before this, Adaptor was a template on
>> >>> > purpose.  It is designed to implement the std::networking
>> >>> > AsyncReadStream and AsyncWriteStream concepts.  This is designed t=
o
>> >>> > allow injection of Unit Tests at some point, as I've talked about
>> >>> > before.  Hardcoding it in request to 2 forced stream types, based =
on
>> >>> > the compiler flag is incorrect per asio standards, and removes the
>> >>> > ability to inject arbitrary adapters, like test adaptors.  Also, t=
he
>> >>> > flag used is incorrect, as it's possible to inject a non-ssl socke=
t
>> >>> > even if SSL is enabled.
>> >>> >
>> >>> > 3. There is already a precedent and pattern for streaming interfac=
es
>> >>> > in bmcweb that we adopted from Crow.  If you look at the Websocket
>> >>> > request response type, it implements a way to request a route that
>> >>> > streams dynamically.  Frustratingly, part of what this was used fo=
r
>> >>> > was SSE, which I had already written a patch for that didn't have =
any
>> >>> > of the above issues, and only hadn't merged it because we didn't h=
ave
>> >>> > any SSE routes yet, and didn't want to check in dead code.
>> >>> > https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/13948
>> >>> >
>> >>> > 4. It opens the possibility for lifetime and possible (at the very
>> >>> > least harder to audit) security issues, as now the "http server"
>> >>> > component is no longer the only thing that can own sockets.
>> >>> > Previously, the server owned the sockets until handed off, then th=
ere
>> >>> > was no shared ownership between the websocket class, and the
>> >>> > Connection class.  The Connection class could be completely destro=
yed
>> >>> > (and memory freed) while the websocket was still connected and
>> >>> > running.
>> >>> >
>> >>> > Moving to another track, you may ask, how did I come across this a=
nd
>> >>> > why does it matter?  I'm trying to add 2 new features to bmcweb.  =
The
>> >>> > first allows opening multiple sockets, and dynamically detecting T=
LS
>> >>> > streams on them.  This allows bmcweb to handle both HTTPS redirect=
s in
>> >>> > band, and handle the case where users type in something erroneous,
>> >>> > like "http://mybmc:443" and connect to an SSL socket with a non-ss=
l
>> >>> > protocol.  In those cases, we can simply do the right thing.  It a=
lso
>> >>> > allows bmcweb to host on multiple ports, which might be interestin=
g
>> >>> > for aggregator types.  More importantly, it cleans up some of the
>> >>> > Adaptor abstraction to make way for unit testing, and being able t=
o
>> >>> > inject a "test" socket, that we can control the semantics of.  I'm
>> >>> > hoping eventually to be able to mock dbus, and mock the TCP socket=
,
>> >>> > and run a full Redfish validator run in a unit test.  I think that
>> >>> > would save a lot of time overall for both committers and consumers=
.
>> >>> >
>> >>> > The first of these patches is posted here, and simply comments out=
 the
>> >>> > above problems for now.
>> >>> > https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/35265
>> >>> >
>> >>> > If I look through the commit logs, it looks like Ravi and Appu bui=
lt
>> >>> > the two small subsystems that rely on the above abstraction, one f=
or
>> >>> > SSE, and one for some NBD streamer.
>> >>> > What do you two think about the above?  Was it something you
>> >>> > considered when you wrote your patches?  Would you consider fixing
>> >>> > them?
>> >>> >
>> >>> >   My recommendation would be to move both of those two over to
>> >>> > something similar to the websocket abstraction we have, with, on
>> >>> > connect, on data, and on close handlers.  This means that handlers=
 no
>> >>> > longer take a hard dependency on the transport, which will help fo=
r
>> >>> > both unit testing, and if we ever want to support redfish device
>> >>> > enablement (which relies on an i2c based transport). The SSE one c=
an
>> >>> > probably be used more or less as-is from my old patch.  The NBD on=
e
>> >>> > might need a "Dynamic body" type, which beast already has an
>> >>> > abstraction for that seems to have been discounted.
>> >>> >
>> >>> > What do you guys think?
>> >>> >
>> >>> > -Ed
>> >>>
>> >>>
>> >>> It's been 3 weeks and I haven't gotten any replies to this pretty
>> >>> major architecture break.  It also looks like it can also cause a
>> >>> memory leak in HttpConnection here (found by code inspection here).
>> >>> https://github.com/openbmc/bmcweb/blob/ebd459060ea4f42761402dd54acd0=
962c36136c2/http/http_connection.h#L351
>> >>>
>> >>> I've pushed a revert to remove the features in question.  I would lo=
ve
>> >>> some comments from the developers that caused these breakages, so I
>> >>> can make sure I'm doing the right thing here, and I'm not completely
>> >>> off base (or that you intend to fix them, and this patch is
>> >>> unnecessary).
>> >>> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/36038
>> >>>
>> >>> Thanks,
>> >>>
>> >>> -Ed
