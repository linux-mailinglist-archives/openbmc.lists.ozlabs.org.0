Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6729A93E1
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2024 01:08:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XXWFc3vkwz3c4r
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2024 10:08:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729552113;
	cv=none; b=k3J6lrDrWyZ2UbrR5m95GguLe8oe6shnhqKRYsh9HGNJps1kdhOzcyQhzNO5F9OpeLKWCGuzyjaXN1J6hgtKzYQvstFxquFXX+KlLnt4we/se2jcRmcDMB9SQIz7S8T797605AB8eV7XL+uvhlZYTgzd477306CGk+DAeHPNGHpDzZWsFjHqY/e5YEBzIwRSheZsZzrsWmWjHCrHg6NzVUSkStm4DukRiB1qJgCkBEYsORDFFPPZmyJgmlytkAPlPhoM5Gn5j3iEsS7aRsPU2qVc/SkWuBskN/7tYv+fz2BNu+7mmLch47YJKSZFtv6jdAckCvpJ9hW9b3mWvLqNEw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729552113; c=relaxed/relaxed;
	bh=HujQp2mhg09W7KS1yS8qHdzqq2w6ddNhAO0OXRrftPo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UC2K970GjoHwygYqmOuRDOeGLPylQ3dZT+r///eNqZRhEV1BPB7j+HwHFbVUnzNYITNlLaPewU+XrHv5U3bH5cfTh+BmINdWNxbYeLiCO6fZlnC/PwdbY7iqSsqibE4UWmwZUt1WHUPWPM8ErQtVamqOQtBMuW8zlv1YPyQACe5kFL0o8WMYJqGwxbB4mnlxaXk8V4R0iMUPj95ADTPBLT5IOiqkHHEWVhiWOlvEFrkdCpXsnvuUaGwuugfmHXEWK0KhWokxwgTl5urkKJHAMlQXxg8+DTDLJD8VxgGIxjZxq4iGVrfh/CzOIkvumJZHW5cHj3UvJ4ovblWEVHkAFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=dkR86t8C; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=dkR86t8C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XXWFW5zS4z2xgM;
	Tue, 22 Oct 2024 10:08:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1729552109;
	bh=HujQp2mhg09W7KS1yS8qHdzqq2w6ddNhAO0OXRrftPo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=dkR86t8CL5wPWttnIx/R3K27EXqKSO9uxKGzUpNOQKCo5VwlrzbdM7hjH51AxDFW8
	 43XUNUuZqmOo8opCDec3kBg6CrI0RY3OKEK5AIOEBlzKZBe9jkCuTCA9xx2j++6RSv
	 2x1HzoR+dWNWmWZTJY8R7XuFzyyVVM6xNSswBmm/EKiaiLq+6tUVWKSbWLcO6t0xnJ
	 /+D0YKKcL3Eylu1dy9TLOfrUp67iW0amUdx/sbJf6V6aoDNewQBYk3Ao6Kr2BzX58V
	 dg+kZcGFbuQ1ML3hDN9bhagsM51sC5se2r2Vg3VkHqkaPnOXkq54pW1raATxRdIcUP
	 UU0+gLVbz+8dQ==
Received: from [127.0.1.1] (ppp118-210-184-223.adl-adc-lon-bras34.tpg.internode.on.net [118.210.184.223])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3AE3A6881A;
	Tue, 22 Oct 2024 07:08:26 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Open Source Submission <patches@amperecomputing.com>, 
 Chanh Nguyen <chanh@os.amperecomputing.com>
In-Reply-To: <20241021083702.9734-1-chanh@os.amperecomputing.com>
References: <20241021083702.9734-1-chanh@os.amperecomputing.com>
Subject: Re: [PATCH v2 0/2] Add device tree for Ampere's Mt. Jefferson BMC
Message-Id: <172955210690.47095.10418122883150753763.b4-ty@codeconstruct.com.au>
Date: Tue, 22 Oct 2024 09:38:26 +1030
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
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
Cc: Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Khanh Pham <khpham@amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 21 Oct 2024 08:37:00 +0000, Chanh Nguyen wrote:
> The Mt. Jefferson BMC is an ASPEED AST2600-based BMC for the Mt. Jefferson
> hardware reference platform with AmpereOne(TM)M processor.
> 
> These patches add a device-tree and binding for the Ampere's Mt. Jefferson
> BMC board.
> 
> Changes in v2:
>  - Document Mt. Jefferson board compatible                      [Krzysztof]
>  - Remove the PSU node with pmbus compatible                       [Andrew]
>  - Remove clock-names property in mac3 node                        [Andrew]
> 
> [...]

Thanks, I've applied this to be picked up through the BMC tree.

--
Andrew Jeffery <andrew@codeconstruct.com.au>

