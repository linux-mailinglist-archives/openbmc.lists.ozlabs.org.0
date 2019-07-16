Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 521566A2BD
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2019 09:17:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nsDh4YP8zDqY2
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2019 17:17:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=tyler.sabdon@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oBF7ETq5"; 
 dkim-atps=neutral
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nsB06BJHzDqRj
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2019 17:15:33 +1000 (AEST)
Received: by mail-io1-xd36.google.com with SMTP id e20so7959260iob.9
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2019 00:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=+P7NnG2ZKY8iZGFMHIGjULRTCRvcTpr54lMT0Ojabto=;
 b=oBF7ETq5WunQgVqjH7Rgd3q9/nvb5TrLGJiA14Azguk/oUYEq1528+v5uzp3Ds3RML
 1/B8QRy91UC0iHtIJh6VPoWSXwlu0m5xiUqyr9YQWbPI++wTf47m0XYfbT1jzuCwRQ47
 cXQ6ZUBSzpYppqjycgNu8/NYxh6TRRr46uQ0I3e92UMVnqffVFtflYTaihb6CVdDCee0
 HyazA9xDTes5fiWKuWkSLtbqM8oryM2jH3Jbm0bOX71rcmO+lOsIkmOujjVbhdgq8oUI
 uU3/dskBIp48peJtuH3WPWWI5jeh9gX5ueXXZuTWwkvOw0U67Ro+HiOGrSOSf+l97tC+
 Ty6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=+P7NnG2ZKY8iZGFMHIGjULRTCRvcTpr54lMT0Ojabto=;
 b=iZepswHwzuHzHHzXfO929/p9uyZKb2d5uVC3A4W/ESAYbUvYBEOxTMb2d1meCebcAD
 l0ZuVIhVDyicnZrSJphkSk+1gOAMQw9ttDSbYFkEYQACIZC/btc0nzhs3iF82d31hF2r
 2cT2e4h2ICSdi1YTJjx1QX4BhKLdKKPjlYYf6Ko21qbMXHTMMkblZTO8N7cUNC3rBFwq
 CnjyIw0vacyVApTfMAR3lrCIKyPJnmHnTv0uKwTMki6DzHMz9e6c8uQoo1xMZ9BJWRRe
 1W6MwKECETgsVsSxJndK/+Z9BRlmDgLenEmrZeIJD49sWhDjMfBXFdws8a5Krhg+qsE9
 /6Gw==
X-Gm-Message-State: APjAAAXiYn1/giARulGoKki9L2XkI5ig0zGfBFBW5q4GNUlgdazGdBlO
 /McaXhDWHtt7VpETodRXEEwDfRgjn4bzUXQ9dAzbcf4l
X-Google-Smtp-Source: APXvYqyqpIO0nRvNtxAKGEEbLtA+sys8ZAfB6POEk2SuXRBEGACgyEbkMQfk2Z2V8EvSSWIa1vdHN4T48ALcf09OFGA=
X-Received: by 2002:a5d:87d6:: with SMTP id q22mr26527567ios.2.1563261329087; 
 Tue, 16 Jul 2019 00:15:29 -0700 (PDT)
MIME-Version: 1.0
From: Deng Tyler <tyler.sabdon@gmail.com>
Date: Tue, 16 Jul 2019 15:15:17 +0800
Message-ID: <CAO9PYRL-VUFar6MRFfEHxvx+XqSdybU-WdNkWxon8nzcU3DiMw@mail.gmail.com>
Subject: Address type in entity-manager repo
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/related; boundary="0000000000003724c5058dc724aa"
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

--0000000000003724c5058dc724aa
Content-Type: multipart/alternative; boundary="0000000000003724c3058dc724a9"

--0000000000003724c3058dc724a9
Content-Type: text/plain; charset="UTF-8"

Hi All:
    I am investigated entity-manager with dbus-sensors. In entity-manager,
the schema define Address type is string as below
---------------------------------------------------
            "type": "object",
            "properties": {
                "Exposes": {
                    "type": "array",
                    "items": {
                        "type": "object",
                        "properties": {
                            "Address": {
                                "type": "string"      <== here
                            },
                            "Name": {
                                "type": "string"
                            },
--------------------------------------------------------
In dbus-sensor application, cpusensor get CPU configuration from DBUS. But
the type is mismatch and cause cpusensor terminated.
*journalctl:*
cpusensor[296]: terminate called after throwing an instance of
'std::invalid_argument'
cpusensor[296]:   what():  Cannot translate type to unsigned int

I found code in cpusensor to get "Address" and type shall be integer from
dbus as below
[image: image.png]
But in dbus the Address property is string
[image: image.png]

Is this code error? or I miss something? thanks.

Tyler

--0000000000003724c3058dc724a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All:<div>=C2=A0 =C2=A0 I am investigated entity-manager=
 with dbus-sensors. In entity-manager, the schema define Address type is st=
ring as below</div><div>---------------------------------------------------=
</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quo=
t;object&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;properti=
es&quot;: {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;Exposes&quot;: {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;array&quot;,<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;items&quot;: {<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;type&quot;: &quot;object&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;proper=
ties&quot;: {<br><font color=3D"#ff0000">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Addre=
ss&quot;: {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quo=
t;string&quot;=C2=A0 =C2=A0 =C2=A0 &lt;=3D=3D here</font><br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 },<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Name&quot;: {<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;string&quot;<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 },<br></div><div>----------------------------------------=
----------------</div><div>In dbus-sensor application, cpusensor get CPU co=
nfiguration from DBUS. But the type is mismatch and cause cpusensor termina=
ted.</div><div><b>journalctl:</b></div><div>cpusensor[296]: terminate calle=
d after throwing an instance of &#39;std::invalid_argument&#39;<br>cpusenso=
r[296]: =C2=A0 what(): =C2=A0Cannot translate type to unsigned int<br></div=
><div><br></div><div>I found code in cpusensor to get &quot;Address&quot; a=
nd type shall be integer from dbus as below</div><div><div><img src=3D"cid:=
ii_jy5h9fdg0" alt=3D"image.png" width=3D"463" height=3D"200"><br></div></di=
v><div>But in dbus the Address property is string</div><div><div><img src=
=3D"cid:ii_jy5hau7y1" alt=3D"image.png" width=3D"562" height=3D"55"><br></d=
iv></div><div><br></div><div>Is this code error? or I miss something? thank=
s.</div><div><br></div><div>Tyler=C2=A0</div></div>

--0000000000003724c3058dc724a9--

--0000000000003724c5058dc724aa
Content-Type: image/png; name="image.png"
Content-Disposition: inline; filename="image.png"
Content-Transfer-Encoding: base64
Content-ID: <ii_jy5h9fdg0>
X-Attachment-Id: ii_jy5h9fdg0

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
HxIjmhbWvo78AAAAAElFTkSuQmCC
--0000000000003724c5058dc724aa
Content-Type: image/png; name="image.png"
Content-Disposition: inline; filename="image.png"
Content-Transfer-Encoding: base64
Content-ID: <ii_jy5hau7y1>
X-Attachment-Id: ii_jy5hau7y1

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
TMAEriHw/xzXoA4NaNvpAAAAAElFTkSuQmCC
--0000000000003724c5058dc724aa--
