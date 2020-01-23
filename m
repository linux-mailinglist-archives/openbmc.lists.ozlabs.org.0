Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28312146090
	for <lists+openbmc@lfdr.de>; Thu, 23 Jan 2020 02:51:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4834xX2DWGzDqW8
	for <lists+openbmc@lfdr.de>; Thu, 23 Jan 2020 12:51:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::236;
 helo=mail-lj1-x236.google.com; envelope-from=nishanths1992@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AYS20AeN; dkim-atps=neutral
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4834wt64KTzDqTF
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jan 2020 12:50:35 +1100 (AEDT)
Received: by mail-lj1-x236.google.com with SMTP id y4so1318288ljj.9
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jan 2020 17:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=0/POkvmQZBGgBgfCuVJDVPfuZIkhV7C6JWnjF8oGXsA=;
 b=AYS20AeNfB1X13v+mFme1KuHzkD6EbbIhEogfBCnpSF0UD+GGIv1L4DQ19Y3grNlFZ
 p8RDGwxGg6+0o+Fh/4ibZWwfp/rxaexIta816PJG+/lUyr5LXu8E5+32uAZx6sJNClVc
 IsHenkXJCKLqBnb7n8Oozy3YlHIZ5iAsoSPUWExyHRkMDaCsRz5W75C9ft5eDFFSq5Jp
 ixAhK3prAEApuSae1BAocGf+gLbR8Giru5e2Wum/15uIrpmeFnjebbkWNxNhPnkle9hU
 qlGbjTZbEOu4zrANp8BNW9EIraDHM+ZtYh+Bw82W6vB/a5gJqVATdUP9DkwUpQKL4Tk+
 AFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=0/POkvmQZBGgBgfCuVJDVPfuZIkhV7C6JWnjF8oGXsA=;
 b=he0Fv5i3o7ceVMtVHibvDLqObbOaZe/pszfdPtAGjK52FbINHDcwlDqVW+vLPDDq5w
 s62bVzv9IHvr7HzA1Pl5dJMO5tYdNuD958kIv+9dSjwvdYcEBNwwBt/R65OKS44EPzkC
 9eLmz/+kNnxso14ZI5QeklsgzN65MlNQ45v/MTUS9WdNTFjLUQ427mqgFrNmnSxxT8PH
 h0zcxmFz4vV8mdEto2hl2Se+S8xHWBt9iTJijeV0P0yUTBHO8iiXg+jhklWX8XK78vkA
 POLttkhe6LOvwmY35XyFz0uOujBbZ4TvLxSOd/q9lSqy2HfUIziEpQp/XryafKejU7Jp
 Z9Hg==
X-Gm-Message-State: APjAAAUEhP0UspeoFR6OJTfsjuPmof4VezDrU9wVUPvI52gWdnGim6C4
 cnG7Zo+VxJhxGpJ0F4mkjcO2pDvo8uBgmhXP+PveiIS4AkhI5w==
X-Google-Smtp-Source: APXvYqwa+fHd5/RmAte5mVHy/y/A/oRNB1ytLejxg78M7eJUng218cNa786FljlJkXZ+H0mOpqprnftV1ExkGTUhb00=
X-Received: by 2002:a2e:978d:: with SMTP id y13mr21578461lji.103.1579744230817; 
 Wed, 22 Jan 2020 17:50:30 -0800 (PST)
MIME-Version: 1.0
From: Nishanth S <nishanths1992@gmail.com>
Date: Wed, 22 Jan 2020 17:50:20 -0800
Message-ID: <CAOyHr8uiSxTrB5Q0t1dkydzoWLSa4AdAobTaYuRd5fKdRGAauw@mail.gmail.com>
Subject: openbmc REST API has too permissive CORS policy
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000b6cbb2059cc4ddce"
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

--000000000000b6cbb2059cc4ddce
Content-Type: text/plain; charset="UTF-8"

Hi All,

     The BMC REST API effectively allows cross-origin requests from any
domain to almost all URLs. If a user accesses the API from a browser, then
any other malicious website visited in that browser will be able to access
the REST API without the user's knowledge.

At line 1329 of rest_dbus.py [1], if the request contains an Origin header,
the
REST server adds that origin to the "Access-Control-Allow-Origin" of the
response:

    def process_origin():
        origin = request.headers.get('Origin')
        if origin:

*            response.add_header('Access-Control-Allow-Origin', origin)
        response.add_header('Access-Control-Allow-Credentials', 'true')*

Browsers use the Access-Control-Allow-Origin header to determine which
other origins are allowed to send cross-origin requests to the REST API.
This
effectively allows all origins to send cross-origin requests. This header
is
applied to all property and method accesses through the API.

    What is the significance of this?

Thank you,
Nishanth

--000000000000b6cbb2059cc4ddce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div><br></div><div>=C2=A0 =C2=A0 =C2=A0The BMC RES=
T API effectively allows cross-origin requests from any domain to almost al=
l URLs. If a user accesses the API from a browser, then any other malicious=
 website visited in that browser will be able to access the REST API withou=
t the user&#39;s knowledge.<br><br>At line 1329 of rest_dbus.py [1], if the=
 request contains an Origin header, the <br>REST server adds that origin to=
 the &quot;Access-Control-Allow-Origin&quot; of the <br>response:<br><br>=
=C2=A0 =C2=A0 def process_origin():<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 origin =
=3D request.headers.get(&#39;Origin&#39;)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if=
 origin:<br><b>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 response.add_heade=
r(&#39;Access-Control-Allow-Origin&#39;, origin)<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 response.add_header(&#39;Access-Control-Allow-Credenti=
als&#39;, &#39;true&#39;)</b><br><br>Browsers use the Access-Control-Allow-=
Origin header to determine which other origins are allowed to send cross-or=
igin requests to the REST API. This <br>effectively allows all origins to s=
end cross-origin requests. This header is <br>applied to all property and m=
ethod accesses through the API.<br><div><br></div><div>=C2=A0 =C2=A0 What i=
s the significance=C2=A0of this?</div><div><br></div><div>Thank you,</div><=
div>Nishanth<br><br><br><br></div></div><img width=3D"0" height=3D"0" class=
=3D"mailtrack-img" alt=3D"" style=3D"display:flex" src=3D"https://mailtrack=
.io/trace/mail/8ffb0e3cead1cccf82af5b9f38d2294e863ed8ff.png?u=3D1433543"></=
div>

--000000000000b6cbb2059cc4ddce--
