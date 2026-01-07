Return-Path: <openbmc+bounces-1101-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4ACD0050F
	for <lists+openbmc@lfdr.de>; Wed, 07 Jan 2026 23:31:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmjS03FRMz2yGQ;
	Thu, 08 Jan 2026 09:31:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=74.125.224.54
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767811159;
	cv=none; b=nzXzQJ35V11KAmzz80YsQNmfaZzrm3SNSPk2NiY1BqYFdZhMPGjktdzAvCzdw+KeE4tAQICnopGw3L7QochDVCQNqA7IKv8h2cFNWibdS7J5JB+r1j2Sjj89GfAmZNPUNTLRCQfGwP6XIyRMGwp5zVHPap/VDSYM8MieYJPdNtxbQ2LjzU5GArWgSd7/3Czrm11PUPXHDVURuvz32HhXfeohJ6vYvVjSgYBvwGEzkj7L0AtsjVBt8qs8WMx0Z74BlCLGCSlhp+gNozo/l1vN1VJoIGIt0vBDHJkA+J02x767pwFsI4ZmToHDtBtaaGZLdCrejNv4tAs+iOxE8V3w8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767811159; c=relaxed/relaxed;
	bh=hU/Fp2Qe5W+zfxYTRcaP+j/sx+sDf3+nqL+plkksSVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vw3qq4nxQoze1epVJGEa2bt4fy2H6c+AMezMmIpM9ue7xXkHvnVhuWcrmFQ64jIcPmlIn435ARrKeCcI/fCfebMIrzHi4hhwirU8DpQmU+Nw5QGD7iz60FyBbqryLsR9KvRjv41tG8Hq8FMqPRuzUxBqwNwqzExDkHjqW1LMkkvnqQ/xU0euN7NwG/3kDSH5ZeWzzbWlG7YV72qCH9mMpj93pkWAZiyrNKdCPum6B/Gax/3/8/VKU31cd5YOMi0dPbQg1twKS+SgIRDBd25ZHB//Llh5GL1CK3VLhAddC4WbroTk0d2XCOdXGaGZZj0gClvQWoHi2PycKY6ZZEFhig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=lfprojects.org; dkim=pass (2048-bit key; unprotected) header.d=lfprojects-org.20230601.gappssmtp.com header.i=@lfprojects-org.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=euDcpDK5; dkim-atps=neutral; spf=softfail (client-ip=74.125.224.54; helo=mail-yx1-f54.google.com; envelope-from=manager@lfprojects.org; receiver=lists.ozlabs.org) smtp.mailfrom=lfprojects.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=lfprojects.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=lfprojects-org.20230601.gappssmtp.com header.i=@lfprojects-org.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=euDcpDK5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=lfprojects.org (client-ip=74.125.224.54; helo=mail-yx1-f54.google.com; envelope-from=manager@lfprojects.org; receiver=lists.ozlabs.org)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmcJK2P0wz2xJF
	for <openbmc@lists.ozlabs.org>; Thu, 08 Jan 2026 05:39:12 +1100 (AEDT)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-646d9eb45afso2278036d50.2
        for <openbmc@lists.ozlabs.org>; Wed, 07 Jan 2026 10:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lfprojects-org.20230601.gappssmtp.com; s=20230601; t=1767811089; x=1768415889; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hU/Fp2Qe5W+zfxYTRcaP+j/sx+sDf3+nqL+plkksSVA=;
        b=euDcpDK5j5rdbUAelZuk1PDlMtJZVnqoL4iwRWFcffJRHXTtBI0E6RHGFrwnHKQsC2
         Y2DhMG0evCPLBmebXMFRt4IPrOqeun7sS2/I/zLBbcoIz6b8mIYmgM3uUfHavrUikf3o
         z6agygEFoXBzBw6d26tRaQNCdmq7SpVToF7zZ3l0pu6slqtx0dVhtjSI4FMwz83+7JAQ
         I0pjJ7gErRfq2z2enklAEgZ4RyS57J5C1K23RkN0LNTS4qdLivGywNdKHFzXmZcLmiwQ
         z1IsklcCh6Wo7+lnyt9IT+bMTZ8wNDolgdSLGkdbwLq4OupcYM2Bohfuoi+52UwIfLFW
         aFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767811089; x=1768415889;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hU/Fp2Qe5W+zfxYTRcaP+j/sx+sDf3+nqL+plkksSVA=;
        b=kthRrgwDud0X8MDMNcrbN4jfXw5MJzZrDe51mqm6rcD02b1RcoTAXBwfZXVNLRttZJ
         kWxDVWjFz6Fd2nSXz6QKkupZGSZttTRa1ikV1tz6SI/HQ3XGB1VvtGIMBmZ3CHsgb6k+
         /nM4xJ7dJnkuBPAi6WA22DTf8oaPxCDpFQb1fKCfFeqf9tqvfGKhaxwK+TmgC49zOV/a
         MTdJQli6b0K7TRw6W76NpZd7jnctu7Wo/r9q94l3AGMywv4eIMeujQsJ2uw5vIgr7e2y
         VQ2s74rB85j24P6aoPqUQYMQyKRzP0H5X9/QselOUSgbg4DC9QNZroC1YwbB4N5pLXRR
         9yxQ==
