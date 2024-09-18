Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FFD97C1C8
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2024 00:06:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8CQk6d0rz30Vg
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2024 08:06:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726697160;
	cv=none; b=nj3V1rVEg2vBAP+57bsEcB+XceR6Z/LP47tWopLqhqNZKBq/TyVZbJdAkI58pHdNt+BMEjmy2zEZY9qMJ6EFLIah8R9B3NHbhNHFv8owxZ2zq9esv/zsjRjkCCxbTOCDBaE2VauJBgeT4qVtueNLBNB7LDmzYMO8NhNNXoDYilhswf1fPL3kLD6aIQoaElpMKYxNfjHJ/sjl/h2JkZ+4qcqUepXS3Nv+FmfLGS7AhiJ3m7kqx8pPcK9gux46o227oVjn2PLoqy5GSxD9Pm+n1OrZtsyOEuEj3SJJ/daNp5Uf5zJ0EDx7UHujpUJyBWokbEl1Qr1nPu64p6RrjcCLAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726697160; c=relaxed/relaxed;
	bh=z5xLIA758LkWzz/rHz6k2eJ+6xHRJ4ERZeYwvd9K4b8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MESCjB+a7gwaw9xbbf+aK1es72Hu7f9OGdipgNtIYal49qzrvCQHrq8ho3LKeXM9uWHv5SSDluv5JL6g9FF0QpRGxAltNE/r5ia4MZRDMr5Y/HKZoZgWy0dy6+M7ZpiMkqAwPK9mfixePEtvtd4Lzd8+LagNiEVH9UYiPH5fFHs2kqc6YtuZxHr6PLv2eNuHEMpld4rAnm9KmBgLWCacDgL3d8LlXn0V6i6C0xVIucRCJ2AxKzx0jHK/yCASscHtb9HiavKcodF4OJuQGeHqafB2yma3vw0tKCZ8ccUIPQl/tWQdj0GOm0ohqjZokTT4keSnraBToDJ614P1sPCt1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HytxGIx0; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HytxGIx0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8CQc16m0z2xGX
	for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2024 08:06:00 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 00801A439E9;
	Wed, 18 Sep 2024 22:05:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 378FEC4CEC7;
	Wed, 18 Sep 2024 22:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726697154;
	bh=cgstcUehN5VFn4zlnu537vRmdjTjlflTYe2aXldB7nI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HytxGIx0sZvxygUX2fMMLg1CIj3SUmuzTpQ3SRV93+V6KC74PLjwbP+OgVjnUO3X8
	 3fzey17anr96jceWyCQhZ0FtBJfoRXL1wtDuJvdtyq0JhiRFduddr5DorFPdhmzZe/
	 /QpMcCShDDLPvjBgvTYWsvxAf3ojgxnMgVZZmfpmbZ+opPSxbMIYEHXKT2/3wSeFUa
	 T8h/UgGDLTzvNLOQ/UKpXSGffMOVZdxL2jIjQmXGuQqs31JBiTuzCwDVzLvp4T+5WU
	 wAOiXFfv2t5XW92qfdkRfG5D9VJG089L7tIg2yNsj9TYA0cxe5EhWv4u/1ChoId6iH
	 ae5P2I78apoKg==
Date: Wed, 18 Sep 2024 17:05:53 -0500
From: Rob Herring <robh@kernel.org>
To: Chanh Nguyen <chanh@os.amperecomputing.com>
Subject: Re: [PATCH] dt-bindings: hwmon: Add adt7462
Message-ID: <20240918220553.GA2216504-robh@kernel.org>
References: <20240918103212.591204-1-chanh@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240918103212.591204-1-chanh@os.amperecomputing.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Khanh Pham <khpham@amperecomputing.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Open Source Submission <patches@amperecomputing.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 18, 2024 at 10:32:12AM +0000, Chanh Nguyen wrote:
> Add device tree binding and example for adt7462 device.
> 
> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> ---
>  .../bindings/hwmon/onnn,adt7462.yaml          | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/onnn,adt7462.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/onnn,adt7462.yaml b/Documentation/devicetree/bindings/hwmon/onnn,adt7462.yaml
> new file mode 100644
> index 000000000000..4a980cca419a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/onnn,adt7462.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/onnn,adt7462.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ON Semiconductor ADT7462 Temperature, Voltage Monitor and Fan Controller
> +
> +maintainers:
> +  - Chanh Nguyen <chanh@os.amperecomputing.com>
> +
> +description: |
> +  The ADT7462 has temperature monitors, voltage monitors and multiple PWN Fan
> +  controllers.
> +
> +  The ADT7462 supports monitoring and controlling up to four PWM Fan Drive
> +  Outputs and eight TACH Inputs Measures. The ADT7462 supports reading a single
> +  on chip temperature sensor and three remote temperature sensors. There are up
> +  to 13 voltage monitoring inputs, ranging from 12V to 0.9V.
> +
> +  Datasheets:
> +    https://www.onsemi.com/pub/Collateral/ADT7462-D.PDF
> +
> +properties:
> +  compatible:
> +    const: onnn,adt7462
> +
> +  reg:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1

How would this work? 'resets' generally is used for on-chip devices and 
a reset controller. That doesn't exist at the board level. A standalone 
device typically uses a GPIO lines if there's a s/w controlled reset. 
That would be the 'reset-gpios' property.

Rob
