Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 067F04D6264
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 14:29:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFRbm6nQRz3bfJ
	for <lists+openbmc@lfdr.de>; Sat, 12 Mar 2022 00:29:08 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFRbQ5t6tz3bVX
 for <openbmc@lists.ozlabs.org>; Sat, 12 Mar 2022 00:28:50 +1100 (AEDT)
Received: by mail-ot1-f47.google.com with SMTP id
 w17-20020a056830111100b005b22c584b93so6244681otq.11
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2022 05:28:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=DqWgVz4mscQx7VQZPkY837R3TSNSLttxQeZWV9I4qb4=;
 b=LjNpH52/Gsk8mqdKSghc4hqjzHYS8wsmcAmyJKRN7/5quduKbMMEIJTv0LShBbFI6K
 N6Xur8F98NOf00jr7FwuEX4YRYUI52l2v6tqVsBfFXsjejhDUkLmTG6JB+sTaxf9B9fy
 c3s4QEIVqV40qhIc1fjgDKkZp2oVf+UIWJZMhGVjfTJlr2DhU5QnNo+A89RR5gVv2N9f
 4SsTBwvlkaqweKB4jqhymJ3D9Pb2iCrvaT5s+f5gW8HOHi7fx7fMBmWo/8KcO2PAJgZG
 g2WKSPMTwwujaDTSkEkLSwZhZbFta1qCI1S/JDj9xcwhY3Fxl242hLMp4q0+cRN3kbtm
 4FTw==
X-Gm-Message-State: AOAM531HDp8H7U78muvO6cxUkXU6YW2yup6uom91rHZypQHnjc1XAriQ
 uxun5tBznDye/WvIxgxuFQ==
X-Google-Smtp-Source: ABdhPJyW3etsHadVks+qdx/NCSOI597tN0DpxS5HBRpw1Cqr6gc/YxuiIbex7hKaXujqBfrqa3jSPw==
X-Received: by 2002:a05:6830:438d:b0:5c4:f0f:70ac with SMTP id
 s13-20020a056830438d00b005c40f0f70acmr4240041otv.111.1647005327910; 
 Fri, 11 Mar 2022 05:28:47 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 r23-20020a056830237700b005b2610517c8sm3613104oth.56.2022.03.11.05.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 05:28:47 -0800 (PST)
Received: (nullmailer pid 3638165 invoked by uid 1000);
 Fri, 11 Mar 2022 13:28:45 -0000
From: Rob Herring <robh@kernel.org>
To: Medad CChien <medadyoung@gmail.com>
In-Reply-To: <20220311014245.4612-3-ctcchien@nuvoton.com>
References: <20220311014245.4612-1-ctcchien@nuvoton.com>
 <20220311014245.4612-3-ctcchien@nuvoton.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: edac: nuvoton,
 npcm-memory-controller.yaml
Date: Fri, 11 Mar 2022 07:28:45 -0600
Message-Id: <1647005325.599595.3638164.nullmailer@robh.at.kernel.org>
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
Cc: KWLIU@nuvoton.com, tony.luck@intel.com, rric@kernel.org,
 tmaimon77@gmail.com, linux-edac@vger.kernel.org, devicetree@vger.kernel.org,
 avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org,
 KFTING@nuvoton.com, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, tali.perry1@gmail.com, ctcchien@nuvoton.com,
 james.morse@arm.com, bp@alien8.de, YSCHU@nuvoton.com, mchehab@kernel.org,
 benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 11 Mar 2022 09:42:44 +0800, Medad CChien wrote:
> Add device tree bindings for NPCM memory controller.
> 
> Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
> ---
>  .../edac/nuvoton,npcm-memory-controller.yaml  | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/edac/nuvoton,npcm-memory-controller.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1604217

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

