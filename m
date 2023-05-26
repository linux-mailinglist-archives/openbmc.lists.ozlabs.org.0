Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D867A712AA2
	for <lists+openbmc@lfdr.de>; Fri, 26 May 2023 18:30:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QSVl35CMhz3fCF
	for <lists+openbmc@lfdr.de>; Sat, 27 May 2023 02:30:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=lY4KaeFS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=edtanous@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=lY4KaeFS;
	dkim-atps=neutral
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QSVkS72Dhz3c71
	for <openbmc@lists.ozlabs.org>; Sat, 27 May 2023 02:29:35 +1000 (AEST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f6d7abe9a4so7116345e9.2
        for <openbmc@lists.ozlabs.org>; Fri, 26 May 2023 09:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685118569; x=1687710569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYcIfqXmE8C9HjYRYT6MZAFCSSUw6bA9T/ueWR3M4u0=;
        b=lY4KaeFSskzM9j7/tuEBUKFJM0/nV20K3KyyqgGkl+TgHHsQAls6eXNOooUMWsGQ/o
         JGifGnCQS2xJ56CN36JiJM0Yln3O++0ILFKiZl8JGhWjV2pLSWAE6tMgEqXtGFwzffPf
         38ot09Mygu2iMpbgmi5TpofB9q2H6F2ZYlrmirIIsaqYb42aC3BrNUJk3nuayAgUPFdQ
         ofrTXOHcDAuB0xbExwY4WrE2XFFK/g8cK9P0NuQlEplgVKESAX4KDVc9MmPJpKLKBLMF
         9bRci9EdFx8U8QKrwrf7izWRaBhlh9T2okYECFR9lueQAavIBhsQqHZjgBZHzaraGbcA
         1Gmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685118569; x=1687710569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nYcIfqXmE8C9HjYRYT6MZAFCSSUw6bA9T/ueWR3M4u0=;
        b=jBaDWmDoJtgq11LLRW62U1lbEGhFLeryAmsJjbUu9F1IRlb4dRDs68GEUfJ7JyaRsf
         NNxsi/g1KV6bbOFFdeBKlTnQRNqQ53jaLT5t8A+130se+CuBRwYHm5O+kQbHH5YAH4aH
         1v5XD4y9XYwBrES6KNbXUg1LV3Hqkz+gkY31TZcCI7ZiJqAx0mjtDcLcZdlV3/NVd0ng
         5G9DxGVz61cemZr/fmN3a4N3qpNpKyN8CIM3aNp59kClC9/lAoKgNgrLM45deaGlNvnP
         G6nsV+NQS9bswFd+ax0w0jSscSkiSWIMZYpj6u26EDUt5J4wIMZOXV0RcbodGdwNHyBu
         qkdQ==
X-Gm-Message-State: AC+VfDwJACIhP7CWzdkwt9ZncwOG3VPVKgcuYsD+fge+JdnlSMr7dq+p
	ITVL7x02fij72TBTr0jPvye+0YS2E77QyQ3U/xIv1tTX9BocSmIkw+CEz9yL
X-Google-Smtp-Source: ACHHUZ7ZYLdXlyRYcLdP/fi06ragZI9cyKA63fZaTVJjC0nV5T8mXp+IhSzCzu9ystakOKngOqC0WnVa4Hwuqz2M+gU=
X-Received: by 2002:adf:e4cf:0:b0:306:475d:92ff with SMTP id
 v15-20020adfe4cf000000b00306475d92ffmr1475570wrm.3.1685118569033; Fri, 26 May
 2023 09:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <LV2PR12MB601419E4F59555BBCB4EE70FCD419@LV2PR12MB6014.namprd12.prod.outlook.com>
 <CAH2-KxAdhmj98prJ2QCuN4p1ZxRZs3ZFdchxdZ-_A9c-ACpMOQ@mail.gmail.com> <LV2PR12MB6014D3A0F42E3124DA926C3FCD479@LV2PR12MB6014.namprd12.prod.outlook.com>
In-Reply-To: <LV2PR12MB6014D3A0F42E3124DA926C3FCD479@LV2PR12MB6014.namprd12.prod.outlook.com>
From: Ed Tanous <edtanous@google.com>
Date: Fri, 26 May 2023 09:29:17 -0700
Message-ID: <CAH2-KxAfBX38cAKNcA37_yLbT3VY4GcG4ip=-6huueXyj82jsg@mail.gmail.com>
Subject: Re: Prioritizing URIs with tight performance requirement in openBmc
 with bmcweb
To: Rohit Pai <ropai@nvidia.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, May 26, 2023 at 8:16=E2=80=AFAM Rohit Pai <ropai@nvidia.com> wrote:
>
> Hello Ed,
>
> Thanks for your response and feedback. Please find my answers to your que=
stions below.

One additional test, can you enable handler tracking and provide the result=
?
https://www.boost.org/doc/libs/1_82_0/doc/html/boost_asio/overview/core/han=
dler_tracking.html

That will give a better idea of what specific callback is stalling,
and for how long.
One thing I've considered is just putting a hard cap of, say, 100ms on
the individual handlers, where if any handler takes longer than that,
print to the console.  That would allow us to much more easily find
the flows that are taking too long in practice.  I would expect most
individual context handlers to complete in < 10 ms, unless they're
processing too much data.

>
> > > What other constraints are here?  We're talking about a TCP protocol,=
 running on a network, on a multi-process CPU.  Are these hard realtime req=
uirements?  It's unlikely you're going to get hard realtime guarantees from=
 Redfish.
> No these are not hard real time requirements. The latency can go more tha=
t 500ms in some instances, but we want to target the outliers (samples whic=
h take more than 500ms of TAT) to be less than one percent of the total sam=
ples.
> We also want to limit the max latency of the power, thermal metric URI un=
der 1s. The fabric bmc periodically polls this URIs from our platform and i=
mplements the PID loop control based on the response of this URI so its cri=
tical for us to limit the max latency of this URI.
>
> >>         A            B                                 C             D
> >> TCP=E2=94=80=E2=96=BATLS=E2=94=80=E2=94=80=E2=96=BAHTTP Connection=E2=
=94=80=E2=96=BADBus=E2=94=80=E2=96=BADaemon
> >> Which location are you seeing queuing problems?
> The time spent in route handler after getting the response from the backe=
nd daemon is affecting the next URI which is waiting in the queue.

To make sure we're clear, the route handler is the part JUST calling
DBus and turning it into json objects.  The json object serialization
happens outside the router call, so it isn't taking significant time
in your tests?

> From our tests we see that the backend daemon responds on an average with=
in 200ms. Since this is async this has no impact.
> The response received from the dbus backend has around 2500 properties to=
 process. Processing of this in the route handler and preparing the respons=
e it's taking avg time of 200ms (max time of 400 ms and several instances g=
oing close to 300ms). The Avg CPU consumption during the test is 50% and av=
g bmcweb consumption is between 12 to 15%.

