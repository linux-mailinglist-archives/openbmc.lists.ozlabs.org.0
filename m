Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA6C3892A3
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 17:29:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlcHW5WVYz301L
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 01:29:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.178;
 helo=mail-oi1-f178.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlcHF173Qz2xZS;
 Thu, 20 May 2021 01:29:29 +1000 (AEST)
Received: by mail-oi1-f178.google.com with SMTP id d21so13433672oic.11;
 Wed, 19 May 2021 08:29:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=6sgw4dZNi4BFtEEc+m0JLU9MKkrHkvN3LLqqxVCcWAY=;
 b=I87jEzwGfqQ35x795z55CXJhIcExTtWRpYr1ffGT21TL0+1LCDegdHznFCnzldmT8Q
 Wz+RyJz53uJqMtcVcP/AxoX3AtS2TRsFbqfi9surA7Xz4B+Xrn/A9JK6MA6l7IdNq7Yt
 pZUeFG1pzYnGHwAFZCyQZP4HigiZ9mP5Hzgky8yqD3A89+UUacDTnrzr9yN5mTIKdThV
 h9JFsbITeScvewdd1zq5Jo62g64fFTMtcpkfxrGbHsdaSJePC6Yndltp8PQ6s5IWY++n
 wrT9ercP051VmM1Uc8iZoVQa7rO60oXkOrHtcx0cvfyuvuYr3lsM5XjWlLKj0T4jZ7He
 EEww==
X-Gm-Message-State: AOAM531SqAIH6jhODFAmScMcegdT6wNOPOPRqbekbfoyxuAYHWBjkcEC
 cf3+dRufrOH7zFemYyELYg==
X-Google-Smtp-Source: ABdhPJxpcJcisKTasg8QiYFuZTHsZe6ssMjCsGuLZrRJywLDzjgJu1juj+3zcOycyjoKvnHHz5hSzA==
X-Received: by 2002:a54:481a:: with SMTP id j26mr7226575oij.154.1621438166265; 
 Wed, 19 May 2021 08:29:26 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id b18sm1458otk.62.2021.05.19.08.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 08:29:25 -0700 (PDT)
Received: (nullmailer pid 3134231 invoked by uid 1000);
 Wed, 19 May 2021 15:29:24 -0000
From: Rob Herring <robh@kernel.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <20210519074934.20712-8-quan@os.amperecomputing.com>
References: <20210519074934.20712-1-quan@os.amperecomputing.com>
 <20210519074934.20712-8-quan@os.amperecomputing.com>
Subject: Re: [PATCH v3 7/7] bindings: ipmi: Add binding for Aspeed SSIF BMC
 driver
Date: Wed, 19 May 2021 10:29:24 -0500
Message-Id: <1621438164.118346.3134230.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Corey Minyard <minyard@acm.org>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 Phong Vo <phong@os.amperecomputing.com>, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 openipmi-developer@lists.sourceforge.net,
 Open Source Submission <patches@amperecomputing.com>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 19 May 2021 14:49:34 +0700, Quan Nguyen wrote:
> Add device tree binding document for the Aspeed SSIF BMC driver.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> v3:
>   + Switched to use DT schema format [Rob]
> 
>  .../bindings/ipmi/aspeed-ssif-bmc.yaml        | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.example.dts:21.13-26: Warning (reg_format): /example-0/ssif-bmc@10:reg: property has invalid length (4 bytes) (#address-cells == 1, #size-cells == 1)
Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.example.dt.yaml: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.example.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.example.dt.yaml: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.example.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.example.dt.yaml: example-0: ssif-bmc@10:reg:0: [16] is too short
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml

See https://patchwork.ozlabs.org/patch/1480727

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

