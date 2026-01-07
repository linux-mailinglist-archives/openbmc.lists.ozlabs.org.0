Return-Path: <openbmc+bounces-1102-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0388BD00512
	for <lists+openbmc@lfdr.de>; Wed, 07 Jan 2026 23:31:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmjS05sQzz2yGq;
	Thu, 08 Jan 2026 09:31:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767793612;
	cv=none; b=fugyzLwPhk8FvFqWelKRg+ntfABoKH6xTWHjjZaGlsrkBsRXdqPSBDLI3G6ry8YcftVbrNa1xcDV3cpl3JAWmrRj+3RLBlN2pRBsbhP5yUJwuRkV3DMaLdZjhjM+2NAeVvm+Vlf0dsgtASPqV3BnEsQe9F0u4OUwBNcgWAkrI/Thu5SqxhVrYrHZX3s8tczabKEYYlzhoBWtoLjekvxb68AGZT6mL6ydU79QVrdSfKHX37zZBFiBxP8YtCmGO0ojLiAgxqKwk0L/vNNDUtcp4vrJUywV4HI3KCdpaEoIAnoyBcQ8bpJ7emE7F9QPK7YOHeOjVd0+eqh7+52nmoI7AA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767793612; c=relaxed/relaxed;
	bh=zbg60yhotFqS4lYQ4SPbRRNfljX1PZuvfnI5dpwkZJ8=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=Y+6AiTSTCjRM3PJieOs9y2ODKgiiYXVJceBAlWAb+OFqHnDLWhdESTMg1u72Qme4DZfyk/fVb/YTPECznK98oQ7BrECawWwT6Xm7gETIb0hoWwYusUOdXLfw7cdkIcX6S/maZn74XCTy5rOtZTpmURlLc7R5a9tl7o7vqD3PGatF5sNHAJxOcBj7sipjImp9eHUnlo/VtwSCrZxXVA4k1cp+i8OStPI6G06ZwCsCYoOJ17VFzA6X7YasMPkzpMXaxvYlQ5iqKvID1hRMADZttnYIwj6inSddLhAA4VBsgsSnMOLLCBa0IxY9N5sOhwNkPbj+7yj57RRYQD7S01kMcA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mwgMciWt; dkim-atps=neutral; spf=pass (client-ip=209.85.167.43; helo=mail-lf1-f43.google.com; envelope-from=mike.rudenko@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mwgMciWt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.43; helo=mail-lf1-f43.google.com; envelope-from=mike.rudenko@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmTpy42W0z2xZK
	for <openbmc@lists.ozlabs.org>; Thu, 08 Jan 2026 00:46:49 +1100 (AEDT)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59b30275e69so1821670e87.1
        for <openbmc@lists.ozlabs.org>; Wed, 07 Jan 2026 05:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767793546; x=1768398346; darn=lists.ozlabs.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=zbg60yhotFqS4lYQ4SPbRRNfljX1PZuvfnI5dpwkZJ8=;
        b=mwgMciWtJ8+NhloOeGcFEmwqQZNhx97nfQTfpB5zqXZCVIjHXkeFcnXVwDbeZwaIbL
         dlJMBuXO/mOeonScbidqDR8g1kr6YqQHI3zt+RJAZsvQgLx5OqeF1hMu4drAibTe26ay
         TSuzIN/I2TwPWMnh0B4f5f9S7F/M3W/UYjYX/Nz0cXISCEsrEkCnUsXswuB7qDkCDJqX
         X7qzDcuKjDwIgM+fqe54cD8lwNjeRda0AyQreGXEafllJGCpjwe3e1xStMHPmPxa0Hpy
         22L70mJAhIYULLYcSD6jVmbcqKdP/6tGf4UI2EGObf4eiSl3wS2AmbgMB0xiaYfOkCpw
         WLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767793546; x=1768398346;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zbg60yhotFqS4lYQ4SPbRRNfljX1PZuvfnI5dpwkZJ8=;
        b=Xy46XNfUQiQ8Uea/waGhEUZYfXDbkoioN3/V+eRrNbBcCHZNic+258qetYD+pNkIZP
         PrwyZ2CgC2iFzZzEm59V/OlajpV2tV3Ehv7M3Qq1Hmy0A58iRZ+1dTxBacyT47OnssxK
         72fqdoLvdU1WK3EAEd+BEJnTwTY9uR4+KYDBfq6hFD/DxCvK7spWEh8u0E+6rEwK5fqx
         GF1+qvPgE9uQ0ZPnbhxwpotTUS1T9H4YrNKZZmkTxDRFcrA35wiyJ4KGy/dMpObA3ZfK
         dVB8BjK9HEXDb86CcVS4a3K+ag1EHR3zbkV2YFuUcyFB6E4G8MCAtQCm5hNaOdUeSFp9
         Z/4g==
X-Forwarded-Encrypted: i=1; AJvYcCUWVg/RdVvGCbmxTkZQegnlYxlx/p0kIJP1fPSutc8Hv43HqE3/SBi1/Y9ylGmm6utnzmqAiPA9@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy9BYX0leTZIDvQ3KalLAApibFQJ4Mib3J4XUuvujd/g1H7h/KN
	/54DirculCh/vlr1uTaKtzr7RcafzoLyZkRYmpb4iP4/A6yxEVFfNtoy
X-Gm-Gg: AY/fxX79t/94TmEEFHjRCSh+czHnZ/FIwWibOlZkASIy+VKtSa9CUnMyvpNt0m6YcNR
	pGwFNUorRpHlf67onN4M+FnDNX6qwb+KwnQqacJm7e2LI3B7XmrvDJhcU2+goJUtS6J9+fNDx8M
	NyL2mmrZLIa64krWsiPCnyOGD5fbDoYOfEaMDZIkpdNRL1mRFRUd0ZUlmwjKbokJz3KoIMOsk22
	WHymp1FbOnIxUKy2slmPUh0sDzRvDNR2PF5oiKyXtpg2jJAJ9Q27D4hyvvrjKrwMUgtWzu7AY9N
	0dKodgtIs+BiIN2QWuncPjIDhnV06+utxLgMTWN0bBXUqXaougHxC1egHa8bDB3PFe9vHaxmN2p
	8nIkmjOAYj18/v1750BBrSPOCn555WsHuNgQ+0F14hgHdn8AeR2TfHl3aOLpX8q9YA2r3h/pD
X-Google-Smtp-Source: AGHT+IFBvFdbxlKvEOgpHQQ8YktwaenfQmmG9RkrtS+47ehkEyiqafqKukfyFwzDbyon83pp4CA81A==
X-Received: by 2002:a05:6512:2399:b0:59b:730d:4a57 with SMTP id 2adb3069b0e04-59b730d4b44mr510415e87.39.1767793545398;
        Wed, 07 Jan 2026 05:45:45 -0800 (PST)
Received: from razdolb ([77.220.204.220])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b669418b6sm1224545e87.20.2026.01.07.05.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 05:45:45 -0800 (PST)
References: <20251216-upstream_pcie_rc-v7-0-4aeb0f53c4ce@aspeedtech.com>
 <875x9fuj7i.fsf@gmail.com>
 <SEYPR06MB513404EB419B7850159F3CC29D84A@SEYPR06MB5134.apcprd06.prod.outlook.com>
User-agent: mu4e 1.10.9; emacs 30.2
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Andrew  Jeffery <andrew@codeconstruct.com.au>, Bjorn
 Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan
  Sadhasivam
 <mani@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v7 0/7] Add ASPEED PCIe Root Complex support
