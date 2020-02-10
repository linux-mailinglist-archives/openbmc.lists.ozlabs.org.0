Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D125156DB7
	for <lists+openbmc@lfdr.de>; Mon, 10 Feb 2020 03:49:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48G9Nk4mLZzDqRm
	for <lists+openbmc@lfdr.de>; Mon, 10 Feb 2020 13:49:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f43;
 helo=mail-qv1-xf43.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=jsIVEzjD; dkim-atps=neutral
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48G9Lk3bMRzDqRD;
 Mon, 10 Feb 2020 13:47:58 +1100 (AEDT)
Received: by mail-qv1-xf43.google.com with SMTP id y2so2508333qvu.13;
 Sun, 09 Feb 2020 18:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IDCSxWhDLuTd8LJ5aB5xbWhS/YdWKP+avSFo/NepTNM=;
 b=jsIVEzjDdAnlls3W4DAXr0MB0WaQ+CAtxK394yiKvBLynQtiF4FPxwfE0fjOCufrzh
 /iuq2MoMKcrvuSqKRDRRpUU8o1TdlTl0/niKb8x65PC4QaRJTJDffH39jgiNXZaaE5nh
 pyIztvtIvTxamrLvVqxCw518aIwrgHzeVAgVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IDCSxWhDLuTd8LJ5aB5xbWhS/YdWKP+avSFo/NepTNM=;
 b=osmJ5tWgTzfFv+CTvlU8kqDfE5TCMgACpnoDHFxPRQFVKryZfcW9+0j9Fv4ANKlqrk
 KK73bYKekpC3nLpfuQXx4nagk7d9wcqPj7mnDxKNehVK+lTV3duZP51474JkDa5zwO5n
 R7auTDIz1lBm1jnretcQEtJxZqTRBnwoLg3dmLJ8ZF2Uol9XEi1U6QSL9n/s1YDCXnUk
 V8x5d6gU2cKc6Bdt+XiCG5R9pIPk18fSMObF20se1yWMVIOGxcaL8rLyLcBWZ2PmYNXF
 ni6to4DYz4BSzK/gxTnDr7PJoUQhRNeClhl+fiolcjpK6aNKZ5b81o067DdSMaFaDrfc
 1Atg==
X-Gm-Message-State: APjAAAVlSP9Bt4Q/uTYlXxplxAy0ZrGv0LC4ADmpKpAdmQVUCfxI6M2N
 SNp7yJ2YdrDUG+UczbcVnX9l6hA7Bp2Plgg7x14=
X-Google-Smtp-Source: APXvYqwuGj9cqaQI7ihHFaiQ5EXNe1MT7fdGI525zSMynjA/wwaIBfxWOGb0gwg6UBAtGbBtysYAvGRljf8gLEaT+Wc=
X-Received: by 2002:a0c:f6cd:: with SMTP id d13mr8172390qvo.20.1581302875467; 
 Sun, 09 Feb 2020 18:47:55 -0800 (PST)
MIME-Version: 1.0
References: <20200131222157.20849-1-rentao.bupt@gmail.com>
 <20200131222157.20849-4-rentao.bupt@gmail.com>
In-Reply-To: <20200131222157.20849-4-rentao.bupt@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 10 Feb 2020 02:47:44 +0000
Message-ID: <CACPK8Xe=szrpcY_3Gk5g6KqZ3UFBE03wH5MPx-BFOjKN39-EZQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: aspeed-g6: add usb functions
To: Tao Ren <rentao.bupt@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-usb@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Colin Ian King <colin.king@canonical.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 31 Jan 2020 at 22:22, <rentao.bupt@gmail.com> wrote:
>
> From: Tao Ren <rentao.bupt@gmail.com>
>
> Add USB components and according pin groups in aspeed-g6 dtsi.
>
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

I've applied this to the aspeed tree for 5.7.

Cheers,

Joel
