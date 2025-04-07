Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29ABAA7F133
	for <lists+openbmc@lfdr.de>; Tue,  8 Apr 2025 01:44:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWm4w08fVz3dpM
	for <lists+openbmc@lfdr.de>; Tue,  8 Apr 2025 09:44:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::629"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744033965;
	cv=none; b=VPy/DjYthjI8uUHRsMk/zXPicYoubrEHthj3BMi3GYMSDxo8c/WnUyKEq9AP1KQoC5V5TxXOZjxz1afhuzIS10CpkYNEh9Yv9/ufS7CddjX2isfDy7xc5vy3FbdoEi3YIjSOzyDOEqvnW4hFHSD7zi+31bAnzOE5jNikScpfaDjXg1RLxv3DLjlF5E/RQWK+qhYvCSmr1trT2CjBi4rWyl8xXbwteN23PBLjvSWgq7qa0+Qlv6t4dvWqUDhqncAw2gAvx0TbhLlUGHwiylpvFkn/e6+uS4r/8yORtVbKll6/9nHW2e4BiVy8DKYdOCjeQby+hAITOpH0VvpqDWc1sA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744033965; c=relaxed/relaxed;
	bh=Sc9bjfbFTJWsLLxoFhUmoW8tGe7xoApEt1z4G7mllw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i1mCL5g6Af/1yhJ6nNgD+uOciO7BdgOsSw8soOSfyTKPL3WG6Q7VMizG018bvS9smVqMSihEugldaA++LE4jdtOYN+DpBHchdO3RAXP11idxQSXnTE/EN8YjCXcUgMPDtS3Q6gAfGrR6n7jc/8jTm69AXJyPZCM/762PFgE/1msVfrSIwCh7GFo8MaToyJFympnYOWcmSUexKevh3xz5qjj+lc/RB83LCzx7wgQwKAx+lKwVyjIfhk1WWP/Ue+JyqZNMzP1KegHaxj74qj263+MkjAEIgzTbceAKOBlxgSmmHVCRj7VkMhhRy287jqThJIB6SwvC5jXCUPk2FNeHQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EvZ0xSxt; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EvZ0xSxt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWVyh1Jwvz2y3b
	for <openbmc@lists.ozlabs.org>; Mon,  7 Apr 2025 23:52:44 +1000 (AEST)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so698840866b.3
        for <openbmc@lists.ozlabs.org>; Mon, 07 Apr 2025 06:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744033961; x=1744638761; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sc9bjfbFTJWsLLxoFhUmoW8tGe7xoApEt1z4G7mllw8=;
        b=EvZ0xSxt/v2+UxBcPAPofhQegRWdxn/w8pyK4O57yFXEtyjKtO3wCgwXjfbwUdZtb6
         ik4I5L7BGYhacKbUvZUSU3wQ3El+vjtaAQ/kCFwSABK8nFRhiEzvKQjgkDXB+cx+Hs2x
         9NmYKm2h0Niey3FaiEMGORwrHSQDaFdKYEEZgOeul7NWiYxORuXB5WJnC59sx/XLWZY5
         BH3qGfbwdbGp9qKWSec/9MCCiyXvQ0rhteI8HoVfeZ3dAaZCnYdAlQRKUEw9m7mhKpk2
         x2AoRp/hI/4YXWGltz+KXJNiwl2hMia4wt+AFVqUrXwG+7MGw13f7ZiXc5l6rjERhmFv
         yraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744033961; x=1744638761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sc9bjfbFTJWsLLxoFhUmoW8tGe7xoApEt1z4G7mllw8=;
        b=a4EpDgTHp0tGJFhfaD2ytO6vjrt5x1QKFH9qp/KQNsm9QZ2l6BsopPVvOyOmHBvhYE
         Nth8+bZ36UQOz4MGF3G8tnZbJ0MLoHAbscuqgeZDfDeaRy21B6PfPDM3X5qK28+PGIfb
         nPirkLEE+tqLKqwU8BTCSjPeRtq7dHJKqQiKkqSNR4bRIBjbOITMVX0e99MVzPfEGBsx
         BIsX2XBJjvFG9EWsOyc4+balfhLIDqsM49HQteYW3ac2lBazuxsv5xv7FpWESk+zEMZr
         4FVUGKtJbU8o1JGbkXyIBF27PvoF95XcqJ24yYlq7fetxfE9paz+/Xl7FfouFVH/IT3F
         3X9g==
X-Forwarded-Encrypted: i=1; AJvYcCUVtEu3pdgxLgilPzu71NYknnhEofmtJGCztoJolEo3px+I8lmE4ivwIz0Jy53oGS/JNSIsUFCB@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywe0aJczR9pVieD8sxZjjL86RvGL/zJjQK01iB3ivWGiL756Bwq
	HTkMAlBfLFs3M0XTBm5u35mfwIFqVNue+yCpYaoCZBsncIfwT+UpQQbLTgjriX1mfGYEwdTNoEZ
	enV2eASv2sHYLZTkHVT/PO+7nQl0=
X-Gm-Gg: ASbGncsj4Mh8Y8tBlGPdJ7D6w19+XKUOIwmr2NwZJRk4x02xIqhXaUsrI2O5ZDYSu/r
	CZis6aJ9NdnO8Md+fDYn7ghwpDRERc7YyoWsQuqUx5H4ja1riypkerTdBkeDZZ3Z4omoCBDFiHB
	ch4sW7TxY4dabdv9lI0DX+OBoDKX38OyuwMfU=
