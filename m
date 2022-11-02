Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6C2616923
	for <lists+openbmc@lfdr.de>; Wed,  2 Nov 2022 17:33:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2XWy1ZWbz3cDp
	for <lists+openbmc@lfdr.de>; Thu,  3 Nov 2022 03:33:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=k0kLx5rZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::240; helo=mslow1.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=k0kLx5rZ;
	dkim-atps=neutral
X-Greylist: delayed 552 seconds by postgrey-1.36 at boromir; Thu, 03 Nov 2022 03:33:17 AEDT
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2XWK3VsTz2xGq
	for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2022 03:33:17 +1100 (AEDT)
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id E6752D1EE6
	for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2022 16:24:06 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 57719E0009;
	Wed,  2 Nov 2022 16:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667406224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=12FZYtpp3TNBfA195rczrGKRPIW2epUEipXnIrnelNg=;
	b=k0kLx5rZzd3GTdZryecEd73PZ/bILTPUMEl8xEwFd0WpmFcqOjUwA2sswbg1aIY/KK9Qpg
	2p322+QVzXFJEuboQEaOq6l2p9RJ8XdkV7oAwGqGBIMHquph4Vsf90tgbaCc3Uu5H7u6IK
	A+/mGevzXNiiruQDLSoAf2TaPwnV/otXnerrR2G80QPQhiWK7oCVHE9YjPqwO+Ot2/hDMK
	Wx0iMS7291GTWK/PX0UhtCfTno/Wv63pVKPCMUQt5wESsZIxh4UR3queU0hqnr2bv7PWLC
	vRzm2QP29so2u9YmkLXWqm7kFqXJciCFMD+3KZR3mZAWFoHAfJGL9UJXqW24lA==
Date: Wed, 2 Nov 2022 17:23:41 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Tali Perry <tali.perry1@gmail.com>,
	Avi Fishman <avifishman70@gmail.com>, Nancy Yuen <yuenn@google.com>,
	Patrick Venture <venture@google.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH 0/9] rtc: Convert i2c drivers to .probe_new()
Message-ID: <166740615895.299096.14166888636281572653.b4-ty@bootlin.com>
References: <20221021130706.178687-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221021130706.178687-1-u.kleine-koenig@pengutronix.de>
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
Cc: Wolfram Sang <wsa@kernel.org>, linux-rtc@vger.kernel.org, openbmc@lists.ozlabs.org, Benjamin Fair <benjaminfair@google.com>, kernel@pengutronix.de
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 21 Oct 2022 15:06:57 +0200, Uwe Kleine-König wrote:
> See commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new() call-back
> type") for the rationale.
> 
> Best regards
> Uwe
> 
> Uwe Kleine-König (9):
>   rtc: abx80x: Convert to .probe_new()
>   rtc: ds1307: Convert to .probe_new()
>   rtc: isl1208: Convert to .probe_new()
>   rtc: m41t80: Convert to .probe_new()
>   rtc: nct3018y: Convert to .probe_new()
>   rtc: pcf2127: Convert to .probe_new()
>   rtc: rs5c372: Convert to .probe_new()
>   rtc: rv8803: Convert to .probe_new()
>   rtc: rx8025: Convert to .probe_new()
> 
> [...]

Applied, thanks!

[1/9] rtc: abx80x: Convert to .probe_new()
      commit: 4c112e62e093b216e10fbe568e51447b9e3fee34
[3/9] rtc: isl1208: Convert to .probe_new()
      commit: 44b8ae3ed23f0e2b5bc680c0a3f4be7c5597cb78
[4/9] rtc: m41t80: Convert to .probe_new()
      commit: 52b31f00779690274c2c54eb3cd939004ac077e4
[5/9] rtc: nct3018y: Convert to .probe_new()
      commit: a9e9636a71039f5aa270091209f0580c638e341f
[6/9] rtc: pcf2127: Convert to .probe_new()
      commit: e3be426bc755cb4946ee126ec23cd94cbe42251f
[7/9] rtc: rs5c372: Convert to .probe_new()
      commit: b08e47b0c8a83f4de9676122064bf57baa4ea1e8
[8/9] rtc: rv8803: Convert to .probe_new()
      commit: 1107e384f95eeeeda2ae98f0a162b4fb9f6015cd
[9/9] rtc: rx8025: Convert to .probe_new()
      commit: 789c2c83c89957e9c27e419801c2bab3bbf7a8b0

Note that patch attestation reports bad signature on your patches.

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
