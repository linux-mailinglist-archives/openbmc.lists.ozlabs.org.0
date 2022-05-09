Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49300520637
	for <lists+openbmc@lfdr.de>; Mon,  9 May 2022 22:53:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxtgJ0yxQz3bgC
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 06:53:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20210112.gappssmtp.com header.i=@tanous-net.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=2BwPWbAx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20210112.gappssmtp.com
 header.i=@tanous-net.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=2BwPWbAx; dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kxtfv0T56z3bbB
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 06:53:08 +1000 (AEST)
Received: by mail-yb1-xb33.google.com with SMTP id w187so27171872ybe.2
 for <openbmc@lists.ozlabs.org>; Mon, 09 May 2022 13:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WcqbKeDprQ+NRHOKllYuZdO0HObLsqTgduToYO/nvZw=;
 b=2BwPWbAxQNZEj3nluH8swNjEU97qmUYQiDZi0hd1AhGsHg3fprj602il+UlO1vrc4z
 6bcxzp5jmtC54q0IVvIoIH5LBhrtZQF720VyW87A2AXaHHvIlYdkD5lXLpD2NaMdZ8Jt
 gWvrPAO/I1gntmsieNyXBCmUc3BtObqjMtKc7qZFmHUngFtl6TzFvrsnLnH4tt2evE2t
 x4RxbuQ1qVll87MzGd18AmVfkwoXpPXZEmScqmeMREggsE5MIEcU4EP+w/H4UH8AMZWM
 9HaeMsnUz+hcGxt4PDG0FtWxtXAKf3p9RU4jr3DEyOWlsD4K5Lm0w6+aYoJSRbLG3phL
 /KdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WcqbKeDprQ+NRHOKllYuZdO0HObLsqTgduToYO/nvZw=;
 b=emQ38WX8tCMOouGBvTT7Iv3zdx3WRFkFutZBG3e+b4843N/o6AAw/asec9V/iGS4dg
 +7JSrgnpfwyLeFgmrrzDt4tpVxGYeEi/xD4bIetgckZvejR1tCYzoTqRzFvkAUmzsfVT
 YEhCF3T+SOuecfPvjpvj9gM9RwTchE1GS+GNydfRvoLsIYmfnEV0U3MON/gzaIFW2wNK
 OIsvmYj35lwsI6yaWbBL1HYMIR+pg3jn5gpJhwbNFyibHyuBKLbydRrehWMxOoe0o2u+
 aJeuJwja8fqIPHaQ6nejxmKAY9Y3Xljvzu0XC/gnCxO2U/Htl0/cJafgchERC9S40CEo
 N37Q==
X-Gm-Message-State: AOAM530wGPHV1w6FRuVkBPGJTUOTebWMwyqkX6Uueo7Nvd3Ixy5v14WM
 WDXLRj9QcGWwly8kXCkFLDBMCF8uHKyiCfswDwhOnQ==
X-Google-Smtp-Source: ABdhPJxVM2rDFlv+u1Fw9UA0AwW7H7tICGRg/FZWmN8kisTKB0EBr+J2jIwxQlwXYbKGz11bsGTLf972Hs9esk19mFM=
X-Received: by 2002:a25:5f03:0:b0:64a:2f21:73af with SMTP id
 t3-20020a255f03000000b0064a2f2173afmr14893911ybb.586.1652129585483; Mon, 09
 May 2022 13:53:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm54UG6o2_kFfor81+MmWW7pqxQ4bQu9FkVXaEbGhQ_JLQi-Q@mail.gmail.com>
In-Reply-To: <CAGm54UG6o2_kFfor81+MmWW7pqxQ4bQu9FkVXaEbGhQ_JLQi-Q@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 9 May 2022 13:52:54 -0700
Message-ID: <CACWQX81w1ZzXx64r0UcxpZrNyWB7HudMzZpSttqEeNav98JC9g@mail.gmail.com>
Subject: Re: Delayed match callback with sdbusplus asio APIs
To: Lei Yu <yulei.sh@bytedance.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Ed Tanous <edtanous@google.com>,
 William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Mar 10, 2022 at 9:17 PM Lei Yu <yulei.sh@bytedance.com> wrote:
