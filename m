Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1102441C2
	for <lists+openbmc@lfdr.de>; Fri, 14 Aug 2020 01:34:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSNFy3nvYzDqhD
	for <lists+openbmc@lfdr.de>; Fri, 14 Aug 2020 09:34:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::131;
 helo=mail-lf1-x131.google.com; envelope-from=suichen@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=rK/GygjM; dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSNDy5YjlzDqX0
 for <openbmc@lists.ozlabs.org>; Fri, 14 Aug 2020 09:33:53 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id i19so3919709lfj.8
 for <openbmc@lists.ozlabs.org>; Thu, 13 Aug 2020 16:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fYA3kuy27YAzMKTEF2hPXnxyhyGLhx6qT6VAoMWk84M=;
 b=rK/GygjMQAQVfNOG4PpH6kUL64/zCz282YWVvqD/P/XBFCNQQAWVGOPOOM6GXp4jRe
 XwoNXZkJz8HWpj2c2dRbpYm+jlFEIEfz8HP6q0ICoYwAbdg5QOZcgd1+AiU8dPSj7O5I
 +zZJyFx71Pl5RZBCeGwao9Cbq4FShQiza3SKNTJ78iXv4NlBxX0bwGP4ziaeS+2o1K0g
 KAx2MwxrN9JiHSSVZRYZrDlPoN3SpizkHRxObtWfsAQI0yIVXp4dTW/5vaIFrL6t98fX
 v5+ubDvzn6uRGD5xtLpZenMYxDVJYsLKWh7aD99qt2fz7Or9dXUQc0ctN03pu/nqiCQ0
 ikLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fYA3kuy27YAzMKTEF2hPXnxyhyGLhx6qT6VAoMWk84M=;
 b=Ne3Co/Makp/IpkfUKcX15r7T504wRgLTkMOZdETir9F7yC6TJvM/xvZXPqfTldwUe8
 BfRtVuzBGmlKHzBUYGUzSNTD9QmDT42lCqAw12G4TeEAAxcedzS2DUGEWB2Rw9fC9r41
 ouN1d41bPIxVRaWwzwf0/eJqpEg2UpBuaB4Dbtsi6qd1pNwTycsxwz+nrdjZki1e1eWP
 s5zVOOIfcRw30xo8wmCpRImnlrWNIbdMb+SdqhNcGP28Te3p/iMBEFSEWpo69decOT2F
 BfnVXfI8FYFSKqmIa/G/JWCuQwbhPCxfdoIxDbvFKh61/KtQHWWj666OvvoSkiRWAywY
 Bdeg==
X-Gm-Message-State: AOAM530lCzAjQ5Iq2OK5VTe4L9Vx1Sl2Yk354/JjCYfv10w/3HzjWQL5
 4k6Kv9NXBGpx+OdSBlHuf1eWTMxmSGpSbzMSOTv3Fg==
X-Google-Smtp-Source: ABdhPJxr/1act0OcZUTSMHCZuQPuyPw3rchsjMhNBgmfu22+pSW363Jd2gL8zmf/BYqy3Po4aqpYQUkPsgV2TZ8iOlA=
X-Received: by 2002:a19:1c6:: with SMTP id 189mr3286057lfb.158.1597361624812; 
 Thu, 13 Aug 2020 16:33:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_a9xKze8pBf1zH0icAhQX55ESbtnqQMaTe-aTxnxBx5tfcCA@mail.gmail.com>
 <CACWQX82Or8bnTA8WDqrogpp16vEff7PoEB4ZK4b3tFwYKWSQZQ@mail.gmail.com>
 <CAJOps0swEoyi3kmbGWQ_xMVEUt+ZL+SGrYm2Fq4SCGd8wZtDFw@mail.gmail.com>
 <CACWQX80XASFj_5LBOeH6iQ84PO14suc34jZip9B7g-y4YYo_cQ@mail.gmail.com>
In-Reply-To: <CACWQX80XASFj_5LBOeH6iQ84PO14suc34jZip9B7g-y4YYo_cQ@mail.gmail.com>
From: Sui Chen <suichen@google.com>
Date: Thu, 13 Aug 2020 16:33:32 -0700
Message-ID: <CAJOps0t=HyM7sLgj9aamBBQD2hReMcZYP1icJjLc8Sr-8bx7zA@mail.gmail.com>
Subject: Re: Inconsistent performance of dbus call GetManagedObjects to
 PSUSensor in dbus-sensors
