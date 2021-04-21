Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C56793674E7
	for <lists+openbmc@lfdr.de>; Wed, 21 Apr 2021 23:51:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQZ5B4yY9z300b
	for <lists+openbmc@lfdr.de>; Thu, 22 Apr 2021 07:51:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=eS5EOm19;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::129;
 helo=mail-il1-x129.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=eS5EOm19; dkim-atps=neutral
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQZ4y1hpnz2xYZ
 for <openbmc@lists.ozlabs.org>; Thu, 22 Apr 2021 07:51:27 +1000 (AEST)
Received: by mail-il1-x129.google.com with SMTP id i22so31425621ila.11
 for <openbmc@lists.ozlabs.org>; Wed, 21 Apr 2021 14:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0NqQa2oz+OEm0tUCJd6PYLvZ84GA9jlZRPrKCiKcYOQ=;
 b=eS5EOm19jXNY1OFiIJSPaeu+3KfcoDZwhPELbLsqqJcxy1+kwqEkpcFmEnvVQ/ArhL
 hB2Mz9gXRrLo2vGOSXTbfz2lBOIEd1VuMTWpGqE1ptqvmwc4oVDhjF3QmlnJehTWGBiq
 aSjL2TS4tDk13/6aIE2op1dQlpUIhbC7nBKixJBihNjrQI9aYMWQAJ5cutK4wiCGRY0J
 BTLn87eLQhxVettBUvGkeRxcrfzkOgHXWXFct8JmI7MPWkpnoKp8iBNC/rRXZ90tDL0Y
 TVwTZHYTVzNE1AptR2MfhlP+/p6fe55pgyb3sjsIHnChPRkb/QUGI2b6Z9iXsQtlAFGB
 z/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0NqQa2oz+OEm0tUCJd6PYLvZ84GA9jlZRPrKCiKcYOQ=;
 b=jgJkD3QlnTcHrhu1QDU8KHu3jefZNV1vc6JRS3vRmgt2AFBNVN/uqmOjrRWT8xdxSs
 MWR8V9qDqzMQM2xYruztX8ODsXY3ULioIusxcvhrzUg+tDLcwZ9aiAQmVoZt31K0U5LL
 1PV8zBSK4L9PEwHgdvmAJBaDZ7gha+Y7f4jI/HC29QiSB8VN574IabrQTmdsvHplWsMl
 TSmuCQ/WC1qNXg4q5m12wUhC4hZwcmhLZsY/BIk1yaVoh9ShOMLFsQ1YlvTHEEzbmh/s
 MxXX+dEtIR75CvnldDGcGOj6lfkb4Wb+BGpQapZ0VG0RjHPB8QjdQ4cgHYZHW/5vEq1g
 4LNg==
X-Gm-Message-State: AOAM5333+HEZBy/Yq4cJxbOJd0fsezazTGn24Hp6bm+QXYeByc1iTBrq
 gx4/vdY/pwy3Qb/pW0aOSl7kWLgwFODEGTIAAEBXA8AuaNM0Rw==
X-Google-Smtp-Source: ABdhPJxN0uVnTlXWC7QPjFDjGZ7Yzlaj9nMd334+2LvHzxV5Scx9wB/ItuGf90DGRUHHq6hZiJOvATImrHjgNMiBJwY=
X-Received: by 2002:a92:cd43:: with SMTP id v3mr103823ilq.11.1619041884858;
 Wed, 21 Apr 2021 14:51:24 -0700 (PDT)
MIME-Version: 1.0
References: <CADVsX8-pPS6F22WUt_6NRk1raSQ6pr0M6vZfz0SKCH0zvwoU2g@mail.gmail.com>
In-Reply-To: <CADVsX8-pPS6F22WUt_6NRk1raSQ6pr0M6vZfz0SKCH0zvwoU2g@mail.gmail.com>
From: Anton Kachalov <rnouse@google.com>
Date: Wed, 21 Apr 2021 23:51:14 +0200
Message-ID: <CADVsX88qTL7Tm_cugrSPz26OMVyAUETvvrN1dO5jhKanWhYGwg@mail.gmail.com>
Subject: Re: OS-level privilege separation work
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Cc: Brandon Kim <brandonkim@google.com>, Ed Tanous <edtanous@google.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Joseph Reynolds <jrey@linux.ibm.com>, Andrew Geissler <geissonator@yahoo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Please, help on reviewing the following changes:

1. https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/41834
  depends on:
     - https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-logging/+/41835
2. https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/40359
  depends on:
     - https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-hwmon/+/40277
     - https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-hwmon/+/40214
3. https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/41432
4. https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/41471
5. https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/41430
  depends on:
     - https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-certificate-manager/+/41166


Unifying certs paths for nslcd / phosphor-user-manager:
 - https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/42517
 - https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-certificate-manager/+/42513
 - https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-user-manager/+/41429

On Mon, 5 Apr 2021 at 17:48, Anton Kachalov <rnouse@google.com> wrote:
>
> Follow-up after last week's Security Working group meeting.
>
> The idea is that changes' reviews might be slowed down because the
> changes don't have instant impact and can not be tested "here and
> now".
>
> A while ago there was a discussion in Discord:
>
> https://discord.com/channels/775381525260664832/775694761775464468/803832183260184576
>
> > Brad Bishop:
> > A couple reasons I had for putting the systemd units and udev rules in the application repositories were:
> > 1 - I looked at a couple other ubiquitous projects and that is what they were doing
> > 2 - putting them in bitbake makes it easy for everyone to do one-off hacks in their specific machine layer, so was trying to discourage that a bit.
>
> That encourages to move systemd unit files & other configs (e.g.
> busconfig ACLs) into individual repos whenever possible.
>
> We have to modify individual repos three times:
> 1. Refactor openbmc meta & individual repo to move configs as per
> above suggestion.
> 2. Change service one by one to run services as non-root that implies
> intermediate busconfig ACLs change to include both: root and non-root
> ACLs.
> 3. Once we have all applicable services run as non-root, drop
> root-related ACLs from the configs.
>
> First step affects both openbmc meta and individual repo. The change
> will be complex because of refactoring and introducing new features at
> the same time. Changes to individual repo, once merged, will block
> other changes for this repo until openbmc's meta-related change is
> merged due to incompatibility between individual repo head and current
> openbmc meta.
>
> To reduce complexity and speedup review process for the busconfig ACLs
> introduction I would like to suggest to proceed with one bigger change
> to openbmc meta that doesn't refactor how configs are being supplied,
> keeping the changes to several services in top-level meta simple &
> similar, easy to review. This approach also will have instant impact:
> once merged we will have enforced ACLs for D-Bus.
>
> Roughly the change will looks like this (it's a bit outdated):
>
>    https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/37844
>
> The final change would exclude refactoring for systemd to make changes
> scoped & simplified. I've checked those changes on a number of targets
> that can be run under QEMU.
>
> Beforehand we have to review the following changes:
>
>  - certificate-manager:
>    https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/41430
>    https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-certificate-manager/+/41166/
>    https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-user-manager/+/41429
>
>  - phosphor-logging:
>    https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-logging/+/41835
>    https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/41834
>
>  - phosphor-hwmon:
>    https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-hwmon/+/40277
>    https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-hwmon/+/40214
>    https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/40359
>
> To move towards OS-level privilege separation we need to review this
> blocking changes:
>
>    https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/36965
>    https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/41432
>    https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/41471
