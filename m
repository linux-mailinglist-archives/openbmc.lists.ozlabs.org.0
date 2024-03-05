Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAE3872CB8
	for <lists+openbmc@lfdr.de>; Wed,  6 Mar 2024 03:25:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=beuOQr0J;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqGVT2b9Kz3vXf
	for <lists+openbmc@lfdr.de>; Wed,  6 Mar 2024 13:25:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=beuOQr0J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=ppighouse@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tprbb02Jmz2ykC
	for <openbmc@lists.ozlabs.org>; Tue,  5 Mar 2024 20:58:00 +1100 (AEDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a441d7c6125so49830666b.2
        for <openbmc@lists.ozlabs.org>; Tue, 05 Mar 2024 01:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709632676; x=1710237476; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X+P16Wj01OQarXDJbDOe1U/EcWcwiUUk+JKOZW37dio=;
        b=beuOQr0JerzljMNMAxjzMqiBpgOQrVCSfEiCEfgYpissX9DmEfSog+2FcNAMwcJhNT
         lmXBuVe+rl9G12dEEq786tlm79lCeZSFLeQkfqM2sDiexUS+v1b8w27HvSRjAIi/2JB3
         KoTDEPrCTwhldrOdHiuf6XmJPTq3XnVfkkcwaZII9fj2L1sup5V/LFv1V+Iosp3HHouL
         j4UWeWyjVBRYPzJLM8Pv0uvTakI8pm3G8fpSVkv9MPLc6d/SQ5ITafggmZpYVk3fN81m
         cVFNuilc8wvhvYdc4KTB26Sy83EREW7TOWASnCklISwttA9jHsCdouLdn25l+tGx98xJ
         YTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709632676; x=1710237476;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X+P16Wj01OQarXDJbDOe1U/EcWcwiUUk+JKOZW37dio=;
        b=tEPhSkhKWm3EfDyd5soYsVArLicTZzYcRASOaqOya1ZhG8efeGT5yOyoiLBX3+RO41
         4bBd7kk9vtrg6eF+A5QDW0EpzcNqluq9ryOGlOEWrwEaJBkh5BApeiIsfYiNppWbUpXH
         h00nCq/vi6/FWmPLyPv21sQwB4d4dafeUVCKdh1B8qNDOdSVa958HA8pvS1AoV8sgWta
         aqwbOII12w2PpMNkw0VbSS1WdLhMdLCYS0zPMFJY3QwX1VuLaAojMs15PaY5VJfDa0My
         ydF8tCuEjqLtiTpm3O+QuJjXkbV0BoHNhhy4pmfIGCr6vsP4Rd19AheAdY62cHTmzqyq
         yg+w==
X-Forwarded-Encrypted: i=1; AJvYcCUqq0As9KBtPNrikc1m+deG7M37vE/1QnWxgUlaooVq9Tvqgyc8r8IVmOwtRUGlnw6ouRzlRkSBuesjfxMdcJAzkeJ1Pzv3gxU=
X-Gm-Message-State: AOJu0Yzon5br9qz0FCyTfzvPghQvZZcGgtTcNt597mwcEpHiUBy+4HNp
	mJiaPmU2x8Yx2xsa23y2Uax3nAxhTg7M3oHSg9F5RbGNVVD5bvQWn/RTlqLoLDmwBg3VNLG4HmB
	jQHlR/0yIsrDHxNPRAgP+l7uHjDE=
X-Google-Smtp-Source: AGHT+IF20hamFlVpadqSfzSHL7vRjniGWk8jW6W/rsr+pz0z2zK08gZZ9gxt/sKLn8W1/CyKyVOV526btYONlvlmo1k=
X-Received: by 2002:a17:906:6b89:b0:a45:419:f1e1 with SMTP id
 l9-20020a1709066b8900b00a450419f1e1mr4774776ejr.39.1709632675660; Tue, 05 Mar
 2024 01:57:55 -0800 (PST)
MIME-Version: 1.0
References: <20240130090447.198103-1-Kelly_Hung@asus.com> <acd6f49b-b476-4364-8263-06e20a0c599d@kernel.org>
 <TYZPR04MB6596BB61B2D1B9216F06A18E9D222@TYZPR04MB6596.apcprd04.prod.outlook.com>
 <c88558f8-acc1-4b36-b729-bdf1019e81a0@kernel.org> <TYZPR04MB6596ACF05A2D79377F53A0F09D222@TYZPR04MB6596.apcprd04.prod.outlook.com>
 <2c5cd4f1-b048-49c1-89cc-58070d64c09d@kernel.org>
In-Reply-To: <2c5cd4f1-b048-49c1-89cc-58070d64c09d@kernel.org>
From: Chia Li Hung <ppighouse@gmail.com>
Date: Tue, 5 Mar 2024 17:57:42 +0800
Message-ID: <CAK=2BxufCBOhYdGRZG_0RdzF17W57bNV2kELT2nx8L9xJXFfKA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: asus: Add ASUS X4TF BMC
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: multipart/alternative; boundary="0000000000005446c30612e6e0c8"
X-Mailman-Approved-At: Wed, 06 Mar 2024 13:23:00 +1100
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
Cc: =?UTF-8?B?QWxsZW5ZWSBIc3Uo6Kix5bm85bKzKQ==?= <AllenYY_Hsu@asus.com>, =?UTF-8?B?VGFpamllIFd1KOWQs+azsOmgoSk=?= <Taijie_Wu@asus.com>, =?UTF-8?B?S2VsbHkgSHVuZyjmtKrlmInojokp?= <Kelly_Hung@asus.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000005446c30612e6e0c8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2024=E5=B9=B43=E6=9C=885=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=885:44=E5=AF=AB=E9=81=93=EF=BC=9A

> > -----Original Message-----
> >
> >>
> >> Hi, Krzysztof,
> >> I have already asked our company's IT, and because of security laws, I=
T
> cannot help me delete that confidential information.
>
> >Well, this puts me in quite difficult spot because I might be legally
> obliged to delete your emails. I don't know how to proceed (and I don't
> care), so I recommend using different email provider, but if you do not
> want I will conform with the requirements and delete all emails from you.
>
> >Best regards,
> >Krzysztof
>
> Hi, Krzysztof,
Yes, I replayed this email using my private Gmail account. I hope this
patch continues to be successful.
Please note that the email for my openbmc account is kelly_hung@asus.com.

