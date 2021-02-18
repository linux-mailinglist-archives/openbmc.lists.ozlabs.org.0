Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4F931E654
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 07:31:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dh4bf1XXlz3bPF
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 17:31:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=BtjhXC6e;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::c2d;
 helo=mail-oo1-xc2d.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=BtjhXC6e; dkim-atps=neutral
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dh4bP3SQ1z30K3
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 17:30:56 +1100 (AEDT)
Received: by mail-oo1-xc2d.google.com with SMTP id g46so208333ooi.9
 for <openbmc@lists.ozlabs.org>; Wed, 17 Feb 2021 22:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L1mWLOId3e3FXYp+dhUF4jyKFOLtnvt2Mi4XytMIg7A=;
 b=BtjhXC6ehbABvOKuAaRrVU11wJ0wrj9oM9P1g4COqCh7C8o0V8YuZ+sKhb3JgD0Ooo
 mABrfMOz7BDKLgM2RP0RSW+iKYHgzmL2OhFj2dkVSMsnq9isAaLVq0H4RqYbSClKOULT
 rNWaWDkyo3SOe1244NuArEWaPOqLqQrwWjGeSU8lHVwwWz4cQth0Ejsaa36VFXFhN0Q2
 mKO4DoEWOTvZhT1Q10fLzcYMetVafRUKP1jObKZdW3Ri79I+VQJjaMw7/K64IR2ftxyT
 QNNPiJ242uWznxA03Em9MMtUDPhr9JRTU1FAGtSXjBRToTnE9AQkcggumakzagza89j7
 HI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L1mWLOId3e3FXYp+dhUF4jyKFOLtnvt2Mi4XytMIg7A=;
 b=n3ERq2UVdNypL6tEJIr7HHaUHI9tPwrnxskUW1AN1JSdZUaDOl7vbtjDdIIC9HMFbG
 lD1dIp/DuzhSIq/OD3S0ksK/bcYDvl5VqXyc6cnzlYdHkjPoZu/xxdVO8twnnIKYsyly
 glgNeOJn6NSpu2CVccNM6DYGPPG4CYM1CiCr/Jop++bcBdCCAKJrIUyzmn2TS8Xo2TrN
 56ld6WNkzmZj1SoP2CzpaZ6opvxGipsiPlXcdOhJbdM1FZ6wjCYTgYwKZNQ3wwlK3hJa
 5u79RO5oaSz47Ox76F3DjBkl8/3E+rIClhk3JyY7xAAAH37k069lkAi8a0xWML+1V+qL
 rgCw==
X-Gm-Message-State: AOAM532xxJzNZGBJ8F8G7RsInlqzhagTRkEm+d0SH3WmlAqZpJ3l9Omm
 09c3qO2vVI3uZeO9wAez8qkf6xwwx6pyNuefSdsW0Qrjcw/H9w==
X-Google-Smtp-Source: ABdhPJzOQ0T56gLP05mU6+cLgLXQWBApVHi8QaIdmNpCtx4vwZ8+/xlcMIemRy8PwyWR2GX7kV9TutxU0b532hEu9+c=
X-Received: by 2002:a4a:c4c7:: with SMTP id g7mr2012691ooq.10.1613629853090;
 Wed, 17 Feb 2021 22:30:53 -0800 (PST)
MIME-Version: 1.0
References: <YCXLqK7KgvwYwWDl@heinlein>
In-Reply-To: <YCXLqK7KgvwYwWDl@heinlein>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Thu, 18 Feb 2021 14:30:42 +0800
Message-ID: <CAGm54UHw90NbTWFpOrddtkc27rqi1gzgWj8KSPEFzUgAfhiF-w@mail.gmail.com>
Subject: Re: [External] Upcoming enhancements to `run-unit-test-docker`
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Reporting a bug on building with proxy:

    base: WARNING: Retrying (Retry(total=4, connect=None, read=None,
redirect=None, status=None)) after connection broken by
'ProxyError('Cannot connect to proxy.',
NewConnectionError('<urllib3.connection.VerifiedHTTPSConnection object
at 0x7efe419e99d0>: Failed to establish a new connection: [Errno -2]
Name or service not known'))': /simple/inflection/
    RAN: /usr/bin/docker build --build-arg http_proxy=http://<myproxy>
--build-arg 'https_proxy={https_proxy}' --network=host --force-rm
--no-cache=false -t
openbmc/ubuntu-unit-test-base:2021-W07-773f263e895d8ed6 -

The https_proxy is not correctly set.
Submitted https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-build-scripts/+/40699
to fix the issue.

On Fri, Feb 12, 2021 at 8:51 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> Hello,
>
> Inside openbmc-build-scripts is a tool which is used by Jenkins to run
> repository-level CI and I think some developers also use it:
> `run-unit-test-docker`.  I've rewritten a component of this, which is
> now at `scripts/build-unit-test-docker`, in Python and done some
> enhancements to it.  The [currently] last commit in this sequence is at
> [1].
>
> Important notices:
>
>     - Location change: build-unit-test-docker.sh ->
>       scripts/build-unit-test-docker
>         + I suspect few people run this directly, but instead use
>           `run-unit-test-docker` which hides the rename.
>
>     - Python3.6 minimum.
>         + Bitbake already requires this so it really shouldn't be a
>           problem for anyone.
>
>     - Python 'sh' module needed.
>         + You can install this with the 'python3-sh' package on many
>           distros or 'pip install sh'.
>
>     - Docker stages are now tagged with different names / tag revs.
>         + I wrote a `scripts/clean-unit-test-docker` which will clean
>           out old Docker tags and can be ran periodically.
>
> Major changes:
>
>     - Rewrite in Python.
>     - Significant speed improvements:
>         - Docker stages all build in parallel to formulate the final image.
>         - All Docker stages are tagged and reused from run to run.
>         - CMake packages now use the Ninja backend.  This is the same as
>           bitbake and faster than make.
>     - Included packages are defined in a dictionary rather than as raw
>       Dockerfiles.
>
> Upcoming changes:
>
>     - Shortly, I will add support to incorporate base package changes
>       into the image itself.  We have had cases where a change to
>       a common package like `sdbusplus` broke CI because a package that
>       depended on it failed to compile with the changes.  I'll add code
>       that uses some of the GERRIT_* environment variables to determine
>       if the commit-under-test is part of one of the base packages and
>       include it in the Docker image for the test run.
>
>     - Topic-based testing.  We often run into co-dependencies between
>       phosphor-dbus-interfaces and another repository.  Within the next
>       month I'll enhance the script so that if you change PDI and your
>       repository and tag the commit with the same topic, the PDI commit
>       from that topic will be pulled into the Docker image so your
>       repository commit can pass CI.
>
>     - Some refactoring.  I did a lot of incremental changes from the
>       original shell script to the Python version I currently have and
>       didn't always rewrite in the most Pythonic way.  There will be
>       some more, mostly non-functional, changes to fix this.
>
> Feel free to comment on the review series if you have any concerns with
> these changes.
>
> 1. https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-build-scripts/+/40366
>
> --
> Patrick Williams



-- 
BRs,
Lei YU
