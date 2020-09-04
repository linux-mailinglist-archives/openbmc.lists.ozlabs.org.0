Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA1525D0F7
	for <lists+openbmc@lfdr.de>; Fri,  4 Sep 2020 07:42:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BjRQx6Vk9zDr8D
	for <lists+openbmc@lfdr.de>; Fri,  4 Sep 2020 15:42:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b44; helo=mail-yb1-xb44.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=w3zE+VZZ; dkim-atps=neutral
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BjRPJ0t5dzDrMH
 for <openbmc@lists.ozlabs.org>; Fri,  4 Sep 2020 15:41:23 +1000 (AEST)
Received: by mail-yb1-xb44.google.com with SMTP id h20so3731578ybj.8
 for <openbmc@lists.ozlabs.org>; Thu, 03 Sep 2020 22:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GEVzVNdWoj6T3dOv5gMKcGcWhzZsL1mY0KsvYPjiw2M=;
 b=w3zE+VZZFhYiC2vJgMlEBH3gjG42oY1ZJzVWgGTSmEfPpvT3t4N2DbVp8KRkj3t6A6
 yzROcRvE+8/cg1ASrT13feUqtrX5QxoJQQN0JDJYCUMO0yuza2xpWBpzjZjDLCVSkxQj
 JOnxqZGZQK3UMxnl1g3b75yM6jDvk4QPCW55CNFn7zY5O/M7CZt3/Mpu8yJmIHY8zZMb
 HIfsTR6waAAYTIcV4oWxn5JumQUWlnUipLXwezruc0VX5ndMcT+5mzc2qnkbbs0u8/tL
 OpjAFmTpz6GSnNAyadLycRddOR0DRtg9I0RFlWNT+QOdt7LJZMBne1vpoUkB7ppBoCZi
 q3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GEVzVNdWoj6T3dOv5gMKcGcWhzZsL1mY0KsvYPjiw2M=;
 b=ShI2nnG6ujvh9xqs8qX4A2S5lUcPSjvSOyiepVoVpdb/S99y+pgbfW4YtaickSlin+
 0TmA6MbqewbMTnsjrto4F9/M7D0Nyv85Ec3F7y9v92YumnEnHGdfPRBKhP8bNBQuum+K
 C4jQyaiL+2h+boHYpfZIMTldSrW+DlZOvDmc6qIGmPgSwz3izPmiQHrLwEmg2nHLUchK
 q5B1CNtt8zPB9GEQU0Tek2+ZQSQ4717blCHNDdPcoSW/fmU02aiaaivteuQJX7KsoiEQ
 ZMQWL93TDQVqM6EdR+BZAbM9ZPtwfYv4KNDZcBC3RlsfhD+rZ6yzXLYYmNa8rYOcQ1iN
 CVzg==
X-Gm-Message-State: AOAM5328kY7oSZEJFHRXMTxUbjBrYsE4aRy+yNoWNus6/siObTNB66YZ
 +cSQiGYr6U+57iqmLYPJSE8dqBfcghw/EiGT6k4VrA==
X-Google-Smtp-Source: ABdhPJylyCwggo1f+eu/N2n8NmcVHv0+pYPi5ZIJP8D3sXkpWB2csU4+MWSix4gV3FmP5qfeu5THT4CIKZN/gdENpAs=
X-Received: by 2002:a25:abf0:: with SMTP id v103mr7785902ybi.203.1599198079876; 
 Thu, 03 Sep 2020 22:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <CACWQX82sSvONiMq53s39P42Sky5C+GsvLGyN42xvKUYSGHjyrQ@mail.gmail.com>
 <CACWQX82=j3QiYotB1ynOor=HkuMEmyDxa=aNr7_uGwkfuFXJaA@mail.gmail.com>
 <CAM4DKZm7PxT2=OaFQonP0yBTDjcNjssvw46QbDNG30qUKydeqw@mail.gmail.com>
 <CAM4DKZkE6JTP0jMF0j90KQxkBVxtDXP2TP=e45cQGRP-AqvGfQ@mail.gmail.com>
 <CACWQX836e0w2kP0R3+MSUzyHU_KcipHHv_21NsZdudVeteJaYA@mail.gmail.com>
 <CAM4DKZmZV2gNaFQG1+OaAhDGo+V_TVSeuEqvo7FV0ow9Dp8E1g@mail.gmail.com>
 <CACWQX81ruudwVi+ubJX_V3aAocx0TqC4Wc3_G=Hw6FgbX_5Pcg@mail.gmail.com>
 <CAM4DKZkBpEAJVvCQi7Ga6_+azyPOzfhofQxocDjssn-2ANUFqg@mail.gmail.com>
