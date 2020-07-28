Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BC4230B45
	for <lists+openbmc@lfdr.de>; Tue, 28 Jul 2020 15:18:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGHKg4BZBzDr1r
	for <lists+openbmc@lfdr.de>; Tue, 28 Jul 2020 23:17:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::829;
 helo=mail-qt1-x829.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Bu78FLHs; dkim-atps=neutral
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGH4L1K2XzDqx5
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jul 2020 23:06:25 +1000 (AEST)
Received: by mail-qt1-x829.google.com with SMTP id x12so6204079qtp.1
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jul 2020 06:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=bI+EYmOEFXnD89qqj57pIShxgODbDqTPdUSqBffk7aQ=;
 b=Bu78FLHsSq89vJjCBsdUE3Snj0u23J0vKmrG2XN5QuCdUsgXgsPCDTelAvnvjCGfp5
 BfIi7NPA4cmD1zQCpKs/D8SxssQkIa+swov1NvchRN179066c+3bzyNlu6B5b55nRHcH
 bSBTe6KGpEqWN+sJqwBl02hsZV9nnlSZrGbiCEUr97EAN+ppKtY6YYQYty0iW+MDcf+9
 7uzDYQ65OnyxVS7Dn47IqgOr9fsDBeEGzX0ebdHeaBJpNgyu7cUeOb0yBRa2FykgQU7O
 DiMsCxqNJ4KniM5UfVHNcXwle0H/x0atg7cWg49O1qrMwhzOtHzaT1oAAczCxDbpKotu
 liYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=bI+EYmOEFXnD89qqj57pIShxgODbDqTPdUSqBffk7aQ=;
 b=LKiQJ8KfekF+bwfSz9Ma7gZSzfXPT5SpAwmtCCmb5QtpE/7lxg+n9GV3mYopRVtdJs
 +QSted+3ecALbbf1a890+h8G9EHTl++YkFN0FdOFic8J9gIfkV8CCAmZIqUIEgBHKn4t
 9sDiCV1q5QbPS3o6ZoBo56Ioo8nakxAYROWKrtrIMf2zPiSUyNcvSv80534ptKk/bBgQ
 ZWA15sh4PF6WLc90YGxe6jNgTNZ+Mx28P5k7jZBiGqgbXHIxINYiGUK/iFnY60VbBrio
 e87CbILCwR42FNxsKSvzpQgD1YgdaUyfB7MY+WCqP7yEl78UJGLWYGw04qUZrE9lidAs
 y2SQ==
X-Gm-Message-State: AOAM530TcMeKfVLCQqpAymdYHT8zqVUc1YnOvt3YkHIB1aBYc78Zz1Wh
 PCvVyq+vMCJUz0q6ZGq1//o=
X-Google-Smtp-Source: ABdhPJwODtilolyNAufVEE9Ec9tRQxqT4XZ8t2PUprm4pd1Nl3LPVR9zB5PTGWFzRgClv54MbEoxfw==
X-Received: by 2002:ac8:4e45:: with SMTP id e5mr27514519qtw.291.1595941581053; 
 Tue, 28 Jul 2020 06:06:21 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:95a6:f7d5:47eb:311a])
 by smtp.gmail.com with ESMTPSA id w8sm24226659qka.52.2020.07.28.06.06.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Jul 2020 06:06:17 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [openbmc-tools] dbus-vis: DBus capture visualization tool
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <1872ef34-0a74-4084-8098-424130f71848@beta.fastmail.com>
Date: Tue, 28 Jul 2020 08:06:15 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <35326E4D-434F-407D-B79B-641F757C1AF3@gmail.com>
References: <CAFaEeaE+xp89Q4dc0uS_-mdwy=ngb6-1XqnfdtTZ_1CW-GCE_A@mail.gmail.com>
 <1872ef34-0a74-4084-8098-424130f71848@beta.fastmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: Sui Chen <suichen6@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Jul 24, 2020, at 10:01 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>=20
<snip>
>=20
> I'm also thinking it might be time to start (an) independent repo(s) =
where we can develop the two, what we have is starting to grow a bit =
beyond the intended scope of openbmc-tools. Looping Brad and Andrew =
Geissler in here to get their thoughts.

Unless there=E2=80=99s a pressing need to move it, I=E2=80=99d vote we =
just keep it where it is. Once it=E2=80=99s matured a bit, y=E2=80=99all =
could propose on a move to a separate repo. I wonder if this even needs =
to be under the openbmc namespace? Seems like a fairly generic D-Bus =
tool that could be useful outside of openbmc?

>=20
> Cheers,
>=20
> Andrew

