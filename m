Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9EE47E789
	for <lists+openbmc@lfdr.de>; Thu, 23 Dec 2021 19:14:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JKddL6VzNz2ywn
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 05:14:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=JeCk+rob;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32e;
 helo=mail-wm1-x32e.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=JeCk+rob; dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JKdcw4sxqz2xXx
 for <openbmc@lists.ozlabs.org>; Fri, 24 Dec 2021 05:14:22 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id
 o19-20020a1c7513000000b0033a93202467so3666278wmc.2
 for <openbmc@lists.ozlabs.org>; Thu, 23 Dec 2021 10:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fspzb/MhKffyKK6B4sQ6q4KAsuY5mAWOhMIg2t0oGtQ=;
 b=JeCk+robabjbdVJoS8hlRXRIyFcolFRwkD51bS1TU284FRxJYerWV47nwal8dyzT2l
 qlgKfMERlApuQ7+28VS+a3Jegfcmh6xRf+xgjzJFyQcRz5zrH4vuSFT9+EAhhzqhSig+
 +VK6hIZbuIdrfiYhQUrZm8D+xwk/LLECDbWXAqySu7NQxVsm9D2Xp4wl1oszdgjEngEN
 ktz4/VXhAosp6s4xELp7ZsU46k+88mWfNLdtwTZu3jwMlak/JL92RKAye60zwLfd5gPV
 djHlj9lCQzyYHnXiGmBlWMxM0oryzJibS1ctsfPMtCbY3zvCw5ST5NBmp5ZPrs3eyEoz
 mSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fspzb/MhKffyKK6B4sQ6q4KAsuY5mAWOhMIg2t0oGtQ=;
 b=xgNejNSnq2aLgfheNHMe/HXAlU8HIllzdrXypgmld2X0vJukWDHFMxn6Itet9J33pg
 Uk1X++k2TJlfSUdzrxB1Gb9dR0ljcpfA7BBLdoBBZsd+69qUj6DM8c8qscBN90gpm+bm
 3BpK26imZ8iXizSuXWFN9DjVQMKWB7yt5j9QwYB0V2oxMfyYVHTBUI5bjRdOZ+Stnmh8
 LWDkweYo3uLJzmSZu2/MxYlEPvvzQf7tpdittDU454qKk5EFBVXSR3H9ngW12jSHitP7
 L7RQA6yl49bAByHs4zixGDXUMw5zRKTz9allRwJ/P9Qad8t8eBq/x0rmpjaWtgWrK4cB
 IQNQ==
X-Gm-Message-State: AOAM532OthHh+T/xdYeqR7hX2V3YkaTL6qEKXn9onEzNHIR4pDtQae+d
 tBCBFqqIg6Qc9aSlHEUQQPAbvaI76lDb3qHsaKOssA==
X-Google-Smtp-Source: ABdhPJwKzAlTE+DR/BEl+8AcEJd/rjhgcuzt9qkDIT7S/UITPp60dOgduZlCMXbhAXkoh+II7ZSP4uSGM8wmdBPwX+I=
X-Received: by 2002:a05:600c:5010:: with SMTP id
 n16mr2458175wmr.139.1640283254162; 
 Thu, 23 Dec 2021 10:14:14 -0800 (PST)
MIME-Version: 1.0
References: <YcSZlt4HPeBO3sL3@home.paul.comp>
In-Reply-To: <YcSZlt4HPeBO3sL3@home.paul.comp>
From: Ed Tanous <edtanous@google.com>
Date: Thu, 23 Dec 2021 10:14:02 -0800
Message-ID: <CAH2-KxCD+MKnva7S2iO_iqnQbDKAhJEqMgjV-A_Fn6JZWeEUcA@mail.gmail.com>
Subject: Re: sdbusplus reading InterfacesAdded issue: not all variants are
 created equal
To: Paul Fertser <fercerpav@gmail.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Dec 23, 2021 at 7:46 AM Paul Fertser <fercerpav@gmail.com> wrote:
>
> Hello,
>
> While digging into current state of SNMP notifications (traps) support
> in OpenBMC I found some code I have no idea how to properly improve.
>
> phosphor-dbus-monitor has a handler that's meant to be called whenever
> a new log entry is created by monitoring InterfacesAdded signals on
> D-Bus logger paths. The processing is at
>
> https://github.com/openbmc/phosphor-dbus-monitor/blob/master/src/snmp_trap.cpp#L28
>
> It seems OK until you look into PathInterfacesAdded definition which
> includes a hard-coded std::variant<>:
> https://github.com/openbmc/phosphor-dbus-monitor/blob/master/src/data_types.hpp#L66
>
> This already raises suspicions and rightfully so: the interface we're
> specifically interested in, xyz.openbmc_project.Logging.Entry,
> includes AdditionalData property which should be of type
> std::vector<std::string> , but that's not in the list of the allowed
> hardcoded variants.
>
> If I'm trying to use the std::variant<> type suitable for
> Logging.Entry then msg.read() fails with InvalidEnum error, probably
> trying to parse data about other interfaces, and this is a bad idea
> anyway.
>
> So what is the correct method of using statically-typed sdbusplus APIs
> to parse such a "dynamic" reply?

I haven't looked at the code in question, but we hit the same thing in
bmcweb, and solved it by just doing the unpack manually from the
message, which lets you directly unpack into whatever structure you
want.

Take a look at the convertDbusToJSON function here.
https://github.com/openbmc/bmcweb/blob/d1a648140e3cadd0ea6b0014c4d61ec880742000/include/openbmc_dbus_rest.hpp#L1132
And the code for the InterfacesAdded call specifically:
https://github.com/openbmc/bmcweb/blob/9062d478d4dc89598e215e1538ba8fbb8db2cf10/include/dbus_monitor.hpp#L70

It's not ideal from a coding abstraction perspective, and in some
places we're calling directly into the sd-bus apis to open and close
the containers, but it does work for types that we've never seen
before, as we've defined the unpack behavior for all generic dbus
types (array, variant, struct, ect), not c++ types.

>
> --
> Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
> mailto:fercerpav@gmail.com
