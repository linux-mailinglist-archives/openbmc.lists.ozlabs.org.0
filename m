Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D305625AE35
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 17:02:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhRy51N7xzDqwp
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 01:02:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=jV4I5BKs; dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhRvR1CqrzDqwN
 for <openbmc@lists.ozlabs.org>; Thu,  3 Sep 2020 01:00:31 +1000 (AEST)
Received: by mail-yb1-xb33.google.com with SMTP id x2so3134663ybf.12
 for <openbmc@lists.ozlabs.org>; Wed, 02 Sep 2020 08:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JzMuNYIXC3KiRWkiIRkd592OP6Bq1XesghuP0ZtwVDQ=;
 b=jV4I5BKsI/y/R54cdZHjjD+pBV+9oBaAABOyGHhSy5g9Mt1UpSb87/5fC/hRHkGsh9
 X050GQN5NzmMvHny5vaQR+KGIyrlulcibobbOPvPZZ1HjL25w0i701Sv884FrQ2uH1xT
 NRwilNBBALdja9y5IO8JGb4PN4da8e7UOWIQAtGxUyX/LVMpRi7JQADbHCSiryaMQMPm
 I9wf8QRWdU/lT804mR+Aux6CaGX2nA1J6s/DtUHbznMoOfW9RjpRkY8obD8MqY0pNT2X
 FtJH7udw+THi0gWjc2fmOAxsodvJW1mLAlIULCABoFnmRkrBOp3S6Spjzjtyl0lV/bxG
 UMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JzMuNYIXC3KiRWkiIRkd592OP6Bq1XesghuP0ZtwVDQ=;
 b=a2NOKA8ZNQEWOdCp3xOGOocqn8Bv4FEZgFMeMv5QVLZ01XoQdz7dSq3AICJ4+goKc5
 zw0Bb3CnT82QHQRCLHynZSy8Acfikyq0pkHYay8atCKpngWyQGv4gedej8E3UvYoxKe3
 wo4lMyK3/5RoKZy8Q4BN9ckoCrc0+0Sv3Mr9NW3SODp2t/uQ8PUshxJsz7Bt5asxJ3aI
 N2XnQRo/FHLDo6984zuD5HmECd6PaSpfktE6kZ1YOF1ajDs5MDiNgrLzXCYu2kgbvRX5
 Uw7DIiK8wxoS29PlnDAKzptUNSKxpN6vd/YM8Y0/6lx4HOAsZf4M9XyJk1VzQPeqSv8N
 akXA==
X-Gm-Message-State: AOAM5324xS6n6aA6P4+ri5IGGT2S+Ct/3xqSbMkPZNV4MVrJZ31y8Z9E
 H+OuU3qU7KZdOfui6rY2kj1qIHKXYWICFlThWXz4aw==
X-Google-Smtp-Source: ABdhPJxUHyZteMzedbq9S9LaV3OL7GJqhZ3ED2RI2nw/mHeb5AySmxcj/mZKtHPitzfZXPRSPSUXI6ZDvuTM5XNq528=
X-Received: by 2002:a25:2d69:: with SMTP id s41mr10540873ybe.417.1599058827590; 
 Wed, 02 Sep 2020 08:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <CACWQX82sSvONiMq53s39P42Sky5C+GsvLGyN42xvKUYSGHjyrQ@mail.gmail.com>
 <CACWQX82=j3QiYotB1ynOor=HkuMEmyDxa=aNr7_uGwkfuFXJaA@mail.gmail.com>
 <CAM4DKZm7PxT2=OaFQonP0yBTDjcNjssvw46QbDNG30qUKydeqw@mail.gmail.com>
 <CAM4DKZkE6JTP0jMF0j90KQxkBVxtDXP2TP=e45cQGRP-AqvGfQ@mail.gmail.com>
In-Reply-To: <CAM4DKZkE6JTP0jMF0j90KQxkBVxtDXP2TP=e45cQGRP-AqvGfQ@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 2 Sep 2020 08:00:00 -0700
Message-ID: <CACWQX836e0w2kP0R3+MSUzyHU_KcipHHv_21NsZdudVeteJaYA@mail.gmail.com>
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

On Wed, Sep 2, 2020 at 4:49 AM raviteja bailapudi
<raviteja28031990@gmail.com> wrote:
>
> Hi Ed,
>
> As requested in the gerrit commit(36038), continuing the discussion on th=
e mailing list.Once again, thanks for pointing out flaws in the code and ap=
ologies for missing your initial mail on this. Trying to summarize and also=
 proposing my thoughts here to address the issues. Following is my understa=
