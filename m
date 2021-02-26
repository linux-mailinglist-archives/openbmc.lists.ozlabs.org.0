Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D43326585
	for <lists+openbmc@lfdr.de>; Fri, 26 Feb 2021 17:27:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DnFRb6cNBz3ccL
	for <lists+openbmc@lfdr.de>; Sat, 27 Feb 2021 03:27:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=EASOsUCN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32c;
 helo=mail-wm1-x32c.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=EASOsUCN; dkim-atps=neutral
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DnFRM124Yz3cGT
 for <openbmc@lists.ozlabs.org>; Sat, 27 Feb 2021 03:26:52 +1100 (AEDT)
Received: by mail-wm1-x32c.google.com with SMTP id u11so2171430wmq.5
 for <openbmc@lists.ozlabs.org>; Fri, 26 Feb 2021 08:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=T1k618b0ViEIfEnDzZ+N8/KLBt4KDDsle4h7SSDxLvA=;
 b=EASOsUCNBG/kd46ffm9Pro2xaZnZojwFHmSBCJFHj6WSHBGUJ7cvn1wcUyyVPS3xIG
 U99PMkvP2hXJA87sJWJj2WzcniZgOsIjvw3jt0uNyqiMf/KpIB/ufj1htZg2WKw5XE8D
 u6lQ/LMsSNTOto2seLnZ3Zse61P8Gy9u425ZI1bZZn+yAkmH39G3x0V4tDiegKHTKk4x
 O4HM/7uzYfQiR4lD0AuutAiw5nz0mwfOgTgcT6e143s0U8XY/9l6QTRQ7CbfRTal2VWy
 29xhJLT85RyZPZ8A9Lx1fwF2hwlCCLN/pRNMLGQgA74slc0PbwXpVbxeFhFU64tsogOS
 lC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=T1k618b0ViEIfEnDzZ+N8/KLBt4KDDsle4h7SSDxLvA=;
 b=igAU2rKZgbrUFYFZyoH4I/d59HID48wBCVdUAsT9P7MmQpiuyITMfFXmHSSzMjQPIR
 8VqnkfnyQ3jOuugZsHWnus2OzvsxepAiJiIS1+kye7shmg5SVPqQ3v6IVjIg2NhoP2sr
 oaQ1sYbNoiS76IAHlwIFIUebTcilKCUqaoGtCCvZ8c4iRM3RjDo0wD9G6UnP8lNvdfrA
 adjGKvTiXGH/JQjst+1lRshi1rdQb6ej8KC2BkXJN1c3EAzvgnfaW0OFzxGwqjWbVbQE
 SDlKA1QDwdPlKLC4HhGnVW9+gCgJPJmoKJpVGEmBH2T5r5mzwEgGUerd9IkeKX9GwOvv
 UAnQ==
X-Gm-Message-State: AOAM532G7DV+ZIOrLbY9qVlmLBTGnhtTueWZTuiI8UUYEsAP79SHdmTP
 GBzNpyV7ZYLbG1bbP+Wm9TZT0B5qAy80WpJgaQalXg==
X-Google-Smtp-Source: ABdhPJyoQztfVndoQtn+9SBs6iUwyBhxhYDbszqhIrkVit8ZCCcRPU3dQxrXr9F4web8Rb6m8iH9+vPmHuNwdRz2f64=
X-Received: by 2002:a7b:c2aa:: with SMTP id c10mr3634546wmk.101.1614356805725; 
 Fri, 26 Feb 2021 08:26:45 -0800 (PST)
MIME-Version: 1.0
References: <SG2PR04MB30939CC20F08C50A7031DBA5E19D9@SG2PR04MB3093.apcprd04.prod.outlook.com>
In-Reply-To: <SG2PR04MB30939CC20F08C50A7031DBA5E19D9@SG2PR04MB3093.apcprd04.prod.outlook.com>
From: Ed Tanous <edtanous@google.com>
Date: Fri, 26 Feb 2021 08:26:34 -0800
Message-ID: <CAH2-KxA4tQvaxzFcAWYhYrq9WeCLrLTRdknZW66XUBzOipoFrg@mail.gmail.com>
Subject: Re: Negative value returns for sensor in tiogapass
To: Jayashree D <jayashree-d@hcl.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Feb 26, 2021 at 12:55 AM Jayashree D <jayashree-d@hcl.com> wrote:
>
> Classification: Public
>
> Hi Team,
>
>
>
> Recently, I have tested sensors for tiogapass, in which one sensor return=
s negative value.
>
> After analysing the code in the dbus-sensors repo, I found the following =
issue.
>
>
>
> dbus-sensors/IpmbSensor.cpp at master =C2=B7 openbmc/dbus-sensors (github=
.com)
>
>
>
> From the above link, We need only below line in the code to process the H=
SC sensors value for tiogapass.
>
>
>
> int16_t value =3D ((data[4] << 8) | data[3]);
>
>
>
> Since the below logic is added, the values get shifted and getting negati=
ve values as output.
>
>
>
> constexpr const size_t shift =3D 16 - 11; // 11bit into 16bit
>
> value <<=3D shift;
>
> value >>=3D shift;
>
>
>
> Could you please suggest any idea to resolve this issue.

I haven't looked at this in detail, but we should follow whatever the
spec says here.  If whomever wrote this originally put in the wrong
math (which seems likely, given they were implementing 4 types and
probably only using one) then we should just get it fixed and do what
the spec says.

>
>
>
> Regards,
>
> Jayashree
>
>
>
> ::DISCLAIMER::
> ________________________________
> The contents of this e-mail and any attachment(s) are confidential and in=
tended for the named recipient(s) only. E-mail transmission is not guarante=
ed to be secure or error-free as information could be intercepted, corrupte=
d, lost, destroyed, arrive late or incomplete, or may contain viruses in tr=
ansmission. The e mail and its contents (with or without referred errors) s=
hall therefore not attach any liability on the originator or HCL or its aff=
iliates. Views or opinions, if any, presented in this email are solely thos=
e of the author and may not necessarily reflect the views or opinions of HC=
L or its affiliates. Any form of reproduction, dissemination, copying, disc=
losure, modification, distribution and / or publication of this message wit=
hout the prior written consent of authorized representative of HCL is stric=
tly prohibited. If you have received this email in error please delete it a=
nd notify the sender immediately. Before opening any email and/or attachmen=
ts, please check them for viruses and other defects.
> ________________________________
