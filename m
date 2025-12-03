Return-Path: <openbmc+bounces-966-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D84CA0443
	for <lists+openbmc@lfdr.de>; Wed, 03 Dec 2025 18:07:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dM3wQ680vz2yvH;
	Thu, 04 Dec 2025 04:07:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764781638;
	cv=none; b=e8t6mEM5AhE7hRMc9MRdbD5OR5ESrbyFsyYc3UnCo4qGxZ2vxnJJSjcJ+3mdnAByQnKYSNk8uM4hIZXQLq75equK5uEmV4qYhx27FRWgvGlxOnOdUQ5kqRVI2BJQ+WcEmqONUginjWUsV+odfCQ7Fw621ZE7HkF5AJh3uboGlXKon3Rhfbtr+cTLaGOrZ0y0JluaNuyBoltNcrkOlHf+s1zqBkzmR+lGC0ZjsXEjErZfRSosc7J8CMkwhujC0I6XXd/83Ir1LqCvJw/mefI83lHvDz6Y1bUrcJkC74n3NGzxr7h9xGXmPhwXe2xaTwNtTMYjODbxNPpUkYinWFbcbw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764781638; c=relaxed/relaxed;
	bh=DCqAC1oDdnPc/O3hBChFfb/Eb8FppFjupPOH0Dkjp30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o06S0llL/5TkBaQRChQEvFsI5f/eQkXB/3UTrL0TNicXUVPWvPgfPPUvhwLFfscVjU8C6zJ/aiy7oFC/jrBegxBJZVPSXuSc/rvHxqAR0db9pZ0qeyG86AqkDJZZgOOGiIuFj5i4XzEX/W70zVtQj9wPWbTiOGuqaxFLOIyxPRl5QJPzke2nBt3M6zB7/C+M7hlfIFJfzjblBjrtMrZgvcvjT0T0U7tnDoB8mDeQ+d1+g+D/hqx6H9E09xtblXpm5HuflA0Yt1gh0YLiLzVD2MxHbJxnfktsqnr7f1LylmZONk6BO49+WZ/t2MpF5vu71RutYS4wWFfYjmnUPIvrRg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RPIUE0VS; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RPIUE0VS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dM3wP6gG1z2yvB
	for <openbmc@lists.ozlabs.org>; Thu, 04 Dec 2025 04:07:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A3FBC601D7;
	Wed,  3 Dec 2025 17:07:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC6A2C4CEF5;
	Wed,  3 Dec 2025 17:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764781634;
	bh=IK2aXYtTNUhwvftN4T/CQnGOt2OyoxBjlX4nNeQr6ts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RPIUE0VSFKGrlERbJqNPkYlVpeUT/qRSXb6APi+dSm3DpPmO85fOc+ica0g662Ynj
	 HloHzRWQfXqAW7Zk9ee3bB0nG13WMN7KaRXAsmFfr8J7mF170SCHHoefUTc9bYuj1u
	 LpceRJAUxYLPuTEHOHVgJef90Y2dWzx9eDy1SJLUNwc0LTaR5Q9tQYQKvdJr1YtOh2
	 xDtlThuiT3vMxTpS0Jv1EREQ3MCacPaMqWs3Q+aENwXcA4FPpv775gtKnRliyiiPyH
	 qjFReCt3hz7mwWqz6o8ezsIu12O2HLHD6tCem3LwSKgrstswHGaZ2TSQZ7x2LCEEqR
	 PwB3/+JLrjcsg==
Date: Wed, 3 Dec 2025 18:07:11 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Eddie James <eajames@linux.ibm.com>, 
	Ninad Palsule <ninad@linux.ibm.com>, linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 04/12] i2c: fsi: Drop assigning fsi bus
Message-ID: <x4y4m7bclxs3rbb6ptqt6chlg7iaual4wjz2lma5ugdhfp2mr6@phsjcud6vfax>
References: <cover.1764434226.git.ukleinek@kernel.org>
 <ef38106b5099e92395d5cc84d1bf0b806b53d1dc.1764434226.git.ukleinek@kernel.org>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef38106b5099e92395d5cc84d1bf0b806b53d1dc.1764434226.git.ukleinek@kernel.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Uwe,

On Sat, Nov 29, 2025 at 05:57:40PM +0100, Uwe Kleine-König wrote:
> Since commit FIXME ("fsi: Assign driver's bus in fsi_driver_register()")

whoever is going to apply the series needs to remember to replace
this FIXME.

> module_fsi_driver() cares about assigning the driver's bus member. Drop the
> explicit driver specific assignment.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

