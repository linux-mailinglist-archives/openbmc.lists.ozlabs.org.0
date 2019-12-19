Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 605E612E15C
	for <lists+openbmc@lfdr.de>; Thu,  2 Jan 2020 01:40:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47p8MM6tY6zDqDP
	for <lists+openbmc@lfdr.de>; Thu,  2 Jan 2020 11:40:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c43;
 helo=mail-yw1-xc43.google.com; envelope-from=manikandan.hcl.ers.epl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="r+uPJHGc"; 
 dkim-atps=neutral
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47f0BV6FLYzDqsl;
 Fri, 20 Dec 2019 05:04:17 +1100 (AEDT)
Received: by mail-yw1-xc43.google.com with SMTP id 192so2513628ywy.0;
 Thu, 19 Dec 2019 10:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9xu0gXAThjHuomxAy7z6jsSTfBUFXaBbfxFNyRlgnOQ=;
 b=r+uPJHGclcgLynQhEfG14MDTO/RMOLYcYvw0iYfH6dKv/BaVcyyYE8aXDQDOh+XfqA
 J9Qv/Nhf/+sTj/aDudTA9Svt38OHhNIICoDGbzYeXFW/y889Kpzt/UbKep8SJi6D/xIP
 mP3S12j/Zt9KBkMeTbG8KR+RPHHFccs83AO6NnZIhKJnavAqLiX1A3bc+e4ejcmFeoCz
 lhiS9PEGxguvaJ6K22xPMwQmWd4b+yVbwMA0/EECYexFbMvf6XaXwM6UcUhwHOmnFLRC
 g9Tnzdgf1fwZ+V61ZwNhKDk6w9CI73inURralZcWktVZja7ffHDOecbUXNO3K+2f+wHg
 MOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9xu0gXAThjHuomxAy7z6jsSTfBUFXaBbfxFNyRlgnOQ=;
 b=jxIdXvhIxJD9XUWX8b4/NKPnmZQgGvGm+YgVBPqULUrVacnEAfi+gn8GVWluq07juh
 w+jc2YpQo+wFHWUc+pH+DMHfNEk2YCNQxWA15vTvtxvbzKIRyC6Sa3jdpENAy9dLh7J4
 k3BaYGAI4FujhUyL6/la4lDREK05Zb3zPy23/fTbTg1QqvgrHqjuhhZGwJGfdDzCQp6l
 5MXmrpxfKB+PJzDZ9dGngv8YrkEimGSwBztM9Ms4cjpxozTpo5T51BqCmJ+j5HVKObUX
 J4XkDarVj7bCuwNu5XrOo9LGGly5xQ60NQM4maE5Q73SgAHbHqJ2nLt7LXHro6kT6slk
 18uw==
X-Gm-Message-State: APjAAAXoXpx7k0oHZxm+USVjPngx5BBmlIhvnlFb9kS/uRlDGOz+v5f5
 PqXFE7l4L2/fPQxJ8KtR+3/+13AzlhiDsUBtzh4=
X-Google-Smtp-Source: APXvYqw6Ir29YLk5I6WL/pv/bINQKUTINTla2xvLPfkhIq2pRcOpKh27T6T67kFRwemuUTOBaoLESpn3vF81oORN/5M=
X-Received: by 2002:a0d:d7c9:: with SMTP id z192mr7529433ywd.502.1576778655292; 
 Thu, 19 Dec 2019 10:04:15 -0800 (PST)
MIME-Version: 1.0
References: <20191213135131.GA1822@cnn>
 <8017a61e-e579-41ea-816a-4a76a6dc41e9@www.fastmail.com>
In-Reply-To: <8017a61e-e579-41ea-816a-4a76a6dc41e9@www.fastmail.com>
From: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
Date: Thu, 19 Dec 2019 23:33:33 +0530
Message-ID: <CAMRErLPS69htCp2hGsy5__HEEY=7V=Ao5754nu2Xe=VkB3t6iQ@mail.gmail.com>
Subject: Re: [PATCH v5] ARM: dts: aspeed: Adding Facebook Yosemite V2 BMC
To: Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary="000000000000a36002059a12631c"
X-Mailman-Approved-At: Thu, 02 Jan 2020 11:32:09 +1100
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
Cc: devicetree@vger.kernel.org, manikandan.e@hcl.com,
 linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000a36002059a12631c
Content-Type: text/plain; charset="UTF-8"

Hi Joel,
              I have done the changes as per your review comments in v4
and submitted as v5 . Please review the v5 patch.
Thanks
Mani.E

On Mon, Dec 16, 2019 at 5:03 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> On Sat, 14 Dec 2019, at 00:21, Manikandan Elumalai wrote:
> > The Yosemite V2 is a facebook multi-node server
> > platform that host four OCP server. The BMC
> > in the Yosemite V2 platform based on AST2500 SoC.
> >
> > This patch adds linux device tree entry related to
> > Yosemite V2 specific devices connected to BMC SoC.
> >
> > Signed-off-by : Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
> > Acked-by        : Andrew Jeffery <andrew@aj.id.au>
> > Reviewed-by  : Vijay Khemka <vkhemka@fb.com>
>
> In the future, don't worry about aligning parts of the tag text. Single
> space is
> the custom (and is less effort!)
>
> Andrew
>

--000000000000a36002059a12631c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Joel,</div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I have done the changes as pe=
r your review comments in v4=C2=A0 and submitted as v5 . Please review the =
v5 patch.<br></div><div>Thanks</div><div>Mani.E<br></div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 16, 20=
19 at 5:03 AM Andrew Jeffery &lt;<a href=3D"mailto:andrew@aj.id.au">andrew@=
aj.id.au</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Sat, 14 Dec 2019, at 00:21, Manikandan Elumalai wrote:<br>
&gt; The Yosemite V2 is a facebook multi-node server<br>
&gt; platform that host four OCP server. The BMC<br>
&gt; in the Yosemite V2 platform based on AST2500 SoC.<br>
&gt; <br>
&gt; This patch adds linux device tree entry related to<br>
&gt; Yosemite V2 specific devices connected to BMC SoC.<br>
&gt; <br>
&gt; Signed-off-by : Manikandan Elumalai &lt;<a href=3D"mailto:manikandan.h=
cl.ers.epl@gmail.com" target=3D"_blank">manikandan.hcl.ers.epl@gmail.com</a=
>&gt;<br>
&gt; Acked-by=C2=A0 =C2=A0 =C2=A0 =C2=A0 : Andrew Jeffery &lt;<a href=3D"ma=
ilto:andrew@aj.id.au" target=3D"_blank">andrew@aj.id.au</a>&gt;<br>
&gt; Reviewed-by=C2=A0 : Vijay Khemka &lt;<a href=3D"mailto:vkhemka@fb.com"=
 target=3D"_blank">vkhemka@fb.com</a>&gt;<br>
<br>
In the future, don&#39;t worry about aligning parts of the tag text. Single=
 space is<br>
the custom (and is less effort!)<br>
<br>
Andrew<br>
</blockquote></div>

--000000000000a36002059a12631c--
