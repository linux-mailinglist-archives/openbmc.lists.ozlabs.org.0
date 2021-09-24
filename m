Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D893B41692E
	for <lists+openbmc@lfdr.de>; Fri, 24 Sep 2021 03:01:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HFtz15nrnz30J9
	for <lists+openbmc@lfdr.de>; Fri, 24 Sep 2021 11:01:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.49; helo=mail-ot1-f49.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HFtyf70b7z2ybC;
 Fri, 24 Sep 2021 11:01:30 +1000 (AEST)
Received: by mail-ot1-f49.google.com with SMTP id
 o59-20020a9d2241000000b0054745f28c69so8961962ota.13; 
 Thu, 23 Sep 2021 18:01:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=urz8FYBXj65a7OQWijy7xkzj+b5LyJCaBborSqW0HQA=;
 b=nphOzED1OBjcdjteuRwZnCI5iTjzom5ywGq0vU0TwylSWkoUqZ7TRxmeJq+c7Teesz
 +RJhpJ65nHUjib5HZNtEbUD5TrK51hGPC8HqiPVaAr7sjnkHJOmEUmkCTIzAuf0bdoyl
 LFb044LSEVONA0qX6nYP7BdjuauQ+gGLklJMhBwYitSFZT0F7gjUuZ0m0s3nPF3RTZqW
 oq/SA+rptcopTHgzU/3qX7mNUr1in1AeFU7aGiNgyNhMHyOg9jwKUrx4Niy74j7BEemT
 BUYdQSbpLsWwMR6/CBvTiebPbIqlGhXc2r5bTNiT9V1O7FaFU+4OX1bGaAo6MXixfbOE
 I+tg==
X-Gm-Message-State: AOAM532GgPkNScm0Lpemo2vWOQLXMPRVlICC6Mjfk9kKtkO4s4SSJRdp
 fFtF/bsdmLxSQzJ82PC0gg==
X-Google-Smtp-Source: ABdhPJyYluxit92wpgHRxp5jm/+GCNNV1Rzzp6SPv42n9fF9kjTALxEgk6gmgNeZvcL8R+VX8w/dkA==
X-Received: by 2002:a05:6830:2b1e:: with SMTP id
 l30mr1515926otv.55.1632445286993; 
 Thu, 23 Sep 2021 18:01:26 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id n33sm1706549ota.8.2021.09.23.18.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 18:01:26 -0700 (PDT)
Received: (nullmailer pid 3850087 invoked by uid 1000);
 Fri, 24 Sep 2021 01:01:25 -0000
Date: Thu, 23 Sep 2021 20:01:25 -0500
From: Rob Herring <robh@kernel.org>
To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Subject: Re: [PATCH v6 2/4] dt-bindings: aspeed: Add UART routing controller
Message-ID: <YU0jZb/VgSTeHMMK@robh.at.kernel.org>
References: <20210922073241.14119-1-chiawei_wang@aspeedtech.com>
 <20210922073241.14119-3-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210922073241.14119-3-chiawei_wang@aspeedtech.com>
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
 openbmc@lists.ozlabs.org, yulei.sh@bytedance.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, osk@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 22 Sep 2021 15:32:39 +0800, Chia-Wei Wang wrote:
> Add dt-bindings for Aspeed UART routing controller.
> 
> Signed-off-by: Oskar Senft <osk@google.com>
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> ---
>  .../devicetree/bindings/mfd/aspeed-lpc.yaml   |  4 ++
>  .../bindings/soc/aspeed/uart-routing.yaml     | 56 +++++++++++++++++++
>  2 files changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/aspeed/uart-routing.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
