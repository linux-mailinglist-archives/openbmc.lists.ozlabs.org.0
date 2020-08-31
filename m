Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 586832583A6
	for <lists+openbmc@lfdr.de>; Mon, 31 Aug 2020 23:36:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgNnV4WhszDqNJ
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 07:36:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::62b;
 helo=mail-ej1-x62b.google.com; envelope-from=krellan@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=qjmF0aMc; dkim-atps=neutral
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgNmf42BhzDqJS
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 07:35:55 +1000 (AEST)
Received: by mail-ej1-x62b.google.com with SMTP id a26so10511646ejc.2
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 14:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g0Ul2LeRiUVT9m+685L1ARoQfHnfv83J+D8uw6/+u0I=;
 b=qjmF0aMcOpYz0+aTRrix/MRoMkh57xT0t/dIdlXLJ9I/s06YmvCnXVlPouNr3Wlluy
 8+v6bmM5fd0v/BNn5c8K3bYKLk31FByMrcq8bMU7HpZSKMh4vlejq2oe+jcBGUsNX0Iz
 d/6/CVHj80LjfEnNfM02/3bniSlIZ2wrxuD9uIM3+V5TNa7p3JOWkjYmhia9FECaOxj0
 +KvmtHCPkUt9UyjYo4nygaCXvIkYVvxbv+RLmr5IuaUqgxhhLP9QNo6tJd2YopVOHbwI
 U8nMc/9E5Uy/qnYuIraF+yxASQigTvCd7W6X2qhXfoPiSdPnKbrzp3/3t3ufQZCFCdbv
 l7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g0Ul2LeRiUVT9m+685L1ARoQfHnfv83J+D8uw6/+u0I=;
 b=HagDbIpQlOF/GqFU63CEzvLstSKYmTNKrRUaN9aPBWahVb7bO1bVBjvv27ji35bBeQ
 iOa9KSfQ8Sq5sEz8AWhQF9VP5BDL9sqmHfJo68omv29WnoBC7nN5v0Tzn+ruLw2pOw4A
 boffz1Et9CC84n1/Ksc6Z8MnFSn42pEXd7yGQiForDaclbvpa8mYL7aeh+vSePpr/E1l
 Jqu1vE+F8VdFeMPDugbWcDu9X4FhPXsQSOLg9TgCpGTiZ+0nQ7YsbWwXBi7/RnR73D4P
 YBI3KFFOVZpM7rTLMUtYKIt2FRC/jdUlQYeuqjaC7s4es5XtleD4rTyv1Sc6N0fmWERd
 LxeQ==
X-Gm-Message-State: AOAM530+Ez/z9tmnVpdGYTkXvvp6hfDOkyKEM2PUaSXqD6p8W3y9DzYR
 wq59PdgEI/BiKTwvha7/AFmctue5l2AV7kyLazELiA==
X-Google-Smtp-Source: ABdhPJwWSCUg4+9kFD+Nm8tn/Otg/y7IjxbDtWOGsTLrn0RHlUMplM2SIdXuB4IqsFNLIY2QojH3+kWzYjq+aupR2OU=
X-Received: by 2002:a17:906:77d1:: with SMTP id
 m17mr2831438ejn.96.1598909748923; 
 Mon, 31 Aug 2020 14:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_a9xKze8pBf1zH0icAhQX55ESbtnqQMaTe-aTxnxBx5tfcCA@mail.gmail.com>
 <CACWQX82Or8bnTA8WDqrogpp16vEff7PoEB4ZK4b3tFwYKWSQZQ@mail.gmail.com>
 <CAJOps0swEoyi3kmbGWQ_xMVEUt+ZL+SGrYm2Fq4SCGd8wZtDFw@mail.gmail.com>
 <CACWQX80XASFj_5LBOeH6iQ84PO14suc34jZip9B7g-y4YYo_cQ@mail.gmail.com>
 <CAJOps0t=HyM7sLgj9aamBBQD2hReMcZYP1icJjLc8Sr-8bx7zA@mail.gmail.com>
 <CACWQX83vxiO9QrqbyxEpUPgZ_bmiZNnhgYhMC4WH4wUUR8c1mA@mail.gmail.com>
In-Reply-To: <CACWQX83vxiO9QrqbyxEpUPgZ_bmiZNnhgYhMC4WH4wUUR8c1mA@mail.gmail.com>
From: Josh Lehan <krellan@google.com>
Date: Mon, 31 Aug 2020 14:35:22 -0700
Message-ID: <CANPkJS_f1zkP1YK43UDt7eYM2WjG3AKB4US206ndnudZPh-i0Q@mail.gmail.com>
Subject: Re: Inconsistent performance of dbus call GetManagedObjects to
 PSUSensor in dbus-sensors
