Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D621DF793
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2019 23:44:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xqsF6cZMzDqKS
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 08:44:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::834;
 helo=mail-qt1-x834.google.com; envelope-from=emilyshaffer@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="np296v50"; 
 dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46xqrN0qm3zDqK9
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 08:43:15 +1100 (AEDT)
Received: by mail-qt1-x834.google.com with SMTP id u22so23496971qtq.13
 for <openbmc@lists.ozlabs.org>; Mon, 21 Oct 2019 14:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iyVEhRYwCi5Zcb2if/+F5T/oipMzPbnus+WfO7AOHLM=;
 b=np296v500Lv4+jraOTCWDcY986ZrPT5EolUo6M5dfYmbCWm/qlnmCfx6sHudMkMmyt
 Z7o+05nJFkcPdlnNAhr7oIomHjNPPPb5fgg6gqhwTQ7PearCU4+bgoW5YTcC9M9nS03e
 XOLReQin+/Fb0LKEV+C6l4KwD6VNO+7b39nc52+mp2qNQX1Tj+9UeQYR3HhnjxpSRUYk
 oMg/XFfAwBIaENvuSQw8tXQski60KqTqFgr4vunflMyqmYySn1ogvXVlw+o1mdRh7eM7
 Pq+69rIWtrOHKJH58cmO7ShAt3EeKO8sypgNmQFycQNeQ0xU9x/RfNhkC5mu5QzvdKKB
 PUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iyVEhRYwCi5Zcb2if/+F5T/oipMzPbnus+WfO7AOHLM=;
 b=szvzZ31AsmASnczTiip2uzyq5cQkysBvBzgsAy93O8a4LE//qoDOCUtBg3g9Sv4xW7
 OaOerNffIVHBJG2SPZZfILgE15zxRHBP+LRrrKpxtCTICnb+7rxp8Q1tB1EeEsC7TYbW
 cJuale+NrbaX24O9u8MzYyjEd4THLDX5i6WtOQoaOPzffXPQJ83yd90MDFhiQAYli15n
 ZWlYXxI/x/jl7Tme3HsDzqoKqBFKBGAU31/RY00RKhI0QfXHGH0hZtQi+m+Vgnw59NA4
 MqShvY8beMIlWZbKAXyxULuN+ydL0lmsDmroHjgiSsXTvmSACwGXD81xkXkiqnwXotQB
 ulnw==
X-Gm-Message-State: APjAAAU3NbzOyXqhiIjwALNW4PfK8MG9Z1LAK3zx7oUW1+ESEIVDP+M/
 GR95ca0FZrIE8MHT6X0KPQBR0pLqXIDA2fLJr445pA==
X-Google-Smtp-Source: APXvYqzKx0KZ2E6AIpCqO7SBLtzNAawjj3jymecytf43ReUfNA/CCg5Tbb0VSGAU7/Mqq3z0BZ3F5pf88YSV6uxeYps=
X-Received: by 2002:a0c:d610:: with SMTP id c16mr25348586qvj.229.1571694191082; 
 Mon, 21 Oct 2019 14:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <27c9e9df-6d1f-5fce-ed88-57d9cbfa71f9@intel.com>
 <CAO=notz3bML97-cS42Y9J2t-7eFdXpeMj0kBoCUeRBt8--wS1A@mail.gmail.com>
 <CADfYTpFti3aGjnWY4C7AYp64tWmMT_TSY3SGJgxJyhCjC-4KGw@mail.gmail.com>
In-Reply-To: <CADfYTpFti3aGjnWY4C7AYp64tWmMT_TSY3SGJgxJyhCjC-4KGw@mail.gmail.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Mon, 21 Oct 2019 14:42:58 -0700
Message-ID: <CAJoAoZ=8C1aEmn=nXqs17Qy4itqSNVrS5zJzDLRn_o2_gjbhfw@mail.gmail.com>
Subject: Re: It's been fun
To: Nancy Yuen <yuenn@google.com>
Content-Type: multipart/alternative; boundary="000000000000f50bde0595729168"
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
Cc: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed.tanous@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000f50bde0595729168
Content-Type: text/plain; charset="UTF-8"

