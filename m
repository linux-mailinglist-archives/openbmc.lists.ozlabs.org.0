Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB3A42C0E7
	for <lists+openbmc@lfdr.de>; Wed, 13 Oct 2021 15:04:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTt5q1NzMz2yw7
	for <lists+openbmc@lfdr.de>; Thu, 14 Oct 2021 00:04:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GNXwoqzg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52d;
 helo=mail-ed1-x52d.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=GNXwoqzg; dkim-atps=neutral
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTt5H3fK9z2yS3;
 Thu, 14 Oct 2021 00:03:45 +1100 (AEDT)
Received: by mail-ed1-x52d.google.com with SMTP id t16so9906545eds.9;
 Wed, 13 Oct 2021 06:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BnxtTbx7U3juO50T7kVEWf+xmAXxYzwIVuEAw9O53kA=;
 b=GNXwoqzgRN0WP50uhq0hWnfrdFmW/atoZA1u7vHiKaZt8i/ocoUhjWu/xEu2XZ23/N
 QI1jHdTrbqiz/u/bw4Ltn/f0ykn9I1ii1R5+YMHNmuthvT0QFZnNXz1f45BBOtb1GCgF
 6k56rPo3wO094IyTX8GdaUYvq+dZfmeOsZVhj1Jeu5py9wCs+rgR6T0W8ar6fwjDSvS/
 I8IjrHR1Laf7UK48YbFRcb4MQscNbDl5C2WWXqPR/s1F+WVrME3yx0ShNKpcJmC+6PfV
 EoAkfBu3oDIlMpVtA9TekZ6TC1y7lMNRP8fAVtMroMZhpGQUm5dLETyYm32pPz/eYJj4
 J+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BnxtTbx7U3juO50T7kVEWf+xmAXxYzwIVuEAw9O53kA=;
 b=V17SNoiPZEgRF9v5lYZRc9MwGKfePOCFGFf7n41HLTyvwtaY/4rmMeBUQ/+tyIfj20
 8mV/nheYYRwtQoD6Jy5ncMtesLkMFb3d+Ri5e1rl+BJNUSjeRPydU9rdY8QRApnS+SHU
 qbQbviheNtvDSfI6tZ/p0pq8JyGoQVfbfr6O13T13ZpG/92ssoMlXpcWHD8n7p90lHsR
 PDpTlBmHPsAv1lLlpWcsQbvaDQLtv4/lcETSITNsxnX2yqOxpTOLvt7AcZmiran6ZmoN
 Ykcz6B2H/v54nyV1e10gLn4gNzVlooCSynW3vghOD+0Nb1brhd6XplbHNUM5Ju3t5+bc
 n0tg==
X-Gm-Message-State: AOAM5335gmD196zjJl58wvKBPzYh8hnEvWG8QPt3ySS41mLQ14d2SMGT
 5OZ6s3vz+YFLtQMTT1wp66UIXxrO4KyP+tBMCvk=
X-Google-Smtp-Source: ABdhPJyp0XsPdiMtMutUTPCiKT53HphRB7Z4IOhow9viqTCqLLihpaDKNbiMvoQE4jvrneQgl6XAIVpdJ1AozxRA5Fo=
X-Received: by 2002:a17:906:2bc7:: with SMTP id
 n7mr39912048ejg.238.1634130218403; 
 Wed, 13 Oct 2021 06:03:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211012062240.GA5761@gmail.com>
 <CACPK8XcJudWoKgXORvRzGAbtBwHm3a56RULriVABfERZgNgt9w@mail.gmail.com>
 <dd6df3ee84110649d901f041883c3d44c0798cda.camel@mendozajonas.com>
