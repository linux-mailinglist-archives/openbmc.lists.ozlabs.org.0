Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECF8258470
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 01:35:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgRQk2hhYzDqW3
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 09:35:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Qu0NJ9Wx; dkim-atps=neutral
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgRPr3P3CzDqQs
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 09:34:55 +1000 (AEST)
Received: by mail-yb1-xb35.google.com with SMTP id u6so5050475ybf.1
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 16:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rex1EI2KNXo8AO310DB6jAsWrJSdETf8Y3ELRxfAZ4Q=;
 b=Qu0NJ9Wx1vXg2op6DD0U8SoU8L703zpsq3/M6ZmsIvjushCjCn0q0YqwKypiBhgMLh
 rRgWidqVImfyUBshiMhihKYinAG9L+CFYuVwUcPGbKEBSf+D/tHQZOf+uKfWwGT9636B
 gIxAOwBxduVyq0jU4c7TkhG5R6XVY7lCv2+RxHnWik2EtrpUKnP2pw3lzOMf9RXMSSPT
 ukKjuF6g/YqPxGBL4RgZ8EWhSiUgibHKSs/RQM/WjHxVRCUt3+K/H7d3WAfDlk6Tax9v
 RpXCzwt8GLPNN749RQnoFzlByf61JdtifFK8bsy+1VOODVHlwFJLYMOZvIctjHnf9QOj
 rSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rex1EI2KNXo8AO310DB6jAsWrJSdETf8Y3ELRxfAZ4Q=;
 b=UmO0GyazlU4TCzqAKUqWC0lH9mF6xEw75USEDZ8RENkVkmnIlar+VUwOqWXm5yzXb9
 kstI0jsV45glhLFiKQe22ScJ2k9eQYR0ktSFtCCS5I6QxzqbcxG1Do/gTZ2Q/wI43C3l
 0Q510F47jIIsWixii4GMs/w38TMBnlArXSxvmyh43gIup7EAnFE/6NWTR4uhDh4i8FRs
 bjTUxqlnqHKtZ5fNQZcODsKvfQYz8OdT9t0WvWThkBOt3CDUnEj9NxpVpx7T2qS3c/al
 GVPmVxVldGj9+qR5vokpEqG1shJZ44Ow1ZkjmRIg05GspbdVQwh0up7dB6P3N7A3YQxi
 K/kA==
X-Gm-Message-State: AOAM530eLlpqV7X2lClgAnS939pvh7RZuQo8pVerhjsnhE613c5ZohQk
 /SXOAzzOxOlNrXeFzxhLzreW8xRX3H0dNwAWjWp2fw==
X-Google-Smtp-Source: ABdhPJzXUkTUad1irBqusw6ZiK4eiUPkI99C3cpGE04rUtxMJR7Oanh7M1LKwfT0jq2NDJZVR2LGDSfIYgDE3KvqLl0=
X-Received: by 2002:a25:b212:: with SMTP id i18mr5876962ybj.148.1598916892108; 
 Mon, 31 Aug 2020 16:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_a9xKze8pBf1zH0icAhQX55ESbtnqQMaTe-aTxnxBx5tfcCA@mail.gmail.com>
 <CACWQX82Or8bnTA8WDqrogpp16vEff7PoEB4ZK4b3tFwYKWSQZQ@mail.gmail.com>
 <CAJOps0swEoyi3kmbGWQ_xMVEUt+ZL+SGrYm2Fq4SCGd8wZtDFw@mail.gmail.com>
 <CACWQX80XASFj_5LBOeH6iQ84PO14suc34jZip9B7g-y4YYo_cQ@mail.gmail.com>
 <CAJOps0t=HyM7sLgj9aamBBQD2hReMcZYP1icJjLc8Sr-8bx7zA@mail.gmail.com>
 <CACWQX83vxiO9QrqbyxEpUPgZ_bmiZNnhgYhMC4WH4wUUR8c1mA@mail.gmail.com>
 <CANPkJS_f1zkP1YK43UDt7eYM2WjG3AKB4US206ndnudZPh-i0Q@mail.gmail.com>
In-Reply-To: <CANPkJS_f1zkP1YK43UDt7eYM2WjG3AKB4US206ndnudZPh-i0Q@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 31 Aug 2020 16:34:41 -0700
Message-ID: <CACWQX81m4Rt-ifOrCkJB5boEc4at9CPmKt0iTCmgLUb7aGfBUA@mail.gmail.com>
Subject: Re: Inconsistent performance of dbus call GetManagedObjects to
 PSUSensor in dbus-sensors
