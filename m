Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A499E60C9
	for <lists+openbmc@lfdr.de>; Thu,  5 Dec 2024 23:47:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y48dX4zhqz3dHc
	for <lists+openbmc@lfdr.de>; Fri,  6 Dec 2024 09:46:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::22a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733425321;
	cv=none; b=gusdRAt6L4iCdMEd/q/VILY3ZqKtZ/rsnWEzSvYvq9fySXwt07CU4a7g7p1dHXveE+pkm2CvcEEC1ErRx2pYDz+wz3w+p6pVo8eXBul5PvFi9+LLAfp+OkyNL8ulTfVIatzt9d9gNQJdw+PzNR62t4ZjuaH33mTlwlJPe+Q7tu+Cx5df6GXofD64z+4kshUMVXGikhcsHvVahDrFgAZwZzesVAmAesmUsGQvNDFhlPBuaJMnTa42/8WDg7ndGiFXTJ0bA43quysSMBxdVz+nBADmiWnt/opXlAFsA6JAR/x2L04MVolCdJhkpASyo7RtZ6+qiEY7gdagHlPoYp8dHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733425321; c=relaxed/relaxed;
	bh=IaFOO/mfjUBixXAYtvSMoA7J8PbrmSflkGjEoxaTBzw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=lSx/2hcJultBnTOEyQ9PbOgdM9XHSOfypK1TDUa7hbKbz7iF1xH/XzFTyUYmh9ij7OHOQ7mWJyox3t8dxB4EMcTLm2haQxcXFXyuzapenUrsIPZZx7zNDakZcKSvHoXgHowlAfMt5Wifqgb4ibBfIrmECI0DM7Es1tDOByD5j1tmYgdigWFcRhEGmhpRlg+Qalbz23YsmeRBkB08PAOdvH3BD0lns+W0q4KvXg8z8/cPHa1EoBzz4xcyptjp6yyvHp+W6uRZ/N/oz5pbgtmUoGJt+J2M7IxFSBoJjTU1nc9SZRS3b6slqw8pUyC2kmCjfsTD2WfXinSSNJRXCo9dsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=N9QP3TVJ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com; envelope-from=dlechner@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=N9QP3TVJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com; envelope-from=dlechner@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y43fH4sTcz2xWT
	for <openbmc@lists.ozlabs.org>; Fri,  6 Dec 2024 06:01:57 +1100 (AEDT)
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3ea427001c5so805853b6e.3
        for <openbmc@lists.ozlabs.org>; Thu, 05 Dec 2024 11:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733425315; x=1734030115; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IaFOO/mfjUBixXAYtvSMoA7J8PbrmSflkGjEoxaTBzw=;
        b=N9QP3TVJIC5ZzhF4LNoxYY6nJkc8Y4LCY2bf97O+1aLvMGQXSt+Jb1D/BBh9jcMZmv
         TRpTJAhzvKB26HiQduIVACey70bE4+5NBtF0IMaGyQihJUSnaobhujEcUuXWewnkgZdG
         VLc/VyT6mmLXBOCQ8xyNOTXGsE7mAk/2Am59wJG4+/Nn9TGlAn95hUqbVarKbYs7GKBY
         ydGEbliJpPQzrwcy0E8rs1YV1JfmwaNp6tCaRWUcl0wrIz/LLV6VriyXe+lefyepnuRY
         P+kwAcVGQ5XjYlUmaf3a8fJ2KarJRAwYi1+Xbape91Hzt2jBX9SMmiFklZofZEJjK3QS
         iZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733425315; x=1734030115;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IaFOO/mfjUBixXAYtvSMoA7J8PbrmSflkGjEoxaTBzw=;
        b=UND6kNFVpDZr+Ty7VzlcYZFs8D/ZqIOGdXYPXjrdzXi7wr233HjvF1TOWVMC5ddP/v
         ClM6jvwvf/aKJhh9DsraOlX+ZALxbseLorcIUweuI177hjG1riquN4KA81/MSHSF2qhL
         0lNqiUBhZyA+kYgHtpEjIGriNyXaWkAyjuFOJjuhV8ku1UeTStwv4leFg/kdyN1+If9/
         t5FgKcubsjYeXu9mQa9ifbBxV/NcILjRT0fjauU9GRc9wpebB+a8QsKtjFv8RSi7mLrc
         zBIwxG3L8iwhDNUbE+W+V/L1KkTFP0CdTxkYHsBRvdNGfDuqUlBHgkcZ6KpqQEzbMQyn
         qZRA==
