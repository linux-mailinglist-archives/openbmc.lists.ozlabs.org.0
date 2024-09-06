Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5047796EAFC
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2024 08:49:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0Rfw21j1z3cH7
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2024 16:49:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725605380;
	cv=none; b=Uircqr0wKpCNVtyctmGYYM6WbCxYeuRp7k22EElwGmctJ3PKZ0aBB/0qJDkpQmOSUe5jKkJsHNOsfr23crZFaCToQEDa47DRtgsfPY7R0f6Pnc4hN0+Yqb3V/xl7Er+oLFi6cOZSJlKwSmMrUCeONXLv60gDdyUi3n15HltQZgrkZ3POQyV+OwiygyS4mU6ywJxOr728s+r+I5+exUE4kN0/SLQD6qzzg5B0pL5/+Wymh/vZpWMZiveoSKRDkb8LUCvdZlWdimEM75xbLRJX1dCYmIcpXrQO5NDVeq1Ol+x2vIeEpQzB4IOtKKds/ip/KugLUmU1wDTdiSuFR5HGZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725605380; c=relaxed/relaxed;
	bh=uXqJhrNyllgUpVAvmqAF0fkUWdXnbgFbWLtbnzxYOaQ=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=B7qKbn7Xh+iEwiIjoLsBTZ266m12nwdZbHo0hN12Ie7/sRMqql9MS4dYjYM67Hf7w6dBcyQroJ80/Ih3jux8F0vHd4x0ApqVwJDm/pXw4FYDr+lOoNn3TuAU1mbT+ha/tGM1FXznIaxelEHYthRz2QnM5mh6JC/pO9yJhFXD5SR0XxYlRbd2jC4KXUvut7wec41+eE05WIMAIdKIHPaXieIhhpDs5boYIfoINp/724L3RdlTp4cJG1/iuwuoona6JINtHhT02/kIr4MENJ9QSHqyKECU8p4Mpuw9TBXnSw0lCMkDe1v5pleBFIrfzipXWyxxSFv3iy28foWwXbfUTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ieZ3sIBa; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ieZ3sIBa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0Rfr4mc4z2yN8
	for <openbmc@lists.ozlabs.org>; Fri,  6 Sep 2024 16:49:40 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1B2F75C5B96;
	Fri,  6 Sep 2024 06:49:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBA78C4CEC4;
	Fri,  6 Sep 2024 06:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725605378;
	bh=wVe2H+YZx1oFFNE2aps61z6iCEsuBfKsWQT7fmZvhQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ieZ3sIBaP6W6HdLd9cuQnJLtVztyD5rfZ7EfodpDe7swaP+aHwSUbq6XnCfXuj49p
	 9TBF+ww51mTKGrizE2EE6kv9yUpnj1ev/zaJfoIAlBPA/vIDRbX5C5kBE7v8Iq/f8S
	 v0Ho0J2PnuoiZ/r5Q2Xj/U9E00S1YYKgJFj5c2HYV7PCYu9RCI/vaAzd7SF8GNeYaK
	 e2eGx0jZ6nM+T4ir3zT74sqJZG15hCS82qyp+lwu9ANKfOyLVE4uEID+W9B3Cy5WNl
	 dbksTA+23TiJolQjKMh2Lpjy05isspdtxUnpLa/wCRc3t2ZragUwO5kfrZBVoElkMv
	 PUmastBT8allw==
Date: Fri, 6 Sep 2024 08:49:34 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v2 1/7] i2c: npcm: restore slave addresses array length
Message-ID: <ej6aqrruosoxx4a4cfic4ml7hngbxdy4ba65vwtardmwrkraro@elpng6eotflg>
References: <20240830034640.7049-1-kfting@nuvoton.com>
 <20240830034640.7049-2-kfting@nuvoton.com>
 <xdaufg4bju3iq5fqeo2gdej3yaxyufhuaiuyixnla234l2ej3r@fmvann767tib>
 <CACD3sJYt12H3DNqRwOU0ULDwJj2TbqUR5NhYWxBgvFggqKVyGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACD3sJYt12H3DNqRwOU0ULDwJj2TbqUR5NhYWxBgvFggqKVyGw@mail.gmail.com>
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, wsa@kernel.org, tali.perry@nuvoton.com, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tyrone,

On Fri, Sep 06, 2024 at 10:28:30AM GMT, Tyrone Ting wrote:
> Hi Andy:
> 
> Thank you for your comments.
> 
> Andi Shyti <andi.shyti@kernel.org> 於 2024年9月6日 週五 上午5:36寫道：
> >
> > Hi Tyrone,
> >
> > On Fri, Aug 30, 2024 at 11:46:34AM GMT, Tyrone Ting wrote:
> > > The smatch check warning is "buffer overflow 'npcm_i2caddr' 2 <= 9".
> > > The original design supports 10 slave addresses although only 2
> > > addresses are required for current implementation.
> > >
> > > Restore the npcm_i2caddr array length to fix the smatch warning.
> > >
> > > Fixes: 47d506d1a28f ("i2c: npcm: Remove own slave addresses 2:10")
> > > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > Closes: https://lore.kernel.org/r/202408130818.FgDP5uNm-lkp@intel.com/
> > > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> >
> > your email used in From: is different that your e-mail used the
> > SoB. Is this done in purpose? If so I will keep it as it is, no
> > problem for me, otherwise I can fix it while applying it.
> >
> 
> I'll add the option "--from kfting@nuvoton.com", same as the patch
> author's email while using the tool "git send-email"
> in the next patch set.

don't worry, I will apply this patch number '1' because it's
independent from the rest of the series. I will do all the
changes you agreed with me.

When you resend this series you don't need to include this patch,
just rebase on top of i2c/i2c-hostp[*].

Thanks,
Andi

[*] git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

> > Andi
> 
> Have a nice day.
> 
> Thank you.
> 
> Regards,
> Tyrone
