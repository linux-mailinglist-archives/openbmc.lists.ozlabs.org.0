Return-Path: <openbmc+bounces-462-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B45B27D95
	for <lists+openbmc@lfdr.de>; Fri, 15 Aug 2025 11:55:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c3HXv3lc8z3cdB;
	Fri, 15 Aug 2025 19:55:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b29"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755251727;
	cv=none; b=BBmxS5qn5mWzTe26u7RLqMfQVQ6MFqoVV5C69QIQWY8WsA6ZA2nEa25WuBRQAPj1OID8/az8Fd8m43O8aqjluUd3ESQnaPvlQQ/zx6ANKEWSh+WmxmEfYPd8T0IulcHFByzZHVwJwxqBNGcwPWZvd6exlyMN2yVDU6mS+Z05mjASmwMiGvnJ0HYIUBN0JplefajIAynoKt99YVOX3Za36WORdcYTlf3Bul4T+FJR0iT9aRxUPYZIjCmB25JBzFbYeOwkHl+UnvaHADOFlYDohxrfaINeYA/te9/E+dlTqgRW9NJ9+AxbWHU5GM5cepPAJCZ4CGw1LTiUvpOiDP/sxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755251727; c=relaxed/relaxed;
	bh=EfQCkQsdK5+/K7mx1/W+erXQ0aj6ZtdeJraRFtOPx1I=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=GMSbMlo9X8OXUbIVQ4zB3wPy/PaXWqlLVzr9lV2CaKe0JyvuOQczcGHWKzDO0xymgnk8NQ/OXt5V3sLwcMdG0CpsHpTImXAhtrhofyJrfBJs+5QqaUpQzWH8WHXIE3ZQjXw45i7z/RDOO0LZXdNtESMmQ8Y3KXcXfoFZmGTESRcOgylc+o5gSlixkBPN9/XxNYGIXixizAqolyb7K88aGtpQGSoAwe6fnSU2Kg7Qo6tCvCresWSbqfBy/h44BwbBWxDpOlyrUOF/TJr5byjy5q6Gi/yl3/ap4VFWmYrl4pjvpJH5121rY9aZ0dfn67CDvY8SVi0mgr6nWdOXSQhIQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nkqBRmoT; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com; envelope-from=rushtotom@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nkqBRmoT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com; envelope-from=rushtotom@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c3HXt13TWz3ccV
	for <openbmc@lists.ozlabs.org>; Fri, 15 Aug 2025 19:55:25 +1000 (AEST)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e933a69651dso40294276.1
        for <openbmc@lists.ozlabs.org>; Fri, 15 Aug 2025 02:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755251723; x=1755856523; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EfQCkQsdK5+/K7mx1/W+erXQ0aj6ZtdeJraRFtOPx1I=;
        b=nkqBRmoTscCbCz8kLv6Ljpak7rQKGHjKvbXwZxAvmZpP0WgcsKLM2gJm2/29GBeYYC
         I9+SHfe6nlRWRf+Lcy8oUAB9yUXYu1Qyh+gcmrmNmb40d9eD56eSh1OqNalJEPpolsjM
         Oc5ePYBlHohLQFtLfj2kwI02spr9piaU+Ow779sGbipVdr/GxkMYhlwP+H7AEtNd4FDc
         TTs/aYSfJu0xDdpMoYilLJUnI5dZ/RLgIerMiJ5gTdUfDtocHcZy3AHzRmzRgTAQDnWe
         rTAbmka8ggnVcbTLhjkKvLGZxUnJfdYwzMQ5XQXJSST1VHl72jTirxQ3stf+uvAZ3huU
         75sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755251723; x=1755856523;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EfQCkQsdK5+/K7mx1/W+erXQ0aj6ZtdeJraRFtOPx1I=;
        b=aUQ0xfh85DLGBNrxXa91noDWDYQAX1ubpFNIczyUIMB7l0fZ0Dun5zx4WRv4RTR2Ct
         XkCa9UcQP9O/SRrSbeCWwhRVvOdu/T9xqVtPYah56dt89c54L+IC86eaPoOoAMQZ3Bx3
         v2J+RTmR88l6MUNt09Cf5262fMuiKPWRIQ2ptheWDUNypXMIjanQcorOecsheCP/ongs
         1K8jMCZcGgM16yBYuzW+ZDUyscfQQME1D+jHOo7/oSdqUsvV8CWHBSE+GTrASphK6UUo
         JQNBMuNYckjR9Iya3hbm1wywYZrc+MdsGKGrKizp7SWiKyCPL4JJzlJq2fT4w8RZhfsJ
         Jajg==
