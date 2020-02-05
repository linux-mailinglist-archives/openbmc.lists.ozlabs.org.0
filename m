Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5735C15395D
	for <lists+openbmc@lfdr.de>; Wed,  5 Feb 2020 20:59:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48CXTS44yqzDqTN
	for <lists+openbmc@lfdr.de>; Thu,  6 Feb 2020 06:59:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::241;
 helo=mail-oi1-x241.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VYTy0vZo; dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48CXSw2H4gzDqQy
 for <openbmc@lists.ozlabs.org>; Thu,  6 Feb 2020 06:59:11 +1100 (AEDT)
Received: by mail-oi1-x241.google.com with SMTP id c16so2064285oic.3
 for <openbmc@lists.ozlabs.org>; Wed, 05 Feb 2020 11:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=/LRFxU4mKiOEAigKtTjZ/WpPG+TA96/hEYRcIDQsfO0=;
 b=VYTy0vZoPXdtZ8vqSshsmk4j7+FVfUUpwd/0R2cTQ5vodScT992iqLKZEseZWd1Fx4
 XrUHTY3w6ROdQw7w1v2WMeSeLLHGSnj2efB1HHIjwZ2kvLcEFNKqERg0A2+/vQnX4PDo
 xynmedmwoaBa5wAsUugarETdrQ2ljM23xCxrzjrhVzBAidRnASz0K9e8l1+mrcrvN6NJ
 YRtH+CuXXyPnMvUFx+mD20cwo4nDTyJzlYmQ69pyZrMx5nlEet2PaWtWHJxbNbXQguPa
 V6ljfRrLzBLPHqY2b5F4RRztlgkUO8oR3JSDSv6/cPvVnmvNSNL5aKka79xTXEq6X6FK
 gTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=/LRFxU4mKiOEAigKtTjZ/WpPG+TA96/hEYRcIDQsfO0=;
 b=qL4ETXfAAPYPcEkm7lpI0UKgC4I3V9VSONYegLrkt4agxwj3tFRuqFzoiMsMofY4Ok
 V6jf5xAUAd62ARtn+zbdSc9A41Q4jZ4iymAyFEjHrtXwY/VifdFI+dAqcSspEEQ9kOz+
 UBZtYfmUl6XTMjaQePVB0CnWUTNsbCJCMw8JykUKJ5dgNGYwjg++QuDtg87LsyI03RmM
 ZNCjBf/bW5V3qbKEs8FZHSfXQPpJs2YtEzJrCxvgsen5tv8+QlVB3+WT54PCK37jqapL
 kdDuqabZ9SFyJ2Pt/G9F2M0N48U5N6w030oInHX/kWUVRNLw3tVJrP+pFaZKPtvYoY6e
 XgnQ==
X-Gm-Message-State: APjAAAWdc6EOAFLQnys+MN7hzB/BFjw9Nv+b+V3UwUMZ9HYVyoSyQXng
 4i0ZbwgLJy6PUGVVipjprfe7kSXq0pA=
X-Google-Smtp-Source: APXvYqymt/lCXmA1CXJZuYZsLuR+X+5SoDowD6b8X9LcTV9A5xd1l7hBxLYhyS/ndAgZvuHjxtIWTA==
X-Received: by 2002:a05:6808:3b4:: with SMTP id
 n20mr4146414oie.78.1580932748785; 
 Wed, 05 Feb 2020 11:59:08 -0800 (PST)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:d966:ea63:aa5b:7786])
 by smtp.gmail.com with ESMTPSA id t132sm159179oie.8.2020.02.05.11.59.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Feb 2020 11:59:07 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: [PATCH linux dev-5.4] ARM: dts: aspeed: witherspoon: Add gpio
 line names
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <20200204215950.GB20653@patrickw3-mbp.dhcp.thefacebook.com>
Date: Wed, 5 Feb 2020 13:59:07 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <1445A16F-768A-47BB-8696-B2865711BA69@gmail.com>
References: <20200204213037.42100-1-geissonator@gmail.com>
 <20200204215950.GB20653@patrickw3-mbp.dhcp.thefacebook.com>
To: Patrick Williams <patrick@stwcx.xyz>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Feb 4, 2020, at 3:59 PM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> On Tue, Feb 04, 2020 at 03:30:37PM -0600, Andrew Geissler wrote:
>> From: Andrew Geissler <geissonator@yahoo.com>
>>=20
>> Name the gpios so libgiod will work with them
>>=20
>> Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
>=20
> Great!  I love that you used logical names here rather than=20
> schematic names too, so that the userspace functionality is
> more likely to be common across machines.  It'd be great if=20
> we could start to document a list of "commonly used logical=20
> GPIO names" (ex. power-button) to facilitate this sharing.

Yeah, I hadn=E2=80=99t really thought of that aspect but it=E2=80=99s a =
good
point. Joel seemed to have some thoughts on improving
conventions with naming in his review comments. I=E2=80=99ll
address those and send upstream. If upstream seems ok
with this direction then I can create a docs repo commit
that documents the conventions.

>=20
>> ---
>> .../boot/dts/aspeed-bmc-opp-witherspoon.dts   | 41 =
+++++++++++++++++++
>> 1 file changed, 41 insertions(+)
>>=20
>=20
> --=20
> Patrick Williams

