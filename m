Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D38970B90
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2024 03:56:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X291V6kxkz3cG6
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2024 11:56:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725847002;
	cv=none; b=OYlHRAI23bhjwozgNj2wECsWszTNfsHmoK2fXFeK0PR39Ds5jdxIidTcgDv7GGe6OoHKTgfht3TyyBXLyyvwp0nT6N+68d3kZiKjX22o0f5TR8Ro0JuKp+IjzMwjl9siOldbdNdsP3E77KIfj6PS/x6xfmt5ap9vi+MykLA86nakKQzrpErtn3n6wNI+aGntnjn4Uz3GPlSkHOVjPogGirC0+gDdd4BJ4vLdfworG/RjbWU0m/Olp47sHj0gStHr1O4VKWp8sTE9ttJeGKFvpBVP6qs6K0VrRrJIqR2qlycEVap/1FjnYavkErsyMsgilemM+6PFlmGEGuz5GxwXlg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725847002; c=relaxed/relaxed;
	bh=uCJjcmJDKMrQ+us9cppRbmfBwPVnybr35b5gsVcmfwU=;
	h=DKIM-Signature:MIME-Version:References:In-Reply-To:From:Date:
	 Message-ID:Subject:To:Cc:Content-Type; b=bxZ59jp+WKH0G42A7pmc1x3jj1fdJBKyXgWpIO4PpCmgV2CwHt14Ok6rCsAnDJicXgSO1njorR++a34WMFc6nBOwFa75yEBEUQuJTVKdvohQSVq+ird9PXilnpf7yx/BKT+W+ULZ81EnFBaQXtb4yNMT8KSxurEepsMJc2AVpAY33v9xZqIXcMyLxtjr1vkJZojo3p6Pin/GAFCZc4IErFIVmw4z5cYrdBZoDsU8XjgDwSYNASn48CQ5/HtvuzS1bkkvrcLtQRPMWPU+srl6wL++Ar0qJTKU9vA3jy+RANI1xbd267fXlsklW98hK0gxz3uuOydSCZMnnXhRY5VVLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=O2wFQbH5; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=O2wFQbH5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X291P6hrgz2xf2
	for <openbmc@lists.ozlabs.org>; Mon,  9 Sep 2024 11:56:40 +1000 (AEST)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a8ce5db8668so347733866b.1
        for <openbmc@lists.ozlabs.org>; Sun, 08 Sep 2024 18:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725846997; x=1726451797; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uCJjcmJDKMrQ+us9cppRbmfBwPVnybr35b5gsVcmfwU=;
        b=O2wFQbH5bUSwqONfVO/DNn79EEKIefYJ6C3j/H4hWLHSF59RGrKbvqi5R8yP1gVwlw
         StG5yFGEYv2u39dB0KRukLyB+VDG2j1r5p+Z0b8UjI4ElEeIXwuHVeEEqMI6/RTxH5+4
         BjY1M7tBDd8Dz35OnBNNrPh5wWTrwSbKFJS/jGe6RyROFLTjLHvG6os4skctDaEkYHbb
         C7HZPnhvM5Gt25dt3EPtf0R+JOb/wtMxOmVNmaNrGhdLV76sWHJ6sQC4h1tWraZIdgLa
         0lrHQz5Sn2aVKDwDIv7M15VUQpiihOuxE3swOOksH5JYXSEGZU3ahnzWjHzCDRJRz0ZH
         sGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725846997; x=1726451797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uCJjcmJDKMrQ+us9cppRbmfBwPVnybr35b5gsVcmfwU=;
        b=MtaUGRiSXEtJ53ina653htg2u75jljoBmLyPmJ0+buyUMNrdFppfjofV73xcB2tIav
         Bc5aHPECNGfq/Dba62tAn7R5Lz5HK/PbTT9q257hSpiuY/ABO1B+Za/h1caai1skxwqf
         +BkGM7zLcxL8bqhISrQxtgb4jALfOTnNpRHyBYOgRXL7Fj1P1dG2PmqpQiyjTVttch1l
         cys0h9GOzcKWhzpQB9iCbyVLxGG6hpJo8V8fVWn0MiIxNhURt/KkNCC16B88V4rMN5L3
         r3iI6aexd9G3fOp0hSjMckkOPPcM/PvRi7cFUZOzyGmz2tqKuXEubh8kWVkcz4ATAxaj
         NoKg==
