Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C38BE970B7F
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2024 03:48:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X28qM5vmyz3cGg
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2024 11:47:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::129"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725846476;
	cv=none; b=TjfgPGUBxjbN/I5c1aQEQ0StqSNJ4ShBNgo1cSDTVx8gvaBfaFf5tNbUuUGUJVjU7eCifanV7UskMm18vO0myEXD/FaCv8y5/nqTJ3Fru3TF6cG45pY/XKgLdDeezc8zXWOshjcW/OobsVITtjwIBlv8To/ZOYtfYd7Iq4AMpg7hxZwOjhd8J9DmhULwDA3aT3GJvSoCj5n0eP6CDG03YDSMOSRwPszzgYTFdXkrtvCL6vCelTT9XP7iDp3sbqSBet4OuWBlkfg4FJUoTuEW28yN2gJBA8JkSNxgwL/w4hiIItvVTmCOOoj23pvr5qb5G54gWqd4DKqJZA+ktZTS5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725846476; c=relaxed/relaxed;
	bh=sMBcjmTPkiGqMm9iJQ9qc2+UW2td00ShQaRS9ZKW8X0=;
	h=DKIM-Signature:MIME-Version:References:In-Reply-To:From:Date:
	 Message-ID:Subject:To:Cc:Content-Type; b=bFVG61FGsfk3AHpzbeJm3is0pFN6UINcRqtUrgUem6/EWmghs3gF/HBva7wKIQJBV8CHWHWHzVcOvhrXZn1i93e/jAac74zR17UkVCsTVl0+4wqyxq9EBtNynFv8sy9QLtefOlrJjWy2I0eggARs4EgFevWsdlOHn6qqAGbGsX4HCwK2sf9drSx+2Iur9UZExNlv69M032Y/L86jmcEq6jilAPhAhycyRqtYAH6CWl/ooYpntZ7Nr0RAkAkDDiiYDj7pSimZWdE0rLMuU5opRC76fmQI9v/0vnZqFBMoGCMmfZTir5vS57c7XWhlu+qgzkbdISTN84T2XOnnaXjJLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ByApETl5; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ByApETl5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X28qH3Sj6z2xf2
	for <openbmc@lists.ozlabs.org>; Mon,  9 Sep 2024 11:47:54 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-53568ffc525so5218658e87.0
        for <openbmc@lists.ozlabs.org>; Sun, 08 Sep 2024 18:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725846468; x=1726451268; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMBcjmTPkiGqMm9iJQ9qc2+UW2td00ShQaRS9ZKW8X0=;
        b=ByApETl5t9XYezgeGOduX0AqE1LcqO6p8b838a/Xl7thWTdMtBKQOzsHGSxDbKtYJN
         NiCGia5YwYVgEtR6brbHzK40POwiBmaAvbCSpzmLdgQXzGFc/cly/FFVgjKtuLDBAjje
         ZsZAKggrjydjw7lsLqP26MlQJhFPoiRw1ns4ITNsC/VxTGTAm5DY27Clwj0bGL/FnXzw
         gqoDV0KKrMmiObKE5y4wNxh0GSkfm6RW+0NVZBvUeqO4+9OWeqZ78W5g//7iiQgByQsm
         tIzFHnvQtxjjD5b6WJAfBaUXKisWypEX+TeDO+p6c97uFmg0XzEC9Fby/qS1q2e6C5e+
         ZcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725846468; x=1726451268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sMBcjmTPkiGqMm9iJQ9qc2+UW2td00ShQaRS9ZKW8X0=;
        b=fvhqBK68DcZFfdV1TPtLlQCjHsWxElPTzI3lJAKGB8jwLXgCo/K1lBzs0buXRWP79B
         nZ+UN7gK++LoOIMgPioagbb1yPskbjdJHfMksZUzDsYbYTNXRVBPTD9dkghsbE8tbQT2
         L3B5ikBp4cSJvjP0xiD5C/4tn1RH7qS/WTaflUxUfUA/m3u+myN8jGo/10//GuRyWabx
         sgOTeVomuKZ1CBGwyp8bWcpWWD6t6Zr4i6W9GJgpxvEOANaZVfAauQsvwiU00B/TIr3t
         L1qb17iLG3q0KRTFvb8YxECxxRXnq0aVxaJuhSx1yPQLl9R7ntLGCi6+ltvbztdrG6Ta
         iuOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUL0TaniTwa35zTlw/LjXW3Bh4d8IOnUx/mftEeavrVUl5HvMwBtO9yyC/8rTpXELT+9qVhO0sT@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx2lt+pvuFVpX2XZEB0Hv0cHKe7u3WtHUF4i8SbZTop0M8fHueJ
	/DJu1a82qMlUwLPuqmTsRMmUBXyqktPp95IO8WwJ+pGqRPMdrJ2vZGkih27b9dfB6RH4XmV7xYP
	Z8cG7+dOpkXuaUTnrrMx0+sTpig==
