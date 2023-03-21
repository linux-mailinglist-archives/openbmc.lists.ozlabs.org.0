Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 188A56C3CC2
	for <lists+openbmc@lfdr.de>; Tue, 21 Mar 2023 22:33:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ph4b96gFBz3chw
	for <lists+openbmc@lfdr.de>; Wed, 22 Mar 2023 08:33:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.52; helo=mail-oa1-f52.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ph4Zk097Cz2yNm;
	Wed, 22 Mar 2023 08:32:44 +1100 (AEDT)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-177ca271cb8so17654900fac.2;
        Tue, 21 Mar 2023 14:32:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679434361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/SrNI7Im7OQzPMwgFxuqdWvT+8hAcxHPUJhevfOoDk=;
        b=w6DpIuSAjWZzEqmi1Nmnow0kLnRcOqJcP7uxzouNXrBxP84GaFBFRunvypyg5sHE80
         k8WpidjXdgLTm3hI8bG80yYaE1bdgb7nFmn6Y3IsOLQDdlIhVa/KPnUYE532Xz2FGa9i
         XcGWyci3phTFOWq99vnTV94DjKZ0H49Tq7FCUZb2D9oCQnwgNEPZ9oyXePeTnjzBeNfP
         H4EgA4yXoMvhn3M6CYVo1q0scTBTRvamjCPFPc5SxS73u2G2QBvTFwXCsSyopfhraaxJ
         v1uP3Fe9Sg5Yx1ziLqq99S2lJ0iD2PB50aE6SdLh+m/3kdTCYJiOjrKssRNgKKsM13nI
         Z2Hw==
X-Gm-Message-State: AO0yUKXP8yYVTnjoyehxR/L3OZbCjoYkcyM0jyYmCNa0zRIgbpqJV1Bf
	QRpa2oDsB0FFt7yyBcrzJw==
X-Google-Smtp-Source: AK7set+sV/jKtfFsliyuVdroKJyTtvegHA63GNPGyroahiRTLam+vd+reVQMt4XQK0cSjZ/4FRQ6ow==
X-Received: by 2002:a05:6870:8888:b0:172:4748:32d9 with SMTP id m8-20020a056870888800b00172474832d9mr300895oam.3.1679434361552;
        Tue, 21 Mar 2023 14:32:41 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id tk6-20020a05687189c600b0017703cd8ff6sm4604096oab.7.2023.03.21.14.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 14:32:41 -0700 (PDT)
Received: (nullmailer pid 1648942 invoked by uid 1000);
	Tue, 21 Mar 2023 21:32:40 -0000
Date: Tue, 21 Mar 2023 16:32:40 -0500
From: Rob Herring <robh@kernel.org>
To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: dmaengine: Add AST2600 UDMA bindings
Message-ID: <167943435989.1648881.16454367602496486662.robh@kernel.org>
References: <20230320081133.23655-1-chiawei_wang@aspeedtech.com>
 <20230320081133.23655-3-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320081133.23655-3-chiawei_wang@aspeedtech.com>
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
Cc: pmenzel@molgen.mpg.de, hdanton@sina.com, krzysztof.kozlowski+dt@linaro.org, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, andrew@aj.id.au, gregkh@linuxfoundation.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, vkoul@kernel.org, robh+dt@kernel.org, joel@jms.id.au, linux-serial@vger.kernel.org, dmaengine@vger.kernel.org, ilpo.jarvinen@linux.intel.com, jirislaby@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On Mon, 20 Mar 2023 16:11:30 +0800, Chia-Wei Wang wrote:
> Add the dmaengine bindings for the UART DMA engine of Aspeed AST2600 SoC.
> 
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> ---
>  .../bindings/dma/aspeed,ast2600-udma.yaml     | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/aspeed,ast2600-udma.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

