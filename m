Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD8F23F4A1
	for <lists+openbmc@lfdr.de>; Fri,  7 Aug 2020 23:54:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNfKJ4c6zzDqlh
	for <lists+openbmc@lfdr.de>; Sat,  8 Aug 2020 07:54:44 +1000 (AEST)
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
 header.s=20150623 header.b=l9SrwWZ+; dkim-atps=neutral
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNfJQ4ld6zDqkP
 for <openbmc@lists.ozlabs.org>; Sat,  8 Aug 2020 07:53:58 +1000 (AEST)
Received: by mail-yb1-xb44.google.com with SMTP id x2so1731218ybf.12
 for <openbmc@lists.ozlabs.org>; Fri, 07 Aug 2020 14:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nOLWoo0hGKowz9NFNX2NALqhZFpgls1WWDWbApA6RDM=;
 b=l9SrwWZ+h/xJIkIFYnwEhkOxMlc76cYlSk7f2pWzgCZxPndrlulNOfQMwQ8XSw0zor
 9LjT560K4YeRZ8CuK38ACJm/1DKOz//lngs4j11hulHtd/bUkOGMRLnSX2oYm0kNbrW8
 /jzv6zG5PGBxgM6vnRXlsqzMZLR0P8cNPkgl/r4WzUkturFpGkRaNgKYbwMSoTjG9thZ
 2tgvdeNGOGAh0s+/beGrFtkgIunzKwUj+pRxraa7Fkkfpf0y1oa/A3mFn2ia03wLB+Rm
 3uMXaCkaGYi8hFnEcBPBd7UzZU/yFA6OGpcCCiAAhM2qNpvQttBx/94949HEkE15mY+B
 3RWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nOLWoo0hGKowz9NFNX2NALqhZFpgls1WWDWbApA6RDM=;
 b=G1+RTJMeAw1LV0yREQT6DzAl9/37ohvIKnsId7kv4RRHHo3FOu2h9tnF2j9cvDK9Te
 BCEDJt4YQvbFyk2VkweWnGjRbcrGKs0a+ii4GVo6jaGKRH3LT79b5kKypEu86vOaIdH0
 mgIBHzrviaEkhVUAKkwN1C19PaqbstrIqA1C700/Tv1NCKCBz/7wXN3nOEx8oTiAxjs2
 MaX6l66mHufgDupqMV4GFbZc449V6/1NvgcB6sKYfdbMPqT21TA9avq0BAzfGBjEiGwg
 Ee8zGG1pko5lImdUrcufx9hDaIWrs0j0QElRw+rBS+lvHQNsxjSr4e4v8srM7/MIMrs9
 74sQ==
X-Gm-Message-State: AOAM531sBm6r4gCfoTZ+bgQcp7ca6IIykmRbIQgM5KCMuvf4NexSsPWh
 C3y7G/Mch1cWvVNGx3zra4AYmTb/x2RA5DaxzdDLMQ==
X-Google-Smtp-Source: ABdhPJx1luWHqZIba8Iz3A7wAWJc08jt5QyqrYIEOkvsCaWRMiW3LDOdjZrh23oQ0gjcaKKWRMZSBScFt7XZZC3jR78=
X-Received: by 2002:a25:7344:: with SMTP id o65mr23443151ybc.417.1596837234282; 
 Fri, 07 Aug 2020 14:53:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAHBbfcUoAB_nmsaCh2-vAEAjE7Fuu3MNydHLUwBS7zkt7pcPkw@mail.gmail.com>
 <f1b0300f-06ac-c350-8fcc-24eae806cdb2@linux.intel.com>
 <CAHBbfcUXLueZ3MZAP9b38B-fXyrNCMAeZcC7uk8uPrR5gw=3xQ@mail.gmail.com>
 <2bb88ede-4d35-8b9c-936f-be8dc9a453e5@linux.intel.com>
 <CAHBbfcUDMOZjxSvy8wVW_F9f3+NaX-WU3G5PF1oUoRx5VP7ZoQ@mail.gmail.com>
 <CACWQX82KAhmRbg-CYa8+Yjd8mE7qCM_vG_Q1_hYZVR77c3gdtw@mail.gmail.com>
 <CAHBbfcUJGnsW_dxONwjsT=w3ZM453-o0Ubc7DE7oOJQ8u28=ww@mail.gmail.com>
 <5a59238b-7653-b11f-701b-039d57dd5b98@linux.intel.com>
 <CAHBbfcXRO5ZB3S0T6SyRkWkLLAruKPdS8UhUkyG3qssU5YkHNw@mail.gmail.com>
 <9deda21d-aa01-d15e-464e-7ab0fb2f751c@linux.intel.com>
 <CAHBbfcX7TahfKcVcUqWKQGTK5s9Rzw3mT4_3v4tWtkAgHBgX6g@mail.gmail.com>
 <CACWQX83AdMHFk5NUJmpoesghK_2YZ9MMo6h-KoWzDtZ-jrTYRw@mail.gmail.com>
 <CAHBbfcUBBUpO9o2pNSbr0YKXNRHPju4gNNHxxNxuda9k5D0BYQ@mail.gmail.com>
