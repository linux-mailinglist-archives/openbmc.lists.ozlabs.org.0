Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0107C456B68
	for <lists+openbmc@lfdr.de>; Fri, 19 Nov 2021 09:14:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwTvy6wB4z3089
	for <lists+openbmc@lfdr.de>; Fri, 19 Nov 2021 19:14:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HJo2ODo2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::531;
 helo=mail-ed1-x531.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=HJo2ODo2; dkim-atps=neutral
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwTvb2tcLz2x9K;
 Fri, 19 Nov 2021 19:13:47 +1100 (AEDT)
Received: by mail-ed1-x531.google.com with SMTP id v1so5883721edx.2;
 Fri, 19 Nov 2021 00:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o6ZoA6eJSGE/AT2v2A7kIOZ4SYhR7Ufyh+fKktyBDC8=;
 b=HJo2ODo2iUpv7NK7kuqkeN7uiCePtBXStORV6OY4DOzH1aiCZ1peO87wh69daUeRXn
 3onRXDdHbWW3e8KT74gwXuj4yS7NVh0dZhR2eYpr0wIkNQUTdBWlJu56DhMToWs0UWA8
 MfvbcplP9/AKDw+wK5M7XaESKsZbJq+gGZsm+QDcXnrcy7AvDEgm9hSkB8pcICWn9jPg
 oMYjH2BgQ0QMMTUO+vXA/5hCHNecDcB2o9EZaHv9GVnYcGnGQQfS8YcsLnXsJR/Yac78
 9oHPU2gIdEd4IHnhTczxhZU+L/Fuq7zYvWDOhY4PWCKMeXzG3xffhL5Nvpn92ELvw2Dc
 cpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o6ZoA6eJSGE/AT2v2A7kIOZ4SYhR7Ufyh+fKktyBDC8=;
 b=tUK6SBOF+EDa145IkuqdesZl+SWhafyQIj+jrWsaHtf6fkadrGYiWLlZLSoPa6j5sd
 p9gfYv7899YnQ1EHq1VqJA1dYamNRkfTWBofOlsYXou9LY/2DHKc44oSTIpCPpKXbHJ7
 UxKD5Dk0xH25z6c7YzWt+FfxvWL5RXR5qvaxLmaMFTvIor3wIopWPMl7ziltbobEYZwj
 9vlMgWYs9dquchpeGkxwfAg+A2EdYnFaXSCJzibUcELko8bkmK8Fk3oQt0NiygLTOFuc
 1HkPOY3N7q4GklyC0O4Z0DAkG542Fd6gJlspQkD+288qiNURZ84v/n3bkZYGpsgzLUQb
 Bwhw==
X-Gm-Message-State: AOAM533pe/dR72F9Cw7Qvvsbc3C+KY4isIYyuErTAZEuVWtRGTdSYKIN
 qHinZ8wDrCJ1gzKxw8Qq8DKnHEb/mjDJ0oyMbys=
X-Google-Smtp-Source: ABdhPJwQCFHNt4rPT83Lu95gojCH8CrinsZ0YV6L2wDEQGrslTk/g9iYXfThxryluoXiuZ+D+mGQiXiryVv+th2iyiE=
X-Received: by 2002:a17:907:3d88:: with SMTP id
 he8mr5265166ejc.565.1637309623948; 
 Fri, 19 Nov 2021 00:13:43 -0800 (PST)
MIME-Version: 1.0
References: <20211118160301.GA19542@gmail.com>
 <ad44434c-0356-701e-d355-174efc1917b5@gmail.com>
In-Reply-To: <ad44434c-0356-701e-d355-174efc1917b5@gmail.com>
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Date: Fri, 19 Nov 2021 13:45:39 +0530
Message-ID: <CAA7Tbcv480RvyL+J8pf2DvqdfFMoGpAdi=x-isEgOWyQ8N7Pkw@mail.gmail.com>
Subject: Re: [PATCH v7] Add payload to be 32-bit aligned to fix dropped packets
To: eric.dumazet@gmail.com
Content-Type: multipart/alternative; boundary="00000000000085d8ca05d11fdad1"
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

