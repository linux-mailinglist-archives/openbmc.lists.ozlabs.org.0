Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AAD1C5F37
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 19:48:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GnHz3GvGzDqQF
	for <lists+openbmc@lfdr.de>; Wed,  6 May 2020 03:47:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d36;
 helo=mail-io1-xd36.google.com; envelope-from=suichen6@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dgcRHeli; dkim-atps=neutral
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GmxY1dGNzDqSq
 for <openbmc@lists.ozlabs.org>; Wed,  6 May 2020 03:32:00 +1000 (AEST)
Received: by mail-io1-xd36.google.com with SMTP id f3so3245398ioj.1
 for <openbmc@lists.ozlabs.org>; Tue, 05 May 2020 10:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wJYFi3L4RCMqnH+WbVnYJiW6Je+mj9wS6Qtx+kGqM0g=;
 b=dgcRHelid7EKnUDsjV9yC5g/tBvAJ5WbV/+90Nnw1rHTW//ApXITrS25kipWRKxwhp
 qjpyxuJopjKi01sseIQwhnHB3ttAP9+xqLEGCgWW3akHZf/Tg6M7giNCrTDjDTbHD6lX
 XSi0yBPS0s6HD74bEH9DJ4xUzjN84iuYMLioh2bT2wG3tAnY6GRdWvD/iHJdTpPTcy+q
 p7wVszvOzYMl7jggfrl118Jf+P9xVxogG9LWhJPdyLE5nUye7ZNiw4wa8VhSFz8fo0ii
 MPrIzeLBtdTMJY+BMyglRUStOAl9JOjd+aGkxrGT1E/NtmPkKlCScwA7s01cOnMMGUh5
 TZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wJYFi3L4RCMqnH+WbVnYJiW6Je+mj9wS6Qtx+kGqM0g=;
 b=TK9ijDHsaiu/rpGmvVmetuAyh1Mz3bkjFM1xh5L2HHOk8bDC71lVfFfVd6+R39Z+Ek
 ZxQyM9obh1sNO1jC4e/vohErCzmIOhYejDxDIf9Evv32rU+Ij+YnAj+wA2lBi8Dl3OJ/
 41VPRuLwYFPasTwWbQzhNWUPZjyYOKuBp8rN5PNtU6OYiNUfkJgk86rFRcYU65iQb8dg
 kNKmNCY76c0b6BMR5uYAI9eiOG1wol7jAey+4pH73Pcgr0YQpUMXZmnGThyaT//pwOwj
 sOucOxwsAF1PXBMn8QzixNECkRRKkUr8WwWp2i3B9XgO2/A5zE1RxEiVhvEprGkWzqcc
 AD7A==
X-Gm-Message-State: AGi0Pua/4TO0cC4Fg3vWUlxKf5o9ZRH1onngvIANSv9veg1bJltiG4BO
 Lp342tckPcqZfAZjGumyO7eoMMph126mQdfN838=
X-Google-Smtp-Source: APiQypLRpMUHGu3G9boroTIJ6DFMq4T3+8u7VPbZnQ8ttbpzYnGOFAmmPSGXZhEVsI0jsvKwMz9febxcUoO81RbrTSo=
X-Received: by 2002:a02:cc16:: with SMTP id n22mr4467073jap.72.1588699915412; 
 Tue, 05 May 2020 10:31:55 -0700 (PDT)
MIME-Version: 1.0
References: <PS2PR04MB354432E1908672CE27203758FDAA0@PS2PR04MB3544.apcprd04.prod.outlook.com>
 <0B252A9A-3E34-4FA5-A872-CDA2C463500B@gmail.com>
 <PS2PR04MB3544D3F9F9D913A7828B6AB7FDA70@PS2PR04MB3544.apcprd04.prod.outlook.com>
