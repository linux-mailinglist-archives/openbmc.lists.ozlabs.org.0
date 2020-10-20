Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 624D529336A
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 04:59:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFddZ4SYlzDqWY
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 13:59:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::c2e;
 helo=mail-oo1-xc2e.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=etBLmx/j; dkim-atps=neutral
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFdcl6fBJzDqDh
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2020 13:59:03 +1100 (AEDT)
Received: by mail-oo1-xc2e.google.com with SMTP id w7so82180oow.7
 for <openbmc@lists.ozlabs.org>; Mon, 19 Oct 2020 19:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uwFQ2iNK51GB3Z2d6i05jHG6MxfTuJ1gMomcfSQtALM=;
 b=etBLmx/jZ7yynIKoIONsJ8O+WDmycHFqTsos0lUPhJ5j63z+6DOu10mZipfKWLQZRg
 C7rLUVWFs066J18uYau1T8zkcO8Czu0C391uBxB1q/4o3pd6/wmnmOvtajWCGr3++3py
 sju7urvONgAiWEdKl6ATIqYSdDSOV0j+QHJAQoVY+whI7JqIGImePeV96LwQ4eOPR+Xg
 UhzFv+leMLpMxiFdWXsKSS+ePYmn7cm0j+LgbbiliUnOJEKioDO78GOW0ABwExs8fJHl
 AtxXij86pGoMnm85G/XuPUb3pjAaLXQggaH8qRuoQAzvU0J5i+OULTOEfoKKsbs0DXou
 MNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uwFQ2iNK51GB3Z2d6i05jHG6MxfTuJ1gMomcfSQtALM=;
 b=do72v556iQpSVuVGBCBVvAeU9aE15D26hxGDaHx3nQcdexY8DF8x85OPxxxr86KKwH
 Ga4ZXmAATVwjj3aLym+aay7p14bQy+g0aa0T1b0N09mxgxqrZaMSV4VvSendqSI5dc6j
 Pw4Vu4k0P6bshVAKYuted7MiM6UhXukqbVBXSJNq8/Oz5sIl7wVULRg45+xZ/aFNw01n
 SDT8zjts69qfOvjl4RBlU68TKqe2jZ2wGD3QbJKnX9tDeHWo2l00IgeW5PRXD7Q8+zG9
 TB6iVYk9oo79xo+otpswKy1clmgWFVOdNB1n/55pMXm7OrGBUTH/RmJeseXdUKOIG+k9
 oe0A==
X-Gm-Message-State: AOAM531QS3gDmoOAOmO8qCSlAxOkJUnBYO9y0cUDf4odSpnnU163hZvL
 tYcWKxlpqoZ+WmWrJGdsAeBBFUsepBxcHsmmmglvGw==
X-Google-Smtp-Source: ABdhPJx7xmWlafDFiroGAId8Un6cu9VOkrW//9kSJyLB6eFDQlivMh65n7HpI3K/cCYLre5fp1w6Dmo/sGRJus3cxUk=
X-Received: by 2002:a4a:c68d:: with SMTP id m13mr347550ooq.64.1603162739425;
 Mon, 19 Oct 2020 19:58:59 -0700 (PDT)
MIME-Version: 1.0
References: <C270F145-2236-4CA1-8D57-A63AB622A47C@gmail.com>
In-Reply-To: <C270F145-2236-4CA1-8D57-A63AB622A47C@gmail.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Tue, 20 Oct 2020 10:58:48 +0800
Message-ID: <CAGm54UFr-4iUrd2gSu38gsEXG9cd0y83mi-mk8NOMKRvwHQTMg@mail.gmail.com>
Subject: Re: Critical BMC process failure recovery
To: Andrew Geissler <geissonator@gmail.com>
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

Hi Andrew,

In Intel-BMC/openbmc, there are watchdog configs for every service
that in case it fails, it will reset the BMC using the watchdog. See
the below related configs and scripts.

https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-common/classes/systemd-watchdog.bbclass
https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-common/recipes-phosphor/watchdog/system-watchdog/watchdog-reset.sh

It probably meets most of the requirements.


On Tue, Oct 20, 2020 at 3:54 AM Andrew Geissler <geissonator@gmail.com> wrote:
>
> Greetings,
>
> I've started initial investigation into two IBM requirements:
>
> - Reboot the BMC if a "critical" process fails and can not recover
> - Limit the amount of times the BMC reboots for recovery
>   - Limit should be configurable, i.e. 3 resets within 5 minutes
>   - If limit reached, display error to panel (if one available) and halt
>     the BMC.
>
> The goal here is to have the BMC try and get itself back into a working state
> via a reboot of itself.
>
> This same reboot logic and limits would also apply to kernel panics and/or
> BMC hardware watchdog expirations.
>
> Some thoughts that have been thrown around internally:
>
> - Spend more time ensuring code doesn't fail vs. handling them failing
> - Put all BMC code into a single application so it's all or nothing (vs.
>   trying to pick and choose specific applications and dealing with all of
>   the intricacies of restarting individual ones)
> - Rebooting the BMC and getting the proper ordering of service starts is
>   sometimes easier then testing every individual service restart for recovery
>   paths
>
> "Critical" processes would be things like mapper or dbus-broker. There's
> definitely a grey area though with other services so we'd need some
> guidelines around defining them and allow the meta layers to have a way
> to deem whichever they want critical.
>
> So anyway, just throwing this out there to see if anyone has any input
> or is looking for something similar.
>
> High level, I'd probably start looking into utilizing systemd as much as
> possible. "FailureAction=reboot-force" in the critical services and something
> that monitors for these types of reboots and enforces the reboot limits.
>
> Andrew



-- 
BRs,
Lei YU
