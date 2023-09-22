Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 748DF7ABBFF
	for <lists+openbmc@lfdr.de>; Sat, 23 Sep 2023 00:51:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tRYz0gV9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsnZj2f11z3cHR
	for <lists+openbmc@lfdr.de>; Sat, 23 Sep 2023 08:51:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tRYz0gV9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=srs0=kpay=fg=robh_at_kernel.org=rob@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsnZ02rB3z2yPq;
	Sat, 23 Sep 2023 08:51:20 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A3FDEB822DB;
	Fri, 22 Sep 2023 22:51:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB70C433C8;
	Fri, 22 Sep 2023 22:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695423076;
	bh=+IgQHS0uZ5whJ86T+o1t0MM1hBYBpdeCcn6J2sibHpA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tRYz0gV96XVqgdZIDZIECV4fPJq4hhVnvurXeBnWxH95oT4N9BoPVUW+WqK9Onc/k
	 0VoSthzX8qL7QAvEQOquiwoSD/RxihT7BrZJpLipPABvym5/03+cc8FGa7z9Rp++KD
	 D2qvsX94BKWZj4MaF1cu0FNVYJV0c/O8zjY8SpcgVEY4MsS0xs2mOjT00j3q3BI6zA
	 yDWlSrx9PAvnaXpJFpiyPp8Q5TziPN7ozaoUwga6T4ayEoXReqrw2JBpTIBJVrtUFm
	 hBEom1FGZvoeJhKjzef6RLFAe76R4FQQoXAxNuQSX2c/5pLb0qHuNqWpGT6KBJk9KW
	 e4i+y7sZTpHuA==
Received: (nullmailer pid 4076004 invoked by uid 1000);
	Fri, 22 Sep 2023 22:51:11 -0000
Date: Fri, 22 Sep 2023 17:51:11 -0500
From: Rob Herring <robh@kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: aspeed-wdt: Add
 aspeed,reset-mask property
Message-ID: <169542307112.4075948.15645605897080315437.robh@kernel.org>
References: <20230922104231.1434-4-zev@bewilderbeest.net>
 <20230922104231.1434-5-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230922104231.1434-5-zev@bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, Guenter Roeck <linux@roeck-us.net>, Eddie James <eajames@linux.ibm.com>, linux-kernel@vger.kernel.org, Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ivan Mikhaylov <i.mikhaylov@yadro.com>, "Milton D. Miller II" <mdmii@outlook.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On Fri, 22 Sep 2023 03:42:33 -0700, Zev Weiss wrote:
> This property configures the Aspeed watchdog timer's reset mask, which
> controls which peripherals are reset when the watchdog timer expires.
> Some platforms require that certain devices be left untouched across a
> reboot; aspeed,reset-mask can now be used to express such constraints.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  .../bindings/watchdog/aspeed-wdt.txt          | 18 +++-
>  include/dt-bindings/watchdog/aspeed-wdt.h     | 92 +++++++++++++++++++
>  2 files changed, 109 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/watchdog/aspeed-wdt.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>