X-Google-Smtp-Source: AGHT+IE1K4KGssIOLmHorIy1oCMgGcf7x4fMQ+kzwtl7JUPWt1uEuI2jriF2sy5AIG+moU2mpDY/XKHdVul9jZaECm8=
X-Received: by 2002:a17:907:7ea1:b0:ac7:b363:862c with SMTP id
 a640c23a62f3a-ac7d6d7f0a5mr1097419366b.34.1744033960765; Mon, 07 Apr 2025
 06:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250221090918.1487689-1-j2anfernee@gmail.com> <20250222152537.2a24d80f@jic23-huawei>
In-Reply-To: <20250222152537.2a24d80f@jic23-huawei>
From: Yu-Hsian Yang <j2anfernee@gmail.com>
Date: Mon, 7 Apr 2025 21:51:41 +0800
X-Gm-Features: ATxdqUFpGtpfSv-jv-HNzINZS8uIB_7m0tbvAuk-oq0i06yBUK38wFK3X9HpdrU
Message-ID: <CA+4VgcJL7pi6y55N6QaUKNkOTqTKkF8dAo+5syvRCbx7gW+ehQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] iio: adc: add Nuvoton NCT7201 ADC driver
To: Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 08 Apr 2025 09:43:52 +1000
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
Cc: tgamblin@baylibre.com, herve.codina@bootlin.com, tmaimon77@gmail.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, tali.perry1@gmail.com, yhyang2@nuvoton.com, marcelo.schmitt@analog.com, robh@kernel.org, lars@metafoo.de, benjaminfair@google.com, javier.carrasco.cruz@gmail.com, openbmc@lists.ozlabs.org, ramona.nechita@analog.com, matteomartelli3@gmail.com, olivier.moysan@foss.st.com, thomas.bonnefille@bootlin.com, dlechner@baylibre.com, KWLIU@nuvoton.com, conor+dt@kernel.org, alisadariana@gmail.com, joao.goncalves@toradex.com, andriy.shevchenko@linux.intel.com, gstols@baylibre.com, chanh@os.amperecomputing.com, avifishman70@gmail.com, venture@google.com, mitrutzceclan@gmail.com, linux-kernel@vger.kernel.org, nuno.sa@analog.com, krzk+dt@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Jonathan,

Thanks again for the review

Jonathan Cameron <jic23@kernel.org> =E6=96=BC 2025=E5=B9=B42=E6=9C=8822=E6=
=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=8811:25=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On Fri, 21 Feb 2025 17:09:16 +0800
> Eason Yang <j2anfernee@gmail.com> wrote:
>
> Hi Eason,
>
> Not sure if I asked this before, but this is a device that seems
> to be typically used for hardware monitoring and there are a number
> of similar sounding device in drivers/hwmon/
>
> That raises a couple of questions:
> 1) Is it compatible with any of those existing drivers?

No, we need a new driver to do the ADC conversion for NCT7201/NCT7202.

> 2) Why IIO rather than HWMON?

A driver for NCT7201 with more functionality is available in the iio
adc subsystem.
If the chip is used for hardware monitoring, the iio->hwmon bridge
should be used.
>
> There isn't normally a problem with having a hardware monitoring
> related device supported by IIO, it is just good to know if your
> usecase makes that a good idea.  We have the iio-hwmon bridge
> driver to solve the problem of a device than can be used either
> as a generic ADC or as a hwmon type monitoring device (which tends
> to have more alarms etc)

Yes, we also verify the iio-hwmon bridge.

>
> Jonathan
>
>
> > Change since version 4:
> >  - Fix comments
> >  - Add interrupts and reset-gpios to the DT example
> >  - Use the FIELD_PREP and FIELD_GET
> >  - Add use_single_write in regmap_config
> >  - Use regmap_access_table
> >
> > Change since version 3:
> >  - Fix comments
> >  - Don't put nct720"x" in the name, just call it nct7201
> >  - Remove differential inputs until conversions are finished
> >  - Add NCT7201_ prefix in all macros and avoid the tables
> >  - Correct event threshold values in raw units
> >  - Add with and without interrupt callback function to have the event
> >    config part and one that doesn't
> >  - Remove print an error message if regmap_wirte failed case
> >
> > Change since version 2:
> >  - Remvoe read-vin-data-size property, default use read word vin data
> >  - Use regmap instead of i2c smbus API
> >  - IIO should be IIO_CHAN_INFO_RAW and _SCALE not _PROCESSED
> >  - Use dev_xxx_probe in probe function and dev_xxx in other functions
> >  - Use devm_iio_device_register replace of iio_device_register
> >  - Use guard(mutex) replace of mutex_lock
> >  - Use get_unaligned_le16 conversion API
> >
> > Changes since version 1:
> >  - Add new property in iio:adc binding document
> >  - Add new driver for Nuvoton NCT720x driver
> >
> > Eason Yang (2):
> >   dt-bindings: iio: adc: add NCT7201 ADCs
> >   iio: adc: add support for Nuvoton NCT7201
> >
> >  .../bindings/iio/adc/nuvoton,nct7201.yaml     |  57 ++
> >  MAINTAINERS                                   |   2 +
> >  drivers/iio/adc/Kconfig                       |  11 +
> >  drivers/iio/adc/Makefile                      |   1 +
> >  drivers/iio/adc/nct7201.c                     | 487 ++++++++++++++++++
> >  5 files changed, 558 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,n=
ct7201.yaml
> >  create mode 100644 drivers/iio/adc/nct7201.c
> >
>
