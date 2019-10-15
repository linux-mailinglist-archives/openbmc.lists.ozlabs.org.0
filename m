Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F9CD7F81
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2019 21:01:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46t4Xs25cfzDr6L
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 06:01:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.194; helo=mail-oi1-f194.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46t4X23kCZzDr2s;
 Wed, 16 Oct 2019 06:01:06 +1100 (AEDT)
Received: by mail-oi1-f194.google.com with SMTP id a15so17813274oic.0;
 Tue, 15 Oct 2019 12:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wDHyOUpqrv7nCNXxMncnfKZuhS0DDSRvQf7daN1HJps=;
 b=ZGLTECSt2Rkc2d46rLghVVTJRYDNvhS0zG6mMuv8maF+QvTKlC8IG3Y7GLnPqxTaaf
 iGO4WCgiN6UBf07kqzGT2molQKy6eskoNYwsVp1L0LKB9kXOlWDT087z/NnumCfyOMvf
 GjlkZx6bbsF7qNzW9iFv336uWHUcMDytT9ZgmnRXgiUbTzAepgo2lbQ0gjYF3qkzItZx
 p1QS+PMDh+Qrj3v1InRkjGglbB42fs//GlZGdKFOA7yWkFsPZalI0+kWs0RWBHm1nAn1
 BX0ejVzpKhRqXN4Bo5gmlFRDdaKPxmxI6PvlZBjnTwVu079I2LAXYtMuR07EOV8NLfnP
 kxtg==
X-Gm-Message-State: APjAAAW+PHs9n0j4i0kep1EhpSvLj7hy8aZ/a+nhBcQSqJB7MD61k+5l
 axQPKUESfWe0f7EkQKaplw==
X-Google-Smtp-Source: APXvYqzWSK8f7AUbAV3hUyGym4wGyacoh1czYoWtoJaS6CqSc2Sr8mD/Lh+uTddneZJ19P8nSkiI4Q==
X-Received: by 2002:aca:1c02:: with SMTP id c2mr41124oic.73.1571166063181;
 Tue, 15 Oct 2019 12:01:03 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 101sm7119645otd.18.2019.10.15.12.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 12:01:02 -0700 (PDT)
Date: Tue, 15 Oct 2019 14:01:01 -0500
From: Rob Herring <robh@kernel.org>
To: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
Subject: Re: [PATCH 2/2] dt-bindings: peci: aspeed: Add AST2600 compatible
Message-ID: <20191015190101.GA29195@bogus>
References: <20191002061200.29888-1-chiawei_wang@aspeedtech.com>
 <20191002061200.29888-3-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191002061200.29888-3-chiawei_wang@aspeedtech.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 jae.hyun.yoo@linux.intel.com, ryan_chen@aspeedtech.com,
 linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 jason.m.bills@linux.intel.com, chiawei_wang@aspeedtech.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2 Oct 2019 14:12:00 +0800, "Chia-Wei, Wang" wrote:
> Document the AST2600 PECI controller compatible string.
> 
> Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
> ---
>  Documentation/devicetree/bindings/peci/peci-aspeed.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