This is not so bad;  I'm assuming you're not running encryption?

>
>
> >> What is the ballpark for how big "huge amount" of data would be?  What=
 processing is being done?
> The JSON in the HTTP response is around 400KB.

First of all, let's do the easy things to reduce the size.  Start by
making the json not pretty print (change the nlohmann::json::dump()
call in http_connection.hpp to do that), or switch your clients to use
CBOR encoding, which was added a few months ago, to reduce the payload
size being sent on the wire.

> The route handler logic makes the GetManagedObjects call to the backend s=
ervice and processes the response which has around 2500 properties to loop =
through.

Can you please change this to Properties GetAll and see if that
improves your consistency?  We never really intended messages to get
THAT big, so the fact that you're seeing some blocking isn't that
surprising.  Also keep in mind, the data structures we use for the
GetManagedObjects call haven't really been optimized, and create a
bunch of intermediates.  If you profile this, you could likely get the
DBus message -> nlohmann json processing time down by an order of
magnitude.

> There is no specific business logic here which is time consuming but it's=
 the number of properties which seem to have significant impact.
>
> >> One thing I've considered before is switching bmcweb over to boost::js=
on, which can do incremental chunked parsing, unlike nlohmann, which would =
let us unblock the flows as each processes the data.
> Do you have any pointers for this ? where exactly we would be unblocking =
the flow in route handler after processing chunk of properties from the bac=
kend OR somewhere else?

boost/json is in the package and has better documentation than I have.
In terms of unblocking, we could actually write out values
incrementally as the dbus responses are returned, so we reduce the
memory required, and in theory reduce the amount of time we block on
any one handler.  Even if we didn't do that fully, we could, say,
process 4kB worth of data, then return control to the io_context
through boost::asio::dispatch so that other traffic could be
processed.

>
> >> Can you share your test?  Is your test using multiple connections to e=
nsure that the thermal metric is being pulled from a different connection t=
han the aggregation URI?
> In the test we have two clients connected to our platform.
> One client does power, thermal metric URI polling for every 500ms. We hav=
e single aggregate URI for this which combine all power, thermal sensors. W=
e have close to 100 sensors. This is the URI where we have strict performan=
ce requirement.
> Other client periodically polls stats and counters aggregate URI for ever=
y 5 seconds. This is the URI which has around 400KB of JSON response and ha=
s 2500 dbus properties to process. We are not very particular about the lat=
ency of the
> stats and counters URI. In the test result we see that power, thermal met=
ric URI has max latency time of 1.2 seconds (min is 2ms and avg is 9ms) and=
 around 3.5% outliers (samples took more than 500ms). We can see that whene=
