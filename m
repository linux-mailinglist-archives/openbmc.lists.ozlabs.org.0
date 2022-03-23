Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3814E55C5
	for <lists+openbmc@lfdr.de>; Wed, 23 Mar 2022 16:57:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KNtK76YRWz30FL
	for <lists+openbmc@lfdr.de>; Thu, 24 Mar 2022 02:57:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.182;
 helo=mail-oi1-f182.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNtJq1YVCz2yMK
 for <openbmc@lists.ozlabs.org>; Thu, 24 Mar 2022 02:56:57 +1100 (AEDT)
Received: by mail-oi1-f182.google.com with SMTP id z8so2063264oix.3
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2022 08:56:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IgrPCceiCwLycG0doYf+GNfBOLy+mSKqNNmNcIvAjl0=;
 b=MOuPoCYUNlh1APSjkl7940WrRiOXs+/EfWhNwB7gMxfgYDpGFFV8fun9hf2cb5+lSm
 QhpWE0vj2Mu/+KMU/5bA5K3JabhmVJy+QpJ6U3lZwlfQ/H/ZXgk+eL6caqsJVzqm3sHq
 c9idQnD9C61GWVUsL/mVGQtpnAcxeXHPcgrtaWua5vcTtA6ONtyjn/tNkeI2bjILkgfd
 byyc3uSe0OERRBDr52a5nDRmhDW2tG6ZF2nolenA/oAliYz2ayqXn4rBf/+B6smsU+Y6
 /mcnda0aH0EZwSvstW89FsYTQ6xI3Bz1exUX6V2TWkEbAWOzPGExS7Z7ezrK732Pe5KR
 lsEA==
X-Gm-Message-State: AOAM530EmCJyubo1iClVpOm+1ER1LfI6EVK8FpubI5T0WnbPup3pCALL
 DLbPIAv6oNpaiJjeW4TJ3g==
X-Google-Smtp-Source: ABdhPJzGJohUCXKA2BUHvBwllauhSqeFTTmapJ+mhGNVtrmcSr4Eo0LvjG+iTbOZPmccBggq8FsfBA==
X-Received: by 2002:a05:6808:209e:b0:2da:4de9:e632 with SMTP id
 s30-20020a056808209e00b002da4de9e632mr359702oiw.214.1648051013312; 
 Wed, 23 Mar 2022 08:56:53 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 s38-20020a05683043a600b005cda8c77010sm147072otv.26.2022.03.23.08.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 08:56:52 -0700 (PDT)
Received: (nullmailer pid 4177743 invoked by uid 1000);
 Wed, 23 Mar 2022 15:56:50 -0000
Date: Wed, 23 Mar 2022 10:56:50 -0500
From: Rob Herring <robh@kernel.org>
To: Medad CChien <medadyoung@gmail.com>
Subject: Re: [PATCH v6 2/3] dt-bindings: edac: nuvoton: add NPCM memory
 controller
Message-ID: <YjtDQu+R+eDQW76B@robh.at.kernel.org>
References: <20220322030152.19018-1-ctcchien@nuvoton.com>
 <20220322030152.19018-3-ctcchien@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220322030152.19018-3-ctcchien@nuvoton.com>
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
Cc: devicetree@vger.kernel.org, tony.luck@intel.com, rric@kernel.org,
 benjaminfair@google.com, avifishman70@gmail.com, venture@google.com,
 YSCHU@nuvoton.com, mchehab@kernel.org, JJLIU0@nuvoton.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, openbmc@lists.ozlabs.org,
 KFTING@nuvoton.com, ctcchien@nuvoton.com, james.morse@arm.com, bp@alien8.de,
 KWLIU@nuvoton.com, tali.perry1@gmail.com, tmaimon77@gmail.com,
 linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 22 Mar 2022 11:01:51 +0800, Medad CChien wrote:
> Added device tree binding documentation for Nuvoton BMC
> NPCM memory controller.
> 
> Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../edac/nuvoton,npcm-memory-controller.yaml  | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
> 

Acked-by: Rob Herring <robh@kernel.org>
