Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB44B26F4F5
	for <lists+openbmc@lfdr.de>; Fri, 18 Sep 2020 06:20:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bt0ww3MQGzDqkJ
	for <lists+openbmc@lfdr.de>; Fri, 18 Sep 2020 14:20:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jmFM5Hk0; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bt0w13vF1zDqkC;
 Fri, 18 Sep 2020 14:19:11 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id fa1so2469632pjb.0;
 Thu, 17 Sep 2020 21:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=uf0XaWxmSBWPs5Ykw52VMS2PajAcQCq1xNqnxZFMyic=;
 b=jmFM5Hk0uI1NV5zSmzm/rM5GMZnWpZNWRRVoGKaPVl9lvOS2eCjrtzS+6z8u19qAgd
 sDTmAtyKcKBy06InOtgbTb4X4PyMhqiMocmFrX0qvXPVrm1krkpyMVj2Rc099XEYRg8a
 8tDLZ4PQsuimizomOQJRZ2C5l4UWsPY35hg3IB5pzLWkR+OXNmwx48yAtPQ1HJa3jURB
 QZJBfzF971iHAG1Y5/v1cd2O3WvfuUzK7qRBVCPlj0aJJpcyj8D7x8hJqdLHOtVy7Ns3
 p2ksQWCSyqxpTv2Emz4KefLL+HH9ZIIr7refP2C/I9oBemQPvmiCj1yskQYAb27T6svY
 E6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uf0XaWxmSBWPs5Ykw52VMS2PajAcQCq1xNqnxZFMyic=;
 b=DeA3sn4l6xl/Xt5o0RWV2g6X2nMOJb30uN4O0zg5FnEvUkZ9xiveZ06AgV9klxPuYp
 D4SDRLgayVkiBVXBUh6brWuCt5LiNwz/5O+VG+vx+10Tx2Xq8/QnqgMpi2l/vf109yyw
 xY6KN50D5GZZ1mKFilV8DwFCsXwFyTliPygX2KGKSyl9AMtegHINiwq7f5ZZy1qOEY6e
 ErZihWNRLeZdN7vM0vKQTsrkA9KGJ6ysQlmElw/tn0NMtWHkFng/wZMIjvjqSG5MTeyv
 9qLWFcMvEyQB6Ecx6caDSqW/TKKhhZ8ITVynJ7HCPj3kb5VrYVf2vlhHA9BIVp3rlnWx
 /iNQ==
X-Gm-Message-State: AOAM5339uNVfwyTz+piCRAUsbuNSM94ZCS9fJmBRldU7R9HqTCoaz020
 olTQvDchIWFHWF/vxuECaofvayA0yT9y7gwS
X-Google-Smtp-Source: ABdhPJyTMd0Gg5Oqyr+rhgTmOWmBD6MN+kyK6wNEcYWw7fpphO5ZfvEVBe4QGl3Mhi+fBlLXTDQBqA==
X-Received: by 2002:a17:902:c40c:b029:d1:9bc8:1624 with SMTP id
 k12-20020a170902c40cb02900d19bc81624mr30237552plk.1.1600402746335; 
 Thu, 17 Sep 2020 21:19:06 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net.
 [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id c24sm1326854pfd.24.2020.09.17.21.19.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Sep 2020 21:19:05 -0700 (PDT)
Date: Thu, 17 Sep 2020 21:18:59 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH] gpio: aspeed: fix ast2600 bank properties
Message-ID: <20200918041858.GA14246@taoren-ubuntu-R90MNF91>
References: <20200916204216.9423-1-rentao.bupt@gmail.com>
 <60f9f14a-c9be-45ac-b3a8-516ab73d9bee@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60f9f14a-c9be-45ac-b3a8-516ab73d9bee@www.fastmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org,
 Tao Ren <taoren@fb.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Sep 17, 2020 at 08:42:27AM +0930, Andrew Jeffery wrote:
> 
> 
> On Thu, 17 Sep 2020, at 06:12, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > GPIO_U is mapped to the least significant byte of input/output mask, and
> > the byte in "output" mask should be 0 because GPIO_U is input only. All
> > the other bits need to be 1 because GPIO_V/W/X support both input and
> > output modes.
> > 
> > Similarly, GPIO_Y/Z are mapped to the 2 least significant bytes, and the
> > according bits need to be 1 because GPIO_Y/Z support both input and
> > output modes.
> > 
> > Fixes: ab4a85534c3e ("gpio: aspeed: Add in ast2600 details to Aspeed driver")
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> 
> Thanks Tao,
> 
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Thanks Andrew for the quick review.

Cheers,

Tao
