Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1753B71DD
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 05:22:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Yhwr1Sz6zF4nQ
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 13:22:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DTyF3Kpa"; 
 dkim-atps=neutral
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Yhvt6yXPzF4kk
 for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2019 13:21:30 +1000 (AEST)
Received: by mail-io1-xd2a.google.com with SMTP id v2so4219009iob.10
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 20:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oeltgt5V8D7QZJqQTgpzjltFbBCh9AGyfMKBYAn8IP0=;
 b=DTyF3KpaS3zBGgNl+uI+sjsvUVYBcGDMWP6HalovdFxo+FpIOt9kleetnOV++FfmKR
 naKduDY38RPRGXVEk+3QB02LXn5B4I0uGVaoDv+fbLamomaetniJTC1npbWzbOpaBuM2
 NQWfalMh1n+ctIrxpQXGNiDOm7PXxhKzQTbXIV0EdIIICesdx/oGWeAwaWDGmkAuibPX
 gCvh0GyB3RrEmeZ7eLt0oK213AaTA03tJZY02/JIyH1LOU97vl3SBfIbdp3sDzABLJrM
 gSb6N7KoFQJidKwGFStFyo2cahH5ahBm2feGQzoiS6wTStCJtFDVOC7vqStGNyLhHavg
 GXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oeltgt5V8D7QZJqQTgpzjltFbBCh9AGyfMKBYAn8IP0=;
 b=MZ/+SEx5LnY+t8YvEjtlo7yRg/aFUgHJk1pz+Ijpoy5Dhm54rm8sH7rtk4u/Z4KRRB
 +Wgq+W10JVyke25VLz6sPQzh4W54YNu4f39rTczsxGgaraA8mEgdMzKgEBHdLoBwfK5L
 a7Dkz4yGMJrUkUHyDZRApYKDALcZpZx2xLYwkNzOg+h+4QOuTOz0v2YQ/imCbBYvOutm
 yrwv1Av1l6+A1dSFsN+8nqlIzJqCIORwLPcozVXNYpvw5lET8QZ+n7G4puzI0B49tDSO
 mxR0hsqex3WxhrtM+iHImxLhpQd+8NwBCegANAFUrHxhl9SofXPSqdYTF00F/CGcjM5U
 Po/Q==
X-Gm-Message-State: APjAAAXa16AiNJ6gVUkJYale/94tt/esZh3vzFlbGBP/wMW8AEWKoa5g
 wqpbifXYIT7SXc1WWwDdYMb2s2ByeHAzglNoUx8=
X-Google-Smtp-Source: APXvYqxX2WTBCsDXG6FmF8JQh09GMU2kGK+wj68+wpR+R6U6zwxnRh1jalPYwkMxZgcXbYmezBOmTA8BQwcqHLKvMFo=
X-Received: by 2002:a02:3f12:: with SMTP id d18mr2657005jaa.39.1568863286737; 
 Wed, 18 Sep 2019 20:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <857927E9-F872-4F90-A938-1B0635FB230D@fb.com>
 <D675A182-7304-4991-A5A5-261FEDAB62CA@fuzziesquirrel.com>
 <3EACE35D-7F22-4B2D-952C-7B9390C9BA3C@fb.com>
In-Reply-To: <3EACE35D-7F22-4B2D-952C-7B9390C9BA3C@fb.com>
From: Lei YU <mine260309@gmail.com>
Date: Thu, 19 Sep 2019 11:21:15 +0800
Message-ID: <CAARXrtke98Da=kWKxJqpvNVf-ACe9jA64zJeeFRX+0duCURsCg@mail.gmail.com>
Subject: Re: Some Recipes Randomly Fail
To: Wilfred Smith <wilfredsmith@fb.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Sep 19, 2019 at 6:40 AM Wilfred Smith <wilfredsmith@fb.com> wrote:
>
> Brad,
>
> Here=E2=80=99s a Gist of my console from a bit earlier today. Infinite sc=
roll buffer is very convenient sometimes!
>
> https://gist.github.com/wilfredsmithatfb/6dccc90020dd50e139036fe85bd91969
>
> On this particular occasion, the CLI11 recipe failed, which I don=E2=80=
=99t remember happening before.

From the error `fatal error: Killed signal terminated program cc1plus`, mos=
t
likely the memory is running out.
