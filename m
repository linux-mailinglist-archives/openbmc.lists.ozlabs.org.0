Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAD5BEC13
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 08:38:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46f4y54gGmzDqbp
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 16:38:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.63.121; helo=1.mo2.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 1.mo2.mail-out.ovh.net (1.mo2.mail-out.ovh.net [46.105.63.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46f4xV6QpfzDq9B
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 16:38:02 +1000 (AEST)
Received: from player730.ha.ovh.net (unknown [10.108.42.167])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id C9E991ADD29
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 08:37:57 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player730.ha.ovh.net (Postfix) with ESMTPSA id 46844A1D57F2;
 Thu, 26 Sep 2019 06:37:55 +0000 (UTC)
Subject: Re: [PATCH linux dev-5.3 1/2] ARM: dts: Add 128MiB OpenBMC flash
 layout
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20190926063157.22743-1-joel@jms.id.au>
 <20190926063157.22743-2-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <a7d10fe3-b80f-81d8-b0fd-230f9f66ff96@kaod.org>
Date: Thu, 26 Sep 2019 08:37:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190926063157.22743-2-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6684749225259207430
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrfeefgddutdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 26/09/2019 08:31, Joel Stanley wrote:
> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
> 
> This is an alternate layout used by OpenBMC systems that require more
> space on the BMC's flash. In addition to more space for the rootfs, it
> supports a larger u-boot and Linux kernel FIT image.
> 
> The division of space is as follows:
> 
>  u-boot + env: 1MB
>  kernel/FIT: 9MB
>  rwfs: 86MB
>  rofs: 32MB
> 
> OpenBMC-Staging-Count: 1
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>


Reviewed-by: Cédric Le Goater <clg@kaod.org>


> ---
> v2: adjust layout to have larger u-boot and kernel
> ---
>  .../boot/dts/openbmc-flash-layout-128.dtsi    | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 arch/arm/boot/dts/openbmc-flash-layout-128.dtsi
> 
> diff --git a/arch/arm/boot/dts/openbmc-flash-layout-128.dtsi b/arch/arm/boot/dts/openbmc-flash-layout-128.dtsi
> new file mode 100644
> index 000000000000..05101a38c5bd
> --- /dev/null
> +++ b/arch/arm/boot/dts/openbmc-flash-layout-128.dtsi
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +partitions {
> +	compatible = "fixed-partitions";
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	u-boot@0 {
> +		reg = <0x0 0xe0000>; // 896KB
> +		label = "u-boot";
> +	};
> +
> +	u-boot-env@e0000 {
> +		reg = <0xe0000 0x20000>; // 128KB
> +		label = "u-boot-env";
> +	};
> +
> +	kernel@100000 {
> +		reg = <0x100000 0x900000>; // 9MB
> +		label = "kernel";
> +	};
> +
> +	rofs@a00000 {
> +		reg = <0xa00000 0x5600000>; // 86MB
> +		label = "rofs";
> +	};
> +
> +	rwfs@6000000 {
> +		reg = <0x6000000 0x2000000>; // 32MB
> +		label = "rwfs";
> +	};
> +};
> 

