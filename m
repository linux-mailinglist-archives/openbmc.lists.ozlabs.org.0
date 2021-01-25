Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE931302D9F
	for <lists+openbmc@lfdr.de>; Mon, 25 Jan 2021 22:28:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPjdv2ZbczDqwW
	for <lists+openbmc@lfdr.de>; Tue, 26 Jan 2021 08:28:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=BJ9hMNRA; dkim-atps=neutral
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPjbs4Jr0zDqwY
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jan 2021 08:26:32 +1100 (AEDT)
Received: by mail-yb1-xb31.google.com with SMTP id e67so14718797ybc.12
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jan 2021 13:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=52869IvWmk4k9Vr3QLXfhiF94xe/z4eR+405Vk5eYd8=;
 b=BJ9hMNRAwq+CcdKGIn8TVk0IcGiGIGgSldgCkoX009VCWRYjQhnS+XWkmu0hMMlb7O
 0TQaWfmLvXl08Mkf88fWJx+ksVibGh6hX80DkpESQgGRyO8063IDUsJiAEmo2tZ5b1rv
 bpo9/NYx3wTOWagKncxA9sSIYrhjgoYA565ajHQsgw4dLZ/81KJsHw0vWctO7/1Cvy2L
 MYeETQc3l6NJuM0LB6EGQNPPCNYa6D2jDKbhFhtyH/wX8la2WAFcZv1nsdJUF0ADuZ1v
 0i+iivmlq+OhSd+HOr3GXT1BNqdsz3ACMnvaT5IjdW3LDj4pb4cIHW1gSpj4+GkbCu8A
 fPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=52869IvWmk4k9Vr3QLXfhiF94xe/z4eR+405Vk5eYd8=;
 b=nEIs2PCBGMQxUdQfyXc2cGVzjgbO44Msx6m63z/FjKG/SKFE9qeojqyaHml4Obslgz
 DWNSPut+EWMYNYWMBggN6mpLRBVpqHpEREP/bR9SANG6QjA0WQCxoH7/neizfULcXHI4
 SJxhn9b5Ni4hAeFPx5W1chxCw6LwWJYX+HW4yX0nQTkQymkxIy4dg1k3ih5Rnp1as//9
 FCbV3T5w+OGYEag/hX4AdFINA9gToMiYGNSZqaeoFjlnC3z9Z/AjcX14sJmA7mtRD/Dn
 fmJ7LRBKnt0RWHV9Hk3VQhcr7pfcVqxU+ozaOHBghUE+vmxLIrirEIDHwb4Dd74cAtQ7
 9IDw==
X-Gm-Message-State: AOAM530Rw7VGoov+1EKJ1gBzgN1Uo/lYv3mp7SsEQg5/wsmBA1TeauL6
 rym6+tHqIg9EBg7bhOlCKMct+a1vnMl3s9ZjyJzz0qCUqkjgjw==
X-Google-Smtp-Source: ABdhPJyFXRwMjfLuwDZzlvXio7gDg9b+p40Bn2HWm+Feq5GT4IvIy3sJkXQEs945zYTKGhXukc/kMJbIqwGaIp2BoTk=
X-Received: by 2002:a25:c407:: with SMTP id u7mr3650151ybf.449.1611609988084; 
 Mon, 25 Jan 2021 13:26:28 -0800 (PST)
MIME-Version: 1.0
References: <CACWQX821ADQCrekLj_bGAu=1SSLCv5pTee7jaoVo2Zs6havgnA@mail.gmail.com>
In-Reply-To: <CACWQX821ADQCrekLj_bGAu=1SSLCv5pTee7jaoVo2Zs6havgnA@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 25 Jan 2021 13:26:17 -0800
Message-ID: <CACWQX8236dghCCdnDAdnij0Di_GF7DsmAO_xEtWmk6ckKDocYg@mail.gmail.com>
Subject: Re: Gerrit owners plugin coming
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jan 20, 2021 at 11:23 AM Ed Tanous <ed@tanous.net> wrote:
>
> Over the last few weeks, we've been slowly getting the gerrit owners
> plugin deployed and tested, and got the OWNERS files merged into their
> respective meta layers.

These changes are live.  Any commits to the individual meta layers can
now be submitted directly to openbmc/openbmc now.  If there's anything
broken about the new workflow, or anything unexpected happens in your
workflow, please let me know on discord and we'll try to get it
resolved.

I forgot to mention one important improvement:  Listed owners will now
get added to code reviews automatically if any files are changed in
their owned directories, without having to take any action, via the
gerrit-owners-autoassign plugin that we added.  This is also a very
nice quality of life improvement when opening reviews, and something
that tends to trip up developers new to the project when they are
looking for code reviewers.


>
> This has been leading up to a process change that has been on the
> roadmap for some time now.  Once the plugin is enabled (and some other
> housekeeping is done) meta-layer changes will be able to be submitted
> to the normal openbmc/openbmc repository, simplifying one portion of
> our review/merge process.  Submitting to openbmc/openbmc is something
> most newcomers to the project expect, and we've had numerous gerrit
> reviews submitted to the wrong repo in error.  Hopefully, this change
> makes meta-layer changes much more normalized.
>
> Once this goes in, this means that functionally:
> 1. We no longer have a bottleneck on creating new meta-layers,
> renaming meta layers, or moving files between meta layers.  New meta
> layers can be submitted through gerrit similar to any other patchset,
> and will be reviewed with the same process we already have for any
> other type of code, and don't require requesting a new repo in
> advance.
> 2. Changes that require mods to all meta layers (yocto compat fields
> for example) can be done in a single commit, across all systems at
> once, reducing the possibility of breaking builds for meta-layer
> combinations that aren't covered by CI.
> 3. No more waiting for your meta-X changes to get merged into
> mainline, which should reduce the amount of time between recipe bumps
> and the main build reflecting the changes.


>
> Ownership of the various meta-layer folders is still enforced by
> gerrit through the owners plugin using the OWNERS files.  Today, they
> contain the same mapping as the content in the MAINTAINERS files, so
> no files in the repo actually change ownership.
>
> The final review to add the OWNERS file to the root of the repo is here:
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/39379
> And has already had some discussion and looks to be good to go.
> Assuming there's no other objections, I'd like to get this change made
> on this coming Sunday.
>
> Overall, I hope that this will be a great improvement in the overall
> structure and usability of openbmc, and remove at least one stumbling
> block people new to the project tend to hit.
>
> -Ed
