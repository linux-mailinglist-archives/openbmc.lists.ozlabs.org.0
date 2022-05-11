Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1613A523731
	for <lists+openbmc@lfdr.de>; Wed, 11 May 2022 17:24:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyzGz6dgnz3cDt
	for <lists+openbmc@lfdr.de>; Thu, 12 May 2022 01:24:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.50; helo=mail-ot1-f50.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyzGj3DNWz3brp
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 01:24:28 +1000 (AEST)
Received: by mail-ot1-f50.google.com with SMTP id
 p12-20020a9d4e0c000000b00606b40860a3so688960otf.11
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2022 08:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/YW/NabRNlqlFBWgGilu1Fwu61bxFXT4UrNqhtMuKug=;
 b=ANHtybvQe5KVecLqq3HhlpAIbVH5c/rcAynhGgiQP0CbXop0G7DPUiXDKvWUt6pxCl
 NJ25LPTTOF4TP05YxrYnCYP+9Bc3OA9GwrtGFLi/N5pnHqzSYStlUZl/j3OcULAZg5RJ
 a9CcvlgfF/34+x4ZbvEZ05Gv1uHHzY9QV97J78vjJcwg8vRAtq83nPQlcC4MNE3s7wNg
 BPD8wTicfEdJmCIu2K7O5o8WHcAq+mF3+2AIfWUOkvLgKw/O86wKFFPTh33/vMLNqgWU
 0PAtolygkUK3YLqoA9RM0EvHNuYYAOEo2rB3T5hnzrhLTXTaZo/M3mbjNnw1b9U8fp3I
 W0FA==
X-Gm-Message-State: AOAM531/RXGEIr8iX99aHPvRAzPn9KKaDJEkbtACsK4yl+D2v7EQULg0
 RNf6aSHdJlrHLaih0DK26w==
X-Google-Smtp-Source: ABdhPJwW6W24dzq/fhBeIZjPgBInHoKIcnuL7XRJyzp48a8Nt/eKYf23URC2W2inbDtmAxg7YeSoLA==
X-Received: by 2002:a9d:674f:0:b0:606:5b6:b76e with SMTP id
 w15-20020a9d674f000000b0060605b6b76emr10106810otm.12.1652282664955; 
 Wed, 11 May 2022 08:24:24 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 t13-20020a4aadcd000000b0035eb4e5a6c9sm1014996oon.31.2022.05.11.08.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 08:24:24 -0700 (PDT)
Received: (nullmailer pid 339802 invoked by uid 1000);
 Wed, 11 May 2022 15:24:22 -0000
Date: Wed, 11 May 2022 10:24:22 -0500
From: Rob Herring <robh@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v4 1/9] dt-bindings: i2c: npcm: support NPCM845
Message-ID: <20220511152422.GA339769-robh@kernel.org>
References: <20220510091654.8498-1-warp5tw@gmail.com>
 <20220510091654.8498-2-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220510091654.8498-2-warp5tw@gmail.com>
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
Cc: tmaimon77@gmail.com, KWLIU@nuvoton.com, tali.perry1@gmail.com,
 jsd@semihalf.com, benjaminfair@google.com, krzysztof.kozlowski@canonical.com,
 openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com, lukas.bulwahn@gmail.com,
 tomer.maimon@nuvoton.com, devicetree@vger.kernel.org, arnd@arndb.de,
 sven@svenpeter.dev, robh+dt@kernel.org, Avi.Fishman@nuvoton.com,
 andriy.shevchenko@linux.intel.com, semen.protsenko@linaro.org,
 jie.deng@intel.com, avifishman70@gmail.com, venture@google.com,
 linux-kernel@vger.kernel.org, wsa@kernel.org, kfting@nuvoton.com,
 tali.perry@nuvoton.com, jarkko.nikula@linux.intel.com, olof@lixom.net,
 linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 10 May 2022 17:16:46 +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> Add compatible and nuvoton,sys-mgr description for NPCM i2c module.
> 
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> ---
>  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 25 +++++++++++++++----
>  1 file changed, 20 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
