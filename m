Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA89822A7F
	for <lists+openbmc@lfdr.de>; Wed,  3 Jan 2024 10:49:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ngLdVYA7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T4lLL1k6Kz2xm3
	for <lists+openbmc@lfdr.de>; Wed,  3 Jan 2024 20:49:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ngLdVYA7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com; envelope-from=padathjayashankar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T4lKk6g0Sz2xm3
	for <openbmc@lists.ozlabs.org>; Wed,  3 Jan 2024 20:48:57 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id 41be03b00d2f7-5cda24a77e0so3446674a12.2
        for <openbmc@lists.ozlabs.org>; Wed, 03 Jan 2024 01:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704275333; x=1704880133; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8rIkzBSq4Y2q5YA/gBvZga4a2Gp3NoLW2ENm/+e9vU8=;
        b=ngLdVYA7LFbWCIW8JgTAvr7TrJ0JlOsiJ2akvfK7xXONmEs4j04YFlRrJ42SncOgGn
         zrOhPS8Q2PJEmqRsFSUMmb1gYXfVoq4zb7l7w2dT4dZ/Hp9iQ5eEElp9pHfhnZ946Jnz
         7lJUGlxI7MzuR5Tn3lp/Isr13YG1CPFCgp5CXmLhLIYs1DQubjjTol6ohLt2At2TitO3
         7ZNAiKY0ohClxTJtmzxFbqtTrWKeCG8m1vAu0OYbRzIYKpQ93vN5RmIQakx5gdESb+GO
         2iR47MIP0ngQ/EzkuXiNZDHTTPqLqlYJf1ylA3i0GOAj873Y4jvGWEKxGUBXH+Cb186O
         UF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704275333; x=1704880133;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8rIkzBSq4Y2q5YA/gBvZga4a2Gp3NoLW2ENm/+e9vU8=;
        b=YAYei+sbrIGmHZeeK7vEUfVf0RPCP0oOwuvyuj9d5r6pSYM3q99IstRTBr10nzt9Nn
         VZpLnuZwcWij8ZVFiQJp+8i3wOTcO7mm2QHEb2kI4M8eh2adoF1xHFkbnVUnrR1b/WzY
         LV+HaUWvjbvdJngXDzm27XcEvtv/+du2LXniLzrq8ibChCEE8XRcfUytu70gdYbFggHD
         OUTpVO01Wv4dzwHKB89F80ng0esvgAv1xgw+dW25GWgfAl+V2ugxgfyO50uonlzhQmsa
         IQ+XnGqhsDUyFtfFhi7hrTwAdWNXkXQwg6hloqNHD/Xt2xHJFtGUfYvyB0o1x9E9mvDU
         leBw==
X-Gm-Message-State: AOJu0YxA5y+BWucu0bxh5/5Y/UIUo0F1T1U8fM27jXUYtNFlu5I+e673
	aB6u1u2o8dxw5vSrsX7bwiArHtwakWz3Wee2FTbxpb35kfQrfw==
X-Google-Smtp-Source: AGHT+IGKPy2YpYLR0kEEXJoixmiJ9FXto9g/eT6onBZb0vUq89KlAtE6QjtwL0q5ni8wXvBPp1gb61/IApCPxpxPN1c=
X-Received: by 2002:a05:6a21:99a3:b0:196:1616:15fc with SMTP id
 ve35-20020a056a2199a300b00196161615fcmr5657704pzb.5.1704275332811; Wed, 03
 Jan 2024 01:48:52 -0800 (PST)
MIME-Version: 1.0
References: <CAFRDoiwOqE96Pxw9QVE7B2j_JnBbsvaEa38H5_=DVch8Xo8P9Q@mail.gmail.com>
 <ZZQBRhzMCiI3SC-Q@heinlein.vulture-banana.ts.net>
