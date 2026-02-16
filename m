Return-Path: <openbmc+bounces-1373-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKPmIEP7kmlx0gEAu9opvQ
	(envelope-from <openbmc+bounces-1373-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Mon, 16 Feb 2026 12:10:59 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F862142B89
	for <lists+openbmc@lfdr.de>; Mon, 16 Feb 2026 12:10:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fF0Sb6dHhz2xlq;
	Mon, 16 Feb 2026 22:10:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::b133" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771240255;
	cv=pass; b=gllP64PCW2BwdSUHVKGcgvtv/vHMagFajDs8i3t6uIuwtyXvs9Fz1wEzgcupT4Lqhcsq1HHLoU6t4cz1EIRv5CbaeiDF6n+O9FihdH2fj1L1p9xJ2RgRmLgv+9/e6O0YMKCUyM0u3tVYHn69WYi8VVjcqfMcZJJBElq5qh5JPB/aKjhL0bBA6Y0jcQuSRsPVvSCtdt7nch28FMwwqk0NQzRGrOCtiAlHG4BvqB4ylfg8qE53RgMQ++qHFlt+LE1Q3MaJS/WgcdphYEQVAy69cIdY/DbHk2PWlUexauWDih37e6FJQz2QjaRx+wZ738BWAjJDR/CfBaFwLLKU9BtvUg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771240255; c=relaxed/relaxed;
	bh=974coIhtD7HE79fAzDi1SQ9aXvZHTy0LwIGNfDftL34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iUxzbXnAdpg/v7xJcyUMugEW6CufiFjICZO1WH/VsRL2if9f5sQilw7sFVlnXcmsFZgAgmdxgcF4WjhTWzyHHbKXegE/fdrwkaDNXiflhd3273pOcXKYsxxWqNDSAdeR66bup459NFoaL4lgB3stMC4yHKfwBNFLjSelWGuM7NcmE3eTcU0Ct24PIiS3DrNfMs39wSb0fSyL/bqGhexz+I/5Tk+FJAVryve6aPtHIpEAQjaoOZFP5XWTyoQ6PHiPIiZTyatt574CYriLGtU5AxQr6rcxoXUAeb+1dTRcchIei4DHtI8PxVwAQ2/BYrMnIf2b1VNvv53PVNjtsRaH/Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=APpMADMR; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b133; helo=mail-yx1-xb133.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=APpMADMR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b133; helo=mail-yx1-xb133.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yx1-xb133.google.com (mail-yx1-xb133.google.com [IPv6:2607:f8b0:4864:20::b133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fF0SZ0GpGz2xVT
	for <openbmc@lists.ozlabs.org>; Mon, 16 Feb 2026 22:10:53 +1100 (AEDT)
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-649b5f5570fso3531760d50.0
        for <openbmc@lists.ozlabs.org>; Mon, 16 Feb 2026 03:10:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771240250; cv=none;
        d=google.com; s=arc-20240605;
        b=lNVpFTW6XDfYzl3/eT0tATQIBZhwTePa27laUkQojlnu4hPT9kh5EjXpsj4i5kUiE+
         c+dP/Bpd/9qAZ4uARrSEyxz9v54pGGHrDDPWFOfVW6Xl2F6DXqXcUOfAsEXHDcK1lqCo
         7h/kuiJE8ZcvDLe4H7n5whBSNmAAt5Bc8+uIsmjBkyReWmdlp+9fMACTT90a2ReF4ref
         VYN517lDREG3uVE1BSvRJaTj95GybF+GDdaNgl2Q9HRL6zo2nklLzSyRN9yC3jA2F9bY
         CDnpnpvlw6arz5npYPr7gthxySe7D5/V7GW4/6zlYkELPVdMrOsS0Dbw5Pw0WCgjC64Z
         lqPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=974coIhtD7HE79fAzDi1SQ9aXvZHTy0LwIGNfDftL34=;
        fh=o5xtdw1cNwjYKEOpF/Rk1/E2GldFiyVppXU5x3u6Oxw=;
        b=C0XDUXX/QPVYYKwMwmJaAiumlZGRo6PgHjLKyGyMAv2g+LYc0bmyjOfW6rdJCHi3kw
         qwCNlO9dAu+UE4q4TifrclumwEnk8qp9cxlCkKBzlrlcTYWI2gW1SX/xBn4HkPfe4/1q
         QijcYBdmqP5kY+1AQhwPXCgcKJDOuhxW2X9fZXAjUH620TUbPwZJnqFvGBIQ/R2F/jFb
         Qbf8HtwvAX4FU87P+N33pbRfJk3x6h5Rk5XEB/baw4SmC/6BT9gaspOckqOjxVV41GAV
         wQNgv9QmpXk2jqtBVPybL2Lit1Bad06cR0X3nODbCtvcudRWBxC6FJKQULc9m+TBB3qg
         XWFw==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771240250; x=1771845050; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=974coIhtD7HE79fAzDi1SQ9aXvZHTy0LwIGNfDftL34=;
        b=APpMADMRzAE+ySiRCIPuHiJ2I35xH4gmTU1j7JeI2Y0wNf+wrfO7bwSydzDNqOjqoQ
         nf1vR6ggcS6uK1f0grzlfXFT8mO6n4djkmWKKkcmr+lMTDi0PN27QAFQzDnraeZfjBwl
         DgzapAU+aXrAnOL+ugMj8btAuZkLGpXF4kLo428Rj6uXTxvxsrtsYje6am1w61ka04Ml
         rJ3eaJ1lEwa3pqaSKb7RxOqMk9fUfDv2X3EzuV334PKQz7beNR1h3kHpZBm6cHOw+0qr
         t5gfefTI9P2fTo+ZYaQgnwcDiEPssvrAKaS01sdw0T9Sc5maN3jc/rPWKe4QVmblXtVN
         7RGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771240250; x=1771845050;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=974coIhtD7HE79fAzDi1SQ9aXvZHTy0LwIGNfDftL34=;
        b=hs3kI8LDgpnvueSTwNX7xo4vK5EQBE7nzRla99AXwOEEdODY+2PeFc6dfnf1RwLWxf
         OTi5SVDq7DwG6y+mxMZFwdzxV6a1y4fUPmAScNp+eSTXRWjwMdczGhzUpCDhVwRyffhS
         MMic1V7zxo5RF+rqC9c8MZRn+s5b3ZuU2DRQFC+s+eR21E9stX1TZ5kGyCBTDIGtBNFf
         VGbdRSh6HInKC46MP5gT6mdcWwzmDx3Wz8ZgDXvB7eKkAA36AG728OdrI6cURKkzJjXg
         VRUhkwQ+KMck8x3j1bNKYMQ1NIyDIkFoOD8RZFettRa6zmzgrUFhj8hQvE7KzYt8t+Xs
         v8Fw==
X-Forwarded-Encrypted: i=1; AJvYcCVdVlUqRCr3XNdOuVICxESh24jEVwdvx+uVqKDq4rLHwusQuMdzoo+2iyHZXtNeRXyq0yaWBoVW@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwfJp3fy3vnmZcBmW8XDnS5fT7I71gkiKe5glZAz2p37bi2MtsU
	+HNKEBW6mgdWWY9fKjzg+yXucjHqJ1qSCNiWXHaOsQ9oG7W9h/dCr6qEwtiJpzMilewqEEbMOc7
	b4D0dQ9XX7Q0ln4Fnj8vYIplNUR81LPk=
X-Gm-Gg: AZuq6aKvU+rESvZo8ULdO5nP8mlfTVtC85gOi7dhsY7vw8h81H0TJbxzR/tGnqZTK5k
	PZIitHMhQyBc4FwcBLIHrrm7GGy86yyi5r/evhli/1jZvyqJb6bA1WhRnRNoHRQSx31IQtc0Fr6
	PFnrpYqgMQjBoSfIGsAAyhr2lmO+22I88DQ+NSaN9vkCGndFFOmE6UzlLG2IaFgJlsc5cWr8F7i
	TQsOktZUnhC/qaPF2zWznSD3QFo9i8Cp1LaKr+YzpUapLKyIU7auAYEiUyxV2JFzfxMsMNeop/t
	mxe2bpqeQXYhlt9Hp6A=
X-Received: by 2002:a53:b5cc:0:b0:64a:eda9:8ea9 with SMTP id
 956f58d0204a3-64c20158933mr4750313d50.2.1771240250456; Mon, 16 Feb 2026
 03:10:50 -0800 (PST)
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
 <b746dd7d-550c-4877-9210-754ae278e1a2@kernel.org>
In-Reply-To: <b746dd7d-550c-4877-9210-754ae278e1a2@kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 16 Feb 2026 13:10:38 +0200
X-Gm-Features: AZwV_QiZdZnrMH5oHajX21YJL9k-_sE31cXuxzCeLc34XwY7rTcpITBNCr_wyM8
Message-ID: <CAP6Zq1jZorLxXQYqm5KzcYdoRzcFtD1KQqzmgaa6KKy-+Tpv+Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: watchdog: Add NPCM reset status support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andrew@codeconstruct.com.au, avifishman70@gmail.com, tali.perry1@gmail.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, venture@google.com, yuenn@google.com, 
	benjaminfair@google.com, joel@jms.id.au, openbmc@lists.ozlabs.org, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000f0bfa9064aef01ca"
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andrew@codeconstruct.com.au,m:avifishman70@gmail.com,m:tali.perry1@gmail.com,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:venture@google.com,m:yuenn@google.com,m:benjaminfair@google.com,m:joel@jms.id.au,m:openbmc@lists.ozlabs.org,m:linux-watchdog@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:taliperry1@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[tmaimon77@gmail.com,openbmc@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-1373-lists,openbmc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 5F862142B89
X-Rspamd-Action: no action

--000000000000f0bfa9064aef01ca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thanks for your review.

On Tue, 10 Feb 2026 at 18:11, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 10/02/2026 14:38, Tomer Maimon wrote:
> > Add reset status detection for NPCM7XX and NPCM8XX platforms via syscon
> > integration. Document syscon property and three configurable reset type
> > properties (nuvoton,card-reset-type, nuvoton,ext1-reset-type,
> > nuvoton,ext2-reset-type)that map reset signal detection to specific
> > reset bit positions.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  .../watchdog/nuvoton,npcm750-wdt.yaml         | 51 ++++++++++++++++++-
> >  1 file changed, 49 insertions(+), 2 deletions(-)
> >
> > diff --git
> a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
> b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
> > index 7aa30f5b5c49..054cc0115af2 100644
> > --- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.ya=
ml
> > +++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.ya=
ml
> > @@ -12,7 +12,7 @@ maintainers:
> >  description:
> >    Nuvoton NPCM timer module provides five 24-bit timer counters, and a
> watchdog.
> >    The watchdog supports a pre-timeout interrupt that fires 10ms before
> the
> > -  expiry.
> > +  expiry and reset status detection via syscon integration.
> >
> >  allOf:
> >    - $ref: watchdog.yaml#
> > @@ -40,12 +40,55 @@ properties:
> >    clock-frequency:
> >      description: Frequency in Hz of the clock that drives the NPCM
> timer.
> >
> > +  syscon:
>
> First iteration. See "How to Get Your DT Schema Bindings Accepted in
> Less Than 10 Iterations"
>
Thanks, it was very helpful.
the syscon property is already found in the WD node
in nuvoton-common-npcm8xx.dtsi file, what should I do:
1. Modify the syson to nuvoton,sys-gcr like in the dtsi?
2. Still use the syscon property in the dtsi file, therefore stick with the
syscon add.

>
> or just read the docs please.
>
> > +    description: phandle to the Global Control Register (GCR) syscon
> node.
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +
> > +  nuvoton,card-reset-type:
> > +    description: Reset type for external card reset signal detection.
> > +    enum:
> > +      - porst
> > +      - corst
> > +      - wd0
> > +      - wd1
> > +      - wd2
> > +      - sw1
> > +      - sw2
> > +      - sw3
> > +      - sw4
>
> You want it to be static configuration, so cannot be changed runtime? Why=
?
>
Yes, it is only an indication of the most recent reset in the BMC. In
addition:
1. The driver reads the reset register during the probe. After this read,
the reset register should be cleared so it=E2=80=99s ready for the next sys=
tem
reset.
2. I=E2=80=99m not aware of any service function that allows changing the r=
eset
indication at runtime.
.

>
> > +
> > +  nuvoton,ext1-reset-type:
> > +    description: Reset type for external reset signal 1 detection.
> > +    enum:
> > +      - porst
> > +      - corst
> > +      - wd0
> > +      - wd1
> > +      - wd2
> > +      - sw1
> > +      - sw2
> > +      - sw3
> > +      - sw4
> > +
> > +  nuvoton,ext2-reset-type:
> > +    description: Reset type for external reset signal 2 detection.
> > +    enum:
> > +      - porst
> > +      - corst
> > +      - wd0
> > +      - wd1
> > +      - wd2
> > +      - sw1
> > +      - sw2
> > +      - sw3
> > +      - sw4
> > +
> >  required:
> >    - compatible
> >    - reg
> >    - interrupts
> >
> > -unevaluatedProperties: false
> > +additionalProperties: false
>
> Why? Nothing explains this in the commit msg.
>
Mistake, will back to unevaluatedProperties: false

>
>
> >
> >  examples:
> >    - |
> > @@ -57,4 +100,8 @@ examples:
> >          interrupts =3D <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
> >          reg =3D <0xf000801c 0x4>;
> >          clocks =3D <&clk NPCM7XX_CLK_TIMER>;
> > +        syscon =3D <&gcr>;
> > +        nuvoton,card-reset-type =3D "porst";
> > +        nuvoton,ext1-reset-type =3D "wd0";
> > +        nuvoton,ext2-reset-type =3D "wd2";
> >      };
>
>
> Best regards,
> Krzysztof
>

Best regards,

Tomer

--000000000000f0bfa9064aef01ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Krzysztof,<div><br></div><div>Tha=
nks for your review.</div></div><br><div class=3D"gmail_quote gmail_quote_c=
ontainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 10 Feb 2026 at 18:1=
1, Krzysztof Kozlowski &lt;<a href=3D"mailto:krzk@kernel.org">krzk@kernel.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On 10/02/2026 14:38, Tomer Maimon wrote:<br>
&gt; Add reset status detection for NPCM7XX and NPCM8XX platforms via sysco=
n<br>
&gt; integration. Document syscon property and three configurable reset typ=
e<br>
&gt; properties (nuvoton,card-reset-type, nuvoton,ext1-reset-type,<br>
&gt; nuvoton,ext2-reset-type)that map reset signal detection to specific<br=
>
&gt; reset bit positions.<br>
&gt; <br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
 target=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../watchdog/nuvoton,npcm750-wdt.yaml=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 51 ++++++++++++++++++-<br>
&gt;=C2=A0 1 file changed, 49 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm75=
0-wdt.yaml b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt=
.yaml<br>
&gt; index 7aa30f5b5c49..054cc0115af2 100644<br>
&gt; --- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.y=
aml<br>
&gt; +++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.y=
aml<br>
&gt; @@ -12,7 +12,7 @@ maintainers:<br>
&gt;=C2=A0 description:<br>
&gt;=C2=A0 =C2=A0 Nuvoton NPCM timer module provides five 24-bit timer coun=
ters, and a watchdog.<br>
&gt;=C2=A0 =C2=A0 The watchdog supports a pre-timeout interrupt that fires =
10ms before the<br>
&gt; -=C2=A0 expiry.<br>
&gt; +=C2=A0 expiry and reset status detection via syscon integration.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 allOf:<br>
&gt;=C2=A0 =C2=A0 - $ref: watchdog.yaml#<br>
&gt; @@ -40,12 +40,55 @@ properties:<br>
&gt;=C2=A0 =C2=A0 clock-frequency:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 description: Frequency in Hz of the clock that dri=
ves the NPCM timer.<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 syscon:<br>
<br>
First iteration. See &quot;How to Get Your DT Schema Bindings Accepted in<b=
r>
Less Than 10 Iterations&quot;<br></blockquote><div>Thanks, it was very help=
ful.</div><div>the syscon property is already found in the WD node in=C2=A0=
nuvoton-common-npcm8xx.dtsi file, what should I do:</div><div>1. Modify the=
 syson to nuvoton,sys-gcr like in the dtsi?</div><div>2. Still use the sysc=
on property in the dtsi file, therefore stick with the syscon add.</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
or just read the docs please.<br>
<br>
&gt; +=C2=A0 =C2=A0 description: phandle to the Global Control Register (GC=
R) syscon node.<br>
&gt; +=C2=A0 =C2=A0 $ref: /schemas/types.yaml#/definitions/phandle<br>
&gt; +<br>
&gt; +=C2=A0 nuvoton,card-reset-type:<br>
&gt; +=C2=A0 =C2=A0 description: Reset type for external card reset signal =
detection.<br>
&gt; +=C2=A0 =C2=A0 enum:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - porst<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - corst<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - wd0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - wd1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - wd2<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - sw1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - sw2<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - sw3<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - sw4<br>
<br>
You want it to be static configuration, so cannot be changed runtime? Why?<=
br></blockquote><div><div style=3D"font-family:&quot;Segoe UI&quot;;font-si=
ze:14px;line-height:20px">Yes, it is only an indication of the most recent =
reset in the BMC. In addition:</div></div><div><span style=3D"font-family:&=
quot;Segoe UI&quot;;font-size:14px">1. The driver reads the reset register =
during the probe. After this read, the reset register should be cleared so =
it=E2=80=99s ready for the next system reset.</span></div><div><font face=
=3D"Segoe UI"><span style=3D"font-size:14px">2.=C2=A0</span></font><span st=
yle=3D"font-family:&quot;Segoe UI&quot;;font-size:14px">I=E2=80=99m not awa=
re of any service function that allows changing the reset indication at run=
time.</span><font face=3D"Segoe UI"><span style=3D"font-size:14px"><br></sp=
an></font><font face=3D"Segoe UI"><span style=3D"font-size:14px">.</span></=
font></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +<br>
&gt; +=C2=A0 nuvoton,ext1-reset-type:<br>
&gt; +=C2=A0 =C2=A0 description: Reset type for external reset signal 1 det=
ection.<br>
&gt; +=C2=A0 =C2=A0 enum:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - porst<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - corst<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - wd0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - wd1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - wd2<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - sw1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - sw2<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - sw3<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - sw4<br>
&gt; +<br>
&gt; +=C2=A0 nuvoton,ext2-reset-type:<br>
&gt; +=C2=A0 =C2=A0 description: Reset type for external reset signal 2 det=
ection.<br>
&gt; +=C2=A0 =C2=A0 enum:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - porst<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - corst<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - wd0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - wd1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - wd2<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - sw1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - sw2<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - sw3<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - sw4<br>
&gt; +<br>
&gt;=C2=A0 required:<br>
&gt;=C2=A0 =C2=A0 - compatible<br>
&gt;=C2=A0 =C2=A0 - reg<br>
&gt;=C2=A0 =C2=A0 - interrupts<br>
&gt;=C2=A0 <br>
&gt; -unevaluatedProperties: false<br>
&gt; +additionalProperties: false<br>
<br>
Why? Nothing explains this in the commit msg.<br></blockquote><div>Mistake,=
 will back to unevaluatedProperties: false</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 examples:<br>
&gt;=C2=A0 =C2=A0 - |<br>
&gt; @@ -57,4 +100,8 @@ examples:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interrupts =3D &lt;GIC_SPI 47 IRQ_TY=
PE_LEVEL_HIGH&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0xf000801c 0x4&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clocks =3D &lt;&amp;clk NPCM7XX_CLK_=
TIMER&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 syscon =3D &lt;&amp;gcr&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 nuvoton,card-reset-type =3D &quot;porst&q=
uot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 nuvoton,ext1-reset-type =3D &quot;wd0&quo=
t;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 nuvoton,ext2-reset-type =3D &quot;wd2&quo=
t;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 };<br>
<br>
<br>
Best regards,<br>
Krzysztof<br></blockquote><div><br></div><div>Best regards,</div><div><br><=
/div><div>Tomer</div></div></div>

--000000000000f0bfa9064aef01ca--

