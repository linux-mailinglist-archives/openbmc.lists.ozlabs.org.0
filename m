Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C39C4C723C
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 18:12:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6n4N0lBCz3bZR
	for <lists+openbmc@lfdr.de>; Tue,  1 Mar 2022 04:12:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=g36pWvHr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=g36pWvHr; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6n3x63Gdz30Hp
 for <openbmc@lists.ozlabs.org>; Tue,  1 Mar 2022 04:11:54 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net
 [174.21.187.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 0B674516;
 Mon, 28 Feb 2022 09:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1646068311;
 bh=ka9wDIve8AgVIvxtisCTwLpRAivhzRXy0fQgcqAecRY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g36pWvHrGTrqS2i2n5dld7CiuaGG1E3swlqbG5LA7YqJvrFR1AhzA8KOXZr8cXndQ
 xEYXORTroqutdHZWHhTDCvAy2lbviWmdk++/UAa9MpUJgI2XZZyWQcHj6ZwQO+75Hz
 695lsE/Vv2AG9KsvfNpRlzqucWeawOfVf2JSZ3DI=
Date: Mon, 28 Feb 2022 09:11:47 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 0/2] ic2: mux: pca9541: add delayed-release support
Message-ID: <Yh0CUzBzGJc4zyTR@hatter.bewilderbeest.net>
References: <20220201001810.19516-1-zev@bewilderbeest.net>
 <YhyLIRFbs226KTwA@hatter.bewilderbeest.net>
 <fbb305e3-73b3-7a2d-99cf-a7205b7344ff@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fbb305e3-73b3-7a2d-99cf-a7205b7344ff@roeck-us.net>
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
 linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 Peter Rosin <peda@axentia.se>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Feb 28, 2022 at 05:57:27AM PST, Guenter Roeck wrote:
>On 2/28/22 00:43, Zev Weiss wrote:
>>On Mon, Jan 31, 2022 at 04:18:08PM PST, Zev Weiss wrote:
>>>Hello,
>>>
>>>This series adds support for a new pca9541 device-tree property
>>>("release-delay-us"), which delays releasing ownership of the bus
>>>after a transaction for a configurable duration, anticipating that
>>>another transaction may follow shortly.  By avoiding a
>>>release/reacquisition between transactions, this can provide a
>>>substantial performance improvement for back-to-back operations -- on
>>>a Delta AHE-50DC (ASPEED AST1250) system running OpenBMC with dozens
>>>of LM25066 PMICs on PCA9541-arbitrated busses, a setting of 10000 (10
>>>ms) reduces the median latency the psusensor daemon's hwmon sysfs file
>>>reads from 2.28 ms to 0.99 ms (a 57% improvement).
>>>
>>
>>Ping...Guenter, any thoughts on this?
>>
>
>It sounds reasonable to me, but I don't have access to hardware anymore
>to test it, so I have no means to confirm that it actually works.
>

Ack, thanks.  In that case, what's the path forward on getting changes 
to this driver merged?  I see sign-offs from Wolfram and Peter on the 
last few commits that touched it -- any input from the i2c/i2c-mux 
maintainers?


Zev

