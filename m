Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E53E545D7C2
	for <lists+openbmc@lfdr.de>; Thu, 25 Nov 2021 10:55:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0Csg6Y89z3cSp
	for <lists+openbmc@lfdr.de>; Thu, 25 Nov 2021 20:55:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=f+NP+Gbr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::534;
 helo=mail-ed1-x534.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=f+NP+Gbr; dkim-atps=neutral
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0CsF0Vmkz2yMc;
 Thu, 25 Nov 2021 20:54:40 +1100 (AEDT)
Received: by mail-ed1-x534.google.com with SMTP id t5so23321518edd.0;
 Thu, 25 Nov 2021 01:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l3e4y3dKQ5bF28kOJ3CCuHRbuX7HJ7NATR43PyJwm9A=;
 b=f+NP+GbrdRxZuREHYvvTrRfB1/QsQkaT7vYUMNwkuIIkFNL+77IcXbd07oqRvOQsY5
 b7z+qYKB2QOPkFbcoKgBBnRw2AQlQjnm5C52J3G94zza6FC5c6t7+XvEBh3HvzL5q/s9
 uRsvl4GCuqBjzMgce8ul8HGNxXs82/tMnmZ90fvfycWi1gLx8bJXXi0XeFQA3TX9atfr
 JUknXw7LMzCLsULiSYLr+hgnzAdns3WTdbMUuB78QNX8whktZqVUfgXj8rzmJrXyhFVF
 sMcBlLn0Jk5gP+/7MmA89c1qvBrdrQUi7gZ3GzFPAauLhT4IqudsVzT4G8UMKLw9iYtg
 xzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l3e4y3dKQ5bF28kOJ3CCuHRbuX7HJ7NATR43PyJwm9A=;
 b=W5R73f5NBK5YpQZ7ho4uWWNRTvjAaAOj2IFQGRzr9snWwlHqNRpstgQrfCJeOe/ewL
 iDk7K8az9o+71ZL5UPuHPmBsTiRRhzoKCBzRlnARpfKfQb1bqXH7uim01BvARXG+/FWP
 vrrcr3LsyxnScXNMYNgW6q3ChD2ZOh73gBw1pLQtQk9btk/ntdps9pLe4xdH1fiC3CgZ
 M3YdGEoIWt6b8Y/0j4GphX5tyyceD9nouS6g7oDehn/yfvv0UPyKPEiOFkLwtk73smqv
 yTypGFWfDt+ObwSvntJIyXO49tREsiLKwQY69l/8z2uQxZSIwqPHXOmrJIGCPt8YzVlx
 rM2g==
X-Gm-Message-State: AOAM5324pIHPv9y8a8chZ1Mc7Np0wS9pOFkS/2AqFbbUd3AGGQ2227t+
 4dV8Gj2CqydNl29aRt+OfSmWri3Mnxj/zNYLYWI=
X-Google-Smtp-Source: ABdhPJyU1Rn5IAGuhJRjQ6n7BPBqVhYwzvqlUP+1YtSNQA7ffWrfYp+r2JpSlZworqTNIyGpItDfZhBYRVhyuAF74KM=
X-Received: by 2002:a17:907:7f9e:: with SMTP id
 qk30mr29359313ejc.238.1637834071875; 
 Thu, 25 Nov 2021 01:54:31 -0800 (PST)
MIME-Version: 1.0
References: <20211122163818.GA11306@gmail.com>
 <163775520854.1662.10651574507891086617.git-patchwork-notify@kernel.org>
In-Reply-To: <163775520854.1662.10651574507891086617.git-patchwork-notify@kernel.org>
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Date: Thu, 25 Nov 2021 15:26:27 +0530
Message-ID: <CAA7TbcvDeH5sCULo+2rEhZ5ZTht2vPF3uVh4knt7r77JquH4fA@mail.gmail.com>
Subject: Re: [PATCH v8] net/ncsi : Add payload to be 32-bit aligned to fix
 dropped packets
To: patchwork-bot+netdevbpf@kernel.org
Content-Type: multipart/alternative; boundary="0000000000000e23af05d199f6d7"
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Networking <netdev@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Amithash Prasad <amithash@fb.com>,
 patrickw3@fb.com, Jakub Kicinski <kuba@kernel.org>,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>, velumanit@hcl.com,
 "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000000e23af05d199f6d7
Content-Type: text/plain; charset="UTF-8"

Awesome, thanks!

On Wed, Nov 24, 2021 at 5:30 PM <patchwork-bot+netdevbpf@kernel.org> wrote:

> Hello:
>
> This patch was applied to netdev/net.git (master)
> by David S. Miller <davem@davemloft.net>:
>
> On Mon, 22 Nov 2021 22:08:18 +0530 you wrote:
> > Update NC-SI command handler (both standard and OEM) to take into
> > account of payload paddings in allocating skb (in case of payload
> > size is not 32-bit aligned).
> >
> > The checksum field follows payload field, without taking payload
> > padding into account can cause checksum being truncated, leading to
> > dropped packets.
> >
> > [...]
>
> Here is the summary with links:
>   - [v8] net/ncsi : Add payload to be 32-bit aligned to fix dropped packets
>     https://git.kernel.org/netdev/net/c/ac132852147a
>
> You are awesome, thank you!
> --
> Deet-doot-dot, I am a bot.
> https://korg.docs.kernel.org/patchwork/pwbot.html
>
>
>

--0000000000000e23af05d199f6d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Awesome, thanks!=C2=A0<br></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 24,=
 2021 at 5:30 PM &lt;<a href=3D"mailto:patchwork-bot%2Bnetdevbpf@kernel.org=
">patchwork-bot+netdevbpf@kernel.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Hello:<br>
<br>
This patch was applied to netdev/net.git (master)<br>
by David S. Miller &lt;<a href=3D"mailto:davem@davemloft.net" target=3D"_bl=
ank">davem@davemloft.net</a>&gt;:<br>
<br>
On Mon, 22 Nov 2021 22:08:18 +0530 you wrote:<br>
&gt; Update NC-SI command handler (both standard and OEM) to take into<br>
&gt; account of payload paddings in allocating skb (in case of payload<br>
&gt; size is not 32-bit aligned).<br>
&gt; <br>
&gt; The checksum field follows payload field, without taking payload<br>
&gt; padding into account can cause checksum being truncated, leading to<br=
>
&gt; dropped packets.<br>
&gt; <br>
&gt; [...]<br>
<br>
Here is the summary with links:<br>
=C2=A0 - [v8] net/ncsi : Add payload to be 32-bit aligned to fix dropped pa=
ckets<br>
=C2=A0 =C2=A0 <a href=3D"https://git.kernel.org/netdev/net/c/ac132852147a" =
rel=3D"noreferrer" target=3D"_blank">https://git.kernel.org/netdev/net/c/ac=
132852147a</a><br>
<br>
You are awesome, thank you!<br>
-- <br>
Deet-doot-dot, I am a bot.<br>
<a href=3D"https://korg.docs.kernel.org/patchwork/pwbot.html" rel=3D"norefe=
rrer" target=3D"_blank">https://korg.docs.kernel.org/patchwork/pwbot.html</=
a><br>
<br>
<br>
</blockquote></div></div>

--0000000000000e23af05d199f6d7--
