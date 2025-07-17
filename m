Return-Path: <openbmc+bounces-377-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB7EB0927D
	for <lists+openbmc@lfdr.de>; Thu, 17 Jul 2025 19:00:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjfM63xZLz3brr;
	Fri, 18 Jul 2025 03:00:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752771650;
	cv=none; b=GWmZTgPbBNGOSYTO4YjtJZwmxDhmLDbTz+8ZZWp88ALX+EycNb+qRI05TfLpV3uymQY+x516O6nKwmSuTBr2EH9Zr1H0xdTH5+11Kj7Qg6PEe7yk3KPGUdP6OBEluwNlm9UXPkAkyosQ214BMVAHVgzYywsGbw0p5tgA9PsMcMmYodc+oZA8LMIWgH9KvORKAV0VCnO75TKYVHhXnaGQ+7Vm9q0n/DvEstPWrUydBHH64DguJZH88fSF102Qe+fINEKxG0f4YnRjHxLhT0a5gcStXExPKwsOm50FV7G6YVRY5GLWasScGHHki30d1sZBQ04v/mPflKdi/pjCFdhUAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752771650; c=relaxed/relaxed;
	bh=QNkoBmSrQhOotHhcZ/pt+jefZGvWgsF4nd+f/EvmSvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JFYcXoPTl4x+udTlCHmNhP4+01kxn/Pd+frYvTf2HY0Fsi/SgPRexd1/wBsvUw/TTYROA9qOZFEorxTF3mNqStZFbQKUXGizTWmC+y0swEoJjsa12GMiAy7HTr9g2Yw7FxUL1SO9NPwtoZHg9XPLzkgSdqKu6gU6JSukiEUQ9D0d6VwY822e1ulcoMaWPExSQmE1yVim9WOBs07SXHGTRgLvXpCdK/DaSfPEeEq/sMzKXiLKqhvTJSIXdMyu6kjn23JYQmdV9wqm0sLLh0GO22/xAOgAGKWaJq2EJFINyLsagm8j06afARE1ISOZ3NK+nplNfeyEkpYykro49szJ4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=X9ovGZ4M; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=X9ovGZ4M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjfM43wJkz3bmC;
	Fri, 18 Jul 2025 03:00:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=QNkoBmSrQhOotHhcZ/pt+jefZGvWgsF4nd+f/EvmSvE=; b=X9ovGZ4MkcBJYK9anYVaqgUArl
	eHIcgGHatBzFf+0yHuuSLDmyz/6GWwj0ykwmdE8NCSE9rFIE/5bjNYYu1kndxizmpJJMojBTjMUL/
	h8mPXrNzHj/M6PmeDpAGvCjXj+LGiRfpwJOiF8PELJ68pW0Wc/TyJgDdxwZO2J3h52Kk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ucRy8-001uYl-NC; Thu, 17 Jul 2025 19:00:28 +0200
Date: Thu, 17 Jul 2025 19:00:28 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Willie Thai <wthai@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Deepak Kodihalli <dkodihalli@nvidia.com>,
	Ed Tanous <etanous@nvidia.com>, Leo Huang <leohu@nvidia.com>
Subject: Re: [PATCH v3 4/4] ARM: dts: aspeed: nvidia: gb200nvl: Enable MAC0
 for BMC network
Message-ID: <e0d61de2-00e7-457c-bed9-21f0d7b5488a@lunn.ch>
References: <20250717-update-gb200nvl-dts-for-new-hardware-v3-0-f28145c55c98@nvidia.com>
 <20250717-update-gb200nvl-dts-for-new-hardware-v3-4-f28145c55c98@nvidia.com>
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
In-Reply-To: <20250717-update-gb200nvl-dts-for-new-hardware-v3-4-f28145c55c98@nvidia.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jul 17, 2025 at 09:52:13AM +0000, Willie Thai wrote:
> Upstream-Status: Inappropriate Bad devices
> 
> Signed-off-by: Deepak Kodihalli <dkodihalli@nvidia.com>
> Signed-off-by: Ed Tanous <etanous@nvidia.com>
> Signed-off-by: Willie Thai <wthai@nvidia.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

