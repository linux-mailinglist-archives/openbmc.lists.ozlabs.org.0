Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9609B2F4E78
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 16:24:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGB7x2r85zDrfv
	for <lists+openbmc@lfdr.de>; Thu, 14 Jan 2021 02:24:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.174;
 helo=mail-oi1-f174.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGB713ZMCzDrfF
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2021 02:23:53 +1100 (AEDT)
Received: by mail-oi1-f174.google.com with SMTP id s75so2502391oih.1
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2021 07:23:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=inHtYKeqXgYpC8rM4LtuUVX9gUWdNh37ogYQAnlVxao=;
 b=m/cfhHxK1tF01yQJ5U8SHALe0HuTNDkLpXH3pTbJn9HFaHbEBd+NbA+sWHD+VWkWFa
 xUdAxN/kJfLXM3i1y8863vpU34vZPQROS4+M9Q/kOBSoZKdwGsf6tahNOjQADnYI5HNk
 G7/aLPluWXTy42Sy4fXWQgasI/nUx/23R3eoz4I6uCcZm1QzM8iLXGrJgXPnI3lK3BxV
 7DsGNOWKG3GQm4BrDCCswJde+RrbLCm0v0CYUQxOvxd2pVh8iOsKsowxNT1G+jwVrOa5
 P0y196gc7CfnDpLKK1EYAaDCBBWR4gp2NLlD8euxJlPgN3BS7yHZV8xCbPpGRm1bSSXl
 Vf3A==
X-Gm-Message-State: AOAM530+pieiRz7dEojneY62ITiR/kt/SFFFxuWT7NQeisNjAb+mIEha
 hDSxNAMBr4ru0Kn/uF7Yrw==
X-Google-Smtp-Source: ABdhPJzd1ySPWvl889sZ1jrIgHKLQZQAXILq8FLOZq8TIZlcQwL6CFNeow/7i5b5fi3xDsxIiujvtg==
X-Received: by 2002:a05:6808:148:: with SMTP id
 h8mr1558981oie.10.1610551429786; 
 Wed, 13 Jan 2021 07:23:49 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w5sm462062oow.7.2021.01.13.07.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 07:23:48 -0800 (PST)
Received: (nullmailer pid 2472492 invoked by uid 1000);
 Wed, 13 Jan 2021 15:23:47 -0000
Date: Wed, 13 Jan 2021 09:23:47 -0600
From: Rob Herring <robh@kernel.org>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH v2] dt-bindings: timer: nuvoton: Clarify that interrupt
 of timer 0 should be specified
Message-ID: <20210113152347.GA2472428@robh.at.kernel.org>
References: <20210108163004.492649-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210108163004.492649-1-j.neuschaefer@gmx.net>
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
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 08 Jan 2021 17:30:04 +0100, Jonathan Neuschäfer wrote:
> The NPCM750 Timer/Watchdog Controller has multiple interrupt lines,
> connected to multiple timers. The driver uses timer 0 for timer
> interrupts, so the interrupt line corresponding to timer 0 should be
> specified in DT.
> 
> I removed the mention of "flags for falling edge", because the timer
> controller uses high-level interrupts rather than falling-edge
> interrupts, and whether flags should be specified is up the interrupt
> controller's DT binding.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
> 
> v2:
> - Fix a typo in the word "watchdog"
> ---
>  .../devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt        | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
