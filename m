Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECBC3127E1
	for <lists+openbmc@lfdr.de>; Sun,  7 Feb 2021 23:29:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DYkN31BdKzDwkY
	for <lists+openbmc@lfdr.de>; Mon,  8 Feb 2021 09:29:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::136;
 helo=mail-il1-x136.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=ClghHd9L; dkim-atps=neutral
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DYkMB41nHzDwhn
 for <openbmc@lists.ozlabs.org>; Mon,  8 Feb 2021 09:28:18 +1100 (AEDT)
Received: by mail-il1-x136.google.com with SMTP id e7so11046755ile.7
 for <openbmc@lists.ozlabs.org>; Sun, 07 Feb 2021 14:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=wOqgV9DqiDBaF50Wtmeoxk/CKIkNKRgjsuQDhQAOcfo=;
 b=ClghHd9L1j2Z3UYt4GxTzrv6P86lfbb7uESQy1i648dp696eGOKbsOHXPyIBgIKbe6
 l928J2lq2YK0ScMaf2Yxd0xHrdDjxauCRiQOyw7LWODmz7r2rm4s0g0WCNq07tBh4vAG
 BQfDgVg69q+nhgZ69McHMLkuFvVRiMJaZE9iNqKXUR7WBUjJf8BHSd2W7XUQhQffTl+J
 REHXD98Kw7ry7k80NjhUc12KV8/boBpumVeLboqo8HDj7shC6GupsflkvBB/VJWyZBRJ
 +2R8hJsgyBzNfmLsvGa75MZzwwx25o2JYvJj3BNaQyjIVJItsML1uZmSDYbpzc4bKYtJ
 mR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=wOqgV9DqiDBaF50Wtmeoxk/CKIkNKRgjsuQDhQAOcfo=;
 b=dfHJz4bCg55i5osdpAVh4Ii/F/d5BYiNLnm0ch9zCb5VBL0ML5wqFGZp0v0ZrZ5+Lc
 IFJSNrdK3eoT4K8Q5seIl8An5uy2pmQC6AudtZumdNIWfJSD+KeCjj8zmjHEV6PGjtlb
 ubO6JfiXbM38f8ha3oeGLHUK7S1hCGjCdh9ioH7tdeOHw6kscAVGK6MeKScI+TkYDUbo
 B/sgfuZy/Kcy8xdmG7ZjYK+6vyhQOBbPkGpS5CacdhKsORPfqt4/F/+WLBrHWZLP7TsT
 urWJgQfV+bH1t8kdeDNVimcXaId8LRYPEqym4FU2LuhKKbd3HMZUQK1i9qEghA9R7iOX
 JSuw==
X-Gm-Message-State: AOAM533fbz4sRV/I39s12zyKf9MdedD68ul6KfRJvneCoQJGNKjgzpqD
 RmAuB2/R3gKmUWdtdndreftnS6AvtQjnO7Uac92sOFgjGt4=
X-Google-Smtp-Source: ABdhPJyPmmFT2KLFBhT4LXup25e3yxC4KUhM2f22B+YN68rSnS39zxIgS4ZE/Pw4t/gbKkYDt7LbWC3M7U0MN3tgydM=
X-Received: by 2002:a05:6e02:1ca4:: with SMTP id
 x4mr6403281ill.58.1612736893602; 
 Sun, 07 Feb 2021 14:28:13 -0800 (PST)
MIME-Version: 1.0
References: <CADVsX8_ua6nShjGQbK1nVqsn34+dArF69sCLcLt6U+0_zXj54w@mail.gmail.com>
In-Reply-To: <CADVsX8_ua6nShjGQbK1nVqsn34+dArF69sCLcLt6U+0_zXj54w@mail.gmail.com>
From: Anton Kachalov <rnouse@google.com>
Date: Sun, 7 Feb 2021 23:28:02 +0100
Message-ID: <CADVsX8_vXebzp_bjj5qWg2Xm7i9jZ1N+OmFVA=LAgOJXM6W8MQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: nuvoton: Fix flash layout
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000a9190105bac6918c"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000a9190105bac6918c
Content-Type: text/plain; charset="UTF-8"

Patch has tab symbols. Have no idea how to submit it in 2021 by email :)

On Sun, 7 Feb 2021 at 18:58, Anton Kachalov <rnouse@google.com> wrote:

