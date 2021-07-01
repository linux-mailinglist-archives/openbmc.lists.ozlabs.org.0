Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 784D33B8D3A
	for <lists+openbmc@lfdr.de>; Thu,  1 Jul 2021 06:52:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFm6G2V0Lz309G
	for <lists+openbmc@lfdr.de>; Thu,  1 Jul 2021 14:52:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=LOzGuoG/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72e;
 helo=mail-qk1-x72e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=LOzGuoG/; dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFm5z61tYz2xjY
 for <openbmc@lists.ozlabs.org>; Thu,  1 Jul 2021 14:52:05 +1000 (AEST)
Received: by mail-qk1-x72e.google.com with SMTP id j184so4857216qkd.6
 for <openbmc@lists.ozlabs.org>; Wed, 30 Jun 2021 21:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FrORV5/FYPNvLoxTExoagky5N5nsduK4UOJwRVHZTyM=;
 b=LOzGuoG/f7iYmmV6DDmKvRIJgbLsLTksZSAhulpINqOESe6YDHifHhew98tkKvFOiQ
 C8Rm0CttZCbFDxVwKLLMVqy/EqX4qLJKr/rWALbGOv3dXZaF64gd+iXaUvzsf656jwel
 DDos2LxgRHiCck94eizoI49V4uhqqBYaiBx40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FrORV5/FYPNvLoxTExoagky5N5nsduK4UOJwRVHZTyM=;
 b=sMfG/pbwCYqwTYyNGBx+catIQA1U+bXyG06VEJ52LLlGf/vqc0AT+kgMbuIvLZUfB3
 BqUDzz9cJ/CQNsUmQ3t0HgxoFab3h7N3XfBcmjt5sJgiVpIsCLnocCZTdzbgf9DZm0bj
 cgG1rZStotgZ6Ty80tfjrMOhhW5X1rlNF4nBQ602FdPhUXzSYULxCDDqVnMr8nPupEAW
 +B3HkGZJqOXsPzvXrNpcsy7fAmXPhsh9YWnPZwI6DLP+O6W0QYiTB6jIOwnG9fDJU+Pw
 v7u9IWN2YmEhYom+wZYkelpBffgM4n/rkjOuRF9XTKpBI4UO/CmZD5QIchlbSbQvycQT
 3JEw==
X-Gm-Message-State: AOAM532oMxpIlW2CtgryLsNWF1AC/sKxR1FL8c5RgjjyjM6zaJnNQoTu
 WpMqh5zY9GL3aweIQ2Zspj2EhLeHfv3Q71Yya74=
X-Google-Smtp-Source: ABdhPJyozJegBSXcusA+5J+DoL76RxVJ/abAgxOI3r4cBMIpmRo6YjF+7hcQ9NuQ5Uy7NrjNFSeyfPlMuBmfBZBxRMY=
X-Received: by 2002:a37:6645:: with SMTP id a66mr39267091qkc.273.1625115122227; 
 Wed, 30 Jun 2021 21:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210701024206.GH8018@packtop>
In-Reply-To: <20210701024206.GH8018@packtop>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 1 Jul 2021 04:51:49 +0000
Message-ID: <CACPK8Xfa6_LoMi23F5YRSvdcD8fF6GA=WQkDCw9Z-Jf8EkoTWg@mail.gmail.com>
Subject: Re: U-boot version selection
To: Zev Weiss <zweiss@equinix.com>,
 =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

egacOn Thu, 1 Jul 2021 at 02:48, Zev Weiss <zweiss@equinix.com> wrote:
>
> Hi,
>
> I recently found myself needing to make some tweaks to u-boot to
> accommodate a new board I'm targeting with a larger flash part, but in
> going to do so I remembered that I'm currently using u-boot v2016.7,
> whereas new development is strongly encouraged to use v2019.04 [1].
>
> As far as I know that happened entirely by default (i.e. I didn't go out
> of my way to use the older version), so I hunted around a bit for how to
> override that to use the newer one, but wasn't able to find anything
> obvious.  What's the recommended way to go about switching that for my
> board?

You can see Lei's change to use the newer tree here:

 https://github.com/openbmc/openbmc/commit/1aa72efd0f54

UBOOT_DEVICETREE = "ast2500-evb"
UBOOT_MACHINE = "evb-ast2500_defconfig"

PREFERRED_PROVIDER_u-boot = "u-boot-aspeed-sdk"
PREFERRED_PROVIDER_u-boot-fw-utils = "u-boot-fw-utils-aspeed-sdk"
PREFERRED_PROVIDER_virtual/bootloader = "u-boot-aspeed-sdk"

The important change is to point it to a valid defconfig for the new
tree, to specify the u-boot device tree to use, and to change some
yocto PROVIDER variables to use the "u-boot-aspeed-sdk" variant.

Currently there's only one machine defined in the u-boot tree, for the
evb. We will need a new machine defined if your system uses NCSI for
networking.

We could use a common configuration for NCSI and non-NCSI (direct
attached PHY) systems, except for one bug. The NCSI layer as it is
currently implemented will cause the networking layer to attempt to
initalise NCSI, even if your device tree says you have no NCSI
devices. We will need to make a code change to fix this.

The offending code snippet is in net/net.c:

+       if (protocol != NCSI && !ncsi_active()) {
+               printf("%s: configuring NCSI first\n", __func__);
+               if (net_loop(NCSI) < 0)
+                       return ret;
+               eth_init_state_only();
+               goto restart;
+       }

The fix would be to add a new test to ncsi_active that returns "true"
if there are no ncsi capable devices in the system.

It would make sense to rename the function too, but the core of the
change is to ensure we don't require ncsi to be active if it's not
being used.

> And do we want to consider changing the default to the newer branch?

Yes! I think this would be a great idea. Ideally we would have people
switch over to using the new tree, but this is unlikely to happen.
Best would be to make it the default so new machines opt for the newer
tree, and legacy machines can use the outdated tree.

This would require us to add something like the following to all of
the legacy aspeed machines:

PREFERRED_PROVIDER_u-boot = "u-boot-aspeed"
PREFERRED_PROVIDER_u-boot-fw-utils = "u-boot-fw-utils-aspeed"
PREFERRED_PROVIDER_virtual/bootloader = "u-boot-aspeed"

Once that is done, we could change the following in meta-aspeed:

--- a/meta-aspeed/conf/machine/include/aspeed.inc
+++ b/meta-aspeed/conf/machine/include/aspeed.inc
@@ -1,7 +1,7 @@
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-aspeed"
-PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot-aspeed"
-PREFERRED_PROVIDER_u-boot ?= "u-boot-aspeed"
-PREFERRED_PROVIDER_u-boot-fw-utils ?= "u-boot-fw-utils-aspeed"
+PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot-aspeed-sdk"
+PREFERRED_PROVIDER_u-boot ?= "u-boot-aspeed-sdk"
+PREFERRED_PROVIDER_u-boot-fw-utils ?= "u-boot-fw-utils-aspeed-sdk"
