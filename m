Return-Path: <openbmc+bounces-1105-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D893D014D9
	for <lists+openbmc@lfdr.de>; Thu, 08 Jan 2026 07:53:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmwbx17kmz2yG3;
	Thu, 08 Jan 2026 17:53:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767855229;
	cv=none; b=F49Dj3Vk2MK2Few+APGNiJaCXVy5bQa0aJtG7q3Y2jXtSHLZ4Urf0TTPivVyMrRDgLm6l6q4yzeUNPULCF/zRofsMhTYdsI5qQ/BVfJbZxMMlgjx5U93cVImBYCMmollfaaHmu8zuds1BphTMYkDx7DQmB5I9m9+TVRzSQj+hqM/SWdB84WveernzlA2uXrvCjHBMA/7B0CWonF1YgyuBTU3wZAhX+wKKcW26A7mAOsjF/BDoN0t0zwcRHC843QcpL+rDcPpYWw+z9PVkjSrlghL/y94f4CMHkOh9MJBGHxQsDqpYAb1ch1oIEPg4WAXXZy7SfpaBAMcqVudx1sELA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767855229; c=relaxed/relaxed;
	bh=0byx3DZoRUiUQTtEbt34uHJmMg/kOxQkmRcK6Wjio08=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VSSsH+TZbomGQXTjSEM3D9St/BlVb+KobrDn3yqFrZbdIxn2MiR74elnVToJ0iJaXQzVf/USCtLHHK/FPM5BzLx4Hv3JXX6dFwMkrRw9vcrgXyE+1IGEti/uCOqMJFfow6S+2SJH9D9uK5mhbT0RpYUKX7F4uGe+bj4qJLXoLc8ypxfd6o5yKSmJhkZeHbuMG+OlujYQuKaIjp/30M/JNT/KkvHZQZP9Kk5yzYaPHn/Idndm4sNklJuJ8KYZaJ8mwbhEtce5llLDtMgUJUgUny+BWOCgSbGsoAIRgbd8REQqMCIeP1y9FJEgN6WWVw/snWTYeLispQoOXvUKKQ4wmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=h2pJqKSz; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=h2pJqKSz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmwbw1txsz2y8c
	for <openbmc@lists.ozlabs.org>; Thu, 08 Jan 2026 17:53:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1767855226;
	bh=0byx3DZoRUiUQTtEbt34uHJmMg/kOxQkmRcK6Wjio08=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=h2pJqKSzWUPMfqc5UdM7e0n7epIStbXL9QtR6WPNxrp8hBnhHpcbCMXRbInsBHSnm
	 sOdPoExzBxSTsS86cWBI+v+sa7Ragmj1W2t/oGqgHnCNv+y8b4bF7KpGp4ft45LRUY
	 22uD/pD4i1CHBjxcQqyzs+1dJ6YdyvnvLjwzwpmhDGFwhDofHUckXsG19iCdbOp/KP
	 B4oUCTBos9sLGBx98PQ3z3tEQUhnzeVFfo+IURuiOaNa5eLlk0nOFmRlmPJeD36Ay4
	 wL452Xr8YtgHpZQNAgrs5I6HE5yZBwJMV7MfoRjmt78OY9aW/c/gkZLZfuMzBuYlKf
	 uFuAvDFjgIUYQ==
Received: from [127.0.1.1] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 73A0D7C834;
	Thu,  8 Jan 2026 14:53:42 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: linux-arm-kernel@lists.infradead.org, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, 
 Arnd Bergmann <arnd@arndb.de>, Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 openbmc@lists.ozlabs.org, Russell King <linux@armlinux.org.uk>, 
 patches@armlinux.org.uk
In-Reply-To: <20260104010044.2722221-1-rdunlap@infradead.org>
References: <20260104010044.2722221-1-rdunlap@infradead.org>
Subject: Re: [PATCH v2] arm: npcm: drop unused Kconfig ERRATA symbol
Message-Id: <176785522283.1156760.963237190160295594.b4-ty@codeconstruct.com.au>
Date: Thu, 08 Jan 2026 17:23:42 +1030
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, 03 Jan 2026 17:00:44 -0800, Randy Dunlap wrote:
> The code for this errata was not merged. See
> https://lore.kernel.org/linux-arm-kernel/CAL_JsqK--G_7nO_UQ6jyomA1Sq6GUKtXVZpBF0dXjYA2iE047w@mail.gmail.com/
> 
> 

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