In-Reply-To: <dd6df3ee84110649d901f041883c3d44c0798cda.camel@mendozajonas.com>
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Date: Wed, 13 Oct 2021 18:35:29 +0530
Message-ID: <CAA7TbctAN9Uck8niYaQNrvaFaKHF4wiJy-F_-+_+D6SWJr9a_A@mail.gmail.com>
Subject: Re: [PATCH] net: ncsi: Adding padding bytes in the payload
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Content-Type: multipart/alternative; boundary="0000000000002f49d005ce3b9730"
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, patrickw3@fb.com, velumanit@hcl.com,
 "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000002f49d005ce3b9730
Content-Type: text/plain; charset="UTF-8"

Thanks for your review. Please find my response below.

Fixed all the comments. I will update the next patchset.

Thanks,
Kumar.

On Wed, Oct 13, 2021 at 8:16 AM Samuel Mendoza-Jonas <sam@mendozajonas.com>
wrote:

> On Tue, 2021-10-12 at 22:44 +0000, Joel Stanley wrote:
> > On Tue, 12 Oct 2021 at 06:23, Kumar Thangavel
> > <kumarthangavel.hcl@gmail.com> wrote:
> > >
> > > Update NC-SI command handler (both standard and OEM) to take into
> > > account of payload paddings in allocating skb (in case of payload
> > > size is not 32-bit aligned).
> > >
> > > The checksum field follows payload field, without taking payload
> > > padding into account can cause checksum being truncated, leading to
> > > dropped packets.
> >
> > Can you help us review this by pointing out where this is described in
> > the NCSI spec?
> >
> > We've been running this code for a number of years now and I wonder
> > why this hasn't been a problem so far.
>
> I'm assuming this is referencing section 8.2.2.2:
> If the payload is present and does not end on a 32-bit boundary, one to
> three padding bytes equal to 0x00 shall be present to align the
> checksum field to a 32-bit boundary.
>

Kumar : Yes. In the NC-SI spec, section 8.2.2.2 represents a 32-bit
boundary.
              If it does not end on a 32-bit boundary, padding bytes can be
added.

>
> But I'm also surprised this hasn't caused issues so far if we've been
> getting it wrong. Is there an example that reproduces the issue?
>

Kumar :  We have a use case of NIC firmware update in our system which is
pldm based and the transport layer is NC-SI based on RBT.
               Sending some pldm based commands to NIC. In that, some of
the commands failed because of a payload size less than 32.
               So, Added padding bytes to align the 32-bit boundary and
issues got resolved.


