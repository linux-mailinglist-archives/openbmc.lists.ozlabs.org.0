Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 434B952CDAE
	for <lists+openbmc@lfdr.de>; Thu, 19 May 2022 09:58:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3hzw1RzLz30FH
	for <lists+openbmc@lfdr.de>; Thu, 19 May 2022 17:58:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Dhb11PnK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42a;
 helo=mail-wr1-x42a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Dhb11PnK; dkim-atps=neutral
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3hzS1ky6z2yHZ
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2022 17:57:39 +1000 (AEST)
Received: by mail-wr1-x42a.google.com with SMTP id t6so5933434wra.4
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2022 00:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E3VKyMu2XJIiew+HidwLC3X6Gp/A++Dh3YSI3fV463I=;
 b=Dhb11PnKN+eB5QWSCvLhvFC/Fyo8smoYmqTwDL2bOhX49yiPQz30GME2rsfcql8Ytv
 JxVKfGCw/OepshPRFQZSn6rS4gdII45FBGYFBqa7Vnbb1q9Od06qw8AC8FSRIM2KQTMu
 BGe4ns09G+64Wy+MYdTcyUE1hQje0UhOlEQzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E3VKyMu2XJIiew+HidwLC3X6Gp/A++Dh3YSI3fV463I=;
 b=hZ5r8U2B3nBHEy5yWmv6yXZIbzo43VmQQ2H8HWAYrz9wSGnsE9ut01MPLMc7nVRAxR
 uLZvotKov2CdsHhm4p7gBsNnkrqqx9cvMSXY7qvb0/44w89Xk7Q5FmTChMdS/0Z4WjxJ
 30MUApLWxETj0D1zd/5wYjmk/C82kSIDKDlwMQSLzJ1zmElTbwjyW5mqLs52F0vm9jBZ
 ltV2UMUK/3xKBBBcaQq1EHoeanUahkXp9ssASqEy3wVqo/4bXKEgsNUchc/ST8JM5bJ8
 lb3CyyC6hEUUnyXASHBSaMfpHmES8sq0gLrDjewH0A4iXYyZ8m22JO5sNhtac6wim5WS
 hUYw==
X-Gm-Message-State: AOAM532CgbcETMlgO0FQVTwROV3ofKkYwNHP8HyoVvgSUS/TxesxWx0a
 OdUvWjt8V4iSdPNLIJVJESRlwhhY/A8JOX2GZAk=
X-Google-Smtp-Source: ABdhPJyrDjkPB3gV/jrX7EAW7MFKKOl3/I2amHdwaII1kfgsIuLm2M1Cqk4zpUmbpu/6gcDRCpUcHwFo50sbX+yKqzY=
X-Received: by 2002:a05:6000:16c4:b0:20d:914:a441 with SMTP id
 h4-20020a05600016c400b0020d0914a441mr2791067wrf.705.1652947051057; Thu, 19
 May 2022 00:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220519073940.GH11809@packtop>
In-Reply-To: <20220519073940.GH11809@packtop>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 19 May 2022 07:57:19 +0000
Message-ID: <CACPK8XeT5q4oEcPnXy2MP9ipPtU6yWgOY=RGYNeQ-o-zurp=Eg@mail.gmail.com>
Subject: Re: Backporting approach for nct6775 kernel patches
To: Zev Weiss <zweiss@equinix.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Renze Nicolai <renze@rnplus.nl>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 19 May 2022 at 07:39, Zev Weiss <zweiss@equinix.com> wrote:
>
> Hi Joel,
>
> My patches adding i2c support to the nct6775 hwmon driver are now in
> Guenter's hwmon-next tree, and so presumably will be included in the
> upcoming v5.19 merge window.  I'd like to get that functionality into
> the OpenBMC kernel so as to support my ASRock romed8hm3 port (the
> initial meta-layer patches are now on gerrit [1]), but it's a sizeable
> series, with a fair amount of intermediate changes to the same driver
> (between the current OpenBMC kernel and the start of my series)
> preceding it -- enough that rebasing just my changes back onto the
> dev-5.15 branch would be a bit of a headache.
>
> What do you think would be the best/easiest way to go about the
> backporting process?  I could just send the entire 22-patch series
> (including all the other preceding stuff) as is, though it seems like
> that might be a bit unwieldy (if you want to take a glance, I've pushed
> that to a branch based on the current dev-5.15 branch on github [2]).

Nice work on getting that done.

I'm fine taking them. I can take that branch you've pushed.

>
> Alternately, if you happen to be planning on bumping the OpenBMC kernel
> to a newer mainline release in the near-ish future that would reduce the
> amount of intermediate patches quite a bit, so I could just hold off and
> wait for that if so.

I would like to move to the v5.18 tree once it's out. It might end up
getting pushed out to v5.19 though, we will see. I haven't looked at
which of the two are going to be a long term stable tree, if any.

Cheers,

Joel
