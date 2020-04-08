Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 062431A1B96
	for <lists+openbmc@lfdr.de>; Wed,  8 Apr 2020 07:41:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xtS90f3FzDqsb
	for <lists+openbmc@lfdr.de>; Wed,  8 Apr 2020 15:41:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lLoEa84O; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xtR61ggTzDqZ1;
 Wed,  8 Apr 2020 15:40:34 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id k18so2125115pll.6;
 Tue, 07 Apr 2020 22:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=g1prhrjKxEZds2TfTdybytV1XN9ZFJTSPhvDxSwKWbE=;
 b=lLoEa84OH4TcHPRT1UimZUdQLc7+R6JFgPXWoCIIRTR2AyiT/OPSoK3ieDWDqzM8qx
 lyCsqh2n5Zq2XflpC4bOHZ8iVDQrslNa1+/DzvMLAIWXtGMWlgcDE9ziykfEik9ddmBi
 tyxXTYOkvFRPwBCL9z5pyp0iPfR1I3wurB47f21uuqJtHxLVwahEtgitfWWN7flMDjOZ
 Safx8k04FtvoZcMhRSmyzx7z3Cwfou//CwYoXYZ07Wi8fW04reFQgw8Y0kGd+M/oglj0
 CPxccDmDXnLlKNcHfvjbisMg0rXq9cG1uOMWcwhtmdlAZqu3MIuoskOTHuqaUL6yiZXb
 664Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=g1prhrjKxEZds2TfTdybytV1XN9ZFJTSPhvDxSwKWbE=;
 b=bxbL3s18ErLcMzHmYWlfTZM3uzVguCugQ6SEUXeCE+DsDyWrAK1Yu4TfAgheRkZj9/
 0ucZpvVrk6J8W/TC0Jj1GbUiCHAZPElYoR3le1jnBEZ+7C/ADThyvpkuharzpE40SIG6
 PfvbbjkDNVQQf5jYcYRJ6D7pgtZ2u4oatuMZsbJBH9oU7PfVkUFuEiuVqQjRW1pJBwio
 xq8mlToTG2RCId1/qvdKZegFVWYqCd8pjaUs8JtuRf6LR+2xeN42BMXhkU0tdZH+/wj7
 6KYgPLU/sOYPfoSVDoVElp5RbkDFyeqjN/HrePTrSTZZOXGAbtc8nXEpURmMPXZLuGC3
 IWfQ==
X-Gm-Message-State: AGi0PuaVoCvbqMpfVi9t7qGukO39STAtuJX57JKmg8f9J6DVg3XPd/CN
 Qi/BQzkZapZysRLROe3uNiY=
X-Google-Smtp-Source: APiQypJp2wIHnlyEMM+6phi0GLCRMB+cJZqLMeiHhoqYBQwNHDoMx8FFoIJI/HdUYAVagNG142s6pA==
X-Received: by 2002:a17:902:a5c6:: with SMTP id
 t6mr5265576plq.319.1586324430524; 
 Tue, 07 Apr 2020 22:40:30 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net.
 [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id d3sm15544077pfq.126.2020.04.07.22.40.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 Apr 2020 22:40:30 -0700 (PDT)
Date: Tue, 7 Apr 2020 22:40:23 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH v3] usb: gadget: aspeed: improve vhub port irq handling
Message-ID: <20200408054022.GA12469@taoren-ubuntu-R90MNF91>
References: <20200315191430.12379-1-rentao.bupt@gmail.com>
 <20200401215826.GA8248@taoren-ubuntu-R90MNF91>
 <512d625e45ea953d722bb7ea73c3619730312284.camel@kernel.crashing.org>
 <20200403064826.GA10866@taoren-ubuntu-R90MNF91>
 <20200407060242.GA15050@taoren-ubuntu-R90MNF91>
 <93ae433317a82de86ff5e9c8485563b78656b615.camel@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93ae433317a82de86ff5e9c8485563b78656b615.camel@kernel.crashing.org>
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
Cc: Felipe Balbi <balbi@kernel.org>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, taoren@fb.com,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Apr 08, 2020 at 09:36:16AM +1000, Benjamin Herrenschmidt wrote:
> On Mon, 2020-04-06 at 23:02 -0700, Tao Ren wrote:
> > I ran some testing on my ast2400 and ast2500 BMC and looks like the
> > for() loop runs faster than for_each_set_bit_from() loop in my
> > environment. I'm not sure if something needs to be revised in my test
> > code, but please kindly share your suggestions:
> > 
> > I use get_cycles() to calculate execution time of 2 different loops, and
> > ast_vhub_dev_irq() is replaced with barrier() to avoid "noise"; below
> > are the results:
> > 
> >   - when downstream port number is 5 and only 1 irq bit is set, it takes
> >     ~30 cycles to finish for_each_set_bit() loop, and 20-25 cycles to
> >     finish the for() loop.
> > 
> >   - if downstream port number is 5 and all 5 bits are set, then
> >     for_each_set_bit() loop takes ~50 cycles and for() loop takes ~25
> >     cycles.
> > 
> >   - when I increase downsteam port number to 16 and set 1 irq bit, the
> >     for_each_set_bit() loop takes ~30 cycles and for() loop takes 25
> >     cycles. It's a little surprise to me because I thought for() loop
> >     would cost 60+ cycles (3 times of the value when port number is 5).
> > 
> >   - if downstream port number is 16 and all irq status bits are set,
> >     then for_each_set_bit() loop takes 60-70 cycles and for() loop takes
> >     30+ cycles.
> 
> I suspect the CPU doesn't have an efficient find-zero-bit primitive,
> check the generated asm. In that case I would go back to the simple for
> loop.
> 
> Cheers,
> Ben.

_find_next_bit_le() function is defined in arch/arm/lib/findbit.S. I'm
looking at the code: will run more tests and send out patch v4 with
simple for loop later.


Cheers,

Tao
