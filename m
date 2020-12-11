Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FA22D6E7F
	for <lists+openbmc@lfdr.de>; Fri, 11 Dec 2020 04:27:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Csbn30D34zDqwP
	for <lists+openbmc@lfdr.de>; Fri, 11 Dec 2020 14:27:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.68; helo=mail-ot1-f68.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsbmD2TTczDqsX;
 Fri, 11 Dec 2020 14:26:17 +1100 (AEDT)
Received: by mail-ot1-f68.google.com with SMTP id f16so7031931otl.11;
 Thu, 10 Dec 2020 19:26:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FQJ0xYZsg9VuDPNWynmVTQgQAdgxX+zz3aAN9OxOmEM=;
 b=IS0m7MInW7+Trr41uIYVR6Za9fhSoBbXjjgjx53ii+9KKcWAUy0emAXjJGyNc9mAUe
 GIg1lSfzbuWsfK6z0Jr7hI/u0nykKkznJl+Ajk8CvobMIOTQ5d5tV7KoF4O7irw9+wr5
 NIksm91T9v59PAFPzdaR2k1qm9OChFNlqsnzhWJajibh/FXGkv6JtbEn3YocvtdxzVvA
 1YwH1xLwMtS0/793cXfSSe/mwbrNU6v15slmCqOb/FW2o8fVxCUjrqUW8MgHa90OWuFr
 +dEkV9XChgDAJWkn82OlN5fFG4fhIhBMuyGpPLPH7DUcNtXUUJHsl+DLGSJmD4D9wlMZ
 VXgg==
X-Gm-Message-State: AOAM533R+USl595pwn7r99+c1rtiLv9AdOZI8EGi/razYeQfXxupZgzj
 k38Kqc2EFvXVsXn9q3E4bvgXKXDN0A==
X-Google-Smtp-Source: ABdhPJzKUGBasM7BAwLTxygGxXIuMZ4ml/wcGxyjJSYLcS6Bmb5p1q1zlC+Ak1f0+07k0olzZmbmgg==
X-Received: by 2002:a9d:3a2:: with SMTP id f31mr8646104otf.216.1607657175132; 
 Thu, 10 Dec 2020 19:26:15 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id x66sm1498750oig.56.2020.12.10.19.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 19:26:14 -0800 (PST)
Received: (nullmailer pid 3574126 invoked by uid 1000);
 Fri, 11 Dec 2020 03:26:12 -0000
Date: Thu, 10 Dec 2020 21:26:12 -0600
From: Rob Herring <robh@kernel.org>
To: Troy Lee <troy_lee@aspeedtech.com>
Subject: Re: [PATCH 1/4] dt-bindings: hwmon: Add Aspeed AST2600 PWM/Fan
Message-ID: <20201211032612.GA3565720@robh.at.kernel.org>
References: <20201209075921.26689-1-troy_lee@aspeedtech.com>
 <20201209075921.26689-2-troy_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201209075921.26689-2-troy_lee@aspeedtech.com>
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
 ryan_chen@aspeedtech.com,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, billy_tsai@aspeedtech.com,
 leetroy@gmail.com, Philipp Zabel <p.zabel@pengutronix.de>,
 chiawei_wang@aspeedtech.com, Guenter Roeck <linux@roeck-us.net>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Dec 09, 2020 at 03:59:17PM +0800, Troy Lee wrote:
> For supporting a new AST2600 PWM/Fan hwmon driver, we add a new binding.
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> ---
>  .../bindings/hwmon/aspeed2600-pwm-tacho.txt   | 69 +++++++++++++++++++

Bindings are in DT schema format now.

>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed2600-pwm-tacho.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed2600-pwm-tacho.txt b/Documentation/devicetree/bindings/hwmon/aspeed2600-pwm-tacho.txt
> new file mode 100644
> index 000000000000..61b11914352f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/aspeed2600-pwm-tacho.txt
> @@ -0,0 +1,69 @@
> +ASPEED AST2600 PWM and Fan Tacho controller device driver
> +
> +The ASPEED PWM controller can support upto 16 PWM outputs. The ASPEED Fan Tacho
> +controller can support upto 16 Fan tachometer inputs.
> +
> +There can be upto 16 fans supported. Each fan can have one PWM output and
> +one Fan tach inputs.
> +
> +Required properties for pwm-tacho node:
> +- #address-cells : should be 1.
> +
> +- #size-cells : should be 0.
> +
> +- #cooling-cells: should be 2.
> +
> +- reg : address and length of the register set for the device.
> +
> +- pinctrl-names : a pinctrl state named "default" must be defined.
> +
> +- pinctrl-0 : phandle referencing pin configuration of the PWM ports.
> +
> +- compatible : should be "aspeed,ast2600-pwm-tachometer".
> +
> +- clocks : phandle to clock provider with the clock number in the second cell
> +
> +- resets : phandle to reset controller with the reset number in the second cell
> +
> +fan subnode format:
> +===================
> +Under fan subnode there can upto 16 child nodes, with each child node
> +representing a fan. There are 16 fans each fan can have one PWM port and one
> +Fan tach inputs.
> +For PWM port can be configured cooling-levels to create cooling device.
> +Cooling device could be bound to a thermal zone for the thermal control.
> +
> +Required properties for each child node:
> +- reg : should specify PWM source port.
> +	integer value in the range 0x00 to 0x0f with 0x00 indicating PWM port 0
> +	and 0x0f indicating PWM port F.
> +
> +- cooling-levels: PWM duty cycle values in a range from 0 to 255
> +                  which correspond to thermal cooling states.
> +
> +- aspeed,fan-tach-ch : should specify the Fan tach input channel.
> +                integer value in the range 0 through 15, with 0 indicating
> +		Fan tach channel 0 and 15 indicating Fan tach channel 15.
> +		Atleast one Fan tach input channel is required.

Already has 'fan-tach-ch' in npcm750-pwm-fan.txt.

> +
> +- aspeed,target-pwm : Specify the frequency of PWM. The value range from 24 to
> +		      780000. Default value will be set to 25000.
> +
> +- aspeed,pulse-pr : Specify tacho pulse per revolution of the fan. A general
> +		    parameter of pulse-pr is 2.

Already have 'pulses-per-revolution' property in pwm-fan.txt. Use that.

Really, all these should be in a common fan schema that you reference.

> +
> +Examples:
> +
> +&pwm_tacho {
> +	status = "okay";

Don't show status in examples.

> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_tach0_default>;
> +
> +	fan@0 {
> +		reg = <0x00>;
> +		aspeed,target-pwm = <25000>;
> +		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
> +		aspeed,pulse-pr = <2>;
> +	};
> +};
> -- 
> 2.17.1
> 
