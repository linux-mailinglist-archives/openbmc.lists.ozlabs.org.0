Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5F31CDE1A
	for <lists+openbmc@lfdr.de>; Mon, 11 May 2020 17:04:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LPNm2XZVzDqBX
	for <lists+openbmc@lfdr.de>; Tue, 12 May 2020 01:04:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::22b;
 helo=mail-lj1-x22b.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=oKS29Ihw; dkim-atps=neutral
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LML94nbszDqNB
 for <openbmc@lists.ozlabs.org>; Mon, 11 May 2020 23:32:16 +1000 (AEST)
Received: by mail-lj1-x22b.google.com with SMTP id a21so9467003ljj.11
 for <openbmc@lists.ozlabs.org>; Mon, 11 May 2020 06:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OkajmhD/8r5dBozmYPhzQ+ELYHwc3fqA5ijyYK5xf3w=;
 b=oKS29IhwGZk9/qQXWMSU/NG3TaANkC40QgEHgqu0/0g3n8PmQg0xoPPHvIAcc2eohn
 yL08GmdI7y7RwT52FPwKgYxSPJq22dJOnPY5SZRkr0u25/vTzVPazDVYd8CEOmsz8O/3
 5M7/8BBrE6v0l4AALx5qkb3z5hScEiQ55PEhMIkePcf/OTp6JR8rAhM02cU6/CmqAuMD
 576WJ864GiXY5Qc1ay1mvYp1hbNqiUeAKyhtQRPfXEUY7f6PqFN+2VLcFSPHJTyX8HDh
 Vkb1imXJx94Hy6SmXZjgoodYVIeFqTqeRpr7nYxPylM6dTVwufIf1erZrn1CjNgNgxW/
 Th/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OkajmhD/8r5dBozmYPhzQ+ELYHwc3fqA5ijyYK5xf3w=;
 b=VZZi5Lk44DWjuPrMtdDLUDJI2otqQMSD5wD2racr561WibriAcLPnCY44ecy9Pxo0/
 J1GqqaaaDZPkoxQ4bchWrihrfELU+p2rbcqxqEp9CMpie84FiNq3Yv45b3FPktc0N0eV
 i2YMqrOUsFILKSFKNY8fE5gPHcwkgvAe7PuJOmJY6lx+WyE+miW1SCueXppWgZcKqGvz
 ii6oms6R+FsnEX8+tuPcR98kr4LnndUUi1RiJPGmvsqnXOvGudprdDD1QyGq3xNV/2TP
 I8DgoS0nVCM5GHRXYFiaei+eAbxv804hK86n9yCFgKymugjNfWYt7vZmR3KWkzIMV52j
 5vnw==
X-Gm-Message-State: AOAM5326gH2QzH2iasmQKLNa4PPFYNPnXhH53CiVkzSkHyunWulpINSU
 SAaPRhWjLSphu55sHBX0t3Qztgq4v0EGpPva8M0qfQ==
X-Google-Smtp-Source: ABdhPJxua4Pft7FJykQYsgzMZs0gkzJQ3UAD9c6yn13wyDFjDQQxghuQ9ASJYAaXWe6Hf2aHamB1+RY70iLQyDUUQqY=
X-Received: by 2002:a2e:909a:: with SMTP id l26mr10130613ljg.262.1589203929520; 
 Mon, 11 May 2020 06:32:09 -0700 (PDT)
MIME-Version: 1.0
References: <50cce7b2.1057.171fdb24f4d.Coremail.zhang_cy1989@163.com>
 <775abd77-ce5b-4f1d-99e6-8f14b06114fa@www.fastmail.com>
 <840ea83777699177e2af8ba77c193c73e27feaca.camel@ozlabs.org>
In-Reply-To: <840ea83777699177e2af8ba77c193c73e27feaca.camel@ozlabs.org>
From: Oskar Senft <osk@google.com>
Date: Mon, 11 May 2020 09:31:53 -0400
Message-ID: <CABoTLcSappOuBWZ6w=PZPNo4=EbzPiTVbYV6vv10AS9bG116hQ@mail.gmail.com>
Subject: Re: How to use eSPI between Host and slave BMC in openbmc project
To: Jeremy Kerr <jk@ozlabs.org>, zhang_cy1989 <zhang_cy1989@163.com>
Content-Type: multipart/alternative; boundary="000000000000b26cf605a55f5fcf"
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000b26cf605a55f5fcf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

