Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B60A81C7990
	for <lists+openbmc@lfdr.de>; Wed,  6 May 2020 20:38:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HQMj3TzBzDqTv
	for <lists+openbmc@lfdr.de>; Thu,  7 May 2020 04:38:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::c33;
 helo=mail-oo1-xc33.google.com; envelope-from=ztai@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=qPToKcC3; dkim-atps=neutral
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49HPy34lZ0zDqTQ
 for <openbmc@lists.ozlabs.org>; Thu,  7 May 2020 04:19:39 +1000 (AEST)
Received: by mail-oo1-xc33.google.com with SMTP id e18so697386oot.9
 for <openbmc@lists.ozlabs.org>; Wed, 06 May 2020 11:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HUk8oqE7R7HkKapoukEtd13I4cv8dJDSQoCu5KZN9AI=;
 b=qPToKcC33g41HaEzbeMayINMocZB4Lw234QtI13+reiu/aEdb9uHDJOmTqGxoDWeNj
 c0fA0BQdRWFBHd5UwJC1UtS1jEZ+D/Ojl+TcUDkx6bDSjvfHY2ar9Zf6glFii+fwPMtl
 YlfJCZtLJpcWy/zZaYqwejFo08PYvQpnktsBK1PEupSFJaHGU7ehRQwVrtu5z5sTSMVd
 eduOW1dBZTQgV6pgTQjv04fN3grvZve5SUoKEEVMvv0ExkPD84Ran2UyiuO1V9Oya5I5
 I+CB/L4eKihyQpxd3nxdGkptNDCtbILXxszkZqbroRANgad3hxB+v4Z2DfROWkjOTZgi
 TVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HUk8oqE7R7HkKapoukEtd13I4cv8dJDSQoCu5KZN9AI=;
 b=ZHD+9pretIFg6jqSDWllwe1zjPoy/aZ2Rk+uzVomczAxCpCZkysUVnxrhGkL1QbCW+
 rzlB0NFBSQQubEgxpQrXs7xk8wDg416XUAN2gSO+yG6Todf5EULfkVzyFOjqJAFMGJ8E
 Sn07Anm2DaSgJEzO8rQZrgc8oxizcYfY6w6CczzsnefwDFzKari/cu5qdB0pxP9jNd3B
 FsSDf2xN4ELzXsiWjc+QCmrnOb7GxxwZAHmk0KPAYV2R353AtbFAh3nH2fy2t8J3JjDc
 kE+9d+iTlEwbXFGDWoySenTgSHWmjgG8m2xx81vGvNWH8A9gN7izYphQlWkX1hAVnJKs
 m20w==
X-Gm-Message-State: AGi0PuYfP+FoVzRhJ41pqb3mWxXu8YNUoAj7SlooTdyhk1E5t75zse2f
 mC3dyv5yDauCi4WiabesGyHXLmOZSUMHf2SHecnzUw==
X-Google-Smtp-Source: APiQypK7QywHH1L1Umno3ZzBqtMsifnaJkAPglcR6GZcjWuFn0DvpOXVy+11Uivj9qkIOv1kIOF+yJroaaPxvvBOiC0=
X-Received: by 2002:a4a:a5d0:: with SMTP id k16mr8348734oom.41.1588789175291; 
 Wed, 06 May 2020 11:19:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAMXw96Mnk8Hf4wAB_Ot=XEqp9yecspPfMGB6oF_LSgjRFMNHvw@mail.gmail.com>
 <CAB_SOc5tEo7xRg65aMfBOWyY_yXkb6+mLmRhf8hifNhHDWGVgQ@mail.gmail.com>
In-Reply-To: <CAB_SOc5tEo7xRg65aMfBOWyY_yXkb6+mLmRhf8hifNhHDWGVgQ@mail.gmail.com>
From: Zhenfei Tai <ztai@google.com>
Date: Wed, 6 May 2020 11:19:24 -0700
Message-ID: <CAMXw96NoWn+sZELD1Xd=WUyLwvOUZ9prKyqqaLFKiMwM6ChuMw@mail.gmail.com>
Subject: Re: [bmcweb] mTLS client authentication always succeeds
To: Zbyszek <zbigniewku@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000006b099105a4fece19"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000006b099105a4fece19
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zbyszek,

Thanks for your reply. I look forward to the official documentation.

The callback function returns true when preverified =3D=3D false. Not sure =
why
it should always return true, which accepts any client certificate.

// We always return true to allow full auth flow
if (!preverified)
{
BMCWEB_LOG_DEBUG << this << " TLS preverification failed.";
return true;
}

Thanks,
Zhenfei

On Wed, May 6, 2020 at 4:22 AM Zbyszek <zbigniewku@gmail.com> wrote:

> pt., 1 maj 2020 o 02:07 Zhenfei Tai <ztai@google.com> napisa=C5=82(a):
> >
> > Hi,
> >
> > I've been testing bmcweb mTLS for a while and found the user defined
> verify callback function returns true in all cases. (
> https://github.com/openbmc/bmcweb/blob/master/http/http_connection.h#L287=
)
> >
> > If client authentication is enabled in bmcweb, should it reject if
> client certificate is bad?
>
> No, purpose of this callback is to only extract the user name from the
> certificate and then allow to proceed with default OpenSSL
> verification flow which should finally fail if something is wrong with
> the certificate no matter what this function returned.
> The 'set_verify_callback' doesn't replace the whole verification
> procedure, it only adds a callback that is called when the default
> validator checks each certificate. The 'preverified' parameter, passed
> to it indicates if verification of the certificate succeeded or not.
> You should be able to see it in bmcweb logs.
>
> >
> > Thanks,
> > Zhenfei
>

--0000000000006b099105a4fece19
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Zbyszek,<div><br></div><div>Thanks for your reply. I lo=
ok forward to the official documentation.</div><div><br></div><div>The call=
back function returns true when preverified =3D=3D false. Not sure why it s=
hould always return true, which accepts any client certificate.</div><div><=
br></div><div><div style=3D"line-height:18px"><div style=3D"color:rgb(212,2=
12,212);font-family:Menlo,Monaco,&quot;Courier New&quot;,monospace;font-siz=
e:12px;white-space:pre;background-color:rgb(30,30,30)"><span style=3D"color=
:rgb(106,153,85)">            // We always return true to allow full auth f=
low</span></div><div style=3D"color:rgb(212,212,212);font-family:Menlo,Mona=
co,&quot;Courier New&quot;,monospace;font-size:12px;white-space:pre;backgro=
und-color:rgb(30,30,30)"><span style=3D"color:rgb(106,153,85)">            =
if (!preverified)</span></div><div style=3D"color:rgb(212,212,212);font-fam=
ily:Menlo,Monaco,&quot;Courier New&quot;,monospace;font-size:12px;white-spa=
ce:pre;background-color:rgb(30,30,30)"><span style=3D"color:rgb(106,153,85)=
">            {</span></div><div style=3D"color:rgb(212,212,212);font-famil=
y:Menlo,Monaco,&quot;Courier New&quot;,monospace;font-size:12px;white-space=
:pre;background-color:rgb(30,30,30)"><span style=3D"color:rgb(106,153,85)">=
                BMCWEB_LOG_DEBUG &lt;&lt; this &lt;&lt; &quot; TLS preverif=
ication failed.&quot;;</span></div><div style=3D"color:rgb(212,212,212);fon=
t-family:Menlo,Monaco,&quot;Courier New&quot;,monospace;font-size:12px;whit=
e-space:pre;background-color:rgb(30,30,30)"><span style=3D"color:rgb(106,15=
3,85)">                return true;</span></div><div style=3D"color:rgb(212=
,212,212);font-family:Menlo,Monaco,&quot;Courier New&quot;,monospace;font-s=
ize:12px;white-space:pre;background-color:rgb(30,30,30)"><span style=3D"col=
or:rgb(106,153,85)">            }</span></div><br>Thanks,<br>Zhenfei</div><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Wed, May 6, 2020 at 4:22 AM Zbyszek &lt;<a href=3D"mailto:zbigniewk=
u@gmail.com">zbigniewku@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">pt., 1 maj 2020 o 02:07 Zhenfei Tai &lt;<a=
 href=3D"mailto:ztai@google.com" target=3D"_blank">ztai@google.com</a>&gt; =
napisa=C5=82(a):<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; I&#39;ve been testing bmcweb mTLS for a while and found the user defin=
ed verify callback function returns true in all cases. (<a href=3D"https://=
github.com/openbmc/bmcweb/blob/master/http/http_connection.h#L287" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/openbmc/bmcweb/blob/master/=
http/http_connection.h#L287</a>)<br>
&gt;<br>
&gt; If client authentication is enabled in bmcweb, should it reject if cli=
ent certificate is bad?<br>
<br>
No, purpose of this callback is to only extract the user name from the<br>
certificate and then allow to proceed with default OpenSSL<br>
verification flow which should finally fail if something is wrong with<br>
the certificate no matter what this function returned.<br>
The &#39;set_verify_callback&#39; doesn&#39;t replace the whole verificatio=
n<br>
procedure, it only adds a callback that is called when the default<br>
validator checks each certificate. The &#39;preverified&#39; parameter, pas=
sed<br>
to it indicates if verification of the certificate succeeded or not.<br>
You should be able to see it in bmcweb logs.<br>
<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Zhenfei<br>
</blockquote></div>

--0000000000006b099105a4fece19--
