Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B61941CEA9
	for <lists+openbmc@lfdr.de>; Thu, 30 Sep 2021 00:03:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKVkK6zC9z2ync
	for <lists+openbmc@lfdr.de>; Thu, 30 Sep 2021 08:03:21 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKVk13wDwz2xXV;
 Thu, 30 Sep 2021 08:03:04 +1000 (AEST)
Received: by mail-ot1-f51.google.com with SMTP id
 l16-20020a9d6a90000000b0053b71f7dc83so4739601otq.7; 
 Wed, 29 Sep 2021 15:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GcUYa1rhgvpl8VdHADUZYNm6UstnV1HeTo+qppWEyug=;
 b=JQLdgSrUGhwEnaR8Z31g4BGWEgz30dfV5HPR9SN80K1TbiHRqHvWqO5Al1pGjuhCxz
 QrOFFoadT+PSrQuEqlGw36UcSGxe5g5lGmwL1HIBwXxIoPbLCWFg7xH89EbVfJK393Xx
 /PpnJVuhi3mlX2v6b6LGkmyPPO1PF96kLc/0S1VXPGpVBUHXTqQKUlIeUUQfFodm1kST
 JDpsaN6TF7XdLgXkSwqKOUWYYXCvJWizixAzqSb5nasyJRga+XVmjEBi73RY9va6MgME
 1Zb3LBwxLFG0JSpXUkZzPskP3hNKkaNvaLUnz9MNj2eJarXRSqQMKR1ATsJpABs+H+qK
 cyOw==
X-Gm-Message-State: AOAM532GZgOCgbOxorclaOP0V3ZQoTvaPyMtISup1cptn7rqgS2eGlB7
 9yboRmtDLD5YoUJ39uGC8A==
X-Google-Smtp-Source: ABdhPJwQDOagZBRoi522zoziMq1VzMOqfIKxn1VI4w493zMZ5pqhJf7meCiZxSI/vfoTJIF3QFV01A==
X-Received: by 2002:a05:6830:1d3:: with SMTP id
 r19mr2092898ota.136.1632952981336; 
 Wed, 29 Sep 2021 15:03:01 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id q25sm210326oof.33.2021.09.29.15.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 15:03:00 -0700 (PDT)
Received: (nullmailer pid 298763 invoked by uid 1000);
 Wed, 29 Sep 2021 22:02:59 -0000
Date: Wed, 29 Sep 2021 17:02:59 -0500
From: Rob Herring <robh@kernel.org>
To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Subject: Re: [PATCH v7 2/5] dt-bindings: mfd: aspeed-lpc: Convert to YAML
 schema
Message-ID: <YVTik08lNtDRGn0L@robh.at.kernel.org>
References: <20210927023053.6728-1-chiawei_wang@aspeedtech.com>
 <20210927023053.6728-3-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927023053.6728-3-chiawei_wang@aspeedtech.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 osk@google.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 27 Sep 2021 10:30:50 +0800, Chia-Wei Wang wrote:
> Convert the bindings of Aspeed LPC from text file into YAML schema.
> 
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> ---
>  .../devicetree/bindings/mfd/aspeed-lpc.txt    | 157 ---------------
>  .../devicetree/bindings/mfd/aspeed-lpc.yaml   | 188 ++++++++++++++++++
>  2 files changed, 188 insertions(+), 157 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
> 

Applied, thanks!
