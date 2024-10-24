Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 808A49AE600
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2024 15:23:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZ66h6CW4z3c57
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2024 00:23:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729776186;
	cv=none; b=Ctu8EKmPULJkEbVFp4vcuuGH1Z4OM8X5Mj1xHFLtq7aK9Da1jYYtJ1O6TZXmuFT0fZF1P0DU7yZ4VnkQIZGOFPz7SL0y84T3YmBmWkS88VL65Vo44E/rU7+WMitoIfPRsh3OvIoLV53dtRPj02u0XDtpbVt1AEGUV0QNd029Y/HktKVgH1KVhs4eQB181p21HbRx696DnUU9oL0eBEJiUpMoB6oS+Eb2q1l/uL/dUHD9pZC1vomXWWLQwmTzLsFAgdgkUq2BmTQ7bjEigcgLJ3H50MQrk1wjVQoidCmRDUruZ9p9xw5Y/28ZhBdervYg2bTH1TbJz2VnfV93fTG8KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729776186; c=relaxed/relaxed;
	bh=08lXJgKcAe8N3lleod88TNBbTcd1+2/PW8hqN4eL/LU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AjsPl88s0cI0pedOzu3mwpE4HlOncIh/gLlWqr99vhOKcF10sZzbNUorD/sqCUtdOugS1n+Ooyat0nvHCBDnUVuPbfP/WGqY7cSC3P+aMlfHsdbXhS2xV5iMUijEYi+RqdoX9yj2DGsgUGkKm4DD0LpDXXquOdirEBEYJMlQva2o5E84Erq+IDx7l2oBxx26SSnsY5Wiiw/sz3VffYtT76ZYHY+Yxwugy0qA2wMqAkv/tnGwkVokvXFaO4bLPQi7mDOxdzfcocMRvxa9dRW8CP/uwaBCwhCoK76MMX6zzs/kM95AgiDztvgr0o3vJJvSjoujkk5S4J95GjudmWLsuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UE3qlqoc; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UE3qlqoc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZ66c6slWz2yj3;
	Fri, 25 Oct 2024 00:23:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 76001A45419;
	Thu, 24 Oct 2024 13:22:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B136AC4CEC7;
	Thu, 24 Oct 2024 13:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729776180;
	bh=xYOd1PGCn+k3tNRpgbdP98I0aYi1W9inhgTkL3ocTDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UE3qlqocUQQwG7+oevrCYRcqdU5t6igksP5NXhM/w/Avp9vTWc9do/b/XFIaLNfV5
	 nF5Mu09+yamxjgYhYGBEQmyp0jczN/DdGoDW33UtiPMUXVeEbuIhBF22CiQpgWVwV0
	 qUkHRqiDvnAE6+n+Gx1vJ81KFaa+9tUo6F6L3DmpRpnwHnc377u3qWPsgOaTM457VE
	 v9l5/b2mhN5jG+3lRx8YjH+eLwlL5IZ6wRAjXlWNtm0ptENvdOtcjvulFw+AvWDq6L
	 LQWX29+MFnAHc+tALWO1lyKg/mbG/pBQ6CBRa5K0LSHIpv+WZigHO6oDUKFVVqZmqs
	 gAPURf4qcQhJA==
Date: Thu, 24 Oct 2024 15:22:56 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tommy Huang <tommy_huang@aspeedtech.com>
Subject: Re: [PATCH] i2c: aspeed: Consider i2c reset for muti-master case
Message-ID: <c3ss6ralf4tpyknsda5p745a65xjprlzecdq3s4zy4dpckuxi4@izf7emrzykay>
References: <20241018034919.974025-1-tommy_huang@aspeedtech.com>
 <e06a0db538bf62d4aeb7352ecc81a3a679fb9eec.camel@codeconstruct.com.au>
 <TYZPR06MB6191EBA63B87FE5152AF029DE14C2@TYZPR06MB6191.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYZPR06MB6191EBA63B87FE5152AF029DE14C2@TYZPR06MB6191.apcprd06.prod.outlook.com>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "brendanhiggins@google.com" <brendanhiggins@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tommy,

On Tue, Oct 22, 2024 at 02:42:08AM +0000, Tommy Huang wrote:
> Hi Andrew,
> 
> 	Thanks for your comments.
> 	I want to fix the situation when our controller is set as target mode and reading / writing by other i2c host.
> 	However, this host is stopped by any other reason (DC on/off..etc).
> 	It will cause the controller is stuck in this situation.
> 	But I find it might not have clear hints to identify this situation is normal or abnormal.
> 	So, this patch should not be applied into mainstream.

Please, avoid top posting, I don't understand which part of the
original message you are trying to comment on.

Second thing, please, before sending a patch, always always
always make sure that checkpatch.pl reports '0' errors and '0'
warnings, except for few sporadic cases.

Andi
