Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2B457AA4E
	for <lists+openbmc@lfdr.de>; Wed, 20 Jul 2022 01:12:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnZNp0LTjz3c2g
	for <lists+openbmc@lfdr.de>; Wed, 20 Jul 2022 09:12:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=S5iydgL4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=truongmd@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=S5iydgL4;
	dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LnZNQ09TVz2xXS
	for <openbmc@lists.ozlabs.org>; Wed, 20 Jul 2022 09:12:04 +1000 (AEST)
Received: by mail-lf1-x130.google.com with SMTP id y11so27437889lfs.6
        for <openbmc@lists.ozlabs.org>; Tue, 19 Jul 2022 16:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n26Vn0rV0lWfpIUCRTcSjH+cNiic7E5Yn/oOOhvoras=;
        b=S5iydgL4ANPVERIvd5aJjWbw6OEQZmsQ5D9/UUXJkdgutxxVW8DlamjHKck5U0MT+1
         YScVYT2TP2pIDsO9cvEpiM8mvidDROa23yecQih6HE8T903iTLbqjYPqNfH2hONecdSU
         gA2SDdh7L+huSbRsZ8xr0IbFYCyTzgky46lhsDTAlp5ybArGSXeXBoxYeAwzoCwMaIPT
         J2f2hRii40U1NXMLf3AAV/e7EYuX9HyZ1sRtx/HqZeBdpponXuj5rLNVhSu7XOO5WrVL
         l/TbBPv8dr1iWZrojl/tBVfV6zRC/5eRK+SnlTF8KLcCTPmEfoSW/6nIcMob4leN0s5E
         IU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n26Vn0rV0lWfpIUCRTcSjH+cNiic7E5Yn/oOOhvoras=;
        b=4RQFIilAMo3V7v3/AuaFQcm0SjXjagVPrkNNyswuCDnm3EZvla3VyJGJeZranUBZ9C
         mtMw0/NJdRzdSOtJiCApmT4qiVNAzE0Uu66f27znwc+2n993UgUhyl4XfalKHqdZTSLr
         PaU/VNsMyjBA3XmkEfyqcepkHisDMXowU9fS92149KfsoFzu73zptAuZFeML5KeHt6Z+
         KjYTaBeLYQ1u826ORFcIBNSanC9ZpH/4+oPZDein6GUWkX1mw9drho9kIyqIujEmMn1v
         jtabQOjKViRnrebXGhqY6qmuvuSUCJJMOeAenfHDfU7YNQzwnwC0NcMuOl6EUSea1LLK
         liyA==
X-Gm-Message-State: AJIora+O5zurGOCJurgzOGIY1AhWC8ikPMeUBYLy+sTGpvY0boLI0TPp
	nmIBcfWknM7iJEvSaMXDHfmp9JHHQEynvxJgEXM=
X-Google-Smtp-Source: AGRyM1vCJtsO/Go45D6+vRwocl+jCjOzAUNxTlJMkKVbvbXjQraJJNqmx1kI0eXjgdeBBX6o1Gbs7Wl2+VW36996Ae0=
X-Received: by 2002:a05:6512:1153:b0:48a:201d:5f77 with SMTP id
 m19-20020a056512115300b0048a201d5f77mr12638537lfg.280.1658272317914; Tue, 19
 Jul 2022 16:11:57 -0700 (PDT)
MIME-Version: 1.0
References: <YtcdwFSsS2vsWVoU@heinlein.stwcx.org.github.beta.tailscale.net>
In-Reply-To: <YtcdwFSsS2vsWVoU@heinlein.stwcx.org.github.beta.tailscale.net>
From: "M. D. Truong" <truongmd@gmail.com>
Date: Tue, 19 Jul 2022 16:11:45 -0700
Message-ID: <CAEx7e2RMyyq0X2hFCuqq0dPFFm=ndKi7G2ozAY54q=VNCfuQCg@mail.gmail.com>
Subject: Re: 2022H2 TOF Elections
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="0000000000007342f305e4309cd3"
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000007342f305e4309cd3
Content-Type: text/plain; charset="UTF-8"

Hi Patrick, all,

I'd like to nominate Zev Weiss to join the TOF.


Cheers,
My

On Tue, Jul 19, 2022 at 2:11 PM Patrick Williams <patrick@stwcx.xyz> wrote:

> Hello Developers,
>
> Since we are into July, the 2nd half TOF cycle starts.  See this
> document for a reminder on the process:
>
>
> https://github.com/openbmc/docs/blob/master/tof/membership-and-voting.md#terms-and-elections
>
> There are 3 important points:
>
>    1. The current TOF publishes a list of eligible developers for the
>       next TOF election (that is the primary purpose of this email).
>
>    2. Nominations are open for TOF members and run through the end of
>       July.
>
>    3. The election, if necessary, is to begin September 1st.
>
> Now for the details...
>
> ## Eligible developers.
>
> Contributions made from January through June qualified for this TOF
> cycle.  We have 82 developers [currently] qualified for voting in this
> cycle and they are listed here:
>
>     https://github.com/openbmc/tof-election/blob/main/2022H2/rollcall.json
>
> Anyone who feels they made contributions to the project which did not
> show up in our metrics may request to be added to this roll-call by
> opening an issue by July 31st to the current TOF at:
>
>     https://github.com/openbmc/technical-oversight-forum/issues
>
> ## Nominations for TOF membership
>
> We currently have 2 TOF members who's term is completed and 1 open seat,
> for a total of 3 seats available during this cycle.  Nominations, either
> self-nominations or of others, should be sent to the mailing list by
> July 31st.  Remember that only those qualified to vote may be nominated,
> but anyone may nominate someone from the roll-call list.
>
> Brad and Ed are the two members who will have their term concluded and
> the open seat is due to a resignation.  If we have 3 or less developers
> nominated for the TOF then the election will not be necessary.
>
> --
> Patrick Williams
>

--0000000000007342f305e4309cd3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Patrick, all,<div><br></div><div>I&#39;d like to nomina=
te Zev Weiss to join the TOF.</div><div><br></div><div><br></div><div>Cheer=
s,</div><div>My</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Jul 19, 2022 at 2:11 PM Patrick Williams &lt;<=
a href=3D"mailto:patrick@stwcx.xyz">patrick@stwcx.xyz</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Developers,<br>
<br>
Since we are into July, the 2nd half TOF cycle starts.=C2=A0 See this<br>
document for a reminder on the process:<br>
<br>
=C2=A0 =C2=A0<a href=3D"https://github.com/openbmc/docs/blob/master/tof/mem=
bership-and-voting.md#terms-and-elections" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/openbmc/docs/blob/master/tof/membership-and-voting.=
md#terms-and-elections</a><br>
<br>
There are 3 important points:<br>
<br>
=C2=A0 =C2=A01. The current TOF publishes a list of eligible developers for=
 the<br>
=C2=A0 =C2=A0 =C2=A0 next TOF election (that is the primary purpose of this=
 email).<br>
<br>
=C2=A0 =C2=A02. Nominations are open for TOF members and run through the en=
d of<br>
=C2=A0 =C2=A0 =C2=A0 July.<br>
<br>
=C2=A0 =C2=A03. The election, if necessary, is to begin September 1st.<br>
<br>
Now for the details...<br>
<br>
## Eligible developers.<br>
<br>
Contributions made from January through June qualified for this TOF<br>
cycle.=C2=A0 We have 82 developers [currently] qualified for voting in this=
<br>
cycle and they are listed here:<br>
<br>
=C2=A0 =C2=A0 <a href=3D"https://github.com/openbmc/tof-election/blob/main/=
2022H2/rollcall.json" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/openbmc/tof-election/blob/main/2022H2/rollcall.json</a><br>
<br>
Anyone who feels they made contributions to the project which did not<br>
show up in our metrics may request to be added to this roll-call by<br>
opening an issue by July 31st to the current TOF at:<br>
<br>
=C2=A0 =C2=A0 <a href=3D"https://github.com/openbmc/technical-oversight-for=
um/issues" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/=
technical-oversight-forum/issues</a><br>
<br>
## Nominations for TOF membership<br>
<br>
We currently have 2 TOF members who&#39;s term is completed and 1 open seat=
,<br>
for a total of 3 seats available during this cycle.=C2=A0 Nominations, eith=
er<br>
self-nominations or of others, should be sent to the mailing list by<br>
July 31st.=C2=A0 Remember that only those qualified to vote may be nominate=
d,<br>
but anyone may nominate someone from the roll-call list.<br>
<br>
Brad and Ed are the two members who will have their term concluded and<br>
the open seat is due to a resignation.=C2=A0 If we have 3 or less developer=
s<br>
nominated for the TOF then the election will not be necessary.<br>
<br>
-- <br>
Patrick Williams<br>
</blockquote></div>

--0000000000007342f305e4309cd3--
