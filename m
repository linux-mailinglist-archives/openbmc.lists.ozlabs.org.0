Return-Path: <openbmc+bounces-463-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80605B27FCC
	for <lists+openbmc@lfdr.de>; Fri, 15 Aug 2025 14:14:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c3Ldm3c9Bz3cb2;
	Fri, 15 Aug 2025 22:14:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1131"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755260092;
	cv=none; b=ayyGdhJij1OTvO09dx1joQh4lQmapXRH1SF7Vk7TWg9OwglMmPbeLyRwEnC46whmjk5LCS8zPf953uOJ2vNW4Zrxdg7kPdz5g6xCylYGi7tSD0AIR1HY/NAuO06o49MD23f1WpvGxlUZUnLesw2jqv822IWWapPWLfBOOXpcYQV/ZuRA2FtCrmL0wNxVSqmYGcOQMhCeAEw8ZDMg2giK8CYu3gA7l++Y7A6nFTu4dGb6HM25NO5OwuSoBvUl7DE9bcvY+aup5z4MVfiX4Xe6no2771H4FogKI24OiB46V33uWFX5vJV1nbcINWq+sBZvJqzgu6JCHUAxwUuhcec49g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755260092; c=relaxed/relaxed;
	bh=iKIoc7ZPnJB+SgrkiphC/iHPXPddS+9yxft3WsWj4P8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=irlh/kzM4rnpe4RkJjyoLmdzkFhKXNCjYdWd6AqxvGGqsG0KZjmKGE7c6CiZgjuFHL1dSGSb0Rb0clwimOJ6FsJ7inzlL1gFyDeykEaH7483+kGzEhAYqpD/vo7gq+hS82lFRHltPgq3U3CFPpHlsAq+E2zQm1CjJGM9YfnaUrKqL9x9rE5eFupjF2Ab0EfQQT94y5vy999WW4QPbL9/POrSuZQTtqV7rZlFl3z2RPXssZ+kLj4xD4H8zfAmhfnqnv83v4zk0nnx46juq33KUqhILJPpQl1x5opYLl5M9v860F0Bj+9z4/Q7+RBZu2maB/HpkE3I6ggh2qwBYG8dHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YGIlKV03; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1131; helo=mail-yw1-x1131.google.com; envelope-from=rushtotom@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YGIlKV03;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1131; helo=mail-yw1-x1131.google.com; envelope-from=rushtotom@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c3Ldk5Tp9z3cZs
	for <openbmc@lists.ozlabs.org>; Fri, 15 Aug 2025 22:14:49 +1000 (AEST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-71d60501806so16847497b3.2
        for <openbmc@lists.ozlabs.org>; Fri, 15 Aug 2025 05:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755260087; x=1755864887; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iKIoc7ZPnJB+SgrkiphC/iHPXPddS+9yxft3WsWj4P8=;
        b=YGIlKV03h7XMU4CusafO7TY20wQny3v+xxW+RJO3d3i/TdibTjP0mw6vn1CAPzFVlC
         1XDZaTMYnX9A8Zamj967oNAeAPXefhbEkHP0ymHIIbF/QR11UiXFYtgopW64TIUFLFSQ
         yeSFqqt6ZN8HXQgFb5FV0oitUgMSmZsK+92uFqaGQV8/a0+ZHwN7tPn/V5qyonfHtQ0m
         fXdEsbbQjEi4chxjN4dDyd3J4YNglEnN9ZzcyGrCgcZurYbc2hv5q8ls7kfnzJ0pU+xx
         PPVAOHCAvQmCqyjNiJ85s9VySEWD2NaX9yAPSEr2sL7bIbK42HJJZg7fzqKd8wdV3dyk
         0Dug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755260087; x=1755864887;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iKIoc7ZPnJB+SgrkiphC/iHPXPddS+9yxft3WsWj4P8=;
        b=cF9wPwGMkOlGCNg8kuB5R1NwYZ6yYZgn1hRAYHEr3ZaE73sc+ZycsqeKw+B6Q9q6HF
         X+CkgnVlP5H2CluXRmiyR1go7KLaZpHYMA19FOYogZRmDYV1beGuOYLRbz9z7Tb/nWXc
         wu02+/bOEcHZz8FkE7tIaX6h1HChAs4ZK2xb+8mBZiB7I5C9iE34gq9x4ZSXqewuHcTm
         0p0KK7/KnFIhz4hY7lBjU0FhHtl0Y6AwrlceETqPyaoNfqkI8yWNW7preZrNXXED2mPS
         J7IkdVBZuwZTBfZwIlA33TlF1UCru2QJJoqljNxErAQZt6rfLeG6M2PMAAEPYeQ2NdrO
         gv+w==
X-Gm-Message-State: AOJu0YwDYGTa0K0fyvUniQpfqVj8VK5MZnLvwj6sZcgT83sY2NnuNbbl
	m13woQDTUdrGDRdpYmU/e7NgAJK2GqMR+HYrKYuuwYXXx0sWgBywkdAO3aZ/5k2IBfEHzrB2B2G
	fCW5bnQMeT9VFiuolrLGjtJBE7yyY07cSO186
X-Gm-Gg: ASbGnct6itFm3VEiE7FWjGqFZ1bQROu1zN5rsZUraf7pByBz2V+RVc5ajfaRW4aBKiE
	bo5EgWN2Tu9u+Fst60YQH6zGiM/sTGxYKbqUteAOKSPFJgTk5FNBM/O9bMjPOqCp2Tu9TYlWK97
	EKEDmunGxy6rS5d1NGqO5Z/wLlow1GYjLW3DZZbvxKL9kGp4frDbP8TvIbfRszv8Z8NjZiuTyJ1
	yXvflETjx8EiN0W
X-Google-Smtp-Source: AGHT+IHYpj6ApsHySIlWC8qnBZIkc/oSDlV7KWKPVp/pfiPW1UUJvC9xYbZMkZaS2R0x4eNpMpIJT9XAX5F4zyluWeU=
X-Received: by 2002:a05:690c:e18:b0:71c:bf3:afa8 with SMTP id
 00721157ae682-71e6da3ca91mr20166677b3.12.1755260086134; Fri, 15 Aug 2025
 05:14:46 -0700 (PDT)
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
From: Tom Joseph <rushtotom@gmail.com>
Date: Fri, 15 Aug 2025 17:44:35 +0530
X-Gm-Features: Ac12FXxq_fyPczIbxDt6MUmoxcbDGG8r1h3WdCaShy4QjyDsHB3WnUqVZT-Zq-4
Message-ID: <CADCscQ=9xHFPfoS9BY5Nuib36nQvfcC_jwhmcPRyibgw4_ObXA@mail.gmail.com>
Subject: Modifications in PLDM T5 flow to support SPI staged update
To: OpenBMC List <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000ec6312063c66553b"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--000000000000ec6312063c66553b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello All,

SPI Staged Update enables pre-downloading firmware component images for
supported devices, significantly reducing downtime during firmware updates
and activation. This requires devices to support at least two slots =E2=80=
=94 one
for the running firmware and another for staging the new image.

The update process occurs in two iterations:

   1.

   First Iteration:
   -

      The PLDM UA initiates the PLDM T5 flow with the PLDM FD supporting
      staged updates.
      -

      All stages (Transfer, Verify, Apply) are completed except activation.
      This is achieved by PLDM UA skipping the PLDM T5 ActivateFirmware
       command.
      -

      Upon state machine timeout, the PLDM FD marks the new image as
      *staged* (not failed update). Since it=E2=80=99s staged, it remains i=
nactive
      until explicitly activated later.
      2.

   Second Iteration:
   -

      The same PLDM package is used. Since the image is already staged, the
      PLDM FD skips most of the Transfer stage, reducing downtime.
      -

      This iteration is typically scheduled during a maintenance window.
      -

      Devices that do not support SPI staging are updated in this iteration=
.
      -

      All firmware is activated after this iteration.

To enable this, we propose introducing a new OEM parameter in the MultiPart
API to instruct the PLDM UA to skip sending the ActivateFirmwarecommand,
along with necessary PLDM UA modifications to support the SPI staged flow.

If there is interest within the OpenBMC community to adopt and collaborate
on this feature, please feel free to reach out.

[1]
https://docs.nvidia.com/multi-node-nvlink-systems/nvfupd-guide/appendix/spi=
-staged.html

Regards,
Tom

--000000000000ec6312063c66553b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><p class=3D"gmail-my-2 gmail-[&amp;+=
p]:mt-4 gmail-[&amp;_strong:has(+br)]:inline-block gmail-[&amp;_strong:has(=
+br)]:pb-2" style=3D"box-sizing:border-box;border-width:0px;border-style:so=
lid;margin:1rem 0px 0.5rem;letter-spacing:0.08px"><font face=3D"arial, sans=
-serif">Hello All,</font></p><p class=3D"gmail-my-2 gmail-[&amp;+p]:mt-4 gm=
ail-[&amp;_strong:has(+br)]:inline-block gmail-[&amp;_strong:has(+br)]:pb-2=
" style=3D"box-sizing:border-box;border-width:0px;border-style:solid;margin=
:1rem 0px 0.5rem;letter-spacing:0.08px"><font face=3D"arial, sans-serif">SP=
I Staged Update enables pre-downloading firmware component images for suppo=
rted devices, significantly reducing downtime during firmware updates and a=
ctivation. This requires devices to support at least two slots =E2=80=94 on=
e for the running firmware and another for staging the new image.</font></p=
><p class=3D"gmail-my-2 gmail-[&amp;+p]:mt-4 gmail-[&amp;_strong:has(+br)]:=
inline-block gmail-[&amp;_strong:has(+br)]:pb-2" style=3D"box-sizing:border=
-box;border-width:0px;border-style:solid;margin:1rem 0px 0.5rem;letter-spac=
ing:0.08px"><font face=3D"arial, sans-serif">The update process occurs in=
=C2=A0<span style=3D"box-sizing:border-box;border-width:0px;border-style:so=
lid">two iterations</span>:</font></p><ol class=3D"gmail-marker:text-quiet =
gmail-list-decimal" style=3D"box-sizing:border-box;border-width:0px;border-=
style:solid;list-style-position:initial;margin:0px;padding:0px;letter-spaci=
ng:0.08px"><li class=3D"gmail-py-0 gmail-my-0 gmail-prose-p:pt-0 gmail-pros=
e-p:mb-2 gmail-prose-p:my-0 gmail-[&amp;&gt;p]:pt-0 gmail-[&amp;&gt;p]:mb-2=
 gmail-[&amp;&gt;p]:my-0" style=3D"box-sizing:border-box;border-width:0px;b=
