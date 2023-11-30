Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0F47FEC0D
	for <lists+openbmc@lfdr.de>; Thu, 30 Nov 2023 10:41:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=hM/Z6N99;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sgrml0y36z3cT0
	for <lists+openbmc@lfdr.de>; Thu, 30 Nov 2023 20:41:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=hM/Z6N99;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sgrm84hf5z2yDM
	for <openbmc@lists.ozlabs.org>; Thu, 30 Nov 2023 20:40:56 +1100 (AEDT)
Received: from [192.168.2.60] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 49C622012A;
	Thu, 30 Nov 2023 17:40:52 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1701337253;
	bh=DYVEjPmENldAVn0veRVABWTZgAuQcmimV8LUyiPCHM8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hM/Z6N99MvavxIsvBoks6ZDBxgNEdEzG3kKR0Cg9XBzj/aExsAtiJnxH0zrn8B/pZ
	 YCR1YQkJy63HAkaz8MEewL9dVh6DGVsmmMt7VBEKG3A7tcj4B2xRP7MEy5T9yKwUJ7
	 VICpkg7El0MH2kaSRVyHJzI/P7g5ApM111hXdwud2sM3RRMT5aEvtsBST5JnX2Cqj1
	 OcEVyB5xIK3Ls1abvIm0IoF41gL7WAKSTMdVGAmvEtAQRoSMPWUzdyLTcqIVF5nzdI
	 8RR9Se6yVvhym0WUMeVlDoi137oysraZ0pwFK9JZJNksWVZQdM35v/uawp+0l0hnZz
	 Ty11P6XYAnz+g==
Message-ID: <852eaa7b5040124049e51ceba2d13a5799cb6748.camel@codeconstruct.com.au>
Subject: Re: [PATCH] mctp i2c: Requeue the packet when arbitration is lost
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Quan Nguyen <quan@os.amperecomputing.com>, Matt Johnston
 <matt@codeconstruct.com.au>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>,  netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,  Open Source
 Submission <patches@amperecomputing.com>
Date: Thu, 30 Nov 2023 17:40:51 +0800
In-Reply-To: <706506b7-a89c-4dfc-b233-be7822eb056e@os.amperecomputing.com>
References: <20231130075247.3078931-1-quan@os.amperecomputing.com>
	 <473048522551f1cae5273eb4cd31b732d6e33e53.camel@codeconstruct.com.au>
	 <706506b7-a89c-4dfc-b233-be7822eb056e@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: Dung Cao <dung@os.amperecomputing.com>, Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Quan,

> With this commit, we all see the packets go through peacefully just
> by requeueing the packets at MCTP layer and eliminated the need to
> retry in PLDM layer which would need more time.

It's certainly possible that this tries harder to send MCTP packets,
but it's just duplicating the retry mechanism already present in the
i2c core.

Why do we need another retry mechanism here? How is the i2c core retry
mechanism not sufficient?

It would seem that you can get the same behaviour by adjusting the
retries/timeout limits in the core code, which has the advantage of
applying to all arbitration loss events on the i2c bus, not just for
MCTP tx.

Cheers,


Jeremy
