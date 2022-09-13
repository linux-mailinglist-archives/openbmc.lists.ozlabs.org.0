Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B56A05B76C1
	for <lists+openbmc@lfdr.de>; Tue, 13 Sep 2022 18:52:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRqJw3QYNz3bbj
	for <lists+openbmc@lfdr.de>; Wed, 14 Sep 2022 02:52:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=l3pW7udo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=nanzhou@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=l3pW7udo;
	dkim-atps=neutral
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRqJW1gTyz2y6N
	for <openbmc@lists.ozlabs.org>; Wed, 14 Sep 2022 02:52:25 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id y17so23903221ejo.6
        for <openbmc@lists.ozlabs.org>; Tue, 13 Sep 2022 09:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=UfjPK0us6r5SqOK7CHsz/d9V0odXmBKfa07yTmENprQ=;
        b=l3pW7udoIaYcPOu1be+h+Kj01Nb9MdcXdStDcNdPbRAdKGgAWIe86rxtZGv0G5QG/X
         XZ1DuTdnl008v6ZTkp0k0pY27pO/h8NPpHSXRhhyPfTjMjK86QuSqQ4KIKpA+wIN/k0G
         jN4dwVvqykxeFwKgeMEXFptxFG44sjAIgLMHlS3lO0dgM/Kqd+110ZJxJiy97m7aYzZl
         ZN4FDhlalG1oLztYkIO9WjhdhN8Ce0zt3mIA8mUNEduIfnbbmLQgQah+bp3grJ5rewrn
         ISSlJ+dI3fayN/si9jaWgzkxoSLP+tF+5W2Nkc4rreG6L+xKc8mBkX1ZKlc0l/AZZ/bz
         lT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=UfjPK0us6r5SqOK7CHsz/d9V0odXmBKfa07yTmENprQ=;
        b=u9dqwAV+VF6Z7mAV984PDLoj/cymSc5qDQD5RXUaEoWvVLD7CWq6foEac0y3RgN4Na
         VoSnh9SjO2fEChg1A5SdELKgm0Aek6ID8k7gjuO7e4m/rFLZV7dSFeoGNdsugeKlpaag
         9FotdfxYNA0B5lqgV7R9x2yeBagzlCYCncDnQMjp2vVCgjr+awqDmOx1xzfL3TxSx8BZ
         1k7o+oDmtctd/tOzvtr40nDE/6EC23BqaM3MXhfLJe8fS6A1IAMYbXYPVod0Et3VHx+6
         FDcmOtmTL7n3giZUS+sMSa+NWYxQiC7AB57EuDcIkL+DtxRyvm+523JPh0I4jCSgaLtB
         8JrQ==
X-Gm-Message-State: ACgBeo2Q2ZeU6lrEoJd4fXYJN3eVmeDlLo/D41iOOy6h6FHzk0FeRXhL
	+VxfjbQY2acoCip1jOva3j2B+5bQWOKmEl/yjM4DOg==
X-Google-Smtp-Source: AA6agR7NLrvYTgiK11MXH1TjKeJinMYkJbzJq0Kaa+6Dh0w443ee5a+9NNmmKCj99Deho7n+8Kg08hoAIf9B1i6/Yvc=
X-Received: by 2002:a17:906:fe04:b0:777:b13d:30a6 with SMTP id
 wy4-20020a170906fe0400b00777b13d30a6mr17619029ejb.248.1663087937619; Tue, 13
 Sep 2022 09:52:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2-KxBmFwVmF4cr+_eTFrwdz9-he--PPfRvW=cN6oNGf4KA_A@mail.gmail.com>
 <Ys6riEnZm5SP8v76@heinlein.stwcx.org.github.beta.tailscale.net>
 <CAH2-KxBYyg240d48oNRbhNyRK+JkdWrzOcjrxs2JU959=NGP+A@mail.gmail.com>
 <CAOLfGj4fje3YBb+RTwXOPEpcNVf4O9bZ4CZhpe=Ai=J8baSf_Q@mail.gmail.com>
 <CAOLfGj6Rxi6+cVoSVqY=GPUV48wNNq8FFEy0mk_zVHrNab+oSw@mail.gmail.com> <A17313F9-E043-4949-AD49-5953AECCDA48@fuzziesquirrel.com>
In-Reply-To: <A17313F9-E043-4949-AD49-5953AECCDA48@fuzziesquirrel.com>
From: Nan Zhou <nanzhou@google.com>
Date: Tue, 13 Sep 2022 09:52:06 -0700
Message-ID: <CAOLfGj7OieRNHxH_kgZMJxWuVSSbiW_W1iHsJ7UMwFjH6t11sQ@mail.gmail.com>
Subject: Re: DBus ObjectManager Interface usages within the project
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: multipart/alternative; boundary="000000000000c14aca05e891d5a2"
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
Cc: Ed Tanous <edtanous@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000c14aca05e891d5a2
Content-Type: text/plain; charset="UTF-8"

Oh, yeah, wrong URL. I meant
https://github.com/search?l=C%2B%2B&q=org%3Aopenbmc+DIMM&type=Code.

Thanks for your correction.

On Tue, Sep 13, 2022 at 8:46 AM Brad Bishop <bradleyb@fuzziesquirrel.com>
wrote:

>
>
> > On Sep 12, 2022, at 12:54 PM, Nan Zhou <nanzhou@google.com> wrote:
> >
> > I searched all the DIMM daemons in the org.
> https://github.com/openbmc/openpower-vpd-parser/search?q=DIMM
>
> For what it is worth, this link is not searching the entire org, just the
> openpower-vpd-parser repository.
>

--000000000000c14aca05e891d5a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Oh, yeah, wrong URL. I meant=C2=A0<a href=3D"https://githu=
b.com/search?l=3DC%2B%2B&amp;q=3Dorg%3Aopenbmc+DIMM&amp;type=3DCode">https:=
//github.com/search?l=3DC%2B%2B&amp;q=3Dorg%3Aopenbmc+DIMM&amp;type=3DCode<=
/a>.<div><br></div><div>Thanks for your correction.</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 13, 20=
22 at 8:46 AM Brad Bishop &lt;<a href=3D"mailto:bradleyb@fuzziesquirrel.com=
">bradleyb@fuzziesquirrel.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><br>
<br>
&gt; On Sep 12, 2022, at 12:54 PM, Nan Zhou &lt;<a href=3D"mailto:nanzhou@g=
oogle.com" target=3D"_blank">nanzhou@google.com</a>&gt; wrote:<br>
&gt; <br>
&gt; I searched all the DIMM daemons in the org. <a href=3D"https://github.=
com/openbmc/openpower-vpd-parser/search?q=3DDIMM" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/openbmc/openpower-vpd-parser/search?q=3DDIMM=
</a><br>
<br>
For what it is worth, this link is not searching the entire org, just the o=
penpower-vpd-parser repository.<br>
</blockquote></div>

--000000000000c14aca05e891d5a2--
