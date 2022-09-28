Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD9F5EE95D
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 00:31:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdB6L0RfZz2yxd
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 08:31:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=lLjIhUZf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com; envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=lLjIhUZf;
	dkim-atps=neutral
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdB5x2zsLz2xfS
	for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2022 08:30:44 +1000 (AEST)
Received: by mail-lj1-x22b.google.com with SMTP id a14so15839509ljj.8
        for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2022 15:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=eEfzh1NfzlcHyDOYGQPrH6hhMa6xw7JRRj3UfQStZx0=;
        b=lLjIhUZfZ6B41OWI6Z8CCqJpMlotE7pj4Kv8F0JlsNr/+zo0upG7tKlgMhS+UvD5PL
         tygr5RwNqFZZkTS885J9s87CCfw50Gw1AMBsTojLPXikw58861OfYM8QVSYVuezjNG69
         1RB40QQ07EJR7TsF9KaiLqAjuffgegsW+g+N7oMJ3bD69mYHuaqGuIfCMm/+VsBF+f2k
         IFU1hp/xsQ4q6XDY9sA/YbFmhX03/H4mQcH4q2J2a/7HHadP72GLdcNt3QHbyf1Rw27I
         tmq2IQQVwFasgGIEP8aHA64jEl4SoJd6Jz5DBKJRB3E1eKTPDdE2f3GV/ihLWbuImgf2
         ZFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=eEfzh1NfzlcHyDOYGQPrH6hhMa6xw7JRRj3UfQStZx0=;
        b=bbCsjY5i4e9DuHArRcsY05RPEsTyJfPG8P6G2aZcAAnTSvaDw1kGXRUeRLEMQ1dtir
         Mdu90dXlbG8gjaTukYuZGMtb5usZuwraR293RATGSCJLfsADEQ40Ak6M3oKhyDjJXD5Q
         1vl+4f5dbZgmrVjZ0ThpV8PU69GFdUrim6XfsBjOHX7snQAnrl7YRr5Re4pkYnUJWSFQ
         uCR2dykMyiadqIF3U7XN3s/nJn64oCeObdbPiP7cSDzmfnPpGWj0LGd4y895dHjo7Z3N
         nwyR12QCixZKrIdKr84UUi26nWtRkRd4k4mPYA53Fgfp0ZybRn/c1ZI5RLH893G1LF0l
         phDQ==
X-Gm-Message-State: ACrzQf3XNv818JnNGjYeeMVS14UVzSjRdMz/uVBkitY4/nXrpiYcmEgk
	URKrrVMUsu5IcW38RVt5jghIJ4eHiaZFM9+/SZm25a6f8AQ=
X-Google-Smtp-Source: AMsMyM7n2v9ga1pe/5W/iwbp3eMxHJ67iMxvHrkPIX+5oEKYDZco3FmN+afTL5htY9+2SfuB+DtYtk9GUKPzRbwzOiM=
X-Received: by 2002:a2e:7309:0:b0:26c:3db7:8fe2 with SMTP id
 o9-20020a2e7309000000b0026c3db78fe2mr7981ljc.387.1664404235683; Wed, 28 Sep
 2022 15:30:35 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XdERea0Mt+3o1z2TwbN_NXJ-FDYf8mxUEAWe5Lp7oFRmg@mail.gmail.com>
In-Reply-To: <CACPK8XdERea0Mt+3o1z2TwbN_NXJ-FDYf8mxUEAWe5Lp7oFRmg@mail.gmail.com>
From: William Kennington <wak@google.com>
Date: Wed, 28 Sep 2022 15:30:23 -0700
Message-ID: <CAPnigK=NZVWH+msS3Ajf-RBQqzK9hnoecizuFF=QbKh-mK=DNw@mail.gmail.com>
Subject: Re: Linux kernel updates and v6.0
To: Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary="0000000000003ba47505e9c44f7b"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000003ba47505e9c44f7b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The ToF was talking about linux versions being used for OpenBMC users and
we were wondering if we could codify a policy around which versions we will
be developing against regularly. In the past it seems like you usually pick
LTS releases to base on (and Facebook / Google are interested in sticking
with LTS releases in order to reduce toil / number of potentially
incompatible kernel upgrades for each of our machines). It would seem like
kernel 6.0 should be an LTS release, although gregkh hasn't said anything
specifically about it yet. Can we get something written about the expected
alignment with upstream kernel release cadence?

On Tue, Sep 27, 2022 at 11:35 PM Joel Stanley <joel@jms.id.au> wrote:

> Hello OpenBMC,
>
> We've been using the v5.15 kernel as a base for almost 11 months. In
> that time there's been 16 bumps to pull in stable fixes. We have
> merged about 300 patches in that time to support new machines, and new
> hardware, including MCTP, nct6775, lm25066, aspeed-adc and aspeed's
> spi-nor devices.
>
> It's time to move to a new base to ensure progress is made on our
> mission to upstream all of the support. By rebasing on a new kernel
> release we can see what work has been done, and what remains. Since
> v5.15 we have upstream support for:
>
>  - PECI, thanks to Jae and Iwona
>  - MCTP, thanks to Jermey and Matt
>  - spi-nor, thanks to C=C3=A9dric
>  - nct6775 i2c and lm25066, thanks to Zev
>  - ast2600 adc, thanks to Billy
>  - ast2600 gfx, thanks to Tommy
>
> and others I have missed.
>
> In addition to the ASPEED changes the Nuvton hackers have been hard at
> work. We now have support for their latest generation  Cortex-A35 BMC,
> the npcm845 "Arbel" and it's eval board. Likewise the HPE "GXP"
> Cortex-A9 ASIC now has upstream support. Congratulations to both teams
> for this work.
>
> I have prepared a v6.0 tree that contains backports of the FSI and
> Aspeed v6.1 patches, and a small set of existing patches. I will
> publish this on Monday, or once v6.0 final has been tagged.
>
> As promised the last time we rebased, the Nuvoton patches that have
> not seen any updates since they were merged in 2019 have been dropped.
> They are welcome to be resubmitted as long as they are also being
> worked on upstream.
>
> Please address any future patches to the dev-6.0 tree.
>
> Cheers,
>
> Joel
>

--0000000000003ba47505e9c44f7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The ToF was talking about linux versions being used for Op=
enBMC users and we were wondering if we could codify a policy around which =
versions we will be developing against regularly. In the past it seems like=
 you usually pick LTS releases to base on (and Facebook / Google are intere=
sted in sticking with LTS releases in order to reduce toil / number of pote=
ntially incompatible kernel upgrades for each of our machines). It would se=
em like kernel 6.0 should be an LTS release, although gregkh hasn&#39;t sai=
d anything specifically about it yet. Can we get something written about th=
e expected alignment with upstream kernel=C2=A0release cadence?</div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep =
27, 2022 at 11:35 PM Joel Stanley &lt;<a href=3D"mailto:joel@jms.id.au" tar=
get=3D"_blank">joel@jms.id.au</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Hello OpenBMC,<br>
<br>
We&#39;ve been using the v5.15 kernel as a base for almost 11 months. In<br=
>
that time there&#39;s been 16 bumps to pull in stable fixes. We have<br>
merged about 300 patches in that time to support new machines, and new<br>
hardware, including MCTP, nct6775, lm25066, aspeed-adc and aspeed&#39;s<br>
spi-nor devices.<br>
<br>
It&#39;s time to move to a new base to ensure progress is made on our<br>
mission to upstream all of the support. By rebasing on a new kernel<br>
release we can see what work has been done, and what remains. Since<br>
v5.15 we have upstream support for:<br>
<br>
=C2=A0- PECI, thanks to Jae and Iwona<br>
=C2=A0- MCTP, thanks to Jermey and Matt<br>
=C2=A0- spi-nor, thanks to C=C3=A9dric<br>
=C2=A0- nct6775 i2c and lm25066, thanks to Zev<br>
=C2=A0- ast2600 adc, thanks to Billy<br>
=C2=A0- ast2600 gfx, thanks to Tommy<br>
<br>
and others I have missed.<br>
<br>
In addition to the ASPEED changes the Nuvton hackers have been hard at<br>
work. We now have support for their latest generation=C2=A0 Cortex-A35 BMC,=
<br>
the npcm845 &quot;Arbel&quot; and it&#39;s eval board. Likewise the HPE &qu=
ot;GXP&quot;<br>
Cortex-A9 ASIC now has upstream support. Congratulations to both teams<br>
for this work.<br>
<br>
I have prepared a v6.0 tree that contains backports of the FSI and<br>
Aspeed v6.1 patches, and a small set of existing patches. I will<br>
publish this on Monday, or once v6.0 final has been tagged.<br>
<br>
As promised the last time we rebased, the Nuvoton patches that have<br>
not seen any updates since they were merged in 2019 have been dropped.<br>
They are welcome to be resubmitted as long as they are also being<br>
worked on upstream.<br>
<br>
Please address any future patches to the dev-6.0 tree.<br>
<br>
Cheers,<br>
<br>
Joel<br>
</blockquote></div>

--0000000000003ba47505e9c44f7b--
