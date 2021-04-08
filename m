Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A72358927
	for <lists+openbmc@lfdr.de>; Thu,  8 Apr 2021 18:00:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGQw06thpz30F9
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 02:00:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.51; helo=mail-ot1-f51.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGQvq3z9Nz2yRh;
 Fri,  9 Apr 2021 02:00:23 +1000 (AEST)
Received: by mail-ot1-f51.google.com with SMTP id
 s16-20020a0568301490b02901b83efc84a0so2735820otq.10; 
 Thu, 08 Apr 2021 09:00:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FJhdNB/Jqtva0JYrfZMbI9rYQop/sljVACwChgRC7N4=;
 b=eFTRbyFgE2OT8aKqbsuIZCeKOFztc9UygGzDUZwIldPv9l4roFf1eEri0Qs6gn7G4q
 nuMDZHd0gD4vcIvHrzDYRipQqJDKJsX2Wi0N+BMpSagQE7rOTqfTVaUJwkh4/mzDT6P6
 t1x+3uQp5cUIfURRX1kprTlV8c1fTfdDKNcrUIC3ddikJLLMucZyEeOkJ9uPAt/ofrBr
 F0Exm5r4LbSYzvLjmwbecIO9a92hYNBGl7lWkzCdZ2OMtyfJhJJf42n26vFszzXS4vkY
 bgqgIREG5cZVxTNFA54dg0Y2pQebKFwV5GB5zAekgy+Ip4LX6G7tfhLRmA6dHspfyf47
 ak0Q==
X-Gm-Message-State: AOAM531xmm/+ytLjxhLaEt5XhV7Oz0PwqdVwiwTDhjQ5DSzx8qQ3NVkc
 rYPYYy4ZmRySpFZ69bIcyQ==
X-Google-Smtp-Source: ABdhPJwH+MmUiUnKTRh6M/yGWE1b/8MeTFU59jPjnPJKA+PSvg23MxAoNNbcFS5814FWsFsyc7N02g==
X-Received: by 2002:a05:6830:8f:: with SMTP id
 a15mr8209266oto.299.1617897621071; 
 Thu, 08 Apr 2021 09:00:21 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a6sm6251796otb.41.2021.04.08.09.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 09:00:20 -0700 (PDT)
Received: (nullmailer pid 1555457 invoked by uid 1000);
 Thu, 08 Apr 2021 16:00:19 -0000
Date: Thu, 8 Apr 2021 11:00:19 -0500
From: Rob Herring <robh@kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH v5 4/4] dt-bindings: serial: 8250: add aspeed, lpc-io-reg
 and aspeed, lpc-interrupts
Message-ID: <20210408160019.GA1555403@robh.at.kernel.org>
References: <20210408011637.5361-1-zev@bewilderbeest.net>
 <20210408011637.5361-5-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408011637.5361-5-zev@bewilderbeest.net>
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
Cc: - <devicetree@vger.kernel.org>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>,
 Rob Herring <robh+dt@kernel.org>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 07 Apr 2021 20:16:37 -0500, Zev Weiss wrote:
> These correspond to the existing lpc_address, sirq, and sirq_polarity
> sysfs attributes; the second element of aspeed,lpc-interrupts provides
> a replacement for the deprecated aspeed,sirq-polarity-sense property.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  .../devicetree/bindings/serial/8250.yaml      | 27 ++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
