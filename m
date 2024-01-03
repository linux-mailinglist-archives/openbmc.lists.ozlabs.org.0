Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A68CF822E0F
	for <lists+openbmc@lfdr.de>; Wed,  3 Jan 2024 14:12:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=j4HsyboF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T4qr82g2Pz3cZP
	for <lists+openbmc@lfdr.de>; Thu,  4 Jan 2024 00:12:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=j4HsyboF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=padathjayashankar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T4qqW2lqsz3cSC
	for <openbmc@lists.ozlabs.org>; Thu,  4 Jan 2024 00:11:33 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6daa822be30so658270b3a.0
        for <openbmc@lists.ozlabs.org>; Wed, 03 Jan 2024 05:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704287489; x=1704892289; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gl5b85pYW8H++YYsiVynFCXW+Hd1aNQCBTkf+NNHHOs=;
        b=j4HsyboFp21UjuCyXGNOpkEhJJD4ylGjuWCWaCDkTKZa82ykwKUWYr9VYwzWLXSNtn
         o8Z0rHvRzVix4B/durk3AXhY0WNHj/Jzbac+Go1WjOA1rnm1eu1e50ZNLU0PNi+KxzWX
         KBzrdqh+JhX6wcwu8uUiqXqJw6/t206+NP/b0UVhSppFI83RjqIsluXeF01nEgQMKpH/
         YSDJqQ2PTTJvPbAVVNYtnnphLSJVFOqGNnAtWY7dHLevjFndwT8ANqep/o2f47PK9PWS
         0DAdoAAXNWzZnEsQRSl3JSvmRNODTNwMpsejNrhDMpsbuG/WUXFtZiNtT8BmnwrvDKKt
         Z/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704287489; x=1704892289;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gl5b85pYW8H++YYsiVynFCXW+Hd1aNQCBTkf+NNHHOs=;
        b=SY5JSsMy02CTg8UGzunQDpZOj6m7SdLmEB3HR27UC9EytJ46Q8qKUXHWUgeLzamzUj
         FKj+857eJRLIFGCCTIqWpbT7MO/19QJX3Nes8wrsqIO2TlA2YfMEFUJgv0lE50tfhsIa
         9/CCW17TPRxVJqV7KA0WPcwNYZ2wU3HebR76Dh/vRXj9YDTecJhuFLrUdZyqaZ6Or4Uo
         Y6PeNq+kAaMpCe1/Xv9ZdVtTDO6JdkH7sH9u3y/PQEWxpnGet+AAfaccEXq3fnnqswn/
         fqRDfpENE6GXo+d27a8QGF6X8XC3mT3E45xkvzD2n5BnoVDER7DYds21emDBbTV/+4u4
         PTWg==
X-Gm-Message-State: AOJu0YxLJmwu9vgtOq/iTnfgCBGmEGFPl26OZ4avw6LMRtWbHDgbUoI5
	/wLD+jEPdti5Vb+U91DyHniQDwm/OgsLPslVyTI=
X-Google-Smtp-Source: AGHT+IFQhI8Rl8apYG90tomX9px2xv2OzlNpVqnwhjHlqmApxa7utIXr4FTEXRVklpnTcx8GnNh2/wjhnpvlsQbDMGA=
X-Received: by 2002:a05:6a00:13a1:b0:6d9:98ea:e8ad with SMTP id
 t33-20020a056a0013a100b006d998eae8admr10097521pfg.47.1704287488784; Wed, 03
 Jan 2024 05:11:28 -0800 (PST)
MIME-Version: 1.0
References: <CAFRDoiwOqE96Pxw9QVE7B2j_JnBbsvaEa38H5_=DVch8Xo8P9Q@mail.gmail.com>
 <ZZQBRhzMCiI3SC-Q@heinlein.vulture-banana.ts.net> <CAFRDoixW1aUVACo84wtGcmo09cgN9NieifB4uv-kWuxmBC2qsg@mail.gmail.com>
 <ZZVPt0JXDXxEX7pB@heinlein.vulture-banana.ts.net>
