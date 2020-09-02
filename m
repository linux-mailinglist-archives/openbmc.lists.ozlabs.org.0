Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B5F25A4DA
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 07:12:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhBrV0s9jzDqPM
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 15:12:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::633;
 helo=mail-ej1-x633.google.com; envelope-from=asmithakarun@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=f/AhnyTv; dkim-atps=neutral
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhBnj2K1szDqkb
 for <openbmc@lists.ozlabs.org>; Wed,  2 Sep 2020 15:09:39 +1000 (AEST)
Received: by mail-ej1-x633.google.com with SMTP id a26so4823230ejc.2
 for <openbmc@lists.ozlabs.org>; Tue, 01 Sep 2020 22:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=iBY0Fh3YS/ZjW8ACNf3rhN7ALIKI0QcHPQpIrQ6WB8o=;
 b=f/AhnyTvHlI/qTsbwW+VhjdTQ7DmjrF2vF9d5WyLZs8HEcDBgBx45JWca15TiEnszi
 /wRjYMeqfS7acO+8bJpINQs1H+5in+l6hTb16EHfBBjOB31WhLj1zkapjuq/lABElQcZ
 1+AoapILfdBHY+/jNvKy+QYXQaQYa/aVZmIl6jDojlY1zCfAv87RDG7qQmMGpx1WjvxC
 pF3SrVI3nItoXBtMGFgZRVdHe+/TiOhiFkq8l7CkyNXA2adLSQkKvsTVzFeMlOKE5P0e
 6MwRESUNZc9ihs2yOm1yAgp1xRFY6ki97hg8hWMiU9Jx214eRyF0ngTAw3cNzHUAAAlP
 xvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=iBY0Fh3YS/ZjW8ACNf3rhN7ALIKI0QcHPQpIrQ6WB8o=;
 b=mrUDZZQUOHbZQP2qYAhLQ3LCrkzvED5oP5t9SkXd+JBISlxFQWmQ2T9t6Pxz1pmTU8
 el3IAwbuNi6dXIciMZ7DC4pIAmDRjDmrArcs3R0RUeaNsJFnX17q0ywwltDy3Phd97CB
 yjKHLQVTdFnTrp8pYTUVQ3FwvetHInI3qQiM7SbsVOqc99nTHA/PINsU+HMiu/2AKqO7
 0P4fvHpR8gYhGYYyoYqmoEHq0IFELNhlWCkPosoJYTSE7PRtzgkQcmFT+LleGeSQVLS9
 BWEmySGWCGIjIsluiBC84c3YwTsvZM4psIx6zyNYYgBszCZApAdKhsnQ9EPdkNhdABPE
 lkoQ==
X-Gm-Message-State: AOAM531TgprcrT+IJq0XOv58lQl4xZs0bOTKec97t1vTm9r1lIvrWLIo
 yWq9W31+k4zZqFY7wTQdEqoL8ULF7XODkYqkuyD3waJk/QJvVQ==
X-Google-Smtp-Source: ABdhPJympXmvsZl6owDLuJhBU7IVn20qINY9GMsNXJKe2Sw22YgrU8y1zyhgpaHyip34LG6IkhoCXmmXjRhOtVPUPSc=
X-Received: by 2002:a17:906:80d3:: with SMTP id
 a19mr4898368ejx.217.1599023373601; 
 Tue, 01 Sep 2020 22:09:33 -0700 (PDT)
MIME-Version: 1.0
From: Asmitha Karunanithi <asmithakarun@gmail.com>
Date: Wed, 2 Sep 2020 10:38:55 +0530
Message-ID: <CANGK-S5k=Dy+nf9cDPwNxcU_DELyaAkbmXjsotgpunQscaQ9Bw@mail.gmail.com>
Subject: Resolving service name conflicts
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000002bcfb305ae4da464"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000002bcfb305ae4da464
Content-Type: text/plain; charset="UTF-8"

Hi All,

Hope all are doing good.

When I was trying to do 'avahi-browse', I was able to see service name
conflicts (since the service with the same name would be published by
various clients in the network and I could see <servicename>#100, after
trying for 99 times).

To resolve this, the idea is to append the hostname of the client with the
service name (whenever the service is being published), given that the
hostname will always be unique in my case.

So, the service file would look like: (example.service)

<service-group>

       <name>example-hostname</name>

       <service>

               <type>...</type>

               <port>...</port>

       </service>

</service-group>


I just wanted to clarify if the above idea would be the right solution to
resolve the service name conflict or is there any other way that is
currently available to resolve this issue?

-- 
Thanks & Regards,
Asmitha Karunanithi

--0000000000002bcfb305ae4da464
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div><br></div><div>Hope all are doing good.</div><=
div><br>When I was trying to do &#39;avahi-browse&#39;, I was able to see s=
ervice name conflicts (since the service with the same name would be publis=
hed by various clients in the network and I could see &lt;servicename&gt;#1=
00, after trying for 99 times).</div><div><br></div><div>To resolve this, t=
he idea is to append the hostname of the client with the service name (when=
ever the service is being published), given that the hostname will always b=
e unique in my case.</div><div><br></div><div>So, the service file would lo=
ok like:<span style=3D"font-family:monospace">=C2=A0(example.service)</span=
></div><blockquote style=3D"margin:0px 0px 0px 40px;border:none;padding:0px=
"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><span style=3D"font-fam=
ily:monospace">&lt;service-group&gt;</span></blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><span style=3D"font-family:monospace">=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&lt;name&gt;example-hostname&lt;/nam=
e&gt;</span></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<span style=3D"font-family:monospace">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0&lt;service&gt;</span></blockquote><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><span style=3D"font-family:monospace">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&lt;ty=
pe&gt;...&lt;/type&gt;</span></blockquote><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><span style=3D"font-family:monospace">=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&lt=
;port&gt;...&lt;/port&gt;</span></blockquote><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><span style=3D"font-family:monospace">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0&lt;/service&gt;</span></blockquote><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><span style=3D"font-family:monospace"=
>&lt;/service-group&gt;</span></blockquote></blockquote><div><br></div><div=
>I just wanted to clarify if the above idea would be the right solution to =
resolve the service name conflict or is there any other way that is current=
ly available to resolve this=C2=A0issue?</div><div><br></div>-- <br><div di=
r=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div=
 dir=3D"ltr"><div><div dir=3D"ltr">Thanks &amp; Regards,<div>Asmitha Karuna=
nithi</div></div></div></div></div></div>

--0000000000002bcfb305ae4da464--
