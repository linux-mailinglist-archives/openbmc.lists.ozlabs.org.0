Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 238EF4D2A62
	for <lists+openbmc@lfdr.de>; Wed,  9 Mar 2022 09:12:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KD4gq00tBz3bWG
	for <lists+openbmc@lfdr.de>; Wed,  9 Mar 2022 19:12:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KD4gT5HRfz2yws
 for <openbmc@lists.ozlabs.org>; Wed,  9 Mar 2022 19:12:36 +1100 (AEDT)
Received: from [192.168.0.3] (ip5f5aef7a.dynamic.kabel-deutschland.de
 [95.90.239.122])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 4B77E61E64846;
 Wed,  9 Mar 2022 09:12:33 +0100 (CET)
Message-ID: <05667284-42f7-0df2-8fa0-463ad6ad9601@molgen.mpg.de>
Date: Wed, 9 Mar 2022 09:12:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 0/6] hwmon: (nct6775) Convert to regmap, add i2c support
Content-Language: en-US
To: Zev Weiss <zev@bewilderbeest.net>
References: <20220309005047.5107-1-zev@bewilderbeest.net>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20220309005047.5107-1-zev@bewilderbeest.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Rob Herring <robh+dt@kernel.org>, Renze Nicolai <renze@rnplus.nl>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Zev,


Am 09.03.22 um 01:50 schrieb Zev Weiss:

> This is v2 of my patches to add i2c support to the nct6775 driver.
> 
> Changes since v1 [0]:
>   - Added preparatory patch converting driver to regmap API [Guenter]
>   - Replaced ENOSPC with ENOBUFS and removed WARN_ON() in
>     nct6775_add_attr_group() [Guenter]
>   - Added dedicated symbol namespace [Guenter]
>   - Removed nct6775_write_temp() and nct6775_update_device() symbol
>     exports [Guenter]
>   - Reordered patches to put dt-bindings patch first [Krzysztof]
> 
> The nct6775-platform and nct6775-i2c drivers have both been tested on
> the NCT6779D in an ASRock ROMED8HM3 system and the NCT6798 [1] in an
> ASRock X570-D4U (the latter thanks to Renze, CCed); both seem to work
> as expected on both systems.  I don't have access to any asuswmi
> hardware, so testing of the nct6775-platform driver on that to ensure
> it doesn't break there would be appreciated (Oleksandr, perhaps?).

I have an ASUS F2A85-M PRO with that Super I/O. (It’s running coreboot 
right now, but I can test with the proprietary vendor firmware, if you 
tell me what and how I can test this.


Kind regards,

Paul


> [0] https://lore.kernel.org/linux-hwmon/20220226133047.6226-1-zev@bewilderbeest.net/
> [1] Though it's physically labeled (mislabeled?) as an NCT6796, for
>      what that's worth.
> 
> A slightly edited version of the previous cover letter follows:

[…]