--00000000000085d8ca05d11fdad1
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 18, 2021 at 10:44 PM Eric Dumazet <eric.dumazet@gmail.com>
wrote:

>
>
> On 11/18/21 8:03 AM, Kumar Thangavel wrote:
> > Update NC-SI command handler (both standard and OEM) to take into
> > account of payload paddings in allocating skb (in case of payload
> > size is not 32-bit aligned).
> >
> > The checksum field follows payload field, without taking payload
> > padding into account can cause checksum being truncated, leading to
> > dropped packets.
> >
>
> Patch title should start with a prefix, identifying which layer/driver is
> involved.
>
> Probably in this case
>
> net/ncsi: Add payload to be 32-bit aligned to fix dropped packets
>
ACK.

>
> > Fixes: fb4ee67529ff ("net/ncsi: Add NCSI OEM command support")
> > Signed-off-by: Kumar Thangavel <thangavel.k@hcl.com>
> > Acked-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> > Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
> >
> > ---
> >   v7:
> >    - Updated padding_bytes as const static int variable
> >
> >   v6:
> >    - Updated type of padding_bytes variable
> >    - Updated type of payload
> >    - Seperated variable declarations and code
> >
> >   v5:
> >    - Added Fixes tag
> >    - Added const variable for padding_bytes
> >
> >   v4:
> >    - Used existing macro for max function
> >
> >   v3:
> >    - Added Macro for MAX
> >    - Fixed the missed semicolon
> >
> >   v2:
> >    - Added NC-SI spec version and section
> >    - Removed blank line
> >    - corrected spellings
> >
> >   v1:
> >    - Initial draft
> >
> > ---
> > ---
> >  net/ncsi/ncsi-cmd.c | 24 ++++++++++++++++--------
> >  1 file changed, 16 insertions(+), 8 deletions(-)
> >
> > diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
> > index ba9ae482141b..9a6f10f4833e 100644
> > --- a/net/ncsi/ncsi-cmd.c
> > +++ b/net/ncsi/ncsi-cmd.c
> > @@ -18,6 +18,8 @@
> >  #include "internal.h"
> >  #include "ncsi-pkt.h"
> >
> > +const static int padding_bytes = 26;
>
> It would be nice to have some kind of reference, to explain
> what is this magic value.
>
> ACK.