order-style:solid;margin-top:0px;margin-bottom:0px;padding-top:0px;padding-=
bottom:0px"><p class=3D"gmail-my-2 gmail-[&amp;+p]:mt-4 gmail-[&amp;_strong=
:has(+br)]:inline-block gmail-[&amp;_strong:has(+br)]:pb-2" style=3D"box-si=
zing:border-box;border-width:0px;border-style:solid;margin:0px 0px 0.5rem;p=
adding-top:0px"><span style=3D"box-sizing:border-box;border-width:0px;borde=
r-style:solid"><font face=3D"arial, sans-serif">First Iteration:</font></sp=
an></p><ul class=3D"gmail-marker:text-quiet gmail-list-disc" style=3D"box-s=
izing:border-box;border-width:0px;border-style:solid;list-style:disc;margin=
:0.75em 0px;padding:0px"><li class=3D"gmail-py-0 gmail-my-0 gmail-prose-p:p=
t-0 gmail-prose-p:mb-2 gmail-prose-p:my-0 gmail-[&amp;&gt;p]:pt-0 gmail-[&a=
mp;&gt;p]:mb-2 gmail-[&amp;&gt;p]:my-0" style=3D"box-sizing:border-box;bord=
er-width:0px;border-style:solid;margin-top:0px;margin-bottom:0px;padding-to=
p:0px;padding-bottom:0px"><p class=3D"gmail-my-2 gmail-[&amp;+p]:mt-4 gmail=
-[&amp;_strong:has(+br)]:inline-block gmail-[&amp;_strong:has(+br)]:pb-2" s=
tyle=3D"box-sizing:border-box;border-width:0px;border-style:solid;margin:0p=
x 0px 0.5rem;padding-top:0px"><font face=3D"arial, sans-serif">The PLDM UA =
initiates the PLDM T5 flow with the PLDM FD supporting staged updates.</fon=
t></p></li><li class=3D"gmail-py-0 gmail-my-0 gmail-prose-p:pt-0 gmail-pros=
e-p:mb-2 gmail-prose-p:my-0 gmail-[&amp;&gt;p]:pt-0 gmail-[&amp;&gt;p]:mb-2=
 gmail-[&amp;&gt;p]:my-0" style=3D"box-sizing:border-box;border-width:0px;b=
