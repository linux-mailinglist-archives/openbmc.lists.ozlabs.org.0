Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B37B3515C6
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 16:56:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB5qT2Z9xz3bmX
	for <lists+openbmc@lfdr.de>; Fri,  2 Apr 2021 01:56:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.53; helo=mail-ot1-f53.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB5qH1BFnz2ysr;
 Fri,  2 Apr 2021 01:56:26 +1100 (AEDT)
Received: by mail-ot1-f53.google.com with SMTP id
 h6-20020a0568300346b02901b71a850ab4so2354547ote.6; 
 Thu, 01 Apr 2021 07:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=b51MdFXC3VyV3rk2wSYcP9E+sT/K1k0PZUFp+W5EgPY=;
 b=rHGOMoUYEgnp3ucaLJVRowVHSMm+bA3AMxLm1qNAsPnvAr/yDWgvsVxFY4N+ks8pNB
 VllEATUxAtAwgwmxdZwBcNgmen01tItHmfHjzSAm/jALu14qDg4WZNHRDRvyqy7djZcL
 3wdF2pDSHHiXH2N2gb8M3EATO+mpPkh0skI/QZcEKW/9K23aobak2tNFkzLKxdmBX68u
 lq40eP0qAQrDzlfrNfed9JWdEr4qPgDA0AKsuxg/ZfXafFLETmCfOMn3/NwZiZmvDI9A
 IikK7T79UYk6/YOZ+a/1aDJphVnyLoDmdogKhMqaJxEn2bVwvf+TOjGtGOpZbUce6U04
 e+qQ==
X-Gm-Message-State: AOAM532R1lQBMZUMwNZS+cEuEZuL/bD3h7e5VrI6gZdqjyh2MeZt7qGt
 ycfjVcRnmhNvlivcpn29DQ==
X-Google-Smtp-Source: ABdhPJzvGwq10FN++hBJ+VBjgxixDeXeYVqnUGGXPtJLMldLSliVun6grNAzy9JrRlq2ysk537TmhA==
X-Received: by 2002:a05:6830:4d:: with SMTP id
 d13mr7257198otp.295.1617288983889; 
 Thu, 01 Apr 2021 07:56:23 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t22sm1229535otl.49.2021.04.01.07.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 07:56:23 -0700 (PDT)
Received: (nullmailer pid 409159 invoked by uid 1000);
 Thu, 01 Apr 2021 14:56:21 -0000
From: Rob Herring <robh@kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>
In-Reply-To: <20210401005702.28271-4-zev@bewilderbeest.net>
References: <YGOuhjD19SmjmQou@hatter.bewilderbeest.net>
 <20210401005702.28271-1-zev@bewilderbeest.net>
 <20210401005702.28271-4-zev@bewilderbeest.net>
Subject: Re: [PATCH v2 3/3] dt-bindings: serial: 8250: add aspeed,
 sirq-active-high
Date: Thu, 01 Apr 2021 09:56:21 -0500
Message-Id: <1617288981.559685.409158.nullmailer@robh.at.kernel.org>
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
Cc: - <devicetree@vger.kernel.org>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>,
 Rob Herring <robh+dt@kernel.org>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 31 Mar 2021 19:57:02 -0500, Zev Weiss wrote:
> This provides a simpler, more direct alternative to the deprecated
> aspeed,sirq-polarity-sense property for indicating the polarity of
> the Aspeed VUART's SIRQ line.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  Documentation/devicetree/bindings/serial/8250.yaml | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/serial/8250.yaml:16:30: [warning] too few spaces after comma (commas)
./Documentation/devicetree/bindings/serial/8250.yaml:17:30: [warning] too few spaces after comma (commas)

dtschema/dtc warnings/errors:

See https://patchwork.ozlabs.org/patch/1460791

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

