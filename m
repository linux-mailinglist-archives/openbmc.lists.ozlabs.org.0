Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7DC28657A
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 19:10:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6176672lzDqQ6
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 04:10:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::329;
 helo=mail-ot1-x329.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=J2rJP5xc; dkim-atps=neutral
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C61632hVczDqPR
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2020 04:09:30 +1100 (AEDT)
Received: by mail-ot1-x329.google.com with SMTP id s66so2947198otb.2
 for <openbmc@lists.ozlabs.org>; Wed, 07 Oct 2020 10:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=J+GEmzM40mb+YXb64ArWZ/YYcTpx2Y4eV/7RwYRxX+s=;
 b=J2rJP5xcW2Vy+NV9TVPSqEhXCEOmv+3ht7GGiCkkxlVnLsWtSoTkj9UZC25zbH9GVj
 eOKktqdZV0moxHqmfKKJaZ6kL9gLYfPab8uyCUm0UrjqD+7ZLnxcqwOYNwd/l+G4zRdQ
 NdGksJo5kxEJXUzM6RJ0BYZJ90uSBUAJNWZE8XB0wozvjm6FAGwPEuV80BYe3pguaZA+
 ETigK3eK4OvEzIZx52xUK2ABfYDgmzeC2L9rRIfvSAvIglxh5xAXxbACZkfY5GVSOGLQ
 r9Zlay7kfFsZJSHtoy7TtsT+Nu188yPSP3be/lFmaN7ZpYDOdNSZvfY5xse+WyWfBK5D
 wqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=J+GEmzM40mb+YXb64ArWZ/YYcTpx2Y4eV/7RwYRxX+s=;
 b=N8clcLrVytN9IV91/iUrCCeh1T5Tw10G3pV6xU8X3Ztl6eKXawAuDw99gi013tCZOn
 P/acV5BBh6khIiO7lmy98Qy8G0Xn13iu7IJHSXXf9FpUxLID2Wd9OOJ63EUbyzMJJ05Q
 34eCEcolXMo8SnFzspAzlaHw/uQKgkEHNtSd9JMOl1NN9ShV8KqbEQ5lj92HCTPDcrff
 6Ehao9m+Iq6xsXLapQ0k4THVg/enOihGamWyctfA5WYOcJQXxMLJttdCtFbUaKtoTJEI
 KzM178e8fAYsUPsJEFvhx4NCrxBZPWKsFyw7EaOVaT/eI8UB7ot/cFqTIYf6MSrOjS15
 ZLeA==
X-Gm-Message-State: AOAM530KmlSdZH5ALd+AimHFqyP7q4k9QDmJEIeXwGuFAXCEsDkOSktE
 9CnZPSI8kjT3+ELZabmEDcqFdJeDGgU=
X-Google-Smtp-Source: ABdhPJwXsrsDkfd1gxqHCVAGDjWsPsv98nV3Q2+BWsZOfKoettytP7L+1eZQc/6skFieFM2Z2qfH1w==
X-Received: by 2002:a05:6830:1e30:: with SMTP id
 t16mr2558862otr.18.1602090568023; 
 Wed, 07 Oct 2020 10:09:28 -0700 (PDT)
Received: from ?IPv6:2601:281:c001:2359:bd27:bf07:e767:52a0?
 ([2601:281:c001:2359:bd27:bf07:e767:52a0])
 by smtp.gmail.com with ESMTPSA id n13sm2407744oic.14.2020.10.07.10.09.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2020 10:09:27 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary=Apple-Mail-213F400E-A890-464A-812C-E86C3B56A9DE
Content-Transfer-Encoding: 7bit
From: Mike <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: LTC2991 Driver request
Date: Wed, 7 Oct 2020 11:09:26 -0600
Message-Id: <D6042D41-D2B0-49FB-8DD7-2C363D8A1B45@gmail.com>
References: <CABbLDjNz4N+CvR0hro+Te-+2-_FMD_OsOOXXzOVPH01qpjFKHw@mail.gmail.com>
In-Reply-To: <CABbLDjNz4N+CvR0hro+Te-+2-_FMD_OsOOXXzOVPH01qpjFKHw@mail.gmail.com>
To: Anony Mous <obmc.developers@gmail.com>
X-Mailer: iPhone Mail (17H35)
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Apple-Mail-213F400E-A890-464A-812C-E86C3B56A9DE
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

