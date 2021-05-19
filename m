Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DCD389A1D
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 01:52:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlqRw2vsvz300K
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 09:52:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=P7JJ918U;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12a;
 helo=mail-lf1-x12a.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=P7JJ918U; dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlqRg4n1vz2xvG
 for <openbmc@lists.ozlabs.org>; Thu, 20 May 2021 09:52:30 +1000 (AEST)
Received: by mail-lf1-x12a.google.com with SMTP id q7so20328450lfr.6
 for <openbmc@lists.ozlabs.org>; Wed, 19 May 2021 16:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=n7Oe0V/LUeDNOz9LkGrom9GQWiVN8MKh46gdzx9kyn4=;
 b=P7JJ918ULNWha1Y2qK/4BUen5FQObNbFSdCHY6KFXjpvaIDcPFreflGKgQm1PkPHZc
 gqthbxu65Xrl95/rB3Bt4Sz4D5ImK0uJxzi5bQu2Exe6Jer9iWOqC81COHBH4tzCebp8
 yshZcI27WA/rrWi5mVRVguOki08ih/MbvEMNpbAcGwnJDIjCerYFKQLcsMoH5yXpEns8
 lIisNKxRhCcNSnAeI2jYifAwMLN5c+ijx4o7Qyu+wTdB6oUSgwew+5M/oRE0CN7oAKR7
 c9g9BS8qiMewuOgXE8yLh3sZp7eKBLbGUVaYXdAWCB8mkmj6RDxlbf7exaKZ2iRAlw1o
 NV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=n7Oe0V/LUeDNOz9LkGrom9GQWiVN8MKh46gdzx9kyn4=;
 b=WCnW14b6hc/usHg+qv2Y3dlyrxHDGtBEtuWwtnlVi41bH1ljmeKq13vQsqByaoFC8M
 IJ8loJ1B5gJzS55n+Iq8QduAL+yRvDRweuMHQZT0rtPovSUqUP1EiJQ1vYKnwDMHvUHD
 M257ajtOyf0HOHWNQ9GruJmYSlTb2aTZWdk8tNYvtf20zN3MsZ4I1A8tegaXlBhlnkAC
 zjzmRN05lBwHLt6b451o6jT4dwRCoNI1NIL43Mms7hPbM4qKlslCDSxSfijDwS6lJ2/0
 MrGZ8kFm4UEah11uRbCcziQXcG8KKLa+SLW31SJqGzJdowRyWbBqyQG3itl6XPyjGmVE
 MZXQ==
X-Gm-Message-State: AOAM532yaMDCS5sT5jqAEOsprjm9UjUuZPFCpWjbFC3YnMZeUvAak+nf
 WD53ZxjAzSvP2ekdKPrk40TSfHHn60nEUZFD8OKCHA==
X-Google-Smtp-Source: ABdhPJx70MZQEQx8AgJ1R/ChQ/H4NYiC4ffvNrsd2zJ1jxM74BJtoinqAm4WkL0RKVNfL+N3CSxXneaPIlCwoe32Xjk=
X-Received: by 2002:ac2:544f:: with SMTP id d15mr1357798lfn.465.1621468343155; 
 Wed, 19 May 2021 16:52:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210513160947.1716185-1-j.neuschaefer@gmx.net>
In-Reply-To: <20210513160947.1716185-1-j.neuschaefer@gmx.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 20 May 2021 01:52:12 +0200
Message-ID: <CACRpkdZLeEDipA1C3bjHF9J=JELakhKaxCsm=uDfVYsHpG-twQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: npcm: Align a few entries in the pin function
 table
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, May 13, 2021 at 6:09 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> The entries for GPIO 33 and 34 are not properly aligned. Fix the
> alignment.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Patch applied.

Yours,
Linus Walleij
