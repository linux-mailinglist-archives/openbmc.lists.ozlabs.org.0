Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF8F4C64E0
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 09:32:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6YXt3h97z30KP
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 19:32:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=DSLlx5cp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=DSLlx5cp; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6YXT6tn7z2xXZ
 for <openbmc@lists.ozlabs.org>; Mon, 28 Feb 2022 19:32:25 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net
 [174.21.187.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id AA922586;
 Mon, 28 Feb 2022 00:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1646037144;
 bh=CCCJGLwREFudXAQ71006Rww33yHRQbbj3lk5h/iUP7I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DSLlx5cpu6/a3Z/YK5BUN+3pKJVP2HvMkrVnWDg5ngfiReScKDSrUrRYagxb8EEAV
 xlTlmYlbiISSanrSe/gT5KWmFVlnlIxpwqWTPLSgGkA6JG9Z7UkN3ha1pckO11vYyY
 9ttb1mGvnXpmAnThWty/HDef4OFb6Ngeo8xXY20E=
Date: Mon, 28 Feb 2022 00:32:23 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 3/5] hwmon: (nct6775) Split core and platform driver
Message-ID: <YhyIlz5hW4u6qrDc@hatter.bewilderbeest.net>
References: <20220227154447.GA766647@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220227154447.GA766647@roeck-us.net>
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
 Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org,
 Renze Nicolai <renze@rnplus.nl>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Feb 27, 2022 at 07:44:47AM PST, Guenter Roeck wrote:
>On Sat, Feb 26, 2022 at 05:30:45AM -0800, Zev Weiss wrote:
>> This splits the nct6775 driver into an interface-independent core and
>> a separate platform driver that wraps inb/outb port I/O (or asuswmi
>> methods) around that core.
>>
>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>
>I think it would be much better to convert the entire driver to regmap
>and not just use regmap for i2c. This way all register read/write
>operations can be hidden behind regmap, and the read/write callbacks
>are unnecessary. The tmp401 driver gives an example how to do this -
>essentially implement reg_read and reg_write functions in struct
>regmap_config, then handle all register accesses through regmap.
>
>Couple of additional comments inline.
>

Alright, that sounds reasonable -- I'll work on an entirely regmap-based 
v2 (and address the other points as well).


Thanks,
Zev