To: Josh Lehan <krellan@google.com>
Content-Type: text/plain; charset="UTF-8"
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Drew Macrae <drewmacrae@google.com>, Jie Yang <jjy@google.com>,
 Sui Chen <suichen@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is great feedback BTW.  Keep it coming.

-Ed

On Mon, Aug 31, 2020 at 2:35 PM Josh Lehan <krellan@google.com> wrote:
>
> On Sat, Aug 15, 2020 at 7:05 AM Ed Tanous <ed@tanous.net> wrote:
> > On Thu, Aug 13, 2020 at 4:33 PM Sui Chen <suichen@google.com> wrote:
> > > > What patches did you apply?
> > > This one: https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/30348
> >
> > Looking at this patch, I get the feeling this is specifically the
> > cause of your problems.  Have you tried your things on master yet,
> > without that patch, to see if it exhibits the same behavior?  There's
> > a good reason each sensor has an independent timer instance;  The
> > intent is that when the sensor system gets overloaded, the readings
> > get delayed, and each individual timer introduces its own
> > load-specific delays as it's started after the read completes.  Said
> > another way, technically, a sensor scan rate isn't exactly 1 second,
> > it's 1 second + queuing time + the time it takes to read the sensor,
> > so if the sensor takes a long time to read (because the system is
> > overloaded) the sensor scans don't collapse into one another and cause
> > problems like you're seeing, and you still (hopefully) have
> > significant idle time in the io_context to handle other things, like
> > managing dbus connections.  (as a side note, for i2c based sensors,
> > this keeps the latency of other operations on the bus down as well.
>
> That's a good point.
>
> With each sensor having its own free-running timer, which auto-extends
> time if the system is delayed as you mentioned, that does provide a
> way for the timers to automatically slow down when the system is under
> heavy load and can't respond as quickly.
>
> I wonder if it would be worth adding some timing to detect this, and
> perhaps try to back off the timer duration somewhat? For example, if
> 1-second timers are bogging down too much, back the timer off to
> 2-second timers, and so on, until they have been slowed down enough to
> give the system enough time to avoid falling behind.

What you described would be better in theory, but I've never seen
sensor problems bad enough that would need something like that.
Usually the sensor reads back up, the kernel sorts them out in some
order (note, some day I'd like to understand better how that ordering
works, and if there's anything to optimize there) then we go to the
wait state, which allows the BMC to recover pretty quickly (a couple
seconds).  In theory, your change could allow the BMC to recover in a
more orderly way, leaving more gaps of CPU time.  My gut (ie, I have
zero data to back this up) says that we might get some minor latency
gains, at the expense of recovery time.  Which is better in that case,
IDK.

It'd be really cool if we had a mode where we could just dynamically
scale sensor reads as BMC CPU and IO resources allow, and not have
fixed scan rate.  In theory phosphor-pid-control is already timing
aware when it makes fan changes based on the integral component, so
that should "just work".  I wonder how other IO-driven applications do
CPU-usage based throttling in practice, and if it would be easy to
adapt to the BMC as the default.

>
> > Unfortunately, that patch kinda puts all that design on its head.
> > "Avoid timer skew" is in the commit message.  That skew is there on
> > purpose, to prevent the problem you're seeing.  With that said, I'm
> > sure Josh was trying to fix something there, but in the commit message
> > he doesn't actually outline what the problem is.  Do you know?  My
> > best guess is maybe he was trying to get more accurate scan rates?  We
> > could think up designs that have some logic that, in the base case
> > handles the loop more accurately but spreading out the sensor scans is
> > a good thing in general and reduces the peak work queue size (as
> > you've already found out).
> > Maybe there were some different performance issues that putting all
> > the sensor scans together solved?
>
> The sensor reading was causing the rest of the system to become
> unusably slow, even before making any changes. I had 3 goals in mind:
>
> 1) The pmbus driver seems to ask the hardware for new data if it has
> been long enough (HZ, roughly one second) since the last read, by
> comparing the system jiffies clock. As all sensors would have their
> own free-running timers, the driver readings would be smeared
> throughout time, causing this interval to be quickly and repeatedly
> reached. We suspected a driver was being slow, perhaps because of I2C,
> so we were seeing a system slowdown every second. By reading more
> sensors simultaneously, and then pausing for a while, I was hoping to
> avoid triggering this interval as often, thus taking advantage of some
> caching. The pmbus driver does a complete read of the chip every time
> this interval is triggered, thus if I can satisfy more sensors at a
> single interval, I don't need to do as many complete readings.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/hwmon/pmbus/pmbus_core.c#n584

Gotcha.  That makes considerably more sense.  Did you profile it, and
did your patch work?  I wonder how we could work around that in a less
invasive way, that keeps the smearing properties in time, but doesn't
cause such bad read errors.

Alternatively (again, with no data) I wonder if the pmbus kernel
driver needs some improvement to not do that, or decrease that time to
something more reasonable.  This requires more thought on my part, but
it's really good information overall.

>
> 2) In general, it's good practice to read sensors at fixed intervals,
> to avoid skew between sensor readings. An example is voltage and
> amperage. Ideally, you would sample them simultaneously, so that
> computations such as obtaining wattage (volts * amps) would be
> correct.

Yep, and this is why each sensor owns its own IO loop rather than
something global, so when things like the above come up, we can code
in IO actions in the order something that makes the most sense.  The
above doesn't mean we need to scan all sensors at the same time. we
just need to schedule "adjacent" sensors together.  Also, if we're
talking best case, we would be using ICs that can do that calculation
in hardware, but I realize we don't always get to pick the hardware we
have :)