order-style:solid;margin-top:0px;margin-bottom:0px;padding-top:0px;padding-=
bottom:0px"><p class=3D"gmail-my-2 gmail-[&amp;+p]:mt-4 gmail-[&amp;_strong=
:has(+br)]:inline-block gmail-[&amp;_strong:has(+br)]:pb-2" style=3D"box-si=
zing:border-box;border-width:0px;border-style:solid;margin:0px 0px 0.5rem;p=
adding-top:0px"><font face=3D"arial, sans-serif">All stages (Transfer, Veri=
fy, Apply) are completed=C2=A0<span style=3D"box-sizing:border-box;border-w=
idth:0px;border-style:solid">except</span>=C2=A0activation. This is achieve=
d by PLDM UA skipping the PLDM T5=C2=A0<span style=3D"font-family:monospace=
;letter-spacing:0.08px">ActivateFirmware</span>=C2=A0command.</font></p></l=
i><li class=3D"gmail-py-0 gmail-my-0 gmail-prose-p:pt-0 gmail-prose-p:mb-2 =
gmail-prose-p:my-0 gmail-[&amp;&gt;p]:pt-0 gmail-[&amp;&gt;p]:mb-2 gmail-[&=
amp;&gt;p]:my-0" style=3D"box-sizing:border-box;border-width:0px;border-sty=
le:solid;margin-top:0px;margin-bottom:0px;padding-top:0px;padding-bottom:0p=
x"><p class=3D"gmail-my-2 gmail-[&amp;+p]:mt-4 gmail-[&amp;_strong:has(+br)=
]:inline-block gmail-[&amp;_strong:has(+br)]:pb-2" style=3D"box-sizing:bord=
er-box;border-width:0px;border-style:solid;margin:0px 0px 0.5rem;padding-to=
p:0px"><font face=3D"arial, sans-serif">Upon state machine timeout, the PLD=
M FD marks the new image as=C2=A0<em style=3D"box-sizing:border-box;border-=
width:0px;border-style:solid">staged</em>=C2=A0(not failed update). Since i=
t=E2=80=99s staged, it remains inactive until explicitly activated later.</=
font></p></li></ul></li><li class=3D"gmail-py-0 gmail-my-0 gmail-prose-p:pt=
-0 gmail-prose-p:mb-2 gmail-prose-p:my-0 gmail-[&amp;&gt;p]:pt-0 gmail-[&am=
p;&gt;p]:mb-2 gmail-[&amp;&gt;p]:my-0" style=3D"box-sizing:border-box;borde=
r-width:0px;border-style:solid;margin-top:0px;margin-bottom:0px;padding-top=
:0px;padding-bottom:0px"><p class=3D"gmail-my-2 gmail-[&amp;+p]:mt-4 gmail-=
[&amp;_strong:has(+br)]:inline-block gmail-[&amp;_strong:has(+br)]:pb-2" st=
yle=3D"box-sizing:border-box;border-width:0px;border-style:solid;margin:0px=
 0px 0.5rem;padding-top:0px"><span style=3D"box-sizing:border-box;border-wi=
