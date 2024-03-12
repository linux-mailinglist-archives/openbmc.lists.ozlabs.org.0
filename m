Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9902879F9E
	for <lists+openbmc@lfdr.de>; Wed, 13 Mar 2024 00:19:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=ES8+2yK7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvV2X0C2Kz3cGw
	for <lists+openbmc@lfdr.de>; Wed, 13 Mar 2024 10:19:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=ES8+2yK7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=lists.ozlabs.org)
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TvV1v567Cz2ykn
	for <openbmc@lists.ozlabs.org>; Wed, 13 Mar 2024 10:18:27 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:712b:6300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 1EBA16C5;
	Tue, 12 Mar 2024 16:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1710285504;
	bh=EYwBh95DHhz9r9QVHywR28E43x2Y+m0ywwZ1m0v/Ne0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ES8+2yK7wjiIjMBDw8RuZ3IxWwX8x2LPTh/Meu+zvnyCL6IYGxZdM9aT3q79RhEi6
	 5Ky10wTfYLgc2llCsDKgXtoEiF2wNm0KL+qU//WdHHqw/CQbnyyBucXq13DMfgwMFY
	 rJFLg1Ruo/C2nb9DLfhytK/QIcETYK369yehGzEA=
Date: Tue, 12 Mar 2024 16:18:22 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Ban Feng <baneric926@gmail.com>
Subject: Re: [PATCH v4 3/3] hwmon: Driver for Nuvoton NCT7363Y
Message-ID: <cd63bec7-01c6-466e-b772-3a3d3d90a7d5@hatter.bewilderbeest.net>
References: <20240227005606.1107203-1-kcfeng0@nuvoton.com>
 <20240227005606.1107203-4-kcfeng0@nuvoton.com>
 <a90ed00c-f836-4fb6-8191-9974937e3eb7@hatter.bewilderbeest.net>
 <CALz278Zgfgob573vgWz4PgC7vb=i8xt3kC1hSjo_cQi00B0XAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALz278Zgfgob573vgWz4PgC7vb=i8xt3kC1hSjo_cQi00B0XAg@mail.gmail.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, jdelvare@suse.com, corbet@lwn.net, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, naresh.solanki@9elements.com, billy_tsai@aspeedtech.com, kcfeng0@nuvoton.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, kwliu@nuvoton.com, linux@roeck-us.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Mar 06, 2024 at 11:35:31PM PST, Ban Feng wrote:
>Hi Zev,
>
>On Sat, Mar 2, 2024 at 4:19 PM Zev Weiss <zev@bewilderbeest.net> wrote:
>>
>> On Mon, Feb 26, 2024 at 04:56:06PM PST, baneric926@gmail.com wrote:
>> >From: Ban Feng <kcfeng0@nuvoton.com>
>> >
>> >NCT7363Y is an I2C based hardware monitoring chip from Nuvoton.
>> >
>> >Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>
>> >---

<snip>

>> >+
>> >+static const struct of_device_id nct7363_of_match[] = {
>> >+      { .compatible = "nuvoton,nct7363" },
>>
>> As far as I can see from the code in this driver, it looks like this
>> driver should also be compatible with the nct7362; shall we add the ID
>> table entry for it now?  (Though I only have a datasheet for the
>> nct7362, not the nct7363, so I don't know exactly how they differ.)
>
>As far as I know, the difference between these two ICs is 0x2A~0x2C
>Fading LED for 7362, and 0x2A Watchdog Timer for 7363.
>In my v1 patch, I indeed add the nct7362 to the ID table, however,
>this makes it more complicated and our datasheet isn't public yet.
>I think maybe supporting more chips will be done in the future, but not now.
>

If the only differences are in features the driver doesn't utilize, I'm 
not clear on how it adds any complexity.  As far as I'm aware, neither 
datasheet is public (NCT7363 nor NCT7362), so if we're going to have a 
public driver for one, why not also do so for the other?  It's a single 
additional line -- and furthermore, having made that change and tested 
it out, I can report that the driver seems to work just fine on NCT7362 
hardware as well.


Zev