ver bmcweb code is busy preparing the response for the stats and counter UR=
I and there is request for thermal metric URI then latency of the thermal m=
etric URIs is affected.
> If we limit the number of properties in the stats and counters URI, then =
we can meet the requirement, but we need to create lot of aggregate URIs. I=
t would not be convenient for the customers to use many aggregate URIs and =
then combine the response.  Is there way to process chunk of properties in =
the route handler and voluntarily release the context for bmcweb to process=
 the next URIs in the queue ? any other trick which can work here ?

Can you share your test code?  Which URIs are you hitting that are
calling GetManagedObjects?

FWIW, as an overall theme, I do wonder if the speed gained by going to
GetManagedObjects is worth it in the long run.  It seems to
significantly effect stability, because even objects added that the
route doesn't care about have to be processed, and as systems are
getting larger, the GetManagedObjects responses are getting larger,
for no change that the user sees.  Said another way, we're throwing
away significantly more data.

>
>
> > Here the idea is to develop a new application server to serve the URIs =
which have strong latency requirements and route the rest of the URIs to bm=
cweb.
> >> This is the part I don't understand;  If the forwarding calls in this =
new server are blocking to bmcweb, what's the point of adding it?
> The backend for the thermal metrics and stats/counters metrics is differe=
nt so we would not be blocked on the same service.

I find it unlikely that we'll be able to all agree on what is "high"
priority (some people see any http call is low priority), so unless
this was easily configurable what the priority is for a given route,
I'm not sure this kind of architecture would work.  My preference
would be to:
1. Optimize the callbacks that are taking too much time, and make them
call boost::asio::dispatch during long loops.
2. Use threads to ensure there's more resources available that don't
block (this only works up to N connections, whatever N is for thread
count).


Thanks for the discussion;  Let me know what you find.


> With a reverse proxy our idea is to forward thermal metrics to another ba=
ckend application server (new bmcweb server or a similar lightweight server=
 instance) and all other URIs to the existing bmcweb.
>
> I will share any further results from our internal tests as we tryout dif=
ferent things.
>
> Thanks
> Rohit PAI
>
>
> -----Original Message-----
> From: Ed Tanous <edtanous@google.com>
> Sent: Wednesday, May 24, 2023 9:57 PM
> To: Rohit Pai <ropai@nvidia.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: Prioritizing URIs with tight performance requirement in open=
Bmc with bmcweb
>
> External email: Use caution opening links or attachments
>
>
> On Wed, May 24, 2023 at 2:36=E2=80=AFAM Rohit Pai <ropai@nvidia.com> wrot=
e:
> >
> > Hello All,
> >
> >
> >
> > We have a requirement in our platform to serve a few specific URI with =
a tight performance requirement on the turnaround time (latency).
> >
> > One such example is the telemetry sensor metric URI which has power, th=
ermal data can have a max turnaround time of 500ms.
>
> What other constraints are here?  We're talking about a TCP protocol, run=
ning on a network, on a multi-process CPU.  Are these hard realtime require=
ments?  It's unlikely you're going to get hard realtime guarantees from Red=
fish.
>
> >
> >
> >
> > The current bmcweb design uses only a single thread to serve all URI re=
quests/responses.
> >
> > If bmcweb is processing a huge amount of data (which is common for aggr=
egation URIs) then other requests would get blocked and their latency time =
would get impacted.
>
> The bmcweb queuing flow looks something like:
>
>         A            B                                 C             D
> TCP=E2=94=80=E2=96=BATLS=E2=94=80=E2=94=80=E2=96=BAHTTP Connection=E2=94=
=80=E2=96=BADBus=E2=94=80=E2=96=BADaemon
>
> Which location are you seeing queuing problems?  Keep in mind, HTTP
> 1.1 can only process a single request/response at a time per connection, =
so if your system is trying to process things from a single connection at A=
, you're right, long requests will block short ones.
>
> >
> > Here I am referring to the time bmcweb takes to prepare the JSON respon=
se after it has got the data from the backend service.
>
> What is the ballpark for how big "huge amount" of data would be?  What
> processing is actually being done?   This would be the first time that
> json parsing itself has actually shown up on a performance profile, but w=
ith expand + aggregation, you're right, there's potential for that.
>
> One thing I've considered before is switching bmcweb over to boost::json,=
 which can do incremental chunked parsing, unlike nlohmann, which would let=
 us unblock the flows as each processes the data.