In-Reply-To: <CAM4DKZkBpEAJVvCQi7Ga6_+azyPOzfhofQxocDjssn-2ANUFqg@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 3 Sep 2020 22:41:09 -0700
Message-ID: <CACWQX83=8wQv_z2KV6=wQOGevBC1yrPpaOO0UqVicw6XsA_CTw@mail.gmail.com>
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

On Thu, Sep 3, 2020 at 9:34 PM raviteja bailapudi
<raviteja28031990@gmail.com> wrote:
>
>
> Hi Ed,
>
>>
>>
>> > Exactly, we thought to implement 4 callables in new rule class similar=
 to  websocket
>> >    OnOpen(),OnMessage(),OnClose(),OnError() .  We can use names as sug=
gested.
>>
>> This is a one way dynamic loader, there's no such thing as an http
>> server sending a message while a response is in progress, so OnMessage
>> isn't required.
>>
>> >
>> > Dump dump offload happens using NBD protocol, it's like NBD over http.
>> > In this  streaming use-case, data will be bidirectional as there will =
be nbd acknowledgement
>> > for each nbd packet transferred to client. so thought to use "StreamSo=
cket" name.
>>
>>
>> HTTP (with the exception of websockets) is not bidirectional.  It's
>> request->response.  Please do not break the HTTP protocol in this
>> case.  If acknowledgement is needed, that would be a separate URL
>> route, so you can track the state in the backend, or you can use
>> websockets, which give a bidirectional socket API.
>> I will try to go through the code and understand your use case, but it
>> sounds a little odd to me.  Given we already have a websocket based
>> nbd, was that not a good fit to your use case?
>>
>
> I do understand that HTTP is not bidirectional and works with request-res=
ponse model.
> but  seems  HTTP/2 supports bidirectional stream
> https://tools.ietf.org/html/rfc7540
> stream:  A bidirectional flow of frames within the HTTP/2 connection.

True.  If you're looking to implement HTTP/2 in bmcweb, that's a
really big conversation, with a lot of implications.  The best place
to start would probably be a design doc.

>
>
>>
>> >
>> >
>> >> >     2) Create another redfish node class(as the existing node class=
 is for dynamic route)
>> >>
>> >> which would call app.route with the streamSocket trait.Do you have an=
y preference here?handleUpgrade() of router class gets invoked in the follo=
wing conditions -
>> >>
>> >> The Redfish Node class is specifically for request->response type
>> >> operations, and in the long run, I'd really like to see it just go
>> >> away.  Today, it doesn't do anything more than the underlying router
>> >> already does, and is missing a number of things, like typesafe
>> >> parameter parsing, as well as copy-less parameters.  If it were me, I
>> >> would simply model your dynamic responses around BMCWEB_ROUTE
>> >>
>> >>
>> >>
>> >> >     a)request contains http header(upgrade:websocket)
>> >> >     b)request contains http header (accept: text/event-stream) --->=
 yet to be upstreamedIn our use case for dump stream, we do not need to tak=
e this decision by looking at the request header as the URL is already regi=
stered with their associated rule(StreamSocketRule) class.When we search in=
 the trie for a specific URL, we will get the associated rule class object,=
 which in our case would be StreamSocketRule and the handle function of thi=
s class should make sure that socket is not closed.
>> >> > Is my understanding correct understanding or do you have more sugge=
stion on this?There is an active discussion going on in the following commi=
t for the same.
>> >> > https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/36038
>> >>
>> >> I think you've described what bmcweb does today.  In this case, we
>> >> might want to just promote an "isUpgrade" method from the app, that w=
e
>> >> can use to determine if a given route is dynamic or not, and call int=
o
>> >> the correct "handleStream" operator.  Keep in mind that at some point
>> >> you need to transfer control back to httpConnection to handle
>> >> keepalive properly.
>> >
>> >
>> >>
>> >> Thinking about keepalive more gave me another thought: This isn't
>> >> really an "upgrade" in the normal sense.  What if we just added a
>> >> "write" method to the Response object that immediately wrote the
>> >> payload to the dynamic body and sent it?  write() could return an
>> >> error code in the cases where the client has disconnected, and we
>> >> never have to transfer ownership or knowledge of the socket, and the
>> >> keepalive and end() mechanisms would continue to work like normal.
>> >> HttpConnection would have to get some knowledge about whether this
>> >> request was dynamic or not, but that seems pretty doable, and could
>> >> just be based on the first call to write.  Also, this keeps all the
>> >> keepalive code the same, which I think is good.
>> >>
>> > That's exactly why we thought to use handle() method, but there is a g=
ap how to transfer ownership
>> > of socket from connection class to rule class.
>> >
>> > In the existing implementation where we transferred ownership of socke=
t from connection class to rule class
>> > based on  http header field "upgrade::websocket"
>> >
>> >  As I explained above, we need bi-directional communication, where bmc=
 sends certain payload and nbd on client-side
