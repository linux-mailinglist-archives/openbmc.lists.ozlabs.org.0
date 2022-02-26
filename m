Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 839754C5894
	for <lists+openbmc@lfdr.de>; Sat, 26 Feb 2022 23:48:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K5hcf4vdYz30N5
	for <lists+openbmc@lfdr.de>; Sun, 27 Feb 2022 09:48:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=mH/In1OB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=mH/In1OB; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K5hcF4C42z2yQ9
 for <openbmc@lists.ozlabs.org>; Sun, 27 Feb 2022 09:47:41 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net
 [174.21.187.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id C3F62135;
 Sat, 26 Feb 2022 14:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1645915658;
 bh=tIcumh48jcpGZxoz/OHLB3R+NNcH8VOgxfnwIzwaJxQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mH/In1OBn/CN42PCTjp038POsrGzKe5EmHsGI8RXHUAcxGvDBsmArcN2EfZuleEV5
 qWphK0ui1OvFbdjPWvSPI7iJD3sbo7xveOY0eWa/NbvKcQkxOqOBf1qnT2umv32d59
 NUrC0VsxI/hJyKdRgPg6aY/5i5OTca0izIf/Vz3o=
Date: Sat, 26 Feb 2022 14:47:36 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH 0/5] hwmon: (nct6775) Add i2c support
Message-ID: <YhquCDp2bnY6I9ra@hatter.bewilderbeest.net>
References: <20220226133047.6226-1-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220226133047.6226-1-zev@bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Renze Nicolai <renze@rnplus.nl>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Feb 26, 2022 at 05:30:42AM PST, Zev Weiss wrote:
>Hello,
>
>This patch series augments the existing nct6775 driver with support
>for the hardware's i2c interface.
>
> <snip>
>
>I've tested the nct6775-platform and nct6775-i2c drivers with the
>NCT6779D in an ASRock ROMED8HM3 system (the latter driver on its
>AST2500 BMC); both seem to work as expected.  Broader testing would of
>course be welcome though, as is review feedback.
>

Also, for the sake of anyone testing or otherwise applying these patches
I should mention that the series is based on Guenter's hwmon-next tree
(commit 9db3b740a801).


Zev

