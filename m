Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DA28538327
	for <lists+openbmc@lfdr.de>; Fri,  7 Jun 2019 05:32:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Kp4c3J1HzDqs8
	for <lists+openbmc@lfdr.de>; Fri,  7 Jun 2019 13:32:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.101.70; helo=foss.arm.com;
 envelope-from=james.morse@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by lists.ozlabs.org (Postfix) with ESMTP id 45KVQD1JH1zDqjp
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jun 2019 01:46:43 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DEC7A78;
 Thu,  6 Jun 2019 08:46:41 -0700 (PDT)
Received: from [10.1.196.105] (eglon.cambridge.arm.com [10.1.196.105])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA3693F690;
 Thu,  6 Jun 2019 08:46:37 -0700 (PDT)
Subject: Re: [PATCH 5.2 v2 2/2] dt-binding: edac: add NPCM ECC documentation
To: George Hung <ghung.quanta@gmail.com>
References: <20190605141253.38554-1-ghung.quanta@gmail.com>
 <20190605141253.38554-2-ghung.quanta@gmail.com>
From: James Morse <james.morse@arm.com>
Message-ID: <066d3d9b-f65e-7689-a3a7-d995e26fcbf3@arm.com>
Date: Thu, 6 Jun 2019 16:46:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190605141253.38554-2-ghung.quanta@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 07 Jun 2019 13:30:26 +1000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tali Perry <tali.perry1@gmail.com>,
 paulmck@linux.ibm.com, wak@google.com, benjaminfair@google.com,
 openbmc@lists.ozlabs.org, tomer.maimon@nuvoton.com, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Avi.Fishman@nuvoton.com, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-edac <linux-edac@vger.kernel.org>, Patrick Venture <venture@google.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, davem@davemloft.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi George,

On 05/06/2019 15:12, George Hung wrote:
> Add device tree documentation for Nuvoton BMC ECC

(Nit: The DT folk prefer patches adding bindings to come first in the series, before the
driver that uses them).


> diff --git a/Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt b/Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt
> new file mode 100644
> index 000000000000..dd4dac59a5bd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt
> @@ -0,0 +1,17 @@
> +Nuvoton NPCM7xx SoC EDAC device driver
> +
> +The Nuvoton NPCM7xx SoC supports DDR4 memory with/without ECC and the driver
> +uses the EDAC framework to implement the ECC detection and corrtection.

The commit message in the driver says this is a Cadence memory controller, can we describe
what it is here, and give it an additional compatible?


Thanks,

James

> +Required properties:
> +- compatible:	should be "nuvoton,npcm7xx-sdram-edac"
> +- reg:		Memory controller register set should be <0xf0824000 0x1000>
> +- interrupts:	should be MC interrupt #25
> +Example:
> +
> +	mc: memory-controller@f0824000 {
> +		compatible = "nuvoton,npcm7xx-sdram-edac";
> +		reg = <0xf0824000 0x1000>;
> +		interrupts = <0 25 4>;
> +	};
> 

