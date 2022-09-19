Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC435BCACC
	for <lists+openbmc@lfdr.de>; Mon, 19 Sep 2022 13:32:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWMwv34PQz3bXG
	for <lists+openbmc@lfdr.de>; Mon, 19 Sep 2022 21:32:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=XUn3IPyj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::92c; helo=mail-ua1-x92c.google.com; envelope-from=yulei.sh@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=XUn3IPyj;
	dkim-atps=neutral
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWMwR6Fzyz2xy6
	for <openbmc@lists.ozlabs.org>; Mon, 19 Sep 2022 21:32:21 +1000 (AEST)
Received: by mail-ua1-x92c.google.com with SMTP id y20so6532579uao.8
        for <openbmc@lists.ozlabs.org>; Mon, 19 Sep 2022 04:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=wTyujgc+AyaRu9HnQxiAxF3tqmJRD/e2UCg8xy6nMv4=;
        b=XUn3IPyjKEgwz5Dx/kqyDgPqjfmmq+o5NGxHnztPo1gsbsWL5NjeDPTAXYA/bXifPx
         AAR5Blr2NXRcabaBNXbRLZ1Fc0QhW5DYgo7Uh+j63h3z6+Pmh5yDtiABIEZI63tvKtmN
         dLdk7b/X5776XHdtIXHKdbsCJogPXSgFekepEWZ53ZUvA7EAbGbaJqLOXvjAWW4Z/tT2
         rIWu3yuf8qZ9s1tnRxRolSYgJD+OwXUnRds9tJPgHrZL/8UrGYzToO3uVAmF/8/zgzvB
         geir8G8k997k89F8FqBOBoUSeS9A1+XoPR4v+tb4+cL7tksd40X8kAo2VKRL8dOR1bFA
         okWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=wTyujgc+AyaRu9HnQxiAxF3tqmJRD/e2UCg8xy6nMv4=;
        b=JXxzC6jkM7zpC766ncJDMqi6ia5c+t9wSxwJHtvdtaQWkbkQSAkTT3mvV0RAEowYav
         8mjLPqiBj9nByuLbOv/qluyCL8Cf9nLp6Cc1vssLc0rGKhkhTJZ2wBfe/vXSQaRMz+pe
         nxF+mBhYpLhsV8NByvYFjHJhL9wnMp+2QGPwXLFvSwqct1j4/kd10X8RD7PVt4VKrpSr
         Xp5FtvDLlu4XgV8vNd5vhI8WoGburR9Xqr+SNy+kMV/FsxDxWaoHb4RZ8v5S4EzIF0pL
         TdaIGpd1zQJB74bw/dKQQqRfLCWsX3Gf/benM4PQ8llrZ2zTBZK8/mXHQNqw4eGOTDSr
         YAuQ==
X-Gm-Message-State: ACrzQf2qzFGLxOLwUbpbtaA8Vj4pen3lwepc1ATq36TvQNgLQvo3DNWb
	Ft/Sljw4wzbWdkTIBV++UWHgkFrjCfpo4y0Zg5N0EQ==
X-Google-Smtp-Source: AMsMyM7KOs2c+pjRqaVBrfLChOzFQqftAdvJJ25RKuTHTVDG27IAe5a4y8Jqi/TP0bx88PBN9/ZoO/wK0URYPFEl/+0=
X-Received: by 2002:ab0:22d1:0:b0:3b0:9060:fa6 with SMTP id
 z17-20020ab022d1000000b003b090600fa6mr5835893uam.116.1663587138009; Mon, 19
 Sep 2022 04:32:18 -0700 (PDT)
MIME-Version: 1.0
References: <CANFuQ7DkAwQqLZoOMPmTURUWDdk=Kfx1xTFN2jE9VQQH-wmhSA@mail.gmail.com>
In-Reply-To: <CANFuQ7DkAwQqLZoOMPmTURUWDdk=Kfx1xTFN2jE9VQQH-wmhSA@mail.gmail.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Mon, 19 Sep 2022 19:32:06 +0800
Message-ID: <CAGm54UF4wa+LhMi0KXjp3cx8R0DUg-Zk=cipA3__Fm0xHFdyQw@mail.gmail.com>
Subject: Re: Whether to allow setting time in NTP mode
To: George Liu <liuxiwei1013@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Sep 19, 2022 at 5:06 PM George Liu <liuxiwei1013@gmail.com> wrote:
>
> Hey, everyone:
>
>   This email would like to discuss whether to allow the requirement to
> set the time when NTP is enabled.
>
>   In the phosphor-time-manager, The current design logic is:
>   1. The timeManager will listen to the TimeSyncMethod property of the
> xyz.openbmc_project.Time.Synchronization interface to set the SetNTP
> method of timedate1 and update the current Time mode. [1]
>   2. When the user changes the time using OOB, the timeManager does
> not verify the current Time mode, and directly calls the settime
> method to change the time. If the current is in NTP mode, setting the
> time will throw an exception. [2]

For the record, the exception is thrown due to the DBus call to
`org.freedesktop.timedate1` service failure.

>
>   But there is a potential problem here:
>   When the user sets the mode from NTP to manual by way of OOB, then
> the time is set immediately. At this time, there will be an error in
> setting the time because the NTP service is not completely stopped,
> but we do not want to throw this error to the user, because for the
> user layer, the mode has been switched to manual (TimeSyncMethod =
> Manual)[3]
>
>   I have a patch that determines whether the current NTP service is
> completely stopped (a timeout mechanism is added) when setting the
> time [4]. But @Lei suggested that this mechanism should not be
> implemented on the timeManager server side, but should be handled on
> the client side.

The reason is that the time-manager will have to "wait" until the time
could be set and it effectively blocks the event loop in the patch
mentioned above.
It could be resolved by making time-manager async, but it's off-topic.

>
>   Also, @Lei also has a different idea downstream, using settimeofday
> instead of timedate1

We have a requirement from the users that the "set-time" should be
successful even if the BMC is in NTP mode. (Be noted that the time
will be updated by NTP after a short while).
To set the time, use `settimeofday` instead of making DBus call to
`org.freedesktop.timedate1` service solves the above issue, and it
meets our internal requirement.
If we all agree that this is the expected behavior, I could send the
patch upstream.

>
>   I would like to hear everyone's suggestions, and I would like to
> optimize this function if appropriate.
>
> Thanks
>
> [1]: https://github.com/openbmc/phosphor-time-manager/blob/master/manager.cpp#L28-L31
> [2]: https://github.com/openbmc/phosphor-time-manager/blob/43dfeeb1e22d6d7fcec9f1d4be81f3e9d6857e62/bmc_epoch.cpp#L120-L139
> [3]: https://github.com/openbmc/bmcweb/blob/07c8c20d371aae85611738ca61015fc6a8caa16a/redfish-core/lib/network_protocol.hpp#L215-L240
> [4]: https://gerrit.openbmc.org/c/openbmc/phosphor-time-manager/+/56584
>
>
> George Liu



-- 
BRs,
Lei YU
