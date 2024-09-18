Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD77B97BF53
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2024 18:53:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X84Tn6fDDz30W5
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2024 02:53:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::22a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726678394;
	cv=none; b=R70M8anDU3u7cjXSeHHICxQgWXrpIf81aHGY1tsuZtSfvOZJiheL6/hX5FJqbnJWY2le/+Kdsdfnx+2F9uSbFcGH5HIjj3dtAZgFk7hEDEfm3DClQ6aQmIhs3vP0Qu0R1W9EFm7KsKJ8hmUm9iJ4dZluGAWzPs6AjpV6sm3+3f7Mau8VRVHLkKDPFyNLhwkwBDg5KUYgZKuAt1gVpvzJDzKJZeSnpjyDaHsAbhE9+JvCY8NeROBRfuuS27wj95MjZkENPImqvpXtf/eo2tyZKgMZhA7c9sq8iXCKriHZwQf5wzhEzo0wW2RzhjaO77or04/J+YAmamDl2F5pyiEJ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726678394; c=relaxed/relaxed;
	bh=+60sDoqgEZiOl4CoM/RIV7YgE0mnbCcBerJVnCOzyyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=djlhZwQjkJrUHWOEpj9HGRqx+BqSaiMdwl8EI68+HIG7/gyHHBjLK80sdxBIu1jVy7OQD0q2QIil8VR5VdtBhyYT72o6IQG7m0D7giZuFPU6Bq6loEWXlKnW/Zs/hpNk2FbaN6/+EeJZTbeC5Mno9TQY0/D5TczyMQ1rYDDcgxi5/zIaJCcs1l+ovAjkOtwC0pxtuTRzs3STbbBnOTJ//g1FRipe+LMKmZN3e0jqyCAMqXii5oWKNXFXcsl3Zpqsz9bVQ4nyzpjOKO6RJhIqwE5UUq1QBpF72pNbqXKTKMgNpruZ5VDUR0ibug86N37U9ZHFb6VRWRp6Xos72fDeIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JmaR4WNF; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com; envelope-from=ojayanth@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JmaR4WNF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com; envelope-from=ojayanth@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X84Tk1H0Gz2xG5
	for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2024 02:53:13 +1000 (AEST)
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3e04b7b3c6dso3549424b6e.2
        for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2024 09:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726678390; x=1727283190; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+60sDoqgEZiOl4CoM/RIV7YgE0mnbCcBerJVnCOzyyE=;
        b=JmaR4WNF65NxHetBrkU66WFVLsveoZqfzpOO03BXAminmZsiH3ivaYPaLFf9BRVWgt
         fQBu92dHty8B/FrcqG9RN5AxZBcZrivc45HlNwcQMeWIyP5nfgvueA15DhikFgfKVbp5
         f3VAaxgyu0smijLyMOmZxxlBUvETDU03i7i9mRWjNbALlhBXjnRffn44KTIcLDwIdl/G
         Lr1TUa/Gn/lteNl6WA+431X2Mci9ElFoypoVdwcN7VAmaSKa/rtwLgp1EzznQgdvM7RO
         ZvmjkR0o0vS6fxLE9nQRJt4W+BTlrDhYXE3tHaD3ugvlEZblfV+qEdhtZIbW3x7bprhl
         PAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726678390; x=1727283190;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+60sDoqgEZiOl4CoM/RIV7YgE0mnbCcBerJVnCOzyyE=;
        b=RKvYksxLMYlWCwjPbaDOMElYB7RTqwySBLmZGyYl03LfpzoaLgu7F4SKZQCiA+f+Al
         ujsTK5r1C6bPECsqjRYLlDM6WSQPD0Gy/XBjMmQEbFJgIWxEEpD8PeLk6lvYEMtx/uGK
         rEmG4sgtk0i092XwgURhT7quQTGkqcIo06DCiEQlD477qwPEhwgT/ijh3ohZ8BFIbOWf
         E30OLJFYQ5CThD+5MHO4V6FAUNmxQuR9AnNJbhauJdfW1de1FIdnBUyK0Yzju+JXHTvw
         kbtMo5yH3nvOBDOyXZTjO3L4USug7/PpHJo8BkgNQ5ydPjM+8L3yzG3PGijINlA8wv20
         g8Ng==
