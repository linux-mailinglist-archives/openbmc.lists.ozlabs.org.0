Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A94896E7B5
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2024 04:29:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0Ksx6nNfz3cGD
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2024 12:28:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725589731;
	cv=none; b=b0hDEwQGgAfwXewWIWNOdr8H1xAg900tLHaZmqihtzhl4jT3BIJcoWGDQfLunp1LFqXkKeViYBUrUn+egs07Pql2nhyon+Y90RNbFMbyvOjt1b7i46oSUl+Y2mLgaMXrxoueZALKQXYL+b8e+coFvXnrzz8EnDsIrABJpKjivszbNu4xOknix8XJAoqnu/0ok/Yt9hAM+d6UR3p2knEIVNM+AhfrnQ0MsNbSOtA/XxViA2Mv8lE0lIoBBrRa0NsvvSeyTWDCvHMi1D+6zGk+CbUTdPbb8rFwFvZuQHKzwSc551AHkHApwiDWu2vu0zIOTQ97NpO+L+SxFfMBLnxUCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725589731; c=relaxed/relaxed;
	bh=GK7dt7abJmn961GOVaVJQUoLvO/GNZzeN3uTR3aqVdc=;
	h=DKIM-Signature:MIME-Version:References:In-Reply-To:From:Date:
	 Message-ID:Subject:To:Cc:Content-Type; b=oR2msmw34Ke/nhMNHgrIU6wF94vIjRsTA8Bz1D1GNDkrsIG+lOmpGUbXQpudhzuHK5ri0xpgL2VFMeFfaPk3oRXjrjHyhB0bdwEzVkFJ9kPpUp4L2Tz8NscmJINE8IBe4VSC9OU7eODJFH/8cVsFfV/kdr4HfHv/QvTNCEL6uR+ZyIXY8JanIOBDlw8Lt8G8NSsmwjHzSkZlsyxbmtOGWQYP2RVUKtqzsjUicr7bjk2luK+T/tfeDvWhmvHZ6lcfjgQc8QJsVmfx2Al69+3ISzXkuk1i1kYR8C65+rypvJOgracVFSGyk8EqjVP7aef29aw0DIqk27vy/nBJ60E91w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Gr7nYEbr; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Gr7nYEbr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0Kst1Shqz2yF4
	for <openbmc@lists.ozlabs.org>; Fri,  6 Sep 2024 12:28:49 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5343e75c642so1708725e87.2
        for <openbmc@lists.ozlabs.org>; Thu, 05 Sep 2024 19:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725589722; x=1726194522; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GK7dt7abJmn961GOVaVJQUoLvO/GNZzeN3uTR3aqVdc=;
        b=Gr7nYEbrjvwrdSahPiBxVNIjjrlQS42rJ9A5BoTY4GheZCsmNMER7pxjqFZ95RZZds
         PbHeLN7n2bht8Vjh3nU+2IJaToaxYrvVD/Ciookm1I8mLOVEe1ud7zmaUfq/XZJpM8di
         nhAn76Uj4RYy77uTElGoFOpsN61xQCtIUi9VIYofYxnrDVcn1vOxAIU/aSfV80DNEz9w
         1FpTdUaHvoOeDSyXtnergf4yfmIzgqYDgVULmFin/vEMWGRxcDNOdtxGV0/xve84tySB
         JMQcqkaoLUPHxE7poH+KbJeWb0C/o8J+vY0fKdQ4gqeA32IL12AgWNvUmsy4Pk9Nga2s
         7S7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725589722; x=1726194522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GK7dt7abJmn961GOVaVJQUoLvO/GNZzeN3uTR3aqVdc=;
        b=MWxnEjc88Q9pGodl/iV3nwpwJ+TAxuRCKqYl25QP15yzAQ5kIcyxDpr0IieAbD9ryv
         IRLogf9fpft5+k69AE/lQ+JmQSxHNHbRg5CWEvSbowM2In9qeLe8zTq4A5fLe6sKcHF3
         WiF8abLMPr6l3KZDnWsWkyn178iRkHJIPnp7bSdlhN77Pqy3Z0dDQhZBYwHEbYacZDPo
         tJKh3ZrSCO+QsXy4hJa/gUqvxIv3WuLj/euYlF374+4H3vIMqn5nI2rE+ek5O6MmZ3na
         IozFvZfJGx6bgRHxbhkDrY6UsSomBn9oagIBXZPJuaWzFAet6bJ1MVdvqfiAAO5reoAw
         NljA==
X-Forwarded-Encrypted: i=1; AJvYcCVMx0pPBxfnHKFxJ1XTX1whBcScy/1bD9qYHhTnBueRIjLWKD+4/cNK5c6pXTpCL6keq8yOUjsx@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzDjNDOe5j93xJZG28u1RYvTPtT8bUNQN8cLr+p/AwXpcnfzCLg
	WvZqR0g6Pw2Cv+P/CWU9wJKfSOtdDh5pv2SHt/4p7LHi+vl1jV3EjWYa6evUNRp6zODN7jsFHrG
	jqvuc+Db0J+ZTDZ0T4EQL+TF7fg==
X-Google-Smtp-Source: AGHT+IGLL8kBf9+/E2NQeP7puMX03Eq9h3iMuhuBHNNWVlWmSqelsEaUKLbRuja63ty1DA8DhKY62ve783uWcW8rsPQ=
X-Received: by 2002:ac2:4f08:0:b0:52c:e05e:849b with SMTP id
 2adb3069b0e04-536587fc823mr490630e87.39.1725589721463; Thu, 05 Sep 2024
 19:28:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240830034640.7049-1-kfting@nuvoton.com> <20240830034640.7049-2-kfting@nuvoton.com>
 <xdaufg4bju3iq5fqeo2gdej3yaxyufhuaiuyixnla234l2ej3r@fmvann767tib>
In-Reply-To: <xdaufg4bju3iq5fqeo2gdej3yaxyufhuaiuyixnla234l2ej3r@fmvann767tib>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 6 Sep 2024 10:28:30 +0800
Message-ID: <CACD3sJYt12H3DNqRwOU0ULDwJj2TbqUR5NhYWxBgvFggqKVyGw@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] i2c: npcm: restore slave addresses array length
To: Andi Shyti <andi.shyti@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Andy:

Thank you for your comments.

Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B49=E6=9C=886=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=885:36=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Tyrone,
>
> On Fri, Aug 30, 2024 at 11:46:34AM GMT, Tyrone Ting wrote:
> > The smatch check warning is "buffer overflow 'npcm_i2caddr' 2 <=3D 9".
> > The original design supports 10 slave addresses although only 2
> > addresses are required for current implementation.
> >
> > Restore the npcm_i2caddr array length to fix the smatch warning.
> >
> > Fixes: 47d506d1a28f ("i2c: npcm: Remove own slave addresses 2:10")
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/r/202408130818.FgDP5uNm-lkp@intel.com/
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>
> your email used in From: is different that your e-mail used the
> SoB. Is this done in purpose? If so I will keep it as it is, no
> problem for me, otherwise I can fix it while applying it.
>

I'll add the option "--from kfting@nuvoton.com", same as the patch
author's email while using the tool "git send-email"
in the next patch set.

> Andi

Have a nice day.

Thank you.

Regards,
Tyrone
