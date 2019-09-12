Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B4FB074E
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 05:46:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TPnj6pHjzF3yb
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 13:46:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="f9U1W0zP"; 
 dkim-atps=neutral
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TPn90RcJzF3ph
 for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2019 13:45:47 +1000 (AEST)
Received: by mail-lj1-x231.google.com with SMTP id y23so22146043lje.9
 for <openbmc@lists.ozlabs.org>; Wed, 11 Sep 2019 20:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xFFTLeEL9iy3kLN8mW04usy2sRCQr4N9+2SqKBFChNg=;
 b=f9U1W0zPfAwVUB9/wMCnOn1fnOy4zTp0lfZEqj56jZNeR8cmAr4l0KBTV75CbM4r+Z
 9r1qIVqhjgQAowllFgeH/9zEzBfZlToI/2Vg5ne0VLuCwBd0x5RIA5qoQTy8AEfRbaSK
 01jrpZK65WCm1I0Vpq0UvXTXp65xnpXzwVZN/tYDcsocXQXK2UXUamhZbef6yG7BrlvY
 RkyCdlaLDbRrXrzVREmSYT+kisMNCQaAwvpsVDYpiaoAeGkG4YFcYBdCbl1wuC9EnePV
 dAtdUfPIEnnA5/eH1Dr31Z5aAbyE/szJwxervtVbK7SaAxUhYLtJY5hkgXz0uVpizWOW
 2sMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xFFTLeEL9iy3kLN8mW04usy2sRCQr4N9+2SqKBFChNg=;
 b=ToFF6ooBxz9CHA1cDy25EN6MmIZf1847tETxZufsN0STLeMosTH+r6AFw7K2QUVUEt
 uQNp1EygwldSOM4x5+5/aMANY2CK32k1T3CIZzGD6Lc1A39sK3qF/Y1E9od3UiYWWqqw
 bniNQwgfxKv4y6M7JIkWVoi4FmVyXmFNZ+YFON45PKicUfOPNEFBftFAHztZzq8YiHlF
 lG03+xt8poS8ENyyehEKH3MEEenowFkhtV9DToSrMLVhTRlDcNOp+jc5Y2/aaWot5DO4
 WCrVHId/WA0FvRJShgo2gr80Al6a1ODlKsu7jkzlitTGmXdu7kOzwkhPmUBHWIpL3T/X
 b4eA==
X-Gm-Message-State: APjAAAWqTNUvCioPDz14DVoCHE998khY4CnzxJ0iKbVeHwyafoCa2zZg
 l9Gdll7mnwmPjLt83re5z8KOKiIJf7BuKnNAnt8Ylg==
X-Google-Smtp-Source: APXvYqyC19pKSKPGC9CtqeLWTIbrF3M3H0VEBEAB/QnJifPfbnCe/1NZYDDVKN0aiPQi5OblPS/KQL/iRTZRVycJaCg=
X-Received: by 2002:a2e:9098:: with SMTP id l24mr4705891ljg.0.1568259938153;
 Wed, 11 Sep 2019 20:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <2d7b6a6d.52d2.16d2372efd5.Coremail.xiaoqian1641@163.com>
In-Reply-To: <2d7b6a6d.52d2.16d2372efd5.Coremail.xiaoqian1641@163.com>
From: William Kennington <wak@google.com>
Date: Wed, 11 Sep 2019 20:45:26 -0700
Message-ID: <CAPnigK=RCCa41ya98pgdmB+A1SK16o4XwbLBWa_g41vzgkm47g@mail.gmail.com>
Subject: Re: Fw:How to use gtest/gmock in openbmc
To: =?UTF-8?B?5bi45pmT5piO?= <xiaoqian1641@163.com>
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
Cc: OpenBMC Development <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

You need to have all of the requisite packages in your development
environment, then you can run
```
meson setup build
meson test -C build
```
which reminds me, i need to update the documentation in the readme...

The easiest way to do this is to use the docker environment from
https://github.com/openbmc/openbmc-build-scripts, specifically the
script `run-unit-test-docker.sh`

On Wed, Sep 11, 2019 at 8:26 PM =E5=B8=B8=E6=99=93=E6=98=8E <xiaoqian1641@1=
63.com> wrote:
>
> Hi, OpenBMC development member,
>
> I'm learning openbmc via github.
> I wanted to test the code of OpenBMC through Gtest/Gmock, And I Found the=
 OpenBMC source code already had the test package,but it cannot be compiled=
 according to README.md.
> I think it may be my compilation method is not correct, Do you have any d=
ocumentation about this ?
>
> Could you tell me How to test "sdeventplus" ?
>
> Thanks very mouch.
> Johny
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
