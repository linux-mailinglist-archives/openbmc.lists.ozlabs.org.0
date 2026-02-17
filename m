Return-Path: <openbmc+bounces-1385-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePPRA2AXlGmW/wEAu9opvQ
	(envelope-from <openbmc+bounces-1385-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Tue, 17 Feb 2026 08:23:12 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA091492FC
	for <lists+openbmc@lfdr.de>; Tue, 17 Feb 2026 08:23:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fFWMJ2QTNz2xjP;
	Tue, 17 Feb 2026 18:23:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::b134" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771312988;
	cv=pass; b=Qa40jFGU9G17AC6qK5CDK+Jmpnme/ddAtnAWMVF60e6mxBv2HNavyYnGdjirlbUEn5GwPuTlQQm3l4eOsGjNXbBbWOWsdE6bm2XsihPjs30xi8T/uEoeErgNE0XXvcem5cq4cjKcPpzbCBmCcLvHC5R9++srzOVPd6MY0rvoSUKsYAIJRyGpbAWo4/sT/5wvOg5FfNBgju8/y2beYNOUb9m5goACrH2SFQa9MD3Ri9IYFRLGx8yi403uU5ad/A77J6qFFDVdMtKs+G1dQyS4zS3oTZxHjD7gmyQKnJpiACm2vvqoQ8GrsKxjMYJ/+Cvc1hbVI1l3e9E0AoQOz0RSBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771312988; c=relaxed/relaxed;
	bh=IzkumDOD7+1XANww6WVsBgEqrQiQoF04sKhAgug7qUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J2K7oKo/pB4qOLdR1g0M0BmCbevJVJ9K4uxHVvusdmJZcqK3Ls/I6v61y11oA6eeqqidXn4fTHuY3+FzOQy9fVOiCgxfM11L5Hoyz6n35LorWcwz1UpQSoHP9aZqBwVvnUHiXi3M40SYbe0Q15UsazvfXWPDlLmJvxZSobXnlLcYTefMUDlgjlnzFznbGnFCIkUXVR4D7f5SR5p6B3D9ubDC6XTJdRtlUMP1Dm+5haz4PmJfpql46qrixxzqa0nhcE+etzh9M1xB+TyxCYIc/pbBupj0hGrMv4aDIoDxH6QTCO83z7H1+DwNj72uVo/HUYW2LpF0Y1Az8FxU2YFl2A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XLgqxjkR; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b134; helo=mail-yx1-xb134.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XLgqxjkR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b134; helo=mail-yx1-xb134.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yx1-xb134.google.com (mail-yx1-xb134.google.com [IPv6:2607:f8b0:4864:20::b134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fFWMH2c9jz2xN5
	for <openbmc@lists.ozlabs.org>; Tue, 17 Feb 2026 18:23:06 +1100 (AEDT)
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-649df393c04so3376400d50.1
        for <openbmc@lists.ozlabs.org>; Mon, 16 Feb 2026 23:23:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771312984; cv=none;
        d=google.com; s=arc-20240605;
        b=Ya1v5xU7KQepCtEonjFWGp03Asqs4KiRVDjv3E1EOBd7B6eHRUFoa55dFOP5Ku15k5
         5le3tI9bfwgPy7+tdlVYy12gyT17Wm4sEuN+yZEBobC9rW5TsKqbiQwy/WLuCy+q+J3F
         +IYxI4nB7pb/dp3TM88EpL9YkkaMlCN5xe07e/ZystJmJUPTCuD/5VxeaL7APH3fuwgb
         hxt7yjieZz4mLv6StUg9f4yIbwrZzcjLfCtSHkf9lfrhwPQZoEV8J6+PmOg7CPWISEg6
         4aSgUhNoW0zdCO9uh8jM/2T2OdeiAkitBxPP506S12wHhX05/ln5H/2UrQCtV5Cavpeu
         LhBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IzkumDOD7+1XANww6WVsBgEqrQiQoF04sKhAgug7qUE=;
        fh=KdVjWp3MuMohp51GsBNXbH+Gv5V5uGuXfZUnRXI/VHU=;
        b=cmGYphFuAl10Me4TVTkW+/1svNhPL05wshaDZspIjb1Eoll7vx1kj8BmumtTPv6r4M
         CBz2kQN8FcjS0E8ip12zn62dPVN10k4Cszz8qr6JOgnsINLt4VI6623xKF6/yzbQzVsa
         6GIjWkBUirs0CV1qthpBjSs7yDQlcHLFPtGIdQBKuVvDVSx7W6xH++vKtKyVYmGQ0PSJ
         WKn6y7QHs99q3+I7YZvS9ewxycltgmOMuYeu40mXyY9WRDfoMrI66Mfigx7XzbA+EaXQ
         CsOsAR6hc4s/QiQywIABPvLQQOIeNy6Hb6SeHMaEMsW9OwlWwyS2hE1f/E9GWruKmKBT
         e5NA==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771312984; x=1771917784; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IzkumDOD7+1XANww6WVsBgEqrQiQoF04sKhAgug7qUE=;
        b=XLgqxjkREgG4fGRkm5qxNFec295dzxi8RffrDt85o/CFJxepyBD8YmygSxlX2TXCmg
         zBzLMP1cYzferENU6UFQC0QRE/eBDdgiQojRJNaThLDthoGLhKoWMM2NW9z0abYpkyQe
         rQyE9Gk4rsxXiplwCPLfteoG/IZ6W14Fq+xnBDC/eQ6DMGDtlbOwYfMsV+37OurxW1iw
         tymxf359bl6VI5+/xWCgCzx/ozwHotuB7U7g3KiCLOgmpJkvfpnbMLnvdk2lX0SM6vMG
         pt1Uesv55bOpS28JYWupT7Rhsu/2Bxofex2wMVUNlsM+As5i3QU3t/vOIc+XAh+Js2Dy
         AUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771312984; x=1771917784;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IzkumDOD7+1XANww6WVsBgEqrQiQoF04sKhAgug7qUE=;
        b=ZLXusJeeVv9wL8PWGDZLjun48oiwSaR3ah+ecGCdPHwT6RHYexI1yXK5WlKwPsjvbr
         FDfEjTNqGjMAf82H/aZv7D9VMYCB2mEo4dJR4vf0nkJHb+1l7mbwqQIJrer2Pj0J+ag2
         2Zsj8k4dFpJRLxGfzGUB0w2V0xQZo5E6p5rY3dBMJ8lAm8O8tmEiR3VB5VfSZvlnkRjI
         rDZDdNnW7JXvx9q0j6vFcGnuHLik2tfzL4HXBxvowWHocLETLTlcGpj+8tRSyeM8qmVa
         aPLwkXXB6QGSSmkUIHXQsuaPT6s3choUlsow8+lNdmb3YCDujMeZxYFqI+mtfbXiHbV4
         SAaA==
X-Forwarded-Encrypted: i=1; AJvYcCX6V6rqWcNN8ePkicv4uoNJEzys31+FBP89tcrYwp4rIH6ryssiauH8e7buiNYUbmFdyjJ5hyur@lists.ozlabs.org
X-Gm-Message-State: AOJu0YygFIkw00XLqddhOTFvRraGoaTg8Ud8Et9XxN8nWZotA+i4EsUa
	0GDxtsQwp/ZpEObBxEAT6S8fs7LfB2abSYaEQHhSHrW+mNMeXxPTjqLSXqZdTaWwO0WWPB4Tm+Z
	L448+TuzxzSGMYI76PfoM2Mu6bK3fMh8=
X-Gm-Gg: AZuq6aLuY9ZrnepeCZ1m7G89+IV889XiZkRgQsND9ML4dz532DjLVqq0FPUFEWp1XQP
	Z4GL3/eIWYTs/JI45KKYmz64mDhQ/uj7Moh5mshYyzv+jlcjt8F4+4BXQS5L+Sn4U96ek0e8jjI
	Itt5BwVHZmtOC0rJjN9MTUNSIBtxi7eiQ75xHxIlrpkbSe8kGpNAETQvqT6EcKXQxn5WZG+S6Jr
	WIevB+rjpxwloWpLq1W8SwvdgF/NaJ3plYfVqg8EU2b5LjShAl5ko3u/A/gjGOUch84yJ4mnb7h
	BhebkdAi
X-Received: by 2002:a53:c244:0:b0:649:d26a:d8b4 with SMTP id
 956f58d0204a3-64c19b5e44bmr6624247d50.78.1771312983968; Mon, 16 Feb 2026
 23:23:03 -0800 (PST)
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
 <1522cec8-8259-4404-86fa-18bd91473087@kernel.org> <CAP6Zq1iWpHc-Rsq62iBN0VtYmYS2=KhU12TE_5nxztr+HbB+tA@mail.gmail.com>
 <20260216-prompt-boisterous-worm-fed8d9@quoll> <CAP6Zq1gRd8zDi1rOkX+2x3WP0ZGnULaJ0cGS6bwpRpcmQNmRCA@mail.gmail.com>
 <52f9b04a-256a-4559-b3e6-28fe695e1b6d@kernel.org>
In-Reply-To: <52f9b04a-256a-4559-b3e6-28fe695e1b6d@kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 17 Feb 2026 09:22:52 +0200
X-Gm-Features: AZwV_Qh6VrN3JXe667reIy4T4MqlT1QtXJ51L6gy2XzX7bOXUUdUAeFSq6XPV6o
Message-ID: <CAP6Zq1jHS1dUZht76-FqC3HGZLNdpY9XhXYPwrBymnwM9iaAeA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: watchdog: Add NPCM reset status support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andrew@codeconstruct.com.au, avifishman70@gmail.com, tali.perry1@gmail.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, venture@google.com, yuenn@google.com, 
	benjaminfair@google.com, joel@jms.id.au, openbmc@lists.ozlabs.org, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000320dbc064afff171"
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andrew@codeconstruct.com.au,m:avifishman70@gmail.com,m:tali.perry1@gmail.com,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:venture@google.com,m:yuenn@google.com,m:benjaminfair@google.com,m:joel@jms.id.au,m:openbmc@lists.ozlabs.org,m:linux-watchdog@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:taliperry1@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[tmaimon77@gmail.com,openbmc@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-1385-lists,openbmc=lfdr.de];
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
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[openbmc,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 2BA091492FC
X-Rspamd-Action: no action

--000000000000320dbc064afff171
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 17 Feb 2026 at 09:12, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 17/02/2026 07:53, Tomer Maimon wrote:
> > On Mon, 16 Feb 2026 at 20:03, Krzysztof Kozlowski <krzk@kernel.org>
> wrote:
> >
> >> On Mon, Feb 16, 2026 at 04:59:18PM +0200, Tomer Maimon wrote:
> >>> On Mon, 16 Feb 2026 at 16:48, Krzysztof Kozlowski <krzk@kernel.org>
> >> wrote:
> >>>>>>>>> +  syscon:
> >>>>>>>>
> >>>>>>>> First iteration. See "How to Get Your DT Schema Bindings Accepte=
d
> >> in
> >>>>>>>> Less Than 10 Iterations"
> >>>>>>>>
> >>>>>>> Thanks, it was very helpful.
> >>>>>>> the syscon property is already found in the WD node
> >>>>>>> in nuvoton-common-npcm8xx.dtsi file, what should I do:
> >>>>>>
> >>>>>> How is that file related to this binding?
> >>>>>>
> >>>>>> Either you document existing ABI or you add new (for new device).
> >> Commit
> >>>>>> msg MUST be explicit about it and provide the reasons. If wrong
> >> (e.g.
> >>>>>> discouraged) ABI was already used then it depends how and when it
> >> got
> >>>>>> into the kernel, e.g. if someone bypassed DT completely just to ge=
t
> >> it
> >>>>>> inside.
> >>>>>>
> >>>>> The syscon property is already used in the upstream NPCM8xx DTSI
> >> watchdog
> >>>>> node, so I will document it as existing ABI and mark it deprecated.=
 I
> >>>> will
> >>>>
> >>>> And how it is used? I cannot find its usage, so I do not agree on
> >>>> documenting it. Property should be removed or at least provide the
> >>>> justification/impact of removal, if you need it to stay.
> >>>>
> >>>> Understood. The syscon phandle is used by the watchdog driver to rea=
d
> >> and
> >>
> >> You messed up quotes.
> >>
> >> Can you point me to the line? I REALLY want to be sure that we are not
> >> wasting each other time, e.g. me looking at wrong code or you telling =
me
> >> some bollocks from downstream.
> >>
> > The syscon property is not used in the current upstream npcm_wdt driver=
.
> > It is used *in this patch set*, which introduces the function
>
> Why would that matter for the ABI?
>
> So no, your buggy DTS sneaked into the kernel before submitting bindings
> is not acceptable thus ABI which was NEVER reviewed must be removed.

It will be removed from the DTSI.
I=E2=80=99ll send a new patch set that adds proper reset=E2=80=91indication=
 support using a
new nuvoton,sysgcr phandle.

>
>
> Best regards,
> Krzysztof
>

Best regards,

Tomer

--000000000000320dbc064afff171
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 17 Feb =
2026 at 09:12, Krzysztof Kozlowski &lt;<a href=3D"mailto:krzk@kernel.org">k=
rzk@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On 17/02/2026 07:53, Tomer Maimon wrote:<br>
&gt; On Mon, 16 Feb 2026 at 20:03, Krzysztof Kozlowski &lt;<a href=3D"mailt=
o:krzk@kernel.org" target=3D"_blank">krzk@kernel.org</a>&gt; wrote:<br>
&gt; <br>
&gt;&gt; On Mon, Feb 16, 2026 at 04:59:18PM +0200, Tomer Maimon wrote:<br>
&gt;&gt;&gt; On Mon, 16 Feb 2026 at 16:48, Krzysztof Kozlowski &lt;<a href=
=3D"mailto:krzk@kernel.org" target=3D"_blank">krzk@kernel.org</a>&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 syscon:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; First iteration. See &quot;How to Get Your=
 DT Schema Bindings Accepted<br>
&gt;&gt; in<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Less Than 10 Iterations&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Thanks, it was very helpful.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; the syscon property is already found in the WD=
 node<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; in nuvoton-common-npcm8xx.dtsi file, what shou=
ld I do:<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; How is that file related to this binding?<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Either you document existing ABI or you add new (f=
or new device).<br>
&gt;&gt; Commit<br>
&gt;&gt;&gt;&gt;&gt;&gt; msg MUST be explicit about it and provide the reas=
ons. If wrong<br>
&gt;&gt; (e.g.<br>
&gt;&gt;&gt;&gt;&gt;&gt; discouraged) ABI was already used then it depends =
how and when it<br>
&gt;&gt; got<br>
&gt;&gt;&gt;&gt;&gt;&gt; into the kernel, e.g. if someone bypassed DT compl=
etely just to get<br>
&gt;&gt; it<br>
&gt;&gt;&gt;&gt;&gt;&gt; inside.<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; The syscon property is already used in the upstream NP=
CM8xx DTSI<br>
&gt;&gt; watchdog<br>
&gt;&gt;&gt;&gt;&gt; node, so I will document it as existing ABI and mark i=
t deprecated. I<br>
&gt;&gt;&gt;&gt; will<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; And how it is used? I cannot find its usage, so I do not a=
gree on<br>
&gt;&gt;&gt;&gt; documenting it. Property should be removed or at least pro=
vide the<br>
&gt;&gt;&gt;&gt; justification/impact of removal, if you need it to stay.<b=
r>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Understood. The syscon phandle is used by the watchdog dri=
ver to read<br>
&gt;&gt; and<br>
&gt;&gt;<br>
&gt;&gt; You messed up quotes.<br>
&gt;&gt;<br>
&gt;&gt; Can you point me to the line? I REALLY want to be sure that we are=
 not<br>
&gt;&gt; wasting each other time, e.g. me looking at wrong code or you tell=
ing me<br>
&gt;&gt; some bollocks from downstream.<br>
&gt;&gt;<br>
&gt; The syscon property is not used in the current upstream npcm_wdt drive=
r.<br>
&gt; It is used *in this patch set*, which introduces the function<br>
<br>
Why would that matter for the ABI?<br>
<br>
So no, your buggy DTS sneaked into the kernel before submitting bindings<br=
>
is not acceptable thus ABI which was NEVER reviewed must be removed.</block=
quote><div style=3D"font-size:14px;line-height:20px"><font face=3D"arial, s=
ans-serif">It will be removed from the DTSI.<br></font></div><div><font fac=
e=3D"arial, sans-serif"><span style=3D"font-size:14px">I=E2=80=99ll send a =
new patch set that adds proper reset=E2=80=91indication support using a new=
 </span><code style=3D"font-size:14px">nuvoton,sysgcr</code><span style=3D"=
font-size:14px"> phandle.</span>=C2=A0</font></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><br>
<br>
Best regards,<br>
Krzysztof<br></blockquote><div><br></div><div>Best regards,</div><div><br><=
/div><div>Tomer=C2=A0</div></div></div>

--000000000000320dbc064afff171--

