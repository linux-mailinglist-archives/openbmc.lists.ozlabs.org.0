Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 59069245113
	for <lists+openbmc@lfdr.de>; Sat, 15 Aug 2020 16:07:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BTMZr41NmzDqSx
	for <lists+openbmc@lfdr.de>; Sun, 16 Aug 2020 00:07:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b43; helo=mail-yb1-xb43.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=kXXF9+P0; dkim-atps=neutral
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BTMX01ydWzDqM1
 for <openbmc@lists.ozlabs.org>; Sun, 16 Aug 2020 00:05:17 +1000 (AEST)
Received: by mail-yb1-xb43.google.com with SMTP id e14so6819502ybf.4
 for <openbmc@lists.ozlabs.org>; Sat, 15 Aug 2020 07:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rc/eJyOhqbk5btb7eWku3tM+ZrwIkCdS87g7WcEFp40=;
 b=kXXF9+P08d0Qg7cKUBDiRZc4sfMita3zzdjyol/jaWY2KiHdCF3FJVhixyASL60xAE
 Qwoox9u0fGJ6RMEymhVmIhWGn8EwOuc716b9xFQJWOC8Geg8/TEnTxDGee+5dPXnoPOZ
 ZQqSqQtz+6eTmXRsSW6sZJi2/VSWac67O75m5xKBT5Q7Flf8Mq45Um/tB6xz4N+RBmEm
 keH0XHt6sNNBlnWX5H//SheN9FJbz/IMgxjDJRaTibkDOUBP08+puMo3w3elSqDCycJK
 sSY8RL3BT1Gp8W18oX5uGiUMpTvCyhNvP7mjPsSKfHH14P64GxdzzY7BhQGPZ4myu63w
 g69Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rc/eJyOhqbk5btb7eWku3tM+ZrwIkCdS87g7WcEFp40=;
 b=skN4g5AW0woAUUiaJEnIZvwXOfLReXsXfiQ27fLUqQUpcd7zHSZ0xZbpX+h0ZZ9pIn
 S+fQkeIy77H+eAAPFe6CLzsMZCD4/Udm1HHvcSTrGstZlTIJg4TUsu23sQWHl7sl6P9s
 ZG4jZW4/9POAwrUAQXxnN6No6KsIaQypJnXPZkscqliTzMtg64Dwqw4BQseuLhf5r4W3
 3Q6T9gCzZenqA5VPw81uFy3xYrxojOeNvZjW6g2MXNsBlNaIGxMdPqjI/fyKi1iuB0Xz
 q0Ljgab/sx+ZesZ5nLWcAEDBPPR4z9GXGcsq1IUyAbj/JB7fQ3bVk/pZzfo6bm+UFHeP
 oh2g==
X-Gm-Message-State: AOAM5332oRqqOWbbGXeFdY+zYO4KNAQ4QbUKpfEWrwLgrxP/nLmbF/Za
 b3E3QOLv7/T3stdxwBNEPyTb5NRBBCfQgsF/pREAWw==
X-Google-Smtp-Source: ABdhPJwgDJgzdxRzei0zvN0sHudfrHwM6M2a8L1zjvNH3OIJRxiirqOAuA9u0QsOmvfgL/rly7G/mxg8X8T+k3RsDMg=
X-Received: by 2002:a25:14c4:: with SMTP id 187mr10567479ybu.449.1597500313783; 
 Sat, 15 Aug 2020 07:05:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_a9xKze8pBf1zH0icAhQX55ESbtnqQMaTe-aTxnxBx5tfcCA@mail.gmail.com>
 <CACWQX82Or8bnTA8WDqrogpp16vEff7PoEB4ZK4b3tFwYKWSQZQ@mail.gmail.com>
 <CAJOps0swEoyi3kmbGWQ_xMVEUt+ZL+SGrYm2Fq4SCGd8wZtDFw@mail.gmail.com>
 <CACWQX80XASFj_5LBOeH6iQ84PO14suc34jZip9B7g-y4YYo_cQ@mail.gmail.com>
 <CAJOps0t=HyM7sLgj9aamBBQD2hReMcZYP1icJjLc8Sr-8bx7zA@mail.gmail.com>
