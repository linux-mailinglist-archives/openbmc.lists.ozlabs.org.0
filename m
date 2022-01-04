Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8B2484A6C
	for <lists+openbmc@lfdr.de>; Tue,  4 Jan 2022 23:08:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JT6FC5tn6z2ynk
	for <lists+openbmc@lfdr.de>; Wed,  5 Jan 2022 09:08:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.53; helo=mail-ot1-f53.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JT6Dv5x23z2xBV
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jan 2022 09:07:57 +1100 (AEDT)
Received: by mail-ot1-f53.google.com with SMTP id
 i5-20020a05683033e500b0057a369ac614so48966963otu.10
 for <openbmc@lists.ozlabs.org>; Tue, 04 Jan 2022 14:07:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=WpuTEnMsfacvD0VOURlK31DWnAVBUgJmXM4X3B1dfVw=;
 b=sptMCojtjkaIuud9fCBsS04vniCIabAZfHyAel+t5djZ057ImG8FiARYo99tCjm8qR
 1H5LPu0kcLp0tX/j7vCxCskhvB095Lrm0L7sRt7bnrgKgJUdylRFNvX7vh9SeMQLHJfJ
 hZ/iMK9LzYg4KxJUn+YFFbS0nvwmv1laqPcKvjkDMSm+WcK1qEDNaHKh+1bWyoDTE4MD
 bR+Rv2OoXtirgx7UvuivEoANFmdsORN4vumU9ciEVDgn43HvAMrAb1qydv6Xj8y8BHiz
 byEnL741/4QmXxNiCW9ZGR2qBUgYR6yHgq70ucOHdMCG5iNcTzrIj2aP85M9ikPrLJBo
 +4ZA==
X-Gm-Message-State: AOAM533KN59eleXN27PdxrHNy1/2bkzalRZi1sR3woAIAAHHkzXV9IVr
 xW7N72GgigO+Df6rj7CrMQ==
X-Google-Smtp-Source: ABdhPJwcOkAgoVIzZ4/aXLTGe5sAZbXE/iR7xEi+gBzUL+p6caHDpCCjUdLlmlzY3dynP6W95IYHeg==
X-Received: by 2002:a05:6830:1d49:: with SMTP id
 p9mr37021965oth.108.1641334074202; 
 Tue, 04 Jan 2022 14:07:54 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id y14sm7531050otk.39.2022.01.04.14.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 14:07:53 -0800 (PST)
Received: (nullmailer pid 1526475 invoked by uid 1000);
 Tue, 04 Jan 2022 22:07:52 -0000
Date: Tue, 4 Jan 2022 16:07:52 -0600
From: Rob Herring <robh@kernel.org>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH v3 1/9] dt-bindings: arm/npcm: Add binding for global
 control registers (GCR)
Message-ID: <YdTFOLEbcWs8tu1D@robh.at.kernel.org>
References: <20211224200935.93817-1-j.neuschaefer@gmx.net>
 <20211224200935.93817-2-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211224200935.93817-2-j.neuschaefer@gmx.net>
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>, linux-gpio@vger.kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>, openbmc@lists.ozlabs.org,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Dec 24, 2021 at 09:09:27PM +0100, Jonathan Neuschäfer wrote:
> A nuvoton,*-gcr node is present in nuvoton-common-npcm7xx.dtsi and will
> be added to nuvoton-wpcm450.dtsi. It is necessary for the NPCM7xx and
> WPCM450 pinctrl drivers, and may later be used to retrieve SoC model and
> version information.
> 
> This patch adds a binding to describe this node.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> 
> ---
> v3:
> - Make a few changes suggested by Rob Herring
> - Change name of mux-controller node to appease the linter
> 
> v2:
> - https://lore.kernel.org/lkml/20211207210823.1975632-2-j.neuschaefer@gmx.net/
> - Rename node in example to syscon@800000
> - Add subnode to example
> 
> v1:
> - https://lore.kernel.org/lkml/20210602120329.2444672-2-j.neuschaefer@gmx.net/
> ---
>  .../bindings/arm/npcm/nuvoton,gcr.yaml        | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/npcm/nuvoton,gcr.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