Date: Wed, 07 Jan 2026 16:40:09 +0300
In-reply-to: <SEYPR06MB513404EB419B7850159F3CC29D84A@SEYPR06MB5134.apcprd06.prod.outlook.com>
Message-ID: <875x9dcz9c.fsf@gmail.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


Hi Jacky,

On 2026-01-07 at 02:28 GMT, Jacky Chou <jacky_chou@aspeedtech.com> wrote:

> Hi Mikhail Rudenko,
>
>> First of all, thank you for your efforts in getting this driver upstreamed! I am
>> trying to understand whether this driver supports PCIe devices that have an I/O
>> port BAR, where CPU access to I/O ports is required for proper device
>> operation.
>>
>> If I understand correctly, this line in the Aspeed 2600 dtsi file declares the I/O
>> port range:
>>
>>     ranges = <0x01000000 0x0 0x00018000 0x00018000 0x0 0x00008000
>>
>> During system initialization, the pci_remap_iospace() function in
>> arch/arm/mm/ioremap.c maps the physical address range
>> 0x00018000-0x00020000 to the virtual address PCI_IO_VIRT_BASE
>> (0xfee00000). After this mapping, inb() and outb() calls work by converting I/O
>> port addresses to virtual addresses starting at PCI_IO_VIRT_BASE, then
>> performing reads and writes to those virtual addresses.
>>
>> What I don't understand is this: according to the Aspeed 2600 datasheet, the
>> address range 0x00000000-0x0fffffff (which contains
>> 0x00018000-0x00020000) is mapped to Firmware SPI Memory. This would
>> mean that outb() operations get routed to memory-mapped SPI flash instead of
>> PCIe.
>>
>> It seems like there's a missing piece to this puzzle. Could you help clarify how
>> this is supposed to work?
>>
>
> Thank you for pointing this out, and sorry for the confusion.
>
> You are correct that, as things stand, this does not make sense from a real hardware perspective.
>
> In fact, the I/O addressing support you noticed was something we experimented with internally
> only. There is no actual hardware design on AST2600 that supports PCIe I/O port addressing in
> this way. To enable those experiments, we modified our internal kernel accordingly, but this was
> never intended to represent real, supported hardware behavior.
>
> This is our mistake for leaving this description in the DTS, as it can indeed be misleading. We
> will remove this part to avoid further confusion.
>
> Thank you again for your careful review and for bringing this to our attention.

Thank you for prompt reply and for getting this clarified!

> Thanks,
> Jacky


--
Kind regards,
Mikhail

