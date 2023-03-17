Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0077F6BF356
	for <lists+openbmc@lfdr.de>; Fri, 17 Mar 2023 21:58:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pdc156lqpz3f6y
	for <lists+openbmc@lfdr.de>; Sat, 18 Mar 2023 07:58:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.41; helo=mail-io1-f41.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pdc0b3Bsnz3cf4;
	Sat, 18 Mar 2023 07:58:05 +1100 (AEDT)
Received: by mail-io1-f41.google.com with SMTP id b5so2892568iow.0;
        Fri, 17 Mar 2023 13:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679086682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODtKQbFPksFs46vhcZADgTeYdUWvuTaUcZXqR29mSnE=;
        b=IB8Frkv7UCK+vN+mm+gam3BM+yB9IdvS8GNZIP/P982NDGJ0fXQbPMYs6X6zy4L6SA
         aydp88u7IjLhEafl5UdesQtKJGTrRMkppRIASUa9QgMJaYoQvvU11D0HcP1ibuKC/XzI
         Nm8onLsvrh0SYA/1rXMH8PHwKgNaSq0qbA19qeKEDBEYaF0XePh6QSmdpjIhdiLPR0eE
         Fh/LW7DvUaAdcN1eLUzQNR3ir9FGUuMEjX0avht71h92oarfQNQNSgCwGw+Fzv4QWvD7
         dYo8rJKPPJp7r8RszAue6IBUiPKkoARkp08XPVf/7Iw6A7yMDDDGbkWBv3tylrwFzmiM
         KH+Q==
X-Gm-Message-State: AO0yUKVE9fKhbrjvkksO1+YU1TnrR5ie3OV277cGwlVY8fPf0+MgisJi
	NDcigg80aCPJiLWQRcg9Ng==
X-Google-Smtp-Source: AK7set8N9zYRYrpZyLblDS4PEDFDQUupo0tfdX2hbjpkS+GnTDcVDX7P3ZHEX2vzinq+JYrFy5IMEQ==
X-Received: by 2002:a5e:a708:0:b0:74c:8a51:ecf7 with SMTP id b8-20020a5ea708000000b0074c8a51ecf7mr3747iod.11.1679086682392;
        Fri, 17 Mar 2023 13:58:02 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id s127-20020a025185000000b0040626f5b56csm998256jaa.40.2023.03.17.13.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 13:58:01 -0700 (PDT)
Received: (nullmailer pid 2790050 invoked by uid 1000);
	Fri, 17 Mar 2023 20:58:00 -0000
Date: Fri, 17 Mar 2023 15:58:00 -0500
From: Rob Herring <robh@kernel.org>
To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: serial: 8250: Add aspeed,ast2600-uart
Message-ID: <167908667961.2789991.1539212131187994719.robh@kernel.org>
References: <20230314021817.30446-1-chiawei_wang@aspeedtech.com>
 <20230314021817.30446-2-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230314021817.30446-2-chiawei_wang@aspeedtech.com>
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
Cc: pmenzel@molgen.mpg.de, linux-serial@vger.kernel.org, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, andrew@aj.id.au, gregkh@linuxfoundation.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, vkoul@kernel.org, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, dmaengine@vger.kernel.org, ilpo.jarvinen@linux.intel.com, jirislaby@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On Tue, 14 Mar 2023 10:18:13 +0800, Chia-Wei Wang wrote:
> Add a compatible string for the NS16550A-compatible UARTs
> of Aspeed AST2600 SoCs.
> 
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> ---
>  Documentation/devicetree/bindings/serial/8250.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

