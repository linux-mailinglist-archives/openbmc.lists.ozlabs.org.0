Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABA2444456
	for <lists+openbmc@lfdr.de>; Wed,  3 Nov 2021 16:10:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hkqw01brwz2yJR
	for <lists+openbmc@lfdr.de>; Thu,  4 Nov 2021 02:10:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DS56jzSe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::534;
 helo=mail-ed1-x534.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=DS56jzSe; dkim-atps=neutral
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkqvT5t0sz2xDw;
 Thu,  4 Nov 2021 02:10:11 +1100 (AEDT)
Received: by mail-ed1-x534.google.com with SMTP id g14so10593042edz.2;
 Wed, 03 Nov 2021 08:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5nuVdXcCeFlXcvyu5nBe4rPi6vIAEGMMU95ozqfWWZY=;
 b=DS56jzSe5lee6W2JmOs9mk3dKYwoakVR/rGzYh2nVpwXa7qALzI9IulSJi1RDC1+jf
 JybLGwaEuS+8SkooMygucPQ3J6EBEy090JL/yOc5kD5YhFn+tljALo7aRnJ1KOprgYIA
 MX5SkfZ9IWa8WhWFT4vBvrkXCfDVcPobfoD1EvCXHlzOPmMTB4IEjpRd4oEwPuUPglpH
 FlJ7Ayy/VVwUodpvuiI4frYOmtIsENePLEkkYctUJ/Xg4Q+92YU8NKLm2Y4+//xWEcR3
 WPUwNxfMttvXdejfKYSGHIOuDTEREUv5OctoRrWuNix0vMuNwowbtzb30poCg16cNL05
 Cf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5nuVdXcCeFlXcvyu5nBe4rPi6vIAEGMMU95ozqfWWZY=;
 b=f1mF50tcpMzNu3dWbA3dAhjjQ+lmBd0soyTeeZf4RPrUAGgnySmqppp7BaQWkdi2yU
 8u01ylRBhB5mm8AqN26IjUbvkmXruQ7K9g2xN2xToLnda4YA/GBtF9718ScYodA5A7bi
 xbnbTOFlO7Dp62K9WckX5ZlvXUp59Q24iX5dwvMusD17i7Y6gXsU66JjmPnO7Y+Zi9WQ
 FhBFD8+DXx+ECNI4/bFfJ5J/eunUZUqh2F4oEKDmczDcmUgU0IjWIrwDTa+5r5kez5GQ
 JbkJwStK3AS0y3FapvOeat/E9hiiAmROt36JVrfyxMgXyPiqWYGWxC8exZ8ehhMYLnkX
 wfWg==
X-Gm-Message-State: AOAM533cMSIGnHUOrjN9a/kM86sS5aK6FmRKfRwxBspM4p0WOKlWoiS7
 27onjJQ5DPQis4xGldbTd86k/f+oguNVcRvPYFI=
X-Google-Smtp-Source: ABdhPJwk2pQsVMOywMq+7pe6UFE9zkayBCafGJfkHuP7IrFGIqMriAbazYaBEUODTFlWcVIM2JOFPBSQy0MaffWyHB0=
X-Received: by 2002:a05:6402:1801:: with SMTP id
 g1mr34296226edy.107.1635952203945; 
 Wed, 03 Nov 2021 08:10:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211028095047.GA15236@gmail.com>
In-Reply-To: <20211028095047.GA15236@gmail.com>
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Date: Wed, 3 Nov 2021 20:41:56 +0530
Message-ID: <CAA7TbctGtHBuVOsamFH1sQq_C5BvtsRyCM+b0Z7W=fS_eb8ATA@mail.gmail.com>
Subject: Re: [PATCH v4] Add payload to be 32-bit aligned to fix dropped packets
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000fc58ef05cfe3cd0d"
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Amithash Prasad <amithash@fb.com>,
 velumanit@hcl.com, patrickw3@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000fc58ef05cfe3cd0d
Content-Type: text/plain; charset="UTF-8"

Hi All,

    Could you please review the patch and provide your feedback?

