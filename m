Return-Path: <openbmc+bounces-366-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAF8B07E82
	for <lists+openbmc@lfdr.de>; Wed, 16 Jul 2025 22:04:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bj6Sz1jdVz3bVW;
	Thu, 17 Jul 2025 06:04:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752696243;
	cv=none; b=idwIXoVi98lk5pqZXjll11MXRjv9uk5n5JT3Y/tki+qiE0UuIE4i5ko/+w4wI23lV/o8IhPxnAvu6C97wU1My4kw+pumO8dGA+d6zk+SSR5xidiZsvT5jlzPFfaJYIdbuo1Vs7gSztAm0+HdGNMBVWjvn2Sxw7nl4QoO8auwU1stn1gfaxdhzSBhwy5CHmpLIz9wBTHZVBQZgQ95ZKG+jrYyy3S8QAg2nu1phnM7cIIYHG/RqZlFD0e6EgtIsMHCSDdSUDqWZQKT/qUqq3whYF+nNVwlbKGfChQpyWP043EhtP1N5QX55nYbhqFWsSYaLv5BZtmbvTPd9y/LYD63fA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752696243; c=relaxed/relaxed;
	bh=EkVfS0K/HCG53carimPNY+RNYNmwCtr9z/a+duBZkbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nupsEgXLO/EQ9TI/pa2KyfbcFzRZ1FRExKZQLv9D897u4r3YHvfWEfnritIDuZwRMUiEXmZ/ifqV68AptpowDzOxEoHhrjn4DZi9og5tLDPNL07IIwyqHnNNXWDnEwbhIUS6ga8PZiKKUNyjcJWHx/gIqActKVq57/gL7VyJMm0atEYye+dn23Ox8x9HShWW/CPGDFGtBJSPZ30Ce9B70Dw19vG19FhWYnszgHCxNMRvFJi2q7a7lkMQVYahoxyr9wf4ZNU80c6qMifUKvgISdtPqbqybYJMbddQsUGJtFZLY2XpH1g8oxOBFUGpuPsDHfE/JI10y+8EveR5436O2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=aVd+l134; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=aVd+l134;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bj6Sx2PjSz30Vn;
	Thu, 17 Jul 2025 06:04:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=EkVfS0K/HCG53carimPNY+RNYNmwCtr9z/a+duBZkbY=; b=aVd+l134yxHndkHhTItFKp2BXY
	eM/DThAQA6KDI5APDGUTdUUzpSGY8ohO2PTGS1eUgtd/H6md9t4FJvB58l9tVREMc+mWgc9QRmL6g
	mSmFMArWtqaf4Lqs3Gf5DYF+ne0rGkgDD5czKlwlhxTgJmOgir/pss03Bkb9bXKySxWs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uc8Lw-001ijI-7I; Wed, 16 Jul 2025 22:03:44 +0200
Date: Wed, 16 Jul 2025 22:03:44 +0200
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
Subject: Re: [PATCH v2 4/4] ARM: dts: aspeed: nvidia: gb200nvl: Enable MAC0
 for BMC network
Message-ID: <17cd5195-29d7-44db-8f3c-474dc5c3486b@lunn.ch>
References: <20250716-update-gb200nvl-dts-for-new-hardware-v2-0-9a1a916f461d@nvidia.com>
 <20250716-update-gb200nvl-dts-for-new-hardware-v2-4-9a1a916f461d@nvidia.com>
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
In-Reply-To: <20250716-update-gb200nvl-dts-for-new-hardware-v2-4-9a1a916f461d@nvidia.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> +&mac0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	phy-mode = "rgmii-id";
> +	max-speed = <1000>;

The MAC is using rgmii. How can it do more than 1G?

	Andrew