In-Reply-To: <ZZVPt0JXDXxEX7pB@heinlein.vulture-banana.ts.net>
From: Jayashankar Padath <padathjayashankar@gmail.com>
Date: Wed, 3 Jan 2024 18:41:17 +0530
Message-ID: <CAFRDoixfn0C8+AKRqG+9o281pdgQNQHOBjvU8aigOnX4yk6bTw@mail.gmail.com>
Subject: Re: Question on passing username and password credentials through PLDM
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="0000000000005d3e27060e0a5a51"
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

--0000000000005d3e27060e0a5a51
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Okay I was basically mentioning about the communication between the host
and the BMC. So in reality, a graphics adapter would be assigned to a
partition, where PFW (Platform firmware) can display the SMS ( System
Management Services) menus for some specific operations. Since PFW does not
have the authentication mechanism, it's done by BMC with the help of PAM
module according to the specific role of the user.

Thanks and Best Regards,
Jayashankar

On Wed, Jan 3, 2024 at 5:44=E2=80=AFPM Patrick Williams <patrick@stwcx.xyz>=
 wrote:

> On Wed, Jan 03, 2024 at 03:18:41PM +0530, Jayashankar Padath wrote:
> > Hello Patrick,
> >
> > Thanks for your suggestion. From the host side they wanted  to attach a
> > graphics adapter so that some of the system management service operatio=
ns
> > could be carried out.
>
> I'm not understanding the relationship between a graphics adapter on the
> host and authentication on the BMC over PLDM.
>
> Are you aware that the Aspeed chip already has a graphics engine that
> can be connected to the host?  OpenBMC already supports exposing that
> graphics adapter as a KVM over the webui.
>
> If you're suggesting a graphics adapter that the BMC itself uses, there
> is currently no support for doing that.
>
> > As you suggested we would consider the way, other external interface
> > programs like bmcweb which support similar functionalities.
> >
> > Thanks and Best Regards,
> > Jayashankar
> >
>
> --
> Patrick Williams
>

--0000000000005d3e27060e0a5a51
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Okay I was basically mentioning about the communication be=
tween the host and the BMC. So in reality, a graphics adapter would be assi=
gned to a partition, where PFW (Platform firmware) can display the SMS ( Sy=
stem Management Services) menus for some specific operations. Since PFW doe=
s not have the authentication mechanism, it&#39;s done by BMC with the help=
 of PAM module according to the specific role of the user.<br><div><br></di=
v><div>Thanks and Best Regards,</div><div>Jayashankar</div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 3, 2=
024 at 5:44=E2=80=AFPM Patrick Williams &lt;<a href=3D"mailto:patrick@stwcx=
.xyz">patrick@stwcx.xyz</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On Wed, Jan 03, 2024 at 03:18:41PM +0530, Jayashanka=
r Padath wrote:<br>
&gt; Hello Patrick,<br>
&gt; <br>
&gt; Thanks for your suggestion. From the host side they wanted=C2=A0 to at=
tach a<br>
&gt; graphics adapter so that some of the system management service operati=
ons<br>
&gt; could be carried out.<br>
<br>
I&#39;m not understanding the relationship between a graphics adapter on th=
e<br>
host and authentication on the BMC over PLDM.<br>
<br>
Are you aware that the Aspeed chip already has a graphics engine that<br>
can be connected to the host?=C2=A0 OpenBMC already supports exposing that<=
br>
graphics adapter as a KVM over the webui.<br>
<br>
If you&#39;re suggesting a graphics adapter that the BMC itself uses, there=
<br>
is currently no support for doing that.<br>
<br>
&gt; As you suggested we would consider the way, other external interface<b=
r>
&gt; programs like bmcweb which support similar functionalities.<br>
&gt; <br>
&gt; Thanks and Best Regards,<br>
&gt; Jayashankar<br>
&gt; <br>
<br>
-- <br>
Patrick Williams<br>
</blockquote></div>

--0000000000005d3e27060e0a5a51--
