Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6613269C9C
	for <lists+openbmc@lfdr.de>; Tue, 15 Sep 2020 05:39:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Br8904s1wzDqS8
	for <lists+openbmc@lfdr.de>; Tue, 15 Sep 2020 13:39:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::130;
 helo=mail-lf1-x130.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=dX8W2Dp3; dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Br88C3mtpzDqQS
 for <openbmc@lists.ozlabs.org>; Tue, 15 Sep 2020 13:38:17 +1000 (AEST)
Received: by mail-lf1-x130.google.com with SMTP id b12so1516464lfp.9
 for <openbmc@lists.ozlabs.org>; Mon, 14 Sep 2020 20:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y69lNgOym3J5K60qCuuh820qXT6d/NBwIVLlW6PJnyA=;
 b=dX8W2Dp3N+mG8GtOLfYCkeWrbeIXE5egdF6FjtvTWMUPjJNM6fqfEz0SbxqcmN3h2c
 QuopoCiSptaC/HWDl6F3xpvYPXj9mxZuhwJUA2i6KBXEDFRqPgDLB0bDkwvrF3/ZkmwV
 gASQedgSywqR2ZZDo5a2JMKf7JqL1sp8Uu4HwzX8lVx13qFdy2pZdiS+HEdk3i4mob79
 2WH6hb4kIu8z/LzKynthIzsG4Kl70oVS2Ezi/ZIgPsZbzcKnkTxopUis8hq2ZwTKeS1s
 q0Q9gMsi5ycGw8dnXY1vnibDSeHbZoMljYEDmswj0cyK+6ewT+9F/Z0xLUO60zHROT0l
 rzhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y69lNgOym3J5K60qCuuh820qXT6d/NBwIVLlW6PJnyA=;
 b=Dd5TO35ESAYGnjJReJB4BoThNQVVL5sFOZw6bbewsCfUcySiIqzgWWuntj52pd9NAt
 oIJG4aSub64raNMjNCR/ASjCbllP735/3gO0hKNXMbjQm/b/4WUrjV3nx1mY2jfEqKTE
 Y3VUfetaDL7ie2QF8Sn42H/EwkLTCdGffmr4yDlL1VoW5nhPT4KSWYkjayMbb3f//Qvy
 fI7bu5eSBn0WHcxGd3l2wwafw5GqphPBe3yqRs3aIG1RunoghJfnC+EHhttjjq894RVt
 kOwzow+9s3HyIYyF5iFif49iCzmu6DYz7zI1K8L90DvvyVeIsej/c3RqLsg8T4Npy19Q
 eEyQ==
X-Gm-Message-State: AOAM531Jwxwwzk4qcQHel9VUbOTwBXx6b9p0fWfQCf5Xb6DAuD6TjUv1
 RlNZI4EG6N0+Z0gmO4W2ottduj17LsWiN6VyG9Zq4g==
X-Google-Smtp-Source: ABdhPJwMOBSjHgqaOme7Nj4WX/UkOIINKGhtLpjlqDlnsmo7arbHcLK16jlOChRL7upJrnef6nvKypllAfG1SJiZw9M=
X-Received: by 2002:a19:c645:: with SMTP id w66mr5571276lff.112.1600141091267; 
 Mon, 14 Sep 2020 20:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm54UETBZ-EAR-2tha+qHTH7h3H_1vZUe2Tp5kOTzY0isKLtw@mail.gmail.com>
 <636cd7a2-8b60-2868-104f-70378bf30a08@yadro.com>
 <CAGm54UFJYnk=dcaWd7rsyUoBHqMkwgSLi5oYAjsMCmkugE+HaA@mail.gmail.com>
 <9ae6b1f98e354503aab6ed1af5452e8cffba7d7f.camel@yadro.com>
In-Reply-To: <9ae6b1f98e354503aab6ed1af5452e8cffba7d7f.camel@yadro.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Tue, 15 Sep 2020 11:38:00 +0800
Message-ID: <CAGm54UHG611qtbKObUkFOYjaSkSd+tMabJ=kOwo9TkauyejyRg@mail.gmail.com>
Subject: Re: Design proposal for dual BMC flash with "golden image"
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Alexander Amelkin <a.amelkin@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> - A series of patches for implementing flash locks for Macronix chips that we
> use
> - A utility which gives control of golden side, called `gftool` and providing
>   abilities to:
>   - lock/unlock golden side
>   - reboot into golden side
>   - reflash golden side from main
>

Does the lock/unlock function work on the Macronix chip only? Does it
apply to other chips?

> > That's good to know! Could you comment on the design doc and see how
> > much difference it has?
>
> Yes, I will do on monday.

Thanks, let's discuss the design doc in gerrit.

> Yes, but the watchdog series of patches is more like a hack for now.
> We're expanding the watchdog api so that it grants the user control of WDT2 via
> ioctl(watchdog start on reboot) and allows for rebooting into golden chip using
> WDT2. However the upstream kernel maintainers won't accept it as they say it's a
> driver level decision, and we're exporting it to the user. That's something they
> don't want to accept. That may be fine though as theoretically the patch set may
> be kept only in the openbmc linux kernel, but that will put an additional
> support burden on Joel and the community. I'm discussing that with Joel.

OK, thanks.
For now, we use "devmem" to manipulate the registers for testing purpose.
It's nice to have that driver, but in productions there will be no
need to use devmem nor the ioctl on watchdog, so it's not a must for
us to use the driver.


-- 
BRs,
Lei YU
