Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E9B2B888F
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 00:44:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cbzsq42JDzDqZl
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 10:43:59 +1100 (AEDT)
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
 header.s=20161025 header.b=tnAh4sgF; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cbzrq6BBTzDqDT
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2020 10:43:03 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id l11so1920624plt.1
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2020 15:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=my77lXxheR/soSpdh9NtnHrImMTbEyo5ey9OXT+ydGM=;
 b=tnAh4sgFOOfGkBrOhj0wq7o24G5C2JBdHz8gB2janp1zIdppJcfsfSo5ADiD9HzKDl
 ONZNEFStlL8hh76GqoHm/4CAwwl+HJt5VzZL8tDtMxOMT3LhJYcUsitgMWkCVRJ8yjEf
 1jhUWZZHz+GDT67wqy6W60n91buKwZge4mA4GDkpOh0Djdxr56f+WihxbU/k3CJ+BiTY
 JWyLmz412BGJ4/B6LC7onGP7RBqLxTu4ZOBgzcH0NxQcdRJMFXPHFOw/C0viRZksJ/LJ
 d9chJReG3R7wSGiY4WBkAxjzwyS7X29/6eI7xxLoy0wJrmI/hBlilbvYsQZJfO0rk+tI
 hYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=my77lXxheR/soSpdh9NtnHrImMTbEyo5ey9OXT+ydGM=;
 b=pMDKt9w+upSqeT/+K23Wc7OPE7TysYUtrnf6hdB8OFMCtkcy9V+RGJuDO8GOmGGLt+
 amtea9cUV1MwqCYwq9v9uXrPKkSspkM6QEmajw6vgQV8e2Zs75qCLVx3/cEHoZ/Fafoj
 shTsxb47zRre46w7OXXE4byC8pACaVMBixvqEE2mrMpMEyKhCe3hKKoegBfwkAfF7R41
 Qn3o5+/1w7/kvJj5ZTUCAZOD34iqcUyybDkYjgei+MtkstYBPcRc7d1p7Ti6E+goxT5s
 DtIgd+J0vpjLEfN2yscWZ1ShLt00uzauFNeEPyZUsdDDIyySK6M33ivuUpC2FvFMLq88
 /n1w==
X-Gm-Message-State: AOAM531A35Jxtxu60+97i2qp5iaQ81tmZz42fSXp7NlMGLCpG0T0VTMS
 gD62JgdBNz2bTM9C3K2HzH4=
X-Google-Smtp-Source: ABdhPJytJ5WdKQGVNxK7E32i8LxD6oXuriCVok63jK7EZZaQ2Zuy/LgRsVqR4sm4/WK/Gf/JM4D7nA==
X-Received: by 2002:a17:902:b410:b029:d6:614b:679c with SMTP id
 x16-20020a170902b410b02900d6614b679cmr6512221plr.79.1605742981128; 
 Wed, 18 Nov 2020 15:43:01 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net.
 [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id g14sm28970005pfk.90.2020.11.18.15.42.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 18 Nov 2020 15:43:00 -0800 (PST)
Date: Wed, 18 Nov 2020 15:42:53 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 0/2] hwmon: (max127) Add Maxim MAX127 hardware
 monitoring
Message-ID: <20201118234252.GA18681@taoren-ubuntu-R90MNF91>
References: <20201118230929.18147-1-rentao.bupt@gmail.com>
 <20201118232719.GI1853236@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201118232719.GI1853236@lunn.ch>
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 linux-kernel@vger.kernel.org, taoren@fb.com, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, mikechoi@fb.com, "David S . Miller" <davem@davemloft.net>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Nov 19, 2020 at 12:27:19AM +0100, Andrew Lunn wrote:
> On Wed, Nov 18, 2020 at 03:09:27PM -0800, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > The patch series adds hardware monitoring driver for the Maxim MAX127
> > chip.
> 
> Hi Tao
> 
> Why are using sending a hwmon driver to the networking mailing list?
> 
>     Andrew

Hi Andrew,

I added netdev because the mailing list is included in "get_maintainer.pl
Documentation/hwmon/index.rst" output. Is it the right command to find
reviewers? Could you please suggest? Thank you.


Cheers,

Tao
