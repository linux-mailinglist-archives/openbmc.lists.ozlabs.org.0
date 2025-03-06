Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A09CFA5427D
	for <lists+openbmc@lfdr.de>; Thu,  6 Mar 2025 06:59:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z7dz15LRZz3cjS
	for <lists+openbmc@lfdr.de>; Thu,  6 Mar 2025 16:59:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::229"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741240746;
	cv=none; b=NftVf8xJ7OHyrJxS/yyWJP37iB5mhfxVMs4amv4EOS4o+xhd5F6dXwEXMh0JZBVUDdTupGEaVrknW4NDlkU9httCcwPncoGzycrSj1xWjIIxJAQnUT6ZLMsVLYW/eqhxZUsyfHYBJiV22Dj+C/DZllLfbmGvYRqNTgXyJnFbWvetJpVsH7IOlzuXGGpUMUyRVZy/bQYATGs/p+0brtXpXFB/bqzs1r0kxA7t7hIKGX9bl0f2ZusP5qKA624HP5N8328wHO/cl3Xtzaykv/+8ltkN+AbJKnJYH9k6dJcfugDCDRofkGRZvQrHVfT5vybKzyF4AUvFcYxtiTevySsZpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741240746; c=relaxed/relaxed;
	bh=bBfQcTxTcRqk21xSjaO0gA7AmOhPDgXoMO/ut0kYQe4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i4kr/gmULabRwzDxg+K/jp/n2ndypDVpDwTdPy7A0P2EbHnQsjPWXEcAnIjZNktWZyM7vD0ReSeYJL6IChtNLLoPIh/D0SoHY6iadmYntb+4oAShA89zCOqA2y/jPaYe91QhHKna6IKmNYiCAhhXOZV+B+ljcSiiyGjSXibfw8w5cw7GG/R3dB/ly0cSr1hQivezUdFukVKwEwFQv+0gfcCwE5D1jQMIZZOjy4CoNq0csJ73RRxoKVQGC0BwW/W6eK4J89v+c7lvEYPBqV2oQBkk6b3Xq7sREvuChSO/8geUJw3Z3PduytCRKAdbjquDh+Q6Ey7WU/6THHcq6RepGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=P87rLoyF; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com; envelope-from=ojayanth@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=P87rLoyF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com; envelope-from=ojayanth@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z7dyw3sVtz2x9j
	for <openbmc@lists.ozlabs.org>; Thu,  6 Mar 2025 16:59:03 +1100 (AEDT)
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3f682bb0d77so777517b6e.1
        for <openbmc@lists.ozlabs.org>; Wed, 05 Mar 2025 21:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741240740; x=1741845540; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bBfQcTxTcRqk21xSjaO0gA7AmOhPDgXoMO/ut0kYQe4=;
        b=P87rLoyFchpMsOP8EG/nzuzGeWWJhEE1jykRrKIwqwekpbCYv9Xlz804ExXXZAlf6i
         DATD0kyB3h5IZiNvO+0lHn1eLeR/AxnpL4OqTu6s7faidkyPa7tJL4JwhtxB9Utagw2D
         NyD3UY74KJ1OvVHYo6CJQgIt+AGzk2h1Z1qn3B56XxX1GwnKlGAgi+BZJfsG3YhyVfV/
         ksKr7aZ97abVL7gtOnnArCEQY/NQvU2bvVMFZ19KGdq11wO2fjRal7G0sohwJD3+byKV
         GjYggo29Rl5aGB3zVt6OJFCSQ8GN8DZjTiVOFGBVSSBxUKGzhT/l1mGnBjJrjoUpNbmO
         VFyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741240740; x=1741845540;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bBfQcTxTcRqk21xSjaO0gA7AmOhPDgXoMO/ut0kYQe4=;
        b=W4wJgGnVj8kUnXbeA3fC0/gM7YGqI9M3ig2xahR//8652dXfW6STl/ez8b8h3RqjjI
         hWIDr7bmTIAkgwSNBXe1fz9nHJpMJC8bxM18+jvDAaVTMgH82aJnqx8YZiyH85WykOII
         icSMNkQJllRtSK/Cxrks0cdTlvcxLvuZD6jpWnGLGTN0jw9MllT7yeA3E58sgAxAIAMM
         inCm+vmIBnGYAJiA6p1NgoPHUomGlN4Wc1/9HosmQXdgb1YG816I8ZlMTd/8Gru4dF+2
         j4d3XJ5qRXFSQlJuhSavt44LVTe1mZHuvtbbcqKsv5gZhqLSnLUXgywSl3y3cNZBDNPU
         KmCw==
X-Forwarded-Encrypted: i=1; AJvYcCW7LfCgll7qYJsOjDclcQhjZ8BFYTmdaNwtElahPBanjSKvDCgrkwFAYQ+8cRAvlxs6OSieJz+e@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyXbxL1bpmFs0yG2ARJIbueFtoFJ4B9FIv3wSBopgE5DZhiOKqN
	DRm0XjnBzhVtvAVR9rqV7TYt9Q/hziE30ecfDQGkGUPBn+cOkjQr4sSQbgBiX3W8VTR8f4rRP6d
	P1kFasn6MlycVbVqFaopOy5BEhrnAEVxt
