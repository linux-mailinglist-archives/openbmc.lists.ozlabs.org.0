Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB5B70FBAD
	for <lists+openbmc@lfdr.de>; Wed, 24 May 2023 18:27:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QRGn00tqbz3fBM
	for <lists+openbmc@lfdr.de>; Thu, 25 May 2023 02:27:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=VVPhRQPr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com; envelope-from=edtanous@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=VVPhRQPr;
	dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QRGmN3nsmz3f6n
	for <openbmc@lists.ozlabs.org>; Thu, 25 May 2023 02:26:59 +1000 (AEST)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-309550263e0so1030503f8f.2
        for <openbmc@lists.ozlabs.org>; Wed, 24 May 2023 09:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684945612; x=1687537612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IdPA7xd4WA555c/qujD4lDSWXoZHJKsPT/QB50iTxek=;
        b=VVPhRQPruazjK6QXBfVOQMqWydahE09YvBOCMjY51O+W464EYARL7R9m7CSABZr9mh
         IDCEydEEfAZs+fmgWcc0S1Uv6phCFIqo5DpYpbvo2FDEc+USDGbV1YRKnasp+INNANH9
         qNSJhfcoEUNygWZ4WF5XrgzQsL1B5s5/E1ybB+eIOCvYm+d4AC10ehsXEV6x5De+W3Co
         tNDvT2fosCzsN8gvzT+BqU6EfdYKiInEwJJwuMNR4/iGNrptvqWtcf5pxfwKuWl5NdGM
         J/28Lc5zrkMAZYA6J54yVxKoMIJm89HX0G3t75ZTQYQZkNlxL/MYF8b/1Y3ZTmU/emYs
         6YeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684945612; x=1687537612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IdPA7xd4WA555c/qujD4lDSWXoZHJKsPT/QB50iTxek=;
        b=W3FiISSFCkRH3fnRXSXgyw4hkiODmKdkAK/+cq0xEU0dHNqg2lirDtHh02u7BOAnua
         yEI3LlZt4pSq6g9hTvS9iDuVOTrJ0d0SRTRH1ho8kH6D+y9NzsJQUDJbE0jfhMfcXZX0
         heuQB8owUi+g0/IlJ7OnMhSM6HVhgNA6V+fZFiaupD+IW6cc3rTJEnoUwsLtTtUcEAPD
         Xz4Am1ekkue3rfXucz7ozzZH0ipDtiozyBoPbG6Z6WpaWLUpMhjSp3tx4UARbw36cLdl
         6Cti2gFEqZjliS6LvUofAcJJ/BxukcbCQsmh8CyD6DSGryyKBXbHSZJI7+YyBr41Bbvf
         7aqw==
X-Gm-Message-State: AC+VfDxXwCx7kqV7wL/Z/7Gnhg1m5uA+5ZMiMDLMGi12+xljW8i2nH84
	Fai8tydqzmiu7dZn7c2F3DQvb6XKwheeLTbxkQOA31jopgoYcvl4OtEa/hyL
X-Google-Smtp-Source: ACHHUZ5Sw6BrXNrVRy1n1X+YhvN7TZl7eibveMufn0pXfHLwypywx+1bjbmAJ3am7z2To7r0p8Luhyb5ygMkcCJg8UA=
X-Received: by 2002:adf:e60b:0:b0:306:32fa:6750 with SMTP id
 p11-20020adfe60b000000b0030632fa6750mr260288wrm.33.1684945611965; Wed, 24 May
 2023 09:26:51 -0700 (PDT)
MIME-Version: 1.0
References: <LV2PR12MB601419E4F59555BBCB4EE70FCD419@LV2PR12MB6014.namprd12.prod.outlook.com>
In-Reply-To: <LV2PR12MB601419E4F59555BBCB4EE70FCD419@LV2PR12MB6014.namprd12.prod.outlook.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 24 May 2023 09:26:40 -0700
Message-ID: <CAH2-KxAdhmj98prJ2QCuN4p1ZxRZs3ZFdchxdZ-_A9c-ACpMOQ@mail.gmail.com>
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

On Wed, May 24, 2023 at 2:36=E2=80=AFAM Rohit Pai <ropai@nvidia.com> wrote:
>
> Hello All,
>
>
>
> We have a requirement in our platform to serve a few specific URI with a =
tight performance requirement on the turnaround time (latency).
>
> One such example is the telemetry sensor metric URI which has power, ther=
mal data can have a max turnaround time of 500ms.

What other constraints are here?  We're talking about a TCP protocol,
running on a network, on a multi-process CPU.  Are these hard realtime
requirements?  It's unlikely you're going to get hard realtime
guarantees from Redfish.

>
>
>
> The current bmcweb design uses only a single thread to serve all URI requ=
ests/responses.
>
> If bmcweb is processing a huge amount of data (which is common for aggreg=
ation URIs) then other requests would get blocked and their latency time wo=
uld get impacted.

The bmcweb queuing flow looks something like:

        A            B                                 C             D
