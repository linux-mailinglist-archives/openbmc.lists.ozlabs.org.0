Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43792A41236
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2025 00:19:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1KZ864Btz3ckP
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2025 10:19:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::331"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740153422;
	cv=none; b=lpaI6aBFZRVm7SPztIK0Ur5cFfy5ZSZuKSOTbiBNDq+K1xSoU7EVHKo/ZqwOsgDhP/l6pNzomifkk8TT9K5P89yooXTORrDbO3v1FFM4B25EAbxykD287VxUPbGbT+fystXcov2Z20ewcCynxTP/1KI5oDSCPG2wuaZqlopw+6G9T2wLhNACLgQ6xoIZ3dAHuidCqT/uhQRel3mdOwlTQ4jsKYiqdooxJTDcRFWiwEtnXjKfmWdKgWGL4p2iJFubbYYHJQiUxcOFTMdsfgQFSBoz338y16o6RFtIPw/mi/3D7x7q0kPjev2edRPG2kxNeTC3a7fal/H4TbuVTYBuJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740153422; c=relaxed/relaxed;
	bh=l9F5nxMmTnOLDqUzVG81NMqrRzPg/w7BaJ+m4JpJ2SY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oKwA80pJeZVOsbsjvRqzuV79FcTfn0P1Q13DAkulmx0W2hmJjYWih7/SUNLbebWAIarf5zSnYeqPk/e9P5F3sK4IVMJulFvCwF10qZLy/GJ3MfH5ewgI84rvdG1ywh+YkQjlxKvEhRvaehKoQechexUmemhfFkz+K/z8I9iSVqNb0HRfyht4IOynzZnvGIUk72WP7UoKXn5wAYaWvScJaCbRY3uZMgjvYgEXuToZHEwdpUTNzUQr7eegGSK4Jj6UKXtzoz8WwcUhogyipoSixxigJ0ZFvebGe2job/O8I18iVaPUwea/AKVsO9IXEUSZU2Y7bhxVRJC0aUDQ4jE9UA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=043Ot2Ys; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com; envelope-from=dlechner@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=043Ot2Ys;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com; envelope-from=dlechner@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yzvrr3Mrzz301x
	for <openbmc@lists.ozlabs.org>; Sat, 22 Feb 2025 02:56:58 +1100 (AEDT)
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-72726025fa5so591748a34.0
        for <openbmc@lists.ozlabs.org>; Fri, 21 Feb 2025 07:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740153415; x=1740758215; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l9F5nxMmTnOLDqUzVG81NMqrRzPg/w7BaJ+m4JpJ2SY=;
        b=043Ot2YsAlSRfVnBUNBy3wYAvlwrGU4JMoJIt7s2ZzAON4e6heo0aMMs+75GYNJ67d
         QsjaKr7C17UlQWSBU4F4EUbXyCmtR1PvZezUTC5vBCTpGTURI7uExc57oBh7GvXH/LHr
         WvVk96V4F89l5jzdybmS/Uu2b1akQpIUCfXNawVUiT2jdQBug10Uck3mg+gxKMxwBMwe
         5jGbgkzyARAqLC428mE0GSeFxuBKMzlvGWJsu4h1L32FFHhW92v0KKUMrlv2saqNnyCv
         JF4yIkNiOA/+Kr4cz48IFEfqnmB0mahax9VFAgMGzmOSXWaZIClSFUzaBu/25I0/JoN4
         05dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740153415; x=1740758215;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l9F5nxMmTnOLDqUzVG81NMqrRzPg/w7BaJ+m4JpJ2SY=;
        b=g5wP7qnukDcyoGSCt5xAk4KskNKhREYWRUPic+MZsyIvgul9fBEqvhDcDQaIGbr72W
         QAzP3TY4crlBXgFSc7zJ2xCg4TIv3nsBRi9I4tThySA2HX8oT2Bs97oIzDPr+Q1Ian8g
         0PwGeAl781wod0Eq//1Z5AVw1D7xDOZN1Y7tcF4jzD8h9/lMyyz5GZxjnF2GkvAymthd
         VESBOCQe0Dk6v/zoy7vwnmLuw0WNj0WQG1Q/zYb8ubznT8U6v5BjAkV07baDtNTyzJn9
         /eXJOkeDJIIUUaSUBA8TIqBqO+N81q15qBKP5f/bDAI/dduaw/0bxG7rXvGkQPfcytBW
         e8AA==
X-Gm-Message-State: AOJu0Yxi7HtRoX63qwU8SDEJxfUJv98G1Aopw7/+QZzjoXAkM7jUriHp
	op/v+n6eyIqbi0/LhrVtix07cQiXN5m4PP36q4ckGtxYkatmgtD2glyVeLbAkR8=
