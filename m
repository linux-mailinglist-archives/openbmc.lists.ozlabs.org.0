Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC52F7E840A
	for <lists+openbmc@lfdr.de>; Fri, 10 Nov 2023 21:39:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=N/revp6O;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRrJz31GMz3cVX
	for <lists+openbmc@lfdr.de>; Sat, 11 Nov 2023 07:39:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=N/revp6O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2e; helo=mail-oa1-x2e.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SRrJM3Hf9z3c2K
	for <openbmc@lists.ozlabs.org>; Sat, 11 Nov 2023 07:38:41 +1100 (AEDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-1f256362bb5so1357957fac.0
        for <openbmc@lists.ozlabs.org>; Fri, 10 Nov 2023 12:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699648713; x=1700253513; darn=lists.ozlabs.org;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Vh/WIzHvpfFMxGbFC/M/FuC619h7zq0OR9hliJTWAQ=;
        b=N/revp6OvDU/+nKEkJJIJMXq857UKLa+32XNcoqd+q94qspdU1pClU2UFjk6nY5ZNy
         mGBi9IRWS/Ix/L1uGiq88DzlRJTnef9yeWWNEf9PLI0ZMmjVb9jApkp++kMDshR6SDxl
         ngCrTEaTmht5U2SYdFUxf/qdZkQWa22UFzQpvBj/FmlILERc0j+r+hJs5lrQOUpsCKI9
         9Knbi7XLygIh1mI3XwGHZGfIBxeJtghQIwFsdCl0W6o0XhmW9CrqRB9xRqzyIHgjrRiW
         7IIdc9N065JEyMOfdMr7Pf5CjF7QQeDSWnW6Pc067Foj/7vYzTiDD92g7TxtSIEuklPH
         i9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699648713; x=1700253513;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Vh/WIzHvpfFMxGbFC/M/FuC619h7zq0OR9hliJTWAQ=;
        b=TpqdpK6pR8gN7MdNukXyyPe/Ge0EMDYUN9Qbgnit4FRvT0H3CWMVESB0d4QEajRXX/
         A4RKPkKEtUtQ272nfbsHo5Vi8UAf6lzsjQbCyADILB4U14Xxr7IPc+p1i2Af/u+gUN3D
         5/w5nfoyjD0kfyMvotD01MfgR1uSb+NFI3LVjj5Vg1lMvoUwTJpPmwJqmR1zv6jGVTPL
         esKfvK48jjD+dCnfq1JEvJBLZ5Vu2YVh1lQFPm9H3AFJesN3AzTq7YSqSTloHS9PAu9e
         2CwvdMc9LdqeNl07va5Beo4KrqEGjLsDlDI6bFsFWuRS16AYIXalkmQSr9ouxP5gwCZG
         VKaA==
X-Gm-Message-State: AOJu0Yz20D7Gryp1GT+fqxFEkshJvWgSCcBOCDcaTXBjX04u2o6vXr43
	aGcF8m3oi5SFfiGEEUS7y4C0bewGPKcN73nI
X-Google-Smtp-Source: AGHT+IHwgcAazMyyAU259uCNzjQFqOvBsH8APmYqwv6ciaMe7WGJEgDFrDorwA9JfOZNTRF1ANZ5DQ==
X-Received: by 2002:a05:6870:aa8a:b0:1e9:8eaf:c369 with SMTP id gr10-20020a056870aa8a00b001e98eafc369mr370930oab.43.1699648712900;
        Fri, 10 Nov 2023 12:38:32 -0800 (PST)
Received: from smtpclient.apple ([2806:2f0:96c0:f980:59ed:59f9:d54d:5be3])
        by smtp.gmail.com with ESMTPSA id r13-20020a9d750d000000b006d6496747b6sm47062otk.80.2023.11.10.12.38.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Nov 2023 12:38:32 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Message-Id: <7D392EA9-8C46-415D-ADF3-0AF4784955B6@gmail.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_2CAF69BF-B975-4139-B668-EB9D3A3B7CF6"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Re: OpenBMC CCLA Review
Date: Fri, 10 Nov 2023 14:38:20 -0600
In-Reply-To: <bf6169758489420990100194628c4c3e@ieisystem.com>
To: =?utf-8?B?IkJlbmRlciBCYW4o54+t5Y2O5aCCKSI=?= <banht@ieisystem.com>
References: <bf6169758489420990100194628c4c3e@ieisystem.com>
X-Mailer: Apple Mail (2.3774.200.91.1.1)
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_2CAF69BF-B975-4139-B668-EB9D3A3B7CF6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Welcome Bender and team.=20

I=E2=80=99ve added your CLA to our google docs repo and created a CI =
group for your
team up at https://gerrit.openbmc.org/admin/groups/124,members

Andrew

> On Aug 22, 2023, at 8:32=E2=80=AFPM, Bender Ban(=E7=8F=AD=E5=8D=8E=E5=A0=
=82) <banht@ieisystem.com> wrote:
>=20
> Hi Brad,
> The attached file is IEI=E2=80=99s OpenBMC CCLA. Please help to review =
it.
> Thanks.
> =20
> Bender
> 2023/8/23
> <CCLA-IEI.pdf>


--Apple-Mail=_2CAF69BF-B975-4139-B668-EB9D3A3B7CF6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;">Welcome Bender =
and team.&nbsp;<div><br></div><div>I=E2=80=99ve added your CLA to our =
google docs repo and created a CI group for your</div><div>team up =
at&nbsp;<a =
href=3D"https://gerrit.openbmc.org/admin/groups/124,members">https://gerri=
t.openbmc.org/admin/groups/124,members</a></div><div><br></div><div>Andrew=
<br id=3D"lineBreakAtBeginningOfMessage"><div><br><blockquote =
type=3D"cite"><div>On Aug 22, 2023, at 8:32=E2=80=AFPM, Bender =
Ban(=E7=8F=AD=E5=8D=8E=E5=A0=82) &lt;banht@ieisystem.com&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div><meta =
charset=3D"UTF-8"><div class=3D"WordSection1" style=3D"page: =
WordSection1; caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><div style=3D"margin: 0cm 0cm 0.0001pt; text-align: justify; =
font-size: 10.5pt; font-family: =E7=AD=89=E7=BA=BF;"><span =
lang=3D"EN-US">Hi Brad,<o:p></o:p></span></div><div style=3D"margin: 0cm =
0cm 0.0001pt; text-align: justify; font-size: 10.5pt; font-family: =
=E7=AD=89=E7=BA=BF; text-indent: 15.75pt;"><span lang=3D"EN-US">The =
attached file is IEI=E2=80=99s OpenBMC CCLA. Please help to review =
it.<o:p></o:p></span></div><div style=3D"margin: 0cm 0cm 0.0001pt; =
text-align: justify; font-size: 10.5pt; font-family: =E7=AD=89=E7=BA=BF; =
text-indent: 15.75pt;"><span =
lang=3D"EN-US">Thanks.<o:p></o:p></span></div><div style=3D"margin: 0cm =
0cm 0.0001pt; text-align: justify; font-size: 10.5pt; font-family: =
=E7=AD=89=E7=BA=BF; text-indent: 15.75pt;"><span =
lang=3D"EN-US"><o:p>&nbsp;</o:p></span></div><div style=3D"margin: 0cm =
0cm 0.0001pt; text-align: left; font-size: 10.5pt; font-family: =E7=AD=89=E7=
=BA=BF; text-indent: 15.75pt;"><span =
lang=3D"EN-US">Bender<o:p></o:p></span></div><div style=3D"margin: 0cm =
0cm 0.0001pt; text-align: left; font-size: 10.5pt; font-family: =E7=AD=89=E7=
=BA=BF; text-indent: 15.75pt;"><span =
lang=3D"EN-US">2023/8/23<o:p></o:p></span></div></div><span =
id=3D"cid:CFEE7117-02B5-409C-9BD8-14D07B836798">&lt;CCLA-IEI.pdf&gt;</span=
></div></blockquote></div><br></div></body></html>=

--Apple-Mail=_2CAF69BF-B975-4139-B668-EB9D3A3B7CF6--
