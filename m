Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61961A7F20E
	for <lists+openbmc@lfdr.de>; Tue,  8 Apr 2025 03:15:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWp644csBz3c85
	for <lists+openbmc@lfdr.de>; Tue,  8 Apr 2025 11:15:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744074904;
	cv=none; b=eMQDnitlSZemYPWrlxzomEUCtxHJGBGHY/8/ApjfRlMJ1atYqHQqn66mDRccuqRhZZ43vZ3fr2FbHJzKyHwCqzqTp3LcfZ7d6SaAmyykG8Li6HRK+gZyHfRxEd6phFA6Sz1Bt23HHPrx8+l3NTQq76IDDQ+2U3PwmRSccl48fBtZVZUjNFPyH+M45SjxfIC4FimTDOfVwS5bv9+q4q2rOYK3NZd90f0UMlxEbgDfQOvuPDDn3HJ5SOjBczjAIu1GV13f+ngyQEKMBezJowq9Lx+6NLFflpbCugiKHed/vGjYC8rMYSkqBmeZn53cAYnHfAhsyfKF61+gqd/PdelBHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744074904; c=relaxed/relaxed;
	bh=0kVMxKOm5pByEsr4rY99Yr1e+Z6Yn/HV7y/2Si2yC/M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RR0NEPkvZzr0L8G73aA5K0FqGCmNVrBOqT5hKF6dUHRZ0xQpz6qvcppRwfQPdID4XHYRD9WAKcdTvI9EkJKDGVPShzTuPsqKXU5Beebwy6U9LDnxGtJyzu24eLWMRl86ez8yeTAe7S8g5yDoPnP6ckuUpEErBXaWTXS+gFZ8Yo9To9L9+lHjUUV7A2xBxuolrYsOMxfM/PYrzCRZzb1OBH9UX5eggXLDIdOlWRS7A2FsMUa5D6NuKXo627aGHZIjjvGw6OsAqn6xictEJJhBPb6bf3nA7E6t9BEur9Q69fN9xa6hVNfJEhPBF+42G+64J00fYUfknjHbdJIr52gU4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=boT46qQx; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=boT46qQx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWp5z1pqmz2xgp
	for <openbmc@lists.ozlabs.org>; Tue,  8 Apr 2025 11:15:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1744074900;
	bh=0kVMxKOm5pByEsr4rY99Yr1e+Z6Yn/HV7y/2Si2yC/M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=boT46qQx4QzfUF6N1cTmPSfjlE1gH6k1Ldsp6tN6mKuPMfkmQi+8PRjMtNdiFTvU4
	 2ji5dPAdpCzK8pCYa9hcWOrqnDL+imuF1G1rs/S6wxFGT6YSg01De4QFo4bJaE9tFK
	 cou1Kujnt5WTXg3/2l0zFyP5jxqEQC8A4gRNz8x7Ui1sADHz5wV+zWhcZ2m7oYcwu8
	 caFC3AzGF7+0hs/y57mcC4QT0MLxE7sUF2cHdhIbbs6OKXQ3mPZrdDctkAqW331lnu
	 bPA9AJR9nxTOUH+wXESvHuiuLE/+QZ913WMhxVECfprc+DiVq0xvKuoV9QjlPpdt5E
	 ntmPn7FDs2Vjw==
Received: from [127.0.1.1] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 94C587CB20;
	Tue,  8 Apr 2025 09:14:59 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>, Rob Herring <robh@kernel.org>, 
 "William A. Kennington III" <william@wkennington.com>
In-Reply-To: <20250404191144.4111788-1-william@wkennington.com>
References: <20250404191144.4111788-1-william@wkennington.com>
Subject: Re: [PATCH] ARM: dts: nuvoton: Add MMC Nodes
Message-Id: <174407489947.454798.15613957607681427179.b4-ty@codeconstruct.com.au>
Date: Tue, 08 Apr 2025 10:44:59 +0930
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

On Fri, 04 Apr 2025 12:11:44 -0700, William A. Kennington III wrote:
> We have the driver support code, now we just need to expose the device
> node which can export the SDHCI and SDMMC properties for the 2 MMC
> controllers in the npcm7xx. Tested on real hardware to verify that the
> MMC controller is functional with filesystem access.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>

