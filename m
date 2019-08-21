Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C07981A1
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 19:43:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DFPX2dbMzDr7B
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2019 03:43:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=yuenn@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="LSYFnnwu"; 
 dkim-atps=neutral
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DFNk54qCzDr5l
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 03:42:29 +1000 (AEST)
Received: by mail-io1-xd36.google.com with SMTP id z3so6351878iog.0
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 10:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HX1/t79vZk1U5vrvwv6vkpqCU8tCYEauaa31fKEq6Dg=;
 b=LSYFnnwu8TZzOJlFovn2BWMhwu2Y499OV8fB49Si+w4nvjHS+jlXVykEeZtMn89vW2
 iemn1bM1/Mig2kpM+UCeo8M5XHdWrtsLvglANzUzqzNJESoPns5Z/5h9JJ3AzXSmP+3N
 9w5RSHC1A2shMRViiOvRhJnVUALX3YTFyYVEwnznZmU9INda2q0zUIoFqXHyCe4AUqMP
 /XqOL1rvrkdRQXIUpIarpXJ3uAobHze4Hk+afhRvzxHMnV+30eENq3VpkKsmg1Ub3Nbm
 adK0dwNoEYMO60XeR0IvS/Wta5VJlw3LJk1OtU/u6N1udERJ38Az/sSlZdyNqH9keIM9
 DFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HX1/t79vZk1U5vrvwv6vkpqCU8tCYEauaa31fKEq6Dg=;
 b=tXfKYu/UrVo5MEiHvr0dYcDe8ykPBGAx1/8Pe6M2RIFXWk/jfPm8x0+yeP/B1yOGVX
 Zip6CvdMkLk/lhZD3pcqiBUUC3QucRz/nEhwA2k09T0S44NZNSuJ/y1V2UmucHEa2FeG
 ltAJ6QJxeBBcozhxGJyATj/j8/VvOabAYpA3HMO2CSSTU+lxT4c38Ak0MFYWXTX2By2j
 K8ltLV/Q6wxfQrbaFWEnHWvwY8XHGifthC2tFNV1k5E4p4PeA4bcZ7caSXdLCRPZsVqR
 ndIObIcbDUSYWwIVH6VdJWl5BlbGSLHmku79HqRBTS2ZuBCXJ+mbF/y4alyZ2iNMChfi
 GyHA==
X-Gm-Message-State: APjAAAWygQhqY/dS30N9VzkH0+4mhDV2a6k8SwxpyhFD96sqwDGFJo8Q
 LBnj+9SEElp+0VeZ5haIJ6KR/154yrguka1ukDVihA==
X-Google-Smtp-Source: APXvYqwFUFCzjus9/m+aeD+9bx2aN6oJCsoclnR/NO7RbNQQif5G1eF/JOHZSUFMnBymXxgJdmWpuhYCjV7+Z0bpr3Y=
X-Received: by 2002:a5e:960a:: with SMTP id a10mr1231565ioq.82.1566409345986; 
 Wed, 21 Aug 2019 10:42:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAGMNF6Xdkf8Obp8iLVajt21ZT81RAuGksper_u-w9Fvt_OrCZA@mail.gmail.com>
 <20190722163049.kyupys7alq6zzq6x@thinkpad>
 <CAGMNF6UO0T7Dq4--QDXGkbWZ3CwKAhFSLxy5rKeMW-Af=V=o_A@mail.gmail.com>
 <843FFB1F-4CF1-45EB-80E1-216FD23C8E2D@fuzziesquirrel.com>
 <CAGMNF6V-ReCHTbSpM0Ly65f+PsCZDf+KAjL+pEybmWKYaNjBjg@mail.gmail.com>
 <852D2A81-1C96-4BD3-8F83-489E43A564A5@fuzziesquirrel.com>
In-Reply-To: <852D2A81-1C96-4BD3-8F83-489E43A564A5@fuzziesquirrel.com>
From: Nancy Yuen <yuenn@google.com>
Date: Wed, 21 Aug 2019 10:41:48 -0700
Message-ID: <CADfYTpHHFF6EGupzKk=VM7FBsevAZLHE8N_safZs7V=i=RNSxQ@mail.gmail.com>
Subject: Re: Integrate collectd with OpenBMC
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: multipart/alternative; boundary="000000000000a45b8c0590a41846"
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
Cc: Gabriel Matute <gmatute@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000a45b8c0590a41846
Content-Type: text/plain; charset="UTF-8"

Will do.
----------
Nancy


On Wed, Aug 21, 2019 at 5:14 AM Brad Bishop <bradleyb@fuzziesquirrel.com>
wrote:

> at 4:46 PM, Kun Yi <kunyi@google.com> wrote:
>
> > No problem, thanks!
> > Brad, could you also add Gabriel to the list of OpenBMC contributors?
> His
> > email is gabomatute@gmail.com
> > Does he need to sign the CLA individually?
>
> Hi Kun
>
> No the corporate CLA has the concept of a CLA manager who can add and
> remove people from the company CLA.
>
> Nancy can you add Gabriel to Googles schedule A and to the
> google/ci-authorized gerrit group?
>
> thx - brad
>

--000000000000a45b8c0590a41846
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Will do.<br clear=3D"all"><div><div dir=3D"ltr" class=3D"g=
mail_signature" data-smartmail=3D"gmail_signature">----------<br>Nancy</div=
></div><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Wed, Aug 21, 2019 at 5:14 AM Brad Bishop &lt;<a href=3D"mailt=
o:bradleyb@fuzziesquirrel.com">bradleyb@fuzziesquirrel.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">at 4:46 PM, Kun Y=
i &lt;<a href=3D"mailto:kunyi@google.com" target=3D"_blank">kunyi@google.co=
m</a>&gt; wrote:<br>
<br>
&gt; No problem, thanks!<br>
&gt; Brad, could you also add Gabriel to the list of OpenBMC contributors? =
His=C2=A0 <br>
&gt; email is <a href=3D"mailto:gabomatute@gmail.com" target=3D"_blank">gab=
omatute@gmail.com</a><br>
&gt; Does he need to sign the CLA individually?<br>
<br>
Hi Kun<br>
<br>
No the corporate CLA has the concept of a CLA manager who can add and=C2=A0=
 <br>
remove people from the company CLA.<br>
<br>
Nancy can you add Gabriel to Googles schedule A and to the=C2=A0 <br>
google/ci-authorized gerrit group?<br>
<br>
thx - brad<br>
</blockquote></div>

--000000000000a45b8c0590a41846--