>> > acknowledges received payload.
>> >
>> > So we need websocket way of implementation, where we need to keep read=
ing and writing constantly on the same socket.
>>
>> Why not just use websockets?  That's what they're designed to do.
>>
>
> We can't use websockets, Because how does the client knows that they need=
 to make the websocket request rather than HTTP.
> Dump offload url is given as url, we don't specify the protocol in the ur=
l.

As a counter, in the model above, how does the client know it needs to
speak NBD?  How does any client know it needs to do any protocol
communication?  It has to have some prior knowledge of some port,
host, and url, in question.  If you want a hypermedia API, you would
provide a starter resource with a link that starts with wss://.
Alternatively, you could just do what all the other websockets
handlers do, and just have the client have prior knowledge that that
URL leads to a websocket, and open it appropriately.

>
>>
>> > What I am unable to connect is how to transfer ownership of socket con=
nection to new rule class, as in this case
>> > we can't take the decision based on  request header/content. can you p=
rovide your suggestion  please?
>>
>> I think I know how to do it, but let's make sure it's the right thing
>> to do before we commit to that.
>
>
> ok. can you please explain your thoughts here?

If you want bidirectional communication, you should use websockets.
If you want one way streaming communication, you should use regular
HTTP (for "fast" data), SSE (For rare event data), or Long polling (if
you want to implement something relatively well supported).  With that
said, for what it looks like you're trying to do, I suspect you don't
really need bidirectional communication for a file download.  With
that said, I don't know your hypervisor, so I could be wrong.

To be clear, I'm against breaking the HTTP RFC in bmcweb, we should
avoid it in all cases.

-Ed

>>
>> >
>> > What do you mean by dynamic request and dynamic response?
>>
>> It's a concept within Beast, for a body that is streaming the output.
>>
>> > As per my understanding, dynamic response is based on http request con=
tent, one of the header field "accept"
>> > where client specifies data format and depending on this format, respo=
nse gets generated. Is it a dynamic response?
>> > if it's true, how is it applicable here?
>>
>> No, dynamic requests and dynamic responses are where the http
>> framework doesn't wait for the request to be done sending before
>> reading it in.  It's generally used for large requests you don't want
>> to buffer before sending.
>>
>> https://www.boost.org/doc/libs/1_74_0/libs/beast/doc/html/beast/ref/boos=
t__beast__http__basic_dynamic_body.html
>>
>>
>>
>> >
>> > Response object writing payload to dynamic body may not work in this c=
ase.
>> > Response object does not  hold  socket, only connection class which is=
 having socket, except handleUpgrade case
>> > where we transfer socket ownership to connection to rule class which c=
reates another connection
>>
>> That's what I'm saying, don't transfer the ownership at all, just
>> create a response API that allows you to send data to socket directly.
>>
>> >
>> > Thanks
>> > -Raviteja
>> >
>> >>
>> >>
>> >>
>> >> >> On Fri, 28 Aug, 2020, 12:42 am Ed Tanous, <ed@tanous.net> wrote:
>> >> >>>
>> >> >>> On Sun, Aug 2, 2020 at 8:53 AM Ed Tanous <ed@tanous.net> wrote:
>> >> >>> >
>> >> >>> > I'm looking at a couple recent changes to bmcweb, and I'm findi=
ng a
>> >> >>> > significant architecture problem has been injected.  Namely, it=
's
>> >> >>> > these innocuous looking 4 lines here, which injects the socket =
adaptor
>> >> >>> > into the request object for use later.
>> >> >>> > https://github.com/openbmc/bmcweb/blob/30c58d581606b4484757e6ee=
9133c248de1514a6/http/http_request.h#L18
>> >> >>> >
>> >> >>> > The problem with this approach has a few roots:
>> >> >>> > 1. The Request class is meant to model a single request, single
>> >> >>> > response model.  Adding the stream semantics breaks this in pre=
tty
>> >> >>> > significant ways, and forces a hard dependency between the stre=
aming
>> >> >>> > adapter and the Request, which was not the intent.  We have
>> >> >>> > abstractions for "streaming" requests, but that was seemingly n=
ot
>> >> >>> > used.
>> >> >>> >
>> >> >>> > 2. In the code that existed before this, Adaptor was a template=
 on
>> >> >>> > purpose.  It is designed to implement the std::networking
>> >> >>> > AsyncReadStream and AsyncWriteStream concepts.  This is designe=
d to
>> >> >>> > allow injection of Unit Tests at some point, as I've talked abo=
ut
>> >> >>> > before.  Hardcoding it in request to 2 forced stream types, bas=
ed on
>> >> >>> > the compiler flag is incorrect per asio standards, and removes =
the
>> >> >>> > ability to inject arbitrary adapters, like test adaptors.  Also=
, the
>> >> >>> > flag used is incorrect, as it's possible to inject a non-ssl so=
cket
>> >> >>> > even if SSL is enabled.
>> >> >>> >
>> >> >>> > 3. There is already a precedent and pattern for streaming inter=
faces
>> >> >>> > in bmcweb that we adopted from Crow.  If you look at the Websoc=
ket
>> >> >>> > request response type, it implements a way to request a route t=
hat
>> >> >>> > streams dynamically.  Frustratingly, part of what this was used=
 for
