Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25411A7A536
	for <lists+openbmc@lfdr.de>; Thu,  3 Apr 2025 16:34:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZT44Y4zB3z3c9N
	for <lists+openbmc@lfdr.de>; Fri,  4 Apr 2025 01:34:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743690858;
	cv=none; b=VJTe54cPQNU0vEkGvmdCpsj8BnAnyVZSZBN2J+cVsYpR72Kj/jLJ/loaC8DY6cAJ1+WKbnW0FWGVJUhii4JhjZxHWKmBAuIBkW+TFZtDraoKutlxp2Fl0VNjsfE67NGyQVZIUVAnzzezRvTDw160VobqmZMKITgfdI1ucv7axsGXLfrVQBzCuyM9TLKhrmZXnICPeWt3KiqYf03LWKFU1tSr9V2OlnIC5woO17qi+zAguAr0ATonxUZZxSt6ipKbmrPEHDaPjv0c/kL5pC8EJwdT3NeNVieDeRzgvqskf0+8ir/wzpfKqn1u6qiOo7Q90ZMJU5FMl1Rj/+rjW/r1iA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743690858; c=relaxed/relaxed;
	bh=Rr28166uaXmjmRSWl/gNWhkMkGMEc//2Jf5V3S17AO8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VCAoYcsx2aIfDEIcws4ZKPiNuZ/Oz1VU52pRHlq3fy+vSCyG4t6QvGo/eGLnszLkJmQQfUb6PqzxLRp1hjbxeAgeajWVex7HJE08K9d8S9hYrk49H5nXdFalenn+LnEBmxdP7p+VcdFTqMdXVr+g8EyQSTnR8ITo9pnMcojcW+b31mnSvANlNbK5Bwo2EE1iOLHN8/J+DCtH102b0mhDh6AsrqreMipj3Pc0iVjMsZ48l4tbFtIcTusH3gYOPU147P0KAbfg+2iElLvsIhIcmPze9qHRg2DQF+9ocZUEyp11fDnudMnei8wJhmj3F0LaqyjAkGyQw5W/Vc9IAuydcg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=iyZmffwu; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=iyZmffwu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZT44S0N1vz2yhG
	for <openbmc@lists.ozlabs.org>; Fri,  4 Apr 2025 01:34:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1743690854;
	bh=Rr28166uaXmjmRSWl/gNWhkMkGMEc//2Jf5V3S17AO8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=iyZmffwuj0pu9Y9ST91vW9AxgCQ7pQD7whv3n3OvCKfhy2CuFieKEhIW/nmKq9E2T
	 jAf7EJ2KGaHEFud5dTjqAncq7cCEAssPmOrB+A0MjFhk3YApu6JG9kz2OnfTt9bm06
	 ipxwRhvHd0RQMCe7qqqrzneGxzxBnwNxGvel7nhnj4omP8kXAhYayi1oUQ7G9c1y61
	 007f8GoJ8ceppvJ1Nz8KzgQoPqevKKS22gqi7bYBfUm2dO88d5lZVzv64ST3Anw9mn
	 tyDxTAtsKJ9EUuZPU3fzspH5UBVK8vQLxaIGBTUwErfkxOFkVQZVcId5+x4dO4FhvK
	 wkrU8aJx2O56Q==
Received: from [127.0.1.1] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D6ED17B352;
	Thu,  3 Apr 2025 22:34:13 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>, Rob Herring <robh@kernel.org>, 
 "William A. Kennington III" <william@wkennington.com>
In-Reply-To: <20250401235630.3220150-1-william@wkennington.com>
References: <20250401235630.3220150-1-william@wkennington.com>
Subject: Re: [PATCH v2] ARM: dts: nuvoton: Add UDC nodes
Message-Id: <174369085137.3191483.5593938005824189048.b4-ty@codeconstruct.com.au>
Date: Fri, 04 Apr 2025 01:04:11 +1030
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

On Tue, 01 Apr 2025 16:56:30 -0700, William A. Kennington III wrote:
> The driver support was already added but we are missing the nodes in our
> common devicetree.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

--
Andrew Jeffery <andrew@codeconstruct.com.au>

