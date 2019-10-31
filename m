Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD63EB9B8
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 23:32:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4740SZ4rkvzF4Wp
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 09:32:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="aJ78opXi"; 
 dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4740Rl4T9pzF45f
 for <openbmc@lists.ozlabs.org>; Fri,  1 Nov 2019 09:31:46 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id a18so2237461plm.10
 for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2019 15:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VUUVATxYg1KsbL4Om6UWY1izCqq70pMY2ITb0Vu4KU0=;
 b=aJ78opXiaHDpiwhForeCrHUQMd+o6kYL2ULtJaxsaBp9bXLuOBAYZuc2FD1nUmW6Rs
 XHmMqXfEOaPmp6jjt+gkvv2zdoC5PmqRHdF5Xws8v9biRkIgdK+psNVUwPRUOi8hE95T
 NaxI6GQjKvOjRrqfXNL9BEq/l99vLtH5kW0ER8OdzS7g1IX+soJZSWBNLvOOBIxaGSJL
 EgTNyW/PLE/5CL+BX53X3/MlIbheMHk5SEN2k1tbIru6m/WxVreajDM9D7rU6KMHv2zN
 A8BxnoRC+HLk0zWC11F4CVO/oXlQDekOfcgof28rrtugnV4OaWQjlt22732bZllmJrPy
 xBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VUUVATxYg1KsbL4Om6UWY1izCqq70pMY2ITb0Vu4KU0=;
 b=Lh3CAlni8WKWSLX+93SO5e8QToszOqbeaK/1HysBQDP/aywYi1B95F3kSXXsB3qEN9
 l7Za6mCrgOQ7/ysQSmpE3K5nE4ALs/qeInSFXNUAo98SjVPqsLdqnYbjQDlBIkpP5SlE
 WjQiHK7IDnjxl7oo4rhST7rg3yEynftSN4+QXaBylRHmrWmbYkJQxZmSLMlkF/38T/G2
 Y0HuD04SXv0I+vcDsxR8XC/5b6EdjMHX2FoLRHfFNwweCAAVRCodEotI3Jv8dRTFMd4P
 k0MGiu0wEsWgMY3PAeuZFpaQYwM6BGxFvrcUtTR7QABA5ZD0xYgE30B3myMTVybr0noh
 DhSQ==
X-Gm-Message-State: APjAAAUE137vEv2PIr34SDB8Z/56XGJVCLUJJJ5DvWuPSl7RuO/X2YBg
 AH9hdfPos0pGPVUvFm1CYaaxF21HpfDpL/y1WAVEtw==
X-Google-Smtp-Source: APXvYqxuy8N/lSG+HHVtJ7EDmON5IrXz5nO/SHJlw9njqA1US/f5ZykbJuLrq5Etco/AeAP3ra64piF3nQl1rsEoQl8=
X-Received: by 2002:a17:902:9b83:: with SMTP id
 y3mr8810893plp.179.1572561102913; 
 Thu, 31 Oct 2019 15:31:42 -0700 (PDT)
MIME-Version: 1.0
References: <fed4bf71fdbf452f955f527b20c36c08@lenovo.com>
In-Reply-To: <fed4bf71fdbf452f955f527b20c36c08@lenovo.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 31 Oct 2019 15:31:31 -0700
Message-ID: <CAO=notyoynBRNHg9fgPX1QgJ_kghX_=uKbeJ+CCmsv5mPubNKg@mail.gmail.com>
Subject: Re: FanPwm interface
To: Derek Lin23 <dlin23@lenovo.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 31, 2019 at 3:27 PM Derek Lin23 <dlin23@lenovo.com> wrote:
>
> Hi team:
>
>
>
>           I have a question regarding of FanPwm interface on hwmon.
>
>           Does this interface get updated while PWM is changing in sysfs?
>
>           For example, if I setup a fan points to a PWM like below config=
uration, now, FanPwm interface does not get updated when I update PWM in sy=
sfs, only my fan inputs (rpms) do.
>
>
>
>           Example:
>
>           LABEL_fan1 =3D "FAN0_Speed"
>
>           =E2=80=A6
>
>           PWM_TARGET_fan1 =3D "1"
>
>
>
>           Is there a configuration or label which I can use so FanPwm int=
erface would get updated when I change PWM in sysfs?

Unless I'm mistaken, it's currently treated only as a Target -- so
it's updated only via dbus calls to set it.

>
>
>
> Thanks,
>
>
>
> Derek
>
>
>
>
