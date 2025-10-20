Return-Path: <openbmc+bounces-776-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B0BBF2937
	for <lists+openbmc@lfdr.de>; Mon, 20 Oct 2025 19:00:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cr1rG3hMVz2xWc;
	Tue, 21 Oct 2025 03:59:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::92e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760979598;
	cv=none; b=YEyNQRqQqJ8gSMU3/7jwHryH9MAv2NBVugEzq6VFPB9BPiUuJAG54jkpq/1j1QAIQ88X9+yXI23k4sFFqOViWwz6AgUdxpL2lqe7C9ADpw+tNYRD6vSlij8XaskgYjDrdPtuXYVM/+FUMewuhceJ7QWbFM/zNJNbu+ieXhP8G2B2l9X+xlXnDqsGZpc8OeiV6GDjQkc9b6eWid/OYtBRdg/T7d83jEGatkDp8iinA6Yn/vrGNEc71Gim4tIK0ERjF+QIOgsDqzY7IuJ1rCfuJXuZ3LKx4ukcCSOG0AiGvI1mIJaMpRfmBkNJTqxpPUOjhwPc688SFosy54t+7CMm4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760979598; c=relaxed/relaxed;
	bh=PkrGewg2VtYamEqOQyjjSSoP4H/JKCOLNozlRWZvh2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VQPYLeYRrTF6H+j/S0c610CYnD9w8AczyDbNFLQTrTzwBIT3qsMbBBI/eRm9ZTe948jz2QI+msrffhvs2vfWt43g29mMFyRz3zHPYlaI/ccLvtBK+6AvMiedf+StijPdZU/w+h8W9kHB6zVEXTv/6ZEL+V3GYUIuCnU7mZK1R5Cn6y6u422CVuzdsFcCZUXk+MSf5YxgCVsfw4RzPCBhmIwjdtj3WyF5ji308edjyZbfnqugxRwAz2IUr6ji5TIjvaLjndgLykpDF6mPNOcTwb5rRd8w5MUT/F8J/HILPcSoWKzjDCHx2Ou/bhSk9XqAVM9ifMj4/6MtSNyyGnga4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iDRgIqmr; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::92e; helo=mail-ua1-x92e.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iDRgIqmr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::92e; helo=mail-ua1-x92e.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cr1rD6Wn3z2xS2
	for <openbmc@lists.ozlabs.org>; Tue, 21 Oct 2025 03:59:55 +1100 (AEDT)
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-8fb58f2b820so2590771241.1
        for <openbmc@lists.ozlabs.org>; Mon, 20 Oct 2025 09:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760979593; x=1761584393; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PkrGewg2VtYamEqOQyjjSSoP4H/JKCOLNozlRWZvh2A=;
        b=iDRgIqmrQJrCVZravbS2YUkNeSKzm7N/rhowwtRrHEPaMwNDpDxgRkq52Ll2YwaBNe
         /AV3n5KBUudeTc0wFXQmVg3c5w//VRvN8gGhF1oYeKdMWu7u1pacLQu6y1VMgHywypRu
         eSJtLzTxFVvwfS0mNQboTO/guJyPcWt+zaKvgwi4W7bvVzvS5H8mpQ2+Pzf9qtbRSuf4
         3LPVhdAydhZAzCMtM1+SoET46OsVDIgn1uOdMNoKoQXW+BAz/NTlDOS17QtGpSoUOTTW
         CQZszeGaLWP2FhBgBA5ANtEQgCKq9J7L1yHF6zYWpreRwqSJShY9kUNGhlAdHXMhhXMm
         QMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760979593; x=1761584393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PkrGewg2VtYamEqOQyjjSSoP4H/JKCOLNozlRWZvh2A=;
        b=hXn+ty1WYfbAGvNyV7Q3wGwj1/zM8G9zR1hlsJHbESCjPZSLyGfsxpEmuvXLkVeUW1
         uALOX+3JOg+pt/ILe3XrApFhlxnNN2CeH8jx5oCFDHYMWjW10BxBXRJDq/oFPiGRK/N4
         774KaPAz9suy2RkjrgOYslKtAvhrRRywg4L+i4rC6xIegPJ8Ru9igPr2+iio+PVMqGJL
         Zfk5Lwf+MY++3A9dQLDhycUktSWso74K1qotZBKME4zULdybKZnZ2cxOV5Lz70qAOFso
         uTItfi6zkUYTyxfLN3+fBsWEK8orTHozzVKaF+k1DDUh6wN7+J7zglfkb8gs7F5zP+ra
         M13A==
