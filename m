Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7E623F302
	for <lists+openbmc@lfdr.de>; Fri,  7 Aug 2020 21:18:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNZsW5mWQzDqn1
	for <lists+openbmc@lfdr.de>; Sat,  8 Aug 2020 05:18:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=iR7v95ve; dkim-atps=neutral
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNZrk4684zDqSY
 for <openbmc@lists.ozlabs.org>; Sat,  8 Aug 2020 05:18:12 +1000 (AEST)
Received: by mail-yb1-xb2e.google.com with SMTP id x2so1534142ybf.12
 for <openbmc@lists.ozlabs.org>; Fri, 07 Aug 2020 12:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F22g/OE4Y3G9K28Dw5OiQXoyCQb6wR5C6f6rJPPFBfQ=;
 b=iR7v95veaH8aDs0X+OJiLi2b3YJ2kC0gDTvqUNzkSITyeNooaBJ60TYOJhdT+htXz8
 GWLHDaE84BeMqaWDHUk7PBkPFbZLKUNWBYtwrG1orUNS9aZFj2fwJt57cRC++auzd1n6
 8gUsSsLMPGEbXH/iXghx+If5btx7r8Kd1wiMdkzPHg9BI8iWp3JPoJuF/UtWL1psZUJX
 7wshLgEXsAHP1gT1k9GHtnOfrx3QwMs6xYssWon4C1puSts5yBFLJOydEagAVAY6g+as
 RzJBiJ3O9myzNjiFYUC8cjwLqGaFh1gDcD5mPJOnjFPQTKIUkf+R8hyQKuFu3ixNn1gR
 gUFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F22g/OE4Y3G9K28Dw5OiQXoyCQb6wR5C6f6rJPPFBfQ=;
 b=lsHjSvLLufxeVNxO+/r3MTcowPQ6MrqjIlaKgXcf8Uh5hJb4sJa/3kVmAGGHahGaJU
 JMZfqGzh7Uns/SnAHRmT9QRMEe+yj0HB469BuAzIHYhQHobYHtLfoa+BRfajp5e6B3wY
 ZhAqXELgIQivUEy6/QkD8REKoBMWOxvyeXk4RplTi9qU+KFv5yJ8UpBwyvzc1BEUlC3e
 DA4szCjjeUMrmjpEYXQp2Gw7u6feX2gYGoZ+vZ9RXsXKWRvJe9hWF7OrECCA2OpyuNw4
 SSBOs9zFqiolHp0z/xkYfbSBksJ+CSKztMN7GcDI96U7QUhRINkYiANF3M3VbRxaoHPh
 5WyA==
X-Gm-Message-State: AOAM532BrUQU3B3n/7RX2hJ5P1yRD8IkmP/srt/Ymwym8QNTyXiZqX0M
 SVgpwH5yiDUttPhyyv6S8VjdjEaCKidwFiwlzDcThQ==
X-Google-Smtp-Source: ABdhPJxhKFIbBD8QOa6ItMD/GN6jzbHlz50VzPlIUA1kVUhfxFZuiynTId8r8UQRQwUDbVYs45w2vm9AFP0bMZjcA4k=
X-Received: by 2002:a25:640e:: with SMTP id y14mr21022617ybb.340.1596827888464; 
 Fri, 07 Aug 2020 12:18:08 -0700 (PDT)
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
In-Reply-To: <CAHBbfcX7TahfKcVcUqWKQGTK5s9Rzw3mT4_3v4tWtkAgHBgX6g@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Fri, 7 Aug 2020 12:17:57 -0700
Message-ID: <CACWQX83AdMHFk5NUJmpoesghK_2YZ9MMo6h-KoWzDtZ-jrTYRw@mail.gmail.com>
Subject: Re: dbus-sensors:hwmontemp: additional attribute proposal
To: Jason Ling <jasonling@google.com>
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
Cc: Alex Qiu <xqiu@google.com>, James Feist <james.feist@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Aug 7, 2020 at 11:05 AM Jason Ling <jasonling@google.com> wrote:
>
>
>> Yeah that's what I meant, a generic PSUSensor Type with a field called
>> 'Export' or something that EM can use to get the Export type.
>
> Sure, I think that handles the EM side of things.
>
>> I'm conflicted on that.  Part of the reason that list is there, and
>> not in the config files directly, is to convey that those are the
>> types that have been tested to work correctly, and the types that the
>> config files "promise" to work sanely.  The other thing is, if you've
>> done the testing, adding to that list is (should be) relatively
>> trivial and straightforward.  Opening up that list to runtime parsing
>> opens a lot of security questions I'm not prepared to answer.
>
> Sure, let's scrap runtime parsing and go for something far simpler.

Unless you have a way to handle the cases where things need to be
configurable at runtime (like adding a new entity config or fan
control control without a recompile) I don't think we can "scrap"
runtime parsing entirely, but if you have a plan for dealing with the
aforementioned, I'd love to hear ideas!

> (1) have a base type, devices list that represents the approved device list.
> (2) have an empty extended type, device list that represents user specified extensions.
> (3) factor these out into separate files and provide a method that returns the union of the base and extended types/devices.
>
> now we have a base type/device list that contains supported guaranteed devices and another extended type/device list that is easier to maintain patches for.
> I think that's a rather small change and accomplishes what I'd like while preserving the intent of keeping a list of supported types/devices.
> What do you think?


I don't like the merging of base lists with extended lists, as it adds
a dependency between how we represent that, and implies that we have a
published plugin interface, which we definitely don't, nor do we want
to maintain it at the entity manager level.  It also means that
upstream never tests the "extended" list, which means it's a lot more
likely to break.

I originally wrote a big long idea about how to make the above work,
but got to the end, and realized that I'm still trying to understand
what we're trying to avoid here with the downstream/upstream lists
thing.  It's easy enough to patch the existing list to add your new
custom types, then when it comes time to merge because the
project/component is public, the patch is ready and good to upstream.
What are we buying by moving that info to a non-patch format?  I think
moving it to a file means it's a lot less likely to be upstreamed, as
it requires the next person to understand it to use it, and modify the
patch rather than simply cleaning up the commit message, testing it,
and firing it at gerrit.  Having done this pattern many times
(including with that list specifically) I think the only thing we
could improve would be to move that list to its own file (but still
C++ code), so it gets fewer merge conflicts, and you can completely
replace it if you like, but even that doesn't solve the problem if
code is never upstreamed.  If you want to code that up, I'd support it
(and I'd guess James would too).  Keep in mind, all your downstream
patches against that list will break when you do that, causing the
world irony meter to spike :)   With that said, i still think it's
worth it.

Disclaimer time: The way the project recommends to avoid this problem
is to upstream your code.  Anything else is a half measure, and we can
make no guarantees about your downstream fork.
