Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19ED5A032DC
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2025 23:44:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRq364xFzz3gDg
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2025 09:43:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4860:4864:20::32"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736175035;
	cv=none; b=Oj2VMy86TORrVHw8LEI5DvanJ9koSsW2K4mvtL+XGTe0nECC0rcP3PR2ULmtcfum9mNGREp4fJU5YXpcHr5aeL3FrYzoOQkMrifsxzAsrG6SmpRjqoTrP8u54kMvJJ2H33YcY7lPEqm2oyifO4zBCYjCyZ1utbbwMD2nwbmWaKTKg+YX60cvjEL5uwgDCOOk4xTt3+fdk4CKrTQ1k70ewvHxHWzblvtMWK6W3SNL47hEdaUVweE0sKvyVgCW36mUslj80X21GLeZfO3y85c6jJFNjHjyHKNPnxQVMmwyaTIqTHJeUy7ycAXIA/xdkIWW8H9cLb27hn0CiisfBaQY9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736175035; c=relaxed/relaxed;
	bh=2Vxw3Mx8N/hDAKeHqp+8V3fNQAbCKUACtVfPIZJk7BE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hyQFFsKa41ktpN4aJejy2KPrDcMTwHWf8fiSI5gJi6daDK7yv86FpY3IvT6jK1uQOLR+WfDp/Rr1tHtGSMZCBZp2dY+c259x0+N27NuQCzr9Kylx9GcfgVOqxFRKFOrDr5ytV1JFj2Cce0Cjjhv1zfy9cYRGL7ewusfCkDcygtoc6q/+WZ0FHFuHDZnaP1Bj29GSPvdfMIMM9FORfmeLIBWXqDYA/SUz89A0aF4EY9TZYtwi2W9kRBEmXbsOLI0Yo2rnDT+mawA1yHulClzjfsrYcQMDuugrR+4ZXrKAxYGZHP0iIZiTSIj+DPFGCriloZ7AIde1hMLQw+FgL+Z6Xw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=OOIks3NN; dkim-atps=neutral; spf=pass (client-ip=2001:4860:4864:20::32; helo=mail-oa1-x32.google.com; envelope-from=dlechner@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=OOIks3NN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2001:4860:4864:20::32; helo=mail-oa1-x32.google.com; envelope-from=dlechner@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRcYP2xYJz30B8
	for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2025 01:50:30 +1100 (AEDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-29e91e58584so10086688fac.2
        for <openbmc@lists.ozlabs.org>; Mon, 06 Jan 2025 06:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736175022; x=1736779822; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Vxw3Mx8N/hDAKeHqp+8V3fNQAbCKUACtVfPIZJk7BE=;
        b=OOIks3NN/hwBddGoVpkt++aidy7lwC9dFgcRsqdPbxN1OBWomEVxNhj0Iilm/AFUB3
         GZprhEWhAPg4UVQaEPTn7CP7VOLdR0geFv4Eyl6SLWqXXuFMeooIfTnu7KVhVJ8GrN4D
         KlNrHlEi1M0HlKeGn8KB2Pqxplaw3mpJ/BCTueafU4/2oq15DaDgbEQIZGsubFeRIqDo
         a0uUbSWPsCHVebGMEv5rqSOERMmwdG/B4U7Hih3L9KsEJnoROWuMAqOZ02uzrDbqVkV8
         sblg63Etm6MhAQ00dhJhiHU7AcFJ1DYmkSl16LpQomqGDTyua6ckmRaW8LEgasB7IbHT
         +yjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736175022; x=1736779822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Vxw3Mx8N/hDAKeHqp+8V3fNQAbCKUACtVfPIZJk7BE=;
        b=tYori2J+p7VusiVHVRu+TWp3yIdTfjJpmbLEosJRqBu/OKD9Cba6D9kT43iLiubDnF
         Y4UyOn2os8yUHZT+RUhMaolA+M/EmqgsiwIIeuuzeXlGyF2VIMs28TP0qrmm4ZA/gkJA
         RtwKIKiugM0YDF0c4E1DLWaye+ect0yUdH3hL6OrvLiEwGwcVyeiD1VLx+fExJ9KK16E
         GZzffb1AP+hJw6QWYy8vGD85mkTI58da5stB+ochU8AH/cXsI6ls0VYafzZaI7ocCKM5
         OSeWV3F/yyLzoHVsPqF/oo/zap55ierK+qE/yDFQ2SBcfnHiavO1/MBY3Qak4hzWi36C
         5/Nw==
X-Forwarded-Encrypted: i=1; AJvYcCXVuDSPi27LQ1dKSHMqrKccGYptbQ1hAivAdmMN/Bq/rPNrYQdOczx2RP0UMVqyWdfFcF21WAKB@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxLOEhRMf2+CnAPmct2QPqGw9VFi2oTkv2yG7ScW2htNyFeQiYP
	rDVJ3dOw3HfkaJLarWkRotcykR/Mx1LVt3LJUi2QRfO9XgqFohsIEnpjWj4jcu8=
X-Gm-Gg: ASbGncsuX2acohJus1GzvWIthKc0WAE8AYIfcCVc9tXOMoiUq4ZmXhnE+oDog0Pd3fS
	4tDOO4dhYI8Bh4x1VY1i8NyLp0Li3EVMEXsptBeeaHtxTR6fErRjT9q/Lpwb+Sy2k0kaZGcKkmn
	WLl2FBqxq5kLNZrzTV5v+RUkZ/S3sB/OSbrdSi8Q8gATjhpNH8LBplsU7zxSdCrj46rb9M/y65a
	43yxW7qx5qxFY3wqeNuyrln2xaGyHJlH4qY3NTUpeT2RN6BCw5cD8LQeOUneHj1jT7XjmuMnmmi
	PYObdJuzkuKssQJb8Q==
X-Google-Smtp-Source: AGHT+IGHWEdxTp5zhyCbR+/gT72Zro13mUmLbxDzfT8L1TIAIkymARuWNbGkjWke8WKfrMR5lpr8Fg==
X-Received: by 2002:a05:6870:430d:b0:29e:8485:197b with SMTP id 586e51a60fabf-2a7fb00afd6mr31908359fac.2.1736175021803;
        Mon, 06 Jan 2025 06:50:21 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2a7d751e457sm11753372fac.25.2025.01.06.06.50.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 06:50:20 -0800 (PST)
Message-ID: <2a4f0a3d-3288-4f59-8c18-c53ab4b596e5@baylibre.com>
Date: Mon, 6 Jan 2025 08:50:18 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] iio: adc: add Nuvoton NCT7201 ADC driver
To: Yu-Hsian Yang <j2anfernee@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20241226055313.2841977-1-j2anfernee@gmail.com>
 <20241226055313.2841977-3-j2anfernee@gmail.com>
 <Z26aMVayh-EdYA8n@smile.fi.intel.com>
 <CA+4VgcK4apNKWXhWvViPU6JfyXu9ZTQ7-TBauTaYUHnp0j1s-w@mail.gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <CA+4VgcK4apNKWXhWvViPU6JfyXu9ZTQ7-TBauTaYUHnp0j1s-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 07 Jan 2025 09:43:11 +1100
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
Cc: tgamblin@baylibre.com, herve.codina@bootlin.com, tmaimon77@gmail.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, tali.perry1@gmail.com, yhyang2@nuvoton.com, marcelo.schmitt@analog.com, robh@kernel.org, lars@metafoo.de, benjaminfair@google.com, javier.carrasco.cruz@gmail.com, openbmc@lists.ozlabs.org, matteomartelli3@gmail.com, olivier.moysan@foss.st.com, thomas.bonnefille@bootlin.com, KWLIU@nuvoton.com, conor+dt@kernel.org, alisadariana@gmail.com, nuno.sa@analog.com, krzk+dt@kernel.org, chanh@os.amperecomputing.com, avifishman70@gmail.com, venture@google.com, mitrutzceclan@gmail.com, linux-kernel@vger.kernel.org, gstols@baylibre.com, jic23@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 1/6/25 2:33 AM, Yu-Hsian Yang wrote:
> Dear Andy,
> 
> Thanks for your comments.
> 
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> 於 2024年12月27日 週五 下午8:14寫道：
>>
>> On Thu, Dec 26, 2024 at 01:53:13PM +0800, Eason Yang wrote:
>>> Add Nuvoton NCT7201/NCT7202 system voltage monitor 12-bit ADC driver
>>>
>>> NCT7201/NCT7202 supports up to 12 analog voltage monitor inputs and up to
>>> 4 SMBus addresses by ADDR pin. Meanwhile, ALERT# hardware event pins for
>>> independent alarm signals, and the all threshold values could be set for
>>> system protection without any timing delay. It also supports reset input
>>> RSTIN# to recover system from a fault condition.
>>>
>>> Currently, only single-edge mode conversion and threshold events support.
>>

...

>>
>>> +static const struct regmap_config nct7201_regmap8_config = {
>>> +     .name = "vin-data-read-byte",
>>> +     .reg_bits = 8,
>>> +     .val_bits = 8,
>>> +     .max_register = 0xff,
>>> +};
>>> +
>>> +static const struct regmap_config nct7201_regmap16_config = {
>>> +     .name = "vin-data-read-word",
>>> +     .reg_bits = 8,
>>> +     .val_bits = 16,
>>> +     .max_register = 0xff,
>>> +};
>>
>> I don't see how these configurations will prevent, e.g., debugfs to access
>> 16-bit registers via 8-bit IO and vice versa.
>>
> 
> Read VIN info can use word read or byte read, and other registers
> should use byte read.
> 
> The design is that VIN info registers are used 16-bit debugfs to access and
> other registers are used 8-bit debugfs to access.
> 
> We need to probe 8-bit regmap and 16-bit regmap,
> but I have no idea how to prevent 8-bit IO to access 16-bit registers
> and vice versa.

You can do this with struct regmap_access_table via wr_table and rd_table
in the struct regmap_config.


