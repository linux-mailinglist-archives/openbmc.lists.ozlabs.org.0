Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2859C16F9A
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 05:44:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zMmZ39fbzDqMN
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 13:44:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=wangzhiqiang8906@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gNrk12ly"; 
 dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zMlV5LSmzDqLT
 for <openbmc@lists.ozlabs.org>; Wed,  8 May 2019 13:43:47 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id s7so10754290ljh.1
 for <openbmc@lists.ozlabs.org>; Tue, 07 May 2019 20:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s/iZsKD/MZ6SZSDwY2u7uKXxB1xkYJ6sVJuZQfnIoLI=;
 b=gNrk12lyga3Eb7+cbc4a5mMD5Zn1HGrcV++qyiJvRBnceMyTGQ+3PacLSN6RJYyN4P
 J3705pZMNQOSlvlhwacgeC/+4KBJ8WAvKdaCsWEsopkYupsNLVQ2sdZDLSsCjU0fRNA0
 vGBF+JdH1RLKshWdyd8AnZOj9qJy6tAmWj40ml15NWq9o0aAJ9+vopw4+PnIJOjY8Ica
 +4iCl8MtiM+mHFgBf1rbhRhIS55CrH0mv60w4GqUYGd3hWL5FFuEHP5PKAvovD2iEjts
 ZcEjB107i2GvJahIOoynCYDfQXwsFIgRceSBrBEmTt5CtBiNRl/JiwGBlhdyUOiTBpOY
 sDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s/iZsKD/MZ6SZSDwY2u7uKXxB1xkYJ6sVJuZQfnIoLI=;
 b=ZDJ1h4LlVKLquN3qk94oKFX1mr/F/eKciaDWMFWn6LNHF3wVQwM6EoU9AFXDouzZ60
 I2TGucYzIsO2N2piQkpGjYO+SkcBG/Irz18iSweddNNg24cU9RUeK+mfflNMqhVF7cVG
 3fNj+mZavYsVmWDz2CtvAgOts56V3YqylGjXuIuEVM2dajrlulmHdKjFvDXMU6Wonqu8
 YUE8mWPxRBTYIFHbl0mXhIrvMeAV7v3PWsOy6C0tM7IoWt2Cgc8ravb9UAw3L10w8FBO
 8m6FnL9V1+dtWAGU6gMrtnfviXgaJyFIQCS7ryvnlrFS3qqfPqSP1lexj6STTsxNhC5a
 hY1Q==
X-Gm-Message-State: APjAAAWM2lyhpEu0XglwqYShrWu/g+sbVNjzWzG1FH/I6NER73Tprx/i
 DNBjYIX7wuyvWt3/c2c68KO+sS02YBlTjbn0iAw=
X-Google-Smtp-Source: APXvYqw6gqJPbwwaiY5abh3eKCcRuwbtXMVGgzhsFIJ0967OWBgaOvJvLDhILsixrfjSB7hr17Lic0X/Sbi4abARzq4=
X-Received: by 2002:a2e:9c89:: with SMTP id x9mr19213143lji.28.1557287022195; 
 Tue, 07 May 2019 20:43:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAO9PYRL4Pr2hV=Hz5dvTJzhx-x9WPJL12qZEKuh+DiCWx2RMww@mail.gmail.com>
In-Reply-To: <CAO9PYRL4Pr2hV=Hz5dvTJzhx-x9WPJL12qZEKuh+DiCWx2RMww@mail.gmail.com>
From: qianlihu <wangzhiqiang8906@gmail.com>
Date: Wed, 8 May 2019 11:43:31 +0800
Message-ID: <CAHkHK0_FCE=QHF6tdD3DyGNcOMZHkhrkAZmgPwQ0Lr-G0-e9Qg@mail.gmail.com>
Subject: Re: Is there Intel node management support?
To: Deng Tyler <tyler.sabdon@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, May 8, 2019 at 11:22 AM Deng Tyler <tyler.sabdon@gmail.com> wrote:
>
> Hi all:
>     Is there any package support Intel node management in current openbmc or plan to support it?
According to my understanding, you can refer to these repos:
[ipmbbridge] (https://github.com/openbmc/ipmbbridge)
[node-manager] (https://github.com/Intel-BMC/node-manager)

Also need the ipmi related patch here

https://github.com/Intel-BMC/openbmc/tree/intel/meta-openbmc-mods/meta-wolfpass/recipes-kernel/linux/linux-aspeed

John
>
> BR,
> Tyler
