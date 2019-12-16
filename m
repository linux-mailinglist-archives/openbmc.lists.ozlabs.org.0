Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3233120132
	for <lists+openbmc@lfdr.de>; Mon, 16 Dec 2019 10:31:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47bwxt10s5zDqV1
	for <lists+openbmc@lfdr.de>; Mon, 16 Dec 2019 20:31:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::135;
 helo=mail-il1-x135.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="N3Whjveh"; 
 dkim-atps=neutral
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47bwx12HhTzDqKH
 for <openbmc@lists.ozlabs.org>; Mon, 16 Dec 2019 20:30:26 +1100 (AEDT)
Received: by mail-il1-x135.google.com with SMTP id f10so4888461ils.8
 for <openbmc@lists.ozlabs.org>; Mon, 16 Dec 2019 01:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=UM0F6EN2xOObjsPjZAW5Y1xN/AbsQyR47UuGPADKqf4=;
 b=N3Whjveh5QQdRULLkRnuQRpqmQmRUeZu/NQW1eA4fQLkyDS6l4rb9rq79z5j2xR57i
 d4oSt2YryUWsh+2MQnydNlwfIH+Z7EkPjB6YnCvs1KbU3EK7ZypLLR86P2khOxQn158Y
 F/oDrWV5z5cslUmxEoyuvETEiXFcqWoVKtaJumZDPpx4NWHYrqjSs3mG6bd0YeF88GTr
 ntnG2sUidLWAXdsu91l1nSF4VROu95KwcBThPPxuQqxBOWzZiO/7zk+JYtaJivU4nj4R
 /l9eauxAj1o97S/RkJtcQI3cdrmKqONZLhGpujp56Qbm3rB4av2mLIfC58QvZ9uSzlOr
 iW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=UM0F6EN2xOObjsPjZAW5Y1xN/AbsQyR47UuGPADKqf4=;
 b=qdQdXWK9XqDDlW2IrsUQRytP/AiHfUQfzLyNgR3XLn3wOy2qTfLDKChBWiHnsNSzRn
 /+zI9AwHmr6hUP6UoI+TiyEyykbylHn6WgYf7FatuWBjosG1uDVV4Pkfq9qc83h0W79m
 Nt8WxEvZKUvwbF5uBe5FqUzUsSsRrx5SFmrKod48V1p6XX5Cg3QMWxLJOGZDFibiFzIL
 Bb5RYNUBNhh377vVk28lF2kwKJad0ROGp0xfMjv8HpK/68C7uaw8iWZN2hauy1GO0hBC
 ogd+Nl0wdvhekAlIxXZxyrkF+RCxvfSngp56P54vhX9eBAx1vy1+va3RphQMS3HLP3ek
 mSJg==
X-Gm-Message-State: APjAAAUNixQn+Wy6M2bP7TsRERFikPaxKvlwOAeuekcgnQKevYq8KKUL
 QnYAwNMuB5HAwD5oPC6nYQoXpJe5fadQvxpM8lvbhNLhoU8GEA==
X-Google-Smtp-Source: APXvYqwYvRxGeEyVUnMGokOvd58n/bF75llYzLtqjG7pY9c0tAHFAoaHhrgw1CJOFw38vF4qrsoVY30dC1gBXzx/UyA=
X-Received: by 2002:a92:d308:: with SMTP id x8mr11577632ila.42.1576488622626; 
 Mon, 16 Dec 2019 01:30:22 -0800 (PST)
MIME-Version: 1.0
From: Lei YU <mine260309@gmail.com>
Date: Mon, 16 Dec 2019 17:30:11 +0800
Message-ID: <CAARXrtnfDjG1jaSQPJ78t-bKM7R0-LgdmFWEmBfibSOeJ26J5g@mail.gmail.com>
Subject: Fixing sdbusplus CI issues
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This email is to introduce a few changes to sdbusplus to fix the CI issues.

You may have noticed that sdbusplus has no change for a long time, and
the CI is broken on the latest OpenBMC.

The CI has two issues:
1. The case VtableTest.SameContent() fails
2. Valgrind reports an error about "Syscall param epoll_ctl(event)
points to uninitialised byte(s)", on ppc64le, but not on x86-64.

For 1), it is the bug in sdbusplus that vtable.hpp does not handle the
member added in the newer version of systemd.
It could be fixed with
https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/27949, see
the gerrit link for details.

For 2), it is a bit more complicated, it's caused by code in systemd,
and eventually, it's a GCC bug. (And thanks @Andrew Jeffery for the
help on debugging the issue)
See below for details.

TL;DR

Here let me explain the above issue 2).

1. GCC has a bug https://gcc.gnu.org/bugzilla/show_bug.cgi?id=77992,
that the padding bytes are not initialized in case of such code:

    struct S {
        long l;
        char c;
    };

    void main () {
        struct S s ={
            .l = 0,
            .c = 0
        };
    }

2. In systemd, the code in [libsystemd/sd-event/sd-event.c][1] using
epoll_event hit the above bug:

    ev = (struct epoll_event) {
        .events = EPOLLIN,
        .data.ptr = d,
    };

Because epoll_event is defined as

    typedef union epoll_data
    {
      void *ptr;
      int fd;
      uint32_t u32;
      uint64_t u64;
    } epoll_data_t;

    struct epoll_event
    {
      uint32_t events;      /* Epoll events */
      epoll_data_t data;    /* User data variable */
    } __EPOLL_PACKED;

In glibc, on x86, `__EPOLL_PACKED` is defined as `__attribute__
((__packed__))`[2], so it's packed and there are no internal padding
bytes;
On other architectures (e.g. ppc64le), __EPOLL_PACKED is not defined
and thus there are 4 internal padding bytes between `events` and
`data`, that are not initialized.

3. When epoll_ctl() is invoked, in [Linux kernel][3], it does a
copy_from_user() to copy the whole struct into kernel space. That's
why Valgrind reports "epoll_ctl(event) points to uninitialised
byte(s)", only for non-x86 platforms.

4. sdbusplus has a timer test that invokes sd_event_add_time() and
eventually hit the above code. And in OpenBMC CI there are x86-64 and
ppc64le systems.
   * When the build is run on x86-64, there is no Valgrind error;
   * When the build is run on ppc64le, we got the error.

To fix that issue, we could:
1. Wait for the GCC bug to be fixed, which is not likely to happen.
The bug was opened in 2016 on GCC 5.4.0, now the issue remains on GCC
9.2.1 as well...
2. Workaround the issue by initializing strict epoll_event to 0. I
send a PR to systemd https://github.com/systemd/systemd/pull/14353,
but not sure if it will be accepted or not.
3. If the above is not accepted, we have to suppress the Valgrind
error. It is sent to gerrit as well:
   https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/25548

So if you think GCC or systemd could be fixed, could you please go to
the GCC bug or the systemd PR and leave comments to help to push the
fix?
Or if you think it's acceptable to suppress the Valgrind error, please
give +1 on the gerrit review.

Thanks!

[1]: https://github.com/systemd/systemd/blob/v242/src/libsystemd/sd-event/sd-event.c#L956-L959
[2]: https://github.com/bminor/glibc/blob/f1a0eb5b6762b315517469da47735c51bde6f4ad/sysdeps/unix/sysv/linux/x86/bits/epoll.h#L29
[3]: https://github.com/torvalds/linux/blob/d1eef1c619749b2a57e514a3fa67d9a516ffa919/fs/eventpoll.c#L2095