Thanks.

Best Regards
Kelly

--0000000000005446c30612e6e0c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">Krzysztof Kozlowski &lt;<a =
href=3D"mailto:krzk@kernel.org">krzk@kernel.org</a>&gt; =E6=96=BC 2024=E5=
=B9=B43=E6=9C=885=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=885:44=E5=AF=
=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">&gt; -----Original Message-----<br>
&gt; <br>&gt;&gt;<br>&gt;&gt; Hi, Krzysztof,<br>&gt;&gt; I have already ask=
ed our company&#39;s IT, and because of security laws, IT cannot help me de=
lete that confidential information.<br>
<br>&gt;Well, this puts me in quite difficult spot because I might be legal=
ly<br>
obliged to delete your emails. I don&#39;t know how to proceed (and I don&#=
39;t<br>
care), so I recommend using different email provider, but if you do not<br>
want I will conform with the requirements and delete all emails from you.<b=
r>
<br>&gt;Best regards,<br>&gt;Krzysztof<br>
<br></blockquote><div>Hi, Krzysztof,</div><div>Yes, I replayed this email u=
sing my private Gmail account. I hope this patch continues to be successful=
.</div><div>Please note that the email for my openbmc account is <a href=3D=
"mailto:kelly_hung@asus.com">kelly_hung@asus.com</a>.=C2=A0</div><div><br><=
/div><div>Thanks.</div><div><br></div><div>Best Regards</div><div>Kelly=C2=
=A0</div></div></div></div></div></div></div></div>

--0000000000005446c30612e6e0c8--
