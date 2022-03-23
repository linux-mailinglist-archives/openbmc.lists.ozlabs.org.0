Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9724E54A6
	for <lists+openbmc@lfdr.de>; Wed, 23 Mar 2022 15:56:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KNryQ3L4jz306S
	for <lists+openbmc@lfdr.de>; Thu, 24 Mar 2022 01:55:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=M3MqOUBQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=logananth13.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=M3MqOUBQ; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNrxz3QSjz2yPv
 for <openbmc@lists.ozlabs.org>; Thu, 24 Mar 2022 01:55:34 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id p17so1748164plo.9
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2022 07:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vD5IS4OW49vl6tWiBUmHBh4JuVoVxF0CvNfwp5iKFRM=;
 b=M3MqOUBQHuzqj2eRujlFK8TAipTWGFUVAjDmMJ7HZN3URKcLRvgA2IWlcSTHpRWT2S
 XG5eQV3DfQJhsATw5n8MTfP/vjyVE64x8tjbZGP8Fmxsn9sZfVl+qi6u0aQLjmMlvax0
 FiZEBVMjO069DqfbYNGkb7vJq3rk9UdM8LOdwgLQI0Oihb7JqXP404WD4JCGgpP53a6E
 yNCW62ZFtLKZ1TgJ9eYDbUrFJsxORCX1lzlugS7sn8LnP7N2BK1g87Q6/Ia01DxvPjMk
 Q38vaUImqb7/talwy/jGjWRKv8WGOiFGKTi9Ux3QSLBDv147BiMssyHSmTM0jH8HC3v8
 X2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vD5IS4OW49vl6tWiBUmHBh4JuVoVxF0CvNfwp5iKFRM=;
 b=qAyyd7jwwCI9ikbHbv9UnwonlYI5GiCuDPa3vX9vOK/x+PuHSElOoVu1tns3BtcIKB
 bK+PBMxy/B3f1XNwzlufrXan+JzhGfNrvCWi++FRjIH71ppb4FQk1ks6ZLf82+uOxrVx
 iug1PoyahfpjBV+3p3eh4OkfpW0qQed/ZH1IJhhcTjOtsIDZlFzUGop80U5qoj3hPeUw
 OjJkBzg7lF6rXnCuyvxw7l4gwx0veBLpF4U43ArVIKDkjNj98Yg3bvH6EzYygwOWgfYc
 Gu9EgpOwQ8sJfKLE6rmrTLowqC45GoHxYpFy5etVym9yQ7SkcNhPXwuZQ/v6X0gSKf3P
 87zg==
X-Gm-Message-State: AOAM531zfEb+bdPY7HXz8pK+QXAMg5XZa2izHrFTiXrdNiBXaivcr88l
 Ml3XzWm+dOdvPMTCqLRzUTuebLs92P06dlpcirw=
X-Google-Smtp-Source: ABdhPJzsJogmfzdIXfhm+dUpYwfwxsFYsFrmGIPZri/ScodZ3N3VkRCAp679dLH8ncNRWkEB9GUKWaGEBLv3xIrH55M=
X-Received: by 2002:a17:90b:1642:b0:1c7:2497:3807 with SMTP id
 il2-20020a17090b164200b001c724973807mr11977021pjb.176.1648047330241; Wed, 23
 Mar 2022 07:55:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAGpPFEHeN0NL3EJ238BbGLNpaayRo4SGcfWdRTdNiEgpq2a0Ng@mail.gmail.com>
 <ea0c2d76-0a89-487a-a710-d6a07ae967b9@www.fastmail.com>
In-Reply-To: <ea0c2d76-0a89-487a-a710-d6a07ae967b9@www.fastmail.com>
From: logananth hcl <logananth13.hcl@gmail.com>
Date: Wed, 23 Mar 2022 20:25:18 +0530
Message-ID: <CAGpPFEHTu83O1S9NOP02WQpbuvrf3RRUf=VnPNc352CrzxnnQw@mail.gmail.com>
Subject: Re: Applying patches to U-boot 2019.04
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000b12fae05dae3eb25"
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
Cc: "Velumani T-ERS, HCLTech" <velumanit@hcl.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000b12fae05dae3eb25
Content-Type: text/plain; charset="UTF-8"

I have pushed the related machine layer u-boot patch files,
in the following gerrit link,

https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/52263

Suggest me to add these patch files to the list.

In the local build itself, u-boot bb_patches are not applied during
bitbake(copied to the build's u-boot folder), is there any restriction on
this to apply bb_patch files.
I'm facing repotest failure, I think that will be resolved once it is added
in the repotest.

On Wed, Mar 23, 2022 at 9:35 AM Andrew Jeffery <andrew@aj.id.au> wrote:

>
>
> On Wed, 23 Mar 2022, at 01:13, logananth hcl wrote:
> > Hai all,
> > I'm trying to port the u-boot to the 2019.04-aspeed-openbmc,
> > Here trying to apply *.patch file and also applying the defconfig for the
> > u-boot from the specific meta-layer.
> >
> > In this case, the defconfig file changes have been applied clearly to
> > u-boot in tmp, but those patch files are copying to the machine tmp
> folder
> > but not applied to the code!
> >
> > Is there any restriction for applying patches to the 2019.04-aspeed
> openbmc
> > ?
> > If not, is there any other suggestion for applying patches.
>
> Send them to this list so we can apply them to the openbmc/u-boot tree :)
>
> Andrew
>

--000000000000b12fae05dae3eb25
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have pushed the related machine layer u-boot patch files=
,<br>in the following gerrit link,<div><br><a href=3D"https://gerrit.openbm=
c-project.xyz/c/openbmc/openbmc/+/52263">https://gerrit.openbmc-project.xyz=
/c/openbmc/openbmc/+/52263</a><br><br>Suggest me to add these patch files t=
o the list.<br><br>In the local build itself, u-boot bb_patches are not app=
lied during bitbake(copied to the build&#39;s u-boot folder), is there any =
restriction on this to apply bb_patch files.<br>I&#39;m facing repotest fai=
lure, I think that will be resolved once it is added in the repotest.<br></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Wed, Mar 23, 2022 at 9:35 AM Andrew Jeffery &lt;<a href=3D"mailto:an=
drew@aj.id.au">andrew@aj.id.au</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><br>
<br>
On Wed, 23 Mar 2022, at 01:13, logananth hcl wrote:<br>
&gt; Hai all,<br>
&gt; I&#39;m trying to port the u-boot to the 2019.04-aspeed-openbmc,<br>
&gt; Here trying to apply *.patch file and also applying the defconfig for =
the<br>
&gt; u-boot from the specific meta-layer.<br>
&gt;<br>
&gt; In this case, the defconfig file changes have been applied clearly to<=
br>
&gt; u-boot in tmp, but those patch files are copying to the machine tmp fo=
lder<br>
&gt; but not applied to the code!<br>
&gt;<br>
&gt; Is there any restriction for applying patches to the 2019.04-aspeed op=
enbmc<br>
&gt; ?<br>
&gt; If not, is there any other suggestion for applying patches.<br>
<br>
Send them to this list so we can apply them to the openbmc/u-boot tree :)<b=
r>
<br>
Andrew<br>
</blockquote></div>

--000000000000b12fae05dae3eb25--
