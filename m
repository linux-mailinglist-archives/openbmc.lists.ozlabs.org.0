Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F85B420D
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2019 22:42:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XJ8c2X0rzF3ZF
	for <lists+openbmc@lfdr.de>; Tue, 17 Sep 2019 06:42:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=benjaminfair@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Eki5t2Ot"; 
 dkim-atps=neutral
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XJ820JFXzF3Xm
 for <openbmc@lists.ozlabs.org>; Tue, 17 Sep 2019 06:42:09 +1000 (AEST)
Received: by mail-io1-xd2d.google.com with SMTP id r26so2230007ioh.8
 for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2019 13:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c9o3QFumK1cOnaPTv5sZb9mCiw0Fzt4p/NNaZYPVDVo=;
 b=Eki5t2OtzupLLWesdi+nsbqPA962tBZCjXSam1dfvC6h88GuPIerVrfLZZffky12Iw
 zYuc1ubRxj13X4ZAJZulHEgmd4gpCOPhMU+8HkY9dE0tLh9KiNKqoq/8yzhkOb86BiLW
 yJ0B6XxleRU85mRG4/bwPZc1sdrkcTIw2kZdNy4jis4Ne0yR2XUVdg5umP5pCBmNkD1u
 0jsQZ5BRKXQ+3/Ilbsz3psdJkwfvoH0MKHn4BZafoALTNHEWLZy5CkRZmAI4tjJOjQXj
 rH+lk6H1HUSyZ55Jvb4vAPZedXTzkyR24Z00bkjcOtFq7JacWPiCuKoQOzx/ImVDLXGg
 v4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c9o3QFumK1cOnaPTv5sZb9mCiw0Fzt4p/NNaZYPVDVo=;
 b=gkf1NCagtVdfqRPM3MeTgI4pSZSpI1FoBY/pgGPk02jLifWOPrKiFoP5xjywJQKIfv
 llhyP/AY6r7n3MzMmTAETzCi6l2Au210CGzcetL/SwrxsAzcHoLRfDeaiAcYPDLDOGhx
 /EnVRv6bsBbNhHh+gimMjEbaCkOlUy6YzulcYwg47B7rv3S0bSvd/pV6ipWs0hT2TcOQ
 7IpJosKcWOvFqpARBZ/7TPZzVGYFzNJmxyDBlaYYNa2kY35Dq3oS1Q9tXUegxKFbDK3c
 vAMUlAkfHmC4ixqLPoFgSgXy+9QcqXI7gcm1jbCggTDEu0VF9fLESnGE4Y9Gi5q5MfL2
 fhNg==
X-Gm-Message-State: APjAAAW7LlX0He5K0ieH/o0VP7976b2ZaNf7NJCy4zdi+BR/rgjG7lix
 hYryjGw+2oNQ1fw90VTSFaHo4/gzQFiVmXkLtHEJ/w==
X-Google-Smtp-Source: APXvYqwXGiigCkMnKRpLm9lFEI1WbhQOwwts8o7eNw1cGjJyFHq4kJ+1sj7sxjNBn/O1ubnwiTOUqyqflSHHgvVZ5l0=
X-Received: by 2002:a5d:8851:: with SMTP id t17mr223411ios.250.1568666526820; 
 Mon, 16 Sep 2019 13:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <A9A91E7E-5709-42BD-AF7E-28831309A05D@fb.com>
In-Reply-To: <A9A91E7E-5709-42BD-AF7E-28831309A05D@fb.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Mon, 16 Sep 2019 13:41:30 -0700
Message-ID: <CADKL2t5--VuwSzEMM5ktAA5=NdJHh2pUdkkBqvUnxbJtt2MCXA@mail.gmail.com>
Subject: Re: SSD/NVMe Temperature Sensors
To: Wilfred Smith <wilfredsmith@fb.com>
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

On Mon, Sep 16, 2019 at 1:32 PM Wilfred Smith <wilfredsmith@fb.com> wrote:
>
> Has anyone done work on gathering temperature information from these devices? Links appreciated.
>
> Thanks in advance,
>
> Wilfred

There's an NVMe monitoring daemon called phosphor-nvme which gathers
this information over NVMe-MI over SMBus.

The code for it hasn't been merged yet. It's currently under review[1]
but will likely be merged soon.

I believe dbus-sensors is also planning to support gathering this
information over MCTP.

[1] https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-nvme/+/22744/7
