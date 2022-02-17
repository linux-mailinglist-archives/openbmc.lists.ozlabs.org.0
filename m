Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8714BA62D
	for <lists+openbmc@lfdr.de>; Thu, 17 Feb 2022 17:40:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K00tX3JQ0z3cbD
	for <lists+openbmc@lfdr.de>; Fri, 18 Feb 2022 03:40:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.177;
 helo=mail-il1-f177.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K00tG6RTRz3bT6
 for <openbmc@lists.ozlabs.org>; Fri, 18 Feb 2022 03:40:06 +1100 (AEDT)
Received: by mail-il1-f177.google.com with SMTP id n5so2649478ilk.12
 for <openbmc@lists.ozlabs.org>; Thu, 17 Feb 2022 08:40:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=ZTjwSd+wHhmCGk8JqBXyhv8IcrizpvVNCPSWVUYfN5Q=;
 b=Mtp/DMSmT50hz+xnhPTglEwuo7gxeeu/abGo9BPeLENmHMqg5z/cMhHQoJQC5Daykp
 v7egXlVTjLitwe8UMnzmW5wxNZgDXBZSVEM9MP7BDlzU/PnB/RvguFnzp1J0hMNo7SKx
 FPXHVaY96r9kRNF2zc2I9s+Mc2BRef/qEDOQ0WjtXQ5bA/YXgbHA5LC041p9vDh5RPgl
 GmjL7+P1/m9UY+LRlHaA6nHyliwBO1YlIQYWedIlIy32Z07kb7TUZTBrAcSkIj1nFt4q
 xLN9eTApF91Tw1FaAdDzpnOiQsZF3yz8SSyukGTkBgGmuL6qgis6p09DgldBXw4ZAgXH
 tB1g==
X-Gm-Message-State: AOAM533/Lg0gA8xuUX3UCcAqeeGQxK6YLZGtVc1ud9v3BGdnlx56JzAU
 KlnE0DNwW42KaVBkmsBE5Q==
X-Google-Smtp-Source: ABdhPJz1Y8+veVYBuVo5eRY627g99ZkONn9xwBPYq02yX+hJd5PmyyrIfeQd/bz4Iu6Wu1GjvWbFEQ==
X-Received: by 2002:a92:d242:0:b0:2b9:a33b:9068 with SMTP id
 v2-20020a92d242000000b002b9a33b9068mr2622224ilg.144.1645116002966; 
 Thu, 17 Feb 2022 08:40:02 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id q4sm2131485ilv.5.2022.02.17.08.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 08:40:02 -0800 (PST)
Received: (nullmailer pid 3365327 invoked by uid 1000);
 Thu, 17 Feb 2022 16:39:55 -0000
From: Rob Herring <robh@kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>
In-Reply-To: <20220217104444.7695-4-zev@bewilderbeest.net>
References: <20220217104444.7695-1-zev@bewilderbeest.net>
 <20220217104444.7695-4-zev@bewilderbeest.net>
Subject: Re: [PATCH 3/4] dt-bindings: Add power-efuse binding
Date: Thu, 17 Feb 2022 10:39:55 -0600
Message-Id: <1645115995.379177.3365326.nullmailer@robh.at.kernel.org>
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
 Jean Delvare <jdelvare@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 17 Feb 2022 02:44:43 -0800, Zev Weiss wrote:
> This can be used to describe a power output supplied by a regulator
> device that the system controls.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  .../devicetree/bindings/misc/power-efuse.yaml | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/power-efuse.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/misc/power-efuse.yaml:10:2: [warning] wrong indentation: expected 2 but found 1 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1594124

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

