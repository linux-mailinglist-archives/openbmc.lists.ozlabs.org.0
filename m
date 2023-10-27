Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0657D95E3
	for <lists+openbmc@lfdr.de>; Fri, 27 Oct 2023 13:01:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=gvYXJhSf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SH08n0QhVz3cTc
	for <lists+openbmc@lfdr.de>; Fri, 27 Oct 2023 22:01:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=gvYXJhSf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=lists.ozlabs.org)
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SH0882qWQz3cBs;
	Fri, 27 Oct 2023 22:00:56 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:7e5d:5300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 1871F912;
	Fri, 27 Oct 2023 04:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1698404449;
	bh=46CI2348zLuWGtq6JcTrLbZwqAqPdJ4oLHt47Q46BLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gvYXJhSfFqFnNUZNLH6mGrPgpLf5hM+XUJqMFmDnq4vz+FXeaqBzpT57FN/cpXgC6
	 CW0MDbyUQXnYZEFiyKVzv0eIeg3oCh6m/ZuFuBgDa+vkhfXYyWgxybN42GIr5s4sz1
	 kcR5PICg9oa5uPjczQH5kX3MM7VI8FE5gyfcbPko=
Date: Fri, 27 Oct 2023 04:00:47 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Andrew Jeffery <andrew@aj.id.au>, Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	"Milton D. Miller II" <mdmii@outlook.com>,
	Rob Herring <robh+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH 0/2] watchdog: aspeed: Add aspeed,reset-mask property
Message-ID: <5db80b63-65da-407c-a019-048dea8c1a89@hatter.bewilderbeest.net>
References: <20230922104231.1434-4-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230922104231.1434-4-zev@bewilderbeest.net>
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
Cc: Ivan Mikhaylov <i.mikhaylov@yadro.com>, Eddie James <eajames@linux.ibm.com>, Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Sep 22, 2023 at 03:42:32AM PDT, Zev Weiss wrote:
>Hello,
>
>These patches add a new aspeed,reset-mask DT property for the Aspeed
>watchdog timer, which specifies exactly which peripherals should be
>reset by the watchdog timer.
>
>This series is a replacement for a patch I sent earlier [0], though
>using an entirely different (DT-based) approach and hence not exactly
>a v2.
>
>I've tested these patches on ast2500 hardware and a qemu ast2600
>model; test results on actual ast2600 hardware would be welcome.
>
>
>Thanks,
>Zev
>
>
>[0] https://lore.kernel.org/linux-watchdog/20230922013542.29136-2-zev@bewilderbeest.net/
>
>Zev Weiss (2):
>  dt-bindings: watchdog: aspeed-wdt: Add aspeed,reset-mask property
>  watchdog: aspeed: Add support for aspeed,reset-mask DT property
>
> .../bindings/watchdog/aspeed-wdt.txt          | 18 +++-
> drivers/watchdog/aspeed_wdt.c                 | 11 +++
> include/dt-bindings/watchdog/aspeed-wdt.h     | 92 +++++++++++++++++++
> 3 files changed, 120 insertions(+), 1 deletion(-)
> create mode 100644 include/dt-bindings/watchdog/aspeed-wdt.h
>

Ping...Guenter, if we stick with the simpler approach in this version of 
the patches (which I'm fine with and seems to have passed muster with 
Rob & Joel) does this look okay as is?


Thanks,
Zev

