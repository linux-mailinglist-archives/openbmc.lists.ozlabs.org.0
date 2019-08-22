Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C92A99877
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2019 17:47:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Dpnw4fYWzDqwt
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2019 01:47:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HS/xfd1a"; 
 dkim-atps=neutral
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Dpn66MJGzDqRS
 for <openbmc@lists.ozlabs.org>; Fri, 23 Aug 2019 01:47:06 +1000 (AEST)
Received: by mail-ot1-x333.google.com with SMTP id w4so5847004ote.11
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 08:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GIPU5Ae4pgVwUDbCz4T9wkgmBGVD/0tL9/S/7uHrtlU=;
 b=HS/xfd1acLhBzxClKrKz1f2fhlwY1cDTgnd4WjznuKQgol5mR8aoFErZYab3GUBlYH
 PJKKHZyIUkPHd+Qaj9eJk39l9HnKPvDIepK/piyt7i1WqYxrpQE34P2aXxWxMExRwWbL
 NHLjAf7v7vghU0SmvfzPeDE+ivJck2TeyMROwjJdaHjlJx2EzJOKk26X9S9EShVeC8oO
 Y0J1qV5WSAUtLbSFUfAB7/fRSs3aEmXqHHrvRw6PBI1bzUAqWxls9MVcSYHUDWx5j/43
 3RXQrW/WNjnwxJ4kZJ7cIPa8f9F8nTw6MVlSf/gNtoJgt4jN96itN7woL0MYIoOM7lG9
 48WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GIPU5Ae4pgVwUDbCz4T9wkgmBGVD/0tL9/S/7uHrtlU=;
 b=nBQ1VNPUICl+UmpF1eHWM8Ez7dKdpX+HdPKtBNACCZga6LgsCYI6JRbLknsvVsqzeF
 20Fvl9EhHe61XJvKEPERZQg6596l5Ae59xyxXSX+Mv9ghTT2sbbc94ovAa9f77JOMeRx
 opzLBoEzE2vdF1G8RBvt3N84HDkpiPSkXKBwCDBFAQ3yyvlOqnwi7Frjt6k+WvMqVoed
 qYI9g21GQ6p4KEyhFzxjL+2aY8EEpUr+lHs8dvDYSva49LUG4PAWBtHgU+SA+0Xc7iXM
 FzdcRe0aLn7HEyFZ8WDgtUL6xRAtsHtRI4U/WxzqDwPR4CtdNGWIgEWMmS9Fsnm7zPmb
 cojg==
X-Gm-Message-State: APjAAAUBirat9PVaHjQ02WtGq0qsSSW7CBelwd2M1Hr4NmS72s9qk9kW
 jJwZynjpKjCDw+9dldOS4ya/6m7HZdL8LZIS6zyQZw==
X-Google-Smtp-Source: APXvYqzBKw678YMFHex4xEC+7PrPLua2u19ly+Y+enjlz88qOP9itUOQ4qCXXUKCKdxEeyuyh7CdTVIISd4j8kCS8iI=
X-Received: by 2002:a9d:6a4a:: with SMTP id h10mr226574otn.260.1566488822174; 
 Thu, 22 Aug 2019 08:47:02 -0700 (PDT)
MIME-Version: 1.0
References: <d0c56bc73b384a0f941e5f4b96ddc73a@lenovo.com>
In-Reply-To: <d0c56bc73b384a0f941e5f4b96ddc73a@lenovo.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 22 Aug 2019 10:46:46 -0500
Message-ID: <CALLMt=rvTV0iUV9hUkXQyMF2yTOBQmfrpjZwqKD2X4LLV11j7A@mail.gmail.com>
Subject: Re: chassis power status seems to not be changed when type command to
 shutdown OS
To: Andrew MS1 Peng <pengms1@lenovo.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Aug 22, 2019 at 5:01 AM Andrew MS1 Peng <pengms1@lenovo.com> wrote:
>
> Hi Team,
>
> When I executed command "poweroff" or "shutdown -h" in Host OS, the chassis power status seems to not be changed. Is there any package could support update power status for this situation?

Sounds like your host is not sending the inband IPMI message to
the BMC to turn off the chassis once it completes the shutdown?

> Thanks,
>
> Andrew
>
>
