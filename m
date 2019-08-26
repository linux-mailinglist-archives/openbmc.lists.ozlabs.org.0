Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F29FC9CBDA
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2019 10:45:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46H5DQ2wvpzDqbv
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2019 18:45:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com;
 envelope-from=bluecmd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="qlIoYQXv"; 
 dkim-atps=neutral
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46H5Cl5lcpzDqYX
 for <openbmc@lists.ozlabs.org>; Mon, 26 Aug 2019 18:44:27 +1000 (AEST)
Received: by mail-ot1-x334.google.com with SMTP id c34so14450324otb.7
 for <openbmc@lists.ozlabs.org>; Mon, 26 Aug 2019 01:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xH4SQPmHIldwFl4oVDFii3oywsTMaenGbn8I9jLNr1k=;
 b=qlIoYQXvUhf/IpSlzJeL1a+/NynaXsDqQ8u6BbKriNW/Q0Onh93FQkuDbpQ6D71xig
 ZimQ76sfU2qDNHtlOGHii5wkEeQldF+o4wJFyGdQz60x+74g3UjWQSuTDwUdg76W+Bnz
 hjD0VTRtFipHGOCiY+wQTj1z1tk7hAlJ3k1xE4hKYeWUwkm1kg1nBOC0BwIx/6ehPYr6
 c4Q6WANAwDdNhzMTmL2Gl1mjhbI8BVHWusOnuKKMH7jJW6k3xdFI/SuTpPZdZjsWqySc
 21tLyNSUM4KImZsN2q/mbykJ9QHASempVW3yFjdbhNKhdHnJNWf4o8i/nnQSfZw4VZey
 1yCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xH4SQPmHIldwFl4oVDFii3oywsTMaenGbn8I9jLNr1k=;
 b=iH1ZJxp2B+Ly8HkVvmJ72f7EEZkbREF8lriyHA8OQa7M2WuupKzV9AkO9khF+GT9vD
 gXB+nMaZ/eBTVV9yOXitxRq3yi94NL/CM46EKvR2ESYPzomOVVBClWmGfNVOT7dA823T
 sRtS2LXS7tVSfY8Ptd/9KsWDLLGt1YvEZSsUplt+a9uOYQ9Kt3evDiKHVbj7uDII7uw3
 5mRPMIf0JdXfzWdAoy53scWWK15CSJ9FvUuY/XHdZW6L4m8Tl7255xR/1GLdD7BgF5+g
 CXqHKnmZ+LF5Bl1S8SQ8/9HjoiBXs7rq3TThgoBoHuL0MI57b3xeFS7915XhIxSU/e/G
 t3LA==
X-Gm-Message-State: APjAAAWr5A9lojNSn26gTXSFfzLCYygoBraXSDOCU2Ohh+wSKZM5iJJ8
 hoAu2TTK4GcvkxSzSZM/upgmCJo65Jv4ihS4bQ1yZA==
X-Google-Smtp-Source: APXvYqwyrj0EMI2+WjJJu9RY7cukdL5gFDz3i39iGa9P5UyEjDW02EnD0900LuHM5aXVZ5hQZyTXb0Ol8mZfyRP0Sy4=
X-Received: by 2002:a9d:741a:: with SMTP id n26mr14865952otk.198.1566809064174; 
 Mon, 26 Aug 2019 01:44:24 -0700 (PDT)
MIME-Version: 1.0
References: <MN2PR04MB5839D33826EF08A499E32167CDA80@MN2PR04MB5839.namprd04.prod.outlook.com>
 <CADy_Pt3tvAci8tXuZ3cTJY3tRxwnWPbD=yNL05VEYrjZKWcpEw@mail.gmail.com>
 <BYAPR21MB1191A89B2C012758241C5C72C8A80@BYAPR21MB1191.namprd21.prod.outlook.com>
In-Reply-To: <BYAPR21MB1191A89B2C012758241C5C72C8A80@BYAPR21MB1191.namprd21.prod.outlook.com>
From: Christian Svensson <bluecmd@google.com>
Date: Mon, 26 Aug 2019 10:44:13 +0200
Message-ID: <CAEfeXvbYEA-5Hg=1Zs=Di=3HyNOpoSdM51GjSLwuiX01yHg2-w@mail.gmail.com>
Subject: Re: Socflash says the bmc is write protected.
To: Neeraj Ladkani <neladk@microsoft.com>
Content-Type: multipart/alternative; boundary="000000000000b3c9dd059101293b"
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
Cc: James Mihm <james.mihm@gmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Zheng Bao <fishbaoz@hotmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000b3c9dd059101293b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Which type of reset are you referring to?

- Chris


On Mon, Aug 19, 2019 at 10:40 PM Neeraj Ladkani <neladk@microsoft.com>
wrote:

