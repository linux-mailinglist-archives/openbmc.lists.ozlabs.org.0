Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E29F298961
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2019 04:19:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DSsN63MmzDr48
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2019 12:19:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bD2iZoFZ"; 
 dkim-atps=neutral
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DSrL0btTzDqQf
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 12:18:39 +1000 (AEST)
Received: by mail-io1-xd33.google.com with SMTP id i22so8808143ioh.2
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 19:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qDRqya7Bj4oIoF9/jcD1Y14my3K2WquhgbMTJ+Z+Abg=;
 b=bD2iZoFZbpIPgPGN/r0L5zRGsnExkY4fkIdgUoAbdZ05VPGNhCTrdTGyS37s5/ufNQ
 DJLgmucTFm8QA2ZgrnUAxRvHYEzW/AiDRoB5mMHvZKwQzSWo9vjbCr2/os9Bq5sh3cDg
 w0ljJGP5JEVL20/bu6UGAJSkuKMKopocteCqHclpxPOsqnmb/ic3UIWRLy8UujNyqXIm
 /AYNRQZK/9E4Ykbl7hoz4B+fHLEKblR2yhQpdlAus45qWKzcixLXAvn9OaHI9f0NsXSw
 WKCU1duwd1+IQkNv0F4ITPmSAqMcsYXTexgltpySYSJSRUGoH4kOcByWNR5+sBKnUMTo
 nyNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qDRqya7Bj4oIoF9/jcD1Y14my3K2WquhgbMTJ+Z+Abg=;
 b=GZtQzQbCGQ8SXMQU1fospF6oFrMWGKpsDE6NGCJGVeklISWispzZUcqpC524NFAOsW
 sG8dN82/swbDw5NNV+Av2PqjqFX7llVK9fGrYJ/mYvkMFrU6ZSZpNcI3gPAwo7qozFiQ
 e61q+pDljRHKBkhWSZiLSmImmw9uDhTwNr8wS4ApfIecWsY0EKClcueuQ1VXRn3czF2G
 7yaXXPYknzyUSV2rEoXK97+1qjMxkM76Re4O8OnmA/bHvTDgeyvsRMuwZdqLAiJlwP2+
 ny1YITZs8PsriYwWzVbBpWN7SkYHP3inFGHbQol79qIj9bDiSIe0dM2nHBrq/2NBfogp
 l3IA==
X-Gm-Message-State: APjAAAUJfaaHazkMhnJrgeSwv3hsCW+oPZMwS2BCU5/KxowAAEO8Ca+B
 AOJFcGBMZfuTgG/ec1JUG30ao5g8Erj9+h4x2Hk=
X-Google-Smtp-Source: APXvYqzDHHgnFQ4cEjNQK4p03swmJlVYHpxQbi6TF7mypV3EyWe57H3X7dpWSZJ7XisRVjfBRA/i+Ovknxjo+4D8raA=
X-Received: by 2002:a5d:8b47:: with SMTP id c7mr30936073iot.42.1566440316155; 
 Wed, 21 Aug 2019 19:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <E413464F-B8BD-469C-8B58-432C25DEE77C@fuzziesquirrel.com>
In-Reply-To: <E413464F-B8BD-469C-8B58-432C25DEE77C@fuzziesquirrel.com>
From: Lei YU <mine260309@gmail.com>
Date: Thu, 22 Aug 2019 10:18:24 +0800
Message-ID: <CAARXrt=SpBeZ+kcg5zjTZ2mHr7Q1YCbNLPJrqaqsBwbv8-AfDA@mail.gmail.com>
Subject: Re: witherspoon-pfault-analysis repository rename to phosphor-power
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Shawn McCarney <shawnmm@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Matt Spinler <mspinler@gmail.com>,
 Brandon Wyman <bjwyman@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Aug 21, 2019 at 8:52 PM Brad Bishop <bradleyb@fuzziesquirrel.com> w=
rote:
>
> Today the witherspoon-pfault-analysis repo has =E2=80=9Cwitherspoon centr=
ic=E2=80=9D
> support for some power (as in power supply, not power processor) function=
s.
>
> Going forward, IBM is planning on porting this code to several more of ou=
r
> systems.  We also intend to add new features to it.  Some of our partners
> have expressed interest in working in this code base as well.
>
> There is nothing inherently power processor arch specific or even server
> specific about dealing with power.  So we=E2=80=99d welcome contributions=
 from any
> collaborators from anywhere in the openbmc community.
>
> Given the above and barring any objections, we=E2=80=99d like to rename t=
his repo
> to phosphor-power and have it be a place to collaborate on any power
> related functions.
>
> thoughts/questions/concerns?

That is good news, which makes it easier for partners to extend the feature=
s.

It's noticed that there is `phosphor-power-monitor`, is it the repo to hold=
 the
previous `witherspoon-pfault-analysis`, or it is a separated one from
`phosphor-power`?