In-Reply-To: <CAHBbfcUBBUpO9o2pNSbr0YKXNRHPju4gNNHxxNxuda9k5D0BYQ@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Fri, 7 Aug 2020 14:53:42 -0700
Message-ID: <CACWQX809R7wx+qNt5PhZW-Snv0jdPnUVGSt+A_jobrTcYC8B2Q@mail.gmail.com>
Subject: Re: dbus-sensors:hwmontemp: additional attribute proposal
To: Jason Ling <jasonling@google.com>
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
Cc: Alex Qiu <xqiu@google.com>, James Feist <james.feist@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Aug 7, 2020 at 2:05 PM Jason Ling <jasonling@google.com> wrote:
>>
>>  don't like the merging of base lists with extended lists, as it adds
>> a dependency between how we represent that, and implies that we have a
>> published plugin interface, which we definitely don't, nor do we want
>> to maintain it at the entity manager level.  It also means that
>> upstream never tests the "extended" list, which means it's a lot more
>> likely to break.
>
> My stance on devices added to the extended list is the same as devices ad=
ded by downstream patches. Upstream maintainers aren't responsible for test=
ing those, if you're patching in devices then you take the responsibility o=
f testing those.

Sure, but upstream does bear the responsibility for testing that this
"extended types" system works?

> My objective is to make it so devices that we don't want to upstream yet =
can be maintained more easily.

Ever?  To be frank for a moment, you're going to have a hard time
pushing that one forward in an open source project.  If there are a
lot of users that are planning on maintaining private forks forever,
maybe there's a case for this, but I think most uses of private forks
tends to be temporary, even if it's longer term, and the long term
intention is to upstream.

> First idea was a json file that extends types/lists but there are concern=
s with runtime parsing for devices for the purposes of exposing telemetry (=
I'd think runtime parsing of things like PID configurations would be more w=
orrisome).
> So second idea was just to move data structures around in dbus-sensors/PS=
USensor to make upstream changes less likely to result in merge conflicts f=
or those who are maintaining downstream patches. Furthermore just split the=
 data structure up into a portion that is upstream and downstream.
> Yes, it's definitely making it friendlier for those who want to maintain =
downstream patches to extend devices. I don't see how this increases mainte=
nance or testing burden for the maintainers though.

It increases burden because any time the maintainer wants to change
the name of that file, change the name of the structure in that file,
add a field, rename fields, or change compiler flags, that file will
break in your downstream, and the maintainers will have no idea.  It
definitely increases the maintenance burden, and all of the things
I've mentioned and more have happened over the short life of entity
manager.  I'm sure they will continue to happen as they evolve (or
until EM is replaced by something better).

> If however , the intent is to explicitly send the message
> "You shouldn't try to use this service for any devices that do not have e=
xplicit upstream support. Any patches that make it easier to do so will be =
rejected."
> then I agree with your earlier suggestion that maybe the best approach is=
 to create another service for those devices.

I'm not the maintainer of this project anymore, so my opinion is just
that, and I have no ability to reject patches :)  I would rephrase my
position as: Modifying the source code directly is not an adequate
long term API for making permanent, never to be upstreamed changes.
The closest guarantee to that kind of API that is dbus, the second
closest is an Entity manager config, each of which have their own pros
and cons.  If we as a project can do anything to make the transition
between downstream code to upstream code easier, like trying to make
merge conflicts less likely on commonly modified files, without the
expense of maintainability or complexity, I'm absolutely for it, but
creating explicit data structures and hard guarantees about downstream
code on a binary boundary needs a much larger discussion, and speaks
to some of the project's main principles about the "Open" part of
OpenBMC.

>
>> I originally wrote a big long idea about how to make the above work,
>> but got to the end, and realized that I'm still trying to understand
>> what we're trying to avoid here with the downstream/upstream lists
>> thing.  It's easy enough to patch the existing list to add your new
>> custom types, then when it comes time to merge because the
>> project/component is public, the patch is ready and good to upstream.
>> What are we buying by moving that info to a non-patch format?
>
> You get the benefit of separating devices into two classes..
> (1) types that are upstream , have been tested by someone else and they a=
re ready to go without additional work.
> (2) types that are not upstream, because the devices are not public yet o=
r may never be public and need to be kept downstream for a long period of t=
ime (or forever).

