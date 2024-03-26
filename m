Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B2A88BBCD
	for <lists+openbmc@lfdr.de>; Tue, 26 Mar 2024 08:58:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lFQ90EfL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3hxr6G3Kz3dSr
	for <lists+openbmc@lfdr.de>; Tue, 26 Mar 2024 18:58:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lFQ90EfL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=ppighouse@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3hxJ2dGrz3d2x
	for <openbmc@lists.ozlabs.org>; Tue, 26 Mar 2024 18:57:54 +1100 (AEDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-56c1922096cso1812693a12.0
        for <openbmc@lists.ozlabs.org>; Tue, 26 Mar 2024 00:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711439867; x=1712044667; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pGhw2WyiD+iOwvEDpBPxqx4rVioXw3SBwfYbePagMVM=;
        b=lFQ90EfLj2KpxJZLmHfZ/CQAFlbu0xhp2AOHEXlG9aHLardC4LReRGbvOh6zfLEk8g
         nl9mrLnxocA9lII4IQqze/0g+WfzLllw1wSLIiPHxCxyVHnMMz8YSs/vLFpXHY46Pmhp
         OXvfs9eRtB8WlAR1fCW72Uc0UjYofpzcWlNZIXdLb/BRGW5XvTQGRmDm5QTZWh1LqZdW
         xlsf0RNMVVFjtWzDXyg04kzBoITlbDiDTISihdaZoGm4oUsfLdXu43R9rFIQCQeitSHs
         DdHkThywZ9v2jpb2pxGrNHzwn4nmlhDI1I9/AOeHmhkK9vnMSnGZvA7pgLOeEEYh2kwH
         RcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711439867; x=1712044667;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pGhw2WyiD+iOwvEDpBPxqx4rVioXw3SBwfYbePagMVM=;
        b=QvxQjYygAS7PEN4JyMkja191N9a03DJv6U9JLCSWXYHP4hxsR3RJ2aMcRLj+j02S21
         yxP6q97eIatfZpoHL8NlpC9MlsyP6rWke/uQF71tDUR/VDvPKuEvkjj9C9YfZ4gEJ9SB
         5jR/nA3qIlTrWap1V0LYeAcjzKFxXdJM1iiuCzVRFCNkOgGjLt94zkOCXsbllZMy7FTi
         8VxLg+OpeMVsnapcRt80e85eDPUSpD31Kg1Ls6+zZ6RY+vn8WsE+04f1+AMScG3431a0
         O3PKRgyKTvd9HXQyWyRDqlP2HhjpwW4VtDvwRbLfROh7L6tcl/NWbUuKHnIun4YruNWc
         j9oQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRJkdLAsZQhogMVynKC2ZDOE9NaGvuTSTdB35Dm9PMUTNlWguQSXY8OstkFl+uPRNNKSfy4xeHkuG4Vo4uWDcB1USWIYOnZ8c=
X-Gm-Message-State: AOJu0YxJcrhsj58QGVqrDMzKSlnetNws7ptr6tzqAWS8t2N/KO4yCt8/
	KfeRKGhiQ9LZpIlOOQ4KsxG95J6WFSzGqN2eqfIJoNAOlFW0D12z3G93gS8/o8pt6hNFEoDyeCH
	VvGErPO951BuG58zoJ5tJ36f+ybA=
X-Google-Smtp-Source: AGHT+IGtsd0QYrMbHt1U2ZzcK/C46/XEVl0H86CEzNMUPBNFkUgBIhVyTe8HBfy1rXtyVMr/L+OlNVkJwOLp/IFWkVU=
X-Received: by 2002:a17:906:4112:b0:a46:930c:b793 with SMTP id
 j18-20020a170906411200b00a46930cb793mr303903ejk.9.1711439866811; Tue, 26 Mar
 2024 00:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240130085652.198010-1-Kelly_Hung@asus.com> <57419138-9c80-46c3-9341-b55576a3f7d2@linaro.org>
In-Reply-To: <57419138-9c80-46c3-9341-b55576a3f7d2@linaro.org>
From: Chia Li Hung <ppighouse@gmail.com>
Date: Tue, 26 Mar 2024 15:57:35 +0800
Message-ID: <CAK=2Bxs=oAxL+-XY+skwLxmHBB1Tts5wEQ+vejCCtmcDcgGJPA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: asus: Add ASUS X4TF BMC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000050e2e406148ba5a1"
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
Cc: =?UTF-8?B?QWxsZW5ZWSBIc3Uo6Kix5bm85bKzKQ==?= <Allenyy_Hsu@asus.com>, kelly_hung@asus.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000050e2e406148ba5a1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> =E6=96=BC 2024=E5=B9=
=B41=E6=9C=8830=E6=97=A5 =E9=80=B1=E4=BA=8C
=E4=B8=8B=E5=8D=886:35=E5=AF=AB=E9=81=93=EF=BC=9A

> On 30/01/2024 09:56, Kelly Hung wrote:
> > This initial device-tree provides the necessary configuration for
> > basic BMC functionality and work on ASUS X4TF production.
> >
> > Signed-off-by: Kelly Hung <Kelly_Hung@asus.com>
>
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching.
>
> Hi, Krzysztof,
I use my Gmail account and respond inline.
Yes, I used `git log --oneline -- DIRECTORY_OR_FILE` and re-sent the v5
patch on February 29, 2024.
[PATCH v5 1/2] dt-bindings: arm: aspeed: add ASUS X4TF board


> Best regards,
> Krzysztof
>
>

--00000000000050e2e406148ba5a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Krz=
ysztof Kozlowski &lt;<a href=3D"mailto:krzysztof.kozlowski@linaro.org">krzy=
sztof.kozlowski@linaro.org</a>&gt; =E6=96=BC 2024=E5=B9=B41=E6=9C=8830=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:35=E5=AF=AB=E9=81=93=EF=BC=9A=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 30/01/2024 0=
9:56, Kelly Hung wrote:<br>
&gt; This initial device-tree provides the necessary configuration for<br>
&gt; basic BMC functionality and work on ASUS X4TF production.<br>
&gt; <br>
&gt; Signed-off-by: Kelly Hung &lt;<a href=3D"mailto:Kelly_Hung@asus.com" t=
arget=3D"_blank">Kelly_Hung@asus.com</a>&gt;<br>
<br>
Please use subject prefixes matching the subsystem. You can get them for<br=
>
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory<br>
your patch is touching.<br>
<br></blockquote><div>Hi, Krzysztof,</div><div>I use my Gmail account and r=
espond inline.</div><div>Yes, I used `git log --oneline -- DIRECTORY_OR_FIL=
E` and re-sent the v5 patch on February 29, 2024.</div><div>[PATCH v5 1/2] =
dt-bindings: arm: aspeed: add ASUS X4TF board<br></div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
Best regards,<br>
Krzysztof<br>
<br>
</blockquote></div></div></div></div>

--00000000000050e2e406148ba5a1--
