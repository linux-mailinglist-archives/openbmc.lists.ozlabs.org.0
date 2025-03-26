Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3234CA726A5
	for <lists+openbmc@lfdr.de>; Wed, 26 Mar 2025 23:51:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZNMT56WS2z3dXW
	for <lists+openbmc@lfdr.de>; Thu, 27 Mar 2025 09:50:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::736"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742964449;
	cv=none; b=bkcLbGlwLbyM8Y2+Ta7lmQ0fRQe86foKLsFlMrRHlKwXoBz8l342yx8TvhikENU7fkpv6lmsVfl/buyUhmJfYu0rvB/4ZN5WUxvaMK3dcmlMIFkmRlBppdSuh9KrV0m9krDwa9DV4lMpi19am9BT9CVCguDaJR9unJC61ichsNF6iQvCkDV6lNROaSadmN0ToHiTWaaeW40UbA0f8XTFcHCuo5P0xyx936fq3UIBJO9LMBS6aAsYFY5DIlzzCZq4nSj25ywj6CXO9Df+1DXQx6DgcimUX8ewChK7Xh8u20hxGL+vkwxYCBOG5DP7k4p9gSvMdfp6nlW6ENcA9s+Mfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742964449; c=relaxed/relaxed;
	bh=9fqiqMbCteFKAC24e5cTILMsm9RISHx2O5sUgxQ2zZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ph6ZS7lYWo+DxwLyHxupjHa0qYqMyiKRQoCc0ZEM/h4TchK2neBhBC7KXpn557230v5sY8Y39yEsYqVSonOHl+ocqg+YNPIoViGax2aqT1L9vREh5Yrm9BW+ncQFokQhvtDJsKy670QDWvZNgPpphm0ngrOQQfF8fB5jO2b/+aYkBc+AH8sPaTPEjdiMcqmeufKCMKFW47J/6SVZf1Tc0dgfH5k3BgQcadRw9dDHSm/75mN+MrR7n120nsRTQZExRH+Km+4TCSvTsxIOX9QzZ/i4Jj+FW7T3Q7u0kDS55goBX09tYbtPPhsbXPsXgEbrxRBK/BVpnalhvSD+veqA6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BCtc6WPp; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::736; helo=mail-qk1-x736.google.com; envelope-from=mohammed.0.elbadry@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BCtc6WPp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::736; helo=mail-qk1-x736.google.com; envelope-from=mohammed.0.elbadry@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZMvR36V3jz2yqR
	for <openbmc@lists.ozlabs.org>; Wed, 26 Mar 2025 15:47:27 +1100 (AEDT)
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7c547932d2eso384186785a.0
        for <openbmc@lists.ozlabs.org>; Tue, 25 Mar 2025 21:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742964444; x=1743569244; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9fqiqMbCteFKAC24e5cTILMsm9RISHx2O5sUgxQ2zZA=;
        b=BCtc6WPpUgs3/6hY2EXDVijUdTT9BC+zbB/4lPqSFkcnBQitaoCrWfjIjfldT7Ddrt
         hSAEcJXjcAR/FP/t1yTN7JbjpAGKLHQloN/B7yAkUsRwTPPl3nguFzVUVphSpiJFBgMg
         zJ9rjHPiOaJr0WvJaL0yhiP8nO7Xn3rkdz5xbXquJKY75vDUiv9Ppt9YW44ig3GQiFhu
         A80k176mKT1Ng6SI3G2IOC4R08ao5+fEKP6jY/U2KrpsIBJj7g362XN9WkTOF6euL2+G
         D6bEaCNhdV9iPWDoFP0kRXCjwWjpvNX/4ZjgJOSiCAJpx/7htrqqTXMXrF4Cbe1rM4nZ
         /3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742964444; x=1743569244;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9fqiqMbCteFKAC24e5cTILMsm9RISHx2O5sUgxQ2zZA=;
        b=lS3GbAlrrcZ/CnRXLrMQ+Zy0HImTerKI4y+ocCujNPqIyxcNOCEJpS34UrLxQy2HPV
         uzlXOdbpg/zaMVIfAo9oBkcdp4vOCLgJQt3g/EuWp0oZe3V0LhYvN92FcacPv3T7LkB6
         7Q9H6/HOsfdhQ61PMNNtRieb703UTnS3GdcQbZVkLemA0LNSYEJOabdodNC5bp391Kbg
         ga7xJ0Y+l2a13v3gMLPBiDdgLk7uInjeizqPO6YMcoV9xdnJdBEmhCPTDiebf+K/WzdT
         9nJTWmjUJQ2DIpUKk9V3mvG56wCx/3AI8x8osDe4GKE9J65ehiJCXNTh657mVXQ5b2DE
         8EpA==
X-Forwarded-Encrypted: i=1; AJvYcCWVbysJ0HQRkkliKPx/rso6SibeNN5twnloVak78AcJ/+6thYW8BDm3uzYZ5kKTAq/37RgE/Aef@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwzkJvkAvC+SHlxLYAUzInc7vXO2adcqxS8N6+ackBR7eQoHRdn
	MC4lvV2hzsAv84vKCygnSA/6o5P0HymQKNnU3R5W5N3I2kBBiUa4R3Xpb0f+XFtZM5V3Vkd0QQD
	jdn/1D6HhCQURbQcXgRt85YKKwI8=
