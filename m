Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A40D42F4F0A
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 16:46:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGBct0SpWzDrYX
	for <lists+openbmc@lfdr.de>; Thu, 14 Jan 2021 02:46:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.45; helo=mail-ot1-f45.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGBbd5nFCzDrT8;
 Thu, 14 Jan 2021 02:45:13 +1100 (AEDT)
Received: by mail-ot1-f45.google.com with SMTP id b24so2317920otj.0;
 Wed, 13 Jan 2021 07:45:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=BdqXQGPD/2NkmrUn+nwTJIVFrUkOiALOYcPswXSNO90=;
 b=ZqPVT5ZMdPGYzZNbemULhhU7qcjSzIPkgmKrnq7a60SQ4Me7BJjbuBtpkqfjBkg4ao
 YYq+Bk7vrfNXxaMGMGyOUEdAGd0NNnEUc7tn/4LdrrxrcscYSjaHQMamAr95IAiLyXA3
 XGHRPv3i+PkFnPGP/E7e1HGN5EuQ5YTnCNd5lMPUAQ4G6yWncw4idszRJJAK9dZgVh1K
 ID3HLyEwf6dFaB5/9pw0Xs94GTHCsZi9PXoXl2WKnKj0AQGQ0KeAGjtMMYTbNwuqhmym
 4ntWsDuPKHAX0JZ5gaK9EbpH+AEWXNijfKYLX1xxRk/bro1xhOGtYMQ/8AwgGBkf9OUd
 IRSw==
X-Gm-Message-State: AOAM531A2jmrMs/NBgHMWoV+uhsTDzHYRhDWKszm6XHadPB1VCucRQ/P
 wS7718zmBPRHuEsuw8aqvw==
X-Google-Smtp-Source: ABdhPJy4hkTHovaDGHQtQFCzHl7/SUzB/mHRgEcMFxcZ7l5Zny0qeiF6qMQ2g2l+BQXq5hJIOLfSPg==
X-Received: by 2002:a05:6830:210a:: with SMTP id
 i10mr1626364otc.145.1610552710748; 
 Wed, 13 Jan 2021 07:45:10 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t13sm453609oih.26.2021.01.13.07.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 07:45:09 -0800 (PST)
Received: (nullmailer pid 2506186 invoked by uid 1000);
 Wed, 13 Jan 2021 15:45:04 -0000
From: Rob Herring <robh@kernel.org>
To: Troy Lee <troy_lee@aspeedtech.com>
In-Reply-To: <20210113070850.1184506-2-troy_lee@aspeedtech.com>
References: <20210113070850.1184506-1-troy_lee@aspeedtech.com>
 <20210113070850.1184506-2-troy_lee@aspeedtech.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: hwmon: Add Aspeed AST2600 PWM/Fan
Date: Wed, 13 Jan 2021 09:45:04 -0600
Message-Id: <1610552704.291941.2506185.nullmailer@robh.at.kernel.org>
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
Cc: "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Guenter Roeck <linux@roeck-us.net>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, leetroy@gmail.com,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 chiawei_wang@aspeedtech.com, "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 13 Jan 2021 07:08:45 +0000, Troy Lee wrote:
> We add binding for supporting a new AST2600 PWM/Fan hwmon driver.
> 
> Changes since v1:
> - dt binding with DT schema format
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> ---
>  .../hwmon/aspeed,ast2600-pwm-tachometer.yaml  | 137 ++++++++++++++++++
>  1 file changed, 137 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,ast2600-pwm-tachometer.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/hwmon/aspeed,ast2600-pwm-tachometer.yaml:108:2: [warning] wrong indentation: expected 2 but found 1 (indentation)

dtschema/dtc warnings/errors:

See https://patchwork.ozlabs.org/patch/1425628

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

