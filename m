Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C88247E1E
	for <lists+openbmc@lfdr.de>; Tue, 18 Aug 2020 07:54:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BW0V561CMzDqRZ
	for <lists+openbmc@lfdr.de>; Tue, 18 Aug 2020 15:54:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::641;
 helo=mail-ej1-x641.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=j73Rv9jg; dkim-atps=neutral
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BW0TN3WVRzDqVc
 for <openbmc@lists.ozlabs.org>; Tue, 18 Aug 2020 15:53:44 +1000 (AEST)
Received: by mail-ej1-x641.google.com with SMTP id m22so20565757eje.10
 for <openbmc@lists.ozlabs.org>; Mon, 17 Aug 2020 22:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=fJ4d4BTKyLS5krPoXlvz63f9813L/NRTfNu1wjw54ig=;
 b=j73Rv9jgnTcenrheJ8pMuSrh+ETnl8+YTkIiyfy5vzuPMrdc5RRK3S3k/JDBQN1LVN
 McDwcJ4xc4G/j3rJSnHm4jTqdZzPHoC5cJBh4yl1Ihe0qtmZPQd8mpS20w1LGcqlYQgx
 4eAD5YxtsHdQbkXsZ5tlHhBnTj6eGBs1vaem0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=fJ4d4BTKyLS5krPoXlvz63f9813L/NRTfNu1wjw54ig=;
 b=YLfWb7DfgLFayUy0/CtVKDFaXQw+EVur7+HslghHu1YdJRTmP7td39py4An9bcdahT
 n8yPCkzpClDg50AWCJU12zUuRSBrhLPOCqg3iFgSA+02jl1RdLG6tJjWqrA+OVy03sbn
 6+G6d9hjUeBNWHB89lHgfF/wACtIkiFKJYgWxJ+LJvCqCl/0VyGIP8UUWUeAYhkeion+
 nU5Ag98pYCGNJWtqOcrFMEKSdOt2wiWIiz33//ykcnoe2njENkixOSmaAMc76kxry2hf
 qy4BOYGOm4VrPXo9hL+UA3DjEJ+0YNx02DAYgYBZmmIizemtJQQYg5OEI71vbFliKZG5
 YK9w==
X-Gm-Message-State: AOAM531lfswtFi9FTI0nSP2VpUBLFYi0o177Be9DZId7e9Nzk2Nt/InA
 9flPXGdcxDCmjE42dzUeAfs6FjyUEj13LbsOY5CmFHxImqElgg==
X-Google-Smtp-Source: ABdhPJzMLbGTKivFwTQhED1sVx6RjleMFIObW2WPLavm0SCl56F9b5IX7dXb0oAyDGEc/7Alw0Ac6GSyCcekBPyMG/Y=
X-Received: by 2002:a17:906:c143:: with SMTP id
 dp3mr18136570ejc.504.1597730018577; 
 Mon, 17 Aug 2020 22:53:38 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XeSyNyRnTJHw_1dSOk13rgQQ0SVY+STLbipeW=wJHw89w@mail.gmail.com>
In-Reply-To: <CACPK8XeSyNyRnTJHw_1dSOk13rgQQ0SVY+STLbipeW=wJHw89w@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 18 Aug 2020 05:53:26 +0000
Message-ID: <CACPK8XctYy-pwKzNTfbcXDJURf1=VWtWtDd+88w7+3ht+7VOrQ@mail.gmail.com>
Subject: Re: Kernel updated to Linux v5.8
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

On Tue, 18 Aug 2020 at 05:43, Joel Stanley <joel@jms.id.au> wrote:
>
> The openbmc kernel has moved to a 5.8 based tree for Aspeed machines.

in order to track regressions with the upstream kernel, I am using
Travis CI to do daily builds of the branches we care about:

https://travis-ci.com/github/shenki/continuous-integration

This will build the dev-5.8, dev-5.4, linux-next and mainline kernel
tree for ast2400, ast2500/ast2600, and multiplatform configurations
for armv5 and armv7. It then boots those kernels on qemu, emulating
palmetto (ast2400), romulus (ast2500) and the ast2600 evb.

A future enhancement would be to put test code in the filesystem to
test for cases more complex than build or boot failures.

None of this uses openbmc userspace at this stage. If someone were to
submit a pull request I would happily review it.

Cheers,

Joel
