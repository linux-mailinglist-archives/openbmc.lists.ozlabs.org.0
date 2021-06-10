Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B78AC3A314E
	for <lists+openbmc@lfdr.de>; Thu, 10 Jun 2021 18:47:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G18z21sx5z3bvb
	for <lists+openbmc@lfdr.de>; Fri, 11 Jun 2021 02:47:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.42; helo=mail-oo1-f42.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G18yp4qplz302Y;
 Fri, 11 Jun 2021 02:47:14 +1000 (AEST)
Received: by mail-oo1-f42.google.com with SMTP id
 i8-20020a4aa1080000b0290201edd785e7so44236ool.1; 
 Thu, 10 Jun 2021 09:47:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+ubLQ+O50XgkD8kDtM8dzYJ4xypd9X1QKHEX8Kl94HM=;
 b=cphSDzDfoU7WUM7hXJtKAEQkpRK5vh8T0MuvckLMyWLpErqLcNlkhnAQG24dUZ3TJf
 /Qfv+A1FcaS0nk/xCiYBhe865ks3gTtDcV0+xgmwoNO3LLbPX8BF1kalFui8tyzyZzLf
 llBURZRSv+QppQe3AR8/vGE1Sr2K3lBfn4a0ojcDBnzcw0GLHcxOCrVLtEMx4DT2QK4y
 vF0rfOG1roGPdMp3Wf3d8UMbD2cqCBqN3rLO7c4z785hYYkRxQsUjOyBNtftLFKHj3Jy
 uFcqAMtMsLUuW/cVCs8PAjcn2kJRNlF5G3iWDHtNm/9iEABbWBAY5cSKw1sQNCMEbuNw
 3KuQ==
X-Gm-Message-State: AOAM530RFoPIReBrURCi4MjydFo1M+SH571DLU4QbJXAu4sJqaKACs4r
 exA8nl9SKF72SgfWIYaDaxxJ67FyEQ==
X-Google-Smtp-Source: ABdhPJzxSFuHoIzFy98YSEdLyG+PwlYC3ijHdZ/99LwLKJKM5Op6VYOn58+LDzA1pg8ehbA127p5ww==
X-Received: by 2002:a4a:4c8f:: with SMTP id a137mr3039036oob.65.1623343631396; 
 Thu, 10 Jun 2021 09:47:11 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.113])
 by smtp.gmail.com with ESMTPSA id o20sm687010otl.2.2021.06.10.09.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 09:47:10 -0700 (PDT)
Received: (nullmailer pid 1948111 invoked by uid 1000);
 Thu, 10 Jun 2021 16:47:06 -0000
Date: Thu, 10 Jun 2021 11:47:06 -0500
From: Rob Herring <robh@kernel.org>
To: Jamin Lin <jamin_lin@aspeedtech.com>
Subject: Re: [PATCH v3 1/1] dt-bindings: aspeed-i2c: Convert txt to yaml format
Message-ID: <20210610164706.GA1948040@robh.at.kernel.org>
References: <20210603024839.27976-1-jamin_lin@aspeedtech.com>
 <20210603024839.27976-2-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210603024839.27976-2-jamin_lin@aspeedtech.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, ryan_chen@aspeedtech.com,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, Brendan Higgins <brendanhiggins@google.com>,
 chin-ting_kuo@aspeedtech.com, troy_lee@aspeedtech.com,
 steven_lee@aspeedtech.com, open list <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Rayn Chen <rayn_chen@aspeedtech.com>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 03 Jun 2021 10:48:19 +0800, Jamin Lin wrote:
> Convert aspeed i2c to yaml.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 75 +++++++++++++++++++
>  .../devicetree/bindings/i2c/i2c-aspeed.txt    | 49 ------------
>  2 files changed, 75 insertions(+), 49 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> 

Applied, thanks!
