Return-Path: <openbmc+bounces-1341-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHKXCP6JimnxLgAAu9opvQ
	(envelope-from <openbmc+bounces-1341-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Tue, 10 Feb 2026 02:29:34 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFF4115FCF
	for <lists+openbmc@lfdr.de>; Tue, 10 Feb 2026 02:29:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f93rV3lp5z2xQ1;
	Tue, 10 Feb 2026 12:29:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770686970;
	cv=none; b=RSLlt6t7q/dt5ujOrMNkQDRxRBlndbekc+8P9EMgiaBq3+BxVsoSjQjbbyzWCuI1sKNUuQ1WmI+lZ4FZ+SD3BxYCbOU0g4X9/9LdNyYJVOwNFnK7MMyeu5iR80WeArb4qdCZ1Og6tSdoiAqJt7pQC/D60yQ0Hi+uA4JqW2uGkKC+aTb0m86f4movP13XoAfKRM5fF2JAkyLPviABMJsQ1suUKsL7oKbCny2Ap7hrVFKH1VCwnRMARmULqitOIEKU07I5k7myL5FLA1xqOi8UU3Zz3DinBImATgzwcsuJ9Jr4aAaEtr6prNVyfsbyRuRDX/V4TDTvCwixVWWJMZM+0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770686970; c=relaxed/relaxed;
	bh=4SwyUPTN929uhlcM7XienEVnbkg9PW4CdbU+Sqb82fY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NIlLflwbJoKmCAI8KI0WSsiAn9K6AjheB3wVEOIOPKmwWiDgw3g+iN3JxaY5lubaivWw48QAl2VAWwB/F5s4Tp15exVhn9+UxSWdt0Pdu3a7yVxAQ+Td2T50HaDIIwqpuNe58gM14mBzvRIlkiNJs+ZpPnvPyIHaSimUkPc/buLZcfkHvIe7BZno1Xf2cfNHVCJO5osGig+Dp0CFSUnlOe/Fy+Wajw+sUJhDXIphN34mDHsGX5U/FwtbDM7mYzH9di/aYluliFIOrRhd5DRy/4fClfOsUCiaTZeJhkxKCCOpwnpS86SoBAdWiR4NEP5TDBYhH5X1aDzYTZdSL5rDuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N/9YaCNw; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N/9YaCNw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f93rT6VgZz2xN5
	for <openbmc@lists.ozlabs.org>; Tue, 10 Feb 2026 12:29:29 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 72E8142D57;
	Tue, 10 Feb 2026 01:29:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B6DC116C6;
	Tue, 10 Feb 2026 01:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770686967;
	bh=vPtgEERLhI7QUhtgMm5j4VLfBY7NaUFPnI8j3SoVhu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N/9YaCNww/VWJbyiYoqyRb2mg1WyMEGE331TuoF3q6kCtscpxoFiKym7AiVTaA3Ic
	 kk0S4qsyjWPSS2mKxAomH7M3IofnkyDsiRxBHSVOlF+kkwpnmNRg0b0L2rFNzQfpPz
	 s7o6Vj9NH6hf7e2QfCn/C/ziJ1M+NMWrQpMRCbXEsO/2JHYdgmocs92lp5wrUti6Gg
	 sqtixfIpF7vjzADDCJOHXtgxyHquG+hcReZGEXAklmygby+9UiTgXSIG3Jmjmxmkst
	 KWYNxWG/xNSABTeHxniwtMDSERXkFWnL5xDxaw3tbThZXBptRHhVkBQIXKLfSqXkQc
	 gDs4jTdxv5Qmw==
Date: Mon, 9 Feb 2026 19:29:26 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tzu-Hao Wei <twei@axiado.com>
Cc: openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	Vinod Koul <vkoul@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	SriNavmani A <srinavmani@axiado.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-phy@lists.infradead.org, linux-mmc@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: mmc: arasan,sdhci: Add Axiado AX3000
 SoC
Message-ID: <177068696529.2278295.8145891834285711544.robh@kernel.org>
References: <20260206-axiado-ax3000-add-emmc-host-driver-support-v3-0-ef83b09325be@axiado.com>
 <20260206-axiado-ax3000-add-emmc-host-driver-support-v3-1-ef83b09325be@axiado.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206-axiado-ax3000-add-emmc-host-driver-support-v3-1-ef83b09325be@axiado.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.30 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-1341-lists,openbmc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:twei@axiado.com,m:openbmc@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:vkoul@kernel.org,m:ulf.hansson@linaro.org,m:michal.simek@amd.com,m:pbolisetty@axiado.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:srinavmani@axiado.com,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:krzk+dt@kernel.org,m:adrian.hunter@intel.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,openbmc@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[openbmc,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[axiado.com:email]
X-Rspamd-Queue-Id: 2FFF4115FCF
X-Rspamd-Action: no action


On Fri, 06 Feb 2026 16:23:07 +0800, Tzu-Hao Wei wrote:
> From: SriNavmani A <srinavmani@axiado.com>
> 
> Add compatible strings for Axiado AX3000 SoC eMMC controller which
> is based on Arasan eMMC controller.
> 
> Signed-off-by: SriNavmani A <srinavmani@axiado.com>
> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
> ---
>  Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