> If the sensor readings were staggered, and you were reading
> something that was changing, your calculated wattage would be
> incorrect. Many embedded sensor networks have a command that
> broadcasts out to the worker nodes, to "lock" a sensor reading into
> local sensor memory, then, as time permits, the leader node can issue
> commands individually to collect data from each worker, knowing that
> the data was earlier all captured simultaneously. This technique
> improves the quality of collected data, and is often used in industry.
> I was hoping to bring PSUSensor a little closer to this ideal.

While I agree with you in the spirit of your example, I think we need
to build it in such a way that maps the things together that have
benefits of being together, while not imposing a single timer on the
whole system.  In the above example, I'd personally make sure that
PSUSensor did a Voltage reading and a current reading on the same
timing.  Also, in this case, doesn't PMBus already have a value
available for wattage that the PSU calculates in hardware?

Getting very accurate snapshots of the system state is great in a lot
of industries, but I don't think it applies much to BMCs.  As a
general rule, thermal control loops care the most about the delay
between reading and action, so in almost all cases, we'd never want to
read a "locked in" value from that past (unless we were doing system
modeling, which is a whole other thing) we'd much rather read the
"latest" value.

>
> 3) By synchronizing to one master timer, it becomes possible to slow
> down the sensor collection interval, and introduce some resting time
> between sensor data collection. The system became almost unusably slow
> during sensor data collection. By introducing a rest time between the
> readings, I was able to "PWM" the system load, and thus dial it down
> to make the system usable again, by changing the duty cycle to
> something like 70% instead of 100%.

Did you try lowering the process priority of the sensors that were
causing your issues?  I've long wondered if we should do that by
default, but never really had a system that was too overloaded to do
the investigations on.

>
> I wonder if it would be worth it, instead of having each sensor have
> its own free-running timer, to still have a single master time for all
> sensor collection, but stagger it? For example, let's say you need to
> read 200 sensors, and you need to do a complete reading once every 5
> seconds. Have the timer fire at intervals of 15 milliseconds. Collect
> one sensor reading each tick. This completes 200 sensors in 3000
> milliseconds. The system can then be quiet for the remaining 2000
> milliseconds of the interval, giving it a chance to catch up and
> remain responsive.

That would be an interesting experiment, but I think the root of the
issue is that no sensor, no matter how expensive to read should be
blocking other user space from running for a significant portion of
time.  Have you ever tried running a perf record session on your BMC
to see where it's spending all that time?  Is it in that pmbus kernel
loop you mentioned above?

I'm a little wary of trying to PWM it, because picking duty cycles is
going to rely on specifics of the implementation on that particular
system, and lead to a lot of necessary error/odd condition handling.
What if the same system has half the number of sensors?  What if it
has 4X?  What if you have a ground PMbus channel, and 4 of your 200
sensors take 10 seconds to read?

Trying to qualify all of those conditions gets really hairy, although
I suspect it could be done.

>
> Josh
