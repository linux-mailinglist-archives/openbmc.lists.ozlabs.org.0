Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8DC50EE10
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 03:23:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnPKj44PZz3bY3
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 11:23:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=SmUQiZcd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=SmUQiZcd; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnPKG4zP7z2xZW
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022 11:23:30 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net
 [174.21.187.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id CFE121B3;
 Mon, 25 Apr 2022 18:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1650936206;
 bh=nMPCdQ5YICk6b3UizKU0CL3dpjIZCdCxutVbgMKfh5s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SmUQiZcdTo4s2cU2D1R7/36+bmOZLfzMoSJZ/1tcBqAkDIf8/CEjSSRcI7aM0cqUT
 10DbMiRvCdnTFBxQ9LTNvVGsRPIBdA0J03udYTHlRJF6CJuvuvaZsYRr4uaaOon3T8
 Yd6JClM7orwtr30CWvfVpMWlhgJcptNJHQKA6llM=
Date: Mon, 25 Apr 2022 18:23:21 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 1/6] dt-bindings: hwmon: Add nuvoton,nct6775
Message-ID: <YmdJibUk2cfOamMk@hatter.bewilderbeest.net>
References: <20220309005047.5107-1-zev@bewilderbeest.net>
 <20220309005047.5107-2-zev@bewilderbeest.net>
 <20220425150748.GA4165124@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220425150748.GA4165124@roeck-us.net>
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
 Jean Delvare <jdelvare@suse.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Renze Nicolai <renze@rnplus.nl>, Rob Herring <robh+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Apr 25, 2022 at 08:07:48AM PDT, Guenter Roeck wrote:
>On Tue, Mar 08, 2022 at 04:50:42PM -0800, Zev Weiss wrote:
>> These Super I/O chips have an i2c interface that some systems expose
>> to a BMC; the BMC's device tree can now describe that via this
>> binding.
>>
>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>
>This is still waiting for DT maintainer approval.
>
>Do you expect to add further properties along the line ?
>If not, you might consider adding the chips to trivial devices instead.
>

Additional properties seem possible, though at the moment I don't know 
exactly what they might be, so trivial-devices.yml probably makes more 
sense.

I'll send a v3 soon with that change and the Kconfig fixes in the other 
patches.


Thanks,
Zev