X-Gm-Message-State: AOJu0Yyi0t+BvjjXUT9zktRC4BlR8XhOBU0oHYN4HWdfR8+m4mESiuOY
	IN28G9a637pA7RPLfYsHMK4PSnZX8lVRaOCW6uH0Wbd57unxfpST1t2FiVHTGVE=
X-Gm-Gg: ASbGnctQu/WWnW8FqRutxKheZF430prkWZO840YACGa+UikhHBjD/Kzzp61nIeAEsIZ
	B6+a8puKNgHOA+WpSD2Ut7vsIxx89spStKL7oK6wJaYS5YK8Dg36bRXIpb4w0M7O/fCwMKNkbu8
	tF1GGsVOGMrYfwI0ca1ZEgdi3qUrJJ+cxImUaxv1sV2zqzsiBg5SGmMsFSeqEi/g9CIeUf1cjdn
	UwQPG+wnbYZGiPezbD73z5dqqBcMyDOjwXANm7nlu1Ny8/XiE83JkawsZyffsGslD9l6FHo6VEd
	f8aHgYgiGI4=
X-Google-Smtp-Source: AGHT+IFUDmVuFaNfj2c7OVLcgWFCxMQtCVuhMU/p4FrORrns3HwZaKiwq8nLNxh6O55/Euxmzx2I2w==
X-Received: by 2002:a05:6808:1898:b0:3e6:2772:2a4b with SMTP id 5614622812f47-3eb19c168a3mr59071b6e.9.1733425314900;
        Thu, 05 Dec 2024 11:01:54 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3eb07869655sm408646b6e.50.2024.12.05.11.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 11:01:53 -0800 (PST)
Message-ID: <a4cd4d74-93bc-4c63-a9ee-aa25957b96d9@baylibre.com>
Date: Thu, 5 Dec 2024 13:01:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] iio: adc: add Nuvoton NCT720x ADC driver
From: David Lechner <dlechner@baylibre.com>
To: Eason Yang <j2anfernee@gmail.com>, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, jic23@kernel.org,
 lars@metafoo.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 nuno.sa@analog.com, javier.carrasco.cruz@gmail.com,
 andriy.shevchenko@linux.intel.com, marcelo.schmitt@analog.com,
 olivier.moysan@foss.st.com, mitrutzceclan@gmail.com, tgamblin@baylibre.com,
 matteomartelli3@gmail.com, alisadariana@gmail.com, gstols@baylibre.com,
 thomas.bonnefille@bootlin.com, ramona.nechita@analog.com,
 mike.looijmans@topic.nl, chanh@os.amperecomputing.com, KWLIU@nuvoton.com,
 yhyang2@nuvoton.com
References: <20241203091540.3695650-1-j2anfernee@gmail.com>
 <20241203091540.3695650-3-j2anfernee@gmail.com>
 <8f5ca298-54ba-4274-a35d-83be868fcfc8@baylibre.com>
Content-Language: en-US
In-Reply-To: <8f5ca298-54ba-4274-a35d-83be868fcfc8@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Fri, 06 Dec 2024 09:46:33 +1100
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
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12/5/24 12:22 PM, David Lechner wrote:
> On 12/3/24 3:15 AM, Eason Yang wrote:


>> +static int nct720x_read_raw(struct iio_dev *indio_dev,
>> +			    struct iio_chan_spec const *chan,
>> +			    int *val, int *val2, long mask)
>> +{
>> +	int index = nct720x_chan_to_index[chan->address];
>> +	u16 volt;
>> +	unsigned int value;
>> +	int err;
>> +	struct nct720x_chip_info *chip = iio_priv(indio_dev);
>> +
>> +	if (chan->type != IIO_VOLTAGE)
>> +		return -EOPNOTSUPP;
>> +
>> +	guard(mutex)(&chip->access_lock);
>> +	switch (mask) {
>> +	case IIO_CHAN_INFO_RAW:
>> +		err = regmap_read(chip->regmap16, REG_VIN[index], &value);
>> +		if (err < 0)
>> +			return err;
>> +		volt = (u16)value;
>> +		*val = volt >> 3;
> 
> It seems strange that this is 13 bits when the chips are 8 and 12 bit.
> 
>> +		return IIO_VAL_INT;
>> +	case IIO_CHAN_INFO_SCALE:
>> +		/* From the datasheet, we have to multiply by 0.0004995 */
> 
> The scale is the same for both 8 bit and 12 bit chips?
> 
>> +		*val = 0;
>> +		*val2 = 499500;
>> +		return IIO_VAL_INT_PLUS_NANO;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +}
>> +

Sorry, I got confused. The difference between the two chips is the
number of channels, not the number of bits. Please ignore these two
comments.
