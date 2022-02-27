Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC314C58CD
	for <lists+openbmc@lfdr.de>; Sun, 27 Feb 2022 01:28:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K5krS4CkPz30LR
	for <lists+openbmc@lfdr.de>; Sun, 27 Feb 2022 11:28:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=bV2tJCFM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=bV2tJCFM; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K5kr31VBPz302S
 for <openbmc@lists.ozlabs.org>; Sun, 27 Feb 2022 11:28:02 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net
 [174.21.187.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 03CF4586;
 Sat, 26 Feb 2022 16:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1645921679;
 bh=5WFoesqJ/+akiaoM7kBR726dsvyDNXMcep+15oG4IPI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bV2tJCFMwdzMP+o8AP09JuDaQEdndvdhEuiTp6pV/e+vgHr+IwbDVVNtnJiCt4roy
 7l15H16sLOT87luHy9uqViMh3cNNqa6Gspc6Y9pe44/UdV8hfIMMRkBPr/xt4mi5jW
 I7N6P14s0QlrK75rsM0BOhl7DGciDIfH3qkwicsA=
Date: Sat, 26 Feb 2022 16:27:55 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Subject: Re: [PATCH 0/5] hwmon: (nct6775) Add i2c support
Message-ID: <YhrFizhgOpZbi3dE@hatter.bewilderbeest.net>
References: <20220226133047.6226-1-zev@bewilderbeest.net>
 <2620147.mvXUDI8C0e@natalenko.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2620147.mvXUDI8C0e@natalenko.name>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Renze Nicolai <renze@rnplus.nl>,
 Rob Herring <robh+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Feb 26, 2022 at 04:14:12PM PST, Oleksandr Natalenko wrote:
>Hello.
>
>On sobota 26. února 2022 14:30:42 CET Zev Weiss wrote:
>> Hello,
>>
>> This patch series augments the existing nct6775 driver with support
>> for the hardware's i2c interface.
>
>Is it something I can test on my ASUS Pro WS X570-ACE board as an ordinary user, and if so, how?
>

You could certainly test that the nct6775-platform driver still works as 
it did previously, which would be good to confirm -- you'll need to 
enable CONFIG_SENSORS_NCT6775_PLATFORM now to build it.

 From what I've been able to find about that board though it looks like 
it doesn't have a BMC, so testing the i2c driver on it probably isn't 
going to be possible.  (Even if it does in fact have a BMC, it would 
require at least a partial port of OpenBMC or similar, and re-flashing 
your BMC firmware with that, and is hence a non-trivial undertaking.)


Zev

