Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F6A4BD50D
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 06:21:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K29cx1Lhgz3cDn
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 16:21:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.43; helo=mail-io1-f43.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K25z230Bwz2yK6
 for <openbmc@lists.ozlabs.org>; Mon, 21 Feb 2022 13:36:28 +1100 (AEDT)
Received: by mail-io1-f43.google.com with SMTP id m185so14382571iof.10
 for <openbmc@lists.ozlabs.org>; Sun, 20 Feb 2022 18:36:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=EErPlw8IoKnm8FwUL5fnBoVB6JsQj/Ci/9SJLAoTs+E=;
 b=XjUHZ4M8HyPXWenY+pmT3hvbXZG8AVqhVGS7iJBG/PcJUjxE31/zGub8WQoxvGdvYc
 /W7GaI9RDYuVSce/V5w65F+ujFZYxazVv181QJvwZDz11s37IuBOT6btiU5gtU2wZcvY
 QaFJQrsh4Mk/6a+tIu9Efbu5KIZj+nFmeb2HWM/KtXIunQgCpuozjSSBsXvoV+Oa3Rg9
 MXuIU61Bomm36k/ncO2K9dW+DdU00DfMSVjRVuNhFXk3eQxFmUqhUgic6fPDnVgPfSSE
 tb2gFsNPcgdXim2t/M73LBPhlH6ZUmwWoikBmk7nnHEhLphj89JiVSE72SICyBKJfJye
 Us8A==
X-Gm-Message-State: AOAM531PX7Eiy68FbpfDT1QodfVTS8rj2CPZWoCCnqbo8WRp1ap8I4lB
 uclXbws5Tbr/i5vf1oYbyg==
X-Google-Smtp-Source: ABdhPJzC5b+zjhjMASmEgL11ZCPh6cCVKCz/8t1vDpotzNKaTj2G8qKb5Xk9MNyYc5SgGXikmBoIaQ==
X-Received: by 2002:a5e:950c:0:b0:640:de00:c18c with SMTP id
 r12-20020a5e950c000000b00640de00c18cmr4162188ioj.68.1645410985359; 
 Sun, 20 Feb 2022 18:36:25 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id q9sm7270371ilo.56.2022.02.20.18.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 18:36:24 -0800 (PST)
Received: (nullmailer pid 2041549 invoked by uid 1000);
 Mon, 21 Feb 2022 02:36:09 -0000
From: Rob Herring <robh@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
In-Reply-To: <20220220035321.3870-3-warp5tw@gmail.com>
References: <20220220035321.3870-1-warp5tw@gmail.com>
 <20220220035321.3870-3-warp5tw@gmail.com>
Subject: Re: [PATCH v2 02/11] dt-bindings: i2c: npcm: support NPCM845
Date: Sun, 20 Feb 2022 20:36:09 -0600
Message-Id: <1645410969.402841.2041548.nullmailer@robh.at.kernel.org>
X-Mailman-Approved-At: Mon, 21 Feb 2022 16:10:35 +1100
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
Cc: tmaimon77@gmail.com, KWLIU@nuvoton.com, tali.perry1@gmail.com,
 linux-i2c@vger.kernel.org, digetx@gmail.com, benjaminfair@google.com,
 krzysztof.kozlowski@canonical.com, openbmc@lists.ozlabs.org,
 JJLIU0@nuvoton.com, christophe.leroy@csgroup.eu, lukas.bulwahn@gmail.com,
 tomer.maimon@nuvoton.com, devicetree@vger.kernel.org, bence98@sch.bme.hu,
 arnd@arndb.de, sven@svenpeter.dev, robh+dt@kernel.org, Avi.Fishman@nuvoton.com,
 andriy.shevchenko@linux.intel.com, semen.protsenko@linaro.org,
 jie.deng@intel.com, avifishman70@gmail.com, venture@google.com,
 yangyicong@hisilicon.com, linux-kernel@vger.kernel.org, wsa@kernel.org,
 kfting@nuvoton.com, tali.perry@nuvoton.com, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, 20 Feb 2022 11:53:12 +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> Add compatible and nuvoton,sys-mgr description for NPCM i2c module.
> 
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> ---
>  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml       | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml:19:6: [warning] wrong indentation: expected 4 but found 5 (indentation)
./Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml:20:7: [warning] wrong indentation: expected 7 but found 6 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1595125

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