X-Gm-Message-State: AOJu0YxNl0Y1pV+Q6bEaR3aGQEuVOfjOcJM/nn0Ssai2niw0xznA69Zj
	UAiYZPYNcLEiVdppN0rN0rCEPcSgtlqhlYXfW9JLEH9M0TaEdL7zU+oB276S7oKyLW2iw23eIaG
	eBQVG0ka8TlYhHrQklBuWOW8z0Cw0Jkpqn6AcIxWPkg==
X-Gm-Gg: AY/fxX4QZjHgQw/LSxtCuyDRMVF/5ETisTVhD92DbLErut2H6SUixo6ZZieyx2Uwshn
	WoUBuG7dE8lmUmDm+3FKcejq5Qw1VK2fDVZjCjR4UyrgMecQW5QDKwvlhWYggqrH4xIqybbicyY
	99cVPv2uJLCuz45DTN63C6FO3JUs6c2/mqMfqBdts3tu1rdiF0wRxuw6hZ41Nte83ymfWLYtCwE
	CS9EmN38IFcIjVfYCzBlMVsV+GzPRPJOw357qvdxnh7emNBXr0t/JqJrverzcsw6jiUtfM=
X-Google-Smtp-Source: AGHT+IFFkllLtnZIIzCjJk8ALcLVyO7Gs1MKg16CKpWC5NNK1zDFICg9dWwmWabnG50wOl4k1aAuGfv5zTaIdavlaC4=
X-Received: by 2002:a05:690e:14ce:b0:642:f9a9:74eb with SMTP id
 956f58d0204a3-64716c3eb5amr2931912d50.71.1767811089230; Wed, 07 Jan 2026
 10:38:09 -0800 (PST)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <CAKmsAdnDfkOQqaL_KJ5y4QDBYoDifSSdOGZdFdwSzNxScC5zxg@mail.gmail.com>
 <CALVHhed3eE1XjcF21rnKEChoxpAkHoepi5hU3jYj-eSuB+1hiA@mail.gmail.com> <CAKmsAdmfX6jZAVBd5XeDqUk-Mq3bFpOM5+WukRfMgNE29SMB0w@mail.gmail.com>
In-Reply-To: <CAKmsAdmfX6jZAVBd5XeDqUk-Mq3bFpOM5+WukRfMgNE29SMB0w@mail.gmail.com>
From: Mike Dolan <manager@lfprojects.org>
Date: Wed, 7 Jan 2026 13:37:58 -0500
X-Gm-Features: AQt7F2oEoxinYwDVRtSSoOfq6ROnIVyqYI83Q7ZqHquElSrubYu_MjY79lDXQZY
Message-ID: <CALVHhecuwENv9w4QEmjLShLiq9=PMv6HyiWwAxOS-85MfrBftg@mail.gmail.com>
Subject: Re: OpenBMC Individual CLA Resubmission - ksypassion
To: Soo-yeon Kang <ksypassion@gmail.com>
Cc: openbmc@lists.ozlabs.org, Andrew Geissler <andrewg@us.ibm.com>
Content-Type: multipart/alternative; boundary="0000000000000101940647d09857"
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
	SPF_SOFTFAIL autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--0000000000000101940647d09857
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Soo-yeon, the OpenBMC community requires contributors employed at a
company to have the company CCLA on file. I would recommend you get the
company CCLA approval first.

Mike

On Tue, Jan 6, 2026 at 10:06=E2=80=AFPM Soo-yeon Kang <ksypassion@gmail.com=
> wrote:

> Hello,
>
> I am currently contributing as an individual to get started with OpenBMC
> development. However, I work at XSLab (https://xslab.co.kr) as an
> embedded
> software developer, and we are planning to have our company sign a
> Corporate CLA in the future.
>
> For now, could you please process my Individual CLA so I can begin
> contributing immediately? We will follow up with a Corporate CLA later
> once the company completes the necessary approvals.
>
> Is this approach acceptable?
>
> Thank you.
> Best Regards
>
> 2026=EB=85=84 1=EC=9B=94 7=EC=9D=BC (=EC=88=98) AM 4:39, Mike Dolan <mana=
ger@lfprojects.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
>> Hi Soo-yeon, which company are you contributing on behalf of?
>>
>> Mike
>>
>> On Tue, Jan 6, 2026 at 4:29=E2=80=AFAM Soo-yeon Kang <ksypassion@gmail.c=
om>
>> wrote:
>>
>>> Hello,
>>>
>>> I am resubmitting my Individual Contributor License Agreement for
>>> OpenBMC.
>>>
>>> I originally submitted my CLA on December 7, 2022, but it appears it wa=
s
>>> not processed in the system.
>>> I am currently unable to contribute to OpenBMC repositories due to "Use=
r
>>> not approved" status.
>>>
>>> I am attaching a newly signed CLA document with this email.
>>> (Attached file: OpenBMC_ICLA_ksypassion.pdf)
>>> Please process this resubmission and confirm once it has been registere=
d.
>>>
>>> Details:
>>>
>>> - Full Name: Soo-yeon Kang
>>> - Email: ksypassion@gmail.com
>>> - GitHub Username: ksypassion
>>> - Gerrit Username: ksypassion
>>>
>>>
>>> Please let me know once my CLA has been processed.
>>>
>>> Thank you.
>>>
>>>
>>> --
>>>
>>>
>>> Soo-yeon  Kang
>>>
>>> Mobile: +82 10 - 4067 - 8539
>>> E-mail: ksypassion@gmail.co <ksypassion@gmail.com>m
>>>
>>>
>
> --
>
>
> Soo-yeon  Kang
>
> Mobile: +82 10 - 4067 - 8539
> E-mail: ksypassion@gmail.co <ksypassion@gmail.com>m
>
>

--0000000000000101940647d09857
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Soo-yeon, the OpenBMC community requires contributors e=
mployed at a company to have the company CCLA on file. I would recommend yo=
u get the company CCLA approval first.=C2=A0<div><br></div><div>Mike</div><=
/div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Jan 6, 2026 at 10:06=E2=80=AFPM Soo-yeon Kang =
&lt;<a href=3D"mailto:ksypassion@gmail.com">ksypassion@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D=
"ltr">Hello,<br><br>I am currently contributing as an individual to get sta=
rted with OpenBMC <br>development. However, I work at XSLab (<a href=3D"htt=
ps://xslab.co.kr" target=3D"_blank">https://xslab.co.kr</a>) as an embedded=
 <br>software developer, and we are planning to have our company sign a <br=
>Corporate CLA in the future.<br><br>For now, could you please process my I=
ndividual CLA so I can begin <br>contributing immediately? We will follow u=
p with a Corporate CLA later <br>once the company completes the necessary a=
pprovals.<br><br>Is this approach acceptable?<br><br>Thank you.<div>Best Re=
gards</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">2026=EB=85=84 1=EC=9B=94 7=EC=9D=BC (=EC=88=98) AM 4:39, Mike Do=
lan &lt;<a href=3D"mailto:manager@lfprojects.org" target=3D"_blank">manager=
@lfprojects.org</a>&gt;=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi=C2=A0Soo-=
yeon, which company are you contributing on behalf of?<div><br></div><div>M=
ike</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Tue, Jan 6, 2026 at 4:29=E2=80=AFAM Soo-yeon Kang &lt;<a href=
=3D"mailto:ksypassion@gmail.com" target=3D"_blank">ksypassion@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div>Hello,</div><div><br>I am resubmitting my Individual Cont=
ributor License Agreement for OpenBMC.<br><br>I originally submitted my CLA=
 on December 7, 2022, but it appears it was not processed in the system.</d=
iv><div>I am currently unable to contribute to OpenBMC repositories due to =
&quot;User not approved&quot; status.<br><br>I am attaching a newly signed =
CLA document with this email.</div><div>(Attached file:=C2=A0OpenBMC_ICLA_k=
sypassion.pdf)<br>Please process this resubmission and confirm once it has =
been registered.</div><div><br>Details:<br></div><blockquote style=3D"margi=
n:0px 0px 0px 40px;border:none;padding:0px"><div>- Full Name: Soo-yeon Kang=
</div><div>- Email: <a href=3D"mailto:ksypassion@gmail.com" target=3D"_blan=
k">ksypassion@gmail.com</a></div><div>- GitHub Username: ksypassion</div><d=
iv>- Gerrit Username: ksypassion</div></blockquote><div><br>Please let me k=
now once my CLA has been processed.</div><div><br>Thank you.<br><br></div><=
div><br></div><span class=3D"gmail_signature_prefix">-- </span><br><div dir=
=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><=
div><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><di=
v dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=
=3D"ltr"><br style=3D"color:rgb(51,51,51);font-family:Roboto;font-size:13.2=
px"><br style=3D"color:rgb(51,51,51);font-family:Roboto"><table style=3D"bo=
rder-collapse:collapse;border-spacing:0px;color:rgb(51,51,51);font-family:R=
oboto"><tbody><tr><td colspan=3D"2" style=3D"padding:0px 0px 2px;border-wid=
th:0px 0px 1px;border-bottom-style:solid;border-bottom-color:rgb(0,182,217)=
;outline:none"><span style=3D"border-bottom:3px solid rgb(0,182,217);paddin=
g:0px 0px 2px"><span style=3D"font-family:arial;font-weight:bold">Soo-yeon =
=C2=A0Kang</span>=C2=A0=C2=A0</span></td></tr><tr><td valign=3D"top" style=
=3D"padding:7px 16px 0px 0px;border:0px;outline:none"></td><td valign=3D"to=
p" style=3D"padding:7px 0px 0px;border:0px;outline:none"><div style=3D"marg=
in:0px;padding:2px 0px 0px;border:0px;outline:none"><div style=3D"margin:0p=
x;padding:0px;border:0px;outline:none"><span style=3D"color:rgb(0,182,217);=
font-family:arial">Mobile:</span>=C2=A0<span style=3D"font-family:arial">+8=
2 10 - 4067 - 8539</span></div><div style=3D"margin:0px;padding:0px;border:=
0px;outline:none"><span style=3D"color:rgb(0,182,217);font-family:arial">E-=
mail:</span>=C2=A0<a href=3D"mailto:ksypassion@gmail.com" style=3D"outline:=
none;color:rgb(0,0,0);text-decoration:none;border:none;font-family:arial" t=
arget=3D"_blank">ksypassion@gmail.co</a>m</div></div></td></tr></tbody></ta=
ble><div style=3D"margin:0px;padding:0px;border-width:1px 0px 0px;border-to=
p-style:solid;border-top-color:rgb(208,208,208);outline:none;color:rgb(51,5=
1,51);font-family:arial;font-size:small"><br></div></div></div></div></div>=
</div></div></div></div></div></div></div></div></div></div></div>
</blockquote></div>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div=
 dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D=
"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br style=3D"color=
:rgb(51,51,51);font-family:Roboto;font-size:13.2px"><br style=3D"color:rgb(=
51,51,51);font-family:Roboto"><table style=3D"border-collapse:collapse;bord=
er-spacing:0px;color:rgb(51,51,51);font-family:Roboto"><tbody><tr><td colsp=
an=3D"2" style=3D"padding:0px 0px 2px;border-width:0px 0px 1px;border-botto=
m-style:solid;border-bottom-color:rgb(0,182,217);outline:none"><span style=
=3D"border-bottom:3px solid rgb(0,182,217);padding:0px 0px 2px"><span style=
=3D"font-family:arial;font-weight:bold">Soo-yeon =C2=A0Kang</span>=C2=A0=C2=
=A0</span></td></tr><tr><td valign=3D"top" style=3D"padding:7px 16px 0px 0p=
x;border:0px;outline:none"></td><td valign=3D"top" style=3D"padding:7px 0px=
 0px;border:0px;outline:none"><div style=3D"margin:0px;padding:2px 0px 0px;=
border:0px;outline:none"><div style=3D"margin:0px;padding:0px;border:0px;ou=
tline:none"><span style=3D"color:rgb(0,182,217);font-family:arial">Mobile:<=
/span>=C2=A0<span style=3D"font-family:arial">+82 10 - 4067 - 8539</span></=
div><div style=3D"margin:0px;padding:0px;border:0px;outline:none"><span sty=
le=3D"color:rgb(0,182,217);font-family:arial">E-mail:</span>=C2=A0<a href=
=3D"mailto:ksypassion@gmail.com" style=3D"outline:none;color:rgb(0,0,0);tex=
t-decoration:none;border:none;font-family:arial" target=3D"_blank">ksypassi=
on@gmail.co</a>m</div></div></td></tr></tbody></table><div style=3D"margin:=
0px;padding:0px;border-width:1px 0px 0px;border-top-style:solid;border-top-=
color:rgb(208,208,208);outline:none;color:rgb(51,51,51);font-family:arial;f=
ont-size:small"><br></div></div></div></div></div></div></div></div></div><=
/div></div></div></div></div></div>
</blockquote></div>

--0000000000000101940647d09857--