> Can anyone confirms if these locks persists during BMC reset?
>
>
>
> Neeraj
>
>
>
>
>
> *From:* openbmc <openbmc-bounces+neladk=3Dmicrosoft.com@lists.ozlabs.org>=
 *On
> Behalf Of *James Mihm
> *Sent:* Monday, August 19, 2019 7:26 AM
> *To:* Zheng Bao <fishbaoz@hotmail.com>
> *Cc:* openbmc@lists.ozlabs.org
> *Subject:* Re: Socflash says the bmc is write protected.
>
>
>
> The P2A Bridge that is used by the socflash utility has been disabled;
> see  https://nvd.nist.gov/vuln/detail/CVE-2019-6260
> <https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fnvd.=
nist.gov%2Fvuln%2Fdetail%2FCVE-2019-6260&data=3D02%7C01%7Cneladk%40microsof=
t.com%7C745cbb7bf95a416e39e808d724b2476e%7C72f988bf86f141af91ab2d7cd011db47=
%7C1%7C0%7C637018220436896615&sdata=3DZJb%2Bx8BQmenKs6K%2FV26iypu9JrMor1d4u=
liQJGe1YIk%3D&reserved=3D0> for
> details.
>
>
>
> On Mon, Aug 19, 2019 at 5:51 AM Zheng Bao <fishbaoz@hotmail.com> wrote:
>
> Hi, All,
>
> I use socflash to update the BMC firmware. The original BMC firmware can
> be updated, but openbmc can not be.
>
> Socflash says the BMC is protected. Does anybody know why?
>
>
>
> Thanks.
>
> Joe
>
>

--000000000000b3c9dd059101293b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Which type of reset are you=C2=A0referring to?</div><=
div><br></div><div><div><div dir=3D"ltr" class=3D"gmail_signature" data-sma=
rtmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">- Chris</=
div></div></div></div></div><br></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 19, 2019 at 10:40 PM Neer=
aj Ladkani &lt;<a href=3D"mailto:neladk@microsoft.com">neladk@microsoft.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_-2281531028638673056WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">Can anyone confir=
ms if these locks persists during BMC reset?
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)"><u></u>=C2=A0<u><=
/u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">Neeraj<u></u><u><=
/u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)"><u></u>=C2=A0<u><=
/u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)"><u></u>=C2=A0<u><=
/u></span></p>
<p class=3D"MsoNormal"><b>From:</b> openbmc &lt;openbmc-bounces+neladk=3D<a=
 href=3D"mailto:microsoft.com@lists.ozlabs.org" target=3D"_blank">microsoft=
.com@lists.ozlabs.org</a>&gt;
<b>On Behalf Of </b>James Mihm<br>
<b>Sent:</b> Monday, August 19, 2019 7:26 AM<br>
<b>To:</b> Zheng Bao &lt;<a href=3D"mailto:fishbaoz@hotmail.com" target=3D"=
_blank">fishbaoz@hotmail.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">op=
enbmc@lists.ozlabs.org</a><br>
<b>Subject:</b> Re: Socflash says the bmc is write protected.<u></u><u></u>=
</p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">The P2A Bridge that is used by the socflash utility =
has been disabled; see=C2=A0
<a href=3D"https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fnvd.nist.gov%2Fvuln%2Fdetail%2FCVE-2019-6260&amp;data=3D02%7C01%7Cnelad=
k%40microsoft.com%7C745cbb7bf95a416e39e808d724b2476e%7C72f988bf86f141af91ab=
2d7cd011db47%7C1%7C0%7C637018220436896615&amp;sdata=3DZJb%2Bx8BQmenKs6K%2FV=
26iypu9JrMor1d4uliQJGe1YIk%3D&amp;reserved=3D0" target=3D"_blank">
https://nvd.nist.gov/vuln/detail/CVE-2019-6260</a>=C2=A0for details.<u></u>=
<u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Mon, Aug 19, 2019 at 5:51 AM Zheng Bao &lt;<a hre=
f=3D"mailto:fishbaoz@hotmail.com" target=3D"_blank">fishbaoz@hotmail.com</a=
>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin-left:4=
.8pt;margin-right:0in">
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt;color:black">Hi, All,<=
u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt;color:black">I use soc=
flash to update the BMC firmware. The original BMC firmware can be updated,=
 but openbmc can not be.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt;color:black">Socflash =
says the BMC is protected. Does anybody know why?<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt;color:black"><u></u>=
=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt;color:black">Thanks. <=
u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt;color:black">Joe<u></u=
><u></u></span></p>
</div>
</div>
</blockquote>
</div>
</div>
</div>

</blockquote></div>

--000000000000b3c9dd059101293b--
