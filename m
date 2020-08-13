Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7F0243BF6
	for <lists+openbmc@lfdr.de>; Thu, 13 Aug 2020 16:55:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BS8kT2ygvzDqXC
	for <lists+openbmc@lfdr.de>; Fri, 14 Aug 2020 00:55:13 +1000 (AEST)
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
 header.s=20150623 header.b=yFOphPC4; dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BS8jC6Wt7zDqWJ
 for <openbmc@lists.ozlabs.org>; Fri, 14 Aug 2020 00:54:05 +1000 (AEST)
Received: by mail-yb1-xb33.google.com with SMTP id c9so3469693ybq.1
 for <openbmc@lists.ozlabs.org>; Thu, 13 Aug 2020 07:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7RrhOprosdecmVRrXbLF2DRpB+GhScAxGwa3rcu5V94=;
 b=yFOphPC4tM30Cd2a74iqkL+wCjSnreUHCnNCP5WOy+1y5hBGRINM7zMdxCjg5knWSI
 o61TQmFSO7AU8u/l5goiklfzq2QTD8NS1vnw0AyJv7ZMdU9GBZJlkjzvo1RhswiG9sft
 t4T1PG8dg/joyYAv3lyIuXXn9uj8DTgWOGdQBjvgLB4Q9pd8RkvaIPER2c37XWoFYhPs
 naCj6JuaCVorMsRZxCwBOFdAa5gH4hm6R/sV9orJjN0o92bO9YyQSnCgXJzeKjMKmecS
 PTvr/bOkweZ+iEvwN0z0Oir9yopqqsHWc1jb+9pC3wnSV6BUjSHpF/FfvLOqDkA6KIqQ
 Y4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7RrhOprosdecmVRrXbLF2DRpB+GhScAxGwa3rcu5V94=;
 b=lWvRXGQkqdOaEdlYWk0TGJfAEjFmIDg8AfquOAv4njLr/aQBwg7VZobZNJp4iqIFc7
 2Y4R0H5M6jfoz3kjhRRGaGL2Ujp/GG9Dep9mUu78NIEKVMy2DA9ZfJyCRSqMyz07sJKA
 lE64Hg9vm8DwqiCl2vS6CvbTvyGFrVHGGTcuU8Go/0uDdLUf/C3PUd8W8N0IcFLi6lhJ
 4lRHUs34kX/XD/OhhvxLCsOORglFZ3VntpSIRvrHLDpDav44vC36hbH6Xk9ztIqRfCqV
 AAqFoeNy4KF1pVzRYJjHhCOPvwuJ/sJf3UfiDDJIxAGlzVyyztJOH3jKxIkJZT5nuP+5
 Wkgw==
X-Gm-Message-State: AOAM5309kb9hbWNG2ejqagff3zoW192viweVMhwuIAPXnmMjj41LHKgV
 nHHnUMEwMURIMo4iPXNkM2/DmYZr8/jOJpQWFcCDaQ==
X-Google-Smtp-Source: ABdhPJwMp2dff0x/lXxrnFXyMlzRnRtr9aVUtOthYhi+a0xUeBfHT63+V3C2em78jIxAfHGbZDcVuE70NjJK9GP6sIk=
X-Received: by 2002:a25:d98f:: with SMTP id q137mr6535758ybg.480.1597330441451; 
 Thu, 13 Aug 2020 07:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_a9xKze8pBf1zH0icAhQX55ESbtnqQMaTe-aTxnxBx5tfcCA@mail.gmail.com>
 <CACWQX82Or8bnTA8WDqrogpp16vEff7PoEB4ZK4b3tFwYKWSQZQ@mail.gmail.com>
 <CAJOps0swEoyi3kmbGWQ_xMVEUt+ZL+SGrYm2Fq4SCGd8wZtDFw@mail.gmail.com>
In-Reply-To: <CAJOps0swEoyi3kmbGWQ_xMVEUt+ZL+SGrYm2Fq4SCGd8wZtDFw@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 13 Aug 2020 07:53:50 -0700
Message-ID: <CACWQX80XASFj_5LBOeH6iQ84PO14suc34jZip9B7g-y4YYo_cQ@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Aug 12, 2020 at 6:38 PM Sui Chen <suichen@google.com> wrote:
>
> Hello,
>
> Because machine configurations may change during development, we used a m=
icrobenchmark to try to isolate the cause and reproduce the long DBus laten=
cies reliably, and another microbenchmark to demonstrate the idea we had tr=
ied that appeared to alleviate but not completely eliminate this DBus laten=
cy problem.


