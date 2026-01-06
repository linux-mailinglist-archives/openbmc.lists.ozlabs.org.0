Return-Path: <openbmc+bounces-1096-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BACCFB32F
	for <lists+openbmc@lfdr.de>; Tue, 06 Jan 2026 23:06:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dm4xk55srz2yDk;
	Wed, 07 Jan 2026 09:06:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767695498;
	cv=none; b=Iix++RwnsfiBGW9KsrDPhEszHuC6cA1LI5GVy9os2WEcs+1LPmavMGuT4NVkbFR4ZmNQcRYfQWWe1I9EjgJZZ9EBaDiz0106C8J2Gq2XER5GWNosZj0K4KPJ08oRm9DHyumxf5QSlB0ure2koJoWRAgVATMAlBPgEjE/ul1qWZkm2Ph21We2tEeY2fZ5h9f+Nv4vEYeIYkW4zcH8NlLgL6LbDKl9xgzRkFvRsEtVSN8GFRNChrbIxDomBELfmQTjlt9K1VSSaxIqFWxpfR6pGLcgIz953GSsVWjZC1xbIK0hITSGMs3oi/gh043wBjkvO1JJGLHBTEyPOpBg+p90kg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767695498; c=relaxed/relaxed;
	bh=NsJJOzya3cvYihpIwq796R0nHpBIF37n18oyXT0fuvE=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=lsUlsFKHlyutThMNbNo+BZ40B5129BzYxOypjk5mfmBM7aU/hXAXHKg3NHn1+KlNwIpMkJd0sECdyByG6Mrtq9P2WUR4pOC+Z2/862u53mAuZtVSe/bz8EIVgYM+bGWQcVwvrefaWIthKCVrG5RsYDIQ+333v5iBiB/UnBahsZue+qTxHMaKLQrbduTNNpOGVMO8OKe2t7g1VofBFxcwtnBQ/tOxbDLo6HVJDR6x8k0bB9EFv5tY5ftmM75nsIVLC3JdOm7IOwgLGDEsgLnoDwzO7Awz1CEXaEqMN2BXlsv1wY7ITP8Ano3Gz8RU6ibqGulHbM78gVK1V8He2yt+Xw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kdtNsG/r; dkim-atps=neutral; spf=pass (client-ip=209.85.167.45; helo=mail-lf1-f45.google.com; envelope-from=mike.rudenko@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kdtNsG/r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.45; helo=mail-lf1-f45.google.com; envelope-from=mike.rudenko@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlnX91fpvz2y7c
	for <openbmc@lists.ozlabs.org>; Tue, 06 Jan 2026 21:31:36 +1100 (AEDT)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59577c4c7c1so2827487e87.1
        for <openbmc@lists.ozlabs.org>; Tue, 06 Jan 2026 02:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767695433; x=1768300233; darn=lists.ozlabs.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=NsJJOzya3cvYihpIwq796R0nHpBIF37n18oyXT0fuvE=;
        b=kdtNsG/rIBhlABS/6tS/VbaKh4g4Nxr7lnGjispjdLH/PnoQilGioGRff6ARvgJM+s
         IgJhdaX1IWfG2WB/0b5aWC25ouyw+LfH97oA0E9cbpH3wv6Iu4v6r9/Gz7vXn1wdYDtK
         YHZSaEufEoibfvODUZo5QSPVLPsTI0vz+bqNvkD6HVA7V860MzwyotS5TZaiv7wNC9OF
         DEK8mj1yrCebtmbwQ1/+B/+fDQlvGD+Rpsa/GoWaiREBSiNt5IS+shkVlYgahnxgE384
         AF5cmMKYZ1sgNXc4k1UJ7O1lYSSgGW+hZ9cXBG06/DYxxOLAu4zweW5mdbCTTyCbjdVW
         c4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767695433; x=1768300233;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NsJJOzya3cvYihpIwq796R0nHpBIF37n18oyXT0fuvE=;
        b=tAf4YB52lSDHeVWEwbE3HbKG3170tn5WRfnUQKT2r10cVCmSNOdcyusdOqDsS5undl
         e42ef/0wNsfR/eDeBSuxKZ062efRjuHKxM3CN34fZilT5gWnl66LyjdvwvBUrvTUl1J4
         732ZrXMU1Tk2NIv/WA0RgYSB9vZc6muGFnBiOwHT2ohkkDp1qvd/dyNzgymi7PNJUtRN
         8SFSTjLeD010xR+n3UiTqlbV44W0nSqOnFVl1nTh0PTk4YVEpue+dcj6DQlPNrH8SiiZ
         ydTyvmPHEZ/8rwB29CW0oRRG8+BshJ7lV1vjlW+hSeF1Cw0bqfqDyfwb0cjsZ2OAtF9O
         gTuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUM+AxSUvhqAYisHxMqw6XdRlPmPSEOjmkIt48jnmSoyTJsUzL8UQi7yGrSaOYpMJmMXAIOz0BW@lists.ozlabs.org
X-Gm-Message-State: AOJu0YywHpzOmjPeIOsXxY+Qt6numKCgajp/4WCczmd/A9QR9IfKEbZm
	qWQI7ekV4SRoTeOeusTQANsxpf8ooCY/8z2IYjCutmi/azkZXKBf87PD
X-Gm-Gg: AY/fxX7wIm1svrLPBZHWvkWt6JYcQxRkJ/IDUMObhy5QbaeeN9suzEXqitLUAl/hZLj
	fB2LGNb7VGkeId5hw/g0gjbEeDyOmQF8O6oNxqM4iv85X8Qu4ac7/JyEs7OQUYg4cmtlRwXt/B/
	Ik38clV4v+/VQISrGq5qW3XhMdfodY4IuOso8u24zpbJrlKstfWI44rSuN9XqnBu7KPAICDtgcL
	Yhg9bvhImm9lrQHDF/pR06CCCZrDwGwH9Wpk9auSPqEHAkJFe5SfBXkhf0pzWlawvTrNCjUBh6h
	ksHsJGOB1KNCzcpykvleWWITlO5XDAueIPBmC9WcZK90NT1MOletGEQTd1rPGKcYySkqMfvz8af
	IlJMPrdjlgwP08qFvTto8DtkF/umtvF4T7wOgjgqoXCCRODksln60NCDyNfu2a8zCQom8K60D
X-Google-Smtp-Source: AGHT+IFmb+80wkKZdKxRHpidfReqxOHlUmLsipFT1rzzTuNx9rKmNHYR/9f9tfCpJuYk6MXE4I4WOw==
X-Received: by 2002:a05:651c:1148:b0:37b:9361:711d with SMTP id 38308e7fff4ca-382eae68ac5mr6985121fa.8.1767695432846;
        Tue, 06 Jan 2026 02:30:32 -0800 (PST)
Received: from razdolb ([77.220.204.220])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb8dadc0sm4315921fa.33.2026.01.06.02.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 02:30:32 -0800 (PST)
References: <20251216-upstream_pcie_rc-v7-0-4aeb0f53c4ce@aspeedtech.com>
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
 linux-aspeed@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andrew
 Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, Mikhail Rudenko <mike.rudenko@gmail.com>
Subject: Re: [PATCH v7 0/7] Add ASPEED PCIe Root Complex support
Date: Tue, 06 Jan 2026 12:58:40 +0300
In-reply-to: <20251216-upstream_pcie_rc-v7-0-4aeb0f53c4ce@aspeedtech.com>
Message-ID: <875x9fuj7i.fsf@gmail.com>
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

On 2025-12-16 at 09:49 +08, Jacky Chou <jacky_chou@aspeedtech.com> wrote:

> This patch series adds support for the ASPEED PCIe Root Complex,
> including device tree bindings, pinctrl support, and the PCIe host controller
> driver. The patches introduce the necessary device tree nodes, pinmux groups,
> and driver implementation to enable PCIe functionality on ASPEED platforms.
> Currently, the ASPEED PCIe Root Complex only supports a single port.
>
> Summary of changes:
> - Add device tree binding documents for ASPEED PCIe PHY and PCIe RC
> - Update MAINTAINERS for new bindings and driver
> - Implement ASPEED PCIe PHY driver
> - Implement ASPEED PCIe Root Complex host controller driver
>
> This series has been tested on AST2600/AST2700 platforms and enables PCIe device
> enumeration and operation.

First of all, thank you for your efforts in getting this driver
upstreamed! I am trying to understand whether this driver supports
PCIe devices that have an I/O port BAR, where CPU access to I/O ports
is required for proper device operation.

If I understand correctly, this line in the Aspeed 2600 dtsi file
declares the I/O port range:

    ranges = <0x01000000 0x0 0x00018000 0x00018000 0x0 0x00008000

During system initialization, the pci_remap_iospace() function in
arch/arm/mm/ioremap.c maps the physical address range
0x00018000-0x00020000 to the virtual address PCI_IO_VIRT_BASE
(0xfee00000). After this mapping, inb() and outb() calls work by
converting I/O port addresses to virtual addresses starting at
PCI_IO_VIRT_BASE, then performing reads and writes to those virtual
addresses.

What I don't understand is this: according to the Aspeed 2600
datasheet, the address range 0x00000000-0x0fffffff (which contains
0x00018000-0x00020000) is mapped to Firmware SPI Memory. This would
mean that outb() operations get routed to memory-mapped SPI flash
instead of PCIe.

It seems like there's a missing piece to this puzzle. Could you help
clarify how this is supposed to work?

--
Kind regards,
Mikhail Rudenko

