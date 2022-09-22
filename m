Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF4D5E5865
	for <lists+openbmc@lfdr.de>; Thu, 22 Sep 2022 04:10:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXzJx627tz3c1M
	for <lists+openbmc@lfdr.de>; Thu, 22 Sep 2022 12:10:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=iRJWkMFO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::e36; helo=mail-vs1-xe36.google.com; envelope-from=yulei.sh@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=iRJWkMFO;
	dkim-atps=neutral
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXzJT5GKSz2xy4
	for <openbmc@lists.ozlabs.org>; Thu, 22 Sep 2022 12:10:15 +1000 (AEST)
Received: by mail-vs1-xe36.google.com with SMTP id m66so8776603vsm.12
        for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2022 19:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=MCsmDVOobdbviKqTPvQMHO/7Bku01duI47Hu45DLJDs=;
        b=iRJWkMFOX85N8loOjTgB7vjiSVvzOSuuQ+wP5R8tYw0/JFVo/p9jyvzWNwMQ8MYkim
         5ivXnQs+JFaTrQTabyHQ6gd3aoebsa+VV2aUjc6rYiyVgpFHt4PQNRGE2OyDXzb/G/r1
         IhyLtfQ823anYEEAVu+BzmCsLLE696vUj5gNw6gfFnGz0SwWHZ+1RIipHXLWpBT6hy5a
         LwwzQOgoUUJvOoA/5dw0QjHckzmInF0/zY3gX4k8X3GxemoHfyoFPA2jFz23xu3s+9Lk
         qNsvRBMliukdFJK1YVvfalE8IHsU+TuX2HZ5u2xpYaNeyBEt6RlIh4Sv+A4F0pL+Fg1T
         JKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=MCsmDVOobdbviKqTPvQMHO/7Bku01duI47Hu45DLJDs=;
        b=72/0mRx3+dnF9XsW/y6kNGgxYspnzCTR7ZkaobQ1Cot+ods6CQvol4Yevl6wcbHszc
         w3Pw0Ozu6rBQy7ERLE37HussefaBFpFBS3gretW6p3998XnHFtE5Kj6ZPePVVCTVz2oQ
         FAqVtKoTKgHZnZ17h41BX+CfzeiACLX4ZiMnPzHX9PBffflZU24V4v187arH3spQs63B
         gdSsVNUX9E0jR+mbsNzw902fV7SDRSIu+VLrQJ73fPnCWglle0ZLTTJGoyzZj7T8KR7/
         46Opx0F042ZXYQ3gSo1klKt/vsfgZ8bQ9N4wA1HvMzpVMs3p3hMYp2XtO/1HHsKnU97S
         EwZA==
X-Gm-Message-State: ACrzQf2+ZV/Bm7IDn41uGZEt4bk5u6JCh8NtqODW/CfBoC6ZQODDa0XY
	dMXvtpz97tMm7h3mNbj9Ha8Lt5ggeu79KuZgVpvQHQ==
X-Google-Smtp-Source: AMsMyM7krnQznky0RyDzGLcAXAEwZwCahTvdeFpuatpjmWZbNV/ipvGBQQqBm3tPCqOpo1KcBNKd6Ca9EY7iKzlG6R4=
X-Received: by 2002:a05:6102:18a:b0:398:6067:d67b with SMTP id
 r10-20020a056102018a00b003986067d67bmr405819vsq.35.1663812611758; Wed, 21 Sep
 2022 19:10:11 -0700 (PDT)
MIME-Version: 1.0
References: <YyuLaigEAyiYpl+B@taoren-fedora-PC23YAB4>
In-Reply-To: <YyuLaigEAyiYpl+B@taoren-fedora-PC23YAB4>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Thu, 22 Sep 2022 10:10:01 +0800
Message-ID: <CAGm54UHu3wFdXTwd=cpe7bn3WVBf5rPA3Fi8mAtc4pJADOU5TQ@mail.gmail.com>
Subject: Re: Wedge400 (AST2520) OpenBMC stuck at reboot
To: Tao Ren <rentao.bupt@gmail.com>
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
Cc: taoren@fb.com, openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

We hit a similar but different issue about BMC stuck.
It occurs when running host DC cycle test, and when the issue occurs:
1. The BMC hangs, and the aspeed's heartbeat is off
2. If the wdt2 is enabled, the wdt2 will fire and aspeed chip will
reset and reboot into the seconds flash.
3. If the wdt2 is disabled, the BMC just hangs and we have to power
cycle the chassis.

We could not find the root cause, but it's likely related to a patch:
https://lore.kernel.org/openbmc/20201221223225.14723-2-jae.hyun.yoo@linux.intel.com/
If we revert the patch, the issue could not be reproduced anymore.

On Thu, Sep 22, 2022 at 6:09 AM Tao Ren <rentao.bupt@gmail.com> wrote:
>
> Hi there,
>
> Recently I noticed a few Wedge400 (AST2520A2) units stuck after "reboot"
> command. It's hard to reproduce (affecting ~1 out of 1,000 units), but
> once it happens, I have to power cycle the chassis to recover OpenBMC.
>
> I checked aspeed_wdt.c and manually played with watchdog registers, but
> everything looks normal to me. Did anyone hit the similar error before?
> Any suggestions which area I should look into?
>
> Below are the last few lines of logs before OpenBMC hangs:
>
> bmc-oob login:
> INIT: Sending processes configured via /etc/inittab the TERM signal
> Stopping OpenBSD Secure Shell server: sshdstopped /usr/sbin/sshd (pid 7397 1189)
> Stopping ntpd: done
> stopping rsyslogd ... done
> Stopping random number generator daemon.
> Deconfiguring network interfaces... done.
> Sending all processes the TERM signal...
> rackmond[1747]: Got request exit[  528.383133] watchdog: watchdog0: watchdog did not stop!
> Sending all processes the KILL signal...
> Unmounting remote filesystems...
> Deactivating swap...
> Unmounting local filesystems...
> Rebooting... [  529.725009] reboot: Restarting system
>
>
> Cheers,
>
> Tao



-- 
BRs,
Lei YU
