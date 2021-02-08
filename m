Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0A931424C
	for <lists+openbmc@lfdr.de>; Mon,  8 Feb 2021 22:53:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZKX43G9pzDsrY
	for <lists+openbmc@lfdr.de>; Tue,  9 Feb 2021 08:53:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.174;
 helo=mail-oi1-f174.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZKWK0P63zDqfK
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2021 08:52:27 +1100 (AEDT)
Received: by mail-oi1-f174.google.com with SMTP id i3so6393148oif.1
 for <openbmc@lists.ozlabs.org>; Mon, 08 Feb 2021 13:52:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=U8tnst308e6RauLdVa5a7TNIbxkAWuY5AsfA0wur2Dk=;
 b=KWVSr+1BNTZk+FbDQtPEyDyq3VwR+quhasEZaNKD/Bb0bIAlJB4Q/y9OWzQjvG972+
 48QybZo7AcONdr9nPB6aBUJnZrdFf+VYfjk/B6hMBMrFYFEUKAYtL2ZwjAaGAY8lyjCC
 dHEKl960AbOtdbHzShWSpkMDs8g8n+LdvMfKqWPGBRPJxybI7RaxY0PQ39JFm6QmW81U
 E/xl6VgY/feY/aAiKCXEWQYSP4ZqL52RK44OwnKSg55HnAgZRJKDXU8Htw6ObiOBtJcS
 AE1gzlWiKfKbgropKT+gYuprJNS2Ec5PZgpwB899BkArt16qUSHQNtRjXQVKsaa0FV6z
 AwYQ==
X-Gm-Message-State: AOAM533tCJpDuCrOt8C4oMYFClNFGQwxcCX80r869pP178vZh0/96wRQ
 /l8XaimuVvzEgTVJ6AHCRg==
X-Google-Smtp-Source: ABdhPJyujBb8um9slbs8pmbjX48fp1di4TFtFS/wbVUEAmUdc/fIQmMdKAfXk+Pfz8wf0F7yNniuSw==
X-Received: by 2002:aca:5a57:: with SMTP id o84mr569707oib.0.1612821144124;
 Mon, 08 Feb 2021 13:52:24 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n93sm3878402ota.37.2021.02.08.13.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 13:52:23 -0800 (PST)
Received: (nullmailer pid 2085478 invoked by uid 1000);
 Mon, 08 Feb 2021 21:52:22 -0000
Date: Mon, 8 Feb 2021 15:52:22 -0600
From: Rob Herring <robh@kernel.org>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: Convert nuvoton, npcm750 binding
 to YAML
Message-ID: <20210208215222.GA2085425@robh.at.kernel.org>
References: <20210116010907.3475405-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210116010907.3475405-1-j.neuschaefer@gmx.net>
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
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, 16 Jan 2021 02:09:05 +0100, Jonathan Neuschäfer wrote:
> The general trend is to have devicetree bindings in YAML format, to
> allow automatic validation of bindings and devicetrees.
> 
> Convert the NPCM SoC family's binding to YAML before it accumulates more
> entries.
> 
> The nuvoton,npcm750-evb compatible string is introduced to keep the
> structure of the binding a little simpler.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
> 
> If someone else wants to be listed as the maintainer, please let me
> know.
> 
> 
> v2:
> - Fix indentation to satisfy yamllint
> - Fix $schema line
> 
> v1:
> - https://lore.kernel.org/lkml/20210108224008.705687-1-j.neuschaefer@gmx.net/
> ---
>  .../devicetree/bindings/arm/npcm/npcm.txt     |  6 -----
>  .../devicetree/bindings/arm/npcm/npcm.yaml    | 23 +++++++++++++++++++
>  2 files changed, 23 insertions(+), 6 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/npcm/npcm.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/npcm/npcm.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
