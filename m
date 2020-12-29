Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 123DA2E6CDD
	for <lists+openbmc@lfdr.de>; Tue, 29 Dec 2020 01:52:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D4bVF3rL0zDqFw
	for <lists+openbmc@lfdr.de>; Tue, 29 Dec 2020 11:52:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22b;
 helo=mail-oi1-x22b.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kXy7COW4; dkim-atps=neutral
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D4bTQ1f58zDqBx
 for <openbmc@lists.ozlabs.org>; Tue, 29 Dec 2020 11:51:34 +1100 (AEDT)
Received: by mail-oi1-x22b.google.com with SMTP id 15so13201946oix.8
 for <openbmc@lists.ozlabs.org>; Mon, 28 Dec 2020 16:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:date:references
 :to:in-reply-to:message-id;
 bh=lVy3fO3ghoH5jyZQTLhBNPDixMZTFKT8pZjE4rSG9jc=;
 b=kXy7COW4YoH33qoO7/yW1/N4MfzZyhQAzRFcu63KDwPonk6DIszYfZ8hbOodRglv3c
 EpXR6qOXadxWlGkquPPv42XbEINJ6borIWL5NAnziEww7vJQ5IeEukBxc2BmQvR9rZaP
 leModM1oKMXyqAAXTfUB8JygtVBl/koDlh/xdujcivspvgI7LaskraViyG+cxUvcnaVo
 dgQ+1A1URdwRYKzWId2RP/E8pgPOCepMUAwBj91Mynq58uJEkLOXKdDullhJd2PaYh/k
 4E3kyNTbCOXuasVEuUihn2V01y8CBYv4nFNS265GjWuKGKQK1Evx6gbMG0hgxOSxXQ1Q
 JdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:date:references:to:in-reply-to:message-id;
 bh=lVy3fO3ghoH5jyZQTLhBNPDixMZTFKT8pZjE4rSG9jc=;
 b=BiBCdExcB1cq+wov664xV9jznn/AdwAjXIMSG8Nl6bkW/dWMm8MnuoEfRJX1w0QnYg
 3VosvwEA3pq7ga5y/xRqu61k4XcJpYahbz1wPzUHPrT0eLAPvmj7QWBsmEYR65lfE95q
 yuhlWp8Lx6fhF3zprbeos1MwjGfUuKO9CGG2KyI5ZHWKMdD5KFUOjWFx4kuEY0eNA1ig
 V6O/1uaBWyNIvDoWCVR7fpWwoTdFQPEtWez0KpYi7t5zmIgNdZnK4993eRbLnlHjdX1z
 zjGu/CQGbOQx0Zb+9M0LrKK1M+iAyHWUTFMsvlLtM0GnXoWVaZ3jKMNgUhINSxIBoMXx
 tTnQ==
X-Gm-Message-State: AOAM53148tn5+HLg1et4/riM2OVhDGMZYWWNeUJuUVbpQkKSiPiFx1iI
 DOsN02IgCeGmJ12RrYhFrlrGcPccyXo=
X-Google-Smtp-Source: ABdhPJyVYXoT/3bIbe38Us+YGan6LbImgHckH2PU9MSDIoyrs+/PxXaJvBYsPA5bmUVLS6E0KNlLUA==
X-Received: by 2002:aca:75cc:: with SMTP id q195mr957396oic.173.1609203090784; 
 Mon, 28 Dec 2020 16:51:30 -0800 (PST)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:4889:d9f6:19e6:d5ca])
 by smtp.gmail.com with ESMTPSA id d10sm5802770ooh.32.2020.12.28.16.51.29
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Dec 2020 16:51:30 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: openbmc gerrit and jenkins upgrade - Dec 28, 2020
Date: Mon, 28 Dec 2020 18:51:29 -0600
References: <C9C8DBC8-8747-452F-B4EF-4102B2A46A2C@gmail.com>
 <F1C4CAC4-8AB0-4D6C-A793-C5D3FA72434F@gmail.com>
To: openbMC Maillist <openbmc@lists.ozlabs.org>
In-Reply-To: <F1C4CAC4-8AB0-4D6C-A793-C5D3FA72434F@gmail.com>
Message-Id: <8A151D69-8467-407F-B7F6-183EB61F45B9@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
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

Upgrade is complete.=20

We went from/to the following levels:

Jenkins 2.235.3 -> 2.263.1
Gerrit 2.16.9 -> 3.2.6

Let me know if you run into anything.
Andrew

> On Dec 27, 2020, at 5:23 PM, Andrew Geissler <geissonator@gmail.com> =
wrote:
>=20
> Friendly reminder, upgrade is tomorrow.
>=20
>> Begin forwarded message:
>>=20
>> From: Andrew Geissler <geissonator@gmail.com>
>> Subject: openbmc gerrit and jenkins upgrade - Dec 28, 2020
>> Date: December 17, 2020 at 10:31:13 AM CST
>> To: openbMC Maillist <openbmc@lists.ozlabs.org>
>>=20
>> Greetings,
>>=20
>> I=E2=80=99ve been putting a gerrit upgrade off for a while because:
>>=20
>> a) this current version has been running very stable
>> b) my last upgrade experience was pretty rough
>> c) we keep flirting with just going to github and getting rid of =
gerrit
>>=20
>> But it seems like the quiet holiday season is going to be my
>> best time to give it a go and a gerrit to github migration does
>> not appear to be imminent.
>>=20
>> I know to get to the latest gerrit I=E2=80=99m going to have to do =
some
>> database migration work. I have no idea how long this is going
>> to take so I=E2=80=99d say plan for no gerrit during the US day time =
on
>> Monday Dec 28 (8am-5pm).
>>=20
>> I=E2=80=99ll keep you posted in discord on the 28th.
>>=20
>> Wish me luck,
>> Andrew
>=20

