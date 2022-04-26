Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 147B550F410
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 10:29:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnZnJ6hxgz3bck
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 18:29:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=SqRxQbsx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=SqRxQbsx; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnZmw6fl8z2x9V
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022 18:29:36 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-163-222.tukw.qwest.net
 [174.21.163.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 493324F;
 Tue, 26 Apr 2022 01:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1650961774;
 bh=SNEEfzyg9e7zSf3s0KHAajmviT5U9WD7JJYzw4V8nPc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SqRxQbsxJ8p4HT+cwT8K4Q7b5LlTTE6n0e/rtUTR9HdGsjyJV9OqppeQirLCrnoI3
 tgf8oUElUjUiyi8cP1ZmdF+J4lgpnso36G+aEM1cjtiy982UhhyjTQnR8oHyI6JjiM
 NvtgdkQtaIUQ2H6ztI3hAfNqZ8o+sc7aj4eaCAZk=
Date: Tue, 26 Apr 2022 01:29:22 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 0/6] hwmon: (nct6775) Convert to regmap, add i2c support
Message-ID: <YmetYjSKFs+WWwYz@hatter.bewilderbeest.net>
References: <20220426071848.11619-1-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220426071848.11619-1-zev@bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, webmaster@kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Rob Herring <robh+dt@kernel.org>, Renze Nicolai <renze@rnplus.nl>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

[Adding korg webmaster re: list infrastructure]

On Tue, Apr 26, 2022 at 12:18:42AM PDT, Zev Weiss wrote:
>Hello,
>
>This is v3 of my effort to add i2c support to the nct6775 hwmon
>driver.
>
>Changes since v2 [0]:
> ...
> - Renamed drivers and Kconfig symbols to keep existing platform
>   driver as "nct6775" (SENSORS_NCT6775) and the core module as
>   "nct6775-core" (SENSORS_NCT6775_CORE) [Guenter]

Unfortunately while this was a simple enough change to make (a few 'git 
mv' commands and a handful of actual text changes), it ballooned the 
size of the diff for patch 5 to the point that vger bounced it for 
exceeding the 100K message-size limit.  As far as I can tell it looks 
like it went through elsewhere, but does leave a bit of a gap in the 
public list archives -- please let me know if there's anything I should 
try in terms of re-sending it.  (The only combination of 'git 
format-patch' flags I've been able to find that gets it back down to 
approximately its previous size is '-B -D', which isn't so useful for 
actually applying.)

I'm not sure how critical a limit that 100K is, or if it's something we 
might consider raising a bit?


Thanks,
Zev

