Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8591C1476B0
	for <lists+openbmc@lfdr.de>; Fri, 24 Jan 2020 02:25:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483hKZ54z7zDqZX
	for <lists+openbmc@lfdr.de>; Fri, 24 Jan 2020 12:25:38 +1100 (AEDT)
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
 header.s=20161025 header.b=frs7OH+W; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483hJv6FJBzDqDX
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jan 2020 12:25:03 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id d5so296147pjz.5
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jan 2020 17:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QV7gOlg5zKt8K5iiHw+rcJdtgTYuWMnMKpOfuiFoOZk=;
 b=frs7OH+WKyS160tOdBw35x9jBDHLoO2Uh7eRUdhHC+GkA0wnukuwFyx1t+CJSnv7Gv
 Oa0HJpQELa7hGzU6wnXidCsGlfA7HDRj64an9KnmwHhfv0HIm6Bb4IsEwdhwH3itYeOI
 PoGYRunKvAmqjOQ6CZTq4J0EHc9ymWdgflQuUC6tx0maG2pGIkWIFuMSIrRnKBgnIs2B
 9T3VOfd8M5zCwM/aI3RH9jFgVo6Ob//4qQMQmVaxl2ODmQNBaWX4BB+ox8BoGKfoTUNY
 j76/mrPr35DU0ltA7DG2WDJqqUKwPhQPusfUvi0BQQjDuNKqSbkq0vO27vk5wAL6PH3w
 ftGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QV7gOlg5zKt8K5iiHw+rcJdtgTYuWMnMKpOfuiFoOZk=;
 b=CjjJTUVM6CBwXNW+UbaA8NTZ98ajsgUZBNICK9H2rWkdRhl83kBJmbm4VGSBBDAxCu
 YGxsfXsUjkwDqs9XN+z24MrmxNDEbslltv5Afr+R/7VSweLIEZoxcXoSICUOTa+xMzZt
 kfv/tDrsMsOQF/2MbrP18odhwrdnza8atiwpNAWcAzbPj95uEEfrlmQJWIzBwyLYTXxe
 H4k8PcWKABmroHzNc4WF5JHsRiiSLrOMorl3TMixx5WsRmRYTw9n37z9IIOia0flk1Yl
 LlMo0u4U/+gcUdtq8DR7CJXRTCwnSHzz12Md0duJWox+DbN85DENOSHYB5OspkXXplSx
 RrHw==
X-Gm-Message-State: APjAAAWOkIeWUpiuGqGccabgkC4JVqZu27vp3nebBOEehCCNlr1GT54r
 wBHSbvn41uqZ6QTcbIwB27U=
X-Google-Smtp-Source: APXvYqznyrlLEx5eqA12zP9kAcy98VDhee4c96airN1Ys3Ntxu4CzlCkdRS5W8LXaoCpaDC/gAM2iQ==
X-Received: by 2002:a17:90a:d804:: with SMTP id a4mr556053pjv.11.1579829100564; 
 Thu, 23 Jan 2020 17:25:00 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91 (c-24-4-25-55.hsd1.ca.comcast.net.
 [24.4.25.55])
 by smtp.gmail.com with ESMTPSA id d194sm4071347pfd.159.2020.01.23.17.24.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 Jan 2020 17:25:00 -0800 (PST)
Date: Thu, 23 Jan 2020 17:24:57 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH linux dev-5.4 v2 3/3] ARM: dts: aspeed-g6: add usb
 functions
Message-ID: <20200124012456.GB22665@taoren-ubuntu-R90MNF91>
References: <20200123074956.21482-1-rentao.bupt@gmail.com>
 <20200123074956.21482-4-rentao.bupt@gmail.com>
 <68fd7924-ecfb-43d7-be10-a96220f3a0d3@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68fd7924-ecfb-43d7-be10-a96220f3a0d3@www.fastmail.com>
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
Cc: Tao Ren <taoren@fb.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jan 24, 2020 at 10:42:15AM +1030, Andrew Jeffery wrote:
> 
> 
> On Thu, 23 Jan 2020, at 18:19, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > Add USB components and according pin groups in aspeed-g6 dtsi.
> > 
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> 
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Thank you for the quick review Andrew!


Cheers,

Tao
