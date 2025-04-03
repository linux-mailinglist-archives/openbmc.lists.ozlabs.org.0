Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBB6A7A138
	for <lists+openbmc@lfdr.de>; Thu,  3 Apr 2025 12:43:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZSyy401Mlz3c9D
	for <lists+openbmc@lfdr.de>; Thu,  3 Apr 2025 21:43:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743677000;
	cv=none; b=CkBv4PN8gbAsBfgNLESS3o1ku/p0k0jnEFgUOJ1dA9RilWVGvo5/xLlfupOnHpX7GpzuZ6vG7+8SWs8bShn2MLX1WyNTFlTBtzqnNsUVGWywvlLnF1fHm7X09v6C2z2hopsksHmX7p79qwverSGqIxyO10TBW5FrydLiUirSxfqxzzwIrOh6R4cjTYoj/G9DS1A1g1h7bqu2P/h2VR6VguWvBZSBtfExyt0nw2AaX0jLhNNd/l0+YHdVuyR9P/mQJi8FWQ2MjIbU7Mqrj6ci6AJo5+43VwfLi5/sR+rxXkI2sq75aodQSoyS9SPGmT8yCScMMuHqfRZcHCrIiBgWRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743677000; c=relaxed/relaxed;
	bh=HeWpKwZIi1vJa4eCTpI3g5nUVCNkZ//qHa1e+CfjGGA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=i4l0wQUDsLTu2lvB7oM7vhtnbKv1lhfcZKaiMkTmFpAUd+/O/SAdKiGG/SXz6uJWGh5VpY+D/tYF2XT9YfHMsW6ORZ/OmnY1SSHK8F4xq59W6GVjcOQMe1OeaFITLxHNhjkZl9uN80BQyDQfmeSvvECyHScpNWXCR+9f0hkbbNMGm4Ox4UU1nl9OkE0oEtrOdjdZ5/eogJWU5eSOWzSsEkq2nND+9ooqb0TLKOy9j+ihlm/kOVEBN3Rie8aHMtFC/Yj3Vp+vkxtOYlCqZxyBGYi4Ez0HtTodZkCDq7QenW8zECXeL//mbNJPypmD+92dQ4P+kSImDzwpjjLZJsFusw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=J8DfOQ1G; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=J8DfOQ1G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZSyy008DPz2yYy
	for <openbmc@lists.ozlabs.org>; Thu,  3 Apr 2025 21:43:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1743676994;
	bh=HeWpKwZIi1vJa4eCTpI3g5nUVCNkZ//qHa1e+CfjGGA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=J8DfOQ1Gey4ELVU27V1LwNyUkoHTiTW8nJQYLJYSnEKVmU3RKR6ITBla/PcVZeldG
	 GZybylMvPp/8K0u0nO0DVimdA2DgevRs0aL15fV5d6llQ/pUCV+xhIaO3H/O+v6x5P
	 tyrBkXZibqvI5IVxQpz5qHd7IxGImQi4k54wL5olvw6aGYZzaWwhnDodgH2ULjjbR1
	 S/jEMUSotjGOa2JD2GNZ3CVuFIj+eBMaZ9/JqOkC6iC6GBWxysUM9iq2s/SGRm2iBV
	 dMcZ5Rkckea1Ul0D+d0Kooz0+Dr2eby9skO/9CSwimN0PEmV+RIRmgF/H/E/OJg8vY
	 w9l5zCXavbqPA==
Received: from [127.0.1.1] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A3BE27B352;
	Thu,  3 Apr 2025 18:43:13 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>, Rob Herring <robh@kernel.org>, 
 "William A. Kennington III" <william@wkennington.com>
In-Reply-To: <20250401231001.3202669-1-william@wkennington.com>
References: <20250401231001.3202669-1-william@wkennington.com>
Subject: Re: [PATCH v2] ARM: dts nuvoton: Add EDAC node
Message-Id: <174367699833.3146674.17448098889682060142.b4-ty@codeconstruct.com.au>
Date: Thu, 03 Apr 2025 21:13:18 +1030
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 01 Apr 2025 16:10:01 -0700, William A. Kennington III wrote:
> We have the driver support code, now we just need to expose the device
> node which can export the EDAC properties for the system memory
> controller. Tested on real hardware to verify that error counters show
> up.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

--
Andrew Jeffery <andrew@codeconstruct.com.au>

