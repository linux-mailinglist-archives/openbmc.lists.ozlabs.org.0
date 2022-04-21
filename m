Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26337509F82
	for <lists+openbmc@lfdr.de>; Thu, 21 Apr 2022 14:19:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kkc6L09Dlz3bVc
	for <lists+openbmc@lfdr.de>; Thu, 21 Apr 2022 22:19:22 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kkc626zwSz2yZv
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2022 22:19:06 +1000 (AEST)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-deb9295679so5200194fac.6
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2022 05:19:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=Bkyl59+yJGYlxOaG8bBfXwq3Mtz9w1jqTJhIUpZWLg0=;
 b=5uXcXY1fwPwW7bsLU8MW3B+rrwZR7OhNq8bGF6psIbYoElF/6ATxu8EWyEs+yTNtLG
 ysBHBhplzvHPt31s//ohF0D/UlNUDSc7scmt9wb606F93wzrZN37rIuWSUC4Td4toVcZ
 GB8LIMSOrap4vftCrW8hi5Bccruuxh/JZ7HqxT0GeaWJ28OiFLVBLszuoHbPHZN+CAab
 AO4RR4d5OIpeopRLFVzI8BkYW6+JB2VfkObpvsVvW/7lI9404nTxyGREhmNDoddki97M
 hPSszjMXbze7qLOj/+oELdcFz9qdAv8c/3h24uYi8+pggl6hHSKidBvfh5aeB6Uej9lw
 tYxA==
X-Gm-Message-State: AOAM533GoxM7fO7hfMm+7cZznftSnZuJRHZ6pv0qc42W3LKg1Z0HU6nX
 xMrnET2+/q18xb2UwFPyHQ==
X-Google-Smtp-Source: ABdhPJz96N7FmG2EahVdoLhvdwuy+bFDrSdoqpthix7QaE430aGKa4RhnG4KqOPXRu13Qv+Dq6w90g==
X-Received: by 2002:a05:6870:460f:b0:dd:cd0e:d931 with SMTP id
 z15-20020a056870460f00b000ddcd0ed931mr3869779oao.196.1650543542181; 
 Thu, 21 Apr 2022 05:19:02 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 fz13-20020a056870ed8d00b000e593f1f26fsm1023756oab.18.2022.04.21.05.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 05:19:01 -0700 (PDT)
Received: (nullmailer pid 3204418 invoked by uid 1000);
 Thu, 21 Apr 2022 12:19:00 -0000
From: Rob Herring <robh@kernel.org>
To: Medad CChien <medadyoung@gmail.com>
In-Reply-To: <20220421062836.16662-3-ctcchien@nuvoton.com>
References: <20220421062836.16662-1-ctcchien@nuvoton.com>
 <20220421062836.16662-3-ctcchien@nuvoton.com>
Subject: Re: [PATCH v7 2/3] dt-bindings: edac: nuvoton: add NPCM memory
 controller
Date: Thu, 21 Apr 2022 07:19:00 -0500
Message-Id: <1650543540.622713.3204417.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, tony.luck@intel.com, rric@kernel.org,
 tmaimon77@gmail.com, KWLIU@nuvoton.com, avifishman70@gmail.com,
 venture@google.com, openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, tali.perry1@gmail.com,
 KFTING@nuvoton.com, ctcchien@nuvoton.com, james.morse@arm.com, bp@alien8.de,
 YSCHU@nuvoton.com, linux-edac@vger.kernel.org, mchehab@kernel.org,
 benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 21 Apr 2022 14:28:35 +0800, Medad CChien wrote:
> Document devicetree bindings for the Nuvoton BMC NPCM memory controller.
> 
> Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Reviewed-by: Borislav Petkov <bp@alien8.de>
> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
> ---
>  .../edac/nuvoton,npcm-memory-controller.yaml  | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml:61:7: [error] no new line character at the end of file (new-line-at-end-of-file)

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

