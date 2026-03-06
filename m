Return-Path: <openbmc+bounces-1449-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id nC8LOZzKrGnsuQEAu9opvQ
	(envelope-from <openbmc+bounces-1449-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Sun, 08 Mar 2026 02:02:20 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DD722E301
	for <lists+openbmc@lfdr.de>; Sun, 08 Mar 2026 02:02:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fT21466V3z3bfG;
	Sun, 08 Mar 2026 12:02:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::122a" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772757179;
	cv=pass; b=fTSQbho3PkIZn0ukuESs881/N9IpOEJ+E6Dj8OGsrKcUhpkN4GyNnij4pCNrAkeAtmaA8+bvHT6EOr5qf5eypiPlS2+S8J/pkjvUOFq9jXU3k08+rSGU3mQSVNP4DclLhyw+wbBccDdXPtMBq6TZlIa1h7Kmk8HrWgzx+tqKiJUY1zbWDdaPCOKDTfCzFiOuWFHdkCLH2eEiDzQD7PJGK+pDJ5VCZL7oig6X9CGelshLBOWqXkoh7BWyfpRwpO0N+BZsZNJCSN6fY/2xHYdOFTX3IbZETMRHJHxosy4B5oTyPTXMawKtswR5Ca8NXy2P+D1dFNBYCbuIXRC7USexqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772757179; c=relaxed/relaxed;
	bh=O2yfhBqm6LiuVmC2g+xeR9jlYS3tjxG1T/qXgadUJ1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lDhNuQNhiOx+isMj08zqYEh7DBY5vnK8Jfi2CkYYKCGJdn7sahYA22gXbiMSlkIIirJwldYhj/uTNug3nf7gKtxR6Uo0PyrjpVPino0Qr8BStA1DFnj2RuEjxSKknuCS/fm5bNCb1j1fgL4B6itYjZzhZKLKq5DIwrbYev3Z0HY4t4HqE2hgwxuMiTPqgyrBb+6wVCLTbiw05TclY4xpfPC4v9HnWh3bUQywZl9976wXE7M7kD2QDCuqE3X9yHNxz6Xb8JRPs0bVbxxlId+mWcYWRUfHqUAimegw15Sgi9Jn47nOTRw48TITPyOk3Yfrg+NxbwWIJiQsG4TD+n1AKw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Mk1R8gPs; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::122a; helo=mail-dl1-x122a.google.com; envelope-from=anirudhsriniv@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Mk1R8gPs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::122a; helo=mail-dl1-x122a.google.com; envelope-from=anirudhsriniv@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dl1-x122a.google.com (mail-dl1-x122a.google.com [IPv6:2607:f8b0:4864:20::122a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fRnS960B5z3c8x
	for <openbmc@lists.ozlabs.org>; Fri, 06 Mar 2026 11:32:56 +1100 (AEDT)
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-1271257ae53so10505288c88.1
        for <openbmc@lists.ozlabs.org>; Thu, 05 Mar 2026 16:32:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772757174; cv=none;
        d=google.com; s=arc-20240605;
        b=QWk13Q0oXlD4z/o4sRSNdEaxM7u5AevgYm+nZSljFL+gHvUOn8PJzzWebMfM1d6NCX
         tCo2NImFeiRJVEhS23sMC8/DdS1DXndcLEVT0vYK43xke91orv2RCfJniyJWKfQbTO3R
         rRALDL78o+cTBvUbLu2wN8y81/LSg1I7nXrfJdBBokOIMdxz2oLuC2mH43F5Q+tk/0eI
         2suPWBwwz9yfGwr78rW9GVLr2rhq5umV8AZo2xfdm5xzcfZ+6xeHDXdWhyFGfZL5m+Id
         cbEhFVvpuT2ayTxAjXLRLSWKc7uerKx3v4Vfzoo/Elm71uVY1IcWhNWgHuAe5AFpQog4
         l39Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O2yfhBqm6LiuVmC2g+xeR9jlYS3tjxG1T/qXgadUJ1w=;
        fh=+cNISmHLXZQL1ZC0iD0zQBKXyemluM1KEzrLKjAwrG0=;
        b=KeWOAdco36OnP4zQPWh6qAJP72woZm1rjV+pS78Es6pdrntuvbL37A45L3j/HYh36g
         HKcT2MPvd6HKu0WVple18abVwiZXZMQqBPiX+EkQbVi2KUeXgR002/ZFUABpJK8WEXIK
         OkjORHUbmqnZ/CvDdwMXAe9QDVEoZ+o0Fk72HNF1KFEBTYqZwDLxNmWDPVztfFAhJ9lj
         EEgNfIKEsRUU//MRuoMUlxXPw91FmjiRO7sBsqHzVo/pKIC31PY4p/vnVl2GKBN3OPWe
         VOsY1S7Ys4uCtddEKYXYyIsLlcX1SswLwuHKEdzl4uG2V49ksJDJT1SON8/0U9VbhUhX
         5qyQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772757174; x=1773361974; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2yfhBqm6LiuVmC2g+xeR9jlYS3tjxG1T/qXgadUJ1w=;
        b=Mk1R8gPshB2sK2vLlpkW6zEcA40ETh+kipqvmrZ8unQuWe6C4SaoVV3ikFRpqgvCoj
         YxSUkZJPwDZSzC6NsLcjCW3NayxfN7hn15dD4jS+iwaOu3cy1DyOgdtxQIcr5vekfVrL
         lR6ffIv3LM83IkugJPZOlVWElrd9yFv7xKEgW608tnWYQcCCMNU7KrVXJvkfHW1mkww5
         4mdf/v0hyhCrERiEjx7aXiEjZrEERHDtSrTgo88ow54FZ+AfsjSHOd2Wcbv4j5elTj4w
         VNy7dI7Ed1U4X3Z3eoN5wDLivyHljVBIzhmp3Gaqox083S61xGxzPmwmTw0T1mxlbIxS
         Fd4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772757174; x=1773361974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O2yfhBqm6LiuVmC2g+xeR9jlYS3tjxG1T/qXgadUJ1w=;
        b=Fjoa0GxB63j8o09Z6bn1zhbFiCMbpS++2S1213nIqgeDGYnVD3DQd/QkEo8fWa5dy2
         92PSyRmz+MTxsvsFZZG4zgTm3apMVeCCtJxQa9VfHJJ94v464r0WHVtxt85Cc3IcmrSY
         VyqEw0n13s/pDnjcOzrp4gl2HJPcJTzhQzjzk8m8DFtyKbqczf/CFgxG3zU9JdCt+A+g
         dr+5xmpMBrNmL0Zpethf3uBAxoi99uxjUZ7AHWfarNpqv69YvtAI98JjbUJhZhftkfJb
         bONS4gn5RHfeHeF+rTxvXLnOqtHuJrScASI8WHcvWJ6YLUewgGg8GfelqTpi7XIyvL7L
         98Wg==
X-Forwarded-Encrypted: i=1; AJvYcCW55b2z+0ULwNYEkb/06PdUOJtny9ABwUtTERTetYlBLNlLNpGxhOUy8o2YnE1Ym0TzqrB1PHIm@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxfCU94FYMmByAx75F2etSkP9aZI/PdLvE/IDfA0Seh2NCNeFOB
	wCnaOk9wiicetkrZWWH8BDU6oSbvegYPiR29MbShcPk8GGARYW8wdZxrvgZBERXDv78WcZerodt
	1cOAO/rhYuBfg6m/lJSYKg3wI9syOtPd/i4KE
X-Gm-Gg: ATEYQzzLxS9cQhjwex4sn5WweduuYjPaC8pMSTTBOvRZgI+l8VoNsZo3A8VoPaOi38H
	nTxoE/276yVVWt0woQAoxyry0mAO+3NVLtidlRj9LMeSEvysfw+jHCZJTzBdehtayCKnjHN7BLe
	79ds4GwuxhYiwX4yi+YEvdvMOiKdn0n1hI6APDSRUWfR1r+hGu15dleXmAPr61mKp6ReNLX/ug5
	yv4ft5io+lEKFyMkpYcn9QXs8ZmD6vCnmSAP6uJmPjSYRY9hvcF5Ivq85/ATIhn+B05S0Lk8zOr
	C28wrIPWIBOe4AGw+zQS
X-Received: by 2002:a05:7022:fa5:b0:11b:ade6:45a7 with SMTP id
 a92af1059eb24-128c2d9ba25mr147185c88.1.1772757174334; Thu, 05 Mar 2026
 16:32:54 -0800 (PST)
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
References: <20260228-asus-kommando-v1-1-9a288620096d@gmail.com> <0f0a1a6862a8b94bf4f5c00da85bad4efce7c071.camel@codeconstruct.com.au>
In-Reply-To: <0f0a1a6862a8b94bf4f5c00da85bad4efce7c071.camel@codeconstruct.com.au>
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Date: Thu, 5 Mar 2026 18:32:42 -0600
X-Gm-Features: AaiRm5377Efqp7AqXEFI1TvnmUKZeizoWWxBeU39zJRSn9sd6-AXnUQS4qp75Eg
Message-ID: <CAJ13v3R-3p5mV0b3AqHyF8m4A=HnX4rrNoKQXYi69Mod=OsEmQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Add dts for ASUS Kommando IPMI card
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: joel@jms.id.au, openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: E9DD722E301
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.20 / 15.00];
	DATE_IN_PAST(1.00)[48];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1449-lists,openbmc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andrew@codeconstruct.com.au,m:joel@jms.id.au,m:openbmc@lists.ozlabs.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[anirudhsriniv@gmail.com,openbmc@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.980];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anirudhsriniv@gmail.com,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[openbmc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codeconstruct.com.au:email,lists.ozlabs.org:rdns,lists.ozlabs.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi Andrew,

On Wed, Mar 4, 2026 at 11:22=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Sat, 2026-02-28 at 22:00 -0600, Anirudh Srinivasan wrote:
> > Add dts for Asus Kommando IPMI card, an ast2600 based pcie bmc card
> >
> > Signed-off-by: Anirudh Srinivasan <anirudhsriniv@gmail.com>
> > ---
> >  arch/arm/dts/Makefile                            |  1 +
> >  arch/arm/dts/ast2600-asus-kommando-ipmi-card.dts | 98
> > ++++++++++++++++++++++++
> >  2 files changed, 99 insertions(+)

> > +
> > +&scu {
> > +     mac2-clk-delay =3D <0x08 0x04
> > +                       0x08 0x04
> > +                       0x08 0x04>;
>
> Before we go too far down this path, are you aware of the discussions
> on the kernel side?
>
> https://lore.kernel.org/all/20260302-rgmii_delay_2600-v6-0-68319a4c4110@a=
speedtech.com/
>
> Essentially, can we defer configuring the delays via the SCU here so we
> can isolate that problem in the kernel?

I've been trying to follow that discussion over the last few days, and
the more I read it, the more I get confused.

I went back and looked at the u-boot DT from the Asus fw dump [1], and
there seems to be no mac2-clk-delay in it. That uses u-boot 2019 too.
Not sure how accurate/useful this info is though.

So (correct me if I am wrong)
1. If we don't need this clk delay at all, then I can skip this
clk-delay entry in u-boot and use "rgmii-id" in the linux and u-boot
DTs.
2. If we need this clk delay, u-boot is supposed to configure it
(u-boot DT uses "rgmii") and linux uses "rgmii-id". We don't need to
worry about u-boot patching the linux DT because both use separate
DTs.

This feels like something I should be able to test without any patches
to u-boot/linux. Just try booting u-boot with 2 different DTs (one
with rgmii and one with rgmii-id) and see which scenario networking
works.

Is anything I'm saying correct?

>
> I recognise that you might want networking in u-boot as well though :)

I then read this statement and got confused a bit more.

[1] https://gist.github.com/Genius1237/0b81fcbc8c25a8b516e63e466e8522b1

>
> > +};
> > +
> > +&sdrammc {
> > +     clock-frequency =3D <400000000>;
> > +};
> > +
> > +&uart5 {
> > +     status =3D "okay";
> > +     u-boot,dm-pre-reloc;
> > +};
> > +
> > +&wdt1 {
> > +     status =3D "okay";
> > +};
> > +
> > +&wdt2 {
> > +     status =3D "okay";
> > +};
> > +
> > +&wdt3 {
> > +     status =3D "okay";
> > +};
> >
> > ---
> > base-commit: d40130c7056b84dc5213f3ff6764d0e45bb84035
> > change-id: 20260228-asus-kommando-9de4d6b779a8
> >
> > Best regards,



--=20
Regards
Anirudh Srinivasan

