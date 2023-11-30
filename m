Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8957FEA3E
	for <lists+openbmc@lfdr.de>; Thu, 30 Nov 2023 09:12:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ZqSlTylJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgppH0kSHz3cN3
	for <lists+openbmc@lfdr.de>; Thu, 30 Nov 2023 19:12:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ZqSlTylJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org)
X-Greylist: delayed 536 seconds by postgrey-1.37 at boromir; Thu, 30 Nov 2023 19:12:09 AEDT
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sgpnj34F5z303d
	for <openbmc@lists.ozlabs.org>; Thu, 30 Nov 2023 19:12:09 +1100 (AEDT)
Received: from [192.168.2.60] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6BF402012A;
	Thu, 30 Nov 2023 16:03:09 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1701331390;
	bh=y+SkZschDSx1mlTO6KMgxF6aRQzLJQjSlyJB5vTM/RM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZqSlTylJ1UAKIM8WHHtZa/ExueX7iRfEr15FIG7wXmMv+WF7NTBydAtHKcn/n112Y
	 8bYXAwofcqQnD9Bq0TRCCqavo1HM2l8kVCE1va8SVUySe8PMXEpG1mzFypN4yiZGTF
	 IWgJFpKBOBoEDaBPfCQ8rDAaonCJTcXdbizBgw84bshQmQ17cHDVS6sVrqM8V7HcYU
	 MV2pGnr5PXXP5aWsOLf9RhA7LNgi9CQ5HzztXXlVqNmhfOYAJuZeRsUlAG7+aPaBrA
	 YIoJNg++g7MNy9h3ZonwduFRyqkV+E87a3IPWZ3SxYw7Z5a+FeZ10qo3hbDFlGWPhY
	 quc3SJA9Q94jA==
Message-ID: <473048522551f1cae5273eb4cd31b732d6e33e53.camel@codeconstruct.com.au>
Subject: Re: [PATCH] mctp i2c: Requeue the packet when arbitration is lost
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Quan Nguyen <quan@os.amperecomputing.com>, Matt Johnston
 <matt@codeconstruct.com.au>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>,  netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,  Open Source
 Submission <patches@amperecomputing.com>
Date: Thu, 30 Nov 2023 16:03:09 +0800
In-Reply-To: <20231130075247.3078931-1-quan@os.amperecomputing.com>
References: <20231130075247.3078931-1-quan@os.amperecomputing.com>
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

> If arbitration is lost, __i2c_transfer() returns -EAGAIN and the
> packet should be resent.
>=20
> Requeue the packet and increase collisions count on this case.

Are you sure you want to re-queue the packet here? The i2c core would
have already retried on arbitration loss:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/i2c/i2c-core-base.c#n2223

With this change, we would be disregarding the limits in adap->retries
and/or adap->timeout.

Cheers,


Jeremy
