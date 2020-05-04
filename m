Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 276971C445D
	for <lists+openbmc@lfdr.de>; Mon,  4 May 2020 20:07:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49G9mW0Hn8zDqWh
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 04:07:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::129;
 helo=mail-lf1-x129.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=vxA8o1i4; dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49G9jf3bBXzDqVj
 for <openbmc@lists.ozlabs.org>; Tue,  5 May 2020 04:04:36 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id 188so10576494lfa.10
 for <openbmc@lists.ozlabs.org>; Mon, 04 May 2020 11:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=+OI8hQBieQX9EgEb7nxqHKer1JDapMnbS9M0bnzvg00=;
 b=vxA8o1i4czB2AjiblzDSkiWssz387gsyJboz+5L7e5MGx4RNpgNjb3lekLwcejO48g
 +SsS/gauOpH7M/sGbZK+e9JdwyC3wQky7u3xe2gVhH380e6GVUsg72QwUZOXS6oKhL7Y
 2UyIplJMoZST/f7Dm7nl2cXpM9ZSucvhg2i6wfnzELcDzCXgHdD30CwVpCjwQqnnzJst
 dw+EzoGNbLedtZ6OW+1fjnIUCx3Fv5LEM2l+xpioCXbFsthAYhee8GN39cXQlQTmLXtm
 tE9UBSxYNmTH8zGlpbvZODYvfrzya3420klcUpTrJiQ1E75cx2bWoNDhgCiVU4EOz03n
 w4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=+OI8hQBieQX9EgEb7nxqHKer1JDapMnbS9M0bnzvg00=;
 b=E4DwTrew4OMesM0GzflhD/fwFfkLB9Et2iHuvrYejSXFtfeLvwuKaEYVpdJyyq0kcV
 uBKhbpcpwZCOeVFFn6B9rj4bGyUe8TdsxyEINPnrfVjcxBKqAlR7ldiR1oZ1XcLnoubH
 hVtCFSN8owUv59H5bRo2hGwOYBJHYTdmmIjoZImsK9uViayc37gz3T8tVefDNpFM+1Jx
 tQprRlmnmJxUVs//Haxb7gkxnLuxu6OYLgk05XaOK1r5gjlU/xJe4HqL9pHEC7NFTX4G
 lqN0ZvXqe7xQ0bR6QfE5dwhXd7sYeKypkDxCeJ7HrgTF6V10gWrQSs+guyw1kO+Hsp+R
 OZtw==
X-Gm-Message-State: AGi0PuaOrGSvOSF7lPWmAjGgJYdcKveSKfkw2JdeibUFuiAhQ2TboKbt
 T7nlpDDu6Sn12uamKri2mBkJr1yB4+qXVjr2fmXI49oWTQo=
X-Google-Smtp-Source: APiQypJ64wuqL1F3nMgyh9pEbuHF8MjR4sdGinSdCnd4IIfkNL+9z8QXMMO0HEywd8pZSi4M859ATiIIqtzuo8z6YWQ=
X-Received: by 2002:a19:4285:: with SMTP id p127mr12467532lfa.46.1588615471291; 
 Mon, 04 May 2020 11:04:31 -0700 (PDT)
MIME-Version: 1.0
From: Richard Hanley <rhanley@google.com>
Date: Mon, 4 May 2020 11:04:20 -0700
Message-ID: <CAH1kD+Y1u0CHZ_6PRV8GKmzSq49sg24QD1X99KZRZK=GN-Aedw@mail.gmail.com>
Subject: Survey for Certificate Management Needs
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000da38e505a4d65ca6"
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

--000000000000da38e505a4d65ca6
Content-Type: text/plain; charset="UTF-8"

Hi Everyone,

We've been having a lot of internal discussions about how we want to manage
certificates/credentials on a BMC out of band. I wanted to get an idea
about what we broadly need as a community, and if it matches some of our
needs.

For authentication I see three core requirements:
  1) We need everything supported through mTLS. This is already supported
through in bmcweb.      2) We also need all certificates to be rotated.
This might be supported through Redfish OEM extensions.
  3) Finally we need to support revocations lists. AFIAK, there is no
support for this today.

For authorization we would like to support dynamic role configuration. A
reference implementation for this kind of functionality is Role Based
Access Control (RBAC) in envoy
<https://www.envoyproxy.io/docs/envoy/latest/api-v2/config/rbac/v2/rbac.proto>
.

Finally, I'm expecting we will need an out of band mechanism to talk with
hardware root of trust (e.g. OpenTitan https://opentitan.org/).

I'd be interested to hear how this matches up with other organizations'
needs. I imagine supporting this upstream in Redfish would involve some
changes to the spec, and some changes to bmcweb. So I want to gauge
interest in this beefed up security posture.

Thanks,
Richard

--000000000000da38e505a4d65ca6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Everyone,<div><br></div><div>We&#39;ve been having a lo=
t of internal discussions about how we want to manage certificates/credenti=
als=C2=A0on a BMC out of band. I wanted to get an idea about what we broadl=
y need as a community, and if it matches some of our needs.</div><div><br><=
/div><div>For authentication I see three core requirements:</div><div>=C2=
=A0 1) We need everything supported through mTLS. This is already supported=
 through in bmcweb.=C2=A0 =C2=A0 =C2=A0 2) We also need all certificates to=
 be rotated. This might be supported through Redfish OEM extensions.</div><=
div>=C2=A0 3) Finally we need to support revocations lists. AFIAK, there is=
 no support for this today.</div><div><br></div><div>For authorization we w=
ould like to support dynamic role configuration. A reference implementation=
 for this kind of functionality is Role Based Access Control (RBAC) in <a h=
ref=3D"https://www.envoyproxy.io/docs/envoy/latest/api-v2/config/rbac/v2/rb=
ac.proto">envoy</a>.</div><div><br></div><div>Finally, I&#39;m expecting we=
 will need an out of band mechanism to talk with hardware root of trust (e.=
g. OpenTitan=C2=A0<a href=3D"https://opentitan.org/">https://opentitan.org/=
</a>).</div><div><br></div><div>I&#39;d be interested to hear how this matc=
hes up with other organizations&#39; needs. I imagine supporting this upstr=
eam in Redfish would involve some changes to the spec, and some changes to =
bmcweb. So I want to gauge interest in this beefed up security posture.</di=
v><div><br></div><div>Thanks,</div><div>Richard</div></div>

--000000000000da38e505a4d65ca6--