X-Gm-Message-State: AOJu0Yz3yySKQVYxgBZVKesLc3/ku/5J7bkSNXONk8vrX8lBHgUeXnru
	dBvBfO4/kSuSKQtw3sWYmRvuULqTJr28P1IlKXoYyM7INh2uHJq33149Je/uQHmMyaR4alLLWDk
	s5lw0C/xUCJGXUi9HCzGKs8Wjp1H/9oY=
X-Gm-Gg: ASbGncu1vWO50BDI4OMfOxf5pdL8PYlOtILtYXvqYxu81hczjQHOGH0UstHsYmJ6yce
	Kz+sRB6JHUfV71NvutQewvW4yIZheEY6zmYR4A/4ye8M/Dq/6j0rg8mSHZxuZhVNguHHhel0vmJ
	Yo39/qfRYrvNvFdw5eU/DZwtYT4SP7Ydv+LCkRp4V6QEsPlenrOcJ6UWoIZrm4Dcbo9+/ws7ZrH
	jysf+BNidu4rJN8iH4wwF7tsAlYVp3YV0IIjYZ0hyJbmZjbG4MIv8L7YUfRf5nMqwEHeeTYPkGf
	tjMyhdv9e1kbWwZoYYUAPrJC+zk9gw==
X-Google-Smtp-Source: AGHT+IHQSKvM0zGXW2DGcHzEnM2MzPmxOtKjVQIm3xroPBnZdtuo35PIFuWHADPbnk7GFe5d573oBjyTgsUdYzvXf58=
X-Received: by 2002:a05:6102:2928:b0:5d6:131b:c0bf with SMTP id
 ada2fe7eead31-5d7dd6a4a9dmr4555531137.22.1760979593066; Mon, 20 Oct 2025
 09:59:53 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <TYZPR04MB5291728EE91DEAFBD3869B3194E9A@TYZPR04MB5291.apcprd04.prod.outlook.com>
 <CALLMt=o5n5w=4qecOQ8q5h+3Xg4E5MC7Zvt1K=11aGGMq0BFiA@mail.gmail.com> <TYZPR04MB529187F754B2D14C94E37A9094F5A@TYZPR04MB5291.apcprd04.prod.outlook.com>
In-Reply-To: <TYZPR04MB529187F754B2D14C94E37A9094F5A@TYZPR04MB5291.apcprd04.prod.outlook.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 20 Oct 2025 12:00:47 -0500
X-Gm-Features: AS18NWDi1Iay6H8dtQK1oJ5_sGKLZNsBaI11fd7GV2ouIDH8-MeZY6GADo3Pnq4
Message-ID: <CALLMt=qXN=01Lo9MMri2Hc+=6wvQ+CZsoPGOkuMSzHvh4xxUEg@mail.gmail.com>
Subject: Re: Wiwynn Schedule A Update 2025-10-20
To: "Jacky Hung/WYHQ/Wiwynn" <JACKY_HUNG@wiwynn.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	"Aldofo Lin/WYHQ/Wiwynn" <ALDOFO_LIN@wiwynn.com>, "Evan YZ Wu/WYHQ/Wiwynn" <Evan_YZ_Wu@wiwynn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Oct 20, 2025 at 7:15=E2=80=AFAM Jacky Hung/WYHQ/Wiwynn
<JACKY_HUNG@wiwynn.com> wrote:
>
> Hi Andrew,
>
> I add more members into the attached file and need your help to upload to=
 the projects google drive again.
> Sorry for your inconvenience and thanks for your help.

Sure thing, I've updated it.

Andrew

>
> -----Original Message-----
> From: Andrew Geissler <geissonator@gmail.com>
> Sent: Friday, October 17, 2025 8:44 PM
> To: Jacky Hung/WYHQ/Wiwynn <JACKY_HUNG@wiwynn.com>
> Cc: openbmc@lists.ozlabs.org; Aldofo Lin/WYHQ/Wiwynn <ALDOFO_LIN@wiwynn.c=
om>; Evan YZ Wu/WYHQ/Wiwynn <Evan_YZ_Wu@wiwynn.com>
> Subject: Re: Wiwynn Schedule A Update 2025-10-16
>
>  [External Sender]
>
> On Thu, Oct 16, 2025 at 5:33=E2=80=AFPM Jacky Hung/WYHQ/Wiwynn <JACKY_HUN=
G@wiwynn.com> wrote:
> >
> > Hi openbmc team,
> >
> > Please refer to the attached file for Schedule A Update of CCLA from Wi=
wynn.
>
> Thanks for keeping your CLA updated. The new document has been uploaded t=
o the projects google drive.
>
> Andrew
> WIWYNN PROPRIETARY
> This email (and any attachments) contains proprietary or confidential inf=
ormation and is for the sole use of its intended recipient. Any unauthorize=
d review, use, copying or distribution of this email or the content of this=
 email is strictly prohibited. If you are not the intended recipient, pleas=
e notify the sender and delete this email immediately.

