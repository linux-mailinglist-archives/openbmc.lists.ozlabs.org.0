Return-Path: <openbmc+bounces-887-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B577C58364
	for <lists+openbmc@lfdr.de>; Thu, 13 Nov 2025 16:07:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d6kCZ4bf0z2yvJ;
	Fri, 14 Nov 2025 02:07:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::112a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763046458;
	cv=none; b=Fl99hYFb4xNcA3qVS1xlJ5Y6A2GwSR1Zsnyz8B81xOyGmfnvVjo6KYjTyKnEbfyMwqGJZKxgX9Yn+k2YCX70gZaL5fZ5hpliIl7xHRzmSqvt5GrF/T1lAdVh2A6ReD5QBAM7YmVt6mtgp8x719g43twJ9Qci2NkP7Hy2eIGy+3Y91VygTFhHTf4WHjPVb8jFnx688NK7MPke4ewVYlBjvqOMW/RWgf1TuzkpXfNi8InhAhwF/Iv+CJS5Jlaipj8nbLaoIELMsGLkvekVFTKaR0A8laHRK/panwpxKXUja5wG6R93eU6i0VIXM7qPwFzW9RtmkP/uplO3c/6LpV/Iwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763046458; c=relaxed/relaxed;
	bh=J5MS4U2yYcprjGTME9ot4Ir8o7RZ8RRSHNvnbEISjDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BB4Z3v4LgWp0RGfbufMvGpwxYqSUGuNzpu4LGMt/D8DJge/UgUPMJ9WzBYe1/b0daD1QaGa7O7fV7MQLb2Oxg9wSNmWUrUcURxp1rHSSb1YbxCGMu2xoC2Mz6PLLniMenipv0JiH6gFdTVEtoUJ3WZowO5jTeW+DcCkKq/Dhq5TN0VIOBWJUp7vA49uCaWhELRxZVM5r198pF7phpKr/K2dwLyroCGVJM/GrX4MAPZhiIydwcH5YqABR2rSGfphjoqZo1ryqYHatywJAyih+R+MnEb3CNOASdp3VNKbvzrTGRzloMNhJnm887OMrJAg3yPWfc9SBID7BiX/aDXNJ+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UnWp6bqw; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UnWp6bqw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d6kCX4lBgz2xC3
	for <openbmc@lists.ozlabs.org>; Fri, 14 Nov 2025 02:07:35 +1100 (AEDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-786572c14e3so9665897b3.2
        for <openbmc@lists.ozlabs.org>; Thu, 13 Nov 2025 07:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763046448; x=1763651248; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J5MS4U2yYcprjGTME9ot4Ir8o7RZ8RRSHNvnbEISjDE=;
        b=UnWp6bqwPLOoH5UvCHaoQtVT9pesIpGxe/pQb2/nwN2Jyg3CF3ecF4NG5HJab4YYSk
         5ZrXup17CeYI3z4noCzdu2Yy9ixPSlz1PRCox38jgpN5afz+HNSFY2cajsOSpv4++REE
         r6eE8bSyqTz0ULwmU60w3gJW+ziWHCAvru0Gm7s7UIDjwWEYdhCJ7tfr1RdtcDU152IF
         Knr0SN2S3Y33fv5n5TGQLRC+KFXb6r0U2cuPZj2xyJV2kq5+iKIh8TPbZmZhbvJuON9I
         0HtGcQCl4/CuWIb4TZln1Zh4Jyq/4HQl6IQcEgi7ZgqCvoLoopOdK1Ds93snN6PZpWTD
         nKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763046448; x=1763651248;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5MS4U2yYcprjGTME9ot4Ir8o7RZ8RRSHNvnbEISjDE=;
        b=jcNXYVEKc92ndEcgduLHeZa6Ciqw5vu7iN6dfrYRPvLYhllvsVy0qFbXe+nByr8iVi
         4W/tPGMeZnle6ODyqh5KPI+9KXXuyTBnKrJqUbH1k+SXkqbt+b/FyF1oepQ8cyE9lhg/
         kELLqP+JJ0N8XNuKA0G5xQOY37I+eatcM/+YYXT5HAIzl7tHvygUaU0yo8I0x4hLh7Ds
         8E5IpQtLb1FberDv44SjYwhu63MA+s83vjXC8CEXD3CqWxeXzLkiM9vctzuaNyNiN74p
         GyDn3PFHlZaUejSpFKEen9EbVbAoJNULpAefVm1DlfSvBGn/GtCl6892G5ahfr66QNYI
         ToDg==
X-Forwarded-Encrypted: i=1; AJvYcCWFOfbSnEq52qFs9y3xE6eHkxrEuVLOnztotRh/D6dHL49pn1VfW8GJWIK9i75KsWBdS5tZfFMq@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz35EcPIDiY94KfoNZwTIX/SzKODTvaAE3VyEvlpar9e0maSsR2
	cDFQGzvwS6EQK+U6oHyb1o1oxqGUOROmoqmR4FmQPmfLr4DZjHc56gvE14l84U+2GPZxonTsmUu
	0gVXmts39lQeRXlBnbHK3qas01nWPDaA=
X-Gm-Gg: ASbGncuA9H/WzTOBx2Qag+3rKsa+XSbeIIRe3RKRGLhTGBY3dYOnygP56sgkpC0ODLQ
	GdL3LPGSe/3iQzMkShNGHhH9vDuHRJY7uPtFR4+5ue7O/sZYwdZ415ucpaXogBt6EDqMexYWAAq
	pTpICpj+THr0HbaEY6wLsjFVIW3vcJpo6wuQBHjxPx/2Y4QaHpM+5Ws5Y2gWJ8SxlNL71NfmkN0
	YKf2wU0lu0fc3pH9lldDZE8GjFDCMEO1NU1DXNXI5jbdm4KTB8Sgn6TbFIzxg==
X-Google-Smtp-Source: AGHT+IEGFBHg/klm+EjDTvp4glKePuuTjMPP3lRm71KEb4TMRz36OjjXMjbb2VY76IOS219HEU0oM5HAsB1YRwvkna4=
X-Received: by 2002:a05:690e:4352:b0:63d:ceaa:2666 with SMTP id
 956f58d0204a3-64101b749f6mr4445022d50.63.1763046448243; Thu, 13 Nov 2025
 07:07:28 -0800 (PST)
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
References: <20251112173314.1751671-1-tmaimon77@gmail.com> <20251113-loose-seahorse-of-endeavor-5d216e@kuoka>
 <9a175890-bfb9-43d7-bf19-5e2f5ca00f41@sirena.org.uk>
In-Reply-To: <9a175890-bfb9-43d7-bf19-5e2f5ca00f41@sirena.org.uk>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 13 Nov 2025 17:07:17 +0200
X-Gm-Features: AWmQ_bmd6dBHxGqc8gym-sCvn35bKvcDHT3pamG9pd-Letg86B7M3APYpbReI8Q
Message-ID: <CAP6Zq1inZXDWb7xnZb-6XrA7fi7b8XoK8BaiX6b4PzM7jOUSxw@mail.gmail.com>
Subject: Re: [PATCH v1] spi: dt-bindings: nuvoton,npcm-fiu: Convert to DT schema
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, avifishman70@gmail.com, tali.perry1@gmail.com, 
	joel@jms.id.au, venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andrew@codeconstruct.com.au, openbmc@lists.ozlabs.org, 
	devicetree@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="0000000000004526ed06437b3db1"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--0000000000004526ed06437b3db1
Content-Type: text/plain; charset="UTF-8"

Hi,

Thanks for your comments

On Thu, 13 Nov 2025 at 13:20, Mark Brown <broonie@kernel.org> wrote:

> On Thu, Nov 13, 2025 at 09:51:47AM +0100, Krzysztof Kozlowski wrote:
>
> > Anyway, address space is rarely optional, so I have doubts you would
> > have proper justification for this change.
>
> IIRC I have seen some of the controllers with memory mapped flash
> support where the address range for the memory mapping was optional
> since it could be configured out of the IP when wiring it into the
> platform.  No idea if that's what's going on here.
>

In the NPCM FIU driver:

   - When the flash device is not memory-mapped, flash reads are performed
   using dedicated SPI flash read commands.
   - When the flash device is memory-mapped, reads are done directly
   through the memory window, with the FIU hardware automatically handling the
   necessary flash read commands in the background.

I will remove the unnecessary reg-names from npcm7xx dtsi file.

Thanks,

Tomer

--0000000000004526ed06437b3db1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,<div><br></div><div>Thanks for your co=
mments</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Thu, 13 Nov 2025 at 13:20, Mark Brown =
&lt;<a href=3D"mailto:broonie@kernel.org">broonie@kernel.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Nov 13,=
 2025 at 09:51:47AM +0100, Krzysztof Kozlowski wrote:<br>
<br>
&gt; Anyway, address space is rarely optional, so I have doubts you would<b=
r>
&gt; have proper justification for this change.<br>
<br>
IIRC I have seen some of the controllers with memory mapped flash<br>
support where the address range for the memory mapping was optional<br>
since it could be configured out of the IP when wiring it into the<br>
platform.=C2=A0 No idea if that&#39;s what&#39;s going on here.<br></blockq=
uote><div><br></div><div><div><div><p dir=3D"auto" style=3D"white-space-col=
lapse: preserve;">In the NPCM FIU driver:</p>
<ul dir=3D"auto">
<li>When the flash device is not memory-mapped, flash reads are performed u=
sing dedicated SPI flash read commands.</li>
<li>When the flash device is memory-mapped, reads are done directly through=
 the memory window, with the FIU hardware automatically handling the necess=
ary flash read commands in the background.</li>
</ul><div>I will remove the unnecessary reg-names from npcm7xx dtsi file.</=
div></div><div><br></div><div>Thanks,</div><div><br></div><div>Tomer</div><=
/div></div></div></div>

--0000000000004526ed06437b3db1--

