Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B1C1A8CAF
	for <lists+openbmc@lfdr.de>; Tue, 14 Apr 2020 22:42:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491y8Z5VDBzDqwf
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 06:42:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12e;
 helo=mail-lf1-x12e.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=ORBSXsmu; dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491y7v22XBzDqvh
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 06:41:30 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id t11so881820lfe.4
 for <openbmc@lists.ozlabs.org>; Tue, 14 Apr 2020 13:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=67Qrs7HqOLr7PxG12ieUTqnENQcK05FxyQM3nVs/3Ac=;
 b=ORBSXsmuD66k4awVdQ+Hj90mA9wWEw63Ra+3AT0StURyqdRN40qW1y5AN8MKlEPNZf
 f4300246kY6vy/Bw+BK9LTK0tUTgsvmTu+RRLLXHtiIljpMDmxu2Hffhve3tWyBgkr+j
 McDIghnWlwfbR9Mf/gBOCs05mUH2P9qgw9JPxSmyjoXGLSxEQPuXhjXAH0Y2GaFZYRKO
 YEOud+LOlCpy3GghetAEJTV0QR98kKo2g+/uDCN4zGpBvZ21GWme+Beiay2JKDx1vaXu
 lCde7khVYUSRUXd0eF7QcI0SI+isrBfSV2K9t2Svci59OiPPbSJxu1+/615/Kg6+FLPs
 Eguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=67Qrs7HqOLr7PxG12ieUTqnENQcK05FxyQM3nVs/3Ac=;
 b=O/3m6V1vad8kd4ndlmQgS3Sdy/OmAyDV6c6VvPgBpcPm3Dma24IKwbiDwevUzicDr9
 Q6QRufV/KtzndDEPKAX6D0JYMGLuVpbp12uIqF2pS34DIX0LCFGyksLfT7j2MtDCM8nz
 gJPNrZffXd+SrsKSzND9hBHHY0kCfxh6gmACgr+cf+b5ACHICUwUAXTudoY91zvrgWMb
 3NzM9drjVnxwtHj7AP+P+LvH2TVekXzKnpvh3nq1taCtBRRPRenh1fXR5ezH/S3tbKtZ
 GXOsZG0eiUv4WaFd72jyOfmLn2ipdSW/HDV7s0ol+sYIOLyhfnWxrE2Byp6Hi/wHavm6
 9Ycg==
X-Gm-Message-State: AGi0PuY5ws7otoFODU1vOO5v58wyin6VJc7gNHUTL7WyJfbmyXJzu947
 aw8CX60Ltt5HQM377pEpLrB/N1BOnYHTO6zAB7Jhlw==
X-Google-Smtp-Source: APiQypKJgsJfqIeSmLZVpgOrwwZz5oGD6HfrPjZHKokR8C32algS5wY5vlA9VO/XY0UgQmNI0blCem3tyAvVnL8uGXg=
X-Received: by 2002:ac2:489b:: with SMTP id x27mr972876lfc.60.1586896885940;
 Tue, 14 Apr 2020 13:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <EED5BF91-4AE9-4B5A-BE68-BAE3D93C3704@fb.com>
 <20200410210033.GA9295@mauery.jf.intel.com>
 <85700953-1CBE-4DFB-9A5B-AF64B9735735@fuzziesquirrel.com>
 <A785371B-1AD2-45E0-AD62-60C7E8B2C69D@fb.com>
In-Reply-To: <A785371B-1AD2-45E0-AD62-60C7E8B2C69D@fb.com>
From: Richard Hanley <rhanley@google.com>
Date: Tue, 14 Apr 2020 13:41:14 -0700
Message-ID: <CAH1kD+b4GQFs_V13APk8123dc_vL0GVxXwZLx6pPdUHiKodZRA@mail.gmail.com>
Subject: Re: Sensor history
To: Vijay Khemka <vijaykhemka@fb.com>
Content-Type: multipart/alternative; boundary="0000000000002eef2805a3463970"
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
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000002eef2805a3463970
Content-Type: text/plain; charset="UTF-8"

> Hi Team,
>
> There is a telemetry proposal in docs and repository.
> https://github.com/openbmc/docs/blob/master/designs/telemetry.md
> https://github.com/openbmc/telemetry
> The proposal seems promising and complete.
> What is the implementation status?

I'm also curious about a status update here.  Were there any design issues
that needed to be worked out, or is it ready to develop?

>>    To implement the Redfish Telemetry service would we need to store
them on
>>    the BMC as well?
>It will be nice if we can store it in RAM at least with larger data and
some diskspace
>With small log rotate.

The Telemetry Service already has a concept of log rotation, but overall I
agree that storing in RAM first with optional persistence is better than
the other way around.
- Richard

--0000000000002eef2805a3463970
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(80,0,80)">&gt; Hi Team,</span><br=
 style=3D"color:rgb(80,0,80)"><span style=3D"color:rgb(80,0,80)">&gt;</span=
><br style=3D"color:rgb(80,0,80)"><span style=3D"color:rgb(80,0,80)">&gt; T=
here is a telemetry proposal in docs and repository.</span><br style=3D"col=
or:rgb(80,0,80)"><span style=3D"color:rgb(80,0,80)">&gt;=C2=A0</span><a hre=
f=3D"https://github.com/openbmc/docs/blob/master/designs/telemetry.md" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/docs/blob/mast=
er/designs/telemetry.md</a><br style=3D"color:rgb(80,0,80)"><span style=3D"=
color:rgb(80,0,80)">&gt;=C2=A0</span><a href=3D"https://github.com/openbmc/=
telemetry" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/=
telemetry</a><br style=3D"color:rgb(80,0,80)"><div><font color=3D"#741b47">=
&gt; The proposal seems promising and complete.</font></div><div><font colo=
r=3D"#741b47">&gt; What is the implementation status?</font><br></div><div>=
<br></div><div>I&#39;m also curious about a status update here.=C2=A0 Were =
there any design issues that needed to be worked out, or is it ready to dev=
elop?</div><div><br></div><div><span class=3D"gmail-im" style=3D"color:rgb(=
80,0,80)">&gt;&gt;=C2=A0 =C2=A0 To implement the Redfish Telemetry service =
would we need to store them on=C2=A0<br>&gt;&gt;=C2=A0 =C2=A0 the BMC as we=
ll?<br></span>&gt;It will be nice if we can store it in RAM at least with l=
arger data and some diskspace<br>&gt;With small log rotate.<br></div><div><=
br></div><div>The Telemetry Service already has a concept of log rotation, =
but overall I agree that storing in RAM first with optional persistence is =
better than the other way around.</div><div>- Richard</div></div>

--0000000000002eef2805a3463970--