>
> Cheers,
> Sam
>
> >
> > Cheers,
> >
> > Joel
> >
> > >
> > > Signed-off-by: Kumar Thangavel <thangavel.k@hcl.com>
> > >
> > > ---
> > >  net/ncsi/ncsi-cmd.c | 21 +++++++++++++++++----
> > >  1 file changed, 17 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
> > > index ba9ae482141b..4625fc935603 100644
> > > --- a/net/ncsi/ncsi-cmd.c
> > > +++ b/net/ncsi/ncsi-cmd.c
> > > @@ -214,11 +214,19 @@ static int ncsi_cmd_handler_oem(struct sk_buff
> > > *skb,
> > >         struct ncsi_cmd_oem_pkt *cmd;
> > >         unsigned int len;
> > >
> > > +       /* NC-SI spec requires payload to be padded with 0
> > > +        * to 32-bit boundary before the checksum field.
> > > +        * Ensure the padding bytes are accounted for in
> > > +        * skb allocation
> > > +        */
> > > +
> > > +       unsigned short payload = ALIGN(nca->payload, 4);
> > > +
> > >         len = sizeof(struct ncsi_cmd_pkt_hdr) + 4;
> > > -       if (nca->payload < 26)
> > > +       if (payload < 26)
> > >                 len += 26;
> > >         else
> > > -               len += nca->payload;
> > > +               len += payload;
> > >
> > >         cmd = skb_put_zero(skb, len);
> > >         memcpy(&cmd->mfr_id, nca->data, nca->payload);
> > > @@ -272,6 +280,7 @@ static struct ncsi_request
> > > *ncsi_alloc_command(struct ncsi_cmd_arg *nca)
> > >         struct net_device *dev = nd->dev;
> > >         int hlen = LL_RESERVED_SPACE(dev);
> > >         int tlen = dev->needed_tailroom;
> > > +       int payload;
> > >         int len = hlen + tlen;
> > >         struct sk_buff *skb;
> > >         struct ncsi_request *nr;
> > > @@ -281,14 +290,18 @@ static struct ncsi_request
> > > *ncsi_alloc_command(struct ncsi_cmd_arg *nca)
> > >                 return NULL;
> > >
> > >         /* NCSI command packet has 16-bytes header, payload, 4 bytes
> > > checksum.
> > > +        * Payload needs padding so that the checksum field follwoing
> > > payload is
> > > +        * aligned to 32bit boundary.
> > >          * The packet needs padding if its payload is less than 26
> > > bytes to
> > >          * meet 64 bytes minimal ethernet frame length.
> > >          */
> > >         len += sizeof(struct ncsi_cmd_pkt_hdr) + 4;
> > > -       if (nca->payload < 26)
> > > +
> > > +       payload = ALIGN(nca->payload, 4);
> > > +       if (payload < 26)
> > >                 len += 26;
> > >         else
> > > -               len += nca->payload;
> > > +               len += payload;
> > >
> > >         /* Allocate skb */
> > >         skb = alloc_skb(len, GFP_ATOMIC);
> > > --
> > > 2.17.1
> > >
>
>
>

--0000000000002f49d005ce3b9730
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div>Thanks for your review. Please find=
 my response=C2=A0below.<div><br></div><div>Fixed all the comments. I will =
update the next patchset.=C2=A0</div><div><br></div><div>Thanks,</div><div>=
Kumar.<br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Wed, Oct 13, 2021 at 8:16 AM Samuel Mendoza-Jonas &lt;<a href=3D"mai=
lto:sam@mendozajonas.com" target=3D"_blank">sam@mendozajonas.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 202=
1-10-12 at 22:44 +0000, Joel Stanley wrote:<br>
&gt; On Tue, 12 Oct 2021 at 06:23, Kumar Thangavel<br>
&gt; &lt;<a href=3D"mailto:kumarthangavel.hcl@gmail.com" target=3D"_blank">=
kumarthangavel.hcl@gmail.com</a>&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt; Update NC-SI command handler (both standard and OEM) to take into=
<br>
&gt; &gt; account of payload paddings in allocating skb (in case of payload=
<br>
&gt; &gt; size is not 32-bit aligned).<br>
&gt; &gt; <br>
&gt; &gt; The checksum field follows payload field, without taking payload<=
br>
&gt; &gt; padding into account can cause checksum being truncated, leading =
to<br>
&gt; &gt; dropped packets.<br>
&gt; <br>
&gt; Can you help us review this by pointing out where this is described in=
<br>
&gt; the NCSI spec?<br>
&gt; <br>
&gt; We&#39;ve been running this code for a number of years now and I wonde=
r<br>
&gt; why this hasn&#39;t been a problem so far.<br>
<br>
I&#39;m assuming this is referencing section <a href=3D"http://8.2.2.2" rel=
=3D"noreferrer" target=3D"_blank">8.2.2.2</a>:<br>
If the payload is present and does not end on a 32-bit boundary, one to<br>
three padding bytes equal to 0x00 shall be present to align the<br>
checksum field to a 32-bit boundary.<br></blockquote><div><br>Kumar : Yes. =
In the NC-SI spec, section 8.2.2.2 represents a 32-bit boundary.<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 If it does not end on a 32-bit bo=
undary, padding bytes can be added.</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<br>
But I&#39;m also surprised this hasn&#39;t caused issues so far if we&#39;v=
e been<br>
getting it wrong. Is there an example that reproduces the issue?<br></block=
quote><div><br>Kumar :=C2=A0 We have a use case of NIC firmware update in o=
ur system which is pldm based and the transport layer is NC-SI based on RBT=
.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Sending some pl=
dm based commands to NIC.=C2=A0In that, some of the commands failed because=
 of a payload size less than 32.</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0So, Added padding bytes to align the 32-bit boundar=
y and issues got resolved.</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
Sam<br>
<br>
&gt; <br>
&gt; Cheers,<br>
&gt; <br>
&gt; Joel<br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Kumar Thangavel &lt;<a href=3D"mailto:thangavel.k@=
hcl.com" target=3D"_blank">thangavel.k@hcl.com</a>&gt;<br>
&gt; &gt; <br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0net/ncsi/ncsi-cmd.c | 21 +++++++++++++++++----<br>
&gt; &gt; =C2=A01 file changed, 17 insertions(+), 4 deletions(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c<br>
&gt; &gt; index ba9ae482141b..4625fc935603 100644<br>
&gt; &gt; --- a/net/ncsi/ncsi-cmd.c<br>
&gt; &gt; +++ b/net/ncsi/ncsi-cmd.c<br>
&gt; &gt; @@ -214,11 +214,19 @@ static int ncsi_cmd_handler_oem(struct sk_b=
uff<br>
&gt; &gt; *skb,<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ncsi_cmd_oem_pk=
t *cmd;<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int len;<br>
&gt; &gt; <br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* NC-SI spec requires payl=
oad to be padded with 0<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * to 32-bit boundary =
before the checksum field.<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Ensure the padding =
bytes are accounted for in<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * skb allocation<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned short payload =3D =
ALIGN(nca-&gt;payload, 4);<br>
&gt; &gt; +<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 len =3D sizeof(struct =
ncsi_cmd_pkt_hdr) + 4;<br>
&gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (nca-&gt;payload &lt; 26=
)<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (payload &lt; 26)<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 len +=3D 26;<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else<br>
&gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 len +=3D nca-&gt;payload;<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 len +=3D payload;<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmd =3D skb_put_zero(s=
kb, len);<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memcpy(&amp;cmd-&gt;mf=
r_id, nca-&gt;data, nca-&gt;payload);<br>
&gt; &gt; @@ -272,6 +280,7 @@ static struct ncsi_request<br>
&gt; &gt; *ncsi_alloc_command(struct ncsi_cmd_arg *nca)<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct net_device *dev=
 =3D nd-&gt;dev;<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int hlen =3D LL_RESERV=
ED_SPACE(dev);<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int tlen =3D dev-&gt;n=
eeded_tailroom;<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int payload;<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int len =3D hlen + tle=
n;<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct sk_buff *skb;<b=
r>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ncsi_request *n=
r;<br>
&gt; &gt; @@ -281,14 +290,18 @@ static struct ncsi_request<br>
&gt; &gt; *ncsi_alloc_command(struct ncsi_cmd_arg *nca)<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* NCSI command packet=
 has 16-bytes header, payload, 4 bytes<br>
&gt; &gt; checksum.<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Payload needs paddi=
ng so that the checksum field follwoing<br>
&gt; &gt; payload is<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * aligned to 32bit bo=
undary.<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * The packet nee=
ds padding if its payload is less than 26<br>
&gt; &gt; bytes to<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * meet 64 bytes =
minimal ethernet frame length.<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 len +=3D sizeof(struct=
 ncsi_cmd_pkt_hdr) + 4;<br>
&gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (nca-&gt;payload &lt; 26=
)<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 payload =3D ALIGN(nca-&gt;p=
ayload, 4);<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (payload &lt; 26)<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 len +=3D 26;<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else<br>
&gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 len +=3D nca-&gt;payload;<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 len +=3D payload;<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Allocate skb */<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 skb =3D alloc_skb(len,=
 GFP_ATOMIC);<br>
&gt; &gt; --<br>
&gt; &gt; 2.17.1<br>
&gt; &gt; <br>
<br>
<br>
</blockquote></div></div></div>

--0000000000002f49d005ce3b9730--
