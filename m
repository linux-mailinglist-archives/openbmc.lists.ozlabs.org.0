Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8BA1E320E
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 00:08:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Wp4p0vdXzDqND
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 08:08:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::72c;
 helo=mail-qk1-x72c.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=DIas4h86; dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Wp3s1S4czDqLd
 for <openbmc@lists.ozlabs.org>; Wed, 27 May 2020 08:07:35 +1000 (AEST)
Received: by mail-qk1-x72c.google.com with SMTP id f189so22423413qkd.5
 for <openbmc@lists.ozlabs.org>; Tue, 26 May 2020 15:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IxD5i1MACQeeFgW3Ul/vvWj28/Ofq6CvJsRcj0JPwSg=;
 b=DIas4h86N0DutQjvrvo0weEUVj9B0b45WVi2A7q6Ed3951NtpT9axnAn99ZADM4GgC
 zdTel/7YJDxOtWC9aymSC24c934ual69+vzT8CzvvF0WB6A4rPA7gW/29oAsE7YKCgld
 UQjaMzo+RjWD7i0/P/8NUYPW5md3ix2kcYKdvF1tb2/zz1Mcv6oH3DtgV0pYM4H/SLIn
 kT3a46lZKVS3erONl8B2ifQWiY3H5RK/y2jnWKu5bxUOSA2RIntxtwvgy9OVZuVmj3+y
 eMyPWvmaypZIrdNzBiITxxD/6RE8GnmIXB5g7rIX/zv1z6IaaYph2vNgiGCljbuaSWBy
 wyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IxD5i1MACQeeFgW3Ul/vvWj28/Ofq6CvJsRcj0JPwSg=;
 b=pm77OmZBUWmqout8h0E5U3PINaaAubI+zTHLbspb0hrRDCIjB2sPSzEANOV4yflt5P
 cYfjC8Cuj5F19LoERfLKkMzQi1/D8h0EIz/t03h39OZAcr4OXoDWEAgGBwNn74tHYEtH
 YQPAy1O/+2VOegJXnUj6LBg2YVlSrlguZJYP6u6k7Fen7BVmkL4oDVPLMN62XTH25xvY
 eApwO00LDoiaZW0xr3hmEmbu7xPEpdfLdRQZCXugjwzEjpAd+KPlKkS7yZwdSY0K/64W
 LaeyYBAKmgd59PAMyHGYkSv0JBueEs+dRFnEx+Mxaw5R7LLesiOjK/3lwGpSSZaIlgiX
 WZwQ==
X-Gm-Message-State: AOAM532GNyq9ou0/GHYq542afwnvrkgECtWMEABcLB3FdzSz0z8XgQeY
 2/vaBto4L5eXBcKzk12qxpCoTiPUCSl7iatqPvcRgA==
X-Google-Smtp-Source: ABdhPJxq41nVOm6RpkoaSXz1th9aryWpZVEPqIshEuZlqOI00Js19O0BposdvAyZLXc25Wne0MNSEcjZMBLlraqxZuY=
X-Received: by 2002:a37:484e:: with SMTP id v75mr974984qka.79.1590530852782;
 Tue, 26 May 2020 15:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <bbd0955547ff46728528fd14d52fb04d@SCL-EXCHMB-13.phoenix.com>
 <CAPnigKn3TOKhMTimsigFGmA0axAR9VrrrFhYuRNVFuxnkq1XVQ@mail.gmail.com>
 <81002ab230724519b523f4cff7c49b3d@SCL-EXCHMB-13.phoenix.com>
In-Reply-To: <81002ab230724519b523f4cff7c49b3d@SCL-EXCHMB-13.phoenix.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 26 May 2020 15:07:21 -0700
Message-ID: <CAO=notxZsnDFbwK2K-ck9d-Udi-Crb+hWpu8NF4iESWkeRwJyw@mail.gmail.com>
Subject: Re: phosphor-ipmi-flash state recovery
To: Patrick Voelker <Patrick_Voelker@phoenix.com>
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
Cc: "OpenBMC \(openbmc@lists.ozlabs.org\)" <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>, William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, May 22, 2020 at 3:57 PM Patrick Voelker
<Patrick_Voelker@phoenix.com> wrote:
>
> Do you have a timeline for upstreaming your changes?
>
>
>
> 10 minutes seems rather excessive for a session timeout.  I=E2=80=99d pre=
fer to see it set to something more like 30 seconds except for the update p=
rocess itself if it involves writing to flash.
>
>
>
> Alternately, what would you think of this option?
>
> =C2=B7         Add a =E2=80=98force=E2=80=99 command line override to bur=
n_my_bmc that would cause it to attempt to obtain the current SessionID and=
 do a close on it if the specified image is already active.
>
> =C2=B7         On the BMC side, I=E2=80=99d need to a method to obtain th=
e session ID for a blob. It=E2=80=99d have been perfect to return that in B=
mcBlobStat=E2=80=99s response but maybe a new command called BmcBlobSession=
 would be appropriate?
>
>
>
>
>
> From: William Kennington [mailto:wak@google.com]
> Sent: Friday, May 22, 2020 3:15 PM
> To: Patrick Voelker
> Cc: OpenBMC (openbmc@lists.ozlabs.org); Patrick Venture; Benjamin Fair
> Subject: Re: phosphor-ipmi-flash state recovery
>
>
>
> I was working on a change to fix this a couple of weeks ago and implement=
 the needed expiry / cancellation mechanisms to make everything happy. Righ=
t now the easiest thing you can is reset the BMC or just the ipmi daemon.
>
>
>
> On Fri, May 22, 2020 at 3:06 PM Patrick Voelker <Patrick_Voelker@phoenix.=
com> wrote:
>
> When running burn_my_bmc, if I exit the program during image upload with =
ctrl-c, it seems that the bmc gets left in a state that is difficult to rec=
over from.
>
>
>
> When attempting to run the update again I can see that the /flash/active/=
image blob is present.  burn_my_bmc opens the cleanup blob, commits it, and=
 then closes it but the state doesn=E2=80=99t change. I don=E2=80=99t have =
the cleanup-delete option enabled but it doesn=E2=80=99t look like that cle=
ans up the state anyhow.
>
>
>
> Internally, it looks like I need to get to abortProcess() but to do that =
I need to close the current session but I don=E2=80=99t have a way to obtai=
n the sessionID after the fact.  Also the stale session doesn=E2=80=99t see=
m to expire (as mentioned in the readme.md) and I can=E2=80=99t find the su=
pport for that in the code.

https://github.com/openbmc/phosphor-ipmi-flash/blob/master/bmc/firmware_han=
dler.cpp#L95

You should be able to just delete any of the blob Id paths, such as
the active blob path, and that should trigger what you want.

>
>
>
> Can you give me a pointer on the best known way to recover from this scen=
ario without rebooting the BMC?
>
>
