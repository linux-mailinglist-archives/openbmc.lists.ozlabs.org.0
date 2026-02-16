Return-Path: <openbmc+bounces-1378-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBM2Idkwk2mI2QEAu9opvQ
	(envelope-from <openbmc+bounces-1378-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Mon, 16 Feb 2026 15:59:37 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D11144EA6
	for <lists+openbmc@lfdr.de>; Mon, 16 Feb 2026 15:59:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fF5XQ0Q0Sz2xlq;
	Tue, 17 Feb 2026 01:59:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::b133" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771253974;
	cv=pass; b=MXYGdrqNocvqyEeXCs/wPMtaAwmOshqqwIbwkzKZcC7XzJXyJwinfmK8G9Gc/XIpQHYPgnCPnAR0syVGGUt0cQe/4u9jp60hpLrQRTxS716X73R0/5SFnbztePvB2Ht4Mh2/0IiuT6tGdelZJU9krCQQcB3Q0mWlNVWhkR45lGvW+jfqaQEb9oJJAiKn0GOwwlHOmYI6C/D41t7j4uAc5PzwCA6eEJXvpwGllQRZ3ZOYfr/JeS6uv6m3fhTCOi7IXtltEqBFjP1/BRwNjU/1soQtLE/gUfK/gcZdEjMImZtWUi05o2HJswzYvb0vxSMd/KChrkOusE+04VFFo8CfOg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771253974; c=relaxed/relaxed;
	bh=q2quQGOR5ITamGPdOgP1hgkc5a0zP4ikBMyBE1XRr2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VdM/xcnPOmwS4PH53FvKu6vjTfWmOWNyYRwg/BNELpEwoND1bWMnCkV6M0kMi2bYUUQw0fw54EXDuJLMCkRg4suB/aVra2ZW+0giBzoxNIHECtfmbSfY0tvmKJMVVqcIaQcKJ6dm29t27rBOxs2eUqDmRlw8SZRyIg7axfds0Ftu3szdq5SZmb9lvL1IHdFRHOaELvcC1WGH6pmAP4BVjEk2pVasdCDdMeApDY+AcMWIOpKGZ8jX+ymKI0nJi2lGxF0jQJixGdalvVYvKQOzzEXE5yY8ok/zHmSH27CGX7pnQ6xD5rFQr+qyJnc6BwVjhcLoFFA1G5JyqrD6amKZ6w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=H3/OVvwe; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b133; helo=mail-yx1-xb133.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=H3/OVvwe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b133; helo=mail-yx1-xb133.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yx1-xb133.google.com (mail-yx1-xb133.google.com [IPv6:2607:f8b0:4864:20::b133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fF5XN6mV6z2xVT
	for <openbmc@lists.ozlabs.org>; Tue, 17 Feb 2026 01:59:32 +1100 (AEDT)
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-64ad62a294bso3030439d50.1
        for <openbmc@lists.ozlabs.org>; Mon, 16 Feb 2026 06:59:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771253970; cv=none;
        d=google.com; s=arc-20240605;
        b=Eki2oqI//5YEI8V6kxd9dT95SiKhROUPlvE+hKp2XQyab9uR5sB7x19+1PCzsOoDVH
         TdPn6bcwo36yOAzjKgG+1EinhwLFTCVypPcRnwZEtfUn9oLqsKmyZNpM5vVGKLvNydGl
         P16L6O8TeU3Fywokg4TeBB+LJ+6s2YhzmQn7dY+euawk2bwSkox0t+mvM+xbDFCymsX3
         CHV3ZlyRfAKGuuAlqUEh+tqdNG1DXcaeJBcLM8+mehnA9T/hhtcStCLIbk1RhdHBNpFl
         L27mGX8lCw5XFmb/19AZ3P8dWK20loe5a1p2paBML1la9yjcj4XdUTO94ZsKdtuexZWX
         oAsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=q2quQGOR5ITamGPdOgP1hgkc5a0zP4ikBMyBE1XRr2E=;
        fh=bpzt7BjR6276IGDYevdU5cm6r+H4R/jSsEZy+4JyDzk=;
        b=Y+zWmBDs0IiXRP8Co6Zp2IVOuVtBKtjWT3mrmI0Ek6cnHnfTxW/eh7nOic7LLgYOKM
         aSt99qa0HCPivsmYr7H5S4dcImhFbJb8W7D1F46XI6Rb5/SZUdEn6w8YPP6iBTvGpy95
         RI/174JdTtyBz3U7HTx5xgXbSAPKOROl/5hQTQmPKq6wC6ykAfBfIQEGczZ5wrgPPOzb
         0WvrV126xqjydTWjcQAUYk742f8R8JmjkyEujKGFHyRhvq62UHJk3LotaQwYktVcVt0z
         3vRfdm9onrZ/6Mxqpb1DBiuUrtHrH7sa2fhtrSqwK7D2TpiztIyqcFkyJ1ZiLdEreImV
         WM3w==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771253970; x=1771858770; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q2quQGOR5ITamGPdOgP1hgkc5a0zP4ikBMyBE1XRr2E=;
        b=H3/OVvweComrW16YXRZQQB4ptWYsNOCdYnqMwrOlpfPyXJthl73PG8qS4pDGS3fBEz
         4KiUMNGnmsqxX6cZ5DuDmOvy1ZULgh1E63aguzS0FcwnzMSwTrPCFs4S5bzOcaLDg1i7
         DI+5QbYpMP5jWD1udlKtbz5hdlDUfenLZ3b0TFgy4oYxCFHAfkan7B88JDtlOG/u/VE+
         Y4ZDMqbS6SetI1sSGkOH8A1J7agtyslYxii7tWXGNUMGNOa7Iu4SB4QQ3eBseIaZdIem
         adjOJ/c8CEZVyHf/9pK2axNUFJSB/m2ngEeV+PS6YZO2R0mVyKn2UYhA2Mmv852dkiGI
         6SiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771253970; x=1771858770;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2quQGOR5ITamGPdOgP1hgkc5a0zP4ikBMyBE1XRr2E=;
        b=QOKrXD0/Qe5WuaLcDqmU0d9uVEdrT3Dano66NHKsXIGfA/c47Mfw3WusqkLs2+n9BQ
         7Jza1uLmtdoXZCnwaD1+l3COJkX/dQ5iM9ptiFClUR27ZHJMQvUsXVcMYwYtITBkc7Tk
         cviC9eOnejcuK3a4g09EelL1vfejm47x+N2KdUgs5C4ov4bcywPsBIugwy9RpH6B9gBB
         tJlZ2TufS9JsREpft5AnUUQQbA+gpxB5ILNOJ1KdRlerzziENIUgZUcMX9OhDhLtwBW/
         dCS1yo3SpeTtb9T4V7ujopkOb7wYqJek1UCX72oKKnP+14wPrOGDNaa5/m5qLskUJRDq
         AADw==
X-Forwarded-Encrypted: i=1; AJvYcCXa+8uHMLZUErbMPD5uuiZXJg7O75RQqoznV2TOS7rYrrxxjBtWB7rscGIIQZ8sdNea7pNM9a5/@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwP9/uRSroI83383pY3941dxRYqHhNcM+MaEwtC0JRfmcodz0bX
	VSsFFEe+850T9NZgBaplOc/xYyjNKgECNeqPLdJZc+xE3INRwogfPV5eRGbhj4jnbt0+j7Uxw6u
	WS+ociCIiXb7d0Y+VWlpiB6jS6Ikw2yc=
X-Gm-Gg: AZuq6aKiy/XvnuHse6sHP7LYGbphk9TL+w36y6sai0g8xLe2+lLnhAbHaBjJ8AdNZOw
	FZB2EzK6H65raKQRWGHc8J9P9CLbGQnV+EOklJzLIyofGNOMQfeVMEQ3TOOK2KtmlvOawQBA10a
	F1UTjF/dL72//d45taWrdw3UckHFbM1YxukGLhUT+bzjrx73CcNkiJinRLh6hqXk2OGyCUpFstm
	abs2kLhn5+o9A8UUdBssyZbE7MXjc+l/T2ayEsn/vJLgI3A55HPhjZfWdWW02nuQTEAxeM4VxW8
	Q+KPg2az
X-Received: by 2002:a05:690e:1208:b0:64a:e648:b7f8 with SMTP id
 956f58d0204a3-64c21a9a102mr5955016d50.36.1771253969941; Mon, 16 Feb 2026
 06:59:29 -0800 (PST)
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
References: <20260210133843.1078463-1-tmaimon77@gmail.com> <20260210133843.1078463-2-tmaimon77@gmail.com>
 <b746dd7d-550c-4877-9210-754ae278e1a2@kernel.org> <CAP6Zq1jZorLxXQYqm5KzcYdoRzcFtD1KQqzmgaa6KKy-+Tpv+Q@mail.gmail.com>
 <92197c45-2921-47ad-9680-7339d6308b8f@kernel.org> <CAP6Zq1hLkT-xMwV99yVE-hLsf_nT+V_3v7sEshfqEkkRCkEevA@mail.gmail.com>
 <1522cec8-8259-4404-86fa-18bd91473087@kernel.org>
In-Reply-To: <1522cec8-8259-4404-86fa-18bd91473087@kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 16 Feb 2026 16:59:18 +0200
X-Gm-Features: AZwV_QgL6RzLsfBdvye5j1mzGt5Kx5CNMXOVoUI-P6AZdrC8QBxDO5ht90pUXfM
Message-ID: <CAP6Zq1iWpHc-Rsq62iBN0VtYmYS2=KhU12TE_5nxztr+HbB+tA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: watchdog: Add NPCM reset status support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andrew@codeconstruct.com.au, avifishman70@gmail.com, tali.perry1@gmail.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, venture@google.com, yuenn@google.com, 
	benjaminfair@google.com, joel@jms.id.au, openbmc@lists.ozlabs.org, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000af7b6f064af233c8"
X-Spam-Status: No, score=0.1 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.70 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andrew@codeconstruct.com.au,m:avifishman70@gmail.com,m:tali.perry1@gmail.com,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:venture@google.com,m:yuenn@google.com,m:benjaminfair@google.com,m:joel@jms.id.au,m:openbmc@lists.ozlabs.org,m:linux-watchdog@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:taliperry1@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[tmaimon77@gmail.com,openbmc@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-1378-lists,openbmc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tmaimon77@gmail.com,openbmc@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[codeconstruct.com.au,gmail.com,linux-watchdog.org,roeck-us.net,kernel.org,google.com,jms.id.au,lists.ozlabs.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[openbmc,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 98D11144EA6
X-Rspamd-Action: no action

--000000000000af7b6f064af233c8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 16 Feb 2026 at 16:48, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 16/02/2026 15:37, Tomer Maimon wrote:
> > Hi Krzysztof,
> >
> > Thanks for your comments.
> >
> > On Mon, 16 Feb 2026 at 13:16, Krzysztof Kozlowski <krzk@kernel.org>
> wrote:
> >
> >> On 16/02/2026 12:10, Tomer Maimon wrote:
> >>> Hi Krzysztof,
> >>>
> >>> Thanks for your review.
> >>>
> >>> On Tue, 10 Feb 2026 at 18:11, Krzysztof Kozlowski <krzk@kernel.org>
> >> wrote:
> >>>
> >>>> On 10/02/2026 14:38, Tomer Maimon wrote:
> >>>>> Add reset status detection for NPCM7XX and NPCM8XX platforms via
> syscon
> >>>>> integration. Document syscon property and three configurable reset
> type
> >>>>> properties (nuvoton,card-reset-type, nuvoton,ext1-reset-type,
> >>>>> nuvoton,ext2-reset-type)that map reset signal detection to specific
> >>>>> reset bit positions.
> >>>>>
> >>>>> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> >>>>> ---
> >>>>>  .../watchdog/nuvoton,npcm750-wdt.yaml         | 51
> ++++++++++++++++++-
> >>>>>  1 file changed, 49 insertions(+), 2 deletions(-)
> >>>>>
> >>>>> diff --git
> >>>> a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yam=
l
> >>>> b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yam=
l
> >>>>> index 7aa30f5b5c49..054cc0115af2 100644
> >>>>> ---
> >> a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
> >>>>> +++
> >> b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
> >>>>> @@ -12,7 +12,7 @@ maintainers:
> >>>>>  description:
> >>>>>    Nuvoton NPCM timer module provides five 24-bit timer counters,
> and a
> >>>> watchdog.
> >>>>>    The watchdog supports a pre-timeout interrupt that fires 10ms
> before
> >>>> the
> >>>>> -  expiry.
> >>>>> +  expiry and reset status detection via syscon integration.
> >>>>>
> >>>>>  allOf:
> >>>>>    - $ref: watchdog.yaml#
> >>>>> @@ -40,12 +40,55 @@ properties:
> >>>>>    clock-frequency:
> >>>>>      description: Frequency in Hz of the clock that drives the NPCM
> >>>> timer.
> >>>>>
> >>>>> +  syscon:
> >>>>
> >>>> First iteration. See "How to Get Your DT Schema Bindings Accepted in
> >>>> Less Than 10 Iterations"
> >>>>
> >>> Thanks, it was very helpful.
> >>> the syscon property is already found in the WD node
> >>> in nuvoton-common-npcm8xx.dtsi file, what should I do:
> >>
> >> How is that file related to this binding?
> >>
> >> Either you document existing ABI or you add new (for new device). Comm=
it
> >> msg MUST be explicit about it and provide the reasons. If wrong (e.g.
> >> discouraged) ABI was already used then it depends how and when it got
> >> into the kernel, e.g. if someone bypassed DT completely just to get it
> >> inside.
> >>
> > The syscon property is already used in the upstream NPCM8xx DTSI watchd=
og
> > node, so I will document it as existing ABI and mark it deprecated. I
> will
>
> And how it is used? I cannot find its usage, so I do not agree on
> documenting it. Property should be removed or at least provide the
> justification/impact of removal, if you need it to stay.
>
> Understood. The syscon phandle is used by the watchdog driver to read and
clear the GCR reset=E2=80=91status registers and then report the reset caus=
e
through the watchdog bootstatus bits.
Therefore, this property should appear in the binding only because the
watchdog driver actually uses it =E2=80=94 which I am implementing in this =
patch
set.
I will document it accordingly, and also add the new nuvoton,sysgcr phandle
as the preferred name.

> add a new vendor=E2=80=91specific property (nuvoton,sysgcr) as the prefer=
red one,
> > and explain this clearly in the commit message.
> >
> >>
> >>> 1. Modify the syson to nuvoton,sys-gcr like in the dtsi?
> >>> 2. Still use the syscon property in the dtsi file, therefore stick wi=
th
> >> the
> >>> syscon add.
>
>
> Best regards,
> Krzysztof
>

Best regards,

Tomer

--000000000000af7b6f064af233c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 16 Feb =
2026 at 16:48, Krzysztof Kozlowski &lt;<a href=3D"mailto:krzk@kernel.org">k=
rzk@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On 16/02/2026 15:37, Tomer Maimon wrote:<br>
&gt; Hi Krzysztof,<br>
&gt; <br>
&gt; Thanks for your comments.<br>
&gt; <br>
&gt; On Mon, 16 Feb 2026 at 13:16, Krzysztof Kozlowski &lt;<a href=3D"mailt=
o:krzk@kernel.org" target=3D"_blank">krzk@kernel.org</a>&gt; wrote:<br>
&gt; <br>
&gt;&gt; On 16/02/2026 12:10, Tomer Maimon wrote:<br>
&gt;&gt;&gt; Hi Krzysztof,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thanks for your review.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Tue, 10 Feb 2026 at 18:11, Krzysztof Kozlowski &lt;<a href=
=3D"mailto:krzk@kernel.org" target=3D"_blank">krzk@kernel.org</a>&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On 10/02/2026 14:38, Tomer Maimon wrote:<br>
&gt;&gt;&gt;&gt;&gt; Add reset status detection for NPCM7XX and NPCM8XX pla=
tforms via syscon<br>
&gt;&gt;&gt;&gt;&gt; integration. Document syscon property and three config=
urable reset type<br>
&gt;&gt;&gt;&gt;&gt; properties (nuvoton,card-reset-type, nuvoton,ext1-rese=
t-type,<br>
&gt;&gt;&gt;&gt;&gt; nuvoton,ext2-reset-type)that map reset signal detectio=
n to specific<br>
&gt;&gt;&gt;&gt;&gt; reset bit positions.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmai=
mon77@gmail.com" target=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 .../watchdog/nuvoton,npcm750-wdt.yaml=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 51 ++++++++++++++++++-<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 1 file changed, 49 insertions(+), 2 deletions(-)=
<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt; a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm7=
50-wdt.yaml<br>
&gt;&gt;&gt;&gt; b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm7=
50-wdt.yaml<br>
&gt;&gt;&gt;&gt;&gt; index 7aa30f5b5c49..054cc0115af2 100644<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt; a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.y=
aml<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt; b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.y=
aml<br>
&gt;&gt;&gt;&gt;&gt; @@ -12,7 +12,7 @@ maintainers:<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 description:<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 Nuvoton NPCM timer module provides five 2=
4-bit timer counters, and a<br>
&gt;&gt;&gt;&gt; watchdog.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 The watchdog supports a pre-timeout inter=
rupt that fires 10ms before<br>
&gt;&gt;&gt;&gt; the<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 expiry.<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 expiry and reset status detection via syscon i=
ntegration.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 allOf:<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 - $ref: watchdog.yaml#<br>
&gt;&gt;&gt;&gt;&gt; @@ -40,12 +40,55 @@ properties:<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 clock-frequency:<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 description: Frequency in Hz of th=
e clock that drives the NPCM<br>
&gt;&gt;&gt;&gt; timer.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 syscon:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; First iteration. See &quot;How to Get Your DT Schema Bindi=
ngs Accepted in<br>
&gt;&gt;&gt;&gt; Less Than 10 Iterations&quot;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thanks, it was very helpful.<br>
&gt;&gt;&gt; the syscon property is already found in the WD node<br>
&gt;&gt;&gt; in nuvoton-common-npcm8xx.dtsi file, what should I do:<br>
&gt;&gt;<br>
&gt;&gt; How is that file related to this binding?<br>
&gt;&gt;<br>
&gt;&gt; Either you document existing ABI or you add new (for new device). =
Commit<br>
&gt;&gt; msg MUST be explicit about it and provide the reasons. If wrong (e=
.g.<br>
&gt;&gt; discouraged) ABI was already used then it depends how and when it =
got<br>
&gt;&gt; into the kernel, e.g. if someone bypassed DT completely just to ge=
t it<br>
&gt;&gt; inside.<br>
&gt;&gt;<br>
&gt; The syscon property is already used in the upstream NPCM8xx DTSI watch=
dog<br>
&gt; node, so I will document it as existing ABI and mark it deprecated. I =
will<br>
<br>
And how it is used? I cannot find its usage, so I do not agree on<br>
documenting it. Property should be removed or at least provide the<br>
justification/impact of removal, if you need it to stay.<br>
<br></blockquote><div><div style=3D"font-size:14px;line-height:20px"><font =
face=3D"arial, sans-serif">Understood. The <code style=3D"">syscon</code> p=
handle is used by the watchdog driver to read and clear the GCR reset=E2=80=
=91status registers and then report the reset cause through the watchdog <c=
ode style=3D"">bootstatus</code> bits.=C2=A0</font></div><div style=3D"font=
-size:14px;line-height:20px"><font face=3D"arial, sans-serif">Therefore, th=
is property should appear in the binding only because the watchdog driver a=
ctually uses it =E2=80=94 which I am implementing in this patch set.=C2=A0<=
/font></div><div style=3D"font-size:14px;line-height:20px"><font face=3D"ar=
ial, sans-serif">I will document it accordingly, and also add the new <code=
 style=3D"">nuvoton,sysgcr</code> phandle as the preferred name.</font></di=
v></div><div style=3D"font-family:&quot;Segoe UI&quot;;font-size:14px;line-=
height:20px"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; add a new vendor=E2=80=91specific property (nuvoton,sysgcr) as the pre=
ferred one,<br>
&gt; and explain this clearly in the commit message.<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt;&gt; 1. Modify the syson to nuvoton,sys-gcr like in the dtsi?<br>
&gt;&gt;&gt; 2. Still use the syscon property in the dtsi file, therefore s=
tick with<br>
&gt;&gt; the<br>
&gt;&gt;&gt; syscon add.<br>
<br>
<br>
Best regards,<br>
Krzysztof<br></blockquote><div><br></div><div>Best regards,</div><div><br><=
/div><div>Tomer=C2=A0</div></div></div>

--000000000000af7b6f064af233c8--

