Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F10356C190
	for <lists+openbmc@lfdr.de>; Sat,  9 Jul 2022 00:14:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LfndD1ccSz3c8C
	for <lists+openbmc@lfdr.de>; Sat,  9 Jul 2022 08:14:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.48; helo=mail-io1-f48.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lfncv5Nl0z3bhK
	for <openbmc@lists.ozlabs.org>; Sat,  9 Jul 2022 08:14:22 +1000 (AEST)
Received: by mail-io1-f48.google.com with SMTP id u20so227681iob.8
        for <openbmc@lists.ozlabs.org>; Fri, 08 Jul 2022 15:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qizlKD9bE5dN8tJcWqnW6FaDP0qSa79ZfPV40HiDdGQ=;
        b=MpxmXLTc3dGctmD2ncdybRht3l3X0Ib6L7LD8mf0hPTtsgnw2hgTIAQ+xD177P1gYH
         p8ryqQzzt/e76Lb28mDsWmrLDW+EBfknUOPBaShJwmx1OUo+5EwTXABaO4+bTqEbWSQy
         ZPlh4TpneBe/WYluI4bJfYa8pyyTMPzb5VvyNkTRNvox5gLMccJT7nt9OcARIbszCg+0
         8DhCV7ulYySOG5pYXyDyYGlBartk9vW5LbESug32EbCJwmwPg6iJWEahqnE5SJ0KGJfu
         YedVBEEGLKDxzP13dyHmKHQcxjWYMqBFU/Di/kLio3ah4zcDpzC61vw0yHF7JwUDW7+h
         2pFA==
X-Gm-Message-State: AJIora/WDqjpchST4+ou8BNQl7VYKig840qgvbsN3DtR58jhBXFLAkAr
	HGZ528qhighDHkKlaWq2hA==
X-Google-Smtp-Source: AGRyM1t4peia84G04eriBOduqU7X4VUiKCFhcEgAmMHSCwj5GjAENVk5PMLOfC7mJNOQOcZb13sK1g==
X-Received: by 2002:a05:6602:2e8e:b0:669:d5b1:3fc9 with SMTP id m14-20020a0566022e8e00b00669d5b13fc9mr3158325iow.210.1657318459564;
        Fri, 08 Jul 2022 15:14:19 -0700 (PDT)
Received: from robh.at.kernel.org ([98.38.210.73])
        by smtp.gmail.com with ESMTPSA id w10-20020a92db4a000000b002dad39ff841sm10133296ilq.19.2022.07.08.15.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 15:14:19 -0700 (PDT)
Received: (nullmailer pid 1573273 invoked by uid 1000);
	Fri, 08 Jul 2022 22:14:17 -0000
Date: Fri, 8 Jul 2022 16:14:17 -0600
From: Rob Herring <robh@kernel.org>
To: Mia Lin <mimi05633@gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: rtc: nuvoton: add NCT3018Y Real Time
 Clock
Message-ID: <20220708221417.GA1573219-robh@kernel.org>
References: <20220707073054.3954-1-mimi05633@gmail.com>
 <20220707073054.3954-2-mimi05633@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707073054.3954-2-mimi05633@gmail.com>
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
Cc: a.zummo@towertech.it, devicetree@vger.kernel.org, alexandre.belloni@bootlin.com, YSCHU@nuvoton.com, tmaimon77@gmail.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, KFTING@nuvoton.com, robh+dt@kernel.org, mylin1@nuvoton.com, krzysztof.kozlowski+dt@linaro.org, ctcchien@nuvoton.com, KWLIU@nuvoton.com, linux-rtc@vger.kernel.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 07 Jul 2022 15:30:52 +0800, Mia Lin wrote:
> Document devicetree bindings for the Nuvoton NCT3018Y Real Time Clock.
> 
> Signed-off-by: Mia Lin <mimi05633@gmail.com>
> ---
>  .../bindings/rtc/nuvoton,nct3018y.yaml        | 45 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
