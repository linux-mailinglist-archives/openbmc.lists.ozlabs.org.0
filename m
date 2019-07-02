Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACE75C9F0
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2019 09:27:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dG5m4SXtzDqRX
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2019 17:27:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=artemsen@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="g22TK2rh"; 
 dkim-atps=neutral
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dG5D2fcjzDqQc
 for <openbmc@lists.ozlabs.org>; Tue,  2 Jul 2019 17:26:39 +1000 (AEST)
Received: by mail-io1-xd35.google.com with SMTP id s7so34683784iob.11
 for <openbmc@lists.ozlabs.org>; Tue, 02 Jul 2019 00:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tDoGMSqnL52CQRXNuB6ChgCEofeAh4p5FUq7hNZGOw4=;
 b=g22TK2rhBJJc709Z22gOwrM1TiZSKB2F5ErzkcY72AFq4xtiDVfGjnPTWkUGFsZhmf
 Y+a9diDW7hLU+aRe3iunLzWtoUAMfoxKPNVlmco9zPeRvdWMDkfTvuXyi3TMAihFYBQv
 Dc5zTEppc5QVtKxc4aX+G/dAXL7JmubaVoUekg5yvEG4ppXuJpcpDqaumEssSO+VoJAr
 yjwc+ZIjzz3lNjZzXA7nPTKfQolHD4rNxJNWY8fxC6YVUG7tYcsTI94Smu/Hc64Q5Pqh
 oiq4U0N6/q5vAUVyA6ywWZi6LSb2BK0jf4WIiR2+RB+6ah8oehYqVAX6bFQbD+mmMkHC
 Nxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tDoGMSqnL52CQRXNuB6ChgCEofeAh4p5FUq7hNZGOw4=;
 b=Jmw6Sn9gSFp3y4jt//6OleKkFVakpAFSMQ9+d5SembozYKvNrN0GzbVg8k17Cx57BS
 wmefRj6tGzCAuflfYmZfg9WjRvnkugHrGGhnUMv6AuBJN1UKbacPmDN0BDGLxENxgmLB
 HehiissSxJwmFxnvWpHBGUZ6LDudT3q4vcUAvhAxukbGsMvUd4fNmiBMcnIfj72WQjXI
 6gsFtPhDfzki7M3yAi/up6aTXoj3gQmuNkOuVRcXNAHri8HUv5r51Fzol3GmhNy/Bdq6
 Rf30vXahjaaEk12ABqhwZY5nV6ZCv95gZkOgAQclf56iq+t3HB9Os1x+yb54GtSZ5Ep4
 61QQ==
X-Gm-Message-State: APjAAAV96DQSXEllIkeTcZrrVbuY3Cn+kXLHXKRBluBEAVqr9fvvpJaw
 iFR9XSkDXE856kGH97Fvf3PK88nuP99R8PaUo77Y8G1V
X-Google-Smtp-Source: APXvYqyDCAUayvyxxWCNA12oabBYWkW/u6ODD1f2ezxgP9ZhK9mhwQsYTBd5CIaEnzvAIJK9+xJKcRZITpC5kAO6tcM=
X-Received: by 2002:a02:85ef:: with SMTP id d102mr35305473jai.63.1562052396497; 
 Tue, 02 Jul 2019 00:26:36 -0700 (PDT)
MIME-Version: 1.0
References: <BB3AF06A-F1A5-4999-8D8F-BD58F39D68D3@fb.com>
 <CACPK8Xfa_VWRp7_Waxx0x+xKK7kWv+ugjdFNoMcb5MziF3BUwg@mail.gmail.com>
In-Reply-To: <CACPK8Xfa_VWRp7_Waxx0x+xKK7kWv+ugjdFNoMcb5MziF3BUwg@mail.gmail.com>
From: Artem Senichev <artemsen@gmail.com>
Date: Tue, 2 Jul 2019 10:26:25 +0300
Message-ID: <CAHsrh9LCHA=--3nWjtb0Z-HvrWiK9Cp-X95RMKFgEzjCGAsopw@mail.gmail.com>
Subject: Re: obmc console history
To: Joel Stanley <joel@jms.id.au>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

https://github.com/openbmc/phosphor-hostlogger
if you need to store logs permanently.

--
Best regards,
Artem Senichev

On Tue, Jul 2, 2019 at 8:42 AM Joel Stanley <joel@jms.id.au> wrote:
>
> On Wed, 26 Jun 2019 at 19:43, Vijay Khemka <vijaykhemka@fb.com> wrote:
> >
> > Hi,
> >
> > Do we have option of storing obmc console history somewhere which can be referred later on.
>
> obmc-console-server writes a log to /var/log/obmc-console.log
>
> Cheers,
>
> Joel
