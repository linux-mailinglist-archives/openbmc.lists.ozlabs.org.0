Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC4E12421F
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 09:45:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47d7qg67dwzDqfr
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 19:45:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47d77W42WjzDqcl
 for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2019 19:13:42 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 00:13:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,328,1571727600"; d="scan'208";a="390109416"
Received: from qiantong-mobl.amr.corp.intel.com (HELO [10.251.0.98])
 ([10.251.0.98])
 by orsmga005.jf.intel.com with ESMTP; 18 Dec 2019 00:13:31 -0800
Subject: Re: [PATCH linux dev-5.4] ARM: dts: nuvoton: Update EVB for new PECI
 layout
To: Joel Stanley <joel@jms.id.au>, Avi Fishman <avifishman70@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>
References: <20191218042250.456677-1-joel@jms.id.au>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <b78983e8-1160-0eec-9efd-236909c45141@linux.intel.com>
Date: Wed, 18 Dec 2019 00:13:31 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191218042250.456677-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12/17/2019 8:22 PM, Joel Stanley wrote:
> The PECI device tree layout changed, breaking the EVB.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   arch/arm/boot/dts/nuvoton-npcm750-evb.dts | 25 ++++++++++++-----------
>   1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> index de9c668c6e9a..e02c04910ef0 100644
> --- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> +++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> @@ -492,18 +492,6 @@
>   				};
>   			};
>   
> -			peci: peci-bus@100000 {
> -				cmd-timeout-ms = <1000>;
> -				pull-down = <0>;
> -				host-neg-bit-rate = <15>;
> -				status = "okay";
> -				intel-peci-dimmtemp@30 {
> -					compatible = "intel,peci-client";
> -					reg = <0x30>;
> -					status = "okay";
> -				};
> -			};
> -
>   			spi0: spi@200000 {
>   				cs-gpios = <&gpio6 11 GPIO_ACTIVE_LOW>;
>   				status = "okay";
> @@ -610,3 +598,16 @@
>   		idle-states = <2>; /* Serial port mode 3 (takeover) */
>   	};
>   };
> +
> +&peci0 {
> +	cmd-timeout-ms = <1000>;
> +	pull-down = <0>;
> +	host-neg-bit-rate = <15>;
> +	status = "okay";
> +
> +	intel-peci-dimmtemp@30 {
> +		compatible = "intel,peci-client";
> +		reg = <0x30>;
> +		status = "okay";
> +	};
> +};
> 

Yes, I fixed peci nodes in 'nuvoton-common-npcm7xx.dtsi' using the new
PECI patch set because previous node setting was incorrect. PECI node
shape should be like:

bus: {
     controller: {
         client: {
         };
     };
};

so this fix is needed for nuvoton EVB.

Acked-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
