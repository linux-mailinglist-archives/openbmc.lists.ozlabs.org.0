Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39929424BE1
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 04:46:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPwhD0XfPz2yp0
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 13:46:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qUqtdUag;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=f.fainelli@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qUqtdUag; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPwgl3cBbz2yX8;
 Thu,  7 Oct 2021 13:46:25 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id m14so4038730pfc.9;
 Wed, 06 Oct 2021 19:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=IpVh1IYfpzKfR6GkSU+3lboEb+0mbcf/l+spamR+b4w=;
 b=qUqtdUagXGAHjJ02iK3EMfeQQVQwbLTfNID8omD0ZiAPu6CSf3U3Hub+uP53ewURUY
 HShMwL8OiIp1x1Z/xPUraEDuIWFQi4OIqZi6hXbo6pbXXrlpohC3u2r/tM1f7h2wavk4
 tj33wD82910933jV6FPkEiv0xW8psa2+sKnso4MtRvBFTvOqx7eDFLxDAKasxS025rQC
 UNZt5jEiU/XUnLiIkebPOE7rLHZK3BOogYPCBEUrB5yxk5K+8u8ArXY72L9+y8H3vgRI
 SjxdRwBT5ON7qIvRxaFOUfbpeoiXaI8aMH3qUGUCSPYrqZRDDWLN5vhxzgW3/lm2odmA
 CgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IpVh1IYfpzKfR6GkSU+3lboEb+0mbcf/l+spamR+b4w=;
 b=tyLvky+ffLmkw13D7gSAuK64cxgVsu66nYwm5jzZb0gtXggg/K0k28Hjc4QX+00llp
 vkco4gfM+GzaAkJm2IRDtULYQXxwEd3Tx0cUrBFjiBspxUWpL8dtVlLQei5CcmrewV+R
 VC0P2SwHHkmEB2FY0vfsscQ0oPWeGJwJGd6lh6jhDTFmCEzIHKCHJusl2KsvV9DRzGEA
 IicIhPhB+sdtUd9X0d2/aL14RDMnE2B7JbMJ3m2eXo7lsMOQSlA17PUX/yANMmm2aXNi
 zMRrWGztE5Gin62rNCrGDfwfDtOiCWg3XfhE6wFJ7dHTgQl4r0PTV4Wa4gINNijPEBnR
 lvrQ==
X-Gm-Message-State: AOAM533Eo6WiBBjY9PcnN3tIY+vWIiaO3Y1sVwa24BHwwyDwT/vIAoZG
 l3Nk4l/llNKrq7xFSdETs+g=
X-Google-Smtp-Source: ABdhPJwl5RGXpQauISnEDl9qOpBhvRuE7gS6xNbt6Ro1NKjU7GGs7xBeC94oFMrkiB25zWuCItbO/A==
X-Received: by 2002:aa7:8439:0:b0:44c:80da:fc39 with SMTP id
 q25-20020aa78439000000b0044c80dafc39mr1806612pfn.47.1633574781962; 
 Wed, 06 Oct 2021 19:46:21 -0700 (PDT)
Received: from [192.168.1.121] (99-44-17-11.lightspeed.irvnca.sbcglobal.net.
 [99.44.17.11])
 by smtp.gmail.com with ESMTPSA id t6sm22435915pfh.63.2021.10.06.19.46.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 19:46:21 -0700 (PDT)
Message-ID: <99b43bbf-b63e-d684-dd61-3087e9f22dc4@gmail.com>
Date: Wed, 6 Oct 2021 19:46:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH 0/9] Dynamic DT device nodes
Content-Language: en-US
To: Zev Weiss <zev@bewilderbeest.net>, openbmc@lists.ozlabs.org
References: <20211007000954.30621-1-zev@bewilderbeest.net>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20211007000954.30621-1-zev@bewilderbeest.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 linux-aspeed@lists.ozlabs.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Jeremy Kerr <jk@codeconstruct.com.au>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Frank Rowand <frowand.list@gmail.com>, Andrey Konovalov <andreyknvl@gmail.com>,
 Alexey Dobriyan <adobriyan@gmail.com>, devicetree@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 Daniel Axtens <dja@axtens.net>, Andy Shevchenko <andy@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 10/6/2021 5:09 PM, Zev Weiss wrote:
> Hello,
> 
> This patch series is in some ways kind of a v2 for the "Dynamic
> aspeed-smc flash chips via 'reserved' DT status" series I posted
> previously [0], but takes a fairly different approach suggested by Rob
> Herring [1] and doesn't actually touch the aspeed-smc driver or
> anything in the MTD subsystem, so I haven't marked it as such.
> 
> To recap a bit of the context from that series, in OpenBMC there's a
> need for certain devices (described by device-tree nodes) to be able
> to be attached and detached at runtime (for example the SPI flash for
> the host's firmware, which is shared between the BMC and the host but
> can only be accessed by one or the other at a time).  To provide that
> ability, this series adds support for a new common device-tree
> property, a boolean "dynamic" that indicates that the device may come
> and go at runtime.  When present on a node, the sysfs file for that
> node's "status" property is made writable, allowing userspace to do
> things like:
> 
>    $ echo okay > /sys/firmware/devicetree/.../status
>    $ echo reserved > /sys/firmware/devicetree/.../status
> 
> to activate and deactivate a dynamic device.

This is a completely drive by comment here, but cannot you already 
achieve what you want today by making the SPI-NOR to be loaded as a 
module, probe it when you need it from the BMC, and unbind or rmmod the 
drive when you need it on the server/host attached to the BMC?

Looking at [0] there appears to be enough signaling visible by the BMC's 
user-space that it ought to be possible?

Assuming that there may be multiple flash chips and you somehow need to 
access one in order to complete the BMC device boot, but not the other 
one(s), you could imagine unbinding the spi-nor driver from the ones you 
don't want to drive and wait until you have appropriate signaling made 
available to your or is there a risk of racing with the host in doing so?
-- 
Florian
