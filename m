Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C6E88D40C
	for <lists+openbmc@lfdr.de>; Wed, 27 Mar 2024 02:55:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Jk+JBMxH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V48rf26Bdz3dtJ
	for <lists+openbmc@lfdr.de>; Wed, 27 Mar 2024 12:55:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Jk+JBMxH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=ppighouse@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V48r63PFmz3bx0;
	Wed, 27 Mar 2024 12:55:00 +1100 (AEDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a4dfb8bc3a6so108634666b.0;
        Tue, 26 Mar 2024 18:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711504497; x=1712109297; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ze/JoQuhXrOkTNwPPWEvnVAPlbYPScwWzUSCOqQezrg=;
        b=Jk+JBMxH/kVW9SUl/bDEBPzLQ1DJ4RG+n5GZ2CcQIseyuMrO/ed5ZfisMJUsz1BIwg
         nfS2dUTujjCKy57YNsjWwBYHerdz+Edw3V8ryf1mJV3sFXfDMEm2p/6QiiPnzSWiukK4
         j4UjEbP8zZdJoA7RCZicdBzXA9X7g1BIFobSPqK93lRSWMUnLmQrmqkn2i4EakXQR7f+
         8qoqtz7awMxctblkQh0Sy9wlo4PFiIufzfvSSDFEngZAJgNJOe9RdTcWHzIDXGO4oDu+
         3DRrFG9kQlhcTFxdE0CWG/pmlBgm/rkJ8EQd3K5PUmlF/rd6ratflL8faDEElPG8l0Pm
         XAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711504497; x=1712109297;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ze/JoQuhXrOkTNwPPWEvnVAPlbYPScwWzUSCOqQezrg=;
        b=Ge8BWsmLqqHP5mPod/8hr9fbSFYLNwgTp4QMGzIc9W7plpfTrczOB4fBZ2eAX5Yror
         zznow3TkJ7Ruqw8p+jp6ch97x6JumJYdxikZNtJ1Hf7gcY+aDWT5lMMFbjzyZdDex+QV
         8+TSOnhphktkFTUZEi60RllBgS+MD8/pL6STE6VZHGteSj1LULmMNWLWo/rCdJlwtDMO
         RQ68LpBYskBiqs6N1BpfaAXyfDk8YWT0BMyzZvtfzq8AuyHj8KdZF/X1GNucFNySivGZ
         nL1pjAryRzpwfcAzIyuDGxGt5ACf9QvJ1cuWH2ixuMzTLZcoPLILvxcvSTwAzZFT31rx
         9AgA==
X-Forwarded-Encrypted: i=1; AJvYcCU39LyBfwzFNfPVT8xguc+b8lZge3N8Sd1g/yBNakeqUDv5UfYKLYWz/7R5fATgQug8hAWgYyhhjJ/awAQQBEFSY6ZzA/UuX14afiKk6mb6TcIBqKZauQheN2mazvpiXqQgyxDOXJDh
X-Gm-Message-State: AOJu0YwILO6zmVwnhiPVIQaRGMmr90c+UHmavpIi6gXBvF16ZHiPcJJC
	yqY9C9pkOth1Y30Rl+6i7XSn6UNA+GhyfPkhiCprhIKUdw74kqQVCqipXiRlXcC6PUfc53HDvr9
	55imUB1ulrtX7G1EZZRgmZ/MaTzU=
X-Google-Smtp-Source: AGHT+IE97nqVQAIfqHUdp1n4RmhmpnvOFA6ISxTn3V/wPa2NaZ3l1TPOB7q8+9BH8L0361HwtBZkB0IShkv/ovioJbA=
X-Received: by 2002:a17:907:7899:b0:a46:e377:1468 with SMTP id
 ku25-20020a170907789900b00a46e3771468mr8802171ejc.31.1711504496751; Tue, 26
 Mar 2024 18:54:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240326103549.2413515-1-Kelly_Hung@asus.com> <eb4171d9c46dba2aabca90319028ee6be8c80d55.camel@codeconstruct.com.au>
In-Reply-To: <eb4171d9c46dba2aabca90319028ee6be8c80d55.camel@codeconstruct.com.au>
From: Chia Li Hung <ppighouse@gmail.com>
Date: Wed, 27 Mar 2024 09:54:45 +0800
Message-ID: <CAK=2Bxv=SPCG5ZSVAe3pt_hXNWe8Yc78LOSN0+5bcXnbTu6Gsw@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] Add Reviewed-by and Acked-by tags
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Content-Type: multipart/alternative; boundary="0000000000008f7ca606149ab1ec"
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, kelly_hung@asus.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, Allenyy_Hsu@asus.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000008f7ca606149ab1ec
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Andrew,
Thanks a lot. I got it.

