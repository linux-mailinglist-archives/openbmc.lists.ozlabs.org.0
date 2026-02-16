Return-Path: <openbmc+bounces-1376-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJqFJsgrk2kI2AEAu9opvQ
	(envelope-from <openbmc+bounces-1376-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Mon, 16 Feb 2026 15:38:00 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAA1144C01
	for <lists+openbmc@lfdr.de>; Mon, 16 Feb 2026 15:37:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fF53R1gsGz2xlq;
	Tue, 17 Feb 2026 01:37:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::b131" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771252675;
	cv=pass; b=jxQBFaT9BGGWYq5FA8ehEvYqotv+RkhZ24aquxhuPorgs4YWYvUwtcRmF45gegFLkfrtc11YDF9rpDE8i8UrqDd9TdbMOeQAQvTWyukcAjS3rnBu7hQOGty5A6aXWCe1rvjp8viuwuMDrpZiLPLiaYJIqWvMLxCkqI+v/xcv2ANFfEYbkw8vuH0L8KyWvb+rmwKCgiRf8aeNXyB6MWpSxJ1zgj5rAqZHivSRBUBFc3R5GL3HMf5QIXRjyBbmuTysWH+BH/PDrdkBWRfZXQEEmg2+FKQLQ8iH17FpwnmIu5xxcWOZj5VEaljHsnkfdEdhk1IE1MRP/BVLhd9Ww++B5w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771252675; c=relaxed/relaxed;
	bh=oskfKU3Ek40FqQyXBd/N6c/7heLw39eTzLISfQ978uQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XaBk9Pexp9TqDkx7XxY7SoIbtjlRmQapzLr9f9b6WPJtPW0RcjVgxJ3zeZf7bDS1otaVe7E8G0sMzEMX0tPyBWVHX0haNKEYJaj2p8RYRduaXvRMJZVbmvRtUQ7cOMksmZrssk0ltjvDXoBxEnsVO1d1HGVwaCUFK5HVzH25lMVnBRk3/TlYp9L29kj6atnUa7xziRr7P0FjdE3eQfX2ix5+xOGVP2mvNUlF98f/4qpPXVMr/IWhuU6SgpHnjM/eLreSxmsN9OmOHmAtJ8NCDCfY0sCZ/DQkKr7mChvCMlWX5dp/zUdxAlNHhTMg6v4uR9crg/M9xiGXKaBIyOtv+g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MouHr9WS; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b131; helo=mail-yx1-xb131.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MouHr9WS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b131; helo=mail-yx1-xb131.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yx1-xb131.google.com (mail-yx1-xb131.google.com [IPv6:2607:f8b0:4864:20::b131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fF53Q2k9Qz2xVT
	for <openbmc@lists.ozlabs.org>; Tue, 17 Feb 2026 01:37:53 +1100 (AEDT)
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-64adabaafd6so2806240d50.0
        for <openbmc@lists.ozlabs.org>; Mon, 16 Feb 2026 06:37:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771252671; cv=none;
        d=google.com; s=arc-20240605;
        b=SmRijt7yxNYtuofdId9HA5ghAitoQGRznSuIVMv/zHVFvhgin6Vo5EpiBi5ZPNlvhL
         7xSKcp6O6J2JI4nkROPqNkcemZaZj7QABurH+tM8BH5A+hviwL/8drXjuvzB7LtPObIc
         VbcUdHOMRvrKxqikm95Z+fMtMB5Lon7XZlU7zbfoF9lBoXht9icoHtJjwBwEZkq91Yz6
         2um175UZ2Te0z4Hdn/GGK/whxW3KL7VomA8KHlrVDvalxQN3glWawTxajBEGs8yHU1aO
         sV6zGVzbUWC2qn2MKwumWxkSUckAbxyejvBlUy4/jovukF93vLmUDnkP01S7LvEcY66P
         JbJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oskfKU3Ek40FqQyXBd/N6c/7heLw39eTzLISfQ978uQ=;
        fh=zPoab7vqNRi2KcY3JZTh18nZw+Zr1zqh+m8d6ebU5P4=;
        b=T9EKUQCwJ2clhkTvb1CcKvpvTAn/go8K2Bd04w5U/qa1XB1Gbs1YlFe7uXCTL4s6AH
         shRDsggDEjvLeW+dJ+/MH7NTtJarqr7k3xG28aWW0xe0Ur6AHQuLQPA9c07IdozrCzTW
         dbZithcgXWfW2ZezyeTjCt2bevhgnd4b+guSp8/tBdZ4tK+1UMATOnwCkjA7hhDsAvxq
         PhA4EHkSUNmmQ9kIFqyFTkep3+mRNKso4uMK/2bDI6mBhbJ/awOiqmIsHCPl654wH8Cq
         t0Cb/JO1htAMZmL2KkP3I//cnwb3VbCE3BBBDjfuVHMTyq9jHqyWwtLSScaXuz6JSyFV
         ff9Q==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771252671; x=1771857471; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oskfKU3Ek40FqQyXBd/N6c/7heLw39eTzLISfQ978uQ=;
        b=MouHr9WSEnRkr8ij/VrtdLpuCiD5qZn3RSdyG6j6OXB15INUkcWG76HQMd7c8Qx6Y6
         jfKr+mIrF+BixPv34BGCmZ0+Ruvc11UtbfVKYLFIAVU5gauBIrecb4EBmVUZE7qePu7V
         O0xw4gLxwS6u7MSLZMVrdYm8wGE2K667L66RWwwOCs4NgjaVJbyzZpeAGOHELzFCoUkb
         douUC88p6xPpPUX4AqlZqaZhrAB7lu8RcRwJzTkYvJB3vV3l3ID4ZEGnUx4YwOCWbDVR
         zXAw1FVQ5Z9YkBncu8PcyicWoNGmktvb/fK869tmLhMSQUN+cMcWX1lIQ87Ge0+RN3dR
         3taw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771252671; x=1771857471;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oskfKU3Ek40FqQyXBd/N6c/7heLw39eTzLISfQ978uQ=;
        b=wAQfTM86Xfl49loxAQZOsLvRDo+rum2PxO3FSRpK894uIz3tCQEu9Nx5/LwobEKwML
         blrpYxA/+MP5hxcFl0YR1eLR7qVlik1pQVqFo0EsnFFuekR/cNyaYcjP8I8C2rDRdYci
         MpNSr87SeqMs+hy5RP9my1CLASOrS6/lV+6w4eYxsB/d7b+jHnMNJ3UDJ1CQuUXTreM0
         Y8Z0wg03COObmxzTvPsjSHfq7WmlKVLqr2TYUt0xhgUlhY0tnYfOsS5eWJLTk5ZpyRU5
         ePoo3GEEam31bNhlany2LHXVXVo5lDZpDcrlTisPbX3UdjJhBKBhSbFlFDfeXnY3EUZq
         fbXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUS5+P1AN9aJ4bglW3oX0hwd2aL0eHzWt+49E8nF1cljNd28J0I1zbOcdjeuDqy3Vfc9HyAvP0@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwbaSGc3ANKmLg1zv5VMLNO7PlG9t6K0cW2/HlP+lpSDADKrPhZ
	qULb6lt1unAo4lMc9uZfZbW3gndap1c6nSRgKTr5eXBhhKKx+cE2qThA4Gpvi//KxX7ZPBY++gx
	/bqq52eBs/uwCR+LCww9woufMl+s96jo=
X-Gm-Gg: AZuq6aKhunAxO/mpGEwfwvkcWibJEnOOHNlDC3qcDsbPKI83UwyYSthpHbd3DOi21Kp
	IDr7NEVQAeXnJFrh+aGMdV5mobg09PXamWR/kJVTfaeIHNry3CNgRgmBnLUk1aotDnOJQDFY7iP
	NFSaIeXIomLkBpfhnsMSl0YbLo7ENN1SAutw6cEE2rgzW9TeThV6UV+LDbH4ucjzdYn5Qjpe16V
	flsH6mdGbk0HsyPfiMv9mbvhKZsL1Z6nwx6CjRx34fQF7m+FbHK4jDNpApSYWzr3tBpD7NuH2SM
	cR57kHp6
X-Received: by 2002:a05:690e:b8b:b0:64a:d83d:c262 with SMTP id
 956f58d0204a3-64c197a4341mr8102490d50.1.1771252671011; Mon, 16 Feb 2026
 06:37:51 -0800 (PST)
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
 <92197c45-2921-47ad-9680-7339d6308b8f@kernel.org>
In-Reply-To: <92197c45-2921-47ad-9680-7339d6308b8f@kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 16 Feb 2026 16:37:39 +0200
X-Gm-Features: AZwV_QhbMVnMxT_aKPd-da0GCm8-ODA6nNM7NVe_LZVSIvZeQZ_77wEPx0amAeg
Message-ID: <CAP6Zq1hLkT-xMwV99yVE-hLsf_nT+V_3v7sEshfqEkkRCkEevA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: watchdog: Add NPCM reset status support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andrew@codeconstruct.com.au, avifishman70@gmail.com, tali.perry1@gmail.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, venture@google.com, yuenn@google.com, 
	benjaminfair@google.com, joel@jms.id.au, openbmc@lists.ozlabs.org, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000435f4e064af1e60d"
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
	TAGGED_FROM(0.00)[bounces-1376-lists,openbmc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 5DAA1144C01
X-Rspamd-Action: no action

--000000000000435f4e064af1e60d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thanks for your comments.

On Mon, 16 Feb 2026 at 13:16, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 16/02/2026 12:10, Tomer Maimon wrote:
> > Hi Krzysztof,
> >
> > Thanks for your review.
> >
> > On Tue, 10 Feb 2026 at 18:11, Krzysztof Kozlowski <krzk@kernel.org>
> wrote:
> >
> >> On 10/02/2026 14:38, Tomer Maimon wrote:
> >>> Add reset status detection for NPCM7XX and NPCM8XX platforms via sysc=
on
> >>> integration. Document syscon property and three configurable reset ty=
pe
> >>> properties (nuvoton,card-reset-type, nuvoton,ext1-reset-type,
> >>> nuvoton,ext2-reset-type)that map reset signal detection to specific
> >>> reset bit positions.
> >>>
> >>> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> >>> ---
> >>>  .../watchdog/nuvoton,npcm750-wdt.yaml         | 51 +++++++++++++++++=
+-
> >>>  1 file changed, 49 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git
> >> a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
> >> b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
> >>> index 7aa30f5b5c49..054cc0115af2 100644
> >>> ---
> a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
> >>> +++
> b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
> >>> @@ -12,7 +12,7 @@ maintainers:
> >>>  description:
> >>>    Nuvoton NPCM timer module provides five 24-bit timer counters, and=
 a
> >> watchdog.
> >>>    The watchdog supports a pre-timeout interrupt that fires 10ms befo=
re
> >> the
> >>> -  expiry.
> >>> +  expiry and reset status detection via syscon integration.
> >>>
> >>>  allOf:
> >>>    - $ref: watchdog.yaml#
> >>> @@ -40,12 +40,55 @@ properties:
> >>>    clock-frequency:
> >>>      description: Frequency in Hz of the clock that drives the NPCM
> >> timer.
> >>>
> >>> +  syscon:
> >>
> >> First iteration. See "How to Get Your DT Schema Bindings Accepted in
> >> Less Than 10 Iterations"
> >>
> > Thanks, it was very helpful.
> > the syscon property is already found in the WD node
> > in nuvoton-common-npcm8xx.dtsi file, what should I do:
>
> How is that file related to this binding?
>
> Either you document existing ABI or you add new (for new device). Commit
> msg MUST be explicit about it and provide the reasons. If wrong (e.g.
> discouraged) ABI was already used then it depends how and when it got
> into the kernel, e.g. if someone bypassed DT completely just to get it
> inside.
>
The syscon property is already used in the upstream NPCM8xx DTSI watchdog
node, so I will document it as existing ABI and mark it deprecated. I will
add a new vendor=E2=80=91specific property (nuvoton,sysgcr) as the preferre=
d one,
and explain this clearly in the commit message.

>
> > 1. Modify the syson to nuvoton,sys-gcr like in the dtsi?
> > 2. Still use the syscon property in the dtsi file, therefore stick with
> the
> > syscon add.
> >
>
> >>
> >> or just read the docs please.
> >>
> >>> +    description: phandle to the Global Control Register (GCR) syscon
> >> node.
> >>> +    $ref: /schemas/types.yaml#/definitions/phandle
> >>> +
> >>> +  nuvoton,card-reset-type:
> >>> +    description: Reset type for external card reset signal detection=
.
> >>> +    enum:
> >>> +      - porst
> >>> +      - corst
> >>> +      - wd0
> >>> +      - wd1
> >>> +      - wd2
> >>> +      - sw1
> >>> +      - sw2
> >>> +      - sw3
> >>> +      - sw4
> >>
> >> You want it to be static configuration, so cannot be changed runtime?
> Why?
> >>
> > Yes, it is only an indication of the most recent reset in the BMC. In
> > addition:
> > 1. The driver reads the reset register during the probe. After this rea=
d,
> > the reset register should be cleared so it=E2=80=99s ready for the next=
 system
> > reset.
> > 2. I=E2=80=99m not aware of any service function that allows changing t=
he reset
> > indication at runtime.
>
> Huh? If the driver reads the reset you do not need this property at all.
>
I understand that since the driver can read the reset cause directly from
the GCR, no DT properties should be used for this. I=E2=80=99ll drop the re=
set=E2=80=91type
properties and handle the mapping in the driver based on the SoC.

>
> Best regards,
> Krzysztof
>

Best regards,

Tomer

--000000000000435f4e064af1e60d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Krzysztof,<div><br></div><div>Tha=
nks for your comments.</div></div><br><div class=3D"gmail_quote gmail_quote=
_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 16 Feb 2026 at 13=
:16, Krzysztof Kozlowski &lt;<a href=3D"mailto:krzk@kernel.org">krzk@kernel=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On 16/02/2026 12:10, Tomer Maimon wrote:<br>
&gt; Hi Krzysztof,<br>
&gt; <br>
&gt; Thanks for your review.<br>
&gt; <br>
&gt; On Tue, 10 Feb 2026 at 18:11, Krzysztof Kozlowski &lt;<a href=3D"mailt=
o:krzk@kernel.org" target=3D"_blank">krzk@kernel.org</a>&gt; wrote:<br>
&gt; <br>
&gt;&gt; On 10/02/2026 14:38, Tomer Maimon wrote:<br>
&gt;&gt;&gt; Add reset status detection for NPCM7XX and NPCM8XX platforms v=
ia syscon<br>
&gt;&gt;&gt; integration. Document syscon property and three configurable r=
eset type<br>
&gt;&gt;&gt; properties (nuvoton,card-reset-type, nuvoton,ext1-reset-type,<=
br>
&gt;&gt;&gt; nuvoton,ext2-reset-type)that map reset signal detection to spe=
cific<br>
&gt;&gt;&gt; reset bit positions.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gm=
ail.com" target=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 .../watchdog/nuvoton,npcm750-wdt.yaml=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 51 ++++++++++++++++++-<br>
&gt;&gt;&gt;=C2=A0 1 file changed, 49 insertions(+), 2 deletions(-)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git<br>
&gt;&gt; a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.y=
aml<br>
&gt;&gt; b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.y=
aml<br>
&gt;&gt;&gt; index 7aa30f5b5c49..054cc0115af2 100644<br>
&gt;&gt;&gt; --- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm7=
50-wdt.yaml<br>
&gt;&gt;&gt; +++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm7=
50-wdt.yaml<br>
&gt;&gt;&gt; @@ -12,7 +12,7 @@ maintainers:<br>
&gt;&gt;&gt;=C2=A0 description:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 Nuvoton NPCM timer module provides five 24-bit ti=
mer counters, and a<br>
&gt;&gt; watchdog.<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 The watchdog supports a pre-timeout interrupt tha=
t fires 10ms before<br>
&gt;&gt; the<br>
&gt;&gt;&gt; -=C2=A0 expiry.<br>
&gt;&gt;&gt; +=C2=A0 expiry and reset status detection via syscon integrati=
on.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 allOf:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 - $ref: watchdog.yaml#<br>
&gt;&gt;&gt; @@ -40,12 +40,55 @@ properties:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 clock-frequency:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 description: Frequency in Hz of the clock =
that drives the NPCM<br>
&gt;&gt; timer.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; +=C2=A0 syscon:<br>
&gt;&gt;<br>
&gt;&gt; First iteration. See &quot;How to Get Your DT Schema Bindings Acce=
pted in<br>
&gt;&gt; Less Than 10 Iterations&quot;<br>
&gt;&gt;<br>
&gt; Thanks, it was very helpful.<br>
&gt; the syscon property is already found in the WD node<br>
&gt; in nuvoton-common-npcm8xx.dtsi file, what should I do:<br>
<br>
How is that file related to this binding?<br>
<br>
Either you document existing ABI or you add new (for new device). Commit<br=
>
msg MUST be explicit about it and provide the reasons. If wrong (e.g.<br>
discouraged) ABI was already used then it depends how and when it got<br>
into the kernel, e.g. if someone bypassed DT completely just to get it<br>
inside.<br></blockquote><div><font face=3D"arial, sans-serif"><span style=
=3D"font-size:14px">The </span><code style=3D"font-size:14px">syscon</code>=
<span style=3D"font-size:14px"> property is already used in the upstream NP=
CM8xx DTSI watchdog node, so I will document it as existing ABI and mark it=
 deprecated. I will add a new vendor=E2=80=91specific property (</span><cod=
e style=3D"font-size:14px">nuvoton,sysgcr</code><span style=3D"font-size:14=
px">) as the preferred one, and explain this clearly in the commit message.=
</span></font></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; 1. Modify the syson to nuvoton,sys-gcr like in the dtsi?<br>
&gt; 2. Still use the syscon property in the dtsi file, therefore stick wit=
h the<br>
&gt; syscon add.<br>
&gt; <br>
<br>
&gt;&gt;<br>
&gt;&gt; or just read the docs please.<br>
&gt;&gt;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 description: phandle to the Global Control Regi=
ster (GCR) syscon<br>
&gt;&gt; node.<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 $ref: /schemas/types.yaml#/definitions/phandle<=
br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 nuvoton,card-reset-type:<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 description: Reset type for external card reset=
 signal detection.<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 enum:<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 - porst<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 - corst<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 - wd0<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 - wd1<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 - wd2<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 - sw1<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 - sw2<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 - sw3<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 - sw4<br>
&gt;&gt;<br>
&gt;&gt; You want it to be static configuration, so cannot be changed runti=
me? Why?<br>
&gt;&gt;<br>
&gt; Yes, it is only an indication of the most recent reset in the BMC. In<=
br>
&gt; addition:<br>
&gt; 1. The driver reads the reset register during the probe. After this re=
ad,<br>
&gt; the reset register should be cleared so it=E2=80=99s ready for the nex=
t system<br>
&gt; reset.<br>
&gt; 2. I=E2=80=99m not aware of any service function that allows changing =
the reset<br>
&gt; indication at runtime.<br>
<br>
Huh? If the driver reads the reset you do not need this property at all.<br=
></blockquote><div><font face=3D"arial, sans-serif"><span style=3D"font-siz=
e:14px">I understand that since the driver can read the reset cause directl=
y from the GCR, no DT properties should be used for this. I=E2=80=99ll drop=
 the reset=E2=80=91type properties and handle the mapping in the driver bas=
ed on the SoC.</span>=C2=A0</font></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br>
Best regards,<br>
Krzysztof<br></blockquote><div><br></div><div>Best regards,</div><div><br><=
/div><div>Tomer=C2=A0</div></div></div>

--000000000000435f4e064af1e60d--

