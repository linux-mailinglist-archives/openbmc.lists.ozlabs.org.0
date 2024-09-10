Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C35A972685
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2024 03:11:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2lyq6sYTz3cDk
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2024 11:11:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725930683;
	cv=none; b=R1bWquQFipHRudNYA2s2Yt+0j1fqx0/BwMbX1HHNi2g0UDk5qfNk86zKOjTPbbORCY311ZFcpHVTnuhRV7oqs8AuMt0Ucw8XPCJS/jILsxaEdIGMXMI6zxOMRBh7z9OqopW5dNYEaF3G9Z5Vb8pnQNWY6+MCqm1lE/HywXde/4mNDWUuVNpZZHQFp2lCkIdMAL7pBOV0ZgHRv57UfY1nmwddV2MoscBWWTrc1EtrzRfZnoGpEx3TpBDDbcgGgk8W5JmXWVyPOtWOamczXmwQnMYu+dofpTuchaWpOplvUVwYgY1/DXuttmcNal3ffMOGssXWSuuxWI2/k2NGhOlQTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725930683; c=relaxed/relaxed;
	bh=xvs07E2i2bNd5B5P6vbRb4Hm2f1x+c2Jt21PSRfmQwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mZbrjr62I/rtSl8lwyCEfQxraaUdoaMzHbYMVeNSxZVs2A1r4uHNBZ43x+sRISZMKhjKA5l1RpCAxHd8o4t7ldPP31wr/6Ok635oSVIx26cO2d9ZyX4yjF5duY80MaZ2dUOCD8NW60e95YOR7NSWcOwcHCjZT2BRHs+7v0YARpreZaLURLN3mCY4SAYwsXjfz4IP1eDMhoYufEQ3RohDoSzmkqt/Oeb61JR0znXXJJeEb5jbeWKHV/ZokeH4V41+WuXwRZSq+Lzphfy7V2MAVONhq1iHxvzVNErbZs6TvmuFH6N1kUOBqGeeaL6H/tAebGyIlEla/xP7XsFNwzpd9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jPoNwPkt; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jPoNwPkt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2lyf3Nvpz2xy2
	for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2024 11:11:21 +1000 (AEST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a8d6d0fe021so130896066b.1
        for <openbmc@lists.ozlabs.org>; Mon, 09 Sep 2024 18:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725930674; x=1726535474; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xvs07E2i2bNd5B5P6vbRb4Hm2f1x+c2Jt21PSRfmQwg=;
        b=jPoNwPktnxNgkMcS8y0uLcGIVvX/ioQ6Q8ZAxk8wKKzss1QpzfkJ1Zs2Eb19X8mcVa
         THmTdaCiHV0YX58gMpg7rMLOp0pgAcmT052SkZ8l5wzwGyp0r0o+6ZCkvWRRqiqo7mCD
         DzqWJeC1JsEnkPOE0EvlVlfM6Eh5BGsYnMfKACECG7bTC8wML7N9g9vLMDMpn87YljwE
         4h6OdVSxcZHeVZ5sumtrYQHcYP67kWByk3q3zZzQfjj9QchAmPeEgKSihA/FXJSiousj
         wkhSMMHAlxnRKQ4HkYshkJYt0uV/AWu9EjILpuI/vJspmQsyVVT/XGC+J9rO8KkuAxAF
         ys2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725930674; x=1726535474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xvs07E2i2bNd5B5P6vbRb4Hm2f1x+c2Jt21PSRfmQwg=;
        b=fggWdA6i7typ42fbHeLlmeIN732LAfwN3dqgWA5Ta2o7YmXUu1+WDZsEJAkjDutD07
         1p5JWp4PBXGJRXJ6VcKdxwAAHWmv3hsxKitMiP3uXXq3nwHE82JRGEEAZRelqwezouXM
         VBUIWTPWxPmwNw06w3k2uctTejTU3wuTCpBu/A7pdWhii/4kj+kv/cRNGddYd1vcRDjg
         J9OEzwxZ2nucN1iyIcpsgXK2NgUz/HRJmh4tbWb0Oa+Z/vNPEhrDsevZumExLth+Tymp
         qac3zP1RAMmGKAWJuL+tFYa4oQ55mPp0Tx5v7gT9Uh8RlckZcoEehptZ6ZBMbnpHs8VZ
         ZBPA==
X-Forwarded-Encrypted: i=1; AJvYcCWS/Qc8sdvMJEU/y8D4QIv+fwNo82fcPjkje8kxpdkGHjbIU9ExCZW4IfCvs72/mZPRUBZIkUVo@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy0np+2k837JfdYIsQ4fHLPAYK6M+NxBefmWqjWdpmsFRaI6WNA
	HdhVy3NdSiEWJtBSGTtSwU0R5ksPgmFX+Q7DVrkmnsonE1fyqB33BfLldDxBz3KN10KRqi0Y3/7
	rKs7gXGmB0B6Cmn1RjhlBxyxK7g==
X-Google-Smtp-Source: AGHT+IFHkrICs+xDdFNkI7+zSHcj2baGGC4Txv/LSEHP7d9YAivZ2e3Tq7DfFy1kLX72eL+3nujJ1JQHIDUUErgZWXA=
X-Received: by 2002:a17:907:72c4:b0:a8d:2c00:949a with SMTP id
 a640c23a62f3a-a8d2c009911mr659802066b.9.1725930672951; Mon, 09 Sep 2024
 18:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240830034640.7049-1-kfting@nuvoton.com> <20240830034640.7049-7-kfting@nuvoton.com>
 <3wz36hrpicogoakqhmveppcrt6s52zmlcgjpio3wwpil3rdwdi@ft7tloqqf2zt>
 <CACD3sJYFNV9Vxmq1Ydp=+wh-52DOCMsECO+RmP_K6t4B8wzbmA@mail.gmail.com> <2kqhf2ad3omx3dsjucrqhtnonnox7ghtp7vkogrwrdfh3dgg2o@4cpa4gfg6c3f>
In-Reply-To: <2kqhf2ad3omx3dsjucrqhtnonnox7ghtp7vkogrwrdfh3dgg2o@4cpa4gfg6c3f>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Tue, 10 Sep 2024 09:11:01 +0800
Message-ID: <CACD3sJYHW6C7REgffBB1W+e3OTFYY57WdQyVKREKg-Fot-HbOw@mail.gmail.com>
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

Hi Andy:

Thank you for your comments.

Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B49=E6=9C=889=E6=97=
=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=888:57=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, Sep 09, 2024 at 09:56:25AM GMT, Tyrone Ting wrote:
> > Hi Andi:
> >
> > Thank you for your review.
> >
> > Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B49=E6=9C=886=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=885:43=E5=AF=AB=E9=81=93=EF=BC=
=9A
> > >
> > > Hi,
> > >
> > > On Fri, Aug 30, 2024 at 11:46:39AM GMT, Tyrone Ting wrote:
> > > > Modify i2c frequency from table parameters
> > > > for NPCM i2c modules.
> > > >
> > > > Supported frequencies are:
> > > >
> > > > 1. 100KHz
> > > > 2. 400KHz
> > > > 3. 1MHz
> > >
> > > I agree with Andy, please add a good explanation for this change.
> > >
> > > > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > > > ---
> > > >  drivers/i2c/busses/i2c-npcm7xx.c | 230 +++++++++++++++++++--------=
----
> > > >  1 file changed, 144 insertions(+), 86 deletions(-)
> > > >
> > > > diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/=
i2c-npcm7xx.c
> > > > index 67d156ed29b9..cac4ea0b69b8 100644
> > > > --- a/drivers/i2c/busses/i2c-npcm7xx.c
> > > > +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> > > > @@ -263,6 +263,121 @@ static const int npcm_i2caddr[I2C_NUM_OWN_ADD=
R] =3D {
> > > >  #define I2C_FREQ_MIN_HZ                      10000
> > > >  #define I2C_FREQ_MAX_HZ                      I2C_MAX_FAST_MODE_PLU=
S_FREQ
> > > >
> > > > +struct SMB_TIMING_T {
> > >
> > > Please run checkpatch.pl before sending the patches.
> > I did run the checkpatch.pl against this patch.
> > Here is the log from the checkpatch.pl:
> > -------------------------------------------------------------
> > ./patch_i2c_v2/v2-0006-i2c-npcm-use-i2c-frequency-table.patch
> > -------------------------------------------------------------
> > total: 0 errors, 0 warnings, 265 lines checked
> >
> > ./patch_i2c_v2/v2-0006-i2c-npcm-use-i2c-frequency-table.patch has no
> > obvious style problems and is ready for submission.
>
> mmhhh... I thought checkpatch hated capital letter declarations.
>
> Please, then, use only lower character names for declarations.
>
I'll use lower character names for declarations in next patch set.

> Thanks,
> Andi

Thank you.

Regards,
Tyrone