Best Regards
Kelly

Andrew Jeffery <andrew@codeconstruct.com.au> =E6=96=BC 2024=E5=B9=B43=E6=9C=
=8827=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=889:46=E5=AF=AB=E9=81=93=
=EF=BC=9A

> Hi Kelly,
>
> On Tue, 2024-03-26 at 18:35 +0800, Kelly Hung wrote:
> > There are no changes to the Patch file, just the reviewed and acked tag=
s
> are added.
> > PATCH v5 has been merged into the next branch.
>
> As others have said, please don't add tags that have not been
> explicitly given for your patches.
>
> Further, if a patch has been added to any upstream "next" branches it's
> not necessary to resend the patches beyond that point, unless there are
> errors that need correcting.
>
> Joel had added an earlier revision of your patches to a branch of
> candidate patches to upstream, and I've updated those in my own that
> I'm maintaining while he's on leave. I'd also added your patches to the
> OpenBMC kernel tree as a consequence, but you shouldn't apply tags to
> your upstream patches that other people didn't provide you on that
> basis.
>
> As for the concerns reported by Rob's bot, I've got a series that
> cleans up many of them. I'm working to find time to send them out.
> Hopefully these help reduce the noise in the future.
>
> Andrew
>
>

--0000000000008f7ca606149ab1ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Andrew,<div>Thanks a lot. I got it.</div><div><br></di=
v><div>Best Regards</div><div>Kelly</div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">Andrew Jeffery &lt;<a href=3D"mail=
to:andrew@codeconstruct.com.au">andrew@codeconstruct.com.au</a>&gt; =E6=96=
=BC 2024=E5=B9=B43=E6=9C=8827=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=
=889:46=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Hi Kelly,<br>
<br>
On Tue, 2024-03-26 at 18:35 +0800, Kelly Hung wrote:<br>
&gt; There are no changes to the Patch file, just the reviewed and acked ta=
gs are added.<br>
&gt; PATCH v5 has been merged into the next branch.<br>
<br>
As others have said, please don&#39;t add tags that have not been<br>
explicitly given for your patches.<br>
<br>
Further, if a patch has been added to any upstream &quot;next&quot; branche=
s it&#39;s<br>
not necessary to resend the patches beyond that point, unless there are<br>
errors that need correcting.<br>
<br>
Joel had added an earlier revision of your patches to a branch of<br>
candidate patches to upstream, and I&#39;ve updated those in my own that<br=
>
I&#39;m maintaining while he&#39;s on leave. I&#39;d also added your patche=
s to the<br>
OpenBMC kernel tree as a consequence, but you shouldn&#39;t apply tags to<b=
r>
your upstream patches that other people didn&#39;t provide you on that<br>
basis.<br>
<br>
As for the concerns reported by Rob&#39;s bot, I&#39;ve got a series that<b=
r>
cleans up many of them. I&#39;m working to find time to send them out.<br>
Hopefully these help reduce the noise in the future.<br>
<br>
Andrew<br>
<br>
</blockquote></div>

--0000000000008f7ca606149ab1ec--
