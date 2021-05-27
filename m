Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D80A393959
	for <lists+openbmc@lfdr.de>; Fri, 28 May 2021 01:46:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Frkws5BGSz300J
	for <lists+openbmc@lfdr.de>; Fri, 28 May 2021 09:46:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ku+MevdN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::132;
 helo=mail-lf1-x132.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ku+MevdN; dkim-atps=neutral
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrkwZ013mz2yR7
 for <openbmc@lists.ozlabs.org>; Fri, 28 May 2021 09:46:03 +1000 (AEST)
Received: by mail-lf1-x132.google.com with SMTP id q7so2613818lfr.6
 for <openbmc@lists.ozlabs.org>; Thu, 27 May 2021 16:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pzhAZz5qD9tMIBygAnX25ExGzRT83UA6SsM5Jk9PK9c=;
 b=ku+MevdNuxRQCIlQDe5WbthdcCPQDlxzodRhu4e04QT5ujq4MSRkOtpvYQW/yxHMuy
 f8M/4piku6X9w+HnbFpx3Laek/DEUtWRK5WXzuJxghvKoAN8b1NoWQRlhGfHvluUWD3I
 Zxo+KYHxKlMCru/TegYs6o7Wx1HC3HrsXqbOPlzPKezkluNtQhqrCVb9ewW+lVeON4aZ
 7BAasc7TxACThYfU8UpHTYw5znXA8c7O3yUAyqzfv/JSJJzPAZMOGrlFx+tVD6pyX/cW
 yUSCBW3S+B0M9XgiWX8isA12ea6Er/YDTkFGL4bEkXkwTv7cDHejONmAqsLBRkchgtBb
 rtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pzhAZz5qD9tMIBygAnX25ExGzRT83UA6SsM5Jk9PK9c=;
 b=MVZ6aRV5vO2f+3TqHX9cRDlmmu4yHt/PopI9ubIQAv6bniH5TESoKhGRFnNlY0aJ03
 CkzDqe4CgrvEOJduAiDYXpmvSp6F7FsxfUmruuFmQkAq0q0cQOpSDL907fagHj+o0zS8
 HcB8NQ5GviKweJE9BF3ksljuTQ0nnRecti1TPBrkLBehBC5KocSDWyzXY0y1qtkREyiJ
 9O9dl/m4fE7nmE05qFk5A6qvLk6bLen74EvA5p/A5xegw0EZvcjjG1+o6ycSdlUlk9Ia
 tWIIuVcTbP7xqGXnHPDzI9kX38Cf0saRb54JqAUp7l5JCu8n09yvXnyyTAmXlc0ubFFG
 q40A==
X-Gm-Message-State: AOAM532pjOg277E6eBe0biVXgLWCjCKMCrXeTvRKX/Fw94bLmnrtPSrH
 k6ULxUxwqJ5a1/N2vEnyRHVqv9ZAy2KgPvDBBnM8yg==
X-Google-Smtp-Source: ABdhPJy/46H+k3aOEa5cM0efkOnNLslLyNp40ndo+HmC/hefCNnT9RC3XB9+Hy8ze9TKQNzaARS55qPRJF1ZogTpez8=
X-Received: by 2002:a05:6512:11ea:: with SMTP id
 p10mr3746839lfs.157.1622159156359; 
 Thu, 27 May 2021 16:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210525055308.31069-1-steven_lee@aspeedtech.com>
 <20210525055308.31069-2-steven_lee@aspeedtech.com>
In-Reply-To: <20210525055308.31069-2-steven_lee@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 May 2021 01:45:45 +0200
Message-ID: <CACRpkdaFVnGeOHCdwoBS4UMho8OJ_s6cAbkqJEM+uNyf9j=EQw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: Update enum for adding SGPM2
 and SGPS2
To: Steven Lee <steven_lee@aspeedtech.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
 "moderated list:ASPEED PINCTRL DRIVERS" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "moderated list:ASPEED PINCTRL DRIVERS" <openbmc@lists.ozlabs.org>,
 open list <linux-kernel@vger.kernel.org>,
 Billy Tsai <billy_tsai@aspeedtech.com>,
 "open list:ASPEED PINCTRL DRIVERS" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Hongwei Zhang <Hongweiz@ami.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, May 25, 2021 at 7:53 AM Steven Lee <steven_lee@aspeedtech.com> wrote:

> AST2600 has 2 SGPIO master interfaces one with 128 pins and another one
> has 80 pins. It also supports 2 SGPIO slave interfaces.
> In the current bindings, there are only SGPM1 and SGPS1 defined in enum,
> SGPM2 and SGPS2 should also be added in the bindings.
>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied to the pinctrl tree.

Yours,
Linus Walleij