X-Gm-Message-State: AOJu0YxVP2InlmllVDTz9XdrrhFECCF6kFJ8SU0gsItEudmUwm0R63hl
	Tn57eSu/Gik7Pqr/lK7WIAiPLCV4XSbJ0tpYmnEq8mzJn6/VXf/DDgu4oaRXXIW5imqwbGntiJs
	WhLRndhQBcl4yC/pCn5Fc44OUxWU8FDf+hvkl
X-Gm-Gg: ASbGncsP1qyIehSFRam+V9GFISK2s8J1LaQIv/uF54DeoQ0D6Wv2g9bLIeFBLWYw+kI
	sBhFM+UyNSLbOZmZzkP8X7Tbz/GRkM7GIblxjBL5NlTO+LngFX1wYBk4Cq7jPKTWB6YMrn5Kt11
	wvP+kL12n2gIF3p/5+BOjm2g5SyIPRy2wBd0euusXqg4PNG7U6VzxFNbzF1B4L6LdyOtJCFw0v5
	j5+og==
X-Google-Smtp-Source: AGHT+IEf3AJkAQIsHa/II+flQfPh+mKfZGEEeODVhCK7UztWh1u8/Xeh6nbkOOglZTVAgL/u5xtU08LEhcW21Rc2TJc=
X-Received: by 2002:a05:690c:6c10:b0:718:3d24:dbce with SMTP id
 00721157ae682-71e6de2ab06mr14650097b3.30.1755251722653; Fri, 15 Aug 2025
 02:55:22 -0700 (PDT)
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
Date: Fri, 15 Aug 2025 15:25:11 +0530
X-Gm-Features: Ac12FXx-Js0ewlmiUrKySTwK3guODxgJNOOASYL2D1nhXPPgb7xmWlK5AiOh3BQ
Message-ID: <CADCscQkZ9ubmHsY8kDOr=S+u4NGoxT8NAkhDGOFhLQXZPLfLfA@mail.gmail.com>
Subject: Firmware Recovery Protocols
To: OpenBMC List <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000006b94dd063c64634b"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--0000000000006b94dd063c64634b
Content-Type: text/plain; charset="UTF-8"

Hello all,

Devices such as GPUs, CPUs, and  NICs support firmware update using
standard protocols like MCTP and PLDM T5. They also support recovery
protocols, providing out-of-band mechanisms to detect when a device enters
a fault state where firmware update is not possible and to securely restore
it to a known good condition.

The Open Compute Project (OCP) offers a secure firmware protocol [1] to
determine if a device is in recovery mode and to facilitate recovery
through the transfer of recovery images, typically over SMBus. Firmware
recovery generally follows a two-stage process: OCP recovery is first used
to deliver the Stage 1 (initial) firmware to the device, which then enables
further updates through MCTP/PLDM T5. Stage 2 involves transferring
complete device firmware using MCTP/PLDM T5, which is already supported by
the OpenBMC stack. There are also similar custom protocols for device
recovery, some of which support two stage updates while others recover with
a single-stage update.

To bring these capabilities into the OpenBMC ecosystem, the proposal is to
leverage the standard Redfish API for code updates and utilize PLDM
packaging for recovery images. Recovery protocols like OCP would be
implemented as Non-PLDM code updaters, which handle the specific recovery
protocol and parse PLDM packages to extract the appropriate recovery images
for each device. This approach builds on the current efforts to update
non-PLDM devices, such as VRs and CPLDs, with PLDM image packaging.

I welcome feedback from the community on the approach and invite any
alternative suggestions.

[1]
https://www.opencompute.org/documents/ocp-recovery-document-1p0-final-1-pdf
[2] https://gerrit.openbmc.org/c/openbmc/docs/+/76645
Regards,
Tom

