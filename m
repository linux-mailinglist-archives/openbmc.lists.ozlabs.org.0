Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4602610B92
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 18:49:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vPWL4tG4zDqJm
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 02:49:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DZAZlVyv"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vPVV2S7dzDq9V;
 Thu,  2 May 2019 02:48:48 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id w24so8441247plp.2;
 Wed, 01 May 2019 09:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=a82ckZo73SGxA8ey3aK0omtfrwDTACIRQAmbz4zxBz8=;
 b=DZAZlVyv2Zj8QW2ZVaA4F2WxBgm+TYZTAM4t/5EOeChgCJ7BD4Ft2Dzmnf3x6+ydz1
 XakRftqblAOckP3MeN3ccDznp09ppAFe871YQDxI1Qj+FuNPuoY1ouHhz5kI+3ZQ3PV3
 /L68VP9/OZfwUxqTI2ADGPFduqoKJR0cQ/ilRG4LirfK9AWJ1nlO4sVAtoc4jAZjVELX
 dwxVevKkDwYvFLwv52/XqZAeyBzWSZ5CO4uvi+nyaZGWjFQjY/27kRLDK4iQOVPv1bS3
 pYU7oLCM3TjBP/5voYoXBOCWgkWx+/gNSfwEsWL5ioDvofaSRT3AzcJ5BrlWCeZEJ+vp
 9TMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=a82ckZo73SGxA8ey3aK0omtfrwDTACIRQAmbz4zxBz8=;
 b=X8RMOTrkHIyNkaaRUfQ+Ezbuotk5C7QoSIUJrMCr0KN0ms+L5bYubJr5qw7ExAw9mp
 JpI9mYvPT00Kv41ugIkt63rjbDWN1q2vYVq5/4GODecb4WFgOCytFV+iwNrZhUMgmpZu
 anjV6QDw2GGLlOxWtoKLYjYR5jdcjMw675r9L1L6t1xJT3YIbowWiKimabItcpuZk4kq
 G13ulVKe1S5uSs/a7d8oHRtpGVJArs53OHG0e2bmLU40ETsV2BGX1vgr9NipNcIi/fh9
 zEOUrOPOlGERkrGRpvDusl8Bxke5ngBv7tf9gFlmLTQu4vTVU/9RUR/QVYmc+Q54heD/
 JqjQ==
X-Gm-Message-State: APjAAAWhk9Fe2FUayKs+2BRu5/LKVfTLHh1H/pNaMPFB1W7PLNmNKqZZ
 VGYJBXN9haFfGn4AAYszrAE=
X-Google-Smtp-Source: APXvYqxW8qIcb4HhSImxk+i+ozqc55UYdRTl9MHwDSKvhigyPhTtplKP1yE1tqeQ0DpYt8I1Y+S+aA==
X-Received: by 2002:a17:902:163:: with SMTP id
 90mr79079707plb.34.1556729325186; 
 Wed, 01 May 2019 09:48:45 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id r76sm62426017pfa.39.2019.05.01.09.48.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 May 2019 09:48:44 -0700 (PDT)
Date: Wed, 1 May 2019 09:48:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/6] thermal: Introduce
 devm_thermal_of_cooling_device_register
Message-ID: <20190501164843.GA16333@roeck-us.net>
References: <1555617500-10862-1-git-send-email-linux@roeck-us.net>
 <1555617500-10862-2-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1555617500-10862-2-git-send-email-linux@roeck-us.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Jean Delvare <jdelvare@suse.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Andrew Jeffery <andrew@aj.id.au>, Patrick Venture <venture@google.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Kamil Debski <kamil@wypas.org>, Tali Perry <tali.perry1@gmail.com>,
 Eduardo Valentin <edubezval@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Apr 18, 2019 at 12:58:15PM -0700, Guenter Roeck wrote:
> thermal_of_cooling_device_register() and thermal_cooling_device_register()
> are typically called from driver probe functions, and
> thermal_cooling_device_unregister() is called from remove functions. This
> makes both a perfect candidate for device managed functions.
> 
> Introduce devm_thermal_of_cooling_device_register(). This function can
> also be used to replace thermal_cooling_device_register() by passing a NULL
> pointer as device node. The new function requires both struct device *
> and struct device_node * as parameters since the struct device_node *
> parameter is not always identical to dev->of_node.
> 
> Don't introduce a device managed remove function since it is not needed
> at this point.
> 

Any feedback / thoughts / comments ?

Thanks,
Guenter