In-Reply-To: <PS2PR04MB3544D3F9F9D913A7828B6AB7FDA70@PS2PR04MB3544.apcprd04.prod.outlook.com>
From: Sui Chen <suichen6@gmail.com>
Date: Tue, 5 May 2020 10:31:44 -0700
Message-ID: <CAFaEeaE9DbzyHRKJZy24=D2yLJVk0Hq1adUV7vcRhNDNKWSzDw@mail.gmail.com>
Subject: Re: openbmc build issue.
To: Kumar Thangavel <thangavel.k@hcl.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "Velumani T-ERS, HCLTech" <velumanit@hcl.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Kumar,

I remember there are "python-core" and "python3-core" packages that
are much smaller than "python" and "python3" packags respectively.
(around 2MB vs 8MB if I remember correctly, with the difference causd
by all the Python packages that come with "python" and "python3")
So if you don't need all the Python packages it might be possible to
save space by installing the core Python and only the packages that
are used (for example, in one of my experiments, I included just
python-core and python-subprocess).

Thanks
Sui

On Tue, May 5, 2020 at 6:49 AM Kumar Thangavel <thangavel.k@hcl.com> wrote:
>
> Hi Andrew,
>
>              Thanks for your response and information. We are checking on=
 the python3 issue.
>
> Thanks,
> Kumar.
>
> -----Original Message-----
> From: Andrew Geissler <geissonator@gmail.com>
> Sent: Monday, May 4, 2020 9:23 PM
> To: Kumar Thangavel <thangavel.k@hcl.com>
> Cc: openbmc@lists.ozlabs.org; Velumani T-ERS,HCLTech <velumanit@hcl.com>
> Subject: Re: openbmc build issue.
>
> [CAUTION: This Email is from outside the Organization. Unless you trust t=
he sender, Don=E2=80=99t click links or open attachments as it may be a Phi=
shing email, which can steal your Information and compromise your Computer.=
]
>
> > On Apr 30, 2020, at 1:23 AM, Kumar Thangavel <thangavel.k@hcl.com> wrot=
e:
> >
> > Hi All,
> >
> > YV2 Build failing in latest LF openbmc master. PFB the reason and the d=
etailed log file. Please let me know if there are suggestions to resolve.
> > ERROR: obmc-phosphor-image-1.0-r0 do_generate_static: Image '/home/velu=
/buildtest/openbmc/build/tmp/work/yosemitev2-openbmc-linux-gnueabi/obmc-pho=
sphor-image/1.0-r0/deploy-obmc-phosphor-image-image-complete/obmc-phosphor-=
image-yosemitev2.squashfs-xz' is too large!
>
> Hi Kumar, you=E2=80=99ve exceeded the allowed size for you rootfs. You=E2=
=80=99ll need to pull some functions out. The biggest bang for your buck if=
 possible is to remove python usage. Otherwise, you=E2=80=99ll need to find=
 some functions to pull out.
>
> What probably caused this is upstream moved from python2 to python3. pyth=
on3 takes significantly more space in the image.
>
>
> > Please fine the attachment.
> >
> > Thanks,
> > Kumar.
>
> ::DISCLAIMER::
> ________________________________
> The contents of this e-mail and any attachment(s) are confidential and in=
tended for the named recipient(s) only. E-mail transmission is not guarante=
ed to be secure or error-free as information could be intercepted, corrupte=
d, lost, destroyed, arrive late or incomplete, or may contain viruses in tr=
ansmission. The e mail and its contents (with or without referred errors) s=
hall therefore not attach any liability on the originator or HCL or its aff=
iliates. Views or opinions, if any, presented in this email are solely thos=
e of the author and may not necessarily reflect the views or opinions of HC=
L or its affiliates. Any form of reproduction, dissemination, copying, disc=
losure, modification, distribution and / or publication of this message wit=
hout the prior written consent of authorized representative of HCL is stric=
tly prohibited. If you have received this email in error please delete it a=
nd notify the sender immediately. Before opening any email and/or attachmen=
ts, please check them for viruses and other defects.
> ________________________________