Don't you already have that distinction today?  Devices that are in
your downstream patch fall into category 2, devices that are on
openbmc master fall into category 1.  Maybe I'm missing something?

>>
>> I think
>> moving it to a file means it's a lot less likely to be upstreamed, as
>> it requires the next person to understand it to use it, and modify the
>> patch rather than simply cleaning up the commit message, testing it,
>> and firing it at gerrit.
>
> Yes, the file would be for those things that are never meant to be upstre=
amed or won't be upstreamed for a long while.

See above.

>>
>> Having done this pattern many times
>> (including with that list specifically) I think the only thing we
>> could improve would be to move that list to its own file (but still
>> C++ code), so it gets fewer merge conflicts, and you can completely
>> replace it if you like, but even that doesn't solve the problem if
>> code is never upstreamed.
>
> Yup, the problem here are the following
> "I have patches I keep downstream and they keep getting broken whenever t=
he types/device list gets updated. I wish these data structures were in a f=
ile that doesn't get patched often"

Moving that structure to its own file sounds totally reasonable,
although (if I were the maintainer) it would have no guarantees
granted.  Said file may change name, structure, naming, or compiler
magic that will cause downstream to break.  Funnily enough, in the act
of implementing that, you will ironically break a lot of peoples
downstreams, and I'm personally ok with that.  You (and your team)
needs to be ok when people break your downstream for similar reasons.

On a personal note, if you haven't already, I highly recommend
spending some learning time on getting a good setup and mental model
for merging conflicting patches.  As a useful skill, it comes up
ridiculously often in software, especially if you're a maintainer.  If
you have the ability to resolve conflicts quickly and correctly it
puts you at a significant time advantage to your peers that don't.

> and
> "I have patches to add devices to the type/list data structure and I can'=
t upstream them for a long time (or ever). I don't want to waste time const=
antly fixing my broken patches everytime someone adds a new public supporte=
d type."
> Both approaches (parsing json and extending the list runtime and separati=
ng the data structs into a separate file + returning the union of base + ex=
tended) accomplish the same thing. One requires a recipe to copy a ExtendPS=
USensorConfig.json in a recipe somewhere to usr/share/PSUSensors (or someth=
ing) and the other is just a patch that gets applied. Talking it through, I=
 now realize that the slight code refactoring approach is a lot less work a=
nd a lot more simple..and something that I'd actually have time to contribu=
te.

EXCELLENT!  Add me to the patch, and I'd be happy to review it for you
(With that said, James is pretty fast and sometimes beats me to the
punch).

>
>
>> Have you filed a bug, or asked on the mailing list before now?  This
>> is the kind of feedback the authors of that sensor need (Ideally
>> before you move over to another subsystem like hwmontemp).
>
> I never really considered hwmontemp a different sub-system since they liv=
e in the same repo and seemed to be more specific towards monitoring temper=
ature telemetry.

Ignore the above comment about subsystem.  I thought you were talking
about phosphor-hwmon.  My bad.

> As far as bugs go, I CC'ed Alex Qiu who has more experience with the perf=
ormance of PSUSensors. I haven't personally ran into this problem; just kno=
w about it from talk amongst the larger team.

Excellent.  Looking forward to details.

>>
>> If I
>> didn't see your message/bug and you did post it, I apologize, I'm not
>> trying to call you out.
>> If you have specifics, like the value of N, and the details around
>> what chips you're interacting with and whatever debugging you've done,
>> it would be helpful to put that in a bug for triage.
>
> Alex, maybe you can add some color here?
>>
>> Keep in mind, PSUSensor by default has a 1 second scan rate.
>> https://github.com/openbmc/dbus-sensors/blob/41061e2c3198c0f597d4f6bb702=
b690a273ab45d/include/PSUSensor.hpp#L38
>> If it's not obeying that, clearly there's a bug to fix somewhere.
>> On some platforms, I have seen very high rate polling of power values
>> on the PSU I2c bus by other devices, and that tends to hold up
>> transactions for other components.  If that bus is misbehaving or
>> overloaded on your platform, it might have triggered a weird condition
>> within the PSU sensor (like the scans taking longer than the scan
>> rate).
>> If you have any more details here, it's quite possible someone will
>> have an idea where to look, or know exactly where the problem is.
>
>