Jeremy's response matches my understanding, thank you!

> 1 Are there some solutions to use eSPI interface in openbmc project?
>
> There are some platforms in development that use eSPI between the host
> and BMC, yes.
>
On platforms using Intel's C620 series PCH + AST2500 BMC,  eSPI can be used
basically exactly like LPC on both sides.


> For the BMC, we need some support in the kernel to handle eSPI
> behaviour. There is a prototype driver for the ast2500 eSPI slave
> around, but it hasn't made it upstream:
>
> https://lists.ozlabs.org/pipermail/openbmc/2018-February/010937.html

Yes, without that, the PCH will not release the host CPU from reset.

 > 5 eSPI interface can transmit io cycle and mem cycle=EF=BC=8C

> > but in which case or applications eSPI transfer mem cycle?
>
> I haven't seen anything specific, I don't think it'd be too useful in
> our architecture.
>
I've seen platforms that load the "lower 16 MiB" from SPI flash (descriptor
region, ME, GbE FW) and load the "upper 16 MiB" (the actual BIOS) via LPC.
The same should be possible via eSPI.

Note that with eSPI it would "technically" be possible to load _ALL_ FW for
the PCH (descriptor region, ME, GbE FW, BIOS) via eSPI using the "Slave
Attached Flash Sharing" (SAFS) feature. However, there's no BMC available
today that I know of that supports that, but support is in the works on BMC
chips. Having said that, Intel's support for SAFS is unclear: some
documents claim it's supported, others state it's not POR (SAFS that is).

Happy to provide more information.

Oskar.

--000000000000b26cf605a55f5fcf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi</div><div><br></div><div>Jeremy&#39;s response mat=
ches my understanding, thank you!</div><div><br></div><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; 1 Are there so=
me solutions to use eSPI interface in openbmc project?<br>
<br>
There are some platforms in development that use eSPI between the host<br>
and BMC, yes.<br></blockquote><div>On platforms using Intel&#39;s C620 seri=
es PCH + AST2500 BMC,=C2=A0 eSPI can be used basically exactly like LPC on =
both sides.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">For the BMC, we need some support in the kernel to handle eSPI<b=
r>
behaviour. There is a prototype driver for the ast2500 eSPI slave<br>
around, but it hasn&#39;t made it upstream:<br>
<br>
<a href=3D"https://lists.ozlabs.org/pipermail/openbmc/2018-February/010937.=
html" rel=3D"noreferrer" target=3D"_blank">https://lists.ozlabs.org/piperma=
il/openbmc/2018-February/010937.html</a></blockquote><div>Yes, without that=
, the PCH will not release the host CPU from reset.</div><div><br></div><di=
v>=C2=A0&gt; 5 eSPI interface can transmit io cycle and mem cycle=EF=BC=8C=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; but in which case or applications eSPI transfer mem cycle?<br>
<br>
I haven&#39;t seen anything specific, I don&#39;t think it&#39;d be too use=
ful in<br>
our architecture.<br></blockquote><div>I&#39;ve seen platforms that load th=
e &quot;lower 16 MiB&quot; from SPI flash (descriptor region, ME, GbE FW) a=
nd load the &quot;upper 16 MiB&quot; (the actual BIOS) via LPC. The same sh=
ould be possible via eSPI.</div><div><br></div><div>Note that with eSPI it =
would &quot;technically&quot; be possible to load _ALL_ FW for the PCH (des=
criptor region, ME, GbE FW, BIOS) via eSPI using the &quot;Slave Attached F=
lash Sharing&quot; (SAFS) feature. However, there&#39;s no BMC available to=
day that I know of that supports that, but support is in the works on BMC c=
hips. Having said that, Intel&#39;s support for SAFS is unclear: some docum=
ents claim it&#39;s supported, others state it&#39;s not POR (SAFS that is)=
.</div><div><br></div><div>Happy to provide more information.</div><div><br=
></div><div>Oskar.</div></div></div>

--000000000000b26cf605a55f5fcf--
