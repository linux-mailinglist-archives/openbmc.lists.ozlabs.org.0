Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1695CBECE0
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 09:51:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46f6ZJ5vZqzDqn5
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 17:51:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="hBoimKbK"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46f6Xk0YnzzDqlB
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 17:50:13 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id f16so957256qkl.9
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 00:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N7q6Ygqa61iHQihV4dhum4+/+fT52ntF7sv/HIYUzc4=;
 b=hBoimKbKloGjGdb/hIbLHsiirE3meQTlZDJls3XAo+jiFt/9pQTpSePeUbtDk56Wyd
 WdBIzLkyb6Ka8ZcnkGY/SmV6GaVsQl8PkO4rcKe9HPYUltZH3jQYXmzYi2mn4CpBvc0S
 FvIaYclzxu2P7XIY8/RqhSIHStYJhyWs7hUic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N7q6Ygqa61iHQihV4dhum4+/+fT52ntF7sv/HIYUzc4=;
 b=mc4P1Gup4Tv7fpvP6qJIIq4GWluiw76hbs4Zi3lggCg3dj5o4daYaeDdITZK3XXN9E
 hC2L7MpCDZoaskiN6wsKf7AzoE7jv3cip21jzAIHEYK1DT+NTZhUfXPdNitvOtF2SFSy
 eodAZHW7I+nLiCCliM9kCjIPibou+v8vu47TLuCZg73NG09hR6wZvzUfbOUPoUOae4Up
 /6hOcLACYapdzeZczjNGNayBIwcjsOWHueC8EcNhvoM1FPmHSBkpEQeAIqJPMXyIV/eL
 AlVEM+HIoSqidjeCmVj0U65Am61lfIrxkvyhrOgQPwwD/ny/eHRCQbr7bXxx2Jm+jJil
 bDIQ==
X-Gm-Message-State: APjAAAVf5Xl8NMDp1iPRW2Mr8A+ADJZ/YIo1oBsRyNEpAzYIE8384Oco
 H8HbiFkDh6uDUSI1QXWn4J0DGNEP2cNe1+35k6A=
X-Google-Smtp-Source: APXvYqxKjyzDpqsY03idYqHHjYbZD4ORJyP7hKb6/2hQg4uu1FMO0iOscRm8634jsMzHR3QckuR9qZ8p4IG/A3QSD3Y=
X-Received: by 2002:a37:a44f:: with SMTP id n76mr1980632qke.414.1569484210814; 
 Thu, 26 Sep 2019 00:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190925153439.27475-1-andrew@aj.id.au>
In-Reply-To: <20190925153439.27475-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 26 Sep 2019 07:49:59 +0000
Message-ID: <CACPK8XcgQh6pLx8MMM2HBkf=syVWyiyWtS3VsKmbUxGb9r_msw@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.3 v2 0/8] ftgmac100: Support AST2600 RMII
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 25 Sep 2019 at 15:34, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Hello,
>
> This series adds support for ungating RMII RCLK on the AST2500 and AST2600,
> enabling use of NCSI for the MACs if u-boot does not ungate the clock for us.
>
> The patches have not yet been sent upstream, but I intend to do so once we're
> through the 5.4 merge window to avoid some of them disappearing into the
> net-next void.

Thanks, series is merged.

>
> v2:
> * Support AST2500 RCLK as well.
> * Add fixed RCLK clocks and describe correct parent clocks
> * Re-order the patches to group clock and net changes.
> * Update all the 2500- and 2600-based devicetrees
>
> Tested by pinging a remote host on Tacoma (2600, u-boot does not configure
> RCLK) and Witherspoon (2500, manually disabled RCLK in u-boot before booting
> the kernel) hardware, and used QEMU to ensure the driver probes correctly on
> Palmetto (2400, no gate for RCLK).
>
> Please review!
>
> Andrew
>
> Andrew Jeffery (8):
>   dt-bindings: clock: Add AST2500 RMII RCLK definitions
>   dt-bindings: clock: Add AST2600 RMII RCLK gate definitions
>   clk: aspeed: Add RMII RCLK gates for both AST2500 MACs
>   clk: ast2600: Add RMII RCLK gates for all four MACs
>   dt-bindings: net: ftgmac100: Document AST2600 compatible
>   dt-bindings: net: ftgmac100: Describe clock properties
>   net: ftgmac100: Ungate RCLK for RMII on ASPEED MACs
>   ARM: dts: aspeed: Add RCLK to MAC clocks for RMII interfaces
>
>  .../devicetree/bindings/net/ftgmac100.txt     |  7 +++
>  .../aspeed-bmc-arm-stardragon4800-rep2.dts    |  3 ++
>  .../dts/aspeed-bmc-facebook-tiogapass.dts     |  3 ++
>  .../arm/boot/dts/aspeed-bmc-facebook-yamp.dts |  3 ++
>  .../boot/dts/aspeed-bmc-inspur-fp5280g2.dts   |  3 ++
>  .../boot/dts/aspeed-bmc-inspur-on5263m5.dts   |  3 ++
>  .../arm/boot/dts/aspeed-bmc-intel-s2600wf.dts |  3 ++
>  arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts |  3 ++
>  .../boot/dts/aspeed-bmc-lenovo-hr855xg2.dts   |  3 ++
>  arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts  |  3 ++
>  arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts   |  3 ++
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts  |  3 ++
>  arch/arm/boot/dts/aspeed-bmc-opp-swift.dts    |  3 ++
>  arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts   |  3 ++
>  .../boot/dts/aspeed-bmc-opp-witherspoon.dts   |  3 ++
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts    |  3 ++
>  .../boot/dts/aspeed-bmc-portwell-neptune.dts  |  6 +++
>  drivers/clk/clk-aspeed.c                      | 27 ++++++++++-
>  drivers/clk/clk-ast2600.c                     | 47 ++++++++++++++++++-
>  drivers/net/ethernet/faraday/ftgmac100.c      | 35 +++++++++++---
>  include/dt-bindings/clock/aspeed-clock.h      |  2 +
>  include/dt-bindings/clock/ast2600-clock.h     |  5 ++
>  22 files changed, 165 insertions(+), 9 deletions(-)
>
> --
> 2.20.1
>
