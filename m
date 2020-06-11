Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D491F68E0
	for <lists+openbmc@lfdr.de>; Thu, 11 Jun 2020 15:12:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jPRB5XDMzDqg8
	for <lists+openbmc@lfdr.de>; Thu, 11 Jun 2020 23:12:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52a;
 helo=mail-ed1-x52a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=KuMSfC0O; dkim-atps=neutral
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jPPr6rpwzDqdv
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jun 2020 23:11:28 +1000 (AEST)
Received: by mail-ed1-x52a.google.com with SMTP id q13so3896015edi.3
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jun 2020 06:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/2JesGaGuIiy4CP7EbOMoiRgYgGOtVXE6SRQ5ILo9zo=;
 b=KuMSfC0OU7sHcsu9pSVMjpCUo8zIOfB5hmbW1xKGB7evh2L1bj09Gm07WZREG1d1kT
 ocOBaBEil2Z4jnSKAIv4uRHYvSMK9SBAKX7P7r21hq8VK+2qMpYL2luu9FScG70No6K4
 JzpaVLzQFcDpDZOVrV7dajOAdZey9H9LVh/IA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/2JesGaGuIiy4CP7EbOMoiRgYgGOtVXE6SRQ5ILo9zo=;
 b=qYDCIe+Tofu4jRdrG5hpfmzCBh747lyhX3YFvXqe2WViseubmICAewwLXjVBHRK4WK
 f+Gt7OsuotGU7656irGpY0Cn0Vy5sh9tpcvIWpPGVz+uY7ZMsCJ4dduhtoHrZRGS+GFi
 iOwWOfzYpzJLbb6P5Tdfji4ffrw0515VJsE6jqY3hLd90lX01bjXidHUmaQHSoMfQILQ
 geeSf0KlLzeqD+GMsQmG8Y/tmlJqTOpj+kIsF7Tv628N7a9Mx7X8IySoIO91Gs62GHYL
 mMLXc/yQyH3VAuVeAkRT+bBQ1t0rpouoUMFuWkOEtpHjFn/Rt1UbHoRog3HX5QqCh2oT
 rEqA==
X-Gm-Message-State: AOAM531lFKrmBRpSBzNxp6azHxRqRmD87czhZU74kbmFNQgpdwhOtEyR
 1Mcyeje+KTtF+obGbobMUi+ZVfs7k9ZA4GEV0JEhR6Gw
X-Google-Smtp-Source: ABdhPJyWUlFbCL7VQ9JTyxN44qcxGmOPWHUqP5t6Q8X+szr4auK8w4KcseAKlOSe4HQAHFW4q69F6eYLdPhmpHpP7ys=
X-Received: by 2002:aa7:cdc6:: with SMTP id h6mr6550142edw.191.1591881082293; 
 Thu, 11 Jun 2020 06:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <14ED9A00-19D1-43BF-ACFE-5B9937188DD4@fb.com>
In-Reply-To: <14ED9A00-19D1-43BF-ACFE-5B9937188DD4@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 11 Jun 2020 13:11:10 +0000
Message-ID: <CACPK8XdyYGwtfETRxyPXDhWi0YWd_ZeXJTazRpC=hGPiW9LeuQ@mail.gmail.com>
Subject: Re: OpenBMC Learning Series
To: Sai Dasari <sdasari@fb.com>
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
Cc: Openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 3 Jun 2020 at 18:11, Sai Dasari <sdasari@fb.com> wrote:
>
> In addition to these ongoing efforts, I propose to start a video based learning series that aims to introduce OpenBMC stack for a potential contributor.

Great idea Sai. I have signed up to do a presentation on our Qemu efforts.

Cheers,

Joel
