Return-Path: <openbmc+bounces-1383-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOI9MIsQlGnS/gEAu9opvQ
	(envelope-from <openbmc+bounces-1383-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Tue, 17 Feb 2026 07:54:03 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 806E0149143
	for <lists+openbmc@lfdr.de>; Tue, 17 Feb 2026 07:54:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fFVjd5vZDz2xjP;
	Tue, 17 Feb 2026 17:53:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::b12a" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771311237;
	cv=pass; b=noyn9tSqf7iQI4dkQg8DMi1NABANTIcBrbWwC8az+51H+Cq0901N1MRJNaG/7bFDqbivTO8nHnlQ2FVDpxQ/2FILXvzhd3a2jhk79R9Dkc0weC2j4GIhSVVetZ+Nnq1jeQ44RWaDWwczw2erLxtOX1aCV0yZf08BvBQGj0hPXuZvSe+sZ7o7HaqQPFT+Qt+fOCc9jZpMdk+VCHkQNVpZXltxNz7fS52hf32dj9wGi/bkiGffMZc8uWAoo+sj+l05CGjf5OeeqA7Wnd43Bd/QzvKvJNTIHP40CVRrfD4iPQ9LimT1397u/c+jiICw0Op8DrwUBZSNwAN1GnEr5G9cqw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771311237; c=relaxed/relaxed;
	bh=fWSVAQGlajcmbPXzYWuz8q6AKshPTNxq1CI+Oe0XkIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ENzokq6H8G38J5l5/rvaveHhq/ktJH3jE1FMNSbh2InvkUJHZ9JXyc60KExdPb+x/f/bZo8ZMZypV2cJ71orfRNOgKyrBbT0hIkh/vWou+FY6fnO3V/+WFDiCR7L3mSk8bTIUYNtBewxblQ8bu4CoRf4bOHf+vUEsnoAmvsKTni18f6DVpy5Fp1N0kQmdZspFqX8H+Y+h+ogevsLKUW64IE9ac7HwLWjp59Bbp6cPm8Pe9mS7+DDdofwH8HXlPzOkGcrw0WaHbo9yh2WvYFMiiyjj9LTQAHxPRLTHqoWmDKs8U8ZhiwEuqAhN6QrkdEokQWi2i9Jp9fMw4HAnoaK9w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FETY76YO; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b12a; helo=mail-yx1-xb12a.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FETY76YO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b12a; helo=mail-yx1-xb12a.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yx1-xb12a.google.com (mail-yx1-xb12a.google.com [IPv6:2607:f8b0:4864:20::b12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fFVjb07DSz2xN5
	for <openbmc@lists.ozlabs.org>; Tue, 17 Feb 2026 17:53:54 +1100 (AEDT)
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-649df3c22d4so3285545d50.3
        for <openbmc@lists.ozlabs.org>; Mon, 16 Feb 2026 22:53:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771311230; cv=none;
        d=google.com; s=arc-20240605;
        b=NyQWcEPpYt8Sb7cpx0Z0fbq2T0j5qGKxgO7MT0LVi6I3Pqu8nNi+W/hTXvejq5tiFs
         UDPKltRL4tD5PfGFu462TyEC0jD80B86Mo/NfZzsiGuEhKHxInW/2hybb86qbZt2XbnM
         2KOkM6g5ZMxA7zmf5tjSRy9GG6iIV9wbjzNRAVwEeZSH/bodjylcUFIY0sACddYhGfbB
         5MDs2b/HeniSNN5qhZ5dwNXv4OO0c8xr0Eyb5/rpTw7Ih6dLJdzBXkvTsVzPqZQRcSRV
         uRHZfV+9noSg+efTCFtNQPDhMjvDXTRZ2eyGaBVVpv6io0Ph4DG9P7gPFNeMN5Pnohu9
         3Y1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fWSVAQGlajcmbPXzYWuz8q6AKshPTNxq1CI+Oe0XkIs=;
        fh=co+ZgbZZh5uIAiOjOy+ZEP18O0IdhZaCMGQ1FiRNL+s=;
        b=DM7mkqPs12dH1+mJFvSWBWWMjBtoeRs4c3LGWUxThkDe1v7mZ0AMEhMTWxN1bO/wjr
         ZVqyZ/iRuCjCK8KVS3YssgKqHpEjgMdx5rZSCIKWs9KRRZVcPravjU/+4mdjlrwQIbpv
         NWZSU2ycefjgk8uIJbhu9v9rhzp/WZdmx0JUA4VdAEKQ4SxHbSUqTTsCHhwyI/Jj8zK0
         udFeQPoIoPpxw6seOIf+aMGASLn/pVfVgUzwdv3/mboLj6fLd8WfdWV2Q4OU31pb/w5G
         OZxa+d8O56ewiOaiopWD2An7SRSQ5GBGylp2VyuDDrtiVu5YebTk9KVEMtqCRf1F2HkU
         IN0g==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771311230; x=1771916030; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fWSVAQGlajcmbPXzYWuz8q6AKshPTNxq1CI+Oe0XkIs=;
        b=FETY76YOSF/GTqdxQHVkBm35vVFq7CvDVFlwQtc1ftjj4jCw4uHEXIv+Mww7Jsfl6i
         rVHVwJAWc+YT4+4CkD5XnlLEsG7J5ChhS5Hr+MgObbO2S80+avY9ixODn8pGFmUmJza2
         y0L3wAvBM89xICKvbEBX4KBIG6T8EqQWBbEdnVwq69RSrVvwn9BwCewQQTzePI3jqiLf
         k34PUNdfc2eB5HMO/fcy38ZzG78QLzLQEN9iM4Rj2SPkBZjvojeaJom/c9BuzUQ8ZvHb
         igUrm2GPhJd2rQgCWEVICOAsOzQHvNiTg3MNMUO8+ei2CtuDlD1r5klGAolu9y0ADB+q
         4kuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771311230; x=1771916030;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWSVAQGlajcmbPXzYWuz8q6AKshPTNxq1CI+Oe0XkIs=;
        b=KhRsxsuBhOCeTii5uOHJnQwtRTd0VWpe39HHxl0I4pJgaB9+QG7sa7zM87gsuDL8vp
         5yu2It0LtLKs2FUFBdjuC6tJCbMrHdacudKz26k+Q2nr1R8Q++bUF/q2nwp35n9IFTOh
         sw8SfwyoNT+p1Vvp+DePBXcOtEbAX/o52j5zE01eTRk0p+r2TYlQwjMGH1jJVF+Q9i0v
         5JiAEajG6GW3024y5whmQ2myGr4s0371oLNrholrao13fe8MFPGYv4U+s29ZuHKw9oYq
         3uXCmoHW5isAZ0k9cwQYvxma8n4Lr7JYtW08KcBwLY2oc3E6ZP42kx6mqCXsEZI0WvPO
         Xf4g==
X-Forwarded-Encrypted: i=1; AJvYcCVqxLomnOoXtnDCmzjQkydqwap5bBWymCdW85gvO3iFuzcHtqfOZc1qIZkvnU7rqzY1jbGLKnFw@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxgaOrXNrUPYMm6qaP0X9rjLulhDbKgrBuKe8GeYppNK6geP8PZ
	In9Eoyid/VOLNOraGoUBAeHjCn+JCYac33SmMJQEzgAXdLz/7bVDFIxWN5KXX99bGARxj3dvWfT
	kN3IGuMB8J+Mbm2wGLeBZH1EFlnyM5TI=
X-Gm-Gg: AZuq6aKMsjz9wRdxKM9BCMnfMe73JyKN7WXrq/L0G4mEMrzNJDFASEaGU8UGRCKk+CL
	HEbSRBNQRBd7tkRhh8il2oKwQWzItelHFKQ9IiuB00w7v+Nw1jiqtrtyTH1Z+2B4B5KeZMD5PQE
	VihqfMZsYmu4F5pKkcRoI0SHjnXB+JIaEGEu23mybWSBqnHGCUuEwKp1tczP1/4+4woyIQPgLOT
	OC2IjhfOgq34mcRwwsYukRnz9JEY7CSyMknQZX/SyoOOs/UWFnkAbHcpEcFfSLohdQYN/VlVb4A
	kAK5q/D5lWuYS3Lr6Lo=
X-Received: by 2002:a05:690e:b46:b0:649:cbdc:c491 with SMTP id
 956f58d0204a3-64c21b83fbemr6967437d50.84.1771311230562; Mon, 16 Feb 2026
 22:53:50 -0800 (PST)
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
 <20260216-prompt-boisterous-worm-fed8d9@quoll>
In-Reply-To: <20260216-prompt-boisterous-worm-fed8d9@quoll>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 17 Feb 2026 08:53:39 +0200
X-Gm-Features: AZwV_QgIA5W3BwyMf3qo8onR6uZ8-oOwq4f-lq8mw7kjPHiqF11ooXYZh9emTc0
Message-ID: <CAP6Zq1gRd8zDi1rOkX+2x3WP0ZGnULaJ0cGS6bwpRpcmQNmRCA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: watchdog: Add NPCM reset status support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andrew@codeconstruct.com.au, avifishman70@gmail.com, tali.perry1@gmail.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, venture@google.com, yuenn@google.com, 
	benjaminfair@google.com, joel@jms.id.au, openbmc@lists.ozlabs.org, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000af3528064aff884b"
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andrew@codeconstruct.com.au,m:avifishman70@gmail.com,m:tali.perry1@gmail.com,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:venture@google.com,m:yuenn@google.com,m:benjaminfair@google.com,m:joel@jms.id.au,m:openbmc@lists.ozlabs.org,m:linux-watchdog@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:taliperry1@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[tmaimon77@gmail.com,openbmc@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-1383-lists,openbmc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 806E0149143
X-Rspamd-Action: no action

--000000000000af3528064aff884b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 16 Feb 2026 at 20:03, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On Mon, Feb 16, 2026 at 04:59:18PM +0200, Tomer Maimon wrote:
> > On Mon, 16 Feb 2026 at 16:48, Krzysztof Kozlowski <krzk@kernel.org>
> wrote:
> > > >>>>> +  syscon:
> > > >>>>
> > > >>>> First iteration. See "How to Get Your DT Schema Bindings Accepte=
d
> in
> > > >>>> Less Than 10 Iterations"
> > > >>>>
> > > >>> Thanks, it was very helpful.
> > > >>> the syscon property is already found in the WD node
> > > >>> in nuvoton-common-npcm8xx.dtsi file, what should I do:
> > > >>
> > > >> How is that file related to this binding?
> > > >>
> > > >> Either you document existing ABI or you add new (for new device).
> Commit
> > > >> msg MUST be explicit about it and provide the reasons. If wrong
> (e.g.
> > > >> discouraged) ABI was already used then it depends how and when it
> got
> > > >> into the kernel, e.g. if someone bypassed DT completely just to ge=
t
> it
> > > >> inside.
> > > >>
> > > > The syscon property is already used in the upstream NPCM8xx DTSI
> watchdog
> > > > node, so I will document it as existing ABI and mark it deprecated.=
 I
> > > will
> > >
> > > And how it is used? I cannot find its usage, so I do not agree on
> > > documenting it. Property should be removed or at least provide the
> > > justification/impact of removal, if you need it to stay.
> > >
> > > Understood. The syscon phandle is used by the watchdog driver to read
> and
>
> You messed up quotes.
>
> Can you point me to the line? I REALLY want to be sure that we are not
> wasting each other time, e.g. me looking at wrong code or you telling me
> some bollocks from downstream.
>
The syscon property is not used in the current upstream npcm_wdt driver.
It is used *in this patch set*, which introduces the function
npcm_get_reset_status(). Inside that function, the code calls:
gcr_regmap =3D syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
to obtain the GCR regmap, read the reset=E2=80=91status registers, clear th=
em, and
report the reset cause via the watchdog bootstatus.
This usage is shown here:
https://www.spinics.net/lists/kernel/msg6045622.html
In addition, the watchdog maintainer confirmed that the reset cause can be
exposed without the deprecated reset=E2=80=91type DT properties:
https://www.spinics.net/lists/kernel/msg6052106.html

Given this, should I remove the unused syscon phandle from the NPCM8xx DTSI
first, since no upstream driver currently uses it and it is therefore not
part of the ABI?
In this patch set, I am adding the first upstream usage of the GCR regmap
in the watchdog driver, so I plan to introduce the new, preferred
nuvoton,sysgcr property in the binding and use it in the DTSI, without
keeping the old syscon name unless you think backward compatibility is
needed.

Please let me know if you prefer that I update the DTSI first or include
the DTSI and binding changes in the same series.

>
> > clear the GCR reset=E2=80=91status registers and then report the reset =
cause
> > through the watchdog bootstatus bits.
> > Therefore, this property should appear in the binding only because the
> > watchdog driver actually uses it =E2=80=94 which I am implementing in t=
his patch
> > set.
> > I will document it accordingly, and also add the new nuvoton,sysgcr
> phandle
> > as the preferred name.
>
> Best regards,
> Krzysztof
>
>
Best regards,

Tomer

--000000000000af3528064aff884b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 16 Feb 2026 =
at 20:03, Krzysztof Kozlowski &lt;<a href=3D"mailto:krzk@kernel.org" target=
=3D"_blank">krzk@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">On Mon, Feb 16, 2026 at 04:59:18PM +0200, Tomer =
Maimon wrote:<br>
&gt; On Mon, 16 Feb 2026 at 16:48, Krzysztof Kozlowski &lt;<a href=3D"mailt=
o:krzk@kernel.org" target=3D"_blank">krzk@kernel.org</a>&gt; wrote:<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 syscon:<br>
&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt; First iteration. See &quot;How to Get Your DT Sc=
hema Bindings Accepted in<br>
&gt; &gt; &gt;&gt;&gt;&gt; Less Than 10 Iterations&quot;<br>
&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; Thanks, it was very helpful.<br>
&gt; &gt; &gt;&gt;&gt; the syscon property is already found in the WD node<=
br>
&gt; &gt; &gt;&gt;&gt; in nuvoton-common-npcm8xx.dtsi file, what should I d=
o:<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; How is that file related to this binding?<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Either you document existing ABI or you add new (for new=
 device). Commit<br>
&gt; &gt; &gt;&gt; msg MUST be explicit about it and provide the reasons. I=
f wrong (e.g.<br>
&gt; &gt; &gt;&gt; discouraged) ABI was already used then it depends how an=
d when it got<br>
&gt; &gt; &gt;&gt; into the kernel, e.g. if someone bypassed DT completely =
just to get it<br>
&gt; &gt; &gt;&gt; inside.<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; The syscon property is already used in the upstream NPCM8xx =
DTSI watchdog<br>
&gt; &gt; &gt; node, so I will document it as existing ABI and mark it depr=
ecated. I<br>
&gt; &gt; will<br>
&gt; &gt;<br>
&gt; &gt; And how it is used? I cannot find its usage, so I do not agree on=
<br>
&gt; &gt; documenting it. Property should be removed or at least provide th=
e<br>
&gt; &gt; justification/impact of removal, if you need it to stay.<br>
&gt; &gt;<br>
&gt; &gt; Understood. The syscon phandle is used by the watchdog driver to =
read and<br>
<br>
You messed up quotes.<br>
<br>
Can you point me to the line? I REALLY want to be sure that we are not<br>
wasting each other time, e.g. me looking at wrong code or you telling me<br=
>
some bollocks from downstream.<br></blockquote><div style=3D"font-size:14px=
;line-height:20px"><font face=3D"arial, sans-serif">The=C2=A0<code style=3D=
"">syscon</code> property is not used in the current upstream <code style=
=3D"">npcm_wdt</code> driver.<br></font></div><div><font face=3D"arial, san=
s-serif"><span style=3D"font-size:14px">It is used </span><strong style=3D"=
font-size:14px">in this patch set</strong><span style=3D"font-size:14px">, =
which introduces the function </span><code style=3D"font-size:14px">npcm_ge=
t_reset_status()</code><span style=3D"font-size:14px">. Inside that functio=
n, the code calls:</span></font></div><div><span style=3D"color:rgb(0,0,0)"=
><font face=3D"arial, sans-serif">gcr_regmap =3D syscon_regmap_lookup_by_ph=
andle(dev-&gt;of_node, &quot;syscon&quot;);</font></span></div><div><div st=
yle=3D"font-size:14px;line-height:20px"><font face=3D"arial, sans-serif">to=
 obtain the GCR regmap, read the reset=E2=80=91status registers, clear them=
, and report the reset cause via the watchdog <code>bootstatus</code>.</fon=
t></div></div><div style=3D"font-size:14px;line-height:20px"><div style=3D"=
line-height:20px"><font face=3D"arial, sans-serif">This usage is shown here=
:<br>
<a href=3D"https://www.spinics.net/lists/kernel/msg6045622.html">https://ww=
w.spinics.net/lists/kernel/msg6045622.html</a></font></div><div style=3D"li=
ne-height:20px"><div style=3D"line-height:20px"><font face=3D"arial, sans-s=
erif">In addition, the watchdog maintainer confirmed that the reset cause c=
an be exposed without the deprecated reset=E2=80=91type DT properties:<br>
<a href=3D"https://www.spinics.net/lists/kernel/msg6052106.html">https://ww=
w.spinics.net/lists/kernel/msg6052106.html</a></font></div><div style=3D"li=
ne-height:20px"><div style=3D"line-height:20px"><p style=3D""><font face=3D=
"arial, sans-serif">Given this, should I remove the unused <code style=3D""=
>syscon</code> phandle from the NPCM8xx DTSI first, since no upstream drive=
r currently uses it and it is therefore not part of the ABI?<br>
In this patch set, I am adding the first upstream usage of the GCR regmap i=
n the watchdog driver, so I plan to introduce the new, preferred <code styl=
e=3D"">nuvoton,sysgcr</code> property in the binding and use it in the DTSI=
, without keeping the old <code style=3D"">syscon</code> name unless you th=
ink backward compatibility is needed.</font></p>
<p style=3D""><font face=3D"arial, sans-serif">Please let me know if you pr=
efer that I update the DTSI first or include the DTSI and binding changes i=
n the same series.</font></p></div></div></div></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
&gt; clear the GCR reset=E2=80=91status registers and then report the reset=
 cause<br>
&gt; through the watchdog bootstatus bits.<br>
&gt; Therefore, this property should appear in the binding only because the=
<br>
&gt; watchdog driver actually uses it =E2=80=94 which I am implementing in =
this patch<br>
&gt; set.<br>
&gt; I will document it accordingly, and also add the new nuvoton,sysgcr ph=
andle<br>
&gt; as the preferred name.<br>
<br>
Best regards,<br>
Krzysztof<br>
<br></blockquote><div><br></div><div>Best regards,</div><div><br></div><div=
>Tomer=C2=A0</div></div></div>
</div>

--000000000000af3528064aff884b--