X-Google-Smtp-Source: AGHT+IHDjA5SvJpZ7TekDlfF9Vtbes/OHdwckVDtaVtHJqTYfJbJlBpPHzMU6b/3YNIwh1UPdH6a36f8y29yhDpu85o=
X-Received: by 2002:a05:6512:3b07:b0:536:569b:a59c with SMTP id
 2adb3069b0e04-536587a407bmr5596365e87.4.1725846467556; Sun, 08 Sep 2024
 18:47:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240830034640.7049-1-kfting@nuvoton.com> <20240830034640.7049-5-kfting@nuvoton.com>
 <stnyjmnqdobzq2f2ntq32tu4kq6ohsxyevjn5rgz3uu2qncuzl@nt4ifscgokgj> <CAHb3i=vSUqbsoRhnnyMOoteKP3GCoXmCd+UKQSN_QWqkRweuiA@mail.gmail.com>
In-Reply-To: <CAHb3i=vSUqbsoRhnnyMOoteKP3GCoXmCd+UKQSN_QWqkRweuiA@mail.gmail.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Mon, 9 Sep 2024 09:47:35 +0800
Message-ID: <CACD3sJZunRChkWBfntJP=w=8crLB2Afkb4hKz_5ntmiAXCGJQw@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] i2c: npcm: Modify timeout evaluation mechanism
To: Tali Perry <tali.perry1@gmail.com>
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, tmaimon77@gmail.com, linux-kernel@vger.kernel.org, JJLIU0@nuvoton.com, wsa@kernel.org, tali.perry@nuvoton.com, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com, rand.sec96@gmail.com, Andi Shyti <andi.shyti@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andi:

Thank you for your review.

Tali Perry <tali.perry1@gmail.com> =E6=96=BC 2024=E5=B9=B49=E6=9C=888=E6=97=
=A5 =E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=886:48=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Andi,
>
> On Fri, Sep 6, 2024 at 12:39=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org=
> wrote:
> >
> > Hi Tyrone,
> >
> > On Fri, Aug 30, 2024 at 11:46:37AM GMT, Tyrone Ting wrote:
> > > Increase the timeout and treat it as the total timeout, including ret=
ries.
> > > The total timeout is 2 seconds now.
> >
> > Why?
>
> The users want to connect a lot of masters on the same bus.
> This timeout is used to determine the time it takes to take bus ownership=
.
> The transactions are very long, so waiting 35ms is not enough.
>
> >
> > > The i2c core layer will have chances to retry to call the i2c driver
> > > transfer function if the i2c driver reports that the bus is busy and
> > > returns EAGAIN.
> > >
> > > Fixes: 48acf8292280 ("i2c: Remove redundant comparison in npcm_i2c_re=
g_slave")
> >
> > What is the bug you are fixing?
> >

I'll remove the Fixes tag in the next patch set.

> > > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> >
> > Still... can someone from the nuvoton supporters/reviewers check
> > this patch?
> >
> > Thanks,
> > Andi
>
> Thanks,
> Tali Perry,
> Nuvoton Technologies.

Thank you.

Regards,
Tyrone