--0000000000006b94dd063c64634b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span style=3D"font-family:arial,sans-serif;letter-sp=
acing:0.08px">Hello all,</span></div><div><p class=3D"gmail-my-2 gmail-[&am=
p;+p]:mt-4 gmail-[&amp;_strong:has(+br)]:inline-block gmail-[&amp;_strong:h=
as(+br)]:pb-2" style=3D"box-sizing:border-box;border-width:0px;border-style=
:solid;margin:1rem 0px 0.5rem;letter-spacing:0.08px"><font face=3D"arial, s=
ans-serif">Devices such as GPUs, CPUs, and=C2=A0 NICs support firmware upda=
te using standard protocols like MCTP and PLDM T5. They also support recove=
ry protocols, providing out-of-band mechanisms to detect when a device ente=
rs a fault state where firmware update is not possible and to securely rest=
ore it to a known good condition.</font></p><p class=3D"gmail-my-2 gmail-[&=
amp;+p]:mt-4 gmail-[&amp;_strong:has(+br)]:inline-block gmail-[&amp;_strong=
:has(+br)]:pb-2" style=3D"box-sizing:border-box;border-width:0px;border-sty=
le:solid;margin:1rem 0px 0.5rem;letter-spacing:0.08px"><font face=3D"arial,=
 sans-serif">The Open Compute Project (OCP) offers a secure firmware protoc=
ol [1] to determine if a device is in recovery mode and to facilitate recov=
ery through the transfer of recovery images, typically over SMBus. Firmware=
 recovery generally follows a two-stage process: OCP recovery is first used=
 to deliver the Stage 1 (initial) firmware to the device, which then enable=
s further updates through MCTP/PLDM T5. Stage 2 involves transferring compl=
ete device firmware using MCTP/PLDM T5, which is already supported by the O=
penBMC stack. There are also similar custom protocols for device recovery, =
some of which support two stage updates while others=C2=A0recover with a si=
ngle-stage update.=C2=A0</font></p><p class=3D"gmail-my-2 gmail-[&amp;+p]:m=
t-4 gmail-[&amp;_strong:has(+br)]:inline-block gmail-[&amp;_strong:has(+br)=
]:pb-2" style=3D"box-sizing:border-box;border-width:0px;border-style:solid;=
margin:1rem 0px 0.5rem;letter-spacing:0.08px"><font face=3D"arial, sans-ser=
if">To bring these capabilities into the OpenBMC ecosystem, the proposal is=
 to leverage the standard Redfish API for code updates and utilize PLDM pac=
kaging for recovery images. Recovery protocols like OCP would be implemente=
d as Non-PLDM code updaters, which handle the specific recovery protocol an=
d parse PLDM packages to extract the appropriate recovery images for each d=
evice. This approach builds on the current efforts to update non-PLDM devic=
es, such as VRs and CPLDs, with PLDM image packaging.</font></p><p class=3D=
"gmail-my-2 gmail-[&amp;+p]:mt-4 gmail-[&amp;_strong:has(+br)]:inline-block=
 gmail-[&amp;_strong:has(+br)]:pb-2" style=3D"box-sizing:border-box;border-=
width:0px;border-style:solid;margin:1rem 0px 0.5rem;letter-spacing:0.08px">=
<font face=3D"arial, sans-serif" style=3D"">I welcome feedback from the com=
munity on the approach and invite any alternative suggestions.</font></p><p=
 class=3D"gmail-my-2 gmail-[&amp;+p]:mt-4 gmail-[&amp;_strong:has(+br)]:inl=
ine-block gmail-[&amp;_strong:has(+br)]:pb-2" style=3D"box-sizing:border-bo=
x;border-width:0px;border-style:solid;margin:1rem 0px 0.5rem;letter-spacing=
:0.08px"><font face=3D"arial, sans-serif">[1]=C2=A0<a rel=3D"nofollow noope=
ner" class=3D"gmail-break-word gmail-hover:text-super gmail-hover:decoratio=
n-super gmail-underline gmail-decoration-from-font gmail-underline-offset-1=
 gmail-transition-all gmail-duration-300" target=3D"_blank" href=3D"https:/=
/www.opencompute.org/documents/ocp-recovery-document-1p0-final-1-pdf" style=
=3D"box-sizing:border-box;border-width:0px;border-style:solid">https://www.=
opencompute.org/documents/ocp-recovery-document-1p0-final-1-pdf</a><br styl=
e=3D"box-sizing:border-box;border-width:0px;border-style:solid">[2]=C2=A0<a=
 rel=3D"nofollow noopener" class=3D"gmail-break-word gmail-hover:text-super=
 gmail-hover:decoration-super gmail-underline gmail-decoration-from-font gm=
ail-underline-offset-1 gmail-transition-all gmail-duration-300" target=3D"_=
blank" href=3D"https://gerrit.openbmc.org/c/openbmc/docs/+/76645" style=3D"=
box-sizing:border-box;border-width:0px;border-style:solid">https://gerrit.o=
penbmc.org/c/openbmc/docs/+/76645</a></font></p></div><div>Regards,</div><d=
iv>Tom</div></div>

--0000000000006b94dd063c64634b--