> Moving the comment [1] here might make sense.
>
>
> > +
> >  u32 ncsi_calculate_checksum(unsigned char *data, int len)
> >  {
> >       u32 checksum = 0;
> > @@ -213,12 +215,17 @@ static int ncsi_cmd_handler_oem(struct sk_buff
> *skb,
> >  {
> >       struct ncsi_cmd_oem_pkt *cmd;
> >       unsigned int len;
> > +     int payload;
>
> [1] This comment could be moved before @padding_bytes
>
> > +     /* NC-SI spec DSP_0222_1.2.0, section 8.2.2.2
> > +      * requires payload to be padded with 0 to
> > +      * 32-bit boundary before the checksum field.
> > +      * Ensure the padding bytes are accounted for in
> > +      * skb allocation
> > +      */
> >
> > +     payload = ALIGN(nca->payload, 4);
> >       len = sizeof(struct ncsi_cmd_pkt_hdr) + 4;
> > -     if (nca->payload < 26)
> > -             len += 26;
> > -     else
> > -             len += nca->payload;
> > +     len += max(payload, padding_bytes);
> >
> >       cmd = skb_put_zero(skb, len);
> >       memcpy(&cmd->mfr_id, nca->data, nca->payload);
> > @@ -272,6 +279,7 @@ static struct ncsi_request
> *ncsi_alloc_command(struct ncsi_cmd_arg *nca)
> >       struct net_device *dev = nd->dev;
> >       int hlen = LL_RESERVED_SPACE(dev);
> >       int tlen = dev->needed_tailroom;
> > +     int payload;
> >       int len = hlen + tlen;
> >       struct sk_buff *skb;
> >       struct ncsi_request *nr;
> > @@ -281,14 +289,14 @@ static struct ncsi_request
> *ncsi_alloc_command(struct ncsi_cmd_arg *nca)
> >               return NULL;
> >
> >       /* NCSI command packet has 16-bytes header, payload, 4 bytes
> checksum.
> > +      * Payload needs padding so that the checksum field following
> payload is
> > +      * aligned to 32-bit boundary.
> >        * The packet needs padding if its payload is less than 26 bytes to
> >        * meet 64 bytes minimal ethernet frame length.
> >        */
> >       len += sizeof(struct ncsi_cmd_pkt_hdr) + 4;
> > -     if (nca->payload < 26)
> > -             len += 26;
> > -     else
> > -             len += nca->payload;
> > +     payload = ALIGN(nca->payload, 4);
> > +     len += max(payload, padding_bytes);
> >
> >       /* Allocate skb */
> >       skb = alloc_skb(len, GFP_ATOMIC);
> >
>

--00000000000085d8ca05d11fdad1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 18, 2021 at 10:44 PM Eric=
 Dumazet &lt;<a href=3D"mailto:eric.dumazet@gmail.com" target=3D"_blank">er=
ic.dumazet@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><br>
<br>
On 11/18/21 8:03 AM, Kumar Thangavel wrote:<br>
&gt; Update NC-SI command handler (both standard and OEM) to take into<br>
&gt; account of payload paddings in allocating skb (in case of payload<br>
&gt; size is not 32-bit aligned).<br>
&gt; <br>
&gt; The checksum field follows payload field, without taking payload<br>
&gt; padding into account can cause checksum being truncated, leading to<br=
>
&gt; dropped packets.<br>
&gt; <br>
<br>
Patch title should start with a prefix, identifying which layer/driver is<b=
r>
involved.<br>
<br>
Probably in this case<br>
<br>
net/ncsi: Add payload to be 32-bit aligned to fix dropped packets<br></bloc=
kquote><div>ACK.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
&gt; Fixes: fb4ee67529ff (&quot;net/ncsi: Add NCSI OEM command support&quot=
;)<br>
&gt; Signed-off-by: Kumar Thangavel &lt;<a href=3D"mailto:thangavel.k@hcl.c=
om" target=3D"_blank">thangavel.k@hcl.com</a>&gt;<br>
&gt; Acked-by: Samuel Mendoza-Jonas &lt;<a href=3D"mailto:sam@mendozajonas.=
com" target=3D"_blank">sam@mendozajonas.com</a>&gt;<br>
&gt; Reviewed-by: Paul Menzel &lt;<a href=3D"mailto:pmenzel@molgen.mpg.de" =
target=3D"_blank">pmenzel@molgen.mpg.de</a>&gt;<br>
&gt; <br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0v7:<br>
&gt;=C2=A0 =C2=A0 - Updated padding_bytes as const static int variable<br>
&gt; <br>
&gt;=C2=A0 =C2=A0v6:<br>
&gt;=C2=A0 =C2=A0 - Updated type of padding_bytes variable<br>
&gt;=C2=A0 =C2=A0 - Updated type of payload<br>
&gt;=C2=A0 =C2=A0 - Seperated variable declarations and code<br>
&gt; <br>
&gt;=C2=A0 =C2=A0v5:<br>
&gt;=C2=A0 =C2=A0 - Added Fixes tag<br>
&gt;=C2=A0 =C2=A0 - Added const variable for padding_bytes<br>
&gt; <br>
&gt;=C2=A0 =C2=A0v4:<br>
&gt;=C2=A0 =C2=A0 - Used existing macro for max function<br>
&gt; <br>
&gt;=C2=A0 =C2=A0v3:<br>
&gt;=C2=A0 =C2=A0 - Added Macro for MAX<br>
&gt;=C2=A0 =C2=A0 - Fixed the missed semicolon<br>
&gt; <br>
&gt;=C2=A0 =C2=A0v2:<br>
&gt;=C2=A0 =C2=A0 - Added NC-SI spec version and section<br>
&gt;=C2=A0 =C2=A0 - Removed blank line<br>
&gt;=C2=A0 =C2=A0 - corrected spellings<br>
&gt; <br>
&gt;=C2=A0 =C2=A0v1:<br>
&gt;=C2=A0 =C2=A0 - Initial draft<br>
&gt; <br>
&gt; ---<br>
&gt; ---<br>
&gt;=C2=A0 net/ncsi/ncsi-cmd.c | 24 ++++++++++++++++--------<br>
&gt;=C2=A0 1 file changed, 16 insertions(+), 8 deletions(-)<br>
&gt; <br>
&gt; diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c<br>
&gt; index ba9ae482141b..9a6f10f4833e 100644<br>
&gt; --- a/net/ncsi/ncsi-cmd.c<br>
&gt; +++ b/net/ncsi/ncsi-cmd.c<br>
&gt; @@ -18,6 +18,8 @@<br>
&gt;=C2=A0 #include &quot;internal.h&quot;<br>
&gt;=C2=A0 #include &quot;ncsi-pkt.h&quot;<br>
&gt;=C2=A0 <br>
&gt; +const static int padding_bytes =3D 26;<br>
<br>
It would be nice to have some kind of reference, to explain<br>
what is this magic value.<br>
<br></blockquote><div>ACK.</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
Moving the comment [1] here might make sense.<br>
<br>
<br>
&gt; +<br>
&gt;=C2=A0 u32 ncsi_calculate_checksum(unsigned char *data, int len)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 checksum =3D 0;<br>
&gt; @@ -213,12 +215,17 @@ static int ncsi_cmd_handler_oem(struct sk_buff *=
skb,<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ncsi_cmd_oem_pkt *cmd;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int len;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int payload;<br>
<br>
[1] This comment could be moved before @padding_bytes<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* NC-SI spec DSP_0222_1.2.0, section 8.2.2.2<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * requires payload to be padded with 0 to<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * 32-bit boundary before the checksum field.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Ensure the padding bytes are accounted for in<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * skb allocation<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0payload =3D ALIGN(nca-&gt;payload, 4);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D sizeof(struct ncsi_cmd_pkt_hdr) + 4;=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (nca-&gt;payload &lt; 26)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len +=3D 26;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len +=3D nca-&gt;payl=
oad;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0len +=3D max(payload, padding_bytes);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D skb_put_zero(skb, len);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(&amp;cmd-&gt;mfr_id, nca-&gt;data, nc=
a-&gt;payload);<br>
&gt; @@ -272,6 +279,7 @@ static struct ncsi_request *ncsi_alloc_command(str=
uct ncsi_cmd_arg *nca)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct net_device *dev =3D nd-&gt;dev;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int hlen =3D LL_RESERVED_SPACE(dev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int tlen =3D dev-&gt;needed_tailroom;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int payload;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int len =3D hlen + tlen;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sk_buff *skb;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ncsi_request *nr;<br>
&gt; @@ -281,14 +289,14 @@ static struct ncsi_request *ncsi_alloc_command(s=
truct ncsi_cmd_arg *nca)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* NCSI command packet has 16-bytes header, =
payload, 4 bytes checksum.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Payload needs padding so that the checksum fie=
ld following payload is<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * aligned to 32-bit boundary.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * The packet needs padding if its payload i=
s less than 26 bytes to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * meet 64 bytes minimal ethernet frame leng=
th.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0len +=3D sizeof(struct ncsi_cmd_pkt_hdr) + 4=
;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (nca-&gt;payload &lt; 26)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len +=3D 26;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len +=3D nca-&gt;payl=
oad;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0payload =3D ALIGN(nca-&gt;payload, 4);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0len +=3D max(payload, padding_bytes);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Allocate skb */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0skb =3D alloc_skb(len, GFP_ATOMIC);<br>
&gt; <br>
</blockquote></div></div>

--00000000000085d8ca05d11fdad1--