X-Gm-Message-State: AOJu0YzRhLXXTZmwBfRFc/Mk/dqZ+zJnsbJ4/eeZmGpAE/uD0TPzVTyY
	dxx4MFIMxhoadK2IkhWS6PxaHlqXI79FIJByH7cV9hp5mxU98uNfpPFd6VJY/pK490Rzed2AIUa
	v7FTgne5CUdsthGHI2U0VZz+zYHM=
X-Google-Smtp-Source: AGHT+IHIr83OEZskXrv6Bi2xn7o3I5ZZ1pLhvCVWrKiMoQaaTInlcsUwQR+28+m8Drfcv0DQ9y7IxiRm7jM/rUSU/Wo=
X-Received: by 2002:a05:6870:304b:b0:25e:8509:160e with SMTP id
 586e51a60fabf-27c3f26eaccmr13886821fac.3.1726678390137; Wed, 18 Sep 2024
 09:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <ZttaJPIq6-jKt4eu@heinlein.vulture-banana.ts.net>
In-Reply-To: <ZttaJPIq6-jKt4eu@heinlein.vulture-banana.ts.net>
From: Jayanth Othayoth <ojayanth@gmail.com>
Date: Wed, 18 Sep 2024 22:22:58 +0530
Message-ID: <CACkAXSrgOJX7Cg34Us7LDgL+xPABaX-0Aw8ZVXYgmq-Fgmibow@mail.gmail.com>
Subject: Re: TOF elections for 2024H2
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="00000000000015ea91062267a473"
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000015ea91062267a473
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 7, 2024 at 1:08=E2=80=AFAM Patrick Williams <patrick@stwcx.xyz>=
 wrote:

> Hello everyone,
>
> It is that time again for TOF elections.  The current roll-call is
> available at:
>     https://github.com/openbmc/tof-election/blob/main/2024H2/rollcall.jso=
n
>
> For this half, we have 3 seats up for election.  Currently those are
> held by Andrew G., Ed, and Zev.  As Zev wrote earlier, he does not plan
> on rejoining.
>
> Nominations for those 3 seats may be sent to the mailing list by
> replying to this email.  Only those eligible to vote may be nominated.
>
> Nominations are due by Friday September 20th, 2024.  The election, if
> required, will be held immediately after with more details to follow.
>
>
 I nominate Andrew G based on his valuable contribution to the OpenBMC
community.

--00000000000015ea91062267a473
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Sep 7, 2024 at 1:08=E2=80=AFA=
M Patrick Williams &lt;<a href=3D"mailto:patrick@stwcx.xyz">patrick@stwcx.x=
yz</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Hello everyone,<br>
<br>
It is that time again for TOF elections.=C2=A0 The current roll-call is<br>
available at:<br>
=C2=A0 =C2=A0 <a href=3D"https://github.com/openbmc/tof-election/blob/main/=
2024H2/rollcall.json" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/openbmc/tof-election/blob/main/2024H2/rollcall.json</a><br>
<br>
For this half, we have 3 seats up for election.=C2=A0 Currently those are<b=
r>
held by Andrew G., Ed, and Zev.=C2=A0 As Zev wrote earlier, he does not pla=
n<br>
on rejoining.<br>
<br>
Nominations for those 3 seats may be sent to the mailing list by<br>
replying to this email.=C2=A0 Only those eligible to vote may be nominated.=
<br>
<br>
Nominations are due by Friday September 20th, 2024.=C2=A0 The election, if<=
br>
required, will be held immediately after with more details to follow.<br><b=
r></blockquote><div><br></div><div>=C2=A0<span style=3D"background-color:rg=
b(243,243,243);color:rgba(0,0,0,0.894);font-family:SegoeUIVariable,SegoeUI,=
&quot;Segoe UI&quot;,&quot;Helvetica Neue&quot;,Helvetica,&quot;Microsoft Y=
aHei&quot;,&quot;Meiryo UI&quot;,Meiryo,&quot;Arial Unicode MS&quot;,sans-s=
erif;font-size:14px">I nominate Andrew G based on his valuable contribution=
 to the OpenBMC community.</span></div></div></div>

--00000000000015ea91062267a473--
