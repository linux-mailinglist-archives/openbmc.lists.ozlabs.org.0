Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 948391DC782
	for <lists+openbmc@lfdr.de>; Thu, 21 May 2020 09:24:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SLhm5tZRzDqXP
	for <lists+openbmc@lfdr.de>; Thu, 21 May 2020 17:24:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2a;
 helo=mail-yb1-xb2a.google.com; envelope-from=yuenn@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=ucuOXBOl; dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SLgz0b7YzDqKP
 for <openbmc@lists.ozlabs.org>; Thu, 21 May 2020 17:23:25 +1000 (AEST)
Received: by mail-yb1-xb2a.google.com with SMTP id l17so2340397ybk.1
 for <openbmc@lists.ozlabs.org>; Thu, 21 May 2020 00:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ADUuMjOW0XkWzU/SZ12YP2ZppQEDFy5oPU1UsQ7urLE=;
 b=ucuOXBOlLt/2AZ18tHEmxTSnmFmXDRYU3D1k3vDgv8acd8O1GLUsGhn6qeNSNtY0Vt
 ZTUjY3kp0OAiv1lHa2v3faU7+2PBrZ2fVeHhyoyZXH6af7HF7jSgFh/vyM9f8+RvWcSB
 I8fLXipJVnsNI/mUYkJAvkCHjlPB0b5DksPRYl9nH9z3siUQ6c1QIOodd9YQhB6bSJzh
 tQtWM8KdNX2hInRHt+SyXZHOVKiLSYlVChciyIfb5ZOVjG0ADAdElcjOCAiS65mS6ZMn
 PK9fRw6/nu3C9QZbbjs/jNh5u8RCBjOfX3FIB1PtosklDIUvWgQr9mpLeeWj6busji/f
 /2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ADUuMjOW0XkWzU/SZ12YP2ZppQEDFy5oPU1UsQ7urLE=;
 b=NFfUK6bbbJPJxTEJjiRazE6NZsxYmeb61Pl6eTgk8uagSGVReUEtoImVybGo3tEYgY
 j+JFOhPZcSjCMvSoh1Mea2BPPpFxRoglY/fexE5D+D/UaKKmNegUueHoUvkjtW04VQuL
 O4r5gBCBRtCsj71MmTRzURZXcvcAqw5BpCzxVzRBob8FXnGO3U620U7roHGGe0txziQ6
 NjU+rQggI0K0wiUsvuHaQodFue7ffhNIKSRyASYd2NiXv7VQdNJvu3GuDdPBYdPtSXXf
 FlMB9TymurdCjzySsjOj7rZ8B7qQnOhXxRZgBK3jFBpApqq2Dl84rPXanDj9Cof1NYIZ
 h9jA==
X-Gm-Message-State: AOAM5335nw7IF5TBe5jTK+jNFLbRc9GO+jw06LuLou8mhl2dypoeLew6
 gFxG+kg3pvmgC5+XzaXlHGAnEKIbtnFTO8UyJKbTaA==
X-Google-Smtp-Source: ABdhPJx3qi+DcNDq10c0jJFfB0loHhRycQSsFzJWXqprIXP+18CTfCFoRoRgrvodZkb3zKuKg6W9PeZfSExaQMYL3Ao=
X-Received: by 2002:a25:9709:: with SMTP id d9mr12817355ybo.85.1590045802158; 
 Thu, 21 May 2020 00:23:22 -0700 (PDT)
MIME-Version: 1.0
References: <1504A9E7C77EF44697F386AD61B1626015342605@BGSMSX105.gar.corp.intel.com>
 <8ae8365a-ff09-4f4a-9445-17898487cb29@www.fastmail.com>
 <c7996c7f-460a-41df-8d95-4444cee7462e@www.fastmail.com>
 <1504A9E7C77EF44697F386AD61B1626015347268@BGSMSX105.gar.corp.intel.com>
 <0cb06d8b-61fe-4641-960e-f52952bce239@www.fastmail.com>
In-Reply-To: <0cb06d8b-61fe-4641-960e-f52952bce239@www.fastmail.com>
From: Nancy Yuen <yuenn@google.com>
Date: Thu, 21 May 2020 00:22:45 -0700
Message-ID: <CADfYTpG7M-vvFV4oyPTXTdDDe4zJ23QKL4e7mh2XreY07RgJ2g@mail.gmail.com>
Subject: Re: MCTP Sockets related questions
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: multipart/alternative; boundary="000000000000375c2305a62363fb"
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
Cc: "Bhat, Sumanth" <sumanth.bhat@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Thomaiyar,
 Richard Marian" <richard.marian.thomaiyar@intel.com>, "Winiarska,
 Iwona" <iwona.winiarska@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000375c2305a62363fb
Content-Type: text/plain; charset="UTF-8"

Hey Andrew,

Have you pushed a proposal for kernel based MCTP implementation? I didn't
see one... I'd be interested in reading it!

----------
Nancy


On Wed, Apr 22, 2020 at 9:57 PM Andrew Jeffery <andrew@aj.id.au> wrote:

>
>
> On Wed, 22 Apr 2020, at 18:03, Bhat, Sumanth wrote:
> > Hi Andrew,
> >     Thanks a lot for taking the time out for answering our questions on
> > MCTP sockets in detail. Do you have plans of pushing a Kernel based
> > MCTP implementation proposal to gerrit ?
> >
>
> Yes I do! I'll try to get something together in the next week or so.
>
> Andrew
>

--000000000000375c2305a62363fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey Andrew,<div><br></div><div>Have you pushed a proposal=
=C2=A0for kernel based MCTP implementation? I didn&#39;t see one... I&#39;d=
 be interested in reading it!</div><div><br clear=3D"all"><div><div dir=3D"=
ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature">---------=
-<br>Nancy</div></div><br></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 22, 2020 at 9:57 PM Andrew Jeff=
ery &lt;<a href=3D"mailto:andrew@aj.id.au">andrew@aj.id.au</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On Wed, 22 Apr 2020, at 18:03, Bhat, Sumanth wrote:<br>
&gt; Hi Andrew,<br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks a lot for taking the time out for answering =
our questions on <br>
&gt; MCTP sockets in detail. Do you have plans of pushing a Kernel based <b=
r>
&gt; MCTP implementation proposal to gerrit ?<br>
&gt; <br>
<br>
Yes I do! I&#39;ll try to get something together in the next week or so.<br=
>
<br>
Andrew<br>
</blockquote></div>

--000000000000375c2305a62363fb--