If you can send me context, like what company hardware, etc, I might be able=
 to prioritize. I have a week off during the next two weeks and a heavy load=
ing.

The register set is different than LTC2990, but it would make a good startin=
g point.

Three or four weeks would be more manageable.

If you willing to provide context, send to

Michael-A1.Jones@analog.com for your privacy.

Mike

Sent from my iPhone

> On Oct 7, 2020, at 9:10 AM, Anony Mous <obmc.developers@gmail.com> wrote:
>=20
> =EF=BB=BF
> Mike:
>=20
> Thank you,  Would it be possible to have something within, say 2 weeks?  A=
nd is there anything you would need from me?  I know that there is a driver f=
or the LTC2990 (a quad monitor) as part of OpenBMC, perhaps that could be us=
ed as a jumping off point.
>=20
> Respectfully:
>=20
>=20
>> On Wed, Oct 7, 2020 at 6:38 AM Mike <proclivis@gmail.com> wrote:
>> Anony,
>>=20
>> This part is supported by my team at ADI. I can write a driver if necessa=
ry.
>>=20
>> I=E2=80=99ll take a look at the DS and similar drivers this morning and r=
espond.
>>=20
>> What is your timeframe?
>>=20
>> Mike Jones
>>=20
>>=20
>>=20
>> Sent from my iPhone
>>=20
>> > On Oct 6, 2020, at 7:32 PM, Anony Mous <obmc.developers@gmail.com> wrot=
e:
>> >=20
>> > =EF=BB=BF
>> > Does anyone have a driver for the Linear Technology LTC2991 Octal monit=
or chip?
>> >=20
>> > Thank you!
>> >=20

--Apple-Mail-213F400E-A890-464A-812C-E86C3B56A9DE
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div>If you can send me context, like what c=
ompany hardware, etc, I might be able to prioritize. I have a week off durin=
g the next two weeks and a heavy loading.</div><div><br></div><div>The regis=
ter set is different than LTC2990, but it would make a good starting point.<=
/div><div><br></div><div>Three or four weeks would be more manageable.</div>=
<div><br></div><div>If you willing to provide context, send to</div><div><br=
></div><div>Michael-A1.Jones@analog.com for your privacy.</div><div><br></di=
v><div>Mike<br><br><div dir=3D"ltr">Sent from my iPhone</div><div dir=3D"ltr=
"><br><blockquote type=3D"cite">On Oct 7, 2020, at 9:10 AM, Anony Mous &lt;o=
bmc.developers@gmail.com&gt; wrote:<br><br></blockquote></div><blockquote ty=
pe=3D"cite"><div dir=3D"ltr">=EF=BB=BF<div dir=3D"ltr"><div>Mike:</div><div>=
<br></div><div>Thank you,&nbsp; Would it be possible to have something withi=
n, say 2 weeks?&nbsp; And is there anything you would need from me?&nbsp; I k=
now that there is a driver for the LTC2990 (a quad monitor) as part of OpenB=
MC, perhaps that could be used as a jumping off point.</div><div><br></div><=
div>Respectfully:</div><div><br></div></div><br><div class=3D"gmail_quote"><=
div class=3D"gmail_attr" dir=3D"ltr">On Wed, Oct 7, 2020 at 6:38 AM Mike &lt=
;<a href=3D"mailto:proclivis@gmail.com">proclivis@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
padding-left:1ex;border-left-color:rgb(204,204,204);border-left-width:1px;bo=
rder-left-style:solid">Anony,<br>
<br>
This part is supported by my team at ADI. I can write a driver if necessary.=
<br>
<br>
I=E2=80=99ll take a look at the DS and similar drivers this morning and resp=
ond.<br>
<br>
What is your timeframe?<br>
<br>
Mike Jones<br>
<br>
<br>
<br>
Sent from my iPhone<br>
<br>
&gt; On Oct 6, 2020, at 7:32 PM, Anony Mous &lt;<a href=3D"mailto:obmc.devel=
opers@gmail.com" target=3D"_blank">obmc.developers@gmail.com</a>&gt; wrote:<=
br>
&gt; <br>
&gt; =EF=BB=BF<br>
&gt; Does anyone have a driver for the Linear Technology LTC2991 Octal monit=
or chip?<br>
&gt; <br>
&gt; Thank you!<br>
&gt; <br>
</blockquote></div>
</div></blockquote></div></body></html>=

--Apple-Mail-213F400E-A890-464A-812C-E86C3B56A9DE--
