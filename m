Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB9E80894D
	for <lists+openbmc@lfdr.de>; Thu,  7 Dec 2023 14:36:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GgpNMgAX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmFfm2Kyrz3d8R
	for <lists+openbmc@lfdr.de>; Fri,  8 Dec 2023 00:36:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GgpNMgAX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmFf66852z3cRy
	for <openbmc@lists.ozlabs.org>; Fri,  8 Dec 2023 00:35:57 +1100 (AEDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50be03cc8a3so892892e87.1
        for <openbmc@lists.ozlabs.org>; Thu, 07 Dec 2023 05:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701956151; x=1702560951; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DE2zFskkDTSnqEUr5OB7Tct7a2e7vqqhqiLJL3O/hkk=;
        b=GgpNMgAXzV9W8sOWT8Bvb2ZRdct/BbGaVJwugjsHoyuZRBuCeciFF66yVMFWZJ/Und
         BpbS0kCm6uh31x6h4n6583Ctf6hqOBdwQtGBlgIjeW+A/xDfBMvN0ES2PeeY4+EXbCHs
         Qjn1VgJ/tFUL2x+r/k+Mwv4UldD8rOjFmax26WPB33I6nP1m6pcJM/G3KYWIDJ6R9vYm
         Kyp0zqQNN0kmYWLEJeFTPmbbX+MY3pqSTX2hb75FypGi0x2FfT9gajssED8Hf0qOAdiG
         TpR5kiF/Jp+rxN9nFqQWC2gD0sWDjkYFf3JyThlwWIutZc5KSYlGz8VR9wup3hi1mOx7
         sTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701956151; x=1702560951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DE2zFskkDTSnqEUr5OB7Tct7a2e7vqqhqiLJL3O/hkk=;
        b=ISsIKChyTusBYNZJa2Tojs0esbUVrakdfMm9ZKFDtFYOSosawR+22Ni+nOl/UDbEGz
         4a4di6Q2vrZfUqE3uPfYl8oQ/Dlip13NH6yaflZ5zAZ7E+RRzJTX0zVzYTrClDuyqayA
         enQAdRIuhCi2vxkZtkL0a39lHF9EybRD5IFGTt8FFiziwcLi9Dpai/1xIQxBPZXbVXOu
         7/6clUQlYkHwyUjsMlILIer2cVM4dwIHslkIXGycad3MTuT55DYXPXMBobTpOkNz2xk4
         2Xcgvw9b5M5ZM96sz8hM12x1G4SUh2F1rP1QLo+uPawxSIZO2f/0n1b8fFoMHhKtwaCH
         OwgQ==
X-Gm-Message-State: AOJu0YyaVA4IF/U3P2mZ7i712QjjRwj37gik2mYSiOHg9MFtKmGtIIEA
	e0dXJA340mEexFCv3xCsMZI=
X-Google-Smtp-Source: AGHT+IFpxi32i/H2T4l/U2UQxsPFB0f94jLoEstgg/x9ZHx2sGmv9RsyaRRUJxbdN9o8b/cu5/ilBA==
X-Received: by 2002:a05:6512:3124:b0:50c:a39:ee37 with SMTP id p4-20020a056512312400b0050c0a39ee37mr1567241lfd.109.1701956150819;
        Thu, 07 Dec 2023 05:35:50 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id bp42-20020a05651215aa00b0050bf8852fb1sm174527lfb.45.2023.12.07.05.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 05:35:50 -0800 (PST)
Date: Thu, 7 Dec 2023 16:35:47 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next 09/16] net: mdio: Add Synopsys DW XPCS
 management interface support
Message-ID: <jqwhgthwxfge6y4nv5mdnojqu76m4pi2mt2x6kwqiuqntcwj67@mewh42eey5ny>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
 <20231205103559.9605-10-fancer.lancer@gmail.com>
 <20231205133205.3309ab91@device.home>
 <cv6oo27tqbfst3jrgtkg7bcxmeshadtzoomn2xgnzh2arz4nwy@wq5k7oygto6n>
 <15e6857a-b1d1-465a-945e-6f31edac62fb@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15e6857a-b1d1-465a-945e-6f31edac62fb@lunn.ch>
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Tomer Maimon <tmaimon77@gmail.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jakub Kicinski <kuba@kernel.org>, Maxime Chevallier <maxime.chevallier@bootlin.com>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew

On Wed, Dec 06, 2023 at 06:01:30PM +0100, Andrew Lunn wrote:
> > > You shouldn't use inline in C files, only in headers.
> > 
> > Could you please clarify why? I failed to find such requirement in the
> > coding style doc. Moreover there are multiple examples of using the
> > static-inline-ers in the C files in the kernel including the net/mdio
> > subsystem.
> 

> The compiler does a better job at deciding what to inline than we
> humans do. If you can show the compiler is doing it wrong, then we
> might accept them.

In general I would have agreed with you especially if the methods were
heavier than what they are:
static inline ptrdiff_t dw_xpcs_mmio_addr_format(int dev, int reg)
{               
        return FIELD_PREP(0x1f0000, dev) | FIELD_PREP(0xffff, reg);
}               
        
static inline u16 dw_xpcs_mmio_addr_page(ptrdiff_t csr)
{       
        return FIELD_GET(0x1fff00, csr);
}       

static inline ptrdiff_t dw_xpcs_mmio_addr_offset(ptrdiff_t csr)
{
        return FIELD_GET(0xff, csr);
}

> But in general, netdev does not like inline in .C
> file.

I see. I'll do as you say if you don't change your mind after my
reasoning below.

> Also, nothing in MDIO is hot path, it spends a lot of time
> waiting for a slow bus. So inline is likely to just bloat the code for
> no gain.

I would have been absolutely with you in this matter, if we were talking
about a normal MDIO bus. In this case the devices are accessed over
the system IO-memory. So the bus isn't that slow.

Regarding the compiler knowing better when to inline the code. Here is
what it does with the methods above. If the inline keyword is
specified the compiler will inline all three methods. If the keyword isn't
specified then dw_xpcs_mmio_addr_format() won't be inlined while the rest
two functions will be. So the only part at consideration is the
dw_xpcs_mmio_addr_format() method since the rest of the functions are
inlined anyway.

The dw_xpcs_mmio_addr_format() function body is of the 5 asm
instructions length (on MIPS). Since the function call in this case
requires two jump instructions (to function and back), one instruction
to save the previous return address on stack and two instructions for
the function arguments, the trade-off of having non-inlined function
are those five additional instructions on each call. There are four
dw_xpcs_mmio_addr_format() calls. So here is what we get in both
cases:
inlined:     5 func ins * 4 calls = 20 ins
non-inlined: (5 func + 1 jump) ins + (1 jump + 1 ra + 2 arg) ins * 4 calls  = 22 ins
but seeing the return address needs to be saved anyway in the callers
here is what we finally get:
non-inlined: (5 func + 1 jump) ins + (1 jump + 2 arg) ins * 4 calls  = 18 ins

So unless I am mistaken in some of the aspects if we have the function
non-inlined then we'll save 2 instructions in the object file, but
each call would require additional _4_ instructions to execute (2
jumps and 2 arg creations), which makes the function execution almost
two times longer than it would have been should it was inlined. IMO in
this case saving 2 instructions of the object file isn't worth than
getting rid from four instructions on each call seeing the DW XPCS
MCI/APB3 buses are the memory IO interfaces which don't require any
long-time waits to perform the ops. Thus I'd suggest to keep the
inline keywords specified here.

What is your conclusion?

-Serge(y)

> 
>    Andrew
