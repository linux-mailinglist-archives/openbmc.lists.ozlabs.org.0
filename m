Return-Path: <openbmc+bounces-1252-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLFMN3Cqb2lkEwAAu9opvQ
	(envelope-from <openbmc+bounces-1252-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Tue, 20 Jan 2026 17:16:48 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8827B473AF
	for <lists+openbmc@lfdr.de>; Tue, 20 Jan 2026 17:16:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwRRB3xxmz309S;
	Tue, 20 Jan 2026 23:27:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768912038;
	cv=none; b=EkmNuEyB0AvfejceaxoHtaJnk1gq6300EMOvi8ICBKslBX88nU4EQGwUCJbOQbCPJzPWHWl0UMjAvJA6A88ohcyCMYNYF2WfAOLfY+gIzKmzkTHYOKSpqO8W+VyYfM7vFx/ilBWBlfjUD/0nS3bCd2kQDVQr1sMgeu9ktRnSYbTLBGowf8Cqqy/nzU8rjmFzhnNtsdPqWEF+3ihgwMy3rbn4Ben3Fg+rtWSGSkbWUrgJalCP4XY1HCd0MMcwSxR4nZM6jjMKeDgNwrKurm3e46MheKzhaOJQOP5Z0tFkkFPzzzkAF5WrbSdCIQnkbOiHmshksuUgj/Ov/7RtGmq/1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768912038; c=relaxed/relaxed;
	bh=XXkE2HvcVxwas7DVsPIhOKr5uWNoyxHv4EBAIKTLQe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gJoX5jMSPbi969JGJIQTduY6NMm5ECokYobu8mW9SGQkmr36wiARaeMYE42dYgNi3vkowLMsMsM8e0v0tO+lDtXhrwQTfOhsjG59yi22pooj4yFQiZ2duoaJCctJEoZzF0fBP8O6Lcm/5g+qvDYINHr/93QUKfTNYCICU4Cy5g7XEflrIDzVjzLR0Hk8UBUbB1t2JwIjbdn/cMpBkcaVBEJ5MkWp25dW31aGq2R1bM8SVQCp8l/LuwKCzggmxkTPmrkBBBcMFAojSmtScjx/2/uIngtyfN1ToYjkskg6CN7YIVM1Z7xHTemxgaF4U6P/EkB1ZBvlHkcC1afoX3tgZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n8aC/Qvw; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n8aC/Qvw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwRR95MYXz2xZK;
	Tue, 20 Jan 2026 23:27:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CB55F600CB;
	Tue, 20 Jan 2026 12:27:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04F1FC16AAE;
	Tue, 20 Jan 2026 12:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768912035;
	bh=We6iPStU0ZFDOwTAL7qZlfBr4nmJKhgoqksa0yciLRc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n8aC/QvwvFFOP3yufXOJtOjJe/XstFlKJSXeyxXFVxtZom2AB4Wyb6Sl5K0vj96gN
	 a/tWGLtAI1Py1Hkdlb6KS9EDHPNv9rpQgBiA2ePMF2dG/CYc6Dp2ibQCBVuMk44Met
	 BWfvVLb2Hyrpnr8ep7OYAxDyUatZgk9eXGRCGNr3+mEZ1MRjZT57UO+x3DTPu2SHwn
	 BumztqbzymIqqbgJaatoZItVouoryCjUwo+OKY0XnhoiFiD8agFXwb4Af8BTdwwIBm
	 s8lo4pF5VEfABwAWlCxdY14qnkt8R0O9M+0TMUNqaFqWy7WHCdRLangR3t8mVSWK6j
	 Lq22G3QPoulyg==
Message-ID: <0d8ad41f-a2c4-4a4f-ac1f-68263648c4dc@kernel.org>
Date: Tue, 20 Jan 2026 13:27:09 +0100
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] pinctrl: aspeed: add G7(AST2700) SoC0 pinctrl
 support
To: Billy Tsai <billy_tsai@aspeedtech.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, bmc-sw@aspeedtech.com
References: <20260120-upstream_pinctrl-v3-0-868fbf8413b5@aspeedtech.com>
 <20260120-upstream_pinctrl-v3-3-868fbf8413b5@aspeedtech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <20260120-upstream_pinctrl-v3-3-868fbf8413b5@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-0.70 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1252-lists,openbmc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[openbmc,dt];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspeedtech.com:email,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Queue-Id: 8827B473AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/01/2026 12:43, Billy Tsai wrote:
> Add pinctrl support for the SoC0 instance of the ASPEED AST2700.
> 
> AST2700 consists of two interconnected SoC instances, each with its own
> pinctrl register block.
> 
> The SoC0 pinctrl hardware closely follows the design found in previous
> ASPEED BMC generations, allowing the driver to build upon the common
> ASPEED pinctrl infrastructure.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  drivers/pinctrl/aspeed/Kconfig                  |   8 +
>  drivers/pinctrl/aspeed/Makefile                 |   1 +
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c | 683 ++++++++++++++++++++++++
>  3 files changed, 692 insertions(+)
> 
> diff --git a/drivers/pinctrl/aspeed/Kconfig b/drivers/pinctrl/aspeed/Kconfig
> index 1a4e5b9ed471..16743091a139 100644
> --- a/drivers/pinctrl/aspeed/Kconfig
> +++ b/drivers/pinctrl/aspeed/Kconfig
> @@ -31,3 +31,11 @@ config PINCTRL_ASPEED_G6
>  	help
>  	  Say Y here to enable pin controller support for Aspeed's 6th
>  	  generation SoCs. GPIO is provided by a separate GPIO driver.
> +
> +config PINCTRL_ASPEED_G7
> +	bool "Aspeed G7 SoC pin control"
> +	depends on (ARCH_ASPEED || COMPILE_TEST) && OF
> +	select PINCTRL_ASPEED
> +	help
> +	  Say Y here to enable pin controller support for Aspeed's 7th
> +	  generation SoCs. GPIO is provided by a separate GPIO driver.
> diff --git a/drivers/pinctrl/aspeed/Makefile b/drivers/pinctrl/aspeed/Makefile
> index db2a7600ae2b..cb2c81a69551 100644
> --- a/drivers/pinctrl/aspeed/Makefile
> +++ b/drivers/pinctrl/aspeed/Makefile
> @@ -6,3 +6,4 @@ obj-$(CONFIG_PINCTRL_ASPEED)	+= pinctrl-aspeed.o pinmux-aspeed.o
>  obj-$(CONFIG_PINCTRL_ASPEED_G4)	+= pinctrl-aspeed-g4.o
>  obj-$(CONFIG_PINCTRL_ASPEED_G5)	+= pinctrl-aspeed-g5.o
>  obj-$(CONFIG_PINCTRL_ASPEED_G6)	+= pinctrl-aspeed-g6.o
> +obj-$(CONFIG_PINCTRL_ASPEED_G7) += pinctrl-aspeed-g7-soc0.o
> \ No newline at end of file

Do not introduce patch warnings.

> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c
> new file mode 100644
> index 000000000000..c4e828c8839a
> --- /dev/null
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c
> @@ -0,0 +1,683 @@
> +// SPDX-License-Identifier: GPL-2.0
> +

...

> +
> +static const struct aspeed_pinmux_ops aspeed_g7_soc0_ops = {
> +	.set = aspeed_g7_soc0_sig_expr_set,
> +};
> +
> +static struct aspeed_pinctrl_data aspeed_g7_soc0_pinctrl_data = {

Look at your existing drivers - what is missing here and in other places?

> +	.pins = aspeed_g7_soc0_pins,
> +	.npins = ARRAY_SIZE(aspeed_g7_soc0_pins),
> +	.pinmux = {
> +		.ops = &aspeed_g7_soc0_ops,
> +		.groups = aspeed_g7_soc0_groups,
> +		.ngroups = ARRAY_SIZE(aspeed_g7_soc0_groups),
> +		.functions = aspeed_g7_soc0_functions,
> +		.nfunctions = ARRAY_SIZE(aspeed_g7_soc0_functions),
> +	},
> +	.configs = aspeed_g7_soc0_configs,
> +	.nconfigs = ARRAY_SIZE(aspeed_g7_soc0_configs),
> +	.confmaps = aspeed_g7_soc0_pin_config_map,
> +	.nconfmaps = ARRAY_SIZE(aspeed_g7_soc0_pin_config_map),
> +};
> +
> +static int aspeed_g7_soc0_pinctrl_probe(struct platform_device *pdev)
> +{
> +	return aspeed_pinctrl_probe(pdev, &aspeed_g7_soc0_pinctrl_desc,
> +				    &aspeed_g7_soc0_pinctrl_data);
> +}
> +
> +static const struct of_device_id aspeed_g7_soc0_pinctrl_match[] = {
> +	{ .compatible = "aspeed,ast2700-soc0-pinctrl" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, aspeed_g7_soc0_pinctrl_match);
> +
> +static struct platform_driver aspeed_g7_soc0_pinctrl_driver = {
> +	.probe = aspeed_g7_soc0_pinctrl_probe,
> +	.driver = {
> +		.name = "aspeed-g7-soc0-pinctrl",
> +		.of_match_table = aspeed_g7_soc0_pinctrl_match,
> +		.suppress_bind_attrs = true,
> +	},
> +};
> +
> +static int __init aspeed_g7_soc0_pinctrl_init(void)
> +{
> +	return platform_driver_register(&aspeed_g7_soc0_pinctrl_driver);
> +}
> +arch_initcall(aspeed_g7_soc0_pinctrl_init);
> 


Best regards,
Krzysztof

