Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD1E3CA248
	for <lists+openbmc@lfdr.de>; Thu, 15 Jul 2021 18:29:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQfvf5WMMz307l
	for <lists+openbmc@lfdr.de>; Fri, 16 Jul 2021 02:29:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.44; helo=mail-io1-f44.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQfvQ5WTDz2ydJ;
 Fri, 16 Jul 2021 02:28:50 +1000 (AEST)
Received: by mail-io1-f44.google.com with SMTP id d9so7149227ioo.2;
 Thu, 15 Jul 2021 09:28:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DU/pjsNZXYd/mflQi0Kfu+Fvn8JWm+lHh6CuqP6iNvc=;
 b=rNpgsz4ypkJUGI7cw+fdpnPcl6KQhxi3GSiVTkPdwj/q2gQDODL9jQjWiSdJxBmDoo
 XADtwGQYP1cHdJpc1WUS8MpKU+TrCO6KrI3lKGvvqnoc4vVeSbrZ5QcKj6UQsMBNNoi9
 MeeoJ0kMqL06IoK7dtQZgb6QIOC5JFxStWIkGSSoxazWfqiLMK7JXaGTVh5JpztrxPg+
 lGBGJSS8QqfMlK+8CfcIEH6IyA6UDMrBQwxjfoTlAPvtpAbxEUm9C+N4FOyR3M8iOB45
 vZhAE8AxHXp9CJcLebqwFeLrHLI+qdVnHaTf4Idv+rh8kqia+ZJTh6xOGeLTCAG4Cdbr
 /daw==
X-Gm-Message-State: AOAM533X1Or5VI1Mp7zN/sQeczcU1pRJhkBOnJpcMEHYEAzIVPxoFaKx
 rtneHOzPIGxSL3kWoRSNcQ==
X-Google-Smtp-Source: ABdhPJyfCdrhjQU34aG9qE+M9t/V6VN32ihTfjbCf3Coc++/H9jqzMpmnWxNQkGbjUo/KkWnF+pVcw==
X-Received: by 2002:a6b:4e02:: with SMTP id c2mr3883015iob.166.1626366526415; 
 Thu, 15 Jul 2021 09:28:46 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id a11sm3368502ilf.79.2021.07.15.09.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 09:28:45 -0700 (PDT)
Received: (nullmailer pid 1194569 invoked by uid 1000);
 Thu, 15 Jul 2021 16:28:40 -0000
Date: Thu, 15 Jul 2021 10:28:40 -0600
From: Rob Herring <robh@kernel.org>
To: Iwona Winiarska <iwona.winiarska@intel.com>
Subject: Re: [PATCH 04/14] dt-bindings: Add bindings for peci-aspeed
Message-ID: <20210715162840.GA1187226@robh.at.kernel.org>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-5-iwona.winiarska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210712220447.957418-5-iwona.winiarska@intel.com>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, openbmc@lists.ozlabs.org, x86@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Yazen Ghannam <yazen.ghannam@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jul 13, 2021 at 12:04:37AM +0200, Iwona Winiarska wrote:
> Add device tree bindings for the peci-aspeed controller driver.
> 
> Co-developed-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
> ---
>  .../devicetree/bindings/peci/peci-aspeed.yaml | 111 ++++++++++++++++++
>  1 file changed, 111 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/peci/peci-aspeed.yaml
> 
> diff --git a/Documentation/devicetree/bindings/peci/peci-aspeed.yaml b/Documentation/devicetree/bindings/peci/peci-aspeed.yaml
> new file mode 100644
> index 000000000000..6061e06009fb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/peci/peci-aspeed.yaml
> @@ -0,0 +1,111 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/peci/peci-aspeed.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Aspeed PECI Bus Device Tree Bindings
> +
> +maintainers:
> +  - Iwona Winiarska <iwona.winiarska@intel.com>
> +  - Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> +
> +allOf:
> +  - $ref: peci-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2400-peci
> +      - aspeed,ast2500-peci
> +      - aspeed,ast2600-peci
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    description: |
> +      Clock source for PECI controller. Should reference the external
> +      oscillator clock.
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  clock-divider:
> +    description: This value determines PECI controller internal clock
> +      dividing rate. The divider will be calculated as 2 raised to the
> +      power of the given value.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 7
> +    default: 0
> +

> +  msg-timing:
> +    description: |
> +      Message timing negotiation period. This value will determine the period
> +      of message timing negotiation to be issued by PECI controller. The unit
> +      of the programmed value is four times of PECI clock period.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 255
> +    default: 1
> +
> +  addr-timing:
> +    description: |
> +      Address timing negotiation period. This value will determine the period
> +      of address timing negotiation to be issued by PECI controller. The unit
> +      of the programmed value is four times of PECI clock period.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 255
> +    default: 1
> +
> +  rd-sampling-point:
> +    description: |
> +      Read sampling point selection. The whole period of a bit time will be
> +      divided into 16 time frames. This value will determine the time frame
> +      in which the controller will sample PECI signal for data read back.
> +      Usually in the middle of a bit time is the best.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 15
> +    default: 8
> +
> +  cmd-timeout-ms:
> +    description: |
> +      Command timeout in units of ms.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 1000
> +    default: 1000

Are all of these properties common for PECI or specific to this 
controller? The former needs to go into the common schema. The latter 
need vendor prefixes.


> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - resets
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/ast2600-clock.h>
> +    peci-controller@1e78b000 {
> +      compatible = "aspeed,ast2600-peci";
> +      reg = <0x1e78b000 0x100>;
> +      interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
> +      clocks = <&syscon ASPEED_CLK_GATE_REF0CLK>;
> +      resets = <&syscon ASPEED_RESET_PECI>;
> +      clock-divider = <0>;
> +      msg-timing = <1>;
> +      addr-timing = <1>;
> +      rd-sampling-point = <8>;
> +      cmd-timeout-ms = <1000>;
> +    };
> +...
> -- 
> 2.31.1
> 
> 
