Return-Path: <openbmc+bounces-1288-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOnRGEJAeWmAwAEAu9opvQ
	(envelope-from <openbmc+bounces-1288-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Tue, 27 Jan 2026 23:46:26 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 377E39B35F
	for <lists+openbmc@lfdr.de>; Tue, 27 Jan 2026 23:46:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f10rG3JT3z2xQ1;
	Wed, 28 Jan 2026 09:46:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::32c" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769233809;
	cv=pass; b=eoQOHRLCvBLpS70XbTX38dQCUKdtSk7G+nS/igcpcc264/qCZ/uDJEJ8XnE018ZzsYz0kDzKqp+YZYt8oJd3KZfV3J8R5MwldM12PQNq8hWDp9iogUnd9Tk08jLYKGWc46M0yi+gsWCXUUsmpWyfc9aaEGUo5u61YZuVi4Wc7+QpXXgBGT5d09/JJvhLlorUU8zH7Xo/iVmbqOotz1NWjzjhtSi6s2RYay1TTTJA1sUJGmrS7zKVudMyxGrw3n8A8YbF8OO7RyHmdC5qxKGwXXqMXnc6FC+AZiFKAge4k2DnW/h+lqkbVm+4M2juExaVmElMChptJH0JK32veOeBpA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769233809; c=relaxed/relaxed;
	bh=RvqGklUjyseX2xE/W6cGH9FaaCtn8xkx7HvadpPYIKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f51XQn0ZjvcE/Afpu/zJP7E0wecpSkgU3IENBZ4g4i4aj6K/q6Af0SNftEOhiSkRBwktqfJJMfYPaljN9/pET8s1aMwjd53Xo7Xy9mAPWGCrWMq7d2YIk4BdFhIzhkSwQD0u5gN8yoE7KsWLrZZlaRmha/b/8xhgArSPSQ2lyDepzM8ESVt8laCtMAJ+VzuyrkYSaZm3vj5/Pln8Wk5cy1X+HjRfuYRCnlKdsZrc1FErfytzhYB4ILl/Y98PCRTiIDX0dappO3osuSFJPeqJifdGFWnP4cc18DFjIF0fxRsHyaxdNLxx7sCKlT5yNDZ13st+EA7QhuMDgoFtgvirfg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kwH8DAws; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com; envelope-from=nathan.jian7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kwH8DAws;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com; envelope-from=nathan.jian7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dykR323d0z2x9M
	for <openbmc@lists.ozlabs.org>; Sat, 24 Jan 2026 16:50:06 +1100 (AEDT)
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-7d122733808so1172164a34.2
        for <openbmc@lists.ozlabs.org>; Fri, 23 Jan 2026 21:50:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769233802; cv=none;
        d=google.com; s=arc-20240605;
        b=htfLPHcBJ1OFNeaJYbhVTJ0EzFeqTlFkP/AEiaUqn/Wt4AgPAPyckCVY/Q+aDNibVg
         t86Lef3tOywHqYBfTI9bPtMmc+7At0oyqbupBk3TlBYERVOjNyW0xOgzYGs1TD5or/+t
         vvGBilgDP6O3j+JaHpLYxA8nUxayhs3wKCvQB/zKXLmuOA+8fFsiHz4Egn1jN1JYrsMo
         wi1cmOyAa6iIwKt4/kelx32CroxaM6tWkM3zWQyGjYEBDQlIOsD2uMmowzwFPMkH41Jf
         +HezK+gtpbWdX+2HfxN56VzTTRp+4ZDhPwPC/p4P4EuqEmcuZBPlPFG7VSXv9SZG69l5
         0sAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RvqGklUjyseX2xE/W6cGH9FaaCtn8xkx7HvadpPYIKE=;
        fh=jgE4hDT3df2VOYVB8PiXtkngkS44kC13o2CPtBSLsks=;
        b=QCfUNTwvmfROPZLpc9/Zo3ygm5bsr/1wxeYy/1h+V7s6ZtppGjlZTlyq8fNiUT2e31
         2rRoSsptkIc9oDTIWHzhOI8pq8XeLx1/rlVCHuuqpwypdMhY+7zqOmu7tweIltIEhUv2
         OZf0qbKSKlqtWjPvl75uyxhP/rwjXuvZX7jNjQtfQdYbGaGrQQtG9iEDIefcg9ApUouE
         zai4oqNw6LkBsADQC7eZRBWMQXyLsjBKDtK5aqI9ewDo6gLA86lKnzFUpyEtu0SwivuB
         4AxoVgjRhCJiK2Fj0C1EQGRdgsyTd5WfZn+aUNVmM2zMkhTw7TkOEhKPA44HLg/kV68N
         Nhqg==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769233802; x=1769838602; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RvqGklUjyseX2xE/W6cGH9FaaCtn8xkx7HvadpPYIKE=;
        b=kwH8DAwsquRUYvjlWPhbQH0iZZ8L9YG9PJSOxKwmCj1TABL+kVerrqfx8KiIYkWTJL
         9EFPstvb63w38UzqEKGsYPvTN46rhEOmI9U9JDC428/vMjb0jKhTo+1KDD7jsEtQQJKs
         ylOsysAZP7WvNO6BxbjSAnbtmuJbCusi7qL5ggaZZ2rYTk5hp0WJVNjVCSjgAWhkAVO2
         9WZ9mG1Ik5mWMGyo4DDkdmg/j93wNhp9LJLU2QssV3Iug/86evbHyqj8qkL2a4JnXK2C
         dieh7OB3MTd8x1PdyLUY4/lo6w+tzPelwFudBKUBpw3A2InlkOLGlg7N776EBonIEpAR
         vRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769233802; x=1769838602;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RvqGklUjyseX2xE/W6cGH9FaaCtn8xkx7HvadpPYIKE=;
        b=ISfuucyTn7d4LuI4/+Mabh5szj5hRnLwR4U4Z9iS7A46e2jPxggwW6v8zuMsA4DVzN
         fUvUUbgKxBXWGhHOV0QbWHpW37vYzUK7upv0da/VuQTY8NNkr45l6qInwWcR2FtgkiVR
         w08JG7FQRmxaVSdnmQAMxuhK4ZTuEOBnL/b4+lfErQx60SKY63XK5qE7rQZjzZM2zobC
         0IXpGFVXJBCme85p7obKYl8fwSLhY/bqSPZNTAUT2jzxsxwgPgJri7K+DAeKM5miWCjL
         TVtqBYxyChNEMQE0cY/gJpzZigx5vhFpwr3WgGEtU/aAS3wQFFQphogRqyhWDB+YM9yI
         ojBg==
X-Gm-Message-State: AOJu0Yz/t0ntBDXSe+8QQPr5Vltsle4oiUj5JZF0Nw5ROsYOen4DUP5o
	+skPKSCG0/B2aYEhuPFKwbGrzg04vn+L4yBVMImSe5SALJiPDztICHO0AYOdb/wnAzUaCAWaZKJ
	tBiGnyr1TohNop/PTk8I7qpsRGvsFG5u5rA==
X-Gm-Gg: AZuq6aLG/2HSuPavoK1nbeo4u9pGyLTCN0tsm3sV77rtE1c/Qtt0DbdDyodptc7kXDK
	nNG8w9ozOdtyxePy8M6+2dNDC9hQBVcv/uE3XoWqjdqX6IVCVrXzNy7i2ZcqiMae4jvcZLdjhvY
	UgrNTxylnl1DO1LmWxJ20MufNMfbBBvUgEWBnAqz1QtgcnutZlF0SCtBmez8bpdKsGTxNpwd7VU
	pjSK2Sak6jzMqX8F1f9a/7l8Vh/bFP4teYySE+Rb/RPmvwmLl0cX/xEE+pFc9iyWZ2/s1k=
X-Received: by 2002:a05:6830:2589:b0:7c5:3c7d:7e65 with SMTP id
 46e09a7af769-7d15a5d524dmr3229861a34.16.1769233801978; Fri, 23 Jan 2026
 21:50:01 -0800 (PST)
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
References: <CAAFL+NPbt+TkgsMZYZQQoGAhhUhYJSB_Hzn_U9nCzBQoTnSPEg@mail.gmail.com>
 <CALLMt=o3x3i51Fscq_YZ1mRpM_mKV9dHt1ea5i0Ya5QHtswvAQ@mail.gmail.com>
In-Reply-To: <CALLMt=o3x3i51Fscq_YZ1mRpM_mKV9dHt1ea5i0Ya5QHtswvAQ@mail.gmail.com>
From: Nathan Jian <nathan.jian7@gmail.com>
Date: Sat, 24 Jan 2026 13:49:50 +0800
X-Gm-Features: AZwV_QiWRMEZxRcHpbav9mCkJb7OvSl4pbcAUg6k9PwFm1QV8yS_VfcxT8XYYX4
Message-ID: <CAAFL+NN255PQWamHJn8QtZrqdE4HwWY8EwoyUfqsR8iLUqkGeQ@mail.gmail.com>
Subject: Re: Request for Gerrit account approval
To: Andrew Geissler <geissonator@gmail.com>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000004aa5a906491bd89e"
X-Spam-Status: No, score=0.1 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.20 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DATE_IN_PAST(1.00)[88];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geissonator@gmail.com,m:openbmc@lists.ozlabs.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[nathanjian7@gmail.com,openbmc@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-1288-lists,openbmc=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathanjian7@gmail.com,openbmc@lists.ozlabs.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[openbmc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,openbmc.org:url]
X-Rspamd-Queue-Id: 377E39B35F
X-Rspamd-Action: no action

--0000000000004aa5a906491bd89e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

I am currently employed by Quanta Computer.
I need to verify with my management regarding our internal process and
whether I should contribute under an existing Corporate CLA instead of the
Individual CLA I previously submitted.

Could you please put my Individual CLA application on hold for now? I will
get back to you as soon as I have confirmed the correct procedure with my
employer.

Thanks,
Qi-Han Jian


Andrew Geissler <geissonator@gmail.com>=E6=96=BC 2026=E5=B9=B41=E6=9C=8822=
=E6=97=A5 =E9=80=B1=E5=9B=9B=EF=BC=8C=E4=B8=8B=E5=8D=889:49=E5=AF=AB=E9=81=
=93=EF=BC=9A

> On Wed, Jan 21, 2026 at 4:06=E2=80=AFPM Nathan Jian <nathan.jian7@gmail.c=
om>
> wrote:
> >
> > Hi,
> >
> > I'm a new contributor and just submitted my first change:
> > https://gerrit.openbmc.org/c/openbmc/x86-power-control/+/86739
> >
> > I received "User not approved, see admin, no CI" message.
> >
> > Could an admin please approve my account?
>
> Hi Nathan, I manage the CLA's for the project and one must be filed
> and approved to be added to the gerrit CI approval group. If you sent
> it to the linux foundation email then it usually takes a week or two
> to make it to me.
>
> If you prefer, you can send the signed CLA directly to me. Please note
> that if it is an individual CLA then we need confirmation that you are
> not employed by any company with an interest in OpenBMC. If you are
> employed by a company with an interest in OpenBMC then you must work
> with them to get a corporate CLA.
>
> Andrew
>
> >
> > Username: nathanjian7
> >
> > Thanks!
>

--0000000000004aa5a906491bd89e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div style=3D"font-size:inherit" dir=3D"auto">Hi Andrew,</div><div sty=
le=3D"font-size:inherit" dir=3D"auto"><br style=3D"font-size:inherit">I am =
currently employed by Quanta Computer.<br style=3D"font-size:inherit">I nee=
d to verify with my management regarding our internal process and whether I=
 should contribute under an existing Corporate CLA instead of the Individua=
l CLA I previously submitted.</div><div style=3D"font-size:inherit" dir=3D"=
auto"><br style=3D"font-size:inherit">Could you please put my Individual CL=
A application on hold for now? I will get back to you as soon as I have con=
firmed the correct procedure with my employer.</div><div style=3D"font-size=
:inherit" dir=3D"auto"><br style=3D"font-size:inherit">Thanks,<br style=3D"=
font-size:inherit">Qi-Han Jian</div><br></div><div><br><div class=3D"gmail_=
quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Andrew G=
eissler &lt;<a href=3D"mailto:geissonator@gmail.com">geissonator@gmail.com<=
/a>&gt;=E6=96=BC 2026=E5=B9=B41=E6=9C=8822=E6=97=A5 =E9=80=B1=E5=9B=9B=EF=
=BC=8C=E4=B8=8B=E5=8D=889:49=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width=
:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204=
,204)">On Wed, Jan 21, 2026 at 4:06=E2=80=AFPM Nathan Jian &lt;<a href=3D"m=
ailto:nathan.jian7@gmail.com" target=3D"_blank">nathan.jian7@gmail.com</a>&=
gt; wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; I&#39;m a new contributor and just submitted my first change:<br>
&gt; <a href=3D"https://gerrit.openbmc.org/c/openbmc/x86-power-control/+/86=
739" rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc.org/c/open=
bmc/x86-power-control/+/86739</a><br>
&gt;<br>
&gt; I received &quot;User not approved, see admin, no CI&quot; message.<br=
>
&gt;<br>
&gt; Could an admin please approve my account?<br>
<br>
Hi Nathan, I manage the CLA&#39;s for the project and one must be filed<br>
and approved to be added to the gerrit CI approval group. If you sent<br>
it to the linux foundation email then it usually takes a week or two<br>
to make it to me.<br>
<br>
If you prefer, you can send the signed CLA directly to me. Please note<br>
that if it is an individual CLA then we need confirmation that you are<br>
not employed by any company with an interest in OpenBMC. If you are<br>
employed by a company with an interest in OpenBMC then you must work<br>
with them to get a corporate CLA.<br>
<br>
Andrew<br>
<br>
&gt;<br>
&gt; Username: nathanjian7<br>
&gt;<br>
&gt; Thanks!<br>
</blockquote></div></div>

--0000000000004aa5a906491bd89e--

