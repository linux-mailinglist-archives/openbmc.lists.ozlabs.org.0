Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D66AD008F
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 20:14:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nlqK0P1BzDqR1
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2019 05:14:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="fp/xUBWN"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nln46v79zDqQq
 for <openbmc@lists.ozlabs.org>; Wed,  9 Oct 2019 05:12:23 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id 23so10707140pgk.3
 for <openbmc@lists.ozlabs.org>; Tue, 08 Oct 2019 11:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ft4+jYN1dS8NqqiVNLlnlvcOgcl6TC5Rdjhw+oDRjeM=;
 b=fp/xUBWNRr3td/lzO69obrsv/blllnTc7YTOhUQOOc5uE3nOL+Da2ubPZCPl6MzSD8
 7bG8U48fBbMujprEET895v8OHtvgm+bQwX2ZYk1Dec/P1Zax53qJ8EQmKDmgAvG71A2t
 iolwRxV1MILEXICk6/fCgoJN4iZpMq94nxfhMbaxG2iugWflegBTW58ScZ/WZQi4MW2O
 AUmqpRWZ1Cf1QGYM495TsSmpBKT3r7HrLnaNyVAmb6pZBTFFqXHFe5PCrnpeBdzPJ5gM
 Q90Apo4k0GxuwlNEh6WVkJ2zksEhwoTfekOIgsIEMvGpEzRBQj7WujLqdBy5sSXNuKnH
 GKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ft4+jYN1dS8NqqiVNLlnlvcOgcl6TC5Rdjhw+oDRjeM=;
 b=VbDp8skFubwOQJ/P8Efc13qL8goMmRm/vDbNNNaMSs71LqSnjY5U3clZ+3CSxCuEDV
 lrY2tgDi9nNAMrDW2lS9y2do9sLCyV5X6cYInhc21Fopscxv2OF1kTqy80Vex/caWIgD
 ruaZEpUUjnSVbl0K/MEknUm8hSiNWq5r2By2Gtn90mVtaQKNna8rU8od5TnKBT/j3/2X
 zjiigbMAdPcLbHP/jPjC2/nowlvQUpKW3aS33kZAYI39i98WXAV1xHw5wK1HDAgqtlwS
 bo/P4Tf5kMssiZS0eQcfdi5gJT9ywK3kz2IqbQIcd7BJRWjeYXjiZ9LAWb+icdyMSB6t
 Utqw==
X-Gm-Message-State: APjAAAVBnlEanSuzDk1PQSGhvjyChjM3p8TsKGxgXq9aT4SJdkyNq5j8
 ZMwhShmomXtOa7OHyqzuRwgP+A==
X-Google-Smtp-Source: APXvYqwQY/d/4qF6Xf3ltUHZZdZHWBbFSe61lTeC1Lgsde2Fj5T5bc4/HzHq/Mq162NvzHwX2BH7bw==
X-Received: by 2002:a63:d30f:: with SMTP id b15mr37524174pgg.341.1570558339176; 
 Tue, 08 Oct 2019 11:12:19 -0700 (PDT)
Received: from google.com ([2620:15c:2cb:1:e90c:8e54:c2b4:29e7])
 by smtp.gmail.com with ESMTPSA id s5sm2343109pjn.24.2019.10.08.11.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 11:12:18 -0700 (PDT)
Date: Tue, 8 Oct 2019 11:12:13 -0700
From: Brendan Higgins <brendanhiggins@google.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH 1/5] dt-bindings: i2c: aspeed: add buffer and DMA mode
 transfer support
Message-ID: <20191008181213.GB155928@google.com>
References: <20191007231313.4700-1-jae.hyun.yoo@linux.intel.com>
 <20191007231313.4700-2-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007231313.4700-2-jae.hyun.yoo@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>,
 Tao Ren <taoren@fb.com>, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Oct 07, 2019 at 04:13:09PM -0700, Jae Hyun Yoo wrote:
> Append bindings to support buffer mode and DMA mode transfer.
> 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  .../devicetree/bindings/i2c/i2c-aspeed.txt    | 67 +++++++++++++++++--
>  1 file changed, 60 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> index 8fbd8633a387..e40dcc108307 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> @@ -3,7 +3,10 @@ Device tree configuration for the I2C busses on the AST24XX and AST25XX SoCs.
>  Required Properties:
>  - #address-cells	: should be 1
>  - #size-cells		: should be 0
> -- reg			: address offset and range of bus
> +- reg			: Address offset and range of bus registers.
> +			  An additional SRAM buffer address offset and range is
> +			  optional in case of enabling I2C dedicated SRAM for
> +			  buffer mode transfer support.

Sorry, I am having trouble parsing this. This seems like the SRAM buffer
is global to all busses. Can you clarify? I expect I will probably have
some more questions elsewhere.

>  - compatible		: should be "aspeed,ast2400-i2c-bus"
>  			  or "aspeed,ast2500-i2c-bus"
>  - clocks		: root clock of bus, should reference the APB
> @@ -16,6 +19,18 @@ Optional Properties:
>  - bus-frequency	: frequency of the bus clock in Hz defaults to 100 kHz when not
>  		  specified
>  - multi-master	: states that there is another master active on this bus.
> +- aspeed,dma-buf-size	: size of DMA buffer (from 2 to 4095 in case of AST2500
> +			  or later versions).
> +			  Only AST2500 and later versions support DMA mode
> +			  under some limitations:
> +			  I2C is sharing the DMA H/W with UHCI host controller
> +			  and MCTP controller. Since those controllers operate
> +			  with DMA mode only, I2C has to use buffer mode or byte
> +			  mode instead if one of those controllers is enabled.
> +			  Also make sure that if SD/eMMC or Port80 snoop uses
> +			  DMA mode instead of PIO or FIFO respectively, I2C
> +			  can't use DMA mode. If both DMA and buffer modes are
> +			  enabled, DMA mode will be selected.

nit: I think it makes sense to break down the exceptions into a
bulleted list.

Cheers