dth:0px;border-style:solid"><font face=3D"arial, sans-serif">Second Iterati=
on:</font></span></p><ul class=3D"gmail-marker:text-quiet gmail-list-disc" =
style=3D"box-sizing:border-box;border-width:0px;border-style:solid;list-sty=
le:disc;margin:0.75em 0px;padding:0px"><li class=3D"gmail-py-0 gmail-my-0 g=
mail-prose-p:pt-0 gmail-prose-p:mb-2 gmail-prose-p:my-0 gmail-[&amp;&gt;p]:=
pt-0 gmail-[&amp;&gt;p]:mb-2 gmail-[&amp;&gt;p]:my-0" style=3D"box-sizing:b=
order-box;border-width:0px;border-style:solid;margin-top:0px;margin-bottom:=
0px;padding-top:0px;padding-bottom:0px"><p class=3D"gmail-my-2 gmail-[&amp;=
+p]:mt-4 gmail-[&amp;_strong:has(+br)]:inline-block gmail-[&amp;_strong:has=
(+br)]:pb-2" style=3D"box-sizing:border-box;border-width:0px;border-style:s=
olid;margin:0px 0px 0.5rem;padding-top:0px"><font face=3D"arial, sans-serif=
">The same PLDM package is used. Since the image is already staged, the PLD=
M FD skips most of the Transfer stage, reducing downtime.</font></p></li><l=
i class=3D"gmail-py-0 gmail-my-0 gmail-prose-p:pt-0 gmail-prose-p:mb-2 gmai=
l-prose-p:my-0 gmail-[&amp;&gt;p]:pt-0 gmail-[&amp;&gt;p]:mb-2 gmail-[&amp;=
&gt;p]:my-0" style=3D"box-sizing:border-box;border-width:0px;border-style:s=
olid;margin-top:0px;margin-bottom:0px;padding-top:0px;padding-bottom:0px"><=
p class=3D"gmail-my-2 gmail-[&amp;+p]:mt-4 gmail-[&amp;_strong:has(+br)]:in=
line-block gmail-[&amp;_strong:has(+br)]:pb-2" style=3D"box-sizing:border-b=
ox;border-width:0px;border-style:solid;margin:0px 0px 0.5rem;padding-top:0p=
x"><font face=3D"arial, sans-serif">This iteration is typically scheduled d=
uring a maintenance window.</font></p></li><li class=3D"gmail-py-0 gmail-my=
-0 gmail-prose-p:pt-0 gmail-prose-p:mb-2 gmail-prose-p:my-0 gmail-[&amp;&gt=
;p]:pt-0 gmail-[&amp;&gt;p]:mb-2 gmail-[&amp;&gt;p]:my-0" style=3D"box-sizi=
ng:border-box;border-width:0px;border-style:solid;margin-top:0px;margin-bot=
tom:0px;padding-top:0px;padding-bottom:0px"><p class=3D"gmail-my-2 gmail-[&=
amp;+p]:mt-4 gmail-[&amp;_strong:has(+br)]:inline-block gmail-[&amp;_strong=
:has(+br)]:pb-2" style=3D"box-sizing:border-box;border-width:0px;border-sty=
le:solid;margin:0px 0px 0.5rem;padding-top:0px"><font face=3D"arial, sans-s=
erif">Devices that do not support SPI staging are updated in this iteration=
.</font></p></li><li class=3D"gmail-py-0 gmail-my-0 gmail-prose-p:pt-0 gmai=
l-prose-p:mb-2 gmail-prose-p:my-0 gmail-[&amp;&gt;p]:pt-0 gmail-[&amp;&gt;p=
]:mb-2 gmail-[&amp;&gt;p]:my-0" style=3D"box-sizing:border-box;border-width=
:0px;border-style:solid;margin-top:0px;margin-bottom:0px;padding-top:0px;pa=
dding-bottom:0px"><p class=3D"gmail-my-2 gmail-[&amp;+p]:mt-4 gmail-[&amp;_=
strong:has(+br)]:inline-block gmail-[&amp;_strong:has(+br)]:pb-2" style=3D"=
box-sizing:border-box;border-width:0px;border-style:solid;margin:0px 0px 0.=
5rem;padding-top:0px"><font face=3D"arial, sans-serif">All firmware is acti=
vated after this iteration.</font></p></li></ul></li></ol><p class=3D"gmail=
-my-2 gmail-[&amp;+p]:mt-4 gmail-[&amp;_strong:has(+br)]:inline-block gmail=
-[&amp;_strong:has(+br)]:pb-2" style=3D"box-sizing:border-box;border-width:=
0px;border-style:solid;margin:0.5rem 0px;letter-spacing:0.08px"><font face=
=3D"arial, sans-serif">To enable this, we propose introducing a=C2=A0<span =
style=3D"box-sizing:border-box;border-width:0px;border-style:solid">new OEM=
 parameter</span>=C2=A0in the MultiPart API to instruct the PLDM UA to skip=
 sending the=C2=A0<code style=3D"box-sizing:border-box;border-width:0px;bor=
