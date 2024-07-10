Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D5A92CC84
	for <lists+openbmc@lfdr.de>; Wed, 10 Jul 2024 10:08:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dBgzMHup;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJr8p3wYHz3cgW
	for <lists+openbmc@lfdr.de>; Wed, 10 Jul 2024 18:08:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dBgzMHup;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJr8937rgz30YZ
	for <openbmc@lists.ozlabs.org>; Wed, 10 Jul 2024 18:08:09 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6AD5CCE09F0;
	Wed, 10 Jul 2024 08:08:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFEFCC32781;
	Wed, 10 Jul 2024 08:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720598883;
	bh=HyORFOy+osmQQ0qUOwd/ac0tt+tTqrUtwxh19jszgKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dBgzMHupV6+1UdZNksVSWBrNNYjiTrkQN3Cch/cVzmFR+K3DlMZIbZbD+HjADcIGk
	 CLYaAY1KpwS0sOWwBfE0WJSqMgPSJwnPIGO9LBqwl1SoNva5GGfY6nRemjvpn6sPtu
	 BbCzpMqevxSY+BOUpcUI4Xu/RQnrUoiIr7UgoJqq9EvwFxcAMSCdDbJhc/WLPE9lm7
	 hKeZ+guNsJb/ZcrdaD5WQUmn7a5ShCZreSH4bEYl4urtwxlDjXTUCL9VYhOiQR25KD
	 91ltxn3qdJZvSa2+hp9psa4s3DE92+yU2M1KVpTJxsgiFDIiwuuUFiyW2wYpnqFsna
	 RIGfMSoFbnUyQ==
Date: Wed, 10 Jul 2024 10:08:00 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 15/60] i2c: fsi: reword according to newest
 specification
Message-ID: <ukgbryddbwhbztjt2kkc3r63u54hkgyr5nda7dkor6jstgwpcd@rc2hwmjmhyoo>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-16-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-16-wsa+renesas@sang-engineering.com>
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
Cc: openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:15PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi
