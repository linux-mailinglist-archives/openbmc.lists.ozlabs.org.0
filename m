Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 334D534B832
	for <lists+openbmc@lfdr.de>; Sat, 27 Mar 2021 17:39:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F74Lf1996z30Cq
	for <lists+openbmc@lfdr.de>; Sun, 28 Mar 2021 03:39:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.179;
 helo=mail-oi1-f179.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F74LV1496z2xYc
 for <openbmc@lists.ozlabs.org>; Sun, 28 Mar 2021 03:39:30 +1100 (AEDT)
Received: by mail-oi1-f179.google.com with SMTP id i81so8958362oif.6
 for <openbmc@lists.ozlabs.org>; Sat, 27 Mar 2021 09:39:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=NG67s+7kLptfosAtlZ7QSTWozOvSFpofkzzzHqUW1OE=;
 b=eyhZldlSJeUhYHY5XBoYOocvlT5izIg/ejS9w/fZqmgVs/q3wVAooL+Xxh6vG0OR7u
 8V/cOGzmaMmihZUHejmCJkcSjBE4NTftOuFC4xnFptPoJ0LM+bQWgLE3Lw2aeI2Dznk4
 B9JX/PpTY/EM73p/p7Bf1OS3uWNgnd19VOs34u24hVG+nwvomlm7yvxtW0BQiBzGudrv
 NP3FUj+orl7q7UBYhBjxTB2TRemj4L9OyJ0qqUzNTadOnXya/3zADVo8C+HrCL889PH3
 6Ww5NZFsLa/a5uEdr6eD2/zGNxreML+4t7NFAr3nRGznnD6hIBzI3Vr+buXq1qDgYJEB
 KMtg==
X-Gm-Message-State: AOAM532V5ceZmQ/LEWv85yc9v7VsNV1WGHLLRz0Sn/QEoVhkDJ2yUeaD
 Z9XHr6fTHtUAVrg8BeNKjQ==
X-Google-Smtp-Source: ABdhPJwcMyAO8TYRAtSlim09pySM1rrZfPrCV0qys3rvbuZ/RW3vAzPif9ULRbxNjuZv7odUjb3VsQ==
X-Received: by 2002:aca:4188:: with SMTP id o130mr14218309oia.53.1616863168350; 
 Sat, 27 Mar 2021 09:39:28 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.140])
 by smtp.gmail.com with ESMTPSA id 3sm2896809otw.58.2021.03.27.09.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 09:39:27 -0700 (PDT)
Received: (nullmailer pid 215462 invoked by uid 1000);
 Sat, 27 Mar 2021 16:39:23 -0000
Date: Sat, 27 Mar 2021 10:39:23 -0600
From: Rob Herring <robh@kernel.org>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH 05/14] dt-bindings: timer: nuvoton,npcm7xx: Add
 wpcm450-timer
Message-ID: <20210327163923.GA215427@robh.at.kernel.org>
References: <20210320181610.680870-1-j.neuschaefer@gmx.net>
 <20210320181610.680870-6-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210320181610.680870-6-j.neuschaefer@gmx.net>
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
 openbmc@lists.ozlabs.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, 20 Mar 2021 19:16:01 +0100, Jonathan Neuschäfer wrote:
> Add a compatible string for WPCM450, which has essentially the same
> timer controller.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
>  .../devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt        | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