Thanks,
Kumar.

On Thu, Oct 28, 2021 at 3:20 PM Kumar Thangavel <
kumarthangavel.hcl@gmail.com> wrote:

> Update NC-SI command handler (both standard and OEM) to take into
> account of payload paddings in allocating skb (in case of payload
> size is not 32-bit aligned).
>
> The checksum field follows payload field, without taking payload
> padding into account can cause checksum being truncated, leading to
> dropped packets.
>
> Signed-off-by: Kumar Thangavel <thangavel.k@hcl.com>
> Acked-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
>
> ---
>   v4:
>    - Updated existing macro for max function
>
>   v3:
>    - Added Macro for MAX
>    - Fixed the missed semicolon
>
>   v2:
>    - Added NC-SI spec version and section
>    - Removed blank line
>    - corrected spellings
>
>   v1:
>    - Initial draft
>
> ---
>  net/ncsi/ncsi-cmd.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
> index ba9ae482141b..e44fe138c20f 100644
> --- a/net/ncsi/ncsi-cmd.c
> +++ b/net/ncsi/ncsi-cmd.c
> @@ -213,12 +213,16 @@ static int ncsi_cmd_handler_oem(struct sk_buff *skb,
>  {
>         struct ncsi_cmd_oem_pkt *cmd;
>         unsigned int len;
> +       /* NC-SI spec DSP_0222_1.2.0, section 8.2.2.2
> +        * requires payload to be padded with 0 to
> +        * 32-bit boundary before the checksum field.
> +        * Ensure the padding bytes are accounted for in
> +        * skb allocation
> +        */
>
> +       unsigned short payload = ALIGN(nca->payload, 4);
>         len = sizeof(struct ncsi_cmd_pkt_hdr) + 4;
> -       if (nca->payload < 26)
> -               len += 26;
> -       else
> -               len += nca->payload;
> +       len += max(payload, 26);
>
>         cmd = skb_put_zero(skb, len);
>         memcpy(&cmd->mfr_id, nca->data, nca->payload);
> @@ -272,6 +276,7 @@ static struct ncsi_request *ncsi_alloc_command(struct
> ncsi_cmd_arg *nca)
>         struct net_device *dev = nd->dev;
>         int hlen = LL_RESERVED_SPACE(dev);
>         int tlen = dev->needed_tailroom;
> +       int payload;
>         int len = hlen + tlen;
>         struct sk_buff *skb;
>         struct ncsi_request *nr;
> @@ -281,14 +286,14 @@ static struct ncsi_request
> *ncsi_alloc_command(struct ncsi_cmd_arg *nca)
>                 return NULL;
>
>         /* NCSI command packet has 16-bytes header, payload, 4 bytes
> checksum.
> +        * Payload needs padding so that the checksum field following
> payload is
> +        * aligned to 32-bit boundary.
>          * The packet needs padding if its payload is less than 26 bytes to
>          * meet 64 bytes minimal ethernet frame length.
>          */
>         len += sizeof(struct ncsi_cmd_pkt_hdr) + 4;
> -       if (nca->payload < 26)
> -               len += 26;
> -       else
> -               len += nca->payload;
> +       payload = ALIGN(nca->payload, 4);
> +       len += max(payload, 26);
>
>         /* Allocate skb */
>         skb = alloc_skb(len, GFP_ATOMIC);
> --
> 2.17.1
>
>

--000000000000fc58ef05cfe3cd0d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,=C2=A0<div><br></div><div>=C2=A0 =C2=A0 Could you p=
lease review the patch and provide your=C2=A0feedback?</div><div><br></div>=
<div>Thanks,</div><div>Kumar.</div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 28, 2021 at 3:20 PM Kumar Th=
angavel &lt;<a href=3D"mailto:kumarthangavel.hcl@gmail.com">kumarthangavel.=
hcl@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Update NC-SI command handler (both standard and OEM) to take i=
nto<br>
account of payload paddings in allocating skb (in case of payload<br>
size is not 32-bit aligned).<br>
<br>
The checksum field follows payload field, without taking payload<br>
padding into account can cause checksum being truncated, leading to<br>
dropped packets.<br>
<br>
Signed-off-by: Kumar Thangavel &lt;<a href=3D"mailto:thangavel.k@hcl.com" t=
arget=3D"_blank">thangavel.k@hcl.com</a>&gt;<br>
Acked-by: Samuel Mendoza-Jonas &lt;<a href=3D"mailto:sam@mendozajonas.com" =
target=3D"_blank">sam@mendozajonas.com</a>&gt;<br>
Reviewed-by: Paul Menzel &lt;<a href=3D"mailto:pmenzel@molgen.mpg.de" targe=
t=3D"_blank">pmenzel@molgen.mpg.de</a>&gt;<br>
<br>
---<br>
=C2=A0 v4:<br>
=C2=A0 =C2=A0- Updated existing macro for max function<br>
<br>
=C2=A0 v3:<br>
=C2=A0 =C2=A0- Added Macro for MAX<br>
=C2=A0 =C2=A0- Fixed the missed semicolon<br>
<br>
=C2=A0 v2:<br>
=C2=A0 =C2=A0- Added NC-SI spec version and section<br>
=C2=A0 =C2=A0- Removed blank line<br>
=C2=A0 =C2=A0- corrected spellings<br>
<br>
=C2=A0 v1:<br>
=C2=A0 =C2=A0- Initial draft<br>
<br>
---<br>
=C2=A0net/ncsi/ncsi-cmd.c | 21 +++++++++++++--------<br>
=C2=A01 file changed, 13 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c<br>
index ba9ae482141b..e44fe138c20f 100644<br>
--- a/net/ncsi/ncsi-cmd.c<br>
+++ b/net/ncsi/ncsi-cmd.c<br>
@@ -213,12 +213,16 @@ static int ncsi_cmd_handler_oem(struct sk_buff *skb,<=
br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct ncsi_cmd_oem_pkt *cmd;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* NC-SI spec DSP_0222_1.2.0, section 8.2.2.2<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * requires payload to be padded with 0 to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 32-bit boundary before the checksum field.<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Ensure the padding bytes are accounted for i=
n<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * skb allocation<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned short payload =3D ALIGN(nca-&gt;payloa=
d, 4);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D sizeof(struct ncsi_cmd_pkt_hdr) + 4;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (nca-&gt;payload &lt; 26)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len +=3D 26;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len +=3D nca-&gt;pa=
yload;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0len +=3D max(payload, 26);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D skb_put_zero(skb, len);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(&amp;cmd-&gt;mfr_id, nca-&gt;data, nca-&=
gt;payload);<br>
@@ -272,6 +276,7 @@ static struct ncsi_request *ncsi_alloc_command(struct n=
csi_cmd_arg *nca)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct net_device *dev =3D nd-&gt;dev;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int hlen =3D LL_RESERVED_SPACE(dev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int tlen =3D dev-&gt;needed_tailroom;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int payload;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int len =3D hlen + tlen;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct sk_buff *skb;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct ncsi_request *nr;<br>
@@ -281,14 +286,14 @@ static struct ncsi_request *ncsi_alloc_command(struct=
 ncsi_cmd_arg *nca)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* NCSI command packet has 16-bytes header, pay=
load, 4 bytes checksum.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Payload needs padding so that the checksum f=
ield following payload is<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * aligned to 32-bit boundary.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* The packet needs padding if its payload=
 is less than 26 bytes to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* meet 64 bytes minimal ethernet frame le=
ngth.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 len +=3D sizeof(struct ncsi_cmd_pkt_hdr) + 4;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (nca-&gt;payload &lt; 26)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len +=3D 26;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len +=3D nca-&gt;pa=
yload;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0payload =3D ALIGN(nca-&gt;payload, 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0len +=3D max(payload, 26);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Allocate skb */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 skb =3D alloc_skb(len, GFP_ATOMIC);<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div>

--000000000000fc58ef05cfe3cd0d--
