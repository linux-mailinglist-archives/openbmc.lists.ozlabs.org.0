Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D0120B3A7
	for <lists+openbmc@lfdr.de>; Fri, 26 Jun 2020 16:35:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tfZ86FKkzDqv3
	for <lists+openbmc@lfdr.de>; Sat, 27 Jun 2020 00:35:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22f;
 helo=mail-oi1-x22f.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vc7jp3+D; dkim-atps=neutral
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tfX80zs9zDqtt
 for <openbmc@lists.ozlabs.org>; Sat, 27 Jun 2020 00:33:58 +1000 (AEST)
Received: by mail-oi1-x22f.google.com with SMTP id s21so8211328oic.9
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jun 2020 07:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=3FlpUYnWOeKyd408pRPAaovMSDWq/HyP7/8laKoydco=;
 b=vc7jp3+D8rdrblPy/srojtVEzkRQSk7qJ3JCV0M5EZ9ryW1D3dUfDzGmK/1aa0lxLe
 ke2DZD7jlpyTGp4uf2+76l9sum0UysjXQrvAe92xSuD86roKgeIYCiWunO74beG3EU1I
 PGGSpTFpwTQN2Z93s/EiA4RsWLaGux1jNQtrEDLPbkcEvFWbYQMYWi8fUSvMIXnY23m/
 jOR3b8mBSo8dNAh8L8fwaaQT4kM0BjzAAFojuywEIXp4HFrKqFBaMz1/JZTF7DK0Xd4k
 uN0nEegxtlRus5YF4DVJxnX3PFmQIvZ/mbqvBE9p0bOon9iQXtOo4I6HfHxdW6hx5jq0
 MDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=3FlpUYnWOeKyd408pRPAaovMSDWq/HyP7/8laKoydco=;
 b=D/fl1Ak8eWhYNwFIpvtI0iSth+wu+n/duFiyQYwZc8TJY11SzYmvmrBI5gv4df9Fmv
 fAQUJJGk0PVpw0Dfv/aM35CYHEVNE7/7s+gWf9jex1QHQuyx+Y2pd9af+8zJOdEhYv7M
 Z7dUNHcXOEWj+PM8r7Vey6n3TG9MHX/I61/ByOU9QNA77tNZyA1PhqzMpe6g2FBlgDTV
 O3flO0azY5J54AhdwfWwkqcdhjxtRIWPolWwVuwa2VgS4uc6DaaDebRHQq8aQcT+76my
 CIwxudDCngmUotVoVCVat/aKXw1Ezq/7qBrt/4IEqNoGfDm5VwKyKdVFfvN3SWPcwvV/
 Vg6Q==
X-Gm-Message-State: AOAM5321hB8N6sWsX3cmOKOy/9P28a+9NbxIhNP5rV+u6T6yoAtbnmf9
 5MRiNdq7a6Uq5NaNDUoAPzA=
X-Google-Smtp-Source: ABdhPJwwMAlJKgueynx1r+ayCIw8rpyFSb49yZBX8yr9lkfpI7aay8eB9sU2TCuOr9WumBUxgtg7xQ==
X-Received: by 2002:aca:cc05:: with SMTP id c5mr1768136oig.130.1593182034535; 
 Fri, 26 Jun 2020 07:33:54 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:a4ed:b4b1:ef7d:563e])
 by smtp.gmail.com with ESMTPSA id f5sm6472399oou.47.2020.06.26.07.33.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jun 2020 07:33:53 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Expanding CI to live testing
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <A4D7F39A-744B-43C9-8FE5-885228EA94E9@hpe.com>
Date: Fri, 26 Jun 2020 09:33:53 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <7FAA197E-33CE-46D9-94D3-73F3CB4486F5@gmail.com>
References: <B50DC7EF-D1F7-4D7F-B502-DEA4EA2A6145@hpe.com>
 <3E8DA024-827D-4D4E-A90C-FC5BFE29910A@gmail.com>
 <A4D7F39A-744B-43C9-8FE5-885228EA94E9@hpe.com>
To: "Verdun, Jean-Marie" <jean-marie.verdun@hpe.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Jun 25, 2020, at 3:31 PM, Verdun, Jean-Marie =
<jean-marie.verdun@hpe.com> wrote:
>=20
> Hi Andrew,
>=20
> Thanks for your feedback. I like your approach, and will review it =
carefully. Might have a ton of questions or not (who knows), but I hate =
to re-invent the wheel when something works on the automation side.

Sure thing, feel free to reach out here on the mailing list or IRC

>=20
> Do you offer public access to debug system on the IBM platform (might =
be fun to have a look to it on a real machine, it makes probably 20 =
years that I didn't had the opportunity to use a Power chip) ?
>=20

Nope, no public access here. In fact, one of the limitations of using a =
system like this is an IBM employee (usually me or George) have to look =
at the HW CI failures and post the relevant debug data to the gerrit =
commit.

> Have a great day,
>=20
> vejmarie
>=20
> =EF=BB=BFOn 6/25/20, 4:26 PM, "Andrew Geissler" =
<geissonator@gmail.com> wrote:
>=20

