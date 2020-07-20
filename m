Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 881242259DF
	for <lists+openbmc@lfdr.de>; Mon, 20 Jul 2020 10:19:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9F5P6lfNzDqdW
	for <lists+openbmc@lfdr.de>; Mon, 20 Jul 2020 18:19:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::529;
 helo=mail-ed1-x529.google.com; envelope-from=asmithakarun@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=e+EFz1EL; dkim-atps=neutral
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9F4b3DCCzDqCx
 for <openbmc@lists.ozlabs.org>; Mon, 20 Jul 2020 18:19:07 +1000 (AEST)
Received: by mail-ed1-x529.google.com with SMTP id d18so12122947edv.6
 for <openbmc@lists.ozlabs.org>; Mon, 20 Jul 2020 01:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=lCIu6IgzmTvLVUB52zvdJK39nLTXMfRe5283gr8mOJI=;
 b=e+EFz1ELEukVOFz1rN/2WRR29UYf1/Xj9vPG09C6aGx+w7LR9qWFlgu9VA1UT3gf/0
 xBkcw5dTG4jCWOeAzBMTvXjysPwwYnR+0FdysDRE+IUAEcs80qpeWJ4P5MfPCiAuW2rA
 XT7KZ3X33MEoVoOW8YY54VVu1Rt81jSeYC12jXEhT+dCaocNngX15yx0MTPKZjyAd971
 MGknW0Q584YU5tTAHzB2UMemTNjKsQnfb0g2ym+WxP/fDT2rEMeb/DoL7GJUyJjBUKV/
 8auVFmxF9RRu4uRAtn5hmXzPdUY++5V6ZjxBwJXqCmpXrgyFMxyyvnz27uFLyrqBZMgW
 oKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=lCIu6IgzmTvLVUB52zvdJK39nLTXMfRe5283gr8mOJI=;
 b=Ti3nDMzRhfoqGbKXKXlr+f3LraanKWSukupXuzzK4FEEjjDzsdJy+ISBbAR3gpruqR
 vpAn+77CCJpOn/KNrDJem8q435w5INs9bueiWQy4mZ+TzPJ/UuO6Wg4/h/4EF3FD+bm7
 UL0LczLyoCZCU09yIMu6XNqtmcCrZQnZuI4FMCeKOJ2fUazki31J8IiJKLK6TDxqiIOe
 H8xrROcn2CN5IdF7TYYib0rtYtS6PDlPK1Y4fnnlPzrisIXDZW7ytSqc1JtS7JQ2vVVi
 aXJR23VKilzxSQFschzIZPUmzCNUt4MRPpDaV2Fs7ewc21EBBMKyVbivdm5isuWTuwda
 1z7g==
X-Gm-Message-State: AOAM5323XoPqYIleubxhB1Qtd2+KZwdsuZIayWAA1uVMsw9VUdGaFc4C
 SdRW7LvoTrNzmYP26tBWglDumg0UFo+wyhZJNT3Zd9RVR6I=
X-Google-Smtp-Source: ABdhPJxkusP7x5zdtAbqcg/HmbxwpHpDlHQwjmBTUAXkAlWT6kMdHN6X4rMVOE+1eQ89ioGAfrgitzywgEXBQk39yqg=
X-Received: by 2002:aa7:db53:: with SMTP id n19mr20771539edt.338.1595233143055; 
 Mon, 20 Jul 2020 01:19:03 -0700 (PDT)
MIME-Version: 1.0
From: Asmitha Karunanithi <asmithakarun@gmail.com>
Date: Mon, 20 Jul 2020 13:48:26 +0530
Message-ID: <CANGK-S5feyV1xPeYaTatfOGCZp4tY6Y8YyYHZGhpu4GF79gaFw@mail.gmail.com>
Subject: Change in the redfish system dump URI
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000d3684a05aadb28de"
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

--000000000000d3684a05aadb28de
Content-Type: text/plain; charset="UTF-8"

Hi All,

I found that the existing redfish system dump URI is:
/redfish/v1/Systems/system/LogServices/System

Since "System" is already there in the path, the LogService could be
renamed as "Dump", as mentioned in the URI below, which would be more
relevant than the existing one.
/redfish/v1/Systems/system/LogServices/Dump

Let me know your thoughts on this.

-- 
Thanks & Regards,
Asmitha Karunanithi

--000000000000d3684a05aadb28de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div><br></div><div>I found that the existing redfi=
sh system dump URI is:<br>/redfish/v1/Systems/system/LogServices/System</di=
v><div><br></div><div>Since &quot;System&quot; is already there in the path=
, the LogService could be renamed as &quot;Dump&quot;, as mentioned in the =
URI below, which would be more relevant than the existing one.<br clear=3D"=
all"><div>/redfish/v1/Systems/system/LogServices/Dump<br></div><div><br></d=
iv><div>Let me know your thoughts on this.</div><div><br></div>-- <br><div =
dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><d=
iv dir=3D"ltr"><div><div dir=3D"ltr">Thanks &amp; Regards,<div>Asmitha Karu=
nanithi</div></div></div></div></div></div></div>

--000000000000d3684a05aadb28de--
