Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9FA5295EB
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 02:15:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2GqK0LF9z3c85
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 10:15:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.160.46; helo=mail-oa1-f46.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2Gpy4FsZz2ymf
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 10:15:20 +1000 (AEST)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-e5e433d66dso22337929fac.5
 for <openbmc@lists.ozlabs.org>; Mon, 16 May 2022 17:15:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+MGPkFedzBWWTZFMkE9ICS/Ar1qPUvfM/n8++syp/cg=;
 b=TvAJBoBnoXyS9q2zEEydgEJI6QFr5nOdWVM8rSUnT3tIL8ANAbxOrnm3WNOQXqVVBx
 fhlwmJxsuwsmoC87fgl8sOypw671cJ8f301DsnIU0mufI7B7Eg9SVkovVSLhJYGgct49
 63immVAYxZB+M5Q9fiI9nyPTGI9vfaUbZP3iOYUxpP9dwoYJECjqsR6+0s31IJwqsdMt
 4X082KRw08yUs3xMqFHzK2P7ovAKXhq46izHgYWXmK7bjCC41R+7zJoaAY3t2xGMm2hJ
 0515tQQPe0U2hkH72p4bXkaHghN0Ey5bVbazLNjUX0ySqEBcr/PUXjWRTqYdbzY2+3da
 kSAA==
X-Gm-Message-State: AOAM533yTCkKGUjjxJUYxpuVorAUCP05Bg30a1+ZKL6bnNU9pMcZTBjm
 X0nNlZ2mvvLWK8UpPzTMYA==
X-Google-Smtp-Source: ABdhPJxQE7L4OKvUt/rmmAg1s3JKLVo/sI0KgAiEWMfe4oKk5YAgIv27YetiLPfcYwWwyvyJ0hWf/g==
X-Received: by 2002:a05:6870:c14b:b0:e9:7ac2:230a with SMTP id
 g11-20020a056870c14b00b000e97ac2230amr16352524oad.264.1652746517683; 
 Mon, 16 May 2022 17:15:17 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 p12-20020a056830318c00b006060322124bsm4468164ots.27.2022.05.16.17.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 17:15:16 -0700 (PDT)
Received: (nullmailer pid 3627686 invoked by uid 1000);
 Tue, 17 May 2022 00:15:16 -0000
Date: Mon, 16 May 2022 19:15:16 -0500
From: Rob Herring <robh@kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH v2 1/2] dt-bindings: connector: Add regulator-connector
 binding
Message-ID: <20220517001516.GA3627625-robh@kernel.org>
References: <20220505232557.10936-1-zev@bewilderbeest.net>
 <20220505232557.10936-2-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220505232557.10936-2-zev@bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 05 May 2022 16:25:56 -0700, Zev Weiss wrote:
> This describes a power connector supplied by a regulator, such as a
> power outlet on a power distribution unit (PDU).
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  .../connector/regulator-connector.yaml        | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/connector/regulator-connector.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