>
> >
> > In our platform, we see that power thermal metric URI can take more tha=
n 500ms when it=E2=80=99s requested in parallel to other aggregation URI wh=
ich have huge response data.
>
> Can you share your test?  Is your test using multiple connections to ensu=
re that the thermal metric is being pulled from a different connection than=
 the aggregation URI?
>
> >
> >
> >
> > To solve this problem, we thought of a couple of solutions.
> >
> >
> >
> > To introduce multi-threading support in bmcweb.
>
> Sure, I have no problem with adding threads, and it really wouldn't be to=
ugh to accomplish as a test:
> 1. Link pthreads in meson.  Make this a meson option so platforms that do=
n't need multiple threads can opt out of it.
> 2. go to each async_read and async_write call, and ensure that they are u=
sing a strand (to keep processing on the same thread for any one call).
> 3. Locate all of the global and cross connection data structures, and add=
 a mutex to each of them.  One of the global data structures is the Dbus co=
nnection itself, so if your performance problem exists on C or D above, it =
will likely still exist with multiple threads.
> 4. Update sdbusplus asio connection to support strands, ensuring that the=
 callbacks happen on the same thread they're requested.
> Alternatively, just set up a dbus connection per thread.
> 5. Test heavily to make sure we don't have threading access problems or m=
issing mutexes.
> 6. Update the DEVELOPING.md doc to account for multiple threads in the wa=
y we review code. (reentrancy, etc).  Most of the existing code should be r=
eentrant, but it's worth looking.
> There's likely a few other minor things that would need fixed, but the ab=
ove is the general gist.
>
> >
> > Does anyone have any experience/feedback on making this work?
> >
> > Is there any strong reason not to have multi-threading support in bmcwe=
b other than general guidelines to avoid threads?
>
> It increases the binary size beyond what can fit on a lot of BMCs (about =
10-20%) This is fine so long as you keep it as a compile option so people c=
an opt into threading support.  Historically, teaching and reviewing multi-=
threaded code has been an order of magnitude more difficult than single thr=
eaded code, so keeping the single thread significantly improves the review =
process, so please plan on having folks prepared to review code for multi-t=
hreaded correctness.
>
> >
> >
> >
> > To use a reverse proxy like nginx as the front end to redirect a few UR=
Is to a new application server.
>
> Please take a look at the OpenBMC tree around 2018-2019.  There were seve=
ral platforms that formerly used nginx as the front end to bmcweb, and have=
 since dropped it.  There was also a discussion on discord recently you mig=
ht look at.  I'm not really sure how nginx would solve your problem though.=
  The bmcweb reactor design looks similar to nginx (we use asio, they use l=
ibuv) already, so it's not clear to me what you would gain here, unless you=
 were running multiple processes of bmcweb?  Keep in mind, there'd need to =
be some sort of shared state in that case, so you have to do #3 in the abov=
e anyway.
>
> >
> > Here the idea is to develop a new application server to serve the URIs =
which have strong latency requirements and route the rest of the URIs to bm=
cweb.
>
> This is the part I don't understand;  If the forwarding calls in this new=
 server are blocking to bmcweb, what's the point of adding it?
> Feel free to just show the code of this working as well.
>
> >
> >        Has anyone experienced any limitations with nginx on openBmc pla=
tforms (w.r.t performance, memory footprint, etc)?
> >
> >        We also have the requirement to support SSE, Is there any known =
limitation to make such a feature work with nginx?
>
> It can be made to work.  AuthX tends to be the harder part, as implementi=
ng CSRF for SSE or websockets is a huge pain.
>
> >
> >
> >
> >
> >
> > Any other suggestion or solution to the problem we are solving to meet =
our performance requirement with bmcweb?
>
> 1. Audit your code for any blocking calls.  If you have any, put them int=
o a loop, process X bytes at a time, while calling boost::asio::dispatch in=
 between, to not starve the other tasks.
> 2. Move the bmcweb core to a json library that can do incremental seriali=
zation/deserialization.  boost::json would be my first choice.
> 3. I have patches to turn on uring, which lets us use boost::asio::random=
_access_file to fix #1 for blocking filesystem calls.
> 4. Set reasonable limits on the max aggregation size that is allowed at a=
 system level.  There were some proposals on gerrit.
>
>
> I would be worried about separating code into two classes (high priority/=
low priority) because everyone's opinions will differ about what should be =
"high" priority, and what should be "low" priority.  If that isn't configur=
able easily, I worry that we're going to have problems agreeing on priority=
, and I don't want to be in a situation where every developer is having to =
make priority calls for every system class.  I'm open to the possibility he=
re, but we need to make sure it keeps code moving.
>
> >
> >
> >
> >
> >
> > Thanks
> >
> > Rohit PAI
> >
> >