In-Reply-To: <ZZQBRhzMCiI3SC-Q@heinlein.vulture-banana.ts.net>
From: Jayashankar Padath <padathjayashankar@gmail.com>
Date: Wed, 3 Jan 2024 15:18:41 +0530
Message-ID: <CAFRDoixW1aUVACo84wtGcmo09cgN9NieifB4uv-kWuxmBC2qsg@mail.gmail.com>
Subject: Re: Question on passing username and password credentials through PLDM
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="000000000000cfd074060e0785d8"
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000cfd074060e0785d8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Patrick,

Thanks for your suggestion. From the host side they wanted  to attach a
graphics adapter so that some of the system management service operations
could be carried out.

As you suggested we would consider the way, other external interface
programs like bmcweb which support similar functionalities.

Thanks and Best Regards,
Jayashankar

On Tue, Jan 2, 2024 at 5:57=E2=80=AFPM Patrick Williams <patrick@stwcx.xyz>=
 wrote:

> On Tue, Jan 02, 2024 at 10:16:04AM +0530, Jayashankar Padath wrote:
> > We do have a requirement in which the Host needs to pass the username a=
nd
> > password credentials to the BMC PAM module for authentication OR during=
 a
> > password change. These details are passed through the PLDM stack.
>
> This doesn't sound like a requirement, but an implementation decision.
>
> What is the requirement from the host side?
>
> > BMC specific requirements:
> >
> > =E2=97=A6 The ability to prompt for a username/password and provide
> authentication
> > =E2=97=A6 The ability to change a password when the current password is=
 expired
> >
> > Seeing two design options here.
> >
> > 1. PLDM calls the PAM APIs directly
> > 2. Make use of BIOS Config manager (But this has only password change a=
nd
> > no direct authentication. Also this does not make use of PAM)
>
> My suggestion: Do whatever bmcweb does.  PLDM is another external
> interface.  If you want to use BMC-side authentication, follow what
> other external interface programs are doing.
>
> --
> Patrick Williams
>

--000000000000cfd074060e0785d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Patrick,<br><br>Thanks for your suggestion. From the=
 host side they wanted =C2=A0to attach a graphics adapter so that some of t=
he system management service operations could be carried out.<br><br>As you=
 suggested we would consider the way, other external interface programs lik=
e bmcweb which support similar functionalities.<br><br>Thanks and Best Rega=
rds,<br>Jayashankar<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Tue, Jan 2, 2024 at 5:57=E2=80=AFPM Patrick Willi=
ams &lt;<a href=3D"mailto:patrick@stwcx.xyz">patrick@stwcx.xyz</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Jan 0=
2, 2024 at 10:16:04AM +0530, Jayashankar Padath wrote:<br>
&gt; We do have a requirement in which the Host needs to pass the username =
and<br>
&gt; password credentials to the BMC PAM module for authentication OR durin=
g a<br>
&gt; password change. These details are passed through the PLDM stack.<br>
<br>
This doesn&#39;t sound like a requirement, but an implementation decision.<=
br>
<br>
What is the requirement from the host side?<br>
<br>
&gt; BMC specific requirements:<br>
&gt; <br>
&gt; =E2=97=A6 The ability to prompt for a username/password and provide au=
thentication<br>
&gt; =E2=97=A6 The ability to change a password when the current password i=
s expired<br>
&gt; <br>
&gt; Seeing two design options here.<br>
&gt; <br>
&gt; 1. PLDM calls the PAM APIs directly<br>
&gt; 2. Make use of BIOS Config manager (But this has only password change =
and<br>
&gt; no direct authentication. Also this does not make use of PAM)<br>
<br>
My suggestion: Do whatever bmcweb does.=C2=A0 PLDM is another external<br>
interface.=C2=A0 If you want to use BMC-side authentication, follow what<br=
>
other external interface programs are doing.<br>
<br>
-- <br>
Patrick Williams<br>
</blockquote></div>

--000000000000cfd074060e0785d8--
