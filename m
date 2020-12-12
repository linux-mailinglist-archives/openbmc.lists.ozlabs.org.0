Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B26B2D8862
	for <lists+openbmc@lfdr.de>; Sat, 12 Dec 2020 17:46:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CtYTQ0fxGzDqfF
	for <lists+openbmc@lfdr.de>; Sun, 13 Dec 2020 03:46:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::244;
 helo=mail-oi1-x244.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TcbkQj+w; dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CtYRv3qqQzDqfc
 for <openbmc@lists.ozlabs.org>; Sun, 13 Dec 2020 03:45:31 +1100 (AEDT)
Received: by mail-oi1-x244.google.com with SMTP id s2so13858261oij.2
 for <openbmc@lists.ozlabs.org>; Sat, 12 Dec 2020 08:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=j1HIhXJASopSHIWczFMRIPyMr8ppd3okjfPEQWfKLB4=;
 b=TcbkQj+wK4bKdaHhkWCmcRkx0pWS+SG727YujBJzxVrMyxagG/wlbYafrkMBlvjYIC
 nzztS8YBXqEkIsO3sC/ir1WlKvSb2KVDM37JTK1GpRvRT94l3ri6VVYL4s3V667YtvH6
 p+tfFWrMoyeXP/FSw39FYzzl1J/v66xI6OnS8ovJSrdGxvMgwwgpdu30ieJcs1MeRQ5n
 VkLaXAmHgJtdb4iK21vmBnA/p4H8y4sqIXvRGhO71WKSlrR+MS6bwWFKbs8agdgdDjg1
 KHjtEcR8/dQuwY7ACeqt/68tQNjYhYiSBkz44mO9NcQ3SMgPtGpTwBVW9bDgugfzm5+8
 7RBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=j1HIhXJASopSHIWczFMRIPyMr8ppd3okjfPEQWfKLB4=;
 b=VVDbn0npNFgJ6W2PgxoF5MjsL93ZXhNgX3tmSUtlyzBuO9XIF4XxzYfQ1WOj+uPD/Q
 3Xv0T7tw/proAsuPfg0uaUMuA739LRpdiiDqbBiHHZ4y0TPjcFmeFH+T1OcAeQlluIk+
 DgW21mEHka+NEyupOa3T9V2eXuzo2JDgeVSgcwl6Ub4VSErxJg4ymz67jolNkgeoL+rF
 WqJgmMnM8gdBE2C1HvFCwpEo+U0Z3gZi0TIsju+bfwfqDTTx/orPkEJvto5Fynnyievm
 29Ba+M+IKbWUX3auRa49iL4G6D7zqi8oz906C7Zc8LkQJnwWPuyoBlb22Wwxco3EA1Cc
 V55w==
X-Gm-Message-State: AOAM532ZPE0PO7XG68/d6muqkgQWq16vuJfJJCcP91G3vX78ekbIqY5O
 +OdL6Onqa8p0nA2A+sUB2NY=
X-Google-Smtp-Source: ABdhPJx6KJadDbpC4GdotSZT7cSA+i+XmF0Gzw039M/eGwqvkL8UADqtEke531S6FlsY+z9HIXSHDA==
X-Received: by 2002:a05:6808:8f0:: with SMTP id
 d16mr13108658oic.47.1607791528318; 
 Sat, 12 Dec 2020 08:45:28 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id o6sm2645573oon.7.2020.12.12.08.45.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 12 Dec 2020 08:45:27 -0800 (PST)
Date: Sat, 12 Dec 2020 08:45:26 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Kun Yi <kunyi@google.com>
Subject: Re: [PATCH linux hwmon-next v5 2/3] hwmon: (sbtsi) Add documentation
Message-ID: <20201212164526.GA29303@roeck-us.net>
References: <20201211215427.3281681-1-kunyi@google.com>
 <20201211215427.3281681-3-kunyi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201211215427.3281681-3-kunyi@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: mark.rutland@arm.com, linux-hwmon@vger.kernel.org, jdelvare@suse.com,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, supreeth.venkatesh@amd.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Dec 11, 2020 at 01:54:26PM -0800, Kun Yi wrote:
> Document the SB-TSI sensor interface driver.
> 
> Signed-off-by: Kun Yi <kunyi@google.com>

Applied. Note that I added the SPDX identifier to match
the one used in the source file.

Guenter

> ---
>  Documentation/hwmon/index.rst      |  1 +
>  Documentation/hwmon/sbtsi_temp.rst | 40 ++++++++++++++++++++++++++++++
>  2 files changed, 41 insertions(+)
>  create mode 100644 Documentation/hwmon/sbtsi_temp.rst
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index fd6fae46b99c..509fb3bcafb2 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -151,6 +151,7 @@ Hardware Monitoring Kernel Drivers
>     pxe1610
>     pwm-fan
>     raspberrypi-hwmon
> +   sbtsi_temp
>     sch5627
>     sch5636
>     scpi-hwmon
> diff --git a/Documentation/hwmon/sbtsi_temp.rst b/Documentation/hwmon/sbtsi_temp.rst
> new file mode 100644
> index 000000000000..9f0f197c8aa2
> --- /dev/null
> +++ b/Documentation/hwmon/sbtsi_temp.rst
> @@ -0,0 +1,40 @@
> +Kernel driver sbtsi_temp
> +==================
> +
> +Supported hardware:
> +
> +  * Sideband interface (SBI) Temperature Sensor Interface (SB-TSI)
> +    compliant AMD SoC temperature device.
> +
> +    Prefix: 'sbtsi_temp'
> +
> +    Addresses scanned: This driver doesn't support address scanning.
> +
> +    To instantiate this driver on an AMD CPU with SB-TSI
> +    support, the i2c bus number would be the bus connected from the board
> +    management controller (BMC) to the CPU. The i2c address is specified in
> +    Section 6.3.1 of the SoC register reference: The SB-TSI address is normally
> +    98h for socket 0 and 90h for socket 1, but it could vary based on hardware
> +    address select pins.
> +
> +    Datasheet: The SB-TSI interface and protocol is available as part of
> +               the open source SoC register reference at:
> +
> +	       https://www.amd.com/system/files/TechDocs/56255_OSRR.pdf
> +
> +               The Advanced Platform Management Link (APML) Specification is
> +               available at:
> +
> +	       http://developer.amd.com/wordpress/media/2012/10/41918.pdf
> +
> +Author: Kun Yi <kunyi@google.com>
> +
> +Description
> +-----------
> +
> +The SBI temperature sensor interface (SB-TSI) is an emulation of the software
> +and physical interface of a typical 8-pin remote temperature sensor (RTS) on
> +AMD SoCs. It implements one temperature sensor with readings and limit
> +registers encode the temperature in increments of 0.125 from 0 to 255.875.
> +Limits can be set through the writable thresholds, and if reached will trigger
> +corresponding alert signals.