>
> This mail is to describe an issue that the match signal's callback is
> delayed if it's using sdbusplus asio APIs.
>
> # TL;DR
> If the app is using sync DBus calls and using asio to register a match
> callback, the callback may be delayed if it occurs when the sync DBus
> call is ongoing.
> Note the issue does not occur if it's not using asio APIs.

You're doing blocking calls in an async daemon.  That's why your code
has a bug in it.

One such example is on line 89:
auto reply = bus.call(method);

That will block the main event reactor until it returns.  Take a look
at something like bmcweb for how to do async method calls without
blocking the main reactor.

>
> # Details
>
> Pasted a full buildable source at https://pastebin.com/KEmpvDzp
> The code
> * Registers a match for host power status, and print the changes.
> * Uses a timer to get sensors via sync DBus calls.
>
> With this code, it's very easy to reproduce the above issue in QEMU,
> just toggle the `RequestedHostTransition` to On and Off for a few
> times:
> # busctl set-property xyz.openbmc_project.State.Host0
> /xyz/openbmc_project/state/host0 xyz.openbmc_project.State.Host
> RequestedHostTransition s xyz.openbmc_project.State.Host.Transition.On
> # busctl set-property xyz.openbmc_project.State.Host0
> /xyz/openbmc_project/state/host0 xyz.openbmc_project.State.Host
> RequestedHostTransition s
> xyz.openbmc_project.State.Host.Transition.Off
>
> We can see the journal logs:
> # journalctl | grep -e test_asio -e "Moving to \"Off" -e "POWER_OUT set to 0"
> Mar 11 04:59:25 power-control[195]: POWER_OUT set to 0
> Mar 11 04:59:25 test_asio[23478]: aiso callback, property:
> RequestedHostTransition, value:
> xyz.openbmc_project.State.Host.Transition.On
> Mar 11 04:59:33 power-control[195]: Host0: Moving to "Off" state
> Mar 11 04:59:37 power-control[195]: POWER_OUT set to 0
> Mar 11 04:59:45 power-control[195]: Host0: Moving to "Off" state
> Mar 11 04:59:48 power-control[195]: POWER_OUT set to 0
> Mar 11 04:59:56 test_asio[23478]: aiso callback, property:
> RequestedHostTransition, value:
> xyz.openbmc_project.State.Host.Transition.Off
> Mar 11 04:59:56 test_asio[23478]: aiso callback, property:
> RequestedHostTransition, value:
> xyz.openbmc_project.State.Host.Transition.On
> Mar 11 04:59:56 test_asio[23478]: aiso callback, property:
> RequestedHostTransition, value:
> xyz.openbmc_project.State.Host.Transition.Off
> Mar 11 04:59:56 test_asio[23478]: aiso callback, property:
> RequestedHostTransition, value:
> xyz.openbmc_project.State.Host.Transition.On
> Mar 11 04:59:56 test_asio[23478]: aiso callback, property:
> RequestedHostTransition, value:
> xyz.openbmc_project.State.Host.Transition.Off
> Mar 11 04:59:56 power-control[195]: Host0: Moving to "Off" state
>
> In the log, `POWER_OUT set to 0` means RequestedHostTransition is set
> to On, and `Host0: Moving to "Off" state` means it's set to Off.
> You can see that test_asio's callback is not triggered during
> 04:59:33~04:59:48, and it's triggered for multiple times on 04:59:56.
>
> # More info
> * If the sync DBus calls are removed, the issue is not reproduced.
> * If I do not use asio at all, and use sync DBus calls with
> `sdeventplus::utility::Timer`, the issue is not reproduced.
>
> That is to say, this issue only occurs when asio and sync DBus calls are mixed.
>
>
> @Ed Tanous @William Kennington @Patrick Williams Could you kindly
> check the above behavior and let's see what could be wrong?
>
> Thanks!
>
> --
> BRs,
> Lei YU