This works great, so long as you constrain things to the way they look
on the bmc, and don't look at things too closely.  One thread, pinned
to a single core tends to work best for reproducing this kind of
stuff.  If you can also pin something else to that same core that's
doing some work, it tends to be closer to a real bmc.  Also remember,
context switches are much cheaper on x86 multicore than they are on
other, less capable single core processors.  You need to keep that in
mind when running your microbenchmarks on a different platform, as the
profiles can vary significantly, especially in the worst case.

>
>
> The first microbenchmark, dbus-asio-bmk (https://gerrit.openbmc-project.x=
yz/c/openbmc/openbmc-tools/+/35576) mimics our patched psusensor: an ASIO w=
orker that reads sensors at some fixed timer interval; the ASIO worker is a=
lso used by sdbusplus for handling DBus work. We continuously run "busctl t=
ree" against the DBus interface created by the microbenchmark binary.

What patches did you apply?

>
>
> By importing the resultant DBus traffic dump and ASIO handler activity lo=
g onto the timeline view form dbus-vis, we can clearly see the the "sensor =
reading" ASIO work items block the DBus work items, which in turn causes ve=
ry long DBus latencies to show up:


All I see is that there's a long lag between a single read of a busctl
tree call. I don't see any indication that it's because of sensor
reading specifically, at least from below.  Dumping the state of the
work queue would explain a lot about what's going on during these
periods.  I wonder if this is as easy as smearing the initial start
time of each sensor when the application starts to make sure the
timers don't synchronize like this.

>
> Although this benchmark is run on an x86 workstation instead of the BMC d=
ue to a run-time error in its dependencies, according to the results above,=
 we see this "thundering herd" problem appear to occur on a desktop platfor=
m as well.


One odd thing I notice in that graph: we're using null_buffers?  I
thought we were using a direct async read call.

The other thing to realize is busctl tree is very inefficient.  It
executes a full introspection of all levels, then executes
GetProperties for each property.  You really need to move your
microbenchmark to GetManagedObjects (which I see you recognize below)
as that's more indicative of what a real caller would do.  I don't
think your profiles are worth looking at until you do this.

>
>
> As we modify various experimental parameters, it turns out that the more =
time is occupied by non-DBus ASIO work the more likely long DBus latencies =
are to happen, since there is a higher chance the DBus calls clash with the=
 "fake sensor reading". Thus, we come up with an assumption that if we redu=
ce the time spent (by the only ASIO worker) in non-DBus ASIO work, DBus lat=
encies will be reduced.


Another option is to make it 2 threaded.  Have one thread (and
io_context) set up for handling dbus traffic, and one thread set up
for async reading of IO, with an atomic data structure in between for
passing values.

Another (probably preferred in this case) architecture would be to
implement an ASIO priority queue, and prioritize the dbus traffic
higher than the IO reading traffic.  There are examples of this in
asio, and I assumed the day where we needed this would've come a lot
sooner (we got away with a dumb fifo io queue for a long time), but
here we are.

>
>
> Based on this assumption, we attempted a few methods to reduce the time i=
t takes psusensor to read the sensors. The second benchmark (https://gerrit=
.openbmc-project.xyz/c/openbmc/openbmc-tools/+/35387) explains the methods =
we had experimented with. It turns out we were able to reduce sensor readin=
g time as well as the chance of long DBus method calls happening, but the i=
nconsistent DBus call times do not completely go away. This is probably due=
 to psusensors being much more complex than the two benchmarks with much ot=
her work contending for the ASIO worker's time.

Can you detail what methods?  It might help someone else pinpoint
another good option.

>
>
> So to summarize the point of this reply is to say:
> 1) We had attempted the ASIO handler dump as suggested and a method for a=
nalyzing DBus+ASIO performance has been embodied in dbus-vis.

Can you post the dump somewhere that others can help analyse?

>
> 2) We are interested to know if someone else is looking at similar proble=
ms.


Ps, I'd be remiss if I didn't point out that your last email was sent
as HTML.  This list prefers plaintext.

>
> 3) We will examine GetManagedObjects again when we get a chance.
