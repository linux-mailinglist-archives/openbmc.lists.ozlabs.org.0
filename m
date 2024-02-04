Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BEC8497BA
	for <lists+openbmc@lfdr.de>; Mon,  5 Feb 2024 11:26:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ispras.ru header.i=@ispras.ru header.a=rsa-sha256 header.s=default header.b=RehFBpwb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TT2bs2w0Nz3bZ3
	for <lists+openbmc@lfdr.de>; Mon,  5 Feb 2024 21:26:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ispras.ru header.i=@ispras.ru header.a=rsa-sha256 header.s=default header.b=RehFBpwb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ispras.ru (client-ip=83.149.199.84; helo=mail.ispras.ru; envelope-from=pchelkin@ispras.ru; receiver=lists.ozlabs.org)
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TSNcL0qN5z301f
	for <openbmc@lists.ozlabs.org>; Sun,  4 Feb 2024 19:54:40 +1100 (AEDT)
Received: from localhost (unknown [46.242.8.170])
	by mail.ispras.ru (Postfix) with ESMTPSA id 75BEE40F1DD5;
	Sun,  4 Feb 2024 08:54:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 75BEE40F1DD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1707036873;
	bh=bdcbSUNCCZm49I2M6R9zeavTDLhu5z/DztFvKkbGu40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RehFBpwbAY+c6D3NP+7uYvFFOVC9FgQQ8c1IitjShCy9UP0vVPBBj+HOQ5sBlEYzu
	 nEV+R3mBnYegPhm+HDwMTC/dY1RaT2YaSltRjD2uiLIomQ/dpZTM1E0PwKtpt0UDKE
	 MKd8z3fGQfV1Due4aIPLu0o/OdLNz/rKZbgxEq5M=
Date: Sun, 4 Feb 2024 11:54:33 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Wolfram Sang <wsa@kernel.org>, Rand Deeb <rand.sec96@gmail.com>
Subject: Re: Re: Re: [lvc-project] [PATCH] i2c: Fix NULL pointer dereference
 in npcm_i2c_reg_slave
Message-ID: <f5f26a7d-973a-4232-b0cb-b0543fddefe0-pchelkin@ispras.ru>
References: <20240109145121.8850-1-rand.sec96@gmail.com>
 <CAHb3i=ttHrFw7NuL3qw1xdXDkGu9tOQdH+WuCMWgukmU6QrTKA@mail.gmail.com>
 <111837c6-6c60-4bd4-9e66-1c652a43f3ae-pchelkin@ispras.ru>
 <Zb6luAVHcnX2fXz3@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zb6luAVHcnX2fXz3@shikoro>
X-Mailman-Approved-At: Mon, 05 Feb 2024 21:26:05 +1100
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
Cc: voskresenski.stanislav@confident.ru, Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, linux-i2c@vger.kernel.org, deeb.rand@confident.ru, lvc-project@linuxtesting.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 24/02/03 09:44PM, Wolfram Sang wrote:
> 
> > If I'm not missing something, npcm_i2c_reg_slave() is called via a
> > function pointer ->reg_slave here [1]. And seems `client` can't be NULL
> > there. Other drivers implementing ->reg_slave function don't check its
> > argument.
> 
> Correct, we trust ourselves here.
> 
> > Maybe we should just drop `if (!bus->slave)` check?
> 
> Yes.
> 

Okay, thanks for confirmation.

Rand, would you like to prepare the patch, please?

