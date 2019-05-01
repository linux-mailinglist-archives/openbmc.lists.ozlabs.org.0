Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 394801099A
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 16:49:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vLsC1V32zDqR1
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 00:49:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c36; helo=mail-yw1-xc36.google.com;
 envelope-from=james.mihm@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mqG3Xj8E"; 
 dkim-atps=neutral
Received: from mail-yw1-xc36.google.com (mail-yw1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vLrH3DnFzDqMK
 for <openbmc@lists.ozlabs.org>; Thu,  2 May 2019 00:48:58 +1000 (AEST)
Received: by mail-yw1-xc36.google.com with SMTP id y131so8458262ywa.9
 for <openbmc@lists.ozlabs.org>; Wed, 01 May 2019 07:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+BHogv/V7sIgCV63OS5mOjiOjQXOdUks8fZiBrW81Mg=;
 b=mqG3Xj8EAcnYh7EEUnIQgWvdqxNXKTfi5ztzckZ32DXTTD66bB3uT2RiOj3nBuiltT
 OpRkdjqW5z11HYH8ynHLyltPd1RjSIlj5Zsr6bchWyVLZkW633aBE4illIwuVJPCJPse
 HXga2i4Ttze5Si+SwQjvWNm/dwxdpS9/JWkV1gScb1kxwlMeQB8pwcNBEEK0pESKf3lz
 GUg504dKu1u/163dykFcaoVumK/BGmg/vfho8CNzNXbrQZKNzxImjxTpEV9oIAod0KE0
 cdPaACF5jlO2/QOhkn6QiZF+J6YZUaTdISSV2CUTpUZEW0KqdVXxGfc9GIaR01xURncp
 NJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+BHogv/V7sIgCV63OS5mOjiOjQXOdUks8fZiBrW81Mg=;
 b=Y+uFS/jW4wzjqguNe2HAQDBTMynR84cj7dPxcUy3C538IQo7/oga3gxd2mnwQaz2vo
 PrxVoi4Xna+bFjoIF9DkStpbs5KiH9BHdHWLQ0+UG48YOOOGjfLzlhLA75TtNHsgvm3p
 AXXQgU3DQDW+bVFIqochI1tmA6E+hFGQLbKPQyPODUdtfN9uUHf2oKuB97J3ubW1nDZG
 kIjeuO9hwG8FA6zNrrjf9W8vqfb6oerTCwg3VKau4uOqjNh6V/71RgZCCmt3XsN6RTVX
 6yekNpp61Yll7b1G5y3egGkqfzMWwMsf2jsT32jJ9NjbzyV3dPGk6YMEG6nvccvV5ZTs
 xkyQ==
X-Gm-Message-State: APjAAAW6/I4nseFlLVFN/th9pp8jIPs6yW/MSh8QHmMh8nAJ2n/CVnwk
 qxOuj+Ubn+ymoIfbPAHK6XZfYmbgi0n19DCGHo53TILb6vw=
X-Google-Smtp-Source: APXvYqziJAa6oYkbZiYwrYXPdU5tCKLvI12y0tQVBfCZXID1hOqXAearGoNK7ey77cfffHkz/yLaZEBr10wmLlKhrNk=
X-Received: by 2002:a25:86c3:: with SMTP id y3mr38306687ybm.391.1556722134422; 
 Wed, 01 May 2019 07:48:54 -0700 (PDT)
MIME-Version: 1.0
References: <757768607.3289093.1556696321378.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <757768607.3289093.1556696321378.JavaMail.zimbra@raptorengineeringinc.com>
From: James Mihm <james.mihm@gmail.com>
Date: Wed, 1 May 2019 07:48:01 -0700
Message-ID: <CADy_Pt3DqXxtsYQPnKEn2ccAQSphLfw6TBEVLtpASpFCE0AsYg@mail.gmail.com>
Subject: Re: CLA concerns
To: Timothy Pearson <tpearson@raptorengineering.com>
Content-Type: multipart/alternative; boundary="000000000000d61b370587d49d74"
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

--000000000000d61b370587d49d74
Content-Type: text/plain; charset="UTF-8"

Timothy, Thanks for your input. I'll add this topic to the agenda for the
next TSC meeting.

James.


On Wed, May 1, 2019 at 12:39 AM Timothy Pearson <
tpearson@raptorengineering.com> wrote:

> All,
>
> While we would like to upstream the Talos II / Blackbird BMC patches to
> the OpenBMC project, our legal folks will not approve the CLA.  The main
> concern is the patent section, since our mainboards do contain patented
> technology that is not part of OpenBMC, but that OpenBMC may interface
> with.  We are not trying to upstream any code that would result in patent
> action, but are very concerned that the CLA would end up granting a license
> for the patented technology that exists outside of OpenBMC, merely because
> the OpenBMC codebase is able to interface with that external technology.
>
> The specific clause in question is:
> "...or by combination of Your Contribution(s) with the Work to which such
> Contribution(s) were submitted."
>
> This is ambiguous enough that legal is concerned an external entity
> wishing to clone the patented technology from our mainboards without a
> license would simply be able to merge our contributions with their own de
> novo code duplicating parts of the patented technology, then claim a
> license for the patents was automatically granted by the CLA.  As such, we
> are currently blocked from upstreaming code to OpenBMC, despite the fact
> that our patches are freely available under GPL and MIT licenses, and that
> those patches are not covered by any of our patents (past or future).
>
> Is there a way to clean up the patent section of the CLA to make it
> clearer that only the patches submitted are released from patent
> infringement claims, and that any third party modifications to those
> patches (or to the codebase created in part by those patches) must still be
> cleared by their respective authors / maintainers not to infringe on the
> patent rights of other contributors to the codebase?
>
> Thank you!
>
> --
> Timothy Pearson
> Raptor Engineering, LLC
> https://www.raptorengineering.com
> +1 (415) 727-8645
>

--000000000000d61b370587d49d74
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Timothy, Thanks for your input. I&#39;ll add this top=
ic to the agenda for the next TSC meeting.</div><div><br></div><div>James.<=
/div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Wed, May 1, 2019 at 12:39 AM Timothy Pearson &lt;<a =
href=3D"mailto:tpearson@raptorengineering.com">tpearson@raptorengineering.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">All,<br>
<br>
While we would like to upstream the Talos II / Blackbird BMC patches to the=
 OpenBMC project, our legal folks will not approve the CLA.=C2=A0 The main =
concern is the patent section, since our mainboards do contain patented tec=
hnology that is not part of OpenBMC, but that OpenBMC may interface with.=
=C2=A0 We are not trying to upstream any code that would result in patent a=
ction, but are very concerned that the CLA would end up granting a license =
for the patented technology that exists outside of OpenBMC, merely because =
the OpenBMC codebase is able to interface with that external technology.<br=
>
<br>
The specific clause in question is:<br>
&quot;...or by combination of Your Contribution(s) with the Work to which s=
uch Contribution(s) were submitted.&quot;<br>
<br>
This is ambiguous enough that legal is concerned an external entity wishing=
 to clone the patented technology from our mainboards without a license wou=
ld simply be able to merge our contributions with their own de novo code du=
plicating parts of the patented technology, then claim a license for the pa=
tents was automatically granted by the CLA.=C2=A0 As such, we are currently=
 blocked from upstreaming code to OpenBMC, despite the fact that our patche=
s are freely available under GPL and MIT licenses, and that those patches a=
re not covered by any of our patents (past or future).<br>
<br>
Is there a way to clean up the patent section of the CLA to make it clearer=
 that only the patches submitted are released from patent infringement clai=
ms, and that any third party modifications to those patches (or to the code=
base created in part by those patches) must still be cleared by their respe=
ctive authors / maintainers not to infringe on the patent rights of other c=
ontributors to the codebase?<br>
<br>
Thank you!<br>
<br>
--<br>
Timothy Pearson<br>
Raptor Engineering, LLC<br>
<a href=3D"https://www.raptorengineering.com" rel=3D"noreferrer" target=3D"=
_blank">https://www.raptorengineering.com</a><br>
+1 (415) 727-8645<br>
</blockquote></div>

--000000000000d61b370587d49d74--
