Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC8A2C8B40
	for <lists+openbmc@lfdr.de>; Mon, 30 Nov 2020 18:38:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClCB12FlwzDqRs
	for <lists+openbmc@lfdr.de>; Tue,  1 Dec 2020 04:38:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::330;
 helo=mail-ot1-x330.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MzghW6sq; dkim-atps=neutral
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClC8r6fQ9zDqLZ
 for <openbmc@lists.ozlabs.org>; Tue,  1 Dec 2020 04:37:00 +1100 (AEDT)
Received: by mail-ot1-x330.google.com with SMTP id f12so12057906oto.10
 for <openbmc@lists.ozlabs.org>; Mon, 30 Nov 2020 09:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=oxayugG0s9Js++fZAaMkx89PwSdfudEwKHuG3IILSaU=;
 b=MzghW6sqoqqurWJ8/W9tStL7KfY5HLDjaYk+12GPp94WWjcZjp+dXHw6q6WqK4CAiD
 75NlkVqY1R8YgGjg9KU1sMHLmRdvTL35PoFGAaCJinq1Bgwf6VWODAaqzHQ/flVOg9fs
 vUXs4kAr7JC4+HnoCbB0a9PRe8zLqAjQsUHbUwv23JbrWuGB1qq+csbqb6RYyAunvvFB
 W6U/q9Txk7oEFqr0PpmfwINO8rntg/bvINHJILwgDELQXfpKt72evW9DpKn+JRSWrpur
 sjD3tArYcuf05RiiUACshFMs/QGku3mj2FpLoOILrbI8rtNBA7KHl9DEVk7w8XsMNwXj
 6UiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=oxayugG0s9Js++fZAaMkx89PwSdfudEwKHuG3IILSaU=;
 b=rytpXl4bFjrt2yV/neVfr9AGy+fr4hP0Q8cdNFBtBlVQAd8hDL9h8wtaRpujhDjthl
 Gbo7QtUderqg0UYE7hOaH7r3l4Zr1XdnKNPfvSrmMxNvopoTnd4pauNKT3gsy8Baaork
 0IXxkchQp/rypK1FVGTzkcxsgTNz2uIkW7c71vR3ajHDz+6L09TEzgRGP294WXPbcn0l
 EnpnFZtR1ZagiykHS6jmkVJNqZJel2t+I09zmnZGzMoMq2XKuYqhc/EV6VshbY0Zbtrx
 DtrRLEMpmkgC5Kjl2ENorXl49v4XxJ32iz5/UdFsI2xvZhEqN/zGk79T7O+Jfky2TRbh
 7DAA==
X-Gm-Message-State: AOAM533DAxSJcjEA1+1BcdXTgKvgx6ie12vrmVS4y+hdR4gt5WquMMAn
 3My3g8fexvho7vyBbsiOXj4=
X-Google-Smtp-Source: ABdhPJx4IheZh62+oaYNfG0KYqxZ8uTRmPACkdbzYmVzPYVqGZ9mm7aWDMWf2r4YNRv5TP9DZVtpkg==
X-Received: by 2002:a9d:62cb:: with SMTP id z11mr17619553otk.191.1606757817470; 
 Mon, 30 Nov 2020 09:36:57 -0800 (PST)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:9c47:6075:1073:650a])
 by smtp.gmail.com with ESMTPSA id e5sm9002784otl.75.2020.11.30.09.36.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Nov 2020 09:36:56 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: ipmi command implementation mismatch with the design document
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <20201124190606.GA45289@mauery.jf.intel.com>
Date: Mon, 30 Nov 2020 11:36:56 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <73E4FC5B-45F9-436F-B6A5-D01BEB44A8B7@gmail.com>
References: <BL0PR01MB515650923510989237151B70FFFC0@BL0PR01MB5156.prod.exchangelabs.com>
 <20201124190606.GA45289@mauery.jf.intel.com>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
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
Cc: Tung Nguyen OS <tungnguyen@os.amperecomputing.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Nov 24, 2020, at 1:06 PM, Vernon Mauery =
<vernon.mauery@linux.intel.com> wrote:
>=20
> On 23-Nov-2020 06:39 AM, Tung Nguyen OS wrote:
>>=20
>> Although the indicate_no_softoff_needed() can prevent the host from =
soft off, but it seems like a mismatch b/w the design document and the =
IPMI implementation.
>>=20
>> So, my question: is it reasonable for IPMI command ?
>=20
> This code has been in place for quite some time now, so I am not sure =
if the original authors have the context at this point in time. But =
nobody else has raised this question. git blame says that Andrew =
Geissler added this feature, but we would have to see if he still knows =
why.=20
> commit a6e3a3080d532536e02e304c819c1e17214e038a
> Author: Andrew Geissler <andrewg@us.ibm.com>
> Date:   Wed May 31 19:34:00 2017 -0500
>=20
>   Create file to indicate host requested off/reboot
>=20
>   Create a file to ensure the soft power off service is
>   not run when the host is requesting a power off
>   or reboot.  There's no need to notify the host (i.e.
>   soft power off) when they are initiating it.
>=20
>   Change-Id: Ic9f8e7110d30f477ceae38bba9d684559d9503d3
>   Signed-off-by: Andrew Geissler <andrewg@us.ibm.com>
>=20

I=E2=80=99m wondering if this ties into the discussion in =
https://github.com/openbmc/phosphor-host-ipmid/issues/158?

Are you having the same issue Tung? May be time to just put up a commit
that does this correctly and discuss via gerrit.

>=20
> --Vernon
>=20
>> Reference:
>> =
https://github.com/openbmc/docs/blob/master/designs/state-management-and-e=
xternal-interfaces.md
>>=20
>> Best regards,
>> Tung

