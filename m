Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC8B46AE37
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 00:03:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7Jrg5kMjz2yXv
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 10:03:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=N6GOlVN7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::333;
 helo=mail-ot1-x333.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=N6GOlVN7; dkim-atps=neutral
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7Jqg29mTz3bbv
 for <openbmc@lists.ozlabs.org>; Tue,  7 Dec 2021 10:02:54 +1100 (AEDT)
Received: by mail-ot1-x333.google.com with SMTP id
 47-20020a9d0332000000b005798ac20d72so15615013otv.9
 for <openbmc@lists.ozlabs.org>; Mon, 06 Dec 2021 15:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=st/asTmkM7F4+B0Newb37k11WjuAfycVbozvK69HWmk=;
 b=N6GOlVN7WA1CsGUtbGkabHO4qZaZbbYZTecXoIOrd1NTpa2nAbZKuZ1Do/aOqfSZy1
 SL8DSZHazNSclyGlAy0u9pG/etgxnf4lNUhMLNB/8A9DaMDv4ojURi1hf3eehH28D6tc
 PbiNWCWoftTQAPOPP5Hz/nQqxPRZ6avV1bn9CVbS3doVRPjzFEVCfKlHezyd7uxuKCaa
 RzbnPXbNIuzW80ahY3FlXkVIhUA+x5s8AUbNAwGyftK0+/CBS4tVOPosckxDP/p0tVZR
 11Wmp3oZKWG3JdKoyBCcq73KaJIjEh/ixF8ihA/fnzJx2S5rWehkSk7wNNC9p3Ij6v5c
 FUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=st/asTmkM7F4+B0Newb37k11WjuAfycVbozvK69HWmk=;
 b=uYFzPFom2JaUmIHycQZygxMAE3hzYKWlgZ5qxDEl32xL11TAyYsAdOamhmUZivTY0e
 CtOjWEEuxh/jk1A6WNNjOFCvC1I0cCmQaDCb2O8NHpj/nrhSCKwkRxf/b7w2lackdiku
 1iZGJYaB4O0WLjIGxAFJ236b19qoYtx57cYTl0BppdTrcgH2+oJ7QbR+r/unZnU3U8ja
 XPjzb+IBDBdvMEZyVry6N7oUqhlln34UMapc6O0GlHpaaUZ+YUxizyY/ek8FI0aimHLN
 mKIeBJ6kgVEN5/7S8rZh8EwsFK9vms5G5DtvsQKV88FzIZiAHLdQS/FaEhnkIYCIkJRF
 iDjA==
X-Gm-Message-State: AOAM533o4PEv1VuMhbTMt8lYTioWN2eIeDsgTNmQuVpY4XJ5D0p+wqKv
 AWdlRD7DR8naVeF9EC+PD2k=
X-Google-Smtp-Source: ABdhPJzRoKS9iNc5l+MR6V6YE5ct0vASm3U+GcljPR7GR6SX76+T2cLitEMDeJc5IC0eBJaAz3wEWQ==
X-Received: by 2002:a05:6830:2042:: with SMTP id
 f2mr31007837otp.89.1638831771221; 
 Mon, 06 Dec 2021 15:02:51 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 w4sm3177411oiv.37.2021.12.06.15.02.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 15:02:50 -0800 (PST)
Subject: Re: [PATCH 1/2] hwmon: add Delta AHE-50DC fan control module driver
To: Zev Weiss <zev@bewilderbeest.net>, linux-hwmon@vger.kernel.org
References: <20211206224419.15736-1-zev@bewilderbeest.net>
 <20211206224419.15736-2-zev@bewilderbeest.net>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <28719505-ace1-bb04-bbc2-043c56b0db7d@roeck-us.net>
Date: Mon, 6 Dec 2021 15:02:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211206224419.15736-2-zev@bewilderbeest.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: openbmc@lists.ozlabs.org, Jean Delvare <jdelvare@suse.com>,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12/6/21 2:44 PM, Zev Weiss wrote:
> This device is an integrated module of the Delta AHE-50DC Open19 power
> shelf.  For lack of proper documentation, this driver has been developed
> referencing an existing (GPL) driver that was included in a code release
> from LinkedIn [1].  It provides four fan speeds, four temperatures, and
> one voltage reading, as well as a handful of warning and fault
> indicators.
> 
> [1] https://github.com/linkedin/o19-bmc-firmware/blob/master/meta-openbmc/meta-linkedin/meta-deltapower/recipes-kernel/fancontrol-mod/files/fancontrol.c
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---

[ ... ]

> +
> +static const u8 AHE50DC_FAN_TEMP_REGS[] = { 0x8d, 0x8e, 0x8f, 0xd0 };
> +static const u8 AHE50DC_FAN_SPEED_REGS[] = { 0x90, 0x91, 0x92, 0x93 };
> +static const u8 AHE50DC_FAN_FAN_STATUS_REGS[] = { 0x81, 0x82 };
> +#define AHE50DC_FAN_VIN_REG 0x88
> +#define AHE50DC_FAN_CHIP_STATUS_REG 0x79

PMBus registers:

	PMBUS_STATUS_WORD               = 0x79,

	PMBUS_STATUS_FAN_12             = 0x81,
	PMBUS_STATUS_FAN_34             = 0x82,

	PMBUS_READ_VIN                  = 0x88,

         PMBUS_READ_TEMPERATURE_1        = 0x8D,
         PMBUS_READ_TEMPERATURE_2        = 0x8E,
         PMBUS_READ_TEMPERATURE_3        = 0x8F,
         PMBUS_READ_FAN_SPEED_1          = 0x90,
         PMBUS_READ_FAN_SPEED_2          = 0x91,
         PMBUS_READ_FAN_SPEED_3          = 0x92,
         PMBUS_READ_FAN_SPEED_4          = 0x93,

This is quite obviously a PMBus device. Why not use the PMBus driver ?

Guenter
