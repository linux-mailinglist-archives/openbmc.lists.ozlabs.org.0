Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75410A33934
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2025 08:49:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YtnQ4608Qz3cVc
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2025 18:49:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739432970;
	cv=none; b=YvokozIRTOcSq28D2NArsxudiHPLR2B9XmI0vljVs+/vz5TO8renT4eAbUeryYRaVR6OILdOOUDLrvjKW0/jzSa3eup81ab6xzfEtaXj/ded6xtwfQRMV+KfdYTKYUNWsjQkachQhBaD1fbGZaFKRjn/yzqb24nvwrhudSZkA1UC5nTnSn3uFrcarnia38ICo1NzdyHzw/RCwEV164X/v6WWH+ArVxnpZGgI0DBogP7TkCe9NYq9Gnd+jg1gqxYmsTvd30u1LnBEk81HInesVBbzEAjv4DXRPncAT+d+dnaNHA+6UhI6QyUrw8/AkHr/Im6vE4dkfZ2QDxwfCwsXEw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739432970; c=relaxed/relaxed;
	bh=t5SBHujVb6RtmGbKK+7MgKn+iTLkRwv9ntIAACittIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lu6FqzylKS89xth2PUIvbPXTHXxfDt12f4eVJS2RSIwPeGk6qp20qbMRzJjUcbmUt/VgGT1bb0akQvVmMx11opINAJirsR7ptL80RKT+R8RM6lsLSG4VCuh0kUP0lBD+HTEyvfXQj/uBv3yiPbNmMCmovouWViuk/W54a7ifHXXgJsjKTwQ1xiv2FK4H+Kbiz87IL9kORuj0ObC4FCAzjcCoS4pjcbP8XyhMi75y4JWZqJtGgi5+/jQu+B7WZZaRpttrPLXnnxnVxgrcTeNSGPmeFqJSopQmSaFiMNDOUinImYNDtikQxDtldU0IZhFn7AQ5wHqtQY30PFa5geLXJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qMluKzxm; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qMluKzxm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YtnQ06WLkz305G;
	Thu, 13 Feb 2025 18:49:28 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AE923A41E97;
	Thu, 13 Feb 2025 07:47:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7596C4CED1;
	Thu, 13 Feb 2025 07:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739432965;
	bh=2r+iftouz+KNmWMr3hXVKgACN/Hfjh0z0QlWbmjE1h4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qMluKzxmo91HgIN1XqkBR3AF7NgltciJKCmluuhvjfPw7PanUY4Ka5mozmeVyD5kb
	 XhASNZQV3PF7zlpU4/W9nXn5/2hUbc0y8/yPTLKFbGPWRZe604hrBuY9RSRXb42L4w
	 tATww9srWEdEo/s3xQL0FdCoaUHGzZJBYR58r/eaBEZhz6HohlAuddG5xQR2vUr1+E
	 kMB4mFf0DYXi1IORBjBN1ysHl+A50TxsBym5CV7mYQujhqHGg71oN4/b/8cC3j0b3u
	 ki0MR2Oxvb+rgyz0IFScFso0vcPnscvYFgF/xV9AjcdxZTRTKilye+wBn2K1WIdbzm
	 dchmsnZ2sqvVg==
Date: Thu, 13 Feb 2025 08:49:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Subject: Re: [PATCH v6] media: dt-bindings: aspeed,video-engine: Convert to
 json schema
Message-ID: <20250213-loose-positive-moth-be16ab@krzk-bin>
References: <20250213015338.3243171-1-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250213015338.3243171-1-jammy_huang@aspeedtech.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: robh@kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, andrew@aj.id.au, openbmc@lists.ozlabs.org, eajames@linux.ibm.com, linux-kernel@vger.kernel.org, joel@jms.id.au, krzk+dt@kernel.org, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Feb 13, 2025 at 09:53:38AM +0800, Jammy Huang wrote:
> Convert aspeed-video.txt to yaml format.
> Update aspeed-video.txt to aspeed,video-engine.yaml in MAINTAINER file.
> 
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

