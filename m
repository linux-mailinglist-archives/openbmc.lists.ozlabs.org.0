Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DBD5314ED
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 18:27:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6N5n15Nxz3bkH
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 02:27:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=QL0q4+kI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42c;
 helo=mail-wr1-x42c.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=QL0q4+kI; dkim-atps=neutral
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6N5L0tyZz2yjS
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 02:27:01 +1000 (AEST)
Received: by mail-wr1-x42c.google.com with SMTP id s28so22007127wrb.7
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2022 09:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0asBrYA9ctBdXkaje+nSFyQCgQjZuuLaTWK7+UcSVxc=;
 b=QL0q4+kIksWVN1wWhbRrjTK+PMq+iAtPK1isnQ7CxfFF3lKtsD4fxfBXMMjfwTbSvF
 iC9WOAlVkc6K4p8oP9XQzbdNZhiWkJqaEreOzneXwo2qU2XAK4w7SzXfYqYIEob0MVlS
 94G4cGGhvyVnjn3U5UoNMtr6V/kzqAcqfSlJR4E1sK4CXwoZBrMgGnfDEYi1DBuxmsfh
 0QIk7nuHOs2eYkpMYoKra5Td7e2zG5hT2CiVnFDyKvwlamOC0z2QjUuKi5G7WNiDXyA3
 HbxTER5gQ1AijCprD2K9hxx03vgPDd6fEY9ptQmAv/O6NmiBNOSmbBgDRSZqWsKuKUv+
 gZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0asBrYA9ctBdXkaje+nSFyQCgQjZuuLaTWK7+UcSVxc=;
 b=mL/D/5DhdmwxMp0du4+2am8XdVyjaT7DcsWuda0O1zCINR0DdB6nJtqa+t5j201yCD
 UPIcv5OL+BzA0lL3kxKDwGf1uCdd181eYST0ES4K0qGRY9LE13A4uaheltlKyTQkws4W
 qzN6zDj3loEbIE7vbd+vQB5Z2RRN4OH7kg8Q6nErRHhDxTA0FBdmmIrzgIEBgIDBmRjr
 nJS50XD3IGnjySVzHBxVmCJ189QL550YUpCmIPa7jk6VMAQWc4LEhRT3Wj2ZwAzWVil4
 jBNcU65mBmfWVJRZ4elY49swoJGec8Jwjv6/+ANETnpTSdZuja8SNKcBzoprqFuLTf+Z
 a78Q==
X-Gm-Message-State: AOAM531j1JZfXqhHk6J/Q5O/89cNi8iDt4Fn5xQysgoywzcYrWaXBMtx
 Jf7vS2DRHHWLdhx1Bly3OyBdhsMsGB3rslwJNqPxMw==
X-Google-Smtp-Source: ABdhPJxdl3YL52RMe8mrdnxaKlPg9BVoLh0QUb7A79yJLLXPvghFGT8lzqpM3XjTBX56EeYiPIuOr3qry3nfSC7t6Ak=
X-Received: by 2002:adf:fa81:0:b0:20e:69df:5f06 with SMTP id
 h1-20020adffa81000000b0020e69df5f06mr19212018wrr.188.1653323214383; Mon, 23
 May 2022 09:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm54UHU9s0bTq-AR9tJunoX2Wa9tQ0PH_zWJ2QrYdR3SRqcvg@mail.gmail.com>
 <YogEf3WTYNBnBvP1@heinlein.stwcx.org.github.beta.tailscale.net>
In-Reply-To: <YogEf3WTYNBnBvP1@heinlein.stwcx.org.github.beta.tailscale.net>
From: Ed Tanous <edtanous@google.com>
Date: Mon, 23 May 2022 09:26:43 -0700
Message-ID: <CAH2-KxDXXPL7_qx9yzcwT55_EeeTp=VKaK771L=VX4gTpj6txw@mail.gmail.com>
Subject: Re: The incomplete result of mapper GetSubTree/Paths
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="000000000000e528b205dfb04e1e"
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Lei Yu <yulei.sh@bytedance.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000e528b205dfb04e1e
Content-Type: text/plain; charset="UTF-8"

On Fri, May 20, 2022 at 2:13 PM Patrick Williams <patrick@stwcx.xyz> wrote:

> On Fri, May 20, 2022 at 11:14:15AM +0800, Lei Yu wrote:
>
> > If mapper could not guarantee the stable result, the service calling
> > mapper will have to add more complex logic to make sure it gets the
> > "full and correct" result.
>
> The issue here is around causality.  There really isn't any way to
> correctly kick this logic out to applications no matter how complex you
> make the implementation.
>
> The original mapper implementation was causally ordered but this was
> lost in the conversion to C/C++.  We should look at getting back to
> having mapper give causal order guarantees.
>

I'm not really following what causality has to do with it in Leis case.
From my read, it looks like this is a case of "introspect takes some time
to complete, and the results for one daemon aren't expected to be added
atomically".  This exact same race is present any time an object is added
or removed from dbus, so you're right, there isn't really a way to avoid
it, aside from writing implementations that don't fail if the object count
on a connection doesn't match what the mapper gave you, which is something
we "learned" in bmcweb a long time ago.

One workaround here to cover the startup case would be to simply batch
together all objects for a given daemon in the InProgressIntrospect object
such that all of a daemons dbus paths are added to the global object
atomically, so we'd avoid the race in the startup case, but it would still
exist when new objects are created, so it doesn't completely solve the
problem, just solves it for the case above.


>
> --
> Patrick Williams
>

--000000000000e528b205dfb04e1e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 20, 2022 at 2:13 PM Patri=
ck Williams &lt;<a href=3D"mailto:patrick@stwcx.xyz">patrick@stwcx.xyz</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fr=
i, May 20, 2022 at 11:14:15AM +0800, Lei Yu wrote:<br>
<br>
&gt; If mapper could not guarantee the stable result, the service calling<b=
r>
&gt; mapper will have to add more complex logic to make sure it gets the<br=
>
&gt; &quot;full and correct&quot; result.<br>
<br>
The issue here is around causality.=C2=A0 There really isn&#39;t any way to=
<br>
correctly kick this logic out to applications no matter how complex you<br>
make the implementation.<br>
<br>
The original mapper implementation was causally ordered but this was<br>
lost in the conversion to C/C++.=C2=A0 We should look at getting back to<br=
>
having mapper give causal order guarantees.<br></blockquote><div><br></div>=
<div>I&#39;m not really following what causality has to do with it in Leis =
case.=C2=A0 From my read, it=C2=A0looks like this is a case of &quot;intros=
pect takes some time to complete, and the results for one daemon aren&#39;t=
 expected to be added atomically&quot;.=C2=A0 This exact same race is prese=
nt any time an object is added or removed from dbus, so you&#39;re right, t=
here isn&#39;t really a way to avoid it, aside from writing implementations=
 that don&#39;t fail if the object count on a connection doesn&#39;t match =
what the mapper gave you, which is something we &quot;learned&quot; in bmcw=
eb a long time ago.</div><div><br></div><div>One workaround here to cover t=
he startup case would be to simply batch together all objects for a given d=
aemon in the InProgressIntrospect object such that all of a=C2=A0daemons db=
us paths are added to the global object atomically, so we&#39;d avoid the r=
ace in the startup case, but it would still exist when new objects are crea=
ted, so it doesn&#39;t completely solve the problem, just solves it for the=
 case above.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
-- <br>
Patrick Williams<br>
</blockquote></div></div>

--000000000000e528b205dfb04e1e--