nding of high level flow for connection which requires streaming -

Would you mind also commenting on the revert for this?  It would help
get consensus so we can fix the memory leaks that a couple of these
changesets injected.  Given that we've been pretty badly broken for
about a month, I think we need to get the revert merged as soon as
possible.

>    1) Create StreamSocketRule and StreamSocket classes as like as websock=
et
>    2) Add one more RuleParameterTraits for StreamSocketTwo ways to invoke=
 this new class -
>     1) Create static bmcweb route for each logservice with dump uri  with=
 specific rule trait for streamsocket
>       eg:
>         BMCWEB_ROUTE(app, "/system/LogServices/Dump/attachment/<str>",id)
>         .privileges({"ConfigureComponents", "ConfigureManager"})
>         .streamsocket()

I'd much rather call it "dyamicResponse" and have it take 3 callables,
one for onRequest, that accepts a Request and a Response object, like
a normal handler, one for onData, that accepts a buffer of the body
data, and one for onClose, that informs the calling code the socket
was closed.

>     2) Create another redfish node class(as the existing node class is fo=
r dynamic route) which would call app.route with the streamSocket trait.Do =
you have any preference here?handleUpgrade() of router class gets invoked i=
n the following conditions -

The Redfish Node class is specifically for request->response type
operations, and in the long run, I'd really like to see it just go
away.  Today, it doesn't do anything more than the underlying router
already does, and is missing a number of things, like typesafe
parameter parsing, as well as copy-less parameters.  If it were me, I
would simply model your dynamic responses around BMCWEB_ROUTE.

>     a)request contains http header(upgrade:websocket)
>     b)request contains http header (accept: text/event-stream) ---> yet t=
o be upstreamedIn our use case for dump stream, we do not need to take this=
 decision by looking at the request header as the URL is already registered=
 with their associated rule(StreamSocketRule) class.When we search in the t=
rie for a specific URL, we will get the associated rule class object, which=
 in our case would be StreamSocketRule and the handle function of this clas=
s should make sure that socket is not closed.
> Is my understanding correct understanding or do you have more suggestion =
on this?There is an active discussion going on in the following commit for =
the same.
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/36038

I think you've described what bmcweb does today.  In this case, we
might want to just promote an "isUpgrade" method from the app, that we
can use to determine if a given route is dynamic or not, and call into
the correct "handleStream" operator.  Keep in mind that at some point
you need to transfer control back to httpConnection to handle
keepalive properly.

Thinking about keepalive more gave me another thought: This isn't
really an "upgrade" in the normal sense.  What if we just added a
"write" method to the Response object that immediately wrote the
payload to the dynamic body and sent it?  write() could return an
error code in the cases where the client has disconnected, and we
never have to transfer ownership or knowledge of the socket, and the
keepalive and end() mechanisms would continue to work like normal.
HttpConnection would have to get some knowledge about whether this
request was dynamic or not, but that seems pretty doable, and could
just be based on the first call to write.  Also, this keeps all the
keepalive code the same, which I think is good.

>
> Thanks,
> -Raviteja
>
>
> On Tue, Sep 1, 2020 at 3:26 PM raviteja bailapudi <raviteja28031990@gmail=
.com> wrote:
>>
>> Ed,Sorry for the late response, I forgot to reply here, Some how the fir=
st mail got missed but once I got a  reminder mail, I started working on th=
is and the discussion is going on in the gerrit.
>> I had few more doubts which I asked in the gerrit, Can you please take a=
 look?
>>
>>
>>
>> -RaviTeja
>>
>> On Fri, 28 Aug, 2020, 12:42 am Ed Tanous, <ed@tanous.net> wrote:
>>>
>>> On Sun, Aug 2, 2020 at 8:53 AM Ed Tanous <ed@tanous.net> wrote:
>>> >
>>> > I'm looking at a couple recent changes to bmcweb, and I'm finding a
>>> > significant architecture problem has been injected.  Namely, it's
>>> > these innocuous looking 4 lines here, which injects the socket adapto=
r
>>> > into the request object for use later.
>>> > https://github.com/openbmc/bmcweb/blob/30c58d581606b4484757e6ee9133c2=
48de1514a6/http/http_request.h#L18
>>> >
>>> > The problem with this approach has a few roots:
>>> > 1. The Request class is meant to model a single request, single
>>> > response model.  Adding the stream semantics breaks this in pretty
>>> > significant ways, and forces a hard dependency between the streaming
>>> > adapter and the Request, which was not the intent.  We have
>>> > abstractions for "streaming" requests, but that was seemingly not
>>> > used.
>>> >
>>> > 2. In the code that existed before this, Adaptor was a template on
>>> > purpose.  It is designed to implement the std::networking
>>> > AsyncReadStream and AsyncWriteStream concepts.  This is designed to
>>> > allow injection of Unit Tests at some point, as I've talked about
>>> > before.  Hardcoding it in request to 2 forced stream types, based on
>>> > the compiler flag is incorrect per asio standards, and removes the
>>> > ability to inject arbitrary adapters, like test adaptors.  Also, the
>>> > flag used is incorrect, as it's possible to inject a non-ssl socket
>>> > even if SSL is enabled.
>>> >
>>> > 3. There is already a precedent and pattern for streaming interfaces
>>> > in bmcweb that we adopted from Crow.  If you look at the Websocket
>>> > request response type, it implements a way to request a route that
>>> > streams dynamically.  Frustratingly, part of what this was used for
>>> > was SSE, which I had already written a patch for that didn't have any
>>> > of the above issues, and only hadn't merged it because we didn't have
>>> > any SSE routes yet, and didn't want to check in dead code.
>>> > https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/13948
>>> >
>>> > 4. It opens the possibility for lifetime and possible (at the very
>>> > least harder to audit) security issues, as now the "http server"
>>> > component is no longer the only thing that can own sockets.
>>> > Previously, the server owned the sockets until handed off, then there
>>> > was no shared ownership between the websocket class, and the
>>> > Connection class.  The Connection class could be completely destroyed
>>> > (and memory freed) while the websocket was still connected and
>>> > running.
>>> >
>>> > Moving to another track, you may ask, how did I come across this and
>>> > why does it matter?  I'm trying to add 2 new features to bmcweb.  The
>>> > first allows opening multiple sockets, and dynamically detecting TLS
>>> > streams on them.  This allows bmcweb to handle both HTTPS redirects i=
n
>>> > band, and handle the case where users type in something erroneous,
>>> > like "http://mybmc:443" and connect to an SSL socket with a non-ssl
>>> > protocol.  In those cases, we can simply do the right thing.  It also
>>> > allows bmcweb to host on multiple ports, which might be interesting
>>> > for aggregator types.  More importantly, it cleans up some of the
>>> > Adaptor abstraction to make way for unit testing, and being able to
>>> > inject a "test" socket, that we can control the semantics of.  I'm
>>> > hoping eventually to be able to mock dbus, and mock the TCP socket,
>>> > and run a full Redfish validator run in a unit test.  I think that
>>> > would save a lot of time overall for both committers and consumers.
>>> >
>>> > The first of these patches is posted here, and simply comments out th=
e
>>> > above problems for now.
>>> > https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/35265
>>> >
>>> > If I look through the commit logs, it looks like Ravi and Appu built
>>> > the two small subsystems that rely on the above abstraction, one for
>>> > SSE, and one for some NBD streamer.
>>> > What do you two think about the above?  Was it something you
>>> > considered when you wrote your patches?  Would you consider fixing
>>> > them?
>>> >
>>> >   My recommendation would be to move both of those two over to
>>> > something similar to the websocket abstraction we have, with, on
>>> > connect, on data, and on close handlers.  This means that handlers no
>>> > longer take a hard dependency on the transport, which will help for
>>> > both unit testing, and if we ever want to support redfish device
>>> > enablement (which relies on an i2c based transport). The SSE one can
>>> > probably be used more or less as-is from my old patch.  The NBD one
>>> > might need a "Dynamic body" type, which beast already has an
>>> > abstraction for that seems to have been discounted.
>>> >
>>> > What do you guys think?
>>> >
>>> > -Ed
>>>
>>>
>>> It's been 3 weeks and I haven't gotten any replies to this pretty
>>> major architecture break.  It also looks like it can also cause a
>>> memory leak in HttpConnection here (found by code inspection here).
>>> https://github.com/openbmc/bmcweb/blob/ebd459060ea4f42761402dd54acd0962=
c36136c2/http/http_connection.h#L351
>>>
>>> I've pushed a revert to remove the features in question.  I would love
>>> some comments from the developers that caused these breakages, so I
>>> can make sure I'm doing the right thing here, and I'm not completely
>>> off base (or that you intend to fix them, and this patch is
>>> unnecessary).
>>> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/36038
>>>
>>> Thanks,
>>>
>>> -Ed