>> >> >>> > was SSE, which I had already written a patch for that didn't ha=
ve any
>> >> >>> > of the above issues, and only hadn't merged it because we didn'=
t have
>> >> >>> > any SSE routes yet, and didn't want to check in dead code.
>> >> >>> > https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/13948
>> >> >>> >
>> >> >>> > 4. It opens the possibility for lifetime and possible (at the v=
ery
>> >> >>> > least harder to audit) security issues, as now the "http server=
"
>> >> >>> > component is no longer the only thing that can own sockets.
>> >> >>> > Previously, the server owned the sockets until handed off, then=
 there
>> >> >>> > was no shared ownership between the websocket class, and the
>> >> >>> > Connection class.  The Connection class could be completely des=
troyed
>> >> >>> > (and memory freed) while the websocket was still connected and
>> >> >>> > running.
>> >> >>> >
>> >> >>> > Moving to another track, you may ask, how did I come across thi=
s and
>> >> >>> > why does it matter?  I'm trying to add 2 new features to bmcweb=
.  The
>> >> >>> > first allows opening multiple sockets, and dynamically detectin=
g TLS
>> >> >>> > streams on them.  This allows bmcweb to handle both HTTPS redir=
ects in
>> >> >>> > band, and handle the case where users type in something erroneo=
us,
>> >> >>> > like "http://mybmc:443" and connect to an SSL socket with a non=
-ssl
>> >> >>> > protocol.  In those cases, we can simply do the right thing.  I=
t also
>> >> >>> > allows bmcweb to host on multiple ports, which might be interes=
ting
>> >> >>> > for aggregator types.  More importantly, it cleans up some of t=
he
>> >> >>> > Adaptor abstraction to make way for unit testing, and being abl=
e to
>> >> >>> > inject a "test" socket, that we can control the semantics of.  =
I'm
>> >> >>> > hoping eventually to be able to mock dbus, and mock the TCP soc=
ket,
>> >> >>> > and run a full Redfish validator run in a unit test.  I think t=
hat
>> >> >>> > would save a lot of time overall for both committers and consum=
ers.
>> >> >>> >
>> >> >>> > The first of these patches is posted here, and simply comments =
out the
>> >> >>> > above problems for now.
>> >> >>> > https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/35265
>> >> >>> >
>> >> >>> > If I look through the commit logs, it looks like Ravi and Appu =
built
>> >> >>> > the two small subsystems that rely on the above abstraction, on=
e for
>> >> >>> > SSE, and one for some NBD streamer.
>> >> >>> > What do you two think about the above?  Was it something you
>> >> >>> > considered when you wrote your patches?  Would you consider fix=
ing
>> >> >>> > them?
>> >> >>> >
>> >> >>> >   My recommendation would be to move both of those two over to
>> >> >>> > something similar to the websocket abstraction we have, with, o=
n
>> >> >>> > connect, on data, and on close handlers.  This means that handl=
ers no
>> >> >>> > longer take a hard dependency on the transport, which will help=
 for
>> >> >>> > both unit testing, and if we ever want to support redfish devic=
e
>> >> >>> > enablement (which relies on an i2c based transport). The SSE on=
e can
>> >> >>> > probably be used more or less as-is from my old patch.  The NBD=
 one
>> >> >>> > might need a "Dynamic body" type, which beast already has an
>> >> >>> > abstraction for that seems to have been discounted.
>> >> >>> >
>> >> >>> > What do you guys think?
>> >> >>> >
>> >> >>> > -Ed
>> >> >>>
>> >> >>>
>> >> >>> It's been 3 weeks and I haven't gotten any replies to this pretty
>> >> >>> major architecture break.  It also looks like it can also cause a
>> >> >>> memory leak in HttpConnection here (found by code inspection here=
).
>> >> >>> https://github.com/openbmc/bmcweb/blob/ebd459060ea4f42761402dd54a=
cd0962c36136c2/http/http_connection.h#L351
>> >> >>>
>> >> >>> I've pushed a revert to remove the features in question.  I would=
 love
>> >> >>> some comments from the developers that caused these breakages, so=
 I
>> >> >>> can make sure I'm doing the right thing here, and I'm not complet=
ely
>> >> >>> off base (or that you intend to fix them, and this patch is
>> >> >>> unnecessary).
>> >> >>> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/36038
>> >> >>>
>> >> >>> Thanks,
>> >> >>>
>> >> >>> -Ed
