Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 951AE87865E
	for <lists+openbmc@lfdr.de>; Mon, 11 Mar 2024 18:35:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iP5wdNZR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TtkSM2t3pz3dV3
	for <lists+openbmc@lfdr.de>; Tue, 12 Mar 2024 04:35:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iP5wdNZR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TtkRn3NG2z30Np
	for <openbmc@lists.ozlabs.org>; Tue, 12 Mar 2024 04:34:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 346BCCE119E;
	Mon, 11 Mar 2024 17:34:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41292C433C7;
	Mon, 11 Mar 2024 17:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710178480;
	bh=Ej9iokf53c+lmdcFKb97Bh3rX/K4nJN37K+iO8QuNG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iP5wdNZRWbyLGV7n0/bjFdODYl8MNg1fI9i4ew9aeafT9munvawc3OOZNIJgUtrXN
	 vJL2ikiWAjyE+xybzKAU+ntk/jAhBvoYfkheLnE38hquKHmVwTLMezI+syNFcbS/pD
	 ZxadFE+//WtrTX8+JmxuVOWIAJ2Faxu34Vn1aKqU05OVZP5DI6Fr6d+aScXF8j7Ouq
	 8np2tczT7U1CeqTRApaWLSLhMg5hI4jJxotuu0bHmF7aSE9cOvR2sNfNDwtUy4OHt+
	 g6HxkyYHB/w4NL4PZiu92p42rhVG3aERV4M7IZX5iIxhRgA97eOeTloUpxk3VINiJJ
	 FF5elrXLxbJgg==
Date: Mon, 11 Mar 2024 11:34:38 -0600
From: Rob Herring <robh@kernel.org>
To: Chanh Nguyen <chanh@os.amperecomputing.com>
Subject: Re: [PATCH 3/3] dt-bindings: hwmon: max31790: Add
 pwmout-pin-as-tach-input property
Message-ID: <20240311173438.GA1451467-robh@kernel.org>
References: <20240311111347.23067-1-chanh@os.amperecomputing.com>
 <20240311111347.23067-4-chanh@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240311111347.23067-4-chanh@os.amperecomputing.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Justin Ledford <justinledford@google.com>, Quan Nguyen <quan@os.amperecomputing.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Open Source Submission <patches@amperecomputing.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Mar 11, 2024 at 06:13:47PM +0700, Chanh Nguyen wrote:
> Add pwmout-pin-as-tach-input property.
> 
> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> ---
>  Documentation/devicetree/bindings/hwmon/max31790.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/max31790.yaml b/Documentation/devicetree/bindings/hwmon/max31790.yaml
> index 5a93e6bdebda..447cac17053a 100644
> --- a/Documentation/devicetree/bindings/hwmon/max31790.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/max31790.yaml
> @@ -25,6 +25,16 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  pwmout-pin-as-tach-input:
> +    description: |
> +      An array of six integers responds to six PWM channels for
> +      configuring the pwm to tach mode.
> +      When set to 0, the associated PWMOUT produces a PWM waveform for
> +      control of fan speed. When set to 1, PWMOUT becomes a TACH input
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    maxItems: 6
> +    minItems: 6

Seems incomplete. For example, fan tachs have different number of 
pulses per revolution, don't you need to know that too? 

There's a common fan binding now (or pending). You should use that and 
this property won't be needed.

Rob
