Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5A67B5D26
	for <lists+openbmc@lfdr.de>; Tue,  3 Oct 2023 00:31:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IzZEajQc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rzwf02bX7z3cbL
	for <lists+openbmc@lfdr.de>; Tue,  3 Oct 2023 09:31:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IzZEajQc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RzwdH1nDtz3c5T;
	Tue,  3 Oct 2023 09:30:27 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id E8227B81691;
	Mon,  2 Oct 2023 22:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4E63C433C7;
	Mon,  2 Oct 2023 22:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696285822;
	bh=79cFsXTH0qYAJS5Y5EHSRryuk0cU8c3bNjf376YvJYI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IzZEajQcdtcOlQdu0t+KOWccV9I8tJNmfAc0TXNtJ0FOSGdn1gwaVVo89k2r6hVHD
	 Im9qUf5syLC2SonUXONxJSOqGeJxVST1RK+jylYg31ZKd3BWzCdGMcpaazSphXpCEI
	 uqrdnU5LAbQsE8NwpR1Bf/V1Yxj0aHH9uWB2iJ0tpbNDu4B+nzYZgF+gusbfgXqdql
	 Gou0cP8aURCwJarjT07+UpBq6Nr5LomJoyG/U/nHvfD4prPTaOiyiIBGJKEyY26mio
	 OqHuP0bIQImFy4us2DonJeZW5o5GZGwPR6rCTDIby9S9RVA36aT10kKQT9JOLO0Bpx
	 ZHk/vOLb/NsXA==
Date: Mon, 2 Oct 2023 15:30:11 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Konstantin Aladyshev <aladyshev22@gmail.com>
Subject: Re: [PATCH v2 3/3] mctp: Add MCTP-over-KCS transport binding
Message-ID: <20231002153011.5444fd83@kernel.org>
In-Reply-To: <20231002143441.545-4-aladyshev22@gmail.com>
References: <20231002143441.545-1-aladyshev22@gmail.com>
	<20231002143441.545-4-aladyshev22@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: tmaimon77@gmail.com, minyard@acm.org, andrew@aj.id.au, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, avifishman70@gmail.com, edumazet@google.com, linux-aspeed@lists.ozlabs.org, joel@jms.id.au, netdev@vger.kernel.org, jk@codeconstruct.com.au, matt@codeconstruct.com.au, pabeni@redhat.com, openipmi-developer@lists.sourceforge.net, davem@davemloft.net, linux-arm-kernel@lists.infradead.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon,  2 Oct 2023 17:34:41 +0300 Konstantin Aladyshev wrote:
> This change adds a MCTP KCS transport binding, as defined by the DMTF
> specificiation DSP0254 - "MCTP KCS Transport Binding".
> A MCTP protocol network device is created for each KCS channel found in
> the system.
> The interrupt code for the KCS state machine is based on the current
> IPMI KCS driver.

Still doesn't build, please make sure W=1 C=1 build is clean with both
GCC and Clang (you can point them at a specific path to avoid building
the entire kernel with the warnings enabled).
-- 
pw-bot: cr