X-Gm-Gg: ASbGncsqf/TbPbCmvk+OafuL6NQA2R0ZP7/NuHaPf5EsA4yidEBxbQYDzyeCm3336lw
	xgzyPlF9mHYRtBbLi1m21JNoKKO5EdiwNKIFsTFUXGdOc21bz9Rh2VyHQmUPCrW2SqfyBFqyTaa
	aaqKDdT8H/NmNK7qeV7kumrN4V
X-Google-Smtp-Source: AGHT+IHnP1w5Bn2V3z98JKhVeXIFaBk3qB9FpvpzpJy8Ze/uiEdHuRRauUKsg4MdZrvHM3hJzDQKr78PKaLWmXRNH+g=
X-Received: by 2002:a05:6808:3998:b0:3e6:54c8:fad3 with SMTP id
 5614622812f47-3f68ca8b025mr1307143b6e.19.1741240740067; Wed, 05 Mar 2025
 21:59:00 -0800 (PST)
MIME-Version: 1.0
References: <Z8ec-DOTlSM8FMhC@heinlein> <cc3237d56b12b48aaf327c3c972bdb86937a002c.camel@codeconstruct.com.au>
In-Reply-To: <cc3237d56b12b48aaf327c3c972bdb86937a002c.camel@codeconstruct.com.au>
From: Jayanth Othayoth <ojayanth@gmail.com>
Date: Thu, 6 Mar 2025 11:28:48 +0530
X-Gm-Features: AQ5f1Jq_iLT6WeQpdayP56cOGbj4b3fErZ8N0JhLN8DIPt0jgPnTWDLOMzlpqW0
Message-ID: <CACkAXSqhfbHnnBKcuvhKYeiZ_HFFP-yben6HHP__MOVAY286aA@mail.gmail.com>
Subject: Re: TOF elections for 2025H1
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Content-Type: multipart/alternative; boundary="000000000000c7c0f2062fa633eb"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

--000000000000c7c0f2062fa633eb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I would like to nominate myself for this role.

On Thu, Mar 6, 2025 at 5:14=E2=80=AFAM Andrew Jeffery <andrew@codeconstruct=
.com.au>
wrote:

> On Tue, 2025-03-04 at 19:38 -0500, Patrick Williams wrote:
> > Hello,
> >
> > It is time again for TOF elections.  The current roll-call is
> > available
> > at:
> >     https://github.com/openbmc/tof-election/tree/main/2025H1
> >
> > For this half, we have 4 seats up for election.  Currently those are
> > held by Andrew J., Jason, Patrick, and William.  Due to slipping from
> > the developer membership, Jason is not eligible for re-election.
> >
> > Nominations for those 4 seats may be sent to the mailing list by
> > replying to this email.  Only those eligible to vote may be
> > nominated.
> >
> > Nominations are due by Sunday March 16th, 2024.  The election, if
> > required, will be held immediately after with more details to follow.
>
>
> I nominate myself for re-election.
>
> Andrew
>

--000000000000c7c0f2062fa633eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(36,36,36);font-size:14px;backgrou=
nd-color:rgb(250,250,250)">I would like to nominate myself for this role.</=
span></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D=
"ltr" class=3D"gmail_attr">On Thu, Mar 6, 2025 at 5:14=E2=80=AFAM Andrew Je=
ffery &lt;<a href=3D"mailto:andrew@codeconstruct.com.au">andrew@codeconstru=
ct.com.au</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Tue, 2025-03-04 at 19:38 -0500, Patrick Williams wrote:<br>
&gt; Hello,<br>
&gt; <br>
&gt; It is time again for TOF elections.=C2=A0 The current roll-call is<br>
&gt; available<br>
&gt; at:<br>
&gt; =C2=A0=C2=A0=C2=A0 <a href=3D"https://github.com/openbmc/tof-election/=
tree/main/2025H1" rel=3D"noreferrer" target=3D"_blank">https://github.com/o=
penbmc/tof-election/tree/main/2025H1</a><br>
&gt; <br>
&gt; For this half, we have 4 seats up for election.=C2=A0 Currently those =
are<br>
&gt; held by Andrew J., Jason, Patrick, and William.=C2=A0 Due to slipping =
from<br>
&gt; the developer membership, Jason is not eligible for re-election.<br>
&gt; <br>
&gt; Nominations for those 4 seats may be sent to the mailing list by<br>
&gt; replying to this email.=C2=A0 Only those eligible to vote may be<br>
&gt; nominated.<br>
&gt; <br>
&gt; Nominations are due by Sunday March 16th, 2024.=C2=A0 The election, if=
<br>
&gt; required, will be held immediately after with more details to follow.<=
br>
<br>
<br>
I nominate myself for re-election.<br>
<br>
Andrew<br>
</blockquote></div>

--000000000000c7c0f2062fa633eb--
