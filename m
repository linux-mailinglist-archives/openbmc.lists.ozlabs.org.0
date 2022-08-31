Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CC15A87AF
	for <lists+openbmc@lfdr.de>; Wed, 31 Aug 2022 22:46:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHx656Pwtz3bmW
	for <lists+openbmc@lfdr.de>; Thu,  1 Sep 2022 06:46:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=privafy.com header.i=@privafy.com header.a=rsa-sha256 header.s=google header.b=hz1Nuo5x;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=privafy.com (client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com; envelope-from=anthony.jenkins@privafy.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=privafy.com header.i=@privafy.com header.a=rsa-sha256 header.s=google header.b=hz1Nuo5x;
	dkim-atps=neutral
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHx5h0ydjz2xHv
	for <openbmc@lists.ozlabs.org>; Thu,  1 Sep 2022 06:45:41 +1000 (AEST)
Received: by mail-ot1-x32a.google.com with SMTP id y25-20020a056830109900b0063b3c1fe018so3749718oto.2
        for <openbmc@lists.ozlabs.org>; Wed, 31 Aug 2022 13:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=privafy.com; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=97awj2V5SWpb4kfQEoLLMwAzF/ZQpTBYWRSkFes67dc=;
        b=hz1Nuo5xIhXxcfekT242IRaGHpoDiqtZbfLfMD46pJwUWPcxIvmT0Bxabq8e7x/t6J
         8MJZ83rxGxHCFMC3HyLK+uuUOUoqQHNt932PF6y71NzJsWgKJje1+hLeilOocsoCSH64
         KeFhcBQVKHeroWfh8M8VEeq4vgqxSyY46aTAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=97awj2V5SWpb4kfQEoLLMwAzF/ZQpTBYWRSkFes67dc=;
        b=ynNYeJB1V3IF6b4wRyPHpH4OUehFnVbBUD2aXAC7BUo/s+qDsxlz6SX4mibi7fhngU
         uQ8hnAqCQyHny37SGzETNTwhNeBK8i8A2jGZqCe3DURBigLK5cP/8G+HPkOMZf1/v1YG
         bsCZa+CCsgHuhNbxEYZyp//qdkYhYwuC9bMe32M5ZiEaGIl08FmYnpCk0htj5rEVt6PM
         X7whrmcJnAvroIQDh8zZniHCENtA7/op/zjMb/85t0Ec46mNWNuj3DZMMdNQSz3BNEC9
         ZyS0TaACDyFhVUu/huQ5MpW2ehIzTdwdyNGgVlxCEEoxJipCXXlOmpoDS9uxezqi9Xrk
         9ufw==
X-Gm-Message-State: ACgBeo36kn34cRnK5HnO+a1v/QmvcS55bzTR7yVxtuZM3VopAt7YqowP
	F9Xm0FkVujJIw24T4hAAnfb62Q==
X-Google-Smtp-Source: AA6agR4BQniAOHocUumc4Q0Oi99xzA2vv37dhZ/cVlG1kepPg3+8o8m9wEoAwPVVdegBUQdhcY5ffg==
X-Received: by 2002:a9d:7583:0:b0:639:1b2a:17d4 with SMTP id s3-20020a9d7583000000b006391b2a17d4mr11135315otk.164.1661978736892;
        Wed, 31 Aug 2022 13:45:36 -0700 (PDT)
Received: from [192.168.1.152] ([76.205.202.86])
        by smtp.gmail.com with ESMTPSA id b5-20020a056870d1c500b0011f1920321bsm4785697oac.47.2022.08.31.13.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 13:45:36 -0700 (PDT)
Message-ID: <d646d7a3-2bb3-21ac-8492-b00619dc8e10@privafy.com>
Date: Wed, 31 Aug 2022 16:45:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Fwd: [ANNOUNCE] QEMU 7.1.0 is now available
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <166190001339.271991.6991052484622099743@amd.com>
 <CACPK8XfYKRYO3fdqjN7H-C-KZwoQFDGOcnL=OZgvjGQVXgisCg@mail.gmail.com>
From: Anthony Jenkins <anthony.jenkins@privafy.com>
Organization: Privafy, Inc.
In-Reply-To: <CACPK8XfYKRYO3fdqjN7H-C-KZwoQFDGOcnL=OZgvjGQVXgisCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Thanks for the announcement!

Do you happen to know if there is any Arm TrustZone/TEE emulation in the 
new release?  I believe the Aspeed  AST2600 supports Arm TrustZone.

Thanks,
Anthony Jenkins
Privafy, Inc.

On 8/30/22 21:21, Joel Stanley wrote:
> The new qemu release includes some good stuff from many openbmc
> contriubtors, in particular for the AST2600 family of SoCs.
>
> Thanks to everyone who has worked on that, in particular to Cedric for
> his careful review and maintainer work.
>
> ---------- Forwarded message ---------
> From: Michael Roth <michael.roth@amd.com>
> Date: Tue, 30 Aug 2022 at 23:01
> Subject: [ANNOUNCE] QEMU 7.1.0 is now available
> To: <qemu-devel@nongnu.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
>
>
> Hello,
>
> On behalf of the QEMU Team, I'd like to announce the availability of
> the QEMU 7.1.0 release. This release contains 2800+ commits from 238
> authors.
>
> You can grab the tarball from our download page here:
>
>    https://www.qemu.org/download/#source
>
> The full list of changes are available at:
>
>    https://wiki.qemu.org/ChangeLog/7.1
>
> Highlights include:
>
>   * Live migration: support for zero-copy-send on Linux
>   * QMP: new options for exporting NBD images with dirty bitmaps via
>     'block-export-add' command
>   * QMP: new 'query-stats' and 'query-stats-schema' commands for
>     retrieving statistics from various QEMU subsystems
>   * QEMU guest agent: improved Solaris support, new commands
>     'guest-get-diskstats'/'guest-get-cpustats', 'guest-get-disks' now
>     reports NVMe SMART information, and 'guest-get-fsinfo' now reports
>     NVMe bus-type
>
>   * ARM: emulation support for new machine types: Aspeed AST1030 SoC,
>     Qaulcomm, and fby35 (AST2600 / AST1030)
>   * ARM: emulation support for Cortex-A76 and Neoverse-N1 CPUs
>   * ARM: emulation support for Scalable Matrix Extensions, cache
>     speculation control, RAS, and many other CPU extensions
>   * ARM: 'virt' board now supports emulation of GICv4.0
>   * HPPA: new SeaBIOS v6 firmware with support for PS/2 keyboard in
>     boot menu when running with GTK UI, improved serial port emulation,
>     and additional STI text fonts
>   * LoongArch: initial support for LoongArch64 architecture, Loongson
>     3A5000 multiprocessor SoC, and the Loongson 7A1000 host bridge
>   * MIPS: Nios2 board (-machine 10m50-ghrd) now support Vectored
>     Interrupt Controller, shadow register sets, and improved exception
>     handling
>   * OpenRISC: 'or1k-sim' machine now support 4 16550A UART serial devices
>     instead of 1
>   * RISC-V: new ISA extensions with support for privileged spec version
>     1.12.0, software access to MIP SEIP, Sdtrig extension, vector
>     extension improvements, native debug, PMU improvements, and many
>     other features and miscellaneous fixes/improvements
>   * RISC-V: 'virt' board now supports TPM
>   * RISC-V: 'OpenTitan' board now supports Ibex SPI
>   * s390x: emulation support for s390x Vector-Enhancements Facility 2
>   * s390x: s390-ccw BIOS now supports booting from drives with non-512
>     sector sizes
>   * x86: virtualization support for architectural LBRs
>   * Xtensa: support for lx106 core and cache testing opcodes
>
>   * and lots more...
>
> Thank you to everyone involved!

