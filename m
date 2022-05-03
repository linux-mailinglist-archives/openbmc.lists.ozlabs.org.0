Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD69C518B9B
	for <lists+openbmc@lfdr.de>; Tue,  3 May 2022 19:57:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kt72c5K27z3bqC
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 03:57:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.47; helo=mail-ot1-f47.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kt72N3jTrz3bcG
 for <openbmc@lists.ozlabs.org>; Wed,  4 May 2022 03:57:00 +1000 (AEST)
Received: by mail-ot1-f47.google.com with SMTP id
 s18-20020a056830149200b006063fef3e17so617151otq.12
 for <openbmc@lists.ozlabs.org>; Tue, 03 May 2022 10:57:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vq0pE2ihqfsGFKVmyUNJ/bbl6zB4mWl+pigcjVrj/W0=;
 b=ooYpiO0w/J/+QpRbcxecK8OYr6ob6jL7PQrsyMZcOEWj0H7U958klFS4NJ89ACQofQ
 i9W7FjyFJJRl34t54Nkm4M/NtLeRRD2DAXpiSofmRT83DDEKyuWdCWsfOCmNHgYPc8Sq
 iOA1oNewYl5iWKA7NmP8dh4FrPxkdW6JONxQ+Q1AFUw0uVAG5HjzLx6GhpkloWmFJRTE
 0aMmsAkxXSlGGB7FjY2k066FjW882vU/RUKCnoxRPfefGQ4vkVAP6jxE2nd4YTlCgD7o
 gEQ1Yl/M2kVw5ddXLWPW3b0Mueq0pT4xQBcfhSCkMpAUQ2glLWUk7FeW85XcAoKLjQDk
 6dpA==
X-Gm-Message-State: AOAM5305ks0i+4A6jR4AZlAMHipOgzJAoXCb38/UvWvWCdz24puwWe86
 D1mCB7R7Ty+VKnypFWUKBw==
X-Google-Smtp-Source: ABdhPJxvdIxFqhzLf7Q5hW6UAIrYzJZiNYchVBcqIK3ZmL7lWCa6YC05zLVRZTiMArKEHvhtSwXxIw==
X-Received: by 2002:a9d:6d99:0:b0:605:67e2:229b with SMTP id
 x25-20020a9d6d99000000b0060567e2229bmr6251477otp.13.1651600617845; 
 Tue, 03 May 2022 10:56:57 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 k16-20020a544710000000b00325cda1ff8asm3492711oik.9.2022.05.03.10.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 10:56:57 -0700 (PDT)
Received: (nullmailer pid 3957859 invoked by uid 1000);
 Tue, 03 May 2022 17:56:56 -0000
Date: Tue, 3 May 2022 12:56:56 -0500
From: Rob Herring <robh@kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH v5 1/2] dt-bindings: hwmon: Add nuvoton,nct6775
Message-ID: <YnFs6LSbYOFP8LzV@robh.at.kernel.org>
References: <20220428012707.24921-1-zev@bewilderbeest.net>
 <20220428012707.24921-2-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220428012707.24921-2-zev@bewilderbeest.net>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Renze Nicolai <renze@rnplus.nl>, Rob Herring <robh+dt@kernel.org>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 27 Apr 2022 18:27:06 -0700, Zev Weiss wrote:
> These Super I/O chips have an i2c interface that some systems expose
> to a BMC; the BMC's device tree can now describe that via this
> binding.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  .../bindings/hwmon/nuvoton,nct6775.yaml       | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
