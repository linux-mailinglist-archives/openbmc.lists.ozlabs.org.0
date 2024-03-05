Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A60187119C
	for <lists+openbmc@lfdr.de>; Tue,  5 Mar 2024 01:23:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=GAbZ7jfk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpbrV2YTdz3cC9
	for <lists+openbmc@lfdr.de>; Tue,  5 Mar 2024 11:23:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=GAbZ7jfk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=lists.ozlabs.org)
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tpbqz6l2Wz30NP
	for <openbmc@lists.ozlabs.org>; Tue,  5 Mar 2024 11:22:55 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:712b:6300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 69C4FA10;
	Mon,  4 Mar 2024 16:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1709598170;
	bh=Hp1IA638kbZr0ad+eDcqEs+oUJWCsqexDOh7fw0VWOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GAbZ7jfkt8p4Wx1NZoOTD6k2ehRMXklDayuIPryAHzKjIITfW/5zV8RgIM9nd6hA/
	 i09uyDhkFAqN7mechLbiyyH0EqwsDOcd5hntFwxDAgUyKY1FeZENGGlz6uAkm3nFQp
	 f03Luow+FWEAEPgbr4TzKPmRvBlSNMtzacji3YaQ=
Date: Mon, 4 Mar 2024 16:22:49 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: baneric926@gmail.com
Subject: Re: [PATCH v4 1/3] dt-bindings: hwmon: fan: Add fan binding to schema
Message-ID: <1cf69d3e-a8b4-49f6-ac4d-550b525e45e2@hatter.bewilderbeest.net>
References: <20240227005606.1107203-1-kcfeng0@nuvoton.com>
 <20240227005606.1107203-2-kcfeng0@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20240227005606.1107203-2-kcfeng0@nuvoton.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, jdelvare@suse.com, corbet@lwn.net, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, naresh.solanki@9elements.com, billy_tsai@aspeedtech.com, kcfeng0@nuvoton.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, kwliu@nuvoton.com, Rob Herring <robh@kernel.org>, linux@roeck-us.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Feb 26, 2024 at 04:56:04PM PST, baneric926@gmail.com wrote:
>From: Naresh Solanki <naresh.solanki@9elements.com>
>
>Add common fan properties bindings to a schema.
>
>Bindings for fan controllers can reference the common schema for the
>fan
>
>child nodes:
>
>  patternProperties:
>    "^fan@[0-2]":
>      type: object
>      $ref: fan-common.yaml#
>      unevaluatedProperties: false
>
>Reviewed-by: Rob Herring <robh@kernel.org>
>Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
>Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
>Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>
>---
> .../devicetree/bindings/hwmon/fan-common.yaml | 78 +++++++++++++++++++
> 1 file changed, 78 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/hwmon/fan-common.yaml
>
>diff --git a/Documentation/devicetree/bindings/hwmon/fan-common.yaml b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
>new file mode 100644
>index 000000000000..15c591c74545
>--- /dev/null
>+++ b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
>@@ -0,0 +1,78 @@
>+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>+%YAML 1.2
>+---
>+$id: http://devicetree.org/schemas/hwmon/fan-common.yaml#
>+$schema: http://devicetree.org/meta-schemas/core.yaml#
>+
>+title: Common Fan Properties
>+
>+maintainers:
>+  - Naresh Solanki <naresh.solanki@9elements.com>
>+  - Billy Tsai <billy_tsai@aspeedtech.com>
>+
>+properties:
>+  max-rpm:
>+    description:
>+      Max RPM supported by fan.
>+    $ref: /schemas/types.yaml#/definitions/uint32
>+    maximum: 100000
>+
>+  min-rpm:
>+    description:
>+      Min RPM supported by fan.
>+    $ref: /schemas/types.yaml#/definitions/uint32
>+    maximum: 1000

I can't say with certainty that it's not, but are we sure 1000 is low 
enough?  Looking at just what I've got on hand, an 80mm fan I have will 
run steadily at about 1500RPM, and I'd assume larger ones (e.g. 120mm) 
could potentially go significantly lower...

>+
>+  pulses-per-revolution:
>+    description:
>+      The number of pulse from fan sensor per revolution.
>+    $ref: /schemas/types.yaml#/definitions/uint32
>+    maximum: 4

Might we want 'default: 2' here?

>+
>+  tach-div:
>+    description:
>+      Divisor for the tach sampling clock, which determines the sensitivity of the tach pin.
>+    $ref: /schemas/types.yaml#/definitions/uint32
>+
>+  target-rpm:
>+    description:
>+      The default desired fan speed in RPM.
>+    $ref: /schemas/types.yaml#/definitions/uint32
>+
>+  fan-driving-mode:
>+    description:
>+      Select the driving mode of the fan.(DC, PWM and so on)

Nit: could use a space before the parenthetical.

>+    $ref: /schemas/types.yaml#/definitions/string
>+    enum: [ dc, pwm ]
>+
>+  pwms:
>+    description:
>+      PWM provider.
>+    maxItems: 1
>+
>+  "#cooling-cells":
>+    const: 2
>+
>+  cooling-levels:
>+    description:
>+      The control value which correspond to thermal cooling states.
>+    $ref: /schemas/types.yaml#/definitions/uint32-array
>+
>+  tach-ch:
>+    description:
>+      The tach channel used for the fan.
>+    $ref: /schemas/types.yaml#/definitions/uint8-array

Nit: s/channel/channels/ given that it's an array?

>+
>+  label:
>+    description:
>+      Optional fan label
>+
>+  fan-supply:
>+    description:
>+      Power supply for fan.
>+
>+  reg:
>+    maxItems: 1
>+
>+additionalProperties: true
>+
>-- 
>2.34.1
>
>