TCP=E2=94=80=E2=96=BATLS=E2=94=80=E2=94=80=E2=96=BAHTTP Connection=E2=94=80=
=E2=96=BADBus=E2=94=80=E2=96=BADaemon

Which location are you seeing queuing problems?  Keep in mind, HTTP
1.1 can only process a single request/response at a time per
connection, so if your system is trying to process things from a
single connection at A, you're right, long requests will block short
ones.

>
> Here I am referring to the time bmcweb takes to prepare the JSON response=
 after it has got the data from the backend service.

What is the ballpark for how big "huge amount" of data would be?  What
processing is actually being done?   This would be the first time that
json parsing itself has actually shown up on a performance profile,
but with expand + aggregation, you're right, there's potential for
that.

One thing I've considered before is switching bmcweb over to
boost::json, which can do incremental chunked parsing, unlike
nlohmann, which would let us unblock the flows as each processes the
data.

>
> In our platform, we see that power thermal metric URI can take more than =
500ms when it=E2=80=99s requested in parallel to other aggregation URI whic=
h have huge response data.

Can you share your test?  Is your test using multiple connections to
ensure that the thermal metric is being pulled from a different
connection than the aggregation URI?

>
>
>
> To solve this problem, we thought of a couple of solutions.
>
>
>
> To introduce multi-threading support in bmcweb.

Sure, I have no problem with adding threads, and it really wouldn't be
tough to accomplish as a test:
1. Link pthreads in meson.  Make this a meson option so platforms that
don't need multiple threads can opt out of it.
2. go to each async_read and async_write call, and ensure that they
are using a strand (to keep processing on the same thread for any one
call).
3. Locate all of the global and cross connection data structures, and
add a mutex to each of them.  One of the global data structures is the
Dbus connection itself, so if your performance problem exists on C or
D above, it will likely still exist with multiple threads.
4. Update sdbusplus asio connection to support strands, ensuring that
the callbacks happen on the same thread they're requested.
Alternatively, just set up a dbus connection per thread.
5. Test heavily to make sure we don't have threading access problems
or missing mutexes.
6. Update the DEVELOPING.md doc to account for multiple threads in the
way we review code. (reentrancy, etc).  Most of the existing code
should be reentrant, but it's worth looking.
There's likely a few other minor things that would need fixed, but the
above is the general gist.

>
> Does anyone have any experience/feedback on making this work?
>
> Is there any strong reason not to have multi-threading support in bmcweb =
other than general guidelines to avoid threads?

It increases the binary size beyond what can fit on a lot of BMCs
(about 10-20%) This is fine so long as you keep it as a compile option
so people can opt into threading support.  Historically, teaching and
reviewing multi-threaded code has been an order of magnitude more
difficult than single threaded code, so keeping the single thread
significantly improves the review process, so please plan on having
folks prepared to review code for multi-threaded correctness.

>
>
>
> To use a reverse proxy like nginx as the front end to redirect a few URIs=
 to a new application server.

Please take a look at the OpenBMC tree around 2018-2019.  There were
several platforms that formerly used nginx as the front end to bmcweb,
and have since dropped it.  There was also a discussion on discord
recently you might look at.  I'm not really sure how nginx would solve
your problem though.  The bmcweb reactor design looks similar to nginx
(we use asio, they use libuv) already, so it's not clear to me what
you would gain here, unless you were running multiple processes of
bmcweb?  Keep in mind, there'd need to be some sort of shared state in
that case, so you have to do #3 in the above anyway.

>
> Here the idea is to develop a new application server to serve the URIs wh=
ich have strong latency requirements and route the rest of the URIs to bmcw=
eb.

This is the part I don't understand;  If the forwarding calls in this
new server are blocking to bmcweb, what's the point of adding it?
Feel free to just show the code of this working as well.

>
>        Has anyone experienced any limitations with nginx on openBmc platf=
orms (w.r.t performance, memory footprint, etc)?
>
>        We also have the requirement to support SSE, Is there any known li=
mitation to make such a feature work with nginx?

It can be made to work.  AuthX tends to be the harder part, as
implementing CSRF for SSE or websockets is a huge pain.

>
>
>
>
>
> Any other suggestion or solution to the problem we are solving to meet ou=
r performance requirement with bmcweb?

1. Audit your code for any blocking calls.  If you have any, put them
into a loop, process X bytes at a time, while calling
boost::asio::dispatch in between, to not starve the other tasks.
2. Move the bmcweb core to a json library that can do incremental
serialization/deserialization.  boost::json would be my first choice.
3. I have patches to turn on uring, which lets us use
boost::asio::random_access_file to fix #1 for blocking filesystem
calls.
4. Set reasonable limits on the max aggregation size that is allowed
at a system level.  There were some proposals on gerrit.


I would be worried about separating code into two classes (high
priority/low priority) because everyone's opinions will differ about
what should be "high" priority, and what should be "low" priority.  If
that isn't configurable easily, I worry that we're going to have
problems agreeing on priority, and I don't want to be in a situation
where every developer is having to make priority calls for every
system class.  I'm open to the possibility here, but we need to make
sure it keeps code moving.

>
>
>
>
>
> Thanks
>
> Rohit PAI
>
>