To: Ed Tanous <ed@tanous.net>
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
Cc: Peter Lundgren <peterlundgren@google.com>, Alex Qiu <xqiu@google.com>,
 Josh Lehan <krellan@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Drew Macrae <drewmacrae@google.com>, Jie Yang <jjy@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

There are some questions that I can answer quickly, the rest may take some =
time:

> What patches did you apply?
This one: https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/30348

> Profiles of dbus-asio-bmk are not worth looking at until the benchmark is=
 doing GetManagedObjects
Hmm, I believe it has been worth looking at in that it shows how a
DBus method call may be blocked by other ASIO work. But I have to
admit it hasn't shown much more insights.
Another reason I used "busctl tree" is we had observed inconsistent
performance with "busctl tree" as well.
The sequence of events obtained by having the microbenchmark execute
"GetManagedObjects" does not look much too different from that
obtained through "busctl tree": In both cases, we observe DBus calls
that "straddle" the other ASIO work that are running concurrently. An
example might be found here: https://imgur.com/a/ZiQdcX0 ; The second
row on the top panel are rectangles that represent method call-method
return pairs. One could see that the highlighted method call-return
pair takes significantly longer than the other GetManagedObjects
method calls, and during the same time, the io_context@.post row on
the lower pane is filled with activities. These activities are the
sleep() functions run by the "fake sensor reading" procedures in the
benchmark.
I am looking at a more important issue I'm aware of that is related to
the "worthiness" of the benchmark: On the BMC, DBus calls do not
appear to align perfectly with the async_read_some(null_buffers) asio
handlers as they seem to be in the microbenchmark (see the screenshot
here: https://imgur.com/a/FIUM4W6 ). This gap needs to be filled by
some more investigation.
I suspect this might be the 7.7x single-core performance difference
(as measured via LMBench) between the particular BMC and the host, as
well as the BMC's DBus being a lot busier than the host's. Perhaps
some other methods are needed in place of this "capture DBus and
capture ASIO handler logs and align them" approach.

> Another option is to make it 2 threaded, one set up dbus traffic, another=
 for async io
We experimented with a similar architecture using "Mode 32" in
hwmon-bmk (described in
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-tools/+/35387),
but we only measured sensor reading times there. This method did not
speed up sensor reading much. It might help DBus though. But
eventually we want to address both sensor reading time and DBus
response time for dbus-sensors.

> ASIO priority queue
This sounds promising. We will look into it, for both the DBus
scheduling issue and the scalability differences we had observed in
hwmon-bmk.

> Can you detail what methods (in https://gerrit.openbmc-project.xyz/c/open=
bmc/openbmc-tools/+/35387 )?
On top of patch 30348, we have 8 std::threads that directly run
PSUSensors::prepareInput and do not use ASIO, and the main asio worker
thread for handling the rest of the original PSUSensor logic. This
corresponds to "Mode 7" in the description in hwmon-bmk (change
35387). We found that this roughly halves the total time it takes to
read the 247 sensors. To compare, a user would need to start a very
large number of threads (say, 32, 64 or 128) for the io_context to
achieve the same speedup as can be seen in "Mode 42" in the
descriptions of hwmon-bmk (change 35387).

> Dumps
The dump for the particular dbus-asio-bmk run is here:
https://www.dropbox.com/sh/1xmo6vrz13zjkca/AADf1ySDYXyH6XIc7n2Hqc1Ba?dl=3D0
For the dump from the actual BMC, a scrub process may be needed and I
can't do it quickly yet.

I have set the mail to plaintext mode this time.



On Thu, Aug 13, 2020 at 7:54 AM Ed Tanous <ed@tanous.net> wrote:
>
> On Wed, Aug 12, 2020 at 6:38 PM Sui Chen <suichen@google.com> wrote:
> >
> > Hello,
> >
> > Because machine configurations may change during development, we used a=
 microbenchmark to try to isolate the cause and reproduce the long DBus lat=
encies reliably, and another microbenchmark to demonstrate the idea we had =
tried that appeared to alleviate but not completely eliminate this DBus lat=
ency problem.
>
>
> This works great, so long as you constrain things to the way they look
> on the bmc, and don't look at things too closely.  One thread, pinned
> to a single core tends to work best for reproducing this kind of
> stuff.  If you can also pin something else to that same core that's
> doing some work, it tends to be closer to a real bmc.  Also remember,
> context switches are much cheaper on x86 multicore than they are on
> other, less capable single core processors.  You need to keep that in
> mind when running your microbenchmarks on a different platform, as the
> profiles can vary significantly, especially in the worst case.
>
> >
> >
> > The first microbenchmark, dbus-asio-bmk (https://gerrit.openbmc-project=
.xyz/c/openbmc/openbmc-tools/+/35576) mimics our patched psusensor: an ASIO=
 worker that reads sensors at some fixed timer interval; the ASIO worker is=
 also used by sdbusplus for handling DBus work. We continuously run "busctl=
 tree" against the DBus interface created by the microbenchmark binary.
>
> What patches did you apply?
>
> >
> >
> > By importing the resultant DBus traffic dump and ASIO handler activity =
log onto the timeline view form dbus-vis, we can clearly see the the "senso=
r reading" ASIO work items block the DBus work items, which in turn causes =
very long DBus latencies to show up:
>
>
> All I see is that there's a long lag between a single read of a busctl
> tree call. I don't see any indication that it's because of sensor
> reading specifically, at least from below.  Dumping the state of the
> work queue would explain a lot about what's going on during these
> periods.  I wonder if this is as easy as smearing the initial start
> time of each sensor when the application starts to make sure the
> timers don't synchronize like this.
>
> >
> > Although this benchmark is run on an x86 workstation instead of the BMC=
 due to a run-time error in its dependencies, according to the results abov=
e, we see this "thundering herd" problem appear to occur on a desktop platf=
orm as well.
>
>
> One odd thing I notice in that graph: we're using null_buffers?  I
> thought we were using a direct async read call.
>
> The other thing to realize is busctl tree is very inefficient.  It
> executes a full introspection of all levels, then executes
> GetProperties for each property.  You really need to move your
> microbenchmark to GetManagedObjects (which I see you recognize below)
> as that's more indicative of what a real caller would do.  I don't
> think your profiles are worth looking at until you do this.
>
> >
> >
> > As we modify various experimental parameters, it turns out that the mor=
e time is occupied by non-DBus ASIO work the more likely long DBus latencie=
s are to happen, since there is a higher chance the DBus calls clash with t=
he "fake sensor reading". Thus, we come up with an assumption that if we re=
duce the time spent (by the only ASIO worker) in non-DBus ASIO work, DBus l=
atencies will be reduced.
>
>
> Another option is to make it 2 threaded.  Have one thread (and
> io_context) set up for handling dbus traffic, and one thread set up
> for async reading of IO, with an atomic data structure in between for
> passing values.
>
> Another (probably preferred in this case) architecture would be to
> implement an ASIO priority queue, and prioritize the dbus traffic
> higher than the IO reading traffic.  There are examples of this in
> asio, and I assumed the day where we needed this would've come a lot
> sooner (we got away with a dumb fifo io queue for a long time), but
> here we are.
>
> >
> >
> > Based on this assumption, we attempted a few methods to reduce the time=
 it takes psusensor to read the sensors. The second benchmark (https://gerr=
it.openbmc-project.xyz/c/openbmc/openbmc-tools/+/35387) explains the method=
s we had experimented with. It turns out we were able to reduce sensor read=
ing time as well as the chance of long DBus method calls happening, but the=
 inconsistent DBus call times do not completely go away. This is probably d=
ue to psusensors being much more complex than the two benchmarks with much =
other work contending for the ASIO worker's time.
>
> Can you detail what methods?  It might help someone else pinpoint
> another good option.
>
> >
> >
> > So to summarize the point of this reply is to say:
> > 1) We had attempted the ASIO handler dump as suggested and a method for=
 analyzing DBus+ASIO performance has been embodied in dbus-vis.
>
> Can you post the dump somewhere that others can help analyse?
>
> >
> > 2) We are interested to know if someone else is looking at similar prob=
lems.
>
>
> Ps, I'd be remiss if I didn't point out that your last email was sent
> as HTML.  This list prefers plaintext.
>
> >
> > 3) We will examine GetManagedObjects again when we get a chance.
