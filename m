Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C97F1B4FB2
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 23:59:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496vTr3fcJzDqnw
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 07:59:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::229;
 helo=mail-oi1-x229.google.com; envelope-from=ztai@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=BP6sR66E; dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496vT20ghRzDqGX
 for <openbmc@lists.ozlabs.org>; Thu, 23 Apr 2020 07:58:21 +1000 (AEST)
Received: by mail-oi1-x229.google.com with SMTP id x10so3366604oie.1
 for <openbmc@lists.ozlabs.org>; Wed, 22 Apr 2020 14:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=IeK2IIVwC+MQ7ixxJvHxtRldfhHpLzD5iPn0VXlS9gQ=;
 b=BP6sR66E10s5NltQGtvLp97++OdwJT4QR0zgF9qfqG3AP4v+paoqdH1qkdL6hAcpb6
 EgLw3qrHSaFx8Mp4WDWlJ0FYIQX1Gd5wxK6q6eicpLzL36pfQXEHD1yM+/l25Z6sHUJU
 baVqOiQhDufLWCWvxqNipTUrUtYfYDGphZEgJKTe5YSG/JFPrGKmAtw6ByAYFOSto6b/
 5xfK5D3HZ9zLsiC0IovZ/o9fFOCm+eGbRL06x7Gkx0PbuIDBzcxywqWp/v4Y6ezeB8Jn
 /qbjfY1S2gtxGBTIbwSPUIeC66JftDlrVfnK1dv9gs9p7XoxRbLaPRTzrVqmP3jt3B9p
 rMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=IeK2IIVwC+MQ7ixxJvHxtRldfhHpLzD5iPn0VXlS9gQ=;
 b=ogfJRma1OQo/N+IiaRlDf52JtvwHsZ+Gjkh/PeJ+ytDviVe6t/3aht9JOzIgk/9hGR
 pXZhrgSGcBEYEAmKayF0Ifg4kCFLqvux8DY217ITorjaIEWAhMRAzDAQwI8eX9Ykhkw3
 6yyboMQLiA57FrKV6XGf84tkm7EzFUkNkTpP5ylTQC24srj477pxmAZmLF6c/pcfJa8p
 RNN4EfQxgrBr3GsomHDLWkh5doEbIMEw9FeRyIm/Y2hhjgrpTljmQ39VG2GYPN9qCFDL
 AYzmS5FQN/wKEoh9lTwiTjV5fnOheTVIUC/KaHceajkri2ZvrkcW7qgK3OqDxCT0R/wA
 b59Q==
X-Gm-Message-State: AGi0PuZjnKC7BXDKjlKqADNh9ZXNVA77YOSd67LOhancMj0MxxfjRip3
 TuBtTWmL1q+aXQb/TG6NR4RRrWlr7he78MljgxYxGXha7Gc=
X-Google-Smtp-Source: APiQypLSGSTRMogzVjmoii8SKFKMhz4REeZpbW7ZzEPgKyZd/CF6OBDRhnTc4wZ8gzJsaXZbpoRwWkKzLuVAotvhdtc=
X-Received: by 2002:aca:bb54:: with SMTP id l81mr884300oif.60.1587592697259;
 Wed, 22 Apr 2020 14:58:17 -0700 (PDT)
MIME-Version: 1.0
From: Zhenfei Tai <ztai@google.com>
Date: Wed, 22 Apr 2020 14:58:06 -0700
Message-ID: <CAMXw96Pp511sUO=q1XLz2uJzh4S6D7tUwmkvpbnq_yU-iJfiKg@mail.gmail.com>
Subject: mTLS on bmcweb
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000c5103f05a3e83a36"
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

--000000000000c5103f05a3e83a36
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm trying out bmcweb mTLS which should be enabled by default by
https://github.com/openbmc/bmcweb/blob/master/CMakeLists.txt#L89

In my test, I created a self signed key and certificate pair, stacked them
up into server.pem in /etc/ssl/certs/https that bmcweb uses.

However when I tried to curl bmcweb service, I was able to get response by
only supplying the cert.

curl --cacert cert.pem  https://${bmc}/redfish/v1

With the mTLS enabled, I expected it should error out since no client
certificate is provided.

Could someone with relevant knowledge help with my question?

Thanks,
Zhenfei

--000000000000c5103f05a3e83a36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I&#39;m trying out bmcweb mTLS whic=
h should be enabled by default by=C2=A0<a href=3D"https://github.com/openbm=
c/bmcweb/blob/master/CMakeLists.txt#L89">https://github.com/openbmc/bmcweb/=
blob/master/CMakeLists.txt#L89</a></div><div><br></div><div>In my test, I c=
reated a self signed key and certificate=C2=A0pair,=C2=A0stacked them up in=
to server.pem in /etc/ssl/certs/https that bmcweb uses.</div><div><br></div=
><div>However when I tried to curl bmcweb service, I was able to get respon=
se by only supplying the cert.</div><div><font color=3D"#990000"><br></font=
></div><div><font color=3D"#741b47">curl --cacert cert.pem =C2=A0https://${=
bmc}/redfish/v1=C2=A0</font></div><div><br></div><div>With the mTLS enabled=
, I expected it should error out since no client certificate is provided.</=
div><div><br></div><div>Could someone with relevant=C2=A0knowledge help wit=
h my question?<br><br>Thanks,</div><div>Zhenfei</div></div>

--000000000000c5103f05a3e83a36--