Good luck on your next adventure Ed! It was great working with you.

Emily

On Mon, Oct 21, 2019, 1:50 PM Nancy Yuen <yuenn@google.com> wrote:

> Good luck Ed!
> ----------
> Nancy
>
>
> On Mon, Oct 21, 2019 at 1:41 PM Patrick Venture <venture@google.com>
> wrote:
>
>> On Mon, Oct 21, 2019 at 1:34 PM Ed Tanous <ed.tanous@intel.com> wrote:
>> >
>> > All,
>> >
>> > This week will be my last week at Intel.  I'll be moving onto something
>> > else non-OpenBMC related for a bit;  While I may check in on the project
>> > from time to time, it's going to stop being my day job.
>> >
>> > You'll still be able to reach me at my other email, ed@tanous.net, and
>> > several key people across the project including the TSC have my cell
>> > number if there's some unknown OpenBMC "emergency", but I doubt that's
>> > going to be needed.  Functionally, I've made sure that every repo I
>> > maintain has backup maintainers, so as of the 25th, it will fall to
>> > those individuals to do new reviews for those individual repos.  I'll be
>> > pushing updates to the MAINTAINERS files shortly to that effect.
>> >
>> > Thanks you for all the patches, ideas, reviews, and merges that others
>> > have done for me over the last couple years.
>>
>> It's been swell, good luck!
>>
>> >
>> > Until we meet again,
>> >
>> > -Ed
>>
>

--000000000000f50bde0595729168
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Good luck on your next adventure Ed! It was great working=
 with you.<div dir=3D"auto"><br></div><div dir=3D"auto">Emily</div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, =
Oct 21, 2019, 1:50 PM Nancy Yuen &lt;<a href=3D"mailto:yuenn@google.com">yu=
enn@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
dir=3D"ltr">Good luck Ed!<br clear=3D"all"><div><div dir=3D"ltr" data-smart=
mail=3D"gmail_signature">----------<br>Nancy</div></div><br></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 21,=
 2019 at 1:41 PM Patrick Venture &lt;<a href=3D"mailto:venture@google.com" =
target=3D"_blank" rel=3D"noreferrer">venture@google.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Oct 21, 2019=
 at 1:34 PM Ed Tanous &lt;<a href=3D"mailto:ed.tanous@intel.com" target=3D"=
_blank" rel=3D"noreferrer">ed.tanous@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; All,<br>
&gt;<br>
&gt; This week will be my last week at Intel.=C2=A0 I&#39;ll be moving onto=
 something<br>
&gt; else non-OpenBMC related for a bit;=C2=A0 While I may check in on the =
project<br>
&gt; from time to time, it&#39;s going to stop being my day job.<br>
&gt;<br>
&gt; You&#39;ll still be able to reach me at my other email, <a href=3D"mai=
lto:ed@tanous.net" target=3D"_blank" rel=3D"noreferrer">ed@tanous.net</a>, =
and<br>
&gt; several key people across the project including the TSC have my cell<b=
r>
&gt; number if there&#39;s some unknown OpenBMC &quot;emergency&quot;, but =
I doubt that&#39;s<br>
&gt; going to be needed.=C2=A0 Functionally, I&#39;ve made sure that every =
repo I<br>
&gt; maintain has backup maintainers, so as of the 25th, it will fall to<br=
>
&gt; those individuals to do new reviews for those individual repos.=C2=A0 =
I&#39;ll be<br>
&gt; pushing updates to the MAINTAINERS files shortly to that effect.<br>
&gt;<br>
&gt; Thanks you for all the patches, ideas, reviews, and merges that others=
<br>
&gt; have done for me over the last couple years.<br>
<br>
It&#39;s been swell, good luck!<br>
<br>
&gt;<br>
&gt; Until we meet again,<br>
&gt;<br>
&gt; -Ed<br>
</blockquote></div>
</blockquote></div>

--000000000000f50bde0595729168--
