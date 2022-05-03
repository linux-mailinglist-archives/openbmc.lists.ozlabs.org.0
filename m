Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D44F6517D8B
	for <lists+openbmc@lfdr.de>; Tue,  3 May 2022 08:44:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ksr6C5Ss1z3bdJ
	for <lists+openbmc@lfdr.de>; Tue,  3 May 2022 16:44:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=IxhRT3Jo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2b;
 helo=mail-qv1-xf2b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=IxhRT3Jo; dkim-atps=neutral
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ksr5l3921z2yK2
 for <openbmc@lists.ozlabs.org>; Tue,  3 May 2022 16:43:54 +1000 (AEST)
Received: by mail-qv1-xf2b.google.com with SMTP id e17so11617060qvj.11
 for <openbmc@lists.ozlabs.org>; Mon, 02 May 2022 23:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=sEcEp2h+GbqJKSieiWpSSSc8gBAxzfONnX1QNNfTWm8=;
 b=IxhRT3JovDRU4sI51niSYJSPEaULE6alvrdUmecMmDMAJaDgmvi2GxawagFatpQhS8
 GFjVOedk/bOuhKc9TUd9MRQTXLwm5aZKdzpr1R+yJxeL5rtUziixMQTGcxg2CmXcYvJX
 aXG/w+22hSt0w/ZCtVfOtPJNhnFfUxAg+3tIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=sEcEp2h+GbqJKSieiWpSSSc8gBAxzfONnX1QNNfTWm8=;
 b=EoAvrpS7PwwAjXS/ZWvn+VaW0Kb5d9sA5QJcFEJekK8V3AfbNyT0d1Na/selZ4Ge1U
 a88/XurR/qi1HHNSul8mDAAJBPSa2WRB6hvcFheRFkI5HzD2hhYuQe+yssDJDgRTaxYB
 dSqRe/FUAZaHTbUc1+Ogyaw3zP88YA7FbBkXBN3K44PbTXsb8MpHUE5GWH4p1h5NyDLn
 85PCR9Q0HBVmUUCyTiWahVpXnx5T+7CiHejZ5LK2QCmT/3WObmvHZDE0D35JN1LscJSm
 SCx/EnCi6sDTROM8Sv6U+st1CiQ773pL6Pzxqv64YvIdY+HY13fZlNo3hEfA7N9uEnDc
 Fhng==
X-Gm-Message-State: AOAM530Yu4BfEQnKb43u2ypUKJee7YfJSLyc+ImelZYJlo4MR9DzDC3Y
 9bdOq9hP3wpdUrAkLj3h2M3bL1lnE954HZIzbsQ=
X-Google-Smtp-Source: ABdhPJxIxCyarf4L48tGsjejNGa/qSN4/edl6zurP3heeqzMBA2sgLnnE91WeO7kwxjAG/V9x6AMu4Xw3vw1Pv7i9c4=
X-Received: by 2002:ad4:53c5:0:b0:42d:7bb4:a8e8 with SMTP id
 k5-20020ad453c5000000b0042d7bb4a8e8mr12353858qvv.8.1651560230860; Mon, 02 May
 2022 23:43:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220503060634.122722-1-clg@kaod.org>
In-Reply-To: <20220503060634.122722-1-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 3 May 2022 06:43:38 +0000
Message-ID: <CACPK8Xcoz6WzyHWV9pSibjGJFs-mBGuPheASsysKMTVv68YhLQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/11] spi: spi-mem: Convert Aspeed SMC driver to
 spi-mem
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 3 May 2022 at 06:06, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Hi,
>
> This series adds a new SPI driver using the spi-mem interface for the
> Aspeed static memory controllers of the AST2600, AST2500 and AST2400
> SoCs.
>
>  * AST2600 Firmware SPI Memory Controller (FMC)
>  * AST2600 SPI Flash Controller (SPI1 and SPI2)
>  * AST2500 Firmware SPI Memory Controller (FMC)
>  * AST2500 SPI Flash Controller (SPI1 and SPI2)
>  * AST2400 New Static Memory Controller (also referred as FMC)
>  * AST2400 SPI Flash Controller (SPI)
>
> It is based on the current OpenBMC kernel driver [1], using directly
> the MTD SPI-NOR interface and on a patchset [2] previously proposed
> adding support for the AST2600 only. This driver takes a slightly
> different approach to cover all 6 controllers.
>
> It does not make use of the controller register disabling Address and
> Data byte lanes because is not available on the AST2400 SoC. We could
> introduce a specific handler for new features available on recent SoCs
> if needed. As there is not much difference on performance, the driver
> chooses the common denominator: "User mode" which has been heavily
> tested in [1]. "User mode" is also used as a fall back method when
> flash device mapping window is too small.
>
> Problems to address with spi-mem were the configuration of the mapping
> windows and the calibration of the read timings. The driver handles
> them in the direct mapping handler when some knowledge on the size of
> the flash device is know. It is not perfect but not incorrect either.
> The algorithm is one from [1] because it doesn't require the DMA
> registers which are not available on all controllers.
>
> Direct mapping for writes is not supported (yet). I have seen some
> corruption with writes and I preferred to use the safer and proven
> method of the initial driver [1]. We can improve that later.
>
> The driver supports Quad SPI RX transfers on the AST2600 SoC but it
> didn't have the expected results. Therefore it is not activated yet.
> There are some issues on the pinctrl to investigate first.
>
> Tested on:
>
>  * OpenPOWER Palmetto (AST2400)
>  * Facebook Wedge 100 BMC (AST2400) by Tao Ren <rentao.bupt@gmail.com>
>  * Evaluation board (AST2500)
>  * Inspur FP5280G2 BMC (AST2500) by John Wang <wangzq.jn@gmail.com>
>  * Facebook Backpack CMM BMC (AST2500) by Tao Ren <rentao.bupt@gmail.com>
>  * OpenPOWER Witherspoon (AST2500)
>  * Evaluation board (AST2600 A0 and A3)
>  * Rainier board (AST2600)

This is now the driver used in the dev-5.15 openbmc kernel tree. Thank
you for all of your hard work C=C3=A9dric.

Cheers,

Joel