> This change satisfies OpenBMC requirements for flash layout.
>
> Signed-off-by: Anton D. Kachalov <gmouse@google.com>
> ---
>  arch/arm/boot/dts/nuvoton-npcm750-evb.dts | 28 +++++++----------------
>  1 file changed, 8 insertions(+), 20 deletions(-)
>
> diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> index bd1eb6ee380f..741c1fee8552 100644
> --- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> +++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> @@ -182,8 +182,8 @@ bbuboot2@80000 {
>   reg = <0x0080000 0x80000>;
>   read-only;
>   };
> - envparam@100000 {
> - label = "env-param";
> + ubootenv@100000 {
> + label = "u-boot-env";
>   reg = <0x0100000 0x40000>;
>   read-only;
>   };
> @@ -195,25 +195,13 @@ kernel@200000 {
>   label = "kernel";
>   reg = <0x0200000 0x400000>;
>   };
> - rootfs@600000 {
> - label = "rootfs";
> - reg = <0x0600000 0x700000>;
> + rofs@780000 {
> + label = "rofs";
> + reg = <0x0780000 0x1680000>;
>   };
> - spare1@D00000 {
> - label = "spare1";
> - reg = <0x0D00000 0x200000>;
> - };
> - spare2@0F00000 {
> - label = "spare2";
> - reg = <0x0F00000 0x200000>;
> - };
> - spare3@1100000 {
> - label = "spare3";
> - reg = <0x1100000 0x200000>;
> - };
> - spare4@1300000 {
> - label = "spare4";
> - reg = <0x1300000 0x0>;
> + rwfs@1e00000 {
> + label = "rwfs";
> + reg = <0x1e00000 0x200000>;
>   };
>   };
>   };
> --
> 2.30.0.478.g8a0d178c01-goog
>
>
>

--000000000000a9190105bac6918c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Patch has tab symbols. Have no idea how to submit it in 20=
21 by email :)</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, 7 Feb 2021 at 18:58, Anton Kachalov &lt;<a href=3D"=
mailto:rnouse@google.com">rnouse@google.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>This chang=
e satisfies OpenBMC requirements for flash layout.<br><br>Signed-off-by: An=
ton D. Kachalov &lt;<a href=3D"mailto:gmouse@google.com" target=3D"_blank">=
gmouse@google.com</a>&gt;<br>---<br>=C2=A0arch/arm/boot/dts/nuvoton-npcm750=
-evb.dts | 28 +++++++----------------<br>=C2=A01 file changed, 8 insertions=
(+), 20 deletions(-)<br><br>diff --git a/arch/arm/boot/dts/nuvoton-npcm750-=
evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts<br>index bd1eb6ee380f..=
741c1fee8552 100644<br>--- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts<br>+=
++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts<br>@@ -182,8 +182,8 @@ bbubo=
ot2@80000 {<br>=C2=A0				reg =3D &lt;0x0080000 0x80000&gt;;<br>=C2=A0				re=
ad-only;<br>=C2=A0				};<br>-			envparam@100000 {<br>-				label =3D &quot;e=
nv-param&quot;;<br>+			ubootenv@100000 {<br>+				label =3D &quot;u-boot-env=
&quot;;<br>=C2=A0				reg =3D &lt;0x0100000 0x40000&gt;;<br>=C2=A0				read-o=
nly;<br>=C2=A0				};<br>@@ -195,25 +195,13 @@ kernel@200000 {<br>=C2=A0				=
label =3D &quot;kernel&quot;;<br>=C2=A0				reg =3D &lt;0x0200000 0x400000&g=
t;;<br>=C2=A0				};<br>-			rootfs@600000 {<br>-				label =3D &quot;rootfs&q=
uot;;<br>-				reg =3D &lt;0x0600000 0x700000&gt;;<br>+			rofs@780000 {<br>+=
				label =3D &quot;rofs&quot;;<br>+				reg =3D &lt;0x0780000 0x1680000&gt;=
;<br>=C2=A0				};<br>-			spare1@D00000 {<br>-				label =3D &quot;spare1&quo=
t;;<br>-				reg =3D &lt;0x0D00000 0x200000&gt;;<br>-				};<br>-			spare2@0F=
00000 {<br>-				label =3D &quot;spare2&quot;;<br>-				reg =3D &lt;0x0F00000=
 0x200000&gt;;<br>-				};<br>-			spare3@1100000 {<br>-				label =3D &quot;s=
pare3&quot;;<br>-				reg =3D &lt;0x1100000 0x200000&gt;;<br>-				};<br>-			=
spare4@1300000 {<br>-				label =3D &quot;spare4&quot;;<br>-				reg =3D &lt;=
0x1300000 0x0&gt;;<br>+			rwfs@1e00000 {<br>+				label =3D &quot;rwfs&quot;=
;<br>+				reg =3D &lt;0x1e00000 0x200000&gt;;<br>=C2=A0			};<br>=C2=A0		};<=
br>=C2=A0	};<br>-- <br>2.30.0.478.g8a0d178c01-goog<br><br></div><div><br></=
div></div>
</blockquote></div>

--000000000000a9190105bac6918c--
