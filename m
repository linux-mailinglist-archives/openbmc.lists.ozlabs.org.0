Return-Path: <openbmc+bounces-1017-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AC1CB90A9
	for <lists+openbmc@lfdr.de>; Fri, 12 Dec 2025 16:06:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dSXq265G9z2xjb;
	Sat, 13 Dec 2025 02:06:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765551998;
	cv=none; b=JURxqFJvCMB8WkBSGrKANfr9nOkYaHL3x7rtdfXX2stqC0bw/p95U7ZFSHzeIJRcf0xP4Uur6X7uuRt+kyb6V8zBfupaSSXdxAda6xLQrgl+Ns0UmOBSiSo7528Zxz1/KDDmjKjo0/Pxu6YgMJM2TphkwH4WyXixmYnrnJI3Lcyu+MEpArNoVyl0/bp5K8mo0gFgAPMYfXokAQ8NjgKLkrcQHlArbsBQsguGIvQqHF16+xwdMuWWWL5ZcwVvW/vAGrCRyccQ6IMSecNyAl6vRa57itDMJZvh4sO2gbQtIPNrvWbirMgAVjtobQluxhrcTEnw+JmaWcIUj/gWQeGw9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765551998; c=relaxed/relaxed;
	bh=IOZVGOIgHQO1fbsk1a6ryzZvj2S5GXoMQI3inerOk7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OrZHOXpKczODl1CZr+snLy+7g1CXkTo28RCmYv9YWIpk3wotFTMQEavemev3xL1AwBkgc2XtLudIFSUh7g7Mq2IWxV8984NniwzGgqxrK4nzPTkNBA9DavYymg6dMl7NPDpwOIvx5d0srmBVKdDBDsdJ7R8vubOOOpa+8hZE+i/iV07Lic+jokJbfBE6yvrzEd1zJHXl+lR9+yZhY50vua0AX0SSv5Th9HJnz+JRckhS4JxpC8OPWu43ppUEGYBsnjKnlix38puxC7J4vgA48jOrldEzXV2J7XXD7iyxOZwB2WQ201TX5Gyq8lV+5519cKah63lfUCy0zKazgbfT8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PNpBb7ZG; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PNpBb7ZG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dSXq11MW2z2xGY;
	Sat, 13 Dec 2025 02:06:37 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9363C60008;
	Fri, 12 Dec 2025 15:06:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12611C4CEF1;
	Fri, 12 Dec 2025 15:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765551994;
	bh=i6MeqSZJJ3hHFz2r4+e4b3P7T9WrW1v1WkoNCvc0ZZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PNpBb7ZGqIVlmaf47k6ev2T4JjXdjAO+tcbKShFJsIO55k3KtGbE03/P7Svf3km2w
	 N7HxOvFwRaYla6WM589pL2VAM0U9dkquInkkqDc4rd5cwldPZhGPVk6YjPrL5BfTkw
	 OMrXAPXy/3HJ9MxzbyS7SeN2BzR/tFLC1uSU6dV72zAX6zZq+182FPtOI7Ulu6JyaQ
	 v6Hl59jMGME7mGMvO7nAvG2EoQDbMGCC+PLsGJXMz0B6b2YoQJQQDJMgWrF++vtmBy
	 mh3LZTJwv+O+R+frS4ZeyU+/czISRuySQ/llWCRnjLNvM+tqiSK517M7+UjOikTVk1
	 r8da6U0nOJsZg==
Date: Fri, 12 Dec 2025 09:06:31 -0600
From: Rob Herring <robh@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH RFC 00/16] Eliminate warnings for AST2500 and AST2600 EVB
 devicetrees
Message-ID: <20251212150631.GA3997751-robh@kernel.org>
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
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
In-Reply-To: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Dec 11, 2025 at 05:45:42PM +0900, Andrew Jeffery wrote:
> Hi all,
> 
> This series removes the remaining warnings produced by `make
> CHECK_DTBS=y ...` for the AST2500 and AST2600 EVBs and their related
> DTSIs. The tidy-up has the usual benefit of making it clear to
> contributors that any warnings are likely their own to fix before their
> patches will be considered for merging.
> 
> I've framed it as an RFC with all patches contained in the one series
> so the goal is clear, we can see what's needed to reach it, and we can
> decide whether and how it should be split or merged going forward.
> 
> As it stands there's little in the way of code change, except to
> pinctrl (though also not much there). As such I've included the
> binding maintainers and subsystem lists as recipients but not yet Cc'ed
> subsystem maintainers directly because there are quite a few and I hope
> to avoid mostly uninteresting patches being a source of irritation.
> 
> The patches fall into several groups:
> 
> Patch 1:
>   Rob's conversion of the PWM/tach binding to DT schema with fixes
>   applied for the license and typos identified by Krzysztof.
> 
> Patches 2-5:
>   Fixes for the warnings related to the LPC and pinctrl nodes, touching
>   relevant drivers and the devicetrees.
> 
>   I expect that if this approach is acceptable that we'll need to split
>   application of the patches across successive release cycles, with the
>   driver changes going in first.
> 
> Patches 6-8:
>   Fix MMC/SDHCI warnings, touching the relevant binding and devicetrees
> 
> Patches 9-10:
>   Clarify the relationships between the ACRY and AHB controller
> 
> Patches 11-16:
>   The remaining pieces that eliminate the warnings

Don't you see warnings for at25:

     89 (atmel,at25): 'size' is a required property
     89 (atmel,at25): 'pagesize' is a required property
     89 (atmel,at25): 'address-width' is a required property

These are due to using the deprecated (since 2012) at25,byte-len, 
at25,addr-mode, and at25,page-size properties. I think it has been long 
enough you can just replace them with the new ones.

Rob

