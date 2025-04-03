Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8375A7A581
	for <lists+openbmc@lfdr.de>; Thu,  3 Apr 2025 16:44:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZT4Ht5T9zz3c9j
	for <lists+openbmc@lfdr.de>; Fri,  4 Apr 2025 01:44:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743691447;
	cv=none; b=lBxRBNCJJCe08+C2lZtF+Mc772VrTl8pdkpOdnXIc1051NuzcrKghxKCvlWyu+NxCrIY5qpFpqkNzfJJ9Oowu/iqUeH+OMkDFpr90PL8dMaVBFYTL5ArJqXTIrf5lM95UtaSOL4TrgLKk2OZ5N8rBeQZbLRoDd+jgsu22RSCE8OCwTYzGsf/NeTsymRDsFCjO9gXIF/5oB503EJVexhNz+1jho69Cbi0g8ltOGmJuzdPb1+RxbF9PV7HUjlv0ILyOdSJBSXadup33vp5BAxYK62SkF3+2j9AtKd9Qv7pDHMv3iCs0asNqAkiD86Ea6JkyPRfMyH+Cb1eI7n5nb4LJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743691447; c=relaxed/relaxed;
	bh=8fqUmYLJMJpXXLlGvmXIL4oBVe8ye6UH5ic3xrYQKkU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=d0HD0xwgrFpjZDFsgyRogpE1+z+5XYsgRT+ky3rD4sWfxcOv0QI+sNp3MJmt9la4jcJkImYy8LVIOQ9LQprTtLK3K7+rZk17b7V0UH2w+SXvxto7kyZqftJCNsooh/LM2XqDJ6nZ+XdUHmXc862rGvOCm7b4131M5B9DbgaCWXkE8Irrfnih+cUpxmS8oYdsYLpPwTePKwo7kCcAiGBEeKmLk2a44p3G5aX3FkrOU7RafBApMXg8LxegIvj5DTRiP/nfBpt8Rk8vdxxlzAsI4mfNyLoCsLgsNvmMCdLIaq70ieZ4o+qETiqKJTv9z/oSNBpC28obCuE/MEle6z/OvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=cidmbjk8; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=cidmbjk8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZT4Hp6Xbtz2yrB
	for <openbmc@lists.ozlabs.org>; Fri,  4 Apr 2025 01:44:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1743691446;
	bh=8fqUmYLJMJpXXLlGvmXIL4oBVe8ye6UH5ic3xrYQKkU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cidmbjk8S3Oue71BIHBXAHwJA8M2gzyp8mYROuROcv0TcDudZifLfK56rd5TW1Sqs
	 lYJ2DAqf4fOOVo2qBXBhSQHGGgaAZ3AZVheqFy5bJ8qzveH8iSGpZ+OYt1vJirmvGv
	 oRE2vdCh20Uc7P+3e8ufavKwdjOtYUvoZhST9ion0ixw2VxlZL5P/Os+yZCia7BPAM
	 Xfu0Dmix2uzJnp7RfOqoWyMHbT60ucf1EI3QWJBzbTnBMfZYtKPqdUeQvLmOdeWt0p
	 2Krx7wAx/gk/ZgbtrUEC1MeIDxFN4pyJFMKsR3+me4Td6CrO9icH9Y0TPUiXp/0SAm
	 f8bebMFkcu1Ow==
Received: from [127.0.1.1] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E8B617B352;
	Thu,  3 Apr 2025 22:44:05 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>, Rob Herring <robh@kernel.org>, 
 "William A. Kennington III" <william@wkennington.com>
In-Reply-To: <20250401233409.3215091-1-william@wkennington.com>
References: <20250401233409.3215091-1-william@wkennington.com>
Subject: Re: [PATCH v2] ARM: dts: nuvoton: Add OHCI node
Message-Id: <174369144385.3206748.4237732855581471096.b4-ty@codeconstruct.com.au>
Date: Fri, 04 Apr 2025 01:14:03 +1030
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

On Tue, 01 Apr 2025 16:34:09 -0700, William A. Kennington III wrote:
> The EHCI peripheral already exists in the devicetree, but the hardware
> also supports a discrete OHCI unit on the same USB PHY. Generic OHCI
> works fine for this device already and has been tested on real hardware.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>

