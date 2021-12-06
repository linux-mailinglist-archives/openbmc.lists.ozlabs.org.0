Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CAD46AE3B
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 00:05:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7Jtn1bVHz2yb6
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 10:05:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=o+Hq59pJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=o+Hq59pJ; 
 dkim-atps=neutral
X-Greylist: delayed 1125 seconds by postgrey-1.36 at boromir;
 Tue, 07 Dec 2021 10:05:17 AEDT
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7JtP6HGzz2x9K
 for <openbmc@lists.ozlabs.org>; Tue,  7 Dec 2021 10:05:17 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-184-96.tukw.qwest.net
 [174.21.184.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 1ABA15B1;
 Mon,  6 Dec 2021 15:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1638831916;
 bh=AGZUvdoz1R/W4UGcI1sQgiuXPO1E1UwVokdQHmJX2XY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o+Hq59pJTf0HeC60xL18SQ1NRlYfPzNViiEaAFvLov1s302L/L9DIpY/cUfw4XD8g
 UM9m0iZdUijm6HcJAemqg/QgxQafZaSmj5CjxIW3s0FqzWFPJ9bqyNyTNwX+Az5/q9
 rm5Gve+vEkPdOYHJrfPJ7+kTIXCv0Boi9ND6kDc0=
Date: Mon, 6 Dec 2021 15:05:14 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: Guenter Roeck <linux@roeck-us.net>, g@hatter.bewilderbeest.net
Subject: Re: [PATCH 1/2] hwmon: add Delta AHE-50DC fan control module driver
Message-ID: <Ya6XKtxREvocOXow@hatter.bewilderbeest.net>
References: <20211206224419.15736-1-zev@bewilderbeest.net>
 <20211206224419.15736-2-zev@bewilderbeest.net>
 <28719505-ace1-bb04-bbc2-043c56b0db7d@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <28719505-ace1-bb04-bbc2-043c56b0db7d@roeck-us.net>
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
Cc: linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org,
 Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Dec 06, 2021 at 03:02:49PM PST, Guenter Roeck wrote:
>On 12/6/21 2:44 PM, Zev Weiss wrote:
>>This device is an integrated module of the Delta AHE-50DC Open19 power
>>shelf.  For lack of proper documentation, this driver has been developed
>>referencing an existing (GPL) driver that was included in a code release
>>from LinkedIn [1].  It provides four fan speeds, four temperatures, and
>>one voltage reading, as well as a handful of warning and fault
>>indicators.
>>
>>[1] https://github.com/linkedin/o19-bmc-firmware/blob/master/meta-openbmc/meta-linkedin/meta-deltapower/recipes-kernel/fancontrol-mod/files/fancontrol.c
>>
>>Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>>---
>
>[ ... ]
>
>>+
>>+static const u8 AHE50DC_FAN_TEMP_REGS[] = { 0x8d, 0x8e, 0x8f, 0xd0 };
>>+static const u8 AHE50DC_FAN_SPEED_REGS[] = { 0x90, 0x91, 0x92, 0x93 };
>>+static const u8 AHE50DC_FAN_FAN_STATUS_REGS[] = { 0x81, 0x82 };
>>+#define AHE50DC_FAN_VIN_REG 0x88
>>+#define AHE50DC_FAN_CHIP_STATUS_REG 0x79
>
>PMBus registers:
>
>	PMBUS_STATUS_WORD               = 0x79,
>
>	PMBUS_STATUS_FAN_12             = 0x81,
>	PMBUS_STATUS_FAN_34             = 0x82,
>
>	PMBUS_READ_VIN                  = 0x88,
>
>        PMBUS_READ_TEMPERATURE_1        = 0x8D,
>        PMBUS_READ_TEMPERATURE_2        = 0x8E,
>        PMBUS_READ_TEMPERATURE_3        = 0x8F,
>        PMBUS_READ_FAN_SPEED_1          = 0x90,
>        PMBUS_READ_FAN_SPEED_2          = 0x91,
>        PMBUS_READ_FAN_SPEED_3          = 0x92,
>        PMBUS_READ_FAN_SPEED_4          = 0x93,
>
>This is quite obviously a PMBus device. Why not use the PMBus driver ?
>
>Guenter

Ah, so it appears -- not familiar enough with the constants to recognize 
it immediately I suppose (and wasn't expecting PMBus on this particular 
device).  Let me try that.


Thanks,
Zev