der-style:solid;font-feature-settings:normal;background-color:rgba(0,0,0,0)=
;border-radius:0.3125rem;padding:0px 4px;font-synthesis:none">ActivateFirmw=
are</code>command, along with necessary PLDM UA modifications to support th=
e SPI staged flow.</font></p><p class=3D"gmail-my-2 gmail-[&amp;+p]:mt-4 gm=
ail-[&amp;_strong:has(+br)]:inline-block gmail-[&amp;_strong:has(+br)]:pb-2=
" style=3D"box-sizing:border-box;border-width:0px;border-style:solid;margin=
:1rem 0px 0.5rem;letter-spacing:0.08px"><font face=3D"arial, sans-serif" st=
yle=3D"">If there is interest within the OpenBMC community to adopt and col=
laborate on this feature, please feel free to reach out.<br><br></font></p>=
</div><div><font face=3D"arial, sans-serif"><span style=3D"color:rgb(26,26,=
26)">[1]=C2=A0</span><a href=3D"https://docs.nvidia.com/multi-node-nvlink-s=
ystems/nvfupd-guide/appendix/spi-staged.html">https://docs.nvidia.com/multi=
-node-nvlink-systems/nvfupd-guide/appendix/spi-staged.html</a></font></div>=
<div><br></div><div>Regards,</div><div>Tom</div></div>
</div>

--000000000000ec6312063c66553b--

