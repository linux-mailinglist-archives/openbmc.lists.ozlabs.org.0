Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E920A6B8656
	for <lists+openbmc@lfdr.de>; Tue, 14 Mar 2023 00:52:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbD353bkmz3cDt
	for <lists+openbmc@lfdr.de>; Tue, 14 Mar 2023 10:52:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YAQhIx0z;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2d; helo=mail-vs1-xe2d.google.com; envelope-from=theactualdbashaw@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YAQhIx0z;
	dkim-atps=neutral
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbD2T0flcz3bh3
	for <openbmc@lists.ozlabs.org>; Tue, 14 Mar 2023 10:51:28 +1100 (AEDT)
Received: by mail-vs1-xe2d.google.com with SMTP id y3so2618421vsl.11
        for <openbmc@lists.ozlabs.org>; Mon, 13 Mar 2023 16:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678751484;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Dc1HZgqJwwGzXQzuxckkNytw98cqEpqV3qwIS/+fNyU=;
        b=YAQhIx0zsvPrpdmbFjh5xzsF7WD0jtHAbtjcH17j5UYvQVGlypdNp7tt1SnlUukeHl
         BBm3NnKlI+Tk7Vr57bZOWVrKJWLsaHyXbqp06Zsi+hJIvKfNCNHKEyaLT9p3NzKVfzrk
         vjhNrKXS10kx80dBVRjJDjpsjaavEOzObEYmqzl/QSAKnToSyHSIet7w89Rh1aP6FT2h
         P75zgUsuReBzB7dCFlqdPExEL4IWemorn6eFNtfo801AxZpX9z/xxy3nHgZZti4IJRFn
         VkREsppeywiiiCRfIZ/yLJ8is2j2wYDN12JD6wMSJqU/uIiksNQAXMDfQMb2lWcnsSBv
         D+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678751484;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dc1HZgqJwwGzXQzuxckkNytw98cqEpqV3qwIS/+fNyU=;
        b=B1acNre1a1pV3UDeHAL3qWuydvvymsNnTK6tJoxqjl85whFSygjgflCxil5zDsXN04
         cUkQNv6kV04XZw8aHiWeAMgou8gFNOzX0Jcjs3Q0a6GJTo/++vDQEkcCsKp4LIgF5tb+
         J5sFuz7tyjjtk/am5W6h5ccQ+PaP/pSwP101inHPNcHSCLx8JogGXi5JVB+4H2r2lSes
         wRp2vntzg3EWPSyj0Xw/fu9Sf5il0jYkqRPU/WwyWbyiHyj4q1vnGj94+gV9mdpltPyg
         nvU1frEpHsK97/rPWNDOw8STsvWDUXjmK88BbrGpdNHhpURUzailtV95PDSxcF1C61LN
         PFhw==
X-Gm-Message-State: AO0yUKU65I/rGRjixFPIxJtCYFguTt4ixGyfajQ16TU5YUllPasN6sbH
	9zEr+7H2IwW0cMUTtkhW7vfVLr1X75Ro27g2vOxmOPOwTlw=
X-Google-Smtp-Source: AK7set9+bjG7B4VXBwVb5hNZ4MSN40Y6FYcHf2MnKoAXN8/O+N8dpDdFo5nLFpr2NHJFk6IbUfUVCMoWZ1xKWW7DCQo=
X-Received: by 2002:a05:6102:444:b0:423:e0d2:8d5c with SMTP id
 e4-20020a056102044400b00423e0d28d5cmr5417801vsq.3.1678751483879; Mon, 13 Mar
 2023 16:51:23 -0700 (PDT)
MIME-Version: 1.0
From: David Bashaw <theactualdbashaw@gmail.com>
Date: Mon, 13 Mar 2023 16:51:13 -0700
Message-ID: <CAB7+d-nOMCGdD7upJviTVrWuZ=mW0gyV9G0E4wke8rQstg2zzw@mail.gmail.com>
Subject: Running evb-ast2600 image using qemu
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000dce56305f6d0c96b"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000dce56305f6d0c96b
Content-Type: text/plain; charset="UTF-8"

I'm new to openbmc but have read lots fo docs.
I want to try running an evb-ast2600 image using qemu.
I ran the following steps:
.setup evb-ast2600
bitbake obmc-phosphor-image

The build completes fine.
I installed qemu-system-arm also.

What command line should I use to invoke qemu?

--000000000000dce56305f6d0c96b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m new to openbmc but have read lots fo docs.<div>I w=
ant to try running an evb-ast2600 image using qemu.</div><div>I ran the fol=
lowing steps:</div><div>.setup evb-ast2600</div><div>bitbake obmc-phosphor-=
image</div><div><br></div><div>The build completes fine.</div><div>I instal=
led qemu-system-arm also.</div><div><br></div><div>What command line should=
 I use to invoke qemu?</div><div><br></div></div>

--000000000000dce56305f6d0c96b--
