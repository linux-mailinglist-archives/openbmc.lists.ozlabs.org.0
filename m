Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E915C633521
	for <lists+openbmc@lfdr.de>; Tue, 22 Nov 2022 07:13:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGYqM5WJSz3cLm
	for <lists+openbmc@lfdr.de>; Tue, 22 Nov 2022 17:13:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=jXmUXHHr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f31; helo=mail-qv1-xf31.google.com; envelope-from=wltu@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=jXmUXHHr;
	dkim-atps=neutral
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGYpk6w2rz2xmg
	for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2022 17:13:17 +1100 (AEDT)
Received: by mail-qv1-xf31.google.com with SMTP id d18so5995254qvs.6
        for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2022 22:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4UIfEFF1oP7CQHzwoO7jOGytDDuYUBcbghiP3WXQSOo=;
        b=jXmUXHHrYgNeRLoNw5+ppjrZOra78C5oWzOjk4yJACGLYstxnjF+QumBRuOEZRDdck
         brsyUyHlnyf57PK/0d7BwraQsrJS9V/nB6C4tr/n+fZWGWqTIN+8SUvCuy/UREaF9Cao
         f40f/sHbq0BnHmytWowpB9asTArl5mAb9s5Rvd13LCs7fCPg44AyY87d48QhltHoiBxh
         JarH7R37hh9/6hHflwc/1nArlDlE3STfBS01bWr4ILs6NPniDuh7GKzE5RSNn1beJuUT
         OpISdYbx8YtTeDMT0rijOVykAX+4A5rFYiohU2K2O9wjmoLM1jOj5OUpfgNpV9T8Dcz1
         Xjbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4UIfEFF1oP7CQHzwoO7jOGytDDuYUBcbghiP3WXQSOo=;
        b=I5uKpwmuwbCPxsSo6FrlSH6FBphWveybTvJny1uHKFKd6yxNwvgkRfqKGLUeNuDwsr
         cBMZ13W3r/L0UJCpoifeFbgwVD0GNEuC6fwAsz+vXKdKB5crqz8txPsUfo5V4HTdtbia
         WnLFiu8Pcx51h3kzs4HYTG6KWWOLO1Dx9iUOT48kfrsi0jFgcutqFOB9IIB1LSHta0oE
         8rjxkpBlOk7G/UNRl/RIrk3Sjw2YMlJw7rNbDGRU+NYuHIQ2A93MhlegtcJHba3XG9zc
         ldkuVl1UrvvlAZCNUw1xKVStlrZNJ3qhZ91G7QGnDguqjojiAXS0e/ehjcL7Remmd001
         3Brw==
X-Gm-Message-State: ANoB5pl2NzyaeZmQh6D+exmXD0ed91S+VnT6h10gVic9eIB4NtNH8ed/
	ZHGDVJZMihZqHtibC3FrcEZvYfeqfmufRzD1sHhLWA==
X-Google-Smtp-Source: AA0mqf7ZzSL2aAmYa23hMrws1jpgjUnLa0Eoku2DipKnhea4SknFAkhy0PoEobHdIdTO5M4gqGK2kTfxMOYcqsADTu4=
X-Received: by 2002:a05:6214:2b48:b0:4c6:82d7:5ea1 with SMTP id
 jy8-20020a0562142b4800b004c682d75ea1mr2057417qvb.79.1669097591198; Mon, 21
 Nov 2022 22:13:11 -0800 (PST)
MIME-Version: 1.0
References: <SJ0PR02MB8499B06E6933123E9765871FF70D9@SJ0PR02MB8499.namprd02.prod.outlook.com>
In-Reply-To: <SJ0PR02MB8499B06E6933123E9765871FF70D9@SJ0PR02MB8499.namprd02.prod.outlook.com>
From: Willy Tu <wltu@google.com>
Date: Mon, 21 Nov 2022 22:13:00 -0800
Message-ID: <CAHwn2X=K+GZsqWEzL1pFPvoq8B_ftMC5JJ0FnBHd9qAd+GiaEw@mail.gmail.com>
Subject: Re: CONFIG_SGPIO support in u-boot for AST2600
To: "Maheswara Kurapati (QUIC)" <quic_mkurapat@quicinc.com>
Content-Type: multipart/alternative; boundary="0000000000000528d705ee09111e"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000000528d705ee09111e
Content-Type: text/plain; charset="UTF-8"

Hi Maheswara,

Yeah, the main reason is that I didn't have an AST2600 system to test it
properly. I believe that I just lost track of the issue after a while. I
had a version for AST2400 in
https://lore.kernel.org/openbmc/20210413161150.2815450-1-wltu@google.com/,
but I also didn't have a system that builds it directly. Feel free to try
out that version and mod it to fit AST2600.

Willy Tu


On Mon, Nov 21, 2022 at 9:51 PM Maheswara Kurapati (QUIC) <
quic_mkurapat@quicinc.com> wrote:

> Hi all,
>
>
>
> While looking for SGPIO support in u-boot for AST2600, I came across the
> following patch discussed at
> https://lists.ozlabs.org/pipermail/openbmc/2021-April/025616.html.  Looks
> like that patch is never made to the branch v2019.4-aspeed-openbmc branch.
> Is it because it was not tested on AST2600? I can test the patch if that is
> the reason. Please let me know if anybody has more information.
>
>
>
> Thank you,
> Mahesh
>

--0000000000000528d705ee09111e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Maheswara,<br><br>Yeah, the main reason is that I didn&=
#39;t have an AST2600 system to test it properly. I believe that I just los=
t track of the issue after a while. I had a version for AST2400 in=C2=A0<a =
href=3D"https://lore.kernel.org/openbmc/20210413161150.2815450-1-wltu@googl=
e.com/">https://lore.kernel.org/openbmc/20210413161150.2815450-1-wltu@googl=
e.com/</a>, but I also didn&#39;t have a system that builds it directly. Fe=
el free to try out that version and mod it to fit AST2600.<br><div><br></di=
v><div>Willy Tu</div></div><br><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Mon, Nov 21, 2022 at 9:51 PM Maheswara Kurapati=
 (QUIC) &lt;<a href=3D"mailto:quic_mkurapat@quicinc.com">quic_mkurapat@quic=
inc.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div class=3D"msg880065414746738299">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"m_880065414746738299WordSection1">
<p class=3D"MsoNormal">Hi all, <u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">While looking for SGPIO support in u-boot for AST260=
0, I came across the following patch discussed at
<a href=3D"https://lists.ozlabs.org/pipermail/openbmc/2021-April/025616.htm=
l" target=3D"_blank">https://lists.ozlabs.org/pipermail/openbmc/2021-April/=
025616.html</a>.=C2=A0 Looks like that patch is never made to the branch v2=
019.4-aspeed-openbmc branch.=C2=A0 Is it because it was not tested
 on AST2600? I can test the patch if that is the reason. Please let me know=
 if anybody has more information.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Thank you, <br>
Mahesh <u></u><u></u></p>
</div>
</div>

</div></blockquote></div>

--0000000000000528d705ee09111e--
