Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 936EF444592
	for <lists+openbmc@lfdr.de>; Wed,  3 Nov 2021 17:11:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HksGX2tbFz2yHB
	for <lists+openbmc@lfdr.de>; Thu,  4 Nov 2021 03:11:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oAdw90iP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52c;
 helo=mail-ed1-x52c.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=oAdw90iP; dkim-atps=neutral
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HksG238qXz2xCB;
 Thu,  4 Nov 2021 03:11:21 +1100 (AEDT)
Received: by mail-ed1-x52c.google.com with SMTP id j21so11040088edt.11;
 Wed, 03 Nov 2021 09:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t222UYFcPMv61cHb+TOnGS0tbfg8dTjPSdyXzSfXQQA=;
 b=oAdw90iPxvaVqhROHLiZU6p+bQ7wj8D2meeLIFGc5mr2AHWeTXuqnNSKeBbAwKiq0D
 u0nqPfYQaq23NZ9/Ae3svFvQVZSnvIu8V+hB7+BBsJIuWjC6Lp9UJ/ZvrkTNxYe0+NEv
 Qvv1zDCvqUyE6YV67Qwr35UAODikhMKBDN6UbMHe1fApTVu7tbFHLiiXjS/uOLVUwT6+
 Lws/mb9Qd1BfwFURGdR0YvlO8fSmpgnYm6diOD0Eob62+nCXlAsne6hdqTLpSB+U8Sa7
 7rB17/zC0eadRFnrfs5AENYCzYOM1+5pK0ZPiARc8F86nAz//vqtLV9NWR02a63Hn1sk
 KOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t222UYFcPMv61cHb+TOnGS0tbfg8dTjPSdyXzSfXQQA=;
 b=cIZ4ZDQOuoU4WpR62i/CKHiWfB23l8EacbiJorGF8szTZ7PH3UfhmK8wgEhjX8iqYA
 6a/h0kItLYDzESz5nT1suqCrAVeGjLil4nA8IUgZg+SUP+sJ2r9owYqejZT07yuxoTG7
 p8yUlvoxzI+l58BunK0tQGQADhz5gJOIVa8wVB9IKa2iQwmmgyzsWq5daRiAa2bh9Mdm
 uQvKTKe6SIZyTFDYpeIOs71/nQ4HNnIuM1F15goijoO3IZkbPN2uaSn4u+zjKI0cleXX
 vniA3iDJeewqBQzjE8J31VZqE6jd998hEEiaKS5PqSqbJZg9ey7QcrheDvgxqTeqyNlA
 TYfA==
X-Gm-Message-State: AOAM5322qxfnQIk1okBj8mRTj92IdMmk2Zpd3yoPNQePJGkxl9i6/sNx
 mUg7TnFk3/HFUCEnNDDCla5Yr7cr+VM6tdZ9bWY=
X-Google-Smtp-Source: ABdhPJxie8C6ltiBAw0aoCUmzE4Uh5qfFvS7PfPdlkKWx9eM2sZJXLJeRp9u7+sRnusR10jHrs40cfZFSUeHfdLnzvA=
X-Received: by 2002:a17:907:d9f:: with SMTP id
 go31mr30967273ejc.412.1635955871124; 
 Wed, 03 Nov 2021 09:11:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211028095047.GA15236@gmail.com>
 <CAA7TbctGtHBuVOsamFH1sQq_C5BvtsRyCM+b0Z7W=fS_eb8ATA@mail.gmail.com>
 <20211103084939.04f6813f@kicinski-fedora-PC1C0HJN>
In-Reply-To: <20211103084939.04f6813f@kicinski-fedora-PC1C0HJN>
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Date: Wed, 3 Nov 2021 21:43:03 +0530
Message-ID: <CAA7Tbcu7rOxhP45m0tkQBKWxUFGwtQ3Z485wyCtS-wVaTtq2=g@mail.gmail.com>
Subject: Re: [PATCH v4] Add payload to be 32-bit aligned to fix dropped packets
To: Jakub Kicinski <kuba@kernel.org>
Content-Type: multipart/alternative; boundary="0000000000009123c305cfe4a89f"
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
 patrickw3@fb.com, Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 velumanit@hcl.com, "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000009123c305cfe4a89f
Content-Type: text/plain; charset="UTF-8"

Hi Jakub,

Thanks for your response.

Somehow, My mails are not delivered to netdev@vger.kernel.org.

So, I removed it in my last 2 patchsets.

I will try again to CCing netdev@vger.kernel.org.

Thanks,
Kumar.



On Wed, Nov 3, 2021 at 9:19 PM Jakub Kicinski <kuba@kernel.org> wrote:

> On Wed, 3 Nov 2021 20:41:56 +0530 Kumar Thangavel wrote:
> >     Could you please review the patch and provide your feedback?
>
> You missed CCing netdev@ again. You need to CC the mailing list
> to get the patch considered for merging.
>

--0000000000009123c305cfe4a89f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jakub,<div><br>Thanks for your response.<div><br></div>=
<div>Somehow, My mails are not delivered to=C2=A0<a href=3D"mailto:netdev@v=
ger.kernel.org">netdev@vger.kernel.org</a>.=C2=A0<div><br></div><div>So, I =
removed it in my last 2 patchsets.</div><div><br></div><div>I will try agai=
n to CCing <a href=3D"mailto:netdev@vger.kernel.org">netdev@vger.kernel.org=
</a>.=C2=A0<br><br>Thanks,</div><div>Kumar.</div><div><br></div><div><br></=
div></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Nov 3, 2021 at 9:19 PM Jakub Kicinski &lt;<a href=
=3D"mailto:kuba@kernel.org">kuba@kernel.org</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">On Wed, 3 Nov 2021 20:41:56 +053=
0 Kumar Thangavel wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0Could you please review the patch and provide your =
feedback?<br>
<br>
You missed CCing netdev@ again. You need to CC the mailing list <br>
to get the patch considered for merging.<br>
</blockquote></div>

--0000000000009123c305cfe4a89f--