X-Gm-Gg: ASbGncsQse91b762pbaRBAtIyzo9vDhb1m7fadPJcTVJP79L6AvW9hM387J54buKuUO
	38e2RJ3Ev3wcd+ETfpxv2H+DiMoaLzzNbcMMfktivtdBShcvC5jX7wxPvrcV3Df9lnMRm1f0dzO
	DOzipt8kE2DqU1BHFXQzJJ+GbDVGZLvJKgSB0hwLafFHiCQLxkYmHNZsnQlJrHbctQw7x+GtjbY
	mKIwXzCkXtiFt6cvULCgrhWk2eRbn/fpLJocmwwwCymuYEdt7MsxRLPtw5/plUaXpeWwulBNG+Z
	Vs+NJ3LUVlakqfwoWZ7ZTRbkYV9GB123Z0divJDXaiCxLUuSCpxI2oqns5kh3lI=
X-Google-Smtp-Source: AGHT+IGwdePluqvFd8Q0eiG58yiq9bE9z1fiRut+KTbsys8KsALDylQjaPnt2SvRTO0/s/20Lz6iig==
X-Received: by 2002:a05:6830:6685:b0:727:2681:731 with SMTP id 46e09a7af769-7274c27b78bmr3002665a34.26.1740153415309;
        Fri, 21 Feb 2025 07:56:55 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2bc9edca34esm4833893fac.18.2025.02.21.07.56.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 07:56:53 -0800 (PST)
Message-ID: <8975b119-fe24-463a-b163-dce702df3cdd@baylibre.com>
Date: Fri, 21 Feb 2025 09:56:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: iio: adc: add NCT7201 ADCs
To: Eason Yang <j2anfernee@gmail.com>, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, jic23@kernel.org,
 lars@metafoo.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 nuno.sa@analog.com, javier.carrasco.cruz@gmail.com,
 andriy.shevchenko@linux.intel.com, gstols@baylibre.com,
 olivier.moysan@foss.st.com, mitrutzceclan@gmail.com, tgamblin@baylibre.com,
 matteomartelli3@gmail.com, marcelo.schmitt@analog.com,
 alisadariana@gmail.com, joao.goncalves@toradex.com,
 thomas.bonnefille@bootlin.com, ramona.nechita@analog.com,
 herve.codina@bootlin.com, chanh@os.amperecomputing.com, KWLIU@nuvoton.com,
 yhyang2@nuvoton.com
References: <20250221090918.1487689-1-j2anfernee@gmail.com>
 <20250221090918.1487689-2-j2anfernee@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250221090918.1487689-2-j2anfernee@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 24 Feb 2025 10:18:50 +1100
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

On 2/21/25 3:09 AM, Eason Yang wrote:
> Add a binding specification for the Nuvoton NCT7201/NCT7202 up to 12-bit
> ADCs with I2C interface.
> 
> Signed-off-by: Eason Yang <j2anfernee@gmail.com>
> ---
>  .../bindings/iio/adc/nuvoton,nct7201.yaml     | 57 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,nct7201.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,nct7201.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct7201.yaml
> new file mode 100644
> index 000000000000..830c37fd9f22
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct7201.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/nuvoton,nct7201.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton nct7201 and similar ADCs
> +
> +maintainers:
> +  - Eason Yang <j2anfernee@gmail.com>
> +
> +description: |
> +  The NCT7201/NCT7202 is a Nuvoton Hardware Monitor IC, contains up to 12 voltage
> +  monitoring channels, with SMBus interface, and up to 4 sets SMBus address
> +  selection by ADDR connection. It also provides ALERT# signal for event
> +  notification and reset input RSTIN# to recover it from a fault condition.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,nct7201
> +      - nuvoton,nct7202
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +

Maybe this was brought up before, but no power supply?

> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        adc@1d {
> +            compatible = "nuvoton,nct7202";
> +            reg = <0x1d>;
> +            interrupt-parent = <&gpio3>;
> +            interrupts = <30 IRQ_TYPE_LEVEL_LOW>;
> +            reset-gpios = <&gpio3 28 GPIO_ACTIVE_LOW>;
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3864d473f52f..fdc4aa5c7eff 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2831,6 +2831,7 @@ L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
>  S:	Supported
>  F:	Documentation/devicetree/bindings/*/*/*npcm*
>  F:	Documentation/devicetree/bindings/*/*npcm*
> +F:	Documentation/devicetree/bindings/iio/adc/nuvoton,nct7201.yaml

This (ARM/NUVOTON NPCM ARCHITECTURE) doesn't look like the right place for
adding a stand-alone chip. You will need to start a new section like:

NUVOTON NCT7201 IIO DRIVER

>  F:	Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
>  F:	arch/arm/boot/dts/nuvoton/nuvoton-npcm*
>  F:	arch/arm/mach-npcm/