X-Gm-Gg: ASbGncu8foueBuuHNHgY086XpkOXKh4gGuxN27hnhOPfPOjQXYE5DKzU42XykQbKcVt
	SaqiD9Vo4H/qDEc7FE2KgJtXXBKWFMhYTrwxZ3YQZEv2c1pPPJK2Ry800DdgqgM+BgzM0Hi8NZu
	mexdQYvKvD2U01VyAWqR/L6IoZ
X-Google-Smtp-Source: AGHT+IFfkVe3jGP+0NnlY0PtQxx32n9BdnIAxLyl1XZuBe+ItdgTcPceF6gAaVtlgFq/fe89CQrCeqNLI0XSGYKWkXM=
X-Received: by 2002:ad4:5aaf:0:b0:6e8:fee2:aade with SMTP id
 6a1803df08f44-6eb3f2e57e1mr331796706d6.25.1742964444126; Tue, 25 Mar 2025
 21:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250324203233.1266772-2-mohammed.0.elbadry@gmail.com>
 <20250324205901.1274708-1-mohammed.0.elbadry@gmail.com> <4025b7b8-e4ea-4853-83d9-7f9fd0d0f159@quicinc.com>
In-Reply-To: <4025b7b8-e4ea-4853-83d9-7f9fd0d0f159@quicinc.com>
From: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>
Date: Tue, 25 Mar 2025 21:47:13 -0700
X-Gm-Features: AQ5f1JrW1VfDLeJ1ILZ5REG92vUpoloSySFL3LqtR1X25K1HaOOPqcfaauzEDKA
Message-ID: <CAHdq5QGd=gp3PV6NoC3fxRj=g_DsaFoLfp0Z4Lm=QDfcveLphQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] i2c: npcm: Add clock toggle recovery
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Content-Type: multipart/alternative; boundary="0000000000008c63630631378804"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 27 Mar 2025 09:50:43 +1100
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
Cc: Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000008c63630631378804
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Understood, will update the patch per comment: combining log messages and
removing cover letter, thank you.

Mo

On Tue, Mar 25, 2025 at 9:46=E2=80=AFPM Mukesh Kumar Savaliya <
quic_msavaliy@quicinc.com> wrote:

>
> On 3/25/2025 2:28 AM, mohammed.0.elbadry@gmail.com wrote:
> > From: Tali Perry <tali.perry1@gmail.com>
> >
> > Hi,
> >
> > During init of the bus, the module checks that the bus is idle.
> > If one of the lines are stuck try to toggle them first.
> >
> As such there is one file change and single patch. You may go ahead
> without cover-letter. Just my thought.
> > Fixes: 76487532f797 (i2c: npcm: Add slave enable/disable function)
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > Signed-off-by: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>
> > ---
> >
> > Tali Perry (1):
> >    i2c: npcm: Add clock toggle recovery
> >
> >   drivers/i2c/busses/i2c-npcm7xx.c | 12 ++++++++----
> >   1 file changed, 8 insertions(+), 4 deletions(-)
> >
>
>

--0000000000008c63630631378804
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Understood, will update the patch per comment: combining l=
og messages and removing cover letter, thank you.<div><br></div><div>Mo</di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Tue, Mar 25, 2025 at 9:46=E2=80=AFPM Mukesh Kumar Savaliya &lt;<a href=
=3D"mailto:quic_msavaliy@quicinc.com" target=3D"_blank">quic_msavaliy@quici=
nc.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><br>
On 3/25/2025 2:28 AM, <a href=3D"mailto:mohammed.0.elbadry@gmail.com" targe=
t=3D"_blank">mohammed.0.elbadry@gmail.com</a> wrote:<br>
&gt; From: Tali Perry &lt;<a href=3D"mailto:tali.perry1@gmail.com" target=
=3D"_blank">tali.perry1@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Hi,<br>
&gt; <br>
&gt; During init of the bus, the module checks that the bus is idle.<br>
&gt; If one of the lines are stuck try to toggle them first.<br>
&gt; <br>
As such there is one file change and single patch. You may go ahead <br>
without cover-letter. Just my thought.<br>
&gt; Fixes: 76487532f797 (i2c: npcm: Add slave enable/disable function)<br>
&gt; Signed-off-by: Tali Perry &lt;<a href=3D"mailto:tali.perry1@gmail.com"=
 target=3D"_blank">tali.perry1@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Mohammed Elbadry &lt;<a href=3D"mailto:mohammed.0.elbad=
ry@gmail.com" target=3D"_blank">mohammed.0.elbadry@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; <br>
&gt; Tali Perry (1):<br>
&gt;=C2=A0 =C2=A0 i2c: npcm: Add clock toggle recovery<br>
&gt; <br>
&gt;=C2=A0 =C2=A0drivers/i2c/busses/i2c-npcm7xx.c | 12 ++++++++----<br>
&gt;=C2=A0 =C2=A01 file changed, 8 insertions(+), 4 deletions(-)<br>
&gt; <br>
<br>
</blockquote></div>

--0000000000008c63630631378804--
