Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA353179FCC
	for <lists+openbmc@lfdr.de>; Thu,  5 Mar 2020 07:10:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Y0jq692FzDqmq
	for <lists+openbmc@lfdr.de>; Thu,  5 Mar 2020 17:10:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::231;
 helo=mail-lj1-x231.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WkX3uerd; dkim-atps=neutral
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Y0hH3nz7zDqlS
 for <openbmc@lists.ozlabs.org>; Thu,  5 Mar 2020 17:09:35 +1100 (AEDT)
Received: by mail-lj1-x231.google.com with SMTP id 195so4704726ljf.3
 for <openbmc@lists.ozlabs.org>; Wed, 04 Mar 2020 22:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3VubHKKALFyDMO7pVl9HVZbkUeM5ggD9La15eBMUepY=;
 b=WkX3uerd79cr1IALYpgsUjRBjxx08yZ5kDnGwDJ/X1Ys+2LFHvJwFgMkoEFVTmdfeE
 IcXx4ekM6RHC+arc1JpY6rqEzR0jn0bQn72nEcGK4ve/a7VEYEyzOJGktFTXHu4bj9QZ
 YmjIyhBp7h+WqS5vJZZohCMzWJFJu3Yyj0Fb0BGi7peB5cPPUtiB3rZX0szou/0jQzzu
 gQpahjE4TrLHrPSAoOQjhB9upOYSSm+sUjTaTzpiUsGp+0UQLTDrsu7git8iQooVX9LD
 vN1+y14rhUig0bnOSwzgcNN6AjeIT1++TeuYe1h06KCrqwHePoealFSG2p+T3Zn4pDhA
 PLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3VubHKKALFyDMO7pVl9HVZbkUeM5ggD9La15eBMUepY=;
 b=cucBobyjzN2zoPGZjGCfqzgIrjh3wrUHO1i81OC2gbcijVo7h+rv/nrkkQDg47ibEi
 9eJ+iNNgjNDhwxqlHkHf1PgpFYGpc4KrMvi6Y/u6TR+xNC4BQCzbro5bH+W4rTRMMIPV
 6zLxp6ze1OIhY9XYb0bBuigvv9qwRp6Tq3v8zZIoPNBY2Mtw56bqYPSBtVUv+7Z6cf8r
 P5H+mz3QH4het8KV709jQCNoxtMOvjSzLZEK2RBWmgTwkA2jKhVwi7duaIjeja/trbci
 I1+D3cHahy0WNz+p5TGqNlIKAiEZ5C1PP59D+d3eICzbl4b2TgWigzZQCp+hph+0fCuN
 +86A==
X-Gm-Message-State: ANhLgQ1ArV6cYLdmdCdZYZecnZ7GrvprZ84C/xBs/56VgW3nxlSmzFb1
 MU6aKIJkvuniQ/WpS17o6gf2MML5jObrZF6Ux99HVGGb1ww=
X-Google-Smtp-Source: ADFU+vtr8xwk0ue/TCfcHlhDdDwpr6R0anFwUuyxooiSa24Ak8jloNlX9T3JUFJOLRYAtQ5NN0fFtcX35aIifV13dho=
X-Received: by 2002:a05:651c:445:: with SMTP id
 g5mr974841ljg.149.1583388570424; 
 Wed, 04 Mar 2020 22:09:30 -0800 (PST)
MIME-Version: 1.0
References: <cedd60034505b933ee70a43e4d361720bca9b803.camel@fuzziesquirrel.com>
 <20200204140753.GD92818@patrickw3-mbp.dhcp.thefacebook.com>
 <20200226220525.GP67957@patrickw3-mbp.dhcp.thefacebook.com>
In-Reply-To: <20200226220525.GP67957@patrickw3-mbp.dhcp.thefacebook.com>
From: Lei YU <mine260309@gmail.com>
Date: Thu, 5 Mar 2020 14:09:18 +0800
Message-ID: <CAARXrtndeJAVXexso+CGpPvofcMZUEFVT97mnT+ZKYqD8gOp2g@mail.gmail.com>
Subject: Re: python 2 deprecation - assistance required
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> * The recipe changes at 29692 fails to build the complete
>   openbmc/openbmc due to problems in other recipes.  Many recipes
>   assumed they were getting their "python requirements" indirectly from
>   sdbusplus (which is bad).  When I change sdbusplus to use python3, but
>   those recipes still expect python2 (and modules) they fail to build.
>
>   I ran with 'bitbake obmc-phosphor-image -k' and find the following
>   failures:
>
>     meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-host_git.bb:do_compile
>     meta-phosphor/recipes-phosphor/power/phosphor-power_git.bb:do_compile
>     meta-phosphor/recipes-phosphor/inventory/phosphor-inventory-manager_git.bb:do_compile
>     meta-phosphor/recipes-phosphor/dump/phosphor-debug-collector_git.bb:do_compile
>     meta-phosphor/recipes-phosphor/dbus/phosphor-dbus-monitor_git.bb:do_compile
>     meta-openpower/recipes-phosphor/occ/openpower-occ-control_git.bb:do_compile
>     meta-phosphor/recipes-phosphor/leds/phosphor-led-manager_git.bb:do_compile
>
>   I'm not going to have time to fix all of these myself, so it would be
>   nice if the maintainers of each of these repositories would fix up
>   their dependencies in the Yocto recipe.
>
>   Often this means something like DEPENDS += "python-native python-yaml"

For `phosphor-power` it's fixed by
https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/30023
