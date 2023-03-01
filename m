Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 320766A686A
	for <lists+openbmc@lfdr.de>; Wed,  1 Mar 2023 08:51:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRRJb0Dwqz3cJv
	for <lists+openbmc@lfdr.de>; Wed,  1 Mar 2023 18:51:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRRJ56b6vz3bg5;
	Wed,  1 Mar 2023 18:51:15 +1100 (AEDT)
Received: from [192.168.0.2] (ip5f5aefed.dynamic.kabel-deutschland.de [95.90.239.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 5291661CC457B;
	Wed,  1 Mar 2023 08:51:10 +0100 (CET)
Message-ID: <775059b1-4697-b745-4743-55f7f7a9143e@molgen.mpg.de>
Date: Wed, 1 Mar 2023 08:51:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] ARM: dts: aspeed: mtmitchell: Enable NCSI
To: Chanh Nguyen <chanh@os.amperecomputing.com>
References: <20230228102820.18477-1-chanh@os.amperecomputing.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20230228102820.18477-1-chanh@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Chanh,


Thank you for the patch.

Am 28.02.23 um 11:28 schrieb Chanh Nguyen:
> Support the mac3 (RGMII4) as an NC-SI stack instead of an MDIO PHY.
> 
> The OCP slot #0 and OCP slot #1 use a common the BMC_NCSI signal,

*the* seems a leftover.

> so we use only one of them at the same time. The OCP slot #0 will
> be enabled by PCA9539's setting by default.
> 
> Also, enable the OCP Auxiliary Power during booting.

Is there a reason not to make this a separate commit?


Kind regards,

Paul


> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> ---
> Changes in v2:
>     - Change PCA9539APW node name.                     [Krzysztof]
> ---
>   .../boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 37 ++++++++++++++++++-
>   1 file changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
> index 4b91600eaf62..1e0e88465254 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
> @@ -251,6 +251,14 @@
>   	pinctrl-0 = <&pinctrl_rgmii1_default>;
>   };
>   
> +&mac3 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rmii4_default>;
> +	clock-names = "MACCLK", "RCLK";
> +	use-ncsi;
> +};
> +
>   &fmc {
>   	status = "okay";
>   	flash@0 {
> @@ -439,6 +447,26 @@
>   	status = "okay";
>   };
>   
> +&i2c8 {
> +	status = "okay";
> +
> +	gpio@77 {
> +		compatible = "nxp,pca9539";
> +		reg = <0x77>;
> +		gpio-controller;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		#gpio-cells = <2>;
> +
> +		bmc-ocp0-en-hog {
> +			gpio-hog;
> +			gpios = <7 GPIO_ACTIVE_LOW>;
> +			output-high;
> +			line-name = "bmc-ocp0-en-n";
> +		};
> +	};
> +};
> +
>   &i2c9 {
>   	status = "okay";
>   };
> @@ -530,13 +558,20 @@
>   	/*V0-V7*/	"s0-hightemp-n","s0-fault-alert","s0-sys-auth-failure-n",
>   			"host0-reboot-ack-n","host0-ready","host0-shd-req-n",
>   			"host0-shd-ack-n","s0-overtemp-n",
> -	/*W0-W7*/	"ocp-aux-pwren","ocp-main-pwren","ocp-pgood","",
> +	/*W0-W7*/	"","ocp-main-pwren","ocp-pgood","",
>   			"bmc-ok","bmc-ready","spi0-program-sel","spi0-backup-sel",
>   	/*X0-X7*/	"i2c-backup-sel","s1-fault-alert","s1-fw-boot-ok",
>   			"s1-hightemp-n","s0-spi-auth-fail-n","s1-sys-auth-failure-n",
>   			"s1-overtemp-n","s1-spi-auth-fail-n",
>   	/*Y0-Y7*/	"","","","","","","","host0-special-boot",
>   	/*Z0-Z7*/	"reset-button","ps0-pgood","ps1-pgood","","","","","";
> +
> +	ocp-aux-pwren-hog {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(W, 0) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "ocp-aux-pwren";
> +	};
>   };
>   
>   &gpio1 {
