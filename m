Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E13112025
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2019 00:20:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47SHz25dV9zDq8B
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2019 10:20:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=brendanhiggins@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="P2ym4D4f"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47SHxG5rMpzDq69
 for <openbmc@lists.ozlabs.org>; Wed,  4 Dec 2019 10:19:07 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id o8so2308942pls.5
 for <openbmc@lists.ozlabs.org>; Tue, 03 Dec 2019 15:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9aXu3KlzmsFJZ6e1TagDw+H66vR2neNxwDhx8plTDXE=;
 b=P2ym4D4fL1+2jZqsid93tZ5apni+LjMsWc92QordN593FLqJA+W4QsDirE/huNl5P1
 knTb5ViKDuyT37oe2VN6u4X65E0qoBXrLkTPFAuJUi/5puCIe1qhO5AoFzYvaAhJhDJ/
 ZGHsuAM2+IsfbemFqexEjQZ4n4aB/Wh5ZwyttSwHl/fUGPvWV8l/4obp0kKZH4Bn7wN8
 NCNmGeMIhEC8bdCNINKJ3DfitAYpZweN1bWtt3twrfio7lymvab4N1QAZRZDbCoA8ly6
 E8ZrLQ9Zp/SCypjcbsQgMv1HiPrzTDj5AEqazdjiq8h5eXDuVNBII9xFODUIIb0IxZ2V
 PfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9aXu3KlzmsFJZ6e1TagDw+H66vR2neNxwDhx8plTDXE=;
 b=ajEbxXMo02oVFJ4cwmYtkHlYYI3IBFE1huUTlLzWEAL3IfMtUZsAVjzIi1c1o1Hr4+
 tGlSXudF9683Dsrn+ey9/J4m8ojkJ3nenBBMG+Bni7KbnZi1RQIDDvIgBCHFXo5gst/V
 qHaprqfnGa7XKTGpmgvR+wjp5/x0a5bnPEU6O5IcZ+UfMTsRYHAwaQUD3fwLKU4q7ZW2
 PteS+pKFMZ8chVpxDryBw1lJ24Db2LUmQ2Wyc/4PFBaLgNu4pyGe4vBQTADoxAwzdLmW
 FX9/LEp/ZbEIHclrFS1LQeg5d8PDgusrSJIWK5jJattmjSF1Y0yriq00Czt0ly3K2Tn6
 c+CA==
X-Gm-Message-State: APjAAAW8zsawfurnINdQDvaTuLeZFi0Na7I0jvhj3lCWbiQxri3cSiMt
 mx7lpo17peJDgTo04Y6NrGfLtYueFXhtJtdGlf+IGA==
X-Google-Smtp-Source: APXvYqwaPUhrCsgUEC6zT/MsYaJdSktVjMyOaLL/ZwQxaZzTYw2kYgyCxNVMDYa3yDWpwXTVusT3MTlJbF4W8DELTSA=
X-Received: by 2002:a17:902:7c84:: with SMTP id
 y4mr417290pll.297.1575415143951; 
 Tue, 03 Dec 2019 15:19:03 -0800 (PST)
MIME-Version: 1.0
References: <20191125202937.23133-1-roy.van.doormaal@prodrive-technologies.com>
 <20191126074025.5112-1-roy.van.doormaal@prodrive-technologies.com>
In-Reply-To: <20191126074025.5112-1-roy.van.doormaal@prodrive-technologies.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 3 Dec 2019 15:18:52 -0800
Message-ID: <CAFd5g450nWm47mFi10W+J=oiaO_sV0fXh3SwH0zxX6ZF1qZ-Xw@mail.gmail.com>
Subject: Re: [PATCH v2] irqchip/aspeed-i2c-ic: Fix irq domain name memory leak
To: Roy van Doormaal <roy.van.doormaal@prodrive-technologies.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Jason Cooper <jason@lakedaemon.net>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Nov 25, 2019 at 11:41 PM Roy van Doormaal
<roy.van.doormaal@prodrive-technologies.com> wrote:
>
> The aspeed irqchip driver overwrites the default irq domain name,
> but doesn't free the existing domain name.
> This patch frees the irq domain name before overwriting it.
>
> kmemleak trace:
>
> unreferenced object 0xb8004c40 (size 64):
> comm "swapper", pid 0, jiffies 4294937303 (age 747.660s)
> hex dump (first 32 bytes):
> 3a 61 68 62 3a 61 70 62 3a 62 75 73 40 31 65 37 :ahb:apb:bus@1e7
> 38 61 30 30 30 3a 69 6e 74 65 72 72 75 70 74 2d 8a000:interrupt-
> backtrace:
> [<086b59b8>] kmemleak_alloc+0xa8/0xc0
> [<b5a3490c>] __kmalloc_track_caller+0x118/0x1a0
> [<f59c7ced>] kvasprintf+0x5c/0xc0
> [<49275eec>] kasprintf+0x30/0x50
> [<5713064b>] __irq_domain_add+0x184/0x25c
> [<53c594d0>] aspeed_i2c_ic_of_init+0x9c/0x128
> [<d8d7017e>] of_irq_init+0x1ec/0x314
> [<f8405bf1>] irqchip_init+0x1c/0x24
> [<7ef974b3>] init_IRQ+0x30/0x90
> [<87a1438f>] start_kernel+0x28c/0x458
> [< (null)>] (null)
> [<f0763fdf>] 0xffffffff
>
> Signed-off-by: Roy van Doormaal <roy.van.doormaal@prodrive-technologies.com>

Acked-by: Brendan Higgins <brendanhiggins@google.com>

Sorry for the delayed response.
