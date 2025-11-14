Return-Path: <openbmc+bounces-891-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85636C5B57D
	for <lists+openbmc@lfdr.de>; Fri, 14 Nov 2025 05:47:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d74P76w7Hz2ySq;
	Fri, 14 Nov 2025 15:47:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763095627;
	cv=none; b=osH84/ZVMURxpExwX4i1MQjAyDfovxoA2rMHM2uBSHUVBUwaOzDRDYnuqHErgfShdbi5dgX00Pax5NJJH8Wh/ioLgwztePzuo/+NfiAvlV5khsdN1TGky3ZFyhxMQzAvXQoCgFeCmG4xdtN+IhcOC2g1GdND5mqJQRWuFNSc3gifBJ/OscJjAn14s21wpLUHc1q0ih8AQCwp8wCtYjtLwdUc6HvZR/yiEk09BSFeV9jW1VoE7DEik63IEH8bVqXOyIl0Wg7pyiwphwX21QFmDXjRnySq+aevPZl0hQO5kEQCICpJLPmWMRLm8tQurV3AgefjuDa0sru/zWzj1yfxCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763095627; c=relaxed/relaxed;
	bh=mS2G/8dt9hOWHLWv+Tcg5ma0G8Q5r+g277ONo1pUtyw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bo6VbI9C/pZqKXMeWouIPr4b4bAoLdMiDWK0o5u2S/1IgSoorx0nDvY1NbAtEB59HyY0w6mtZ6Ba2R2Di4khpror0apRfJhzu8aTek/7lrmvabfsuTTaEq8HBs33Uets/hZE7LVm5NCEeJxheRv9rDdZYPyWXVpHGoB4gCY1BIqVl9FDhoz4fjshWmqpfzztPKGtPICEwXcJnRuCihuZsMR50Ew6lN4p9hbaq5cFE1Z52WCmaQ7q/BYyHhtnedEa4gWf6KYrHWCJ6AIS4ffJ2f9dxoQqQl377b8nsh2TJGLMofOIklVRtS4CzYZLlr2TDPRjXXOkWVWHcrGmm+7g6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=fhr0POxT; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=fhr0POxT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d74P72BYSz2xlK
	for <openbmc@lists.ozlabs.org>; Fri, 14 Nov 2025 15:47:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1763095625;
	bh=mS2G/8dt9hOWHLWv+Tcg5ma0G8Q5r+g277ONo1pUtyw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fhr0POxTSayJ5jtdGxYyLco9cPkkYNsY9dB58kYSo6qKCS0jBx4sg7T02SJ+766QJ
	 n7AJM0GSRiWnKTCa5YlGyntGuZIoDuIS3lv0lGNVyYPpNgeurlTaekFn06aPJJhgtL
	 ofQjg4k98do3uqqDQv6NxtMBcvVIN40CipjVkk06S+Ny2lGNni/s3qioppfUTpNQkU
	 zQQYjDLbPJBOpcn/8zf40aeNvK/3913OtaftiIpiKvBDewhfbNN1obMXoyct1W5ua9
	 ZPGVoPig23czYcp6fIpbFvdn4zdwrJqwP/aqhcj4LUndzSlZfITzdWfDu9XkityZgo
	 XRTVeH91ym0NQ==
Received: from [127.0.1.1] (unknown [180.150.112.244])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3B2E7783DF;
	Fri, 14 Nov 2025 12:47:04 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: openbmc@lists.ozlabs.org, Patrick Williams <patrick@stwcx.xyz>, 
 Potin Lai <potin.lai.pt@gmail.com>
Cc: Potin Lai <potin.lai@quantatw.com>
In-Reply-To: <20251105001606.1110649-1-potin.lai@quantatw.com>
References: <20251105001606.1110649-1-potin.lai@quantatw.com>
Subject: Re: [PATCH 1/1] Revert "ARM: dts: aspeed: catalina: add pdb cpld
 io expander"
Message-Id: <176309562416.912856.7347830585831365012.b4-ty@codeconstruct.com.au>
Date: Fri, 14 Nov 2025 15:17:04 +1030
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 05 Nov 2025 08:16:06 +0800, Potin Lai wrote:
> This reverts commit 252f39cc0de48040d36bef6a24f24db9116f11e9.
> 
> The reverted commit duplicated the PDB CPLD I/O expander
> definitions, causing io_expander[9-14] gpio-line-names to be
> defined twice. Removing it restores the correct configuration.
> 
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