In-Reply-To: <CAJOps0t=HyM7sLgj9aamBBQD2hReMcZYP1icJjLc8Sr-8bx7zA@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Sat, 15 Aug 2020 07:05:02 -0700
Message-ID: <CACWQX83vxiO9QrqbyxEpUPgZ_bmiZNnhgYhMC4WH4wUUR8c1mA@mail.gmail.com>
Subject: Re: Inconsistent performance of dbus call GetManagedObjects to
 PSUSensor in dbus-sensors
To: Sui Chen <suichen@google.com>
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

On Thu, Aug 13, 2020 at 4:33 PM Sui Chen <suichen@google.com> wrote:
>
> There are some questions that I can answer quickly, the rest may take som=
e time:
>
> > What patches did you apply?
> This one: https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/303=
48

Looking at this patch, I get the feeling this is specifically the
cause of your problems.  Have you tried your things on master yet,
without that patch, to see if it exhibits the same behavior?  There's
a good reason each sensor has an independent timer instance;  The
intent is that when the sensor system gets overloaded, the readings
get delayed, and each individual timer introduces its own
load-specific delays as it's started after the read completes.  Said
another way, technically, a sensor scan rate isn't exactly 1 second,
it's 1 second + queuing time + the time it takes to read the sensor,
so if the sensor takes a long time to read (because the system is
overloaded) the sensor scans don't collapse into one another and cause
problems like you're seeing, and you still (hopefully) have
significant idle time in the io_context to handle other things, like
managing dbus connections.  (as a side note, for i2c based sensors,
this keeps the latency of other operations on the bus down as well.
Unfortunately, that patch kinda puts all that design on its head.
"Avoid timer skew" is in the commit message.  That skew is there on
purpose, to prevent the problem you're seeing.  With that said, I'm
sure Josh was trying to fix something there, but in the commit message
he doesn't actually outline what the problem is.  Do you know?  My
best guess is maybe he was trying to get more accurate scan rates?  We
could think up designs that have some logic that, in the base case
handles the loop more accurately but spreading out the sensor scans is
a good thing in general and reduces the peak work queue size (as
you've already found out).
Maybe there were some different performance issues that putting all
the sensor scans together solved?


>
> > Profiles of dbus-asio-bmk are not worth looking at until the benchmark =
is doing GetManagedObjects
> Hmm, I believe it has been worth looking at in that it shows how a
> DBus method call may be blocked by other ASIO work. But I have to
> admit it hasn't shown much more insights.
> Another reason I used "busctl tree" is we had observed inconsistent
> performance with "busctl tree" as well.
> The sequence of events obtained by having the microbenchmark execute
> "GetManagedObjects" does not look much too different from that
> obtained through "busctl tree": In both cases, we observe DBus calls
> that "straddle" the other ASIO work that are running concurrently. An
> example might be found here: https://imgur.com/a/ZiQdcX0 ; The second
> row on the top panel are rectangles that represent method call-method
> return pairs. One could see that the highlighted method call-return
> pair takes significantly longer than the other GetManagedObjects
> method calls, and during the same time, the io_context@.post row on
> the lower pane is filled with activities. These activities are the
> sleep() functions run by the "fake sensor reading" procedures in the
> benchmark.

https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-tools/+/35576/2/suiche=
n/dbus-asio-bmk/dbus_asio_bmk.cpp#46
That sleep is not very genuine to what a sysfs read looks like, and is
why your IO loop in your microbenchmark looks odd.  Is it possible to
focus on real profiles from an actual BMC reading from hwmon?  I
suspect that will be faster getting to root cause in this case.

If you want to simulate an async reading of a sensor, use a
steady_timer instance with async_wait.  That's much closer to a real
sensor than sleep, as the reactor is aware of it, and can schedule
other work ahead of it while it waits for the sensor read to complete.


> I am looking at a more important issue I'm aware of that is related to
> the "worthiness" of the benchmark: On the BMC, DBus calls do not
> appear to align perfectly with the async_read_some(null_buffers) asio
> handlers as they seem to be in the microbenchmark (see the screenshot
> here: https://imgur.com/a/FIUM4W6 ). This gap needs to be filled by
> some more investigation.

See above.  (ps, this is making me want to play with dbus-vis more.
It looks much better than doing all this via text files).

> I suspect this might be the 7.7x single-core performance difference
> (as measured via LMBench) between the particular BMC and the host, as
> well as the BMC's DBus being a lot busier than the host's.
> Perhaps
> some other methods are needed in place of this "capture DBus and
> capture ASIO handler logs and align them" approach.

What approaches did you have in mind?  Most of what exists today in
dbus-sensors was debugged using those two things, but I'm always up
for something better.

>
> > Another option is to make it 2 threaded, one set up dbus traffic, anoth=
er for async io
> We experimented with a similar architecture using "Mode 32" in
> hwmon-bmk (described in
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-tools/+/35387),

That's super interesting, and the results don't really map to the
benchmarking I've done on the same thing.  One thing you don't list is
what BMC you're on, which might be some of the discrepancy.  Most of
my testing was on an ast2500, which is single core, and doesn't really
benefit (at least linearly) from extra threads.  If you can't list the
specific model publically, can you list at least a cpu architecture
type and core count you tested on?

The other thing I would say about that is that IMO you're measuring
the wrong thing.  The stat that thermal loops generally care about for
sensors is average sensor latency from reading to action (usually a
fan pwm change), not the actual time to read N sensors.  In network
terminology, dbus-sensors optimizes latency over throughput.  The
thinking is that the faster the thermal loop can act on each single
reading, the closer the thermal loop can be to the margin.

> but we only measured sensor reading times there. This method did not
> speed up sensor reading much. It might help DBus though. But
> eventually we want to address both sensor reading time and DBus
> response time for dbus-sensors.

Ignore the above idea.  Your problem is not what I thought it was.

>
> > ASIO priority queue
> This sounds promising. We will look into it, for both the DBus
> scheduling issue and the scalability differences we had observed in
> hwmon-bmk.

This would work in your case (assuming I understand what's going on,
which is a stretch), but I think the timer synchronization model is
broken.

>
> > Can you detail what methods (in https://gerrit.openbmc-project.xyz/c/op=
enbmc/openbmc-tools/+/35387 )?
> On top of patch 30348, we have 8 std::threads that directly run
> PSUSensors::prepareInput and do not use ASIO, and the main asio worker
> thread for handling the rest of the original PSUSensor logic. This
> corresponds to "Mode 7" in the description in hwmon-bmk (change
> 35387). We found that this roughly halves the total time it takes to
> read the 247 sensors. To compare, a user would need to start a very
> large number of threads (say, 32, 64 or 128) for the io_context to
> achieve the same speedup as can be seen in "Mode 42" in the
> descriptions of hwmon-bmk (change 35387).
>
> > Dumps
> The dump for the particular dbus-asio-bmk run is here:
> https://www.dropbox.com/sh/1xmo6vrz13zjkca/AADf1ySDYXyH6XIc7n2Hqc1Ba?dl=
=3D0
> For the dump from the actual BMC, a scrub process may be needed and I
> can't do it quickly yet.

That's a lot of interesting data, and I'm still unpacking it in my
head.  With that said, this is all great!  Keep it coming if you learn
anything else.

>
> I have set the mail to plaintext mode this time.

Excellent!


>
>
>
> On Thu, Aug 13, 2020 at 7:54 AM Ed Tanous <ed@tanous.net> wrote:
> >
> > On Wed, Aug 12, 2020 at 6:38 PM Sui Chen <suichen@google.com> wrote:
> > >
> > > Hello,
> > >
> > > Because machine configurations may change during development, we used=
 a microbenchmark to try to isolate the cause and reproduce the long DBus l=
atencies reliably, and another microbenchmark to demonstrate the idea we ha=
d tried that appeared to alleviate but not completely eliminate this DBus l=
atency problem.
> >
> >
> > This works great, so long as you constrain things to the way they look
> > on the bmc, and don't look at things too closely.  One thread, pinned
> > to a single core tends to work best for reproducing this kind of
> > stuff.  If you can also pin something else to that same core that's
> > doing some work, it tends to be closer to a real bmc.  Also remember,
> > context switches are much cheaper on x86 multicore than they are on
> > other, less capable single core processors.  You need to keep that in
> > mind when running your microbenchmarks on a different platform, as the
> > profiles can vary significantly, especially in the worst case.
> >
> > >
> > >
> > > The first microbenchmark, dbus-asio-bmk (https://gerrit.openbmc-proje=
ct.xyz/c/openbmc/openbmc-tools/+/35576) mimics our patched psusensor: an AS=
IO worker that reads sensors at some fixed timer interval; the ASIO worker =
is also used by sdbusplus for handling DBus work. We continuously run "busc=
tl tree" against the DBus interface created by the microbenchmark binary.
> >
> > What patches did you apply?
> >
> > >
> > >
> > > By importing the resultant DBus traffic dump and ASIO handler activit=
y log onto the timeline view form dbus-vis, we can clearly see the the "sen=
sor reading" ASIO work items block the DBus work items, which in turn cause=
s very long DBus latencies to show up:
> >
> >
> > All I see is that there's a long lag between a single read of a busctl
> > tree call. I don't see any indication that it's because of sensor
> > reading specifically, at least from below.  Dumping the state of the
> > work queue would explain a lot about what's going on during these
> > periods.  I wonder if this is as easy as smearing the initial start
> > time of each sensor when the application starts to make sure the
> > timers don't synchronize like this.
> >
> > >
> > > Although this benchmark is run on an x86 workstation instead of the B=
MC due to a run-time error in its dependencies, according to the results ab=
ove, we see this "thundering herd" problem appear to occur on a desktop pla=
tform as well.
> >
> >
> > One odd thing I notice in that graph: we're using null_buffers?  I
> > thought we were using a direct async read call.
> >
> > The other thing to realize is busctl tree is very inefficient.  It
> > executes a full introspection of all levels, then executes
> > GetProperties for each property.  You really need to move your
> > microbenchmark to GetManagedObjects (which I see you recognize below)
> > as that's more indicative of what a real caller would do.  I don't
> > think your profiles are worth looking at until you do this.
> >
> > >
> > >
> > > As we modify various experimental parameters, it turns out that the m=
ore time is occupied by non-DBus ASIO work the more likely long DBus latenc=
ies are to happen, since there is a higher chance the DBus calls clash with=
 the "fake sensor reading". Thus, we come up with an assumption that if we =
reduce the time spent (by the only ASIO worker) in non-DBus ASIO work, DBus=
 latencies will be reduced.
> >
> >
> > Another option is to make it 2 threaded.  Have one thread (and
> > io_context) set up for handling dbus traffic, and one thread set up
> > for async reading of IO, with an atomic data structure in between for
> > passing values.
> >
> > Another (probably preferred in this case) architecture would be to
> > implement an ASIO priority queue, and prioritize the dbus traffic
> > higher than the IO reading traffic.  There are examples of this in
> > asio, and I assumed the day where we needed this would've come a lot
> > sooner (we got away with a dumb fifo io queue for a long time), but
> > here we are.
> >
> > >
> > >
> > > Based on this assumption, we attempted a few methods to reduce the ti=
me it takes psusensor to read the sensors. The second benchmark (https://ge=
rrit.openbmc-project.xyz/c/openbmc/openbmc-tools/+/35387) explains the meth=
ods we had experimented with. It turns out we were able to reduce sensor re=
ading time as well as the chance of long DBus method calls happening, but t=
he inconsistent DBus call times do not completely go away. This is probably=
 due to psusensors being much more complex than the two benchmarks with muc=
h other work contending for the ASIO worker's time.
> >
> > Can you detail what methods?  It might help someone else pinpoint
> > another good option.
> >
> > >
> > >
> > > So to summarize the point of this reply is to say:
> > > 1) We had attempted the ASIO handler dump as suggested and a method f=
or analyzing DBus+ASIO performance has been embodied in dbus-vis.
> >
> > Can you post the dump somewhere that others can help analyse?
> >
> > >
> > > 2) We are interested to know if someone else is looking at similar pr=
oblems.
> >
> >
> > Ps, I'd be remiss if I didn't point out that your last email was sent
> > as HTML.  This list prefers plaintext.
> >
> > >
> > > 3) We will examine GetManagedObjects again when we get a chance.