To: Ed Tanous <ed@tanous.net>
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

On Sat, Aug 15, 2020 at 7:05 AM Ed Tanous <ed@tanous.net> wrote:
> On Thu, Aug 13, 2020 at 4:33 PM Sui Chen <suichen@google.com> wrote:
> > > What patches did you apply?
> > This one: https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/30348
>
> Looking at this patch, I get the feeling this is specifically the
> cause of your problems.  Have you tried your things on master yet,
> without that patch, to see if it exhibits the same behavior?  There's
> a good reason each sensor has an independent timer instance;  The
> intent is that when the sensor system gets overloaded, the readings
> get delayed, and each individual timer introduces its own
> load-specific delays as it's started after the read completes.  Said
> another way, technically, a sensor scan rate isn't exactly 1 second,
> it's 1 second + queuing time + the time it takes to read the sensor,
> so if the sensor takes a long time to read (because the system is
> overloaded) the sensor scans don't collapse into one another and cause
> problems like you're seeing, and you still (hopefully) have
> significant idle time in the io_context to handle other things, like
> managing dbus connections.  (as a side note, for i2c based sensors,
> this keeps the latency of other operations on the bus down as well.

That's a good point.

With each sensor having its own free-running timer, which auto-extends
time if the system is delayed as you mentioned, that does provide a
way for the timers to automatically slow down when the system is under
heavy load and can't respond as quickly.

I wonder if it would be worth adding some timing to detect this, and
perhaps try to back off the timer duration somewhat? For example, if
1-second timers are bogging down too much, back the timer off to
2-second timers, and so on, until they have been slowed down enough to
give the system enough time to avoid falling behind.

> Unfortunately, that patch kinda puts all that design on its head.
> "Avoid timer skew" is in the commit message.  That skew is there on
> purpose, to prevent the problem you're seeing.  With that said, I'm
> sure Josh was trying to fix something there, but in the commit message
> he doesn't actually outline what the problem is.  Do you know?  My
> best guess is maybe he was trying to get more accurate scan rates?  We
> could think up designs that have some logic that, in the base case
> handles the loop more accurately but spreading out the sensor scans is
> a good thing in general and reduces the peak work queue size (as
> you've already found out).
> Maybe there were some different performance issues that putting all
> the sensor scans together solved?

The sensor reading was causing the rest of the system to become
unusably slow, even before making any changes. I had 3 goals in mind:

1) The pmbus driver seems to ask the hardware for new data if it has
been long enough (HZ, roughly one second) since the last read, by
comparing the system jiffies clock. As all sensors would have their
own free-running timers, the driver readings would be smeared
throughout time, causing this interval to be quickly and repeatedly
reached. We suspected a driver was being slow, perhaps because of I2C,
so we were seeing a system slowdown every second. By reading more
sensors simultaneously, and then pausing for a while, I was hoping to
avoid triggering this interval as often, thus taking advantage of some
caching. The pmbus driver does a complete read of the chip every time
this interval is triggered, thus if I can satisfy more sensors at a
single interval, I don't need to do as many complete readings.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/hwmon/pmbus/pmbus_core.c#n584

2) In general, it's good practice to read sensors at fixed intervals,
to avoid skew between sensor readings. An example is voltage and
amperage. Ideally, you would sample them simultaneously, so that
computations such as obtaining wattage (volts * amps) would be
correct. If the sensor readings were staggered, and you were reading
something that was changing, your calculated wattage would be
incorrect. Many embedded sensor networks have a command that
broadcasts out to the worker nodes, to "lock" a sensor reading into
local sensor memory, then, as time permits, the leader node can issue
commands individually to collect data from each worker, knowing that
the data was earlier all captured simultaneously. This technique
improves the quality of collected data, and is often used in industry.
I was hoping to bring PSUSensor a little closer to this ideal.

3) By synchronizing to one master timer, it becomes possible to slow
down the sensor collection interval, and introduce some resting time
between sensor data collection. The system became almost unusably slow
during sensor data collection. By introducing a rest time between the
readings, I was able to "PWM" the system load, and thus dial it down
to make the system usable again, by changing the duty cycle to
something like 70% instead of 100%.

I wonder if it would be worth it, instead of having each sensor have
its own free-running timer, to still have a single master time for all
sensor collection, but stagger it? For example, let's say you need to
read 200 sensors, and you need to do a complete reading once every 5
seconds. Have the timer fire at intervals of 15 milliseconds. Collect
one sensor reading each tick. This completes 200 sensors in 3000
milliseconds. The system can then be quiet for the remaining 2000
milliseconds of the interval, giving it a chance to catch up and
remain responsive.

Josh
