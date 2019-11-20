Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 812CF103948
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 12:59:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47J1T11zrMzDqtG
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 22:59:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::332;
 helo=mail-wm1-x332.google.com; envelope-from=tajudheenk@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JBeI6nYz"; 
 dkim-atps=neutral
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47J1Rz5L42zDqpC;
 Wed, 20 Nov 2019 22:58:37 +1100 (AEDT)
Received: by mail-wm1-x332.google.com with SMTP id u18so6700992wmc.3;
 Wed, 20 Nov 2019 03:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S/h1+ms0uOtMoyyLwKQVw0QVN5qtvWzrHh7KNFCGRag=;
 b=JBeI6nYzD/BOFP0GpXB+iCHqmwNMOmGtHZDCaP1QHA1JU9XuFXZaHsQ1YjqQgLFGf0
 PenFyzh085Nm8h5ChXAuUlVoEEf6JAU62mEXNLZUz+Fb46Vc3bVM6EJN3pBdMJVS4t9G
 e74fe2c/w9BKr56M6mImjB+Eemxoy++Xr5jT8v+RQzaj+cAjxwRkPJGcg7Y377yAdMJN
 yAHq+V9CfZYg05PSn5RFDZbBFBl4jhKQOD3pnMBBrm5+3vae84zNkcRgmB+CgHl9URDG
 2+NWk1dP4JrHBhVO7AUSSIwQ3NKlYwk3GTIZGTygq2npg0t1q33BeKpj1NlsBEx+yrXy
 Wn2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S/h1+ms0uOtMoyyLwKQVw0QVN5qtvWzrHh7KNFCGRag=;
 b=FbPK/dQm1egwZJdXSNCwKTnia+mraQwBTcf5q2HmWLj+UwoXFElHE3XgNfgbaW9zLA
 eYyFxemB1tsCAZa572FQbNkcDG+ZZpjSCnWW6IAZtcFmt1IxMqJJshY4QHGFEiYuLXte
 eKN/iXS71DEAu6Y0IxSJioc38RexrSr3GytJPhloM6ZlgM58gwUkVO1HW17waQsHI/Jt
 czTeYWmqTXevvlPD3U9u+fwWWfliXLf8o4JglM2m/vUjIfGe8Q+bKbzHHlLH5jqUY6Ov
 WdRCBbzIQEdY/Vx8vhAyGKF77ieV/CsHGmCDPc/pMK5c+p+rsyb3aZ7bxQUqFyf9LBJV
 drLw==
X-Gm-Message-State: APjAAAUVpXv7YYniJGeqLOzoFcTvPLzyIGcASnRfm/E0MhTZZ8r5LThz
 WdpSdAgxu87SxKWW94E67cfDLENIyZv/hR20Wo1kXBv/7QI=
X-Google-Smtp-Source: APXvYqww4bKZkKMjRpV4RfThHql2OPpP7Khh92wRwXphPQRuUvpMbuPLOA2/+Fe8uVlmELhhvYFJS3l+EHBH9T+z5VI=
X-Received: by 2002:a1c:9601:: with SMTP id y1mr2665848wmd.157.1574251112651; 
 Wed, 20 Nov 2019 03:58:32 -0800 (PST)
MIME-Version: 1.0
References: <CAH2KKeYUW5YCO98Ydp2XAKN5Wo0CoNquM7xz4VijVZ_oD=U09w@mail.gmail.com>
 <177fb5e6cfc4a839a57d591bc329e4ca@linux.vnet.ibm.com>
In-Reply-To: <177fb5e6cfc4a839a57d591bc329e4ca@linux.vnet.ibm.com>
From: Thaj <tajudheenk@gmail.com>
Date: Wed, 20 Nov 2019 17:28:21 +0530
Message-ID: <CAH2KKeZixzkgPGeMTvx84jSvQj3W+oYDw71QorFFuXjFD3dw=Q@mail.gmail.com>
Subject: Re: Support for "Signed firmware" update
To: Adriana Kobylak <anoo@linux.ibm.com>
Content-Type: multipart/alternative; boundary="0000000000005b631b0597c5e63f"
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
Cc: openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>,
 openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000005b631b0597c5e63f
Content-Type: text/plain; charset="UTF-8"

Hi Adriana, This is exactly I was looking for. I will try it and post here
if I face any issue. Thanks for the info.

On Tue, Nov 19, 2019 at 11:31 PM Adriana Kobylak <anoo@linux.ibm.com> wrote:

> On 2019-11-19 01:28, Thaj wrote:
> > Is there a plan to support BMC/Host signed firmware update?
>
> Hi Thaj, there's already support for checking signatures during a
> firmware update, it's enabled via the "verify_signature" config option
> in the phosphor-bmc-code-mgmt and openpower-pnor-code-mgmt repos.
> The OpenBMC images are signed via the phosphor-image-signing.bb recipe
> in the meta-phosphor layer.
> Is this what you were looking for?
>
> >
> > Regards,
> > Thaj
>

--0000000000005b631b0597c5e63f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Adriana, This is exactly I was looking for. I will try =
it and post here if I face any issue. Thanks for the info.</div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 19, 2=
019 at 11:31 PM Adriana Kobylak &lt;<a href=3D"mailto:anoo@linux.ibm.com">a=
noo@linux.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 2019-11-19 01:28, Thaj wrote:<br>
&gt; Is there a plan to support BMC/Host signed firmware update?<br>
<br>
Hi Thaj, there&#39;s already support for checking signatures during a <br>
firmware update, it&#39;s enabled via the &quot;verify_signature&quot; conf=
ig option <br>
in the phosphor-bmc-code-mgmt and openpower-pnor-code-mgmt repos.<br>
The OpenBMC images are signed via the <a href=3D"http://phosphor-image-sign=
ing.bb" rel=3D"noreferrer" target=3D"_blank">phosphor-image-signing.bb</a> =
recipe <br>
in the meta-phosphor layer.<br>
Is this what you were looking for?<br>
<br>
&gt; <br>
&gt; Regards,<br>
&gt; Thaj<br>
</blockquote></div>

--0000000000005b631b0597c5e63f--
