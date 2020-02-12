Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A2E159F27
	for <lists+openbmc@lfdr.de>; Wed, 12 Feb 2020 03:39:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HP3V65xZzDqBX
	for <lists+openbmc@lfdr.de>; Wed, 12 Feb 2020 13:39:02 +1100 (AEDT)
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
 header.s=20161025 header.b=LqDTnVdw; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HP2H6tp3zDqKZ;
 Wed, 12 Feb 2020 13:37:57 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id 12so200064pjb.5;
 Tue, 11 Feb 2020 18:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vv3NHPZnBve5XiluETZotYu+d3bqwg0qJCx+3uhyaM4=;
 b=LqDTnVdwykUbgj17vRiSu0wFe6uQuLuoNTYxnt1hV1zA7zQJZ3Bu1dEQt4RI34I1TS
 Or2/lgMlxpcFQzXW463ugd85BrgR6lgMSKBiGhOmWpfD0H1f7PcEbVJhflRk3lwMfWo3
 x6wskEcFMMckElySxG0JLuRGy9KCJ0rFQPawyC295ueBCdHjobHOguzNBOOR7WlBwRaR
 OY5syFDOcpl+E49w1qaBDG105le2WjLWE+eQ6YJg8AubgePkguj0UTz+MB/RBxroaW0n
 lx2EFjfL5QjrX69I8wUKWAO2/nYbY5A1X27OhsVEa2/65vOy8MgC2ffxYouJxHKW6a/V
 4QZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vv3NHPZnBve5XiluETZotYu+d3bqwg0qJCx+3uhyaM4=;
 b=bGc5abgxiG7xOmz8krzhJcSs38MapOUCtt5EzT4t1ol7AaP9EyVFm9oHSdm7p0955R
 cfGTCMwBHNingKK/GKSi6ec8RakwHxmFVNrcwHvXx+4O9dQpiLni+sbGtgQtWzaXYqXq
 kZNSjPKP2RcjLGJ2YPn9peJJRwM1LqANghMfM8wJlCvEtrcrzZT+VJFBkERR1iIQpxwK
 VNS3OR1gAOATn1Cf1cjmdNYOuUdk1+B7XwY+V9lCfBy++mLhV+YmBvHB4Gv6uUHGjSrM
 138MSjIpF5On60+zocwt032Z6Zy7R7seDfMD9ktzIaA3hwIXHbGNLUzPtG2mz/ogCw1z
 5Hvg==
X-Gm-Message-State: APjAAAXnkTmY8/JIYWd/xK71gMwZ+5RYPAkjCTIyce9hnZCEJEt7h1XU
 QYGXyDqeqkk9aP+xQuKG/rw=
X-Google-Smtp-Source: APXvYqyuDguANzB58wFOK/4Z7FCp2UtZ0LngNySWG7JX3V31NtSorTHf3Kf9HvxxX7mtQN6BVwdbmw==
X-Received: by 2002:a17:90a:c388:: with SMTP id
 h8mr6993554pjt.83.1581475075299; 
 Tue, 11 Feb 2020 18:37:55 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91 ([2620:10d:c090:200::80a4])
 by smtp.gmail.com with ESMTPSA id d15sm5740978pgn.6.2020.02.11.18.37.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 11 Feb 2020 18:37:54 -0800 (PST)
Date: Tue, 11 Feb 2020 18:37:47 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH 1/3] usb: gadget: aspeed: read vhub config from
 of_device_id
Message-ID: <20200212023746.GA9834@taoren-ubuntu-R90MNF91>
References: <20200131222157.20849-1-rentao.bupt@gmail.com>
 <20200131222157.20849-2-rentao.bupt@gmail.com>
 <CACPK8Xe0b+zVNqf8v5YXOLkzqDeb4JHqec-bqFpaVFGTwHThhA@mail.gmail.com>
 <386e905fb705266efcac0c1b3a10053889c7fead.camel@kernel.crashing.org>
 <20200210190744.GA5346@taoren-ubuntu-R90MNF91>
 <746b08aabf7ea976a382ad2ca30fa10a095e7ed8.camel@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <746b08aabf7ea976a382ad2ca30fa10a095e7ed8.camel@kernel.crashing.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-usb@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Colin Ian King <colin.king@canonical.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Feb 11, 2020 at 09:50:42AM +0100, Benjamin Herrenschmidt wrote:
> On Mon, 2020-02-10 at 11:07 -0800, Tao Ren wrote:
> > > > This looks generally okay. We should wait for Ben's ack before
> > > > applying.
> > > 
> > > Shouldn't we instead have DT fields indicating those values ?
> > 
> > May I ask why we prefer adding dt fields (such as "aspeed,vhub-max-ports"
> > and "aspeed,vhub-max-endpoints") instead of assigning these values based
> > on aspeed family? For example, is it to allow users to set a smaller
> > number of ports/endpoints?
> 
> It's not a strong drive but it makes it more convenient to add support
> to newer revisions if the only differences are those numbers.

Got it. Thanks for the clarify. Will send out v2 patches after more
testing.

> > 
> > > Also we should add a DT representation for the various ID/strings of
> > > the hub itself so manufacturers can customize them.
> > 
> > Sure. I will add DT nodes for vendor/product/device IDs/strings. As it's
> > not directly related to ast2600-support, shall I handle it in a separate
> > patch? Or I can include the patch in this patch series?
> 
> Separate. Thanks !

Will take care of the change once this patch series is accepted.


Cheers,

Tao
> 
> Cheers,
> Ben.
> 
> 