X-Forwarded-Encrypted: i=1; AJvYcCW6C8vZi7jhMhYB9QugRxA+JbGtgTs61LwOdh6Su6mIat/cbMuwXkQ1aSJnFeT8ehTuiKk/zov2@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxYrWW5cr6jKIUUdyTPbWvz2Ssa6Id6q6PBDkKW4c9BDJMVY5EX
	jKfgumRQNXjoLJS/z47wV2ux1tDkhJ2qn0bvU1zS0OQ9Tu6kGR2XTzBjosH86bhiLjMLnfcp+ur
	c2NQjtQdE6oG4q9hpzAYXIpumFg==
X-Google-Smtp-Source: AGHT+IHMalItQyCwxTtL77V0zr8I2TJKjvPfT7o1+ANn5fimShLiSwPZZusUqd9F6N6LzZkQOlwLmH7vTO6V+4zCbS0=
X-Received: by 2002:a17:907:6e8d:b0:a8a:794b:9891 with SMTP id
 a640c23a62f3a-a8d1c72daffmr628007566b.51.1725846996519; Sun, 08 Sep 2024
 18:56:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240830034640.7049-1-kfting@nuvoton.com> <20240830034640.7049-7-kfting@nuvoton.com>
 <3wz36hrpicogoakqhmveppcrt6s52zmlcgjpio3wwpil3rdwdi@ft7tloqqf2zt>
In-Reply-To: <3wz36hrpicogoakqhmveppcrt6s52zmlcgjpio3wwpil3rdwdi@ft7tloqqf2zt>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Mon, 9 Sep 2024 09:56:25 +0800
Message-ID: <CACD3sJYFNV9Vxmq1Ydp=+wh-52DOCMsECO+RmP_K6t4B8wzbmA@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] i2c: npcm: use i2c frequency table
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

Hi Andi:

Thank you for your review.

Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B49=E6=9C=886=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=885:43=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi,
>
> On Fri, Aug 30, 2024 at 11:46:39AM GMT, Tyrone Ting wrote:
> > Modify i2c frequency from table parameters
> > for NPCM i2c modules.
> >
> > Supported frequencies are:
> >
> > 1. 100KHz
> > 2. 400KHz
> > 3. 1MHz
>
> I agree with Andy, please add a good explanation for this change.
>
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > ---
> >  drivers/i2c/busses/i2c-npcm7xx.c | 230 +++++++++++++++++++------------
> >  1 file changed, 144 insertions(+), 86 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-=
npcm7xx.c
> > index 67d156ed29b9..cac4ea0b69b8 100644
> > --- a/drivers/i2c/busses/i2c-npcm7xx.c
> > +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> > @@ -263,6 +263,121 @@ static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] =
=3D {
> >  #define I2C_FREQ_MIN_HZ                      10000
> >  #define I2C_FREQ_MAX_HZ                      I2C_MAX_FAST_MODE_PLUS_FR=
EQ
> >
> > +struct SMB_TIMING_T {
>
> Please run checkpatch.pl before sending the patches.
I did run the checkpatch.pl against this patch.
Here is the log from the checkpatch.pl:
-------------------------------------------------------------
./patch_i2c_v2/v2-0006-i2c-npcm-use-i2c-frequency-table.patch
-------------------------------------------------------------
total: 0 errors, 0 warnings, 265 lines checked

./patch_i2c_v2/v2-0006-i2c-npcm-use-i2c-frequency-table.patch has no
obvious style problems and is ready for submission.

It seems that the values of I2C_FREQ_MIN_HZ and I2C_FREQ_MAX_HZ are
not aligned in the email but they're
aligned in my editor (Vim with a default configuration).
>
> Thanks,
> Andi

Thank you.

Regards,
Tyrone
