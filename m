Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA4D434624
	for <lists+openbmc@lfdr.de>; Wed, 20 Oct 2021 09:47:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZ2lB183Rz2yPY
	for <lists+openbmc@lfdr.de>; Wed, 20 Oct 2021 18:47:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Cfv/oH29;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52d;
 helo=mail-ed1-x52d.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Cfv/oH29; dkim-atps=neutral
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZ2kf4cyFz2yK3;
 Wed, 20 Oct 2021 18:47:04 +1100 (AEDT)
Received: by mail-ed1-x52d.google.com with SMTP id w19so22785917edd.2;
 Wed, 20 Oct 2021 00:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JJOU7fJb6YvZ8wVEmo1A5LTE4KIeqxiL8hGoRioBO94=;
 b=Cfv/oH2943qlkmcSs+Jp4AwfjAVjT2r9/q2Ls1zdPCISlQn/SUSP7ToCnybZvEO1Ew
 mdrwJ/UqiRIgnUj6kF0GuL3uUCoAzbVLX1zhmV+LMDcCZR3X4Mavqbb9EPBiqJrhII/3
 8ZNAhWKiIS/aDcfT8K/8mDvJbfVs6Zs9Q6magDYy6N7U/cZRVGE9ALDUpR0UYbNPo7PY
 9USVt3vX5wzDWi5pCwAvriaCPLXSjgG61L8WCVABzZUK4VoLtDZ8MDPqvw9SvKfTIaMP
 zJAXvdwqyL7nabcstP4+dQXzPMdg3OAK7JL7lrpvrU3ZSJQ/JKDoybLIHxSlEiCjakcA
 xc/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JJOU7fJb6YvZ8wVEmo1A5LTE4KIeqxiL8hGoRioBO94=;
 b=YbcOolchhXITpgtmWY12EE+c/UCxtyy7XR6MpqHpVt7hnQ9vnT+rXH5Bmia/jYTek2
 HvErP4upHMao5zjwkI75sKHevzxJtOAvIWqp7TQtx2ocSyho2ko5bYKSjE0k8Tprtm/F
 SPY9CzMtq+w6uiUJtq3CRIuC9LQzzLy24hDcF8UpcMUjySo9v6Kuh5fBYkd3662XP7nZ
 vpLxrNaTO4uioC7l8tsZn9UwHkmMjfHLuNDQWtDZHC1B4hSKG3gsLY0dNK6fQE9ufTum
 kYMXPvQi+ZqyDOMHRKEhcGqtILoPsh+TMPAW17+LihMIM6C5t+eGmAgpMik06wZWmzjy
 H5fw==
X-Gm-Message-State: AOAM531AcKHE+dGXvX1hBOc+eKeOTKdEzaUG/e/36X4lGlzb39DeHLJX
 8iq+bs4H8H2hD4skiKjuhFpRDhR+vee3jtgMl1U=
X-Google-Smtp-Source: ABdhPJzeJDku5oUyG67t4eKNbfBFlUgg/AIuVaqKPZFRmrgJVU8CrGG51aTggU7zIiaK2uvMYf84mE28396+GMrGyCA=
X-Received: by 2002:a17:906:2cc9:: with SMTP id
 r9mr44147585ejr.138.1634716016699; 
 Wed, 20 Oct 2021 00:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211019144127.GA12978@gmail.com>
 <20211019075241.7ba9fd0a@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20211019075241.7ba9fd0a@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Date: Wed, 20 Oct 2021 13:18:49 +0530
Message-ID: <CAA7TbcsXCLhzDRuzNgzHFMVqEW3aP7BremDVbedO2eJMG9HFyA@mail.gmail.com>
Subject: Re: [PATCH v2] Add payload to be 32-bit aligned to fix dropped packets
To: Jakub Kicinski <kuba@kernel.org>
Content-Type: multipart/alternative; boundary="0000000000007beab605cec3fb8f"
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
 patrickw3@fb.com, Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 velumanit@hcl.com, "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000007beab605cec3fb8f
Content-Type: text/plain; charset="UTF-8"

Thanks Jakub for your comments.

Please find my response inline below.

On Tue, Oct 19, 2021 at 8:22 PM Jakub Kicinski <kuba@kernel.org> wrote:

> On Tue, 19 Oct 2021 20:11:27 +0530 Kumar Thangavel wrote:
> >       len += sizeof(struct ncsi_cmd_pkt_hdr) + 4;
> > -     if (nca->payload < 26)
> > +     payload = ALIGN(nca->payload, 4)
> > +     if (payload < 26)
> >               len += 26;
> >       else
> > -             len += nca->payload;
> > +             len += payload;
>
> You round up to 4 and then add 26 if the result is smaller.  26 is not
> a multiple of 4. Is this intentional?
>
>     Kumar :  This is intentional. The total number of bytes should be 64.
This 64 bytes includes Ethernet header, NC-SI header and payload, pldm
header and payload.
                   Some pldm commands payload is less than 26.  So we added
remaining bytes to match with 64 and which is 4 bytes aligned.

Also you can write this on one line:
>
>         len += max(payload, 26);
>

    Kumar : Ack. Will update in the next patch set.

--0000000000007beab605cec3fb8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks Jakub for your comments.</div><div><br></div><=
div>Please find my response inline below.</div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 19, 2021 at 8:22 PM Ja=
kub Kicinski &lt;<a href=3D"mailto:kuba@kernel.org" target=3D"_blank">kuba@=
kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Tue, 19 Oct 2021 20:11:27 +0530 Kumar Thangavel wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0len +=3D sizeof(struct ncsi_cmd_pkt_hdr) + 4=
;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (nca-&gt;payload &lt; 26)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0payload =3D ALIGN(nca-&gt;payload, 4)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (payload &lt; 26)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len +=3D 26;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len +=3D nca-&gt;payl=
oad;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len +=3D payload;<br>
<br>
You round up to 4 and then add 26 if the result is smaller.=C2=A0 26 is not=
<br>
a multiple of 4. Is this intentional?<br>
<br></blockquote><div>=C2=A0 =C2=A0 Kumar :=C2=A0 This is intentional. The =
total number of bytes should be 64. This 64 bytes includes Ethernet header,=
 NC-SI header and payload, pldm header and payload.=C2=A0</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Some pldm com=
mands payload is less than 26.=C2=A0 So we added remaining bytes to match w=
ith 64 and which is 4 bytes aligned.=C2=A0</div><div><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
Also you can write this on one line:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 len +=3D max(payload, 26);<br></blockquote><div=
><br></div><div>=C2=A0 =C2=A0 Kumar : Ack. Will update in the next patch se=
t.</div></div></div>

--0000000000007beab605cec3fb8f--
