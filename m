Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 211CA199D4F
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 19:56:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sH7x3jZ4zDqQB
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 04:56:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::136;
 helo=mail-il1-x136.google.com; envelope-from=benjaminfair@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=NJaMXRTR; dkim-atps=neutral
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sH3t23RtzDqvV
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 04:52:51 +1100 (AEDT)
Received: by mail-il1-x136.google.com with SMTP id p13so20276908ilp.3
 for <openbmc@lists.ozlabs.org>; Tue, 31 Mar 2020 10:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f9a8mYo4cVm3ZebkuNHpWlS2MY/Wdncn5STpKbGzQkk=;
 b=NJaMXRTRrRezd1SPEeAE3cphXQ88o7fCpy97GUf+8sR8hX7tToKlfrTHeaegfOmP7I
 n3FNO2up4QAan9DXcbPJMXflR2jp0xN84Dx9rp/lmpE+y7+jpKPH0GR18sAFNl6lKajf
 NdEMs6JTp+nhGtLwfj/ylsq2+zjK0Lxr/59uEeKnX2HY+IesuT/aK+77nvNB6j83HecX
 NrqeZEaTVYNngplDOvxqMxRh0d54iQONtCjvbSbD58C+V+WrmNZW7GB8ZZ3HPr0iEDQz
 MK8a9wRvl1gz29gDJBsgoyvqX74OH/IqNM9pAcU4w/n3Dfo9fkbE6q2e8QPQO5NdcOMy
 p0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f9a8mYo4cVm3ZebkuNHpWlS2MY/Wdncn5STpKbGzQkk=;
 b=OliefpmVqwNwji9tB0cVk+XVTWRk6MlkMbjugA+spaYNthuuXAIEQqWNfZvG35pVqK
 UXWko8nopriH/fPlE9EsSlikUGElRucYJqQtATSDc6jDNYS4dl8EvTY5Pu/2ZZySi9kh
 8wDQf9ZoiQiz7AWdLKmyaoHoDHcN47vd3y0koRSd8bXwgsvYotzd7xlcBD7SozktpHpc
 SZVvfhmGy1DjPtN2EN8jrIQVZgYL9Y/rovqXaYof71QUg2DebTz8794c1V3lyjITq4T3
 jervAWb12SwqslyaOmPB55Xh6WqGowRjLxBaX3PJ5Peg30GZqCuJ8jELMk7yK3js28Yv
 miGg==
X-Gm-Message-State: ANhLgQ2axiOHN0VhrzpWokNwnzvQWYcageEWiVz1KhaPW3niyUVvQ926
 jbuCUhdjdTS00na8G/ofNbsVTfONaIgKpmX0B8eIAA==
X-Google-Smtp-Source: ADFU+vvyc8Afm18OhUsQKSIXqAQEctM1RBYbHFLCUfsYaYOxT5b+p9LvmHOS0F3j0DBcHareeFkEU+CkUGqxZkBze7I=
X-Received: by 2002:a92:c809:: with SMTP id v9mr3544334iln.126.1585677168540; 
 Tue, 31 Mar 2020 10:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <F69B446C-E70B-4B04-83A1-618A4F60E965@fb.com>
In-Reply-To: <F69B446C-E70B-4B04-83A1-618A4F60E965@fb.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Tue, 31 Mar 2020 10:52:12 -0700
Message-ID: <CADKL2t6nach67q57ca==uqHHEVCf=+F3PBOcQ1v0ZAazk6Yr+Q@mail.gmail.com>
Subject: Re: Chassis sled cycle
To: Vijay Khemka <vijaykhemka@fb.com>
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
Cc: "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 30 Mar 2020 at 13:00, Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> Hi Jason,
>
> We have a requirement of Chassis sled cycle and it can be achieved by sending an i2c command to hotswap controller. Is there any plan to add this feature in x86-power-control. It should take i2c bus address from configuration file.
>
>
>
> Regards
>
> -Vijay

This feature is implemented on some systems using an IPMI OEM command:
https://github.com/openbmc/google-ipmi-sys#delayedhardreset---subcommand-0x03

It currently just activates the systemd target
gbmc-psu-hardreset.target and lets you register services to do the
actual hotswap reset (usually by toggling a GPIO). Having a unified
solution in x86-power-control for this would be great!
